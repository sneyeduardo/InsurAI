CREATE DATABASE  IF NOT EXISTS `sistema_corretaje` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sistema_corretaje`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: sistema_corretaje
-- ------------------------------------------------------
-- Server version	9.6.0

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ 'c9b2522c-016e-11f1-99b3-4437e698f101:1-251';

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',3,'add_permission'),(6,'Can change permission',3,'change_permission'),(7,'Can delete permission',3,'delete_permission'),(8,'Can view permission',3,'view_permission'),(9,'Can add group',2,'add_group'),(10,'Can change group',2,'change_group'),(11,'Can delete group',2,'delete_group'),(12,'Can view group',2,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add cat estados',8,'add_catestados'),(26,'Can change cat estados',8,'change_catestados'),(27,'Can delete cat estados',8,'delete_catestados'),(28,'Can view cat estados',8,'view_catestados'),(29,'Can add cat estatus poliza',9,'add_catestatuspoliza'),(30,'Can change cat estatus poliza',9,'change_catestatuspoliza'),(31,'Can delete cat estatus poliza',9,'delete_catestatuspoliza'),(32,'Can view cat estatus poliza',9,'view_catestatuspoliza'),(33,'Can add cat estatus siniestro',10,'add_catestatussiniestro'),(34,'Can change cat estatus siniestro',10,'change_catestatussiniestro'),(35,'Can delete cat estatus siniestro',10,'delete_catestatussiniestro'),(36,'Can view cat estatus siniestro',10,'view_catestatussiniestro'),(37,'Can add cat marcas',11,'add_catmarcas'),(38,'Can change cat marcas',11,'change_catmarcas'),(39,'Can delete cat marcas',11,'delete_catmarcas'),(40,'Can view cat marcas',11,'view_catmarcas'),(41,'Can add cat metodos pago',12,'add_catmetodospago'),(42,'Can change cat metodos pago',12,'change_catmetodospago'),(43,'Can delete cat metodos pago',12,'delete_catmetodospago'),(44,'Can view cat metodos pago',12,'view_catmetodospago'),(45,'Can add cat monedas',14,'add_catmonedas'),(46,'Can change cat monedas',14,'change_catmonedas'),(47,'Can delete cat monedas',14,'delete_catmonedas'),(48,'Can view cat monedas',14,'view_catmonedas'),(49,'Can add cat paises',15,'add_catpaises'),(50,'Can change cat paises',15,'change_catpaises'),(51,'Can delete cat paises',15,'delete_catpaises'),(52,'Can view cat paises',15,'view_catpaises'),(53,'Can add companias seguros',18,'add_companiasseguros'),(54,'Can change companias seguros',18,'change_companiasseguros'),(55,'Can delete companias seguros',18,'delete_companiasseguros'),(56,'Can view companias seguros',18,'view_companiasseguros'),(57,'Can add financiadoras',22,'add_financiadoras'),(58,'Can change financiadoras',22,'change_financiadoras'),(59,'Can delete financiadoras',22,'delete_financiadoras'),(60,'Can view financiadoras',22,'view_financiadoras'),(61,'Can add intermediarios',24,'add_intermediarios'),(62,'Can change intermediarios',24,'change_intermediarios'),(63,'Can delete intermediarios',24,'delete_intermediarios'),(64,'Can view intermediarios',24,'view_intermediarios'),(65,'Can add ramos',27,'add_ramos'),(66,'Can change ramos',27,'change_ramos'),(67,'Can delete ramos',27,'delete_ramos'),(68,'Can view ramos',27,'view_ramos'),(69,'Can add roles',29,'add_roles'),(70,'Can change roles',29,'change_roles'),(71,'Can delete roles',29,'delete_roles'),(72,'Can view roles',29,'view_roles'),(73,'Can add cat ciudades',7,'add_catciudades'),(74,'Can change cat ciudades',7,'change_catciudades'),(75,'Can delete cat ciudades',7,'delete_catciudades'),(76,'Can view cat ciudades',7,'view_catciudades'),(77,'Can add cat modelos',13,'add_catmodelos'),(78,'Can change cat modelos',13,'change_catmodelos'),(79,'Can delete cat modelos',13,'delete_catmodelos'),(80,'Can view cat modelos',13,'view_catmodelos'),(81,'Can add clientes',16,'add_clientes'),(82,'Can change clientes',16,'change_clientes'),(83,'Can delete clientes',16,'delete_clientes'),(84,'Can view clientes',16,'view_clientes'),(85,'Can add productos',26,'add_productos'),(86,'Can change productos',26,'change_productos'),(87,'Can delete productos',26,'delete_productos'),(88,'Can view productos',26,'view_productos'),(89,'Can add polizas',25,'add_polizas'),(90,'Can change polizas',25,'change_polizas'),(91,'Can delete polizas',25,'delete_polizas'),(92,'Can view polizas',25,'view_polizas'),(93,'Can add recibos primas',28,'add_recibosprimas'),(94,'Can change recibos primas',28,'change_recibosprimas'),(95,'Can delete recibos primas',28,'delete_recibosprimas'),(96,'Can view recibos primas',28,'view_recibosprimas'),(97,'Can add siniestros',30,'add_siniestros'),(98,'Can change siniestros',30,'change_siniestros'),(99,'Can delete siniestros',30,'delete_siniestros'),(100,'Can view siniestros',30,'view_siniestros'),(101,'Can add usuarios',32,'add_usuarios'),(102,'Can change usuarios',32,'change_usuarios'),(103,'Can delete usuarios',32,'delete_usuarios'),(104,'Can view usuarios',32,'view_usuarios'),(105,'Can add vehiculos',33,'add_vehiculos'),(106,'Can change vehiculos',33,'change_vehiculos'),(107,'Can delete vehiculos',33,'delete_vehiculos'),(108,'Can view vehiculos',33,'view_vehiculos'),(109,'Can add cobranzas',17,'add_cobranzas'),(110,'Can change cobranzas',17,'change_cobranzas'),(111,'Can delete cobranzas',17,'delete_cobranzas'),(112,'Can view cobranzas',17,'view_cobranzas'),(113,'Can add config comisiones',19,'add_configcomisiones'),(114,'Can change config comisiones',19,'change_configcomisiones'),(115,'Can delete config comisiones',19,'delete_configcomisiones'),(116,'Can view config comisiones',19,'view_configcomisiones'),(117,'Can add cotizaciones',20,'add_cotizaciones'),(118,'Can change cotizaciones',20,'change_cotizaciones'),(119,'Can delete cotizaciones',20,'delete_cotizaciones'),(120,'Can view cotizaciones',20,'view_cotizaciones'),(121,'Can add detalle cotizacion',21,'add_detallecotizacion'),(122,'Can change detalle cotizacion',21,'change_detallecotizacion'),(123,'Can delete detalle cotizacion',21,'delete_detallecotizacion'),(124,'Can view detalle cotizacion',21,'view_detallecotizacion'),(125,'Can add ingresos comisiones',23,'add_ingresoscomisiones'),(126,'Can change ingresos comisiones',23,'change_ingresoscomisiones'),(127,'Can delete ingresos comisiones',23,'delete_ingresoscomisiones'),(128,'Can view ingresos comisiones',23,'view_ingresoscomisiones'),(129,'Can add suscripciones',31,'add_suscripciones'),(130,'Can change suscripciones',31,'change_suscripciones'),(131,'Can delete suscripciones',31,'delete_suscripciones'),(132,'Can view suscripciones',31,'view_suscripciones');
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
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
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
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$1200000$TaYLJ17bF2geU9biQMl8e7$vfA8AkL+oP44eGGsxno5l6fYE7C3LcBeF4l5l5yZ8PM=','2026-03-08 19:18:19.112655',1,'admin','','','sneyeduardo4@gmail.com',1,1,'2026-03-08 01:05:14.614055');
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
-- Table structure for table `cat_ciudades`
--

DROP TABLE IF EXISTS `cat_ciudades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cat_ciudades` (
  `id_ciudad` int NOT NULL AUTO_INCREMENT,
  `id_estado` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id_ciudad`),
  KEY `fk_ciudad_estado` (`id_estado`),
  CONSTRAINT `fk_ciudad_estado` FOREIGN KEY (`id_estado`) REFERENCES `cat_estados` (`id_estado`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_ciudades`
--

LOCK TABLES `cat_ciudades` WRITE;
/*!40000 ALTER TABLE `cat_ciudades` DISABLE KEYS */;
/*!40000 ALTER TABLE `cat_ciudades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_estados`
--

DROP TABLE IF EXISTS `cat_estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cat_estados` (
  `id_estado` int NOT NULL AUTO_INCREMENT,
  `id_pais` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id_estado`),
  KEY `fk_estado_pais` (`id_pais`),
  CONSTRAINT `fk_estado_pais` FOREIGN KEY (`id_pais`) REFERENCES `cat_paises` (`id_pais`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_estados`
--

LOCK TABLES `cat_estados` WRITE;
/*!40000 ALTER TABLE `cat_estados` DISABLE KEYS */;
/*!40000 ALTER TABLE `cat_estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_estatus_poliza`
--

DROP TABLE IF EXISTS `cat_estatus_poliza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cat_estatus_poliza` (
  `id_estatus` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `activo` tinyint DEFAULT '1',
  PRIMARY KEY (`id_estatus`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_estatus_poliza`
--

LOCK TABLES `cat_estatus_poliza` WRITE;
/*!40000 ALTER TABLE `cat_estatus_poliza` DISABLE KEYS */;
INSERT INTO `cat_estatus_poliza` VALUES (1,'Válido',1),(2,'Activo',1),(3,'Modificación',1),(4,'Renovación',1),(5,'Anulado',1),(6,'Extemporáneo',1),(7,'En espera de recaudos',1);
/*!40000 ALTER TABLE `cat_estatus_poliza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_estatus_siniestro`
--

DROP TABLE IF EXISTS `cat_estatus_siniestro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cat_estatus_siniestro` (
  `id_estatus` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id_estatus`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_estatus_siniestro`
--

LOCK TABLES `cat_estatus_siniestro` WRITE;
/*!40000 ALTER TABLE `cat_estatus_siniestro` DISABLE KEYS */;
INSERT INTO `cat_estatus_siniestro` VALUES (1,'Notificado'),(2,'En Análisis'),(3,'Aprobado'),(4,'Rechazado'),(5,'Pagado'),(6,'Cerrado');
/*!40000 ALTER TABLE `cat_estatus_siniestro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_marcas`
--

DROP TABLE IF EXISTS `cat_marcas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cat_marcas` (
  `id_marca` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id_marca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_marcas`
--

LOCK TABLES `cat_marcas` WRITE;
/*!40000 ALTER TABLE `cat_marcas` DISABLE KEYS */;
/*!40000 ALTER TABLE `cat_marcas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_metodos_pago`
--

DROP TABLE IF EXISTS `cat_metodos_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cat_metodos_pago` (
  `id_metodo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `activo` tinyint DEFAULT '1',
  PRIMARY KEY (`id_metodo`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_metodos_pago`
--

LOCK TABLES `cat_metodos_pago` WRITE;
/*!40000 ALTER TABLE `cat_metodos_pago` DISABLE KEYS */;
INSERT INTO `cat_metodos_pago` VALUES (1,'Efectivo (Dólares/Euros)',1),(2,'TDC',1),(3,'TDD',1),(4,'Transferencia Nacional',1),(5,'Transferencia Internacional',1),(6,'Pago Móvil',1),(7,'Zelle',1),(8,'Efectivo (Dólares/Euros)',1),(9,'TDC',1),(10,'TDD',1),(11,'Transferencia Nacional',1),(12,'Transferencia Internacional',1),(13,'Pago Móvil',1),(14,'Zelle',1);
/*!40000 ALTER TABLE `cat_metodos_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_modelos`
--

DROP TABLE IF EXISTS `cat_modelos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cat_modelos` (
  `id_modelo` int NOT NULL AUTO_INCREMENT,
  `id_marca` int NOT NULL,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id_modelo`),
  KEY `fk_modelo_marca` (`id_marca`),
  CONSTRAINT `fk_modelo_marca` FOREIGN KEY (`id_marca`) REFERENCES `cat_marcas` (`id_marca`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_modelos`
--

LOCK TABLES `cat_modelos` WRITE;
/*!40000 ALTER TABLE `cat_modelos` DISABLE KEYS */;
/*!40000 ALTER TABLE `cat_modelos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_monedas`
--

DROP TABLE IF EXISTS `cat_monedas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cat_monedas` (
  `id_moneda` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `codigo` varchar(5) DEFAULT NULL,
  `activo` tinyint DEFAULT '1',
  PRIMARY KEY (`id_moneda`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_monedas`
--

LOCK TABLES `cat_monedas` WRITE;
/*!40000 ALTER TABLE `cat_monedas` DISABLE KEYS */;
INSERT INTO `cat_monedas` VALUES (1,'Dólar','USD',1),(2,'Euro','EUR',1),(3,'Bolívares','VES',1);
/*!40000 ALTER TABLE `cat_monedas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_paises`
--

DROP TABLE IF EXISTS `cat_paises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cat_paises` (
  `id_pais` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `codigo_iso` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id_pais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_paises`
--

LOCK TABLES `cat_paises` WRITE;
/*!40000 ALTER TABLE `cat_paises` DISABLE KEYS */;
/*!40000 ALTER TABLE `cat_paises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `tipo_cliente` enum('NATURAL','JURIDICA','GUBERNAMENTAL') NOT NULL,
  `tipo_documento` varchar(3) NOT NULL,
  `numero_documento` varchar(20) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) DEFAULT NULL,
  `telefono_movil` varchar(20) DEFAULT NULL,
  `telefono_fijo` varchar(20) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `direccion` text,
  `id_ciudad` int DEFAULT NULL,
  `profesion_oficio` varchar(100) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `sexo` enum('M','F') DEFAULT NULL,
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `activo` tinyint DEFAULT '1',
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `idx_documento` (`tipo_documento`,`numero_documento`),
  KEY `fk_cliente_ciudad` (`id_ciudad`),
  CONSTRAINT `fk_cliente_ciudad` FOREIGN KEY (`id_ciudad`) REFERENCES `cat_ciudades` (`id_ciudad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cobranzas`
--

DROP TABLE IF EXISTS `cobranzas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cobranzas` (
  `id_cobranza` int NOT NULL AUTO_INCREMENT,
  `id_recibo` int NOT NULL,
  `fecha_pago` date NOT NULL,
  `monto_pagado` decimal(15,2) NOT NULL,
  `referencia` varchar(50) NOT NULL,
  `banco_origen` varchar(50) DEFAULT NULL,
  `forma_pago` enum('Transferencia','Zelle','Efectivo','Pago Movil') NOT NULL,
  `estatus` enum('Por Conciliar','Conciliado','Rechazado') DEFAULT 'Por Conciliar',
  PRIMARY KEY (`id_cobranza`),
  KEY `id_recibo` (`id_recibo`),
  CONSTRAINT `cobranzas_ibfk_1` FOREIGN KEY (`id_recibo`) REFERENCES `recibos_primas` (`id_recibo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cobranzas`
--

LOCK TABLES `cobranzas` WRITE;
/*!40000 ALTER TABLE `cobranzas` DISABLE KEYS */;
/*!40000 ALTER TABLE `cobranzas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companias_seguros`
--

DROP TABLE IF EXISTS `companias_seguros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companias_seguros` (
  `id_compania` int NOT NULL AUTO_INCREMENT,
  `rif` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `direccion` text,
  `telefono_contacto` varchar(20) DEFAULT NULL,
  `persona_contacto` varchar(100) DEFAULT NULL,
  `activo` tinyint DEFAULT '1',
  PRIMARY KEY (`id_compania`),
  UNIQUE KEY `rif` (`rif`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companias_seguros`
--

LOCK TABLES `companias_seguros` WRITE;
/*!40000 ALTER TABLE `companias_seguros` DISABLE KEYS */;
/*!40000 ALTER TABLE `companias_seguros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_comisiones`
--

DROP TABLE IF EXISTS `config_comisiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config_comisiones` (
  `id_config` int NOT NULL AUTO_INCREMENT,
  `id_compania` int NOT NULL,
  `id_ramo` int NOT NULL,
  `porcentaje_comision` decimal(5,2) NOT NULL,
  `fecha_acuerdo` date DEFAULT NULL,
  `activo` tinyint DEFAULT '1',
  PRIMARY KEY (`id_config`),
  KEY `fk_conf_cia` (`id_compania`),
  KEY `fk_conf_ramo` (`id_ramo`),
  CONSTRAINT `fk_conf_cia` FOREIGN KEY (`id_compania`) REFERENCES `companias_seguros` (`id_compania`),
  CONSTRAINT `fk_conf_ramo` FOREIGN KEY (`id_ramo`) REFERENCES `ramos` (`id_ramo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_comisiones`
--

LOCK TABLES `config_comisiones` WRITE;
/*!40000 ALTER TABLE `config_comisiones` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_comisiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cotizaciones`
--

DROP TABLE IF EXISTS `cotizaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cotizaciones` (
  `id_cotizacion` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `id_ramo` int NOT NULL,
  `fecha_solicitud` datetime DEFAULT CURRENT_TIMESTAMP,
  `vigencia_hasta` date NOT NULL,
  `observaciones` text,
  `estatus` enum('Borrador','Enviada','Aceptada','Rechazada','Vencida') DEFAULT 'Borrador',
  PRIMARY KEY (`id_cotizacion`),
  KEY `fk_cotizaciones_cliente` (`id_cliente`),
  KEY `fk_cotizaciones_ramo` (`id_ramo`),
  CONSTRAINT `fk_cotizaciones_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  CONSTRAINT `fk_cotizaciones_ramo` FOREIGN KEY (`id_ramo`) REFERENCES `ramos` (`id_ramo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cotizaciones`
--

LOCK TABLES `cotizaciones` WRITE;
/*!40000 ALTER TABLE `cotizaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `cotizaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_cotizacion`
--

DROP TABLE IF EXISTS `detalle_cotizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_cotizacion` (
  `id_detalle` int NOT NULL AUTO_INCREMENT,
  `id_cotizacion` int NOT NULL,
  `id_compania` int NOT NULL,
  `id_producto` int NOT NULL,
  `suma_asegurada` decimal(15,2) NOT NULL,
  `prima_anual` decimal(15,2) NOT NULL,
  `deducible` varchar(100) DEFAULT NULL,
  `seleccionada` tinyint DEFAULT '0',
  PRIMARY KEY (`id_detalle`),
  KEY `fk_detalle_cot` (`id_cotizacion`),
  KEY `fk_detalle_cia` (`id_compania`),
  KEY `fk_detalle_prod` (`id_producto`),
  CONSTRAINT `fk_detalle_cia` FOREIGN KEY (`id_compania`) REFERENCES `companias_seguros` (`id_compania`),
  CONSTRAINT `fk_detalle_cot` FOREIGN KEY (`id_cotizacion`) REFERENCES `cotizaciones` (`id_cotizacion`) ON DELETE CASCADE,
  CONSTRAINT `fk_detalle_prod` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_cotizacion`
--

LOCK TABLES `detalle_cotizacion` WRITE;
/*!40000 ALTER TABLE `detalle_cotizacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_cotizacion` ENABLE KEYS */;
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
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','group'),(3,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'core','catciudades'),(8,'core','catestados'),(9,'core','catestatuspoliza'),(10,'core','catestatussiniestro'),(11,'core','catmarcas'),(12,'core','catmetodospago'),(13,'core','catmodelos'),(14,'core','catmonedas'),(15,'core','catpaises'),(16,'core','clientes'),(17,'core','cobranzas'),(18,'core','companiasseguros'),(19,'core','configcomisiones'),(20,'core','cotizaciones'),(21,'core','detallecotizacion'),(22,'core','financiadoras'),(23,'core','ingresoscomisiones'),(24,'core','intermediarios'),(25,'core','polizas'),(26,'core','productos'),(27,'core','ramos'),(28,'core','recibosprimas'),(29,'core','roles'),(30,'core','siniestros'),(31,'core','suscripciones'),(32,'core','usuarios'),(33,'core','vehiculos'),(6,'sessions','session');
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
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-03-08 00:54:23.980039'),(2,'auth','0001_initial','2026-03-08 00:54:48.118818'),(3,'admin','0001_initial','2026-03-08 00:54:51.461953'),(4,'admin','0002_logentry_remove_auto_add','2026-03-08 00:54:51.533843'),(5,'admin','0003_logentry_add_action_flag_choices','2026-03-08 00:54:51.599965'),(6,'contenttypes','0002_remove_content_type_name','2026-03-08 00:54:53.445826'),(7,'auth','0002_alter_permission_name_max_length','2026-03-08 00:54:55.362824'),(8,'auth','0003_alter_user_email_max_length','2026-03-08 00:54:55.830973'),(9,'auth','0004_alter_user_username_opts','2026-03-08 00:54:55.945995'),(10,'auth','0005_alter_user_last_login_null','2026-03-08 00:54:57.401089'),(11,'auth','0006_require_contenttypes_0002','2026-03-08 00:54:57.546476'),(12,'auth','0007_alter_validators_add_error_messages','2026-03-08 00:54:57.621646'),(13,'auth','0008_alter_user_username_max_length','2026-03-08 00:54:58.930461'),(14,'auth','0009_alter_user_last_name_max_length','2026-03-08 00:55:00.421336'),(15,'auth','0010_alter_group_name_max_length','2026-03-08 00:55:00.619271'),(16,'auth','0011_update_proxy_permissions','2026-03-08 00:55:00.764314'),(17,'auth','0012_alter_user_first_name_max_length','2026-03-08 00:55:01.822017'),(18,'core','0001_initial','2026-03-08 00:59:42.513621'),(19,'core','0002_cobranzas_configcomisiones_cotizaciones_and_more','2026-03-08 00:59:42.578748'),(20,'sessions','0001_initial','2026-03-08 01:02:01.094689');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('lpaehtzyt582ncv3pwd48166n7h3lxbj','e30:1vz6un:E4Wiw55FZ9Nk13sbVHPYanxyXc02R4A1JeMExf9Jqpw','2026-03-22 05:42:57.342376'),('t7275cwkioj5jznfmhmaydla7nw6svwb','.eJxVjDEOwjAMRe-SGUXYatKUkZ0zRHbskgJKpKadEHenlTrA-t97_20irUuOa9M5TmIuBszpd2NKTy07kAeVe7WplmWe2O6KPWiztyr6uh7u30Gmlrc6dDRAr5owgO8JBfxIQXH0npkHVEY6s0OHYQMdeIIkzokmTx0Kms8X7Xg4Uw:1vzJdv:KRqEC7YG15NasIzqnKnkjU4nGARq6JQTASx7dlsvj_Q','2026-03-22 19:18:23.596185');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financiadoras`
--

DROP TABLE IF EXISTS `financiadoras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `financiadoras` (
  `id_financiadora` int NOT NULL AUTO_INCREMENT,
  `rif` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `tasa_interes` decimal(5,2) DEFAULT NULL,
  `activo` tinyint DEFAULT '1',
  PRIMARY KEY (`id_financiadora`),
  UNIQUE KEY `rif` (`rif`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financiadoras`
--

LOCK TABLES `financiadoras` WRITE;
/*!40000 ALTER TABLE `financiadoras` DISABLE KEYS */;
/*!40000 ALTER TABLE `financiadoras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingresos_comisiones`
--

DROP TABLE IF EXISTS `ingresos_comisiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingresos_comisiones` (
  `id_ingreso` int NOT NULL AUTO_INCREMENT,
  `id_poliza` int NOT NULL,
  `id_recibo` int NOT NULL,
  `monto_comision_recibida` decimal(15,2) NOT NULL,
  `fecha_cobro_comision` datetime DEFAULT CURRENT_TIMESTAMP,
  `numero_referencia_pago` varchar(100) DEFAULT NULL,
  `estatus_conciliacion` enum('Pendiente','Conciliado') DEFAULT 'Pendiente',
  PRIMARY KEY (`id_ingreso`),
  KEY `fk_ingreso_poliza` (`id_poliza`),
  KEY `fk_ingreso_recibo` (`id_recibo`),
  CONSTRAINT `fk_ingreso_poliza` FOREIGN KEY (`id_poliza`) REFERENCES `polizas` (`id_poliza`),
  CONSTRAINT `fk_ingreso_recibo` FOREIGN KEY (`id_recibo`) REFERENCES `recibos_primas` (`id_recibo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingresos_comisiones`
--

LOCK TABLES `ingresos_comisiones` WRITE;
/*!40000 ALTER TABLE `ingresos_comisiones` DISABLE KEYS */;
/*!40000 ALTER TABLE `ingresos_comisiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `intermediarios`
--

DROP TABLE IF EXISTS `intermediarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `intermediarios` (
  `id_intermediario` int NOT NULL AUTO_INCREMENT,
  `nombre_completo` varchar(150) NOT NULL,
  `codigo_sudeaseg` varchar(50) DEFAULT NULL,
  `activo` tinyint DEFAULT '1',
  PRIMARY KEY (`id_intermediario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `intermediarios`
--

LOCK TABLES `intermediarios` WRITE;
/*!40000 ALTER TABLE `intermediarios` DISABLE KEYS */;
INSERT INTO `intermediarios` VALUES (1,'Agente Principal',NULL,1),(2,'Agente General','A-999',1);
/*!40000 ALTER TABLE `intermediarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `polizas`
--

DROP TABLE IF EXISTS `polizas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `polizas` (
  `id_poliza` int NOT NULL AUTO_INCREMENT,
  `numero_poliza` varchar(50) NOT NULL,
  `id_cliente` int NOT NULL,
  `id_vehiculo` int DEFAULT NULL,
  `id_compania` int NOT NULL,
  `id_ramo` int NOT NULL,
  `id_intermediario` int DEFAULT NULL,
  `id_producto` int NOT NULL,
  `id_estatus` int NOT NULL DEFAULT '1',
  `id_moneda` int NOT NULL,
  `suma_asegurada` decimal(15,2) NOT NULL,
  `prima_neta` decimal(15,2) NOT NULL,
  `fecha_emision` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `vigencia_desde` date NOT NULL,
  `vigencia_hasta` date NOT NULL,
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `activo` tinyint DEFAULT '1',
  PRIMARY KEY (`id_poliza`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_compania` (`id_compania`),
  KEY `id_estatus` (`id_estatus`),
  KEY `id_moneda` (`id_moneda`),
  KEY `fk_polizas_producto` (`id_producto`),
  KEY `fk_poliza_vehiculo` (`id_vehiculo`),
  CONSTRAINT `fk_poliza_vehiculo` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculos` (`id_vehiculo`),
  CONSTRAINT `fk_polizas_producto` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`),
  CONSTRAINT `polizas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  CONSTRAINT `polizas_ibfk_2` FOREIGN KEY (`id_compania`) REFERENCES `companias_seguros` (`id_compania`),
  CONSTRAINT `polizas_ibfk_3` FOREIGN KEY (`id_estatus`) REFERENCES `cat_estatus_poliza` (`id_estatus`),
  CONSTRAINT `polizas_ibfk_4` FOREIGN KEY (`id_moneda`) REFERENCES `cat_monedas` (`id_moneda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `polizas`
--

LOCK TABLES `polizas` WRITE;
/*!40000 ALTER TABLE `polizas` DISABLE KEYS */;
/*!40000 ALTER TABLE `polizas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `id_ramo` int NOT NULL,
  `nombre_producto` varchar(100) NOT NULL,
  `activo` tinyint DEFAULT '1',
  PRIMARY KEY (`id_producto`),
  KEY `id_ramo` (`id_ramo`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_ramo`) REFERENCES `ramos` (`id_ramo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,1,'RCV',1),(2,1,'RCV Personal',1);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ramos`
--

DROP TABLE IF EXISTS `ramos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ramos` (
  `id_ramo` int NOT NULL AUTO_INCREMENT,
  `nombre_ramo` varchar(100) NOT NULL,
  `activo` tinyint DEFAULT '1',
  PRIMARY KEY (`id_ramo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ramos`
--

LOCK TABLES `ramos` WRITE;
/*!40000 ALTER TABLE `ramos` DISABLE KEYS */;
INSERT INTO `ramos` VALUES (1,'Automóvil',1),(2,'Automóvil',1);
/*!40000 ALTER TABLE `ramos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recibos_primas`
--

DROP TABLE IF EXISTS `recibos_primas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recibos_primas` (
  `id_recibo` int NOT NULL AUTO_INCREMENT,
  `id_poliza` int NOT NULL,
  `monto_cuota` decimal(15,2) NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `estatus_cobro` enum('Pendiente','Pagado','Anulado') DEFAULT 'Pendiente',
  PRIMARY KEY (`id_recibo`),
  KEY `id_poliza` (`id_poliza`),
  CONSTRAINT `recibos_primas_ibfk_1` FOREIGN KEY (`id_poliza`) REFERENCES `polizas` (`id_poliza`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recibos_primas`
--

LOCK TABLES `recibos_primas` WRITE;
/*!40000 ALTER TABLE `recibos_primas` DISABLE KEYS */;
/*!40000 ALTER TABLE `recibos_primas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id_rol` int NOT NULL AUTO_INCREMENT,
  `nombre_rol` varchar(50) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `activo` tinyint DEFAULT '1',
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Administrador','Acceso total al sistema',1),(2,'Corredor','Puede cotizar y emitir pólizas',1),(3,'Analista de Siniestros','Gestiona los reclamos',1),(4,'Cliente','Acceso solo a sus pólizas',1);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `siniestros`
--

DROP TABLE IF EXISTS `siniestros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `siniestros` (
  `id_siniestro` int NOT NULL AUTO_INCREMENT,
  `numero_siniestro` varchar(50) NOT NULL,
  `id_poliza` int NOT NULL,
  `id_estatus` int NOT NULL,
  `fecha_ocurrencia` datetime NOT NULL,
  `fecha_notificacion` datetime DEFAULT CURRENT_TIMESTAMP,
  `descripcion_evento` text NOT NULL,
  `lugar_evento` varchar(200) DEFAULT NULL,
  `monto_estimado` decimal(15,2) DEFAULT '0.00',
  `monto_aprobado` decimal(15,2) DEFAULT '0.00',
  `nombre_contacto_emergencia` varchar(100) DEFAULT NULL,
  `telefono_contacto_emergencia` varchar(20) DEFAULT NULL,
  `activo` tinyint DEFAULT '1',
  PRIMARY KEY (`id_siniestro`),
  KEY `fk_siniestros_poliza` (`id_poliza`),
  KEY `fk_siniestros_estatus` (`id_estatus`),
  CONSTRAINT `fk_siniestros_estatus` FOREIGN KEY (`id_estatus`) REFERENCES `cat_estatus_siniestro` (`id_estatus`),
  CONSTRAINT `fk_siniestros_poliza` FOREIGN KEY (`id_poliza`) REFERENCES `polizas` (`id_poliza`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `siniestros`
--

LOCK TABLES `siniestros` WRITE;
/*!40000 ALTER TABLE `siniestros` DISABLE KEYS */;
/*!40000 ALTER TABLE `siniestros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suscripciones`
--

DROP TABLE IF EXISTS `suscripciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suscripciones` (
  `id_suscripcion` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `id_vehiculo` int DEFAULT NULL,
  `fecha_solicitud` datetime DEFAULT CURRENT_TIMESTAMP,
  `id_analista` int NOT NULL,
  `estatus_suscripcion` enum('Pendiente','Aprobado','Rechazado','Requiere Inspección') DEFAULT 'Pendiente',
  `observaciones_tecnicas` text,
  `monto_inspeccion` decimal(15,2) DEFAULT '0.00',
  PRIMARY KEY (`id_suscripcion`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_analista` (`id_analista`),
  CONSTRAINT `suscripciones_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  CONSTRAINT `suscripciones_ibfk_2` FOREIGN KEY (`id_analista`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suscripciones`
--

LOCK TABLES `suscripciones` WRITE;
/*!40000 ALTER TABLE `suscripciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `suscripciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `id_rol` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `nombre_completo` varchar(100) NOT NULL,
  `ultimo_login` datetime DEFAULT NULL,
  `intentos_fallidos` int DEFAULT '0',
  `bloqueado` tinyint DEFAULT '0',
  `reset_token` varchar(100) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT CURRENT_TIMESTAMP,
  `activo` tinyint DEFAULT '1',
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `fk_usuarios_rol` (`id_rol`),
  CONSTRAINT `fk_usuarios_rol` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculos`
--

DROP TABLE IF EXISTS `vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehiculos` (
  `id_vehiculo` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `id_modelo` int NOT NULL,
  `año` int NOT NULL,
  `placa` varchar(20) NOT NULL,
  `serial_motor` varchar(50) NOT NULL,
  `serial_carroceria` varchar(50) NOT NULL,
  `color` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_vehiculo`),
  UNIQUE KEY `placa` (`placa`),
  KEY `fk_vehiculo_cliente` (`id_cliente`),
  KEY `fk_vehiculo_modelo` (`id_modelo`),
  CONSTRAINT `fk_vehiculo_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  CONSTRAINT `fk_vehiculo_modelo` FOREIGN KEY (`id_modelo`) REFERENCES `cat_modelos` (`id_modelo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculos`
--

LOCK TABLES `vehiculos` WRITE;
/*!40000 ALTER TABLE `vehiculos` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehiculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_resumen_polizas`
--

DROP TABLE IF EXISTS `vista_resumen_polizas`;
/*!50001 DROP VIEW IF EXISTS `vista_resumen_polizas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_resumen_polizas` AS SELECT 
 1 AS `numero_poliza`,
 1 AS `nombre_cliente`,
 1 AS `aseguradora`,
 1 AS `estado_actual`,
 1 AS `vigencia_hasta`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vista_resumen_polizas`
--

/*!50001 DROP VIEW IF EXISTS `vista_resumen_polizas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_resumen_polizas` AS select `p`.`numero_poliza` AS `numero_poliza`,concat(`c`.`nombres`,' ',`c`.`apellidos`) AS `nombre_cliente`,`aseg`.`nombre` AS `aseguradora`,`est`.`nombre` AS `estado_actual`,`p`.`vigencia_hasta` AS `vigencia_hasta` from (((`polizas` `p` join `clientes` `c` on((`p`.`id_cliente` = `c`.`id_cliente`))) join `companias_seguros` `aseg` on((`p`.`id_compania` = `aseg`.`id_compania`))) join `cat_estatus_poliza` `est` on((`p`.`id_estatus` = `est`.`id_estatus`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-09 18:32:48
