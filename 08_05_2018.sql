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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
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
  CONSTRAINT `FK_expediente_funcionarios` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`)
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
-- Table structure for table `registro_pontos`
--

DROP TABLE IF EXISTS `registro_pontos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `registro_pontos` (
  `id` varchar(30) NOT NULL,
  `data_ponto` date NOT NULL,
  `entrada` time DEFAULT NULL,
  `saida` time DEFAULT NULL,
  `funcionario_id` int(11) NOT NULL,
  `latitude` varchar(60) DEFAULT '0',
  `logitude` varchar(60) DEFAULT '0',
  `Periodo` int(11) NOT NULL,
  `status` varchar(45) DEFAULT NULL,
  `obs` text,
  PRIMARY KEY (`data_ponto`,`Periodo`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK_registropontos_funcionarios` (`funcionario_id`),
  CONSTRAINT `FK_registropontos_funcionarios` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_pontos`
--

LOCK TABLES `registro_pontos` WRITE;
/*!40000 ALTER TABLE `registro_pontos` DISABLE KEYS */;
/*!40000 ALTER TABLE `registro_pontos` ENABLE KEYS */;
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
in _dia date,
in _hora time,
in _periodo int,
in _logitude varchar(60),
in _latitude varchar(60),
in _status varchar(45))
begin
	declare entrada time;
	declare saida time;
	
	if(!exists(select * from registro_pontos where funcionario_id = _funcionario and data_ponto = _dia and periodo = _periodo)) then
		INSERT INTO registro_pontos
		(id,
		data_ponto,
		entrada,		
		funcionario_id,
		latitude,
		logitude,
		Periodo,
		status)
		VALUES
		(uuid_short(),
		_dia,
		_hora,		
		_funcionario,
		_latitude,
		_logitude,
		_periodo,		
		_status);        
    end if;
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

-- Dump completed on 2018-05-08  0:10:30
