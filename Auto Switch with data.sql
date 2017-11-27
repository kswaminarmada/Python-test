CREATE DATABASE  IF NOT EXISTS `autoswitch` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `autoswitch`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: autoswitch
-- ------------------------------------------------------
-- Server version	5.7.12-log

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
-- Table structure for table `boards`
--

DROP TABLE IF EXISTS `boards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boards` (
  `BoardID` int(11) NOT NULL,
  `BoardName` varchar(45) DEFAULT '-',
  `Switches` int(11) DEFAULT '0',
  `MsgTopic` varchar(45) DEFAULT '-',
  `Location` varchar(45) DEFAULT '-',
  `WiFiSSID` varchar(45) DEFAULT '-',
  `StaticIP` varchar(20) DEFAULT '-',
  PRIMARY KEY (`BoardID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boards`
--

LOCK TABLES `boards` WRITE;
/*!40000 ALTER TABLE `boards` DISABLE KEYS */;
INSERT INTO `boards` VALUES (1,'SB001',5,'ND/SB001','tmp','AutoAP','192.168.128.61'),(2,'SB002',5,'ND/SB002','tmp','AutoAP','192.168.128.62');
/*!40000 ALTER TABLE `boards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logs` (
  `logID` int(11) NOT NULL AUTO_INCREMENT,
  `logdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `logdescription` varchar(255) DEFAULT '-',
  PRIMARY KEY (`logID`)
) ENGINE=InnoDB AUTO_INCREMENT=885 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` VALUES (1,'2017-06-25 17:25:38','Status Chandged for SB001-03 : OFF --> ON (logged By DBTrigger)'),(2,'2017-06-25 17:25:43','Status Chandged for SB001-03 : ON --> OFF (logged By DBTrigger)'),(3,'2017-06-25 17:25:45','Status Chandged for SB001-05 : OFF --> ON (logged By DBTrigger)'),(4,'2017-06-25 17:25:50','Status Chandged for SB001-05 : ON --> OFF (logged By DBTrigger)'),(5,'2017-06-25 17:26:05','Status Chandged for SB001-04 : OFF --> ON (logged By DBTrigger)'),(6,'2017-06-25 17:26:08','Status Chandged for SB001-03 : OFF --> ON (logged By DBTrigger)'),(7,'2017-06-25 17:26:10','Status Chandged for SB001-05 : OFF --> ON (logged By DBTrigger)'),(8,'2017-06-25 17:26:13','Status Chandged for SB001-04 : ON --> OFF (logged By DBTrigger)'),(9,'2017-06-25 17:26:18','Status Chandged for SB001-05 : ON --> OFF (logged By DBTrigger)'),(10,'2017-06-25 17:26:23','Status Chandged for SB001-03 : ON --> OFF (logged By DBTrigger)'),(11,'2017-06-25 19:46:13','Status Chandged for SB001-05 : OFF --> ON (logged By DBTrigger)'),(12,'2017-06-25 19:46:21','Published to MQTT Server with Topic : ND/SB001/05, Message: SB001-05-T-3, MQTT mid : 1'),(13,'2017-06-25 19:48:04','Status Chandged for SB001-05 : ON --> OFF (logged By DBTrigger)'),(14,'2017-06-25 19:48:12','Published to MQTT Server with Topic : ND/SB001/05, Message: SB001-05-F-3, MQTT mid : 2'),(15,'2017-06-25 20:06:31','Status Chandged for SB001-03 : OFF --> ON (logged By DBTrigger)'),(16,'2017-06-25 20:06:54','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-T-1, MQTT mid : 1'),(17,'2017-06-25 20:09:48','Status Chandged for SB001-04 : OFF --> ON (logged By DBTrigger)'),(18,'2017-06-25 20:09:57','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-T-2, MQTT mid : 2'),(19,'2017-06-25 20:11:57','Status Chandged for SB001-04 : ON --> OFF (logged By DBTrigger)'),(20,'2017-06-25 20:12:01','Status Chandged for SB001-03 : ON --> OFF (logged By DBTrigger)'),(21,'2017-06-25 20:12:05','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 3'),(22,'2017-06-25 20:12:05','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 4'),(23,'2017-06-25 20:12:09','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 4'),(24,'2017-06-25 20:15:06','Status Chandged for SB001-03 : OFF --> ON (logged By DBTrigger)'),(25,'2017-06-25 20:15:06','Status Chandged for SB001-04 : OFF --> ON (logged By DBTrigger)'),(26,'2017-06-25 20:15:14','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-T-1, MQTT mid : 1'),(27,'2017-06-25 20:15:14','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-T-2, MQTT mid : 2'),(28,'2017-06-25 20:15:14','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-T-2, MQTT mid : 2'),(29,'2017-06-25 20:15:58','Status Chandged for SB001-03 : ON --> OFF (logged By DBTrigger)'),(30,'2017-06-25 20:15:58','Status Chandged for SB001-04 : ON --> OFF (logged By DBTrigger)'),(31,'2017-06-25 20:16:06','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 3'),(32,'2017-06-25 20:16:06','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 4'),(33,'2017-06-25 20:16:06','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 4'),(34,'2017-06-25 20:18:34','Status Chandged for SB001-03 : OFF --> ON (logged By DBTrigger)'),(35,'2017-06-25 20:18:42','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-T-1, MQTT mid : 5'),(36,'2017-06-25 20:19:47','Status Chandged for SB001-04 : OFF --> ON (logged By DBTrigger)'),(37,'2017-06-25 20:19:55','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-T-2, MQTT mid : 6'),(38,'2017-06-25 20:20:00','Status Chandged for SB001-03 : ON --> OFF (logged By DBTrigger)'),(39,'2017-06-25 20:20:00','Status Chandged for SB001-04 : ON --> OFF (logged By DBTrigger)'),(40,'2017-06-25 20:20:08','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 7'),(41,'2017-06-25 20:20:08','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 8'),(42,'2017-06-25 20:20:09','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 8'),(43,'2017-06-25 20:35:49','Status Chandged for SB001-03 : OFF --> ON (logged By DBTrigger)'),(44,'2017-06-25 20:35:50','Status Chandged for SB001-04 : OFF --> ON (logged By DBTrigger)'),(45,'2017-06-25 20:35:50','Status Chandged for SB001-03 : ON --> OFF (logged By DBTrigger)'),(46,'2017-06-25 20:35:50','Status Chandged for SB001-04 : ON --> OFF (logged By DBTrigger)'),(47,'2017-06-25 20:35:50','Status Chandged for SB001-05 : OFF --> ON (logged By DBTrigger)'),(48,'2017-06-25 20:35:54','Status Chandged for SB001-05 : ON --> OFF (logged By DBTrigger)'),(49,'2017-06-25 20:35:59','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 9'),(50,'2017-06-25 20:35:59','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 10'),(51,'2017-06-25 20:35:59','Published to MQTT Server with Topic : ND/SB001/05, Message: SB001-05-F-3, MQTT mid : 11'),(52,'2017-06-25 20:35:59','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 10'),(53,'2017-06-25 20:35:59','Published to MQTT Server with Topic : ND/SB001/05, Message: SB001-05-F-3, MQTT mid : 11'),(54,'2017-06-25 20:36:03','Published to MQTT Server with Topic : ND/SB001/05, Message: SB001-05-F-3, MQTT mid : 11'),(55,'2017-06-25 20:46:25','Status Chandged for SB001-03 : OFF --> ON (logged By DBTrigger)'),(56,'2017-06-25 20:46:34','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-T-1, MQTT mid : 12'),(57,'2017-06-25 20:46:44','Status Chandged for SB001-04 : OFF --> ON (logged By DBTrigger)'),(58,'2017-06-25 20:46:52','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-T-2, MQTT mid : 13'),(59,'2017-06-25 20:47:07','Status Chandged for SB001-04 : ON --> OFF (logged By DBTrigger)'),(60,'2017-06-25 20:47:15','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 14'),(61,'2017-06-25 20:48:01','Status Chandged for SB001-03 : ON --> OFF (logged By DBTrigger)'),(62,'2017-06-25 20:48:09','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 15'),(63,'2017-06-26 13:12:23','Status Chandged for SB001-03 : OFF --> ON (logged By DBTrigger)'),(64,'2017-06-26 13:12:32','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-T-1, MQTT mid : 2'),(65,'2017-06-26 13:19:08','Status Chandged for SB001-03 : ON --> OFF (logged By DBTrigger)'),(66,'2017-06-26 13:19:21','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 2'),(67,'2017-06-26 13:25:44','Status Chandged for SB001-03 : OFF --> ON (logged By DBTrigger)'),(68,'2017-06-26 13:25:53','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-T-1, MQTT mid : 2'),(69,'2017-06-26 13:28:29','Status Chandged for SB001-03 : ON --> OFF (logged By DBTrigger)'),(70,'2017-06-26 13:28:41','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 2'),(71,'2017-06-26 13:39:23','Status Chandged for SB001-03 : OFF --> ON (logged By DBTrigger)'),(72,'2017-06-26 13:41:00','Status Chandged for SB001-03 : ON --> OFF (logged By DBTrigger)'),(73,'2017-06-26 13:41:20','Status Chandged for SB001-03 : OFF --> ON (logged By DBTrigger)'),(74,'2017-06-26 13:45:05','Status Chandged for SB001-03 : ON --> OFF (logged By DBTrigger)'),(75,'2017-06-26 13:45:18','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 2'),(76,'2017-06-26 13:47:36','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-T-1, MQTT mid : 2'),(77,'2017-06-26 13:47:36','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-T-1, MQTT mid : 3'),(78,'2017-06-26 13:47:36','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-T-1, MQTT mid : 4'),(79,'2017-06-26 13:47:36','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-T-1, MQTT mid : 3'),(80,'2017-06-26 13:47:36','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-T-1, MQTT mid : 4'),(81,'2017-06-26 13:54:47','Status Chandged for SB001-03 : OFF --> ON (logged By DBTrigger)'),(82,'2017-06-26 13:54:56','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 2'),(83,'2017-06-26 13:54:56','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 3'),(84,'2017-06-26 13:56:13','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 2'),(85,'2017-06-26 13:56:13','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 3'),(86,'2017-06-26 13:56:13','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 4'),(87,'2017-06-26 13:56:13','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 3'),(88,'2017-06-26 13:56:13','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 4'),(89,'2017-06-26 13:58:28','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 2'),(90,'2017-06-26 13:58:28','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 3'),(91,'2017-06-26 13:58:28','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 4'),(92,'2017-06-26 13:58:28','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 3'),(93,'2017-06-26 13:58:28','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 4'),(94,'2017-06-26 14:04:33','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 2'),(95,'2017-06-26 14:04:33','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 3'),(96,'2017-06-26 14:04:33','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 4'),(97,'2017-06-26 14:04:33','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 3'),(98,'2017-06-26 14:04:33','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 4'),(99,'2017-06-26 16:54:50','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 2'),(100,'2017-06-26 16:54:50','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 3'),(101,'2017-06-26 16:54:50','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 4'),(102,'2017-06-26 16:54:50','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 3'),(103,'2017-06-26 16:54:50','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 4'),(104,'2017-06-26 16:58:10','Status Chandged for SB001-03 : ON --> OFF (logged By DBTrigger)'),(105,'2017-06-26 17:16:02','Status Chandged for SB001-03 : OFF --> ON (logged By DBTrigger)'),(106,'2017-06-26 17:16:22','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 1'),(107,'2017-06-26 17:16:22','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 2'),(108,'2017-06-26 17:16:26','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 2'),(109,'2017-06-26 17:16:26','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 3'),(110,'2017-06-26 17:16:30','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 3'),(111,'2017-06-26 17:16:30','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 4'),(112,'2017-06-26 17:16:35','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 4'),(113,'2017-06-26 17:16:35','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 5'),(114,'2017-06-26 17:16:39','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 5'),(115,'2017-06-26 17:16:39','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 6'),(116,'2017-06-26 17:16:43','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 6'),(117,'2017-06-26 17:16:43','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 7'),(118,'2017-06-26 17:16:47','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 7'),(119,'2017-06-26 17:16:47','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 8'),(120,'2017-06-26 17:16:51','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 8'),(121,'2017-06-26 17:16:51','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 9'),(122,'2017-06-26 17:16:55','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 9'),(123,'2017-06-26 17:16:55','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 10'),(124,'2017-06-26 17:17:00','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 10'),(125,'2017-06-26 17:17:00','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 11'),(126,'2017-06-26 17:17:04','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 11'),(127,'2017-06-26 17:17:04','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 12'),(128,'2017-06-26 17:17:08','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 12'),(129,'2017-06-26 17:17:08','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 13'),(130,'2017-06-26 17:17:12','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 13'),(131,'2017-06-26 17:17:12','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 14'),(132,'2017-06-26 17:17:16','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 14'),(133,'2017-06-26 17:17:16','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 15'),(134,'2017-06-26 17:17:20','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 15'),(135,'2017-06-26 17:17:20','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 16'),(136,'2017-06-26 17:17:25','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 16'),(137,'2017-06-26 17:17:25','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 17'),(138,'2017-06-26 17:17:29','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 17'),(139,'2017-06-26 17:17:29','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 18'),(140,'2017-06-26 17:17:33','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 18'),(141,'2017-06-26 17:17:33','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 19'),(142,'2017-06-26 17:17:37','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 19'),(143,'2017-06-26 17:17:37','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 20'),(144,'2017-06-26 17:17:41','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 20'),(145,'2017-06-26 17:17:41','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 21'),(146,'2017-06-26 17:17:46','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 21'),(147,'2017-06-26 17:17:46','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 22'),(148,'2017-06-26 17:17:50','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 22'),(149,'2017-06-26 17:17:50','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 23'),(150,'2017-06-26 17:17:54','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 23'),(151,'2017-06-26 17:17:54','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 24'),(152,'2017-06-26 17:17:58','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 24'),(153,'2017-06-26 17:17:58','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 25'),(154,'2017-06-26 17:18:02','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 25'),(155,'2017-06-26 17:18:02','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 26'),(156,'2017-06-26 17:18:06','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 26'),(157,'2017-06-26 17:18:06','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 27'),(158,'2017-06-26 17:18:23','Status Chandged for SB001-03 : ON --> OFF (logged By DBTrigger)'),(159,'2017-06-26 17:21:46','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-T-1, MQTT mid : 1'),(160,'2017-06-26 17:21:46','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-T-1, MQTT mid : 2'),(161,'2017-06-26 17:21:50','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-T-1, MQTT mid : 2'),(162,'2017-06-26 17:21:50','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-T-1, MQTT mid : 3'),(163,'2017-06-26 17:21:55','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-T-1, MQTT mid : 3'),(164,'2017-06-26 17:21:55','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-T-1, MQTT mid : 4'),(165,'2017-06-26 17:21:59','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-T-1, MQTT mid : 4'),(166,'2017-06-26 17:21:59','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-T-1, MQTT mid : 5'),(167,'2017-06-26 17:22:03','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-T-1, MQTT mid : 5'),(168,'2017-06-26 17:22:03','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-T-1, MQTT mid : 6'),(169,'2017-06-26 17:22:07','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-T-1, MQTT mid : 6'),(170,'2017-06-26 17:22:07','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-T-1, MQTT mid : 7'),(171,'2017-06-26 17:22:11','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-T-1, MQTT mid : 7'),(172,'2017-06-26 17:22:11','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-T-1, MQTT mid : 8'),(173,'2017-06-26 17:22:15','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-T-1, MQTT mid : 8'),(174,'2017-06-26 17:22:15','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-T-1, MQTT mid : 9'),(175,'2017-06-26 17:22:49','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-T-1, MQTT mid : 2'),(176,'2017-06-26 17:22:49','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-T-1, MQTT mid : 3'),(177,'2017-06-26 17:22:49','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-T-1, MQTT mid : 4'),(178,'2017-06-26 17:22:49','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-T-1, MQTT mid : 3'),(179,'2017-06-26 17:22:49','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-T-1, MQTT mid : 4'),(180,'2017-06-26 17:25:40','Status Chandged for SB001-03 : OFF --> ON (logged By DBTrigger)'),(181,'2017-06-26 17:25:53','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 2'),(182,'2017-06-26 17:25:53','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 3'),(183,'2017-06-26 17:29:36','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 2'),(184,'2017-06-26 17:29:36','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 3'),(185,'2017-06-26 17:29:36','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 4'),(186,'2017-06-26 17:29:36','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 3'),(187,'2017-06-26 17:29:36','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 4'),(188,'2017-06-26 17:39:37','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 1'),(189,'2017-06-26 17:39:37','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 2'),(190,'2017-06-26 17:39:41','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 2'),(191,'2017-06-26 17:39:41','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 3'),(192,'2017-06-26 17:39:45','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 3'),(193,'2017-06-26 17:39:45','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 4'),(194,'2017-06-26 17:39:49','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 4'),(195,'2017-06-26 17:39:49','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 5'),(196,'2017-06-26 17:39:53','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 5'),(197,'2017-06-26 17:39:53','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 6'),(198,'2017-06-26 17:39:57','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 6'),(199,'2017-06-26 17:39:57','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 7'),(200,'2017-06-26 17:40:02','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 7'),(201,'2017-06-26 17:40:02','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 8'),(202,'2017-06-26 17:41:24','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 1'),(203,'2017-06-26 17:41:24','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 2'),(204,'2017-06-26 17:41:25','Status Chandged for SB001-03 : ON --> OFF (logged By DBTrigger)'),(205,'2017-06-26 17:41:28','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 2'),(206,'2017-06-26 17:41:28','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 3'),(207,'2017-06-26 17:41:32','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 3'),(208,'2017-06-26 17:59:04','Status Chandged for SB001-03 : OFF --> ON (logged By DBTrigger)'),(209,'2017-06-26 17:59:08','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-T-1, MQTT mid : 1'),(210,'2017-06-26 17:59:08','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-T-1, MQTT mid : 2'),(211,'2017-06-26 17:59:12','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-T-1, MQTT mid : 2'),(212,'2017-06-26 18:00:09','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 3'),(213,'2017-06-26 18:00:09','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 4'),(214,'2017-06-26 18:00:14','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 4'),(215,'2017-06-26 18:00:14','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 5'),(216,'2017-06-26 18:00:18','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 5'),(217,'2017-06-26 18:00:18','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 6'),(218,'2017-06-26 18:00:22','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 6'),(219,'2017-06-26 18:00:22','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 7'),(220,'2017-06-26 18:00:26','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 7'),(221,'2017-06-26 18:00:26','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 8'),(222,'2017-06-26 18:00:30','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 8'),(223,'2017-06-26 18:00:30','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 9'),(224,'2017-06-26 18:00:35','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 9'),(225,'2017-06-26 18:00:35','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 10'),(226,'2017-06-26 18:00:39','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 10'),(227,'2017-06-26 18:00:39','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 11'),(228,'2017-06-26 18:00:43','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 11'),(229,'2017-06-26 18:00:43','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 12'),(230,'2017-06-26 18:00:47','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 12'),(231,'2017-06-26 18:00:47','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 13'),(232,'2017-06-26 18:00:51','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 13'),(233,'2017-06-26 18:00:51','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 14'),(234,'2017-06-26 18:00:56','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 14'),(235,'2017-06-26 18:00:56','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 15'),(236,'2017-06-26 18:01:00','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 15'),(237,'2017-06-26 18:01:00','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 16'),(238,'2017-06-26 18:01:04','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 16'),(239,'2017-06-26 18:01:04','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 17'),(240,'2017-06-26 18:01:08','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 17'),(241,'2017-06-26 18:01:08','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 18'),(242,'2017-06-26 18:01:12','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 18'),(243,'2017-06-26 18:01:12','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 19'),(244,'2017-06-26 18:01:16','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 19'),(245,'2017-06-26 18:01:16','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 20'),(246,'2017-06-26 18:01:21','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 20'),(247,'2017-06-26 18:01:21','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 21'),(248,'2017-06-26 18:01:25','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 21'),(249,'2017-06-26 18:01:25','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 22'),(250,'2017-06-26 18:01:29','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 22'),(251,'2017-06-26 18:01:29','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 23'),(252,'2017-06-26 18:01:33','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 23'),(253,'2017-06-26 18:01:33','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 24'),(254,'2017-06-26 18:01:38','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 24'),(255,'2017-06-26 18:01:38','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 25'),(256,'2017-06-26 18:01:42','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 25'),(257,'2017-06-26 18:01:42','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 26'),(258,'2017-06-26 18:01:46','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 26'),(259,'2017-06-26 18:01:46','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 27'),(260,'2017-06-26 18:01:50','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 27'),(261,'2017-06-26 18:01:50','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 28'),(262,'2017-06-26 18:01:54','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 28'),(263,'2017-06-26 18:01:54','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 29'),(264,'2017-06-26 18:01:59','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 29'),(265,'2017-06-26 18:01:59','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 30'),(266,'2017-06-26 18:02:03','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 30'),(267,'2017-06-26 18:02:03','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 31'),(268,'2017-06-26 18:02:07','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 31'),(269,'2017-06-26 18:02:07','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 32'),(270,'2017-06-26 18:02:11','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 32'),(271,'2017-06-26 18:02:11','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 33'),(272,'2017-06-26 18:02:15','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 33'),(273,'2017-06-26 18:02:15','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 34'),(274,'2017-06-26 18:02:20','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 34'),(275,'2017-06-26 18:02:20','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 35'),(276,'2017-06-26 18:02:24','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 35'),(277,'2017-06-26 18:02:24','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 36'),(278,'2017-06-26 18:02:28','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 36'),(279,'2017-06-26 18:02:28','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 37'),(280,'2017-06-26 18:02:32','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 37'),(281,'2017-06-26 18:02:32','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 38'),(282,'2017-06-26 18:02:36','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 38'),(283,'2017-06-26 18:02:36','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 39'),(284,'2017-06-26 18:02:41','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 39'),(285,'2017-06-26 18:02:41','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 40'),(286,'2017-06-26 18:02:45','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 40'),(287,'2017-06-26 18:02:45','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 41'),(288,'2017-06-26 18:02:49','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 41'),(289,'2017-06-26 18:02:49','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 42'),(290,'2017-06-26 18:02:53','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 42'),(291,'2017-06-26 18:02:53','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 43'),(292,'2017-06-26 18:02:57','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 43'),(293,'2017-06-26 18:02:57','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 44'),(294,'2017-06-26 18:03:02','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 44'),(295,'2017-06-26 18:03:02','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 45'),(296,'2017-06-26 18:03:06','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 45'),(297,'2017-06-26 18:03:06','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 46'),(298,'2017-06-26 18:03:10','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 46'),(299,'2017-06-26 18:03:10','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 47'),(300,'2017-06-26 18:03:14','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 47'),(301,'2017-06-26 18:03:14','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 48'),(302,'2017-06-26 18:03:18','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 48'),(303,'2017-06-26 18:03:18','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 49'),(304,'2017-06-26 18:03:23','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 49'),(305,'2017-06-26 18:03:23','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 50'),(306,'2017-06-26 18:03:27','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 50'),(307,'2017-06-26 18:03:27','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 51'),(308,'2017-06-26 18:03:31','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 51'),(309,'2017-06-26 18:03:31','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 52'),(310,'2017-06-26 18:03:35','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 52'),(311,'2017-06-26 18:03:35','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 53'),(312,'2017-06-26 18:03:39','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 53'),(313,'2017-06-26 18:03:39','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 54'),(314,'2017-06-26 18:03:44','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 54'),(315,'2017-06-26 18:03:44','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 55'),(316,'2017-06-26 18:03:46','Status Chandged for SB001-03 : ON --> OFF (logged By DBTrigger)'),(317,'2017-06-26 18:03:48','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 55'),(318,'2017-06-26 18:03:48','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 56'),(319,'2017-06-26 18:03:52','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 56'),(320,'2017-06-26 18:05:04','Status Chandged for SB001-03 : OFF --> ON (logged By DBTrigger)'),(321,'2017-06-26 18:05:09','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-T-1, MQTT mid : 57'),(322,'2017-06-26 18:05:09','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-T-1, MQTT mid : 58'),(323,'2017-06-26 18:05:13','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-T-1, MQTT mid : 58'),(324,'2017-06-26 18:06:09','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 59'),(325,'2017-06-26 18:06:09','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 60'),(326,'2017-06-26 18:06:13','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 60'),(327,'2017-06-26 18:06:13','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 61'),(328,'2017-06-26 18:06:18','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 61'),(329,'2017-06-26 18:06:18','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 62'),(330,'2017-06-26 18:06:22','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 62'),(331,'2017-06-26 18:06:22','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 63'),(332,'2017-06-26 18:06:26','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 63'),(333,'2017-06-26 18:06:26','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 64'),(334,'2017-06-26 18:06:30','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 64'),(335,'2017-06-26 18:06:30','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 65'),(336,'2017-06-26 18:06:34','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 65'),(337,'2017-06-26 18:06:34','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 66'),(338,'2017-06-26 18:06:39','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 66'),(339,'2017-06-26 18:06:39','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 67'),(340,'2017-06-26 18:06:43','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 67'),(341,'2017-06-26 18:06:43','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 68'),(342,'2017-06-26 18:06:47','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 68'),(343,'2017-06-26 18:06:47','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 69'),(344,'2017-06-26 18:06:51','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 69'),(345,'2017-06-26 18:06:51','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 70'),(346,'2017-06-26 18:06:55','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 70'),(347,'2017-06-26 18:06:55','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 71'),(348,'2017-06-26 18:06:59','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 71'),(349,'2017-06-26 18:06:59','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 72'),(350,'2017-06-26 18:07:04','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 72'),(351,'2017-06-26 18:07:04','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 73'),(352,'2017-06-26 18:07:08','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 73'),(353,'2017-06-26 18:07:08','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 74'),(354,'2017-06-26 18:07:12','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 74'),(355,'2017-06-26 18:07:12','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 75'),(356,'2017-06-26 18:07:16','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 75'),(357,'2017-06-26 18:07:16','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 76'),(358,'2017-06-26 18:07:20','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 76'),(359,'2017-06-26 18:07:20','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 77'),(360,'2017-06-26 18:07:25','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 77'),(361,'2017-06-26 18:07:25','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 78'),(362,'2017-06-26 18:07:29','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 78'),(363,'2017-06-26 18:07:29','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 79'),(364,'2017-06-26 18:07:33','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 79'),(365,'2017-06-26 18:07:33','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 80'),(366,'2017-06-26 18:07:37','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 80'),(367,'2017-06-26 18:07:37','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 81'),(368,'2017-06-26 18:07:41','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 81'),(369,'2017-06-26 18:07:41','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 82'),(370,'2017-06-26 18:07:46','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 82'),(371,'2017-06-26 18:07:46','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 83'),(372,'2017-06-26 18:07:50','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 83'),(373,'2017-06-26 18:07:50','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 84'),(374,'2017-06-26 18:07:54','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 84'),(375,'2017-06-26 18:07:54','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 85'),(376,'2017-06-26 18:07:58','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 85'),(377,'2017-06-26 18:07:58','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 86'),(378,'2017-06-26 18:08:02','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 86'),(379,'2017-06-26 18:08:02','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 87'),(380,'2017-06-26 18:08:06','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 87'),(381,'2017-06-26 18:08:06','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 88'),(382,'2017-06-26 18:08:11','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 88'),(383,'2017-06-26 18:08:11','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 89'),(384,'2017-06-26 18:08:15','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 89'),(385,'2017-06-26 18:08:15','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 90'),(386,'2017-06-26 18:08:19','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 90'),(387,'2017-06-26 18:08:19','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 91'),(388,'2017-06-26 18:08:20','Status Chandged for SB001-03 : ON --> OFF (logged By DBTrigger)'),(389,'2017-06-26 18:08:23','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 91'),(390,'2017-06-26 18:08:23','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 92'),(391,'2017-06-26 18:08:28','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 92'),(392,'2017-06-26 18:09:56','Status Chandged for SB001-03 : OFF --> ON (logged By DBTrigger)'),(393,'2017-06-26 18:10:00','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-T-1, MQTT mid : 93'),(394,'2017-06-26 18:10:00','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-T-1, MQTT mid : 94'),(395,'2017-06-26 18:10:04','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-T-1, MQTT mid : 94'),(396,'2017-06-26 18:11:09','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 95'),(397,'2017-06-26 18:11:09','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 96'),(398,'2017-06-26 18:11:13','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 96'),(399,'2017-06-26 18:11:13','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 97'),(400,'2017-06-26 18:11:18','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 97'),(401,'2017-06-26 18:11:18','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 98'),(402,'2017-06-26 18:11:22','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 98'),(403,'2017-06-26 18:11:22','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 99'),(404,'2017-06-26 18:11:26','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 99'),(405,'2017-06-26 18:11:26','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 100'),(406,'2017-06-26 18:11:30','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 100'),(407,'2017-06-26 18:11:30','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 101'),(408,'2017-06-26 18:11:34','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 101'),(409,'2017-06-26 18:11:34','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 102'),(410,'2017-06-26 18:11:39','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 102'),(411,'2017-06-26 18:11:39','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 103'),(412,'2017-06-26 18:11:43','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 103'),(413,'2017-06-26 18:11:43','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 104'),(414,'2017-06-26 18:11:47','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 104'),(415,'2017-06-26 18:11:47','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 105'),(416,'2017-06-26 18:11:51','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 105'),(417,'2017-06-26 18:11:51','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 106'),(418,'2017-06-26 18:11:55','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 106'),(419,'2017-06-26 18:11:55','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 107'),(420,'2017-06-26 18:12:00','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 107'),(421,'2017-06-26 18:12:00','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 108'),(422,'2017-06-26 18:12:04','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 108'),(423,'2017-06-26 18:12:04','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 109'),(424,'2017-06-26 18:12:08','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 109'),(425,'2017-06-26 18:12:08','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 110'),(426,'2017-06-26 18:12:12','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 110'),(427,'2017-06-26 18:12:12','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 111'),(428,'2017-06-26 18:12:16','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 111'),(429,'2017-06-26 18:12:16','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 112'),(430,'2017-06-26 18:12:20','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 112'),(431,'2017-06-26 18:12:20','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 113'),(432,'2017-06-26 18:12:25','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 113'),(433,'2017-06-26 18:12:25','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 114'),(434,'2017-06-26 18:12:29','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 114'),(435,'2017-06-26 18:12:29','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 115'),(436,'2017-06-26 18:12:33','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 115'),(437,'2017-06-26 18:12:33','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 116'),(438,'2017-06-26 18:12:37','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 116'),(439,'2017-06-26 18:12:37','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 117'),(440,'2017-06-26 18:12:42','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 117'),(441,'2017-06-26 18:12:42','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 118'),(442,'2017-06-26 18:12:46','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 118'),(443,'2017-06-26 18:12:46','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 119'),(444,'2017-06-26 18:12:50','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 119'),(445,'2017-06-26 18:12:50','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 120'),(446,'2017-06-26 18:12:54','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 120'),(447,'2017-06-26 18:12:54','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 121'),(448,'2017-06-26 18:12:58','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 121'),(449,'2017-06-26 18:12:58','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 122'),(450,'2017-06-26 18:13:03','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 122'),(451,'2017-06-26 18:13:03','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 123'),(452,'2017-06-26 18:13:07','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 123'),(453,'2017-06-26 18:13:07','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 124'),(454,'2017-06-26 18:13:11','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 124'),(455,'2017-06-26 18:13:11','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 125'),(456,'2017-06-26 18:13:15','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 125'),(457,'2017-06-26 18:13:15','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 126'),(458,'2017-06-26 18:13:19','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 126'),(459,'2017-06-26 18:13:19','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 127'),(460,'2017-06-26 18:13:23','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 127'),(461,'2017-06-26 18:13:23','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 128'),(462,'2017-06-26 18:13:28','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 128'),(463,'2017-06-26 18:13:28','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 129'),(464,'2017-06-26 18:13:32','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 129'),(465,'2017-06-26 18:13:32','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 130'),(466,'2017-06-26 18:13:36','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 130'),(467,'2017-06-26 18:13:36','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 131'),(468,'2017-06-26 18:13:40','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 131'),(469,'2017-06-26 18:13:40','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 132'),(470,'2017-06-26 18:13:45','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 132'),(471,'2017-06-26 18:13:45','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 133'),(472,'2017-06-26 18:13:49','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 133'),(473,'2017-06-26 18:13:49','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 134'),(474,'2017-06-26 18:13:53','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 134'),(475,'2017-06-26 18:13:53','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 135'),(476,'2017-06-26 18:13:57','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 135'),(477,'2017-06-26 18:13:57','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 136'),(478,'2017-06-26 18:14:01','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 136'),(479,'2017-06-26 18:14:01','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 137'),(480,'2017-06-26 18:14:05','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 137'),(481,'2017-06-26 18:14:05','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 138'),(482,'2017-06-26 18:14:10','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 138'),(483,'2017-06-26 18:14:10','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 139'),(484,'2017-06-26 18:14:14','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 139'),(485,'2017-06-26 18:14:14','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 140'),(486,'2017-06-26 18:14:18','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 140'),(487,'2017-06-26 18:14:18','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 141'),(488,'2017-06-26 18:14:22','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 141'),(489,'2017-06-26 18:14:22','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 142'),(490,'2017-06-26 18:14:26','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 142'),(491,'2017-06-26 18:14:26','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 143'),(492,'2017-06-26 18:14:31','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 143'),(493,'2017-06-26 18:14:31','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 144'),(494,'2017-06-26 18:14:35','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 144'),(495,'2017-06-26 18:14:35','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 145'),(496,'2017-06-26 18:14:39','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 145'),(497,'2017-06-26 18:14:39','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 146'),(498,'2017-06-26 18:14:43','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 146'),(499,'2017-06-26 18:14:43','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 147'),(500,'2017-06-26 18:14:47','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 147'),(501,'2017-06-26 18:14:47','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 148'),(502,'2017-06-26 18:14:52','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 148'),(503,'2017-06-26 18:14:52','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 149'),(504,'2017-06-26 18:14:56','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 149'),(505,'2017-06-26 18:14:56','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 150'),(506,'2017-06-26 18:15:00','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 150'),(507,'2017-06-26 18:15:00','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 151'),(508,'2017-06-26 18:15:04','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 151'),(509,'2017-06-26 18:15:04','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 152'),(510,'2017-06-26 18:15:08','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 152'),(511,'2017-06-26 18:15:08','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 153'),(512,'2017-06-26 18:15:11','Status Chandged for SB001-03 : ON --> OFF (logged By DBTrigger)'),(513,'2017-06-26 18:15:12','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 153'),(514,'2017-06-26 18:15:12','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 154'),(515,'2017-06-26 18:15:17','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 154'),(516,'2017-06-26 18:16:29','Status Chandged for SB001-03 : OFF --> ON (logged By DBTrigger)'),(517,'2017-06-26 18:16:33','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-T-1, MQTT mid : 155'),(518,'2017-06-26 18:16:33','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-T-1, MQTT mid : 156'),(519,'2017-06-26 18:16:37','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-T-1, MQTT mid : 156'),(520,'2017-06-26 18:18:02','Status Chandged for SB001-03 : ON --> OFF (logged By DBTrigger)'),(521,'2017-06-26 18:18:06','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 157'),(522,'2017-06-26 18:18:06','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 158'),(523,'2017-06-26 18:18:10','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 158'),(524,'2017-06-26 18:43:49','Status Chandged for SB001-03 : OFF --> ON (logged By DBTrigger)'),(525,'2017-06-26 18:43:57','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 159'),(526,'2017-06-26 18:43:57','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 160'),(527,'2017-06-26 18:43:59','Status Chandged for SB001-03 : ON --> OFF (logged By DBTrigger)'),(528,'2017-06-26 18:44:01','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 160'),(529,'2017-06-26 18:44:01','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 161'),(530,'2017-06-26 18:44:05','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 161'),(531,'2017-06-26 18:45:01','Status Chandged for SB001-03 : OFF --> ON (logged By DBTrigger)'),(532,'2017-06-26 18:45:12','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 162'),(533,'2017-06-26 18:45:12','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 163'),(534,'2017-06-26 18:45:16','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 163'),(535,'2017-06-26 18:45:16','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 164'),(536,'2017-06-26 18:45:20','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 164'),(537,'2017-06-26 18:45:20','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 165'),(538,'2017-06-26 18:45:25','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 165'),(539,'2017-06-26 18:45:25','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 166'),(540,'2017-06-26 18:45:29','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 166'),(541,'2017-06-26 18:45:29','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 167'),(542,'2017-06-26 18:45:33','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 167'),(543,'2017-06-26 18:45:33','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 168'),(544,'2017-06-26 18:45:37','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 168'),(545,'2017-06-26 18:45:37','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 169'),(546,'2017-06-26 18:45:41','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 169'),(547,'2017-06-26 18:45:41','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 170'),(548,'2017-06-26 18:45:45','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 170'),(549,'2017-06-26 18:45:45','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 171'),(550,'2017-06-26 18:45:50','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 171'),(551,'2017-06-26 18:45:50','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 172'),(552,'2017-06-26 18:45:52','Status Chandged for SB001-03 : ON --> OFF (logged By DBTrigger)'),(553,'2017-06-26 18:45:54','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 172'),(554,'2017-06-26 18:45:54','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 173'),(555,'2017-06-26 18:45:58','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 173'),(556,'2017-06-26 18:46:40','Status Chandged for SB001-03 : OFF --> ON (logged By DBTrigger)'),(557,'2017-06-26 18:46:47','Status Chandged for SB001-03 : ON --> OFF (logged By DBTrigger)'),(558,'2017-06-26 18:46:51','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 174'),(559,'2017-06-26 18:46:51','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 175'),(560,'2017-06-26 18:46:55','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 175'),(561,'2017-06-26 18:48:07','Status Chandged for SB001-04 : OFF --> ON (logged By DBTrigger)'),(562,'2017-06-26 18:48:12','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-T-2, MQTT mid : 176'),(563,'2017-06-26 18:48:12','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-T-2, MQTT mid : 177'),(564,'2017-06-26 18:48:12','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-T-2, MQTT mid : 178'),(565,'2017-06-26 18:48:12','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-T-2, MQTT mid : 177'),(566,'2017-06-26 18:48:12','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-T-2, MQTT mid : 178'),(567,'2017-06-26 18:48:16','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-T-2, MQTT mid : 178'),(568,'2017-06-26 18:49:36','Status Chandged for SB001-04 : ON --> OFF (logged By DBTrigger)'),(569,'2017-06-26 18:49:41','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 179'),(570,'2017-06-26 18:49:41','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 180'),(571,'2017-06-26 18:49:45','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 180'),(572,'2017-06-26 18:52:52','Status Chandged for SB001-03 : OFF --> ON (logged By DBTrigger)'),(573,'2017-06-26 18:52:52','Status Chandged for SB001-04 : OFF --> ON (logged By DBTrigger)'),(574,'2017-06-26 18:52:56','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-T-1, MQTT mid : 181'),(575,'2017-06-26 18:52:56','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-T-2, MQTT mid : 182'),(576,'2017-06-26 18:52:56','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-T-1, MQTT mid : 183'),(577,'2017-06-26 18:52:56','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-T-2, MQTT mid : 184'),(578,'2017-06-26 18:52:56','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-T-2, MQTT mid : 182'),(579,'2017-06-26 18:52:56','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-T-1, MQTT mid : 183'),(580,'2017-06-26 18:52:56','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-T-2, MQTT mid : 184'),(581,'2017-06-26 18:53:01','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-T-1, MQTT mid : 183'),(582,'2017-06-26 18:53:01','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-T-2, MQTT mid : 184'),(583,'2017-06-26 18:53:01','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 185'),(584,'2017-06-26 18:53:01','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 186'),(585,'2017-06-26 18:53:01','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-T-2, MQTT mid : 184'),(586,'2017-06-26 18:53:01','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 185'),(587,'2017-06-26 18:53:01','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 186'),(588,'2017-06-26 18:53:01','Status Chandged for SB001-03 : ON --> OFF (logged By DBTrigger)'),(589,'2017-06-26 18:53:01','Status Chandged for SB001-04 : ON --> OFF (logged By DBTrigger)'),(590,'2017-06-26 18:53:05','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 185'),(591,'2017-06-26 18:53:05','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 186'),(592,'2017-06-26 18:53:05','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 187'),(593,'2017-06-26 18:53:05','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 188'),(594,'2017-06-26 18:53:05','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 186'),(595,'2017-06-26 18:53:05','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 187'),(596,'2017-06-26 18:53:05','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 188'),(597,'2017-06-26 18:53:09','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 187'),(598,'2017-06-26 18:53:09','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 188'),(599,'2017-06-26 18:53:09','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 188'),(600,'2017-06-26 18:53:50','Status Chandged for SB001-03 : OFF --> ON (logged By DBTrigger)'),(601,'2017-06-26 18:53:50','Status Chandged for SB001-04 : OFF --> ON (logged By DBTrigger)'),(602,'2017-06-26 18:53:54','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-T-1, MQTT mid : 189'),(603,'2017-06-26 18:53:54','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-T-2, MQTT mid : 190'),(604,'2017-06-26 18:53:54','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-T-1, MQTT mid : 191'),(605,'2017-06-26 18:53:54','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-T-2, MQTT mid : 192'),(606,'2017-06-26 18:53:54','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-T-2, MQTT mid : 190'),(607,'2017-06-26 18:53:54','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-T-1, MQTT mid : 191'),(608,'2017-06-26 18:53:54','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-T-2, MQTT mid : 192'),(609,'2017-06-26 18:53:58','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-T-1, MQTT mid : 191'),(610,'2017-06-26 18:53:58','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-T-2, MQTT mid : 192'),(611,'2017-06-26 18:53:58','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-T-2, MQTT mid : 192'),(612,'2017-06-26 18:54:03','Status Chandged for SB001-03 : ON --> OFF (logged By DBTrigger)'),(613,'2017-06-26 18:54:03','Status Chandged for SB001-04 : ON --> OFF (logged By DBTrigger)'),(614,'2017-06-26 18:54:07','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 193'),(615,'2017-06-26 18:54:07','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 194'),(616,'2017-06-26 18:54:07','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 195'),(617,'2017-06-26 18:54:07','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 196'),(618,'2017-06-26 18:54:07','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 194'),(619,'2017-06-26 18:54:07','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 195'),(620,'2017-06-26 18:54:07','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 196'),(621,'2017-06-26 18:54:11','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 195'),(622,'2017-06-26 18:54:11','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 196'),(623,'2017-06-26 18:54:11','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 196'),(624,'2017-06-26 18:58:37','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-T-1, MQTT mid : 2'),(625,'2017-06-26 18:58:37','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-T-2, MQTT mid : 3'),(626,'2017-06-26 18:58:37','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-T-1, MQTT mid : 4'),(627,'2017-06-26 18:58:37','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-T-2, MQTT mid : 5'),(628,'2017-06-26 18:58:37','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-T-2, MQTT mid : 3'),(629,'2017-06-26 18:58:37','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-T-1, MQTT mid : 4'),(630,'2017-06-26 18:58:37','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-T-2, MQTT mid : 5'),(631,'2017-06-26 19:00:28','Status Chandged for SB001-03 : OFF --> ON (logged By DBTrigger)'),(632,'2017-06-26 19:00:28','Status Chandged for SB001-04 : OFF --> ON (logged By DBTrigger)'),(633,'2017-06-26 19:00:38','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 2'),(634,'2017-06-26 19:00:38','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 3'),(635,'2017-06-26 19:00:38','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 4'),(636,'2017-06-26 19:00:38','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 5'),(637,'2017-06-26 19:00:38','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 3'),(638,'2017-06-26 19:00:38','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 4'),(639,'2017-06-26 19:00:38','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 5'),(640,'2017-06-26 19:07:57','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 2'),(641,'2017-06-26 19:07:57','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 3'),(642,'2017-06-26 19:07:57','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 4'),(643,'2017-06-26 19:07:57','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 5'),(644,'2017-06-26 19:14:13','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 2'),(645,'2017-06-26 19:14:13','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 3'),(646,'2017-06-26 19:14:13','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 4'),(647,'2017-06-26 19:14:13','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 5'),(648,'2017-06-26 19:17:02','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 2'),(649,'2017-06-26 19:17:02','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 3'),(650,'2017-06-26 19:17:02','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 4'),(651,'2017-06-26 19:17:02','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 5'),(652,'2017-06-26 19:20:22','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 2'),(653,'2017-06-26 19:20:22','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 3'),(654,'2017-06-26 19:20:22','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 4'),(655,'2017-06-26 19:20:22','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 5'),(656,'2017-06-26 19:20:22','Status Chandged for SB001-03 : ON --> OFF (logged By DBTrigger)'),(657,'2017-06-26 19:20:26','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 3'),(658,'2017-06-26 19:20:26','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 4'),(659,'2017-06-26 19:20:26','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 5'),(660,'2017-06-26 19:20:26','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 6'),(661,'2017-06-26 19:20:26','Status Chandged for SB001-04 : ON --> OFF (logged By DBTrigger)'),(662,'2017-06-26 19:20:26','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 4'),(663,'2017-06-26 19:20:26','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 5'),(664,'2017-06-26 19:20:26','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 6'),(665,'2017-06-26 19:20:34','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 5'),(666,'2017-06-26 19:20:34','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 6'),(667,'2017-06-26 19:20:38','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 6'),(668,'2017-06-26 19:28:46','Status Chandged for SB001-03 : OFF --> ON (logged By DBTrigger)'),(669,'2017-06-26 19:28:46','Status Chandged for SB001-04 : OFF --> ON (logged By DBTrigger)'),(670,'2017-06-26 19:28:55','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 2'),(671,'2017-06-26 19:28:55','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 3'),(672,'2017-06-26 19:28:55','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 4'),(673,'2017-06-26 19:28:55','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 5'),(674,'2017-06-26 19:28:55','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 3'),(675,'2017-06-26 19:28:55','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 4'),(676,'2017-06-26 19:28:55','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 5'),(677,'2017-06-26 19:32:00','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 2'),(678,'2017-06-26 19:32:00','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 3'),(679,'2017-06-26 19:32:00','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 4'),(680,'2017-06-26 19:32:00','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 5'),(681,'2017-06-26 19:32:00','Status Chandged for SB001-03 : ON --> OFF (logged By DBTrigger)'),(682,'2017-06-26 19:32:04','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 3'),(683,'2017-06-26 19:32:04','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 4'),(684,'2017-06-26 19:32:04','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 5'),(685,'2017-06-26 19:32:04','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 6'),(686,'2017-06-26 19:32:04','Status Chandged for SB001-04 : ON --> OFF (logged By DBTrigger)'),(687,'2017-06-26 19:32:04','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 4'),(688,'2017-06-26 19:32:04','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 5'),(689,'2017-06-26 19:32:04','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 6'),(690,'2017-06-26 19:32:13','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 5'),(691,'2017-06-26 19:32:13','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 6'),(692,'2017-06-26 19:32:17','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 6'),(693,'2017-06-26 19:33:56','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-T-1, MQTT mid : 7'),(694,'2017-06-26 19:33:56','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-T-1, MQTT mid : 8'),(695,'2017-06-26 19:33:56','Status Chandged for SB001-03 : OFF --> ON (logged By DBTrigger)'),(696,'2017-06-26 19:34:04','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-T-1, MQTT mid : 8'),(697,'2017-06-26 19:34:52','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-T-2, MQTT mid : 9'),(698,'2017-06-26 19:34:52','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-T-2, MQTT mid : 10'),(699,'2017-06-26 19:34:52','Status Chandged for SB001-04 : OFF --> ON (logged By DBTrigger)'),(700,'2017-06-26 19:35:00','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-T-2, MQTT mid : 10'),(701,'2017-06-26 19:35:12','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 11'),(702,'2017-06-26 19:35:12','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 12'),(703,'2017-06-26 19:35:12','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 13'),(704,'2017-06-26 19:35:12','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 12'),(705,'2017-06-26 19:35:12','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 13'),(706,'2017-06-26 19:35:12','Status Chandged for SB001-03 : ON --> OFF (logged By DBTrigger)'),(707,'2017-06-26 19:35:21','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 13'),(708,'2017-06-26 19:35:21','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 14'),(709,'2017-06-26 19:35:21','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 15'),(710,'2017-06-26 19:35:25','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 14'),(711,'2017-06-26 19:35:25','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 15'),(712,'2017-06-26 19:35:25','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 16'),(713,'2017-06-26 19:35:25','Status Chandged for SB001-04 : ON --> OFF (logged By DBTrigger)'),(714,'2017-06-26 19:35:29','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 15'),(715,'2017-06-26 19:35:29','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 16'),(716,'2017-06-26 19:35:37','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 16'),(717,'2017-06-26 19:40:31','Status Chandged for SB001-03 : OFF --> ON (logged By DBTrigger)'),(718,'2017-06-26 19:40:31','Status Chandged for SB001-04 : OFF --> ON (logged By DBTrigger)'),(719,'2017-06-26 19:44:34','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 2'),(720,'2017-06-26 19:44:34','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 3'),(721,'2017-06-26 19:44:34','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 4'),(722,'2017-06-26 19:44:34','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 5'),(723,'2017-06-26 19:44:59','Status Chandged for SB001-03 : ON --> OFF (logged By DBTrigger)'),(724,'2017-06-26 19:48:39','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 2'),(725,'2017-06-26 19:48:39','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 3'),(726,'2017-06-26 19:48:39','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 4'),(727,'2017-06-26 19:48:40','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 3'),(728,'2017-06-26 19:48:40','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 4'),(729,'2017-06-26 19:48:40','Status Chandged for SB001-04 : ON --> OFF (logged By DBTrigger)'),(730,'2017-06-26 19:48:52','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 4'),(731,'2017-06-26 19:52:15','Status Chandged for SB001-03 : OFF --> ON (logged By DBTrigger)'),(732,'2017-06-26 19:53:22','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 2'),(733,'2017-06-26 19:53:22','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 3'),(734,'2017-06-26 19:53:22','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 4'),(735,'2017-06-26 19:55:06','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 2'),(736,'2017-06-26 19:55:06','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 3'),(737,'2017-06-26 19:55:06','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 4'),(738,'2017-06-26 19:55:06','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 3'),(739,'2017-06-26 19:55:06','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 4'),(740,'2017-06-26 19:55:06','Status Chandged for SB001-03 : ON --> OFF (logged By DBTrigger)'),(741,'2017-06-26 19:55:18','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 4'),(742,'2017-06-26 19:57:44','Status Chandged for SB001-03 : OFF --> ON (logged By DBTrigger)'),(743,'2017-06-26 20:00:21','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 2, 3, 4'),(744,'2017-06-26 20:00:26','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 3, 4'),(745,'2017-06-26 20:00:26','Status Chandged for SB001-03 : ON --> OFF (logged By DBTrigger)'),(746,'2017-06-26 20:00:50','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 4'),(747,'2017-06-26 20:06:55','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-T-1, MQTT mid : 5, 6'),(748,'2017-06-26 20:06:55','Status Chandged for SB001-03 : OFF --> ON (logged By DBTrigger)'),(749,'2017-06-26 20:07:03','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-T-1, MQTT mid : 6'),(750,'2017-06-26 20:07:56','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 7'),(751,'2017-06-26 20:07:56','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-T-2, MQTT mid : 8'),(752,'2017-06-26 20:07:56','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 9'),(753,'2017-06-26 20:07:56','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-T-2, MQTT mid : 10'),(754,'2017-06-26 20:07:56','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-T-2, MQTT mid : 8'),(755,'2017-06-26 20:07:56','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 9'),(756,'2017-06-26 20:07:56','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-T-2, MQTT mid : 10'),(757,'2017-06-26 20:07:56','Status Chandged for SB001-03 : ON --> OFF (logged By DBTrigger)'),(758,'2017-06-26 20:07:56','Status Chandged for SB001-04 : OFF --> ON (logged By DBTrigger)'),(759,'2017-06-26 20:08:04','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 9'),(760,'2017-06-26 20:08:04','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-T-2, MQTT mid : 10'),(761,'2017-06-26 20:08:04','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-T-2, MQTT mid : 10'),(762,'2017-06-26 20:08:54','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 11'),(763,'2017-06-26 20:08:54','Published to MQTT Server with Topic : ND/SB001/05, Message: SB001-05-T-3, MQTT mid : 12'),(764,'2017-06-26 20:08:54','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 13'),(765,'2017-06-26 20:08:54','Published to MQTT Server with Topic : ND/SB001/05, Message: SB001-05-T-3, MQTT mid : 14'),(766,'2017-06-26 20:08:54','Published to MQTT Server with Topic : ND/SB001/05, Message: SB001-05-T-3, MQTT mid : 12'),(767,'2017-06-26 20:08:54','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 13'),(768,'2017-06-26 20:08:54','Published to MQTT Server with Topic : ND/SB001/05, Message: SB001-05-T-3, MQTT mid : 14'),(769,'2017-06-26 20:08:54','Status Chandged for SB001-04 : ON --> OFF (logged By DBTrigger)'),(770,'2017-06-26 20:08:54','Status Chandged for SB001-05 : OFF --> ON (logged By DBTrigger)'),(771,'2017-06-26 20:09:03','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-2, MQTT mid : 13'),(772,'2017-06-26 20:09:03','Published to MQTT Server with Topic : ND/SB001/05, Message: SB001-05-T-3, MQTT mid : 14'),(773,'2017-06-26 20:09:03','Published to MQTT Server with Topic : ND/SB001/05, Message: SB001-05-T-3, MQTT mid : 14'),(774,'2017-06-26 20:09:53','Published to MQTT Server with Topic : ND/SB001/05, Message: SB001-05-F-3, MQTT mid : 15, 16'),(775,'2017-06-26 20:09:53','Status Chandged for SB001-05 : ON --> OFF (logged By DBTrigger)'),(776,'2017-06-26 20:10:01','Published to MQTT Server with Topic : ND/SB001/05, Message: SB001-05-F-3, MQTT mid : 16'),(777,'2017-06-26 20:18:25','Status Chandged for SB001-03 : OFF --> ON (logged By DBTrigger)'),(778,'2017-06-26 20:18:38','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 2, 3'),(779,'2017-06-26 20:18:38','Status Chandged for SB001-03 : ON --> OFF (logged By DBTrigger)'),(780,'2017-06-26 20:18:38','Database Switch Status is Changed With Message : b\'SB001-03-F-1-D\''),(781,'2017-06-26 20:18:47','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 3'),(782,'2017-06-26 20:18:51','Database Switch Status is Changed With Message : b\'SB001-03-F-1-D\''),(783,'2017-06-26 21:02:23','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-T-1, MQTT mid : 2, 3'),(784,'2017-06-26 21:02:23','Status Chandged for SB001-03 : OFF --> ON (logged By DBTrigger)'),(785,'2017-06-26 21:02:24','Database Switch Status is Changed With Message : b\'SB001-03-T-1-D\''),(786,'2017-06-26 21:02:32','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-T-1, MQTT mid : 3'),(787,'2017-06-26 21:02:36','Database Switch Status is Changed With Message : b\'SB001-03-T-1-D\''),(788,'2017-06-26 21:02:54','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 4, 5'),(789,'2017-06-26 21:02:54','Status Chandged for SB001-03 : ON --> OFF (logged By DBTrigger)'),(790,'2017-06-26 21:02:54','Database Switch Status is Changed With Message : b\'SB001-03-F-1-D\''),(791,'2017-06-26 21:03:03','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-1, MQTT mid : 5'),(792,'2017-06-26 21:03:07','Database Switch Status is Changed With Message : b\'SB001-03-F-1-D\''),(793,'2017-06-26 21:47:24','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-T-3, MQTT mid : 2'),(794,'2017-06-26 21:47:24','Published to MQTT Server with Topic : ND/SB002/03, Message: SB002-03-T-8, MQTT mid : 3'),(795,'2017-06-26 21:47:24','Published to MQTT Server with Topic : ND/SB002/03, Message: SB002-03-T-8, MQTT mid : 3'),(796,'2017-06-26 21:47:28','Status Chandged for SB001-03 : OFF --> ON (logged By DBTrigger)'),(797,'2017-06-26 21:47:28','Database Switch Status is Changed With Message : b\'SB001-03-T-3-D\''),(798,'2017-06-26 21:47:32','Status Chandged for SB002-03 : OFF --> ON (logged By DBTrigger)'),(799,'2017-06-26 21:47:32','Database Switch Status is Changed With Message : b\'SB002-03-T-8-D\''),(800,'2017-06-26 21:47:41','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-3, MQTT mid : 4, 5'),(801,'2017-06-26 21:47:41','Published to MQTT Server with Topic : ND/SB002/03, Message: SB002-03-F-8, MQTT mid : 6'),(802,'2017-06-26 21:47:41','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-3, MQTT mid : 7'),(803,'2017-06-26 21:47:41','Published to MQTT Server with Topic : ND/SB002/03, Message: SB002-03-F-8, MQTT mid : 8'),(804,'2017-06-26 21:47:41','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-3, MQTT mid : 5'),(805,'2017-06-26 21:47:41','Published to MQTT Server with Topic : ND/SB002/03, Message: SB002-03-F-8, MQTT mid : 6'),(806,'2017-06-26 21:47:41','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-3, MQTT mid : 7'),(807,'2017-06-26 21:47:41','Published to MQTT Server with Topic : ND/SB002/03, Message: SB002-03-F-8, MQTT mid : 8'),(808,'2017-06-26 21:47:41','Published to MQTT Server with Topic : ND/SB002/03, Message: SB002-03-F-8, MQTT mid : 6'),(809,'2017-06-26 21:47:41','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-3, MQTT mid : 7'),(810,'2017-06-26 21:47:41','Published to MQTT Server with Topic : ND/SB002/03, Message: SB002-03-F-8, MQTT mid : 8'),(811,'2017-06-26 21:47:41','Status Chandged for SB001-03 : ON --> OFF (logged By DBTrigger)'),(812,'2017-06-26 21:47:41','Database Switch Status is Changed With Message : b\'SB001-03-F-3-D\''),(813,'2017-06-26 21:47:41','Status Chandged for SB002-03 : ON --> OFF (logged By DBTrigger)'),(814,'2017-06-26 21:47:41','Database Switch Status is Changed With Message : b\'SB002-03-F-8-D\''),(815,'2017-06-26 21:47:45','Database Switch Status is Changed With Message : b\'SB001-03-F-3-D\''),(816,'2017-06-26 21:47:49','Published to MQTT Server with Topic : ND/SB001/03, Message: SB001-03-F-3, MQTT mid : 7'),(817,'2017-06-26 21:47:49','Published to MQTT Server with Topic : ND/SB002/03, Message: SB002-03-F-8, MQTT mid : 8'),(818,'2017-06-26 21:47:54','Database Switch Status is Changed With Message : b\'SB001-03-F-3-D\''),(819,'2017-06-26 21:47:58','Published to MQTT Server with Topic : ND/SB002/03, Message: SB002-03-F-8, MQTT mid : 8'),(820,'2017-06-26 21:48:02','Database Switch Status is Changed With Message : b\'SB002-03-F-8-D\''),(821,'2017-06-26 21:48:27','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-T-4, MQTT mid : 9'),(822,'2017-06-26 21:48:27','Published to MQTT Server with Topic : ND/SB002/04, Message: SB002-04-T-9, MQTT mid : 10'),(823,'2017-06-26 21:48:27','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-T-4, MQTT mid : 11'),(824,'2017-06-26 21:48:27','Published to MQTT Server with Topic : ND/SB002/04, Message: SB002-04-T-9, MQTT mid : 12'),(825,'2017-06-26 21:48:27','Published to MQTT Server with Topic : ND/SB002/04, Message: SB002-04-T-9, MQTT mid : 10'),(826,'2017-06-26 21:48:27','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-T-4, MQTT mid : 11'),(827,'2017-06-26 21:48:27','Published to MQTT Server with Topic : ND/SB002/04, Message: SB002-04-T-9, MQTT mid : 12'),(828,'2017-06-26 21:48:28','Status Chandged for SB001-04 : OFF --> ON (logged By DBTrigger)'),(829,'2017-06-26 21:48:28','Database Switch Status is Changed With Message : b\'SB001-04-T-4-D\''),(830,'2017-06-26 21:48:28','Status Chandged for SB002-04 : OFF --> ON (logged By DBTrigger)'),(831,'2017-06-26 21:48:28','Database Switch Status is Changed With Message : b\'SB002-04-T-9-D\''),(832,'2017-06-26 21:48:36','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-T-4, MQTT mid : 11'),(833,'2017-06-26 21:48:36','Published to MQTT Server with Topic : ND/SB002/04, Message: SB002-04-T-9, MQTT mid : 12'),(834,'2017-06-26 21:48:36','Published to MQTT Server with Topic : ND/SB002/04, Message: SB002-04-T-9, MQTT mid : 12'),(835,'2017-06-26 21:48:40','Database Switch Status is Changed With Message : b\'SB002-04-T-9-D\''),(836,'2017-06-26 21:48:44','Database Switch Status is Changed With Message : b\'SB001-04-T-4-D\''),(837,'2017-06-26 21:49:26','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-4, MQTT mid : 13'),(838,'2017-06-26 21:49:26','Published to MQTT Server with Topic : ND/SB002/04, Message: SB002-04-F-9, MQTT mid : 14'),(839,'2017-06-26 21:49:26','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-4, MQTT mid : 15'),(840,'2017-06-26 21:49:26','Published to MQTT Server with Topic : ND/SB002/04, Message: SB002-04-F-9, MQTT mid : 16'),(841,'2017-06-26 21:49:26','Published to MQTT Server with Topic : ND/SB002/04, Message: SB002-04-F-9, MQTT mid : 14'),(842,'2017-06-26 21:49:26','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-4, MQTT mid : 15'),(843,'2017-06-26 21:49:26','Published to MQTT Server with Topic : ND/SB002/04, Message: SB002-04-F-9, MQTT mid : 16'),(844,'2017-06-26 21:49:26','Status Chandged for SB001-04 : ON --> OFF (logged By DBTrigger)'),(845,'2017-06-26 21:49:26','Database Switch Status is Changed With Message : b\'SB001-04-F-4-D\''),(846,'2017-06-26 21:49:26','Status Chandged for SB002-04 : ON --> OFF (logged By DBTrigger)'),(847,'2017-06-26 21:49:26','Database Switch Status is Changed With Message : b\'SB002-04-F-9-D\''),(848,'2017-06-26 21:49:35','Published to MQTT Server with Topic : ND/SB001/04, Message: SB001-04-F-4, MQTT mid : 15'),(849,'2017-06-26 21:49:35','Published to MQTT Server with Topic : ND/SB002/04, Message: SB002-04-F-9, MQTT mid : 16'),(850,'2017-06-26 21:49:35','Published to MQTT Server with Topic : ND/SB002/04, Message: SB002-04-F-9, MQTT mid : 16'),(851,'2017-06-26 21:49:39','Database Switch Status is Changed With Message : b\'SB001-04-F-4-D\''),(852,'2017-06-26 21:49:43','Database Switch Status is Changed With Message : b\'SB002-04-F-9-D\''),(853,'2017-06-26 21:50:30','Published to MQTT Server with Topic : ND/SB001/05, Message: SB001-05-T-5, MQTT mid : 17'),(854,'2017-06-26 21:50:30','Published to MQTT Server with Topic : ND/SB002/05, Message: SB002-05-T-10, MQTT mid : 18'),(855,'2017-06-26 21:50:30','Published to MQTT Server with Topic : ND/SB001/05, Message: SB001-05-T-5, MQTT mid : 19'),(856,'2017-06-26 21:50:30','Published to MQTT Server with Topic : ND/SB002/05, Message: SB002-05-T-10, MQTT mid : 20'),(857,'2017-06-26 21:50:30','Published to MQTT Server with Topic : ND/SB002/05, Message: SB002-05-T-10, MQTT mid : 18'),(858,'2017-06-26 21:50:30','Published to MQTT Server with Topic : ND/SB001/05, Message: SB001-05-T-5, MQTT mid : 19'),(859,'2017-06-26 21:50:30','Published to MQTT Server with Topic : ND/SB002/05, Message: SB002-05-T-10, MQTT mid : 20'),(860,'2017-06-26 21:50:30','Status Chandged for SB001-05 : OFF --> ON (logged By DBTrigger)'),(861,'2017-06-26 21:50:30','Database Switch Status is Changed With Message : b\'SB001-05-T-5-D\''),(862,'2017-06-26 21:50:30','Status Chandged for SB002-05 : OFF --> ON (logged By DBTrigger)'),(863,'2017-06-26 21:50:30','Database Switch Status is Changed With Message : b\'SB002-05-T-10-D\''),(864,'2017-06-26 21:50:38','Published to MQTT Server with Topic : ND/SB001/05, Message: SB001-05-T-5, MQTT mid : 19'),(865,'2017-06-26 21:50:38','Published to MQTT Server with Topic : ND/SB002/05, Message: SB002-05-T-10, MQTT mid : 20'),(866,'2017-06-26 21:50:39','Published to MQTT Server with Topic : ND/SB002/05, Message: SB002-05-T-10, MQTT mid : 20'),(867,'2017-06-26 21:50:43','Database Switch Status is Changed With Message : b\'SB001-05-T-5-D\''),(868,'2017-06-26 21:50:47','Database Switch Status is Changed With Message : b\'SB002-05-T-10-D\''),(869,'2017-06-26 21:51:29','Published to MQTT Server with Topic : ND/SB001/05, Message: SB001-05-F-5, MQTT mid : 21'),(870,'2017-06-26 21:51:29','Published to MQTT Server with Topic : ND/SB002/05, Message: SB002-05-F-10, MQTT mid : 22'),(871,'2017-06-26 21:51:29','Published to MQTT Server with Topic : ND/SB001/05, Message: SB001-05-F-5, MQTT mid : 23'),(872,'2017-06-26 21:51:29','Published to MQTT Server with Topic : ND/SB002/05, Message: SB002-05-F-10, MQTT mid : 24'),(873,'2017-06-26 21:51:29','Published to MQTT Server with Topic : ND/SB002/05, Message: SB002-05-F-10, MQTT mid : 22'),(874,'2017-06-26 21:51:29','Published to MQTT Server with Topic : ND/SB001/05, Message: SB001-05-F-5, MQTT mid : 23'),(875,'2017-06-26 21:51:29','Published to MQTT Server with Topic : ND/SB002/05, Message: SB002-05-F-10, MQTT mid : 24'),(876,'2017-06-26 21:51:29','Status Chandged for SB001-05 : ON --> OFF (logged By DBTrigger)'),(877,'2017-06-26 21:51:29','Database Switch Status is Changed With Message : b\'SB001-05-F-5-D\''),(878,'2017-06-26 21:51:29','Status Chandged for SB002-05 : ON --> OFF (logged By DBTrigger)'),(879,'2017-06-26 21:51:29','Database Switch Status is Changed With Message : b\'SB002-05-F-10-D\''),(880,'2017-06-26 21:51:37','Published to MQTT Server with Topic : ND/SB001/05, Message: SB001-05-F-5, MQTT mid : 23'),(881,'2017-06-26 21:51:37','Published to MQTT Server with Topic : ND/SB002/05, Message: SB002-05-F-10, MQTT mid : 24'),(882,'2017-06-26 21:51:37','Published to MQTT Server with Topic : ND/SB002/05, Message: SB002-05-F-10, MQTT mid : 24'),(883,'2017-06-26 21:51:41','Database Switch Status is Changed With Message : b\'SB001-05-F-5-D\''),(884,'2017-06-26 21:51:46','Database Switch Status is Changed With Message : b\'SB002-05-F-10-D\'');
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mainload`
--

DROP TABLE IF EXISTS `mainload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mainload` (
  `MainLoadID` tinyint(4) unsigned NOT NULL,
  `LoadName` varchar(45) DEFAULT '-',
  `Location` varchar(45) DEFAULT '-',
  `MainStatus` tinyint(4) DEFAULT '1',
  `MainMsgTopic` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`MainLoadID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mainload`
--

LOCK TABLES `mainload` WRITE;
/*!40000 ALTER TABLE `mainload` DISABLE KEYS */;
INSERT INTO `mainload` VALUES (1,'GEB SadhuAshram','Godown',NULL,NULL);
/*!40000 ALTER TABLE `mainload` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`MySQLClient`@`%`*/ /*!50003 TRIGGER `autoswitch`.`MainLoad_AFTER_UPDATE` AFTER UPDATE ON `MainLoad` FOR EACH ROW
BEGIN
update SwitchScheduler set MainLoadStatus = new.MainStatus, SwStatus = if(new.MainStatus = 0,0,SwStatus) where MainLdID = new.MainLoadID;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `schedulegroup`
--

DROP TABLE IF EXISTS `schedulegroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedulegroup` (
  `SchGrpID` smallint(5) unsigned NOT NULL,
  `GroupName` varchar(45) DEFAULT '-',
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `IsActive` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`SchGrpID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedulegroup`
--

LOCK TABLES `schedulegroup` WRITE;
/*!40000 ALTER TABLE `schedulegroup` DISABLE KEYS */;
INSERT INTO `schedulegroup` VALUES (1,'Yearly Group','2017-01-01','2017-12-31',0);
/*!40000 ALTER TABLE `schedulegroup` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`MySQLClient`@`%`*/ /*!50003 TRIGGER `autoswitch`.`ScheduleGroup_BEFORE_DELETE` BEFORE DELETE ON `ScheduleGroup` FOR EACH ROW
BEGIN
if old.SchGrpID = 1 then
	 SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'You Can not Delete [Yearly Group] Record';
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `scheduler`
--

DROP TABLE IF EXISTS `scheduler`;
/*!50001 DROP VIEW IF EXISTS `scheduler`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `scheduler` AS SELECT 
 1 AS `BoardID`,
 1 AS `BoardName`,
 1 AS `Location`,
 1 AS `SwitchID`,
 1 AS `SwitchName`,
 1 AS `SchID`,
 1 AS `IsScheduled`,
 1 AS `MsgTopicPayload`,
 1 AS `MsgTopic`,
 1 AS `SwStatus`,
 1 AS `StartDateTime`,
 1 AS `StopDateTime`,
 1 AS `StartTime`,
 1 AS `StopTime`,
 1 AS `IsMainLoadIndependent`,
 1 AS `MainLoadStatus`,
 1 AS `MainLdID`,
 1 AS `ScheduleGrpID`,
 1 AS `UID`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `switchboard`
--

DROP TABLE IF EXISTS `switchboard`;
/*!50001 DROP VIEW IF EXISTS `switchboard`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `switchboard` AS SELECT 
 1 AS `BoardID`,
 1 AS `BoardName`,
 1 AS `Switches`,
 1 AS `MsgTopic`,
 1 AS `Location`,
 1 AS `WiFiSSID`,
 1 AS `StaticIP`,
 1 AS `SwitchID`,
 1 AS `SwitchName`,
 1 AS `SwitchNo`,
 1 AS `SwMsgTopic`,
 1 AS `PublishMsgTopic`,
 1 AS `PublishPayload`,
 1 AS `SwStatus`,
 1 AS `UID`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `switches`
--

DROP TABLE IF EXISTS `switches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `switches` (
  `SwitchID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `BrdID` smallint(5) unsigned DEFAULT '0',
  `SwitchName` varchar(45) DEFAULT '-',
  `SwitchNo` smallint(5) unsigned DEFAULT '0',
  `SwMsgTopic` varchar(45) DEFAULT '-',
  `UID` smallint(6) DEFAULT '0',
  PRIMARY KEY (`SwitchID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `switches`
--

LOCK TABLES `switches` WRITE;
/*!40000 ALTER TABLE `switches` DISABLE KEYS */;
INSERT INTO `switches` VALUES (1,1,'Lamp 01',1,'01',NULL),(2,1,'Lamp 02',2,'02',NULL),(3,1,'Lamp 03',3,'03',NULL),(4,1,'Lamp 04',4,'04',0),(5,1,'Lamp 05',5,'05',0),(6,2,'LED 01',1,'01',0),(7,2,'LED 02',2,'02',0),(8,2,'LED 03',3,'03',0),(9,2,'LED 04',4,'04',0),(10,2,'LED 05',5,'05',0);
/*!40000 ALTER TABLE `switches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `switchscheduler`
--

DROP TABLE IF EXISTS `switchscheduler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `switchscheduler` (
  `SchID` mediumint(8) NOT NULL,
  `SwID` smallint(5) DEFAULT '0',
  `IsScheduled` tinyint(1) DEFAULT '0',
  `MsgTopicPayload` varchar(45) DEFAULT '-',
  `SwStatus` tinyint(1) DEFAULT '0',
  `StartDateTime` datetime DEFAULT NULL,
  `StopDateTime` datetime DEFAULT NULL,
  `StartTime` time DEFAULT NULL,
  `StopTime` time DEFAULT NULL,
  `IsMainLoadIndependent` tinyint(1) DEFAULT '1',
  `MainLoadStatus` tinyint(1) DEFAULT '1',
  `MainLdID` tinyint(4) unsigned DEFAULT '0',
  `ScheduleGrpID` smallint(6) unsigned DEFAULT '0',
  PRIMARY KEY (`SchID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `switchscheduler`
--

LOCK TABLES `switchscheduler` WRITE;
/*!40000 ALTER TABLE `switchscheduler` DISABLE KEYS */;
INSERT INTO `switchscheduler` VALUES (1,3,1,'SB001-03',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','21:46:18','21:47:18',1,1,1,1),(2,4,1,'SB001-04',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','21:48:18','21:49:18',1,1,1,1),(3,5,1,'SB001-05',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','21:50:18','21:51:18',1,1,1,1),(4,8,1,'SB002-03',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','21:46:18','21:47:18',1,1,1,1),(5,9,1,'SB002-04',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','21:48:18','21:49:18',1,1,1,1),(6,10,1,'SB002-05',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','21:50:18','21:51:18',1,1,1,1);
/*!40000 ALTER TABLE `switchscheduler` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`MySQLClient`@`%`*/ /*!50003 TRIGGER `autoswitch`.`SwitchScheduler_AFTER_UPDATE` AFTER UPDATE ON `SwitchScheduler` FOR EACH ROW
BEGIN
declare newlogID integer;

if new.MainLoadStatus != old.MainLoadStatus then
	call insertLog(concat('Main Load Changed for MainLoad ID :', new.MainLdID, ', Status : ',if(old.`MainLoadStatus`=1,"ON","OFF") ," --> ",if(NEW.`MainLoadStatus`=1,"ON","OFF"),' (logged By DBTrigger)'),newlogID );
end if;

if new.SwStatus != old.SwStatus then
	call InsertLog(concat('Status Chandged for ',new.MsgTopicPayload,' : ', if(old.`SwStatus`=1,"ON","OFF") ," --> ",if(NEW.`SwStatus`=1,"ON","OFF"),' (logged By DBTrigger)'),newlogID);
end if;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `user_permission`
--

DROP TABLE IF EXISTS `user_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_permission` (
  `prmID` int(10) unsigned NOT NULL,
  `UID` smallint(5) unsigned DEFAULT NULL,
  `SwitchID` smallint(5) unsigned DEFAULT NULL,
  `prmSwStatus` tinyint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`prmID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_permission`
--

LOCK TABLES `user_permission` WRITE;
/*!40000 ALTER TABLE `user_permission` DISABLE KEYS */;
INSERT INTO `user_permission` VALUES (1,1,1,2),(2,1,2,2),(3,1,3,2);
/*!40000 ALTER TABLE `user_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `UID` tinyint(4) unsigned NOT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `IsAdmin` tinyint(1) DEFAULT '0',
  `JoinDate` datetime DEFAULT NULL,
  `IsUsedAccount` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`UID`),
  UNIQUE KEY `UserName_UNIQUE` (`UserName`),
  KEY `UID` (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'kswami','123',1,NULL,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'autoswitch'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `ChangeYear` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8 */ ;;
/*!50003 SET character_set_results = utf8 */ ;;
/*!50003 SET collation_connection  = utf8_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`MySQLClient`@`%`*/ /*!50106 EVENT `ChangeYear` ON SCHEDULE EVERY 1 MONTH STARTS '2017-01-01 00:00:00' ON COMPLETION NOT PRESERVE ENABLE DO call ChangeYear */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'autoswitch'
--
/*!50003 DROP FUNCTION IF EXISTS `GetActiveScheduleGroup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`MySQLClient`@`%` FUNCTION `GetActiveScheduleGroup`() RETURNS int(11)
BEGIN
declare $cnt smallint;
declare $ReturnValue smallint;
declare $acnt smallint;

select count(*) into $cnt from ScheduleGroup;

if $cnt = 1 then
	select SchGrpID into $ReturnValue from ScheduleGroup;
elseif $cnt > 1 then
	select count(*) into $acnt from ScheduleGroup where IsActive=1;
    if $acnt = 1 then
		select SchGrpID into $ReturnValue from ScheduleGroup where IsActive=1;
	elseif $acnt > 1 then
		select SchGrpID into $ReturnValue from ScheduleGroup where datediff(enddate,startdate) = (select min(datediff(EndDate,StartDate)) from ScheduleGroup where IsActive=1 and curdate() between date(StartDate) and date(Enddate));
	else
		select SchGrpID into $ReturnValue from ScheduleGroup where datediff(enddate,startdate) = (select min(datediff(EndDate,StartDate)) from ScheduleGroup where curdate() between date(StartDate) and date(Enddate));
    end if;    
end if;
RETURN $ReturnValue;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GetUserSwitchPermit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`MySQLClient`@`%` FUNCTION `GetUserSwitchPermit`($UserID int, $SwitchID int) RETURNS int(11)
BEGIN
declare $SwStatusprm int;
Select prmSwStatus into $SwStatusprm from user_permission where UID=$UserID and SwitchID=$SwitchID;

if $SwStatusprm is null then
	set $SwStatusprm = 3;
end if;

RETURN $SwStatusprm;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ChangeYear` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`MySQLClient`@`%` PROCEDURE `ChangeYear`()
BEGIN
declare $YearDiff int;

select TIMESTAMPDIFF(Year,StartDate,curdate()) into $YearDiff  from ScheduleGroup where SchGrpID=1;

if $YearDiff > 0 then
	update ScheduleGroup set StartDate = AddDate(StartDate , Interval $YearDiff Year), EndDate = AddDate(EndDate , Interval $YearDiff Year) ;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetUserPermittedSwitches` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`MySQLClient`@`%` PROCEDURE `GetUserPermittedSwitches`($UserID smallint)
BEGIN
declare $SwIDs varchar(1000);

select group_concat(SwitchID) into @SwIDs from user_permission where UID =  $UserID group by UID;

set @s = concat('Select * from SwitchBoard where SwitchID in (',@SwIDs,')');
prepare stmt from @s;
execute stmt;
deallocate prepare stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetUserPermittedSwitchesForMobApp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`MySQLClient`@`%` PROCEDURE `GetUserPermittedSwitchesForMobApp`($UserID smallint,$Flds varchar(500),$Filter varchar(100),$Sorting varchar(100))
BEGIN
declare $SwIDs varchar(1000);

select group_concat(SwitchID) into $SwIDs from user_permission where UID =  $UserID group by UID;

set @s = concat('Select ',$Flds,' from SwitchBoard where SwitchID in (',$SwIDs,') ', $Filter, ' ' ,$Sorting);
prepare stmt from @s;
execute stmt;
deallocate prepare stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertLog` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`MySQLClient`@`%` PROCEDURE `InsertLog`($logText varchar(255), out $logID integer)
BEGIN
insert into	`logs` (`logdescription`) values($logText);
set $logid = last_insert_id();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SetOneDateTimeSchedule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`MySQLClient`@`%` PROCEDURE `SetOneDateTimeSchedule`($switchid mediumint, $OnTime datetime, $OffTime datetime)
BEGIN
update SwitchScheduler set StartDateTime = $ontime, StopDateTime= $offtime where Swid = $switchid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SetSingleSwitchStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`MySQLClient`@`%` PROCEDURE `SetSingleSwitchStatus`($SwitchID smallint,$SwStatus boolean)
BEGIN
update SwitchScheduler set SwStatus=$SwStatus where SwID = $SwitchID;
if not $SwStatus then
	update SwitchScheduler set IsScheduled=0 where SwID = $SwitchID;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SetSwitchStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`MySQLClient`@`%` PROCEDURE `SetSwitchStatus`($switchid smallint, $switchstatus tinyint)
BEGIN
update SwitchScheduler set SwStatus = $switchstatus where SwID = $switchid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `scheduler`
--

/*!50001 DROP VIEW IF EXISTS `scheduler`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`MySQLClient`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `scheduler` AS select `bd`.`BoardID` AS `BoardID`,`bd`.`BoardName` AS `BoardName`,`bd`.`Location` AS `Location`,`sw`.`SwitchID` AS `SwitchID`,`sw`.`SwitchName` AS `SwitchName`,`sch`.`SchID` AS `SchID`,`sch`.`IsScheduled` AS `IsScheduled`,`sch`.`MsgTopicPayload` AS `MsgTopicPayload`,concat_ws('/',`bd`.`MsgTopic`,`sw`.`SwMsgTopic`) AS `MsgTopic`,`sch`.`SwStatus` AS `SwStatus`,`sch`.`StartDateTime` AS `StartDateTime`,`sch`.`StopDateTime` AS `StopDateTime`,`sch`.`StartTime` AS `StartTime`,`sch`.`StopTime` AS `StopTime`,`sch`.`IsMainLoadIndependent` AS `IsMainLoadIndependent`,`sch`.`MainLoadStatus` AS `MainLoadStatus`,`sch`.`MainLdID` AS `MainLdID`,`sch`.`ScheduleGrpID` AS `ScheduleGrpID`,`sw`.`UID` AS `UID` from ((`boards` `bd` join `switches` `sw` on((`bd`.`BoardID` = `sw`.`BrdID`))) join `switchscheduler` `sch` on((`sch`.`SwID` = `sw`.`SwitchID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `switchboard`
--

/*!50001 DROP VIEW IF EXISTS `switchboard`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`MySQLClient`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `switchboard` AS select `bd`.`BoardID` AS `BoardID`,`bd`.`BoardName` AS `BoardName`,`bd`.`Switches` AS `Switches`,`bd`.`MsgTopic` AS `MsgTopic`,`bd`.`Location` AS `Location`,`bd`.`WiFiSSID` AS `WiFiSSID`,`bd`.`StaticIP` AS `StaticIP`,`sw`.`SwitchID` AS `SwitchID`,`sw`.`SwitchName` AS `SwitchName`,`sw`.`SwitchNo` AS `SwitchNo`,`sw`.`SwMsgTopic` AS `SwMsgTopic`,concat(`bd`.`MsgTopic`,'/',`sw`.`SwMsgTopic`) AS `PublishMsgTopic`,concat(`bd`.`BoardName`,'-',`sw`.`SwMsgTopic`) AS `PublishPayload`,ifnull((select max(`sch`.`SwStatus`) from `switchscheduler` `sch` where (`sch`.`SwID` = `sw`.`SwitchID`)),0) AS `SwStatus`,`sw`.`UID` AS `UID` from (`boards` `bd` join `switches` `sw` on((`bd`.`BoardID` = `sw`.`BrdID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-28 17:29:56
