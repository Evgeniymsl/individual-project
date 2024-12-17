-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Дек 17 2024 г., 08:53
-- Версия сервера: 8.0.30
-- Версия PHP: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `ind-project`
--

-- --------------------------------------------------------

--
-- Структура таблицы `adress`
--

CREATE TABLE `adress` (
  `id` bigint UNSIGNED NOT NULL,
  `adress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` int NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `baskets`
--

CREATE TABLE `baskets` (
  `id` int NOT NULL,
  `id_product` bigint UNSIGNED NOT NULL,
  `count` int NOT NULL,
  `prise` int NOT NULL,
  `user_id` int NOT NULL,
  `boolean` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Спортивная одежда', '2024-11-20 12:08:15', '2024-11-20 12:08:15'),
(3, 'Беговые ботинки', '2024-12-13 03:46:10', '2024-12-13 03:46:10'),
(4, 'Тренажерный зал', '2024-12-13 03:46:10', '2024-12-13 03:46:10'),
(5, 'Футбольное оборудование', '2024-12-13 03:46:10', '2024-12-13 03:46:10'),
(6, 'Баскетбольное оборудование', '2024-12-13 03:46:10', '2024-12-13 03:46:10'),
(7, 'Водные виды спорта', '2024-12-13 03:46:10', '2024-12-16 02:11:22'),
(8, 'Другое название категории', '2024-12-16 02:11:33', '2024-12-17 01:03:06'),
(9, 'Еще одна', '2024-12-17 01:03:16', '2024-12-17 01:03:16');

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_09_10_112652_create_categories_table', 1),
(6, '2024_09_12_075539_create_tovar_table', 1),
(7, '2024_09_12_081229_create_adress_table', 1),
(8, '2024_09_12_081637_create_order_table', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `orderDetail`
--

CREATE TABLE `orderDetail` (
  `id` int NOT NULL,
  `id_user` int NOT NULL,
  `id_order` int NOT NULL,
  `id_product` int NOT NULL,
  `count` int NOT NULL,
  `prise` int NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `orderDetail`
--

INSERT INTO `orderDetail` (`id`, `id_user`, `id_order`, `id_product`, `count`, `prise`, `created_at`, `updated_at`) VALUES
(7, 12, 8, 55, 2, 60000, '2024-12-16 02:15:36', '2024-12-16 02:15:36');

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `id_user` int NOT NULL,
  `status` enum('новый','выполняется','завершен') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `id_user`, `status`, `created_at`, `updated_at`) VALUES
(8, 12, 'выполняется', '2024-12-16 02:15:36', '2024-12-17 02:52:03');

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `tovars`
--

CREATE TABLE `tovars` (
  `id` bigint UNSIGNED NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int NOT NULL,
  `categories_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `tovars`
--

INSERT INTO `tovars` (`id`, `image`, `name`, `description`, `price`, `categories_id`, `created_at`, `updated_at`) VALUES
(54, 'images/shoes-1.jpg', 'Беговые ботинки Nike Air Zoom', 'Легкие беговые ботинки с хорошей поддержкой', 8000, 3, '2024-12-13 04:10:26', '2024-12-13 04:10:26'),
(55, 'images/gym-1.jpg', 'Тренажерный зал Bodycraft FT Max', 'Комплексный тренажер для полного тела тренировок', 30000, 4, '2024-12-13 04:10:26', '2024-12-13 04:10:26'),
(56, 'images/football-1.jpg', 'Футбольный мяч Adidas Telstar 18+', 'Стандартный мяч для футбола', 3000, 5, '2024-12-13 04:10:26', '2024-12-13 04:10:26'),
(57, 'images/basketball-1.jpg', 'Металлический кольцевой бросок Spalding NBA Authentic Rim', 'Для баскетбольных тренировок и игр', 5000, 6, '2024-12-13 04:10:26', '2024-12-13 04:10:26'),
(58, 'images/swim-1.jpg', 'Плавательская маска Speedo Vanquisher Adult Mask', 'Для взрослых пловцов', 1000, 7, '2024-12-13 04:10:26', '2024-12-13 04:10:26'),
(59, 'images/wear-1.jpg', 'Спринтерские штаны Nike Dri-FIT', 'Легкая спортивная одежда для быстрого бега', 10000, 3, '2024-12-13 04:10:26', '2024-12-16 01:55:59'),
(60, 'images/shoes-2.jpg', 'Топка Adidas Predator', 'Для футбола и тренировок', 8000, 5, '2024-12-13 04:10:26', '2024-12-13 04:10:26'),
(61, 'images/swim-2.jpg', 'Плавкоадра Speedo Fastskin', 'Для скорости в плавании', 5000, 7, '2024-12-13 04:10:26', '2024-12-13 04:10:26'),
(62, 'images/wear-2.jpg', 'Беговая формула Nike', 'Комплексный набор для бега', 13000, 7, '2024-12-13 04:10:26', '2024-12-16 01:56:06'),
(63, 'images/basketball-2.jpg', 'Топка Spalding NBA Authentic Rim', 'Для баскетбола и тренировок', 8000, 6, '2024-12-13 04:10:26', '2024-12-13 04:10:26'),
(64, 'images/wear-3.jpg', 'Шапочка для скейта Vans', 'Для защиты головы при катании', 3000, 5, '2024-12-13 04:10:26', '2024-12-16 01:56:13'),
(65, 'images/wear-4.jpg', 'Спринтерская куртка Adidas', 'Легкая спортивная одежда для быстрой экипировки', 8000, 3, '2024-12-13 04:10:26', '2024-12-16 01:56:49'),
(66, 'images/wear-5.jpg', 'Гольф шорты Nike', 'Для гольфа и тренировок', 7500, 1, '2024-12-13 04:10:26', '2024-12-17 01:04:01'),
(67, 'images/shoes-3.jpg', 'Беговые ботинки Asics Gel-Kayano', 'Для длинных пробежек', 10000, 3, '2024-12-13 04:10:26', '2024-12-13 04:10:26'),
(68, 'images/football-2.jpg', 'Топка Adidas Predator', 'Для футбола и тренировок', 8000, 5, '2024-12-13 04:10:26', '2024-12-13 04:10:26'),
(69, 'images/swim-3.jpg', 'Плавкоадра Speedo Fastskin', 'Для скорости в плавании', 5000, 7, '2024-12-13 04:10:26', '2024-12-13 04:10:26');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `patronymic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `login` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` enum('user','admin') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `surname`, `patronymic`, `login`, `email`, `password`, `created_at`, `updated_at`, `role`) VALUES
(7, 'admin', 'admin', 'admin', 'admin', 'admin@admin', '$2y$10$xqt3M5lZdAti4TkgAOUw9.NFMmCGYr8QCZLffsgGNJwWZVLJoFGiW', '2024-11-28 05:10:13', '2024-11-28 05:10:13', 'admin'),
(11, 'max', 'max', 'max', 'max', 'max@max', '$2y$10$G3JsKFtL4QZbMKKLe2MxZuz.ahUDdcjSkqcmbn5JISJ0Od9voA36y', '2024-12-14 03:40:37', '2024-12-14 03:40:37', 'admin'),
(12, 'user', 'user', 'user', 'user', 'user@mail.ru', '$2y$10$vheUEWagidUvFbIKWTKmI.v3sYUskUi5dYxEBS3cxNbuu3OBX8AE.', '2024-12-16 02:15:20', '2024-12-16 02:15:20', 'user');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `adress`
--
ALTER TABLE `adress`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `baskets`
--
ALTER TABLE `baskets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_product` (`id_product`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `orderDetail`
--
ALTER TABLE `orderDetail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_order` (`id_order`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_product` (`id_product`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Индексы таблицы `tovars`
--
ALTER TABLE `tovars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tovars_categories_id_foreign` (`categories_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `adress`
--
ALTER TABLE `adress`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `baskets`
--
ALTER TABLE `baskets`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `orderDetail`
--
ALTER TABLE `orderDetail`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `tovars`
--
ALTER TABLE `tovars`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `baskets`
--
ALTER TABLE `baskets`
  ADD CONSTRAINT `baskets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_baskets_id_product` FOREIGN KEY (`id_product`) REFERENCES `tovars` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `orderDetail`
--
ALTER TABLE `orderDetail`
  ADD CONSTRAINT `orderdetail_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orderdetail_ibfk_2` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `tovars`
--
ALTER TABLE `tovars`
  ADD CONSTRAINT `tovars_ibfk_1` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
