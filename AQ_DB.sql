-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: airqualitydatabase.chwww2qyya5d.us-west-1.rds.amazonaws.com    Database: AQ_DB
-- ------------------------------------------------------
-- Server version	8.0.35

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `AQIBreakpoints`
--

DROP TABLE IF EXISTS `AQIBreakpoints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AQIBreakpoints` (
  `breakpoints-id` int unsigned NOT NULL AUTO_INCREMENT,
  `param-id` int unsigned NOT NULL,
  `param-name` varchar(45) NOT NULL,
  `duration-id` tinyint unsigned NOT NULL,
  `durationdescript` varchar(45) NOT NULL,
  `AQIcategory` tinyint unsigned NOT NULL,
  `lowpoint` decimal(10,0) unsigned zerofill NOT NULL,
  `highpoint` decimal(10,0) unsigned zerofill NOT NULL,
  `lowAQI` tinyint NOT NULL,
  `highAQI` tinyint NOT NULL,
  PRIMARY KEY (`breakpoints-id`),
  KEY `FK-ParameterCodes-Breakpoints_idx` (`param-id`),
  KEY `FK-AQICategories-AQIBreakpoints-AQI-category_idx` (`AQIcategory`),
  KEY `FK_Durations-AQIBreakpoints-durations_idx` (`duration-id`),
  CONSTRAINT `FK-AQICategories-AQIBreakpoints-AQI-category` FOREIGN KEY (`AQIcategory`) REFERENCES `AQICategories` (`categoryid`),
  CONSTRAINT `FK-ParameterCodes-Breakpoints` FOREIGN KEY (`param-id`) REFERENCES `ParameterCodes` (`parameter-id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_Durations-AQIBreakpoints-durations` FOREIGN KEY (`duration-id`) REFERENCES `Durations` (`duration-id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AQIBreakpoints`
--

LOCK TABLES `AQIBreakpoints` WRITE;
/*!40000 ALTER TABLE `AQIBreakpoints` DISABLE KEYS */;
/*!40000 ALTER TABLE `AQIBreakpoints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AQICategories`
--

DROP TABLE IF EXISTS `AQICategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AQICategories` (
  `categoryid` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `category` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`categoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AQICategories`
--

LOCK TABLES `AQICategories` WRITE;
/*!40000 ALTER TABLE `AQICategories` DISABLE KEYS */;
/*!40000 ALTER TABLE `AQICategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Agencies`
--

DROP TABLE IF EXISTS `Agencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Agencies` (
  `agencycode` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `agencyname` varchar(45) DEFAULT NULL,
  `agencytypeid` tinyint unsigned DEFAULT NULL,
  `contactname` varchar(45) DEFAULT NULL,
  `contactphone` varchar(45) DEFAULT NULL,
  `contactemail` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`agencycode`),
  KEY `FK-AgencyTypes-Agencies-agency-code_idx` (`agencytypeid`),
  CONSTRAINT `FK-AgencyTypes-Agencies-agency-code` FOREIGN KEY (`agencytypeid`) REFERENCES `AgencyTypes` (`agencytypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Agencies`
--

LOCK TABLES `Agencies` WRITE;
/*!40000 ALTER TABLE `Agencies` DISABLE KEYS */;
/*!40000 ALTER TABLE `Agencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AgencyTypes`
--

DROP TABLE IF EXISTS `AgencyTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AgencyTypes` (
  `agencytypeid` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `agencytypecode` char(2) DEFAULT NULL,
  `agencytypedescript` varchar(45) NOT NULL,
  PRIMARY KEY (`agencytypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AgencyTypes`
--

LOCK TABLES `AgencyTypes` WRITE;
/*!40000 ALTER TABLE `AgencyTypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `AgencyTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AirQualityControlRegionAQCR`
--

DROP TABLE IF EXISTS `AirQualityControlRegionAQCR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AirQualityControlRegionAQCR` (
  `AQCRid` tinyint NOT NULL,
  `AQCRname` varchar(45) DEFAULT NULL,
  `statename` varchar(45) DEFAULT NULL,
  `regioncity` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`AQCRid`),
  KEY `FK-StateCodes-AQCR-statename_idx` (`statename`),
  CONSTRAINT `FK-StateCodes-AQCR-statename` FOREIGN KEY (`statename`) REFERENCES `StateCodes` (`statename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AirQualityControlRegionAQCR`
--

LOCK TABLES `AirQualityControlRegionAQCR` WRITE;
/*!40000 ALTER TABLE `AirQualityControlRegionAQCR` DISABLE KEYS */;
/*!40000 ALTER TABLE `AirQualityControlRegionAQCR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CertificationFlags`
--

DROP TABLE IF EXISTS `CertificationFlags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CertificationFlags` (
  `flag-id` tinyint NOT NULL AUTO_INCREMENT,
  `certflag` char(2) DEFAULT NULL,
  `flagdescript` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`flag-id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CertificationFlags`
--

LOCK TABLES `CertificationFlags` WRITE;
/*!40000 ALTER TABLE `CertificationFlags` DISABLE KEYS */;
/*!40000 ALTER TABLE `CertificationFlags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CertifyingAgenciesbyMonitor`
--

DROP TABLE IF EXISTS `CertifyingAgenciesbyMonitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CertifyingAgenciesbyMonitor` (
  `monitorid` int unsigned NOT NULL AUTO_INCREMENT,
  `certifyingagencycode` tinyint unsigned NOT NULL,
  `certifyingagencyname` varchar(45) DEFAULT NULL,
  `PQAOagencycode` tinyint unsigned NOT NULL,
  `PQAOagencyname` varchar(45) DEFAULT NULL,
  `collectingagencycode` tinyint unsigned NOT NULL,
  `collectingagencyname` varchar(45) DEFAULT NULL,
  `reportingagencycode` tinyint unsigned NOT NULL,
  `reportingagencyname` varchar(45) DEFAULT NULL,
  `monitoringagencycode` tinyint unsigned NOT NULL,
  `monitoringagencyname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`monitorid`),
  KEY `FK-Agencies-CertAgencies-certifying-agency-code_idx` (`certifyingagencycode`),
  KEY `FK-Agencies-CertAgencies-PAQOagency-code_idx` (`PQAOagencycode`),
  KEY `FK-Agencies-CertAgencies-collecting-agency-code_idx` (`collectingagencycode`),
  KEY `FK-Agencies-CertAgencies-collecting-reporting-code_idx` (`reportingagencycode`),
  KEY `FK-Agencies-CertAgencies-collecting-monitoing-code_idx` (`monitoringagencycode`),
  CONSTRAINT `FK-Agencies-CertAgencies-certifying-agency-code` FOREIGN KEY (`certifyingagencycode`) REFERENCES `Agencies` (`agencycode`) ON UPDATE CASCADE,
  CONSTRAINT `FK-Agencies-CertAgencies-collecting-agency-code` FOREIGN KEY (`collectingagencycode`) REFERENCES `Agencies` (`agencycode`),
  CONSTRAINT `FK-Agencies-CertAgencies-collecting-monitoing-code` FOREIGN KEY (`monitoringagencycode`) REFERENCES `Agencies` (`agencycode`),
  CONSTRAINT `FK-Agencies-CertAgencies-collecting-reporting-code` FOREIGN KEY (`reportingagencycode`) REFERENCES `Agencies` (`agencycode`),
  CONSTRAINT `FK-Agencies-CertAgencies-PQAO-agency-code` FOREIGN KEY (`PQAOagencycode`) REFERENCES `Agencies` (`agencycode`),
  CONSTRAINT `FK-Monitors-CertAgencies-localregion0` FOREIGN KEY (`monitorid`) REFERENCES `Monitors` (`monitorid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CertifyingAgenciesbyMonitor`
--

LOCK TABLES `CertifyingAgenciesbyMonitor` WRITE;
/*!40000 ALTER TABLE `CertifyingAgenciesbyMonitor` DISABLE KEYS */;
/*!40000 ALTER TABLE `CertifyingAgenciesbyMonitor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CollectionFrequencies`
--

DROP TABLE IF EXISTS `CollectionFrequencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CollectionFrequencies` (
  `freqid` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `frequencydescript` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`freqid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CollectionFrequencies`
--

LOCK TABLES `CollectionFrequencies` WRITE;
/*!40000 ALTER TABLE `CollectionFrequencies` DISABLE KEYS */;
/*!40000 ALTER TABLE `CollectionFrequencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CountyCodes`
--

DROP TABLE IF EXISTS `CountyCodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CountyCodes` (
  `countycode` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `countyname` varchar(45) NOT NULL,
  `statename` varchar(45) NOT NULL,
  `state-code` tinyint unsigned NOT NULL,
  PRIMARY KEY (`countycode`),
  KEY `FK_StateCodes_CountyCode_state-name_idx` (`statename`,`state-code`),
  CONSTRAINT `FK_StateCodes_CountyCode_state-name` FOREIGN KEY (`statename`, `state-code`) REFERENCES `StateCodes` (`statename`, `state-code`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CountyCodes`
--

LOCK TABLES `CountyCodes` WRITE;
/*!40000 ALTER TABLE `CountyCodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `CountyCodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DatumType`
--

DROP TABLE IF EXISTS `DatumType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DatumType` (
  `datumid` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `formatdescript` varchar(45) NOT NULL,
  PRIMARY KEY (`datumid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DatumType`
--

LOCK TABLES `DatumType` WRITE;
/*!40000 ALTER TABLE `DatumType` DISABLE KEYS */;
/*!40000 ALTER TABLE `DatumType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DisallowedQualifiers`
--

DROP TABLE IF EXISTS `DisallowedQualifiers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DisallowedQualifiers` (
  `QAdisid` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `QAlistid` tinyint unsigned NOT NULL,
  `QAdescript` varchar(45) NOT NULL,
  PRIMARY KEY (`QAdisid`),
  KEY `FK-QA-Disallowed-QA-descript_idx` (`QAlistid`),
  CONSTRAINT `FK-QA-Disallowed-QA-descript` FOREIGN KEY (`QAlistid`) REFERENCES `QAQualifiersList` (`QAid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DisallowedQualifiers`
--

LOCK TABLES `DisallowedQualifiers` WRITE;
/*!40000 ALTER TABLE `DisallowedQualifiers` DISABLE KEYS */;
/*!40000 ALTER TABLE `DisallowedQualifiers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Durations`
--

DROP TABLE IF EXISTS `Durations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Durations` (
  `duration-id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `duration-descript` varchar(45) NOT NULL,
  `observed/calculated` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`duration-id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Durations`
--

LOCK TABLES `Durations` WRITE;
/*!40000 ALTER TABLE `Durations` DISABLE KEYS */;
/*!40000 ALTER TABLE `Durations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Entry`
--

DROP TABLE IF EXISTS `Entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Entry` (
  `entry-id` int unsigned NOT NULL AUTO_INCREMENT,
  `method-code` int unsigned NOT NULL,
  `parameter-id` int unsigned NOT NULL,
  `local-time` time NOT NULL,
  `local-date` date NOT NULL,
  `GMT-time` time NOT NULL,
  `GMT-date` date NOT NULL,
  `sample-measurement` decimal(10,0) NOT NULL,
  `durations-id` tinyint unsigned NOT NULL,
  `longitude` decimal(10,0) NOT NULL,
  `latitude` decimal(10,0) NOT NULL,
  `datum-type` tinyint unsigned NOT NULL,
  `null-QA` tinyint unsigned DEFAULT NULL,
  `requex-qualifier` tinyint unsigned DEFAULT NULL,
  `inform-qualifier` tinyint unsigned DEFAULT NULL,
  `QA-1` tinyint unsigned DEFAULT NULL,
  `QA-2` tinyint unsigned DEFAULT NULL,
  `QA-3` tinyint unsigned DEFAULT NULL,
  `QA-4` tinyint unsigned DEFAULT NULL,
  `QA-5` tinyint unsigned DEFAULT NULL,
  `QA-6` tinyint unsigned DEFAULT NULL,
  `QA-7` tinyint unsigned DEFAULT NULL,
  `QA-8` tinyint unsigned DEFAULT NULL,
  `QA-9` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`entry-id`),
  KEY `FK-ParameterCodes-Entry-parameter-id_idx` (`parameter-id`),
  KEY `FK-Durations-Enty-durations-id_idx` (`durations-id`),
  KEY `FK-DatumType-Enty-datum-type_idx` (`datum-type`),
  KEY `FK-NullQA-Enty-null-QA_idx` (`null-QA`),
  KEY `FK-InformQualifiers-Enty-inform-QA_idx` (`inform-qualifier`),
  KEY `FK-QAQualifiersList-Entry-QAs_idx` (`QA-1`),
  KEY `FK-RequestExemptionQualifiers-requex-qualifier_idx` (`requex-qualifier`),
  KEY `FK-MethodCodes-Entry-method-code_idx` (`method-code`),
  KEY `FK-QAQualifiersList-Entry-QA2_idx` (`QA-2`),
  KEY `FK-QAQualifiersList-Entry-QA3_idx` (`QA-3`),
  KEY `FK-QAQualifiersList-Entry-QA4_idx` (`QA-4`),
  KEY `FK-QAQualifiersList-Entry-QA5_idx` (`QA-5`),
  KEY `FK-QAQualifiersList-Entry-QA6_idx` (`QA-6`),
  KEY `FK-QAQualifiersList-Entry-QA7_idx` (`QA-7`),
  KEY `FK-QAQualifiersList-Entry-QA8_idx` (`QA-8`),
  KEY `FK-QAQualifiersList-Entry-QA9_idx` (`QA-9`),
  CONSTRAINT `FK-DatumType-Enty-datum-type` FOREIGN KEY (`datum-type`) REFERENCES `DatumType` (`datumid`),
  CONSTRAINT `FK-Durations-Enty-durations-id` FOREIGN KEY (`durations-id`) REFERENCES `Durations` (`duration-id`),
  CONSTRAINT `FK-InformQualifiers-Enty-inform-QA` FOREIGN KEY (`inform-qualifier`) REFERENCES `InformQualifiers` (`informid`),
  CONSTRAINT `FK-MethodCodes-Entry-method-code` FOREIGN KEY (`method-code`) REFERENCES `MethodCodes` (`methodid`),
  CONSTRAINT `FK-NullQA-Enty-null-QA` FOREIGN KEY (`null-QA`) REFERENCES `NullQualifiers` (`nullid`),
  CONSTRAINT `FK-ParameterCodes-Entry-parameter-id` FOREIGN KEY (`parameter-id`) REFERENCES `ParameterCodes` (`parameter-id`),
  CONSTRAINT `FK-QAQualifiersList-Entry-QA1` FOREIGN KEY (`QA-1`) REFERENCES `QAQualifiersList` (`QAid`),
  CONSTRAINT `FK-QAQualifiersList-Entry-QA2` FOREIGN KEY (`QA-2`) REFERENCES `QAQualifiersList` (`QAid`),
  CONSTRAINT `FK-QAQualifiersList-Entry-QA3` FOREIGN KEY (`QA-3`) REFERENCES `QAQualifiersList` (`QAid`),
  CONSTRAINT `FK-QAQualifiersList-Entry-QA4` FOREIGN KEY (`QA-4`) REFERENCES `QAQualifiersList` (`QAid`),
  CONSTRAINT `FK-QAQualifiersList-Entry-QA5` FOREIGN KEY (`QA-5`) REFERENCES `QAQualifiersList` (`QAid`),
  CONSTRAINT `FK-QAQualifiersList-Entry-QA6` FOREIGN KEY (`QA-6`) REFERENCES `QAQualifiersList` (`QAid`),
  CONSTRAINT `FK-QAQualifiersList-Entry-QA7` FOREIGN KEY (`QA-7`) REFERENCES `QAQualifiersList` (`QAid`),
  CONSTRAINT `FK-QAQualifiersList-Entry-QA8` FOREIGN KEY (`QA-8`) REFERENCES `QAQualifiersList` (`QAid`),
  CONSTRAINT `FK-QAQualifiersList-Entry-QA9` FOREIGN KEY (`QA-9`) REFERENCES `QAQualifiersList` (`QAid`),
  CONSTRAINT `FK-RequestExemptionQualifiers-requex-qualifier` FOREIGN KEY (`requex-qualifier`) REFERENCES `RequestExemptionQualifiers` (`reqeuexid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Entry`
--

LOCK TABLES `Entry` WRITE;
/*!40000 ALTER TABLE `Entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `Entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `InformQualifiers`
--

DROP TABLE IF EXISTS `InformQualifiers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `InformQualifiers` (
  `informid` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `informdescript` varchar(45) NOT NULL,
  `legacycode` tinyint DEFAULT NULL,
  PRIMARY KEY (`informid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InformQualifiers`
--

LOCK TABLES `InformQualifiers` WRITE;
/*!40000 ALTER TABLE `InformQualifiers` DISABLE KEYS */;
/*!40000 ALTER TABLE `InformQualifiers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LocalRegionType`
--

DROP TABLE IF EXISTS `LocalRegionType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LocalRegionType` (
  `localregiontypeid` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `regiondescript` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`localregiontypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LocalRegionType`
--

LOCK TABLES `LocalRegionType` WRITE;
/*!40000 ALTER TABLE `LocalRegionType` DISABLE KEYS */;
/*!40000 ALTER TABLE `LocalRegionType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MethodCodes`
--

DROP TABLE IF EXISTS `MethodCodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MethodCodes` (
  `methodid` int unsigned NOT NULL AUTO_INCREMENT,
  `methodtype` int unsigned NOT NULL,
  `methodname` int unsigned NOT NULL,
  `units` int unsigned NOT NULL,
  `MDL` int unsigned NOT NULL,
  `uncertainty` int unsigned NOT NULL,
  `collectiondescript` varchar(45) NOT NULL,
  `analysisdescript` varchar(45) DEFAULT NULL,
  `Digits` varchar(45) NOT NULL,
  `minvalue` int unsigned NOT NULL,
  `recordingmode` tinyint unsigned NOT NULL,
  PRIMARY KEY (`methodid`,`methodtype`,`methodname`),
  KEY `FK-MethodType-MethodCodes-method-name_idx` (`methodname`),
  KEY `FK-MethodType-MethodCodes-method-type_idx` (`methodtype`),
  KEY `FK-Units-MethodCodes-units_idx` (`units`),
  KEY `FK-MDL-MethodCodes-MDL_idx` (`MDL`),
  KEY `FK-RecordingMode-MethodCodes-recording-mode_idx` (`recordingmode`),
  KEY `FK-MinValue-MethodCodes-min-value_idx` (`minvalue`),
  CONSTRAINT `FK-MDL-MethodCodes-MDL` FOREIGN KEY (`MDL`) REFERENCES `MethodDetectionLimit` (`detectionid`) ON UPDATE CASCADE,
  CONSTRAINT `FK-MethodName-MethodCodes-method-name` FOREIGN KEY (`methodname`) REFERENCES `MethodName` (`methodnameid`) ON UPDATE CASCADE,
  CONSTRAINT `FK-MethodType-MethodCodes-method-type` FOREIGN KEY (`methodtype`) REFERENCES `MethodType` (`methodtypeid`) ON UPDATE CASCADE,
  CONSTRAINT `FK-MinValue-MethodCodes-min-value` FOREIGN KEY (`minvalue`) REFERENCES `MinValue` (`minvalueid`),
  CONSTRAINT `FK-RecordingMode-MethodCodes-recording-mode` FOREIGN KEY (`recordingmode`) REFERENCES `RecordingMode` (`recordingmodeid`) ON UPDATE CASCADE,
  CONSTRAINT `FK-Units-MethodCodes-units` FOREIGN KEY (`units`) REFERENCES `Units` (`unitsid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MethodCodes`
--

LOCK TABLES `MethodCodes` WRITE;
/*!40000 ALTER TABLE `MethodCodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `MethodCodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MethodDetectionLimit`
--

DROP TABLE IF EXISTS `MethodDetectionLimit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MethodDetectionLimit` (
  `detectionid` int unsigned NOT NULL AUTO_INCREMENT,
  `detectionvalue` varchar(45) NOT NULL,
  PRIMARY KEY (`detectionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MethodDetectionLimit`
--

LOCK TABLES `MethodDetectionLimit` WRITE;
/*!40000 ALTER TABLE `MethodDetectionLimit` DISABLE KEYS */;
/*!40000 ALTER TABLE `MethodDetectionLimit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MethodName`
--

DROP TABLE IF EXISTS `MethodName`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MethodName` (
  `methodnameid` int unsigned NOT NULL AUTO_INCREMENT,
  `methodnamedescript` varchar(45) NOT NULL,
  PRIMARY KEY (`methodnameid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MethodName`
--

LOCK TABLES `MethodName` WRITE;
/*!40000 ALTER TABLE `MethodName` DISABLE KEYS */;
/*!40000 ALTER TABLE `MethodName` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MethodType`
--

DROP TABLE IF EXISTS `MethodType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MethodType` (
  `methodtypeid` int unsigned NOT NULL AUTO_INCREMENT,
  `methodtypedescript` varchar(45) NOT NULL,
  PRIMARY KEY (`methodtypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MethodType`
--

LOCK TABLES `MethodType` WRITE;
/*!40000 ALTER TABLE `MethodType` DISABLE KEYS */;
/*!40000 ALTER TABLE `MethodType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MinValue`
--

DROP TABLE IF EXISTS `MinValue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MinValue` (
  `minvalueid` int unsigned NOT NULL AUTO_INCREMENT,
  `parametercode` varchar(45) DEFAULT NULL,
  `value` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`minvalueid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MinValue`
--

LOCK TABLES `MinValue` WRITE;
/*!40000 ALTER TABLE `MinValue` DISABLE KEYS */;
/*!40000 ALTER TABLE `MinValue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MonitorType`
--

DROP TABLE IF EXISTS `MonitorType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MonitorType` (
  `monitortypeid` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `monitortypedescript` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`monitortypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MonitorType`
--

LOCK TABLES `MonitorType` WRITE;
/*!40000 ALTER TABLE `MonitorType` DISABLE KEYS */;
/*!40000 ALTER TABLE `MonitorType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Monitors`
--

DROP TABLE IF EXISTS `Monitors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Monitors` (
  `monitorid` int unsigned NOT NULL AUTO_INCREMENT,
  `regiontype` tinyint unsigned NOT NULL,
  `county` tinyint unsigned NOT NULL,
  `tribal` tinyint unsigned NOT NULL,
  `stateTT` enum('TT','1') NOT NULL,
  `sitenum` int unsigned NOT NULL,
  `POC` int unsigned NOT NULL,
  `certflag` tinyint NOT NULL,
  `networkid` tinyint unsigned NOT NULL,
  `monitortype` tinyint unsigned NOT NULL,
  `collectfreq` tinyint unsigned NOT NULL,
  PRIMARY KEY (`monitorid`,`county`,`tribal`,`POC`,`sitenum`),
  KEY `FK-CertificationFlags-Monitors-cert-flag_idx` (`certflag`),
  KEY `FK-NetworkAffiliation- Monitors-network-id_idx` (`networkid`),
  KEY `FK-CollectionFrequencies-Monitors-collect-freq_idx` (`collectfreq`),
  KEY `FK-MonitorType-Monitors-monitor-type_idx` (`monitortype`),
  CONSTRAINT `FK-CertificationFlags-Monitors-cert-flag` FOREIGN KEY (`certflag`) REFERENCES `CertificationFlags` (`flag-id`),
  CONSTRAINT `FK-CollectionFrequencies-Monitors-collect-freq` FOREIGN KEY (`collectfreq`) REFERENCES `CollectionFrequencies` (`freqid`),
  CONSTRAINT `FK-MonitorType-Monitors-monitor-type` FOREIGN KEY (`monitortype`) REFERENCES `MonitorType` (`monitortypeid`),
  CONSTRAINT `FK-NetworkAffiliation- Monitors-network-id` FOREIGN KEY (`networkid`) REFERENCES `NetworkAffiliations` (`networkcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Monitors`
--

LOCK TABLES `Monitors` WRITE;
/*!40000 ALTER TABLE `Monitors` DISABLE KEYS */;
/*!40000 ALTER TABLE `Monitors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NetworkAffiliations`
--

DROP TABLE IF EXISTS `NetworkAffiliations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NetworkAffiliations` (
  `networkcode` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `networkdescript` varchar(45) NOT NULL,
  PRIMARY KEY (`networkcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NetworkAffiliations`
--

LOCK TABLES `NetworkAffiliations` WRITE;
/*!40000 ALTER TABLE `NetworkAffiliations` DISABLE KEYS */;
/*!40000 ALTER TABLE `NetworkAffiliations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NullQualifiers`
--

DROP TABLE IF EXISTS `NullQualifiers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NullQualifiers` (
  `nullid` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `nulldescriptor` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`nullid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NullQualifiers`
--

LOCK TABLES `NullQualifiers` WRITE;
/*!40000 ALTER TABLE `NullQualifiers` DISABLE KEYS */;
/*!40000 ALTER TABLE `NullQualifiers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POCperSiteperLocalRegion`
--

DROP TABLE IF EXISTS `POCperSiteperLocalRegion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `POCperSiteperLocalRegion` (
  `POC` int unsigned NOT NULL AUTO_INCREMENT,
  `sitenum` int unsigned NOT NULL,
  `county` tinyint unsigned NOT NULL,
  `tribal` tinyint unsigned NOT NULL,
  `type` tinyint unsigned NOT NULL,
  PRIMARY KEY (`POC`,`county`,`tribal`,`sitenum`),
  KEY `FK-LocalRegionType-POCperSiteperLocalRegion-type_idx` (`type`),
  KEY `FK-Tribal-POCperSiteperLocalRegion-tribal_idx` (`tribal`),
  KEY `FK-CountyCodes-POCperSiteperLocalRegion-county_idx` (`county`),
  CONSTRAINT `FK-CountyCodes-POCperSiteperLocalRegion-county` FOREIGN KEY (`county`) REFERENCES `CountyCodes` (`countycode`),
  CONSTRAINT `FK-LocalRegionType-POCperSiteperLocalRegion-type` FOREIGN KEY (`type`) REFERENCES `LocalRegionType` (`localregiontypeid`) ON UPDATE CASCADE,
  CONSTRAINT `FK-Tribal-POCperSiteperLocalRegion-tribal` FOREIGN KEY (`tribal`) REFERENCES `TribalEntityCodes` (`tribalcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POCperSiteperLocalRegion`
--

LOCK TABLES `POCperSiteperLocalRegion` WRITE;
/*!40000 ALTER TABLE `POCperSiteperLocalRegion` DISABLE KEYS */;
/*!40000 ALTER TABLE `POCperSiteperLocalRegion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ParameterClassTypes`
--

DROP TABLE IF EXISTS `ParameterClassTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ParameterClassTypes` (
  `paramclasstypeid` tinyint NOT NULL AUTO_INCREMENT,
  `paramclassdescript` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`paramclasstypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ParameterClassTypes`
--

LOCK TABLES `ParameterClassTypes` WRITE;
/*!40000 ALTER TABLE `ParameterClassTypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ParameterClassTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ParameterClasses`
--

DROP TABLE IF EXISTS `ParameterClasses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ParameterClasses` (
  `class-type` tinyint NOT NULL AUTO_INCREMENT,
  `class name` varchar(45) DEFAULT NULL,
  `parameter-code` int unsigned NOT NULL,
  `parameter-name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`class-type`,`parameter-code`),
  KEY `FK-ParamClassTypes-ParameterClasses-parameter-code_idx` (`parameter-code`),
  CONSTRAINT `FK-ParamClassTypes-ParamClasses-class-type` FOREIGN KEY (`class-type`) REFERENCES `ParameterClassTypes` (`paramclasstypeid`),
  CONSTRAINT `FK-ParamClassTypes-ParameterClasses-parameter-code` FOREIGN KEY (`parameter-code`) REFERENCES `ParameterCodes` (`parameter-id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ParameterClasses`
--

LOCK TABLES `ParameterClasses` WRITE;
/*!40000 ALTER TABLE `ParameterClasses` DISABLE KEYS */;
/*!40000 ALTER TABLE `ParameterClasses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ParameterCodes`
--

DROP TABLE IF EXISTS `ParameterCodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ParameterCodes` (
  `parameter-id` int unsigned NOT NULL AUTO_INCREMENT,
  `parameter-name` varchar(45) NOT NULL,
  `param-abbrev` varchar(45) DEFAULT NULL,
  `param-alt-name` varchar(45) DEFAULT NULL,
  `CAS-number` int DEFAULT NULL,
  `standardunits` varchar(45) DEFAULT NULL,
  `round` varchar(45) DEFAULT 'ENUM(''R'', ''T'')',
  PRIMARY KEY (`parameter-id`),
  UNIQUE KEY `parameter-name_UNIQUE` (`parameter-name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ParameterCodes`
--

LOCK TABLES `ParameterCodes` WRITE;
/*!40000 ALTER TABLE `ParameterCodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ParameterCodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PollutantStandards`
--

DROP TABLE IF EXISTS `PollutantStandards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PollutantStandards` (
  `pollutant-id` int NOT NULL AUTO_INCREMENT,
  `parameter-code` int unsigned NOT NULL,
  `parametername` varchar(45) NOT NULL,
  `pollutantstandardshortname` varchar(45) DEFAULT NULL,
  `pollutantstandarddescript` varchar(45) DEFAULT NULL,
  `NAAQSbasis` varchar(45) DEFAULT NULL,
  `NAAQSstatistic` varchar(45) NOT NULL,
  `primarystandardlevel` varchar(45) NOT NULL,
  `standardunits` varchar(45) NOT NULL,
  `comparisonscale` varchar(45) DEFAULT NULL,
  `round` varchar(45) DEFAULT NULL,
  `Pollutant Standardscol` varchar(45) DEFAULT 'ENUM(''R'' ''T'')',
  PRIMARY KEY (`pollutant-id`),
  KEY `FK-ParameterCodes-PollutantStandards-parameter-code_idx` (`parameter-code`),
  CONSTRAINT `FK-ParameterCodes-PollutantStandards-parameter-code` FOREIGN KEY (`parameter-code`) REFERENCES `ParameterCodes` (`parameter-id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PollutantStandards`
--

LOCK TABLES `PollutantStandards` WRITE;
/*!40000 ALTER TABLE `PollutantStandards` DISABLE KEYS */;
/*!40000 ALTER TABLE `PollutantStandards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QAQualifiersList`
--

DROP TABLE IF EXISTS `QAQualifiersList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QAQualifiersList` (
  `QAid` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `QACode` tinyint unsigned NOT NULL,
  `QAdescript` varchar(45) NOT NULL,
  `QAType` varchar(45) NOT NULL,
  `QATypeCode` char(2) NOT NULL,
  `stillactive` char(4) NOT NULL,
  `legacycode` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`QAid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QAQualifiersList`
--

LOCK TABLES `QAQualifiersList` WRITE;
/*!40000 ALTER TABLE `QAQualifiersList` DISABLE KEYS */;
INSERT INTO `QAQualifiersList` VALUES (1,1,'Deviation from a CFR/Critical Criteria Requir','Quality Assurance Qualifier','QA','YES',NULL),(2,1,'A 1-Point QC check exceeds acceptance criteri','Missing QA/QC Audit','NU','YES',NULL),(3,0,'High Winds','Informational Only','In','YES',NULL);
/*!40000 ALTER TABLE `QAQualifiersList` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RecordingMode`
--

DROP TABLE IF EXISTS `RecordingMode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RecordingMode` (
  `recordingmodeid` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `recordingmodedescript` varchar(45) NOT NULL,
  PRIMARY KEY (`recordingmodeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RecordingMode`
--

LOCK TABLES `RecordingMode` WRITE;
/*!40000 ALTER TABLE `RecordingMode` DISABLE KEYS */;
/*!40000 ALTER TABLE `RecordingMode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RequestExemptionQualifiers`
--

DROP TABLE IF EXISTS `RequestExemptionQualifiers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RequestExemptionQualifiers` (
  `reqeuexid` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `requexdescript` varchar(45) NOT NULL,
  PRIMARY KEY (`reqeuexid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RequestExemptionQualifiers`
--

LOCK TABLES `RequestExemptionQualifiers` WRITE;
/*!40000 ALTER TABLE `RequestExemptionQualifiers` DISABLE KEYS */;
/*!40000 ALTER TABLE `RequestExemptionQualifiers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StateCodes`
--

DROP TABLE IF EXISTS `StateCodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `StateCodes` (
  `state-code` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `statename` varchar(45) NOT NULL,
  `provincetype` varchar(45) NOT NULL,
  PRIMARY KEY (`state-code`),
  UNIQUE KEY `state-name_UNIQUE` (`statename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StateCodes`
--

LOCK TABLES `StateCodes` WRITE;
/*!40000 ALTER TABLE `StateCodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `StateCodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TribalEntities`
--

DROP TABLE IF EXISTS `TribalEntities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TribalEntities` (
  `tribalcode` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `tribalnameid` tinyint unsigned NOT NULL,
  `startdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  `tribalentitymeaning` varchar(45) DEFAULT NULL,
  `tribalentitycomments` varchar(45) DEFAULT NULL,
  `currentuseindicator` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`tribalcode`,`tribalnameid`),
  KEY `FK-TribalEntityNames-TribalEntities-tribal-name-code_idx` (`tribalnameid`),
  CONSTRAINT `FK-TribalEntityCodes-TribalEntities-tribal-code` FOREIGN KEY (`tribalcode`) REFERENCES `TribalEntityCodes` (`tribalcode`),
  CONSTRAINT `FK-TribalEntityNames-TribalEntities-tribal-name-code` FOREIGN KEY (`tribalnameid`) REFERENCES `TribalEntityNames` (`tribalnameiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TribalEntities`
--

LOCK TABLES `TribalEntities` WRITE;
/*!40000 ALTER TABLE `TribalEntities` DISABLE KEYS */;
/*!40000 ALTER TABLE `TribalEntities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TribalEntityCodes`
--

DROP TABLE IF EXISTS `TribalEntityCodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TribalEntityCodes` (
  `tribalcode` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `BIAcode` varchar(45) NOT NULL,
  PRIMARY KEY (`tribalcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TribalEntityCodes`
--

LOCK TABLES `TribalEntityCodes` WRITE;
/*!40000 ALTER TABLE `TribalEntityCodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `TribalEntityCodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TribalEntityNames`
--

DROP TABLE IF EXISTS `TribalEntityNames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TribalEntityNames` (
  `tribalnameiid` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `tribalnamedescript` varchar(45) DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  PRIMARY KEY (`tribalnameiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TribalEntityNames`
--

LOCK TABLES `TribalEntityNames` WRITE;
/*!40000 ALTER TABLE `TribalEntityNames` DISABLE KEYS */;
/*!40000 ALTER TABLE `TribalEntityNames` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Units`
--

DROP TABLE IF EXISTS `Units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Units` (
  `unitsid` int unsigned NOT NULL AUTO_INCREMENT,
  `unitsdescript` varchar(45) NOT NULL,
  PRIMARY KEY (`unitsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Units`
--

LOCK TABLES `Units` WRITE;
/*!40000 ALTER TABLE `Units` DISABLE KEYS */;
/*!40000 ALTER TABLE `Units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table1`
--

DROP TABLE IF EXISTS `table1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `table1` (
  `fk` tinyint NOT NULL,
  PRIMARY KEY (`fk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table1`
--

LOCK TABLES `table1` WRITE;
/*!40000 ALTER TABLE `table1` DISABLE KEYS */;
/*!40000 ALTER TABLE `table1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table2`
--

DROP TABLE IF EXISTS `table2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `table2` (
  `key` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table2`
--

LOCK TABLES `table2` WRITE;
/*!40000 ALTER TABLE `table2` DISABLE KEYS */;
/*!40000 ALTER TABLE `table2` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-09 17:50:43
