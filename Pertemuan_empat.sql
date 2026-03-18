-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: Pertemuan_empat
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `filter_data`
--

DROP TABLE IF EXISTS `filter_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filter_data` (
  `Nama` varchar(44) NOT NULL,
  `Laki_laki` int(11) NOT NULL,
  `Favorit` varchar(11) NOT NULL,
  PRIMARY KEY (`Nama`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filter_data`
--

LOCK TABLES `filter_data` WRITE;
/*!40000 ALTER TABLE `filter_data` DISABLE KEYS */;
INSERT INTO `filter_data` VALUES ('Arkan',38,''),('Azizi',47,''),('Fachri',69,''),('Fauzan',67,''),('Huddin',74,'');
/*!40000 ALTER TABLE `filter_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fungsi_agregasi`
--

DROP TABLE IF EXISTS `fungsi_agregasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fungsi_agregasi` (
  `Nama` varchar(44) NOT NULL,
  `mie_ayam` int(11) NOT NULL,
  `nasi_padang` int(11) NOT NULL,
  `ayam_geprek` int(11) NOT NULL,
  PRIMARY KEY (`Nama`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fungsi_agregasi`
--

LOCK TABLES `fungsi_agregasi` WRITE;
/*!40000 ALTER TABLE `fungsi_agregasi` DISABLE KEYS */;
INSERT INTO `fungsi_agregasi` VALUES ('Arkan',57,68,75),('Azizi',77,37,97),('Fachri',73,44,65),('Fauzan',17,67,34),('Huddin',89,54,19);
/*!40000 ALTER TABLE `fungsi_agregasi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tambahan`
--

DROP TABLE IF EXISTS `tambahan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tambahan` (
  `Product` varchar(44) NOT NULL,
  `Jenis` enum('makanan','minuman') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tambahan`
--

LOCK TABLES `tambahan` WRITE;
/*!40000 ALTER TABLE `tambahan` DISABLE KEYS */;
INSERT INTO `tambahan` VALUES ('Nasi_Padang','makanan'),('Bakso','makanan'),('Marimas','minuman');
/*!40000 ALTER TABLE `tambahan` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-17 20:08:34
