-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 05, 2024 at 12:37 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `darsbbq`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `AccountID` int(11) NOT NULL,
  `Username` varchar(500) NOT NULL,
  `Password` varchar(500) NOT NULL,
  `IsAdmin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`AccountID`, `Username`, `Password`, `IsAdmin`) VALUES
(1, 'DarCambal', '12345678', 1),
(2, 'GeorgeB', 'admin', 0),
(3, 'GeorgeB', 'admin', 1),
(6, 'asdasdasd', '1234', 0),
(8, 'notAdmin', '12345678', 0);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `EmployeeId` int(11) NOT NULL,
  `AccountId` int(11) DEFAULT NULL,
  `EmployeeNum` varchar(10) NOT NULL,
  `LastName` varchar(500) NOT NULL,
  `FirstName` varchar(500) NOT NULL,
  `MaritalStatus` varchar(500) NOT NULL,
  `Gender` varchar(500) NOT NULL,
  `DateOfBirth` date NOT NULL,
  `ContactNum` varchar(15) NOT NULL,
  `Email` varchar(800) NOT NULL,
  `Address` varchar(900) NOT NULL,
  `Department` varchar(500) NOT NULL,
  `JobTitle` varchar(500) NOT NULL,
  `DateOfEmployment` date NOT NULL,
  `WorkEmail` varchar(800) NOT NULL,
  `WorkPNum` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`EmployeeId`, `AccountId`, `EmployeeNum`, `LastName`, `FirstName`, `MaritalStatus`, `Gender`, `DateOfBirth`, `ContactNum`, `Email`, `Address`, `Department`, `JobTitle`, `DateOfEmployment`, `WorkEmail`, `WorkPNum`) VALUES
(9, 1, '00001', 'Cambal', 'Darylle Arne', 'Single', 'Male', '2024-03-19', '09123123123', 'asdasdasda@asd.com', 'asdadasdsad', 'Administration', 'CEO', '2024-03-18', 'asdasdasd@asda.com', '0918236123'),
(12, 8, '12345', 'asdasd', 'asdada', 'Single', 'Male', '2024-03-08', 'asdasd', 'asdasdsa', 'sadadasd', 'adasdad', 'adasdad', '2024-03-05', 'adadsad', 'adasdasda');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `InventoryId` int(11) NOT NULL,
  `Name` varchar(500) NOT NULL,
  `Description` varchar(2000) NOT NULL,
  `Weight` varchar(500) NOT NULL,
  `Stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`InventoryId`, `Name`, `Description`, `Weight`, `Stock`) VALUES
(4, 'Chicken Meat', 'Meat for rice bowl.', '1 Kg', 20);

-- --------------------------------------------------------

--
-- Table structure for table `restock`
--

CREATE TABLE `restock` (
  `RestockId` int(11) NOT NULL,
  `InventoryId` int(11) DEFAULT NULL,
  `Name` varchar(800) NOT NULL,
  `Notes` varchar(2000) NOT NULL,
  `Date` date NOT NULL,
  `Amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `restock`
--

INSERT INTO `restock` (`RestockId`, `InventoryId`, `Name`, `Notes`, `Date`, `Amount`) VALUES
(3, 4, 'Chicken Meat', 'Emergency restock', '2024-03-05', 10);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`AccountID`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`EmployeeId`),
  ADD UNIQUE KEY `AccountId` (`AccountId`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`InventoryId`);

--
-- Indexes for table `restock`
--
ALTER TABLE `restock`
  ADD PRIMARY KEY (`RestockId`),
  ADD UNIQUE KEY `InventoryId` (`InventoryId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `AccountID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `EmployeeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `InventoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `restock`
--
ALTER TABLE `restock`
  MODIFY `RestockId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `Cascade` FOREIGN KEY (`AccountId`) REFERENCES `account` (`AccountID`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `restock`
--
ALTER TABLE `restock`
  ADD CONSTRAINT `restock_ibfk_1` FOREIGN KEY (`InventoryId`) REFERENCES `inventory` (`InventoryId`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
