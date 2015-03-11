-- phpMyAdmin SQL Dump
-- version 4.1.13
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 11, 2015 at 04:02 AM
-- Server version: 5.6.11
-- PHP Version: 5.5.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cake_acl`
--

-- --------------------------------------------------------

--
-- Table structure for table `acos`
--

CREATE TABLE IF NOT EXISTS `acos` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `foreign_key` int(10) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `lft` int(10) DEFAULT NULL,
  `rght` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=50 ;

--
-- Dumping data for table `acos`
--

INSERT INTO `acos` (`id`, `parent_id`, `model`, `foreign_key`, `alias`, `lft`, `rght`) VALUES
(26, NULL, NULL, NULL, 'controllers', 1, 48),
(27, 26, NULL, NULL, 'Categories', 2, 3),
(28, 26, NULL, NULL, 'Groups', 4, 9),
(29, 28, NULL, NULL, 'login', 5, 6),
(30, 28, NULL, NULL, 'logout', 7, 8),
(31, 26, NULL, NULL, 'News', 10, 13),
(32, 31, NULL, NULL, 'index', 11, 12),
(33, 26, NULL, NULL, 'Pages', 14, 17),
(34, 33, NULL, NULL, 'display', 15, 16),
(35, 26, NULL, NULL, 'Posts', 18, 29),
(36, 35, NULL, NULL, 'add', 19, 20),
(37, 35, NULL, NULL, 'index', 21, 22),
(38, 35, NULL, NULL, 'mana', 23, 24),
(39, 35, NULL, NULL, 'isAuthorized', 25, 26),
(40, 35, NULL, NULL, 'edit', 27, 28),
(41, 26, NULL, NULL, 'Users', 30, 37),
(42, 41, NULL, NULL, 'login', 31, 32),
(43, 41, NULL, NULL, 'logout', 33, 34),
(44, 41, NULL, NULL, 'initDB', 35, 36),
(45, 26, NULL, NULL, 'Widgets', 38, 45),
(46, 45, NULL, NULL, 'index', 39, 40),
(47, 45, NULL, NULL, 'add', 41, 42),
(48, 45, NULL, NULL, 'edit', 43, 44),
(49, 26, NULL, NULL, 'AclExtras', 46, 47);

-- --------------------------------------------------------

--
-- Table structure for table `aros`
--

CREATE TABLE IF NOT EXISTS `aros` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `foreign_key` int(10) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `lft` int(10) DEFAULT NULL,
  `rght` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `aros`
--

INSERT INTO `aros` (`id`, `parent_id`, `model`, `foreign_key`, `alias`, `lft`, `rght`) VALUES
(1, NULL, 'Group', 1, NULL, 1, 6),
(2, NULL, 'Group', 2, NULL, 7, 10),
(3, NULL, 'Group', 3, NULL, 11, 14),
(4, 1, 'User', 1, NULL, 2, 3),
(5, 2, 'User', 2, NULL, 8, 9),
(6, 3, 'User', 3, NULL, 12, 13),
(10, 1, 'User', 4, NULL, 4, 5);

-- --------------------------------------------------------

--
-- Table structure for table `aros_acos`
--

CREATE TABLE IF NOT EXISTS `aros_acos` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `aro_id` int(10) NOT NULL,
  `aco_id` int(10) NOT NULL,
  `_create` varchar(2) NOT NULL DEFAULT '0',
  `_read` varchar(2) NOT NULL DEFAULT '0',
  `_update` varchar(2) NOT NULL DEFAULT '0',
  `_delete` varchar(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ARO_ACO_KEY` (`aro_id`,`aco_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `aros_acos`
--

INSERT INTO `aros_acos` (`id`, `aro_id`, `aco_id`, `_create`, `_read`, `_update`, `_delete`) VALUES
(13, 1, 26, '1', '1', '1', '1'),
(14, 2, 26, '-1', '-1', '-1', '-1'),
(15, 2, 35, '1', '1', '1', '1'),
(16, 2, 45, '1', '1', '1', '1'),
(17, 3, 26, '-1', '-1', '-1', '-1'),
(18, 3, 36, '1', '1', '1', '1'),
(19, 3, 40, '1', '1', '1', '1'),
(20, 3, 47, '1', '1', '1', '1'),
(21, 3, 48, '1', '1', '1', '1'),
(22, 3, 43, '1', '1', '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `created`, `modified`) VALUES
(1, 'administrators', '2014-08-12 00:00:00', '2014-08-12 00:00:00'),
(2, 'managers', '2014-08-12 00:00:00', '2014-08-12 00:00:00'),
(3, 'users', '2014-08-12 05:15:18', '2014-08-12 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` char(40) NOT NULL,
  `group_id` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `group_id`, `created`, `modified`) VALUES
(1, 'admin', '9573c4fd4708f86d29cc60709c9dbe55fe5659d0', 1, NULL, NULL),
(2, 'mana', '9573c4fd4708f86d29cc60709c9dbe55fe5659d0', 2, '2014-08-12 00:00:00', '2014-08-12 00:00:00'),
(3, 'user', '9573c4fd4708f86d29cc60709c9dbe55fe5659d0', 3, '2014-08-12 00:00:00', '2014-08-13 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `widgets`
--

CREATE TABLE IF NOT EXISTS `widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `part_no` varchar(12) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
