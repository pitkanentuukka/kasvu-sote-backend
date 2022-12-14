-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 25, 2020 at 12:15 PM
-- Server version: 10.1.44-MariaDB-0+deb9u1
-- PHP Version: 7.0.33-0+deb9u7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sote_kasvu`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `module_id`, `name`) VALUES
(1, 1, 'Opiskelija työskentelee kasvatus-, sosiaali- ja terveysalan työn säädösten, määräysten, toimintaperiaatteiden, arvojen ja ammattieettisten ohjeiden mukaan.'),
(2, 1, 'Opiskelija suunnittelee työtään ja tekee yhteistyötä työryhmän kanssa.'),
(3, 1, 'Opiskelija suunnittelee, toteuttaa ja arvioi kasvun ja osallisuuden edistämistä.'),
(4, 1, 'Opiskelija toimii vuorovaikutuksessa asiakkaan kanssa.'),
(5, 1, 'Opiskelija edistää kasvua ja osallisuutta käyttäen alan työmenetelmiä, -välineitä ja materiaaleja.'),
(6, 1, 'Opiskelija ohjaa ja avustaa päivittäisissä toiminnoissa.'),
(7, 1, 'Opiskelija huolehtii asiakkaan hyvinvoinnista, terveydestä ja turvallisuudesta.'),
(8, 1, 'Opiskelija antaa tietoa palveluista.'),
(9, 1, 'Opiskelija ylläpitää turvallisuutta, työkykyään ja työhyvinvointiaan.'),
(10, 1, 'Opiskelija arvioi ja kehittää toimintaansa.'),
(11, 2, 'Opiskelija työskentelee lähihoitajan työtä ohjaavien säädösten ja ohjeiden mukaan.'),
(12, 2, 'Opiskelija suunnittelee työtään.'),
(13, 2, 'Opiskelija toimii vuorovaikutuksessa asiakkaan kanssa.'),
(14, 2, 'Opiskelija käyttää asiakkaan toimintakykyä edistävää ja voimavaralähtöistä työotetta.'),
(15, 2, 'Opiskelija motivoi asiakasta terveyttä ja hyvinvointia edistävään omahoitoon ja ehkäisemään riskejä.'),
(16, 2, 'Opiskelija ohjaa asiakasta toiminnallisuuteen.'),
(17, 2, 'Opiskelija käyttää alan työmenetelmiä, -välineitä ja materiaaleja asiakkaan perushoidossa ja huolenpidossa, saattohoidossa ja lääkehoidossa.'),
(18, 2, 'Opiskelija antaa tietoa palveluista.'),
(19, 2, 'Opiskelija ohjaa apuvälineiden ja hyvinvointia tukevan teknologian käytössä ja huollossa.'),
(20, 2, 'Opiskelija ylläpitää turvallisuutta, työkykyään ja työhyvinvointiaan.'),
(21, 2, 'Opiskelija kehittää toimintaansa ja perustelee ratkaisujaan ammatillisella tiedolla.');


-- --------------------------------------------------------

--
-- Table structure for table `criteria`
--

CREATE TABLE `criteria` (
  `criteria_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `criteria`
--

