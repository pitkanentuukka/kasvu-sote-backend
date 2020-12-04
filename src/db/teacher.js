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

exports.addProblem = async (criteria_id, text, teacher_id) => {
  try {
    results = await pool.query("insert into problem (criteria_id, text, teacher_id)\
    values (?, ?, ?)", [criteria_id, text, teacher_id])
    return results[0];
  } catch (e) {
    throw (e)
  }
}

exports.getAssignmentsForStudentAndCriteria = async (
  criteria_id, student_id, teacher_id) => {

    const sql ="SELECT theory_assignment.theory_assignment_id, \
    theory_assignment.submission AS theory_submission, \
    theory_assignment.submission_time as theory_submission_time, \
    theory.text as theory_text, problem_assignment.problem_assignment_id, \
    problem_assignment.submission AS problem_submission, \
    problem_assignment.submission_time as problem_submission_time, \
    problem.text as problem_text\
    FROM `theory_assignment`, theory, problem_assignment, problem\
    WHERE theory.criteria_id = ?\
    and theory_assignment.student_id = ?\
    and theory.teacher_id = ?\
    and problem_assignment.student_id = ?\
    and problem_assignment.problem_id = problem.problem_id\
    and problem.teacher_id = ?\
    and problem.criteria_Id = ?"
    const inserts = [criteria_id, student_id, teacher_id,
      student_id, teacher_id, criteria_id]
      try {
        results = await pool.query(sql, inserts)
        return results[0]
      } catch (e) {
        throw (e)
      }
    }

exports.deleteTheory = async (id, teacher_id) => {
  try {
    result = await pool.query("delete from theory\
     where theory_id = ? and teacher_id = ?", [id, teacher_id])

    return result[0]
  } catch (e) {
    throw (e)
  }
}


exports.deleteProblem = async (id, teacher_id) => {
  try {
    result = await pool.query("delete from problem\
     where problem_id = ? and teacher_id = ?", [id, teacher_id])

    return result[0]
  } catch (e) {
    throw (e)
  }
}
