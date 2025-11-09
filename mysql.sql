-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Anamakine: localhost:3306
-- Üretim Zamanı: 01 Ara 2021, 09:23:04
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
-- Veritabanı: `tek_patates`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `bank_accounts`
--

CREATE TABLE `bank_accounts` (
  `id` int(11) NOT NULL,
  `bank_name` varchar(225) NOT NULL,
  `bank_sube` varchar(225) NOT NULL,
  `bank_hesap` varchar(225) NOT NULL,
  `bank_iban` text DEFAULT NULL,
  `bank_alici` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `blogs`
--

CREATE TABLE `blogs` (
  `id` int(11) NOT NULL,
  `blog_title` text COLLATE utf8mb4_bin DEFAULT NULL,
  `blog_image` text CHARACTER SET utf8 DEFAULT NULL,
  `blog_content` text COLLATE utf8mb4_bin DEFAULT NULL,
  `blog_created` text CHARACTER SET utf8 NOT NULL,
  `url` varchar(225) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` text COLLATE utf8mb4_bin NOT NULL,
  `name_lang` text COLLATE utf8mb4_bin NOT NULL,
  `category_line` double NOT NULL,
  `category_type` enum('1','2') CHARACTER SET utf8 NOT NULL DEFAULT '2',
  `category_secret` enum('1','2') COLLATE utf8mb4_bin NOT NULL DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `child_panels`
--

CREATE TABLE `child_panels` (
  `id` int(11) NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `panel_domain` text DEFAULT NULL,
  `panel_currency` text DEFAULT NULL,
  `panel_status` varchar(225) NOT NULL DEFAULT 'pending',
  `panel_price` text DEFAULT NULL,
  `panel_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `clients`
--

CREATE TABLE `clients` (
  `client_id` int(11) NOT NULL,
  `first_name` varchar(225) DEFAULT NULL,
  `last_name` varchar(225) DEFAULT NULL,
  `email` varchar(225) NOT NULL,
  `username` varchar(225) NOT NULL,
  `password` text NOT NULL,
  `telephone` varchar(225) DEFAULT NULL,
  `balance` double NOT NULL DEFAULT 0,
  `balance_type` enum('1','2') NOT NULL DEFAULT '2',
  `debit_limit` double NOT NULL,
  `spent` double NOT NULL DEFAULT 0,
  `register_date` datetime NOT NULL,
  `login_date` datetime DEFAULT NULL,
  `login_ip` varchar(225) NOT NULL,
  `register_ip` varchar(225) NOT NULL,
  `apikey` text NOT NULL,
  `client_type` enum('1','2') NOT NULL DEFAULT '2' COMMENT '2 -> ON, 1 -> OFF',
  `access` text DEFAULT NULL,
  `lang` varchar(255) NOT NULL DEFAULT 'tr',
  `timezone` double NOT NULL DEFAULT 0,
  `admin_theme` enum('1','2') NOT NULL DEFAULT '1',
  `referral` varchar(225) DEFAULT NULL,
  `referral_code` varchar(225) NOT NULL,
  `refchar` varchar(225) NOT NULL DEFAULT '0',
  `reforder` varchar(225) NOT NULL DEFAULT '0',
  `total_click` varchar(225) NOT NULL DEFAULT '0',
  `sms_verify` int(11) NOT NULL DEFAULT 1,
  `mail_verify` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `clients`
--

INSERT INTO `clients` (`client_id`, `first_name`, `last_name`, `email`, `username`, `password`, `telephone`, `balance`, `balance_type`, `debit_limit`, `spent`, `register_date`, `login_date`, `login_ip`, `register_ip`, `apikey`, `client_type`, `access`, `lang`, `timezone`, `admin_theme`, `referral`, `referral_code`, `refchar`, `reforder`, `total_click`, `sms_verify`, `mail_verify`) VALUES
(1, 'İsim', 'Soyisim', 'isimsoyisim@gmail.com', 'yonetici', 'd2da1e9f79c6ca6d5d60c7a2b8673c5a', '0 555 555 55 55', 0, '1', 0, 0, '2020-08-17 05:38:14', '2021-12-01 09:20:47', '176.232.62.47', '', '7023beb2b9a1978a8afc6de6eb9bd062', '2', '{\"admin_access\":\"1\",\"users\":\"1\",\"orders\":\"1\",\"subscriptions\":\"1\",\"dripfeed\":\"1\",\"tasks\":\"1\",\"services\":\"1\",\"payments\":\"1\",\"tickets\":\"1\",\"reports\":\"1\",\"general_settings\":\"1\",\"pages\":\"1\",\"blog\":\"1\",\"seo\":\"1\",\"menu\":\"1\",\"subject\":\"1\",\"child_panels\":\"1\",\"payments_settings\":\"1\",\"bank_accounts\":\"1\",\"payments_bonus\":\"1\",\"alert_settings\":\"1\",\"providers\":\"1\",\"modules\":\"1\",\"themes\":\"1\",\"language\":\"1\",\"logs\":\"1\",\"crons\":\"1\",\"provider_logs\":\"1\",\"guard_logs\":\"1\",\"admins\":\"1\"}', 'tr', 0, '1', '', 'c6jHQy', '0', '0', '0', 2, 2);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `clients_category`
--

CREATE TABLE `clients_category` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `clients_price`
--

CREATE TABLE `clients_price` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `service_price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `clients_service`
--

CREATE TABLE `clients_service` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `client_report`
--

CREATE TABLE `client_report` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `action` text NOT NULL,
  `report_ip` varchar(225) NOT NULL,
  `report_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `client_report`
--

INSERT INTO `client_report` (`id`, `client_id`, `action`, `report_ip`, `report_date`) VALUES
(1, 1, 'Admin girişi yapıldı.', '176.232.62.47', '2021-12-01 09:20:47');

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
(1, 'Api Orders', 'Api Sipariş', 1, 1, '2021-12-01 06:21:44', 1),
(2, 'Site Orders', 'Dripfeed Kontrolü', 2, 2, '2021-12-01 06:21:47', 1),
(3, 'DripFeed', 'Sipariş Kontrolü\r\n', 1, 1, '2021-12-01 06:21:48', 1),
(4, 'Sync', 'API Sağlayıcı Kontrolü', 1, 1, '2021-12-01 06:21:49', 1),
(5, 'Providers', 'Sağlayıcı ', 15, 15, '2021-12-01 06:21:51', 1),
(6, 'Send Task', 'Görev Gönderme', 1, 1, '2021-12-01 06:21:52', 1),
(7, 'Balance Alert', 'Balance alert', 1, 1, '2021-12-01 06:21:53', 1);

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

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `files`
--

CREATE TABLE `files` (
  `id` int(11) NOT NULL,
  `link` text DEFAULT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `guard_log`
--

CREATE TABLE `guard_log` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `action` varchar(225) NOT NULL,
  `date` varchar(225) NOT NULL,
  `ip` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `integrations`
--

CREATE TABLE `integrations` (
  `id` int(11) NOT NULL,
  `name` varchar(225) NOT NULL,
  `description` varchar(225) NOT NULL,
  `icon_url` varchar(225) NOT NULL,
  `code` text NOT NULL,
  `visibility` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `integrations`
--

INSERT INTO `integrations` (`id`, `name`, `description`, `icon_url`, `code`, `visibility`, `status`) VALUES
(1, 'Beamer', 'Uygulama içi bildirim merkezi, widget\'lar ve değişiklik günlüğü ile güncellemeleri duyurun ve geri bildirim alın', '/img/integrations/Beamer.svg', '', 1, 1),
(2, 'Getsitecontrol', 'Web sitesi ziyaretçilerinin herhangi bir işlem yapmadan web sitenizden ayrılmalarını önlemenize yardımcı olur.', '/img/integrations/Getsitecontrol.svg', '', 1, 1),
(3, 'Google Analytics', 'Arama motoru optimizasyonu (SEO) ve pazarlama amaçları için istatistikler ve temel analitik araçlar', '/img/integrations/Google%20Analytics.svg', '', 1, 1),
(4, 'Google Tag manager', 'Basit etiket yönetimi çözümlerini kullanarak kodu düzenlemeden tüm web sitesi etiketlerinizi yönetin', '/img/integrations/Google%20Tag%20manager.svg', '', 1, 1),
(5, 'JivoChat', 'Müşterilerle konuşmak için hepsi bir arada iş habercisi: canlı sohbet, telefon, e-posta ve sosyal', '/img/integrations/JivoChat.svg', '', 1, 1),
(6, 'Onesignal', 'Müşteri etkileşiminde lider, mobil push, web push, e-posta, uygulama içi mesajları güçlendiriyor', '/img/integrations/Onesignal.svg', '', 1, 1),
(7, 'Push alert', 'Masaüstü ve mobil cihazlarda Push Bildirimleri ile erişimi, geliri artırın, kullanıcıları yeniden hedefleyin', '/img/integrations/Push%20alert.svg', '', 1, 1),
(8, 'Smartsupp', 'Tek bir müşteri mesajlaşma platformunda canlı sohbet, e-posta gelen kutusu ve Facebook Messenger', '/img/integrations/Smartsupp.svg', '', 1, 1),
(9, 'Tawk.to', 'Ziyaretçileri web sitenizde, mobil uygulamanızda veya ücretsiz özelleştirilebilir bir sayfadan izleyin ve sohbet edin', '/img/integrations/Tawk.to.svg', '', 1, 1),
(10, 'Tidio', 'Canlı sohbet, sohbet robotları, Messenger ve e-postaları tek bir yerde tutan işletmeler için Communicator', '/img/integrations/Tidio.svg', '', 1, 1),
(11, 'Zendesk Chat', 'Müşteri sorularına hızlı bir şekilde yanıt vermeye, bekleme sürelerini azaltmaya ve satışları artırmaya yardımcı olur', '/img/integrations/Zendesk%20Chat.svg', '', 1, 1),
(12, 'Getbutton.io', 'Popüler mesajlaşma uygulamaları aracılığıyla web sitesi ziyaretçileriyle sohbet edin. Whatsapp, messenger vb. iletişim butonu.', '/img/integrations/Getbutton.svg', '', 1, 1),
(13, 'Google reCAPTCHA v2', 'Kötü amaçlı yazılımların web sitenizde kötüye kullanım faaliyetlerine girmesini önlemek için gelişmiş bir risk analizi motoru ve uyarlanabilir zorluklar kullanır.', '/img/integrations/reCAPTCHA.svg', '', 1, 1),
(14, 'SEO Ayarlamaları', 'Arama Motoru Optimizasyonu (SEO), Web sitelerinin arama motorlarında daha iyi performans göstermesi için yapılan çalışmaların tümüne verilen isimdir.', '/img/integrations/Seo settings.png', '', 1, 2);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `language_name` varchar(225) NOT NULL,
  `language_code` varchar(225) NOT NULL,
  `language_type` enum('2','1') NOT NULL DEFAULT '2',
  `default_language` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `languages`
--

INSERT INTO `languages` (`id`, `language_name`, `language_code`, `language_type`, `default_language`) VALUES
(1, 'Türkçe', 'tr', '2', '1');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `name` varchar(225) CHARACTER SET utf8 NOT NULL,
  `tag` varchar(225) CHARACTER SET utf8 NOT NULL,
  `status` int(11) NOT NULL,
  `public` int(11) NOT NULL,
  `edit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `menu`
--

INSERT INTO `menu` (`id`, `name`, `tag`, `status`, `public`, `edit`) VALUES
(2, 'API', 'api', 1, 1, 0),
(3, 'Kullanıcı Sözleşmesi', 'terms', 1, 1, 0),
(4, 'Sıkça Sorulan Sorular', 'faq', 1, 1, 0),
(5, 'Blog <span class=\"fa fa-info-circle\" data-toggle=\"tooltip\" data-placement=\"top\"></span>', 'blog', 1, 1, 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `modules`
--

CREATE TABLE `modules` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `ajax_name` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 2,
  `mod_sec` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `modules`
--

INSERT INTO `modules` (`id`, `name`, `description`, `ajax_name`, `status`, `mod_sec`) VALUES
(1, 'Referans Sistemi', 'Mevcut kullanıcılar yeni kullanıcıları davet eder ve tüm ödemelerinden komisyon alır. Kullanıcılar, minimum ödemeye ulaştıklarında ödeme talep edebilir.', 'module_ref', 1, 1),
(2, 'Child panel satışı', 'Yalnızca sizden API çekebilen, sınırlı özelliklere sahip bir panel. Kullanıcılar panelinizden child paneller sipariş edebilir.', 'module_child', 1, 1),
(3, 'Ücretsiz Bakiye', 'Yeni kayıt olan üyeler için bir defalık ücretsiz otomatik bakiye.', 'module_balance', 1, 1),
(4, 'Destek Sistemi', 'Ekleyeceğiniz başıklara gireceğiniz hazır cevaplar, yeni destek talebi oluşturan müşterilere otomatik olarak gönderilir.', '', 2, 1),
(6, 'Guard (Koruma)', '7/24 Maksimum güvenlik, tüm faaliyetleri sınırlandırın! Saldırılara karşı %100 koruma.', 'module_guard', 1, 2),
(7, 'Cache (Önbellekleme)', 'Sitenin kaynak tüketimi azaltılarak site hızını arttırır daha verimli bir sistem ortaya çıkarmak amaçlanır.', 'module_cache', 1, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `news_icon` varchar(225) NOT NULL,
  `news_title` varchar(225) NOT NULL,
  `news_content` varchar(225) NOT NULL,
  `news_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `api_orderid` int(11) NOT NULL DEFAULT 0,
  `order_error` text NOT NULL,
  `order_detail` text NOT NULL,
  `order_api` int(11) NOT NULL DEFAULT 0,
  `api_serviceid` int(11) NOT NULL DEFAULT 0,
  `api_charge` double DEFAULT NULL,
  `api_currencycharge` double NOT NULL DEFAULT 1,
  `order_profit` double NOT NULL,
  `order_quantity` double NOT NULL,
  `order_extras` text NOT NULL,
  `order_charge` double DEFAULT NULL,
  `dripfeed` enum('1','2','3') DEFAULT '1' COMMENT '2 -> ON, 1 -> OFF',
  `dripfeed_id` double NOT NULL DEFAULT 0,
  `subscriptions_id` double NOT NULL DEFAULT 0,
  `subscriptions_type` enum('1','2') NOT NULL DEFAULT '1' COMMENT '2 -> ON, 1 -> OFF',
  `dripfeed_totalcharges` double DEFAULT NULL,
  `dripfeed_runs` double DEFAULT NULL,
  `dripfeed_delivery` double NOT NULL DEFAULT 0,
  `dripfeed_interval` double DEFAULT NULL,
  `dripfeed_totalquantity` double DEFAULT NULL,
  `dripfeed_status` enum('active','completed','canceled') NOT NULL DEFAULT 'active',
  `order_url` text NOT NULL,
  `order_start` double NOT NULL DEFAULT 0,
  `order_finish` double NOT NULL DEFAULT 0,
  `order_remains` double NOT NULL DEFAULT 0,
  `order_create` datetime NOT NULL,
  `order_status` enum('pending','inprogress','completed','partial','processing','canceled') NOT NULL DEFAULT 'pending',
  `subscriptions_status` enum('active','paused','completed','canceled','expired','limit') NOT NULL DEFAULT 'active',
  `subscriptions_username` text DEFAULT NULL,
  `subscriptions_posts` double DEFAULT NULL,
  `subscriptions_delivery` double NOT NULL DEFAULT 0,
  `subscriptions_delay` double DEFAULT NULL,
  `subscriptions_min` double DEFAULT NULL,
  `subscriptions_max` double DEFAULT NULL,
  `subscriptions_expiry` date DEFAULT NULL,
  `last_check` datetime NOT NULL,
  `order_where` enum('site','api') NOT NULL DEFAULT 'site'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `pages`
--

CREATE TABLE `pages` (
  `page_id` int(11) NOT NULL,
  `page_name` varchar(225) NOT NULL,
  `page_get` varchar(225) NOT NULL,
  `page_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `pages`
--

INSERT INTO `pages` (`page_id`, `page_name`, `page_get`, `page_content`) VALUES
(1, 'Giriş Yap', 'auth', ''),
(2, 'Servisler', 'services', ''),
(3, 'Sıkça Sorulan Sorular', 'faq', ''),
(4, 'Sözleşmeler', 'terms', ''),
(5, 'Yeni Sipariş', 'neworder', ''),
(6, 'Bakiye Ekle', 'addfunds', ''),
(7, 'Child panels', 'child-panels', ''),
(8, 'Destek', 'tickets', ''),
(9, 'Davet Et Kazan', 'affiliates', '');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `client_balance` double NOT NULL DEFAULT 0,
  `payment_amount` double NOT NULL,
  `papara_amount` double DEFAULT NULL,
  `payment_privatecode` double DEFAULT NULL,
  `payment_method` int(11) NOT NULL,
  `payment_status` enum('1','2','3') NOT NULL DEFAULT '1',
  `payment_delivery` enum('1','2') NOT NULL DEFAULT '1',
  `payment_note` text NOT NULL,
  `payment_mode` enum('Manuel','Otomatik') NOT NULL DEFAULT 'Otomatik',
  `payment_create_date` datetime NOT NULL,
  `payment_update_date` datetime NOT NULL,
  `payment_ip` varchar(225) NOT NULL,
  `payment_extra` text NOT NULL,
  `payment_bank` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `payments_bonus`
--

CREATE TABLE `payments_bonus` (
  `bonus_id` int(11) NOT NULL,
  `bonus_method` int(11) NOT NULL,
  `bonus_from` double NOT NULL,
  `bonus_amount` double NOT NULL,
  `bonus_type` enum('1','2') NOT NULL DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` int(11) NOT NULL,
  `method_name` varchar(225) NOT NULL,
  `method_get` varchar(225) NOT NULL,
  `method_min` double NOT NULL,
  `method_max` double NOT NULL,
  `method_type` enum('1','2') NOT NULL DEFAULT '2' COMMENT '2 -> ON, 1 -> OFF	',
  `method_extras` text NOT NULL,
  `method_line` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `method_name`, `method_get`, `method_min`, `method_max`, `method_type`, `method_extras`, `method_line`) VALUES
(1, 'Paytr', 'paytr', 1, 0, '1', '{\"method_type\":\"2\",\"name\":\"Paytr\",\"min\":\"1\",\"max\":\"0\",\"merchant_id\":\"\",\"merchant_key\":\"\",\"merchant_salt\":\"\",\"fee\":\"0\"}', 1),
(2, 'Paytrhavale', 'paytr_havale', 1, 0, '1', '{\"method_type\":\"2\",\"name\":\"Paytrhavale\",\"min\":\"1\",\"max\":\"0\",\"merchant_id\":\"\",\"merchant_key\":\"\",\"merchant_salt\":\"\",\"fee\":\"0\"}', 2),
(3, 'Paywant', 'paywant', 1, 0, '1', '{\"method_type\":\"2\",\"name\":\"Paywant\",\"min\":\"1\",\"max\":\"0\",\"apiKey\":\"\",\"apiSecret\":\"\",\"fee\":\"0\",\"commissionType\":\"2\",\"payment_type\":[\"1\",\"2\",\"3\"]}', 3),
(4, 'Shopier', 'shopier', 1, 0, '1', '{\"method_type\":\"2\",\"name\":\"Shopier\",\"min\":\"1\",\"max\":\"0\",\"apiKey\":\"\",\"apiSecret\":\"\",\"website_index\":\"1\",\"processing_fee\":\"1\",\"fee\":\"4,99\"}', 4),
(5, 'Shoplemo', 'shoplemo', 1, 0, '1', '{\"method_type\":\"2\",\"name\":\"Shoplemo\",\"min\":\"1\",\"max\":\"0\",\"apiKey\":\"\",\"apiSecret\":\"\",\"fee\":\"0\"}', 5),
(6, 'CoinPayments', 'coinpayments', 1, 0, '1', '{\"method_type\":\"2\",\"name\":\"Coinpayments\",\"min\":\"1\",\"max\":\"0\",\"coinpayments_public_key\":\"\",\"coinpayments_private_key\":\"\",\"coinpayments_currency\":\"\",\"merchant_id\":\"\",\"ipn_secret\":\"\",\"fee\":\"\"}', 7),
(7, 'Banka Ödemeleri', 'havale-eft', 0, 0, '1', '{\"method_type\":\"2\",\"name\":\"Banka Ödemeleri\"}', 10),
(9, '2checkout', '2checkout', 1, 0, '1', '{\"method_type\":\"2\",\"name\":\"2checkout\",\"min\":\"1\",\"max\":\"0\",\"seller_id\":\"\",\"private_key\":\"\",\"currency\":\"\",\"fee\":\"\"}', 8),
(12, 'PayTM', 'paytm', 1, 0, '1', '{\"method_type\":\"2\",\"name\":\"Paytm\",\"min\":\"1\",\"max\":\"0\",\"merchant_key\":\"\",\"merchant_mid\":\"\",\"merchant_website\":\"\",\"currency\":\"INR\",\"fee\":\"\"}', 9),
(13, 'Weepay', 'weepay', 1, 0, '1', '{\"method_type\":\"2\",\"name\":\"Weepay\",\"min\":\"1\",\"max\":\"0\",\"bayi_id\":\"\",\"api_key\":\"\",\"secret_key\":\"\",\"currency\":\"USD\",\"fee\":\"0\"}', 6);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `proxy`
--

CREATE TABLE `proxy` (
  `id` int(11) NOT NULL,
  `user` varchar(225) CHARACTER SET utf8 NOT NULL,
  `pass` varchar(225) CHARACTER SET utf8 NOT NULL,
  `ip` varchar(225) CHARACTER SET utf8 DEFAULT NULL,
  `port` varchar(225) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `referral`
--

CREATE TABLE `referral` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `refferal` int(11) NOT NULL,
  `action` text CHARACTER SET utf8 NOT NULL,
  `register_date` varchar(225) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `reset_log`
--

CREATE TABLE `reset_log` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `token` varchar(225) NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `serviceapi_alert`
--

CREATE TABLE `serviceapi_alert` (
  `id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `serviceapi_alert` text NOT NULL,
  `servicealert_extra` text NOT NULL,
  `servicealert_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `services`
--

CREATE TABLE `services` (
  `service_id` int(11) NOT NULL,
  `service_api` int(11) NOT NULL DEFAULT 0,
  `api_service` int(11) NOT NULL DEFAULT 0,
  `api_servicetype` enum('1','2') CHARACTER SET utf8 NOT NULL DEFAULT '2',
  `api_detail` text CHARACTER SET utf8 NOT NULL,
  `category_id` int(11) NOT NULL,
  `service_line` double NOT NULL,
  `service_type` enum('1','2') CHARACTER SET utf8 NOT NULL DEFAULT '2',
  `service_package` enum('1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17') CHARACTER SET utf8 NOT NULL,
  `service_name` text NOT NULL,
  `service_description` text NOT NULL,
  `service_price` double NOT NULL DEFAULT 0,
  `sync_price` int(11) NOT NULL,
  `sync_rate` int(11) NOT NULL,
  `service_min` double NOT NULL,
  `sync_min` int(11) NOT NULL,
  `service_max` double NOT NULL,
  `sync_max` int(11) NOT NULL,
  `service_dripfeed` enum('1','2') CHARACTER SET utf8 NOT NULL DEFAULT '1',
  `service_autotime` double NOT NULL DEFAULT 0,
  `service_autopost` double NOT NULL DEFAULT 0,
  `service_speed` enum('1','2','3','4') CHARACTER SET utf8 NOT NULL,
  `want_username` enum('1','2') CHARACTER SET utf8 NOT NULL DEFAULT '1',
  `service_secret` enum('1','2') CHARACTER SET utf8 NOT NULL DEFAULT '2',
  `price_type` enum('normal','percent','amount') CHARACTER SET utf8 NOT NULL DEFAULT 'normal',
  `price_cal` text CHARACTER SET utf8 NOT NULL,
  `start_count` enum('none','instagram_follower','instagram_photo','') CHARACTER SET utf8 NOT NULL,
  `instagram_private` enum('1','2') CHARACTER SET utf8 NOT NULL,
  `name_lang` text NOT NULL,
  `description_lang` text CHARACTER SET utf8 NOT NULL,
  `cancel_type` int(11) NOT NULL DEFAULT 1,
  `refill_type` int(11) NOT NULL DEFAULT 1,
  `refill_time` int(11) NOT NULL,
  `sync_lastcheck` varchar(225) DEFAULT NULL,
  `provider_lastcheck` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `service_api`
--

CREATE TABLE `service_api` (
  `id` int(11) NOT NULL,
  `api_name` varchar(225) NOT NULL,
  `api_url` text NOT NULL,
  `api_key` varchar(225) NOT NULL,
  `api_type` int(11) NOT NULL,
  `api_limit` double NOT NULL DEFAULT 0,
  `api_alert` enum('1','2') NOT NULL DEFAULT '2' COMMENT '2 -> Gönder, 1 -> Gönderildi'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `site_logo` text DEFAULT NULL,
  `site_name` text DEFAULT NULL,
  `site_title` text NOT NULL,
  `site_description` text NOT NULL,
  `site_keywords` text NOT NULL,
  `site_currency` text NOT NULL,
  `favicon` text DEFAULT NULL,
  `site_language` varchar(225) NOT NULL DEFAULT 'tr',
  `site_theme` text NOT NULL,
  `site_timezone` int(11) NOT NULL,
  `max_ticket` int(11) NOT NULL DEFAULT 2,
  `skype_area` enum('1','2') NOT NULL DEFAULT '1',
  `name_secret` enum('1','2') NOT NULL DEFAULT '1',
  `recaptcha` enum('1','2') NOT NULL DEFAULT '1',
  `recaptcha_key` text DEFAULT NULL,
  `recaptcha_secret` text DEFAULT NULL,
  `custom_header` text DEFAULT NULL,
  `custom_footer` text DEFAULT NULL,
  `ticket_system` enum('1','2') NOT NULL DEFAULT '2',
  `register_page` enum('1','2') NOT NULL DEFAULT '2',
  `terms_checkbox` int(11) NOT NULL DEFAULT 1,
  `service_speed` enum('1','2') NOT NULL DEFAULT '2',
  `service_list` enum('1','2') NOT NULL DEFAULT '2',
  `dolar_charge` double NOT NULL,
  `euro_charge` double NOT NULL,
  `smtp_user` text NOT NULL,
  `smtp_pass` text NOT NULL,
  `smtp_server` text NOT NULL,
  `smtp_port` varchar(225) NOT NULL,
  `smtp_protocol` enum('0','ssl','tls') NOT NULL,
  `alert_type` enum('1','2','3') NOT NULL,
  `alert_newmanuelservice` enum('1','2') NOT NULL,
  `alert_newticket` enum('1','2') NOT NULL,
  `alert_apibalance` enum('1','2') NOT NULL,
  `alert_newpayment` enum('1','2') NOT NULL,
  `alert_newbankpayment` enum('1','2') NOT NULL DEFAULT '1',
  `alert_serviceapialert` enum('1','2') NOT NULL,
  `alert_failorder` enum('1','2') NOT NULL,
  `admin_mail` varchar(225) NOT NULL,
  `resetpass_page` enum('1','2') NOT NULL,
  `resetpass_email` enum('1','2') NOT NULL,
  `site_maintenance` enum('1','2') NOT NULL DEFAULT '2',
  `site_frozen` int(11) NOT NULL DEFAULT 1,
  `sms_provider` varchar(225) NOT NULL,
  `sms_title` varchar(225) NOT NULL,
  `sms_user` varchar(225) NOT NULL,
  `sms_pass` varchar(225) NOT NULL,
  `admin_telephone` varchar(225) NOT NULL,
  `resetpass_sms` enum('1','2') NOT NULL,
  `panel_selling` int(11) NOT NULL,
  `panel_price` int(11) NOT NULL,
  `free_balance` int(11) NOT NULL,
  `free_amount` int(11) NOT NULL,
  `referral` enum('1','2') NOT NULL DEFAULT '1',
  `ref_bonus` int(11) NOT NULL,
  `ref_max` int(11) NOT NULL,
  `ref_type` enum('0','1') NOT NULL DEFAULT '0',
  `cache` int(11) NOT NULL,
  `cache_time` int(11) NOT NULL,
  `guard_system_status` int(11) NOT NULL,
  `guard_services_status` int(11) NOT NULL,
  `guard_services_type` int(11) NOT NULL,
  `guard_notify_status` int(11) NOT NULL,
  `guard_notify_type` int(11) NOT NULL,
  `guard_roles_status` int(11) NOT NULL,
  `guard_roles_type` int(11) NOT NULL,
  `guard_apikey_type` int(11) NOT NULL,
  `neworder_terms` int(11) NOT NULL,
  `guard_cron_system` int(11) NOT NULL DEFAULT 1,
  `secret_key` varchar(225) NOT NULL,
  `avarage` int(11) NOT NULL,
  `sms_verify` int(11) NOT NULL DEFAULT 1,
  `mail_verify` int(11) NOT NULL DEFAULT 1,
  `ser_sync` int(11) NOT NULL,
  `auto_refill` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `settings`
--

INSERT INTO `settings` (`id`, `site_logo`, `site_name`, `site_title`, `site_description`, `site_keywords`, `site_currency`, `favicon`, `site_language`, `site_theme`, `site_timezone`, `max_ticket`, `skype_area`, `name_secret`, `recaptcha`, `recaptcha_key`, `recaptcha_secret`, `custom_header`, `custom_footer`, `ticket_system`, `register_page`, `terms_checkbox`, `service_speed`, `service_list`, `dolar_charge`, `euro_charge`, `smtp_user`, `smtp_pass`, `smtp_server`, `smtp_port`, `smtp_protocol`, `alert_type`, `alert_newmanuelservice`, `alert_newticket`, `alert_apibalance`, `alert_newpayment`, `alert_newbankpayment`, `alert_serviceapialert`, `alert_failorder`, `admin_mail`, `resetpass_page`, `resetpass_email`, `site_maintenance`, `site_frozen`, `sms_provider`, `sms_title`, `sms_user`, `sms_pass`, `admin_telephone`, `resetpass_sms`, `panel_selling`, `panel_price`, `free_balance`, `free_amount`, `referral`, `ref_bonus`, `ref_max`, `ref_type`, `cache`, `cache_time`, `guard_system_status`, `guard_services_status`, `guard_services_type`, `guard_notify_status`, `guard_notify_type`, `guard_roles_status`, `guard_roles_type`, `guard_apikey_type`, `neworder_terms`, `guard_cron_system`, `secret_key`, `avarage`, `sms_verify`, `mail_verify`, `ser_sync`, `auto_refill`) VALUES
(1, '', 'SMMPanel', '', '', '', 'TRY', '', 'tr', 'bootstrap', 0, 2, '1', '1', '1', '', '', '', '', '2', '2', 1, '1', '2', 1, 1, '', '', '', '587', '0', '3', '1', '1', '1', '1', '1', '1', '1', '', '1', '2', '2', 1, 'netgsm', '', '', '', '', '2', 1, 100, 1, 0, '1', 0, 0, '0', 1, 1, 1, 1, 1, 1, 2, 1, 1, 2, 1, 1, '', 1, 1, 1, 2, '2');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tasks`
--

CREATE TABLE `tasks` (
  `task_id` int(11) NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `task_type` varchar(225) DEFAULT NULL,
  `task_status` varchar(225) DEFAULT 'pending',
  `task_date` datetime DEFAULT NULL,
  `refill_orderid` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `themes`
--

CREATE TABLE `themes` (
  `id` int(11) NOT NULL,
  `theme_name` text NOT NULL,
  `theme_dirname` text NOT NULL,
  `theme_extras` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `themes`
--

INSERT INTO `themes` (`id`, `theme_name`, `theme_dirname`, `theme_extras`) VALUES
(2, 'Light Blue', 'lightblue', '{\"stylesheets\":[\"css/panel/lightblue/bootstrap.css\",\"css/panel/lightblue/style.css\",\"js\\/datepicker\\/css\\/bootstrap-datepicker3.min.css\",\"https:\\/\\/cdn.mypanel.link\\/css\\/font-awesome\\/css\\/all.min.css\"],\"scripts\":[\"https:\\/\\/cdnjs.cloudflare.com\\/ajax\\/libs\\/jquery\\/1.12.4\\/jquery.min.js\",\"js/panel/lightblue/script.js\",\"js/main.js\",\"js/panel/lightblue/bootstrap.js\",\"js\\/datepicker\\/js\\/bootstrap-datepicker.min.js\",\"js\\/datepicker\\/locales\\/bootstrap-datepicker.tr.min.js\"]}'),
(3, 'Yeti', 'yeti', '{\"stylesheets\":[\"css/panel/yeti/bootstrap.css\",\"css/panel/yeti/style.css\",\"js\\/datepicker\\/css\\/bootstrap-datepicker3.min.css\",\"https:\\/\\/cdn.mypanel.link\\/css\\/font-awesome\\/css\\/all.min.css\"],\"scripts\":[\"https:\\/\\/cdnjs.cloudflare.com\\/ajax\\/libs\\/jquery\\/1.12.4\\/jquery.min.js\",\"js/panel/yeti/script.js\",\"js/main.js\",\"js/panel/yeti/bootstrap.js\",\"js\\/datepicker\\/js\\/bootstrap-datepicker.min.js\",\"js\\/datepicker\\/locales\\/bootstrap-datepicker.tr.min.js\"]}'),
(4, 'United', 'united', '{\"stylesheets\":[\"css/panel/united/bootstrap.css\",\"css/panel/united/style.css\",\"js\\/datepicker\\/css\\/bootstrap-datepicker3.min.css\",\"https:\\/\\/cdn.mypanel.link\\/css\\/font-awesome\\/css\\/all.min.css\"],\"scripts\":[\"https:\\/\\/cdnjs.cloudflare.com\\/ajax\\/libs\\/jquery\\/1.12.4\\/jquery.min.js\",\"js/panel/united/script.js\",\"js/main.js\",\"js/panel/united/bootstrap.js\",\"js\\/datepicker\\/js\\/bootstrap-datepicker.min.js\",\"js\\/datepicker\\/locales\\/bootstrap-datepicker.tr.min.js\"]}'),
(5, 'Superhero', 'superhero', '{\"stylesheets\":[\"css/panel/superhero/bootstrap.css\",\"css/panel/superhero/style.css\",\"js\\/datepicker\\/css\\/bootstrap-datepicker3.min.css\",\"https:\\/\\/cdn.mypanel.link\\/css\\/font-awesome\\/css\\/all.min.css\"],\"scripts\":[\"https:\\/\\/cdnjs.cloudflare.com\\/ajax\\/libs\\/jquery\\/1.12.4\\/jquery.min.js\",\"js/panel/superhero/script.js\",\"js/main.js\",\"js/panel/superhero/bootstrap.js\",\"js\\/datepicker\\/js\\/bootstrap-datepicker.min.js\",\"js\\/datepicker\\/locales\\/bootstrap-datepicker.tr.min.js\"]}'),
(6, 'Spin', 'spin', '{\"stylesheets\":[\"css/panel/spin/bootstrap.css\",\"css/panel/spin/style.css\",\"js\\/datepicker\\/css\\/bootstrap-datepicker3.min.css\",\"https:\\/\\/cdn.mypanel.link\\/css\\/font-awesome\\/css\\/all.min.css\"],\"scripts\":[\"https:\\/\\/cdnjs.cloudflare.com\\/ajax\\/libs\\/jquery\\/1.12.4\\/jquery.min.js\",\"js/panel/spin/script.js\",\"js/main.js\",\"js/panel/spin/bootstrap.js\",\"js\\/datepicker\\/js\\/bootstrap-datepicker.min.js\",\"js\\/datepicker\\/locales\\/bootstrap-datepicker.tr.min.js\"]}'),
(7, 'Spacelab', 'spacelab', '{\"stylesheets\":[\"css/panel/spacelab/bootstrap.css\",\"css/panel/spacelab/style.css\",\"js\\/datepicker\\/css\\/bootstrap-datepicker3.min.css\",\"https:\\/\\/cdn.mypanel.link\\/css\\/font-awesome\\/css\\/all.min.css\"],\"scripts\":[\"https:\\/\\/cdnjs.cloudflare.com\\/ajax\\/libs\\/jquery\\/1.12.4\\/jquery.min.js\",\"js/panel/spacelab/script.js\",\"js/main.js\",\"js/panel/spacelab/bootstrap.js\",\"js\\/datepicker\\/js\\/bootstrap-datepicker.min.js\",\"js\\/datepicker\\/locales\\/bootstrap-datepicker.tr.min.js\"]}'),
(8, 'Solar', 'solar', '{\"stylesheets\":[\"css/panel/solar/bootstrap.css\",\"css/panel/solar/style.css\",\"js\\/datepicker\\/css\\/bootstrap-datepicker3.min.css\",\"https:\\/\\/cdn.mypanel.link\\/css\\/font-awesome\\/css\\/all.min.css\"],\"scripts\":[\"https:\\/\\/cdnjs.cloudflare.com\\/ajax\\/libs\\/jquery\\/1.12.4\\/jquery.min.js\",\"js/panel/solar/script.js\",\"js/main.js\",\"js/panel/solar/bootstrap.js\",\"js\\/datepicker\\/js\\/bootstrap-datepicker.min.js\",\"js\\/datepicker\\/locales\\/bootstrap-datepicker.tr.min.js\"]}'),
(9, 'Slate', 'slate', '{\"stylesheets\":[\"css/panel/slate/bootstrap.css\",\"css/panel/slate/style.css\",\"js\\/datepicker\\/css\\/bootstrap-datepicker3.min.css\",\"https:\\/\\/cdn.mypanel.link\\/css\\/font-awesome\\/css\\/all.min.css\"],\"scripts\":[\"https:\\/\\/cdnjs.cloudflare.com\\/ajax\\/libs\\/jquery\\/1.12.4\\/jquery.min.js\",\"js/panel/slate/script.js\",\"js/main.js\",\"js/panel/slate/bootstrap.js\",\"js\\/datepicker\\/js\\/bootstrap-datepicker.min.js\",\"js\\/datepicker\\/locales\\/bootstrap-datepicker.tr.min.js\"]}'),
(10, 'Sandstone', 'sandstone', '{\"stylesheets\":[\"css/panel/sandstone/bootstrap.css\",\"css/panel/sandstone/style.css\",\"js\\/datepicker\\/css\\/bootstrap-datepicker3.min.css\",\"https:\\/\\/cdn.mypanel.link\\/css\\/font-awesome\\/css\\/all.min.css\"],\"scripts\":[\"https:\\/\\/cdnjs.cloudflare.com\\/ajax\\/libs\\/jquery\\/1.12.4\\/jquery.min.js\",\"js/panel/sandstone/script.js\",\"js/main.js\",\"js/panel/sandstone/bootstrap.js\",\"js\\/datepicker\\/js\\/bootstrap-datepicker.min.js\",\"js\\/datepicker\\/locales\\/bootstrap-datepicker.tr.min.js\"]}'),
(11, 'Readable', 'readable', '{\"stylesheets\":[\"css/panel/readable/bootstrap.css\",\"css/panel/readable/style.css\",\"js\\/datepicker\\/css\\/bootstrap-datepicker3.min.css\",\"https:\\/\\/cdn.mypanel.link\\/css\\/font-awesome\\/css\\/all.min.css\"],\"scripts\":[\"https:\\/\\/cdnjs.cloudflare.com\\/ajax\\/libs\\/jquery\\/1.12.4\\/jquery.min.js\",\"js/panel/readable/script.js\",\"js/main.js\",\"js/panel/readable/bootstrap.js\",\"js\\/datepicker\\/js\\/bootstrap-datepicker.min.js\",\"js\\/datepicker\\/locales\\/bootstrap-datepicker.tr.min.js\"]}'),
(12, 'Paper', 'paper', '{\"stylesheets\":[\"css/panel/paper/bootstrap.css\",\"css/panel/paper/style.css\",\"js\\/datepicker\\/css\\/bootstrap-datepicker3.min.css\",\"https:\\/\\/cdn.mypanel.link\\/css\\/font-awesome\\/css\\/all.min.css\"],\"scripts\":[\"https:\\/\\/cdnjs.cloudflare.com\\/ajax\\/libs\\/jquery\\/1.12.4\\/jquery.min.js\",\"js/panel/paper/script.js\",\"js/main.js\",\"js/panel/paper/bootstrap.js\",\"js\\/datepicker\\/js\\/bootstrap-datepicker.min.js\",\"js\\/datepicker\\/locales\\/bootstrap-datepicker.tr.min.js\"]}'),
(13, 'Lumen', 'lumen', '{\"stylesheets\":[\"css/panel/lumen/bootstrap.css\",\"css/panel/lumen/style.css\",\"js\\/datepicker\\/css\\/bootstrap-datepicker3.min.css\",\"https:\\/\\/cdn.mypanel.link\\/css\\/font-awesome\\/css\\/all.min.css\"],\"scripts\":[\"https:\\/\\/cdnjs.cloudflare.com\\/ajax\\/libs\\/jquery\\/1.12.4\\/jquery.min.js\",\"js/panel/lumen/script.js\",\"js/main.js\",\"js/panel/lumen/bootstrap.js\",\"js\\/datepicker\\/js\\/bootstrap-datepicker.min.js\",\"js\\/datepicker\\/locales\\/bootstrap-datepicker.tr.min.js\"]}'),
(14, 'Journal', 'journal', '{\"stylesheets\":[\"css/panel/journal/bootstrap.css\",\"css/panel/journal/style.css\",\"js\\/datepicker\\/css\\/bootstrap-datepicker3.min.css\",\"https:\\/\\/cdn.mypanel.link\\/css\\/font-awesome\\/css\\/all.min.css\"],\"scripts\":[\"https:\\/\\/cdnjs.cloudflare.com\\/ajax\\/libs\\/jquery\\/1.12.4\\/jquery.min.js\",\"js/panel/journal/script.js\",\"js/main.js\",\"js/panel/journal/bootstrap.js\",\"js\\/datepicker\\/js\\/bootstrap-datepicker.min.js\",\"js\\/datepicker\\/locales\\/bootstrap-datepicker.tr.min.js\"]}'),
(15, 'Flatly', 'flatly', '{\"stylesheets\":[\"css/panel/flatly/bootstrap.css\",\"css/panel/flatly/style.css\",\"js\\/datepicker\\/css\\/bootstrap-datepicker3.min.css\",\"https:\\/\\/cdn.mypanel.link\\/css\\/font-awesome\\/css\\/all.min.css\"],\"scripts\":[\"https:\\/\\/cdnjs.cloudflare.com\\/ajax\\/libs\\/jquery\\/1.12.4\\/jquery.min.js\",\"js/panel/flatly/script.js\",\"js/main.js\",\"js/panel/flatly/bootstrap.js\",\"js\\/datepicker\\/js\\/bootstrap-datepicker.min.js\",\"js\\/datepicker\\/locales\\/bootstrap-datepicker.tr.min.js\"]}'),
(16, 'Cosmo', 'cosmo', '{\"stylesheets\":[\"css/panel/cosmo/bootstrap.css\",\"css/panel/cosmo/style.css\",\"js\\/datepicker\\/css\\/bootstrap-datepicker3.min.css\",\"https:\\/\\/cdn.mypanel.link\\/css\\/font-awesome\\/css\\/all.min.css\"],\"scripts\":[\"https:\\/\\/cdnjs.cloudflare.com\\/ajax\\/libs\\/jquery\\/1.12.4\\/jquery.min.js\",\"js/panel/cosmo/script.js\",\"js/main.js\",\"js/panel/cosmo/bootstrap.js\",\"js\\/datepicker\\/js\\/bootstrap-datepicker.min.js\",\"js\\/datepicker\\/locales\\/bootstrap-datepicker.tr.min.js\"]}'),
(17, 'Cerulean', 'cerulean', '{\"stylesheets\":[\"css/panel/cerulean/bootstrap.css\",\"css/panel/cerulean/style.css\",\"js\\/datepicker\\/css\\/bootstrap-datepicker3.min.css\",\"https:\\/\\/cdn.mypanel.link\\/css\\/font-awesome\\/css\\/all.min.css\"],\"scripts\":[\"https:\\/\\/cdnjs.cloudflare.com\\/ajax\\/libs\\/jquery\\/1.12.4\\/jquery.min.js\",\"js/panel/cerulean/script.js\",\"js/main.js\",\"js/panel/cerulean/bootstrap.js\",\"js\\/datepicker\\/js\\/bootstrap-datepicker.min.js\",\"js\\/datepicker\\/locales\\/bootstrap-datepicker.tr.min.js\"]}'),
(18, 'Bootstrap', 'bootstrap', '{\"stylesheets\":[\"css/panel/bootstrap/bootstrap.css\",\"css/panel/bootstrap/style.css\",\"js\\/datepicker\\/css\\/bootstrap-datepicker3.min.css\",\"https:\\/\\/cdn.mypanel.link\\/css\\/font-awesome\\/css\\/all.min.css\"],\"scripts\":[\"https:\\/\\/cdnjs.cloudflare.com\\/ajax\\/libs\\/jquery\\/1.12.4\\/jquery.min.js\",\"js/panel/bootstrap/script.js\",\"js/main.js\",\"js/panel/bootstrap/bootstrap.js\",\"js\\/datepicker\\/js\\/bootstrap-datepicker.min.js\",\"js\\/datepicker\\/locales\\/bootstrap-datepicker.tr.min.js\"]}'),
(19, 'Lux Bootstrap', 'rhodium', '{\"stylesheets\":[\"css/panel/rhodium/bootstrap.css\",\"css/panel/rhodium/style.css\",\"js\\/datepicker\\/css\\/bootstrap-datepicker3.min.css\",\"https:\\/\\/cdn.mypanel.link\\/css\\/font-awesome\\/css\\/all.min.css\"],\"scripts\":[\"https:\\/\\/cdnjs.cloudflare.com\\/ajax\\/libs\\/jquery\\/1.12.4\\/jquery.min.js\",\"js/panel/rhodium/script.js\",\"js/main.js\",\"js/panel/rhodium/bootstrap.js\",\"js\\/datepicker\\/js\\/bootstrap-datepicker.min.js\",\"js\\/datepicker\\/locales\\/bootstrap-datepicker.tr.min.js\"]}'),
(20, 'Platinum', 'platinum', '{\"stylesheets\":[\"css/panel/platinum/bootstrap.css\",\"css/panel/platinum/style.css\",\"js\\/datepicker\\/css\\/bootstrap-datepicker3.min.css\",\"https:\\/\\/cdn.mypanel.link\\/css\\/font-awesome\\/css\\/all.min.css\"],\"scripts\":[\"https:\\/\\/cdnjs.cloudflare.com\\/ajax\\/libs\\/jquery\\/1.12.4\\/jquery.min.js\",\"js/panel/platinum/script.js\",\"js/main.js\",\"js/panel/platinum/bootstrap.js\",\"js\\/datepicker\\/js\\/bootstrap-datepicker.min.js\",\"js\\/datepicker\\/locales\\/bootstrap-datepicker.tr.min.js\"]}'),
(21, 'Painite', 'painite', '{\"stylesheets\":[\"css/panel/painite/bootstrap.css\",\"css/panel/painite/style.css\",\"js\\/datepicker\\/css\\/bootstrap-datepicker3.min.css\",\"https:\\/\\/cdn.mypanel.link\\/css\\/font-awesome\\/css\\/all.min.css\"],\"scripts\":[\"https:\\/\\/cdnjs.cloudflare.com\\/ajax\\/libs\\/jquery\\/1.12.4\\/jquery.min.js\",\"js/panel/painite/script.js\",\"js/main.js\",\"js/panel/painite/bootstrap.js\",\"js\\/datepicker\\/js\\/bootstrap-datepicker.min.js\",\"js\\/datepicker\\/locales\\/bootstrap-datepicker.tr.min.js\"]}'),
(22, 'Diamond', 'diamond', '{\"stylesheets\":[\"css/panel/diamond/bootstrap.css\",\"css/panel/diamond/style.css\",\"js\\/datepicker\\/css\\/bootstrap-datepicker3.min.css\",\"https:\\/\\/cdn.mypanel.link\\/css\\/font-awesome\\/css\\/all.min.css\"],\"scripts\":[\"https:\\/\\/cdnjs.cloudflare.com\\/ajax\\/libs\\/jquery\\/1.12.4\\/jquery.min.js\",\"js/panel/diamond/script.js\",\"js/main.js\",\"js/panel/diamond/bootstrap.js\",\"js\\/datepicker\\/js\\/bootstrap-datepicker.min.js\",\"js\\/datepicker\\/locales\\/bootstrap-datepicker.tr.min.js\"]}'),
(23, 'Antimatter', 'antimatter', '{\"stylesheets\":[\"css/panel/antimatter/bootstrap.css\",\"css/panel/antimatter/style.css\",\"js\\/datepicker\\/css\\/bootstrap-datepicker3.min.css\",\"https:\\/\\/cdn.mypanel.link\\/css\\/font-awesome\\/css\\/all.min.css\"],\"scripts\":[\"https:\\/\\/cdnjs.cloudflare.com\\/ajax\\/libs\\/jquery\\/1.12.4\\/jquery.min.js\",\"js/panel/antimatter/script.js\",\"js/main.js\",\"js/panel/antimatter/bootstrap.js\",\"js\\/datepicker\\/js\\/bootstrap-datepicker.min.js\",\"js\\/datepicker\\/locales\\/bootstrap-datepicker.tr.min.js\"]}'),
(24, 'Aqua', 'aqua', '{\"stylesheets\":[\"css/panel/aqua/bootstrap.css\",\"css/panel/aqua/style.css\",\"js\\/datepicker\\/css\\/bootstrap-datepicker3.min.css\",\"https:\\/\\/cdn.mypanel.link\\/css\\/font-awesome\\/css\\/all.min.css\"],\"scripts\":[\"https:\\/\\/cdnjs.cloudflare.com\\/ajax\\/libs\\/jquery\\/1.12.4\\/jquery.min.js\",\"js/panel/aqua/script.js\",\"js/main.js\",\"js/panel/aqua/bootstrap.js\",\"js\\/datepicker\\/js\\/bootstrap-datepicker.min.js\",\"js\\/datepicker\\/locales\\/bootstrap-datepicker.tr.min.js\"]}');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tickets`
--

CREATE TABLE `tickets` (
  `ticket_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `subject` varchar(225) NOT NULL,
  `time` datetime NOT NULL,
  `lastupdate_time` datetime NOT NULL,
  `client_new` enum('1','2') NOT NULL DEFAULT '2',
  `status` enum('pending','answered','closed') NOT NULL DEFAULT 'pending',
  `support_new` enum('1','2') NOT NULL DEFAULT '1',
  `canmessage` enum('1','2') NOT NULL DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ticket_reply`
--

CREATE TABLE `ticket_reply` (
  `id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `support_team` varchar(225) NOT NULL,
  `time` datetime NOT NULL,
  `support` enum('1','2') NOT NULL DEFAULT '1',
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ticket_subjects`
--

CREATE TABLE `ticket_subjects` (
  `subject_id` int(11) NOT NULL,
  `subject` varchar(225) NOT NULL,
  `content` text DEFAULT NULL,
  `auto_reply` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Tablo döküm verisi `ticket_subjects`
--

INSERT INTO `ticket_subjects` (`subject_id`, `subject`, `content`, `auto_reply`) VALUES
(1, 'Sipariş Sorunları', '', '0'),
(2, 'Ödeme Sorunları', '', '0'),
(3, 'Bayilik Hakkında', '', '0'),
(4, 'Şikayet & Öneri', '', '0'),
(6, 'Diğer', '', '0');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `verify_log`
--

CREATE TABLE `verify_log` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `token` varchar(225) NOT NULL,
  `type` int(11) NOT NULL,
  `verify` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Tablo için indeksler `child_panels`
--
ALTER TABLE `child_panels`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`client_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Tablo için indeksler `clients_category`
--
ALTER TABLE `clients_category`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `clients_price`
--
ALTER TABLE `clients_price`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `clients_service`
--
ALTER TABLE `clients_service`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `client_report`
--
ALTER TABLE `client_report`
  ADD PRIMARY KEY (`id`);

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
-- Tablo için indeksler `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `guard_log`
--
ALTER TABLE `guard_log`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `integrations`
--
ALTER TABLE `integrations`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `service_id` (`service_id`),
  ADD KEY `api_orderid` (`api_orderid`),
  ADD KEY `order_api` (`order_api`),
  ADD KEY `api_serviceid` (`api_serviceid`);

--
-- Tablo için indeksler `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`page_id`),
  ADD UNIQUE KEY `page_id` (`page_id`);

--
-- Tablo için indeksler `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD UNIQUE KEY `payment_privatecode` (`payment_privatecode`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `client_balance` (`client_balance`),
  ADD KEY `payment_amount` (`payment_amount`),
  ADD KEY `payment_method` (`payment_method`),
  ADD KEY `payment_status` (`payment_status`);

--
-- Tablo için indeksler `payments_bonus`
--
ALTER TABLE `payments_bonus`
  ADD PRIMARY KEY (`bonus_id`);

--
-- Tablo için indeksler `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `proxy`
--
ALTER TABLE `proxy`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `referral`
--
ALTER TABLE `referral`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `reset_log`
--
ALTER TABLE `reset_log`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`);

--
-- Tablo için indeksler `serviceapi_alert`
--
ALTER TABLE `serviceapi_alert`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`service_id`);

--
-- Tablo için indeksler `service_api`
--
ALTER TABLE `service_api`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`task_id`);

--
-- Tablo için indeksler `themes`
--
ALTER TABLE `themes`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`ticket_id`);

--
-- Tablo için indeksler `ticket_reply`
--
ALTER TABLE `ticket_reply`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `ticket_subjects`
--
ALTER TABLE `ticket_subjects`
  ADD PRIMARY KEY (`subject_id`);

--
-- Tablo için indeksler `verify_log`
--
ALTER TABLE `verify_log`
  ADD PRIMARY KEY (`id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `bank_accounts`
--
ALTER TABLE `bank_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `child_panels`
--
ALTER TABLE `child_panels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `clients`
--
ALTER TABLE `clients`
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `clients_category`
--
ALTER TABLE `clients_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `clients_price`
--
ALTER TABLE `clients_price`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `clients_service`
--
ALTER TABLE `clients_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `client_report`
--
ALTER TABLE `client_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `crons`
--
ALTER TABLE `crons`
  MODIFY `cron_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Tablo için AUTO_INCREMENT değeri `crons_report`
--
ALTER TABLE `crons_report`
  MODIFY `crons_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Tablo için AUTO_INCREMENT değeri `files`
--
ALTER TABLE `files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `guard_log`
--
ALTER TABLE `guard_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `integrations`
--
ALTER TABLE `integrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Tablo için AUTO_INCREMENT değeri `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Tablo için AUTO_INCREMENT değeri `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Tablo için AUTO_INCREMENT değeri `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `pages`
--
ALTER TABLE `pages`
  MODIFY `page_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Tablo için AUTO_INCREMENT değeri `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `payments_bonus`
--
ALTER TABLE `payments_bonus`
  MODIFY `bonus_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Tablo için AUTO_INCREMENT değeri `proxy`
--
ALTER TABLE `proxy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `referral`
--
ALTER TABLE `referral`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `reset_log`
--
ALTER TABLE `reset_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `serviceapi_alert`
--
ALTER TABLE `serviceapi_alert`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `services`
--
ALTER TABLE `services`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `service_api`
--
ALTER TABLE `service_api`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `tasks`
--
ALTER TABLE `tasks`
  MODIFY `task_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `themes`
--
ALTER TABLE `themes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Tablo için AUTO_INCREMENT değeri `tickets`
--
ALTER TABLE `tickets`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `ticket_reply`
--
ALTER TABLE `ticket_reply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `ticket_subjects`
--
ALTER TABLE `ticket_subjects`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Tablo için AUTO_INCREMENT değeri `verify_log`
--
ALTER TABLE `verify_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
