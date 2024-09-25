-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               11.2.2-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for rideshare_schema
CREATE DATABASE IF NOT EXISTS `rideshare_schema` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
USE `rideshare_schema`;

-- Dumping structure for table rideshare_schema.car
CREATE TABLE IF NOT EXISTS `car` (
  `DRVR_ID` int(11) NOT NULL,
  `CAR_ID` decimal(5,0) NOT NULL,
  `CAR_MOD` varchar(25) NOT NULL,
  `CAR_LIC_PLATE` char(6) NOT NULL,
  PRIMARY KEY (`DRVR_ID`,`CAR_ID`),
  UNIQUE KEY `DRVR_ID` (`DRVR_ID`),
  UNIQUE KEY `CAR_ID` (`CAR_ID`),
  CONSTRAINT `car_ibfk_1` FOREIGN KEY (`DRVR_ID`) REFERENCES `driver` (`DRVR_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table rideshare_schema.customer
CREATE TABLE IF NOT EXISTS `customer` (
  `CUS_ID` int(11) NOT NULL,
  `CUS_FNAME` varchar(35) NOT NULL,
  `CUS_LNAME` varchar(35) NOT NULL,
  `CUS_PHONE` char(10) NOT NULL,
  `CUS_EMAIL` varchar(55) NOT NULL,
  PRIMARY KEY (`CUS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table rideshare_schema.driver
CREATE TABLE IF NOT EXISTS `driver` (
  `DRVR_ID` int(11) NOT NULL,
  `DRVR_LIC_ID` varchar(13) NOT NULL,
  `DRVR_FNAME` varchar(35) NOT NULL,
  `DRVR_LNAME` varchar(35) NOT NULL,
  `DRVR_PHONE` varchar(10) NOT NULL,
  `DRVR_EMAIL` varchar(55) NOT NULL,
  PRIMARY KEY (`DRVR_ID`),
  UNIQUE KEY `DRVR_ID` (`DRVR_ID`),
  UNIQUE KEY `DRVR_LIC_ID` (`DRVR_LIC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table rideshare_schema.transact
CREATE TABLE IF NOT EXISTS `transact` (
  `CUS_ID` int(11) NOT NULL,
  `TRANSACT_ID` int(11) NOT NULL,
  `TRANSACT_TIME` date NOT NULL,
  `TRANSACT_COST` decimal(4,2) NOT NULL,
  PRIMARY KEY (`CUS_ID`,`TRANSACT_ID`),
  UNIQUE KEY `CUS_ID` (`CUS_ID`),
  UNIQUE KEY `TRANSACT_ID` (`TRANSACT_ID`),
  UNIQUE KEY `TRANSACT_TIME` (`TRANSACT_TIME`),
  CONSTRAINT `transact_ibfk_1` FOREIGN KEY (`CUS_ID`) REFERENCES `customer` (`CUS_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table rideshare_schema.trip
CREATE TABLE IF NOT EXISTS `trip` (
  `TRIP_ID` int(11) NOT NULL,
  `TRANSACT_ID` int(11) NOT NULL,
  `DRVR_ID` int(11) NOT NULL,
  `TRIP_START_LOC` varchar(55) NOT NULL,
  `TRIP_DEST` varchar(55) NOT NULL,
  PRIMARY KEY (`TRIP_ID`),
  UNIQUE KEY `TRIP_ID` (`TRIP_ID`),
  KEY `TRANSACT_ID` (`TRANSACT_ID`),
  KEY `DRVR_ID` (`DRVR_ID`),
  CONSTRAINT `trip_ibfk_1` FOREIGN KEY (`TRANSACT_ID`) REFERENCES `transact` (`TRANSACT_ID`) ON UPDATE CASCADE,
  CONSTRAINT `trip_ibfk_2` FOREIGN KEY (`DRVR_ID`) REFERENCES `driver` (`DRVR_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
