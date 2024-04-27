-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: mechanic
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `APPOINTMENTS`
--

DROP TABLE IF EXISTS `APPOINTMENTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `APPOINTMENTS` (
  `appNum` int NOT NULL AUTO_INCREMENT,
  `appDate` date NOT NULL,
  `VIN` varchar(17) NOT NULL,
  `custID` int NOT NULL,
  `shopNum` int DEFAULT NULL,
  PRIMARY KEY (`appNum`),
  KEY `VIN` (`VIN`),
  KEY `custID` (`custID`),
  KEY `shopNum` (`shopNum`),
  CONSTRAINT `APPOINTMENTS_ibfk_1` FOREIGN KEY (`VIN`) REFERENCES `CAR` (`VIN`),
  CONSTRAINT `APPOINTMENTS_ibfk_2` FOREIGN KEY (`custID`) REFERENCES `CUSTOMER` (`custID`),
  CONSTRAINT `APPOINTMENTS_ibfk_3` FOREIGN KEY (`shopNum`) REFERENCES `SHOP` (`shopNum`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `APPOINTMENTS`
--

LOCK TABLES `APPOINTMENTS` WRITE;
/*!40000 ALTER TABLE `APPOINTMENTS` DISABLE KEYS */;
INSERT INTO `APPOINTMENTS` VALUES (8,'2024-04-30','2342342',3,1);
/*!40000 ALTER TABLE `APPOINTMENTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CAR`
--

DROP TABLE IF EXISTS `CAR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CAR` (
  `VIN` varchar(17) NOT NULL,
  `make` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `year` int NOT NULL,
  `custID` int NOT NULL,
  PRIMARY KEY (`VIN`),
  KEY `custID` (`custID`),
  CONSTRAINT `CAR_ibfk_1` FOREIGN KEY (`custID`) REFERENCES `CUSTOMER` (`custID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CAR`
--

LOCK TABLES `CAR` WRITE;
/*!40000 ALTER TABLE `CAR` DISABLE KEYS */;
INSERT INTO `CAR` VALUES ('1','Ford','Model T',1932,6),('2342342','Chevy','Duramax',2003,3),('2fdsfsdsf','Ford','F150',1999,3),('2ftx23123','Jeep','GrandCherokee',2003,3),('2jtf3432424','Jeep','Cherokee',2000,6),('CarVin123123123','Ford','F150',1999,3),('carwin123','Fiat','5000',2015,5),('randomvin','Dodge','Truck',2002,6);
/*!40000 ALTER TABLE `CAR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUSTOMER`
--

DROP TABLE IF EXISTS `CUSTOMER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CUSTOMER` (
  `custID` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `phoneNumber` char(10) NOT NULL,
  PRIMARY KEY (`custID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOMER`
--

LOCK TABLES `CUSTOMER` WRITE;
/*!40000 ALTER TABLE `CUSTOMER` DISABLE KEYS */;
INSERT INTO `CUSTOMER` VALUES (3,'Tristan','Keith','5735296517'),(4,'Susie','Stevebob','9999999999'),(5,'Shane','Keith','5731112222'),(6,'jimbob','stevo','1231231232'),(7,'Jon','Smith','6561231234'),(8,'Billy','Cyrus','1231234567');
/*!40000 ALTER TABLE `CUSTOMER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EMPLOYEE`
--

DROP TABLE IF EXISTS `EMPLOYEE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EMPLOYEE` (
  `userID` int NOT NULL,
  `payrate` decimal(15,2) DEFAULT '17.50',
  `hiredate` date NOT NULL,
  `shopNum` int NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`userID`),
  KEY `shopNum` (`shopNum`),
  CONSTRAINT `EMPLOYEE_ibfk_1` FOREIGN KEY (`shopNum`) REFERENCES `SHOP` (`shopNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMPLOYEE`
--

LOCK TABLES `EMPLOYEE` WRITE;
/*!40000 ALTER TABLE `EMPLOYEE` DISABLE KEYS */;
INSERT INTO `EMPLOYEE` VALUES (999,17.50,'2024-04-26',1,'Charlie','White','email@gmail.com'),(1111,17.50,'2024-04-19',1,'Susie','Stevebob','email@gmail.com'),(71502,17.75,'2024-04-18',1,'Tristan','Keith','email@gmail.com');
/*!40000 ALTER TABLE `EMPLOYEE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INVOICE`
--

DROP TABLE IF EXISTS `INVOICE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `INVOICE` (
  `invoiceNum` int NOT NULL AUTO_INCREMENT,
  `userID` int NOT NULL,
  `custID` int NOT NULL,
  `VIN` varchar(17) NOT NULL,
  `repairNum` int NOT NULL,
  `totalCost` decimal(16,2) NOT NULL,
  `paid` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`invoiceNum`),
  KEY `userID` (`userID`),
  KEY `custID` (`custID`),
  KEY `VIN` (`VIN`),
  KEY `repairNum` (`repairNum`),
  CONSTRAINT `INVOICE_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `EMPLOYEE` (`userID`),
  CONSTRAINT `INVOICE_ibfk_2` FOREIGN KEY (`custID`) REFERENCES `CUSTOMER` (`custID`),
  CONSTRAINT `INVOICE_ibfk_3` FOREIGN KEY (`VIN`) REFERENCES `CAR` (`VIN`),
  CONSTRAINT `INVOICE_ibfk_4` FOREIGN KEY (`repairNum`) REFERENCES `REPAIR` (`repairNum`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INVOICE`