INSERT INTO `criteria` (`criteria_id`, `category_id`, `text`) VALUES
(1, 1, 'toimii asiakkaan perus- ja ihmisoikeuksia kunnioittaen\n'),
(2, 1, 'noudattaa kasvatus-, sosiaali- ja terveysalan lainsäädäntöä, määräyksiä, toimintaperiaatteita ja työpaikan ohjeita työryhmän kanssa\r\n'),
(3, 1, 'toimii kasvatus-, sosiaali- ja terveysalan työn arvojen ja lähihoitajan ammattieettisten ohjeiden mukaan\r\n'),
(4, 1, 'noudattaa tietosuojaa ja salassapitoa\r\n'),
(5, 1, 'työskentelee laatusuositusten ja omavalvontamääräysten mukaan työryhmän ohjaamana\r\n'),
(6, 1, 'toimii kestävän kehityksen periaatteiden mukaan\r\n'),
(7, 1, 'Opiskelija suunnittelee työtään ja tekee yhteistyötä työryhmän kanssa.\r\n'),
(8, 1, 'suunnittelee työtehtäviään työpaikan toiminnan mukaan\r\n'),
(9, 1, 'tekee yhteistyötä työryhmän kanssa\r\n'),
(10, 1, 'viestii ja dokumentoi työpaikan käytäntöjen mukaisesti työryhmän ohjaamana\r\n'),
(11, 1, 'Opiskelija suunnittelee, toteuttaa ja arvioi kasvun ja osallisuuden edistämistä.\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `evaluation`
--

CREATE TABLE `evaluation` (
  `evaluation_id` int(11) NOT NULL,
  `criteria_Id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `instructor_id` int(11) NOT NULL,
  `evaluation_text` text NOT NULL,
  `evaluation_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

CREATE TABLE `module` (
  `module_id` int(11) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `module`
--

INSERT INTO `module` (`module_id`, `name`) VALUES
(1, 'Kasvun ja osallisuuden edistäminen'),
(2, 'Hyvinvoinnin ja toimintakyvyn edistäminen');

-- --------------------------------------------------------

--
-- Table structure for table `problem`
--

CREATE TABLE `problem` (
  `problem_id` int(11) NOT NULL,
  `criteria_Id` int(11) NOT NULL,
  `text` text NOT NULL,
  `teacher_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `problem`
--

INSERT INTO `problem` (`problem_id`, `criteria_Id`, `text`, `teacher_id`) VALUES
(1, 1, 'tähän tulisi joku ongelmanratkaisutehtävä', 3),
(2, 2, 'tähän tulisi joku toinen ongelmanratkaisutehtävä', 3),
(3, 1, 'testiteksti', 3),
(4, 1, 'testataan ongelman lisäystä', 3),
(5, 1, 'testataan vielä ongelman lisäystä', 3);

-- --------------------------------------------------------

--
-- Table structure for table `problem_assignment`
--

CREATE TABLE `problem_assignment` (
  `problem_assignment_id` int(11) NOT NULL,
  `problem_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `assign_date` datetime NOT NULL,
  `submission` text,
  `submission_date` datetime DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  `evaluation` text,
  `evaluation_datetime` int(11) DEFAULT NULL,
  `grader_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `problem_assignment`
--

INSERT INTO `problem_assignment` (`problem_assignment_id`, `problem_id`, `teacher_id`, `student_id`, `assign_date`, `submission`, `submission_date`, `grade`, `evaluation`, `evaluation_datetime`, `grader_id`) VALUES
(1, 1, 3, 2, '2020-10-29 10:59:39', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 2, 3, 2, '2020-10-29 12:45:16', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `teacher_student_module`
--

CREATE TABLE `teacher_student_module` (
  `teacher_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teacher_student_module`
--

INSERT INTO `teacher_student_module` (`teacher_id`, `student_id`, `module_id`) VALUES
(3, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `theory`
--

CREATE TABLE `theory` (
  `theory_id` int(11) NOT NULL,
  `criteria_Id` int(11) NOT NULL,
  `text` text NOT NULL,
  `teacher_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `theory`
--

INSERT INTO `theory` (`theory_id`, `criteria_Id`, `text`, `teacher_id`) VALUES
(1, 1, 'tähän voisi tulla joku tehtävä', 3),
(2, 2, 'tässä on esimerkkitehtävä toiselle kriteerille', 3),
(3, 2, 'tämän tehtävän tehtävä on testata tehtävänlisäysAPIa', 3),
(5, 1, 'testataan vielä teoriatehtävän lisäystä', 3),
(6, 1, 'testataan vielä teoriatehtävän lisäystä', 3),
(7, 1, 'testataan vielä teoriatehtävän lisäystä', 3),
(8, 1, 'testataan vielä teoriatehtävän lisäystä', 3);

-- --------------------------------------------------------

--
-- Table structure for table `theory_assignment`
--

CREATE TABLE `theory_assignment` (
  `theory_assignment_id` int(11) NOT NULL,
  `theory_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `assign_date` datetime NOT NULL,
  `submission` text,
  `submission_time` datetime DEFAULT NULL,
  `self_grade` int(11) DEFAULT NULL,
  `self_evaluation_text` text,
  `self_evaluation_datetime` datetime DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  `evaluation` int(11) DEFAULT NULL,
  `evaluation_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `theory_assignment`
--

INSERT INTO `theory_assignment` (`theory_assignment_id`, `theory_id`, `student_id`, `assign_date`, `submission`, `submission_time`, `self_grade`, `self_evaluation_text`, `self_evaluation_datetime`, `grade`, `evaluation`, `evaluation_datetime`) VALUES
(1, 1, 2, '2020-10-29 12:45:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','student','teacher','instructor') NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `email`, `password`, `role`, `first_name`, `last_name`) VALUES
(1, 'someone@example.com', '$2b$10$xMP0yVK3GyR8Seuq2czyEOctMUo39LIkWJ5ExYa8DkHCzyue0pHhG', 'admin', 'jaska', 'jokunen'),
(2, 'matti.mallioppilas@edu.hel.fi', '$2b$10$3nz60uB/sXMlca5J469hKegwS/trEvNJZV0HAgTJrc0HbQhMAdkeq', 'student', 'matti', 'mallioppilas'),
(3, 'olli.opettaja@edu.hel.fi', '$2b$10$grMhWF/DOjzVHEyGJSldSOFUdEWGxpKPZ2oG7UB5lHbixf6SU0u76', 'teacher', 'olli', 'opettaja'),
(4, 'teemu.tyopaikkaohjaaja@edu.hel.fi', '$2b$10$E58vIrrm4/IOmO7.tw8SruSaFzAyL.kOYLH6c2EZ32xYm3xSFPUOu', 'instructor', 'Teemu', 'Työpaikkaohjaaja');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `module_id` (`module_id`);

--
-- Indexes for table `criteria`
--
ALTER TABLE `criteria`
  ADD PRIMARY KEY (`criteria_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `evaluation`
--
ALTER TABLE `evaluation`
  ADD PRIMARY KEY (`evaluation_id`),
  ADD KEY `criteria_Id` (`criteria_Id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `instructor_id` (`instructor_id`);

--
-- Indexes for table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`module_id`);

--
-- Indexes for table `problem`
--
ALTER TABLE `problem`
  ADD PRIMARY KEY (`problem_id`),
  ADD KEY `criteria_Id` (`criteria_Id`),
  ADD KEY `teacher_problem` (`teacher_id`);

--
-- Indexes for table `problem_assignment`
--
ALTER TABLE `problem_assignment`
  ADD PRIMARY KEY (`problem_assignment_id`),
  ADD KEY `teacher_id` (`teacher_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `problem_id` (`problem_id`),
  ADD KEY `grader_id` (`grader_id`);

--
-- Indexes for table `teacher_student_module`
--
ALTER TABLE `teacher_student_module`
  ADD PRIMARY KEY (`teacher_id`,`student_id`,`module_id`),
  ADD KEY `teacher_id` (`teacher_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `module_id` (`module_id`);

--
-- Indexes for table `theory`
--
ALTER TABLE `theory`
  ADD PRIMARY KEY (`theory_id`),
  ADD KEY `criteria_Id` (`criteria_Id`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- Indexes for table `theory_assignment`
--
ALTER TABLE `theory_assignment`
  ADD PRIMARY KEY (`theory_assignment_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `theory_id` (`theory_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `criteria`
--
ALTER TABLE `criteria`
  MODIFY `criteria_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `evaluation`
--
ALTER TABLE `evaluation`
  MODIFY `evaluation_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `module`
--
ALTER TABLE `module`
  MODIFY `module_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `problem`
--
ALTER TABLE `problem`
  MODIFY `problem_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `problem_assignment`
--
ALTER TABLE `problem_assignment`
  MODIFY `problem_assignment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `theory`
--
ALTER TABLE `theory`
  MODIFY `theory_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `theory_assignment`
--
ALTER TABLE `theory_assignment`
  MODIFY `theory_assignment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `module` FOREIGN KEY (`module_id`) REFERENCES `module` (`module_id`);

--
-- Constraints for table `criteria`
--
ALTER TABLE `criteria`
  ADD CONSTRAINT `category` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`);

--
-- Constraints for table `evaluation`
--
ALTER TABLE `evaluation`
  ADD CONSTRAINT `criteria` FOREIGN KEY (`criteria_Id`) REFERENCES `criteria` (`criteria_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `instructor` FOREIGN KEY (`instructor_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student` FOREIGN KEY (`student_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `problem`
--
ALTER TABLE `problem`
  ADD CONSTRAINT `criteria_id` FOREIGN KEY (`criteria_Id`) REFERENCES `criteria` (`criteria_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `teacher_problem` FOREIGN KEY (`teacher_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `problem_assignment`
--
ALTER TABLE `problem_assignment`
  ADD CONSTRAINT `grader_id` FOREIGN KEY (`grader_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `problem_assignment_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `problem_id` FOREIGN KEY (`problem_id`) REFERENCES `problem` (`problem_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_id` FOREIGN KEY (`student_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `teacher_student_module`
--
ALTER TABLE `teacher_student_module`
  ADD CONSTRAINT `teacher_student_module_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `teacher_student_module_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `teacher_student_module_ibfk_3` FOREIGN KEY (`module_id`) REFERENCES `module` (`module_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `theory`
--
ALTER TABLE `theory`
  ADD CONSTRAINT `teacher_theory` FOREIGN KEY (`teacher_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `theory_ibfk_1` FOREIGN KEY (`criteria_Id`) REFERENCES `criteria` (`criteria_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `theory_assignment`
--
ALTER TABLE `theory_assignment`
  ADD CONSTRAINT `studen` FOREIGN KEY (`student_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `theory_id` FOREIGN KEY (`theory_id`) REFERENCES `theory` (`theory_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
