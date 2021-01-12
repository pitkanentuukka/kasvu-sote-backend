const dotenv = require('dotenv')
const express = require('express')
const router = express.Router()
const cors = require('cors')
//const mysql = require('mysql2/promise');
//const bcrypt = require('bcrypt');
const bodyParser = require('body-parser')
const {getRoleAndId} = require('../cookie-helper')
//const jwt = require('jsonwebtoken')
//const cookieParser = require('cookie-parser')
const user = require('../db/user.js')
const teacher = require('../db/teacher.js')
const { checkRole } = require('../auth.js')
const { uploadFile } = require('../uploadFile.js')
const { json } = require('body-parser')


/**
* get all students of a currently logged in teacher
*/
router.get("/students", cors(), checkRole('teacher'), async (req, res) => {
  try {
    students = await user.getStudentsForTeacher(req.authData.userId)
    res.status(200).json(students).end()
  } catch (e) {
    res.status(500).json(e).end()
  }
})

/**
* teacher adds a Theory task linked to his uid & posted criteria
*/
router.post('/addTheory', cors(), checkRole('teacher'), uploadFile, async (req, res) => {
  if (req.body.criteria_id !== null) {
    if (req.filePath || req.body.text){
      try {
        const result = await teacher.addTheory(req.body.criteria_id, req.filePath, req.body.text, req.authData.userId)
        res.status(200).json({"id": result.insertId, "text": req.body.text, "file": req.filePath}).end()

      }
      catch (error) {
        res.status(500).json(error).end
      }
    } else {
      res.status(400).json({"msg":"missing task"}).end()
    }
  } else {
    // bad request, missing parameters
    res.status(400).json({"msg":"missing criteria"}).end()
  }
})

/**
* teacher adds a problem task linked to his uid & posted criteria
*/

router.post('/addProblem', cors(), checkRole('teacher'), uploadFile, async (req, res) => {
  console.log(req.body);
  if (req.body.criteria_id) {
    if (req.filePath || req.body.text){
      try {
        const result = await teacher.addProblem(req.body.criteria_id, req.filePath, req.body.text, req.authData.userId)
        res.status(200).json({"id": result.insertId, "text": req.body.text, "file": req.filePath}).end()

      }
      catch (error) {
        res.status(500).json(error).end
      }
    } else {
      res.status(400).json({"msg":"missing task"}).end()
    }
  } else {
    // bad request, missing parameters
    res.status(400).json({"msg":"missing criteria"}).end()
  }
})


