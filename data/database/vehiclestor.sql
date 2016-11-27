-- MySQL dump 10.16  Distrib 10.1.16-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: vehiclestore
-- ------------------------------------------------------
-- Server version	10.1.16-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `vehicle_id` int(11) DEFAULT NULL,
  `body` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_794381C6A76ED395` (`user_id`),
  KEY `IDX_794381C6545317D1` (`vehicle_id`),
  CONSTRAINT `FK_794381C6545317D1` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`id`),
  CONSTRAINT `FK_794381C6A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,1,1,'The friendly service I experienced from the moment I walked in the door was exceptional. Even to the point when I received the keys to my new camper I could not have been more satisfied. Definitely will be a return customer; either for parts, service or a','Great DAY'),(2,1,2,'We have never been happier with the level of service that is provided here. Joey Lawrence makes us feel like part of The Dodd family. Never been to any service facility that treats their customers this way. We have had an issue with our RV but due to Mr. ','Very Pleased Service Experience'),(3,1,3,'My wife and I have been shopping around for quite some time for a Forest River XLR 29HFS. We found one at Dodd RV in Yorktown. ','Easy and seamless'),(4,1,1,'Small cars dont have to be boring. Youll get a kick out of the 2017 Ford Focus ST. It is fast, polished and ready for both daily driving duty and weekend fun. ','Easy and seamless'),(6,1,1,'This is my test review','Test review'),(7,1,2,'This is test 2','Test 2'),(15,1,1,'Hello there ','Test review'),(16,1,1,'Checking notification message','Review 2'),(17,1,1,'','');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller`
--

DROP TABLE IF EXISTS `seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seller` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller`
--

LOCK TABLES `seller` WRITE;
/*!40000 ALTER TABLE `seller` DISABLE KEYS */;
INSERT INTO `seller` VALUES (1,'Checkered Flag','Dealer','5309 David st, Virginia Beach, 25468','(757)111-2222','maryam.arab83@gmail.com','Dealer1.com'),(2,'Ameritade','Broker','1055 Alson Dr, Norfolk, VA, 23578','(757)123-4567','maryam.arab83@gmail.com','Broker1.com'),(3,'DMV','Third Party','186 Dominin st, Chesapeak, VA,35014','(757)121-9878','maryam.arab83@gmail.com','DMV.com'),(4,'RV-Seller','Dealer','Norfolk,VA','(757)121-9878','maryam.arab83@gmail.com','RV1.com');
/*!40000 ALTER TABLE `seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Maryam','h_seller123');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle`
--

DROP TABLE IF EXISTS `vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NOT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `make` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` int(11) DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `metadata` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1B80E486C54C8C93` (`type_id`),
  KEY `IDX_1B80E4868DE820D9` (`seller_id`),
  CONSTRAINT `FK_1B80E4868DE820D9` FOREIGN KEY (`seller_id`) REFERENCES `seller` (`id`),
  CONSTRAINT `FK_1B80E486C54C8C93` FOREIGN KEY (`type_id`) REFERENCES `vehicletype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle`
--

LOCK TABLES `vehicle` WRITE;
/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;
INSERT INTO `vehicle` VALUES (1,1,1,'Toyota','Corolla','2000',4500,'Good ','Color:Silver,Transmission:Automatic'),(2,1,2,'Toyota','Camry','2010',10000,'Great Condition','Color:Blue,Transmission:Automatic, Tacoma'),(3,2,2,'Toyota','Land Cruiser','2000',6000,'Good ','Color:Silver,Transmission:Automatic'),(4,3,2,'Ducati','Multistrada 1200','2010',14995,'Great Condition','Color:Red,Four-in-One, ABS available upon request, Rear Wheel: 10-spoke light alloy 600 x 17, Engine: Type L-Twin cylinder,Power: 150 hp (110.3 kw) @ 9250 rpm'),(5,3,1,'Ducati','Multistrada 1200','2010',12995,'Great Condition','Color:silver,Four-in-One, ABS available upon request'),(6,3,1,'Honda','3-wheels-motorcyle','2010',19995,'New Idea',''),(7,3,2,'Suzuki','JR80  1200','2014',500,'Great Condition','Color:silver-yellow'),(8,2,1,'MAK','Trailer','2015',36000,'Great Truck ','Color:Silver,Transmission:Automatic'),(9,1,1,'Honda','Civic','2015',256999,' Great and comfortable',''),(10,4,4,'Benz','Rv-model-1','2015',336000,' Great and comfortable',''),(11,4,4,'Benz','Rv-model-2','2015',356999,' Great and comfortable',''),(12,4,4,'Volvo','Rv-model-3','2015',842000,' Great and comfortable',''),(13,4,4,'Benz','Rv-model-4','2015',536000,' Great and comfortable','');
/*!40000 ALTER TABLE `vehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicleimage`
--

DROP TABLE IF EXISTS `vehicleimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicleimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_id` int(11) DEFAULT NULL,
  `imagepath` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_EA854718545317D1` (`vehicle_id`),
  CONSTRAINT `FK_EA854718545317D1` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicleimage`
--

LOCK TABLES `vehicleimage` WRITE;
/*!40000 ALTER TABLE `vehicleimage` DISABLE KEYS */;
INSERT INTO `vehicleimage` VALUES (1,1,'car1-1'),(2,1,'car1-2'),(3,1,'car1-3'),(4,2,'car2-1'),(5,2,'car2-2'),(6,3,'truck1-1'),(7,4,'motor1-1'),(8,4,'motor1-2'),(9,4,'motor1-3'),(10,4,'motor1-4'),(11,5,'motor2-1'),(12,5,'motor2-2'),(13,5,'motor2-3'),(14,5,'motor2-4'),(15,5,'motor2-5'),(16,6,'motor3-1'),(17,6,'motor3-2'),(18,7,'motor4-1'),(19,7,'motor4-2'),(20,3,'truck1-2'),(21,3,'truck1-3'),(22,8,'truck2-1'),(23,8,'truck2-2'),(24,10,'rv1-1'),(25,10,'rv1-2'),(26,10,'rv1-3'),(27,10,'rv1-4'),(28,10,'rv1-5'),(29,11,'rv2-1'),(30,12,'rv3-1'),(31,12,'rv3-2'),(32,12,'rv3-3'),(33,12,'rv3-4'),(34,12,'rv3-5'),(40,13,'rv4-1'),(41,13,'rv4-2'),(42,13,'rv4-3'),(43,13,'rv4-4'),(44,9,'car3-1'),(45,9,'car3-2'),(46,9,'car3-3'),(47,9,'car3-4');
/*!40000 ALTER TABLE `vehicleimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicletype`
--

DROP TABLE IF EXISTS `vehicletype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicletype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicletype`
--

LOCK TABLES `vehicletype` WRITE;
/*!40000 ALTER TABLE `vehicletype` DISABLE KEYS */;
INSERT INTO `vehicletype` VALUES (1,'Car'),(2,'Truck'),(3,'Motorcycle'),(4,'RV');
/*!40000 ALTER TABLE `vehicletype` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-27 11:14:46
