const express = require('express')
const router = express.Router()
const cors = require('cors')
const bodyParser = require('body-parser')
const { checkRole } = require('../auth.js')
const student = require('../db/student.js')
const user = require('../db/user.js')
const teacher = require('../db/teacher.js')
const instructor = require('../db/instructor.js')




router.post('/evaluateStudent', cors(), checkRole('instructor'), async (req, res) => {
  if (req.body.criteria_id && req.body.student_id && req.body.evaluation_text) {
    try {
      if (user.doesStudentBelongToTeacher(req.body.student_id, req.authData.userId)){
        const result = await instructor.addEvaluation(req.body.criteria_id, req.body.student_id, req.authData.userId,  req.body.evaluation_text)
        res.status(200).json(result).end()
      } else {
        res.status(403).end()
      }
    } catch (e) {
      res.status(500).json(e).end()
    }
  } else {
    res.status(400).json({"msg": "missing parameters"}).end()
  }
})


router.get('/getProblemsForStudent/', cors(), checkRole('instructor'), async (req, res) => {
  if (req.query.criteria && req.query.student){
    try {
      const results = await instructor.getProblemAssignmentsForStudentAndCriteria(
        req.query.student, req.query.criteria, req.authData.userId)
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


router.get("/students", cors(), checkRole('instructor'), async (req, res) => {
  try {
    const students = await instructor.getStudentsForInstructor(req.authData.userId)

    res.status(200).json(students).end()
  } catch (e) {
    res.status(500).json(e).end()
  }
})

router.get('/getNumberOfAssignmentsForCategory/', cors(), checkRole('instructor'), async (req, res) =>{
  if (req.query.category_id && req.query.student_id) {
    try {
      if (await user.doesStudentBelongToTeacher(req.query.student_id, req.authData.userId)) {
        const result = {}
        result.total = await teacher.getNumberOfAssignmentsForCategoryAndStudent(req.authData.userId, req.query.student_id, req.query.category_id)
        result.open = await teacher.getNumberOfOpenAssignmentsForCategoryAndStudent(req.authData.userId, req.query.student_id, req.query.category_id)
        result.ungraded = await teacher.getNumberOfUngradedAssignmentsForCategoryAndStudent(req.authData.userId, req.query.student_id, req.query.category_id)
        res.status(200).json(result).end()

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

router.get('/getNumberOfAssignmentsForCriteria/', cors(), checkRole('instructor'), async (req, res) =>{
  if (req.query.criteria_id && req.query.student_id) {
    try {
      if (await user.doesStudentBelongToTeacher(req.query.student_id, req.authData.userId)) {
        const result = {}
        result.total = await teacher.getNumberOfAssignmentsForCriteriaAndStudent(req.authData.userId, req.query.student_id, req.query.criteria_id)
        result.open = await teacher.getNumberOfOpenAssignmentsForCriteriaAndStudent(req.authData.userId, req.query.student_id, req.query.criteria_id)
        result.ungraded = await teacher.getNumberOfUngradedAssignmentsForCriteriaAndStudent(req.authData.userId, req.query.student_id, req.query.criteria_id)
        res.status(200).json(result).end()

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
