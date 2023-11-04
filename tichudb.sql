-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 11, 2020 at 01:13 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tichudb`
--

-- --------------------------------------------------------

--
-- Table structure for table `card`
--

CREATE TABLE `card` (
  `card_id` int(11) NOT NULL,
  `card_name` enum('MAHJONG','PHOENIX','DOGS','DRAGON','K','Q','J','TEN','NINE','EIGHT','SEVEN','SIX','FIVE','FOUR','THREE','TWO','A') NOT NULL,
  `img_url` varchar(45) NOT NULL,
  `card_color` enum('BLACK','RED','GREEN','BLUE') NOT NULL,
  `rank_name` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `card`
--

INSERT INTO `card` (`card_id`, `card_name`, `img_url`, `card_color`, `rank_name`) VALUES
(1, 'MAHJONG', 'mahjong', '', NULL),
(2, 'PHOENIX', 'phoenix', '', '-25'),
(3, 'DOGS', 'dogs', '', NULL),
(4, 'DRAGON', 'dragon', '', '25'),
(5, 'K', 'black_K', 'BLACK', '10'),
(6, 'K', 'red_K', 'RED', '10'),
(7, 'K', 'green_K', 'GREEN', '10'),
(8, 'K', 'blue_K', 'BLUE', '10'),
(9, 'Q', 'black_Q', 'BLACK', NULL),
(10, 'Q', 'red_Q', 'RED', NULL),
(11, 'Q', 'green_Q', 'GREEN', NULL),
(12, 'Q', 'blue_Q', 'BLUE', NULL),
(13, 'J', 'black_J', 'BLACK', NULL),
(14, 'J', 'red_J', 'RED', NULL),
(15, 'J', 'green_J', 'GREEN', NULL),
(16, 'J', 'blue_J', 'BLUE', NULL),
(17, 'TEN', 'black_TEN', 'BLACK', '10'),
(18, 'TEN', 'red_TEN', 'RED', '10'),
(19, 'TEN', 'green_TEN', 'GREEN', '10'),
(20, 'TEN', 'blue_TEN', 'BLUE', '10'),
(21, 'NINE', 'black_NINE', 'BLACK', NULL),
(22, 'NINE', 'red_NINE', 'RED', NULL),
(23, 'NINE', 'green_NINE', 'GREEN', NULL),
(24, 'NINE', 'blue_NINE', 'BLUE', NULL),
(25, 'EIGHT', 'black_EIGHT', 'BLACK', NULL),
(26, 'EIGHT', 'red_EIGHT', 'RED', NULL),
(27, 'EIGHT', 'green_EIGHT', 'GREEN', NULL),
(28, 'EIGHT', 'blue_EIGHT', 'BLUE', NULL),
(29, 'SEVEN', 'black_SEVEN', 'BLACK', NULL),
(30, 'SEVEN', 'red_SEVEN', 'RED', NULL),
(31, 'SEVEN', 'green_SEVEN', 'GREEN', NULL),
(32, 'SEVEN', 'blue_SEVEN', 'BLUE', NULL),
(33, 'SIX', 'black_SIX', 'BLACK', NULL),
(34, 'SIX', 'red_SIX', 'RED', NULL),
(35, 'SIX', 'green_SIX', 'GREEN', NULL),
(36, 'SIX', 'blue_SIX', 'BLUE', NULL),
(37, 'FIVE', 'black_FIVE', 'BLACK', '5'),
(38, 'FIVE', 'red_FIVE', 'RED', '5'),
(39, 'FIVE', 'green_FIVE', 'GREEN', '5'),
(40, 'FIVE', 'blue_FIVE', 'BLUE', '5'),
(41, 'FOUR', 'black_FOUR', 'BLACK', NULL),
(42, 'FOUR', 'red_FOUR', 'RED', NULL),
(43, 'FOUR', 'green_FOUR', 'GREEN', NULL),
(44, 'FOUR', 'blue_FOUR', 'BLUE', NULL),
(45, 'THREE', 'black_THREE', 'BLACK', NULL),
(46, 'THREE', 'red_THREE', 'RED', NULL),
(47, 'THREE', 'green_THREE', 'GREEN', NULL),
(48, 'THREE', 'blue_THREE', 'BLUE', NULL),
(49, 'TWO', 'black_TWO', 'BLACK', NULL),
(50, 'TWO', 'red_TWO', 'RED', NULL),
(51, 'TWO', 'green_TWO', 'GREEN', NULL),
(52, 'TWO', 'blue_TWO', 'BLUE', NULL),
(53, 'A', 'black_A', 'BLACK', NULL),
(54, 'A', 'red_A', 'RED', NULL),
(55, 'A', 'green_A', 'GREEN', NULL),
(56, 'A', 'blue_A', 'BLUE', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `current_match`
--

CREATE TABLE `current_match` (
  `match_id` int(11) NOT NULL,
  `player_A_username` varchar(45) DEFAULT NULL,
  `player_B_username` varchar(45) DEFAULT NULL,
  `player_A_score` int(11) DEFAULT NULL,
  `player_B_score` int(11) DEFAULT NULL,
  `player_A_cards` varchar(111) DEFAULT '0',
  `player_B_cards` varchar(111) DEFAULT '0',
  `player_A_bank` varchar(111) DEFAULT '0',
  `player_B_bank` varchar(111) DEFAULT '0',
  `match_status` enum('not active','initialized','started','ended','aborded') NOT NULL DEFAULT 'not active',
  `player_turn` enum('playerA','playerB') DEFAULT NULL,
  `thrown_stack_cards` varchar(111) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Λίστα του παιχνιδιού που παίζεται';

-- --------------------------------------------------------

--
-- Table structure for table `player`
--

CREATE TABLE `player` (
  `username` varchar(45) NOT NULL,
  `score` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Λίστα όλων των εγγεγραμμένων παικτών';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `card`
--
ALTER TABLE `card`
  ADD PRIMARY KEY (`card_id`);

--
-- Indexes for table `current_match`
--
ALTER TABLE `current_match`
  ADD PRIMARY KEY (`match_id`);

--
-- Indexes for table `player`
--
ALTER TABLE `player`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `card`
--
ALTER TABLE `card`
  MODIFY `card_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `current_match`
--
ALTER TABLE `current_match`
  MODIFY `match_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
