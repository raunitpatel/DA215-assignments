-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 26, 2024 at 09:37 AM
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
-- Database: `hospital_management_system`
--

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
