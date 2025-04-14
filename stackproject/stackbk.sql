-- MySQL dump 10.13  Distrib 9.2.0, for macos13.7 (x86_64)
--
-- Host: localhost    Database: stack_overflow_db
-- ------------------------------------------------------
-- Server version	9.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add pregunta',7,'add_pregunta'),(26,'Can change pregunta',7,'change_pregunta'),(27,'Can delete pregunta',7,'delete_pregunta'),(28,'Can view pregunta',7,'view_pregunta'),(29,'Can add respuesta',8,'add_respuesta'),(30,'Can change respuesta',8,'change_respuesta'),(31,'Can delete respuesta',8,'delete_respuesta'),(32,'Can view respuesta',8,'view_respuesta'),(33,'Can add profile',9,'add_profile'),(34,'Can change profile',9,'change_profile'),(35,'Can delete profile',9,'delete_profile'),(36,'Can view profile',9,'view_profile');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$1000000$6xXlAlOklwAtN38gjwrWGm$clrq2OrDP3qwJuukdumPryk4UAkDSP4wElc+2P1oXPg=',NULL,1,'at','','','altmzg@gmail.com',1,1,'2025-04-13 19:06:59.511114'),(2,'pbkdf2_sha256$1000000$C0Tg4VjSo5NSoRRciOpd5O$zuKUlKwPfhkoYaTzMSbMXEapmVCxDJyjWCB9Z9oY25I=','2025-04-13 23:49:39.182026',0,'tester1','','','tester1@no.novalido.com',0,1,'2025-04-13 21:31:29.305440'),(3,'pbkdf2_sha256$1000000$noM03ZBM9Z5wsRTOA1FRWT$g7grpZZk9jceRXnyfb1MfUkgMFJ7q532azYRijqhXTE=','2025-04-14 15:50:35.700781',0,'tester2','','','tester2@ho.ho.ho',0,1,'2025-04-13 23:59:09.043803');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(7,'stack_core','pregunta'),(8,'stack_core','respuesta'),(9,'stack_users','profile');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-04-13 19:05:42.811598'),(2,'auth','0001_initial','2025-04-13 19:05:43.054501'),(3,'admin','0001_initial','2025-04-13 19:05:43.129646'),(4,'admin','0002_logentry_remove_auto_add','2025-04-13 19:05:43.136788'),(5,'admin','0003_logentry_add_action_flag_choices','2025-04-13 19:05:43.144744'),(6,'contenttypes','0002_remove_content_type_name','2025-04-13 19:05:43.191998'),(7,'auth','0002_alter_permission_name_max_length','2025-04-13 19:05:43.221062'),(8,'auth','0003_alter_user_email_max_length','2025-04-13 19:05:43.239116'),(9,'auth','0004_alter_user_username_opts','2025-04-13 19:05:43.246042'),(10,'auth','0005_alter_user_last_login_null','2025-04-13 19:05:43.272956'),(11,'auth','0006_require_contenttypes_0002','2025-04-13 19:05:43.274399'),(12,'auth','0007_alter_validators_add_error_messages','2025-04-13 19:05:43.281699'),(13,'auth','0008_alter_user_username_max_length','2025-04-13 19:05:43.314797'),(14,'auth','0009_alter_user_last_name_max_length','2025-04-13 19:05:43.347801'),(15,'auth','0010_alter_group_name_max_length','2025-04-13 19:05:43.363566'),(16,'auth','0011_update_proxy_permissions','2025-04-13 19:05:43.371972'),(17,'auth','0012_alter_user_first_name_max_length','2025-04-13 19:05:43.404428'),(18,'sessions','0001_initial','2025-04-13 19:05:43.420401'),(19,'stack_core','0001_initial','2025-04-13 19:05:43.520631'),(20,'stack_users','0001_initial','2025-04-13 19:05:43.560154');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1d7723h6pp0hazs85uafiz5tw3815bfr','.eJxVjDsOwjAQBe_iGlnrX9ampOcMltcfHEC2FCcV4u4QKQW0b2bei_mwrdVvIy9-TuzMFDv9bhTiI7cdpHtot85jb-syE98VftDBrz3l5-Vw_w5qGPVbT9ZiiUEZAAUOIOpiMAtK0SlXnCV0aKScUBfMyUhLIgsNiZwQJmjJ3h_D2Dbw:1u47It:GjVV80XxJdAIJMYngSg208RZ1QzoBI5BQEPOL3iDT7I','2025-04-28 00:03:59.546979'),('mtd7che6422narun19kfn6dkqtv25h8i','.eJxVjMEOwiAQBf-FsyGwLFA8evcbCLAgVQNJaU_Gf9cmPej1zcx7MR-2tfpt5MXPxM4M2Ol3iyE9ctsB3UO7dZ56W5c58l3hBx382ik_L4f7d1DDqN9ag4zRkU1oUGrSwlIqQgnIBgGkATs5lFDAQCzoZFFFgZUqB5ctTsDeH7cKNoA:1u45R9:hVq7M-KesiMbG8GVGrqVpKgcF0h3mLJQ9ByO9tnjTCc','2025-04-27 22:04:23.813433'),('ogluemfd67932fhl2oje408qvuawbe5n','.eJxVjDsOwjAQBe_iGlnrX9ampOcMltcfHEC2FCcV4u4QKQW0b2bei_mwrdVvIy9-TuzMFDv9bhTiI7cdpHtot85jb-syE98VftDBrz3l5-Vw_w5qGPVbT9ZiiUEZAAUOIOpiMAtK0SlXnCV0aKScUBfMyUhLIgsNiZwQJmjJ3h_D2Dbw:1u4M4x:lCbohU0zt9F6t6iMZZz4YoScanoezJwjWf5ucRDoJn0','2025-04-28 15:50:35.702758');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stack_core_pregunta`
--

DROP TABLE IF EXISTS `stack_core_pregunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stack_core_pregunta` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cuerpo` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `creada` datetime(6) NOT NULL,
  `autor_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `stack_core_pregunta_autor_id_e83223a4_fk_auth_user_id` (`autor_id`),
  CONSTRAINT `stack_core_pregunta_autor_id_e83223a4_fk_auth_user_id` FOREIGN KEY (`autor_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stack_core_pregunta`
--

LOCK TABLES `stack_core_pregunta` WRITE;
/*!40000 ALTER TABLE `stack_core_pregunta` DISABLE KEYS */;
INSERT INTO `stack_core_pregunta` VALUES (1,'pregunta 1','hola es la pregunta 1','2025-04-13 22:04:50.813600',2),(2,'2','2','2025-04-13 23:44:45.076136',2),(3,'Debe haber más ambientes que UAT?','Deberían existir más ambientes de pruebas que UAT, algunos dicen que si, para poder integrar cosas en diferentes niveles y sprint, pero luego otros opinan que no porque esos esfuerzos luego hay que integrarlos en un solo ambiente y por lo general falla','2025-04-13 23:51:28.979678',2),(4,'Python o Ruby para automatizar','Cual es mejor para automatizar pruebas de software?','2025-04-14 00:13:03.768904',3),(5,'Que es  REST en API?','no entiendo que es REST?','2025-04-14 00:14:53.532449',3),(6,'paso de moda Ensamblador?','paso de moda Ensamblador?\r\n\r\nes un lenguaje muy antiguo, para que se usa?','2025-04-14 00:15:29.307717',3);
/*!40000 ALTER TABLE `stack_core_pregunta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stack_core_respuesta`
--

DROP TABLE IF EXISTS `stack_core_respuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stack_core_respuesta` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cuerpo` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `creada` datetime(6) NOT NULL,
  `autor_id` int NOT NULL,
  `pregunta_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `stack_core_respuesta_autor_id_c064f9a1_fk_auth_user_id` (`autor_id`),
  KEY `stack_core_respuesta_pregunta_id_d55d1dd2_fk_stack_cor` (`pregunta_id`),
  CONSTRAINT `stack_core_respuesta_autor_id_c064f9a1_fk_auth_user_id` FOREIGN KEY (`autor_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `stack_core_respuesta_pregunta_id_d55d1dd2_fk_stack_cor` FOREIGN KEY (`pregunta_id`) REFERENCES `stack_core_pregunta` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stack_core_respuesta`
--

LOCK TABLES `stack_core_respuesta` WRITE;
/*!40000 ALTER TABLE `stack_core_respuesta` DISABLE KEYS */;
INSERT INTO `stack_core_respuesta` VALUES (1,'nmo lo sè','2025-04-13 22:04:58.666985',2,1),(2,'hola 2','2025-04-13 22:05:11.213109',2,1),(3,'si, debe haber varios y si hay dependencias entre el desarrollo deben considerarse','2025-04-13 23:51:56.171673',2,3),(4,'creo que no debe haber mas que un solo ambiente','2025-04-13 23:59:58.513924',3,3),(5,'depende de que vas a probar? web, moviles?','2025-04-14 00:13:18.086031',3,4);
/*!40000 ALTER TABLE `stack_core_respuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stack_users_profile`
--

DROP TABLE IF EXISTS `stack_users_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stack_users_profile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `bio` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_picture` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `stack_users_profile_user_id_12e37e42_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stack_users_profile`
--

LOCK TABLES `stack_users_profile` WRITE;
/*!40000 ALTER TABLE `stack_users_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `stack_users_profile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-14 10:23:30
