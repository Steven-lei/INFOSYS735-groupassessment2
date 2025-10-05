-- MySQL dump 10.19  Distrib 10.2.38-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: cafe
-- ------------------------------------------------------
-- Server version	10.2.38-MariaDB

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
-- Current Database: `cafe`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `cafe` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `cafe`;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `order_number` int(5) NOT NULL AUTO_INCREMENT,
  `order_date_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`order_number`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,'2020-06-20 13:09:07',20.00),(2,'2020-06-21 13:09:23',24.00),(3,'2020-06-22 13:09:38',32.50),(4,'2020-06-22 13:09:49',10.50),(5,'2020-06-24 13:10:02',42.00),(6,'2020-06-25 13:10:20',14.00),(7,'2020-06-25 13:10:30',35.00),(8,'2020-06-27 13:10:36',6.00),(9,'2020-06-28 13:10:46',18.00),(10,'2020-07-02 13:10:58',18.00),(11,'2020-07-03 13:11:08',19.50),(12,'2020-07-04 13:11:17',9.00),(13,'2020-07-05 13:11:27',26.50),(14,'2020-07-05 13:11:40',42.00),(15,'2020-07-06 13:12:27',35.00),(16,'2020-07-09 13:12:35',19.50),(17,'2020-07-12 13:12:48',57.50),(18,'2020-07-14 13:13:04',34.00),(19,'2020-07-15 13:13:17',29.00),(20,'2020-07-18 13:13:27',14.00),(21,'2020-07-20 13:13:36',17.50),(22,'2020-07-21 13:13:47',33.50),(23,'2020-07-28 13:13:54',6.00),(24,'2020-07-28 13:14:07',35.00);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_item` (
  `order_number` int(5) NOT NULL,
  `order_item_number` int(5) NOT NULL,
  `product_id` int(3) DEFAULT NULL,
  `quantity` int(2) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`order_number`,`order_item_number`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_item_ibfk_1` FOREIGN KEY (`order_number`) REFERENCES `order` (`order_number`),
  CONSTRAINT `order_item_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (1,1,1,4,6.00),(1,2,9,4,14.00),(2,1,2,12,12.00),(2,2,7,4,12.00),(3,1,5,5,17.50),(3,2,7,3,9.00),(3,3,8,2,6.00),(4,1,3,3,7.50),(4,2,8,1,3.00),(5,1,1,4,6.00),(5,2,4,4,12.00),(5,3,7,8,24.00),(6,1,9,4,14.00),(7,1,6,10,35.00),(8,1,7,2,6.00),(9,1,1,4,6.00),(9,2,7,4,12.00),(10,1,2,6,6.00),(10,2,7,2,6.00),(10,3,8,2,6.00),(11,1,5,1,3.50),(11,2,6,2,7.00),(11,3,8,3,9.00),(12,1,1,2,3.00),(12,2,7,2,6.00),(13,1,3,4,10.00),(13,2,5,3,10.50),(13,3,8,2,6.00),(14,1,6,8,28.00),(14,2,9,4,14.00),(15,1,6,10,35.00),(16,1,5,3,10.50),(16,2,8,3,9.00),(17,1,1,15,22.50),(17,2,5,10,35.00),(18,1,3,8,20.00),(18,2,9,4,14.00),(19,1,4,2,6.00),(19,2,5,4,14.00),(19,3,7,2,6.00),(19,4,8,1,3.00),(20,1,2,5,5.00),(20,2,8,3,9.00),(21,1,9,5,17.50),(22,1,3,3,7.50),(22,2,5,4,14.00),(22,3,7,4,12.00),(23,1,7,2,6.00),(24,1,5,4,14.00),(24,2,6,3,10.50),(24,3,9,3,10.50);
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(40) NOT NULL DEFAULT '',
  `description` varchar(200) NOT NULL DEFAULT '',
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `product_group` int(2) NOT NULL DEFAULT 1,
  `image_url` varchar(256) DEFAULT 'images/default-image.jpg',
  PRIMARY KEY (`id`),
  KEY `product_group` (`product_group`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`product_group`) REFERENCES `product_group` (`product_group_number`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Croissant','Fresh, buttery and fluffy... Simply delicious!',1.50,1,'images/Croissants.jpg'),(2,'Donut','We have more than half-a-dozen flavors!',1.00,1,'images/Donuts.jpg'),(3,'Chocolate Chip Cookie','Made with Swiss chocolate with a touch of Madagascar vanilla',2.50,1,'images/Chocolate-Chip-Cookies.jpg'),(4,'Muffin','Banana bread, blueberry, cranberry or apple',3.00,1,'images/Muffins.jpg'),(5,'Strawberry Blueberry Tart','Bursting with the taste and aroma of fresh fruit',3.50,1,'images/Strawberry-Blueberry-Tarts.jpg'),(6,'Strawberry Tart','Made with fresh ripe strawberries and a delicious whipped cream',3.50,1,'images/Strawberry-Tarts.jpg'),(7,'Coffee','Freshly-ground black or blended Columbian coffee',3.00,2,'images/Coffee.jpg'),(8,'Hot Chocolate','Rich and creamy, and made with real chocolate',3.00,2,'images/Cup-of-Hot-Chocolate.jpg'),(9,'Latte','Offered hot or cold and in various delicious flavors',3.50,2,'images/Latte.jpg');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_group`
--

DROP TABLE IF EXISTS `product_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_group` (
  `product_group_number` int(3) NOT NULL,
  `product_group_name` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`product_group_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_group`
--

LOCK TABLES `product_group` WRITE;
/*!40000 ALTER TABLE `product_group` DISABLE KEYS */;
INSERT INTO `product_group` VALUES (1,'Pastries'),(2,'Drinks');
/*!40000 ALTER TABLE `product_group` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-05  5:10:25