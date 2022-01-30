-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 02, 2022 at 06:32 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chat_widget`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`) VALUES
(1, 'admin', '123');

-- --------------------------------------------------------

--
-- Table structure for table `convo`
--

CREATE TABLE `convo` (
  `id` int(11) NOT NULL,
  `websocketid` int(11) NOT NULL,
  `person` varchar(255) NOT NULL,
  `pesan` varchar(255) NOT NULL,
  `tgl` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `username`, `email`) VALUES
(43, 'arafat', 'arafat@test.com'),
(44, 'ari', 'ari@test.com'),
(45, 'maku', 'maku@gmail.com'),
(46, 'astaga', 'astaga@test.com');

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `id` int(11) NOT NULL,
  `roomid` varchar(25) NOT NULL,
  `person` varchar(25) NOT NULL,
  `msg` varchar(255) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`id`, `roomid`, `person`, `msg`, `date`) VALUES
(87, '43', 'admin', 'Addmin mengirim', '2021-09-20 02:02:03'),
(88, '44', 'admin', 'arasa', '2021-09-20 02:02:49'),
(89, '44', 'ari', 'aaa', '2021-09-20 02:02:52'),
(90, '43', 'arafat', 'asdaa', '2021-09-20 02:21:56'),
(91, '43', 'arafat', 'brr', '2021-09-20 02:22:00'),
(92, '45', 'maku', 'hallo arafat', '2022-01-02 12:31:16'),
(93, '45', 'admin', 'hallo juga', '2022-01-02 12:31:24'),
(94, '46', 'astaga', 'broo', '2022-01-02 12:31:43'),
(95, '46', 'admin', 'napa bro', '2022-01-02 12:31:52');

-- --------------------------------------------------------

--
-- Table structure for table `meetups`
--

CREATE TABLE `meetups` (
  `id` int(11) NOT NULL,
  `websocketid` int(11) NOT NULL,
  `adminid` int(11) NOT NULL,
  `finishedtime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `websockets`
--

CREATE TABLE `websockets` (
  `id` int(11) NOT NULL,
  `roomid` int(11) NOT NULL,
  `customerid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `convo`
--
ALTER TABLE `convo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `websocketid` (`websocketid`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meetups`
--
ALTER TABLE `meetups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adminid` (`adminid`),
  ADD KEY `websocketid` (`websocketid`);

--
-- Indexes for table `websockets`
--
ALTER TABLE `websockets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customerid` (`customerid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `convo`
--
ALTER TABLE `convo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `meetups`
--
ALTER TABLE `meetups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `websockets`
--
ALTER TABLE `websockets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `convo`
--
ALTER TABLE `convo`
  ADD CONSTRAINT `convo_ibfk_1` FOREIGN KEY (`websocketid`) REFERENCES `websockets` (`id`);

--
-- Constraints for table `meetups`
--
ALTER TABLE `meetups`
  ADD CONSTRAINT `meetups_ibfk_1` FOREIGN KEY (`adminid`) REFERENCES `admins` (`id`),
  ADD CONSTRAINT `meetups_ibfk_2` FOREIGN KEY (`websocketid`) REFERENCES `websockets` (`id`);

--
-- Constraints for table `websockets`
--
ALTER TABLE `websockets`
  ADD CONSTRAINT `websockets_ibfk_1` FOREIGN KEY (`customerid`) REFERENCES `customers` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
