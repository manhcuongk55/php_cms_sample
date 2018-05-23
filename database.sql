CREATE DATABASE  IF NOT EXISTS `survey175` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `survey175`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: survey175
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.32-MariaDB

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
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8_unicode_ci,
  `question_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` VALUES (5,'Rất kém',NULL,1),(6,'Kém',NULL,1),(7,'Trung bình',NULL,1),(8,'Tốt',NULL,1),(9,'Rất tốt',NULL,1),(10,'Không ảnh hưởng',NULL,3),(11,'Cần thiết để duy trì công tác chuyên môn',NULL,3),(12,'Ảnh hưởng quyết định',NULL,3),(13,'Có',NULL,4),(14,'Không',NULL,4),(15,'Có',NULL,5),(16,'Không',NULL,5),(17,'1',NULL,6),(18,'2',NULL,6),(19,'3',NULL,6),(20,'4',NULL,6),(21,'5-7',NULL,6),(22,'8-10',NULL,6),(23,'Trên 10',NULL,6),(24,'Dưới 25%',NULL,9),(25,'Từ 25% - 50%',NULL,9),(26,'Từ 50% - 75%',NULL,9),(27,'Trên 75%',NULL,9),(28,'1',NULL,7),(29,'2',NULL,7),(30,'3',NULL,7),(31,'4',NULL,7),(32,'5-7',NULL,7),(33,'8-10',NULL,7),(34,'Trên 10',NULL,7);
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8_unicode_ci,
  `index` int(11) DEFAULT NULL,
  `page` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Đánh giá cách thức triển khai chương trình tài trợ của Quỹ thời gian qua như thế nào?',1,1,NULL),(3,'Đánh giá sự quan trọng của đề tài này đối với sự nghiệp khoa học của bạn',1,2,NULL),(4,'Việc thực hiện đề tài này có hỗ trợ bạn trong các vấn đề sau đây hay không?',2,2,NULL),(5,'Việc thực hiện đề tài có giúp cho bạn dễ dàng hơn trong tìm kiếm các nguồn tài trợ, hỗ trợ sau không?',3,2,'Tài trợ, hỗ trợ có thể bao gồm kinh phí, trang thiết bị, chính sách,...'),(6,'Cá nhân bạn có bao nhiêu công trình công bố là sản phẩm từ đề tài này',4,2,'Tạp chí quốc tế có uy tín: đối với KHTN bao gồm tạp chí trong danh mục SCIE và SCI, đối với KHXH bao gồm tạp chí trong danh mục AHCI và SSCI'),(7,'Cá nhân bạn có bao nhiêu công trình công bố trong giai đoạn 5 năm (kể từ khi bắt đầu đề tài này)',5,2,'Tạp chí quốc tế có uy tín: đối với KHTN bao gồm tạp chí trong danh mục SCIE và SCI, đối với KHXH bao gồm tạp chí trong danh mục AHCI và SSCI'),(8,'Kết quả sản phẩm nghiên cứu của đề tài có được tiếp tục phát triển cho các nghiên cứu tiếp theo hoặc ứng dụng không ? Bạn có thể tóm tắt ngắn gọn nội dung tiếp nối/ứng dụng kết quả nghiên cứu Quỹ tài trợ, hỗ trợ',6,2,NULL),(9,'Trong thời gian thực hiện đề tài do Quỹ tài trợ, thu nhập đến từ các đề tài của Quỹ chiếm bao nhiêu % tổng thu nhập từ các hoạt động nghiên cứu, ứng dụng khoa học của bạn?',7,2,NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8_unicode_ci,
  `required` int(11) DEFAULT NULL COMMENT '0 - Không bắt buộc\n1- Bắt buộc',
  `type` int(11) DEFAULT NULL COMMENT '0 - TEXT\n1 - NUMBER\n2 - Radio\n3 - Checkbox\n',
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (3,'Tổng thể chương trình',1,2,1),(4,'Đánh giá xét chọn',1,2,1),(5,'Theo dõi thực hiện',1,2,1),(6,'Đánh giá kết quả',1,2,1),(7,'Thủ tục tài chính',1,2,1),(8,'Liên lạc với cán bộ Quỹ',1,2,1),(9,'Nếu có thể, vui lòng giải thích chi tiết lựa chọn của bạn ở câu hỏi trên',0,0,1),(10,'Sự quan trọng của đề tài',1,2,3),(11,'Nếu có thể, bạn hãy giải thích rõ hơn về sự quan trọng của tài trợ, hỗ trợ của Quỹ đối với sự nghiệp của bạn',0,0,3),(12,'Xây dựng nhóm nghiên cứu',1,2,4),(13,'Duy trì hướng nghiên cứu mong muốn',1,2,4),(14,'Tạo dựng quan hệ với đồng nghiệp trong nước',1,2,4),(15,'Duy trì quan hệ với đồng nghiệp trong nước',1,2,4),(16,'Tạo dựng quan hệ với đồng nghiệp quốc tế',1,2,4),(17,'Duy trì quan hệ với đồng nghiệp quốc tế',1,2,4),(18,'Nâng cao chất lượng nghiên cứu',1,2,4),(19,'Nâng cao số lượng công bố',1,2,4),(20,'Đơn vị công tác hiện tại',1,2,5),(21,'Tổ chức trong nước khác',1,2,5),(22,'Tổ chức nước ngoàiTổ chức nước ngoài',1,2,5),(23,'Bài báo trên tạp chí quốc tế có uy tín',1,2,6),(24,'Bài báo trên tạp chí quốc tế khác',1,2,6),(25,'Bài báo trên tạp chí quốc gia',1,2,6),(26,'Báo cáo tại Hội nghị quốc tế',1,2,6),(27,'Báo cáo tại Hội nghị quốc gia',1,2,6),(28,'Sách chuyên khảo',1,2,6),(29,'Bằng sáng chế',1,2,6),(30,'Khác',1,2,6),(32,'Người tham gia điều tra',1,2,9),(33,'Nhóm nghiên cứu (ước)',1,2,9),(34,'Bài báo trên tạp chí quốc tế có uy tín',1,2,7),(35,'Bài báo trên tạp chí quốc tế khác',1,2,7),(36,'Bài báo trên tạp chí quốc gia',1,2,7),(37,'Báo cáo tại Hội nghị quốc tế',1,2,7),(38,'Báo cáo tại Hội nghị quốc gia',1,2,7),(39,'Sách chuyên khảo',1,2,7),(40,'Bằng sáng chế',1,2,7),(41,'Khác',1,2,7),(42,NULL,NULL,0,8);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `results`
--

