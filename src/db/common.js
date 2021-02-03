const pool = require('../db/mysql.js').pool

exports.getModules = async () => {
  try {
    const results = await pool.query("select * from module")
    return results[0]
  }
  catch (error) {
    throw (error)
  }
}

exports.getGategories = async (id) => {
  try {
    const results = await pool.query("select * from category where module_id = ?", id)
    return results[0]
  }
  catch (error) {
    throw (error)
  }
}

exports.getCriterias = async (id) => {
  try {
    const results = await pool.query("select * from criteria where category_id = ?", id)
    return results[0]
  }
  catch (error) {
    throw (error)
  }
}
