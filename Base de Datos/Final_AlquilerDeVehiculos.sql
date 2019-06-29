CREATE DATABASE  IF NOT EXISTS `Final_AlquilerDeVehiculos` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `Final_AlquilerDeVehiculos`;
-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: Final_AlquilerDeVehiculos
-- ------------------------------------------------------
-- Server version	5.7.26-0ubuntu0.18.04.1

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
  `nro_alquiler` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_desde` date NOT NULL,
  `fecha_hasta` date NOT NULL,
  `fecha_cancelacion` date DEFAULT NULL,
  `importe_cancelacion` double DEFAULT NULL,
  `precio_alquiler` float NOT NULL,
  `fecha_finalizacion` date DEFAULT NULL,
  `precio_final_alquiler` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`nro_alquiler`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alquileres`
--

LOCK TABLES `alquileres` WRITE;
/*!40000 ALTER TABLE `alquileres` DISABLE KEYS */;
INSERT INTO `alquileres` VALUES (1,'2019-06-30','2019-07-02',NULL,NULL,180,NULL,NULL),(2,'2019-07-04','2019-07-08',NULL,NULL,4600,NULL,NULL),(3,'2019-07-09','2019-07-10',NULL,NULL,1500,NULL,NULL),(4,'2019-06-30','2019-07-03',NULL,NULL,4800,NULL,NULL),(5,'2019-07-05','2019-07-07',NULL,NULL,158,NULL,NULL),(6,'2019-07-03','2019-07-05',NULL,NULL,0,NULL,NULL),(7,'2019-07-10','2019-07-12',NULL,NULL,242,NULL,NULL),(8,'2019-07-05','2019-07-08','2019-06-29',0,4500,NULL,'0.0'),(9,'2019-07-05','2019-07-08',NULL,NULL,4500,NULL,NULL);
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
INSERT INTO `cli-veh-alq` VALUES ('arian.valles@outlook.com',4,'AW 745 CV'),('arian.valles@outlook.com',5,'CE 528 CI'),('ceci.acciarini@hotmail.com',6,'AR 019 IA'),('ceci.acciarini@hotmail.com',7,'AA 123 BB'),('esteban@quito.com',8,'ZE 461 CD'),('esteban@quito.com',9,'ZE 461 CD'),('noe.cano210@gmail.com',1,'AG 588 FY'),('noe.cano210@gmail.com',2,'AA 546 BC'),('noe.cano210@gmail.com',3,'CE 245 CI');
/*!40000 ALTER TABLE `cli-veh-alq` ENABLE KEYS */;
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
INSERT INTO `usuario` VALUES ('arian.valles@outlook.com','arian',38587019,'Arian','Valles','Italia 2037','1994-12-09','154650787','2018-12-20','534535353453453533','N'),('ceci.acciarini@gmail.com','ceci',38815528,'Cecilia','Acciarini','Mitre 1356','1995-03-25','15586667','2022-01-01',NULL,'S'),('ceci.acciarini@hotmail.com','ceci',38815528,'Cecilia','Acciarini','Mitre 1356','1995-03-25','15586667','2022-01-01','534535353453453533','N'),('elary22@live.com','arian',38587019,'Arian','Valles','Italia 2037','1994-12-09','32232432432','2222-03-09',NULL,'S'),('esteban@quito.com','arian',34556437,'Esteban','Quito','Roca 390','2019-06-19','35678765432','2019-06-28','534535353453453533','N'),('noe.cano210@gmail.com','noe',34720593,'Noelia','Cano','Amenabo 2150','1989-10-02','156930684','2023-05-01','534535353453453533','N'),('noe2@live.com','noe',154,'noelia','cano','cordoba 1659','1111-11-11','43211122333','2222-02-11',NULL,'N'),('noe_04_2@hotmail.com','noe',34720593,'Noelia','Cano','Amenabo 2150','1989-10-02','156930684','2023-05-01',NULL,'S');
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
  PRIMARY KEY (`fecha_desde`,`nro_patente`,`precio_base`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valores`
--

LOCK TABLES `valores` WRITE;
/*!40000 ALTER TABLE `valores` DISABLE KEYS */;
INSERT INTO `valores` VALUES ('2017-01-01','AA 123 BB',1100),('2017-01-01','AA 546 BC',1150),('2017-01-01','AG 588 FY',1250),('2017-01-01','AR 019 IA',1550),('2017-01-01','AW 745 CV',1600),('2017-01-01','CB 023 CS',1200),('2017-01-01','CE 528 CI',1300),('2017-01-01','CI 522 QS',1350),('2017-01-01','EE 412 SA',1300),('2017-01-01','LV 666 AA',1550),('2017-01-01','ML 142 AB',1200),('2017-01-01','NO 593 EE',1550),('2017-01-01','RJ 002 TE',1200),('2018-04-10','4DGRF32',140),('2018-07-10','CE 245 CI',1500),('2018-07-18','AR 019 IA',0),('2018-07-18','AR 433 IA',0),('2018-07-18','CI 522 QS',0),('2018-07-18','ER 194 SA',80),('2018-08-08','AG 588 FY',0),('2018-08-08','AR 433 IA',0),('2018-08-21','AA 123 BB',84),('2018-08-22','AG 588 FY',90),('2018-08-23','CE 528 CI',79),('2018-08-27','AA 123 BB',121),('2018-08-27','AR 433 IA',0),('2019-04-02','CN 123 AN',1500),('2019-04-02','EE 412 SA',1300),('2019-04-02','RJ 002 TE',1200),('2019-04-04','CN 123 AQ',1500),('2019-04-04','ZE 461 CD',1500),('2019-04-05','DA 333 AD',1570),('2019-06-29','AR 019 IA',100),('2019-06-29','AR 433 IA',102),('2019-06-29','CI 522 QS',49);
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
INSERT INTO `vehículos` VALUES ('AA 123 BB','Corsa','Chevrolet',4,2016,'Manual','Disponible','No','A',NULL,1250),('AA 546 BC','Corsa Classic','Chevrolet',5,2016,'Manual','Disponible','Si','A',NULL,5742),('AG 588 FY','Corolla','Toyota',5,2016,'Manual','Disponible','Si','A',NULL,0),('AR 019 IA','Captiva','Chevrolet',4,2016,'Manual','Disponible','on','C',NULL,1002),('AR 433 IA','Toro','FIat',2,2018,'Automatica','En uso',NULL,'A',NULL,313),('AW 745 CV','Spin','Chevrolet',7,2016,'Manual','Disponible','Si','C',NULL,42500),('CB 023 CS','Etios','Toyota',5,2017,'Manual','Disponible','Si','A',NULL,0),('CE 245 CI','C3','Citroen',4,2018,'Manual','Disponible','No','A',NULL,2500),('CE 528 CI','Saveiro','Volkswagen',2,2016,'Automática','Disponible','Si','C',NULL,52860),('CI 522 QS','Duster','Renault',5,2016,'Automática','Disponible','on','C',NULL,0),('CN 123 AN','Focus','Ford',5,2019,'Manual','Disponible','Si','A',NULL,0),('CN 123 AQ','Onix','BMW',3,2019,'Automática','Disponible','Si','A',NULL,23695),('DA 333 AD','Clio','Fiat',3,2012,'Manual','Disponible','Si','C',NULL,23695),('EE 412 SA','Kangoo','Renault',2,2016,'Manual','Disponible','Si','C',NULL,20001),('ER 194 SA','Toro','Fiat',7,2019,'Automatica','Disponible','S','A',NULL,0),('FF 465 IH','Toro','FIat',4,2016,'Manual','Disponible','S','A',NULL,391),('LV 666 AA','Ranger','Ford',5,2017,'Automática','Disponible','Si','C',NULL,0),('ML 142 AB','Fiesta Kinetic','Ford',5,2017,'Automática','Disponible','No','A',NULL,35008),('NO 593 EE','Hilux','Toyota',5,2017,'Manual','Disponible','Si','C',NULL,0),('QQ 123 WW','Siena','Fiat',5,2014,'Manual','Disponibli','Si','A',NULL,1000),('ZE 461 CD','Onix','Ford',3,2018,'Automática','Disponible','Si','A',NULL,23695);
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

-- Dump completed on 2019-06-29 18:57:53
