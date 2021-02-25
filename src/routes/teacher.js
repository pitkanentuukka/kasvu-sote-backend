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
const student = require('../db/student.js')
const instructor = require('../db/instructor.js')
const { checkRole } = require('../auth.js')
const { uploadFile } = require('../uploadFile.js')
const { json } = require('body-parser')


/**
* get all students of a currently logged in teacher
*/
router.get("/students", cors(), checkRole('teacher'), async (req, res) => {
  try {
    const students = await teacher.getStudentsForTeacher(req.authData.userId)
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
      const results = await teacher.getTheoryAssignmentsForStudentAndCriteria(
        req.query.criteria, req.query.student, req.authData.userId)
        if (results.length === 0) {
          res.status(204).end()
        } else if (results.length > 0) {
          res.status(200).json(results).end()
        }
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
      const results = await teacher.getProblemAssignmentsForStudentAndCriteria(
        req.query.criteria, req.query.student, req.authData.userId)
        if (results.length === 0) {
          res.status(204).end()
        } else if (results.length > 0) {
          res.status(200).json(results).end()
        }
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
    const result = await teacher.deleteTheory(req.params.id, req.authData.userId)
    res.status(200).json(result.affectedRows).end()
  } catch (e) {
    res.status(500).json(e).end()
  }

})


router.get('/restoreTheory/:id', cors(), checkRole('teacher'), async (req, res) => {
  if (req.params.id) {
    try {
      const result = await teacher.restoreTheory(req.params.id, req.authData.userId)
      res.status(200).end()

    } catch (e) {
      res.status(500).json(e).end()
    }
  } else {
    res.status(400).end()

  }
})


router.get("/deleteProblem/:id", cors(), checkRole('teacher'), async (req, res) => {
  try {

    const result = await teacher.deleteProblem(req.params.id, req.authData.userId)
    res.status(200).json(result.affectedRows).end()
  } catch (e) {
    res.status(500).json(e).end()
  }
})

router.get('/restoreProblem/:id', cors(), checkRole('teacher'), async (req, res) => {
  if (req.params.id) {
    try {
      const result = await teacher.restoreProblem(req.params.id, req.authData.userId)
      res.status(200).end()

    } catch (e) {
      res.status(500).json(e).end()
    }
  } else {
    res.status(400).end()

  }
})

/*
  Get all theory tasks by criteria_id that teacher has added
*/
router.get('/getAllTheoryTasks/:id', cors(), checkRole('teacher'), async (req, res) => {
  try {
    const results = await teacher.getAllTheoryTasks(req.authData.userId, req.params.id)
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
    const results = await teacher.getAllProblemTasks(req.authData.userId, req.params.id)
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
      const result = await teacher.addEvaluationForTheory(req.body.grade, req.body.evaluation, req.params.id)
      res.status(200).json(result).end()
    } catch(error) {
      res.status(500).json(error).end()
    }
  } else {
    res.status(400).end()
  }
})

router.post('/addEvaluationForProblem/:id', cors(), checkRole(['teacher', 'instructor']), async (req, res) => {
  if (req.body.grade !== null && req.body.evaluation !==null) {
    try {
      const problem_assigner = await teacher.getAssignerForProblem(req.params.id)
      if (problem_assigner[0].teacher_id === req.authData.userId) {
        const result = await teacher.addEvaluationForProblem(req.body.grade, req.body.evaluation, req.params.id)
        res.status(200).json(result).end()

      } else {
        res.status(403).end()
      }
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
      const result = await teacher.getTheoryTasks(req.authData.userId, req.params.id)
      res.status(200).json(result).end()
    } catch(e) {
      res.status(500).json(e).end()
    }
  } else {
    res.status(400).end()
  }
})


router.get('/getProblemTasksPerCriteria/:id', cors(), checkRole(['teacher', 'instructor']), async (req, res) => {
  if (req.params.id) {
    try {
      const result = await teacher.getProblemTasks(req.authData.userId, req.params.id)
      res.status(200).json(result).end()
    } catch(e) {
      res.status(500).json(e).end()
    }
  } else {
    res.status(400).end()
  }
})

router.get('/getStudentsNotInModule/:id', cors(), checkRole(['teacher', 'instructor']), async (req, res) => {
  if (req.params.id) {
    try {
      if (req.authData.role === 'teacher') {
        const result = await teacher.getStudentsNotInModule(req.params.id, 't')
        res.status(200).json(result).end()
      } else if (req.authData.role === 'instructor') {
        const result = await teacher.getStudentsNotInModule(req.params.id, 'e')
        res.status(200).json(result).end()
      }
    } catch (e) {
      res.status(500).json(e).end()
    }

  } else {
    res.status(400).end()
  }
})