--

LOCK TABLES `INVOICE` WRITE;
/*!40000 ALTER TABLE `INVOICE` DISABLE KEYS */;
INSERT INTO `INVOICE` VALUES (1,71502,3,'2fdsfsdsf',1,1500.00,1),(4,71502,3,'2fdsfsdsf',1,1500.00,1),(5,71502,6,'1',3,20.00,1),(6,71502,6,'1',3,20213.00,0);
/*!40000 ALTER TABLE `INVOICE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LOGIN`
--

DROP TABLE IF EXISTS `LOGIN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LOGIN` (
  `userID` int NOT NULL,
  `password` binary(32) NOT NULL,
  `salt` binary(10) NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LOGIN`
--

LOCK TABLES `LOGIN` WRITE;
/*!40000 ALTER TABLE `LOGIN` DISABLE KEYS */;
INSERT INTO `LOGIN` VALUES (999,_binary 'Çt◊ü\ı\”V\Ô\√/˛ß\‰lÖ °\Î¢9l9*HhÑi\À˛',_binary 'Oåyj¿!\r\r\”'),(1111,_binary 'Öàê ã¡\‘\Œ˝ùY\\†µ˛¸\rï9\◊aœ∂oÖ^\„4ãÉ',_binary '\r\‡R≠á§\„¨\0ö'),(71502,_binary 'N\Ë>â™PáR(	kôT´îô¸\◊¢	7M\»SBÖ\"ˇOs',_binary 'bFèa]é\ƒ8');
/*!40000 ALTER TABLE `LOGIN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REPAIR`
--

DROP TABLE IF EXISTS `REPAIR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REPAIR` (
  `repairNum` int NOT NULL AUTO_INCREMENT,
  `VIN` varchar(17) NOT NULL,
  `userID` int NOT NULL,
  `in_miles` decimal(9,1) DEFAULT NULL,
  `out_miles` decimal(9,1) DEFAULT NULL,
  PRIMARY KEY (`repairNum`),
  KEY `VIN` (`VIN`),
  KEY `userID` (`userID`),
  CONSTRAINT `REPAIR_ibfk_1` FOREIGN KEY (`VIN`) REFERENCES `CAR` (`VIN`),
  CONSTRAINT `REPAIR_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `EMPLOYEE` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REPAIR`
--

LOCK TABLES `REPAIR` WRITE;
/*!40000 ALTER TABLE `REPAIR` DISABLE KEYS */;
INSERT INTO `REPAIR` VALUES (1,'2ftx23123',71502,175000.0,176000.0),(3,'1',71502,60000.0,65000.0),(4,'2342342',71502,180000.0,195000.0);
/*!40000 ALTER TABLE `REPAIR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHOP`
--

DROP TABLE IF EXISTS `SHOP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHOP` (
  `shopNum` int NOT NULL AUTO_INCREMENT,
  `owner` varchar(255) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`shopNum`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHOP`
--

LOCK TABLES `SHOP` WRITE;
/*!40000 ALTER TABLE `SHOP` DISABLE KEYS */;
INSERT INTO `SHOP` VALUES (1,'Jimbob','5735555555','Columbia','MO','1 First St');
/*!40000 ALTER TABLE `SHOP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SUPPLIER`
--

DROP TABLE IF EXISTS `SUPPLIER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SUPPLIER` (
  `supplierNum` int NOT NULL AUTO_INCREMENT,
  `phoneNumber` char(10) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `shopNum` int NOT NULL,
  PRIMARY KEY (`supplierNum`),
  KEY `shopNum` (`shopNum`),
  CONSTRAINT `SUPPLIER_ibfk_1` FOREIGN KEY (`shopNum`) REFERENCES `SHOP` (`shopNum`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SUPPLIER`
--

LOCK TABLES `SUPPLIER` WRITE;
/*!40000 ALTER TABLE `SUPPLIER` DISABLE KEYS */;
INSERT INTO `SUPPLIER` VALUES (5,'1231321231','Stlouis','MO','1st Street',1),(6,'6365556666','Milwuakee','WI','2nd Second St',1);
/*!40000 ALTER TABLE `SUPPLIER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TASK`
--

DROP TABLE IF EXISTS `TASK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TASK` (
  `taskNum` int NOT NULL AUTO_INCREMENT,
  `repairNum` int NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`taskNum`),
  KEY `repairNum` (`repairNum`),
  CONSTRAINT `TASK_ibfk_1` FOREIGN KEY (`repairNum`) REFERENCES `REPAIR` (`repairNum`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TASK`
--

LOCK TABLES `TASK` WRITE;
/*!40000 ALTER TABLE `TASK` DISABLE KEYS */;
INSERT INTO `TASK` VALUES (1,3,'Driver Front CV Axle'),(2,1,'Remove and Replace Engine'),(3,3,'Remove exhaust'),(5,4,'Change oil and replace front end');
/*!40000 ALTER TABLE `TASK` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-27 13:03:10
