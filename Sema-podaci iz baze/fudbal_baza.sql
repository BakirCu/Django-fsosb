CREATE DATABASE  IF NOT EXISTS `fudbal_sb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `fudbal_sb`;
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
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add delegat',7,'add_delegat'),(26,'Can change delegat',7,'change_delegat'),(27,'Can delete delegat',7,'delete_delegat'),(28,'Can view delegat',7,'view_delegat'),(29,'Can add sezona',8,'add_sezona'),(30,'Can change sezona',8,'change_sezona'),(31,'Can delete sezona',8,'delete_sezona'),(32,'Can view sezona',8,'view_sezona'),(33,'Can add sudija',9,'add_sudija'),(34,'Can change sudija',9,'change_sudija'),(35,'Can delete sudija',9,'delete_sudija'),(36,'Can view sudija',9,'view_sudija'),(37,'Can add tim',10,'add_tim'),(38,'Can change tim',10,'change_tim'),(39,'Can delete tim',10,'delete_tim'),(40,'Can view tim',10,'view_tim'),(41,'Can add timovi sokobanja',11,'add_timovisokobanja'),(42,'Can change timovi sokobanja',11,'change_timovisokobanja'),(43,'Can delete timovi sokobanja',11,'delete_timovisokobanja'),(44,'Can view timovi sokobanja',11,'view_timovisokobanja'),(45,'Can add utakmica',12,'add_utakmica'),(46,'Can change utakmica',12,'change_utakmica'),(47,'Can delete utakmica',12,'delete_utakmica'),(48,'Can view utakmica',12,'view_utakmica'),(49,'Can add tim sezona',13,'add_timsezona'),(50,'Can change tim sezona',13,'change_timsezona'),(51,'Can delete tim sezona',13,'delete_timsezona'),(52,'Can view tim sezona',13,'view_timsezona'),(53,'Can add kazne',14,'add_kazne'),(54,'Can change kazne',14,'change_kazne'),(55,'Can delete kazne',14,'delete_kazne'),(56,'Can view kazne',14,'view_kazne'),(57,'Can add slika',15,'add_slika'),(58,'Can change slika',15,'change_slika'),(59,'Can delete slika',15,'delete_slika'),(60,'Can view slika',15,'view_slika'),(61,'Can add vest',16,'add_vest'),(62,'Can change vest',16,'change_vest'),(63,'Can delete vest',16,'delete_vest'),(64,'Can view vest',16,'view_vest'),(65,'Can add video',17,'add_video'),(66,'Can change video',17,'change_video'),(67,'Can delete video',17,'delete_video'),(68,'Can view video',17,'view_video'),(69,'Can add tip sezone',18,'add_tipsezone'),(70,'Can change tip sezone',18,'change_tipsezone'),(71,'Can delete tip sezone',18,'delete_tipsezone'),(72,'Can view tip sezone',18,'view_tipsezone'),(73,'Can add odbor',19,'add_odbor'),(74,'Can change odbor',19,'change_odbor'),(75,'Can delete odbor',19,'delete_odbor'),(76,'Can view odbor',19,'view_odbor'),(77,'Can add clan odbora',20,'add_clanodbora'),(78,'Can change clan odbora',20,'change_clanodbora'),(79,'Can delete clan odbora',20,'delete_clanodbora'),(80,'Can view clan odbora',20,'view_clanodbora'),(81,'Can add obavestenja',21,'add_obavestenja'),(82,'Can change obavestenja',21,'change_obavestenja'),(83,'Can delete obavestenja',21,'delete_obavestenja'),(84,'Can view obavestenja',21,'view_obavestenja'),(85,'Can add propisi',22,'add_propisi'),(86,'Can change propisi',22,'change_propisi'),(87,'Can delete propisi',22,'delete_propisi'),(88,'Can view propisi',22,'view_propisi'),(89,'Can add slika',23,'add_slika'),(90,'Can change slika',23,'change_slika'),(91,'Can delete slika',23,'delete_slika'),(92,'Can view slika',23,'view_slika'),(93,'Can add video',24,'add_video'),(94,'Can change video',24,'change_video'),(95,'Can delete video',24,'delete_video'),(96,'Can view video',24,'view_video'),(97,'Can add vest',25,'add_vest'),(98,'Can change vest',25,'change_vest'),(99,'Can delete vest',25,'delete_vest'),(100,'Can view vest',25,'view_vest');
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
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$150000$uO1k77y4ksVf$QfdxcdYbgY90F6g/zyHP2DqltASpbeMSPTUG4wi1e3E=','2019-11-20 13:08:52.755007',1,'bakir','','','',1,1,'2019-11-05 14:38:19.853748');
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
) ENGINE=InnoDB AUTO_INCREMENT=252 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-11-05 15:49:02.625140','1','Bakir Markovic',1,'[{\"added\": {}}]',7,1),(2,'2019-11-05 15:49:42.100698','2','Milica Mijailovic',1,'[{\"added\": {}}]',7,1),(3,'2019-11-05 15:50:17.386048','3','Nemanja Miljkov',1,'[{\"added\": {}}]',7,1),(4,'2019-11-05 15:50:46.913798','1','Bakir Markovic',1,'[{\"added\": {}}]',9,1),(5,'2019-11-05 15:51:04.581200','2','Novi Dolovac',1,'[{\"added\": {}}]',9,1),(6,'2019-11-05 15:51:23.762055','3','Timur Curic',1,'[{\"added\": {}}]',9,1),(7,'2019-11-05 15:51:48.370838','1','Barselona',1,'[{\"added\": {}}]',10,1),(8,'2019-11-05 15:51:54.082495','2','Real',1,'[{\"added\": {}}]',10,1),(9,'2019-11-05 15:52:00.375536','3','Partizan',1,'[{\"added\": {}}]',10,1),(10,'2019-11-05 15:52:05.718062','4','Zvezda',1,'[{\"added\": {}}]',10,1),(11,'2019-11-05 15:52:34.617456','1','Sezona object (1)',1,'[{\"added\": {}}]',8,1),(12,'2019-11-05 15:55:18.318245','1','TimSezona object (1)',1,'[{\"added\": {}}]',13,1),(13,'2019-11-05 15:55:23.416522','2','TimSezona object (2)',1,'[{\"added\": {}}]',13,1),(14,'2019-11-05 15:55:28.514799','3','TimSezona object (3)',1,'[{\"added\": {}}]',13,1),(15,'2019-11-05 15:55:33.090111','4','TimSezona object (4)',1,'[{\"added\": {}}]',13,1),(16,'2019-11-05 15:55:38.553514','5','TimSezona object (5)',1,'[{\"added\": {}}]',13,1),(17,'2019-11-05 16:04:56.965464','1','2019:Liga:Barselona:True',3,'',13,1),(18,'2019-11-05 16:06:19.502865','1','1.kolo Barselona :2--0: Real \"sezona 2019:Liga\"',1,'[{\"added\": {}}]',12,1),(19,'2019-11-05 16:06:56.794665','2','1.kolo Barselona :2--0: Partizan \"sezona 2019:Liga\"',1,'[{\"added\": {}}]',12,1),(20,'2019-11-05 16:07:26.425806','3','2.kolo Real :1--1: Zvezda \"sezona 2019:Liga\"',1,'[{\"added\": {}}]',12,1),(21,'2019-11-05 16:07:54.173875','4','2.kolo Real :0--2: Zvezda \"sezona 2019:Liga\"',1,'[{\"added\": {}}]',12,1),(22,'2019-11-05 16:14:21.518543','1','Milica',1,'[{\"added\": {}}]',15,1),(23,'2019-11-05 16:14:31.957848','2','Nesto',1,'[{\"added\": {}}]',15,1),(24,'2019-11-05 16:14:43.813204','3','Nemanja',1,'[{\"added\": {}}]',15,1),(25,'2019-11-05 16:14:55.927793','4','Milica',1,'[{\"added\": {}}]',15,1),(26,'2019-11-05 16:16:26.120889','1','Milica',1,'[{\"added\": {}}]',16,1),(27,'2019-11-05 16:16:33.528799','2','Nemanja',1,'[{\"added\": {}}]',16,1),(28,'2019-11-05 16:16:41.164980','3','Amra',1,'[{\"added\": {}}]',16,1),(29,'2019-11-05 16:17:34.757111','1','Amra',1,'[{\"added\": {}}]',17,1),(30,'2019-11-05 16:18:05.561016','5','Milica',1,'[{\"added\": {}}]',15,1),(31,'2019-11-05 16:18:22.944203','6','Nemanja',1,'[{\"added\": {}}]',15,1),(32,'2019-11-05 16:18:37.010294','7','Nesto',1,'[{\"added\": {}}]',15,1),(33,'2019-11-05 16:18:54.582291','8','bakir',1,'[{\"added\": {}}]',15,1),(34,'2019-11-05 16:19:33.666250','6','Nemanja',2,'[{\"changed\": {\"fields\": [\"slika\"]}}]',15,1),(35,'2019-11-06 13:14:00.713561','2','2020:Liga',1,'[{\"added\": {}}]',8,1),(36,'2019-11-06 13:14:14.425016','2','2018:Liga',2,'[{\"changed\": {\"fields\": [\"sezona\"]}}]',8,1),(37,'2019-11-06 13:14:35.871541','3','2018:Kup',1,'[{\"added\": {}}]',8,1),(38,'2019-11-06 13:14:49.018572','4','2019:Kup',1,'[{\"added\": {}}]',8,1),(39,'2019-11-06 13:15:42.075216','5','Novi',1,'[{\"added\": {}}]',10,1),(40,'2019-11-06 13:42:24.555445','5','3.kolo Barselona :0--0: Real \"sezona 2019:Liga\"',1,'[{\"added\": {}}]',12,1),(41,'2019-11-06 13:43:53.033299','6','2.kolo Real :None--None: Barselona \"sezona 2019:Liga\"',1,'[{\"added\": {}}]',12,1),(42,'2019-11-06 13:49:22.482280','7','2.kolo Barselona :None--None: Partizan \"sezona 2018:Liga\"',1,'[{\"added\": {}}]',12,1),(43,'2019-11-06 14:54:53.113372','8','1.kolo Novi :None--None: Barselona \"sezona 2019:Kup\"',1,'[{\"added\": {}}]',12,1),(44,'2019-11-06 14:58:37.962518','9','4.kolo Barselona :None--None: Real \"sezona 2019:Kup\"',1,'[{\"added\": {}}]',12,1),(45,'2019-11-06 16:53:04.966074','1','TipSezone object (1)',1,'[{\"added\": {}}]',18,1),(46,'2019-11-06 16:53:33.145204','1','TipSezone object (1)',3,'',18,1),(47,'2019-11-06 16:53:41.832304','2','TipSezone object (2)',1,'[{\"added\": {}}]',18,1),(48,'2019-11-06 16:53:55.686610','3','TipSezone object (3)',1,'[{\"added\": {}}]',18,1),(49,'2019-11-06 16:56:18.167638','1','Real',1,'[{\"added\": {}}]',10,1),(50,'2019-11-06 17:00:33.850192','1','2018:LIGA',1,'[{\"added\": {}}]',8,1),(51,'2019-11-06 17:08:32.387465','2','Barselona',1,'[{\"added\": {}}]',10,1),(52,'2019-11-06 17:08:38.844851','3','Partizan',1,'[{\"added\": {}}]',10,1),(53,'2019-11-06 17:08:45.871649','4','Novi Beograd',1,'[{\"added\": {}}]',10,1),(54,'2019-11-06 17:08:57.261982','5','Zvezda',1,'[{\"added\": {}}]',10,1),(55,'2019-11-06 17:09:17.580165','6','Novi Pazar',1,'[{\"added\": {}}]',10,1),(56,'2019-11-06 17:09:58.193057','2','2007:LIGA',1,'[{\"added\": {}}]',8,1),(57,'2019-11-06 17:10:06.446103','3','2000:KUP',1,'[{\"added\": {}}]',8,1),(58,'2019-11-06 17:10:17.482295','4','2019:LIGA',1,'[{\"added\": {}}]',8,1),(59,'2019-11-06 17:10:41.115584','5','2019:KUP',1,'[{\"added\": {}}]',8,1),(60,'2019-11-06 17:11:19.031740','1','Bakir Curic',1,'[{\"added\": {}}]',9,1),(61,'2019-11-06 17:11:50.165341','2','Nemanja Mijailovic',1,'[{\"added\": {}}]',9,1),(62,'2019-11-06 17:12:26.717894','3','Milica Miljkov',1,'[{\"added\": {}}]',9,1),(63,'2019-11-06 17:12:44.883783','4','Timur Curic',1,'[{\"added\": {}}]',9,1),(64,'2019-11-06 17:12:58.462873','5','Amra Curic',1,'[{\"added\": {}}]',9,1),(65,'2019-11-06 17:28:17.284520','1','Bakir Markovic',1,'[{\"added\": {}}]',7,1),(66,'2019-11-06 17:28:37.309004','2','Nemanja Curic',1,'[{\"added\": {}}]',7,1),(67,'2019-11-06 17:29:19.281503','1','2019:KUP:Real:True',1,'[{\"added\": {}}]',13,1),(68,'2019-11-06 17:29:39.846935','2','2000:KUP:Barselona:True',1,'[{\"added\": {}}]',13,1),(69,'2019-11-06 17:29:50.761254','3','2019:LIGA:Partizan:True',1,'[{\"added\": {}}]',13,1),(70,'2019-11-06 17:30:01.768475','4','2019:LIGA:Barselona:True',1,'[{\"added\": {}}]',13,1),(71,'2019-11-06 17:30:07.801295','5','2019:LIGA:Real:True',1,'[{\"added\": {}}]',13,1),(72,'2019-11-06 17:30:25.103070','6','2019:LIGA:Novi Beograd:True',1,'[{\"added\": {}}]',13,1),(73,'2019-11-06 17:30:30.084008','7','2019:LIGA:Novi Pazar:True',1,'[{\"added\": {}}]',13,1),(74,'2019-11-06 17:30:36.165236','8','2019:LIGA:Zvezda:True',1,'[{\"added\": {}}]',13,1),(75,'2019-11-06 17:43:19.025940','9','2000:KUP:Real:False',1,'[{\"added\": {}}]',13,1),(76,'2019-11-07 01:21:14.900887','1','2.kolo Barselona :None--None: Partizan \"sezona 2007:LIGA\"',1,'[{\"added\": {}}]',12,1),(77,'2019-11-07 01:22:09.388285','2','2007:LIGA',3,'',8,1),(78,'2019-11-07 01:22:28.365081','6','2006:LIGA',1,'[{\"added\": {}}]',8,1),(79,'2019-11-07 01:23:28.151477','2','1.kolo Novi Pazar :2--1: Zvezda \"sezona 2019:KUP\"',1,'[{\"added\": {}}]',12,1),(80,'2019-11-07 01:24:34.149104','3','1.kolo Real :1--2: Barselona \"sezona 2019:LIGA\"',1,'[{\"added\": {}}]',12,1),(81,'2019-11-07 01:31:28.892267','4','1.kolo Real :None--None: Barselona \"sezona 2000:KUP\"',1,'[{\"added\": {}}]',12,1),(82,'2019-11-07 01:32:28.341808','5','1.kolo Partizan :None--None: Zvezda \"sezona 2019:LIGA\"',1,'[{\"added\": {}}]',12,1),(83,'2019-11-07 01:33:35.879676','5','1.kolo Partizan :None--None: Zvezda \"sezona 2019:LIGA\"',3,'',12,1),(84,'2019-11-07 01:34:16.477243','6','5.kolo Partizan :1--1: Zvezda \"sezona 2019:KUP\"',1,'[{\"added\": {}}]',12,1),(85,'2019-11-07 01:35:06.852105','7','1.kolo Partizan :1--1: Novi Beograd \"sezona 2019:LIGA\"',1,'[{\"added\": {}}]',12,1),(86,'2019-11-07 01:35:40.280590','8','2.kolo Real :2--1: Barselona \"sezona 2019:LIGA\"',1,'[{\"added\": {}}]',12,1),(87,'2019-11-07 01:36:20.631605','9','2.kolo Novi Pazar :None--None: Novi Beograd \"sezona 2019:LIGA\"',1,'[{\"added\": {}}]',12,1),(88,'2019-11-07 01:37:43.115107','10','3.kolo Partizan :None--None: Zvezda \"sezona 2019:LIGA\"',1,'[{\"added\": {}}]',12,1),(89,'2019-11-07 01:38:20.664693','11','3.kolo Real :None--None: Barselona \"sezona 2019:LIGA\"',1,'[{\"added\": {}}]',12,1),(90,'2019-11-07 15:26:44.776955','9','2.kolo Novi Pazar :None--None: Novi Beograd \"sezona 2019:LIGA\"',3,'',12,1),(91,'2019-11-07 15:27:50.300667','12','2.kolo Real :None--None: Barselona \"sezona 2019:LIGA\"',1,'[{\"added\": {}}]',12,1),(92,'2019-11-07 15:28:22.760525','8','2.kolo Real :2--1: Barselona \"sezona 2019:LIGA\"',3,'',12,1),(93,'2019-11-07 15:29:27.333665','13','2.kolo Real :1--2: Novi Beograd \"sezona 2019:LIGA\"',1,'[{\"added\": {}}]',12,1),(94,'2019-11-07 19:49:07.337803','11','3.kolo Real :1--2: Barselona \"sezona 2019:LIGA\"',2,'[{\"changed\": {\"fields\": [\"domacin_gol\", \"gost_gol\"]}}]',12,1),(95,'2019-11-08 01:16:39.668637','13','\"sezona 2019:LIGA\":2.kolo Real :1--2: Novi Beograd ',3,'',12,1),(96,'2019-11-08 01:16:39.674705','12','\"sezona 2019:LIGA\":2.kolo Real :None--None: Barselona ',3,'',12,1),(97,'2019-11-08 01:16:39.679635','11','\"sezona 2019:LIGA\":3.kolo Real :1--2: Barselona ',3,'',12,1),(98,'2019-11-08 01:16:39.684640','10','\"sezona 2019:LIGA\":3.kolo Partizan :None--None: Zvezda ',3,'',12,1),(99,'2019-11-08 01:16:39.689633','7','\"sezona 2019:LIGA\":1.kolo Partizan :1--1: Novi Beograd ',3,'',12,1),(100,'2019-11-08 01:17:53.401273','14','\"sezona 2019:LIGA\":1.kolo Real :1--1: Barselona ',1,'[{\"added\": {}}]',12,1),(101,'2019-11-08 01:18:31.307794','15','\"sezona 2019:LIGA\":1.kolo Barselona :1--1: Novi Beograd ',1,'[{\"added\": {}}]',12,1),(102,'2019-11-08 01:20:01.879522','3','\"sezona 2019:LIGA\":1.kolo Real :1--2: Barselona ',3,'',12,1),(103,'2019-11-08 01:21:42.548906','16','2.kolo Zvezda :1--2: Partizan \"sezona 2019:LIGA\"',1,'[{\"added\": {}}]',12,1),(104,'2019-11-08 01:22:20.860311','17','2.kolo Novi Beograd :None--None: Novi Pazar \"sezona 2019:LIGA\"',1,'[{\"added\": {}}]',12,1),(105,'2019-11-08 01:24:14.494992','18','3.kolo Novi Pazar :None--None: Partizan \"sezona 2019:LIGA\"',1,'[{\"added\": {}}]',12,1),(106,'2019-11-08 01:25:02.606831','19','4.kolo Real :None--None: Barselona \"sezona 2019:LIGA\"',1,'[{\"added\": {}}]',12,1),(107,'2019-11-08 01:25:45.175097','20','3.kolo Barselona :None--None: Zvezda \"sezona 2019:LIGA\"',1,'[{\"added\": {}}]',12,1),(108,'2019-11-08 13:39:07.938987','7','2019:LIGA:Novi Pazar:False',2,'[{\"changed\": {\"fields\": [\"aktivan\"]}}]',13,1),(109,'2019-11-08 13:39:40.615180','7','2019:LIGA:Novi Pazar:True',2,'[{\"changed\": {\"fields\": [\"aktivan\"]}}]',13,1),(110,'2019-11-08 13:39:51.607028','5','2019:LIGA:Real:False',2,'[{\"changed\": {\"fields\": [\"aktivan\"]}}]',13,1),(111,'2019-11-08 15:28:23.619086','9','2000:KUP:Real:True',2,'[{\"changed\": {\"fields\": [\"aktivan\"]}}]',13,1),(112,'2019-11-08 15:28:51.305191','5','2019:LIGA:Real:True',2,'[{\"changed\": {\"fields\": [\"aktivan\"]}}]',13,1),(113,'2019-11-08 15:29:19.994093','5','2019:LIGA:Real:False',2,'[{\"changed\": {\"fields\": [\"aktivan\"]}}]',13,1),(114,'2019-11-08 17:52:20.617913','5','2019:LIGA:Real:True',2,'[{\"changed\": {\"fields\": [\"aktivan\"]}}]',13,1),(115,'2019-11-08 17:55:05.529405','7','2019:LIGA:Novi Pazar:False',2,'[{\"changed\": {\"fields\": [\"aktivan\"]}}]',13,1),(116,'2019-11-08 18:02:12.968174','7','2019:LIGA:Novi Pazar:True',2,'[{\"changed\": {\"fields\": [\"aktivan\"]}}]',13,1),(117,'2019-11-08 20:25:21.322453','7','2019:LIGA:Novi Pazar:False',2,'[{\"changed\": {\"fields\": [\"aktivan\"]}}]',13,1),(118,'2019-11-08 20:35:34.632299','7','2019:LIGA:Novi Pazar:True',2,'[{\"changed\": {\"fields\": [\"aktivan\"]}}]',13,1),(119,'2019-11-09 00:36:00.208402','7','2019:LIGA:Novi Pazar:False',2,'[{\"changed\": {\"fields\": [\"aktivan\"]}}]',13,1),(120,'2019-11-09 00:37:16.288954','6','2019:LIGA:Novi Beograd:False',2,'[{\"changed\": {\"fields\": [\"aktivan\"]}}]',13,1),(121,'2019-11-09 00:57:30.453317','6','2019:LIGA:Novi Beograd:True',2,'[{\"changed\": {\"fields\": [\"aktivan\"]}}]',13,1),(122,'2019-11-09 00:57:50.907400','7','2019:LIGA:Novi Pazar:True',2,'[{\"changed\": {\"fields\": [\"aktivan\"]}}]',13,1),(123,'2019-11-09 01:01:33.189800','7','2019:LIGA:Novi Pazar:False',2,'[{\"changed\": {\"fields\": [\"aktivan\"]}}]',13,1),(124,'2019-11-09 01:02:10.547286','5','2019:LIGA:Real:False',2,'[{\"changed\": {\"fields\": [\"aktivan\"]}}]',13,1),(125,'2019-11-09 01:16:02.766508','1','2019:KUP:Real:True',3,'',13,1),(126,'2019-11-09 01:17:37.474856','10','2019:KUP:Partizan:True',1,'[{\"added\": {}}]',13,1),(127,'2019-11-09 01:17:47.744776','11','2019:KUP:Real:True',1,'[{\"added\": {}}]',13,1),(128,'2019-11-10 15:54:29.961702','1','KMF Ozren',1,'[{\"added\": {}}]',11,1),(129,'2019-11-10 16:02:33.693209','2','FK Mladost (Resnik)',1,'[{\"added\": {}}]',11,1),(130,'2019-11-10 16:04:19.487230','3','FK Jedinstvo (Mužinac)',1,'[{\"added\": {}}]',11,1),(131,'2019-11-10 16:08:53.784131','4','FK Hajduk (Rujevica)',1,'[{\"added\": {}}]',11,1),(132,'2019-11-11 14:42:21.650362','1','Rukovodstvo',1,'[{\"added\": {}}]',19,1),(133,'2019-11-11 14:43:22.656625','2','Odbor za hitna pitanja',1,'[{\"added\": {}}]',19,1),(134,'2019-11-11 14:44:15.082411','1','ClanOdbora object (1)',1,'[{\"added\": {}}]',20,1),(135,'2019-11-11 14:44:15.087412','2','ClanOdbora object (2)',1,'[{\"added\": {}}]',20,1),(136,'2019-11-11 14:44:38.472948','3','ClanOdbora object (3)',1,'[{\"added\": {}}]',20,1),(137,'2019-11-11 15:06:39.978907','4','ClanOdbora object (4)',1,'[{\"added\": {}}]',20,1),(138,'2019-11-11 15:16:06.518153','3','Nadzorni odbor',1,'[{\"added\": {}}]',19,1),(139,'2019-11-11 15:18:57.968819','5','Odbor za hitna pitanja:Predsednik',1,'[{\"added\": {}}]',20,1),(140,'2019-11-11 15:19:20.898117','6','Odbor za hitna pitanja:Podpresednik',1,'[{\"added\": {}}]',20,1),(141,'2019-11-11 15:20:19.534701','7','Odbor za hitna pitanja:Sekretar',1,'[{\"added\": {}}]',20,1),(142,'2019-11-11 15:20:40.596328','8','Nadzorni odbor:Predsednik',1,'[{\"added\": {}}]',20,1),(143,'2019-11-11 15:20:56.097166','9','Nadzorni odbor:Podpresednik',1,'[{\"added\": {}}]',20,1),(144,'2019-11-11 15:21:10.531996','10','Nadzorni odbor:Sekretar',1,'[{\"added\": {}}]',20,1),(145,'2019-11-11 15:21:38.895634','1','Rukovodstvo',3,'',19,1),(146,'2019-11-11 15:22:19.100113','4','Rukovodstvo',1,'[{\"added\": {}}]',19,1),(147,'2019-11-11 15:22:54.867990','11','Rukovodstvo:Predsednik',1,'[{\"added\": {}}]',20,1),(148,'2019-11-11 16:07:53.379135','12','Rukovodstvo:Podpresednik',1,'[{\"added\": {}}]',20,1),(149,'2019-11-11 16:43:12.294736','5','Odbor za hitna pitanja:Predsednik',2,'[{\"changed\": {\"fields\": [\"rezime\"]}}]',20,1),(150,'2019-11-11 17:12:37.327349','1','Nesto',1,'[{\"added\": {}}]',15,1),(151,'2019-11-11 17:12:49.091741','2','Milica',1,'[{\"added\": {}}]',15,1),(152,'2019-11-11 17:14:09.405070','1','Nesto',1,'[{\"added\": {}}]',16,1),(153,'2019-11-11 17:14:29.227406','1','Nesto',1,'[{\"added\": {}}]',17,1),(154,'2019-11-11 17:14:49.748110','2','Milica',2,'[{\"changed\": {\"fields\": [\"vest\"]}}]',15,1),(155,'2019-11-13 00:24:16.803350','7','2019:LIGA:Novi Pazar:True',2,'[{\"changed\": {\"fields\": [\"aktivan\"]}}]',13,1),(156,'2019-11-13 00:24:29.889813','5','2019:LIGA:Real:True',2,'[{\"changed\": {\"fields\": [\"aktivan\"]}}]',13,1),(157,'2019-11-13 00:26:31.325159','8','2019:LIGA:Zvezda:False',2,'[{\"changed\": {\"fields\": [\"aktivan\"]}}]',13,1),(158,'2019-11-13 00:54:24.316927','1','Kazne object (1)',1,'[{\"added\": {}}]',14,1),(159,'2019-11-13 00:54:48.945363','2','Kazne object (2)',1,'[{\"added\": {}}]',14,1),(160,'2019-11-13 00:55:09.255017','3','Kazne object (3)',1,'[{\"added\": {}}]',14,1),(161,'2019-11-13 00:55:26.217240','4','Kazne object (4)',1,'[{\"added\": {}}]',14,1),(162,'2019-11-13 01:09:24.497983','5','Kazne object (5)',1,'[{\"added\": {}}]',14,1),(163,'2019-11-13 01:10:21.422920','6','Kazne object (6)',1,'[{\"added\": {}}]',14,1),(164,'2019-11-13 17:00:12.283133','21','2.kolo Real :3--1: Barselona \"sezona 2019:LIGA\"',1,'[{\"added\": {}}]',12,1),(165,'2019-11-14 01:31:22.237376','3','2019:LIGA:Partizan:False',2,'[{\"changed\": {\"fields\": [\"aktivan\"]}}]',13,1),(166,'2019-11-14 01:32:38.242421','3','2019:LIGA:Partizan:True',2,'[{\"changed\": {\"fields\": [\"aktivan\"]}}]',13,1),(167,'2019-11-14 01:33:49.149136','7','2019:LIGA:Novi Pazar:False',2,'[{\"changed\": {\"fields\": [\"aktivan\"]}}]',13,1),(168,'2019-11-14 01:35:16.140713','22','1.kolo Partizan :1--2: Zvezda \"sezona 2019:LIGA\"',1,'[{\"added\": {}}]',12,1),(169,'2019-11-14 01:36:05.155499','8','2019:LIGA:Zvezda:True',2,'[{\"changed\": {\"fields\": [\"aktivan\"]}}]',13,1),(170,'2019-11-14 01:40:10.308937','7','2019:LIGA:Novi Pazar:True',2,'[{\"changed\": {\"fields\": [\"aktivan\"]}}]',13,1),(171,'2019-11-14 01:41:22.611313','23','3.kolo Zvezda :1--2: Novi Pazar \"sezona 2019:LIGA\"',1,'[{\"added\": {}}]',12,1),(172,'2019-11-14 01:42:24.409858','3','2019:LIGA:Partizan:False',2,'[{\"changed\": {\"fields\": [\"aktivan\"]}}]',13,1),(173,'2019-11-14 15:49:04.390634','1','Obavestenja object (1)',1,'[{\"added\": {}}]',21,1),(174,'2019-11-14 16:51:11.383371','11','Rukovodstvo:Predsednik',2,'[{\"changed\": {\"fields\": [\"slika\"]}}]',20,1),(175,'2019-11-14 16:53:19.227250','11','Rukovodstvo:Predsednik',2,'[{\"changed\": {\"fields\": [\"slika\"]}}]',20,1),(176,'2019-11-14 17:05:07.218385','1','Pravila',1,'[{\"added\": {}}]',22,1),(177,'2019-11-15 00:51:12.931432','3','2019:LIGA:Partizan:True',2,'[{\"changed\": {\"fields\": [\"aktivan\"]}}]',13,1),(178,'2019-11-15 00:55:42.045889','7','2019:LIGA:Novi Pazar:False',2,'[{\"changed\": {\"fields\": [\"aktivan\"]}}]',13,1),(179,'2019-11-20 13:10:49.430068','5','nemanja',1,'[{\"added\": {}}]',19,1),(180,'2019-11-20 13:41:40.395241','6','Bakir Curic',1,'[{\"added\": {}}]',9,1),(181,'2019-11-20 13:42:48.810147','7','Nemanja Bole',1,'[{\"added\": {}}]',9,1),(182,'2019-11-20 22:56:06.624741','None','nemanja:Predsednik',1,'[{\"added\": {}}]',20,1),(183,'2019-11-20 23:04:46.507624','None','nemanja:Predsednik',1,'[{\"added\": {}}]',20,1),(184,'2019-11-20 23:06:45.974474','13','nemanja:Predsednik',1,'[{\"added\": {}}]',20,1),(185,'2019-11-22 14:13:50.374793','24','7.kolo Real :1--2: Barselona \"sezona 2019:LIGA\"',1,'[{\"added\": {}}]',12,1),(186,'2019-11-22 22:45:19.477656','25','2.kolo Partizan :30--2: Real \"sezona 2019:LIGA\"',1,'[{\"added\": {}}]',12,1),(187,'2019-11-22 23:11:43.829656','25','2.kolo Partizan :30--2: Real \"sezona 2019:LIGA\"',3,'',12,1),(188,'2019-11-22 23:21:57.750320','26','2.kolo Real :1--1: Novi Pazar \"sezona 2019:LIGA\"',1,'[{\"added\": {}}]',12,1),(189,'2019-11-22 23:24:15.219408','7','2019:LIGA:Novi Pazar:True',2,'[{\"changed\": {\"fields\": [\"aktivan\"]}}]',13,1),(190,'2019-11-22 23:26:03.606806','27','4.kolo Zvezda :5--0: Novi Pazar \"sezona 2019:LIGA\"',1,'[{\"added\": {}}]',12,1),(191,'2019-11-22 23:28:56.545537','27','4.kolo Zvezda :50--0: Novi Pazar \"sezona 2019:LIGA\"',2,'[{\"changed\": {\"fields\": [\"domacin_gol\"]}}]',12,1),(192,'2019-11-22 23:33:43.179737','26','2.kolo Real :1--1: Novi Pazar \"sezona 2019:LIGA\"',3,'',12,1),(193,'2019-11-22 23:33:43.187215','24','7.kolo Real :1--2: Barselona \"sezona 2019:LIGA\"',3,'',12,1),(194,'2019-11-22 23:33:43.192750','23','3.kolo Zvezda :1--2: Novi Pazar \"sezona 2019:LIGA\"',3,'',12,1),(195,'2019-11-22 23:33:43.197205','22','1.kolo Partizan :1--2: Zvezda \"sezona 2019:LIGA\"',3,'',12,1),(196,'2019-11-22 23:33:43.201201','21','2.kolo Real :3--1: Barselona \"sezona 2019:LIGA\"',3,'',12,1),(197,'2019-11-22 23:33:43.205696','20','3.kolo Barselona :None--None: Zvezda \"sezona 2019:LIGA\"',3,'',12,1),(198,'2019-11-22 23:33:43.209692','19','4.kolo Real :None--None: Barselona \"sezona 2019:LIGA\"',3,'',12,1),(199,'2019-11-22 23:33:43.213688','18','3.kolo Novi Pazar :None--None: Partizan \"sezona 2019:LIGA\"',3,'',12,1),(200,'2019-11-22 23:33:43.218185','17','2.kolo Novi Beograd :None--None: Novi Pazar \"sezona 2019:LIGA\"',3,'',12,1),(201,'2019-11-22 23:33:43.223677','16','2.kolo Zvezda :1--2: Partizan \"sezona 2019:LIGA\"',3,'',12,1),(202,'2019-11-22 23:33:43.228173','15','1.kolo Barselona :1--1: Novi Beograd \"sezona 2019:LIGA\"',3,'',12,1),(203,'2019-11-22 23:33:43.232671','14','1.kolo Real :1--1: Barselona \"sezona 2019:LIGA\"',3,'',12,1),(204,'2019-11-22 23:33:43.237204','6','5.kolo Partizan :1--1: Zvezda \"sezona 2019:KUP\"',3,'',12,1),(205,'2019-11-22 23:33:43.242159','4','1.kolo Real :None--None: Barselona \"sezona 2000:KUP\"',3,'',12,1),(206,'2019-11-22 23:33:43.246654','2','1.kolo Novi Pazar :2--1: Zvezda \"sezona 2019:KUP\"',3,'',12,1),(207,'2019-11-22 23:34:24.400494','27','4.kolo Zvezda :50--0: Novi Pazar \"sezona 2019:LIGA\"',2,'[]',12,1),(208,'2019-11-22 23:43:23.728135','7','2019:LIGA:Novi Pazar:False',2,'[{\"changed\": {\"fields\": [\"aktivan\"]}}]',13,1),(209,'2019-11-22 23:44:16.673362','28','1.kolo Real :2--1: Barselona \"sezona 2019:LIGA\"',1,'[{\"added\": {}}]',12,1),(210,'2019-11-22 23:45:43.458403','29','3.kolo Barselona :4--1: Novi Beograd \"sezona 2019:LIGA\"',1,'[{\"added\": {}}]',12,1),(211,'2019-11-22 23:46:29.637569','30','4.kolo Real :3--1: Zvezda \"sezona 2019:LIGA\"',1,'[{\"added\": {}}]',12,1),(212,'2019-11-22 23:48:29.596606','31','1.kolo Novi Beograd :0--4: Zvezda \"sezona 2019:LIGA\"',1,'[{\"added\": {}}]',12,1),(213,'2019-11-22 23:48:50.345335','31','1.kolo Novi Beograd :0--5: Zvezda \"sezona 2019:LIGA\"',2,'[{\"changed\": {\"fields\": [\"gost_gol\"]}}]',12,1),(214,'2019-11-22 23:55:18.747204','32','1.kolo Real :None--None: Partizan \"sezona 2019:LIGA\"',1,'[{\"added\": {}}]',12,1),(215,'2019-11-23 00:03:21.615743','6','2020:LIGA',2,'[{\"changed\": {\"fields\": [\"sezona\"]}}]',8,1),(216,'2019-11-23 00:04:28.674506','33','1.kolo Real :None--None: Barselona \"sezona 2020:LIGA\"',1,'[{\"added\": {}}]',12,1),(217,'2019-11-23 00:19:25.111614','34','1.kolo Novi Pazar :None--None: Novi Beograd \"sezona 2020:LIGA\"',1,'[{\"added\": {}}]',12,1),(218,'2019-11-23 00:29:33.235758','12','2020:LIGA:Real:True',1,'[{\"added\": {}}]',13,1),(219,'2019-11-23 00:30:13.953520','13','2020:LIGA:Barselona:True',1,'[{\"added\": {}}]',13,1),(220,'2019-11-23 01:19:40.625620','14','2020:LIGA:Novi Pazar:True',1,'[{\"added\": {}}]',13,1),(221,'2019-11-23 01:20:20.069690','15','2020:LIGA:Novi Beograd:True',1,'[{\"added\": {}}]',13,1),(222,'2019-11-23 01:21:02.302935','34','1.kolo Novi Pazar :3--4: Novi Beograd \"sezona 2020:LIGA\"',2,'[{\"changed\": {\"fields\": [\"domacin_gol\", \"gost_gol\"]}}]',12,1),(223,'2019-11-25 01:14:19.882538','7','2020:LIGA:Real:True:2',1,'[{\"added\": {}}]',14,1),(224,'2019-11-25 01:15:10.674473','8','2020:LIGA:Novi Beograd:True:1',1,'[{\"added\": {}}]',14,1),(225,'2019-11-25 14:30:44.319412','34','1.kolo Novi Pazar :3--4: Novi Beograd \"sezona 2020:LIGA\"',3,'',12,1),(226,'2019-11-25 14:30:44.326411','33','1.kolo Real :None--None: Barselona \"sezona 2020:LIGA\"',3,'',12,1),(227,'2019-11-25 14:31:29.364499','15','2020:LIGA:Novi Beograd:True',3,'',13,1),(228,'2019-11-25 14:31:29.370483','14','2020:LIGA:Novi Pazar:True',3,'',13,1),(229,'2019-11-25 14:31:29.375483','13','2020:LIGA:Barselona:True',3,'',13,1),(230,'2019-11-25 14:31:29.379482','12','2020:LIGA:Real:True',3,'',13,1),(231,'2019-11-25 14:31:44.125120','6','2020:LIGA',3,'',8,1),(232,'2019-11-25 19:08:33.615667','3','Sfklsfkl    Fsdjfklj Ss',1,'[{\"added\": {}}]',7,1),(233,'2019-12-01 18:12:42.360441','1','Milica',1,'[{\"added\": {}}]',23,1),(234,'2019-12-01 18:17:30.153295','2','Nesto',1,'[{\"added\": {}}]',23,1),(235,'2019-12-01 18:18:04.549523','1','None',1,'[{\"added\": {}}]',24,1),(236,'2019-12-01 18:18:29.913515','1','Amra',1,'[{\"added\": {}}]',25,1),(237,'2019-12-01 18:19:35.918328','1','Amra',2,'[{\"changed\": {\"fields\": [\"video\", \"vest\"]}}]',24,1),(238,'2019-12-01 18:20:17.354335','3','Nesto',1,'[{\"added\": {}}]',23,1),(239,'2019-12-02 00:30:43.106189','2','Nesto',1,'[{\"added\": {}}]',25,1),(240,'2019-12-02 00:30:50.007606','3','sadas',1,'[{\"added\": {}}]',25,1),(241,'2019-12-02 00:32:09.545542','3','Nesto',2,'[{\"changed\": {\"fields\": [\"vest\"]}}]',23,1),(242,'2019-12-02 00:35:13.037406','2','sadas',1,'[{\"added\": {}}]',24,1),(243,'2019-12-02 00:35:56.430957','1','Amra',2,'[{\"changed\": {\"fields\": [\"video\"]}}]',24,1),(244,'2019-12-02 00:36:55.938972','4','Milica',1,'[{\"added\": {}}]',23,1),(245,'2019-12-02 00:43:43.760119','1','Milica',2,'[{\"changed\": {\"fields\": [\"vest\"]}}]',23,1),(246,'2019-12-02 02:10:03.591865','4','Nemanja',1,'[{\"added\": {}}]',25,1),(247,'2019-12-02 13:43:29.271762','5','bakir',1,'[{\"added\": {}}]',23,1),(248,'2019-12-02 13:43:40.952599','6','sda',1,'[{\"added\": {}}]',23,1),(249,'2019-12-02 14:27:40.538474','7','Prag',1,'[{\"added\": {}}]',10,1),(250,'2019-12-02 14:28:04.235186','16','2019:LIGA:Prag:True',1,'[{\"added\": {}}]',13,1),(251,'2019-12-03 00:26:51.033901','35','4.kolo Barselona :1--2: Partizan \"sezona 2019:LIGA\"',1,'[{\"added\": {}}]',12,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(20,'fudbal','clanodbora'),(7,'fudbal','delegat'),(14,'fudbal','kazne'),(21,'fudbal','obavestenja'),(19,'fudbal','odbor'),(22,'fudbal','propisi'),(8,'fudbal','sezona'),(23,'fudbal','slika'),(9,'fudbal','sudija'),(10,'fudbal','tim'),(11,'fudbal','timovisokobanja'),(13,'fudbal','timsezona'),(18,'fudbal','tipsezone'),(12,'fudbal','utakmica'),(25,'fudbal','vest'),(24,'fudbal','video'),(6,'sessions','session'),(15,'vesti','slika'),(16,'vesti','vest'),(17,'vesti','video');
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
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-11-05 14:29:07.891231'),(2,'auth','0001_initial','2019-11-05 14:29:08.273362'),(3,'admin','0001_initial','2019-11-05 14:29:09.306283'),(4,'admin','0002_logentry_remove_auto_add','2019-11-05 14:29:09.540549'),(5,'admin','0003_logentry_add_action_flag_choices','2019-11-05 14:29:09.558023'),(6,'contenttypes','0002_remove_content_type_name','2019-11-05 14:29:09.801274'),(7,'auth','0002_alter_permission_name_max_length','2019-11-05 14:29:10.001070'),(8,'auth','0003_alter_user_email_max_length','2019-11-05 14:29:10.062008'),(9,'auth','0004_alter_user_username_opts','2019-11-05 14:29:10.083986'),(10,'auth','0005_alter_user_last_login_null','2019-11-05 14:29:10.323739'),(11,'auth','0006_require_contenttypes_0002','2019-11-05 14:29:10.329233'),(12,'auth','0007_alter_validators_add_error_messages','2019-11-05 14:29:10.343219'),(13,'auth','0008_alter_user_username_max_length','2019-11-05 14:29:10.478579'),(14,'auth','0009_alter_user_last_name_max_length','2019-11-05 14:29:10.642413'),(15,'auth','0010_alter_group_name_max_length','2019-11-05 14:29:10.678875'),(16,'auth','0011_update_proxy_permissions','2019-11-05 14:29:10.694402'),(18,'sessions','0001_initial','2019-11-05 14:29:12.697307'),(28,'fudbal','0002_auto_20191105_1536','2019-11-05 14:36:16.443182'),(29,'fudbal','0003_auto_20191106_1439','2019-11-06 13:41:30.957355'),(30,'fudbal','0004_auto_20191106_1441','2019-11-06 13:41:31.319984'),(31,'fudbal','0001_initial','2019-11-06 16:29:47.129595'),(32,'vesti','0001_initial','2019-11-06 16:52:15.099660'),(33,'vesti','0002_auto_20191027_0024','2019-11-06 16:52:15.223034'),(34,'vesti','0003_auto_20191027_0034','2019-11-06 16:52:15.317470'),(35,'vesti','0004_auto_20191027_0037','2019-11-06 16:52:15.327928'),(36,'vesti','0005_auto_20191028_1512','2019-11-06 16:52:15.354900'),(37,'vesti','0006_auto_20191028_1515','2019-11-06 16:52:15.381372'),(38,'vesti','0007_auto_20191029_1807','2019-11-06 16:52:15.489761'),(39,'vesti','0008_auto_20191104_0211','2019-11-06 16:52:15.671596'),(40,'vesti','0009_auto_20191104_1632','2019-11-06 16:52:16.340891'),(41,'fudbal','0002_clanodbora_odbor','2019-11-11 14:40:47.213368'),(42,'fudbal','0003_clanodbora_rezime','2019-11-11 15:04:31.422058'),(43,'fudbal','0004_auto_20191111_1606','2019-11-11 15:06:31.674464'),(44,'fudbal','0005_auto_20191113_1525','2019-11-13 14:25:27.056390'),(45,'fudbal','0006_obavestenja','2019-11-14 15:46:40.980107'),(46,'fudbal','0007_auto_20191114_1800','2019-11-14 17:00:10.618556'),(47,'fudbal','0008_propisi','2019-11-14 17:03:40.485947'),(48,'fudbal','0009_slika_vest_video','2019-12-01 18:07:25.543842');
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
INSERT INTO `django_session` VALUES ('otfpi9q8bvu2k4pprb9tlc9fgq0pne44','N2ZmNzg2ZjY4ZjdkMTQ4NjYwMjMyMjVjZmEwZmUzMjJkMjNmM2FmMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2NzU0Mjk3Y2I2MzY2MjU2MWFkZjU4ZmVjM2Q5YTUzMzE3Mzg1MTcyIn0=','2019-12-04 13:08:52.768007'),('riw4jebcrzf4n6k6dczy1g6x37px955q','N2ZmNzg2ZjY4ZjdkMTQ4NjYwMjMyMjVjZmEwZmUzMjJkMjNmM2FmMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2NzU0Mjk3Y2I2MzY2MjU2MWFkZjU4ZmVjM2Q5YTUzMzE3Mzg1MTcyIn0=','2019-11-19 14:38:38.765914');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fudbal_clanodbora`
--

