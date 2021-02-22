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
      const result = await instructor.addEvaluation(req.body.criteria_id, req.body.student_id, req.authData.userId, req.body.evaluation_text)
      res.status(200).json(result).end()
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

module.exports = router
