-- MySQL dump 10.13  Distrib 5.7.19, for osx10.12 (x86_64)
--
-- Host: localhost    Database: db_sppd_1
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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `budget`
--

LOCK TABLES `budget` WRITE;
/*!40000 ALTER TABLE `budget` DISABLE KEYS */;
INSERT INTO `budget` VALUES (47,'3470.004.002','521111'),(49,'3470.004.002','524111'),(50,'3470.004.002','524113'),(44,'3470.004.051','521211'),(37,'3470.004.051','52311'),(45,'3470.004.051','524111'),(46,'3470.004.051','524113');
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Jakarta Barat',6),(2,'Jakarta Timur',6),(3,'Bandung',2),(4,'Cirebon',2),(5,'Semarang',4),(6,'Pemalang',4),(7,'Surabaya',5),(8,'Brebes',4),(9,'Tegal',4),(10,'Pekalongan',4),(11,'Kendal',4),(19,'Purbalingga',4),(20,'Godong',4),(21,'Purwokerto',4),(22,'Jakarta Utara',6),(23,'Jakarta Selatan',6),(24,'Jakarta Tengah',6),(25,'Malang',5),(26,'Sukabumi',2),(27,'Bantul',7),(28,'Gunung Kidul',7),(29,'Cianjur',2);
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dipa_code`
--

DROP TABLE IF EXISTS `dipa_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dipa_code` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fiscal_year` varchar(10) NOT NULL,
  `institution` varchar(100) NOT NULL,
  `organizational_unit` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `work_unit` varchar(100) NOT NULL,
  `document` varchar(100) NOT NULL,
  `code_number` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `kppn` varchar(100) NOT NULL,
  `parent_id` int(10) DEFAULT NULL,
  `revisi` int(10) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dipa_code`
--

LOCK TABLES `dipa_code` WRITE;
/*!40000 ALTER TABLE `dipa_code` DISABLE KEYS */;
INSERT INTO `dipa_code` VALUES (2,'2017','(081) Badan Pengkajian Dan Penerapan Teknologi','(01) Badan Pengkajian Dan Penerapan Teknologi','Kab. Tangerang','(631034) Balai Teknologi Pengolahan Air dan Limbah','(02) Non DIPA','SP DIPA-081.01.2.631034/2016','2017-07-03','(127) Tangerang',NULL,0,0),(19,'2017','(081) Badan Pengkajian Dan Penerapan Teknologi','(01) Badan Pengkajian Dan Penerapan Teknologi','Kab. Tangerang','(631034) Balai Teknologi Pengolahan Air dan Limbah','(02) Non DIPA','SP DIPA-081.01.2.631034/2016','2017-08-01','(127) Tangerang',2,1,0),(20,'2017','(081) Badan Pengkajian Dan Penerapan Teknologi','(01) Badan Pengkajian Dan Penerapan Teknologi','Kab. Tangerang','(631034) Balai Teknologi Pengolahan Air dan Limbah','(02) Non DIPA','SP DIPA-081.01.2.631034/2016','2017-10-04','(127) Tangerang',2,2,0),(21,'2017','(081) Badan Pengkajian Dan Penerapan Teknologi','(01) Badan Pengkajian Dan Penerapan Teknologi','Kab. Tangerang','(631034) Balai Teknologi Pengolahan Air dan Limbah','(02) Non DIPA','SP DIPA-081.01.2.631034/2016','2017-11-01','(127) Tangerang',2,3,0),(22,'2017','(081) Badan Pengkajian Dan Penerapan Teknologi','(01) Badan Pengkajian Dan Penerapan Teknologi','Kab. Tangerang','(631034) Balai Teknologi Pengolahan Air dan Limbah','(02) Non DIPA','SP DIPA-081.01.2.631034/2016','2017-12-01','(127) Tangerang',2,4,0),(23,'2017','(081) Badan Pengkajian Dan Penerapan Teknologi','(01) Badan Pengkajian Dan Penerapan Teknologi','Kab. Tangerang','(631034) Balai Teknologi Pengolahan Air dan Limbah','(02) Non DIPA','SP DIPA-081.01.2.631034/2016','2018-01-01','(127) Tangerang',2,5,0),(24,'2017','(081) Badan Pengkajian Dan Penerapan Teknologi','(01) Badan Pengkajian Dan Penerapan Teknologi','Kab. Tangerang','(631034) Balai Teknologi Pengolahan Air dan Limbah','(02) Non DIPA','SP DIPA-081.01.2.631034/2016','2018-01-01','(127) Tangerang',2,6,0),(26,'2017','(081) Badan Pengkajian Dan Penerapan Teknologi','(01) Badan Pengkajian Dan Penerapan Teknologi','Kab. Tangerang','(631034) Balai Teknologi Pengolahan Air dan Limbah','(02) Non DIPA','SP DIPA-081.01.2.631034/2016','2018-01-01','(127) Tangerang',2,7,0),(27,'2017','(081) Badan Pengkajian Dan Penerapan Teknologi','(01) Badan Pengkajian Dan Penerapan Teknologi','Kab. Tangerang','(631034) Balai Teknologi Pengolahan Air dan Limbah','(02) Non DIPA','SP DIPA-081.01.2.631034/2016','2018-01-01','(127) Tangerang',2,8,0),(28,'2017','(081) Badan Pengkajian Dan Penerapan Teknologi','(01) Badan Pengkajian Dan Penerapan Teknologi','Kab. Tangerang','(631034) Balai Teknologi Pengolahan Air dan Limbah','(02) Non DIPA','SP DIPA-081.01.2.631034/2016','2018-01-01','(127) Tangerang',2,9,1);
/*!40000 ALTER TABLE `dipa_code` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `office_class`
--

LOCK TABLES `office_class` WRITE;
/*!40000 ALTER TABLE `office_class` DISABLE KEYS */;
INSERT INTO `office_class` VALUES (2,'1D'),(3,'2A'),(4,'2B'),(5,'2C'),(6,'2D'),(7,'3A'),(8,'3B'),(9,'3C'),(10,'3D'),(11,'4A'),(12,'4B'),(13,'4C'),(14,'4D'),(15,'4E');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `office_position`
--

LOCK TABLES `office_position` WRITE;
/*!40000 ALTER TABLE `office_position` DISABLE KEYS */;
INSERT INTO `office_position` VALUES (1,'Kepala Balai Teknologi Pengolahan Air dan Limbah',1),(2,'Pejabat Pembuat Komitmen',1),(3,'Bendahara',1),(4,'Staff Pengembangan Perlindungan Lingkungan',0),(5,'Staff Pelayanan Jasa dan Teknologi',0),(6,'Petugas Administrasi',0),(7,'Kepala Laboratorium Analitik',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `officer`
--

LOCK TABLES `officer` WRITE;
/*!40000 ALTER TABLE `officer` DISABLE KEYS */;
INSERT INTO `officer` VALUES (1,'Ir. Setiyono, M.Si','081123456','081111133434343',10,1),(2,'Drs. Djoko Prasetyo','1952423432','024234234',8,2),(3,'Nurlela, SE, M.Ak','222222222','024234234',8,3),(4,'Ajeng Triana, A.Md','333333333','024234234',5,4),(5,'Tia Agustiani, S.Si','44444444','02142344324',7,4),(6,'Rendi Handika, A.Md','198809072014021004','082114087105',5,5),(7,'Yosep Widi Nugraha, ST','198509012014021001','082114087105',7,6),(8,'Insan Nur Sulistiawan, ST','198702102009011004','0821137972362',7,5);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `province`
--

LOCK TABLES `province` WRITE;
/*!40000 ALTER TABLE `province` DISABLE KEYS */;
INSERT INTO `province` VALUES (6,'DKI Jakarta'),(2,'Jawa Barat'),(4,'Jawa Tengah'),(5,'Jawa Timur'),(7,'Yogyakarta');
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
  `date_service_cost_approve` date DEFAULT NULL,
  `dipa_code_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sppd`
--

LOCK TABLES `sppd` WRITE;
/*!40000 ALTER TABLE `sppd` DISABLE KEYS */;
INSERT INTO `sppd` VALUES (28,6,'28.a/BTPAL/ST/10/2017','2017-09-01','2017-09-04',3,'Dasar 1','Cirebon','Tugas 1','Keterangan 1','Ir. Setiyono, M.Si','Kendaraan Umum','3470.004.011','524111','Judul Laporan 1','Isi laporan','2017-10-13','2017-10-01',23),(29,6,'29.a/BTPAL/ST/10/2017','2017-09-10','2017-09-17',7,'Nomor Surat 29','Brebes','Tigas 29','Keterangan 29','Ir. Setiyono, M.Si','Gojeg','234234234','1','Tigas 29','Halo ini hasil dinas pada tanggal 10 september ahlisnhfishfihsdifhsidfsdif sfgdskfgskdfsd fusgdfskd fgsdgfds Halo ini hasil dinas pada tanggal 10 september ahlisnhfishfihsdifhsidfsdif sfgdskfgskdfsd fusgdfskd fgsdgfds Halo ini hasil dinas pada tanggal 10 september ahlisnhfishfihsdifhsidfsdif sfgdskfgskdfsd fusgdfskd fgsdgfds Halo ini hasil dinas pada tanggal 10 september ahlisnhfishfihsdifhsidfsdif sfgdskfgskdfsd fusgdfskd fgsdgfds Halo ini hasil dinas pada tanggal 10 september ahlisnhfishfihsdifhsidfsdif sfgdskfgskdfsd fusgdfskd fgsdgfds Halo ini hasil dinas pada tanggal 10 september ahlisnhfishfihsdifhsidfsdif sfgdskfgskdfsd fusgdfskd fgsdgfdsHalo ini hasil dinas pada tanggal 10 september ahlisnhfishfihsdifhsidfsdif sfgdskfgskdfsd fusgdfskd fgsdgfds Halo ini hasil dinas pada tanggal 10 september ahlisnhfishfihsdifhsidfsdif sfgdskfgskdfsd fusgdfskd fgsdgfds Halo ini hasil dinas pada tanggal 10 september ahlisnhfishfihsdifhsidfsdif sfgdskfgskdfsd fusgdfskd fgsdgfds\nHalo ini hasil dinas','2017-12-11','2017-10-01',23),(30,6,'30.a/BTPAL/ST/10/2017','2017-09-03','2017-09-03',0,'Dasar Surat 30','Surabaya','Tugas 30','Keterangan Tugas 30','Ir. Setiyono, M.Si','Kereta Api','234234234','234324','Tugas 30','dasda','2017-12-17','2017-10-01',23),(31,6,'31.a/BTPAL/ST/10/2017','2017-09-11','2017-09-25',14,'Dasar 31','Malang','Tugas 31','Keterangan 31','Ir. Setiyono, M.Si','Balon Udara','234234234','sdfdsf','Tugas 31','Halo ini laporan dinas','2017-12-08','2017-10-01',23),(32,6,'32.a/BTPAL/ST/10/2017','2017-09-25','2017-09-26',1,'Dasar 32','Malang','Tugas 32','Keterangan 32','Ir. Setiyono, M.Si','Gojeg','3470.004.011','524112','Tugas 32','Halo','0000-00-00','2017-10-01',23),(33,6,'33.a/BTPAL/ST/10/2017','2017-10-02','2017-10-04',2,'Dasar 33','Surabaya','Tugas 33','Keterangan 33','Ir. Setiyono, M.Si','Kereta Api','3470.004.011','524111','Tugas 33','Haloooo ini yg ke 26','2017-12-08','2017-10-01',23),(34,0,'34.a/BTPAL/ST/10/2017','2017-09-10','2017-09-17',7,'Dasar 34','Jakarta Tengah','Tugad 34','Keterangan 34','Ir. Setiyono, M.Si','Gojeg','3470.004.011','524111',NULL,NULL,NULL,NULL,NULL),(35,5,'35.a/BTPAL/ST/10/2017','2017-09-04','2017-09-01',28,'Surat 35','Jakarta Tengah','Tugas 35','Keterangan 35','Ir. Setiyono, M.Si','Gojeg','3470.004.011','524112',NULL,NULL,NULL,'2017-11-01',23),(36,5,'36.a/BTPAL/ST/10/2017','2017-09-02','2017-09-04',2,'Individu 36','Jakarta Timur','Individu 36','Individu 36','Ir. Setiyono, M.Si','Kendaraan Umum','3470.004.051','52311','Individu 36','Melakukan perjalanan dinas ke jakarta pada hari\nminggu kuturut ayah ke kota naik delman istimewa\nkududuk dimuka','0000-00-00','2017-11-01',23),(37,0,'37.a/BTPAL/ST/10/2017','2017-09-03','2017-09-04',1,'Individu 37','Surabaya','Individu 37','Individu 37','Ir. Setiyono, M.Si',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(38,0,'38.a/BTPAL/ST/10/2017','2017-09-18','2017-09-20',2,'Individu 38','Semarang','Individu 38','Individu 38','Ir. Setiyono, M.Si','Pesawat Terbang','3470.004.051','52311',NULL,NULL,NULL,NULL,NULL),(39,0,'39.a/BTPAL/ST/10/2017','2017-09-18','2017-09-19',1,'Individu','Sukabumi','Individu','Individu','Ir. Setiyono, M.Si','Kereta Api','3470.004.011','524112',NULL,NULL,NULL,NULL,NULL),(40,0,'40.a/BTPAL/ST/10/2017','2017-09-04','2017-09-06',2,'Rame Rame','Jakarta Barat','Rame Rame','Rame Rame','Ir. Setiyono, M.Si','Pesawat Terbang','3470.004.051','52311',NULL,NULL,NULL,NULL,NULL),(41,6,'41.a/BTPAL/ST/10/2017','2017-09-02','2017-09-05',3,'Dasar 1','Malang','Tugas 1','Keterangan 1','Ir. Setiyono, M.Si','Kendaraan Umum','3470.004.011','524111','Judul Laporan 1','Isi laporan','2017-10-13','2017-10-01',23),(42,6,'42.a/BTPAL/ST/10/2017','2017-09-03','2017-09-06',3,'Dasar 1','Bandung','Tugas 1','Keterangan 1','Ir. Setiyono, M.Si','Kendaraan Umum','3470.004.011','524111','Judul Laporan 1','Isi laporan','2017-10-13','2017-10-01',23),(43,6,'43.a/BTPAL/ST/10/2017','2017-09-04','2017-09-10',3,'Dasar 1','Bandung','Tugas 1','Keterangan 1','Ir. Setiyono, M.Si','Kendaraan Umum','3470.004.011','524111','Judul Laporan 1','Isi laporan','2017-10-13','2017-10-01',23),(44,6,'44.a/BTPAL/ST/10/2017','2017-09-05','2017-09-08',3,'Dasar 1','Surabaya','Tugas 1','Keterangan 1','Ir. Setiyono, M.Si','Kendaraan Umum','3470.004.011','524112','Judul Laporan 1','Isi laporan','2017-10-13','2017-10-01',23),(45,6,'45.a/BTPAL/ST/10/2017','2017-09-06','2017-09-09',3,'Dasar 1','Bandung','Tugas 1','Keterangan 1','Ir. Setiyono, M.Si','Kendaraan Umum','3470.004.022','9843.001','Judul Laporan 1','Isi laporan','2017-10-13','2017-10-01',23),(46,6,'46.a/BTPAL/ST/10/2017','2017-09-07','2017-09-10',3,'Dasar 1','Tegal','Tugas 1','Keterangan 1','Ir. Setiyono, M.Si','Kendaraan Umum','3470.004.022','9843.001','Judul Laporan 1','Isi laporan','2017-10-13','2017-10-01',23),(47,6,'47.a/BTPAL/ST/10/2017','2017-09-08','2017-09-11',3,'Dasar 1','Bandung','Tugas 1','Keterangan 1','Ir. Setiyono, M.Si','Kendaraan Umum','3470.004.077','123.456-001','Judul Laporan 1','Isi laporan','2017-10-13','2017-10-01',23),(48,6,'48.a/BTPAL/ST/10/2017','2017-09-29','2017-10-04',6,'SPPD 84','Brebes','SPPD 84','SPPD 84','Ir. Setiyono, M.Si','Pesawat Terbang','3470.004.077','123.456-001','SPPD 84 SPPD 84','SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84','2017-11-11','2017-10-01',23),(49,6,'49.a/BTPAL/ST/10/2017','2017-09-08','2017-09-10',2,'sppd 49','Jakarta Utara','sppd 49','sppd 49','Ir. Setiyono, M.Si','Kendaraan Umum','3470.004.077','123.456-002','sppd 49 sppd 49 sppd 49','sppd 49 sppd 49 sppd 49','2017-11-11','2017-10-01',23),(50,6,'50.a/BTPAL/ST/10/2017','2017-09-02','2017-09-07',5,'sppd 50','Jakarta Tengah','sppd 50','sppd 50','Ir. Setiyono, M.Si','Kereta Api','3470.004.077','123.456-003','sppd 50','sppd 50 sppd 50 sppd 50 sppd 50 sppd 50 sppd 50 sppd 50 sppd 50 sppd 50 sppd 50 sppd 50 sppd 50 sppd 50 sppd 50 sppd 50 sppd 50 sppd 50 sppd 50 sppd 50 sppd 50','2017-11-11','2017-10-01',23),(51,6,'51.a/BTPAL/ST/10/2017','2017-09-15','2017-09-21',6,'sppd 51 sppd 51 sppd 51','Tegal','sppd 51','sppd 51','Ir. Setiyono, M.Si','Pesawat Terbang','3470.004.077','123.456-004','sppd 51 sppd 51 sppd 51','sppd 51 sppd 51 sppd 51 sppd 51 sppd 51','2017-11-11','2017-10-01',23),(52,6,'52.a/BTPAL/ST/10/2017','2017-10-05','2017-10-11',6,'sppd 52','Surabaya','sppd 52','sppd 52','Ir. Setiyono, M.Si','Balon Udara','3470.004.077','123.456-005','sppd 52 sppd 52','sppd 52 sppd 52 sppd 52 sppd 52','2017-11-11','2017-10-01',23),(53,6,'53.a/BTPAL/ST/10/2017','2017-08-01','2017-08-09',8,'Test','Jakarta Selatan','Test','Test','Ir. Setiyono, M.Si','Pesawat Terbang','3470.004.022','9843.001','TestTestTest','TestTestTest','2017-08-09','2017-10-01',23),(54,6,'54.a/BTPAL/ST/10/2017','2017-08-13','2017-08-19',6,'Test','Jakarta Barat','Test','Test','Ir. Setiyono, M.Si','Balon Udara','3470.004.011','524111','Test','TestTestTest','2017-08-16','2017-10-01',23),(55,6,'55.a/BTPAL/ST/10/2017','2017-08-20','2017-08-26',6,'Test','Jakarta Selatan','Test','Test','Ir. Setiyono, M.Si','Kendaraan Umum','3470.004.011','524112','Test','Test','2017-08-31','2017-10-01',23),(56,6,'56.a/BTPAL/ST/10/2017','2017-10-29','2017-11-04',6,'Test','Jakarta Selatan','Test','Test','Ir. Setiyono, M.Si','Kereta Api','3470.004.022','9843.001','Test','TestTest','2017-11-11','2017-10-01',23),(57,0,'57.a/BTPAL/ST/10/2017','2017-08-06','2017-10-29',84,'Test','Jakarta Utara','TestTest','TestTest','Ir. Setiyono, M.Si','Kendaraan Umum','3470.004.022','9843.002',NULL,NULL,NULL,NULL,NULL),(58,6,'58.a/BTPAL/ST/10/2017','2017-08-06','2017-08-27',21,'TestTest','Jakarta Barat','Test','Test','Ir. Setiyono, M.Si','Pesawat Terbang','3470.004.077','123.456-005','TestTestTest','TestTestTestTest','2017-08-31','2017-10-01',23),(59,6,'59.a/BTPAL/ST/10/2017','2017-07-01','2017-07-31',30,'TestTest','Surabaya','TestTest','TestTest','Ir. Setiyono, M.Si','Kereta Api','3470.004.011','524112','TestTestTest','TestTest','2017-08-30','2017-10-01',23),(60,6,'60.a/BTPAL/ST/10/2017','2017-06-01','2017-06-22',21,'TestTest','Cirebon','TestTest','Test','Ir. Setiyono, M.Si','Kereta Api','3470.004.011','524112','TestTestTest','TestTestTest','2017-08-01','2017-10-01',23),(61,0,'61.a/BTPAL/ST/10/2017','2017-05-01','2017-05-19',18,'TestTest','Bandung','TestTest','TestTest','Ir. Setiyono, M.Si','Kereta Api','3470.004.011','524112',NULL,NULL,NULL,NULL,NULL),(62,6,'62.a/BTPAL/ST/10/2017','2017-05-01','2017-05-27',26,'Test','Malang','Test','Test','Ir. Setiyono, M.Si','Pesawat Terbang','3470.004.077','123.456-002','TestTest','TestTest','2017-06-02','2017-10-01',23),(63,6,'63.a/BTPAL/ST/10/2017','2017-04-02','2017-04-22',20,'TestTest','Malang','TestTest','Test','Ir. Setiyono, M.Si','Pesawat Terbang','3470.004.077','123.456-001','TestTest','TestTestTest','2017-06-02','2017-10-01',23),(64,6,'64.a/BTPAL/ST/10/2017','2017-03-08','2017-03-24',16,'Test','Surabaya','Test','Test','Ir. Setiyono, M.Si','Pesawat Terbang','3470.004.011','524111','Test','Test','2017-03-30','2017-10-01',23),(65,6,'65.a/BTPAL/ST/10/2017','2017-02-14','2017-02-25',11,'Test','Cirebon','Test','Test','Ir. Setiyono, M.Si','Balon Udara','3470.004.011','524111','Test','Test','2017-02-20','2017-10-01',23),(66,6,'66.a/BTPAL/ST/10/2017','2017-01-03','2017-01-21',18,'Test','Surabaya','Test','Test','Ir. Setiyono, M.Si','Kendaraan Umum','3470.004.077','123.456-001','Test','Test','2017-01-28','2017-10-01',23),(67,4,'67.a/BTPAL/ST/10/2017','2017-10-03','2017-10-04',1,'Test','Jakarta Barat','asdf','asdf','Ir. Setiyono, M.Si','Kendaraan Umum','3470.004.011','524111',NULL,NULL,NULL,'2018-01-20',23),(68,0,'68.a/BTPAL/ST/10/2017','2017-12-12','2017-12-12',0,'Peraturan Kepala Badan Pengkajian dan Penerapan Teknologi, Nomor 018 tahun 2015. Tentang Organisasi dan Tata Kerja Balai Teknologi Pengolahan Air dan Limbah.','Cirebon','Pelatihan Website','Setelah menjalankan tugas yang bersangkutan melaporkan hasilnya kepada Kepala Balai Teknologi Pengolahan Air dan Limbah dalam kurun waktu 1 minggu.','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(71,0,'71.a/BTPAL/ST/10/2017','2017-12-10','2017-12-13',3,'Peraturan Kepala Badan Pengkajian dan Penerapan Teknologi, Nomor 018 tahun 2015. Tentang Organisasi dan Tata Kerja Balai Teknologi Pengolahan Air dan Limbah.','Surabaya','Pelatihan Website','Setelah menjalankan tugas yang bersangkutan melaporkan hasilnya kepada Kepala Balai Teknologi Pengolahan Air dan Limbah dalam kurun waktu 1 minggu.','','Pesawat Terbang','3470.004.051','52311',NULL,NULL,NULL,NULL,NULL),(72,6,'72.a/BTPAL/ST/10/2017','2017-12-12','2017-12-14',2,'Peraturan Kepala Badan Pengkajian dan Penerapan Teknologi, Nomor 018 tahun 2015. Tentang Organisasi dan Tata Kerja Balai Teknologi Pengolahan Air dan Limbah.','Pemalang','Pelatihan Harin Ini','Setelah menjalankan tugas yang bersangkutan melaporkan hasilnya kepada Kepala Balai Teknologi Pengolahan Air dan Limbah dalam kurun waktu 1 minggu.','','Kendaraan Umum','3470.004.051','52311','Pelatihan Harin Ini','Melaksanakan pada bulan 12','0000-00-00','2017-10-01',23),(73,6,'73.a/BTPAL/ST/10/2017','2017-12-13','2017-12-15',3,'Peraturan Kepala Badan Pengkajian dan Penerapan Teknologi, Nomor 018 tahun 2015. Tentang Organisasi dan Tata Kerja Balai Teknologi Pengolahan Air dan Limbah.','Purwokerto','Pelatihan Harin Ini PWt','Setelah menjalankan tugas yang bersangkutan melaporkan hasilnya kepada Kepala Balai Teknologi Pengolahan Air dan Limbah dalam kurun waktu 1 minggu.','','Kereta Api','3470.004.022','9843.002','Pelatihan Harin Ini PWt','Melaksanakan pada bulan 12 ya','0000-00-00','2017-10-01',23),(74,6,'74.a/BTPAL/ST/10/2017','2017-12-20','2017-12-22',3,'Peraturan Kepala Badan Pengkajian dan Penerapan Teknologi, Nomor 018 tahun 2015. Tentang Organisasi dan Tata Kerja Balai Teknologi Pengolahan Air dan Limbah.','Pemalang','Pulang Kampung','Setelah menjalankan tugas yang bersangkutan melaporkan hasilnya kepada Kepala Balai Teknologi Pengolahan Air dan Limbah dalam kurun waktu 1 minggu.','','Kendaraan Umum','3470.004.011','524111','Pulang Kampung','Melaksanakan pada bulan 12 yoiii','0000-00-00','2017-10-01',23),(75,0,'75.a/BTPAL/ST/10/2017','2018-01-01','2018-01-03',3,'Peraturan Kepala Badan Pengkajian dan Penerapan Teknologi, Nomor 018 tahun 2015. Tentang Organisasi dan Tata Kerja Balai Teknologi Pengolahan Air dan Limbah.','Bantul','Dinas Jogja','Setelah menjalankan tugas yang bersangkutan melaporkan hasilnya kepada Kepala Balai Teknologi Pengolahan Air dan Limbah dalam kurun waktu 1 minggu.','','Pesawat Terbang','3470.004.011','524112',NULL,NULL,NULL,NULL,NULL),(76,0,'76.a/BTPAL/ST/10/2017','2018-01-01','2018-01-03',3,'Peraturan Kepala Badan Pengkajian dan Penerapan Teknologi, Nomor 018 tahun 2015. Tentang Organisasi dan Tata Kerja Balai Teknologi Pengolahan Air dan Limbah.','Bantul','Ke Jogja','Setelah menjalankan tugas yang bersangkutan melaporkan hasilnya kepada Kepala Balai Teknologi Pengolahan Air dan Limbah dalam kurun waktu 1 minggu.','','Pesawat Terbang','3470.004.022','9843.001',NULL,NULL,NULL,NULL,NULL),(77,3,'77.a/BTPAL/ST/10/2017','2018-01-01','2018-01-03',3,'Peraturan Kepala Badan Pengkajian dan Penerapan Teknologi, Nomor 018 tahun 2015. Tentang Organisasi dan Tata Kerja Balai Teknologi Pengolahan Air dan Limbah.','Bantul','Ke Jogja','Setelah menjalankan tugas yang bersangkutan melaporkan hasilnya kepada Kepala Balai Teknologi Pengolahan Air dan Limbah dalam kurun waktu 1 minggu.','','Pesawat Terbang','3470.004.011','524111',NULL,NULL,NULL,NULL,NULL),(78,3,'78.a/BTPAL/ST/10/2017','2018-01-01','2018-01-03',3,'Peraturan Kepala Badan Pengkajian dan Penerapan Teknologi, Nomor 018 tahun 2015. Tentang Organisasi dan Tata Kerja Balai Teknologi Pengolahan Air dan Limbah.','Bantul','ddd','Setelah menjalankan tugas yang bersangkutan melaporkan hasilnya kepada Kepala Balai Teknologi Pengolahan Air dan Limbah dalam kurun waktu 1 minggu.','','Kendaraan Umum','3470.004.011','524111',NULL,NULL,NULL,NULL,NULL),(79,0,'79.a/BTPAL/ST/10/2017','2018-01-02','2018-01-05',4,'Peraturan Kepala Badan Pengkajian dan Penerapan Teknologi, Nomor 018 tahun 2015. Tentang Organisasi dan Tata Kerja Balai Teknologi Pengolahan Air dan Limbah.','Bandung','Ke Bandung','Setelah menjalankan tugas yang bersangkutan melaporkan hasilnya kepada Kepala Balai Teknologi Pengolahan Air dan Limbah dalam kurun waktu 1 minggu.','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(80,0,'80.a/BTPAL/ST/1/2018','2018-01-01','2018-01-04',4,'Peraturan Kepala Badan Pengkajian dan Penerapan Teknologi, Nomor 018 tahun 2015. Tentang Organisasi dan Tata Kerja Balai Teknologi Pengolahan Air dan Limbah.','Gunung Kidul','Jalan Jalan Aja','Setelah menjalankan tugas yang bersangkutan melaporkan hasilnya kepada Kepala Balai Teknologi Pengolahan Air dan Limbah dalam kurun waktu 1 minggu.','','Pesawat Terbang','3470.004.011','524111',NULL,NULL,NULL,NULL,NULL),(81,0,'81.a/BTPAL/ST/1/2018','2018-01-08','2018-01-10',3,'Peraturan Kepala Badan Pengkajian dan Penerapan Teknologi, Nomor 018 tahun 2015. Tentang Organisasi dan Tata Kerja Balai Teknologi Pengolahan Air dan Limbah.','Pekalongan','Apa aja','Setelah menjalankan tugas yang bersangkutan melaporkan hasilnya kepada Kepala Balai Teknologi Pengolahan Air dan Limbah dalam kurun waktu 1 minggu.','','Pesawat Terbang','3470.004.051','52311',NULL,NULL,NULL,NULL,NULL),(82,2,'82.a/BTPAL/ST/1/2018','2018-01-08','2018-01-10',3,'Peraturan Kepala Badan Pengkajian dan Penerapan Teknologi, Nomor 018 tahun 2015. Tentang Organisasi dan Tata Kerja Balai Teknologi Pengolahan Air dan Limbah.','Bandung','Ke Bandung naik kereta api','Setelah menjalankan tugas yang bersangkutan melaporkan hasilnya kepada Kepala Balai Teknologi Pengolahan Air dan Limbah dalam kurun waktu 1 minggu.','','Kereta Api','3470.004.051','52311',NULL,NULL,NULL,NULL,NULL),(83,4,'83.a/BTPAL/ST/1/2018','2018-01-02','2018-01-04',3,'Peraturan Kepala Badan Pengkajian dan Penerapan Teknologi, Nomor 018 tahun 2015. Tentang Organisasi dan Tata Kerja Balai Teknologi Pengolahan Air dan Limbah.','Bandung','Jalan jalan ke kota Bandung','Setelah menjalankan tugas yang bersangkutan melaporkan hasilnya kepada Kepala Balai Teknologi Pengolahan Air dan Limbah dalam kurun waktu 1 minggu.','','Kereta Api','3470.004.051','524111',NULL,NULL,NULL,'2018-01-20',23),(84,2,'84.a/BTPAL/ST/1/2018','2018-01-10','2018-01-12',3,'Peraturan Kepala Badan Pengkajian dan Penerapan Teknologi, Nomor 018 tahun 2015. Tentang Organisasi dan Tata Kerja Balai Teknologi Pengolahan Air dan Limbah.','Cirebon','Melakunan dinas ke Cirebon gan','Setelah menjalankan tugas yang bersangkutan melaporkan hasilnya kepada Kepala Balai Teknologi Pengolahan Air dan Limbah dalam kurun waktu 1 minggu.','Ir. Setiyono, M.Si','Kendaraan Umum','3470.004.002','524113',NULL,NULL,NULL,NULL,NULL),(85,1,'85.a/BTPAL/ST/1/2018','2018-01-10','2018-01-12',3,'Peraturan Kepala Badan Pengkajian dan Penerapan Teknologi, Nomor 018 tahun 2015. Tentang Organisasi dan Tata Kerja Balai Teknologi Pengolahan Air dan Limbah.','Bandung','Melakunan dinas ke Bandung gan','Setelah menjalankan tugas yang bersangkutan melaporkan hasilnya kepada Kepala Balai Teknologi Pengolahan Air dan Limbah dalam kurun waktu 1 minggu.','Ir. Setiyono, M.Si',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(86,5,'86.a/BTPAL/ST/1/2018','2018-01-15','2018-01-17',3,'Peraturan Kepala Badan Pengkajian dan Penerapan Teknologi, Nomor 018 tahun 2015. Tentang Organisasi dan Tata Kerja Balai Teknologi Pengolahan Air dan Limbah.','Gunung Kidul','Pelatihan Air Bersih di Lingkungan Kelurahan Apaya','Setelah menjalankan tugas yang bersangkutan melaporkan hasilnya kepada Kepala Balai Teknologi Pengolahan Air dan Limbah dalam kurun waktu 1 minggu.','Ir. Setiyono, M.Si','Pesawat Terbang','3470.004.051','524111',NULL,NULL,NULL,'2017-10-01',23),(87,6,'87.a/BTPAL/ST/1/2018','2018-01-17','2018-01-19',3,'Peraturan Kepala Badan Pengkajian dan Penerapan Teknologi, Nomor 018 tahun 2015. Tentang Organisasi dan Tata Kerja Balai Teknologi Pengolahan Air dan Limbah.','Cirebon','Tugas Ke Cirebon gan','Setelah menjalankan tugas yang bersangkutan melaporkan hasilnya kepada Kepala Balai Teknologi Pengolahan Air dan Limbah dalam kurun waktu 1 minggu.','Ir. Setiyono, M.Si','Kendaraan Umum','3470.004.051','521211','Tugas Ke Cirebon gan','Melakukan dinas ke Cirebon','0000-00-00','2017-10-01',23),(88,2,'88.a/BTPAL/ST/1/2018','2018-01-17','2018-01-19',3,'Peraturan Kepala Badan Pengkajian dan Penerapan Teknologi, Nomor 018 tahun 2015. Tentang Organisasi dan Tata Kerja Balai Teknologi Pengolahan Air dan Limbah.','Purwokerto','Pelatihan Alat Pemurnian Minyak','Setelah menjalankan tugas yang bersangkutan melaporkan hasilnya kepada Kepala Balai Teknologi Pengolahan Air dan Limbah dalam kurun waktu 1 minggu.','Ir. Setiyono, M.Si',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(89,6,'89.a/BTPAL/ST/1/2018','2018-01-15','2018-01-17',3,'Peraturan Kepala Badan Pengkajian dan Penerapan Teknologi, Nomor 018 tahun 2015. Tentang Organisasi dan Tata Kerja Balai Teknologi Pengolahan Air dan Limbah.','Pemalang','Tes Golongan 4A 10000','Setelah menjalankan tugas yang bersangkutan melaporkan hasilnya kepada Kepala Balai Teknologi Pengolahan Air dan Limbah dalam kurun waktu 1 minggu.','Ir. Setiyono, M.Si','Kereta Api','3470.004.051','524111','Tes Golongan 4A 10000','Melakkukan perjalanan','0000-00-00','2017-10-01',23),(90,3,'90.a/BTPAL/ST/1/2018','2018-01-16','2018-01-17',2,'Peraturan Kepala Badan Pengkajian dan Penerapan Teknologi, Nomor 018 tahun 2015. Tentang Organisasi dan Tata Kerja Balai Teknologi Pengolahan Air dan Limbah.','Bandung','Perjalanan dinas ke Bandung','Setelah menjalankan tugas yang bersangkutan melaporkan hasilnya kepada Kepala Balai Teknologi Pengolahan Air dan Limbah dalam kurun waktu 1 minggu.','Ir. Setiyono, M.Si','Kereta Api','3470.004.051','521211',NULL,NULL,NULL,NULL,NULL),(91,4,'91.a/BTPAL/ST/1/2018','2018-01-16','2018-01-18',3,'Peraturan Kepala Badan Pengkajian dan Penerapan Teknologi, Nomor 018 tahun 2015. Tentang Organisasi dan Tata Kerja Balai Teknologi Pengolahan Air dan Limbah.','Malang','Perjalanan dinas ke Malang','Setelah menjalankan tugas yang bersangkutan melaporkan hasilnya kepada Kepala Balai Teknologi Pengolahan Air dan Limbah dalam kurun waktu 1 minggu.','Ir. Setiyono, M.Si','Pesawat Terbang','3470.004.051','524111',NULL,NULL,NULL,'2017-10-01',23),(92,2,'92.a/BTPAL/ST/1/2018','2018-01-16','2018-01-19',4,'Peraturan Kepala Badan Pengkajian dan Penerapan Teknologi, Nomor 018 tahun 2015. Tentang Organisasi dan Tata Kerja Balai Teknologi Pengolahan Air dan Limbah.','Semarang','Tidur','Setelah menjalankan tugas yang bersangkutan melaporkan hasilnya kepada Kepala Balai Teknologi Pengolahan Air dan Limbah dalam kurun waktu 1 minggu.','Ir. Setiyono, M.Si',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sppd_officer`
--

