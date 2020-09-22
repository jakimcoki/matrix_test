-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 15, 2020 at 07:25 AM
-- Server version: 5.7.23
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `matrix_test_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `loginlogs`
--

DROP TABLE IF EXISTS `loginlogs`;
CREATE TABLE IF NOT EXISTS `loginlogs` (
  `id` varchar(36) NOT NULL,
  `IpAddress` varbinary(16) NOT NULL,
  `TryTime` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loginlogs`
--

INSERT INTO `loginlogs` (`id`, `IpAddress`, `TryTime`) VALUES
('5f606bf5bb9f1', 0x3a3a31, 1600154613),
('5f606bf8d4c13', 0x3a3a31, 1600154616);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` varchar(36) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `FLAG` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `FLAG`) VALUES
('5f6022d16cbf9', 'jakim.coki1gdfg23', 'jakimestafgdfgdfgtievski@yahoo.com', 'f79c9ed739405bb56cf5bd89d56836a5', '1'),
('5f6020f524bf9', 'jakim.codasdasdki123', 'jakimestatievski@yahoo.com', 'f79c9ed739405bb56cf5bd89d56836a5', '1'),
('5f5ff62fa7f47', 'semasema', 'semssa@sema.com', 'f79c9ed739405bb56cf5bd89d56836a5', '1'),
('5f5ff58d827b1', 'jatesema', 'sdss@ls.com', 'f79c9ed739405bb56cf5bd89d56836a5', '1'),
('5f5ff3048700a', 'karolinakoleva', 'jakimestatievski@yahoo.comsssss', 'f79c9ed739405bb56cf5bd89d56836a5', '1'),
('5f5ff27abbcab', 'jakim.coki123fffff', 'karo.jakimce@gmddail.com', 'c7dc44fb4bdd8194a705b3104415e687', '1'),
('5f5ff1020d06b', 'jakim.coki12dddddd3', 'jakimesssssssssssstatievski@yahoo.com', 'f79c9ed739405bb56cf5bd89d56836a5', '1'),
('5f5fec62a6ae8', 'jakim.coki123sfsdfsd', 'karo.jakimddddddddddddce@gmail.comf', 'f79c9ed739405bb56cf5bd89d56836a5', '1'),
('5f5febf08542b', 'jakim.coki123sssssss', 'dsadsads@fsd.com', 'f79c9ed739405bb56cf5bd89d56836a5', '1'),
('5f5fe7b64eace', 'jakim.coki123sdf', 'fsdfsdfs@fd.com', 'f79c9ed739405bb56cf5bd89d56836a5', '1'),
('5f5fe6efc4817', 'milicka', 'karo.jakssssssimce@gmail.com', 'f79c9ed739405bb56cf5bd89d56836a5', '0'),
('5f5fe33b08b21', 'mise', 'karo.jsssssssssakimce@gmail.com', 'f79c9ed739405bb56cf5bd89d56836a5', '1'),
('5f5fd13b4e567', 'karolince', 'jakimessaASasAStatievski@yahoo.com', 'f79c9ed739405bb56cf5bd89d56836a5', '1'),
('5f5fc33898990', 'cico', 'jakimedasdasdasdasdstatievski@yahoo.com', 'f79c9ed739405bb56cf5bd89d56836a5', '1'),
('5f5fc2e531d9f', 'Miska', 'Miskadas@fsd.com', 'f79c9ed739405bb56cf5bd89d56836a5', '1'),
('5f5fe790d5fc1', 'jakim.coki123', 'jakimestatidfsdfsdfsdfevski@yahoo.com', 'f79c9ed739405bb56cf5bd89d56836a5', '1'),
('5f5fc2218c45f', 'jakim.cosdasdasdasdsadki123', 'jakimestatiasdasdasdasevski@yahoo.com', 'f79c9ed739405bb56cf5bd89d56836a5', '1'),
('5f5fb5c55c202', 'jakim.coksdsdasdasdi123', 'jakimestatievsasasaski@yahoo.com', 'f79c9ed739405bb56cf5bd89d56836a5', '1'),
('5f5fb5e8c3ef1', 'nadica', 'naadasd@nade.com', 'f79c9ed739405bb56cf5bd89d56836a5', '1'),
('5f5fb63fb99e9', 'jakim.codsadasdki123', 'dasdasdassssA@ASDASD.COM', 'f79c9ed739405bb56cf5bd89d56836a5', '1');

-- --------------------------------------------------------

--
-- Table structure for table `user_experience`
--

DROP TABLE IF EXISTS `user_experience`;
CREATE TABLE IF NOT EXISTS `user_experience` (
  `id` varchar(36) NOT NULL,
  `language` varchar(255) NOT NULL,
  `experience` varchar(255) NOT NULL,
  `company` varchar(255) NOT NULL,
  `user_id` varchar(36) NOT NULL,
  `flag` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_experience`
