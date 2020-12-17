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


exports.getTheoryAssignmentsForStudentAndCriteria = async(criteria_id, student_id, teacher_id) => {
  const sql = "SELECT theory_assignment.theory_assignment_id, \
  theory_assignment.submission AS theory_submission, \
  theory_assignment.submission_time as theory_submission_time, \
  theory.text as theory_text \
  FROM theory_assignment, theory \
  WHERE theory.criteria_id = ? \
  and theory_assignment.student_id = ? \
  and theory.teacher_id = ? \
  and theory_assignment.theory_id = theory.theory_id"
  const inserts = [criteria_id, student_id, teacher_id]
  try {
    results = await pool.query(sql, inserts)
    return results[0]
  } catch (e) {
    throw (e)
  }
}

exports.getProblemAssignmentsForStudentAndCriteria = async(criteria_id, student_id, teacher_id) => {
  const sql = "SELECT problem_assignment.problem_assignment_id, \
  problem_assignment.submission AS problem_submission, \
  problem_assignment.submission_time as problem_submission_time, \
  problem.text as problem_text\
  FROM problem_assignment, problem\
  WHERE problem_assignment.student_id = ?\
  and problem_assignment.problem_id = problem.problem_id\
  and problem.teacher_id = ?\
  and problem.criteria_Id = ?"
  const inserts = [ student_id, teacher_id, criteria_id]
  try {
    results = await pool.query(sql, inserts)
    return results[0]
  } catch (e) {
    throw (e)
  }
}


exports.deleteTheory = async (id, teacher_id) => {
  try {
    result = await pool.query("update theory\
      set hidden=true where theory_id = ? and teacher_id = ?", [id, teacher_id])

    return result[0]
  } catch (e) {
    throw (e)
  }
}


exports.deleteProblem = async (id, teacher_id) => {
  try {
    result = await pool.query("update problem\
      set hidden=true where problem_id = ? and teacher_id = ?", [id, teacher_id])

    return result[0]
  } catch (e) {
    throw (e)
  }
}

/*
  Get all theory tasks by criteria_id that teacher has added
*/
exports.getAllTheoryTasks = async (userId, criteria_id) => {
  if (criteria_id) {
    const inserts = [userId, criteria_id];
    const sql ="SELECT theory.theory_id, theory.text AS theory_text \
     FROM theory \
     WHERE theory.teacher_id = ? \
     AND theory.criteria_Id = ?";
    try {
      results = await pool.query(sql, inserts);
      return results[0];
    }
    catch (error) {
      throw (error);
    }
  }
}

/*
  Get all problem tasks by criteria_id that teacher has added
*/
exports.getAllProblemTasks = async (userId, criteria_id) => {
  if (criteria_id) {
    const inserts = [userId, criteria_id];
    const sql ="SELECT problem.problem_id, problem.text AS problem_text \
      FROM problem \
      WHERE problem.teacher_id = ? \
      AND problem.criteria_Id = ?";
    try {
      results = await pool.query(sql, inserts);
      return results[0];
    }
    catch (error) {
      throw (error);
    }
  }
}

/* 
  Add Evaluation For Theory: grade and evaluation as inputs and date will be added from system
*/
exports.addEvaluationForTheory = async (grade, evaluation, theory_assignment_id) => {
  try { 
    results = await pool.query("UPDATE theory_assignment SET grade = ?, evaluation = ?, evaluation_datetime = NOW() \
    WHERE theory_assignment.theory_assignment_id = ?", [grade, evaluation, theory_assignment_id]);
    return results[0];
  } catch (error) {
    throw (error)
  }
}

exports.getTheoryTasks = async(user_id, criteria_id) => {
  try {
    results = await pool.query("select * from theory where teacher_id = ? and criteria_id = ?", [user_id, criteria_id])
    return results[0]
  } catch (error) {
    throw error
  }
}

exports.getProblemTasks = async(user_id, criteria_id) => {
  try {
    results = await pool.query("select * from problem where teacher_id = ? and criteria_id = ?", [user_id, criteria_id])
    return results[0]
  } catch (error) {
    throw error
  }
}
