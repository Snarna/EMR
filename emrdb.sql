-- MySQL dump 10.13  Distrib 5.7.16, for Linux (x86_64)
--
-- Host: localhost    Database: emrdb
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
-- Table structure for table `cd4testData`
--

DROP TABLE IF EXISTS `cd4testData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cd4testData` (
  `cd4testid` int(11) NOT NULL AUTO_INCREMENT,
  `patientid` int(11) NOT NULL,
  `cd4testnum` int(11) NOT NULL,
  `cd4testnotes` varchar(200) NOT NULL,
  `cd4testdate` date NOT NULL,
  `cd4testenterdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cd4testeditdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cd4testid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cd4testData`
--

LOCK TABLES `cd4testData` WRITE;
/*!40000 ALTER TABLE `cd4testData` DISABLE KEYS */;
INSERT INTO `cd4testData` VALUES (1,1,220,'Doing well','2016-11-28','2016-11-28 08:41:31','2016-11-28 15:03:31'),(2,1,110,'Looking Good','2016-11-28','2016-11-28 15:03:47','2016-11-28 15:04:00');
/*!40000 ALTER TABLE `cd4testData` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loadtestData`
--

DROP TABLE IF EXISTS `loadtestData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loadtestData` (
  `loadtestid` int(11) NOT NULL AUTO_INCREMENT,
  `patientid` int(11) NOT NULL,
  `loadtestnum` int(11) NOT NULL,
  `loadtestnotes` varchar(200) NOT NULL,
  `loadtestdate` date NOT NULL,
  `loadtestenterdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `loadtesteditdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`loadtestid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loadtestData`
--

LOCK TABLES `loadtestData` WRITE;
/*!40000 ALTER TABLE `loadtestData` DISABLE KEYS */;
INSERT INTO `loadtestData` VALUES (1,1,97,'Improving','2016-11-01','2016-11-28 08:42:38','2016-11-28 16:41:36');
/*!40000 ALTER TABLE `loadtestData` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patientsData`
--

DROP TABLE IF EXISTS `patientsData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientsData` (
  `patientid` int(11) NOT NULL AUTO_INCREMENT,
  `pfname` varchar(45) NOT NULL,
  `plname` varchar(45) NOT NULL,
  `pdob` date NOT NULL,
  `regDate` date NOT NULL,
  PRIMARY KEY (`patientid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patientsData`
--

LOCK TABLES `patientsData` WRITE;
/*!40000 ALTER TABLE `patientsData` DISABLE KEYS */;
INSERT INTO `patientsData` VALUES (1,'Rein','Heart','1978-06-15','2016-11-28'),(2,'John','Lee','1983-04-14','2016-11-28'),(3,'Smilo','Donn','1942-08-03','2016-11-28');
/*!40000 ALTER TABLE `patientsData` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `providersData`
--

DROP TABLE IF EXISTS `providersData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `providersData` (
  `providerid` int(11) NOT NULL AUTO_INCREMENT,
  `prousername` varchar(45) NOT NULL,
  `profname` varchar(45) NOT NULL,
  `prolname` varchar(45) NOT NULL,
  `proemail` varchar(45) NOT NULL,
  `propassword` varchar(512) NOT NULL,
  PRIMARY KEY (`providerid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `providersData`
--

LOCK TABLES `providersData` WRITE;
/*!40000 ALTER TABLE `providersData` DISABLE KEYS */;
INSERT INTO `providersData` VALUES (1,'xyq163446','Anthony','Chung','xyq163446@gmail.com','B109F3BBBC244EB82441917ED06D618B9008DD09B3BEFD1B5E07394C706A8BB980B1D7785E5976EC049B46DF5F1326AF5A2EA6D103FD07C95385FFAB0CACBC86');
/*!40000 ALTER TABLE `providersData` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surveyData`
--

DROP TABLE IF EXISTS `surveyData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surveyData` (
  `surveyid` int(11) NOT NULL AUTO_INCREMENT,
  `patientid` int(11) NOT NULL,
  `question1` text NOT NULL,
  `question2` text NOT NULL,
  `question3` text NOT NULL,
  `dateTaken` date NOT NULL,
  PRIMARY KEY (`surveyid`),
  KEY `patientid_idx` (`patientid`),
  CONSTRAINT `patientid_fk` FOREIGN KEY (`patientid`) REFERENCES `patientsData` (`patientid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surveyData`
--

LOCK TABLES `surveyData` WRITE;
/*!40000 ALTER TABLE `surveyData` DISABLE KEYS */;
INSERT INTO `surveyData` VALUES (1,1,'4','2','Sore throat','2016-11-28'),(2,1,'6','3','Itchy skin','2016-11-28'),(3,2,'8','3','Sore throat','2016-11-28'),(4,3,'6','3','None','2016-11-28');
/*!40000 ALTER TABLE `surveyData` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-28 11:49:16
