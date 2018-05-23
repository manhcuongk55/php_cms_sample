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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` VALUES (5,'Rất kém',NULL,1),(6,'Kém',NULL,1),(7,'Trung bình',NULL,1),(8,'Tốt',NULL,1),(9,'Rất tốt',NULL,1),(10,'Không ảnh hưởng',NULL,3),(11,'Cần thiết để duy trì công tác chuyên môn',NULL,3),(12,'Ảnh hưởng quyết định',NULL,3),(13,'Có',NULL,4),(14,'Không',NULL,4),(15,'Có',NULL,5),(16,'Không',NULL,5),(17,'1',NULL,6),(18,'2',NULL,6),(19,'3',NULL,6),(20,'4',NULL,6),(21,'5-7',NULL,6),(22,'8-10',NULL,6),(23,'Trên 10',NULL,6),(24,'Dưới 25%',NULL,7),(25,'Từ 25% - 50%',NULL,7),(26,'Từ 50% - 75%',NULL,7),(27,'Trên 75%',NULL,7);
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (3,'Tổng thể chương trình',1,2,1),(4,'Đánh giá xét chọn',1,2,1),(5,'Theo dõi thực hiện',1,2,1),(6,'Đánh giá kết quả',1,2,1),(7,'Thủ tục tài chính',1,2,1),(8,'Liên lạc với cán bộ Quỹ',1,2,1),(9,'Nếu có thể, vui lòng giải thích chi tiết lựa chọn của bạn ở câu hỏi trên',0,0,1),(10,'Sự quan trọng của đề tài',1,2,3),(11,'Nếu có thể, bạn hãy giải thích rõ hơn về sự quan trọng của tài trợ, hỗ trợ của Quỹ đối với sự nghiệp của bạn',0,0,3),(12,'Xây dựng nhóm nghiên cứu',1,2,4),(13,'Duy trì hướng nghiên cứu mong muốn',1,2,4),(14,'Tạo dựng quan hệ với đồng nghiệp trong nước',1,2,4),(15,'Duy trì quan hệ với đồng nghiệp trong nước',1,2,4),(16,'Tạo dựng quan hệ với đồng nghiệp quốc tế',1,2,4),(17,'Duy trì quan hệ với đồng nghiệp quốc tế',1,2,4),(18,'Nâng cao chất lượng nghiên cứu',1,2,4),(19,'Nâng cao số lượng công bố',1,2,4),(20,'Đơn vị công tác hiện tại',1,2,5),(21,'Tổ chức trong nước khác',1,2,5),(22,'Tổ chức nước ngoàiTổ chức nước ngoài',1,2,5),(23,'Bài báo trên tạp chí quốc tế có uy tín',1,2,6),(24,'Bài báo trên tạp chí quốc tế khác',1,2,6),(25,'Bài báo trên tạp chí quốc gia',1,2,6),(26,'Báo cáo tại Hội nghị quốc tế',1,2,6),(27,'Báo cáo tại Hội nghị quốc gia',1,2,6),(28,'Sách chuyên khảo',1,2,6),(29,'Bằng sáng chế',1,2,6),(30,'Khác',1,2,6),(31,NULL,0,0,7),(32,'Người tham gia điều tra',1,2,8),(33,'Nhóm nghiên cứu (ước)',1,2,8);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `results`
--

LOCK TABLES `results` WRITE;
/*!40000 ALTER TABLE `results` DISABLE KEYS */;
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
INSERT INTO `surveyors` VALUES (1,4,'/nampth-1',0),(2,4,'/nampth-2',0),(3,4,'/nampth-3',0),(4,4,'/nampth-4',2),(5,4,'/nampth-5',0),(6,4,'/nampth-6',0),(7,4,'/nampth-7',0),(8,4,'/nampth-8',0),(9,4,'/nampth-9',0),(10,4,'/nampth-10',0);
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
INSERT INTO `topics` VALUES (1,'b-128','Phan Nam',0),(2,'c-205','Dung',0),(3,'a-201','Hanh',0),(4,'nampth','Phan Nam',1);
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
INSERT INTO `users` VALUES (1,'nampth','annamphu95@gmail.com','$2y$10$ZPxiVo1lg3xQIa2ysMO3lOiV/5vWwPK96RPTDCgzdfNlPNogWjqNC','UxEgdSN18zQSVo9uyPexNlZjyW8qBmrgypKWmQxw3ti84RNZPF3nEAPubfXO','2018-05-18 06:48:47','2018-05-18 06:48:47');
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

-- Dump completed on 2018-05-23 22:40:41
