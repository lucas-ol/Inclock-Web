CREATE DATABASE  IF NOT EXISTS `inclock` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `inclock`;
-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: inclock
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `avisos`
--

DROP TABLE IF EXISTS `avisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `avisos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) DEFAULT NULL,
  `conteudo` varchar(300) DEFAULT NULL,
  `imagem` varchar(200) DEFAULT NULL,
  `data_noticia` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avisos`
--

LOCK TABLES `avisos` WRITE;
/*!40000 ALTER TABLE `avisos` DISABLE KEYS */;
INSERT INTO `avisos` VALUES (1,'','','02.jpg','2018-05-02 01:04:04');
/*!40000 ALTER TABLE `avisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cargo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=965 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
INSERT INTO `cargo` VALUES (3,'Desenvolvedor'),(964,'schandule');
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expediente`
--

DROP TABLE IF EXISTS `expediente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `expediente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `expediente_id` int(11) NOT NULL,
  `hora` time DEFAULT NULL,
  `diasemana` int(11) NOT NULL,
  `periodo` int(11) NOT NULL,
  `type_point` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK_expediente_id` (`expediente_id`),
  CONSTRAINT `FK_expediente_id` FOREIGN KEY (`expediente_id`) REFERENCES `expediente_id` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expediente`
--

LOCK TABLES `expediente` WRITE;
/*!40000 ALTER TABLE `expediente` DISABLE KEYS */;
INSERT INTO `expediente` VALUES (50,38,'13:00:00',3,1,'E'),(51,38,'22:00:00',3,3,'S'),(88,57,'12:00:00',5,4,'E'),(89,57,'01:00:00',5,4,'S'),(90,58,'10:15:00',1,1,'E'),(91,58,'14:00:00',1,2,'S'),(94,60,'00:00:00',2,3,'E'),(95,60,'01:00:00',2,3,'S'),(96,61,'01:00:00',5,3,'E'),(97,61,'06:00:00',5,1,'S'),(98,62,'15:00:00',2,2,'E'),(99,62,'23:00:00',2,3,'S'),(100,63,'17:00:00',4,2,'E'),(101,63,'22:00:00',4,3,'S');
/*!40000 ALTER TABLE `expediente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expediente_id`
--

DROP TABLE IF EXISTS `expediente_id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `expediente_id` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `funcionario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_expediente_funcionarios` (`funcionario_id`),
  CONSTRAINT `FK_expediente_funcionarios` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expediente_id`
--

LOCK TABLES `expediente_id` WRITE;
/*!40000 ALTER TABLE `expediente_id` DISABLE KEYS */;
INSERT INTO `expediente_id` VALUES (38,5),(57,5),(58,5),(60,5),(61,7),(62,7),(63,7);
/*!40000 ALTER TABLE `expediente_id` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionarios`
--

DROP TABLE IF EXISTS `funcionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `funcionarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `telefone` varchar(16) DEFAULT NULL,
  `celular` varchar(17) NOT NULL,
  `email` varchar(50) NOT NULL,
  `endereco` varchar(50) NOT NULL,
  `cpf` varchar(15) NOT NULL,
  `cargo_id` int(11) NOT NULL,
  `nascimento` date NOT NULL,
  `sexo` char(2) NOT NULL,
  `cidade` varchar(30) NOT NULL,
  `estado` char(2) NOT NULL,
  `cep` varchar(15) NOT NULL,
  `numero` varchar(5) NOT NULL,
  `bairro` varchar(45) DEFAULT NULL,
  `rg` varchar(14) NOT NULL,
  `senha` varchar(8) NOT NULL,
  `login` varchar(15) NOT NULL,
  `role` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cpf_UNIQUE` (`cpf`),
  UNIQUE KEY `login_UNIQUE` (`login`),
  UNIQUE KEY `rg_UNIQUE` (`rg`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `FK_Funcionarios_Cargos` (`cargo_id`),
  CONSTRAINT `FK_Funcionarios_Cargos` FOREIGN KEY (`cargo_id`) REFERENCES `cargo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionarios`
--

LOCK TABLES `funcionarios` WRITE;
/*!40000 ALTER TABLE `funcionarios` DISABLE KEYS */;
INSERT INTO `funcionarios` VALUES (5,'Lucas ','(17) 7711-1111','(17) 77711-1111','blublucas@gmail.com','Rua Vera Lúcia Pinto da Silva','177.711.111-11',3,'1996-10-10','M','Suzano','SP','08690215','90809','Cidade Miguel Badra','11.111.111-1','123','123','ADM;FUNC'),(7,'Josénildo Ferraz','(11) 1111-1111','(11) 11111-1111','oliveiramelo1996@gmail.com','Rua Vera Lúcia Pinto da Silva','222.222.222-22',3,'2008-03-14','M','Suzano','SP','08690215','1111','Cidade Miguel Badra','37.959.520-1','1234','1234','FUNC');
/*!40000 ALTER TABLE `funcionarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_codes`
--

DROP TABLE IF EXISTS `log_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `log_codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code_qr` varchar(25) NOT NULL,
  `expirado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_codes`
--

