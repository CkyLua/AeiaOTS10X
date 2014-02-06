-- phpMyAdmin SQL Dump
-- version 4.0.5
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 26, 2014 at 04:55 PM
-- Server version: 5.5.33
-- PHP Version: 5.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `znote`
--

-- --------------------------------------------------------

--
-- Table structure for table `supporttickets`
--

CREATE TABLE `supporttickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(25) NOT NULL,
  `contentText` varchar(1000) NOT NULL,
  `accountName` varchar(100) NOT NULL,
  `status` varchar(35) NOT NULL,
  `created` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `supporttickets`
--

-- --------------------------------------------------------

--
-- Table structure for table `supporttickets_comments`
--

CREATE TABLE `supporttickets_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticketId` longtext NOT NULL,
  `comment` varchar(500) NOT NULL,
  `from_user` varchar(25) NOT NULL,
  `date_post` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;


