const pool = require('../db/mysql.js').pool

exports.getOpenTheory = async (id) => {
  try {
    results = await pool.query("SELECT * FROM theory_assignment, theory, criteria\
      WHERE student_id = ? \
      AND submission IS NULL \
      AND theory_assignment.theory_id = theory.theory_id \
      AND theory.criteria_id = criteria.criteria_id", id)
    return results[0]
  }
  catch (error) {
    throw (error)
  }
}

exports.getOpenProblem = async (id) => {
  try {
    results = await pool.query("SELECT * FROM problem_assignment, problem, criteria\
      WHERE student_id = ? \
      AND submission IS NULL \
      AND problem_assignment.problem_id = problem.problem_id \
      AND problem.criteria_id = criteria.criteria_id", id)
    return results[0]
  }
  catch (error) {
    throw (error)
  }
}

exports.getAssignmentsForCriteria = async (userId, criteria_Id) => {
  console.log("DB_userId", userId)
  console.log("DB_cri_id", criteria_Id)
  try {
    results = await pool.query("select theory_assignment.theory_assignment_id,\
      theory_assignment.assign_date as theory_assign_date,\
      theory_assignment.submission as theory_submission,\
      theory_assignment.submission_time as theory_submission_time,\
      theory_assignment.self_grade as theory_self_grade,\
      theory_assignment.self_evaluation_text as theory_self_evaluation,\
      theory_assignment.self_evaluation_datetime as theory_self_evaluation_datetime,\
      theory_assignment.grade as theory_grade,\
      theory_assignment.evaluation as theory_evaluation,\
      theory_assignment.evaluation_datetime as theory_evaluation_datetime,\
      problem_assignment.problem_id,\
      problem_assignment.assign_date as problem_assign_date,\
      problem_assignment.submission as problem_submission,\
      problem_assignment.submission_date as problem_submission_time,\
      problem_assignment.grade as problem_grade,\
      problem_assignment.evaluation as problem_evaluation,\
      problem_assignment.evaluation_datetime,\
      problem_assignment.grader_id as problem_grader_id\
      from theory_assignment, problem_assignment, theory, problem\
      where problem_assignment.student_id = ?\
      and problem_assignment.problem_id = problem.problem_id\
      and problem.criteria_Id = ?\
      and theory_assignment.student_id = ?\
      and theory_assignment.theory_id = theory.theory_id\
      and theory.criteria_Id = ?", [userId, criteria_Id, userId, criteria_Id])
    return result[0]
  }
  catch (error) {
    console.log("2. catch error")
    throw (error)
  }
}

