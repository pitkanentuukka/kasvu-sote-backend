const express = require('express')
const router = express.Router()
const { config } = require('../config')
const cors = require('cors')
const mysql = require('mysql');
const bcrypt = require('bcrypt');
const bodyParser = require('body-parser')
const dotenv = require('dotenv')
const pool = require('../db/mysql.js').pool
const user = require('../db/user.js')
const common = require('../db/common.js')

router.get("/modules", cors(), async (req, res) => {
  try {
    const results = await common.getModules()
    if (results.length === 0) {
      res.status(200).json({"message": "no modules found"}).end()
    } else if (results.length > 0) {
      res.status(200).json(results).end()
    }
  } catch (error) {
    res.status(500).json(error).end
  }
})

router.get("/categories/:id", cors(), async (req, res) => {
  if (!req.params.id) {
        // bad request
        res.status(400).end()
  } else {
    try {
      const inserts = [req.params.id]
      const results =  await common.getGategories(inserts)

      if (results.length === 0) {
        res.status(200).json({"message": "no categories found"}).end()
      } else if (results.length > 0) {
        res.status(200).json(results).end()
      }
    }
    catch (error)
    {
      console.log(error);
      res.status(500).json(error).end
    }
  }
})

router.get("/criteria/:id", cors(), async (req, res) => {
  if (!req.params.id)
  {
    // bad request
    res.status(400).end()
  } else {
    try {
      const inserts = [req.params.id]
      const results = await common.getCriterias(inserts)
      if (results.length === 0) {
        res.status(200).json({"message": "no criterias found"}).end()
      } else if (results.length > 0) {
        res.status(200).json(results).end()
      }
    }
    catch (error) {
      res.status(500).json(error).end
    }
  }
})

module.exports = router
