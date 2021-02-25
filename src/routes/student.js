const express = require('express')
const router = express.Router()
const cors = require('cors')
const bodyParser = require('body-parser')
const dotenv = require('dotenv')
const student = require('../db/student.js')
const teacher = require('../db/teacher.js')
const { checkRole } = require('../auth.js')
const { uploadFile } = require('../uploadFile.js')

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

router.get('/getTheoryAssignmentsForCriteria/:id', cors(), checkRole('student'), async (req, res) => {
  if (req.params.id) {
    try {
      const results = await student.getTheoryAssignmentsForCriteria(req.authData.userId, req.params.id);
      if (results.length === 0) {
        res.status(204).end()
      } else if (results.length > 0) {
        res.status(200).json(results).end()
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

router.get('/getProblemAssignmentsForCriteria/:id', cors(), checkRole('student'), async (req, res) => {
  if (req.params.id) {
    try {
      const results = await student.getProblemAssignmentsForCriteria(req.authData.userId, req.params.id);
      if (results.length === 0) {
        res.status(204).end()
      } else if (results.length > 0) {
        res.status(200).json(results).end()
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

router.post("/submitTheory/:id", cors(), checkRole('student'), uploadFile, async (req, res) => {
  if (req.params.id) {
    if (req.filePath || req.body.text){
      try {
        student.addTheorySubmission(req.authData.userId, req.params.id, req.filePath, req.body.text)
      } catch (e) {
        res.status(500).json(e).end()
      }
      res.status(200).json({"msg": "submission saved" }).end()
    } else {
      res.status(400).json({"msg": "no submission"})
    }
  } else {
    // missing id param
    res.status(400).json({"msg": "no assignment id"}).end()
  }
})

router.post("/submitProblem/:id", cors(), checkRole('student'), uploadFile, async (req, res) => {
  if (req.params.id) {
    if (req.filePath || req.body.text){
      try {
        student.addProblemSubmission(req.authData.userId, req.params.id, req.filePath, req.body.text)
      } catch (e) {
        res.status(500).json(e).end()
      }
      res.status(200).json({"msg": "submission saved" }).end()
    } else {
      res.status(400).json({"msg": "no submission"})
    }
  } else {
    // missing id param
    res.status(400).json({"msg": "no assignment id"}).end()
  }
})

router.post("/addselfeval/:id", cors(), checkRole('student'), async (req, res) => {
  if (req.params.id) {
    if (req.body.evaluation !== null && req.body.grade !==null) {
      try {
        const result = student.addSelfEvaluation(req.authData.userId, req.params.id, req.body.evaluation,req.body.grade)
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

router.get('/getInstructor/', cors(), checkRole('student'), async (req, res) =>{
  try {
    const result = await student.getInstructor(req.authData.userId)
    res.status(200).json(result).end()
  } catch (e) {
    res.status(500).json(e).end()
  }
})

router.get('/getGradeForCriteria/:id', cors(), checkRole('student'), async (req, res) =>{
  if (req.params.id) {
    try {
      const result = await student.getGradeForStudentAndCriteria(req.authData.userId, req.params.id)
      if (Number.isFinite(result)) {
        res.status(200).json(result).end()
      } else {
        // result is NaN when there are no grades
        res.status(204).end()
      }

    } catch (e) {
      res.status(500).json(e).end()
    }

  } else {
    res.status(400).json({"msg": "missing criteria id"}).end()
  }

})

router.get('/getEvaluationsForCriteria/:id', cors(), checkRole('student'), async (req, res) =>{
  if (req.params.id) {
    try {
      const result = await student.getEvaluationsForCriteria(req.authData.userId, req.params.id)
      if (result[0].length >0 ) {
        res.status(200).json(result).end()
      } else {
        res.status(204).end()
      }
    } catch (e) {
      res.status(500).json(e).end()
    }
  } else {
    res.status(400).json({"msg": "missing criteria id"}).end()

  }

})


module.exports = router
