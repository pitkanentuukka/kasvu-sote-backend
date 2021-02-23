/*************************************
* Use with caution
* this sets all passwords to "salasana"
* only to be used for testing or demoing, _never_ in prod
****************************************/

const dotenv = require('dotenv')
dotenv.config()
const bcrypt = require('bcrypt');
const pool = require('./src/db/mysql.js').pool
const plainPassword = "salasana"
const saltRounds = 10

const setPws = async(plainPassword, saltRounds)=> {
  const hashedPassword = await bcrypt.hash(plainPassword, saltRounds)

  const sql = "update user set password = ?"
  const result = await pool.query(sql, hashedPassword)
  console.log(result);
}
setPws(plainPassword, saltRounds)
