-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 25.02.2021 klo 14:39
-- Palvelimen versio: 10.3.27-MariaDB-0+deb10u1
-- PHP Version: 7.3.19-1~deb10u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sote_kasvu_2`
--

--
-- Vedos taulusta `user`
--

INSERT INTO `user` (`user_id`, `email`, `password`, `role`, `first_name`, `last_name`) VALUES
(1, 'someone@example.com', '$2b$10$xMP0yVK3GyR8Seuq2czyEOctMUo39LIkWJ5ExYa8DkHCzyue0pHhG', 'admin', 'jaska', 'jokunen'),
(2, 'matti.mallioppilas@edu.hel.fi', '$2b$10$3nz60uB/sXMlca5J469hKegwS/trEvNJZV0HAgTJrc0HbQhMAdkeq', 'student', 'matti', 'mallioppilas'),
(3, 'olli.opettaja@edu.hel.fi', '$2b$10$grMhWF/DOjzVHEyGJSldSOFUdEWGxpKPZ2oG7UB5lHbixf6SU0u76', 'teacher', 'olli', 'opettaja'),
(4, 'teemu.tyopaikkaohjaaja@edu.hel.fi', '$2b$10$E58vIrrm4/IOmO7.tw8SruSaFzAyL.kOYLH6c2EZ32xYm3xSFPUOu', 'instructor', 'Teemu', 'Työpaikkaohjaaja'),
(5, 'markku.maalainen@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'markku', 'maalainen'),
(6, 'outi.oodi@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'outi', 'oodi'),
(7, 'katja.kataja@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'katja', 'kataja'),
(8, 'ossi.oittaa@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'ossi', 'oittaa'),
(9, 'jukka.jukola@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'jukka', 'jukola'),
(10, 'aino.autuas@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'aino', 'autuas'),
(11, 'silja.suomalainen@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'silja', 'suomalainen'),
(12, 'seppo.sieppo@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'seppo', 'sieppo'),
(13, 'eila.erakko@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'eila', 'erakko'),
(14, 'rami.reipas@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'rami', 'reipas'),
(15, 'katri.koivu@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'katri', 'koivu'),
(16, 'arto.sammal@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'arto', 'sammal'),
(17, 'alisa.virtanen@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'alisa', 'virtanen'),
(18, 'leevi.korhonen@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'leevi', 'korhonen'),
(19, 'amanda.hamalainen@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'amanda', 'hamalainen'),
(20, 'niko.salminen@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'niko', 'salminen'),
(21, 'eeva.saarinen@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'eeva', 'saarinen'),
(22, 'pasi.niemi@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'pasi', 'niemi'),
(23, 'elisa.rantanen@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'elisa', 'rantanen'),
(24, 'esa.savolainen@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'esa', 'savolainen'),
(25, 'heidi.kallio@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'heidi', 'kallio'),
(26, 'riku.koivisto@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'riku', 'koivisto'),
(27, 'hanna.rantala@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'hanna', 'rantala'),
(28, 'harri.ahola@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'harri', 'ahola'),
(29, 'ilona.kokko@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'ilona', 'kokko'),
(30, 'simo.kuusisto@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'simo', 'kuusisto'),
(31, 'hyacinth.bucket@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'hyacinth', 'bucket'),
(32, 'jaakko.korpela@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'jaakko', 'korpela'),
(33, 'satu.rinne@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'satu', 'rinne'),
(34, 'kalle.koski@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'kalle', 'koski');

--
-- Vedos taulusta `problem`
--

INSERT INTO `problem` (`problem_id`, `criteria_Id`, `file`, `text`, `teacher_id`, `hidden`) VALUES
(1, 1, NULL, 'ongelmanratkaisutehtävän teksti 1-1', 3, 0),
(2, 7, NULL, 'ongelmanratkaisutehtävän teksti 2-2', 3, 0),
(3, 3, NULL, 'ongelmanratkaisutehtävän teksti 3-3', 3, 0),
(4, 4, NULL, 'ongelmanratkaisutehtävän teksti 4-4', 3, 0),
(5, 5, NULL, 'ongelmanratkaisutehtävän teksti 5-5', 3, 0),
(6, 6, NULL, 'ongelmanratkaisutehtävän teksti 6-6', 3, 0),
(7, 7, NULL, 'ongelmanratkaisutehtävän teksti 7-7', 3, 0),
(8, 8, NULL, 'ongelmanratkaisutehtävän teksti 8-8', 3, 0),
(9, 9, NULL, 'ongelmanratkaisutehtävän teksti 9-9', 3, 0),
(10, 1, NULL, 'ongelmanratkaisutehtävän teksti 10-1', 3, 0),
(11, 2, NULL, 'ongelmanratkaisutehtävän teksti 11-2', 3, 0),
(12, 3, NULL, 'ongelmanratkaisutehtävän teksti 12-3', 3, 0),
(13, 4, NULL, 'ongelmanratkaisutehtävän teksti 13-4', 3, 0),
(14, 5, NULL, 'ongelmanratkaisutehtävän teksti 14-5', 3, 0),
(15, 6, NULL, 'ongelmanratkaisutehtävän teksti 15-6', 3, 0),
(16, 7, NULL, 'ongelmanratkaisutehtävän teksti 16-7', 3, 0),
(17, 8, NULL, 'ongelmanratkaisutehtävän teksti 17-8', 3, 0),
(18, 9, NULL, 'ongelmanratkaisutehtävän teksti 18-9', 3, 0),
(19, 1, NULL, 'ongelmanratkaisutehtävän teksti 19-1', 3, 0),
(20, 2, NULL, 'ongelmanratkaisutehtävän teksti 20-2', 3, 0),
(21, 3, NULL, 'ongelmanratkaisutehtävän teksti 21-3', 3, 0),
(22, 4, NULL, 'ongelmanratkaisutehtävän teksti 22-4', 3, 0),
(23, 5, NULL, 'ongelmanratkaisutehtävän teksti 23-5', 3, 0),
(24, 6, NULL, 'ongelmanratkaisutehtävän teksti 24-6', 3, 0),
(25, 7, NULL, 'ongelmanratkaisutehtävän teksti 25-7', 3, 0);

--
-- Vedos taulusta `problem_assignment`
--

INSERT INTO `problem_assignment` (`problem_assignment_id`, `problem_id`, `student_id`, `assign_date`, `submission_file`, `submission_text`, `submission_time`, `grade`, `evaluation`, `evaluation_datetime`) VALUES
(1, 1, 2, '2020-10-29 10:59:39', NULL, 'ongelmaratkaisun tehtävä 1', '2020-10-31 11:00:00', 3, NULL, NULL),
(2, 2, 5, '2020-10-29 12:45:16', NULL, 'ongelmaratkaisun tehtävä 2', '2020-10-31 11:00:00', 3, NULL, NULL),
(3, 2, 6, '2020-10-30 13:25:45', NULL, 'ongelmaratkaisun tehtävä 2', '2020-11-01 11:00:00', 4, NULL, NULL),
(4, 3, 7, '2020-10-30 14:45:21', NULL, 'ongelmaratkaisun tehtävä 3', '2020-11-01 11:00:00', 3, NULL, NULL),
(5, 4, 7, '2020-10-31 10:25:33', NULL, 'ongelmaratkaisun tehtävä 3', '2020-11-02 11:00:00', 4, NULL, NULL),
(6, 3, 8, '2020-10-31 10:45:15', NULL, 'ongelmaratkaisun tehtävä 4', '2020-11-02 11:00:00', 5, NULL, NULL),
(7, 4, 8, '2020-10-31 13:45:56', NULL, 'ongelmaratkaisun tehtävä 4', '2020-11-02 11:00:00', 5, NULL, NULL),
(8, 4, 9, '2020-11-02 14:55:42', NULL, 'ongelmaratkaisun tehtävä 5', '2020-11-04 11:00:00', 2, NULL, NULL),
(9, 5, 10, '2020-11-02 11:45:26', NULL, 'ongelmaratkaisun tehtävä 5', '2020-11-04 11:00:00', 3, NULL, NULL),
(10, 6, 11, '2020-11-02 11:50:43', NULL, 'ongelmaratkaisun tehtävä 6', '2020-11-04 11:00:00', 4, NULL, NULL);

--
-- Vedos taulusta `teacher_student_module`
--

INSERT INTO `teacher_student_module` (`teacher_id`, `student_id`, `module_id`, `task_type`) VALUES
(3, 2, 1, 't'),
(3, 2, 1, 'p'),
(4, 2, 1, 'e'),
(3, 5, 2, 't'),
(3, 5, 2, 'p'),
(4, 5, 2, 'e'),
(3, 6, 2, 't'),
(3, 6, 2, 'p'),
(3, 7, 1, 't'),
(3, 7, 1, 'p'),
(4, 7, 1, 'e'),
(3, 8, 2, 't'),
(3, 8, 2, 'p'),
(3, 9, 1, 't'),
(3, 9, 1, 'p'),
(4, 9, 1, 'e'),
(3, 10, 2, 't'),
(3, 10, 2, 'p'),
(3, 11, 1, 't'),
(3, 11, 1, 'p'),
(4, 11, 1, 'e');

--
-- Vedos taulusta `theory`
--

INSERT INTO `theory` (`theory_id`, `file`, `criteria_Id`, `text`, `teacher_id`, `hidden`) VALUES
(1, NULL, 1, 'teoriatehtävä 1-1', 3, 0),
(2, NULL, 7, 'teoriatehtävä 2-2', 3, 0),
(3, NULL, 3, 'teoriatehtävä 3-3', 3, 0),
(4, NULL, 4, 'teoriatehtävä 4-4', 3, 0),
(5, NULL, 5, 'teoriatehtävä 5-5', 3, 0),
(6, NULL, 6, 'teoriatehtävä 6-6', 3, 0),
(7, NULL, 7, 'teoriatehtävä 7-7', 3, 0);

--
-- Vedos taulusta `theory_assignment`
--

INSERT INTO `theory_assignment` (`theory_assignment_id`, `theory_id`, `student_id`, `assign_date`, `submission_file`, `submission_text`, `submission_time`, `self_grade`, `self_evaluation_text`, `self_evaluation_datetime`, `grade`, `evaluation`, `evaluation_datetime`) VALUES
(1, 1, 2, '2020-10-29 10:59:39', NULL, 'teoriatehtävä 1', '2020-11-01 12:00:00', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 2, 5, '2020-10-29 12:45:16', NULL, 'teoriatehtävä 1', '2020-11-01 12:00:00', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 3, 6, '2020-10-30 13:25:45', NULL, 'teoriatehtävä 1', '2020-11-02 12:00:00', NULL, NULL, NULL, NULL, NULL, NULL),
(4, 4, 7, '2020-10-30 14:45:21', NULL, 'teoriatehtävä 1', '2020-11-02 12:00:00', NULL, NULL, NULL, NULL, NULL, NULL),
(5, 5, 8, '2020-10-31 10:45:15', NULL, 'teoriatehtävä 1', '2020-11-03 12:00:00', NULL, NULL, NULL, NULL, NULL, NULL),
(6, 6, 9, '2020-11-02 14:55:42', NULL, 'teoriatehtävä 1', '2020-11-05 12:00:00', NULL, NULL, NULL, NULL, NULL, NULL),
(7, 7, 10, '2020-11-02 11:45:26', NULL, 'teoriatehtävä 1', '2020-11-05 12:00:00', NULL, NULL, NULL, NULL, NULL, NULL),
(8, 7, 11, '2020-11-02 11:50:43', NULL, 'teoriatehtävä 1', '2020-11-05 12:00:00', NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Vedos taulusta `evaluation`
--

INSERT INTO `evaluation` (`evaluation_id`, `criteria_Id`, `student_id`, `instructor_id`, `evaluation_text`, `evaluation_date`) VALUES
(1, 1, 2, 4, 'palaute työpaikkaohjaajalta', '2020-12-15 14:00:00'),
(2, 1, 5, 4, 'palaute työpaikkaohjaajalta', '2020-12-15 14:00:00'),
(3, 1, 6, 4, 'palaute työpaikkaohjaajalta', '2020-12-15 14:00:00'),
(4, 1, 7, 4, 'palaute työpaikkaohjaajalta', '2020-12-15 14:00:00'),
(5, 1, 8, 4, 'palaute työpaikkaohjaajalta', '2020-12-15 14:00:00'),
(6, 7, 9, 4, 'palaute työpaikkaohjaajalta', '2020-12-15 14:00:00'),
(7, 1, 10, 4, 'palaute työpaikkaohjaajalta', '2020-12-15 14:00:00'),
(8, 1, 11, 4, 'palaute työpaikkaohjaajalta', '2020-12-15 14:00:00');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
