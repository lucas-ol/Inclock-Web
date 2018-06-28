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
  KEY `FK_expediente_id` (`expediente_id`),
  CONSTRAINT `FK_expediente_id` FOREIGN KEY (`expediente_id`) REFERENCES `expediente_id` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expediente`
--

LOCK TABLES `expediente` WRITE;
/*!40000 ALTER TABLE `expediente` DISABLE KEYS */;
INSERT INTO `expediente` VALUES (50,38,'10:00:00',3,1,'E'),(51,38,'01:00:00',4,1,'S'),(60,43,'00:00:00',2,4,'E'),(61,43,'02:01:00',5,4,'S'),(64,45,'01:00:00',2,4,'E'),(65,45,'02:00:00',5,4,'S'),(66,46,'01:01:00',2,4,'E'),(67,46,'00:00:00',5,4,'S'),(68,47,'23:00:00',2,4,'E'),(69,47,'00:00:00',2,4,'S'),(70,48,'06:00:00',4,1,'E'),(71,48,'01:00:00',5,1,'S'),(72,49,'01:00:00',2,4,'E'),(73,49,'00:00:00',2,4,'S'),(74,50,'01:00:00',2,4,'E'),(75,50,'00:00:00',2,4,'S'),(76,51,'10:00:00',2,4,'E'),(77,51,'10:00:00',2,4,'S'),(80,53,'10:00:00',2,4,'E'),(81,53,'10:00:00',2,4,'S'),(88,57,'12:00:00',3,2,'E'),(89,57,'01:00:00',4,2,'S'),(90,58,'10:15:00',1,4,'E'),(91,58,'14:00:00',1,4,'S');
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
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expediente_id`
--

LOCK TABLES `expediente_id` WRITE;
/*!40000 ALTER TABLE `expediente_id` DISABLE KEYS */;
INSERT INTO `expediente_id` VALUES (38,5),(43,5),(45,5),(46,5),(47,5),(48,5),(49,5),(50,5),(51,5),(53,5),(57,5),(58,5);
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
  `data_ponto` date NOT NULL,
  `hora` time DEFAULT NULL,
  `ponto_status` varchar(100) DEFAULT NULL,
  `obs` text,
  `expediente_id` int(11) DEFAULT NULL,
  `ponto_id` int(11) DEFAULT NULL,
  `type_point` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_pontos_detalhe_pontos` (`ponto_id`),
  KEY `FK_pontos_detalhe_expediente_idx` (`expediente_id`),
  CONSTRAINT `FK_pontos_detalhe_pontos` FOREIGN KEY (`ponto_id`) REFERENCES `pontosxfuncionarios` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=185 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pontos`
--

