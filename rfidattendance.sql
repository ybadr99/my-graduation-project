-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 03, 2021 at 09:31 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rfidattendance`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `admin_name` varchar(30) NOT NULL,
  `admin_email` varchar(80) NOT NULL,
  `admin_pwd` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `admin_name`, `admin_email`, `admin_pwd`) VALUES
(1, 'Admin', 'admin@gmail.com', '$2y$10$89uX3LBy4mlU/DcBveQ1l.32nSianDP/E1MfUh.Z.6B4Z0ql3y7PK');

-- --------------------------------------------------------

--
-- Table structure for table `devices`
--

CREATE TABLE `devices` (
  `id` int(11) NOT NULL,
  `device_name` varchar(50) NOT NULL,
  `device_dep` varchar(20) NOT NULL,
  `device_uid` text NOT NULL,
  `device_date` date NOT NULL,
  `device_mode` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `devices`
--

INSERT INTO `devices` (`id`, `device_name`, `device_dep`, `device_uid`, `device_date`, `device_mode`) VALUES
(1, 'D1', 'test', 'a7ec812d2bf1866b', '2021-06-01', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL DEFAULT 'None',
  `serialnumber` double NOT NULL DEFAULT 0,
  `gender` varchar(10) NOT NULL DEFAULT 'None',
  `email` varchar(50) NOT NULL DEFAULT 'None',
  `card_uid` varchar(30) NOT NULL,
  `card_select` tinyint(1) NOT NULL DEFAULT 0,
  `user_date` date NOT NULL,
  `device_uid` varchar(20) NOT NULL DEFAULT '0',
  `device_dep` varchar(20) NOT NULL DEFAULT '0',
  `temp_degree` text NOT NULL,
  `add_card` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `serialnumber`, `gender`, `email`, `card_uid`, `card_select`, `user_date`, `device_uid`, `device_dep`, `temp_degree`, `add_card`) VALUES
(1, 'None', 0, 'None', 'None', '48237127165', 0, '2021-06-01', 'a7ec812d2bf1866b', 'test', '0', 0),
(2, 'mahmoud', 4, 'Male', 'mo33@g', '205245171139', 0, '2021-06-01', 'a7ec812d2bf1866b', 'test', '30', 1),
(3, 'mohamed ahmed', 3, 'Male', 'mo@g.com', '11251212219', 0, '2021-06-01', 'a7ec812d2bf1866b', 'test', '31', 1),
(4, 'ahmed', 2, 'Male', 'ahmed@g.com', '26137172139', 0, '2021-06-01', 'a7ec812d2bf1866b', 'test', '32', 1),
(5, 'yousef badr', 1, 'Male', 'yousef.keto5523@gmail.com', '2115172139', 1, '2021-06-01', 'a7ec812d2bf1866b', 'test', '33', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users_logs`
--

CREATE TABLE `users_logs` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `serialnumber` double NOT NULL,
  `card_uid` varchar(30) NOT NULL,
  `device_uid` varchar(20) NOT NULL,
  `device_dep` varchar(20) NOT NULL,
  `checkindate` date NOT NULL,
  `timein` time NOT NULL,
  `timeout` time NOT NULL,
  `card_out` tinyint(1) NOT NULL DEFAULT 0,
  `temp_degree` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_logs`
--

INSERT INTO `users_logs` (`id`, `username`, `serialnumber`, `card_uid`, `device_uid`, `device_dep`, `checkindate`, `timein`, `timeout`, `card_out`, `temp_degree`) VALUES
(13, 'yousef badr', 1, '2115172139', 'a7ec812d2bf1866b', 'test', '2021-06-02', '02:38:26', '00:00:00', 0, 38),
(14, 'mahmoud', 4, '205245171139', 'a7ec812d2bf1866b', 'test', '2021-06-02', '02:46:46', '02:46:48', 1, 35),
(15, 'ahmed', 2, '26137172139', 'a7ec812d2bf1866b', 'test', '2021-06-02', '02:47:27', '02:51:31', 1, 35),
(16, 'mahmoud', 4, '205245171139', 'a7ec812d2bf1866b', 'test', '2021-06-02', '02:49:26', '00:00:00', 0, 30.09),
(17, 'mohamed ahmed', 3, '11251212219', 'a7ec812d2bf1866b', 'test', '2021-06-02', '02:49:35', '02:51:39', 1, 30.05),
(18, 'mohamed ahmed', 3, '11251212219', 'a7ec812d2bf1866b', 'test', '2021-06-02', '02:51:47', '00:00:00', 0, 37.31);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `devices`
--
ALTER TABLE `devices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_logs`
--
ALTER TABLE `users_logs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `devices`
--
ALTER TABLE `devices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users_logs`
--
ALTER TABLE `users_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
