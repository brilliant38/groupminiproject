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
  `c_date` varchar(50) NOT NULL,
  `h_number` varchar(50) NOT NULL,
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
  CONSTRAINT `FK_check_member` FOREIGN KEY (`m_name`) REFERENCES `member` (`m_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=euckr;

-- Dumping data for table dbs.check: ~0 rows (대략적)
/*!40000 ALTER TABLE `check` DISABLE KEYS */;
/*!40000 ALTER TABLE `check` ENABLE KEYS */;


-- 테이블 dbs의 구조를 덤프합니다. customer
CREATE TABLE IF NOT EXISTS `customer` (
  `c_code` int(11) NOT NULL AUTO_INCREMENT,
  `m_name` varchar(50) DEFAULT NULL,
  `m_address` varchar(50) DEFAULT NULL,
  `m_phone` varchar(50) DEFAULT NULL,
  `c_localoverseas` varchar(50) DEFAULT NULL,
  `c_name` varchar(10) DEFAULT NULL,
  `c_address` varchar(50) DEFAULT NULL,
  `c_phone` varchar(50) DEFAULT NULL,
  `c_mail` varchar(30) DEFAULT NULL,
  `c_weight` varchar(50) DEFAULT NULL,
  `c_goods` varchar(20) DEFAULT NULL,
  `c_goodsnumber` varchar(50) DEFAULT NULL,
  `c_text` tinytext,
  `c_date` varchar(50) DEFAULT NULL,
  `c_payment` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`c_code`),
  UNIQUE KEY `c_name` (`c_name`),
  UNIQUE KEY `c_address` (`c_address`),
  UNIQUE KEY `c_goods` (`c_goods`),
  UNIQUE KEY `c_date` (`c_date`),
  UNIQUE KEY `c_localoverseas` (`c_localoverseas`),
  KEY `FK_customer_member` (`m_name`),
  KEY `FK_customer_member_2` (`m_address`),
  KEY `FK_customer_member_3` (`m_phone`),
  CONSTRAINT `FK_customer_member` FOREIGN KEY (`m_name`) REFERENCES `member` (`m_name`),
  CONSTRAINT `FK_customer_member_2` FOREIGN KEY (`m_address`) REFERENCES `member` (`m_address`),
  CONSTRAINT `FK_customer_member_3` FOREIGN KEY (`m_phone`) REFERENCES `member` (`m_phone`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=euckr;

-- Dumping data for table dbs.customer: ~0 rows (대략적)
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;


-- 테이블 dbs의 구조를 덤프합니다. member
CREATE TABLE IF NOT EXISTS `member` (
  `m_code` int(10) NOT NULL AUTO_INCREMENT,
  `m_name` varchar(5) NOT NULL,
  `m_id` varchar(15) DEFAULT NULL,
  `m_pw` varchar(15) DEFAULT NULL,
  `m_phone` varchar(50) DEFAULT NULL,
  `m_address` varchar(50) DEFAULT NULL,
  `m_email` varchar(30) DEFAULT NULL,
  `m_bankName` varchar(10) DEFAULT NULL,
  `m_bankAccount` varchar(50) DEFAULT NULL,
  `m_cardName` varchar(10) DEFAULT NULL,
  `m_cardNumber` varchar(50) DEFAULT NULL,
  `m_gender` varchar(10) DEFAULT NULL,
  `m_birthDay` varchar(50) DEFAULT NULL,
  `m_boss` varchar(5) DEFAULT NULL,
  `m_manager` varchar(5) DEFAULT NULL,
  `m_date` varchar(50) DEFAULT NULL,
  `m_companyNumber` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`m_code`,`m_name`),
  UNIQUE KEY `m_name` (`m_name`),
  UNIQUE KEY `m_address` (`m_address`),
  UNIQUE KEY `m_phone` (`m_phone`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=euckr;

-- Dumping data for table dbs.member: ~1 rows (대략적)
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` (`m_code`, `m_name`, `m_id`, `m_pw`, `m_phone`, `m_address`, `m_email`, `m_bankName`, `m_bankAccount`, `m_cardName`, `m_cardNumber`, `m_gender`, `m_birthDay`, `m_boss`, `m_manager`, `m_date`, `m_companyNumber`) VALUES
	(1, '이광재', 'id001', 'pw001', '01020121995', '경기도', 'lkg3796@gmail.com', '우리은행', '1002745616114', '현대', '4218212621042101', '남자', '1988-09-06', '김상중', '최태일', '2018-07-04 14:55:22', '(주)한화이글스');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;


-- 테이블 dbs의 구조를 덤프합니다. overseas
CREATE TABLE IF NOT EXISTS `overseas` (
  `o_no` int(10) NOT NULL AUTO_INCREMENT,
  `m_name` varchar(50) DEFAULT NULL,
  `m_phone` varchar(50) DEFAULT NULL,
  `m_address` varchar(50) DEFAULT NULL,
  `o_name` varchar(50) DEFAULT NULL,
  `o_phone` varchar(50) DEFAULT NULL,
  `o_country` varchar(50) DEFAULT NULL,
  `o_zipcode` varchar(50) DEFAULT NULL,
  `o_address` varchar(50) DEFAULT NULL,
  `o_custompaper` varchar(50) DEFAULT NULL,
  `o_goods` varchar(50) DEFAULT NULL,
  `o_goodsnumber` varchar(50) DEFAULT NULL,
  `o_price` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`o_no`),
  KEY `FK_overseas_member` (`m_name`),
  KEY `FK_overseas_member_2` (`m_phone`),
  KEY `FK_overseas_member_3` (`m_address`),
  CONSTRAINT `FK_overseas_member` FOREIGN KEY (`m_name`) REFERENCES `member` (`m_name`),
  CONSTRAINT `FK_overseas_member_2` FOREIGN KEY (`m_phone`) REFERENCES `member` (`m_phone`),
  CONSTRAINT `FK_overseas_member_3` FOREIGN KEY (`m_address`) REFERENCES `member` (`m_phone`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=euckr;

-- Dumping data for table dbs.overseas: ~0 rows (대략적)
/*!40000 ALTER TABLE `overseas` DISABLE KEYS */;
/*!40000 ALTER TABLE `overseas` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
