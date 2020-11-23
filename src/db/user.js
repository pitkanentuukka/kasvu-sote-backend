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

exports.getStudentsForTeacher = async (id) => {
  try {
    results = await pool.query( "select user_id, email, first_name, last_name\
    from user, teacher_student_module \
    where user.user_id = teacher_student_module.student_id \
    and teacher_student_module.teacher_id = ? ", id)
    return results[0]
  }
  catch (error) {
    throw (error)
  }
}
