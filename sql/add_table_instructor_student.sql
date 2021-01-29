
-- --------------------------------------------------------

--
-- Table structure for table `teacher_student_module`
--

CREATE TABLE `instructor_student_module` (
  instructor_id int(11) NOT NULL,
  student_id int(11) NOT NULL,
  module_id int(11) NOT NULL,
  task_type ENUM ('t', 'p') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teacher_student_module`
--

INSERT INTO `instructor_student_module` (instructor_id, student_id, module_id, task_type)
VALUES (4, 2, 1, 't');

