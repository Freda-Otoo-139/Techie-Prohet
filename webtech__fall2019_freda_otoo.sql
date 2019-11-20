-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 20, 2019 at 10:50 PM
-- Server version: 10.1.29-MariaDB
-- PHP Version: 7.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webtech__fall2019_freda_otoo`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(15) NOT NULL,
  `delivery_id` int(15) DEFAULT NULL,
  `order_number` int(15) DEFAULT NULL,
  `customer_f_name` text NOT NULL,
  `customer_l_name` text NOT NULL,
  `customer_email` text NOT NULL,
  `customer_pword` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `delivery_id`, `order_number`, `customer_f_name`, `customer_l_name`, `customer_email`, `customer_pword`) VALUES
(2016634, NULL, NULL, 'tani', 'lungu', 'tani@hotmail.com', '7d70796fc5a1ebb236cd4a341'),
(2021220, NULL, NULL, 'andre', 'mambwe', 'andre@gmail.com', 'fa2f53c0e27dc68020df44416'),
(14132021, NULL, NULL, 'Tony', 'Chisenga', 'tony@gmail.com', '1234'),
(30302121, NULL, NULL, 'changwe', 'clecle', 'hh@hotmail.com', 'f14d8e57dc78bdd0cc1d1f148'),
(40021211, NULL, NULL, 'changwe', 'changwe', 'ch@hotmail.com', 'aef3c46e6a75d61bf0f5b128e');

-- --------------------------------------------------------

--
-- Table structure for table `customer_feedback`
--

CREATE TABLE `customer_feedback` (
  `customer_id` int(15) NOT NULL,
  `feedback_number` int(15) DEFAULT NULL,
  `some_message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_feedback`
--

INSERT INTO `customer_feedback` (`customer_id`, `feedback_number`, `some_message`) VALUES
(2021220, 27, 'You are the best                  '),
(14132021, 24, '                    sssssssssssssssssssss'),
(30302121, 26, 'I like your restaurant                    ');

-- --------------------------------------------------------

--
-- Table structure for table `customer_transactions`
--

CREATE TABLE `customer_transactions` (
  `transaction_id` int(15) NOT NULL,
  `customer_id` int(15) DEFAULT NULL,
  `transaction_type` enum('Deposit, Withdraw') NOT NULL,
  `transaction_amount` int(15) NOT NULL,
  `total_balance` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `deliveries`
--

CREATE TABLE `deliveries` (
  `delivery_number` int(15) NOT NULL,
  `meal_id` int(11) DEFAULT NULL,
  `order_number` int(11) DEFAULT NULL,
  `location` text NOT NULL,
  `worker_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `deliveries`
--

INSERT INTO `deliveries` (`delivery_number`, `meal_id`, `order_number`, `location`, `worker_id`) VALUES
(1, 1, NULL, 'Big ben', NULL),
(2, 1, NULL, 'Big ben', NULL),
(3, 1, NULL, 'Big ben', 1001),
(4, 1, NULL, 'Wangari Matai', 1002),
(5, 1, NULL, 'Big ben', 1001);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedback_number` int(15) NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feedback_number`, `message`) VALUES
(1, '     this is my message               '),
(2, 'Another message for you          '),
(3, 'Another message for you          '),
(4, 'Another message for you          '),
(5, 'Another message for you          '),
(6, 'Another message for you          '),
(7, 'Another message for you          '),
(8, 'Another message for you          '),
(9, 'wwwwwwwwwwwwwwwwwwwww'),
(10, 'wwwwwwwwwwwwwwwwwwwww'),
(11, 'wwwwwwwwwwwwwwwwwwwww'),
(12, 'wwwwwwwwwwwwwwwwwwwww'),
(13, 'tony@gmail.com'),
(14, 'tony@gmail.com'),
(15, 'tony@gmail.com'),
(16, 'tony@gmail.com'),
(17, 'tony@gmail.com'),
(18, 'tony@gmail.com'),
(19, 'tony@gmail.com'),
(20, '  one on one'),
(21, '                    sssssssssssssssssssss'),
(22, '                    sssssssssssssssssssss'),
(23, '                    sssssssssssssssssssss'),
(24, '                    sssssssssssssssssssss'),
(25, ''),
(26, 'I like your restaurant                    '),
(27, 'You are the best                  ');

-- --------------------------------------------------------

--
-- Table structure for table `meals`
--

