const express = require('express')
const router = express.Router()
const { config } = require('../config')
const cors = require('cors')
const mysql = require('mysql');
const bcrypt = require('bcrypt');
const bodyParser = require('body-parser')
const {getRoleAndId} = require('../cookie-helper')
const jwt = require('jsonwebtoken')
const cookieParser = require('cookie-parser')
const dotenv = require('dotenv')
const student = require('../db/student.js')


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
    console.log(authData);

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



module.exports = router