DROP TABLE IF EXISTS `fudbal_clanodbora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `fudbal_clanodbora` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `funkcija` varchar(100) NOT NULL,
  `ime` varchar(30) NOT NULL,
  `prezime` varchar(30) NOT NULL,
  `slika` varchar(100) DEFAULT NULL,
  `odbor_id` int(11) NOT NULL,
  `rezime` longtext,
  PRIMARY KEY (`id`),
  KEY `fudbal_clanodbora_odbor_id_1bfea64c_fk_fudbal_odbor_id` (`odbor_id`),
  CONSTRAINT `fudbal_clanodbora_odbor_id_1bfea64c_fk_fudbal_odbor_id` FOREIGN KEY (`odbor_id`) REFERENCES `fudbal_odbor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fudbal_clanodbora`
--

LOCK TABLES `fudbal_clanodbora` WRITE;
/*!40000 ALTER TABLE `fudbal_clanodbora` DISABLE KEYS */;
INSERT INTO `fudbal_clanodbora` VALUES (5,'Predsednik','Bakir','Dolovac','',2,''),(6,'Podpresednik','Novi','Dolovac','',2,''),(7,'Sekretar','Bakir','Dolovac','',2,''),(8,'Predsednik','Bakir','Mijailovic','',3,''),(9,'Podpresednik','Novi','Dolovac','',3,''),(10,'Sekretar','Nemanja','Dolovac','',3,''),(11,'Predsednik','Bakir','Markovic','odbor_img/20190509_121044_S1Voh9G.jpg',4,'dasdasdasdas'),(12,'Podpresednik','Bakir','Mijailovic','',4,'fsdfsdfsdfsdfsdsdf'),(13,'Predsednik','Bakir','Markovic','',5,'');
/*!40000 ALTER TABLE `fudbal_clanodbora` ENABLE KEYS */;
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
  `datum_rodjenja` date DEFAULT NULL,
  `zvanje` varchar(200) DEFAULT NULL,
  `slika` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fudbal_delegat`
