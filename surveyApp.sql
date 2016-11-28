-- MySQL dump 10.13  Distrib 5.7.16, for Linux (x86_64)
--
-- Host: localhost    Database: surveyApp
-- ------------------------------------------------------
-- Server version	5.7.16-0ubuntu0.16.04.1

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
-- Table structure for table `adminData`
--

DROP TABLE IF EXISTS `adminData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adminData` (
  `adminId` int(8) NOT NULL,
  `adminUsername` varchar(16) NOT NULL,
  `adminPassword` varchar(16) NOT NULL,
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminData`
--

LOCK TABLES `adminData` WRITE;
/*!40000 ALTER TABLE `adminData` DISABLE KEYS */;
INSERT INTO `adminData` VALUES (1,'crm123','pass'),(2,'sdc344','pass');
/*!40000 ALTER TABLE `adminData` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surveyData`
--

DROP TABLE IF EXISTS `surveyData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surveyData` (
  `surveyId` int(8) NOT NULL AUTO_INCREMENT,
  `surveyCode` varchar(8) DEFAULT NULL,
  `question1` varchar(32) DEFAULT NULL,
  `question2` varchar(32) DEFAULT NULL,
  `question3` varchar(32) DEFAULT NULL,
  `question4` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`surveyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surveyData`
--

LOCK TABLES `surveyData` WRITE;
/*!40000 ALTER TABLE `surveyData` DISABLE KEYS */;
/*!40000 ALTER TABLE `surveyData` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surveyTracker`
--

DROP TABLE IF EXISTS `surveyTracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surveyTracker` (
  `surveyCode` varchar(8) NOT NULL,
  `adminId` int(8) NOT NULL,
  `codeAvail` int(3) NOT NULL,
  `codeUsed` int(8) DEFAULT '0',
  PRIMARY KEY (`surveyCode`),
  KEY `adminId` (`adminId`),
  CONSTRAINT `surveyTracker_ibfk_1` FOREIGN KEY (`adminId`) REFERENCES `adminData` (`adminId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surveyTracker`
--

LOCK TABLES `surveyTracker` WRITE;
/*!40000 ALTER TABLE `surveyTracker` DISABLE KEYS */;
INSERT INTO `surveyTracker` VALUES ('AKC281',1,0,1),('BIR229',1,1,0),('crm001',1,35,26),('crm002',1,1,0),('crm003',1,1,0),('FFT272',1,1,0),('IRO608',1,1,0),('KUT813',1,1,0),('LDM632',1,1,0),('NIH595',1,1,0),('OUQ376',1,1,0),('QRG892',1,1,0),('RSE437',1,1,0),('SCG537',1,1,0),('SHO301',1,1,0),('SPL324',1,1,0),('tre233',2,4,0),('tre344',2,2,0),('UTD929',1,1,0),('VSZ335',1,1,0),('VVX412',1,1,0),('WMC904',1,1,0),('XAW733',1,1,0),('XKS295',1,1,0),('ZRJ471',1,1,0),('ZTK106',1,1,0);
/*!40000 ALTER TABLE `surveyTracker` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-28 11:50:32
