-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: ojt_with-data
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `advisers`
--

DROP TABLE IF EXISTS `advisers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `advisers` (
  `adviserID` int NOT NULL,
  `adviserName` varchar(45) NOT NULL,
  `adviserEmail` varchar(45) NOT NULL,
  `password` varchar(60) NOT NULL,
  PRIMARY KEY (`adviserID`),
  UNIQUE KEY `adviserID_UNIQUE` (`adviserID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advisers`
--

LOCK TABLES `advisers` WRITE;
/*!40000 ALTER TABLE `advisers` DISABLE KEYS */;
INSERT INTO `advisers` VALUES (1,'Stevens, Amelia','amelia.stevens@example.com','amelia123'),(2,'Hayes, Benjamin','benjamin.hayes@example.com','benj123'),(3,'Rodriguez, Michelle','michelle.rodriguez@example.com','mich123'),(4,'Carter, Jonathan','jonathan.carter@example.com','jon123'),(5,'Foster, Emily','emily.foster@example.com','emi123'),(6,'Anderson, Samuel','samuel.anderson@example.com','samuel123'),(7,'Taylor, Victoria','victoria.taylor@example.com','victoria123'),(8,'Parker, Ben','richard.parker@example.com','ben123'),(9,'Collins, Thompson','thompson.collins.example.com','collin123'),(10,'David, Allison','allison.david@example.com','allison123');
/*!40000 ALTER TABLE `advisers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcements` (
  `announcementid` int NOT NULL AUTO_INCREMENT,
  `senderid` varchar(45) NOT NULL,
  `recipientid` int NOT NULL,
  `subject` varchar(45) NOT NULL,
  `message` varchar(45) NOT NULL,
  PRIMARY KEY (`announcementid`),
  UNIQUE KEY `announcementid_UNIQUE` (`announcementid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `companyid` int NOT NULL,
  `companyname` varchar(45) DEFAULT NULL,
  `companyaddress` varchar(45) DEFAULT NULL,
  `companytype` varchar(45) DEFAULT 'P, G',
  PRIMARY KEY (`companyid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'Accenture','Singapore','Private'),(2,'Microsoft','Hongkong','Government'),(3,'Netflix','US','Government'),(4,'Facebook','US','Private'),(5,'Trend-Micro','Philippines','Government'),(6,'Youtube','Hongkong','Private');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dailyreports`
--

DROP TABLE IF EXISTS `dailyreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dailyreports` (
  `reportid` int NOT NULL,
  `internid` int NOT NULL,
  `companyid` int NOT NULL,
  `supervisorid` int NOT NULL,
  `date` date NOT NULL,
  `timeIn` time DEFAULT NULL,
  `timeOut` time DEFAULT NULL,
  `hours` int DEFAULT NULL,
  `workdescription` varchar(45) DEFAULT NULL,
  `verificationstatus` varchar(45) DEFAULT NULL,
  `remark` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`reportid`,`internid`),
  UNIQUE KEY `reportid_UNIQUE` (`reportid`),
  KEY `companyid_idx` (`companyid`),
  KEY `internid_idx` (`internid`),
  KEY `supervisor_id_idx` (`supervisorid`),
  CONSTRAINT `company_id` FOREIGN KEY (`companyid`) REFERENCES `company` (`companyid`),
  CONSTRAINT `super_id` FOREIGN KEY (`supervisorid`) REFERENCES `supervisors` (`supervisorid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dailyreports`
--

LOCK TABLES `dailyreports` WRITE;
/*!40000 ALTER TABLE `dailyreports` DISABLE KEYS */;
/*!40000 ALTER TABLE `dailyreports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interninfo`
--

DROP TABLE IF EXISTS `interninfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interninfo` (
  `internid` int NOT NULL,
  `companyid` int DEFAULT NULL,
  `totalhours` int DEFAULT NULL,
  `teamno` int DEFAULT NULL,
  PRIMARY KEY (`internid`),
  UNIQUE KEY `internid_UNIQUE` (`internid`),
  KEY `companyid_idx` (`companyid`),
  KEY `comp_id_idx` (`companyid`),
  CONSTRAINT `comp_id` FOREIGN KEY (`companyid`) REFERENCES `company` (`companyid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interninfo`
--

LOCK TABLES `interninfo` WRITE;
/*!40000 ALTER TABLE `interninfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `interninfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `internrequirements`
--

DROP TABLE IF EXISTS `internrequirements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `internrequirements` (
  `internid` int NOT NULL,
  `requirementname` varchar(45) NOT NULL,
  `datesubmitted` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`internid`,`requirementname`),
  CONSTRAINT `internid` FOREIGN KEY (`internid`) REFERENCES `interns` (`internid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `internrequirements`
--

LOCK TABLES `internrequirements` WRITE;
/*!40000 ALTER TABLE `internrequirements` DISABLE KEYS */;
/*!40000 ALTER TABLE `internrequirements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interns`
--

DROP TABLE IF EXISTS `interns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interns` (
  `internid` int NOT NULL,
  `password` varchar(60) NOT NULL,
  `adviserid` int NOT NULL,
  `studentid` int NOT NULL,
  `companyid` int DEFAULT NULL,
  `supervisorid` int NOT NULL,
  `totalhours` int DEFAULT NULL,
  `worktype` varchar(45) DEFAULT NULL,
  `image` blob,
  PRIMARY KEY (`internid`),
  UNIQUE KEY `internid_UNIQUE` (`internid`),
  KEY `adviserid_idx` (`adviserid`),
  KEY `studentid_idx` (`studentid`),
  KEY `companyid_idx` (`companyid`),
  KEY `supervisorid_idx` (`supervisorid`),
  CONSTRAINT `adviserid` FOREIGN KEY (`adviserid`) REFERENCES `advisers` (`adviserID`),
  CONSTRAINT `companyid` FOREIGN KEY (`companyid`) REFERENCES `company` (`companyid`),
  CONSTRAINT `studentid` FOREIGN KEY (`studentid`) REFERENCES `students` (`studentID`),
  CONSTRAINT `supervisorid` FOREIGN KEY (`supervisorid`) REFERENCES `supervisors` (`supervisorid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interns`
--

LOCK TABLES `interns` WRITE;
/*!40000 ALTER TABLE `interns` DISABLE KEYS */;
INSERT INTO `interns` VALUES (1,'1234',1,2221023,1,110,NULL,'WFH',NULL),(2,'1234',2,2213241,2,120,180,'ON-SITE',NULL),(3,'1234',3,2211353,3,130,NULL,'WFH',NULL),(4,'1234',4,2211261,3,140,NULL,'ON-SITE',NULL),(5,'1234',5,2224514,4,150,240,'ON-SITE',NULL),(6,'1234',4,2225134,5,120,NULL,'WFH',NULL),(7,'1234',4,2225415,6,110,NULL,'ON-SITE',NULL),(8,'1234',5,2225134,1,110,240,'WFH',NULL);
/*!40000 ALTER TABLE `interns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pendingstudents`
--

DROP TABLE IF EXISTS `pendingstudents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pendingstudents` (
  `studentid` int NOT NULL,
  `companyid` int NOT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`studentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pendingstudents`
--

LOCK TABLES `pendingstudents` WRITE;
/*!40000 ALTER TABLE `pendingstudents` DISABLE KEYS */;
/*!40000 ALTER TABLE `pendingstudents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `studentID` int NOT NULL,
  `studentName` varchar(45) NOT NULL,
  `course` varchar(45) NOT NULL,
  `year` varchar(45) NOT NULL,
  PRIMARY KEY (`studentID`),
  UNIQUE KEY `studentID_UNIQUE` (`studentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (2211261,'Martel Molintas','BSCS','3'),(2211353,'Bads Villalobos','BSCS','3'),(2213241,'Shane Saguid','BSCS','3'),(2221023,'AJ Ramos','BSCS','3'),(2222551,'Daniel David','BSCS','3'),(2224514,'Ariel Tarlit','BSCS','3'),(2225134,'Claire Tumaliuan','BSCS','3'),(2225415,'Kiko Abella','BSCS','3');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supervisors`
--

DROP TABLE IF EXISTS `supervisors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supervisors` (
  `supervisorid` int NOT NULL,
  `supervisorname` varchar(45) DEFAULT NULL,
  `supervisoremail` varchar(45) DEFAULT NULL,
  `position` varchar(45) DEFAULT NULL,
  `companyid` int DEFAULT NULL,
  PRIMARY KEY (`supervisorid`),
  KEY `companyid_idx` (`companyid`),
  CONSTRAINT `companid` FOREIGN KEY (`companyid`) REFERENCES `company` (`companyid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supervisors`
--

LOCK TABLES `supervisors` WRITE;
/*!40000 ALTER TABLE `supervisors` DISABLE KEYS */;
INSERT INTO `supervisors` VALUES (110,'Doja Kat','kat@email.com','QA Lead',1),(120,'Nath Nyel','nyel@email.com','QA Lead',2),(130,'Cris P Bacon','cris@email.com','Lead Designer',3),(140,'Kev Vin','kev@email.com','UI/UX Lead',4),(150,'Vince Karl','karl@email.com','Frontend Manager',5);
/*!40000 ALTER TABLE `supervisors` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-02 17:36:36