const pool = require('../db/mysql.js').pool

exports.addTheory = async (criteria_id, file, text, teacher_id) => {
  try {
    results = await pool.query("insert into theory (criteria_id, file, text, teacher_id ) \
    values (?, ?, ?, ?)", [criteria_id, file, text, teacher_id]);
    return results[0]
  }
  catch (error) {
    throw (error)
  }
}

exports.addProblem = async (criteria_id, file, text, teacher_id) => {
  try {
    results = await pool.query("insert into problem (criteria_id, file, text, teacher_id)\
    values (?, ?, ?, ?)", [criteria_id, file, text, teacher_id])
    return results[0];
  } catch (e) {
    throw (e)
  }
}


exports.getTheoryAssignmentsForStudentAndCriteria = async(criteria_id, student_id, teacher_id) => {
  const sql = "SELECT theory_assignment.theory_assignment_id, \
  theory_assignment.submission_file AS theory_submission_file, \
  theory_assignment.submission_text AS theory_submission_text, \
  theory_assignment.submission_time as theory_submission_time, \
  self_grade as theory_self_grade, \
  self_evaluation_text as theory_self_evaluation, \
  self_evaluation_datetime as theory_self_evaluation_datetime, \
  grade as theory_grade, \
  evaluation as theory_evaluation, \
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
  problem_assignment.submission_file AS problem_submission_file, \
  problem_assignment.submission_text AS problem_submission_text, \
  problem_assignment.submission_time as problem_submission_time, \
  problem.text as problem_text, \
  problem_assignment.grade as problem_grade, \
  problem_assignment.evaluation as problem_evaluation, \
  problem_assignment.grader_id as ptoblem_grader_id \
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

exports.getTheoryTasks = async (user_id, criteria_id) => {
  try {
    results = await pool.query("select * from theory where teacher_id = ? and criteria_id = ?", [user_id, criteria_id])
    return results[0]
  } catch (error) {
    throw error
  }
}

exports.getProblemTasks = async (user_id, criteria_id) => {
  try {
    results = await pool.query("select * from problem where teacher_id = ? and criteria_id = ?", [user_id, criteria_id])
    return results[0]
  } catch (error) {
    throw error
  }
}

exports.assignStudentAndTheoryForTeacher = async(userId, module_id, student_id) => {
  console.log("tuli tänne 2, id=", student_id)
  /*try {
    results = await pool.query("", [])
  } catch (error) {
    throw error
  }*/
}

exports.addStudentAndModule = async (teacher_id, module_id, student_id) => {
  console.log("tuli tänne 1, id=", student_id)
  try {
/*    results = await pool.query( "INSERT IGNORE INTO teacher_student_module \
    (teacher_id, student_id, module_id) VALUES (?,?,?);", [teacher_id, student_id, module_id])*/
    results = await pool.query( "INSERT INTO teacher_student_module (teacher_id, student_id, module_id) \
    SELECT (?,?,?) \
    WHERE NOT EXIST student_id=? AND module_id=?;", [teacher_id, student_id, module_id, student_id, module_id])
    return results[0]
  }
  catch (error) {
    throw (error)
  }
}

exports.getStudentsNotInModule = async (module_id) => {
  try {
    results = await pool.query("SELECT user_id, email,\
     concat (last_name, \' \', first_name\) as name\
      FROM `user` where not exists \
      (select * from teacher_student_module \
      where teacher_student_module.student_id = user.user_id \
      and teacher_student_module.module_id = ?) \
      and user.role = 'student'", module_id)
    return results[0]
  } catch (error) {
    throw (error)
  }
}


exports.getTeacherForStudentAndModule = async(student_id, module_id) => {
  try {
    result = await pool.query("select * from teacher_student_module \
    where student_id = ? and module_id = ?", [student_id, module_id])
    if (result[0][0]) {
      return result[0][0].teacher_id
    } else {
      return false
    }
  } catch (e) {
    throw(e)
  }
}


exports.addStudentToModule = async (teacher_id, student_id, module_id) => {
  try {
    result = await pool.query("insert into teacher_student_module values (?, ?, ?)", [teacher_id, student_id, module_id])
    return result
  } catch (e) {
    throw e;
  }
}

exports.assignModuleTheoryForStudent = async (teacher_id, student_id, module_id) => {
  try {
    const datetime = new Date().toISOString().slice(0, 19).replace('T', ' ');

    const sql = "insert into theory_assignment (theory_id, student_id, assign_date) \
        select theory_id, ?, ?  from theory, criteria, category \
        where theory.criteria_id = criteria.criteria_id \
        and criteria.category_id = category.category_id \
        and category.module_id = ? \
        and theory.teacher_id = ?"

    result = await pool.query(sql, [student_id, datetime, module_id, teacher_id])
    return result
  } catch (e) {
    throw (e)
  }
}
