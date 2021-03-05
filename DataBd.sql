-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3000
-- Время создания: Мар 05 2021 г., 11:58
-- Версия сервера: 5.6.38
-- Версия PHP: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `DataBd`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `categ_id` int(11) NOT NULL,
  `categ_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`categ_id`, `categ_name`) VALUES
(3, 'Ботинки'),
(1, 'Доски и лыжи'),
(5, 'Инструменты'),
(2, 'Крепления'),
(4, 'Одежда'),
(6, 'Разное');

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
  `lot_discr` text,
  `lot_cr_date` datetime DEFAULT NULL,
  `lot_img` text,
  `lot_first_price` int(11) DEFAULT NULL,
  `lot_comp_date` datetime DEFAULT NULL,
  `lot_step` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `lots`
--

INSERT INTO `lots` (`lot_id`, `lot_categ_id`, `lot_user_id`, `lot_winner_id`, `lot_name`, `lot_discr`, `lot_cr_date`, `lot_img`, `lot_first_price`, `lot_comp_date`, `lot_step`) VALUES
(1, 2, 1, NULL, '2014 Rossignol District Snowboard', 'info', NULL, 'img/lot-1.jpg', 10999, NULL, NULL),
(2, 2, 1, NULL, '2014 Rossignol District Snowboard Black Edition', 'info', NULL, 'img/lot-2.jpg', 159999, NULL, 1000),
(3, 3, NULL, NULL, 'Крепления Union Contact Pro 2015 года размер L/XL', 'info', NULL, 'img/lot-3.jpg', 8000, NULL, NULL),
(4, 4, NULL, NULL, 'Ботинки для сноуборда DC Mutiny Charocal', 'info', NULL, 'img/lot-4.jpg', 10999, NULL, NULL),
(5, 5, NULL, NULL, 'Куртка для сноуборда DC Mutiny Charocal', 'info', NULL, 'img/lot-5.jpg', 7500, NULL, NULL),
(8, 6, 2, NULL, 'Маска Oakley Canopy', 'info', NULL, 'img/lot-6.jpg', 5400, NULL, 500);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `rate`
--

INSERT INTO `rate` (`rate_id`, `lot_id`, `user_id`, `rate_date`, `rate_price`) VALUES
(11, 2, 1, '2021-03-05 11:36:07', 1000),
(12, 6, 2, '2021-03-05 11:36:07', 500);

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
  `user_image` text,
  `user_contact` varchar(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_email`, `user_password`, `user_signup_date`, `user_image`, `user_contact`) VALUES
(1, 'Admin', 'admin@mail.ru', 'admin', '2021-03-05', NULL, NULL),
(2, 'Neadmin', 'neadmin@gmail.com', 'rerfhtre', '2021-03-05', NULL, NULL);

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
  MODIFY `categ_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `lots`
--
ALTER TABLE `lots`
  MODIFY `lot_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `rate`
--
ALTER TABLE `rate`
  MODIFY `rate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
