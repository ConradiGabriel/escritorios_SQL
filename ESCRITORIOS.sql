-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: escritorios
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cidades`
--

DROP TABLE IF EXISTS `cidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cidades` (
  `codigo` int NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `data_fundacao` date DEFAULT NULL,
  `pib` decimal(10,2) DEFAULT NULL,
  `qtde_habitantes` int DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cidades`
--

LOCK TABLES `cidades` WRITE;
/*!40000 ALTER TABLE `cidades` DISABLE KEYS */;
INSERT INTO `cidades` VALUES (1,'CRICIÚMA','1880-01-06',40518.91,217311),(2,'IÇARA','1961-12-30',48482.56,57247),(3,'CAMPOS NOVOS','1881-03-30',66611.29,36556),(4,'ARARANGUÁ','1880-04-03',30024.90,68867);
/*!40000 ALTER TABLE `cidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empregados`
--

DROP TABLE IF EXISTS `empregados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empregados` (
  `codigo` int NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `id_cidades` int NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `data_contratacao` date DEFAULT NULL,
  `salario` decimal(10,2) DEFAULT NULL,
  `id_escritorio` int NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk_escritorios_cidades_idx` (`id_escritorio`),
  KEY `fk_escritorios_empregados_idx` (`id_cidades`),
  CONSTRAINT `fk_escritorios_empregados` FOREIGN KEY (`id_cidades`) REFERENCES `cidades` (`codigo`),
  CONSTRAINT `fk_escritorios_escritorio` FOREIGN KEY (`id_escritorio`) REFERENCES `escritorios` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empregados`
--

LOCK TABLES `empregados` WRITE;
/*!40000 ALTER TABLE `empregados` DISABLE KEYS */;
INSERT INTO `empregados` VALUES (1,'VITOR MENDES',1,'VITORMENDES@GMAIL.COM','2010-03-12',18640.39,1);
/*!40000 ALTER TABLE `empregados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `escritorios`
--

DROP TABLE IF EXISTS `escritorios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `escritorios` (
  `codigo` int NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `data_abertura` date DEFAULT NULL,
  `id_cidades` int NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk_escritorios_cidades_idx` (`id_cidades`),
  CONSTRAINT `fk_escritorios_cidades` FOREIGN KEY (`id_cidades`) REFERENCES `cidades` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escritorios`
--

LOCK TABLES `escritorios` WRITE;
/*!40000 ALTER TABLE `escritorios` DISABLE KEYS */;
INSERT INTO `escritorios` VALUES (1,'CONRADI','48998294552','1999-11-26',1),(2,'JEFTER','48991072558','1997-01-12',4),(3,'JOEZER','48991829602','1999-11-20',2),(4,'ELIETE','48996429152','1964-03-26',3);
/*!40000 ALTER TABLE `escritorios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-16 21:55:38
