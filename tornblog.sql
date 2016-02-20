SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE DATABASE IF NOT EXISTS `tornblog` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `tornblog`;

CREATE TABLE IF NOT EXISTS `authors` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `hashed_password` varchar(100) NOT NULL,
  `access_level` int(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `entries` (
  `id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `title` varchar(512) NOT NULL,
  `markdown` mediumtext NOT NULL,
  `html` mediumtext NOT NULL,
  `published` datetime NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `options` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `value` text NOT NULL,
  `auto` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `sidebar_links` (
  `id` int(4) NOT NULL,
  `url` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `text` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

ALTER TABLE `entries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `published` (`published`);

ALTER TABLE `options`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `sidebar_links`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `authors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `entries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `sidebar_links`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
