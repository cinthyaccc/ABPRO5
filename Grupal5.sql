-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: telovendohorario
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `contactos`
--

DROP TABLE IF EXISTS `contactos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contactos` (
  `id_contacto` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `teléfono` varchar(20) NOT NULL,
  `correo_electronico` varchar(50) NOT NULL,
  PRIMARY KEY (`id_contacto`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `contactos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contactos`
--

LOCK TABLES `contactos` WRITE;
/*!40000 ALTER TABLE `contactos` DISABLE KEYS */;
/*!40000 ALTER TABLE `contactos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingresos`
--

DROP TABLE IF EXISTS `ingresos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingresos` (
  `id_ingreso` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `fecha_hora_ingreso` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_ingreso`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `ingresos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingresos`
--

LOCK TABLES `ingresos` WRITE;
/*!40000 ALTER TABLE `ingresos` DISABLE KEYS */;
INSERT INTO `ingresos` VALUES (1,1,'2023-05-04 22:11:29'),(2,2,'2023-05-04 22:11:29'),(3,3,'2023-05-04 22:11:29'),(4,4,'2023-05-04 22:11:29'),(5,5,'2023-05-04 22:11:29'),(6,6,'2023-05-04 22:11:29'),(7,7,'2023-05-04 22:11:29'),(8,8,'2023-05-04 22:11:29');
/*!40000 ALTER TABLE `ingresos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `contraseña` varchar(50) NOT NULL,
  `zona_horaria` varchar(50) DEFAULT 'UTC-2',
  `género` enum('Masculino','Femenino','Otro') NOT NULL,
  `teléfono` varchar(20) NOT NULL,
  `id_contacto` int DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `id_contacto` (`id_contacto`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_contacto`) REFERENCES `contactos` (`id_contacto`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Juan','Pérez','password1','UTC-2','Masculino','12345678',NULL),(2,'María','García','password2','UTC-2','Femenino','87654321',NULL),(3,'Pedro','Ramírez','password3','UTC-2','Masculino','55555555',NULL),(4,'Ana','Martínez','password4','UTC-2','Femenino','44444444',NULL),(5,'Luis','Rodríguez','password5','UTC-2','Masculino','33333333',NULL),(6,'Lucía','López','password6','UTC-2','Femenino','22222222',NULL),(7,'Jorge','Sánchez','password7','UTC-2','Masculino','11111111',NULL),(8,'Marta','Fernández','password8','UTC-2','Femenino','99999999',NULL);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'telovendohorario'
--

--
-- Dumping routines for database 'telovendohorario'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-05 22:21:46
