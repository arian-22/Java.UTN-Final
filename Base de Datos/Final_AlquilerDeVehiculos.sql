CREATE DATABASE  IF NOT EXISTS `Final_AlquilerDeVehiculos` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `Final_AlquilerDeVehiculos`;
-- MySQL dump 10.13  Distrib 5.7.17, for Linux (x86_64)
--
-- Host: localhost    Database: Final_AlquilerDeVehiculos
-- ------------------------------------------------------
-- Server version	5.7.17-0ubuntu0.16.04.2

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
-- Table structure for table `Alquileres`
--

DROP TABLE IF EXISTS `Alquileres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Alquileres` (
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
-- Dumping data for table `Alquileres`
--

LOCK TABLES `Alquileres` WRITE;
/*!40000 ALTER TABLE `Alquileres` DISABLE KEYS */;
/*!40000 ALTER TABLE `Alquileres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cli-Veh-Alq`
--

DROP TABLE IF EXISTS `Cli-Veh-Alq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cli-Veh-Alq` (
  `mail` varchar(60) NOT NULL,
  `nro_alquiler` int(11) NOT NULL,
  `nro_patente` varchar(10) NOT NULL,
  PRIMARY KEY (`mail`,`nro_alquiler`,`nro_patente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cli-Veh-Alq`
--

LOCK TABLES `Cli-Veh-Alq` WRITE;
/*!40000 ALTER TABLE `Cli-Veh-Alq` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cli-Veh-Alq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Detalles-Penalizacion`
--

DROP TABLE IF EXISTS `Detalles-Penalizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Detalles-Penalizacion` (
  `id_detalle` int(11) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `importe` double NOT NULL,
  `id_comprobante` int(11) NOT NULL,
  PRIMARY KEY (`id_detalle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Detalles-Penalizacion`
--

LOCK TABLES `Detalles-Penalizacion` WRITE;
/*!40000 ALTER TABLE `Detalles-Penalizacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `Detalles-Penalizacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Devolucion`
--

DROP TABLE IF EXISTS `Devolucion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Devolucion` (
  `nro_alquiler` int(11) NOT NULL,
  `fecha_devolucion` date NOT NULL,
  `id_comprobante` int(11) NOT NULL,
  `mail` varchar(60) NOT NULL,
  `hora` time(5) NOT NULL,
  PRIMARY KEY (`nro_alquiler`,`fecha_devolucion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Devolucion`
--

LOCK TABLES `Devolucion` WRITE;
/*!40000 ALTER TABLE `Devolucion` DISABLE KEYS */;
/*!40000 ALTER TABLE `Devolucion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pagos`
--

DROP TABLE IF EXISTS `Pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Pagos` (
  `id_comprobante` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `importe_alquiler` double NOT NULL,
  `importe_total` double NOT NULL,
  PRIMARY KEY (`id_comprobante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pagos`
--

LOCK TABLES `Pagos` WRITE;
/*!40000 ALTER TABLE `Pagos` DISABLE KEYS */;
/*!40000 ALTER TABLE `Pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuario`
--

DROP TABLE IF EXISTS `Usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Usuario` (
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
  PRIMARY KEY (`mail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuario`
--

LOCK TABLES `Usuario` WRITE;
/*!40000 ALTER TABLE `Usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `Usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Valores`
--

DROP TABLE IF EXISTS `Valores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Valores` (
  `fecha_desde` date NOT NULL,
  `nro_patente` varchar(10) NOT NULL,
  `precio` double NOT NULL,
  PRIMARY KEY (`fecha_desde`,`nro_patente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Valores`
--

LOCK TABLES `Valores` WRITE;
/*!40000 ALTER TABLE `Valores` DISABLE KEYS */;
/*!40000 ALTER TABLE `Valores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vehículos`
--

DROP TABLE IF EXISTS `Vehículos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Vehículos` (
  `nro_patente` varchar(10) NOT NULL,
  `modelo` varchar(45) NOT NULL,
  `marca` varchar(45) NOT NULL,
  `cant_asientos` int(11) NOT NULL,
  `año` int(11) NOT NULL,
  `transmisión` varchar(20) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `baul` varchar(4) DEFAULT NULL,
  `precio_extra` double DEFAULT NULL,
  `cabina` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`nro_patente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vehículos`
--

LOCK TABLES `Vehículos` WRITE;
/*!40000 ALTER TABLE `Vehículos` DISABLE KEYS */;
/*!40000 ALTER TABLE `Vehículos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'Final_AlquilerDeVehiculos'
--

--
-- Dumping routines for database 'Final_AlquilerDeVehiculos'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-13 13:37:02
