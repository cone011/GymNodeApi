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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoejercicio`
--

LOCK TABLES `tipoejercicio` WRITE;
/*!40000 ALTER TABLE `tipoejercicio` DISABLE KEYS */;
INSERT INTO `tipoejercicio` VALUES (2,'PR','PIERNA'),(3,'BC','Biceps'),(4,'TC','Triceps'),(6,'HM','HOMBRO'),(7,'HM2','HOMBRO2'),(8,'undefined','undefined'),(9,'undefined','undefined'),(10,'HM10','HOMBRO 10'),(12,'undefined','undefined'),(13,'HM2','HOMBRO2'),(15,'HM8','HOMBRO8'),(16,'HM11','HOMBRO 11'),(17,'HM12','HOMBRO 12'),(18,'dsadasd','dasdasda');
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

--
-- Dumping events for database 'gymdb'
--

--
-- Dumping routines for database 'gymdb'
--
/*!50003 DROP PROCEDURE IF EXISTS `new_procedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_procedure`(
	IN paIdDieta BIGINT,
    IN paIdFormaComida SMALLINT,
    IN paIdDia SMALLINT,
    IN paConcepto VARCHAR(500),
    IN paIdDietaDetalle BIGINT
)
BEGIN
	SET paConcepto = RTRIM(LTRIM(paConcepto));
    START TRANSACTION;
    UPDATE DietaDetalle SET IdDieta = paIdDieta,
							IdFormaComida = paIdFormaComida,
							IdDia = paIdDia,
							Concepto = paConcepto
					 WHERE  IdDietaDetalle = paIdDietaDetalle;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_DeleteAlumno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_DeleteAlumno`(
	IN paIdAlumno BIGINT
)
BEGIN
	START TRANSACTION;
    UPDATE Alumno SET EstaEliminado = 1
				WHERE IdAlumno = paIdAlumno;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_DeleteDieta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_DeleteDieta`(
	IN paIdDieta BIGINT
)
BEGIN
	START TRANSACTION;
    DELETE FROM Dieta WHERE IdDieta = paIdDieta;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_DeleteEjercicio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_DeleteEjercicio`(
	IN paIdEjercicio SMALLINT
)
BEGIN
	START TRANSACTION;
    DELETE FROM Ejercicio 
    WHERE IdEjercicio = paIdEjercicio;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_DeleteTipoEjercicio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_DeleteTipoEjercicio`(
	IN paIdTipoEjercicio SMALLINT
)
BEGIN
	START TRANSACTION;
    DELETE FROM TipoEjercicio WHERE IdTipoEjercicio = paIdTipoEjercicio;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_DeleteUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_DeleteUsuario`(
	IN paIdUsuario BIGINT
)
BEGIN
	START TRANSACTION;
    UPDATE Usuario SET EstaEliminado = 1
			      WHERE IdUsuario = paIdUsuario;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_GetAllAlumno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_GetAllAlumno`()
BEGIN
	SELECT A.* FROM Alumno A;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_GetAllDias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_GetAllDias`()
BEGIN
	SELECT D.* FROM Dias D;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_GetAllDieta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_GetAllDieta`()
BEGIN
	SELECT D.* FROM Dieta D;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_GetAllDietaDetalle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_GetAllDietaDetalle`()
BEGIN
	SELECT DD.* FROM DietaDetalle DD;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_GetAllEejercicio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_GetAllEejercicio`()
BEGIN
	SELECT E.* FROM Ejercicio E;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_GetAllEjercicio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_GetAllEjercicio`()
BEGIN
	SELECT E.* FROM Ejercicio E;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_GetAllFormaComida` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_GetAllFormaComida`()
BEGIN
	SELECT FC.* FROM FormaComida FC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_GetAllTipoEjercicio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_GetAllTipoEjercicio`()
BEGIN
	SELECT TP.IdTipoEjercicio,
		   TP.Codigo,
           TP.Nombre
	FROM TipoEjercicio TP;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_GetAllUsuarios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_GetAllUsuarios`()
