-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 24, 2016 at 05:48 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vehiclestore`
--

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `vehicle_id` int(11) DEFAULT NULL,
  `body` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`id`, `user_id`, `vehicle_id`, `body`, `title`) VALUES
(1, 1, 1, 'The friendly service I experienced from the moment I walked in the door was exceptional. Even to the point when I received the keys to my new camper I could not have been more satisfied. Definitely will be a return customer; either for parts, service or a', 'Great DAY'),
(2, 1, 2, 'We have never been happier with the level of service that is provided here. Joey Lawrence makes us feel like part of The Dodd family. Never been to any service facility that treats their customers this way. We have had an issue with our RV but due to Mr. ', 'Very Pleased Service Experience'),
(3, 1, 3, 'My wife and I have been shopping around for quite some time for a Forest River XLR 29HFS. We found one at Dodd RV in Yorktown. ', 'Easy and seamless'),
(4, 1, 1, 'Small cars dont have to be boring. Youll get a kick out of the 2017 Ford Focus ST. It is fast, polished and ready for both daily driving duty and weekend fun. ', 'Easy and seamless'),
(6, 1, 1, 'This is my test review', 'Test review'),
(7, 1, 2, 'This is test 2', 'Test 2');

-- --------------------------------------------------------

--
-- Table structure for table `seller`
--

CREATE TABLE `seller` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `seller`
--

INSERT INTO `seller` (`id`, `name`, `type`, `address`, `phone`, `email`, `website`) VALUES
(1, 'Checkered Flag', 'Dealer', '5309 David st, Virginia Beach, 25468', '(757)111-2222', 'maryam.arab83@gmail.com', 'Dealer1.com'),
(2, 'Ameritade', 'Broker', '1055 Alson Dr, Norfolk, VA, 23578', '(757)123-4567', 'maryam.arab83@gmail.com', 'Broker1.com'),
(3, 'DMV', 'Third Party', '186 Dominin st, Chesapeak, VA,35014', '(757)121-9878', 'maryam.arab83@gmail.com', 'DMV.com');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`) VALUES
(1, 'Maryam', 'h_seller123');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE `vehicle` (
  `id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `make` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` int(11) DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `metadata` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vehicle`
--

INSERT INTO `vehicle` (`id`, `type_id`, `seller_id`, `make`, `model`, `year`, `price`, `description`, `metadata`) VALUES
(1, 1, 1, 'Toyota', 'Corolla', '2000', 4500, 'Good ', 'Color:Silver,Transmission:Automatic'),
(2, 1, 2, 'Toyota', 'Camry', '2010', 10000, 'Great Condition', 'Color:Blue,Transmission:Automatic, Tacoma'),
(3, 2, 2, 'Toyota', 'Land Cruiser', '2000', 6000, 'Good ', 'Color:Silver,Transmission:Automatic');

-- --------------------------------------------------------

--
-- Table structure for table `vehicleimage`
--

CREATE TABLE `vehicleimage` (
  `id` int(11) NOT NULL,
  `vehicle_id` int(11) DEFAULT NULL,
  `imagepath` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vehicleimage`
--

INSERT INTO `vehicleimage` (`id`, `vehicle_id`, `imagepath`) VALUES
(1, 1, 'car1-1'),
(2, 1, 'car1-2'),
(3, 1, 'car1-3'),
(4, 2, 'car2-1'),
(5, 2, 'car2-2'),
(6, 3, 'truck1-1');

-- --------------------------------------------------------

--
-- Table structure for table `vehicletype`
--

CREATE TABLE `vehicletype` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vehicletype`
--

INSERT INTO `vehicletype` (`id`, `title`) VALUES
(1, 'Car'),
(2, 'Truck'),
(3, 'Motorcycle'),
(4, 'RV');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_794381C6A76ED395` (`user_id`),
  ADD KEY `IDX_794381C6545317D1` (`vehicle_id`);

--
-- Indexes for table `seller`
--
ALTER TABLE `seller`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_1B80E486C54C8C93` (`type_id`),
  ADD KEY `IDX_1B80E4868DE820D9` (`seller_id`);

--
-- Indexes for table `vehicleimage`
--
ALTER TABLE `vehicleimage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_EA854718545317D1` (`vehicle_id`);

--
-- Indexes for table `vehicletype`
--
ALTER TABLE `vehicletype`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `seller`
--
ALTER TABLE `seller`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `vehicle`
--
ALTER TABLE `vehicle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `vehicleimage`
--
ALTER TABLE `vehicleimage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `vehicletype`
--
ALTER TABLE `vehicletype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `FK_794381C6545317D1` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`id`),
  ADD CONSTRAINT `FK_794381C6A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD CONSTRAINT `FK_1B80E4868DE820D9` FOREIGN KEY (`seller_id`) REFERENCES `seller` (`id`),
  ADD CONSTRAINT `FK_1B80E486C54C8C93` FOREIGN KEY (`type_id`) REFERENCES `vehicletype` (`id`);

--
-- Constraints for table `vehicleimage`
--
ALTER TABLE `vehicleimage`
  ADD CONSTRAINT `FK_EA854718545317D1` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
