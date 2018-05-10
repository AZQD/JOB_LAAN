-- phpMyAdmin SQL Dump
-- version 4.0.10.20
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 06, 2017 at 06:51 AM
-- Server version: 5.5.55-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.21

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1000 ;

--
-- Dumping data for table `info_gg_areas`
--

INSERT INTO `info_gg_areas` (`id`, `name`, `pid`, `main`) VALUES
(1, 'Lusaka', 0, 1),
(2, 'Central', 0, 1),
(3, 'Copperbelt', 0, 1),
(4, 'Southern', 0, 1),
(5, 'North Western', 0, 1),
(6, 'Western', 0, 1),
(7, 'Luapula', 0, 1),
(8, 'Northen', 0, 1),
(9, 'Muchinga', 0, 1),
(10, 'Eastern', 0, 1),
(11, 'Lusaka', 1, 0),
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
(52, 'Lundazi', 10, 0),
(99, '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `info_gg_banners`
--

CREATE TABLE IF NOT EXISTS `info_gg_banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT '名称',
  `imgsrc` varchar(128) NOT NULL COMMENT 'banner图片',
  `target` varchar(256) NOT NULL COMMENT '目标',
  `groupname` varchar(64) NOT NULL COMMENT '组名',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='banner' AUTO_INCREMENT=451 ;

--
-- Dumping data for table `info_gg_banners`
--

INSERT INTO `info_gg_banners` (`id`, `name`, `imgsrc`, `target`, `groupname`) VALUES
(100, 'liftgoods', 'http://www.kalichimall.com/static/img/i_t_m1.jpg', 'http://www.kalichimall.com/WEB/category.html?searchOrTab=tab&cid=5', 'index-top-middle'),
(200, 'Vehicles', 'http://www.kalichimall.com/static/img/i_t_m2.jpg', 'http://www.kalichimall.com/WEB/category.html?searchOrTab=tab&cid=2', 'index-top-middle'),
(300, 'liftgoods', 'http://www.kalichimall.com/static/img/m1.png', 'http://www.kalichimall.com/mobile/category.html?searchOrTab=tab&cid=5', 'mobile-index-top-middle'),
(400, 'Vehicles', 'http://www.kalichimall.com/static/img/m2.png', 'http://www.kalichimall.com/mobile/category.html?searchOrTab=tab&cid=2', 'mobile-index-top-middle'),
(50, 'index', 'http://www.kalichimall.com/static/img/i_t_m0.jpg', 'http://www.kalichimall.com/', 'index-top-middle'),
(250, 'Students', 'http://www.kalichimall.com/static/img/i_t_m3.jpg', 'http://www.kalichimall.com/WEB/category.html?searchOrTab=tab&cid=21', 'index-top-middle'),
(275, 'index', 'http://www.kalichimall.com/static/img/m0.png', 'http://www.kalichimall.com/', 'mobile-index-top-middle'),
(450, 'Students', 'http://www.kalichimall.com/static/img/m3.png', 'http://www.kalichimall.com/mobile/category.html?searchOrTab=tab&cid=21', 'mobile-index-top-middle');

-- --------------------------------------------------------

--
-- Table structure for table `info_gg_bestgoods`
--

CREATE TABLE IF NOT EXISTS `info_gg_bestgoods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `info_gg_bestgoods`
--

INSERT INTO `info_gg_bestgoods` (`id`, `goodid`) VALUES
(4, 39),
(3, 33),
(5, 153),
(6, 128);

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
  `interval` text NOT NULL,
  `is_hot` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=45 ;

--
-- Dumping data for table `info_gg_category`
--

INSERT INTO `info_gg_category` (`id`, `pid`, `main`, `name`, `imgsrc`, `interval`, `is_hot`) VALUES
(1, 0, 1, 'Others', 'http://www.kalichimall.com/static/img/others.png', '0,100;100,200;200,500;500,1000;1000,2000;2000,3000;3000', 0),
(2, 0, 1, 'Vehicles', 'http://www.kalichimall.com/static/img/vehicles.png', '0,20000;20000,40000;40000,60000;60000,80000;80000,100000;100000,150000;150000', 0),
(3, 0, 1, 'Digitals', 'http://www.kalichimall.com/static/img/digtals.png', '0,1000;1000,2000;2000,3000;3000,5000;5000,7000;7000,10000;10000', 0),
(4, 0, 1, 'Buildings', 'http://www.kalichimall.com/static/img/buildings.png', '0,1000;1000,2000;2000,3000;3000,5000;5000,7000;7000,10000;10000', 0),
(5, 0, 1, 'Life Goods', 'http://www.kalichimall.com/static/img/lifegoods.png', '0,100;100,200;200,500;500,1000;1000,2000;2000,3000;3000', 0),
(6, 2, 0, 'Sedan', '', '0,20000;20000,40000;40000,60000;60000,80000;80000,100000;100000,150000;150000', 0),
(7, 2, 0, 'SUV', '', '0,20000;20000,40000;40000,60000;60000,80000;80000,100000;100000,150000;150000', 0),
(9, 3, 0, 'Computer', '', '0,1000;1000,2000;2000,3000;3000,5000;5000,7000;7000,10000;10000', 0),
(10, 3, 0, 'Cellphone', '', '0,1000;1000,2000;2000,3000;3000,5000;5000,7000;7000,10000;10000', 0),
(11, 3, 0, 'Watch', '', '0,1000;1000,2000;2000,3000;3000,5000;5000,7000;7000,10000;10000', 0),
(13, 4, 0, 'Family House', '', '0,1000;1000,2000;2000,3000;3000,5000;5000,7000;7000,10000;10000', 0),
(14, 4, 0, 'Office', '', '0,1000;1000,2000;2000,3000;3000,5000;5000,7000;7000,10000;10000', 0),
(16, 5, 0, 'Clothes', '', '0,100;100,200;200,500;500,1000;1000,2000;2000,3000;3000', 0),
(17, 5, 0, 'Shoes', '', '0,100;100,200;200,500;500,1000;1000,2000;2000,3000;3000', 0),
(18, 5, 0, 'Furniture', '', '0,100;100,200;200,500;500,1000;1000,2000;2000,3000;3000', 0),
(8, 2, 0, 'Others', '', '0,20000;20000,40000;40000,60000;60000,80000;80000,100000;100000,150000;150000', 0),
(12, 3, 0, 'Others', '', '0,1000;1000,2000;2000,3000;3000,5000;5000,7000;7000,10000;10000', 0),
(15, 4, 0, 'Others', '', '0,1000;1000,2000;2000,3000;3000,5000;5000,7000;7000,10000;10000', 0),
(19, 5, 0, 'Others', '', '0,100;100,200;200,500;500,1000;1000,2000;2000,3000;3000', 0),
(21, 0, 1, 'Students', 'http://www.kalichimall.com/static/img/student.png', '0,100;100,200;200,500;500,1000;1000,2000;2000,3000;3000', 1),
(22, 21, 0, 'Books', '', '0,100;100,200;200,500;500,1000;1000,2000;2000,3000;3000', 0),
(23, 21, 0, 'Stationery', '', '0,100;100,200;200,500;500,1000;1000,2000;2000,3000;3000', 0),
(24, 21, 0, 'Sports', '', '0,100;100,200;200,500;500,1000;1000,2000;2000,3000;3000', 0),
(25, 21, 0, 'Music', '', '0,100;100,200;200,500;500,1000;1000,2000;2000,3000;3000', 0),
(26, 21, 0, 'Clothing', '', '0,100;100,200;200,500;500,1000;1000,2000;2000,3000;3000', 0),
(27, 21, 0, 'Others', '', '0,100;100,200;200,500;500,1000;1000,2000;2000,3000;3000', 0),
(31, 21, 0, 'Shoes', '', '0,100;100,200;200,500;500,1000;1000,2000;2000,3000;3000', 0),
(32, 5, 0, 'Bedding', '', '0,100;100,200;200,500;500,1000;1000,2000;2000,3000;3000', 0),
(33, 5, 0, 'Kitchen', '', '0,100;100,200;200,500;500,1000;1000,2000;2000,3000;3000', 0),
(34, 5, 0, 'Storage', '', '0,100;100,200;200,500;500,1000;1000,2000;2000,3000;3000', 0),
(35, 5, 0, 'Home Decor', '', '0,100;100,200;200,500;500,1000;1000,2000;2000,3000;3000', 0),
(36, 0, 1, 'Skin Care', '', '0,100;100,200;200,500;500,1000;1000,2000;2000,3000;3000', 0),
(37, 36, 0, 'Face wash', '', '0,100;100,200;200,500;500,1000;1000,2000;2000,3000;3000', 0),
(38, 36, 0, 'Body wash', '', '0,100;100,200;200,500;500,1000;1000,2000;2000,3000;3000', 0),
(39, 36, 0, 'Toner', '', '0,100;100,200;200,500;500,1000;1000,2000;2000,3000;3000', 0),
(40, 36, 0, 'Creams', '', '0,100;100,200;200,500;500,1000;1000,2000;2000,3000;3000', 0),
(41, 36, 0, 'Sun screen', '', '0,100;100,200;200,500;500,1000;1000,2000;2000,3000;3000', 0),
(42, 36, 0, 'Masque', '', '0,100;100,200;200,500;500,1000;1000,2000;2000,3000;3000', 0),
(43, 36, 0, 'Lip care', '', '0,100;100,200;200,500;500,1000;1000,2000;2000,3000;3000', 0),
(44, 36, 0, 'Others', '', '0,100;100,200;200,500;500,1000;1000,2000;2000,3000;3000', 0);

-- --------------------------------------------------------

--
-- Table structure for table `info_gg_comment`
--

CREATE TABLE IF NOT EXISTS `info_gg_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `tocomment` int(11) NOT NULL,
  `togoodid` int(11) NOT NULL,
  `content` varchar(256) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `info_gg_getcounts`
--

CREATE TABLE IF NOT EXISTS `info_gg_getcounts` (
  `id` int(11) NOT NULL,
  `tuser` int(11) NOT NULL,
  `tgoods` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `info_gg_getcounts`
--

INSERT INTO `info_gg_getcounts` (`id`, `tuser`, `tgoods`) VALUES
(0, 2508, 2436);

-- --------------------------------------------------------

--
-- Table structure for table `info_gg_publist`
--

CREATE TABLE IF NOT EXISTS `info_gg_publist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(64) DEFAULT '' COMMENT '标题',
  `details` text NOT NULL,
  `goodstatus` int(11) NOT NULL DEFAULT '1' COMMENT '商品信息新旧程度',
  `price` double DEFAULT '0' COMMENT '价钱',
  `imgs` text COMMENT '该条信息所有图片',
  `cimg` varchar(128) NOT NULL COMMENT '封面图片',
  `contactname` varchar(32) DEFAULT NULL COMMENT '联系人姓名',
  `phone` varchar(32) NOT NULL,
  `cid` int(11) NOT NULL DEFAULT '1' COMMENT '分类',
  `issell` tinyint(1) NOT NULL DEFAULT '1',
  `addr_l1` tinyint(4) DEFAULT '99' COMMENT '一级地址',
  `addr_l2` tinyint(4) DEFAULT '99' COMMENT '二级地址',
  `addr_l3` varchar(64) DEFAULT NULL COMMENT '三级地址',
  `addr_l4` varchar(128) DEFAULT NULL COMMENT '四级地址',
  `views` int(11) NOT NULL DEFAULT '0',
  `wishs` int(11) NOT NULL DEFAULT '0' COMMENT '收藏的数目',
  `pubtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '信息状态,0表示在线，1表示下线',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=531 ;

--
-- Dumping data for table `info_gg_publist`
--

INSERT INTO `info_gg_publist` (`id`, `uid`, `title`, `details`, `goodstatus`, `price`, `imgs`, `cimg`, `contactname`, `phone`, `cid`, `issell`, `addr_l1`, `addr_l2`, `addr_l3`, `addr_l4`, `views`, `wishs`, `pubtime`, `status`) VALUES
(1, 0, '', 'Georgio Amani perfume 100mls K1200', 1, 0, NULL, '', NULL, '0967956597', 1, 1, 99, 99, NULL, '', 0, 0, '2017-07-09 04:54:56', 0),
(2, 39, '', 'Mouthwash Listerine 120mls K40', 1, 0, NULL, '', NULL, '0967956596', 1, 1, 99, 99, NULL, '', 2, 0, '2017-07-09 04:57:54', 0),
(3, 39, '', 'Dell laptop,Hard drive 500g.cpu intel core i7', 1, 0, NULL, '', NULL, '0967956596', 1, 1, 99, 99, NULL, '', 0, 0, '2017-07-09 05:00:07', 0),
(4, 39, '', 'Irrigation agriculture pump drop your offers', 1, 0, NULL, '', NULL, '0967956596', 1, 0, 99, 99, NULL, '', 0, 0, '2017-07-09 05:01:41', 0),
(58, 45, 'Samsung Galaxy s4', 'Samsung Galaxy S4 @ k950 or swap with your mini or faulty laptops.0965243294', 3, 950, '2787F09C013F14FA5E33C2C70739FA22,4AF1B540C2966AD37560DF34039A6D2F,CD78E49CBDC9274E419465B8B186B4AC', '2787F09C013F14FA5E33C2C70739FA22', 'Mathews King', '0965243294', 10, 1, 1, 11, '0', 'lusaka', 10, 0, '2017-08-12 14:03:26', 0),
(5, 39, 'Creed Silver Mountain 120mls', 'Original Silver mountain perfume from the house of Creed', 0, 7000, '', '', 'Zuse', '0967956596', 19, 0, 1, 11, '0', 'Rhodes Park', 2, 0, '2017-08-04 18:55:27', 0),
(6, 44, '40% discount to sell my Monster', '40% discount to sell my Monster', 0, 461029, 'E61E1C6D67C5791A0E6AD8A65AB3C07C,E96AFC9EB128AEEBAC9790CD18FE0BBF,AADED824A67E19F59DB6A9F48F2D58E6', 'E61E1C6D67C5791A0E6AD8A65AB3C07C', '0912345677', '0912345677', 9, 1, 6, 16, '0', 'test', 65, 1, '2017-08-04 23:11:59', 1),
(7, 39, 'Physics Shaulms Outlines', 'Schaum''s Outline of College Physics, 11th Edition (Schaum''s Outlines) 11th Edition\nby Frederick J. Bueche (Author), Eugene Hecht (Author)', 1, 80, '1D09BF7EFA35BC974853BA7EE8E395A6,778348939BE5FBA4EA533F2E2A5A9C6B', '1D09BF7EFA35BC974853BA7EE8E395A6', 'Zuse', '0967956596', 22, 1, 1, 11, '0', 'UNZA', 33, 0, '2017-08-07 18:29:02', 0),
(10, 39, '4 Bedroomed house', 'For rent 4bedrooms two msc inbuilt stove tiles paved yard water tank k2,500 call 0977582723. 0966572130', 1, 2400, 'FBAD279249F1FD3F62865E05CE209546,C594542DF9B9716FAB95F3E896CBFDEE', 'FBAD279249F1FD3F62865E05CE209546', 'Bwalya Sampa', '0966572130', 13, 1, 1, 11, '0', 'chamber valley meanwood', 78, 0, '2017-08-07 18:33:45', 0),
(9, 39, 'Silver Mountain Creed perfume', 'Silver Mountain Water by Creed is an Aromatic fragrance for men. Inspired by Olivier Creed''s fondness for skiing, Silver Mountain Water was designed to evoke the sparkling high-mountain streams of water in the Swiss Alps.\n\nThe white bottle capped with a silver cap resembles a snow-topped mountain with a glistening silver stream.\n\nThe fragrance opens with bergamot and mandarin, followed by a heart featuring green tea and black currant. The base is composed of Galbanum, musk, sandalwood and petit grain. Silver Mountain Water was launched in 1995. The nose behind this fragrance is Olivier Creed Sixth Generation.', 0, 6500, '55AD84134F7F85872287621DBDFA8F37,8864A04CA51BED0E65F8508660D8982B', '55AD84134F7F85872287621DBDFA8F37', 'Zuse', '0967956596', 19, 1, 1, 11, '0', 'Jesmodine', 53, 0, '2017-08-07 18:40:38', 0),
(11, 45, 'Huawei P8 lite', 'Neat Huawei p8 lite Double sim 16gb inbuilt Strong battery', 3, 1100, '85D6B20B216DD4216B9B32B7D1923620,04B2D8AB3CC4BCF2DD7F401FB62A9740,8FCCDB0277736773DE37AACDF38B6A53', '85D6B20B216DD4216B9B32B7D1923620', 'Dickson Mulenga', '260974091720', 10, 1, 1, 11, '0', 'Lusaka', 18, 0, '2017-08-10 19:28:39', 0),
(12, 45, 'Acer i3  ', 'Acer core i3, 8gb ram with Intel HD 4000 graphics', 2, 1900, '0AC1280175F62C50B589450A5799FE6A,1C1E40EC5231E90ACC58058E4774E92A,40CB34A4E2F7259E15CBAA52CD3581AD', '0AC1280175F62C50B589450A5799FE6A', 'Joe Chunga ', '0966646872', 9, 1, 1, 11, '0', 'lusaka', 4, 0, '2017-08-10 19:38:48', 0),
(13, 45, 'Samsung Galaxy S4', 'S4 very neat 99% pressure free at kr1000 drop your offers', 2, 1000, 'EA1A7431E484F2111B98EAD35D99C4B7', 'EA1A7431E484F2111B98EAD35D99C4B7', 'Jackson Mwanza ', '0971709013', 10, 1, 1, 11, '0', 'Lusaka', 7, 0, '2017-08-10 19:42:30', 0),
(14, 45, 'Samsung Galaxy S4', 'Samsung s4 32gb inbuilt Strong battery\n', 3, 900, '2F4EB5295D1EE4379F42712E36FF13C6,51265A30F216394328081998DF0B7E9A,1127BEA8D2624DC693F1D6A214137ACB', '2F4EB5295D1EE4379F42712E36FF13C6', 'Dickson Mulenga ', '0974091720', 10, 1, 1, 11, '0', 'Lusaka', 8, 0, '2017-08-10 19:48:15', 0),
(15, 45, 'iphone 4s', 'iPhone 4s 32gb only pressure cracks on both sides but touch works perfectly', 3, 600, '82486FEBAFAC1424A447ED977156F585,5181FE2D400DC641B14908EA27A11BCD', '82486FEBAFAC1424A447ED977156F585', 'Chipola K brothers Kuyanda ', '0974710224', 10, 1, 1, 11, '0', 'Lusaka', 3, 0, '2017-08-10 19:52:38', 0),
(16, 45, 'Samsung Home theater Speakers', 'Original Samsung Home theater Speakers. give me your offers. 0967 777 222. Kamwala South, Laveka.Lusaka', 3, 0, 'E81A4766DD76BB2C05DC387EF5EFDBBC,33C50037EFB66A971BA61A02044CEB7B,ECED011297C3C1515E037656D07CE35C', 'E81A4766DD76BB2C05DC387EF5EFDBBC', 'Mwewa Musakanya Amos', '0967777222', 12, 1, 1, 11, '0', 'Kamwala South', 2, 0, '2017-08-10 19:58:35', 0),
(17, 45, 'GOTV', 'GOTV with one month subscription call me 0978951696', 2, 0, '50C50B79F4420E3D5013E6A421A0A615,4FE4B780275DDE594BD19DFAA2DD5914', '50C50B79F4420E3D5013E6A421A0A615', 'Juli Bankz', '0978951696', 12, 1, 1, 11, '0', 'Lusaka', 3, 0, '2017-08-10 20:01:12', 0),
(18, 45, 'Assorted ', 'Wallpapers,duvet set, duvet covers and carpets for sell. Prices on the pictures.WhatsApp me 0950737721', 1, 0, 'D5DA337410D60A6540423F939F5ECF73,E9FE3657C28303DB761459B80BE60CD2,1268B5F246096DFABC0AB3755AE98F8D,CDF2F640743B6849AFCF457772108E05', 'D5DA337410D60A6540423F939F5ECF73', 'Olipah Kibona ', '0950737721', 19, 1, 1, 11, '0', 'Lusaka', 5, 0, '2017-08-10 20:06:03', 0),
(19, 45, 'Office Desk ', '3 pcs office Desk for sale.  WhatsApp or call me on this line +260975068314', 0, 1500, 'C38E21A6E87B596B55DE5327A2427335,0ECAB36FFE06AD3C4BC961AC411F6E56,9CAE72E3C589996D625EA9393A3C1579', 'C38E21A6E87B596B55DE5327A2427335', 'Emma Nuel', '260975068314', 18, 1, 1, 11, '0', 'Lusaka', 3, 0, '2017-08-10 20:09:35', 0),
(20, 45, 'Defy Fridge', 'DEFY 380L working perfect .no time waster please/ call or what''s up 0977752612', 3, 1800, 'C682747DEBB923FA85783C28244C2FF9,3B341FC8ABAD5E37419F720615566759', 'C682747DEBB923FA85783C28244C2FF9', 'Jacob Mumba ', '0977752612', 19, 1, 1, 11, '0', 'lusaka', 3, 0, '2017-08-10 20:33:09', 0),
(21, 45, 'Home Theater Speakers', 'Home theater speakers ', 3, 700, '6DD189AA817E1A279F4883BB95A1A957,A7DEE346139646F8A7B013000E5D31B8', '6DD189AA817E1A279F4883BB95A1A957', 'Jessica Mtonga ', '0971933838', 12, 1, 1, 11, '0', 'lusaka', 4, 0, '2017-08-10 20:44:48', 0),
(22, 45, 'KIC upright fridge ', 'for sale co me on 0971951042/0950698624', 3, 1300, 'C38A396F61FFE6DA7063D28C7E2AD86B,C3954F46C445483C505DAD26B04E32B7', 'C38A396F61FFE6DA7063D28C7E2AD86B', 'Alfred Mwilu ', '0971951042', 19, 1, 1, 11, '0', 'lusaka', 2, 0, '2017-08-10 20:47:56', 0),
(23, 45, 'Tiffany TV stand ', 'Tv stand ', 2, 1000, '5950B20A3298AB65B00095F558FD1B62,412EEA901C1EE51753796C1997596EAD,2690F097FD68D894C72148C083384DF5', '5950B20A3298AB65B00095F558FD1B62', 'kristal Namp', '0971679648', 18, 1, 1, 11, '0', 'lusaka', 18, 0, '2017-08-10 20:52:31', 0),
(24, 45, 'IPHONE 5', 'Pressure free\nComes with a pouch and glass protector ', 2, 1550, '8201DCA80794FD3EB9350FD09063B333,B5C8025F1B56FCA3AD4B7D0C75BE496D,3375FC99715D6EF5EB5603CBD26502DA', '8201DCA80794FD3EB9350FD09063B333', 'Pauline Mbewe ', '0953606863', 10, 1, 1, 11, '0', 'Lusaka', 3, 0, '2017-08-10 20:57:57', 0),
(25, 45, 'ISUZU Van ', 'Â®MAKE-ISUZU \nÂ®YEAR of make -2003\nÂ®MODEL-Van\nÂ®DIESEL-ENGINE\nÂ®4 tones\nÂ®Call 0975398009\nIf you''re selling or want to buy any other car please feel free to call me and have business with me.i help to sale cars fast as an agent', 3, 77000, '150A0E03AF6312B6CB1E53A932B091AD,7B5E3C5A8C31C211D1BE352E4C895F24', '150A0E03AF6312B6CB1E53A932B091AD', 'Melvin Nonde Chipoma ', '0975398009', 8, 1, 1, 11, '0', 'lusaka', 35, 0, '2017-08-10 21:01:10', 0),
(26, 45, 'VVTI Corrolla ', 'Â®Vvti collola for sale\nÂ®Model 2005\nÂ®Mileage 93408\nÂ®engine 1NZ \nÂ®Very powerful machine\nÂ®CALL +260975398009\nÂ®Very good condtion\nIf you''re selling or want to buy any other car please feel free to call me and have business with me.i help to sale cars fast as an agent', 3, 38000, 'A553248E3661AF5B9F2FB15BF67A6FC3,AEC37DED4BEF6FF6DEAD1CCA01AFD413,4A179123E258C4C32A2458BCF06A506A,636303AC116D1F7C2755DA9C6C0188E3', 'A553248E3661AF5B9F2FB15BF67A6FC3', 'Melvin Nonde Chipoma', '260975398009', 6, 1, 1, 11, '0', 'lusaka', 2, 0, '2017-08-10 21:04:43', 0),
(27, 45, 'Toyota IST', 'Toyota IST buy n Drive', 3, 25000, '57AB22626C17F8869CA8C1130ED5852D,A2E74B9704226169742CD42992C8B256,C241C3CD5481399880DF6874C791548B', '57AB22626C17F8869CA8C1130ED5852D', 'Dora Phiri Mwanga', '0979208988', 8, 1, 1, 11, '0', 'Lilayi Farms', 4, 0, '2017-08-10 21:12:49', 0),
(28, 45, 'Acer E5', 'Acer E5\n15.6" screen size \nCore i3 \n1TB Hard Drive\n4 Gb Ram\nBlue in colour', 2, 0, 'B68EC657446B52A6DA143083F82E8021,C7B747477541C1BDDBBEAF3407155C44', 'B68EC657446B52A6DA143083F82E8021', 'Yuli Daniel Soko ', ' 0976768969', 9, 1, 1, 11, '0', 'Lusaka', 3, 0, '2017-08-10 21:16:03', 0),
(29, 45, 'HP Laptop', 'Hp \n15.6" screen size\nIntel (pentium)\n1TB Hard Drive \n4 Gb Ram\nBlack in colour', 2, 0, 'C35F6EC7525A4D035CF6387D7F3941E4,404A47F1C4FA50D6B583D1447FB733BC', 'C35F6EC7525A4D035CF6387D7F3941E4', 'Yuli Daniel Soko', '0976768969', 9, 1, 1, 11, '0', 'lusaka', 2, 0, '2017-08-10 21:18:01', 0),
(30, 45, 'Mitsubishi Pajero', 'For sale Mitsubishi pajero\nMileage at about 150000\nVery neat lady driven and rarely used. \nCall/what''s app/text 0977261581', 3, 75000, 'D71EEDC9D597CE407359DEB5A9F862CB,88304ECA9023A522203C7004B7620493,DCD70AB86A96BCA1126096CDBBDAB3D9', 'D71EEDC9D597CE407359DEB5A9F862CB', 'Chenje PrasSat Mtonga', '0977261581', 7, 1, 1, 11, '0', 'lusaka', 4, 0, '2017-08-10 22:14:17', 0),
(31, 45, 'House For Rent ', 'RENT: 2b flat (MSC) town house in woodlands chalala vacant,along tarmac, tiled, wardrobes, 2 geysers, borehole, pantry,k-units,e/fence,motorized gate,K3,500 by 3 months +deposite,for mo details call:0977422673/0955032007', 1, 3500, 'F71D61245ADC371B6D9DDBF2F2BA9C5E,BC4A06D3D1AEFFB2A6FC80BAC359C6A4,6FDD2A23DB6505305CAB9B75D57C89CA', 'F71D61245ADC371B6D9DDBF2F2BA9C5E', 'Kayula Nkamba', '0977422673', 13, 1, 1, 11, '0', 'Woodlands,Chalala', 2, 0, '2017-08-10 23:03:57', 0),
(32, 45, 'Rent', 'HOUSES FOR RENT :@ CHALALA executive 2bedroom modern flat tiled, kitchen units, wardrobes, geyser, paved yard, electric wallfenced, its a HOT CAKE vacant @K2500. Please just CALL 0978 600 607', 1, 2500, 'AF899AA41FCC58F1004046E449FDE948,E6A76E0CAF5B1F7BBD16BD040E5DA1CE,101BAFEC16CB7DCC5F55A0919C6D020C', 'AF899AA41FCC58F1004046E449FDE948', 'Derrick Mubita', '0978 600 607', 13, 1, 1, 11, '0', 'Chalala', 2, 0, '2017-08-10 23:06:57', 0),
(33, 45, 'For SALE', 'HOUSE FOR SALE.\nSalama park: 3 bed roomed MSC modern house, e/fence, automated gate with intercom, borehole water supply, gardens, dog/storage house, 20*30 plot size, @ k900,000 call 0979840473', 0, 900000, '39B617434BF5C86CF46046E5558FC026,37A1F44BE695FFC70F6FBF4A19B8BB56', '39B617434BF5C86CF46046E5558FC026', 'Brown Steven', '0979840473', 13, 1, 1, 11, '0', 'Salama Park', 15, 0, '2017-08-10 23:09:28', 0),
(34, 45, 'RENT', 'FOR RENT.\nCrossroads: Napsa complex 3 bed roomed MSC duplex apartment, inbuilt kitchen units, wardrobes, 2 geyser, second floor, @ k6000 * 2 plus s/deposit, call 0979840473', 0, 6000, 'FBF2DF8B6D57CC7C12FAD6AE0CFDBB44,B0BA734D0BBE60756B9FD977F59C5419,272DCC3C1EEF3F1EB988E9EECC9DE0E6', 'FBF2DF8B6D57CC7C12FAD6AE0CFDBB44', 'Brown Steven ', ' 0979840473', 13, 1, 1, 11, '0', 'NAPSA COMPLEX', 3, 0, '2017-08-10 23:11:21', 0),
(35, 45, 'Toyota Ipsum ', 'Toyota Ipsum lady driven very neat\n', 2, 36000, 'CB71B30194DC6634E14C1C62BE10BE9D,654A0F1EDAB6ADD607948E5E5B3D2BB0,2098FDE8FE8EF327DD81F096422CACEB', 'CB71B30194DC6634E14C1C62BE10BE9D', 'Victor Musongo ', '0974558558', 8, 1, 1, 11, '0', 'lusaka', 3, 0, '2017-08-10 23:32:13', 0),
(36, 45, 'FOR SALE', '6 unfinished flats in Roma for sale price neg 0977772635', 0, 0, '727B9460116E0C8BE30CAF2D08DDB174,003082D12D406CEA8DA461A06D5120C2,49FE39DA5C8D46D8C32FB979E9FC29FD', '727B9460116E0C8BE30CAF2D08DDB174', 'Mubanga ', ' 0977772635', 13, 1, 1, 11, '0', 'ROMA', 3, 0, '2017-08-10 23:34:26', 0),
(37, 45, 'IBM DESKTOP CPU', 'IBM DESKTOP CPU - K600 NEGOTIABLE\nSWAPS AND TOP UPS ACCEPTED\nPENTIUM 4\nNEEDS IDE HARD DRIVE AND DDR1 RAM CARDS\n\nDROP YOU OFFERS. SERIOUS PEOPLE ONLY\n0950831157', 3, 600, '77B1F75F24A5D5AAF13C7262BC2B86AC,F3A7DE9FC133DFE74FA7A348C9814F26,2808F22741D681BFF114BFE70BCADBD3', '77B1F75F24A5D5AAF13C7262BC2B86AC', 'Ntandwe Tembo', '0950831157', 9, 1, 1, 11, '0', 'lusaka', 2, 0, '2017-08-10 23:38:51', 0),
(38, 45, 'RAV4', 'RAV4 K37 NEG MUST GO SERIOUS BUSINESS CALL 0977320690 LUSAKA', 3, 37000, '91069940D0FF372F3D8B60BE6E84D8EE,FE848F4831DB0277D1A54FF12F3EBE21,BAC1607BC5CC8EED54108D60459A1FBE', '91069940D0FF372F3D8B60BE6E84D8EE', 'Stephen Mapunga', '0977320690', 7, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-10 23:41:41', 0),
(39, 45, 'Toyota IST', 'Its lady driven, has mug reams, very neat inside out, no dents and looking new. Going at K50,000.00 negotiable. Contact me on 0978207833.', 2, 50000, '16EFBFE77B2436C8BE347E55C34B2613,368B874EEBCA0FD2695A1336F340E1AD,D9A21B657DA6C42B5583DACE7EA6573F', '16EFBFE77B2436C8BE347E55C34B2613', 'Matildah Buumba', '0978207833.', 8, 1, 1, 11, '0', 'lusaka', 93, 0, '2017-08-10 23:55:12', 0),
(40, 45, 'Toyota Corrolla ', 'Toyota Corrolla ', 3, 33000, '1C3389ACFD3228ED78C4EACAF7AFC121,951EFDC0FED1705353A5F3628872F8B4,29C0804CDC7BB3F30AAA5E074870EFE2', '1C3389ACFD3228ED78C4EACAF7AFC121', 'Robert Kalinda ', '0964027652', 6, 1, 1, 11, '0', 'lusaka', 3, 0, '2017-08-10 23:59:29', 0),
(41, 45, 'TOYOTA VITZ', 'Toyota Vitz call 0977888287', 3, 30000, '33B750F299BD92E2FF6E8649F3E15EE0,BE234ABFF62A0CB5CAA4C663F4EFCF5C', '33B750F299BD92E2FF6E8649F3E15EE0', 'Elizabeth Keta', '0977888287', 8, 1, 1, 11, '0', 'Lusaka', 11, 0, '2017-08-11 00:06:38', 0),
(42, 45, 'Toyota Runx', 'Neat  negotiable whatsapp on 0977395769 ', 2, 47000, '888750A92F0694D3B9C9846B99756042,DE43BBF9160709BE6587A59E76A3A2C6,1D6A43A0B0F271FB9A8DD2546F790E43,4E18ADD9C9367EC659BB72624C88EB35', '888750A92F0694D3B9C9846B99756042', 'Chazi Chazi ', ' 0977395769 ', 8, 1, 1, 11, '0', 'lusaka', 2, 0, '2017-08-11 00:09:24', 0),
(43, 45, 'Hiace Bus', 'Haice bus engine 1tr untempered.', 2, 40000, '9CF7137055266DD929827BD1F98C0F11,C3CC6AA32B76640A51600F738A94292D,31BA1C7D163EF175E516372A6E6DAF24', '9CF7137055266DD929827BD1F98C0F11', 'Alick M A Phiri', '0975996689', 8, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-11 18:16:03', 0),
(44, 45, 'Toyota landcriuser', 'Toyota landcriuser\nR14,000\nKitwe Nkana, Central, Zambia\n140,000k neg\nEngine changed to 1hz \nIn good condition \nCall 0972617836', 2, 140000, 'D410DDC77AFB886181A2B073DE144A8F,8F2C2DE565CB805B4BA2A1A89FC80D56,7AE5AE79D93DA64C6E946C7D623385BD', 'D410DDC77AFB886181A2B073DE144A8F', 'Frances Chanda ', '0972617836', 8, 1, 3, 13, '0', 'Nkana', 2, 0, '2017-08-11 18:25:21', 0),
(45, 45, 'Golf Runner', 'Golf 4 Runner K26,000 Negotiable: 0977650770', 2, 26000, 'F3131D03CA0D42A8166E0BA322CB570F,DA90E5505B920F759835A47875F65BEB,00E4B89597F40D0B8375ABFDA00ED3E8', 'F3131D03CA0D42A8166E0BA322CB570F', 'Grayane lwando', '0977650770', 6, 1, 1, 11, '0', 'lusaka', 3, 0, '2017-08-11 18:29:32', 0),
(46, 45, 'BMW', 'Neat BMW car for sale 0979161078', 2, 38000, '61889A475C399CD4088B6078EE5D2A9A,FC04C75D7098080D3EECBE106D23785B,41B79C8982C53ED4666E1838202F0BF7', '61889A475C399CD4088B6078EE5D2A9A', 'Henry Banda ', '0979161078', 6, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-11 18:36:31', 0),
(47, 45, 'Mercedes Benz c180', 'Mercedes Benz c180 Excellent condition, Millage 64,000. Price 68,000 negotiable. contact 0973433321', 2, 68000, '1025CEAC54290979315BD5E58A53A1B0,4D80E8A19CFC7A39E1D753ED11E3464F,D8561DFEEB0EC0DCD210BEFE940C2336,13AB8429607E38FBEFB3118AF740A7A5', '1025CEAC54290979315BD5E58A53A1B0', 'Grace Hara', ' 0973433321', 6, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-11 18:44:39', 0),
(48, 45, 'Toyota Allion', '2006 model \n1.8cc\nMileage 55\nPrice k72,000 negotiable\nCall or whatsapp on 0968616348', 1, 72000, 'F255DF2188F17033DFFB76871CA65D91,229083F6D5479962558A0D4051E2E199', 'F255DF2188F17033DFFB76871CA65D91', 'Sule Kunda', '0968616348', 6, 1, 3, 26, '0', 'Ndola', 3, 0, '2017-08-11 18:53:39', 0),
(49, 45, 'Toyota IST', 'Cheap cheap \nHurry hurry new stock ,Toyota Ist for sale \nThis vehicle is very intact and perfect .\nMileage. : 65 \nMake. : Toyota Ist\nYear. : 2003\nPrice. :52 negotiable \nFor more info contact Ben carz\n0974473273', 0, 52000, '9D0852F15F60595823C5943B0BB4F5D5,4DEAFD0D11BE9D02F35DD4810A87DAA4', '9D0852F15F60595823C5943B0BB4F5D5', 'Benny', '0974473273', 6, 1, 1, 11, '0', 'Lusaka', 9, 0, '2017-08-11 19:03:05', 0),
(50, 45, 'Stove & Table ', '*Stove & Table all going @ k450.\n*Ibex hill\n*0974598583/0953512847\n*Lusaka', 3, 450, '42E9D3DD7291A8538FC5FD16A6497F82,9A19A46796F9ACFCD9A3AB4BD3A2A8A3', '42E9D3DD7291A8538FC5FD16A6497F82', 'Chama', '0953512847', 19, 1, 1, 11, '0', 'Ibex Hill', 2, 0, '2017-08-12 04:39:40', 0),
(51, 45, 'Funiture', 'Sofas starting from k170 to k5000 and beds from k500 to k3500..call +260973943321 for more details whatsapp using same number', 1, 0, '03A89A60B13FF6E38AEB1DF678CB63E4,18807F62B66892603DA0787D85C8FEC8,354E1AC745FD73E9D6BF33318B7667FA,84247B1A25EEEEAB331E5869E8F4B74C', '03A89A60B13FF6E38AEB1DF678CB63E4', 'Jancken Jay', '260973943321', 18, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-12 04:42:02', 0),
(52, 45, 'KIC Fridge', 'KIC upright fridge in good condition for sale at K1500 only', 3, 1500, '516420E05293E04B578811F8555E12E0,AB39D777AB886796C03675150A653C62,3ACD880B477BB525F7DA74AC8C5D3608', '516420E05293E04B578811F8555E12E0', 'Mwaba ', '0975723692', 19, 1, 1, 11, '0', 'UTH', 4, 0, '2017-08-12 04:44:24', 0),
(53, 45, 'House Hold Goods', '*beige tv stand@1700..\n*Defy upright@2200\n*LG upright fridge@2100..\n*731Defy stove with oven fan@2600..\n*Big Defy stove at 1700..\n*Small Defy stove@1100\nCALL/WTSP 0979417111\nLUSAKA.', 3, 0, 'C389443BD8E481CB08C41D5889F4F4D7,481E940669DC191052E3EF380DE3EF01,0E13D18B462A01EC74AD6BAF72411082,793CA8C4B47D69A0BCF5BE0176F53DED', 'C389443BD8E481CB08C41D5889F4F4D7', 'Fatu', '0979417111', 19, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-12 04:47:26', 0),
(54, 45, 'Wardrops', '3 doors is 1,400 and 4doors is 1,600 contact me on 0977296944 items will be in monday.', 0, 0, '2D4B17602144920FCA67604B2E7CB3CC,CB650A95C2AF03A9AF34F653D5D638C5', '2D4B17602144920FCA67604B2E7CB3CC', 'Bridget', '0977296944', 18, 1, 1, 11, '0', 'Luska', 3, 0, '2017-08-12 04:49:45', 0),
(55, 45, 'Curtain Rails', 'Genius engineering we supply curtain rails including fixing and delivery if you''re buying more pairs for more information whatssap me at 0978881443', 0, 0, '9B5C3D3327FAC3477A0B596BD6FA9CEB,69575C2BE677F81FC150EAC51EA852C5,6B6012891385A0455387372E32D89926', '9B5C3D3327FAC3477A0B596BD6FA9CEB', 'Wisdom', '0978881443', 18, 1, 1, 11, '0', 'Lusaka', 3, 0, '2017-08-12 04:53:23', 0),
(56, 45, 'Dining Table & Chairs', 'Dinning table five seater mukwa wood very strong with lion legs cash offers contact 0974153731 if intrested.', 0, 1800, 'DADB53EBA3FCA271CCCF4573CD4D0A16,BCAD4381E189210B6D29038770F59613', 'DADB53EBA3FCA271CCCF4573CD4D0A16', 'Sanaa', '0974153731', 18, 1, 1, 11, '0', 'Lusaka', 4, 0, '2017-08-12 04:55:28', 0),
(57, 45, 'Duvets', 'It''s cold season duvets 250 contact me on 0972128052', 1, 250, 'CF0D8DE07EDF8903A75336ED9F5609CA,F2536440705D6180A537E789A81471D7,F28ECFCAB028A5F3FDF988858C05A310', 'CF0D8DE07EDF8903A75336ED9F5609CA', 'Annie Lungu ', '0972128052', 16, 1, 1, 11, '0', 'Lusaka', 39, 0, '2017-08-12 04:57:39', 0),
(59, 45, 'Samsung Galaxy S6', '100%neat Samsung Galaxy S6 Edge 64gb inbelt, 3gb ram, 16mp back camera and 5mp front, finger print,gold edition, strong battery going @ k3000 neg\n0965555158', 3, 3000, '1D05876A332B28D714BB088A24C2D80D,59777CCA7F760EBC07E0A11404D59A0C,1165E8A88240B639ECBF6E1EDD367F78', '1D05876A332B28D714BB088A24C2D80D', 'Chongo Malolela', '0965555158', 10, 1, 1, 11, '0', 'lusaka', 2, 0, '2017-08-12 14:08:26', 0),
(60, 45, 'infinix hot 4 Lite', 'infinix hot 4 Lite 100% neat 16gb inbuilt 1gb ram going at k1000 call 0972854545 am in town', 3, 1000, 'D27946AB2FE9D62F7D75779AAD6B925B,C0EA6861BEFDE5CB2CF4AB775CFC21C1', 'D27946AB2FE9D62F7D75779AAD6B925B', 'Edward Musonda', '0972854545', 10, 1, 1, 11, '0', 'lusaka', 1, 0, '2017-08-12 14:11:22', 0),
(61, 45, 'S6 edge ', 'Super neat s6 edge on a give away price guy 0976198735', 2, 2800, '358A1D57D6A7043970301B1BA0C65E0A,534CECE0F38A9C3491B7C8E4DE4120AC', '358A1D57D6A7043970301B1BA0C65E0A', 'laston lutaka', '0976198735', 10, 1, 1, 11, '0', 'makeni mall', 2, 0, '2017-08-12 14:17:49', 0),
(62, 45, 'LAPTOP', 'HERE IS SUPER GAME LAPTOP WITH 6GB RAM 500 GB HD LOADED WITH MOVIES AND GAMES 6 HOURS BATTERY LIFE\nGIVE ME YOUR BIG PHONE ONLY OR CASH K2000 0979178093', 2, 2000, 'D3974AD01BC30368960638573AF67B6E,A500A0722A752A85D485D2B2293A8A8D', 'D3974AD01BC30368960638573AF67B6E', 'wiseman', '0979178093', 9, 1, 1, 11, '0', 'Lusaka', 3, 0, '2017-08-12 14:20:51', 0),
(63, 45, 'Laptop', 'Super neat toshiba satellite c655 goin @1,600\nâ€¢15.6" full HD screen \nâ€¢320gb HDD 4gb ram \nâ€¢mobile intel(R) @128mb dedicated video memory\nâ€¢celeron Dual core CPU @2.00GHz,,,2.00GHz speed\nâ€¢3hours battery life....power pack is provided\nLocation : lusaka town,springbok house along cha cha cha road opposite kulima tower bus station\n#0960667584\n#0953251651~wattsup', 2, 1600, '9B8DD81E03C499AF7F2FFA5A18557DAC,AF1F638B45478FB83B9451415245FB88,1B842E34AD277C54D66F83B3461AB88F', '9B8DD81E03C499AF7F2FFA5A18557DAC', 'Dolla Sign', '0960667584', 9, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-12 14:23:46', 0),
(64, 45, 'Samsung Laptop ', '90%nit Samsung Gaming Laptop \n500GB HDD, 6GB Ram, Core i5\nNvidia GeForce GT 330M, 2GB Dedicated Memory, 15.3" Wide\n2*3.0 USB Ports, 2*2.0 USB Ports, HDMI, VGA, CD ROM, Web Cam\n20minutes Battery and Five Keys not Working \nJust Give Me #K1700\nCall 0978889994', 2, 1700, '97FF067A484C4122D2924613327F763D,B365F95C42FDE49F1CE1BDDCD67D6CFF,E63C1012C44DB09AA29D935A5EC61B76', '97FF067A484C4122D2924613327F763D', 'Mubita ', '0978889994', 9, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-12 14:28:14', 0),
(65, 45, 'Dell Latitude ', 'Dell Latitude E6420 core i5 4GB ram 320GB hdd dead battery K1600 or swap 0976615927', 2, 1600, '95D2036D7028AE7CF194D58D1E0D50B5,C25C35BFFE896F87EDB9FD57050E0C6E,4E1BCC5DF04CC2CEF5E93D75572C2F7E', '95D2036D7028AE7CF194D58D1E0D50B5', '0960509422', '0960509422', 9, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-12 14:35:36', 0),
(66, 45, 'HTC desire ', 'HTC desire 626 16go inbelt,Android 6.1,screen 5inch K1100 neg call 0973395657', 2, 1100, '23DD7DC406E1A2B746ADF15E8BA92D06,A917615933AC8BA6D23BEBD8F606E610', '23DD7DC406E1A2B746ADF15E8BA92D06', 'Ama Deals', '0973395657', 10, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-12 14:46:50', 0),
(67, 45, 'PLOTS', 'PLOTS FOR SALE IN KABANANA GOVERNMENT FARMS\nSIZE:20Ã—20 METRES\ncall me on 0972431219 or whatsapp me on ', 1, 0, 'D527CA35E33C0E99ACEFD8E8FB468BF2,1171F3A3940B8A2A8847176F3BF5FAFC', 'D527CA35E33C0E99ACEFD8E8FB468BF2', 'SWIFT', '0965138913', 13, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-12 15:35:22', 0),
(68, 45, 'RENT', '4 BEDROOMED STAND ALONE HOUSE FOR RENT IN CHALALA NEAR ARTHUR WING SCHOOL. \n2 OF THE BEDROOMS ARE MASTER SELF CONTAINED. NEAT. MODERN FITTINGS IN PLACE. GEYSERS, AIRCON. PAVED YARD, OVERHEAD WATER STORAGE TANK.\n\nK4500X3months.\n\nCALL NATHAN: 0971811817/0955660429', 0, 4500, '8D056C5C263B86DF50658EF51322A3FC,9D5840621A5012C3CF55D290B073C917', '8D056C5C263B86DF50658EF51322A3FC', 'Nathan Lwipa ', '0955660429', 13, 1, 1, 11, '0', 'Chalala', 1, 0, '2017-08-12 15:39:09', 0),
(69, 45, 'PLOTS FOR SALE', 'SALE SALE SALE\n2 bedroomed cottage, and a 3 bedroomed Incomplete house in a wall fence with a gate,with water and electricity, 3 bedroomed on a lintel level on a 20m x 45m,in LIBALA south on a title @ k550,000 negotiable ,near high life contact 0978608799/0969784633/0953204821', 0, 550000, 'DBCAB1991CA5BBF9E0E532F2F9712FCB,A423FD84D25FD4F265A3E7E9CC4EF045', 'DBCAB1991CA5BBF9E0E532F2F9712FCB', 'Tendai Chipungu', '0953204821', 13, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-12 17:36:05', 0),
(70, 45, 'RENT', 'Neat bedsitter, going at k1500 Ã—2 or 3 . Will be available 1st September, location chalala off shantumbu Rd 0977677891', 0, 1500, '40AAE5F2E6D1DDF30EBADDD22EAA74B8,4E3F9B957EA06F7EE8E7B873F378C0F1', '40AAE5F2E6D1DDF30EBADDD22EAA74B8', 'Maurice ', '0977677891', 13, 1, 1, 11, '0', 'Chalala', 1, 0, '2017-08-12 17:39:38', 0),
(71, 45, 'RENT', 'MODERN FLATS FOR RENT IN IBEX HILL OPPOSITE MEMORIAL PARK TWIMPAM RD 3BEDROOMED MASTER SELF CONTAINED MODERN FITTINGS ONLY K12 000 CALL 0979153414', 0, 12000, 'EB474B39C1BD8B4222DF9AC317A33DFB,331504A329B753490A3757B579D239C1,28704303019F1A9A9E175839AED93F59', 'EB474B39C1BD8B4222DF9AC317A33DFB', 'Joshua', '0979153414', 13, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-12 17:58:24', 0),
(72, 45, 'RENT', 'FOR RENT...3 BEDROOMED FLATS MASTER SELF CONTAINEDS OPPOSITE MEMORIAL PARK TWIMPAM RD TO BE YOUR LIVING HOME MORDEN FITTINGS PAVED YARD REMOTE CONTROL GATE GERZERS GOING AT K8000 BY 3 MONTHS PLUS 1 MONTH SECURITY DEPOSIT VIEWING CONTACT ME ON 0979153414', 0, 8000, '601D1866EA5EA46357BDFDFDA7C4EDA2,DCA5B084C84451AD7E7606D22E9754FC,76E0B8D8FFF9335D2060E23637622991', '601D1866EA5EA46357BDFDFDA7C4EDA2', 'Joshua', ' 0979153414', 13, 1, 1, 11, '0', 'Lusaka', 3, 0, '2017-08-12 18:00:23', 0),
(73, 45, 'RENT', 'Rent\nSalama park\nCall 0979153414\nRentals k4500\nNewly built executive 3 bedrooms standalone house.\nMSC with modern kitchen, tiles, and wardrobes.\nBorehole and electric fence', 0, 4500, 'BFD186E8EB3645635103B4976D2C193B,50A3D8FE8187C4485C66734DB66102D1,DE83395E81D43F913CC88AC86B117EAA', 'BFD186E8EB3645635103B4976D2C193B', 'Joshua', '0979153414', 13, 1, 1, 11, '0', 'Salama Park', 1, 0, '2017-08-12 18:04:29', 0),
(74, 45, 'Sale', '3 bedroomed house msc for sale k550.000 negotiable in libala near Dr Hu call the owner on 0979039384', 0, 550000, '5155D4BEF1F534A55E265113E07218C1,09608081B538C99C87598D455B09F023,C530F3C7CE1E42147DE165D4EB62482B', '5155D4BEF1F534A55E265113E07218C1', 'Chiko', ' 0979039384', 13, 1, 1, 11, '0', 'Libala', 3, 0, '2017-08-12 18:07:24', 0),
(75, 45, 'TOYOTA RUNX', 'TOYOTA RUNX \nMODEL 2006\nMILEAGE 39000Km\nConsumption 1.5 litres \nUnregistered Recent import\noffers please \nContact 0977154118', 0, 0, 'F80100152871EFE9E458A91E8BADF944,1C177F4C09323D8EE5E9B0BEC6A19C04,7B09A73A72D29FEBA053E2862762D6E2', 'F80100152871EFE9E458A91E8BADF944', 'Chibuye', '0977154118', 8, 1, 1, 11, '0', 'Lusala', 1, 0, '2017-08-12 18:13:02', 0),
(76, 45, 'ALLION TOYOTA', 'Not cleared just arrived, Toyota corolla and Allion', 0, 32000, 'E2D96E843E16DA616A88ECC942CADB72,F27FDAF12FF2174DC83B25550BB58FD7,D8322C5624D1CD044A5CA6E381C44A91', 'E2D96E843E16DA616A88ECC942CADB72', 'Mulwe', 'O977962004 ', 7, 1, 9, 50, '0', 'Nakonde', 2, 0, '2017-08-12 18:23:02', 0),
(77, 45, 'TOYOTA SPACIO', 'Spacio new shape \nImmaculate condition\nEngine 1nz\nFor more info call/whatsapp 0977227590', 2, 0, 'D6B88A67C9F3A206AB3E67953DDBB473,04BD1D5E120145D6F80DAC0EDDDF8287,FD018AFEF38DDF4CC386F03F50BAFC25', 'D6B88A67C9F3A206AB3E67953DDBB473', 'Phiri Ben', '0977227590', 8, 1, 1, 11, '0', 'Woodlands', 1, 0, '2017-08-12 18:28:46', 0),
(78, 45, 'Toyota Corrolla', 'Corolla for sale in Lusaka k23 only you can call or whatsapp 0977346228', 0, 23000, '3B7A9F608A6B3C89EDA79CDDA71363B8,1BE2B80282AFE519BBF88550C0567CE0,5F1769CEA77A413288327C9CDE011B15', '3B7A9F608A6B3C89EDA79CDDA71363B8', '0960509422', '0977346228', 6, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-12 18:35:30', 0),
(79, 45, 'RUNX', 'I just need k35,000 negotiable, if interested call or app 0977191000', 0, 35000, 'F69A67371A245AD45535FDD3A4936421,9C5144427C7BF02234BFE1F9B5C67E56,62FBC1C79A4422B68E6F2DD7B453DA35', 'F69A67371A245AD45535FDD3A4936421', 'ALbert Chikuta', '0977191000', 8, 1, 4, 14, '0', 'livingstone', 2, 0, '2017-08-12 18:37:01', 0),
(80, 45, 'Honda Edix', 'Whatsapp 0979190877', 2, 80000, 'B8987DD45D64B08B4983BD2C1B54442A,B95B86A79A63DFFE1FB0F1D4189E526B,2990BC2881A2BE1604736D7EAC77113D', 'B8987DD45D64B08B4983BD2C1B54442A', 'Standwell Chipeta', ' 0979190877', 7, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-12 18:38:36', 0),
(81, 45, 'Glanza Body ', 'Toyota GlanzaV (Sport) Body for sale, comes with most of the engine parts, gear box, turbo and everything intact.\nJust needs another block and pistons.\nSerious business no joker''s k17000.\nCall/ Whatsapp 0977320275', 3, 17000, '83F22970377D6220F79305CB5D8BB74E,34884AD4E6575E45B385ACAC993B0917,2CA0DDA8ACA61B15F7BA6CDEF7DD4E7E', '83F22970377D6220F79305CB5D8BB74E', 'MK BANDA', '0977320275', 7, 1, 1, 11, '0', 'Lusaka', 48, 0, '2017-08-12 18:40:27', 0),
(82, 45, 'Toyota Allion ', 'Toyota alion for sale k 57000neg call 0965006455', 2, 57000, '286C00EF6567D704868785CE6FFE3017,7480962490E6459AAE6816F1FF54C4D3,F05B6B8442868878CF725C7131B6A759', '286C00EF6567D704868785CE6FFE3017', 'Alhaj Ahmad', '0965006455', 6, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-12 18:42:36', 0),
(83, 45, 'HP 440', 'HP 440 G3 CORE I5 6TH GENERATION 2.3GHZ 500GB HDD 8GB DDR4 100% PERCENT NEAT 8HOURS BATTERY LIFE\n$360\nTwin Palms Shopping Mall\nWHATSAPP 0968771770', 2, 3600, '3A7BDF9202D08D0B6AA09A17AE689AE9,3D96AC79E8C2212594F9F3B12ADB34F4,E6EEDB625B7752618433388D2D762407', '3A7BDF9202D08D0B6AA09A17AE689AE9', 'Lopez Mwila', '0968771770', 9, 1, 1, 11, '0', 'Twin Palm', 1, 0, '2017-08-13 05:36:48', 0),
(84, 45, 'Acer Aspire', 'Acer Aspire, 4gb ram, 500gb hard drive with touchscreen. Selling at k2300. Call/whatsapp: 0971796408', 2, 2300, '44A6A27BE0F951766EE1B4B2B927B7DA,AFD185AE2E729963980DCF383B8557F4,06276412DBFE32C9B1D6C3DA7257C07E', '44A6A27BE0F951766EE1B4B2B927B7DA', 'Mulenga Kabwe', '0971796408', 9, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-13 05:40:54', 0),
(85, 45, 'ThinkPad Lenovo', 'ThinkPad edge 540, 500 GB hdd, 4gb ram, AMD r256 graphics and Intel 5500 HD graphics. Battery 5hours \nPrice negotiable \nCall:0978915628\n\n', 1, 0, '8004C392080023571928BE8A9BB8E44B,7030210D08E4B6B746BF1BF3FAFAF9CD,375E06F23F78CCD3DBA76500955EC353', '8004C392080023571928BE8A9BB8E44B', 'Tumelo Tutu Mahoste', '0978915628', 9, 1, 1, 11, '0', 'Lusaka', 3, 0, '2017-08-13 05:42:54', 0),
(86, 45, 'Dashiki Shirts', 'Dashiki shirts at k85 call or WhatsaApp me on 0979014950', 0, 85, '23CAAB1AE40A916AC090B64557267ED9,91E1B6819AE06564B86F841A87B52941', '23CAAB1AE40A916AC090B64557267ED9', 'Elizabeth Smith', ' 0979014950', 16, 1, 1, 11, '0', 'Lusaka', 3, 0, '2017-08-13 05:48:01', 0),
(87, 45, 'Shoes', 'Make an order now while stocks last 0978999383 landing on Friday we start delivering', 0, 500, 'F0093B6DF9E8BA5981A21CF59D30C029,F3C1386D04ED6CD313CB56FB85BE88DD,126F7977601E69FCC70714CB44CAE67B', 'F0093B6DF9E8BA5981A21CF59D30C029', 'Dams Sandram', '0978999383', 17, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-13 05:49:55', 0),
(88, 45, 'Hand Bags ', 'Contact us on 0978460209 or 0972048537\nAvailable Colours include:Wine Red,Black and Blue\nLocation: Along Cha Cha Cha road, opposite town centre, I&A building, room A12 (First Floor),Lusaka,Town!', 1, 750, 'A13BB8E961E50B164ED27BF58390620A,1A508B03996729C8DCE106549E81333B', 'A13BB8E961E50B164ED27BF58390620A', 'Grace Kyombo', '0972048537', 19, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-13 05:52:05', 0),
(89, 45, 'Handy Bags ', 'Original Nine West Bags On Sale@Brizi. \n$65. \nK650. Delivered. Deposits Accepted. \nPlease inbox or WhatsApp your personal shopper on +260977117770 +447490163742 for orders or info.. \nHurry While Stocks Last....', 1, 650, '47E7E3B94D851609CB33D891289F8806,1FBAA8D2EF74BCFC317FA8CE22687087', '47E7E3B94D851609CB33D891289F8806', 'Briz I-store', '+260977117770', 19, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-13 05:54:05', 0),
(90, 45, 'Dashiki', 'Selling dashiki at k100 each\nIf interested inbox or WhatsApp on +260950628209\n\n', 0, 100, '4D340837BA79F7C9C59AE02C13BA5C18,45709DD240B30D600BEB8D3028B54324,D10A09033BA1DBB31517CBFD4168F8B1', '4D340837BA79F7C9C59AE02C13BA5C18', 'Pata ', '260950628209', 19, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-13 05:55:52', 0),
(91, 45, 'Asus COnvertible ', 'New Asus Convertible Laptops @ K2,000\nCan be used as a laptop and Tablet \nUpto to 18hrs Battery Life \nIntel atom 1.44Ghz Processor \n2gb Ram \n200Gb Hard Drive \nHas rear and front Camera \nHDMI PORT-3.0usb ports \nComes with original Power Pack..........call on. 0974155100..............0966224926', 1, 2000, '4EF134DFA8133E045C3075500FC5BF20,642E11E955A14A0C46A6755188422E59', '4EF134DFA8133E045C3075500FC5BF20', 'Enious Siame', '0974155100', 9, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-13 05:58:19', 0),
(92, 45, 'Siemens Mini Laptop ', 'Siemens mini Laptop, 160GB hard drive, 2GB ram 4hrs battery neat as new perfect condition K1100', 0, 1100, 'BBCCAA13F275492112FEDB565FD94C92,613A2D0C9DCB0121EB91E7BAEB8A0C66', 'BBCCAA13F275492112FEDB565FD94C92', 'Winna Nshimbi', '0974873480', 9, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-13 06:01:23', 0),
(93, 45, 'Huawei y6II', 'Neat Huawei y6ii 16gb inbelt 2gb am going at k850 call /whatsapp me on 0978571604 be lsk', 2, 850, 'A89833E745DD129861E6A6E04A8F07CA,9E25956B98229F5C2F1CCACBB4735722,FF0E7787C2D616D473CFBC90B6D7A281', 'A89833E745DD129861E6A6E04A8F07CA', 'Victor Mwila', '0978571604', 10, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-13 11:03:22', 0),
(94, 45, 'Huawei Y635', 'Huawei Y635 for sale neat 8gb, 1gb ram @k650 call 0977994797 lsk', 3, 650, '08573BEA285DD3BCD4857E834AAA0C90,966C4FA5B765A1BE49E2B41C7D7CF124', '08573BEA285DD3BCD4857E834AAA0C90', 'Edwin Mtonga', '0977994797', 10, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-13 11:05:43', 0),
(95, 45, 'Samsung Galaxy A5 2017', 'Samsung Galaxy A5 2017', 2, 3300, 'AE86A6A4D7B88FD0A918588031E00DDB,671486C102041586226D2B4F50E7066F,B66BD42B8641EAB7FFCBB4B9EC17E9DD', 'AE86A6A4D7B88FD0A918588031E00DDB', 'Joseph Kasanga ', '0964057628', 10, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-13 11:08:16', 0),
(96, 45, 'LG tredeno', 'Super neat LG tredeno k700\n8gb 1gb ram\n5 inches\n8mp back\n5mp front camera\n5.1 android version\n4g net\nOr direct swap with a super neat s11\nCall 0953211795', 3, 700, '784752E1DF95F27A3ED37EC44DE83F49,CECFEBBEE95F1058B71B683543D2C54E', '784752E1DF95F27A3ED37EC44DE83F49', 'Tyree Yang', '0953211795', 10, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-13 11:10:34', 0),
(97, 45, 'HUawei GINI', 'Call texted WhatsApp 0977830604//095411222\n=====================================\n32GB\n3GB RAM\n16/8MP ULTRA PIXEL\n5.8" SCREEN\nK1600', 2, 1600, 'C5213E12E3DD53ABC7253BE32B057184,995EB6E009CFAA6303C4082879C015A5,243BBCE9FDC6A94D54BC831E8792AE42', 'C5213E12E3DD53ABC7253BE32B057184', 'Andrew Mukela', '0977830604', 10, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-13 11:13:39', 0),
(98, 45, 'Galaxy Alfa', 'Neat as seen... 32GB\nHala at me on 0977594302', 2, 1300, '562B079BA2A839D91A37E00DA791253F,C9EC2EE74F27D5DCE93C6B60A7C99435,566A49FCD1D76BBFF8ABA142BE704885', '562B079BA2A839D91A37E00DA791253F', 'Hope Paul Nyirenda ', '0977594302', 10, 1, 1, 11, '0', 'Lusaka', 3, 0, '2017-08-13 11:17:05', 0),
(99, 45, 'Toshiba Notebook', 'Toshiba notebook on sale 2gb RM and 32gb inblt shap what do HV 4 me 0966504031', 3, 0, 'DDA0B1C94767390EABB9B6418EC9CC7E,A8A4C11577EAA2A8289E4599E883C902', 'DDA0B1C94767390EABB9B6418EC9CC7E', 'Lukoz ', '0966504031', 10, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-13 11:20:49', 0),
(100, 45, 'Iphone 6', 'Iphone6,oukitel WhatsApp me or call for more details', 3, 0, '20A73F24C8A09B1FE1EC0438DFACC30D,B4B651031106B16423AB803CBF974CAD', '20A73F24C8A09B1FE1EC0438DFACC30D', 'Alfredz Lute', '0971109709', 10, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-13 11:23:58', 0),
(101, 45, 'Iphone 6', 'Space Grey iPhone 6 at K3250, 16 GB inbuilt memory boxed with all accessories. Contact 0979188859 / 0964727742', 2, 3250, '6170BF606BD03D839C667601F06A75CE,56BA0F2398D14874DE72B7BC48FF93A1,153E0E653FF7CAC9E5DECFFCF38A51D8', '6170BF606BD03D839C667601F06A75CE', 'Kabambanyama Chirwa', ' 0979188859', 10, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-13 11:26:19', 0),
(102, 45, 'iPhone 6 64GB', 'Sensor pressure, minor crack on front cam, strong battery, fully functional. 99% neat, k2900 negotiable. call or text 0979070510. CASH OFFERS ONLY.', 3, 2900, '763F7902B35EFEBE70D2E070093B96B9,21368F78821C37EAF606E9BBDAFB7BF1,F6D49D46BB7133FEF2510F8DFE4F483F', '763F7902B35EFEBE70D2E070093B96B9', 'Chiza Chilanga ', '0979070510', 10, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-13 11:31:09', 0),
(103, 45, 'Toyota Allion', 'Allion for sale 36000neg call 0973637555 for viewing', 3, 36000, '5FD5D9238A51E1738CB3B7B8DE270984,A3ADA427BC5FE6DE0D086974D2A7759E,CA3B62AF14341C146482050ECA8EC314', '5FD5D9238A51E1738CB3B7B8DE270984', 'Nell Steele', '0973637555', 6, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-13 12:29:32', 0),
(104, 45, 'Toyota Runx', 'Buy and drive \nK38 000\n122 mileage\nCall 0973317399', 3, 38000, '327E9C755E3EDFF073967C99A8A2C495,02E1EA4DE67F62451882DD28BA5325B8,946E284ECA000D8EC8D93A26EE7457D8', '327E9C755E3EDFF073967C99A8A2C495', 'CHombola Mazyopa', '0973317399', 6, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-13 12:35:16', 0),
(105, 45, 'Toyata IST', 'Price K46000 Call 0976700000', 2, 46000, 'D02801F48CC8364871BD390B5148AD84,768F2D5F7D655641B885D75091AAC9AD,5D3883DE8BD1A84CA30B36BDBFFCC0BD', 'D02801F48CC8364871BD390B5148AD84', 'Kasubika Ronnie', ' 0976700000', 6, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-13 12:40:42', 0),
(106, 45, 'ToyoTa Spacia', 'Very good condition and only a year old is this VITZ.... Asking for K29000 Negotiable... Call 0977807585\n\n', 2, 29000, '57922CD86B3D3498582E6CB8B1027714,379C7E560855248E8971ED1B6934BC57', '57922CD86B3D3498582E6CB8B1027714', 'Banda Elda', '0977807585', 6, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-13 12:52:40', 0),
(107, 45, 'MSI mini ', 'Neat mini laptop with 2gb ram 320gb hdd 3hrs battery life up for grabs lsk call on 0976276465', 2, 0, '91A8C8E7BDC0E6B743CE3385A340AE9B,B4F7AC775ED86CD461A1AB3827D3B752', '91A8C8E7BDC0E6B743CE3385A340AE9B', 'Sage Nyirongo', '0976276465', 9, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-13 12:59:24', 0),
(108, 45, 'HILUX', 'Toyota Hilux 2008 full house 4x4 1kd engine call 0953284178', 2, 0, '266730862F502B146C0C4F9DA5878C98,A4B15168B43E8B507FD4B9DE8047A8AA,DF1E753DEEBCDFA59D561460C4803264', '266730862F502B146C0C4F9DA5878C98', 'Leo Ziko', '0953284178', 8, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-13 13:03:36', 0),
(109, 45, 'IST TOYOTA', 'Neat as seen.just arrived.asking price 58,000.call or whatsapp 0965571829.location ndola.', 1, 58000, '2A019690DE36899ED7A16EBA9C78D54A,369F7BF50CB8306897D4C7EEC296CE91', '2A019690DE36899ED7A16EBA9C78D54A', 'Jack Chanda ', '0965571829', 7, 1, 3, 26, '0', 'Ndola', 1, 0, '2017-08-13 13:06:47', 0),
(110, 45, 'Allion', 'Model 2004\nMileage 68\nK50\nApp or call 0976164998', 1, 50000, '9893CCB02C558536F7A71D7D1515795A,4B7A097AC4A5F16EFE05339250F5A070', '9893CCB02C558536F7A71D7D1515795A', 'Alfred ALpacino ', '0976164998', 6, 1, 1, 11, '0', 'Lusaka', 3, 0, '2017-08-13 13:10:08', 0),
(111, 45, 'MITSUBISHI PAJERO', 'MITSUBISH PAJERO\nMODEL 2001\nMileage 121 000km\nConsumption 3.2 litres \nEngine type 4M41\nDiesel engine\nPerfect Runner buy and drive \nK60 000 neg \nContact 0974638488 or 0953285608', 2, 60000, '8BDD81D72BB8F12582784CA5E9C41A0F,5D7BB881891BA026F101F17C14057BF2', '8BDD81D72BB8F12582784CA5E9C41A0F', 'Mike Koko Lukaki', '0953285608', 8, 1, 1, 11, '0', 'lusaka ', 1, 0, '2017-08-13 13:14:05', 0),
(112, 45, 'HP laptop', 'Neat hp laptop with 4gb ram 160gb hdd 2hrs battery life going for k1200....lsk call on 0976276465', 2, 1200, 'E967064C89FC5A24C90C73427E2E1DB3,93B70DE8F5C813B2766068718039E6B1', 'E967064C89FC5A24C90C73427E2E1DB3', '0960509422', '0976276465', 9, 1, 1, 11, '0', 'lusaka', 1, 0, '2017-08-13 13:18:49', 0),
(113, 45, 'Asus Mini', 'New stock (Asus mini laptops)\n12.1 inch screen \n320 gb 2 gb ram \nK1650 each \nNew state/with power packs \nGood battery life \nCall/whatsapp 0976704529', 2, 1650, 'BB464295BB4AAD5324EC112CFDEEBBBE,0E6897A6A162C832109D321E77D5EE3A,B609AC2FAF2B84CCC618947F9C98287A', 'BB464295BB4AAD5324EC112CFDEEBBBE', 'Gibson Phiri', '0976704529', 9, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-13 13:38:13', 0),
(114, 45, 'Honda Stream', 'Honda stream, pressure free,25 pin negotiable, call or WhatsApp 0971508714', 2, 25000, '792EAC723C1DBE1D2E86E44707B5816E,F77F4800EBB892A6FE52AF64A26A9519', '792EAC723C1DBE1D2E86E44707B5816E', 'Simasiku Sicecanni ', '0971508714', 7, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-13 13:41:26', 0),
(115, 45, 'PS3', 'Neat ps3 with 10 games inside and a 500g hdd up for grabs lsk call on 0976276465', 2, 0, 'D24DBFF3F37A8CCBFDDB526C15E9C4B8,A370CDD493306D6C94F836B960685373', 'D24DBFF3F37A8CCBFDDB526C15E9C4B8', 'Sage Nyirongo ', '0976276465', 12, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-13 13:44:13', 0),
(116, 45, 'HUawei P8 ', 'Huawei P8 original. Superneat! Give me Kr2,000 cash. Top ups accepted! LSK\n-5.2inch super HD IPS Display\n-16GB, 3GB RAM\n-13MP, 8MP FRONT\n-Running on 8 CPU CORES\n+260974508579', 3, 2000, '9A72FC90CF87633C99E39AEA0ED88BB1,0FFFFC64972BD1E093C35507934B29F3', '9A72FC90CF87633C99E39AEA0ED88BB1', 'Konstance Musonda ', '+260974508579', 10, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-13 14:30:03', 0),
(117, 45, 'Iphone 6', 'Call 0973601600 / WhatsApp 0965588355\n16gb k3000', 2, 3000, '8268F8153725C3B6C0B1B1A5737EED85,AB8ACDA663F5F67EEBF7E7223953614C', '8268F8153725C3B6C0B1B1A5737EED85', 'William Muchindu ', '0965588355', 10, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-13 14:37:12', 0),
(118, 45, 'VW Appolo', 'VW Polo \n2006 Model\nMileage 114\nWith new suspension & two Original Keys \nK40, 000\nCall/ Whatsapp 0966572104', 2, 40000, 'A6C4DCB44AD441436F503E212BB637BF,E5B6FF3B7832D5C754F15164E6A420D9', 'A6C4DCB44AD441436F503E212BB637BF', 'Manuel Choonga', '0966572104', 6, 1, 1, 11, '0', 'Lusaka', 40, 0, '2017-08-13 14:42:57', 0),
(119, 45, 'Fridge ', 'Household goods for sale, contact me on 0977490769', 3, 0, '39A28FC0D0176D46A997792B31E8A77E,10C5FC52687814533DA8AA3CB5557670', '39A28FC0D0176D46A997792B31E8A77E', 'Chipazyo Mbewe', '0977490769', 19, 1, 1, 11, '0', 'Lusaka', 5, 0, '2017-08-13 16:50:04', 0),
(120, 45, 'BEDS', 'Household goods for sale, contact me on 0977490769', 1, 0, '4298CE594F397A63033049CA409D46BE,EA21D968A98FAB5D50FD16DF5B1795C1', '4298CE594F397A63033049CA409D46BE', 'Chipazyo Mbewe', '0977490769', 18, 1, 1, 11, '0', 'Lusaka', 4, 0, '2017-08-13 16:51:54', 0),
(121, 45, 'DSTV Decoder ', 'K200 DSTV am in Chelstone 0978864096', 3, 200, 'D46791C9849C9627D7B0FC8E8AF21949,87DB979018EE3AFC197886C0B5D5180E', 'D46791C9849C9627D7B0FC8E8AF21949', 'Douglas Mweemba ', '0978864096', 12, 1, 1, 11, '0', 'CHelston', 4, 0, '2017-08-13 16:55:02', 0),
(122, 45, 'Fridge', 'KIC UPRIGHT FRIDGE WITH WATER DISPENSER 410LTRS..K2300 CALL 0955188602/0964188602/0973421109 IN KABWATA.', 2, 2300, '3FEFF7535A631067275C696036961375,083F9318E68583916502BE8D50903C3B,6D0BD3091E4B2CC8DAF71E4E2462A81D', '3FEFF7535A631067275C696036961375', 'Mangani Sakala', '0955188602', 19, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-13 16:57:38', 0),
(123, 45, 'Chest Drawers ', 'Chest of drawers only have 1 remaining going at k1000 lusaka call 0972752338', 0, 1000, '1941D92B04DA8EF4E40BD408AFB1D8AA,4E274FF2EA612BF21D94F71E6EF118CF', '1941D92B04DA8EF4E40BD408AFB1D8AA', 'Glam', '0972752338', 18, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-13 17:01:16', 0),
(124, 45, 'Subwoofer', 'Subwoofer for sell K500 negotiable, call 0974864038', 3, 500, '46909A01CA49586A156BBD4BDEDBFED3,3869423BCC1BEE5A9EE4F9C47A508492', '46909A01CA49586A156BBD4BDEDBFED3', 'Suzyo Kangombe', '0974864038', 12, 1, 1, 11, '0', 'Lusaka', 3, 0, '2017-08-13 17:05:08', 0),
(125, 45, 'Furniture', 'Price reduced just call me 0979774955 m in chelstone', 0, 0, '8E6E39E4C0FB418D176F2D3ADA8F3028,A0BFC4DE62803B8FE6DBDB3BFF2AC98C', '8E6E39E4C0FB418D176F2D3ADA8F3028', 'Victor Jenkins', '0979774955', 18, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-13 18:56:27', 0),
(126, 45, 'RENT', 'VACANT FLAT FOR RENT IN CHALALA BEHIND COOPERATIVE COLLAGE 2BEDRM MSC K3500 CALL 0977352657', 3, 3500, 'C0FF67616D16A769ED046424FF5F977E,4C6CFB5905D24995B9C73E6AAE957CE3,9F032FB15441591F484571DFD5E96A06', 'C0FF67616D16A769ED046424FF5F977E', 'Knivel', '0977352657', 13, 1, 1, 11, '0', 'Lusaka', 3, 0, '2017-08-13 19:28:33', 0),
(127, 45, 'RENT', 'MODERN FLAT FOR RENT IN IBEXHILL NEAR CROSSROADS 3BEDROOMED MASTER BEDROOM SELFCONTAIN WITH AIRCON & SWIMMING POOL AVAILABLE ONLY K15 000 WITH DISCOUNT CALL 0977352657', 1, 15000, 'BB600842B92E840269E5ED24931523A2,D5521921027B7FC14E88EEF2469168A2', 'BB600842B92E840269E5ED24931523A2', 'Knivel', '0977352657', 13, 1, 1, 11, '0', 'lusaka', 3, 0, '2017-08-13 19:37:21', 0),
(128, 45, 'RENT', 'MODERN FLATS FOR RENT IN IBEXHILL NEAR CHOPIES MORE 3BEDROOMED MSC IN COMPLEX ONLY K5500 CALL 0977352657', 2, 5500, '8F91B9E2FFF527F01F905B46B39C113B,783409E9C23D191B6F4E97064DD5AA46', '8F91B9E2FFF527F01F905B46B39C113B', 'Knivel', '0977352657', 13, 1, 1, 11, '0', 'Lusaka', 21, 0, '2017-08-13 19:44:37', 0),
(129, 45, 'Infinix zero 3', 'A month old infinix zero 3 x552 \nRam 3Gb \ninbelt 16Gb\nprimary cam 20.7mp\n4G LITE\nGoing at k1600 or top up on note 3 0955812102', 2, 1600, '584355CA14398678EBC08212047CB983,C3A702CD1D20A0E361A1F0B600A9D18D', '584355CA14398678EBC08212047CB983', 'Zeck Man Brown ', '0955812102', 10, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-14 16:25:11', 0),
(130, 45, 'AUdi A3', 'Lady driven Audi A3\n1.8 Engine \nNeat interior\nNeeds cylinder head\nK19 000 negotiable \n0953085011', 2, 19000, 'AA490BAD8C85AA5FA1E5B284920118E1,365E2BE61330EF94075F241A7FF300ED', 'AA490BAD8C85AA5FA1E5B284920118E1', 'Andrew Thomas', '0953085011', 6, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-14 16:28:23', 0),
(131, 45, 'Audio Sound Card ', 'New behringer 302 usb audio interface @ k700 cal 0966076389', 2, 700, 'CA38D62922544FAF63EDD17D93D35E76,E196A82A7C44DCF334E6E3D863D25ADB', 'CA38D62922544FAF63EDD17D93D35E76', 'Great ISreal', '0966076389', 12, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-14 16:29:51', 0),
(132, 45, 'Mag Rims & Tyres', 'Maggrims and tyres both secondhand and brandnew for sale call 0976809365', 1, 0, 'F3F37EF6C8748F5D3DAABF3E16B09284,0E3FD20998DAAD9D87E8CF76B67EA2AC,C2BEE7EE80450FC3552C73F6871F604A', 'F3F37EF6C8748F5D3DAABF3E16B09284', 'Greyson M Phiri', ' 0976809365', 8, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-14 16:32:05', 0),
(133, 45, 'Vvti Corrolla', '38 000kwacha call 0964027652', 2, 38000, 'C5CFC4C2C48EFCE1757385DA3360A22A,170FD2334CFC9BD0430E923E45B90493,8F8434A34A0CE17367F9E0697C51F793', 'C5CFC4C2C48EFCE1757385DA3360A22A', 'Robert Kalinda', '0964027652', 6, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-14 16:33:55', 0),
(134, 45, 'Golf', 'Give me 28000.....buy and drive.....no pressure 0979332046', 3, 28000, 'A5A45A77394FD90370EC4BD38030A1BA,494B32C83ECDBFB8A8E0467571834C09,B03CCD8F20D3FF058D7BD18EFF96733D', 'A5A45A77394FD90370EC4BD38030A1BA', 'Musa Kalindi', '0979332046', 7, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-14 16:35:34', 0),
(135, 45, 'NOAH', 'For SALE NOAH', 3, 0, '233BEB76B01A17AE733D5D14524C9D6D,B18C7AFEF7F6083051174491DD2B04B4', '233BEB76B01A17AE733D5D14524C9D6D', 'Martin Chipanta ', '0955329533', 6, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-14 16:37:49', 0),
(136, 45, 'Toyota Dyna Truck', 'Toyota Dyna track 1.5t 4y Engine buy and Drive....K50 or Swap with a Family Car and Topup', 3, 50000, 'F247F637B5CA22060CEB86B732F33FD2,C0A93AB2A57430FBEF439DC3C447644E,92B157B3A12B5E2148FB41E640D99436', 'F247F637B5CA22060CEB86B732F33FD2', 'Brian Mutala', '0973606502', 8, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-14 16:39:55', 0),
(137, 45, 'Car Radio', 'Brand new car stereo call 0968890341', 0, 1000, '6D40E0D6B374D484C65F194DAD461D68,08B6F0049FBE97052754806BDC0B6936,80B54176D3C80E1A64464D2CE262E306', '6D40E0D6B374D484C65F194DAD461D68', 'Joshua Kalaba', '0968890341', 8, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-14 16:42:12', 0),
(138, 45, 'Hilux', 'Hilux 2012 automatic\nDiesel 4*4\nPrice K300,000\nCall 0978176935/0971898687', 1, 300000, '6AF887213EDD083A9CCE39018240C3BC,8B5CC1B6DFCDCAA50DCDB3DBEE6B3D05,68FAEBB37C5AD67B2D6477C5ED8CDB1F,8CEFCF6A9C147F0388E9BC9D4907B867', '6AF887213EDD083A9CCE39018240C3BC', 'Davy Mukuka', '0971898687', 8, 1, 1, 11, '0', 'Lusaka', 8, 0, '2017-08-14 16:44:19', 0),
(139, 45, 'Fridge', 'Samsung double door fridge with dispenser \nK5000neg\nCall/Text/WhatsApp \n0975039703', 2, 5000, 'DB57D813F888F370B4EF632F4881161B,AF350DA9CA53F52D5904EFAA2F86197A,BE8BAA5F658F4791027F0DE6BCF350FC', 'DB57D813F888F370B4EF632F4881161B', 'Stanley Ngwenya', '0975039703', 19, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-15 16:18:12', 0),
(140, 45, 'DECO', 'Home deco.get both at k200.0979 827273', 1, 200, 'A3D7DCABF3BDA85404A71F002A599540,C963A2788FE13FDC8DE42CF5A296E1AC', 'A3D7DCABF3BDA85404A71F002A599540', 'Rabbeca Tembo Musonda ', '0979 827273', 19, 1, 1, 11, '0', 'Lusaka', 3, 0, '2017-08-15 16:19:38', 0),
(141, 45, 'Intex Double Bed', 'Intex double bed..\nSmooth surface come with an air pump..\n@k500\nCall: 0954543001 or 0979338080', 0, 500, 'C0C426D8FFC8302800D8976E52FF1F17,5BE026566F9325867BA58F9456B676A5,6F2C77A36B3E403A365E1F1FA21E7E88', 'C0C426D8FFC8302800D8976E52FF1F17', 'Mules Plotting ', '0979338080', 18, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-15 16:21:09', 0),
(142, 45, 'Fridge', 'Anything for my upright fridge... swap or cash 1800 .... location kabwe,bwacha 0968578628 or 0972848854...', 2, 1800, '4F1BBD3A451990CEAF58798AA6D60F89,6BBD6E9F8CF808610A8F1C7F95547B12', '4F1BBD3A451990CEAF58798AA6D60F89', 'Adrian Divayi ', ' 0972848854', 19, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-15 16:22:31', 0);
INSERT INTO `info_gg_publist` (`id`, `uid`, `title`, `details`, `goodstatus`, `price`, `imgs`, `cimg`, `contactname`, `phone`, `cid`, `issell`, `addr_l1`, `addr_l2`, `addr_l3`, `addr_l4`, `views`, `wishs`, `pubtime`, `status`) VALUES
(143, 45, 'Coffee Tables ', 'Am taking orders for the, coffee tables ,dining tables, wardrobes and chest of drawers . For more information call or Whatsapp 0974024315', 0, 0, '659D06CD5C773AB6A3CB58709341132F,791B5E8EBEE50D9BF16ABB171C964BE9,49EF7A631351D62AF7DDA8FAAF76E1AB', '659D06CD5C773AB6A3CB58709341132F', 'Sharon Chilekwa', '0974024315', 19, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-15 16:24:42', 0),
(144, 45, 'Furniture', 'All the thanks to mrs mbofwana, mr & mrs sims, mr francis family, for supporting us, we are the choosen furniture manufacture for all your orders please call or watsap on 0978718992 sofas ranges between k4500 - K5500 and bed k2800- k3600', 0, 0, '266706328CF7AB7527796F7610FA8EE7,3C366C43D91205A77F1C3C373E384519,6ACD4F5B5EB3AEB1BC0862F3F575D231', '266706328CF7AB7527796F7610FA8EE7', 'Ashley Dawson', ' 0978718992', 18, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-15 16:27:26', 0),
(145, 45, 'Home Theater System', 'Brand new give me offers 0978314194', 0, 0, 'CD7FFDEAB926135A4D607578A065D22E,DC337FB8FC4B94E77E3DE25CA7FB14B9', 'CD7FFDEAB926135A4D607578A065D22E', 'Mbewe Bryan', ' 0978314194', 19, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-15 16:29:00', 0),
(146, 45, 'Stove', 'K2500 neat and very good condition. \nContact 0972 170379', 2, 2500, '75FAFBD72D6677E889896BFC4B003758,2089A1F229E657A4B8BCDED48B249608', '75FAFBD72D6677E889896BFC4B003758', 'Vivian Mwelwa', '0972 170379', 19, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-15 16:30:54', 0),
(147, 45, 'Home Theater', 'Lg Home theater comes with all cables(av) five speakers going at k850(negotiable) if intrested please contact 0974153731', 3, 850, '97EE37B1A84555EB3A2124C7D5682965,27CFFF5030CB9052109691E464A16B78,35B4EE8849502A42E1EA3FB96DD5755B', '97EE37B1A84555EB3A2124C7D5682965', 'Sanaa Rufaro', '0974153731', 19, 1, 1, 11, '0', 'Lusaka', 3, 0, '2017-08-15 16:33:04', 0),
(148, 45, 'Toyota Allion ', 'toyota allion 42000 negotiable call our watsp 0964043374', 0, 42000, '17FE0A3319E5B3AEF52A0908AD6695B2,A9A695DE65728AB81F9B0ACB0085A584', '17FE0A3319E5B3AEF52A0908AD6695B2', 'Joel Musutu', '0964043374', 6, 1, 3, 13, '0', 'Kitwe', 1, 0, '2017-08-15 16:35:27', 0),
(149, 45, 'House for Sale', 'Still available k85pin or swap with a car and top up, call/whtsup 0971485548,Choma town', 0, 85000, '8BE1AC40B8F64B3FEF7D930BCFD4A64B,E6DF290339BA728FCC8C8D28A5FF8443,603E26D7A21D4468FAF587573FC28161', '8BE1AC40B8F64B3FEF7D930BCFD4A64B', 'BK MIKe', ' 0971485548', 13, 1, 4, 32, '0', 'Choma', 1, 0, '2017-08-15 16:37:52', 0),
(150, 45, 'Hilux', 'Hilux 2L intact buy n drive k55,000 \nContact 0966727393 for business', 2, 55000, '09FEDAC88E3F3766425A17E5629BB860,2CAC649723BF377D890B53217EFEA8A2,6E26B637676FC1A7B7130F3FDA4B0606', '09FEDAC88E3F3766425A17E5629BB860', 'Zauwa Mazyopa', '0966727393 ', 7, 1, 3, 13, '0', 'KItwe', 1, 0, '2017-08-15 16:39:20', 0),
(151, 45, 'Corolla', 'Toyota corolla non crystal with 5a engine automatic transmission no pressure k19nego call 0965631320', 3, 19000, 'F7FEC0D10D6015DA05E26AA179D47234,10DF5AC21E4494E1FE9B725F1D62E44D', 'F7FEC0D10D6015DA05E26AA179D47234', 'Amidu Sinkala', ' 0965631320', 7, 1, 3, 26, '0', 'Ndola', 2, 0, '2017-08-15 16:40:48', 0),
(152, 45, 'Vvti Corolla', 'Must go neat vvti 1nz\n$29\nChililabombwe\nCal me on 0968949096', 3, 29000, 'CBE14589C23F662D5429AB4ABD6ADB15,B96AE7E5A969E4D3FD563F163D6DF493,D7E51B3526458A391C966D216EC048ED', 'CBE14589C23F662D5429AB4ABD6ADB15', 'Njovu Emannuel', '0968949096', 6, 1, 3, 28, '0', 'Chililabombwe', 1, 0, '2017-08-15 16:43:20', 0),
(153, 45, 'Sony Z5', 'Sony Z5 \n100% neat \nK2850 Cash Only\nContact :\n0975457509', 2, 0, '9879713B520042C2EA22DF716AAF3E2D,9FC3096481D7042FE4CC0D8CCB8B8BB3', '9879713B520042C2EA22DF716AAF3E2D', 'Chance Kalifunga', '0975457509', 10, 1, 1, 11, '0', 'Lusaka', 16, 0, '2017-08-16 16:48:19', 0),
(154, 45, 'Samsung galaxy s4', 'Samsung galaxy s4 90% neat 32gb inbuilt with strong battery call or whatsaap 0950314904', 3, 0, 'E6DA2D621AEE8EF61B0A9E2F95EC20E8,C6F6535FB70A127F25C7E23513FBD33A,4991AAFA7941DD94907C29260720EDD9', 'E6DA2D621AEE8EF61B0A9E2F95EC20E8', 'Phains Mick Choongo', '0950314904', 10, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-16 16:50:00', 0),
(155, 45, 'Samsung J7', 'Neat Samsung J7 \nDouble sim \n16gb inbuilt \nStrong battery \nK1400\nCall 0974091720', 3, 1400, 'B3122F2B653E4725F9949C644056E5F8,28119222A1369AAD864556D00A6F0FFD', 'B3122F2B653E4725F9949C644056E5F8', 'Elias Banda', ' 0974091720', 10, 1, 1, 11, '0', 'Luska', 2, 0, '2017-08-16 16:52:09', 0),
(156, 45, 'htc m9', '99% neat HTC m9, 32gb inbuilt, android 5.1 at k1300 swaps and top ups allowed 0978789922', 0, 1300, '81E22C48AFE9579818D9687AF49F28D6,A8E5297DCED868D2191EDAE2039F21EF,C3C2F1C35EB3ED7E3D0B855039987050', '81E22C48AFE9579818D9687AF49F28D6', 'Moses Lungu', '0978789922', 10, 1, 1, 11, '0', 'lusaka', 1, 0, '2017-08-16 16:57:20', 0),
(157, 45, 'Samsung S7 ', 'Another duos s7 edge very neat\n0978995051', 2, 0, 'FB55BE48DAC8BB3CBF41FD2011C27B9B,1009EBD30FC4835808DF00DD83F3F83F,F3EE4EDF0FF979D92FD1AE0635774A30', 'FB55BE48DAC8BB3CBF41FD2011C27B9B', 'Jay b wood', '0978995051', 10, 1, 1, 11, '0', 'lusaka', 3, 0, '2017-08-16 16:59:42', 0),
(158, 45, 'itel s31', '16GB AND 2GB RAM 98%NEAT AS SEEN WHATSAPP OR CALL 0971669073\nOFFER ME', 2, 0, '2ECFB2554ADF8583FA136F80F4A2E4F2,9920E3C9B1469A6C09C351A8A1A504CA,F08214EA1BBBE5A63C44829F836A47A5', '2ECFB2554ADF8583FA136F80F4A2E4F2', 'Barry Jasman', ' 0971669073 ', 10, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-16 17:02:10', 0),
(159, 45, 'Samsung S6', 'Galaxy S6 edge K2200\n$2,200 0976615927', 2, 2200, 'F95FA69BAEA7C08A74F8EE0A38888748,EA65FC6CB424797916040F40A783571E', 'F95FA69BAEA7C08A74F8EE0A38888748', 'Ben Ard', ' 0976615927', 10, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-16 17:04:16', 0),
(160, 45, 'Samsung J1 Ace', 'Neat Samsung J1 ace\nStrong battery \n4gb inbuilt \nK700\nCall 0974091720', 2, 700, '2D6ED82351FDE09139BCDE4C1D4B5287,67B9D2EE1A66DE7BB9818B6190D1C9D1', '2D6ED82351FDE09139BCDE4C1D4B5287', 'Elias Banda', '0974091720', 10, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-16 17:06:24', 0),
(161, 45, 'S6 Edge', '64gb inbuilt\n95% neat\nWhite\nVery small Inkspot & hairline\nOffers..\n0977873587', 3, 0, 'CDCEDB91968BE8A28CED638217C95C0F,6EE1C25DD9B9005A66C023429B8EE75A', 'CDCEDB91968BE8A28CED638217C95C0F', 'Chanda Chabby', '0977873587', 10, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-16 17:08:49', 0),
(162, 45, 'Techno w3', 'Tecno w3 neat 8gb inbuilt 1gb ram with one hairline affecting nun..going at k650 call 0955065727 am in town', 2, 650, '14C6B61EBBDF1754B7DEE31BFFBF92D8,FE987F22F7F4DEC1D636FEA9D40BEFEB', '14C6B61EBBDF1754B7DEE31BFFBF92D8', 'Elvis Mwale', '0955065727 ', 10, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-16 17:10:21', 0),
(163, 45, 'IST toyota', 'For sale', 2, 0, '0F5C5AF05840614C08CD5A05CC6F97F1,7D42E19CC2A3DF3425FD7D2BC3176B59', '0F5C5AF05840614C08CD5A05CC6F97F1', 'Ziko lusape', '0953284178', 7, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-19 01:51:09', 0),
(164, 45, 'Full set desktop', 'Full set desktop', 3, 0, '1553507C5D70A216FF3258685EB62A77,A33C14D0FC7E4BC3C811CCEBB6A1E76F', '1553507C5D70A216FF3258685EB62A77', 'Masautso phiri', '0979304321', 9, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-19 01:54:52', 0),
(165, 45, 'Toyota ', 'Car for sale', 3, 0, 'B7E6DD6688B1CBD3781F736B0D252427,9C6CBBAA6BCA996A9177848A5AC55349', 'B7E6DD6688B1CBD3781F736B0D252427', 'Masautso phiri', '0979304321', 6, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-19 02:00:00', 0),
(166, 45, 'Huawei mate 8 32gb', 'Super neat huawei mate 8 32 GB inbuilt memory', 2, 2800, 'FCCB460F7ACD3974D90EF9D380AA25F1,D648CC09D004684866E7E717CCF8DEB0', 'FCCB460F7ACD3974D90EF9D380AA25F1', 'Rupani', '0962477283', 10, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-19 02:04:49', 0),
(261, 45, 'Toyota noah', 'Toyota Noah unreg duty already paid milage 119+', 1, 0, '67EC13A0372C14B68ABE9F31B67E06A5,9CFC78B6BBBDE070D406F372D86316E8', '67EC13A0372C14B68ABE9F31B67E06A5', 'Matusare ', '0979304260', 8, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-26 14:53:20', 0),
(168, 45, 'Benz c200 kompresser', 'Benz c200 neat manual six front', 2, 45000, '5CB434BF31B383B359C6DE9D73F74E58,54931F8831090D2078BCCEBF7A301678,5FA801AC46F859B298996FA8007F8FC5', '5CB434BF31B383B359C6DE9D73F74E58', 'Lubumpe tembo', '0977759485', 6, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-19 02:09:59', 0),
(263, 45, 'Ford ranger ', 'Ford ranger automatic transmission 2016 model ', 2, 420000, '71CA356AB1E1BA2FE25D7A3195343D32,C255178A42D59F4BB81923422C5DACAD,C5FCB25B76CEA08840BEF920A2EE24A6', '71CA356AB1E1BA2FE25D7A3195343D32', 'Mutumina siaci', '0973163574', 8, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-26 14:59:40', 0),
(170, 45, 'IPhone 6plus 16gb inbelt', 'IPhone 6plus very neat ', 2, 3700, '1723679D2897DD82F765D456099A2BCC,B3D9F8AA84D7EA0D035FCE01471AFFB6,2DE370344D39CE00864EC4A6917B9F87', '1723679D2897DD82F765D456099A2BCC', 'Francis mwanss', ',0979554587', 10, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-19 02:14:42', 0),
(264, 45, 'Crown athlete ', 'Crown athlete pressure free milage 103 engine type 2jz ', 3, 65000, '0D530A84B2D9C331F7DA6B0CBB7CFECA,8E33C7F7A5553D7C75505C178D90FE81', '0D530A84B2D9C331F7DA6B0CBB7CFECA', 'Matusare', '0979304260', 6, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-26 15:06:27', 0),
(172, 45, 'Hiace toyota', 'Toyota hiace for sale engine 1rz no pressure at moment', 3, 35000, '77578B804A17D50D0E2F471D4555664F,F28D268597437361E9A52BCEA69448C6', '77578B804A17D50D0E2F471D4555664F', 'Pedro mweemba', '0978718944', 8, 1, 1, 11, '0', 'Lusaka', 3, 0, '2017-08-19 02:20:42', 0),
(262, 45, 'Vits', 'Keyless vits  for sale', 1, 0, '49AE0AFD3809A3AEF004F1C987FE9490,6AE2CF2B855948605FADE4D3A24F96AC', '49AE0AFD3809A3AEF004F1C987FE9490', 'Muhamed', '0977279346', 7, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-26 14:56:05', 0),
(173, 45, 'Toyota runx', 'Toyota runx call/whtsapp 0987830053', 3, 25000, '0C60D4C03F8EC5F3A4026FC2EFFBC281,7080BBEFCBB72D64C56080F05B1CB85A,2234B38FE931DF8A1F29A6D2B1BA21D9', '0C60D4C03F8EC5F3A4026FC2EFFBC281', 'Mweemba', '0077830053', 7, 1, 4, 14, '0', 'Livingstone', 1, 0, '2017-08-21 15:11:00', 0),
(175, 45, 'Honda fit', 'Going cheaply call me on 0972434211', 3, 16500, '1FCAF6D543814D2B0D1CFF6F4B5ECFCC', '1FCAF6D543814D2B0D1CFF6F4B5ECFCC', 'Ezekiel Sikanyika', '0972434211', 7, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-21 15:16:21', 0),
(265, 45, 'Corolla vvti', 'Toyota corolla vvti manual transmission ', 2, 35000, 'EA1D0CA1CBA83F4127323E506DE42901,C03E89DC59021C95D157747DD26E30F6', 'EA1D0CA1CBA83F4127323E506DE42901', 'Matusare', '0979304260', 6, 1, 1, 11, '0', 'Lusaka', 5, 0, '2017-08-26 15:09:50', 0),
(177, 45, 'Toyota rav 4', 'Quick sale rav4 3s engine its still intact a bit of negotiable', 3, 33000, '017BC39619EA480CAEAD7DA9EDCD4363,2182350644A7D81B42912F6094B6A363,DF40AD42052CFD478B7A2E5A101C2403', '017BC39619EA480CAEAD7DA9EDCD4363', 'Victor kayange', '0977487875', 7, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-21 15:26:09', 0),
(178, 45, 'Toyota noah', 'Toyota noah for sale', 3, 0, 'A5266122FE4857140F4432AB40AB8A99,EFE7D9542C136C7DF0C32C5F753EC6B9', 'A5266122FE4857140F4432AB40AB8A99', 'Martin chipanta', '0977329533', 8, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-21 15:30:09', 0),
(179, 45, 'Corolla runx', 'Toyota runx for sale call on 0978495760 milage 88+', 2, 0, 'B65DDEEBF762DEECA67CFD633AF1FA01,C5C4144D9896AB8D37025A866B72A3EF', 'B65DDEEBF762DEECA67CFD633AF1FA01', 'Peter tip hustle ', '0978495760', 7, 1, 5, 15, '0', 'Solwezi', 2, 0, '2017-08-21 15:42:08', 0),
(180, 45, 'Toyota crystallite', 'Perfect runner just needs some touches', 3, 18000, 'A3C475BE80CDB3CDB7AC207C1FA57623,3A712EA4286F2C3E14A0C30E5DBBC2DD', 'A3C475BE80CDB3CDB7AC207C1FA57623', 'Scorfy Masautso Josh barnx', '0977970488', 6, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-21 15:48:52', 0),
(181, 45, 'IPhone 5s', 'New iphones grey in color 16gb', 1, 0, '86419C5CD76A45598F46A595D27C2133,6F7E4066590CF995F152BDB540E8E9B5,DDBDE5B408D8C62B811BD3220C1EE437', '86419C5CD76A45598F46A595D27C2133', 'Ganizani lungu', '0973397480', 10, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-21 20:50:38', 0),
(182, 45, 'Nissan Datsun box type double cab', 'Nissan dutsan perfect condition TD27 engine 40,000 negotiable', 3, 40000, '1BBB9186FC0E2D4ABD1B320BD74F2738,CCBB99D42DB54D42A90B60C6C51F5ADA', '1BBB9186FC0E2D4ABD1B320BD74F2738', 'Selisio Nowel', '0977989939', 8, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-21 21:00:10', 0),
(183, 45, 'HD camera', 'HD video camera and photos 12 mp quality and good battery swap with you neat android phones', 3, 650, '79C37A69FBD7FC8EEA5F21A0FDA66992,128440B2411D64D0B6817F668A0F5245,C6775CFA6A0F6CC37E4637A858CED4B6', '79C37A69FBD7FC8EEA5F21A0FDA66992', 'Blessing muselepete', '0976307526', 12, 1, 1, 11, '0', 'Mtendere', 1, 0, '2017-08-21 21:05:56', 0),
(267, 45, 'Fridge', 'upright fridge up for sale... \nNeatness: New\nGrade: B\nit has no pressures..... it perfectly works. \ngoing at K 2000\ncontact:0972753576 or 0954210744', 3, 2000, '412405E5C460B8D420A4D36CD7039665,F5AC6FEA4915C6EF9C3AF80777339A49', '412405E5C460B8D420A4D36CD7039665', 'Robby Jefro', '0954210744', 19, 1, 1, 11, '0', 'Lusaka', 3, 0, '2017-08-27 09:01:07', 0),
(185, 45, 'Note 3', 'Galaxy note 3 can buy bundles only everything perfect american version @1300 no swaps 0975289962', 1, 1300, '192806FFF2AF16CBA2E9C765F54735A2,E35B4B53D242ED5717FB0036B59EF461', '192806FFF2AF16CBA2E9C765F54735A2', 'Wallace', '0975289962', 10, 1, 1, 11, '0', 'Lusaka', 4, 0, '2017-08-21 21:13:41', 0),
(186, 45, 'Rent', 'Newly built 2bedroomed flats for rent 3500*3 *2 security deposit along tar road chalala ', 1, 3500, 'E5790E4F19DA155CECF9B7102D8A93C3,00D2C49CFEC9AF29148D6717A081F2C7', 'E5790E4F19DA155CECF9B7102D8A93C3', 'Maurice bwalya', '0977677891', 13, 1, 1, 11, '0', 'Lusaka', 3, 0, '2017-08-21 21:22:02', 0),
(187, 45, 'Rent ', '4bedrooms MSC house in ibex near American embassy with separate bathroom/toilet/kitchen fitted with units and electric stove, water tank.', 1, 10000, 'EEFA2079A5F592B4E0ED967C0911356F', 'EEFA2079A5F592B4E0ED967C0911356F', 'Andrew lyson', '0953168798', 13, 1, 1, 11, '0', 'Ibex hill', 4, 0, '2017-08-21 21:42:52', 0),
(188, 45, 'Panasonic sytem', 'In good condition Panasonic system with tape/CD loader flashport etc for sale', 3, 2500, 'A0C724C31889A8398B9FF530574EDA8D,E3AA25D3EB08515B0CB21A8092BCB369', 'A0C724C31889A8398B9FF530574EDA8D', 'Azaria mwaka', '0977499050', 19, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-22 12:00:52', 0),
(189, 45, 'Walldrop', 'Walldrops for sale at glam furniture', 3, 0, '8D5C4E97DC5A05A4B1A97B4890111B3F,15D5B363BF6468D6B92F9F8AEA93DC82', '8D5C4E97DC5A05A4B1A97B4890111B3F', 'Glam furnitures', '097275338', 18, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-22 12:04:43', 0),
(190, 45, 'Carpets ', 'Carpets for sale assorted colors', 1, 450, '0064E40D5F85E58713EC397FC455D877,1E78439BD88E4BFD1D70418BA99D07C7', '0064E40D5F85E58713EC397FC455D877', 'House of dominiques', '0978838335', 18, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-22 12:08:02', 0),
(191, 45, 'TV stands ', 'TV stands for sale', 2, 1000, '95FFE11D6E7F9B29C2F76CF57544C466', '95FFE11D6E7F9B29C2F76CF57544C466', 'Gaspardo millo', '0968182608', 18, 1, 1, 11, '0', 'Lusaka', 4, 0, '2017-08-22 17:21:26', 0),
(192, 45, 'Lg original', 'Lg original just give me 1800', 2, 1800, 'CC9CD6E2CE0FE4DFEF7296012F904A69,E89A770D5B3441988A7BA8324E21C8D7', 'CC9CD6E2CE0FE4DFEF7296012F904A69', 'Mannesseh morris', '0965016444', 19, 1, 1, 11, '0', 'Lusaka', 3, 0, '2017-08-22 17:25:23', 0),
(193, 45, 'Mac book pro', 'Mac book i7 going at 4800, 750 GB HDD and 8gb ram', 3, 4800, '6EFC5C36BE21258BEA3837E376AD8CBB,2539860F449C11D8FFF7214CCBB4531F', '6EFC5C36BE21258BEA3837E376AD8CBB', 'Proof rafael', '0974516642', 9, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-22 17:31:18', 0),
(194, 45, 'Toyota vits', 'Make 2005 model Toyota vits 1 kr engine, no prealssure apart from mlengine mounts, serious people only', 2, 36000, 'C1D5DB3836C02A4DA3D8947083954D10,67F0E2A37B3E88EB133D6772439E227F,2599452B5ED90350EA81ECEA333D5266', 'C1D5DB3836C02A4DA3D8947083954D10', 'Ali rehman meher', '0979036858', 7, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-23 03:54:08', 0),
(195, 45, 'HTC m9', 'Neat htc m9; 32gb inbuilt 3gb ram, strong battery', 3, 1350, '69B3B9AFC71B6A8C1C0DD07F39C25D27,CAB9260A00664058CA4083892201A6A8', '69B3B9AFC71B6A8C1C0DD07F39C25D27', 'Quavo siwale', '0971171094', 10, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-23 03:59:48', 0),
(196, 45, 'Runx toyota', 'Runx Toyota ', 3, 43000, 'FF08924E5A3D705EE013224E00F415D5,2AFA0BB26B6470FA9B98861CEA2355D8,92F4E70E017DD0030FDD566CE57CE4B6', 'FF08924E5A3D705EE013224E00F415D5', 'Peter nyirenda', '0966688196', 7, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-23 04:02:40', 0),
(197, 45, 'Volkswaggen', '35000 negotiable ', 3, 35000, '395B5F340434DE62B464FD7EB425C62E,D45DD33CD908AA541FC6957C75692C35,EACD1CA2ADD1E1598D44668183B94621', '395B5F340434DE62B464FD7EB425C62E', 'Robert kalinda', '0964027652', 6, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-23 04:05:48', 0),
(198, 45, 'Acer laptop', 'Low budget laptop 2gb ram,40gb hdd,14" screen dead battery', 3, 900, '075A3F4C213E4EA050C11669D410B946,4C771361F0554D1E735165FD2342688A,D7EE5742744D2481E65E50F125FF33E0', '075A3F4C213E4EA050C11669D410B946', 'Michael Noah sinkata', '0977200620', 9, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-23 04:10:36', 0),
(268, 45, 'Fridge', 'Fridge for sale ', 3, 2500, '7625544EC27201EF7E94E8FF0854AA9B,0AC5FCCCA290B54ECE4BDB7A01273763', '7625544EC27201EF7E94E8FF0854AA9B', 'Chipazyo Mbewe', '0977490769', 19, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-27 09:05:08', 0),
(200, 45, 'Corolla vvti', '35000 negotiable', 2, 35000, '795FAF6FDD1304D9C6475CE66145456F,05026454262B740173349B16114D276F,54BE61B5C143EA5375AF784B28914D62', '795FAF6FDD1304D9C6475CE66145456F', 'Robert kalinda', '0964027652', 6, 1, 1, 11, '0', 'Lusaka', 3, 0, '2017-08-23 04:14:10', 0),
(201, 45, 'Defy Fridge', 'Defy upright fridge for sale', 2, 2700, '1D914A8D823CD4E50C95C39F2F32BFEF,DEE61750AF46185B700B5DB6FDE04C8E', '1D914A8D823CD4E50C95C39F2F32BFEF', 'Lutunda chella siwale', '0977193842', 19, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-23 13:09:32', 0),
(269, 45, 'Deep Freezer', 'Deep freezer for sale', 3, 2500, 'FEA5702EBE10E3F954508BAF84AAC6D6,A65346CB3762B46AF845E40DFB60AE95', 'FEA5702EBE10E3F954508BAF84AAC6D6', 'Chipazyo Mbewe', '0977490769', 19, 1, 1, 11, '0', 'Lusaka', 49, 0, '2017-08-27 09:06:30', 0),
(203, 45, 'Defy fridge', 'Defy fridge for sale', 3, 2500, '8B90C76AD8C8E133F910D6887A728959,C109D9F6455BB532D55BC5F1014FBA44', '8B90C76AD8C8E133F910D6887A728959', 'Sharon chilekwa', '0974024315', 19, 1, 1, 11, '0', 'Lusaka', 3, 0, '2017-08-23 13:19:29', 0),
(204, 45, 'Dinning table &chairs', 'Almost new dining table and chairs', 2, 1500, 'DED0047727206F2D75D90F4C69E76DD3', 'DED0047727206F2D75D90F4C69E76DD3', 'Sharon chilekwa', '0974024315', 18, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-23 13:23:19', 0),
(205, 45, 'Defy stove', 'Neat defy stove serious people only', 2, 0, '4A3FFC13275F34A27E04A454CA56AB56', '4A3FFC13275F34A27E04A454CA56AB56', 'Kay kalunga kabwe', '0973643614', 19, 1, 1, 11, '0', 'Lusaka ', 2, 0, '2017-08-23 13:47:18', 0),
(206, 45, 'Toyota corolla', 'Toyota corolla fo sale ', 3, 12000, '22EAC1A7CA72C9D7E4D047F17837075D,D98F092CE71C4F88313BEFE839A780F3', '22EAC1A7CA72C9D7E4D047F17837075D', 'Owen kayz', '0954943824', 6, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-23 16:52:22', 0),
(207, 45, 'Jeep cherokee', 'Jeep Cherokee going at 35000 ,you pay 20000 now u get the car and 15000 later', 3, 35000, '6347F71F7ACC9F33C1A3A2E940FC02DC,87613423DA8765F82F7AA1C3FFC11711,6C1CF5F1AC5341C240ADC2C8B99BCC34', '6347F71F7ACC9F33C1A3A2E940FC02DC', 'Francis mpundu', '0979660439', 7, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-23 16:58:57', 0),
(208, 45, 'Range rover', 'Range rover sport', 3, 180000, 'E0B3405CF19CBF5D2B1413E8979F9E00', 'E0B3405CF19CBF5D2B1413E8979F9E00', 'Mwaka vinoria ', '0977442416', 8, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-23 17:07:39', 0),
(209, 45, 'Toyota vits', 'New shape Toyota vits  2005 model keyless push to start', 3, 34000, '976B647D942DC65D14C90C8F58262891,7E4FA0DF26449600B17A59FB5EB2BCBB,4D648A1826F78A0686E092C993FF36A0', '976B647D942DC65D14C90C8F58262891', 'Elliot tembo', '0977491898', 7, 1, 1, 11, '0', 'Lusaka', 3, 0, '2017-08-23 17:18:18', 0),
(270, 45, 'Bedroom Suite', 'Bedroom suit ', 3, 13000, '687A7FF8EACB9FA7FC46426229C9F9D6,37FC59F1EEE5E5596F300562BF2AD9F1', '687A7FF8EACB9FA7FC46426229C9F9D6', 'Chipazyo Mbewe', '0977490769', 18, 1, 1, 11, '0', 'lusaka', 7, 0, '2017-08-27 09:08:05', 0),
(211, 45, 'Allion', 'Toyota allion for sale milage 65+ plate BAD', 2, 70000, 'D1A09078168ADDF789ABC7AA90832DC6,482A0DF5A00F192F26FF0B7F941589B7', 'D1A09078168ADDF789ABC7AA90832DC6', 'True lubby', '0979558269', 6, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-23 17:24:48', 0),
(212, 45, 'Toyota allion', 'Never been used in Zambia pressure free 2009 model ', 0, 0, 'C6767A80A49AEFDF6B26401345FF316F,7892D7409E9CD56070E10676C6DE65A2', 'C6767A80A49AEFDF6B26401345FF316F', 'Kami kami', '0073570002', 6, 1, 1, 11, '0', 'Lusaka', 3, 0, '2017-08-23 17:37:50', 0),
(213, 45, 'Bunker beds', 'Bunker beds for sale second hand', 3, 500, '1729A6D2115976E4A38BB26B3188B65D,BC194882A778345D9E681885D7FAAFD0', '1729A6D2115976E4A38BB26B3188B65D', 'Mwiche zyambo ', '0973948500', 18, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-23 19:25:09', 0),
(214, 45, 'Bed', 'King size bed ', 2, 0, 'FC914EB7FE3CEA801FB7C6D9EE8A7CA9,91CCEDDCFC538104E259594E7817A8A4', 'FC914EB7FE3CEA801FB7C6D9EE8A7CA9', 'Mulenga chanda banda', '0977109155', 18, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-23 19:29:50', 0),
(215, 45, 'Rising TV ', 'Rising TV for sale at k1600 2usb ports 2 HDMI ports', 3, 1600, '6E1717DE704D612D97B18AB095E1B396,10CF9F56ADC8813453A18272A8C1BA03,FD2BDDE8E8588C132A93C77BD5A71977', '6E1717DE704D612D97B18AB095E1B396', 'Micheal Noah sankata chabu', '0977200620', 12, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-23 19:54:32', 0),
(216, 45, 'IPhone 4s', 'IPhone 4s 32gb ', 2, 1000, 'F62CF3B4D8EF5E429EF96D68B70B9AA0,9EC4923BD2B49228C5A4D00A5E2901D8', 'F62CF3B4D8EF5E429EF96D68B70B9AA0', 'Tapson kazunga', '0968107556', 10, 1, 1, 11, '0', 'Lusaka', 3, 0, '2017-08-23 19:59:32', 0),
(217, 45, 'IPhone 6s', 'IPhone for sale', 3, 3000, 'D53612AA83F1FABF2EBBE3BAA0948BA3', 'D53612AA83F1FABF2EBBE3BAA0948BA3', 'Anderson musonda', '0965719113', 10, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-23 20:42:03', 0),
(219, 45, 'Samsung a5', 'Super neat A5 16gb 2gb ram', 3, 1500, '49AE034DE7A8079DCA5F6BC649826D64,3C8CB7DAB17BC3D5B0509E58A24DEBC8', '49AE034DE7A8079DCA5F6BC649826D64', 'Mabvuto ace mwanza ', '0973373326', 10, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-23 21:12:39', 0),
(220, 45, 'Canon 500d ', 'Camera 500d canon', 3, 1500, 'A7D6C4D27FCF2A9A888AA4878C4A7E6D,2EED0566536D696875D9F4E30A2A65E0,C6BF662D399C827FA79A8AB6FA39F8D4', 'A7D6C4D27FCF2A9A888AA4878C4A7E6D', 'Tiza mukuka', '0065788186', 12, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-23 21:16:48', 0),
(272, 45, 'KIC fridge ', 'KIC UPRIGHT FRIDGE 410 LITRES\nFREEZER COMPARTMENT IS AT THE BOTTOM\nHAS WATER DISPENSER\nONLY 6MONTHS OLD\nLOCATED IN KABWATA\nASKING PRICE IS K2500 BUT I URGENTLY NEED MONEY LIKE TODAY SO JUST COME THROUGH WITH YOUR REASONABLE OFFER.\nCONTACT 0955188602/0964188602/0973421109', 2, 2500, '24526D8D289B52A6ACC1664306900229,39D25BFD39D881ACF53A6EBF5DE9E1FA', '24526D8D289B52A6ACC1664306900229', 'Daniel Sakala', '0973421109', 19, 1, 1, 11, '0', 'lusaka', 13, 0, '2017-08-27 09:14:34', 0),
(271, 45, 'Beds', 'King sized beds sold at K1000 Whatsapp +260968182608', 3, 1000, '85F645911C2800AA0696FDFCAFF6537D,54DCDAFB243BB83A445A09CF38AF6594', '85F645911C2800AA0696FDFCAFF6537D', 'Gaspard Milo', '0968182608', 18, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-27 09:09:58', 0),
(222, 45, 'Toyota prado', 'Toyota Prado 2007 model diesel machine very neat ', 1, 0, '388E9DA5D9A04C0E1E0CC503FCB1A42A,26CFA4763DCFCE8D550BC8EFBFC46667', '388E9DA5D9A04C0E1E0CC503FCB1A42A', 'Charles mabuku', '0977770000', 7, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-24 06:15:50', 0),
(224, 45, 'Ford ranger ', 'Ford ranger for sale 2016 very low milage 24000 perfect condition ', 2, 420000, '434EE8665C51AFE0D8E56AD77926CF33,2712743A294C26B7DADBD615B09EACFE,05BD7F09301FB6811E06B7C099D20405', '434EE8665C51AFE0D8E56AD77926CF33', 'Charles mabuku', '0977770000', 8, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-24 06:24:08', 0),
(225, 45, 'Honda CRV', 'Honda 2006/2007 model . automatic transmission petrol engine milage 70057', 2, 125000, 'CBE2D212D7CD390F0599D24887AD9002,6BD4312965553D6093ED805EB18B3D95', 'CBE2D212D7CD390F0599D24887AD9002', 'Davy mukuka', '0978176935', 7, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-24 06:43:15', 0),
(226, 45, 'Rav4', 'Toyota rav 4 2007 model', 2, 140000, '1673584D3AA399797DF7D64DF3B4A7FE,36F65678F0129EF1848E582B35E10F09,D799685797E8E5D63BB59066EDE8190D', '1673584D3AA399797DF7D64DF3B4A7FE', 'Moono jambo', '0966826159', 8, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-24 06:50:37', 0),
(227, 45, 'Toyota hiace', 'Toyota hiace milage 75000', 2, 100000, '83D9B7177710FF89FB1B8D0348939968', '83D9B7177710FF89FB1B8D0348939968', 'Godfrey simwana', '0979724508', 8, 1, 1, 11, '0', 'Lusaka', 3, 0, '2017-08-24 07:02:39', 0),
(228, 45, 'Nissan cedric', 'Just pay and drive Nissan Cedric engine intact very neat ', 3, 40000, '5DE8C46BFAF0E533A700A33593A268B8,8803D487B73C0C7412A6314A1FE10C36', '5DE8C46BFAF0E533A700A33593A268B8', 'Josh mutale ', '0979997548', 6, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-24 14:30:31', 0),
(273, 45, 'Apple Laptop', 'Apple MacBook Air 13" (2011)\n-13" IPS LED High Definition Display\n-4GB RAM, 128GB SSD\n-Intel Core i5 (1.7GHz), Intel HD 3000 384mb\n-9/10 Condition\nPrice: K6,500\nCall/ 0974661025\nWhatsApp:0968253571', 2, 6500, '5ECA1590DF9DE98568607882745FAC8E,DA2F7C85A9F09B9828E5EF9DAE61DC36', '5ECA1590DF9DE98568607882745FAC8E', 'Eddy silungwe', '0974661025', 9, 1, 1, 11, '0', 'Lusaka', 5, 0, '2017-08-29 23:42:17', 0),
(230, 45, 'Samsung galaxy core prime', 'Inbuilt 8gb neat android 5.1', 3, 750, 'A7518D8ADB254936EA07176C485F4DD6,1EB2A637452FC084E80C8AE63C3AA43D', 'A7518D8ADB254936EA07176C485F4DD6', 'Brayace wisw', '0979150195', 10, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-24 14:34:45', 0),
(231, 45, 'Infinix zero', 'Super neat infinix zero 3 ram 3gb inbuilt 16gb 4glte', 2, 1650, '07B46A7E18B6EC5134A9DFB00DB60617', '07B46A7E18B6EC5134A9DFB00DB60617', 'Zack man brown', '0955812102', 10, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-24 14:39:49', 0),
(232, 45, 'Toshiba satellite ', 'Very neat 120hdd 1gb ram without battery but works ', 3, 1200, 'B59E861703EC8F14674FAE8BC36ABD46', 'B59E861703EC8F14674FAE8BC36ABD46', 'Bryan  preacher ', '0978000506', 9, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-24 14:42:47', 0),
(233, 45, 'Lenovo laptop', '500gb HDD 4gb ram i3', 3, 2100, 'D667C0D203B5C39481927CC0C2D03310,CE3748432DA81A9844DC7FCCBE2CC99E', 'D667C0D203B5C39481927CC0C2D03310', 'Jimmy lex kapepa', '0976757562', 9, 1, 1, 11, '0', 'Lusaka', 3, 0, '2017-08-24 14:45:51', 0),
(234, 45, 'Furniture', 'Leather sofas ', 1, 3700, '', '', 'Reuben mwandu', '0973093034', 18, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-24 18:10:12', 0),
(236, 45, 'Wardrop ', 'Wardrop fo sale', 1, 1500, 'FABE4FF155515B78288F980C4A6677DD', 'FABE4FF155515B78288F980C4A6677DD', 'Nancy chirwa', '0977496071', 18, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-24 18:12:46', 0),
(237, 45, 'Telefunken TV ', 'Telefunken TV for sale ', 3, 2600, '61DED8845D3C72DB386C6E6C24C44FAD,37B118936B613B19341E4E2DB5B59A06,F34A94ABD7BC7394244046A7774CAEAC', '61DED8845D3C72DB386C6E6C24C44FAD', 'Katongo mukuka', '0961393279', 19, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-24 18:16:27', 0),
(238, 45, 'Sharp TV ', 'Sharp led plasma 32 inch', 0, 1700, '8E2B54DE66A53B6C5D3D346F3E726881', '8E2B54DE66A53B6C5D3D346F3E726881', 'Jay brezzy', '096163018', 19, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-24 18:20:56', 0),
(239, 45, 'Sharp TV ', 'Sharp led plasma 32 inch', 0, 1700, '8E2B54DE66A53B6C5D3D346F3E726881', '8E2B54DE66A53B6C5D3D346F3E726881', 'Jay brezzy', '096163018', 19, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-24 18:20:57', 0),
(240, 45, 'Samsung 44 series', 'Samsung 44 series smart TV very neat ', 3, 4500, '35F90251B5F12B53658895CFB04C4530,D44DA3797ECE0B65B2C19A8C84A96E85', '35F90251B5F12B53658895CFB04C4530', 'Jim kibhira', '0971747134', 19, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-24 18:24:26', 0),
(241, 45, 'Dell laptop', 'Fairy neat dell 160gb HDD 15.1" screen 2hrs battery life', 3, 1450, '436890F17E693512883D8C6C8B371FAF,622132F5A6250F18A1F7A34F756E0797', '436890F17E693512883D8C6C8B371FAF', 'Akiyele', '0953711020', 9, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-24 18:30:22', 0),
(242, 45, 'Samsung home theater', 'Two months old Samsung home theater very neat', 3, 1500, '0AFBB91A3835DDB751A166087F6440D6', '0AFBB91A3835DDB751A166087F6440D6', 'Chilufya Davison ', '0975213623', 12, 1, 1, 11, '0', 'Lusaka', 3, 0, '2017-08-24 18:36:35', 0),
(243, 45, 'Samsung note 5', 'Samsung note 5', 2, 4000, '66CC28B3CB7DBDDFB03F0CBB2999EA69,F9C44C6B8299DE25CA04A75431C96804', '66CC28B3CB7DBDDFB03F0CBB2999EA69', 'Mwape nkandu', '0979587246', 10, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-24 19:41:44', 0),
(244, 45, 'Dell lattitude', 'Dell latitude e5440 4gb ram 500gb ', 2, 3300, 'AADE2C18151A99C2471F449D378201FC,8B8026ED03BC8A5715C9E6BA7893C6B0', 'AADE2C18151A99C2471F449D378201FC', 'Timmy bulyaya', '0965876248', 9, 1, 1, 11, '0', 'Lusak', 2, 0, '2017-08-24 19:46:08', 0),
(245, 45, 'Nissan hard body ', 'Nissan hard body', 3, 50000, '70035758D2AC5BFE804ECB18AD4094CB,B05473B50D4EB7B26E3C625AAC4E3547', '70035758D2AC5BFE804ECB18AD4094CB', 'Wadona wadona ', '0976351766', 8, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-24 19:49:37', 0),
(246, 45, 'Nissan xtrail', 'Nissan xtrail non runner breaking fo parts ', 3, 0, '18AB3AC8C2337370C01F9C147E88FF28,F2895DC637CD5C8C1DF7475961CC1B41', '18AB3AC8C2337370C01F9C147E88FF28', 'Mututa kakinga', '0967131980', 7, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-24 19:54:06', 0),
(247, 45, 'S6 edge ', 'S6 edge plus', 3, 3500, 'B9EA0FA852C936AF17039A14BEAAB799,39829EC69788D6BE950453A3308F93E4', 'B9EA0FA852C936AF17039A14BEAAB799', 'Ackim', '0955351763', 10, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-24 19:56:46', 0),
(248, 45, 'Nissan armada ', 'Milage 106+ 2004 model off road for viewing call 0961758814', 2, 120000, '1E8502A7E1C8EADBD9816CE192569F3F,5F7E77AA863CD52382D53C15912108F5,304FFBCB5ED8EE6D017D38F693A11F54', '1E8502A7E1C8EADBD9816CE192569F3F', 'Bart akupela', '0961758814', 8, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-25 06:50:12', 0),
(249, 45, 'Vits  clavia ', 'Toyota vits clavia 2nz engine milage 138 buy and drive', 3, 27500, '4057412806BF7B423A7A26C554954C82,6785804B2B5AE0A28A795BD7EF8B4C31', '4057412806BF7B423A7A26C554954C82', 'Elliot Nash tembo', '0977491898', 7, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-25 06:53:55', 0),
(250, 45, 'Allion', 'Toyota allion unregistered milage 36+', 2, 74000, '32E9F6E737595F810C155D6314555D32', '32E9F6E737595F810C155D6314555D32', 'Justine mlenga', '0955515026', 6, 1, 3, 26, '0', 'Ndola', 1, 0, '2017-08-25 06:57:42', 0),
(252, 45, 'BMW x5', 'BMW x5  for sale', 2, 65000, 'BCD45ED404DB453D5EECF694D72555B9', 'BCD45ED404DB453D5EECF694D72555B9', 'Kasweka  mutonga ', '0975762279', 7, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-25 07:02:12', 0),
(253, 45, 'Rent ', 'Rent in makeni Bonaventure  self contained', 2, 5000, '8FD0987543C154A80E8190ED13DD1DDC,44B8B119A216D55BF1E85B64AEF39FB7,E748832C9CA19B68CF43A8621E798F11,C47843B7A25D3FAF5C5694A2F6F49721', '8FD0987543C154A80E8190ED13DD1DDC', 'Chanda chewe', '0975351330', 13, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-25 07:06:12', 0),
(254, 45, 'Lenovo ideal pad ', 'Lenovo ideapad 8gb ram 500gb hdd Intel i3 5th gen', 2, 3200, '21424C7AECF3A69B60CEB0B7A25B7350', '21424C7AECF3A69B60CEB0B7A25B7350', 'Estore', '0978790292', 9, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-26 06:54:29', 0),
(255, 45, 'Galaxy s4', '16gb inbuilt 5.0 android 4g lte', 3, 850, '16AF3F0113E206CE23DD5FBD505BA0CF,1364F2CA8C7BC02EE2A9F885B2099759,DEA77B06B23AC3829EB136C00BBA0043', '16AF3F0113E206CE23DD5FBD505BA0CF', 'Sean mule', '0955532840', 10, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-26 07:00:02', 0),
(256, 45, 'Classic vans ', 'Classic vans sizes 5-11 free deliverly', 0, 300, '6640BBBCDE3BA7807D8C29B0A3D4022E,C7DD478FFEA7027231E3B20B78F56E29,FD2F7F11D2566C0BCB6469A556A6D84B', '6640BBBCDE3BA7807D8C29B0A3D4022E', 'Mwansa', '0955780631', 17, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-26 07:04:42', 0),
(274, 45, 'Galaxy Note 1', 'Galaxy NOTE 1 neat only uses a nokia battery ....what yo offers guys ..swap or cash ', 3, 600, 'C6AF77E8884C3EC3EDD8567782FE4E3F,5FE4CC00822B302AE8B56D1C6859867F', 'C6AF77E8884C3EC3EDD8567782FE4E3F', 'Christone Mubanga', '0954741799', 10, 1, 1, 11, '0', 'Lusaka', 3, 0, '2017-08-29 23:44:03', 0),
(258, 45, 'Isuzu KB 240', 'Isuzu KB 240 ,2010 model  and very neat petrol engine @132000', 0, 132000, 'DD3D67C4428EF39E5291EE4594EF5729', 'DD3D67C4428EF39E5291EE4594EF5729', 'Prince mushili', '0979488660', 18, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-26 11:00:49', 0),
(259, 45, 'Furniture', 'Furniture variety', 0, 0, '575FFDCD2A216A411E08EBEFFA860D44,DA9B0377122D93E4D743EB0733839E45,AEA154DB8D63E52606FE9F375E8B3AA3,E6C1B00F74EE15D6C9806952AEDA2BEB', '575FFDCD2A216A411E08EBEFFA860D44', 'Ashley Dawson ', '0978718992', 18, 1, 1, 11, '0', 'Lusaka', 4, 0, '2017-08-26 11:02:55', 0),
(260, 45, 'L shaped sofas ', 'K shaped south African type sofas ', 0, 0, '6D7D09CF5D0815E427064DB90E84C770,8B58A89E085C8921B1D0DE3A5DF40258', '6D7D09CF5D0815E427064DB90E84C770', 'Glam furnture', '0972752338', 18, 1, 1, 11, '0', 'Lusaka', 4, 0, '2017-08-26 11:07:43', 0),
(275, 45, 'Acer', 'Neat acer i3 with 4gb ram 320gb hdd 2hrs battery life up for grabs lsk call on 0976276465', 2, 0, '0557DB90AC0F0930CCCC542FDAE28BCF,12FEA2362926448AA50E237678CF6AAF', '0557DB90AC0F0930CCCC542FDAE28BCF', 'Sage Nyirongo', '0976276465', 9, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-29 23:47:48', 0),
(276, 45, 'Passat', 'PASSAT\nUNregistered\nCleared\n2.0 litre\nIn CHOMA\n3 months old\n85 mileage\nK60,000\nWhatsApp\n0977 957 531', 1, 60000, '27BD76E2972BA2CBF9D119BFADD3F23C,8B81911EBEAED25FCEE167BAF53B47D3,F26B6DDB8003CD57815600CA0599163B', '27BD76E2972BA2CBF9D119BFADD3F23C', 'Munsongwe Siakaziba', '0977 957 531', 6, 1, 4, 32, '0', 'Choma', 8, 0, '2017-08-29 23:50:50', 0),
(277, 45, 'Landcruiser', 'Perfect runner landcruiser Van, small cabin for sale. Call:0954943824', 2, 0, '1200723632F3C12A4DCA981915985CAB,3BF6972237D62EEA0CD6E9D084089212', '1200723632F3C12A4DCA981915985CAB', 'Owen Kayz', '0954943824', 8, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-29 23:53:44', 0),
(278, 45, 'Nissan Skyline GTR-33', 'Nissan Skyline GTR-33 for sale\nContact 0978967945 for more details.', 1, 0, '86C07E9C4E29C22446A093960C1ABB3D,3E731D7445E617B87BCDA212E6C5D1E1', '86C07E9C4E29C22446A093960C1ABB3D', 'Koti Suarez', '0978967945', 6, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-29 23:55:46', 0),
(279, 45, 'DELL', 'Neat dell i7 with 4gb ram 1000gb(1tb)hdd 3hrs battery life up for grabs lsk call on 0976276465', 1, 0, '00D84762CFCDD7C2653ADE52FDFB1004,390AAFB33A047D542C34EB25236FE4A3', '00D84762CFCDD7C2653ADE52FDFB1004', 'Sage Nyirongo', '0976276465', 9, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-29 23:57:52', 0),
(280, 45, 'Laptop', 'Sony laptop..2gb ram,,80gb hdd. It just went off..k650..0973555696', 3, 650, 'E4AC0224A41894CF546D72486EFBE4D5,A395DAABEF136DD64ACB1991B133F0FC', 'E4AC0224A41894CF546D72486EFBE4D5', 'Generall Ali', '0973555696', 9, 1, 1, 11, '0', 'Lusaka', 3, 0, '2017-08-30 00:00:15', 0),
(281, 45, 'Iphone 6 64gb', '90%neat, sensor pressure, minor crack on front cam. K2550. 0979070510', 2, 2550, '476393925E8C96F56982729E04E7BB47,58F55BF7E52424EF25E13E3276804A5C', '476393925E8C96F56982729E04E7BB47', 'Chiza Chilanga', '0979070510', 10, 1, 1, 11, '0', 'Lusaka', 40, 0, '2017-08-30 00:03:11', 0),
(282, 45, 'PS3', 'Neat ps3 with 10 games inside including fifa 17,GTA 5,WWE 17,CALL OF DUTY ETC lsk call on 0976276465', 2, 0, '58E424A0AEB34D1D310E5CBC2FD96A4D,995684FAEA6063BA0EFE8A919EEFD884', '58E424A0AEB34D1D310E5CBC2FD96A4D', 'Sage Nyirongo', '0976276465', 12, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-30 00:14:53', 0),
(283, 45, 'Gateway', 'Core 2. Duo gateway CPU 2GHz HDD 500GB ram 2GB battry 2hrs very neat just k1700 call or WhatsApp 0978247817', 2, 1700, '43C3A7563B523A6E40E2CC18673B25DF,1F571BBE651F6DC186B0AA2D7E5B8776', '43C3A7563B523A6E40E2CC18673B25DF', 'Mark Banda', '0978247817', 9, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-30 00:18:26', 0),
(284, 45, 'Isuzu', 'Neat 95pin call 0953284178', 2, 95000, 'B6271DD8E4A8A0D29DE224E305EC984D,E50B34D653AEC9224DC20B2184AD61FB', 'B6271DD8E4A8A0D29DE224E305EC984D', 'Leo Ziko', ' 0953284178', 8, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-30 00:20:32', 0),
(285, 45, 'Laptops', 'ðŸŒ I and R Investment Ltd. \nWe stock the best laptops!!.\n(Call on 0955940039)(whatsapp on 0976940039)\nMini. Laptops in stock. \n-Hp 10.1. \n1gb ram\n250hard drive\n(Intel) Atom\n5-6 hours battery life.', 2, 0, '757AF4EC78B2E776F9B4DBBE8DB6C407,8943B7E9DD494F79234F11556BC68165', '757AF4EC78B2E776F9B4DBBE8DB6C407', 'Mbobela Maurice', ' 0955940039', 9, 1, 1, 11, '0', 'Lusaka', 3, 0, '2017-08-30 00:23:42', 0),
(286, 45, 'Spacio', 'Reduced to go 26pin', 3, 26000, 'C7E28A7AD12B734173CB9EF2D458509D,0365DB1EE61ED5CDD87E6B687A1B0DF1', 'C7E28A7AD12B734173CB9EF2D458509D', 'Leo Ziko', '0953284178', 7, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-30 00:31:04', 0),
(287, 45, 'BMW 525', 'Bmw 525 series, auto, diesel, sport, 2005 model going for k80,000.Call 0977 545419', 2, 85000, '2BE05103B7E2EBD6AEB4818344DC03CC,92F0D7C14FCF49383F0F6E56E1E47C99', '2BE05103B7E2EBD6AEB4818344DC03CC', 'Stansilous Chilweze', '0977 545419', 6, 1, 1, 11, '0', 'Lusaka', 3, 0, '2017-08-30 00:32:59', 0),
(288, 45, 'BMW3', 'very neat BMW M3 sport Manuel only asking for k50 pin last 48pin', 2, 48000, '8F930BE5766978938327E67272B88060,ABC400A34C7FD241EF3DC78A1F410852', '8F930BE5766978938327E67272B88060', 'George Brandon', '0975256459', 6, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-30 00:37:35', 0),
(289, 45, 'HP Laptop', 'Neat hp i5 laptop with 4gb ram 320gb hdd up for grabs lsk call o on 0976276465', 2, 0, 'E21908D2E10D542E3B0036F7285A3E4C,3DBD143DBFAFE4BB4A590BD3A1FEFD3A', 'E21908D2E10D542E3B0036F7285A3E4C', 'Sage Nyirongo', '0976276465', 9, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-30 00:40:53', 0),
(290, 52, 'bmw 318 year2001  milage 125000 ', 'bmw 318 year2001  milage 125000 ', 3, 0, '', '', '0968121579', '0968121579', 6, 1, 1, 11, '0', 'lusaka', 18, 0, '2017-08-30 08:36:21', 0),
(291, 38, 'bmw 2001 with Cheap price here', 'bmw 2001 with Cheap price here', 0, 50000, '5CAD4F469558E527E5327ECF78B6596A,4FDAE8B7F91C356AF449AB090B415FCC,164E5BF2B93715A7FE0C0FBA32D4B712', '5CAD4F469558E527E5327ECF78B6596A', 'Kevin', '0965207939', 6, 1, 1, 11, '0', 'lusaka', 9, 0, '2017-08-30 13:12:08', 1),
(292, 45, 'Car', 'Car for sale ', 3, 11500, '1DF8CCF0DE596E20AD32BDB07509D906,88347576289B06DEBF10E0C2087A5875,945DDA273579EA1353E11CB9CE12312C', '1DF8CCF0DE596E20AD32BDB07509D906', 'Jim nkoma', '0974545746', 7, 1, 10, 52, '0', 'Lundazi', 1, 0, '2017-08-31 02:58:58', 0),
(326, 45, 'ACer ', 'Acer corei3 \n4gbram\n320gb hard-drive \n15.6 screen\n4hours battery\nPrice:K1850 \nCall or wats app 0979444212 or 0954888885', 3, 1850, '67BE1528EC75115E0B532B36794BF007,BC22D0C1862415131057D8209F0E4739', '67BE1528EC75115E0B532B36794BF007', 'Edmond', ' 0954888885', 9, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-09-03 12:25:17', 0),
(294, 45, 'Toyota corolla', 'Buy this neat Toyota corolla engine has never been tempered , buy and drive  for details ', 3, 26000, '612CE5D3383DCA94783BCE0CF95064A3,3424DAF7EDE3A25F7F9831FAB46D71AA', '612CE5D3383DCA94783BCE0CF95064A3', 'Ngunje kaonga ', '0973980509', 6, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-31 03:06:07', 0),
(296, 45, 'Dogee', 'Brand new dogee cellphone android 6.0 1gb ram 8gb ROM n quadcore processor ', 0, 800, 'B55D2A4D74C6CE538D8016009015590F,DE57CF1B670C2FF048460184DE0B9249', 'B55D2A4D74C6CE538D8016009015590F', 'Mutale', '0977204062', 10, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-31 03:11:39', 0),
(325, 45, 'MI redmi Note 4', 'MI Redmi Note 4\n64GB inbuilt, 3GB Ram \nFingerprint Scanner \nJust Give Me #K1800\nCall 0978889994', 3, 1800, 'BB7FDC6E331BF202786BA2C0946F9D6B,6F829E297B6A503194125176C3D424BB', 'BB7FDC6E331BF202786BA2C0946F9D6B', 'Mubita', ' 0978889994', 10, 1, 1, 11, '0', 'lusaka', 1, 0, '2017-09-03 12:23:04', 0),
(298, 45, 'Toyota runx', 'Manual trans. 2006 model German made ', 2, 0, 'F4EB054BBCD949E0A5A423CFEA4DCF32,6FEEFE1A88C1DE6867A321189CE1DE15,4DAEFF706AC321FC34E9E79D38125B45,336CDE23D993226883869FB24636C3A2', 'F4EB054BBCD949E0A5A423CFEA4DCF32', 'Elliot Nash tembo', '0977491898', 6, 1, 1, 11, '0', 'Lusaka', 4, 0, '2017-08-31 03:19:02', 0),
(299, 45, 'BB z10', 'Two months old BlackBerry z10 very neat as seen\nStrong battery \n16bg internal storage \n2gb ram \nPressure free\nJst going at k650 cash \nNo swaps jst need cash\nIf interested call me on 0971436197', 3, 650, 'CEBA73C16686F69F272EE166D9306A2E,45F578C096811C2F1EE5BAAEACB9BC59', 'CEBA73C16686F69F272EE166D9306A2E', 'Jackson Zulu', '0971436197', 10, 1, 1, 11, '0', 'lusaka', 1, 0, '2017-08-31 23:28:13', 0),
(300, 45, 'Samsung Grand Prime', 'Samsang Grand prime plus 800 with a crack affecting anthing\nCall 0977378885 or 0955587217', 3, 800, '5FD410707370859182250B86B0BBE5A8,38E6A8F098242597271FD5BF25A91E95', '5FD410707370859182250B86B0BBE5A8', 'Mwansa Mabisa', ' 0955587217', 10, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-31 23:30:33', 0),
(301, 45, 'Runx Toyota ', 'RUNX K 26 PIN ONLY NEEDS SUSPENSION call 0977612635', 3, 26000, 'AE4E996A67545CD78920B53984B564DD,CE54D34E488BEA63DE185C01B30C64C2', 'AE4E996A67545CD78920B53984B564DD', 'Clive Lungu Chiteta ', '0977612635', 7, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-31 23:31:57', 0),
(302, 45, 'Toyota Corolla ', 'K35000,CALL 0978482744,LUSAKA', 3, 35000, '30456B584831C10ADDDA56C162095534,5D60F3C2B13A149E28EE4C0ADF3CF226', '30456B584831C10ADDDA56C162095534', 'Dubeka', '0978482744', 8, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-08-31 23:33:35', 0),
(303, 45, 'Raum', 'Very net it''s buy and drive. No jokers ,if interested call me on 0974545745', 3, 29000, '72F41A6C1EF680DE9C48CB9A7BD4FB7C,D8E848A8347DF2DC2C503564D3D194A5', '72F41A6C1EF680DE9C48CB9A7BD4FB7C', 'JIm Nkhoma', '0974545745', 7, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-31 23:37:28', 0),
(304, 45, 'Corolla', 'Toyota corolla for sale 5A engine manual...k28neg....0978783088', 3, 28000, '444CDF6ABCAC7604300459B76E50D702,E602821814710CBE54410B4F6079D3C7', '444CDF6ABCAC7604300459B76E50D702', 'Frederick Kabs', '0978783088', 6, 1, 1, 11, '0', 'Lusaka', 5, 0, '2017-08-31 23:39:02', 0),
(305, 45, 'RAV4', 'Rav4 on sale \nPressure with the engine\nEngine type : 1Az\nPrice :k37500neg\nCall/WhatsApp 0979330870', 2, 37500, '642D4963E71910F476B53FD21C0B8A77,9A284CE4FE985BE07BED8A891D8C1469', '642D4963E71910F476B53FD21C0B8A77', 'Mwaba Kalumba', ' 0979330870', 7, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-31 23:40:47', 0),
(306, 45, 'Toshiba Laptop', 'Neat Toshiba laptop with 2gb ram 320gb hdd up for grabs lsk call on 0976276465', 3, 0, 'B6F9E3907AED556F8CE4B1480962C725,A417B9B5FA2E65E72274E4FF3D1CB942', 'B6F9E3907AED556F8CE4B1480962C725', 'Sage Nyirongo ', '0976276465', 9, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-08-31 23:42:32', 0),
(307, 45, 'Iphone 5 16gb', '16GB \nK1650 \n0978924882', 2, 1650, '7C1AF14705151B8D0A1668528BE63E65,BEA93DBD7168FCCA9F5FEA1E405CF9D2', '7C1AF14705151B8D0A1668528BE63E65', 'Richard Risi', '0978924882', 10, 1, 1, 11, '0', 'lusaka', 3, 0, '2017-08-31 23:43:52', 0),
(308, 45, 'Surface Pro', 'surface pro 4 i5 256gb 8gb \nZmw 7,000\nContact or WhatsApp 0968664001', 1, 7000, 'BF79EE4D24DB5542FA12086318C9970F,7053A33912255ED56DA0C32C548AD7AA', 'BF79EE4D24DB5542FA12086318C9970F', 'Alfred', '0968664001', 9, 1, 1, 11, '0', 'lusaka', 3, 0, '2017-08-31 23:45:29', 0),
(309, 45, 'Toyota Prado', 'Toyota prado 3RZ engine unregistered\nK125000 negotiable call 0977353122/0977658765', 3, 12500, '4F3D1B597D318A349997B59F2DB8D50E,BCB7063C97AA4E88023091B5D8D87725', '4F3D1B597D318A349997B59F2DB8D50E', 'Mudenda Chris', '0977658765', 7, 1, 1, 11, '0', 'lusaka', 2, 0, '2017-09-01 01:09:18', 0),
(310, 45, 'Tecno C8', 'Tecno C8..16gb inbuilt, 5.0.1 android version,95% neat ..no sort of problem on it(pressure free).k1250 negotiable.. halla 0975116338', 3, 1200, 'D4B31462C3253A2BD03E7BF5EBB9A708,EE77B53E9AF50E2CE3DA295B1BEB1439', 'D4B31462C3253A2BD03E7BF5EBB9A708', 'Michale ', '0975116338', 10, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-09-01 01:16:48', 0),
(311, 45, 'Ford ranger Pickup ', 'K40,000...0976041773,,its a runner and with canopy', 3, 40000, '7E239C0B8D88FDC2C050E998BBCAB47F,AF4AA478B8D3D70D4DE1025FB7529601', '7E239C0B8D88FDC2C050E998BBCAB47F', 'siwawa', '0976041773', 7, 1, 1, 11, '0', 'lusaka', 2, 0, '2017-09-01 01:36:48', 0),
(312, 45, 'Vehicle Parts ', 'Various Types of Engines and Gearboxes For Cars and Trucks For More Information Call us or Whatsapp on +260976801042 or write to us on kubamulawo.logistics@gmail.com', 3, 0, 'A0FBF89E920D3AADD3DB48C178267441,C7B18A3C95A84D9A317CF8AC9B65747E', 'A0FBF89E920D3AADD3DB48C178267441', 'Mudenda', '0976801042 ', 8, 1, 1, 11, '0', 'Lusaka', 3, 0, '2017-09-01 01:38:43', 0),
(313, 53, 'China good thing', 'good.good condition', 0, 5000, 'F371F7F7B11B8E2C3023438705587477', 'F371F7F7B11B8E2C3023438705587477', '0966666666', '0966666666', 22, 1, 1, 11, '0', '16 china town', 26, 0, '2017-09-01 01:40:58', 0),
(314, 38, 'bmw with a low price', 'bmw with a low price', 0, 0, '1BB2AC039387C7DB7862F4B4D5B8FB29,0DA1685382DFD2B48AD1E8463EDA14AA', '1BB2AC039387C7DB7862F4B4D5B8FB29', 'Kevin', '0965207939', 6, 1, 1, 11, '0', 'East Park', 1, 1, '2017-09-01 15:26:16', 1),
(315, 45, 'Laptops ', 'Very neat and working condition Laptops \nContact +260 963495447 / 0971102723', 3, 0, '805BA24E4275308F42F5B4B5D6450960', '805BA24E4275308F42F5B4B5D6450960', 'Gilly ', '0971102723', 9, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-09-02 02:23:38', 0),
(324, 45, 'Huawei L21', 'Huawei L21\n16gb inbuilt\n2gb ram\nStrong battery\nK1000\nCall 0974091720', 3, 1000, 'AB3FBE2BD706AC42212FEFC5B6F5E42E,D17D45A879DE27A8D3FADE7EF7D5F551', 'AB3FBE2BD706AC42212FEFC5B6F5E42E', 'Richard Tembo ', '0974091720', 10, 1, 1, 11, '0', 'lusaka', 3, 0, '2017-09-03 12:20:30', 0),
(317, 45, 'Dell Laptop ', 'Dell Inspiron, Core i3, 320gb HDD, 2gb Ram, 14" HD Screen, Multi Card Reader, Multi-DVD/CD Writer. K1550 only. Call/Whatsapp 0976690674.', 3, 1550, 'E9461A5012A661E807DBB769EAFAAAA8,433ED48D676F862A657E778D4842200D', 'E9461A5012A661E807DBB769EAFAAAA8', 'Jozzy Joz', '0976690674.', 9, 1, 1, 11, '0', 'Lusaka', 3, 0, '2017-09-02 02:26:05', 0),
(318, 45, 'Asus Mini laptop ', 'Call 0971102723 what''s up 0963495447....\nAcer Aspire One Laptop---2Gb ram 320 Hard drive/WebCam New state. K1750 Only\nAsus Mini Laptop K1350\n320Gb Hard drive 2Gb ram/Webcam\n3Months Guarantee, Receipt provided,\nNote: Company is Registered/Certified\nWe do deliveries country wide', 3, 1750, 'D1D909829ADD15EA1554797450C077CA,C7885828C82FDAF63D6A940F50CFACCF', 'D1D909829ADD15EA1554797450C077CA', 'Clifford Junior ', '0963495447', 9, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-09-02 02:27:26', 0),
(319, 45, 'HP laptop ', 'Slash Down Madness!!\nHP Envy 15 - Amd A10 (i7)CPU, 8GB Ram, 60GB HDD, Blacklight Keyboard, 15.6" Screen \n**With minor faults ie Cracked Touch top glass, Hard Start Power button etc but works fine. \nThe way it is at only K1999.\n\nCall 0979213787 or whatsapp 0977110001\n*Shop 113 Carousel mall, Lumumba/Kafue Rd', 3, 1999, 'E279C7A5962D8BE1F17156521A0FCB17,DF887D35962A93668A0DA9ED1FAB5651', 'E279C7A5962D8BE1F17156521A0FCB17', 'Cybertrade ', '0977110001', 9, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-09-02 02:29:06', 0),
(320, 45, 'RUNX Toyota ', 'Perfect engine, no body repent in immaculate condition toyota Allex call or whttupp 0977838481', 3, 0, '16BBA6C6E20DC6BAB4F2F393ED15C57B,31D8510DB44200E3EC6041B61EAB1540', '16BBA6C6E20DC6BAB4F2F393ED15C57B', 'Nelson Jeff Banda ', '1467276313', 7, 1, 1, 11, '0', 'Lusaka', 4, 0, '2017-09-02 02:36:37', 0),
(327, 45, 'Galaxy A5', '99% neat galaxy A5 ...@1400 text me 0972311755', 3, 1400, 'D484A1EC7666E27D0F139FB2562FC924,96FE7473F8D45BAEBC5DEC4E597439C2', 'D484A1EC7666E27D0F139FB2562FC924', 'Dakason ', '0972311755', 10, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-09-03 12:29:38', 0),
(322, 45, 'Toyota Spacio ', 'Quick sell Toyota spacio ordinary up for sell...... Asking price k26 negotiable. Call/whatsapp me on 0977807585', 3, 26000, 'B419419C437897A27ECC03571B345E73,576A12F04BED6F49D47A16C42B45E2DE', 'B419419C437897A27ECC03571B345E73', 'Esther ', '0977807585', 7, 1, 1, 11, '0', 'Lusaka', 6, 0, '2017-09-02 02:38:48', 0),
(323, 45, 'VITS', 'Very neat just buy and drive everything upto date if interested contact me on 0955112248', 3, 25000, '6007CE9BDB0E8C0C0EB0194260235DB4,7738E71C511F35B03A7C7A16669092B6', '6007CE9BDB0E8C0C0EB0194260235DB4', 'Lucky Kunene', '0955112248', 8, 1, 1, 11, '0', 'Lusaka', 7, 0, '2017-09-02 02:40:34', 0),
(328, 45, 'Tecno Tablet ', '16gb inbelt \n2gb ram \nFront camera has a flash \n7" screen \nK950\nOr top up on your not Small fonz\n0976757562 I will be in town at 14hrs', 3, 950, 'B238C20D550CC3A4FBAE8017DEE0D1D6,0DB862FDEFE292A79AFE6E59D8DB2573', 'B238C20D550CC3A4FBAE8017DEE0D1D6', 'Jimmy Lex', '0976757562', 10, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-09-03 12:34:00', 0),
(329, 45, 'A3', 'Brand new Samsung Galaxy A3 2017 ...live demo version @700 nego call 0972311755', 3, 700, '9F4189CC8177384B67A520D965322551,9912BB313B5258BE0E58332900AD4E2B', '9F4189CC8177384B67A520D965322551', 'Dakason', '0972311755', 10, 1, 1, 11, '0', 'Lusaka', 3, 0, '2017-09-03 12:36:02', 0),
(330, 45, 'A9 Samsung ', 'Brand new Samsung A9 boxed with all accessories. Call or WhatsApp +260979432673', 1, 0, 'C307B93D0D4F187B4E24839EB09C1020,7206ACAF219007293044283136C0CD4A', 'C307B93D0D4F187B4E24839EB09C1020', 'Samson Chikondi ', '260979432673', 10, 1, 1, 11, '0', 'Lusaka', 3, 0, '2017-09-03 12:46:21', 0);
INSERT INTO `info_gg_publist` (`id`, `uid`, `title`, `details`, `goodstatus`, `price`, `imgs`, `cimg`, `contactname`, `phone`, `cid`, `issell`, `addr_l1`, `addr_l2`, `addr_l3`, `addr_l4`, `views`, `wishs`, `pubtime`, `status`) VALUES
(331, 45, 'HTC 1 M7', 'HTC one, M7, 32GB internal memory, 100 %neat, k1100, contacts: 0965880556, 0953268345, 0978851281', 0, 1100, 'BAFC94851D6B551E5D5ECB262485EA0D,5019DCA270D988DE72AA14BAB3BDE7E7', 'BAFC94851D6B551E5D5ECB262485EA0D', 'Shama Kaumba ', '0978851281', 10, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-09-03 18:19:26', 0),
(332, 45, 'Toyota Corrolla', 'Mileage 87\nCall or whatsaap0971993082/0969409070', 3, 28000, '59F313610BEB39A231C2C10AC491A77A,447D5577B6F1206FCED22D99045EED05', '59F313610BEB39A231C2C10AC491A77A', 'Andre Chris Banda ', '0969409070', 6, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-09-03 18:27:19', 0),
(333, 45, 'Toyota Allex', 'Buy and drive Allex in very immaculate condition call or wattsapp 0977838481', 2, 0, '8771227ADEA64CAE96F3A6C9991E581D,95F9FF1C7BF386661BB911FC82DD42E0', '8771227ADEA64CAE96F3A6C9991E581D', 'Nelson Jeff Banda ', '0977838481', 7, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-09-03 18:29:20', 0),
(334, 45, 'Nac Mini Lap', 'NAC Mini Laptop, 80GB hard drive, 1GB ram, 3hrs battery, perfect condition, neats as new, K900', 3, 900, '8FE91C7D00250DFC679BD54DEB137B55,614DFDFBF0FDA8FC05EEFAA9C692A661', '8FE91C7D00250DFC679BD54DEB137B55', 'Winna Nshimbi ', '0974873480', 9, 1, 1, 11, '0', 'lusaka', 1, 0, '2017-09-03 18:34:57', 0),
(335, 45, 'Suzuki Escudo ', 'Model:2010\nMileage:102km\nSpeed:220speedometer\nCondition:good\nCell:0976500128', 2, 75000, '4A6A9990503C7572BA7A4883843FDDA6,BB550E47463B90737D6217B9D8884DE3', '4A6A9990503C7572BA7A4883843FDDA6', 'Chitumbo Ferdnand ', '0976500128', 7, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-09-03 18:39:16', 0),
(336, 45, 'Note 5 galaxy', 'Samsung galaxy Note 5 going at k4,700 (negotiable).. 99.9% neat, a month old.. Those interested call or whatsapp 0976064998.', 1, 4700, 'CA582CEC98A12414DCF34B4C5207202F,2C939C95860377BF02952FE5380306CC', 'CA582CEC98A12414DCF34B4C5207202F', 'Simon Hantimbula', '0976064998.', 10, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-09-03 18:41:11', 0),
(337, 45, 'Toyota Ipsum', 'No pressure buy and drive call or WhatsApp 0977608582/0966608582', 3, 40000, 'CA14BEC6D85447737CDC64CEF8A056E9', 'CA14BEC6D85447737CDC64CEF8A056E9', 'Alan Sakala', '0966608582', 7, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-09-03 18:44:33', 0),
(338, 45, 'Toyota Hilux Manual ', 'Quick sale hilux 2008 manual k130,000 neg 0977772635', 2, 130000, '656B541B63107DCAF3C7D11AC92F260E,14FA66D3FFE302D3E6416B907C0202E5', '656B541B63107DCAF3C7D11AC92F260E', 'Mubanga ', '0977772635', 7, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-09-03 18:46:14', 0),
(339, 45, 'BMW Z3', 'Get it today 1.8 L engine. Very sound vehicle. Only K34000. Call 0977 572190 or 0968 843501.', 1, 34000, 'C27469D85092E7314942BD852AE9A58D,2E65C573357B3DCAF6819DABE8D85CC0', 'C27469D85092E7314942BD852AE9A58D', 'Mukuka Mbalushi ', '0968 843501.', 6, 1, 1, 11, '0', 'Lusaka', 3, 0, '2017-09-03 18:47:47', 0),
(340, 45, 'Mark X toyota ', 'Mark X \nModel 2008\nMileage 74\nPrice k90 000 negotiable\nCall 0960995496', 1, 90000, '41EE26586519F42F8B8D41E0007ED88F,8FB5DBE7C1398C3F94E39479DD665BC0', '41EE26586519F42F8B8D41E0007ED88F', 'Young Boss Motors ', ' 0960995496', 6, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-09-03 18:50:13', 0),
(341, 45, 'Toyota Vellfire', 'Toyota Vellfire,\n85,000km +/-, \n2010 model,\n17inch Rims with new tires,\ndual aircon for front and separate for back,\nScreens in the headrest, DVD/radio, regularly serviced and well looked after.\nContact me on 0974558433. Serious buyers', 2, 0, '7F707331B266CFD4B23DD5B67DF52E71,59C39DEDB3F4F841ECBC1C1A7C4D6A79', '7F707331B266CFD4B23DD5B67DF52E71', 'Henry Caddy ', '0974558433', 8, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-09-03 18:56:06', 0),
(342, 45, 'Ipsum', 'Ipsum latest lady driven in excellent condition for sale k 34,000 neg....automatic transmission mileage 123211....call or what''s app 0978655437....Lusaka', 0, 34000, 'E149EE9758065CDC6938A0531F55EF86,CFCA9DFE626768D1A46095FAA3E4DBB7', 'E149EE9758065CDC6938A0531F55EF86', 'Victor Mayundo ', '0978655437', 7, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-09-03 18:57:38', 0),
(343, 45, 'Quantum Toyota ', 'Neat unregistered with maggrims nd on 72 mileage k 180 000\nCall 0972837990/ 0954725890', 0, 180000, '10B6C2B2CE9D77267167EB902939E2D4,02DB6EA084564A286A7705C9F576615B', '10B6C2B2CE9D77267167EB902939E2D4', 'Kelvin Nkhoma ', '0972837990', 8, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-09-03 19:03:43', 0),
(344, 45, 'Couch', 'Second hand sleep couch k500 call 0972752338', 3, 500, 'E58FB00FB05D25227411B1BC43F4D76E,0202D7F34956203702EF619FF15C985E', 'E58FB00FB05D25227411B1BC43F4D76E', 'Glam Furnitures', '0972752338', 18, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-09-05 01:12:21', 0),
(345, 45, 'Dining Table ', '6seater glass dinning table. Its in good shape except for the material on the chairs that''s a bit torn. Going at K700 only. Location is kamwala south. If interested call me on 0977363866', 3, 700, '3C8B82FB5AEAC358A44AA10A9DE56C79,C5712D489053A4A56DB3D91F10302B37', '3C8B82FB5AEAC358A44AA10A9DE56C79', 'Sibeso akapelwa', '0977363866', 18, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-09-05 01:13:51', 0),
(346, 45, 'SOfa', '3,2,1 sofa set for sale. K6,000. Call or whatsapp 0966761613', 2, 6000, '9606801495C6DEFB8FB47222887B3555,C68A16F6D3425ABBB2883C78382FB99F,41B4EB6D33CFE17B361E59222EBB6B97', '9606801495C6DEFB8FB47222887B3555', 'Ackim Mtamira ', '0966761613', 18, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-09-05 01:18:06', 0),
(347, 45, 'Mattress', 'We have received new stock of spring matteress and bed in 3 colours all sizes available double,queen,king size \nWe also accpt laybay for 2 months so call or whtsapp 0962477283\nDouble matteress 1550\nQueen matteress. 1650\nKing matteress. 1750', 0, 0, '16ECFB68016A84E767F09247E97D2A3D,6482F9A506CAC283B4ED861F1AFA11F4', '16ECFB68016A84E767F09247E97D2A3D', 'Rupani', '0962477283', 19, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-09-05 01:21:14', 0),
(348, 45, 'Kitchen Unit', 'Kitchen unit on sale..k1300 negotiable.. contact 0968962737..Kitwe', 3, 1300, '6B1CE858A0325358573E555D35CDB71A,79E9584FDA9494F4C1500FF3100BC334', '6B1CE858A0325358573E555D35CDB71A', 'Joseph', '0968962737', 18, 1, 3, 13, '0', 'Kitwe', 2, 0, '2017-09-05 01:24:59', 0),
(349, 45, 'Microwave ', 'A neat second hand defy microwave for sale, it''s rarely used going @ k500 .Call 0979521103/whatsup.', 3, 500, 'B6F19CB94645DCBE101947BECC635DEA,B7EA7B04E7554D555C74C734A84D6AC9', 'B6F19CB94645DCBE101947BECC635DEA', 'Musonda', ' 0979521103', 19, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-09-05 01:27:43', 0),
(350, 45, 'Sofa', 'Drop you offers 0977435110', 2, 0, 'E6847E468FA73EAEB88409436DD0CDB3,F14FEE518C94C96BF6322F9E27456A4A', 'E6847E468FA73EAEB88409436DD0CDB3', 'Cynthia Mwambazi', ' 0977435110', 18, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-09-05 01:30:36', 0),
(351, 45, 'Sofa', '*Brown 6 seater recliner@13,500..\n\nCALL/ WTSP 0979417111\nLUSAKA', 2, 13500, '63422DE16B0B1D1973CF375FAF29DE0C,16C7C04685723F1BF004F01E451A7F7A', '63422DE16B0B1D1973CF375FAF29DE0C', 'Fatu Jawara', '0979417111', 18, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-09-05 01:36:00', 0),
(352, 45, 'Fridge ', 'Brand new fridge for sale k2900 call 0973607401', 1, 2900, '8169B2C42A6908544CBAF788C2FA8024,222640F97F336E705CC5D844D0F0EEE5', '8169B2C42A6908544CBAF788C2FA8024', 'Christopher Ngulube', '0973607401', 19, 1, 1, 11, '0', 'lusaka', 2, 0, '2017-09-05 01:40:39', 0),
(353, 45, 'Furniture ', 'Beautiful lounge set delivered to our very happy customer Mukuka of kansenshi Ndola you can also make orders for this beautiful simple lounge set with transport inclusive contact me on 0966195984 or like our Facebook page Elichi Furniture''s', 0, 0, '54AB2A337AB29301F4883BD1241D1E7A,005C443DFFB254E29D4F73F398EAAA35', '54AB2A337AB29301F4883BD1241D1E7A', 'Chileshe Remy', ' 0966195984', 18, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-09-05 01:43:23', 0),
(354, 45, 'Laptop HP', 'Hp laptop\n4gb ram\n350 hard drive \n3 hours battery\nDrop ur offer\n0976227586', 3, 0, '44C1CF94D87B662F2421A5F81A8D73DC,713AC4EC369D25E8B0BA117446D9418C', '44C1CF94D87B662F2421A5F81A8D73DC', 'William Tikky', '0976227586', 9, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-09-05 01:49:54', 0),
(355, 45, 'Mitsubishi paler', 'Mitsubishi paler, v6 engine,\nK27,000\n0976779338', 3, 27000, '47D08A7AC2E8A51B2FADF8A086D50C9B,1FBCFB020BF77BF3012F8F3A5FF8989D,7E78C6FD6F84EFDE623EC85072D2FE2C', '47D08A7AC2E8A51B2FADF8A086D50C9B', 'Li pim le', '0976779338', 7, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-09-05 22:53:22', 0),
(356, 45, 'VW Bora', 'Vw bora k32,000 neg\nContact 0977772499 for details', 3, 32000, '38D4CC112FA47C0CA39A92FB20A83584,B86A31F1D8816C2875518E549A1C3236', '38D4CC112FA47C0CA39A92FB20A83584', 'Kapichila King Mvula ', '0977772499', 6, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-09-05 22:56:12', 0),
(357, 45, 'KIOTI TRACTOR', 'KlOTI Tractor 4 sale 50HP 4WD $ 17,020, 80HP 4WD $30,956 and 90HP 4WD $36,760 0977428604', 1, 170200, 'B9A59BCE334D37A8B0290E53D02F09FE,5172268FEA87BA8443E2A361F2B37E74', 'B9A59BCE334D37A8B0290E53D02F09FE', 'Arthur Zikonda', '0977428604', 8, 1, 1, 11, '0', 'Lusaka', 0, 0, '2017-09-05 22:58:49', 0),
(358, 45, 'FunCargo ', 'Funcargo \nLocations............ndola\nPrice ..............k15 last today \nCal the own 0969089730', 3, 15000, 'ACA605BB146EB3257E6C7A336D2CCF24,71C6B7B5FF3262A3383F3FE721586406', 'ACA605BB146EB3257E6C7A336D2CCF24', 'Mumba Joseph', '0969089730', 8, 1, 3, 26, '0', 'Ndola', 1, 0, '2017-09-05 23:00:41', 0),
(359, 45, 'NIssan Camp', 'Quick sale Nissan camp\nK16,000\nManual transmission\n0979592478\nPerfect engine\nLusaka', 3, 16000, '98E99C629962E9A0F902942492B403FF,C96B80A192FA96CA970768B54918A491', '98E99C629962E9A0F902942492B403FF', 'Jay Hami', '0979592478', 8, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-09-05 23:02:42', 0),
(360, 45, 'NIssan Camp', 'Quick sale Nissan camp\nK16,000\nManual transmission\n0979592478\nPerfect engine\nLusaka', 3, 16000, '98E99C629962E9A0F902942492B403FF,C96B80A192FA96CA970768B54918A491', '98E99C629962E9A0F902942492B403FF', 'Jay Hami', '0979592478', 8, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-09-05 23:03:27', 0),
(361, 45, 'IST Toyota', 'Toyota IST for sale K30,000 non negotiable call 0977356442,mileage 81820,location makeni', 2, 30000, 'A5DA443A1E99EF50DAF498B0C195228C,77EF8C3AB33F60204F9F0DD90B35D1E3,DE4200B1F99287BA291916E34A4A7BAB', 'A5DA443A1E99EF50DAF498B0C195228C', 'Wilfred Mwenda ', '0977356442', 8, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-09-05 23:05:51', 0),
(362, 45, 'Toyota ', 'Buy n drive 5a engine 15pin last serous buyers only call 0977680673/0966680673', 3, 15000, 'F3B7075F0522748BB8F51E95D5A3509E,072DB2CA2126BB671449389CA70A7BAA', 'F3B7075F0522748BB8F51E95D5A3509E', 'Mussa Sherifu', '0966680673', 6, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-09-05 23:08:16', 0),
(363, 45, 'Audi A4', 'Audi A4 going at k30,000 \nCall or WhatsApp 0976587290', 2, 30000, '8B0E8B92C39D004EF584BAFF35E703E8,54C678B5EF1BEC6E9EEBAE0426E1D15A', '8B0E8B92C39D004EF584BAFF35E703E8', 'Lukhele', '0976587290', 6, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-09-05 23:12:04', 0),
(364, 45, 'Toyota Nadia ', 'Pressure free. D4 engine replaced by 3S engine (imported and documentation available). Call 0977714603 and drop your offers', 3, 27000, 'BAB980D04ED2DFD617254D61081702AB,236182B8C6C11ECD0B3090FD475A13CC', 'BAB980D04ED2DFD617254D61081702AB', 'Andy Andrews ', '0977714603', 7, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-09-05 23:14:17', 0),
(365, 45, 'Toyota Raum', 'Toyota raum 1ltr engine capacity call 0977888303', 3, 40000, '9627A7FBB3B9ECD454495DA0FC63A9A6,C6E80F8C7CDEE7672B234C5AF7140FFA', '9627A7FBB3B9ECD454495DA0FC63A9A6', 'Gibson Zacks', '0977888303', 8, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-09-05 23:16:51', 0),
(366, 45, 'Yaris', 'K42,000 negotiable whatsapp on 0977395769', 2, 42000, '5CA625786AB42828AC2D4947DC1FE559,E636C3D354EEFB68C2DAA4621C5B1588', '5CA625786AB42828AC2D4947DC1FE559', 'CHazi Chazi', '0977395769', 8, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-09-05 23:20:42', 0),
(367, 45, 'Toyota Voxy', 'Toyota Voxy K30,000 negotiable. In perfect condition Contact me on 0974558433', 3, 30000, 'A96B5E561C5D3268EFF654CBDBE88B6C,A98BDB9334E1FF38AE6D41FAEA3B0697', 'A96B5E561C5D3268EFF654CBDBE88B6C', 'Henry Caddy', '0974558433', 8, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-09-05 23:23:12', 0),
(368, 45, 'Prado', 'Toyota prado TX\nPrice.............k60000\nMileage .........80 standard \nLady driven\nBuy and drive no pressures\nLocations ..........ndola\nCal ......0962773030', 3, 60000, '9EF7F9518607A5A09E53C635E968167D,760BB5EB71745F47BEE5178619A5CCA1', '9EF7F9518607A5A09E53C635E968167D', 'Mumba Joseph ', '0962773030', 7, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-09-05 23:24:56', 0),
(369, 45, 'Dell', '1tb hard drive 4gb ram Cole i5. .. Interested call 0972536363', 2, 0, '39BAE7BCFE72B984775C742312B429FD,05D61FC633C4C5BBF9CD35B5D8890F4F', '39BAE7BCFE72B984775C742312B429FD', 'Emannuel Chikasi ', '0972536363', 9, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-09-05 23:27:58', 0),
(370, 45, 'Ipad 4', '16gb memory with a sim provision... Interested call 0972536363\n\n', 3, 0, 'D7EE2674572F10956BCB9B1680595F33,F45266F4B505370C12C72C9F3FCCBE15', 'D7EE2674572F10956BCB9B1680595F33', 'Emannuel Chikasi', '0972536363', 12, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-09-05 23:30:27', 0),
(371, 45, 'Galaxy A5 2016', '260972995001 call or whatsapp', 2, 2200, '0E077F56C170992C1DF0E4EEDAC5EB5A,FD08361C740D1E9B906FDAA6F1B38423', '0E077F56C170992C1DF0E4EEDAC5EB5A', 'Dalitso Mwanza ', '0972995001', 10, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-09-05 23:32:20', 0),
(372, 45, 'LG G5', 'LG g5 32gb going @2800 very neat neat \n0966543245', 2, 2800, '7E683C855265FD0FAE0F11915F71BB63,3ED5B8D53E51585083CAC8B10549354A', '7E683C855265FD0FAE0F11915F71BB63', 'Bester Kamanga ', '0966543245', 10, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-09-05 23:33:55', 0),
(373, 45, 'Prado landcruiser ', 'None negotiable \nFor viewing and testing\nCall 0961017701\nAgent wahtssaap me for photos\n0976765197', 2, 95000, '6DD2BF3E871D03303B4F0A6EDF23855E,ACA5B2727387C6C0265BBC90BBA38C3B', '6DD2BF3E871D03303B4F0A6EDF23855E', 'Kowa Paul', ' 0961017701', 7, 1, 1, 11, '0', 'Lusaka', 3, 0, '2017-09-05 23:37:47', 0),
(374, 45, 'Axio COrolla ', 'Quick sale...0978025116. 45 negotiable\nAxio corolla 0978025116. 45kwacha', 3, 45000, '8195663525819BD13B6B7C04721CB340,651B1E80CD0A7564B56E1AC6BD4F3DE7', '8195663525819BD13B6B7C04721CB340', 'Brian Kuba ', ' 0978025116', 6, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-09-05 23:39:25', 0),
(375, 45, 'Nissan Hardbody', 'Nissan Hardbody\n2006 YEAR OF MAKE\n4X4 DIESEL MANUAL\nREPAINTED\nK63,000 NEGOTIABLE\nLOCATION: LUSAKA\nCALL: 0971165881', 3, 63000, '354740A16FD753025D1BA18784C247CC,4E3F1624BBBB549D03ACB2A609BA52A2,D1D29F630FCE907D11E2E07E110FC669', '354740A16FD753025D1BA18784C247CC', 'Zyola Simwaka', '0971165881', 8, 1, 1, 11, '0', 'Lusaka', 3, 0, '2017-09-05 23:41:49', 0),
(376, 45, 'Meccer Tablet', 'MECER TABLETS HERE.\n-8GB UNB SPACE\n-6.0.1 ADROIND VERSION\n-1GB RAM\n-GUDVBACK AD FRONT CAMERAS\n--COMES WITH EVERYTHING\n-IN BOX AD PRESSURE FREE\nCALL ME ON 0978800717/0973237390 ON WATSAPP', 0, 1000, 'F4B447D908B1E1F9E2C00F540744B315', 'F4B447D908B1E1F9E2C00F540744B315', 'Mulako Theresa Phiri', '0973237390 ', 12, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-09-06 21:51:30', 0),
(377, 45, 'Toyota Noah ', 'Toyota noah with knocked engine and left front shock pressure... Give me offers on 0972929188..car is located in zaf lsk, airport road', 3, 0, '03A267816F15C497402815215C1ECCAD,2B9B45C6CC738C927AE9478DCFD0A4B7', '03A267816F15C497402815215C1ECCAD', 'Bryan Madubeko ', '0972929188', 8, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-09-06 21:52:57', 0),
(378, 45, 'Y6 Huawei ', 'Huawei y6-pro \nRAM 2gb \nROM 16GB \nV5.1\nK1000 \n0973052058', 3, 1000, 'A7C6157B4BC2BA3A4A662C09C22FAA89,A4EF16141ECB97BFE12CCD320A8E2E0F', 'A7C6157B4BC2BA3A4A662C09C22FAA89', 'FRank Mwale', '0973052058', 10, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-09-06 21:54:31', 0),
(379, 45, 's8 + ', 'Almost new Samsung galaxy s8+ dous 64gb k6800nego swaps allowed call text whatsapp 0973926741', 2, 6800, 'B10820E50077248EF3586743C0D00C00,DD5920C393F4F96C44316FBE739536D1', 'B10820E50077248EF3586743C0D00C00', 'Austin Salim ', '0973926741', 10, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-09-06 21:57:45', 0),
(380, 45, '5s Iphone ', 'very neat iphone 5s wth 32gb but figure print dont work plus how mch top up on yo iphone 6 call 0955670032', 2, 0, '20EE3C85519DC66A6B24636D438FD0C3,05BC4582659C4D31279E51FDEF399943', '20EE3C85519DC66A6B24636D438FD0C3', 'Dat Glory Boy ', '0955670032', 10, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-09-06 22:00:20', 0),
(381, 45, 'Mazda Tribute ', 'K20,000 negotiable Mazda tribute runner call: 0976818905 / 0954857177', 3, 20000, '202EB2384EED6A2FF9994071114AF077,12AB0ABFBC0E8E38E316D1B51A0C83AA', '202EB2384EED6A2FF9994071114AF077', 'Deon mquania ', '0954857177', 7, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-09-06 22:03:26', 0),
(382, 45, 'Corolla ', 'SE corolla crystalight,\nSecure with latest alarm/mobilizer\n1000km warranty\nVery good tires\nNeed inside out\nNo agents\n0977402001\nWell serviced engine', 3, 32000, '0C7571D0D1564FAA4F4AA0E8F999DCD5,61C8A9C07BEFEA9D7CDE26E9DBDA6A60', '0C7571D0D1564FAA4F4AA0E8F999DCD5', 'Abel Mumba ', '0977402001', 6, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-09-06 22:06:46', 0),
(383, 45, 'BB', 'Like new blackberry 9930 @K370 call or whatsapp 0966837394', 0, 370, '65015372763516DE0329BC00272ABD91,3466E90DA614CCE8BC566675B1D7C892', '65015372763516DE0329BC00272ABD91', 'Zondiwe Kennedy ', '0966837394', 10, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-09-06 22:09:10', 0),
(384, 45, 'Toyota Vits ', 'Super neat\nModel 2002 \nApp/call0976164998', 3, 0, '0242EE7FD47E87D7AEB67EF46F1F46E9,9CBB17A85B36119B303422577C6DC899,56BBB1C70E36BEDA99C60E8F9AA3A380', '0242EE7FD47E87D7AEB67EF46F1F46E9', 'Alfred', '0976164998', 7, 1, 1, 11, '0', 'Lusaka', 3, 0, '2017-09-06 22:11:28', 0),
(385, 45, 'Tecno Camon 9', 'Less than 2weeks old +260972995001 call or whatsapp', 3, 1250, 'C12D893032825A3712B59919E650099F,22F4CC15A4518CB66FA2AB7E8932E218', 'C12D893032825A3712B59919E650099F', 'Dalitso', '260972995001 ', 10, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-09-06 22:15:24', 0),
(386, 45, 'HP LAPtops ', 'New HP 440 g3 14inch 2.3ghz core i5 6th gen 500gb HDD 8gb ram 7hours battery 0968771770 k3700', 0, 3700, '504A23905766B64C094911482A7D3D7F,23E09D621ABB004F1F617B1D5FD26FE5,FB665E8F5E5B3E1C39DFE414BE6780D7', '504A23905766B64C094911482A7D3D7F', 'Lopez Mwila Mwape', '0968771770', 9, 1, 1, 11, '0', 'Lusaka', 3, 0, '2017-09-06 22:17:58', 0),
(387, 45, 'Toyota Auris ', 'For sale Toyota Auris mileage 55000 models 2007 call me WhatsAp 0971692837', 2, 60000, 'C69EDE403BE2C482553401E67D7A2289,89C592E7E743475DB950AAE14567CA9F,DA6B5F21051ECDC19E0EF361E5FD6114', 'C69EDE403BE2C482553401E67D7A2289', 'Ustad  Irfan ', '0971692837', 6, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-09-06 22:21:45', 0),
(388, 45, 'Spacio ', 'spacio \nk27,000 - maken konga\n\nphone number 0979863573 or 0961769840', 3, 27000, '2401C6879D6C52C4E37454D0D2A6BF9C,D45705B6AAA9418464CE4F89FCE8572E,5B23590CF172284913989CDAD27B2404', '2401C6879D6C52C4E37454D0D2A6BF9C', 'Wamunga ', '0961769840', 8, 1, 1, 11, '0', 'Lusaka', 3, 0, '2017-09-06 22:31:26', 0),
(389, 45, 'Iphone 5s', 'Very neat and pressure free iPhone 5s up for grabs k1750 call 0954353585', 3, 1750, '2FABA168EC35CCCFB7EA34BF8CAB27AE,268B4A7A350385AC6D34BE32D78A5BC2,19C6E62B7D333290B262C6547BAD9B24', '2FABA168EC35CCCFB7EA34BF8CAB27AE', 'Man Razzle', '0954353585', 10, 1, 1, 11, '0', 'Lusaka', 8, 0, '2017-09-06 22:33:32', 0),
(390, 45, 'Honda Fit ', 'Price : K 36,000 Call : 0966966419 Reg No #BAD', 2, 36000, '1CC55A3C8C5E50BCB4813F97C80B9A43,ECC5D856CF014463530F2D2C647224D7', '1CC55A3C8C5E50BCB4813F97C80B9A43', 'Nsenga Mulenga ', ' 0966966419', 8, 1, 1, 11, '0', 'Lusaka', 4, 0, '2017-09-06 22:35:53', 0),
(391, 45, 'Hisense TV ', 'Brand new Hisense LED TV 40" has HDMI and USB ports for sale at k3500neg call on 0974155100. .......0966224926', 0, 3500, '10EA8931590F6753D033448652042F7B,061A7579892358CA73892D710DB0F41E,2A326CB2570134AE8DE65DF0E09E8AE9', '10EA8931590F6753D033448652042F7B', 'Sulanji Sulanji ', '0974155100', 19, 1, 1, 11, '0', 'Lusaka', 3, 0, '2017-09-06 22:38:21', 0),
(392, 45, 'Acer Laptop ', 'acer laptop touch screen for sale 12.1 windows 8.1\nharddrive 500 gb\nram 2 gb\nexcellent battery\ngood condition\nprice k1500\ncall 0968239169/0975380085', 3, 1500, 'D17C6FB53D04F00E2936C6EC07A25AA0,5FDEC4DC4DF82F4FF1977C6AA7B2C111', 'D17C6FB53D04F00E2936C6EC07A25AA0', 'Jacod Yakobo ', '0975380085', 9, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-09-10 09:15:48', 0),
(393, 45, 'Gateway Laptop', 'Gateway Laptop at K2,000. No dents or scratches \nSpecs: 500GB hard drive, 4GB RAM, Windows 8 (stock), 4 hours battery. Call/WhatsApp 0977226582', 3, 2000, 'D85F8EC9C95FC8F65343330D6108C152,828834B8B94A743267B0BFAF5EF6B8C1', 'D85F8EC9C95FC8F65343330D6108C152', 'Salim Jabbie', ' 0977226582', 9, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-09-10 09:18:48', 0),
(394, 45, 'Sony HD camera ', 'CYBER SHOT HD QUALITY LENS going at k2000\nCALL OR WHATSAPP 0973212340', 3, 2000, '1A917623CA2DB7F6DC3E82C03CC8E5C6,60E13B8CDE56B6CEC4ACC394BDB12F6F,89A9511E0E5D35E2F49721BA5F48A995', '1A917623CA2DB7F6DC3E82C03CC8E5C6', 'Tonny Ward ', '0973212340', 12, 1, 1, 11, '0', 'Lusaka', 3, 0, '2017-09-10 09:24:21', 0),
(395, 45, 'HP pavillion ', '98 percent neat and in excellent condition..comes with charger..500gb 4gb ram..has a touch screen..call 0971711698..lets close the deal', 3, 2500, 'EFC1C02679E3F92692859BBF33771450,65D370B1B6986DA25462319BA588BDAE', 'EFC1C02679E3F92692859BBF33771450', 'Raphael Mulenga ', '0971711698', 9, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-09-10 09:27:44', 0),
(396, 45, 'Astra Tab ', 'Astra tab up for swap and top up or cash .....k850 ...its has 25gb 3gb ram 8inch very gud battery drop yo offers now', 3, 850, '3008184EC7E6D4B4AEAAE09A376CEB17,EDB2133F54ECE71C0CF1E9A68C308A4A', '3008184EC7E6D4B4AEAAE09A376CEB17', 'Christone', '0954741799', 12, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-09-10 09:32:15', 0),
(397, 45, 'Lshaped Sofa', 'Reduced to clear ,call/watsup@0977544133', 2, 0, '7836B9935C2436A80933054343D7FF2A,247917BE5D998BA5A3CD412B5D3F4D41', '7836B9935C2436A80933054343D7FF2A', 'Victoria Vwalika', '0977544133', 18, 1, 1, 11, '0', 'Lusaka', 4, 0, '2017-09-10 09:37:23', 0),
(398, 45, 'BB 9900', 'Blackberry 9900.\nSimplicity is the peak of all cultivation . Get yourself a blackberry 9900 at an arm stretching price of only 350 kwacha . \nValue for money includes :\nWhatsApp compatible \nH+ internet\nEmails \nMobile hotspot \n3 months warranty \nBrand new battery\nCall/WhatsApp us now 0954-847-452', 3, 350, 'B2C2FB83337F16DAC951D95CD98E17AE,AD5A6B54FF88B51C8140A3E93F3E0B15', 'B2C2FB83337F16DAC951D95CD98E17AE', 'Chiko Phiri ', '0954847452', 10, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-09-19 20:36:01', 0),
(399, 45, 'Samsung Grand 2', 'SAMSUNG GRAND 2\n16GIG INTERNAL STORAGE\nEXPANDABLE STORAGE UPTO 64GB\n8MP BACK AND 2MP FRONT CAMERA\n1150 NEGOTIABLE\nCOMES WITH SCREEN PROTECTOR,POUCH AND CHARGER \nLUSAKA BUSINESS\nPHONE IS NEAT..PRESSURE FREE AND IS RARELY USED..\nNO SWAPS OR TIME WASTERS.. CASH ONLY!!!!\nWATSAPP 0979230277 IF INTERESTED', 2, 0, 'E84161EF94C6BB49BEE910D3E49B9E57,DA4FA289ED2F22A5F9C02B0FA85C55F5', 'E84161EF94C6BB49BEE910D3E49B9E57', 'Leo Mukelabai Mwanza ', '0979230277 ', 10, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-09-19 20:43:53', 0),
(400, 45, 'PS3', 'ps3 slim comes with 1 controller drop your offers.. swaps with reasonable phones are welcome call or text 0978050447', 3, 0, '545C41BF326F8A04643FBC5EFBA1445C', '545C41BF326F8A04643FBC5EFBA1445C', 'Gilbert Mumba ', '0978050447', 12, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-09-19 20:47:15', 0),
(401, 45, 'MacBook ', '90% neat black MacBook 250 HHD 2GB RAM.......REDUCED TO GO.......... 0975109991', 2, 0, 'FFC3D413C6EC92A4327B8487F19D398A,DB6B895C7DF878C5C338608C80346D8A', 'FFC3D413C6EC92A4327B8487F19D398A', 'Chansa Chibwinja ', '0975109991', 9, 1, 1, 11, '0', 'Lusaka ', 2, 0, '2017-09-19 20:50:16', 0),
(402, 45, 'HP pro Book ', 'Pro Book \nCore i3 \n4 Gb RAM \n500 GB HardDiskDrive\nWhattsapp or call 0978108065 .', 1, 2500, '6CD26E1E789A8760CFC13C30E0E056F1,460D6CA2E6BB4AD61FE83DD50282EAD3,93A5AF9C561CB9F28AB16AE6F801F33D', '6CD26E1E789A8760CFC13C30E0E056F1', 'Chushi Serenje ', '0978108065', 9, 1, 1, 11, '0', 'Lusaka ', 1, 0, '2017-09-19 20:54:21', 0),
(403, 45, 'Phone Sony Xperia', 'Phone Sony Xperia', 3, 900, '6110C9F15E70154BA570759B7EEACC0F,B453834A90F00D7E223A3397A4E6E166', '6110C9F15E70154BA570759B7EEACC0F', 'Simon Peter ', '0975929801', 10, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-09-19 20:59:50', 0),
(404, 45, 'FULL SET DESKTOP 500B', '3.2GHZ DUAL CORE PROCESSOR \n500GB HARD DRIVE \n4GB RAM\nCOMES WITH ORIGINAL HP WINDOWS 7 OS \nGOING AT K1900NEG\nCALL 0969646858\nFREE DELIVERY IN LUSAKA ONLY', 1, 1900, '6359523AD061836CE73D751201D959F0,417FA2E9CA7F5EC732E607C307BE126A', '6359523AD061836CE73D751201D959F0', '0960509422', '0960509422', 9, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-09-19 21:03:17', 0),
(405, 45, 'Acer Laptop ', 'Neat accer i3 with 4gb ram 500gb hdd Goin for 1750 lsk call on 0976276465', 2, 1750, '648D632110C58CEDEC10F02F1CE8B741,70567898ACB75DC338B421190823B244,E0C39FDB08456702D67C1852013DEDC0', '648D632110C58CEDEC10F02F1CE8B741', 'Sage Nyirongo ', '0976276465', 9, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-09-19 21:23:06', 0),
(406, 45, 'HP mini laptop', 'Neat i5 hp mini with 4gb ram 250gb hdd up for grabs lsk call on 0976276465', 3, 0, '6B40150DE2C8EAF55E5EC959D19A5ED1,39C6DB7C4F88D4EBC442616D3C346DCF', '6B40150DE2C8EAF55E5EC959D19A5ED1', 'Sage Nyirongo ', '0976276465', 9, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-09-19 23:16:30', 0),
(407, 45, 'Hp Laptop ', 'Neat hp i5 laptop with 4gb ram 250gb hdd hoping for k1550 lsk call on 0976276465', 3, 1550, 'AAFA8926E42AE8333EA51CD7403DA7A8,765115625EE4BBB27AAC48B5E027B3D1', 'AAFA8926E42AE8333EA51CD7403DA7A8', 'Sage Nyirongo ', '0976276465', 9, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-09-19 23:18:45', 0),
(408, 45, 'galaxy s6', '32GB galaxy S6 edge (gold)\n4G LTE\n3GB ram\nfinger printer scanner,\nstrong battery, \n6.0 android version\n100% neat and pressure free, USB cable, excellent front and back camera...\ngoing at K2800 cash only \nfeel free to call 0954120208', 3, 2800, '4F9C4C176D31AA68725590AA2769B2A7,2787617FD745987935D66F3B34900543,8E122C6E05F06A79A2D36596C21488CF', '4F9C4C176D31AA68725590AA2769B2A7', 'Panda Banda', '0954120208', 10, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-09-19 23:22:06', 0),
(409, 45, 'HP Laptop ', 'HP LAPTOP \nHDD 500 GB \nRAM 4 GB \n4 HOURS BATTERY\n3 USB PORTS \nK1600 \nCONTACT 0974638488', 3, 1600, 'E76DF5645F7E680F27D6CEDE23645320,62614491E1FC1B9089E20A2E0DD44734,F8F5C139F73991187555BBDFDFF48761', 'E76DF5645F7E680F27D6CEDE23645320', 'Mike Koko Lukaki', '0974638488', 9, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-09-19 23:26:34', 0),
(410, 45, 'Iphone 6', 'Neat iPhone 6\n16gb\nComes With a Charger\nK2800\nCall/Text/WhatsApp\n0975039703', 3, 2800, '316454AEC4F2F8E203EB9F2D732ECA02,158D84779DA309E2D038D7B1CF7D6E04', '316454AEC4F2F8E203EB9F2D732ECA02', 'Stanley Ngwenya ', '0975039703', 10, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-09-19 23:30:28', 0),
(411, 45, 'Acer Laptop', 'ACER INSPIRE E15\n$35\nLusaka, Zambia\n(HOPE STORES ZAMBIA LTD)\nYou can contact us or whatsapp us on ((260974755434))\nACER Aspire E15\nIntel(R) Celeron(R) CPU N2840 @ 2.16GHz 2.16GHz,\n1TB(1000) 8GB RAM,\n64-bit Operating System,\nK3500.', 2, 3500, 'D4217CF9726EDDB3C4E61088EE13E462,F60FF47E4EC2F1ACD5CE4A982AECE8E0,0A515791F3A65E79C501E0DAA3784105', 'D4217CF9726EDDB3C4E61088EE13E462', 'Danny Dolla ', '260974755434', 9, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-09-19 23:35:09', 0),
(412, 45, 'Techno W3', 'Neat techno W3 \n8gb inbuilt and 6.0 android version \nHas cracks affect nothing for sale @420 call 0955478497', 3, 420, '2C47B579360FB923CE9E5614468C2315,DD326606D4688C59FB45DF6D10D9A226,5011BC810AFC3252796B72291C457871', '2C47B579360FB923CE9E5614468C2315', 'Erick Mbota ', '0955478497', 10, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-09-19 23:41:59', 0),
(413, 45, 'Toyota IST', 'IST  Toyota ', 2, 39000, 'D7D2518502854D97BF954E7CDAC65466,AB9593491C8B2FC87E528BF1450B0155,3DC53251F0042B1F98BF85DEAB80CBE1', 'D7D2518502854D97BF954E7CDAC65466', 'Sucre Jr Maliko', '0977171126', 7, 1, 1, 11, '0', 'Lusak', 2, 0, '2017-09-19 23:48:41', 0),
(414, 45, 'Hisense Tv ', 'BRAND NEW\nHISENSE TV\n32 INCHE\nPRICE K1800\nWHATSAPP /TEXT /CALL/\n0965876248', 2, 1800, '5E51AC88FB791DEAACF43D204AF00CC0,CC161867C6CB8814FB29F79F02F1C288,AA7792254A09348C41CB0B0D0E0DB21D', '5E51AC88FB791DEAACF43D204AF00CC0', 'Tim Bulaya', '0965876248', 19, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-09-19 23:53:13', 0),
(415, 45, 'Hp Compaq', 'hp Compaq fairly neat weak battery\n15.4inches\n320gb 2gb RAM comes with a power pack clear\nfront camera windows 8 4usb ports VGA HDMI\nports DVD writer Bluetooth WiFi going at k1400\nlusaka 0972736875\n0953711020', 3, 1400, '0CDFFA111DD9FBA2AA82CE9E147CDFB1,DFEC802A973554137E63DE2824C87272,8E0ADA8AA3B5EA7D977629CFE17A0301', '0CDFFA111DD9FBA2AA82CE9E147CDFB1', 'Akiyele Jim Phiri', '0953711020', 9, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-09-20 00:03:20', 0),
(416, 45, 'Passo ', 'Passo fo sale k24 pin neg co or Watsup 0950267790', 3, 24000, 'DB335D11C395200B09293FB2AEB49072,30E654CFD4F893DD6F06ECFD7E2C8180,EE6097C6A4ECF1E903588EF4C8B28013', 'DB335D11C395200B09293FB2AEB49072', 'Mike Chisangano ', '0950267790', 7, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-09-20 20:52:58', 0),
(417, 45, 'VVti Corolla ', 'Toyota Corolla VVTi up for grabs\nTransmission: Manual\nPrice: K 35000 negotiable\nCondition: Excellent \nContact: 0977127755\nLocation: Kitwe', 3, 35000, 'CF64A19C3E1C66A3670A1CA42BDA6120,3A607E32140ABF847B67F94A8CC3C7E8', 'CF64A19C3E1C66A3670A1CA42BDA6120', 'Busiku Jeremiah ', '0977127755', 6, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-09-20 20:56:24', 0),
(418, 45, 'Pajero', 'Very Neat 2007 Pajero Shogun for Sale\nYear:2007\nTransmission: Automatic\nEngine:6G-72(Petrol)\nMileage: 140,000km\nPrice: k130,000 Negotiable\nCall or WhatsApp 0976420526', 3, 130000, '4325D156133547A454F0B80F97D5C021,059D90B33422116277C27EBFA87CD995', '4325D156133547A454F0B80F97D5C021', 'Martin Steven Gura ', '0976420526', 7, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-09-20 20:59:22', 0),
(419, 45, 'Golf', 'selling Golf 4 with low mileage 164km call/Whats up me on 0978826176', 3, 0, 'D84EC37F7EDC69B4433AAE3610BDB236,8D96668CFD805F3858F96FD1AD85A364', 'D84EC37F7EDC69B4433AAE3610BDB236', 'Prince Chikwanka', '0978826176', 8, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-09-20 21:15:50', 0),
(420, 45, 'Spacio ', 'Spacio New sharp....122000kms...\nK29,000 negotiable....\nCall/watsup 0977570957', 3, 29000, 'C7A115F0E586451EA283A033093CCCA9,99355DAE80FE822D594FC3A585E98BFF,C9F5441AA64A53FC6FDEBA12F38989AD', 'C7A115F0E586451EA283A033093CCCA9', 'Marsy Thwangi', '0977570957', 7, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-09-20 21:23:38', 0),
(421, 45, 'IST Toyota ', 'In very good condition buy and drive\nThe price is negotiable\nIf interested u can contact me on these lines.. \n0978273632 or 0950686706', 3, 35000, 'E3F9A948B908B6D34209649F5CB9A758,524A0C3B7EBB5CF10F635859B4C2F6DB,77A6C9B53A0ED2B1866490CC15FB6FEE', 'E3F9A948B908B6D34209649F5CB9A758', 'Sapharao', '0950686706', 7, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-09-20 21:50:02', 0),
(422, 45, 'Samsung 50"', 'Brand new 50" Samsung TV up for grabs lsk call on 0976276465', 3, 0, 'C923752C630B9C48E1640BB8E3AC1C2E,C84621E40A13E3505193FE07148D5021', 'C923752C630B9C48E1640BB8E3AC1C2E', 'Sage Nyirongo ', '0976276465', 19, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-09-20 21:58:53', 0),
(423, 45, 'Toyota ae110 ', 'Pressure tail light, and nothing valid on the screen, my contact 0979851781. K18000', 3, 18000, '9840FA2B09791A1ABE6B53D0C690A763,13B4C922E4EA1560FDAB5455056EACAA,6A871017D8CD5DCCACD8B574F6C6452E', '9840FA2B09791A1ABE6B53D0C690A763', 'Chimwemwe Silumpumbwa ', '0979851781', 6, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-09-20 22:02:11', 0),
(424, 45, 'Chair', 'Very strong and genuine leather chair, both functional and decorative. K650 negotiable. Located In Kabwata. Call 0979498714 if interested', 0, 650, 'ABDE5371411C78D3CF2731EAA33712F1,6B4DCC62C825F77AB538EFCE066CDE8E', 'ABDE5371411C78D3CF2731EAA33712F1', 'Kulumbwa ', '0979498714', 18, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-09-21 20:05:52', 0),
(425, 45, 'DEfy Fridge ', 'Defy upright in perfect condition. 0977752944.', 3, 0, '92C774125B7B721F4FE75FA3ACE84710,1EA18621D3A58DC3BA72F008F509176D', '92C774125B7B721F4FE75FA3ACE84710', 'Derick Kalumba ', '0977752944.', 19, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-09-21 20:07:38', 0),
(426, 45, 'Sofas ', 'Slightly used sofa chairs sold at K3000 Whatsapp 0968182608', 2, 3000, '1CD85C8149C8ED35EFCF2D81624ADDBA,26B4AD7B2D8F9928062063F49C6B05A2,618FA59E59864F00933B53BB3DC80953', '1CD85C8149C8ED35EFCF2D81624ADDBA', 'Gaspard Milo ', ' 0968182608', 18, 1, 1, 11, '0', 'Lusaka ', 1, 0, '2017-09-21 20:09:41', 0),
(427, 45, 'Kitchen Unit Single ', 'Kitchen units brand new deferent types k750 and juice maker k450 call 0977287868 libala south lusaka', 3, 750, '31E65B02AF54F7F19C8190921A991C5A,1AF58E519A778D6E3B9A3FA9F9395FC2', '31E65B02AF54F7F19C8190921A991C5A', 'Elvis Sayoni ', '0977287868', 18, 1, 1, 11, '0', 'Lusaka ', 1, 0, '2017-09-21 20:11:32', 0),
(428, 45, 'Samsung 32" LED ', 'Samsung LED 32 inch boxed only one remaining k1,700\nCALL 0979048888', 2, 1700, 'D8CCF676DDD730797F25BCF3A94CCC0E,EC3C16C780860859621832BF418FB525', 'D8CCF676DDD730797F25BCF3A94CCC0E', 'Stephen Chola ', '0979048888', 19, 1, 1, 11, '0', 'Lusaka ', 1, 0, '2017-09-21 20:13:10', 0),
(429, 45, 'Sindtec ', 'Sinotec 40 give me K2500 last 0977319930', 3, 2500, 'CE0D643EE70B9CC770C15F9159E5A4BA,F3D879C803205F054ADD40AC7F9798FA', 'CE0D643EE70B9CC770C15F9159E5A4BA', 'George Salala ', '0977319930', 19, 1, 1, 11, '0', 'Lusaka ', 1, 0, '2017-09-21 20:15:06', 0),
(430, 45, 'Furniture ', '2000 call or what up 0973093034 kamwala south bobs corner', 2, 2000, '2499879BA530B6293AC0CDEB650D66A1,F64B0888123CBD7EA7DB56E74B648047', '2499879BA530B6293AC0CDEB650D66A1', 'Reuben Mwandu ', '0973093034', 18, 1, 1, 11, '0', 'Lusaka ', 1, 0, '2017-09-21 20:17:24', 0),
(431, 45, 'Assorted ', '2seater, 1 seater, Chairs as well as a storage ottoman \nPrice: K2000 (none negotiable)\nDefy Upright fridge\nPrice: K2000\nLOCATION: NDOLA\nCall/ whatsapp 0979 515959\nSerious people only', 3, 0, '2A6CD3D8C3A74D34161F27FF84292055,38C598DACFE7704F508D83E4F3917775', '2A6CD3D8C3A74D34161F27FF84292055', 'Sitali Mwiima ', '0979 515959', 19, 1, 3, 26, '0', 'Ndola ', 1, 0, '2017-09-21 20:21:41', 0),
(432, 45, 'Kitchen Unit ', 'New kitchen unit and bases going at k600-k1000 delivery is inclusive. If interested call 0953249333 or inbox me', 3, 0, '48C61DF54C9521FB9D48D5551F87EE49,F367B1D18F6D9788A6305EDD85CC7213', '48C61DF54C9521FB9D48D5551F87EE49', 'Collins Mwila ', '0953249333', 19, 1, 1, 11, '0', 'Lusaka ', 1, 0, '2017-09-21 20:24:25', 0),
(433, 45, 'TV ', '32" LED Samsung K1750, LG 49" LED with an inbuilt decoder k4800 and Samsung 40" brand new smart TV k3500. All prices are negotiable. Call or whatsapp 0978897773 /0963830438. Lusaka.', 3, 0, '3B0A9210C71AAE8E98DD1E56218265D5,EC4263DA37EBE40113020D852A3EB03F,DF64A0C380908ACDFF4B124251E6487B', '3B0A9210C71AAE8E98DD1E56218265D5', 'Noel Mungelo ', '0978897773', 19, 1, 1, 11, '0', 'Lusaka ', 1, 0, '2017-09-21 20:27:20', 0),
(434, 45, 'IST Toyota ', 'Toyota ist for sales for details call 0975060437', 3, 28000, '8863A85EFEDA638843E4CDF8CB63148F,25E310C82AD922AAB3E613CA1152D97E,8762A2FA556B19965AC16A1A74CD4585', '8863A85EFEDA638843E4CDF8CB63148F', 'Chamaninga Peter Chulu ', '0975060437', 8, 1, 1, 11, '0', 'Lusaka ', 1, 0, '2017-09-21 21:12:42', 0),
(435, 45, 'Iphone 7plus ', 'Quick sale! Price is negotiable. Call/text/whatsapp +260977993599', 3, 8500, 'EE1C782B26B87C92C7717C6F41C99CD6,2D5F009400AC6775E521FCD847A19A7E,544FB5452A089BCE1375479DB4FB3C98', 'EE1C782B26B87C92C7717C6F41C99CD6', 'Grace Banda ', '0977993599', 10, 1, 1, 11, '0', 'Lusaka ', 1, 0, '2017-09-21 21:17:31', 0),
(436, 45, 'Toyota ', 'call 0963881248/0955097757 call now mage 75 km\ntoyota turios for sale 22 pin tyerz magerim', 3, 22000, '2D9171F2272B4FCC8FE63C13F9357845,12ED8233941492F419B51E2701E52ACB,1F190AB4D8DB41E00EFB32107B2310E0', '2D9171F2272B4FCC8FE63C13F9357845', 'Wise Kyoma ', '0955097757', 8, 1, 1, 11, '0', 'Lusaka ', 1, 0, '2017-09-21 21:20:02', 0),
(437, 45, 'Toyota Hybrid', 'going cheaply at k14000 without an engine buy it as it is the car is not registered but duty is paid already buy VVTI INZ engine for it and give it a new number plate am in Lusaka call me 0974983138 regards good luck', 3, 14000, '1540772EBDA6DC7609C5C7846E5E358D,A004F501EF4AF72016A2B93B90C0FE24,FEFD86B463FFB08363C84378B8EB7356', '1540772EBDA6DC7609C5C7846E5E358D', 'Peter Dj Straw ', '0974983138', 8, 1, 1, 11, '0', 'Lusaka ', 1, 0, '2017-09-21 21:24:57', 0),
(438, 45, 'Fullset ', 'HP B500 FULL SET DESKTOPS 0953253184\n$2,000\nLusaka, Zambia\n500GB HDD\n4gb RAM\n3.2GHz processor\n20" monitor\nFree delivery\nComes with warranty plus free maintainance every 2 months for 4 months from date of purchase.', 2, 2000, '449DBC9F47A38AD587D7E0C5F71F6898,B320C6CCB5A3E886D83A944B0D3B90D8', '449DBC9F47A38AD587D7E0C5F71F6898', 'Siulanji Silungwe ', '0953253184', 9, 1, 1, 11, '0', 'Lusaka ', 1, 0, '2017-09-21 21:27:27', 0),
(439, 45, 'Speaker ', '2kenwood speakers n one roc king speaker + amplifier for sale at k3500negotiable ,,,,,,,call or text on 0975185823', 3, 3500, '40D3C43257FF7399D4963C108B1AF759,490A154C5D356D2B820CEDF516CA1DA0', '40D3C43257FF7399D4963C108B1AF759', 'Joyna Patel ', '0975185823', 12, 1, 1, 11, '0', 'Lusaka ', 1, 0, '2017-09-21 21:30:45', 0),
(440, 45, 'Allex 2004', 'PERFECT CONDITION\n@54pin\n0967891591/0973972244', 1, 54000, '18D5C3C7018B2E7422342A5BA60F0EE2,8A3DEA161DE615D24D9181DF30C021B2,75EE3A1C8D32921BB982BC7DFFABB361', '18D5C3C7018B2E7422342A5BA60F0EE2', 'Bazels wizy', '0973972244', 8, 1, 1, 11, '0', 'Lusaka ', 1, 0, '2017-09-21 21:34:00', 0),
(441, 45, 'Lenovo T520 ', 'Lenovo T520 ThinkPad laptop for sale with 6gb ram,2hrs battery,120gb hard drive,Intel core i7 @2.4ghz processor(8CPU''s)15.6 LED HD screen give me k2000 neg...call or WhatsApp me on 0974452890', 3, 2000, '9E52970EC846E4D1D6F4415C2E1BDA14,F2792090ACF8761DAB56B17AEF386BD3,407A8C98783230460A2826A13DA98D93', '9E52970EC846E4D1D6F4415C2E1BDA14', 'Philip Miyagi ', '0974452890', 9, 1, 1, 11, '0', 'Lusaka ', 1, 0, '2017-09-22 20:38:19', 0),
(442, 45, 'HP450', 'Hp 450\nCore i7-5500U \n15''6 inches Brand new machine \n1TB HDD \n4 Ram \nIntel (R) HD 5500 graphics \nRadeon R5-M255 2gb dedicated GDDR3 graphics \n6hrs battery life \nSuper neat no Scratch\n5500-6000 acceptable \n0975488322', 1, 6000, 'BFAF370666D3F38DE2644ED4F57C2E63,2F0ECEBC28F48C044534F9C98E75A37D', 'BFAF370666D3F38DE2644ED4F57C2E63', 'Joseph Kanfwa', '0975488322', 9, 1, 1, 11, '0', 'Lusaka ', 1, 0, '2017-09-22 20:42:11', 0),
(443, 45, 'Dell Latitude ', 'JUST LANDED\nPREOWNED FROM USA \nK1,199\nDELL LATITUDE 2120\nmini laptops\n**Intel(R) Atom(TM) CPU 1.60GHz\n**10.1" screen \n**RAM:2GB\n**HDD:160GB\n**WebCam,WiFi,SD and SIM card slot\n**Running Windows 10\n**Battery life 3+ hours', 2, 1199, 'BF492B7FD2DCA942FF6FC4AB1ADC0BEF,1AFBC29D6E51A87E374CCA961ABDA157', 'BF492B7FD2DCA942FF6FC4AB1ADC0BEF', 'J.F Nyirenda ', '0977515769', 9, 1, 1, 11, '0', 'Lusaka ', 1, 0, '2017-09-22 20:45:17', 0),
(444, 45, 'Mini Laptop ', 'Â®Hp mini laptops \nÂ®10.1 "\nÂ®160 gb Hard Drive \nÂ®1 gb Ram\nÂ®Excellent battery life\nÂ®3 months warranty.\nK1.350 only\nCall 0971793033', 0, 1350, 'EF7FB73CB11B420604ABB5AAB0D8C068,7F4B2BFA96BD10CCCA9A9F050C9C44B7', 'EF7FB73CB11B420604ABB5AAB0D8C068', 'Mulenga Dwen Joseph', '0971793033', 9, 1, 1, 11, '0', 'Lusaka ', 1, 0, '2017-09-22 21:00:06', 0),
(445, 45, 'Full Set Desktop ', 'Super neat hp desktop with a 20inch monitor, 500gb hard drive, 4gb ram and 3.2GHz processing speed only asking for K1,800 slightly negotiable. Call 0976 375749.', 2, 1800, '5125D4D3154D2CD31FCF91C789922CF9,550CC523E0A2D1295417ECA69D008A05', '5125D4D3154D2CD31FCF91C789922CF9', 'Maxwell Ngenda ', '0976 375749.', 9, 1, 1, 11, '0', 'Lusaka ', 1, 0, '2017-09-22 21:02:21', 0),
(446, 45, 'Laptops ', 'Super neat HP 500gb Hdd,4gb ram,3-4hours battery life @k2100\n- Gaming Workstation Lenovo W541 coi7, 8GB ram,750gb hard disk,2Gb dedicated Nvidia graphics,4hours battery life @k5000\n- Toshiba MIni 95% neat 320gb hdd,2gb ram @ k1300.\nWe are found at Shop N0.5 GEMINI house opposite shoprite cairo road.\nWARRANTY ,DISCOUNTS AND RECEIPTS PROVIDED.\nCONTACT 0976989292 or 0950989292', 2, 0, '7BD90638823E1289071B378B4B6BF93F,4599602087533124FE7DDD6C0F8DCA05,B9BA039D0E14CB49C6586F1902A03DBF', '7BD90638823E1289071B378B4B6BF93F', 'Long Live Marvv ', '0950989292', 9, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-09-22 21:05:44', 0),
(447, 45, 'Acer Apsire ', 'Acer Aspire one mini laptops\n500 gb 4gb ram \n11.6 inch screen \nK1800\nNew state/with power packs \nGood battery life \nCall/WhatsApp 0976704529', 2, 1800, '41B763F1B967FBBCEE4B479C26DD6CB1,CBE321DECDFF03E2EFD9870BDF6CE1B0', '41B763F1B967FBBCEE4B479C26DD6CB1', 'Gibson Phiri', '0976704529', 9, 1, 1, 11, '0', 'Lusaka ', 1, 0, '2017-09-22 21:08:10', 0),
(448, 45, 'HP Pavillion ', 'Hp pavilion 15 touchscreen \n15.6"screen size \n4gb ram \n1TB hard drive \n1.76GHz Intel 7th generation processor \nPrice k4000\nCall 0964820869', 2, 4000, '58271BF83B751F0724ECFF53E7004EB5,BC21A2429E01CB50C71A33E29BD03093,176C5CBD22C944956EA2B7318ED04CA3', '58271BF83B751F0724ECFF53E7004EB5', 'Tech Hack Limited ', '0964820869', 9, 1, 1, 11, '0', 'Lusaka ', 1, 0, '2017-09-22 21:10:35', 0),
(449, 45, 'HP laptop ', 'Neat Metallic HP laptop envy m6\n8GB ram , 1tb hard-drive, intel(R) core(TM) i5 CPU , @2.50GHz , 2 core(s) 4 Logical processor(s). Finger print scanner , no battery. in good condition , works perfectly, with a Power pack. K2800 neg.\nWhatSapp +79006456225 call 0964024419 or in box.', 2, 2800, '79E4348186725F7FDE571A0525EFFDC0,2BA0968B9BA75664F5D3FB8848A765F9', '79E4348186725F7FDE571A0525EFFDC0', 'Hendrix Bwalya ', '0964024419', 9, 1, 1, 11, '0', 'Lusaka ', 1, 0, '2017-09-22 21:13:12', 0),
(450, 45, 'BMW 530i', 'BME 530i...perfect runner...\nNeeds service and upper arms,very good \nFuel consumption, smooth car\nK40,000\n0976779338\nOffer runs until Monday!! 25/09/17', 0, 40000, '048F4F70EF3026B6C9D370577F32CDBF,AF4CB810B40F105C6A7CAE504CCEEE22', '048F4F70EF3026B6C9D370577F32CDBF', 'Li Pime Le', '0976779338', 6, 1, 1, 11, '0', 'Lusaka ', 1, 0, '2017-09-24 20:29:21', 0),
(451, 45, 'Nissan ', 'NISSAN 350 Z FOR SALE. PLEASE CALL FOR MORE INFORMATION. \nCALL: 0966864435\nSERIOUS PEOPLE PLEASE.', 2, 0, '516EFE899DDB30C079D8E29DF6FA2618,3386A3E3B2E5E822DC1C15A6823B6E66,4A42F813BB6429A7D761BCCDC177638D', '516EFE899DDB30C079D8E29DF6FA2618', 'Jess Amarante ', '0966864435', 6, 1, 1, 11, '0', 'Lusaka ', 1, 0, '2017-09-24 20:35:23', 0),
(452, 45, 'Pajero ', 'Very Neat Lady Driven Call 0978028709', 3, 65000, '99CDEA338C14A6996F5A4692B912D099,61BD1239C7C25BEAB25C3B4748CE769C', '99CDEA338C14A6996F5A4692B912D099', 'Kelvin Gerard Mbuzi', '0978028709', 7, 1, 1, 11, '0', 'Lusaka ', 1, 0, '2017-09-24 20:38:17', 0),
(453, 45, 'Toyota Prado', 'oyota prado \nImmaculate condition \nEngine 1kd diesel \n4x4 \nMileage 116.000 \nAsking price k78negotiable \nLocation Lusaka \nCall/whatsapp 0977227590', 3, 78000, '3D71BBEC09E3A1F0856C33F3318CFEE9,3E1987B1316756DE6579362404E56CBA', '3D71BBEC09E3A1F0856C33F3318CFEE9', 'Phiri Ben Ben ', '0977227590', 8, 1, 1, 11, '0', 'Lusaka ', 1, 0, '2017-09-24 20:43:45', 0),
(454, 45, 'Toyota Kluger ', 'Lady driven Toyota Kluger BAF very neat call or what''s on 0979407885 or 0977864666', 3, 55000, '29213A32DCB60CE3540E85828C6FF4B2,E16F8D63393998562F7FD403048892AA,B56FD5A77753204B1165F0660FF330BF', '29213A32DCB60CE3540E85828C6FF4B2', 'Valarie Nzoombe', '0977864666', 7, 1, 1, 11, '0', 'Lusaka ', 1, 0, '2017-09-24 20:45:46', 0),
(455, 45, 'Nissan ', 'Nissan van for sale k28,000... Manual....Engine z16 petrol..1.6 litres....condition good just a replacement of on left leaf..but above all the car moves....call or what''s app 0978655437 ndol', 3, 28000, '1F2CB92743C0F753FD77BBB01C8B0A39,7AD9191C8F16EEBF914768CCD7C496E7,D099FF1A3EA01050D26B80795711F1D9', '1F2CB92743C0F753FD77BBB01C8B0A39', 'Victor Mayundo ', '0978655437', 8, 1, 3, 26, '0', 'Ndola ', 1, 0, '2017-09-24 20:48:07', 0),
(456, 45, 'Vehicle ', 'Both vehicles are runners and negotiable 0978559888\nReduced Canter 65,000 neg\nChamp 30,000 neg', 0, 0, 'F6DDB45FFF2912870EEB87E46B61590F,3264AF0BA05273063228DB498D9A9631', 'F6DDB45FFF2912870EEB87E46B61590F', 'Dora Phiri Mwaanga ', '0978559888', 8, 1, 1, 11, '0', 'lusaka ', 1, 0, '2017-09-24 20:50:40', 0),
(457, 45, 'NIssan MArch ', '23000 negotiable for details call me on 0971772963for more photos give me yr watsapp number', 3, 23000, '99C237447776975A601408DBF0AE936C', '99C237447776975A601408DBF0AE936C', 'Patel', '0971772963', 6, 1, 1, 11, '0', 'Lusaka ', 1, 0, '2017-09-24 20:52:12', 0),
(458, 45, 'Vits ', 'Quick sale Toyota vits going at 28 pin neg location kitwe call 0966999642 pressure free it''s buy and drive mileage 119', 3, 28000, '7CC5379650D2DC8125467346E240020F,C1A35111963E914457016B10A5CF29E9,CC196EEF2DA10A8003691BF790759902', '7CC5379650D2DC8125467346E240020F', 'Benson Banda ', '0966999642', 7, 1, 3, 13, '0', 'Kitwe', 1, 0, '2017-09-24 20:55:22', 0),
(459, 45, 'Spacio ', 'No issues intact as seen buy and drive going at k21,000 negotiable call or watsapp 0971450848', 3, 21000, '980B900A2931BC3B3D144228B03EDAEF,36ABF116F45481BE69F6BFD312C0498B', '980B900A2931BC3B3D144228B03EDAEF', 'Clintwood Bozory ', '0971450848', 8, 1, 3, 27, '0', 'Chingola ', 1, 0, '2017-09-24 20:57:22', 0),
(460, 45, 'Compaq HP', 'Very neat pressure free.\n2gb ram ,100harddrive.\nOffers!!!!\n0961085427', 3, 1000, '25AA033AD1CBB68E7D3914127231B110,33F740354B09C06F792FABBDFCD19635', '25AA033AD1CBB68E7D3914127231B110', 'Jay Smash Yamfwa ', '0961085427', 9, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-09-24 21:34:42', 0),
(461, 45, 'S4 32gb ', 'Drop your cash offers for this neat s4 32gb. Call S4 32gb . Swaps and top ups allowed.', 3, 1000, '7854010AA8CEA1AEEA68F5B0ED61652D,10041362D47FE8D086105E0435497ED4', '7854010AA8CEA1AEEA68F5B0ED61652D', 'Roberts Freeman ', '0978737494', 10, 1, 1, 11, '0', 'Lusaka ', 1, 0, '2017-09-24 21:37:08', 0),
(462, 45, 'Toyota ', 'Price: 13k USD onco\nODO : 67300Km\nYear : 2002\nModel: Alphard\nEngine Capacity : 2400 Petrol\nSeating : 8 persons\nColour: Gold\nContact : Milo @ 0966757590\nCameron @ 0968665499', 2, 130000, '5F8AC3213AAFBB59FAF9A70DA5399135,59B6A7E60837946D51D69743A7476CF0', '5F8AC3213AAFBB59FAF9A70DA5399135', 'Ivana ', '0966757590', 8, 1, 1, 11, '0', 'Lusaka ', 1, 0, '2017-09-24 21:39:32', 0),
(463, 45, 'Acer Laptop ', 'Ascer laptop. See details in the pictures. Used by a lady mint neat as seen. WhatsApp 0961021192 or call 0979497360. Negotiable', 3, 2100, '0ABE69AC30407D699CFF3AE692FA4BE0,42003F660B9B290CF3FD7C466CDFEA17', '0ABE69AC30407D699CFF3AE692FA4BE0', 'Liso Mifaya ', '0979497360', 9, 1, 1, 11, '0', 'Lusaka', 3, 0, '2017-09-24 21:41:50', 0),
(464, 45, 'Toyota ', 'Toyota E100 for sale\nPressure free\nBuy and drive\nIf interested call 0953242403', 3, 0, '67C279173FB316641306DF816D1E8105,264DC6B4CE763FA863168C807717AD8D', '67C279173FB316641306DF816D1E8105', 'Melvin Mutale', '0953242403', 6, 1, 1, 11, '0', 'Lusaka ', 1, 0, '2017-09-24 21:44:03', 0),
(465, 60, 'hahaha', 'hahahahahahahahahaha', 1, 0, '', '', 'Eureks', '0945612345', 22, 1, 1, 11, '0', 'hahaha', 3, 1, '2017-09-26 05:40:49', 1),
(466, 45, 'HP probook ', 'HP probook4530s Intel i5, ram4GB, 500GB, 6hours battr, 98%nit@2600. call/watsapp 0976784506', 3, 2600, '28AB2EAFAB34E0EC2BDD25F5C557708F,50FC1F8D9080657C83B53C65A59D635D', '28AB2EAFAB34E0EC2BDD25F5C557708F', 'Wale Slata', ' 0976784506', 9, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-09-29 09:12:49', 0),
(467, 45, 'Tab', 'K100 last, cash only \nMerlin android tablet \n9.7 inches \n1gb ram \n8gb internal memory \nDual sim \n**touch needs to be replaced, not working ** \nlusaka, woodlands \n0973770907', 3, 100, '0D914D1A50C3D448AF9DDEC6EE42B300,648F10EC30448D7EC72CEA08F271B88E', '0D914D1A50C3D448AF9DDEC6EE42B300', 'malumbo Siwale', '0973770907', 9, 1, 1, 11, '0', 'lusaka', 1, 0, '2017-09-29 09:13:50', 0),
(468, 45, 'J7', 'Samsung j7 \n16GB + 16GB micro SD\nK1300\n.0977577070', 3, 1300, '2E3967AF5C56D03D7DD7C8C19DDDB5E1,1231F0C0337446A834C25D2046C0CF0E', '2E3967AF5C56D03D7DD7C8C19DDDB5E1', 'Kenny nkonde', '.0977577070', 10, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-09-29 09:14:48', 0),
(469, 45, 'Desktop ', 'HP FULL SET DESKTOPS\n*3.2Ghz processor\n*500GB HHD, 4GB ram \n*wireless card installed \n*20inch monitor HD Graphics \nK1,800\nCall 0976 375749/whatApp 0964780925', 3, 1800, 'FE9B67C7A953487623913C107DB34C5B,BA4908D972A1FAEBBEC19BD012FB2260', 'FE9B67C7A953487623913C107DB34C5B', 'Maxwell Ngenda ', '0964780925', 9, 1, 1, 11, '0', 'lusaka', 1, 0, '2017-09-29 09:17:29', 0),
(470, 45, 'Laptop', '1TB hard drive\nCore i7\n12GB RAM #0975230594 -k6000', 2, 6000, '45796E5699B00A04D7EC0DBB9EBD7B90,63730B1403C2FC8DCFF7CB67812E34FE', '45796E5699B00A04D7EC0DBB9EBD7B90', 'Remy Rey', '0975230594', 9, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-09-29 09:18:25', 0),
(471, 45, 'lAPTOP ', 'Hp 15\n15.6"screen size \nIntel(R)2.16GHz\n4gb ram \n500gb ram \nPrice k3000\nCall 0964820869 for inquiries\nHp pavilion new edition \n14"screen size \n4gb ram\n500gb hard drive \nIntel(R)1.60GHz 7th generation processor \nGood battery life \nPrice k3300\nHp probook 450\n15.6"screen size \n4gb ram \n500gb hard drive \n1.80GHz core i3 5th generation processor \nPrice k3500\nHp pavilion touchsmart \n15.6"screen size \n8gb ram \n1TB hard drive \n1.90GHz Intel premium 7th generation \nGood battery life \nPrice k4000\nCall 0964820869', 2, 0, 'D83D06CD25E307B32D4B691332348415,B198E76F179DEC8A8692EC8FA7C2BE56', 'D83D06CD25E307B32D4B691332348415', 'Benjamine Nkodowe', '0964820869', 9, 1, 1, 11, '0', 'lUSAKA', 1, 0, '2017-09-29 09:20:17', 0);
INSERT INTO `info_gg_publist` (`id`, `uid`, `title`, `details`, `goodstatus`, `price`, `imgs`, `cimg`, `contactname`, `phone`, `cid`, `issell`, `addr_l1`, `addr_l2`, `addr_l3`, `addr_l4`, `views`, `wishs`, `pubtime`, `status`) VALUES
(472, 45, 'Desktop', 'For sale brand new & second hand laptops duo core,core 2duo,core i3,i5,i7,desktops duo core,core 2duo,core i3,i5.power packs all brands,laptop batteries all brands,laptop replacement screens all sizes,software installation"anti virus, Projectors..........swap and top ups are welcome but they have to be seen first, We do send parcels using EMS or by BUS at a small fee .............we are located in morton house along nkwazi road room 17.........for quick response please call 0977841746, 0966351316 or 0950233608', 3, 0, '5825E2B2C594CE0D730DBC6A3A1A8046,FA81860F5DBF402EA51AA5B3CCAC4B23', '5825E2B2C594CE0D730DBC6A3A1A8046', 'muyaba', '0950233608', 9, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-09-29 09:21:24', 0),
(473, 45, 'printer', 'lsk almost new industrial photocopying machine ir2000 going at k3200\ncall or text me on 0973794983', 3, 3200, 'C46F5498D79DA9868E5DB88BDB08F7DF,20E9732679554932993526A2A1B94FA6', 'C46F5498D79DA9868E5DB88BDB08F7DF', 'Wale KArnix', '0973794983', 12, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-09-29 09:23:49', 0),
(474, 45, 'HP 2000', 'Hp 2000\nIntel processor \n4gbram\n320HDD\n3hours battery ðŸ”‹ \nPrice :K1850\nCall or wats app 0954888885 or 0979444212', 3, 1850, '48E1044233102ABA233CA50377DFA1C4,7803208AAFDE97FFB6BDC2CED314DACD', '48E1044233102ABA233CA50377DFA1C4', 'Edmond Abdulla ', '0979444212', 9, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-09-29 09:25:52', 0),
(475, 45, 'Laptops ', 'Acer Aspire one mini Dell inspiron mini\n1gb ram 1gb ram\n10.1"screen size 10.1"screen size \n160gb hard drive 160gb hard drives \n1.60Ghz Intel atom 1.66Ghz Intel atom \nPrice k1200. Price k1200\nHp pavilion mini \n10.1"screen size \n2gb ram \n160gb hard drive \n1.60Ghz Intel atom\nCall 0964820869/WhatsApp', 2, 0, 'E4008389264D0AB5AA4BC7783BEB1C4B,B70A2B4EB6BEA397B41C6176D3CEEF9A', 'E4008389264D0AB5AA4BC7783BEB1C4B', 'Benjamin Khodowe ', '0964820869', 9, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-09-29 09:29:11', 0),
(476, 45, 'Samsung ', 'Original Samsung LED 32inch\n$190\nLusaka\nNeat as seen...0976008931', 3, 1900, 'E437716879D4E23CDAE2BB0292138C9D,CEB20B32575A4A053A1D33DE3858FB6F', 'E437716879D4E23CDAE2BB0292138C9D', 'Oliver Glory Mbwata', '0976008931', 12, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-09-30 00:47:05', 0),
(477, 45, 'BB Z10', 'Ear piece pressure but 100% neat with no other presure \n16gb inbelt\n2gb ram\nWhite covers\nK550\nCash money only\n0975349144', 2, 550, '4F2846F7CC37296BA99FD1A0F880F181,81A317B3582B77FA3A00376E79E47395', '4F2846F7CC37296BA99FD1A0F880F181', 'AJ Ranks Dante', '0975349144', 10, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-09-30 00:49:47', 0),
(478, 45, 'Infinix Hot 4', 'Infinix hot4\nK900\nNeat as seen \n0975627188', 3, 900, 'B8D688A0F52DA4A6C7FABB175CDE5CBE,2D6B115636D21BF07A1E804A077C365D', 'B8D688A0F52DA4A6C7FABB175CDE5CBE', 'George Busani ', '0975627188', 10, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-09-30 00:55:49', 0),
(479, 45, 'Hp Laptop ', 'NEAT HP 620 LAPTOP @K2,000 Neg\n320GB Hard Drive \n2GB Ram \nDual Core 1.80Ghz Processor \n3hrsBattery Life \nHD Webcam \n3.0 USB Ports \nBluetooth \nHDMI & VGA PORT\nDVD Writer \nCALL/WHATSAPP 0979554587', 2, 2000, '7269EB4A9BA932F6C6B85F96613472AB,54A36E7CA8D5345609976CA29E7D8F0A', '7269EB4A9BA932F6C6B85F96613472AB', 'Francis Mwansa Zakeyo', '0979554587', 9, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-09-30 00:59:59', 0),
(480, 45, 'Toyota Auris', 'For sale Toyota Auris mileage 56000 price 57 is very good condition call 0971692837', 2, 57000, '3FB93CFDB90A99745C6F853972E73403,179F307006620D92935E34BF2CCD50AA', '3FB93CFDB90A99745C6F853972E73403', 'Ustad Irfan', '0971692837', 6, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-09-30 01:03:19', 0),
(481, 45, 'BMW x3', 'Pressure free negotiable call me on 0975278228', 2, 85000, '093F679E0D38451D81FF9D339170521D,7D9CA24E8E2836FDC32AB3AF546AF51C', '093F679E0D38451D81FF9D339170521D', 'Emmy James Shitumba ', '0975278228', 7, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-09-30 01:09:00', 0),
(482, 45, 'HP probook', 'HP Probook 4425s Laptop, CPU - AMD Athlon II P320 @ 2.1 GHz, RAM - 2 GB, Hard Drive - 320 GB Western Digital, Windows 7, AC Adapter included. 14" screen.Serious buyers call or WhatsApp on 0963941313. No time wasters', 2, 2000, '1A54F182D7504552CB4FC1F08E8C78BC,461B043D6A095DFA22359A9D0700017E', '1A54F182D7504552CB4FC1F08E8C78BC', 'peter mumanga', '0963941313', 9, 1, 1, 11, '0', 'lusaka', 2, 0, '2017-09-30 22:12:34', 0),
(483, 45, 'BMW', 'BMW 320d.. call me 0971755728', 3, 0, '93B9986F3CA894D25D671BA62A995A72', '93B9986F3CA894D25D671BA62A995A72', 'Joshua Chisanga ', '0971755728', 6, 1, 1, 11, '0', 'lusaka', 2, 0, '2017-09-30 22:18:23', 0),
(484, 45, 'RUNX ALLEX', 'TOYOTA RUNNEX K50,AND K40.ALSO K35.WHATSAPP 0973886118', 3, 0, '615178BD5A083CF601B5C8326391FED7,1D3BB349AA8A6525B4B8E6DEB3D58C90', '615178BD5A083CF601B5C8326391FED7', 'Phil Mazuba ', '0973886118', 7, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-09-30 22:21:50', 0),
(485, 45, 'Honda CRV', 'Honda crv k21000 negotiable call 0977247497 lusaka', 3, 21000, '9ADBCE2B62E3C9A2AE878A29657D979B,6A755FBB420E14BE35A2A521D146871B', '9ADBCE2B62E3C9A2AE878A29657D979B', 'Villy Mumba', '0977247497', 7, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-09-30 22:27:24', 0),
(486, 45, 'Range Rover', '2008 RANGE ROVER FOR SALE - PRICE K230,000', 0, 230000, 'FC3CAD411610AE2DA169A4C822CEA17F,C84CD3EE5A2BF7E62B558B6A7C5BFF2E', 'FC3CAD411610AE2DA169A4C822CEA17F', 'Kasweka Mutonga', '0975762279', 7, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-09-30 22:29:54', 0),
(487, 45, 'Samsung J3', 'Neat galaxy j3 2016 pressure free up for grabs goin at only k950 neg but cash only available +26 0965194025 ', 3, 950, '42C9B5711D7876CD809D5C26B1C9FDD1,816A2FEA84D26400483F42C2EEC44B49', '42C9B5711D7876CD809D5C26B1C9FDD1', 'Ellie Kays Phirris', '0965194025', 10, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-10-02 20:12:52', 0),
(488, 45, 'Toyota Allex', 'Super neat allex for sale kr43000 neg call 095028020', 3, 43000, '7AA617B9BEED9ECB445C31F91C12D12C,9A7BDB08DCAA9C127C33ABAA5A69DDD4,A3B619C4387791227E51B40499523E1E', '7AA617B9BEED9ECB445C31F91C12D12C', 'Castelanno Sichalwe ', '095028020', 8, 1, 3, 13, '0', 'Kitwe', 1, 0, '2017-10-02 20:14:52', 0),
(489, 45, 'Huawei Y5', 'HUAWEI Y5 16GB INBELT 2GB RAM GOIN AT K800 NIGO CALL +260 97 4885733 AM IN TOWN\n', 3, 800, '4B2881D810CADCEC3AABD4C66B9DA20F', '4B2881D810CADCEC3AABD4C66B9DA20F', 'Jay Macha Moose', '260 97 4885733 ', 10, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-10-02 20:17:49', 0),
(490, 45, 'Honda Inspire', 'Great opportunity to all our clients out there.\nPay 50% for this HONDA INSPIRE, and finish the balance in installments.\nPrice: k80,000 (hire purchase)\n: K65,000 neg (for cash)\nMake: Honda INSPIRE\nYear model: 2003\nMileage: 63000km\nTransmission: automatic\nReg: BAE\nWhatsapp: 0972439418\nCall/text: 0955745767 / 0966423174\nEmail: frexcarslimited@gmail.com\nVisit our office at publicity house in kabelenga road opposite Bank of china. Frex Car LTD\n', 1, 0, 'AC22C0DB64B68BF2A96435198D1D187D,8B0A34D1145AE3A3480FF70752E36D36', 'AC22C0DB64B68BF2A96435198D1D187D', 'FRex Motors ', '0966423174', 7, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-10-02 20:20:34', 0),
(491, 45, 'Rav 4', '$55,000\nLusaka, Zambia\nContact :+260969468985.\nSerious people only\n', 3, 55000, '6313E7C4795EA1B9EDBEFD5367153A52,C7BA13924717B819A84AD58DB4666F09', '6313E7C4795EA1B9EDBEFD5367153A52', 'David Kyu Chella ', '260969468985.', 6, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-10-02 20:22:36', 0),
(492, 45, 'Galaxy Core Prime ', 'Neat galaxy core prime \nWith 8GB inbuilt\n5.1.2 ad version\nWith a very strong battery comes wit a pouch only a ka line on the corner of glass protector affect none...goin at only k750 neg available 0975498825\n', 3, 750, '45748E63370159E2A74DE53DCD169AC4,1FAA490D8C7E89F1CB13C4FB9B9D3FA4', '45748E63370159E2A74DE53DCD169AC4', 'Ellie Kays ', '0975498825', 10, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-10-02 20:24:47', 0),
(493, 45, 'Sharp Laptop ', 'Sharp laptop up for grabs needs battery replacement 120gb harddrive, 1gb ram, comes with a power pack give me k950 only ...0972581649', 3, 950, 'D7D9DED7FBA58D40A51C346C9093565C,EC1FE19272856D018B27770804A51490', 'D7D9DED7FBA58D40A51C346C9093565C', 'Bwalya Dominic', '0972581649', 9, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-10-02 20:26:26', 0),
(494, 45, 'CAr ', 'Good to go buy and disappear call 0953284178', 3, 0, '8CB9EF0A34C557747ED459EBF42B2010,5BE927F50231503AAD05B8FCB6E7911B', '8CB9EF0A34C557747ED459EBF42B2010', 'Leo L Ziko ', '0953284178', 6, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-10-02 20:28:28', 0),
(495, 45, 'Honda CR', 'Very neat honda crv 78mileage going at k36neg call/watsap 0966284848', 3, 36000, '4B5FC259774E983B55F735500F4F43B7', '4B5FC259774E983B55F735500F4F43B7', 'Maron Conttra Safalnga ', '0966284848', 7, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-10-02 20:31:13', 0),
(496, 45, 'Car ', 'Buy n drive k19000\n$1,900\nSmart Business Centre\nCall 0978868767 / 0950818235\n', 3, 19000, '743D3216D4C6E2B52F9E7F10C864A4E0,3F1FEDD096061686BC5C2670F54895FD', '743D3216D4C6E2B52F9E7F10C864A4E0', ' Chikata Mubobo ', '0950818235', 6, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-10-02 21:24:15', 0),
(497, 45, 'Honda fit', 'Honda fit\nMileage: 160,000\nModel: 2004\nPrice: 25000\nLocation: Olympia, Lusaka.\nCall or whatsapp: 0979609798 or 0953216481', 3, 25000, '2E3E078ADB9CEBED13021590A46EE1C0', '2E3E078ADB9CEBED13021590A46EE1C0', 'mulachi mirriam ', '0953216481', 7, 1, 1, 11, '0', 'lusaka', 2, 0, '2017-10-02 21:28:24', 0),
(498, 45, 'Toyota Runx', 'Mileage 79000km\nWith DVD player\nGood music system \nPrice k45 negotiable.\nApp/call0976164998\n', 3, 45000, '55B5CE19EF0ED7FC9EAF37560403B6C0,5429D7CA1D72CB31CF74130DF661B3F8', '55B5CE19EF0ED7FC9EAF37560403B6C0', 'Alfred Alpacino Jnr', '0976164998', 7, 1, 1, 11, '0', 'Luska', 2, 0, '2017-10-02 21:30:07', 0),
(499, 45, 'Toyota Spacio', 'Spacio for sale\nMileage....160\nCc...........1.8\nEngine type. ...4a\nPrice........28 pin negotiable \nFor more details call me on 0960828969 or 0976316234\n', 3, 28000, '5C046C3E75AACF8378782AD64BC2A9A2', '5C046C3E75AACF8378782AD64BC2A9A2', 'Laston Kapwi', '0976316234', 7, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-10-02 21:31:25', 0),
(500, 45, 'Hiace ', 'Toyota Hiace Prestine condition with a 1kd engine...K135,000 negotiable....contact 0977201014 for details....viewing can be arranged', 3, 135000, 'C4837DA6BE1A03FE05534A0573A1ABBE,7262AD653FAE60ECADAA2C0E3652B602', 'C4837DA6BE1A03FE05534A0573A1ABBE', 'Chilufya Wanchinga ', '0977201014', 8, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-10-02 21:32:52', 0),
(501, 45, 'Toyota Harrier', 'Buy and drive everything intact\nEngine & suspension intact\nEngine: 1mz\nMileage: 105\n3cc\nK38 000 negotiable\nCall 0973317399\nLusaka\n', 3, 38000, '31D87B6ECF9D742D2957C7D9BDD04625,77DB46E041AF3B4C2B4899C8E43B2FB8', '31D87B6ECF9D742D2957C7D9BDD04625', 'hombola Lawrence', '0973317399', 7, 1, 1, 11, '0', 'Lusaka', 2, 0, '2017-10-02 21:34:33', 0),
(502, 45, 'Laptop', 'ACER LAPTOP INTEL CORE LAPTOP \n350GB HDD \n4GB RAM \n15.6 INCH SCREEN \nCALL/WHATSAPP :0963614761\nAM IN KITWE\nK2500 NEGOTIABLE\n', 0, 2500, '9CCCC8ECA8781872008643B366AAD908', '9CCCC8ECA8781872008643B366AAD908', 'Nas Napoleon ', '0963614761', 9, 1, 3, 13, '0', 'Kitwe', 3, 0, '2017-10-02 21:36:23', 0),
(503, 45, 'Furniture', 'Reduced to go from k3200 to k2900 call me 0979774955', 0, 3200, 'C8B840CE14347253DC92ECB34B496DFF,1058AE3ECC5E0953B79A55650D6E2648', 'C8B840CE14347253DC92ECB34B496DFF', 'Nancy Jenkins', '0979774955', 18, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-10-04 20:08:58', 0),
(504, 45, 'Sound System', 'Offer 0973655022', 2, 0, 'F79BB980D3DD1923CD4CD4AD3B689E63', 'F79BB980D3DD1923CD4CD4AD3B689E63', 'Bevin Shiwanga', '0973655022', 19, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-10-04 20:10:46', 0),
(505, 45, 'Furniture', 'Call, text or WhatsApp us on 0975068314 pr 0974097191 we are situated in Mandevu near the police post K3800', 0, 3800, 'FF88F042E05D829D36BB979671AE3A29,DDE4167F878EF6C73B9CED38967C4A57', 'FF88F042E05D829D36BB979671AE3A29', 'Emma Nuels', '0974097191', 18, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-10-04 20:13:02', 0),
(506, 45, 'Hisense TV', 'Auction sales my client leaving the country\nHisence tv 32" k1600\n\nCall 0972752338', 3, 1600, 'DEF7ED5A391F6D11E8862002FCF56A95', 'DEF7ED5A391F6D11E8862002FCF56A95', 'Glam Furniture', '0972752338', 19, 0, 1, 11, '0', 'Lusaka', 1, 0, '2017-10-04 20:17:22', 0),
(507, 45, 'Dining Table', 'Auction sales my client leaving the country\n\nDining table 4chairs k1800\n\nCall 0972752338', 3, 1800, 'F890638035BE564F63FA36A12B3FD729', 'F890638035BE564F63FA36A12B3FD729', 'Glam Furniture', '0972752338', 19, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-10-04 20:18:57', 0),
(508, 45, 'Double Bed ', 'Double bed with matters k1000\n', 3, 1000, 'AEAAA1FB6417DB761969F699DDA7515F', 'AEAAA1FB6417DB761969F699DDA7515F', 'Glam Furniture', '0972752338', 19, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-10-04 20:20:09', 0),
(509, 45, 'Glass Table ', 'Glass table k350\n', 3, 350, 'CD6BC1985BF374509A1E37BAB04C80FA', 'CD6BC1985BF374509A1E37BAB04C80FA', 'Glam Furniture', '0972752338', 33, 1, 1, 11, '0', 'lusaka', 1, 0, '2017-10-04 20:21:23', 0),
(510, 45, 'furniture', 'Sofa k2700\n', 3, 2700, 'CDE1011032C4E1A16BE9D374420F1E4D', 'CDE1011032C4E1A16BE9D374420F1E4D', 'Glam Furniture', '0972752338', 18, 1, 1, 11, '0', 'lusaka', 1, 0, '2017-10-04 20:23:20', 0),
(511, 45, 'Dstv Decoder', 'Dstv unregistered k250\n', 0, 250, '641950ED3B7BA6C20B162624E911EEB3,04B290E6ECE0117866E2387DDB1462E8', '641950ED3B7BA6C20B162624E911EEB3', 'Glam Furniture', '0972752338', 19, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-10-04 20:24:47', 0),
(512, 45, 'Frdige', 'Fridge k1600\n', 0, 1600, 'DCD0C7C3876D61657C1B78303C99B5AC', 'DCD0C7C3876D61657C1B78303C99B5AC', 'Glam Furniture', '0972752338', 33, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-10-04 20:26:11', 0),
(513, 45, 'Stove', 'Stove k2000', 3, 2000, '9C8F1A68DC4A6CC190F3991011F8B681,842BAFAEC0C84E35941ED64314687837', '9C8F1A68DC4A6CC190F3991011F8B681', 'Glam Furniture', '0972752338', 33, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-10-04 20:27:05', 0),
(514, 45, 'SOny Monoblock', 'SONY VAIO ALL IN ONE PC\n500GB HDD\n2GB RAM\n2.0 GHZ PROCESSOR\n512 MB NVIDIA DEDICATED\n21" SCREEN\n5 USB PORTS\nComes with original box\nPressure and police free\nCall or inbox 0976777851', 3, 0, '0EE1739D6949159D4894B9D1FB3D452A', '0EE1739D6949159D4894B9D1FB3D452A', 'Genesis Corp', '0976777851', 9, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-10-04 22:58:40', 0),
(515, 45, 'Acer Laptop', 'ultra slim accer laptop,300gb HD,very neat 5hrs battery going at k1600 negotiable......call/whatsapp 0979611322', 3, 1600, 'F64C3E3852D0CC009C33750EB294C101', 'F64C3E3852D0CC009C33750EB294C101', 'Mr b Bassline Bwalya', '0979611322', 9, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-10-04 23:03:00', 0),
(516, 45, 'Dell Laptop', 'Dell Inspiron 3537 slim\nIntel(R)celeron(R) 1.80GHz\n64-bit OS\n500GB\n4GB\nBattery 5-hours...0977577070', 3, 0, '553F7E5D952D4B835D68E7983241D04F', '553F7E5D952D4B835D68E7983241D04F', 'Kenny Kane Nkonde', '0977577070', 9, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-10-04 23:04:22', 0),
(517, 45, 'Samsung Laptops', 'Samsung Medium Laptops, K1350 Each. Receipt and Warranty Inclusive.\n1GB Ram/160GB Hard Drive, 3 Hours Plus Battery Life.\nNote: Specs are upgradable at extra charge.\nCall, Inbox, Text or Call +260976690900/0968262667 for serious business.', 2, 1350, '4CE64722537A7322E40C2CC46E5AA74D', '4CE64722537A7322E40C2CC46E5AA74D', 'Reuben Banda', '0968262667 ', 9, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-10-04 23:05:50', 0),
(518, 45, 'Sony Vaio', 'High quality laptop....Sony laptop\nK750\n80gb hard drive + 1gb ram\nIntel centrino processor 2GHz\nGraphic by nividia\nBattery holds.......screen size 13.3 with 2 black spots on it but u can see call 0955318963', 0, 750, 'C2B38CBBC5A0237958C50AC9146022A9,E5152E3B3C5A721949D26B165460C699', 'C2B38CBBC5A0237958C50AC9146022A9', 'Sibongile Miti', '0955318963', 9, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-10-04 23:07:46', 0),
(519, 45, 'Toshiba Satellite', 'iPhone 5 \nK1300 very Negotiable swaps accepted\n3 cracks, barely visible, not on screen\n16gb \nStrong battery \n**earpiece volume low but comes with earphones**\n2m data cable\nGlass protector \nPouch \n0973770907\nWoodlands, Lusaka', 2, 0, '', '', 'Malumbo Siwale', '0973770907', 9, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-10-04 23:12:17', 0),
(520, 45, 'Acer Mini', 'Acer mini laptops 1gb ram n 160/250 for sale at k1200...0966315479', 0, 1200, 'D41E12AC4A0079F6691D826590089FD5', 'D41E12AC4A0079F6691D826590089FD5', 'Michael Mwape', '0966315479', 9, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-10-04 23:14:05', 0),
(521, 45, 'Tecno C9', 'Tecno C9 very neat 100.5%\n32GB inbelt \n3GB ram \n6.0.1 version \nK1200\nMy line 0971709013', 3, 1200, '7393A178B4F93F72F9C79D394E30278B,929626284E92CD57F873FB1073D77B87', '7393A178B4F93F72F9C79D394E30278B', 'Jackson Mwansa ', '0971709013', 10, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-10-05 00:15:33', 0),
(522, 45, 'Galaxy S7', '100% neat Samsung galaxy S7edge up for grabs..call me on 0972029068', 3, 0, 'F1DAF07F34B4FBF120606F92E514F356,8272018AE9C639B2E8F3C0C6C57B5C80', 'F1DAF07F34B4FBF120606F92E514F356', 'Muzo Muzo', '0972029068', 10, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-10-05 00:21:38', 0),
(523, 45, 'Iphone 6', '16gb inbuilt. Strong battery, pressure free. K2600. Call or text 0977100767', 3, 2600, '57CDC2C2C2018324FA70BB4DB27DFCD9', '57CDC2C2C2018324FA70BB4DB27DFCD9', 'Goodison Chanda ', '0977100767', 10, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-10-05 00:25:23', 0),
(524, 45, 'iphone 6', 'iPhone 6\n90% neat \n16GB\nGoing at 2800\nCash offers only \nCall or text 0974185999', 3, 2800, '548ED67A0E696BC6459CD4E3EBD04EBC', '548ED67A0E696BC6459CD4E3EBD04EBC', 'Ben Flicker', '0974185999', 10, 1, 1, 11, '0', 'lusaka', 1, 0, '2017-10-05 00:31:52', 0),
(525, 45, 'Sony Hifi System', 'FOR MUSIC LOVERS\nSONY HIFI SYSTEM(model number HCD-GZX550)\nRMS 1600watts PMPO 17600watts\nBLUETOOTH meaning you can play music via your phone\n2USB,1CD LOADER\nK3300 VERY NEGOTIABLE\nCONTACT: +260969608328 Lusaka', 3, 3300, '85963B4C9798E3509318FDD848BBDF9B', '85963B4C9798E3509318FDD848BBDF9B', 'Hector Banda ', '260969608328 ', 12, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-10-05 00:45:42', 0),
(526, 45, 's5', 'Neat s5 k1100 call 0974265893', 3, 1100, '8CBE7983F8002030986A3158FEA62BB9,E38C7CE21B4630AF21A6BF85A6364D2B', '8CBE7983F8002030986A3158FEA62BB9', '0960509422', '0960509422', 10, 1, 1, 11, '0', 'lusaka', 1, 0, '2017-10-05 00:57:16', 0),
(527, 45, 'Hp 450 Laptop ', 'HP 450\n4GB Ram\n640GB Hdd\nIntel core i3 Processor @ 2.4GHZ\nFINGER PRINT Scanner, HD webcam\nHDMI Port, USB Port, CD-DVD Optical Drive\n4 Hours Battery\nCALL/TEXT/WHATSAPP/\n0965876248', 1, 3800, '3C96A6FEB80BFE60441D644783378A82,7E33331738B6BF0CDAA738279FC890CC', '3C96A6FEB80BFE60441D644783378A82', 'Timmy Bulaya', '0965876248', 9, 1, 1, 11, '0', 'Lusaka', 1, 0, '2017-10-05 23:41:31', 0),
(528, 45, 'tablet', 'TABLET A730 for sale k600 negotiable swap neat we 0975829358', 0, 600, '5E4D9388B3B3CCD0EAF060A3999CC66A', '5E4D9388B3B3CCD0EAF060A3999CC66A', 'galogi kasi', '0975829358', 9, 1, 1, 11, '0', 'lusaka', 1, 0, '2017-10-05 23:48:12', 0),
(529, 45, 'samsung s6', 'Cash going for k2000.\nCall or whatsapp 0978498765', 0, 2000, '8D4D200787E2093E5CF12971DFB8F841,24E4CE7699D7DB10ECAA35F4E201F9EB', '8D4D200787E2093E5CF12971DFB8F841', 'portipher', '0978498765', 10, 1, 1, 11, '0', 'lusaka', 1, 0, '2017-10-05 23:50:30', 0),
(530, 45, 'Samsung  32', '\nNeat Samsung 32" led tv up for grabs lsk all on 0976276465', 2, 0, '4BE5D251AD7E42E5507AE063B33EDACB', '4BE5D251AD7E42E5507AE063B33EDACB', 'sage nyirongo', '0976276465', 12, 1, 1, 11, '0', 'lusaka', 1, 0, '2017-10-05 23:55:11', 0);

-- --------------------------------------------------------

--
-- Table structure for table `info_gg_publist_ext`
--

CREATE TABLE IF NOT EXISTS `info_gg_publist_ext` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL COMMENT 'pid, info_gg_publist中的ID',
  `comments` varchar(32) NOT NULL COMMENT '评论信息文件保存位置',
  `wishs` varchar(32) NOT NULL COMMENT '收藏信息文件保存位置',
  `ups` varchar(32) NOT NULL COMMENT '点赞信息文件保存位置',
  `downs` varchar(32) NOT NULL COMMENT '鄙视信息文件信息',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `info_gg_recommend_logo`
--

CREATE TABLE IF NOT EXISTS `info_gg_recommend_logo` (
  `id` int(11) NOT NULL,
  `imgid` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `id_2` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `info_gg_recommend_logo`
--

INSERT INTO `info_gg_recommend_logo` (`id`, `imgid`) VALUES
(1, '30432D27576A3E65157035937711FCE8'),
(2, '714A73E185C873D689579757D907DDA1'),
(3, 'D03012882E05003AF147295DAE04409D'),
(4, 'F56B339501BC072B4D015F7471299194'),
(5, '61070F8C0A947C133B6346DCEFC5BF32'),
(6, 'E690543C8DE2C143D4B80D1D9F49DCF1'),
(7, 'EC414BDB71637B00D3E46FB4CC9A4EB2'),
(8, '1AA67665F85A02254E9BC38F3D967A07'),
(9, '3545DA3BF0BE4FC754DA7081074CA80F'),
(10, '7B6CB06F40B4F11435A09AF2CD54569B'),
(11, '9BDEB06D5AD48C3D6A788D5E72EEA6B9'),
(12, '4C0014D3FB2ECC3FC77C3E6039EBB28F'),
(13, '00C15B94248C9B78DAAE177E16488665'),
(14, '769A23340D21021F00B90E856A28B34E'),
(15, '4519BF1C64C4AB49C21123C26ADB2E1C'),
(16, '74A757F3C28E3428862700FAF0C895D0');

-- --------------------------------------------------------

--
-- Table structure for table `info_gg_tipoff`
--

CREATE TABLE IF NOT EXISTS `info_gg_tipoff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户ID,为0表示匿名',
  `content` text NOT NULL COMMENT '举报描述',
  `goodid` int(11) NOT NULL COMMENT '举报的商品ID',
  `phonenumber` varchar(32) NOT NULL COMMENT '联系电话',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL COMMENT '该举报所处的状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `info_gg_tipoff`
--

INSERT INTO `info_gg_tipoff` (`id`, `uid`, `content`, `goodid`, `phonenumber`, `time`, `status`) VALUES
(1, 46, 'å°±æ˜¯å¤§ç‰›æ•¦ä¼¦å°½åˆ†çš„ä¹è§†å¼€å‘', 153, '0951248752', '2017-08-28 02:13:43', 0),
(2, 50, '524213468456', 153, '0965478952', '2017-08-30 01:24:32', 0),
(3, 0, 'nfifihsjkfoodncjhhfn', 10, '0945612345', '2017-09-26 05:38:35', 0);

-- --------------------------------------------------------

--
-- Table structure for table `info_gg_toptips`
--

CREATE TABLE IF NOT EXISTS `info_gg_toptips` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(256) NOT NULL,
  `duration` int(11) NOT NULL COMMENT '单位秒',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `info_gg_toptips`
--

INSERT INTO `info_gg_toptips` (`id`, `content`, `duration`) VALUES
(5, 'All transactions will be done in person by the seller and buyer inclusive of the quality of goods. no money transactions will be done on our website.', 300),
(3, 'Welcome to kalichimall, you can sell or buy second hand items & New items on our website hope ypu have a very wonderful experience', 300),
(4, 'Kindly forward any suggestions or website issues to kalichimall administration kalichimall@gmaill.com', 300);

-- --------------------------------------------------------

--
-- Table structure for table `info_gg_users`
--

CREATE TABLE IF NOT EXISTS `info_gg_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `nickname` varchar(64) NOT NULL COMMENT '昵称',
  `sex` int(11) NOT NULL COMMENT '性别，0未设置，1男，2女',
  `logo` varchar(32) NOT NULL DEFAULT '5D4F97F160A824A15B7B4E63F95AAEFD' COMMENT '头像',
  `pass` varchar(16) NOT NULL COMMENT '用户密码',
  `phone` varchar(32) NOT NULL COMMENT '联系方式',
  `username` varchar(32) NOT NULL COMMENT '用户名',
  `reg` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '注册时间',
  `last` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最近登录时间',
  `salt` varchar(8) NOT NULL COMMENT '每个用户一个独一无二的盐，加密用户id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=62 ;

--
-- Dumping data for table `info_gg_users`
--

INSERT INTO `info_gg_users` (`id`, `nickname`, `sex`, `logo`, `pass`, `phone`, `username`, `reg`, `last`, `salt`) VALUES
(38, 'Kevin', 0, '74A757F3C28E3428862700FAF0C895D0', 'Guowei123@', '0965207939', '0965207939', '2017-08-04 07:58:33', '0000-00-00 00:00:00', 'ffa624'),
(39, 'Zuse', 1, '9BDEB06D5AD48C3D6A788D5E72EEA6B9', 'Bwalya@87', '0967956596', '0967956596', '2017-08-04 18:44:10', '0000-00-00 00:00:00', '1d0ef1'),
(0, 'anonymous', 0, '', '', 'null', '', '2017-07-09 07:32:39', '0000-00-00 00:00:00', ''),
(41, 'prevost', 0, 'default.png', 'divinity07', '0966347534', '0966347534', '2017-07-09 17:39:00', '0000-00-00 00:00:00', 'afe113'),
(42, 'King', 0, 'default.png', '1234567', '0974748555', '0974748555', '2017-07-12 08:29:50', '0000-00-00 00:00:00', '1e235e'),
(43, '0912345678', 0, '7B6CB06F40B4F11435A09AF2CD54569B', '123456', '0912345678', '0912345678', '2017-08-04 13:52:45', '0000-00-00 00:00:00', 'fa162b'),
(44, 'laan', 1, '61070F8C0A947C133B6346DCEFC5BF32', '123456', '0912345677', '0912345677', '2017-08-08 01:08:42', '0000-00-00 00:00:00', '975439'),
(45, '0960509422', 0, '5D4F97F160A824A15B7B4E63F95AAEFD', 'Dorctake@7878', '0960509422', '0960509422', '2017-08-10 17:06:32', '0000-00-00 00:00:00', 'd6242b'),
(46, '0915236541', 0, '4519BF1C64C4AB49C21123C26ADB2E1C', '125487', '0915236541', '0915236541', '2017-08-28 02:09:23', '0000-00-00 00:00:00', 'c4847b'),
(47, '0921546532', 0, '5D4F97F160A824A15B7B4E63F95AAEFD', '123658', '0921546532', '0921546532', '2017-08-28 06:28:36', '0000-00-00 00:00:00', '9be833'),
(48, '0946573281', 0, '5D4F97F160A824A15B7B4E63F95AAEFD', '159753', '0946573281', '0946573281', '2017-08-28 07:22:28', '0000-00-00 00:00:00', '92e2ca'),
(49, '0955207939', 0, '5D4F97F160A824A15B7B4E63F95AAEFD', 'Guowei123@', '0955207939', '0955207939', '2017-08-28 12:03:25', '0000-00-00 00:00:00', 'd20fdf'),
(50, '0951245862', 0, '5D4F97F160A824A15B7B4E63F95AAEFD', '123654', '0951245862', '0951245862', '2017-08-30 01:17:21', '0000-00-00 00:00:00', '494ddf'),
(51, '0987542153', 0, '5D4F97F160A824A15B7B4E63F95AAEFD', '987563', '0987542153', '0987542153', '2017-08-30 01:19:00', '0000-00-00 00:00:00', 'd1092d'),
(52, '0968121579', 0, '5D4F97F160A824A15B7B4E63F95AAEFD', 'kami77966', '0968121579', '0968121579', '2017-08-30 08:30:57', '0000-00-00 00:00:00', 'd5feee'),
(53, '0966666666', 0, '5D4F97F160A824A15B7B4E63F95AAEFD', '1234567', '0966666666', '0966666666', '2017-08-31 02:22:07', '0000-00-00 00:00:00', 'af7197'),
(54, '0965207931', 0, '74A757F3C28E3428862700FAF0C895D0', '123', '0965207931', '0965207931', '2017-09-27 07:34:22', '0000-00-00 00:00:00', '8bbcd5'),
(55, '0965207932', 0, '5D4F97F160A824A15B7B4E63F95AAEFD', '123', '0965207932', '0965207932', '2017-09-04 08:31:52', '0000-00-00 00:00:00', 'eaab35'),
(56, '0978090051', 0, '5D4F97F160A824A15B7B4E63F95AAEFD', 'shims90', '0978090051', '0978090051', '2017-09-07 06:33:20', '0000-00-00 00:00:00', '0392db'),
(57, '0969711267', 0, '5D4F97F160A824A15B7B4E63F95AAEFD', 'chatowa700', '0969711267', '0969711267', '2017-09-07 08:41:28', '0000-00-00 00:00:00', '160608'),
(58, '0979520709', 1, '5D4F97F160A824A15B7B4E63F95AAEFD', 'nDanjims13*', '0979520709', '0979520709', '2017-09-09 06:33:57', '0000-00-00 00:00:00', 'e97d40'),
(59, '0976585005', 0, '5D4F97F160A824A15B7B4E63F95AAEFD', 'Lordfupi', '0976585005', '0976585005', '2017-09-13 07:04:35', '0000-00-00 00:00:00', 'ab895c'),
(60, 'Eureks', 2, '5D4F97F160A824A15B7B4E63F95AAEFD', '456789', '0945612345', '0945612345', '2017-09-26 05:41:44', '0000-00-00 00:00:00', '8b4ce0'),
(61, 'chaojie', 0, '5D4F97F160A824A15B7B4E63F95AAEFD', 'chaojie', '0900000000', '0900000000', '2017-09-26 06:03:24', '0000-00-00 00:00:00', 'ef99b6');

-- --------------------------------------------------------

--
-- Table structure for table `info_gg_user_ext`
--

CREATE TABLE IF NOT EXISTS `info_gg_user_ext` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid, info_gg_users中的ID',
  `comments` varchar(32) NOT NULL COMMENT '评论信息文件保存位置',
  `wishs` varchar(32) NOT NULL COMMENT '收藏信息文件保存位置',
  `ups` varchar(32) NOT NULL COMMENT '点赞信息文件保存位置',
  `downs` varchar(32) NOT NULL COMMENT '鄙视信息文件信息',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