router.get('/getProblemAssignmentsForEvaluation/:id', cors(), checkRole('teacher'), (req, res) => {
  if (!req.params.id) {
    // gotta catch them all
    const inserts = [req.authData.userId]
    const sql ="SELECT problem_assignment.problem_assignment_id,\
    problem_assignment.problem_id, problem_assignment.student_id,\
    problem_assignment.assign_date, problem_assignment.submission,\
    problem_assignment.submission_time, problem.text, problem.criteria_id,\
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
    const inserts = [req.authData.userId, req.parans.id]
    const sql ="SELECT problem_assignment.problem_assignment_id,\
    problem_assignment.problem_id, problem_assignment.student_id,\
    problem_assignment.assign_date, problem_assignment.submission,\
    problem_assignment.submission_date, problem.text, problem.criteria_id,\
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
})

/**
* this takes a query string
* ?criteria=criteria_id&student=student_id
* if they're missing it'll respond with 400 (bad request)
*/

router.get("/getTheoryAssignmentsForStudentAndCriteria/", cors(), checkRole('teacher'), async (req, res) => {
  if (req.query.criteria && req.query.student){
    try {
      results = await teacher.getTheoryAssignmentsForStudentAndCriteria(
        req.query.criteria, req.query.student, req.authData.userId)
        res.status(200).json(results).end();
      } catch (e) {
        res.status(500).json(e).end()
      }
    } else {
      // missing parameters
      res.status(400).end()
    }
})

router.get("/getProblemAssignmentsForStudentAndCriteria/", cors(), checkRole('teacher'), async (req, res) => {
  if (req.query.criteria && req.query.student){
    try {
      results = await teacher.getProblemAssignmentsForStudentAndCriteria(
        req.query.criteria, req.query.student, req.authData.userId)
        res.status(200).json(results).end();
    } catch (e) {
      res.status(500).json(e).end()
    }
  } else {
    // missing parameters
    res.status(400).end()
  }
})

router.get("/deleteTheory/:id", cors(), checkRole('teacher'), async (req, res) => {
  try {
    result = await teacher.deleteTheory(req.params.id, req.authData.userId)
    res.status(200).json(result.affectedRows).end()
  } catch (e) {
    res.status(500).json(e).end()
  }

})

router.get("/deleteProblem/:id", cors(), checkRole('teacher'), async (req, res) => {
  try {

    result = await teacher.deleteProblem(req.params.id, req.authData.userId)
    res.status(200).json(result.affectedRows).end()
  } catch (e) {
    res.status(500).json(e).end()
  }
})

/*
  Get all theory tasks by criteria_id that teacher has added
*/
router.get('/getAllTheoryTasks/:id', cors(), checkRole('teacher'), async (req, res) => {
  try {
    results = await teacher.getAllTheoryTasks(req.authData.userId, req.params.id)
    res.status(200).json(results).end()

  } catch (error) {
    res.status(500).json(error).end()
  }
})

/*
  Get all problem tasks by criteria_id that teacher has added
*/
router.get('/getAllProblemTasks/:id', cors(), checkRole('teacher'), async (req, res) => {
  try {
    results = await teacher.getAllProblemTasks(req.authData.userId, req.params.id)
    res.status(200).json(results).end()

  } catch (error) {
    res.status(500).json(error).end()
  }
})

/*
  Add Evaluation for theory task by theory_assignment_id (as input in procedure call (req.params.id))
*/
router.post('/addEvaluationForTheory/:id', cors(), checkRole('teacher'), async (req, res) => {
  if (req.body.grade !== null && req.body.evaluation !==null) {
    try {
      result = await teacher.addEvaluationForTheory(req.body.grade, req.body.evaluation, req.params.id)
      res.status(200).json(result).end()
    } catch(error) {
      res.status(500).json(error).end()
    }
  } else {
    res.status(400).end()
  }
})

router.get('/getTheoryTasksPerCriteria/:id', cors(), checkRole('teacher'), async (req, res) => {
  if (req.params.id) {
    try {
      result = await teacher.getTheoryTasks(req.authData.userId, req.params.id)
      res.status(200).json(result).end()
    } catch(e) {
      res.status(500).json(e).end()
    }
  } else {
    res.status(400).end()
  }
})


router.get('/getProblemTasksPerCriteria/:id', cors(), checkRole('teacher'), async (req, res) => {
  if (req.params.id) {
    try {
      result = await teacher.getProblemTasks(req.authData.userId, req.params.id)
      res.status(200).json(result).end()
    } catch(e) {
      res.status(500).json(e).end()
    }
  } else {
    res.status(400).end()
  }
})

router.get('/getStudentsNotInModule/:id', cors(), checkRole('teacher'), async (req, res) => {
  if (req.params.id) {
    try {
      result = await teacher.getStudentsNotInModule(req.params.id)
      res.status(200).json(result).end()
    } catch (e) {
    res.status(500).json(e).end()
    }

  } else {
    res.status(400).end()
  }
})

router.get('/getStudentsForModule/:id', cors(), checkRole('teacher'), async (req, res) => {
  if (req.params.id) {
    try {
      results = await teacher.getStudentsForModule(req.params.id) /* parameter: module id */
    } catch(error) {
      res.status(500).json(error).end()
    }
  } else {
    res.status(400).end()
  }
})

router.post('/assignStudentAndTheoryForTeacher/:id', cors(), checkRole('teacher'), async (req, res) => {
  console.log("aloitus, params ", req.params.id)
  console.log("aloitus, student id ", req.body.student_id)
  if (req.params.id !== null && req.body.student_id !== null) {
      console.log("a, student_id ", req.body.student_id)
      try {
        console.log("try sisalla", req.body.student_id)
        results = await teacher.addStudentAndModule(req.authData.userId, req.params.id, req.body.student_id)
        res.status(200).json(results)
        results = await teacher.assignStudentAndTheoryForTeacher(req.authData.userId, req.params.id, req.body.student_id,)
        res.status(200).json(results).end()
      } catch (error) {
        res.status(500).json(error).end()
      }
  } else {
    res.status(400).end()
  }
})

module.exports = router
