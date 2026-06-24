-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: taqueria_el_guero
-- ------------------------------------------------------
-- Server version	8.0.43
CREATE DATABASE IF NOT EXISTS taqueria_el_guero 
CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;

USE taqueria_el_guero;

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
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra` (
  `id_compra` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `total` decimal(12,2) NOT NULL,
  `id_proveedor` int NOT NULL,
  `id_empleado` int NOT NULL,
  PRIMARY KEY (`id_compra`),
  KEY `fk_compra_proveedor` (`id_proveedor`),
  KEY `fk_compra_empleado` (`id_empleado`),
  KEY `idx_fecha_compra` (`fecha`),
  CONSTRAINT `fk_compra_empleado` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_compra_proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `chk_total_compra` CHECK ((`total` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` VALUES (1,'2025-07-02',1200.00,2,2),(2,'2025-07-03',1400.00,3,3),(3,'2025-07-04',1600.00,4,4),(4,'2025-07-05',1800.00,5,5),(5,'2025-07-06',2000.00,6,6),(6,'2025-07-07',2200.00,7,7),(7,'2025-07-08',2400.00,8,8),(8,'2025-07-09',2600.00,9,9),(9,'2025-07-10',2800.00,10,10),(10,'2025-07-11',1000.00,11,11),(11,'2025-07-12',1200.00,12,12),(12,'2025-07-13',1400.00,13,13),(13,'2025-07-14',1600.00,14,14),(14,'2025-07-15',1800.00,15,15),(15,'2025-07-16',2000.00,16,16),(16,'2025-07-17',2200.00,17,17),(17,'2025-07-18',2400.00,18,18),(18,'2025-07-19',2600.00,19,19),(19,'2025-07-20',2800.00,20,20),(20,'2025-07-21',1000.00,1,21),(21,'2025-07-22',1200.00,2,22),(22,'2025-07-23',1400.00,3,23),(23,'2025-07-24',1600.00,4,24),(24,'2025-07-25',1800.00,5,25),(25,'2025-07-26',2000.00,6,26),(26,'2025-07-27',2200.00,7,27),(27,'2025-07-28',2400.00,8,28),(28,'2025-07-29',2600.00,9,29),(29,'2025-07-30',2800.00,10,30),(30,'2025-07-31',1000.00,11,31),(31,'2025-08-01',1200.00,12,32),(32,'2025-08-02',1400.00,13,33),(33,'2025-08-03',1600.00,14,34),(34,'2025-08-04',1800.00,15,35),(35,'2025-08-05',2000.00,16,36),(36,'2025-08-06',2200.00,17,37),(37,'2025-08-07',2400.00,18,38),(38,'2025-08-08',2600.00,19,39),(39,'2025-08-09',2800.00,20,40),(40,'2025-08-10',1000.00,1,41),(41,'2025-08-11',1200.00,2,42),(42,'2025-08-12',1400.00,3,43),(43,'2025-08-13',1600.00,4,44),(44,'2025-08-14',1800.00,5,45),(45,'2025-08-15',2000.00,6,46),(46,'2025-08-16',2200.00,7,47),(47,'2025-08-17',2400.00,8,48),(48,'2025-08-18',2600.00,9,49),(49,'2025-08-19',2800.00,10,50),(50,'2025-08-20',1000.00,11,51),(51,'2025-08-21',1200.00,12,52),(52,'2025-08-22',1400.00,13,53),(53,'2025-08-23',1600.00,14,54),(54,'2025-08-24',1800.00,15,55),(55,'2025-08-25',2000.00,16,56),(56,'2025-08-26',2200.00,17,57),(57,'2025-08-27',2400.00,18,58),(58,'2025-08-28',2600.00,19,59),(59,'2025-08-29',2800.00,20,60),(60,'2025-08-30',1000.00,1,61),(61,'2025-08-31',1200.00,2,62),(62,'2025-09-01',1400.00,3,63),(63,'2025-09-02',1600.00,4,64),(64,'2025-09-03',1800.00,5,65),(65,'2025-09-04',2000.00,6,66),(66,'2025-09-05',2200.00,7,67),(67,'2025-09-06',2400.00,8,68),(68,'2025-09-07',2600.00,9,69),(69,'2025-09-08',2800.00,10,70),(70,'2025-09-09',1000.00,11,71),(71,'2025-09-10',1200.00,12,72),(72,'2025-09-11',1400.00,13,73),(73,'2025-09-12',1600.00,14,74),(74,'2025-09-13',1800.00,15,75),(75,'2025-09-14',2000.00,16,76),(76,'2025-09-15',2200.00,17,77),(77,'2025-09-16',2400.00,18,78),(78,'2025-09-17',2600.00,19,79),(79,'2025-09-18',2800.00,20,80),(80,'2025-09-19',1000.00,1,81),(81,'2025-09-20',1200.00,2,82),(82,'2025-09-21',1400.00,3,83),(83,'2025-09-22',1600.00,4,84),(84,'2025-09-23',1800.00,5,85),(85,'2025-09-24',2000.00,6,86),(86,'2025-09-25',2200.00,7,87),(87,'2025-09-26',2400.00,8,88),(88,'2025-09-27',2600.00,9,89),(89,'2025-09-28',2800.00,10,90),(90,'2025-09-29',1000.00,11,91),(91,'2025-09-30',1200.00,12,92),(92,'2025-10-01',1400.00,13,93),(93,'2025-10-02',1600.00,14,94),(94,'2025-10-03',1800.00,15,95),(95,'2025-10-04',2000.00,16,96),(96,'2025-10-05',2200.00,17,97),(97,'2025-10-06',2400.00,18,98),(98,'2025-10-07',2600.00,19,99),(99,'2025-10-08',2800.00,20,100),(100,'2025-10-09',1000.00,1,1);
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_compra`
--

DROP TABLE IF EXISTS `detalle_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_compra` (
  `id_detalle_compra` int NOT NULL AUTO_INCREMENT,
  `id_compra` int NOT NULL,
  `id_ingrediente` int NOT NULL,
  `cantidad` decimal(10,2) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_detalle_compra`),
  KEY `fk_det_compra_compra` (`id_compra`),
  KEY `fk_det_compra_ingrediente` (`id_ingrediente`),
  CONSTRAINT `fk_det_compra_compra` FOREIGN KEY (`id_compra`) REFERENCES `compra` (`id_compra`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_det_compra_ingrediente` FOREIGN KEY (`id_ingrediente`) REFERENCES `ingrediente` (`id_ingrediente`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `chk_cantidad_det_compra` CHECK ((`cantidad` > 0)),
  CONSTRAINT `chk_precio_unit_dc` CHECK ((`precio_unitario` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_compra`
--

LOCK TABLES `detalle_compra` WRITE;
/*!40000 ALTER TABLE `detalle_compra` DISABLE KEYS */;
INSERT INTO `detalle_compra` VALUES (1,1,1,10.00,10.00),(2,2,2,11.00,11.00),(3,3,3,12.00,12.00),(4,4,4,13.00,13.00),(5,5,5,14.00,14.00),(6,6,6,15.00,15.00),(7,7,7,16.00,16.00),(8,8,8,17.00,17.00),(9,9,9,18.00,18.00),(10,10,10,19.00,19.00),(11,11,11,20.00,20.00),(12,12,12,21.00,21.00),(13,13,13,22.00,22.00),(14,14,14,23.00,23.00),(15,15,15,24.00,24.00),(16,16,16,25.00,25.00),(17,17,17,26.00,26.00),(18,18,18,27.00,27.00),(19,19,19,28.00,28.00),(20,20,20,29.00,29.00),(21,21,21,30.00,30.00),(22,22,22,31.00,31.00),(23,23,23,32.00,32.00),(24,24,24,33.00,33.00),(25,25,25,34.00,34.00),(26,26,26,35.00,35.00),(27,27,27,36.00,36.00),(28,28,28,37.00,37.00),(29,29,29,38.00,38.00),(30,30,30,39.00,39.00),(31,31,31,40.00,40.00),(32,32,32,41.00,41.00),(33,33,33,42.00,42.00),(34,34,34,43.00,43.00),(35,35,35,44.00,44.00),(36,36,36,45.00,45.00),(37,37,37,46.00,46.00),(38,38,38,47.00,47.00),(39,39,39,48.00,48.00),(40,40,40,49.00,49.00),(41,41,41,50.00,50.00),(42,42,42,51.00,51.00),(43,43,43,52.00,52.00),(44,44,44,53.00,53.00),(45,45,45,54.00,54.00),(46,46,46,55.00,55.00),(47,47,47,56.00,56.00),(48,48,48,57.00,57.00),(49,49,49,58.00,58.00),(50,50,50,59.00,59.00),(51,51,51,10.00,60.00),(52,52,52,11.00,61.00),(53,53,53,12.00,62.00),(54,54,54,13.00,63.00),(55,55,55,14.00,64.00),(56,56,56,15.00,65.00),(57,57,57,16.00,66.00),(58,58,58,17.00,67.00),(59,59,59,18.00,68.00),(60,60,60,19.00,69.00),(61,61,61,20.00,70.00),(62,62,62,21.00,71.00),(63,63,63,22.00,72.00),(64,64,64,23.00,73.00),(65,65,65,24.00,74.00),(66,66,66,25.00,75.00),(67,67,67,26.00,76.00),(68,68,68,27.00,77.00),(69,69,69,28.00,78.00),(70,70,70,29.00,79.00),(71,71,1,30.00,80.00),(72,72,2,31.00,81.00),(73,73,3,32.00,82.00),(74,74,4,33.00,83.00),(75,75,5,34.00,84.00),(76,76,6,35.00,85.00),(77,77,7,36.00,86.00),(78,78,8,37.00,87.00),(79,79,9,38.00,88.00),(80,80,10,39.00,89.00),(81,81,11,40.00,90.00),(82,82,12,41.00,91.00),(83,83,13,42.00,92.00),(84,84,14,43.00,93.00),(85,85,15,44.00,94.00),(86,86,16,45.00,95.00),(87,87,17,46.00,96.00),(88,88,18,47.00,97.00),(89,89,19,48.00,98.00),(90,90,20,49.00,99.00),(91,91,21,50.00,100.00),(92,92,22,51.00,101.00),(93,93,23,52.00,102.00),(94,94,24,53.00,103.00),(95,95,25,54.00,104.00),(96,96,26,55.00,105.00),(97,97,27,56.00,106.00),(98,98,28,57.00,107.00),(99,99,29,58.00,108.00),(100,100,30,59.00,109.00);
/*!40000 ALTER TABLE `detalle_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_venta`
--

DROP TABLE IF EXISTS `detalle_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_venta` (
  `id_detalle` int NOT NULL AUTO_INCREMENT,
  `id_venta` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` int NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `fk_det_venta_venta` (`id_venta`),
  KEY `fk_det_venta_producto` (`id_producto`),
  CONSTRAINT `fk_det_venta_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_det_venta_venta` FOREIGN KEY (`id_venta`) REFERENCES `venta` (`id_venta`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `chk_cantidad_detalle` CHECK ((`cantidad` > 0)),
  CONSTRAINT `chk_precio_unitario` CHECK ((`precio_unitario` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=512 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_venta`
--

LOCK TABLES `detalle_venta` WRITE;
/*!40000 ALTER TABLE `detalle_venta` DISABLE KEYS */;
INSERT INTO `detalle_venta` VALUES (1,1,1,1,10.00),(2,2,2,2,11.00),(3,3,3,3,12.00),(4,4,4,4,13.00),(5,5,5,5,14.00),(6,6,6,1,15.00),(7,7,7,2,16.00),(8,8,8,3,17.00),(9,9,9,4,18.00),(10,10,10,5,19.00),(11,11,11,1,20.00),(12,12,12,2,21.00),(13,13,13,3,22.00),(14,14,14,4,23.00),(15,15,15,5,24.00),(16,16,16,1,25.00),(17,17,17,2,26.00),(18,18,18,3,27.00),(19,19,19,4,28.00),(20,20,20,5,29.00),(21,21,21,1,30.00),(22,22,22,2,31.00),(23,23,23,3,32.00),(24,24,24,4,33.00),(25,25,25,5,34.00),(26,26,26,1,35.00),(27,27,27,2,36.00),(28,28,28,3,37.00),(29,29,29,4,38.00),(30,30,30,5,39.00),(31,31,31,1,40.00),(32,32,32,2,41.00),(33,33,33,3,42.00),(34,34,34,4,43.00),(35,35,35,5,44.00),(36,36,36,1,45.00),(37,37,37,2,46.00),(38,38,38,3,47.00),(39,39,39,4,48.00),(40,40,40,5,49.00),(41,41,41,1,50.00),(42,42,42,2,51.00),(43,43,43,3,52.00),(44,44,44,4,53.00),(45,45,45,5,54.00),(46,46,46,1,55.00),(47,47,47,2,56.00),(48,48,48,3,57.00),(49,49,49,4,58.00),(50,50,50,5,59.00),(51,51,51,1,60.00),(52,52,52,2,61.00),(53,53,53,3,62.00),(54,54,54,4,63.00),(55,55,55,5,64.00),(56,56,56,1,65.00),(57,57,57,2,66.00),(58,58,58,3,67.00),(59,59,59,4,68.00),(60,60,60,5,69.00),(61,61,61,1,70.00),(62,62,62,2,71.00),(63,63,63,3,72.00),(64,64,64,4,73.00),(65,65,65,5,74.00),(66,66,66,1,75.00),(67,67,67,2,76.00),(68,68,68,3,77.00),(69,69,69,4,78.00),(70,70,70,5,79.00),(71,71,71,1,80.00),(72,72,72,2,81.00),(73,73,73,3,82.00),(74,74,74,4,83.00),(75,75,75,5,84.00),(76,76,76,1,85.00),(77,77,77,2,86.00),(78,78,78,3,87.00),(79,79,79,4,88.00),(80,80,80,5,89.00),(81,81,81,1,90.00),(82,82,82,2,91.00),(83,83,83,3,92.00),(84,84,84,4,93.00),(85,85,85,5,94.00),(86,86,86,1,95.00),(87,87,87,2,96.00),(88,88,88,3,97.00),(89,89,89,4,98.00),(90,90,90,5,99.00),(91,91,91,1,100.00),(92,92,92,2,101.00),(93,93,93,3,102.00),(94,94,94,4,103.00),(95,95,95,5,104.00),(96,96,96,1,105.00),(97,97,97,2,106.00),(98,98,98,3,107.00),(99,99,99,4,108.00),(100,100,100,5,109.00),(101,1,1,1,10.00),(102,2,2,2,11.00),(103,3,3,3,12.00),(104,4,4,4,13.00),(105,5,5,5,14.00),(106,6,6,1,15.00),(107,7,7,2,16.00),(108,8,8,3,17.00),(109,9,9,4,18.00),(110,10,10,5,19.00),(111,11,11,1,20.00),(112,12,12,2,21.00),(113,13,13,3,22.00),(114,14,14,4,23.00),(115,15,15,5,24.00),(116,16,16,1,25.00),(117,17,17,2,26.00),(118,18,18,3,27.00),(119,19,19,4,28.00),(120,20,20,5,29.00),(121,21,21,1,30.00),(122,22,22,2,31.00),(123,23,23,3,32.00),(124,24,24,4,33.00),(125,25,25,5,34.00),(126,26,26,1,35.00),(127,27,27,2,36.00),(128,28,28,3,37.00),(129,29,29,4,38.00),(130,30,30,5,39.00),(131,31,31,1,40.00),(132,32,32,2,41.00),(133,33,33,3,42.00),(134,34,34,4,43.00),(135,35,35,5,44.00),(136,36,36,1,45.00),(137,37,37,2,46.00),(138,38,38,3,47.00),(139,39,39,4,48.00),(140,40,40,5,49.00),(141,41,41,1,50.00),(142,42,42,2,51.00),(143,43,43,3,52.00),(144,44,44,4,53.00),(145,45,45,5,54.00),(146,46,46,1,55.00),(147,47,47,2,56.00),(148,48,48,3,57.00),(149,49,49,4,58.00),(150,50,50,5,59.00),(151,51,51,1,60.00),(152,52,52,2,61.00),(153,53,53,3,62.00),(154,54,54,4,63.00),(155,55,55,5,64.00),(156,56,56,1,65.00),(157,57,57,2,66.00),(158,58,58,3,67.00),(159,59,59,4,68.00),(160,60,60,5,69.00),(161,61,61,1,70.00),(162,62,62,2,71.00),(163,63,63,3,72.00),(164,64,64,4,73.00),(165,65,65,5,74.00),(166,66,66,1,75.00),(167,67,67,2,76.00),(168,68,68,3,77.00),(169,69,69,4,78.00),(170,70,70,5,79.00),(171,71,71,1,80.00),(172,72,72,2,81.00),(173,73,73,3,82.00),(174,74,74,4,83.00),(175,75,75,5,84.00),(176,76,76,1,85.00),(177,77,77,2,86.00),(178,78,78,3,87.00),(179,79,79,4,88.00),(180,80,80,5,89.00),(181,81,81,1,90.00),(182,82,82,2,91.00),(183,83,83,3,92.00),(184,84,84,4,93.00),(185,85,85,5,94.00),(186,86,86,1,95.00),(187,87,87,2,96.00),(188,88,88,3,97.00),(189,89,89,4,98.00),(190,90,90,5,99.00),(191,91,91,1,100.00),(192,92,92,2,101.00),(193,93,93,3,102.00),(194,94,94,4,103.00),(195,95,95,5,104.00),(196,96,96,1,105.00),(197,97,97,2,106.00),(198,98,98,3,107.00),(199,99,99,4,108.00),(200,100,100,5,109.00),(201,1,1,1,10.00),(202,2,2,2,11.00),(203,3,3,3,12.00),(204,4,4,4,13.00),(205,5,5,5,14.00),(206,6,6,1,15.00),(207,7,7,2,16.00),(208,8,8,3,17.00),(209,9,9,4,18.00),(210,10,10,5,19.00),(211,11,11,1,20.00),(212,12,12,2,21.00),(213,13,13,3,22.00),(214,14,14,4,23.00),(215,15,15,5,24.00),(216,16,16,1,25.00),(217,17,17,2,26.00),(218,18,18,3,27.00),(219,19,19,4,28.00),(220,20,20,5,29.00),(221,21,21,1,30.00),(222,22,22,2,31.00),(223,23,23,3,32.00),(224,24,24,4,33.00),(225,25,25,5,34.00),(226,26,26,1,35.00),(227,27,27,2,36.00),(228,28,28,3,37.00),(229,29,29,4,38.00),(230,30,30,5,39.00),(231,31,31,1,40.00),(232,32,32,2,41.00),(233,33,33,3,42.00),(234,34,34,4,43.00),(235,35,35,5,44.00),(236,36,36,1,45.00),(237,37,37,2,46.00),(238,38,38,3,47.00),(239,39,39,4,48.00),(240,40,40,5,49.00),(241,41,41,1,50.00),(242,42,42,2,51.00),(243,43,43,3,52.00),(244,44,44,4,53.00),(245,45,45,5,54.00),(246,46,46,1,55.00),(247,47,47,2,56.00),(248,48,48,3,57.00),(249,49,49,4,58.00),(250,50,50,5,59.00),(251,51,51,1,60.00),(252,52,52,2,61.00),(253,53,53,3,62.00),(254,54,54,4,63.00),(255,55,55,5,64.00),(256,56,56,1,65.00),(257,57,57,2,66.00),(258,58,58,3,67.00),(259,59,59,4,68.00),(260,60,60,5,69.00),(261,61,61,1,70.00),(262,62,62,2,71.00),(263,63,63,3,72.00),(264,64,64,4,73.00),(265,65,65,5,74.00),(266,66,66,1,75.00),(267,67,67,2,76.00),(268,68,68,3,77.00),(269,69,69,4,78.00),(270,70,70,5,79.00),(271,71,71,1,80.00),(272,72,72,2,81.00),(273,73,73,3,82.00),(274,74,74,4,83.00),(275,75,75,5,84.00),(276,76,76,1,85.00),(277,77,77,2,86.00),(278,78,78,3,87.00),(279,79,79,4,88.00),(280,80,80,5,89.00),(281,81,81,1,90.00),(282,82,82,2,91.00),(283,83,83,3,92.00),(284,84,84,4,93.00),(285,85,85,5,94.00),(286,86,86,1,95.00),(287,87,87,2,96.00),(288,88,88,3,97.00),(289,89,89,4,98.00),(290,90,90,5,99.00),(291,91,91,1,100.00),(292,92,92,2,101.00),(293,93,93,3,102.00),(294,94,94,4,103.00),(295,95,95,5,104.00),(296,96,96,1,105.00),(297,97,97,2,106.00),(298,98,98,3,107.00),(299,99,99,4,108.00),(300,100,100,5,109.00),(301,1,1,1,10.00),(302,2,2,2,11.00),(303,3,3,3,12.00),(304,4,4,4,13.00),(305,5,5,5,14.00),(306,6,6,1,15.00),(307,7,7,2,16.00),(308,8,8,3,17.00),(309,9,9,4,18.00),(310,10,10,5,19.00),(311,11,11,1,20.00),(312,12,12,2,21.00),(313,13,13,3,22.00),(314,14,14,4,23.00),(315,15,15,5,24.00),(316,16,16,1,25.00),(317,17,17,2,26.00),(318,18,18,3,27.00),(319,19,19,4,28.00),(320,20,20,5,29.00),(321,21,21,1,30.00),(322,22,22,2,31.00),(323,23,23,3,32.00),(324,24,24,4,33.00),(325,25,25,5,34.00),(326,26,26,1,35.00),(327,27,27,2,36.00),(328,28,28,3,37.00),(329,29,29,4,38.00),(330,30,30,5,39.00),(331,31,31,1,40.00),(332,32,32,2,41.00),(333,33,33,3,42.00),(334,34,34,4,43.00),(335,35,35,5,44.00),(336,36,36,1,45.00),(337,37,37,2,46.00),(338,38,38,3,47.00),(339,39,39,4,48.00),(340,40,40,5,49.00),(341,41,41,1,50.00),(342,42,42,2,51.00),(343,43,43,3,52.00),(344,44,44,4,53.00),(345,45,45,5,54.00),(346,46,46,1,55.00),(347,47,47,2,56.00),(348,48,48,3,57.00),(349,49,49,4,58.00),(350,50,50,5,59.00),(351,51,51,1,60.00),(352,52,52,2,61.00),(353,53,53,3,62.00),(354,54,54,4,63.00),(355,55,55,5,64.00),(356,56,56,1,65.00),(357,57,57,2,66.00),(358,58,58,3,67.00),(359,59,59,4,68.00),(360,60,60,5,69.00),(361,61,61,1,70.00),(362,62,62,2,71.00),(363,63,63,3,72.00),(364,64,64,4,73.00),(365,65,65,5,74.00),(366,66,66,1,75.00),(367,67,67,2,76.00),(368,68,68,3,77.00),(369,69,69,4,78.00),(370,70,70,5,79.00),(371,71,71,1,80.00),(372,72,72,2,81.00),(373,73,73,3,82.00),(374,74,74,4,83.00),(375,75,75,5,84.00),(376,76,76,1,85.00),(377,77,77,2,86.00),(378,78,78,3,87.00),(379,79,79,4,88.00),(380,80,80,5,89.00),(381,81,81,1,90.00),(382,82,82,2,91.00),(383,83,83,3,92.00),(384,84,84,4,93.00),(385,85,85,5,94.00),(386,86,86,1,95.00),(387,87,87,2,96.00),(388,88,88,3,97.00),(389,89,89,4,98.00),(390,90,90,5,99.00),(391,91,91,1,100.00),(392,92,92,2,101.00),(393,93,93,3,102.00),(394,94,94,4,103.00),(395,95,95,5,104.00),(396,96,96,1,105.00),(397,97,97,2,106.00),(398,98,98,3,107.00),(399,99,99,4,108.00),(400,100,100,5,109.00),(401,1,1,1,10.00),(402,2,2,2,11.00),(403,3,3,3,12.00),(404,4,4,4,13.00),(405,5,5,5,14.00),(406,6,6,1,15.00),(407,7,7,2,16.00),(408,8,8,3,17.00),(409,9,9,4,18.00),(410,10,10,5,19.00),(411,11,11,1,20.00),(412,12,12,2,21.00),(413,13,13,3,22.00),(414,14,14,4,23.00),(415,15,15,5,24.00),(416,16,16,1,25.00),(417,17,17,2,26.00),(418,18,18,3,27.00),(419,19,19,4,28.00),(420,20,20,5,29.00),(421,21,21,1,30.00),(422,22,22,2,31.00),(423,23,23,3,32.00),(424,24,24,4,33.00),(425,25,25,5,34.00),(426,26,26,1,35.00),(427,27,27,2,36.00),(428,28,28,3,37.00),(429,29,29,4,38.00),(430,30,30,5,39.00),(431,31,31,1,40.00),(432,32,32,2,41.00),(433,33,33,3,42.00),(434,34,34,4,43.00),(435,35,35,5,44.00),(436,36,36,1,45.00),(437,37,37,2,46.00),(438,38,38,3,47.00),(439,39,39,4,48.00),(440,40,40,5,49.00),(441,41,41,1,50.00),(442,42,42,2,51.00),(443,43,43,3,52.00),(444,44,44,4,53.00),(445,45,45,5,54.00),(446,46,46,1,55.00),(447,47,47,2,56.00),(448,48,48,3,57.00),(449,49,49,4,58.00),(450,50,50,5,59.00),(451,51,51,1,60.00),(452,52,52,2,61.00),(453,53,53,3,62.00),(454,54,54,4,63.00),(455,55,55,5,64.00),(456,56,56,1,65.00),(457,57,57,2,66.00),(458,58,58,3,67.00),(459,59,59,4,68.00),(460,60,60,5,69.00),(461,61,61,1,70.00),(462,62,62,2,71.00),(463,63,63,3,72.00),(464,64,64,4,73.00),(465,65,65,5,74.00),(466,66,66,1,75.00),(467,67,67,2,76.00),(468,68,68,3,77.00),(469,69,69,4,78.00),(470,70,70,5,79.00),(471,71,71,1,80.00),(472,72,72,2,81.00),(473,73,73,3,82.00),(474,74,74,4,83.00),(475,75,75,5,84.00),(476,76,76,1,85.00),(477,77,77,2,86.00),(478,78,78,3,87.00),(479,79,79,4,88.00),(480,80,80,5,89.00),(481,81,81,1,90.00),(482,82,82,2,91.00),(483,83,83,3,92.00),(484,84,84,4,93.00),(485,85,85,5,94.00),(486,86,86,1,95.00),(487,87,87,2,96.00),(488,88,88,3,97.00),(489,89,89,4,98.00),(490,90,90,5,99.00),(491,91,91,1,100.00),(492,92,92,2,101.00),(493,93,93,3,102.00),(494,94,94,4,103.00),(495,95,95,5,104.00),(496,96,96,1,105.00),(497,97,97,2,106.00),(498,98,98,3,107.00),(499,99,99,4,108.00),(500,100,100,5,109.00);
/*!40000 ALTER TABLE `detalle_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `puesto` enum('gerente','cajero','mesero','cocinero','limpieza') COLLATE utf8mb4_unicode_ci NOT NULL,
  `estatus` enum('activo','inactivo','vacaciones') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'activo',
  PRIMARY KEY (`id_empleado`),
  CONSTRAINT `chk_nombre_empleado` CHECK ((char_length(trim(`nombre`)) >= 3))
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'Juan Pérez','gerente','activo'),(2,'María López','cajero','activo'),(3,'Carlos García','mesero','activo'),(4,'Ana Hernández','cocinero','activo'),(5,'Luis Martínez','limpieza','activo'),(6,'Laura González','cajero','activo'),(7,'Pedro Rodríguez','mesero','activo'),(8,'Sofía Sánchez','cocinero','activo'),(9,'Miguel Ramírez','limpieza','activo'),(10,'Lucía Torres','cajero','activo'),(11,'Jorge Flores','mesero','activo'),(12,'Diana Rivera','cocinero','activo'),(13,'Roberto Gómez','limpieza','activo'),(14,'Patricia Cruz','cajero','activo'),(15,'Fernando Morales','mesero','activo'),(16,'Alejandra Ortiz','cocinero','activo'),(17,'Ricardo Reyes','limpieza','activo'),(18,'Verónica López','cajero','activo'),(19,'Arturo Mendoza','mesero','activo'),(20,'Claudia Castillo','cocinero','activo'),(21,'Francisco Jiménez','limpieza','activo'),(22,'Graciela Vargas','cajero','activo'),(23,'Eduardo Mendoza','mesero','activo'),(24,'Beatriz Aguilar','cocinero','activo'),(25,'Raúl Romero','limpieza','activo'),(26,'Silvia Navarro','cajero','activo'),(27,'Alberto Delgado','mesero','activo'),(28,'Rosa Mendoza','cocinero','activo'),(29,'José Guerrero','limpieza','activo'),(30,'Teresa Campos','cajero','activo'),(31,'Manuel Ríos','mesero','activo'),(32,'Isabel Ortega','cocinero','activo'),(33,'Óscar Velázquez','limpieza','activo'),(34,'Carmen Cabrera','cajero','activo'),(35,'Héctor Solís','mesero','activo'),(36,'Alicia Contreras','cocinero','activo'),(37,'Ramón Quintero','limpieza','activo'),(38,'Marta Guzmán','cajero','activo'),(39,'Sergio Ávila','mesero','activo'),(40,'Elena Pacheco','cocinero','activo'),(41,'César Valdez','limpieza','activo'),(42,'Leticia Rojas','cajero','activo'),(43,'Mario Ibarra','mesero','activo'),(44,'Ruth Escobar','cocinero','activo'),(45,'Jaime Salazar','limpieza','activo'),(46,'Adriana Rosales','cajero','activo'),(47,'Gilberto Camacho','mesero','activo'),(48,'Olga Molina','cocinero','activo'),(49,'Darío Vega','limpieza','activo'),(50,'Monica Zúñiga','cajero','activo'),(51,'Salvador Espinoza','mesero','activo'),(52,'Esperanza Orozco','cocinero','activo'),(53,'Leonel Miranda','limpieza','activo'),(54,'Estela Rangel','cajero','activo'),(55,'Abraham Paredes','mesero','activo'),(56,'Irma Serrano','cocinero','activo'),(57,'Marcos León','limpieza','activo'),(58,'Lorena Medrano','cajero','activo'),(59,'Fabián Tapia','mesero','activo'),(60,'Lourdes Villalobos','cocinero','activo'),(61,'Elías Cárdenas','limpieza','activo'),(62,'Karla Salinas','cajero','activo'),(63,'Simón Barrera','mesero','activo'),(64,'Norma Maldonado','cocinero','activo'),(65,'Noé Cortés','limpieza','activo'),(66,'Rebeca Franco','cajero','activo'),(67,'Tomás Arias','mesero','activo'),(68,'Cecilia Tello','cocinero','activo'),(69,'Nicolás Segura','limpieza','activo'),(70,'Alejandra Ponce','cajero','activo'),(71,'Iván Carrillo','mesero','activo'),(72,'Marisol Bautista','cocinero','activo'),(73,'Dante Castañeda','limpieza','activo'),(74,'Yolanda Cervantes','cajero','activo'),(75,'Lorenzo Alvarado','mesero','activo'),(76,'Gabriela Duarte','cocinero','activo'),(77,'Agustín Lara','limpieza','activo'),(78,'Vanessa Núñez','cajero','activo'),(79,'Emiliano Valenzuela','mesero','activo'),(80,'Daniela Peralta','cocinero','activo'),(81,'Teodoro Rocha','limpieza','activo'),(82,'Paulina Gallardo','cajero','activo'),(83,'Gerardo Sosa','mesero','activo'),(84,'Magdalena Mejía','cocinero','activo'),(85,'Baltazar Delgadillo','limpieza','activo'),(86,'Renata Calvillo','cajero','activo'),(87,'Ezequiel Macías','mesero','activo'),(88,'Ingrid Bernal','cocinero','activo'),(89,'Florencio Pineda','limpieza','activo'),(90,'Julieta Lozano','cajero','activo'),(91,'Rodolfo Correa','mesero','activo'),(92,'Alma Zaragoza','cocinero','activo'),(93,'Eleazar Parra','limpieza','activo'),(94,'Miriam Gallegos','cajero','activo'),(95,'Aníbal Quezada','mesero','activo'),(96,'Patricia Velasco','cocinero','activo'),(97,'Eustaquio Carmona','limpieza','activo'),(98,'Clara Santana','cajero','activo'),(99,'Gustavo Ontiveros','mesero','activo'),(100,'Eugenia Nevárez','cocinero','activo'),(101,'Pánfilo Ruelas','limpieza','activo');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado_turno`
--

DROP TABLE IF EXISTS `empleado_turno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado_turno` (
  `id_empleado_turno` int NOT NULL AUTO_INCREMENT,
  `id_empleado` int NOT NULL,
  `id_turno` int NOT NULL,
  `fecha` date NOT NULL,
  `hora_entrada` time NOT NULL,
  `horas_trabajadas` decimal(4,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id_empleado_turno`),
  KEY `fk_empleado_turno_turno` (`id_turno`),
  KEY `idx_empleado_fecha` (`id_empleado`,`fecha`),
  CONSTRAINT `fk_empleado_turno_empleado` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_empleado_turno_turno` FOREIGN KEY (`id_turno`) REFERENCES `turno` (`id_turno`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `chk_horas_trabajadas` CHECK (((`horas_trabajadas` >= 0) and (`horas_trabajadas` <= 24)))
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado_turno`
--

LOCK TABLES `empleado_turno` WRITE;
/*!40000 ALTER TABLE `empleado_turno` DISABLE KEYS */;
INSERT INTO `empleado_turno` VALUES (1,2,2,'2025-10-02','07:00:00',8.00),(2,3,3,'2025-10-03','07:00:00',8.00),(3,4,4,'2025-10-04','07:00:00',8.00),(4,5,5,'2025-10-05','07:00:00',8.00),(5,6,1,'2025-10-06','07:00:00',8.00),(6,7,2,'2025-10-07','07:00:00',8.00),(7,8,3,'2025-10-08','07:00:00',8.00),(8,9,4,'2025-10-09','07:00:00',8.00),(9,10,5,'2025-10-10','07:00:00',8.00),(10,11,1,'2025-10-11','07:00:00',8.00),(11,12,2,'2025-10-12','07:00:00',8.00),(12,13,3,'2025-10-13','07:00:00',8.00),(13,14,4,'2025-10-14','07:00:00',8.00),(14,15,5,'2025-10-15','07:00:00',8.00),(15,16,1,'2025-10-16','07:00:00',8.00),(16,17,2,'2025-10-17','07:00:00',8.00),(17,18,3,'2025-10-18','07:00:00',8.00),(18,19,4,'2025-10-19','07:00:00',8.00),(19,20,5,'2025-10-20','07:00:00',8.00),(20,21,1,'2025-10-21','07:00:00',8.00),(21,22,2,'2025-10-22','07:00:00',8.00),(22,23,3,'2025-10-23','07:00:00',8.00),(23,24,4,'2025-10-24','07:00:00',8.00),(24,25,5,'2025-10-25','07:00:00',8.00),(25,26,1,'2025-10-26','07:00:00',8.00),(26,27,2,'2025-10-27','07:00:00',8.00),(27,28,3,'2025-10-28','07:00:00',8.00),(28,29,4,'2025-10-29','07:00:00',8.00),(29,30,5,'2025-10-30','07:00:00',8.00),(30,31,1,'2025-10-01','07:00:00',8.00),(31,32,2,'2025-10-02','07:00:00',8.00),(32,33,3,'2025-10-03','07:00:00',8.00),(33,34,4,'2025-10-04','07:00:00',8.00),(34,35,5,'2025-10-05','07:00:00',8.00),(35,36,1,'2025-10-06','07:00:00',8.00),(36,37,2,'2025-10-07','07:00:00',8.00),(37,38,3,'2025-10-08','07:00:00',8.00),(38,39,4,'2025-10-09','07:00:00',8.00),(39,40,5,'2025-10-10','07:00:00',8.00),(40,41,1,'2025-10-11','07:00:00',8.00),(41,42,2,'2025-10-12','07:00:00',8.00),(42,43,3,'2025-10-13','07:00:00',8.00),(43,44,4,'2025-10-14','07:00:00',8.00),(44,45,5,'2025-10-15','07:00:00',8.00),(45,46,1,'2025-10-16','07:00:00',8.00),(46,47,2,'2025-10-17','07:00:00',8.00),(47,48,3,'2025-10-18','07:00:00',8.00),(48,49,4,'2025-10-19','07:00:00',8.00),(49,50,5,'2025-10-20','07:00:00',8.00),(50,51,1,'2025-10-21','07:00:00',8.00),(51,52,2,'2025-10-22','07:00:00',8.00),(52,53,3,'2025-10-23','07:00:00',8.00),(53,54,4,'2025-10-24','07:00:00',8.00),(54,55,5,'2025-10-25','07:00:00',8.00),(55,56,1,'2025-10-26','07:00:00',8.00),(56,57,2,'2025-10-27','07:00:00',8.00),(57,58,3,'2025-10-28','07:00:00',8.00),(58,59,4,'2025-10-29','07:00:00',8.00),(59,60,5,'2025-10-30','07:00:00',8.00),(60,61,1,'2025-10-01','07:00:00',8.00),(61,62,2,'2025-10-02','07:00:00',8.00),(62,63,3,'2025-10-03','07:00:00',8.00),(63,64,4,'2025-10-04','07:00:00',8.00),(64,65,5,'2025-10-05','07:00:00',8.00),(65,66,1,'2025-10-06','07:00:00',8.00),(66,67,2,'2025-10-07','07:00:00',8.00),(67,68,3,'2025-10-08','07:00:00',8.00),(68,69,4,'2025-10-09','07:00:00',8.00),(69,70,5,'2025-10-10','07:00:00',8.00),(70,71,1,'2025-10-11','07:00:00',8.00),(71,72,2,'2025-10-12','07:00:00',8.00),(72,73,3,'2025-10-13','07:00:00',8.00),(73,74,4,'2025-10-14','07:00:00',8.00),(74,75,5,'2025-10-15','07:00:00',8.00),(75,76,1,'2025-10-16','07:00:00',8.00),(76,77,2,'2025-10-17','07:00:00',8.00),(77,78,3,'2025-10-18','07:00:00',8.00),(78,79,4,'2025-10-19','07:00:00',8.00),(79,80,5,'2025-10-20','07:00:00',8.00),(80,81,1,'2025-10-21','07:00:00',8.00),(81,82,2,'2025-10-22','07:00:00',8.00),(82,83,3,'2025-10-23','07:00:00',8.00),(83,84,4,'2025-10-24','07:00:00',8.00),(84,85,5,'2025-10-25','07:00:00',8.00),(85,86,1,'2025-10-26','07:00:00',8.00),(86,87,2,'2025-10-27','07:00:00',8.00),(87,88,3,'2025-10-28','07:00:00',8.00),(88,89,4,'2025-10-29','07:00:00',8.00),(89,90,5,'2025-10-30','07:00:00',8.00),(90,91,1,'2025-10-01','07:00:00',8.00),(91,92,2,'2025-10-02','07:00:00',8.00),(92,93,3,'2025-10-03','07:00:00',8.00),(93,94,4,'2025-10-04','07:00:00',8.00),(94,95,5,'2025-10-05','07:00:00',8.00),(95,96,1,'2025-10-06','07:00:00',8.00),(96,97,2,'2025-10-07','07:00:00',8.00),(97,98,3,'2025-10-08','07:00:00',8.00),(98,99,4,'2025-10-09','07:00:00',8.00),(99,100,5,'2025-10-10','07:00:00',8.00),(100,1,1,'2025-10-11','07:00:00',8.00);
/*!40000 ALTER TABLE `empleado_turno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingrediente`
--

DROP TABLE IF EXISTS `ingrediente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingrediente` (
  `id_ingrediente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock_actual` decimal(10,2) NOT NULL DEFAULT '0.00',
  `stock_minimo` decimal(10,2) NOT NULL DEFAULT '0.00',
  `unidad_medida` enum('kg','gr','lt','pz') COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_ingrediente`),
  UNIQUE KEY `nombre` (`nombre`),
  CONSTRAINT `chk_stock_actual` CHECK ((`stock_actual` >= 0)),
  CONSTRAINT `chk_stock_minimo` CHECK ((`stock_minimo` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingrediente`
--

LOCK TABLES `ingrediente` WRITE;
/*!40000 ALTER TABLE `ingrediente` DISABLE KEYS */;
INSERT INTO `ingrediente` VALUES (1,'Carne de res',50.00,10.00,'kg'),(2,'Carne de cerdo',40.00,8.00,'kg'),(3,'Pollo',35.00,7.00,'kg'),(4,'Cebolla',20.00,5.00,'kg'),(5,'Cilantro',5.00,1.00,'kg'),(6,'Tomate',25.00,5.00,'kg'),(7,'Chile jalapeño',10.00,2.00,'kg'),(8,'Limón',15.00,3.00,'kg'),(9,'Tortilla de maíz',200.00,50.00,'pz'),(10,'Tortilla de harina',150.00,30.00,'pz'),(11,'Aceite vegetal',10.00,2.00,'lt'),(12,'Sal',5.00,1.00,'kg'),(13,'Pimienta',1.00,0.20,'kg'),(14,'Comino',0.50,0.10,'kg'),(15,'Ajo',2.00,0.50,'kg'),(16,'Queso fresco',8.00,2.00,'kg'),(17,'Crema',6.00,1.00,'lt'),(18,'Aguacate',12.00,3.00,'kg'),(19,'Frijoles refritos',20.00,5.00,'kg'),(20,'Salsa verde',8.00,2.00,'lt'),(21,'Salsa roja',7.00,2.00,'lt'),(22,'Chile chipotle',3.00,0.50,'kg'),(23,'Piña',10.00,2.00,'kg'),(24,'Cebolla morada',8.00,2.00,'kg'),(25,'Rábano',5.00,1.00,'kg'),(26,'Lechuga',6.00,1.50,'kg'),(27,'Tomatillo',15.00,3.00,'kg'),(28,'Chile serrano',4.00,1.00,'kg'),(29,'Nopales',10.00,2.00,'kg'),(30,'Chicharrón',8.00,2.00,'kg'),(31,'Longaniza',6.00,1.50,'kg'),(32,'Chorizo',7.00,1.50,'kg'),(33,'Papa',20.00,5.00,'kg'),(34,'Chayote',5.00,1.00,'kg'),(35,'Zanahoria',4.00,1.00,'kg'),(36,'Elote',10.00,2.00,'pz'),(37,'Queso Oaxaca',5.00,1.00,'kg'),(38,'Queso Chihuahua',4.00,1.00,'kg'),(39,'Jamón',3.00,0.50,'kg'),(40,'Tocino',2.50,0.50,'kg'),(41,'Huevo',120.00,24.00,'pz'),(42,'Harina',15.00,3.00,'kg'),(43,'Mantequilla',2.00,0.50,'kg'),(44,'Leche',8.00,2.00,'lt'),(45,'Canela',0.30,0.10,'kg'),(46,'Vainilla',0.25,0.05,'lt'),(47,'Azúcar',8.00,2.00,'kg'),(48,'Café',2.00,0.50,'kg'),(49,'Horchata',5.00,1.00,'lt'),(50,'Jamaica',1.50,0.30,'kg'),(51,'Tamarindo',2.00,0.50,'kg'),(52,'Sazonador adobo',3.00,0.50,'kg'),(53,'Sazonador taco',2.00,0.30,'kg'),(54,'Salsa de soya',4.00,1.00,'lt'),(55,'Mayonesa',6.00,1.00,'lt'),(56,'Mostaza',2.50,0.50,'lt'),(57,'Ketchup',5.00,1.00,'lt'),(58,'Papel aluminio',10.00,2.00,'pz'),(59,'Bolsas para desechos',50.00,10.00,'pz'),(60,'Servilletas',1000.00,200.00,'pz'),(61,'Ceniza de carbón',20.00,5.00,'kg'),(62,'Rollo plástico',30.00,5.00,'pz'),(63,'Vinagre',8.00,1.00,'lt'),(64,'Cloro',5.00,1.00,'lt'),(65,'Glicerina',1.00,0.20,'lt'),(66,'Levadura',2.00,0.50,'kg'),(67,'Orégano',0.50,0.10,'kg'),(68,'Laurel',0.30,0.05,'kg'),(69,'Anís estrella',0.20,0.05,'kg'),(70,'Pasta para hornear',1.50,0.30,'kg'),(71,'Gelatina',2.00,0.50,'kg'),(72,'Chocolate',3.00,0.50,'kg'),(73,'Extracto de naranja',0.50,0.10,'lt'),(74,'Salsa BBQ',4.00,0.80,'lt'),(75,'Cerveza',200.00,50.00,'pz'),(76,'Tequila',30.00,5.00,'lt'),(77,'Vodka',20.00,5.00,'lt'),(78,'Ron',15.00,3.00,'lt'),(79,'Sidra',10.00,2.00,'lt'),(80,'Pasta de ajo',2.00,0.50,'kg'),(81,'Masa para tamal',25.00,5.00,'kg'),(82,'Frijol negro',12.00,3.00,'kg'),(83,'Frijol pinto',10.00,2.00,'kg'),(84,'Azúcar glass',4.00,1.00,'kg'),(85,'Wallpaper (decor)',1.00,0.10,'pz'),(86,'Hielo',500.00,100.00,'kg'),(87,'Caja para llevar',300.00,50.00,'pz'),(88,'Papel encerado',200.00,50.00,'pz'),(89,'Palillos',1000.00,200.00,'pz'),(90,'Brochetas',500.00,100.00,'pz');
/*!40000 ALTER TABLE `ingrediente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `precio_venta` decimal(10,2) NOT NULL,
  `categoria` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_producto`),
  CONSTRAINT `chk_nombre_producto` CHECK ((char_length(trim(`nombre`)) >= 3)),
  CONSTRAINT `chk_precio_venta` CHECK ((`precio_venta` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Taco de carne asada',15.00,'Taco'),(2,'Taco de pastor',18.00,'Taco'),(3,'Taco de chorizo',16.00,'Taco'),(4,'Taco de pollo',14.00,'Taco'),(5,'Taco de carnitas',20.00,'Taco'),(6,'Taco de lengua',22.00,'Taco'),(7,'Taco de cabeza',19.00,'Taco'),(8,'Taco de tripa',17.00,'Taco'),(9,'Taco de suadero',16.00,'Taco'),(10,'Taco de cachete',21.00,'Taco'),(11,'Quesadilla de maíz',25.00,'Quesadilla'),(12,'Quesadilla de harina',30.00,'Quesadilla'),(13,'Burrito de carne',35.00,'Burrito'),(14,'Burrito de pollo',32.00,'Burrito'),(15,'Burrito mixto',38.00,'Burrito'),(16,'Torta de carne',40.00,'Torta'),(17,'Torta de pollo',37.00,'Torta'),(18,'Torta cubana',45.00,'Torta'),(19,'Gringa',35.00,'Especial'),(20,'Volcán',28.00,'Especial'),(21,'Plato de tacos mixtos',60.00,'Plato'),(22,'Orden de 5 tacos',75.00,'Orden'),(23,'Sope',18.00,'Antojito'),(24,'Tostada',16.00,'Antojito'),(25,'Gordita',20.00,'Antojito'),(26,'Elote',15.00,'Botana'),(27,'Esquites',18.00,'Botana'),(28,'Refresco',15.00,'Bebida'),(29,'Agua fresca',12.00,'Bebida'),(30,'Café',20.00,'Bebida'),(31,'Tamal de rajas',22.00,'Antojito'),(32,'Tamal de mole',24.00,'Antojito'),(33,'Enchiladas',45.00,'Plato'),(34,'Sopa de tortilla',35.00,'Plato'),(35,'Pozole',55.00,'Plato'),(36,'Chilaquiles',42.00,'Plato'),(37,'Huevos al gusto',50.00,'Desayuno'),(38,'Molletes',30.00,'Desayuno'),(39,'Pan dulce',10.00,'Postre'),(40,'Flan',18.00,'Postre'),(41,'Arroz con leche',20.00,'Postre'),(42,'Pastel porción',28.00,'Postre'),(43,'Agua de jamaica',12.00,'Bebida'),(44,'Agua de horchata',12.00,'Bebida'),(45,'Limonada',12.00,'Bebida'),(46,'Michelada',35.00,'Bebida alcohólica'),(47,'Cerveza',30.00,'Bebida alcohólica'),(48,'Margarita',60.00,'Bebida alcohólica'),(49,'Cazuela de mariscos',120.00,'Plato'),(50,'Marquesitas',25.00,'Postre'),(51,'Churros',18.00,'Postre'),(52,'Nieve',22.00,'Postre'),(53,'Helado sundae',40.00,'Postre'),(54,'Tostada de ceviche',50.00,'Antojito'),(55,'Coctel de camarón',90.00,'Plato'),(56,'Ensalada Cesar',45.00,'Ensalada'),(57,'Ensalada de aguacate',50.00,'Ensalada'),(58,'Sándwich club',60.00,'Tienda'),(59,'Hamburguesa sencilla',65.00,'Tienda'),(60,'Hamburguesa doble',95.00,'Tienda'),(61,'Papas fritas',30.00,'Botana'),(62,'Onion rings',35.00,'Botana'),(63,'Alitas BBQ 6pz',85.00,'Botana'),(64,'Alitas picosas 6pz',85.00,'Botana'),(65,'Pizza personal',90.00,'Tienda'),(66,'Pizza familiar',250.00,'Tienda'),(67,'Sándwich vegetariano',55.00,'Tienda'),(68,'Bowl proteico',120.00,'Plato'),(69,'Wrap de pollo',70.00,'Tienda'),(70,'Wrap vegetariano',65.00,'Tienda'),(71,'Smoothie fresa',45.00,'Bebida'),(72,'Smoothie plátano',45.00,'Bebida'),(73,'Batido de vainilla',50.00,'Bebida'),(74,'Batido de chocolate',50.00,'Bebida'),(75,'Té helado',12.00,'Bebida'),(76,'Atole',20.00,'Bebida caliente'),(77,'Capirotada',30.00,'Postre'),(78,'Buñuelos',25.00,'Postre'),(79,'Empanada de carne',28.00,'Antojito'),(80,'Empanada de queso',26.00,'Antojito'),(81,'Panuchos',40.00,'Antojito'),(82,'Salbutes',38.00,'Antojito'),(83,'Tlayuda',80.00,'Plato'),(84,'Tamales surtidos',120.00,'Plato'),(85,'Sopes de pollo 3pz',55.00,'Antojito'),(86,'Queso fundido',75.00,'Antojito'),(87,'Molcajete mixto',220.00,'Plato'),(88,'Carne al pastor porción',95.00,'Plato'),(89,'Carne asada porción',120.00,'Plato'),(90,'Carne en su jugo',140.00,'Plato'),(91,'Flautas 3pz',48.00,'Antojito'),(92,'Tacos gobernador',85.00,'Taco'),(93,'Taco norteño',22.00,'Taco'),(94,'Taco vegetariano',18.00,'Taco'),(95,'Taco de pescado',30.00,'Taco'),(96,'Cerveza importada',45.00,'Bebida alcohólica'),(97,'Tejuino',25.00,'Bebida'),(98,'Pulque curado',40.00,'Bebida alcohólica'),(99,'Garnachas surtidas',55.00,'Antojito'),(100,'Menú del día',95.00,'Plato');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_ingrediente`
--

DROP TABLE IF EXISTS `producto_ingrediente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_ingrediente` (
  `id_producto_ingrediente` int NOT NULL AUTO_INCREMENT,
  `id_producto` int NOT NULL,
  `id_ingrediente` int NOT NULL,
  `cantidad_necesaria` decimal(10,3) NOT NULL,
  PRIMARY KEY (`id_producto_ingrediente`),
  UNIQUE KEY `uc_producto_ingrediente` (`id_producto`,`id_ingrediente`),
  KEY `fk_prod_ing_ingrediente` (`id_ingrediente`),
  CONSTRAINT `fk_prod_ing_ingrediente` FOREIGN KEY (`id_ingrediente`) REFERENCES `ingrediente` (`id_ingrediente`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_prod_ing_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `chk_cantidad_necesaria` CHECK ((`cantidad_necesaria` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_ingrediente`
--

LOCK TABLES `producto_ingrediente` WRITE;
/*!40000 ALTER TABLE `producto_ingrediente` DISABLE KEYS */;
INSERT INTO `producto_ingrediente` VALUES (1,1,1,0.080),(2,1,4,0.020),(3,1,5,0.010),(4,1,9,3.000),(5,2,2,0.080),(6,2,4,0.020),(7,2,5,0.010),(8,2,9,3.000),(9,3,11,0.060),(10,3,4,0.020),(11,3,5,0.010),(12,3,9,3.000),(13,4,3,0.080),(14,4,4,0.020),(15,4,5,0.010),(16,4,9,3.000),(17,5,2,0.080),(18,5,4,0.020),(19,5,5,0.010),(20,5,9,3.000),(21,6,1,0.080),(22,6,4,0.020),(23,6,5,0.010),(24,6,9,3.000),(25,7,1,0.080),(26,7,4,0.020),(27,7,5,0.010),(28,7,9,3.000),(29,8,1,0.080),(30,8,4,0.020),(31,8,5,0.010),(32,8,9,3.000),(33,9,1,0.080),(34,9,4,0.020),(35,9,5,0.010),(36,9,9,3.000),(37,10,1,0.080),(38,10,4,0.020),(39,10,5,0.010),(40,10,9,3.000),(41,11,16,0.040),(42,11,9,2.000),(43,11,17,0.020),(44,12,16,0.050),(45,12,10,1.000),(46,12,17,0.020),(47,13,1,0.100),(48,13,10,1.000),(49,13,4,0.030),(50,13,5,0.010),(51,14,3,0.100),(52,14,10,1.000),(53,14,4,0.030),(54,14,5,0.010),(55,15,1,0.050),(56,15,3,0.050),(57,15,10,1.000),(58,15,4,0.030),(59,15,5,0.010),(60,16,1,0.120),(61,16,19,0.050),(62,16,4,0.020),(63,16,5,0.010),(64,17,3,0.120),(65,17,19,0.050),(66,17,4,0.020),(67,17,5,0.010),(68,18,1,0.040),(69,18,2,0.040),(70,18,3,0.040),(71,18,11,0.020),(72,18,19,0.060),(73,18,4,0.020),(74,18,5,0.010),(75,19,2,0.060),(76,19,16,0.040),(77,19,10,1.000),(78,19,23,0.020),(79,20,1,0.060),(80,20,16,0.030),(81,20,9,1.000),(82,20,4,0.010),(83,21,1,0.040),(84,21,2,0.040),(85,21,3,0.040),(86,21,4,0.020),(87,21,5,0.010),(88,21,9,15.000),(89,22,1,0.050),(90,22,2,0.050),(91,22,3,0.050),(92,22,4,0.025),(93,22,5,0.012),(94,22,9,5.000),(95,23,19,0.030),(96,23,1,0.020),(97,23,4,0.010),(98,23,5,0.005),(99,23,16,0.020),(100,24,19,0.040),(101,24,1,0.020),(102,24,4,0.010),(103,24,5,0.005),(104,25,19,0.050),(105,25,1,0.020),(106,25,4,0.010),(107,25,5,0.005),(108,25,16,0.020),(109,26,35,1.000),(110,26,16,0.020),(111,26,17,0.010),(112,26,12,0.005),(113,27,36,0.200),(114,27,17,0.020),(115,27,12,0.005),(116,27,16,0.020),(117,28,47,0.330),(118,29,48,0.250),(119,30,44,0.020),(120,31,1,0.060),(121,32,1,0.060),(122,33,1,0.060),(123,34,1,0.060),(124,35,2,0.060),(125,36,3,0.060),(126,37,11,0.030),(127,38,12,0.030),(128,39,13,0.040),(129,40,14,0.040),(130,41,15,0.030),(131,42,16,0.030),(132,43,1,0.080),(133,44,2,0.080),(134,45,3,0.080),(135,46,4,0.020),(136,47,9,1.000),(137,48,10,1.000),(138,49,16,0.040),(139,50,17,0.020);
/*!40000 ALTER TABLE `producto_ingrediente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `id_proveedor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccion` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`),
  CONSTRAINT `chk_nombre_proveedor` CHECK ((char_length(trim(`nombre`)) >= 3))
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'Carnes San Juan','5551234567','Av. Principal 123, Col. Centro'),(2,'Abarrotes Doña Mary','5552345678','Calle 5 de Mayo 45, Col. Centro'),(3,'Tortillería El Pueblo','5553456789','Av. Revolución 789, Col. Reforma'),(4,'Verduras Frescas SA','5554567890','Calle Hidalgo 234, Col. Centro'),(5,'Quesos y Lácteos La Vaquita','5555678901','Av. Juárez 567, Col. Centro'),(6,'Salsas Artesanales','5556789012','Calle Allende 89, Col. Centro'),(7,'Frutas Tropicales','5557890123','Av. Independencia 345, Col. Reforma'),(8,'Cárnicos El Dorado','5558901234','Calle Madero 123, Col. Centro'),(9,'Granos y Semillas','5559012345','Av. Constitución 678, Col. Reforma'),(10,'Bebidas Tradicionales','5550123456','Calle Zaragoza 234, Col. Centro'),(11,'Pollo Feliz','5551112222','Av. Hidalgo 901, Col. Reforma'),(12,'Abarrotes El Sol','5552223333','Calle Morelos 345, Col. Centro'),(13,'Tortillas de Oro','5553334444','Av. 16 de Septiembre 567, Col. Reforma'),(14,'La Cebolla Feliz','5554445555','Calle Juárez 789, Col. Centro'),(15,'Quesos Finos','5555556666','Av. Madero 1234, Col. Reforma'),(16,'Salsas Picosas','5556667777','Calle Aldama 456, Col. Centro'),(17,'Frutas Selectas','5557778888','Av. Allende 789, Col. Reforma'),(18,'Carnes Premium','5558889999','Calle Hidalgo 1011, Col. Centro'),(19,'Granos de Oro','5559990000','Av. Juárez 1213, Col. Reforma'),(20,'Bebidas Naturales','5550001111','Calle 5 de Febrero 1415, Col. Centro');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor_ingrediente`
--

DROP TABLE IF EXISTS `proveedor_ingrediente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor_ingrediente` (
  `id_proveedor_ingrediente` int NOT NULL AUTO_INCREMENT,
  `id_proveedor` int NOT NULL,
  `id_ingrediente` int NOT NULL,
  `precio_actual` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_proveedor_ingrediente`),
  UNIQUE KEY `uc_proveedor_ingrediente` (`id_proveedor`,`id_ingrediente`),
  KEY `fk_prov_ing_ing` (`id_ingrediente`),
  CONSTRAINT `fk_prov_ing_ing` FOREIGN KEY (`id_ingrediente`) REFERENCES `ingrediente` (`id_ingrediente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_prov_ing_prov` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `chk_precio_actual` CHECK ((`precio_actual` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor_ingrediente`
--

LOCK TABLES `proveedor_ingrediente` WRITE;
/*!40000 ALTER TABLE `proveedor_ingrediente` DISABLE KEYS */;
INSERT INTO `proveedor_ingrediente` VALUES (1,1,1,120.00),(2,1,2,110.00),(3,1,3,80.00),(4,2,4,25.00),(5,2,5,60.00),(6,2,6,30.00),(7,3,9,0.50),(8,3,10,0.75),(9,4,4,25.00),(10,4,6,30.00),(11,4,7,40.00),(12,4,8,35.00),(13,5,16,90.00),(14,5,17,65.00),(15,6,20,45.00),(16,6,21,50.00),(17,6,22,80.00),(18,7,18,70.00),(19,7,23,35.00),(20,8,1,125.00),(21,8,2,115.00),(22,9,15,25.00),(23,9,43,30.00),(24,10,48,40.00),(25,10,49,35.00),(26,10,50,45.00),(27,11,3,85.00),(28,12,11,25.00),(29,12,12,15.00),(30,12,13,200.00),(31,13,9,0.55),(32,13,10,0.80),(33,14,4,26.00),(34,14,24,30.00),(35,15,16,95.00),(36,15,37,110.00),(37,16,20,48.00),(38,16,21,52.00),(39,17,18,72.00),(40,17,23,36.00),(41,18,1,130.00),(42,18,2,120.00),(43,19,44,25.00),(44,19,45,150.00),(45,19,46,20.00),(46,2,25,20.00),(47,2,26,25.00),(48,4,27,35.00),(49,4,28,45.00),(50,5,38,200.00),(51,5,39,180.00),(52,6,29,40.00),(53,7,30,100.00),(54,7,31,120.00),(55,8,32,25.00),(56,9,33,20.00),(57,9,34,22.00),(58,10,35,15.00),(59,11,36,80.00),(60,12,40,2.50),(61,13,41,18.00),(62,14,42,30.00),(63,15,43,32.00),(64,16,44,26.00),(65,17,45,155.00),(66,18,46,22.00),(67,19,47,50.00),(68,20,48,42.00),(69,1,49,40.00),(70,2,50,35.00),(71,3,1,122.00),(72,4,2,112.00),(73,5,3,82.00),(74,6,15,26.00),(75,7,16,92.00),(76,8,17,67.00),(77,9,18,71.00),(78,10,19,35.00),(79,11,20,46.00),(80,12,21,51.00),(81,13,22,82.00),(82,14,23,36.00),(83,15,24,31.00),(84,16,25,21.00),(85,17,26,26.00),(86,18,27,36.00),(87,19,28,46.00),(88,20,29,42.00),(89,1,30,102.00),(90,2,31,122.00),(91,3,32,26.00),(92,4,33,21.00),(93,5,34,23.00),(94,6,35,16.00),(95,7,36,82.00),(96,8,37,112.00),(97,9,38,202.00),(98,10,39,182.00);
/*!40000 ALTER TABLE `proveedor_ingrediente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turno`
--

DROP TABLE IF EXISTS `turno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `turno` (
  `id_turno` int NOT NULL AUTO_INCREMENT,
  `nombre_turno` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hora_inicio` time NOT NULL,
  PRIMARY KEY (`id_turno`),
  UNIQUE KEY `nombre_turno` (`nombre_turno`),
  CONSTRAINT `chk_nombre_turno` CHECK ((char_length(trim(`nombre_turno`)) >= 3))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turno`
--

LOCK TABLES `turno` WRITE;
/*!40000 ALTER TABLE `turno` DISABLE KEYS */;
INSERT INTO `turno` VALUES (1,'Matutino','07:00:00'),(2,'Vespertino','14:00:00'),(3,'Nocturno','20:00:00'),(4,'Fin de Semana','08:00:00'),(5,'Mixto','10:00:00');
/*!40000 ALTER TABLE `turno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `id_venta` int NOT NULL AUTO_INCREMENT,
  `fecha_hora` datetime NOT NULL,
  `total` decimal(12,2) NOT NULL,
  `id_empleado` int NOT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `fk_venta_empleado` (`id_empleado`),
  KEY `idx_fecha_hora` (`fecha_hora`),
  CONSTRAINT `fk_venta_empleado` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `chk_total_venta` CHECK ((`total` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (1,'2025-10-01 09:00:00',60.00,2),(2,'2025-10-01 10:00:00',70.00,3),(3,'2025-10-01 11:00:00',80.00,4),(4,'2025-10-01 12:00:00',90.00,5),(5,'2025-10-01 13:00:00',100.00,6),(6,'2025-10-01 14:00:00',110.00,7),(7,'2025-10-01 15:00:00',120.00,8),(8,'2025-10-01 16:00:00',130.00,9),(9,'2025-10-01 17:00:00',140.00,10),(10,'2025-10-01 18:00:00',50.00,11),(11,'2025-10-01 19:00:00',60.00,12),(12,'2025-10-01 20:00:00',70.00,13),(13,'2025-10-01 21:00:00',80.00,14),(14,'2025-10-01 22:00:00',90.00,15),(15,'2025-10-01 23:00:00',100.00,16),(16,'2025-10-02 00:00:00',110.00,17),(17,'2025-10-02 01:00:00',120.00,18),(18,'2025-10-02 02:00:00',130.00,19),(19,'2025-10-02 03:00:00',140.00,20),(20,'2025-10-02 04:00:00',50.00,21),(21,'2025-10-02 05:00:00',60.00,22),(22,'2025-10-02 06:00:00',70.00,23),(23,'2025-10-02 07:00:00',80.00,24),(24,'2025-10-02 08:00:00',90.00,25),(25,'2025-10-02 09:00:00',100.00,26),(26,'2025-10-02 10:00:00',110.00,27),(27,'2025-10-02 11:00:00',120.00,28),(28,'2025-10-02 12:00:00',130.00,29),(29,'2025-10-02 13:00:00',140.00,30),(30,'2025-10-02 14:00:00',50.00,31),(31,'2025-10-02 15:00:00',60.00,32),(32,'2025-10-02 16:00:00',70.00,33),(33,'2025-10-02 17:00:00',80.00,34),(34,'2025-10-02 18:00:00',90.00,35),(35,'2025-10-02 19:00:00',100.00,36),(36,'2025-10-02 20:00:00',110.00,37),(37,'2025-10-02 21:00:00',120.00,38),(38,'2025-10-02 22:00:00',130.00,39),(39,'2025-10-02 23:00:00',140.00,40),(40,'2025-10-03 00:00:00',50.00,41),(41,'2025-10-03 01:00:00',60.00,42),(42,'2025-10-03 02:00:00',70.00,43),(43,'2025-10-03 03:00:00',80.00,44),(44,'2025-10-03 04:00:00',90.00,45),(45,'2025-10-03 05:00:00',100.00,46),(46,'2025-10-03 06:00:00',110.00,47),(47,'2025-10-03 07:00:00',120.00,48),(48,'2025-10-03 08:00:00',130.00,49),(49,'2025-10-03 09:00:00',140.00,50),(50,'2025-10-03 10:00:00',50.00,51),(51,'2025-10-03 11:00:00',60.00,52),(52,'2025-10-03 12:00:00',70.00,53),(53,'2025-10-03 13:00:00',80.00,54),(54,'2025-10-03 14:00:00',90.00,55),(55,'2025-10-03 15:00:00',100.00,56),(56,'2025-10-03 16:00:00',110.00,57),(57,'2025-10-03 17:00:00',120.00,58),(58,'2025-10-03 18:00:00',130.00,59),(59,'2025-10-03 19:00:00',140.00,60),(60,'2025-10-03 20:00:00',50.00,61),(61,'2025-10-03 21:00:00',60.00,62),(62,'2025-10-03 22:00:00',70.00,63),(63,'2025-10-03 23:00:00',80.00,64),(64,'2025-10-04 00:00:00',90.00,65),(65,'2025-10-04 01:00:00',100.00,66),(66,'2025-10-04 02:00:00',110.00,67),(67,'2025-10-04 03:00:00',120.00,68),(68,'2025-10-04 04:00:00',130.00,69),(69,'2025-10-04 05:00:00',140.00,70),(70,'2025-10-04 06:00:00',50.00,71),(71,'2025-10-04 07:00:00',60.00,72),(72,'2025-10-04 08:00:00',70.00,73),(73,'2025-10-04 09:00:00',80.00,74),(74,'2025-10-04 10:00:00',90.00,75),(75,'2025-10-04 11:00:00',100.00,76),(76,'2025-10-04 12:00:00',110.00,77),(77,'2025-10-04 13:00:00',120.00,78),(78,'2025-10-04 14:00:00',130.00,79),(79,'2025-10-04 15:00:00',140.00,80),(80,'2025-10-04 16:00:00',50.00,81),(81,'2025-10-04 17:00:00',60.00,82),(82,'2025-10-04 18:00:00',70.00,83),(83,'2025-10-04 19:00:00',80.00,84),(84,'2025-10-04 20:00:00',90.00,85),(85,'2025-10-04 21:00:00',100.00,86),(86,'2025-10-04 22:00:00',110.00,87),(87,'2025-10-04 23:00:00',120.00,88),(88,'2025-10-05 00:00:00',130.00,89),(89,'2025-10-05 01:00:00',140.00,90),(90,'2025-10-05 02:00:00',50.00,91),(91,'2025-10-05 03:00:00',60.00,92),(92,'2025-10-05 04:00:00',70.00,93),(93,'2025-10-05 05:00:00',80.00,94),(94,'2025-10-05 06:00:00',90.00,95),(95,'2025-10-05 07:00:00',100.00,96),(96,'2025-10-05 08:00:00',110.00,97),(97,'2025-10-05 09:00:00',120.00,98),(98,'2025-10-05 10:00:00',130.00,99),(99,'2025-10-05 11:00:00',140.00,100),(100,'2025-10-05 12:00:00',50.00,1);
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-26 23:51:19
