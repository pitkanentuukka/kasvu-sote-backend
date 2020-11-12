const express = require('express')
const router = express.Router()
const { config } = require('../config')
const cors = require('cors')
const mysql = require('mysql');
const bcrypt = require('bcrypt');
const bodyParser = require('body-parser')
const dotenv = require('dotenv')


router.get("/modules", cors(), (req, res) => {
  const sql = "SELECT * FROM module"
  config.sql_pool().getConnection((err, connection) => {
    connection.query(sql, (err, results, fields) => {
      connection.release()
      if (err) {
        res.status(500).end()
      }else if (results.length > 0) {

        res.status(200).json(results).end()
      } else {
        res.status(200).json({"msg": "no modules found"}).end()
      }

    })
  })
})

router.get("/categories/:id", cors(), (req, res) => {
  if (!req.params.id) {
    // bad request
    res.status(400).end()
  } else {
    const inserts = [req.params.id]
    const sql = "SELECT * FROM category WHERE module_id = ?"
    config.sql_pool().getConnection((err, connection) => {

      connection.query(sql, inserts, (err, results, fields) => {
        connection.release()
        if (err) {
          res.status(500).end()
        }else if (results.length > 0) {

          res.status(200).json(results).end()
        } else {
          res.status(200).json({"msg": "no categories found"}).end()
        }

      })
    })
  }
})

module.exports = router
