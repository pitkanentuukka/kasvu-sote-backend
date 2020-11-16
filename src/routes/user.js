const express = require('express')
const router = express.Router()
const cors = require('cors')
const jwt = require('jsonwebtoken')
const bcrypt = require('bcrypt');
const { config } = require('../config')

const cookieParser = require('cookie-parser')
const bodyParser = require('body-parser')



router.post('/login', bodyParser(), (req, res) => {

  const email = req.body.email
  const password = req.body.password
  if (email && password) {


    let sql = "select * from user where email = ?"
    let inserts = email;

    config.sql_pool().getConnection((err, connection) => {

      connection.query(sql, inserts, (error, results, fields) =>{

        if (results.length === 0) {
          res.status(403).json({"message": "invalid username or password"}).end()
        } else {
          bcrypt.compare(password, results[0].password, (bcerr, bcres)=> {
            if (bcres) {
              const userId = results[0].user_id;
              const role = results[0].role;
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
        })
      })
    } else {
      res.status(400).json({"msg": "missing email or password"}).end()
    }


})
module.exports = router
