const pool = require('../db/mysql.js').pool


exports.getStudentsForInstructor = async (id) => {
  console.log(id);
  try {
    const results = await pool.query( "select distinct user_id, email,\
    concat (last_name, \' \', first_name\) as name\
    from user, teacher_student_module \
    where user.user_id = teacher_student_module.student_id \
    and teacher_student_module.task_type = 'e' \
    and teacher_student_module.teacher_id = ? ", id)

    return results[0]
  }
  catch (error) {
    throw (error)
  }
}

exports.getProblemAssignmentsForStudentAndCriteria = async(student_id, criteria_id, instructor_id) => {
  try {

    const sql = "SELECT problem_assignment.problem_assignment_id, \
    problem_assignment.submission_file AS problem_submission_file, \
    problem_assignment.submission_text AS problem_submission_text, \
    problem_assignment.submission_time as problem_submission_time, \
    problem.text as problem_text, \
    problem.file as problem_file, \
    problem_assignment.grade as problem_grade, \
    problem_assignment.evaluation as problem_evaluation \
    FROM problem_assignment, problem \
    WHERE problem_assignment.student_id = ? \
    and problem_assignment.problem_id = problem.problem_id \
    and problem.teacher_id = ? \
    and problem.criteria_Id = ?"
    const inserts = [student_id, instructor_id, criteria_id]

    const results = await pool.query(sql, inserts)
    return results[0]
  } catch (e) {
    throw (e)
  } finally {

  }
}

exports.getStudentsInModule = async (module_id, instructor_id) => {
  try {
    const results = await pool.query("SELECT user_id, email, \
      concat (last_name, \' \', first_name\) as name \
      FROM `user`, instructor_student_module \
      where user.user_id = instructor_student_module.student_id \
      and instructor_student_module.module_id = ? \
      and instructor_student_module.instructor_id = ?" , [module_id, instructor_id])
      return results[0]
  } catch (error) {
    throw (error)
  }

}

exports.addStudentToInstructorModule = async (instructor_id, student_id, module_id) => {
  try {
    const result = await pool.query("insert into instructor_student_module values (?, ?, ?)", [instructor_id, student_id, module_id])
    return result
  } catch (e) {
    throw e;
  }
}