CREATE TABLE `meals` (
  `meal_id` int(10) NOT NULL,
  `meal_name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `meals`
--

INSERT INTO `meals` (`meal_id`, `meal_name`) VALUES
(1, 'Rice_chicken');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_number` int(15) NOT NULL,
  `meal_id` int(15) DEFAULT NULL,
  `order_price` int(5) NOT NULL,
  `order_portion` enum('Half portion, Full portion,15') NOT NULL,
  `order_time` datetime(6) DEFAULT NULL,
  `order_quantity` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_number`, `meal_id`, `order_price`, `order_portion`, `order_time`, `order_quantity`) VALUES
(1, 1, 0, '', '0000-00-00 00:00:00.000000', 1),
(3, 1, 0, '', NULL, 1),
(4, 1, 0, '', NULL, 1),
(5, 1, 0, '', NULL, 1),
(6, 1, 0, '', NULL, 1),
(7, 1, 0, '', NULL, 1),
(8, 1, 0, '', NULL, 1),
(9, 1, 0, '', NULL, 1),
(10, 1, 0, '', NULL, 1),
(11, 1, 0, '', NULL, 1),
(12, 1, 0, '', NULL, 1),
(13, 1, 0, '', NULL, 1),
(14, 1, 0, '', NULL, 1),
(15, 1, 0, '', NULL, 1),
(16, 1, 0, '', NULL, 1),
(17, 1, 0, '', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `workers`
--

CREATE TABLE `workers` (
  `worker_id` int(15) NOT NULL,
  `worker_fname` text NOT NULL,
  `worker_lname` text NOT NULL,
  `worker_email` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `workers`
--

INSERT INTO `workers` (`worker_id`, `worker_fname`, `worker_lname`, `worker_email`) VALUES
(1001, 'monde', 'chibesa', 'monde@gmail.com'),
(1002, 'Changwe', 'Kunda', 'ck@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `customer_id` (`customer_id`),
  ADD KEY `delivery_id` (`delivery_id`),
  ADD KEY `frm_orders` (`order_number`);

--
-- Indexes for table `customer_feedback`
--
ALTER TABLE `customer_feedback`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `from_feedback` (`feedback_number`);

--
-- Indexes for table `customer_transactions`
--
ALTER TABLE `customer_transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD UNIQUE KEY `transaction_id` (`transaction_id`),
  ADD KEY `customer` (`customer_id`);

--
-- Indexes for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD PRIMARY KEY (`delivery_number`),
  ADD UNIQUE KEY `delivery_number` (`delivery_number`),
  ADD KEY `meal` (`meal_id`),
  ADD KEY `from_orders` (`order_number`),
  ADD KEY `workers` (`worker_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedback_number`),
  ADD UNIQUE KEY `feedback_number` (`feedback_number`);

--
-- Indexes for table `meals`
--
ALTER TABLE `meals`
  ADD PRIMARY KEY (`meal_id`),
  ADD UNIQUE KEY `meal_id` (`meal_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_number`),
  ADD UNIQUE KEY `order_number` (`order_number`),
  ADD KEY `meal_id` (`meal_id`);

--
-- Indexes for table `workers`
--
ALTER TABLE `workers`
  ADD PRIMARY KEY (`worker_id`),
  ADD UNIQUE KEY `worker_id` (`worker_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer_transactions`
--
ALTER TABLE `customer_transactions`
  MODIFY `transaction_id` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deliveries`
--
ALTER TABLE `deliveries`
  MODIFY `delivery_number` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feedback_number` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `meals`
--
ALTER TABLE `meals`
  MODIFY `meal_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_number` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `delivery_id` FOREIGN KEY (`delivery_id`) REFERENCES `deliveries` (`delivery_number`),
  ADD CONSTRAINT `frm_orders` FOREIGN KEY (`order_number`) REFERENCES `orders` (`order_number`);

--
-- Constraints for table `customer_feedback`
--
ALTER TABLE `customer_feedback`
  ADD CONSTRAINT `from_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `from_feedback` FOREIGN KEY (`feedback_number`) REFERENCES `feedback` (`feedback_number`);

--
-- Constraints for table `customer_transactions`
--
ALTER TABLE `customer_transactions`
  ADD CONSTRAINT `customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD CONSTRAINT `from_orders` FOREIGN KEY (`order_number`) REFERENCES `orders` (`order_number`),
  ADD CONSTRAINT `meal` FOREIGN KEY (`meal_id`) REFERENCES `meals` (`meal_id`),
  ADD CONSTRAINT `workers` FOREIGN KEY (`worker_id`) REFERENCES `workers` (`worker_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `meal_id` FOREIGN KEY (`meal_id`) REFERENCES `meals` (`meal_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
