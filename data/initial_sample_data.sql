-- MySQL dump 10.13  Distrib 8.0.19, for macos10.15 (x86_64)
--
-- Host: 127.0.0.1    Database: hf
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `Business`
--

DROP TABLE IF EXISTS `Business`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Business` (
  `id` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `address_1` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `address_2` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `province` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `created_ts` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `owner_id` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `zipcode` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `alias_UNIQUE` (`alias`),
  KEY `fk_Business_Owner_idx` (`owner_id`),
  KEY `business_city` (`city`),
  KEY `business_province` (`province`),
  KEY `business_country` (`country`),
  KEY `business_created_ts` (`created_ts`),
  KEY `business_zipcode` (`zipcode`),
  FULLTEXT KEY `business_addr1` (`address_1`),
  CONSTRAINT `fk_Business_Owner` FOREIGN KEY (`owner_id`) REFERENCES `Owner` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Business`
--

LOCK TABLES `Business` WRITE;
/*!40000 ALTER TABLE `Business` DISABLE KEYS */;
INSERT INTO `Business` VALUES ('1d3c1ec1-b7bf-4685-8adf-bbcd7577df72','dejozone','不能說的秘密','Suite 309','Shanghai','Hanzou','China',NULL,'842eb618-e3bc-4580-bc70-01f3e743a238',NULL,'dejozone'),('6bfc727d-b7d8-47dd-9c8a-a85bf3940311','Haitek Consulting','617 N 6th St',NULL,'Philadelphia','PA','USA',NULL,'842eb618-e3bc-4580-bc70-01f3e743a238','19123','haitekconsulting'),('d467402a-364f-4015-93c9-526a7e6e22fa','Pretoria Salon & Spa','2200 Benjamin Franklin Pkwy','S0Z02','Philadelphia','PA','USA',NULL,'ba53afa5-8638-43ff-a8b9-743d8f91b8e1','19130','pretoriasalonspa');
/*!40000 ALTER TABLE `Business` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Category`
--

DROP TABLE IF EXISTS `Category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Category` (
  `id` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `desc` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  FULLTEXT KEY `category_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Category`
--

LOCK TABLES `Category` WRITE;
/*!40000 ALTER TABLE `Category` DISABLE KEYS */;
INSERT INTO `Category` VALUES ('22ab38bc-71c0-438f-a1ac-3fa0d4213d8f','Service',NULL),('8fdd15ad-785c-4d87-8f78-3021afaba95f','Environment',NULL),('9c3d6209-30e1-474e-8c1a-975ea1273e07','Price',NULL),('c06077d1-a248-418f-899b-bffa2eaa0738','Quality',NULL);
/*!40000 ALTER TABLE `Category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Owner`
--

DROP TABLE IF EXISTS `Owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Owner` (
  `id` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `contact_email` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `contact_phone` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `joined_ts` datetime DEFAULT NULL,
  `left_ts` datetime DEFAULT NULL,
  `username` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `owner_f_name` (`first_name`),
  KEY `owner_status` (`status`),
  KEY `owner_joined_ts` (`joined_ts`),
  KEY `owner_left_ts` (`left_ts`),
  FULLTEXT KEY `owner_l_name` (`last_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Owner`
--

LOCK TABLES `Owner` WRITE;
/*!40000 ALTER TABLE `Owner` DISABLE KEYS */;
INSERT INTO `Owner` VALUES ('842eb618-e3bc-4580-bc70-01f3e743a238','Hai','Thai','A','haitek.consulting@gmail.com','160968544080',NULL,NULL,'haitek.consulting@gmail.com'),('ba53afa5-8638-43ff-a8b9-743d8f91b8e1','Hang','Dinh','A','pretoriasalonspa@gmail,com','12156088171',NULL,NULL,'pretoriasalonspa@gmail,com');
/*!40000 ALTER TABLE `Owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rating`
--

DROP TABLE IF EXISTS `Rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Rating` (
  `id` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `value` int NOT NULL,
  `desc` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `value_UNIQUE` (`value`),
  KEY `rating_value` (`value`),
  FULLTEXT KEY `rating_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rating`
--

LOCK TABLES `Rating` WRITE;
/*!40000 ALTER TABLE `Rating` DISABLE KEYS */;
INSERT INTO `Rating` VALUES ('2344ac49-bb5a-44df-b716-36d32db2c5f2','Rating 2',2,NULL),('4174fd8d-e4a5-42eb-8bbb-4be373967691','Rating 5',5,NULL),('7071d5e9-c1ed-4479-87c3-f48313155d5e','Rating 10',10,NULL),('76781f4e-4529-4b9a-81ad-4d7c9b59ad73','Rating 1',1,NULL),('8baa3e6f-f669-43af-bb90-93f25135dd20','Rating 3',3,NULL),('a4a52d20-018d-4ed2-ac3b-b5a2865391e3','Rating 4',4,NULL),('b5411e5f-bfe3-4f94-97ff-20a92f59879b','Rating 7',7,NULL),('bf8b9a1e-0403-436b-a888-11bce76b6246','Rating 8',8,NULL),('d9268ebd-1672-4e73-958f-1830788a9bdb','Rating 9',9,NULL),('fc760bf4-28de-4345-949c-9a75f9ad46bc','Rating 6',6,NULL);
/*!40000 ALTER TABLE `Rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Submission`
--

DROP TABLE IF EXISTS `Submission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Submission` (
  `id` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `comments` varchar(280) COLLATE utf8_unicode_ci DEFAULT NULL,
  `submitted_ts` datetime NOT NULL,
  `business_id` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `rating_id` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_Submission_Business1_idx` (`business_id`),
  KEY `fk_Submission_Category1_idx` (`category_id`),
  KEY `fk_Submission_Rating1_idx` (`rating_id`),
  KEY `submission_created_ts` (`submitted_ts`),
  KEY `fk_Submission_User1_idx` (`user_id`),
  FULLTEXT KEY `business_comments` (`comments`),
  CONSTRAINT `fk_Submission_Business1` FOREIGN KEY (`business_id`) REFERENCES `Business` (`id`),
  CONSTRAINT `fk_Submission_Category1` FOREIGN KEY (`category_id`) REFERENCES `Category` (`id`),
  CONSTRAINT `fk_Submission_Rating1` FOREIGN KEY (`rating_id`) REFERENCES `Rating` (`id`),
  CONSTRAINT `fk_Submission_User1` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Submission`
--

LOCK TABLES `Submission` WRITE;
/*!40000 ALTER TABLE `Submission` DISABLE KEYS */;
INSERT INTO `Submission` VALUES ('09954955-22ef-4605-b568-ecbb3f2d431e','ihi ehihei hiehie','2020-05-29 17:39:57','1d3c1ec1-b7bf-4685-8adf-bbcd7577df72','9c3d6209-30e1-474e-8c1a-975ea1273e07','b5411e5f-bfe3-4f94-97ff-20a92f59879b','bd1083fa-6c3d-47f2-af3f-37d35efba1d5'),('2772ba4b-6c0e-470b-9e28-43cd2f01cf45',NULL,'2020-05-29 17:39:57','1d3c1ec1-b7bf-4685-8adf-bbcd7577df72','c06077d1-a248-418f-899b-bffa2eaa0738','7071d5e9-c1ed-4479-87c3-f48313155d5e','bd1083fa-6c3d-47f2-af3f-37d35efba1d5'),('36bde947-646b-4ceb-b092-5e912100432f','hiehif hiheihee','2020-03-10 10:23:45','d467402a-364f-4015-93c9-526a7e6e22fa','22ab38bc-71c0-438f-a1ac-3fa0d4213d8f','d9268ebd-1672-4e73-958f-1830788a9bdb','bd1083fa-6c3d-47f2-af3f-37d35efba1d5'),('8cc9a151-eb48-4add-9e0a-5a3a7eccda2f','heh hiheih wihjd','2020-03-10 10:23:45','d467402a-364f-4015-93c9-526a7e6e22fa','8fdd15ad-785c-4d87-8f78-3021afaba95f','b5411e5f-bfe3-4f94-97ff-20a92f59879b','bd1083fa-6c3d-47f2-af3f-37d35efba1d5'),('a7036b77-98b4-4627-bd28-996bd1e02e21','ihei hiehie hwiwbd hee','2020-03-10 10:23:45','d467402a-364f-4015-93c9-526a7e6e22fa','9c3d6209-30e1-474e-8c1a-975ea1273e07','bf8b9a1e-0403-436b-a888-11bce76b6246','bd1083fa-6c3d-47f2-af3f-37d35efba1d5'),('af4f8274-6f42-4342-8d5c-fa1ea26e667a','hfiheff','2020-03-10 10:23:45','d467402a-364f-4015-93c9-526a7e6e22fa','c06077d1-a248-418f-899b-bffa2eaa0738','d9268ebd-1672-4e73-958f-1830788a9bdb','bd1083fa-6c3d-47f2-af3f-37d35efba1d5'),('ed40b1d0-9691-455f-bebe-525d34d45a25','iheiu hiheiye wuhguw ehhgee','2020-05-29 17:39:57','1d3c1ec1-b7bf-4685-8adf-bbcd7577df72','22ab38bc-71c0-438f-a1ac-3fa0d4213d8f','2344ac49-bb5a-44df-b716-36d32db2c5f2','bd1083fa-6c3d-47f2-af3f-37d35efba1d5'),('f6a3bab7-c07c-4001-adf5-c362f86d4b12','test test','2020-05-29 17:39:57','1d3c1ec1-b7bf-4685-8adf-bbcd7577df72','8fdd15ad-785c-4d87-8f78-3021afaba95f','7071d5e9-c1ed-4479-87c3-f48313155d5e','bd1083fa-6c3d-47f2-af3f-37d35efba1d5');
/*!40000 ALTER TABLE `Submission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User` (
  `id` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `identifier` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_ts` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `identifier_UNIQUE` (`identifier`),
  KEY `user_created_ts` (`created_ts`),
  FULLTEXT KEY `user_identifier_text` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES ('bd1083fa-6c3d-47f2-af3f-37d35efba1d5',NULL,'2020-05-29 17:35:14');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-29 18:50:35
