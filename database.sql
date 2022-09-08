-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: vms
-- ------------------------------------------------------
-- Server version	8.0.30



DROP TABLE IF EXISTS `clock_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clock_in`
(
  `visitor_id` int NOT NULL,
  `time_in` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `time_out` timestamp NULL DEFAULT '2000-08-01 23:00:00',
  `tag` varchar
(3) DEFAULT NULL,
  PRIMARY KEY
(`visitor_id`,`time_in`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clock_in`
--


INSERT INTO `
clock_in`
VALUES
    (2, '2022-09-06 15:36:30', '2022-09-06 16:57:52', NULL),
    (3, '2022-09-06 15:37:11', '2022-09-06 15:38:34', NULL),
    (4, '2022-09-07 08:29:05', '2022-09-07 10:43:24', NULL),
    (5, '2022-09-07 08:29:35', '2022-09-07 08:30:19', NULL),
    (6, '2022-09-07 10:50:42', '2022-09-07 10:57:43', NULL),
    (7, '2022-09-07 11:14:09', '2022-09-07 11:20:41', NULL),
    (8, '2022-09-07 11:41:52', '2022-09-07 12:02:39', NULL),
    (9, '2022-09-07 12:03:27', '2022-09-07 12:08:35', NULL);


--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department`
(
  `id` int NOT NULL AUTO_INCREMENT,
  `department` varchar
(16) NOT NULL,
  PRIMARY KEY
(`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

INSERT INTO `
department`
VALUES
    (1, 'BlackSentry'),
    (2, 'Cloud Unit'),
    (3, 'Customer Support'),
    (4, 'Procurement'),
    (5, 'Infrastructure'),
    (6, 'Engineering'),
    (7, 'IT Support'),
    (8, 'Product Unit');


--
-- Table structure for table `gender`
--

DROP TABLE IF EXISTS `gender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gender`
(
  `id` int NOT NULL AUTO_INCREMENT,
  `gender` varchar
(16) NOT NULL,
  PRIMARY KEY
(`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gender`
--

INSERT INTO `
gender`
VALUES
    (1, 'M'),
    (2, 'F');


--
-- Table structure for table `purpose`
--

DROP TABLE IF EXISTS `purpose`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purpose`
(
  `id` int NOT NULL AUTO_INCREMENT,
  `purpose` varchar
(16) NOT NULL,
  PRIMARY KEY
(`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


INSERT INTO `
purpose`
VALUES
    (1, 'enquiry'),
    (2, 'Job Application'),
    (3, 'Visiting'),
    (4, 'Appointment'),
    (5, 'Work');


--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag`
(
  `tag_number` varchar
(3) NOT NULL,
  `tag_status` tinyint
(1) DEFAULT NULL,
  PRIMARY KEY
(`tag_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `
tag`
VALUES
    ('001', 1),
    ('002', 1),
    ('003', 1),
    ('004', 1),
    ('005', 1),
    ('006', 1),
    ('007', 1),
    ('008', 1),
    ('009', 1),
    ('010', 1),
    ('011', 1),
    ('012', 1),
    ('013', 1),
    ('014', 1),
    ('015', 1),
    ('016', 1),
    ('017', 1),
    ('018', 1),
    ('019', 1),
    ('020', 1),
    ('021', 1),
    ('022', 1),
    ('023', 1),
    ('024', 1),
    ('025', 1),
    ('026', 1),
    ('027', 1),
    ('028', 1),
    ('029', 1),
    ('030', 1),
    ('031', 1),
    ('032', 1),
    ('033', 1),
    ('034', 1),
    ('035', 1),
    ('036', 1),
    ('037', 1),
    ('038', 1),
    ('039', 1),
    ('040', 1),
    ('041', 1),
    ('042', 1),
    ('043', 1),
    ('044', 1),
    ('045', 1),
    ('046', 1),
    ('047', 1),
    ('048', 1),
    ('049', 1),
    ('050', 1);


--
-- Table structure for table `user_type`
--

DROP TABLE IF EXISTS `user_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_type`
(
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar
(16) NOT NULL,
  PRIMARY KEY
(`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `
user_type`
VALUES
    (1, 'Admin'),
    (2, 'Staff'),
    (3, 'Visitor');


--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users`
(
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar
(16) NOT NULL,
  `email` varchar
(32) NOT NULL,
  `first_name` varchar
(32) NOT NULL,
  `last_name` varchar
(32) NOT NULL,
  `phone_number` varchar
(16) DEFAULT NULL,
  `gender_id` int NOT NULL,
  `department_id` int NOT NULL,
  `password` varchar
(255) NOT NULL,
  PRIMARY KEY
(`id`),
  KEY `FK_DEPARTMENT`
(`department_id`),
  KEY `FK_GENDER`
(`gender_id`),
  CONSTRAINT `FK_DEPARTMENT` FOREIGN KEY
(`department_id`) REFERENCES `department`
(`id`),
  CONSTRAINT `FK_GENDER` FOREIGN KEY
(`gender_id`) REFERENCES `gender`
(`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `
users`
VALUES
    (1, 'zach', 'civirzach@gmail.com', 'CIVIR-TER', 'ZACH-UKOH', '08130402087', 1, 1, 'Playboy@123'),
    (2, 'Vincento', 'mrvincentito@gmail.com', 'VINCENT', 'ITO', '080467894132', 2, 2, 'Playboy@123'),
    (3, 'davido', 'david03@gmail.com', 'CIVIR-TER', 'ZACH-UKOH', '08130402087', 1, 3, 'Playboy@123'),
    (4, 'zach', 'civirzach@gmail.com', 'CIVIR-TER', 'ZACH-UKOH', '08130402087', 2, 4, 'Playboy@123'),
    (5, 'zach', 'civirzach@gmail.com', 'CIVIR-TER', 'ZACH-UKOH', '08130402087', 1, 1, 'Playboy@123'),
    (6, 'zach', 'civirzach@gmail.com', 'CIVIR-TER', 'ZACH-UKOH', '08130402087', 1, 1, 'Playboy@123'),
    (7, 'alaba', 'alaba@gmail.com', 'david', 'David', '0841454545', 1, 1, '$2b$10$87jIxJAi7oyLzZaFAtIkTeIheQu1JSDXC2gYIKB0KZ/LAaAJzNJfa');

--
-- Table structure for table `visitor_tag`
--

DROP TABLE IF EXISTS `visitor_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visitor_tag`
(
  `visitor_id` int NOT NULL,
  `tag` varchar
(3) DEFAULT NULL,
  KEY `FK_VISITORS_ID`
(`visitor_id`),
  KEY `FK_TAG_NUMBER`
(`tag`),
  CONSTRAINT `FK_TAG_NUMBER` FOREIGN KEY
(`tag`) REFERENCES `tag`
(`tag_number`),
  CONSTRAINT `FK_VISITORS_ID` FOREIGN KEY
(`visitor_id`) REFERENCES `visitors`
(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `
visitor_tag`
VALUES
    (2, '001'),
    (3, '002'),
    (4, '001'),
    (5, '002'),
    (6, '001'),
    (7, '001'),
    (8, '001'),
    (9, '001');


DROP TABLE IF EXISTS `visitors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visitors`
(
  `id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar
(64) NOT NULL,
  `user_id` int DEFAULT NULL,
  `purpose_id` int DEFAULT NULL,
  `date_added` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `address` text,
  `phone_number` varchar
(16) DEFAULT NULL,
  PRIMARY KEY
(`id`),
  KEY `FK_WHOM_TO_SEE`
(`user_id`),
  KEY `FK_PURPOSE`
(`purpose_id`),
  CONSTRAINT `FK_PURPOSE` FOREIGN KEY
(`purpose_id`) REFERENCES `purpose`
(`id`),
  CONSTRAINT `FK_WHOM_TO_SEE` FOREIGN KEY
(`user_id`) REFERENCES `users`
(`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `
visitors`
VALUES
    (1, 'Mrs. Diya', 2, 2, '2022-08-01 23:00:00', 'Zone 4, 5th Floor, IGI House, 3, Gwani Street, Off IBB Way, Wuse 900281, Abuja', '08050917923'),
    (2, 'Ben Aflek', 4, 2, '2022-09-06 15:36:30', '546 South Glendale St. Waukegan, IL 60085', '549889987987'),
    (3, 'Dave Johnson', 2, 3, '2022-09-06 15:37:11', '981 Grand Drive Staten Island, NY 10301', '468484894'),
    (4, 'Jack Harrison', 2, 3, '2022-09-07 08:29:05', 'No.1 Emmanuel Villa Close', '08130402087'),
    (5, 'Ben Davis', 4, 3, '2022-09-07 08:29:35', 'kufuydiudiuf', '646+476+46'),
    (6, 'James Foster', 1, 2, '2022-09-07 10:50:42', '3511 Blue Wing Dr Dickinson, Texas(TX), 77539', '54488987'),
    (7, 'Jamie Foster', 3, 4, '2022-09-07 11:14:09', 'jksbvsioanvionsviobf', '056346546+5'),
    (8, 'David Abah', 3, 2, '2022-09-07 11:41:52', 'Aso Rock', '658948998'),
    (9, 'Zack the Coder', 4, 1, '2022-09-07 12:03:27', 'Layer 3', '345678i');

