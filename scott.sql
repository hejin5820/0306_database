-- MySQL dump 10.13  Distrib 5.6.30, for Win32 (AMD64)
--
-- Host: localhost    Database: scott
-- ------------------------------------------------------
-- Server version	5.6.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE = @@TIME_ZONE */;
/*!40103 SET TIME_ZONE = '+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES = @@SQL_NOTES, SQL_NOTES = 0 */;

--
-- Current Database: `scott`
--
DROP DATABASE IF EXISTS `scott`;
CREATE DATABASE /*!32312 IF NOT EXISTS */ `scott` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `scott`;

--
-- Table structure for table `dept`
--

DROP TABLE IF EXISTS `dept`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dept` (
                      `DEPTNO` INT(2) NOT NULL,
                      `DNAME`  VARCHAR(14) DEFAULT NULL,
                      `LOC`    VARCHAR(13) DEFAULT NULL,
                      PRIMARY KEY (`DEPTNO`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dept`
--

LOCK TABLES `dept` WRITE;
/*!40000 ALTER TABLE `dept`
  DISABLE KEYS */;
INSERT INTO `dept` VALUES (10, 'ACCOUNTING', 'NEW YORK'), (20, 'RESEARCH', 'DALLAS'), (30, 'SALES', 'CHICAGO'),
                          (40, 'OPERATIONS', 'BOSTON');
/*!40000 ALTER TABLE `dept`
  ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp`
--

DROP TABLE IF EXISTS `emp`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emp` (
                     `EMPNO`    INT(4) NOT NULL,
                     `ENAME`    VARCHAR(10)  DEFAULT NULL,
                     `JOB`      VARCHAR(9)   DEFAULT NULL,
                     `MGR`      INT(4)       DEFAULT NULL,
                     `HIREDATE` DATE         DEFAULT NULL,
                     `SAL`      DOUBLE(7, 2) DEFAULT NULL,
                     `COMM`     DOUBLE(7, 2) DEFAULT NULL,
                     `DEPTNO`   INT(2)       DEFAULT NULL,
                     PRIMARY KEY (`EMPNO`),
                     KEY `FK_emp_deptno` (`DEPTNO`),
                     CONSTRAINT `FK_emp_deptno` FOREIGN KEY (`DEPTNO`) REFERENCES `dept` (`DEPTNO`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp`
--

LOCK TABLES `emp` WRITE;
/*!40000 ALTER TABLE `emp`
  DISABLE KEYS */;
INSERT INTO `emp` VALUES (7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', 1600.00, 300.00, 30),
                         (7521, 'WARD', 'SALESMAN', 7698, '1981-02-22', 1250.00, 500.00, 30),
                         (7566, 'JONES', 'MANAGER', 7839, '1981-04-02', 2975.00, NULL, 20),
                         (7654, 'MARTIN', 'SALESMAN', 7698, '1981-09-28', 1250.00, 1400.00, 30),
                         (7698, 'BLAKE', 'MANAGER', 7839, '1981-05-01', 2850.00, NULL, 30),
                         (7782, 'CLARK', 'MANAGER', 7839, '1981-06-09', 2450.00, NULL, 10),
                         (7788, 'SCOTT', 'ANALYST', 7566, '1987-07-13', 3000.00, NULL, 20),
                         (7839, 'KING', 'PRESIDENT', NULL, '1981-11-30', 5000.00, NULL, NULL),
                         (7844, 'TURNER', 'SALESMAN', 7698, '1981-09-08', 1500.00, 0.00, 30),
                         (7876, 'ADAMS', 'CLERK', 7788, '1987-07-13', 1100.00, NULL, 20),
                         (7900, 'JAMES', 'CLERK', 7698, '1981-12-03', 950.00, NULL, 30),
                         (7902, 'FORD', 'ANALYST', 7566, '1981-12-03', 3000.00, NULL, 20),
                         (7934, 'MILLER', 'CLERK', 7782, '1982-01-23', 1300.00, NULL, 10);
/*!40000 ALTER TABLE `emp`
  ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salgrade`
--

DROP TABLE IF EXISTS `salgrade`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salgrade` (
                          `GRADE` INT(11) DEFAULT NULL,
                          `LOSAL` INT(11) DEFAULT NULL,
                          `HISAL` INT(11) DEFAULT NULL
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salgrade`
--

LOCK TABLES `salgrade` WRITE;
/*!40000 ALTER TABLE `salgrade`
  DISABLE KEYS */;
INSERT INTO `salgrade` VALUES (1, 700, 1200), (2, 1201, 1400), (3, 1401, 2000), (4, 2001, 3000), (5, 3001, 9999);
/*!40000 ALTER TABLE `salgrade`
  ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE = @OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE = @OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES = @OLD_SQL_NOTES */;

-- Dump completed on 2016-07-20 11:10:57

show tables from scott;
select *
from scott.dept;
