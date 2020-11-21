const pool = require('../db/mysql.js').pool


exports.getUserByEmail = async (email) => {
  try {
    results = await pool.query("select * from user where email = ?", email)
    return results[0]
  }
  catch (error) {
    throw (error)
  }
}

exports.getUserById = async (id) => {
  try {
    results = await pool.query("select * from user where user_id = ?", id)
    return results[0]
  }
  catch (error) {
    throw (error)
  }
}
