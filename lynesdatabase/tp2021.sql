-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2019 at 02:12 AM
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
-- Database: `tp2021`
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
(13132021, NULL, NULL, 'John', 'Chisenga', 'jonh@ashesi.edu.gh', '12345'),
(14132021, NULL, NULL, 'Tony', 'Chisenga', 'tony.chisenga@ashesi.edu.gh', '1234');

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
(14132021, NULL, 'this is my message to you');

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

--
-- Dumping data for table `customer_transactions`
--

INSERT INTO `customer_transactions` (`transaction_id`, `customer_id`, `transaction_type`, `transaction_amount`, `total_balance`) VALUES
(1, NULL, '', 15, 50);

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
(10, NULL, NULL, 'Wangari marai', NULL);

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
(11, 'Your food is good');

-- --------------------------------------------------------

--
-- Table structure for table `meals`
--

CREATE TABLE `meals` (
  `meal_id` int(10) NOT NULL,
  `meal_name` text NOT NULL,
  `meal_type` enum('Half portion, Full portion,15') NOT NULL,
  `meal_price` enum('GHS9.00, GHS11.00, 10') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `meals`
--

INSERT INTO `meals` (`meal_id`, `meal_name`, `meal_type`, `meal_price`) VALUES
(110, 'Rice and chicken', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_number` int(15) NOT NULL,
  `meal_id` int(15) DEFAULT NULL,
  `order_price` enum('GHS9.00,GHS11.00,15') NOT NULL,
  `order_portion` enum('Half portion, Full portion,15') NOT NULL,
  `order_time` datetime(6) NOT NULL,
  `order_quantity` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_number`, `meal_id`, `order_price`, `order_portion`, `order_time`, `order_quantity`) VALUES
(2, NULL, '', '', '2018-06-12 10:34:09.000000', 1);

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
(1415, 'White', 'divine', 'wd@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
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
  ADD KEY `customer` (`customer_id`);

--
-- Indexes for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD PRIMARY KEY (`delivery_number`),
  ADD KEY `meal` (`meal_id`),
  ADD KEY `from_orders` (`order_number`),
  ADD KEY `workers` (`worker_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedback_number`);

--
-- Indexes for table `meals`
--
ALTER TABLE `meals`
  ADD PRIMARY KEY (`meal_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_number`),
  ADD KEY `meal_id` (`meal_id`);

--
-- Indexes for table `workers`
--
ALTER TABLE `workers`
  ADD PRIMARY KEY (`worker_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_number` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
