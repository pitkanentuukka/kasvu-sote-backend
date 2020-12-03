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
const student = require('../db/student.js')


/**
* gets open theory assignments for logged in student
*/
router.get('/opentheory', cors(), async (req, res) => {
  if (req.cookies.token) {

    const authData = getRoleAndId(req.cookies.token)
    console.log(authData);

    if (authData.role ==='student') {
      try {
        const results = await student.getOpenTheory([authData.userId])
        if (results[0].length === 0) {
          res.status(200).json({"message": "no theory found"}).end()
        }else if (results.length > 0) {
          res.status(200).json(results).end()
        } else {
          res.status(200).json({"message": "no theory found"}).end()
        }
      }
      catch (error) {
        res.status(500).json(error).end
      }
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
router.get('/openproblem', cors(), async (req, res) => {
  if (req.cookies.token) {

    const authData = getRoleAndId(req.cookies.token)
    console.log(authData);

    if (authData.role ==='student') {
      try {
        const results = await student.getOpenProblem([authData.userId]);
        if (results[0].length === 0) {
          res.status(200).json({"message": "no problem found"}).end()
        } else if (results.length > 0) {
          res.status(200).json(results).end()
        } else {
          res.status(200).json({"message": "no problem found"}).end()
        }
      }
      catch (error) {
        res.status(500).json(error).end
      }
    } else {
      // not a student
      res.status(403).end()
    }
  } else {
    // not logged in
    res.status(403).end()
  }
})

router.get('/getAssignmentsForCriteria/:id', cors(), async (req, res) => {
  if (req.cookies.token) {

    const authData = getRoleAndId(req.cookies.token)

    if (authData.role ==='student') {
      if (req.params.id) {
        //console.log("userId", authData.userId)
        //console.log("cri_id", req.params.id)
        try {
          const results = await student.getAssignmentsForCriteria(authData.userId, req.params.id);
          if (results[0].length === 0) {
            res.status(200).json({"message": "no assignment found"}).end()
          } else if (results.length > 0) {
            console.log("results.length", results.length)
            res.status(200).json(results).end()
          } else {
            res.status(200).json({"message": "no assingments found"}).end()
          }
        }
        catch (error) {
          //console.log("1. catch error")
          res.status(500).json(error).end
        }
        /*const inserts = [authData.userId, req.params.id,
                        authData.userId, req.params.id]
        *const sql = "select theory_assignment.theory_assignment_id,\
        theory_assignment.assign_date as theory_assign_date,\
        theory_assignment.submission as theory_submission,\
        theory_assignment.submission_time as theory_submission_time,\
        theory_assignment.self_grade as theory_self_grade,\
        theory_assignment.self_evaluation_text as theory_self_evaluation,\
        theory_assignment.self_evaluation_datetime as theory_self_evaluation_datetime,\
        theory_assignment.grade as theory_grade,\
        theory_assignment.evaluation as theory_evaluation,\
        theory_assignment.evaluation_datetime as theory_evaluation_datetime,\
        problem_assignment.problem_id,\
        problem_assignment.assign_date as problem_assign_date,\
        problem_assignment.submission as problem_submission,\
        problem_assignment.submission_date as problem_submission_time,\
        problem_assignment.grade as problem_grade,\
        problem_assignment.evaluation as problem_evaluation,\
        problem_assignment.evaluation_datetime,\
        problem_assignment.grader_id as problem_grader_id\
        from theory_assignment, problem_assignment, theory, problem\
        where problem_assignment.student_id = ?\
        and problem_assignment.problem_id = problem.problem_id\
        and problem.criteria_Id = ?\
        and theory_assignment.student_id = ?\
        and theory_assignment.theory_id = theory.theory_id\
        and theory.criteria_Id = ?"
        console.log("ennen sql yhteyden avausta")
        config.sql_pool().getConnection((err, connection) => {
          console.log("ennen sql kyselya")
          connection.query(sql, inserts, (err, results, fields) => {
            if (err) {
              res.status(500).end()
            }else if (results.length > 0) {
              res.status(200).json(results).end()
            } else {
              res.status(200).json({"msg": "no assingments found"}).end()
            }
          })
        })*/
      } else {
        // missing id param
        res.status(400).end()
      }
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
