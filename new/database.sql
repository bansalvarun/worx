-- MySQL dump 10.14  Distrib 5.5.44-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: worx
-- ------------------------------------------------------
-- Server version	5.5.44-MariaDB-1ubuntu0.14.04.1

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
-- Table structure for table `account_emailaddress`
--

DROP TABLE IF EXISTS `account_emailaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_emailaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `account_emailaddress_user_id_5c85949e40d9a61d_fk_auth_user_id` (`user_id`),
  CONSTRAINT `account_emailaddress_user_id_5c85949e40d9a61d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailaddress`
--

LOCK TABLES `account_emailaddress` WRITE;
/*!40000 ALTER TABLE `account_emailaddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_emailconfirmation`
--

DROP TABLE IF EXISTS `account_emailconfirmation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_emailconfirmation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `sent` datetime DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `acc_email_address_id_5bcf9f503c32d4d8_fk_account_emailaddress_id` (`email_address_id`),
  CONSTRAINT `acc_email_address_id_5bcf9f503c32d4d8_fk_account_emailaddress_id` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailconfirmation`
--

LOCK TABLES `account_emailconfirmation` WRITE;
/*!40000 ALTER TABLE `account_emailconfirmation` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailconfirmation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'Manager');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permission_group_id_689710a9a73b7457_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,40),(2,1,41),(3,1,42),(4,1,43),(5,1,44),(6,1,45),(7,1,46),(8,1,47),(9,1,48),(10,1,49),(11,1,50),(12,1,51),(13,1,52),(14,1,53),(15,1,54),(16,1,55),(17,1,56),(18,1,57),(19,1,58),(20,1,59),(21,1,60),(22,1,61),(23,1,62),(24,1,63);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth__content_type_id_508cf46651277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add site',7,'add_site'),(20,'Can change site',7,'change_site'),(21,'Can delete site',7,'delete_site'),(22,'Can add email address',8,'add_emailaddress'),(23,'Can change email address',8,'change_emailaddress'),(24,'Can delete email address',8,'delete_emailaddress'),(25,'Can add email confirmation',9,'add_emailconfirmation'),(26,'Can change email confirmation',9,'change_emailconfirmation'),(27,'Can delete email confirmation',9,'delete_emailconfirmation'),(28,'Can add social application',10,'add_socialapp'),(29,'Can change social application',10,'change_socialapp'),(30,'Can delete social application',10,'delete_socialapp'),(31,'Can add social account',11,'add_socialaccount'),(32,'Can change social account',11,'change_socialaccount'),(33,'Can delete social account',11,'delete_socialaccount'),(34,'Can add social application token',12,'add_socialtoken'),(35,'Can change social application token',12,'change_socialtoken'),(36,'Can delete social application token',12,'delete_socialtoken'),(37,'Can add profile',13,'add_profile'),(38,'Can change profile',13,'change_profile'),(39,'Can delete profile',13,'delete_profile'),(40,'Can add cuisine',14,'add_cuisine'),(41,'Can change cuisine',14,'change_cuisine'),(42,'Can delete cuisine',14,'delete_cuisine'),(43,'Can add establishment',15,'add_establishment'),(44,'Can change establishment',15,'change_establishment'),(45,'Can delete establishment',15,'delete_establishment'),(46,'Can add city',16,'add_city'),(47,'Can change city',16,'change_city'),(48,'Can delete city',16,'delete_city'),(49,'Can add locality',17,'add_locality'),(50,'Can change locality',17,'change_locality'),(51,'Can delete locality',17,'delete_locality'),(52,'Can add restaurant',18,'add_restaurant'),(53,'Can change restaurant',18,'change_restaurant'),(54,'Can delete restaurant',18,'delete_restaurant'),(55,'Can add dish_type',19,'add_dish_type'),(56,'Can change dish_type',19,'change_dish_type'),(57,'Can delete dish_type',19,'delete_dish_type'),(58,'Can add dish',20,'add_dish'),(59,'Can change dish',20,'change_dish'),(60,'Can delete dish',20,'delete_dish'),(61,'Can add dish_price',21,'add_dish_price'),(62,'Can change dish_price',21,'change_dish_price'),(63,'Can delete dish_price',21,'delete_dish_price'),(64,'Can add notifications',22,'add_notifications'),(65,'Can change notifications',22,'change_notifications'),(66,'Can delete notifications',22,'delete_notifications');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$20000$XczDy7nsEJo1$jSk3QzTiNOUhJHGEFSUJeTbHnmPJHrFPOERctpf4PNw=','2015-10-13 16:56:06',1,'varun','Varun','Bansal','varun13168@iiitd.ac.in',1,1,'2015-08-25 19:35:08'),(2,'!ADn0wInzPYqGyBXfbnfanP1Z5NEZlkjZjeL9Ow4F','2015-10-12 17:53:56',0,'varun2','Varun','Bansal','',0,1,'2015-08-25 19:38:35'),(3,'!4kKIiORn7NLF8mXnMjAqT97btPdo4WNRFcHc9rZZ','2015-09-06 08:14:27',0,'varun3','Varun','Bansal','',0,1,'2015-08-25 19:38:52'),(4,'pbkdf2_sha256$20000$TXZN38MhkWXV$UC57kEfNfiJ3VxLQ1/itvmEYLFP85VslIGZBNCKEY2E=','2015-09-15 19:08:40',0,'anirudh','Anirudh','Goyal','',1,1,'2015-08-25 20:22:44'),(5,'!4W8h0JtPivaV9yebyfvkc9lVALVaDaiqrBzcOXGk','2015-08-29 09:17:48',0,'sk','sk','mathur','',0,1,'2015-08-29 09:17:48'),(6,'!UqmNYZq4UHtUmIrLbZEtCb1XMc0I7bjhEZswgV7j','2015-08-30 17:42:07',0,'ayush','Ayush','Agarwal','',0,1,'2015-08-30 17:42:07'),(7,'!D5IK8zMgjWSCAKwEdZ4QHyIIKBURx2QV7stx05lL','2015-09-02 15:18:24',0,'rajat','Rajat','Tulasyan','',0,1,'2015-09-02 15:18:24'),(9,'!OgpHY8bm901rh4h7icxur3jXvXhlez85KfqeWRAY','2015-09-02 16:51:31',0,'mayur','Mayur','Ramavat','',0,1,'2015-09-02 16:51:31'),(10,'!bEoekZed2Wsw9MAKahZWftZq9bSXP8OWvKLAbcWn','2015-09-02 16:54:10',0,'animesh','animesh','mishra','',0,1,'2015-09-02 16:54:10'),(11,'!zI2ReWwqCI2p0UIUZP3EnQhuYHoM3BnEfNganVjX','2015-09-02 17:01:54',0,'kanchan','kanchan','goel','',0,1,'2015-09-02 17:01:54'),(12,'!ERi3xAN7Xr1zdfzXH2SusQxexGpcbm3B4e4U9Jc2','2015-09-02 17:05:07',0,'anirudh2','Anirudh','Rustagi','',0,1,'2015-09-02 17:05:07'),(13,'!rmKEWTv9VXQLHgisJuWzrPa6gIfrZ5yNDQRATKXw','2015-09-02 17:44:15',0,'ayush2','Ayush','Bhatnagar','',0,1,'2015-09-02 17:44:15'),(14,'!Gci9sRkb5dnpO0WnSrlN4AYqO3XR9JaLxTXNOJUp','2015-09-05 18:51:35',0,'varun4','Varun','Sharma','',0,1,'2015-09-02 22:51:20'),(15,'!JZUXcYEXmgseAOFwlvpiEBU8WicTOPPvvoATV2Ba','2015-09-03 07:15:44',0,'akash','Akash','Tandon','',0,1,'2015-09-03 07:15:44'),(17,'pbkdf2_sha256$20000$XitpFd4Hlva0$iJOJhfjYgnONf7IgJxA8SAlWyI8B7NZbjOzLT2J9edk=','2015-09-30 18:59:57',0,'akshat','Akshat','Mathur','',1,1,'2015-09-06 06:30:26'),(19,'!9PJlaMbZpyEw2GCLJ73XqjA09SZgu37KdVOUUcKe','2015-09-29 09:08:35',0,'harnoor','Harnoor','Singh','',0,1,'2015-09-29 09:08:35'),(20,'!O26V5PyQdm115Nm2yvyRvQKn8P16KTG00MKHLUGA','2015-09-29 11:18:39',0,'shina','Shina','Puri','',0,1,'2015-09-29 11:18:39'),(21,'!F1m74XTPNXj8yhF9hIwfekWB07wHKDee0F7P0wWm','2015-10-01 17:28:40',0,'steven','Steven','Sidhu','',0,1,'2015-10-01 17:28:40'),(22,'!76OSwAvhcoCFlNc7B8palZZjkvnxF5ZFdEu86HME','2015-10-12 18:24:14',0,'anwesh','Anwesh','Sahoo','',0,1,'2015-10-12 18:24:14'),(23,'!kLmNmLxILNOFwIry3zpGF1ZPIlIA2V9U61cHMsQz','2015-10-12 22:00:47',0,'kartik','Kartik','Gupta','',0,1,'2015-10-12 22:00:47'),(24,'!8MmuZWVFYnJ2yTWY3Xsi0Icj2cuEZam4Xf92WG3I','2015-10-13 05:27:06',0,'varun5','Varun','Bansal','',0,1,'2015-10-13 05:27:06'),(25,'!iLi3YV5fnxLEUpIYe3IsB9HqqBCKzjyFVKycCj61','2015-10-13 09:42:31',0,'aman','Aman','Mathur','',0,1,'2015-10-13 09:42:31'),(26,'!P3mQN3J6CQUtEspxsVgJdS9dkBogHODYfSo3qGf9','2015-10-13 12:47:41',0,'taneea','Taneea','Agrawaal','',0,1,'2015-10-13 12:47:41');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (1,4,1),(4,17,1);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_permissi_user_id_7f0938558328534a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `djang_content_type_id_697914295151027a_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `djang_content_type_id_697914295151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2015-08-25 19:37:02','1','WORX',1,'',10,1),(2,'2015-08-25 19:38:24','2','worx',1,'',10,1),(3,'2015-08-25 19:39:39','1','Manager',1,'',3,1),(4,'2015-08-25 20:23:22','4','anirudh',2,'Changed password.',4,1),(5,'2015-08-25 20:23:26','4','anirudh',2,'No fields changed.',4,1),(6,'2015-08-25 20:23:34','4','anirudh',2,'Changed is_staff.',4,1),(7,'2015-08-25 20:26:22','4','anirudh',2,'Changed groups.',4,1),(8,'2015-08-25 20:29:33','1','varun',2,'Changed first_name and last_name.',4,1),(9,'2015-08-27 05:07:34','1','New Delhi',1,'',16,4),(10,'2015-08-27 05:07:46','1','Anand Vihar',1,'',17,4),(11,'2015-08-27 05:16:40','1','ITALIAN',1,'',14,4),(12,'2015-08-27 05:18:50','1','CAFE',1,'',15,4),(13,'2015-08-27 05:47:31','1','Cafe Wink',1,'',18,4),(14,'2015-08-27 05:58:15','1','Cafe Wink',2,'Changed enable.',18,1),(15,'2015-08-27 05:58:15','1','Italian',2,'Changed name.',14,4),(16,'2015-08-27 05:58:31','1','Cafe Wink',2,'Changed enable.',18,1),(17,'2015-08-27 06:00:06','1','Cafe Wink',2,'Changed enable.',18,4),(18,'2015-08-27 06:14:23','1','Cafe Wink',2,'No fields changed.',18,4),(19,'2015-08-28 05:23:11','1','Cafe Wink',2,'Changed enable.',18,1),(20,'2015-08-28 13:09:33','1','Cafe Wink',2,'Changed enable.',18,4),(21,'2015-08-28 13:52:53','1','Cafe Wink',2,'Changed enable.',18,1),(22,'2015-08-28 14:38:28','1','Cafe Wink',2,'Changed service_charge, service_tax_food, service_tax_drinks, any_other_tax and discount.',18,1),(23,'2015-08-28 14:45:08','1','Cafe Wink',2,'Changed name and about for dish_type \"Signature Pastas\".',18,1),(24,'2015-08-28 14:45:49','1','Cafe Wink',2,'Changed enable.',18,1),(25,'2015-08-28 14:48:34','1','Cafe Wink',2,'Added dish_type \"Signature Pasta\". Changed about for dish_type \"Signature Pastas\".',18,1),(26,'2015-08-28 14:50:26','1','CAFE WINK',2,'Changed name.',18,1),(27,'2015-08-28 14:55:08','1','CAFE WINK',2,'Changed name for dish_type \"Signature Pastas\".',18,1),(28,'2015-08-28 14:57:06','1','CAFE WINK',2,'No fields changed.',18,1),(29,'2015-08-28 14:57:52','1','CAFE WINK',2,'Changed name for dish_type \"Signature Pastas - T\". Changed name for dish_type \"Signature Pastas - C\".',18,1),(30,'2015-08-28 16:06:33','1','CAFE WINK',2,'No fields changed.',18,1),(31,'2015-08-28 16:07:17','1','CAFE WINK',2,'No fields changed.',18,1),(32,'2015-08-28 16:08:05','1','CAFE WINK',2,'No fields changed.',18,1),(33,'2015-08-28 16:08:46','1','CAFE WINK',2,'No fields changed.',18,1),(34,'2015-08-28 16:09:32','1','CAFE WINK',2,'No fields changed.',18,1),(35,'2015-08-28 16:11:36','1','CAFE WINK',2,'Added dish_type \"Signature Pastas - B\".',18,1),(36,'2015-08-28 16:12:19','1','CAFE WINK',2,'No fields changed.',18,1),(37,'2015-08-28 16:13:31','1','CAFE WINK',2,'No fields changed.',18,1),(38,'2015-08-28 16:14:09','1','CAFE WINK',2,'No fields changed.',18,1),(39,'2015-08-28 16:20:30','1','CAFE WINK',2,'Added dish_type \"Pasta Add-On\".',18,1),(40,'2015-08-28 16:21:05','1','CAFE WINK',2,'No fields changed.',18,1),(41,'2015-08-28 16:23:18','1','CAFE WINK',2,'Added dish_type \"Lasagna\".',18,1),(42,'2015-08-28 16:24:06','1','CAFE WINK',2,'No fields changed.',18,1),(43,'2015-08-28 16:25:07','1','CAFE WINK',2,'No fields changed.',18,1),(44,'2015-08-28 16:25:49','1','CAFE WINK',2,'No fields changed.',18,1),(45,'2015-08-28 16:27:48','1','CAFE WINK',2,'Added dish_type \"Garlic Breads\".',18,1),(46,'2015-08-28 16:28:26','1','CAFE WINK',2,'No fields changed.',18,1),(47,'2015-08-28 16:29:10','1','CAFE WINK',2,'No fields changed.',18,1),(48,'2015-08-28 16:29:57','1','CAFE WINK',2,'No fields changed.',18,1),(49,'2015-08-28 16:30:37','1','CAFE WINK',2,'No fields changed.',18,1),(50,'2015-08-28 16:32:18','1','CAFE WINK',2,'Added dish_type \"Bruschetta\".',18,1),(51,'2015-08-28 16:33:08','1','CAFE WINK',2,'No fields changed.',18,1),(52,'2015-08-28 16:33:47','1','CAFE WINK',2,'No fields changed.',18,1),(53,'2015-08-28 16:34:25','1','CAFE WINK',2,'No fields changed.',18,1),(54,'2015-09-01 15:35:03','1','CAFE WINK',2,'No fields changed.',18,4),(55,'2015-09-01 15:35:22','1','CAFE WINK',2,'No fields changed.',18,4),(56,'2015-09-01 15:37:43','1','CAFE WINK',2,'Changed name for dish_type \"Signature Pastas \". Changed name for dish_type \"Signature Pastas \". Changed name for dish_type \"Signature Pastas \".',18,4),(57,'2015-09-01 15:39:45','1','CAFE WINK',2,'Changed name for dish_type \"Signature Pastas (Tomatoey)\". Changed name for dish_type \"Signature Pastas (Creamy)\". Changed name for dish_type \"Signature Pastas-a bit of both\".',18,4),(58,'2015-09-01 15:40:35','1','CAFE WINK',2,'No fields changed.',18,4),(59,'2015-09-01 15:41:34','1','CAFE WINK',2,'No fields changed.',18,4),(60,'2015-09-01 15:42:57','1','CAFE WINK',2,'No fields changed.',18,4),(61,'2015-09-01 15:44:33','1','CAFE WINK',2,'No fields changed.',18,4),(62,'2015-09-01 15:45:46','1','CAFE WINK',2,'No fields changed.',18,4),(63,'2015-09-01 15:46:25','1','CAFE WINK',2,'No fields changed.',18,4),(64,'2015-09-01 16:07:28','1','CAFE WINK',2,'Added dish_type \"Salad\".',18,4),(65,'2015-09-01 16:08:23','1','CAFE WINK',2,'No fields changed.',18,4),(66,'2015-09-01 16:11:44','1','CAFE WINK',2,'No fields changed.',18,4),(67,'2015-09-01 16:13:35','1','CAFE WINK',2,'No fields changed.',18,4),(68,'2015-09-01 16:28:56','1','CAFE WINK',2,'Added dish_type \"Nachos\".',18,4),(69,'2015-09-01 16:30:57','1','CAFE WINK',2,'No fields changed.',18,4),(70,'2015-09-01 16:33:31','1','CAFE WINK',2,'No fields changed.',18,4),(71,'2015-09-01 16:35:19','1','CAFE WINK',2,'Added dish_type \"Sandwiches\".',18,4),(72,'2015-09-01 16:36:34','1','CAFE WINK',2,'No fields changed.',18,4),(73,'2015-09-01 16:37:11','1','CAFE WINK',2,'No fields changed.',18,4),(74,'2015-09-01 16:38:10','1','CAFE WINK',2,'No fields changed.',18,4),(75,'2015-09-01 16:39:26','1','CAFE WINK',2,'Added dish_type \"Dips\".',18,4),(76,'2015-09-01 16:40:33','1','CAFE WINK',2,'No fields changed.',18,4),(77,'2015-09-01 16:42:28','1','CAFE WINK',2,'Added dish_type \"Shakes & Beverages\".',18,4),(78,'2015-09-01 16:45:14','1','CAFE WINK',2,'No fields changed.',18,4),(79,'2015-09-01 16:47:25','1','CAFE WINK',2,'No fields changed.',18,4),(80,'2015-09-02 13:22:31','1','CAFE WINK',2,'No fields changed.',18,4),(81,'2015-09-02 13:31:16','1','CAFE WINK',2,'Changed cuisines and establishment.',18,4),(82,'2015-09-02 13:37:16','2','Patiala',1,'',16,4),(83,'2015-09-02 13:37:35','2','Patiala',1,'',17,4),(84,'2015-09-02 13:39:02','2','Restaurant',1,'',15,4),(85,'2015-09-02 13:39:12','3','Bar',1,'',15,4),(86,'2015-09-02 13:40:01','2','Recharge',1,'',18,4),(87,'2015-09-02 13:40:14','2','Recharge',2,'Changed enable.',18,4),(88,'2015-09-02 13:40:38','2','RECHARGE',2,'Changed name.',18,4),(89,'2015-09-02 13:50:28','2','RECHARGE',2,'Changed enable.',18,4),(90,'2015-09-02 14:11:31','1','CAFE WINK',2,'Changed vegOrNot for dish_type \"Dips\".',18,1),(91,'2015-09-02 14:11:56','1','CAFE WINK',2,'No fields changed.',18,1),(92,'2015-09-02 14:11:58','1','CAFE WINK',2,'No fields changed.',18,1),(93,'2015-09-02 14:13:03','1','CAFE WINK',2,'No fields changed.',18,1),(94,'2015-09-02 15:19:59','1','CAFE WINK',2,'Changed cuisines and establishment.',18,4),(95,'2015-09-02 15:20:05','1','CAFE WINK',2,'No fields changed.',18,4),(96,'2015-09-02 17:31:32','1','CAFE WINK',2,'Changed name for dish_type \"Signature Pastas\".',18,1),(97,'2015-09-06 06:34:10','17','akshat',2,'Changed is_staff, is_superuser and groups.',4,1),(98,'2015-09-06 06:34:16','17','akshat',2,'Changed is_superuser.',4,1),(99,'2015-09-06 06:35:09','17','akshat',2,'No fields changed.',4,1),(100,'2015-09-06 06:37:10','17','akshat',2,'Changed password.',4,1),(101,'2015-09-06 06:41:35','17','akshat',2,'Changed password.',4,1),(102,'2015-09-06 07:12:35','1','CAFE WINK',2,'Changed facebook.',18,1),(103,'2015-09-06 07:12:51','1','CAFE WINK',2,'No fields changed.',18,1),(104,'2015-09-06 08:33:55','1','CAFE WINK',2,'No fields changed.',18,1),(105,'2015-09-06 10:52:25','18','blah',3,'',4,1),(106,'2015-09-29 07:52:39','2','Patiala',2,'No fields changed.',16,17),(107,'2015-09-29 08:45:29','2','Continental',1,'',14,17),(108,'2015-09-29 08:45:46','4','Salad Bar',1,'',15,17),(109,'2015-09-29 08:57:19','3','Wrapchik',1,'',18,17),(110,'2015-09-29 08:57:37','3','Wrapchik',2,'No fields changed.',18,17),(111,'2015-09-29 09:00:12','3','Wrapchik',2,'Deleted dish_type \"Hugh\".',18,17),(112,'2015-10-12 06:13:17','2','RECHARGE',2,'Added dish_type \"blah\".',18,1),(113,'2015-10-12 06:21:07','3','Wrapchik',2,'Changed url.',18,1),(114,'2015-10-12 06:21:44','3','Wrapchik',2,'Changed url.',18,1),(115,'2015-10-12 06:25:55','3','Wrapchik',2,'Changed url.',18,1),(116,'2015-10-12 06:26:32','1','CAFE WINK',2,'Changed url.',18,1),(117,'2015-10-12 06:26:53','2','RECHARGE',2,'Changed url.',18,1),(118,'2015-10-12 09:16:17','3','Wrapchik',2,'Changed url.',18,1),(119,'2015-10-12 12:46:51','3','Wrapchik',2,'Changed facebook and phone.',18,17),(120,'2015-10-12 12:57:17','3','Wrapchik',2,'Changed coverpic.',18,17),(121,'2015-10-12 16:29:01','3','Wrapchik',2,'Changed phone.',18,17),(122,'2015-10-12 16:38:24','16','shreyagarg',3,'',4,1),(123,'2015-10-12 16:38:24','8','SimranBindra',3,'',4,1),(124,'2015-10-14 06:22:40','2','Recharge',2,'Changed name.',18,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_45f3b1d93ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (8,'account','emailaddress'),(9,'account','emailconfirmation'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(16,'restaurants','city'),(14,'restaurants','cuisine'),(20,'restaurants','dish'),(21,'restaurants','dish_price'),(19,'restaurants','dish_type'),(15,'restaurants','establishment'),(17,'restaurants','locality'),(22,'restaurants','notifications'),(13,'restaurants','profile'),(18,'restaurants','restaurant'),(6,'sessions','session'),(7,'sites','site'),(11,'socialaccount','socialaccount'),(10,'socialaccount','socialapp'),(12,'socialaccount','socialtoken');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2015-08-25 19:34:40'),(2,'auth','0001_initial','2015-08-25 19:34:40'),(3,'account','0001_initial','2015-08-25 19:34:40'),(4,'account','0002_email_max_length','2015-08-25 19:34:40'),(5,'admin','0001_initial','2015-08-25 19:34:40'),(6,'contenttypes','0002_remove_content_type_name','2015-08-25 19:34:40'),(7,'auth','0002_alter_permission_name_max_length','2015-08-25 19:34:40'),(8,'auth','0003_alter_user_email_max_length','2015-08-25 19:34:40'),(9,'auth','0004_alter_user_username_opts','2015-08-25 19:34:40'),(10,'auth','0005_alter_user_last_login_null','2015-08-25 19:34:40'),(11,'auth','0006_require_contenttypes_0002','2015-08-25 19:34:40'),(12,'restaurants','0001_initial','2015-08-25 19:34:41'),(13,'sessions','0001_initial','2015-08-25 19:34:41'),(14,'sites','0001_initial','2015-08-25 19:34:41'),(15,'socialaccount','0001_initial','2015-08-25 19:34:41'),(16,'socialaccount','0002_auto_20150815_1322','2015-08-25 19:34:41'),(17,'socialaccount','0003_auto_20150817_0127','2015-08-25 19:34:41'),(18,'restaurants','0002_dish_type_about','2015-08-28 14:38:23'),(19,'restaurants','0003_auto_20150906_1043','2015-09-06 06:17:04'),(20,'restaurants','0004_auto_20150906_1046','2015-09-06 06:17:04'),(21,'restaurants','0005_auto_20150906_1047','2015-09-06 06:17:04'),(22,'restaurants','0006_auto_20150906_1116','2015-09-06 06:17:04'),(23,'restaurants','0007_auto_20150906_1125','2015-09-06 06:17:04'),(24,'restaurants','0008_auto_20150906_1125','2015-09-06 06:17:04'),(25,'restaurants','0009_auto_20150906_1128','2015-09-06 06:17:04'),(26,'restaurants','0010_restaurant_facebook','2015-09-06 07:10:47'),(27,'restaurants','0011_notifications','2015-09-06 09:16:20'),(28,'restaurants','0002_restaurant_url','2015-10-12 06:20:26'),(29,'restaurants','0003_auto_20151012_1157','2015-10-12 06:27:43');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('03zun0qtf4uuyu356f18v5s00i64bswr','YTkwMGU2MTIxZGZjMGU0ODcyNTkyMDBhMmNkOWUxOGIwMjdiZTM4Yzp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzL2N1aXNpbmVzLyJ9LCJvZVhuODZuRHk4N1YiXX0=','2015-09-20 04:16:15'),('0jgt3gzf413dgk79j6oncxpgljfllhws','OGFhY2E1MWQ1ZDNlNmUyOGMwNWZlNDQ2NDg0ODQyNzFkZWRhNTY5Zjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImMxNmQwZjZmNTkwYWE1ZjMyY2U1MWJmNzI1YmE0ZmRmY2MwYjA3NGYiLCJhY2NvdW50X3VzZXIiOiI1IiwiX2F1dGhfdXNlcl9pZCI6IjUiLCJhY2NvdW50X3ZlcmlmaWVkX2VtYWlsIjpudWxsfQ==','2015-09-12 09:17:48'),('0uuw6z7rin7lxkw38rof0rusdziherow','NGUwNjNhYzU3MDdmMDU4NGNlZjU5ZmMwYzc3ZjY2Y2JkMjYzN2ZiZjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL2FjY291bnRzL3Bhc3N3b3JkL3Jlc2V0LyJ9LCJhbW84VFhXWVdHdE4iXX0=','2015-09-21 10:19:00'),('117ix4lnd9tpti4toojgb7i841vh226f','ODc4MGVlNGQ0MGMwODNkOGIxMWMxZDc1ZTI5NWJhNTc0ZThjY2ViNjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzLzEvbWVudS8ifSwiR0g5ckgwaDdraWFkIl19','2015-10-19 18:56:16'),('136nemsjke1kxvhq2n40t3azoayuehyp','YTBkZTlhNTc5ZjVlMTFmZGFmMzIwYWNmYjM1YjViYmI1YTc4ZjkzYjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzL2N1aXNpbmVzLyJ9LCIxdXY5RzRkd1UydnIiXX0=','2015-10-05 08:59:23'),('1g1jen32rlj0b9r1v3cj9o803ik8qnrh','N2QyMjQxY2ZjY2UwMzM0NDVjOGQwZTU3MjBlOTcyYTgxZWU0MDgxYjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzLzEvbWVudS8ifSwic0N6YXFqaHRtZDBDIl19','2015-10-05 09:03:43'),('1ir94jd8u7kt8bixanxmogas3d8ak8ye','YTc3MThjOTMwZjQ2MDZhYjc1YTI1MWYxYWI1ZDY3NzlmODZmMzdjYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImRmYzAxZTI0ZjdmYjBjY2UxYWEwY2UwOGQyNmFjNmE2MGEzMjAxZDUiLCJhY2NvdW50X3VzZXIiOiJmIiwiX2F1dGhfdXNlcl9pZCI6IjE1IiwiYWNjb3VudF92ZXJpZmllZF9lbWFpbCI6bnVsbH0=','2015-09-17 07:15:44'),('1znl7z3bvmyut8d18rfjwc2thvtfoutz','M2ZhNjI5ZTU3MjFjNDc5NTVjZDliNmE1YTk0M2NmOWMyZjM2MTBkZjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzL2VzdGFibGlzaG1lbnRzLyJ9LCJ2eWpZRFBFeHVWTjciXX0=','2015-10-02 23:59:39'),('29b8ol3enh99xvym4kh5rv2u89zgbrtn','ZTI3ZjlkZTUzNGRlM2RlMTdmY2FkN2EyNGZmMmY5NDI3Y2U0NGRhNjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzLzIvbWVudS8ifSwiT1QyQ0s2QWUwa2xyIl19','2015-09-20 04:21:23'),('2cmtttnx2fom9d4oy1oydb4iq0pwkllc','NDMwYjMyZTM5MWZmODU1NmU1MjkwZmY0ZTQ5Nzk4ZTRjNWRhMjA3MDp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiLyJ9LCJTSHViU2RMTnpMaDQiXX0=','2015-10-09 08:17:24'),('2ox1vkz72dnvd7fj3fmgal7rgq337kmm','ZjYxNTRlMjc3OTlmMGFiYTNjODI3ZGYwYjY1MTA3ODMyOTMzYmU5YTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzL2VzdGFibGlzaG1lbnRzLyJ9LCJrcGFxSUNib2QyY3oiXX0=','2015-10-05 09:01:11'),('2u6d0e2ccnz8ye61m16u2f6jqnrip7tq','ZjgwZGU0YjAzYWQyNDJjZmM1N2Y4NTNiOTczZTQ3NDk3OGIyZWZmYzp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiLyJ9LCJGdjA2Rm95WG02VEciXX0=','2015-10-18 19:13:05'),('3519okly30d8gp1ry0j5dqtycuvyewx9','Y2U3N2MxMjJiOWIwZTMxN2U3YzBhZTc5NTM1MWEzNTdkNmI5MzM1Zjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjcxNDY4NWNjMDNiMjg0ODhmNzFkYTQ4NDRhOGY0ZDc1OTYwZDhhOGQiLCJhY2NvdW50X3VzZXIiOiJlIiwiX2F1dGhfdXNlcl9pZCI6IjE0IiwiYWNjb3VudF92ZXJpZmllZF9lbWFpbCI6bnVsbH0=','2015-09-16 22:51:20'),('3eb028wbodw9ynuzf2lz7ay7hn13dvtk','M2U1YWRmN2YyZmJkMjUxNGFmNDA0ZjVjNDdmZDdjZWIzNGZkZGU2Mjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjMwMjNkM2Y1NmY2MmQ5N2FkN2QwZDY0ZmQ2MjZkMWJlNjA3ODQyMmEiLCJhY2NvdW50X3VzZXIiOiI4IiwiX2F1dGhfdXNlcl9pZCI6IjgiLCJhY2NvdW50X3ZlcmlmaWVkX2VtYWlsIjpudWxsfQ==','2015-09-16 16:22:04'),('3farupuuje37ekwoleajrocemsn85bkh','MmY2YjY4YmZkOGRlNWEwY2RlMWRjODc4NTc4ZGYxOTg0ZTIzMzM2NTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzLyJ9LCJ4UUlMblluOVdoSlMiXX0=','2015-10-11 09:43:29'),('3orkuadqa4gdfcgydwu3uhs3hqenpijv','NjQ5MjYwMmEyZjVlM2E1NWY5ODM0MDkxMDhjODY2NWEyYWEwOWE0MDp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzL2VzdGFibGlzaG1lbnRzLyJ9LCJTR2JNZTF6V1cxUWYiXX0=','2015-09-22 09:30:30'),('3ychrztfi39ewbojoucwcx6qz3xb5xg6','MjU1MDkyOTcxYTljMTY3ZDgyZWE1ODlhMDNjOWYyMTU5NmNjMmFlNzp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzL2xvY2FsaXRpZXMvIn0sImF6TmljU0xoTDAxSyJdfQ==','2015-10-05 09:00:18'),('43ke5tkw3r60jena8nelscpm08ga4cv6','ZDM2Mzc1ZGQxOWYwOWIxYjA0YmQ0N2FhMzgyYzY5NTBjNDg5NzVkMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImJlNjMyODQ2YjBlYjM0ZGFhZDZkMjBiZjViZWViNzEzMDRlYTE0ZmYiLCJhY2NvdW50X3VzZXIiOiJwIiwiX2F1dGhfdXNlcl9pZCI6IjI1IiwiYWNjb3VudF92ZXJpZmllZF9lbWFpbCI6bnVsbH0=','2015-10-27 09:42:31'),('477i7ochdr3uzvnbun9lzrosoeg3cr39','MmFiNjI1NGI0NzMxM2VjNzhmM2YyNThhZTRkZmM3ZDNmMmVjMWQzZTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzLyJ9LCJUc0EzbXlvclVHb1oiXX0=','2015-09-20 04:14:14'),('4gjkojuq6ui3ttuvs5nvanyeof78q2g4','MTFlN2MxOWEwYzYwZDE5ZjU1NjExN2MzNmU1ZThlYzk2N2E2ZDkyMjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3dyYXBjaGlrLyJ9LCI3MmhYaWdyaENVNkUiXX0=','2015-10-27 20:07:29'),('4jcrg9csn57nodmhme52uhb0bcxh751h','MmIyNTA3ODYwZDk4NmIxN2RkMDQ0MTEzODRkZjg0MmY3NGZlNzI4ZDp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk2ZTYxYzVjZDQxNDFjNTQ2NDk1ZWNhZTFiYzJmNTE3NWE1Y2QzNjQiLCJfYXV0aF91c2VyX2lkIjoiNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2015-09-20 09:04:13'),('4jr4uidbuusydkyxi8i6fvyem9y9j9ac','ZjkxZmU1NjNlZmY5ZTBmMDc2OTVkYThjMGQ3OGNlM2FjMWI3MDhiMTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiLyJ9LCJBQTlaeEZWRldDQVUiXX0=','2015-09-20 04:09:01'),('4m4l9gx315i3uhc5ae62hcgswxbphiua','YjcwYzBmMjIwMTY0MDNkMWQ3ZThiOTBkY2RiZGJiNjNiYzFhM2MzYzp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzLzIvbWVudS8ifSwiSzdVaklzRlluMnROIl19','2015-09-23 16:30:21'),('51n3dcuig0yb6zcd7fz65g8dut61mm86','YzZlNTUzZTQ0ZDViMTQ0MzY5YTZlNGUwYjFhNWFjNmNiNWIxZWVhNzp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzL2N1aXNpbmVzLyJ9LCJPSlllejZiSkRkZHkiXX0=','2015-09-09 11:34:39'),('5c18vrdud7lsqtk2kqeagksc7lfuwizq','ZGQzN2YzYThiMDQyYmUxNDgwODVhYmJhMjZhOGI3ZDM5YmNmMzA2MTp7Il9hdXRoX3VzZXJfaGFzaCI6IjZiZjhlN2E3ZjY0MTZjNDVjYzNkOWVmY2QzNTQzNjUyOTBlODIyYjIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMiJ9','2015-09-13 16:35:38'),('6lw8g199hkvxys76c0ovanwgtekyf9k4','ZTE4ZDA2ODk5ZDhlYTMxZjA0MWVlYzc0NTc0ZGJkZmQyMzI5MDIyMjp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk2ZTYxYzVjZDQxNDFjNTQ2NDk1ZWNhZTFiYzJmNTE3NWE1Y2QzNjQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiNCJ9','2015-09-29 19:08:40'),('6py8qjuoolqav2bzz39w5mfitypv428g','OGJkYTU2YjE5ZjU2NjNkMWQ1M2ViNzMxMjAyODFhNjA4YTI1NjY0YTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzL2xvY2FsaXRpZXMvIn0sImJpS0ZwMGNuTTN0biJdfQ==','2015-09-23 22:13:07'),('6sv8uozod4lw6ni62waknt2vnqda5kj8','OGU3ZGY5NjRkYTAzMDJjOGEyNzY0MGVjMmZhOGY2NGVjMDQzYjMyMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjZiOGQ0YWVjOWM2MzMxZWRhNGE5MjgxNTcxMzRlMzAxNTUwNmQzZDQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2015-10-27 16:56:07'),('71dirfjua0c80wiyzn0w9ea95o2fp6mp','NGQ5MTRkNDkwOWMyZGI5YTc1YjVlN2MwM2NjZGJjMzllYjI3YTE0OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjcxNDY4NWNjMDNiMjg0ODhmNzFkYTQ4NDRhOGY0ZDc1OTYwZDhhOGQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMTQifQ==','2015-09-19 18:51:35'),('75twykzhp4on58fyq2ph07jrcer06rn3','MDYwZjZlMzJlOGI1ZjgwODgyMGU4MDBhNmQ1Y2MxZmE1ZTk2Zjg1ODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImU5NzAwMjdlZmFkMTkxYWMwNWUwNjFkZDJkOWI2MzZhYjAxNDgzYTUiLCJhY2NvdW50X3VzZXIiOiI2IiwiX2F1dGhfdXNlcl9pZCI6IjYiLCJhY2NvdW50X3ZlcmlmaWVkX2VtYWlsIjpudWxsfQ==','2015-09-13 17:42:07'),('7owm86b3rh30rkalzi6gh9nmiyr5v9x8','ZDc3MjljYmNiYTkyOGUwYzMyODI0ZGU3ZjI4ZmRjNmUyNGI1MGVmMDp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzL2N1aXNpbmVzLyJ9LCJoT1F1TXBqSG1KUVkiXX0=','2015-10-05 16:03:25'),('85bdn9ngk6x1go6n7p506q1kkwwj96wt','MjcyYzVkYTNmNmI0YjIxYWRlYTc4OGExYzZjZjIzMTE4Y2QwMWY0ZTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiLyJ9LCJJTjUzbHhuNG8wNkQiXX0=','2015-09-21 10:59:12'),('8e2kn12x4ihcma5indu8v2e76kot7ya2','YjEzMWFhOTI2ZTFhMzk0M2MwMzcwMzE1YWFiYjBhYmFjZDE1NTk2NTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzL2xvY2FsaXRpZXMvIn0sIjZER2l0M2diWmRVOSJdfQ==','2015-09-21 11:17:10'),('8o1dn0h7fg3mz10qyvetq9pyk9ynaobs','MTM2MzZiZjFjZGI2ZTVjY2Q1OGMxNGFmY2I4MzQ3YTRhMjZhZTA0ZDp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzLzIvbWVudS8ifSwiaDAzdFVhUFBmbmlCIl19','2015-09-20 04:53:18'),('94lvuoo76ozn7b9jrsoe0hjbzchvffrd','MDZjMDM1YTJiMzg0NmJlYjlmZGM0YTc3M2E2OWYwZGVmY2RkN2U2Njp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImY5OWRlYjNjNjI5NzJiYjBiNTJiNGU4Y2IxMmRjMjlmMmVmNzA1Y2IiLCJhY2NvdW50X3VzZXIiOiI3IiwiX2F1dGhfdXNlcl9pZCI6IjciLCJhY2NvdW50X3ZlcmlmaWVkX2VtYWlsIjpudWxsfQ==','2015-09-16 15:18:24'),('9gjqqyobduqyj8kwqo4ubxyzl6xoofnb','MWI0ZWFlNWFhODJkM2Q2MmYxNjExNjU4NzM0ZmE2NzUxOTI3NjY1OTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzL2VzdGFibGlzaG1lbnRzLyJ9LCIwZmtmQ0J6WFd1SXAiXX0=','2015-09-20 04:16:49'),('9un1z6qf2h1bnbe6ho29eeqkh75tons4','NjdmNjkzYmI4YTQyMzhlOWY2MzZmY2Q2MmI4ODI4NmQwYjRjZGRjNjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzLzIvbWVudS8ifSwiVGU4U3dkcHJIYU1ZIl19','2015-09-17 17:17:23'),('9wrm8z49k19hhabhicmwv1drqoi7pifd','YzBjNTRhMTJjZDVjNDhlNDMzNzA3NWE5Y2RmZDZhZjM0YjQ2YTU4ZDp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzL2xvY2FsaXRpZXMvIn0sInNXbXNjTUJTR0R0diJdfQ==','2015-10-19 07:04:19'),('b170eu5z469k2favb4ahbvkm9q2tmjtv','OTBiOTljNWI4MTI5OGNhMDE1NzQ2YzU3NTM5MWYwOGRjMmVhZTNlNTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzL2VzdGFibGlzaG1lbnRzLyJ9LCJQWGJXTUZ6UUtDQmUiXX0=','2015-10-09 21:55:36'),('b2f53lh7rdm1m52j61urrztmpleb8vhu','NTA3OTEyY2JlMDAwYjMyZTA5MzJjZTBlODczNzQzNmVlMWI5NzBiMzp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzL2xvY2FsaXRpZXMvIn0sIk1vQnY3VmpUSVMxZSJdfQ==','2015-09-09 11:31:37'),('b9d03vwe2pkb9vld4gt9gg7n4jvkj7tw','NTg5ZWJiNDQzZjgwNTgwNGRiMWY3NzE1YTNmMGU1NmU4ZTA1NGRjMTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjBhZWQxNDNiYjI5ZDk0NTBmODBhMjMzMjVjMDE1NjUyYjAyMjQ5OTUiLCJhY2NvdW50X3VzZXIiOiJxIiwiX2F1dGhfdXNlcl9pZCI6IjI2IiwiYWNjb3VudF92ZXJpZmllZF9lbWFpbCI6bnVsbH0=','2015-10-27 12:47:41'),('bc4eiaswwvph0h4dbcf62c5jb57e1m4h','ZWI5MGIzZTlmMmJlZjRlMjkzYzA4MGRjYjdmMzczODE5Y2Y3OWU0NTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiLyJ9LCJRWmIxRW9JenZNNXQiXX0=','2015-09-23 22:28:32'),('bgth3vbnspmjc5jl1pacw1nk23ji5wav','YTM1ZDc1MzBkZGJhYWUzNmNkMGMwZjQ2YmM2YjQ5ZjEzMjE0NDUwYTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzL2VzdGFibGlzaG1lbnRzLyJ9LCJpelRKVGlBSzlLMDAiXX0=','2015-10-06 10:19:31'),('bh35cychj2c57i7axbny6xrvpjfk3j2t','ODg1OGM2MmY4YmIzY2NlN2ZiMGJlYzcwZjhhOTA2OThjYjI1ZDdmOTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzLyJ9LCJlR09QN1FNeVdtU2EiXX0=','2015-09-20 20:04:56'),('bou0nonof46rmcqwznqqg5952yih3e04','M2NlMGY2YjM0MGIzYjE3ZjNkNTExNDdjYzA1ZTBmZWExYjIxNTQ2MTp7Il9hdXRoX3VzZXJfaGFzaCI6ImNkMjE4MGQ4ZGU3ODEzODBiYTc4YmI1ZjY1NTA5ZTI5MmVkZTg0MWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMTcifQ==','2015-09-20 07:44:05'),('cc6urvnxyx3m9hfzxhe8anx4i0d7v6f4','OTdkZjllOGFkOWM0Y2MxNDUwMjEwNDkwZGJhZGY0ZjdmMGZhY2U5Mjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL2FjY291bnRzL3Bhc3N3b3JkL3Jlc2V0LyJ9LCJTVEF3Q21YbmZWNlEiXX0=','2015-09-18 13:52:10'),('ci35ra2tglevs8kptnbvmk8gzkizmsy1','MWQ4MjQ1ODViOGVjODljZTI2MWRhOTIyZDRlNDZkMzM2MGFkZDFjZTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiLyJ9LCJTczZoR016VGdWemsiXX0=','2015-10-05 08:50:48'),('d6wzoty3tdya1nk42iyg7pj6fwb1vcma','MTNkNDE5MWUwZjdmMGI1ZTU4OTFkMGI1YzZjM2EyZTA0NjgyOTAwMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImEwMDI5NGZmOGQzYTZhNjIwYWM0ZjA5NmJhZmQwNmNkN2JhNTU2YTEiLCJhY2NvdW50X3VzZXIiOiJtIiwiX2F1dGhfdXNlcl9pZCI6IjIyIiwiYWNjb3VudF92ZXJpZmllZF9lbWFpbCI6bnVsbH0=','2015-10-26 18:24:14'),('dn9vciard80tzkd7n7b9eaurtg84dbxm','NGMxMDI3NjdhMmI3NDIwNjcxNmMzZTA3ZDUyMzljN2FjMDZiYjM1NTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzLyJ9LCI0S1lXQk54OG5nd0MiXX0=','2015-10-05 16:22:04'),('dpux7byqwnae8poksps4l8s9sknmes4u','MzYyZjQ0OWZlMmQzYTgyNzAxMTY2YzYzNzRkMTE3OWRhNGRkMzVjNjp7Il9hdXRoX3VzZXJfaGFzaCI6ImMwYmFiOTRiYjgwMTljMzRkNWU5YTQzZmRhYzM3MDA5NTU4YTFhOTYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMyJ9','2015-09-20 08:14:27'),('e0ks80o5w2yrcxsk3twfxybehjcu7rfx','YjVmMWQ1MDgyYjM2MzRjOTA1NjhiMWVjNzkxZDczNTYxYWVhZjAyNTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiLyJ9LCJKT2d3M3k2Y0t2SXYiXX0=','2015-10-05 08:49:24'),('e17ruuhjl9wm2536q82d2nvh4qv6cpbd','ODM1NjQwMjQ5ZGQ3YTAwNThhOTdjYjNmMTRmMWI2ODk1MDZlOWIzMjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzL2N1aXNpbmVzLyJ9LCJZcURWMDRLUVhtYk0iXX0=','2015-10-13 12:15:53'),('e7h8835rtrtc65c05bbkxn49w3lwk4bj','Y2U3MTJjNTkwMGZiM2RlMmMyZjI4NDE4OGJjYTI1ZGM1YjFlYjQwZDp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL2FjY291bnRzL3Bhc3N3b3JkL3Jlc2V0LyJ9LCJnUkVkNlBmaUpsRDQiXX0=','2015-10-05 08:52:12'),('ej23uj32k8z4d6xh2pfh8jxua28wlkkm','NzIxNDM2MmI1ODZjNzA3OGI3OGFjMTZkMGJlMTc4N2RiOTZkYjNlNTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzLzIvbWVudS8ifSwiZ2s4aG0yQnlWaUJUIl19','2015-09-26 22:06:40'),('ejjgl65k6f9c81zovgr9razd2uww3358','OWRhNWVhYzVjZmFkMmU4ODUwODQ5MTdiMTc2MGQ5MTU1ZDg0YTYxMzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjM3OGY5MTY5OTkwY2ZjODc2OTFmNGE2Mjc4M2VmMTNiMmJlMWUyYzEiLCJhY2NvdW50X3VzZXIiOiJjIiwiX2F1dGhfdXNlcl9pZCI6IjEyIiwiYWNjb3VudF92ZXJpZmllZF9lbWFpbCI6bnVsbH0=','2015-09-16 17:05:07'),('fho20hzvknyuosg5kro5y4rrzu5sw2zm','NGMxODg1YTgwYzk1Yzk0NzA3YzJiM2JiMWJhMTI5M2I4NmI4YTQ4Mzp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzL2VzdGFibGlzaG1lbnRzLyJ9LCJKd0w2VXVwd0tHNUwiXX0=','2015-09-17 08:47:06'),('fif6e1kxhz23lhako5unqzkqzfc81wo0','NzdhZGQ0NzgxMjY0MTYwNWNmNDNmZTk3NWZkOGI4MjhiN2MzYjM3MDp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzL2xvY2FsaXRpZXMvIn0sIkUxQ1Y0eXNyTXA1bCJdfQ==','2015-10-05 08:56:54'),('fxz1e81j99e52chosavfqvu7pvysft8x','MmM0YmE5MzgxOWZlZGIyYjE1YjdmMWZiMGFhMzRhZjYxZDYzMzNlMzp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzLyJ9LCJrZk9BMENhakFzV3UiXX0=','2015-09-17 08:16:26'),('gmmu7rb3ieln580mbb2pvjdbm3qw8177','MzRjYThmZDk2MDE0MDJmNGZjODg1Y2Q1ZWZlOWUyMGI2ZDk3MmM0Zjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzLyJ9LCJmVDdRRm1CVTliMmUiXX0=','2015-09-29 19:08:30'),('gusds03fvv70vnhomifqfnem1ulsclbt','YmUxMGZjZWE0MzM2NmVmZmJmZTY4Y2QzMzczYTczODc4ZmRhNTFlNTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImEzZmNjMzJkYjA2ZWMyMWQ0YmJlZGNkM2M3Mjg1OGY4ODI3MjRjOTMiLCJhY2NvdW50X3VzZXIiOiJhIiwiX2F1dGhfdXNlcl9pZCI6IjEwIiwiYWNjb3VudF92ZXJpZmllZF9lbWFpbCI6bnVsbH0=','2015-09-16 16:54:10'),('gvia7lndclvejreomb5bdauc0ruezi5j','OGU3ZGY5NjRkYTAzMDJjOGEyNzY0MGVjMmZhOGY2NGVjMDQzYjMyMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjZiOGQ0YWVjOWM2MzMxZWRhNGE5MjgxNTcxMzRlMzAxNTUwNmQzZDQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2015-10-26 19:21:39'),('hd4zy4l1ayqj0qzr93w8c15s60p1l7be','MGMwYjRiNGE2NjNlY2ZiNzQ1ZjQ0NTk4NjBmYTFiNWJlMjI0NDdjMDp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzL2VzdGFibGlzaG1lbnRzLyJ9LCJhMFhRMXBmMUl1UWMiXX0=','2015-10-05 08:58:38'),('he03xxyabiutfvgctzj7hd5hcxdb3sk6','OTA4MzdlNDIwZGZkNGRkM2MxY2ZhMTY0NzdkOTY5MzczMDE0MmQ3Yzp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzLyJ9LCJ3akxqbFFaaEJnUFQiXX0=','2015-10-05 08:54:38'),('hny915rcpgga2habodufhq3ewod6hoap','NDQzMTZhZWNkNjJlMDZhNjBmM2E0MWEzODFjNzRhNDZiMWM1OWU3Zjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzLzIvbWVudS8ifSwiUzRORWxhcmhxV3VKIl19','2015-10-22 06:10:52'),('hrc8c50c7lc4cjxhu8n87ki4fat8swx5','NjhkNWNhNzM5N2JlYjU5YWYyMDBmNzQ2YTYwNjlhNmJiMTcxZWJiNTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzLzMvbWVudS8ifSwicHNKcmpFNkxsYWVNIl19','2015-10-15 01:52:48'),('hyugc5bytyw9uj4dvv1j5h6eq9d2b09g','MWZjYjhlNTAwYTdmMDRlZGQ4ODYwM2Q0ZmY0OWZlNjAyNjhhMTc5YTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzLzIvbWVudS8ifSwiREJSZzRHblBWYU5RIl19','2015-09-26 09:59:35'),('i7lqxerv6u1desp9189jfgzluo4e5vqk','MDQxYTNiMmI5ODFiOTExZDJlZTVlN2RiMWVkYjk1MmY4OThlYTNjYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjI0NzE4MGY2NzUwNjM5MjE5NDg3NzQzYWNmOWU5YmE0YTRkMzc2MTYiLCJhY2NvdW50X3VzZXIiOiJrIiwiX2F1dGhfdXNlcl9pZCI6IjIwIiwiYWNjb3VudF92ZXJpZmllZF9lbWFpbCI6bnVsbH0=','2015-10-13 11:18:39'),('i8rcem75xe0vgrtnijzkkmna74tptw36','M2M4NjBkMzg5YWU4OGEzN2EzOWM2N2VmZDUzZjFmNWMzOTE5M2IyNDp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzL2N1aXNpbmVzLyJ9LCJxMUlpcklkbWNnOWMiXX0=','2015-09-20 04:18:36'),('idokzvdba9301w9ho6v7e9xt0jpoa2uh','OGU3ZGY5NjRkYTAzMDJjOGEyNzY0MGVjMmZhOGY2NGVjMDQzYjMyMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjZiOGQ0YWVjOWM2MzMxZWRhNGE5MjgxNTcxMzRlMzAxNTUwNmQzZDQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2015-09-13 17:46:43'),('ip2lu32ziakkh8072xo3dddubzsu9s9t','ZDdiYzgxM2M1ZWZkNjdlZGU3ZWYwMjljZDRjYzQ3MTY4OWUxNTRhZDp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiNmI4ZDRhZWM5YzYzMzFlZGE0YTkyODE1NzEzNGUzMDE1NTA2ZDNkNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==','2015-10-07 12:42:44'),('is2pqa0g4r1rgkc2xrryu9fhswi4vysj','NjU1M2VkZjI5NTEwMGUxMWVjMzRkNjE4OGIxYzYzMDY5ODMwYmYwYzp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzLzIvbWVudS8ifSwiMVNMeXVWYmpVeFhWIl19','2015-09-20 04:24:07'),('is2slidafduw5iifnmglg8shv60wnt94','OGU5ZDA4MTBmYWNlZDgyZDUzOTE3ZTNiOGQ3ZDJkMTI3NDMzMTk4Zjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzLzEvbWVudS8ifSwiNFVzRjlBc2R6WE50Il19','2015-10-05 09:02:43'),('j30zmq4a40krq3plm4huf3lm7nb3ni1z','NmE3ODFkNDEwMmE1NWQwMjI3YWI0MjUxNzE2YmY1YzMwYTMzNTg2ZDp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzL2xvY2FsaXRpZXMvIn0sIjVvSTRKSEtqRDNKRyJdfQ==','2015-09-21 10:06:50'),('jpmevsmupay4fqldp47mranulacs7mgi','NWJmNTQ5MzZhMzg2MGYyY2FhMzk3ZmQzMWE0ZTA1NDVhYjJjOTg0MTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL2FjY291bnRzL3Bhc3N3b3JkL3Jlc2V0LyJ9LCJEa1FzZUxEN25Lb2oiXX0=','2015-09-20 04:13:24'),('l7a26brepolu0olvjc468w81fvliu9mf','M2NlMGY2YjM0MGIzYjE3ZjNkNTExNDdjYzA1ZTBmZWExYjIxNTQ2MTp7Il9hdXRoX3VzZXJfaGFzaCI6ImNkMjE4MGQ4ZGU3ODEzODBiYTc4YmI1ZjY1NTA5ZTI5MmVkZTg0MWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMTcifQ==','2015-10-14 13:45:43'),('lsn1vllfnhzn1c1uqvlltw90xberwzpu','YTBjNmFmZDgyZjRiODBkZTBiMDlkMWY5MjNmMmU5MTM3NDI1MzVhMzp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzL2xvY2FsaXRpZXMvIn0sInNZUUp4eDA1VFJaRiJdfQ==','2015-09-20 04:19:18'),('lyezrmber9utsuvxire0qa0v21ikhtgp','MmExYzViNTVjMWFiYTYxYTUxMzU1ZjM0NTE0YWU4ODdmYzg4NDUxNTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzL2VzdGFibGlzaG1lbnRzLyJ9LCJjVlh1ZVBZbHA0WFciXX0=','2015-09-21 04:56:10'),('m0d8ztqfdlb5vp4iq0drrsd3mkptjdrz','MDI3NWE0OGFkYjZhMzU1Yjg1NDAxOWU0YjE0MGJjMjEyNmU5ODIwYjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzLyJ9LCJ6NlR1MVlIb2MwVGYiXX0=','2015-09-20 14:20:17'),('m0mpbmc3ty9xq1mrn8fj5dc2aw03hkww','NWFiNzMzOTA5MTY4NTNkYjhjMTJiMGQ5ZmVhMGU3OTMzM2VkMzkyODp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL2FjY291bnRzL3Bhc3N3b3JkL3Jlc2V0LyJ9LCJxQUNsR2Mwb3BkOEMiXX0=','2015-10-05 08:53:58'),('m4aecqciutx02wdst25s3q0dbqur80d5','MTFlN2JiZjEwYWE5OTljOGY2YWI0YjA3MGMyNjRjM2U2NmFjYmZiZTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzL2xvY2FsaXRpZXMvIn0sIms1ZHFBdTlRUml0MiJdfQ==','2015-09-17 17:13:56'),('m77fae1u841x8gvgaijzqyht6roi9l6w','Y2U5MjRlYTIyMjlhYmMyMWZhMGU0M2ViY2QyYzQxNGY1MGNiNzhjNTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzL2N1aXNpbmVzLyJ9LCJINzRSOHdMMGZyODciXX0=','2015-10-20 06:46:11'),('mfwz8khkcdji0pdktvtffsly9nh55r4l','NzI0NmExNjk4NjU1ZGI1NWFkMjgxNTlhYmZmZTBkMTBlNzVlYTExMjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzLzMvbWVudS8ifSwiZnM4azZNMFFCVTVLIl19','2015-10-14 13:55:29'),('mh0s8rzrpmk37rz0u67bxcfziczcugxu','NWU2NmY5YTlkNTdmZTBlNzFiMjAwNGQ3NjM4NzFiNTZlMTI5YTE4NTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL2FjY291bnRzL3Bhc3N3b3JkL3Jlc2V0LyJ9LCJiWHY1YWs1WFdJcmoiXX0=','2015-10-16 00:09:58'),('n48nbb84lnsoh6nfp8rsd9stugotx4b4','ZDdiYzgxM2M1ZWZkNjdlZGU3ZWYwMjljZDRjYzQ3MTY4OWUxNTRhZDp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiNmI4ZDRhZWM5YzYzMzFlZGE0YTkyODE1NzEzNGUzMDE1NTA2ZDNkNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==','2015-10-26 13:33:11'),('n695ac92ttmltlt1dt696qxmqh7fmh11','NWRmMGQxNjliNGExMzQ3Yjk2YmU0ZTNiMzAwMTY0Yjc4NmM4OTcyMjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiLyJ9LCJXT3QyQTY5UWpHUXciXX0=','2015-09-13 17:29:45'),('n7njgm1sz4kiattnu4s171nffo0jofjt','M2MyMWFhYjRmMTc3MDE3MjE0MWY1ZDFlZmI4YjgzYjM2ZTVjZWI5Zjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzLzMvbWVudS8ifSwiUUc3cVJ1bzVUTHJuIl19','2015-10-14 14:00:02'),('nogbd37xiyyl4plvf9ssexbcj3rteo6z','OTQ5OTIwYWFjYmI5ZGRkMTM3Mzc1MTI2ZjNjMmE0NDY4OTY0MmI0Mjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzLzIvbWVudS8ifSwiQ2lReGZvdXZIS0F1Il19','2015-09-22 11:43:30'),('olg59nshv48o2c6tejbfgpq0zrb3c8dq','NWE3MzVmNDQ0MDZjOGZjZjA2ODBjZGVmMmU4ODM2Nzg5NzBhYTBlMTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzL2VzdGFibGlzaG1lbnRzLyJ9LCJ1VTRBcFZUYlNwSVYiXX0=','2015-09-20 04:17:24'),('op533221dawjymgomtkcyw4cgwq1m9oo','MWRhODY2ZTA4YmNhNmZlYmM5YTg2ZmJkMjI2YTE0ZjNhNmFmZDQ3Yzp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzL2xvY2FsaXRpZXMvIn0sIm1BUTVhYVVyejNpTSJdfQ==','2015-09-20 04:18:00'),('p159jue3vrvl1miu80j4n1lzw8h54bop','MDY5N2Q1MmVlMzgzNmY2Yjg4ZGJkNGNjN2FjMGFlMWQ0ZDlmYjViNTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzLyJ9LCJwMURrMHB1TUJzRDgiXX0=','2015-09-20 04:11:57'),('p5ngtzl5z217r82rpd5ppsb8w3i7ul55','ZTdmNTA1NmY0ZDE0ZjA2NmEzMDEyYzQ1YjRjZGNiNDVjMDBkMzE3Mzp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL2FjY291bnRzL3Bhc3N3b3JkL3Jlc2V0LyJ9LCJNSnY3MThrd3RybUkiXX0=','2015-09-20 15:13:18'),('pupcdaklavy4fb46f110dtm2u72mlzrv','MzllYTM0MDlkYTE2N2U0ZTk1ODJkNzBiYmI2Y2Q3YjAyMDVmNjkyOTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzL2xvY2FsaXRpZXMvIn0sIk9BSlh4ajU1ZFJQeiJdfQ==','2015-09-20 11:09:28'),('q03yx0otyme9sn5vd2refoj7bv2k3nl3','M2Q4MTE4YWM1ZjI0YjVhYzc3YzFhZWM3NmE4MTdmY2NiZTE0NTBjNDp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzL2N1aXNpbmVzLyJ9LCJUQVltd0ZNTzhKNjkiXX0=','2015-10-05 08:57:18'),('qhdnlinrvunu1lgf2j49xu8mh4jxfv0e','NDY1NTA3MGZiNjhhZjJlYWI3ZmE2ZDk1ZGM1YzRmZTkwMGFhYzJlZjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzL2N1aXNpbmVzLyJ9LCJlQmxabzJEM2V0cmMiXX0=','2015-09-09 11:38:53'),('qm6y7jaf4w5tl1em3tfneqylpi06f4zl','YzBjODI0M2E4OWEyNzBlNjUxNWE4YThmZmVkYWM2NmVjZTNlNjNkODp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzL2N1aXNpbmVzLyJ9LCIyS21QZ2ZoempuTVgiXX0=','2015-09-29 18:19:30'),('rv8ml3zec4cnqn4hcnc3k07hqqcx3mai','NGVmZTRmMTY3MTkwMjUxNjgwZjgxYzY0YmEyMjhiYTMwMDcyMTAwZjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiLyJ9LCJqYTNhcTEwbDBFblMiXX0=','2015-09-20 04:07:49'),('s2n15ejnjao2avdo6hf950a0s49l0ve8','ZjlmZTZkMmY4NGRhNjhmZmI2ZTk4ZmY1N2IyNjRkNjk5MTI4YTEyNjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiLyJ9LCJKVDB5Zk5ocFlUeTMiXX0=','2015-10-22 19:40:25'),('s4ck5di482k853gp535gbj32t1huhiih','YTY1OTliNjY2MWEzMmJlZjdlZTIxYzUzOGIwNzQ2MmUzNTUwMGRlNTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzLzIvbWVudS8ifSwiWjdQUTd3SHU5aE81Il19','2015-10-09 10:04:37'),('s6ggy1ja8pesk31qgne8zii0cmmhzaa2','ZTE4ZDA2ODk5ZDhlYTMxZjA0MWVlYzc0NTc0ZGJkZmQyMzI5MDIyMjp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk2ZTYxYzVjZDQxNDFjNTQ2NDk1ZWNhZTFiYzJmNTE3NWE1Y2QzNjQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiNCJ9','2015-09-29 19:08:29'),('s6xyp7iniul1yzj3f450ard6qccjqtw1','MzYyZjQ0OWZlMmQzYTgyNzAxMTY2YzYzNzRkMTE3OWRhNGRkMzVjNjp7Il9hdXRoX3VzZXJfaGFzaCI6ImMwYmFiOTRiYjgwMTljMzRkNWU5YTQzZmRhYzM3MDA5NTU4YTFhOTYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMyJ9','2015-09-20 07:45:26'),('se5xghncacsj533rq4wq6t1yo5vo56hh','ZjI2OGZmMDg2NmRlMDI5MDgyYTNlMmU5MmZmZDA2NGNmYjEwNmU4NDp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzLyJ9LCI5RjNlQlh4VXJRTEkiXX0=','2015-10-05 08:52:59'),('srnrs5krf5reko07lob98f2etg0j20s8','OGU3ZGY5NjRkYTAzMDJjOGEyNzY0MGVjMmZhOGY2NGVjMDQzYjMyMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjZiOGQ0YWVjOWM2MzMxZWRhNGE5MjgxNTcxMzRlMzAxNTUwNmQzZDQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2015-09-16 14:09:53'),('sveg8um4a4f89la53gd21beopq6n519m','NDk2OWViMDdkMDM3N2IzYzdlYjYwZTZkM2VhYTI2NTY2MDQwOWZhOTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzL2xvY2FsaXRpZXMvIn0sIjFDNHlCOGZhek5MUyJdfQ==','2015-09-09 11:33:33'),('thyp6nfdqqjbgpeeiq20lbxiu7ggl6cm','M2NlMGY2YjM0MGIzYjE3ZjNkNTExNDdjYzA1ZTBmZWExYjIxNTQ2MTp7Il9hdXRoX3VzZXJfaGFzaCI6ImNkMjE4MGQ4ZGU3ODEzODBiYTc4YmI1ZjY1NTA5ZTI5MmVkZTg0MWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMTcifQ==','2015-10-14 18:59:57'),('tse70uswyt8gwp3heub3swuumx4n1lrr','MzE0NTY4YjM0Y2M1ZTAzNjExYWI0YjAwNWYxM2I5ZGJjZmM3NDJlNTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzLzEvbWVudS8ifSwicDlXNU1KcnJNSmYyIl19','2015-09-20 04:22:10'),('tvtaogca2w4bfgiebd0topui5ebr1198','YzZkZGFjNDEzMTY2ODgyMzM2Y2IxODY2ODY2ZjcwOWM2NGQ5YzY1Mjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiLyJ9LCJaY3ZjUUR3ckYyb2EiXX0=','2015-09-21 11:05:10'),('u269tnjbrmsxzf37gioig8uh0a335y41','MWJmNGVhMzk1N2JlYjk3Mzg3YmUyZWI5NzM1NWRjYTVjYTAyYzlkMTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzLzIvbWVudS8ifSwiZEljWHpiek5oZElBIl19','2015-09-21 04:28:20'),('u2vsf29gcrver54es9j6ieo3ml90ierv','ZjFkZjY2ZTdiZTc5MjExNzkxNDRiYWIxMjhmOGZkNzQwYmI0OTgyYjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzLzIvbWVudS8ifSwiYm80dDZZNGtlSWdTIl19','2015-09-23 00:36:52'),('uixaxbiv5hkl483s23sp6z15ais2hnpf','MGYzOWM2YWJiZDM3YzMyOTAxNmNiYTY4MTQ5ODliN2UwY2UzMGY5Yjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzLzEvbWVudS8ifSwiTlYxR3dHQUN5ODZWIl19','2015-09-21 11:26:20'),('uqxojna1mziwstbiqro2eysfnd1psv3q','MmU2ZDlmYjM2M2JjYzQ1MjhlM2Q3YWY0Y2M3OTI0ZWYxYmM1NjRmZTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzLzEvbWVudS8ifSwidUMwVWRyVHRTamZGIl19','2015-09-21 09:33:10'),('utan8r2cwk7lpt00j20wqawn8t0lh400','NWQwOGUzMTI5OTRkNzk5OGI0MTg5YmE0MzhkZTdjN2FiYWIyMzlhYTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzLzEvbWVudS8ifSwiU3VtOTFDUm13SEdkIl19','2015-09-14 16:21:34'),('uvj2xs1pc4a4tq0f8j9908paaku74x2a','MGM2ZmFjZjNlNTk4YmIxNzkzNDczZWNhMGM0NGEzODA3MDg5ZWNiNzp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzLzIvbWVudS8ifSwiMWRuWWlWV2pkSnJKIl19','2015-09-22 09:27:30'),('uwaime30kf4i9lfgbvippifkbas1rfnc','Zjg4ZDJlYWVkMWUwYzFkMzY4NjE4YWZiN2VjNmEwZDU2NDFlNDNmNjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImVhYmY0YmQ0MDhiN2ZkZmZlYjQ0ZmUzOWUxOWFkMDFiYmRmOTQzZDUiLCJhY2NvdW50X3VzZXIiOiJkIiwiX2F1dGhfdXNlcl9pZCI6IjEzIiwiYWNjb3VudF92ZXJpZmllZF9lbWFpbCI6bnVsbH0=','2015-09-16 17:44:15'),('ux1slqgz8xxjysdy17pepxgt49qaiyce','NjJhYWUxMWRkNThlYTQ1NTU5NDM5OTAyOTRiNTFjNmRhNzUxZTBkNDp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzL2VzdGFibGlzaG1lbnRzLyJ9LCJiY0p1U2xDQkdFa3giXX0=','2015-09-22 22:20:22'),('vhj0wvfd0cc2jr1pd7av8nfagwvgme2n','MmY2YTg2OTlmZjc0OGZlY2NjZmMyOTk2Y2JkNzM2ZTc4NzdiMTI3Nzp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzLyJ9LCJ6U3o2blFSSnJFWEgiXX0=','2015-10-25 13:01:44'),('vo3pulrmo0gx42tltfwspm1dwvdz1c5l','NjQ1ZWUwODFjYjU0YmUxYTYxMjQ1ZWM3M2JjOTA2MGI4ZjlmZTZjNDp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzLzIvbWVudS8ifSwiaTZ5N2MzVjZxMDdFIl19','2015-09-22 21:40:23'),('wbzm1lg7gv9qyhan149lydjd4icn4u2w','NjhiYzk1NDEyNWMwMTVhMzAzZmRjNzVhOTMzN2UwMTczZDgwMDc2ZTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjBhMWQ3ZWUwMjY4ZGFmYWI4Y2JkNDlhZDgzNTFlNGUxZTM4ZmNkNDQiLCJhY2NvdW50X3VzZXIiOiJqIiwiX2F1dGhfdXNlcl9pZCI6IjE5IiwiYWNjb3VudF92ZXJpZmllZF9lbWFpbCI6bnVsbH0=','2015-10-13 09:08:35'),('wicnnt8deeh5yph4inngf2cie8v955l0','ZmZiYTFhYmMyODg5ZDM2ODk1MmI5NzQyYTJkNzIxMDE5MDVlOGFmZjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzLzIvbWVudS8ifSwicmlITWJ5MW1yNE1NIl19','2015-09-17 17:18:57'),('wqf75l27a3c5he034bb122fcg3wbk2s1','Njg5NmIzMGRhY2E0YjVjYTk1YmE4MThlN2MyYTcyY2Q1MDIwZWQ3YTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzLzIvbWVudS8ifSwiMkNUa0Z5Z3NrNFlkIl19','2015-09-23 18:15:51'),('wsf4ci154im3abk9vvnpdxay8fzogpby','ZTE0ZTViN2I2MTE1NTAyZDYyZjA4NzM3MDBkZWRiNmM4NjgwOTA4ZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjliOGZhNzVhNDE3ZmM5YTFhNjlmODQzZTZkNjk0ZTNmM2EyYTE1MGIiLCJhY2NvdW50X3VzZXIiOiJuIiwiX2F1dGhfdXNlcl9pZCI6IjIzIiwiYWNjb3VudF92ZXJpZmllZF9lbWFpbCI6bnVsbH0=','2015-10-26 22:00:47'),('x01ifiyjlqmkt5qj4p6msa9zr9ryd1n5','MzAzODY4Njk4YWU4OWMwMDgxYTk4MTJmOTgwZDZiZWIzNDM0YTIzNjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL2FjY291bnRzL3Bhc3N3b3JkL3Jlc2V0LyJ9LCIybXNWZHVycGRvUFgiXX0=','2015-09-20 04:12:40'),('x6wt99rttbrcsrh1ww208g0ekb9inbw2','ZjQzMzJjZGY2NjljNTQ5YjM0ZDYwNDI3NmY3YmJmOWRiY2M0NTNjYTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzLzEvbWVudS8ifSwiYVNGVVlkbUNFWk5TIl19','2015-09-20 04:23:07'),('xwzvs8nyty20fcyixx8t3s5g4xr8h06a','ZDdiYzgxM2M1ZWZkNjdlZGU3ZWYwMjljZDRjYzQ3MTY4OWUxNTRhZDp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiNmI4ZDRhZWM5YzYzMzFlZGE0YTkyODE1NzEzNGUzMDE1NTA2ZDNkNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==','2015-10-14 17:08:39'),('ydb0iw87y0lfj3r7f6md2x03jimlrg10','YWY2MGFkZTNiMzllODYxNmFmMDE4ZjkwOTJkNDMyYWUzZjcxN2NlZTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzLzEvbWVudS8ifSwiV0tVTkVPQ1NqV3psIl19','2015-10-11 00:50:22'),('ydot15tqo7fh69c3oz903gphrou3cvfk','ZGQzN2YzYThiMDQyYmUxNDgwODVhYmJhMjZhOGI3ZDM5YmNmMzA2MTp7Il9hdXRoX3VzZXJfaGFzaCI6IjZiZjhlN2E3ZjY0MTZjNDVjYzNkOWVmY2QzNTQzNjUyOTBlODIyYjIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMiJ9','2015-09-29 04:40:47'),('yty79u9srv227szhqnw1rb83as6wrc3b','NjI1NTg0MzEwYTNhN2Y1ZDdmNWQ1ZmM2ZWUwZDhlMGZlYTAzYjAxODp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzLzMvbWVudS8ifSwiaUpKaEVlZzRBU2w5Il19','2015-10-15 01:49:06'),('zgjdzh0loqnp57nt92mnshrk6ccj9u78','ODQ0ZDI5NjdiZDU2NmZhY2UxYmY3MTY1N2E0OThkYjRmMWM5OTEzYzp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiL3Jlc3RhdXJhbnRzLyJ9LCJiSGlHQmlSWkN0ODAiXX0=','2015-09-18 13:06:24'),('zqsbznhn5phougpb9c3uvw91r80qz62m','MjFhNDA4N2NlNzU0MTRlMzRhN2QxOGVkYTY0ZjM1ZjY2NDNkODkzNzp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiLyJ9LCJaUjl0ZVg1TVFDMEIiXX0=','2015-09-20 10:41:38'),('zwsbp8mikag5fprhfaj8ygxp3dzgdhja','ZTBhOWI3MjFjZTFmMDYxNjQ3OTIxYzM2MzcyYmZhNmY5MWVmOGE1MTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjU0NTRkMmI2M2I2YzJkZjBhOGJjMmU2YTQwOTBhZDU1ZGFiNDc5ODciLCJhY2NvdW50X3VzZXIiOiJsIiwiX2F1dGhfdXNlcl9pZCI6IjIxIiwiYWNjb3VudF92ZXJpZmllZF9lbWFpbCI6bnVsbH0=','2015-10-15 17:28:40'),('zy0g9z7cwbrrk0jzu5dn8ejz26sdpxd4','ZWFhYWY1N2JkMjU5NjgzODEwYzE0ODNmMGEyZWViNTI5MWVlZThiZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjA4YzdjYzJlYzgwMjFiZjhmYzJlYzEwMGE0MWQ4OGM4NWNmNzI2N2EiLCJhY2NvdW50X3VzZXIiOiI5IiwiX2F1dGhfdXNlcl9pZCI6IjkiLCJhY2NvdW50X3ZlcmlmaWVkX2VtYWlsIjpudWxsfQ==','2015-09-16 16:51:31');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurants_city`
--

