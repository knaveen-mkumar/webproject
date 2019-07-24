/*
SQLyog Ultimate v8.55 
MySQL - 5.1.36-community : Database - irko
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`irko` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `irko`;

/*Table structure for table `books` */

DROP TABLE IF EXISTS `books`;

CREATE TABLE `books` (
  `bookId` int(11) NOT NULL AUTO_INCREMENT,
  `bookName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL,
  `author` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`bookId`),
  KEY `FK_books` (`categoryId`),
  CONSTRAINT `FK_books` FOREIGN KEY (`categoryId`) REFERENCES `category` (`categoryId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `books` */

insert  into `books`(`bookId`,`bookName`,`image`,`categoryId`,`author`,`price`) values (2,'Malegalli Madumagalu','Malegalalli.jpg',1,'Kuvempu',150),(3,'Nenapina Doni','nenapina_doni.jpg',1,'Kuvempu',250),(4,'Kanooru Heggadathi','kanooru_heggadathi.jpg',1,'Kuvempu',210),(5,'Mookajjiya Kanasugalu','220px-MookajjiyaKanasugalu.jpg',1,'Karanth',170),(6,'Sarasammana Samadi','sarasammana_samadi.jpg',1,'Karanth',135),(7,'Chigurida Kanasu','chigurida_kanasu.jpg',1,'Karanth',168),(8,'Bettada Jeeva','bettada_jeeva.jpg',1,'Karanth',195),(9,'Rakthakshi','rakthakshi.jpg',2,'Kuvempu',200),(10,'Shudra Tapasvi','shudra_tapasvi.jpg',2,'Kuvempu',250),(11,'Nakuthanti','nakuthanti.jpg',3,'Bendre',120);

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `categoryId` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`categoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `category` */

insert  into `category`(`categoryId`,`category`) values (1,'Novel'),(2,'Drama'),(3,'Poetry');

/*Table structure for table `tokens` */

DROP TABLE IF EXISTS `tokens`;

CREATE TABLE `tokens` (
  `tokenId` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `scemantics` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `grammar` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`tokenId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tokens` */

insert  into `tokens`(`tokenId`,`token`,`scemantics`,`type`,`grammar`) values (4,'Novel','ಕಾದಂಬರಿ','category','Noun'),(5,'Novel','ಕಾದಂಬರಿಗಳು','category','Noun'),(6,'Novel','ಕಾದಂಬರಿಗಳ','category','Noun'),(7,'Drama','ನಾಟಕ','category','Noun'),(8,'Drama','ನಾಟಕಗಳು','category','Noun'),(9,'Drama','ನಾಟಕಗಳ','category','Noun'),(10,'Kuvempu','ಕುವೆಂಪು','author','Noun'),(11,'Kuvempu','ಕುವೆಂಪುರವರ','author','Noun'),(12,'Kuvempu','ಕುವೆಂಪುರ','author','Noun'),(13,'Karanth','ಕಾರಂತ್','author','Noun'),(14,'Karanth','ಕಾರಂತರ','author','Noun'),(15,'Karanth','ಕಾರಂತ್ರವ್ರ','author','Noun'),(16,'Bendre','ಬೇಂದ್ರೆ','author','Noun'),(17,'Bendre','ಬೇಂದ್ರೆರವರ','author','Noun'),(18,'Poetry','ಕವನ','category','Noun'),(19,'price','ದರ','price','Noun'),(20,'Kanooru Heggadathi','ಕಾನೂರುಹೆಗ್ಗಡತಿ','bookName','Noun');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
