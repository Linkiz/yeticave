-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Мар 04 2021 г., 17:38
-- Версия сервера: 10.3.16-MariaDB
-- Версия PHP: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `test`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `categ_id` int(11) NOT NULL,
  `categ_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `lots`
--

CREATE TABLE `lots` (
  `lot_id` int(11) NOT NULL,
  `lot_categ_id` int(11) DEFAULT NULL,
  `lot_user_id` int(11) DEFAULT NULL,
  `lot_winner_id` int(11) DEFAULT NULL,
  `lot_name` varchar(70) DEFAULT NULL,
  `lot_discr` text DEFAULT NULL,
  `lot_cr_date` datetime DEFAULT NULL,
  `lot_img` text DEFAULT NULL,
  `lot_first_price` int(11) DEFAULT NULL,
  `lot_comp_date` datetime DEFAULT NULL,
  `lot_step` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `rate`
--

CREATE TABLE `rate` (
  `rate_id` int(11) NOT NULL,
  `lot_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `rate_date` datetime DEFAULT NULL,
  `rate_price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `user_password` varchar(50) DEFAULT NULL,
  `user_signup_date` date DEFAULT NULL,
  `user_image` text DEFAULT NULL,
  `user_contact` varchar(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categ_id`),
  ADD UNIQUE KEY `categ_name` (`categ_name`);

--
-- Индексы таблицы `lots`
--
ALTER TABLE `lots`
  ADD PRIMARY KEY (`lot_id`),
  ADD KEY `categ_index` (`lot_categ_id`),
  ADD KEY `user_index` (`lot_user_id`),
  ADD KEY `winner_index` (`lot_winner_id`);

--
-- Индексы таблицы `rate`
--
ALTER TABLE `rate`
  ADD PRIMARY KEY (`rate_id`),
  ADD KEY `rate_lot_index` (`lot_id`),
  ADD KEY `rate_user_index` (`user_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_name` (`user_name`),
  ADD UNIQUE KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `categ_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `lots`
--
ALTER TABLE `lots`
  MODIFY `lot_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `rate`
--
ALTER TABLE `rate`
  MODIFY `rate_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `lots`
--
ALTER TABLE `lots`
  ADD CONSTRAINT `lots_fk1` FOREIGN KEY (`lot_user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `lots_fk2` FOREIGN KEY (`lot_categ_id`) REFERENCES `categories` (`categ_id`),
  ADD CONSTRAINT `lots_fk3` FOREIGN KEY (`lot_winner_id`) REFERENCES `users` (`user_id`);

--
-- Ограничения внешнего ключа таблицы `rate`
--
ALTER TABLE `rate`
  ADD CONSTRAINT `rate_fk1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `rate_fk2` FOREIGN KEY (`user_id`) REFERENCES `lots` (`lot_user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