LOCK TABLES `pontos` WRITE;
/*!40000 ALTER TABLE `pontos` DISABLE KEYS */;
INSERT INTO `pontos` VALUES (73,'2018-06-03',NULL,NULL,NULL,58,39,'E'),(74,'2018-06-28',NULL,NULL,NULL,58,39,'S'),(75,'2018-06-10',NULL,NULL,NULL,58,40,'E'),(76,'2018-06-28',NULL,NULL,NULL,58,40,'S'),(77,'2018-06-17',NULL,NULL,NULL,58,41,'E'),(78,'2018-06-28',NULL,NULL,NULL,58,41,'S'),(79,'2018-06-24',NULL,NULL,NULL,58,42,'E'),(80,'2018-06-28',NULL,NULL,NULL,58,42,'S'),(81,'2018-06-04',NULL,NULL,NULL,43,43,'E'),(82,'2018-06-28',NULL,NULL,NULL,43,43,'S'),(83,'2018-06-04',NULL,NULL,NULL,45,44,'E'),(84,'2018-06-28',NULL,NULL,NULL,45,44,'S'),(85,'2018-06-04',NULL,NULL,NULL,46,45,'E'),(86,'2018-06-28',NULL,NULL,NULL,46,45,'S'),(87,'2018-06-04',NULL,NULL,NULL,47,46,'E'),(88,'2018-06-28',NULL,NULL,NULL,47,46,'S'),(89,'2018-06-04',NULL,NULL,NULL,49,47,'E'),(90,'2018-06-28',NULL,NULL,NULL,49,47,'S'),(91,'2018-06-04',NULL,NULL,NULL,50,48,'E'),(92,'2018-06-28',NULL,NULL,NULL,50,48,'S'),(93,'2018-06-04',NULL,NULL,NULL,51,49,'E'),(94,'2018-06-28',NULL,NULL,NULL,51,49,'S'),(95,'2018-06-04',NULL,NULL,NULL,53,50,'E'),(96,'2018-06-28',NULL,NULL,NULL,53,50,'S'),(97,'2018-06-11',NULL,NULL,NULL,43,51,'E'),(98,'2018-06-28',NULL,NULL,NULL,43,51,'S'),(99,'2018-06-11',NULL,NULL,NULL,45,52,'E'),(100,'2018-06-28',NULL,NULL,NULL,45,52,'S'),(101,'2018-06-11',NULL,NULL,NULL,46,53,'E'),(102,'2018-06-28',NULL,NULL,NULL,46,53,'S'),(103,'2018-06-11',NULL,NULL,NULL,47,54,'E'),(104,'2018-06-28',NULL,NULL,NULL,47,54,'S'),(105,'2018-06-11',NULL,NULL,NULL,49,55,'E'),(106,'2018-06-28',NULL,NULL,NULL,49,55,'S'),(107,'2018-06-11',NULL,NULL,NULL,50,56,'E'),(108,'2018-06-28',NULL,NULL,NULL,50,56,'S'),(109,'2018-06-11',NULL,NULL,NULL,51,57,'E'),(110,'2018-06-28',NULL,NULL,NULL,51,57,'S'),(111,'2018-06-11',NULL,NULL,NULL,53,58,'E'),(112,'2018-06-28',NULL,NULL,NULL,53,58,'S'),(113,'2018-06-18',NULL,NULL,NULL,43,59,'E'),(114,'2018-06-28',NULL,NULL,NULL,43,59,'S'),(115,'2018-06-18',NULL,NULL,NULL,45,60,'E'),(116,'2018-06-28',NULL,NULL,NULL,45,60,'S'),(117,'2018-06-18',NULL,NULL,NULL,46,61,'E'),(118,'2018-06-28',NULL,NULL,NULL,46,61,'S'),(119,'2018-06-18',NULL,NULL,NULL,47,62,'E'),(120,'2018-06-28',NULL,NULL,NULL,47,62,'S'),(121,'2018-06-18',NULL,NULL,NULL,49,63,'E'),(122,'2018-06-28',NULL,NULL,NULL,49,63,'S'),(123,'2018-06-18',NULL,NULL,NULL,50,64,'E'),(124,'2018-06-28',NULL,NULL,NULL,50,64,'S'),(125,'2018-06-18',NULL,NULL,NULL,51,65,'E'),(126,'2018-06-28',NULL,NULL,NULL,51,65,'S'),(127,'2018-06-18',NULL,NULL,NULL,53,66,'E'),(128,'2018-06-28',NULL,NULL,NULL,53,66,'S'),(129,'2018-06-25',NULL,NULL,NULL,43,67,'E'),(130,'2018-06-28',NULL,NULL,NULL,43,67,'S'),(131,'2018-06-25',NULL,NULL,NULL,45,68,'E'),(132,'2018-06-28',NULL,NULL,NULL,45,68,'S'),(133,'2018-06-25',NULL,NULL,NULL,46,69,'E'),(134,'2018-06-28',NULL,NULL,NULL,46,69,'S'),(135,'2018-06-25',NULL,NULL,NULL,47,70,'E'),(136,'2018-06-28',NULL,NULL,NULL,47,70,'S'),(137,'2018-06-25',NULL,NULL,NULL,49,71,'E'),(138,'2018-06-28',NULL,NULL,NULL,49,71,'S'),(139,'2018-06-25',NULL,NULL,NULL,50,72,'E'),(140,'2018-06-28',NULL,NULL,NULL,50,72,'S'),(141,'2018-06-25',NULL,NULL,NULL,51,73,'E'),(142,'2018-06-28',NULL,NULL,NULL,51,73,'S'),(143,'2018-06-25',NULL,NULL,NULL,53,74,'E'),(144,'2018-06-28',NULL,NULL,NULL,53,74,'S'),(145,'2018-06-05',NULL,NULL,NULL,38,75,'E'),(146,'2018-06-28',NULL,NULL,NULL,38,75,'S'),(147,'2018-06-05',NULL,NULL,NULL,57,76,'E'),(148,'2018-06-28',NULL,NULL,NULL,57,76,'S'),(149,'2018-06-07',NULL,NULL,NULL,38,77,'E'),(150,'2018-06-28',NULL,NULL,NULL,38,77,'S'),(151,'2018-06-07',NULL,NULL,NULL,57,78,'E'),(152,'2018-06-28',NULL,NULL,NULL,57,78,'S'),(153,'2018-06-12',NULL,NULL,NULL,38,79,'E'),(154,'2018-06-28',NULL,NULL,NULL,38,79,'S'),(155,'2018-06-12',NULL,NULL,NULL,57,80,'E'),(156,'2018-06-28',NULL,NULL,NULL,57,80,'S'),(157,'2018-06-14',NULL,NULL,NULL,38,81,'E'),(158,'2018-06-28',NULL,NULL,NULL,38,81,'S'),(159,'2018-06-14',NULL,NULL,NULL,57,82,'E'),(160,'2018-06-28',NULL,NULL,NULL,57,82,'S'),(161,'2018-06-19',NULL,NULL,NULL,38,83,'E'),(162,'2018-06-28',NULL,NULL,NULL,38,83,'S'),(163,'2018-06-19',NULL,NULL,NULL,57,84,'E'),(164,'2018-06-28',NULL,NULL,NULL,57,84,'S'),(165,'2018-06-21',NULL,NULL,NULL,38,85,'E'),(166,'2018-06-28',NULL,NULL,NULL,38,85,'S'),(167,'2018-06-21',NULL,NULL,NULL,57,86,'E'),(168,'2018-06-28',NULL,NULL,NULL,57,86,'S'),(169,'2018-06-26',NULL,NULL,NULL,38,87,'E'),(170,'2018-06-28',NULL,NULL,NULL,38,87,'S'),(171,'2018-06-26',NULL,NULL,NULL,57,88,'E'),(172,'2018-06-28',NULL,NULL,NULL,57,88,'S'),(173,'2018-06-28',NULL,NULL,NULL,38,89,'E'),(174,'2018-06-28',NULL,NULL,NULL,38,89,'S'),(175,'2018-06-28',NULL,NULL,NULL,57,90,'E'),(176,'2018-06-28',NULL,NULL,NULL,57,90,'S'),(177,'2018-06-06',NULL,NULL,NULL,48,91,'E'),(178,'2018-06-28',NULL,NULL,NULL,48,91,'S'),(179,'2018-06-13',NULL,NULL,NULL,48,92,'E'),(180,'2018-06-28',NULL,NULL,NULL,48,92,'S'),(181,'2018-06-20',NULL,NULL,NULL,48,93,'E'),(182,'2018-06-28',NULL,NULL,NULL,48,93,'S'),(183,'2018-06-27',NULL,NULL,NULL,48,94,'E'),(184,'2018-06-28',NULL,NULL,NULL,48,94,'S');
/*!40000 ALTER TABLE `pontos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pontosxfuncionarios`
--

DROP TABLE IF EXISTS `pontosxfuncionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pontosxfuncionarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `funcionario_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_pontos_funcionarios` (`funcionario_id`),
  CONSTRAINT `FK_pontos_funcionarios` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pontosxfuncionarios`
--

LOCK TABLES `pontosxfuncionarios` WRITE;
/*!40000 ALTER TABLE `pontosxfuncionarios` DISABLE KEYS */;
INSERT INTO `pontosxfuncionarios` VALUES (39,5),(40,5),(41,5),(42,5),(43,5),(44,5),(45,5),(46,5),(47,5),(48,5),(49,5),(50,5),(51,5),(52,5),(53,5),(54,5),(55,5),(56,5),(57,5),(58,5),(59,5),(60,5),(61,5),(62,5),(63,5),(64,5),(65,5),(66,5),(67,5),(68,5),(69,5),(70,5),(71,5),(72,5),(73,5),(74,5),(75,5),(76,5),(77,5),(78,5),(79,5),(80,5),(81,5),(82,5),(83,5),(84,5),(85,5),(86,5),(87,5),(88,5),(89,5),(90,5),(91,5),(92,5),(93,5),(94,5);
/*!40000 ALTER TABLE `pontosxfuncionarios` ENABLE KEYS */;
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
	 
        INSERT INTO funcionarios
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
	INSERT INTO pontos
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
/*!50003 DROP PROCEDURE IF EXISTS `prd_in_point_null` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prd_in_point_null`(
in _funcionario int,
in _entrada time,
in _dataEntrada date,
in _expediente int,
in _saida time,
in _dataSaida time
)
begin 
/*declare exit handler for sqlexception
begin
	rollback;
 end;*/ 
