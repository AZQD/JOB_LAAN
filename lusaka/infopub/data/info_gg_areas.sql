-- phpMyAdmin SQL Dump
-- version 4.0.10.15
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 24, 2017 at 11:50 PM
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
-- Table structure for table `info_gg_areas`
--

CREATE TABLE IF NOT EXISTS `info_gg_areas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT '名称',
  `pid` int(11) NOT NULL COMMENT '上一级',
  `main` int(11) NOT NULL COMMENT '是否是一级',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=53 ;

--
-- Dumping data for table `info_gg_areas`
--

INSERT INTO `info_gg_areas` (`id`, `name`, `pid`, `main`) VALUES
(1, 'Lusaka Province', 0, 1),
(2, 'Central Province', 0, 1),
(3, 'Copperbelt Province', 0, 1),
(4, 'Southern Province', 0, 1),
(5, 'North Western Province', 0, 1),
(6, 'Western Province', 0, 1),
(7, 'Luapula Province', 0, 1),
(8, 'Northen Province', 0, 1),
(9, 'Muchinga Province', 0, 1),
(10, 'Eastern Province', 0, 1),
(11, 'Lusaka  ', 1, 0),
(12, 'Kabwe', 2, 0),
(13, 'Kitwe', 3, 0),
(14, 'Livingstone', 4, 0),
(15, 'Solwezi', 5, 0),
(16, 'Mongu', 6, 0),
(17, 'Mansa', 7, 0),
(18, 'Kasama', 8, 0),
(19, 'Mpika', 9, 0),
(20, 'Chipata', 10, 0),
(21, 'Kafue', 1, 0),
(22, 'Chilanga', 1, 0),
(23, 'Kapiri Mposhi', 2, 0),
(24, 'Serenje', 2, 0),
(25, 'Mkushi', 2, 0),
(26, 'Ndola', 3, 0),
(27, 'Chingola', 3, 0),
(28, 'Chililabombwe', 3, 0),
(29, 'Luanshya', 3, 0),
(30, 'Mufulira', 3, 0),
(31, 'Monze', 4, 0),
(32, 'Choma', 4, 0),
(33, 'Zimba', 4, 0),
(34, 'Mazabuka', 4, 0),
(35, 'Kalomo', 4, 0),
(36, 'Siavonga', 4, 0),
(37, 'Chirundu', 4, 0),
(38, 'Kasempa', 5, 0),
(39, 'Mwinilunga', 5, 0),
(40, 'Lealui', 6, 0),
(41, 'Kawambwa', 7, 0),
(42, 'Luwingu', 7, 0),
(43, 'Samfya', 7, 0),
(44, 'Mpulungu', 8, 0),
(45, 'Luwingu', 8, 0),
(46, 'Mbala', 8, 0),
(47, 'Chinsali', 9, 0),
(48, 'Isoka', 9, 0),
(49, 'Nakonde', 9, 0),
(50, 'Nakonde', 9, 0),
(51, 'Katete', 10, 0),
(52, 'Lundazi', 10, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
