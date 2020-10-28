onst express = require('express')
const router = express.Router()
const { config } = require('../config')
const { authUser } = require('../auth')
const cors = require('cors')
const mysql = require('mysql');
const bcrypt = require('bcrypt');

const jwt = require('jsonwebtoken')
const cookieParser = require('cookie-parser')
const dotenv = require('dotenv')


/**
* get all students of a currently logged in teacher
*/
router.get("/students", cors(), (req, res) => {
  if (typeof(req.cookies.token !== 'undefined')) {
    let authData = getRoleAndId(req.cookies.token)
    if (authData.role ==='teacher') {
      let inserts = [authData.userId]
      let sql = "select * from user, teacher_student \
      where user.user_id = teacher_student.student_id \
      and teacher_student.teacher_id = ? "
      config.sql_pool().getConnection((err, connection) => {
        connection.query(sql, inserts, (err, results, fields) => {
          if (results.length > 0) {
            res.status(200).json(results)
          }
        })
      })

    } else {
      // not a teacher
      res.status(403)
    }
  }
  // not logged in
  res.status(403)

})

/**
* teacher adds a theory task linked to his uid & posted criteria
*/
router.post('/addtheory', cors(), (req, res) => {
  if (typeof(req.cookies.token !== 'undefined')) {
    let authData = getRoleAndId(req.cookies.token)
    if (authData.role ==='teacher') {
      let inserts = [req.body.criteria_id, req.body.text, authData.userId]
      let sql = "insert into theory (criteria_id, text, teacher_id ) values (?, ?, ?)
      config.sql_pool().getConnection((err, connection) => {
        connection.query(sql, inserts, (err, results, fields) => {
          if (error) {
            res.status(500)
          } else {
            res.status(200).json({id: results.insertId, text: req.body.text})
          }
        })
      })
    } else {
      // not a teacher
      res.status(403)
    }
  }
  // not logged in
  res.status(403)
})

/**
* teacher adds a problem task linked to his uid & posted criteria
*/

router.post('/addproblem', cors(), (req, res) => {
  if (typeof(req.cookies.token !== 'undefined')) {
    let authData = getRoleAndId(req.cookies.token)
    if (authData.role ==='teacher') {
      let inserts = [req.body.criteria_id, req.body.text, authData.userId]
      let sql = "insert into problem (criteria_id, text, teacher_id ) values (?, ?, ?)
      config.sql_pool().getConnection((err, connection) => {
        connection.query(sql, inserts, (err, results, fields) => {
          if (error) {
            res.status(500)
          } else {
            res.status(200).json({id: results.insertId, text: req.body.text})
          }
        })
      })
    } else {
      // not a teacher
      res.status(403)
    }
  }
  // not logged in
  res.status(403)
})




function getRoleAndId(cookie) {
  let returnData = {};
   jwt.verify(cookie, process.env.JWT_KEY, (err, authData) => {
    if(err) {
      console.log("cookie error");
      //return;
    } else {

      returnData = authData;
    }
  })
  return returnData;
}


module.exports = router
