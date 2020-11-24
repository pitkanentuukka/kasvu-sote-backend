const pool = require('../db/mysql.js').pool

exports.postTheory = async (criteria_id, text, teacher_id) => {
  try {
    results = await pool.query("insert into theory (criteria_id, text, teacher_id ) \
    values (?, ?, ?)", criteria_id, text, teacher_id)
    console.log(results)
    return results[0]
  }
  catch (error) {
    throw (error)
  }
}

