-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 08, 2024 at 11:12 AM
-- Server version: 5.7.24
-- PHP Version: 8.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `new_trial`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('356a192b7913b04c54574d18c28d46e6395428ab', 'i:1;', 1730818900),
('356a192b7913b04c54574d18c28d46e6395428ab:timer', 'i:1730818900;', 1730818900),
('a17961fa74e9275d529f489537f179c05d50c2f3', 'i:1;', 1731046595),
('a17961fa74e9275d529f489537f179c05d50c2f3:timer', 'i:1731046595;', 1731046595);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `group_messages`
--

CREATE TABLE `group_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subscription_group_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `group_messages`
--

INSERT INTO `group_messages` (`id`, `message`, `subscription_group_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(2, 'Waiting and then u will claim it', 6, '2024-11-08 10:22:38', '2024-11-08 02:07:40', '2024-11-08 10:22:38'),
(3, 'Kappa', 6, '2024-11-08 10:22:38', '2024-11-08 02:10:52', '2024-11-08 10:22:38'),
(4, 'Kappa2', 6, '2024-11-08 10:22:38', '2024-11-08 09:13:01', '2024-11-08 10:22:38'),
(5, 'Kappa', 6, NULL, '2024-11-08 10:22:42', '2024-11-08 10:22:42');

-- --------------------------------------------------------

--
-- Table structure for table `group_participants`
--

CREATE TABLE `group_participants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `booking_trx_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subscription_group_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `group_participants`
--

