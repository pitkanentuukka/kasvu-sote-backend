const pool = require('../db/mysql.js').pool

exports.getOpenTheory = async (id) => {
  try {
    const results = await pool.query("SELECT * FROM theory_assignment, theory, criteria\
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
    const results = await pool.query("SELECT * FROM problem_assignment, problem, criteria\
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
    const results = await pool.query("select theory_assignment.theory_assignment_id,\
      theory_assignment.assign_date as theory_assign_date,\
      theory_assignment.submission_file as theory_submission_file,\
      theory_assignment.submission_text as theory_submission_text,\
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
      problem_assignment.submission_text as problem_submission_text,\
      problem_assignment.submission_file as problem_submission_file,\
      problem_assignment.submission_time as problem_submission_time,\
      problem_assignment.grade as problem_grade,\
      problem_assignment.evaluation as problem_evaluation,\
      problem_assignment.evaluation_datetime,\
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
    const results = await pool.query("select theory_assignment.theory_assignment_id,\
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
    const results = await pool.query("select problem_assignment.problem_id,\
        problem_assignment.assign_date as problem_assign_date,\
        problem_assignment.submission_text as problem_submission_text,\
        problem_assignment.submission_file as problem_submission_file,\
        problem_assignment.submission_time as problem_submission_time,\
        problem_assignment.grade as problem_grade,\
        problem_assignment.evaluation as problem_evaluation,\
        problem_assignment.evaluation_datetime,\
        problem.text as problem_text, \
        concat (user.last_name, \' \', user.first_name\) as grader_name, \
        user.role as grader_role \
        from problem_assignment, problem, user\
        where problem_assignment.student_id = ?\
        and problem_assignment.problem_id = problem.problem_id\
        and user.user_id = problem.teacher_id \
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
    const result = await pool.query(sql, inserts)
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
    const result = await pool.query(sql, inserts)
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


exports.getInstructor = async(student_id) => {
  try {
    const sql = "select user_id, email,\
     concat (last_name, \' \', first_name\) as name\
      FROM `user`, teacher_student_module\
      where user.user_id = teacher_student_module.teacher_id\
      and user.role = 'instructor'\
      and teacher_student_module.student_id = ?"
    const result = await pool.query(sql, student_id)

    return result[0]
  } catch (e) {
    throw (e)
  } finally {

  }
