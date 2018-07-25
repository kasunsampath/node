-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: acutec
-- ------------------------------------------------------
-- Server version	5.5.28

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
-- Table structure for table `advance`
--

DROP TABLE IF EXISTS `advance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advance` (
  `idadvance` int(11) NOT NULL AUTO_INCREMENT,
  `advance_code` varchar(10) DEFAULT NULL,
  `advance_code_count` int(11) DEFAULT NULL,
  `advance_method` varchar(1) DEFAULT NULL,
  `advance_amount` float DEFAULT NULL,
  `advance_check_no` varchar(20) DEFAULT NULL,
  `chequeDate` date DEFAULT NULL,
  `bankName` varchar(45) DEFAULT NULL,
  `advance_date` date DEFAULT NULL,
  `advance_time` time DEFAULT NULL,
  `order_product_idorder` int(11) NOT NULL,
  `company_idcompany` int(11) NOT NULL,
  `sales_person_idsales_person` int(11) NOT NULL,
  PRIMARY KEY (`idadvance`),
  KEY `fk_advance_order_product1_idx` (`order_product_idorder`),
  KEY `fk_advance_company1_idx` (`company_idcompany`),
  KEY `fk_advance_sales_person1_idx` (`sales_person_idsales_person`),
  CONSTRAINT `fk_advance_order_product1` FOREIGN KEY (`order_product_idorder`) REFERENCES `order_product` (`idorder`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_advance_company1` FOREIGN KEY (`company_idcompany`) REFERENCES `company` (`idcompany`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_advance_sales_person1` FOREIGN KEY (`sales_person_idsales_person`) REFERENCES `sales_person` (`idsales_person`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advance`
--

LOCK TABLES `advance` WRITE;
/*!40000 ALTER TABLE `advance` DISABLE KEYS */;
INSERT INTO `advance` VALUES (1,'CM1AD',1,'C',200,'-','0000-00-00','-','2018-06-29','14:19:01',7,1,4),(2,'CM1AD',2,'Q',200,'90898','2018-06-29','DFCC','2018-06-29','14:19:54',6,1,3);
/*!40000 ALTER TABLE `advance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cash_discount`
--

DROP TABLE IF EXISTS `cash_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cash_discount` (
  `cash_discount_date` date DEFAULT NULL,
  `cash_discount_time` time DEFAULT NULL,
  `cash_discount_value` float DEFAULT NULL,
  `sale_idsale` int(11) NOT NULL,
  KEY `fk_cash_discount_sale1_idx` (`sale_idsale`),
  CONSTRAINT `fk_cash_discount_sale1` FOREIGN KEY (`sale_idsale`) REFERENCES `sale` (`idsale`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cash_discount`
--

LOCK TABLES `cash_discount` WRITE;
/*!40000 ALTER TABLE `cash_discount` DISABLE KEYS */;
INSERT INTO `cash_discount` VALUES ('2018-06-29','14:16:44',8,2),('2018-06-29','14:18:03',25,3);
/*!40000 ALTER TABLE `cash_discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `idcompany` int(11) NOT NULL AUTO_INCREMENT,
  `company_username` varchar(45) DEFAULT NULL,
  `company_password` varchar(45) DEFAULT NULL,
  `company_name` varchar(45) DEFAULT NULL,
  `addrsLine_1` varchar(45) DEFAULT NULL,
  `addrsLine_2` varchar(20) DEFAULT NULL,
  `city` varchar(35) DEFAULT NULL,
  `mobile` varchar(10) DEFAULT NULL,
  `telephone` varchar(10) DEFAULT NULL,
  `fax` varchar(10) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `website` varchar(30) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `logo` text,
  PRIMARY KEY (`idcompany`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'diletro@gmail.com','12345','Diletro Clothing (Private) Limited','234/2','Main Street','Hanwalla','0776253622','0115726362','011232632','support@diletroclothing.com','www.diletroclothing.com',NULL,NULL);
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `idcustomer` int(11) NOT NULL AUTO_INCREMENT,
  `customer_code` varchar(10) DEFAULT NULL,
  `customer_code_count` int(11) DEFAULT NULL,
  `customer_name` varchar(45) DEFAULT NULL,
  `addrLine1` varchar(45) DEFAULT NULL,
  `addrLine2` varchar(30) DEFAULT NULL,
  `creditLimit` float DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `telephone` varchar(10) DEFAULT NULL,
  `mobile` varchar(10) DEFAULT NULL,
  `fax` varchar(10) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `company_idcompany` int(11) NOT NULL,
  PRIMARY KEY (`idcustomer`),
  KEY `fk_customer_company1_idx` (`company_idcompany`),
  CONSTRAINT `fk_customer_company1` FOREIGN KEY (`company_idcompany`) REFERENCES `company` (`idcompany`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'CM1CU',1,'Saman Kumara','652','Main Street',10000,'Colombo','0112344233','0775225883','0112344233','saman@gmail.com',1),(2,'CM1CU',2,'Ishan Dias','463','Cross Lane',5000,'Jaela','0112344233','0775225883','0112344233','ishan@gmail.com',1),(3,'CM1CU',3,'Udara Silva','233','Hospital Road',3000,'Negombo','0112344233','0775225883','0112344233','udara@gmail.com',1),(4,'CM1CU',4,'Asiri Perera','334','Negombo Road',4000,'Ragama','0112344233','0775225883','0112344233','asiri@gmail.com',1);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grn`
--

DROP TABLE IF EXISTS `grn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grn` (
  `idGRN` int(11) NOT NULL AUTO_INCREMENT,
  `GRN_code` varchar(10) DEFAULT NULL,
  `GRN_code_count` int(11) DEFAULT NULL,
  `GRN_time` time DEFAULT NULL,
  `GRN_qty` int(11) DEFAULT NULL,
  `GRN_date` date DEFAULT NULL,
  `warehouse_idwarehouse` int(11) NOT NULL,
  `product_idproduct` int(11) NOT NULL,
  PRIMARY KEY (`idGRN`),
  KEY `fk_GRN_warehouse1_idx` (`warehouse_idwarehouse`),
  KEY `fk_GRN_product1_idx` (`product_idproduct`),
  CONSTRAINT `fk_GRN_warehouse1` FOREIGN KEY (`warehouse_idwarehouse`) REFERENCES `warehouse` (`idwarehouse`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_GRN_product1` FOREIGN KEY (`product_idproduct`) REFERENCES `product` (`idproduct`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grn`
--

LOCK TABLES `grn` WRITE;
/*!40000 ALTER TABLE `grn` DISABLE KEYS */;
INSERT INTO `grn` VALUES (1,'CM1GR',1,'13:13:48',100,'2018-06-29',9,3),(2,'CM1GR',1,'13:13:48',50,'2018-06-29',9,2),(3,'CM1GR',1,'13:13:48',150,'2018-06-29',9,4),(4,'CM1GR',2,'13:14:39',35,'2018-06-28',10,5),(5,'CM1GR',2,'13:14:39',50,'2018-06-28',10,3),(6,'CM1GR',3,'13:15:14',25,'2018-06-27',11,3),(7,'CM1GR',3,'13:15:14',75,'2018-06-27',11,2),(8,'CM1GR',4,'13:15:35',35,'2018-06-29',12,2);
/*!40000 ALTER TABLE `grn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loading`
--

DROP TABLE IF EXISTS `loading`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loading` (
  `idloading` int(11) NOT NULL AUTO_INCREMENT,
  `loading_code` varchar(10) DEFAULT NULL,
  `loading_code_count` int(11) DEFAULT NULL,
  `loading_time` time DEFAULT NULL,
  `loading_date` date DEFAULT NULL,
  `loading_qty` int(11) DEFAULT NULL,
  `warehouse_idwarehouse` int(11) NOT NULL,
  `sales_person_idsales_person` int(11) NOT NULL,
  `product_idproduct` int(11) NOT NULL,
  PRIMARY KEY (`idloading`),
  KEY `fk_loading_warehouse1_idx` (`warehouse_idwarehouse`),
  KEY `fk_loading_sales_person1_idx` (`sales_person_idsales_person`),
  KEY `fk_loading_product1_idx` (`product_idproduct`),
  CONSTRAINT `fk_loading_warehouse1` FOREIGN KEY (`warehouse_idwarehouse`) REFERENCES `warehouse` (`idwarehouse`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_loading_sales_person1` FOREIGN KEY (`sales_person_idsales_person`) REFERENCES `sales_person` (`idsales_person`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_loading_product1` FOREIGN KEY (`product_idproduct`) REFERENCES `product` (`idproduct`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loading`
--

LOCK TABLES `loading` WRITE;
/*!40000 ALTER TABLE `loading` DISABLE KEYS */;
INSERT INTO `loading` VALUES (1,'CM1LO',1,'13:16:14','2018-06-29',5,9,2,3),(2,'CM1LO',2,'13:16:50','2018-06-29',8,10,3,5),(3,'CM1LO',3,'13:17:47','2018-06-29',3,11,4,3),(4,'CM1LO',3,'13:17:47','2018-06-29',10,11,4,2),(5,'CM1LO',4,'13:18:51','2018-06-29',15,12,5,2);
/*!40000 ALTER TABLE `loading` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `measure_unit`
--

DROP TABLE IF EXISTS `measure_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `measure_unit` (
  `idmeasure_unit` int(11) NOT NULL AUTO_INCREMENT,
  `unit_name` varchar(15) DEFAULT NULL,
  `company_idcompany` int(11) NOT NULL,
  PRIMARY KEY (`idmeasure_unit`),
  KEY `fk_measure_unit_company1_idx` (`company_idcompany`),
  CONSTRAINT `fk_measure_unit_company1` FOREIGN KEY (`company_idcompany`) REFERENCES `company` (`idcompany`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `measure_unit`
--

LOCK TABLES `measure_unit` WRITE;
/*!40000 ALTER TABLE `measure_unit` DISABLE KEYS */;
INSERT INTO `measure_unit` VALUES (8,'Packet',1),(9,'Box',1);
/*!40000 ALTER TABLE `measure_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_items` (
  `idorder_items` int(11) NOT NULL AUTO_INCREMENT,
  `order_items_qty` int(11) DEFAULT NULL,
  `order_items_price` float DEFAULT NULL,
  `change_qty` int(11) DEFAULT NULL,
  `product_idproduct` int(11) NOT NULL,
  `order_product_idorder` int(11) NOT NULL,
  PRIMARY KEY (`idorder_items`),
  KEY `fk_order_items_product1_idx` (`product_idproduct`),
  KEY `fk_order_items_order_product1_idx` (`order_product_idorder`),
  CONSTRAINT `fk_order_items_product1` FOREIGN KEY (`product_idproduct`) REFERENCES `product` (`idproduct`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_items_order_product1` FOREIGN KEY (`order_product_idorder`) REFERENCES `order_product` (`idorder`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,5,750,NULL,2,1),(2,3,375,NULL,5,1),(3,5,425,NULL,4,2),(4,3,375,NULL,5,2),(5,5,425,NULL,4,3),(6,3,375,NULL,5,3),(7,5,425,NULL,4,4),(8,3,375,NULL,5,4),(9,5,425,NULL,4,5),(10,3,375,NULL,5,5),(11,10,1500,NULL,2,6),(12,5,425,NULL,4,6),(13,10,750,NULL,3,7),(14,5,425,NULL,4,7);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_product`
--

DROP TABLE IF EXISTS `order_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_product` (
  `idorder` int(11) NOT NULL AUTO_INCREMENT,
  `order_code` varchar(10) DEFAULT NULL,
  `order_code_count` int(11) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `order_time` time DEFAULT NULL,
  `order_value` float DEFAULT NULL,
  `deliveryDate` date DEFAULT NULL,
  `advance_value` float DEFAULT NULL,
  `sales_person_idsales_person` int(11) NOT NULL,
  `customer_idcustomer` int(11) NOT NULL,
  PRIMARY KEY (`idorder`),
  KEY `fk_order_sales_person1_idx` (`sales_person_idsales_person`),
  KEY `fk_order_customer1_idx` (`customer_idcustomer`),
  CONSTRAINT `fk_order_sales_person1` FOREIGN KEY (`sales_person_idsales_person`) REFERENCES `sales_person` (`idsales_person`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_customer1` FOREIGN KEY (`customer_idcustomer`) REFERENCES `customer` (`idcustomer`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_product`
--

LOCK TABLES `order_product` WRITE;
/*!40000 ALTER TABLE `order_product` DISABLE KEYS */;
INSERT INTO `order_product` VALUES (1,'CM1OR',1,'2018-06-28','13:36:59',1125,'2018-06-30',NULL,3,1),(2,'CM1OR',2,'2018-06-29','13:38:01',800,'2018-07-04',NULL,2,2),(3,'CM1OR',2,'2018-06-29','13:38:02',800,'2018-07-04',NULL,2,2),(4,'CM1OR',2,'2018-06-29','13:38:03',800,'2018-07-04',NULL,2,2),(5,'CM1OR',2,'2018-06-29','13:38:04',800,'2018-07-04',NULL,2,2),(6,'CM1OR',3,'2018-06-29','13:40:32',1925,'2018-07-11',200,5,3),(7,'CM1OR',4,'2018-06-29','13:41:35',1175,'2018-07-06',200,4,4);
/*!40000 ALTER TABLE `order_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `idproduct` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idproduct`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Super Cream Cracker'),(2,'Super Cream Cracker 125g'),(3,'Cheese Cracker 100g'),(4,'Wafers Vanilla 85g'),(5,'Kurakkan Cracker 100g');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_cat`
--

DROP TABLE IF EXISTS `product_cat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_cat` (
  `idproduct_cat` int(11) NOT NULL AUTO_INCREMENT,
  `catName` varchar(45) DEFAULT NULL,
  `company_idcompany` int(11) NOT NULL,
  PRIMARY KEY (`idproduct_cat`),
  KEY `fk_product_cat_company1_idx` (`company_idcompany`),
  CONSTRAINT `fk_product_cat_company1` FOREIGN KEY (`company_idcompany`) REFERENCES `company` (`idcompany`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_cat`
--

LOCK TABLES `product_cat` WRITE;
/*!40000 ALTER TABLE `product_cat` DISABLE KEYS */;
INSERT INTO `product_cat` VALUES (9,'Cracker',1),(10,'Wafer',1),(11,'Herbal',1),(12,'Cream',1);
/*!40000 ALTER TABLE `product_cat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receipt`
--

DROP TABLE IF EXISTS `receipt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receipt` (
  `idreceipt` int(11) NOT NULL AUTO_INCREMENT,
  `receipt_code` varchar(10) DEFAULT NULL,
  `receipt_code_count` int(11) DEFAULT NULL,
  `receipt_date` date DEFAULT NULL,
  `receipt_time` time DEFAULT NULL,
  `receipt_value` float DEFAULT NULL,
  `receipt_method` varchar(2) DEFAULT NULL,
  `cheque_no` varchar(20) DEFAULT NULL,
  `chequeDate` date DEFAULT NULL,
  `bankName` varchar(45) DEFAULT NULL,
  `sale_idsale` int(11) NOT NULL,
  `sales_person_idsales_person` int(11) NOT NULL,
  `company_idcompany` int(11) NOT NULL,
  PRIMARY KEY (`idreceipt`),
  KEY `fk_receipt_sale1_idx` (`sale_idsale`),
  KEY `fk_receipt_sales_person1_idx` (`sales_person_idsales_person`),
  KEY `fk_receipt_company1_idx` (`company_idcompany`),
  CONSTRAINT `fk_receipt_sale1` FOREIGN KEY (`sale_idsale`) REFERENCES `sale` (`idsale`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_receipt_sales_person1` FOREIGN KEY (`sales_person_idsales_person`) REFERENCES `sales_person` (`idsales_person`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_receipt_company1` FOREIGN KEY (`company_idcompany`) REFERENCES `company` (`idcompany`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receipt`
--

LOCK TABLES `receipt` WRITE;
/*!40000 ALTER TABLE `receipt` DISABLE KEYS */;
INSERT INTO `receipt` VALUES (1,'CM1RE',1,'2018-06-29','14:15:49',100,'C','-','0000-00-00','-',1,5,1),(2,'CM1RE',2,'2018-06-29','14:16:44',50,'Q','78767','2018-06-29','CBL',2,5,1),(3,'CM1RE',3,'2018-06-29','14:18:03',150,'Q','87978','2018-06-29','SCB',3,5,1);
/*!40000 ALTER TABLE `receipt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `return_items`
--

DROP TABLE IF EXISTS `return_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `return_items` (
  `idreturn_items` int(11) NOT NULL AUTO_INCREMENT,
  `return_items_qty` int(11) DEFAULT NULL,
  `return_items_price` float DEFAULT NULL,
  `return_product_idreturn` int(11) NOT NULL,
  `product_idproduct` int(11) NOT NULL,
  PRIMARY KEY (`idreturn_items`),
  KEY `fk_return_items_return_product1_idx` (`return_product_idreturn`),
  KEY `fk_return_items_product1_idx` (`product_idproduct`),
  CONSTRAINT `fk_return_items_return_product1` FOREIGN KEY (`return_product_idreturn`) REFERENCES `return_product` (`idreturn`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_return_items_product1` FOREIGN KEY (`product_idproduct`) REFERENCES `product` (`idproduct`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `return_items`
--

LOCK TABLES `return_items` WRITE;
/*!40000 ALTER TABLE `return_items` DISABLE KEYS */;
INSERT INTO `return_items` VALUES (1,1,150,1,2),(2,1,150,1,2),(3,1,150,1,2),(4,1,125,1,5),(5,2,150,2,3),(6,1,75,2,3),(7,2,150,2,3),(8,1,85,2,4),(9,3,375,3,5);
/*!40000 ALTER TABLE `return_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `return_product`
--

DROP TABLE IF EXISTS `return_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `return_product` (
  `idreturn` int(11) NOT NULL AUTO_INCREMENT,
  `return_code` varchar(10) DEFAULT NULL,
  `return_code_count` int(11) DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `return_time` time DEFAULT NULL,
  `return_value` float DEFAULT NULL,
  `NBT` float DEFAULT NULL,
  `CESS` float DEFAULT NULL,
  `VAT` float DEFAULT NULL,
  `return_discount` float DEFAULT NULL,
  `sale_idsale` int(11) NOT NULL,
  `company_idcompany` int(11) NOT NULL,
  PRIMARY KEY (`idreturn`),
  KEY `fk_return_sale1_idx` (`sale_idsale`),
  KEY `fk_return_product_company1_idx` (`company_idcompany`),
  CONSTRAINT `fk_return_sale1` FOREIGN KEY (`sale_idsale`) REFERENCES `sale` (`idsale`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_return_product_company1` FOREIGN KEY (`company_idcompany`) REFERENCES `company` (`idcompany`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `return_product`
--

LOCK TABLES `return_product` WRITE;
/*!40000 ALTER TABLE `return_product` DISABLE KEYS */;
INSERT INTO `return_product` VALUES (1,'CM1RT',1,'2018-06-15','14:21:11',617.926,57.5,46,28.75,89.3235,1,1),(2,'CM1RT',2,'2018-06-29','14:21:58',491.182,46,36.8,23,74.6181,2,1),(3,'CM1RT',3,'2018-06-29','14:24:09',418.409,37.5,30,18.75,42.8409,3,1);
/*!40000 ALTER TABLE `return_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale`
--

DROP TABLE IF EXISTS `sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale` (
  `idsale` int(11) NOT NULL AUTO_INCREMENT,
  `sales_code` varchar(10) DEFAULT NULL,
  `sale_code_count` int(11) DEFAULT NULL,
  `start_sale_date` date DEFAULT NULL,
  `end_sale_date` date DEFAULT NULL,
  `sale_time` time DEFAULT NULL,
  `sales_value` float DEFAULT NULL,
  `total_due` float DEFAULT NULL,
  `trade_discount` float DEFAULT NULL,
  `NBT` float DEFAULT NULL,
  `CESS` float DEFAULT NULL,
  `VAT` float DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `discount_value_rupees` float DEFAULT NULL,
  `discount_value_prsntge` float DEFAULT NULL,
  `order_idorder` int(11) DEFAULT NULL,
  `sales_person_idsales_person` int(11) NOT NULL,
  `customer_idcustomer` int(11) NOT NULL,
  PRIMARY KEY (`idsale`),
  KEY `fk_sale_sales_person1_idx` (`sales_person_idsales_person`),
  KEY `fk_sale_customer1_idx` (`customer_idcustomer`),
  CONSTRAINT `fk_sale_sales_person1` FOREIGN KEY (`sales_person_idsales_person`) REFERENCES `sales_person` (`idsales_person`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sale_customer1` FOREIGN KEY (`customer_idcustomer`) REFERENCES `customer` (`idcustomer`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale`
--

LOCK TABLES `sale` WRITE;
/*!40000 ALTER TABLE `sale` DISABLE KEYS */;
INSERT INTO `sale` VALUES (1,'CM1IV',1,'2018-06-28','2018-06-29','14:02:41',850,NULL,129,85,68,42.5,NULL,50,2,1,5,1),(2,'CM1IV',2,'2018-06-29','2018-06-29','14:04:44',940,NULL,145.6,94,75.2,47,NULL,50,2,7,4,4),(3,'CM1IV',3,'2018-06-29','2018-06-29','14:12:35',825,NULL,95.75,82.5,66,41.25,NULL,20,2,0,3,1);
/*!40000 ALTER TABLE `sale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_item`
--

DROP TABLE IF EXISTS `sales_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_item` (
  `idsales_item` int(11) NOT NULL AUTO_INCREMENT,
  `sales_item_qty` int(11) DEFAULT NULL,
  `item_discount_qty` int(11) DEFAULT NULL,
  `item_discount_rupees` float DEFAULT NULL,
  `item_discount_prsntge` float DEFAULT NULL,
  `sale_idsale` int(11) NOT NULL,
  `product_idproduct` int(11) NOT NULL,
  PRIMARY KEY (`idsales_item`),
  KEY `fk_sales_item_sale1_idx` (`sale_idsale`),
  KEY `fk_sales_item_product1_idx` (`product_idproduct`),
  CONSTRAINT `fk_sales_item_sale1` FOREIGN KEY (`sale_idsale`) REFERENCES `sale` (`idsale`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sales_item_product1` FOREIGN KEY (`product_idproduct`) REFERENCES `product` (`idproduct`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_item`
--

LOCK TABLES `sales_item` WRITE;
/*!40000 ALTER TABLE `sales_item` DISABLE KEYS */;
INSERT INTO `sales_item` VALUES (1,4,1,10,2,1,2),(2,2,1,0,4,1,5),(3,8,1,5,3,2,3),(4,4,2,3,2,2,4),(5,6,1,5,3,3,5),(6,1,0,3,5,3,3);
/*!40000 ALTER TABLE `sales_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_person`
--

DROP TABLE IF EXISTS `sales_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_person` (
  `idsales_person` int(11) NOT NULL AUTO_INCREMENT,
  `salesperson_code` varchar(10) DEFAULT NULL,
  `salesperson_code_count` int(11) DEFAULT NULL,
  `salesperson_username` varchar(45) DEFAULT NULL,
  `salesperson_password` varchar(20) DEFAULT NULL,
  `salesperson_name` varchar(30) DEFAULT NULL,
  `warehouse_idwarehouse` int(11) DEFAULT NULL,
  `salesperson_addrLine1` varchar(45) DEFAULT NULL,
  `salesperson_addrLine2` varchar(20) DEFAULT NULL,
  `salesperson_telephone` varchar(10) DEFAULT NULL,
  `salesperson_mobile` varchar(10) DEFAULT NULL,
  `salesperson_email` varchar(30) DEFAULT NULL,
  `company_idcompany` int(11) NOT NULL,
  PRIMARY KEY (`idsales_person`),
  KEY `fk_sales_person_company1_idx` (`company_idcompany`),
  CONSTRAINT `fk_sales_person_company1` FOREIGN KEY (`company_idcompany`) REFERENCES `company` (`idcompany`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_person`
--

LOCK TABLES `sales_person` WRITE;
/*!40000 ALTER TABLE `sales_person` DISABLE KEYS */;
INSERT INTO `sales_person` VALUES (2,'CM1SP',1,'roshen@1234','1234','Roshen Rodrigo',0,'252','Minuwangoda','0771826232','0112728372','roshen@gmail.com',1),(3,'CM1SP',2,'niroshan@1234','2342','Niroshan Pathiraja',0,'2123','Kandy Road','0778173823','0112337482','niroshan@gmail.com',1),(4,'CM1SP',3,'udara@1234','3234','Udara Rathnayake',0,'2615','Hanwalla Road','0778172733','0112627363','udara@gmail.com',1),(5,'CM1SP',4,'kasun@1234','4532','Kasun Pathiraja',0,'2535','Negombo Road','0778172373','0112625362','kasun@gmail.com',1);
/*!40000 ALTER TABLE `sales_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_person_items`
--

DROP TABLE IF EXISTS `sales_person_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_person_items` (
  `idsales_person_items` int(11) NOT NULL AUTO_INCREMENT,
  `order_items_qty` int(11) DEFAULT NULL,
  `product_idproduct` int(11) NOT NULL,
  `sales_person_idsales_person` int(11) NOT NULL,
  PRIMARY KEY (`idsales_person_items`),
  KEY `fk_sales_person_items_product1_idx` (`product_idproduct`),
  KEY `fk_sales_person_items_sales_person1_idx` (`sales_person_idsales_person`),
  CONSTRAINT `fk_sales_person_items_product1` FOREIGN KEY (`product_idproduct`) REFERENCES `product` (`idproduct`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sales_person_items_sales_person1` FOREIGN KEY (`sales_person_idsales_person`) REFERENCES `sales_person` (`idsales_person`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_person_items`
--

LOCK TABLES `sales_person_items` WRITE;
/*!40000 ALTER TABLE `sales_person_items` DISABLE KEYS */;
INSERT INTO `sales_person_items` VALUES (1,3,3,2),(2,4,5,3),(3,3,3,4),(4,8,2,4),(5,11,2,5),(6,1,3,3),(7,2,5,4);
/*!40000 ALTER TABLE `sales_person_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stuf`
--

DROP TABLE IF EXISTS `stuf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stuf` (
  `idstuf` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) DEFAULT NULL,
  `productName` varchar(45) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `avlbleQty` int(11) DEFAULT NULL,
  `message` text,
  `company_idcompany` int(11) NOT NULL,
  PRIMARY KEY (`idstuf`),
  KEY `fk_stuf_company1_idx` (`company_idcompany`),
  CONSTRAINT `fk_stuf_company1` FOREIGN KEY (`company_idcompany`) REFERENCES `company` (`idcompany`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stuf`
--

LOCK TABLES `stuf` WRITE;
/*!40000 ALTER TABLE `stuf` DISABLE KEYS */;
/*!40000 ALTER TABLE `stuf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax`
--

DROP TABLE IF EXISTS `tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax` (
  `NBT` float DEFAULT NULL,
  `VAT` float DEFAULT NULL,
  `CESS` float DEFAULT NULL,
  `tax_parameter` varchar(4) DEFAULT NULL,
  `company_idcompany` int(11) NOT NULL,
  KEY `fk_tax_company1_idx` (`company_idcompany`),
  CONSTRAINT `fk_tax_company1` FOREIGN KEY (`company_idcompany`) REFERENCES `company` (`idcompany`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax`
--

LOCK TABLES `tax` WRITE;
/*!40000 ALTER TABLE `tax` DISABLE KEYS */;
INSERT INTO `tax` VALUES (10,5,8,NULL,1);
/*!40000 ALTER TABLE `tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transfer`
--

DROP TABLE IF EXISTS `transfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transfer` (
  `idtransfer` int(11) NOT NULL AUTO_INCREMENT,
  `transfer_code` varchar(10) DEFAULT NULL,
  `transfer_code_count` int(11) DEFAULT NULL,
  `transfer_time` time DEFAULT NULL,
  `transfer_date` date DEFAULT NULL,
  `transfer_qty` int(11) DEFAULT NULL,
  `remark` varchar(2) DEFAULT NULL,
  `location_from` int(11) DEFAULT NULL,
  `location_to` int(11) DEFAULT NULL,
  `product_idproduct` int(11) NOT NULL,
  `company_idcompany` int(11) NOT NULL,
  PRIMARY KEY (`idtransfer`),
  KEY `fk_transfer_product1_idx` (`product_idproduct`),
  KEY `fk_transfer_company1_idx` (`company_idcompany`),
  CONSTRAINT `fk_transfer_product1` FOREIGN KEY (`product_idproduct`) REFERENCES `product` (`idproduct`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_transfer_company1` FOREIGN KEY (`company_idcompany`) REFERENCES `company` (`idcompany`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transfer`
--

LOCK TABLES `transfer` WRITE;
/*!40000 ALTER TABLE `transfer` DISABLE KEYS */;
INSERT INTO `transfer` VALUES (1,'CM1TR',1,'13:26:35','2018-06-29',1,'SP',2,3,3,1),(2,'CM1TR',2,'13:29:53','2018-06-29',2,'SP',3,4,5,1),(3,'CM1TR',3,'13:30:36','2018-06-29',20,'WH',9,11,2,1),(4,'CM1TR',4,'13:31:19','2018-06-29',10,'WH',10,11,3,1);
/*!40000 ALTER TABLE `transfer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unloading`
--

DROP TABLE IF EXISTS `unloading`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unloading` (
  `idunloading` int(11) NOT NULL AUTO_INCREMENT,
  `unloading_code` varchar(10) DEFAULT NULL,
  `unloading_code_count` int(11) DEFAULT NULL,
  `unloading_time` time DEFAULT NULL,
  `loading_date` date DEFAULT NULL,
  `loading_qty` int(11) DEFAULT NULL,
  `warehouse_idwarehouse` int(11) NOT NULL,
  `sales_person_idsales_person` int(11) NOT NULL,
  `product_idproduct` int(11) NOT NULL,
  PRIMARY KEY (`idunloading`),
  KEY `fk_unloading_warehouse1_idx` (`warehouse_idwarehouse`),
  KEY `fk_unloading_sales_person1_idx` (`sales_person_idsales_person`),
  KEY `fk_unloading_product1_idx` (`product_idproduct`),
  CONSTRAINT `fk_unloading_warehouse1` FOREIGN KEY (`warehouse_idwarehouse`) REFERENCES `warehouse` (`idwarehouse`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_unloading_sales_person1` FOREIGN KEY (`sales_person_idsales_person`) REFERENCES `sales_person` (`idsales_person`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_unloading_product1` FOREIGN KEY (`product_idproduct`) REFERENCES `product` (`idproduct`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unloading`
--

LOCK TABLES `unloading` WRITE;
/*!40000 ALTER TABLE `unloading` DISABLE KEYS */;
INSERT INTO `unloading` VALUES (1,'CM1UL',1,'13:22:22','2018-06-29',1,9,2,3),(2,'CM1UL',2,'13:23:50','2018-06-29',2,10,3,5),(3,'CM1UL',3,'13:24:15','2018-06-29',2,11,4,2),(4,'CM1UL',4,'13:24:40','2018-06-29',1,12,5,2);
/*!40000 ALTER TABLE `unloading` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouse`
--

DROP TABLE IF EXISTS `warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `warehouse` (
  `idwarehouse` int(11) NOT NULL AUTO_INCREMENT,
  `warehouse_code` varchar(10) DEFAULT NULL,
  `warehouse_code_count` int(11) DEFAULT NULL,
  `warehouse_name` varchar(45) DEFAULT NULL,
  `warehouse_addrLine1` varchar(45) DEFAULT NULL,
  `warehouse_addrLine2` varchar(20) DEFAULT NULL,
  `warehouse_city` varchar(30) DEFAULT NULL,
  `warehouse_telephone` varchar(10) DEFAULT NULL,
  `warehouse_mobile` varchar(10) DEFAULT NULL,
  `warehouse_fax` varchar(10) DEFAULT NULL,
  `warehouse_email` varchar(30) DEFAULT NULL,
  `company_idcompany` int(11) NOT NULL,
  PRIMARY KEY (`idwarehouse`),
  KEY `fk_warehouse_company_idx` (`company_idcompany`),
  CONSTRAINT `fk_warehouse_company` FOREIGN KEY (`company_idcompany`) REFERENCES `company` (`idcompany`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse`
--

LOCK TABLES `warehouse` WRITE;
/*!40000 ALTER TABLE `warehouse` DISABLE KEYS */;
INSERT INTO `warehouse` VALUES (9,'CM1WH',1,'Kaduwala Warehouse','231/2','Pathiraja lane','Colombo 05','0767362329','7283723233','0112726323','warehouse@gmail.com',1),(10,'CM1WH',2,'Ragama Warehouse','256/2','Pamunugama Road','Pamunugama','0782632323','0762736323','0112363726','pamunugama@gmail.com',1),(11,'CM1WH',3,'Negombo Warehouse','234/2','Main Road','Negombo','0778273223','0782732323','0112573642','negombo@gmail.com',1),(12,'CM1WH',4,'Colombo Warehouse','4637','Galle Road','Colombo 08','0797172232','0772635232','0112263623','colombo@gmail.com',1);
/*!40000 ALTER TABLE `warehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouse_has_product`
--

DROP TABLE IF EXISTS `warehouse_has_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `warehouse_has_product` (
  `id_whp` int(11) NOT NULL AUTO_INCREMENT,
  `product_code` varchar(10) DEFAULT NULL,
  `product_code_count` int(11) DEFAULT NULL,
  `product_qty` int(11) DEFAULT NULL,
  `unit_cost` float DEFAULT NULL,
  `unit_price` float DEFAULT NULL,
  `idwarehouse` int(11) DEFAULT NULL,
  `idproduct` int(11) NOT NULL,
  `product_cat_idproduct_cat` int(11) NOT NULL,
  `measure_unit_idmeasure_unit` int(11) NOT NULL,
  `idcompany` int(11) NOT NULL,
  PRIMARY KEY (`id_whp`),
  KEY `fk_warehouse_has_product_product1_idx` (`idproduct`),
  KEY `fk_warehouse_has_product_product_cat1_idx` (`product_cat_idproduct_cat`),
  KEY `fk_warehouse_has_product_measure_unit1_idx` (`measure_unit_idmeasure_unit`),
  KEY `fk_warehouse_has_product_company1_idx` (`idcompany`),
  CONSTRAINT `fk_warehouse_has_product_product1` FOREIGN KEY (`idproduct`) REFERENCES `product` (`idproduct`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_warehouse_has_product_product_cat1` FOREIGN KEY (`product_cat_idproduct_cat`) REFERENCES `product_cat` (`idproduct_cat`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_warehouse_has_product_measure_unit1` FOREIGN KEY (`measure_unit_idmeasure_unit`) REFERENCES `measure_unit` (`idmeasure_unit`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_warehouse_has_product_company1` FOREIGN KEY (`idcompany`) REFERENCES `company` (`idcompany`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse_has_product`
--

LOCK TABLES `warehouse_has_product` WRITE;
/*!40000 ALTER TABLE `warehouse_has_product` DISABLE KEYS */;
INSERT INTO `warehouse_has_product` VALUES (2,'CM1PR',1,18,100,150,9,2,9,8,1),(3,'CM1PR',2,96,50,75,9,3,12,8,1),(4,'CM1PR',3,130,60,85,9,4,10,9,1),(5,'CM1PR',4,29,80,125,10,5,11,9,1),(6,'CM1PR',2,40,50,75,10,3,12,8,1),(7,'CM1PR',2,32,50,75,11,3,12,8,1),(8,'CM1PR',1,87,100,150,11,2,9,8,1),(9,'CM1PR',1,21,100,150,12,2,9,8,1);
/*!40000 ALTER TABLE `warehouse_has_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wastage`
--

DROP TABLE IF EXISTS `wastage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wastage` (
  `idwastage` int(11) NOT NULL AUTO_INCREMENT,
  `wastage_code` varchar(10) DEFAULT NULL,
  `wastage_code_count` int(11) DEFAULT NULL,
  `wastage_time` time DEFAULT NULL,
  `wastage_date` date DEFAULT NULL,
  `wastage_qty` int(11) DEFAULT NULL,
  `sales_person_idsales_person` int(11) DEFAULT NULL,
  `warehouse_idwarehouse` int(11) DEFAULT NULL,
  `product_idproduct` int(11) NOT NULL,
  `company_idcompany` int(11) NOT NULL,
  PRIMARY KEY (`idwastage`),
  KEY `fk_wastage_product1_idx` (`product_idproduct`),
  KEY `fk_wastage_company1_idx` (`company_idcompany`),
  CONSTRAINT `fk_wastage_product1` FOREIGN KEY (`product_idproduct`) REFERENCES `product` (`idproduct`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_wastage_company1` FOREIGN KEY (`company_idcompany`) REFERENCES `company` (`idcompany`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wastage`
--

LOCK TABLES `wastage` WRITE;
/*!40000 ALTER TABLE `wastage` DISABLE KEYS */;
INSERT INTO `wastage` VALUES (1,'CM1WS',1,'13:32:13','2018-06-29',2,0,9,2,1),(2,'CM1WS',1,'13:33:38','2018-06-29',10,0,9,2,1),(3,'CM1WS',2,'13:34:35','2018-06-29',20,0,9,4,1),(4,'CM1WS',3,'13:35:19','2018-06-29',3,5,0,2,1);
/*!40000 ALTER TABLE `wastage` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-29 14:29:00
