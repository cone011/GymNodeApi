-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: gymdb
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `alumno`
--

DROP TABLE IF EXISTS `alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumno` (
  `IdAlumno` bigint NOT NULL AUTO_INCREMENT,
  `IdUsuario` bigint NOT NULL,
  `Cedula` varchar(20) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `FechaNacimiento` date NOT NULL,
  `Edad` smallint NOT NULL,
  `Direccion` varchar(250) DEFAULT NULL,
  `Telefono` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `EstaEliminado` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`IdAlumno`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno`
--

LOCK TABLES `alumno` WRITE;
/*!40000 ALTER TABLE `alumno` DISABLE KEYS */;
INSERT INTO `alumno` VALUES (1,1,'41914912','Juan Caimen','2022-06-29',28,'Srg. Villalba','0971-320-425','prueba',_binary '\0'),(2,1,'41914912','Juan Caimen','2022-06-29',28,'Srg. Villalba','0971-320-425','jjcaimen@gmail.com',_binary '\0'),(3,1,'41914912','Juan Caimen','1993-08-26',28,'Srg. Villalba','0971-320-425','jjcaimen@gmail.com',_binary '\0');
/*!40000 ALTER TABLE `alumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dias`
--

DROP TABLE IF EXISTS `dias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dias` (
  `IdDia` smallint NOT NULL AUTO_INCREMENT,
  `Dia` varchar(50) NOT NULL,
  PRIMARY KEY (`IdDia`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dias`
--

LOCK TABLES `dias` WRITE;
/*!40000 ALTER TABLE `dias` DISABLE KEYS */;
INSERT INTO `dias` VALUES (1,'LUNES'),(2,'MARTES'),(3,'MIERCOLES'),(4,'JUEVES'),(5,'VIERNES'),(6,'SABADO'),(7,'DOMINGO');
/*!40000 ALTER TABLE `dias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dieta`
--

DROP TABLE IF EXISTS `dieta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dieta` (
  `IdDieta` bigint NOT NULL AUTO_INCREMENT,
  `IdAlumno` bigint NOT NULL,
  `Alumno` varchar(100) NOT NULL,
  `IdTrainner` smallint NOT NULL,
  `Trainner` varchar(100) NOT NULL,
  `FechaCarga` date NOT NULL,
  `Observacion` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`IdDieta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dieta`
--

LOCK TABLES `dieta` WRITE;
/*!40000 ALTER TABLE `dieta` DISABLE KEYS */;
/*!40000 ALTER TABLE `dieta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dietadetalle`
--

DROP TABLE IF EXISTS `dietadetalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dietadetalle` (
  `IdDietaDetalle` bigint NOT NULL AUTO_INCREMENT,
  `IdDieta` bigint NOT NULL,
  `IdFormaComida` smallint NOT NULL,
  `IdDia` smallint NOT NULL,
  `Concepto` varchar(500) NOT NULL,
  PRIMARY KEY (`IdDietaDetalle`),
  KEY `IdDieta_idx` (`IdDieta`),
  KEY `IdFormaComida_idx` (`IdFormaComida`),
  KEY `IdDia_idx` (`IdDia`),
  CONSTRAINT `IdDia` FOREIGN KEY (`IdDia`) REFERENCES `dias` (`IdDia`) ON UPDATE CASCADE,
  CONSTRAINT `IdDieta` FOREIGN KEY (`IdDieta`) REFERENCES `dieta` (`IdDieta`) ON DELETE CASCADE,
  CONSTRAINT `IdFormaComida` FOREIGN KEY (`IdFormaComida`) REFERENCES `formacomida` (`IdFormaComida`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dietadetalle`
--

LOCK TABLES `dietadetalle` WRITE;
/*!40000 ALTER TABLE `dietadetalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `dietadetalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ejercicio`
--

DROP TABLE IF EXISTS `ejercicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ejercicio` (
  `IdEjercicio` smallint unsigned NOT NULL AUTO_INCREMENT,
  `Codigo` varchar(50) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `IdTipoEjercicio` smallint NOT NULL,
  `TipoEjercicio` varchar(100) NOT NULL,
  `ImagenUrl` varchar(250) DEFAULT NULL,
  `VideoUrl` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`IdEjercicio`),
  KEY `IdTipoEjercicio_idx` (`IdTipoEjercicio`),
  CONSTRAINT `FKTipoEjercicio` FOREIGN KEY (`IdTipoEjercicio`) REFERENCES `tipoejercicio` (`IdTipoEjercicio`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ejercicio`
--

LOCK TABLES `ejercicio` WRITE;
/*!40000 ALTER TABLE `ejercicio` DISABLE KEYS */;
INSERT INTO `ejercicio` VALUES (4,'PM','PM',2,'PRUEBA','DASD','DASDSA'),(6,'ch','prueba',2,'Brazo','https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/Svelte_Logo.svg/250px-Svelte_Logo.svg.png','https://youtu.be/CB57CuT4smM'),(7,'ch2','prueba 2',2,'Hombro','https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/Svelte_Logo.svg/250px-Svelte_Logo.svg.png','https://youtu.be/4kHl4FoK1Ys'),(8,'PR','PRUEBA',2,'Hombro','','https://www.youtube.com/watch?v=WAGbq3A9HfA&list=RDWAGbq3A9HfA&start_radio=1');
/*!40000 ALTER TABLE `ejercicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formacomida`
--

DROP TABLE IF EXISTS `formacomida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formacomida` (
  `IdFormaComida` smallint NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`IdFormaComida`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formacomida`
--

LOCK TABLES `formacomida` WRITE;
/*!40000 ALTER TABLE `formacomida` DISABLE KEYS */;
INSERT INTO `formacomida` VALUES (1,'Desayuno'),(2,'Media Mañana'),(3,'Almuerzo'),(4,'Media Tarde'),(5,'Merienda'),(6,'Cena');
/*!40000 ALTER TABLE `formacomida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rutina`
--

DROP TABLE IF EXISTS `rutina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rutina` (
  `IdRutina` bigint NOT NULL AUTO_INCREMENT,
  `IdAlumno` bigint NOT NULL,
  `Alumno` varchar(100) NOT NULL,
  `IdTrainner` smallint NOT NULL,
  `Trainner` varchar(100) NOT NULL,
  `Fecha` date NOT NULL,
  `Observacion` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`IdRutina`),
  KEY `IdAlumno_idx` (`IdAlumno`),
  CONSTRAINT `IdAlumno` FOREIGN KEY (`IdAlumno`) REFERENCES `alumno` (`IdAlumno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rutina`
--

LOCK TABLES `rutina` WRITE;
/*!40000 ALTER TABLE `rutina` DISABLE KEYS */;
/*!40000 ALTER TABLE `rutina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rutinadetalle`
--

DROP TABLE IF EXISTS `rutinadetalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rutinadetalle` (
  `IdRutinaDetalle` bigint NOT NULL AUTO_INCREMENT,
  `IdRutina` bigint NOT NULL,
  `IdDia` smallint NOT NULL,
  `IdEjercicio` smallint NOT NULL,
  `Observacion` varchar(500) NOT NULL,
  PRIMARY KEY (`IdRutinaDetalle`),
  KEY `IdRutinaDetalleEjercicio_idx` (`IdRutina`),
  KEY `IdDiaRutinaDetalle_idx` (`IdDia`) /*!80000 INVISIBLE */,
  KEY `IdEjercicioRutina_idx` (`IdEjercicio`),
  CONSTRAINT `IdDiaRutina` FOREIGN KEY (`IdDia`) REFERENCES `dias` (`IdDia`),
  CONSTRAINT `IdEjercicioRutina` FOREIGN KEY (`IdEjercicio`) REFERENCES `ejercicio` (`IdTipoEjercicio`),
  CONSTRAINT `IdRutina` FOREIGN KEY (`IdRutina`) REFERENCES `rutina` (`IdRutina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rutinadetalle`
--

LOCK TABLES `rutinadetalle` WRITE;
/*!40000 ALTER TABLE `rutinadetalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `rutinadetalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoejercicio`
--

DROP TABLE IF EXISTS `tipoejercicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipoejercicio` (
  `IdTipoEjercicio` smallint NOT NULL AUTO_INCREMENT,
  `Codigo` varchar(50) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`IdTipoEjercicio`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoejercicio`
--

LOCK TABLES `tipoejercicio` WRITE;
/*!40000 ALTER TABLE `tipoejercicio` DISABLE KEYS */;
INSERT INTO `tipoejercicio` VALUES (2,'PR','PIERNA'),(3,'BC','Biceps'),(4,'TC','Triceps'),(6,'HM','HOMBRO'),(7,'HM2','HOMBRO2'),(8,'undefined','undefined'),(9,'undefined','undefined'),(10,'HM10','HOMBRO 10'),(12,'undefined','undefined'),(13,'HM2','HOMBRO2'),(15,'HM8','HOMBRO8'),(16,'HM11','HOMBRO 11'),(17,'HM12','HOMBRO 12');
/*!40000 ALTER TABLE `tipoejercicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainner`
--

DROP TABLE IF EXISTS `trainner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainner` (
  `IdTrainner` smallint NOT NULL AUTO_INCREMENT,
  `IdUsuario` bigint NOT NULL,
  `Cedula` varchar(20) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `FechaNacimiento` date NOT NULL,
  `Edad` smallint NOT NULL,
  `Direccion` varchar(250) DEFAULT NULL,
  `Telefono` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `EstaEliminado` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`IdTrainner`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainner`
--

LOCK TABLES `trainner` WRITE;
/*!40000 ALTER TABLE `trainner` DISABLE KEYS */;
/*!40000 ALTER TABLE `trainner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `IdUsuario` bigint NOT NULL AUTO_INCREMENT,
  `User` varchar(50) NOT NULL,
  `Password` varchar(150) NOT NULL,
  `EsTrainner` bit(1) NOT NULL DEFAULT b'0',
  `EstaEliminado` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`IdUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'jjcaimen@gmail.com','$2a$12$kgRkPRrCE2PvuwyCgIeP9.0DgsVJMdQZ./b24jEIlDPNJbeqd1Qr6',_binary '\0',_binary '\0');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-25 15:07:06
