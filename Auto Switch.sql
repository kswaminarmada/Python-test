CREATE DATABASE  IF NOT EXISTS `autoswitch` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `autoswitch`;
-- MySQL dump 10.13  Distrib 5.7.17, for Linux (x86_64)
--
-- Host: localhost    Database: autoswitch
-- ------------------------------------------------------
-- Server version	5.7.17-0ubuntu0.16.10.1

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
-- Table structure for table `Boards`
--

DROP TABLE IF EXISTS `Boards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Boards` (
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
-- Table structure for table `MainLoad`
--

DROP TABLE IF EXISTS `MainLoad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MainLoad` (
  `MainLoadID` tinyint(4) unsigned NOT NULL,
  `LoadName` varchar(45) DEFAULT '-',
  `Location` varchar(45) DEFAULT '-',
  `MainStatus` tinyint(4) DEFAULT '1',
  `MainMsgTopic` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`MainLoadID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
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
-- Temporary view structure for view `Scheduler`
--

DROP TABLE IF EXISTS `Scheduler`;
/*!50001 DROP VIEW IF EXISTS `Scheduler`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `Scheduler` AS SELECT 
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
 1 AS `MainLoadStatus`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `SwitchBoard`
--

DROP TABLE IF EXISTS `SwitchBoard`;
/*!50001 DROP VIEW IF EXISTS `SwitchBoard`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `SwitchBoard` AS SELECT 
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
 1 AS `SwMsgTopic`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `SwitchScheduler`
--

DROP TABLE IF EXISTS `SwitchScheduler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SwitchScheduler` (
  `SchID` mediumint(8) NOT NULL,
  `SwID` smallint(5) DEFAULT '0',
  `IsScheduled` tinyint(4) DEFAULT '0',
  `MsgTopicPayload` varchar(45) DEFAULT '-',
  `SwStatus` tinyint(4) DEFAULT '0',
  `StartDateTime` datetime DEFAULT NULL,
  `StopDateTime` datetime DEFAULT NULL,
  `StartTime` time DEFAULT NULL,
  `StopTime` time DEFAULT NULL,
  `IsMainLoadIndependent` tinyint(4) DEFAULT '1',
  `MainLoadStatus` tinyint(4) DEFAULT '1',
  `MainLdID` tinyint(4) unsigned DEFAULT NULL,
  PRIMARY KEY (`SchID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
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
-- Table structure for table `Switches`
--

DROP TABLE IF EXISTS `Switches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Switches` (
  `SwitchID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `BrdID` smallint(5) unsigned DEFAULT '0',
  `SwitchName` varchar(45) DEFAULT '-',
  `SwitchNo` smallint(5) unsigned DEFAULT '0',
  `SwMsgTopic` varchar(45) DEFAULT '-',
  PRIMARY KEY (`SwitchID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'autoswitch'
--

--
-- Dumping routines for database 'autoswitch'
--
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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`MySQLClient`@`%` PROCEDURE `SetOneDateTimeSchedule`($schedulerid mediumint, $OnTime datetime, $OffTime datetime)
BEGIN
update SwitchScheduler set StartDateTime = $ontime, StopDateTime= $offtime where schid = $schedulerid;
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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`MySQLClient`@`%` PROCEDURE `SetSwitchStatus`($schedulerid mediumint, $switchstatus tinyint)
BEGIN
update SwitchScheduler set SwStatus = $switchstatus where SchID = $schedulerid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `Scheduler`
--

/*!50001 DROP VIEW IF EXISTS `Scheduler`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`MySQLClient`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Scheduler` AS select `bd`.`BoardID` AS `BoardID`,`bd`.`BoardName` AS `BoardName`,`bd`.`Location` AS `Location`,`sw`.`SwitchID` AS `SwitchID`,`sw`.`SwitchName` AS `SwitchName`,`sch`.`SchID` AS `SchID`,`sch`.`IsScheduled` AS `IsScheduled`,`sch`.`MsgTopicPayload` AS `MsgTopicPayload`,concat_ws('/',`bd`.`MsgTopic`,`sw`.`SwMsgTopic`) AS `MsgTopic`,`sch`.`SwStatus` AS `SwStatus`,`sch`.`StartDateTime` AS `StartDateTime`,`sch`.`StopDateTime` AS `StopDateTime`,`sch`.`StartTime` AS `StartTime`,`sch`.`StopTime` AS `StopTime`,`sch`.`IsMainLoadIndependent` AS `IsMainLoadIndependent`,`sch`.`MainLoadStatus` AS `MainLoadStatus` from ((`Boards` `bd` join `Switches` `sw` on((`bd`.`BoardID` = `sw`.`BrdID`))) join `SwitchScheduler` `sch` on((`sch`.`SwID` = `sw`.`SwitchID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `SwitchBoard`
--

/*!50001 DROP VIEW IF EXISTS `SwitchBoard`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`MySQLClient`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `SwitchBoard` AS select `bd`.`BoardID` AS `BoardID`,`bd`.`BoardName` AS `BoardName`,`bd`.`Switches` AS `Switches`,`bd`.`MsgTopic` AS `MsgTopic`,`bd`.`Location` AS `Location`,`bd`.`WiFiSSID` AS `WiFiSSID`,`bd`.`StaticIP` AS `StaticIP`,`sw`.`SwitchID` AS `SwitchID`,`sw`.`SwitchName` AS `SwitchName`,`sw`.`SwitchNo` AS `SwitchNo`,`sw`.`SwMsgTopic` AS `SwMsgTopic` from (`Boards` `bd` join `Switches` `sw` on((`bd`.`BoardID` = `sw`.`BrdID`))) */;
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

-- Dump completed on 2017-04-12  7:23:12
