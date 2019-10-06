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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add delegat',7,'add_delegat'),(26,'Can change delegat',7,'change_delegat'),(27,'Can delete delegat',7,'delete_delegat'),(28,'Can view delegat',7,'view_delegat'),(29,'Can add sudija',8,'add_sudija'),(30,'Can change sudija',8,'change_sudija'),(31,'Can delete sudija',8,'delete_sudija'),(32,'Can view sudija',8,'view_sudija'),(33,'Can add tim',9,'add_tim'),(34,'Can change tim',9,'change_tim'),(35,'Can delete tim',9,'delete_tim'),(36,'Can view tim',9,'view_tim'),(37,'Can add utakmica',10,'add_utakmica'),(38,'Can change utakmica',10,'change_utakmica'),(39,'Can delete utakmica',10,'delete_utakmica'),(40,'Can view utakmica',10,'view_utakmica');
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
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$150000$vjmyued4ZFfK$9LnshH7wHb6RlpxMM7ApQtQmenymaVdLlR3hO8ksTUU=','2019-10-06 19:54:45.513214',1,'bakir','','','',1,1,'2019-10-06 19:54:35.724568');
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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-10-06 20:01:45.841115','1','bakir curic',1,'[{\"added\": {}}]',7,1),(2,'2019-10-06 20:01:55.895376','2','nemanja mijailovic',1,'[{\"added\": {}}]',7,1),(3,'2019-10-06 20:02:05.063545','3','milica miljkov',1,'[{\"added\": {}}]',7,1),(4,'2019-10-06 20:02:12.006204','4','amra curic',1,'[{\"added\": {}}]',7,1),(5,'2019-10-06 20:02:22.653895','5','timur curic',1,'[{\"added\": {}}]',7,1),(6,'2019-10-06 20:02:43.742550','1','bakir mijailovic',1,'[{\"added\": {}}]',8,1),(7,'2019-10-06 20:02:48.269513','2','nemanja curic',1,'[{\"added\": {}}]',8,1),(8,'2019-10-06 20:02:54.476240','3','milica curic',1,'[{\"added\": {}}]',8,1),(9,'2019-10-06 20:03:05.215460','4','timur mijailovic',1,'[{\"added\": {}}]',8,1),(10,'2019-10-06 20:03:21.955116','5','amra mijailovic',1,'[{\"added\": {}}]',8,1),(11,'2019-10-06 20:03:38.788492','1','zvezda',1,'[{\"added\": {}}]',9,1),(12,'2019-10-06 20:03:41.841297','2','partizan',1,'[{\"added\": {}}]',9,1),(13,'2019-10-06 20:03:46.702833','3','hajduk',1,'[{\"added\": {}}]',9,1),(14,'2019-10-06 20:03:49.646609','4','real',1,'[{\"added\": {}}]',9,1),(15,'2019-10-06 20:03:52.367982','5','barselona',1,'[{\"added\": {}}]',9,1),(16,'2019-10-06 20:03:55.542739','6','bar',1,'[{\"added\": {}}]',9,1),(17,'2019-10-06 20:04:05.787551','7','rad',1,'[{\"added\": {}}]',9,1),(18,'2019-10-06 20:04:17.651255','8','milan',1,'[{\"added\": {}}]',9,1),(19,'2019-10-06 20:07:51.288371','1','1.kolo zvezda :1--2: partizan \"sezona 2019\"',1,'[{\"added\": {}}]',10,1),(20,'2019-10-06 20:08:38.102444','2','1.kolo hajduk :2--2: real \"sezona 2019\"',1,'[{\"added\": {}}]',10,1),(21,'2019-10-06 20:09:00.354181','6','bakir curic',1,'[{\"added\": {}}]',8,1),(22,'2019-10-06 20:09:06.496051','7','nemanja mijailovic',1,'[{\"added\": {}}]',8,1),(23,'2019-10-06 20:09:14.774133','8','amra curic',1,'[{\"added\": {}}]',8,1),(24,'2019-10-06 20:09:21.003788','9','milica miljkov',1,'[{\"added\": {}}]',8,1),(25,'2019-10-06 20:10:09.043839','3','1.kolo barselona :3--2: bar \"sezona 2019\"',1,'[{\"added\": {}}]',10,1),(26,'2019-10-06 20:10:51.626203','4','1.kolo rad :3--1: milan \"sezona 2019\"',1,'[{\"added\": {}}]',10,1),(27,'2019-10-06 20:11:22.780394','5','2.kolo zvezda :2--0: milan \"sezona 2019\"',1,'[{\"added\": {}}]',10,1),(28,'2019-10-06 20:11:57.417349','6','2.kolo rad :1--2: partizan \"sezona 2019\"',1,'[{\"added\": {}}]',10,1),(29,'2019-10-06 20:12:26.054962','7','2.kolo zvezda :1--1: real \"sezona 2019\"',1,'[{\"added\": {}}]',10,1),(30,'2019-10-06 20:13:00.309454','8','2.kolo barselona :0--4: real \"sezona 2019\"',1,'[{\"added\": {}}]',10,1),(31,'2019-10-06 20:13:22.737079','9','3.kolo hajduk :2--0: barselona \"sezona 2019\"',1,'[{\"added\": {}}]',10,1),(32,'2019-10-06 20:13:45.500736','10','3.kolo partizan :2--0: rad \"sezona 2019\"',1,'[{\"added\": {}}]',10,1),(33,'2019-10-06 20:14:10.785939','11','4.kolo partizan :2--0: zvezda \"sezona 2019\"',1,'[{\"added\": {}}]',10,1),(34,'2019-10-06 20:16:49.435857','12','3.kolo real :0--2: rad \"sezona 2019\"',1,'[{\"added\": {}}]',10,1),(35,'2019-10-06 20:17:25.508220','13','3.kolo milan :0--2: bar \"sezona 2019\"',1,'[{\"added\": {}}]',10,1),(36,'2019-10-06 20:17:51.825515','14','4.kolo zvezda :2--0: zvezda \"sezona 2019\"',1,'[{\"added\": {}}]',10,1),(37,'2019-10-06 20:18:21.803898','15','3.kolo bar :1--0: milan \"sezona 2019\"',1,'[{\"added\": {}}]',10,1),(38,'2019-10-06 20:18:57.440739','16','4.kolo milan :3--0: barselona \"sezona 2019\"',1,'[{\"added\": {}}]',10,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'fudbal','delegat'),(8,'fudbal','sudija'),(9,'fudbal','tim'),(10,'fudbal','utakmica'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-10-06 19:52:16.668806'),(2,'auth','0001_initial','2019-10-06 19:52:17.044333'),(3,'admin','0001_initial','2019-10-06 19:52:18.063123'),(4,'admin','0002_logentry_remove_auto_add','2019-10-06 19:52:18.299341'),(5,'admin','0003_logentry_add_action_flag_choices','2019-10-06 19:52:18.314928'),(6,'contenttypes','0002_remove_content_type_name','2019-10-06 19:52:18.622327'),(7,'auth','0002_alter_permission_name_max_length','2019-10-06 19:52:18.790809'),(8,'auth','0003_alter_user_email_max_length','2019-10-06 19:52:18.843493'),(9,'auth','0004_alter_user_username_opts','2019-10-06 19:52:18.863612'),(10,'auth','0005_alter_user_last_login_null','2019-10-06 19:52:19.013051'),(11,'auth','0006_require_contenttypes_0002','2019-10-06 19:52:19.013560'),(12,'auth','0007_alter_validators_add_error_messages','2019-10-06 19:52:19.033631'),(13,'auth','0008_alter_user_username_max_length','2019-10-06 19:52:19.168398'),(14,'auth','0009_alter_user_last_name_max_length','2019-10-06 19:52:19.303603'),(15,'auth','0010_alter_group_name_max_length','2019-10-06 19:52:19.354233'),(16,'auth','0011_update_proxy_permissions','2019-10-06 19:52:19.370235'),(17,'fudbal','0001_initial','2019-10-06 19:52:19.658801'),(18,'sessions','0001_initial','2019-10-06 19:52:20.576174'),(19,'fudbal','0002_auto_20191006_2207','2019-10-06 20:07:07.391591');
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
INSERT INTO `django_session` VALUES ('drua8mpa63t3na6abfv4u3voo0wwrubp','NTJhN2MzZGEwNTRjOWYwMzkyNmI0NzI0Yzc5NTEyZGI1NDdiZDRiYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1ZWViMmVjOTljNTJhN2QzNzYxOGFkOWVmNGQ1ZmRmNGEyNDBmYWUzIn0=','2019-10-20 19:54:45.526213');
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
  `ime_delegata` varchar(20) NOT NULL,
  `prezime_delegata` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fudbal_delegat`
--

LOCK TABLES `fudbal_delegat` WRITE;
/*!40000 ALTER TABLE `fudbal_delegat` DISABLE KEYS */;
INSERT INTO `fudbal_delegat` VALUES (1,'bakir','curic'),(2,'nemanja','mijailovic'),(3,'milica','miljkov'),(4,'amra','curic'),(5,'timur','curic');
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
  `ime_sudije` varchar(20) NOT NULL,
  `prezime_sudije` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fudbal_sudija`
--

LOCK TABLES `fudbal_sudija` WRITE;
/*!40000 ALTER TABLE `fudbal_sudija` DISABLE KEYS */;
INSERT INTO `fudbal_sudija` VALUES (1,'bakir','mijailovic'),(2,'nemanja','curic'),(3,'milica','curic'),(4,'timur','mijailovic'),(5,'amra','mijailovic'),(6,'bakir','curic'),(7,'nemanja','mijailovic'),(8,'amra','curic'),(9,'milica','miljkov');
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
  `ime_tima` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fudbal_tim`
--

LOCK TABLES `fudbal_tim` WRITE;
/*!40000 ALTER TABLE `fudbal_tim` DISABLE KEYS */;
INSERT INTO `fudbal_tim` VALUES (1,'zvezda'),(2,'partizan'),(3,'hajduk'),(4,'real'),(5,'barselona'),(6,'bar'),(7,'rad'),(8,'milan');
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fudbal_utakmica`
--

LOCK TABLES `fudbal_utakmica` WRITE;
/*!40000 ALTER TABLE `fudbal_utakmica` DISABLE KEYS */;
INSERT INTO `fudbal_utakmica` VALUES (1,2019,1,1,2,'pozega','2019-10-06 20:07:14.000000',1,1,1,1,2,2),(2,2019,1,2,2,'beogard','2019-10-06 20:07:51.000000',5,3,5,2,4,1),(3,2019,1,3,2,'prag','2019-10-06 20:09:30.000000',4,5,7,5,6,8),(4,2019,1,3,1,'bec','2019-10-06 20:10:09.000000',5,7,3,8,8,6),(5,2019,2,2,0,'beogard','2019-10-06 20:10:58.000000',4,1,4,1,8,2),(6,2019,2,1,2,'pozega','2019-10-06 20:11:22.000000',4,7,7,1,2,4),(7,2019,2,1,1,'pozega','2019-10-06 20:11:57.000000',5,1,8,7,4,4),(8,2019,2,0,4,'bec','2019-10-06 20:12:35.000000',5,5,1,2,4,2),(9,2019,3,2,0,'beogard','2019-10-06 20:13:00.000000',3,3,4,2,5,1),(10,2019,3,2,0,'beogard','2019-10-06 20:13:22.000000',2,2,7,4,7,7),(11,2019,4,2,0,'beogard','2019-10-06 20:13:45.000000',5,2,7,3,1,7),(12,2019,3,0,2,'pozega','2019-10-06 20:16:28.000000',4,4,1,2,7,1),(13,2019,3,0,2,'bec','2019-10-06 20:16:49.000000',5,8,8,2,6,6),(14,2019,4,2,0,'pozega','2019-10-06 20:17:30.000000',2,1,6,4,1,7),(15,2019,3,1,0,'beogard','2019-10-06 20:17:55.000000',3,6,8,2,8,3),(16,2019,4,3,0,'bec','2019-10-06 20:18:30.000000',4,8,8,2,5,1);
/*!40000 ALTER TABLE `fudbal_utakmica` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-06 22:24:12
