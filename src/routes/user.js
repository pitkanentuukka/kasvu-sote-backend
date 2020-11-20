const express = require('express')
const router = express.Router()
const cors = require('cors')
const jwt = require('jsonwebtoken')
const bcrypt = require('bcrypt');
const pool = require('../db/mysql.js').pool

//const { config } = require('../config')
const {getRoleAndId} = require('../cookie-helper')
const nodemailer = require('nodemailer')

const cookieParser = require('cookie-parser')
const bodyParser = require('body-parser')


router.post('/login', bodyParser(), async (req, res) => {
  
  const email = req.body.email
  const password = req.body.password
  if (email && password) {
    const sql = "select * from user where email = ?"
    const inserts = email;
    try {
      const results = await pool.query(sql, inserts)
      if (!results[0][0]) {
        res.status(403).json({"message": "invalid username or password"}).end()
      } else {
        bcrypt.compare(password, results[0][0].password, (bcerr, bcres)=> {
          if (bcres) {
            const userId = results[0][0].user_id;
            const role = results[0][0].role;
            const payload = { email, role, userId }
            const token = jwt.sign(payload, process.env.JWT_KEY, {
              expiresIn: '365d'}
            )
            res.status(200).cookie('token', token, {httpOnly : true})
            res.json({"userid": results[0].user_id, "role": results[0].role})
            res.end()
          } else {
            res.status(403).json({"msg": "invalid username or password"}).end()
          }
        })
      }
    } catch (e) {
      res.status(500).json(e).end()
    }
  } else {
    res.status(400).json({"msg": "missing email or password"}).end()
  }
})

router.get('/auth', cors(), (req, res) => {
  if (req.cookies.token) {
    const authData = getRoleAndId(req.cookies.token)
    res.status(200).json({"userid": authData.userId, "role": authData.role}).end()

  } else {
    res.status(403).end()
  }

})

router.get('/logout', cors(), (req, res) => {
  res.clearCookie('token')
  res.status(200).end()
})

router.post('/sendLink', cors(), (req, res) =>  {
  if (typeof(req.cookies.token !== 'undefined')) {
    const authData = getRoleAndId(req.cookies.token)
    if (authData.role ==='teacher') {
      const recipientEmail = req.body.email
      const token = jwt.sign({recipientEmail}, process.env.JWT_KEY, { expiresIn: '7d' })
      const host = req.get('Host')
      const api = '/api/user/validateLink/'
      const completeURL = host + api + token

      const sql = "select email from user where user.user_id = ?"
      const inserts = [authData.userId]
      config.sql_pool().getConnection((err, connection) => {
         connection.query(sql, inserts, (error, results, fields) =>{
          if (results.length > 0) {
            sendEmail(results[0], recipientEmail, completeURL).catch(console.error)
            res.status(200).json({"link" : completeURL}).end()
          }
        })
      })
    } else {
      res.status(403).end()
    }
  } else {
    res.status(403).end()
  }
})


const sendEmail = async (from, to, completeURL) => {

  const transport = nodemailer.createTransport({
    host: process.env.EMAIL_SERVER,
    port: process.env.EMAIL_PORT,
    auth: {
      user: process.env.EMAIL_USER,
      pass: process.env.EMAIL_PASSWORD
    }
  });

  const email = await transport.sendMail({
    from,
    to,
    subject: "registration link",
    text: completeURL,
    html: `<a href="${completeURL}">${completeURL}</a>`
  })
}



router.get('/validateLink/:code', cors(), (req, res) => {
    const code = req.params.code
    let validationData = {};
     jwt.verify(code, process.env.JWT_KEY, (err, authData) => {
      if(err) {
        res.send(401).json("invalid validation key").end()
      } else {
        validationData = authData;
      }
    })
    email = validationData.recipientEmail

    const sql = "select * from user where email = ?"
    const inserts = [email]
    config.sql_pool().getConnection((err, connection) => {
     connection.query(sql, inserts, (error, results, fields) =>{
      if (results.length > 0) {
        console.log(results);
        res.status(401).json({"msg":"email already exists"}).end()
      } else {
        res.status(200).json(email).end()
      }
    })
  })
})

module.exports = router
