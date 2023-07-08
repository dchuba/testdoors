-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Июл 08 2023 г., 09:05
-- Версия сервера: 5.7.35-38
-- Версия PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `masterden5_dev4`
--

-- --------------------------------------------------------

--
-- Структура таблицы `result`
--

CREATE TABLE IF NOT EXISTS `result` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `paiting` varchar(50) DEFAULT NULL,
  `film` varchar(50) DEFAULT NULL,
  `handle` varchar(50) DEFAULT NULL,
  `width` varchar(50) DEFAULT NULL,
  `height` varchar(50) DEFAULT NULL,
  `opening` varchar(50) DEFAULT NULL,
  `accessories` varchar(150) DEFAULT NULL,
  `price` varchar(50) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `result`
--

INSERT INTO `result` (`id`, `paiting`, `film`, `handle`, `width`, `height`, `opening`, `accessories`, `price`) VALUES
(1, 'синий', 'красный', 'синий', '890 мм', '2040 мм', 'Левое', 'Флеш свет', '111111'),
(2, 'синий', 'зеленый', 'желтый', '890 мм', '2040 мм', 'Правое', 'Подсветка ручек', '0'),
(3, 'зеленый', 'красный', 'синий', '920 мм', '2100 мм', 'Правое', 'Накладка на порог,Флеш свет,Подсветка ручек', '632312'),
(4, 'зеленый', 'синий', 'красный', '920 мм', '2070 мм', 'Левое', 'Накладка на порог,Флеш свет', '322132'),
(5, 'зеленый', 'синий', 'красный', '970 мм', '2070 мм', 'Левое', 'Накладка на порог,Флеш свет', '323132'),
(6, 'зеленый', 'синий', 'желтый', '920 мм', '2070 мм', 'Левое', 'Накладка на порог, Флеш свет', '111111'),
(7, 'зеленый', 'синий', 'красный', '970 мм', '2070 мм', 'Левое', 'Флеш свет, Подсветка ручек', '523132'),
(8, 'зеленый', 'красный', 'синий', '970 мм', '2040 мм', 'Левое', 'Накладка на порог, Флеш свет', '313312'),
(9, 'красный', 'синий', 'желтый', '920 мм', '2070 мм', 'Левое', 'Накладка на порог', '122431'),
(10, 'красный', 'синий', 'зеленый', '920 мм', '2070 мм', 'Левое', 'Накладка на порог', '122231'),
(11, 'красный', 'синий', 'зеленый', '920 мм', '2100 мм', 'Левое', 'Накладка на порог', '132231'),
(12, 'красный', 'синий', 'зеленый', '920 мм', '2100 мм', 'Правое', 'Накладка на порог', '132231'),
(13, 'красный', 'синий', 'желтый', '920 мм', '2100 мм', 'Правое', 'Накладка на порог', '132431'),
(14, 'красный', 'синий', 'желтый', '920 мм', '2100 мм', 'Левое', 'Накладка на порог', '132431');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
