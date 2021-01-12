const pool = require('../db/mysql.js').pool
const MySQLDateTime = require('../db/mysql.js').datetime

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
      theory.text as theory_text, \
      problem_assignment.problem_id,\
      problem_assignment.assign_date as problem_assign_date,\
      problem_assignment.submission as problem_submission,\
      problem_assignment.submission_time as problem_submission_time,\
      problem_assignment.grade as problem_grade,\
      problem_assignment.evaluation as problem_evaluation,\
      problem_assignment.evaluation_datetime,\
      problem_assignment.grader_id as problem_grader_id,\
      problem.text as problem_text\
      from theory_assignment, problem_assignment, theory, problem\
      where problem_assignment.student_id = ?\
      and problem_assignment.problem_id = problem.problem_id\
      and problem.criteria_Id = ?\
      and theory_assignment.student_id = ?\
      and theory_assignment.theory_id = theory.theory_id\
      and theory.criteria_Id = ?", [userId, criteria_Id, userId, criteria_Id])
    return results[0]
  }
  catch (error) {
    throw (error)
  }
}

exports.getTheoryAssignmentsForCriteria = async (userId, criteria_Id) => {
  try {
    results = await pool.query("select theory_assignment.theory_assignment_id,\
    theory_assignment.assign_date as theory_assign_date,\
    theory_assignment.submission_text as theory_submission_text,\
    theory_assignment.submission_file as theory_submission_file,\
    theory_assignment.submission_time as theory_submission_time,\
    theory_assignment.self_grade as theory_self_grade,\
    theory_assignment.self_evaluation_text as theory_self_evaluation,\
    theory_assignment.self_evaluation_datetime as theory_self_evaluation_datetime,\
    theory_assignment.grade as theory_grade,\
    theory_assignment.evaluation as theory_evaluation,\
    theory_assignment.evaluation_datetime as theory_evaluation_datetime,\
    theory.text as theory_text \
    from theory_assignment, theory\
    where theory_assignment.student_id = ?\
    and theory_assignment.theory_id = theory.theory_id\
    and theory.criteria_Id = ?", [userId, criteria_Id])
    return results[0]
  }
  catch (error) {
    throw (error)
  }
}

exports.getProblemAssignmentsForCriteria = async (userId, criteria_Id) => {
  try {
    results = await pool.query("select problem_assignment.problem_id,\
        problem_assignment.assign_date as problem_assign_date,\
        problem_assignment.submission_text as problem_submission_text,\
        problem_assignment.submission_file as problem_submission_file,\
        problem_assignment.submission_time as problem_submission_time,\
        problem_assignment.grade as problem_grade,\
        problem_assignment.evaluation as problem_evaluation,\
        problem_assignment.evaluation_datetime,\
        problem_assignment.grader_id as problem_grader_id,\
        problem.text as problem_text\
        from problem_assignment, problem\
        where problem_assignment.student_id = ?\
        and problem_assignment.problem_id = problem.problem_id\
        and problem.criteria_Id = ?", [userId, criteria_Id])
    return results[0]
  }
  catch (error) {
    throw (error)
  }
}


exports.addTheorySubmission = async (user_id, assignment_id, path_to_file, text) => {
  try {
    // this converts javascript date objects to MySQL datetime format
    const datetime = new Date().toISOString().slice(0, 19).replace('T', ' ');
    const sql = "update theory_assignment set submission_file = ?, submission_text = ?, submission_time= ?\
        where theory_assignment_id = ? and student_id = ?"
    const inserts = [path_to_file, text,  datetime, assignment_id, user_id]
    result = await pool.query(sql, inserts)
    return result[0]
  } catch (e) {
    throw (e)
  }
}

exports.addProblemSubmission = async (user_id, assignment_id, path_to_file, text) => {
  try {
    // this converts javascript date objects to MySQL datetime format
    const datetime = new Date().toISOString().slice(0, 19).replace('T', ' ');
    const sql = "update problem_assignment set submission_file = ?, submission_text = ?, submission_time = ?\
        where problem_assignment_id = ? and student_id = ?"
    const inserts = [path_to_file, text, datetime, assignment_id, user_id]
    result = await pool.query(sql, inserts)
    return result[0]
  } catch (e) {
    throw (e)
  }
}

exports.addSelfEvaluation = async (user_id, submission_id, evaluation_text, grade) => {
  const datetime = new Date().toISOString().slice(0, 19).replace('T', ' ');
  try {
    const result = await pool.query("update theory_assignment \
      set self_evaluation_text = ?, self_evaluation_datetime = ?, \
      self_grade = ? where theory_assignment_id = ? and student_id = ?\
      and submission_text is not null or submission_file is not null",
      [evaluation_text, datetime, grade, submission_id, user_id])
    return result[0]

  } catch (e) {
    throw (e)
  }
}

exports.addEvaluation = async (criteria_id, student_id, instructor_id, evaluation_text) => {
  const datetime = new Date().toISOString().slice(0, 19).replace('T', ' ');
  try {
    const result = await pool.query("INSERT INTO evaluation \
    (criteria_id, student_id, instructor_id, evaluation_text, evaluation_date) \
    values (?, ?, ?, ?)", [criteria_id, student_id, instructor_id, evaluation_text, datetime])
    return result[0]
  } catch(e) {
    throw (e)
  }
}

exports.getProblemsByGrader = async (student_id, grader_id) => {
  try {
    const result = await pool.query("select problem.criteria_id, problem.text,\
      problem_assignment.problem_assignment_id, problem_assignment.submission \
      from problem, problem_assignment \
      where problem_assignment.problem_id = problem.problem_id \
      and problem_assignment.student_id = ? \
      and problem_assignment.grader_id = ?", student_id, grader_id)
      return result[0]

  } catch (e) {

  }

}
