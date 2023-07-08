-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Июл 08 2023 г., 09:40
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
-- Структура таблицы `config`
--

CREATE TABLE IF NOT EXISTS `config` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `param_id` int(10) NOT NULL,
  `label` varchar(50) NOT NULL,
  `value` varchar(150) NOT NULL,
  `price` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `config`
--

INSERT INTO `config` (`id`, `param_id`, `label`, `value`, `price`) VALUES
(1, 1, 'красный', 'ff0000', 1),
(2, 1, 'зеленый', '00ff00', 2),
(3, 1, 'синий', '0000ff', 3),
(4, 1, 'желтый', 'fff000', 4),
(5, 2, 'красный', 'ff0000', 10),
(6, 2, 'зеленый', '00ff00', 20),
(7, 2, 'синий', '0000ff', 30),
(8, 2, 'желтый', 'fff000', 40),
(9, 3, 'красный', 'ff0000', 100),
(10, 3, 'зеленый', '00ff00', 200),
(11, 3, 'синий', '0000ff', 300),
(12, 3, 'желтый', 'fff000', 400),
(13, 4, '890 мм', '890 мм', 1000),
(14, 4, '920 мм', '920 мм', 2000),
(15, 4, '970 мм', '970 мм', 3000),
(16, 5, '2040 мм', '2040 мм', 10000),
(17, 5, '2070 мм', '2070 мм', 20000),
(18, 5, '2100 мм', '2100 мм', 30000),
(19, 6, 'Правое', 'right', 0),
(20, 6, 'Левое', 'left', 0),
(21, 7, 'Накладка на порог', 'https://config.dverifalko.ru/pics/accessories/nakladka.jpg', 100000),
(22, 7, 'Флеш свет', 'https://config.dverifalko.ru/pics/accessories/flash.jpg', 200000),
(23, 7, 'Подсветка ручек', 'https://config.dverifalko.ru/pics/accessories/prch.jpg', 300000);

-- --------------------------------------------------------

--
-- Структура таблицы `param`
--

CREATE TABLE IF NOT EXISTS `param` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `param`
--

INSERT INTO `param` (`id`, `name`, `title`, `type`) VALUES
(1, 'paiting', 'Цвет покраски', 'color'),
(2, 'film', 'Цвет пленки', 'color'),
(3, 'handle', 'Цвет ручки', 'color'),
(4, 'width', 'Ширина', 'select'),
(5, 'height', 'Высота', 'select'),
(6, 'opening', 'Открывание', 'select'),
(7, 'accessories', 'Аксессуары', 'check');

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

-- --------------------------------------------------------

--
-- Структура таблицы `system`
--

CREATE TABLE IF NOT EXISTS `system` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `value` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `system`
--

INSERT INTO `system` (`id`, `name`, `value`) VALUES
(1, 'koeff', '0.7');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