BEGIN
	SELECT U.* FROM Usuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_GetDietaByDate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_GetDietaByDate`(
	IN paFechaInicio DATE,
    IN paFechaFin DATE,
    IN paIdAlumno BIGINT,
    IN paIdTrainner SMALLINT
)
BEGIN
	SELECT D.* FROM Dieta D
    WHERE CONVERT(D.Fecha, DATE) BETWEEN paFechaInicio AND paFechaFin
    AND(D.IdAlumno = paIdAlumno OR paIdAlumno IS NULL)
    AND(D.IdTrainner = paIdTrainner OR paIdTrainner IS NULL);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_GetEjercicioByIdTipoEjercicio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_GetEjercicioByIdTipoEjercicio`(
	IN paIdTipoEjercicio SMALLINT
)
BEGIN
	SELECT E.* FROM Ejercicio E
    WHERE E.IdTipoEjercicio = paIdTipoEjercicio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_GetObjectByBaseDieta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_GetObjectByBaseDieta`(
	IN paIdDieta BIGINT
)
BEGIN
	SELECT DD.* FROM DietaDetalle DD
    WHERE DD.IdDieta = paIdDieta;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_GetObjectByIdAlumno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_GetObjectByIdAlumno`(
	IN paIdAlumno BIGINT
)
BEGIN
	SELECT A.* FROM Alumno A
    WHERE A.IdAlumno = paIdAlumno;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_GetObjectByIdDieta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_GetObjectByIdDieta`(
	IN paIdDieta BIGINT
)
BEGIN
	SELECT D.* FROM Dieta D
    WHERE D.IdDieta = paIdDieta;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_GetObjectByIdDietaDetalle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_GetObjectByIdDietaDetalle`(
	IN paIdDietaDetalle BIGINT
)
BEGIN
	SELECT DD.* FROM DietaDetalle
    WHERE DD.IdDietaDetalle = paIdDietaDetalle;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_GetObjectByIdEjercicio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_GetObjectByIdEjercicio`(
	IN paIdEjercicio SMALLINT
)
BEGIN
	SELECT E.*  FROM Ejercicio
    WHERE E.IdEjercicio = paIdEjercicio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_GetObjectByIdTipoEjercicio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_GetObjectByIdTipoEjercicio`(
	IN paIdTipoEjercicio SMALLINT
)
BEGIN
	SELECT TP.IdTipoEjercicio,
		   TP.Codigo,
           TP.Nombre
	FROM TipoEjercicio TP
    WHERE TP.IdTipoEjercicio = paIdTipoEjercicio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_GetObjectByIdUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_GetObjectByIdUsuario`(
	IN paIdUsuario BIGINT
)
BEGIN
	SELECT U.* FROM Usuario U
    WHERE U.IdUsuario = paIdUsuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_GetSearchAlumno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_GetSearchAlumno`(
	IN paSQLSearch VARCHAR(50)
)
BEGIN
	
    SET paSQLSearch = CONCAT('%',LTRIM(RTRIM(paSQLSearch)),'%');

    SELECT A.IdAlumno, A.IdUsuario, A.Cedula, A.Nombre,
		   A.Telefono, A.Email
	FROM Alumno A 
    WHERE (A.Cedula LIKE paSQLSearch OR A.Nombre LIKE paSQLSearch);
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_GetValidUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_GetValidUser`(
	IN paUser VARCHAR(50)
)
BEGIN
	DECLARE paExiste BIT DEFAULT 0;
	SET paUser = RTRIM(LTRIM(paUser));
  
    SELECT paExiste = IF(ISNULL(U.IdUsuario), 1, 0)
    FROM Usuario U WHERE U.User = paUser;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_GetValidUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_GetValidUsuario`(
	IN paUser VARCHAR(50),
    IN paPassword VARCHAR(150)
)
BEGIN
	SET paUser = LTRIM(RTRIM(paUser));
    SET paPassword = LTRIM(RTRIM(paPassword));
    
    SELECT U.IdUsuario, U.User, U.EsTrainner
	FROM Usuario U 
    WHERE U.User = paUser AND U.Password = paPassword
    AND U.EstaEliminado = 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_InsertAlumno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_InsertAlumno`(
	IN paIdUsuario BIGINT,
    IN paCedula VARCHAR(50),
    IN paNombre VARCHAR(100),
    IN paFechaNacimiento DATE,
    IN paEdad SMALLINT,
    IN paDireccion VARCHAR(250),
    IN paTelefono VARCHAR(50),
    IN paEmail VARCHAR(100)
)
BEGIN
	SET paCedula = LTRIM(RTRIM(paCedula));
    SET paNombre = LTRIM(RTRIM(paNombre));
    SET paDireccion = LTRIM(RTRIM(paDireccion));
    SET paTelefono = LTRIM(RTRIM(paTelefono));
    SET paEmail = LTRIM(RTRIM(paEmail));
    START TRANSACTION;
    INSERT INTO Alumno(IdUsuario,
					   Cedula,
                       Nombre,
                       FechaNacimiento,
                       Edad,
                       Direccion,
                       Telefono,
                       Email)
				VALUES(paIdUsuario,
					   paCedula,
                       paNombre,
                       paFechaNacimiento,
                       paEdad,
                       paDireccion,
                       paTelefono,
                       paEmail);
		COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_InsertarDieta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_InsertarDieta`(
	IN paIdAlumno BIGINT,
    IN paAlumno VARCHAR(100),
    IN paIdTrainner SMALLINT,
    IN paTrainner VARCHAR(100),
    IN paFechaCarga DATETIME,
    IN paObservacion VARCHAR(300)
)
BEGIN
	SET paObservacion = RTRIM(LTRIM(paObservacion));
    START TRANSACTION;
    INSERT INTO Dieta(IdAlumno,
					  Alumno,
                      IdTrainner,
                      Trainner,
                      FechaCarga,
                      Observacion)
				VALUES(paIdAlumno,
					   paAlumno,
                       paIdTrainner,
                       paTrainner,
                       paFechaCarga,
                       paObservacion);
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_InsertDietaDetalle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_InsertDietaDetalle`(
	IN paIdDieta BIGINT,
    IN paIdFormaComida SMALLINT,
    IN paIdDia SMALLINT,
    IN paConcepto VARCHAR(500)
)
BEGIN
	SET paConcepto = RTRIM(LTRIM(paConcepto));
    START TRANSACTION;
    INSERT INTO DietaDetalle(IdDieta,
							 IdFormaComida,
                             IdDia,
                             Concepto)
					   VALUES(paIdDieta,
							  paIdFormaComida,
                              paIdDia,
                              paConcepto);
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_InsertEjercicio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_InsertEjercicio`(
	IN paCodigo VARCHAR(50),
    IN paNombre VARCHAR(100),
    IN paIdTipoEjercicio SMALLINT,
    IN paTipoEjercicio VARCHAR(100),
    IN paImagenUrl VARCHAR(250),
    IN paVideoUrl VARCHAR(250)
)
BEGIN
	SET paCodigo = LTRIM(RTRIM(paCodigo));
    SET paNombre = LTRIM(RTRIM(paNombre));
    SET paIdTipoEjercicio = LTRIM(RTRIM(paIdTipoEjercicio));
    SET paImagenUrl = LTRIM(RTRIM(paImagenUrl));
    SET paVideoUrl = LTRIM(RTRIM(paVideoUrl));
	START TRANSACTION;
    INSERT INTO Ejercicio(Codigo,
						  Nombre,
                          IdTipoEjercicio,
                          TipoEjercicio,
                          ImagenUrl,
                          VideoUrl)
					VALUES(paCodigo,
						   paNombre,
						   paIdTipoEjercicio,
                           paTipoEjercicio,
                           paImagenUrl,
                           paVideoUrl);
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_InsertTipoEjercicio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_InsertTipoEjercicio`(
	IN paCodigo VARCHAR(50),
    IN paNombre VARCHAR(100)
)
BEGIN
	START TRANSACTION;
	SET paCodigo = LTRIM(RTRIM(paCodigo));
    SET paNombre = LTRIM(RTRIM(paNombre));
	INSERT INTO TipoEjercicio(Codigo,
						      Nombre)
						VALUES(paCodigo,
							   paNombre);
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_InsertUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_InsertUsuario`(
	IN paUser VARCHAR(50),
    IN paPassword VARCHAR(150),
    IN paEsTrainner BIT(1)
)
BEGIN
	SET paUser = LTRIM(RTRIM(paUser));
    SET paPassword = LTRIM(RTRIM(paPassword));
	START TRANSACTION;
	INSERT INTO Usuario(User,
					    Password,
                        EsTrainner)
				  VALUES(paUser,
						 paPassword,
                         IF(paEsTrainner IS NOT NULL, paEsTrainner, 0));
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_UpdateAlumno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_UpdateAlumno`(
	IN paIdUsuario BIGINT,
    IN paCedula VARCHAR(50),
    IN paNombre VARCHAR(100),
    IN paFechaNacimiento DATE,
    IN paEdad SMALLINT,
    IN paDireccion VARCHAR(250),
    IN paTelefono VARCHAR(50),
    IN paEmail VARCHAR(100),
    IN paIdAlumno BIGINT
)
BEGIN
	SET paCedula = LTRIM(RTRIM(paCedula));
    SET paNombre = LTRIM(RTRIM(paNombre));
    SET paDireccion = LTRIM(RTRIM(paDireccion));
    SET paTelefono = LTRIM(RTRIM(paTelefono));
    SET paEmail = LTRIMT(RTRIM(paEmail));
    START TRANSACTION;
    UPDATE Alumno SET IdUsuario = paIdUsuario,
					  Cedula = paCedula,
					  Nombre = paNombre,
					  FechaNacimiento = paFechaNacimiento,
					  Edad = paEdad,
					  Direccion = paDireccion,
					  Telefono = paTelefono,
					  Email = paEmail
				WHERE IdAlumno = paIdAlumno;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_UpdateDieta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_UpdateDieta`(
	IN paIdAlumno BIGINT,
    IN paAlumno VARCHAR(100),
    IN paIdTrainner SMALLINT,
    IN paTrainner VARCHAR(100),
    IN paFechaCarga DATETIME,
    IN paObservacion VARCHAR(300),
    IN paIdDieta BIGINT
)
BEGIN
	SET paObservacion = RTRIM(LTRIM(paObservacion));
    START TRANSACTION;
    UPDATE Dieta SET  IdAlumno = paIdAlumno,
					  Alumno = paAlumno,
                      IdTrainner = paIdTrainner,
                      Trainner = paTrainner,
                      FechaCarga = paFechaCarga,
                      Observacion = paObservacion
			   WHERE  IdDieta = paIdDieta;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_UpdateDietaDetalle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_UpdateDietaDetalle`(
	IN paIdDieta BIGINT,
    IN paIdFormaComida SMALLINT,
    IN paIdDia SMALLINT,
    IN paConcepto VARCHAR(500),
    IN paIdDietaDetalle BIGINT
)
BEGIN
	SET paConcepto = RTRIM(LTRIM(paConcepto));
    START TRANSACTION;
    UPDATE DietaDetalle SET IdDieta = paIdDieta,
							IdFormaComida = paIdFormaComida,
							IdDia = paIdDia,
							Concepto = paConcepto
					 WHERE  IdDietaDetalle = paIdDietaDetalle;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_UpdateEjercicio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_UpdateEjercicio`(
	IN paCodigo VARCHAR(50),
    IN paNombre VARCHAR(100),
    IN paIdTipoEjercicio SMALLINT,
    IN paTipoEjercicio VARCHAR(100),
    IN paImagenUrl VARCHAR(250),
    IN paVideoUrl VARCHAR(250),
    IN paIdEjercicio SMALLINT
)
BEGIN
	SET paCodigo = LTRIM(RTRIM(paCodigo));
    SET paNombre = LTRIM(RTRIM(paNombre));
    SET paIdTipoEjercicio = LTRIM(RTRIM(paIdTipoEjercicio));
    SET paImagenUrl = LTRIM(RTRIM(paImagenUrl));
    SET paVideoUrl = LTRIM(RTRIM(paVideoUrl));
	START TRANSACTION;
    UPDATE Ejercicio SET Codigo = paCodigo,
						 Nombre = paNombre,
                         IdTipoEjercicio = paIdTipoEjercicio,
                         TipoEjercicio = paTipoEjercicio,
                         ImagenUrl = paImagenUrl,
                         VideoUrl = paVideoUrl
				  WHERE IdEjercicio = paIdEjercicio;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_UpdateTipoEjercicio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_UpdateTipoEjercicio`(
	IN paCodigo VARCHAR(50),
    IN paNombre VARCHAR(100),
    IN paIdTipoEjercicio SMALLINT
)
BEGIN
	START TRANSACTION;
	SET paCodigo = LTRIM(RTRIM(paCodigo));
    SET paNombre = LTRIM(RTRIM(paNombre));
    UPDATE TipoEjercicio SET Codigo = paCodigo,
							 Nombre = paNombre
					    WHERE IdTipoEjercicio = paIdTipoEjercicio;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_UpdateUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_UpdateUsuario`(
	IN paUser VARCHAR(50),
    IN paPassword VARCHAR(150),
    IN paEsTrainner BIT(1),
    IN paIdUsuario BIGINT
)
BEGIN
	SET paUser = LTRIM(RTRIM(paUser));
    SET paPassword = LTRIM(RTRIM(paPassword));
	START TRANSACTION;
    UPDATE Usuario SET User = paUser,
					   Password = paPassword,
                       EsTrainner = IF(paEsTrainner IS NOT NULL, paEsTrainner, 0)
				 WHERE IdUsuario = paIdUsuario;
	COMMIT;
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

-- Dump completed on 2022-08-08 12:29:55
