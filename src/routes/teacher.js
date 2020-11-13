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

  if (req.cookies.token) {

    const authData = getRoleAndId(req.cookies.token)

    if (authData.role ==='teacher') {
      const inserts = [authData.userId]
      const sql = "select user_id, email, first_name, last_name\
      from user, teacher_student_module \
      where user.user_id = teacher_student_module.student_id \
      and teacher_student_module.teacher_id = ? "
      config.sql_pool().getConnection((err, connection) => {
        connection.query(sql, inserts, (err, results, fields) => {
          connection.release()
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

/**
* teacher adds a  task linked to his uid & posted criteria
*/
router.post('/addTheory', cors(), (req, res) => {
  if (typeof(req.cookies.token !== 'undefined')) {
    const authData = getRoleAndId(req.cookies.token)
    if (authData.role ==='teacher') {
      if (req.body.criteria_id !== null && req.body.text !==null) {

        const inserts = [req.body.criteria_id, req.body.text, authData.userId]
        const sql = "insert into theory (criteria_id, text, teacher_id ) \
        values (?, ?, ?)"
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
  } else {
    // not logged in
    res.status(403).end()
  }
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
  } else {
    // not logged in
    res.status(403).end()
  }
})

/**
* is this needed?
*/

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
  } else {
    // not logged in
    res.status(403).end()

  }
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
                res.status(200).json({id: results.insertId}).end()
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
      const sql = "SELECT theory_assignment.theory_assignment_id,\
       theory_assignment.submission AS theory_submission, \
       theory_assignment.submission_time as theory_submission_time, \
       theory.text as theory_text, problem_assignment.problem_assignment_id,\
       problem_assignment.submission AS problem_submission, \
       problem_assignment.submission_date as problem_submission_time, \
       problem.text as problem_text \
       FROM theory_assignment, theory, problem_assignment, problem \
       WHERE theory_assignment.theory_id = ? \
       AND theory.criteria_id = ? \
       AND theory.teacher_id = ? \
       AND theory_assignment.student_id = ? \
       AND problem_assignment.student_id = ? \
       AND problem_assignment.problem_id = ? \
       AND problem.criteria_Id = ? \
       AND problem.teacher_id = ?"
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
       

      // not a teacher
      res.status(403).end()
    }
  } else {
    // not logged in
    res.status(403).end()
  }
})

/*SELECT problem_assignment.problem_assignment_id as problem_assignment_id, problem_assignment.problem_id as problem_id, problem_assignment.assign_date as problem_assign_date, problem.text as problem_text, theory_assignment.theory_assignment_id as theory_assignment_id, theory_assignment.theory_id as theory_id, theory_assignment.assign_date as theory_assign_date, theory.text as theory_text from problem_assignment, problem, theory_assignment, theory where problem.criteria_Id = 1 and problem_assignment.teacher_id = 3 and problem_assignment.student_id = 2 and problem_assignment.problem_id = problem.problem_id and theory_assignment.teacher_id = 3 and theory_assignment.student_id = 2 and theory_assignment.theory_id = theory.theory_id and theory.criteria_Id = 1*/
module.exports = router