INSERT INTO `group_participants` (`id`, `booking_trx_id`, `name`, `email`, `subscription_group_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(7, 'LDR-001', 'Ruinz', 'Ruinz@gmail.com', 6, NULL, '2024-11-08 01:41:54', '2024-11-08 01:41:54'),
(8, 'LDR-002', 'Ruinz2', 'Ruinz@gmail.com', 6, NULL, '2024-11-08 01:41:57', '2024-11-08 01:41:57'),
(9, 'LDR-003', 'Ruinz3', 'Ruinz3@gmail.com', 6, NULL, '2024-11-08 10:33:35', '2024-11-08 10:33:35'),
(10, 'LDR-430', 'Amar', 'muamarfarhan07@gmail.com', 6, NULL, '2024-11-08 10:33:47', '2024-11-08 10:33:47');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(8, '2024_11_01_142504_create_products_table', 2),
(9, '2024_11_01_142505_create_product_keypoints_table', 2),
(10, '2024_11_01_142505_create_product_subscriptions_table', 2),
(11, '2024_11_01_142505_create_subscription_groups_table', 2),
(12, '2024_11_01_142506_create_group_participants_table', 2),
(13, '2024_11_01_142508_create_group_messages_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `about` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` bigint(20) UNSIGNED NOT NULL,
  `price_per_person` bigint(20) UNSIGNED NOT NULL,
  `duration` bigint(20) UNSIGNED NOT NULL,
  `capacity` bigint(20) UNSIGNED NOT NULL,
  `tagline` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_popular` tinyint(1) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `thumbnail`, `photo`, `about`, `price`, `price_per_person`, `duration`, `capacity`, `tagline`, `is_popular`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Netflix', 'netflix', '01JBYDEEDSZVHH9SW1CK3VH42V.png', '01JBYDEEEKK4Y81D0EPAW43YAR.png', 'Netflix is a streaming service that allows users to watch a variety of movies, TV shows, and original programs over the internet. You can watch it anytime and anywhere as long as you\'re connected to the internet. Netflix offers a diverse range of content across various genres, including drama, comedy, documentaries, and animation.', 185000, 46250, 1, 4, 'Are You Still Watching', 1, NULL, '2024-11-01 08:22:10', '2024-11-05 07:00:16'),
(2, 'Disney+ Hostar', 'disney-hostar', '01JBM9FYHFG3QRBQ1SY3SQWSSK.png', '01JBYDFAKW1A8ZFNCH5S9VS4V9.png', 'Disney+ Hostar is a streaming service that allows users to watch a variety of movies, TV shows, and original programs over the internet. You can watch it anytime and anywhere as long as you\'re connected to the internet. Netflix offers a diverse range of content across various genres, including drama, comedy, documentaries, and animation.', 185000, 46250, 1, 4, 'Kids', 1, NULL, '2024-11-01 08:38:47', '2024-11-05 07:38:24'),
(3, 'Prime Video', 'prime-video', '01JBM9K99RD39ZK6HVH40AN8MV.png', '01JBM9K99V1373Y9F04K53634H.png', 'Prime Video is a streaming service that allows users to watch a variety of movies, TV shows, and original programs over the internet. You can watch it anytime and anywhere as long as you\'re connected to the internet. Netflix offers a diverse range of content across various genres, including drama, comedy, documentaries, and animation.', 185000, 46250, 1, 4, 'Prime', 0, NULL, '2024-11-01 08:40:36', '2024-11-05 07:38:45'),
(4, 'Spotify', 'spotify', '01JBV6QH23JQCZEFCXHG8W6EHV.png', '01JBV6QH2K0G1Q742B897C0V0J.png', 'Platform streaming musik yang memberi Anda akses ke jutaan lagu, playlist, dan podcast dari seluruh dunia. Dengan Spotify, temukan musik baru, buat playlist pribadi, dan dengarkan sesuai suasana hati Anda.\n', 186000, 46500, 1, 4, 'Suara Favoritmu, di Mana Saja', 1, NULL, '2024-11-04 01:05:10', '2024-11-04 01:05:10'),
(5, 'YouTube Music', 'youtube-music', '01JBV6TF804TKTJS5TY1HA4CGH.png', '01JBV6TF8B72NFDQETYAB3R1Q7.png', 'Layanan musik dari YouTube yang memberi Anda lagu resmi, video, dan konten eksklusif dari artis favorit. Temukan musik yang sedang tren, rekomendasi berdasarkan selera Anda, dan nikmati pengalaman musik yang interaktif.', 160000, 40000, 1, 4, 'Musik yang Kamu Suka, Lebih Dekat.', 0, NULL, '2024-11-04 01:06:47', '2024-11-04 01:06:47'),
(6, ' Apple Music', 'apple-music', '01JBV6W6B70NPNR2H4EZ7M6T1E.png', '01JBV6W6BAFJ2TTSEQ6YAXBM77.png', 'Apple Music menghubungkan Anda dengan artis favorit dan mengakses lebih dari 100 juta lagu tanpa iklan. Personalisasi pengalaman musik Anda dengan rekomendasi yang disesuaikan dan berbagai konten eksklusif dari Apple.', 175000, 43750, 1, 4, 'Rasakan Musik dengan Sentuhan yang Lebih Personal.', 0, NULL, '2024-11-04 01:07:43', '2024-11-04 01:07:43'),
(7, 'Figma', 'figma', '01JBV6XZTPV9NZXMZ2QVDJ6BYY.png', '01JBV6XZV12CG0QCJ7GWASS4E1.png', 'Platform desain berbasis cloud untuk tim yang memungkinkan kolaborasi real-time dalam pembuatan desain dan prototipe UI/UX. Figma membantu tim Anda bekerja bersama dalam proyek desain dari mana saja dan kapan saja.', 185000, 46250, 1, 4, 'Kolaborasi Desain dalam Satu Tempat.', 1, NULL, '2024-11-04 01:08:42', '2024-11-04 01:08:42'),
(8, 'Notion', 'notion', '01JBV73TRYWZ0NH77SB2Z3DBA4.png', '01JBV73TS10K6E1YRYB7F56G0C.png', 'Alat produktivitas multifungsi yang memungkinkan Anda mencatat, mengelola proyek, menyusun data, dan berkolaborasi dalam satu aplikasi. Dengan Notion, semua ide dan rencana Anda bisa terorganisir dengan mudah dalam satu tempat yang intuitif.', 185000, 46250, 1, 4, 'Tempat Kerja Digital untuk Ide dan Organisasi.', 1, NULL, '2024-11-04 01:11:53', '2024-11-04 01:11:53'),
(9, 'Duolingo', 'duolingo', '01JBV75JQ1V1T1SF0AQA2W8F20.png', '01JBV75JQB4VV4DFT7MKM1KERX.png', 'Aplikasi belajar bahasa yang menggunakan pendekatan gamifikasi untuk membantu Anda belajar berbagai bahasa dengan cara yang menyenangkan dan interaktif. Dapatkan pelajaran singkat setiap hari, tingkatkan keterampilan Anda, dan lacak perkembangan Anda.', 165000, 41250, 1, 4, 'Belajar Bahasa yang Menyenangkan', 1, NULL, '2024-11-04 01:12:51', '2024-11-04 01:12:51'),
(10, 'tes', 'tes', '01JBVWKRQZXRWHGN1P22SSCMGV.png', '01JBVWKRR3QQWWYZE2R8FYRJ91.PNG', '231', 100000, 25000, 1, 4, 'tes', 1, '2024-11-05 07:04:08', '2024-11-04 07:27:36', '2024-11-05 07:04:08');

-- --------------------------------------------------------

--
-- Table structure for table `product_keypoints`
--

CREATE TABLE `product_keypoints` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_keypoints`
--

INSERT INTO `product_keypoints` (`id`, `name`, `product_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Full access to all unlimited Netflix movies and series', 1, NULL, '2024-11-01 08:22:10', '2024-11-01 08:22:10'),
(2, 'Ultra HD (HDR) image quality', 1, NULL, '2024-11-01 08:22:10', '2024-11-01 08:22:10'),
(3, 'Can watch from smartphones, tablets, laptops & TV', 1, NULL, '2024-11-01 08:22:10', '2024-11-01 08:22:10'),
(4, 'Unlock Special Audio', 1, NULL, '2024-11-01 08:22:10', '2024-11-01 08:22:10'),
(5, 'Full access to all unlimited Netflix movies and series', 2, NULL, '2024-11-01 08:38:47', '2024-11-01 08:38:47'),
(6, 'Ultra HD (HDR) image quality', 2, NULL, '2024-11-01 08:38:47', '2024-11-01 08:38:47'),
(7, 'Can watch from smartphones, tablets, laptops & TV', 2, NULL, '2024-11-01 08:38:47', '2024-11-01 08:38:47'),
(8, 'Unlock Special Audio', 2, NULL, '2024-11-01 08:38:47', '2024-11-01 08:38:47'),
(9, 'Full access to all unlimited Netflix movies and series', 3, NULL, '2024-11-01 08:40:36', '2024-11-01 08:40:36'),
(10, 'Ultra HD (HDR) image quality', 3, NULL, '2024-11-01 08:40:36', '2024-11-01 08:40:36'),
(11, 'Can watch from smartphones, tablets, laptops & TV', 3, NULL, '2024-11-01 08:40:36', '2024-11-01 08:40:36'),
(12, 'Unlock Special Audio', 3, NULL, '2024-11-01 08:40:36', '2024-11-01 08:40:36'),
(13, 'Koleksi Musik Tak Terbatas: Akses ke jutaan lagu, podcast, dan playlist dari seluruh dunia.', 4, NULL, '2024-11-04 01:05:10', '2024-11-04 01:05:10'),
(14, 'Rekomendasi Personal: Algoritma cerdas yang menyesuaikan musik berdasarkan preferensi dan suasana hati.', 4, NULL, '2024-11-04 01:05:10', '2024-11-04 01:05:10'),
(15, 'Mode Offline & Tanpa Iklan: Dengarkan musik favorit tanpa jeda dengan langganan premium.', 4, NULL, '2024-11-04 01:05:10', '2024-11-04 01:05:10'),
(16, 'Perpaduan Lagu & Video Musik: Dapatkan pengalaman mendalam dengan musik dan video dari artis favorit.', 5, NULL, '2024-11-04 01:06:47', '2024-11-04 01:06:47'),
(17, 'Saran Otomatis Berdasarkan Lokasi dan Aktivitas: Rekomendasi yang disesuaikan dengan aktivitas, waktu, atau tempat.', 5, NULL, '2024-11-04 01:06:47', '2024-11-04 01:06:47'),
(18, 'Eksklusif YouTube: Konten dan remix khusus yang hanya bisa ditemukan di YouTube Music.', 5, NULL, '2024-11-04 01:06:47', '2024-11-04 01:06:47'),
(19, 'Kualitas Audio Terbaik: Nikmati musik lossless dan audio spasial yang memperkaya pengalaman mendengar.', 6, NULL, '2024-11-04 01:07:43', '2024-11-04 01:07:43'),
(20, 'Konten Eksklusif dari Artis Besar: Akses wawancara, konser, dan konten eksklusif dari artis papan atas.', 6, NULL, '2024-11-04 01:07:43', '2024-11-04 01:07:43'),
(21, 'Integrasi Ekosistem Apple: Sinkronisasi dengan perangkat Apple lain untuk pengalaman yang mulus.', 6, NULL, '2024-11-04 01:07:43', '2024-11-04 01:07:43'),
(22, 'Kolaborasi Real-Time: Tim dapat bekerja bersama dalam satu file desain secara langsung dari mana saja.', 7, NULL, '2024-11-04 01:08:42', '2024-11-04 01:08:42'),
(23, 'Prototyping & Feedback Langsung: Buat prototipe interaktif dan kumpulkan masukan dari tim tanpa berpindah platform.', 7, NULL, '2024-11-04 01:08:42', '2024-11-04 01:08:42'),
(24, 'Komunitas & Sumber Daya yang Kaya: Tersedia banyak template, plugin, dan komunitas untuk mendukung produktivitas.', 7, NULL, '2024-11-04 01:08:42', '2024-11-04 01:08:42'),
(25, 'Alat All-in-One: Catatan, manajemen proyek, dan basis data dalam satu aplikasi.', 8, NULL, '2024-11-04 01:11:53', '2024-11-04 01:11:53'),
(26, 'Kustomisasi Fleksibel: Sesuaikan tampilan, struktur, dan format untuk kebutuhan pribadi atau tim.', 8, NULL, '2024-11-04 01:11:53', '2024-11-04 01:11:53'),
(27, 'Kolaborasi dan Penugasan yang Mudah: Bekerja bersama dalam satu platform untuk meningkatkan produktivitas.', 8, NULL, '2024-11-04 01:11:53', '2024-11-04 01:11:53'),
(28, 'Metode Belajar Gamifikasi: Setiap pelajaran dirancang seperti game untuk membuat pembelajaran lebih seru.', 9, NULL, '2024-11-04 01:12:51', '2024-11-04 01:12:51'),
(29, 'Berbagai Pilihan Bahasa: Belajar lebih dari 30 bahasa dengan pelajaran singkat setiap hari.', 9, NULL, '2024-11-04 01:12:51', '2024-11-04 01:12:51'),
(30, 'Pelacakan Kemajuan: Lihat perkembangan bahasa Anda dan motivasi diri dengan target harian.', 9, NULL, '2024-11-04 01:12:51', '2024-11-04 01:12:51'),
(31, '321', 10, NULL, '2024-11-04 07:27:36', '2024-11-04 07:27:36');

-- --------------------------------------------------------

--
-- Table structure for table `product_subscriptions`
--

CREATE TABLE `product_subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `booking_trx_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_bank_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_bank_account` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_bank_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `proof` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_amount` bigint(20) UNSIGNED NOT NULL,
  `duration` bigint(20) UNSIGNED NOT NULL,
  `total_tax_amount` bigint(20) UNSIGNED NOT NULL,
  `price` bigint(20) UNSIGNED NOT NULL,
  `is_paid` tinyint(1) NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_subscriptions`
--

INSERT INTO `product_subscriptions` (`id`, `booking_trx_id`, `name`, `phone`, `email`, `customer_bank_name`, `customer_bank_account`, `customer_bank_number`, `proof`, `total_amount`, `duration`, `total_tax_amount`, `price`, `is_paid`, `product_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'LDR-001', 'Ruinz', '+6282193734482', 'Ruinz@gmail.com', 'Mandiri', 'Ruinz', '7411531', '01JBSA1KAFJVNDCVTKSMD9RJXY.jpg', 51338, 1, 20350, 185000, 1, 1, NULL, '2024-11-03 07:24:37', '2024-11-08 01:41:54'),
(2, 'LDR-002', 'Ruinz2', '+6282193734482', 'Ruinz@gmail.com', 'Mandiri', 'Ruinz2', '74115313', '01JBSACZS6M18HHQ737ZEARW62.jpeg', 138750, 1, 20350, 185000, 1, 1, NULL, '2024-11-03 07:30:50', '2024-11-08 01:41:57'),
(3, 'LDR-003', 'Ruinz3', '+6282193734482', 'Ruinz3@gmail.com', 'Mandiri', 'Ruinz3', '74115314', '01JBT18DKP8EKP1DP4YNR96XZX.jpg', 185000, 1, 20350, 185000, 1, 1, NULL, '2024-11-03 14:10:18', '2024-11-08 10:33:35'),
(4, 'LDR-430', 'Amar', '+6282193734482', 'muamarfarhan07@gmail.com', 'Bank Syariah', '1', '3123', 'proofs/qZbmve3cmtgcOLcHSHHspkq810oLvJraHqnfK2gl.png', 51338, 1, 5088, 46250, 1, 1, NULL, '2024-11-07 22:14:40', '2024-11-08 10:33:47');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('voTcMAQ8J9f25POsgFCXLAzaL2yRQqQNktSZnrEP', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiNDk0TGVNdWRTcjBPSlh2Q2JOb1FtdmJ2b0JRM09XN0JsaDhoYjBDQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MTI6ImJvb2tpbmdfZGF0YSI7YTo5OntzOjEwOiJwcm9kdWN0X2lkIjtpOjE7czo0OiJuYW1lIjtzOjQ6IkFtYXIiO3M6NToiZW1haWwiO3M6MjQ6Im11YW1hcmZhcmhhbjA3QGdtYWlsLmNvbSI7czo1OiJwaG9uZSI7czoxNDoiKzYyODIxOTM3MzQ0ODIiO3M6ODoiZHVyYXRpb24iO2k6MTtzOjE2OiJwcmljZV9wZXJfcGVyc29uIjtpOjQ2MjUwO3M6OToic3ViX3RvdGFsIjtpOjQ2MjUwO3M6OToidG90YWxfcHBuIjtkOjUwODcuNTtzOjEyOiJ0b3RhbF9hbW91bnQiO2Q6NTEzMzcuNTt9czozOiJ1cmwiO2E6MDp7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMiRwZVZWMVFBbFNzNUF0WDMxWC9xaHcuRzlUYlJ1ZjNkU1dtZklYcVhDTWRMY1ZscmZxLlo2bSI7czo4OiJmaWxhbWVudCI7YTowOnt9fQ==', 1731064183);

-- --------------------------------------------------------

--
-- Table structure for table `subscription_groups`
--

CREATE TABLE `subscription_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `max_capacity` bigint(20) UNSIGNED NOT NULL,
  `participant_count` bigint(20) UNSIGNED NOT NULL,
  `product_subscription_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscription_groups`
--

INSERT INTO `subscription_groups` (`id`, `product_id`, `max_capacity`, `participant_count`, `product_subscription_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 2, 4, 2, 1, '2024-11-03 14:06:11', '2024-11-03 13:48:06', '2024-11-03 14:06:11'),
(2, 1, 3, 2, 2, '2024-11-03 14:06:11', '2024-11-03 13:54:04', '2024-11-03 14:06:11'),
(3, 2, 4, 1, 1, '2024-11-08 01:35:29', '2024-11-03 14:06:20', '2024-11-08 01:35:29'),
(4, 1, 3, 2, 2, '2024-11-08 01:35:29', '2024-11-03 14:09:25', '2024-11-08 01:35:29'),
(5, 1, 4, 3, 1, '2024-11-08 01:41:44', '2024-11-08 01:36:07', '2024-11-08 01:41:44'),
(6, 1, 4, 4, 1, NULL, '2024-11-08 01:41:54', '2024-11-08 10:33:47');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Ruinz', 'Admin@gmail.com', NULL, '$2y$12$peVV1QAlSs5AtX31X/qhw.G9TbRuf3dSWmfIXqXCMdLcVlrfq.Z6m', NULL, '2024-11-01 06:50:24', '2024-11-01 06:50:24');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `group_messages`
--
ALTER TABLE `group_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_messages_subscription_group_id_foreign` (`subscription_group_id`);

--
-- Indexes for table `group_participants`
--
ALTER TABLE `group_participants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_keypoints`
--
ALTER TABLE `product_keypoints`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_keypoints_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_subscriptions`
--
ALTER TABLE `product_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_subscriptions_product_id_foreign` (`product_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `subscription_groups`
--
ALTER TABLE `subscription_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscription_groups_product_id_foreign` (`product_id`),
  ADD KEY `subscription_groups_product_subscription_id_foreign` (`product_subscription_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `group_messages`
--
ALTER TABLE `group_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `group_participants`
--
ALTER TABLE `group_participants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product_keypoints`
--
ALTER TABLE `product_keypoints`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `product_subscriptions`
--
ALTER TABLE `product_subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `subscription_groups`
--
ALTER TABLE `subscription_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `group_messages`
--
ALTER TABLE `group_messages`
  ADD CONSTRAINT `group_messages_subscription_group_id_foreign` FOREIGN KEY (`subscription_group_id`) REFERENCES `subscription_groups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_keypoints`
--
ALTER TABLE `product_keypoints`
  ADD CONSTRAINT `product_keypoints_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_subscriptions`
--
ALTER TABLE `product_subscriptions`
  ADD CONSTRAINT `product_subscriptions_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subscription_groups`
--
ALTER TABLE `subscription_groups`
  ADD CONSTRAINT `subscription_groups_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subscription_groups_product_subscription_id_foreign` FOREIGN KEY (`product_subscription_id`) REFERENCES `product_subscriptions` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
