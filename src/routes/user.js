const express = require('express')
const router = express.Router()
const cors = require('cors')
const jwt = require('jsonwebtoken')
const bcrypt = require('bcrypt');
const {getRoleAndId} = require('../cookie-helper')
const user = require('../db/user')
const nodemailer = require('nodemailer')
const cookieParser = require('cookie-parser')
const bodyParser = require('body-parser')


router.post('/login', bodyParser(), async (req, res) => {
  const email = req.body.email
  const password = req.body.password
  if (email && password) {
    try {
      const result = await user.getUserByEmail(email)
      if (results[0].length === 0) {
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
            res.json({"userid": results[0][0].user_id, "role": results[0][0].role})
            res.end()
          } else {
            res.status(403).json({"msg": "invalid username or password"}).end()
          }
        })
      }
    } catch (error) {
      console.log(error);
      res.status(500).json(error).end()
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

router.post('/sendLink', cors(), async (req, res) =>  {
  if (typeof(req.cookies.token !== 'undefined')) {
    let role = ""
    const authData = getRoleAndId(req.cookies.token)
    if (authData.role ==='teacher' || authData.role === 'student') {
      const recipientEmail = req.body.email
      if (!req.body.role) {
        role = "student"
      } else {
        role = req.body.role
      }
      try {
        const results = await user.getUserByEmail(recipientEmail)
        if (!results[0]) {
          const token = jwt.sign({recipientEmail, role}, process.env.JWT_KEY, { expiresIn: '7d' })
          //const host = req.get('Host')
          const host = req.hostname
          //const api = '/api/user/validateLink/'
          const api = '/register/'
          const completeURL = host + api + token
          try {
            teacher = await user.getUserById(authData.userId)
            if (teacher[0]) {
              try {
                sendEmail(teacher[0].email, recipientEmail, completeURL)
                res.status(200).json({"link" : completeURL,
                "email": recipientEmail}).end()
              } catch (error) {
                console.log(error);
                res.status(500).json(error).end()
              }
            }
          } catch (error) {
            res.status(500).json(error).end()
          }
        } else {
          res.status(401).json({"message": "user already exists"}).end()
        }
      } catch (error) {
        res.status(500).json(error).end()
      }
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


router.get('/validateLink/:code', cors(), async (req, res) => {
  const code = req.params.code
  let validationData = {};
  jwt.verify(code, process.env.JWT_KEY, (err, authData) => {
    if(err) {
      res.status(401).json({"message":"invalid validation key"}).end()
    } else {
      validationData = authData;
    }
  })
  email = validationData.recipientEmail
  role = validationData.role
  result = await user.getUserByEmail(email)
  if (result[0]) {
    res.status(403)
    res.json({"msg":"email already exists"}).end()
  } else {
    res.status(200).json({email, role}).end()
  }

})

router.post('/register/', cors(), async (req, res) => {
  if (req.body.email && req.body.password && req.body.firstName
      && req.body.lastName && req.body.role) {


    const email = req.body.email
    const plainPassword = req.body.password
    const first_name = req.body.firstName
    const last_name = req.body.lastName
    const role = req.body.role
    const saltRounds = 10
    const hashedPassword = await bcrypt.hash(plainPassword, saltRounds)
    try {

      const existingUser = await user.getUserByEmail(email)
      if (!existingUser[0]) {
        result = await user.add(email, hashedPassword, role, first_name, last_name)
        res.status(200).json(result[0].insertId).end()
      } else {
        res.status(403).json({"message": "user already exists"}).end()
      }
    } catch (e) {
      res.status(500).json(e).end()
    }
  } else {
    res.status(400).json({"message": "missing data"})
  }
})

module.exports = router