DROP TABLE IF EXISTS `results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `results` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `surveyor_id` int(11) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  `answer` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `results`
--

LOCK TABLES `results` WRITE;
/*!40000 ALTER TABLE `results` DISABLE KEYS */;
INSERT INTO `results` VALUES (1,1,3,'5'),(2,1,4,'6'),(3,1,5,'7'),(4,1,6,'7'),(5,1,8,'7'),(6,1,7,'7'),(7,1,9,'Đéo có'),(8,1,10,'10'),(9,1,12,'13'),(10,1,14,'13'),(11,1,13,'14'),(12,1,15,'13'),(13,1,16,'13'),(14,1,18,'13'),(15,1,17,'13'),(16,1,19,'13'),(17,1,20,'15'),(18,1,21,'15'),(19,1,22,'16'),(20,1,23,'17'),(21,1,24,'18'),(22,1,25,'19'),(23,1,27,'20'),(24,1,26,'19'),(25,1,28,'21'),(26,1,29,'21'),(27,1,30,'21'),(28,1,34,'28'),(29,1,35,'29'),(30,1,36,'30'),(31,1,37,'31'),(32,1,38,'32'),(33,1,39,'33'),(34,1,40,'33'),(35,1,41,'33'),(36,1,32,'24'),(37,1,33,'25'),(38,4,9,'ahah'),(39,4,3,'8'),(40,4,4,'8'),(41,4,5,'9'),(42,4,7,'8'),(43,4,6,'9'),(44,4,8,'9'),(45,4,10,'11'),(46,4,11,'ãy giải thích rõ hơn về sự quan trọng của tài trợ, hỗ trợ của Quỹ đối với sự nghiệp của bạn'),(47,4,12,'13'),(48,4,13,'13'),(49,4,14,'13'),(50,4,15,'13'),(51,4,16,'14'),(52,4,17,'14'),(53,4,18,'13'),(54,4,19,'13'),(55,4,20,'15'),(56,4,21,'15'),(57,4,22,'15'),(58,4,23,'22'),(59,4,24,'21'),(60,4,25,'22'),(61,4,26,'23'),(62,4,27,'22'),(63,4,28,'22'),(64,4,29,'23'),(65,4,30,'22'),(66,4,34,'33'),(67,4,35,'33'),(68,4,36,'34'),(69,4,37,'33'),(70,4,38,'33'),(71,4,39,'32'),(72,4,40,'33'),(73,4,41,'33'),(74,4,42,'tiếp theo hoặc ứng dụng không ? Bạn có thể tóm tắt ngắn gọn nội dung tiếp nối/ứng dụng kết quả nghiên cứu Quỹ tài trợ, hỗ trợ'),(75,4,32,'26'),(76,4,33,'25'),(77,2,3,'9'),(78,2,4,'8'),(79,2,6,'9'),(80,2,5,'9'),(81,2,8,'8'),(82,2,7,'9'),(83,2,9,'haha'),(84,2,10,'11'),(85,2,11,'fewf'),(86,2,12,'13'),(87,2,14,'13'),(88,2,15,'13'),(89,2,16,'13'),(90,2,13,'13'),(91,2,18,'13'),(92,2,17,'13'),(93,2,19,'13'),(94,2,20,'15'),(95,2,21,'16'),(96,2,22,'15'),(97,2,23,'22'),(98,2,24,'21'),(99,2,26,'21'),(100,2,25,'21'),(101,2,27,'22'),(102,2,29,'21'),(103,2,30,'23'),(104,2,34,'33'),(105,2,35,'33'),(106,2,37,'34'),(107,2,36,'34'),(108,2,38,'33'),(109,2,40,'34'),(110,2,39,'34'),(111,2,41,'33'),(112,2,42,'???'),(113,2,32,'26'),(114,2,33,'27'),(115,2,28,'22'),(116,3,3,'7'),(117,3,4,'7'),(118,3,6,'8'),(119,3,8,'8'),(120,3,7,'7'),(121,3,5,'9'),(122,3,9,'fwefewf'),(123,3,12,'14'),(124,3,14,'13'),(125,3,15,'14'),(126,3,16,'14'),(127,3,13,'13'),(128,3,10,'12'),(129,3,20,'16'),(130,3,25,'22'),(131,3,23,'22'),(132,3,26,'22'),(133,3,24,'22'),(134,3,28,'23'),(135,3,27,'23'),(136,3,29,'22'),(137,3,30,'23'),(138,3,35,'33'),(139,3,34,'33'),(140,3,36,'33'),(141,3,37,'33'),(142,3,38,'33'),(143,3,39,'33'),(144,3,40,'33'),(145,3,41,'33'),(146,3,32,'25'),(147,3,33,'25'),(148,3,18,'14'),(149,3,17,'13'),(150,3,19,'13'),(151,3,22,'16'),(152,3,21,'15');
/*!40000 ALTER TABLE `results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surveyors`
--

DROP TABLE IF EXISTS `surveyors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surveyors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) DEFAULT NULL,
  `url` text COLLATE utf8_unicode_ci,
  `status` int(11) DEFAULT NULL COMMENT '0 - Chưa xem\n1 - Đã xem\n2 - Đã khảo sát',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surveyors`
--

LOCK TABLES `surveyors` WRITE;
/*!40000 ALTER TABLE `surveyors` DISABLE KEYS */;
INSERT INTO `surveyors` VALUES (1,4,'/nampth-1',1),(2,4,'/nampth-2',2),(3,4,'/nampth-3',2),(4,4,'/nampth-4',2),(5,4,'/nampth-5',0),(6,4,'/nampth-6',0),(7,4,'/nampth-7',0),(8,4,'/nampth-8',0),(9,4,'/nampth-9',0),(10,4,'/nampth-10',0);
/*!40000 ALTER TABLE `surveyors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topics`
--

DROP TABLE IF EXISTS `topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `manager` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rendered` int(11) DEFAULT NULL COMMENT '0 - Chưa\n1 - Đã',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topics`
--

