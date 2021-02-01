const express = require('express')
const router = express.Router()
const cors = require('cors')
const bodyParser = require('body-parser')
const { checkRole } = require('../auth.js')
const student = require('../db/student.js')
const user = require('../db/user.js')




router.post('/evaluateStudent', cors(), checkRole('instructor'), async (req, res) => {
  if (req.body.criteria_id && req.body.student_id && req.body.evaluation_text) {
    try {
      const result = await student.addEvaluation(req.body.criteria_id, req.body.student_id, req.authData.userId, req.body.evaluation_text)
      res.status(200).json(result).end()
    } catch (e) {
      res.status(500).json(e).end()
    }
  } else {
    res.status(400).json({"msg": "missing parameters"}).end()
  }
})


router.get('/getProblemsForStudent/:id', cors(), checkRole('instructor'), async (req, res) => {
  if (req.params.id) {
    try {
      const results = await student.getProblemsByGrader(req.params.id, req.authData.userId)
      res.status(200).json(results).end()
    } catch (e) {
      res.status(500).json(e).end()
    }
  } else {
    res.status(400).json({"msg": "missing parameters"}).end()
  }
})

router.get("/students", cors(), checkRole('instructor'), async (req, res) => {
  try {
    const students = await user.getStudentsForInstructor(req.authData.userId)

    res.status(200).json(students).end()
  } catch (e) {
    res.status(500).json(e).end()
  }
})

module.exports = router
