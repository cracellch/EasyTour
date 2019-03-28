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
  PRIMARY KEY (`id_adm`)
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
  `nom_gui` varchar(200) NOT NULL,
  `app_gui` varchar(200) NOT NULL,
  `apm_gui` varchar(200) NOT NULL,
  `tel_gui` varchar(200) NOT NULL,
  `dir_gui` varchar(200) NOT NULL,
  `cor_gui` varchar(200) NOT NULL,
  `eda_gui` varchar(200) NOT NULL,
  `cur_gui` varchar(200) NOT NULL,
  `rfc_gui` varchar(200) NOT NULL,
  `pas_gui` varchar(200) NOT NULL,
  `cal_gui` varchar(10) DEFAULT NULL,
  `status_gui` varchar(45) NOT NULL,
  `rep_gui` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_gui`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guia`
--

LOCK TABLES `guia` WRITE;
/*!40000 ALTER TABLE `guia` DISABLE KEYS */;
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
  PRIMARY KEY (`id_lug`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lugar`
--

LOCK TABLES `lugar` WRITE;
/*!40000 ALTER TABLE `lugar` DISABLE KEYS */;
INSERT INTO `lugar` VALUES (1,'Palacio Nacional','Zocalo','Es sede del poder ejecutivo federal. Aquí se encuentra el despacho oficial del presidente de México. Se puede visitar algunas partes de su interior para admirar los bellos murales de Diego Rivera.','RESOURCE/Palacio-Nacional.jpg','50',0),(2,'Templo Mayor','Zocalo','el templo mayor fue el centro ceremonial de los aztecas. Hay una exposición permanente de los objetos encontrados.','RESOURCE/Templo-Mayor.jpg','54',0),(3,'Palacio de Mineria','Bellas Artes','Una de las construcciones más relevantes dentro de la arquitectura mexicana','RESOURCE/Palacio-Mineria.jpg','63',0),(4,'Catedral Metropolitana','Zocalo','es la sede de la Arquidiócesis Primada de México y se ubica en el lado norte de la Plaza de la Constitución en el Centro Histórico de la Ciudad de México, en la Delegación Cuauhtémoc.','RESOURCE/catedral-metropolitana.jpg','38',0),(5,'Palacio de Bellas Artes','Bellas Artes','Atracciones turísticas y museos, Artes escénicas, Museo de arte, Sitio histórico, Sala de conciertos, Teatro de la ópera','RESOURCE/Palacio-Bellas-Artes.jpg','35',0),(6,'Torre Latinoamericana','Bellas Artes','Atracciones turísticas y museos, Punto de referencia','RESOURCE/Torre-Latino.jpg','25',0),(7,'Palacio Postal','Bellas Artes','Atracciones turísticas y museos, Edificio gubernamental, Sitio histórico','RESOURCE/Palacio-Postal.jpg','30',0),(8,'Museo Memoria y Tolerancia','Bellas Artes','Atracciones turísticas y museos, Museo de historia','RESOURCE/Museo-MyT.jpg','35',0),(9,'Hemiciclo a Benito Juarez','Bellas Artes','Atracciones turísticas y museos, Monumento','RESOURCE/H-Benito.jpg','25',0),(10,'Museo del Estanquillo','Zocalo','El Museo del Estanquillo fue fundado en el año 2006 a partir del deseo de Carlos Monsiváis de compartir su colección con el pueblo mexicano','RESOURCE/Museo-E.jpg','30',0),(11,'Museo Mexicano del Diseño','Zocalo','exposiciones democráticas, colectivas y abiertas a todo el público con varias convocatorias a toda la comunidad nacional e internacional para participar en diversos concursos de cartel.','RESOURCE/Museo-MD.jpg','35',0),(12,'Museo de la ciudad de Mexico','Zocalo','exhibiciones temporales que muestran la obra de artistas plásticos que expresan, a través de sus colores y técnicas, las múltiples formas de mirar y sentir la Ciudad de México;','RESOURCE/Museo-CDMX.jpg','35',0);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruta`
--

LOCK TABLES `ruta` WRITE;
/*!40000 ALTER TABLE `ruta` DISABLE KEYS */;
/*!40000 ALTER TABLE `ruta` ENABLE KEYS */;
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
  `id_tur` int(11) NOT NULL,
  PRIMARY KEY (`id_tou`),
  KEY `id_gui` (`id_gui`),
  KEY `id_tur` (`id_tur`),
  CONSTRAINT `tour_ibfk_1` FOREIGN KEY (`id_gui`) REFERENCES `guia` (`id_gui`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `tour_ibfk_2` FOREIGN KEY (`id_tur`) REFERENCES `turista` (`id_tur`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour`
--

LOCK TABLES `tour` WRITE;
/*!40000 ALTER TABLE `tour` DISABLE KEYS */;
/*!40000 ALTER TABLE `tour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turista`
--

DROP TABLE IF EXISTS `turista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `turista` (
  `id_tur` int(11) NOT NULL AUTO_INCREMENT,
  `nom_tur` varchar(200) NOT NULL,
  `app_tur` varchar(200) NOT NULL,
  `apm_tur` varchar(200) NOT NULL,
  `cor_tur` varchar(200) NOT NULL,
  `pas_tur` varchar(200) NOT NULL,
  `status_tur` varchar(45) NOT NULL,
  `rep_gui` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_tur`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turista`
--

LOCK TABLES `turista` WRITE;
/*!40000 ALTER TABLE `turista` DISABLE KEYS */;
INSERT INTO `turista` VALUES (1,'fH+AW/ztebFKCfamVmusfQ==','fH+AW/ztebFKCfamVmusfQ==','fH+AW/ztebFKCfamVmusfQ==','cc@cc.com','fH+AW/ztebFKCfamVmusfQ==','activo',NULL);
/*!40000 ALTER TABLE `turista` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-27 23:26:29
