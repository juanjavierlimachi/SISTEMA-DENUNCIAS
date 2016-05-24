-- MySQL dump 10.13  Distrib 5.6.25, for Win32 (x86)
--
-- Host: localhost    Database: denuncia
-- ------------------------------------------------------
-- Server version	5.6.25

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_0e939a4f` (`group_id`),
  KEY `auth_group_permissions_8373b171` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_58c48ba9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_417f1b1c` (`content_type_id`),
  CONSTRAINT `auth_permissi_content_type_id_51277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add user social auth',7,'add_usersocialauth'),(20,'Can change user social auth',7,'change_usersocialauth'),(21,'Can delete user social auth',7,'delete_usersocialauth'),(22,'Can add nonce',8,'add_nonce'),(23,'Can change nonce',8,'change_nonce'),(24,'Can delete nonce',8,'delete_nonce'),(25,'Can add association',9,'add_association'),(26,'Can change association',9,'change_association'),(27,'Can delete association',9,'delete_association'),(28,'Can add code',10,'add_code'),(29,'Can change code',10,'change_code'),(30,'Can delete code',10,'delete_code'),(31,'Can add cronograma',11,'add_cronograma'),(32,'Can change cronograma',11,'change_cronograma'),(33,'Can delete cronograma',11,'delete_cronograma'),(34,'Can add perfiles',12,'add_perfiles'),(35,'Can change perfiles',12,'change_perfiles'),(36,'Can delete perfiles',12,'delete_perfiles'),(37,'Can add comment',13,'add_comment'),(38,'Can change comment',13,'change_comment'),(39,'Can delete comment',13,'delete_comment'),(40,'Can add categoria',14,'add_categoria'),(41,'Can change categoria',14,'change_categoria'),(42,'Can delete categoria',14,'delete_categoria'),(43,'Can add negocio',15,'add_negocio'),(44,'Can change negocio',15,'change_negocio'),(45,'Can delete negocio',15,'delete_negocio'),(46,'Can add multa',16,'add_multa'),(47,'Can change multa',16,'change_multa'),(48,'Can delete multa',16,'delete_multa'),(49,'Can add seguimiento',17,'add_seguimiento'),(50,'Can change seguimiento',17,'change_seguimiento'),(51,'Can delete seguimiento',17,'delete_seguimiento'),(52,'Can add cobro',18,'add_cobro'),(53,'Can change cobro',18,'change_cobro'),(54,'Can delete cobro',18,'delete_cobro'),(55,'Can add cambios notificaciones',19,'add_cambiosnotificaciones'),(56,'Can change cambios notificaciones',19,'change_cambiosnotificaciones'),(57,'Can delete cambios notificaciones',19,'delete_cambiosnotificaciones'),(58,'Can add update notificaciones',20,'add_updatenotificaciones'),(59,'Can change update notificaciones',20,'change_updatenotificaciones'),(60,'Can delete update notificaciones',20,'delete_updatenotificaciones');
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
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$12000$hCN4j19irvcN$50uB7cQo/b6XASvPWdHBfuvlQ8TXoI2mnHkhAC3O2A8=','2016-04-05 18:49:42',1,'juan','Juan Javier','Limachi','sistemasuatf12345@gmail.com',1,1,'2015-10-30 20:19:56'),(2,'pbkdf2_sha256$12000$R1q2ZsJtitSB$kxIdc9Cy6PGWzdwLY2uqZlT3YLLZRVoDLhK4hw0L800=','2016-04-06 00:21:17',0,'javier','Juan Javier','limachi','',1,1,'2015-10-31 13:26:03'),(3,'pbkdf2_sha256$12000$NM7HsIhCogYt$nzKNdQ27yefWEWUpk/iQWTN4PtNxk1F8r4/Fw71UUL4=','2015-12-11 12:56:04',0,'edy','edy','edy','',0,0,'2015-11-05 14:22:17'),(4,'!MUNsBVZQKqlTT09uiz5EWUaOUotphJ8jDymrLtfE','2016-02-20 18:48:14',0,'JuanJavierLimachi','Juan','Javier Limachi','',0,1,'2015-12-16 07:40:40'),(5,'!hXRdfeumchYmXAcu6cfPhSWRf4bQlJdr4TvYfk5z','2015-12-17 04:07:14',0,'FernandoChoque','Fernando','Choque','',0,1,'2015-12-17 04:07:14');
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
  KEY `auth_user_groups_e8701ad4` (`user_id`),
  KEY `auth_user_groups_0e939a4f` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_30a071c9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_24702650_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_e8701ad4` (`user_id`),
  KEY `auth_user_user_permissions_8373b171` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_7cd7acb6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_comment`
--

DROP TABLE IF EXISTS `cliente_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(50) NOT NULL,
  `fecha_denuncia` datetime NOT NULL,
  `Tipo_de_peticion` varchar(100) DEFAULT NULL,
  `idNegocio` int(11) DEFAULT NULL,
  `comment` longtext,
  `idUser` int(11) DEFAULT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_comment`
--

LOCK TABLES `cliente_comment` WRITE;
/*!40000 ALTER TABLE `cliente_comment` DISABLE KEYS */;
INSERT INTO `cliente_comment` VALUES (2,'JuanJavierLimachi','2015-12-16 07:42:08','Licencia vencida',22,'Tiene la Licencia Caducada por favor mas Atención',4,1),(3,'JuanJavierLimachi','2015-12-17 03:54:54','Falta de Higiene',19,'Esta Mañana ví mucho falta de higiene en el marcado uyuni po favor controlar el lugar',4,1),(4,'FernandoChoque','2015-12-17 04:08:59','Maltratos',2,'Maltratos a los clientes hoy en día',5,1),(5,'JuanJavierLimachi','2016-02-20 18:22:06','Horario No Establecido',19,'Exdese De lás horas en las mañanas ',4,1),(6,'javier','2016-01-04 04:42:20','Maltratos',25,'nuovas denucnias intendente',2,1),(7,'juan','2016-01-25 05:23:42','Horario No Establecido',19,'Nueva denuncia alcalde',1,1),(8,'JuanJavierLimachi','2016-02-20 19:23:00','Horario No Establecido',2,'los horarios de deveriam ser an horas de la noche en este negocio',4,1),(9,'javier','2016-02-21 04:57:07','Denuncia por corrupcion',24,'Un nuevo negocio en en vencimineto',2,1);
/*!40000 ALTER TABLE `cliente_comment` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TriggersDenuncia` AFTER UPDATE ON `cliente_comment` FOR EACH ROW INSERT INTO usuario_cambiosnotificaciones 
(usuario, descripcion) 
VALUES (user( ), 
CONCAT('Se modificó el registro ','(',
OLD.User,',', OLD.fecha_denuncia,',',OLD.Tipo_de_peticion,',',
OLD.idNegocio,',',OLD.idUser,',', OLD.comment,') por ',
'(', NEW.User,',',NEW.fecha_denuncia,',', NEW.Tipo_de_peticion,',',NEW.idNegocio,',',
NEW.idUser,',', NEW.comment,')')) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `DeleteDenuncias` BEFORE DELETE ON `cliente_comment` FOR EACH ROW INSERT INTO usuario_cambiosnotificaciones 
(usuario, descripcion) 
VALUES (user( ), 
CONCAT('Se Elimino el registro ','(',
OLD.User,',', OLD.fecha_denuncia,',',OLD.Tipo_de_peticion,',',
OLD.idNegocio,',',OLD.idUser,',', OLD.comment,')')) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
  KEY `django_admin_log_417f1b1c` (`content_type_id`),
  KEY `django_admin_log_e8701ad4` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_5151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_1c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=260 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2015-10-31 13:55:23','2','juan',1,'',12,1),(2,'2015-11-04 05:32:34','2','juan',3,'',13,1),(3,'2015-11-15 05:16:33','4','edyy',3,'',4,1),(4,'2015-11-15 05:16:33','5','edyyy',3,'',4,1),(5,'2015-11-15 05:16:33','6','FernandoChoque',3,'',4,1),(6,'2015-11-15 05:16:33','7','JuanJavierLimachi',3,'',4,1),(7,'2015-11-15 05:17:14','12','javier',3,'',17,1),(8,'2015-11-15 05:17:14','7','javier',3,'',17,1),(9,'2015-11-15 05:17:14','6','javier',3,'',17,1),(10,'2015-11-15 05:17:14','5','javier',3,'',17,1),(11,'2015-11-15 05:17:15','4','javier',3,'',17,1),(12,'2015-11-15 05:17:15','3','javier',3,'',17,1),(13,'2015-11-15 05:17:15','2','javier',3,'',17,1),(14,'2015-11-15 05:17:15','1','javier',3,'',17,1),(15,'2015-11-15 05:25:15','8','JuanJavierLimachi',3,'',4,1),(16,'2015-11-15 05:36:34','9','JuanJavierLimachi',3,'',4,1),(17,'2015-11-15 05:37:44','11','JuanJavierLimachi',3,'',4,1),(18,'2015-11-15 05:39:13','12','JuanJavierLimachi',3,'',4,1),(19,'2015-11-15 05:45:55','13','JuanJavierLimachi',3,'',4,1),(20,'2015-11-15 05:49:33','14','JuanJavierLimachi',3,'',4,1),(21,'2015-11-15 06:05:53','15','JuanJavierLimachi',3,'',4,1),(22,'2015-11-15 06:24:48','16','JuanJavierLimachi',2,'Modificado/a is_staff.',4,1),(23,'2015-11-15 06:39:54','16','JuanJavierLimachi',3,'',4,1),(24,'2015-11-15 06:45:00','10','FernandoChoque',3,'',4,1),(25,'2015-11-15 06:45:00','17','JuanJavierLimachi',3,'',4,1),(26,'2015-11-15 06:54:58','18','JuanJavierLimachi',3,'',4,1),(27,'2015-11-15 16:27:38','19','FernandoChoque',3,'',4,1),(28,'2015-11-15 16:27:38','20','JuanJavierLimachi',3,'',4,1),(29,'2015-11-15 16:28:27','15','juan',3,'',17,1),(30,'2015-11-15 16:28:28','14','juan',3,'',17,1),(31,'2015-11-15 16:28:28','13','javier',3,'',17,1),(32,'2015-11-15 17:47:24','21','JuanJavierLimachi',3,'',4,1),(33,'2015-11-15 17:58:11','22','JuanJavierLimachi',3,'',4,1),(34,'2015-11-15 18:06:36','23','JuanJavierLimachi',3,'',4,1),(35,'2015-11-15 18:08:30','24','JuanJavierLimachi',3,'',4,1),(36,'2015-11-15 20:12:23','25','JuanJavierLimachi',3,'',4,1),(37,'2015-11-20 02:39:27','16','juan',3,'',13,1),(38,'2015-11-20 02:39:27','15','javier',3,'',13,1),(39,'2015-11-20 02:39:27','14','juan',3,'',13,1),(40,'2015-11-20 02:39:27','13','JuanJavierLimachi',3,'',13,1),(41,'2015-11-20 02:39:27','12','JuanJavierLimachi',3,'',13,1),(42,'2015-11-20 02:39:27','11','JuanJavierLimachi',3,'',13,1),(43,'2015-11-20 02:39:27','10','JuanJavierLimachi',3,'',13,1),(44,'2015-11-20 02:39:27','9','FernandoChoque',3,'',13,1),(45,'2015-11-20 02:39:27','8','FernandoChoque',3,'',13,1),(46,'2015-11-20 02:39:27','7','FernandoChoque',3,'',13,1),(47,'2015-11-20 02:39:28','6','javier',3,'',13,1),(48,'2015-11-20 02:39:28','5','javier',3,'',13,1),(49,'2015-11-20 02:39:28','4','juan',3,'',13,1),(50,'2015-11-20 02:39:28','3','javier',3,'',13,1),(51,'2015-11-20 02:39:50','3','javier',3,'',18,1),(52,'2015-11-20 02:39:50','2','javier',3,'',18,1),(53,'2015-11-20 02:39:50','1','javier',3,'',18,1),(54,'2015-11-20 02:40:04','11','javier',3,'',16,1),(55,'2015-11-20 02:40:04','10','javier',3,'',16,1),(56,'2015-11-20 02:40:04','9','javier',3,'',16,1),(57,'2015-11-20 02:40:04','8','javier',3,'',16,1),(58,'2015-11-20 02:40:04','7','javier',3,'',16,1),(59,'2015-11-20 02:40:04','6','javier',3,'',16,1),(60,'2015-11-20 02:40:04','5','javier',3,'',16,1),(61,'2015-11-20 02:40:04','4','javier',3,'',16,1),(62,'2015-11-20 02:40:04','2','juan',3,'',16,1),(63,'2015-11-20 02:40:24','1','javier',3,'',17,1),(64,'2015-11-20 02:58:57','2','Ramirez',2,'Modificado/a estadoN.',15,1),(65,'2015-11-20 03:00:20','2','Ramirez',2,'Modificado/a estadoN.',15,1),(66,'2015-11-20 03:15:10','20','juan',3,'',13,1),(67,'2015-11-20 03:15:10','19','juan',3,'',13,1),(68,'2015-11-20 03:15:10','18','javier',3,'',13,1),(69,'2015-11-20 03:15:10','17','FernandoChoque',3,'',13,1),(70,'2015-11-20 03:18:38','21','FernandoChoque',3,'',13,1),(71,'2015-11-20 03:21:29','22','javier',3,'',13,1),(72,'2015-11-20 03:24:49','23','FernandoChoque',3,'',13,1),(73,'2015-11-20 03:25:12','2','Ramirez',2,'Modificado/a estadoN y estadoD.',15,1),(74,'2015-11-20 03:31:07','25','FernandoChoque',3,'',13,1),(75,'2015-11-20 03:31:07','24','FernandoChoque',3,'',13,1),(76,'2015-11-20 03:31:31','2','Ramirez',2,'Modificado/a estadoD.',15,1),(77,'2015-11-20 03:36:26','13','javier',3,'',16,1),(78,'2015-11-20 03:36:26','12','javier',3,'',16,1),(79,'2015-11-20 03:37:46','2','Ramirez',2,'Modificado/a estadoN.',15,1),(80,'2015-11-20 03:42:59','15','javier',3,'',16,1),(81,'2015-11-20 03:42:59','14','javier',3,'',16,1),(82,'2015-11-20 03:45:42','16','javier',3,'',16,1),(83,'2015-11-20 03:46:01','26','FernandoChoque',3,'',13,1),(84,'2015-11-20 04:32:31','28','FernandoChoque',3,'',13,1),(85,'2015-11-20 04:32:31','27','FernandoChoque',3,'',13,1),(86,'2015-11-20 04:56:01','35','juan',3,'',13,1),(87,'2015-11-20 04:56:01','34','javier',3,'',13,1),(88,'2015-11-20 04:56:01','33','FernandoChoque',3,'',13,1),(89,'2015-11-20 04:56:01','32','FernandoChoque',3,'',13,1),(90,'2015-11-20 04:56:01','31','javier',3,'',13,1),(91,'2015-11-20 04:56:02','30','javier',3,'',13,1),(92,'2015-11-20 04:56:02','29','FernandoChoque',3,'',13,1),(93,'2015-11-20 04:56:17','19','juan',3,'',16,1),(94,'2015-11-20 04:56:17','18','javier',3,'',16,1),(95,'2015-11-20 04:56:17','17','javier',3,'',16,1),(96,'2015-11-20 05:03:11','21','javier',3,'',16,1),(97,'2015-11-20 05:03:11','20','javier',3,'',16,1),(98,'2015-11-20 05:59:21','2','Ramirez',2,'Modificado/a estadoN.',15,1),(99,'2015-11-20 06:08:39','2','Ramirez',2,'Modificado/a estadoN.',15,1),(100,'2015-11-20 06:12:36','2','Ramirez',2,'Modificado/a estadoN.',15,1),(101,'2015-11-20 06:44:02','35','javier',3,'',16,1),(102,'2015-11-20 06:44:02','34','javier',3,'',16,1),(103,'2015-11-20 06:44:02','33','javier',3,'',16,1),(104,'2015-11-20 06:44:02','32','javier',3,'',16,1),(105,'2015-11-20 06:44:02','31','javier',3,'',16,1),(106,'2015-11-20 06:44:02','30','javier',3,'',16,1),(107,'2015-11-20 06:44:02','29','javier',3,'',16,1),(108,'2015-11-20 06:44:02','28','javier',3,'',16,1),(109,'2015-11-20 06:44:03','27','javier',3,'',16,1),(110,'2015-11-20 06:44:03','26','javier',3,'',16,1),(111,'2015-11-20 06:44:03','25','javier',3,'',16,1),(112,'2015-11-20 06:44:03','24','javier',3,'',16,1),(113,'2015-11-20 06:44:03','23','javier',3,'',16,1),(114,'2015-11-20 06:44:03','22','javier',3,'',16,1),(115,'2015-11-20 06:44:10','37','javier',3,'',16,1),(116,'2015-11-20 06:44:10','36','javier',3,'',16,1),(117,'2015-11-20 06:44:33','2','Ramirez',2,'Modificado/a estadoN.',15,1),(118,'2015-11-20 07:20:08','4','javier',3,'',18,1),(119,'2015-11-20 07:21:40','5','javier',3,'',18,1),(120,'2015-11-21 06:19:39','3','Martinez',2,'Modificado/a estadoD.',15,1),(121,'2015-11-21 17:26:59','5','FernandoChoque',3,'',4,1),(122,'2015-11-21 17:26:59','4','JuanJavierLimachi',3,'',4,1),(123,'2015-11-21 17:29:44','6','FernandoChoque',3,'',4,1),(124,'2015-11-21 17:31:11','7','FernandoChoque',3,'',4,1),(125,'2015-11-21 17:39:53','8','FernandoChoque',3,'',4,1),(126,'2015-11-21 18:00:12','9','FernandoChoque',3,'',4,1),(127,'2015-11-21 18:03:21','10','FernandoChoque',3,'',4,1),(128,'2015-11-21 18:04:43','11','FernandoChoque',3,'',4,1),(129,'2015-11-21 18:07:27','12','FernandoChoque',3,'',4,1),(130,'2015-11-21 19:47:17','13','FernandoChoque',3,'',4,1),(131,'2015-11-21 19:52:51','14','FernandoChoque',3,'',4,1),(132,'2015-11-21 20:13:33','15','FernandoChoque',3,'',4,1),(133,'2015-11-22 20:54:34','2','javier',1,'',18,1),(134,'2015-11-22 20:57:05','2','javier',3,'',18,1),(135,'2015-11-22 21:27:22','4','jajajja',3,'',12,1),(136,'2015-11-22 21:28:50','5','jajajja',1,'',12,1),(137,'2015-11-22 21:29:00','5','jajajja',3,'',12,1),(138,'2015-11-22 21:29:10','18','jajajja',3,'',4,1),(139,'2015-11-23 00:05:16','1','jbjbjbjbjb ii',3,'',11,1),(140,'2015-11-28 01:59:03','16','FernandoChoque',3,'',4,1),(141,'2015-11-28 01:59:04','17','JuanJavierLimachi',3,'',4,1),(142,'2015-11-28 02:01:18','18','FernandoChoque',3,'',4,1),(143,'2015-12-01 04:11:04','4','kelos',3,'',15,1),(144,'2015-12-01 04:16:24','5','kelos',3,'',15,1),(145,'2015-12-01 04:23:13','7','lujos',3,'',15,1),(146,'2015-12-01 04:23:13','6','kelos',3,'',15,1),(147,'2015-12-01 04:56:08','9','lujos',3,'',15,1),(148,'2015-12-01 04:56:08','8','kelos',3,'',15,1),(149,'2015-12-01 04:57:19','10','kelos',3,'',15,1),(150,'2015-12-01 05:38:12','22','ALFARO',3,'',15,1),(151,'2015-12-01 05:38:12','21','ALBINO',3,'',15,1),(152,'2015-12-01 05:38:13','20','ALARCON',3,'',15,1),(153,'2015-12-01 05:38:13','19','AIZA',3,'',15,1),(154,'2015-12-01 05:38:13','18','ABASCAL',3,'',15,1),(155,'2015-12-01 05:38:13','16','ALFARO',3,'',15,1),(156,'2015-12-01 05:38:13','15','ALBINO',3,'',15,1),(157,'2015-12-01 05:38:13','14','ALARCON',3,'',15,1),(158,'2015-12-01 05:38:13','13','AIZA',3,'',15,1),(159,'2015-12-01 05:38:13','12','ABASCAL',3,'',15,1),(160,'2015-12-01 06:10:42','8','juan',3,'',17,1),(161,'2015-12-01 06:10:42','7','javier',3,'',17,1),(162,'2015-12-01 06:10:42','5','edy',3,'',17,1),(163,'2015-12-01 06:10:42','3','javier',3,'',17,1),(164,'2015-12-01 06:15:05','10','javier',3,'',17,1),(165,'2015-12-01 06:15:06','9','juan',3,'',17,1),(166,'2015-12-01 06:15:06','6','edy',3,'',17,1),(167,'2015-12-01 06:15:06','4','edy',3,'',17,1),(168,'2015-12-01 06:15:06','2','javier',3,'',17,1),(169,'2015-12-02 03:42:48','3','54454',2,'Modificado/a categoria.',14,1),(170,'2015-12-02 03:46:06','3','54454',3,'',14,1),(171,'2015-12-03 16:29:26','19','FernandoChoque',3,'',4,1),(172,'2015-12-03 16:29:27','20','JuanJavierLimachi',3,'',4,1),(173,'2015-12-09 04:03:39','16','root@localhost',3,'',20,1),(174,'2015-12-09 04:03:40','15','root@localhost',3,'',20,1),(175,'2015-12-09 04:03:40','14','root@localhost',3,'',20,1),(176,'2015-12-09 04:03:40','13','root@localhost',3,'',20,1),(177,'2015-12-09 04:03:40','12','root@localhost',3,'',20,1),(178,'2015-12-09 04:03:40','11','root@localhost',3,'',20,1),(179,'2015-12-09 04:03:40','10','root@localhost',3,'',20,1),(180,'2015-12-09 04:03:40','9','root@localhost',3,'',20,1),(181,'2015-12-09 04:03:40','8','root@localhost',3,'',20,1),(182,'2015-12-09 04:03:40','7','root@localhost',3,'',20,1),(183,'2015-12-09 04:03:40','6','root@localhost',3,'',20,1),(184,'2015-12-09 04:03:40','5','root@localhost',3,'',20,1),(185,'2015-12-09 04:03:40','4','root@localhost',3,'',20,1),(186,'2015-12-09 04:03:40','3','root@localhost',3,'',20,1),(187,'2015-12-09 04:03:40','2','root@localhost',3,'',20,1),(188,'2015-12-09 04:03:40','1','root@localhost',3,'',20,1),(189,'2015-12-09 04:03:55','9','root@localhost',3,'',19,1),(190,'2015-12-09 04:03:55','8','root@localhost',3,'',19,1),(191,'2015-12-09 04:03:55','7','root@localhost',3,'',19,1),(192,'2015-12-09 04:03:55','6','root@localhost',3,'',19,1),(193,'2015-12-09 04:03:55','5','root@localhost',3,'',19,1),(194,'2015-12-09 04:03:55','4','root@localhost',3,'',19,1),(195,'2015-12-09 04:03:55','3','root@localhost',3,'',19,1),(196,'2015-12-09 04:03:55','2','root@localhost',3,'',19,1),(197,'2015-12-09 04:03:55','1','root@localhost',3,'',19,1),(198,'2015-12-11 16:21:11','2','root@localhost',3,'',19,1),(199,'2015-12-11 16:21:11','1','root@localhost',3,'',19,1),(200,'2015-12-12 12:10:51','5','root@localhost',3,'',19,1),(201,'2015-12-12 12:10:51','4','root@localhost',3,'',19,1),(202,'2015-12-12 12:10:51','3','root@localhost',3,'',19,1),(203,'2015-12-12 12:11:03','4','root@localhost',3,'',20,1),(204,'2015-12-12 12:11:03','3','root@localhost',3,'',20,1),(205,'2015-12-12 12:11:03','2','root@localhost',3,'',20,1),(206,'2015-12-12 12:11:03','1','root@localhost',3,'',20,1),(207,'2015-12-13 12:48:37','4','JuanJavierLimachi',3,'',4,1),(208,'2015-12-13 16:41:26','52','javier',3,'',13,1),(209,'2015-12-13 16:41:26','51','juan',3,'',13,1),(210,'2015-12-13 16:41:26','50','FernandoChoque',3,'',13,1),(211,'2015-12-13 16:41:26','49','javier',3,'',13,1),(212,'2015-12-13 16:41:26','48','JuanJavierLimachi',3,'',13,1),(213,'2015-12-13 16:41:26','47','FernandoChoque',3,'',13,1),(214,'2015-12-13 16:41:27','46','JuanJavierLimachi',3,'',13,1),(215,'2015-12-13 16:41:27','45','JuanJavierLimachi',3,'',13,1),(216,'2015-12-13 16:41:27','44','JuanJavierLimachi',3,'',13,1),(217,'2015-12-13 16:41:27','42','javier',3,'',13,1),(218,'2015-12-13 16:41:27','41','JuanJavierLimachi',3,'',13,1),(219,'2015-12-13 16:41:27','40','FernandoChoque',3,'',13,1),(220,'2015-12-13 16:41:27','39','FernandoChoque',3,'',13,1),(221,'2015-12-13 16:41:27','38','FernandoChoque',3,'',13,1),(222,'2015-12-13 16:41:27','37','FernandoChoque',3,'',13,1),(223,'2015-12-13 16:41:27','36','FernandoChoque',3,'',13,1),(224,'2015-12-13 16:41:43','52','javier',3,'',16,1),(225,'2015-12-13 16:41:43','51','javier',3,'',16,1),(226,'2015-12-13 16:41:44','50','javier',3,'',16,1),(227,'2015-12-13 16:41:44','49','javier',3,'',16,1),(228,'2015-12-13 16:41:44','47','javier',3,'',16,1),(229,'2015-12-13 16:41:44','46','javier',3,'',16,1),(230,'2015-12-13 16:41:44','45','javier',3,'',16,1),(231,'2015-12-13 16:41:44','44','juan',3,'',16,1),(232,'2015-12-13 16:41:44','43','javier',3,'',16,1),(233,'2015-12-13 16:41:44','42','javier',3,'',16,1),(234,'2015-12-13 16:41:45','41','edy',3,'',16,1),(235,'2015-12-13 16:41:45','39','javier',3,'',16,1),(236,'2015-12-13 16:41:45','38','javier',3,'',16,1),(237,'2015-12-13 18:03:14','6','FernandoChoque',3,'',4,1),(238,'2015-12-13 18:03:14','5','JuanJavierLimachi',3,'',4,1),(239,'2015-12-13 18:03:35','53','javier',3,'',16,1),(240,'2015-12-13 18:03:54','59','JuanJavierLimachi',3,'',13,1),(241,'2015-12-13 18:03:54','58','javier',3,'',13,1),(242,'2015-12-13 18:03:54','57','FernandoChoque',3,'',13,1),(243,'2015-12-13 18:03:54','56','javier',3,'',13,1),(244,'2015-12-13 18:03:54','55','JuanJavierLimachi',3,'',13,1),(245,'2015-12-13 18:03:54','54','JuanJavierLimachi',3,'',13,1),(246,'2015-12-13 18:03:54','53','JuanJavierLimachi',3,'',13,1),(247,'2015-12-14 17:18:57','13','Enrique',3,'',15,1),(248,'2015-12-14 17:23:19','14','Enrique',3,'',15,1),(249,'2015-12-14 17:30:19','15','Enrique',3,'',15,1),(250,'2015-12-14 17:32:53','16','Enrique',3,'',15,1),(251,'2015-12-14 17:56:29','18','Mary',3,'',15,1),(252,'2015-12-14 17:56:30','17','Enrique',3,'',15,1),(253,'2015-12-14 17:56:30','12','Celumania',3,'',15,1),(254,'2016-01-08 21:16:00','9','juan',2,'Modificado/a activo.',16,1),(255,'2016-01-08 21:16:08','8','juan',2,'Modificado/a activo.',16,1),(256,'2016-01-08 21:35:30','9','juan',2,'Modificado/a activo.',16,1),(257,'2016-01-08 21:39:04','8','juan',2,'Modificado/a activo.',16,1),(258,'2016-01-08 21:39:11','9','juan',2,'Modificado/a activo.',16,1),(259,'2016-02-20 18:22:06','5','JuanJavierLimachi',2,'Modificado/a estado.',13,1);
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
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_3ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'log entry','admin','logentry'),(2,'permission','auth','permission'),(3,'group','auth','group'),(4,'user','auth','user'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session'),(7,'user social auth','default','usersocialauth'),(8,'nonce','default','nonce'),(9,'association','default','association'),(10,'code','default','code'),(11,'cronograma','inicio','cronograma'),(12,'perfiles','usuario','perfiles'),(13,'comment','cliente','comment'),(14,'categoria','negocio','categoria'),(15,'negocio','negocio','negocio'),(16,'multa','negocio','multa'),(17,'seguimiento','usuario','seguimiento'),(18,'cobro','negocio','cobro'),(19,'cambios notificaciones','usuario','cambiosnotificaciones'),(20,'update notificaciones','usuario','updatenotificaciones');
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
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2015-10-30 20:16:49'),(2,'auth','0001_initial','2015-10-30 20:17:02'),(3,'admin','0001_initial','2015-10-30 20:17:09'),(4,'cliente','0001_initial','2015-10-30 20:17:11'),(5,'cliente','0002_remove_comment_fecha_denuncia','2015-10-30 20:17:12'),(6,'cliente','0003_comment_fecha_denuncia','2015-10-30 20:17:13'),(7,'cliente','0004_auto_20151015_0946','2015-10-30 20:17:15'),(8,'cliente','0005_auto_20151015_0946','2015-10-30 20:17:15'),(9,'cliente','0006_auto_20151015_1252','2015-10-30 20:17:16'),(10,'cliente','0007_auto_20151015_1316','2015-10-30 20:17:17'),(11,'cliente','0008_auto_20151015_1440','2015-10-30 20:17:21'),(12,'cliente','0009_auto_20151015_1441','2015-10-30 20:17:23'),(13,'cliente','0010_remove_comment_archivo','2015-10-30 20:17:24'),(14,'cliente','0011_comment_iduser','2015-10-30 20:17:26'),(15,'default','0001_initial','2015-10-30 20:17:34'),(16,'default','0002_add_related_name','2015-10-30 20:17:36'),(17,'default','0003_alter_email_max_length','2015-10-30 20:17:38'),(18,'default','0004_auto_20150427_2315','2015-10-30 20:17:40'),(19,'inicio','0001_initial','2015-10-30 20:17:41'),(20,'negocio','0001_initial','2015-10-30 20:17:43'),(21,'negocio','0002_auto_20150610_2122','2015-10-30 20:17:45'),(22,'negocio','0003_auto_20150610_2124','2015-10-30 20:17:47'),(23,'negocio','0004_multa_fecha_presentacion','2015-10-30 20:17:48'),(24,'negocio','0005_auto_20150619_1905','2015-10-30 20:17:50'),(25,'negocio','0006_multa_iduser','2015-10-30 20:17:52'),(26,'negocio','0007_negocio_tipo','2015-10-30 20:17:53'),(27,'negocio','0008_remove_negocio_categoria','2015-10-30 20:17:54'),(28,'negocio','0009_auto_20150714_1909','2015-10-30 20:17:58'),(29,'negocio','0010_auto_20150714_1910','2015-10-30 20:18:01'),(30,'negocio','0011_negocio_user','2015-10-30 20:18:05'),(31,'negocio','0012_negocio_fecha_registro','2015-10-30 20:18:07'),(32,'negocio','0013_remove_negocio_fecha_registro','2015-10-30 20:18:08'),(33,'negocio','0014_negocio_fecha_registro','2015-10-30 20:18:10'),(34,'negocio','0015_auto_20151028_1813','2015-10-30 20:18:15'),(35,'sessions','0001_initial','2015-10-30 20:18:17'),(36,'usuario','0001_initial','2015-10-30 20:18:19'),(37,'usuario','0002_seguimiento','2015-11-03 03:53:31'),(38,'negocio','0016_cobro','2015-11-04 21:45:24'),(39,'usuario','0003_auto_20151106_1057','2015-11-06 16:57:13'),(40,'negocio','0017_auto_20151107_1551','2015-11-07 21:51:45'),(41,'negocio','0018_auto_20151119_2036','2015-11-20 02:36:53'),(42,'negocio','0019_categoria_fecha_registro','2015-11-20 02:38:34'),(43,'negocio','0020_auto_20151122_1458','2015-11-22 20:58:32'),(44,'usuario','0004_auto_20151122_1524','2015-11-22 21:24:22'),(45,'usuario','0005_cambiosnotificaciones','2015-11-23 03:08:02'),(46,'negocio','0021_auto_20151130_1940','2015-12-01 02:41:04'),(47,'negocio','0022_auto_20151130_2015','2015-12-01 03:16:07'),(48,'negocio','0023_auto_20151130_2047','2015-12-01 03:47:25'),(49,'negocio','0024_auto_20151202_1953','2015-12-03 02:53:39'),(50,'cliente','0012_comment_estado','2015-12-03 03:11:50'),(51,'negocio','0025_cobro_estado','2015-12-03 05:49:12'),(52,'negocio','0026_auto_20151202_2303','2015-12-03 06:03:47'),(53,'negocio','0027_categoria_atencion','2015-12-03 07:03:23'),(54,'negocio','0028_auto_20151205_1738','2015-12-06 02:40:41'),(55,'negocio','0029_auto_20151205_1750','2015-12-06 02:40:43'),(56,'negocio','0030_remove_categoria_hoar','2015-12-06 02:40:44'),(57,'negocio','0031_auto_20151205_1940','2015-12-06 02:40:45'),(58,'usuario','0006_updatenotificaciones','2015-12-08 17:28:16'),(59,'negocio','0032_auto_20151214_0843','2015-12-14 15:44:27'),(60,'negocio','0033_negocio_activo','2016-01-04 03:11:40'),(61,'negocio','0034_auto_20160104_2205','2016-01-05 05:06:18'),(62,'negocio','0035_multa_activo','2016-01-08 20:43:18'),(63,'negocio','0036_categoria_dias','2016-01-21 17:24:30');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('02umjl7bakhh6hxh31hh0tg9wlthbndj','Yzk0ZTFmNGExY2QxNmM5ZDc0NTczN2M1NzAyMDkwMTRlOGUzOTZiODp7Il9hdXRoX3VzZXJfaGFzaCI6IjdmNzQxZTY2OTU1NTQyMTUyYjljNjM3ZDdiMmVhZDRmNTQ0MzVjZjciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-11-25 03:48:26'),('0i8xom4f3kd1zqw7c598mdyc4cenhkfq','OGNmZWFiNjFiNTM0NzhiMWEwYTlmMTUyMTM2MTQ5MzljZWRiYmYyNDp7fQ==','2016-01-24 00:55:54'),('0kppouhhxiz1vyc7t8sfbgrjo1nuv54l','MGM5MGZhNmZmNzY0NDJiMjNlMjUwOTFjMWYyY2ViYWYzZGQ3NjdjOTp7ImZhY2Vib29rX3N0YXRlIjoiUHF5TnZaaHJZblJoQUk3YU95MnhIZlBKS2p4eGRtSjMiLCJzb2NpYWxfYXV0aF9sYXN0X2xvZ2luX2JhY2tlbmQiOiJmYWNlYm9vayIsIl9hdXRoX3VzZXJfaGFzaCI6Ijg2YTg1NGFhMDcyNjBlZTBiY2E3MTkzMmQ5ZjkyMGNhNGIzYzBmN2QiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJzb2NpYWwuYmFja2VuZHMuZmFjZWJvb2suRmFjZWJvb2tPQXV0aDIiLCJfYXV0aF91c2VyX2lkIjoxOX0=','2015-12-12 02:03:11'),('11hdttydvixibues5t6vv2lp1scr4bgs','OGNmZWFiNjFiNTM0NzhiMWEwYTlmMTUyMTM2MTQ5MzljZWRiYmYyNDp7fQ==','2015-12-30 21:34:50'),('1xkhl1ystfzl6l7bkqs3ioa5uazmn30h','MTBhYWVlMDYyMTQ1ZTZjZGQ5Nzg4Nzk3OTM2NjQ1ZmYyZTZkZmYwMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjJlYjlmOWM4YjE2N2IyMGIwZTNkMzYwMTg1MGU0MTVmMWY2MmE3OTUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjJ9','2016-01-18 04:41:34'),('2ka0bgi7u6uvi4zh1ai0o4i5drbpq85n','OGNmZWFiNjFiNTM0NzhiMWEwYTlmMTUyMTM2MTQ5MzljZWRiYmYyNDp7fQ==','2015-12-07 01:58:52'),('33mf7bekybp4g4loygerbhtc324zap4s','Yzk0ZTFmNGExY2QxNmM5ZDc0NTczN2M1NzAyMDkwMTRlOGUzOTZiODp7Il9hdXRoX3VzZXJfaGFzaCI6IjdmNzQxZTY2OTU1NTQyMTUyYjljNjM3ZDdiMmVhZDRmNTQ0MzVjZjciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-12-05 06:46:23'),('3421sk8ncmmmlj209np9dk0hruo26gro','NjljYzdiODg5YmY0Yjg1YjE1OTJmYTk4MTMwM2Y2NjU1NmVlYTA5YTp7InNvY2lhbF9hdXRoX2xhc3RfbG9naW5fYmFja2VuZCI6ImZhY2Vib29rIiwiX2F1dGhfdXNlcl9oYXNoIjoiOWI2NGEwNDQxNjM4MTc5M2Y3MWVhOTIzMzc2ZTQ5OTIwMDIzNDFjNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InNvY2lhbC5iYWNrZW5kcy5mYWNlYm9vay5GYWNlYm9va09BdXRoMiIsIl9hdXRoX3VzZXJfaWQiOjE0fQ==','2015-11-29 05:47:53'),('3cx0oswgtzin46r8jieultcntu1r1phl','NWFjN2NmNDdiMmVjZTAyMjg4ZjFkY2Y1ZDNiYWJmMzllZmMxZGNiNzp7ImZhY2Vib29rX3N0YXRlIjoiRGJxa20yUTZLdGxmMDMxRDJZd1BjekV6dWV1eWlHbTQiLCJzb2NpYWxfYXV0aF9sYXN0X2xvZ2luX2JhY2tlbmQiOiJmYWNlYm9vayIsIl9hdXRoX3VzZXJfaGFzaCI6IjRmZGM0ZTQ2Y2UzMmQzYTVhOWU4OGQxY2RmMTAxMTg1NzA5ODk1N2UiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJzb2NpYWwuYmFja2VuZHMuZmFjZWJvb2suRmFjZWJvb2tPQXV0aDIiLCJfYXV0aF91c2VyX2lkIjo1fQ==','2015-12-27 17:21:19'),('3d6gdagy1lwgzzvqveeqahxbqez04a4d','OGNmZWFiNjFiNTM0NzhiMWEwYTlmMTUyMTM2MTQ5MzljZWRiYmYyNDp7fQ==','2016-02-19 01:59:31'),('3t5dxq9ftzak8dbnz72gy3n03ndna356','MTBhYWVlMDYyMTQ1ZTZjZGQ5Nzg4Nzk3OTM2NjQ1ZmYyZTZkZmYwMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjJlYjlmOWM4YjE2N2IyMGIwZTNkMzYwMTg1MGU0MTVmMWY2MmE3OTUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjJ9','2015-12-25 12:58:37'),('3t89ffjfo306b6sbbpvh9ya3be8wvomq','Yzk0ZTFmNGExY2QxNmM5ZDc0NTczN2M1NzAyMDkwMTRlOGUzOTZiODp7Il9hdXRoX3VzZXJfaGFzaCI6IjdmNzQxZTY2OTU1NTQyMTUyYjljNjM3ZDdiMmVhZDRmNTQ0MzVjZjciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-11-15 16:45:38'),('4i5rxcc8kqrv0xq118sjo0xbby3f209n','OGNmZWFiNjFiNTM0NzhiMWEwYTlmMTUyMTM2MTQ5MzljZWRiYmYyNDp7fQ==','2016-01-24 01:05:39'),('4wr4jl7ftdakgmt8lmp2wivhsl2bnklj','Yzk0ZTFmNGExY2QxNmM5ZDc0NTczN2M1NzAyMDkwMTRlOGUzOTZiODp7Il9hdXRoX3VzZXJfaGFzaCI6IjdmNzQxZTY2OTU1NTQyMTUyYjljNjM3ZDdiMmVhZDRmNTQ0MzVjZjciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-12-23 01:51:05'),('57r4lsvpajv8o6qjfbzug7mhp4w1seh1','OGNmZWFiNjFiNTM0NzhiMWEwYTlmMTUyMTM2MTQ5MzljZWRiYmYyNDp7fQ==','2016-02-19 01:57:57'),('5gykruwh8jje3hrhk2fxqd8g24cc6jub','OGNmZWFiNjFiNTM0NzhiMWEwYTlmMTUyMTM2MTQ5MzljZWRiYmYyNDp7fQ==','2015-12-30 21:21:47'),('6ef2b3ciq83v76b1qs0nv9x2ubpx84is','ZDI1NjM5ODdkZDEwMDU3YjI5ZDUyNzhlNTNmNmE5NDE4NWZkNGE1Yzp7ImZhY2Vib29rX3N0YXRlIjoiYnlRQm5Ud1NJNlZpbE15bUFDSHdoOGhad0Y1RWQ1a1AiLCJzb2NpYWxfYXV0aF9sYXN0X2xvZ2luX2JhY2tlbmQiOiJmYWNlYm9vayIsIl9hdXRoX3VzZXJfaGFzaCI6IjRmZGM0ZTQ2Y2UzMmQzYTVhOWU4OGQxY2RmMTAxMTg1NzA5ODk1N2UiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJzb2NpYWwuYmFja2VuZHMuZmFjZWJvb2suRmFjZWJvb2tPQXV0aDIiLCJfYXV0aF91c2VyX2lkIjo1fQ==','2015-12-27 18:01:49'),('6g7e3op1x3j46dzp8zjhe89ttrdn96yd','MTBhYWVlMDYyMTQ1ZTZjZGQ5Nzg4Nzk3OTM2NjQ1ZmYyZTZkZmYwMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjJlYjlmOWM4YjE2N2IyMGIwZTNkMzYwMTg1MGU0MTVmMWY2MmE3OTUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjJ9','2015-11-24 20:35:46'),('70vlskv0up9maaefoln44yxulyawo33f','MWI0MzY3ZTgzODdmMDY2M2RiN2Q3NGMzZWQ1ZmRhZTQ2YjhhMDQ2Yzp7IkNvZGlnbyI6IjIiLCJuYW1lIjoianVhbiIsIl9hdXRoX3VzZXJfaWQiOjEsImZhY2Vib29rX3N0YXRlIjoiUmM3cEpGb0NUZ2FLbzBRTEFwVUNtQ2hYS1dVRzlqbDciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjdmNzQxZTY2OTU1NTQyMTUyYjljNjM3ZDdiMmVhZDRmNTQ0MzVjZjcifQ==','2015-11-21 06:11:06'),('85gp125o9kh3rzvn9id97na5n64ym2z5','OGNmZWFiNjFiNTM0NzhiMWEwYTlmMTUyMTM2MTQ5MzljZWRiYmYyNDp7fQ==','2016-01-29 17:24:46'),('8cknau6foauvumhd7gnzqly5f1wiu47g','Yzk0ZTFmNGExY2QxNmM5ZDc0NTczN2M1NzAyMDkwMTRlOGUzOTZiODp7Il9hdXRoX3VzZXJfaGFzaCI6IjdmNzQxZTY2OTU1NTQyMTUyYjljNjM3ZDdiMmVhZDRmNTQ0MzVjZjciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-12-10 12:34:12'),('8jd2myh8uoq8fcrgd0tz3j1jg8ay1kd4','OGNmZWFiNjFiNTM0NzhiMWEwYTlmMTUyMTM2MTQ5MzljZWRiYmYyNDp7fQ==','2015-12-27 16:37:14'),('8nc2y4uaurhz4qgnf37csti1ufq2m6s4','MTBhYWVlMDYyMTQ1ZTZjZGQ5Nzg4Nzk3OTM2NjQ1ZmYyZTZkZmYwMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjJlYjlmOWM4YjE2N2IyMGIwZTNkMzYwMTg1MGU0MTVmMWY2MmE3OTUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjJ9','2016-04-20 00:21:17'),('8o6yk32pfjvlupm3xhb7jlubhl1phjjp','MTBhYWVlMDYyMTQ1ZTZjZGQ5Nzg4Nzk3OTM2NjQ1ZmYyZTZkZmYwMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjJlYjlmOWM4YjE2N2IyMGIwZTNkMzYwMTg1MGU0MTVmMWY2MmE3OTUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjJ9','2015-12-06 05:40:39'),('93gb7ql1vzgy2nls5p52hfy3pqmhx7m3','NGRkOGMxYjNkNTAwOTA3MWVkMTZjNGU3MTkwZTc0MmI1NDhkNDUxYzp7ImZhY2Vib29rX3N0YXRlIjoiOWptcDBaWk9wOWVLM0J1WEFsRmNCVk5KMFNsMTdIRkwiLCJzb2NpYWxfYXV0aF9sYXN0X2xvZ2luX2JhY2tlbmQiOiJmYWNlYm9vayIsIl9hdXRoX3VzZXJfaGFzaCI6ImE1NjY4NjBjN2MzN2YyYzEyMDc3ODA5MGQ1ZGI1NjE2YTkzYmVjYTEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJzb2NpYWwuYmFja2VuZHMuZmFjZWJvb2suRmFjZWJvb2tPQXV0aDIiLCJfYXV0aF91c2VyX2lkIjo1fQ==','2015-12-31 04:07:14'),('aafw5uk9w82myjkst3rz5no5u1omujfu','Yzk0ZTFmNGExY2QxNmM5ZDc0NTczN2M1NzAyMDkwMTRlOGUzOTZiODp7Il9hdXRoX3VzZXJfaGFzaCI6IjdmNzQxZTY2OTU1NTQyMTUyYjljNjM3ZDdiMmVhZDRmNTQ0MzVjZjciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-11-15 22:49:27'),('axpvl9x5p2ht8h94pdjgv4ojy42f00wr','OGNmZWFiNjFiNTM0NzhiMWEwYTlmMTUyMTM2MTQ5MzljZWRiYmYyNDp7fQ==','2016-01-24 01:04:48'),('ayhza0phppvelhls85umm91kuwgz4oe5','Yzk0ZTFmNGExY2QxNmM5ZDc0NTczN2M1NzAyMDkwMTRlOGUzOTZiODp7Il9hdXRoX3VzZXJfaGFzaCI6IjdmNzQxZTY2OTU1NTQyMTUyYjljNjM3ZDdiMmVhZDRmNTQ0MzVjZjciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-12-27 12:48:14'),('bh6abzq5y8svrknl9hxv7qtgjrad6hph','MTBhYWVlMDYyMTQ1ZTZjZGQ5Nzg4Nzk3OTM2NjQ1ZmYyZTZkZmYwMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjJlYjlmOWM4YjE2N2IyMGIwZTNkMzYwMTg1MGU0MTVmMWY2MmE3OTUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjJ9','2015-12-30 21:47:51'),('ca5x3bp49yjmo09e3salzwvarg26z6bb','OGNmZWFiNjFiNTM0NzhiMWEwYTlmMTUyMTM2MTQ5MzljZWRiYmYyNDp7fQ==','2016-01-24 00:47:28'),('ch7zhwi0txt3lh5a1w70lzukdqco5p8w','MTBhYWVlMDYyMTQ1ZTZjZGQ5Nzg4Nzk3OTM2NjQ1ZmYyZTZkZmYwMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjJlYjlmOWM4YjE2N2IyMGIwZTNkMzYwMTg1MGU0MTVmMWY2MmE3OTUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjJ9','2016-03-05 07:12:56'),('cm0lp45e8lskuyc0sz3bjcsftp2wr8qs','Yzk0ZTFmNGExY2QxNmM5ZDc0NTczN2M1NzAyMDkwMTRlOGUzOTZiODp7Il9hdXRoX3VzZXJfaGFzaCI6IjdmNzQxZTY2OTU1NTQyMTUyYjljNjM3ZDdiMmVhZDRmNTQ0MzVjZjciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2016-01-29 20:00:50'),('cuu47bc5pqch2zy7p3kugyxr50lp71hv','MTBhYWVlMDYyMTQ1ZTZjZGQ5Nzg4Nzk3OTM2NjQ1ZmYyZTZkZmYwMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjJlYjlmOWM4YjE2N2IyMGIwZTNkMzYwMTg1MGU0MTVmMWY2MmE3OTUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjJ9','2015-12-28 12:26:35'),('cvwhv9brejo7i2ewp6fbinzum5yhvr2z','OGNmZWFiNjFiNTM0NzhiMWEwYTlmMTUyMTM2MTQ5MzljZWRiYmYyNDp7fQ==','2016-01-24 00:59:33'),('cxny1ho10z6gf6j9kdj1mcgme9mx3n9e','MmY3MzAwMjlmNzUwOWQ2ZGJkMGFjODVlZDJiZTQwODMzZDcxY2JiYzp7ImZhY2Vib29rX3N0YXRlIjoiTTRWalo3N3JsT09hUGFkTEhXTzFGQWJRV0NRMU9jeDciLCJzb2NpYWxfYXV0aF9sYXN0X2xvZ2luX2JhY2tlbmQiOiJmYWNlYm9vayIsIl9hdXRoX3VzZXJfaGFzaCI6IjEwZjJjYTM4MWY5ZWQyMjJhZjYwOTA2ZmU1ZjlkNjMwYjNmOWM3ZDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJzb2NpYWwuYmFja2VuZHMuZmFjZWJvb2suRmFjZWJvb2tPQXV0aDIiLCJfYXV0aF91c2VyX2lkIjo2fQ==','2015-12-27 17:53:49'),('d7x1r0bh678psgczz6vg911xasy7d3da','Yzk0ZTFmNGExY2QxNmM5ZDc0NTczN2M1NzAyMDkwMTRlOGUzOTZiODp7Il9hdXRoX3VzZXJfaGFzaCI6IjdmNzQxZTY2OTU1NTQyMTUyYjljNjM3ZDdiMmVhZDRmNTQ0MzVjZjciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-12-31 05:03:03'),('dp6r980wrxlzr90u5idwjz6u0rh48wta','MTBhYWVlMDYyMTQ1ZTZjZGQ5Nzg4Nzk3OTM2NjQ1ZmYyZTZkZmYwMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjJlYjlmOWM4YjE2N2IyMGIwZTNkMzYwMTg1MGU0MTVmMWY2MmE3OTUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjJ9','2015-12-31 04:04:00'),('ep9bnrlxztyausrh740qsndhrldwlyfn','Yzk0ZTFmNGExY2QxNmM5ZDc0NTczN2M1NzAyMDkwMTRlOGUzOTZiODp7Il9hdXRoX3VzZXJfaGFzaCI6IjdmNzQxZTY2OTU1NTQyMTUyYjljNjM3ZDdiMmVhZDRmNTQ0MzVjZjciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-11-24 01:21:58'),('fhu7t6wvbq6sqekmn4y2ppng6wzu3z2g','OGNmZWFiNjFiNTM0NzhiMWEwYTlmMTUyMTM2MTQ5MzljZWRiYmYyNDp7fQ==','2016-01-24 00:47:26'),('fmponly8ewiho0761xcdqphmqlw7ioeq','MTBhYWVlMDYyMTQ1ZTZjZGQ5Nzg4Nzk3OTM2NjQ1ZmYyZTZkZmYwMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjJlYjlmOWM4YjE2N2IyMGIwZTNkMzYwMTg1MGU0MTVmMWY2MmE3OTUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjJ9','2016-01-24 01:16:09'),('fq2hezfy3oj2w13zoib7ucmsy82poajd','Yzk0ZTFmNGExY2QxNmM5ZDc0NTczN2M1NzAyMDkwMTRlOGUzOTZiODp7Il9hdXRoX3VzZXJfaGFzaCI6IjdmNzQxZTY2OTU1NTQyMTUyYjljNjM3ZDdiMmVhZDRmNTQ0MzVjZjciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-11-26 04:06:18'),('fqu0ma0l0834vm8y3eogeuh6z0vhrbhy','NzdjYzk0MWE3ZjFjZTI5YWRkNzk1ZGE0NjUzY2U4MzJhNzM1MWQzZDp7ImZhY2Vib29rX3N0YXRlIjoiZk9WVUtjMHM1YUpRWVNWYXViWDUyVlY3bUMzY2E3YU4iLCJzb2NpYWxfYXV0aF9sYXN0X2xvZ2luX2JhY2tlbmQiOiJmYWNlYm9vayIsIl9hdXRoX3VzZXJfaGFzaCI6IjI0MDZlM2ZkMmI0ODVlN2M2NjkxOTI2NWI4OGYzY2QwNGNkY2U3YjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJzb2NpYWwuYmFja2VuZHMuZmFjZWJvb2suRmFjZWJvb2tPQXV0aDIiLCJfYXV0aF91c2VyX2lkIjo1fQ==','2015-12-04 03:11:19'),('g4nqy1af2o9s4lz8dyx1hd2z8bewyt0u','OGNmZWFiNjFiNTM0NzhiMWEwYTlmMTUyMTM2MTQ5MzljZWRiYmYyNDp7fQ==','2016-01-24 00:51:22'),('gcydm7dee9d0h5poal2z3877ja34r4wd','Yzk0ZTFmNGExY2QxNmM5ZDc0NTczN2M1NzAyMDkwMTRlOGUzOTZiODp7Il9hdXRoX3VzZXJfaGFzaCI6IjdmNzQxZTY2OTU1NTQyMTUyYjljNjM3ZDdiMmVhZDRmNTQ0MzVjZjciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-11-13 20:23:58'),('gf1ifqg5s5qo6o2c3n7iynjbhki35dz5','Yzk0ZTFmNGExY2QxNmM5ZDc0NTczN2M1NzAyMDkwMTRlOGUzOTZiODp7Il9hdXRoX3VzZXJfaGFzaCI6IjdmNzQxZTY2OTU1NTQyMTUyYjljNjM3ZDdiMmVhZDRmNTQ0MzVjZjciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-11-29 20:12:09'),('gjk4l7wh80hu3w9moozo2xtnx5yqv5wk','MTBhYWVlMDYyMTQ1ZTZjZGQ5Nzg4Nzk3OTM2NjQ1ZmYyZTZkZmYwMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjJlYjlmOWM4YjE2N2IyMGIwZTNkMzYwMTg1MGU0MTVmMWY2MmE3OTUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjJ9','2016-03-06 04:56:07'),('hc4q4cnu0ezeyz74o76t328efz4uecpm','MTBhYWVlMDYyMTQ1ZTZjZGQ5Nzg4Nzk3OTM2NjQ1ZmYyZTZkZmYwMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjJlYjlmOWM4YjE2N2IyMGIwZTNkMzYwMTg1MGU0MTVmMWY2MmE3OTUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjJ9','2015-11-29 19:49:43'),('hqbj3byyljlfr8ye077ppzcjg3f1hfth','MTBhYWVlMDYyMTQ1ZTZjZGQ5Nzg4Nzk3OTM2NjQ1ZmYyZTZkZmYwMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjJlYjlmOWM4YjE2N2IyMGIwZTNkMzYwMTg1MGU0MTVmMWY2MmE3OTUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjJ9','2015-12-20 21:48:45'),('imq2ugo7bubkarnnfzzy84no1xwgay91','OGNmZWFiNjFiNTM0NzhiMWEwYTlmMTUyMTM2MTQ5MzljZWRiYmYyNDp7fQ==','2015-12-10 06:03:24'),('iug40ce0dcv6keo8lvdm9ke4h5kavd4v','OGNmZWFiNjFiNTM0NzhiMWEwYTlmMTUyMTM2MTQ5MzljZWRiYmYyNDp7fQ==','2016-01-15 22:29:46'),('jojpc0otc60anprw4cqfko24o3zcgxql','OWI2NmY5ZjkzMDYyNWJjZThhY2Q0NDMyOGVlNDk0YjhmNWEzYmNhZDp7ImZhY2Vib29rX3N0YXRlIjoiTjQ2bzBrcmpxU2VFeGEzTlRmcG43T05XbnNoaVIwckciLCJzb2NpYWxfYXV0aF9sYXN0X2xvZ2luX2JhY2tlbmQiOiJmYWNlYm9vayIsIl9hdXRoX3VzZXJfaGFzaCI6IjVjOTUxYjc2ZDRiYjg2NzU4Y2M3OWM2OGFkMWFjNGUyMDZjMjNhZTciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJzb2NpYWwuYmFja2VuZHMuZmFjZWJvb2suRmFjZWJvb2tPQXV0aDIiLCJfYXV0aF91c2VyX2lkIjo4fQ==','2015-11-29 05:21:59'),('jskk26i8ztis1s9my39weviv7bl9iutp','OGNmZWFiNjFiNTM0NzhiMWEwYTlmMTUyMTM2MTQ5MzljZWRiYmYyNDp7fQ==','2016-01-24 01:05:08'),('kvcjckh1xt7nnxmtrzsx0kv3n6885uxw','Yzk0ZTFmNGExY2QxNmM5ZDc0NTczN2M1NzAyMDkwMTRlOGUzOTZiODp7Il9hdXRoX3VzZXJfaGFzaCI6IjdmNzQxZTY2OTU1NTQyMTUyYjljNjM3ZDdiMmVhZDRmNTQ0MzVjZjciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-11-19 14:18:16'),('ky0ycidd8sa9wx877o09fdjg8wu3jlka','Yzk0ZTFmNGExY2QxNmM5ZDc0NTczN2M1NzAyMDkwMTRlOGUzOTZiODp7Il9hdXRoX3VzZXJfaGFzaCI6IjdmNzQxZTY2OTU1NTQyMTUyYjljNjM3ZDdiMmVhZDRmNTQ0MzVjZjciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-11-23 04:52:56'),('lfpsc5nzgkjstolj1iu0t0dxrddobjlg','OGNmZWFiNjFiNTM0NzhiMWEwYTlmMTUyMTM2MTQ5MzljZWRiYmYyNDp7fQ==','2016-02-19 01:58:30'),('ln5lo9nn8aln0odqn41a5amqwpc7whkt','Yzk0ZTFmNGExY2QxNmM5ZDc0NTczN2M1NzAyMDkwMTRlOGUzOTZiODp7Il9hdXRoX3VzZXJfaGFzaCI6IjdmNzQxZTY2OTU1NTQyMTUyYjljNjM3ZDdiMmVhZDRmNTQ0MzVjZjciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-11-24 15:43:47'),('lqo1tk6t2jfdoeqdlt7k0ktry8lh9y5h','OGNmZWFiNjFiNTM0NzhiMWEwYTlmMTUyMTM2MTQ5MzljZWRiYmYyNDp7fQ==','2016-01-29 17:24:46'),('mcb1o0q0rzt0nc5ta1k038f5bvqm4k24','Yzk4NGJiZTgxNjk1ZjU2MGVmODljZjJkODlmOTZmNDYxMWE5Zjk2Nzp7ImZhY2Vib29rX3N0YXRlIjoiTzdZOEtWREpmclZ1a0V3TEZGcERnMXF1WWdYVWJ5d1kifQ==','2015-12-12 01:09:12'),('mfnfc6ohldorwd09q1c9a3grrrak1vgm','Y2I0ZWFlNDFiMDk3YWYxZGI1ZWQ3M2YxNTU1YmY3NWU2MzAyZDZlNDp7ImZhY2Vib29rX3N0YXRlIjoiYTNEaExGTXZGM2VnYWdtNGhkczh0UkNsQW9qZlFOTnQifQ==','2015-12-28 11:48:25'),('mjvorv49w7vyiaffsfp6ifxxh7ebrhz1','OGNmZWFiNjFiNTM0NzhiMWEwYTlmMTUyMTM2MTQ5MzljZWRiYmYyNDp7fQ==','2016-01-24 00:51:03'),('mu6hdvgfz4tbyuzcwyxbonxig10z1v0e','OGNmZWFiNjFiNTM0NzhiMWEwYTlmMTUyMTM2MTQ5MzljZWRiYmYyNDp7fQ==','2015-12-28 17:14:59'),('mv2036fnzoridxr66k8ib2yjdj2owajs','Yzk0ZTFmNGExY2QxNmM5ZDc0NTczN2M1NzAyMDkwMTRlOGUzOTZiODp7Il9hdXRoX3VzZXJfaGFzaCI6IjdmNzQxZTY2OTU1NTQyMTUyYjljNjM3ZDdiMmVhZDRmNTQ0MzVjZjciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2016-02-05 04:09:33'),('mxfdmf62biox96ik6d780mxakrs4k1y8','OGNmZWFiNjFiNTM0NzhiMWEwYTlmMTUyMTM2MTQ5MzljZWRiYmYyNDp7fQ==','2016-01-24 00:48:51'),('n4032in4y4mm4bbk3b4wyfy02ugwvfen','OGNmZWFiNjFiNTM0NzhiMWEwYTlmMTUyMTM2MTQ5MzljZWRiYmYyNDp7fQ==','2015-12-27 18:04:41'),('n5a0pheskwg1kpqfximhjfzzxbb1ne7t','MTBhYWVlMDYyMTQ1ZTZjZGQ5Nzg4Nzk3OTM2NjQ1ZmYyZTZkZmYwMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjJlYjlmOWM4YjE2N2IyMGIwZTNkMzYwMTg1MGU0MTVmMWY2MmE3OTUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjJ9','2015-12-28 15:28:28'),('nby4mfxrozutt4n9b17rb3ei07ysjj6s','NmE0MjRkMGQ3MjZiMjE2NmViM2JkZjljZTIyNTYxNTY3ZjY4YTJjNzp7ImZhY2Vib29rX3N0YXRlIjoieWlXS2ZBR2c5bHBIVmZjRWE2OGhHc0ZNdjNQbGpmOGYifQ==','2015-11-23 05:24:58'),('o9edh42bd7zitl300kj9hdyoq8cswe71','OGNmZWFiNjFiNTM0NzhiMWEwYTlmMTUyMTM2MTQ5MzljZWRiYmYyNDp7fQ==','2016-02-19 02:11:14'),('octu6qqz7n74z6hk0j7p7rg8ugghh0kj','OGNmZWFiNjFiNTM0NzhiMWEwYTlmMTUyMTM2MTQ5MzljZWRiYmYyNDp7fQ==','2015-12-05 20:34:07'),('pacw5v72zh5jrlap64do2rs7um8nuu7t','MTBhYWVlMDYyMTQ1ZTZjZGQ5Nzg4Nzk3OTM2NjQ1ZmYyZTZkZmYwMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjJlYjlmOWM4YjE2N2IyMGIwZTNkMzYwMTg1MGU0MTVmMWY2MmE3OTUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjJ9','2015-12-03 04:54:00'),('pbptwfi430zeauyv3g0pw24ap6ej6ypr','MTBhYWVlMDYyMTQ1ZTZjZGQ5Nzg4Nzk3OTM2NjQ1ZmYyZTZkZmYwMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjJlYjlmOWM4YjE2N2IyMGIwZTNkMzYwMTg1MGU0MTVmMWY2MmE3OTUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjJ9','2015-12-04 14:55:12'),('pn43e9uuhpppg6r5c17f1jvgdxujuaup','Yzk0ZTFmNGExY2QxNmM5ZDc0NTczN2M1NzAyMDkwMTRlOGUzOTZiODp7Il9hdXRoX3VzZXJfaGFzaCI6IjdmNzQxZTY2OTU1NTQyMTUyYjljNjM3ZDdiMmVhZDRmNTQ0MzVjZjciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-12-28 11:31:09'),('pvur5hcgy9vmkyjx6q8pgj8un53p3tp5','OGNmZWFiNjFiNTM0NzhiMWEwYTlmMTUyMTM2MTQ5MzljZWRiYmYyNDp7fQ==','2016-02-04 19:35:01'),('pwgjo1c3x8c15lp5b2u4a462by86pzgm','OGNmZWFiNjFiNTM0NzhiMWEwYTlmMTUyMTM2MTQ5MzljZWRiYmYyNDp7fQ==','2015-12-31 03:18:56'),('qerifwmpm7rvcl860792zub51f2ewlpo','OGNmZWFiNjFiNTM0NzhiMWEwYTlmMTUyMTM2MTQ5MzljZWRiYmYyNDp7fQ==','2016-01-15 22:29:38'),('qi4eu0gyh4ktfveay55z22za5esmef1m','MTBhYWVlMDYyMTQ1ZTZjZGQ5Nzg4Nzk3OTM2NjQ1ZmYyZTZkZmYwMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjJlYjlmOWM4YjE2N2IyMGIwZTNkMzYwMTg1MGU0MTVmMWY2MmE3OTUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjJ9','2015-11-14 23:46:41'),('qnez74njjtovc14phy9mgep2tf1fsxq3','Yzk0ZTFmNGExY2QxNmM5ZDc0NTczN2M1NzAyMDkwMTRlOGUzOTZiODp7Il9hdXRoX3VzZXJfaGFzaCI6IjdmNzQxZTY2OTU1NTQyMTUyYjljNjM3ZDdiMmVhZDRmNTQ0MzVjZjciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-12-27 16:40:28'),('qr0lzzq5l7oalmbp1cauqgx7hqju49cp','MTY5ODQ1MWJiYjNkNDQ1ZTdkZWY0YjFkMTgwMDZlNWFiYTIxN2YxMDp7ImZhY2Vib29rX3N0YXRlIjoiZ2RJYkNtWlRqTE0xRXRSQmF4c3lFRUE3TnIycnk1OFMifQ==','2015-12-14 01:11:35'),('r1cc2c3kmxnzca5l59u9oajrztreiuz5','MTBhYWVlMDYyMTQ1ZTZjZGQ5Nzg4Nzk3OTM2NjQ1ZmYyZTZkZmYwMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjJlYjlmOWM4YjE2N2IyMGIwZTNkMzYwMTg1MGU0MTVmMWY2MmE3OTUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjJ9','2015-12-30 21:59:39'),('ru2i5gvkvh4hmh1o03oy887l8gp8jcol','MTBhYWVlMDYyMTQ1ZTZjZGQ5Nzg4Nzk3OTM2NjQ1ZmYyZTZkZmYwMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjJlYjlmOWM4YjE2N2IyMGIwZTNkMzYwMTg1MGU0MTVmMWY2MmE3OTUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjJ9','2015-12-23 00:57:37'),('s3x6wej4nlak1dkme42smb1n5ijlgt8a','OGNmZWFiNjFiNTM0NzhiMWEwYTlmMTUyMTM2MTQ5MzljZWRiYmYyNDp7fQ==','2016-01-24 01:05:32'),('srrxu1k9mu53dtr0tca8mws731ukb8dw','OGNmZWFiNjFiNTM0NzhiMWEwYTlmMTUyMTM2MTQ5MzljZWRiYmYyNDp7fQ==','2015-12-24 15:45:09'),('t6e3wg0btk836zsiinqpgm16hykjpjc3','OGNmZWFiNjFiNTM0NzhiMWEwYTlmMTUyMTM2MTQ5MzljZWRiYmYyNDp7fQ==','2016-01-24 01:04:14'),('vbxiltvolooblhatjchj3uz51l8777w4','Yzk0ZTFmNGExY2QxNmM5ZDc0NTczN2M1NzAyMDkwMTRlOGUzOTZiODp7Il9hdXRoX3VzZXJfaGFzaCI6IjdmNzQxZTY2OTU1NTQyMTUyYjljNjM3ZDdiMmVhZDRmNTQ0MzVjZjciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-12-28 17:16:06'),('vpnuy46vl0y1gommue6ywogibf6oajfp','OGNmZWFiNjFiNTM0NzhiMWEwYTlmMTUyMTM2MTQ5MzljZWRiYmYyNDp7fQ==','2016-01-24 00:50:07'),('w9lngkk5np9ey09vqidhiqadou1k7c0b','Yzk0ZTFmNGExY2QxNmM5ZDc0NTczN2M1NzAyMDkwMTRlOGUzOTZiODp7Il9hdXRoX3VzZXJfaGFzaCI6IjdmNzQxZTY2OTU1NTQyMTUyYjljNjM3ZDdiMmVhZDRmNTQ0MzVjZjciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-11-28 03:25:01'),('wbh0v3nz82g4t41ssic9f1zdrks7oznn','OGNmZWFiNjFiNTM0NzhiMWEwYTlmMTUyMTM2MTQ5MzljZWRiYmYyNDp7fQ==','2016-01-24 00:49:18'),('x6ezvdcvk18lqk6vb3ouyg4yfxulqww0','OGNmZWFiNjFiNTM0NzhiMWEwYTlmMTUyMTM2MTQ5MzljZWRiYmYyNDp7fQ==','2015-12-31 04:15:30'),('x6k0r1mpquq048y8n1vy676ybxfiqerb','OGNmZWFiNjFiNTM0NzhiMWEwYTlmMTUyMTM2MTQ5MzljZWRiYmYyNDp7fQ==','2015-12-25 19:06:00'),('xhmff09teudwp00ekt055apbnk6ye66g','Yzk0ZTFmNGExY2QxNmM5ZDc0NTczN2M1NzAyMDkwMTRlOGUzOTZiODp7Il9hdXRoX3VzZXJfaGFzaCI6IjdmNzQxZTY2OTU1NTQyMTUyYjljNjM3ZDdiMmVhZDRmNTQ0MzVjZjciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2016-04-19 18:49:42'),('xy1r941yog6lu45gjympdde1hlseb82l','Yzk0ZTFmNGExY2QxNmM5ZDc0NTczN2M1NzAyMDkwMTRlOGUzOTZiODp7Il9hdXRoX3VzZXJfaGFzaCI6IjdmNzQxZTY2OTU1NTQyMTUyYjljNjM3ZDdiMmVhZDRmNTQ0MzVjZjciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-12-03 04:52:35'),('ygs6l9vkmeqjkdvlq599h1fw2oqu5znz','MTBhYWVlMDYyMTQ1ZTZjZGQ5Nzg4Nzk3OTM2NjQ1ZmYyZTZkZmYwMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjJlYjlmOWM4YjE2N2IyMGIwZTNkMzYwMTg1MGU0MTVmMWY2MmE3OTUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjJ9','2015-11-19 14:27:48'),('ym8j7vcux35io367ql3h7fi0f1ukc1io','OGNmZWFiNjFiNTM0NzhiMWEwYTlmMTUyMTM2MTQ5MzljZWRiYmYyNDp7fQ==','2015-12-10 02:20:50'),('ynxxz6k07gmkkdg37z1ffoi9md91tqgs','MDI1ZDM1YzBmMDQwNjYyZWQzMzkxYWM1NTUzYWVkNmRhNzc2MmVjYjp7ImZhY2Vib29rX3N0YXRlIjoiWTlMYWo4UG5mU1puNzRNczY5UExBOTY2WFFNbEQ5dlciLCJzb2NpYWxfYXV0aF9sYXN0X2xvZ2luX2JhY2tlbmQiOiJmYWNlYm9vayIsIl9hdXRoX3VzZXJfaGFzaCI6IjRmZGM0ZTQ2Y2UzMmQzYTVhOWU4OGQxY2RmMTAxMTg1NzA5ODk1N2UiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJzb2NpYWwuYmFja2VuZHMuZmFjZWJvb2suRmFjZWJvb2tPQXV0aDIiLCJfYXV0aF91c2VyX2lkIjo1fQ==','2015-12-27 14:46:19'),('ypgkopy0b5ms12cijqc248rddx6i5x4w','MzRlYzRkZTkxYjJjNDdlYjkzNWM3ZjNjMGYzZTg2NjM1MWYzM2JkZjp7ImZhY2Vib29rX3N0YXRlIjoiZlFlYXBQMnFvMDRCRmcyOE5Ybkxkc1I0MFdSVU04MlkifQ==','2015-12-31 03:35:53'),('z6r4uf8zgiqe36cti6wx1hyb911njdw8','NDFiZWNiOWQ4MWIyN2ZiZGIyNmQ3OWE5NzIxZmZiYjY3NDg3NTQyOTp7ImZhY2Vib29rX3N0YXRlIjoiTHVHUklTaE1FT3FhU3hyczlBRW1EQ3dsUGg0dFNMVnUiLCJzb2NpYWxfYXV0aF9sYXN0X2xvZ2luX2JhY2tlbmQiOiJmYWNlYm9vayIsIl9hdXRoX3VzZXJfaGFzaCI6IjUwMWI4ZGMwM2U5N2YwZDk1NWU4NjFiMTZlNTRlYTUyMmUxYjRlODciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJzb2NpYWwuYmFja2VuZHMuZmFjZWJvb2suRmFjZWJvb2tPQXV0aDIiLCJfYXV0aF91c2VyX2lkIjo3fQ==','2015-11-29 05:06:13'),('z9w22p8khdh1c9z5ecuhfhplf0iejl2f','OGNmZWFiNjFiNTM0NzhiMWEwYTlmMTUyMTM2MTQ5MzljZWRiYmYyNDp7fQ==','2016-03-06 06:18:34');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inicio_cronograma`
--

DROP TABLE IF EXISTS `inicio_cronograma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inicio_cronograma` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha_inicio` date NOT NULL,
  `Conclucion` date NOT NULL,
  `Detalle` longtext NOT NULL,
  `fecha_publicacion` datetime NOT NULL,
  `Usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `inicio_cronograma_ae6be32e` (`Usuario_id`),
  CONSTRAINT `inicio_cronograma_Usuario_id_3e4b95f3_fk_auth_user_id` FOREIGN KEY (`Usuario_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inicio_cronograma`
--

LOCK TABLES `inicio_cronograma` WRITE;
/*!40000 ALTER TABLE `inicio_cronograma` DISABLE KEYS */;
INSERT INTO `inicio_cronograma` VALUES (2,'2015-11-17','2015-11-30','de esta manera','2016-01-05 05:19:24',1),(3,'2015-10-01','2016-02-29','Inspeciones a Intarnet','2015-12-15 17:07:31',1);
/*!40000 ALTER TABLE `inicio_cronograma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `negocio_categoria`
--

DROP TABLE IF EXISTS `negocio_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `negocio_categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(50) NOT NULL,
  `fecha_registro` datetime NOT NULL,
  `atencion` varchar(100) DEFAULT NULL,
  `dias` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `negocio_categoria_categoria_55ab69fa_uniq` (`categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `negocio_categoria`
--

LOCK TABLES `negocio_categoria` WRITE;
/*!40000 ALTER TABLE `negocio_categoria` DISABLE KEYS */;
INSERT INTO `negocio_categoria` VALUES (1,'Salones de Baile Popuares','2016-01-24 00:01:12','Noche de 20:00 pm A 03:00 am','lunes'),(3,'Cafe Internet','2016-01-23 23:55:59','Noche de 20:00 pm A 03:00 am','lunes'),(4,'Restauran','2016-01-23 23:36:38','Dia de 08:00 am A 20:00 pm','Lunes,Martes,Jueves,Domingo'),(5,'Wisqueria','2016-01-23 23:26:29','Noche de 20:00 pm A 03:00 am','Viernes,Sabado,Domingo');
/*!40000 ALTER TABLE `negocio_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `negocio_cobro`
--

DROP TABLE IF EXISTS `negocio_cobro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `negocio_cobro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `monto` double NOT NULL,
  `fecha` datetime NOT NULL,
  `idNotificacion_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `negocio_cobro_idNotificacion_id_e7d79a6_uniq` (`idNotificacion_id`),
  KEY `negocio_cobro_364e220d` (`idNotificacion_id`),
  CONSTRAINT `negocio_cobro_idNotificacion_id_e7d79a6_fk_negocio_multa_id` FOREIGN KEY (`idNotificacion_id`) REFERENCES `negocio_multa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `negocio_cobro`
--

LOCK TABLES `negocio_cobro` WRITE;
/*!40000 ALTER TABLE `negocio_cobro` DISABLE KEYS */;
INSERT INTO `negocio_cobro` VALUES (1,150,'2015-12-14 11:57:13',1),(2,300,'2016-01-01 22:29:24',3),(3,400,'2016-01-15 17:48:11',5),(7,300,'2016-01-25 05:12:55',9),(9,400,'2016-01-25 05:15:14',8);
/*!40000 ALTER TABLE `negocio_cobro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `negocio_multa`
--

DROP TABLE IF EXISTS `negocio_multa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `negocio_multa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hora` varchar(12) NOT NULL,
  `fecha_notificacion` datetime NOT NULL,
  `descripcion` longtext NOT NULL,
  `Codigo` int(11) NOT NULL,
  `fecha_presentacion` date NOT NULL,
  `Usuario` varchar(100) NOT NULL,
  `idUser` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  `activo` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `negocio_multa`
--

LOCK TABLES `negocio_multa` WRITE;
/*!40000 ALTER TABLE `negocio_multa` DISABLE KEYS */;
INSERT INTO `negocio_multa` VALUES (1,'13:59:59','2015-12-14 11:53:57','effffffff',1,'2015-12-15','javier',2,1,0),(2,'12:00','2016-02-21 05:08:33','holas senonoanosansas',2,'2015-12-14','javier',2,1,0),(3,'01:59','2015-12-14 12:52:08','eededed',2,'2015-12-15','javier',2,1,0),(4,'11:00','2015-12-16 06:41:50','Mañana de esta Forma aprenderá a hacer mas Cuidadozo',19,'2015-12-16','javier',2,1,0),(5,'13:59','2015-12-16 07:45:34','Ocupacion Via Pública ',19,'2015-12-22','javier',2,1,0),(6,'11:00','2015-12-17 04:06:35','En este negocio se encontro mucha falta de haceó',19,'2015-12-17','javier',2,1,0),(8,'02:00','2016-01-25 05:17:55','buenas tardes amigo',3,'2016-01-08','juan',1,1,0),(9,'13:59:59','2016-01-08 21:39:11','cmbio la talna notifiaacion',3,'2016-01-08','juan',1,1,1);
/*!40000 ALTER TABLE `negocio_multa` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `UdateNotificaciones` AFTER UPDATE ON `negocio_multa` FOR EACH ROW INSERT INTO usuario_updatenotificaciones 
(usuario, descripcion) 
VALUES (user( ), 
CONCAT('Se modificó el registro ','(',
OLD.hora,',', OLD.fecha_notificacion,',',OLD.descripcion,',',
OLD.Codigo,',',OLD.fecha_presentacion,',', OLD.Usuario,',',OLD.idUser,',',OLD.estado,') por ',
'(', NEW.hora,',',NEW.fecha_notificacion,',', NEW.descripcion,',',NEW.Codigo,',',
NEW.fecha_presentacion,',', NEW.Usuario,',',NEW.idUser,',',NEW.estado,')')) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `DeleteNotificacion` BEFORE DELETE ON `negocio_multa` FOR EACH ROW INSERT INTO usuario_updatenotificaciones 
(usuario, descripcion) 
VALUES (user( ), 
CONCAT('Se Elimino el registro ','(',
OLD.hora,',', OLD.fecha_notificacion,',',OLD.descripcion,',',
OLD.Codigo,',',OLD.fecha_presentacion,',', OLD.Usuario,',',OLD.idUser,',',OLD.estado,')')) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `negocio_negocio`
--

DROP TABLE IF EXISTS `negocio_negocio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `negocio_negocio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `propietario` varchar(100) NOT NULL,
  `memorial_apertura` varchar(20) NOT NULL,
  `resolucion_municipal` varchar(20) NOT NULL,
  `direccion` varchar(80) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `fecha_registro` datetime NOT NULL,
  `estadoD` int(11) NOT NULL,
  `estadoN` int(11) NOT NULL,
  `qr` varchar(200) DEFAULT NULL,
  `activo` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `negocio_negocio_daf3833b` (`categoria_id`),
  KEY `negocio_negocio_e8701ad4` (`user_id`),
  CONSTRAINT `negocio_negocio_categoria_id_109411b8_fk_negocio_categoria_id` FOREIGN KEY (`categoria_id`) REFERENCES `negocio_categoria` (`id`),
  CONSTRAINT `negocio_negocio_user_id_56a8e205_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `negocio_negocio`
--

LOCK TABLES `negocio_negocio` WRITE;
/*!40000 ALTER TABLE `negocio_negocio` DISABLE KEYS */;
INSERT INTO `negocio_negocio` VALUES (1,'Fernandez','Si','Si','Bustillos',1,1,'2015-12-16 07:32:21',0,0,'http://localhost:9595/media/QR_Fernandez_Cod_1.svg',1),(2,'Ramirez','No','Si','La Paz',1,1,'2016-01-22 04:42:30',1,0,'http://localhost:9595/media/QR_Ramirez_Cod_2.svg',0),(3,'Martinez','Si','Si','Bustillos',3,1,'2015-12-17 03:29:22',0,0,'http://localhost:9595/media/QR_Martinez_Cod_3.svg',0),(11,'kelos','Si','Si','Bolivar',1,1,'2015-12-01 04:57:31',0,0,NULL,0),(19,'Mary','Si','Si','Marcado Uyuni',3,1,'2015-12-14 17:56:49',0,0,'http://localhost:9595/media/QR_Mary_Cod_19.svg',1),(20,'Romero','Si','Si','AV. Pando',3,1,'2015-12-15 06:25:38',0,0,'http://localhost:9595/media/QR_Romero_Cod_20.svg',1),(21,'Nuñes Saavedra','Si','Si','Final Ciicunvalacion #88',3,1,'2015-12-16 06:43:28',0,0,NULL,1),(22,'Nuñes ó Paríz','Si','Si','Final Circunvalacion #88',3,1,'2015-12-16 06:52:07',1,0,'http://localhost:9595/media/QR_Nuñes_Cod_22.svg',1),(23,'Aguirre','No','Si','Av los Ilustrez Nro 454-20',1,1,'2015-12-16 07:30:13',0,0,'http://localhost:9595/media/QR_Aguirre_Cod_23.svg',1),(24,'Geronimo','Si','No','Marcado Uyuni',1,1,'2016-01-22 04:14:40',1,0,'http://localhost:9595/media/QR_Geronimo_Cod_24.svg',0),(25,'Rodriguez','Si','Si','Av. Litoral #458',3,1,'2016-01-04 03:17:19',1,0,'http://localhost:9595/media/QR_Rodriguez_Cod_25.svg',1);
/*!40000 ALTER TABLE `negocio_negocio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_association`
--

DROP TABLE IF EXISTS `social_auth_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_association` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `secret` varchar(255) NOT NULL,
  `issued` int(11) NOT NULL,
  `lifetime` int(11) NOT NULL,
  `assoc_type` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_association`
--

LOCK TABLES `social_auth_association` WRITE;
/*!40000 ALTER TABLE `social_auth_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_code`
--

DROP TABLE IF EXISTS `social_auth_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(75) DEFAULT NULL,
  `code` varchar(32) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_code_email_2fa81c4a_uniq` (`email`,`code`),
  KEY `social_auth_code_c1336794` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_code`
--

LOCK TABLES `social_auth_code` WRITE;
/*!40000 ALTER TABLE `social_auth_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_nonce`
--

DROP TABLE IF EXISTS `social_auth_nonce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_nonce` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `salt` varchar(65) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_nonce_server_url_687b9c4c_uniq` (`server_url`,`timestamp`,`salt`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_nonce`
--

LOCK TABLES `social_auth_nonce` WRITE;
/*!40000 ALTER TABLE `social_auth_nonce` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_nonce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_usersocialauth`
--

DROP TABLE IF EXISTS `social_auth_usersocialauth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_usersocialauth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(32) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_usersocialauth_provider_1d3b5e05_uniq` (`provider`,`uid`),
  KEY `social_auth_usersocialauth_e8701ad4` (`user_id`),
  CONSTRAINT `social_auth_usersocialauth_user_id_77fafd4e_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_usersocialauth`
--

LOCK TABLES `social_auth_usersocialauth` WRITE;
/*!40000 ALTER TABLE `social_auth_usersocialauth` DISABLE KEYS */;
INSERT INTO `social_auth_usersocialauth` VALUES (1,'facebook','701712259940342','{\"access_token\": \"CAAH5kDqlJ4YBAGcnyvWrDfnybYJZAfZA3JQQeKOyYDS6u3v3Aaqr3ZAZCnFeO6r3Wna9tWCYI7yFNFh97zkYkOEomnRDTJffSd6Vpba09g5JASovT8ZBWbmPZC2KoWTaAtpToEVS5fYB1c2GDtM9B2PePlpdfcK50mKzeBtWC2Aipg2uEGy2YzooZAc7DoZB5657LoVcRR4FFgZDZD\", \"expires\": null, \"id\": \"701712259940342\"}',4),(2,'facebook','1429969843973974','{\"access_token\": \"CAAH5kDqlJ4YBAPam0bai5GXo2ym1VmY14N6ZCwAZC98REhGbC4d7ka6AclSNCmOKRuVXWaB70AJB4qgFDAUTfGBuvV775zZCNY5oggZBJYJJz9tC9ObaoBHVnmnjmfXE0KQqIbZA5U4aBOTrCdloyNkDfV1XbMDZBslK3sxJZC9nV1HEgBdHrrWpZAT6dZA5ZAej4ZD\", \"expires\": null, \"id\": \"1429969843973974\"}',5);
/*!40000 ALTER TABLE `social_auth_usersocialauth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_cambiosnotificaciones`
--

DROP TABLE IF EXISTS `usuario_cambiosnotificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_cambiosnotificaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) NOT NULL,
  `descripcion` longtext NOT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_cambiosnotificaciones`
--

LOCK TABLES `usuario_cambiosnotificaciones` WRITE;
/*!40000 ALTER TABLE `usuario_cambiosnotificaciones` DISABLE KEYS */;
INSERT INTO `usuario_cambiosnotificaciones` VALUES (1,'root@localhost','Se modificó el registro (javier,2015-12-10 15:55:21,Horario No Establecido,1,2,cm   as sasasas) por (javier,2015-12-10 15:55:21,Horario No Establecido,1,2,cm   as sasasas)','0000-00-00 00:00:00'),(2,'root@localhost','Se Elimino el registro (FernandoChoque,2015-11-20 06:32:19,Denuncia por corrupcion,2,5,comosmas van???????)','0000-00-00 00:00:00'),(3,'root@localhost','Se Elimino el registro (FernandoChoque,2015-11-20 06:35:27,Denuncia por corrupcion,2,5,nonixnsxsxsxx)','0000-00-00 00:00:00'),(4,'root@localhost','Se Elimino el registro (FernandoChoque,2015-11-20 06:46:44,Maltratos,2,5,asiaisisiasis)','0000-00-00 00:00:00'),(5,'root@localhost','Se Elimino el registro (FernandoChoque,2015-11-21 05:58:24,Denuncia por corrupcion,2,5,una denunca por corruccion)','0000-00-00 00:00:00'),(6,'root@localhost','Se Elimino el registro (FernandoChoque,2015-11-21 18:09:55,Horario No Establecido,2,13,andoasnod aaspo akisssss)','0000-00-00 00:00:00'),(7,'root@localhost','Se Elimino el registro (JuanJavierLimachi,2015-11-21 21:17:31,Denuncia por corrupcion,2,17,una denuncas amogos)','0000-00-00 00:00:00'),(8,'root@localhost','Se Elimino el registro (javier,2015-11-28 03:59:02,Falta de Higiene,3,2,muuy biej dnas aadiaid)','0000-00-00 00:00:00'),(9,'root@localhost','Se Elimino el registro (JuanJavierLimachi,2015-11-28 04:47:40,Denuncia por corrupcion,2,20,buas tardes amigos)','0000-00-00 00:00:00'),(10,'root@localhost','Se Elimino el registro (JuanJavierLimachi,2015-11-28 04:51:47,xx,2,20,cuanoasnasoasnosnas)','0000-00-00 00:00:00'),(11,'root@localhost','Se Elimino el registro (JuanJavierLimachi,2015-11-28 04:56:33,Horario No Establecido,2,20,oasaos ya pues)','0000-00-00 00:00:00'),(12,'root@localhost','Se Elimino el registro (FernandoChoque,2015-11-28 04:57:05,Denuncia por corrupcion,2,19,niaiaibaaiacccc dc)','0000-00-00 00:00:00'),(13,'root@localhost','Se Elimino el registro (JuanJavierLimachi,2015-11-29 05:50:42,Denuncia por corrupcion,3,20,mi conondoanaonad)','0000-00-00 00:00:00'),(14,'root@localhost','Se Elimino el registro (javier,2015-12-08 17:11:41,Maltratos,1,2,Maltrador infaltriles)','0000-00-00 00:00:00'),(15,'root@localhost','Se Elimino el registro (FernandoChoque,2015-11-29 05:54:07,Reclamo,2,19,raclasmoas aamigosoxxxxx)','0000-00-00 00:00:00'),(16,'root@localhost','Se Elimino el registro (juan,2015-12-05 23:35:29,Falta de Higiene,4,1,atendido publico en genral)','0000-00-00 00:00:00'),(17,'root@localhost','Se Elimino el registro (javier,2015-12-10 15:55:21,Horario No Establecido,1,2,cm   as sasasas)','0000-00-00 00:00:00'),(18,'root@localhost','Se modificó el registro (JuanJavierLimachi,2015-12-13 17:21:47,Horario No Establecido,1,5,nunas nas un mas denuncas) por (JuanJavierLimachi,2015-12-13 17:21:47,Horario No Establecido,1,5,nunas nas un mas denuncas)','0000-00-00 00:00:00'),(19,'root@localhost','Se Elimino el registro (JuanJavierLimachi,2015-12-13 17:14:14,Horario No Establecido,1,5,esta nunasnsnasibbasas)','0000-00-00 00:00:00'),(20,'root@localhost','Se Elimino el registro (JuanJavierLimachi,2015-12-13 17:21:47,Horario No Establecido,1,5,nunas nas un mas denuncas)','0000-00-00 00:00:00'),(21,'root@localhost','Se Elimino el registro (JuanJavierLimachi,2015-12-13 17:42:00,Falta de Higiene,1,5,muchas talta de higene en el lugar)','0000-00-00 00:00:00'),(22,'root@localhost','Se Elimino el registro (javier,2015-12-13 17:51:47,Falta de Higiene,1,2,bunas nochas)','0000-00-00 00:00:00'),(23,'root@localhost','Se Elimino el registro (FernandoChoque,2015-12-13 17:54:35,Horario No Establecido,1,6,buas cuas conlaneros)','0000-00-00 00:00:00'),(24,'root@localhost','Se Elimino el registro (javier,2015-12-13 18:01:04,Licencia vecida,1,2,no cuenta con una la licencia vigente)','0000-00-00 00:00:00'),(25,'root@localhost','Se Elimino el registro (JuanJavierLimachi,2015-12-13 18:02:17,Maltratos,1,5,maltrados  a los cliente es ss)','0000-00-00 00:00:00'),(26,'root@localhost','Se modificó el registro (javier,2015-12-16 06:39:11,Falta de Higiene,20,2,Mañana de esta forma Aprenderá a realizar mejór el trabajo) por (javier,2015-12-16 06:39:11,Falta de Higiene,20,2,Mañana de esta forma Aprenderá a realizar mejór el trabajo)','0000-00-00 00:00:00'),(27,'root@localhost','Se modificó el registro (JuanJavierLimachi,2015-12-16 07:42:08,Licencia vencida,22,4,Tiene la Licencia Caducada por favor mas Atención) por (JuanJavierLimachi,2015-12-16 07:42:08,Licencia vencida,22,4,Tiene la Licencia Caducada por favor mas Atención)','0000-00-00 00:00:00'),(28,'root@localhost','Se modificó el registro (JuanJavierLimachi,2015-12-17 03:54:54,Falta de Higiene,19,4,Esta Mañana ví mucho falta de higiene en el marcado uyuni po favor controlar el lugar) por (JuanJavierLimachi,2015-12-17 03:54:54,Falta de Higiene,19,4,Esta Mañana ví mucho falta de higiene en el marcado uyuni po favor controlar el lugar)','0000-00-00 00:00:00'),(29,'root@localhost','Se modificó el registro (JuanJavierLimachi,2015-12-17 03:54:54,Falta de Higiene,19,4,Esta Mañana ví mucho falta de higiene en el marcado uyuni po favor controlar el lugar) por (JuanJavierLimachi,2015-12-17 03:54:54,Falta de Higiene,19,4,Esta Mañana ví mucho falta de higiene en el marcado uyuni po favor controlar el lugar)','0000-00-00 00:00:00'),(30,'root@localhost','Se modificó el registro (JuanJavierLimachi,2015-12-17 04:12:14,Horario No Establecido,19,4,Exdese De lás horas en las mañanas ) por (JuanJavierLimachi,2015-12-17 04:12:14,Horario No Establecido,19,4,Exdese De lás horas en las mañanas )','0000-00-00 00:00:00'),(31,'root@localhost','Se Elimino el registro (javier,2015-12-16 06:39:11,Falta de Higiene,20,2,Mañana de esta forma Aprenderá a realizar mejór el trabajo)','0000-00-00 00:00:00'),(32,'root@localhost','Se modificó el registro (javier,2016-01-04 04:42:20,Maltratos,25,2,nuovas denucnias intendente) por (javier,2016-01-04 04:42:20,Maltratos,25,2,nuovas denucnias intendente)','0000-00-00 00:00:00'),(33,'root@localhost','Se modificó el registro (FernandoChoque,2015-12-17 04:08:59,Maltratos,2,5,Maltratos a los clientes hoy en día) por (FernandoChoque,2015-12-17 04:08:59,Maltratos,2,5,Maltratos a los clientes hoy en día)','0000-00-00 00:00:00'),(34,'root@localhost','Se modificó el registro (FernandoChoque,2015-12-17 04:08:59,Maltratos,2,5,Maltratos a los clientes hoy en día) por (FernandoChoque,2015-12-17 04:08:59,Maltratos,2,5,Maltratos a los clientes hoy en día)','0000-00-00 00:00:00'),(35,'root@localhost','Se modificó el registro (JuanJavierLimachi,2015-12-17 04:12:14,Horario No Establecido,19,4,Exdese De lás horas en las mañanas ) por (JuanJavierLimachi,2015-12-17 04:12:14,Horario No Establecido,19,4,Exdese De lás horas en las mañanas )','0000-00-00 00:00:00'),(36,'root@localhost','Se modificó el registro (FernandoChoque,2015-12-17 04:08:59,Maltratos,2,5,Maltratos a los clientes hoy en día) por (FernandoChoque,2015-12-17 04:08:59,Maltratos,2,5,Maltratos a los clientes hoy en día)','0000-00-00 00:00:00'),(37,'root@localhost','Se modificó el registro (JuanJavierLimachi,2015-12-17 04:12:14,Horario No Establecido,19,4,Exdese De lás horas en las mañanas ) por (JuanJavierLimachi,2015-12-17 04:12:14,Horario No Establecido,19,4,Exdese De lás horas en las mañanas )','0000-00-00 00:00:00'),(38,'root@localhost','Se modificó el registro (JuanJavierLimachi,2015-12-17 03:54:54,Falta de Higiene,19,4,Esta Mañana ví mucho falta de higiene en el marcado uyuni po favor controlar el lugar) por (JuanJavierLimachi,2015-12-17 03:54:54,Falta de Higiene,19,4,Esta Mañana ví mucho falta de higiene en el marcado uyuni po favor controlar el lugar)','0000-00-00 00:00:00'),(39,'root@localhost','Se modificó el registro (JuanJavierLimachi,2015-12-16 07:42:08,Licencia vencida,22,4,Tiene la Licencia Caducada por favor mas Atención) por (JuanJavierLimachi,2015-12-16 07:42:08,Licencia vencida,22,4,Tiene la Licencia Caducada por favor mas Atención)','0000-00-00 00:00:00'),(40,'root@localhost','Se modificó el registro (juan,2016-01-08 19:31:05,Falta de Higiene,19,1,nueva denuncia) por (juan,2016-01-08 19:31:05,Falta de Higiene,19,1,nueva denuncia)','0000-00-00 00:00:00'),(41,'root@localhost','Se modificó el registro (juan,2016-01-08 19:31:05,Falta de Higiene,19,1,nueva denuncia) por (juan,2016-01-08 19:50:02,Reclamo,19,1,nueva denuncia)','0000-00-00 00:00:00'),(42,'root@localhost','Se modificó el registro (juan,2016-01-08 19:50:02,Reclamo,19,1,nueva denuncia) por (juan,2016-01-08 19:50:11,Horario No Establecido,19,1,nueva denuncia)','0000-00-00 00:00:00'),(43,'root@localhost','Se modificó el registro (juan,2016-01-08 19:50:11,Horario No Establecido,19,1,nueva denuncia) por (juan,2016-01-08 19:50:11,Horario No Establecido,19,1,nueva denuncia)','0000-00-00 00:00:00'),(44,'root@localhost','Se modificó el registro (juan,2016-01-08 19:50:11,Horario No Establecido,19,1,nueva denuncia) por (juan,2016-01-08 19:50:11,Horario No Establecido,19,1,nueva denuncia)','0000-00-00 00:00:00'),(45,'root@localhost','Se modificó el registro (javier,2016-01-04 04:42:20,Maltratos,25,2,nuovas denucnias intendente) por (javier,2016-01-04 04:42:20,Maltratos,25,2,nuovas denucnias intendente)','0000-00-00 00:00:00'),(46,'root@localhost','Se modificó el registro (juan,2016-01-08 19:50:11,Horario No Establecido,19,1,nueva denuncia) por (juan,2016-01-22 04:11:03,Horario No Establecido,19,1,nueva denuncia alcalde)','0000-00-00 00:00:00'),(47,'root@localhost','Se modificó el registro (juan,2016-01-22 04:11:03,Horario No Establecido,19,1,nueva denuncia alcalde) por (juan,2016-01-24 00:05:36,Horario No Establecido,19,1,nueva denuncia alcalde)','0000-00-00 00:00:00'),(48,'root@localhost','Se modificó el registro (juan,2016-01-24 00:05:36,Horario No Establecido,19,1,nueva denuncia alcalde) por (juan,2016-01-24 00:05:36,Horario No Establecido,19,1,nueva denuncia alcalde)','0000-00-00 00:00:00'),(49,'root@localhost','Se modificó el registro (juan,2016-01-24 00:05:36,Horario No Establecido,19,1,nueva denuncia alcalde) por (juan,2016-01-24 00:05:36,Horario No Establecido,19,1,nueva denuncia alcalde)','0000-00-00 00:00:00'),(50,'root@localhost','Se modificó el registro (juan,2016-01-24 00:05:36,Horario No Establecido,19,1,nueva denuncia alcalde) por (juan,2016-01-24 00:05:36,Horario No Establecido,19,1,nueva denuncia alcalde)','0000-00-00 00:00:00'),(51,'root@localhost','Se modificó el registro (juan,2016-01-24 00:05:36,Horario No Establecido,19,1,nueva denuncia alcalde) por (juan,2016-01-24 00:05:36,Horario No Establecido,19,1,nueva denuncia alcalde)','0000-00-00 00:00:00'),(52,'root@localhost','Se modificó el registro (juan,2016-01-24 00:05:36,Horario No Establecido,19,1,nueva denuncia alcalde) por (juan,2016-01-24 00:05:36,Horario No Establecido,19,1,nueva denuncia alcalde)','0000-00-00 00:00:00'),(53,'root@localhost','Se modificó el registro (juan,2016-01-24 00:05:36,Horario No Establecido,19,1,nueva denuncia alcalde) por (juan,2016-01-24 00:05:36,Horario No Establecido,19,1,nueva denuncia alcalde)','0000-00-00 00:00:00'),(54,'root@localhost','Se modificó el registro (juan,2016-01-24 00:05:36,Horario No Establecido,19,1,nueva denuncia alcalde) por (juan,2016-01-24 00:05:36,Horario No Establecido,19,1,nueva denuncia alcalde)','0000-00-00 00:00:00'),(55,'root@localhost','Se modificó el registro (juan,2016-01-24 00:05:36,Horario No Establecido,19,1,nueva denuncia alcalde) por (juan,2016-01-24 00:05:36,Horario No Establecido,19,1,nueva denuncia alcalde)','0000-00-00 00:00:00'),(56,'root@localhost','Se modificó el registro (juan,2016-01-24 00:05:36,Horario No Establecido,19,1,nueva denuncia alcalde) por (juan,2016-01-24 00:05:36,Horario No Establecido,19,1,nueva denuncia alcalde)','0000-00-00 00:00:00'),(57,'root@localhost','Se modificó el registro (juan,2016-01-24 00:05:36,Horario No Establecido,19,1,nueva denuncia alcalde) por (juan,2016-01-24 00:05:36,Horario No Establecido,19,1,nueva denuncia alcalde)','0000-00-00 00:00:00'),(58,'root@localhost','Se modificó el registro (juan,2016-01-24 00:05:36,Horario No Establecido,19,1,nueva denuncia alcalde) por (juan,2016-01-24 00:05:36,Horario No Establecido,19,1,nueva denuncia alcalde)','0000-00-00 00:00:00'),(59,'root@localhost','Se modificó el registro (juan,2016-01-24 00:05:36,Horario No Establecido,19,1,nueva denuncia alcalde) por (juan,2016-01-24 00:05:36,Horario No Establecido,19,1,nueva denuncia alcalde)','0000-00-00 00:00:00'),(60,'root@localhost','Se modificó el registro (juan,2016-01-24 00:05:36,Horario No Establecido,19,1,nueva denuncia alcalde) por (juan,2016-01-24 00:05:36,Horario No Establecido,19,1,nueva denuncia alcalde)','0000-00-00 00:00:00'),(61,'root@localhost','Se modificó el registro (juan,2016-01-24 00:05:36,Horario No Establecido,19,1,nueva denuncia alcalde) por (juan,2016-01-24 00:05:36,Horario No Establecido,19,1,nueva denuncia alcalde)','0000-00-00 00:00:00'),(62,'root@localhost','Se modificó el registro (juan,2016-01-24 00:05:36,Horario No Establecido,19,1,nueva denuncia alcalde) por (juan,2016-01-24 00:05:36,Horario No Establecido,19,1,nueva denuncia alcalde)','0000-00-00 00:00:00'),(63,'root@localhost','Se modificó el registro (juan,2016-01-24 00:05:36,Horario No Establecido,19,1,nueva denuncia alcalde) por (juan,2016-01-25 05:23:42,Horario No Establecido,19,1,Nueva denuncia alcalde)','0000-00-00 00:00:00'),(64,'root@localhost','Se modificó el registro (juan,2016-01-25 05:23:42,Horario No Establecido,19,1,Nueva denuncia alcalde) por (juan,2016-01-25 05:23:42,Horario No Establecido,19,1,Nueva denuncia alcalde)','0000-00-00 00:00:00'),(65,'root@localhost','Se modificó el registro (juan,2016-01-25 05:23:42,Horario No Establecido,19,1,Nueva denuncia alcalde) por (juan,2016-01-25 05:23:42,Horario No Establecido,19,1,Nueva denuncia alcalde)','0000-00-00 00:00:00'),(66,'root@localhost','Se modificó el registro (juan,2016-01-25 05:23:42,Horario No Establecido,19,1,Nueva denuncia alcalde) por (juan,2016-01-25 05:23:42,Horario No Establecido,19,1,Nueva denuncia alcalde)','0000-00-00 00:00:00'),(67,'root@localhost','Se modificó el registro (FernandoChoque,2015-12-17 04:08:59,Maltratos,2,5,Maltratos a los clientes hoy en día) por (FernandoChoque,2015-12-17 04:08:59,Maltratos,2,5,Maltratos a los clientes hoy en día)','0000-00-00 00:00:00'),(68,'root@localhost','Se modificó el registro (juan,2016-01-25 05:23:42,Horario No Establecido,19,1,Nueva denuncia alcalde) por (juan,2016-01-25 05:23:42,Horario No Establecido,19,1,Nueva denuncia alcalde)','0000-00-00 00:00:00'),(69,'root@localhost','Se modificó el registro (javier,2016-01-04 04:42:20,Maltratos,25,2,nuovas denucnias intendente) por (javier,2016-01-04 04:42:20,Maltratos,25,2,nuovas denucnias intendente)','0000-00-00 00:00:00'),(70,'root@localhost','Se modificó el registro (juan,2016-01-25 05:23:42,Horario No Establecido,19,1,Nueva denuncia alcalde) por (juan,2016-01-25 05:23:42,Horario No Establecido,19,1,Nueva denuncia alcalde)','0000-00-00 00:00:00'),(71,'root@localhost','Se modificó el registro (JuanJavierLimachi,2015-12-17 03:54:54,Falta de Higiene,19,4,Esta Mañana ví mucho falta de higiene en el marcado uyuni po favor controlar el lugar) por (JuanJavierLimachi,2015-12-17 03:54:54,Falta de Higiene,19,4,Esta Mañana ví mucho falta de higiene en el marcado uyuni po favor controlar el lugar)','0000-00-00 00:00:00'),(72,'root@localhost','Se modificó el registro (javier,2016-01-04 04:42:20,Maltratos,25,2,nuovas denucnias intendente) por (javier,2016-01-04 04:42:20,Maltratos,25,2,nuovas denucnias intendente)','0000-00-00 00:00:00'),(73,'root@localhost','Se modificó el registro (juan,2016-01-25 05:23:42,Horario No Establecido,19,1,Nueva denuncia alcalde) por (juan,2016-01-25 05:23:42,Horario No Establecido,19,1,Nueva denuncia alcalde)','0000-00-00 00:00:00'),(74,'root@localhost','Se modificó el registro (javier,2016-01-04 04:42:20,Maltratos,25,2,nuovas denucnias intendente) por (javier,2016-01-04 04:42:20,Maltratos,25,2,nuovas denucnias intendente)','0000-00-00 00:00:00'),(75,'root@localhost','Se modificó el registro (JuanJavierLimachi,2015-12-17 04:12:14,Horario No Establecido,19,4,Exdese De lás horas en las mañanas ) por (JuanJavierLimachi,2016-02-20 18:22:06,Horario No Establecido,19,4,Exdese De lás horas en las mañanas )','0000-00-00 00:00:00'),(76,'root@localhost','Se modificó el registro (JuanJavierLimachi,2016-02-20 19:23:00,Horario No Establecido,2,4,los horarios de deveriam ser an horas de la noche en este negocio) por (JuanJavierLimachi,2016-02-20 19:23:00,Horario No Establecido,2,4,los horarios de deveriam ser an horas de la noche en este negocio)','0000-00-00 00:00:00'),(77,'root@localhost','Se modificó el registro (FernandoChoque,2015-12-17 04:08:59,Maltratos,2,5,Maltratos a los clientes hoy en día) por (FernandoChoque,2015-12-17 04:08:59,Maltratos,2,5,Maltratos a los clientes hoy en día)','0000-00-00 00:00:00'),(78,'root@localhost','Se modificó el registro (JuanJavierLimachi,2016-02-20 19:23:00,Horario No Establecido,2,4,los horarios de deveriam ser an horas de la noche en este negocio) por (JuanJavierLimachi,2016-02-20 19:23:00,Horario No Establecido,2,4,los horarios de deveriam ser an horas de la noche en este negocio)','0000-00-00 00:00:00'),(79,'root@localhost','Se modificó el registro (FernandoChoque,2015-12-17 04:08:59,Maltratos,2,5,Maltratos a los clientes hoy en día) por (FernandoChoque,2015-12-17 04:08:59,Maltratos,2,5,Maltratos a los clientes hoy en día)','0000-00-00 00:00:00'),(80,'root@localhost','Se modificó el registro (JuanJavierLimachi,2016-02-20 19:23:00,Horario No Establecido,2,4,los horarios de deveriam ser an horas de la noche en este negocio) por (JuanJavierLimachi,2016-02-20 19:23:00,Horario No Establecido,2,4,los horarios de deveriam ser an horas de la noche en este negocio)','0000-00-00 00:00:00'),(81,'root@localhost','Se modificó el registro (JuanJavierLimachi,2016-02-20 19:23:00,Horario No Establecido,2,4,los horarios de deveriam ser an horas de la noche en este negocio) por (JuanJavierLimachi,2016-02-20 19:23:00,Horario No Establecido,2,4,los horarios de deveriam ser an horas de la noche en este negocio)','0000-00-00 00:00:00'),(82,'root@localhost','Se modificó el registro (juan,2016-01-25 05:23:42,Horario No Establecido,19,1,Nueva denuncia alcalde) por (juan,2016-01-25 05:23:42,Horario No Establecido,19,1,Nueva denuncia alcalde)','0000-00-00 00:00:00'),(83,'root@localhost','Se modificó el registro (javier,2016-02-21 04:57:07,Denuncia por corrupcion,24,2,Un nuevo negocio en en vencimineto) por (javier,2016-02-21 04:57:07,Denuncia por corrupcion,24,2,Un nuevo negocio en en vencimineto)','0000-00-00 00:00:00'),(84,'root@localhost','Se modificó el registro (javier,2016-02-21 04:57:07,Denuncia por corrupcion,24,2,Un nuevo negocio en en vencimineto) por (javier,2016-02-21 04:57:07,Denuncia por corrupcion,24,2,Un nuevo negocio en en vencimineto)','0000-00-00 00:00:00'),(85,'root@localhost','Se modificó el registro (javier,2016-01-04 04:42:20,Maltratos,25,2,nuovas denucnias intendente) por (javier,2016-01-04 04:42:20,Maltratos,25,2,nuovas denucnias intendente)','0000-00-00 00:00:00'),(86,'root@localhost','Se modificó el registro (JuanJavierLimachi,2016-02-20 18:22:06,Horario No Establecido,19,4,Exdese De lás horas en las mañanas ) por (JuanJavierLimachi,2016-02-20 18:22:06,Horario No Establecido,19,4,Exdese De lás horas en las mañanas )','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `usuario_cambiosnotificaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_perfiles`
--

DROP TABLE IF EXISTS `usuario_perfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_perfiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ci` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario_id` (`usuario_id`),
  UNIQUE KEY `usuario_perfiles_ci_15aca828_uniq` (`ci`),
  CONSTRAINT `usuario_perfiles_usuario_id_e836358_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_perfiles`
--

LOCK TABLES `usuario_perfiles` WRITE;
/*!40000 ALTER TABLE `usuario_perfiles` DISABLE KEYS */;
INSERT INTO `usuario_perfiles` VALUES (1,123456,2),(2,6653693,1),(3,567898888,3);
/*!40000 ALTER TABLE `usuario_perfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_seguimiento`
--

DROP TABLE IF EXISTS `usuario_seguimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_seguimiento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `neg_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_seguimiento_f1180c4b` (`neg_id`),
  KEY `usuario_seguimiento_e8701ad4` (`user_id`),
  CONSTRAINT `usuario_seguimiento_neg_id_49b9c964_fk_negocio_negocio_id` FOREIGN KEY (`neg_id`) REFERENCES `negocio_negocio` (`id`),
  CONSTRAINT `usuario_seguimiento_user_id_4d21e22c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_seguimiento`
--

LOCK TABLES `usuario_seguimiento` WRITE;
/*!40000 ALTER TABLE `usuario_seguimiento` DISABLE KEYS */;
INSERT INTO `usuario_seguimiento` VALUES (11,'2015-12-01 06:15:24',1,2),(12,'2015-12-01 06:48:54',2,2),(13,'2015-12-01 06:50:02',2,2),(14,'2015-12-01 06:51:10',2,2),(15,'2015-12-01 07:02:01',3,2),(16,'2015-12-01 07:02:58',3,2),(17,'2015-12-02 06:37:05',2,2),(18,'2015-12-02 15:17:05',2,2),(19,'2015-12-11 16:34:07',1,2),(20,'2015-12-13 14:39:44',1,2),(21,'2015-12-13 16:27:13',1,2),(22,'2015-12-13 16:47:33',1,2),(23,'2015-12-14 11:51:45',1,2),(24,'2015-12-14 12:22:46',1,2),(25,'2015-12-14 12:47:59',1,2),(26,'2015-12-16 07:44:39',19,2),(27,'2015-12-16 08:18:14',19,1),(28,'2015-12-17 03:36:32',19,2),(29,'2015-12-17 03:58:49',19,2),(30,'2015-12-17 04:14:51',20,2),(31,'2016-01-15 20:11:00',3,1),(32,'2016-02-20 18:19:14',24,1),(33,'2016-02-20 19:18:18',2,2),(34,'2016-02-20 19:20:09',19,2),(35,'2016-02-20 19:20:33',19,2);
/*!40000 ALTER TABLE `usuario_seguimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_updatenotificaciones`
--

DROP TABLE IF EXISTS `usuario_updatenotificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_updatenotificaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) NOT NULL,
  `descripcion` longtext NOT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_updatenotificaciones`
--

LOCK TABLES `usuario_updatenotificaciones` WRITE;
/*!40000 ALTER TABLE `usuario_updatenotificaciones` DISABLE KEYS */;
INSERT INTO `usuario_updatenotificaciones` VALUES (1,'root@localhost','Se modificó el registro (15:00:59,2015-12-11 17:16:46,unas nocotpee de alcalde,1,2015-10-28,juan,1,1) por (15:00:59,2015-12-11 17:16:46,unas nocotpee de alcalde,1,2015-10-28,juan,1,1)','0000-00-00 00:00:00'),(2,'root@localhost','Se modificó el registro (15:00:59,2015-12-11 17:16:46,unas nocotpee de alcalde,1,2015-10-28,juan,1,1) por (15:00:59,2015-12-11 17:16:46,unas nocotpee de alcalde,1,2015-10-28,juan,1,1)','0000-00-00 00:00:00'),(3,'root@localhost','Se modificó el registro (13:59:59,2015-12-08 17:45:47,juan javier lumachi,2,2015-12-03,javier,2,1) por (13:59:59,2015-12-08 17:45:47,juan javier lumachi,2,2015-12-03,javier,2,1)','0000-00-00 00:00:00'),(4,'root@localhost','Se modificó el registro (14:14:26,2015-11-25 04:23:45,controles,1,2015-11-25,edy,3,1) por (14:14:26,2015-11-25 04:23:45,controles,1,2015-11-25,edy,3,1)','0000-00-00 00:00:00'),(5,'root@localhost','Se modificó el registro (12:59:59,2015-12-10 14:50:01,comosmaosmasoas,1,2015-12-10,javier,2,1) por (12:59:59,2015-12-10 14:50:01,comosmaosmasoas,1,2015-12-10,javier,2,1)','0000-00-00 00:00:00'),(6,'root@localhost','Se modificó el registro (13:59:59,2015-12-08 17:45:47,juan javier lumachi,2,2015-12-03,javier,2,1) por (13:59:59,2015-12-08 17:45:47,juan javier lumachi,2,2015-12-03,javier,2,1)','0000-00-00 00:00:00'),(7,'root@localhost','Se modificó el registro (12:59:59,2015-12-10 14:50:01,comosmaosmasoas,1,2015-12-10,javier,2,1) por (12:59:59,2015-12-10 14:50:01,comosmaosmasoas,1,2015-12-10,javier,2,1)','0000-00-00 00:00:00'),(8,'root@localhost','Se modificó el registro (13:59,2015-12-01 06:51:50,aver desde aki,2,2015-11-30,javier,2,1) por (13:59,2015-12-01 06:51:50,aver desde aki,2,2015-11-30,javier,2,1)','0000-00-00 00:00:00'),(9,'root@localhost','Se Elimino el registro (06:15:25,2015-11-20 06:45:38,bunas nochesss,2,2015-11-20,javier,2,1)','0000-00-00 00:00:00'),(10,'root@localhost','Se Elimino el registro (04:50,2015-12-09 01:36:01,en la noches,2,2015-11-21,javier,2,1)','0000-00-00 00:00:00'),(11,'root@localhost','Se Elimino el registro (14:14:26,2015-11-25 04:23:45,controles,1,2015-11-25,edy,3,1)','0000-00-00 00:00:00'),(12,'root@localhost','Se Elimino el registro (00:00,2015-11-26 12:40:45,gggsgsggs,2,2015-11-05,javier,2,1)','0000-00-00 00:00:00'),(13,'root@localhost','Se Elimino el registro (14:00,2015-11-28 02:10:55,comaos es notificaciones,2,2015-11-28,javier,2,1)','0000-00-00 00:00:00'),(14,'root@localhost','Se Elimino el registro (15:00:59,2015-12-11 17:16:46,unas nocotpee de alcalde,1,2015-10-28,juan,1,1)','0000-00-00 00:00:00'),(15,'root@localhost','Se Elimino el registro (02:00,2015-11-28 03:09:40,amiosd s d del face,2,2015-11-28,javier,2,1)','0000-00-00 00:00:00'),(16,'root@localhost','Se Elimino el registro (13:59,2015-12-01 06:51:50,aver desde aki,2,2015-11-30,javier,2,1)','0000-00-00 00:00:00'),(17,'root@localhost','Se Elimino el registro (13:00,2015-12-01 07:03:34,comoe sss suiiiii,3,2015-12-02,javier,2,1)','0000-00-00 00:00:00'),(18,'root@localhost','Se Elimino el registro (13:59:59,2015-12-08 17:45:47,juan javier lumachi,2,2015-12-03,javier,2,1)','0000-00-00 00:00:00'),(19,'root@localhost','Se Elimino el registro (12:00:59,2015-12-06 03:45:54,a pevas ede,3,2015-12-06,javier,2,1)','0000-00-00 00:00:00'),(20,'root@localhost','Se Elimino el registro (13:59:59,2015-12-06 04:47:31,noas masa sno no mes,3,2015-12-20,javier,2,1)','0000-00-00 00:00:00'),(21,'root@localhost','Se Elimino el registro (12:59:59,2015-12-10 14:50:01,comosmaosmasoas,1,2015-12-10,javier,2,1)','0000-00-00 00:00:00'),(22,'root@localhost','Se Elimino el registro (13:59:59,2015-12-13 17:52:54,bubas nochas amis,1,2015-12-14,javier,2,0)','0000-00-00 00:00:00'),(23,'root@localhost','Se modificó el registro (13:59:59,2015-12-14 11:53:57,effffffff,1,2015-12-15,javier,2,0) por (13:59:59,2015-12-14 11:53:57,effffffff,1,2015-12-15,javier,2,1)','0000-00-00 00:00:00'),(24,'root@localhost','Se modificó el registro (01:59,2015-12-14 12:52:08,eededed,2,2015-12-15,javier,2,0) por (01:59,2015-12-14 12:52:08,eededed,2,2015-12-15,javier,2,1)','0000-00-00 00:00:00'),(25,'root@localhost','Se modificó el registro (13:59:59,2015-12-14 11:53:57,effffffff,1,2015-12-15,javier,2,1) por (13:59:59,2015-12-14 11:53:57,effffffff,1,2015-12-15,javier,2,1)','0000-00-00 00:00:00'),(26,'root@localhost','Se modificó el registro (13:59:59,2015-12-14 11:53:57,effffffff,1,2015-12-15,javier,2,1) por (13:59:59,2015-12-14 11:53:57,effffffff,1,2015-12-15,javier,2,1)','0000-00-00 00:00:00'),(27,'root@localhost','Se modificó el registro (13:59:59,2015-12-14 11:53:57,effffffff,1,2015-12-15,javier,2,1) por (13:59:59,2015-12-14 11:53:57,effffffff,1,2015-12-15,javier,2,1)','0000-00-00 00:00:00'),(28,'root@localhost','Se modificó el registro (01:59,2015-12-14 12:52:08,eededed,2,2015-12-15,javier,2,1) por (01:59,2015-12-14 12:52:08,eededed,2,2015-12-15,javier,2,1)','0000-00-00 00:00:00'),(29,'root@localhost','Se modificó el registro (01:59,2015-12-14 12:52:08,eededed,2,2015-12-15,javier,2,1) por (01:59,2015-12-14 12:52:08,eededed,2,2015-12-15,javier,2,1)','0000-00-00 00:00:00'),(30,'root@localhost','Se modificó el registro (12:00,2015-12-14 12:51:56,ededed,2,2015-12-14,javier,2,0) por (12:00,2015-12-14 12:51:56,ededed,2,2015-12-14,javier,2,1)','0000-00-00 00:00:00'),(31,'root@localhost','Se modificó el registro (01:59,2015-12-14 12:52:08,eededed,2,2015-12-15,javier,2,1) por (01:59,2015-12-14 12:52:08,eededed,2,2015-12-15,javier,2,1)','0000-00-00 00:00:00'),(32,'root@localhost','Se modificó el registro (12:00,2015-12-14 12:51:56,ededed,2,2015-12-14,javier,2,1) por (12:00,2015-12-14 12:51:56,ededed,2,2015-12-14,javier,2,1)','0000-00-00 00:00:00'),(33,'root@localhost','Se modificó el registro (13:59:59,2015-12-14 11:53:57,effffffff,1,2015-12-15,javier,2,1) por (13:59:59,2015-12-14 11:53:57,effffffff,1,2015-12-15,javier,2,1)','0000-00-00 00:00:00'),(34,'root@localhost','Se modificó el registro (01:59,2015-12-14 12:52:08,eededed,2,2015-12-15,javier,2,1) por (01:59,2015-12-14 12:52:08,eededed,2,2015-12-15,javier,2,1)','0000-00-00 00:00:00'),(35,'root@localhost','Se modificó el registro (01:59,2015-12-14 12:52:08,eededed,2,2015-12-15,javier,2,1) por (01:59,2015-12-14 12:52:08,eededed,2,2015-12-15,javier,2,1)','0000-00-00 00:00:00'),(36,'root@localhost','Se modificó el registro (01:59,2015-12-14 12:52:08,eededed,2,2015-12-15,javier,2,1) por (01:59,2015-12-14 12:52:08,eededed,2,2015-12-15,javier,2,1)','0000-00-00 00:00:00'),(37,'root@localhost','Se modificó el registro (01:59,2015-12-14 12:52:08,eededed,2,2015-12-15,javier,2,1) por (01:59,2015-12-14 12:52:08,eededed,2,2015-12-15,javier,2,1)','0000-00-00 00:00:00'),(38,'root@localhost','Se modificó el registro (13:59:59,2015-12-14 11:53:57,effffffff,1,2015-12-15,javier,2,1) por (13:59:59,2015-12-14 11:53:57,effffffff,1,2015-12-15,javier,2,1)','0000-00-00 00:00:00'),(39,'root@localhost','Se modificó el registro (12:00,2015-12-14 12:51:56,ededed,2,2015-12-14,javier,2,1) por (12:00,2015-12-14 12:51:56,ededed,2,2015-12-14,javier,2,1)','0000-00-00 00:00:00'),(40,'root@localhost','Se modificó el registro (01:59,2015-12-14 12:52:08,eededed,2,2015-12-15,javier,2,1) por (01:59,2015-12-14 12:52:08,eededed,2,2015-12-15,javier,2,1)','0000-00-00 00:00:00'),(41,'root@localhost','Se modificó el registro (13:59:59,2015-12-14 11:53:57,effffffff,1,2015-12-15,javier,2,1) por (13:59:59,2015-12-14 11:53:57,effffffff,1,2015-12-15,javier,2,1)','0000-00-00 00:00:00'),(42,'root@localhost','Se modificó el registro (13:59,2015-12-16 07:45:34,Ocupacion Via Pública ,19,2015-12-22,javier,2,0) por (13:59,2015-12-16 07:45:34,Ocupacion Via Pública ,19,2015-12-22,javier,2,1)','0000-00-00 00:00:00'),(43,'root@localhost','Se modificó el registro (01:59,2015-12-14 12:52:08,eededed,2,2015-12-15,javier,2,1) por (01:59,2015-12-14 12:52:08,eededed,2,2015-12-15,javier,2,1)','0000-00-00 00:00:00'),(44,'root@localhost','Se modificó el registro (13:59,2015-12-16 07:45:34,Ocupacion Via Pública ,19,2015-12-22,javier,2,1) por (13:59,2015-12-16 07:45:34,Ocupacion Via Pública ,19,2015-12-22,javier,2,1)','0000-00-00 00:00:00'),(45,'root@localhost','Se modificó el registro (11:00,2015-12-16 06:41:50,Mañana de esta Forma aprenderá a hacer mas Cuidadozo,19,2015-12-16,javier,2,0) por (11:00,2015-12-16 06:41:50,Mañana de esta Forma aprenderá a hacer mas Cuidadozo,19,2015-12-16,javier,2,1)','0000-00-00 00:00:00'),(46,'root@localhost','Se modificó el registro (13:59,2015-12-16 07:45:34,Ocupacion Via Pública ,19,2015-12-22,javier,2,1) por (13:59,2015-12-16 07:45:34,Ocupacion Via Pública ,19,2015-12-22,javier,2,1)','0000-00-00 00:00:00'),(47,'root@localhost','Se modificó el registro (11:00,2015-12-16 06:41:50,Mañana de esta Forma aprenderá a hacer mas Cuidadozo,19,2015-12-16,javier,2,1) por (11:00,2015-12-16 06:41:50,Mañana de esta Forma aprenderá a hacer mas Cuidadozo,19,2015-12-16,javier,2,1)','0000-00-00 00:00:00'),(48,'root@localhost','Se modificó el registro (13:59,2015-12-16 07:45:34,Ocupacion Via Pública ,19,2015-12-22,javier,2,1) por (13:59,2015-12-16 07:45:34,Ocupacion Via Pública ,19,2015-12-22,javier,2,1)','0000-00-00 00:00:00'),(49,'root@localhost','Se modificó el registro (01:59,2015-12-14 12:52:08,eededed,2,2015-12-15,javier,2,1) por (01:59,2015-12-14 12:52:08,eededed,2,2015-12-15,javier,2,1)','0000-00-00 00:00:00'),(50,'root@localhost','Se modificó el registro (01:59,2015-12-14 12:52:08,eededed,2,2015-12-15,javier,2,1) por (01:59,2015-12-14 12:52:08,eededed,2,2015-12-15,javier,2,1)','0000-00-00 00:00:00'),(51,'root@localhost','Se modificó el registro (12:00,2015-12-14 12:51:56,ededed,2,2015-12-14,javier,2,1) por (12:00,2015-12-14 12:51:56,ededed,2,2015-12-14,javier,2,1)','0000-00-00 00:00:00'),(52,'root@localhost','Se modificó el registro (11:00,2015-12-16 06:41:50,Mañana de esta Forma aprenderá a hacer mas Cuidadozo,19,2015-12-16,javier,2,1) por (11:00,2015-12-16 06:41:50,Mañana de esta Forma aprenderá a hacer mas Cuidadozo,19,2015-12-16,javier,2,1)','0000-00-00 00:00:00'),(53,'root@localhost','Se modificó el registro (01:59,2015-12-14 12:52:08,eededed,2,2015-12-15,javier,2,1) por (01:59,2015-12-14 12:52:08,eededed,2,2015-12-15,javier,2,1)','0000-00-00 00:00:00'),(54,'root@localhost','Se modificó el registro (11:00,2015-12-16 06:41:50,Mañana de esta Forma aprenderá a hacer mas Cuidadozo,19,2015-12-16,javier,2,1) por (11:00,2015-12-16 06:41:50,Mañana de esta Forma aprenderá a hacer mas Cuidadozo,19,2015-12-16,javier,2,1)','0000-00-00 00:00:00'),(55,'root@localhost','Se modificó el registro (01:59,2015-12-14 12:52:08,eededed,2,2015-12-15,javier,2,1) por (01:59,2015-12-14 12:52:08,eededed,2,2015-12-15,javier,2,1)','0000-00-00 00:00:00'),(56,'root@localhost','Se modificó el registro (11:00,2015-12-17 04:06:35,En este negocio se encontro mucha falta de haceó,19,2015-12-17,javier,2,0) por (11:00,2015-12-17 04:06:35,En este negocio se encontro mucha falta de haceó,19,2015-12-17,javier,2,1)','0000-00-00 00:00:00'),(57,'root@localhost','Se Elimino el registro (13:59:59,2016-01-08 19:28:14,nuevas notiicacion,19,2016-01-08,juan,1,0)','0000-00-00 00:00:00'),(58,'root@localhost','Se modificó el registro (01:00,2016-01-08 20:23:19,nuas tardes amigo,3,2016-01-08,juan,1,0) por (01:00,2016-01-08 20:23:19,nuas tardes amigo,3,2016-01-08,juan,1,1)','0000-00-00 00:00:00'),(59,'root@localhost','Se modificó el registro (13:59:59,2016-01-08 20:50:04,cmbio la talna notifiaacion,3,2016-01-08,juan,1,0) por (13:59:59,2016-01-08 20:50:04,cmbio la talna notifiaacion,3,2016-01-08,juan,1,0)','0000-00-00 00:00:00'),(60,'root@localhost','Se modificó el registro (13:59:59,2016-01-08 20:50:04,cmbio la talna notifiaacion,3,2016-01-08,juan,1,0) por (13:59:59,2016-01-08 20:50:04,cmbio la talna notifiaacion,3,2016-01-08,juan,1,0)','0000-00-00 00:00:00'),(61,'root@localhost','Se modificó el registro (13:59:59,2016-01-08 20:50:04,cmbio la talna notifiaacion,3,2016-01-08,juan,1,0) por (13:59:59,2016-01-08 20:50:04,cmbio la talna notifiaacion,3,2016-01-08,juan,1,0)','0000-00-00 00:00:00'),(62,'root@localhost','Se modificó el registro (13:59:59,2016-01-08 20:50:04,cmbio la talna notifiaacion,3,2016-01-08,juan,1,0) por (13:59:59,2016-01-08 20:50:04,cmbio la talna notifiaacion,3,2016-01-08,juan,1,0)','0000-00-00 00:00:00'),(63,'root@localhost','Se modificó el registro (13:59:59,2016-01-08 20:50:04,cmbio la talna notifiaacion,3,2016-01-08,juan,1,0) por (13:59:59,2016-01-08 20:50:04,cmbio la talna notifiaacion,3,2016-01-08,juan,1,0)','0000-00-00 00:00:00'),(64,'root@localhost','Se modificó el registro (01:00,2016-01-08 20:23:19,nuas tardes amigo,3,2016-01-08,juan,1,1) por (01:00,2016-01-08 20:23:19,nuas tardes amigo,3,2016-01-08,juan,1,1)','0000-00-00 00:00:00'),(65,'root@localhost','Se modificó el registro (13:59:59,2016-01-08 20:50:04,cmbio la talna notifiaacion,3,2016-01-08,juan,1,0) por (13:59:59,2016-01-08 21:16:00,cmbio la talna notifiaacion,3,2016-01-08,juan,1,0)','0000-00-00 00:00:00'),(66,'root@localhost','Se modificó el registro (01:00,2016-01-08 20:23:19,nuas tardes amigo,3,2016-01-08,juan,1,1) por (01:00,2016-01-08 21:16:08,nuas tardes amigo,3,2016-01-08,juan,1,1)','0000-00-00 00:00:00'),(67,'root@localhost','Se modificó el registro (13:59:59,2016-01-08 21:16:00,cmbio la talna notifiaacion,3,2016-01-08,juan,1,0) por (13:59:59,2016-01-08 21:16:00,cmbio la talna notifiaacion,3,2016-01-08,juan,1,0)','0000-00-00 00:00:00'),(68,'root@localhost','Se modificó el registro (01:00,2016-01-08 21:16:08,nuas tardes amigo,3,2016-01-08,juan,1,1) por (01:00,2016-01-08 21:16:08,nuas tardes amigo,3,2016-01-08,juan,1,1)','0000-00-00 00:00:00'),(69,'root@localhost','Se modificó el registro (13:59:59,2016-01-08 21:16:00,cmbio la talna notifiaacion,3,2016-01-08,juan,1,0) por (13:59:59,2016-01-08 21:35:30,cmbio la talna notifiaacion,3,2016-01-08,juan,1,0)','0000-00-00 00:00:00'),(70,'root@localhost','Se modificó el registro (13:59:59,2016-01-08 21:35:30,cmbio la talna notifiaacion,3,2016-01-08,juan,1,0) por (13:59:59,2016-01-08 21:35:30,cmbio la talna notifiaacion,3,2016-01-08,juan,1,0)','0000-00-00 00:00:00'),(71,'root@localhost','Se modificó el registro (01:00,2016-01-08 21:16:08,nuas tardes amigo,3,2016-01-08,juan,1,1) por (01:00,2016-01-08 21:39:04,nuas tardes amigo,3,2016-01-08,juan,1,1)','0000-00-00 00:00:00'),(72,'root@localhost','Se modificó el registro (13:59:59,2016-01-08 21:35:30,cmbio la talna notifiaacion,3,2016-01-08,juan,1,0) por (13:59:59,2016-01-08 21:39:11,cmbio la talna notifiaacion,3,2016-01-08,juan,1,0)','0000-00-00 00:00:00'),(73,'root@localhost','Se modificó el registro (13:59:59,2016-01-08 21:39:11,cmbio la talna notifiaacion,3,2016-01-08,juan,1,0) por (13:59:59,2016-01-08 21:39:11,cmbio la talna notifiaacion,3,2016-01-08,juan,1,0)','0000-00-00 00:00:00'),(74,'root@localhost','Se modificó el registro (13:59:59,2016-01-08 21:39:11,cmbio la talna notifiaacion,3,2016-01-08,juan,1,0) por (13:59:59,2016-01-08 21:39:11,cmbio la talna notifiaacion,3,2016-01-08,juan,1,1)','0000-00-00 00:00:00'),(75,'root@localhost','Se modificó el registro (13:59:59,2016-01-08 21:39:11,cmbio la talna notifiaacion,3,2016-01-08,juan,1,1) por (13:59:59,2016-01-08 21:39:11,cmbio la talna notifiaacion,3,2016-01-08,juan,1,1)','0000-00-00 00:00:00'),(76,'root@localhost','Se modificó el registro (01:00,2016-01-08 21:39:04,nuas tardes amigo,3,2016-01-08,juan,1,1) por (01:00,2016-01-08 21:39:04,nuas tardes amigo,3,2016-01-08,juan,1,1)','0000-00-00 00:00:00'),(77,'root@localhost','Se modificó el registro (01:00,2016-01-08 21:39:04,nuas tardes amigo,3,2016-01-08,juan,1,1) por (01:00,2016-01-08 21:39:04,nuas tardes amigo,3,2016-01-08,juan,1,1)','0000-00-00 00:00:00'),(78,'root@localhost','Se modificó el registro (13:59:59,2016-01-08 21:39:11,cmbio la talna notifiaacion,3,2016-01-08,juan,1,1) por (13:59:59,2016-01-08 21:39:11,cmbio la talna notifiaacion,3,2016-01-08,juan,1,1)','0000-00-00 00:00:00'),(79,'root@localhost','Se modificó el registro (01:00,2016-01-08 21:39:04,nuas tardes amigo,3,2016-01-08,juan,1,1) por (01:00,2016-01-08 21:39:04,nuas tardes amigo,3,2016-01-08,juan,1,1)','0000-00-00 00:00:00'),(80,'root@localhost','Se modificó el registro (13:59:59,2015-12-14 11:53:57,effffffff,1,2015-12-15,javier,2,1) por (13:59:59,2015-12-14 11:53:57,effffffff,1,2015-12-15,javier,2,1)','0000-00-00 00:00:00'),(81,'root@localhost','Se modificó el registro (13:59:59,2016-01-08 21:39:11,cmbio la talna notifiaacion,3,2016-01-08,juan,1,1) por (13:59:59,2016-01-08 21:39:11,cmbio la talna notifiaacion,3,2016-01-08,juan,1,1)','0000-00-00 00:00:00'),(82,'root@localhost','Se modificó el registro (13:59,2015-12-16 07:45:34,Ocupacion Via Pública ,19,2015-12-22,javier,2,1) por (13:59,2015-12-16 07:45:34,Ocupacion Via Pública ,19,2015-12-22,javier,2,1)','0000-00-00 00:00:00'),(83,'root@localhost','Se modificó el registro (11:00,2015-12-16 06:41:50,Mañana de esta Forma aprenderá a hacer mas Cuidadozo,19,2015-12-16,javier,2,1) por (11:00,2015-12-16 06:41:50,Mañana de esta Forma aprenderá a hacer mas Cuidadozo,19,2015-12-16,javier,2,1)','0000-00-00 00:00:00'),(84,'root@localhost','Se modificó el registro (11:00,2015-12-16 06:41:50,Mañana de esta Forma aprenderá a hacer mas Cuidadozo,19,2015-12-16,javier,2,1) por (11:00,2015-12-16 06:41:50,Mañana de esta Forma aprenderá a hacer mas Cuidadozo,19,2015-12-16,javier,2,1)','0000-00-00 00:00:00'),(85,'root@localhost','Se modificó el registro (11:00,2015-12-17 04:06:35,En este negocio se encontro mucha falta de haceó,19,2015-12-17,javier,2,1) por (11:00,2015-12-17 04:06:35,En este negocio se encontro mucha falta de haceó,19,2015-12-17,javier,2,1)','0000-00-00 00:00:00'),(86,'root@localhost','Se modificó el registro (13:59,2015-12-16 07:45:34,Ocupacion Via Pública ,19,2015-12-22,javier,2,1) por (13:59,2015-12-16 07:45:34,Ocupacion Via Pública ,19,2015-12-22,javier,2,1)','0000-00-00 00:00:00'),(87,'root@localhost','Se modificó el registro (11:00,2015-12-17 04:06:35,En este negocio se encontro mucha falta de haceó,19,2015-12-17,javier,2,1) por (11:00,2015-12-17 04:06:35,En este negocio se encontro mucha falta de haceó,19,2015-12-17,javier,2,1)','0000-00-00 00:00:00'),(88,'root@localhost','Se modificó el registro (01:59,2015-12-14 12:52:08,eededed,2,2015-12-15,javier,2,1) por (01:59,2015-12-14 12:52:08,eededed,2,2015-12-15,javier,2,1)','0000-00-00 00:00:00'),(89,'root@localhost','Se modificó el registro (01:00,2016-01-08 21:39:04,nuas tardes amigo,3,2016-01-08,juan,1,1) por (01:00,2016-01-08 21:39:04,nuas tardes amigo,3,2016-01-08,juan,1,1)','0000-00-00 00:00:00'),(90,'root@localhost','Se modificó el registro (11:00,2015-12-17 04:06:35,En este negocio se encontro mucha falta de haceó,19,2015-12-17,javier,2,1) por (11:00,2015-12-17 04:06:35,En este negocio se encontro mucha falta de haceó,19,2015-12-17,javier,2,1)','0000-00-00 00:00:00'),(91,'root@localhost','Se modificó el registro (13:59:59,2016-01-08 21:39:11,cmbio la talna notifiaacion,3,2016-01-08,juan,1,1) por (13:59:59,2016-01-08 21:39:11,cmbio la talna notifiaacion,3,2016-01-08,juan,1,1)','0000-00-00 00:00:00'),(92,'root@localhost','Se modificó el registro (01:00,2016-01-08 21:39:04,nuas tardes amigo,3,2016-01-08,juan,1,1) por (01:00,2016-01-08 21:39:04,nuas tardes amigo,3,2016-01-08,juan,1,1)','0000-00-00 00:00:00'),(93,'root@localhost','Se modificó el registro (13:59,2015-12-16 07:45:34,Ocupacion Via Pública ,19,2015-12-22,javier,2,1) por (13:59,2015-12-16 07:45:34,Ocupacion Via Pública ,19,2015-12-22,javier,2,1)','0000-00-00 00:00:00'),(94,'root@localhost','Se modificó el registro (13:59:59,2016-01-08 21:39:11,cmbio la talna notifiaacion,3,2016-01-08,juan,1,1) por (13:59:59,2016-01-08 21:39:11,cmbio la talna notifiaacion,3,2016-01-08,juan,1,1)','0000-00-00 00:00:00'),(95,'root@localhost','Se modificó el registro (01:00,2016-01-08 21:39:04,nuas tardes amigo,3,2016-01-08,juan,1,1) por (01:00,2016-01-08 21:39:04,nuas tardes amigo,3,2016-01-08,juan,1,1)','0000-00-00 00:00:00'),(96,'root@localhost','Se modificó el registro (11:00,2015-12-17 04:06:35,En este negocio se encontro mucha falta de haceó,19,2015-12-17,javier,2,1) por (11:00,2015-12-17 04:06:35,En este negocio se encontro mucha falta de haceó,19,2015-12-17,javier,2,1)','0000-00-00 00:00:00'),(97,'root@localhost','Se modificó el registro (13:59,2015-12-16 07:45:34,Ocupacion Via Pública ,19,2015-12-22,javier,2,1) por (13:59,2015-12-16 07:45:34,Ocupacion Via Pública ,19,2015-12-22,javier,2,1)','0000-00-00 00:00:00'),(98,'root@localhost','Se modificó el registro (13:59:59,2016-01-08 21:39:11,cmbio la talna notifiaacion,3,2016-01-08,juan,1,1) por (13:59:59,2016-01-08 21:39:11,cmbio la talna notifiaacion,3,2016-01-08,juan,1,1)','0000-00-00 00:00:00'),(99,'root@localhost','Se modificó el registro (01:00,2016-01-08 21:39:04,nuas tardes amigo,3,2016-01-08,juan,1,1) por (01:00,2016-01-08 21:39:04,nuas tardes amigo,3,2016-01-08,juan,1,1)','0000-00-00 00:00:00'),(100,'root@localhost','Se modificó el registro (13:59,2015-12-16 07:45:34,Ocupacion Via Pública ,19,2015-12-22,javier,2,1) por (13:59,2015-12-16 07:45:34,Ocupacion Via Pública ,19,2015-12-22,javier,2,1)','0000-00-00 00:00:00'),(101,'root@localhost','Se modificó el registro (11:00,2015-12-17 04:06:35,En este negocio se encontro mucha falta de haceó,19,2015-12-17,javier,2,1) por (11:00,2015-12-17 04:06:35,En este negocio se encontro mucha falta de haceó,19,2015-12-17,javier,2,1)','0000-00-00 00:00:00'),(102,'root@localhost','Se modificó el registro (13:59,2015-12-16 07:45:34,Ocupacion Via Pública ,19,2015-12-22,javier,2,1) por (13:59,2015-12-16 07:45:34,Ocupacion Via Pública ,19,2015-12-22,javier,2,1)','0000-00-00 00:00:00'),(103,'root@localhost','Se modificó el registro (13:59,2015-12-16 07:45:34,Ocupacion Via Pública ,19,2015-12-22,javier,2,1) por (13:59,2015-12-16 07:45:34,Ocupacion Via Pública ,19,2015-12-22,javier,2,1)','0000-00-00 00:00:00'),(104,'root@localhost','Se modificó el registro (01:00,2016-01-08 21:39:04,nuas tardes amigo,3,2016-01-08,juan,1,1) por (01:00,2016-01-08 21:39:04,nuas tardes amigo,3,2016-01-08,juan,1,1)','0000-00-00 00:00:00'),(105,'root@localhost','Se modificó el registro (01:00,2016-01-08 21:39:04,nuas tardes amigo,3,2016-01-08,juan,1,1) por (01:00,2016-01-08 21:39:04,nuas tardes amigo,3,2016-01-08,juan,1,1)','0000-00-00 00:00:00'),(106,'root@localhost','Se modificó el registro (01:00,2016-01-08 21:39:04,nuas tardes amigo,3,2016-01-08,juan,1,1) por (02:00,2016-01-22 04:11:23,nuas tardes amigo,3,2016-01-08,juan,1,1)','0000-00-00 00:00:00'),(107,'root@localhost','Se modificó el registro (02:00,2016-01-22 04:11:23,nuas tardes amigo,3,2016-01-08,juan,1,1) por (02:00,2016-01-22 04:11:23,nuas tardes amigo,3,2016-01-08,juan,1,1)','0000-00-00 00:00:00'),(108,'root@localhost','Se modificó el registro (02:00,2016-01-22 04:11:23,nuas tardes amigo,3,2016-01-08,juan,1,1) por (02:00,2016-01-22 04:11:23,nuas tardes amigo,3,2016-01-08,juan,1,1)','0000-00-00 00:00:00'),(109,'root@localhost','Se modificó el registro (02:00,2016-01-22 04:11:23,nuas tardes amigo,3,2016-01-08,juan,1,1) por (02:00,2016-01-22 04:11:23,nuas tardes amigo,3,2016-01-08,juan,1,1)','0000-00-00 00:00:00'),(110,'root@localhost','Se modificó el registro (02:00,2016-01-22 04:11:23,nuas tardes amigo,3,2016-01-08,juan,1,1) por (02:00,2016-01-22 04:11:23,nuas tardes amigo,3,2016-01-08,juan,1,1)','0000-00-00 00:00:00'),(111,'root@localhost','Se modificó el registro (02:00,2016-01-22 04:11:23,nuas tardes amigo,3,2016-01-08,juan,1,1) por (02:00,2016-01-22 04:11:23,nuas tardes amigo,3,2016-01-08,juan,1,1)','0000-00-00 00:00:00'),(112,'root@localhost','Se modificó el registro (02:00,2016-01-22 04:11:23,nuas tardes amigo,3,2016-01-08,juan,1,1) por (02:00,2016-01-22 04:11:23,nuas tardes amigo,3,2016-01-08,juan,1,1)','0000-00-00 00:00:00'),(113,'root@localhost','Se modificó el registro (02:00,2016-01-22 04:11:23,nuas tardes amigo,3,2016-01-08,juan,1,1) por (02:00,2016-01-22 04:11:23,nuas tardes amigo,3,2016-01-08,juan,1,1)','0000-00-00 00:00:00'),(114,'root@localhost','Se modificó el registro (02:00,2016-01-22 04:11:23,nuas tardes amigo,3,2016-01-08,juan,1,1) por (02:00,2016-01-22 04:11:23,nuas tardes amigo,3,2016-01-08,juan,1,1)','0000-00-00 00:00:00'),(115,'root@localhost','Se modificó el registro (02:00,2016-01-22 04:11:23,nuas tardes amigo,3,2016-01-08,juan,1,1) por (02:00,2016-01-22 04:11:23,nuas tardes amigo,3,2016-01-08,juan,1,1)','0000-00-00 00:00:00'),(116,'root@localhost','Se modificó el registro (02:00,2016-01-22 04:11:23,nuas tardes amigo,3,2016-01-08,juan,1,1) por (02:00,2016-01-22 04:11:23,nuas tardes amigo,3,2016-01-08,juan,1,1)','0000-00-00 00:00:00'),(117,'root@localhost','Se modificó el registro (13:59:59,2016-01-08 21:39:11,cmbio la talna notifiaacion,3,2016-01-08,juan,1,1) por (13:59:59,2016-01-08 21:39:11,cmbio la talna notifiaacion,3,2016-01-08,juan,1,1)','0000-00-00 00:00:00'),(118,'root@localhost','Se modificó el registro (13:59:59,2016-01-08 21:39:11,cmbio la talna notifiaacion,3,2016-01-08,juan,1,1) por (13:59:59,2016-01-08 21:39:11,cmbio la talna notifiaacion,3,2016-01-08,juan,1,1)','0000-00-00 00:00:00'),(119,'root@localhost','Se modificó el registro (02:00,2016-01-22 04:11:23,nuas tardes amigo,3,2016-01-08,juan,1,1) por (02:00,2016-01-22 04:11:23,nuas tardes amigo,3,2016-01-08,juan,1,1)','0000-00-00 00:00:00'),(120,'root@localhost','Se modificó el registro (02:00,2016-01-22 04:11:23,nuas tardes amigo,3,2016-01-08,juan,1,1) por (02:00,2016-01-22 04:11:23,nuas tardes amigo,3,2016-01-08,juan,1,1)','0000-00-00 00:00:00'),(121,'root@localhost','Se modificó el registro (13:59:59,2016-01-08 21:39:11,cmbio la talna notifiaacion,3,2016-01-08,juan,1,1) por (13:59:59,2016-01-08 21:39:11,cmbio la talna notifiaacion,3,2016-01-08,juan,1,1)','0000-00-00 00:00:00'),(122,'root@localhost','Se modificó el registro (02:00,2016-01-22 04:11:23,nuas tardes amigo,3,2016-01-08,juan,1,1) por (02:00,2016-01-22 04:11:23,nuas tardes amigo,3,2016-01-08,juan,1,1)','0000-00-00 00:00:00'),(123,'root@localhost','Se modificó el registro (13:59:59,2016-01-08 21:39:11,cmbio la talna notifiaacion,3,2016-01-08,juan,1,1) por (13:59:59,2016-01-08 21:39:11,cmbio la talna notifiaacion,3,2016-01-08,juan,1,1)','0000-00-00 00:00:00'),(124,'root@localhost','Se modificó el registro (02:00,2016-01-22 04:11:23,nuas tardes amigo,3,2016-01-08,juan,1,1) por (02:00,2016-01-22 04:11:23,nuas tardes amigo,3,2016-01-08,juan,1,1)','0000-00-00 00:00:00'),(125,'root@localhost','Se modificó el registro (02:00,2016-01-22 04:11:23,nuas tardes amigo,3,2016-01-08,juan,1,1) por (02:00,2016-01-22 04:11:23,nuas tardes amigo,3,2016-01-08,juan,1,1)','0000-00-00 00:00:00'),(126,'root@localhost','Se modificó el registro (02:00,2016-01-22 04:11:23,nuas tardes amigo,3,2016-01-08,juan,1,1) por (02:00,2016-01-22 04:11:23,nuas tardes amigo,3,2016-01-08,juan,1,1)','0000-00-00 00:00:00'),(127,'root@localhost','Se modificó el registro (02:00,2016-01-22 04:11:23,nuas tardes amigo,3,2016-01-08,juan,1,1) por (02:00,2016-01-25 05:17:55,buenas tardes amigo,3,2016-01-08,juan,1,1)','0000-00-00 00:00:00'),(128,'root@localhost','Se modificó el registro (13:59:59,2016-01-08 21:39:11,cmbio la talna notifiaacion,3,2016-01-08,juan,1,1) por (13:59:59,2016-01-08 21:39:11,cmbio la talna notifiaacion,3,2016-01-08,juan,1,1)','0000-00-00 00:00:00'),(129,'root@localhost','Se modificó el registro (02:00,2016-01-25 05:17:55,buenas tardes amigo,3,2016-01-08,juan,1,1) por (02:00,2016-01-25 05:17:55,buenas tardes amigo,3,2016-01-08,juan,1,1)','0000-00-00 00:00:00'),(130,'root@localhost','Se modificó el registro (11:00,2015-12-16 06:41:50,Mañana de esta Forma aprenderá a hacer mas Cuidadozo,19,2015-12-16,javier,2,1) por (11:00,2015-12-16 06:41:50,Mañana de esta Forma aprenderá a hacer mas Cuidadozo,19,2015-12-16,javier,2,1)','0000-00-00 00:00:00'),(131,'root@localhost','Se modificó el registro (02:00,2016-01-25 05:17:55,buenas tardes amigo,3,2016-01-08,juan,1,1) por (02:00,2016-01-25 05:17:55,buenas tardes amigo,3,2016-01-08,juan,1,1)','0000-00-00 00:00:00'),(132,'root@localhost','Se modificó el registro (02:00,2016-01-25 05:17:55,buenas tardes amigo,3,2016-01-08,juan,1,1) por (02:00,2016-01-25 05:17:55,buenas tardes amigo,3,2016-01-08,juan,1,1)','0000-00-00 00:00:00'),(133,'root@localhost','Se modificó el registro (02:00,2016-01-25 05:17:55,buenas tardes amigo,3,2016-01-08,juan,1,1) por (02:00,2016-01-25 05:17:55,buenas tardes amigo,3,2016-01-08,juan,1,1)','0000-00-00 00:00:00'),(134,'root@localhost','Se modificó el registro (02:00,2016-01-25 05:17:55,buenas tardes amigo,3,2016-01-08,juan,1,1) por (02:00,2016-01-25 05:17:55,buenas tardes amigo,3,2016-01-08,juan,1,1)','0000-00-00 00:00:00'),(135,'root@localhost','Se modificó el registro (11:00,2015-12-17 04:06:35,En este negocio se encontro mucha falta de haceó,19,2015-12-17,javier,2,1) por (11:00,2015-12-17 04:06:35,En este negocio se encontro mucha falta de haceó,19,2015-12-17,javier,2,1)','0000-00-00 00:00:00'),(136,'root@localhost','Se modificó el registro (12:00,2015-12-14 12:51:56,ededed,2,2015-12-14,javier,2,1) por (12:00,2015-12-14 12:51:56,ededed,2,2015-12-14,javier,2,1)','0000-00-00 00:00:00'),(137,'root@localhost','Se modificó el registro (12:00,2015-12-14 12:51:56,ededed,2,2015-12-14,javier,2,1) por (12:00,2016-02-21 05:08:33,holas senonoanosansas,2,2015-12-14,javier,2,1)','0000-00-00 00:00:00'),(138,'root@localhost','Se modificó el registro (11:00,2015-12-17 04:06:35,En este negocio se encontro mucha falta de haceó,19,2015-12-17,javier,2,1) por (11:00,2015-12-17 04:06:35,En este negocio se encontro mucha falta de haceó,19,2015-12-17,javier,2,1)','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `usuario_updatenotificaciones` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-05 22:28:43
