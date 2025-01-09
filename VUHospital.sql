CREATE DATABASE  IF NOT EXISTS `VUHospital` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `VUHospital`;
-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: VUHospital
-- ------------------------------------------------------
-- Server version	8.0.40-0ubuntu0.24.04.1

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
-- Table structure for table `epidemiological_data`
--

DROP TABLE IF EXISTS `epidemiological_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `epidemiological_data` (
  `Data_ID` int NOT NULL,
  `Location_ID` int DEFAULT NULL,
  `Recorded_Date` date DEFAULT NULL,
  `Cases_Per_Thousand_People` int DEFAULT NULL,
  `Rainfall` int DEFAULT NULL,
  `Average_Temperature` decimal(5,2) DEFAULT NULL,
  `Update_Date` date DEFAULT NULL,
  `Added_By` int DEFAULT NULL,
  PRIMARY KEY (`Data_ID`),
  KEY `Location_ID` (`Location_ID`),
  KEY `Added_By` (`Added_By`),
  CONSTRAINT `epidemiological_data_ibfk_1` FOREIGN KEY (`Location_ID`) REFERENCES `geographical_location` (`Location_ID`),
  CONSTRAINT `epidemiological_data_ibfk_2` FOREIGN KEY (`Added_By`) REFERENCES `user` (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `epidemiological_data`
--

LOCK TABLES `epidemiological_data` WRITE;
/*!40000 ALTER TABLE `epidemiological_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `epidemiological_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facility_type`
--

