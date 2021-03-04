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
(1, 'someone@example.com', '$2b$10$xMP0yVK3GyR8Seuq2czyEOctMUo39LIkWJ5ExYa8DkHCzyue0pHhG', 'admin', 'Jaska', 'Jokunen'),
(2, 'matti.mallioppilas@edu.hel.fi', '$2b$10$3nz60uB/sXMlca5J469hKegwS/trEvNJZV0HAgTJrc0HbQhMAdkeq', 'student', 'Matti', 'Mallioppilas'),
(3, 'olli.opettaja@edu.hel.fi', '$2b$10$grMhWF/DOjzVHEyGJSldSOFUdEWGxpKPZ2oG7UB5lHbixf6SU0u76', 'teacher', 'Olli', 'Opettaja'),
(4, 'teemu.tyopaikkaohjaaja@edu.hel.fi', '$2b$10$E58vIrrm4/IOmO7.tw8SruSaFzAyL.kOYLH6c2EZ32xYm3xSFPUOu', 'instructor', 'Teemu', 'Työpaikkaohjaaja'),
(5, 'markku.maalainen@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'Markku', 'Maalainen'),
(6, 'outi.oodi@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'Outi', 'Oodi'),
(7, 'katja.kataja@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'Katja', 'Kataja'),
(8, 'ossi.oittaa@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'Ossi', 'Oittaa'),
(9, 'jukka.jukola@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'Jukka', 'Jukola'),
(10, 'aino.autuas@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'Aino', 'Autuas'),
(11, 'silja.suomalainen@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'Silja', 'Suomalainen'),
(12, 'seppo.sieppo@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'Seppo', 'Sieppo'),
(13, 'eila.erakko@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'Eila', 'Erakko'),
(14, 'rami.reipas@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'Rami', 'Reipas'),
(15, 'katri.koivu@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'Katri', 'Koivu'),
(16, 'arto.sammal@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'Arto', 'Sammal'),
(17, 'alisa.virtanen@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'Alisa', 'Virtanen'),
(18, 'leevi.korhonen@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'Leevi', 'Korhonen'),
(19, 'amanda.hamalainen@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'Amanda', 'Hämäläinen'),
(20, 'niko.salminen@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'Niko', 'Salminen'),
(21, 'eeva.saarinen@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'Eeva', 'Saarinen'),
(22, 'pasi.niemi@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'Pasi', 'Niemi'),
(23, 'elisa.rantanen@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'Elisa', 'Rantanen'),
(24, 'esa.savolainen@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'Esa', 'Savolainen'),
(25, 'heidi.kallio@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'Heidi', 'Kallio'),
(26, 'riku.koivisto@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'Riku', 'Koivisto'),
(27, 'hanna.rantala@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'Hanna', 'Rantala'),
(28, 'harri.ahola@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'Harri', 'Ahola'),
(29, 'ilona.kokko@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'Ilona', 'Kokko'),
(30, 'simo.kuusisto@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'Simo', 'Kuusisto'),
(31, 'hyacinth.bucket@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'Hyacinth', 'Bucket'),
(32, 'jaakko.korpela@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'Jaakko', 'Korpela'),
(33, 'satu.rinne@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'Satu', 'Rinne'),
(34, 'kalle.koski@edu.hel.fi', '$2b$10$Fl5o0sRiNis1b94qmm2y8.4NlXBNJmBEmhaZn.OQB.zmcqegwqfFO', 'student', 'Kalle', 'Koski');

--
-- Vedos taulusta `problem`
--

INSERT INTO `problem` (`problem_id`, `criteria_Id`, `file`, `text`, `teacher_id`, `hidden`) VALUES
-- module 1 category 1-10, criteria 1-59
(1, 1, 'ongelmanratkaisutehtävän teksti 1-1', 3, FALSE),
(2, 2, 'ongelmanratkaisutehtävän teksti 2-2', 3, FALSE),
(3, 1, 'ongelmanratkaisutehtävän teksti 3-1', 4, FALSE),
(4, 1, 'ongelmanratkaisutehtävän teksti 4-1', 3, FALSE),
(5, 1, 'ongelmanratkaisutehtävän teksti 5-1', 3, FALSE),
(6, 2, 'ongelmanratkaisutehtävän teksti 6-2', 3, FALSE),
(7, 2, 'ongelmanratkaisutehtävän teksti 7-2', 3, FALSE),
(8, 2, 'ongelmanratkaisutehtävän teksti 8-2', 3, FALSE),
(9, 1, 'ongelmanratkaisutehtävän teksti 9-1', 3, FALSE),
(10, 1, 'ongelmanratkaisutehtävän teksti 10-1', 3, FALSE),
(11, 2, 'ongelmanratkaisutehtävän teksti 11-2', 3, FALSE),
(12, 1, 'ongelmanratkaisutehtävän teksti 12-1', 3, FALSE),
(13, 2, 'ongelmanratkaisutehtävän teksti 13-2', 3, FALSE),
(14, 3, 'ongelmanratkaisutehtävän teksti 14-3', 3, FALSE),
-- module 2 category 11-21, criteria 60-149
(15, 60, 'ongelmanratkaisutehtävän teksti 15-60', 3, FALSE),
(16, 60, 'ongelmanratkaisutehtävän teksti 16-60', 3, FALSE),
(17, 61, 'ongelmanratkaisutehtävän teksti 17-61', 3, FALSE),
(18, 61, 'ongelmanratkaisutehtävän teksti 18-61', 3, FALSE),
(19, 60, 'ongelmanratkaisutehtävän teksti 19-60', 3, FALSE),
(20, 61, 'ongelmanratkaisutehtävän teksti 20-61', 3, FALSE),
(21, 61, 'ongelmanratkaisutehtävän teksti 21-61', 3, FALSE), 
(22, 60, 'ongelmanratkaisutehtävän teksti 22-60', 3, FALSE),
(23, 60, 'ongelmanratkaisutehtävän teksti 23-60', 3, FALSE),
(24, 61, 'ongelmanratkaisutehtävän teksti 24-61', 3, FALSE),
(25, 60, 'ongelmanratkaisutehtävän teksti 25-60', 3, FALSE);

--
-- Vedos taulusta `problem_assignment`
--

INSERT INTO `problem_assignment` (`problem_assignment_id`, `problem_id`, `student_id`, `assign_date`, `submission_file`, `submission_text`, `submission_time`, `grade`, `evaluation`, `evaluation_datetime`) VALUES
(1, 1, 5, '2020-10-29 10:59:39', NULL, "ongelmaratkaisun tehtävä 1-1", '2020-10-31 11:00:00', NULL, NULL, NULL),
(2, 2, 5, '2020-10-29 12:45:16', NULL, "ongelmaratkaisun tehtävä 2-2", '2020-10-31 11:00:00', NULL, NULL, NULL),
(3, 3, 5, '2020-10-30 13:25:45', NULL, "ongelmaratkaisun tehtävä 3-3", '2020-11-01 11:00:00', NULL, NULL, NULL),
(4, 15, 6, '2020-10-30 14:45:21', NULL, "ongelmaratkaisun tehtävä 4-15", '2020-11-01 11:00:00', NULL, NULL, NULL),
(5, 16, 6, '2020-10-31 10:25:33', NULL, "ongelmaratkaisun tehtävä 5-16", '2020-11-02 11:00:00', NULL, NULL, NULL),
(6, 17, 6, '2020-10-31 10:45:15', NULL, "ongelmaratkaisun tehtävä 6-17", '2020-11-02 11:00:00', NULL, NULL, NULL),
(7, 18, 7, '2020-10-31 13:45:56', NULL, "ongelmaratkaisun tehtävä 7-18", '2020-11-02 11:00:00', NULL, NULL, NULL),
(8, 19, 7, '2020-11-02 14:55:42', NULL, "ongelmaratkaisun tehtävä 8-19", '2020-11-04 11:00:00', NULL, NULL, NULL),
(9, 20, 8, '2020-11-02 11:45:26', NULL, "ongelmaratkaisun tehtävä 9-20", '2020-11-04 11:00:00', NULL, NULL, NULL),
(10, 21, 8, '2020-11-02 11:50:43', NULL, "ongelmaratkaisun tehtävä 10-21", '2020-11-04 11:00:00', NULL, NULL, NULL),
(11, 4, 9, '2020-11-02 11:50:43', NULL, "ongelmaratkaisun tehtävä 11-4", '2020-11-04 11:00:00', NULL, NULL, NULL),
(12, 5, 9, '2020-11-02 11:50:43', NULL, "ongelmaratkaisun tehtävä 12-5", '2020-11-04 11:00:00', NULL, NULL, NULL),
(13, 6, 9, '2020-11-02 11:50:43', NULL, "ongelmaratkaisun tehtävä 13-6", '2020-11-04 11:00:00', NULL, NULL, NULL),
(14, 22, 10, '2020-11-02 11:50:43', NULL, "ongelmaratkaisun tehtävä 14-22", '2020-11-04 11:00:00', NULL, NULL, NULL),
(15, 23, 10, '2020-11-02 11:50:43', NULL, "ongelmaratkaisun tehtävä 15-23", '2020-11-04 11:00:00', NULL, NULL, NULL),
(16, 7, 11, '2020-11-02 11:50:43', NULL, "ongelmaratkaisun tehtävä 16-7", '2020-11-04 11:00:00', NULL, NULL, NULL),
(17, 8, 11, '2020-11-02 11:50:43', NULL, "ongelmaratkaisun tehtävä 17-8", '2020-11-04 11:00:00', NULL, NULL, NULL),
(18, 9, 11, '2020-11-02 11:50:43', NULL, "ongelmaratkaisun tehtävä 18-9", '2020-11-04 11:00:00', NULL, NULL, NULL),
(19, 10, 12, '2020-11-02 11:50:43', NULL, "ongelmaratkaisun tehtävä 19-10", '2020-11-04 11:00:00', NULL, NULL, NULL),
(20, 11, 12, '2020-11-02 11:50:43', NULL, "ongelmaratkaisun tehtävä 20-11", '2020-11-04 11:00:00', NULL, NULL, NULL),
(21, 12, 13, '2020-11-02 11:50:43', NULL, "ongelmaratkaisun tehtävä 21-12", '2020-11-04 11:00:00', NULL, NULL, NULL),
(22, 13, 13, '2020-11-02 11:50:43', NULL, "ongelmaratkaisun tehtävä 22-13", '2020-11-04 11:00:00', NULL, NULL, NULL),
(23, 14, 13, '2020-11-02 11:50:43', NULL, "ongelmaratkaisun tehtävä 23-14", '2020-11-04 11:00:00', NULL, NULL, NULL),
(24, 24, 14, '2020-11-02 11:50:43', NULL, "ongelmaratkaisun tehtävä 24-24", '2020-11-04 11:00:00', NULL, NULL, NULL),
(25, 25, 14, '2020-11-02 11:50:43', NULL, "ongelmaratkaisun tehtävä 25-25", '2020-11-04 11:00:00', NULL, NULL, NULL);

--
-- Vedos taulusta `teacher_student_module`
--

INSERT INTO `teacher_student_module` (`teacher_id`, `student_id`, `module_id`, `task_type`) VALUES
(3, 5, 1, 't'),
(3, 5, 1, 'p'),
(4, 5, 1, 'e'),
(3, 6, 2, 't'),
(3, 6, 2, 'p'),
(3, 7, 2, 't'),
(3, 7, 2, 'p'),
(4, 7, 2, 'e'),
(3, 8, 2, 't'),
(3, 8, 2, 'p'),
(3, 9, 1, 't'),
(3, 9, 1, 'p'),
(4, 9, 1, 'e'),
(3, 10, 2, 't'),
(3, 10, 2, 'p'),
(3, 11, 1, 't'),
(3, 11, 1, 'p'),
(4, 11, 1, 'e'),
(3, 12, 1, 't'),
(3, 12, 1, 'p'),
(4, 12, 1, 'e'),
(3, 13, 1, 't'),
(3, 13, 1, 'p'),
(3, 14, 2, 't'),
(3, 14, 2, 'p');

--
-- Vedos taulusta `theory`
--

INSERT INTO `theory` (`theory_id`, `file`, `criteria_Id`, `text`, `teacher_id`, `hidden`) VALUES
-- module 1 category 1-10
(1, 1, 'teoriatehtävä 1-1', 3), -- category 1, criteria 1
(2, 2, 'teoriatehtävä 2-2', 3), -- category 1, criteria 2
(3, 1, 'teoriatehtävä 3-1', 3), -- category 1, criteria 1
(4, 2, 'teoriatehtävä 4-2', 3), -- category 1, criteria 2
(5, 3, 'teoriatehtävä 5-3', 3), -- category 1, criteria 3
-- module 2 category 11-21
(6, 60, 'teoriatehtävä 5-60', 3), -- category 1, criteria 1
(7, 61, 'teoriatehtävä 6-61', 3), -- category 1, criteria 2
(8, 62, 'teoriatehtävä 7-62', 3), -- category 1, criteria 1
(9, 63, 'teoriatehtävä 8-63', 3); -- category 1, criteria 2

--
-- Vedos taulusta `theory_assignment`
--

INSERT INTO `theory_assignment` (`theory_assignment_id`, `theory_id`, `student_id`, `assign_date`, `submission_file`, `submission_text`, `submission_time`, `self_grade`, `self_evaluation_text`, `self_evaluation_datetime`, `grade`, `evaluation`, `evaluation_datetime`) VALUES
(1, 1, 5, '2020-10-29 10:59:39', NULL, "teoriatehtävä 1", '2020-11-01 12:00:00', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 2, 5, '2020-10-29 10:59:39', NULL, "teoriatehtävä 2", '2020-11-01 12:00:00', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 6, 6, '2020-10-29 12:45:16', NULL, "teoriatehtävä 6", '2020-11-01 12:00:00', NULL, NULL, NULL, NULL, NULL, NULL), 
(4, 7, 6, '2020-10-29 12:45:16', NULL, "teoriatehtävä 7", '2020-11-01 12:00:00', NULL, NULL, NULL, NULL, NULL, NULL),
(5, 7, 7, '2020-10-30 13:25:45', NULL, "teoriatehtävä 7", '2020-11-02 12:00:00', NULL, NULL, NULL, NULL, NULL, NULL),
(6, 6, 7, '2020-10-30 13:25:45', NULL, "teoriatehtävä 6", '2020-11-02 12:00:00', NULL, NULL, NULL, NULL, NULL, NULL),
(7, 7, 8, '2020-10-30 14:45:21', NULL, "teoriatehtävä 7", '2020-11-02 12:00:00', NULL, NULL, NULL, NULL, NULL, NULL),
(8, 1, 9, '2020-10-31 10:45:15', NULL, "teoriatehtävä 1", '2020-11-03 12:00:00', NULL, NULL, NULL, NULL, NULL, NULL),
(9, 2, 9, '2020-10-31 10:45:15', NULL, "teoriatehtävä 2", '2020-11-03 12:00:00', NULL, NULL, NULL, NULL, NULL, NULL),
(10, 6, 10, '2020-11-02 14:55:42', NULL, "teoriatehtävä 6", '2020-11-05 12:00:00', NULL, NULL, NULL, NULL, NULL, NULL),
(11, 3, 11, '2020-11-02 11:45:26', NULL, "teoriatehtävä 3", '2020-11-05 12:00:00', NULL, NULL, NULL, NULL, NULL, NULL),
(12, 4, 11, '2020-11-02 11:45:26', NULL, "teoriatehtävä 4", '2020-11-05 12:00:00', NULL, NULL, NULL, NULL, NULL, NULL),
(13, 1, 12, '2020-11-02 11:50:43', NULL, "teoriatehtävä 1", '2020-11-05 12:00:00', NULL, NULL, NULL, NULL, NULL, NULL),
(14, 4, 12, '2020-11-02 11:50:43', NULL, "teoriatehtävä 4", '2020-11-05 12:00:00', NULL, NULL, NULL, NULL, NULL, NULL),
(15, 3, 13, '2020-11-02 11:50:43', NULL, "teoriatehtävä 3", '2020-11-05 12:00:00', NULL, NULL, NULL, NULL, NULL, NULL),
(16, 4, 13, '2020-11-02 11:50:43', NULL, "teoriatehtävä 4", '2020-11-05 12:00:00', NULL, NULL, NULL, NULL, NULL, NULL),
(17, 5, 13, '2020-11-02 11:50:43', NULL, "teoriatehtävä 5", '2020-11-05 12:00:00', NULL, NULL, NULL, NULL, NULL, NULL),
(18, 7, 14, '2020-11-02 11:50:43', NULL, "teoriatehtävä 7", '2020-11-05 12:00:00', NULL, NULL, NULL, NULL, NULL, NULL),
(19, 6, 14, '2020-11-02 11:50:43', NULL, "teoriatehtävä 6", '2020-11-05 12:00:00', NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Vedos taulusta `evaluation`
--

INSERT INTO `evaluation` (`evaluation_id`, `criteria_Id`, `student_id`, `instructor_id`, `evaluation_text`, `evaluation_date`) VALUES
(1, 1, 5, 4, "palaute työpaikkaohjaajalta 1-1", "2020-12-15 14:00:00"),
(2, 61, 7, 4, "palaute työpaikkaohjaajalta 2-61", "2020-12-15 14:00:00"), 
(3, 1, 9, 4, "palaute työpaikkaohjaajalta 3-1", "2020-12-15 14:00:00"),
(4, 3, 11, 4, "palaute työpaikkaohjaajalta 4-3", "2020-12-15 14:00:00"),
(5, 1, 12, 4, "palaute työpaikkaohjaajalta 5-1", "2020-12-15 14:00:00");
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