--

LOCK TABLES `fudbal_delegat` WRITE;
/*!40000 ALTER TABLE `fudbal_delegat` DISABLE KEYS */;
INSERT INTO `fudbal_delegat` VALUES (1,'Bakir','Markovic','2019-11-03','sudija 2. kat -Srpska liga Istok','sudija.jpg'),(2,'Nemanja','Curic','2019-11-03','sudija 2. kat -Srpska liga Istok','delegat_img/nathan-rogers-I9HyW30buuQ-unsplash_42pdcQ5.jpg'),(3,'Sfklsfkl    Fsdjfklj','Ss',NULL,'sudija 2. kat -Srpska liga Istok','sudija.jpg');
/*!40000 ALTER TABLE `fudbal_delegat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fudbal_kazne`
--

DROP TABLE IF EXISTS `fudbal_kazne`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `fudbal_kazne` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kazneni_bodovi` smallint(5) unsigned NOT NULL,
  `razlog` longtext NOT NULL,
  `datum` date NOT NULL,
  `tim_u_sezoni_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fudbal_kazne_tim_u_sezoni_id_d94e091b_fk_fudbal_timsezona_id` (`tim_u_sezoni_id`),
  CONSTRAINT `fudbal_kazne_tim_u_sezoni_id_d94e091b_fk_fudbal_timsezona_id` FOREIGN KEY (`tim_u_sezoni_id`) REFERENCES `fudbal_timsezona` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fudbal_kazne`
--

LOCK TABLES `fudbal_kazne` WRITE;
/*!40000 ALTER TABLE `fudbal_kazne` DISABLE KEYS */;
INSERT INTO `fudbal_kazne` VALUES (1,3,'Nije je se pojavio na utakmici','2019-11-13',5),(2,2,'sdas','2019-11-13',5),(3,3,'asdasdas','2019-11-13',6),(4,2,'asdasda','2019-11-13',3),(5,3,'asdas','2019-11-13',10),(6,2,'sdsad','2019-11-13',9);
/*!40000 ALTER TABLE `fudbal_kazne` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fudbal_obavestenja`
--

DROP TABLE IF EXISTS `fudbal_obavestenja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `fudbal_obavestenja` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naslov` varchar(200) NOT NULL,
  `fajl` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fudbal_obavestenja`
--

LOCK TABLES `fudbal_obavestenja` WRITE;
/*!40000 ALTER TABLE `fudbal_obavestenja` DISABLE KEYS */;
INSERT INTO `fudbal_obavestenja` VALUES (1,'Klub je izbacen iz lige','obavestenja/ФУДБАЛСКИ_САВЕЗ_ОПШТИНЕ_СОКОБАЊА_Искључење_из_лиге.docx');
/*!40000 ALTER TABLE `fudbal_obavestenja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fudbal_odbor`
--

DROP TABLE IF EXISTS `fudbal_odbor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `fudbal_odbor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naziv_odbora` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fudbal_odbor`
--

LOCK TABLES `fudbal_odbor` WRITE;
/*!40000 ALTER TABLE `fudbal_odbor` DISABLE KEYS */;
INSERT INTO `fudbal_odbor` VALUES (2,'Odbor za hitna pitanja'),(3,'Nadzorni odbor'),(4,'Rukovodstvo'),(5,'nemanja');
/*!40000 ALTER TABLE `fudbal_odbor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fudbal_propisi`
--

DROP TABLE IF EXISTS `fudbal_propisi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `fudbal_propisi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naslov` varchar(200) NOT NULL,
  `fajl` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fudbal_propisi`
--

LOCK TABLES `fudbal_propisi` WRITE;
/*!40000 ALTER TABLE `fudbal_propisi` DISABLE KEYS */;
INSERT INTO `fudbal_propisi` VALUES (1,'Pravila','propisi/ПРОПОЗИЦИЈЕ_ТАКМИЧЕЊА.docx');
/*!40000 ALTER TABLE `fudbal_propisi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fudbal_sezona`
--

DROP TABLE IF EXISTS `fudbal_sezona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `fudbal_sezona` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sezona` smallint(5) unsigned NOT NULL,
  `tip_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fudbal_sezona_sezona_tip_id_b69405fa_uniq` (`sezona`,`tip_id`),
  KEY `fudbal_sezona_tip_id_7d018d8d_fk_fudbal_tipsezone_id` (`tip_id`),
  CONSTRAINT `fudbal_sezona_tip_id_7d018d8d_fk_fudbal_tipsezone_id` FOREIGN KEY (`tip_id`) REFERENCES `fudbal_tipsezone` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fudbal_sezona`
--

LOCK TABLES `fudbal_sezona` WRITE;
/*!40000 ALTER TABLE `fudbal_sezona` DISABLE KEYS */;
INSERT INTO `fudbal_sezona` VALUES (3,2000,3),(1,2018,2),(4,2019,2),(5,2019,3);
/*!40000 ALTER TABLE `fudbal_sezona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fudbal_slika`
--

DROP TABLE IF EXISTS `fudbal_slika`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `fudbal_slika` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naslov` varchar(100) NOT NULL,
  `vreme_posta` datetime(6) NOT NULL,
  `slika` varchar(100) NOT NULL,
  `vest_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fudbal_slika_vest_id_4d3a7f8c_fk_fudbal_vest_id` (`vest_id`),
  CONSTRAINT `fudbal_slika_vest_id_4d3a7f8c_fk_fudbal_vest_id` FOREIGN KEY (`vest_id`) REFERENCES `fudbal_vest` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fudbal_slika`
--

LOCK TABLES `fudbal_slika` WRITE;
/*!40000 ALTER TABLE `fudbal_slika` DISABLE KEYS */;
INSERT INTO `fudbal_slika` VALUES (1,'Milica','2019-12-01 18:12:25.000000','galerija_img/20190509_121044.jpg',1),(2,'Nesto','2019-12-01 18:12:44.000000','galerija_img/CHECK.png',NULL),(3,'Nesto','2019-12-01 18:20:04.000000','galerija_img/20190509_115719_QRS68rZ.jpg',3),(4,'Milica','2019-12-02 00:36:36.000000','galerija_img/20190917_082328.jpg',1),(5,'bakir','2019-12-02 13:43:15.000000','galerija_img/liga_html.png',NULL),(6,'sda','2019-12-02 13:43:31.000000','galerija_img/20190509_121044_XlSo5es.jpg',NULL);
/*!40000 ALTER TABLE `fudbal_slika` ENABLE KEYS */;
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
  `zvanje` varchar(200) DEFAULT NULL,
  `datum_rodjenja` date DEFAULT NULL,
  `slika` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fudbal_sudija`
--

LOCK TABLES `fudbal_sudija` WRITE;
/*!40000 ALTER TABLE `fudbal_sudija` DISABLE KEYS */;
INSERT INTO `fudbal_sudija` VALUES (1,'Bakir','Curic','sudija 2. kat -Srpska liga Istok','1996-03-05','sudija.jpg'),(2,'Nemanja','Mijailovic','sudija 2. kat -Srpska liga zapad','2019-11-05','delegat_img/lesly-juarez-isWEKdSRCrA-unsplash_Y3Y2NF7.jpg'),(3,'Milica','Miljkov','sudija 3. kat -Srpska liga Istok','2002-11-06','delegat_img/sandro-schuh-HgwY_YQ1m0w-unsplash.jpg'),(4,'Timur','Curic','sudija 2. kat -Srpska liga Istok','2019-11-12','delegat_img/nathan-rogers-I9HyW30buuQ-unsplash.jpg'),(5,'Amra','Curic','sudija 2. kat -Srpska liga Istok',NULL,'sudija.jpg'),(6,'Bakir','Curic','sudija 2. kat -Srpska liga Istok','2019-11-20','delegat_img/20190509_121044.jpg'),(7,'Nemanja','Bole','sudija 2. kat -Srpska liga Istok','2019-11-20','delegat_img/20190509_121044_I8hfSn6.jpg');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fudbal_tim`
--

