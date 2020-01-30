-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 25, 2019 at 09:43 PM
-- Server version: 5.7.28-0ubuntu0.19.04.2
-- PHP Version: 7.2.24-0ubuntu0.19.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `koboraa`
--
CREATE DATABASE IF NOT EXISTS `koboraa` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `koboraa`;

-- --------------------------------------------------------

--
-- Table structure for table `building`
--
-- Creation: Nov 20, 2019 at 09:25 AM
--

CREATE TABLE `building` (
  `buildingID` int(5) NOT NULL,
  `buildID` varchar(50) NOT NULL,
  `buildingName` varchar(90) NOT NULL,
  `buildingCity` varchar(20) NOT NULL,
  `buildingEstate` varchar(20) NOT NULL,
  `ownerID` int(5) NOT NULL,
  `roomCapacity` int(3) NOT NULL,
  `caretakerName` varchar(50) DEFAULT NULL,
  `caretakerNo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `building`:
--

--
-- Dumping data for table `building`
--

INSERT INTO `building` (`buildingID`, `buildID`, `buildingName`, `buildingCity`, `buildingEstate`, `ownerID`, `roomCapacity`, `caretakerName`, `caretakerNo`) VALUES
(1, 'kbsiw5487', 'Siwaka Plaza', 'Nairobi', 'West Madaraka', 10, 12, 'Karis', 71245678),
(2, 'kbold5420', 'Old Mutual Building', 'Nairobi', 'CBD', 10, 21, 'Old Mutual', 2043201),
(5, 'kbcap5402', 'capito', 'nai', '868', 14, 69, 'amos', 123456789),
(6, 'kbpha5480', 'Phase 1', 'Nairobi', 'Mada', 10, 12, 'Su', 712345678);

-- --------------------------------------------------------

--
-- Table structure for table `complaint`
--
-- Creation: Nov 20, 2019 at 09:25 AM
--

CREATE TABLE `complaint` (
  `complaintID` int(5) NOT NULL,
  `complaint` text NOT NULL,
  `complaintTime` bigint(10) NOT NULL,
  `buildID` varchar(15) NOT NULL,
  `buildingID` int(5) NOT NULL,
  `ownerID` int(5) NOT NULL,
  `buildingName` varchar(90) NOT NULL,
  `status` int(2) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `complaint`:
--

--
-- Dumping data for table `complaint`
--

INSERT INTO `complaint` (`complaintID`, `complaint`, `complaintTime`, `buildID`, `buildingID`, `ownerID`, `buildingName`, `status`) VALUES
(1, 'Tenant in HG1 is unruly!', 1543362176, 'kbsiw5487', 1, 2, 'Siwaka Plaza', 1),
(2, 'No water!', 1543363175, 'kbsiw5487', 1, 2, 'Siwaka Plaza', 1);

-- --------------------------------------------------------

--
-- Table structure for table `conpay`
--
-- Creation: Nov 20, 2019 at 09:25 AM
--

CREATE TABLE `conpay` (
  `ID` int(5) NOT NULL,
  `transactionID` varchar(20) NOT NULL,
  `buildID` varchar(15) NOT NULL,
  `buildingID` int(5) NOT NULL,
  `ownerID` int(5) NOT NULL,
  `buildingName` varchar(90) NOT NULL,
  `rentalNumber` varchar(10) DEFAULT NULL,
  `amount` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `conpay`:
--   `buildingID`
--       `building` -> `buildingID`
--

--
-- Dumping data for table `conpay`
--

INSERT INTO `conpay` (`ID`, `transactionID`, `buildID`, `buildingID`, `ownerID`, `buildingName`, `rentalNumber`, `amount`) VALUES
(1, 'UJYUIYSYU1234', 'kbsiw5487', 1, 2, 'Siwaka Plaza', 'HG2', 15000),
(2, 'KH456GT11', 'kbpha5480', 6, 2, 'Phase 1', 'HF1', 15000),
(3, 'HGFRT4567', 'kbsiw5487', 1, 2, 'Siwaka Plaza', 'HG1', 15000),
(4, 'UJYUIYSYU1234', 'kbsiw5487', 1, 2, 'Siwaka Plaza', 'HG2', 15000);

-- --------------------------------------------------------

--
-- Table structure for table `prepay`
--
-- Creation: Nov 20, 2019 at 09:25 AM
--

CREATE TABLE `prepay` (
  `ID` int(5) NOT NULL,
  `transactionID` varchar(20) NOT NULL,
  `buildID` varchar(15) NOT NULL,
  `buildingID` int(5) NOT NULL,
  `ownerID` int(5) NOT NULL,
  `buildingName` varchar(90) NOT NULL,
  `rentalNumber` varchar(10) DEFAULT NULL,
  `amount` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `prepay`:
--

--
-- Dumping data for table `prepay`
--

INSERT INTO `prepay` (`ID`, `transactionID`, `buildID`, `buildingID`, `ownerID`, `buildingName`, `rentalNumber`, `amount`) VALUES
(1, 'HGFRT4567', 'kbsiw5487', 1, 2, 'Siwaka Plaza', 'HG1', 15000),
(2, 'UJYUIYSYU1234', 'kbsiw5487', 1, 2, 'Siwaka Plaza', 'HG2', 15000),
(3, 'KH456GT11', 'kbpha5480', 6, 2, 'Phase 1', 'HF1', 15000);

-- --------------------------------------------------------

--
-- Table structure for table `tenant`
--
-- Creation: Nov 20, 2019 at 09:25 AM
--

CREATE TABLE `tenant` (
  `tenantID` int(5) NOT NULL,
  `tenantName` varchar(90) NOT NULL,
  `tenantPhone` int(10) NOT NULL,
  `tenantEmail` varchar(50) NOT NULL,
  `buildingID` int(5) NOT NULL,
  `ownerID` int(5) NOT NULL,
  `rentalNumber` varchar(10) DEFAULT NULL,
  `payStatus` int(2) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `tenant`:
--   `buildingID`
--       `building` -> `buildingID`
--

--
-- Dumping data for table `tenant`
--

INSERT INTO `tenant` (`tenantID`, `tenantName`, `tenantPhone`, `tenantEmail`, `buildingID`, `ownerID`, `rentalNumber`, `payStatus`) VALUES
(1, 'Murage Muraguri', 720533799, 'amosmurage56@gmail.com', 1, 2, 'HG1', 0),
(2, 'Brian Mulei', 729468786, 'bmukshi@gmail.com', 1, 2, 'HG2', 0),
(4, 'Nicodemus Opon', 707123456, 'nicodemusopon@gmail.com', 1, 2, 'HF1', 0),
(5, 'Alex', 72649568, 'alex@yahoo.com', 6, 2, 'HF1', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--
-- Creation: Nov 20, 2019 at 09:25 AM
--

CREATE TABLE `users` (
  `userID` int(5) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `userMail` varchar(50) NOT NULL,
  `userPass` varchar(50) NOT NULL,
  `designation` int(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `users`:
--

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userID`, `firstName`, `lastName`, `userMail`, `userPass`, `designation`) VALUES
(3, 'Nicodemus', 'Opon', 'cbsoftlabke@gmail.com', '410ec15153a6dff0bed851467309bcbd', 0),
(5, 'Admin', 'Koboraa', 'admin@kobora.com', '098f6bcd4621d373cade4e832627b4f6', 1),
(10, 'B', 'Mukshi', 'bmukshi@gmail.com', '098f6bcd4621d373cade4e832627b4f6', 0),
(12, 'Amos ', 'Murage', 'admin@koboraa.com', '098f6bcd4621d373cade4e832627b4f6', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `building`
--
ALTER TABLE `building`
  ADD PRIMARY KEY (`buildingID`);

--
-- Indexes for table `complaint`
--
ALTER TABLE `complaint`
  ADD PRIMARY KEY (`complaintID`);

--
-- Indexes for table `conpay`
--
ALTER TABLE `conpay`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `b_id` (`buildingID`);

--
-- Indexes for table `prepay`
--
ALTER TABLE `prepay`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tenant`
--
ALTER TABLE `tenant`
  ADD PRIMARY KEY (`tenantID`),
  ADD KEY `buildingID` (`buildingID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `conpay`
--
ALTER TABLE `conpay`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `prepay`
--
ALTER TABLE `prepay`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `conpay`
--
ALTER TABLE `conpay`
  ADD CONSTRAINT `b_id` FOREIGN KEY (`buildingID`) REFERENCES `building` (`buildingID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tenant`
--
ALTER TABLE `tenant`
  ADD CONSTRAINT `buildingID` FOREIGN KEY (`buildingID`) REFERENCES `building` (`buildingID`) ON DELETE CASCADE ON UPDATE CASCADE;
