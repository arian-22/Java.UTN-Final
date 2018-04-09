CREATE DATABASE  IF NOT EXISTS `Final_AlquilerDeVehiculos` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `Final_AlquilerDeVehiculos`;
-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x64)
--
-- Host: localhost    Database: Final_AlquilerDeVehiculos
-- ------------------------------------------------------
-- Server version	5.7.20-0ubuntu0.16.04.1

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
-- Table structure for table `alquileres`
--

DROP TABLE IF EXISTS `alquileres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alquileres` (
  `nro_alquiler` int(11) NOT NULL,
  `hora` time(5) NOT NULL,
  `fecha_desde` date NOT NULL,
  `fecha_hasta` date NOT NULL,
  `fecha_cancelacion` date NOT NULL,
  `importe_cancelacion` double NOT NULL,
  PRIMARY KEY (`nro_alquiler`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alquileres`
--

LOCK TABLES `alquileres` WRITE;
/*!40000 ALTER TABLE `alquileres` DISABLE KEYS */;
/*!40000 ALTER TABLE `alquileres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cli-veh-alq`
--

DROP TABLE IF EXISTS `cli-veh-alq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cli-veh-alq` (
  `mail` varchar(60) NOT NULL,
  `nro_alquiler` int(11) NOT NULL,
  `nro_patente` varchar(10) NOT NULL,
  PRIMARY KEY (`mail`,`nro_alquiler`,`nro_patente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cli-veh-alq`
--

LOCK TABLES `cli-veh-alq` WRITE;
/*!40000 ALTER TABLE `cli-veh-alq` DISABLE KEYS */;
/*!40000 ALTER TABLE `cli-veh-alq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalles-penalizacion`
--

DROP TABLE IF EXISTS `detalles-penalizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalles-penalizacion` (
  `id_detalle` int(11) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `importe` double NOT NULL,
  `id_comprobante` int(11) NOT NULL,
  PRIMARY KEY (`id_detalle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles-penalizacion`
--

LOCK TABLES `detalles-penalizacion` WRITE;
/*!40000 ALTER TABLE `detalles-penalizacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalles-penalizacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devolucion`
--

DROP TABLE IF EXISTS `devolucion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devolucion` (
  `nro_alquiler` int(11) NOT NULL,
  `fecha_devolucion` date NOT NULL,
  `id_comprobante` int(11) NOT NULL,
  `mail` varchar(60) NOT NULL,
  `hora` time(5) NOT NULL,
  PRIMARY KEY (`nro_alquiler`,`fecha_devolucion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devolucion`
--

LOCK TABLES `devolucion` WRITE;
/*!40000 ALTER TABLE `devolucion` DISABLE KEYS */;
/*!40000 ALTER TABLE `devolucion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagos` (
  `id_comprobante` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `importe_alquiler` double NOT NULL,
  `importe_total` double NOT NULL,
  PRIMARY KEY (`id_comprobante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos`
--

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `mail` varchar(60) NOT NULL,
  `contraseña` varchar(45) NOT NULL,
  `dni` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `fecha_nac` date NOT NULL,
  `telefono` varchar(30) NOT NULL,
  `fecha_venc_licencia` date DEFAULT NULL,
  `nro_tarjeta` varchar(20) DEFAULT NULL,
  `admin` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`mail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES ('arian.valles@outlook.com','arian',38587019,'Arian','Valles','Italia 2037','1994-12-09','154650787','2018-12-20',NULL,'N'),('ceci.acciarini@gmail.com','ceci',38815528,'Cecilia','Acciarini','Mitre 1356','1995-03-25','15586667','2022-01-01',NULL,'S'),('ceci.acciarini@hotmail.com','ceci',38815528,'Cecilia','Acciarini','Mitre 1356','1995-03-25','15586667','2022-01-01',NULL,'N'),('elary22@live.com','arian',38587019,'Arian','Valles','Italia 2037','1994-12-09','32232432432','2222-03-09',NULL,'S'),('noe.cano210@gmail.com','noe',34720593,'Noelia','Cano','Amenabo 2150','1989-10-02','156930684','2023-05-01',NULL,'N'),('noe_04_2@hotmail.com','noe',34720593,'Noelia','Cano','Amenabo 2150','1989-10-02','156930684','2023-05-01',NULL,'S');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valores`
--

DROP TABLE IF EXISTS `valores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `valores` (
  `fecha_desde` date NOT NULL,
  `nro_patente` varchar(10) NOT NULL,
  `precio_base` double NOT NULL,
  PRIMARY KEY (`fecha_desde`,`nro_patente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valores`
--

LOCK TABLES `valores` WRITE;
/*!40000 ALTER TABLE `valores` DISABLE KEYS */;
INSERT INTO `valores` VALUES ('2017-01-01','aa 123 bb',1100),('2017-01-01','aa 546 bc',1150),('2017-01-01','ag 588 fy',1250),('2017-01-01','ar 019 ia',1550),('2017-01-01','aw 745 cv',1600),('2017-01-01','cb 023 cs',1200),('2017-01-01','ce 528 ci',1300),('2017-01-01','ci 522 qs',1350),('2017-01-01','ee 412 sa',1300),('2017-01-01','lv 666 aa',1550),('2017-01-01','ml 142 ab',1200),('2017-01-01','no 593 ee',1550),('2017-01-01','rj 002 te',1200);
/*!40000 ALTER TABLE `valores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehículos`
--

DROP TABLE IF EXISTS `vehículos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehículos` (
  `nro_patente` varchar(10) NOT NULL,
  `modelo` varchar(45) NOT NULL,
  `marca` varchar(45) NOT NULL,
  `cant_asientos` int(11) NOT NULL,
  `año` int(11) NOT NULL,
  `transmision` varchar(20) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `baul` varchar(4) DEFAULT NULL,
  `tipo` varchar(15) DEFAULT NULL,
  `imagen` varchar(150) DEFAULT NULL,
  `km` float DEFAULT NULL,
  PRIMARY KEY (`nro_patente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehículos`
--

LOCK TABLES `vehículos` WRITE;
/*!40000 ALTER TABLE `vehículos` DISABLE KEYS */;
INSERT INTO `vehículos` VALUES ('aa 123 bb','Corsa','Chevrolet',4,2016,'Manual','Disponible','No','A',NULL,1250),('aa 546 bc','Corsa Classic','Chevrolet',5,2016,'Manual','Disponible','Si','A',NULL,5742),('ag 588 fy','Corolla','Toyota',5,2016,'Manual','Disponible','Si','A',NULL,0),('ar 019 ia','Captiva','Chevrolet',7,2016,'Manual','Disponible','Si','C',NULL,0),('aw 745 cv','Spin','Chevrolet',7,2016,'Manual','Disponible','Si','C','',42500),('cb 023 cs','Etios','Toyota',5,2017,'Manual','Disponible','Si','A',NULL,0),('ce 528 ci','Saveiro','Volkswagen',2,2016,'Automática','Disponible','Si','C',NULL,52860),('ci 522 qs','Duster','Renault',5,2016,'Automática','Disponible','Si','C',NULL,0),('ee 412 sa','Kangoo','Renault',2,2016,'Manual','Disponible','Si','C',NULL,20001),('lv 666 aa','Ranger','Ford',5,2017,'Automática','Disponible','Si','C',NULL,0),('ml 142 ab','Fiesta Kinetic','Ford',5,2017,'Automática','Disponible','No','A',NULL,35008),('no 593 ee','Hilux','Toyota',5,2017,'Manual','Disponible','Si','C',NULL,0),('qq123ww','siena','fiat',5,2014,'manual','libre','s','auto',NULL,1000),('rj 002 te','Onix','Chevrolet',4,2017,'Manual','Disponible','Si','A',NULL,23695);
/*!40000 ALTER TABLE `vehículos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-02 16:38:21