LOCK TABLES `log_codes` WRITE;
/*!40000 ALTER TABLE `log_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pontos`
--

DROP TABLE IF EXISTS `pontos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pontos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `funcionario_id` int(11) DEFAULT NULL,
  `expediente_id` int(11) DEFAULT NULL,
  `entrada` varchar(8) DEFAULT NULL,
  `saida` varchar(8) DEFAULT NULL,
  `dta_entrada` date NOT NULL,
  `dta_saida` date NOT NULL,
  `obs` text,
  PRIMARY KEY (`id`),
  KEY `FK_Funcionarios_Pontos` (`funcionario_id`),
  KEY `FK_expediente_pontos` (`expediente_id`),
  CONSTRAINT `FK_Funcionarios_Pontos` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_expediente_pontos` FOREIGN KEY (`expediente_id`) REFERENCES `expediente_id` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=690 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pontos`
--

LOCK TABLES `pontos` WRITE;
/*!40000 ALTER TABLE `pontos` DISABLE KEYS */;
INSERT INTO `pontos` VALUES (156,5,58,'','','2018-10-14','2018-10-14',NULL),(157,5,58,'','','2018-10-21','2018-10-21',NULL),(158,5,58,'','','2018-10-28','2018-10-28',NULL),(159,5,60,'','','2018-10-01','2018-10-01',NULL),(160,5,60,'','','2018-10-08','2018-10-08',NULL),(161,5,60,'','','2018-10-15','2018-10-15',NULL),(162,5,60,'','','2018-10-22','2018-10-22',NULL),(163,5,60,'','','2018-10-29','2018-10-29',NULL),(164,5,38,'','','2018-10-02','2018-10-02',NULL),(165,5,38,'','','2018-10-04','2018-10-04',NULL),(166,5,38,'','','2018-10-09','2018-10-09',NULL),(167,5,38,'','','2018-10-11','2018-10-11',NULL),(168,5,38,'','','2018-10-16','2018-10-16',NULL),(169,5,38,'','','2018-10-18','2018-10-18',NULL),(170,5,38,'','','2018-10-23','2018-10-23',NULL),(171,5,38,'','','2018-10-25','2018-10-25',NULL),(172,5,38,'','','2018-10-30','2018-10-30',NULL),(173,7,62,'','','2018-10-01','2018-10-01',NULL),(174,7,62,'','','2018-10-08','2018-10-08',NULL),(175,7,62,'','','2018-10-15','2018-10-15',NULL),(176,7,62,'','','2018-10-22','2018-10-22',NULL),(177,7,62,'','','2018-10-29','2018-10-29',NULL),(178,7,63,'','','2018-10-03','2018-10-03',NULL),(179,7,63,'','','2018-10-10','2018-10-10',NULL),(180,7,63,'','','2018-10-17','2018-10-17',NULL),(181,7,63,'','','2018-10-24','2018-10-24',NULL),(182,7,63,'','','2018-10-31','2018-10-31',NULL),(183,5,58,'','','2018-10-07','2018-10-07',NULL),(184,5,58,'','','2018-10-14','2018-10-14',NULL),(185,5,58,'','','2018-10-21','2018-10-21',NULL),(186,5,58,'','','2018-10-28','2018-10-28',NULL),(187,5,60,'','','2018-10-01','2018-10-01',NULL),(188,5,60,'','','2018-10-08','2018-10-08',NULL),(189,5,60,'','','2018-10-15','2018-10-15',NULL),(190,5,60,'','','2018-10-22','2018-10-22',NULL),(191,5,60,'','','2018-10-29','2018-10-29',NULL),(192,5,38,'','','2018-10-02','2018-10-02',NULL),(193,5,38,'','','2018-10-04','2018-10-04',NULL),(194,5,38,'','','2018-10-09','2018-10-09',NULL),(195,5,38,'','','2018-10-11','2018-10-11',NULL),(196,5,38,'','','2018-10-16','2018-10-16',NULL),(197,5,38,'','','2018-10-18','2018-10-18',NULL),(198,5,38,'','','2018-10-23','2018-10-23',NULL),(199,5,38,'','','2018-10-25','2018-10-25',NULL),(200,5,38,'','','2018-10-30','2018-10-30',NULL),(201,7,62,'','','2018-10-01','2018-10-01',NULL),(202,7,62,'','','2018-10-08','2018-10-08',NULL),(203,7,62,'','','2018-10-15','2018-10-15',NULL),(204,7,62,'','','2018-10-22','2018-10-22',NULL),(205,7,62,'','','2018-10-29','2018-10-29',NULL),(206,7,63,'','','2018-10-03','2018-10-03',NULL),(207,7,63,'','','2018-10-10','2018-10-10',NULL),(208,7,63,'','','2018-10-17','2018-10-17',NULL),(209,7,63,'','','2018-10-24','2018-10-24',NULL),(210,7,63,'','','2018-10-31','2018-10-31',NULL),(219,5,58,'','','2018-11-11','2018-11-11',NULL),(220,5,58,'','','2018-11-18','2018-11-18',NULL),(221,5,58,'','','2018-11-25','2018-11-25',NULL),(222,5,60,'','','2018-11-05','2018-11-05',NULL),(223,5,60,'','','2018-11-12','2018-11-12',NULL),(224,5,60,'','','2018-11-19','2018-11-19',NULL),(225,5,60,'','','2018-11-26','2018-11-26',NULL),(226,5,38,'','','2018-11-01','2018-11-01',NULL),(227,5,38,'','','2018-11-06','2018-11-06',NULL),(228,5,38,'','','2018-11-08','2018-11-08',NULL),(229,5,38,'','','2018-11-13','2018-11-13',NULL),(230,5,38,'','','2018-11-15','2018-11-15',NULL),(231,5,38,'','','2018-11-20','2018-11-20',NULL),(232,5,38,'','','2018-11-22','2018-11-22',NULL),(233,5,38,'','','2018-11-27','2018-11-27',NULL),(234,5,38,'','','2018-11-29','2018-11-29',NULL),(235,7,62,'','','2018-11-05','2018-11-05',NULL),(236,7,62,'','','2018-11-12','2018-11-12',NULL),(237,7,62,'','','2018-11-19','2018-11-19',NULL),(238,7,62,'','','2018-11-26','2018-11-26',NULL),(239,7,63,'','','2018-11-07','2018-11-07',NULL),(240,7,63,'','','2018-11-14','2018-11-14',NULL),(241,7,63,'','','2018-11-21','2018-11-21',NULL),(242,7,63,'','','2018-11-28','2018-11-28',NULL),(243,5,58,'','','2018-11-04','2018-11-04',NULL),(244,5,58,'','','2018-11-11','2018-11-11',NULL),(245,5,58,'','','2018-11-18','2018-11-18',NULL),(246,5,58,'','','2018-11-25','2018-11-25',NULL),(247,5,60,'','','2018-11-05','2018-11-05',NULL),(248,5,60,'','','2018-11-12','2018-11-12',NULL),(249,5,60,'','','2018-11-19','2018-11-19',NULL),(250,5,60,'','','2018-11-26','2018-11-26',NULL),(251,5,38,'','','2018-11-01','2018-11-01',NULL),(252,5,38,'','','2018-11-06','2018-11-06',NULL),(253,5,38,'','','2018-11-08','2018-11-08',NULL),(254,5,38,'','','2018-11-13','2018-11-13',NULL),(255,5,38,'','','2018-11-15','2018-11-15',NULL),(256,5,38,'','','2018-11-20','2018-11-20',NULL),(257,5,38,'','','2018-11-22','2018-11-22',NULL),(258,5,38,'','','2018-11-27','2018-11-27',NULL),(259,5,38,'','','2018-11-29','2018-11-29',NULL),(260,7,62,'','','2018-11-05','2018-11-05',NULL),(261,7,62,'','','2018-11-12','2018-11-12',NULL),(262,7,62,'','','2018-11-19','2018-11-19',NULL),(263,7,62,'','','2018-11-26','2018-11-26',NULL),(264,7,63,'','','2018-11-07','2018-11-07',NULL),(265,7,63,'','','2018-11-14','2018-11-14',NULL),(266,7,63,'','','2018-11-21','2018-11-21',NULL),(267,7,63,'','','2018-11-28','2018-11-28',NULL),(282,5,58,'','','2018-12-09','2018-12-09',NULL),(283,5,58,'','','2018-12-02','2018-12-02',NULL),(284,5,58,'','','2018-12-09','2018-12-09',NULL),(285,5,58,'','','2018-12-16','2018-12-16',NULL),(286,5,58,'','','2018-12-23','2018-12-23',NULL),(287,5,58,'','','2018-12-16','2018-12-16',NULL),(288,5,58,'','','2018-12-23','2018-12-23',NULL),(289,5,58,'','','2018-12-30','2018-12-30',NULL),(290,5,60,'','','2018-12-03','2018-12-03',NULL),(291,5,60,'','','2018-12-10','2018-12-10',NULL),(292,5,60,'','','2018-12-17','2018-12-17',NULL),(293,5,60,'','','2018-12-24','2018-12-24',NULL),(294,5,60,'','','2018-12-31','2018-12-31',NULL),(295,5,38,'','','2018-12-04','2018-12-04',NULL),(296,5,38,'','','2018-12-06','2018-12-06',NULL),(297,5,38,'','','2018-12-11','2018-12-11',NULL),(298,5,38,'','','2018-12-13','2018-12-13',NULL),(299,5,38,'','','2018-12-18','2018-12-18',NULL),(300,5,38,'','','2018-12-20','2018-12-20',NULL),(301,5,38,'','','2018-12-25','2018-12-25',NULL),(302,5,38,'','','2018-12-27','2018-12-27',NULL),(303,7,62,'','','2018-12-03','2018-12-03',NULL),(304,7,62,'','','2018-12-10','2018-12-10',NULL),(305,7,62,'','','2018-12-17','2018-12-17',NULL),(306,7,62,'','','2018-12-24','2018-12-24',NULL),(307,7,62,'','','2018-12-31','2018-12-31',NULL),(308,7,63,'','','2018-12-05','2018-12-05',NULL),(309,7,63,'','','2018-12-12','2018-12-12',NULL),(310,7,63,'','','2018-12-19','2018-12-19',NULL),(311,7,63,'','','2018-12-26','2018-12-26',NULL),(312,5,58,'','','2018-12-02','2018-12-02',NULL),(313,5,58,'','','2018-12-09','2018-12-09',NULL),(314,5,58,'','','2018-12-16','2018-12-16',NULL),(315,5,58,'','','2018-12-23','2018-12-23',NULL),(316,5,58,'','','2018-12-30','2018-12-30',NULL),(317,5,60,'','','2018-12-03','2018-12-03',NULL),(318,5,60,'','','2018-12-10','2018-12-10',NULL),(319,5,60,'','','2018-12-17','2018-12-17',NULL),(320,5,60,'','','2018-12-24','2018-12-24',NULL),(321,5,60,'','','2018-12-31','2018-12-31',NULL),(322,5,38,'','','2018-12-04','2018-12-04',NULL),(323,5,38,'','','2018-12-06','2018-12-06',NULL),(324,5,38,'','','2018-12-11','2018-12-11',NULL),(325,5,38,'','','2018-12-13','2018-12-13',NULL),(326,5,38,'','','2018-12-18','2018-12-18',NULL),(327,5,38,'','','2018-12-20','2018-12-20',NULL),(328,5,38,'','','2018-12-25','2018-12-25',NULL),(329,5,38,'','','2018-12-27','2018-12-27',NULL),(330,7,62,'','','2018-12-03','2018-12-03',NULL),(331,7,62,'','','2018-12-10','2018-12-10',NULL),(332,7,62,'','','2018-12-17','2018-12-17',NULL),(333,7,62,'','','2018-12-24','2018-12-24',NULL),(334,7,62,'','','2018-12-31','2018-12-31',NULL),(335,7,63,'','','2018-12-05','2018-12-05',NULL),(336,7,63,'','','2018-12-12','2018-12-12',NULL),(337,7,63,'','','2018-12-19','2018-12-19',NULL),(338,7,63,'','','2018-12-26','2018-12-26',NULL),(345,5,58,'','','2019-01-13','2019-01-13',NULL),(346,5,58,'','','2019-01-20','2019-01-20',NULL),(347,5,58,'','','2019-01-27','2019-01-27',NULL),(348,5,60,'','','2019-01-07','2019-01-07',NULL),(349,5,60,'','','2019-01-14','2019-01-14',NULL),(350,5,60,'','','2019-01-21','2019-01-21',NULL),(351,5,60,'','','2019-01-28','2019-01-28',NULL),(352,5,38,'','','2019-01-01','2019-01-01',NULL),(353,5,38,'','','2019-01-03','2019-01-03',NULL),(354,5,38,'','','2019-01-08','2019-01-08',NULL),(355,5,38,'','','2019-01-10','2019-01-10',NULL),(356,5,38,'','','2019-01-15','2019-01-15',NULL),(357,5,38,'','','2019-01-17','2019-01-17',NULL),(358,5,38,'','','2019-01-22','2019-01-22',NULL),(359,5,38,'','','2019-01-24','2019-01-24',NULL),(360,5,38,'','','2019-01-29','2019-01-29',NULL),(361,5,38,'','','2019-01-31','2019-01-31',NULL),(362,7,62,'','','2019-01-07','2019-01-07',NULL),(363,7,62,'','','2019-01-14','2019-01-14',NULL),(364,7,62,'','','2019-01-21','2019-01-21',NULL),(365,7,62,'','','2019-01-28','2019-01-28',NULL),(366,7,63,'','','2019-01-02','2019-01-02',NULL),(367,7,63,'','','2019-01-09','2019-01-09',NULL),(368,7,63,'','','2019-01-16','2019-01-16',NULL),(369,7,63,'','','2019-01-23','2019-01-23',NULL),(370,7,63,'','','2019-01-30','2019-01-30',NULL),(376,5,58,'','','2019-02-10','2019-02-10',NULL),(377,5,58,'','','2019-02-17','2019-02-17',NULL),(378,5,58,'','','2019-02-24','2019-02-24',NULL),(379,5,38,'','','2019-02-05','2019-02-05',NULL),(380,5,38,'','','2019-02-07','2019-02-07',NULL),(381,5,38,'','','2019-02-12','2019-02-12',NULL),(382,5,38,'','','2019-02-14','2019-02-14',NULL),(383,5,38,'','','2019-02-19','2019-02-19',NULL),(384,5,38,'','','2019-02-21','2019-02-21',NULL),(385,5,38,'','','2019-02-26','2019-02-26',NULL),(386,5,38,'','','2019-02-28','2019-02-28',NULL),(387,7,62,'','','2019-02-04','2019-02-04',NULL),(388,7,62,'','','2019-02-11','2019-02-11',NULL),(389,7,62,'','','2019-02-18','2019-02-18',NULL),(390,7,62,'','','2019-02-25','2019-02-25',NULL),(391,7,63,'','','2019-02-06','2019-02-06',NULL),(392,7,63,'','','2019-02-13','2019-02-13',NULL),(393,7,63,'','','2019-02-20','2019-02-20',NULL),(394,7,63,'','','2019-02-27','2019-02-27',NULL),(407,5,58,'','','2019-03-10','2019-03-10',NULL),(408,5,58,'','','2019-03-17','2019-03-17',NULL),(409,5,58,'','','2019-03-24','2019-03-24',NULL),(410,5,58,'','','2019-03-31','2019-03-31',NULL),(411,5,60,'','','2019-03-04','2019-03-04',NULL),(412,5,60,'','','2019-03-11','2019-03-11',NULL),(413,5,60,'','','2019-03-18','2019-03-18',NULL),(414,5,60,'','','2019-03-25','2019-03-25',NULL),(415,5,38,'','','2019-03-05','2019-03-05',NULL),(416,5,38,'','','2019-03-07','2019-03-07',NULL),(417,5,38,'','','2019-03-12','2019-03-12',NULL),(418,5,38,'','','2019-03-14','2019-03-14',NULL),(419,5,38,'','','2019-03-19','2019-03-19',NULL),(420,5,38,'','','2019-03-21','2019-03-21',NULL),(421,5,38,'','','2019-03-26','2019-03-26',NULL),(422,5,38,'','','2019-03-28','2019-03-28',NULL),(423,7,62,'','','2019-03-04','2019-03-04',NULL),(424,7,62,'','','2019-03-11','2019-03-11',NULL),(425,7,62,'','','2019-03-18','2019-03-18',NULL),(426,7,62,'','','2019-03-25','2019-03-25',NULL),(427,7,63,'','','2019-03-06','2019-03-06',NULL),(428,7,63,'','','2019-03-13','2019-03-13',NULL),(429,7,63,'','','2019-03-20','2019-03-20',NULL),(430,7,63,'','','2019-03-27','2019-03-27',NULL),(438,5,58,'','','2019-04-14','2019-04-14',NULL),(439,5,58,'','','2018-10-14','2018-10-14',NULL),(440,5,58,'','','2019-04-21','2019-04-21',NULL),(441,5,58,'','','2019-04-28','2019-04-28',NULL),(442,5,60,'','','2019-04-01','2019-04-01',NULL),(443,5,60,'','','2019-04-08','2019-04-08',NULL),(444,5,60,'','','2019-04-15','2019-04-15',NULL),(445,5,60,'','','2019-04-22','2019-04-22',NULL),(446,5,60,'','','2019-04-29','2019-04-29',NULL),(447,5,38,'','','2019-04-02','2019-04-02',NULL),(448,5,38,'','','2019-04-04','2019-04-04',NULL),(449,5,38,'','','2019-04-09','2019-04-09',NULL),(450,5,38,'','','2019-04-11','2019-04-11',NULL),(451,5,38,'','','2019-04-16','2019-04-16',NULL),(452,5,38,'','','2019-04-18','2019-04-18',NULL),(453,5,38,'','','2019-04-23','2019-04-23',NULL),(454,5,38,'','','2019-04-25','2019-04-25',NULL),(455,5,38,'','','2019-04-30','2019-04-30',NULL),(456,7,62,'','','2019-04-01','2019-04-01',NULL),(457,7,62,'','','2019-04-08','2019-04-08',NULL),(458,7,62,'','','2019-04-15','2019-04-15',NULL),(459,7,62,'','','2019-04-22','2019-04-22',NULL),(460,7,62,'','','2019-04-29','2019-04-29',NULL),(461,7,63,'','','2019-04-03','2019-04-03',NULL),(462,7,63,'','','2019-04-10','2019-04-10',NULL),(463,7,63,'','','2019-04-17','2019-04-17',NULL),(464,7,63,'','','2019-04-24','2019-04-24',NULL),(470,5,58,'','','2018-10-21','2018-10-21',NULL),(471,5,58,'','','2018-10-28','2018-10-28',NULL),(472,5,60,'','','2018-10-01','2018-10-01',NULL),(473,5,60,'','','2018-10-08','2018-10-08',NULL),(474,5,60,'','','2018-10-15','2018-10-15',NULL),(475,5,60,'','','2018-10-22','2018-10-22',NULL),(476,5,60,'','','2018-10-29','2018-10-29',NULL),(477,5,38,'','','2018-10-02','2018-10-02',NULL),(478,5,38,'','','2018-10-04','2018-10-04',NULL),(479,5,38,'','','2018-10-09','2018-10-09',NULL),(480,5,38,'','','2018-10-11','2018-10-11',NULL),(481,5,38,'','','2018-10-16','2018-10-16',NULL),(482,5,38,'','','2018-10-18','2018-10-18',NULL),(483,5,38,'','','2018-10-23','2018-10-23',NULL),(484,5,38,'','','2018-10-25','2018-10-25',NULL),(485,5,38,'','','2018-10-30','2018-10-30',NULL),(486,7,62,'','','2018-10-01','2018-10-01',NULL),(487,7,62,'','','2018-10-08','2018-10-08',NULL),(488,7,62,'','','2018-10-15','2018-10-15',NULL),(489,7,62,'','','2018-10-22','2018-10-22',NULL),(490,7,62,'','','2018-10-29','2018-10-29',NULL),(491,7,63,'','','2018-10-03','2018-10-03',NULL),(492,7,63,'','','2018-10-10','2018-10-10',NULL),(493,7,63,'','','2018-10-17','2018-10-17',NULL),(494,7,63,'','','2018-10-24','2018-10-24',NULL),(495,7,63,'','','2018-10-31','2018-10-31',NULL),(496,5,58,'','','2018-10-07','2018-10-07',NULL),(497,5,58,'','','2018-10-14','2018-10-14',NULL),(498,5,58,'','','2018-10-21','2018-10-21',NULL),(499,5,58,'','','2018-10-28','2018-10-28',NULL),(500,5,60,'','','2018-10-01','2018-10-01',NULL),(501,5,60,'','','2018-10-08','2018-10-08',NULL),(502,5,60,'','','2018-10-15','2018-10-15',NULL),(503,5,60,'','','2018-10-22','2018-10-22',NULL),(504,5,60,'','','2018-10-29','2018-10-29',NULL),(505,5,38,'','','2018-10-02','2018-10-02',NULL),(506,5,38,'','','2018-10-04','2018-10-04',NULL),(507,5,38,'','','2018-10-09','2018-10-09',NULL),(508,5,38,'','','2018-10-11','2018-10-11',NULL),(509,5,38,'','','2018-10-16','2018-10-16',NULL),(510,5,38,'','','2018-10-18','2018-10-18',NULL),(511,5,38,'','','2018-10-23','2018-10-23',NULL),(512,5,38,'','','2018-10-25','2018-10-25',NULL),(513,5,38,'','','2018-10-30','2018-10-30',NULL),(514,7,62,'','','2018-10-01','2018-10-01',NULL),(515,7,62,'','','2018-10-08','2018-10-08',NULL),(516,7,62,'','','2018-10-15','2018-10-15',NULL),(517,7,62,'','','2018-10-22','2018-10-22',NULL),(518,7,62,'','','2018-10-29','2018-10-29',NULL),(519,7,63,'','','2018-10-03','2018-10-03',NULL),(520,7,63,'','','2018-10-10','2018-10-10',NULL),(521,7,63,'','','2018-10-17','2018-10-17',NULL),(522,7,63,'','','2018-10-24','2018-10-24',NULL),(523,7,63,'','','2018-10-31','2018-10-31',NULL),(524,5,58,'','','2018-10-07','2018-10-07',NULL),(525,5,58,'','','2018-10-14','2018-10-14',NULL),(526,5,58,'','','2018-10-21','2018-10-21',NULL),(527,5,58,'','','2018-10-28','2018-10-28',NULL),(528,5,60,'','','2018-10-01','2018-10-01',NULL),(529,5,60,'','','2018-10-08','2018-10-08',NULL),(530,5,60,'','','2018-10-15','2018-10-15',NULL),(531,5,60,'','','2018-10-22','2018-10-22',NULL),(532,5,60,'','','2018-10-29','2018-10-29',NULL),(533,5,38,'','','2018-10-02','2018-10-02',NULL),(534,5,38,'','','2018-10-04','2018-10-04',NULL),(535,5,38,'','','2018-10-09','2018-10-09',NULL),(536,5,38,'','','2018-10-11','2018-10-11',NULL),(537,5,38,'','','2018-10-16','2018-10-16',NULL),(538,5,38,'','','2018-10-18','2018-10-18',NULL),(539,5,38,'','','2018-10-23','2018-10-23',NULL),(540,5,38,'','','2018-10-25','2018-10-25',NULL),(541,5,38,'','','2018-10-30','2018-10-30',NULL),(542,7,62,'','','2018-10-01','2018-10-01',NULL),(543,7,62,'','','2018-10-08','2018-10-08',NULL),(544,7,62,'','','2018-10-15','2018-10-15',NULL),(545,7,62,'','','2018-10-22','2018-10-22',NULL),(546,7,62,'','','2018-10-29','2018-10-29',NULL),(547,7,63,'','','2018-10-03','2018-10-03',NULL),(548,7,63,'','','2018-10-10','2018-10-10',NULL),(549,7,63,'','','2018-10-17','2018-10-17',NULL),(550,7,63,'','','2018-10-24','2018-10-24',NULL),(551,7,63,'','','2018-10-31','2018-10-31',NULL),(596,5,58,'','','2019-04-14','2019-04-14',NULL),(597,5,58,'','','2019-04-21','2019-04-21',NULL),(598,5,58,'','','2019-04-28','2019-04-28',NULL),(599,5,60,'','','2019-04-01','2019-04-01',NULL),(600,5,60,'','','2019-04-08','2019-04-08',NULL),(601,5,60,'','','2019-04-15','2019-04-15',NULL),(602,5,60,'','','2019-04-22','2019-04-22',NULL),(603,5,60,'','','2019-04-29','2019-04-29',NULL),(604,5,38,'','','2019-04-02','2019-04-02',NULL),(605,5,38,'','','2019-04-04','2019-04-04',NULL),(606,5,38,'','','2019-04-09','2019-04-09',NULL),(607,5,38,'','','2019-04-11','2019-04-11',NULL),(608,5,38,'','','2019-04-16','2019-04-16',NULL),(609,5,38,'','','2019-04-18','2019-04-18',NULL),(610,5,38,'','','2019-04-23','2019-04-23',NULL),(611,5,38,'','','2019-04-25','2019-04-25',NULL),(612,5,38,'','','2019-04-30','2019-04-30',NULL),(613,7,62,'','','2019-04-01','2019-04-01',NULL),(614,7,62,'','','2019-04-08','2019-04-08',NULL),(615,7,62,'','','2019-04-15','2019-04-15',NULL),(616,7,62,'','','2019-04-22','2019-04-22',NULL),(617,7,62,'','','2019-04-29','2019-04-29',NULL),(618,7,63,'','','2019-04-03','2019-04-03',NULL),(619,7,63,'','','2019-04-10','2019-04-10',NULL),(620,7,63,'','','2019-04-17','2019-04-17',NULL),(621,7,63,'','','2019-04-24','2019-04-24',NULL),(622,5,58,'','','2019-04-07','2019-04-07',NULL),(623,5,58,'','','2019-04-14','2019-04-14',NULL),(624,5,58,'','','2019-04-21','2019-04-21',NULL),(625,5,58,'','','2019-04-28','2019-04-28',NULL),(626,5,60,'','','2019-04-01','2019-04-01',NULL),(627,5,60,'','','2019-04-08','2019-04-08',NULL),(628,5,60,'','','2019-04-15','2019-04-15',NULL),(629,5,60,'','','2019-04-22','2019-04-22',NULL),(630,5,60,'','','2019-04-29','2019-04-29',NULL),(631,5,38,'','','2019-04-02','2019-04-02',NULL),(632,5,38,'','','2019-04-04','2019-04-04',NULL),(633,5,38,'','','2019-04-09','2019-04-09',NULL),(634,5,38,'','','2019-04-11','2019-04-11',NULL),(635,5,38,'','','2019-04-16','2019-04-16',NULL),(636,5,38,'','','2019-04-18','2019-04-18',NULL),(637,5,38,'','','2019-04-23','2019-04-23',NULL),(638,5,38,'','','2019-04-25','2019-04-25',NULL),(639,5,38,'','','2019-04-30','2019-04-30',NULL),(640,7,62,'','','2019-04-01','2019-04-01',NULL),(641,7,62,'','','2019-04-08','2019-04-08',NULL),(642,7,62,'','','2019-04-15','2019-04-15',NULL),(643,7,62,'','','2019-04-22','2019-04-22',NULL),(644,7,62,'','','2019-04-29','2019-04-29',NULL),(645,7,63,'','','2019-04-03','2019-04-03',NULL),(646,7,63,'','','2019-04-10','2019-04-10',NULL),(647,7,63,'','','2019-04-17','2019-04-17',NULL),(648,7,63,'','','2019-04-24','2019-04-24',NULL),(659,5,58,'','','2019-05-12','2019-05-12',NULL),(660,5,58,'','','2019-05-19','2019-05-19',NULL),(661,5,58,'','','2019-05-26','2019-05-26',NULL),(662,5,60,'','','2019-05-06','2019-05-06',NULL),(663,5,60,'','','2019-05-13','2019-05-13',NULL),(664,5,60,'','','2019-05-20','2019-05-20',NULL),(665,5,60,'','','2019-05-27','2019-05-27',NULL),(666,5,38,'','','2019-05-02','2019-05-02',NULL),(667,5,38,'','','2019-05-07','2019-05-07',NULL),(668,5,38,'','','2019-05-09','2019-05-09',NULL),(669,5,38,'','','2019-05-14','2019-05-14',NULL),(670,5,38,'','','2019-05-16','2019-05-16',NULL),(671,5,38,'','','2019-05-21','2019-05-21',NULL),(672,5,38,'','','2019-05-23','2019-05-23',NULL),(673,5,38,'','','2019-05-28','2019-05-28',NULL),(674,5,38,'','','2019-05-30','2019-05-30',NULL),(675,7,62,'','','2019-05-06','2019-05-06',NULL),(676,7,62,'','','2019-05-13','2019-05-13',NULL),(677,7,62,'','','2019-05-20','2019-05-20',NULL),(678,7,62,'','','2019-05-27','2019-05-27',NULL),(679,7,63,'','','2019-05-01','2019-05-01',NULL),(680,7,63,'','','2019-05-08','2019-05-08',NULL),(681,7,63,'','','2019-05-15','2019-05-15',NULL),(682,7,63,'','','2019-05-22','2019-05-22',NULL),(683,7,63,'','','2019-05-29','2019-05-29',NULL);
/*!40000 ALTER TABLE `pontos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'inclock'
--

--
-- Dumping routines for database 'inclock'
--
/*!50003 DROP PROCEDURE IF EXISTS `prd_insere_func` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prd_insere_func`(
in _nome varchar(50)
,in _telefone varchar(16)
,in _celular varchar(17)
,in _email varchar(50)
,in _endereco varchar(50)
,in _cpf varchar(16)
,in _fk_cargo int
,in _nascimento date
,in _sexo char(2)
,in _cidade varchar(30)
,in _estado char(2)
,in _cep varchar(15)
,in _numero varchar(5)
,in _bairro varchar(45)
,in _rg varchar(14)
,in _senha varchar(8)
,in _login varchar(8)
,in _role varchar(50))
begin
	 
        INSERT INTO inclock.funcionarios
        (nome
        ,telefone
        ,celular
        ,email
        ,endereco
        ,cpf
        ,cargo_id
        ,nascimento
        ,sexo
        ,cidade
        ,estado
        ,cep
        ,numero
        ,bairro
        ,rg
        ,senha
        ,login
        ,role)
        values
        (_nome
        ,_telefone
        ,_celular
        ,_email
        ,_endereco
        ,_cpf
        ,_fk_cargo
        ,_nascimento
        ,_sexo
        ,_cidade
        ,_estado
        ,_cep
        ,_numero
        ,_bairro
        ,_rg
        ,_senha
        ,_login
        ,_role);
		Select last_insert_id() as retorno;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prd_insert_aviso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prd_insert_aviso`(in titulo_ varchar(50),in conteudo_ varchar(50),in img_ varchar(50))
begin
		insert into avisos(titulo,conteudo,imagem) values(titulo_,conteudo_,img_);
        select last_insert_id() as retorno ;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prd_insert_expediente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prd_insert_expediente`(
in _entrada time, 
in _saida time,
in _semanaEntrada int,
in _semanaSaida int, 
in _funcionario_id int,
in _periodo int,
in _periodo_sda int
 )
begin

	declare exit handler for sqlexception 
	begin
		select 'erro' as erro;
	 rollback;
	end;
	
	start transaction;
	begin 	
		declare last_id int;
		declare exist int;	
        -- se true indica que ele ja tem o expediente cadastrado --
            if(exists( select 1 from expediente exp	inner join expediente_id eid on eid.id = exp.expediente_id
						where exp.diasemana = _semanaEntrada and eid.funcionario_id = _funcionario_id and exp.periodo = _periodo and type_point = 'E')) then
			BEGIN				
				select 'duplicate' as erro;
			end;
            -- Se true indica que o funcionario tem um periodo integral --
            elseif(exists( select 1 from expediente exp	inner join expediente_id eid on eid.id = exp.expediente_id
						where exp.diasemana = _semanaEntrada and eid.funcionario_id = _funcionario_id and exp.periodo = 4))then
            begin 
				select 'integral';
			end;
                        -- indica que ele não pode cadastrar expedientes porque ja contem 
            elseif(exists(select 1 from expediente exp	inner join expediente_id eid on eid.id = exp.expediente_id
						where exp.diasemana = _semanaEntrada and eid.funcionario_id = _funcionario_id) and _periodo = 4)then 
			select 'expediente';
		else
			begin 
				insert into expediente_id(funcionario_id) values (_funcionario_id);
				set last_id = last_insert_id();           
				-- Registra a entrada --
				INSERT INTO expediente
				(
				hora,
				diasemana,		
				periodo,
				type_point
				,expediente_id)
				VALUES
				(
				_entrada ,
				_semanaEntrada ,		
				_periodo,
				'E',
				last_id);

				 -- Registra a saida --
				INSERT INTO expediente
				(
				hora,
				diasemana,		
				periodo,
				type_point,
				expediente_id)
				VALUES
				(
				_saida ,
				_semanaSaida ,		
				_periodo_sda,
				'S',          
				last_id);        
				select last_id;        
				commit;
			end;
		end if;
	end;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prd_se_expediente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prd_se_expediente`(
 in _funcionario int
,in _semana int
,in _periodo int
,in _type char(1)
)
begin
	select ex.id as id,ex.expediente_id,ex.hora,ex.diasemana,ex.periodo,ex.type_point,exi.funcionario_id
    from expediente ex inner join expediente_id exi on exi.id =  ex.expediente_id 
    where exi.funcionario_id = _funcionario and ex.diasemana = _semana and ex.periodo = _periodo and ex.type_point = _type ;  
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prd_se_expediente_dia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prd_se_expediente_dia`(in _funcionario int,in _periodo int,in _semana int)
begin 
 with
	entrada as (select * from expediente exp  where type_point ='E'),
	saida as (select hora as saida, expediente_id from expediente where type_point ='S')
	select * from entrada etr
		inner join saida sda  on etr.expediente_id  = sda.expediente_id
		inner join expediente_id eid on eid.id = sda.expediente_id
		where etr.diasemana = _semana and etr.periodo = _periodo and eid.funcionario_id = _funcionario;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prd_se_expediente_semana` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prd_se_expediente_semana`(
in iSemana int,
in iFuncionario int)
begin
	if(iSemana <= 0) then 
	with
		entrada as (select hora as entrada, diasemana,periodo, expediente_id from expediente exp  where type_point ='E'),
		saida as (select hora as saida, expediente_id from expediente where type_point ='S')		
        select eid.id ,etr.entrada,sda.saida, etr.diasemana,etr.periodo,eid.funcionario_id   from entrada etr
		inner join saida sda  on etr.expediente_id  = sda.expediente_id
		inner join expediente_id eid on eid.id = sda.expediente_id
		where eid.funcionario_id = iFuncionario order by etr.diasemana, etr.periodo asc ;
	else 		
		with 
        entrada as (select hora as entrada, diasemana,periodo, expediente_id from expediente exp  where type_point ='E'),
		saida as (select hora as saida, expediente_id from expediente where type_point ='S')		
        select eid.id ,etr.entrada,sda.saida, etr.diasemana,etr.periodo,eid.funcionario_id  from entrada etr
		inner join saida sda  on etr.expediente_id  = sda.expediente_id
		inner join expediente_id eid on eid.id = sda.expediente_id
		where etr.diasemana = iSemana and eid.funcionario_id = iFuncionario order by etr.diasemana, etr.periodo asc;
    end if;
    
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prd_se_full_expediente_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prd_se_full_expediente_id`(in _id int)
begin
with
	entrada as (select * from expediente  where type_point ='E' and expediente_id = _id ),
	saida as (select * from expediente where type_point ='S'and expediente_id = _id )
	select 
		e.expediente_id as id
        ,e.id as etr_id
		,e.hora as entrada
		,e.diasemana as etr_semana
		,e.periodo as etr_periodo
        ,s.id as sda_id
		,s.hora as saida
		,s.diasemana as sda_semana
		,s.periodo as sda_periodo
    from entrada e
		inner join saida s  on e.expediente_id  = s.expediente_id
		inner join expediente_id eid on eid.id = s.expediente_id;
	
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prd_se_login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prd_se_login`(in _login varchar(15),in _senha varchar(15))
begin
	select 
    fc.id,
    fc.nome,
    fc.telefone,
    fc.celular,
    fc.email,
    fc.endereco,
    fc.cpf,
    fc.cargo_id,
    fc.nascimento,
    fc.sexo,
    fc.cidade,
    fc.estado,
    fc.cep,
    fc.numero,
    fc.bairro,
    fc.rg,
    fc.senha,
    fc.login,
    cg.descricao as cargo,
    fc.role
    from funcionarios fc inner join cargo cg on fc.cargo_id = cg.id where senha = _senha and login = _login;
    
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prd_se_pessoas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prd_se_pessoas`(in _nome varchar(50), out _TotalLinhas int,in  _pagina int,in  _quantidade int )
begin 
	declare TotalLinhas int;
    declare	InicioPagina int;
    declare FimPagina  int ;
	
	-- SELECT id_funcionario,nome,telefone,celular,email,endereco,cpf,fk_cargo,nacimento,sexo,cidade,estado,cep,numero,bairro,rg,senha,login FROM  funcionarios; --
	create temporary table temp(indice int primary key auto_increment)
    SELECT funcionarios.id,nome,telefone,celular,email,cpf, cargo.descricao as cargo,nascimento,sexo,rg
    FROM  funcionarios join  cargo where nome like concat('%',_nome,'%') and  cargo.id =  funcionarios.cargo_id ;
    
    set TotalLinhas = (select count(*) from temp); -- Calcula o total de linhas q existe 
    set InicioPagina =  _quantidade * (_pagina-1) +1; -- calcula o inicio da pagina
    set FimPagina = _quantidade * _pagina;
    
    if(TotalLinhas < _quantidade or _quantidade = 0 or _pagina = 0) then
		select * from temp ;
	else
		(select *  from temp  where indice >= InicioPagina and indice <= FimPagina)   ;
    end if;    
     set _TotalLinhas = TotalLinhas;
    drop table if exists temp;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prd_se_pessoas_expediente_nome` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prd_se_pessoas_expediente_nome`(in _nome varchar(50))
begin
 select fc.id,fc.nome,cg.descricao as cargo,fc.rg,fc.cpf,(select count(funcionario_id) from expediente_id where funcionario_id = fc.id )as expediente
 from  funcionarios fc 
 inner join cargo cg on cg.id = fc.cargo_id
 where fc.nome like concat( '%',_nome,'%');
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prd_se_pessoa_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prd_se_pessoa_id`(in _id int)
begin	
	select 
    fc.id,
    fc.nome,
    fc.telefone,
    fc.celular,
    fc.email,
    fc.endereco,
    fc.cpf,
    fc.cargo_id,
    fc.nascimento,
    fc.sexo,
    fc.cidade,
    fc.estado,
    fc.cep,
    fc.numero,
    fc.bairro,
    fc.rg,
    fc.senha,
    fc.login,
    fc.role,
    cg.descricao as cargo
    from funcionarios fc inner join cargo cg on fc.cargo_id = cg.id where fc.id = _id ;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prd_se_ponto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prd_se_ponto`(
in _funcionario int,
in _dia varchar(10), 
in _periodo int)
begin
	 declare _entrada time ;
	 declare _saida time ;   
     
    set _entrada = (select  entrada from registro_pontos where funcionario_id = _funcionario and periodo =  _periodo and data_ponto like concat('%',_dia) limit 1 ) ;
    if(!isnull(_entrada)) then 
		select * from registro_pontos where funcionario_id = _funcionario and periodo =  _periodo and data_ponto like concat('%',_dia) limit 1  ; 

    end if;
    
    
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prd_updade_expediente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prd_updade_expediente`(
in _id int,
in _entrada time, 
in _saida time,
in _semanaEntrada int,
in _semanaSaida int, 
in _funcionario_id int,
in _periodo int,
in _periodo_sda int
)
begin 

declare exit handler for sqlexception 
	begin
		select 'erro' as erro;
		rollback;
	end;
	
	start transaction;
	begin 	
		declare last_id int;
        declare coutIntegral int;
        
		declare exist int;	
        -- se true indica que ele ja tem o expediente cadastrado --
			  
            
			
			
            if(exists(select 1 from expediente exp	inner join expediente_id eid on eid.id = exp.expediente_id
						where exp.expediente_id != _id and  exp.diasemana = _semanaEntrada and eid.funcionario_id = _funcionario_id and exp.periodo = _periodo and type_point = 'E')) then
			BEGIN				
				select 'duplicate' as erro;
			end;
            -- Se true indica que o funcionario tem um periodo integral --
            elseif(exists(select 1 from expediente exp	inner join expediente_id eid on eid.id = exp.expediente_id
						where exp.diasemana = _semanaEntrada and eid.funcionario_id = _funcionario_id and exp.periodo = 4))then
            begin 
				select 'integral';
			end;
            -- indica que ele não pode cadastrar expedientes porque ja contem 
            elseif(exists(select 1 from expediente exp	inner join expediente_id eid on eid.id = exp.expediente_id
						where exp.diasemana = _semanaEntrada and eid.funcionario_id = _funcionario_id) and _periodo = 4)then 
                        select 'expediente';
            else
				begin 
				update  expediente
				set
				 hora = _entrada
				,diasemana = _semanaEntrada	
				,periodo = _periodo
				where expediente_id  =  _id and type_point = 'E';
				 -- Registra a saida --
				update expediente
				set
				hora = _saida
				,diasemana = _semanaSaida
				,periodo = _periodo_sda
				where  expediente_id = _id and  type_point ='S';
				select _id;  
				commit;
            end;                 
		end if;
     
	end;


end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prd_update_func` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prd_update_func`(
in _id int,
in _nome varchar(50)
,in _telefone varchar(16)
,in _celular varchar(17)
,in _email varchar(50)
,in _endereco varchar(50)
,in _cpf varchar(16)
,in _fk_cargo int
,in _nascimento date
,in _sexo char(2)
,in _cidade varchar(30)
,in _estado char(2)
,in _cep varchar(15)
,in _numero varchar(5)
,in _bairro varchar(45)
,in _rg varchar(14)
,in _senha varchar(8)
,in _login varchar(8)
,in _role varchar(50))
begin

		update funcionarios
        set nome = _nome
        ,telefone = _telefone
        ,celular = _celular
        ,email = _email
        ,endereco = _endereco
        ,cpf = _cpf
        ,cargo_id = _fk_cargo
        ,nascimento = _nascimento
        ,sexo = _sexo
        ,cidade = _cidade
        ,estado = _estado
        ,cep = _cep
        ,numero = _numero
        ,bairro = _bairro
        ,rg = _rg
        ,senha = _senha
        ,login = _login
        ,role = _role
		where id = _id;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-08 18:52:00
