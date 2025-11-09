-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Anamakine: localhost:3306
-- Üretim Zamanı: 29 Kas 2021, 23:14:55
-- Sunucu sürümü: 10.3.31-MariaDB-cll-lve
-- PHP Sürümü: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `tek_database`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `crons`
--

CREATE TABLE `crons` (
  `cron_id` int(11) NOT NULL,
  `cron_name` varchar(50) NOT NULL,
  `cron_operation` varchar(200) NOT NULL,
  `cron_updefault` int(11) NOT NULL DEFAULT 1,
  `cron_endup` int(11) NOT NULL,
  `cron_date_update` timestamp NOT NULL DEFAULT current_timestamp(),
  `cron_status` int(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `crons`
--

INSERT INTO `crons` (`cron_id`, `cron_name`, `cron_operation`, `cron_updefault`, `cron_endup`, `cron_date_update`, `cron_status`) VALUES
(1, 'Api Orders', 'Api Sipariş', 1, 1, '2021-11-29 18:37:18', 1),
(2, 'Site Orders', 'Dripfeed Kontrolü', 2, 2, '2021-11-29 18:24:15', 1),
(3, 'DripFeed', 'Sipariş Kontrolü\r\n', 1, 1, '2021-11-29 18:21:21', 1),
(4, 'Sync', 'API Sağlayıcı Kontrolü', 1, 1, '2021-11-29 18:21:22', 1),
(5, 'Providers', 'Sağlayıcı ', 15, 15, '2021-11-29 18:21:23', 1),
(6, 'Send Task', 'Görev Gönderme', 1, 1, '2021-11-03 14:31:05', 1),
(7, 'Balance Alert', 'Balance alert', 1, 1, '2021-11-29 18:21:24', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `crons_report`
--

CREATE TABLE `crons_report` (
  `crons_id` int(11) NOT NULL,
  `crons_service_name` varchar(255) NOT NULL,
  `crons_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `crons_detail` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `crons`
--
ALTER TABLE `crons`
  ADD PRIMARY KEY (`cron_id`);

--
-- Tablo için indeksler `crons_report`
--
ALTER TABLE `crons_report`
  ADD PRIMARY KEY (`crons_id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `crons`
--
ALTER TABLE `crons`
  MODIFY `cron_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Tablo için AUTO_INCREMENT değeri `crons_report`
--
ALTER TABLE `crons_report`
  MODIFY `crons_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
