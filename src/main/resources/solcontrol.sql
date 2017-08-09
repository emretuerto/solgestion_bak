-- MySQL dump 10.13  Distrib 5.5.57, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: solcontrol
-- ------------------------------------------------------
-- Server version	5.5.57-0ubuntu0.14.04.1

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
-- Table structure for table `bonos`
--

DROP TABLE IF EXISTS `bonos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bonos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `es_de_minutos` bit(1) DEFAULT NULL,
  `identificador_bono` varchar(10) NOT NULL,
  `minutos` int(11) DEFAULT NULL,
  `sesiones` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_oxveljhr4ewaraknefhiydfcb` (`identificador_bono`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bonos`
--

LOCK TABLES `bonos` WRITE;
/*!40000 ALTER TABLE `bonos` DISABLE KEYS */;
INSERT INTO `bonos` VALUES (1,'','000001',-152,NULL),(2,'\0','00002',NULL,98.5);
/*!40000 ALTER TABLE `bonos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `apellidos` varchar(255) DEFAULT NULL,
  `codigo_cliente` varchar(10) NOT NULL,
  `codigo_postal` varchar(5) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `localidad` varchar(30) DEFAULT NULL,
  `nif` varchar(10) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `provincia` varchar(30) DEFAULT NULL,
  `telefono_fijo` varchar(9) DEFAULT NULL,
  `telefono_movil` varchar(9) DEFAULT NULL,
  `fototipo_id` int(11) DEFAULT NULL,
  `tipo_cliente_id` int(11) NOT NULL,
  `bono_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_8gduvo4bbw5hhyyivmrmdonau` (`codigo_cliente`),
  UNIQUE KEY `UK_ep7teqj7hbumyua1rquyddfce` (`nif`),
  KEY `FKjwlrprk3eptih2q2rimdaua0h` (`fototipo_id`),
  KEY `FKbpet18jsxb684ty57mwn8s6vk` (`tipo_cliente_id`),
  KEY `FKbclrlmwtywyw8kq19kk6ka4a6` (`bono_id`),
  CONSTRAINT `FKakxhmdqcma6fuqmm10n2j67re` FOREIGN KEY (`id`) REFERENCES `bonos` (`id`),
  CONSTRAINT `FKbclrlmwtywyw8kq19kk6ka4a6` FOREIGN KEY (`bono_id`) REFERENCES `bonos` (`id`),
  CONSTRAINT `FKbpet18jsxb684ty57mwn8s6vk` FOREIGN KEY (`tipo_cliente_id`) REFERENCES `tipo_clientes` (`id`),
  CONSTRAINT `FKjwlrprk3eptih2q2rimdaua0h` FOREIGN KEY (`fototipo_id`) REFERENCES `fototipos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Martínez de la Vega','A0009','39010','San Lsui','asdsd@asdsd.es','3910-05-21','Santander','2020317t','Manuel','Cantabria','942999999','669999999',2,1,1),(2,'Martínez Retuerto','CLI001','39010','C/ San Luis, 10','emretuerto@gmail.com','2017-07-02','Santander','13155640P','Eduardo','Cantabria','942237363','615303890',3,2,2);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fototipos`
--

DROP TABLE IF EXISTS `fototipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fototipos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fototipo` varchar(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_7cntlnmqvdgp4gr0rb9lcqmei` (`fototipo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fototipos`
--

LOCK TABLES `fototipos` WRITE;
/*!40000 ALTER TABLE `fototipos` DISABLE KEYS */;
INSERT INTO `fototipos` VALUES (1,'I'),(2,'II'),(3,'III'),(4,'IV'),(5,'V'),(6,'VI');
/*!40000 ALTER TABLE `fototipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sesiones`
--

DROP TABLE IF EXISTS `sesiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sesiones` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `duracion` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `cliente_id` int(11) NOT NULL,
  `solarium_id` int(11) NOT NULL,
  `sesiones_consumidas_bono` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqm8apy3m4otfsg3s3uqfbolyo` (`cliente_id`),
  KEY `FKekidpmmp1su6k357dc1o66v3q` (`solarium_id`),
  CONSTRAINT `FKekidpmmp1su6k357dc1o66v3q` FOREIGN KEY (`solarium_id`) REFERENCES `solariums` (`id`),
  CONSTRAINT `FKqm8apy3m4otfsg3s3uqfbolyo` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95658 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sesiones`
--

LOCK TABLES `sesiones` WRITE;
/*!40000 ALTER TABLE `sesiones` DISABLE KEYS */;
INSERT INTO `sesiones` VALUES (1,14,'2017-08-08',2,1,1.5),(2,14,'2017-08-08',2,1,1),(3,14,'2017-08-08',1,1,1),(4,14,'2017-08-08',2,1,1),(5,14,'2017-08-08',1,1,1),(95618,14,'2017-08-08',2,1,1),(95619,14,'2017-08-08',1,1,1),(95620,14,'2017-08-08',2,1,1),(95621,14,'2017-08-08',1,1,1),(95622,14,'2017-08-08',2,1,1),(95623,14,'2017-08-08',1,1,1),(95624,14,'2017-08-08',2,1,1),(95625,14,'2017-08-08',1,1,1),(95626,14,'2017-08-08',2,1,1),(95627,14,'2017-08-08',1,1,1),(95628,14,'2017-08-08',2,1,1),(95629,14,'2017-08-08',1,1,1),(95630,14,'2017-08-08',2,1,1),(95631,14,'2017-08-08',1,1,1),(95632,14,'2017-08-08',2,1,1),(95633,14,'2017-08-08',1,1,1),(95634,14,'2017-08-08',2,1,1),(95635,14,'2017-08-08',1,1,1),(95636,14,'2017-08-08',2,1,1),(95637,14,'2017-08-08',1,1,1),(95638,14,'2017-08-09',2,1,1),(95639,14,'2017-08-09',1,1,1),(95640,14,'2017-08-09',2,1,1),(95641,14,'2017-08-09',1,1,1),(95642,14,'2017-08-09',2,1,1),(95643,14,'2017-08-09',1,1,1),(95644,14,'2017-08-09',2,1,1),(95645,14,'2017-08-09',1,1,1),(95646,14,'2017-08-09',2,1,1),(95647,14,'2017-08-09',1,1,1),(95648,14,'2017-08-09',2,1,1),(95649,14,'2017-08-09',1,1,1),(95650,14,'2017-08-09',2,1,1),(95651,14,'2017-08-09',1,1,1),(95652,14,'2017-08-09',2,1,1),(95653,14,'2017-08-09',1,1,1),(95654,14,'2017-08-09',2,1,1),(95655,14,'2017-08-09',1,1,1),(95656,14,'2017-08-09',2,1,1),(95657,14,'2017-08-09',1,1,1);
/*!40000 ALTER TABLE `sesiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solariums`
--

DROP TABLE IF EXISTS `solariums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solariums` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `marca` varchar(50) DEFAULT NULL,
  `modelo` varchar(50) DEFAULT NULL,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_gw1q9uuslntic59lhr64vw9ob` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solariums`
--

LOCK TABLES `solariums` WRITE;
/*!40000 ALTER TABLE `solariums` DISABLE KEYS */;
INSERT INTO `solariums` VALUES (1,'ENCO','22/1','MAQUINA1');
/*!40000 ALTER TABLE `solariums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_clientes`
--

DROP TABLE IF EXISTS `tipo_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(4) NOT NULL,
  `descripcion` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_93ak4g2c6v2bocfbv5fuql5rh` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_clientes`
--

LOCK TABLES `tipo_clientes` WRITE;
/*!40000 ALTER TABLE `tipo_clientes` DISABLE KEYS */;
INSERT INTO `tipo_clientes` VALUES (1,'AAAA','Very Very Important'),(2,'A099','Cliente Solarium');
/*!40000 ALTER TABLE `tipo_clientes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-09 18:23:40
