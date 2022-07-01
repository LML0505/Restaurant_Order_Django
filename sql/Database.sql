CREATE DATABASE  IF NOT EXISTS `webdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `webdb`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: webdb
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'type of dish id',
  `name` varchar(50) DEFAULT NULL COMMENT 'name',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT 'status：1normal 9delete',
  `create_at` datetime DEFAULT NULL COMMENT 'addtime',
  `update_at` datetime DEFAULT NULL COMMENT 'changetime',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'combo',1,'2021-07-25 10:20:30','2022-05-09 09:49:43'),(2,'beef combo',9,'2022-03-25 10:20:30','2022-04-27 06:48:47'),(3,'side dish',1,'2021-02-25 10:20:30','2021-07-25 10:20:30'),(4,'drinks',1,'2021-06-25 10:20:30','2022-04-27 06:31:55'),(5,'hamburger',9,'2021-05-25 10:20:30','2022-04-27 06:48:34'),(6,'Pasta Combo',1,'2022-04-27 06:05:45','2022-04-27 06:30:04'),(7,'pasta',1,'2022-04-29 08:15:33','2022-04-29 08:15:33');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL COMMENT 'email',
  `creditcard` varchar(255) NOT NULL COMMENT 'creditcard',
  `mobile` varchar(50) NOT NULL COMMENT 'phone',
  `status` tinyint unsigned NOT NULL DEFAULT '1' COMMENT 'status:1normal/2baned/9delete',
  `create_at` datetime DEFAULT NULL COMMENT 'add time ',
  `update_at` datetime DEFAULT NULL COMMENT 'change time',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (6,'lml123','5123','88944787',1,'2022-05-01 04:13:37','2022-05-01 04:13:37'),(8,'lml123123','5123455','93358349',1,'2022-05-01 04:15:38','2022-05-01 04:15:38'),(10,'zlsawe','6578','12345678',1,'2022-05-01 04:19:23','2022-05-01 04:19:23'),(11,'mayilin123','5667892','936215',1,'2022-05-01 04:21:03','2022-05-01 04:21:03'),(16,'lml44','123425','123452',1,'2022-05-01 07:47:05','2022-05-01 07:47:05'),(19,'lml123','c123456','88944787',1,'2022-05-08 14:46:40','2022-05-08 14:46:40'),(20,'lml05051207@gmail.com','5667892123','93358349',1,'2022-05-08 14:54:25','2022-05-08 14:54:25'),(21,'lml05051207@gmail.com','5667892','123452',1,'2022-05-08 14:56:20','2022-05-08 14:56:20'),(22,'lml05051207@gmail.com','5123','93358349',1,'2022-05-08 14:57:07','2022-05-08 14:57:07'),(23,'lml05051207@gmail.com','5667892','123452',1,'2022-05-08 15:25:35','2022-05-08 15:25:35'),(24,'lml05051207@gmail.com','5123455','936215',1,'2022-05-08 15:27:57','2022-05-08 15:27:57'),(25,'lml05051207@gmail.com','c123456','123452',1,'2022-05-08 15:29:07','2022-05-08 15:29:07'),(26,'lml05051207@gmail.com','5123','12345678',1,'2022-05-08 15:32:18','2022-05-08 15:32:18'),(27,'lml05051207@gmail.com','c123456','93358349',1,'2022-05-08 15:35:26','2022-05-08 15:35:26'),(28,'lml05051207@gmail.com','5667892123','936215',1,'2022-05-08 15:42:41','2022-05-08 15:42:41'),(29,'lml05051207@gmail.com','123425','93358349',1,'2022-05-08 15:50:16','2022-05-08 15:50:16'),(30,'lml1234','','8888',1,'2022-05-08 16:18:07','2022-05-08 16:18:07'),(31,'lml05051207@gmail.com','5667892123','93358349',1,'2022-05-08 16:29:43','2022-05-08 16:29:43'),(32,'lml05051207@gmail.com','5667892123','123456',1,'2022-05-08 16:31:11','2022-05-08 16:31:11'),(33,'lml05051207@gmail.com','','936215',1,'2022-05-08 16:32:37','2022-05-08 16:32:37'),(34,'lml05051207@gmail.com','','88944787',1,'2022-05-08 16:33:14','2022-05-08 16:33:14'),(35,'lml05051207@gmail.com','','15334085207',1,'2022-05-08 16:34:57','2022-05-08 16:34:57'),(36,'lml05051207@gmail.com','','88944787',1,'2022-05-08 16:36:28','2022-05-08 16:36:28'),(37,'lml05051207@gmail.com','','1234567',1,'2022-05-08 16:42:25','2022-05-08 16:42:25'),(38,'lml05051207@gmail.com','c123456','123452',1,'2022-05-08 16:56:36','2022-05-08 16:56:36'),(39,'lml05051207@gmail.com','5667892','123456',1,'2022-05-08 16:57:32','2022-05-08 16:57:32'),(40,'test2@gmail.com','testcard1','88889978',1,'2022-05-08 17:02:23','2022-05-08 17:02:23'),(41,'testcase@gmail','Testcredit','88877766',1,'2022-05-08 17:05:52','2022-05-08 17:05:52'),(42,'Test@gmail.com','Testcredit','88822211',1,'2022-05-08 17:07:02','2022-05-08 17:07:02'),(43,'Tews@gmail.com','Testing ','2313143',1,'2022-05-08 17:07:02','2022-05-08 17:07:02'),(44,'Testing@gmail.com','Testing1','89743583',1,'2022-05-22 16:57:32','2022-05-22 16:57:32'),(45,'Testing1@gmail.com','Testing2','8374247',1,'2022-05-22 16:57:32','2022-05-22 16:57:32'),(46,'Testing2@gmail.com','Testing3','83742213',1,'2022-05-22 16:57:32','2022-05-22 16:57:32'),(47,'Testing3@gmail.com','Testing4','1238814',1,'2022-05-22 16:57:32','2022-05-22 16:57:32'),(48,'Testing4@gmail.com','Testing5','232424',1,'2022-05-22 16:57:32','2022-05-22 16:57:32'),(49,'Testing5@gmail.com','Testing6','8465784',1,'2022-05-22 16:12:11','2022-05-22 16:34:13'),(50,'Testing6@gmail.com','Testing7','763642',1,'2022-05-27 16:32:37','2022-05-27 16:32:37'),(51,'Testing7@gmai.com','Testing8','3333333',1,'2022-05-27 16:32:37','2022-05-27 16:32:37'),(52,'Testing8@gmail.com','Testing9','345353',1,'2022-05-27 16:32:37','2022-05-27 16:32:37'),(53,'Testing9@gmail.com','Testing10','934823',1,'2022-05-27 16:32:37','2022-05-27 16:32:37'),(54,'Testing10@gmail.com','Testing11','3764742',1,'2022-05-27 19:32:40','2022-05-27 19:32:48'),(55,'Testing11@gmail.com','Testing12','2124342',1,'2022-05-27 16:32:37','2022-05-27 16:32:37'),(56,'Testing12@gmail.com','Testing13','21241',1,'2022-05-27 16:32:37','2022-05-27 16:32:37'),(57,'Testing13@gmail.com','	Testing14','1231',1,'2022-05-27 16:32:37','2022-05-27 16:32:37'),(58,'Testing14@gmail.com','	Testing15','27347',1,'2022-05-27 16:32:37','2022-05-27 16:32:37'),(59,'Testing15@gmail.com','	Testing16','878237',1,'2022-05-27 16:32:37','2022-05-27 16:32:37'),(60,'Testing16@gmail.com','	Testing17','198231',1,'2022-05-27 16:32:37','2022-05-27 16:32:37'),(61,'Testing17@gmail.com','	Testing18','123322',1,'2022-05-27 16:32:37','2022-05-27 16:32:37'),(62,'Testing18@gmail.com','	Testing19','8767516',1,'2022-05-27 16:32:37','2022-05-27 16:32:37'),(63,'Testing19@gmail.com','	Testing20','238723',1,'2022-05-27 16:32:37','2022-05-27 16:32:37'),(64,'Testing20@gmail.com','	Testing21','12133',1,'2022-05-27 16:32:37','2022-05-27 16:32:37'),(65,'Cust1@gmail.com','	Testing22','34252',1,'2022-05-27 16:32:37','2022-05-27 16:32:37'),(66,'Cust2@gmail.com','	Testing23','21214',1,'2022-05-27 16:32:37','2022-05-27 16:32:37'),(67,'Cust3@gmail.com','	Testing24','13213',1,'2022-05-27 16:32:37','2022-05-27 16:32:37'),(68,'Cust4@gmail.com','	Testing25','123131',1,'2022-05-27 16:32:37','2022-05-27 16:32:37'),(69,'Cust5@gmail.com','	Testing26','5635656',1,'2022-05-27 16:32:37','2022-05-27 16:32:37'),(70,'Cust6@gmail.com','	Testing27','265626',1,'2022-05-27 16:32:37','2022-05-27 16:32:37'),(71,'Cust7@gmail.com','	Testing28','23464564',1,'2022-05-27 16:32:37','2022-05-27 16:32:37'),(72,'Cust8@gmail.com','	Testing29','257657',1,'2022-05-27 16:32:37','2022-05-27 16:32:37'),(73,'Cust9@gmail.com','	Testing30','788765',1,'2022-05-27 16:32:37','2022-05-27 16:32:37'),(74,'Cust10@gmail.com','	Testing31','5636573',1,'2022-05-27 16:32:37','2022-05-27 16:32:37'),(75,'Cust11@gmail.com','	Testing32','8674447',1,'2022-05-27 16:32:37','2022-05-27 16:32:37'),(76,'Cust12@gmail.com','	Testing33','123453',1,'2022-05-27 16:32:37','2022-05-27 16:32:37'),(77,'Cust13@gmail.com','	Testing34','79789686',1,'2022-05-27 16:32:37','2022-05-27 16:32:37'),(78,'Cust14@gmail.com','	Testing35','62456468',1,'2022-05-27 16:32:37','2022-05-27 16:32:37'),(79,'Cust15@gmail.com','	Testing36','5878578',1,'2022-05-27 16:32:37','2022-05-27 16:32:37'),(80,'Cust16@gmail.com','	Testing37','345252',1,'2022-05-27 16:32:37','2022-05-27 16:32:37'),(81,'Cust17@gmail.com','	Testing38','654656674',1,'2022-05-27 16:32:37','2022-05-27 16:32:37'),(82,'Cust18@gmail.com','	Testing39','1435345',1,'2022-05-27 16:32:37','2022-05-27 16:32:37'),(83,'Cust19@gmail.com','	Testing40','564757',1,'2022-05-27 16:32:37','2022-05-27 16:32:37'),(84,'Cust20@gmail.com','	Testing41','866473',1,'2022-05-27 16:32:37','2022-05-27 16:32:37'),(85,'Cust21@gmail.com','	Testing42','3656532',1,'2022-05-27 16:32:37','2022-05-27 16:32:37'),(86,'Cust22@gmail.com','	Testing43','74567472',1,'2022-05-27 16:32:37','2022-05-27 16:32:37'),(87,'Cust23@gmail.com','	Testing44','25642642',1,'2022-05-27 16:32:37','2022-05-27 16:32:37'),(88,'Cust24@gmail.com','	Testing45','8476464',1,'2022-05-27 16:32:37','2022-05-27 16:32:37'),(89,'Cust25@gmail.com','	Testing46','2656767',1,'2022-05-27 16:32:37','2022-05-27 16:32:37'),(90,'Cust26@gmail.com','	Testing47','224554',1,'2022-05-27 16:32:37','2022-05-27 16:32:37'),(91,'Cust27@gmail.com','	Testing48','7878689',1,'2022-05-27 16:32:37','2022-05-27 16:32:37'),(92,'Cust28@gmail.com','	Testing49','9762454',1,'2022-05-27 16:32:37','2022-05-27 16:32:37'),(93,'Cust30@gmail.com','	Testing50','3425453',1,'2022-05-27 16:32:37','2022-05-27 16:32:37'),(94,'Cust31@gmail.com','	Testing51','3532545',1,'2022-05-27 16:32:37','2022-05-27 16:32:37'),(95,'Cust32@gmail.com','	Testing52','6546747',1,'2022-05-27 16:32:37','2022-05-27 16:32:37'),(96,'Cust33@gmail.com','	Testing53','5635145',1,'2022-05-27 16:32:37','2022-05-27 16:32:37'),(97,'Cust34@gmail.com','	Testing54','1423435',1,'2022-05-27 16:32:37','2022-05-27 16:32:37'),(99,'Cust35@gmail.com','	Testing55','7864674',1,'2022-05-27 16:32:37','2022-05-27 16:32:37'),(100,'Cust36@gmail.com','	Testing56','9896785',1,'2022-05-27 16:32:37','2022-05-27 16:32:37'),(101,'Cust37@gmail.com','	Testing57','353542542',1,'2022-05-27 16:32:37','2022-05-27 16:32:37'),(102,'Cust38@gmail.com','	Testing58','6455757',1,'2022-05-27 16:32:37','2022-05-27 16:32:37'),(103,'Cust39@gmail.com','	Testing59','2412314',1,'2022-05-27 16:32:37','2022-05-27 16:32:37'),(104,'Cust40@gmail.com','	Testing60','12312313',1,'2022-05-27 16:32:37','2022-05-27 16:32:37'),(105,'Cust41@gmail.com','	Testing61','4345636',1,'2022-05-27 16:32:37','2022-05-27 16:32:37');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('58jbl5pa2y9095i0x795b049ol076uy7','.eJzVmtuOozgQhl8FcbUr9SCfsbndF9j71arlgDthG0KEYUetUb_7FqTjGIcE0leLNGppeirwVfmvgyvzK_7XtOXbR94UJs5iLrGMX-Jcd2bftB9Vabs4-xXj4UdZxBl-iY-6Hizzpt41YHoqCxtnf53_mV0_-vplnjfwgtdTmcNnsOAY81QonEgmGZPJ6biPr488lPm7OUa7vt2bNvpZdoforWyNjfSxiPKm0sP72jIHY8IT9BLbTne9Pb-nNfDmVw28MUGE_EDsB5ERZhmHPxg-2Z-KhxafL2cniFz0giCpUsEThhkTWE3dsLq3em8iF6EzMZaLxPwHUhFSGVPg3yzx1MIRq1XEcLaJUJIIGsbdGAu8X-EPuEm6mpujbJTPfe6zxYWbonXcDCcK9CIomQU_6PpLMtZ0Hjh6BpzNS2Rq4cDTFeAKSSESxonCJFR600KcAaeObNOfrsxqHTJGGUozJu4jOwuHvEbVgKx4ojCVGE-JzX4f1fqjiayudDENNF6pkIFJZviBsp2Fo16jbIUUZolCjBISYO_bsqpuFE2e4aVsiRcsPv_-fInppUrSay0oCxMVpT2ElZIHftHbSkmwgvNImJRYBG7t-q4DuQ8yurrF1lREEDMEGGdsPk-nFpdTEOtgGagXYZXKME3b0p4-LvXlCizWAxOocY-BRwsnG7xIPBYWoRKiJOVsCqz3VdlEDfzwRL5SNEOtwBmap51aOFq6glahlA5tE2Op1HzfHFPTI15Z_wYRcwjZY5mPFo44bPR3iEEJaGiUMiBu-6Gb3wA_kZcCsvgx8GjhgJfzbax-CDoNFZLfNpq3G1r8DO2j9uIsHO1ywo20DCWMYSVYUB7KTlelPkZNbSoDleJ7IU6hgy41GLC4QLOwmc9Dq5QkXAgZdMS3Jtd5XurvoaqMLqhhtHCoq9SAiUoTrGDGC8JrO2jcpojq3lpTWQ95eSi9AA1TZ_oQ-WwxNhZ2aSzMMRRteXy3YVcJyx67LdSIQXunScrgJMKhpNK_2VpX1e9Xl-iaGp0OFZhBhaD3arRn4YbWVaw85SAXLvBNSg60cAplX3u4q24FIwwnGb87idDxAHCGvflpFa6A2QJ6IRtUfotbaZhSPdrlucnR0ozNK9zdYSgU_KvCl5UwKBwjkXAuuUQq-Wl2pytvZermGIHQn4mtky5emk3PFo52WQsjrYKOxuEeQFTyz8n4GQmInfmGeB3PGL2HxNP4LsthrCBQEbCkKRfzwN_Qr8dDH0_SZwtHHLbsO8QMBCwoStk88fMS9uoZelykzxZjxROXiiccwJ8aXhP9Mbd2CG9jYmY-JQh8S1KRqmH9MPXtHR4W1UZXT5VyN3ryjMzfEaYWrpKEar_FHYZTBQhAnYaX3q6pdddEeQWXx9MYk-B6Q5-aVO8XQc9iPJP0ciapYxnfH55GeNFM508DZkOBGFeBe9bot6YpIvfo1dOWi_bd2XBqAU59Ds9vij7vLpsuv9Vud5UFHH0NzwL_iLx4tJ29lo-vHP7GllyeExS5zcDWNl6-F64AbGj95fO7TNjWLsx3wWXDVhZjHjy_sG9i9-WB-8PINvZgvmTcdzfbWIr56NeF6mY2ZD6-myU2tC6LqUvTbezM_IC7RN3YAi1mbkDYwBbNizhzYtnQSs3j97_X_t8vzvyp2A3F21ii-UnqfUm2iYVazJxKtrFV8_PTCWU7KzYf34llO_s2H_-6TNjM8m265tnAVs0vLU7tG1yxeX64e-pmNmkArYu6PPbWtK6lwkQw_P2LBi7MZVUOt54jzOLulwOXtvZn0xavB20PwwUvLVjOhd7xnNNdLlNCih3VCueFIRwV_kdgvhygYK6Aa0t8dUvccUtEiI3Qd6-AYJEOqcyH__4QH0rbQfRdu4W8hQGr6Y_d-dLNwaZrYFp8hcJuwA59_genaut7:1nuZGw:vrQk15vbD_5AMJn8lecJlfIOD6KY_-7XFYYi2rPOmZE','2022-06-10 12:40:54.496003'),('9amlobyfkvv2ztm02i6l9wnjzir3r98o','.eJyrVipJTMpJjc_LV7JSMlHSgXCVrKqVMlOUrMwMoALxIB5QvrYWAHswDuQ:1nnkNH:8Vu5O6NQMk3zNGunrqwM1yoHi3tZwQXN9vJh0FnmaB4','2022-05-22 17:07:15.757970'),('9ndrs0vr9ctl2mfwlvvsiyqp37el3lzh','.eJzVl8lu2zAQhl9F4KkFHIH7du0L9F4UBi0yMRNt0NLACPzuHdmRrSi2oasAXyj9HP4fh8ORP9C_0MTnQ1b5gCxilAu0Qc4Xsezb0CD7gaJHlogNGsalKwZZ4Q4xjyUoy5i9XR7CuHZt-141frt37R4e7pTnmZBuJzLBdplWlPodc4ZkPlCB_XRK6_IOphBqtDTwou1c17fIyg3KmuC6sHXDe4opfcL8icoEc0ukpRrEfe1vKpQlzAqNjhAEBC9Vc8hj2w1g5EIHHGeGbA88oUyyqthVg7fowcCfs4xfQ2w_p2UVbN-2jtngWwpChJKGpJprznValy_oW-hd37yEJnmP3T55jk1oE1d6WDA_bV8TMxBTkeIrP7nDrxPCrYAfucc_URz_wg6wkZhdbLXRh8RHSNaMVsxo2XdaSozBOuVaE0m-0u76rgPKrGrKKxZfQmUSrC0hlt_N6kRx3JzNymVmuUkxJkZpOstNE9v6kHym6GpYLjdMLTWPDZ8UpzTwMQ384sA3sXxr5zkgMyz-HQtzQxhLFcdGzaDgSP1oC5fnP69EbAmRGvxyYRm7RzRRjCmgi7wKJVIhhSRinoLBbRF87IuJ3UV1cDIjqBXiod2zYrTLFtmVlKZwcrhRt-zmDkp54lYtd8ssp4-rllmCz8dFjsdFXpb_7WCZ5NetW0rNwOSNUqCYUJ4qqcxwW73WYUL2BsGSIrj8ykUWpeF8yoWl_HEdnBQnMDWCqcvq9QA2R9IzJHUbCapaYi7MLFVtcM9V5ZNL6E8oshwKeszdbE0UAHUc4le-z7qxy0yLfb3tA3z0BcQCPjECraJDTIxP62gd3WJifvqxsoKegOjodzV94cvX0Rp6w9cLdA2X_gbp0fFq7vTTH4dmvM5h1FWdy7dFVYYDsvj4HxAzumo:1nnx5K:Bf8dbXRiN151YKtKAOYW_ok8_dGYqrhPYrjeSTpsLOQ','2022-05-23 06:41:34.579541'),('fq006ps30n7cuapk7d081lo8tibpgwja','.eJxti8sOgyAQRX-lmbUmMAooP2NGhkZSH41gG2P89-Km6aLLe865B7z8Gu67W9iDBVNphAKIpzBv0a9gDwgMVqoCrj3TdGUT7WEMcy7n4B5fmPeTYnwvK3cDxSHD3nDtlKZeOVX1rjGI3FfUSsceleDfS6Qx5YvEttFtFjFR2iJYXYBbPSXf0eVRIJaiLlHfRG2lttjkeHvy38JYWVnVwHl-AO7nRac:1nk5tf:4QEp9g8DcP7p9ODpwwv0C43oyxnH6hLAWsssKap5KI4','2022-05-12 15:17:35.958782'),('mcztjnvz203ceaqwq39hgrfpmrp83ayy','eyJ2ZXJpZnljb2RlIjoiMDk0NCJ9:1nk5v7:-_TYWr1-LQTxO8oIgGkf2E3wps1wJIyaUMrnQMtqNHo','2022-05-12 15:19:05.762240'),('nt1xlhr0ecxbopajdbp8icjv3q2fhl43','.eJzVmduOqzYUhl8F-aqVspHP2Nz2BXpfVSMHPAndECIO3RpV8-5dJhMHCAlk7iyNIpFZgW_Zv9eJ_9C_tineP7I6tyhFUgiCdigznT3UzUdZtB1K_0PEfRQ5SskOnUzlLLO62tdgei7yFqV_Xf7Nbz99-zLPanjA27nI4DdECkJEIjWJFVecq_h8OqDbLY9F9tOeon3fHGwT_Sq6Y_ReNLaNzCmPsro07nlNkYExFTHeobYzXd9entNYePKbAV5EMaU_MP9BVUR4KuDPOdWf86cWn7uLE1StekGx0okUMSecS6KnbrSmb83BRn6FLsRErRKLH1hHWKdcg3-LxFMLT6w3EStAkFpRyebrbm0LvF_LP-OmyWZugcHLp9wXiys3w9u4OYk16EUyugh-NNWXZFrbjcDxK-B8WSJTCw-ebADXWEkZc0E1oXOl1w2sM-BUUVv35xuz3oZMcIqTlMvHyN7CI29RNSBrEWvCFCFTYns4RJX5qKPWlCafLjTZqBDHpFLyRNnewlNvUbbGmvBYY84onWEfmqIs7xRNX-FlfI0XLD7__twhdo2S7BYLitxGedEe55FSzPxi95GSEg37EXOliJy5te-7DuTuZHRzi2-JiCBmWGCS8uVzOrW47oLcBstBvZjoRM2PaVO0549rfLkBy-3AFGLcc-DBwsuGrBIPgUXqmGrFBJ8Cm0NZ1FENHyORbxSNixUkxcu0UwtPyzbQapwwlzYJUVov583haI6IN8Y_J2IBS_Zc5oOFJ54n-gfEoATsEqWaETe9y-Z3wC-cSwmn-DnwYOGB18_bEP0wZBomlbhPNO93tOQV2mfpxVt42vUDN9ByHHNOtOSz8FB0pizMKaorW1qIFN9b4gQy6FqCAYsrNJ8n82VondBYSKlmGfG9zkyWFeZ7qDplK2oYLDzqJjUQqpOYaKjxZsvbdpC4bR5Vfdvash0hrxelVyBXdSZPkS8WQ2Lh18TCPUPeFKef7TyrzMMevw_UmEN6Z3HCYSfmRUlpfmsrU5a_31xiW2J04iIwhwjBHsXokYUvWjexikSAXIQkd0fS0cIuFH01wt3UFQwwgqbiYSXChg0gKRnVT5twJdQWkAu5U_k9bmmgSh3RrtdNnpalfFnhvodhEPBvCl9XglM4wTIWQgmFdfzL7s833tJW9SkCob-ytl66ZK02vVh42nUtDLQaMpqAPoDq-J-zHZ9IQOzsN8TreYbVe0o8Xd91OQwRBCICUSwRchn4G_od8bDnlfTFwhPPU_YDYg4ClgwnfJn4dQmP4hl-HqQvFkPEk9eIJz3AnwYeE_2xNHaYd2NyoT6lGHyLE5loN36Y-vYTbhZV1pQvhXJfeoqULvcIUwsfSeZqv8d1xakGBKBO5k1vV1emq6OshObxPKzJrL1hL1Wqj4PgyGLYk-S6J4lnGZ4_3415o5ks7wbUhhJzoWfutda813Ue-Vtvrrb8aj-sDacW4NSnu3-d91l3nXSNU224oyzg6Cu4F_hH1dWjcOZaY3zt8YMbciGG_UQgvEkXYv7ABzXuQswrPrSZF2Je7cEMvnZIXJkDmWlNiosw5lqjgMj8u5hQhlyI3QajAU26EPO1QEDjLsT8cQxl5oWYP5CBDb4Q9wk-iOkX4l4cIY3AdpP3zwEMuBD1RWsoQ67Jy6sgBl2Ie1WEMu1C3AsjpJEX4l4cIc29EL8188EMv6ZjliCmWoh5VYc42toh3y8GM7kC6M7sS-s7L_b1xYCNBh1drk_1cA2XNdRGbxDm7AdKAcjkVXHqW9v41AoVgbv-8gYa36IsXFdzgprbf-n8Mm37q27yt6Npj65xS3KeCWn2IhNsn6mE0nzPjCZZbqnA-fgnUE86p6CugLYE3ZZFPlgWGWE-OP2wtQOLxB15MbR2x6LtYPd8-nWOZlndn7pLEy0-P_8H4IXSgQ:1no0VL:0rECfbq6mNkhusDeckNyJv0Ml1P8ahAFUB78XgGu8eg','2022-05-23 10:20:39.353632');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account_id` int NOT NULL,
  `login_time` datetime DEFAULT NULL,
  `logout_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
INSERT INTO `history` VALUES (10,16,'2022-05-08 06:12:39','2022-05-08 08:12:49'),(12,16,'2022-05-08 09:16:22','2022-05-08 10:16:39'),(13,16,'2022-05-08 06:21:16','2022-05-08 06:44:47'),(14,15,'2022-05-08 06:44:54','2022-05-08 06:44:58'),(15,16,'2022-05-08 06:45:04','2022-05-08 06:45:04'),(16,15,'2022-05-09 06:50:17','2022-05-09 06:50:17'),(17,16,'2022-05-09 09:45:56','2022-05-09 09:45:56'),(18,15,'2022-05-09 09:46:27','2022-05-09 09:46:27'),(19,15,'2022-05-09 09:47:23','2022-05-09 09:47:24'),(20,15,'2022-05-09 10:20:39','2022-05-09 10:20:39'),(21,17,'2022-05-16 08:35:39','2022-05-16 08:35:40'),(22,17,'2022-05-16 08:47:18','2022-05-16 08:47:18'),(23,17,'2022-05-18 04:05:46','2022-05-18 04:05:47'),(24,15,'2022-05-22 05:40:11','2022-05-22 05:40:11');
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'orderdetailid',
  `order_id` int unsigned DEFAULT NULL COMMENT 'ordid',
  `product_id` int unsigned DEFAULT NULL COMMENT 'dishid',
  `product_name` varchar(50) DEFAULT NULL COMMENT 'disname',
  `price` double(6,2) unsigned DEFAULT NULL COMMENT 'price',
  `quantity` int unsigned NOT NULL DEFAULT '1' COMMENT 'quantity',
  `status` tinyint unsigned NOT NULL DEFAULT '1' COMMENT 'status:1normal/9delete',
  `create_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=215 DEFAULT CHARSET=utf8mb3 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='orderdeatil';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (36,29,4,'chicken burger with fires and cola',25.00,3,1,'2022-05-01 10:15:40'),(37,30,4,'chicken burger with fires and cola',25.00,2,1,'2022-05-01 10:15:40'),(38,30,5,'butter corn',4.00,1,1,'2022-05-01 10:15:40'),(39,30,6,'crispy chicken',6.00,1,1,'2022-05-01 10:15:40'),(40,31,4,'chicken burger with fires and cola',25.00,2,1,'2022-05-01 10:15:40'),(41,31,5,'butter corn',4.00,1,1,'2022-05-01 10:15:40'),(42,31,6,'crispy chicken',6.00,1,1,'2022-05-01 10:15:40'),(43,32,4,'chicken burger with fires and cola',25.00,1,1,'2022-05-01 10:15:40'),(44,32,6,'crispy chicken',6.00,1,1,'2022-05-01 10:15:40'),(45,33,4,'chicken burger with fires and cola',25.00,1,1,'2022-05-01 10:15:40'),(46,33,5,'butter corn',4.00,1,1,'2022-05-01 10:15:40'),(47,33,1,'cola(small)',3.00,1,1,'2022-05-01 10:15:40'),(48,34,4,'chicken burger with fires and cola',25.00,1,1,'2022-05-08 10:15:40'),(49,35,4,'chicken burger with fires and cola',25.00,1,1,'2022-05-08 10:15:40'),(50,36,4,'chicken burger with fires and cola',25.00,1,1,'2022-05-08 10:15:40'),(51,37,4,'chicken burger with fires and cola',25.00,1,1,'2022-05-08 10:15:40'),(52,38,4,'chicken burger with fires and cola',25.00,1,1,'2022-05-08 10:15:40'),(53,39,4,'chicken burger with fires and cola',25.00,1,1,'2022-05-08 10:15:40'),(54,40,4,'chicken burger with fires and cola',25.00,1,1,'2022-05-08 10:15:40'),(55,41,4,'chicken burger with fires and cola',25.00,1,1,'2022-05-08 10:15:40'),(56,42,4,'chicken burger with fires and cola',25.00,1,1,'2022-05-08 10:15:40'),(57,43,4,'chicken burger with fires and cola',25.00,1,1,'2022-05-08 10:15:40'),(58,44,4,'chicken burger with fires and cola',25.00,1,1,'2022-05-08 10:15:40'),(59,45,4,'chicken burger with fires and cola',25.00,2,1,'2022-05-08 10:15:40'),(60,45,5,'butter corn',4.00,1,1,'2022-05-08 10:15:40'),(61,46,4,'chicken burger with fires and cola',25.00,4,1,'2022-05-08 10:15:40'),(62,46,5,'butter corn',4.00,2,1,'2022-05-08 10:15:40'),(63,46,6,'crispy chicken',6.00,2,1,'2022-05-08 10:15:40'),(64,46,2,'cola(medium)',5.00,1,1,'2022-05-08 10:15:40'),(65,47,4,'chicken burger with fires and cola',25.00,1,1,'2022-05-08 10:15:40'),(66,47,1,'cola(small)',3.00,1,1,'2022-05-02 10:15:40'),(67,47,2,'cola(medium)',5.00,1,1,'2022-05-02 10:15:40'),(68,47,7,'kids meal',15.00,1,1,'2022-05-02 10:15:40'),(69,48,4,'chicken burger with fires and cola',25.00,1,1,'2022-05-02 10:15:40'),(70,48,1,'cola(small)',3.00,1,1,'2022-05-02 10:15:40'),(71,48,2,'cola(medium)',5.00,1,1,'2022-05-02 10:15:40'),(72,49,4,'chicken burger with fires and cola',25.00,1,1,'2022-05-02 10:15:40'),(73,49,2,'cola(medium)',5.00,1,1,'2022-05-02 10:15:40'),(74,49,3,'cola(large)',7.00,1,1,'2022-05-02 10:15:40'),(75,50,4,'chicken burger with fires and cola',25.00,1,1,'2022-05-02 10:15:40'),(76,51,4,'chicken burger with fires and cola',25.00,2,1,'2022-05-02 10:15:40'),(77,51,2,'cola(medium)',5.00,1,1,'2022-05-02 10:15:40'),(78,52,4,'chicken burger with fires and cola',25.00,1,1,'2022-05-02 10:15:40'),(79,52,3,'cola(large)',7.00,1,1,'2022-05-02 10:15:40'),(80,53,4,'chicken burger with fires and cola',25.00,1,1,'2022-05-02 10:15:40'),(81,53,5,'butter corn',4.00,1,1,'2022-05-02 10:15:40'),(82,54,4,'chicken burger with fires and cola',25.00,1,1,'2022-05-02 10:15:40'),(83,54,1,'cola(small)',3.00,1,1,'2022-05-02 10:15:40'),(84,55,4,'chicken burger with fires and cola',25.00,1,1,'2022-05-02 10:15:40'),(85,55,2,'cola(medium)',5.00,1,1,'2022-05-02 10:15:40'),(86,56,4,'chicken burger with fires and cola',25.00,1,1,'2022-05-02 10:15:40'),(87,56,5,'butter corn',4.00,1,1,'2022-05-02 10:15:40'),(88,56,7,'kids meal',15.00,1,1,'2022-05-02 10:15:40'),(89,57,4,'chicken burger with fires and cola',25.00,1,1,'2022-05-02 10:15:40'),(90,57,5,'butter corn',4.00,1,1,'2022-05-02 10:15:40'),(91,57,7,'kids meal',15.00,1,1,'2022-05-02 10:15:40'),(92,58,4,'chicken burger with fires and cola',25.00,2,1,'2022-05-02 10:15:40'),(93,58,5,'butter corn',4.00,1,1,'2022-05-02 10:15:40'),(94,58,7,'kids meal',15.00,2,1,'2022-05-02 10:15:40'),(95,59,4,'chicken burger with fires and cola',25.00,1,1,'2022-05-02 10:15:40'),(96,59,1,'cola(small)',3.00,1,1,'2022-05-02 10:15:40'),(97,59,3,'cola(large)',7.00,1,1,'2022-05-02 10:15:40'),(98,60,4,'chicken burger with fires and cola',25.00,1,1,'2022-05-02 10:15:40'),(99,60,1,'cola(small)',3.00,1,1,'2022-05-01 10:15:40'),(100,61,4,'chicken burger with fires and cola',25.00,2,1,'2022-05-01 10:15:40'),(101,61,1,'cola(small)',3.00,1,1,'2022-05-01 10:15:40'),(102,62,4,'chicken burger with fires and cola',25.00,1,1,'2022-05-01 10:15:40'),(103,62,1,'cola(small)',3.00,1,1,'2022-05-08 10:15:40'),(104,63,4,'chicken burger with fires and cola',25.00,1,1,'2022-05-08 10:15:40'),(105,63,1,'cola(small)',3.00,1,1,'2022-05-08 10:15:40'),(106,64,4,'chicken burger with fires and cola',25.00,1,1,'2022-05-08 10:15:40'),(107,64,1,'cola(small)',3.00,1,1,'2022-05-08 10:15:40'),(108,65,4,'chicken burger with fires and cola',25.00,1,1,'2022-05-08 10:15:40'),(109,65,5,'butter corn',4.00,1,1,'2022-05-08 10:15:40'),(110,65,6,'crispy chicken',6.00,1,1,'2022-05-08 10:15:40'),(111,66,4,'chicken burger with fires and cola',25.00,1,1,'2022-05-08 10:15:40'),(112,66,1,'cola(small)',3.00,1,1,'2022-05-08 10:15:40'),(113,66,2,'cola(medium)',5.00,1,1,'2022-05-08 10:15:40'),(114,67,4,'chicken burger with fires and cola',25.00,1,1,'2022-05-08 10:15:40'),(115,67,2,'cola(medium)',5.00,1,1,'2022-05-08 10:15:40'),(116,68,4,'chicken burger with fires and cola',25.00,2,1,'2022-05-08 10:15:40'),(117,68,5,'butter corn',4.00,1,1,'2022-05-08 10:15:40'),(118,68,6,'crispy chicken',6.00,1,1,'2022-05-08 10:15:40'),(119,69,4,'chicken burger with fires and cola',25.00,1,1,'2022-05-08 10:15:40'),(120,69,7,'kids meal',15.00,1,1,'2022-05-08 10:15:40'),(121,70,4,'chicken burger with fires and cola',25.00,1,1,'2022-05-09 10:15:40'),(122,70,28,'sausage combo',18.00,1,1,'2022-05-09 10:15:40'),(123,70,6,'crispy chicken',6.00,1,1,'2022-05-09 10:15:40'),(124,71,4,'chicken burger with fires and cola',25.00,1,1,'2022-05-27 12:28:38'),(125,72,37,'corn cream soup',9.00,1,1,'2022-05-27 12:29:15'),(126,72,38,'egg mayo salad set',17.00,1,1,'2022-05-27 12:29:15'),(127,72,31,'aglio olio',12.00,1,1,'2022-05-27 12:29:15'),(128,73,40,'focaccia',12.00,1,1,'2022-05-27 12:31:00'),(129,73,36,'italian omelette',12.00,1,1,'2022-05-27 12:31:00'),(130,73,30,'cheese hamburger set',20.00,1,1,'2022-05-27 12:31:00'),(131,73,5,'butter corn',4.00,1,1,'2022-05-27 12:31:00'),(132,73,6,'crispy chicken',6.00,1,1,'2022-05-27 12:31:00'),(133,74,4,'chicken burger with fires and cola',25.00,1,1,'2022-05-27 12:33:08'),(134,74,36,'italian omelette',12.00,2,1,'2022-05-27 12:33:08'),(135,74,6,'crispy chicken',6.00,1,1,'2022-05-27 12:33:08'),(136,74,42,'sprite(small)',3.00,1,1,'2022-05-27 12:33:08'),(137,74,8,'seafood pasta',11.00,1,1,'2022-05-27 12:33:08'),(138,75,28,'sausage combo',18.00,1,1,'2022-05-27 12:33:19'),(139,76,39,'grill combo',22.00,1,1,'2022-05-27 12:33:27'),(140,77,31,'aglio olio',12.00,1,1,'2022-05-27 12:34:00'),(141,78,3,'cola(large)',7.00,1,1,'2022-05-27 12:34:09'),(142,79,2,'cola(medium)',5.00,1,1,'2022-05-27 12:34:28'),(143,79,41,'lemon tea',5.00,1,1,'2022-05-27 12:34:28'),(144,79,30,'cheese hamburger set',20.00,1,1,'2022-05-27 12:34:28'),(145,80,8,'seafood pasta',11.00,1,1,'2022-05-27 12:34:40'),(146,80,37,'corn cream soup',9.00,1,1,'2022-05-27 12:34:40'),(147,81,4,'chicken burger with fires and cola',25.00,1,1,'2022-05-27 12:34:47'),(148,81,28,'sausage combo',18.00,1,1,'2022-05-27 12:34:47'),(149,82,1,'cola(small)',3.00,1,1,'2022-05-27 12:34:58'),(150,82,38,'egg mayo salad set',17.00,1,1,'2022-05-27 12:34:58'),(151,83,39,'grill combo',22.00,1,1,'2022-05-27 12:35:16'),(152,84,45,'steamed mussels',15.00,1,1,'2022-05-27 12:35:29'),(153,85,30,'cheese hamburger set',20.00,1,1,'2022-05-27 12:36:02'),(154,86,35,'chef salad',11.00,1,1,'2022-05-27 12:36:10'),(155,87,2,'cola(medium)',5.00,1,1,'2022-05-27 12:36:26'),(156,88,1,'cola(small)',3.00,1,1,'2022-05-27 12:36:34'),(157,88,37,'corn cream soup',9.00,1,1,'2022-05-27 12:36:34'),(158,88,38,'egg mayo salad set',17.00,1,1,'2022-05-27 12:36:34'),(159,88,29,'cheese chicken combo',27.00,1,1,'2022-05-27 12:36:34'),(160,89,39,'grill combo',22.00,1,1,'2022-05-27 12:36:41'),(161,89,28,'sausage combo',18.00,1,1,'2022-05-27 12:36:41'),(162,90,35,'chef salad',11.00,1,1,'2022-05-27 12:36:46'),(163,91,39,'grill combo',22.00,1,1,'2022-05-27 12:36:50'),(164,92,41,'lemon tea',5.00,1,1,'2022-05-27 12:37:06'),(165,92,33,'chicken salad',10.00,1,1,'2022-05-27 12:37:06'),(166,92,39,'grill combo',22.00,1,1,'2022-05-27 12:37:06'),(167,92,38,'egg mayo salad set',17.00,1,1,'2022-05-27 12:37:06'),(168,93,29,'cheese chicken combo',27.00,1,1,'2022-05-27 12:37:15'),(169,93,5,'butter corn',4.00,1,1,'2022-05-27 12:37:15'),(170,93,6,'crispy chicken',6.00,1,1,'2022-05-27 12:37:15'),(171,93,31,'aglio olio',12.00,1,1,'2022-05-27 12:37:15'),(172,94,43,'sprite(medium)',5.00,1,1,'2022-05-27 12:37:22'),(173,94,38,'egg mayo salad set',17.00,1,1,'2022-05-27 12:37:22'),(174,95,28,'sausage combo',18.00,1,1,'2022-05-27 12:37:29'),(175,95,42,'sprite(small)',3.00,1,1,'2022-05-27 12:37:29'),(176,96,41,'lemon tea',5.00,1,1,'2022-05-27 12:37:40'),(177,96,39,'grill combo',22.00,1,1,'2022-05-27 12:37:40'),(178,96,40,'focaccia',12.00,1,1,'2022-05-27 12:37:40'),(179,97,5,'butter corn',4.00,1,1,'2022-05-27 12:37:51'),(180,98,6,'crispy chicken',6.00,1,1,'2022-05-27 12:38:02'),(181,98,31,'aglio olio',12.00,1,1,'2022-05-27 12:38:02'),(182,98,41,'lemon tea',5.00,1,1,'2022-05-27 12:38:02'),(183,99,4,'chicken burger with fires and cola',25.00,1,1,'2022-05-27 12:38:07'),(184,100,30,'cheese hamburger set',20.00,1,1,'2022-05-27 12:38:11'),(185,101,39,'grill combo',22.00,1,1,'2022-05-27 12:38:22'),(186,101,29,'cheese chicken combo',27.00,1,1,'2022-05-27 12:38:22'),(187,101,42,'sprite(small)',3.00,1,1,'2022-05-27 12:38:22'),(188,102,7,'kids meal',15.00,1,1,'2022-05-27 12:38:34'),(189,102,4,'chicken burger with fires and cola',25.00,1,1,'2022-05-27 12:38:34'),(190,103,7,'kids meal',15.00,1,1,'2022-05-27 12:38:47'),(191,103,32,'tomato clam pasta combo',32.00,1,1,'2022-05-27 12:38:47'),(192,103,37,'corn cream soup',9.00,1,1,'2022-05-27 12:38:47'),(193,103,5,'butter corn',4.00,1,1,'2022-05-27 12:38:47'),(194,104,39,'grill combo',22.00,1,1,'2022-05-27 12:38:56'),(195,104,30,'cheese hamburger set',20.00,1,1,'2022-05-27 12:38:56'),(196,105,6,'crispy chicken',6.00,1,1,'2022-05-27 12:39:08'),(197,106,37,'corn cream soup',9.00,1,1,'2022-05-27 12:39:17'),(198,107,29,'cheese chicken combo',27.00,1,1,'2022-05-27 12:39:27'),(199,107,28,'sausage combo',18.00,1,1,'2022-05-27 12:39:27'),(200,108,2,'cola(medium)',5.00,1,1,'2022-05-27 12:39:33'),(201,109,41,'lemon tea',5.00,1,1,'2022-05-27 12:39:43'),(202,109,39,'grill combo',22.00,1,1,'2022-05-27 12:39:43'),(203,110,1,'cola(small)',3.00,1,1,'2022-05-27 12:39:52'),(204,110,4,'chicken burger with fires and cola',25.00,1,1,'2022-05-27 12:39:52'),(205,110,28,'sausage combo',18.00,1,1,'2022-05-27 12:39:52'),(206,111,45,'steamed mussels',15.00,1,1,'2022-05-27 12:40:01'),(207,111,33,'chicken salad',10.00,1,1,'2022-05-27 12:40:01'),(208,112,35,'chef salad',11.00,1,1,'2022-05-27 12:40:13'),(209,113,29,'cheese chicken combo',27.00,1,1,'2022-05-27 12:40:18'),(210,114,4,'chicken burger with fires and cola',25.00,1,1,'2022-05-27 12:40:26'),(211,114,28,'sausage combo',18.00,1,1,'2022-05-27 12:40:26'),(212,115,30,'cheese hamburger set',20.00,1,1,'2022-05-27 12:40:30'),(213,116,31,'aglio olio',12.00,1,1,'2022-05-27 12:40:35'),(214,117,6,'crispy chicken',6.00,1,1,'2022-05-27 12:40:49');
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'order_id',
  `table` int DEFAULT NULL,
  `cus_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL COMMENT 'opeator_id',
  `money` double(8,2) DEFAULT NULL COMMENT 'amount',
  `mobile` varchar(50) DEFAULT NULL COMMENT 'customer email',
  `status` tinyint unsigned DEFAULT NULL COMMENT 'order status:1 processing/2invalid/3finish',
  `promoCode` varchar(45) DEFAULT NULL,
  `payment_status` tinyint unsigned DEFAULT NULL COMMENT 'payment status:1unpaid/2paid/3refund',
  `create_at` datetime DEFAULT NULL COMMENT 'create time ',
  `update_at` datetime DEFAULT NULL COMMENT 'change time',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (16,NULL,2,0,43.00,'',2,'newuser',2,'2022-05-01 04:05:37','2022-05-01 04:05:37'),(17,NULL,3,0,43.00,'',2,'newuser',2,'2022-05-01 04:06:48','2022-05-01 04:06:48'),(18,NULL,4,0,43.00,'',2,'newuser',2,'2022-05-01 04:07:38','2022-05-01 04:07:38'),(19,NULL,5,0,43.00,'',2,'newuser',2,'2022-05-01 04:09:10','2022-05-01 04:09:10'),(20,NULL,6,0,43.00,'',2,'newuser',2,'2022-05-01 04:13:37','2022-05-01 04:13:37'),(21,NULL,8,0,43.00,'',2,'newuser',2,'2022-05-01 04:15:38','2022-05-01 04:15:38'),(22,NULL,10,0,11.00,'',2,'newuser',2,'2022-05-01 04:19:23','2022-05-01 04:19:23'),(23,NULL,11,0,26.00,'',2,'happy5',2,'2022-05-01 04:21:03','2022-05-01 04:21:03'),(24,NULL,11,0,26.00,'',2,'happy5',2,'2022-05-01 06:16:04','2022-05-01 06:16:04'),(25,NULL,11,0,55.00,'',2,'newuser',2,'2022-05-01 07:30:43','2022-05-01 07:30:43'),(26,NULL,16,0,70.00,'',2,'happy5',3,'2022-05-01 07:47:05','2022-05-01 07:47:05'),(27,NULL,16,0,70.00,'',2,'happy5',2,'2022-05-01 08:00:57','2022-05-01 08:00:57'),(28,NULL,16,0,70.00,'',2,'happy5',2,'2022-05-01 08:06:11','2022-05-01 08:06:11'),(29,NULL,16,0,70.00,'',3,'happy5',2,'2022-05-01 08:10:49','2022-05-01 08:10:49'),(30,NULL,0,16,60.00,'',3,'',2,'2022-05-01 09:59:51','2022-05-01 09:59:51'),(31,0,0,16,60.00,'',1,'',2,'2022-05-02 15:50:40','2022-05-02 15:50:40'),(32,0,0,16,31.00,'',1,'',2,'2022-05-02 16:08:52','2022-05-02 16:08:52'),(33,0,0,16,32.00,'',3,'',2,'2022-05-02 16:13:30','2022-05-02 16:13:30'),(34,0,0,16,25.00,'',1,'',2,'2022-05-02 16:14:09','2022-05-02 16:14:09'),(35,0,0,16,25.00,'',1,'',2,'2022-05-02 16:16:19','2022-05-02 16:16:19'),(36,NULL,0,16,25.00,'',1,'',2,'2022-05-02 16:20:06','2022-05-02 16:20:06'),(37,NULL,0,16,25.00,'',1,'',2,'2022-05-02 16:22:31','2022-05-02 16:22:31'),(38,NULL,0,16,25.00,'',1,'',2,'2022-05-02 16:24:41','2022-05-02 16:24:41'),(39,NULL,0,16,25.00,'',1,'',2,'2022-05-02 16:26:18','2022-05-02 16:26:18'),(40,NULL,0,16,25.00,'',1,'',2,'2022-05-02 16:34:09','2022-05-02 16:34:09'),(41,NULL,0,16,25.00,'',1,'',2,'2022-05-02 16:44:10','2022-05-02 16:44:10'),(42,1,0,16,25.00,'',1,'',2,'2022-05-02 16:45:29','2022-05-02 16:45:29'),(43,1,0,16,25.00,'',1,'',2,'2022-05-02 16:45:47','2022-05-02 16:45:47'),(44,6,0,16,25.00,'',1,'',2,'2022-05-02 16:48:16','2022-05-02 16:48:16'),(45,2,0,16,54.00,'',1,'',2,'2022-05-08 08:20:42','2022-05-08 08:20:42'),(46,2,19,0,120.00,'',1,'happy5',1,'2022-05-08 14:46:40','2022-05-08 14:46:40'),(47,3,20,0,48.00,'',1,'',1,'2022-05-08 14:54:25','2022-05-08 14:54:25'),(48,3,21,0,33.00,'',1,'',1,'2022-05-08 14:56:20','2022-05-08 14:56:20'),(49,3,22,0,37.00,'',1,'',1,'2022-05-08 14:57:07','2022-05-08 14:57:07'),(50,3,23,0,25.00,'',1,'happy5',1,'2022-05-08 15:25:35','2022-05-08 15:25:35'),(51,3,24,0,55.00,'',1,'',1,'2022-05-08 15:27:57','2022-05-08 15:27:57'),(52,3,25,0,32.00,'',1,'',1,'2022-05-08 15:29:07','2022-05-08 15:29:07'),(53,3,26,0,29.00,'',1,'happy5',1,'2022-05-08 15:32:18','2022-05-08 15:32:18'),(54,3,27,0,28.00,'',1,'happy5',1,'2022-05-08 15:35:26','2022-05-08 15:35:26'),(55,3,28,0,30.00,'',1,'happy5',1,'2022-05-08 15:42:41','2022-05-08 15:42:41'),(56,3,29,0,44.00,'',1,'happy5',1,'2022-05-08 15:50:16','2022-05-08 15:50:16'),(57,3,30,0,44.00,'',1,'',1,'2022-05-08 16:18:07','2022-05-08 16:18:07'),(58,3,31,0,84.00,'',1,'happy5',2,'2022-05-08 16:29:43','2022-05-08 16:29:43'),(59,3,32,0,35.00,'',1,'happy5',2,'2022-05-08 16:31:11','2022-05-08 16:31:11'),(60,3,33,0,28.00,'',1,'newuser',1,'2022-05-08 16:32:37','2022-05-08 16:32:37'),(61,3,34,0,53.00,'',1,'happy5',1,'2022-05-08 16:33:14','2022-05-08 16:33:14'),(62,3,35,0,28.00,'',1,'happy5',1,'2022-05-08 16:34:25','2022-05-08 16:34:25'),(63,3,36,0,28.00,'',1,'happy5',1,'2022-05-08 16:36:28','2022-05-08 16:36:28'),(64,3,37,0,8.00,'',1,'newuser',1,'2022-05-08 16:42:25','2022-05-08 16:42:25'),(65,2,38,0,35.00,'',1,'',2,'2022-05-08 16:56:36','2022-05-08 16:56:36'),(66,2,39,0,28.00,'',1,'happy5',2,'2022-05-08 16:57:32','2022-05-08 16:57:32'),(67,3,40,0,25.00,'',1,'happy5',2,'2022-05-08 17:02:23','2022-05-08 17:02:23'),(68,4,41,0,60.00,'',1,'',2,'2022-05-08 17:05:52','2022-05-08 17:05:52'),(69,4,42,0,35.00,'',1,'happy5',2,'2022-05-08 17:07:02','2022-05-08 17:07:02'),(70,3,0,16,49.00,'',1,'',2,'2022-05-09 10:15:40','2022-05-09 10:15:40'),(71,71,0,17,25.00,'',1,'',2,'2022-05-27 12:28:29','2022-05-27 12:28:29'),(72,3,0,17,38.00,'',1,'',2,'2022-05-27 12:29:15','2022-05-27 12:29:15'),(73,5,0,17,54.00,'',1,'',2,'2022-05-27 12:31:00','2022-05-27 12:31:00'),(74,1,0,17,69.00,'',1,'',2,'2022-05-27 12:33:08','2022-05-27 12:33:08'),(75,4,0,17,18.00,'',1,'',2,'2022-05-27 12:33:19','2022-05-27 12:33:19'),(76,2,0,17,22.00,'',1,'',2,'2022-05-27 12:33:27','2022-05-27 12:33:27'),(77,3,0,17,12.00,'',1,'',2,'2022-05-27 12:34:00','2022-05-27 12:34:00'),(78,3,0,17,7.00,'',1,'',2,'2022-05-27 12:34:09','2022-05-27 12:34:09'),(79,6,0,17,30.00,'',1,'',2,'2022-05-27 12:34:28','2022-05-27 12:34:28'),(80,1,0,17,20.00,'',1,'',2,'2022-05-27 12:34:40','2022-05-27 12:34:40'),(81,4,0,17,43.00,'',1,'',2,'2022-05-27 12:34:47','2022-05-27 12:34:47'),(82,1,0,17,20.00,'',1,'',2,'2022-05-27 12:34:58','2022-05-27 12:34:58'),(83,4,0,17,22.00,'',1,'',2,'2022-05-27 12:35:16','2022-05-27 12:35:16'),(84,7,0,17,15.00,'',1,'',2,'2022-05-27 12:35:29','2022-05-27 12:35:29'),(85,5,0,18,20.00,'',1,'',2,'2022-05-27 12:36:02','2022-05-27 12:36:02'),(86,1,0,18,11.00,'',1,'',2,'2022-05-27 12:36:10','2022-05-27 12:36:10'),(87,3,0,18,5.00,'',1,'',2,'2022-05-27 12:36:26','2022-05-27 12:36:26'),(88,5,0,18,56.00,'',1,'',2,'2022-05-27 12:36:34','2022-05-27 12:36:34'),(89,3,0,18,40.00,'',1,'',2,'2022-05-27 12:36:41','2022-05-27 12:36:41'),(90,8,0,18,11.00,'',1,'',2,'2022-05-27 12:36:46','2022-05-27 12:36:46'),(91,5,0,18,22.00,'',1,'',2,'2022-05-27 12:36:50','2022-05-27 12:36:50'),(92,4,0,18,54.00,'',1,'',2,'2022-05-27 12:37:06','2022-05-27 12:37:06'),(93,5,0,18,49.00,'',1,'',2,'2022-05-27 12:37:15','2022-05-27 12:37:15'),(94,1,0,18,22.00,'',1,'',2,'2022-05-27 12:37:22','2022-05-27 12:37:22'),(95,4,0,18,21.00,'',1,'',2,'2022-05-27 12:37:29','2022-05-27 12:37:29'),(96,2,0,18,39.00,'',1,'',2,'2022-05-27 12:37:40','2022-05-27 12:37:40'),(97,4,0,18,4.00,'',1,'',2,'2022-05-27 12:37:51','2022-05-27 12:37:51'),(98,9,0,18,23.00,'',1,'',2,'2022-05-27 12:38:02','2022-05-27 12:38:02'),(99,1,0,18,25.00,'',1,'',2,'2022-05-27 12:38:07','2022-05-27 12:38:07'),(100,4,0,18,20.00,'',1,'',2,'2022-05-27 12:38:11','2022-05-27 12:38:11'),(101,7,0,18,52.00,'',1,'',2,'2022-05-27 12:38:22','2022-05-27 12:38:22'),(102,2,0,18,40.00,'',1,'',2,'2022-05-27 12:38:34','2022-05-27 12:38:34'),(103,3,0,18,60.00,'',1,'',2,'2022-05-27 12:38:47','2022-05-27 12:38:47'),(104,6,0,18,42.00,'',1,'',2,'2022-05-27 12:38:56','2022-05-27 12:38:56'),(105,5,0,18,6.00,'',1,'',2,'2022-05-27 12:39:08','2022-05-27 12:39:08'),(106,1,0,18,9.00,'',1,'',2,'2022-05-27 12:39:17','2022-05-27 12:39:17'),(107,8,0,18,45.00,'',1,'',2,'2022-05-27 12:39:27','2022-05-27 12:39:27'),(108,3,0,18,5.00,'',1,'',2,'2022-05-27 12:39:33','2022-05-27 12:39:33'),(109,6,0,18,27.00,'',1,'',2,'2022-05-27 12:39:43','2022-05-27 12:39:43'),(110,5,0,18,46.00,'',1,'',2,'2022-05-27 12:39:52','2022-05-27 12:39:52'),(111,1,0,18,25.00,'',1,'',2,'2022-05-27 12:40:01','2022-05-27 12:40:01'),(112,1,0,18,11.00,'',1,'',2,'2022-05-27 12:40:13','2022-05-27 12:40:13'),(113,3,0,18,27.00,'',1,'',2,'2022-05-27 12:40:18','2022-05-27 12:40:18'),(114,10,0,18,43.00,'',1,'',2,'2022-05-27 12:40:26','2022-05-27 12:40:26'),(115,3,0,18,20.00,'',1,'',2,'2022-05-27 12:40:30','2022-05-27 12:40:30'),(116,7,0,18,12.00,'',1,'',2,'2022-05-27 12:40:35','2022-05-27 12:40:35'),(117,4,0,18,6.00,'',1,'',2,'2022-05-27 12:40:49','2022-05-27 12:40:49');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'paymentid',
  `order_id` int unsigned DEFAULT NULL COMMENT 'orderid',
  `cus_id` int DEFAULT NULL COMMENT 'customer email',
  `money` double(8,2) unsigned DEFAULT NULL COMMENT 'amount',
  `type` tinyint NOT NULL COMMENT 'creditcard',
  `status` tinyint unsigned NOT NULL COMMENT 'payment status:1nopaid/2paid/3refund',
  `create_at` datetime DEFAULT NULL COMMENT 'addtime',
  `update_at` datetime DEFAULT NULL COMMENT 'changetime',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (14,30,0,60.00,1,2,'2022-05-01 09:59:51','2022-05-01 09:59:51'),(15,31,0,60.00,1,2,'2022-05-02 15:50:40','2022-05-02 15:50:40'),(16,32,0,31.00,1,2,'2022-05-02 16:08:52','2022-05-02 16:08:52'),(17,33,0,32.00,1,2,'2022-05-02 16:13:30','2022-05-02 16:13:30'),(18,34,0,25.00,1,2,'2022-05-02 16:14:09','2022-05-02 16:14:09'),(19,35,0,25.00,1,2,'2022-05-02 16:16:19','2022-05-02 16:16:19'),(20,36,0,25.00,1,2,'2022-05-02 16:20:07','2022-05-02 16:20:07'),(21,37,0,25.00,1,2,'2022-05-02 16:22:31','2022-05-02 16:22:31'),(22,38,0,25.00,1,2,'2022-05-02 16:24:42','2022-05-02 16:24:42'),(23,39,0,25.00,1,2,'2022-05-02 16:26:18','2022-05-02 16:26:18'),(24,40,0,25.00,1,2,'2022-05-02 16:34:09','2022-05-02 16:34:09'),(25,41,0,25.00,1,2,'2022-05-02 16:44:10','2022-05-02 16:44:10'),(26,42,0,25.00,1,2,'2022-05-02 16:45:29','2022-05-02 16:45:29'),(27,43,0,25.00,1,2,'2022-05-02 16:45:47','2022-05-02 16:45:47'),(28,44,0,25.00,1,2,'2022-05-02 16:48:16','2022-05-02 16:48:16'),(29,45,0,54.00,1,2,'2022-05-08 08:20:42','2022-05-08 08:20:42'),(30,70,0,49.00,1,2,'2022-05-09 10:15:40','2022-05-09 10:15:40'),(31,71,0,25.00,1,2,'2022-05-27 12:28:38','2022-05-27 12:28:38'),(32,72,0,38.00,1,2,'2022-05-27 12:29:15','2022-05-27 12:29:15'),(33,73,0,54.00,1,2,'2022-05-27 12:31:00','2022-05-27 12:31:00'),(34,74,0,69.00,1,2,'2022-05-27 12:33:08','2022-05-27 12:33:08'),(35,75,0,18.00,1,2,'2022-05-27 12:33:19','2022-05-27 12:33:19'),(36,76,0,22.00,1,2,'2022-05-27 12:33:27','2022-05-27 12:33:27'),(37,77,0,12.00,1,2,'2022-05-27 12:34:00','2022-05-27 12:34:00'),(38,78,0,7.00,1,2,'2022-05-27 12:34:09','2022-05-27 12:34:09'),(39,79,0,30.00,1,2,'2022-05-27 12:34:28','2022-05-27 12:34:28'),(40,80,0,20.00,1,2,'2022-05-27 12:34:40','2022-05-27 12:34:40'),(41,81,0,43.00,1,2,'2022-05-27 12:34:47','2022-05-27 12:34:47'),(42,82,0,20.00,1,2,'2022-05-27 12:34:58','2022-05-27 12:34:58'),(43,83,0,22.00,1,2,'2022-05-27 12:35:16','2022-05-27 12:35:16'),(44,84,0,15.00,1,2,'2022-05-27 12:35:29','2022-05-27 12:35:29'),(45,85,0,20.00,1,2,'2022-05-27 12:36:02','2022-05-27 12:36:02'),(46,86,0,11.00,1,2,'2022-05-27 12:36:10','2022-05-27 12:36:10'),(47,87,0,5.00,1,2,'2022-05-27 12:36:26','2022-05-27 12:36:26'),(48,88,0,56.00,1,2,'2022-05-27 12:36:34','2022-05-27 12:36:34'),(49,89,0,40.00,1,2,'2022-05-27 12:36:41','2022-05-27 12:36:41'),(50,90,0,11.00,1,2,'2022-05-27 12:36:46','2022-05-27 12:36:46'),(51,91,0,22.00,1,2,'2022-05-27 12:36:50','2022-05-27 12:36:50'),(52,92,0,54.00,1,2,'2022-05-27 12:37:06','2022-05-27 12:37:06'),(53,93,0,49.00,1,2,'2022-05-27 12:37:15','2022-05-27 12:37:15'),(54,94,0,22.00,1,2,'2022-05-27 12:37:22','2022-05-27 12:37:22'),(55,95,0,21.00,1,2,'2022-05-27 12:37:29','2022-05-27 12:37:29'),(56,96,0,39.00,1,2,'2022-05-27 12:37:40','2022-05-27 12:37:40'),(57,97,0,4.00,1,2,'2022-05-27 12:37:51','2022-05-27 12:37:51'),(58,98,0,23.00,1,2,'2022-05-27 12:38:02','2022-05-27 12:38:02'),(59,99,0,25.00,1,2,'2022-05-27 12:38:07','2022-05-27 12:38:07'),(60,100,0,20.00,1,2,'2022-05-27 12:38:11','2022-05-27 12:38:11'),(61,101,0,52.00,1,2,'2022-05-27 12:38:22','2022-05-27 12:38:22'),(62,102,0,40.00,1,2,'2022-05-27 12:38:34','2022-05-27 12:38:34'),(63,103,0,60.00,1,2,'2022-05-27 12:38:47','2022-05-27 12:38:47'),(64,104,0,42.00,1,2,'2022-05-27 12:38:56','2022-05-27 12:38:56'),(65,105,0,6.00,1,2,'2022-05-27 12:39:08','2022-05-27 12:39:08'),(66,106,0,9.00,1,2,'2022-05-27 12:39:17','2022-05-27 12:39:17'),(67,107,0,45.00,1,2,'2022-05-27 12:39:27','2022-05-27 12:39:27'),(68,108,0,5.00,1,2,'2022-05-27 12:39:33','2022-05-27 12:39:33'),(69,109,0,27.00,1,2,'2022-05-27 12:39:43','2022-05-27 12:39:43'),(70,110,0,46.00,1,2,'2022-05-27 12:39:52','2022-05-27 12:39:52'),(71,111,0,25.00,1,2,'2022-05-27 12:40:01','2022-05-27 12:40:01'),(72,112,0,11.00,1,2,'2022-05-27 12:40:13','2022-05-27 12:40:13'),(73,113,0,27.00,1,2,'2022-05-27 12:40:18','2022-05-27 12:40:18'),(74,114,0,43.00,1,2,'2022-05-27 12:40:26','2022-05-27 12:40:26'),(75,115,0,20.00,1,2,'2022-05-27 12:40:30','2022-05-27 12:40:30'),(76,116,0,12.00,1,2,'2022-05-27 12:40:35','2022-05-27 12:40:35'),(77,117,0,6.00,1,2,'2022-05-27 12:40:49','2022-05-27 12:40:49');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'dish id',
  `category_id` int DEFAULT NULL COMMENT 'category id',
  `cover_pic` varchar(50) DEFAULT NULL COMMENT 'picture',
  `name` varchar(50) DEFAULT NULL COMMENT 'name',
  `price` double(6,2) DEFAULT NULL COMMENT 'price',
  `status` tinyint DEFAULT NULL COMMENT 'status：1:normal  2:no stock  9:delete',
  `create_at` datetime DEFAULT NULL COMMENT 'add time ',
  `update_at` datetime DEFAULT NULL COMMENT 'change time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,4,'1651049133.74097.png','cola(small)',3.00,1,'2022-04-27 08:45:33','2022-04-27 08:45:33'),(2,4,'1651049575.5656152.png','cola(medium)',5.00,1,'2022-04-27 08:52:55','2022-05-03 10:11:16'),(3,4,'1651049622.1214972.png','cola(large)',7.00,1,'2022-04-27 08:53:42','2022-04-28 14:53:10'),(4,1,'1651157691.848448.png','chicken burger with fires and cola',25.00,1,'2022-04-28 14:54:51','2022-04-28 14:54:51'),(5,3,'1651219908.488161.png','butter corn',4.00,1,'2022-04-29 08:11:48','2022-04-29 08:11:48'),(6,3,'1651219949.0019782.png','crispy chicken',6.00,1,'2022-04-29 08:12:29','2022-04-29 08:12:29'),(7,6,'1651220124.7679691.jpeg','kids meal',15.00,1,'2022-04-29 08:15:24','2022-04-29 08:15:24'),(8,7,'1651220182.604592.png','seafood pasta',11.00,1,'2022-04-29 08:16:22','2022-04-29 08:16:22'),(28,1,'1652089765.4144619.png','sausage combo',18.00,1,'2022-05-09 09:49:25','2022-05-09 09:49:25'),(29,1,'1652089818.698263.png','cheese chicken combo',27.00,1,'2022-05-09 09:50:18','2022-05-09 09:50:18'),(30,1,'1652089841.9484632.png','cheese hamburger set',20.00,1,'2022-05-09 09:50:41','2022-05-09 09:50:41'),(31,3,'1652089869.298354.png','aglio olio',12.00,1,'2022-05-09 09:51:09','2022-05-09 09:51:09'),(32,6,'1652089915.220732.png','tomato clam pasta combo',32.00,1,'2022-05-09 09:51:55','2022-05-09 09:51:55'),(33,3,'1652090731.8411899.png','chicken salad',10.00,1,'2022-05-09 10:05:31','2022-05-09 10:05:31'),(34,3,'1652090782.0976589.png','rucola salad',12.00,1,'2022-05-09 10:06:22','2022-05-09 10:06:22'),(35,3,'1652090801.936852.png','chef salad',11.00,1,'2022-05-09 10:06:41','2022-05-09 10:06:41'),(36,3,'1652090840.4419641.png','italian omelette',12.00,1,'2022-05-09 10:07:20','2022-05-09 10:07:20'),(37,1,'1652090866.4529128.png','corn cream soup',9.00,1,'2022-05-09 10:07:46','2022-05-09 10:07:46'),(38,1,'1652090895.913811.png','egg mayo salad set',17.00,1,'2022-05-09 10:08:15','2022-05-09 10:08:15'),(39,1,'1652090914.9043221.png','grill combo',22.00,1,'2022-05-09 10:08:34','2022-05-09 10:08:34'),(40,3,'1652090972.56688.png','focaccia',12.00,1,'2022-05-09 10:09:32','2022-05-09 10:09:32'),(41,4,'1652091106.5585809.webp','lemon tea',5.00,1,'2022-05-09 10:11:46','2022-05-09 10:11:46'),(42,4,'1652091190.0584629.jpeg','sprite(small)',3.00,1,'2022-05-09 10:13:10','2022-05-09 10:13:10'),(43,4,'1652091215.183756.jpeg','sprite(medium)',5.00,1,'2022-05-09 10:13:35','2022-05-09 10:13:35'),(44,4,'1652091242.163074.jpeg','sprite(large)',7.00,1,'2022-05-09 10:14:02','2022-05-09 10:14:02'),(45,3,'1652091297.194141.png','steamed mussels',15.00,1,'2022-05-09 10:14:57','2022-05-09 10:14:57');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promocode`
