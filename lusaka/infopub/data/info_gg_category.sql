-- phpMyAdmin SQL Dump
-- version 4.0.10.15
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 25, 2017 at 12:25 AM
-- Server version: 5.1.73
-- PHP Version: 5.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `infopub`
--

-- --------------------------------------------------------

--
-- Table structure for table `info_gg_category`
--

CREATE TABLE IF NOT EXISTS `info_gg_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL COMMENT '父分类',
  `main` tinyint(1) NOT NULL COMMENT '是不是一级分类',
  `name` varchar(32) NOT NULL,
  `imgsrc` varchar(62) NOT NULL COMMENT '图片地址',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `info_gg_category`
--

INSERT INTO `info_gg_category` (`id`, `pid`, `main`, `name`, `imgsrc`) VALUES
(1, 0, 1, 'Others', 'http://www.kalichimall.com/static/img/others.png'),
(2, 0, 1, 'Vehicles', 'http://www.kalichimall.com/static/img/vehicles.png'),
(3, 0, 1, 'Digtals', 'http://www.kalichimall.com/static/img/digtals.png'),
(4, 0, 1, 'Buildings', 'http://www.kalichimall.com/static/img/buildings.png'),
(5, 0, 1, 'Life Goods', 'http://www.kalichimall.com/static/img/lifegoods.png'),
(6, 2, 0, 'Sedan', ''),
(7, 2, 0, 'SUV', ''),
(9, 3, 0, 'Computer', ''),
(10, 3, 0, 'Cellphone', ''),
(11, 3, 0, 'Watch', ''),
(13, 4, 0, 'Family House', ''),
(14, 4, 0, 'Office', ''),
(16, 5, 0, 'Clothes', ''),
(17, 5, 0, 'Shoes', ''),
(18, 5, 0, 'Furniture', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