DROP TABLE IF EXISTS `facility_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facility_type` (
  `Facility_Type_ID` int NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Description` text,
  `Date_Added` date DEFAULT NULL,
  `Date_Updated` date DEFAULT NULL,
  PRIMARY KEY (`Facility_Type_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facility_type`
--

LOCK TABLES `facility_type` WRITE;
/*!40000 ALTER TABLE `facility_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `facility_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geographical_location`
--

DROP TABLE IF EXISTS `geographical_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `geographical_location` (
  `Location_ID` int NOT NULL,
  `Village` varchar(100) DEFAULT NULL,
  `Parish` varchar(100) DEFAULT NULL,
  `Sub_County` varchar(100) DEFAULT NULL,
  `County` varchar(100) DEFAULT NULL,
  `Region` varchar(50) DEFAULT NULL,
  `Population` int DEFAULT NULL,
  `Coordinates` varchar(100) DEFAULT NULL,
  `Malaria_Risk_Level` varchar(50) DEFAULT NULL,
  `Health_Facilities_Count` int DEFAULT NULL,
  `ITN_Coverage` decimal(5,2) DEFAULT NULL,
  `Reported_Cases` int DEFAULT NULL,
  PRIMARY KEY (`Location_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geographical_location`
--

LOCK TABLES `geographical_location` WRITE;
/*!40000 ALTER TABLE `geographical_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `geographical_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `health_facility`
--

DROP TABLE IF EXISTS `health_facility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `health_facility` (
  `Facility_ID` int NOT NULL,
  `Facility_Name` varchar(100) DEFAULT NULL,
  `Location_ID` int DEFAULT NULL,
  `Facility_Type` int DEFAULT NULL,
  `Capacity` int DEFAULT NULL,
  `Contact_Details` varchar(100) DEFAULT NULL,
  `Date_Added` date DEFAULT NULL,
  `Facility_Head` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Facility_ID`),
  KEY `Location_ID` (`Location_ID`),
  KEY `Facility_Type` (`Facility_Type`),
  CONSTRAINT `health_facility_ibfk_1` FOREIGN KEY (`Location_ID`) REFERENCES `geographical_location` (`Location_ID`),
  CONSTRAINT `health_facility_ibfk_2` FOREIGN KEY (`Facility_Type`) REFERENCES `facility_type` (`Facility_Type_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `health_facility`
--

LOCK TABLES `health_facility` WRITE;
/*!40000 ALTER TABLE `health_facility` DISABLE KEYS */;
/*!40000 ALTER TABLE `health_facility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interventions`
--

DROP TABLE IF EXISTS `interventions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interventions` (
  `Intervention_ID` int NOT NULL,
  `Type` varchar(50) DEFAULT NULL,
  `Location_ID` int DEFAULT NULL,
  `Start_Date` date DEFAULT NULL,
  `End_Date` date DEFAULT NULL,
  `Outcome` varchar(50) DEFAULT NULL,
  `Date_Added` date DEFAULT NULL,
  `Update_Date` date DEFAULT NULL,
  PRIMARY KEY (`Intervention_ID`),
  KEY `Location_ID` (`Location_ID`),
  CONSTRAINT `interventions_ibfk_1` FOREIGN KEY (`Location_ID`) REFERENCES `geographical_location` (`Location_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interventions`
--

LOCK TABLES `interventions` WRITE;
/*!40000 ALTER TABLE `interventions` DISABLE KEYS */;
/*!40000 ALTER TABLE `interventions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laboratory_test`
--

DROP TABLE IF EXISTS `laboratory_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `laboratory_test` (
  `Test_ID` int NOT NULL,
  `Case_ID` int DEFAULT NULL,
  `Test_Type` varchar(50) DEFAULT NULL,
  `Test_Result` varchar(50) DEFAULT NULL,
  `Test_Date` date DEFAULT NULL,
  `Technician_ID` int DEFAULT NULL,
  PRIMARY KEY (`Test_ID`),
  KEY `Case_ID` (`Case_ID`),
  KEY `Technician_ID` (`Technician_ID`),
  CONSTRAINT `laboratory_test_ibfk_1` FOREIGN KEY (`Case_ID`) REFERENCES `malaria_cases` (`Case_ID`),
  CONSTRAINT `laboratory_test_ibfk_2` FOREIGN KEY (`Technician_ID`) REFERENCES `user` (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laboratory_test`
--

LOCK TABLES `laboratory_test` WRITE;
/*!40000 ALTER TABLE `laboratory_test` DISABLE KEYS */;
/*!40000 ALTER TABLE `laboratory_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `malaria_cases`
--

DROP TABLE IF EXISTS `malaria_cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `malaria_cases` (
  `Case_ID` int NOT NULL,
  `Patient_ID` int DEFAULT NULL,
  `Facility_ID` int DEFAULT NULL,
  `Date_of_Diagnosis` date DEFAULT NULL,
  `Type_of_Malaria` varchar(50) DEFAULT NULL,
  `Treatment_ID` int DEFAULT NULL,
  `Outcome_ID` int DEFAULT NULL,
  PRIMARY KEY (`Case_ID`),
  KEY `Patient_ID` (`Patient_ID`),
  KEY `Facility_ID` (`Facility_ID`),
  KEY `Treatment_ID` (`Treatment_ID`),
  KEY `Outcome_ID` (`Outcome_ID`),
  CONSTRAINT `malaria_cases_ibfk_1` FOREIGN KEY (`Patient_ID`) REFERENCES `patient_data` (`Patient_ID`),
  CONSTRAINT `malaria_cases_ibfk_2` FOREIGN KEY (`Facility_ID`) REFERENCES `health_facility` (`Facility_ID`),
  CONSTRAINT `malaria_cases_ibfk_3` FOREIGN KEY (`Treatment_ID`) REFERENCES `treatment` (`Treatment_ID`),
  CONSTRAINT `malaria_cases_ibfk_4` FOREIGN KEY (`Outcome_ID`) REFERENCES `treatment_outcome` (`Outcome_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `malaria_cases`
--

LOCK TABLES `malaria_cases` WRITE;
/*!40000 ALTER TABLE `malaria_cases` DISABLE KEYS */;
/*!40000 ALTER TABLE `malaria_cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `malaria_type`
--

DROP TABLE IF EXISTS `malaria_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `malaria_type` (
  `Type_ID` int NOT NULL,
  `Type_Name` varchar(50) DEFAULT NULL,
  `Description` text,
  `Date_Added` date DEFAULT NULL,
  `Added_By` int DEFAULT NULL,
  `Update_Date` date DEFAULT NULL,
  PRIMARY KEY (`Type_ID`),
  KEY `Added_By` (`Added_By`),
  CONSTRAINT `malaria_type_ibfk_1` FOREIGN KEY (`Added_By`) REFERENCES `user` (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `malaria_type`
--

LOCK TABLES `malaria_type` WRITE;
/*!40000 ALTER TABLE `malaria_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `malaria_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_data`
--

DROP TABLE IF EXISTS `patient_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_data` (
  `Patient_ID` int NOT NULL,
  `First_Name` varchar(50) DEFAULT NULL,
  `Last_Name` varchar(50) DEFAULT NULL,
  `Date_of_Birth` date DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `Phone_Number` varchar(15) DEFAULT NULL,
  `Next_of_Kin` varchar(100) DEFAULT NULL,
  `Location_ID` int DEFAULT NULL,
  `Date_Added` date DEFAULT NULL,
  `Update_Date` date DEFAULT NULL,
  PRIMARY KEY (`Patient_ID`),
  KEY `Location_ID` (`Location_ID`),
  CONSTRAINT `patient_data_ibfk_1` FOREIGN KEY (`Location_ID`) REFERENCES `geographical_location` (`Location_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_data`
--

LOCK TABLES `patient_data` WRITE;
/*!40000 ALTER TABLE `patient_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referral`
--

DROP TABLE IF EXISTS `referral`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `referral` (
  `Referral_ID` int NOT NULL,
  `Case_ID` int DEFAULT NULL,
  `Referred_From` int DEFAULT NULL,
  `Referred_To` int DEFAULT NULL,
  `Referral_Date` date DEFAULT NULL,
  `Reason` text,
  `Outcome_ID` int DEFAULT NULL,
  `Update_Date` date DEFAULT NULL,
  `Referred_By` int DEFAULT NULL,
  PRIMARY KEY (`Referral_ID`),
  KEY `Case_ID` (`Case_ID`),
  KEY `Referred_From` (`Referred_From`),
  KEY `Referred_To` (`Referred_To`),
  KEY `Outcome_ID` (`Outcome_ID`),
  KEY `Referred_By` (`Referred_By`),
  CONSTRAINT `referral_ibfk_1` FOREIGN KEY (`Case_ID`) REFERENCES `malaria_cases` (`Case_ID`),
  CONSTRAINT `referral_ibfk_2` FOREIGN KEY (`Referred_From`) REFERENCES `health_facility` (`Facility_ID`),
  CONSTRAINT `referral_ibfk_3` FOREIGN KEY (`Referred_To`) REFERENCES `health_facility` (`Facility_ID`),
  CONSTRAINT `referral_ibfk_4` FOREIGN KEY (`Outcome_ID`) REFERENCES `treatment_outcome` (`Outcome_ID`),
  CONSTRAINT `referral_ibfk_5` FOREIGN KEY (`Referred_By`) REFERENCES `user` (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referral`
--

LOCK TABLES `referral` WRITE;
/*!40000 ALTER TABLE `referral` DISABLE KEYS */;
/*!40000 ALTER TABLE `referral` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource`
--

DROP TABLE IF EXISTS `resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resource` (
  `Resource_ID` int NOT NULL,
  `Facility_ID` int DEFAULT NULL,
  `Resource_Type` varchar(50) DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `Last_Updated_Date` date DEFAULT NULL,
  `Description` text,
  `Date_Added` date DEFAULT NULL,
  `Update_Date` date DEFAULT NULL,
  PRIMARY KEY (`Resource_ID`),
  KEY `Facility_ID` (`Facility_ID`),
  CONSTRAINT `resource_ibfk_1` FOREIGN KEY (`Facility_ID`) REFERENCES `health_facility` (`Facility_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource`
--

LOCK TABLES `resource` WRITE;
/*!40000 ALTER TABLE `resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supply_chain`
--

DROP TABLE IF EXISTS `supply_chain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supply_chain` (
  `Supply_ID` int NOT NULL,
  `Resource_ID` int DEFAULT NULL,
  `Facility_ID` int DEFAULT NULL,
  `Quantity_Shipped` int DEFAULT NULL,
  `Shipment_Date` date DEFAULT NULL,
  `Expected_Arrival_Date` date DEFAULT NULL,
  `Shipped_By` int DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `Update_Date` date DEFAULT NULL,
  PRIMARY KEY (`Supply_ID`),
  KEY `Facility_ID` (`Facility_ID`),
  KEY `Shipped_By` (`Shipped_By`),
  KEY `Resource_ID` (`Resource_ID`),
  CONSTRAINT `supply_chain_ibfk_1` FOREIGN KEY (`Facility_ID`) REFERENCES `health_facility` (`Facility_ID`),
  CONSTRAINT `supply_chain_ibfk_2` FOREIGN KEY (`Shipped_By`) REFERENCES `user` (`User_ID`),
  CONSTRAINT `supply_chain_ibfk_3` FOREIGN KEY (`Resource_ID`) REFERENCES `resource` (`Resource_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supply_chain`
--

LOCK TABLES `supply_chain` WRITE;
/*!40000 ALTER TABLE `supply_chain` DISABLE KEYS */;
/*!40000 ALTER TABLE `supply_chain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_log`
--

DROP TABLE IF EXISTS `system_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_log` (
  `Log_ID` int NOT NULL,
  `User_ID` int DEFAULT NULL,
  `Activity` text,
  `Timestamp` datetime DEFAULT NULL,
  `IP_Address` varchar(15) DEFAULT NULL,
  `Location` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Log_ID`),
  KEY `User_ID` (`User_ID`),
  CONSTRAINT `system_log_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_log`
--

LOCK TABLES `system_log` WRITE;
/*!40000 ALTER TABLE `system_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `training`
--

DROP TABLE IF EXISTS `training`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `training` (
  `Training_ID` int NOT NULL,
  `User_ID` int DEFAULT NULL,
  `Training_Type` varchar(100) DEFAULT NULL,
  `Training_Date` date DEFAULT NULL,
  `Completion_Status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Training_ID`),
  KEY `User_ID` (`User_ID`),
  CONSTRAINT `training_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training`
--

LOCK TABLES `training` WRITE;
/*!40000 ALTER TABLE `training` DISABLE KEYS */;
/*!40000 ALTER TABLE `training` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treatment`
--

DROP TABLE IF EXISTS `treatment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treatment` (
  `Treatment_ID` int NOT NULL,
  `Treatment_Name` varchar(50) DEFAULT NULL,
  `Treatment_Description` text,
  `Dosage` varchar(50) DEFAULT NULL,
  `Side_Effects` text,
  `Date_Added` date DEFAULT NULL,
  `Update_Date` date DEFAULT NULL,
  PRIMARY KEY (`Treatment_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treatment`
--

LOCK TABLES `treatment` WRITE;
/*!40000 ALTER TABLE `treatment` DISABLE KEYS */;
/*!40000 ALTER TABLE `treatment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treatment_outcome`
--

DROP TABLE IF EXISTS `treatment_outcome`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treatment_outcome` (
  `Outcome_ID` int NOT NULL,
  `Outcome_Name` varchar(50) DEFAULT NULL,
  `Outcome_Description` text,
  `Date_Added` date DEFAULT NULL,
  `Added_By` int DEFAULT NULL,
  `Update_Date` date DEFAULT NULL,
  PRIMARY KEY (`Outcome_ID`),
  KEY `Added_By` (`Added_By`),
  CONSTRAINT `treatment_outcome_ibfk_1` FOREIGN KEY (`Added_By`) REFERENCES `user` (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treatment_outcome`
--

LOCK TABLES `treatment_outcome` WRITE;
/*!40000 ALTER TABLE `treatment_outcome` DISABLE KEYS */;
/*!40000 ALTER TABLE `treatment_outcome` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `User_ID` int NOT NULL,
  `First_Name` varchar(50) DEFAULT NULL,
  `Last_Name` varchar(50) DEFAULT NULL,
  `Preferred_Name` varchar(50) DEFAULT NULL,
  `Role_ID` int DEFAULT NULL,
  `Username` varchar(50) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `Facility_ID` int DEFAULT NULL,
  PRIMARY KEY (`User_ID`),
  KEY `Role_ID` (`Role_ID`),
  KEY `Facility_ID` (`Facility_ID`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`Role_ID`) REFERENCES `user_role` (`Role_ID`),
  CONSTRAINT `user_ibfk_2` FOREIGN KEY (`Facility_ID`) REFERENCES `health_facility` (`Facility_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `Role_ID` int NOT NULL,
  `Role_Name` varchar(50) DEFAULT NULL,
  `Role_Description` text,
  `Date_Added` date DEFAULT NULL,
  `Update_Date` date DEFAULT NULL,
  PRIMARY KEY (`Role_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visit_record`
--

DROP TABLE IF EXISTS `visit_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visit_record` (
  `Visit_ID` int NOT NULL,
  `Patient_ID` int DEFAULT NULL,
  `Visit_Number` int DEFAULT NULL,
  `Visit_Date` date DEFAULT NULL,
  `Date_Added` date DEFAULT NULL,
  `Update_Date` date DEFAULT NULL,
  `Facility_ID` int DEFAULT NULL,
  PRIMARY KEY (`Visit_ID`),
  KEY `Patient_ID` (`Patient_ID`),
  KEY `Facility_ID` (`Facility_ID`),
  CONSTRAINT `visit_record_ibfk_1` FOREIGN KEY (`Patient_ID`) REFERENCES `patient_data` (`Patient_ID`),
  CONSTRAINT `visit_record_ibfk_2` FOREIGN KEY (`Facility_ID`) REFERENCES `health_facility` (`Facility_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visit_record`
--

LOCK TABLES `visit_record` WRITE;
/*!40000 ALTER TABLE `visit_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `visit_record` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-08 18:39:04
