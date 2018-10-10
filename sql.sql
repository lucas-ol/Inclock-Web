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
  `funcionario_id` int(11) NOT NULL,
  `expediente_id` int(11) NOT NULL,
  `entrada` varchar(8) DEFAULT NULL,
  `saida` varchar(8) DEFAULT NULL,
  `dta_entrada` date NOT NULL,
  `dta_saida` date NOT NULL,
  `obs` text,
  PRIMARY KEY (`funcionario_id`,`expediente_id`,`dta_entrada`),
  UNIQUE KEY `id` (`id`),
  KEY `FK_expediente_pontos` (`expediente_id`),
  CONSTRAINT `FK_Funcionarios_Pontos` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_expediente_pontos` FOREIGN KEY (`expediente_id`) REFERENCES `expediente_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pontos`
--

LOCK TABLES `pontos` WRITE;
/*!40000 ALTER TABLE `pontos` DISABLE KEYS */;
INSERT INTO `pontos` VALUES (71,5,38,'','','2018-10-02','2018-10-02',NULL),(72,5,38,'','','2018-10-04','2018-10-04',NULL),(73,5,38,'','','2018-10-09','2018-10-09',NULL),(74,5,38,'','','2018-10-11','2018-10-11',NULL),(75,5,38,'','','2018-10-16','2018-10-16',NULL),(76,5,38,'','','2018-10-18','2018-10-18',NULL),(77,5,38,'','','2018-10-23','2018-10-23',NULL),(78,5,38,'','','2018-10-25','2018-10-25',NULL),(79,5,38,'','','2018-10-30','2018-10-30',NULL),(63,5,58,'','','2018-10-14','2018-10-14',NULL),(64,5,58,'','','2018-10-21','2018-10-21',NULL),(65,5,58,'','','2018-10-28','2018-10-28',NULL),(66,5,60,'','','2018-10-01','2018-10-01',NULL),(67,5,60,'','','2018-10-08','2018-10-08',NULL),(68,5,60,'','','2018-10-15','2018-10-15',NULL),(69,5,60,'','','2018-10-22','2018-10-22',NULL),(70,5,60,'','','2018-10-29','2018-10-29',NULL),(80,7,62,'','','2018-10-01','2018-10-01',NULL),(81,7,62,'','','2018-10-08','2018-10-08',NULL),(82,7,62,'','','2018-10-15','2018-10-15',NULL),(83,7,62,'','','2018-10-22','2018-10-22',NULL),(84,7,62,'','','2018-10-29','2018-10-29',NULL),(85,7,63,'','','2018-10-03','2018-10-03',NULL),(86,7,63,'','','2018-10-10','2018-10-10',NULL),(87,7,63,'','','2018-10-17','2018-10-17',NULL),(88,7,63,'','','2018-10-24','2018-10-24',NULL),(89,7,63,'','','2018-10-31','2018-10-31',NULL);
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

-- Dump completed on 2018-10-10 18:33:41
