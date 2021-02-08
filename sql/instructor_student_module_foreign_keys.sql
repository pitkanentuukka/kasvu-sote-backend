ALTER TABLE `instructor_student_module` ADD CONSTRAINT `inst_stud_mod_instructor` FOREIGN KEY (`instructor_id`) REFERENCES `user`(`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `instructor_student_module` ADD CONSTRAINT `inst_stud_mod_student` FOREIGN KEY (`student_id`) REFERENCES `user`(`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `instructor_student_module` ADD CONSTRAINT `inst_stud_mod_module` FOREIGN KEY (`module_id`) REFERENCES `module`(`module_id`) ON DELETE CASCADE ON UPDATE CASCADE;
