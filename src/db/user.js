const pool = require('../db/mysql.js').pool


exports.getUserByEmail = async (email) => {
  try {
    const results = await pool.query("select * from user where email = ?", email)
    return results[0]
  }
  catch (error) {
    throw (error)
  }
}

exports.getUserById = async (id) => {
  try {
    const results = await pool.query("select * from user where user_id = ?", id)
    return results[0]
  }
  catch (error) {
    throw (error)
  }
}

exports.getStudentsForTeacher = async (id) => {
  try {
    const results = await pool.query( "select distinct user_id, email,\
     concat (last_name, \' \', first_name\) as name\
    from user, teacher_student_module \
    where user.user_id = teacher_student_module.student_id \
    and teacher_student_module.teacher_id = ? ", id)
    return results[0]
  }
  catch (error) {
    throw (error)
  }
}

exports.getStudentsForInstructor = async (id) => {
  console.log(id);
  try {
    const results = await pool.query( "select distinct user_id, email,\
    concat (last_name, \' \', first_name\) as name\
    from user, instructor_student_module \
    where user.user_id = instructor_student_module.student_id \
    and instructor_student_module.instructor_id = ? ", id)

    return results[0]
  }
  catch (error) {
    throw (error)
  }
}





exports.add = async (email, password, role, first_name, last_name) => {
  try {
    const result = await pool.query("insert into user (email, password, role, first_name, last_name) \
    values (?, ?, ?, ?, ?)", [email, password, role, first_name, last_name])
    return result;
  } catch (e) {
    throw (e)
  }
}

exports.setPassword = async (userId, password) => {
  try {
    const result = await pool.query("update user set password = ? where user_id = ?", [password, userId])
    return result
  } catch (e) {
    throw e
  }
}