declare id int;
start transaction;
begin 
	if(!exists(select 1 from pontos where type_point = 'E' and expediente_id = _expediente and data_ponto = _dataEntrada )) then
	insert into pontosxfuncionarios(funcionario_id) values (_funcionario);
    set id = last_insert_id();
		-- Entrada --
		INSERT INTO pontos
		(
		data_ponto,
		expediente_id,
		ponto_id,
        type_point)
		VALUES
		(
		_dataEntrada,
		_expediente,
		id,
        'E');
		
		-- saida --
		INSERT INTO pontos
		(
		data_ponto,
		expediente_id,
		ponto_id,
        type_point)
		VALUES
		(
		_dataSaida,
		_expediente,
		id,
        'S');        
        commit;
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
/*!50003 DROP PROCEDURE IF EXISTS `prd_se_pontos_data` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prd_se_pontos_data`(
in _funcionario int,
in _data varchar(10))
begin 

with etr as (SELECT ptf.id,
    data_ponto dta_entrada,
    hora as entrada,
    ponto_status ,
    obs,
    expediente_id,
    ptf.funcionario_id
FROM pontos pt inner join pontosxfuncionarios ptf on  pt.ponto_id = ptf.id where funcionario_id = _funcionario and type_point = 'E'),
sda as (SELECT ptf.id,
    data_ponto dta_saida,
    hora as saida,
    ponto_status ,
    obs,
    expediente_id,
    ptf.funcionario_id
FROM pontos pt inner join pontosxfuncionarios ptf on  pt.ponto_id = ptf.id where funcionario_id = _funcionario and type_point = 'S')
select etr.id,etr.funcionario_id, dta_entrada,entrada,etr.ponto_status,dta_entrada,saida,sda.ponto_status,concat(etr.ponto_status,',',sda.ponto_status) as obs from sda inner join etr on sda.id = etr.id where dta_entrada like concat('%',_data,'%');

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

-- Dump completed on 2018-06-28 20:51:32