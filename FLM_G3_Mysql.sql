-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: flm_g3
-- ------------------------------------------------------
-- Server version	8.0.29

USE flm_g3;
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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `userName` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `image` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `phone` bigint DEFAULT NULL,
  `address` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `gender` int DEFAULT NULL,
  `gmail` varchar(150) DEFAULT NULL,
  `fullname` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `roleId` int DEFAULT NULL,
  `active` tinyint DEFAULT NULL,
  PRIMARY KEY (`userName`),
  KEY `FK_Account_Role` (`roleId`),
  CONSTRAINT `FK_Account_Role` FOREIGN KEY (`roleId`) REFERENCES `role` (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assessment`
--

DROP TABLE IF EXISTS `assessment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assessment` (
  `assessmentId` int NOT NULL AUTO_INCREMENT,
  `category` varchar(150) DEFAULT NULL,
  `type` varchar(150) DEFAULT NULL,
  `part` int DEFAULT NULL,
  `weight` varchar(50) DEFAULT NULL,
  `completionCriteria` varchar(50) DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `questionType` varchar(255) DEFAULT NULL,
  `noQuestion` varchar(255) DEFAULT NULL,
  `knowledgeSkill` varchar(255) DEFAULT NULL,
  `gradingGuide` varchar(255) DEFAULT NULL,
  `note` longtext,
  `subjectCode` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`assessmentId`),
  KEY `fk_Assessment_Subject` (`subjectCode`),
  CONSTRAINT `fk_Assessment_Subject` FOREIGN KEY (`subjectCode`) REFERENCES `subject` (`subjectCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `combo`
--

DROP TABLE IF EXISTS `combo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `combo` (
  `comboId` int NOT NULL AUTO_INCREMENT,
  `comboNameVn` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `comboNameEn` varchar(255) DEFAULT NULL,
  `note` longtext,
  `tag` varchar(50) DEFAULT NULL,
  `curriculumId` int DEFAULT NULL,
  PRIMARY KEY (`comboId`),
  KEY `fk_Combo_Curriculum` (`curriculumId`),
  CONSTRAINT `fk_Combo_Curriculum` FOREIGN KEY (`curriculumId`) REFERENCES `curriculum` (`curriculumId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `combo_subject`
--

DROP TABLE IF EXISTS `combo_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `combo_subject` (
  `comboId` int NOT NULL,
  `subjectCode` varchar(50) NOT NULL,
  PRIMARY KEY (`comboId`,`subjectCode`),
  KEY `fk_Combo_Subject_Subject` (`subjectCode`),
  CONSTRAINT `fk_Combo_Subject_Combo` FOREIGN KEY (`comboId`) REFERENCES `combo` (`comboId`),
  CONSTRAINT `fk_Combo_Subject_Subject` FOREIGN KEY (`subjectCode`) REFERENCES `subject` (`subjectCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `curriculum`
--

DROP TABLE IF EXISTS `curriculum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curriculum` (
  `curriculumId` int NOT NULL AUTO_INCREMENT,
  `curriculumCode` varchar(50) DEFAULT NULL,
  `nameVn` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `nameEn` varchar(255) DEFAULT NULL,
  `decription` longtext,
  `decisionNo` varchar(150) DEFAULT NULL,
  `totalCredit` int NOT NULL,
  PRIMARY KEY (`curriculumId`),
  KEY `fk_Currculum_Decision` (`decisionNo`),
  CONSTRAINT `fk_Currculum_Decision` FOREIGN KEY (`decisionNo`) REFERENCES `decision` (`decisionNo`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `curriculum_subject`
--

DROP TABLE IF EXISTS `curriculum_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curriculum_subject` (
  `curriculumId` int NOT NULL,
  `subjectCode` varchar(50) NOT NULL,
  PRIMARY KEY (`curriculumId`,`subjectCode`),
  KEY `fk_Curriculum_Subject_Subject` (`subjectCode`),
  CONSTRAINT `fk_Curriculum_Subject_Curriculum` FOREIGN KEY (`curriculumId`) REFERENCES `curriculum` (`curriculumId`),
  CONSTRAINT `fk_Curriculum_Subject_Subject` FOREIGN KEY (`subjectCode`) REFERENCES `subject` (`subjectCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `decision`
--

DROP TABLE IF EXISTS `decision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `decision` (
  `decisionNo` varchar(150) NOT NULL,
  `decisionName` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `approvedDate` date DEFAULT NULL,
  `note` longtext,
  `createDate` date DEFAULT NULL,
  `fileName` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`decisionNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elective`
--

DROP TABLE IF EXISTS `elective`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elective` (
  `electiveId` int NOT NULL AUTO_INCREMENT,
  `electiveNameVn` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `electiveNameEn` varchar(255) DEFAULT NULL,
  `note` longtext,
  `tag` varchar(50) DEFAULT NULL,
  `curriculumId` int DEFAULT NULL,
  PRIMARY KEY (`electiveId`),
  KEY `fk_Elective_Curriculum` (`curriculumId`),
  CONSTRAINT `fk_Elective_Curriculum` FOREIGN KEY (`curriculumId`) REFERENCES `curriculum` (`curriculumId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elective_subject`
--

DROP TABLE IF EXISTS `elective_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elective_subject` (
  `electiveId` int NOT NULL,
  `subjectCode` varchar(50) NOT NULL,
  PRIMARY KEY (`electiveId`,`subjectCode`),
  KEY `fk_Elective_Subject_Subject` (`subjectCode`),
  CONSTRAINT `fk_Elective_Subject_Elecitve` FOREIGN KEY (`electiveId`) REFERENCES `elective` (`electiveId`),
  CONSTRAINT `fk_Elective_Subject_Subject` FOREIGN KEY (`subjectCode`) REFERENCES `subject` (`subjectCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `feature`
--

DROP TABLE IF EXISTS `feature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feature` (
  `featureid` int NOT NULL,
  `featurename` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `url` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`featureid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `feedbackId` int NOT NULL AUTO_INCREMENT,
  `category` longtext,
  `content` longtext,
  `createDate` date DEFAULT NULL,
  `isSeen` tinyint DEFAULT NULL,
  `userName` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`feedbackId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `googleloginhistory`
--

DROP TABLE IF EXISTS `googleloginhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `googleloginhistory` (
  `id` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `timelogin` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lo`
--

DROP TABLE IF EXISTS `lo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lo` (
  `loId` int NOT NULL AUTO_INCREMENT,
  `cloName` varchar(50) DEFAULT NULL,
  `cloDetails` longtext,
  `loDetails` longtext,
  PRIMARY KEY (`loId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `material`
--

DROP TABLE IF EXISTS `material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material` (
  `materialId` int NOT NULL AUTO_INCREMENT,
  `materialDescription` longtext,
  `author` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `publisher` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `publishedDate` date DEFAULT NULL,
  `edition` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `ISBN` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `isMainMaterial` tinyint DEFAULT NULL,
  `isHardCopy` tinyint DEFAULT NULL,
  `isOnline` tinyint DEFAULT NULL,
  `note` longtext,
  `subjectCode` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`materialId`),
  KEY `fk_Material_Subject` (`subjectCode`),
  CONSTRAINT `fk_Material_Subject` FOREIGN KEY (`subjectCode`) REFERENCES `subject` (`subjectCode`)
) ENGINE=InnoDB AUTO_INCREMENT=411 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plo`
--

DROP TABLE IF EXISTS `plo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plo` (
  `ploId` int NOT NULL AUTO_INCREMENT,
  `ploName` varchar(50) DEFAULT NULL,
  `ploDecription` longtext,
  `curriculumId` int DEFAULT NULL,
  PRIMARY KEY (`ploId`),
  KEY `fk_PLO_Curriculum` (`curriculumId`),
  CONSTRAINT `fk_PLO_Curriculum` FOREIGN KEY (`curriculumId`) REFERENCES `curriculum` (`curriculumId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `po`
--

DROP TABLE IF EXISTS `po`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `po` (
  `poId` int NOT NULL,
  `poName` varchar(50) DEFAULT NULL,
  `poDecription` longtext,
  `curriculumId` int DEFAULT NULL,
  PRIMARY KEY (`poId`),
  KEY `fk_PO_Curriculum` (`curriculumId`),
  CONSTRAINT `fk_PO_Curriculum` FOREIGN KEY (`curriculumId`) REFERENCES `curriculum` (`curriculumId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question` (
  `questionId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `detail` longtext,
  `sessionId` int DEFAULT NULL,
  PRIMARY KEY (`questionId`),
  KEY `fk_Question_Session` (`sessionId`),
  CONSTRAINT `fk_Question_Session` FOREIGN KEY (`sessionId`) REFERENCES `session` (`sessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `roleId` int NOT NULL,
  `roleName` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role_feature`
--

DROP TABLE IF EXISTS `role_feature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_feature` (
  `roleid` int NOT NULL,
  `featureid` int NOT NULL,
  PRIMARY KEY (`roleid`,`featureid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `session` (
  `sessionId` int NOT NULL AUTO_INCREMENT,
  `sessionNo` varchar(50) DEFAULT NULL,
  `topic` varchar(255) DEFAULT NULL,
  `learningTeachingType` varchar(50) DEFAULT NULL,
  `itu` varchar(50) DEFAULT NULL,
  `studentMaterials` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `sDownload` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `studentTasks` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `urls` varchar(255) DEFAULT NULL,
  `subjectCode` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`sessionId`),
  KEY `fk_Session_Subject` (`subjectCode`),
  CONSTRAINT `fk_Session_Subject` FOREIGN KEY (`subjectCode`) REFERENCES `subject` (`subjectCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject` (
  `subjectCode` varchar(50) NOT NULL,
  `subjectNameVn` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `subjectNameEn` varchar(255) DEFAULT NULL,
  `semester` varchar(25) DEFAULT NULL,
  `noCredit` int DEFAULT NULL,
  `preRequisite` longtext,
  PRIMARY KEY (`subjectCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `syllabus`
--

DROP TABLE IF EXISTS `syllabus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `syllabus` (
  `syllabusId` int NOT NULL AUTO_INCREMENT,
  `subjectCode` varchar(50) NOT NULL,
  `syllabusNameVn` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `syllabusNameEn` varchar(255) DEFAULT NULL,
  `degreeLevel` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `timeAllocation` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `description` longtext,
  `studentTask` longtext,
  `tool` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `isApproved` bit(1) DEFAULT NULL,
  `note` longtext,
  `minAvgMarkToPass` int DEFAULT NULL,
  `isActive` bit(1) DEFAULT NULL,
  `approvedDate` date DEFAULT NULL,
  `decisionNo` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`syllabusId`),
  KEY `fk_Syllabus_Decision` (`decisionNo`),
  CONSTRAINT `fk_Syllabus_Decision` FOREIGN KEY (`decisionNo`) REFERENCES `decision` (`decisionNo`),
  CONSTRAINT `fk_Syllabus_Subject` FOREIGN KEY (`subjectCode`) REFERENCES `subject` (`subjectCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-19 19:57:10
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: flm_g3
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES ('crdd','ekRSjTfpds0djWgjeK5CIg==',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0),('dinhhoan','ekRSjTfpds0djWgjeK5CIg==',NULL,888637937,NULL,NULL,'hoan@gmail.com','Hoan Dinh',NULL,0,1),('giang','ekRSjTfpds0djWgjeK5CIg==',NULL,988831231,NULL,NULL,'giang@gmail.com','giang',NULL,0,1),('hieu','ekRSjTfpds0djWgjeK5CIg==',NULL,888637937,NULL,NULL,'hieu@gmail.com','hieu',NULL,0,1),('hoan','ekRSjTfpds0djWgjeK5CIg==',NULL,888637937,NULL,NULL,'hoan@gmail.com','dinhhoan',NULL,0,1),('hung','ekRSjTfpds0djWgjeK5CIg==',NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1),('huy','ekRSjTfpds0djWgjeK5CIg==',NULL,888312123,NULL,NULL,'huy@gmail.com','huy',NULL,0,1),('quan','ekRSjTfpds0djWgjeK5CIg==',NULL,888637971,NULL,NULL,'quan@gmail.com','quan',NULL,0,0),('qwe','ekRSjTfpds0djWgjeK5CIg==',NULL,88312984123,NULL,NULL,'qwe@gmail.com','qwe',NULL,0,0),('sonnt','ekRSjTfpds0djWgjeK5CIg==',NULL,877123,NULL,NULL,'sonnt@gmail.com','Ngo Tung Son',NULL,2,0),('student','ekRSjTfpds0djWgjeK5CIg==',NULL,83123,NULL,NULL,NULL,NULL,NULL,3,1),('thai','ekRSjTfpds0djWgjeK5CIg==',NULL,888412341,'cualo',1,'thai@gmail.com','thaihoan',NULL,0,1),('vuong','ekRSjTfpds0djWgjeK5CIg==',NULL,888637937,NULL,NULL,'vuongnguyen@gmail.com','vuongnguyen',NULL,1,1),('vuong1','ekRSjTfpds0djWgjeK5CIg==',NULL,888637937,NULL,NULL,'vuongn@gmail.com','vuong',NULL,2,1),('vuong1412','ekRSjTfpds0djWgjeK5CIg==',NULL,9213312412,NULL,NULL,'vuong123@gmail.com','vuongbom',NULL,0,NULL),('vuong2822002','ekRSjTfpds0djWgjeK5CIg==',NULL,888637937,NULL,NULL,'vuong@gmail.com','vuong',NULL,0,1),('vuongbom123','ekRSjTfpds0djWgjeK5CIg==',NULL,888637937,NULL,NULL,'vuongnguyenvan282@gmail.com','Nguyễn Văn Vương',NULL,0,1),('vuongnguyen','ekRSjTfpds0djWgjeK5CIg==',NULL,888637937,NULL,NULL,'vuongnguyenvan282@gmail.com','Nguyen Vuong',NULL,3,1),('vuongnguyen111','ekRSjTfpds0djWgjeK5CIg==',NULL,87871241234,NULL,NULL,'vuongggqwe@gmail.com','vuong`',NULL,0,NULL),('vuongnguyen282','ekRSjTfpds0djWgjeK5CIg==',NULL,8988836123,NULL,NULL,'nvuong@gmail.com','vuongnguye',NULL,0,1),('vuongnvhe163581','ekRSjTfpds0djWgjeK5CIg==',NULL,987771232,NULL,NULL,'vuongnguyen282@gmail.com','vuon',NULL,0,1),('vve','ekRSjTfpds0djWgjeK5CIg==',NULL,888731821,NULL,NULL,'vuongnv@gmail.com','Vuong Nguyen',NULL,0,NULL);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `assessment`
--

LOCK TABLES `assessment` WRITE;
/*!40000 ALTER TABLE `assessment` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `combo`
--

LOCK TABLES `combo` WRITE;
/*!40000 ALTER TABLE `combo` DISABLE KEYS */;
INSERT INTO `combo` VALUES (1,'Võ Vovinam','PHE_COM1: Vovinam BBA_MC_K16B',NULL,NULL,2),(2,'Cờ Vua','	PHE_COM2: C? Vua BBA_MC_K16B',NULL,NULL,2),(3,'.NET','SE_COM3: Topic on .NET Programming_Ch? d? l?p trình .NET BIT_SE_K15A',NULL,NULL,5);
/*!40000 ALTER TABLE `combo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `combo_subject`
--

LOCK TABLES `combo_subject` WRITE;
/*!40000 ALTER TABLE `combo_subject` DISABLE KEYS */;
INSERT INTO `combo_subject` VALUES (2,'EXE_ELE'),(2,'OTP101'),(3,'SE_COM*1'),(3,'SE_COM*2'),(1,'VOV114'),(1,'VOV124'),(1,'VOV134');
/*!40000 ALTER TABLE `combo_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `curriculum`
--

LOCK TABLES `curriculum` WRITE;
/*!40000 ALTER TABLE `curriculum` DISABLE KEYS */;
INSERT INTO `curriculum` VALUES (2,'BBA_MC_K16B','Chương Trình Cử Nhân QTKD','Bachelor Program of Business Administration','Training Objectives General objectives: The program of Bachelor of Business Administration, Multimedia communication specialty aims to train bachelors with personality and capacity to meet the needs of society, mastering professional','1189/QÐ-ÐHFPT',145),(5,'BIT_SE_K16B','Chương Trình Cử Nhân','Bachelor','Training Objectives 1.1 General objective: Training Information Technology (IT)/Software Engineering (SE) specialty engineers with personality and capacity to meet the needs of society, ','1189/QÐ-ÐHFPT',145),(6,'BBA_MC_K16C','Cử Nhân','Bachelor',' Training Objectives General objectives: The program of Bachelor of Business Administration,','1189/QÐ-ÐHFPT',145),(19,'BBA_MC_K16B','Chương trình cử nhân ngành QTKD, chuyên ngành QTTTĐPT','Bachelor Program of Business Administration, Multimedia Communication Major','1. Training Objectives General objectives: The program of Bachelor of Business Administration, Multimedia communication specialty aims to train bachelors with personality and capacity to meet the needs of society','1095/QÐ-ÐHFPT',145),(20,'BIT_SE_K16B','Chương trình cử nhân ngành CNTT, chuyên ngành Kỹ thuật phần mềm','Bachelor Program of Information Technology, Software Engineering Major ','1. Training Objectives 1.1 General objective: Training Information Technology (IT)/Software Engineering (SE) specialty engineers with personality and capacity to meet the needs of society','1095/QÐ-ÐHFPT',145),(21,'BBA_MC_K16C','Chương trình cử nhân ngành QTKD, chuyên ngành QTTTĐPT','Bachelor Program of Business Administration, Multimedia Communication Major','1. Training Objectives General objectives: The program of Bachelor of Business Administration, Multimedia communication specialty aims to train bachelors with personality and capacity to meet the needs of society,','1095/QÐ-ÐHFPT',145),(22,'BEN_K16B','Chương trình cử nhân Ngôn ngữ Anh','Bachelor of English Studies','1. General objective: The program of Bachelor of English Studies aims to train proficient bachelors with personality and capacity to meet the needs of society; be able to use English','1095/QÐ-ÐHFPT',145),(23,'BEN_K16C','Chương trình cử nhân Ngôn ngữ Anh','Bachelor of English Studies','1. General objective: The program of Bachelor of English Studies aims to train proficient bachelors with personality and capacity to meet the needs of society; be able to use English','1095/QÐ-ÐHFPT',145),(24,'BBA_MKT_K16B','CTĐT ngành QTKD, chuyên ngành Marketing','Bachelor Program of Business Adminstration, Marketing Major','1. Training Objectives General objective: Training Bachelor of Information Technology, Digital Art & Design specialty with personality and capacity to meet the needs of society','1095/QÐ-ÐHFPT',146);
/*!40000 ALTER TABLE `curriculum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `curriculum_subject`
--

LOCK TABLES `curriculum_subject` WRITE;
/*!40000 ALTER TABLE `curriculum_subject` DISABLE KEYS */;
/*!40000 ALTER TABLE `curriculum_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `decision`
--

LOCK TABLES `decision` WRITE;
/*!40000 ALTER TABLE `decision` DISABLE KEYS */;
INSERT INTO `decision` VALUES ('1095/QÐ-ÐHFPT','','1900-01-01','','1900-01-01',''),('1189/QÐ-ÐHFPT','Ban hành đề cương chi tiết học kì Spring 2023','2022-12-22',NULL,'2022-12-22',NULL),('703/QÐ-ÐH-FPT','Ban hành điều chỉnh đề cương kì Fall 2022','2022-08-17',NULL,'2022-08-19',NULL);
/*!40000 ALTER TABLE `decision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `elective`
--

LOCK TABLES `elective` WRITE;
/*!40000 ALTER TABLE `elective` DISABLE KEYS */;
/*!40000 ALTER TABLE `elective` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `elective_subject`
--

LOCK TABLES `elective_subject` WRITE;
/*!40000 ALTER TABLE `elective_subject` DISABLE KEYS */;
/*!40000 ALTER TABLE `elective_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `feature`
--

LOCK TABLES `feature` WRITE;
/*!40000 ALTER TABLE `feature` DISABLE KEYS */;
/*!40000 ALTER TABLE `feature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `googleloginhistory`
--

LOCK TABLES `googleloginhistory` WRITE;
/*!40000 ALTER TABLE `googleloginhistory` DISABLE KEYS */;
INSERT INTO `googleloginhistory` VALUES ('101603371740690711919','vuongnvhe163581@fpt.edu.vn',NULL),('107137775566391228606','vuongnguyenvan282@gmail.com',NULL),('eqweq11','vvv@gmail.com',NULL),('qweq1','vuong123',NULL),('123','qeq2@jjdqw','2023-02-07'),('107137775566391228606','vuongnguyenvan282@gmail.com','2023-02-07'),('101603371740690711919','vuongnvhe163581@fpt.edu.vn','2023-02-07'),('101603371740690711919','vuongnvhe163581@fpt.edu.vn','2023-02-08'),('107137775566391228606','vuongnguyenvan282@gmail.com','2023-02-09'),('101603371740690711919','vuongnvhe163581@fpt.edu.vn','2023-02-09'),('101603371740690711919','vuongnvhe163581@fpt.edu.vn','2023-02-15'),('101603371740690711919','vuongnvhe163581@fpt.edu.vn','2023-02-16'),('101603371740690711919','vuongnvhe163581@fpt.edu.vn','2023-02-18');
/*!40000 ALTER TABLE `googleloginhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `lo`
--

LOCK TABLES `lo` WRITE;
/*!40000 ALTER TABLE `lo` DISABLE KEYS */;
/*!40000 ALTER TABLE `lo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `material`
--

LOCK TABLES `material` WRITE;
/*!40000 ALTER TABLE `material` DISABLE KEYS */;
INSERT INTO `material` VALUES (1,'Introductory documents aout FPT Group and FPT University','','','1900-01-01','','',0,0,0,'','OTP101'),(2,'Hồi ký: Những điều đọng lại qua hai cuộc chiến tranh','','','1900-01-01','','',0,0,0,'','OTP101'),(3,'Hồi ký: Tổng hành dinh','','','1900-01-01','','',0,0,0,'','OTP101'),(4,'Computer Organization and Architecture: Design for Performance','William Stallings','Prentice Hall','2012-01-01','9th (or 10th)','978-0132936330 (9th), 978-0134101613 (10th)',1,1,0,'','CEA201'),(5,'Computer architecture : A quantitative approach','John L. Hennessy, David A Patterson','Morgan Kaufmann','1900-01-01','','',0,1,0,'','CEA201'),(6,'http://williamstallings.com/ComputerOrganization/COA9e-Instructor/','','','1900-01-01','','',0,0,1,'','CEA201'),(7,'http://williamstallings.com/ComputerOrganization/COA9e-student/','','','1900-01-01','','',0,0,1,'','CEA201'),(8,'PowerPoint Lecture Slides','','','1900-01-01','','',0,0,0,'','CEA201'),(9,'Instructor Solutions Manual','','','1900-01-01','','',0,0,0,'','CEA201'),(10,'Instructor Project Manual','','','1900-01-01','','',0,0,0,'','CEA201'),(11,'Test banks','','','1900-01-01','','',0,0,0,'','CEA201'),(12,'Foundations Of Computer Science','Behrouz Forouzan','Cengage','2017-01-01','4th','978-1-4737-5104-0',1,1,0,'','CSI104'),(13,'Fundamentals of Information Systems Security','','Jones & Bartlett','2016-01-01','3rd','',0,1,0,'','CSI104'),(14,'Computer architecture : A quantitative approach','John L. Hennessy, David A Patterson','Morgan Kaufmann','2011-01-01','5th','',0,1,0,'','CSI104'),(15,'Calculus 1','','','1900-01-01','','',1,0,1,'https://openstax.org/details/books/calculus-volume-1','MAE101'),(16,'Calculus 2','','','1900-01-01','','',1,0,1,'https://openstax.org/details/books/calculus-volume-2','MAE101'),(17,'powerpoint in CD + Powerpoint prepared by previous lecturers (PP).','','','1900-01-01','','',0,0,0,'','MAE101'),(18,'Student Video Skillbuilder in CD (Video).','','','1900-01-01','','',0,0,0,'','MAE101'),(19,'Animation in CD (Animation).','','','1900-01-01','','',0,0,0,'','MAE101'),(20,'Computerized tools (for example Maxima http://maxima.sourceforge.net/) (CT)','','','1900-01-01','','',0,0,0,'','MAE101'),(21,'Essential Calculus','James Stewart','Thomson Brooks/Cole','1900-01-01','','978-0-495-10860-3',0,0,0,'','MAE101'),(22,'Calculus for engineers','Donald Trim','Prentice Hall,','1900-01-01','','0-13-085603-7',0,0,0,'','MAE101'),(23,'Calculus','Stanley I. Grossman','','1900-01-01','','0-03-096420-2',0,0,0,'','MAE101'),(24,'Linear Algebra with applications','W.Keith Nicholson,','Mc Graw Hill Education','1900-01-01','','987-1-259-07299-4.',0,1,0,'','MAE101'),(25,'Linear Algebra with Applications','W. Keith Nicholson','Lyryx Online Resources','2021-01-01','2021-A','',1,0,1,'https://lyryx.com/linear-algebra-applications/','MAE101'),(26,'Foundations of Programming Using C','Evan Weaver','2003','1900-01-01','','',1,1,0,'','PRF192'),(27,'BTP100: http://cs.senecac.on.ca/~btp100/pages/welco.html','','','1900-01-01','','',0,0,1,'','PRF192'),(28,'FU Presentation Powerpoints (.zip)','','','1900-01-01','','',0,0,0,'','PRF192'),(29,'FU CMS at http://cms.fpt.edu.vn .','','','1900-01-01','','',0,0,1,'','PRF192'),(30,'https://www.coursera.org/specializations/academic-skills','','Coursera','1900-01-01','','',1,0,1,'SPEC: Academic Skills for University Success Specialization','SSL101c'),(31,'https://www.coursera.org/learn/digital-literacy','','Coursera','1900-01-01','','',1,0,1,'MOOC 01: Introduction to Information & Digital Literacy for University Success','SSL101c'),(32,'https://www.coursera.org/learn/problem-solving-skills','','Coursera','1900-01-01','','',1,0,1,'MOOC 02: Introduction to Problem-Solving Skill for University Success','SSL101c'),(33,'https://www.coursera.org/learn/critical-thinking-skills','','Coursera','1900-01-01','','',1,0,1,'MOOC 03: Critical Thinking Skills for University Success','SSL101c'),(34,'https://www.coursera.org/learn/communication-skills','','Coursera','1900-01-01','','',1,0,1,'MOOC 04: Communication Skills for University Success','SSL101c'),(35,'https://www.coursera.org/learn/academic-skills-project','','Coursera','1900-01-01','','',1,0,1,'MOOC 05: Academic Skills for University Success: Capstone','SSL101c'),(36,'Discrete Mathematics and its applications','Kenneth Rosen','Mc.Graw Hill, IE','2007-01-01','Ed.7 (or 6)','978-0073383095',1,1,0,'','MAD101'),(37,'Teaching Suggestion and Applications of Discrete Mathematics for ST1 (TS)','','','1900-01-01','','',0,0,0,'','MAD101'),(38,'Testbank for ST1','','','1900-01-01','','',0,0,0,'','MAD101'),(39,'Powerpoint image in CD + Powerpoint prepared by previous lecturers (PP)','','','1900-01-01','','',0,0,0,'','MAD101'),(40,'Computerized tools (for example C programming tools, Maxima http://maxima.sourceforge.net/) (CT)','','','1900-01-01','','',0,0,0,'','MAD101'),(41,'Adam Drozdek. Data structure and Algorithms in Java. 3rd Edition.','','','1900-01-01','','',0,1,0,'','MAD101'),(42,'https://www.coursera.org/specializations/computer-communications','','Coursera','1900-01-01','','',1,0,1,'SPEC: Computer Communications Specialization','NWC203c'),(43,'https://learner.coursera.help/hc/en-us/articles/208280036-Coursera-Code-of-Conduct','','Coursera','1900-01-01','','',0,0,1,'Help Articles','NWC203c'),(44,'https://www.coursera.org/learn/fundamentals-network-communications?specialization=computer-communications','','Coursera','1900-01-01','','',1,0,1,'MOOC 1: Fundamentals of Network Communication','NWC203c'),(45,'https://www.coursera.org/learn/peer-to-peer-protocols-local-area-networks?specialization=computer-communications','','Coursera','1900-01-01','','',1,0,1,'MOOC 2: Peer-to-Peer Protocols and Local Area Networks','NWC203c'),(46,'https://www.coursera.org/learn/packet-switching-networks-algorithms?specialization=computer-communications','','Coursera','1900-01-01','','',1,0,1,'MOOC 3: Packet Switching Networks and Algorithms','NWC203c'),(47,'https://www.coursera.org/learn/tcp-ip-advanced?specialization=computer-communications','','Coursera','1900-01-01','','',1,0,1,'MOOC 4: TCP/IP and Advanced Topics','NWC203c'),(48,'Modern Operating Systems (4th edition or 3rd or 2nd)','Andrew S. Tanenbaum','Pearson','2014-01-01','4th or 3rd or 2nd','9781292061429 or 9780133591620 (4th Edition)',1,1,0,'','OSG202'),(49,'Course slides (.pptx)','','','1900-01-01','','',0,0,0,'','OSG202'),(50,'Understanding operating systems','Ann McIver McHoes and Ida M. Flynn','Cengage Learning','2008-01-01','8th','978-1305674257',0,1,0,'','OSG202'),(51,'http://courses.knox.edu/cs226/','','','1900-01-01','','',0,0,1,'','OSG202'),(52,'Connecting with Computer Science','Creg Anderson, David Ferrro, Robert Hilbon','Thomson course Technology','2010-01-01','2nd Edition','978-1439080351',0,1,0,'','OSG202'),(53,'Java 8 Specification https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-1.html#jvms-1.1','','','1900-01-01','','',0,0,1,'','PRO192'),(54,'Core Java, Volum 1: Fundamentals','Cay Horstmann','Pearson','2018-01-01','11th','978-0135166307',0,1,0,'','PRO192'),(55,'Core Java, Volum 2: Advanced features','Cay Horstmann','Pearson','2019-01-01','11th','978-0135166314',0,1,0,'','PRO192'),(56,'Object-Oriented Programming using Java (website (offline): Học liệu do FU biên soạn)','','','1900-01-01','','',1,0,0,'','PRO192'),(57,'Problem Solving in Teams and Groups','Cameron W. Piercy','University of Kansas Libraries','2019-01-01','','',1,0,1,'https://open.umn.edu/opentextbooks/textbooks/problem-solving-in-teams-and-groups','SSG104'),(58,'College Success','N/A','Lumen Learning courseware','1900-01-01','','',1,0,1,'https://courses.lumenlearning.com/lumencollegesuccessxtraining2/ or https://courses.lumenlearning.com/lumencollegesuccessxtraining/','SSG104'),(59,'Business communication for success','N/A','University of Minnesota i','2015-01-01','2th','',1,0,1,'https://www.oercommons.org/courses/basics-of-written-business-communication/view','SSG104'),(60,'Working in group 7th ed.','','Pearson','2017-01-01','','',0,1,0,'','SSG104'),(61,'Business communication 7th ed.','','Thomson-South Western','2008-01-01','','',0,1,0,'','SSG104'),(62,'PowerPoint Slides','','','1900-01-01','','',0,0,0,'','SSG104'),(63,'Michaelt T. Goodrich, Roberto Tamassia, Michael H. Goldwasser: Data Structures and Algorithms in Java, 6th Edition, 2014 (ebook) Link to the book: http://coltech.vnu.edu.vn/~sonpb/DSA/Data%20Structures%20and%20Algorithms%20in%20Java,%206th%20Edition,%202014.pdf','Michaelt T. Goodrich, Roberto Tamassia, Michael H. Goldwasser','Wiley','2014-01-01','6th','978-1-118-77133-4',1,0,1,'','CSD201'),(64,'FU slides (ppt)','','','1900-01-01','','',0,0,0,'','CSD201'),(65,'FU exercises (pdf)','','','1900-01-01','','',0,0,0,'','CSD201'),(66,'Code files for students (java files)','','','1900-01-01','','',0,0,0,'','CSD201'),(67,'FU CMS at http://cms.fpt.edu.vn.','','','1900-01-01','','',0,0,1,'','CSD201'),(68,'First Course in Database Systems','Jeffrey D. Ullman, Jennifer Widom','Pearson','2008-01-01','Third edition','9781292025827 or 9780136006374',1,1,0,'','DBI202'),(69,'Database Management System','Raghu ramakrishnan','Mc Graw-Hill','1900-01-01','Third edition','978-8131769591',0,1,0,'','DBI202'),(70,'Database Management System (DBMS): A Practical Approach','Rajiv Chopra','SChand Publications','1900-01-01','','9788121932455',0,1,0,'','DBI202'),(71,'Course slides (.pptx)','','','1900-01-01','','',0,0,0,'','DBI202'),(72,'Labs & assignment','','','1900-01-01','','',0,0,0,'','DBI202'),(73,'Dekiru Nihongo - Beginner Main textbook','できる日本語教材開発プロジェクト','','1900-01-01','','',1,1,0,'Giáo trình Dekiru quyển đỏ nhà trường đã có bản quyền','JPD113'),(74,'Dekiru Nihongo - Beginner Grammar Workbook Vocabulary Workbook','できる日本語教材開発プロジェクト','','1900-01-01','','',0,0,0,'','JPD113'),(75,'Kana Nyuumon (Nhập môn Kana)','Japan Foundation','','1900-01-01','','',0,0,0,'','JPD113'),(76,'Kanji Tamago','できる日本語教材開発プロジェクト','','1900-01-01','','',0,1,0,'','JPD113'),(77,'Slide bài giảng do giảng viên cung cấp','','','1900-01-01','','',0,0,0,'','JPD113'),(78,'Lab Room Regulations (For Students)','','','1900-01-01','','',1,0,0,'Bản mềm do FU biên soạn','LAB211'),(79,'Mentor guide For Lab (For Mentors only)','','','1900-01-01','','',1,0,0,'Bản mềm do FU biên soạn','LAB211'),(80,'Evaluation Templates (For Mentors only)','','','1900-01-01','','',1,0,0,'Bản mềm do FU biên soạn','LAB211'),(81,'https://learner.coursera.help/hc/en-us/articles/208280036-Coursera-Code-of-Conduct','','Coursera','1900-01-01','','',0,0,1,'','WED201c'),(82,'https://www.coursera.org/learn/html/home/welcome','','Coursera','1900-01-01','','',1,0,1,'MOOC 1: Introduction to HTML5','WED201c'),(83,'https://www.coursera.org/learn/introcss/home/welcome','','Coursera','1900-01-01','','',1,0,1,'MOOC 2: Introduction to CSS3','WED201c'),(84,'https://www.coursera.org/learn/javascript/home/welcome','','Coursera','1900-01-01','','',1,0,1,'MOOC 3: Interactivity with JavaScript','WED201c'),(85,'https://www.coursera.org/learn/responsivedesign/home/welcome','','Coursera','1900-01-01','','',1,0,1,'MOOC 4: Advanced Styling with Responsive Design','WED201c'),(86,'https://www.coursera.org/learn/web-design-project/home/welcome','','Coursera','1900-01-01','','',1,0,1,'MOOC 5: Web Design for Everybody Capstone','WED201c'),(87,'https://www.coursera.org/specializations/web-design; University of Michigan','','Coursera','1900-01-01','','',1,0,1,'SPEC: Web Design for Everybody: Basics of Web Development & Coding','WED201c'),(88,'Course from Edx: https://learning.edx.org/course/course-v1:CurtinX+IOT1x+2T2018/home','','','1900-01-01','','',1,0,1,'','IOT102'),(89,'Course from Edx: https://learning.edx.org/course/course-v1:CurtinX+IOT2x+2T2018/home','','','1900-01-01','','',1,0,1,'','IOT102'),(90,'Free Hardware and IoT Ebooks_ OReilly Media','','','1900-01-01','','',0,0,0,'','IOT102'),(91,'Introduction to Arduino A piece of cake! by Alan G. Smith September 30, 2011 free at: http://www.introtoarduino.com','','','1900-01-01','','',0,0,1,'','IOT102'),(92,'Documents at https://www.arduino.cc/','','','1900-01-01','','',0,0,1,'','IOT102'),(93,'Instructables.com - 20 Unbelievable Arduino Projects','','','1900-01-01','','',0,0,1,'','IOT102'),(94,'Slides','','','1900-01-01','','',1,0,0,'','IOT102'),(95,'Tutorials','','','1900-01-01','','',1,0,0,'','IOT102'),(96,'Video','','','1900-01-01','','',1,0,0,'','IOT102'),(97,'Electronics component list','','','1900-01-01','','',1,0,0,'','IOT102'),(98,'『できる日本語　初級　本冊』','嶋田和子','アルク','2011-01-01','','ISBN-10 : 4757419775ISBN-13 : 978-4757419773',0,1,0,'Giáo trình Dekiru quyển đỏ nhà trường đã có bản quyền','JPD123'),(99,'『わたしの文法ノート 初級 (できる日本語)』','嶋田和子','凡人社','2011-01-01','','ISBN-10 : 489358801XISBN-13 : 978-4893588012',0,1,0,'','JPD123'),(100,'『わたしのことばノート 初級 (できる日本語)』','嶋田 和子','凡人社','2012-01-01','','ISBN-10 : 4893588117ISBN-13 : 978-4893588111',0,1,0,'','JPD123'),(101,'漢字たまご 初級','有山優樹 (著), 落合知春 (著), 立原雅子 (著), 林英子 (著), 山口知才子 (著), 酒井弘美 (イラスト), 嶋田和子 (監修)','凡人社','2012-01-01','','ISBN-10 : 4893588311ISBN-13 : 978-4893588319',0,1,0,'','JPD123'),(102,'Slide bài giảng do giảng viên cung cấp','','','1900-01-01','','',0,0,0,'','JPD123'),(103,'Main materials: 1) Montgomery D.C. & Runger G.C., Applied Statistics and Probability for Engineers','John Wiley & Sons.','Wiley','2006-01-01','4th (or 5th or 6th) ed.,','9781119718871',1,1,0,'','MAS291'),(104,'Powerpoint slides (PP).','','','1900-01-01','','',0,0,0,'','MAS291'),(105,'Computerized tools (for example Excel and DDXL add-ons) (CT)','','','1900-01-01','','',0,0,0,'','MAS291'),(106,'Elementary Statistics Using Excel, 3/E,','Mario F. Triola','Addison-Wesley','2002-01-01','3rd','321365135',0,1,0,'','MAS291'),(107,'Text book 1: Professional Java® forWebApplications Link: http://library.books24x7.com/toc.aspx?bookid=62587','Nicholas S. Williams','Wrox','1900-01-01','1st edition','978-1118656464',1,0,1,'','PRJ301'),(108,'Article 1: http://docs.oracle.com/javase/tutorial/JDBC','','','1900-01-01','','',0,0,1,'','PRJ301'),(109,'Article 2: https://docs.oracle.com/cd/B14099_19/web.1012/b14017/filters.htm','','','1900-01-01','','',0,0,1,'','PRJ301'),(110,'https://learner.coursera.help/hc/en-us/articles/208280036-Coursera-Code-of-Conduct','','Coursera','1900-01-01','','',0,0,1,'','SWE201c'),(111,'https://www.coursera.org/learn/software-processes','','Coursera','1900-01-01','','',1,0,1,'MOOC 01: Software Development Processes and Methodologies','SWE201c'),(112,'https://www.coursera.org/learn/agile-software-development','','Coursera','1900-01-01','','',1,0,1,'MOOC 02: Agile Software Development','SWE201c'),(113,'https://www.coursera.org/learn/lean-software-development','','Coursera','1900-01-01','','',1,0,1,'MOOC 03: Lean Software Development','SWE201c'),(114,'https://www.coursera.org/learn/engineering-practices-secure-software-quality','','Coursera','1900-01-01','','',1,0,1,'MOOC 04: Engineering Practices for Building Quality Software','SWE201c'),(115,'https://www.coursera.org/specializations/software-development-lifecycle','','Coursera','1900-01-01','','',1,0,1,'SPEC: Software Development Lifecycle','SWE201c'),(116,'https://learner.coursera.help/hc/en-us/articles/208280036-Coursera-Code-of-Conduct','','Coursera','1900-01-01','','',0,0,1,'','ITE302c'),(117,'https://www.coursera.org/learn/promote-ethical-data-driven-technologies','','Coursera','1900-01-01','','',1,0,1,'MOOC 1: Promote the Ethical Use of Data-Driven Technologies','ITE302c'),(118,'https://www.coursera.org/learn/ethical-frameworks-action','','Coursera','1900-01-01','','',1,0,1,'MOOC 2: Turn Ethical Frameworks into Actionable Steps','ITE302c'),(119,'https://www.coursera.org/learn/detect-mitigate-ethical-risks','','Coursera','1900-01-01','','',1,0,1,'MOOC 3: Detect and Mitigate Ethical Risks','ITE302c'),(120,'https://www.coursera.org/learn/ethical-communication-data-driven-technologies','','Coursera','1900-01-01','','',1,0,1,'MOOC 4: Communicate Effectively about Ethical Challenges in Data-Driven Technologies','ITE302c'),(121,'https://www.coursera.org/learn/ethical-data-driven-technology-leader','','Coursera','1900-01-01','','',1,0,1,'MOOC 5: Create and Lead an Ethical Data-Driven Organization','ITE302c'),(122,'https://www.coursera.org/learn/preparing-for-your-certnexus-certification-exam','','Coursera','1900-01-01','','',1,0,1,'MOOC 6: Preparing for Your CertNexus Certification Exam','ITE302c'),(123,'https://www.coursera.org/specializations/certified-ethical-emerging-technologist','','Coursera','1900-01-01','','',1,0,1,'SPEC: CertNexus Certified Ethical Emerging Technologist Professional Certificate','ITE302c'),(124,'Guides & Templates (for Students & Teachers)','','','1900-01-01','','',1,0,0,'Bản mềm do FU biên soạn','SWP391'),(125,'Learn HTML and CSS with W3Schools (https://www.w3schools.com/)','','','1900-01-01','','',0,0,1,'','SWP391'),(126,'Murach\'s Java Servlets and JSP','Joel Murach, Michael Urban','Mike Murach & Associates','2014-01-01','3rd Edition','978-1890774783',0,1,0,'','SWP391'),(127,'SQL for MySQL Developers A Comprehensive Tutorial and Reference','Rick F. van der Lans','Addison-Wesley Professional','2007-01-01','1st edition','978-0131497351',0,1,0,'','SWP391'),(128,'Software Requirements','Karl E. Wiegers','Microsoft Press','1900-01-01','Third Edition','978-0-7356-7966-5',1,1,0,'','SWR302'),(129,'More About Software Requirements: Thorny Issues and Practical Advice','Karl E. Wiegers','Microsoft Press','1900-01-01','','978-0-7356-2267-8',0,1,0,'','SWR302'),(130,'The Software Requirements Memory Jogger: A Pocket Guide to Help Software And Business Teams Develop and Manage Requirements','Ellen Gottesdiener','GOAL/QPC','1900-01-01','','978-1-57681-060-6',0,1,0,'','SWR302'),(131,'Requirements Engineering: Secure Software Specifications Specialization','','Coursera','1900-01-01','','',0,0,1,'https://www.coursera.org/specializations/requirements-engineering-secure-software','SWR302'),(132,'Foundations of Software Testing: ISTQB Certification','Dorothy Graham, Erik van Veenendaal, Isabel Evans,Rex Black','Cengage Learning Business Press','2008-01-01','','978-1-84480-355-2',1,0,1,'Books24x7, https://library.books24x7.com/toc.aspx?bookid=26179','SWT301'),(133,'https://cmshn.fpt.edu.vn/','','','1900-01-01','','',0,0,1,'','SWT301'),(134,'Foundations of software testing istqb certification','','','1900-01-01','','',0,0,0,'','SWT301'),(135,'Software Quality Engineering: Testing, Quality assurance, and Quantifiable Improvement. Jeff Tian','','','1900-01-01','','',0,0,0,'','SWT301'),(136,'Course Software Testing and Quality Assurance by Tian in http://engr.smu.edu/~tian/class/7314.06f/syl.html (availble in FU library)','','','1900-01-01','','',0,0,1,'','SWT301'),(137,'Ian Sommerville. Software Engineering 8e. Part 5: Verification and Validation.','','','1900-01-01','','',0,0,0,'','SWT301'),(138,'Towards Zero Defect Software: The Cleanroom Approach. Mario A. Nascimento, Mario A. Nascimento, Murat M. Tanik, Murat M. Tanik. 1994. Available at http://www.cnptia.embrapa.br/~mario/Papers/tr-94-cse-31.ps.gz','','','1900-01-01','','',0,0,0,'','SWT301'),(139,'Computer Software Validation. Alan Muirhead. News & Views, March 2000. Available at http://www.stcpmc.org/archive/archive/n&v/feat0300.html','','','1900-01-01','','',0,0,1,'','SWT301'),(140,'Agile Testing: A Practical Guide for Testers and Agile Teams','Lisa Crispin,Janet Gregory','','1900-01-01','','978-0321534460',0,1,0,'','SWT301'),(141,'https://www.coursera.org/specializations/academic-english','','Coursera','1900-01-01','','',1,0,1,'SPEC: Academic English: Writing Specialization','ENW492c'),(142,'https://www.coursera.org/learn/grammar-punctuation','','Coursera','1900-01-01','','',1,0,1,'MOOC 01: Grammar and Punctuation','ENW492c'),(143,'https://www.coursera.org/learn/getting-started-with-essay-writing','','Coursera','1900-01-01','','',1,0,1,'MOOC 02: Getting Started with Essay Writing','ENW492c'),(144,'https://www.coursera.org/learn/advanced-writing','','Coursera','1900-01-01','','',1,0,1,'MOOC 03: Advanced Writing','ENW492c'),(145,'https://www.coursera.org/learn/introduction-to-research-for-essay-writing','','Coursera','1900-01-01','','',1,0,1,'MOOC 04: Introduction to Research for Essay Writing','ENW492c'),(146,'https://www.coursera.org/learn/academic-writing-capstone','','Coursera','1900-01-01','','',1,1,1,'MOOC 05: Project: Writing a Research Paper','ENW492c'),(147,'Hướng dẫn quản lý thực tập (07.04PL - HDCV Quan ly thuc tap) Guideline for internship management (07.04PL - HDCV Quan ly thuc tap)','','','1900-01-01','','',1,1,0,'Internal material, self-documented FPTU','OJT202'),(148,'Phiếu khảo sát doanh nghiệp về sinh viên thực tập (07.16BMĐHFE10- Khảo sát doanh nghiệp về sinh viên thực tập) Business survey on student interns','','','1900-01-01','','',1,1,0,'Internal material, self-documented FPTU','OJT202'),(149,'Phiếu Khảo sát sinh viên về kỳ thực tập (07.17BMĐHFE10- Khao sat sinh vien ve ky thuc tap) Student survey on the internship','','','1900-01-01','','',1,1,0,'Internal material, self-documented FPTU','OJT202'),(150,'Phiếu đánh giá sinh viên kỳ OJT Evaluation of the students\' OJT performance','','','1900-01-01','','',1,1,0,'Internal material, self-documented FPTU','OJT202'),(151,'Google Android developer reference site (http://developer.android.com/resources/tutorials/hello-world.html)','Google','Google','1900-01-01','N/A','',1,0,1,'','PRM392'),(152,'https://google-developer-training.github.io/android-developer-fundamentals-course-concepts-v2/','Google','Google','2018-01-01','2nd','',0,0,1,'','PRM392'),(153,'Course slides (.pptx)','','','1900-01-01','','',0,0,0,'Bản mềm, tài liệu xây dựng bởi FU','PRM392'),(154,'Software Modeling and Design: UML, Use Cases, Patterns, and Software Architectures','H. Gomaa','Cambridge University Press','2011-01-01','1st Edition','9780521764148',1,1,0,'Books24x7, https://library.books24x7.com/toc.aspx?bookid=41618','SWD392'),(155,'UML Distilled: Applying the Standard Object Modeling Language','Fowler','Addison-Wesley','2004-01-01','3rd edition','978-0321193681',0,1,0,'','SWD392'),(156,'https://gmu.blackboard.com/webct/','','','1900-01-01','','',0,0,1,'','SWD392'),(157,'Giáo trình Triết học Mác-Lênin, dùng cho sinh viên đại học hệ không chuyên lý luận chính trị Philosophy of Marxism – Leninism textbook for non-politics majored students','Bộ Giáo dục và Đào tạoMinistry of Education and Training','Nhà xuất bản Chính trị quốc gia sự thậtTruth National Political Publishing House','2021-01-01','1','',1,0,1,'','MLN111'),(158,'Giáo trình Triết học Mác-Lênin, dùng cho sinh viên đại học hệ chuyên lý luận chính trị Philosophy of Marxism – Leninism textbook for politics majored students','Bộ Giáo dục và Đào tạoMinistry of Education and Training','Nhà xuất bản Chính trị quốc gia sự thậtTruth National Political Publishing House','2021-01-01','1','',0,1,0,'','MLN111'),(159,'Giáo trình Triết học Mác-Lênin Philosophy of Marxism – Leninism textbook','Bộ Giáo dục và Đào tạoMinistry of Education and Training','Nhà xuất bản Chính trị quốc giaNational Political Publishing House','2010-01-01','','',0,1,0,'','MLN111'),(160,'C. Mác và Ph. Ăngghen: Toàn tập Marx/Engels Collected Works','C. Mác và Ph. Ăngghen','Nhà xuất bản Chính trị quốc giaNational Political Publishing House','1995-01-01','1','',0,1,0,'','MLN111'),(161,'V.I. Lênnin: Toàn tập Selected works [of] V. I. Lenin','V.I. Lênnin','Nhà xuất bản Chính trị quốc giaNational Political Publishing House','2005-01-01','1','',0,1,0,'','MLN111'),(162,'Giáo trình Triết học Mác-Lênin Philosophy of Marxism – Leninism textbook','Bộ Giáo dục và Đào tạoMinistry of Education and Training','Nhà xuất bản Chính trị quốc giaNational Political Publishing House','1999-01-01','','',0,1,0,'','MLN111'),(163,'Giáo trình Kinh tế chính trị Mác-Lênin, dùng cho sinh viên đại học hệ không chuyên lý luận chính trị Political economics of Marxism – Leninism textbook for non-politics majored students','Bộ Giáo dục và Đào tạoMinistry of Education and Training','Nhà xuất bản Chính trị quốc gia sự thậtTruth National Political Publishing House','2021-01-01','1','',0,0,0,'Giáo trình có thể download bản mềm tại:(Textbook can be downloaded at)https://moet.gov.vn/van-ban/vbdh/Pages/chi-tiet-van-ban.aspx?ItemID=2729#divShowDialogDownload. Thư viện chỉ đặt mua số lượng ít.','MLN122'),(164,'Giáo trình Kinh tế chính trị Mác - Leenin, dùng cho sinh viên đại học hệ chuyên lý luận chính trị Political economics of Marxism – Leninism textbook for politics majored students','Bộ Giáo dục và Đào tạoMinistry of Education and Training','Nhà xuất bản Chính trị quốc gia sự thậtTruth National Political Publishing House','2021-01-01','1','',0,0,0,'','MLN122'),(165,'Văn kiện Đại hội Đảng toàn quốc lần thứ VI, VII, VIII, IX, X, XI, XII, XIII Political report of the 6th, 7th, 8th, 9th, 10th, 11th, 12th, 13th Party Congress The Communist Party of Vietnam The Communist Party of Vietnam','Đảng Cộng sản Việt Nam','Nhà xuất bản Chính trị quốc gia National Political Publishing House','1900-01-01','1','',0,0,0,'','MLN122'),(166,'C. Mác và Ph. Ăngghen: Toàn tập, t4,8,12,13, 18 ,20, 23, 25, 46 Marx/Engels Collected Works, Vol. 4, 8, 12,13, 18 ,20, 23, 25, 46','C. Mác và Ph. Ăngghen','Nhà xuất bản Chính trị quốc giaNational Political Publishing House','2002-01-01','1','',0,0,0,'','MLN122'),(167,'V.I. Lênnin: Toàn tập, t3, 27, 45 V. I. Lenin, Collected Works, Vol. 3, 27, 45','V.I. Lênnin','Nhà xuất bản Chính trị quốc giaNational Political Publishing House','2005-01-01','','',0,0,0,'','MLN122'),(168,'https://learner.coursera.help/hc/en-us/articles/208280036-Coursera-Code-of-Conduct','','Coursera','1900-01-01','','',0,0,1,'','PMG202c'),(169,'https://www.coursera.org/learn/project-management-foundations','','Coursera','1900-01-01','','',1,0,1,'MOOC 1: Foundations of Project Management','PMG202c'),(170,'https://www.coursera.org/learn/project-initiation-google','','Coursera','1900-01-01','','',1,0,1,'MOOC 2: Project Initiation: Starting a Successful Project','PMG202c'),(171,'https://www.coursera.org/learn/project-planning-google','','Coursera','1900-01-01','','',1,0,1,'MOOC 3: Project Planning: Putting It All Together','PMG202c'),(172,'https://www.coursera.org/learn/project-execution-google','','Coursera','1900-01-01','','',1,0,1,'MOOC 4: Project Execution: Running the Project','PMG202c'),(173,'https://www.coursera.org/learn/agile-project-management','','Coursera','1900-01-01','','',1,0,1,'MOOC 5: Agile Project Management','PMG202c'),(174,'https://www.coursera.org/learn/applying-project-management','','Coursera','1900-01-01','','',1,0,1,'MOOC 6: Capstone: Applying Project Management in the Real World','PMG202c'),(175,'https://www.coursera.org/professional-certificates/google-project-management','','Coursera','1900-01-01','','',1,0,1,'SPEC: Google Project Management: Professional Certificate','PMG202c'),(176,'The Project Management Body of Knowledge (PMBOK Guide)','','','1900-01-01','5th','',0,0,0,'PMI','PMG202c'),(177,'ITPM: Information Technology Project Management','Kathy Schwalbe','Cengage Learning','1900-01-01','8th','',0,0,0,'','PMG202c'),(178,'The Scrum Guide (https://scrum.org)','','','1900-01-01','','',0,0,1,'','PMG202c'),(179,'https://learner.coursera.help/hc/en-us/articles/208280036-Coursera-Code-of-Conduct','','Coursera','1900-01-01','','',0,0,1,'','WDU203c'),(180,'https://www.coursera.org/learn/introtoux-principles-and-processes','','','1900-01-01','','',1,0,1,'MOOC 1: Introduction to User Experience Principles and Processes','WDU203c'),(181,'https://www.coursera.org/learn/understanding-user-needs','','','1900-01-01','','',1,0,1,'MOOC 2: Understanding User Needs','WDU203c'),(182,'https://www.coursera.org/learn/evaluating-designs-with-users','','','1900-01-01','','',1,0,1,'MOOC 3: Evaluating Designs with Users','WDU203c'),(183,'https://www.coursera.org/learn/ux-design-concept-wireframe','','','1900-01-01','','',1,0,1,'MOOC 4: UX Design: From Concept to Prototype','WDU203c'),(184,'https://www.coursera.org/learn/ux-research-at-scale','','','1900-01-01','','',1,0,1,'MOOC 5: UX Research at Scale: Surveys, Analytics, Online Testing','WDU203c'),(185,'https://www.coursera.org/learn/user-experience-capstone','','','1900-01-01','','',1,0,1,'MOOC 6: UX (User Experience) Capstone','WDU203c'),(186,'https://www.coursera.org/specializations/michiganux','','','1900-01-01','','',1,0,1,'SPEC: User Experience Research and Design','WDU203c'),(187,'Giáo trình Tư tưởng Hồ Chí Minh, dùng cho sinh viên bậc đại học hệ không chuyên ngành lý luận chính trị<br>Ho Chi Minh ideology textbook for non-politics majored students','Bộ Giáo dục và Đào tạoMinistry of Education and Training','Nhà xuất bản Chính trị quốc gia sự thậtTruth National Political Publishing House','2021-01-01','1','',1,0,1,'Giáo trình có thể download bản mềm tại:(Textbook can be downloaded at)https://moet.gov.vn/van-ban/vbdh/Pages/chi-tiet-van-ban.aspx?ItemID=2729#divShowDialogDownload. Thư viện chỉ đặt mua bản cứng số lượng ít.','HCM202'),(188,'Giáo trình Tư tưởng Hồ Chí Minh, dùng cho sinh viên bậc đại học hệ chuyên ngành lý luận chính trị<br>Ho Chi Minh ideology textbook for politics majored students','Bộ Giáo dục và Đào tạoMinistry of Education and Training','Nhà xuất bản Chính trị quốc gia sự thậtTruth National Political Publishing House','2021-01-01','1','',0,1,0,'','HCM202'),(189,'Hồ Chí Minh toàn tập<br>The Selected Works of Ho Chi Minh<br> Ho Chi Minh','Hồ Chí Minh','Nhà xuất bản Chính trị quốc gia','2021-01-01','1','',0,0,1,'','HCM202'),(190,'Hồ Chí Minh a life','William J. Duiker','Nhà xuất bản Hyperion, New York Hyperion Publishing, New York','2000-01-01','1','',0,0,1,'','HCM202'),(191,'Giáo trình Chủ nghĩa xã hội khoa học, dùng cho sinh viên đại học hệ không chuyên lý luận chính trị<br>Scientific socialism textbook for non-politics majored students','Bộ Giáo dục và Đào tạoMinistry of Education and Training','Nhà xuất bản Chính trị quốc gia sự thậtTruth National Political Publishing House','2021-01-01','1','',1,0,1,'','MLN131'),(192,'Giáo trình Chủ nghĩa xã hội khoa học, dùng cho sinh viên đại học hệ chuyên lý luận chính trị<br>Scientific socialism textbook for politics majored students','Bộ Giáo dục và Đào tạoMinistry of Education and Training','Nhà xuất bản Chính trị quốc gia sự thậtTruth National Political Publishing House','2021-01-01','1','',0,1,0,'','MLN131'),(193,'Giáo trình Chủ nghĩa xã hội khoa học<br>Scientific socialism textbook','Bộ Giáo dục và Đào tạoMinistry of Education and Training','Vietnam Education Publishing House','2006-01-01','','',0,1,0,'','MLN131'),(194,'C. Mác và Ph. Ăngghen: Toàn tập<br>Marx/Engels Collected Works','C. Mác và Ph. Ăngghen','Nhà xuất bản Chính trị quốc giaNational Political Publishing House','2004-01-01','1','',0,1,0,'','MLN131'),(195,'V.I. Lênnin: Toàn tập<br>Selected works [of] V. I. Lenin','V.I. Lênnin','Nhà xuất bản Chính trị quốc giaNational Political Publishing House','2005-01-01','1','',0,1,0,'','MLN131'),(196,'The Student’s Guide of Capstone Project (CPro_StudentGuide_IS_2021Fall)','','','1900-01-01','','',1,0,0,'Bản mềm, tài liệu xây dựng bởi FU','SEP490'),(197,'Graduated Regulation (Quy che tot nghiep)','','','1900-01-01','','',1,0,0,'Bản mềm, tài liệu xây dựng bởi FU','SEP490'),(198,'Project Templates (on CMS)','','','1900-01-01','','',1,0,0,'Bản mềm, tài liệu xây dựng bởi FU','SEP490'),(199,'Giáo trình Lịch sử Đảng Cộng sản Việt Nam (Dành cho sinh viên đại học, cao đẳng khối không chuyên ngành Mác – Lênin, tư tưởng Hồ Chí Minh)<br>History of CPV textbook for students whose major is not Marxism-Leninism and Ho Chi Minh ideology','Bộ Giáo dục và Đào tạoMinistry of Education and Training','Nhà xuất bản Chính trị quốc gia sự thậtTruth National Political Publishing House','2021-01-01','1','',1,0,1,'Giáo trình có thể download bản mềm tại:(Textbook can be downloaded at)https://moet.gov.vn/van-ban/vbdh/Pages/chi-tiet-van-ban.aspx?ItemID=2729#divShowDialogDownload. Thư viện chỉ đặt mua bản cứng số lượng ít.','VNR202'),(200,'Giáo trình Lịch sử Đảng Cộng sản Việt Nam (Dành cho sinh viên đại học, cao đẳng chuyên ngành Mác – Lênin, tư tưởng Hồ Chí Minh)<br>History of CPV textbook for students whose major is Marxism-Leninism and Ho Chi Minh ideology','Bộ Giáo dục và Đào tạoMinistry of Education and Training','Nhà xuất bản Chính trị quốc gia sự thậtTruth National Political Publishing House','2021-01-01','1','',0,1,0,'','VNR202'),(201,'Hồ Chí Minh toàn tập, tập 1 đến tập 15<br>The Selected Works of Ho Chi Minh, Vol. 1 to 5','Hồ Chí Minh','Nhà xuất bản Chính trị quốc gia National Political Publishing House','2011-01-01','1','',0,0,1,'','VNR202'),(202,'Lịch sử Đảng Cộng sản Việt Nam, tập 1<br>History of the Communist Party of Vietnam, Vol. 1','Institute of History','Nhà xuất bản Chính trị quốc gia National Political Publishing House','2018-01-01','1','',0,0,1,'','VNR202'),(203,'Chiến tranh cách mạng Việt Nam 1945-1975, thắng lợi và bài học<br>Vietnamese Revolutionary War, 1945–1975: Victory and Lessons','Ban chỉ đạo tổng kết chiến tranh trực thuộc Bộ chính trị','Nhà xuất bản Chính trị quốc gia National Political Publishing House','2008-01-01','1','',0,0,1,'','VNR202'),(204,'Báo cáo tổng kết một số vấn đề lý luận thực tiễn qua 30 năm đổi mới<br>The final report on the summary of some theoretical-practical issues over the past 30 years of innovation','Đảng Cộng sản Việt Nam, Ban chấp hành Trung ương, Ban chỉ đạo tổng kết','Nhà xuất bản Chính trị quốc gia National Political Publishing House','2015-01-01','1','',0,0,1,'','VNR202'),(205,'Văn kiện Đại hội đại biểu toàn quốc lần thứ XII<br>Political report of the 13th Party Congress','Đảng Cộng sản Việt Nam','Nhà xuất bản Chính trị quốc gia National Political Publishing House','2016-01-01','1','',0,0,1,'','VNR202'),(206,'Introductory documents aout FPT Group and FPT University','','','1900-01-01','','',0,0,0,'','OTP101'),(207,'Hồi ký: Những điều đọng lại qua hai cuộc chiến tranh','','','1900-01-01','','',0,0,0,'','OTP101'),(208,'Hồi ký: Tổng hành dinh','','','1900-01-01','','',0,0,0,'','OTP101'),(209,'Computer Organization and Architecture: Design for Performance','William Stallings','Prentice Hall','2012-01-01','9th (or 10th)','978-0132936330 (9th), 978-0134101613 (10th)',1,1,0,'','CEA201'),(210,'Computer architecture : A quantitative approach','John L. Hennessy, David A Patterson','Morgan Kaufmann','1900-01-01','','',0,1,0,'','CEA201'),(211,'http://williamstallings.com/ComputerOrganization/COA9e-Instructor/','','','1900-01-01','','',0,0,1,'','CEA201'),(212,'http://williamstallings.com/ComputerOrganization/COA9e-student/','','','1900-01-01','','',0,0,1,'','CEA201'),(213,'PowerPoint Lecture Slides','','','1900-01-01','','',0,0,0,'','CEA201'),(214,'Instructor Solutions Manual','','','1900-01-01','','',0,0,0,'','CEA201'),(215,'Instructor Project Manual','','','1900-01-01','','',0,0,0,'','CEA201'),(216,'Test banks','','','1900-01-01','','',0,0,0,'','CEA201'),(217,'Foundations Of Computer Science','Behrouz Forouzan','Cengage','2017-01-01','4th','978-1-4737-5104-0',1,1,0,'','CSI104'),(218,'Fundamentals of Information Systems Security','','Jones & Bartlett','2016-01-01','3rd','',0,1,0,'','CSI104'),(219,'Computer architecture : A quantitative approach','John L. Hennessy, David A Patterson','Morgan Kaufmann','2011-01-01','5th','',0,1,0,'','CSI104'),(220,'Calculus 1','','','1900-01-01','','',1,0,1,'https://openstax.org/details/books/calculus-volume-1','MAE101'),(221,'Calculus 2','','','1900-01-01','','',1,0,1,'https://openstax.org/details/books/calculus-volume-2','MAE101'),(222,'powerpoint in CD + Powerpoint prepared by previous lecturers (PP).','','','1900-01-01','','',0,0,0,'','MAE101'),(223,'Student Video Skillbuilder in CD (Video).','','','1900-01-01','','',0,0,0,'','MAE101'),(224,'Animation in CD (Animation).','','','1900-01-01','','',0,0,0,'','MAE101'),(225,'Computerized tools (for example Maxima http://maxima.sourceforge.net/) (CT)','','','1900-01-01','','',0,0,0,'','MAE101'),(226,'Essential Calculus','James Stewart','Thomson Brooks/Cole','1900-01-01','','978-0-495-10860-3',0,0,0,'','MAE101'),(227,'Calculus for engineers','Donald Trim','Prentice Hall,','1900-01-01','','0-13-085603-7',0,0,0,'','MAE101'),(228,'Calculus','Stanley I. Grossman','','1900-01-01','','0-03-096420-2',0,0,0,'','MAE101'),(229,'Linear Algebra with applications','W.Keith Nicholson,','Mc Graw Hill Education','1900-01-01','','987-1-259-07299-4.',0,1,0,'','MAE101'),(230,'Linear Algebra with Applications','W. Keith Nicholson','Lyryx Online Resources','2021-01-01','2021-A','',1,0,1,'https://lyryx.com/linear-algebra-applications/','MAE101'),(231,'Foundations of Programming Using C','Evan Weaver','2003','1900-01-01','','',1,1,0,'','PRF192'),(232,'BTP100: http://cs.senecac.on.ca/~btp100/pages/welco.html','','','1900-01-01','','',0,0,1,'','PRF192'),(233,'FU Presentation Powerpoints (.zip)','','','1900-01-01','','',0,0,0,'','PRF192'),(234,'FU CMS at http://cms.fpt.edu.vn .','','','1900-01-01','','',0,0,1,'','PRF192'),(235,'https://www.coursera.org/specializations/academic-skills','','Coursera','1900-01-01','','',1,0,1,'SPEC: Academic Skills for University Success Specialization','SSL101c'),(236,'https://www.coursera.org/learn/digital-literacy','','Coursera','1900-01-01','','',1,0,1,'MOOC 01: Introduction to Information & Digital Literacy for University Success','SSL101c'),(237,'https://www.coursera.org/learn/problem-solving-skills','','Coursera','1900-01-01','','',1,0,1,'MOOC 02: Introduction to Problem-Solving Skill for University Success','SSL101c'),(238,'https://www.coursera.org/learn/critical-thinking-skills','','Coursera','1900-01-01','','',1,0,1,'MOOC 03: Critical Thinking Skills for University Success','SSL101c'),(239,'https://www.coursera.org/learn/communication-skills','','Coursera','1900-01-01','','',1,0,1,'MOOC 04: Communication Skills for University Success','SSL101c'),(240,'https://www.coursera.org/learn/academic-skills-project','','Coursera','1900-01-01','','',1,0,1,'MOOC 05: Academic Skills for University Success: Capstone','SSL101c'),(241,'Discrete Mathematics and its applications','Kenneth Rosen','Mc.Graw Hill, IE','2007-01-01','Ed.7 (or 6)','978-0073383095',1,1,0,'','MAD101'),(242,'Teaching Suggestion and Applications of Discrete Mathematics for ST1 (TS)','','','1900-01-01','','',0,0,0,'','MAD101'),(243,'Testbank for ST1','','','1900-01-01','','',0,0,0,'','MAD101'),(244,'Powerpoint image in CD + Powerpoint prepared by previous lecturers (PP)','','','1900-01-01','','',0,0,0,'','MAD101'),(245,'Computerized tools (for example C programming tools, Maxima http://maxima.sourceforge.net/) (CT)','','','1900-01-01','','',0,0,0,'','MAD101'),(246,'Adam Drozdek. Data structure and Algorithms in Java. 3rd Edition.','','','1900-01-01','','',0,1,0,'','MAD101'),(247,'https://www.coursera.org/specializations/computer-communications','','Coursera','1900-01-01','','',1,0,1,'SPEC: Computer Communications Specialization','NWC203c'),(248,'https://learner.coursera.help/hc/en-us/articles/208280036-Coursera-Code-of-Conduct','','Coursera','1900-01-01','','',0,0,1,'Help Articles','NWC203c'),(249,'https://www.coursera.org/learn/fundamentals-network-communications?specialization=computer-communications','','Coursera','1900-01-01','','',1,0,1,'MOOC 1: Fundamentals of Network Communication','NWC203c'),(250,'https://www.coursera.org/learn/peer-to-peer-protocols-local-area-networks?specialization=computer-communications','','Coursera','1900-01-01','','',1,0,1,'MOOC 2: Peer-to-Peer Protocols and Local Area Networks','NWC203c'),(251,'https://www.coursera.org/learn/packet-switching-networks-algorithms?specialization=computer-communications','','Coursera','1900-01-01','','',1,0,1,'MOOC 3: Packet Switching Networks and Algorithms','NWC203c'),(252,'https://www.coursera.org/learn/tcp-ip-advanced?specialization=computer-communications','','Coursera','1900-01-01','','',1,0,1,'MOOC 4: TCP/IP and Advanced Topics','NWC203c'),(253,'Modern Operating Systems (4th edition or 3rd or 2nd)','Andrew S. Tanenbaum','Pearson','2014-01-01','4th or 3rd or 2nd','9781292061429 or 9780133591620 (4th Edition)',1,1,0,'','OSG202'),(254,'Course slides (.pptx)','','','1900-01-01','','',0,0,0,'','OSG202'),(255,'Understanding operating systems','Ann McIver McHoes and Ida M. Flynn','Cengage Learning','2008-01-01','8th','978-1305674257',0,1,0,'','OSG202'),(256,'http://courses.knox.edu/cs226/','','','1900-01-01','','',0,0,1,'','OSG202'),(257,'Connecting with Computer Science','Creg Anderson, David Ferrro, Robert Hilbon','Thomson course Technology','2010-01-01','2nd Edition','978-1439080351',0,1,0,'','OSG202'),(258,'Java 8 Specification https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-1.html#jvms-1.1','','','1900-01-01','','',0,0,1,'','PRO192'),(259,'Core Java, Volum 1: Fundamentals','Cay Horstmann','Pearson','2018-01-01','11th','978-0135166307',0,1,0,'','PRO192'),(260,'Core Java, Volum 2: Advanced features','Cay Horstmann','Pearson','2019-01-01','11th','978-0135166314',0,1,0,'','PRO192'),(261,'Object-Oriented Programming using Java (website (offline): Học liệu do FU biên soạn)','','','1900-01-01','','',1,0,0,'','PRO192'),(262,'Problem Solving in Teams and Groups','Cameron W. Piercy','University of Kansas Libraries','2019-01-01','','',1,0,1,'https://open.umn.edu/opentextbooks/textbooks/problem-solving-in-teams-and-groups','SSG104'),(263,'College Success','N/A','Lumen Learning courseware','1900-01-01','','',1,0,1,'https://courses.lumenlearning.com/lumencollegesuccessxtraining2/ or https://courses.lumenlearning.com/lumencollegesuccessxtraining/','SSG104'),(264,'Business communication for success','N/A','University of Minnesota i','2015-01-01','2th','',1,0,1,'https://www.oercommons.org/courses/basics-of-written-business-communication/view','SSG104'),(265,'Working in group 7th ed.','','Pearson','2017-01-01','','',0,1,0,'','SSG104'),(266,'Business communication 7th ed.','','Thomson-South Western','2008-01-01','','',0,1,0,'','SSG104'),(267,'PowerPoint Slides','','','1900-01-01','','',0,0,0,'','SSG104'),(268,'Michaelt T. Goodrich, Roberto Tamassia, Michael H. Goldwasser: Data Structures and Algorithms in Java, 6th Edition, 2014 (ebook) Link to the book: http://coltech.vnu.edu.vn/~sonpb/DSA/Data%20Structures%20and%20Algorithms%20in%20Java,%206th%20Edition,%202014.pdf','Michaelt T. Goodrich, Roberto Tamassia, Michael H. Goldwasser','Wiley','2014-01-01','6th','978-1-118-77133-4',1,0,1,'','CSD201'),(269,'FU slides (ppt)','','','1900-01-01','','',0,0,0,'','CSD201'),(270,'FU exercises (pdf)','','','1900-01-01','','',0,0,0,'','CSD201'),(271,'Code files for students (java files)','','','1900-01-01','','',0,0,0,'','CSD201'),(272,'FU CMS at http://cms.fpt.edu.vn.','','','1900-01-01','','',0,0,1,'','CSD201'),(273,'First Course in Database Systems','Jeffrey D. Ullman, Jennifer Widom','Pearson','2008-01-01','Third edition','9781292025827 or 9780136006374',1,1,0,'','DBI202'),(274,'Database Management System','Raghu ramakrishnan','Mc Graw-Hill','1900-01-01','Third edition','978-8131769591',0,1,0,'','DBI202'),(275,'Database Management System (DBMS): A Practical Approach','Rajiv Chopra','SChand Publications','1900-01-01','','9788121932455',0,1,0,'','DBI202'),(276,'Course slides (.pptx)','','','1900-01-01','','',0,0,0,'','DBI202'),(277,'Labs & assignment','','','1900-01-01','','',0,0,0,'','DBI202'),(278,'Dekiru Nihongo - Beginner Main textbook','できる日本語教材開発プロジェクト','','1900-01-01','','',1,1,0,'Giáo trình Dekiru quyển đỏ nhà trường đã có bản quyền','JPD113'),(279,'Dekiru Nihongo - Beginner Grammar Workbook Vocabulary Workbook','できる日本語教材開発プロジェクト','','1900-01-01','','',0,0,0,'','JPD113'),(280,'Kana Nyuumon (Nhập môn Kana)','Japan Foundation','','1900-01-01','','',0,0,0,'','JPD113'),(281,'Kanji Tamago','できる日本語教材開発プロジェクト','','1900-01-01','','',0,1,0,'','JPD113'),(282,'Slide bài giảng do giảng viên cung cấp','','','1900-01-01','','',0,0,0,'','JPD113'),(283,'Lab Room Regulations (For Students)','','','1900-01-01','','',1,0,0,'Bản mềm do FU biên soạn','LAB211'),(284,'Mentor guide For Lab (For Mentors only)','','','1900-01-01','','',1,0,0,'Bản mềm do FU biên soạn','LAB211'),(285,'Evaluation Templates (For Mentors only)','','','1900-01-01','','',1,0,0,'Bản mềm do FU biên soạn','LAB211'),(286,'https://learner.coursera.help/hc/en-us/articles/208280036-Coursera-Code-of-Conduct','','Coursera','1900-01-01','','',0,0,1,'','WED201c'),(287,'https://www.coursera.org/learn/html/home/welcome','','Coursera','1900-01-01','','',1,0,1,'MOOC 1: Introduction to HTML5','WED201c'),(288,'https://www.coursera.org/learn/introcss/home/welcome','','Coursera','1900-01-01','','',1,0,1,'MOOC 2: Introduction to CSS3','WED201c'),(289,'https://www.coursera.org/learn/javascript/home/welcome','','Coursera','1900-01-01','','',1,0,1,'MOOC 3: Interactivity with JavaScript','WED201c'),(290,'https://www.coursera.org/learn/responsivedesign/home/welcome','','Coursera','1900-01-01','','',1,0,1,'MOOC 4: Advanced Styling with Responsive Design','WED201c'),(291,'https://www.coursera.org/learn/web-design-project/home/welcome','','Coursera','1900-01-01','','',1,0,1,'MOOC 5: Web Design for Everybody Capstone','WED201c'),(292,'https://www.coursera.org/specializations/web-design; University of Michigan','','Coursera','1900-01-01','','',1,0,1,'SPEC: Web Design for Everybody: Basics of Web Development & Coding','WED201c'),(293,'Course from Edx: https://learning.edx.org/course/course-v1:CurtinX+IOT1x+2T2018/home','','','1900-01-01','','',1,0,1,'','IOT102'),(294,'Course from Edx: https://learning.edx.org/course/course-v1:CurtinX+IOT2x+2T2018/home','','','1900-01-01','','',1,0,1,'','IOT102'),(295,'Free Hardware and IoT Ebooks_ OReilly Media','','','1900-01-01','','',0,0,0,'','IOT102'),(296,'Introduction to Arduino A piece of cake! by Alan G. Smith September 30, 2011 free at: http://www.introtoarduino.com','','','1900-01-01','','',0,0,1,'','IOT102'),(297,'Documents at https://www.arduino.cc/','','','1900-01-01','','',0,0,1,'','IOT102'),(298,'Instructables.com - 20 Unbelievable Arduino Projects','','','1900-01-01','','',0,0,1,'','IOT102'),(299,'Slides','','','1900-01-01','','',1,0,0,'','IOT102'),(300,'Tutorials','','','1900-01-01','','',1,0,0,'','IOT102'),(301,'Video','','','1900-01-01','','',1,0,0,'','IOT102'),(302,'Electronics component list','','','1900-01-01','','',1,0,0,'','IOT102'),(303,'『できる日本語　初級　本冊』','嶋田和子','アルク','2011-01-01','','ISBN-10 : 4757419775ISBN-13 : 978-4757419773',0,1,0,'Giáo trình Dekiru quyển đỏ nhà trường đã có bản quyền','JPD123'),(304,'『わたしの文法ノート 初級 (できる日本語)』','嶋田和子','凡人社','2011-01-01','','ISBN-10 : 489358801XISBN-13 : 978-4893588012',0,1,0,'','JPD123'),(305,'『わたしのことばノート 初級 (できる日本語)』','嶋田 和子','凡人社','2012-01-01','','ISBN-10 : 4893588117ISBN-13 : 978-4893588111',0,1,0,'','JPD123'),(306,'漢字たまご 初級','有山優樹 (著), 落合知春 (著), 立原雅子 (著), 林英子 (著), 山口知才子 (著), 酒井弘美 (イラスト), 嶋田和子 (監修)','凡人社','2012-01-01','','ISBN-10 : 4893588311ISBN-13 : 978-4893588319',0,1,0,'','JPD123'),(307,'Slide bài giảng do giảng viên cung cấp','','','1900-01-01','','',0,0,0,'','JPD123'),(308,'Main materials: 1) Montgomery D.C. & Runger G.C., Applied Statistics and Probability for Engineers','John Wiley & Sons.','Wiley','2006-01-01','4th (or 5th or 6th) ed.,','9781119718871',1,1,0,'','MAS291'),(309,'Powerpoint slides (PP).','','','1900-01-01','','',0,0,0,'','MAS291'),(310,'Computerized tools (for example Excel and DDXL add-ons) (CT)','','','1900-01-01','','',0,0,0,'','MAS291'),(311,'Elementary Statistics Using Excel, 3/E,','Mario F. Triola','Addison-Wesley','2002-01-01','3rd','321365135',0,1,0,'','MAS291'),(312,'Text book 1: Professional Java® forWebApplications Link: http://library.books24x7.com/toc.aspx?bookid=62587','Nicholas S. Williams','Wrox','1900-01-01','1st edition','978-1118656464',1,0,1,'','PRJ301'),(313,'Article 1: http://docs.oracle.com/javase/tutorial/JDBC','','','1900-01-01','','',0,0,1,'','PRJ301'),(314,'Article 2: https://docs.oracle.com/cd/B14099_19/web.1012/b14017/filters.htm','','','1900-01-01','','',0,0,1,'','PRJ301'),(315,'https://learner.coursera.help/hc/en-us/articles/208280036-Coursera-Code-of-Conduct','','Coursera','1900-01-01','','',0,0,1,'','SWE201c'),(316,'https://www.coursera.org/learn/software-processes','','Coursera','1900-01-01','','',1,0,1,'MOOC 01: Software Development Processes and Methodologies','SWE201c'),(317,'https://www.coursera.org/learn/agile-software-development','','Coursera','1900-01-01','','',1,0,1,'MOOC 02: Agile Software Development','SWE201c'),(318,'https://www.coursera.org/learn/lean-software-development','','Coursera','1900-01-01','','',1,0,1,'MOOC 03: Lean Software Development','SWE201c'),(319,'https://www.coursera.org/learn/engineering-practices-secure-software-quality','','Coursera','1900-01-01','','',1,0,1,'MOOC 04: Engineering Practices for Building Quality Software','SWE201c'),(320,'https://www.coursera.org/specializations/software-development-lifecycle','','Coursera','1900-01-01','','',1,0,1,'SPEC: Software Development Lifecycle','SWE201c'),(321,'https://learner.coursera.help/hc/en-us/articles/208280036-Coursera-Code-of-Conduct','','Coursera','1900-01-01','','',0,0,1,'','ITE302c'),(322,'https://www.coursera.org/learn/promote-ethical-data-driven-technologies','','Coursera','1900-01-01','','',1,0,1,'MOOC 1: Promote the Ethical Use of Data-Driven Technologies','ITE302c'),(323,'https://www.coursera.org/learn/ethical-frameworks-action','','Coursera','1900-01-01','','',1,0,1,'MOOC 2: Turn Ethical Frameworks into Actionable Steps','ITE302c'),(324,'https://www.coursera.org/learn/detect-mitigate-ethical-risks','','Coursera','1900-01-01','','',1,0,1,'MOOC 3: Detect and Mitigate Ethical Risks','ITE302c'),(325,'https://www.coursera.org/learn/ethical-communication-data-driven-technologies','','Coursera','1900-01-01','','',1,0,1,'MOOC 4: Communicate Effectively about Ethical Challenges in Data-Driven Technologies','ITE302c'),(326,'https://www.coursera.org/learn/ethical-data-driven-technology-leader','','Coursera','1900-01-01','','',1,0,1,'MOOC 5: Create and Lead an Ethical Data-Driven Organization','ITE302c'),(327,'https://www.coursera.org/learn/preparing-for-your-certnexus-certification-exam','','Coursera','1900-01-01','','',1,0,1,'MOOC 6: Preparing for Your CertNexus Certification Exam','ITE302c'),(328,'https://www.coursera.org/specializations/certified-ethical-emerging-technologist','','Coursera','1900-01-01','','',1,0,1,'SPEC: CertNexus Certified Ethical Emerging Technologist Professional Certificate','ITE302c'),(329,'Guides & Templates (for Students & Teachers)','','','1900-01-01','','',1,0,0,'Bản mềm do FU biên soạn','SWP391'),(330,'Learn HTML and CSS with W3Schools (https://www.w3schools.com/)','','','1900-01-01','','',0,0,1,'','SWP391'),(331,'Murach\'s Java Servlets and JSP','Joel Murach, Michael Urban','Mike Murach & Associates','2014-01-01','3rd Edition','978-1890774783',0,1,0,'','SWP391'),(332,'SQL for MySQL Developers A Comprehensive Tutorial and Reference','Rick F. van der Lans','Addison-Wesley Professional','2007-01-01','1st edition','978-0131497351',0,1,0,'','SWP391'),(333,'Software Requirements','Karl E. Wiegers','Microsoft Press','1900-01-01','Third Edition','978-0-7356-7966-5',1,1,0,'','SWR302'),(334,'More About Software Requirements: Thorny Issues and Practical Advice','Karl E. Wiegers','Microsoft Press','1900-01-01','','978-0-7356-2267-8',0,1,0,'','SWR302'),(335,'The Software Requirements Memory Jogger: A Pocket Guide to Help Software And Business Teams Develop and Manage Requirements','Ellen Gottesdiener','GOAL/QPC','1900-01-01','','978-1-57681-060-6',0,1,0,'','SWR302'),(336,'Requirements Engineering: Secure Software Specifications Specialization','','Coursera','1900-01-01','','',0,0,1,'https://www.coursera.org/specializations/requirements-engineering-secure-software','SWR302'),(337,'Foundations of Software Testing: ISTQB Certification','Dorothy Graham, Erik van Veenendaal, Isabel Evans,Rex Black','Cengage Learning Business Press','2008-01-01','','978-1-84480-355-2',1,0,1,'Books24x7, https://library.books24x7.com/toc.aspx?bookid=26179','SWT301'),(338,'https://cmshn.fpt.edu.vn/','','','1900-01-01','','',0,0,1,'','SWT301'),(339,'Foundations of software testing istqb certification','','','1900-01-01','','',0,0,0,'','SWT301'),(340,'Software Quality Engineering: Testing, Quality assurance, and Quantifiable Improvement. Jeff Tian','','','1900-01-01','','',0,0,0,'','SWT301'),(341,'Course Software Testing and Quality Assurance by Tian in http://engr.smu.edu/~tian/class/7314.06f/syl.html (availble in FU library)','','','1900-01-01','','',0,0,1,'','SWT301'),(342,'Ian Sommerville. Software Engineering 8e. Part 5: Verification and Validation.','','','1900-01-01','','',0,0,0,'','SWT301'),(343,'Towards Zero Defect Software: The Cleanroom Approach. Mario A. Nascimento, Mario A. Nascimento, Murat M. Tanik, Murat M. Tanik. 1994. Available at http://www.cnptia.embrapa.br/~mario/Papers/tr-94-cse-31.ps.gz','','','1900-01-01','','',0,0,0,'','SWT301'),(344,'Computer Software Validation. Alan Muirhead. News & Views, March 2000. Available at http://www.stcpmc.org/archive/archive/n&v/feat0300.html','','','1900-01-01','','',0,0,1,'','SWT301'),(345,'Agile Testing: A Practical Guide for Testers and Agile Teams','Lisa Crispin,Janet Gregory','','1900-01-01','','978-0321534460',0,1,0,'','SWT301'),(346,'https://www.coursera.org/specializations/academic-english','','Coursera','1900-01-01','','',1,0,1,'SPEC: Academic English: Writing Specialization','ENW492c'),(347,'https://www.coursera.org/learn/grammar-punctuation','','Coursera','1900-01-01','','',1,0,1,'MOOC 01: Grammar and Punctuation','ENW492c'),(348,'https://www.coursera.org/learn/getting-started-with-essay-writing','','Coursera','1900-01-01','','',1,0,1,'MOOC 02: Getting Started with Essay Writing','ENW492c'),(349,'https://www.coursera.org/learn/advanced-writing','','Coursera','1900-01-01','','',1,0,1,'MOOC 03: Advanced Writing','ENW492c'),(350,'https://www.coursera.org/learn/introduction-to-research-for-essay-writing','','Coursera','1900-01-01','','',1,0,1,'MOOC 04: Introduction to Research for Essay Writing','ENW492c'),(351,'https://www.coursera.org/learn/academic-writing-capstone','','Coursera','1900-01-01','','',1,1,1,'MOOC 05: Project: Writing a Research Paper','ENW492c'),(352,'Hướng dẫn quản lý thực tập (07.04PL - HDCV Quan ly thuc tap) Guideline for internship management (07.04PL - HDCV Quan ly thuc tap)','','','1900-01-01','','',1,1,0,'Internal material, self-documented FPTU','OJT202'),(353,'Phiếu khảo sát doanh nghiệp về sinh viên thực tập (07.16BMĐHFE10- Khảo sát doanh nghiệp về sinh viên thực tập) Business survey on student interns','','','1900-01-01','','',1,1,0,'Internal material, self-documented FPTU','OJT202'),(354,'Phiếu Khảo sát sinh viên về kỳ thực tập (07.17BMĐHFE10- Khao sat sinh vien ve ky thuc tap) Student survey on the internship','','','1900-01-01','','',1,1,0,'Internal material, self-documented FPTU','OJT202'),(355,'Phiếu đánh giá sinh viên kỳ OJT Evaluation of the students\' OJT performance','','','1900-01-01','','',1,1,0,'Internal material, self-documented FPTU','OJT202'),(356,'Google Android developer reference site (http://developer.android.com/resources/tutorials/hello-world.html)','Google','Google','1900-01-01','N/A','',1,0,1,'','PRM392'),(357,'https://google-developer-training.github.io/android-developer-fundamentals-course-concepts-v2/','Google','Google','2018-01-01','2nd','',0,0,1,'','PRM392'),(358,'Course slides (.pptx)','','','1900-01-01','','',0,0,0,'Bản mềm, tài liệu xây dựng bởi FU','PRM392'),(359,'Software Modeling and Design: UML, Use Cases, Patterns, and Software Architectures','H. Gomaa','Cambridge University Press','2011-01-01','1st Edition','9780521764148',1,1,0,'Books24x7, https://library.books24x7.com/toc.aspx?bookid=41618','SWD392'),(360,'UML Distilled: Applying the Standard Object Modeling Language','Fowler','Addison-Wesley','2004-01-01','3rd edition','978-0321193681',0,1,0,'','SWD392'),(361,'https://gmu.blackboard.com/webct/','','','1900-01-01','','',0,0,1,'','SWD392'),(362,'Giáo trình Triết học Mác-Lênin, dùng cho sinh viên đại học hệ không chuyên lý luận chính trị Philosophy of Marxism – Leninism textbook for non-politics majored students','Bộ Giáo dục và Đào tạoMinistry of Education and Training','Nhà xuất bản Chính trị quốc gia sự thậtTruth National Political Publishing House','2021-01-01','1','',1,0,1,'','MLN111'),(363,'Giáo trình Triết học Mác-Lênin, dùng cho sinh viên đại học hệ chuyên lý luận chính trị Philosophy of Marxism – Leninism textbook for politics majored students','Bộ Giáo dục và Đào tạoMinistry of Education and Training','Nhà xuất bản Chính trị quốc gia sự thậtTruth National Political Publishing House','2021-01-01','1','',0,1,0,'','MLN111'),(364,'Giáo trình Triết học Mác-Lênin Philosophy of Marxism – Leninism textbook','Bộ Giáo dục và Đào tạoMinistry of Education and Training','Nhà xuất bản Chính trị quốc giaNational Political Publishing House','2010-01-01','','',0,1,0,'','MLN111'),(365,'C. Mác và Ph. Ăngghen: Toàn tập Marx/Engels Collected Works','C. Mác và Ph. Ăngghen','Nhà xuất bản Chính trị quốc giaNational Political Publishing House','1995-01-01','1','',0,1,0,'','MLN111'),(366,'V.I. Lênnin: Toàn tập Selected works [of] V. I. Lenin','V.I. Lênnin','Nhà xuất bản Chính trị quốc giaNational Political Publishing House','2005-01-01','1','',0,1,0,'','MLN111'),(367,'Giáo trình Triết học Mác-Lênin Philosophy of Marxism – Leninism textbook','Bộ Giáo dục và Đào tạoMinistry of Education and Training','Nhà xuất bản Chính trị quốc giaNational Political Publishing House','1999-01-01','','',0,1,0,'','MLN111'),(368,'Giáo trình Kinh tế chính trị Mác-Lênin, dùng cho sinh viên đại học hệ không chuyên lý luận chính trị Political economics of Marxism – Leninism textbook for non-politics majored students','Bộ Giáo dục và Đào tạoMinistry of Education and Training','Nhà xuất bản Chính trị quốc gia sự thậtTruth National Political Publishing House','2021-01-01','1','',0,0,0,'Giáo trình có thể download bản mềm tại:(Textbook can be downloaded at)https://moet.gov.vn/van-ban/vbdh/Pages/chi-tiet-van-ban.aspx?ItemID=2729#divShowDialogDownload. Thư viện chỉ đặt mua số lượng ít.','MLN122'),(369,'Giáo trình Kinh tế chính trị Mác - Leenin, dùng cho sinh viên đại học hệ chuyên lý luận chính trị Political economics of Marxism – Leninism textbook for politics majored students','Bộ Giáo dục và Đào tạoMinistry of Education and Training','Nhà xuất bản Chính trị quốc gia sự thậtTruth National Political Publishing House','2021-01-01','1','',0,0,0,'','MLN122'),(370,'Văn kiện Đại hội Đảng toàn quốc lần thứ VI, VII, VIII, IX, X, XI, XII, XIII Political report of the 6th, 7th, 8th, 9th, 10th, 11th, 12th, 13th Party Congress The Communist Party of Vietnam The Communist Party of Vietnam','Đảng Cộng sản Việt Nam','Nhà xuất bản Chính trị quốc gia National Political Publishing House','1900-01-01','1','',0,0,0,'','MLN122'),(371,'C. Mác và Ph. Ăngghen: Toàn tập, t4,8,12,13, 18 ,20, 23, 25, 46 Marx/Engels Collected Works, Vol. 4, 8, 12,13, 18 ,20, 23, 25, 46','C. Mác và Ph. Ăngghen','Nhà xuất bản Chính trị quốc giaNational Political Publishing House','2002-01-01','1','',0,0,0,'','MLN122'),(372,'V.I. Lênnin: Toàn tập, t3, 27, 45 V. I. Lenin, Collected Works, Vol. 3, 27, 45','V.I. Lênnin','Nhà xuất bản Chính trị quốc giaNational Political Publishing House','2005-01-01','','',0,0,0,'','MLN122'),(373,'https://learner.coursera.help/hc/en-us/articles/208280036-Coursera-Code-of-Conduct','','Coursera','1900-01-01','','',0,0,1,'','PMG202c'),(374,'https://www.coursera.org/learn/project-management-foundations','','Coursera','1900-01-01','','',1,0,1,'MOOC 1: Foundations of Project Management','PMG202c'),(375,'https://www.coursera.org/learn/project-initiation-google','','Coursera','1900-01-01','','',1,0,1,'MOOC 2: Project Initiation: Starting a Successful Project','PMG202c'),(376,'https://www.coursera.org/learn/project-planning-google','','Coursera','1900-01-01','','',1,0,1,'MOOC 3: Project Planning: Putting It All Together','PMG202c'),(377,'https://www.coursera.org/learn/project-execution-google','','Coursera','1900-01-01','','',1,0,1,'MOOC 4: Project Execution: Running the Project','PMG202c'),(378,'https://www.coursera.org/learn/agile-project-management','','Coursera','1900-01-01','','',1,0,1,'MOOC 5: Agile Project Management','PMG202c'),(379,'https://www.coursera.org/learn/applying-project-management','','Coursera','1900-01-01','','',1,0,1,'MOOC 6: Capstone: Applying Project Management in the Real World','PMG202c'),(380,'https://www.coursera.org/professional-certificates/google-project-management','','Coursera','1900-01-01','','',1,0,1,'SPEC: Google Project Management: Professional Certificate','PMG202c'),(381,'The Project Management Body of Knowledge (PMBOK Guide)','','','1900-01-01','5th','',0,0,0,'PMI','PMG202c'),(382,'ITPM: Information Technology Project Management','Kathy Schwalbe','Cengage Learning','1900-01-01','8th','',0,0,0,'','PMG202c'),(383,'The Scrum Guide (https://scrum.org)','','','1900-01-01','','',0,0,1,'','PMG202c'),(384,'https://learner.coursera.help/hc/en-us/articles/208280036-Coursera-Code-of-Conduct','','Coursera','1900-01-01','','',0,0,1,'','WDU203c'),(385,'https://www.coursera.org/learn/introtoux-principles-and-processes','','','1900-01-01','','',1,0,1,'MOOC 1: Introduction to User Experience Principles and Processes','WDU203c'),(386,'https://www.coursera.org/learn/understanding-user-needs','','','1900-01-01','','',1,0,1,'MOOC 2: Understanding User Needs','WDU203c'),(387,'https://www.coursera.org/learn/evaluating-designs-with-users','','','1900-01-01','','',1,0,1,'MOOC 3: Evaluating Designs with Users','WDU203c'),(388,'https://www.coursera.org/learn/ux-design-concept-wireframe','','','1900-01-01','','',1,0,1,'MOOC 4: UX Design: From Concept to Prototype','WDU203c'),(389,'https://www.coursera.org/learn/ux-research-at-scale','','','1900-01-01','','',1,0,1,'MOOC 5: UX Research at Scale: Surveys, Analytics, Online Testing','WDU203c'),(390,'https://www.coursera.org/learn/user-experience-capstone','','','1900-01-01','','',1,0,1,'MOOC 6: UX (User Experience) Capstone','WDU203c'),(391,'https://www.coursera.org/specializations/michiganux','','','1900-01-01','','',1,0,1,'SPEC: User Experience Research and Design','WDU203c'),(392,'Giáo trình Tư tưởng Hồ Chí Minh, dùng cho sinh viên bậc đại học hệ không chuyên ngành lý luận chính trị<br>Ho Chi Minh ideology textbook for non-politics majored students','Bộ Giáo dục và Đào tạoMinistry of Education and Training','Nhà xuất bản Chính trị quốc gia sự thậtTruth National Political Publishing House','2021-01-01','1','',1,0,1,'Giáo trình có thể download bản mềm tại:(Textbook can be downloaded at)https://moet.gov.vn/van-ban/vbdh/Pages/chi-tiet-van-ban.aspx?ItemID=2729#divShowDialogDownload. Thư viện chỉ đặt mua bản cứng số lượng ít.','HCM202'),(393,'Giáo trình Tư tưởng Hồ Chí Minh, dùng cho sinh viên bậc đại học hệ chuyên ngành lý luận chính trị<br>Ho Chi Minh ideology textbook for politics majored students','Bộ Giáo dục và Đào tạoMinistry of Education and Training','Nhà xuất bản Chính trị quốc gia sự thậtTruth National Political Publishing House','2021-01-01','1','',0,1,0,'','HCM202'),(394,'Hồ Chí Minh toàn tập<br>The Selected Works of Ho Chi Minh<br> Ho Chi Minh','Hồ Chí Minh','Nhà xuất bản Chính trị quốc gia','2021-01-01','1','',0,0,1,'','HCM202'),(395,'Hồ Chí Minh a life','William J. Duiker','Nhà xuất bản Hyperion, New York Hyperion Publishing, New York','2000-01-01','1','',0,0,1,'','HCM202'),(396,'Giáo trình Chủ nghĩa xã hội khoa học, dùng cho sinh viên đại học hệ không chuyên lý luận chính trị<br>Scientific socialism textbook for non-politics majored students','Bộ Giáo dục và Đào tạoMinistry of Education and Training','Nhà xuất bản Chính trị quốc gia sự thậtTruth National Political Publishing House','2021-01-01','1','',1,0,1,'','MLN131'),(397,'Giáo trình Chủ nghĩa xã hội khoa học, dùng cho sinh viên đại học hệ chuyên lý luận chính trị<br>Scientific socialism textbook for politics majored students','Bộ Giáo dục và Đào tạoMinistry of Education and Training','Nhà xuất bản Chính trị quốc gia sự thậtTruth National Political Publishing House','2021-01-01','1','',0,1,0,'','MLN131'),(398,'Giáo trình Chủ nghĩa xã hội khoa học<br>Scientific socialism textbook','Bộ Giáo dục và Đào tạoMinistry of Education and Training','Vietnam Education Publishing House','2006-01-01','','',0,1,0,'','MLN131'),(399,'C. Mác và Ph. Ăngghen: Toàn tập<br>Marx/Engels Collected Works','C. Mác và Ph. Ăngghen','Nhà xuất bản Chính trị quốc giaNational Political Publishing House','2004-01-01','1','',0,1,0,'','MLN131'),(400,'V.I. Lênnin: Toàn tập<br>Selected works [of] V. I. Lenin','V.I. Lênnin','Nhà xuất bản Chính trị quốc giaNational Political Publishing House','2005-01-01','1','',0,1,0,'','MLN131'),(401,'The Student’s Guide of Capstone Project (CPro_StudentGuide_IS_2021Fall)','','','1900-01-01','','',1,0,0,'Bản mềm, tài liệu xây dựng bởi FU','SEP490'),(402,'Graduated Regulation (Quy che tot nghiep)','','','1900-01-01','','',1,0,0,'Bản mềm, tài liệu xây dựng bởi FU','SEP490'),(403,'Project Templates (on CMS)','','','1900-01-01','','',1,0,0,'Bản mềm, tài liệu xây dựng bởi FU','SEP490'),(404,'Giáo trình Lịch sử Đảng Cộng sản Việt Nam (Dành cho sinh viên đại học, cao đẳng khối không chuyên ngành Mác – Lênin, tư tưởng Hồ Chí Minh)<br>History of CPV textbook for students whose major is not Marxism-Leninism and Ho Chi Minh ideology','Bộ Giáo dục và Đào tạoMinistry of Education and Training','Nhà xuất bản Chính trị quốc gia sự thậtTruth National Political Publishing House','2021-01-01','1','',1,0,1,'Giáo trình có thể download bản mềm tại:(Textbook can be downloaded at)https://moet.gov.vn/van-ban/vbdh/Pages/chi-tiet-van-ban.aspx?ItemID=2729#divShowDialogDownload. Thư viện chỉ đặt mua bản cứng số lượng ít.','VNR202'),(405,'Giáo trình Lịch sử Đảng Cộng sản Việt Nam (Dành cho sinh viên đại học, cao đẳng chuyên ngành Mác – Lênin, tư tưởng Hồ Chí Minh)<br>History of CPV textbook for students whose major is Marxism-Leninism and Ho Chi Minh ideology','Bộ Giáo dục và Đào tạoMinistry of Education and Training','Nhà xuất bản Chính trị quốc gia sự thậtTruth National Political Publishing House','2021-01-01','1','',0,1,0,'','VNR202'),(406,'Hồ Chí Minh toàn tập, tập 1 đến tập 15<br>The Selected Works of Ho Chi Minh, Vol. 1 to 5','Hồ Chí Minh','Nhà xuất bản Chính trị quốc gia National Political Publishing House','2011-01-01','1','',0,0,1,'','VNR202'),(407,'Lịch sử Đảng Cộng sản Việt Nam, tập 1<br>History of the Communist Party of Vietnam, Vol. 1','Institute of History','Nhà xuất bản Chính trị quốc gia National Political Publishing House','2018-01-01','1','',0,0,1,'','VNR202'),(408,'Chiến tranh cách mạng Việt Nam 1945-1975, thắng lợi và bài học<br>Vietnamese Revolutionary War, 1945–1975: Victory and Lessons','Ban chỉ đạo tổng kết chiến tranh trực thuộc Bộ chính trị','Nhà xuất bản Chính trị quốc gia National Political Publishing House','2008-01-01','1','',0,0,1,'','VNR202'),(409,'Báo cáo tổng kết một số vấn đề lý luận thực tiễn qua 30 năm đổi mới<br>The final report on the summary of some theoretical-practical issues over the past 30 years of innovation','Đảng Cộng sản Việt Nam, Ban chấp hành Trung ương, Ban chỉ đạo tổng kết','Nhà xuất bản Chính trị quốc gia National Political Publishing House','2015-01-01','1','',0,0,1,'','VNR202'),(410,'Văn kiện Đại hội đại biểu toàn quốc lần thứ XII<br>Political report of the 13th Party Congress','Đảng Cộng sản Việt Nam','Nhà xuất bản Chính trị quốc gia National Political Publishing House','2016-01-01','1','',0,0,1,'','VNR202');
/*!40000 ALTER TABLE `material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `plo`
--

LOCK TABLES `plo` WRITE;
/*!40000 ALTER TABLE `plo` DISABLE KEYS */;
/*!40000 ALTER TABLE `plo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `po`
--

LOCK TABLES `po` WRITE;
/*!40000 ALTER TABLE `po` DISABLE KEYS */;
/*!40000 ALTER TABLE `po` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (0,'guest'),(1,'crdd'),(2,'teacher'),(3,'student');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `role_feature`
--

LOCK TABLES `role_feature` WRITE;
/*!40000 ALTER TABLE `role_feature` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_feature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES ('CEA201','Tổ chức và Kiến trúc máy tính','Computer Organization and Architecture','1',3,''),('CSD201','Cấu trúc dữ liệu và giải thuật','Data Structures and Algorithms','3',3,'PRO192'),('CSI104','Nhập môn khoa học máy tính','Introduction to Computer','1',3,''),('DBI202','Các hệ cơ sở dữ liệu','Introduction to Databases','3',3,''),('ENW492c','Kỹ năng viết học thuật','Academic Writing Skills','6',3,'None'),('EXE_ELE','Nhóm học phần Khởi nghiệp 1','Entrepreneurship Group 1','7',3,''),('HCM202','Tư tưởng Hồ Chí Minh','HCM Ideology','9',2,'MLN111, MLN122'),('IOT102','Internet vạn vật','Internet of Things','4',3,'Familiarity with C programming'),('ITE302c','Đạo đức trong CNTT','Ethics in IT','5',3,''),('JPD113','Tiếng Nhật sơ cấp 1-A1.1','Elementary Japanese 1- A1.1','3',3,'Không'),('JPD123','Tiếng Nhật sơ cấp 1-A1.2','Elementary Japanese 1-A1.2','4',3,'JPD113'),('LAB211','Thực hành OOP với Java','OOP with Java Lab','3',3,'PRO192'),('MAD101','Toán rời rạc','Discrete mathematics','2',3,'None'),('MAE101','Toán cho ngành kỹ thuật','Mathematics for Engineering','1',3,'None'),('MAS291','Xác suất thống kê','Statistics & Probability','4',3,'MAE101 or MAC101'),('MLN111','Triết học Mác - Lê-nin','Philosophy of Marxism – Leninism','8',3,'None'),('MLN122','Kinh tế chính trị Mác - Lê-nin','Political economics of Marxism – Leninism','8',2,'None'),('MLN131','Chủ nghĩa xã hội khoa học','Scientific socialism','9',2,'MLN111, MLN122'),('NWC203c','Mạng máy tính','Computer Networking','2',3,''),('OJT202','Đào tạo trong môi trường thực tế','On-The-Job Training','6',10,'Students attain 90% of the total credits from term 1-term 5 (excluding Physical Education and OTP Programs)'),('OSG202','Hệ điều hành','Operating Systems','2',3,''),('OTP101','Định hướng và Rèn luyện tập trung','Orientation and General Training Program','0',0,'None'),('PEN','Tiếng Anh chuẩn bị','Preparation English','0',0,''),('PHE_COM*1','Giáo dục thể chất 1','Physical Education 1','0',2,''),('PHE_COM*2','Giáo dục thể chất 2','Physical Education 2','1',2,''),('PHE_COM*3','Giáo dục thể chất 3','Physical Education 3','2',2,''),('PMG202c','Quản trị dự án','Project management','8',3,''),('PRF192','Cơ sở lập trình','Programming Fundamentals','1',3,'None'),('PRJ301','Phát triển ứng dụng Java web','Java Web Application Development','4',3,'DBI202, PRO192'),('PRM392','Lập trình di động','Mobile Programming','7',3,'PRO192'),('PRO192','Lập trình hướng đối tượng','Object-Oriented Programming','2',3,'PRF192'),('SE_COM*1','Học phần 1 của combo*','Subject 1 of Combo*','5',3,''),('SE_COM*2','Học phần 2 của combo*','Subject 2 of Combo*','7',3,''),('SE_COM*3','Học phần 3 của combo*','Subject 3 of Combo*','7',3,''),('SE_EXE_ELE','Nhóm môn Khởi nghiệp 2 và Combos','SE_Entrepreneurship 2 and Combos','8',6,''),('SEP490','Đồ án tốt nghiệp KTPM','SE Capstone Project','9',10,'o Successfully complete (*) below topics: - Project Management – PMG201c or PMG202c - Software Architecture and Design – SWD391 or SWD392 o Pass 60% of total credits of selected combo. o Pass OJT202 (not apply to international students) o Pass 80% of total credits (PHE_COM* and OJT excluded) (*): FR must be greater than or equal to 4.'),('SSG104','Kỹ năng giao tiếp và cộng tác','Communication and In-Group Working Skills','2',3,'None'),('SSL101c','Kỹ năng học tập đại học','Academic Skills for University Success','1',3,'None'),('SWD392','Kiến trúc và thiết kế phần mềm','Software Architecture and Design','7',3,'SWE201c, PRO192'),('SWE201c','Nhập môn kĩ thuật phần mềm','Introduction to Software Engineering','4',3,'PRO192 (not applied for the BIT_AI17 programs)'),('SWP391','Dự án phát triển phần mềm','Application development project','5',3,'PRJ301 (Java Web Application Development)'),('SWR302','Yêu cầu phần mềm','Software Requirement','5',3,'SWE102 or SWE201c'),('SWT301','Kiểm thử phần mềm','Software Testing','5',3,'SWE102 or SWE201c'),('TMI_ELE','Nhạc cụ truyền thống','Traditional musical instrument','0',3,''),('VNR202','Lịch sử Đảng Cộng sản Việt Nam','History of CPV','9',2,'MLN111, MLN122'),('VOV114','Vovinam 1','Vovinam 1','0',3,' '),('VOV124','Vovinam 3','Vovinam 3','2',3,' '),('VOV134','Vovinam 2','Vovinam 2','1',3,' '),('WDU203c','Thiết kế trải nghiệm người dùng','UI/UX Design','8',3,''),('WED201c','Thiết kế web','Web Design','3',3,'None');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `syllabus`
--

LOCK TABLES `syllabus` WRITE;
/*!40000 ALTER TABLE `syllabus` DISABLE KEYS */;
INSERT INTO `syllabus` VALUES (3,'DBI202','Các hệ cơ sở dữ liệu','Introduction to Databases',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1189/QÐ-ÐHFPT'),(4,'PRF192','Cơ sở lập trình','Programming Fundamentals',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1189/QÐ-ÐHFPT'),(7,'PRJ301','Phát triển ứng dụng Java web','Java Web Application Development',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1189/QÐ-ÐHFPT'),(2,'PRO192','Lập trình hướng đối tượng','Object-Oriented Programming','Bachelor',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1189/QÐ-ÐHFPT'),(1,'SWP391','Dự án phát triển phần mềm','Application development project',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1189/QÐ-ÐHFPT');
/*!40000 ALTER TABLE `syllabus` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-19 19:54:33
