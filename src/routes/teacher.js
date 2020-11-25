const dotenv = require('dotenv')
const express = require('express')
const router = express.Router()
const cors = require('cors')
const mysql = require('mysql2/promise');
const bcrypt = require('bcrypt');
const bodyParser = require('body-parser')
const {getRoleAndId} = require('../cookie-helper')
const jwt = require('jsonwebtoken')
const cookieParser = require('cookie-parser')
const user = require('../db/user.js')
const teacher = require('../db/teacher.js')

/**
* get all students of a currently logged in teacher
*/
router.get("/students", cors(), async (req, res) => {

  if (req.cookies.token) {

    const authData = getRoleAndId(req.cookies.token)

    if (authData.role ==='teacher') {
      try {
        students = await user.getStudentsForTeacher(authData.userId)
        res.status(200).json(students).end()

      } catch (e) {
        res.status(500).json(e).end()
      }

    } else {
      // not a teacher
      res.status(403).json({"msg": "not a teacher"}).end()
    }
  } else {
    // not logged in
    res.status(403).json({"msg": "not logged in"}).end()
  }

})

/**
* teacher adds a Theory task linked to his uid & posted criteria
*/
router.post('/addTheory', cors(), async (req, res) => {
  if (typeof(req.cookies.token !== 'undefined')) {
    const authData = getRoleAndId(req.cookies.token)
    if (authData.role ==='teacher') {
      if (req.body.criteria_id !== null && req.body.text !==null) {

        try {
          const result = await teacher.addTheory(req.body.criteria_id, req.body.text, authData.userId)
          res.status(200).json({"id": result.insertId, "text": req.body.text}).end()

        }
        catch (error) {
          res.status(500).json(error).end
        }

      } else {
        // bad request, missing parameters
        res.status(400).end()
      }

    } else {
      // not a teacher
      res.status(403).end()
    }
  } else {
    // not logged in
    res.status(403).end()
  }
})

/**
* teacher adds a problem task linked to his uid & posted criteria
*/

router.post('/addProblem', cors(), async (req, res) => {
  if (typeof(req.cookies.token !== 'undefined')) {
    const authData = getRoleAndId(req.cookies.token)
    if (authData.role ==='teacher') {
      if (req.body.criteria_id !== null && req.body.text !==null) {
        try {
          result = await teacher.addProblem(req.body.criteria_id, req.body.text, authData.userId)
          res.status(200).json({"id": result.insertId, "text": req.body.text}).end()
        } catch(error) {
          res.status(500).json(error).end()
        }
      } else {
        res.status(400).end()
      }

    } else {
      // not a teacher
      res.status(403).end()
    }
  } else {
    // not logged in
    res.status(403).end()
  }
})


router.get('/getTheoryAssignmentsForEvaluation/:id', cors(), (req, res) => {
  if (typeof(req.cookies.token !== 'undefined')) {
    const authData = getRoleAndId(req.cookies.token)
    if (authData.role ==='teacher') {
      if (!req.params.id) {
        // gotta catch them all
        const inserts = [authData.userId]
        const sql ="SELECT theory_assignment.theory_assignment_id,\
         theory_assignment.theory_id, theory_assignment.student_id,\
         theory_assignment.assign_date, theory_assignment.submission,\
         theory_assignment.submission_time, theory.text, theory.criteria_id,\
         theory.theory_id, criteria.criteria_id, criteria.text, user.email,\
         user.first_name, user.last_name \
         FROM theory_assignment, theory, criteria, user \
         WHERE user.user_id = theory_assignment.student_id \
         AND theory.theory_id = theory_assignment.theory_assignment_id \
         AND criteria.criteria_id = theory.criteria_id AND theory_assignment.grade IS NULL \
         AND theory_assignment.submission IS NOT NULL \
         AND theory_assignment.teacher_id = ?"
      } else {
        // there can be only one
        const inserts = [authData.userId, req.parans.id]
        const sql ="SELECT problem_assignment.problem_assignment_id,\
         problem_assignment.problem_id, problem_assignment.student_id,\
         problem_assignment.assign_date, problem_assignment.submission,\
         problem_assignment.submission_time, problem.text, problem.criteria_id,\
         problem.problem_id, criteria.criteria_id, criteria.text\
         FROM problem_assignment, problem, criteria, \
         WHERE user.user_id = problem_assignment.student_id \
         AND problem.problem_id = problem_assignment.problem_assignment_id \
         AND criteria.criteria_id = problem.criteria_id AND problem_assignment.grade IS NULL \
         AND problem_assignment.submission IS NOT NULL \
         AND problem_assignment.teacher_id = ? \
         AND problem_assignment.student_id = ?"
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

      }

    } else {
      // not a teacher
      res.status(403).end()
    }
  } else {
    // not logged in
    res.status(403).end()
  }
})

