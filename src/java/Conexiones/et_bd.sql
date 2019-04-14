-- MySQL dump 10.13  Distrib 5.7.21, for Win32 (AMD64)
--
-- Host: localhost    Database: et_bd
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
-- Current Database: `et_bd`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `et_bd` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `et_bd`;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id_adm` int(11) NOT NULL AUTO_INCREMENT,
  `nom_adm` varchar(200) DEFAULT NULL,
  `pas_adm` varchar(200) DEFAULT NULL,
  `id_usu` int(11) NOT NULL,
  PRIMARY KEY (`id_adm`),
  KEY `id_usu` (`id_usu`),
  CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`id_usu`) REFERENCES `usuario` (`id_usu`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guia`
--

DROP TABLE IF EXISTS `guia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guia` (
  `id_gui` int(11) NOT NULL AUTO_INCREMENT,
  `tel_gui` varchar(200) NOT NULL,
  `dir_gui` varchar(200) NOT NULL,
  `eda_gui` varchar(200) NOT NULL,
  `cur_gui` varchar(200) NOT NULL,
  `rfc_gui` varchar(200) NOT NULL,
  `cal_gui` varchar(10) DEFAULT NULL,
  `id_usu` int(11) NOT NULL,
  PRIMARY KEY (`id_gui`),
  KEY `id_usu` (`id_usu`),
  CONSTRAINT `guia_ibfk_1` FOREIGN KEY (`id_usu`) REFERENCES `usuario` (`id_usu`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guia`
--

LOCK TABLES `guia` WRITE;
/*!40000 ALTER TABLE `guia` DISABLE KEYS */;
INSERT INTO `guia` VALUES (1,'5556789824','Calle 2','25','Algo','Algo','6',2),(2,'5556789824','Calle 2','25','Algo','Algo','6',3),(3,'5556789824','Calle 2','25','Algo','Algo','6',4);
/*!40000 ALTER TABLE `guia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lugar`
--

DROP TABLE IF EXISTS `lugar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lugar` (
  `id_lug` int(11) NOT NULL AUTO_INCREMENT,
  `nom_lug` varchar(200) NOT NULL,
  `ubi_lug` varchar(200) NOT NULL,
  `des_lug` varchar(200) NOT NULL,
  `img_lug` varchar(100) DEFAULT NULL,
  `dur_lug` varchar(3) DEFAULT NULL,
  `cos_lug` int(11) NOT NULL,
  `lat_lug` decimal(8,6) DEFAULT NULL,
  `lon_lug` decimal(8,6) DEFAULT NULL,
  PRIMARY KEY (`id_lug`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lugar`
--

LOCK TABLES `lugar` WRITE;
/*!40000 ALTER TABLE `lugar` DISABLE KEYS */;
INSERT INTO `lugar` VALUES (1,'Palacio Nacional','Zocalo','Es sede del poder ejecutivo federal. Aquí se encuentra el despacho oficial del presidente de México. Se puede visitar algunas partes de su interior para admirar los bellos murales de Diego Rivera.','RESOURCE/Palacio-Nacional.jpg','50',0,19.432444,-99.131193),(2,'Templo Mayor','Zocalo','el templo mayor fue el centro ceremonial de los aztecas. Hay una exposición permanente de los objetos encontrados.','RESOURCE/Templo-Mayor.jpg','54',0,19.434601,-99.131881),(3,'Palacio de Mineria','Bellas Artes','Una de las construcciones más relevantes dentro de la arquitectura mexicana','RESOURCE/Palacio-Mineria.jpg','63',0,19.435806,-99.139507),(4,'Catedral Metropolitana','Zocalo','es la sede de la Arquidiócesis Primada de México y se ubica en el lado norte de la Plaza de la Constitución en el Centro Histórico de la Ciudad de México, en la Delegación Cuauhtémoc.','RESOURCE/catedral-metropolitana.jpg','38',0,19.434388,-99.133080),(5,'Palacio de Bellas Artes','Bellas Artes','Atracciones turísticas y museos, Artes escénicas, Museo de arte, Sitio histórico, Sala de conciertos, Teatro de la ópera','RESOURCE/Palacio-Bellas-Artes.jpg','35',0,19.435180,-99.141210),(6,'Torre Latinoamericana','Bellas Artes','Atracciones turísticas y museos, Punto de referencia','RESOURCE/Torre-Latino.jpg','25',0,19.433918,-99.140652),(7,'Palacio Postal','Bellas Artes','Atracciones turísticas y museos, Edificio gubernamental, Sitio histórico','RESOURCE/Palacio-Postal.jpg','30',0,19.435554,-99.140236),(8,'Museo Memoria y Tolerancia','Bellas Artes','Atracciones turísticas y museos, Museo de historia','RESOURCE/Museo-MyT.jpg','35',0,19.434226,-99.144560),(9,'Hemiciclo a Benito Juarez','Bellas Artes','Atracciones turísticas y museos, Monumento','RESOURCE/H-Benito.jpg','25',0,19.435092,-99.144079),(10,'Museo del Estanquillo','Zocalo','El Museo del Estanquillo fue fundado en el año 2006 a partir del deseo de Carlos Monsiváis de compartir su colección con el pueblo mexicano','RESOURCE/Museo-E.jpg','30',0,19.433262,-99.136165),(11,'Museo Mexicano del Diseño','Zocalo','exposiciones democráticas, colectivas y abiertas a todo el público con varias convocatorias a toda la comunidad nacional e internacional para participar en diversos concursos de cartel.','RESOURCE/Museo-MD.jpg','35',0,19.433355,-99.134556),(12,'Museo de la ciudad de Mexico','Zocalo','exhibiciones temporales que muestran la obra de artistas plásticos que expresan, a través de sus colores y técnicas, las múltiples formas de mirar y sentir la Ciudad de México;','RESOURCE/Museo-CDMX.jpg','35',0,19.429241,-99.132147);
/*!40000 ALTER TABLE `lugar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ruta`
--

DROP TABLE IF EXISTS `ruta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ruta` (
  `id_rut` int(11) NOT NULL AUTO_INCREMENT,
  `id_lug` int(11) NOT NULL,
  `id_tou` int(11) NOT NULL,
  PRIMARY KEY (`id_rut`),
  KEY `id_lug` (`id_lug`),
  KEY `id_tou` (`id_tou`),
  CONSTRAINT `ruta_ibfk_1` FOREIGN KEY (`id_lug`) REFERENCES `lugar` (`id_lug`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `ruta_ibfk_2` FOREIGN KEY (`id_tou`) REFERENCES `tour` (`id_tou`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruta`
--

LOCK TABLES `ruta` WRITE;
/*!40000 ALTER TABLE `ruta` DISABLE KEYS */;
INSERT INTO `ruta` VALUES (1,1,1),(2,10,1),(3,12,1),(4,2,2),(5,4,2),(6,2,3),(7,4,3),(8,3,4);
/*!40000 ALTER TABLE `ruta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipousuario`
--

DROP TABLE IF EXISTS `tipousuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipousuario` (
  `id_tpu` tinyint(1) NOT NULL AUTO_INCREMENT,
  `nom_tpu` varchar(7) NOT NULL,
  PRIMARY KEY (`id_tpu`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipousuario`
--

LOCK TABLES `tipousuario` WRITE;
/*!40000 ALTER TABLE `tipousuario` DISABLE KEYS */;
INSERT INTO `tipousuario` VALUES (1,'admin'),(2,'guia'),(3,'turista');
/*!40000 ALTER TABLE `tipousuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tour`
--

DROP TABLE IF EXISTS `tour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tour` (
  `id_tou` int(11) NOT NULL AUTO_INCREMENT,
  `fec_tou` date NOT NULL,
  `cos_tou` int(5) NOT NULL,
  `dur_tou` int(5) NOT NULL,
  `id_gui` int(11) NOT NULL,
  `id_usu` int(11) NOT NULL,
  PRIMARY KEY (`id_tou`),
  KEY `id_gui` (`id_gui`),
  KEY `id_tur` (`id_usu`),
  CONSTRAINT `tour_ibfk_1` FOREIGN KEY (`id_gui`) REFERENCES `guia` (`id_gui`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `tour_ibfk_2` FOREIGN KEY (`id_usu`) REFERENCES `usuario` (`id_usu`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour`
--

LOCK TABLES `tour` WRITE;
/*!40000 ALTER TABLE `tour` DISABLE KEYS */;
INSERT INTO `tour` VALUES (1,'2019-04-17',200,115,1,1),(2,'2019-04-03',200,92,1,1),(3,'2019-04-03',200,92,2,1),(4,'2019-04-18',200,63,1,1);
/*!40000 ALTER TABLE `tour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id_usu` int(11) NOT NULL AUTO_INCREMENT,
  `nom_usu` varchar(200) DEFAULT NULL,
  `app_usu` varchar(200) DEFAULT NULL,
  `apm_usu` varchar(200) DEFAULT NULL,
  `cor_usu` varchar(60) NOT NULL,
  `pas_usu` varchar(200) NOT NULL,
  `status_usu` varchar(45) DEFAULT NULL,
  `rep_usu` varchar(30) DEFAULT NULL,
  `id_tpu` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_usu`),
  KEY `id_tpu` (`id_tpu`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_tpu`) REFERENCES `tipousuario` (`id_tpu`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'fH+AW/ztebFKCfamVmusfQ==','fH+AW/ztebFKCfamVmusfQ==','fH+AW/ztebFKCfamVmusfQ==','cc@cc.com','fH+AW/ztebFKCfamVmusfQ==','activo',NULL,3),(2,'Jorge','Gomez','Perez','jorgep@gmail.com','fH+AW/ztebFKCfamVmusfQ==','activo',NULL,2),(3,'Aaron','S.','Perez','aspe@gmail.com','fH+AW/ztebFKCfamVmusfQ==','activo',NULL,2),(4,'Manuel','G.','P.','elmane@gmail.com','fH+AW/ztebFKCfamVmusfQ==','activo',NULL,2),(5,'rqlvv1iMgC7tvZlYLAOM/g==','ze8+HtMMjkq4sa2fmzAy2w==','VCXrh0YxZpXgO49KjgV/Iw==','jorgp@de.es','fH+AW/ztebFKCfamVmusfQ==','activo',NULL,3),(6,'oB6KW/WM2XmUcwpNP/ZxxQ==','iBNmsFO4LD/5aA7ql373ZA==','xtjyDiMUXmuI2QoPKrTGqA==','diasos@de.es','fH+AW/ztebFKCfamVmusfQ==','bloqueado',NULL,2),(7,'cSEitc7EZLeNAvxtvZS0GQ==','cSEitc7EZLeNAvxtvZS0GQ==','cSEitc7EZLeNAvxtvZS0GQ==','kk@kk.com','cSEitc7EZLeNAvxtvZS0GQ==','bloqueado',NULL,3);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'et_bd'
--
/*!50003 DROP PROCEDURE IF EXISTS `addUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addUser`(nom varchar(200), app varchar(200), apm varchar(200), cor varchar(60), pass varchar(200), stat varchar(20), tip tinyint(1))
BEGIN
declare valre varchar(20);
set valre="sinregistro";
select cor_usu into valre from usuario where cor_usu = cor;
if(valre="sinregistro")then 
insert into usuario values (0,nom,app,apm,cor,pass,stat,null,tip);
end if;
END ;;
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

-- Dump completed on 2019-04-14 13:49:12
