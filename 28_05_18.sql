-- MySQL dump 10.13  Distrib 8.0.11, for Win64 (x86_64)
--
-- Host: localhost    Database: inclock
-- ------------------------------------------------------
-- Server version	8.0.11

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
-- Table structure for table `aggregatedcounter`
--

DROP TABLE IF EXISTS `aggregatedcounter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `aggregatedcounter` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Key` varchar(100) NOT NULL,
  `Value` int(11) NOT NULL,
  `ExpireAt` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_CounterAggregated_Key` (`Key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aggregatedcounter`
--

LOCK TABLES `aggregatedcounter` WRITE;
/*!40000 ALTER TABLE `aggregatedcounter` DISABLE KEYS */;
/*!40000 ALTER TABLE `aggregatedcounter` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=821 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
INSERT INTO `cargo` VALUES (3,'Desenvolvedor');
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `counter`
--

DROP TABLE IF EXISTS `counter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `counter` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Key` varchar(100) NOT NULL,
  `Value` int(11) NOT NULL,
  `ExpireAt` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_Counter_Key` (`Key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `counter`
--

LOCK TABLES `counter` WRITE;
/*!40000 ALTER TABLE `counter` DISABLE KEYS */;
/*!40000 ALTER TABLE `counter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distributedlock`
--

DROP TABLE IF EXISTS `distributedlock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `distributedlock` (
  `Resource` varchar(100) NOT NULL,
  `CreatedAt` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distributedlock`
--

LOCK TABLES `distributedlock` WRITE;
/*!40000 ALTER TABLE `distributedlock` DISABLE KEYS */;
/*!40000 ALTER TABLE `distributedlock` ENABLE KEYS */;
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
  KEY `FK_expediente_id` (`expediente_id`),
  CONSTRAINT `FK_expediente_id` FOREIGN KEY (`expediente_id`) REFERENCES `expediente_id` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expediente`
--

LOCK TABLES `expediente` WRITE;
/*!40000 ALTER TABLE `expediente` DISABLE KEYS */;
INSERT INTO `expediente` VALUES (50,38,'10:00:00',3,1,'E'),(51,38,'01:00:00',4,1,'S'),(60,43,'00:00:00',2,4,'E'),(61,43,'02:01:00',5,4,'S'),(64,45,'01:00:00',2,4,'E'),(65,45,'02:00:00',5,4,'S'),(66,46,'01:01:00',2,4,'E'),(67,46,'00:00:00',5,4,'S'),(68,47,'23:00:00',2,4,'E'),(69,47,'00:00:00',2,4,'S'),(70,48,'06:00:00',4,1,'E'),(71,48,'01:00:00',5,1,'S'),(72,49,'01:00:00',2,4,'E'),(73,49,'00:00:00',2,4,'S'),(74,50,'01:00:00',2,4,'E'),(75,50,'00:00:00',2,4,'S'),(76,51,'10:00:00',2,4,'E'),(77,51,'10:00:00',2,4,'S'),(80,53,'10:00:00',2,4,'E'),(81,53,'10:00:00',2,4,'S'),(88,57,'12:00:00',3,2,'E'),(89,57,'01:00:00',4,2,'S');
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
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expediente_id`
--

LOCK TABLES `expediente_id` WRITE;
/*!40000 ALTER TABLE `expediente_id` DISABLE KEYS */;
INSERT INTO `expediente_id` VALUES (38,5),(43,5),(45,5),(46,5),(47,5),(48,5),(49,5),(50,5),(51,5),(53,5),(57,5);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionarios`
--

LOCK TABLES `funcionarios` WRITE;
/*!40000 ALTER TABLE `funcionarios` DISABLE KEYS */;
INSERT INTO `funcionarios` VALUES (5,'Lucas ','(17) 7711-1111','(17) 77711-1111','blublucas@gmail.com','Rua Vera Lúcia Pinto da Silva','177.711.111-11',3,'1996-10-10','M','Suzano','SP','08690215','90809','Cidade Miguel Badra','11.111.111-1','12345','12345','ADM;FUNC;');
/*!40000 ALTER TABLE `funcionarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hash`
--

DROP TABLE IF EXISTS `hash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `hash` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Key` varchar(100) NOT NULL,
  `Field` varchar(40) NOT NULL,
  `Value` longtext,
  `ExpireAt` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_Hash_Key_Field` (`Key`,`Field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hash`
--

LOCK TABLES `hash` WRITE;
/*!40000 ALTER TABLE `hash` DISABLE KEYS */;
/*!40000 ALTER TABLE `hash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `job` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `StateId` int(11) DEFAULT NULL,
  `StateName` varchar(20) DEFAULT NULL,
  `InvocationData` longtext NOT NULL,
  `Arguments` longtext NOT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  `ExpireAt` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_Job_StateName` (`StateName`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (1,3,'Processing','{\"Type\":\"Autenticador.BL.Quartz.JobSchadule+Funcionarios, Autenticador, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"AdicionaLinhasPonto\",\"ParameterTypes\":\"[]\",\"Arguments\":\"[]\"}','[]','2018-05-28 05:17:35.792789',NULL),(2,7,'Processing','{\"Type\":\"Autenticador.BL.Quartz.JobSchadule+Funcionarios, Autenticador, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"AdicionaLinhasPonto\",\"ParameterTypes\":\"[]\",\"Arguments\":\"[]\"}','[]','2018-05-28 05:20:31.722126',NULL),(3,5,'Scheduled','{\"Type\":\"Autenticador.BL.Quartz.JobSchadule+Funcionarios, Autenticador, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"AdicionaLinhasPonto\",\"ParameterTypes\":\"[]\",\"Arguments\":\"[]\"}','[]','2018-05-28 05:23:41.382078',NULL),(4,8,'Scheduled','{\"Type\":\"Autenticador.BL.Quartz.JobSchadule+Funcionarios, Autenticador, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"AdicionaLinhasPonto\",\"ParameterTypes\":\"[]\",\"Arguments\":\"[]\"}','[]','2018-05-28 05:26:09.554948',NULL),(5,9,'Scheduled','{\"Type\":\"Autenticador.BL.Quartz.JobSchadule+Funcionarios, Autenticador, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"AdicionaLinhasPonto\",\"ParameterTypes\":\"[]\",\"Arguments\":\"[]\"}','[]','2018-05-28 05:27:52.299480',NULL),(6,10,'Scheduled','{\"Type\":\"Autenticador.BL.Quartz.JobSchadule+Funcionarios, Autenticador, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"AdicionaLinhasPonto\",\"ParameterTypes\":\"[]\",\"Arguments\":\"[]\"}','[]','2018-05-28 05:29:13.019367',NULL),(7,11,'Scheduled','{\"Type\":\"Autenticador.BL.Quartz.JobSchadule+Funcionarios, Autenticador, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"AdicionaLinhasPonto\",\"ParameterTypes\":\"[]\",\"Arguments\":\"[]\"}','[]','2018-05-28 05:30:00.335586',NULL),(8,12,'Scheduled','{\"Type\":\"Autenticador.BL.Quartz.JobSchadule+Funcionarios, Autenticador, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"AdicionaLinhasPonto\",\"ParameterTypes\":\"[]\",\"Arguments\":\"[]\"}','[]','2018-05-28 05:30:46.039029',NULL);
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobparameter`
--

DROP TABLE IF EXISTS `jobparameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `jobparameter` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `JobId` int(11) NOT NULL,
  `Name` varchar(40) NOT NULL,
  `Value` longtext,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_JobParameter_JobId_Name` (`JobId`,`Name`),
  KEY `FK_JobParameter_Job` (`JobId`),
  CONSTRAINT `FK_JobParameter_Job` FOREIGN KEY (`JobId`) REFERENCES `job` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobparameter`
--

LOCK TABLES `jobparameter` WRITE;
/*!40000 ALTER TABLE `jobparameter` DISABLE KEYS */;
INSERT INTO `jobparameter` VALUES (1,1,'CurrentCulture','\"pt-BR\"'),(2,1,'CurrentUICulture','\"pt-BR\"'),(3,2,'CurrentCulture','\"pt-BR\"'),(4,2,'CurrentUICulture','\"pt-BR\"'),(5,3,'CurrentCulture','\"pt-BR\"'),(6,3,'CurrentUICulture','\"pt-BR\"'),(7,4,'CurrentCulture','\"pt-BR\"'),(8,4,'CurrentUICulture','\"pt-BR\"'),(9,5,'CurrentCulture','\"pt-BR\"'),(10,5,'CurrentUICulture','\"pt-BR\"'),(11,6,'CurrentCulture','\"pt-BR\"'),(12,6,'CurrentUICulture','\"pt-BR\"'),(13,7,'CurrentCulture','\"pt-BR\"'),(14,7,'CurrentUICulture','\"pt-BR\"'),(15,8,'CurrentCulture','\"pt-BR\"'),(16,8,'CurrentUICulture','\"pt-BR\"');
/*!40000 ALTER TABLE `jobparameter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobqueue`
--

DROP TABLE IF EXISTS `jobqueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `jobqueue` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `JobId` int(11) NOT NULL,
  `Queue` varchar(50) NOT NULL,
  `FetchedAt` datetime(6) DEFAULT NULL,
  `FetchToken` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_JobQueue_QueueAndFetchedAt` (`Queue`,`FetchedAt`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobqueue`
--

LOCK TABLES `jobqueue` WRITE;
/*!40000 ALTER TABLE `jobqueue` DISABLE KEYS */;
INSERT INTO `jobqueue` VALUES (1,1,'default','2018-05-28 05:18:11.000000','0b1f5b1d-47c2-490e-85e7-b820bc9007f8'),(2,2,'default','2018-05-28 05:24:01.000000','2f56bb18-026d-4ad8-a4f6-c878cb97b5ea');
/*!40000 ALTER TABLE `jobqueue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobstate`
--

DROP TABLE IF EXISTS `jobstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `jobstate` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `JobId` int(11) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Reason` varchar(100) DEFAULT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  `Data` longtext,
  PRIMARY KEY (`Id`),
  KEY `FK_JobState_Job` (`JobId`),
  CONSTRAINT `FK_JobState_Job` FOREIGN KEY (`JobId`) REFERENCES `job` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobstate`
--

LOCK TABLES `jobstate` WRITE;
/*!40000 ALTER TABLE `jobstate` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list`
--

DROP TABLE IF EXISTS `list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `list` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Key` varchar(100) NOT NULL,
  `Value` longtext,
  `ExpireAt` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list`
--

LOCK TABLES `list` WRITE;
/*!40000 ALTER TABLE `list` DISABLE KEYS */;
/*!40000 ALTER TABLE `list` ENABLE KEYS */;
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
  `periodo` int(11) NOT NULL,
  `semana` int(11) DEFAULT NULL,
  `data_ponto` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `ponto_status` varchar(100) DEFAULT NULL,
  `obs` text,
  `type_point` char(1) NOT NULL,
  `expediente_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_pontos_expedientes` (`expediente_id`),
  KEY `FK_pontos_funcionarios` (`funcionario_id`),
  CONSTRAINT `FK_pontos_funcionarios` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pontos`
--

LOCK TABLES `pontos` WRITE;
/*!40000 ALTER TABLE `pontos` DISABLE KEYS */;
INSERT INTO `pontos` VALUES (8,5,2,2,'2018-05-24','16:00:00','Em perigo','','S',38),(9,5,2,2,'2018-05-25','16:00:00','Em perigo','','S',38);
/*!40000 ALTER TABLE `pontos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server`
--

DROP TABLE IF EXISTS `server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `server` (
  `Id` varchar(100) NOT NULL,
  `Data` longtext NOT NULL,
  `LastHeartbeat` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server`
--

LOCK TABLES `server` WRITE;
/*!40000 ALTER TABLE `server` DISABLE KEYS */;
INSERT INTO `server` VALUES ('desktop-kjnc04n:10560:21eb0a21-4bac-4644-a4a0-bae38c386d3f','{\"WorkerCount\":20,\"Queues\":[\"default\"],\"StartedAt\":\"2018-05-28T05:29:59.8712755Z\"}','2018-05-28 05:30:00.910470'),('desktop-kjnc04n:1112:39cf8322-bc15-422a-8afa-5d222ddf7ac7','{\"WorkerCount\":20,\"Queues\":[\"default\"],\"StartedAt\":\"2018-05-28T05:29:13.0218684Z\"}','2018-05-28 05:29:13.486184'),('desktop-kjnc04n:1112:68b7ac4a-d18c-4d95-ab1e-09908553307c','{\"WorkerCount\":20,\"Queues\":[\"default\"],\"StartedAt\":\"2018-05-28T05:27:52.0062841Z\"}','2018-05-28 05:28:53.578004'),('desktop-kjnc04n:1928:bf2e9e5e-7dad-48b1-873e-3a7dec0788ce','{\"WorkerCount\":20,\"Queues\":[\"default\"],\"StartedAt\":\"2018-05-28T05:30:45.6988012Z\"}','2018-05-28 05:31:16.991633'),('desktop-kjnc04n:2516:1b172621-3dc1-4cdf-b518-b6355986d730','{\"WorkerCount\":20,\"Queues\":[\"default\"],\"StartedAt\":\"2018-05-28T05:23:41.1904499Z\"}','2018-05-28 05:26:14.672619'),('desktop-kjnc04n:2516:e129eede-4750-4d39-96ab-9e775efe811e','{\"WorkerCount\":20,\"Queues\":[\"default\"],\"StartedAt\":\"2018-05-28T05:26:09.5564493Z\"}','2018-05-28 05:26:11.263728');
/*!40000 ALTER TABLE `server` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `set`
--

DROP TABLE IF EXISTS `set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `set` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Key` varchar(100) NOT NULL,
  `Value` varchar(256) NOT NULL,
  `Score` float NOT NULL,
  `ExpireAt` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_Set_Key_Value` (`Key`,`Value`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `set`
--

LOCK TABLES `set` WRITE;
/*!40000 ALTER TABLE `set` DISABLE KEYS */;
INSERT INTO `set` VALUES (3,'schedule','3',1527540000,NULL),(4,'schedule','4',1527550000,NULL),(5,'schedule','5',1527550000,NULL),(6,'schedule','6',1527550000,NULL),(7,'schedule','7',1527550000,NULL),(8,'schedule','8',1527550000,NULL);
/*!40000 ALTER TABLE `set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `state` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `JobId` int(11) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Reason` varchar(100) DEFAULT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  `Data` longtext,
  PRIMARY KEY (`Id`),
  KEY `FK_HangFire_State_Job` (`JobId`),
  CONSTRAINT `FK_HangFire_State_Job` FOREIGN KEY (`JobId`) REFERENCES `job` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES (1,1,'Scheduled',NULL,'2018-05-28 05:17:44.444590','{\"EnqueueAt\":\"2018-05-28T05:18:34.2161927Z\",\"ScheduledAt\":\"2018-05-28T05:17:34.2161927Z\"}'),(2,1,'Enqueued','Triggered by DelayedJobScheduler','2018-05-28 05:17:59.642865','{\"EnqueuedAt\":\"2018-05-28T05:17:58.6577292Z\",\"Queue\":\"default\"}'),(3,1,'Processing',NULL,'2018-05-28 05:18:12.528167','{\"StartedAt\":\"2018-05-28T05:18:12.1735088Z\",\"ServerId\":\"desktop-kjnc04n:3252:09fee240-f734-4d3a-83b1-5bbe3156c6a8\",\"WorkerId\":\"1f7b0913-a177-4fe2-83b5-feb8886847a9\"}'),(4,2,'Scheduled',NULL,'2018-05-28 05:20:34.646480','{\"EnqueueAt\":\"2018-05-28T05:21:31.7141206Z\",\"ScheduledAt\":\"2018-05-28T05:20:31.7141206Z\"}'),(5,3,'Scheduled',NULL,'2018-05-28 05:23:45.772284','{\"EnqueueAt\":\"2018-05-28T22:03:41.1514247Z\",\"ScheduledAt\":\"2018-05-28T05:23:41.1514247Z\"}'),(6,2,'Enqueued','Triggered by DelayedJobScheduler','2018-05-28 05:23:48.574070','{\"EnqueuedAt\":\"2018-05-28T05:23:46.5974934Z\",\"Queue\":\"default\"}'),(7,2,'Processing',NULL,'2018-05-28 05:24:05.591143','{\"StartedAt\":\"2018-05-28T05:24:03.4887339Z\",\"ServerId\":\"desktop-kjnc04n:2516:1b172621-3dc1-4cdf-b518-b6355986d730\",\"WorkerId\":\"fa58d41d-59ec-455c-b3aa-ac624c118eec\"}'),(8,4,'Scheduled',NULL,'2018-05-28 05:26:15.896154','{\"EnqueueAt\":\"2018-05-28T22:06:09.5479444Z\",\"ScheduledAt\":\"2018-05-28T05:26:09.5479444Z\"}'),(9,5,'Scheduled',NULL,'2018-05-28 05:27:55.250778','{\"EnqueueAt\":\"2018-05-28T22:07:51.9867715Z\",\"ScheduledAt\":\"2018-05-28T05:27:51.9867715Z\"}'),(10,6,'Scheduled',NULL,'2018-05-28 05:29:14.987663','{\"EnqueueAt\":\"2018-05-28T22:09:13.0048588Z\",\"ScheduledAt\":\"2018-05-28T05:29:13.0048588Z\"}'),(11,7,'Scheduled',NULL,'2018-05-28 05:30:01.902133','{\"EnqueueAt\":\"2018-05-28T22:09:59.8387538Z\",\"ScheduledAt\":\"2018-05-28T05:29:59.8387538Z\"}'),(12,8,'Scheduled',NULL,'2018-05-28 05:30:47.621086','{\"EnqueueAt\":\"2018-05-28T22:10:45.7103098Z\",\"ScheduledAt\":\"2018-05-28T05:30:45.7103098Z\"}');
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
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
in _periodo int
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
				_periodo,
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
/*!50003 DROP PROCEDURE IF EXISTS `prd_insert_ponto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prd_insert_ponto`(
in _funcionario int, 
in _data date,
in _hora time,
in _semana int,
in _periodo int,
in _status varchar(45),
in _obs text ,
in _type_point char(1),
in _expediente_id int)
begin    

-- verifica se existe um ponto registrado para o data 
	if(exists(select (1) from pontos p where p.funcionario_id = _funcionario and 
		data_ponto like concat('%', _data,'%') and type_point = _type_point and periodo = _periodo)) then
		select 1 as ret;
    elseif(exists(SELECT (1) FROM expediente_id id INNER JOIN expediente exp on id.id = exp.expediente_id
    where id.funcionario_id = _funcionario and exp.diasemana = _semana and exp.periodo = _periodo and type_point =  _type_point )) then
		select 2 as ret;
    else    
	INSERT INTO inclock.pontos
		(funcionario_id,
		periodo,
		semana,
		data_ponto,
		hora,
		ponto_status,
		obs,
		type_point,
		expediente_id)
	VALUES
		(_funcionario,
		_periodo,
		_semana,
		_data,
		_hora,
		_status,
		_obs,
		_type_point,
		_expediente_id);
		 
		SELECT 'inserido com sucesso ';
		
    end if;
    
    
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
	select ex.expediente_id,ex.hora,ex.diasemana,ex.periodo,ex.type_point,exi.funcionario_id
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
in _periodo int
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
						where exp.diasemana = _semanaEntrada and eid.funcionario_id = _funcionario_id and exp.periodo = _periodo and type_point = 'E')) then
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
				,periodo = _periodo
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

-- Dump completed on 2018-05-28  2:34:09