router.get('/getProblemAssignmentsForEvaluation/:id', cors(), (req, res) => {
  if (typeof(req.cookies.token !== 'undefined')) {
    const authData = getRoleAndId(req.cookies.token)
    if (authData.role ==='teacher') {
      if (!req.params.id) {
        // gotta catch them all
        const inserts = [authData.userId]
        const sql ="SELECT problem_assignment.problem_assignment_id,\
         problem_assignment.problem_id, problem_assignment.student_id,\
         problem_assignment.assign_date, problem_assignment.submission,\
         problem_assignment.submission_date, problem.text, problem.criteria_id,\
         problem.problem_id, criteria.criteria_id, criteria.text, user.email,\
         user.first_name, user.last_name \
         FROM problem_assignment, problem, criteria, user \
         WHERE user.user_id = problem_assignment.student_id \
         AND problem.problem_id = problem_assignment.problem_assignment_id \
         AND criteria.criteria_id = problem.criteria_id AND problem_assignment.grade IS NULL \
         AND problem_assignment.submission IS NOT NULL \
         AND problem_assignment.teacher_id = ?"
      } else {
        // there can be only one
        const inserts = [authData.userId, req.parans.id]
        const sql ="SELECT problem_assignment.problem_assignment_id,\
         problem_assignment.problem_id, problem_assignment.student_id,\
         problem_assignment.assign_date, problem_assignment.submission,\
         problem_assignment.submission_date, problem.text, problem.criteria_id,\
         problem.problem_id, criteria.criteria_id, criteria.text\
         FROM problem_assignment, problem, criteria, \
         WHERE user.user_id = problem_assignment.student_id \
         AND problem.problem_id = problem_assignment.problem_assignment_id \
         AND criteria.criteria_id = problem.criteria_id AND problem_assignment.grade IS NULL \
         AND problem_assignment.submission IS NOT NULL \
         AND problem_assignment.teacher_id = ? \
         AND problem_assignment.student_id = ?"
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

      }

    } else {
      // not a teacher
      res.status(403).end()
    }
  } else {
    // not logged in
    res.status(403).end()
  }
})


router.get("/getAssignmentsForStudentAndCriteria/", cors(), (req, res) => {
  if (typeof(req.cookies.token !== 'undefined')) {
    const authData = getRoleAndId(req.cookies.token)
    if (authData.role ==='teacher') {
      // there's a way to send named parameters to mysql, look into it
      const sql ="SELECT theory_assignment.theory_assignment_id, \
      theory_assignment.submission AS theory_submission, \
      theory_assignment.submission_time as theory_submission_time, \
      theory.text as theory_text, problem_assignment.problem_assignment_id, \
      problem_assignment.submission AS problem_submission, \
      problem_assignment.submission_date as problem_submission_time, \
      problem.text as problem_text\
      FROM `theory_assignment`, theory, problem_assignment, problem\
      WHERE theory.criteria_id = ?\
      and theory_assignment.student_id = ?\
      and theory.teacher_id = ?\
      and problem_assignment.student_id = ?\
      and problem_assignment.problem_id = problem.problem_id\
      and problem.teacher_id = ?\
      and problem.criteria_Id = ?"

       const criteria_id = req.query.criteria
       const student_id = req.query.student
       const inserts = [criteria_id, student_id, authData.userId,
         student_id, authData.userId, criteria_id]

       config.sql_pool().getConnection((err, connection) => {
         connection.query(sql, inserts, (err, results, fields) => {

           if (err) {
             console.log(err);
             res.status(500).end()
           } else if (results.length > 0) {

             res.status(200).json(results).end()
           } else {
             res.status(200).json({"msg": "no students found"}).end()
           }

         })
       })
      // not a teacher
      res.status(403).end()
    }
  } else {
    // not logged in
    res.status(403).end()
  }
})

router.get("/deleteTheory/", cors(), (req, res) => {
  if (typeof(req.cookies.token !== 'undefined')) {
    const authData = getRoleAndId(req.cookies.token)
    if (authData.role ==='teacher') {
      const sql = "delete from theory where theory.theory_id = ? \
      and theory.teacher_id = ?"
      const inserts = [req.query.theory, authData.userId]
      config.sql_pool().getConnection((err, connection) => {
        connection.query(sql, inserts, (err, results, fields) => {

          if (err) {
            res.status(500).end()
          } else {
            res.status(200).json({"deleted": results.affectedRows}).end()
          }
        })
      })
     // not a teacher
     res.status(403).end()
   }
 } else {
   // not logged in
   res.status(403).end()
 }
})

router.get("/deleteProblem/", cors(), (req, res) => {
  if (typeof(req.cookies.token !== 'undefined')) {
    const authData = getRoleAndId(req.cookies.token)
    if (authData.role ==='teacher') {
      const sql = "delete from problem where problem.problem_id = ? \
      and problem.teacher_id = ?"
      const inserts = [req.query.theory, authData.userId]
      config.sql_pool().getConnection((err, connection) => {
        connection.query(sql, inserts, (err, results, fields) => {

          if (err) {
            res.status(500).end()
          } else {
            res.status(200).json({"deleted": results.affectedRows}).end()
          }
        })
      })
     // not a teacher
     res.status(403).end()
   }
 } else {
   // not logged in
   res.status(403).end()
 }
})


module.exports = router
