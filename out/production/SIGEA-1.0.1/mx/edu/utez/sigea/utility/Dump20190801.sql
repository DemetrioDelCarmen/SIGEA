CREATE DATABASE  IF NOT EXISTS `sigea` /*!40100 DEFAULT CHARACTER SET latin1 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sigea`;
-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: sigea
-- ------------------------------------------------------
-- Server version	8.0.16

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
-- Table structure for table `asesoria`
--

DROP TABLE IF EXISTS `asesoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `asesoria` (
  `id_asesorias` int(11) NOT NULL AUTO_INCREMENT,
  `Status_asesorias` int(1) NOT NULL,
  `materia_id_mat` int(11) NOT NULL,
  `docente_id_docente` int(11) NOT NULL,
  `Tema_asesoria` varchar(45) NOT NULL,
  `Comentario_asesoria` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_asesorias`),
  KEY `fk_asesoria_materia_idx` (`materia_id_mat`),
  KEY `fk_asesoria_docente1_idx` (`docente_id_docente`),
  KEY `Status_asesorias_idx` (`Status_asesorias`),
  CONSTRAINT `Status_asesorias` FOREIGN KEY (`Status_asesorias`) REFERENCES `status_asesoria` (`id_status_asesoria`),
  CONSTRAINT `fk_asesoria_docente1` FOREIGN KEY (`docente_id_docente`) REFERENCES `docente` (`id_Docente`),
  CONSTRAINT `fk_asesoria_materia` FOREIGN KEY (`materia_id_mat`) REFERENCES `materia` (`id_Mat`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asesoria`
--

LOCK TABLES `asesoria` WRITE;
/*!40000 ALTER TABLE `asesoria` DISABLE KEYS */;
INSERT INTO `asesoria` VALUES (1,1,3,2,'JavaScript','No tengo lap');
/*!40000 ALTER TABLE `asesoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asesoriaestudiante`
--

DROP TABLE IF EXISTS `asesoriaestudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `asesoriaestudiante` (
  `id_asesoriaEstudinate` int(11) NOT NULL AUTO_INCREMENT,
  `id_asesoria` int(11) NOT NULL,
  `idEstudianteGrupo` int(11) NOT NULL,
  `Asistio_asesoria` int(1) NOT NULL,
  `idEstudiante` int(11) NOT NULL,
  PRIMARY KEY (`id_asesoriaEstudinate`),
  KEY `fk_asesoria_has_estudiante_has_grupo_estudiante_has_grupo1_idx` (`idEstudianteGrupo`),
  KEY `fk_asesoria_has_estudiante_has_grupo_asesoria1_idx` (`id_asesoria`),
  KEY `asesoria_idEstudiante_idx` (`idEstudiante`),
  CONSTRAINT `asesoria_idEstudiante` FOREIGN KEY (`idEstudiante`) REFERENCES `estudiante` (`id_estudiante`),
  CONSTRAINT `fk_asesoria_has_estudiante_has_grupo_asesoria1` FOREIGN KEY (`id_asesoria`) REFERENCES `asesoria` (`id_asesorias`),
  CONSTRAINT `fk_asesoria_has_estudiante_has_grupo_estudiante_has_grupo1` FOREIGN KEY (`idEstudianteGrupo`) REFERENCES `estudiantegrupo` (`id_estudianteGrupo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asesoriaestudiante`
--

LOCK TABLES `asesoriaestudiante` WRITE;
/*!40000 ALTER TABLE `asesoriaestudiante` DISABLE KEYS */;
INSERT INTO `asesoriaestudiante` VALUES (1,1,1,1,1),(2,1,1,1,1);
/*!40000 ALTER TABLE `asesoriaestudiante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asesoriahnoficial`
--

DROP TABLE IF EXISTS `asesoriahnoficial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `asesoriahnoficial` (
  `id_asesoriaHNOficial` int(11) NOT NULL AUTO_INCREMENT,
  `asesoria_id_asesorias` int(11) NOT NULL,
  `anh_idDia` int(1) NOT NULL,
  `horaInicio` time NOT NULL,
  `horaFin` time NOT NULL,
  PRIMARY KEY (`id_asesoriaHNOficial`,`asesoria_id_asesorias`),
  KEY `fk_asesoria_has_HOficial_asesoria2_idx` (`asesoria_id_asesorias`),
  KEY `anh_idDia_idx` (`anh_idDia`),
  CONSTRAINT `anh_idDia` FOREIGN KEY (`anh_idDia`) REFERENCES `dia` (`id_dia`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_asesoria_has_HOficial_asesoria2` FOREIGN KEY (`asesoria_id_asesorias`) REFERENCES `asesoria` (`id_asesorias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asesoriahnoficial`
--

LOCK TABLES `asesoriahnoficial` WRITE;
/*!40000 ALTER TABLE `asesoriahnoficial` DISABLE KEYS */;
/*!40000 ALTER TABLE `asesoriahnoficial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asesoriahoficial`
--

DROP TABLE IF EXISTS `asesoriahoficial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `asesoriahoficial` (
  `id_asesoriaHOficial` int(11) NOT NULL AUTO_INCREMENT,
  `asesoria_id_asesorias` int(11) NOT NULL,
  `HOficial_id_HOficial` int(11) NOT NULL,
  PRIMARY KEY (`id_asesoriaHOficial`),
  KEY `fk_asesoria_has_HOficial_HOficial1_idx` (`HOficial_id_HOficial`),
  KEY `fk_asesoria_has_HOficial_asesoria1_idx` (`asesoria_id_asesorias`),
  CONSTRAINT `fk_asesoria_has_HOficial_HOficial1` FOREIGN KEY (`HOficial_id_HOficial`) REFERENCES `hoficial` (`id_HOficial`),
  CONSTRAINT `fk_asesoria_has_HOficial_asesoria1` FOREIGN KEY (`asesoria_id_asesorias`) REFERENCES `asesoria` (`id_asesorias`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asesoriahoficial`
--

LOCK TABLES `asesoriahoficial` WRITE;
/*!40000 ALTER TABLE `asesoriahoficial` DISABLE KEYS */;
INSERT INTO `asesoriahoficial` VALUES (1,1,3);
/*!40000 ALTER TABLE `asesoriahoficial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrera`
--

DROP TABLE IF EXISTS `carrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `carrera` (
  `id_carrera` int(3) NOT NULL AUTO_INCREMENT,
  `Nombre_Carrera` varchar(45) NOT NULL,
  `idDivision` int(3) DEFAULT NULL,
  PRIMARY KEY (`id_carrera`),
  KEY `idDivision_idx` (`idDivision`),
  CONSTRAINT `idDivision` FOREIGN KEY (`idDivision`) REFERENCES `carrera` (`id_carrera`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrera`
--

LOCK TABLES `carrera` WRITE;
/*!40000 ALTER TABLE `carrera` DISABLE KEYS */;
INSERT INTO `carrera` VALUES (1,'Infraestructura de Redes Digitales',1),(2,'Desarrollo de Software Multiplataforma',1),(3,'Diseño y Moda Industrial',1),(4,'Diseño Digital',1);
/*!40000 ALTER TABLE `carrera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carreras_materias`
--

DROP TABLE IF EXISTS `carreras_materias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `carreras_materias` (
  `idCarrerasMaterias` int(11) NOT NULL AUTO_INCREMENT,
  `id_carrera` int(11) NOT NULL,
  `cm_id_mat` int(11) NOT NULL,
  PRIMARY KEY (`idCarrerasMaterias`),
  KEY `id_carrera_idx` (`id_carrera`),
  KEY `id_Mat` (`cm_id_mat`),
  CONSTRAINT `cm_id_mat` FOREIGN KEY (`cm_id_mat`) REFERENCES `materia` (`id_Mat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_carrera` FOREIGN KEY (`id_carrera`) REFERENCES `carrera` (`id_carrera`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carreras_materias`
--

LOCK TABLES `carreras_materias` WRITE;
/*!40000 ALTER TABLE `carreras_materias` DISABLE KEYS */;
INSERT INTO `carreras_materias` VALUES (1,2,1),(2,2,2),(3,2,3),(4,2,4),(5,2,5),(6,2,6),(7,2,7),(8,2,8),(9,2,9),(10,1,1),(11,1,2),(12,1,3),(13,1,5),(14,1,7),(15,1,8),(16,1,9),(17,1,10),(18,1,11);
/*!40000 ALTER TABLE `carreras_materias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dia`
--

DROP TABLE IF EXISTS `dia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dia` (
  `id_dia` int(11) NOT NULL AUTO_INCREMENT,
  `dia_dia` varchar(45) NOT NULL,
  PRIMARY KEY (`id_dia`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dia`
--

LOCK TABLES `dia` WRITE;
/*!40000 ALTER TABLE `dia` DISABLE KEYS */;
INSERT INTO `dia` VALUES (1,'Lunes'),(2,'Martes'),(3,'Miercoles'),(4,'Jueves'),(5,'Viernes'),(6,'Sabado');
/*!40000 ALTER TABLE `dia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `division`
--

DROP TABLE IF EXISTS `division`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `division` (
  `id_division` int(3) NOT NULL AUTO_INCREMENT,
  `nombre_division` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_division`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `division`
--

LOCK TABLES `division` WRITE;
/*!40000 ALTER TABLE `division` DISABLE KEYS */;
INSERT INTO `division` VALUES (1,'DATIC');
/*!40000 ALTER TABLE `division` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docente`
--

DROP TABLE IF EXISTS `docente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `docente` (
  `id_Docente` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_docente` varchar(45) NOT NULL,
  `PrimerApellido_Docente` varchar(45) NOT NULL,
  `SegundoApellido_Docente` varchar(45) NOT NULL,
  `usuario_id_User` int(11) NOT NULL,
  PRIMARY KEY (`id_Docente`),
  KEY `fk_docente_usuario1_idx` (`usuario_id_User`),
  CONSTRAINT `fk_docente_usuario1` FOREIGN KEY (`usuario_id_User`) REFERENCES `usuario` (`id_User`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docente`
--

LOCK TABLES `docente` WRITE;
/*!40000 ALTER TABLE `docente` DISABLE KEYS */;
INSERT INTO `docente` VALUES (1,'Bernardo','Huicochea','Naranjo',16),(2,'Hugo Omar','Alejandres','Sánchez',17),(3,'Araceli','Jacobo','Martinez',18),(4,'Miguel Rosemberg','del Pilar','Degante',19),(5,'José Christian','Narvaez','Figueroa',20),(6,'Reynel','Flores','Brito',21),(7,'Silvia','Avilés','Salgado',22),(8,'Verónica','Sánchez','López',23),(9,'Arturo','Villarreal','Santoloalla',24),(10,'Ignacio','Sánchez','Moreno',25),(11,'Oscar Hilario','Salinas','Aviles',26),(12,'María Fernanda','Díaz','Ayala',27),(13,'Oscar','Sánchez','Isidro',28),(14,'Ernesto','Adán','Moreno',29),(15,'Edgardo Hugo','Larrañaga','Ramirez',30),(16,'Critián','Utrilla','de Neira',31),(17,'Shearlly','Guillén','Urrutia',32),(18,'Martha Ligia','Fonseca','Salínas',33),(19,'Cruz','Madero','Cema',34),(20,'Georgina','Castro','Castillo',35),(21,'Karina','Santiago','Santiago',36),(22,'Jazmín','Rogel','Arismendi',37),(23,'José Efraín','Espinoza','Romero',38);
/*!40000 ALTER TABLE `docente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docentes_materias`
--

DROP TABLE IF EXISTS `docentes_materias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `docentes_materias` (
  `id_docente_materia` int(11) NOT NULL AUTO_INCREMENT,
  `id_Docente` int(11) NOT NULL,
  `id_Mat` int(11) NOT NULL,
  PRIMARY KEY (`id_docente_materia`),
  KEY `id_Docente` (`id_Docente`),
  KEY `id_Mat` (`id_Mat`),
  CONSTRAINT `id_Docente` FOREIGN KEY (`id_Docente`) REFERENCES `docente` (`id_Docente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_Mat` FOREIGN KEY (`id_Mat`) REFERENCES `materia` (`id_Mat`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docentes_materias`
--

LOCK TABLES `docentes_materias` WRITE;
/*!40000 ALTER TABLE `docentes_materias` DISABLE KEYS */;
INSERT INTO `docentes_materias` VALUES (1,1,1),(2,2,3),(3,3,4),(4,4,12),(5,5,13),(6,5,3),(7,5,15),(8,5,16),(9,6,3),(10,23,17),(11,23,3),(12,7,13),(13,8,11),(14,8,2),(15,8,18),(16,8,1),(17,9,2),(18,10,19),(19,11,20),(20,11,21),(21,12,11),(22,13,22),(23,13,23),(24,14,24),(25,14,25),(26,15,26),(27,16,27),(28,17,22),(29,18,28),(30,19,29),(31,19,1),(32,20,30),(33,21,31);
/*!40000 ALTER TABLE `docentes_materias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiante`
--

DROP TABLE IF EXISTS `estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `estudiante` (
  `id_estudiante` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_estudiante` varchar(45) NOT NULL,
  `PrimerApellido_estudiante` varchar(45) NOT NULL,
  `SegundoApellido_estudiante` varchar(45) NOT NULL,
  `division_id_division` int(3) NOT NULL,
  `usuario_id_User` int(11) NOT NULL,
  `idCarrera` int(3) NOT NULL,
  `idGenero` int(1) NOT NULL,
  PRIMARY KEY (`id_estudiante`),
  KEY `fk_estudiante_division1_idx` (`division_id_division`),
  KEY `fk_estudiante_usuario1_idx` (`usuario_id_User`),
  KEY `idCarrera_idx` (`idCarrera`),
  KEY `idGenero_idx` (`idGenero`),
  CONSTRAINT `estudiante_ibfk_1` FOREIGN KEY (`idGenero`) REFERENCES `genero` (`idGenero`),
  CONSTRAINT `fk_estudiante_division1` FOREIGN KEY (`division_id_division`) REFERENCES `division` (`id_division`),
  CONSTRAINT `fk_estudiante_usuario1` FOREIGN KEY (`usuario_id_User`) REFERENCES `usuario` (`id_User`),
  CONSTRAINT `idCarrera` FOREIGN KEY (`idCarrera`) REFERENCES `carrera` (`id_carrera`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiante`
--

LOCK TABLES `estudiante` WRITE;
/*!40000 ALTER TABLE `estudiante` DISABLE KEYS */;
INSERT INTO `estudiante` VALUES (1,'Demetrio','Del Carmen','Gómez',1,1,2,1),(2,'José Edgardo','Corrales','Gómez',1,2,2,1),(3,'María Fernanda','Guzmán','Cruz',1,3,2,2),(4,'Fernando Antonio','Pérez','Flores',1,4,2,1),(5,'Violeta Marlene','Arroyo','Zarco',1,5,1,2),(6,'Juan Carlos','De la Cruz','Contreras',1,6,1,1),(7,'Gerardo Javier','Marquez','Benitez',1,7,1,1),(8,'Rebeca Isabel','Adame','Bustamante',1,8,3,2),(9,'Sarahi','Blancas','Aguilar',1,9,3,2),(10,'Alondra','Castillo','Saldaña',1,10,3,2),(11,'Brayan','Castillo','Sanchez',1,11,3,1),(12,'Samanta','Salgado','Bahena',1,12,4,2),(13,'Jesús Emiliano','Barba','Hurtado',1,13,4,1),(14,'Ana Karen','Martínez','Gago',1,14,4,2),(15,'Ricardo','Juárez','Flores',1,15,4,1);
/*!40000 ALTER TABLE `estudiante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiantegrupo`
--

DROP TABLE IF EXISTS `estudiantegrupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `estudiantegrupo` (
  `id_estudianteGrupo` int(11) NOT NULL AUTO_INCREMENT,
  `id_estudiante` int(11) NOT NULL,
  `grupo_id_grupo` int(11) NOT NULL,
  PRIMARY KEY (`id_estudianteGrupo`),
  KEY `fk_estudiante_has_grupo_estudiante1_idx` (`id_estudiante`),
  KEY `fk_estudiante_has_grupo_grupos1_idx` (`grupo_id_grupo`),
  CONSTRAINT `fk_estudiante_has_grupo_estudiante1` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiante` (`id_estudiante`),
  CONSTRAINT `fk_estudiante_has_grupo_grupos1` FOREIGN KEY (`grupo_id_grupo`) REFERENCES `grupo` (`id_grupo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiantegrupo`
--

LOCK TABLES `estudiantegrupo` WRITE;
/*!40000 ALTER TABLE `estudiantegrupo` DISABLE KEYS */;
INSERT INTO `estudiantegrupo` VALUES (1,1,1),(2,2,1);
/*!40000 ALTER TABLE `estudiantegrupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `genero` (
  `idGenero` int(1) NOT NULL AUTO_INCREMENT,
  `genero` varchar(20) NOT NULL,
  PRIMARY KEY (`idGenero`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` VALUES (1,'Masculino'),(2,'Femenino');
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo`
--

DROP TABLE IF EXISTS `grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `grupo` (
  `id_grupo` int(11) NOT NULL AUTO_INCREMENT,
  `periodo_id_periodo` int(11) NOT NULL,
  `Nombre_grupo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_grupo`),
  KEY `fk_grupos_periodo1_idx` (`periodo_id_periodo`),
  CONSTRAINT `fk_grupos_periodo1` FOREIGN KEY (`periodo_id_periodo`) REFERENCES `periodo` (`id_periodo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo`
--

LOCK TABLES `grupo` WRITE;
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
INSERT INTO `grupo` VALUES (1,3,'3D'),(2,3,'3C'),(3,3,'3B');
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hoficial`
--

DROP TABLE IF EXISTS `hoficial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `hoficial` (
  `id_HOficial` int(11) NOT NULL AUTO_INCREMENT,
  `docente_id_Docente` int(11) NOT NULL,
  `dia_id_dia` int(11) NOT NULL,
  `horaInicio` time NOT NULL,
  `horaFin` time NOT NULL,
  PRIMARY KEY (`id_HOficial`),
  KEY `fk_HOficial_docente1_idx` (`docente_id_Docente`),
  KEY `fk_HOficial_dia1_idx` (`dia_id_dia`),
  CONSTRAINT `fk_HOficial_dia1` FOREIGN KEY (`dia_id_dia`) REFERENCES `dia` (`id_dia`),
  CONSTRAINT `fk_HOficial_docente1` FOREIGN KEY (`docente_id_Docente`) REFERENCES `docente` (`id_Docente`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoficial`
--

LOCK TABLES `hoficial` WRITE;
/*!40000 ALTER TABLE `hoficial` DISABLE KEYS */;
INSERT INTO `hoficial` VALUES (1,1,1,'07:00:00','08:00:00'),(2,1,2,'10:00:00','11:00:00'),(3,2,3,'09:00:00','10:00:00'),(4,2,4,'12:00:00','13:00:00'),(5,3,2,'14:00:00','15:00:00'),(6,3,5,'14:00:00','15:00:00');
/*!40000 ALTER TABLE `hoficial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materia`
--

DROP TABLE IF EXISTS `materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `materia` (
  `id_Mat` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_Mat` varchar(45) NOT NULL,
  PRIMARY KEY (`id_Mat`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materia`
--

LOCK TABLES `materia` WRITE;
/*!40000 ALTER TABLE `materia` DISABLE KEYS */;
INSERT INTO `materia` VALUES (1,'Integradora I'),(2,'Sistemas Operativos'),(3,'Aplicaciones Web'),(4,'Bases de Datos para Aplicaciones'),(5,'Calculo Diferencial'),(6,'Probabilidad y Estadística'),(7,'Formación Sociocultural'),(8,'Ingles III'),(9,'Francés III'),(10,'Comnutación en Redes de Datos'),(11,'Infraestructura de Redes en Datos'),(12,'Dirección de Equipos de Alto Rendimiento'),(13,'Programación'),(14,'Administración de proyectos II'),(15,'Base de Datos'),(16,'Desarrollo de Aplicaciones'),(17,'Base de Datos'),(18,'Conmutación de Datos'),(19,'Sistemas Operativos Redes'),(20,'Matemáticas'),(21,'Electrónica'),(22,'Ilustración II'),(23,'Mercadotécnia'),(24,'Software CAD'),(25,'Modelado y Espacios Virtuales'),(26,'Fotografía Digital'),(27,'Proceso de Producción Audiovisual'),(28,'Patronaje Graduación'),(29,'Sistemas de Graduación Industrial'),(30,'Métodos de Confección'),(31,'Metodología de la Investigación');
/*!40000 ALTER TABLE `materia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `periodo`
--

DROP TABLE IF EXISTS `periodo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `periodo` (
  `id_periodo` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_periodo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_periodo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `periodo`
--

LOCK TABLES `periodo` WRITE;
/*!40000 ALTER TABLE `periodo` DISABLE KEYS */;
INSERT INTO `periodo` VALUES (1,'Agosto - Diciembre'),(2,'Enero - Abril'),(3,'Mayo - Agosto');
/*!40000 ALTER TABLE `periodo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `rol` (
  `id_rol` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_rol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Docente'),(2,'Estudiante'),(3,'Administrador');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_asesoria`
--

DROP TABLE IF EXISTS `status_asesoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `status_asesoria` (
  `id_status_asesoria` int(1) NOT NULL AUTO_INCREMENT,
  `status_asesoria` varchar(25) NOT NULL,
  PRIMARY KEY (`id_status_asesoria`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_asesoria`
--

LOCK TABLES `status_asesoria` WRITE;
/*!40000 ALTER TABLE `status_asesoria` DISABLE KEYS */;
INSERT INTO `status_asesoria` VALUES (1,'Solicitada'),(2,'Terminada'),(3,'Cancelada'),(4,'Reagendada');
/*!40000 ALTER TABLE `status_asesoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `usuario` (
  `id_User` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(20) DEFAULT NULL,
  `contrasena` varchar(20) DEFAULT NULL,
  `rol_id_rol` int(11) NOT NULL,
  PRIMARY KEY (`id_User`),
  UNIQUE KEY `idx_usuario_usuario` (`usuario`),
  KEY `fk_usuario_rol1_idx` (`rol_id_rol`),
  CONSTRAINT `fk_usuario_rol1` FOREIGN KEY (`rol_id_rol`) REFERENCES `rol` (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'20173ti064','ti064',2),(2,'20173ti013','ti013',2),(3,'20183tn007','tn007',2),(4,'20183ti155','ti155',2),(5,'20183ti074','ti074',2),(6,'20133ti113','ti133',2),(7,'20183tn001','tn001',2),(8,'20183dm073','dm073',2),(9,'20183dm008','dm008',2),(10,'20183dm014','dm014',2),(11,'20183dm015','dm015',2),(12,'20183dd070','dd070',2),(13,'20183dd128','dd128',2),(14,'20183dd092','dd092',2),(15,'20183dd085','dd085',2),(16,'bernardohuicochea','dc_huicochea',1),(17,'hugoalejandres','dc_alejandres',1),(18,'aracelijacobo','dc_jacobo',1),(19,'migueldelpilar','dc_delpilar',1),(20,'josenarvaez','dc_narvaez',1),(21,'reynelflores','dc_flores',1),(22,'silviaaviles','dc_aviles',1),(23,'veronicasanchez','dc_sanchez',1),(24,'arturovillarreal','dc_villarreal',1),(25,'ignaciosanchez','dc_sanchez',1),(26,'oscarsalinas','dc_salinas',1),(27,'mariadiaz','dc_diaz',1),(28,'oscarsanchez','dc_sanchez',1),(29,'ernestoadan','dc_adan',1),(30,'edgardolarrañaga','dc_larrañaga',1),(31,'critianutrilla','dc_utrilla',1),(32,'shearllyguillen','dc_guillen',1),(33,'marthafonseca','dc_fonseca',1),(34,'cruzmadero','dc_madero',1),(35,'georginacastro','dc_castro',1),(36,'karinasantiago','dc_santiago',1),(37,'jazminrogel','dc_rogel',3),(38,'joseespinoza','dc_espinoza',1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'sigea'
--

--
-- Dumping routines for database 'sigea'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_listadoAsesoriasDocente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listadoAsesoriasDocente`()
begin
	SELECT Nombre_docente, Nombre_Mat, COUNT(id_asesoriaEstudinate),
	horaInicio, horaFin
	FROM
	materia ma JOIN asesoria ase ON ma.id_Mat = ase.materia_id_mat
	JOIN docente doc ON ase.docente_id_docente = doc.id_Docente
	JOIN asesoriahoficial asho ON ase.id_asesorias = asho.asesoria_id_asesorias
	JOIN hoficial hof ON asho.HOficial_id_HOficial = hof.id_HOficial
	JOIN asesoriaestudiante ases ON ase.id_asesorias = ases.id_asesoria
	GROUP BY Nombre_docente, Nombre_Mat,horaInicio,horaFin;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_listaMaterias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listaMaterias`(cidCarrera  int)
begin
		select m.id_Mat, m.Nombre_Mat, c.id_carrera
		from  carrera c  JOIN carreras_materias cm
		on c.id_carrera = cm.id_carrera JOIN 
		materia m ON 
		cm_id_mat = m.id_Mat 	
		WHERE c.id_carrera = cidCarrera;
    
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_listarMateriasDocente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listarMateriasDocente`(in  idMat int)
begin
	
SELECT dc.id_Docente, dc.Nombre_docente,dc.PrimerApellido_Docente,
dc.SegundoApellido_Docente,dc.usuario_id_User, Nombre_Mat FROM docente dc
		JOIN docentes_materias dm ON dc.id_Docente = dm.id_Docente
        JOIN materia mt ON dm.id_Mat = mt.id_Mat
        WHERE mt.id_Mat = idMat;
        
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_obtenerInfoDocente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_obtenerInfoDocente`(in idUsuario_docente int)
begin
SELECT  Nombre_docente, PrimerApellido_docente, SegundoApellido_docente from docente dc JOIN 
		usuario us on dc.usuario_id_User = us.id_User 
        WHERE us.id_User = idUsuario_docente;
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

-- Dump completed on 2019-08-01  1:19:33
