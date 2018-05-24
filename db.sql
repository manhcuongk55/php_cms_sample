-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: survey175
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.31-MariaDB

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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` VALUES (5,'Rất kém',NULL,1),(6,'Kém',NULL,1),(7,'Trung bình',NULL,1),(8,'Tốt',NULL,1),(9,'Rất tốt',NULL,1),(10,'Không ảnh hưởng',NULL,3),(11,'Cần thiết',NULL,3),(12,'Ảnh hưởng',NULL,3),(13,'Có',NULL,4),(14,'Không',NULL,4),(15,'Có',NULL,5),(16,'Không',NULL,5),(17,'1',NULL,6),(18,'2',NULL,6),(19,'3',NULL,6),(20,'4',NULL,6),(21,'5-7',NULL,6),(22,'8-10',NULL,6),(23,'Trên 10',NULL,6),(24,'Dưới 25%',NULL,9),(25,'Từ 25% - 50%',NULL,9),(26,'Từ 50% - 75%',NULL,9),(27,'Trên 75%',NULL,9),(28,'1',NULL,7),(29,'2',NULL,7),(30,'3',NULL,7),(31,'4',NULL,7),(32,'5-7',NULL,7),(33,'8-10',NULL,7),(34,'Trên 10',NULL,7),(35,'Không ảnh hưởng',NULL,10),(36,'Có ảnh hưởng',NULL,10),(37,'Ảnh hưởng quyết định',NULL,10),(38,'Không ảnh hưởng',NULL,11),(39,'Có ảnh hưởng',NULL,11),(40,'Ảnh hưởng quyết định',NULL,11),(41,'Nghiên cứu khoa học trong nước',NULL,12),(42,'Nghiên cứu khoa học ở nước ngoài',NULL,12),(43,'Làm công tác quản lý',NULL,12),(44,'Khác',NULL,12);
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Đánh giá cách thức triển khai chương trình tài trợ của Quỹ thời gian qua như thế nào?',1,1,NULL),(3,'Đánh giá sự quan trọng của đề tài này đối với sự nghiệp khoa học của bạn',1,2,NULL),(4,'Việc thực hiện đề tài này có hỗ trợ bạn trong các vấn đề sau đây hay không?',2,2,NULL),(5,'Việc thực hiện đề tài có giúp cho bạn dễ dàng hơn trong tìm kiếm các nguồn tài trợ, hỗ trợ sau không?',3,2,'Tài trợ, hỗ trợ có thể bao gồm kinh phí, trang thiết bị, chính sách,...'),(6,'Cá nhân bạn có bao nhiêu công trình công bố là sản phẩm từ đề tài này',4,2,'Tạp chí quốc tế có uy tín: đối với KHTN bao gồm tạp chí trong danh mục SCIE và SCI, đối với KHXH bao gồm tạp chí trong danh mục AHCI và SSCI'),(7,'Cá nhân bạn có bao nhiêu công trình công bố trong giai đoạn 5 năm (kể từ khi bắt đầu đề tài này)',5,2,'Tạp chí quốc tế có uy tín: đối với KHTN bao gồm tạp chí trong danh mục SCIE và SCI, đối với KHXH bao gồm tạp chí trong danh mục AHCI và SSCI'),(8,'Kết quả sản phẩm nghiên cứu của đề tài có được tiếp tục phát triển cho các nghiên cứu tiếp theo hoặc ứng dụng không ? Bạn có thể tóm tắt ngắn gọn nội dung tiếp nối/ứng dụng kết quả nghiên cứu Quỹ tài trợ, hỗ trợ',6,2,NULL),(9,'Trong thời gian thực hiện đề tài do Quỹ tài trợ, thu nhập đến từ các đề tài của Quỹ chiếm bao nhiêu % tổng thu nhập từ các hoạt động nghiên cứu, ứng dụng khoa học của bạn?',7,2,NULL),(10,'Bạn hãy đánh giá mức độ ảnh hưởng của các vấn đề sau đến hoạt động nghiên cứu khoa học của cá nhân bạn',1,3,NULL),(11,'Bạn hãy đánh giá mức độ ảnh hưởng của tài trợ, hỗ trợ của Quỹ đến quyết định trở về/ở lại Việt Nam làm việc của bạn?',2,3,NULL),(12,'Kế hoạch phát triển sự nghiệp sắp tới của bạn như thế nào?',3,3,NULL),(13,'Các ý kiến khác (nếu có)',4,3,'Quỹ cần làm những việc gì để nâng cao hiệu quả hoạt động tài trợ, hỗ trợ /có thể làm gì để thúc đẩy tốt nhất hoạt động nghiên cứu khoa học và công nghệ của cá nhân bạn trong thời gian tới.');
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
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (3,'Tổng thể chương trình',1,2,1),(4,'Đánh giá xét chọn',1,2,1),(5,'Theo dõi thực hiện',1,2,1),(6,'Đánh giá kết quả',1,2,1),(7,'Thủ tục tài chính',1,2,1),(8,'Liên lạc với cán bộ Quỹ',1,2,1),(9,'Nếu có thể, vui lòng giải thích chi tiết lựa chọn của bạn ở câu hỏi trên',0,0,1),(10,'',1,2,3),(11,'Nếu có thể, bạn hãy giải thích rõ hơn về sự quan trọng của tài trợ, hỗ trợ của Quỹ đối với sự nghiệp của bạn',0,0,3),(12,'Xây dựng nhóm nghiên cứu',1,2,4),(13,'Duy trì hướng nghiên cứu mong muốn',1,2,4),(14,'Tạo dựng quan hệ với đồng nghiệp trong nước',1,2,4),(15,'Duy trì quan hệ với đồng nghiệp trong nước',1,2,4),(16,'Tạo dựng quan hệ với đồng nghiệp quốc tế',1,2,4),(17,'Duy trì quan hệ với đồng nghiệp quốc tế',1,2,4),(18,'Nâng cao chất lượng nghiên cứu',1,2,4),(19,'Nâng cao số lượng công bố',1,2,4),(20,'Đơn vị công tác hiện tại',1,2,5),(21,'Tổ chức trong nước khác',1,2,5),(22,'Tổ chức nước ngoàiTổ chức nước ngoài',1,2,5),(23,'Bài báo trên tạp chí quốc tế có uy tín',1,2,6),(24,'Bài báo trên tạp chí quốc tế khác',1,2,6),(25,'Bài báo trên tạp chí quốc gia',1,2,6),(26,'Báo cáo tại Hội nghị quốc tế',1,2,6),(27,'Báo cáo tại Hội nghị quốc gia',1,2,6),(28,'Sách chuyên khảo',1,2,6),(29,'Bằng sáng chế',1,2,6),(30,'Khác',1,2,6),(32,'Người tham gia điều tra',1,2,9),(33,'Nhóm nghiên cứu (ước)',1,2,9),(34,'Bài báo trên tạp chí quốc tế có uy tín',1,2,7),(35,'Bài báo trên tạp chí quốc tế khác',1,2,7),(36,'Bài báo trên tạp chí quốc gia',1,2,7),(37,'Báo cáo tại Hội nghị quốc tế',1,2,7),(38,'Báo cáo tại Hội nghị quốc gia',1,2,7),(39,'Sách chuyên khảo',1,2,7),(40,'Bằng sáng chế',1,2,7),(41,'Khác',1,2,7),(42,NULL,0,0,8),(43,'Không có kinh phí mua sắm trang thiết bị, nguyên vật liệu',1,2,10),(44,'Khó tiếp cận các trang thiết bị',1,2,10),(45,'Khó sửa chữa các trang thiết bị',1,2,10),(46,'Thiếu thời gian nghiên cứu (do giảng dạy, việc hành chính,...)',1,2,10),(47,'Thiếu nghiên cứu sinh, kỹ thuật viên',1,2,10),(48,'Thiếu đồng nghiệp cùng lĩnh vực',1,2,10),(49,'Lĩnh vực nghiên cứu không được quan tâm	',1,2,10),(50,'Thu nhập không đủ nhu cầu sinh hoạt',1,2,10),(51,'Không truy cập được các cơ sở dữ liệu khoa học',1,2,10),(52,'Khác',1,2,10),(53,'Nếu có thể, vui lòng giải thích chi tiết lựa chọn của bạn ở câu hỏi trên:',0,0,10),(54,NULL,1,2,11),(55,NULL,1,2,12),(56,NULL,0,0,13);
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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `results`
--

LOCK TABLES `results` WRITE;
/*!40000 ALTER TABLE `results` DISABLE KEYS */;
INSERT INTO `results` VALUES (1,1,3,'5'),(2,1,4,'6'),(3,1,5,'7'),(4,1,6,'8'),(5,1,7,'9'),(6,1,8,'9'),(7,1,10,'10'),(8,1,12,'13'),(9,1,13,'14'),(10,1,14,'13'),(11,1,15,'13'),(12,1,16,'13'),(13,1,17,'13'),(14,1,18,'13'),(15,1,19,'13'),(16,1,20,'15'),(17,1,21,'15'),(18,1,22,'15'),(19,1,23,'17'),(20,1,24,'18'),(21,1,25,'19'),(22,1,26,'20'),(23,1,27,'20'),(24,1,28,'20'),(25,1,29,'20'),(26,1,30,'20'),(27,1,34,'29'),(28,1,35,'29'),(29,1,36,'30'),(30,1,37,'30'),(31,1,38,'31'),(32,1,39,'31'),(33,1,40,'31'),(34,1,41,'32'),(35,1,32,'24'),(36,1,33,'25'),(37,1,43,'35'),(38,1,45,'37'),(39,1,44,'36'),(40,1,46,'36'),(41,1,47,'36'),(42,1,48,'37'),(43,1,49,'36'),(44,1,50,'36'),(45,1,51,'36'),(46,1,52,'36'),(47,1,54,'38'),(48,1,55,'41');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surveyors`
--

LOCK TABLES `surveyors` WRITE;
/*!40000 ALTER TABLE `surveyors` DISABLE KEYS */;
INSERT INTO `surveyors` VALUES (1,1,'/tp1-sv1',2),(2,1,'/tp1-sv2',1),(3,1,'/tp1-sv3',2);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topics`
--

LOCK TABLES `topics` WRITE;
/*!40000 ALTER TABLE `topics` DISABLE KEYS */;
INSERT INTO `topics` VALUES (1,'b128','Phan Nam',1),(2,'c-205','Dung',0);
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-25  0:59:33
