CREATE DATABASE  IF NOT EXISTS `hotel_management_service` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hotel_management_service`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hotel_management_service
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `customer_information`
--

DROP TABLE IF EXISTS `customer_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_information` (
  `cust_ID` int NOT NULL AUTO_INCREMENT,
  `custfname` varchar(45) DEFAULT NULL,
  `custlname` varchar(45) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cust_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_information`
--

LOCK TABLES `customer_information` WRITE;
/*!40000 ALTER TABLE `customer_information` DISABLE KEYS */;
INSERT INTO `customer_information` VALUES (1,'John','Doe','123 Main St','Active'),(2,'Jane','Smith','456 Elm St','Active'),(3,'Michael','Johnson','789 Oak St','Inactive'),(4,'Emily','Davis','321 Pine St','Active'),(5,'Daniel','Wilson','987 Maple St','Inactive'),(6,'Olivia','Brown','654 Cedar St','Active'),(7,'David','Anderson','789 Walnut St','Inactive'),(8,'Sophia','Taylor','246 Spruce St','Active'),(9,'Joseph','Miller','135 Birch St','Active'),(10,'Ava','Jones','753 Willow St','Inactive'),(11,'John','Doe','123 Main St','Active'),(12,'Jane','Smith','456 Elm St','Active'),(13,'Michael','Johnson','789 Oak St','Inactive'),(14,'Emily','Davis','321 Pine St','Active'),(15,'Daniel','Wilson','987 Maple St','Inactive'),(16,'Olivia','Brown','654 Cedar St','Active'),(17,'David','Anderson','789 Walnut St','Inactive'),(18,'Sophia','Taylor','246 Spruce St','Active'),(19,'Joseph','Miller','135 Birch St','Active'),(20,'Ava','Jones','753 Willow St','Inactive');
/*!40000 ALTER TABLE `customer_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `employee_ID` int NOT NULL,
  `fname` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  `job_department` varchar(45) NOT NULL,
  `address` varchar(45) DEFAULT NULL,
  `contact_add` varchar(45) DEFAULT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payment_ID` int NOT NULL AUTO_INCREMENT,
  `customer_ID` int DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  PRIMARY KEY (`payment_ID`),
  KEY `customer_ID_idx` (`customer_ID`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`customer_ID`) REFERENCES `customer_information` (`cust_ID`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=1012 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1000,1,'2023-02-20 15:30:43'),(1001,2,'2023-02-20 09:05:40'),(1002,3,'2023-07-05 21:01:59'),(1003,5,'2023-01-10 15:02:51'),(1004,6,'2023-08-16 20:05:33'),(1005,7,'2023-01-15 17:03:42'),(1006,9,'2023-05-05 14:06:13'),(1007,10,'2023-07-11 01:04:11'),(1008,13,'2023-03-20 06:07:45'),(1009,14,'2023-01-10 08:01:32'),(1010,19,'2023-06-25 15:03:22'),(1011,20,'2023-07-01 10:09:36');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reports` (
  `reports_ID` int NOT NULL,
  `transaction_ID` int NOT NULL,
  `information` varchar(45) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`reports_ID`),
  KEY `transaction_ID_idx` (`transaction_ID`),
  CONSTRAINT `transaction_ID` FOREIGN KEY (`transaction_ID`) REFERENCES `transaction` (`transaction_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports`
--

LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `reservation_ID` varchar(50) NOT NULL,
  `customer_ID` int NOT NULL,
  `room_ID` int NOT NULL,
  `reservation_date` date NOT NULL,
  `date_in` datetime NOT NULL,
  `date_out` datetime NOT NULL,
  `date_range` int DEFAULT NULL,
  PRIMARY KEY (`reservation_ID`),
  KEY `customer_ID_idx` (`customer_ID`),
  KEY `room_ID` (`room_ID`),
  CONSTRAINT `customer_ID` FOREIGN KEY (`customer_ID`) REFERENCES `customer_information` (`cust_ID`) ON DELETE CASCADE,
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`room_ID`) REFERENCES `room_information` (`room_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES ('AJones10',10,223,'2023-03-20','2023-03-20 09:00:00','2023-03-25 09:00:00',5),('AJones20',20,135,'2023-05-03','2023-05-03 12:30:00','2023-06-25 09:00:00',53),('DAnderson7',7,321,'2023-05-05','2023-05-05 09:30:00','2023-05-20 09:00:00',15),('DWilson5',5,241,'2023-08-16','2023-08-16 09:30:00','2023-09-16 09:00:00',31),('EDavis14',14,125,'2023-06-25','2023-06-25 09:30:00','2023-07-30 09:00:00',35),('JDoe1',1,980,'2023-02-20','2023-03-01 09:00:00','2023-03-10 09:00:00',10),('JMiller19',19,123,'2023-07-01','2023-07-01 09:30:00','2023-07-15 09:00:00',14),('JMiller9',9,234,'2023-07-11','2023-07-11 09:30:00','2023-07-30 09:00:00',19),('JSmith2',2,135,'2023-07-05','2023-07-05 09:30:00','2023-07-20 09:00:00',15),('MJohnson13',13,150,'2023-01-10','2023-01-10 09:00:00','2023-02-15 09:00:00',36),('MJohnson3',3,465,'2023-01-10','2023-01-15 23:00:00','2023-01-20 23:00:00',5),('OBrown6',6,321,'2023-01-15','2023-01-17 06:30:00','2023-01-24 23:00:00',7);
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_class`
--

DROP TABLE IF EXISTS `room_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_class` (
  `class_ID` int NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`class_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_class`
--

LOCK TABLES `room_class` WRITE;
/*!40000 ALTER TABLE `room_class` DISABLE KEYS */;
INSERT INTO `room_class` VALUES (1,'Standard'),(2,'Deluxe'),(3,'Suite'),(4,'Executive'),(5,'Family'),(6,'Presidential'),(7,'Penthouse'),(8,'Ocean View'),(9,'Garden View'),(10,'Luxury');
/*!40000 ALTER TABLE `room_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_information`
--

DROP TABLE IF EXISTS `room_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_information` (
  `room_id` int NOT NULL,
  `class_id` int DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL,
  `price` int DEFAULT NULL,
  PRIMARY KEY (`room_id`),
  KEY `class_id` (`class_id`),
  CONSTRAINT `room_information_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `room_class` (`class_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_information`
--

LOCK TABLES `room_information` WRITE;
/*!40000 ALTER TABLE `room_information` DISABLE KEYS */;
INSERT INTO `room_information` VALUES (123,3,'Luxurious and expansive suites with separate living and sleeping areas.',455),(125,4,'Premium rooms designed for business travelers with added workspace.',862),(135,6,'Opulent suites offering the utmost in luxury and indulgence.',847),(150,8,'Rooms with stunning views of the ocean, perfect for beach lovers.',749),(223,7,'Exquisite top-floor suites with panoramic views and exclusive amenities.',305),(234,5,' Family-friendly rooms with extra space and amenities for a comfortable stay.',775),(241,9,'Serene rooms overlooking lush gardens for a tranquil ambiance.',861),(321,10,'High-end rooms with top-notch amenities and elegant furnishings.',480),(465,1,'Comfortable and affordable rooms with essential amenities.',718),(980,2,'Spacious rooms with upgraded features and stylish decor.',651);
/*!40000 ALTER TABLE `room_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `transaction_ID` int NOT NULL,
  `transaction_name` varchar(45) NOT NULL,
  `customer_ID` int NOT NULL,
  `payment_ID` int NOT NULL,
  `employee_ID` int NOT NULL,
  `reservation_ID` int NOT NULL,
  `transaction_date` datetime NOT NULL,
  PRIMARY KEY (`transaction_ID`),
  KEY `customer_ID` (`customer_ID`),
  KEY `payment_ID` (`payment_ID`),
  KEY `employee_ID` (`employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-24 13:32:26
