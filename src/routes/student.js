const express = require('express')
const router = express.Router()
const cors = require('cors')
const bcrypt = require('bcrypt');
const bodyParser = require('body-parser')
const {getRoleAndId} = require('../cookie-helper')
const jwt = require('jsonwebtoken')
const cookieParser = require('cookie-parser')
const dotenv = require('dotenv')
const student = require('../db/student.js')
const uuidv4 = require('uuid').v4


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
          res.status(500).json(error).end
        }

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

router.post("/submittheory/:id", cors(), async (req, res) => {
  if (req.cookies.token) {
    const authData = getRoleAndId(req.cookies.token)
    if (authData.role ==='student') {
      if (req.params.id) {
        if (req.files) {

          const file = req.files.submission
          // make sure all file names are completely unique
          const newName = uuidv4() + file.name
          const completePath = process.env.FILE_UPLOAD_PATH + newName;

          try {
            file.mv(completePath)
            student.addTheorySubmission(authData.userId, req.params.id, completePath)
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
    } else {
      // not a student
      res.status(403).end()
    }
  } else {
    // not logged in
    res.status(403).end()
  }
})

router.post("/submitproblem/:id", cors(), async (req, res) => {
  console.log(req.params.id);
  if (req.cookies.token) {
    const authData = getRoleAndId(req.cookies.token)
    if (authData.role ==='student') {
      if (req.params.id) {
        if (req.files) {
          console.log(req.files);
          const file = req.files.submission
          // make sure all file names are completely unique
          const newName = uuidv4() + file.name
          const completePath = process.env.FILE_UPLOAD_PATH + newName;
          try {
            file.mv(completePath)
            student.addProblemSubmission(authData.userId, req.params.id, completePath)
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
