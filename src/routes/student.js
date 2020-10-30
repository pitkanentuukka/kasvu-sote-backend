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


/**
* gets open theory assignments for logged in student
*/
router.get('/opentheory', cors(), (req, res) => {
  if (req.cookies.token) {

    const authData = getRoleAndId(req.cookies.token)
    console.log(authData);

    if (authData.role ==='student') {
      const inserts = [authData.userId]
      const sql = "SELECT * FROM theory_assignment, theory, criteria\
        WHERE student_id = ? \
        AND submission IS NULL \
        AND theory_assignment.theory_id = theory.theory_id \
        AND theory.criteria_id = criteria.criteria_id"

        console.log(sql);
        config.sql_pool().getConnection((err, connection) => {
          connection.query(sql, inserts, (err, results, fields) => {
            if (err) {
              res.status(500).end()
            }else if (results.length > 0) {

              res.status(200).json(results).end()
            } else {
              res.status(200).json({"msg": "no assingments found"}).end()
            }
          })
        })
    } else {
      // not a student
      res.status(403).end()
    }
  } else {
    // not logged in
    res.status(403).end()
  }
})


/**
* gets open problem assignments for logged in student
*/
router.get('/openproblem', cors(), (req, res) => {
  if (req.cookies.token) {

    const authData = getRoleAndId(req.cookies.token)
    console.log(authData);

    if (authData.role ==='student') {
      const inserts = [authData.userId]
      const sql = "SELECT * FROM problem_assignment, problem, criteria\
        WHERE student_id = ? \
        AND submission IS NULL \
        AND problem_assignment.problem_id = problem.problem_id \
        AND problem.criteria_id = criteria.criteria_id"

        config.sql_pool().getConnection((err, connection) => {
          connection.query(sql, inserts, (err, results, fields) => {
            if (err) {
              res.status(500).end()
            }else if (results.length > 0) {

              res.status(200).json(results).end()
            } else {
              res.status(200).json({"msg": "no assingments found"}).end()
            }
          })
        })
    } else {
      // not a student
      res.status(403).end()
    }
  } else {
    // not logged in
    res.status(403).end()
  }
})


module.exports = router
