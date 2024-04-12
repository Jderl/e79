-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_college
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class` (
  `CLASS_CODE` varchar(5) NOT NULL,
  `CRS_CODE` varchar(10) NOT NULL,
  `CLASS_SECTION` varchar(2) DEFAULT NULL,
  `CLASS_TIME` varchar(20) DEFAULT NULL,
  `ROOM_CODE` varchar(8) DEFAULT NULL,
  `PROF_NUM` float DEFAULT NULL,
  PRIMARY KEY (`CLASS_CODE`,`CRS_CODE`),
  KEY `fk_class_course1_idx` (`CRS_CODE`),
  CONSTRAINT `fk_class_course1` FOREIGN KEY (`CRS_CODE`) REFERENCES `course` (`CRS_CODE`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES ('10012','ACCT-211','1','MWF 8:00-8:50 a.m.','BUS311',105),('10013','ACCT-211','2','MWF 9:00-9:50 a.m.','BUS200',105),('10014','ACCT-211','3','TTh 2:30-3:45 p.m.','BUS252',342),('10015','ACCT-212','1','MWF 10:00-10:50 a.m.','BUS311',301),('10016','ACCT-212','2','Th 6:00-8:40 p.m.','BUS252',301),('10017','CIS-220','1','MWF 9:00-9:50 a.m.','KLR209',228),('10018','CIS-220','2','MWF 9:00-9:50 a.m.','KLR211',114),('10019','CIS-220','3','MWF 10:00-10:50 a.m.','KLR209',228),('10020','CIS-420','1','W 6:00-8:40 p.m.','KLR209',162),('10021','QM-261','1','MWF 8:00-8:50 a.m.','KLR200',114),('10022','QM-261','2','TTh 1:00-2:15 p.m.','KLR200',114),('10023','QM-362','1','MWF 11:00-11:50 a.m.','KLR200',162),('10024','QM-362','2','TTh 2:30-3:45 p.m.','KLR200',162),('10025','MATH-243','1','Th 6:00-8:40 p.m.','DRE155',325);
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `CRS_CODE` varchar(10) NOT NULL,
  `DEPT_CODE` varchar(10) NOT NULL,
  `CRS_DESCRIPTION` varchar(35) DEFAULT NULL,
  `CRS_CREDIT` float DEFAULT NULL,
  PRIMARY KEY (`CRS_CODE`,`DEPT_CODE`),
  KEY `fk_course_department1_idx` (`DEPT_CODE`),
  CONSTRAINT `fk_course_department1` FOREIGN KEY (`DEPT_CODE`) REFERENCES `department` (`DEPT_CODE`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('ACCT-211','ACCT','Accounting I',3),('ACCT-212','ACCT','Accounting II',3),('CIS-220','CIS','Intro. to Microcomputing',3),('CIS-420','CIS','Database Design and Implementation',4),('MATH-243','MATH','Mathematics for Managers',3),('QM-261','CIS','Intro. to Statistics',3),('QM-362','CIS','Statistical Applications',4);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `DEPT_CODE` varchar(10) NOT NULL,
  `DEPT_NAME` varchar(30) DEFAULT NULL,
  `SCHOOL_CODE` varchar(8) DEFAULT NULL,
  `EMP_NUM` int DEFAULT NULL,
  `DEPT_ADDRESS` varchar(20) DEFAULT NULL,
  `DEPT_EXTENSION` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`DEPT_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('ACCT','Accounting','BUS',114,'KLR 211, Box 52','3119'),('ART','Fine Arts','A&SCI',435,'BBG 185, Box 128','2278'),('BIOL','Biology','A&SCI',387,'AAK 230, Box 415','4117'),('CIS','Computer Info. Systems','BUS',209,'KLR 333, Box 56','3245'),('ECON-FIN','Economics-Finance','BUS',299,'KLR 284, Box 63','3126'),('ENG','English','A&SCI',160,'DRE 102, Box 223','1004'),('HIST','History','A&SCI',103,'DRE 156, Box 284','1867'),('MATH','Mathematics','A&SCI',297,'AAK 194, Box 422','4234'),('MKT-MGT','Marketing-Management','BUS',106,'KLR 126, Box 55','3342'),('PSYCH','Psychology','A&SCI',195,'AAK 297, Box 438','4110'),('SOC','Sociology','A&SCI',342,'BBG 208, Box 132','2008');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `EMP_NUM` int NOT NULL,
  `EMP_LNAME` varchar(15) DEFAULT NULL,
  `EMP_FNAME` varchar(12) DEFAULT NULL,
  `EMP_INITIAL` varchar(1) DEFAULT NULL,
  `EMP_JOBCODE` varchar(5) DEFAULT NULL,
  `EMP_HIREDATE` datetime DEFAULT NULL,
  `EMP_DOB` datetime DEFAULT NULL,
  PRIMARY KEY (`EMP_NUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (100,'Worley','James','F','CUST','1978-02-23 00:00:00','1950-06-12 00:00:00'),(101,'Ramso','Henry','B','CUST','1994-11-15 00:00:00','1961-11-02 00:00:00'),(102,'Edwards','Rosemary','D','TECH','1990-07-23 00:00:00','1953-07-03 00:00:00'),(103,'Donelly','Ronald','O','PROF','1987-07-01 00:00:00','1952-10-02 00:00:00'),(104,'Yukon','Preston','D','PROF','1992-05-01 00:00:00','1948-02-23 00:00:00'),(105,'Heffington','Arnelle','B','PROF','1991-07-01 00:00:00','1950-11-02 00:00:00'),(106,'Washington','Ross','E','PROF','1976-08-01 00:00:00','1941-03-04 00:00:00'),(108,'Robertson','Elaine','W','TECH','1983-10-18 00:00:00','1961-06-20 00:00:00'),(110,'Thieu','Van','S','PROF','1989-08-01 00:00:00','1951-08-12 00:00:00'),(114,'Graztevski','Gerald','B','PROF','1978-08-01 00:00:00','1939-03-18 00:00:00'),(122,'Wilson','Todd','H','CUST','1990-11-06 00:00:00','1966-10-19 00:00:00'),(123,'Jones','Suzanne','B','TECH','1994-01-05 00:00:00','1967-12-30 00:00:00'),(124,'Smith','Elsa','K','CLRK','1982-12-16 00:00:00','1943-09-13 00:00:00'),(126,'Ardano','James','G','CLRK','1994-10-01 00:00:00','1970-03-12 00:00:00'),(155,'Ritula','Annelise','','PROF','1990-08-01 00:00:00','1957-05-24 00:00:00'),(160,'Smith','Robert','T','PROF','1992-08-01 00:00:00','1955-06-19 00:00:00'),(161,'Watson','George','F','CUST','1994-11-01 00:00:00','1962-10-02 00:00:00'),(162,'Rob','Peter','','PROF','1981-08-01 00:00:00','1940-06-20 00:00:00'),(165,'Williamson','Kathryn','A','CLRK','1992-06-15 00:00:00','1968-11-17 00:00:00'),(166,'Herndon','Jill','M','TECH','1990-08-18 00:00:00','1965-08-29 00:00:00'),(173,'Teng','Weston','J','TECH','1980-07-15 00:00:00','1951-11-17 00:00:00'),(191,'Dexter','Willa','N','PROF','1984-08-01 00:00:00','1953-05-17 00:00:00'),(195,'Williams','Herman','H','PROF','1988-08-01 00:00:00','1955-11-19 00:00:00'),(209,'Smith','Melanie','K','PROF','1983-08-01 00:00:00','1946-05-24 00:00:00'),(228,'Coronel','Carlos','M','PROF','1988-08-01 00:00:00','1949-05-16 00:00:00'),(231,'Shebert','Rebecca','A','CUST','1994-02-21 00:00:00','1963-02-27 00:00:00'),(297,'Jones','Hermine','','PROF','1985-01-01 00:00:00','1950-07-04 00:00:00'),(299,'Stoddard','Doreen','L','PROF','1994-08-01 00:00:00','1960-04-25 00:00:00'),(301,'Osaki','Ismael','K','PROF','1989-08-01 00:00:00','1952-05-25 00:00:00'),(333,'Jordan','Julian','H','TECH','1991-04-23 00:00:00','1968-07-16 00:00:00'),(335,'Okomoto','Ronald','F','PROF','1975-08-01 00:00:00','1944-03-03 00:00:00'),(342,'Smith','Robert','A','PROF','1978-08-01 00:00:00','1937-12-30 00:00:00'),(387,'Smithson','George','D','PROF','1982-08-01 00:00:00','1948-10-01 00:00:00'),(401,'Blalock','James','G','PROF','1981-08-01 00:00:00','1945-03-15 00:00:00'),(412,'Smith','Robert','E','CUST','1985-06-24 00:00:00','1963-09-25 00:00:00'),(425,'Matler','Ralph','F','PROF','1995-08-01 00:00:00','1973-12-02 00:00:00'),(435,'Doornberg','Anne','D','PROF','1992-08-01 00:00:00','1963-10-02 00:00:00');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professor` (
  `PROF_NUM` int NOT NULL AUTO_INCREMENT,
  `EMP_NUM` int NOT NULL,
  `DEPT_CODE` varchar(10) NOT NULL,
  `PROF_OFFICE` varchar(50) DEFAULT NULL,
  `PROF_EXTENSION` varchar(4) DEFAULT NULL,
  `PROF_HIGH_DEGREE` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`PROF_NUM`,`EMP_NUM`,`DEPT_CODE`),
  KEY `fk_professor_department_idx` (`DEPT_CODE`),
  KEY `fk_professor_employee1_idx` (`EMP_NUM`),
  CONSTRAINT `fk_professor_department` FOREIGN KEY (`DEPT_CODE`) REFERENCES `department` (`DEPT_CODE`),
  CONSTRAINT `fk_professor_employee1` FOREIGN KEY (`EMP_NUM`) REFERENCES `employee` (`EMP_NUM`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT INTO `professor` VALUES (2,100,'ACCT','DRE 56','6784','PH.D.'),(3,104,'ENG','DRE 102 ','5561','MA'),(4,105,'ACCT','KLR 229D','8665','Ph.D.'),(5,106,'MKT-MGT','KLR 126','3899','Ph.D.'),(6,110,'BIOL','AAK 160','3412','Ph.D.'),(7,114,'ACCT','KLR 211','4436','Ph.D.'),(8,155,'MATH','AAK 201','4440','Ph.D.'),(9,160,'ENG','DRE 102','2248','Ph.D.'),(10,162,'CIS','KLR 203E','2359','Ph.D.'),(11,191,'MKT-MGT','KLR 409B','4016','DBA'),(12,195,'PSYCH','AAK 297','3550','Ph.D.'),(13,209,'CIS','KLR 333','3421','Ph.D.'),(14,228,'CIS','KLR 300','3000','Ph.D.'),(15,297,'MATH','AAK 194','1145','Ph.D.'),(16,299,'ECON-FIN','KLR 284','2851','Ph.D.'),(17,301,'ACCT','KLR 244','4683','Ph.D.'),(18,335,'ENG','DRE 208','2000','Ph.D.'),(19,342,'SOC','BBG 208','5514','Ph.D.'),(20,387,'BIOL','AAK 230','8665','Ph.D.'),(21,401,'HIST','DRE 156','6783','MA'),(22,425,'ECON-FIN','KLR 284','2851','MBA'),(23,435,'ART','BBG 185','2278','Ph.D.');
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `STU_NUM` int NOT NULL,
  `STU_LNAME` varchar(15) DEFAULT NULL,
  `STU_FNAME` varchar(15) DEFAULT NULL,
  `STU_INIT` varchar(1) DEFAULT NULL,
  `STU_DOB` datetime DEFAULT NULL,
  `STU_HRS` int DEFAULT NULL,
  `STU_CLASS` varchar(2) DEFAULT NULL,
  `STU_GPA` float DEFAULT NULL,
  `STU_TRANSFER` decimal(10,0) DEFAULT NULL,
  `DEPT_CODE` varchar(10) NOT NULL,
  `STU_PHONE` varchar(4) DEFAULT NULL,
  `PROF_NUM` int DEFAULT NULL,
  PRIMARY KEY (`STU_NUM`,`DEPT_CODE`),
  KEY `fk_student_department1_idx` (`DEPT_CODE`),
  CONSTRAINT `fk_student_department1` FOREIGN KEY (`DEPT_CODE`) REFERENCES `department` (`DEPT_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (321452,'Bowser','William','C','1972-02-12 00:00:00',42,'So',2.84,0,'BIOL','2134',205),(324257,'Smithson','Anne','K','1977-11-15 00:00:00',81,'Jr',3.27,1,'CIS','2256',222),(324258,'Brewer','Juliette','','1966-08-23 00:00:00',36,'So',2.26,1,'ACCT','2256',228),(324269,'Oblonski','Walter','H','1973-09-16 00:00:00',66,'Jr',3.09,0,'CIS','2114',222),(324273,'Smith','John','D','1955-12-30 00:00:00',102,'Sr',2.11,1,'ENG','2231',199),(324274,'Katinga','Raphael','P','1976-10-21 00:00:00',114,'Sr',3.15,0,'ACCT','2267',228),(324291,'Robertson','Gerald','T','1970-04-08 00:00:00',120,'Sr',3.87,1,'MATH','2267',311),(324299,'Smith','John','B','1983-11-30 00:00:00',15,'Fr',2.92,0,'ACCT','2315',230);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-12 16:06:34
