const pool = require('../db/mysql.js').pool


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

exports.getProblemAssignmentsForStudentAndCriteria = async(student_id, criteria_id, instructor_id) => {
  try {

    const sql = "SELECT problem_assignment.problem_assignment_id, \
    problem_assignment.submission_file AS problem_submission_file, \
    problem_assignment.submission_text AS problem_submission_text, \
    problem_assignment.submission_time as problem_submission_time, \
    problem.text as problem_text, \
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