--

DROP TABLE IF EXISTS `promocode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promocode` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(45) NOT NULL,
  `discount` int NOT NULL,
  `status` int NOT NULL,
  `create_at` datetime DEFAULT NULL,
  `change_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_UNIQUE` (`code`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promocode`
--

LOCK TABLES `promocode` WRITE;
/*!40000 ALTER TABLE `promocode` DISABLE KEYS */;
INSERT INTO `promocode` VALUES (1,'newuser',20,1,NULL,NULL),(2,'happy5',5,1,NULL,NULL),(3,'happy2',2,9,NULL,NULL),(4,'abc123456',13,1,'2022-05-03 10:02:58','2022-05-03 15:26:08');
/*!40000 ALTER TABLE `promocode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table`
--

DROP TABLE IF EXISTS `table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `table` (
  `id` int NOT NULL AUTO_INCREMENT,
  `table_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table`
--

LOCK TABLES `table` WRITE;
/*!40000 ALTER TABLE `table` DISABLE KEYS */;
INSERT INTO `table` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,2),(12,2),(13,2),(14,3),(15,3),(16,3),(17,3),(18,3),(19,3),(20,3),(21,3),(22,3),(23,3),(24,3),(25,3),(26,3),(27,3),(28,3),(29,3),(30,3),(31,3),(32,3),(33,3),(34,3),(35,3),(36,3),(37,3),(38,3),(39,3),(40,3),(41,3),(42,3),(43,3),(44,3),(45,3),(46,3),(47,2),(48,2),(49,2),(50,2),(51,2),(52,2),(53,2),(54,3),(55,3),(56,4),(57,4),(58,4),(59,4),(60,4);
/*!40000 ALTER TABLE `table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uprofile`
--

DROP TABLE IF EXISTS `uprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uprofile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `gender` int NOT NULL,
  `age` int DEFAULT NULL,
  `status` int NOT NULL,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=307 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uprofile`
--

LOCK TABLES `uprofile` WRITE;
/*!40000 ALTER TABLE `uprofile` DISABLE KEYS */;
INSERT INTO `uprofile` VALUES (1,'lml',1,24,9,NULL,'2022-05-07 10:03:41'),(2,'maha',1,28,8,NULL,'2022-05-07 10:03:16'),(3,'ashy',1,28,3,'2022-05-07 09:59:21','2022-05-07 09:59:21'),(4,'mayilin',2,26,2,'2022-05-07 10:00:28','2022-05-07 10:00:28'),(5,'jamus',1,22,2,'2022-05-07 10:00:41','2022-05-07 10:00:41'),(6,'zush',2,22,1,'2022-05-07 10:00:53','2022-05-07 10:00:53'),(207,'test1',2,55,3,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(208,'test2',1,51,1,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(209,'test3',2,38,1,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(210,'test4',2,35,3,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(211,'test5',1,52,1,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(212,'test6',2,49,1,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(213,'test7',2,22,3,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(214,'test8',2,38,2,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(215,'test9',1,53,2,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(216,'test10',2,46,2,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(217,'test11',2,23,2,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(218,'test12',1,36,1,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(219,'test13',1,28,2,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(220,'test14',2,24,3,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(221,'test15',2,53,1,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(222,'test16',1,60,2,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(223,'test17',2,52,1,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(224,'test18',2,46,1,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(225,'test19',2,45,2,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(226,'test20',2,27,1,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(227,'test21',2,60,1,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(228,'test22',2,31,1,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(229,'test23',2,53,2,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(230,'test24',1,33,2,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(231,'test25',1,23,3,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(232,'test26',2,32,2,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(233,'test27',1,36,3,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(234,'test28',1,54,2,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(235,'test29',2,38,1,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(236,'test30',2,44,2,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(237,'test31',2,41,2,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(238,'test32',1,25,2,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(239,'test33',2,26,1,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(240,'test34',2,18,1,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(241,'test35',1,26,1,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(242,'test36',1,25,1,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(243,'test37',2,43,3,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(244,'test38',1,19,1,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(245,'test39',1,43,1,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(246,'test40',1,44,3,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(247,'test41',2,55,1,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(248,'test42',2,43,1,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(249,'test43',1,32,1,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(250,'test44',2,57,3,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(251,'test45',1,24,2,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(252,'test46',2,56,1,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(253,'test47',2,54,3,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(254,'test48',1,49,1,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(255,'test49',2,49,2,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(256,'test50',1,54,3,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(257,'test51',2,43,1,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(258,'test52',2,37,3,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(259,'test53',2,27,2,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(260,'test54',2,38,2,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(261,'test55',1,50,2,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(262,'test56',1,37,1,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(263,'test57',1,46,3,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(264,'test58',2,58,1,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(265,'test59',1,56,1,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(266,'test60',2,44,2,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(267,'test61',1,29,2,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(268,'test62',1,31,3,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(269,'test63',2,21,2,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(270,'test64',1,40,1,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(271,'test65',2,53,2,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(272,'test66',2,44,3,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(273,'test67',1,48,1,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(274,'test68',2,52,1,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(275,'test69',2,41,3,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(276,'test70',2,33,1,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(277,'test71',1,21,2,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(278,'test72',2,52,1,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(279,'test73',2,50,1,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(280,'test74',1,25,2,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(281,'test75',2,19,1,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(282,'test76',2,21,2,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(283,'test77',1,19,1,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(284,'test78',1,46,1,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(285,'test79',2,49,3,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(286,'test80',1,24,2,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(287,'test81',1,46,2,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(288,'test82',2,35,2,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(289,'test83',1,28,3,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(290,'test84',2,59,1,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(291,'test85',2,58,3,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(292,'test86',2,43,3,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(293,'test87',1,44,1,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(294,'test88',2,60,1,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(295,'test89',1,47,2,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(296,'test90',1,51,1,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(297,'test91',1,48,1,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(298,'test92',2,60,3,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(299,'test93',1,31,2,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(300,'test94',2,36,2,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(301,'test95',1,47,3,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(302,'test96',2,59,3,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(303,'test97',1,18,2,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(304,'test98',2,45,1,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(305,'test99',2,26,1,'2022-05-07 13:49:43','2022-05-07 13:49:43'),(306,'test100',2,56,3,'2022-05-07 13:49:43','2022-05-07 13:49:43');
/*!40000 ALTER TABLE `uprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'staff account id',
  `username` varchar(50) DEFAULT NULL COMMENT 'accout name ',
  `nickname` varchar(50) DEFAULT NULL COMMENT 'nickname',
  `password_hash` varchar(100) DEFAULT NULL COMMENT 'password',
  `password_salt` varchar(50) DEFAULT NULL COMMENT 'passwordwith salt ',
  `status` tinyint unsigned NOT NULL DEFAULT '1' COMMENT 'status:1normal/2banned/9delete',
  `create_at` datetime DEFAULT NULL COMMENT 'create time',
  `update_at` datetime DEFAULT NULL COMMENT 'change time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'zhangsan','zhangsan','bc515a86e7bf85d7183b1fcca68fc701','338634',1,'2022-04-08 18:18:18','2022-05-06 15:08:11'),(2,'lisi','lisi','5f5badab4d627dd56d69bfdc50a43e9c','954694',8,'2021-07-18 08:08:18','2022-05-07 14:22:17'),(3,'xiaoli','little','c8a7ca8b274f29cf2c1147a8e0f685a4','639776',6,'2020-07-07 07:53:57','2022-07-08 20:18:18'),(4,'zhangwuji','wuji','cbb748964d243e38f032b78886db824c','437809',1,'2020-02-18 09:06:54','2022-01-14 03:36:25'),(5,'zhaomin','eric','27c744b428b997675c4383e7eae974c3','486570',2,'2020-02-18 09:07:40','2022-02-18 09:07:40'),(6,'cuihua','suiua','b5a7379148116549de083f5076233bef','810418',2,'2021-02-18 09:08:35','2022-03-08 20:18:09'),(7,'zhangle','ahah','7177bd35ad232f0830fe5c10dcc24b1c','350013',2,'2020-02-19 06:11:16','2021-02-19 12:33:19'),(8,'uu01','little','e67cfb8e3e8a1760be4b91e75786c18a','853507',2,'2020-01-03 10:27:04','2022-05-07 13:56:04'),(9,'uu02','big','56322ead3e2371636ac2395c8399297f','112245',1,'2020-01-03 10:37:37','2020-01-03 10:37:37'),(10,'uu03','small','8e7d0c4077c73ad60c23367625d4346f','238764',1,'2020-01-03 11:24:48','2020-01-03 11:24:48'),(11,'uu04','hh','5eec167b09ea13497843274969460d67','642960',1,'2020-01-03 11:27:00','2020-01-03 11:27:00'),(12,'uu123','bb','5c2e9f69b05413b806dc6951b0f86e51','102905',9,'2020-01-13 23:51:01','2022-05-06 15:03:24'),(13,'uu666','cc','99e89e8245d9f6f0628b5a59299bd9f7','673778',1,'2020-01-13 23:52:13','2020-01-13 23:52:13'),(14,'mm','cc','05775bb481d11f0648b158cd40a7929c','627985',1,'2020-01-14 01:25:57','2022-04-26 04:37:03'),(15,'mayilin','ma','b7d4c56ab5c53bc8722db3a91cde250d','129869',6,'2022-04-26 04:16:28','2022-04-26 07:13:58'),(16,'lm454','lml','be1def208365d46b7e155fe45c23cb46','340102',3,'2022-04-29 06:52:39','2022-04-29 06:57:34'),(17,'test1','test1','21bfd40c1f040dcabfa05f364e07a381','684183',2,'2022-05-07 14:07:25','2022-05-07 14:07:25'),(18,'test2','test2','a7fd87b5ec7bab1079a7a83cec58de03','727114',1,'2022-05-07 14:07:25','2022-05-07 14:07:25'),(19,'test3','test3','61378257d34db91cc3e8a5758435874c','474781',3,'2022-05-07 14:07:25','2022-05-07 14:07:25'),(20,'test4','test4','ee7fe5971cf7c9435526c774084244e2','124403',3,'2022-05-07 14:07:25','2022-05-07 14:07:25'),(21,'test5','test5','46c7a67cd31bbe7ef88052cc995feee3','688798',3,'2022-05-07 14:07:25','2022-05-07 14:07:25'),(22,'test6','test6','e715aa3d1dceeefb4f00a2340530fc0b','689053',2,'2022-05-07 14:07:25','2022-05-07 14:07:25'),(23,'test7','test7','f1c2e266502a14adaf5dfffcb550153c','181745',2,'2022-05-07 14:07:25','2022-05-07 14:07:25'),(24,'test8','test8','71f5eece9561147d41d08ae095bffaf1','102469',1,'2022-05-07 14:07:25','2022-05-07 14:07:25'),(25,'test9','test9','13927350dcfe9ae1d4cae7b2872ecd4f','796353',1,'2022-05-07 14:07:25','2022-05-07 14:07:25'),(26,'test10','test10','50f9322a96c9a53cc284bb2301ded572','863191',3,'2022-05-07 14:07:25','2022-05-07 14:07:25'),(27,'test11','test11','7ebfee4418eeb56b5989cece16fc67b8','447694',3,'2022-05-07 14:07:25','2022-05-07 14:07:25'),(28,'test12','test12','951fe7e7e8c886fa989dc277a9337f03','321263',3,'2022-05-07 14:07:25','2022-05-07 14:07:25'),(29,'test13','test13','949a25e61eac17cdd7b21542a0bae261','914331',3,'2022-05-07 14:07:25','2022-05-07 14:07:25'),(30,'test14','test14','594b88b634d3b481a8b05c17780732e9','244297',2,'2022-05-07 14:07:25','2022-05-07 14:07:25'),(31,'test15','test15','ca02e167f371b480e9b21b0b2fd7d6ee','802203',3,'2022-05-07 14:07:25','2022-05-07 14:07:25'),(32,'test16','test16','932cae9fc37991c37118d26475b42eff','362614',1,'2022-05-07 14:07:25','2022-05-07 14:07:25'),(33,'test17','test17','e27bdd81b3b0b1f01887ace2d1bf0b50','863133',3,'2022-05-07 14:07:25','2022-05-07 14:07:25'),(34,'test18','test18','f686d275e6675e9483e19bc36e6d5cf7','612533',1,'2022-05-07 14:07:25','2022-05-07 14:07:25'),(35,'test19','test19','5c62b17560aa4e5a075e55c304f36b3e','283461',1,'2022-05-07 14:07:25','2022-05-07 14:07:25'),(36,'test20','test20','8f6ec2d1f98a58a9b87e2191f51e37be','347174',2,'2022-05-07 14:07:25','2022-05-07 14:07:25'),(37,'test21','test21','c3d7952eba6b9f7217abd08b863b3627','448867',2,'2022-05-07 14:07:25','2022-05-07 14:07:25'),(38,'test22','test22','219bac31ba8a4ad84a92434c05877722','673912',1,'2022-05-07 14:07:25','2022-05-07 14:07:25'),(39,'test23','test23','0a256d18217876faf627f36daebe1157','496052',1,'2022-05-07 14:07:25','2022-05-07 14:07:25'),(40,'test24','test24','96254a39f23036076ed85ede4c2e687d','690546',2,'2022-05-07 14:07:25','2022-05-07 14:07:25'),(41,'test25','test25','19a4849756580d3a3e7f4f2051b33457','597341',3,'2022-05-07 14:07:25','2022-05-07 14:07:25'),(42,'test26','test26','7e07e9cf4568c5d3cae9c1a0ef772064','637788',2,'2022-05-07 14:07:25','2022-05-07 14:07:25'),(43,'test27','test27','ed1aa16b7f94a5cdb2d2175b8a0edf4b','582373',3,'2022-05-07 14:07:25','2022-05-07 14:07:25'),(44,'test28','test28','ea2a5c0f4bfd7ec56fd1819f70c7ab1f','169916',3,'2022-05-07 14:07:25','2022-05-07 14:07:25'),(45,'test29','test29','c85db7777e2771815ca45297ef27c25b','802774',3,'2022-05-07 14:07:25','2022-05-07 14:07:25'),(46,'test30','test30','183d6a933c95af1e521a6b679ecc4599','299815',2,'2022-05-07 14:07:25','2022-05-07 14:07:25'),(47,'test31','test31','59125538c23551134e2b5b526eb15f99','502355',3,'2022-05-07 14:07:25','2022-05-07 14:07:25'),(48,'test32','test32','6bb13edc343bf4cdc1bc1bb16d18ba46','476678',1,'2022-05-07 14:07:25','2022-05-07 14:07:25'),(49,'test33','test33','6c92144e59b09d6068f31f68fb770721','375586',2,'2022-05-07 14:07:25','2022-05-07 14:07:25'),(50,'test34','test34','a53a1f993e15d2e761916c763e0d3bb3','198824',3,'2022-05-07 14:07:25','2022-05-07 14:07:25'),(51,'test35','test35','8cfe07bed84d225024e727b247727bed','795297',2,'2022-05-07 14:07:25','2022-05-07 14:07:25'),(52,'test36','test36','a469b419f2817e7a3a3e2bf0bbe8ddd2','329303',3,'2022-05-07 14:07:25','2022-05-07 14:07:25'),(53,'test37','test37','b461e1cbbb3ab85dee39c84a5dbaa469','700929',3,'2022-05-07 14:07:25','2022-05-07 14:07:25'),(54,'test38','test38','20457cad0298f758860216dd44c7f070','456271',1,'2022-05-07 14:07:25','2022-05-07 14:07:25'),(55,'test39','test39','ace3ebda50cbb9a58fca97a6947db238','382290',2,'2022-05-07 14:07:25','2022-05-07 14:07:25'),(56,'test40','test40','8a3e25fbb2ce2839ccaad0d5223941ae','191464',2,'2022-05-07 14:07:26','2022-05-07 14:07:26'),(57,'test41','test41','cf642be4d34b4174d1c96ab175d1378e','579557',1,'2022-05-07 14:07:26','2022-05-07 14:07:26'),(58,'test42','test42','06862583deb1f161298f83742ad1dc09','509437',1,'2022-05-07 14:07:26','2022-05-07 14:07:26'),(59,'test43','test43','6864cf84ac6a7cc0261ee46e3edc1722','244614',2,'2022-05-07 14:07:26','2022-05-07 14:07:26'),(60,'test44','test44','18ea9536ddb0df08d72de4f118ef899f','782456',2,'2022-05-07 14:07:26','2022-05-07 14:07:26'),(61,'test45','test45','c991d65a3666b55c980559c93e1d0540','614909',1,'2022-05-07 14:07:26','2022-05-07 14:07:26'),(62,'test46','test46','6e95cef1038710b9f60e90ac353d7f43','728117',1,'2022-05-07 14:07:26','2022-05-07 14:07:26'),(63,'test47','test47','c2d83d7d0d2630538dfa015065ee609c','819661',3,'2022-05-07 14:07:26','2022-05-07 14:07:26'),(64,'test48','test48','0df9954165fa711636a8c3b58050fd08','298774',2,'2022-05-07 14:07:26','2022-05-07 14:07:26'),(65,'test49','test49','096a86105bfd9f5a6473a75557ac30bf','196950',2,'2022-05-07 14:07:26','2022-05-07 14:07:26'),(66,'test50','test50','fac3341429d55c7f9a696aa7a95152f6','528980',2,'2022-05-07 14:07:26','2022-05-07 14:07:26'),(67,'test51','test51','1665e5373c0175b38fa66d09b56cf10f','447309',1,'2022-05-07 14:07:26','2022-05-07 14:07:26'),(68,'test52','test52','b2b2a2ca962fe8f29042449e9c337113','843476',3,'2022-05-07 14:07:26','2022-05-07 14:07:26'),(69,'test53','test53','214616fc29afa378c496daf7c434719c','804346',1,'2022-05-07 14:07:26','2022-05-07 14:07:26'),(70,'test54','test54','84a6ea7665e99ba1a314643673ed3354','233477',2,'2022-05-07 14:07:26','2022-05-07 14:07:26'),(71,'test55','test55','476a16a6ff333deabd0226d810955934','305778',2,'2022-05-07 14:07:26','2022-05-07 14:07:26'),(72,'test56','test56','7f9b1af5057e2570dde970db51a8a2c4','250304',1,'2022-05-07 14:07:26','2022-05-07 14:07:26'),(73,'test57','test57','c08dbe05ef0ebb8f2b2461f5e2e8ddba','511116',2,'2022-05-07 14:07:26','2022-05-07 14:07:26'),(74,'test58','test58','5a3b50fab8d16ed713e662de6fc40da0','982236',1,'2022-05-07 14:07:26','2022-05-07 14:07:26'),(75,'test59','test59','3b1953ba61ae12683e066e5dcd10d2ad','669431',1,'2022-05-07 14:07:26','2022-05-07 14:07:26'),(76,'test60','test60','d2d249f0526cdb124f138c3f511f7ee6','852425',1,'2022-05-07 14:07:26','2022-05-07 14:07:26'),(77,'test61','test61','6f9fd75a45ebaa203b7d0c7b6b460bbd','560050',3,'2022-05-07 14:07:26','2022-05-07 14:07:26'),(78,'test62','test62','bc13ea487f9e9ffeabc4b79396775f0d','705979',3,'2022-05-07 14:07:26','2022-05-07 14:07:26'),(79,'test63','test63','7f2cfc6c76675842b8048fa51f32de61','665684',1,'2022-05-07 14:07:26','2022-05-07 14:07:26'),(80,'test64','test64','9ae718792a8179790319c7d0a3d0a485','403439',1,'2022-05-07 14:07:26','2022-05-07 14:07:26'),(81,'test65','test65','f814c0435b2aa3fc1d8a6b04b2e957b2','715878',1,'2022-05-07 14:07:26','2022-05-07 14:07:26'),(82,'test66','test66','2c2d2ce4ae65b95dbfe35d5fa4b86360','453745',1,'2022-05-07 14:07:26','2022-05-07 14:07:26'),(83,'test67','test67','deb5e536654f646e15ccd2c383fc77bb','989690',3,'2022-05-07 14:07:26','2022-05-07 14:07:26'),(84,'test68','test68','3d3bff98670ad3719de13e28646ad94d','788978',1,'2022-05-07 14:07:26','2022-05-07 14:07:26'),(85,'test69','test69','78ff2b142376930b30d3d840a7c5b583','769365',1,'2022-05-07 14:07:26','2022-05-07 14:07:26'),(86,'test70','test70','178e4d0e7a71ef53be9849d6706ce1a6','424471',2,'2022-05-07 14:07:26','2022-05-07 14:07:26'),(87,'test71','test71','4442fd5d5da1ffcd678730da628e913e','319390',3,'2022-05-07 14:07:26','2022-05-07 14:07:26'),(88,'test72','test72','02626fb8cfc3ca2379f933cea6431886','504660',3,'2022-05-07 14:07:26','2022-05-07 14:07:26'),(89,'test73','test73','af218aeca1d22c7bba50032648bbb637','823029',3,'2022-05-07 14:07:26','2022-05-07 14:07:26'),(90,'test74','test74','4356bd597f75f53b53a4233f2c6e4b70','704467',2,'2022-05-07 14:07:26','2022-05-07 14:07:26'),(91,'test75','test75','e2979a5078c2c265739b6a96a418a8fb','976232',2,'2022-05-07 14:07:26','2022-05-07 14:07:26'),(92,'test76','test76','f4634b41cc7bdcdc217a903e8913c854','826749',2,'2022-05-07 14:07:26','2022-05-07 14:07:26'),(93,'test77','test77','915f327136e527fbdbfc897d7a261c0e','817881',3,'2022-05-07 14:07:26','2022-05-07 14:07:26'),(94,'test78','test78','e29acc22e12d43b242c5154c82415e2f','141976',1,'2022-05-07 14:07:26','2022-05-07 14:07:26'),(95,'test79','test79','a455adef587cf992884d5c5e7b2eecb5','410957',2,'2022-05-07 14:07:26','2022-05-07 14:07:26'),(96,'test80','test80','05d50c1f228e716572c8b6e68b6edd5e','223152',3,'2022-05-07 14:07:26','2022-05-07 14:07:26'),(97,'test81','test81','a69678fc29c27f2d8574254475a646ba','107705',2,'2022-05-07 14:07:26','2022-05-07 14:07:26'),(98,'test82','test82','14caf3d19413b87a0c1536e9b6adc397','424003',3,'2022-05-07 14:07:26','2022-05-07 14:07:26'),(99,'test83','test83','eab138793096e5c71723062158852753','696226',1,'2022-05-07 14:07:26','2022-05-07 14:07:26'),(100,'test84','test84','b470988313eb4cd619b82d3a96681742','867930',2,'2022-05-07 14:07:26','2022-05-07 14:07:26'),(101,'test85','test85','9db367dbc2dafd2da3f05518f710e575','237666',2,'2022-05-07 14:07:26','2022-05-07 14:07:26'),(102,'test86','test86','9a7d99e5d56eaa49ed3dcdcbf342b677','425936',1,'2022-05-07 14:07:26','2022-05-07 14:07:26'),(103,'test87','test87','f93b40174bc82220e86abe8a4889eaab','489245',2,'2022-05-07 14:07:26','2022-05-07 14:07:26'),(104,'test88','test88','754ab41b6fd38c750abf97a0ec0a06dd','501147',1,'2022-05-07 14:07:26','2022-05-07 14:07:26'),(105,'test89','test89','013d85cdb1186feaff2268df2cb61850','384822',1,'2022-05-07 14:07:26','2022-05-07 14:07:26'),(106,'test90','test90','630c92eafdb88d6d362d8bff958d347c','871984',3,'2022-05-07 14:07:26','2022-05-07 14:07:26'),(107,'test91','test91','5ba9ae648f1d3176b5acb3fa3ce17c64','695051',2,'2022-05-07 14:07:26','2022-05-07 14:07:26'),(108,'test92','test92','d09005e8f49215ed272f632e4c135077','110974',1,'2022-05-07 14:07:26','2022-05-07 14:07:26'),(109,'test93','test93','a1b77403bcd547ef73885a0c16efaf6a','428690',3,'2022-05-07 14:07:26','2022-05-07 14:07:26'),(110,'test94','test94','1366ffdc2533a7c00f128263e8ef70b1','216185',1,'2022-05-07 14:07:26','2022-05-07 14:07:26'),(111,'test95','test95','5ca3be78f0bc178f9ed5830a3d303d5f','693446',1,'2022-05-07 14:07:26','2022-05-07 14:07:26'),(112,'test96','test96','0fc3cef06d1dc29a946ee580e0a0d09e','561150',2,'2022-05-07 14:07:26','2022-05-07 14:07:26'),(113,'test97','test97','22d58057ed0e7585ae35e1375d548e50','362729',3,'2022-05-07 14:07:26','2022-05-07 14:07:26'),(114,'test98','test98','44ab0f82f39e1ba918b9f233bc5a63e4','946360',2,'2022-05-07 14:07:26','2022-05-07 14:07:26'),(115,'test99','test99','7162b311e8f729a0d0b4cb5670909d72','470044',1,'2022-05-07 14:07:26','2022-05-07 14:07:26'),(116,'test100','test100','c424a37ab20adbdb25786ae4b2c08b5c','916415',2,'2022-05-07 14:07:26','2022-05-07 14:07:26');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-28 15:10:28
