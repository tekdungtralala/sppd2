-- MySQL dump 10.13  Distrib 5.7.19, for osx10.12 (x86_64)
--
-- Host: localhost    Database: db_sppd
-- ------------------------------------------------------
-- Server version	5.7.19

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(30) NOT NULL,
  `pass` varchar(70) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'root','5f4dcc3b5aa765d61d8327deb882cf99');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `budget`
--

DROP TABLE IF EXISTS `budget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `budget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `sub_budget` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`sub_budget`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `budget`
--

LOCK TABLES `budget` WRITE;
/*!40000 ALTER TABLE `budget` DISABLE KEYS */;
INSERT INTO `budget` VALUES (3,'3470.004.011','524111'),(4,'3470.004.011','524112'),(7,'3470.004.022','9843.001'),(8,'3470.004.022','9843.002'),(29,'3470.004.077','123.456-001'),(30,'3470.004.077','123.456-002'),(31,'3470.004.077','123.456-003'),(32,'3470.004.077','123.456-004'),(33,'3470.004.077','123.456-005'),(34,'3470.004.077','123.456-006');
/*!40000 ALTER TABLE `budget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `province_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `province_id` (`province_id`),
  CONSTRAINT `city_ibfk_1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Jakarta Barat',6),(2,'Jakarta Timur',6),(3,'Bandung',2),(4,'Cirebon',2),(5,'Semarang',4),(6,'Pemalang',4),(7,'Surabaya',5),(8,'Brebes',4),(9,'Tegal',4),(10,'Pekalongan',4),(11,'Kendal',4),(19,'Purbalingga',4),(20,'Godong',4),(21,'Purwokerto',4),(22,'Jakarta Utara',6),(23,'Jakarta Selatan',6),(24,'Jakarta Tengah',6),(25,'Malang',5),(26,'Sukabumi',2);
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `office_class`
--

DROP TABLE IF EXISTS `office_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `office_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `office_class`
--

LOCK TABLES `office_class` WRITE;
/*!40000 ALTER TABLE `office_class` DISABLE KEYS */;
INSERT INTO `office_class` VALUES (1,'1C'),(2,'1D'),(3,'2A'),(4,'2B'),(5,'2C'),(6,'2D');
/*!40000 ALTER TABLE `office_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `office_position`
--

DROP TABLE IF EXISTS `office_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `office_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `imutable` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `office_position`
--

LOCK TABLES `office_position` WRITE;
/*!40000 ALTER TABLE `office_position` DISABLE KEYS */;
INSERT INTO `office_position` VALUES (1,'Balai Teknologi Pengolahan Air dan Limbah',1),(2,'Pejabat Pembuat Komitmen',1),(3,'Bendahara',1),(4,'Staff',0);
/*!40000 ALTER TABLE `office_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `officer`
--

DROP TABLE IF EXISTS `officer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `officer` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `officer_id` varchar(100) NOT NULL,
  `phone_number` varchar(100) NOT NULL,
  `office_class_id` int(11) DEFAULT NULL,
  `office_position_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `office_class_id` (`office_class_id`),
  KEY `officer_ibfk_1` (`office_position_id`),
  CONSTRAINT `officer_ibfk_1` FOREIGN KEY (`office_position_id`) REFERENCES `office_position` (`id`) ON DELETE SET NULL,
  CONSTRAINT `officer_ibfk_2` FOREIGN KEY (`office_class_id`) REFERENCES `office_class` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `officer`
--

LOCK TABLES `officer` WRITE;
/*!40000 ALTER TABLE `officer` DISABLE KEYS */;
INSERT INTO `officer` VALUES (1,'Ir. Setiyono, M.Si','081123456','081111133434343',6,1),(2,'Drs. Djoko Prasetyo','1952423432','024234234',4,2),(3,'Ibu Bendahara','222222222','024234234',5,3),(4,'Staff 1','333333333','024234234',3,4),(5,'Staff 2','44444444','02142344324',3,4);
/*!40000 ALTER TABLE `officer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `province`
--

DROP TABLE IF EXISTS `province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `province` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `province`
--

LOCK TABLES `province` WRITE;
/*!40000 ALTER TABLE `province` DISABLE KEYS */;
INSERT INTO `province` VALUES (6,'DKI Jakarta'),(2,'Jawa Barat'),(4,'Jawa Tengah'),(5,'Jawa Timur');
/*!40000 ALTER TABLE `province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sppd`
--

DROP TABLE IF EXISTS `sppd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sppd` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` int(1) NOT NULL DEFAULT '1',
  `reference_number` varchar(100) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `total_day` int(11) DEFAULT NULL,
  `base` text NOT NULL,
  `objective` text NOT NULL,
  `task` text NOT NULL,
  `description` text NOT NULL,
  `chief_name` varchar(100) NOT NULL,
  `transportation_type` varchar(100) DEFAULT NULL,
  `column_e` varchar(100) DEFAULT NULL,
  `column_f` varchar(100) DEFAULT NULL,
  `report_title` varchar(100) DEFAULT NULL,
  `report_content` varchar(1000) DEFAULT NULL,
  `report_created_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sppd`
--

LOCK TABLES `sppd` WRITE;
/*!40000 ALTER TABLE `sppd` DISABLE KEYS */;
INSERT INTO `sppd` VALUES (28,6,'28.a/BTPAL/ST/10/2017','2017-09-01','2017-09-04',3,'Dasar 1','Cirebon','Tugas 1','Keterangan 1','Ir. Setiyono, M.Si','Kendaraan Umum','3470.004.011','524111','Judul Laporan 1','Isi laporan','2017-10-13'),(29,5,'29.a/BTPAL/ST/10/2017','2017-09-10','2017-09-17',7,'Nomor Surat 29','Brebes','Tigas 29','Keterangan 29','Ir. Setiyono, M.Si','Gojeg','234234234','1',NULL,NULL,NULL),(30,5,'30.a/BTPAL/ST/10/2017','2017-09-03','2017-09-03',0,'Dasar Surat 30','Surabaya','Tugas 30','Keterangan Tugas 30','Ir. Setiyono, M.Si','Kereta Api','234234234','234324',NULL,NULL,NULL),(31,4,'31.a/BTPAL/ST/10/2017','2017-09-11','2017-09-25',14,'Dasar 31','Malang','Tugas 31','Keterangan 31','Ir. Setiyono, M.Si','Balon Udara','234234234','sdfdsf',NULL,NULL,NULL),(32,4,'32.a/BTPAL/ST/10/2017','2017-09-25','2017-09-26',1,'Dasar 32','Malang','Tugas 32','Keterangan 32','Ir. Setiyono, M.Si','Gojeg','3470.004.011','524112',NULL,NULL,NULL),(33,5,'33.a/BTPAL/ST/10/2017','2017-10-02','2017-10-04',2,'Dasar 33','Surabaya','Tugas 33','Keterangan 33','Ir. Setiyono, M.Si','Kereta Api','3470.004.011','524111',NULL,NULL,NULL),(34,4,'34.a/BTPAL/ST/10/2017','2017-09-10','2017-09-17',7,'Dasar 34','Jakarta Tengah','Tugad 34','Keterangan 34','Ir. Setiyono, M.Si','Gojeg','3470.004.011','524111',NULL,NULL,NULL),(35,4,'35.a/BTPAL/ST/10/2017','2017-09-04','2017-09-01',28,'Surat 35','Jakarta Tengah','Tugas 35','Keterangan 35','Ir. Setiyono, M.Si','Gojeg','3470.004.011','524112',NULL,NULL,NULL),(36,2,'36.a/BTPAL/ST/10/2017','2017-09-02','2017-09-04',2,'Individu 36','Jakarta Timur','Individu 36','Individu 36','Ir. Setiyono, M.Si',NULL,NULL,NULL,NULL,NULL,NULL),(37,0,'37.a/BTPAL/ST/10/2017','2017-09-03','2017-09-04',1,'Individu 37','Surabaya','Individu 37','Individu 37','Ir. Setiyono, M.Si',NULL,NULL,NULL,NULL,NULL,NULL),(38,2,'38.a/BTPAL/ST/10/2017','2017-09-18','2017-09-20',2,'Individu 38','Semarang','Individu 38','Individu 38','Ir. Setiyono, M.Si',NULL,NULL,NULL,NULL,NULL,NULL),(39,2,'39.a/BTPAL/ST/10/2017','2017-09-18','2017-09-19',1,'Individu','Sukabumi','Individu','Individu','Ir. Setiyono, M.Si',NULL,NULL,NULL,NULL,NULL,NULL),(40,1,'40.a/BTPAL/ST/10/2017','2017-09-04','2017-09-06',2,'Rame Rame','Jakarta Barat','Rame Rame','Rame Rame','Ir. Setiyono, M.Si',NULL,NULL,NULL,NULL,NULL,NULL),(41,6,'41.a/BTPAL/ST/10/2017','2017-09-02','2017-09-05',3,'Dasar 1','Malang','Tugas 1','Keterangan 1','Ir. Setiyono, M.Si','Kendaraan Umum','3470.004.011','524111','Judul Laporan 1','Isi laporan','2017-10-13'),(42,6,'42.a/BTPAL/ST/10/2017','2017-09-03','2017-09-06',3,'Dasar 1','Bandung','Tugas 1','Keterangan 1','Ir. Setiyono, M.Si','Kendaraan Umum','3470.004.011','524111','Judul Laporan 1','Isi laporan','2017-10-13'),(43,6,'43.a/BTPAL/ST/10/2017','2017-09-04','2017-09-10',3,'Dasar 1','Bandung','Tugas 1','Keterangan 1','Ir. Setiyono, M.Si','Kendaraan Umum','3470.004.011','524111','Judul Laporan 1','Isi laporan','2017-10-13'),(44,6,'44.a/BTPAL/ST/10/2017','2017-09-05','2017-09-08',3,'Dasar 1','Surabaya','Tugas 1','Keterangan 1','Ir. Setiyono, M.Si','Kendaraan Umum','3470.004.011','524112','Judul Laporan 1','Isi laporan','2017-10-13'),(45,6,'45.a/BTPAL/ST/10/2017','2017-09-06','2017-09-09',3,'Dasar 1','Bandung','Tugas 1','Keterangan 1','Ir. Setiyono, M.Si','Kendaraan Umum','3470.004.022','9843.001','Judul Laporan 1','Isi laporan','2017-10-13'),(46,6,'46.a/BTPAL/ST/10/2017','2017-09-07','2017-09-10',3,'Dasar 1','Tegal','Tugas 1','Keterangan 1','Ir. Setiyono, M.Si','Kendaraan Umum','3470.004.022','9843.001','Judul Laporan 1','Isi laporan','2017-10-13'),(47,6,'47.a/BTPAL/ST/10/2017','2017-09-08','2017-09-11',3,'Dasar 1','Bandung','Tugas 1','Keterangan 1','Ir. Setiyono, M.Si','Kendaraan Umum','3470.004.077','123.456-001','Judul Laporan 1','Isi laporan','2017-10-13'),(48,6,'48.a/BTPAL/ST/10/2017','2017-09-29','2017-10-04',6,'SPPD 84','Brebes','SPPD 84','SPPD 84','Ir. Setiyono, M.Si','Pesawat Terbang','3470.004.077','123.456-001','SPPD 84 SPPD 84','SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84','2017-11-11'),(49,6,'49.a/BTPAL/ST/10/2017','2017-09-08','2017-09-10',2,'sppd 49','Jakarta Utara','sppd 49','sppd 49','Ir. Setiyono, M.Si','Kendaraan Umum','3470.004.077','123.456-002','sppd 49 sppd 49 sppd 49','sppd 49 sppd 49 sppd 49','2017-11-11'),(50,6,'50.a/BTPAL/ST/10/2017','2017-09-02','2017-09-07',5,'sppd 50','Jakarta Tengah','sppd 50','sppd 50','Ir. Setiyono, M.Si','Kereta Api','3470.004.077','123.456-003','sppd 50','sppd 50 sppd 50 sppd 50 sppd 50 sppd 50 sppd 50 sppd 50 sppd 50 sppd 50 sppd 50 sppd 50 sppd 50 sppd 50 sppd 50 sppd 50 sppd 50 sppd 50 sppd 50 sppd 50 sppd 50','2017-11-11'),(51,6,'51.a/BTPAL/ST/10/2017','2017-09-15','2017-09-21',6,'sppd 51 sppd 51 sppd 51','Tegal','sppd 51','sppd 51','Ir. Setiyono, M.Si','Pesawat Terbang','3470.004.077','123.456-004','sppd 51 sppd 51 sppd 51','sppd 51 sppd 51 sppd 51 sppd 51 sppd 51','2017-11-11'),(52,6,'52.a/BTPAL/ST/10/2017','2017-10-05','2017-10-11',6,'sppd 52','Surabaya','sppd 52','sppd 52','Ir. Setiyono, M.Si','Balon Udara','3470.004.077','123.456-005','sppd 52 sppd 52','sppd 52 sppd 52 sppd 52 sppd 52','2017-11-11'),(53,6,'53.a/BTPAL/ST/10/2017','2017-08-01','2017-08-09',8,'Test','Jakarta Selatan','Test','Test','Ir. Setiyono, M.Si','Pesawat Terbang','3470.004.022','9843.001','TestTestTest','TestTestTest','2017-08-09'),(54,6,'54.a/BTPAL/ST/10/2017','2017-08-13','2017-08-19',6,'Test','Jakarta Barat','Test','Test','Ir. Setiyono, M.Si','Balon Udara','3470.004.011','524111','Test','TestTestTest','2017-08-16'),(55,6,'55.a/BTPAL/ST/10/2017','2017-08-20','2017-08-26',6,'Test','Jakarta Selatan','Test','Test','Ir. Setiyono, M.Si','Kendaraan Umum','3470.004.011','524112','Test','Test','2017-08-31'),(56,6,'56.a/BTPAL/ST/10/2017','2017-10-29','2017-11-04',6,'Test','Jakarta Selatan','Test','Test','Ir. Setiyono, M.Si','Kereta Api','3470.004.022','9843.001','Test','TestTest','2017-11-11'),(57,4,'57.a/BTPAL/ST/10/2017','2017-08-06','2017-10-29',84,'Test','Jakarta Utara','TestTest','TestTest','Ir. Setiyono, M.Si','Kendaraan Umum','3470.004.022','9843.002',NULL,NULL,NULL),(58,6,'58.a/BTPAL/ST/10/2017','2017-08-06','2017-08-27',21,'TestTest','Jakarta Barat','Test','Test','Ir. Setiyono, M.Si','Pesawat Terbang','3470.004.077','123.456-005','TestTestTest','TestTestTestTest','2017-08-31'),(59,6,'59.a/BTPAL/ST/10/2017','2017-07-01','2017-07-31',30,'TestTest','Surabaya','TestTest','TestTest','Ir. Setiyono, M.Si','Kereta Api','3470.004.011','524112','TestTestTest','TestTest','2017-08-30'),(60,6,'60.a/BTPAL/ST/10/2017','2017-06-01','2017-06-22',21,'TestTest','Cirebon','TestTest','Test','Ir. Setiyono, M.Si','Kereta Api','3470.004.011','524112','TestTestTest','TestTestTest','2017-08-01'),(61,3,'61.a/BTPAL/ST/10/2017','2017-05-01','2017-05-19',18,'TestTest','Bandung','TestTest','TestTest','Ir. Setiyono, M.Si','Kereta Api','3470.004.011','524112',NULL,NULL,NULL),(62,6,'62.a/BTPAL/ST/10/2017','2017-05-01','2017-05-27',26,'Test','Malang','Test','Test','Ir. Setiyono, M.Si','Pesawat Terbang','3470.004.077','123.456-002','TestTest','TestTest','2017-06-02'),(63,6,'63.a/BTPAL/ST/10/2017','2017-04-02','2017-04-22',20,'TestTest','Malang','TestTest','Test','Ir. Setiyono, M.Si','Pesawat Terbang','3470.004.077','123.456-001','TestTest','TestTestTest','2017-06-02'),(64,6,'64.a/BTPAL/ST/10/2017','2017-03-08','2017-03-24',16,'Test','Surabaya','Test','Test','Ir. Setiyono, M.Si','Pesawat Terbang','3470.004.011','524111','Test','Test','2017-03-30'),(65,6,'65.a/BTPAL/ST/10/2017','2017-02-14','2017-02-25',11,'Test','Cirebon','Test','Test','Ir. Setiyono, M.Si','Balon Udara','3470.004.011','524111','Test','Test','2017-02-20'),(66,6,'66.a/BTPAL/ST/10/2017','2017-01-03','2017-01-21',18,'Test','Surabaya','Test','Test','Ir. Setiyono, M.Si','Kendaraan Umum','3470.004.077','123.456-001','Test','Test','2017-01-28'),(67,3,'67.a/BTPAL/ST/10/2017','2017-10-03','2017-10-04',1,'Test','Jakarta Barat','asdf','asdf','Ir. Setiyono, M.Si','Kendaraan Umum','3470.004.011','524111',NULL,NULL,NULL);
/*!40000 ALTER TABLE `sppd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sppd_officer`
--

DROP TABLE IF EXISTS `sppd_officer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sppd_officer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reference_number` varchar(100) NOT NULL,
  `committed_officer` varchar(100) NOT NULL,
  `committed_officer_id` varchar(11) NOT NULL,
  `sppd_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `officer_id` varchar(100) NOT NULL,
  `office_class_name` varchar(100) NOT NULL,
  `office_position_name` varchar(100) NOT NULL,
  `treasurer_officer` varchar(100) DEFAULT NULL,
  `treasurer_officer_id` varchar(100) DEFAULT NULL,
  `daily_cost` varchar(100) DEFAULT NULL,
  `lodging_cost` varchar(100) DEFAULT NULL,
  `total_daily_cost` varchar(100) DEFAULT NULL,
  `total_lodging_cost` varchar(100) DEFAULT NULL,
  `transportation_cost` varchar(100) DEFAULT NULL,
  `total_cost` varchar(100) DEFAULT NULL,
  `total_cost_rp` varchar(1000) DEFAULT NULL,
  `kas_reference_number` varchar(100) DEFAULT NULL,
  `kas_year` varchar(100) DEFAULT NULL,
  `kas_cost_center_code` varchar(100) DEFAULT NULL,
  `kas_description` varchar(10000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sppd_id` (`sppd_id`),
  CONSTRAINT `sppd_officer_ibfk_1` FOREIGN KEY (`sppd_id`) REFERENCES `sppd` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sppd_officer`
--

LOCK TABLES `sppd_officer` WRITE;
/*!40000 ALTER TABLE `sppd_officer` DISABLE KEYS */;
INSERT INTO `sppd_officer` VALUES (42,'42/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',28,'Staff 1','333333333','2A','Staff','Ibu Bendahara','222222222','190000','190000','570000','570000','400000','1540000','Satu Juta Lima Ratus Empat Puluh Ribu Rupiah','1/BKK/BTPAL/BPPT/X/2017','2017','Non Dipa','Uraian kas 1'),(43,'43/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',28,'Staff 2','44444444','2A','Staff','Ibu Bendahara','222222222','190000','190000','570000','570000','400000','1540000','Satu Juta Lima Ratus Empat Puluh Ribu Rupiah','2/BKK/BTPAL/BPPT/X/2017','2017','Non Dipa','Uraian kas 1'),(44,'44/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',29,'Ir. Setiyono, M.Si','081123456','2D','Kepala Balai Teknologi','Ibu Bendahara','222222222','280000','280000','1960000','1960000','400000','4320000','Empat Juta Tiga Ratus Dua Puluh Ribu Rupiah','44/BKK/BTPAL/BPPT/X/2017','2017','Dipa','Uraian kas Tugas 29'),(45,'45/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',30,'Drs. Djoko Prasetyo','1952423432','2B','Pejabat Pembuat Komitmen','Ibu Bendahara','222222222','320000','320000','0','0','200000','200000','Dua Ratus Ribu Rupiah','45/BKK/BTPAL/BPPT/X/2017','2017','Dipa','Uraian kas'),(46,'46/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',30,'Staff 2','44444444','2A','Staff','Ibu Bendahara','222222222','310000','310000','0','0','200000','200000','Dua Ratus Ribu Rupiah','46/BKK/BTPAL/BPPT/X/2017','2017','Dipa','Uraian kas'),(47,'47/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',31,'Staff 1','333333333','2A','Staff','Ibu Bendahara','222222222','310000','310000','4340000','4340000','400000','9080000','Sembilan Juta Delapan Puluh Ribu Rupiah','47/BKK/BTPAL/BPPT/X/2017','2017','Dipa',NULL),(48,'48/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',31,'Staff 2','44444444','2A','Staff','Ibu Bendahara','222222222','310000','310000','4340000','4340000','400000','9080000','Sembilan Juta Delapan Puluh Ribu Rupiah','48/BKK/BTPAL/BPPT/X/2017','2017','Non Dipa',NULL),(49,'49/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',32,'Staff 1','333333333','2A','Staff','Ibu Bendahara','222222222','310000','310000','310000','310000','300000','920000','Sembilan Ratus Dua Puluh Ribu Rupiah','49/BKK/BTPAL/BPPT/X/2017','2017','Dipa',NULL),(50,'50/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',33,'Ir. Setiyono, M.Si','081123456','2D','Kepala Balai Teknologi','Ibu Bendahara','222222222','340000','340000','680000','680000','300000','1660000','Satu Juta Enam Ratus Enam Puluh Ribu Rupiah','50/BKK/BTPAL/BPPT/X/2017','2017','Non Dipa','SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84'),(51,'51/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',34,'Ir. Setiyono, M.Si','081123456','2D','Kepala Balai Teknologi','Ibu Bendahara','222222222','160000','160000','1120000','1120000','123111','2363111','Dua Juta Tiga Ratus Enam Puluh Tiga Ribu Seratus Sebelas Rupiah','51/BKK/BTPAL/BPPT/X/2017','2017',NULL,NULL),(52,'52/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',34,'Drs. Djoko Prasetyo','1952423432','2B','Pejabat Pembuat Komitmen','Ibu Bendahara','222222222','140000','140000','980000','980000','123111','2083111','Dua Juta Delapan Puluh Tiga Ribu Seratus Sebelas Rupiah','52/BKK/BTPAL/BPPT/X/2017','2017',NULL,NULL),(53,'53/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',34,'Ibu Bendahara','222222222','2C','Bendahara','Ibu Bendahara','222222222','150000','150000','1050000','1050000','123111','2223111','Dua Juta Dua Ratus Dua Puluh Tiga Ribu Seratus Sebelas Rupiah','53/BKK/BTPAL/BPPT/X/2017','2017',NULL,NULL),(54,'54/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',34,'Staff 1','333333333','2A','Staff','Ibu Bendahara','222222222','130000','130000','910000','910000','123111','1943111','Satu Juta Sembilan Ratus Empat Puluh Tiga Ribu Seratus Sebelas Rupiah','54/BKK/BTPAL/BPPT/X/2017','2017',NULL,NULL),(55,'55/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',34,'Staff 2','44444444','2A','Staff','Ibu Bendahara','222222222','130000','130000','910000','910000','123111','1943111','Satu Juta Sembilan Ratus Empat Puluh Tiga Ribu Seratus Sebelas Rupiah','55/BKK/BTPAL/BPPT/X/2017','2017',NULL,NULL),(56,'56/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',35,'Staff 1','333333333','2A','Staff','Ibu Bendahara','222222222','130000','130000','3640000','3640000','2222222','9502222','Sembilan Juta Lima Ratus Dua Ribu Dua Ratus Dua Puluh Dua Rupiah','56/BKK/BTPAL/BPPT/X/2017','2017',NULL,NULL),(57,'57/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',35,'Staff 2','44444444','2A','Staff','Ibu Bendahara','222222222','130000','130000','3640000','3640000','2222222','9502222','Sembilan Juta Lima Ratus Dua Ribu Dua Ratus Dua Puluh Dua Rupiah','57/BKK/BTPAL/BPPT/X/2017','2017',NULL,NULL),(58,'58/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',36,'Ir. Setiyono, M.Si','081123456','2D','Kepala Balai Teknologi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'58/BKK/BTPAL/BPPT/X/2017','2017',NULL,NULL),(59,'59/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',37,'Drs. Djoko Prasetyo','1952423432','2B','Pejabat Pembuat Komitmen',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'59/BKK/BTPAL/BPPT/X/2017','2017',NULL,NULL),(60,'60/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',38,'Ibu Bendahara','222222222','2C','Bendahara',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'60/BKK/BTPAL/BPPT/X/2017','2017',NULL,NULL),(61,'61/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',39,'Staff 1','333333333','2A','Staff',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'61/BKK/BTPAL/BPPT/X/2017','2017',NULL,NULL),(62,'62/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',40,'Ir. Setiyono, M.Si','081123456','2D','Kepala Balai Teknologi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'62/BKK/BTPAL/BPPT/X/2017','2017',NULL,NULL),(63,'63/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',40,'Ibu Bendahara','222222222','2C','Bendahara',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'63/BKK/BTPAL/BPPT/X/2017','2017',NULL,NULL),(64,'64/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',40,'Staff 1','333333333','2A','Staff',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'64/BKK/BTPAL/BPPT/X/2017','2017',NULL,NULL),(65,'65/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',40,'Staff 2','44444444','2A','Staff',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'65/BKK/BTPAL/BPPT/X/2017','2017',NULL,NULL),(66,'66/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',41,'Staff 1','333333333','2A','Staff','Ibu Bendahara','222222222','190000','190000','570000','570000','400000','1540000','Satu Juta Lima Ratus Empat Puluh Ribu Rupiah','1/BKK/BTPAL/BPPT/X/2017','2017','Non Dipa','Uraian kas 1'),(67,'67/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',41,'Staff 2','44444444','2A','Staff','Ibu Bendahara','222222222','190000','190000','570000','570000','400000','1540000','Satu Juta Lima Ratus Empat Puluh Ribu Rupiah','2/BKK/BTPAL/BPPT/X/2017','2017','Non Dipa','Uraian kas 1'),(68,'68/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',42,'Staff 1','333333333','2A','Staff','Ibu Bendahara','222222222','190000','190000','570000','570000','400000','1540000','Satu Juta Lima Ratus Empat Puluh Ribu Rupiah','1/BKK/BTPAL/BPPT/X/2017','2017','Non Dipa','Uraian kas 1'),(69,'69/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',42,'Staff 2','44444444','2A','Staff','Ibu Bendahara','222222222','190000','190000','570000','570000','400000','1540000','Satu Juta Lima Ratus Empat Puluh Ribu Rupiah','2/BKK/BTPAL/BPPT/X/2017','2017','Non Dipa','Uraian kas 1'),(70,'70/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',43,'Staff 1','333333333','2A','Staff','Ibu Bendahara','222222222','190000','190000','570000','570000','400000','1540000','Satu Juta Lima Ratus Empat Puluh Ribu Rupiah','1/BKK/BTPAL/BPPT/X/2017','2017','Non Dipa','Uraian kas 1'),(71,'71/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',43,'Staff 2','44444444','2A','Staff','Ibu Bendahara','222222222','190000','190000','570000','570000','400000','1540000','Satu Juta Lima Ratus Empat Puluh Ribu Rupiah','2/BKK/BTPAL/BPPT/X/2017','2017','Non Dipa','Uraian kas 1'),(72,'72/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',44,'Staff 1','333333333','2A','Staff','Ibu Bendahara','222222222','190000','190000','570000','570000','400000','1540000','Satu Juta Lima Ratus Empat Puluh Ribu Rupiah','1/BKK/BTPAL/BPPT/X/2017','2017','Non Dipa','Uraian kas 1'),(73,'73/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',44,'Staff 2','44444444','2A','Staff','Ibu Bendahara','222222222','190000','190000','570000','570000','400000','1540000','Satu Juta Lima Ratus Empat Puluh Ribu Rupiah','2/BKK/BTPAL/BPPT/X/2017','2017','Non Dipa','Uraian kas 1'),(74,'74/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',45,'Staff 1','333333333','2A','Staff','Ibu Bendahara','222222222','190000','190000','570000','570000','400000','1540000','Satu Juta Lima Ratus Empat Puluh Ribu Rupiah','1/BKK/BTPAL/BPPT/X/2017','2017','Non Dipa','Uraian kas 1'),(75,'75/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',45,'Staff 2','44444444','2A','Staff','Ibu Bendahara','222222222','190000','190000','570000','570000','400000','1540000','Satu Juta Lima Ratus Empat Puluh Ribu Rupiah','2/BKK/BTPAL/BPPT/X/2017','2017','Non Dipa','Uraian kas 1'),(76,'76/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',46,'Staff 1','333333333','2A','Staff','Ibu Bendahara','222222222','190000','190000','570000','570000','400000','1540000','Satu Juta Lima Ratus Empat Puluh Ribu Rupiah','1/BKK/BTPAL/BPPT/X/2017','2017','Non Dipa','Uraian kas 1'),(77,'77/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',46,'Staff 2','44444444','2A','Staff','Ibu Bendahara','222222222','190000','190000','570000','570000','400000','1540000','Satu Juta Lima Ratus Empat Puluh Ribu Rupiah','2/BKK/BTPAL/BPPT/X/2017','2017','Non Dipa','Uraian kas 1'),(78,'78/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',47,'Staff 1','333333333','2A','Staff','Ibu Bendahara','222222222','190000','190000','570000','570000','400000','1540000','Satu Juta Lima Ratus Empat Puluh Ribu Rupiah','1/BKK/BTPAL/BPPT/X/2017','2017','Non Dipa','Uraian kas 1'),(79,'79/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',47,'Staff 2','44444444','2A','Staff','Ibu Bendahara','222222222','190000','190000','570000','570000','400000','1540000','Satu Juta Lima Ratus Empat Puluh Ribu Rupiah','2/BKK/BTPAL/BPPT/X/2017','2017','Non Dipa','Uraian kas 1'),(80,'80/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',48,'Ir. Setiyono, M.Si','081123456','2D','Kepala Balai Teknologi','Ibu Bendahara','222222222','280000','280000','1680000','1680000','333333','3693333','Tiga Juta Enam Ratus Sembilan Puluh Tiga Ribu Tiga Ratus Tiga Puluh Tiga Rupiah','80/BKK/BTPAL/BPPT/X/2017','2017','Dipa','SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84'),(81,'81/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',49,'Ir. Setiyono, M.Si','081123456','2D','Kepala Balai Teknologi','Ibu Bendahara','222222222','160000','160000','320000','320000','1111111','1751111','Satu Juta Tujuh Ratus Lima Puluh Satu Ribu Seratus Sebelas Rupiah','81/BKK/BTPAL/BPPT/X/2017','2017','Non Dipa','sppd 49 sppd 49'),(82,'82/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',50,'Ibu Bendahara','222222222','2C','Bendahara','Ibu Bendahara','222222222','150000','150000','750000','750000','111111','1611111','Satu Juta Enam Ratus Sebelas Ribu Seratus Sebelas Rupiah','82/BKK/BTPAL/BPPT/X/2017','2017','Dipa','sppd 50 sppd 50 sppd 50'),(83,'83/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',50,'Ir. Setiyono, M.Si','081123456','2D','Kepala Balai Teknologi','Ibu Bendahara','222222222','160000','160000','800000','800000','111111','1711111','Satu Juta Tujuh Ratus Sebelas Ribu Seratus Sebelas Rupiah','83/BKK/BTPAL/BPPT/X/2017','2017','Dipa','sppd 50 sppd 50 sppd 50'),(84,'84/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',50,'Drs. Djoko Prasetyo','1952423432','2B','Pejabat Pembuat Komitmen','Ibu Bendahara','222222222','140000','140000','700000','700000','111111','1511111','Satu Juta Lima Ratus Sebelas Ribu Seratus Sebelas Rupiah','84/BKK/BTPAL/BPPT/X/2017','2017','Dipa','sppd 50 sppd 50 sppd 50'),(85,'85/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',51,'Staff 1','333333333','2A','Staff','Ibu Bendahara','222222222','250000','250000','1500000','1500000','123435','3123435','Tiga Juta Seratus Dua Puluh Tiga Ribu Empat Ratus Tiga Puluh Lima Rupiah','85/BKK/BTPAL/BPPT/X/2017','2017','Dipa','sppd 51 sppd 51 sppd 51 sppd 51 sppd 51 sppd 51'),(86,'86/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',51,'Ibu Bendahara','222222222','2C','Bendahara','Ibu Bendahara','222222222','270000','270000','1620000','1620000','123435','3363435','Tiga Juta Tiga Ratus Enam Puluh Tiga Ribu Empat Ratus Tiga Puluh Lima Rupiah','86/BKK/BTPAL/BPPT/X/2017','2017','Dipa','sppd 51 sppd 51 sppd 51 sppd 51 sppd 51 sppd 51'),(87,'87/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',52,'Staff 2','44444444','2A','Staff','Ibu Bendahara','222222222','310000','310000','1860000','1860000','2343134','6063134','Enam Juta Enam Puluh Tiga Ribu Seratus Tiga Puluh Empat Rupiah','87/BKK/BTPAL/BPPT/X/2017','2017','Dipa','sppd 52 sppd 52 sppd 52 sppd 52 sppd 52'),(88,'88/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',52,'Ir. Setiyono, M.Si','081123456','2D','Kepala Balai Teknologi','Ibu Bendahara','222222222','340000','340000','2040000','2040000','2343134','6423134','Enam Juta Empat Ratus Dua Puluh Tiga Ribu Seratus Tiga Puluh Empat Rupiah','88/BKK/BTPAL/BPPT/X/2017','2017','Dipa','sppd 52 sppd 52 sppd 52 sppd 52 sppd 52'),(89,'89/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',53,'Ir. Setiyono, M.Si','081123456','2D','Kepala Balai Teknologi','Ibu Bendahara','222222222','160000','160000','1280000','1280000','333333','2893333','Dua Juta Delapan Ratus Sembilan Puluh Tiga Ribu Tiga Ratus Tiga Puluh Tiga Rupiah','89/BKK/BTPAL/BPPT/X/2017','2017','Non Dipa','TestTest'),(90,'90/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',54,'Drs. Djoko Prasetyo','1952423432','2B','Pejabat Pembuat Komitmen','Ibu Bendahara','222222222','140000','140000','840000','840000','222222','1902222','Satu Juta Sembilan Ratus Dua Ribu Dua Ratus Dua Puluh Dua Rupiah','90/BKK/BTPAL/BPPT/X/2017','2017','Dipa','TestTestTest'),(91,'91/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',55,'Ibu Bendahara','222222222','2C','Bendahara','Ibu Bendahara','222222222','150000','150000','900000','900000','222222','2022222','Dua Juta Dua Puluh Dua Ribu Dua Ratus Dua Puluh Dua Rupiah','91/BKK/BTPAL/BPPT/X/2017','2017','Non Dipa','TestTestTest'),(92,'92/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',56,'Ibu Bendahara','222222222','2C','Bendahara','Ibu Bendahara','222222222','150000','150000','900000','900000','333333','2133333','Dua Juta Seratus Tiga Puluh Tiga Ribu Tiga Ratus Tiga Puluh Tiga Rupiah','92/BKK/BTPAL/BPPT/X/2017','2017','Dipa','TestTestTestTest'),(93,'93/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',56,'Staff 1','333333333','2A','Staff','Ibu Bendahara','222222222','130000','130000','780000','780000','333333','1893333','Satu Juta Delapan Ratus Sembilan Puluh Tiga Ribu Tiga Ratus Tiga Puluh Tiga Rupiah','93/BKK/BTPAL/BPPT/X/2017','2017','Dipa','TestTestTestTest'),(94,'94/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',56,'Staff 2','44444444','2A','Staff','Ibu Bendahara','222222222','130000','130000','780000','780000','333333','1893333','Satu Juta Delapan Ratus Sembilan Puluh Tiga Ribu Tiga Ratus Tiga Puluh Tiga Rupiah','94/BKK/BTPAL/BPPT/X/2017','2017','Dipa','TestTestTestTest'),(95,'95/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',57,'Staff 1','333333333','2A','Staff','Ibu Bendahara','222222222','130000','130000','10920000','10920000','1231231','23071231','Dua Puluh Tiga Juta Tujuh Puluh Satu Ribu Dua Ratus Tiga Puluh Satu Rupiah','95/BKK/BTPAL/BPPT/X/2017','2017',NULL,NULL),(96,'96/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',57,'Staff 2','44444444','2A','Staff','Ibu Bendahara','222222222','130000','130000','10920000','10920000','1231231','23071231','Dua Puluh Tiga Juta Tujuh Puluh Satu Ribu Dua Ratus Tiga Puluh Satu Rupiah','96/BKK/BTPAL/BPPT/X/2017','2017',NULL,NULL),(97,'97/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',58,'Staff 1','333333333','2A','Staff','Ibu Bendahara','222222222','130000','130000','2730000','2730000','333333','5793333','Lima Juta Tujuh Ratus Sembilan Puluh Tiga Ribu Tiga Ratus Tiga Puluh Tiga Rupiah','97/BKK/BTPAL/BPPT/X/2017','2017','Non Dipa','TestTestTestTest'),(98,'98/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',58,'Ir. Setiyono, M.Si','081123456','2D','Kepala Balai Teknologi','Ibu Bendahara','222222222','160000','160000','3360000','3360000','333333','7053333','Tujuh Juta Lima Puluh Tiga Ribu Tiga Ratus Tiga Puluh Tiga Rupiah','98/BKK/BTPAL/BPPT/X/2017','2017','Non Dipa','TestTestTestTest'),(99,'99/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',59,'Ir. Setiyono, M.Si','081123456','2D','Kepala Balai Teknologi','Ibu Bendahara','222222222','340000','340000','10200000','10200000','3333333','23733333','Dua Puluh Tiga Juta Tujuh Ratus Tiga Puluh Tiga Ribu Tiga Ratus Tiga Puluh Tiga Rupiah','99/BKK/BTPAL/BPPT/X/2017','2017','Dipa','TestTest'),(100,'100/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',59,'Drs. Djoko Prasetyo','1952423432','2B','Pejabat Pembuat Komitmen','Ibu Bendahara','222222222','320000','320000','9600000','9600000','3333333','22533333','Dua Puluh Dua Juta Lima Ratus Tiga Puluh Tiga Ribu Tiga Ratus Tiga Puluh Tiga Rupiah','100/BKK/BTPAL/BPPT/X/2017','2017','Dipa','TestTest'),(101,'101/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',59,'Ibu Bendahara','222222222','2C','Bendahara','Ibu Bendahara','222222222','330000','330000','9900000','9900000','3333333','23133333','Dua Puluh Tiga Juta Seratus Tiga Puluh Tiga Ribu Tiga Ratus Tiga Puluh Tiga Rupiah','101/BKK/BTPAL/BPPT/X/2017','2017','Dipa','TestTest'),(102,'102/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',59,'Staff 1','333333333','2A','Staff','Ibu Bendahara','222222222','310000','310000','9300000','9300000','3333333','21933333','Dua Puluh Satu Juta Sembilan Ratus Tiga Puluh Tiga Ribu Tiga Ratus Tiga Puluh Tiga Rupiah','102/BKK/BTPAL/BPPT/X/2017','2017','Dipa','TestTest'),(103,'103/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',59,'Staff 2','44444444','2A','Staff','Ibu Bendahara','222222222','310000','310000','9300000','9300000','3333333','21933333','Dua Puluh Satu Juta Sembilan Ratus Tiga Puluh Tiga Ribu Tiga Ratus Tiga Puluh Tiga Rupiah','103/BKK/BTPAL/BPPT/X/2017','2017','Dipa','TestTest'),(104,'104/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',60,'Ibu Bendahara','222222222','2C','Bendahara','Ibu Bendahara','222222222','210000','210000','4410000','4410000','333333','9153333','Sembilan Juta Seratus Lima Puluh Tiga Ribu Tiga Ratus Tiga Puluh Tiga Rupiah','104/BKK/BTPAL/BPPT/X/2017','2017','Dipa','TestTestTestTest'),(105,'105/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',61,'Ir. Setiyono, M.Si','081123456','2D','Kepala Balai Teknologi','Ibu Bendahara','222222222','220000','220000','3960000','3960000',NULL,NULL,NULL,'105/BKK/BTPAL/BPPT/X/2017','2017',NULL,NULL),(106,'106/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',61,'Staff 2','44444444','2A','Staff','Ibu Bendahara','222222222','190000','190000','3420000','3420000',NULL,NULL,NULL,'106/BKK/BTPAL/BPPT/X/2017','2017',NULL,NULL),(107,'107/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',61,'Drs. Djoko Prasetyo','1952423432','2B','Pejabat Pembuat Komitmen','Ibu Bendahara','222222222','200000','200000','3600000','3600000',NULL,NULL,NULL,'107/BKK/BTPAL/BPPT/X/2017','2017',NULL,NULL),(108,'108/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',61,'Ibu Bendahara','222222222','2C','Bendahara','Ibu Bendahara','222222222','210000','210000','3780000','3780000',NULL,NULL,NULL,'108/BKK/BTPAL/BPPT/X/2017','2017',NULL,NULL),(109,'109/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',61,'Staff 1','333333333','2A','Staff','Ibu Bendahara','222222222','190000','190000','3420000','3420000',NULL,NULL,NULL,'109/BKK/BTPAL/BPPT/X/2017','2017',NULL,NULL),(110,'110/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',62,'Ibu Bendahara','222222222','2C','Bendahara','Ibu Bendahara','222222222','330000','330000','8580000','8580000','333333','17493333','Tujuh Belas Juta Empat Ratus Sembilan Puluh Tiga Ribu Tiga Ratus Tiga Puluh Tiga Rupiah','110/BKK/BTPAL/BPPT/X/2017','2017','Dipa','TestTest'),(111,'111/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',62,'Drs. Djoko Prasetyo','1952423432','2B','Pejabat Pembuat Komitmen','Ibu Bendahara','222222222','320000','320000','8320000','8320000','333333','16973333','Enam Belas Juta Sembilan Ratus Tujuh Puluh Tiga Ribu Tiga Ratus Tiga Puluh Tiga Rupiah','111/BKK/BTPAL/BPPT/X/2017','2017','Dipa','TestTest'),(112,'112/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',63,'Staff 1','333333333','2A','Staff','Ibu Bendahara','222222222','310000','310000','6200000','6200000','123444','12523444','Dua Belas Juta Lima Ratus Dua Puluh Tiga Ribu Empat Ratus Empat Puluh Empat Rupiah','112/BKK/BTPAL/BPPT/X/2017','2017','Non Dipa','TestTest'),(113,'113/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',63,'Staff 2','44444444','2A','Staff','Ibu Bendahara','222222222','310000','310000','6200000','6200000','123444','12523444','Dua Belas Juta Lima Ratus Dua Puluh Tiga Ribu Empat Ratus Empat Puluh Empat Rupiah','113/BKK/BTPAL/BPPT/X/2017','2017','Non Dipa','TestTest'),(114,'114/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',63,'Ir. Setiyono, M.Si','081123456','2D','Kepala Balai Teknologi','Ibu Bendahara','222222222','340000','340000','6800000','6800000','123444','13723444','Tiga Belas Juta Tujuh Ratus Dua Puluh Tiga Ribu Empat Ratus Empat Puluh Empat Rupiah','114/BKK/BTPAL/BPPT/X/2017','2017','Non Dipa','TestTest'),(115,'115/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',64,'Ir. Setiyono, M.Si','081123456','2D','Kepala Balai Teknologi','Ibu Bendahara','222222222','340000','340000','5440000','5440000','555666','11435666','Sebelas Juta Empat Ratus Tiga Puluh Lima Ribu Enam Ratus Enam Puluh Enam Rupiah','115/BKK/BTPAL/BPPT/X/2017','2017','Non Dipa','TestTestTest'),(116,'116/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',65,'Ir. Setiyono, M.Si','081123456','2D','Kepala Balai Teknologi','Ibu Bendahara','222222222','220000','220000','2420000','2420000','444333','5284333','Lima Juta Dua Ratus Delapan Puluh Empat Ribu Tiga Ratus Tiga Puluh Tiga Rupiah','116/BKK/BTPAL/BPPT/X/2017','2017','Non Dipa','TestTestTest'),(117,'117/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',65,'Staff 2','44444444','2A','Staff','Ibu Bendahara','222222222','190000','190000','2090000','2090000','444333','4624333','Empat Juta Enam Ratus Dua Puluh Empat Ribu Tiga Ratus Tiga Puluh Tiga Rupiah','117/BKK/BTPAL/BPPT/X/2017','2017','Non Dipa','TestTestTest'),(118,'118/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',66,'Drs. Djoko Prasetyo','1952423432','2B','Pejabat Pembuat Komitmen','Ibu Bendahara','222222222','320000','320000','5760000','5760000','123666','11643666','Sebelas Juta Enam Ratus Empat Puluh Tiga Ribu Enam Ratus Enam Puluh Enam Rupiah','118/BKK/BTPAL/BPPT/X/2017','2017','Dipa','Test'),(119,'119/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',67,'Ir. Setiyono, M.Si','081123456','2D','Kepala Balai Teknologi','Ibu Bendahara','222222222','160000','160000','160000','160000','10000','330000','Tiga Ratus Tiga Puluh Ribu Rupiah','119/BKK/BTPAL/BPPT/X/2017','2017',NULL,NULL);
/*!40000 ALTER TABLE `sppd_officer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transport`
--

DROP TABLE IF EXISTS `transport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transport`
--

LOCK TABLES `transport` WRITE;
/*!40000 ALTER TABLE `transport` DISABLE KEYS */;
INSERT INTO `transport` VALUES (2,'Balon Udara'),(5,'Gojeg'),(1,'Kendaraan Umum'),(3,'Kereta Api'),(4,'Pesawat Terbang');
/*!40000 ALTER TABLE `transport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travel_expenses`
--

DROP TABLE IF EXISTS `travel_expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `travel_expenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `office_class_id` int(11) NOT NULL,
  `province_id` int(11) NOT NULL,
  `daily_cost` int(100) NOT NULL,
  `lodging_cost` int(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `travel_expenses_ibfk_1` (`office_class_id`),
  CONSTRAINT `travel_expenses_ibfk_1` FOREIGN KEY (`office_class_id`) REFERENCES `office_class` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travel_expenses`
--

LOCK TABLES `travel_expenses` WRITE;
/*!40000 ALTER TABLE `travel_expenses` DISABLE KEYS */;
INSERT INTO `travel_expenses` VALUES (2,1,2,170000,170000),(4,1,2,430000,435000),(5,1,2,430000,435000),(6,1,6,110002,110003),(7,2,6,120000,120000),(8,3,6,130000,130000),(9,4,6,140000,140000),(10,5,6,150000,150000),(11,6,6,160000,160000),(12,2,2,180000,180000),(13,3,2,190000,190000),(14,4,2,200000,200000),(15,5,2,210000,210000),(16,6,2,220000,220000),(17,1,4,230000,230000),(18,2,4,240000,240000),(19,3,4,250000,250000),(20,4,4,260001,260000),(21,5,4,270000,270000),(22,6,4,280000,280000),(23,1,5,290000,290000),(24,2,5,300000,300000),(25,3,5,310000,310000),(26,4,5,320000,320000),(27,5,5,330000,330000),(28,6,5,340000,340000);
/*!40000 ALTER TABLE `travel_expenses` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-15  2:11:04