LOCK TABLES `fudbal_tim` WRITE;
/*!40000 ALTER TABLE `fudbal_tim` DISABLE KEYS */;
INSERT INTO `fudbal_tim` VALUES (1,'Real'),(2,'Barselona'),(3,'Partizan'),(4,'Novi Beograd'),(5,'Zvezda'),(6,'Novi Pazar'),(7,'Prag');
/*!40000 ALTER TABLE `fudbal_tim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fudbal_timovisokobanja`
--

DROP TABLE IF EXISTS `fudbal_timovisokobanja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `fudbal_timovisokobanja` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ime` varchar(30) NOT NULL,
  `ucesce` varchar(100) NOT NULL,
  `logo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fudbal_timovisokobanja`
--

LOCK TABLES `fudbal_timovisokobanja` WRITE;
/*!40000 ALTER TABLE `fudbal_timovisokobanja` DISABLE KEYS */;
INSERT INTO `fudbal_timovisokobanja` VALUES (1,'KMF Ozren','Regionalna futsal liga - grupa Sever','logo_img/FK_Ozren.png'),(2,'FK Mladost (Resnik)','OFL Sokobanja','logo_img/FK_Mladost.jpg'),(3,'FK Jedinstvo (Mužinac)','OFL Sokobanja','logo_img/FK_Jedinstvo.jpg'),(4,'FK Hajduk (Rujevica)','Zaječarska okružna liga','logo_img/FK_Jedinstvo_25c22LO.jpg');
/*!40000 ALTER TABLE `fudbal_timovisokobanja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fudbal_timsezona`
--

DROP TABLE IF EXISTS `fudbal_timsezona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `fudbal_timsezona` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aktivan` tinyint(1) NOT NULL,
  `sezona_id` int(11) NOT NULL,
  `tim_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fudbal_timsezona_sezona_id_tim_id_a09a4844_uniq` (`sezona_id`,`tim_id`),
  KEY `fudbal_timsezona_tim_id_75a335d8_fk_fudbal_tim_id` (`tim_id`),
  CONSTRAINT `fudbal_timsezona_sezona_id_c677856b_fk_fudbal_sezona_id` FOREIGN KEY (`sezona_id`) REFERENCES `fudbal_sezona` (`id`),
  CONSTRAINT `fudbal_timsezona_tim_id_75a335d8_fk_fudbal_tim_id` FOREIGN KEY (`tim_id`) REFERENCES `fudbal_tim` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fudbal_timsezona`
--

LOCK TABLES `fudbal_timsezona` WRITE;
/*!40000 ALTER TABLE `fudbal_timsezona` DISABLE KEYS */;
INSERT INTO `fudbal_timsezona` VALUES (2,1,3,2),(3,1,4,3),(4,1,4,2),(5,1,4,1),(6,1,4,4),(7,0,4,6),(8,1,4,5),(9,1,3,1),(10,1,5,3),(11,1,5,1),(16,1,4,7);
/*!40000 ALTER TABLE `fudbal_timsezona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fudbal_tipsezone`
--

DROP TABLE IF EXISTS `fudbal_tipsezone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `fudbal_tipsezone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tip` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fudbal_tipsezone`
--

LOCK TABLES `fudbal_tipsezone` WRITE;
/*!40000 ALTER TABLE `fudbal_tipsezone` DISABLE KEYS */;
INSERT INTO `fudbal_tipsezone` VALUES (2,'LIGA'),(3,'KUP');
/*!40000 ALTER TABLE `fudbal_tipsezone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fudbal_utakmica`
--

DROP TABLE IF EXISTS `fudbal_utakmica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `fudbal_utakmica` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kolo` smallint(5) unsigned NOT NULL,
  `domacin_gol` smallint(5) unsigned DEFAULT NULL,
  `gost_gol` smallint(5) unsigned DEFAULT NULL,
  `mesto_odigravanja` varchar(100) NOT NULL,
  `datum_zakazano` datetime(6) DEFAULT NULL,
  `delegat_id` int(11) NOT NULL,
  `domacin_id` int(11) NOT NULL,
  `drugi_pomocnik_id` int(11) NOT NULL,
  `glavni_sudija_id` int(11) NOT NULL,
  `gost_id` int(11) NOT NULL,
  `prvi_pomocnik_id` int(11) NOT NULL,
  `sezona_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fudbal_utakmica_delegat_id_2beb6053_fk_fudbal_delegat_id` (`delegat_id`),
  KEY `fudbal_utakmica_domacin_id_86b760d0_fk_fudbal_tim_id` (`domacin_id`),
  KEY `fudbal_utakmica_drugi_pomocnik_id_f29525e8_fk_fudbal_sudija_id` (`drugi_pomocnik_id`),
  KEY `fudbal_utakmica_glavni_sudija_id_602a63b2_fk_fudbal_sudija_id` (`glavni_sudija_id`),
  KEY `fudbal_utakmica_gost_id_932071e5_fk_fudbal_tim_id` (`gost_id`),
  KEY `fudbal_utakmica_prvi_pomocnik_id_374c551c_fk_fudbal_sudija_id` (`prvi_pomocnik_id`),
  KEY `fudbal_utakmica_sezona_id_29e1a105_fk_fudbal_sezona_id` (`sezona_id`),
  CONSTRAINT `fudbal_utakmica_delegat_id_2beb6053_fk_fudbal_delegat_id` FOREIGN KEY (`delegat_id`) REFERENCES `fudbal_delegat` (`id`),
  CONSTRAINT `fudbal_utakmica_domacin_id_86b760d0_fk_fudbal_tim_id` FOREIGN KEY (`domacin_id`) REFERENCES `fudbal_tim` (`id`),
  CONSTRAINT `fudbal_utakmica_drugi_pomocnik_id_f29525e8_fk_fudbal_sudija_id` FOREIGN KEY (`drugi_pomocnik_id`) REFERENCES `fudbal_sudija` (`id`),
  CONSTRAINT `fudbal_utakmica_glavni_sudija_id_602a63b2_fk_fudbal_sudija_id` FOREIGN KEY (`glavni_sudija_id`) REFERENCES `fudbal_sudija` (`id`),
  CONSTRAINT `fudbal_utakmica_gost_id_932071e5_fk_fudbal_tim_id` FOREIGN KEY (`gost_id`) REFERENCES `fudbal_tim` (`id`),
  CONSTRAINT `fudbal_utakmica_prvi_pomocnik_id_374c551c_fk_fudbal_sudija_id` FOREIGN KEY (`prvi_pomocnik_id`) REFERENCES `fudbal_sudija` (`id`),
  CONSTRAINT `fudbal_utakmica_sezona_id_29e1a105_fk_fudbal_sezona_id` FOREIGN KEY (`sezona_id`) REFERENCES `fudbal_sezona` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fudbal_utakmica`
--

LOCK TABLES `fudbal_utakmica` WRITE;
/*!40000 ALTER TABLE `fudbal_utakmica` DISABLE KEYS */;
INSERT INTO `fudbal_utakmica` VALUES (27,4,50,0,'beogard','2019-11-22 23:26:01.000000',2,5,5,2,6,1,4),(28,1,2,1,'pozega','2019-11-22 23:44:15.000000',2,1,3,2,2,1,4),(29,3,4,1,'prag','2019-11-22 23:45:42.000000',1,2,4,2,4,1,4),(30,4,3,1,'pozega','2019-11-22 23:46:28.000000',2,1,3,1,5,2,4),(31,1,0,5,'prag','2019-11-22 23:48:25.000000',2,4,4,1,5,2,4),(32,1,NULL,NULL,'pozega','2019-11-22 23:55:15.000000',2,1,3,1,3,2,4),(35,4,1,2,'beogard','2019-12-03 00:26:47.000000',1,2,4,1,3,2,4);
/*!40000 ALTER TABLE `fudbal_utakmica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fudbal_vest`
--

DROP TABLE IF EXISTS `fudbal_vest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `fudbal_vest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naslov` varchar(100) NOT NULL,
  `sadrzaj` longtext NOT NULL,
  `vreme_posta` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fudbal_vest`
--

LOCK TABLES `fudbal_vest` WRITE;
/*!40000 ALTER TABLE `fudbal_vest` DISABLE KEYS */;
INSERT INTO `fudbal_vest` VALUES (1,'Amra','dasdla;\'dlasd;\'asld;\'lasdlasld;\'asld;as;dl;\'asld;\'als;\'dla;\'','2019-12-01 18:18:15.000000'),(2,'Nesto','sadasd','2019-12-02 00:30:35.000000'),(3,'sadas','sadasdas','2019-12-02 00:30:45.000000'),(4,'Nemanja','gghghgh','2019-12-02 02:09:57.000000');
/*!40000 ALTER TABLE `fudbal_vest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fudbal_video`
--

DROP TABLE IF EXISTS `fudbal_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `fudbal_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video` varchar(100) DEFAULT NULL,
  `vest_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fudbal_video_vest_id_72d1363b_fk_fudbal_vest_id` (`vest_id`),
  CONSTRAINT `fudbal_video_vest_id_72d1363b_fk_fudbal_vest_id` FOREIGN KEY (`vest_id`) REFERENCES `fudbal_vest` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fudbal_video`
--

LOCK TABLES `fudbal_video` WRITE;
/*!40000 ALTER TABLE `fudbal_video` DISABLE KEYS */;
INSERT INTO `fudbal_video` VALUES (1,'https://www.youtube.com/embed/FGQTLVJk2es',1),(2,'https://www.youtube.com/embed/FGQTLVJk2es',3);
/*!40000 ALTER TABLE `fudbal_video` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-03 18:16:27
