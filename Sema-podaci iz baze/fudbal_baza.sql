-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: fudbal_sb
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add delegat',7,'add_delegat'),(26,'Can change delegat',7,'change_delegat'),(27,'Can delete delegat',7,'delete_delegat'),(28,'Can view delegat',7,'view_delegat'),(29,'Can add sudija',8,'add_sudija'),(30,'Can change sudija',8,'change_sudija'),(31,'Can delete sudija',8,'delete_sudija'),(32,'Can view sudija',8,'view_sudija'),(33,'Can add tim',9,'add_tim'),(34,'Can change tim',9,'change_tim'),(35,'Can delete tim',9,'delete_tim'),(36,'Can view tim',9,'view_tim'),(37,'Can add utakmica',10,'add_utakmica'),(38,'Can change utakmica',10,'change_utakmica'),(39,'Can delete utakmica',10,'delete_utakmica'),(40,'Can view utakmica',10,'view_utakmica'),(41,'Can add vesti',11,'add_vesti'),(42,'Can change vesti',11,'change_vesti'),(43,'Can delete vesti',11,'delete_vesti'),(44,'Can view vesti',11,'view_vesti'),(45,'Can add gallery',12,'add_gallery'),(46,'Can change gallery',12,'change_gallery'),(47,'Can delete gallery',12,'delete_gallery'),(48,'Can view gallery',12,'view_gallery'),(49,'Can add galerija',13,'add_galerija'),(50,'Can change galerija',13,'change_galerija'),(51,'Can delete galerija',13,'delete_galerija'),(52,'Can view galerija',13,'view_galerija'),(53,'Can add slika',13,'add_slika'),(54,'Can change slika',13,'change_slika'),(55,'Can delete slika',13,'delete_slika'),(56,'Can view slika',13,'view_slika'),(57,'Can add vest',14,'add_vest'),(58,'Can change vest',14,'change_vest'),(59,'Can delete vest',14,'delete_vest'),(60,'Can view vest',14,'view_vest'),(61,'Can add video',15,'add_video'),(62,'Can change video',15,'change_video'),(63,'Can delete video',15,'delete_video'),(64,'Can view video',15,'view_video');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$150000$vjmyued4ZFfK$9LnshH7wHb6RlpxMM7ApQtQmenymaVdLlR3hO8ksTUU=','2019-11-04 14:38:57.036266',1,'bakir','','','',1,1,'2019-10-06 19:54:35.724568');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-10-06 20:01:45.841115','1','bakir curic',1,'[{\"added\": {}}]',7,1),(2,'2019-10-06 20:01:55.895376','2','nemanja mijailovic',1,'[{\"added\": {}}]',7,1),(3,'2019-10-06 20:02:05.063545','3','milica miljkov',1,'[{\"added\": {}}]',7,1),(4,'2019-10-06 20:02:12.006204','4','amra curic',1,'[{\"added\": {}}]',7,1),(5,'2019-10-06 20:02:22.653895','5','timur curic',1,'[{\"added\": {}}]',7,1),(6,'2019-10-06 20:02:43.742550','1','bakir mijailovic',1,'[{\"added\": {}}]',8,1),(7,'2019-10-06 20:02:48.269513','2','nemanja curic',1,'[{\"added\": {}}]',8,1),(8,'2019-10-06 20:02:54.476240','3','milica curic',1,'[{\"added\": {}}]',8,1),(9,'2019-10-06 20:03:05.215460','4','timur mijailovic',1,'[{\"added\": {}}]',8,1),(10,'2019-10-06 20:03:21.955116','5','amra mijailovic',1,'[{\"added\": {}}]',8,1),(11,'2019-10-06 20:03:38.788492','1','zvezda',1,'[{\"added\": {}}]',9,1),(12,'2019-10-06 20:03:41.841297','2','partizan',1,'[{\"added\": {}}]',9,1),(13,'2019-10-06 20:03:46.702833','3','hajduk',1,'[{\"added\": {}}]',9,1),(14,'2019-10-06 20:03:49.646609','4','real',1,'[{\"added\": {}}]',9,1),(15,'2019-10-06 20:03:52.367982','5','barselona',1,'[{\"added\": {}}]',9,1),(16,'2019-10-06 20:03:55.542739','6','bar',1,'[{\"added\": {}}]',9,1),(17,'2019-10-06 20:04:05.787551','7','rad',1,'[{\"added\": {}}]',9,1),(18,'2019-10-06 20:04:17.651255','8','milan',1,'[{\"added\": {}}]',9,1),(19,'2019-10-06 20:07:51.288371','1','1.kolo zvezda :1--2: partizan \"sezona 2019\"',1,'[{\"added\": {}}]',10,1),(20,'2019-10-06 20:08:38.102444','2','1.kolo hajduk :2--2: real \"sezona 2019\"',1,'[{\"added\": {}}]',10,1),(21,'2019-10-06 20:09:00.354181','6','bakir curic',1,'[{\"added\": {}}]',8,1),(22,'2019-10-06 20:09:06.496051','7','nemanja mijailovic',1,'[{\"added\": {}}]',8,1),(23,'2019-10-06 20:09:14.774133','8','amra curic',1,'[{\"added\": {}}]',8,1),(24,'2019-10-06 20:09:21.003788','9','milica miljkov',1,'[{\"added\": {}}]',8,1),(25,'2019-10-06 20:10:09.043839','3','1.kolo barselona :3--2: bar \"sezona 2019\"',1,'[{\"added\": {}}]',10,1),(26,'2019-10-06 20:10:51.626203','4','1.kolo rad :3--1: milan \"sezona 2019\"',1,'[{\"added\": {}}]',10,1),(27,'2019-10-06 20:11:22.780394','5','2.kolo zvezda :2--0: milan \"sezona 2019\"',1,'[{\"added\": {}}]',10,1),(28,'2019-10-06 20:11:57.417349','6','2.kolo rad :1--2: partizan \"sezona 2019\"',1,'[{\"added\": {}}]',10,1),(29,'2019-10-06 20:12:26.054962','7','2.kolo zvezda :1--1: real \"sezona 2019\"',1,'[{\"added\": {}}]',10,1),(30,'2019-10-06 20:13:00.309454','8','2.kolo barselona :0--4: real \"sezona 2019\"',1,'[{\"added\": {}}]',10,1),(31,'2019-10-06 20:13:22.737079','9','3.kolo hajduk :2--0: barselona \"sezona 2019\"',1,'[{\"added\": {}}]',10,1),(32,'2019-10-06 20:13:45.500736','10','3.kolo partizan :2--0: rad \"sezona 2019\"',1,'[{\"added\": {}}]',10,1),(33,'2019-10-06 20:14:10.785939','11','4.kolo partizan :2--0: zvezda \"sezona 2019\"',1,'[{\"added\": {}}]',10,1),(34,'2019-10-06 20:16:49.435857','12','3.kolo real :0--2: rad \"sezona 2019\"',1,'[{\"added\": {}}]',10,1),(35,'2019-10-06 20:17:25.508220','13','3.kolo milan :0--2: bar \"sezona 2019\"',1,'[{\"added\": {}}]',10,1),(36,'2019-10-06 20:17:51.825515','14','4.kolo zvezda :2--0: zvezda \"sezona 2019\"',1,'[{\"added\": {}}]',10,1),(37,'2019-10-06 20:18:21.803898','15','3.kolo bar :1--0: milan \"sezona 2019\"',1,'[{\"added\": {}}]',10,1),(38,'2019-10-06 20:18:57.440739','16','4.kolo milan :3--0: barselona \"sezona 2019\"',1,'[{\"added\": {}}]',10,1),(39,'2019-10-11 14:02:00.585161','17','2.kolo zvezda :1--1: hajduk \"sezona 2019\"',1,'[{\"added\": {}}]',10,1),(40,'2019-10-11 14:02:30.248217','18','5.kolo partizan :2--1: zvezda \"sezona 2019\"',1,'[{\"added\": {}}]',10,1),(41,'2019-10-12 11:06:28.619925','6','daris dolovac',1,'[{\"added\": {}}]',7,1),(42,'2019-10-12 11:08:05.874861','19','5.kolo real :3--0: zvezda \"sezona 2019\"',1,'[{\"added\": {}}]',10,1),(43,'2019-10-13 10:14:45.559804','10','Bakir car',1,'[{\"added\": {}}]',8,1),(44,'2019-10-13 10:25:38.625928','7','Miki Markovic',1,'[{\"added\": {}}]',7,1),(45,'2019-10-13 10:26:21.718281','9','Novi Beograd',1,'[{\"added\": {}}]',9,1),(46,'2019-10-14 12:42:30.671826','20','5.kolo bar :2--1: rad \"sezona 2019\"',1,'[{\"added\": {}}]',10,1),(47,'2019-10-14 12:51:16.256032','21','5.kolo partizan :4--0: bar \"sezona 2019\"',1,'[{\"added\": {}}]',10,1),(48,'2019-10-16 10:38:41.333831','10','Bj         Mhrftyedfg',1,'[{\"added\": {}}]',9,1),(49,'2019-10-16 15:46:43.518022','11','Novi Beograd',1,'[{\"added\": {}}]',9,1),(50,'2019-10-16 15:47:02.841903','11','Novi Beograd',3,'',9,1),(51,'2019-10-16 15:47:46.952486','12','Novi Beograd',1,'[{\"added\": {}}]',9,1),(52,'2019-10-16 15:48:24.480442','12','Novi Beograd',3,'',9,1),(53,'2019-10-16 15:49:56.538167','13','Novi Beograd',1,'[{\"added\": {}}]',9,1),(54,'2019-10-16 15:50:27.812064','14','Novi Beograd',1,'[{\"added\": {}}]',9,1),(55,'2019-10-16 15:50:41.831769','14','Novi Beograd',3,'',9,1),(56,'2019-10-16 15:50:41.839782','13','Novi Beograd',3,'',9,1),(57,'2019-10-16 15:56:51.942792','15','Novi Beograd',1,'[{\"added\": {}}]',9,1),(58,'2019-10-16 16:01:53.513899','15','Novi Beograd',3,'',9,1),(59,'2019-10-16 16:07:13.242801','16','Novi Beograd',1,'[{\"added\": {}}]',9,1),(60,'2019-10-16 16:08:26.677871','17','Novi Beograd',1,'[{\"added\": {}}]',9,1),(61,'2019-10-16 16:09:50.054936','17','Novi Beograd',3,'',9,1),(62,'2019-10-16 16:09:50.060932','16','Novi Beograd',3,'',9,1),(63,'2019-10-16 16:09:57.314146','18','Novi Beograd',1,'[{\"added\": {}}]',9,1),(64,'2019-10-16 16:14:22.286282','19','Novi Beograd',1,'[{\"added\": {}}]',9,1),(65,'2019-10-16 16:14:27.051463','20','Novi Beograd',1,'[{\"added\": {}}]',9,1),(66,'2019-10-16 16:20:21.577019','20','Novi Beograd',3,'',9,1),(67,'2019-10-16 16:20:21.582978','19','Novi Beograd',3,'',9,1),(68,'2019-10-16 16:20:21.586980','18','Novi Beograd',3,'',9,1),(69,'2019-10-16 16:33:30.971434','21','Neki',1,'[{\"added\": {}}]',9,1),(70,'2019-10-18 12:56:23.857765','1','Vesti object (1)',1,'[{\"added\": {}}]',11,1),(71,'2019-10-18 13:28:52.361698','3','Nesto',1,'[{\"added\": {}}]',11,1),(72,'2019-10-18 13:29:49.360083','3','sadsad',2,'[{\"changed\": {\"fields\": [\"naslov\", \"slika\"]}}]',11,1),(73,'2019-10-18 13:31:11.501626','3','sadsad',2,'[{\"changed\": {\"fields\": [\"slika\"]}}]',11,1),(74,'2019-10-21 10:56:51.462768','3','sadsad',3,'',11,1),(75,'2019-10-21 10:56:51.469760','1','Nesto',3,'',11,1),(76,'2019-10-21 10:58:03.840836','4','bakir',1,'[{\"added\": {}}]',11,1),(77,'2019-10-21 11:02:57.609237','5','sdsadas',1,'[{\"added\": {}}]',11,1),(78,'2019-10-21 11:17:36.816094','6','nova vest',1,'[{\"added\": {}}]',11,1),(79,'2019-10-21 11:41:10.161659','18','5.kolo partizan :2--1: zvezda \"sezona 2019\"',2,'[]',10,1),(80,'2019-10-23 14:28:32.274386','22','1.kolo bar :0--0: zvezda \"sezona 2019\"',1,'[{\"added\": {}}]',10,1),(81,'2019-10-23 14:31:29.419696','11','Faruk        Gil Razdaginac',1,'[{\"added\": {}}]',8,1),(82,'2019-10-23 21:14:52.685590','7','Milica',1,'[{\"added\": {}}]',11,1),(83,'2019-10-23 23:04:35.751759','8','Nemanja',1,'[{\"added\": {}}]',11,1),(84,'2019-10-23 23:33:31.132659','9','Milica',1,'[{\"added\": {}}]',11,1),(85,'2019-10-23 23:33:45.634747','10','Amra',1,'[{\"added\": {}}]',11,1),(86,'2019-10-25 13:20:43.234410','10','Amra',3,'',11,1),(87,'2019-10-25 13:20:43.251426','8','Nemanja',3,'',11,1),(88,'2019-10-25 16:26:33.760197','1','Milica',1,'[{\"added\": {}}]',13,1),(89,'2019-10-25 16:26:56.453228','2','Nemanja',1,'[{\"added\": {}}]',13,1),(90,'2019-10-25 16:27:09.672495','3','bakir',1,'[{\"added\": {}}]',13,1),(91,'2019-10-25 16:27:23.580437','4','sadsad',1,'[{\"added\": {}}]',13,1),(92,'2019-10-25 19:44:41.737823','11','Video',1,'[{\"added\": {}}]',11,1),(93,'2019-10-25 23:18:56.402910','12','Nemanja',1,'[{\"added\": {}}]',11,1),(94,'2019-10-25 23:26:24.030198','12','Nemanja',2,'[{\"changed\": {\"fields\": [\"video\"]}}]',11,1),(95,'2019-10-25 23:30:02.686742','12','Nemanja',2,'[{\"changed\": {\"fields\": [\"video\"]}}]',11,1),(96,'2019-10-25 23:30:25.697976','12','Nemanja',2,'[{\"changed\": {\"fields\": [\"slika\", \"video\"]}}]',11,1),(97,'2019-10-26 12:02:44.056606','13','Milica',1,'[{\"added\": {}}]',11,1),(98,'2019-10-26 13:02:09.087574','12','Sasdassdsadas Asd          Fsd',1,'[{\"added\": {}}]',8,1),(99,'2019-10-26 13:03:20.839521','23','6.kolo zvezda :1--0: zvezda \"sezona 2019\"',1,'[{\"added\": {}}]',10,1),(100,'2019-10-26 13:04:48.787625','23','6.kolo zvezda :1--0: zvezda \"sezona 2019\"',2,'[]',10,1),(101,'2019-10-26 13:07:11.513492','23','6.kolo zvezda :1--0: zvezda \"sezona 2019\"',2,'[]',10,1),(102,'2019-10-26 13:08:30.332542','23','6.kolo zvezda :1--0: zvezda \"sezona 2019\"',2,'[]',10,1),(103,'2019-10-26 13:10:25.480953','23','6.kolo zvezda :1--0: zvezda \"sezona 2019\"',2,'[]',10,1),(104,'2019-10-26 13:11:49.829886','23','6.kolo zvezda :1--0: partizan \"sezona 2019\"',2,'[{\"changed\": {\"fields\": [\"gost\", \"prvi_pomocnik\"]}}]',10,1),(105,'2019-10-26 22:37:16.284906','1','Milica',1,'[{\"added\": {}}]',11,1),(106,'2019-10-26 22:39:17.283531','2','Nemanja',1,'[{\"added\": {}}]',11,1),(107,'2019-10-26 23:06:34.535560','3','bakir',1,'[{\"added\": {}}]',11,1),(108,'2019-10-26 23:15:15.488288','4','Milica',1,'[{\"added\": {}}]',11,1),(109,'2019-10-27 00:00:04.639541','5','Nesto',1,'[{\"added\": {}}]',11,1),(110,'2019-10-28 14:16:09.109707','6','Milica',1,'[{\"added\": {}}]',11,1),(111,'2019-10-28 14:17:15.560685','7','asdas',1,'[{\"added\": {}}]',11,1),(112,'2019-10-28 14:17:53.855984','8','Milica',1,'[{\"added\": {}}]',11,1),(113,'2019-10-28 14:27:41.894039','9','sdsa',1,'[{\"added\": {}}]',11,1),(114,'2019-10-28 14:50:25.808870','9','sdsa',3,'',11,1),(115,'2019-10-28 14:54:20.789333','11','Nesto',1,'[{\"added\": {}}]',11,1),(116,'2019-10-28 14:56:29.690885','11','Nesto',2,'[{\"changed\": {\"fields\": [\"slika\"]}}]',11,1),(117,'2019-10-28 23:58:59.938584','1','Amra',1,'[{\"added\": {}}]',13,1),(118,'2019-10-29 13:33:55.189921','12','Bakir',1,'[{\"added\": {}}]',11,1),(119,'2019-10-29 14:34:07.778219','13','dfsd',1,'[{\"added\": {}}]',11,1),(120,'2019-10-29 14:36:46.523717','14','Amra',1,'[{\"added\": {}}]',11,1),(121,'2019-10-29 15:56:55.210628','15','Gosodoas',1,'[{\"added\": {}}]',11,1),(122,'2019-10-29 16:00:15.313293','16','xzczxc',1,'[{\"added\": {}}]',11,1),(123,'2019-10-29 16:08:45.554486','17','Nesto',1,'[{\"added\": {}}]',11,1),(124,'2019-10-29 16:10:58.367035','18','fdsf',1,'[{\"added\": {}}]',11,1),(125,'2019-10-29 16:11:48.370846','19','Nesto',1,'[{\"added\": {}}]',11,1),(126,'2019-10-29 16:29:58.963964','20','timir',1,'[{\"added\": {}}]',11,1),(127,'2019-10-29 17:12:31.220929','2','Slika object (2)',1,'[{\"added\": {}}]',13,1),(128,'2019-10-29 17:12:41.288122','3','Slika object (3)',1,'[{\"added\": {}}]',13,1),(129,'2019-10-29 17:13:36.508595','21','Nemanja',1,'[{\"added\": {}}]',11,1),(130,'2019-10-29 17:18:08.126554','22','Amra',1,'[{\"added\": {}}]',11,1),(131,'2019-10-29 17:18:36.626381','23','Amra',1,'[{\"added\": {}}]',11,1),(132,'2019-11-04 00:49:23.162660','13','Bakir Markovic',1,'[{\"added\": {}}]',8,1),(133,'2019-11-04 00:53:16.306306','24','Milica',1,'[{\"added\": {}}]',11,1),(134,'2019-11-04 01:14:58.681031','1','Milica',1,'[{\"added\": {}}]',14,1),(135,'2019-11-04 01:16:34.057818','4','Nesto',1,'[{\"added\": {}}]',13,1),(136,'2019-11-04 01:17:36.006351','2','Nemanja',1,'[{\"added\": {}}]',14,1),(137,'2019-11-04 01:18:00.990255','5','Nesto',1,'[{\"added\": {}}]',13,1),(138,'2019-11-04 14:39:15.204671','6','Nemanja',1,'[{\"added\": {}}]',13,1),(139,'2019-11-04 15:10:51.069348','7','sda',1,'[{\"added\": {}}]',13,1),(140,'2019-11-04 15:19:14.026075','2','Nemanja',1,'[{\"added\": {}}]',15,1),(141,'2019-11-04 15:32:44.460787','8','sdadsa',1,'[{\"added\": {}}]',13,1),(142,'2019-11-04 19:10:13.092092','9','sdasd',1,'[{\"added\": {}}]',13,1),(143,'2019-11-04 19:10:29.568213','10','Nemanja',1,'[{\"added\": {}}]',13,1),(144,'2019-11-04 19:10:49.265031','3','Milica',1,'[{\"added\": {}}]',15,1),(145,'2019-11-04 19:10:54.570597','4','Nemanja',1,'[{\"added\": {}}]',15,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'fudbal','delegat'),(8,'fudbal','sudija'),(9,'fudbal','tim'),(10,'fudbal','utakmica'),(6,'sessions','session'),(12,'vesti','gallery'),(13,'vesti','slika'),(14,'vesti','vest'),(11,'vesti','vesti'),(15,'vesti','video');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-10-06 19:52:16.668806'),(2,'auth','0001_initial','2019-10-06 19:52:17.044333'),(3,'admin','0001_initial','2019-10-06 19:52:18.063123'),(4,'admin','0002_logentry_remove_auto_add','2019-10-06 19:52:18.299341'),(5,'admin','0003_logentry_add_action_flag_choices','2019-10-06 19:52:18.314928'),(6,'contenttypes','0002_remove_content_type_name','2019-10-06 19:52:18.622327'),(7,'auth','0002_alter_permission_name_max_length','2019-10-06 19:52:18.790809'),(8,'auth','0003_alter_user_email_max_length','2019-10-06 19:52:18.843493'),(9,'auth','0004_alter_user_username_opts','2019-10-06 19:52:18.863612'),(10,'auth','0005_alter_user_last_login_null','2019-10-06 19:52:19.013051'),(11,'auth','0006_require_contenttypes_0002','2019-10-06 19:52:19.013560'),(12,'auth','0007_alter_validators_add_error_messages','2019-10-06 19:52:19.033631'),(13,'auth','0008_alter_user_username_max_length','2019-10-06 19:52:19.168398'),(14,'auth','0009_alter_user_last_name_max_length','2019-10-06 19:52:19.303603'),(15,'auth','0010_alter_group_name_max_length','2019-10-06 19:52:19.354233'),(16,'auth','0011_update_proxy_permissions','2019-10-06 19:52:19.370235'),(17,'fudbal','0001_initial','2019-10-06 19:52:19.658801'),(18,'sessions','0001_initial','2019-10-06 19:52:20.576174'),(19,'fudbal','0002_auto_20191006_2207','2019-10-06 20:07:07.391591'),(20,'fudbal','0003_auto_20191009_0052','2019-10-11 19:26:59.701451'),(21,'fudbal','0004_auto_20191011_2126','2019-10-11 19:26:59.867782'),(23,'vesti','0002_auto_20191018_1526','2019-10-18 13:26:17.956984'),(24,'vesti','0003_auto_20191025_1541','2019-10-25 13:42:00.141693'),(25,'vesti','0003_auto_20191025_1731','2019-10-25 15:31:25.962821'),(26,'vesti','0004_vesti_video','2019-10-25 19:39:56.695137'),(27,'vesti','0005_auto_20191025_2143','2019-10-25 19:43:10.235243'),(28,'vesti','0006_auto_20191026_0115','2019-10-25 23:15:51.028691'),(29,'vesti','0007_auto_20191026_0124','2019-10-25 23:25:02.617307'),(30,'vesti','0008_auto_20191026_0132','2019-10-25 23:33:03.751690'),(31,'vesti','0009_auto_20191026_1411','2019-10-26 12:11:15.688013'),(32,'vesti','0001_initial','2019-10-26 22:21:39.958861'),(33,'vesti','0002_auto_20191027_0024','2019-10-26 22:24:55.700031'),(34,'vesti','0003_auto_20191027_0034','2019-10-26 22:34:46.073170'),(35,'vesti','0004_auto_20191027_0037','2019-10-26 22:37:03.217768'),(36,'vesti','0005_auto_20191028_1512','2019-10-28 14:12:58.771047'),(37,'vesti','0006_auto_20191028_1515','2019-10-28 14:15:15.959117'),(38,'vesti','0007_auto_20191029_0057','2019-10-28 23:57:19.809082'),(39,'vesti','0007_auto_20191029_1807','2019-10-29 17:08:38.403750'),(40,'fudbal','0005_auto_20191103_0219','2019-11-04 00:41:26.123383'),(41,'fudbal','0006_sudija_zvanje','2019-11-04 00:41:26.167838'),(42,'fudbal','0007_delegat_zvanje','2019-11-04 00:41:26.207297'),(43,'fudbal','0008_auto_20191103_0229','2019-11-04 00:41:26.348652'),(44,'fudbal','0009_auto_20191103_0232','2019-11-04 00:41:26.668325'),(45,'fudbal','0010_auto_20191103_0238','2019-11-04 00:41:26.779711'),(46,'fudbal','0011_auto_20191103_1527','2019-11-04 00:41:26.975510'),(47,'vesti','0008_auto_20191104_0211','2019-11-04 01:12:06.926993'),(48,'vesti','0009_auto_20191104_1632','2019-11-04 15:32:19.726133');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0m9sq9yt04w4gogv2ae89t9m0p02gx5h','NTJhN2MzZGEwNTRjOWYwMzkyNmI0NzI0Yzc5NTEyZGI1NDdiZDRiYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1ZWViMmVjOTljNTJhN2QzNzYxOGFkOWVmNGQ1ZmRmNGEyNDBmYWUzIn0=','2019-11-05 12:28:37.204791'),('0qouplj363j8e799aa025ys3caz215u4','NTJhN2MzZGEwNTRjOWYwMzkyNmI0NzI0Yzc5NTEyZGI1NDdiZDRiYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1ZWViMmVjOTljNTJhN2QzNzYxOGFkOWVmNGQ1ZmRmNGEyNDBmYWUzIn0=','2019-11-04 10:56:34.840361'),('8oj6djbeso69xqnwlubunnhypde8wb15','NTJhN2MzZGEwNTRjOWYwMzkyNmI0NzI0Yzc5NTEyZGI1NDdiZDRiYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1ZWViMmVjOTljNTJhN2QzNzYxOGFkOWVmNGQ1ZmRmNGEyNDBmYWUzIn0=','2019-11-18 14:38:57.045255'),('drua8mpa63t3na6abfv4u3voo0wwrubp','NTJhN2MzZGEwNTRjOWYwMzkyNmI0NzI0Yzc5NTEyZGI1NDdiZDRiYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1ZWViMmVjOTljNTJhN2QzNzYxOGFkOWVmNGQ1ZmRmNGEyNDBmYWUzIn0=','2019-10-20 19:54:45.526213');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fudbal_delegat`
--

DROP TABLE IF EXISTS `fudbal_delegat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `fudbal_delegat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ime` varchar(20) NOT NULL,
  `prezime` varchar(20) NOT NULL,
  `slika` varchar(100) NOT NULL,
  `zvanje` varchar(200) DEFAULT NULL,
  `datum_rodjenja` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fudbal_delegat`
--

LOCK TABLES `fudbal_delegat` WRITE;
/*!40000 ALTER TABLE `fudbal_delegat` DISABLE KEYS */;
INSERT INTO `fudbal_delegat` VALUES (1,'bakir','curic','sudija.jpg',NULL,'2019-11-04'),(2,'nemanja','mijailovic','sudija.jpg',NULL,'2019-11-04'),(3,'milica','miljkov','sudija.jpg',NULL,'2019-11-04'),(4,'amra','curic','sudija.jpg',NULL,'2019-11-04'),(5,'timur','curic','sudija.jpg',NULL,'2019-11-04'),(6,'daris','dolovac','sudija.jpg',NULL,'2019-11-04'),(7,'Miki','Markovic','sudija.jpg',NULL,'2019-11-04');
/*!40000 ALTER TABLE `fudbal_delegat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fudbal_sudija`
--

DROP TABLE IF EXISTS `fudbal_sudija`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `fudbal_sudija` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ime` varchar(20) NOT NULL,
  `prezime` varchar(20) NOT NULL,
  `slika` varchar(100) NOT NULL,
  `zvanje` varchar(200) DEFAULT NULL,
  `datum_rodjenja` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fudbal_sudija`
--

LOCK TABLES `fudbal_sudija` WRITE;
/*!40000 ALTER TABLE `fudbal_sudija` DISABLE KEYS */;
INSERT INTO `fudbal_sudija` VALUES (1,'bakir','mijailovic','sudija.jpg',NULL,'2019-11-04'),(2,'nemanja','curic','sudija.jpg',NULL,'2019-11-04'),(3,'milica','curic','sudija.jpg',NULL,'2019-11-04'),(4,'timur','mijailovic','sudija.jpg',NULL,'2019-11-04'),(5,'amra','mijailovic','sudija.jpg',NULL,'2019-11-04'),(6,'bakir','curic','sudija.jpg',NULL,'2019-11-04'),(7,'nemanja','mijailovic','sudija.jpg',NULL,'2019-11-04'),(8,'amra','curic','sudija.jpg',NULL,'2019-11-04'),(9,'milica','miljkov','sudija.jpg',NULL,'2019-11-04'),(10,'Bakir','car','sudija.jpg',NULL,'2019-11-04'),(11,'Faruk        Gil','Razdaginac','sudija.jpg',NULL,'2019-11-04'),(12,'Sasdassdsadas','Asd          Fsd','sudija.jpg',NULL,'2019-11-04'),(13,'Bakir','Markovic','delegat_img/20190509_121044_qm6Jw7v.jpg','sudija 2. kat -Srpska liga Istok','2019-11-03');
/*!40000 ALTER TABLE `fudbal_sudija` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fudbal_tim`
--

DROP TABLE IF EXISTS `fudbal_tim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `fudbal_tim` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ime` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fudbal_tim`
--

LOCK TABLES `fudbal_tim` WRITE;
/*!40000 ALTER TABLE `fudbal_tim` DISABLE KEYS */;
INSERT INTO `fudbal_tim` VALUES (1,'zvezda'),(2,'partizan'),(3,'hajduk'),(4,'real'),(5,'barselona'),(6,'bar'),(7,'rad'),(8,'milan'),(9,'Novi Beograd'),(10,'Bj         Mhrftyedfg'),(21,'Neki');
/*!40000 ALTER TABLE `fudbal_tim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fudbal_utakmica`
--

DROP TABLE IF EXISTS `fudbal_utakmica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `fudbal_utakmica` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sezona` smallint(5) unsigned NOT NULL,
  `kolo` smallint(5) unsigned NOT NULL,
  `domacin_gol` smallint(5) unsigned NOT NULL,
  `gost_gol` smallint(5) unsigned NOT NULL,
  `mesto_odigravanja` varchar(100) NOT NULL,
  `vreme_odigravanja` datetime(6) NOT NULL,
  `delegat_id` int(11) NOT NULL,
  `domacin_id` int(11) NOT NULL,
  `drugi_pomocnik_id` int(11) NOT NULL,
  `glavni_sudija_id` int(11) NOT NULL,
  `gost_id` int(11) NOT NULL,
  `prvi_pomocnik_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fudbal_utakmica_delegat_id_2beb6053_fk_fudbal_delegat_id` (`delegat_id`),
  KEY `fudbal_utakmica_domacin_id_86b760d0_fk_fudbal_tim_id` (`domacin_id`),
  KEY `fudbal_utakmica_drugi_pomocnik_id_f29525e8_fk_fudbal_sudija_id` (`drugi_pomocnik_id`),
  KEY `fudbal_utakmica_glavni_sudija_id_602a63b2_fk_fudbal_sudija_id` (`glavni_sudija_id`),
  KEY `fudbal_utakmica_gost_id_932071e5_fk_fudbal_tim_id` (`gost_id`),
  KEY `fudbal_utakmica_prvi_pomocnik_id_374c551c_fk_fudbal_sudija_id` (`prvi_pomocnik_id`),
  CONSTRAINT `fudbal_utakmica_delegat_id_2beb6053_fk_fudbal_delegat_id` FOREIGN KEY (`delegat_id`) REFERENCES `fudbal_delegat` (`id`),
  CONSTRAINT `fudbal_utakmica_domacin_id_86b760d0_fk_fudbal_tim_id` FOREIGN KEY (`domacin_id`) REFERENCES `fudbal_tim` (`id`),
  CONSTRAINT `fudbal_utakmica_drugi_pomocnik_id_f29525e8_fk_fudbal_sudija_id` FOREIGN KEY (`drugi_pomocnik_id`) REFERENCES `fudbal_sudija` (`id`),
  CONSTRAINT `fudbal_utakmica_glavni_sudija_id_602a63b2_fk_fudbal_sudija_id` FOREIGN KEY (`glavni_sudija_id`) REFERENCES `fudbal_sudija` (`id`),
  CONSTRAINT `fudbal_utakmica_gost_id_932071e5_fk_fudbal_tim_id` FOREIGN KEY (`gost_id`) REFERENCES `fudbal_tim` (`id`),
  CONSTRAINT `fudbal_utakmica_prvi_pomocnik_id_374c551c_fk_fudbal_sudija_id` FOREIGN KEY (`prvi_pomocnik_id`) REFERENCES `fudbal_sudija` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fudbal_utakmica`
--

LOCK TABLES `fudbal_utakmica` WRITE;
/*!40000 ALTER TABLE `fudbal_utakmica` DISABLE KEYS */;
INSERT INTO `fudbal_utakmica` VALUES (1,2019,1,1,2,'pozega','2019-10-06 20:07:14.000000',1,1,1,1,2,2),(2,2019,1,2,2,'beogard','2019-10-06 20:07:51.000000',5,3,5,2,4,1),(3,2019,1,3,2,'prag','2019-10-06 20:09:30.000000',4,5,7,5,6,8),(4,2019,1,3,1,'bec','2019-10-06 20:10:09.000000',5,7,3,8,8,6),(5,2019,2,2,0,'beogard','2019-10-06 20:10:58.000000',4,1,4,1,8,2),(6,2019,2,1,2,'pozega','2019-10-06 20:11:22.000000',4,7,7,1,2,4),(7,2019,2,1,1,'pozega','2019-10-06 20:11:57.000000',5,1,8,7,4,4),(8,2019,2,0,4,'bec','2019-10-06 20:12:35.000000',5,5,1,2,4,2),(9,2019,3,2,0,'beogard','2019-10-06 20:13:00.000000',3,3,4,2,5,1),(10,2019,3,2,0,'beogard','2019-10-06 20:13:22.000000',2,2,7,4,7,7),(11,2019,4,2,0,'beogard','2019-10-06 20:13:45.000000',5,2,7,3,1,7),(12,2019,3,0,2,'pozega','2019-10-06 20:16:28.000000',4,4,1,2,7,1),(13,2019,3,0,2,'bec','2019-10-06 20:16:49.000000',5,8,8,2,6,6),(14,2019,4,2,0,'pozega','2019-10-06 20:17:30.000000',2,1,6,4,1,7),(15,2019,3,1,0,'beogard','2019-10-06 20:17:55.000000',3,6,8,2,8,3),(16,2019,4,3,0,'bec','2019-10-06 20:18:30.000000',4,8,8,2,5,1),(17,2019,2,1,1,'beogard','2019-10-11 14:01:21.000000',1,1,1,8,3,2),(18,2019,5,2,1,'pozega','2019-10-11 14:02:08.000000',2,2,4,1,1,2),(19,2019,5,3,0,'pozega','2019-10-12 11:06:56.000000',6,4,3,6,1,2),(20,2019,5,2,1,'prag','2019-10-14 12:41:55.000000',7,6,9,3,7,5),(21,2019,5,4,0,'bec','2019-10-14 12:50:20.000000',6,2,4,8,6,6),(22,2019,1,0,0,'beogard','2019-10-23 14:26:46.000000',6,6,4,1,1,2),(23,2019,6,1,0,'prag','2019-10-26 13:02:39.000000',5,1,9,7,2,2);
/*!40000 ALTER TABLE `fudbal_utakmica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vesti_slika`
--

DROP TABLE IF EXISTS `vesti_slika`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `vesti_slika` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naslov` varchar(100) NOT NULL,
  `vreme_posta` datetime(6) NOT NULL,
  `slika` varchar(100) NOT NULL,
  `vest_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vesti_slika_vest_id_12ea89cb_fk_vesti_vest_id` (`vest_id`),
  CONSTRAINT `vesti_slika_vest_id_12ea89cb_fk_vesti_vest_id` FOREIGN KEY (`vest_id`) REFERENCES `vesti_vest` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vesti_slika`
--

LOCK TABLES `vesti_slika` WRITE;
/*!40000 ALTER TABLE `vesti_slika` DISABLE KEYS */;
INSERT INTO `vesti_slika` VALUES (4,'Nesto','2019-11-04 01:15:16.000000','galerija_img/nathan-rogers-I9HyW30buuQ-unsplash.jpg',1),(5,'Nesto','2019-11-04 01:17:46.000000','galerija_img/lesly-juarez-isWEKdSRCrA-unsplash.jpg',2),(6,'Nemanja','2019-11-04 14:39:03.000000','default.jpg',2),(7,'sda','2019-11-04 15:10:41.000000','default.jpg',1),(8,'sdadsa','2019-11-04 15:32:37.000000','galerija_img/lesly-juarez-isWEKdSRCrA-unsplash_dhI2Jdc.jpg',NULL),(9,'sdasd','2019-11-04 19:09:58.000000','galerija_img/sandro-schuh-HgwY_YQ1m0w-unsplash.jpg',NULL),(10,'Nemanja','2019-11-04 19:10:13.000000','galerija_img/sandro-schuh-HgwY_YQ1m0w-unsplash_aH7dDBx.jpg',2);
/*!40000 ALTER TABLE `vesti_slika` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vesti_vest`
--

DROP TABLE IF EXISTS `vesti_vest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `vesti_vest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naslov` varchar(100) NOT NULL,
  `sadrzaj` longtext NOT NULL,
  `vreme_posta` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vesti_vest`
--

LOCK TABLES `vesti_vest` WRITE;
/*!40000 ALTER TABLE `vesti_vest` DISABLE KEYS */;
INSERT INTO `vesti_vest` VALUES (1,'Milica','asdasdaaaaaaasdasdasd','2019-11-04 01:14:45.000000'),(2,'Nemanja','asdsadas','2019-11-04 01:17:28.000000');
/*!40000 ALTER TABLE `vesti_vest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vesti_video`
--

DROP TABLE IF EXISTS `vesti_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `vesti_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video` varchar(100) DEFAULT NULL,
  `vest_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vesti_video_vest_id_8ee3ccee_fk_vesti_vest_id` (`vest_id`),
  CONSTRAINT `vesti_video_vest_id_8ee3ccee_fk_vesti_vest_id` FOREIGN KEY (`vest_id`) REFERENCES `vesti_vest` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vesti_video`
--

LOCK TABLES `vesti_video` WRITE;
/*!40000 ALTER TABLE `vesti_video` DISABLE KEYS */;
INSERT INTO `vesti_video` VALUES (2,'https://www.youtube.com/embed/niptJYiUhV0',2),(3,'https://www.youtube.com/embed/FGQTLVJk2es',1),(4,'https://www.youtube.com/embed/FGQTLVJk2es',2);
/*!40000 ALTER TABLE `vesti_video` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-04 20:12:08
