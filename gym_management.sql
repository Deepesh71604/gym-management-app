-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: gym_management
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classes` (
  `class_id` int NOT NULL AUTO_INCREMENT,
  `class_name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `schedule` varchar(100) DEFAULT NULL,
  `trainer_id` int DEFAULT NULL,
  PRIMARY KEY (`class_id`),
  KEY `trainer_id` (`trainer_id`),
  CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`trainer_id`) REFERENCES `trainers` (`trainer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES (1,'Yoga','Become Flexible Again','3 days a Week',22),(3,'Cardio','Full Cardio','4 days a week',24),(4,'Running ','You will be made to run ','ALL 6 Days',24),(5,'cardio','weight loss by doing cardio','4 days a week',24),(6,'cardio','weight loss fast','3 times a week',24),(7,'Areobics','Become Felxibile Again','3 days a week',22),(8,'Calisthenics','Be able to do lots of sutff ','4 Days a week ',22);
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscriptions` (
  `plan_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `duration` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` text,
  PRIMARY KEY (`plan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
INSERT INTO `subscriptions` VALUES (1,'Getting Toned',6,5000.00,'You will be rebuilt as a new man '),(2,'Getting Bulk',6,7000.00,'You will be able to carry the boats'),(3,'Winter Arc',4,4000.00,'We will make sure you have an epic transformation '),(4,'Weight Loss ',3,1000.00,'Active weight loss');
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainers`
--

DROP TABLE IF EXISTS `trainers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainers` (
  `trainer_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `specialty` varchar(100) DEFAULT NULL,
  `bio` text,
  `rate` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`trainer_id`),
  KEY `trainers_ibfk_1` (`user_id`),
  CONSTRAINT `trainers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainers`
--

LOCK TABLES `trainers` WRITE;
/*!40000 ALTER TABLE `trainers` DISABLE KEYS */;
INSERT INTO `trainers` VALUES (1,1,'Very Charming','I can Make You calories Burn Quicker',500.00),(2,1,'Very Charming','I can Make You calories Burn Quicker',500.00),(3,1,'Has six pack abs',NULL,150.00),(4,9,'Has six pack abs',NULL,200.00),(5,10,'Has six pack abs',NULL,200.00),(6,11,'Has six pack abs',NULL,200.00),(7,12,'Has six pack abs',NULL,200.00),(22,41,'yoga','Can teach Nice yoga ',500.00),(23,42,'Cardio','Martahon Winner - 15 times ',500.00),(24,43,'Cardio','Marathon Runner up -10 times ',400.00);
/*!40000 ALTER TABLE `trainers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_subscriptions`
--

DROP TABLE IF EXISTS `user_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_subscriptions` (
  `subscription_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `plan_id` int NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime DEFAULT NULL,
  `status` enum('active','expired') NOT NULL DEFAULT 'active',
  PRIMARY KEY (`subscription_id`),
  KEY `user_subscriptions_ibfk_1` (`user_id`),
  KEY `user_subscriptions_ibfk_2` (`plan_id`),
  CONSTRAINT `user_subscriptions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `user_subscriptions_ibfk_2` FOREIGN KEY (`plan_id`) REFERENCES `subscriptions` (`plan_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_subscriptions`
--

LOCK TABLES `user_subscriptions` WRITE;
/*!40000 ALTER TABLE `user_subscriptions` DISABLE KEYS */;
INSERT INTO `user_subscriptions` VALUES (5,1,1,'2024-11-12 00:00:00','2025-05-12 00:00:00','active'),(8,50,4,'2024-11-14 00:00:00','2025-02-14 00:00:00','active'),(9,51,1,'2024-11-14 00:00:00','2025-05-14 00:00:00','active');
/*!40000 ALTER TABLE `user_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `address` text,
  `role` varchar(50) NOT NULL DEFAULT 'member',
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Zoro','Gibblemans@gmail.com','Lol234','932342924',' ','admin','2024-10-27 13:45:00'),(3,'Shivarakshit','shivarakshit08@gmail.com','asdsasdsa','','PES University, Bengaluru Dwaraka Nagar Banashankari,Boys hostel','member','2024-10-30 06:17:36'),(8,'Shivarakshit','shivarakshasdsdait08@gmail.com','sadasdasdda','','PES University, Bengaluru Dwaraka Nagar Banashankari,Boys hostel','member','2024-10-30 07:05:46'),(9,'Shivarakshit','shivarasdsadasdsdakshit08@gmail.com','asdsasdsaasdasd',NULL,'PES University, Bengaluru Dwaraka Nagar Banashankari,Boys hostel','trainer','2024-10-30 07:06:28'),(10,'Shivarakshit','shivaraasdasdaasdasdasdasdsadsdsadasdsdakshit08@gmail.com','asdsasdsaasdasd',NULL,'PES University, Bengaluru Dwaraka Nagar Banashankari,Boys hostel','trainer','2024-10-30 07:08:21'),(11,'Shivarakshit','shivaraasdasdaaadasadasddasdasdasdasdsadsdsadasdsdakshit08@gmail.com','asdsasdsaasdasd',NULL,'PES University, Bengaluru Dwaraka Nagar Banashankari,Boys hostel','trainer','2024-10-30 07:09:55'),(12,'Shivarakshit','shivaasdasdasadraasdasdaaadasadasddasdasdasdasdsadsdsadasdsdakshit08@gmail.com','asdsasdsaasdasd',NULL,'PES University, Bengaluru Dwaraka Nagar Banashankari,Boys hostel','trainer','2024-10-30 07:12:11'),(27,'Shrina','shrina@gmail.com','asd','4232342958','PES University, Bengaluru Dwaraka Nagar Banashankari,Boys hostel','member','2024-11-04 11:53:21'),(40,'Mikey','Miw123@gmail.com','6a3ef924cb19135103c1e5697a04a926209911a8cd45734773fac25454e691a0','8219028346','PES University, Bengaluru Dwaraka Nagar Banashankari,Boys hostel','member','2024-11-12 12:19:29'),(41,'Kiara','Kiara@123','489cd5dbc708c7e541de4d7cd91ce6d0f1613573b7fc5b40d3942ccb9555cf35','9032342958','PES University, Bengaluru Dwaraka Nagar Banashankari,Boys hostel','trainer','2024-11-12 12:39:59'),(42,'Sara','sara@gmail.com','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','5554446688','East Blue','trainer','2024-11-12 19:17:44'),(43,'Sam','sam@gmail.com','e3e9fc033c2647b79bac54f75d0965c0715c6856e662fd02da8742100e5cda22','8885556662','West Blue','trainer','2024-11-12 19:24:19'),(45,'Mithun','deepu@gmail.com','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','2032342958','PES University, Bengaluru Dwaraka Nagar Banashankari,Boys hostel','admin','2024-11-13 10:26:09'),(47,'hriti','hritika@gmail.com','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','2339028346','PES University, Bengaluru Dwaraka Nagar Banashankari,Boys hostel','member','2024-11-13 10:51:35'),(50,'Sanji','sanji@gmail.com','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','5554446687','East Blue ','member','2024-11-14 10:53:43'),(51,'Shivarakshit','sanji123@gmail.com','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','9032342958','PES University, Bengaluru Dwaraka Nagar Banashankari,Boys hostel','member','2024-11-14 15:05:18');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-15  9:44:06
