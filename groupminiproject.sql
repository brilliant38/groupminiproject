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


-- 테이블 dbs의 구조를 덤프합니다. board
CREATE TABLE IF NOT EXISTS `board` (
  `b_no` varchar(50) NOT NULL,
  `m_id` varchar(20) NOT NULL,
  `m_pw` varchar(20) NOT NULL,
  `b_title` varchar(50) NOT NULL,
  `b_content` text NOT NULL,
  `b_date` varchar(20) NOT NULL,
  `b_readTime` int(10) NOT NULL,
  PRIMARY KEY (`b_no`),
  KEY `FK_board_member` (`m_id`),
  KEY `FK_board_member_2` (`m_pw`),
  CONSTRAINT `FK_board_member` FOREIGN KEY (`m_id`) REFERENCES `member` (`m_id`),
  CONSTRAINT `FK_board_member_2` FOREIGN KEY (`m_pw`) REFERENCES `member` (`m_pw`)
) ENGINE=InnoDB DEFAULT CHARSET=euckr;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 dbs의 구조를 덤프합니다. company
CREATE TABLE IF NOT EXISTS `company` (
  `p_no` varchar(50) NOT NULL,
  `m_id` varchar(20) NOT NULL,
  `m_pw` varchar(20) NOT NULL,
  `m_company` int(1) NOT NULL,
  `m_companyName` varchar(20) NOT NULL,
  `p_periodBegin` varchar(20) NOT NULL,
  `p_periodEnd` varchar(20) NOT NULL,
  `p_goods` varchar(20) NOT NULL,
  `p_time` varchar(20) NOT NULL,
  PRIMARY KEY (`p_no`),
  KEY `FK_company_member` (`m_id`),
  KEY `FK_company_member_2` (`m_pw`),
  KEY `FK_company_member_3` (`m_companyName`),
  CONSTRAINT `FK_company_member_3` FOREIGN KEY (`m_companyName`) REFERENCES `member` (`m_companyName`),
  CONSTRAINT `FK_company_member` FOREIGN KEY (`m_id`) REFERENCES `member` (`m_id`),
  CONSTRAINT `FK_company_member_2` FOREIGN KEY (`m_pw`) REFERENCES `member` (`m_pw`)
) ENGINE=InnoDB DEFAULT CHARSET=euckr;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 dbs의 구조를 덤프합니다. customer
CREATE TABLE IF NOT EXISTS `customer` (
  `c_code` varchar(50) NOT NULL,
  `m_name` varchar(50) NOT NULL,
  `m_address` varchar(50) NOT NULL,
  `m_phone` int(10) NOT NULL,
  `m_email` varchar(30) NOT NULL,
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
  KEY `FK_customer_member_4` (`m_email`),
  CONSTRAINT `FK_customer_member` FOREIGN KEY (`m_name`) REFERENCES `member` (`m_name`),
  CONSTRAINT `FK_customer_member_2` FOREIGN KEY (`m_address`) REFERENCES `member` (`m_address`),
  CONSTRAINT `FK_customer_member_3` FOREIGN KEY (`m_phone`) REFERENCES `member` (`m_phone`),
  CONSTRAINT `FK_customer_member_4` FOREIGN KEY (`m_email`) REFERENCES `member` (`m_email`)
) ENGINE=InnoDB DEFAULT CHARSET=euckr;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 dbs의 구조를 덤프합니다. member
CREATE TABLE IF NOT EXISTS `member` (
  `m_code` varchar(50) NOT NULL,
  `m_name` varchar(5) NOT NULL,
  `m_id` varchar(15) NOT NULL,
  `m_pw` varchar(15) NOT NULL,
  `m_phone` int(15) NOT NULL,
  `m_address` varchar(50) NOT NULL,
  `m_email` varchar(30) NOT NULL,
  `m_bankName` varchar(10) NOT NULL,
  `m_bankAccount` int(20) NOT NULL,
  `m_cardName` varchar(10) NOT NULL,
  `m_cardNumber` int(16) NOT NULL,
  `m_gender` char(1) NOT NULL,
  `m_birthDay` date NOT NULL,
  `m_company` int(1) NOT NULL,
  `m_companyName` varchar(20) NOT NULL,
  `m_boss` varchar(5) NOT NULL,
  `m_manager` varchar(5) NOT NULL,
  `m_date` date NOT NULL,
  `m_companyNumber` int(10) NOT NULL,
  PRIMARY KEY (`m_code`,`m_name`),
  UNIQUE KEY `m_name` (`m_name`),
  UNIQUE KEY `m_address` (`m_address`),
  UNIQUE KEY `m_phone` (`m_phone`),
  UNIQUE KEY `m_email` (`m_email`),
  UNIQUE KEY `m_id` (`m_id`),
  UNIQUE KEY `m_pw` (`m_pw`),
  UNIQUE KEY `m_companyName` (`m_companyName`)
) ENGINE=InnoDB DEFAULT CHARSET=euckr;

-- 내보낼 데이터가 선택되어 있지 않습니다.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
