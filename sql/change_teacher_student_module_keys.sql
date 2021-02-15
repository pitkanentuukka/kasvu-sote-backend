ALTER TABLE `teacher_student_module` DROP PRIMARY KEY;
ALTER TABLE `teacher_student_module`
  ADD PRIMARY KEY (`student_id`,`module_id`,'task_type');
  