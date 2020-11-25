const pool = require('../db/mysql.js').pool

exports.addTheory = async (criteria_id, text, teacher_id) => {
  try {
    results = await pool.query("insert into theory (criteria_id, text, teacher_id ) \
    values (?, ?, ?)", [criteria_id, text, teacher_id]);
    return results[0]
  }
  catch (error) {
    throw (error)
  }
}

exports.addProblem = async function (criteria_id, text, teacher_id) {
  try {
    results = await pool.query("insert into problem (criteria_id, text, teacher_id)\
    values (?, ?, ?)", [criteria_id, text, teacher_id])
    console.log(results[0]);
    return results[0];
  } catch (e) {
    throw (e)
  }
}
