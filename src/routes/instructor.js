const express = require('express')
const router = express.Router()
const { config } = require('../config')
const cors = require('cors')
const mysql = require('mysql');
const bcrypt = require('bcrypt');
const bodyParser = require('body-parser')
const {getRoleAndId} = require('../cookie-helper')
const jwt = require('jsonwebtoken')
const cookieParser = require('cookie-parser')
const dotenv = require('dotenv')
const { checkRole } = require('../auth.js')


/**
* get all students of a currently logged in instructor
*/
router.get("/students", cors(), (req, res) => {

  if (req.cookies.token) {

    const authData = getRoleAndId(req.cookies.token)

    if (authData.role ==='instructor') {
      const inserts = [authData.userId]
      const sql = "select user_id, email, first_name, last_name from user, teacher_student \
      where user.user_id = teacher_student.student_id \
      and teacher_student.teacher_id = ? "
      config.sql_pool().getConnection((err, connection) => {
        connection.query(sql, inserts, (err, results, fields) => {
          if (err) {
            res.status(500).end()
          }else if (results.length > 0) {

            res.status(200).json(results).end()
          } else {
            res.status(200).json({"msg": "no students found"}).end()
          }
        })
      })

    } else {
      // not a teacher
      res.status(403).json({"msg": "not a teacher"}).end()
    }
  } else {
    // not logged in
    res.status(403).json({"msg": "not logged in"}).end()
  }

})

router.post('/evaluateStudent', cors(), (req, res) => {
  if (req.cookies.token) {
    const authData = getRoleAndId(req.cookies.token)
    if (authData.role ==='instructor') {
      if (req.body.criteria_id && req.body.student_id && req.body.evaluation_text) {

        const datetime = new Date().toISOString().slice(0, 19).replace('T', ' ');
        const inserts = [req.bodý.criteria_id,
                req.body.student_id,
                authData.userId,
                req.body.evaluation_text,
                datetime]
        const sql = "INSERT INTO evaluation \
          (criteria_id, student_id, instructor_id, evaluation_text, evaluation_date) \
          values (?, ?, ?, ?)"

          config.sql_pool().getConnection((err, connection) => {
            connection.query(sql, inserts, (err, results, fields) => {

              if (err) {
                console.log(err);
                res.status(500).end()
              } else {
                console.log(results);
                res.status(200).json({id: results.insertId}).end()
              }
            })
          })
        } else {
          // missing parameters
          res.status(400).end()
        }
      } else {
        // not an instructor
        res.status(403).end()
      }
    } else {
      // not logged in
      res.status(403).end()
    }
})

module.exports = router
