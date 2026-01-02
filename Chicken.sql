-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: chicken
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `bebidas`
--

DROP TABLE IF EXISTS `bebidas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bebidas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(500) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `precio` varchar(500) NOT NULL,
  `imagen` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bebidas`
--

LOCK TABLES `bebidas` WRITE;
/*!40000 ALTER TABLE `bebidas` DISABLE KEYS */;
INSERT INTO `bebidas` VALUES (1,'Gaseosa','Coca Cola 1L','3.00','imag4.jpg'),(2,'Gaseosa','Inca Kola personal','3.00','imag5.png');
/*!40000 ALTER TABLE `bebidas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrito_bebidas`
--

DROP TABLE IF EXISTS `carrito_bebidas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrito_bebidas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_p` int NOT NULL,
  `id_usuario` int NOT NULL,
  `fecha` varchar(500) DEFAULT NULL,
  `hora` varchar(500) DEFAULT NULL,
  `estado` varchar(45) DEFAULT 'pendiente',
  `cantidad` int DEFAULT '1',
  `id_pedido` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id_pr_idx` (`id_p`),
  KEY `id_us_idx` (`id_usuario`),
  KEY `id_ped_idx` (`id_pedido`),
  CONSTRAINT `id_ped` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id`),
  CONSTRAINT `id_pr` FOREIGN KEY (`id_p`) REFERENCES `bebidas` (`id`),
  CONSTRAINT `id_us` FOREIGN KEY (`id_usuario`) REFERENCES `clientes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito_bebidas`
--

LOCK TABLES `carrito_bebidas` WRITE;
/*!40000 ALTER TABLE `carrito_bebidas` DISABLE KEYS */;
INSERT INTO `carrito_bebidas` VALUES (8,1,1,NULL,NULL,'pagado',1,9),(10,2,1,NULL,NULL,'pagado',1,12),(11,1,3,NULL,NULL,'pagado',1,15);
/*!40000 ALTER TABLE `carrito_bebidas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrito_complementos`
--

DROP TABLE IF EXISTS `carrito_complementos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrito_complementos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_p` int DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  `fecha` varchar(45) DEFAULT NULL,
  `hora` varchar(45) DEFAULT NULL,
  `estado` varchar(45) DEFAULT 'pendiente',
  `cantidad` int DEFAULT '1',
  `id_pedido` int DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id_pr_idx` (`id_p`),
  KEY `id_us_idx` (`id_usuario`),
  KEY `id_ped_idx` (`id_pedido`),
  CONSTRAINT `id_prs` FOREIGN KEY (`id_p`) REFERENCES `complementos` (`id`),
  CONSTRAINT `id_ps` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id`),
  CONSTRAINT `id_usddd` FOREIGN KEY (`id_usuario`) REFERENCES `clientes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito_complementos`
--

LOCK TABLES `carrito_complementos` WRITE;
/*!40000 ALTER TABLE `carrito_complementos` DISABLE KEYS */;
INSERT INTO `carrito_complementos` VALUES (1,1,1,NULL,NULL,'pagado',1,6),(2,1,1,NULL,NULL,'pagado',1,6),(4,1,1,NULL,NULL,'pagado',1,7),(5,1,1,NULL,NULL,'pagado',1,8),(6,1,1,NULL,NULL,'pagado',1,9),(7,1,1,NULL,NULL,'pagado',1,12),(8,11,1,NULL,NULL,'pendiente',1,1);
/*!40000 ALTER TABLE `carrito_complementos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrito_compra`
--

DROP TABLE IF EXISTS `carrito_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrito_compra` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int NOT NULL,
  `importe` decimal(10,2) NOT NULL,
  `fecha_agregado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito_compra`
--

LOCK TABLES `carrito_compra` WRITE;
/*!40000 ALTER TABLE `carrito_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrito_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrito_productos`
--

DROP TABLE IF EXISTS `carrito_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrito_productos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_p` int NOT NULL,
  `id_usuario` int DEFAULT NULL,
  `fecha` varchar(45) DEFAULT NULL,
  `hora` varchar(45) DEFAULT NULL,
  `estado` varchar(45) DEFAULT 'pendiente',
  `cantidad` int DEFAULT '1',
  `id_pedido` int DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id_produ_idx` (`id_p`),
  KEY `id_cli_idx` (`id_usuario`),
  KEY `id_ped_idx` (`id_pedido`),
  CONSTRAINT `id_cli` FOREIGN KEY (`id_usuario`) REFERENCES `clientes` (`id`),
  CONSTRAINT `id_produ` FOREIGN KEY (`id_p`) REFERENCES `productos` (`id`),
  CONSTRAINT `id_spe` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito_productos`
--

LOCK TABLES `carrito_productos` WRITE;
/*!40000 ALTER TABLE `carrito_productos` DISABLE KEYS */;
INSERT INTO `carrito_productos` VALUES (3,3,1,NULL,NULL,'pagado',1,5),(29,2,1,NULL,NULL,'pagado',1,5),(30,2,1,NULL,NULL,'pagado',1,5),(59,1,1,NULL,NULL,'pagado',1,8),(60,2,1,NULL,NULL,'pagado',1,8),(61,1,1,NULL,NULL,'pagado',1,9),(62,1,1,NULL,NULL,'pagado',1,12),(63,1,1,NULL,NULL,'pagado',1,13),(64,1,1,NULL,NULL,'pagado',1,13),(65,1,1,NULL,NULL,'pagado',1,13),(66,2,1,NULL,NULL,'pagado',1,13),(67,1,1,NULL,NULL,'pendiente',1,1),(69,5,1,NULL,NULL,'pendiente',1,1),(72,1,3,NULL,NULL,'pagado',1,15),(73,1,10,NULL,NULL,'pagado',1,14),(74,5,10,NULL,NULL,'pagado',1,14),(75,1,3,NULL,NULL,'pagado',1,16);
/*!40000 ALTER TABLE `carrito_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrito_promos`
--

DROP TABLE IF EXISTS `carrito_promos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrito_promos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_p` int NOT NULL,
  `id_usuario` int NOT NULL,
  `fecha` varchar(500) DEFAULT NULL,
  `hora` varchar(45) DEFAULT NULL,
  `estado` varchar(45) DEFAULT 'pendiente',
  `cantidad` int DEFAULT '1',
  `id_pedido` int DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id_posss_idx` (`id_usuario`),
  KEY `id_pdsd_idx` (`id_p`),
  KEY `id_plse_idx` (`id_pedido`),
  CONSTRAINT `id_pdsd` FOREIGN KEY (`id_p`) REFERENCES `promociones` (`id`),
  CONSTRAINT `id_plse` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id`),
  CONSTRAINT `id_posss` FOREIGN KEY (`id_usuario`) REFERENCES `clientes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito_promos`
--

LOCK TABLES `carrito_promos` WRITE;
/*!40000 ALTER TABLE `carrito_promos` DISABLE KEYS */;
INSERT INTO `carrito_promos` VALUES (3,1,1,NULL,NULL,'pagado',1,6),(4,1,1,NULL,NULL,'pagado',1,7),(5,1,1,NULL,NULL,'pagado',1,8),(6,1,1,NULL,NULL,'pagado',1,9);
/*!40000 ALTER TABLE `carrito_promos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(500) NOT NULL,
  `apellido` varchar(500) NOT NULL,
  `dni` varchar(500) NOT NULL,
  `usuario` varchar(500) DEFAULT NULL,
  `pass` varchar(500) DEFAULT NULL,
  `correo` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Raul','Socualaya','1234568','rau','123','raul@gmail.com'),(3,'Yair','Aguero','11111111','de2','123','de2@gmail.com'),(4,'dsadasdasd','23','1','123','123','123@gmail.com'),(5,'12','23','1','123','123','123@gmail.com'),(6,'12xz','23','1','123','123','123@gmail.com'),(9,'qwe','wq','123','123','123','123555@gmail.com'),(10,'Sandro','El kid','12312312','sandro','123','sandro@gmail.com'),(11,'asd','asd','123','123ddd','123','12ddd@gmail.com');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complementos`
--

DROP TABLE IF EXISTS `complementos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `complementos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(500) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `precio` varchar(500) NOT NULL,
  `imagen` varchar(500) NOT NULL DEFAULT 'default.png',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complementos`
--

LOCK TABLES `complementos` WRITE;
/*!40000 ALTER TABLE `complementos` DISABLE KEYS */;
INSERT INTO `complementos` VALUES (1,'Rabanito','s','1.50','default.png'),(2,'Naba','s','1.50','default.png'),(3,'Chimichurri','s','1.50','default.png'),(4,'Aji','s','1.50','default.png'),(5,'Vinagreta','s','1.50','default.png'),(6,'Mayonesa','s','1.50','default.png'),(7,'Ketchup','s','0.30','default.png'),(8,'Mostaza','s','0.30','default.png'),(9,'Porción de papas','s','18.00','default.png'),(11,'Aji','Picante','1.5','default.png');
/*!40000 ALTER TABLE `complementos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int DEFAULT NULL,
  `total` float DEFAULT NULL,
  `fecha` varchar(45) DEFAULT NULL,
  `estado` varchar(45) DEFAULT 'pendiente',
  `codigo` varchar(500) DEFAULT 'nada',
  PRIMARY KEY (`id`),
  KEY `id_usu_idx` (`id_usuario`),
  CONSTRAINT `id_usu` FOREIGN KEY (`id_usuario`) REFERENCES `clientes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,1,0,'2024-10-11','prueba','nada'),(2,1,186.5,'2024-10-11','pendiente','8RXYG49KQX'),(3,1,186.5,'2024-10-11','pendiente','DXX831IFG4'),(4,1,186.5,'2024-10-11','pendiente','KGF9BWB8GM'),(5,1,186.5,'2024-10-11','pendiente','2YU80U4GNU'),(6,1,266.4,'2024-10-11','pendiente','VIHGW9IOA9'),(7,1,81.4,'2024-10-11','pendiente','FDJS78X7VY'),(8,1,140.2,'2024-10-11','pendiente','Z9WFBXCV9Y'),(9,1,103.3,'2024-10-11','pendiente','PYZUFLLXDQ'),(11,3,12,'2024-10-29',NULL,'NSMNQNA0OG'),(12,1,23.4,'2024-10-29','pendiente','UAG95RISZ4'),(13,1,93.6,'2024-10-29','pendiente','6G2HC561BM'),(14,10,34.9,'2024-10-29','pendiente','IKYRKQO2X0'),(15,3,21.9,'2024-10-29','pendiente','CH382N7SSO'),(16,3,18.9,'2024-10-29','pendiente','XR5FZKEWD8');
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(500) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `precio` float NOT NULL,
  `imagen` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Pollo 1','1/4 de pollo + papa + ensalada',18.9,'imag1.png'),(2,'Pollo 2','1/2 pollo + papa + ensalada',36.9,'imag2.jpg'),(3,'Pollo 3','1 pollo + papa + ensalada',68.9,'imag3.jpg'),(5,'Mostrito','1 pollo + chaufa',16,'img-1.jpg');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promociones`
--

DROP TABLE IF EXISTS `promociones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promociones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(500) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `precio` float NOT NULL,
  `imagen` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promociones`
--

LOCK TABLES `promociones` WRITE;
/*!40000 ALTER TABLE `promociones` DISABLE KEYS */;
INSERT INTO `promociones` VALUES (1,'Promo 1','Yapa\' 1 pollo + papa + ensalada + 1/4 pollo',79.9,'imag6.jpg'),(2,'Promo 2','Banqueton\' 1 pollo + papa + ensalada + 1 pollo + papa',125,'imag7.jpg');
/*!40000 ALTER TABLE `promociones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL,
  `ventas_realizadas` int DEFAULT NULL,
  `correo` varchar(500) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `dni` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'admin','123',0,'123@gmail.com','qebv','wq','12'),(2,'brenda','123',12,'1234@gmail.com','qwe','qwe','12'),(3,'edu','123',44,'1235@gmail.com','eqw','qwe','12'),(4,'krisstell','123',0,'1@gmail.com','qwe','wqe','12'),(5,'123','123',8,'123@gmail.com','fdfsdf','23','1'),(7,'123','123',NULL,'123@gmail.com','qwe','wq','1234');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-29 21:57:50
