-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        5.5.32 - MySQL Community Server (GPL)
-- 서버 OS:                        Win32
-- HeidiSQL 버전:                  8.0.0.4396
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- dbs 의 데이터베이스 구조 덤핑
CREATE DATABASE IF NOT EXISTS `dbs` /*!40100 DEFAULT CHARACTER SET euckr */;
USE `dbs`;


-- 테이블 dbs의 구조를 덤프합니다. check
CREATE TABLE IF NOT EXISTS `check` (
  `h_code` int(10) NOT NULL AUTO_INCREMENT,
  `c_name` varchar(50) NOT NULL,
  `c_address` varchar(50) NOT NULL,
  `c_goods` varchar(50) NOT NULL,
  `c_date` date NOT NULL,
  `h_number` int(10) NOT NULL,
  `h_state` varchar(5) NOT NULL,
  `m_name` varchar(5) NOT NULL,
  PRIMARY KEY (`h_code`),
  KEY `FK_check_customer` (`c_name`),
  KEY `FK_check_customer_2` (`c_address`),
  KEY `FK_check_customer_3` (`c_goods`),
  KEY `FK_check_customer_4` (`c_date`),
  KEY `FK_check_member` (`m_name`),
  CONSTRAINT `FK_check_customer` FOREIGN KEY (`c_name`) REFERENCES `customer` (`c_name`),
  CONSTRAINT `FK_check_customer_2` FOREIGN KEY (`c_address`) REFERENCES `customer` (`c_address`),
  CONSTRAINT `FK_check_customer_3` FOREIGN KEY (`c_goods`) REFERENCES `customer` (`c_goods`),
  CONSTRAINT `FK_check_customer_4` FOREIGN KEY (`c_date`) REFERENCES `customer` (`c_date`),
  CONSTRAINT `FK_check_member` FOREIGN KEY (`m_name`) REFERENCES `member` (`m_name`)
  ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=euckr;

-- Dumping data for table dbs.check: ~0 rows (대략적)
/*!40000 ALTER TABLE `check` DISABLE KEYS */;
/*!40000 ALTER TABLE `check` ENABLE KEYS */;


-- 테이블 dbs의 구조를 덤프합니다. customer
CREATE TABLE IF NOT EXISTS `customer` (
  `c_code` int(11) NOT NULL AUTO_INCREMENT,
  `m_name` varchar(50) NOT NULL,
  `m_address` varchar(50) NOT NULL,
  `m_phone` int(10) NOT NULL,
  `c_mail` varchar(30) NOT NULL,
  `c_name` varchar(10) NOT NULL,
  `c_address` varchar(50) NOT NULL,
  `c_phone` int(10) NOT NULL,
  `c_weight` int(2) NOT NULL,
  `c_goods` varchar(5) NOT NULL,
  `c_goodsnumber` int(2) NOT NULL,
  `c_text` tinytext NOT NULL,
  `c_date` date NOT NULL,
  `c_payment` varchar(2) NOT NULL,
  PRIMARY KEY (`c_code`),
  UNIQUE KEY `c_name` (`c_name`),
  UNIQUE KEY `c_address` (`c_address`),
  UNIQUE KEY `c_goods` (`c_goods`),
  UNIQUE KEY `c_date` (`c_date`),
  KEY `FK_customer_member` (`m_name`),
  KEY `FK_customer_member_2` (`m_address`),
  KEY `FK_customer_member_3` (`m_phone`),
  CONSTRAINT `FK_customer_member` FOREIGN KEY (`m_name`) REFERENCES `member` (`m_name`),
  CONSTRAINT `FK_customer_member_2` FOREIGN KEY (`m_address`) REFERENCES `member` (`m_address`),
  CONSTRAINT `FK_customer_member_3` FOREIGN KEY (`m_phone`) REFERENCES `member` (`m_phone`)
  ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=euckr;

-- Dumping data for table dbs.customer: ~0 rows (대략적)
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;


-- 테이블 dbs의 구조를 덤프합니다. member
CREATE TABLE IF NOT EXISTS `member` (
  `m_code` int(10) NOT NULL AUTO_INCREMENT,
  `m_name` varchar(5) NOT NULL,
  `m_id` varchar(15) NOT NULL,
  `m_pw` varchar(15) NOT NULL,
  `m_phone` int(15) NOT NULL,
  `m_address` varchar(50) NOT NULL,
  `m_email` varchar(30) NOT NULL,
  `m_bankAccount` int(20) NOT NULL,
  `m_cardNumber` int(16) NOT NULL,
  `m_gender` char(1) NOT NULL,
  `m_birthDay` date NOT NULL,
  `m_boss` varchar(5) NOT NULL,
  `m_manager` varchar(5) NOT NULL,
  `m_date` date NOT NULL,
  `m_companyNumber` int(10) NOT NULL,
  PRIMARY KEY (`m_code`,`m_name`),
  UNIQUE KEY `m_name` (`m_name`),
  UNIQUE KEY `m_address` (`m_address`),
  UNIQUE KEY `m_phone` (`m_phone`)
) ENGINE=InnoDB DEFAULT CHARSET=euckr;

-- Dumping data for table dbs.member: ~0 rows (대략적)
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
