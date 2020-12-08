const express = require('express')
const router = express.Router()
const cors = require('cors')
const bodyParser = require('body-parser')
const {getRoleAndId} = require('../cookie-helper')
const dotenv = require('dotenv')
const student = require('../db/student.js')
const uuidv4 = require('uuid').v4
const { checkRole } = require('../auth.js')


/**
* gets open theory assignments for logged in student
*/
router.get('/opentheory', cors(), checkRole('student'), async (req, res) => {
  try {
    const results = await student.getOpenTheory([req.authData.userId])
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

})


/**
* gets open problem assignments for logged in student
*/
router.get('/openproblem', cors(), checkRole('student'), async (req, res) => {
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

})

router.get('/getAssignmentsForCriteria/:id', cors(), checkRole('student'), async (req, res) => {
  if (req.params.id) {
    try {
      const results = await student.getAssignmentsForCriteria(req.authData.userId, req.params.id);
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
      res.status(500).json(error).end
    }

  } else {
    // missing id param
    res.status(400).end()
  }

})

router.post("/submittheory/:id", cors(), checkRole('student'), async (req, res) => {
  if (req.params.id) {
    if (req.files) {

      const file = req.files.submission
      // make sure all file names are completely unique
      const newName = uuidv4() + file.name
      const completePath = process.env.FILE_UPLOAD_PATH + newName;

      try {
        file.mv(completePath)
        student.addTheorySubmission(req.authData.userId, req.params.id, completePath)
      } catch (e) {
        res.status(500).json(e).end()
      }
      res.status(200).end()
    } else {
      // file not found
      res.status(400).json({"msg": "no file"}).end()
    }

  } else {
    // missing id param
    res.status(400).json({"msg": "no assignment id"}).end()
  }
})

router.post("/submitproblem/:id", cors(), checkRole('student'), async (req, res) => {
  if (req.params.id) {
    if (req.files) {
      console.log(req.files);
      const file = req.files.submission
      // make sure all file names are completely unique
      const newName = uuidv4() + file.name
      const completePath = process.env.FILE_UPLOAD_PATH + newName;
      try {
        file.mv(completePath)
        student.addProblemSubmission(req.authData.userId, req.params.id, completePath)
      } catch (e) {
        res.status(500).json(e).end()
      }
      res.status(200).end()
    } else {
      // file not found
      res.status(400).json({"msg": "no file"}).end()
    }

  } else {
    // missing id param
    res.status(400).json({"msg": "no assignment id"}).end()
  }
})

router.post("/addselfeval/:id", cors(), checkRole('student'), async (req, res) => {
  if (req.params.id) {
    if (req.body.evaluation_text !== null && req.body.grade !==null) {
      try {
        const result = student.addSelfEvaluation(req.authData.userId, req.param.id, req.body.evaluation_text,req.body.grade)
        res.status(200).json(result).end()
      } catch (e) {
        res.status(500).json(e).end()
      }
    } else {
      res.status(400).json({"msg": "missing grade or evaluation"}).end()
    }
  } else {
    // missing id param
    res.status(400).json({"msg": "no assignment id"}).end()
  }

})

module.exports = router
