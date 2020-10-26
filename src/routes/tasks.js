const express = require('express')
const router = express.Router()
const { config } = require('../config')
const { authUser } = require('../auth')
const cors = require('cors')
const mysql = require('mysql');
const bcrypt = require('bcrypt');

const jwt = require('jsonwebtoken')
const cookieParser = require('cookie-parser')
const dotenv = require('dotenv')


router.get('/tasks', cors(), (req, res) => {

  if (typeof(req.cookies.token !== 'undefined')) {
    let authData = getRoleAndId(req.cookies.token)
  //console.log(authData);
    if (authData.role ==='student') {
      let inserts = [authData.userId]
      console.log(inserts);
      let sql = "select * from assignment \
      inner join block on assignment.block_id = block.block_id \
      inner join task on task.block_id = block.block_id \
      where assignment.student_id = ? "



        config.sql_pool().getConnection((err, connection) => {
          connection.query(sql, inserts, (err, results, fields) => {
            if (results.length > 0) {
              res.status(200).json(results)
            }
          })
        })



    } else {
      // not a student

    }
  } else {
    // there's no authenticated user
    res.status(403).end()
  }

})

function getRoleAndId(cookie) {
  let returnData = {};
   jwt.verify(cookie, process.env.JWT_KEY, (err, authData) => {
    if(err) {
      console.log("cookie error");
      //return;
    } else {

      returnData = authData;
    }
  })
  return returnData;


}
module.exports = router