router.get('/getStudentsInModule/:id', cors(), checkRole(['teacher', 'instructor']), async (req, res) => {
  if (req.params.id) {

    try {
      if (req.authData.role === 'teacher') {

      const result = await teacher.getStudentsInModule(req.params.id, req.authData.userId, 't')
      res.status(200).json(result).end()
      } else if (req.authData.role === 'instructor') {

        const result = await teacher.getStudentsInModule(req.params.id, req.authData.userId, 'p')
        res.status(200).json(result).end()
      }
    } catch (e) {
    res.status(500).json(e).end()
    }

  } else {
    res.status(400).end()
  }
})
router.post('/addStudentToModule', cors(), checkRole(['teacher', 'instructor']), async (req, res)=> {
  /* this one is temporary for the demo, will be removed later */

  if (req.body.student_id && req.body.module_id) {
    const student_id = req.body.student_id
    const module_id = req.body.module_id
    const teacher_id = req.authData.userId
    const role = req.authData.role

    try {
      if (role === 'teacher'){
        await teacher.addStudentToModule(teacher_id, student_id, module_id, 't')
        await teacher.assignModuleTheoryForStudent(teacher_id, student_id, module_id)

      } else if (role === 'instructor') {
        await teacher.addStudentToModule(teacher_id, student_id, module_id, 'p')
        await teacher.addStudentToModule(teacher_id, student_id, module_id, 'e')
        await teacher.assignModuleProblemForStudent(teacher_id, student_id, module_id)

      }
      res.status(200).end()

    } catch (e) {
      res.status(500).json(e).end()

    }
  }
})


router.post('/addStudentToModule_DO_NOT_USE_THIS', cors(), checkRole(['teacher', 'instructor']), async (req, res)=> {
  if (req.body.student_id && req.body.module_id) {
    const student_id = req.body.student_id
    const module_id = req.body.module_id
    const task_type = req.body.task_type

    const teacher_id = req.authData.userId
    try {
      const teacherForStudentAndModule = await teacher.getTeacherForStudentAndModule(student_id, module_id, task_type)
      // either the student has currently logged in teacher for the module or there is no teacher at all
      if (!teacherForStudentAndModule) {
        await teacher.addStudentToModule(teacher_id, student_id, module_id, task_type)
        if (task_type === 't' && req.authData.role === 'teacher')
        {
          await teacher.assignModuleTheoryForStudent(teacher_id, student_id, module_id)
        }
        else if (task_type === 'p')
        {
          await teacher.assignModuleProblemForStudent(teacher_id, student_id, module_id)
        }
        res.status(200).end()
      } else if (teacherForStudentAndModule === teacher_id) {
        if (task_type === 't' && req.authData.role === 'teacher') {
          const result = await teacher.assignModuleTheoryForStudent(teacher_id, student_id, module_id)
        } else if (task_type === 'p') {
          const result = await teacher.assignModuleProblemForStudent(teacher_id, student_id, module_id)
        } else if (task_type === 'e' && req.authData.role === 'instructor') {
          // this student already has a instructor for this module
          res.status(204).end()
        }
        res.status(200).end()
      } else if (teacherForStudentAndModule !== teacher_id && req.authData.role === 'instructor' && task_type === 'p') {
        const result = await teacher.assignModuleProblemForStudent(teacher_id, student_id, module_id)
      } else {
        // this student already has a teacher for this module
        res.status(204).end()
      }
    }
    catch (e) {
      res.status(500).json(e).end()
    }
  } else {
    res.status(400).end()
  }
})

router.post("/assignModuleProblemForStudent", cors(), checkRole(['teacher', 'instructor']), async (req, res) => {
  if (req.body.student_id && req.body.module_id) {
    try {
      const result = await teacher.assignModuleProblemForStudent(req.authData.userId, req.body.student_id, req.body.module_id)
      res.status(200).json(result).end()
    } catch (e) {
      res.status(500).json(e).end()
    }
  } else {
    res.status(400).end()
  }
})

router.get('/restoreTheory/:id', cors(), checkRole('teacher'), async (req, res) => {
  if (req.params.id) {
    try {
      const result = await teacher.restoreTheory(req.params.id)
      res.status(200).end()

    } catch (e) {
      res.status(500).json(e).end()
    }
  } else {
    res.status(400).end()

  }
})

router.get('/getAllEvaluations', cors(), checkRole(['teacher', 'instructor']), async (req, res) => {
  if (req.query.student && req.query.criteria) {
    try {
      const result = await teacher.getAllEvaluations(req.authData.userId, req.query.student, req.query.criteria)
      if (result.length === 0) {
        res.status(204).end()
      } else if (result.length > 0) {
        res.status(200).json(result).end()
      }
    } catch (e) {
      res.status(500).json(e).end()
    }
  } else {
    res.status(400).end()
  }
})

router.get('/getInstructor/:id', cors(), checkRole('teacher'), async (req, res) =>{
  if (req.params.id) {
    try {
      if (await user.doesStudentBelongToTeacher(req.params.id, req.authData.userId)) {
        const result = await student.getInstructor(req.params.id)
        if (result.length === 0) {
          res.status(204).end()
        } else if (result.length > 0) {
          res.status(200).json(result).end()
        }
      } else {
        res.status(403).end()
      }
    } catch (e) {
      res.status(500).json(e).end()
    }
  } else {
    res.status(400).end()
  }
})
router.get('/getGradeForStudentAndCriteria/', cors(), checkRole('teacher'), async (req, res) =>{
  if (req.query.criteria_id && req.query.student_id) {
    try {
      if (await user.doesStudentBelongToTeacher(req.query.student_id, req.authData.userId)) {
        const result = await student.getGradeForStudentAndCriteria(req.query.student_id, req.query.criteria_id)
        if (Number.isFinite(result)) {
          res.status(200).json(result).end()
        } else {
          // result is NaN when there are no grades
          res.status(204).end()
        }
      } else {
        res.status(403).end()
      }
    } catch (e) {
      res.status(500).json(e).end()
    }
  } else {
    res.status(400).end()
  }
})




module.exports = router