--

INSERT INTO `user_experience` (`id`, `language`, `experience`, `company`, `user_id`, `flag`) VALUES
('5f5fe3702a08d', 'fsdf', 'fsdfsdf', 'fsdf', '5f5fe33b08b21', '1'),
('5f5fe37029fed', 'fdsf', 'df', 'dfs', '5f5fe33b08b21', '1'),
('5f5fe37029f3c', 'fdf', 'ffsdf', 'sdf', '5f5fe33b08b21', '1'),
('5f6022b891ceb', 'dasdasdasd', '3', 'sad', '5f5fd13b4e567', '1'),
('5f6022b891b3d', 'aasdasd', '3', 'dasd', '5f5fd13b4e567', '1'),
('5f6022b891c1c', 'dasd', '3', 'sdds', '5f5fd13b4e567', '1'),
('5f5fd115a0a54', 'PHP1', '1', 'ITGMA1', '5f5fb6730363b', '1'),
('5f5fd115a099c', 'teste', '33', 'dfsdf', '5f5fb6730363b', '1'),
('5f5fd115a0827', 'PHP3', '3', 'ITGMA3', '5f5fb6730363b', '1'),
('5f5fc350a3065', 'PHP4', '4', 'ITGMA4', '5f5fc33898990', '1'),
('5f5fc350a2fae', 'PHP3', '3', 'ITGMA3', '5f5fc33898990', '1'),
('5f5fc350a2ed4', 'PHP2', '2', 'ITGMA2', '5f5fc33898990', '1'),
('5f5fc350a2dd0', 'PHP1', '1', 'ITGMA1', '5f5fc33898990', '1'),
('5f5fc2f2ac1d1', 'PHP4', '4', 'ITGMA4', '5f5fc2e531d9f', '1'),
('5f5fc2f2ac15b', 'PHP3', '3', 'ITGMA3', '5f5fc2e531d9f', '1'),
('5f5fc2f2ac0b2', 'PHP2', '2', 'ITGMA2', '5f5fc2e531d9f', '1'),
('5f5fc2f2ac00a', 'PHP1', '1', 'ITGMA1', '5f5fc2e531d9f', '1'),
('5f5fc2c083786', 'PHP4', '4', 'ITGMA4', '5f5fc2218c45f', '1'),
('5f5fc2c0836e9', 'PHP3', '3', 'ITGMA3', '5f5fc2218c45f', '1'),
('5f5fc2c08363f', 'PHP2', '2', 'ITGMA2', '5f5fc2218c45f', '1'),
('5f5fc2c0834f0', 'PHP1', '1', 'ITGMA1', '5f5fc2218c45f', '1'),
('5f5fd115a08d7', 'fsdfsdf', '4', 'sdfsdf', '5f5fb6730363b', '1'),
('5f5fd115a0773', 'PHP2', '2', 'ITGMA2', '5f5fb6730363b', '1'),
('5f5fd115a06ae', 'PHP4', '4', 'ITGMA4', '5f5fb6730363b', '1'),
('5f5fb609e8a19', 'PHP4', '4', 'ITGMA4', '5f5fb5e8c3ef1', '1'),
('5f5fb609e8969', 'PHP3', '3', 'ITGMA3', '5f5fb5e8c3ef1', '1'),
('5f5fb609e88a1', 'PHP2', '2', 'ITGMA2', '5f5fb5e8c3ef1', '1'),
('5f5fb609e8788', 'PHP1', '1', 'ITGMA1', '5f5fb5e8c3ef1', '1'),
('5f5fb600bc10e', 'PHP4', '4', 'ITGMA4', '5f5fb5e8c3ef1', '1'),
('5f5fb600bc060', 'PHP3', '3', 'ITGMA3', '5f5fb5e8c3ef1', '1'),
('5f5fb600bbfa1', 'PHP2', '2', 'ITGMA2', '5f5fb5e8c3ef1', '1'),
('5f5fb600bbe47', 'PHP1', '1', 'ITGMA1', '5f5fb5e8c3ef1', '1'),
('5f5f7f614f58c', 'PHP1', '1', 'ITGMA1', '5f5f7a828ad40', '1'),
('5f5f7f614f662', 'PHP2', '2', 'ITGMA2', '5f5f7a828ad40', '1'),
('5f5f7f614f6e7', 'PHP3', '3', 'ITGMA3', '5f5f7a828ad40', '1'),
('5f5f7f614f778', 'PHP4', '4', 'ITGMA4', '5f5f7a828ad40', '1'),
('5f5f83493a340', 'PHP1', '1', 'ITGMA1', '5f5f7a828ad40', '1'),
('5f5f83493a452', 'PHP2', '2', 'ITGMA2', '5f5f7a828ad40', '1'),
('5f5f83493a4d2', 'PHP3', '3', 'ITGMA3', '5f5f7a828ad40', '1'),
('5f5f83493a557', 'PHP4', '4', 'ITGMA4', '5f5f7a828ad40', '1'),
('5f5f88d8e5ae5', 'PHP1', '1', 'ITGMA1', '5f5f7a828ad40', '1'),
('5f5f88d8e5bb0', 'PHP2', '2', 'ITGMA2', '5f5f7a828ad40', '1'),
('5f5f88d8e5c2b', 'PHP3', '3', 'ITGMA3', '5f5f7a828ad40', '1'),
('5f5f88d8e5cb5', 'PHP4', '4', 'ITGMA4', '5f5f7a828ad40', '1'),
('5f5f88f518317', 'PHP1', '1', 'ITGMA1', '5f5f7a828ad40', '1'),
('5f5f88f519d84', 'PHP2', '2', 'ITGMA2', '5f5f7a828ad40', '1'),
('5f5f88f519e51', 'PHP3', '3', 'ITGMA3', '5f5f7a828ad40', '1'),
('5f5f88f519ee2', 'PHP4', '4', 'ITGMA4', '5f5f7a828ad40', '1'),
('5f5f88f785cdc', 'PHP1', '1', 'ITGMA1', '5f5f7a828ad40', '1'),
('5f5f88f785dc8', 'PHP2', '2', 'ITGMA2', '5f5f7a828ad40', '1'),
('5f5f88f785e71', 'PHP3', '3', 'ITGMA3', '5f5f7a828ad40', '1'),
('5f5f88f785eff', 'PHP4', '4', 'ITGMA4', '5f5f7a828ad40', '1'),
('5f5f88f9c3c81', 'PHP1', '1', 'ITGMA1', '5f5f7a828ad40', '1'),
('5f5f88f9c3d50', 'PHP2', '2', 'ITGMA2', '5f5f7a828ad40', '1'),
('5f5f88f9c3ddf', 'PHP3', '3', 'ITGMA3', '5f5f7a828ad40', '1'),
('5f5f88f9c3e6b', 'PHP4', '4', 'ITGMA4', '5f5f7a828ad40', '1'),
('5f5f88fb065b6', 'PHP1', '1', 'ITGMA1', '5f5f7a828ad40', '1'),
('5f5f88fb06695', 'PHP2', '2', 'ITGMA2', '5f5f7a828ad40', '1'),
('5f5f88fb06743', 'PHP3', '3', 'ITGMA3', '5f5f7a828ad40', '1'),
('5f5f88fb067ea', 'PHP4', '4', 'ITGMA4', '5f5f7a828ad40', '1'),
('5f5f88fc49b90', 'PHP1', '1', 'ITGMA1', '5f5f7a828ad40', '1'),
('5f5f88fc4b8d8', 'PHP2', '2', 'ITGMA2', '5f5f7a828ad40', '1'),
('5f5f88fc4b9aa', 'PHP3', '3', 'ITGMA3', '5f5f7a828ad40', '1'),
('5f5f88fc4ba35', 'PHP4', '4', 'ITGMA4', '5f5f7a828ad40', '1'),
('5f5f8916a5977', 'PHP1', '1', 'ITGMA1', '5f5f7a828ad40', '1'),
('5f5f8916a5a4a', 'PHP2', '2', 'ITGMA2', '5f5f7a828ad40', '1'),
('5f5f8916a5ae3', 'PHP3', '3', 'ITGMA3', '5f5f7a828ad40', '1'),
('5f5f8916a5b79', 'PHP4', '4', 'ITGMA4', '5f5f7a828ad40', '1'),
('5f5f8969a6808', 'PHP1', '1', 'ITGMA1', '5f5f7a828ad40', '1'),
('5f5f8969a68fa', 'PHP2', '2', 'ITGMA2', '5f5f7a828ad40', '1'),
('5f5f8969a6991', 'PHP3', '3', 'ITGMA3', '5f5f7a828ad40', '1'),
('5f5f8969a6a27', 'PHP4', '4', 'ITGMA4', '5f5f7a828ad40', '1'),
('5f5f896d2f02a', 'PHP1', '1', 'ITGMA1', '5f5f7a828ad40', '1'),
('5f5f896d30eae', 'PHP2', '2', 'ITGMA2', '5f5f7a828ad40', '1'),
('5f5f896d30f62', 'PHP3', '3', 'ITGMA3', '5f5f7a828ad40', '1'),
('5f5f896d30fe0', 'PHP4', '4', 'ITGMA4', '5f5f7a828ad40', '1'),
('5f5f896fdc150', 'PHP1', '1', 'ITGMA1', '5f5f7a828ad40', '1'),
('5f5f896fde1b1', 'PHP2', '2', 'ITGMA2', '5f5f7a828ad40', '1'),
('5f5f896fde315', 'PHP3', '3', 'ITGMA3', '5f5f7a828ad40', '1'),
('5f5f896fde3d9', 'PHP4', '4', 'ITGMA4', '5f5f7a828ad40', '1'),
('5f5f8970f0667', 'PHP1', '1', 'ITGMA1', '5f5f7a828ad40', '1'),
('5f5f8970f225c', 'PHP2', '2', 'ITGMA2', '5f5f7a828ad40', '1'),
('5f5f8970f2342', 'PHP3', '3', 'ITGMA3', '5f5f7a828ad40', '1'),
('5f5f8970f23e3', 'PHP4', '4', 'ITGMA4', '5f5f7a828ad40', '1'),
('5f5f8971aa9da', 'PHP1', '1', 'ITGMA1', '5f5f7a828ad40', '1'),
('5f5f8971aaac7', 'PHP2', '2', 'ITGMA2', '5f5f7a828ad40', '1'),
('5f5f8971aab52', 'PHP3', '3', 'ITGMA3', '5f5f7a828ad40', '1'),
('5f5f8971aac22', 'PHP4', '4', 'ITGMA4', '5f5f7a828ad40', '1'),
('5f5f89726985c', 'PHP1', '1', 'ITGMA1', '5f5f7a828ad40', '1'),
('5f5f89726998c', 'PHP2', '2', 'ITGMA2', '5f5f7a828ad40', '1'),
('5f5f897269a40', 'PHP3', '3', 'ITGMA3', '5f5f7a828ad40', '1'),
('5f5f897269af7', 'PHP4', '4', 'ITGMA4', '5f5f7a828ad40', '1'),
('5f5f898555271', 'PHP1', '1', 'ITGMA1', '5f5f7a828ad40', '1'),
('5f5f898555358', 'PHP2', '2', 'ITGMA2', '5f5f7a828ad40', '1'),
('5f5f898555409', 'PHP3', '3', 'ITGMA3', '5f5f7a828ad40', '1'),
('5f5f8985554c0', 'PHP4', '4', 'ITGMA4', '5f5f7a828ad40', '1'),
('5f5f89f02c4d3', 'PHP1', '1', 'ITGMA1', '5f5f7a828ad40', '1'),
('5f5f89f02c5c8', 'PHP2', '2', 'ITGMA2', '5f5f7a828ad40', '1'),
('5f5f89f02c674', 'PHP3', '3', 'ITGMA3', '5f5f7a828ad40', '1'),
('5f5f89f02c720', 'PHP4', '4', 'ITGMA4', '5f5f7a828ad40', '1'),
('5f5f89f149a71', 'PHP1', '1', 'ITGMA1', '5f5f7a828ad40', '1'),
('5f5f89f149bc4', 'PHP2', '2', 'ITGMA2', '5f5f7a828ad40', '1'),
('5f5f89f149cce', 'PHP3', '3', 'ITGMA3', '5f5f7a828ad40', '1'),
('5f5f89f149db0', 'PHP4', '4', 'ITGMA4', '5f5f7a828ad40', '1'),
('5f5f89f1955c0', 'PHP1', '1', 'ITGMA1', '5f5f7a828ad40', '1'),
('5f5f89f1956bb', 'PHP2', '2', 'ITGMA2', '5f5f7a828ad40', '1'),
('5f5f89f195771', 'PHP3', '3', 'ITGMA3', '5f5f7a828ad40', '1'),
('5f5f89f195872', 'PHP4', '4', 'ITGMA4', '5f5f7a828ad40', '1'),
('5f5f89f1ed6d2', 'PHP1', '1', 'ITGMA1', '5f5f7a828ad40', '1'),
('5f5f89f1ed7d1', 'PHP2', '2', 'ITGMA2', '5f5f7a828ad40', '1'),
('5f5f89f1ed894', 'PHP3', '3', 'ITGMA3', '5f5f7a828ad40', '1'),
('5f5f89f1ed948', 'PHP4', '4', 'ITGMA4', '5f5f7a828ad40', '1'),
('5f5f89f227317', 'PHP1', '1', 'ITGMA1', '5f5f7a828ad40', '1'),
('5f5f89f2273e6', 'PHP2', '2', 'ITGMA2', '5f5f7a828ad40', '1'),
('5f5f89f227477', 'PHP3', '3', 'ITGMA3', '5f5f7a828ad40', '1'),
('5f5f89f2274e2', 'PHP4', '4', 'ITGMA4', '5f5f7a828ad40', '1'),
('5f5f8a6016ab5', 'PHP1', '1', 'ITGMA1', '5f5f8a2eb24b0', '1'),
('5f5f8a6016b72', 'PHP2', '2', 'ITGMA2', '5f5f8a2eb24b0', '1'),
('5f5f8a6016c20', 'PHP3', '3', 'ITGMA3', '5f5f8a2eb24b0', '1'),
('5f5f8a6016cc9', 'PHP4', '4', 'ITGMA4', '5f5f8a2eb24b0', '1'),
('5f5f8a68a8cd7', 'PHP1', '1', 'ITGMA1', '5f5f8a2eb24b0', '1'),
('5f5f8a68a8dbc', 'PHP2', '2', 'ITGMA2', '5f5f8a2eb24b0', '1'),
('5f5f8a68a8e72', 'PHP3', '3', 'ITGMA3', '5f5f8a2eb24b0', '1'),
('5f5f8a68a8f1c', 'PHP4', '4', 'ITGMA4', '5f5f8a2eb24b0', '1'),
('5f5f8b77c1b81', 'PHP1', '1', 'ITGMA1', '5f5f8aad72689', '1'),
('5f5f8b77c1c36', 'PHP2', '2', 'ITGMA2', '5f5f8aad72689', '1'),
('5f5f8b77c1cff', 'PHP3', '3', 'ITGMA3', '5f5f8aad72689', '1'),
('5f5f8b77c1dc6', 'PHP4', '4', 'ITGMA4', '5f5f8aad72689', '1'),
('5f5f8b7e45e4b', 'PHP1', '1', 'ITGMA1', '5f5f8aad72689', '1'),
('5f5f8b7e45fa0', 'PHP2', '2', 'ITGMA2', '5f5f8aad72689', '1'),
('5f5f8b7e4607c', 'PHP3', '3', 'ITGMA3', '5f5f8aad72689', '1'),
('5f5f8b7e4617c', 'PHP4', '4', 'ITGMA4', '5f5f8aad72689', '1'),
('5f5f8b7ef24f9', 'PHP1', '1', 'ITGMA1', '5f5f8aad72689', '1'),
('5f5f8b7ef261f', 'PHP2', '2', 'ITGMA2', '5f5f8aad72689', '1'),
('5f5f8b7ef26bd', 'PHP3', '3', 'ITGMA3', '5f5f8aad72689', '1'),
('5f5f8b7ef2751', 'PHP4', '4', 'ITGMA4', '5f5f8aad72689', '1'),
('5f5f8b7fa8132', 'PHP1', '1', 'ITGMA1', '5f5f8aad72689', '1'),
('5f5f8b7fa81f9', 'PHP2', '2', 'ITGMA2', '5f5f8aad72689', '1'),
('5f5f8b7fa82a9', 'PHP3', '3', 'ITGMA3', '5f5f8aad72689', '1'),
('5f5f8b7fa835c', 'PHP4', '4', 'ITGMA4', '5f5f8aad72689', '1'),
('5f5f8b803d81b', 'PHP1', '1', 'ITGMA1', '5f5f8aad72689', '1'),
('5f5f8b803d8fd', 'PHP2', '2', 'ITGMA2', '5f5f8aad72689', '1'),
('5f5f8b803d9ab', 'PHP3', '3', 'ITGMA3', '5f5f8aad72689', '1'),
('5f5f8b803da54', 'PHP4', '4', 'ITGMA4', '5f5f8aad72689', '1'),
('5f5f8b80bddf9', 'PHP1', '1', 'ITGMA1', '5f5f8aad72689', '1'),
('5f5f8b80bdebd', 'PHP2', '2', 'ITGMA2', '5f5f8aad72689', '1'),
('5f5f8b80bdf4c', 'PHP3', '3', 'ITGMA3', '5f5f8aad72689', '1'),
('5f5f8b80bdfdd', 'PHP4', '4', 'ITGMA4', '5f5f8aad72689', '1'),
('5f5f8b81e6244', 'PHP1', '1', 'ITGMA1', '5f5f8aad72689', '1'),
('5f5f8b81e6327', 'PHP2', '2', 'ITGMA2', '5f5f8aad72689', '1'),
('5f5f8b81e63f6', 'PHP3', '3', 'ITGMA3', '5f5f8aad72689', '1'),
('5f5f8b81e64e2', 'PHP4', '4', 'ITGMA4', '5f5f8aad72689', '1'),
('5f5f8b82918af', 'PHP1', '1', 'ITGMA1', '5f5f8aad72689', '1'),
('5f5f8b82919c7', 'PHP2', '2', 'ITGMA2', '5f5f8aad72689', '1'),
('5f5f8b8291a8a', 'PHP3', '3', 'ITGMA3', '5f5f8aad72689', '1'),
('5f5f8b8291b3a', 'PHP4', '4', 'ITGMA4', '5f5f8aad72689', '1'),
('5f5f8bbc6a66c', 'PHP1', '1', 'ITGMA1', '5f5f8aad72689', '1'),
('5f5f8bbc6a75b', 'PHP2', '2', 'ITGMA2', '5f5f8aad72689', '1'),
('5f5f8bbc6a813', 'PHP3', '3', 'ITGMA3', '5f5f8aad72689', '1'),
('5f5f8bbc6a8c1', 'PHP4', '4', 'ITGMA4', '5f5f8aad72689', '1'),
('5f5f8f3aef3c1', 'PHP1', '1', 'ITGMA1', '5f5f8da1eaedf', '1'),
('5f5f8f3aef4f4', 'PHP2', '2', 'ITGMA2', '5f5f8da1eaedf', '1'),
('5f5f8f3aef5a9', 'PHP3', '3', 'ITGMA3', '5f5f8da1eaedf', '1'),
('5f5f8f3aef654', 'PHP4', '4', 'ITGMA4', '5f5f8da1eaedf', '1'),
('5f5fa0beb273b', 'PHP1', '1', 'ITGMA1', '5f5fa07097186', '1'),
('5f5fa0beb281b', 'PHP2', '2', 'ITGMA2', '5f5fa07097186', '1'),
('5f5fa0beb2924', 'PHP3', '3', 'ITGMA3', '5f5fa07097186', '1'),
('5f5fa0beb29be', 'PHP4', '4', 'ITGMA4', '5f5fa07097186', '1'),
('5f5fa0d0c68c6', 'PHP1', '1', 'ITGMA1', '5f5fa07097186', '1'),
('5f5fa0d0c69ac', 'PHP2', '2', 'ITGMA2', '5f5fa07097186', '1'),
('5f5fa0d0c6a59', 'PHP3', '3', 'ITGMA3', '5f5fa07097186', '1'),
('5f5fa0d0c6b01', 'PHP4', '4', 'ITGMA4', '5f5fa07097186', '1'),
('5f5fa35903c98', 'PHP1', '1', 'ITGMA1', '5f5fa07097186', '1'),
('5f5fa35903d80', 'PHP2', '2', 'ITGMA2', '5f5fa07097186', '1'),
('5f5fa35903e2f', 'PHP3', '3', 'ITGMA3', '5f5fa07097186', '1'),
('5f5fa35903ee2', 'PHP4', '4', 'ITGMA4', '5f5fa07097186', '1'),
('5f5fa3686b5d3', 'PHP1', '1', 'ITGMA1', '5f5fa07097186', '1'),
('5f5fa3686b6b4', 'PHP2', '2', 'ITGMA2', '5f5fa07097186', '1'),
('5f5fa3686b749', 'PHP3', '3', 'ITGMA3', '5f5fa07097186', '1'),
('5f5fa3686b7d5', 'PHP4', '4', 'ITGMA4', '5f5fa07097186', '1'),
('5f5fa4457a82a', 'PHP1', '1', 'ITGMA1', '5f5fa07097186', '1'),
('5f5fa4457aa49', 'PHP2', '2', 'ITGMA2', '5f5fa07097186', '1'),
('5f5fa4457ab11', 'PHP3', '3', 'ITGMA3', '5f5fa07097186', '1'),
('5f5fa4457abd5', 'PHP4', '4', 'ITGMA4', '5f5fa07097186', '1'),
('5f5fa4522e100', 'PHP1', '1', 'ITGMA1', '5f5fa07097186', '1'),
('5f5fa4522e1bd', 'PHP2', '2', 'ITGMA2', '5f5fa07097186', '1'),
('5f5fa4522e255', 'PHP3', '3', 'ITGMA3', '5f5fa07097186', '1'),
('5f5fa4522e2e9', 'PHP4', '4', 'ITGMA4', '5f5fa07097186', '1'),
('5f5fa49ee4096', 'PHP1', '1', 'ITGMA1', '5f5fa07097186', '1'),
('5f5fa49ee416e', 'PHP2', '2', 'ITGMA2', '5f5fa07097186', '1'),
('5f5fa49ee4217', 'PHP3', '3', 'ITGMA3', '5f5fa07097186', '1'),
('5f5fa49ee42c4', 'PHP4', '4', 'ITGMA4', '5f5fa07097186', '1'),
('5f5fa4d5d0a3a', 'PHP1', '1', 'ITGMA1', '5f5fa07097186', '1'),
('5f5fa4d5d0b0e', 'PHP2', '2', 'ITGMA2', '5f5fa07097186', '1'),
('5f5fa4d5d0bb9', 'PHP3', '3', 'ITGMA3', '5f5fa07097186', '1'),
('5f5fa4d5d0c65', 'PHP4', '4', 'ITGMA4', '5f5fa07097186', '1'),
('5f5fa523d6ddf', 'PHP1', '1', 'ITGMA1', '5f5fa07097186', '1'),
('5f5fa523d6ead', 'PHP2', '2', 'ITGMA2', '5f5fa07097186', '1'),
('5f5fa523d6f7b', 'PHP3', '3', 'ITGMA3', '5f5fa07097186', '1'),
('5f5fa523d70a5', 'PHP4', '4', 'ITGMA4', '5f5fa07097186', '1'),
('5f5fa52c30cef', 'PHP1', '1', 'ITGMA1', '5f5fa07097186', '1'),
('5f5fa52c30ea5', 'PHP2', '2', 'ITGMA2', '5f5fa07097186', '1'),
('5f5fa52c31035', 'PHP3', '3', 'ITGMA3', '5f5fa07097186', '1'),
('5f5fa52c31147', 'PHP4', '4', 'ITGMA4', '5f5fa07097186', '1'),
('5f5faad545a6c', 'PHP4', '4', 'ITGMA4', '5f5d45ca64b4a', '1'),
('5f5faad5459a1', 'PHP3', '3', 'ITGMA3', '5f5d45ca64b4a', '1'),
('5f5faad5458e4', 'PHP2', '2', 'ITGMA2', '5f5d45ca64b4a', '1'),
('5f5faad545743', 'PHP1', '1', 'ITGMA1', '5f5d45ca64b4a', '1'),
('5f5ff56e68a7c', '', '', '', '5f5ff3048700a', '1'),
('5f5ffa46dc9ae', 'PHP', '4', 'Itgma', '5f5fe790d5fc1', '1'),
('5f5ff56e689b5', 'ds', 'ds', 'ds', '5f5ff3048700a', '1'),
('5f5ff56e688d3', '', '', '', '5f5ff3048700a', '1'),
('5f5ff56e68b34', '', '', '', '5f5ff3048700a', '1'),
('5f5ffa46dc7f3', 'Wordpress', '5', 'Drugooo', '5f5fe790d5fc1', '1'),
('5f5ffa46dc8e6', 'DataBase', '5', 'WebPauer', '5f5fe790d5fc1', '1'),
('5f5ffa46dca6e', 'Jquery', '4', 'UUUUU', '5f5fe790d5fc1', '1'),
('5f60227e84dde', 'fdsf', 'dfsdfs', 'fsdfs', '5f5ff62fa7f47', '1'),
('5f60227e84d18', 'fsdf', 'fsdf', 'fsdf', '5f5ff62fa7f47', '1'),
('5f60236057e04', 'gdfgdf', 'gdfg', 'fgdfg', '5f6022d16cbf9', '1');

