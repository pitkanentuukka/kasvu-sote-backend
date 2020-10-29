const express = require('express')
const router = express.Router()
const { config } = require('../config')
const { authUser } = require('../auth')
const cors = require('cors')
const mysql = require('mysql');
const bcrypt = require('bcrypt');
const bodyParser = require('body-parser')
const {getRoleAndId} = require('../cookie-helper')
const jwt = require('jsonwebtoken')
const cookieParser = require('cookie-parser')
const dotenv = require('dotenv')


/**
* get all students of a currently logged in teacher
*/
router.get("/students", cors(), (req, res) => {
  if (typeof(req.cookies.token !== 'undefined')) {
    const authData = getRoleAndId(req.cookies.token)
    if (authData.role ==='teacher') {
      const inserts = [authData.userId]
      const sql = "select user_id, email, first_name, last_name from user, teacher_student \
      where user.user_id = teacher_student.student_id \
      and teacher_student.teacher_id = ? "
      config.sql_pool().getConnection((err, connection) => {
        connection.query(sql, inserts, (err, results, fields) => {
          if (err) {
            res.status(500).end()
          }
          if (results.length > 0) {
            res.status(200).json(results).end()
          } else {
            res.status(200).json({"msg": "no students found"}).end()
          }
        })
      })

    } else {
      // not a teacher
      res.status(403).end()
    }
  }
  // not logged in
  res.status(403).end()

})

/**
* teacher adds a theory task linked to his uid & posted criteria
*/
router.post('/addTheory', cors(), (req, res) => {
  if (typeof(req.cookies.token !== 'undefined')) {
    const authData = getRoleAndId(req.cookies.token)
    if (authData.role ==='teacher') {
      if (req.body.criteria_id !== null && req.body.text !==null) {

        const inserts = [req.body.criteria_id, req.body.text, authData.userId]
        const sql = "insert into theory (criteria_id, text, teacher_id ) values (?, ?, ?)"
        config.sql_pool().getConnection((err, connection) => {
          connection.query(sql, inserts, (err, results, fields) => {
            if (err) {
              res.status(500).end()
            } else {
              res.status(200).json({id: results.insertId, text: req.body.text})
            }
          })
        })
      } else {
        // bad request, missing parameters
        res.status(400).end()
      }

    } else {
      // not a teacher
      res.status(403).end()
    }
  }
  // not logged in
  res.status(403).end()
})

/**
* teacher adds a problem task linked to his uid & posted criteria
*/

router.post('/addProblem', cors(), (req, res) => {
  if (typeof(req.cookies.token !== 'undefined')) {
    const authData = getRoleAndId(req.cookies.token)
    if (authData.role ==='teacher') {
      if (req.body.criteria_id !== null && req.body.text !==null) {
        const inserts = [req.body.criteria_id, req.body.text, authData.userId]
        const sql = "INSERT INTO problem \
          (criteria_id, text, teacher_id ) \
          VALUES (?, ?, ?)"
        config.sql_pool().getConnection((err, connection) => {
          connection.query(sql, inserts, (err, results, fields) => {
            if (err) {
              res.status(500).end()
            } else {
              res.status(200).json({id: results.insertId, text: req.body.text})
            }
          })
        })
      } else {
        res.status(400).end()
      }

    } else {
      // not a teacher
      res.status(403).end()
    }
  }
  // not logged in
  // maybe this should redirect to login?
  res.status(403).end()
})

router.post('/assignTheoryToStudent', cors(), (req, res) => {
  if (typeof(req.cookies.token !== 'undefined')) {
    const authData = getRoleAndId(req.cookies.token)
    if (authData.role ==='teacher') {
      if (req.body.student_id  && req.body.theory_id) {
        const datetime = new Date().toISOString().slice(0, 19).replace('T', ' ');
        const inserts = [req.body.theory_id, req.body.student_id,
          authData.userId, datetime]
        const sql = "INSERT INTO theory_assignment \
          (theory_id, student_id, teacher_id, assign_date) \
          VALUES (?, ?, ?, ?)"
          config.sql_pool().getConnection((err, connection) => {
            connection.query(sql, inserts, (err, results, fields) => {
              if (err) {
                res.status(500).end()
              } else {
                res.status(200).json({id: results.insertId})
              }
            })
          })
      } else {
        // missing parameters
        res.status(400).end()
      }


    } else {
      // not a teacher
      res.status(403).end()
    }
  }
  // not logged in
  res.status(403).end()
})

router.post('/assignProblemToStudent', cors(), (req, res) => {
  if (typeof(req.cookies.token !== 'undefined')) {
    const authData = getRoleAndId(req.cookies.token)
    if (authData.role ==='teacher') {
      if (Boolean(req.body.student_id) && Boolean(req.body.problem_id)) {

        const datetime = new Date().toISOString().slice(0, 19).replace('T', ' ');
        const inserts = [req.body.problem_id, req.body.student_id,
          authData.userId, datetime]
        const sql = "INSERT INTO problem_assignment \
          (problem_id, student_id, teacher_id, assign_date) \
          VALUES (?, ?, ?, ?)"
          config.sql_pool().getConnection((err, connection) => {
            connection.query(sql, inserts, (err, results, fields) => {

              if (err) {
                console.log(err);
                res.status(500).end()
              } else {
                console.log(results);
                res.status(200).json({id: results.insertId})
              }
            })
          })
      } else {
        // missing parameters
        res.status(400).end()
      }
    } else {
      // not a teacher
      res.status(403).end()
    }
  }
  // not logged in
  res.status(403).end()
})


/*function getRoleAndId(cookie) {
  let returnData = {};
   jwt.verify(cookie, process.env.JWT_KEY, (err, authData) => {
    if(err) {
      return
    } else {

      returnData = authData;
    }
  })
  return returnData;
}*/


module.exports = router
