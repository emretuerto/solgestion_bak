-- MySQL dump 10.13  Distrib 5.5.59, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: solcontrol
-- ------------------------------------------------------
-- Server version	5.5.59-0ubuntu0.14.04.1

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
  `codigo_barras` varchar(13) DEFAULT NULL,
  `es_de_minutos` bit(1) DEFAULT NULL,
  `identificador_bono` varchar(10) NOT NULL,
  `minutos` int(11) DEFAULT NULL,
  `sesiones` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_oxveljhr4ewaraknefhiydfcb` (`identificador_bono`),
  UNIQUE KEY `UK_ry3vh50l65tau2t02a847kyjy` (`codigo_barras`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bonos`
--

LOCK TABLES `bonos` WRITE;
/*!40000 ALTER TABLE `bonos` DISABLE KEYS */;
INSERT INTO `bonos` VALUES (1,NULL,'','0001',600,NULL),(2,NULL,'\0','0002',NULL,30);
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
  `codigo_barras` varchar(13) DEFAULT NULL,
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
  `bono_id` int(11) DEFAULT NULL,
  `fototipo_id` int(11) DEFAULT NULL,
  `tipo_cliente_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_8gduvo4bbw5hhyyivmrmdonau` (`codigo_cliente`),
  UNIQUE KEY `UK_ep7teqj7hbumyua1rquyddfce` (`nif`),
  UNIQUE KEY `UK_i4baen5ptmo9wpq08tmerwhoi` (`codigo_barras`),
  KEY `FKbclrlmwtywyw8kq19kk6ka4a6` (`bono_id`),
  KEY `FKjwlrprk3eptih2q2rimdaua0h` (`fototipo_id`),
  KEY `FKbpet18jsxb684ty57mwn8s6vk` (`tipo_cliente_id`),
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
INSERT INTO `clientes` VALUES (1,'MARTINEZ RETUERTO',NULL,'0001','39010','SAN LUIS','emretuerto@gmail.com','1973-05-06','SANTANDER','13155640P','EDUARDO','CANTABRIA','942000000','615303890',1,3,1),(2,'DE LA VEGA SANTOS',NULL,'0002','39010','SAN LUIS','cgevasantos@gmail.com','1975-07-21','SANTANDER','20203177T','CRISTINA','CANTABRIA','942999999','635471840',2,3,2);
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
-- Table structure for table `lamparas`
--

DROP TABLE IF EXISTS `lamparas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lamparas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(30) NOT NULL,
  `duracion` int(11) NOT NULL,
  `marca` varchar(30) NOT NULL,
  `modelo` varchar(30) NOT NULL,
  `precio` double DEFAULT NULL,
  `potencia_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_e69236x0qxb09b9qumsb9t2x` (`codigo`),
  KEY `FK5y449lw6aqhrf1x1ab2nxe1c4` (`potencia_id`),
  CONSTRAINT `FK5y449lw6aqhrf1x1ab2nxe1c4` FOREIGN KEY (`potencia_id`) REFERENCES `potencias` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lamparas`
--

LOCK TABLES `lamparas` WRITE;
/*!40000 ALTER TABLE `lamparas` DISABLE KEYS */;
INSERT INTO `lamparas` VALUES (1,'0001',800,'Sylvania','Purebronce 100 1.2',17.5,1),(2,'0002',1000,'Sylvania','CaralSol',25.5,2),(3,'0003',2800,'Sylvania','Chamuscator',140.99,6);
/*!40000 ALTER TABLE `lamparas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lamparas_instaladas`
--

DROP TABLE IF EXISTS `lamparas_instaladas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lamparas_instaladas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` int(11) DEFAULT NULL,
  `fecha_instalacion` datetime NOT NULL,
  `fecha_retirada` datetime DEFAULT NULL,
  `minutos_consumidos` int(11) DEFAULT NULL,
  `lampara_id` int(11) DEFAULT NULL,
  `maquina_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9s9pi0prwkgc3l88d5lfj8gts` (`lampara_id`),
  KEY `FK358mo8s8asmthllfqh7p25vkj` (`maquina_id`),
  CONSTRAINT `FK358mo8s8asmthllfqh7p25vkj` FOREIGN KEY (`maquina_id`) REFERENCES `maquinas` (`id`),
  CONSTRAINT `FK9s9pi0prwkgc3l88d5lfj8gts` FOREIGN KEY (`lampara_id`) REFERENCES `lamparas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lamparas_instaladas`
--

LOCK TABLES `lamparas_instaladas` WRITE;
/*!40000 ALTER TABLE `lamparas_instaladas` DISABLE KEYS */;
INSERT INTO `lamparas_instaladas` VALUES (1,20,'2017-08-19 19:01:36',NULL,0,1,1),(2,20,'2017-08-19 19:01:36',NULL,0,2,2),(3,40,'2017-08-19 19:01:36',NULL,0,3,2);
/*!40000 ALTER TABLE `lamparas_instaladas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maquinas`
--

DROP TABLE IF EXISTS `maquinas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maquinas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contador_parcial` int(11) DEFAULT NULL,
  `contador_total` int(11) NOT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `modelo` varchar(50) DEFAULT NULL,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ismlw1f4v9a9941tr3fw8tof6` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maquinas`
--

LOCK TABLES `maquinas` WRITE;
/*!40000 ALTER TABLE `maquinas` DISABLE KEYS */;
INSERT INTO `maquinas` VALUES (1,0,0,'Ergoline','23/1','Cabina 1'),(2,150,150,'Solpasion','Mega Super','Cabina 2'),(3,25,163,'Soltron','Bronceator','Cabina 3');
/*!40000 ALTER TABLE `maquinas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `potencias`
--

DROP TABLE IF EXISTS `potencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `potencias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(4) NOT NULL,
  `potencia` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_nkk38l2f6084vlv0hpec8v0da` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `potencias`
--

LOCK TABLES `potencias` WRITE;
/*!40000 ALTER TABLE `potencias` DISABLE KEYS */;
INSERT INTO `potencias` VALUES (1,'80',80),(2,'100',100),(3,'120',120),(4,'140',140),(5,'160',160),(6,'180',180);
/*!40000 ALTER TABLE `potencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sesiones`
--

DROP TABLE IF EXISTS `sesiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sesiones` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `duracion` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `sesiones_consumidas_bono` double DEFAULT NULL,
  `cliente_id` int(11) NOT NULL,
  `maquina_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqm8apy3m4otfsg3s3uqfbolyo` (`cliente_id`),
  KEY `FKojksanhjqjge7pmk1eoee6pon` (`maquina_id`),
  CONSTRAINT `FKojksanhjqjge7pmk1eoee6pon` FOREIGN KEY (`maquina_id`) REFERENCES `maquinas` (`id`),
  CONSTRAINT `FKqm8apy3m4otfsg3s3uqfbolyo` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sesiones`
--

LOCK TABLES `sesiones` WRITE;
/*!40000 ALTER TABLE `sesiones` DISABLE KEYS */;
/*!40000 ALTER TABLE `sesiones` ENABLE KEYS */;
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
INSERT INTO `tipo_clientes` VALUES (1,'0001','Cliente solarium'),(2,'0002','Cliente supermegaultra VIP');
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

-- Dump completed on 2018-03-02 18:08:25
