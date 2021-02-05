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
const { checkRole } = require('../auth.js')


router.post('/login', bodyParser(), async (req, res) => {
  const email = req.body.email
  const password = req.body.password
  if (email && password) {
    try {
      const result = await user.getUserByEmail(email)
      if (result.length === 0) {
        res.status(403).json({"message": "invalid username or password"}).end()
      } else {
        bcrypt.compare(password, result[0].password, (bcerr, bcres)=> {
          if (bcres) {
            const userId = result[0].user_id;
            const role = result[0].role;
            const payload = { email, role, userId }
            const token = jwt.sign(payload, process.env.JWT_KEY, {
              expiresIn: '365d'}
            )
            res.status(200).cookie('token', token, {httpOnly : true})
            res.json({"userid": result[0].user_id, "role": result[0].role})
            res.end()
          } else {
            res.status(403).json({"msg": "invalid username or password"}).end()
          }
        })
      }
    } catch (error) {
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

router.post('/sendLink', cors(), checkRole(['teacher', 'student']), async (req, res) =>  {
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
      const host = req.hostname
      const route = '/register/'
      const completeURL = "http://" + host + route + token
      try {
        const teacher = await user.getUserById(req.authData.userId)
        if (teacher[0]) {
          try {
            sendEmail(teacher[0].email, recipientEmail, completeURL, "registration link")
            res.status(200).json({"link" : completeURL,
            "email": recipientEmail}).end()
          } catch (error) {
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

})


const sendEmail = async (from, to, completeURL, subject) => {

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
    subject,
    text: completeURL,
    html: `<a href="${completeURL}">${completeURL}</a>`
  })
}

const validateCode = async (req, res, next) => {
  const code = req.params.code
  jwt.verify(code, process.env.JWT_KEY, async (err, authData) => {
    if(err) {
      res.status(401).json({"message":"invalid validation key"}).end()
    } else {
      req.validationData = authData;
      next()
    }
  })
}

router.get('/validateLink/:code', cors(), validateCode, async (req, res) => {
  const email = req.validationData.recipientEmail
  const role = req.validationData.role
  const result = await user.getUserByEmail(req.validationData.recipientEmail)
  if (result[0]) {
    res.status(403)
    res.json({"msg":"email already exists"}).end()
  } else {
    res.status(200).json({email, role}).end()
  }

})

router.post('/register/:code', cors(), validateCode, async (req, res) => {
  const result = await user.getUserByEmail(req.validationData.recipientEmail)
  if (result[0]) {
    res.status(403)
    res.json({"msg":"email already exists"}).end()
  } else {

    if (req.body.email && req.body.password && req.body.firstName
        && req.body.lastName && req.body.role) {


      const email = req.validationData.recipientEmail
      const plainPassword = req.body.password
      const first_name = req.body.firstName
      const last_name = req.body.lastName
      const role = req.validationData.role
      const saltRounds = 10
      const hashedPassword = await bcrypt.hash(plainPassword, saltRounds)
      try {

        const existingUser = await user.getUserByEmail(email)
        if (!existingUser[0]) {
          const result = await user.add(email, hashedPassword, role, first_name, last_name)
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
  }
})

router.post('/resetPassword', cors(), async (req, res) => {
  if (req.body.email) {
    try {
      const existingUser = await user.getUserByEmail(req.body.email)
      if (existingUser[0]) {
        const userId = existingUser[0].user_id
        const recipientEmail = req.body.email
        const password = existingUser[0].password
        const payload =  {recipientEmail, userId, password}
        const token = jwt.sign(payload, process.env.JWT_KEY, {
          expiresIn: '7d'}
        )
        const host = req.hostname
        const route = '/resetPassword/'
        const completeURL = "http://" + host + route + token
        sendEmail(process.env.SYSTEM_EMAIL, req.body.email, completeURL, "password reset link")
        res.status(200).end()
      } else {
        res.status(403).json({"message": "user not found"})
      }
    } catch (e) {
      res.status(500).json(e).end()
    }
  } else {
    res.status(400).json({"message": "missing email"})
  }
})

router.get('/validatePasswordReset/:code', cors(), validateCode, async (req, res) => {
  try {
    const result = await user.getUserById(req.validationData.userId)
    if (result[0].password === req.validationData.password) {
      res.status(200).end()

    } else {
      res.status(401).end()
    }
  } catch (e) {
    res.status(500).json(e).end()
  }

})

router.post('/setNewPassword/:code', cors(), validateCode, async (req, res) => {
  const plainPassword = req.body.password
  const saltRounds = 10
  const hashedPassword = await bcrypt.hash(plainPassword, saltRounds)
  const userId = req.validationData.userId
  try {
    const result = await user.setPassword(userId, hashedPassword)
    res.status(200).json(result).end()
  } catch (e) {
    res.status(500).json(e).end()

  }

})




module.exports = router