LOCK TABLES `sppd_officer` WRITE;
/*!40000 ALTER TABLE `sppd_officer` DISABLE KEYS */;
INSERT INTO `sppd_officer` VALUES (42,'42/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',28,'Staff 1','333333333','2A','Staff','Ibu Bendahara','222222222','190000','190000','570000','570000','400000','1540000','Satu Juta Lima Ratus Empat Puluh Ribu Rupiah','1/BKK/BTPAL/BPPT/X/2017','2017','Non Dipa','Uraian kas 1'),(43,'43/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',28,'Staff 2','44444444','2A','Staff','Ibu Bendahara','222222222','190000','190000','570000','570000','400000','1540000','Satu Juta Lima Ratus Empat Puluh Ribu Rupiah','2/BKK/BTPAL/BPPT/X/2017','2017','Non Dipa','Uraian kas 1'),(44,'44/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',29,'Ir. Setiyono, M.Si','081123456','2D','Kepala Balai Teknologi','Ibu Bendahara','222222222','280000','280000','1960000','1960000','400000','4320000','Empat Juta Tiga Ratus Dua Puluh Ribu Rupiah','44/BKK/BTPAL/BPPT/X/2017','2017','Dipa','Uraian kas Tugas 29'),(45,'45/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',30,'Drs. Djoko Prasetyo','1952423432','2B','Pejabat Pembuat Komitmen','Ibu Bendahara','222222222','320000','320000','0','0','200000','200000','Dua Ratus Ribu Rupiah','45/BKK/BTPAL/BPPT/X/2017','2017','Dipa','Uraian kas'),(46,'46/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',30,'Staff 2','44444444','2A','Staff','Ibu Bendahara','222222222','310000','310000','0','0','200000','200000','Dua Ratus Ribu Rupiah','46/BKK/BTPAL/BPPT/X/2017','2017','Dipa','Uraian kas'),(47,'47/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',31,'Staff 1','333333333','2A','Staff','Ibu Bendahara','222222222','310000','310000','4340000','4340000','400000','9080000','Sembilan Juta Delapan Puluh Ribu Rupiah','47/BKK/BTPAL/BPPT/X/2017','2017','Dipa','Halo ini uraian dinasnya'),(48,'48/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',31,'Staff 2','44444444','2A','Staff','Ibu Bendahara','222222222','310000','310000','4340000','4340000','400000','9080000','Sembilan Juta Delapan Puluh Ribu Rupiah','48/BKK/BTPAL/BPPT/X/2017','2017','Dipa','Halo ini uraian dinasnya'),(49,'49/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',32,'Staff 1','333333333','2A','Staff','Ibu Bendahara','222222222','310000','310000','310000','310000','300000','920000','Sembilan Ratus Dua Puluh Ribu Rupiah','49/BKK/BTPAL/BPPT/X/2017','2017','Dipa','blalbla dafafsgdgd'),(50,'50/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',33,'Ir. Setiyono, M.Si','081123456','2D','Kepala Balai Teknologi','Ibu Bendahara','222222222','340000','340000','680000','680000','300000','1660000','Satu Juta Enam Ratus Enam Puluh Ribu Rupiah','50/BKK/BTPAL/BPPT/X/2017','2017','Non Dipa','SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84'),(51,'51/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',34,'Ir. Setiyono, M.Si','081123456','2D','Kepala Balai Teknologi','Ibu Bendahara','222222222','160000','160000','1120000','1120000','123111','2363111','Dua Juta Tiga Ratus Enam Puluh Tiga Ribu Seratus Sebelas Rupiah','51/BKK/BTPAL/BPPT/X/2017','2017','Dipa','Ini adalah kode pusat biaya dadadad'),(52,'52/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',34,'Drs. Djoko Prasetyo','1952423432','2B','Pejabat Pembuat Komitmen','Ibu Bendahara','222222222','140000','140000','980000','980000','123111','2083111','Dua Juta Delapan Puluh Tiga Ribu Seratus Sebelas Rupiah','52/BKK/BTPAL/BPPT/X/2017','2017','Dipa','Ini adalah kode pusat biaya dadadad'),(53,'53/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',34,'Ibu Bendahara','222222222','2C','Bendahara','Ibu Bendahara','222222222','150000','150000','1050000','1050000','123111','2223111','Dua Juta Dua Ratus Dua Puluh Tiga Ribu Seratus Sebelas Rupiah','53/BKK/BTPAL/BPPT/X/2017','2017','Dipa','Ini adalah kode pusat biaya dadadad'),(54,'54/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',34,'Staff 1','333333333','2A','Staff','Ibu Bendahara','222222222','130000','130000','910000','910000','123111','1943111','Satu Juta Sembilan Ratus Empat Puluh Tiga Ribu Seratus Sebelas Rupiah','54/BKK/BTPAL/BPPT/X/2017','2017','Dipa','Ini adalah kode pusat biaya dadadad'),(55,'55/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',34,'Staff 2','44444444','2A','Staff','Ibu Bendahara','222222222','130000','130000','910000','910000','123111','1943111','Satu Juta Sembilan Ratus Empat Puluh Tiga Ribu Seratus Sebelas Rupiah','55/BKK/BTPAL/BPPT/X/2017','2017','Dipa','Ini adalah kode pusat biaya dadadad'),(56,'56/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',35,'Staff 1','333333333','2A','Staff','Ibu Bendahara','222222222','130000','130000','3640000','3640000','2222222','9502222','Sembilan Juta Lima Ratus Dua Ribu Dua Ratus Dua Puluh Dua Rupiah','56/BKK/BTPAL/BPPT/X/2017','2017','Dipa','Tes Pada Bulan Desember'),(57,'57/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',35,'Staff 2','44444444','2A','Staff','Ibu Bendahara','222222222','130000','130000','3640000','3640000','2222222','9502222','Sembilan Juta Lima Ratus Dua Ribu Dua Ratus Dua Puluh Dua Rupiah','57/BKK/BTPAL/BPPT/X/2017','2017','Dipa','Tes Pada Bulan Desember'),(58,'58/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',36,'Ir. Setiyono, M.Si','081123456','2D','Kepala Balai Teknologi','Ibu Bendahara','222222222','160000','160000','320000','320000','2000000','2640000','Dua Juta Enam Ratus Empat Puluh Ribu Rupiah','58/BKK/BTPAL/BPPT/X/2017','2017','Dipa','Melakukan perjalanan dinas ke jakarta pada hari minggu kuturut ayah ke kota naik delman istimewa kududuk dimuka'),(59,'59/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',37,'Drs. Djoko Prasetyo','1952423432','2B','Pejabat Pembuat Komitmen',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'59/BKK/BTPAL/BPPT/X/2017','2017',NULL,NULL),(60,'60/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',38,'Ibu Bendahara','222222222','2C','Bendahara','Ibu Bendahara','222222222','270000','270000','540000','540000',NULL,NULL,NULL,'60/BKK/BTPAL/BPPT/X/2017','2017',NULL,NULL),(61,'61/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',39,'Staff 1','333333333','2A','Staff','Ibu Bendahara','222222222','190000','190000','190000','190000',NULL,NULL,NULL,'61/BKK/BTPAL/BPPT/X/2017','2017',NULL,NULL),(62,'62/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',40,'Ir. Setiyono, M.Si','081123456','2D','Kepala Balai Teknologi','Ibu Bendahara','222222222','160000','160000','320000','320000',NULL,NULL,NULL,'62/BKK/BTPAL/BPPT/X/2017','2017',NULL,NULL),(63,'63/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',40,'Ibu Bendahara','222222222','2C','Bendahara','Ibu Bendahara','222222222','150000','150000','300000','300000',NULL,NULL,NULL,'63/BKK/BTPAL/BPPT/X/2017','2017',NULL,NULL),(64,'64/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',40,'Staff 1','333333333','2A','Staff','Ibu Bendahara','222222222','130000','130000','260000','260000',NULL,NULL,NULL,'64/BKK/BTPAL/BPPT/X/2017','2017',NULL,NULL),(65,'65/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',40,'Staff 2','44444444','2A','Staff','Ibu Bendahara','222222222','130000','130000','260000','260000',NULL,NULL,NULL,'65/BKK/BTPAL/BPPT/X/2017','2017',NULL,NULL),(66,'66/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',41,'Staff 1','333333333','2A','Staff','Ibu Bendahara','222222222','190000','190000','570000','570000','400000','1540000','Satu Juta Lima Ratus Empat Puluh Ribu Rupiah','1/BKK/BTPAL/BPPT/X/2017','2017','Non Dipa','Uraian kas 1'),(67,'67/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',41,'Staff 2','44444444','2A','Staff','Ibu Bendahara','222222222','190000','190000','570000','570000','400000','1540000','Satu Juta Lima Ratus Empat Puluh Ribu Rupiah','2/BKK/BTPAL/BPPT/X/2017','2017','Non Dipa','Uraian kas 1'),(68,'68/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',42,'Staff 1','333333333','2A','Staff','Ibu Bendahara','222222222','190000','190000','570000','570000','400000','1540000','Satu Juta Lima Ratus Empat Puluh Ribu Rupiah','1/BKK/BTPAL/BPPT/X/2017','2017','Non Dipa','Uraian kas 1'),(69,'69/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',42,'Staff 2','44444444','2A','Staff','Ibu Bendahara','222222222','190000','190000','570000','570000','400000','1540000','Satu Juta Lima Ratus Empat Puluh Ribu Rupiah','2/BKK/BTPAL/BPPT/X/2017','2017','Non Dipa','Uraian kas 1'),(70,'70/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',43,'Staff 1','333333333','2A','Staff','Ibu Bendahara','222222222','190000','190000','570000','570000','400000','1540000','Satu Juta Lima Ratus Empat Puluh Ribu Rupiah','1/BKK/BTPAL/BPPT/X/2017','2017','Non Dipa','Uraian kas 1'),(71,'71/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',43,'Staff 2','44444444','2A','Staff','Ibu Bendahara','222222222','190000','190000','570000','570000','400000','1540000','Satu Juta Lima Ratus Empat Puluh Ribu Rupiah','2/BKK/BTPAL/BPPT/X/2017','2017','Non Dipa','Uraian kas 1'),(72,'72/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',44,'Staff 1','333333333','2A','Staff','Ibu Bendahara','222222222','190000','190000','570000','570000','400000','1540000','Satu Juta Lima Ratus Empat Puluh Ribu Rupiah','1/BKK/BTPAL/BPPT/X/2017','2017','Non Dipa','Uraian kas 1'),(73,'73/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',44,'Staff 2','44444444','2A','Staff','Ibu Bendahara','222222222','190000','190000','570000','570000','400000','1540000','Satu Juta Lima Ratus Empat Puluh Ribu Rupiah','2/BKK/BTPAL/BPPT/X/2017','2017','Non Dipa','Uraian kas 1'),(74,'74/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',45,'Staff 1','333333333','2A','Staff','Ibu Bendahara','222222222','190000','190000','570000','570000','400000','1540000','Satu Juta Lima Ratus Empat Puluh Ribu Rupiah','1/BKK/BTPAL/BPPT/X/2017','2017','Non Dipa','Uraian kas 1'),(75,'75/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',45,'Staff 2','44444444','2A','Staff','Ibu Bendahara','222222222','190000','190000','570000','570000','400000','1540000','Satu Juta Lima Ratus Empat Puluh Ribu Rupiah','2/BKK/BTPAL/BPPT/X/2017','2017','Non Dipa','Uraian kas 1'),(76,'76/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',46,'Staff 1','333333333','2A','Staff','Ibu Bendahara','222222222','190000','190000','570000','570000','400000','1540000','Satu Juta Lima Ratus Empat Puluh Ribu Rupiah','1/BKK/BTPAL/BPPT/X/2017','2017','Non Dipa','Uraian kas 1'),(77,'77/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',46,'Staff 2','44444444','2A','Staff','Ibu Bendahara','222222222','190000','190000','570000','570000','400000','1540000','Satu Juta Lima Ratus Empat Puluh Ribu Rupiah','2/BKK/BTPAL/BPPT/X/2017','2017','Non Dipa','Uraian kas 1'),(78,'78/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',47,'Staff 1','333333333','2A','Staff','Ibu Bendahara','222222222','190000','190000','570000','570000','400000','1540000','Satu Juta Lima Ratus Empat Puluh Ribu Rupiah','1/BKK/BTPAL/BPPT/X/2017','2017','Non Dipa','Uraian kas 1'),(79,'79/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',47,'Staff 2','44444444','2A','Staff','Ibu Bendahara','222222222','190000','190000','570000','570000','400000','1540000','Satu Juta Lima Ratus Empat Puluh Ribu Rupiah','2/BKK/BTPAL/BPPT/X/2017','2017','Non Dipa','Uraian kas 1'),(80,'80/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',48,'Ir. Setiyono, M.Si','081123456','2D','Kepala Balai Teknologi','Ibu Bendahara','222222222','280000','280000','1680000','1680000','333333','3693333','Tiga Juta Enam Ratus Sembilan Puluh Tiga Ribu Tiga Ratus Tiga Puluh Tiga Rupiah','80/BKK/BTPAL/BPPT/X/2017','2017','Dipa','SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84 SPPD 84'),(81,'81/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',49,'Ir. Setiyono, M.Si','081123456','2D','Kepala Balai Teknologi','Ibu Bendahara','222222222','160000','160000','320000','320000','1111111','1751111','Satu Juta Tujuh Ratus Lima Puluh Satu Ribu Seratus Sebelas Rupiah','81/BKK/BTPAL/BPPT/X/2017','2017','Non Dipa','sppd 49 sppd 49'),(82,'82/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',50,'Ibu Bendahara','222222222','2C','Bendahara','Ibu Bendahara','222222222','150000','150000','750000','750000','111111','1611111','Satu Juta Enam Ratus Sebelas Ribu Seratus Sebelas Rupiah','82/BKK/BTPAL/BPPT/X/2017','2017','Dipa','sppd 50 sppd 50 sppd 50'),(83,'83/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',50,'Ir. Setiyono, M.Si','081123456','2D','Kepala Balai Teknologi','Ibu Bendahara','222222222','160000','160000','800000','800000','111111','1711111','Satu Juta Tujuh Ratus Sebelas Ribu Seratus Sebelas Rupiah','83/BKK/BTPAL/BPPT/X/2017','2017','Dipa','sppd 50 sppd 50 sppd 50'),(84,'84/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',50,'Drs. Djoko Prasetyo','1952423432','2B','Pejabat Pembuat Komitmen','Ibu Bendahara','222222222','140000','140000','700000','700000','111111','1511111','Satu Juta Lima Ratus Sebelas Ribu Seratus Sebelas Rupiah','84/BKK/BTPAL/BPPT/X/2017','2017','Dipa','sppd 50 sppd 50 sppd 50'),(85,'85/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',51,'Staff 1','333333333','2A','Staff','Ibu Bendahara','222222222','250000','250000','1500000','1500000','123435','3123435','Tiga Juta Seratus Dua Puluh Tiga Ribu Empat Ratus Tiga Puluh Lima Rupiah','85/BKK/BTPAL/BPPT/X/2017','2017','Dipa','sppd 51 sppd 51 sppd 51 sppd 51 sppd 51 sppd 51'),(86,'86/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',51,'Ibu Bendahara','222222222','2C','Bendahara','Ibu Bendahara','222222222','270000','270000','1620000','1620000','123435','3363435','Tiga Juta Tiga Ratus Enam Puluh Tiga Ribu Empat Ratus Tiga Puluh Lima Rupiah','86/BKK/BTPAL/BPPT/X/2017','2017','Dipa','sppd 51 sppd 51 sppd 51 sppd 51 sppd 51 sppd 51'),(87,'87/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',52,'Staff 2','44444444','2A','Staff','Ibu Bendahara','222222222','310000','310000','1860000','1860000','2343134','6063134','Enam Juta Enam Puluh Tiga Ribu Seratus Tiga Puluh Empat Rupiah','87/BKK/BTPAL/BPPT/X/2017','2017','Dipa','sppd 52 sppd 52 sppd 52 sppd 52 sppd 52'),(88,'88/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',52,'Ir. Setiyono, M.Si','081123456','2D','Kepala Balai Teknologi','Ibu Bendahara','222222222','340000','340000','2040000','2040000','2343134','6423134','Enam Juta Empat Ratus Dua Puluh Tiga Ribu Seratus Tiga Puluh Empat Rupiah','88/BKK/BTPAL/BPPT/X/2017','2017','Dipa','sppd 52 sppd 52 sppd 52 sppd 52 sppd 52'),(89,'89/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',53,'Ir. Setiyono, M.Si','081123456','2D','Kepala Balai Teknologi','Ibu Bendahara','222222222','160000','160000','1280000','1280000','333333','2893333','Dua Juta Delapan Ratus Sembilan Puluh Tiga Ribu Tiga Ratus Tiga Puluh Tiga Rupiah','89/BKK/BTPAL/BPPT/X/2017','2017','Non Dipa','TestTest'),(90,'90/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',54,'Drs. Djoko Prasetyo','1952423432','2B','Pejabat Pembuat Komitmen','Ibu Bendahara','222222222','140000','140000','840000','840000','222222','1902222','Satu Juta Sembilan Ratus Dua Ribu Dua Ratus Dua Puluh Dua Rupiah','90/BKK/BTPAL/BPPT/X/2017','2017','Dipa','TestTestTest'),(91,'91/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',55,'Ibu Bendahara','222222222','2C','Bendahara','Ibu Bendahara','222222222','150000','150000','900000','900000','222222','2022222','Dua Juta Dua Puluh Dua Ribu Dua Ratus Dua Puluh Dua Rupiah','91/BKK/BTPAL/BPPT/X/2017','2017','Non Dipa','TestTestTest'),(92,'92/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',56,'Ibu Bendahara','222222222','2C','Bendahara','Ibu Bendahara','222222222','150000','150000','900000','900000','333333','2133333','Dua Juta Seratus Tiga Puluh Tiga Ribu Tiga Ratus Tiga Puluh Tiga Rupiah','92/BKK/BTPAL/BPPT/X/2017','2017','Dipa','TestTestTestTest'),(93,'93/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',56,'Staff 1','333333333','2A','Staff','Ibu Bendahara','222222222','130000','130000','780000','780000','333333','1893333','Satu Juta Delapan Ratus Sembilan Puluh Tiga Ribu Tiga Ratus Tiga Puluh Tiga Rupiah','93/BKK/BTPAL/BPPT/X/2017','2017','Dipa','TestTestTestTest'),(94,'94/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',56,'Staff 2','44444444','2A','Staff','Ibu Bendahara','222222222','130000','130000','780000','780000','333333','1893333','Satu Juta Delapan Ratus Sembilan Puluh Tiga Ribu Tiga Ratus Tiga Puluh Tiga Rupiah','94/BKK/BTPAL/BPPT/X/2017','2017','Dipa','TestTestTestTest'),(95,'95/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',57,'Staff 1','333333333','2A','Staff','Ibu Bendahara','222222222','130000','130000','10920000','10920000','1231231','23071231','Dua Puluh Tiga Juta Tujuh Puluh Satu Ribu Dua Ratus Tiga Puluh Satu Rupiah','95/BKK/BTPAL/BPPT/X/2017','2017','Dipa','Melaksanakan kegiatan dipa pada hari ini'),(96,'96/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',57,'Staff 2','44444444','2A','Staff','Ibu Bendahara','222222222','130000','130000','10920000','10920000','1231231','23071231','Dua Puluh Tiga Juta Tujuh Puluh Satu Ribu Dua Ratus Tiga Puluh Satu Rupiah','96/BKK/BTPAL/BPPT/X/2017','2017','Dipa','Melaksanakan kegiatan dipa pada hari ini'),(97,'97/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',58,'Staff 1','333333333','2A','Staff','Ibu Bendahara','222222222','130000','130000','2730000','2730000','333333','5793333','Lima Juta Tujuh Ratus Sembilan Puluh Tiga Ribu Tiga Ratus Tiga Puluh Tiga Rupiah','97/BKK/BTPAL/BPPT/X/2017','2017','Non Dipa','TestTestTestTest'),(98,'98/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',58,'Ir. Setiyono, M.Si','081123456','2D','Kepala Balai Teknologi','Ibu Bendahara','222222222','160000','160000','3360000','3360000','333333','7053333','Tujuh Juta Lima Puluh Tiga Ribu Tiga Ratus Tiga Puluh Tiga Rupiah','98/BKK/BTPAL/BPPT/X/2017','2017','Non Dipa','TestTestTestTest'),(99,'99/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',59,'Ir. Setiyono, M.Si','081123456','2D','Kepala Balai Teknologi','Ibu Bendahara','222222222','340000','340000','10200000','10200000','3333333','23733333','Dua Puluh Tiga Juta Tujuh Ratus Tiga Puluh Tiga Ribu Tiga Ratus Tiga Puluh Tiga Rupiah','99/BKK/BTPAL/BPPT/X/2017','2017','Dipa','TestTest'),(100,'100/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',59,'Drs. Djoko Prasetyo','1952423432','2B','Pejabat Pembuat Komitmen','Ibu Bendahara','222222222','320000','320000','9600000','9600000','3333333','22533333','Dua Puluh Dua Juta Lima Ratus Tiga Puluh Tiga Ribu Tiga Ratus Tiga Puluh Tiga Rupiah','100/BKK/BTPAL/BPPT/X/2017','2017','Dipa','TestTest'),(101,'101/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',59,'Ibu Bendahara','222222222','2C','Bendahara','Ibu Bendahara','222222222','330000','330000','9900000','9900000','3333333','23133333','Dua Puluh Tiga Juta Seratus Tiga Puluh Tiga Ribu Tiga Ratus Tiga Puluh Tiga Rupiah','101/BKK/BTPAL/BPPT/X/2017','2017','Dipa','TestTest'),(102,'102/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',59,'Staff 1','333333333','2A','Staff','Ibu Bendahara','222222222','310000','310000','9300000','9300000','3333333','21933333','Dua Puluh Satu Juta Sembilan Ratus Tiga Puluh Tiga Ribu Tiga Ratus Tiga Puluh Tiga Rupiah','102/BKK/BTPAL/BPPT/X/2017','2017','Dipa','TestTest'),(103,'103/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',59,'Staff 2','44444444','2A','Staff','Ibu Bendahara','222222222','310000','310000','9300000','9300000','3333333','21933333','Dua Puluh Satu Juta Sembilan Ratus Tiga Puluh Tiga Ribu Tiga Ratus Tiga Puluh Tiga Rupiah','103/BKK/BTPAL/BPPT/X/2017','2017','Dipa','TestTest'),(104,'104/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',60,'Ibu Bendahara','222222222','2C','Bendahara','Ibu Bendahara','222222222','210000','210000','4410000','4410000','333333','9153333','Sembilan Juta Seratus Lima Puluh Tiga Ribu Tiga Ratus Tiga Puluh Tiga Rupiah','104/BKK/BTPAL/BPPT/X/2017','2017','Dipa','TestTestTestTest'),(105,'105/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',61,'Ir. Setiyono, M.Si','081123456','2D','Kepala Balai Teknologi','Ibu Bendahara','222222222','220000','220000','3960000','3960000',NULL,NULL,NULL,'105/BKK/BTPAL/BPPT/X/2017','2017',NULL,NULL),(106,'106/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',61,'Staff 2','44444444','2A','Staff','Ibu Bendahara','222222222','190000','190000','3420000','3420000',NULL,NULL,NULL,'106/BKK/BTPAL/BPPT/X/2017','2017',NULL,NULL),(107,'107/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',61,'Drs. Djoko Prasetyo','1952423432','2B','Pejabat Pembuat Komitmen','Ibu Bendahara','222222222','200000','200000','3600000','3600000',NULL,NULL,NULL,'107/BKK/BTPAL/BPPT/X/2017','2017',NULL,NULL),(108,'108/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',61,'Ibu Bendahara','222222222','2C','Bendahara','Ibu Bendahara','222222222','210000','210000','3780000','3780000',NULL,NULL,NULL,'108/BKK/BTPAL/BPPT/X/2017','2017',NULL,NULL),(109,'109/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',61,'Staff 1','333333333','2A','Staff','Ibu Bendahara','222222222','190000','190000','3420000','3420000',NULL,NULL,NULL,'109/BKK/BTPAL/BPPT/X/2017','2017',NULL,NULL),(110,'110/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',62,'Ibu Bendahara','222222222','2C','Bendahara','Ibu Bendahara','222222222','330000','330000','8580000','8580000','333333','17493333','Tujuh Belas Juta Empat Ratus Sembilan Puluh Tiga Ribu Tiga Ratus Tiga Puluh Tiga Rupiah','110/BKK/BTPAL/BPPT/X/2017','2017','Dipa','TestTest'),(111,'111/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',62,'Drs. Djoko Prasetyo','1952423432','2B','Pejabat Pembuat Komitmen','Ibu Bendahara','222222222','320000','320000','8320000','8320000','333333','16973333','Enam Belas Juta Sembilan Ratus Tujuh Puluh Tiga Ribu Tiga Ratus Tiga Puluh Tiga Rupiah','111/BKK/BTPAL/BPPT/X/2017','2017','Dipa','TestTest'),(112,'112/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',63,'Staff 1','333333333','2A','Staff','Ibu Bendahara','222222222','310000','310000','6200000','6200000','123444','12523444','Dua Belas Juta Lima Ratus Dua Puluh Tiga Ribu Empat Ratus Empat Puluh Empat Rupiah','112/BKK/BTPAL/BPPT/X/2017','2017','Non Dipa','TestTest'),(113,'113/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',63,'Staff 2','44444444','2A','Staff','Ibu Bendahara','222222222','310000','310000','6200000','6200000','123444','12523444','Dua Belas Juta Lima Ratus Dua Puluh Tiga Ribu Empat Ratus Empat Puluh Empat Rupiah','113/BKK/BTPAL/BPPT/X/2017','2017','Non Dipa','TestTest'),(114,'114/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',63,'Ir. Setiyono, M.Si','081123456','2D','Kepala Balai Teknologi','Ibu Bendahara','222222222','340000','340000','6800000','6800000','123444','13723444','Tiga Belas Juta Tujuh Ratus Dua Puluh Tiga Ribu Empat Ratus Empat Puluh Empat Rupiah','114/BKK/BTPAL/BPPT/X/2017','2017','Non Dipa','TestTest'),(115,'115/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',64,'Ir. Setiyono, M.Si','081123456','2D','Kepala Balai Teknologi','Ibu Bendahara','222222222','340000','340000','5440000','5440000','555666','11435666','Sebelas Juta Empat Ratus Tiga Puluh Lima Ribu Enam Ratus Enam Puluh Enam Rupiah','115/BKK/BTPAL/BPPT/X/2017','2017','Non Dipa','TestTestTest'),(116,'116/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',65,'Ir. Setiyono, M.Si','081123456','2D','Kepala Balai Teknologi','Ibu Bendahara','222222222','220000','220000','2420000','2420000','444333','5284333','Lima Juta Dua Ratus Delapan Puluh Empat Ribu Tiga Ratus Tiga Puluh Tiga Rupiah','116/BKK/BTPAL/BPPT/X/2017','2017','Non Dipa','TestTestTest'),(117,'117/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',65,'Staff 2','44444444','2A','Staff','Ibu Bendahara','222222222','190000','190000','2090000','2090000','444333','4624333','Empat Juta Enam Ratus Dua Puluh Empat Ribu Tiga Ratus Tiga Puluh Tiga Rupiah','117/BKK/BTPAL/BPPT/X/2017','2017','Non Dipa','TestTestTest'),(118,'118/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',66,'Drs. Djoko Prasetyo','1952423432','2B','Pejabat Pembuat Komitmen','Ibu Bendahara','222222222','320000','320000','5760000','5760000','123666','11643666','Sebelas Juta Enam Ratus Empat Puluh Tiga Ribu Enam Ratus Enam Puluh Enam Rupiah','118/BKK/BTPAL/BPPT/X/2017','2017','Dipa','Test'),(119,'119/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',67,'Ir. Setiyono, M.Si','081123456','2D','Kepala Balai Teknologi','Ibu Bendahara','222222222','160000','160000','160000','160000','1000000','1320000','Satu Juta Tiga Ratus Dua Puluh Ribu Rupiah','119/BKK/BTPAL/BPPT/X/2017','2017',NULL,NULL),(120,'120/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',68,'Rendi Handika, A.Md','198809072014021004','2C','Staff Pelayanan Jasa dan Teknologi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'120/BKK/BTPAL/BPPT/X/2017','2017',NULL,NULL),(132,'129/SPD/BTPAL/X/2017','','',71,'Drs. Djoko Prasetyo','1952423432','','','Ibu Bendahara','222222222','','','','',NULL,NULL,NULL,'129/BKK/BTPAL/BPPT/X/2017','2017',NULL,NULL),(133,'133/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',72,'Ir. Setiyono, M.Si','081123456','2D','Balai Teknologi Pengolahan Air dan Limbah','Ibu Bendahara','222222222','280000','280000','560000','280000','560000','1400000','Satu Juta Empat Ratus Ribu Rupiah','133/BKK/BTPAL/BPPT/X/2017','2017','Dipa','Melaksanakan pada bulan Desember'),(134,'134/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',72,'Rendi Handika, A.Md','198809072014021004','2C','Staff Pelayanan Jasa dan Teknologi','Ibu Bendahara','222222222','270000','270000','540000','270000','560000','1370000','Satu Juta Tiga Ratus Tujuh Puluh Ribu Rupiah','134/BKK/BTPAL/BPPT/X/2017','2017','Dipa','Melaksanakan pada bulan Desember'),(135,'135/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',73,'Rendi Handika, A.Md','198809072014021004','2C','Staff Pelayanan Jasa dan Teknologi','Ibu Bendahara','222222222','270000','270000','810000','540000','450000','1800000','Satu Juta Delapan Ratus Ribu Rupiah','135/BKK/BTPAL/BPPT/X/2017','2017','Dipa','Melaksanakan pada bulan 12 ya'),(136,'136/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',74,'Rendi Handika, A.Md','198809072014021004','2C','Staff Pelayanan Jasa dan Teknologi','Ibu Bendahara','222222222','270000','270000','810000','540000','250000','1600000','Satu Juta Enam Ratus Ribu Rupiah','136/BKK/BTPAL/BPPT/X/2017','2017','Dipa','Melaksanakan pada bulan 12 yoi'),(138,'137/SPD/BTPAL/X/2017','','',75,'Rendi Handika, A.Md','198809072014021004','','','Ibu Bendahara','222222222','','','','',NULL,NULL,NULL,'137/BKK/BTPAL/BPPT/X/2017','2017',NULL,NULL),(139,'138/SPD/BTPAL/X/2017','','',75,'Yosep Widi Nugraha, ST','198509012014021001','3A','Staff Administrasi','','','','','','',NULL,NULL,NULL,'138/BKK/BTPAL/BPPT/X/2017','2017',NULL,NULL),(140,'140/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',76,'Rendi Handika, A.Md','198809072014021004','2C','Staff Pelayanan Jasa dan Teknologi','Ibu Bendahara','222222222','420000','420000','840000','840000','580000','2260000','Dua Juta Dua Ratus Enam Puluh Ribu Rupiah','140/BKK/BTPAL/BPPT/X/2017','2017',NULL,NULL),(141,'141/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',77,'Rendi Handika, A.Md','198809072014021004','2C','Staff Pelayanan Jasa dan Teknologi','Ibu Bendahara','222222222','420000','420000','840000','840000','120000','1800000','Satu Juta Delapan Ratus Ribu Rupiah','141/BKK/BTPAL/BPPT/X/2017','2017',NULL,NULL),(142,'142/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',78,'Ir. Setiyono, M.Si','081123456','2D','Balai Teknologi Pengolahan Air dan Limbah','Ibu Bendahara','222222222','420000','420000','1260000','840000','580000','2680000','Dua Juta Enam Ratus Delapan Puluh Ribu Rupiah','142/BKK/BTPAL/BPPT/X/2017','2017',NULL,NULL),(143,'143/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',79,'Ir. Setiyono, M.Si','081123456','2D','Balai Teknologi Pengolahan Air dan Limbah',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'143/BKK/BTPAL/BPPT/X/2017','2017',NULL,NULL),(144,'144/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',79,'Rendi Handika, A.Md','198809072014021004','2C','Staff Pelayanan Jasa dan Teknologi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'144/BKK/BTPAL/BPPT/X/2017','2017',NULL,NULL),(145,'145/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',79,'Yosep Widi Nugraha, ST','198509012014021001','3A','Staff Administrasi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'145/BKK/BTPAL/BPPT/X/2017','2017',NULL,NULL),(146,'146/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',80,'Insan Nur Sulistiawan, ST','198702102009011004','3A','Staff Pelayanan Jasa dan Teknologi','Ibu Bendahara','222222222','480000','480000','1920000','1440000',NULL,NULL,NULL,'146/BKK/BTPAL/BPPT/X/2017','2017',NULL,NULL),(147,'147/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',80,'Rendi Handika, A.Md','198809072014021004','2C','Staff Pelayanan Jasa dan Teknologi','Ibu Bendahara','222222222','420000','420000','1680000','1260000',NULL,NULL,NULL,'147/BKK/BTPAL/BPPT/X/2017','2017',NULL,NULL),(148,'148/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',81,'Rendi Handika, A.Md','198809072014021004','2C','Staff Pelayanan Jasa dan Teknologi','Ibu Bendahara','222222222','270000','270000','810000','540000',NULL,NULL,NULL,'148/BKK/BTPAL/BPPT/X/2017','2017',NULL,NULL),(149,'149/SPD/BTPAL/X/2017','Drs. Djoko Prasetyo','1952423432',81,'Drs. Djoko Prasetyo','1952423432','3B','Pejabat Pembuat Komitmen','Ibu Bendahara','222222222','320000','320000','960000','640000',NULL,NULL,NULL,'149/BKK/BTPAL/BPPT/X/2017','2017',NULL,NULL),(150,'150/SPD/BTPAL/I/2018','Drs. Djoko Prasetyo','1952423432',82,'Rendi Handika, A.Md','198809072014021004','2C','Staff Pelayanan Jasa dan Teknologi','Ibu Bendahara','222222222','210000','210000','630000','420000',NULL,NULL,NULL,'150/BKK/BTPAL/BPPT/I/2018','2017',NULL,NULL),(151,'151/SPD/BTPAL/I/2018','Drs. Djoko Prasetyo','1952423432',83,'Rendi Handika, A.Md','198809072014021004','2C','Staff Pelayanan Jasa dan Teknologi','Nurlela, SE, M.Ak','222222222','210000','210000','630000','420000','200000','1250000','Satu Juta Dua Ratus Lima Puluh Ribu Rupiah','151/BKK/BTPAL/BPPT/I/2018','2017',NULL,NULL),(152,'152/SPD/BTPAL/I/2018','Drs. Djoko Prasetyo','1952423432',83,'Yosep Widi Nugraha, ST','198509012014021001','3A','Staff Administrasi','Nurlela, SE, M.Ak','222222222','380000','380000','1140000','760000','200000','2100000','Dua Juta Seratus Ribu Rupiah','152/BKK/BTPAL/BPPT/I/2018','2017',NULL,NULL),(153,'153/SPD/BTPAL/I/2018','Drs. Djoko Prasetyo','1952423432',84,'Yosep Widi Nugraha, ST','198509012014021001','3A','Staff Administrasi','Nurlela, SE, M.Ak','222222222','380000','380000','1140000','760000',NULL,NULL,NULL,'153/BKK/BTPAL/BPPT/I/2018','2017',NULL,NULL),(154,'154/SPD/BTPAL/I/2018','Drs. Djoko Prasetyo','1952423432',84,'Rendi Handika, A.Md','198809072014021004','2C','Staff Pelayanan Jasa dan Teknologi','Nurlela, SE, M.Ak','222222222','210000','210000','630000','420000',NULL,NULL,NULL,'154/BKK/BTPAL/BPPT/I/2018','2017',NULL,NULL),(155,'155/SPD/BTPAL/I/2018','Drs. Djoko Prasetyo','1952423432',85,'Rendi Handika, A.Md','198809072014021004','2C','Staff Pelayanan Jasa dan Teknologi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'155/BKK/BTPAL/BPPT/I/2018','2017',NULL,NULL),(156,'156/SPD/BTPAL/I/2018','Drs. Djoko Prasetyo','1952423432',85,'Drs. Djoko Prasetyo','1952423432','3B','Pejabat Pembuat Komitmen',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'156/BKK/BTPAL/BPPT/I/2018','2017',NULL,NULL),(157,'157/SPD/BTPAL/I/2018','Drs. Djoko Prasetyo','1952423432',86,'Insan Nur Sulistiawan, ST','198702102009011004','3A','Staff Pelayanan Jasa dan Teknologi','Nurlela, SE, M.Ak','222222222','480000','480000','1440000','960000','500000','2900000','Dua Juta Sembilan Ratus Ribu Rupiah','157/BKK/BTPAL/BPPT/I/2018','2017','DIPA','Tes aja'),(158,'158/SPD/BTPAL/I/2018','Drs. Djoko Prasetyo','1952423432',87,'Rendi Handika, A.Md','198809072014021004','2C','Staff Pelayanan Jasa dan Teknologi','Nurlela, SE, M.Ak','222222222','210000','210000','630000','420000','500000','1550000','Satu Juta Lima Ratus Lima Puluh Ribu Rupiah','158/BKK/BTPAL/BPPT/I/2018','2017','DIPA','Tes aja gan'),(159,'159/SPD/BTPAL/I/2018','Drs. Djoko Prasetyo','1952423432',88,'Ajeng Triana, A.Md','333333333','2C','Staff Pengembangan Perlindungan Lingkungan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'159/BKK/BTPAL/BPPT/I/2018','2017',NULL,NULL),(160,'160/SPD/BTPAL/I/2018','Drs. Djoko Prasetyo','1952423432',88,'Tia Agustiani, S.Si','44444444','3A','Staff Pengembangan Perlindungan Lingkungan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'160/BKK/BTPAL/BPPT/I/2018','2017',NULL,NULL),(161,'161/SPD/BTPAL/I/2018','Drs. Djoko Prasetyo','1952423432',89,'Tes Golongan 4A','44444444','4A','Staff Pengembangan Perlindungan Lingkungan','Nurlela, SE, M.Ak','222222222','10000','10000','30000','20000','100000','150000','Seratus Lima Puluh Ribu Rupiah','161/BKK/BTPAL/BPPT/I/2018','2017','DIPA','Ini adalah gol 4'),(162,'162/SPD/BTPAL/I/2018','Drs. Djoko Prasetyo','1952423432',90,'Yosep Widi Nugraha, ST','198509012014021001','3A','Petugas Administrasi','Nurlela, SE, M.Ak','222222222','380000','380000','760000','380000',NULL,NULL,NULL,'162/BKK/BTPAL/BPPT/I/2018','2017',NULL,NULL),(163,'163/SPD/BTPAL/I/2018','Drs. Djoko Prasetyo','1952423432',91,'Ajeng Triana, A.Md','333333333','2C','Staff Pengembangan Perlindungan Lingkungan','Nurlela, SE, M.Ak','222222222','330000','330000','990000','660000','1000000','2650000','Dua Juta Enam Ratus Lima Puluh Ribu Rupiah','163/BKK/BTPAL/BPPT/I/2018','2017','DIPA','Halodada'),(164,'164/SPD/BTPAL/I/2018','Drs. Djoko Prasetyo','1952423432',91,'Tia Agustiani, S.Si','44444444','3A','Staff Pengembangan Perlindungan Lingkungan','Nurlela, SE, M.Ak','222222222','320000','320000','960000','640000','1000000','2600000','Dua Juta Enam Ratus Ribu Rupiah','164/BKK/BTPAL/BPPT/I/2018','2017','DIPA','Halodada'),(165,'165/SPD/BTPAL/I/2018','Drs. Djoko Prasetyo','1952423432',92,'Ir. Setiyono, M.Si','081123456','3D','Kepala Balai Teknologi Pengolahan Air dan Limbah',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'165/BKK/BTPAL/BPPT/I/2018','2017',NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transport`
--

LOCK TABLES `transport` WRITE;
/*!40000 ALTER TABLE `transport` DISABLE KEYS */;
INSERT INTO `transport` VALUES (1,'Kendaraan Umum'),(3,'Kereta Api'),(4,'Pesawat Terbang');
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
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travel_expenses`
--

LOCK TABLES `travel_expenses` WRITE;
/*!40000 ALTER TABLE `travel_expenses` DISABLE KEYS */;
INSERT INTO `travel_expenses` VALUES (7,2,6,125000,125000),(8,3,6,130000,130000),(9,4,6,140000,140000),(10,5,6,150000,150000),(11,6,6,160000,160000),(12,2,2,180000,180000),(13,3,2,190000,190000),(14,4,2,200000,200000),(15,5,2,210000,210000),(16,6,2,220000,220000),(18,2,4,240000,240000),(19,3,4,250000,250000),(20,4,4,260001,260000),(21,5,4,270000,270000),(22,6,4,280000,280000),(24,2,5,300000,300000),(25,3,5,310000,310000),(26,4,5,320000,320000),(27,5,5,330000,330000),(28,6,5,340000,340000),(29,2,7,380000,380000),(30,3,7,380000,380000),(31,4,7,420000,420000),(32,5,7,420000,420000),(33,6,7,420000,420000),(34,7,7,480000,480000),(35,8,7,480000,480000),(36,9,7,480000,480000),(37,10,7,480000,480000),(38,7,6,430000,430000),(39,8,6,430000,430000),(40,9,6,430000,430000),(41,10,6,450000,450000),(42,7,2,380000,380000),(43,8,2,380000,380000),(44,9,2,380000,380000),(45,10,2,420000,420000),(46,7,4,320000,320000),(47,8,4,320000,320000),(48,9,4,320000,320000),(49,10,4,320000,320000),(50,7,5,320000,320000),(51,8,5,320000,320000),(52,9,5,320000,320000),(53,10,5,320000,320000),(54,11,6,10000,10000),(55,11,2,10000,10000),(56,11,4,10000,10000),(57,11,5,10000,10000),(58,11,7,10000,10000);
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

-- Dump completed on 2018-01-21 12:51:44
