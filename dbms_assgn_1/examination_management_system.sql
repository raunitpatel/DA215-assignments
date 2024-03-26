-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 26, 2024 at 09:36 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `exam_management_system`
--
CREATE DATABASE IF NOT EXISTS `exam_management_system` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `exam_management_system`;

-- --------------------------------------------------------

--
-- Table structure for table `choose`
--

CREATE TABLE `choose` (
  `sid` varchar(100) NOT NULL,
  `did` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `choose`
--

INSERT INTO `choose` (`sid`, `did`) VALUES
('megha@123', 'd102'),
('raunit1995', 'd101'),
('tanya@123', 'd102');

-- --------------------------------------------------------

--
-- Table structure for table `dates`
--

CREATE TABLE `dates` (
  `did` varchar(100) NOT NULL,
  `starttime` time DEFAULT NULL,
  `endtime` time DEFAULT NULL,
  `dates` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dates`
--

INSERT INTO `dates` (`did`, `starttime`, `endtime`, `dates`) VALUES
('d101', '12:00:00', '12:05:00', '2024-02-28'),
('d102', '10:30:00', '11:40:00', '2024-03-07'),
('d103', '10:00:00', '12:00:00', '2024-03-09'),
('d104', '15:56:00', '17:54:00', '2024-03-30'),
('d105', '16:10:00', '16:18:00', '2024-03-04');

-- --------------------------------------------------------

--
-- Table structure for table `exam`
--

CREATE TABLE `exam` (
  `eid` varchar(100) NOT NULL,
  `ename` varchar(100) DEFAULT NULL,
  `fees` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exam`
--

INSERT INTO `exam` (`eid`, `ename`, `fees`) VALUES
('abc123', 'jee', 1000),
('exam02', 'neet', 1000),
('exam03', 'gate', 2000),
('exam10', 'board', 1000),
('net', 'exam04', 1000);

-- --------------------------------------------------------

--
-- Table structure for table `has_dates`
--

CREATE TABLE `has_dates` (
  `eid` varchar(100) NOT NULL,
  `did` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `has_dates`
--

INSERT INTO `has_dates` (`eid`, `did`) VALUES
('abc123', 'd101'),
('abc123', 'd102'),
('exam02', 'd101'),
('exam03', 'd101'),
('exam03', 'd103'),
('exam10', 'd105');

-- --------------------------------------------------------

--
-- Table structure for table `has_questions`
--

CREATE TABLE `has_questions` (
  `eid` varchar(100) NOT NULL,
  `qid` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `has_questions`
--

INSERT INTO `has_questions` (`eid`, `qid`) VALUES
('abc123', 'q101'),
('abc123', 'q201'),
('abc123', 'q202'),
('abc123', 'q203'),
('abc123', 'q204'),
('abc123', 'q205'),
('exam02', 'q301'),
('exam02', 'q302'),
('exam02', 'q303'),
('exam02', 'q304'),
('exam03', 'q110');

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `qid` varchar(100) NOT NULL,
  `qcontent` varchar(100) DEFAULT NULL,
  `qsolutions` varchar(100) DEFAULT NULL,
  `difficulty` int(11) DEFAULT NULL,
  `qexp` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`qid`, `qcontent`, `qsolutions`, `difficulty`, `qexp`) VALUES
('q101', 'What is Your name', 'raunit', 7, 4),
('q110', '1+2', '3', 3, 4),
('q201', '1+4', '5', 5, 4),
('q202', '1+5', '6', 5, 4),
('q203', 'king of jungle', 'lion', 5, 2),
('q204', 'pm of india', 'modi', 8, 3),
('q205', 'president of india', 'draupadi murmu', 10, 4),
('q301', 'biggest animal', 'whale', 5, 3),
('q302', 'biggest bone in human body', 'femur', 7, 5),
('q303', 'smallest bone in human body', 'stapes', 8, 3),
('q304', 'powerhouse of the cell', 'mitochondria', 8, 4);

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

CREATE TABLE `register` (
  `sid` varchar(100) NOT NULL,
  `eid` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `register`
--

INSERT INTO `register` (`sid`, `eid`) VALUES
('megha@123', 'abc123'),
('raunit1995', 'abc123'),
('raunit1995', 'exam02'),
('tanya@123', 'abc123');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `sid` varchar(100) NOT NULL,
  `sname` varchar(100) DEFAULT NULL,
  `phno` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`sid`, `sname`, `phno`) VALUES
('megha@123', 'Megha Rani', '8081334412'),
('raunit1995', 'Raunit Patel', '7759938415'),
('tanya@123', 'Tanya Kumari', '1234567890');

-- --------------------------------------------------------

--
-- Table structure for table `submissions`
--

CREATE TABLE `submissions` (
  `eid` varchar(100) NOT NULL,
  `qid` varchar(100) NOT NULL,
  `sid` varchar(100) NOT NULL,
  `answer` varchar(100) DEFAULT NULL,
  `time_taken` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `submissions`
--

INSERT INTO `submissions` (`eid`, `qid`, `sid`, `answer`, `time_taken`) VALUES
('abc123', 'q101', 'megha@123', 'raunit', 29),
('abc123', 'q101', 'raunit1995', 'raunit', 7),
('abc123', 'q101', 'tanya@123', 'raunit', 7),
('abc123', 'q201', 'megha@123', '5', 2),
('abc123', 'q201', 'raunit1995', '5', 3),
('abc123', 'q201', 'tanya@123', '5', 6),
('abc123', 'q202', 'megha@123', '6', 3),
('abc123', 'q202', 'raunit1995', '6', 3),
('abc123', 'q202', 'tanya@123', '6', 4),
('abc123', 'q203', 'megha@123', 'lion', 5),
('abc123', 'q203', 'raunit1995', 'lion', 4),
('abc123', 'q203', 'tanya@123', 'lion', 5),
('abc123', 'q204', 'megha@123', 'modi', 4),
('abc123', 'q204', 'raunit1995', 'draupadi murmu', 7),
('abc123', 'q204', 'tanya@123', 'madsas', 6),
('abc123', 'q205', 'megha@123', 'murmu', 4),
('abc123', 'q205', 'raunit1995', 'draupadi murmu', 7),
('abc123', 'q205', 'tanya@123', 'fsfs', 4),
('exam02', 'q301', 'raunit1995', 'whale', 7),
('exam02', 'q302', 'raunit1995', 'femur', 8),
('exam02', 'q303', 'raunit1995', 'stapes', 5),
('exam02', 'q304', 'raunit1995', 'mito', 6);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `name` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password_data` varchar(100) NOT NULL,
  `role` enum('Student','Admin') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`name`, `username`, `password_data`, `role`) VALUES
('Abhishek Kumar', 'abhishek@123', '123456', 'Admin'),
('Megha Rani', 'megha@123', '123456', 'Student'),
('Raunit Patel', 'raunit1995', '123456', 'Student'),
('Tanya Kumari', 'tanya@123', '123456', 'Student');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `choose`
--
ALTER TABLE `choose`
  ADD PRIMARY KEY (`sid`,`did`),
  ADD KEY `did` (`did`);

--
-- Indexes for table `dates`
--
ALTER TABLE `dates`
  ADD PRIMARY KEY (`did`);

--
-- Indexes for table `exam`
--
ALTER TABLE `exam`
  ADD PRIMARY KEY (`eid`);

--
-- Indexes for table `has_dates`
--
ALTER TABLE `has_dates`
  ADD PRIMARY KEY (`eid`,`did`),
  ADD KEY `did` (`did`);

--
-- Indexes for table `has_questions`
--
ALTER TABLE `has_questions`
  ADD PRIMARY KEY (`eid`,`qid`),
  ADD KEY `qid` (`qid`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`qid`);

--
-- Indexes for table `register`
--
ALTER TABLE `register`
  ADD PRIMARY KEY (`sid`,`eid`),
  ADD KEY `eid` (`eid`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`sid`);

--
-- Indexes for table `submissions`
--
ALTER TABLE `submissions`
  ADD PRIMARY KEY (`eid`,`qid`,`sid`),
  ADD KEY `qid` (`qid`),
  ADD KEY `sid` (`sid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `choose`
--
ALTER TABLE `choose`
  ADD CONSTRAINT `choose_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`),
  ADD CONSTRAINT `choose_ibfk_2` FOREIGN KEY (`did`) REFERENCES `dates` (`did`);

--
-- Constraints for table `has_dates`
--
ALTER TABLE `has_dates`
  ADD CONSTRAINT `has_dates_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `exam` (`eid`),
  ADD CONSTRAINT `has_dates_ibfk_2` FOREIGN KEY (`did`) REFERENCES `dates` (`did`);

--
-- Constraints for table `has_questions`
--
ALTER TABLE `has_questions`
  ADD CONSTRAINT `has_questions_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `exam` (`eid`),
  ADD CONSTRAINT `has_questions_ibfk_2` FOREIGN KEY (`qid`) REFERENCES `question` (`qid`);

--
-- Constraints for table `register`
--
ALTER TABLE `register`
  ADD CONSTRAINT `register_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`),
  ADD CONSTRAINT `register_ibfk_2` FOREIGN KEY (`eid`) REFERENCES `exam` (`eid`);

--
-- Constraints for table `submissions`
--
ALTER TABLE `submissions`
  ADD CONSTRAINT `submissions_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `exam` (`eid`),
  ADD CONSTRAINT `submissions_ibfk_2` FOREIGN KEY (`qid`) REFERENCES `question` (`qid`),
  ADD CONSTRAINT `submissions_ibfk_3` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`);
--
-- Database: `hospital_management_system`
--
CREATE DATABASE IF NOT EXISTS `hospital_management_system` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `hospital_management_system`;

-- --------------------------------------------------------

--
-- Table structure for table `contracts_with`
--

CREATE TABLE `contracts_with` (
  `pharmaceutical_company_name` varchar(100) NOT NULL,
  `pharmacy_name` varchar(100) NOT NULL,
  `Start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `supervisor` varchar(100) DEFAULT NULL,
  `text` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contracts_with`
--

INSERT INTO `contracts_with` (`pharmaceutical_company_name`, `pharmacy_name`, `Start_date`, `end_date`, `supervisor`, `text`) VALUES
('para', 'Abhishek Kumar', '2023-02-23', '2025-02-28', 'Chandan Kumar', 'the contract can be expanded\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `ssn` varchar(100) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `specialty` varchar(100) DEFAULT NULL,
  `Years_exp` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`ssn`, `name`, `specialty`, `Years_exp`) VALUES
('doctor_1', 'Tanya Kumari', 'Derma', 11),
('doctor_3', 'sahil raj', 'Neuro', 10),
('doctor_4', 'marala', 'Dental', 10);

-- --------------------------------------------------------

--
-- Table structure for table `drug`
--

CREATE TABLE `drug` (
  `Trade_name` varchar(100) NOT NULL,
  `formula` varchar(100) DEFAULT NULL,
  `Company_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `drug`
--

INSERT INTO `drug` (`Trade_name`, `formula`, `Company_name`) VALUES
('ceta', 'a+b+c^3', 'para');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `ssn` varchar(100) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `Pri_physician` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`ssn`, `name`, `address`, `Age`, `Pri_physician`) VALUES
('patient_1', 'Raunit Patel', 'Bihar', 21, 'doctor_1'),
('patient_10', 'modi', 'jharkhand', 21, 'doctor_4'),
('patient_2', 'Megha Rani', 'Bihar', 25, 'doctor_1'),
('patient_3', 'jaswanth kumar', 'vishakapatnam', 27, 'doctor_1'),
('patient_4', 'mayank kumar', 'Rajasthan', 19, 'doctor_1'),
('patient_5', 'ayush kumar', 'Patna', 15, 'doctor_1'),
('patient_9', 'mohit yadav', 'Rajasthan', 20, 'doctor_1');

-- --------------------------------------------------------

--
-- Table structure for table `pharmaceutical_company`
--

CREATE TABLE `pharmaceutical_company` (
  `name` varchar(100) NOT NULL,
  `Phone_number` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pharmaceutical_company`
--

INSERT INTO `pharmaceutical_company` (`name`, `Phone_number`) VALUES
('para', '7759968715'),
('terfidonel', '7759968715');

-- --------------------------------------------------------

--
-- Table structure for table `pharmacy`
--

CREATE TABLE `pharmacy` (
  `name` varchar(100) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `Phone_number` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pharmacy`
--

INSERT INTO `pharmacy` (`name`, `address`, `Phone_number`) VALUES
('Abhishek Kumar', 'patna', '7759938715');

-- --------------------------------------------------------

--
-- Table structure for table `prescribes`
--

CREATE TABLE `prescribes` (
  `doctor_ssn` varchar(100) NOT NULL,
  `patient_ssn` varchar(100) NOT NULL,
  `drug_Trade_name` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `date` date DEFAULT NULL,
  `qty` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `prescribes`
--

INSERT INTO `prescribes` (`doctor_ssn`, `patient_ssn`, `drug_Trade_name`, `name`, `date`, `qty`) VALUES
('doctor_1', 'patient_1', 'ceta', 'para', '2024-02-09', 6),
('doctor_1', 'patient_2', 'ceta', 'para', '2024-02-07', 24),
('doctor_1', 'patient_3', 'ceta', 'para', '2024-02-24', 6),
('doctor_1', 'patient_5', 'ceta', 'para', '2024-02-13', 5),
('doctor_1', 'patient_9', 'ceta', 'para', '2024-02-14', 10);

-- --------------------------------------------------------

--
-- Table structure for table `sells`
--

CREATE TABLE `sells` (
  `drug_Trade_name` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `pharmacy_name` varchar(100) NOT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sells`
--

INSERT INTO `sells` (`drug_Trade_name`, `name`, `pharmacy_name`, `price`) VALUES
('ceta', 'para', 'Abhishek Kumar', 1000.00);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password_data` varchar(100) NOT NULL,
  `role` enum('Patient','Doctor','Pharmacist','Company') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password_data`, `role`) VALUES
(14, 'Tanya Kumari', 'tanya@123', '123456', 'Doctor'),
(15, 'Raunit Patel', 'raunit1995', '123456', 'Patient'),
(16, 'Megha Rani', 'megha@123', '123456', 'Patient'),
(17, 'Abhishek Kumar', 'abhishek@123', '123456', 'Pharmacist'),
(18, 'para', 'para@123', '123456', 'Company'),
(19, 'jaswanth kumar', 'jas@123', '123456', 'Patient'),
(20, 'terfidonel', 'terf@123', '123456', 'Company'),
(21, 'mayank kumar', 'mayank@123', '123456', 'Patient'),
(22, 'sahil raj', 'sahil@123', '123456', 'Doctor'),
(23, 'ayush kumar', 'ayush@123', '123456', 'Patient'),
(24, 'marala', 'marala@123', '123456', 'Doctor'),
(25, 'modi', 'modi@123', '123456', 'Patient'),
(26, 'mohit yadav', 'mohit@123', '123456', 'Patient');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contracts_with`
--
ALTER TABLE `contracts_with`
  ADD PRIMARY KEY (`pharmaceutical_company_name`,`pharmacy_name`),
  ADD KEY `pharmacy_name` (`pharmacy_name`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`ssn`);

--
-- Indexes for table `drug`
--
ALTER TABLE `drug`
  ADD PRIMARY KEY (`Trade_name`,`Company_name`),
  ADD KEY `Company_name` (`Company_name`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`ssn`),
  ADD KEY `Pri_physician` (`Pri_physician`);

--
-- Indexes for table `pharmaceutical_company`
--
ALTER TABLE `pharmaceutical_company`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `pharmacy`
--
ALTER TABLE `pharmacy`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `prescribes`
--
ALTER TABLE `prescribes`
  ADD PRIMARY KEY (`doctor_ssn`,`patient_ssn`,`drug_Trade_name`,`name`),
  ADD KEY `patient_ssn` (`patient_ssn`),
  ADD KEY `drug_Trade_name` (`drug_Trade_name`,`name`);

--
-- Indexes for table `sells`
--
ALTER TABLE `sells`
  ADD PRIMARY KEY (`pharmacy_name`,`drug_Trade_name`,`name`),
  ADD KEY `drug_Trade_name` (`drug_Trade_name`,`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contracts_with`
--
ALTER TABLE `contracts_with`
  ADD CONSTRAINT `contracts_with_ibfk_1` FOREIGN KEY (`pharmaceutical_company_name`) REFERENCES `pharmaceutical_company` (`name`),
  ADD CONSTRAINT `contracts_with_ibfk_2` FOREIGN KEY (`pharmacy_name`) REFERENCES `pharmacy` (`name`);

--
-- Constraints for table `drug`
--
ALTER TABLE `drug`
  ADD CONSTRAINT `drug_ibfk_1` FOREIGN KEY (`Company_name`) REFERENCES `pharmaceutical_company` (`name`);

--
-- Constraints for table `patient`
--
ALTER TABLE `patient`
  ADD CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`Pri_physician`) REFERENCES `doctor` (`ssn`);

--
-- Constraints for table `prescribes`
--
ALTER TABLE `prescribes`
  ADD CONSTRAINT `prescribes_ibfk_1` FOREIGN KEY (`doctor_ssn`) REFERENCES `doctor` (`ssn`),
  ADD CONSTRAINT `prescribes_ibfk_2` FOREIGN KEY (`patient_ssn`) REFERENCES `patient` (`ssn`),
  ADD CONSTRAINT `prescribes_ibfk_3` FOREIGN KEY (`drug_Trade_name`,`name`) REFERENCES `drug` (`Trade_name`, `Company_name`);

--
-- Constraints for table `sells`
--
ALTER TABLE `sells`
  ADD CONSTRAINT `sells_ibfk_1` FOREIGN KEY (`drug_Trade_name`,`name`) REFERENCES `drug` (`Trade_name`, `Company_name`),
  ADD CONSTRAINT `sells_ibfk_2` FOREIGN KEY (`pharmacy_name`) REFERENCES `pharmacy` (`name`);
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Dumping data for table `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"relation_lines\":\"true\",\"snap_to_grid\":\"off\",\"angular_direct\":\"direct\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"hospital_management_system\",\"table\":\"sells\"},{\"db\":\"hospital_management_system\",\"table\":\"drug\"},{\"db\":\"hospital_management_system\",\"table\":\"contracts_with\"},{\"db\":\"hospital_management_system\",\"table\":\"users\"},{\"db\":\"hospital_management_system\",\"table\":\"patient\"},{\"db\":\"hospital_management_system\",\"table\":\"prescribes\"},{\"db\":\"hospital_management_system\",\"table\":\"pharmaceutical_company\"},{\"db\":\"hospital_management_system\",\"table\":\"pharmacy\"},{\"db\":\"hospital_management_system\",\"table\":\"doctor\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Dumping data for table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'hospital_management_system', 'doctor', '{\"sorted_col\":\"`doctor`.`Years_exp` DESC\"}', '2024-02-12 16:26:23');

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2024-02-13 11:18:43', '{\"Console\\/Mode\":\"collapse\",\"NavigationWidth\":367}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