LOCK TABLES `topics` WRITE;
/*!40000 ALTER TABLE `topics` DISABLE KEYS */;
INSERT INTO `topics` VALUES (1,'b128','Phan Nam',0),(2,'c-205','Dung',0),(3,'aewr','hanh',0),(4,'nampth','Phan Nam',1);
/*!40000 ALTER TABLE `topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `urls`
--

DROP TABLE IF EXISTS `urls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `urls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_id` varchar(45) DEFAULT NULL,
  `url` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `urls`
--

LOCK TABLES `urls` WRITE;
/*!40000 ALTER TABLE `urls` DISABLE KEYS */;
INSERT INTO `urls` VALUES (1,'1','/aGFzaD02OTk5NzAxYjdkN2M2YzVlMzJkZjVhYmJlOGJhZWQzZCZ0b3BpYz1iLTEyOCZzdHQ9MQ==',NULL,NULL),(2,'1','/aGFzaD05ZmIxZDNkNjc0Y2M4YWYwYWQ3MzMxMDIxZGQzNmY0MCZ0b3BpYz1iLTEyOCZzdHQ9Mg==',NULL,NULL),(3,'1','/aGFzaD03YmY1NGUyN2FlMTMzMDEzMzI5YmQ1OTQ4YWEwYmRhNyZ0b3BpYz1iLTEyOCZzdHQ9Mw==',NULL,NULL),(4,'1','/aGFzaD1jYmRlYTY2NzJmMzZkNzg4YmVkMjkyNGFhNjU3MzQ0MyZ0b3BpYz1iLTEyOCZzdHQ9NA==',NULL,NULL);
/*!40000 ALTER TABLE `urls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'nampth','annamphu95@gmail.com','$2y$10$ZPxiVo1lg3xQIa2ysMO3lOiV/5vWwPK96RPTDCgzdfNlPNogWjqNC','1BjmYOUw0SkahpC1iMYhqh0sAKm9SNaLy6JqDBMwk6RgUHXyzi5iHC9fbVjl','2018-05-18 06:48:47','2018-05-18 06:48:47');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'survey175'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-23 23:17:17