DROP TABLE IF EXISTS `restaurants_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restaurants_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurants_city`
--

LOCK TABLES `restaurants_city` WRITE;
/*!40000 ALTER TABLE `restaurants_city` DISABLE KEYS */;
INSERT INTO `restaurants_city` VALUES (1,'New Delhi'),(2,'Patiala');
/*!40000 ALTER TABLE `restaurants_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurants_cuisine`
--

DROP TABLE IF EXISTS `restaurants_cuisine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restaurants_cuisine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurants_cuisine`
--

LOCK TABLES `restaurants_cuisine` WRITE;
/*!40000 ALTER TABLE `restaurants_cuisine` DISABLE KEYS */;
INSERT INTO `restaurants_cuisine` VALUES (1,'Italian',''),(2,'Continental','');
/*!40000 ALTER TABLE `restaurants_cuisine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurants_dish`
--

DROP TABLE IF EXISTS `restaurants_dish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restaurants_dish` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `about` varchar(100) NOT NULL,
  `dish_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `restaurants_dish_3e834d56` (`dish_type_id`),
  CONSTRAINT `restau_dish_type_id_26bdaab0bea0e683_fk_restaurants_dish_type_id` FOREIGN KEY (`dish_type_id`) REFERENCES `restaurants_dish_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurants_dish`
--

LOCK TABLES `restaurants_dish` WRITE;
/*!40000 ALTER TABLE `restaurants_dish` DISABLE KEYS */;
INSERT INTO `restaurants_dish` VALUES (1,'Arrabiata','Roma tomato, Bell Pepper, Olives, Chilies (Herb Rosemary)',1),(2,'Tomato Basil','Roma tomatoes, Baby Corn, Broccoli (Herb Basil)',1),(3,'Napolitano','Roma tomatoes, Broccoli, Mushroom (Herb Parsley)',1),(4,'Bolognese','Roma tomatoes, Minced Chicken, Herb Rosemary',1),(5,'Piri-Piri Chicken','Roma Tomatoes, Chicken, Cream, Roasted Veggies (Herb Basil)',1),(6,'Mushroom Alfredo','Cream, Mushroom, Olives(Herb, Parsely)',2),(7,'Creamy Garlic Alfredo','Cream, Broccoli, Olives (Herb Parsley) ',2),(8,'Three Cheese Alforno','Cream, Sweetcorn, Mushroom, Olives (Herb Parsley)',2),(9,'Milan','Cream, Chicken, Mushroom, Corn, Spinach. (Herb Parsley)',2),(10,'Chicken Brocollini','Cream, Chicken, Broccoli, Olives (Herb Parsley)',2),(11,' Polo Alla Panna ','Cream, Chicken, Mushroom, Olives (Herb Parsley)',2),(12,'Pink Sauce','1/2 Tomatoes, 1/2 Cream, Bell Pepper (Herb Parsley)',3),(13,'BBQ Tikka','Tikka Sauce ',3),(14,'Halloween','1/2 Tomatoes, 1/2Cream, Chicken, Bell Pepper (Herb Parsley)',3),(15,'BBQ Chichen Tikka','BBQ Chicken Tikka ',3),(18,'Mushroom','',5),(19,'Broccoli','',5),(20,'Mushroom Cheese Lasagna','Mushroom Layered Lasagna in Creamy Alfredo Sauce with Italian Herbs ',6),(21,'Garden Lasagna','Seasonal Veggies in Pink Sauce',6),(22,'Chicken Piri Piri Lasagna ','Spicy Chicken and Seasonal Veggies in Piri Piri Sauce with Herbs',6),(23,'Chicken White Velvet','Creamy Chicken, Mushroom, Broccoli in White Alfredo Sauce with Exotic Herbs',6),(27,'','',6),(28,'Classic Toast','Bread slices with Olive Oil, Butter and Garlic',8),(29,'Cheese Garlic','Cheese Layered Bread Slices with Oreganos',8),(30,'Spicy Supreme ','Cheese, Onions and Green Chilies',8),(31,'Exotica','Cheese, Olives, Jalapenos, Tomatoes and Onions',8),(32,'Triple Cheese','Tripal Quantity of Cheese , Parsley',8),(33,'Classic bruschetta','Bell Peppers, Onions, Cheese ',9),(34,'Cottage cheese bruschetta ','Cottage Cheese, Bell Peppers, Onions, Cheese',9),(35,'BBQ chicken bruschetta','Chicken, Bell Peppers, Onions, Cheese',9),(36,'Spicy chicken bruschetta','Spicy Chicken, Jalapenos, Cheese',9),(37,'Bell Peppers','',5),(38,'Baby Corn','',5),(39,'Sweet Corn','',5),(40,'Onion','',5),(41,'Olives','',5),(42,'Jalapeno','',5),(43,'Cheese','',5),(44,'Chicken','',5),(45,'Nutty','',10),(46,'Caesar','',10),(47,'Fresh Farm','',10),(48,'Hot Balsamic','',10),(49,'Mr. Bean','',10),(50,'Four Dips','',11),(51,'Topped ','Beans, Sweet Corn, Jalapenos',11),(52,'Baked Nachos','',11),(53,'Topped Chicken ','Beans, Sweet Corn, Jalapenos, Chicken',11),(54,'Cheesy Chicken','',11),(55,'Cheesy Jimmy','',12),(56,'OMG!','',12),(57,'Paneer Tikka 	','',12),(58,'Cheesy Nachos','',12),(59,'Chicken Tikka ','',12),(60,'Paprika Chicken ','',12),(61,'Minced chicken','',12),(62,'Cheese Jalapeno ','',13),(63,'Salsa','',13),(64,'Tandoori Tikka ','',13),(65,'Sour Cream','',13),(66,'Chocolate Shake ','Kit Kat / Oreo / Fudge',14),(67,'Milk Shake ','Strawberry/ Banana Caramel',14),(68,'Lemon Iced Tea','',14),(69,'Mojito ','Lemon Mint/ Roohafza',14),(70,'Cold Coffee ','Frappe/ Chocolate Frappe/ Nirvana',14),(71,'Hot Coffee ','Espresso/ Cappuccino/ Americano/ Latte',14),(84,'Add Ons','',14),(85,'Mineral Water','',14),(86,'Plain Salad','',15),(87,'Nacho Salad','',15),(88,'Veg Crispy Salad','',15),(89,'Chicken Crispy Salad','',15),(90,'Chicken Salami Salad','',15),(91,'Nachos','',15),(92,'Hawaiian Salad','',15),(93,'Crispy Burger','',16),(94,'Hara Bhara Burger','',16),(95,'Inferno Burger','',16),(96,'Veg Wrap','',17),(97,'Crispy Wrap','',17),(98,'Mix Veg Wrap','',17),(99,'Hara Bhara Wrap','',17),(100,'Crispy Cottage Cheese Wrap','',17),(101,'Texan Barbeque Wrap','',17),(102,'Hot & Spicy Wrap','',17),(103,'Mexican Salsa Wrap','',17),(104,'Cold Drink','',18),(105,'Water Bottle','',18),(106,'Ice Tea','',18),(107,'Cold Coffee','',18),(108,'Choco Frappe','',18),(109,'Choco Chip Frappe','',18),(110,'Oreo Frappe','',18),(111,'Snickers Frappe','',18),(112,'Galaxy Frappe','',18),(113,'Chicken Strip Burger','',19),(114,'Chicken Steak Burger','',19),(115,'Peri Peri Chicken Burger','',19),(116,'Crispy Chicken Fillet Burger','',19),(117,'Chicken Whopper','',19),(118,'Crispy Chicken Strips Wrap','',20),(119,'Seekh Kabab Wrap','',20),(120,'Mix Non Veg Kabab Wrap','',20),(121,'Chicken Bites Wrap','',20),(122,'Mexican Salsa Wrap','',20),(123,'Texan Barbeque Chicken Wrap','',20),(124,'Hot & Spicy ','',20),(125,'Mayonnaise','',21),(126,'Black Pepper Mayo','',21),(127,'Mango Jalapeno','',21),(128,'BBQ','',21),(129,'Cheesy Dip','',21),(130,'Mint Mayo','',21),(131,'Schezwan Sauce','',21),(132,'Salsa Sauce','',21),(133,'Honey Mustard','',21),(134,'Ceasers Sauce','',21),(135,'Thousand Island Sauces','',21),(136,'blah blah','',22);
/*!40000 ALTER TABLE `restaurants_dish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurants_dish_price`
--

DROP TABLE IF EXISTS `restaurants_dish_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restaurants_dish_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qty_or_name` varchar(50) NOT NULL,
  `price` double NOT NULL,
  `vegOrNot` varchar(1) NOT NULL,
  `dish_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `restaurants_dish_dish_id_5e19a65aed2b04f9_fk_restaurants_dish_id` (`dish_id`),
  CONSTRAINT `restaurants_dish_dish_id_5e19a65aed2b04f9_fk_restaurants_dish_id` FOREIGN KEY (`dish_id`) REFERENCES `restaurants_dish` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurants_dish_price`
--

LOCK TABLES `restaurants_dish_price` WRITE;
/*!40000 ALTER TABLE `restaurants_dish_price` DISABLE KEYS */;
INSERT INTO `restaurants_dish_price` VALUES (1,'Regular',195,'V',1),(2,'Large',285,'V',1),(3,'Regular',195,'V',2),(4,'Large',285,'V',2),(5,'Regular',195,'V',3),(6,'Large',285,'V',3),(7,'Regular',245,'N',4),(8,'Large',345,'N',4),(9,'Regular',245,'N',5),(10,'Large',345,'N',5),(11,'Regular',195,'V',6),(12,'Large',285,'V',6),(13,'Regular',195,'V',7),(14,'Large',285,'V',7),(15,'Regular',195,'V',8),(16,'Large',285,'V',8),(17,'Regular',245,'N',9),(18,'Large',345,'N',9),(19,'Regular',245,'N',10),(20,'Large',345,'N',10),(21,'Regular',245,'N',11),(22,'Large',345,'N',11),(23,'Regular',195,'V',12),(24,'Large',285,'V',12),(25,'Regular',195,'V',13),(26,'Large',285,'V',13),(27,'Regaular',245,'N',14),(28,'Large',345,'N',14),(29,'Regular',245,'N',15),(30,'Large',245,'N',15),(33,'Regular',20,'V',18),(34,'Large',30,'V',18),(35,'Regular',20,'V',19),(36,'Large',30,'V',19),(37,'Regular ',295,'V',20),(38,'Large',395,'V',20),(39,'Regular ',295,'V',21),(40,'Large',395,'V',21),(41,'Regular',345,'N',22),(42,'Large',490,'N',22),(43,'Regular',345,'N',23),(44,'Large',490,'N',23),(46,'Regular',95,'V',28),(47,'Regular',115,'V',29),(48,'Regular',125,'V',30),(49,'Regular',125,'V',31),(50,'Regular',125,'V',32),(51,'Regular',155,'V',33),(52,'Regular',155,'V',34),(53,'Regular',175,'N',35),(54,'Regular',175,'N',36),(55,'Regular',20,'V',37),(56,'Large',30,'V',37),(57,'Regular',20,'V',38),(58,'Large',30,'V',38),(59,'Regular',20,'V',39),(60,'Large',30,'V',39),(61,'Regular',20,'V',40),(62,'Large',30,'V',40),(63,'Regular',20,'V',41),(64,'Large',30,'V',41),(65,'Regular',20,'V',42),(66,'Large',30,'V',42),(67,'Regular',20,'V',43),(68,'Large',30,'V',43),(69,'Regular',45,'N',44),(70,'Large',65,'N',44),(71,'Regular',145,'V',45),(72,'Large',210,'V',45),(73,'Regular',145,'N',45),(74,'Large',270,'N',45),(75,'Regular',145,'V',46),(76,'Large',210,'V',46),(77,'Regular',190,'N',46),(78,'Large',270,'N',46),(79,'Regular',145,'V',47),(80,'Large',210,'V',47),(81,'Regular',190,'N',47),(82,'Large',270,'N',47),(83,'Regular',145,'V',48),(84,'Large',210,'V',48),(85,'Regular',190,'N',48),(86,'Large',270,'N',48),(87,'Regular',145,'V',49),(88,'Large',210,'V',49),(89,'Regular',190,'N',49),(90,'Large',270,'N',49),(91,'Regular',145,'V',50),(92,'Large',185,'V',50),(93,'Regular',145,'V',51),(94,'Large',185,'V',51),(95,'Regular',145,'V',52),(96,'Large',185,'V',52),(97,'Regular',170,'N',53),(98,'Large',230,'N',53),(99,'Regular',170,'N',54),(100,'Large',230,'N',54),(101,'',125,'V',55),(102,'',125,'V',56),(103,'',125,'V',57),(104,'',125,'V',58),(105,'',145,'N',59),(106,'',145,'N',60),(107,'',145,'N',61),(108,'',30,'V',62),(109,'',30,'V',63),(110,'',30,'V',64),(111,'',30,'V',65),(112,'',145,'V',66),(113,'',95,'V',67),(114,'',75,'V',68),(115,'',95,'V',69),(116,'Frappe',120,'V',70),(117,'Chocolate Frappe ',125,'V',70),(118,'Nirvana',145,'V',70),(119,'Espresso',85,'V',71),(120,'Cappuccino',85,'V',71),(121,'Americano',85,'V',71),(122,'Latte',85,'V',71),(141,'Ice Cream',20,'V',84),(142,'Chocolate',20,'V',84),(143,'Caramel',20,'V',84),(144,'MRP',0,'V',85),(145,'With Dressings',90,'V',86),(146,'without dressings',100,'V',87),(147,'with dressings',110,'V',87),(148,'Veg',90,'V',88),(149,'Non Veg',100,'N',89),(150,'Non Veg',100,'N',90),(151,'Salsa Sauce and Cheesy Dip',60,'V',91),(152,'Jalapeños and Salsa',60,'V',91),(153,'Veg',100,'V',92),(154,'Non Veg',120,'N',92),(155,'Veg',45,'V',93),(156,'Veg',50,'V',94),(157,'Veg',50,'V',95),(158,'Veg',60,'V',96),(159,'Veg',65,'V',97),(160,'Veg',70,'V',98),(161,'Veg',70,'V',99),(162,'Veg',90,'V',100),(163,'Veg',70,'V',101),(164,'Veg',70,'V',102),(165,'Veg',70,'V',103),(166,'can',25,'D',104),(167,'bottle',40,'D',104),(168,'Packaged',20,'D',105),(169,'Medium',25,'D',106),(170,'Large',35,'D',106),(171,'Regular',40,'D',107),(172,'Regular',45,'D',108),(173,'Regular',50,'D',109),(174,'Regular',55,'D',110),(175,'Regular',55,'D',111),(176,'Regular',55,'D',112),(177,'Non Veg',55,'N',113),(178,'Non Veg',60,'N',114),(179,'Non Veg',70,'N',115),(180,'Non Veg',70,'N',116),(181,'Non Veg',90,'N',117),(182,'Non Veg',90,'N',118),(183,'Chicken',90,'N',119),(184,'Mutton',95,'N',119),(185,'Non Veg',95,'N',120),(186,'Non Veg',90,'N',121),(187,'Non Veg',95,'N',122),(188,'Non Veg',95,'N',123),(189,'Non Veg',95,'N',124),(190,'Dip',10,'V',125),(191,'Dip',12,'V',126),(192,'Dip',15,'V',127),(193,'Dip',15,'V',128),(194,'Dip',15,'V',129),(195,'Dip',12,'V',130),(196,'Sauce',12,'V',131),(197,'Sauce',15,'V',132),(198,'Sauce',15,'V',133),(199,'Sauce',15,'V',134),(200,'Sauce',15,'V',135),(201,'wqasf',23,'V',136);
/*!40000 ALTER TABLE `restaurants_dish_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurants_dish_type`
--

DROP TABLE IF EXISTS `restaurants_dish_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restaurants_dish_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `vegOrNot` varchar(1) NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `about` varchar(100),
  PRIMARY KEY (`id`),
  KEY `restaurants_dish_type_ee9d9d3e` (`restaurant_id`),
  CONSTRAINT `rest_restaurant_id_28af80bf5027e946_fk_restaurants_restaurant_id` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants_restaurant` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurants_dish_type`
--

LOCK TABLES `restaurants_dish_type` WRITE;
/*!40000 ALTER TABLE `restaurants_dish_type` DISABLE KEYS */;
INSERT INTO `restaurants_dish_type` VALUES (1,'Signature Pastas (Tomatoey)','B',1,'Tomatoey'),(2,'Signature Pastas (Creamy)','B',1,'Creamy'),(3,'Signature Pastas','B',1,'a bit of both'),(5,'Pasta Add-On','B',1,''),(6,'Lasagna','B',1,'Serve with Garlic Bread'),(8,'Garlic Breads','V',1,''),(9,'Bruschetta','B',1,''),(10,'Salad','B',1,''),(11,'Nachos','B',1,''),(12,'Sandwiches','B',1,''),(13,'Dips','V',1,''),(14,'Shakes & Beverages','D',1,''),(15,'Salads','B',3,'Salads made from the most fresh vegetables with mouth watering sauces!'),(16,'Burgers (Veg)','V',3,'Sumptuous burgers for you!'),(17,'Wraps (Veg)','V',3,''),(18,'Drinks','',3,''),(19,'Burgers (Non-Veg)','N',3,''),(20,'Wraps (Non Veg)','',3,''),(21,'Dips','',3,''),(22,'blah','B',2,'');
/*!40000 ALTER TABLE `restaurants_dish_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurants_dish_userDownVotes`
--

DROP TABLE IF EXISTS `restaurants_dish_userDownVotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restaurants_dish_userDownVotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dish_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dish_id` (`dish_id`,`user_id`),
  KEY `restaurants_dish_userDo_user_id_3618e4bfdc7ab89f_fk_auth_user_id` (`user_id`),
  CONSTRAINT `restaurants_dish_dish_id_1fcab7e4da9f87a6_fk_restaurants_dish_id` FOREIGN KEY (`dish_id`) REFERENCES `restaurants_dish` (`id`),
  CONSTRAINT `restaurants_dish_userDo_user_id_3618e4bfdc7ab89f_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurants_dish_userDownVotes`
--

LOCK TABLES `restaurants_dish_userDownVotes` WRITE;
/*!40000 ALTER TABLE `restaurants_dish_userDownVotes` DISABLE KEYS */;
INSERT INTO `restaurants_dish_userDownVotes` VALUES (38,5,2),(35,13,2);
/*!40000 ALTER TABLE `restaurants_dish_userDownVotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurants_dish_userUpVotes`
--

DROP TABLE IF EXISTS `restaurants_dish_userUpVotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restaurants_dish_userUpVotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dish_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dish_id` (`dish_id`,`user_id`),
  KEY `restaurants_dish_userUpV_user_id_84e4a19c7b8d13c_fk_auth_user_id` (`user_id`),
  CONSTRAINT `restaurants_dish_dish_id_2c6d2ab1da6c5af5_fk_restaurants_dish_id` FOREIGN KEY (`dish_id`) REFERENCES `restaurants_dish` (`id`),
  CONSTRAINT `restaurants_dish_userUpV_user_id_84e4a19c7b8d13c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=524 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurants_dish_userUpVotes`
--

LOCK TABLES `restaurants_dish_userUpVotes` WRITE;
/*!40000 ALTER TABLE `restaurants_dish_userUpVotes` DISABLE KEYS */;
INSERT INTO `restaurants_dish_userUpVotes` VALUES (492,1,1),(484,2,1),(207,3,1),(176,4,2),(486,5,1),(489,6,1),(290,7,1),(479,7,3),(168,8,2),(480,11,3),(481,12,1),(175,12,2),(497,13,1),(470,13,4),(16,14,1),(494,18,1),(27,20,1),(35,22,1),(473,28,4),(490,29,1),(46,30,1),(495,43,1),(505,86,20),(520,86,24),(510,87,1),(504,88,20),(521,88,24),(507,89,1),(508,90,1),(513,91,24),(514,94,24),(515,98,24),(499,100,19),(516,101,24),(517,104,24),(518,107,24),(519,110,24),(523,118,26);
/*!40000 ALTER TABLE `restaurants_dish_userUpVotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurants_establishment`
--

DROP TABLE IF EXISTS `restaurants_establishment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restaurants_establishment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurants_establishment`
--

LOCK TABLES `restaurants_establishment` WRITE;
/*!40000 ALTER TABLE `restaurants_establishment` DISABLE KEYS */;
INSERT INTO `restaurants_establishment` VALUES (1,'CAFE'),(2,'Restaurant'),(3,'Bar'),(4,'Salad Bar');
/*!40000 ALTER TABLE `restaurants_establishment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurants_locality`
--

DROP TABLE IF EXISTS `restaurants_locality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restaurants_locality` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `part_of_city` varchar(50) NOT NULL,
  `area` varchar(30) NOT NULL,
  `city_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `restaurants_loca_city_id_3551298e04fa6621_fk_restaurants_city_id` (`city_id`),
  CONSTRAINT `restaurants_loca_city_id_3551298e04fa6621_fk_restaurants_city_id` FOREIGN KEY (`city_id`) REFERENCES `restaurants_city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurants_locality`
--

LOCK TABLES `restaurants_locality` WRITE;
/*!40000 ALTER TABLE `restaurants_locality` DISABLE KEYS */;
INSERT INTO `restaurants_locality` VALUES (1,'East Delhi','Anand Vihar',1),(2,'Patiala','Patiala',2);
/*!40000 ALTER TABLE `restaurants_locality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurants_notifications`
--

DROP TABLE IF EXISTS `restaurants_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restaurants_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `about` longtext NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rest_restaurant_id_7086185e25b6c13d_fk_restaurants_restaurant_id` (`restaurant_id`),
  CONSTRAINT `rest_restaurant_id_7086185e25b6c13d_fk_restaurants_restaurant_id` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants_restaurant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurants_notifications`
--

LOCK TABLES `restaurants_notifications` WRITE;
/*!40000 ALTER TABLE `restaurants_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `restaurants_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurants_profile`
--

DROP TABLE IF EXISTS `restaurants_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restaurants_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `restaurants_profile_user_id_50d516c02add5d0a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurants_profile`
--

LOCK TABLES `restaurants_profile` WRITE;
/*!40000 ALTER TABLE `restaurants_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `restaurants_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurants_restaurant`
--

DROP TABLE IF EXISTS `restaurants_restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restaurants_restaurant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enable` tinyint(1) NOT NULL,
  `name` varchar(50) NOT NULL,
  `about` varchar(500) NOT NULL,
  `address` varchar(300) NOT NULL,
  `phone` varchar(13) NOT NULL,
  `service_charge` double DEFAULT NULL,
  `service_tax_food` double DEFAULT NULL,
  `service_tax_drinks` double DEFAULT NULL,
  `vat` double DEFAULT NULL,
  `service_tax_hardDrinks` double DEFAULT NULL,
  `locality_id` int(11) NOT NULL,
  `album` varchar(300) NOT NULL,
  `coverpic` varchar(100) NOT NULL,
  `thumbnail` varchar(100) NOT NULL,
  `facebook` varchar(100) NOT NULL,
  `url` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `restaurants_restaurant_url_1c63d7a1e6894f8b_uniq` (`url`),
  KEY `restauran_locality_id_533ca421d38799d_fk_restaurants_locality_id` (`locality_id`),
  CONSTRAINT `restauran_locality_id_533ca421d38799d_fk_restaurants_locality_id` FOREIGN KEY (`locality_id`) REFERENCES `restaurants_locality` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurants_restaurant`
--

LOCK TABLES `restaurants_restaurant` WRITE;
/*!40000 ALTER TABLE `restaurants_restaurant` DISABLE KEYS */;
INSERT INTO `restaurants_restaurant` VALUES (1,1,'CAFE WINK','When you think real fresh , Wink is one place where you can enjoy freshness! Happy Winking !! Be Naughty!!','G 1, Sikka Galaxy, Shrestha Vihar,, New Delhi, India 110092','011-43596979',0,0,0,14,0,1,'','','','https://www.facebook.com/winkme','cafe_wink'),(2,0,'Recharge','','Shop No. 64,65 DAC Complex Opp Mini Secreteriat, Patiala, India 147001','9501376500',NULL,NULL,NULL,NULL,NULL,2,'','','','','recharge'),(3,1,'Wrapchik','A quick stop for your hunger woes!','Shop number 3, COS Market, Thapar University','0175-5003000',0,0,0,0,0,2,'','http://i.imgur.com/mX5R7Cz.jpg?1','','https://www.facebook.com/Wrapchik-227302984131629/timeline/','wrapchik');
/*!40000 ALTER TABLE `restaurants_restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurants_restaurant_cuisines`
--

DROP TABLE IF EXISTS `restaurants_restaurant_cuisines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restaurants_restaurant_cuisines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `restaurant_id` int(11) NOT NULL,
  `cuisine_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `restaurant_id` (`restaurant_id`,`cuisine_id`),
  KEY `restaurant_cuisine_id_183c2b53507a5f08_fk_restaurants_cuisine_id` (`cuisine_id`),
  CONSTRAINT `restaurant_cuisine_id_183c2b53507a5f08_fk_restaurants_cuisine_id` FOREIGN KEY (`cuisine_id`) REFERENCES `restaurants_cuisine` (`id`),
  CONSTRAINT `rest_restaurant_id_1aa4b7a8623499d2_fk_restaurants_restaurant_id` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants_restaurant` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurants_restaurant_cuisines`
--

LOCK TABLES `restaurants_restaurant_cuisines` WRITE;
/*!40000 ALTER TABLE `restaurants_restaurant_cuisines` DISABLE KEYS */;
INSERT INTO `restaurants_restaurant_cuisines` VALUES (16,1,1),(20,3,2);
/*!40000 ALTER TABLE `restaurants_restaurant_cuisines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurants_restaurant_establishment`
--

DROP TABLE IF EXISTS `restaurants_restaurant_establishment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restaurants_restaurant_establishment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `restaurant_id` int(11) NOT NULL,
  `establishment_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `restaurant_id` (`restaurant_id`,`establishment_id`),
  KEY `ec01f9fe97e3c3770d9ebe60a090b2e7` (`establishment_id`),
  CONSTRAINT `ec01f9fe97e3c3770d9ebe60a090b2e7` FOREIGN KEY (`establishment_id`) REFERENCES `restaurants_establishment` (`id`),
  CONSTRAINT `rest_restaurant_id_671ff8bf5f80bb6d_fk_restaurants_restaurant_id` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants_restaurant` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurants_restaurant_establishment`
--

LOCK TABLES `restaurants_restaurant_establishment` WRITE;
/*!40000 ALTER TABLE `restaurants_restaurant_establishment` DISABLE KEYS */;
INSERT INTO `restaurants_restaurant_establishment` VALUES (32,1,1),(43,2,2),(44,2,3),(41,3,2),(42,3,4);
/*!40000 ALTER TABLE `restaurants_restaurant_establishment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialaccount`
--

DROP TABLE IF EXISTS `socialaccount_socialaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialaccount_socialaccount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialaccount_provider_36eec1734f431f56_uniq` (`provider`,`uid`),
  KEY `socialaccount_socialacc_user_id_3fd78aac97693583_fk_auth_user_id` (`user_id`),
  CONSTRAINT `socialaccount_socialacc_user_id_3fd78aac97693583_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialaccount`
--

LOCK TABLES `socialaccount_socialaccount` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialaccount` DISABLE KEYS */;
INSERT INTO `socialaccount_socialaccount` VALUES (1,'facebook','10204749159277391','2015-10-12 17:53:56','2015-08-25 19:38:35','{\"first_name\": \"Varun\", \"last_name\": \"Bansal\", \"verified\": true, \"name\": \"Varun Bansal\", \"locale\": \"en_GB\", \"gender\": \"male\", \"updated_time\": \"2015-10-07T18:17:59+0000\", \"link\": \"https://www.facebook.com/app_scoped_user_id/10204749159277391/\", \"timezone\": 5.5, \"id\": \"10204749159277391\"}',2),(2,'google','104867476004836358341','2015-09-06 08:14:27','2015-08-25 19:38:52','{\"picture\": \"https://lh4.googleusercontent.com/-FxT8S4VqSg4/AAAAAAAAAAI/AAAAAAAAAOs/fFW72Wfh0I0/photo.jpg\", \"name\": \"Varun Bansal\", \"family_name\": \"Bansal\", \"locale\": \"en\", \"gender\": \"male\", \"link\": \"https://plus.google.com/104867476004836358341\", \"given_name\": \"Varun\", \"id\": \"104867476004836358341\"}',3),(3,'facebook','444598032409205','2015-09-15 19:08:40','2015-08-25 20:22:44','{\"first_name\": \"Anirudh\", \"last_name\": \"Goyal\", \"verified\": true, \"name\": \"Anirudh Goyal\", \"locale\": \"en_GB\", \"gender\": \"male\", \"updated_time\": \"2014-01-01T21:18:21+0000\", \"link\": \"https://www.facebook.com/app_scoped_user_id/444598032409205/\", \"timezone\": 5.5, \"id\": \"444598032409205\"}',4),(4,'google','111971616363348352482','2015-08-29 09:17:48','2015-08-29 09:17:48','{\"picture\": \"https://lh3.googleusercontent.com/-IpxMMqrjO4o/AAAAAAAAAAI/AAAAAAAAAGw/bt3b39nrPKQ/photo.jpg\", \"name\": \"sk mathur\", \"family_name\": \"mathur\", \"locale\": \"en\", \"gender\": \"male\", \"link\": \"https://plus.google.com/111971616363348352482\", \"given_name\": \"sk\", \"id\": \"111971616363348352482\"}',5),(5,'facebook','10207563298302814','2015-08-30 17:42:07','2015-08-30 17:42:07','{\"first_name\": \"Ayush\", \"last_name\": \"Agarwal\", \"verified\": true, \"name\": \"Ayush Agarwal\", \"locale\": \"en_US\", \"gender\": \"male\", \"updated_time\": \"2015-06-19T11:35:51+0000\", \"link\": \"https://www.facebook.com/app_scoped_user_id/10207563298302814/\", \"timezone\": 5.5, \"id\": \"10207563298302814\"}',6),(6,'facebook','1017825821585144','2015-09-02 15:18:24','2015-09-02 15:18:24','{\"first_name\": \"Rajat\", \"last_name\": \"Tulasyan\", \"verified\": true, \"name\": \"Rajat Tulasyan\", \"locale\": \"en_US\", \"gender\": \"male\", \"updated_time\": \"2015-06-09T07:48:34+0000\", \"link\": \"https://www.facebook.com/app_scoped_user_id/1017825821585144/\", \"timezone\": 5.5, \"id\": \"1017825821585144\"}',7),(7,'facebook','494199410754734','2015-09-02 16:51:31','2015-09-02 16:51:31','{\"first_name\": \"Mayur\", \"last_name\": \"Ramavat\", \"verified\": true, \"name\": \"Mayur Ramavat\", \"locale\": \"en_US\", \"gender\": \"male\", \"updated_time\": \"2015-07-29T05:35:23+0000\", \"link\": \"https://www.facebook.com/app_scoped_user_id/494199410754734/\", \"timezone\": 5.5, \"id\": \"494199410754734\"}',9),(8,'google','116884810212364078869','2015-09-02 16:54:10','2015-09-02 16:54:10','{\"picture\": \"https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/photo.jpg\", \"name\": \"animesh mishra\", \"family_name\": \"mishra\", \"locale\": \"en-GB\", \"gender\": \"male\", \"link\": \"https://plus.google.com/116884810212364078869\", \"given_name\": \"animesh\", \"id\": \"116884810212364078869\"}',10),(9,'google','107009263576064085605','2015-09-02 17:01:54','2015-09-02 17:01:54','{\"picture\": \"https://lh6.googleusercontent.com/-D-NO2OARhO8/AAAAAAAAAAI/AAAAAAAAEHg/ELL4HVTAkaQ/photo.jpg\", \"name\": \"kanchan goel\", \"family_name\": \"goel\", \"locale\": \"en-GB\", \"gender\": \"female\", \"link\": \"https://plus.google.com/107009263576064085605\", \"given_name\": \"kanchan\", \"id\": \"107009263576064085605\"}',11),(10,'facebook','10205371955633512','2015-09-02 17:05:07','2015-09-02 17:05:07','{\"first_name\": \"Anirudh\", \"last_name\": \"Rustagi\", \"verified\": true, \"name\": \"Anirudh Rustagi\", \"locale\": \"en_US\", \"gender\": \"male\", \"updated_time\": \"2015-08-28T16:16:44+0000\", \"link\": \"https://www.facebook.com/app_scoped_user_id/10205371955633512/\", \"timezone\": 5.5, \"id\": \"10205371955633512\"}',12),(11,'facebook','1145189885495261','2015-09-02 17:44:15','2015-09-02 17:44:15','{\"first_name\": \"Ayush\", \"last_name\": \"Bhatnagar\", \"verified\": true, \"name\": \"Ayush Bhatnagar\", \"locale\": \"en_GB\", \"gender\": \"male\", \"updated_time\": \"2015-07-21T14:31:04+0000\", \"link\": \"https://www.facebook.com/app_scoped_user_id/1145189885495261/\", \"timezone\": 5.5, \"id\": \"1145189885495261\"}',13),(12,'facebook','1029556343744927','2015-09-05 18:51:35','2015-09-02 22:51:20','{\"first_name\": \"Varun\", \"last_name\": \"Sharma\", \"verified\": true, \"name\": \"Varun Sharma\", \"locale\": \"en_US\", \"gender\": \"male\", \"updated_time\": \"2015-05-08T13:55:29+0000\", \"link\": \"https://www.facebook.com/app_scoped_user_id/1029556343744927/\", \"timezone\": 5.5, \"id\": \"1029556343744927\"}',14),(13,'facebook','10205091123183857','2015-09-03 07:15:44','2015-09-03 07:15:44','{\"first_name\": \"Akash\", \"last_name\": \"Tandon\", \"verified\": true, \"name\": \"Akash Tandon\", \"locale\": \"en_US\", \"gender\": \"male\", \"updated_time\": \"2015-06-05T18:18:56+0000\", \"link\": \"https://www.facebook.com/app_scoped_user_id/10205091123183857/\", \"timezone\": 5.5, \"id\": \"10205091123183857\"}',15),(14,'google','109990892287356710701','2015-09-30 18:59:57','2015-09-06 06:30:26','{\"picture\": \"https://lh6.googleusercontent.com/-Z2u9LMCe7Q4/AAAAAAAAAAI/AAAAAAAAAYw/5TJEZtG0NO4/photo.jpg\", \"name\": \"Akshat Mathur\", \"family_name\": \"Mathur\", \"locale\": \"en-GB\", \"gender\": \"male\", \"link\": \"https://plus.google.com/109990892287356710701\", \"given_name\": \"Akshat\", \"id\": \"109990892287356710701\"}',17),(15,'google','112339194325002951323','2015-09-29 09:08:35','2015-09-29 09:08:35','{\"picture\": \"https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/photo.jpg\", \"name\": \"Harnoor Singh\", \"family_name\": \"Singh\", \"locale\": \"en\", \"gender\": \"male\", \"link\": \"https://plus.google.com/112339194325002951323\", \"given_name\": \"Harnoor\", \"id\": \"112339194325002951323\"}',19),(16,'facebook','533786746777764','2015-09-29 11:18:39','2015-09-29 11:18:39','{\"first_name\": \"Shina\", \"last_name\": \"Puri\", \"verified\": true, \"name\": \"Shina Puri\", \"locale\": \"en_GB\", \"gender\": \"female\", \"updated_time\": \"2015-09-28T16:40:08+0000\", \"link\": \"https://www.facebook.com/app_scoped_user_id/533786746777764/\", \"timezone\": 5.5, \"id\": \"533786746777764\"}',20),(17,'facebook','855008694575182','2015-10-01 17:28:40','2015-10-01 17:28:40','{\"first_name\": \"Steven\", \"last_name\": \"Sidhu\", \"verified\": false, \"name\": \"Steven Sidhu\", \"locale\": \"en_US\", \"gender\": \"male\", \"updated_time\": \"2014-10-23T07:47:41+0000\", \"link\": \"https://www.facebook.com/app_scoped_user_id/855008694575182/\", \"timezone\": 5.5, \"id\": \"855008694575182\"}',21),(18,'facebook','1055874764445392','2015-10-12 18:24:14','2015-10-12 18:24:14','{\"first_name\": \"Anwesh\", \"last_name\": \"Sahoo\", \"verified\": true, \"name\": \"Anwesh Sahoo\", \"locale\": \"en_GB\", \"gender\": \"male\", \"updated_time\": \"2015-10-04T15:47:15+0000\", \"link\": \"https://www.facebook.com/app_scoped_user_id/1055874764445392/\", \"timezone\": 5.5, \"id\": \"1055874764445392\"}',22),(19,'google','101760283196013810081','2015-10-12 22:00:47','2015-10-12 22:00:47','{\"picture\": \"https://lh4.googleusercontent.com/-K53FcEn7vo8/AAAAAAAAAAI/AAAAAAAAAXQ/ACmH0aJFLjg/photo.jpg\", \"name\": \"Kartik Gupta\", \"family_name\": \"Gupta\", \"locale\": \"en\", \"gender\": \"male\", \"link\": \"https://plus.google.com/101760283196013810081\", \"given_name\": \"Kartik\", \"id\": \"101760283196013810081\"}',23),(20,'google','113459316576444564344','2015-10-13 05:27:06','2015-10-13 05:27:06','{\"picture\": \"https://lh6.googleusercontent.com/-NfAvRy52ARc/AAAAAAAAAAI/AAAAAAAAALM/4WuhhJWKoQw/photo.jpg\", \"name\": \"Varun Bansal\", \"family_name\": \"Bansal\", \"locale\": \"en-GB\", \"gender\": \"male\", \"link\": \"https://plus.google.com/113459316576444564344\", \"given_name\": \"Varun\", \"id\": \"113459316576444564344\"}',24),(21,'facebook','1275862949105912','2015-10-13 09:42:31','2015-10-13 09:42:31','{\"first_name\": \"Aman\", \"last_name\": \"Mathur\", \"verified\": true, \"name\": \"Aman Mathur\", \"locale\": \"en_US\", \"gender\": \"male\", \"updated_time\": \"2015-10-05T18:56:11+0000\", \"link\": \"https://www.facebook.com/app_scoped_user_id/1275862949105912/\", \"timezone\": 5.5, \"id\": \"1275862949105912\"}',25),(22,'facebook','10207606900880874','2015-10-13 12:47:41','2015-10-13 12:47:41','{\"first_name\": \"Taneea\", \"last_name\": \"Agrawaal\", \"verified\": true, \"name\": \"Taneea S Agrawaal\", \"locale\": \"en_US\", \"gender\": \"female\", \"updated_time\": \"2015-09-10T11:06:33+0000\", \"link\": \"https://www.facebook.com/app_scoped_user_id/10207606900880874/\", \"timezone\": 5.5, \"id\": \"10207606900880874\"}',26);
/*!40000 ALTER TABLE `socialaccount_socialaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp`
--

DROP TABLE IF EXISTS `socialaccount_socialapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialaccount_socialapp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  `client_id` varchar(100) NOT NULL,
  `secret` varchar(100) NOT NULL,
  `key` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp`
--

LOCK TABLES `socialaccount_socialapp` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp` DISABLE KEYS */;
INSERT INTO `socialaccount_socialapp` VALUES (1,'facebook','WORX','514013832097569','38c402a592920a570767fee0db961d9e',''),(2,'google','worx','473462764642-io4crd8o6okpspkh9koc2n0rldtq5ifo.apps.googleusercontent.com','DIdrWs7qzFHCaU5dfAyRKhQx','');
/*!40000 ALTER TABLE `socialaccount_socialapp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp_sites`
--

DROP TABLE IF EXISTS `socialaccount_socialapp_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialaccount_socialapp_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `socialapp_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialapp_id` (`socialapp_id`,`site_id`),
  KEY `socialaccount_socialap_site_id_a859406a22be3fe_fk_django_site_id` (`site_id`),
  CONSTRAINT `socialaccount_socialap_site_id_a859406a22be3fe_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`),
  CONSTRAINT `soci_socialapp_id_7b02380b6127b1b8_fk_socialaccount_socialapp_id` FOREIGN KEY (`socialapp_id`) REFERENCES `socialaccount_socialapp` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp_sites`
--

LOCK TABLES `socialaccount_socialapp_sites` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` DISABLE KEYS */;
INSERT INTO `socialaccount_socialapp_sites` VALUES (1,1,1),(2,2,1);
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialtoken`
--

DROP TABLE IF EXISTS `socialaccount_socialtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialaccount_socialtoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` longtext NOT NULL,
  `token_secret` longtext NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialtoken_app_id_697928748c2e1968_uniq` (`app_id`,`account_id`),
  KEY `so_account_id_3fc809e243dd8c0a_fk_socialaccount_socialaccount_id` (`account_id`),
  CONSTRAINT `socialaccou_app_id_2125549785bd662_fk_socialaccount_socialapp_id` FOREIGN KEY (`app_id`) REFERENCES `socialaccount_socialapp` (`id`),
  CONSTRAINT `so_account_id_3fc809e243dd8c0a_fk_socialaccount_socialaccount_id` FOREIGN KEY (`account_id`) REFERENCES `socialaccount_socialaccount` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialtoken`
--

LOCK TABLES `socialaccount_socialtoken` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialtoken` DISABLE KEYS */;
INSERT INTO `socialaccount_socialtoken` VALUES (1,'CAAHTfivfLyEBAPOscBNdu5AEE5vHaTcWeR9RsjyCn6h05clJIfK3ZADbi7leBhYMyahQ2ncHcREW654TCEBH4qBVXNTy9iPZBk8fh1CQPzSbP35BKHrolFRFbAr0tkGJs8lChNEvHTNX8qVvQZCcUSlW6jhr8ZCBC3eNS44JiCHynIABheKpWgRjIdGLaHWiRCN1lNFNOQZDZD','',NULL,1,1),(2,'ya29.5gFQ344xhida0fJxTYW7qObOtvNCRw0CGAsSHY_lxhtRQvAq3FHxSXPCCoK4ndw540csrA','','2015-09-06 09:14:27',2,2),(3,'CAAHTfivfLyEBAKWiWiTSXWMDxViUp7YZBLTLGrR3hvriwpJLOjBAG6s4lRWQAFiTXI3X7zzNGjRa1j8HDqeQj4FcxSnHSkg1BQTyUp0Ut0OGXf4C5LwMyXemUeGcvrhshIqfD2DLVbrQpdlyZCvw4LVapSdZB5rnnuXZAxEmGkOZCZBU7Urs16hslRLIakUsEkvtZBGuRlHAwZDZD','',NULL,3,1),(4,'ya29.3gE5H9G6tK78D6EtOWRNLjARMtKZ1lFJwQjRJl2YI5hptwtQIeSzo04CK3u875OR3hkn','','2015-08-29 10:17:48',4,2),(5,'CAAHTfivfLyEBAKXf3yp97sDexxZCYvcELB72s8qFzSgSjQssC2Ks0G6uFZC7Sht1jB3feHZAqwHGDston8fZCRJng3sYJANimBYt0XsJR8JHFb72gKxxsFcpKbH73xss17Sq27ZCDWAwL6vbUrezhqd8C36hmIcZAqT2fXl5sLDCk9OiQOTs1xSkYBpfdf36gCkAE8U2KJHwZDZD','',NULL,5,1),(6,'CAAHTfivfLyEBAPw3eCX90uWBFs5hGNktde5I3snoMnDpsm0ZB3KuLHg9cI1RSvby718US8TeW7r5R6eFlNxYWwOW2XccoUewsD2yTnL9vT7Sh6vpImAyAOfusIUYG6WLdkhBrweSqXLyGmc66dlxZAhLeBqxyyIVQVdpSHay23q3gK7ZBe2lubwnV5hRF3ZATm9bNFyRMQZDZD','',NULL,6,1),(7,'CAAHTfivfLyEBAFj6CLZBwSE3252ZAV8AX3Y5Hh06Gff3rcncIZBp1gL3Hq5jCrSeuC7X8FTMlIgZAOzUKFbc127Q2M7xLwWIZBYMsgQtONaSA3w4lZB9pAPwtKGzrbZC7LZCkrzFBBfEEyd8WZAHxlEVMcgxrw9O2gZCzWvkstf1nSsSN2NppRXxGsnar5TLMWaEkZD','',NULL,7,1),(8,'ya29.4gFaYqnuK78lzySw8TUCYldKQdykJavZqraWOnJQRE0Dk-wG2u6BJ-f9DvsbPV8mIizi','','2015-09-02 17:54:09',8,2),(9,'ya29.4gHbPsa2PNbQxDevikgNSkMM444LUOhiI5Gv-S0H-dH8spKcmUnWhhcZfipgcR11ow9t','','2015-09-02 18:01:53',9,2),(10,'CAAHTfivfLyEBAJSDBhAVaDzSdMQZCIFLQVNMnwYyR6B92raBbwwFzyqWxCxMbnJ2c8JJC3Wf9itwCpwIgbeDXuDob7dvlW6ksxbOtlWcLAN5iqwTsGPeX62ZBFIIag9vRWXzpiRSl7ag4bnvQUois6Wr3UnIgHepxgJRY0izr1ZB0weJZABwpHEKWHpACld1wc9izGU4ZAwZDZD','',NULL,10,1),(11,'CAAHTfivfLyEBAKB5VD4hALVdPxKap8gDUIHh6ntb0vnUX3tPzfeOfKOCtfxeoxKd48aZBU9HtARfK7i6dHJgP9iXqiNywYZCEPEO6tt0YvOmFeKN6uqlFBA3NJYgqCetfZCHkHsv797DnoH1s9bb2TDjUsVYEVQ9HsTAZCFRdcGNdOZCU02j1v7ywIjhL7OgXOY5DbxUmiQZDZD','',NULL,11,1),(12,'CAAHTfivfLyEBAKwNRXKaZARwx4NVSbVtRKZBka9sSbVAheyxIAry4yZAZB9Y2UUo5pN0rPZBZC7eoLhfmX4GMHvZBb5qOhIhZCJsKebZCjcQBayYxuW07nb8jN7Dni4ZAgxIgyZA21YCGP5O6myWEMrogOMyXzHT4gdyFoieQH7eup9Gb4x3yvtw5ynF5oTkW8IgHEZD','',NULL,12,1),(13,'CAAHTfivfLyEBAGhFIFiufufblSwFWx3xQdZC45uu093FkZBiIQZBoRjITE20tPxcCJTPDHOZBFXiHEZChweQaZA80GtnxV991UY8BZCNDjRMjaw9W8p9RE6TXr23D0PVR9XnDXGEEY9kWv84ZAmLM367exT5buyuUADWKhMcBTOnCMBxBw5ZBhcORE5dGyzrximEZD','',NULL,13,1),(14,'ya29._gF_DpFwzuxWxFkmM-Fdunf6gO5KwTFCOZ7p5l3AddXOJm8fD4C4XILFNt364jW0z-YTez4','','2015-09-30 19:59:57',14,2),(15,'ya29._QFvIRCfvYfHx9amWZazM3S8q4LlJrQVZ5U1WDSUS8Uhu0oHu1WwFeClERdkALYxenON','','2015-09-29 10:08:35',15,2),(16,'CAAHTfivfLyEBAPOo6gTG6xTjlNBStKNmUcdFR49MpVrPucBZBZBwUpXewh5haO6FpQMRwdnhMr2UraOYIfEqAs7HOuQx4RwG7S0FkHhDnYDhfmD29SoPsHsTo2YX7GKWxZCKY4AmCvHsJquf9H3Fy16FtgEYKqdll9vZAI0Jv5WedMcENZBd8CYIEMH6ZAf2WpLObX9xajjAZDZD','',NULL,16,1),(17,'CAAHTfivfLyEBAAuZCbwegueYNo7Gv0MQRYILxoZAwsKdZBDNDoLGWEfDTBv1PZB7qgfJIGziLofMqbhFtb15u3y2R0gXR6vWaRLtpGlkbUuEAjakUA5BGoXlnHuzOLWqvRpR9sPZCPK6I1tEZCEe5TCYU2XJCXuHhPv4q48lRj5VEuZCFB8tNHg8H8JttBZCYUX5ZBc7ZBjrWidQZDZD','',NULL,17,1),(18,'CAAHTfivfLyEBAAQLJJa6iaNYpQxLTLZBnXBRPNRCqmM1VwpXeQeRWXweQtvHrae3UuvNBpNUPNr0t1xqVHUSiSRbJSU2NGpRKGfU7ZBjKlZAtXB5RQK7t3JUsZCk6BkZCR4A7KU1AhZByZA9gP8cWVJkkFJwJCKqAbpXflf9XjkYNolJkEyxpZBCZBxDWIrl2eugp1x9Eiva7gQZDZD','',NULL,18,1),(19,'ya29.CgIHCm6f2Vmp3iCnF5NPxuHg9Qr4uef1S_7m93LilAyTvqLUBzWVdSbb7sI3Fge5PI6F','','2015-10-12 23:00:47',19,2),(20,'ya29.CwIl4Bh_RLcc6z1qvGNBHT_1sV5thwhsF6UQTX0uqIMqE-GdOMJ3V_rDBjmlZ8Vw8rhU','','2015-10-13 06:27:06',20,2),(21,'CAAHTfivfLyEBAGAdbbI36aJw6xeIL2ArSMVIqkGrYoWZBbsubuzGKw6oP4DfqZCqgUw8TjTRLJmuR2iG1wOV57mRarl31e6IfatDQZBqkp0dhvtYZBRmA96emapzjrDtgnhUgVEtnm3YZBq6DNMBtVsXfGLzJaZAYQKYbAefH4fuiWtZBFH8ZBxgwFCMkVqTx2oZD','',NULL,21,1),(22,'CAAHTfivfLyEBAN2F5ZCTsu7jmTMaE5BowAkKIfXGZCmJOoZBcShbprAIB11Te8DjDVCDPS3WXOxDyEEzRMrjWOmRhi2m3qYx6GVq3oWZCN5Vp3NHDDnji0uWwC7Qz49j7EI9TXuRjIQ0QN2DDLclVPsjee2hzgZAnBb8TJl4tI8MrV4NUXwyKrHum7mtqivMZD','',NULL,22,1);
/*!40000 ALTER TABLE `socialaccount_socialtoken` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-10-14  7:06:03