-- --------------------------------------------------------

--
-- Table structure for table `user_information`
--

DROP TABLE IF EXISTS `user_information`;
CREATE TABLE IF NOT EXISTS `user_information` (
  `id` varchar(36) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `sex` varchar(10) NOT NULL,
  `user_id` varchar(36) NOT NULL,
  `status` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_information`
--

INSERT INTO `user_information` (`id`, `first_name`, `last_name`, `sex`, `user_id`, `status`) VALUES
('5f5e473e00be2', 'dasdasd', 'dasd', 'male', '5f5d45ca64b4a', '1'),
('5f5e470e449c9', 'dasdasd', 'dasd', 'male', '5f5d45ca64b4a', '1'),
('5f5e46eeec38c', 'dasdasd', 'dasd', 'male', '5f5d45ca64b4a', '1'),
('5f5e45c052e99', 'dasdasd', 'dasd', 'male', '5f5d45ca64b4a', '1'),
('5f5e411549202', 'dasdasd', 'dasd', 'male', '5f5d45ca64b4a', '1'),
('5f5e1c0e214d8', 'dasdasd', 'dasd', 'male', '5f5d45ca64b4a', ''),
('5f5e2ea75a5d3', 'dasdasd', 'dasd', 'male', '5f5d45ca64b4a', ''),
('5f5e30c24b643', 'dasdasd', 'dasd', 'male', '5f5d45ca64b4a', ''),
('5f5e39cfc8192', 'dasdasd', 'dasd', 'male', '5f5d45ca64b4a', ''),
('5f5e3afa05230', 'dasdasd', 'dasd', 'male', '5f5d45ca64b4a', ''),
('5f5e3b4cd0722', 'dasdasd', 'dasd', 'male', '5f5d45ca64b4a', ''),
('5f5e3b5679f06', 'dasdasd', 'dasd', 'male', '5f5d45ca64b4a', ''),
('5f5e3b5ee90b9', 'dasdasd', 'dasd', 'male', '5f5d45ca64b4a', ''),
('5f5e3b7bca507', 'dasdasd', 'dasd', 'male', '5f5d45ca64b4a', ''),
('5f5e3b8c955f9', 'dasdasd', 'dasd', 'male', '5f5d45ca64b4a', ''),
('5f5e3bb9bdf3d', 'dasdasd', 'dasd', 'male', '5f5d45ca64b4a', ''),
('5f5e3bbde8bf7', 'dasdasd', 'dasd', 'male', '5f5d45ca64b4a', ''),
('5f5e3bc02bbb0', 'dasdasd', 'dasd', 'male', '5f5d45ca64b4a', ''),
('5f5e3bc07bc8e', 'dasdasd', 'dasd', 'male', '5f5d45ca64b4a', ''),
('5f5e3bc0f08dc', 'dasdasd', 'dasd', 'male', '5f5d45ca64b4a', ''),
('5f5e3bc3e6c5d', 'dasdasd', 'dasd', 'male', '5f5d45ca64b4a', ''),
('5f5e3bc7db096', 'dasdasd', 'dasd', 'male', '5f5d45ca64b4a', ''),
('5f5e3bc8c5916', 'dasdasd', 'dasd', 'male', '5f5d45ca64b4a', ''),
('5f5e3d124a720', 'dasdasd', 'dasd', 'male', '5f5d45ca64b4a', ''),
('5f5e3d19e6278', 'dasdasd', 'dasd', 'male', '5f5d45ca64b4a', ''),
('5f5e3d239169d', 'dasdasd', 'dasd', 'male', '5f5d45ca64b4a', ''),
('5f5e3d29b331d', 'dasdasd', 'dasd', 'male', '5f5d45ca64b4a', ''),
('5f5e3db1e4563', 'dasdasd', 'dasd', 'male', '5f5d45ca64b4a', ''),
('5f5e3eb8379b8', 'dasdasd', 'dasd', 'male', '5f5d45ca64b4a', ''),
('5f5e3f03b1e5b', 'dasdasd', 'dasd', 'male', '5f5d45ca64b4a', ''),
('5f5e3f453c6f4', 'dasdasd', 'dasd', 'male', '5f5d45ca64b4a', ''),
('5f5e3f722a868', 'dasdasd', 'dasd', 'male', '5f5d45ca64b4a', ''),
('5f5e3fb3c0b0e', 'dasdasd', 'dasd', 'male', '5f5d45ca64b4a', ''),
('5f5e40e2a860d', 'dasdasd', 'dasd', 'male', '5f5d45ca64b4a', '1'),
('5f5e478b0d9eb', 'dasdasd', 'dasd', 'male', '5f5d45ca64b4a', '1'),
('5f5e479897a00', 'dasdasd', 'dasd', 'male', '5f5d45ca64b4a', '1'),
('5f5f83493a1c3', 'Admin', 'Admin', 'male', '5f5f7a828ad40', '1'),
('5f5f8a6016968', '', '', '', '5f5f8a2eb24b0', '1'),
('5f5f8b77c1aa2', 'Admin', 'Admin', 'male', '5f5f8aad72689', '1'),
('5f5f8f3aef2cc', 'Admin', 'Admin', 'female', '5f5f8da1eaedf', '1'),
('5f5fa0beb263e', 'dsadad', 'Tosksadasda3123', 'female', '5f5fa07097186', '1'),
('5f5fd1773e124', 'gdfgdfg', 'Admin', 'male', '5f5fd13b4e567', '1'),
('5f5fc350a2bd2', 'Admin', 'Admin', 'male', '5f5fc33898990', '1'),
('5f5fc2f2abe55', 'Admin', 'Admin', 'male', '5f5fc2e531d9f', '1'),
('5f5fc23a5b1ae', 'Admin', 'Admin', 'male', '5f5fc2218c45f', '1'),
('5f5fe35f7289a', 'Toskafsdf', 'Adminfsdf', 'male', '5f5fe33b08b21', '1'),
('5f5fb743e728b', 'Admin', 'Admin', 'male', '5f5fb6730363b', '1'),
('5f5fb600bbd36', 'Admin', 'Admin', 'male', '5f5fb5e8c3ef1', '1'),
('5f5ff0c81cc70', 'Jakim', 'Estatievski', 'male', '5f5fe790d5fc1', '1'),
('5f5ff563194bd', 'Admin', 'Admin', 'female', '5f5ff3048700a', '1'),
('5f602268f1cf0', 'Admin', 'Coki', 'female', '5f5ff62fa7f47', '1'),
('5f6022f0d01cb', 'cxbxcvxcv', 'Admin', 'male', '5f6022d16cbf9', '1');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
