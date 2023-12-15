-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: ojt_with-data
-- ------------------------------------------------------
-- Server version	5.7.36

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
  `adviserID` int(11) NOT NULL,
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
INSERT INTO `advisers` VALUES (1,'Stevens, Amelia','amelia.stevens@example.com','$2b$10$78LKeo0LmG..I3zOKczr2uZ6RHoh4iKZc.vuHdqr1PEv.HWgdSQaS'),(2,'Hayes, Benjamin','benjamin.hayes@example.com','$2b$10$1oBGejEJUYWQZTZ7V0xxuuZxYjduOiFMagjgxkCjiopy22A5uI0qm'),(3,'Rodriguez, Michelle','michelle.rodriguez@example.com','$2b$10$d2eujojFxw0DeNFttys0JOj937fQK.tBY2VAiNL4kAQiRrx2aEt3W'),(4,'Carter, Jonathan','jonathan.carter@example.com','$2b$10$D3KQLZvEP4N/.iynp2Ky5OFEPQvANl9Y/kdAj7.7gqycoafrOjCem'),(5,'Foster, Emily','emily.foster@example.com','$2b$10$aM.1NkZJPr4yYwg4g.IIu.R8o3yG/hZ0zyBKN27Et/C51/38xs5fu'),(6,'Anderson, Samuel','samuel.anderson@example.com','$2b$10$uqgZwaAeA09LFoVJjczX.uofGft2PmqQGV.G23Pkn9YT92YXcWx3a'),(7,'Taylor, Victoria','victoria.taylor@example.com','$2b$10$vNNVoLCUZrcEFuLnTvo3.OnebIWLG7T1RETaxoAxk/S583F2VsA3q'),(8,'Parker, Ben','richard.parker@example.com','$2b$10$06gRV7gaFRUNwcLp1f/Dqu.qhRDGgzbJy/.kxWeLR7mYcEpcaFq1u'),(9,'Collins, Thompson','thompson.collins.example.com','$2b$10$MqKbILt8Dl32Z6/h2Q5pkOtZ4SXohLmjSYkkWBVFSerxPuC89fxNu'),(10,'David, Allison','allison.david@example.com','$2b$10$2uDOiFER7SfkDau/YX8cmOubQA/HaYn1R6GKRRnV3MOgnwJdyJ5pu');
/*!40000 ALTER TABLE `advisers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcements` (
  `announcementid` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `senderid` varchar(45) NOT NULL,
  `recipientid` int(11) NOT NULL,
  `subject` varchar(45) NOT NULL,
  `message` varchar(45) NOT NULL,
  PRIMARY KEY (`announcementid`),
  UNIQUE KEY `announcementid_UNIQUE` (`announcementid`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
INSERT INTO `announcements` VALUES (1,'2023-12-03','4',1,'PASS YOUR REQUIREMENTS','MED, COA, ETC'),(2,'2023-12-03','4',2,'PASS YOUR REQUIREMENTS','MED, COA, ETC'),(3,'2023-12-03','4',3,'PASS YOUR REQUIREMENTS','MED, COA, ETC'),(4,'2023-12-03','4',0,'',''),(5,'2023-12-03','4',0,'asdvvv','vvvv'),(6,'2023-12-03','4',0,'sadvcqwvr','vasdc'),(7,'2023-12-03','4',1,'abcde','abcdefghijk'),(8,'2023-12-03','4',4,'abcde','abcdefghijk'),(9,'2023-12-03','4',5,'abcde','abcdefghijk'),(10,'2023-12-03','4',1,'12casdcas','cascsa'),(11,'2023-12-03','4',6,'12casdcas','cascsa'),(12,'2023-12-03','4',2,'12casdcas','cascsa'),(13,'2023-12-03','4',1,'sadvqw','sdvsacwq'),(14,'2023-12-03','4',6,'sadvqw','sdvsacwq'),(15,'2023-12-03','4',2,'sadvqw','sdvsacwq'),(16,'2023-12-05','4',1,'JANNSEN MAGPASA KA NA NG REQUIREMENTS','ASDCASVAS'),(17,'2023-12-05','4',6,'JANNSEN MAGPASA KA NA NG REQUIREMENTS','ASDCASVAS'),(18,'2023-12-05','4',5,'JANNSEN MAGPASA KA NA NG REQUIREMENTS','ASDCASVAS'),(19,'2023-12-05','4',1,'vasds','asdvasdvasdas'),(20,'2023-12-08','4',3,'IFHWNRFEF','oiwgraekg'),(21,'2023-12-08','4',4,'IFHWNRFEF','oiwgraekg'),(22,'2023-12-08','4',5,'IFHWNRFEF','oiwgraekg');
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `companyid` int(11) NOT NULL,
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
  `reportid` int(11) NOT NULL,
  `internid` int(11) NOT NULL,
  `companyid` int(11) NOT NULL,
  `supervisorid` int(11) NOT NULL,
  `date` date NOT NULL,
  `timeIn` time DEFAULT NULL,
  `timeOut` time DEFAULT NULL,
  `hours` int(11) DEFAULT NULL,
  `workdescription` varchar(45) DEFAULT NULL,
  `verificationstatus` varchar(45) DEFAULT 'PENDING',
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
INSERT INTO `dailyreports` VALUES (1,1,1,110,'2023-10-06','08:00:00','16:00:00',8,'joshua nagooverthink','yes','yes');
/*!40000 ALTER TABLE `dailyreports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `internrequirements`
--

DROP TABLE IF EXISTS `internrequirements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `internrequirements` (
  `internid` int(11) NOT NULL,
  `reqid` int(11) NOT NULL,
  `datesubmitted` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `remarks` varchar(200) DEFAULT NULL,
  KEY `internid_fk_idx` (`internid`),
  KEY `reqid_fk_idx` (`reqid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `internrequirements`
--

LOCK TABLES `internrequirements` WRITE;
/*!40000 ALTER TABLE `internrequirements` DISABLE KEYS */;
INSERT INTO `internrequirements` VALUES (1,1,'2023-11-23','PENDING',NULL),(1,2,'2023-11-23','PENDING',NULL),(1,3,'2023-11-23','PENDING',NULL),(1,4,'2023-11-23','PENDING',NULL),(1,5,'2023-11-23','PENDING',NULL),(1,6,'2023-11-23','PENDING',NULL),(2,1,'2023-11-23','PENDING',NULL),(2,2,'2023-11-23','PENDING',NULL),(2,3,'2023-11-23','PENDING',NULL),(2,4,'2023-11-23','PENDING',NULL),(2,5,'2023-11-23','PENDING',NULL),(2,6,'2023-11-23','PENDING',NULL),(3,1,'2023-11-23','PENDING',NULL),(3,2,'2023-11-23','PENDING',NULL),(3,3,'2023-11-23','PENDING',NULL),(3,4,'2023-11-23','PENDING',NULL),(3,5,'2023-11-23','PENDING',NULL),(3,6,'2023-11-23','PENDING',NULL),(4,1,'2023-11-23','PENDING',NULL),(4,2,'2023-11-23','PENDING',NULL),(4,3,'2023-11-23','PENDING',NULL),(4,4,'2023-11-23','PENDING',NULL),(4,5,'2023-11-23','PENDING',NULL),(4,6,'2023-11-23','PENDING',NULL),(5,1,'2023-11-23','PENDING',NULL),(5,2,'2023-11-23','PENDING',NULL),(5,3,'2023-11-23','PENDING',NULL),(5,4,'2023-11-23','PENDING',NULL),(5,5,'2023-11-23','PENDING',NULL),(5,6,'2023-11-23','PENDING',NULL),(6,1,'2023-11-23','PENDING',NULL),(6,2,'2023-11-23','PENDING',NULL),(6,3,'2023-11-23','PENDING',NULL),(6,4,'2023-11-23','PENDING',NULL),(6,5,'2023-11-23','PENDING',NULL),(6,6,'2023-11-23','PENDING',NULL),(7,1,'2023-11-23','PENDING',NULL),(7,2,'2023-11-23','PENDING',NULL),(7,3,'2023-11-23','PENDING',NULL),(7,4,'2023-11-23','PENDING',NULL),(7,5,'2023-11-23','PENDING',NULL),(7,6,'2023-11-23','PENDING',NULL),(8,1,'2023-11-23','PENDING',NULL),(8,2,'2023-11-23','PENDING',NULL),(8,3,'2023-11-23','PENDING',NULL),(8,4,'2023-11-23','PENDING',NULL),(8,5,'2023-11-23','PENDING',NULL),(8,6,'2023-11-23','PENDING',NULL),(9,1,'2023-11-23','PENDING','3414'),(9,2,'2023-11-23','PENDING','qwersfewf'),(9,3,'2023-11-23','PENDING','asdffwef'),(9,4,'2023-11-23','PENDING','zxcv'),(9,5,'2023-11-23','PENDING','tyou'),(9,6,'2023-11-23','PENDING','ghjk'),(10,1,'2023-11-23','SUBMITTED','Please resubmit this to me by December 13'),(10,2,'2023-11-23','SUBMITTED','Please resubmit this to me by December 13'),(10,3,'2023-11-23','SUBMITTED',NULL),(10,4,'2023-11-23','SUBMITTED',NULL),(10,5,'2023-11-23','PENDING',NULL),(10,6,'2023-11-23','SUBMITTED',NULL),(11,1,'2023-11-23','PENDING',NULL),(11,2,'2023-11-23','PENDING',NULL),(11,3,'2023-11-23','PENDING',NULL),(11,4,'2023-11-23','PENDING',NULL),(11,5,'2023-11-23','PENDING',NULL),(11,6,'2023-11-23','PENDING',NULL),(12,1,'2023-11-23','PENDING',NULL),(12,2,'2023-11-23','PENDING',NULL),(12,3,'2023-11-23','PENDING',NULL),(12,4,'2023-11-23','PENDING',NULL),(12,5,'2023-11-23','PENDING',NULL),(12,6,'2023-11-23','PENDING',NULL),(13,1,'2023-11-23','PENDING',NULL),(13,2,'2023-11-23','PENDING',NULL),(13,3,'2023-11-23','PENDING',NULL),(13,4,'2023-11-23','PENDING',NULL),(13,5,'2023-11-23','PENDING',NULL),(13,6,'2023-11-23','PENDING',NULL),(14,1,'2023-11-23','PENDING','Please submit this form on or before december 13'),(14,2,'2023-11-23','PENDING','PLEASE SUBMIT THIS FORM ON OR BEFORE DECEMBER 15'),(14,3,'2023-11-23','PENDING',NULL),(14,4,'2023-11-23','PENDING',NULL),(14,5,'2023-11-23','PENDING',NULL),(14,6,'2023-11-23','PENDING',NULL),(15,1,'2023-11-23','PENDING','Please pass this on December 11'),(15,2,'2023-11-23','PENDING',NULL),(15,3,'2023-11-23','PENDING',NULL),(15,4,'2023-11-23','PENDING',NULL),(15,5,'2023-11-23','PENDING',NULL),(15,6,'2023-11-23','PENDING',NULL),(16,1,'2023-11-23','PENDING',NULL),(16,2,'2023-11-23','PENDING',NULL),(16,3,'2023-11-23','PENDING',NULL),(16,4,'2023-11-23','PENDING',NULL),(16,5,'2023-11-23','PENDING',NULL),(16,6,'2023-11-23','PENDING',NULL);
/*!40000 ALTER TABLE `internrequirements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interns`
--

DROP TABLE IF EXISTS `interns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interns` (
  `internid` int(11) NOT NULL,
  `password` varchar(60) NOT NULL,
  `adviserid` int(11) NOT NULL,
  `studentid` int(11) NOT NULL,
  `companyid` int(11) DEFAULT NULL,
  `supervisorid` int(11) DEFAULT NULL,
  `totalhours` int(11) DEFAULT NULL,
  `worktype` varchar(45) DEFAULT NULL,
  `image` blob,
  `status` varchar(45) DEFAULT 'PENDING',
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
INSERT INTO `interns` VALUES (1,'1234',1,2221023,1,110,NULL,'WFH',NULL,'ACCEPTED'),(2,'1234',2,2213241,2,120,180,'ON-SITE',NULL,'ACCEPTED'),(3,'1234',3,2211353,3,130,NULL,'WFH',NULL,'ACCEPTED'),(4,'1234',4,2211261,3,140,NULL,'ON-SITE',NULL,'ACCEPTED'),(5,'1234',5,2224514,4,150,240,'ON-SITE',NULL,'ACCEPTED'),(6,'1234',4,2225134,5,120,NULL,'WFH',NULL,'ACCEPTED'),(7,'1234',4,2225415,6,110,NULL,'ON-SITE',NULL,'ACCEPTED'),(8,'1234',5,2225134,1,110,240,'WFH',NULL,'ACCEPTED'),(9,'1234',5,2211010,3,NULL,NULL,NULL,NULL,'ACCEPTED'),(10,'1234',2,2223142,2,NULL,NULL,NULL,NULL,'ACCEPTED'),(11,'1234',4,2212312,NULL,NULL,NULL,NULL,NULL,'PENDING'),(12,'1234',2,2132132,NULL,NULL,NULL,NULL,NULL,'PENDING'),(13,'1234',5,2235482,2,NULL,NULL,NULL,NULL,'ACCEPTED'),(14,'1234',3,2247598,6,NULL,NULL,NULL,NULL,'PENDING'),(15,'1234',2,2214325,1,NULL,NULL,NULL,NULL,'PENDING'),(16,'1234',2,2298643,5,NULL,NULL,NULL,NULL,'PENDING');
/*!40000 ALTER TABLE `interns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requirements`
--

DROP TABLE IF EXISTS `requirements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requirements` (
  `reqid` int(11) NOT NULL AUTO_INCREMENT,
  `requirementname` varchar(45) NOT NULL,
  PRIMARY KEY (`reqid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requirements`
--

LOCK TABLES `requirements` WRITE;
/*!40000 ALTER TABLE `requirements` DISABLE KEYS */;
INSERT INTO `requirements` VALUES (1,'Application Letter'),(2,'Memorandum of Agreement'),(3,'Curriculum Vitae'),(4,'Recommendation Letter'),(5,'Medical Certificate'),(6,'Dental Certificate');
/*!40000 ALTER TABLE `requirements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `studentID` int(11) NOT NULL,
  `studentName` varchar(45) NOT NULL,
  `course` varchar(45) NOT NULL,
  `year` varchar(45) NOT NULL,
  `classcode` varchar(45) NOT NULL,
  PRIMARY KEY (`studentID`),
  UNIQUE KEY `studentID_UNIQUE` (`studentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (2132132,'Raya Colcol','BSCS','3','9375'),(2211010,'Peterjan Antonio','BSCS','3','9375'),(2211261,'Martel Molintas','BSCS','3','9375'),(2211353,'Bads Villalobos','BSCS','3','9375'),(2212312,'Kaizer Gura','BSCS','3','9375'),(2213241,'Shane Saguid','BSCS','3','9375'),(2214325,'Dennis Dumlao','BSCS','3','9375'),(2221023,'AJ Ramos','BSCS','3','9375'),(2222551,'Daniel David','BSCS','3','9375'),(2223142,'Kaizer Oman','BSCS','3','9376'),(2224514,'Ariel Tarlit','BSCS','3','9376'),(2225134,'Claire Tumaliuan','BSCS','3','9376'),(2225415,'Kiko Abella','BSCS','3','9376'),(2235482,'Kobe Rosales','BSCS','3','9376'),(2247598,'Kyle Sinaking','BSCS','3','9376'),(2298643,'Gregg Balagtey','BSCS','3','9376');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supervisors`
--

DROP TABLE IF EXISTS `supervisors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supervisors` (
  `supervisorid` int(11) NOT NULL,
  `supervisorname` varchar(45) DEFAULT NULL,
  `supervisoremail` varchar(45) DEFAULT NULL,
  `position` varchar(45) DEFAULT NULL,
  `companyid` int(11) DEFAULT NULL,
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

-- Dump completed on 2023-12-10 19:48:12
