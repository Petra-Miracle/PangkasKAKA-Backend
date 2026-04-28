-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 26, 2026 at 07:36 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pangkaskaka`
--

-- --------------------------------------------------------

--
-- Table structure for table `barbers`
--

CREATE TABLE `barbers` (
  `id` int(11) NOT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `karyawan_id` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `specialization` varchar(100) DEFAULT NULL,
  `skill_level` enum('Junior','Standar','Senior') DEFAULT 'Junior',
  `rating` decimal(3,1) DEFAULT 5.0,
  `image` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `barbers`
--

INSERT INTO `barbers` (`id`, `shop_id`, `karyawan_id`, `name`, `photo`, `specialization`, `skill_level`, `rating`, `image`, `status`, `created_at`) VALUES
(36, 165, NULL, 'Petra Miracle ME Lenggu', NULL, 'Mullet Cutter', '', 4.8, 'assets/img/barbers/barber_165_1774446106.jpeg', 'active', '2026-03-25 13:41:46'),
(37, 165, NULL, 'Samuel Adian', NULL, 'Low Fade Cutter', '', 4.8, 'assets/img/barbers/barber_165_1774446160.jpeg', 'active', '2026-03-25 13:42:40'),
(39, 165, NULL, 'Yudha Habel Palulun', NULL, 'Mohwak Cutter', '', 4.8, 'assets/img/barbers/barber_165_1774446344.jpeg', 'active', '2026-03-25 13:45:44'),
(40, 165, 1, 'RIVALDY CHRISTIAN ADOE', NULL, 'Kapster Baru', 'Junior', 5.0, 'assets/img/barbers/barber_165_1774541106.jpeg', 'active', '2026-03-26 16:04:20');

-- --------------------------------------------------------

--
-- Table structure for table `barbershops`
--

CREATE TABLE `barbershops` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `rating` decimal(3,1) DEFAULT 0.0,
  `reviews_count` int(11) DEFAULT 0,
  `address` text NOT NULL,
  `operational_status` varchar(255) DEFAULT NULL,
  `location_link` varchar(500) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price_range` varchar(50) DEFAULT NULL,
  `is_verified` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `bank_name` varchar(100) DEFAULT NULL,
  `account_number` varchar(50) DEFAULT NULL,
  `account_holder` varchar(255) DEFAULT NULL,
  `doc_ktp` varchar(255) DEFAULT NULL,
  `doc_nib` varchar(255) DEFAULT NULL,
  `doc_npwp` varchar(255) DEFAULT NULL,
  `doc_surat_usaha` varchar(255) DEFAULT NULL,
  `verification_status` enum('pending','approved','rejected') DEFAULT 'pending',
  `verification_note` text DEFAULT NULL,
  `docs_submitted_at` datetime DEFAULT NULL,
  `verified_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `barbershops`
--

INSERT INTO `barbershops` (`id`, `owner_id`, `name`, `category`, `rating`, `reviews_count`, `address`, `operational_status`, `location_link`, `description`, `latitude`, `longitude`, `image`, `price_range`, `is_verified`, `created_at`, `bank_name`, `account_number`, `account_holder`, `doc_ktp`, `doc_nib`, `doc_npwp`, `doc_surat_usaha`, `verification_status`, `verification_note`, `docs_submitted_at`, `verified_at`) VALUES
(45, 4, 'A2 barbershop', 'Tempat Cukur Rambut', 5.0, 3, 'VM27+HP6', 'Tutup 22.30', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(46, 5, 'Aboni barbershop', 'Tempat Cukur Rambut', NULL, 0, '-', 'Buka Rab 08.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(47, 6, 'ACF BARBERSHOP', 'Tempat Cukur Rambut', 5.0, 1, 'Jl. Taebenu No.1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(48, 7, 'Aidens Barbershop', 'Salon Rambut', NULL, 0, 'Jl. TDM V', 'Buka Rab 09.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(49, 8, 'AMRAN BARBERSHOP', 'Tempat Cukur Rambut', 5.0, 1, 'Jl. Lakbanu No.32', 'Tutup 23.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(50, 9, 'Anasta Barbershop', 'Tempat Cukur Rambut', 4.5, 6, 'RJVC+V75', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(51, 10, 'Angga Angelos (GB barbershop)', 'Tempat Cukur Rambut', 5.0, 1, 'Jl. Sikib RT.17/RW.06', 'Buka Rab 10.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(52, 11, 'ATOIN METO BARBERSHOP', 'Salon Rambut', 5.0, 1, 'Jl. Kelinci No.238', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(53, 12, 'B&W BARBERSHOP', 'Salon Rambut', 4.0, 11, 'Jl. Bajawa No.30', 'Buka Rab 09.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(54, 13, 'Bang ji barbershop', 'Salon Rambut', NULL, 0, 'Jl. P. Kemerdekaan III No.7', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(55, 14, 'Barber Shop BNB', 'Salon Rambut', 5.0, 2, 'Jl. Oeleta Raya 003', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(56, 15, 'Barbershop', 'Salon Rambut', 5.0, 1, 'Jl. Dua Lontar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(57, 16, 'Barbershop 46', 'Tempat Cukur Rambut', NULL, 0, 'Jl. Bhakti Karang', 'Tutup 22.30', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(58, 17, 'Barbershop AR46', 'Toko Peralatan Pangkas Rambut', NULL, 0, 'Jl Fetor Foenay', 'Buka Rab 09.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(59, 18, 'Barbershop Barondang', 'Pembangunan Perumahan', 5.0, 1, 'RHH4+C6C', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(60, 19, 'Barbershop Bh41ra', 'Tempat Cukur Rambut', 4.0, 1, '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(61, 20, 'Barbershop Champen', 'Tempat Cukur Rambut', 4.8, 6, 'RJCF+Q6P', 'Buka Rab 08.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(62, 21, 'Barbershop GIMBO', 'Salon Rambut', 5.0, 1, 'Jl. Anggur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(63, 22, 'BARBERSHOP KENAN', 'Tempat Cukur Rambut', 4.4, 7, 'Jl. Farmasi', 'Buka Rab 09.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(64, 23, 'Barbershop KUMIS GANG', 'Tempat Cukur Rambut', 4.8, 11, 'Jl. Hati Mulia VI No.9', 'Tutup 22.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(65, 24, 'Barbershop Lusi', 'Tempat Cukur Rambut', NULL, 0, 'Jl. Amabi', 'Tutup 23.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(66, 25, 'Barbershop MR.Breewok', 'Penata Rambut', 4.0, 1, 'Jl. Sahabat', 'Buka Rab 10.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(67, 26, 'Barbershop Pa De', 'Salon Rambut', 5.0, 1, 'Jl. TDM II', 'Buka 24 Jam', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(68, 27, 'Barbershop PJKR Universitas San Pedro', 'Tempat Cukur Rambut', 4.0, 4, 'Jl. Farmasi No.32', 'Tutup 22.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(69, 28, 'Barbershop S.I.D', 'Tempat Cukur Rambut', 5.0, 1, 'Jl. Jenderal Sudirman No.47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(70, 29, 'BARBERSHOP TRABAS', 'Salon Rambut', 4.3, 6, 'Jl. Farmasi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(71, 30, 'BARBERSHOP ZM', 'Tempat Cukur Rambut', 4.3, 41, 'RHQM+344', 'Tutup 22.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(72, 31, 'Barbershop88 ebufu', 'Tempat Cukur Rambut', 4.5, 2, 'RJFC+RG6', 'Buka Rab 09.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(73, 32, 'BLACK BARBERSHOP', 'Tempat Cukur Rambut', 4.7, 3, 'Jl. Pahlawan No.15', 'Buka Rab 09.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(74, 33, 'Black Red Barbershop', 'Tempat Cukur Rambut', 4.4, 42, 'Jl. Jend. Soeharto', 'Buka 24 Jam', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(75, 34, 'Blessed barbershop', 'Tempat Cukur Rambut', 5.0, 1, 'Jl. Soverdi', 'Buka Rab 10.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(76, 35, 'BOSS KICI BARBERSHOP', 'Tempat Cukur Rambut', 5.0, 3, 'RHPG+JP8', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(77, 36, 'BosQiano Barber', 'Tempat Cukur Rambut', 5.0, 16, 'Jl. Farmasi Gang IV', 'Buka Rab 09.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(78, 37, 'BOXX BARBERSHOP', 'Tempat Cukur Rambut', 2.5, 4, 'Jl. Bumi I', 'Tutup 22.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(79, 38, 'Brader\'s Barbershop', 'Salon Rambut', 5.0, 10, 'Jl. Pemuda', 'Buka Rab 09.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(80, 39, 'Brooklyn barbershop', 'Tempat Cukur Rambut', 5.0, 21, 'Jl. Bhakti Karya', 'Tutup 22.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(81, 40, 'Cfk Barbershop', 'Tempat Cukur Rambut', 5.0, 1, '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(82, 41, 'Coral Barbershop', 'Tempat Cukur Rambut', 4.7, 9, 'Jl. Tompello No.31B', 'Buka Rab 10.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(83, 42, 'Coral Barbershop (Perumnas)', 'Tempat Cukur Rambut', 4.0, 56, 'Jl. Bhakti Karang', 'Buka Rab 09.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(84, 43, 'D GANTENG BARBERSHOP', 'Tempat Cukur Rambut', 4.8, 5, 'RHJR+39F', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(85, 44, 'DAENG BARBERSHOP', 'Tempat Cukur Rambut', 5.0, 5, 'Jl. TDM II', 'Buka Sekarang', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(86, 45, 'David barbershop', 'Salon Rambut', NULL, 0, 'Jl. Pahlawan', 'Buka Rab 08.30', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(87, 46, 'DiZett Barbershop', 'Tempat Cukur Rambut', 4.7, 15, 'RJP9+WH7', 'Buka Rab 09.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(88, 47, 'El NiNo Barbershop', 'Kantor Perusahaan', 4.0, 1, 'RJXM+2P6', 'Tutup 22.51', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(89, 48, 'ElArJu Barbershop & Online shop', 'Tempat Cukur Rambut', NULL, 0, 'Jl. Alfons Nisnoni', 'Tutup 22.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(90, 49, 'Eleven Barbershop', 'Salon Rambut', 4.5, 2, 'Jl. Farmasi No.12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(91, 50, 'Etho Barbershop', 'Tempat Cukur Rambut', NULL, 0, 'Jl. Soverdi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(92, 51, 'FanRel Barbershop', 'Salon Rambut', 5.0, 1, 'Jl. Bhakti Besi No.01', 'Buka Rab 00.09', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(93, 52, 'Forah Barbershop', 'Tempat Cukur Rambut', 3.5, 2, 'Jl. Prof. Dr. Herman Johanes No.88', 'Buka Rab 09.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(94, 53, 'Freedombarber\'s', 'Salon Rambut', 4.0, 6, 'Jl. HTI Maulafa', 'Buka Rab 08.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(95, 54, 'Fries Barbershop', 'Hotel', 5.0, 1, 'Jl. W.J. Lalamentik', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(96, 55, 'G R E M \' S BARBERSHOP', 'Tempat Cukur Rambut', 5.0, 3, 'Jl. Sumatera', 'Buka Rab 10.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(97, 56, 'Gaul Barbershop', 'Tempat Cukur Rambut', NULL, 0, 'Jl. Perintis Kemerdekaan I', 'Tutup 22.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(98, 57, 'Gentle-Man Barbershop', 'Salon Rambut', 3.8, 11, 'Jl. Fetor Funay', 'Tutup 22.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(99, 58, 'Gentlemen\'s Barbershop Sumatera', 'Tempat Cukur Rambut', NULL, 0, 'Jl. Sumatera', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(100, 59, 'GOOD BARBERSHOP', 'Tempat Cukur Rambut', 5.0, 3, 'Jl. Shopping Centre', 'Tutup 22.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(101, 60, 'Goots Mini Barbershop', 'Tempat Cukur Rambut', NULL, 0, 'Jl. Kesekrom No.4', 'Buka 24 Jam', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(102, 61, 'Grachio Barbershop', 'Tempat Cukur Rambut', 5.0, 3, 'Jl. Bajawa', 'Tutup 22.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(103, 62, 'Grevlin Barbershop', 'Tempat Cukur Rambut', 4.3, 10, 'RJPF+794', 'Buka Rab 10.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(104, 63, 'Growmen salon', 'Tempat Cukur Rambut', 5.0, 59, 'jln. banteng mapoli kel', 'Buka Rab 10.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(105, 64, 'Ichat barbershop', 'Salon Rambut', 5.0, 1, 'Jl. TDM II', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(106, 65, 'Icky BARBERSHOP', 'Tempat Cukur Rambut', 4.5, 2, 'RJJC+P4F', 'Buka Rab 09.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(107, 66, 'J1 BARBERSHOP', 'Tempat Cukur Rambut', 4.7, 3, 'Jl. Fetor Funay No.8', 'Buka Rab 09.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(108, 67, 'Jhian Barbershop', 'Tempat Cukur Rambut', NULL, 0, 'Jl. Perintis Kemerdekaan I', 'Buka 24 Jam', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(109, 68, 'JM BARBERSHOP 2018', 'Tempat Cukur Rambut', 4.5, 26, 'Jl. W. Monginsidi III', 'Buka Rab 09.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(110, 69, 'JOKER BARBERSHOP', 'Salon Rambut', 5.0, 1, 'Jl. Banteng', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(111, 70, 'JR BARBERSHOP', 'Tempat Cukur Rambut', 5.0, 4, 'Jl. Frans Seda', 'Buka Rab 09.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(112, 71, 'KAIROS BARBERSHOP', 'Tempat Cukur Rambut', NULL, 0, 'Jl. Swakarya II', 'Tutup 22.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(113, 72, 'Keluar-Keluar Ganteng Barbershop', 'Tempat Cukur Rambut', 5.0, 3, '-', 'Buka Rab 09.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(114, 73, 'KEY BARBERSHOP', 'Tempat Cukur Rambut', 4.8, 25, 'Jl. Perintis Kemerdekaan I No.5', 'Tutup 22.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(115, 74, 'King Barber Shop', 'Tempat Cukur Rambut', 4.0, 1, 'Jl. H.R. Koroh No.168', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(116, 75, 'KING BARBERSHOP', 'Tempat Cukur Rambut', 4.7, 70, 'Jl. W.J. Lalamentik', 'Buka Rab 10.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(117, 76, 'Koe Barbershop', 'Tempat Cukur Rambut', 4.0, 4, 'Jl. Dua Lontar', 'Buka Rab 08.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(118, 77, 'Koe Barbershop (Bumi I)', 'Tempat Cukur Rambut', 4.0, 3, 'Jl. Bumi I', 'Tutup 22.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(119, 78, 'Lapan Lapan Barbershop Cabang Oebufu', 'Tempat Cukur Rambut', 4.6, 112, 'Jl. W.J. Lalamentik No.117', 'Buka Rab 09.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(120, 79, 'Lapan lapan barbershop cabang merdeka', 'Tempat Cukur Rambut', 4.8, 66, '-', 'Buka Rab 09.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(121, 80, 'Lapanlapan Barbershop', 'Tempat Cukur Rambut', 4.8, 64, 'Jl. Shopping Centre No.33', 'Buka Rab 09.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(122, 81, 'LC BARBERSHOP', 'Tempat Cukur Rambut', NULL, 0, 'Jl. Prof. Dr. Herman Johanes', 'Tutup 22.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(123, 82, 'Locker barbershop', 'Tempat Cukur Rambut', 5.0, 2, 'Jl. W.J. Lalamentik No.66', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(124, 83, 'Lordez Barbershop', 'Salon Rambut', NULL, 0, '99QC+287', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(125, 84, 'LUXURY barbershop', 'Tempat Cukur Rambut', 5.0, 4, 'Jl. Nangka No.38', 'Buka Rab 09.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(126, 85, 'MANLIEST BARBERSHOP', 'Tempat Cukur Rambut', 4.8, 62, 'Jl. Gunung Mutis No.31', 'Buka Rab 10.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(127, 86, 'MANLIEST BARBERSHOP OEBUFU', 'Tempat Cukur Rambut', 4.4, 96, 'Jl. W.J. Lalamentik', 'Buka Rab 10.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(128, 87, 'MANLIEST BARBERSHOP PASIR PANJANG', 'Tempat Cukur Rambut', 4.6, 252, 'Jl. Terusan Timor Raya No.120 A', 'Buka Rab 10.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(129, 88, 'Manoah Barbershop Cab. Kelapa Lima', 'Tempat Cukur Rambut', NULL, 0, 'Jl. Perintis Kemerdekaan', 'Buka Rab 09.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(130, 89, 'Max Salon', 'Salon Rambut', 4.5, 78, 'Jl. W.J. Lalamentik', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(131, 90, 'ML Barbershop', 'Tempat Cukur Rambut', 5.0, 14, 'Jl. Samratulangi No.3', 'Buka Rab 09.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(132, 91, 'MMS BARBERSHOP', 'Toko Peralatan Pangkas Rambut', 3.0, 2, 'Jl. K. H. Ahmad Dahlan No.19', 'Buka Rab 08.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(134, 93, 'Namas hair salon', 'Salon Rambut', 4.9, 881, 'Jl. Frans Seda No.16', 'Buka Rab 10.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(135, 94, 'nio x barbershop', 'Tempat Cukur Rambut', 5.0, 9, 'Jl. Noelmina No.2kel', 'Tutup Rab 08.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(136, 95, 'Obed Barbershop', 'Tempat Cukur Rambut', 5.0, 1, 'Jl. Bhakti Karang No.88x', 'Buka Rab 09.30', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(137, 96, 'Panda Barbershop', 'Tempat Cukur Rambut', NULL, 0, 'Jl. W. Monginsidi III No.6', 'Tutup 22.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(138, 97, 'Pangkas Rambut & Toko Perabot (Display)', 'Tempat Cukur Rambut', 4.9, 22, 'Jl. H.R. Koroh RT.027/RW.011', 'Tutup 22.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(139, 98, 'Pangkas Rambut FM', 'Tempat Cukur Rambut', 4.8, 34, 'Jl. W.J. Lalamentik No.47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(140, 99, 'Pangkas Rambut Victory', 'Tempat Cukur Rambut', 4.1, 31, 'Jl. Jend. Soeharto', 'Buka Rab 09.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(141, 100, 'Papa2G Barbershop', 'Salon Rambut', 5.0, 1, 'Jl. Terusan Timor Raya No.10', 'Tutup 21.30', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(142, 101, 'Peak Barbershop and Beauty Salon', 'Salon Kecantikan', 4.7, 11, 'Jl. Perintis Kemerdekaan I', 'Buka Rab 09.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(143, 102, 'PJR Barbershop', 'Tempat Cukur Rambut', 5.0, 1, 'RJR8+W76', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(144, 103, 'REGIANO NALLE BARBERSHOP', 'Tempat Cukur Rambut', 5.0, 3, 'Jl. Kamboja', 'Buka Rab 10.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(145, 104, 'Redix BarberShop', 'Tempat Cukur Rambut', 4.8, 18, 'Jl. Yos Sudarso', 'Tutup 22.15', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(146, 105, 'Rock&roll barbershop', 'Tempat Cukur Rambut', NULL, 0, 'Jl. Samratulangi', 'Buka 21.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(147, 106, 'Ropesjo Barbershop', 'Kantor Perusahaan', 5.0, 2, 'Jl. Swakarya II', 'Buka Rab 08.30', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(148, 107, 'SHUFFAH BARBERSHOP', 'Tempat Cukur Rambut', 4.8, 84, 'Jl. Pahlawan', 'Buka Rab 10.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(149, 108, 'Shunan Barbershop', 'Tempat Cukur Rambut', 5.0, 1, '-', 'Buka Rab 09.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(150, 109, 'S.N. BARBERSHOP', 'Salon Rambut', 4.0, 1, 'Jl. TPU Liliba', 'Buka Rab 09.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(151, 110, 'Squad Barbershop', 'Tempat Cukur Rambut', 4.9, 14, 'Jl. Samratulangi', 'Buka Rab 10.15', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(152, 111, 'STARSBOX BARBERSHOP KUPANG', 'Tempat Cukur Rambut', 4.7, 39, 'Jl Monginsidi III Blok A', 'Buka Rab 10.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(153, 112, 'TABAS BARBERSHOP', 'Tempat Cukur Rambut', 5.0, 1, 'RJPX+PP9', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(154, 113, 'TEXAN BARBERSHOP', 'Toko Peralatan Pangkas Rambut', NULL, 0, 'Jl. Perintis Kemerdekaan I No.1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(155, 114, 'The Barberock\'s', 'Tempat Cukur Rambut', 4.3, 230, 'Jl. Cak Doko No.37', 'Buka Rab 10.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(156, 115, 'The Lexcut', 'Tempat Cukur Rambut', 5.0, 354, 'Jl. Tompello No.16', 'Buka Rab 09.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(157, 116, 'The Lucky Barbershop', 'Salon Rambut', 5.0, 3, 'Jl. Bund. PU Jl. TDM II', 'Tutup 22.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(158, 117, 'Timoer Barbershop', 'Salon Rambut', 5.0, 5, 'Jl. Amabi', 'Buka Rab 09.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(159, 118, 'Titox Barbershop', 'Salon Rambut', 4.4, 46, 'Jl. Pendidikan II No.3', 'Buka Rab 09.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(160, NULL, 'TO’O BARBERSHOP', 'Tempat Cukur Rambut', 5.0, 3, 'Jl. Taebenu', 'Buka Rab 09.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(161, 120, 'Triple-D Barbershop', 'Tempat Cukur Rambut', 3.6, 5, 'Jl. Samratulangi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(162, 121, 'Unfamous Barbershop', 'Tempat Cukur Rambut', 4.7, 3, 'Jl. Bunda Hati Kudus', 'Buka Rab 09.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(163, 122, 'WAR BARBERSHOP', 'Tempat Cukur Rambut', 5.0, 7, 'Rss Oesapa Blok J No 7', 'Tutup 22.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(164, 123, 'YTP Barbershop', 'Tempat Cukur Rambut', NULL, 0, 'Lili camplong', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-25 13:16:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL),
(165, 3, 'Barber Bang Sam', NULL, 4.5, 0, 'JL.OE,EKAM,Sikumana', 'Senin: 09:00-21:00, Selasa: 09:00-21:00, Rabu: 09:00-21:00, Kamis: 09:00-21:00, Jumat: 09:00-21:00, Sabtu: 09:00-21:00, Minggu: 09:00-21:00', 'https://www.google.com/maps?q=-10.206438,123.6040476&z=17&hl=en', NULL, NULL, NULL, 'assets/img/shops/shop_3_1774445450.jpeg', 'Rp 20.000 - Rp 70.000', 1, '2026-03-25 13:30:50', 'BRI', '748501024722538', 'Petra Miracle ME Lenggu', NULL, NULL, NULL, NULL, 'approved', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `barber_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `booking_date` date NOT NULL,
  `booking_time` time NOT NULL,
  `status` enum('pending','confirmed','completed','cancelled') DEFAULT 'pending',
  `payment_status` enum('unpaid','paid','forfeited') DEFAULT 'unpaid',
  `total_price` decimal(10,2) DEFAULT NULL,
  `qris_code` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `payment_proof` varchar(255) DEFAULT NULL,
  `reschedule_date` date DEFAULT NULL,
  `reschedule_time` time DEFAULT NULL,
  `reschedule_status` enum('pending','approved','rejected') DEFAULT NULL,
  `customer_lat` decimal(10,8) DEFAULT NULL,
  `customer_lng` decimal(11,8) DEFAULT NULL,
  `arrival_status` enum('unknown','on_way','arrived','no_show') DEFAULT 'unknown',
  `payment_method` enum('qris','transfer') DEFAULT 'qris'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `user_id`, `shop_id`, `barber_id`, `service_id`, `booking_date`, `booking_time`, `status`, `payment_status`, `total_price`, `qris_code`, `created_at`, `payment_proof`, `reschedule_date`, `reschedule_time`, `reschedule_status`, `customer_lat`, `customer_lng`, `arrival_status`, `payment_method`) VALUES
(5, 4, 165, 37, 35, '2026-03-27', '13:00:00', 'confirmed', 'paid', 15000.00, NULL, '2026-03-25 14:49:43', 'assets/img/payments/proof_5_1774450199.jpeg', NULL, NULL, NULL, NULL, NULL, 'unknown', 'qris'),
(7, 4, 165, 36, 35, '2026-03-28', '09:00:00', 'confirmed', 'paid', 15000.00, NULL, '2026-03-26 07:38:24', 'assets/img/payments/proof_7_1774510716.png', NULL, NULL, 'approved', NULL, NULL, 'unknown', 'qris');

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `portfolio_url` text DEFAULT NULL,
  `work_experience` text DEFAULT NULL,
  `tools_photo` varchar(255) DEFAULT NULL,
  `bnsp_cert` varchar(255) DEFAULT NULL,
  `certificates` text DEFAULT NULL,
  `diploma_photo` varchar(255) DEFAULT NULL,
  `portfolio_weight` int(11) DEFAULT 0,
  `experience_weight` int(11) DEFAULT 0,
  `tools_weight` int(11) DEFAULT 0,
  `bnsp_weight` int(11) DEFAULT 0,
  `cert_weight` int(11) DEFAULT 0,
  `diploma_weight` int(11) DEFAULT 0,
  `total_score` int(11) DEFAULT 0,
  `status` enum('pending','active','rejected') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `email_verified_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`id`, `name`, `email`, `password`, `phone`, `photo`, `shop_id`, `portfolio_url`, `work_experience`, `tools_photo`, `bnsp_cert`, `certificates`, `diploma_photo`, `portfolio_weight`, `experience_weight`, `tools_weight`, `bnsp_weight`, `cert_weight`, `diploma_weight`, `total_score`, `status`, `created_at`, `email_verified_at`) VALUES
(1, 'RIVALDY CHRISTIAN ADOE', 'rivaldy.adoe@gmail.com', '$2y$10$iwhI7mHGyvWkXhMNq6SYveH0.MG6gZC.6YlbVVbWKlFWWC0Q46I.i', '081353030694', NULL, 165, 'https://spay-portfolio.vercel.app/', 'saya sudah 5 tahun bekerja sebagai pencukur di salah satu barber di jakarta yakni barber king saya harap saya dapat di terima di toko ini dengan baik', 'tools_1774540851_Screenshot 2025-04-21 223701.png', 'bnsp_1774540851_Screenshot 2025-04-21 223712.png', 'cert_1774540851_Screenshot 2025-04-21 223744.png', 'diploma_1774540851_Screenshot 2025-04-21 223805.png', 20, 20, 15, 15, 15, 15, 100, 'active', '2026-03-26 16:00:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `sender_type` enum('customer','owner') NOT NULL,
  `sender_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `booking_id`, `sender_type`, `sender_id`, `message`, `is_read`, `created_at`) VALUES
(1, 7, 'customer', 4, 'HALLO', 1, '2026-03-26 10:01:51'),
(2, 7, 'owner', 3, 'bagaimana', 1, '2026-03-26 10:09:26'),
(3, 7, 'owner', 3, 'aman ko?', 1, '2026-03-26 10:09:30'),
(4, 7, 'customer', 4, 'its oke', 1, '2026-03-26 10:13:33'),
(5, 7, 'customer', 4, 'b sn suka dg u', 1, '2026-03-26 10:13:43'),
(6, 7, 'owner', 3, 'B SAYANG DIA', 1, '2026-03-26 10:32:24');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `type` enum('info','booking','payment','system') DEFAULT 'info',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `owners`
--

CREATE TABLE `owners` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `address` text DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `email_verified_at` datetime DEFAULT NULL,
  `email_verification_hash` char(64) DEFAULT NULL,
  `email_verification_expires_at` datetime DEFAULT NULL,
  `email_verification_sent_to` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `owners`
--

INSERT INTO `owners` (`id`, `name`, `phone`, `email`, `password`, `address`, `photo`, `created_at`, `email_verified_at`, `email_verification_hash`, `email_verification_expires_at`, `email_verification_sent_to`) VALUES
(3, 'smkindezz', '081236927067', 'smkindezz@gmail.com', '$2y$10$7EYyMWBXRMsucpUdeiqclOGcJprVtvRsThnlxBq1.TLNBFKLczXEG', 'JL.OE,EKAM, Sikumana', NULL, '2026-03-25 13:23:52', NULL, NULL, NULL, NULL),
(4, 'A2 barbershop', '081200000001', 'a2.barbershop1@pangkaskaka.id', '$2y$10$62gkd83xmZNm3Bz.Wdq63uaz8o1XA3dhVbEbAFIlA9NTH5CidKiYG', 'VM27+HP6', NULL, '2026-03-26 09:54:52', NULL, NULL, NULL, NULL),
(5, 'Aboni barbershop', '081200000002', 'aboni.barbershop2@pangkaskaka.id', '$2y$10$wVoyob605n6rurokCaMfr.Zmgg7/XMOgB/f7Ofqe6FGd5ItfwYx5.', '', NULL, '2026-03-26 09:54:52', NULL, NULL, NULL, NULL),
(6, 'ACF BARBERSHOP', '081200000003', 'acf.barbershop3@pangkaskaka.id', '$2y$10$DFfbIHyNQVb2ujBx2ZhqMeJFphLBUU2Dkfc16ujUlWLRMy/43.n4q', 'Jl. Taebenu No.1', NULL, '2026-03-26 09:54:52', NULL, NULL, NULL, NULL),
(7, 'Aidens Barbershop', '081200000004', 'aidens.barbershop4@pangkaskaka.id', '$2y$10$9wmxMYpTwidjt0KiiuptHueuWMkmSC3b6SdKDdxqRJDq30ma2BcA2', 'Jl. TDM V', NULL, '2026-03-26 09:54:52', NULL, NULL, NULL, NULL),
(8, 'AMRAN BARBERSHOP', '081200000005', 'amran.barbershop5@pangkaskaka.id', '$2y$10$GaYZINE2XeCHnq7LNEC1r.ci6IXIwi87g6JM6Txziq1OZn1sbG/Nu', 'Jl. Lakbanu No.32', NULL, '2026-03-26 09:54:52', NULL, NULL, NULL, NULL),
(9, 'Anasta Barbershop', '081200000006', 'anasta.barbershop6@pangkaskaka.id', '$2y$10$5mgXBBo/lh9gx.iJmVGEKO3oUf0i6n8y9dz3xDQgTByLqYLax4oEe', 'RJVC+V75', NULL, '2026-03-26 09:54:53', NULL, NULL, NULL, NULL),
(10, 'Angga Angelos (GB barbershop)', '081200000007', 'angga.angelos.gb.barbershop7@pangkaskaka.id', '$2y$10$8G2m.c9PweN1XZvfbJuvQu6p005MN.O4/oozRbJvkWp6zqJhrUC3m', 'Jl. Sikib RT.17/RW.06', NULL, '2026-03-26 09:54:53', NULL, NULL, NULL, NULL),
(11, 'ATOIN METO BARBERSHOP', '081200000008', 'atoin.meto.barbershop8@pangkaskaka.id', '$2y$10$Wo/zaKtAzEZyp6Rzt/HrOOmViVPeJptbXg9gQu.Iu9AtIsFQXLkNO', 'Jl. Kelinci No.238', NULL, '2026-03-26 09:54:53', NULL, NULL, NULL, NULL),
(12, 'B&W BARBERSHOP', '081200000009', 'b.w.barbershop9@pangkaskaka.id', '$2y$10$fA802v0mUI0J2NPrY/wJ5u6EPCuUcGRs9Y/17fIlbtaL9Npx5MQRW', 'Jl. Bajawa No.30', NULL, '2026-03-26 09:54:53', NULL, NULL, NULL, NULL),
(13, 'Bang ji barbershop', '081200000010', 'bang.ji.barbershop10@pangkaskaka.id', '$2y$10$s0dB.R6Tlk8PyoTqirMLvOiIKgosWHzD9x7rB83ZTa3o3lVi/sEz.', 'Jl. P. Kemerdekaan III No.7', NULL, '2026-03-26 09:54:53', NULL, NULL, NULL, NULL),
(14, 'Barber Shop BNB', '081200000011', 'barber.shop.bnb11@pangkaskaka.id', '$2y$10$Y292q7Aew/Jp1egtkwq1ye/OjBtSSnwLyYu4ozgv7AOEkCaVF.qu6', 'Jl. Oeleta Raya 003', NULL, '2026-03-26 09:54:53', NULL, NULL, NULL, NULL),
(15, 'Barbershop', '081200000012', 'barbershop12@pangkaskaka.id', '$2y$10$dek1TMwBC11fS98mcwMoz.U.FUf0QoxyxY1tpD2aKXu.a6vv5boV2', 'Jl. Dua Lontar', NULL, '2026-03-26 09:54:53', NULL, NULL, NULL, NULL),
(16, 'Barbershop 46', '081200000013', 'barbershop.4613@pangkaskaka.id', '$2y$10$po9S9zmgq3SUh54iPOg3UOsh1EmpOFMrsiyy0OJyzFvWrXPlcKnyS', 'Jl. Bhakti Karang', NULL, '2026-03-26 09:54:53', NULL, NULL, NULL, NULL),
(17, 'Barbershop AR46', '081200000014', 'barbershop.ar4614@pangkaskaka.id', '$2y$10$igyD2QVUx.XB0elKmWOMVOkcNZoYP4rb1gN/WGwRsDCB8tk6JnTky', 'Jl Fetor Foenay', NULL, '2026-03-26 09:54:53', NULL, NULL, NULL, NULL),
(18, 'Barbershop Barondang', '081200000015', 'barbershop.barondang15@pangkaskaka.id', '$2y$10$aPRiGGOCKkNKH/Sv8E8u6.asSjwXtgDw7jPu.fvBPCRh1e3rFVKL.', 'RHH4+C6C', NULL, '2026-03-26 09:54:54', NULL, NULL, NULL, NULL),
(19, 'Barbershop Bh41ra', '081200000016', 'barbershop.bh41ra16@pangkaskaka.id', '$2y$10$vENVN.QuVNM8ACjX/k8yVepqVC0qcfW9WIpLroy04XhjPldgRiqym', '', NULL, '2026-03-26 09:54:54', NULL, NULL, NULL, NULL),
(20, 'Barbershop Champen', '081200000017', 'barbershop.champen17@pangkaskaka.id', '$2y$10$z8DL88yLP2a6YsEzgz1PruRmdzxMkqJM8Xt2Yq4ILr9B1pBRd8snu', 'RJCF+Q6P', NULL, '2026-03-26 09:54:54', NULL, NULL, NULL, NULL),
(21, 'Barbershop GIMBO', '081200000018', 'barbershop.gimbo18@pangkaskaka.id', '$2y$10$ZEjSJ.ITvmCfmE04nLGNDOQoHxE0JW6WM1BdsFa2.NwCd.5BoEvOi', 'Jl. Anggur', NULL, '2026-03-26 09:54:54', NULL, NULL, NULL, NULL),
(22, 'BARBERSHOP KENAN', '081200000019', 'barbershop.kenan19@pangkaskaka.id', '$2y$10$m48TSDTYvpgrPy/Fdl4LmemH.8OwaBT4ujOzXkmcjOTmjz3o6UAwy', 'Jl. Farmasi', NULL, '2026-03-26 09:54:54', NULL, NULL, NULL, NULL),
(23, 'Barbershop KUMIS GANG', '081200000020', 'barbershop.kumis.gang20@pangkaskaka.id', '$2y$10$/I3gE8ru/S2jYG8kLKSdzuwLiklxxW4Snf5EIbQ1Cgr95yLau2RF6', 'Jl. Hati Mulia VI No.9', NULL, '2026-03-26 09:54:54', NULL, NULL, NULL, NULL),
(24, 'Barbershop Lusi', '081200000021', 'barbershop.lusi21@pangkaskaka.id', '$2y$10$diSQNw/5LnLtM3F61Y9bHuX66a2amJxn2TigwU4KBWmww1kQQaGdq', 'Jl. Amabi', NULL, '2026-03-26 09:54:54', NULL, NULL, NULL, NULL),
(25, 'Barbershop MR.Breewok', '081200000022', 'barbershop.mr.breewok22@pangkaskaka.id', '$2y$10$LvDBXePQ8s2QKSJ31XEtXeJzPjaUOzyI6buvt6r2ta54dDkkx/Y.K', 'Jl. Sahabat', NULL, '2026-03-26 09:54:54', NULL, NULL, NULL, NULL),
(26, 'Barbershop Pa De', '081200000023', 'barbershop.pa.de23@pangkaskaka.id', '$2y$10$ks/SlHcjL4V7BctSVvgz8Os1eMxOX9hBsRhVDKIlu6URJR3YPzf4i', 'Jl. TDM II', NULL, '2026-03-26 09:54:54', NULL, NULL, NULL, NULL),
(27, 'Barbershop PJKR Universitas San Pedro', '081200000024', 'barbershop.pjkr.universitas.san.pedro24@pangkaskaka.id', '$2y$10$Yzw2tDhZdQVu7sm14apgOOPUyyDOMIonZn4hNaOFVpbFSR4DPK5Oy', 'Jl. Farmasi No.32', NULL, '2026-03-26 09:54:54', NULL, NULL, NULL, NULL),
(28, 'Barbershop S.I.D', '081200000025', 'barbershop.s.i.d25@pangkaskaka.id', '$2y$10$Nsf.BaS./hyP9iJHEMW85eCmBqBXzGzXtR7ppkgi9YF/s19WlldZi', 'Jl. Jenderal Sudirman No.47', NULL, '2026-03-26 09:54:55', NULL, NULL, NULL, NULL),
(29, 'BARBERSHOP TRABAS', '081200000026', 'barbershop.trabas26@pangkaskaka.id', '$2y$10$/xGiwqHGsQvdqeljrwKTFeND7IkhYzPTnsm4EH02ak7TeYOc/p3u2', 'Jl. Farmasi', NULL, '2026-03-26 09:54:55', NULL, NULL, NULL, NULL),
(30, 'BARBERSHOP ZM', '081200000027', 'barbershop.zm27@pangkaskaka.id', '$2y$10$8cNNlVYOcs7rd98hkKxaaOUhu8NQVaNqhcHme1giLlY/qhhIdLiL6', 'RHQM+344', NULL, '2026-03-26 09:54:55', NULL, NULL, NULL, NULL),
(31, 'Barbershop88 ebufu', '081200000028', 'barbershop88.ebufu28@pangkaskaka.id', '$2y$10$6NtWp80.fqjV/bBcj8uoHOmnmMv5rHYLRQBP0kqZehTvYYDU5aT06', 'RJFC+RG6', NULL, '2026-03-26 09:54:55', NULL, NULL, NULL, NULL),
(32, 'BLACK BARBERSHOP', '081200000029', 'black.barbershop29@pangkaskaka.id', '$2y$10$PhkSb6lCWFZxYmHGAgUSLeVNigQyQk45kDngFsJs9EgW8UHAmDOkK', 'Jl. Pahlawan No.15', NULL, '2026-03-26 09:54:55', NULL, NULL, NULL, NULL),
(33, 'Black Red Barbershop', '081200000030', 'black.red.barbershop30@pangkaskaka.id', '$2y$10$fH1wDKy4XNBnQmJSgdHKAO/15PMNCX2Arsx39N/Iuj5ItP1REqaXW', 'Jl. Jend. Soeharto', NULL, '2026-03-26 09:54:55', NULL, NULL, NULL, NULL),
(34, 'Blessed barbershop', '081200000031', 'blessed.barbershop31@pangkaskaka.id', '$2y$10$4y2sNHVrrkzPNqPuIE3Dh.2FSWI3Fr6rkDp/8N5AoxMslv/Rj2rji', 'Jl. Soverdi', NULL, '2026-03-26 09:54:55', NULL, NULL, NULL, NULL),
(35, 'BOSS KICI BARBERSHOP', '081200000032', 'boss.kici.barbershop32@pangkaskaka.id', '$2y$10$uQt3glL0MxEJr7wbPgD94O6fpeL2Nkv8WiuasdYh01qqfCk5AfALC', 'RHPG+JP8', NULL, '2026-03-26 09:54:55', NULL, NULL, NULL, NULL),
(36, 'BosQiano Barber', '081200000033', 'bosqiano.barber33@pangkaskaka.id', '$2y$10$gvqAURbiGkwUlxqUbL2oC.z2lNc6gh4BGoXyBjUew4JUoD/AVpvNa', 'Jl. Farmasi Gang IV', NULL, '2026-03-26 09:54:55', NULL, NULL, NULL, NULL),
(37, 'BOXX BARBERSHOP', '081200000034', 'boxx.barbershop34@pangkaskaka.id', '$2y$10$jQ2gLzdQ0BC85xHAZscHZuzRlHyMrK7ZH6qnx9sSjIGwliaKoAQfy', 'Jl. Bumi I', NULL, '2026-03-26 09:54:56', NULL, NULL, NULL, NULL),
(38, 'Brader\'s Barbershop', '081200000035', 'brader.s.barbershop35@pangkaskaka.id', '$2y$10$/yuAb/xlxLrY/j/iK.TbOe9pXeD2L07sWstnHEmNuHbBGCmSXxSca', 'Jl. Pemuda', NULL, '2026-03-26 09:54:56', NULL, NULL, NULL, NULL),
(39, 'Brooklyn barbershop', '081200000036', 'brooklyn.barbershop36@pangkaskaka.id', '$2y$10$cns/gLeFQrpfpCnL1GUGruH3Bf1U9dG59/blftJfm5ayx7gMapeBO', 'Jl. Bhakti Karya', NULL, '2026-03-26 09:54:56', NULL, NULL, NULL, NULL),
(40, 'Cfk Barbershop', '081200000037', 'cfk.barbershop37@pangkaskaka.id', '$2y$10$EXW9RAbH5EeEEczkvz46ieaxII7COJDG3I.ShW/6kwq.pdkLpFiWy', '', NULL, '2026-03-26 09:54:56', NULL, NULL, NULL, NULL),
(41, 'Coral Barbershop', '081200000038', 'coral.barbershop38@pangkaskaka.id', '$2y$10$9/NrkS0MP/thYpKsn7GU4uzA6SrzArT2Pae13nvlRBsuO1h71m80e', 'Jl. Tompello No.31B', NULL, '2026-03-26 09:54:56', NULL, NULL, NULL, NULL),
(42, 'Coral Barbershop (Perumnas)', '081200000039', 'coral.barbershop.perumnas39@pangkaskaka.id', '$2y$10$1aexV.nC/PKcqiBK/Lxef..aZeny6jNtMCLMGYAJtncnRmEo8FXGy', 'Jl. Bhakti Karang', NULL, '2026-03-26 09:54:56', NULL, NULL, NULL, NULL),
(43, 'D GANTENG BARBERSHOP', '081200000040', 'd.ganteng.barbershop40@pangkaskaka.id', '$2y$10$aVABloW/gURX25QrrmlbsOk8FkI.DY4qPydxvlRHkYu0VLeAHqCuu', 'RHJR+39F', NULL, '2026-03-26 09:54:56', NULL, NULL, NULL, NULL),
(44, 'DAENG BARBERSHOP', '081200000041', 'daeng.barbershop41@pangkaskaka.id', '$2y$10$nhFpwt5C3MiRibRbhu4s4Oo0eH2zql44tbJUK.OhyejtobIapczaG', 'Jl. TDM II', NULL, '2026-03-26 09:54:56', NULL, NULL, NULL, NULL),
(45, 'David barbershop', '081200000042', 'david.barbershop42@pangkaskaka.id', '$2y$10$cs67CSXF3A1wvIcXwmFyoOHXYWrgCfo.PiZ7bkgMuGf39p3ctfTTm', 'Jl. Pahlawan', NULL, '2026-03-26 09:54:56', NULL, NULL, NULL, NULL),
(46, 'DiZett Barbershop', '081200000043', 'dizett.barbershop43@pangkaskaka.id', '$2y$10$sqWcW8b4Riw1c.L.s5aGye3MLXALs8QYRItEHM4S.1lWHL06ECeWK', 'RJP9+WH7', NULL, '2026-03-26 09:54:56', NULL, NULL, NULL, NULL),
(47, 'El NiNo Barbershop', '081200000044', 'el.nino.barbershop44@pangkaskaka.id', '$2y$10$ADeyCNc1wUHbjotmFsA0kebfsX1YhmDdZExoDPjBKtK54EWCtLHba', 'RJXM+2P6', NULL, '2026-03-26 09:54:56', NULL, NULL, NULL, NULL),
(48, 'ElArJu Barbershop & Online shop', '081200000045', 'elarju.barbershop.online.shop45@pangkaskaka.id', '$2y$10$8aDZay2TRIbbSt8OGYyruuRH1h/XObu86mut2nmTMoKLV5hAuXe/K', 'Jl. Alfons Nisnoni', NULL, '2026-03-26 09:54:57', NULL, NULL, NULL, NULL),
(49, 'Eleven Barbershop', '081200000046', 'eleven.barbershop46@pangkaskaka.id', '$2y$10$5aNWxJq0EQmMDIqkp5Q8juq2G42aAqa3k5Y1.ANP3xUvID9D5AYge', 'Jl. Farmasi No.12', NULL, '2026-03-26 09:54:57', NULL, NULL, NULL, NULL),
(50, 'Etho Barbershop', '081200000047', 'etho.barbershop47@pangkaskaka.id', '$2y$10$vS7yFJbSBHzk4a0iNyS6D.waYuU641dJnBDOHQ2nZ0/yZx/gR5k9G', 'Jl. Soverdi', NULL, '2026-03-26 09:54:57', NULL, NULL, NULL, NULL),
(51, 'FanRel Barbershop', '081200000048', 'fanrel.barbershop48@pangkaskaka.id', '$2y$10$hBUPpUxLVmnZCBEBT56qfeYwbrnzPQ4n6yvYt2VJ/gL2TpncRAQhe', 'Jl. Bhakti Besi No.01', NULL, '2026-03-26 09:54:57', NULL, NULL, NULL, NULL),
(52, 'Forah Barbershop', '081200000049', 'forah.barbershop49@pangkaskaka.id', '$2y$10$yGPXDaW/R/wFKqc/tCxiyOaEY/y9Y3BjLdUMEtv29a24Mx/T.kahC', 'Jl. Prof. Dr. Herman Johanes No.88', NULL, '2026-03-26 09:54:57', NULL, NULL, NULL, NULL),
(53, 'Freedombarber\'s', '081200000050', 'freedombarber.s50@pangkaskaka.id', '$2y$10$1BGhgYfZqWKWo5cSWxJOreG3FyaUOVlCqqsQw5LycrUDMMYO8IMlu', 'Jl. HTI Maulafa', NULL, '2026-03-26 09:54:57', NULL, NULL, NULL, NULL),
(54, 'Fries Barbershop', '081200000051', 'fries.barbershop51@pangkaskaka.id', '$2y$10$WkFQqeOJBumqtENSSyocBuyAgESSt7PdlgyES027cJxWpBIQdyK.a', 'Jl. W.J. Lalamentik', NULL, '2026-03-26 09:54:57', NULL, NULL, NULL, NULL),
(55, 'G R E M \' S BARBERSHOP', '081200000052', 'g.r.e.m.s.barbershop52@pangkaskaka.id', '$2y$10$4VAVsn7jAoXnXxx/9qUK/OmNUWi7D5p.cTgn1H3A7h7LMMbIRtWVS', 'Jl. Sumatera', NULL, '2026-03-26 09:54:57', NULL, NULL, NULL, NULL),
(56, 'Gaul Barbershop', '081200000053', 'gaul.barbershop53@pangkaskaka.id', '$2y$10$wpiE2PJrfcMImvnRtU75A..Tpr/eolElWsijo4ocQQRqVgK5nkJru', 'Jl. Perintis Kemerdekaan I', NULL, '2026-03-26 09:54:57', NULL, NULL, NULL, NULL),
(57, 'Gentle-Man Barbershop', '081200000054', 'gentle.man.barbershop54@pangkaskaka.id', '$2y$10$hEP.dupmYN22AnrO8JaUY.xsFW.s3F85RHKWElR1uVn/dtjtGZWzC', 'Jl. Fetor Funay', NULL, '2026-03-26 09:54:57', NULL, NULL, NULL, NULL),
(58, 'Gentlemen\'s Barbershop Sumatera', '081200000055', 'gentlemen.s.barbershop.sumatera55@pangkaskaka.id', '$2y$10$A7IbvjQcbWc25YVL6cZK.OS3XtIgMBs9s8POzvHjoXIpL7gC0XdZK', 'Jl. Sumatera', NULL, '2026-03-26 09:54:58', NULL, NULL, NULL, NULL),
(59, 'GOOD BARBERSHOP', '081200000056', 'good.barbershop56@pangkaskaka.id', '$2y$10$6.ACPEkjI87.2fGH6aNbzuDeoe/jOJNTHMVtvFhxi/vj0BrrJq93.', 'Jl. Shopping Centre', NULL, '2026-03-26 09:54:58', NULL, NULL, NULL, NULL),
(60, 'Goots Mini Barbershop', '081200000057', 'goots.mini.barbershop57@pangkaskaka.id', '$2y$10$QieSPeetsfvfqkriWqAavOc6K8YsPykf7ugjh7lKYCkeMMZAUOOCa', 'Jl. Kesekrom No.4', NULL, '2026-03-26 09:54:58', NULL, NULL, NULL, NULL),
(61, 'Grachio Barbershop', '081200000058', 'grachio.barbershop58@pangkaskaka.id', '$2y$10$LwI2IhA7YhCkrZ3J8zbzUee/XIVNXjBH9GmMiE4zx3mpJIvibjepW', 'Jl. Bajawa', NULL, '2026-03-26 09:54:58', NULL, NULL, NULL, NULL),
(62, 'Grevlin Barbershop', '081200000059', 'grevlin.barbershop59@pangkaskaka.id', '$2y$10$kWyYbNbaQHe4KR0YC9bcwOO9pyLMtOGk2P5Vqkfgm7kz0jBYr9uEK', 'RJPF+794', NULL, '2026-03-26 09:54:58', NULL, NULL, NULL, NULL),
(63, 'Growmen salon', '081200000060', 'growmen.salon60@pangkaskaka.id', '$2y$10$jMNlslg8nqHGg5hcDnJDpuN5OLy0UnESMsyABbrN/1FNUAqItmJl6', 'jln. banteng mapoli kel', NULL, '2026-03-26 09:54:58', NULL, NULL, NULL, NULL),
(64, 'Ichat barbershop', '081200000061', 'ichat.barbershop61@pangkaskaka.id', '$2y$10$WjMd3J5bLBLEbPo5iUaSsuIp9iIo0/PIp8x8zs/MytVn1oY9crnwa', 'Jl. TDM II', NULL, '2026-03-26 09:54:58', NULL, NULL, NULL, NULL),
(65, 'Icky BARBERSHOP', '081200000062', 'icky.barbershop62@pangkaskaka.id', '$2y$10$Odb3zwQd7Pus3gw8HI84wOiNH35Crx40Q8JFNFQCocFmqlp/Onuim', 'RJJC+P4F', NULL, '2026-03-26 09:54:58', NULL, NULL, NULL, NULL),
(66, 'J1 BARBERSHOP', '081200000063', 'j1.barbershop63@pangkaskaka.id', '$2y$10$FSb12.CqGjOpw3FLIt07tOcEHBj2S/eg8nbccJoAHX9KcDfvH5LU2', 'Jl. Fetor Funay No.8', NULL, '2026-03-26 09:54:58', NULL, NULL, NULL, NULL),
(67, 'Jhian Barbershop', '081200000064', 'jhian.barbershop64@pangkaskaka.id', '$2y$10$oXAuwU5OALPBRJg62nZPQu0NLYYqqSqIPN4/vJg1sPEa0TOl9ucV2', 'Jl. Perintis Kemerdekaan I', NULL, '2026-03-26 09:54:58', NULL, NULL, NULL, NULL),
(68, 'JM BARBERSHOP 2018', '081200000065', 'jm.barbershop.201865@pangkaskaka.id', '$2y$10$7/dBh0/zG6GLD1D7yaevgOScSR6geckESuzD.4edx4pV8drx6iJqe', 'Jl. W. Monginsidi III', NULL, '2026-03-26 09:54:59', NULL, NULL, NULL, NULL),
(69, 'JOKER BARBERSHOP', '081200000066', 'joker.barbershop66@pangkaskaka.id', '$2y$10$NmKexDI.PVxjEpAsdaLAmePAJT0Y8UTKiPoz13pUefblRewp5WdS.', 'Jl. Banteng', NULL, '2026-03-26 09:54:59', NULL, NULL, NULL, NULL),
(70, 'JR BARBERSHOP', '081200000067', 'jr.barbershop67@pangkaskaka.id', '$2y$10$xre9q9AzF2PAlrIrkWhJIOulPRSZnbbgqkGCgeamJR6cGgYluB4nq', 'Jl. Frans Seda', NULL, '2026-03-26 09:54:59', NULL, NULL, NULL, NULL),
(71, 'KAIROS BARBERSHOP', '081200000068', 'kairos.barbershop68@pangkaskaka.id', '$2y$10$XYkPOejLAPxFLLloDYU6gOKZVTwJ49q3Z83p4KKl.pG54rsaLfcku', 'Jl. Swakarya II', NULL, '2026-03-26 09:54:59', NULL, NULL, NULL, NULL),
(72, 'Keluar-Keluar Ganteng Barbershop', '081200000069', 'keluar.keluar.ganteng.barbershop69@pangkaskaka.id', '$2y$10$7O9IrxX8iCla8RkaUaUnB.GFtxBXTSFphI0b.Zo4aVSxI8GLpuczu', '', NULL, '2026-03-26 09:54:59', NULL, NULL, NULL, NULL),
(73, 'KEY BARBERSHOP', '081200000070', 'key.barbershop70@pangkaskaka.id', '$2y$10$jMIR02FCDf5IaSTsxNOVe.GWairRwuLRTbtiStesda4v62q7QKE7.', 'Jl. Perintis Kemerdekaan I No.5', NULL, '2026-03-26 09:54:59', NULL, NULL, NULL, NULL),
(74, 'King Barber Shop', '081200000071', 'king.barber.shop71@pangkaskaka.id', '$2y$10$kvunei9Lj9WIaMz6XCVr6e47faSOKaHgtEF6GJpenEZpsEKtBnrme', 'Jl. H.R. Koroh No.168', NULL, '2026-03-26 09:54:59', NULL, NULL, NULL, NULL),
(75, 'KING BARBERSHOP', '081200000072', 'king.barbershop72@pangkaskaka.id', '$2y$10$/dJmFIOMHamivC4YfDAXC.a.a6H2I2Fn9jkLYMITECfzn1UTC4AQy', 'Jl. W.J. Lalamentik', NULL, '2026-03-26 09:54:59', NULL, NULL, NULL, NULL),
(76, 'Koe Barbershop', '081200000073', 'koe.barbershop73@pangkaskaka.id', '$2y$10$q7G6XpY8HdKERM8GnCfM/O0qtbH3jncHpRYobR2PyxV.S5HAST1oe', 'Jl. Dua Lontar', NULL, '2026-03-26 09:54:59', NULL, NULL, NULL, NULL),
(77, 'Koe Barbershop (Bumi I)', '081200000074', 'koe.barbershop.bumi.i74@pangkaskaka.id', '$2y$10$AQikgv2vLtRrHx9HV/34lu7fnXnp67/GUvviBDmm/eKd385LLqvq2', 'Jl. Bumi I', NULL, '2026-03-26 09:54:59', NULL, NULL, NULL, NULL),
(78, 'Lapan Lapan Barbershop Cabang Oebufu', '081200000075', 'lapan.lapan.barbershop.cabang.oebufu75@pangkaskaka.id', '$2y$10$5GV/dMmaxaCTjPrlASVxLeEWAL3GwuQws6ngseJZpK346cXyVsgHe', 'Jl. W.J. Lalamentik No.117', NULL, '2026-03-26 09:54:59', NULL, NULL, NULL, NULL),
(79, 'Lapan lapan barbershop cabang merdeka', '081200000076', 'lapan.lapan.barbershop.cabang.merdeka76@pangkaskaka.id', '$2y$10$XhYhh9OUFTupkrQCq5dtyOWmB8D44dTwuMpFcF8zBAp6mEnXjbwhS', '', NULL, '2026-03-26 09:55:00', NULL, NULL, NULL, NULL),
(80, 'Lapanlapan Barbershop', '081200000077', 'lapanlapan.barbershop77@pangkaskaka.id', '$2y$10$OfKczBiFsYn/YXlejhgCaOW0HSi6VBVOucvQy9rFBdoqz4ghWg412', 'Jl. Shopping Centre No.33', NULL, '2026-03-26 09:55:00', NULL, NULL, NULL, NULL),
(81, 'LC BARBERSHOP', '081200000078', 'lc.barbershop78@pangkaskaka.id', '$2y$10$.KD.3c3NvYCQcde6jaiHle1EkFecOeikNOMNXv75.66h.o26/t7TS', 'Jl. Prof. Dr. Herman Johanes', NULL, '2026-03-26 09:55:00', NULL, NULL, NULL, NULL),
(82, 'Locker barbershop', '081200000079', 'locker.barbershop79@pangkaskaka.id', '$2y$10$pYzTyI2MyKrqoafIbIlFbuTsGRaHkFhvjR/sMMf6xwNFuUzTKvgt.', 'Jl. W.J. Lalamentik No.66', NULL, '2026-03-26 09:55:00', NULL, NULL, NULL, NULL),
(83, 'Lordez Barbershop', '081200000080', 'lordez.barbershop80@pangkaskaka.id', '$2y$10$uJi1q.9V1mP6DysQxHC./.aSdjdMDdVIeUPM3YTBP4BrFTNOEhvCy', '99QC+287', NULL, '2026-03-26 09:55:00', NULL, NULL, NULL, NULL),
(84, 'LUXURY barbershop', '081200000081', 'luxury.barbershop81@pangkaskaka.id', '$2y$10$dmTQ7StRUyPy9o8KAKCyPOuLVsMhhUhfZbRRCfuUTZIGwWpN/8nE6', 'Jl. Nangka No.38', NULL, '2026-03-26 09:55:00', NULL, NULL, NULL, NULL),
(85, 'MANLIEST BARBERSHOP', '081200000082', 'manliest.barbershop82@pangkaskaka.id', '$2y$10$luEN1U/1UsgpxEq61DGkoupshvwHPiT135ZtXvsoCs3gD9s37sSS.', 'Jl. Gunung Mutis No.31', NULL, '2026-03-26 09:55:00', NULL, NULL, NULL, NULL),
(86, 'MANLIEST BARBERSHOP OEBUFU', '081200000083', 'manliest.barbershop.oebufu83@pangkaskaka.id', '$2y$10$r5iVQxLbQCVeSJIMIqb7xOVaiJcUYUW6XYGqp8sAuWEX48rXDGIJW', 'Jl. W.J. Lalamentik', NULL, '2026-03-26 09:55:00', NULL, NULL, NULL, NULL),
(87, 'MANLIEST BARBERSHOP PASIR PANJANG', '081200000084', 'manliest.barbershop.pasir.panjang84@pangkaskaka.id', '$2y$10$66yJBukQkW2LrE.qJ2GeTOWAPneu63v1iQhd71BKhQYeaOKHb6G52', 'Jl. Terusan Timor Raya No.120 A', NULL, '2026-03-26 09:55:00', NULL, NULL, NULL, NULL),
(88, 'Manoah Barbershop Cab. Kelapa Lima', '081200000085', 'manoah.barbershop.cab.kelapa.lima85@pangkaskaka.id', '$2y$10$jZ6znqzl7uGqhgpZ1gTZDuYzE8cdQYT50ahjeeAZXo6QYKIyNI.pC', 'Jl. Perintis Kemerdekaan', NULL, '2026-03-26 09:55:01', NULL, NULL, NULL, NULL),
(89, 'Max Salon', '081200000086', 'max.salon86@pangkaskaka.id', '$2y$10$puOf1GT7uMuC0lTCZqNpZOOsIVaA8TDlBP6ExWJvTPULBsaMb2r8y', 'Jl. W.J. Lalamentik', NULL, '2026-03-26 09:55:01', NULL, NULL, NULL, NULL),
(90, 'ML Barbershop', '081200000087', 'ml.barbershop87@pangkaskaka.id', '$2y$10$9FLF3sXioAfm4d5hnCP8HewSX6zj12z5i2ZP66jXZt.Vm/td47OtS', 'Jl. Samratulangi No.3', NULL, '2026-03-26 09:55:01', NULL, NULL, NULL, NULL),
(91, 'MMS BARBERSHOP', '081200000088', 'mms.barbershop88@pangkaskaka.id', '$2y$10$.9zddCeBpyFr3bETs3JtXO1ZDZDSlLHDYVUcgqM0c8GI3D6PapDBG', 'Jl. K. H. Ahmad Dahlan No.19', NULL, '2026-03-26 09:55:01', NULL, NULL, NULL, NULL),
(93, 'Namas hair salon', '081200000090', 'namas.hair.salon90@pangkaskaka.id', '$2y$10$yV9M83zMsHzMVvu6KQ7K3uqOALeL/5zSR5foVRy8iEjFs6L19e2ja', 'Jl. Frans Seda No.16', NULL, '2026-03-26 09:55:01', NULL, NULL, NULL, NULL),
(94, 'nio x barbershop', '081200000091', 'nio.x.barbershop91@pangkaskaka.id', '$2y$10$gQ.MoisYtHAEmYs8Uf8ss.WZlYSUKHi12LgJ4WwLw9CRy563Lv8Jy', 'Jl. Noelmina No.2kel', NULL, '2026-03-26 09:55:01', NULL, NULL, NULL, NULL),
(95, 'Obed Barbershop', '081200000092', 'obed.barbershop92@pangkaskaka.id', '$2y$10$Of3K7KX3IZmX07s1URv11ud4rpO0Rq6uKixHqtcc1kIyuNFMnKJpS', 'Jl. Bhakti Karang No.88x', NULL, '2026-03-26 09:55:01', NULL, NULL, NULL, NULL),
(96, 'Panda Barbershop', '081200000093', 'panda.barbershop93@pangkaskaka.id', '$2y$10$z2YtRoWXy0lED2QnIFnk7.7IT3qhX.5kMSCaZomf0cJrLMuVLRnz2', 'Jl. W. Monginsidi III No.6', NULL, '2026-03-26 09:55:01', NULL, NULL, NULL, NULL),
(97, 'Pangkas Rambut & Toko Perabot (Display)', '081200000094', 'pangkas.rambut.toko.perabot.display94@pangkaskaka.id', '$2y$10$UKV5CNHiXOfeG18bqKkxjOfC49diKi4GRpqCisaufdTqTfGzr1bbK', 'Jl. H.R. Koroh RT.027/RW.011', NULL, '2026-03-26 09:55:02', NULL, NULL, NULL, NULL),
(98, 'Pangkas Rambut FM', '081200000095', 'pangkas.rambut.fm95@pangkaskaka.id', '$2y$10$De2RWz./5GNpQpWfLmFzi.RzvCmXY4YmEeXx12yw2reUHLhNtlrMy', 'Jl. W.J. Lalamentik No.47', NULL, '2026-03-26 09:55:02', NULL, NULL, NULL, NULL),
(99, 'Pangkas Rambut Victory', '081200000096', 'pangkas.rambut.victory96@pangkaskaka.id', '$2y$10$NzYCnCKtZQ9utpX9wxK/s.kiMQaE1iJDXJjJtQBf776toIKr3HtBW', 'Jl. Jend. Soeharto', NULL, '2026-03-26 09:55:02', NULL, NULL, NULL, NULL),
(100, 'Papa2G Barbershop', '081200000097', 'papa2g.barbershop97@pangkaskaka.id', '$2y$10$z2A6D86pDokHC6BbE9.iKum01DJIrHe7CYZyN8uRX8N3xuxdp9YIu', 'Jl. Terusan Timor Raya No.10', NULL, '2026-03-26 09:55:02', NULL, NULL, NULL, NULL),
(101, 'Peak Barbershop and Beauty Salon', '081200000098', 'peak.barbershop.and.beauty.salon98@pangkaskaka.id', '$2y$10$KSSs.ZXrFpZVvubsWu3JruRm.M8wqGec33qn9Ifjpa54S2u7ZOTRm', 'Jl. Perintis Kemerdekaan I', NULL, '2026-03-26 09:55:02', NULL, NULL, NULL, NULL),
(102, 'PJR Barbershop', '081200000099', 'pjr.barbershop99@pangkaskaka.id', '$2y$10$KlEBH4GuFYWzVZSI7isQx.1OgolHwR2.zx7pVAlw94XhX2uDyU792', 'RJR8+W76', NULL, '2026-03-26 09:55:02', NULL, NULL, NULL, NULL),
(103, 'REGIANO NALLE BARBERSHOP', '081200000100', 'regiano.nalle.barbershop100@pangkaskaka.id', '$2y$10$m2Wpr/QdFFxn2ltxFmD5vu1TXqL1gCffknoWtLtNvj3un6eRCa0oG', 'Jl. Kamboja', NULL, '2026-03-26 09:55:02', NULL, NULL, NULL, NULL),
(104, 'Redix BarberShop', '081200000101', 'redix.barbershop101@pangkaskaka.id', '$2y$10$o0/VKahFeb4VaKzLguuJvO1f8W/p7GoiKkj/2.q6TWz968i8zZDzC', 'Jl. Yos Sudarso', NULL, '2026-03-26 09:55:02', NULL, NULL, NULL, NULL),
(105, 'Rock&roll barbershop', '081200000102', 'rock.roll.barbershop102@pangkaskaka.id', '$2y$10$ttH5YtoT4KLsUXXGbunHE.G3NRzPSKPk0LaOjzT/lK9lworNj5cn2', 'Jl. Samratulangi', NULL, '2026-03-26 09:55:02', NULL, NULL, NULL, NULL),
(106, 'Ropesjo Barbershop', '081200000103', 'ropesjo.barbershop103@pangkaskaka.id', '$2y$10$0m7YQSPvwndV3s82779MsuFZYEUvE3.Eb6OlRtLqNj2FLUsXxBRai', 'Jl. Swakarya II', NULL, '2026-03-26 09:55:02', NULL, NULL, NULL, NULL),
(107, 'SHUFFAH BARBERSHOP', '081200000104', 'shuffah.barbershop104@pangkaskaka.id', '$2y$10$bdxhNOlQIiNVFipGbAmdUOvpR6ihcaSZhlMPC2.GezAw/8BXAh8wG', 'Jl. Pahlawan', NULL, '2026-03-26 09:55:03', NULL, NULL, NULL, NULL),
(108, 'Shunan Barbershop', '081200000105', 'shunan.barbershop105@pangkaskaka.id', '$2y$10$mUpkQV1RZMfaa2Om90Q9n.tyEcw7C60nYsm8GunzPBSRXK9nnLdXi', '', NULL, '2026-03-26 09:55:03', NULL, NULL, NULL, NULL),
(109, 'S.N. BARBERSHOP', '081200000106', 's.n.barbershop106@pangkaskaka.id', '$2y$10$WGzhN7nGv8pkb34PubH.CO/UU26Cta2c3wjDRlmnURl2Hl8OeAC8e', 'Jl. TPU Liliba', NULL, '2026-03-26 09:55:03', NULL, NULL, NULL, NULL),
(110, 'Squad Barbershop', '081200000107', 'squad.barbershop107@pangkaskaka.id', '$2y$10$XMkXbB1t.VLJouwWVWH6rehHr3NZ3HCfXB5F.ZQKnzWQw65UQ85wi', 'Jl. Samratulangi', NULL, '2026-03-26 09:55:03', NULL, NULL, NULL, NULL),
(111, 'STARSBOX BARBERSHOP KUPANG', '081200000108', 'starsbox.barbershop.kupang108@pangkaskaka.id', '$2y$10$Lm6YMF/KHZbkSybKSzXcd.VUCmZorpyJMczrNXw0rt3cUp/iilz1q', 'Jl Monginsidi III Blok A', NULL, '2026-03-26 09:55:03', NULL, NULL, NULL, NULL),
(112, 'TABAS BARBERSHOP', '081200000109', 'tabas.barbershop109@pangkaskaka.id', '$2y$10$8iO8AhMoCuQX/nTg1QgmyuJjW9oJA9KKaYd.s5nNEv/CWaN64Ekra', 'RJPX+PP9', NULL, '2026-03-26 09:55:03', NULL, NULL, NULL, NULL),
(113, 'TEXAN BARBERSHOP', '081200000110', 'texan.barbershop110@pangkaskaka.id', '$2y$10$CLMUcPkbKE9eD7AK0jcN.eww9Og7BZZ9SOPNs.7MFTZlGOM6G4B3C', 'Jl. Perintis Kemerdekaan I No.1', NULL, '2026-03-26 09:55:03', NULL, NULL, NULL, NULL),
(114, 'The Barberock\'s', '081200000111', 'the.barberock.s111@pangkaskaka.id', '$2y$10$HWgM5LBQj1Yt0YvRlvY7VOw5of9LvK5k9G0etNrqEXLPKSvRTTA7i', 'Jl. Cak Doko No.37', NULL, '2026-03-26 09:55:03', NULL, NULL, NULL, NULL),
(115, 'The Lexcut', '081200000112', 'the.lexcut112@pangkaskaka.id', '$2y$10$dVQtUYbZiLV.rihhqd7XjOPQcFu7sHWC.qzisaRTQVGTrcKBZOCRq', 'Jl. Tompello No.16', NULL, '2026-03-26 09:55:03', NULL, NULL, NULL, NULL),
(116, 'The Lucky Barbershop', '081200000113', 'the.lucky.barbershop113@pangkaskaka.id', '$2y$10$no3V54/9TgPU4IG7AvWccOSB9KrtBupz4Xg.XHiqCmcGic1jFBGpm', 'Jl. Bund. PU Jl. TDM II', NULL, '2026-03-26 09:55:04', NULL, NULL, NULL, NULL),
(117, 'Timoer Barbershop', '081200000114', 'timoer.barbershop114@pangkaskaka.id', '$2y$10$kduoqy/XTjU3waHeQHNbq...Ib5gtrjH.G5R6VGhNVGr0d51c9xMe', 'Jl. Amabi', NULL, '2026-03-26 09:55:04', NULL, NULL, NULL, NULL),
(118, 'Titox Barbershop', '081200000115', 'titox.barbershop115@pangkaskaka.id', '$2y$10$hIgi2tShC28CmU1n2ey8Kuvc6OplgPOwT3LpMDTmgy3OjWbTOM9fa', 'Jl. Pendidikan II No.3', NULL, '2026-03-26 09:55:04', NULL, NULL, NULL, NULL),
(119, 'TOâ€™O BARBERSHOP', '081200000116', 'to.o.barbershop116@pangkaskaka.id', '$2y$10$fFkdKjEkCgrJiO8F7417TeCPT7KrcwpBaDs1EjjPPVagkLjoYHb42', 'Jl. Taebenu', NULL, '2026-03-26 09:55:04', NULL, NULL, NULL, NULL),
(120, 'Triple-D Barbershop', '081200000117', 'triple.d.barbershop117@pangkaskaka.id', '$2y$10$FFAZngycZ2kmdoXoHlpxnO8BO1qxQQ8fmpecevCvWyM9VoinJQSly', 'Jl. Samratulangi', NULL, '2026-03-26 09:55:04', NULL, NULL, NULL, NULL),
(121, 'Unfamous Barbershop', '081200000118', 'unfamous.barbershop118@pangkaskaka.id', '$2y$10$.GsXcsAWtiCk5JxCFextEO.BaU3BPCvXBnrPkBCuPKC1NlNVjSo2u', 'Jl. Bunda Hati Kudus', NULL, '2026-03-26 09:55:04', NULL, NULL, NULL, NULL),
(122, 'WAR BARBERSHOP', '081200000119', 'war.barbershop119@pangkaskaka.id', '$2y$10$MFYqoIKEKaM6T3occbiimuPWmvhvENCfH9v9vjfy5BSEkooYq/7fi', 'Rss Oesapa Blok J No 7', NULL, '2026-03-26 09:55:04', NULL, NULL, NULL, NULL),
(123, 'YTP Barbershop', '081200000120', 'ytp.barbershop120@pangkaskaka.id', '$2y$10$PU/.I77fQK9pYfOVQXWiR.Iyr0g4h7vCwj6FkX.CxYx0awY/JUw4W', 'Lili camplong', NULL, '2026-03-26 09:55:05', NULL, NULL, NULL, NULL),
(124, 'Rivalldy Adoe', '08123424425', 'rivaldy@gmail.com', '$2y$10$1lVX/yKsbOH6yQFovL.ggeqXo9eoB23EG9DIeUKZeG9Bf4g1xtsuW', 'El.tari', NULL, '2026-03-30 11:03:38', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `owner_criteria`
--

CREATE TABLE `owner_criteria` (
  `id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `is_mandatory` tinyint(1) DEFAULT 1,
  `sort_order` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `owner_criteria`
--

INSERT INTO `owner_criteria` (`id`, `title`, `description`, `is_mandatory`, `sort_order`) VALUES
(1, 'Memiliki KTP / Identitas Diri yang Valid', 'Pemilik barbershop wajib memiliki KTP atau identitas resmi yang masih berlaku.', 1, 1),
(2, 'Memiliki Tempat Usaha yang Layak', 'Barbershop harus memiliki lokasi fisik yang jelas, bersih, dan layak untuk digunakan.', 1, 2),
(3, 'Memiliki Minimal 1 Barber Profesional', 'Setidaknya 1 barber yang berpengalaman dan profesional tersedia di barbershop.', 1, 3),
(4, 'Bersedia Mengikuti SOP Pangkas Kaka', 'Pemilik setuju untuk mematuhi dan menjalankan Standar Operasional Prosedur yang ditetapkan Pangkas Kaka.', 1, 4),
(5, 'Memiliki Peralatan Lengkap', 'Barbershop harus dilengkapi peralatan standar: gunting, mesin cukur, sisir, dan perlengkapan kebersihan.', 1, 5),
(6, 'Menjaga Kebersihan Tempat Usaha', 'Komitmen untuk menjaga kebersihan area kerja sebelum dan sesudah melayani pelanggan.', 0, 6);

-- --------------------------------------------------------

--
-- Table structure for table `owner_criteria_checklist`
--

CREATE TABLE `owner_criteria_checklist` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `criteria_id` int(11) NOT NULL,
  `is_checked` tinyint(1) DEFAULT 0,
  `checked_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `owner_criteria_checklist`
--

INSERT INTO `owner_criteria_checklist` (`id`, `owner_id`, `criteria_id`, `is_checked`, `checked_at`) VALUES
(1, 124, 1, 1, '2026-03-30 11:03:38'),
(2, 124, 2, 1, '2026-03-30 11:03:38'),
(3, 124, 3, 1, '2026-03-30 11:03:38'),
(4, 124, 4, 1, '2026-03-30 11:03:38'),
(5, 124, 5, 1, '2026-03-30 11:03:38'),
(6, 124, 6, 1, '2026-03-30 11:03:38');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `transaction_id` varchar(100) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `method` varchar(50) DEFAULT 'QRIS',
  `status` enum('pending','success','failed') DEFAULT 'pending',
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promotions`
--

CREATE TABLE `promotions` (
  `id` int(11) NOT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `type` enum('bogo','discount','flash_sale','ads') DEFAULT 'discount',
  `name` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `discount_percent` tinyint(3) UNSIGNED DEFAULT 0,
  `free_service_id` int(11) DEFAULT NULL,
  `min_bookings_required` int(11) DEFAULT 1,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_by_admin` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `rating` tinyint(4) DEFAULT NULL CHECK (`rating` >= 1 and `rating` <= 5),
  `comment` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `shop_id` int(11) DEFAULT NULL,
  `admin_reply` text DEFAULT NULL,
  `admin_reply_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `duration` int(11) DEFAULT 30,
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `shop_id`, `name`, `duration`, `price`, `created_at`) VALUES
(35, 165, 'Haircut', 60, 15000.00, '2026-03-25 13:52:05'),
(36, 165, 'Wash Hair', 20, 15000.00, '2026-03-25 13:52:32'),
(37, 165, 'Hair Threatment', 30, 40000.00, '2026-03-25 13:53:06'),
(38, 165, 'Hair Polish', 30, 35000.00, '2026-03-25 13:54:14');

-- --------------------------------------------------------

--
-- Table structure for table `shop_schedules`
--

CREATE TABLE `shop_schedules` (
  `id` int(11) NOT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `day_name` enum('Senin','Selasa','Rabu','Kamis','Jumat','Sabtu','Minggu') DEFAULT NULL,
  `open_time` time DEFAULT NULL,
  `close_time` time DEFAULT NULL,
  `is_closed` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shop_schedules`
--

INSERT INTO `shop_schedules` (`id`, `shop_id`, `day_name`, `open_time`, `close_time`, `is_closed`) VALUES
(64, 165, 'Senin', '09:00:00', '21:00:00', 0),
(65, 165, 'Selasa', '09:00:00', '21:00:00', 0),
(66, 165, 'Rabu', '09:00:00', '21:00:00', 0),
(67, 165, 'Kamis', '09:00:00', '21:00:00', 0),
(68, 165, 'Jumat', '09:00:00', '21:00:00', 0),
(69, 165, 'Sabtu', '09:00:00', '21:00:00', 0),
(70, 165, 'Minggu', '09:00:00', '21:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `shop_sop`
--

CREATE TABLE `shop_sop` (
  `id` int(11) NOT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `title` varchar(200) NOT NULL,
  `content` text NOT NULL,
  `sort_order` int(11) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shop_sop`
--

INSERT INTO `shop_sop` (`id`, `shop_id`, `title`, `content`, `sort_order`, `is_active`, `created_at`) VALUES
(1, NULL, 'Sambut Pelanggan dengan Ramah', 'Setiap pelanggan yang datang disambut dengan salam dan senyuman. Pastikan pelanggan merasa nyaman sejak pertama masuk.', 1, 1, '2026-03-26 09:18:59'),
(2, NULL, 'Tanyakan Preferensi Gaya Rambut', 'Sebelum memulai, barber wajib menanyakan model rambut yang diinginkan pelanggan dan memberikan saran jika diperlukan.', 2, 1, '2026-03-26 09:18:59'),
(3, NULL, 'Pastikan Peralatan Steril dan Bersih', 'Semua alat cukur (gunting, pisau, sisir) harus disterilkan sebelum digunakan pada setiap pelanggan.', 3, 1, '2026-03-26 09:18:59'),
(4, NULL, 'Gunakan Cape/Kain Pelindung', 'Pasang cape atau kain pelindung pada pelanggan sebelum memulai proses pangkas.', 4, 1, '2026-03-26 09:18:59'),
(5, NULL, 'Selesaikan Sesuai Waktu yang Dijanjikan', 'Barber harus mengelola waktu dengan baik agar pelanggan tidak menunggu terlalu lama.', 5, 1, '2026-03-26 09:18:59'),
(6, NULL, 'Tawarkan Layanan Tambahan', 'Setelah selesai pangkas, tawarkan layanan tambahan seperti cuci rambut atau penataan rambut.', 6, 1, '2026-03-26 09:18:59'),
(7, NULL, 'Bersihkan Area Kerja Setelah Selesai', 'Sapu sisa rambut dan bersihkan kursi setelah setiap pelanggan selesai dilayani.', 7, 1, '2026-03-26 09:18:59'),
(8, NULL, 'Minta Ulasan / Feedback', 'Dorong pelanggan untuk memberikan ulasan melalui aplikasi Pangkas Kaka setelah selesai.', 8, 1, '2026-03-26 09:18:59');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `total_visits` int(11) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 0,
  `discount_percent` tinyint(3) UNSIGNED DEFAULT 10,
  `activated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(11) NOT NULL,
  `setting_key` varchar(100) DEFAULT NULL,
  `setting_value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `setting_key`, `setting_value`) VALUES
(1, 'app_name', 'PangkasKAKA'),
(2, 'operational_area', 'Kota Kupang, NTT'),
(3, 'service_fee', '2000'),
(4, 'platform_commission', '10'),
(5, 'owner_announcement', 'Pastikan verifikasi toko dilakukan dengan teliti.');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `address` text DEFAULT NULL,
  `role` enum('customer','owner','admin') DEFAULT 'customer',
  `photo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `email_verified_at` datetime DEFAULT NULL,
  `email_verification_hash` char(64) DEFAULT NULL,
  `email_verification_expires_at` datetime DEFAULT NULL,
  `email_verification_sent_to` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `phone`, `email`, `password`, `address`, `role`, `photo`, `created_at`, `email_verified_at`, `email_verification_hash`, `email_verification_expires_at`, `email_verification_sent_to`) VALUES
(4, 'Petra Miracle ME Lenggu', '081236927067', 'petra221106@gmail.com', '$2y$10$EXE1NoTHGUXLpualE9xlIeYtcbrjw4nPzED9rzm/IAJlPSUJFeqQa', 'JL. OE,EKAM, Sikumana', 'customer', NULL, '2026-03-25 01:25:04', NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barbers`
--
ALTER TABLE `barbers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_id` (`shop_id`),
  ADD KEY `karyawan_id` (`karyawan_id`);

--
-- Indexes for table `barbershops`
--
ALTER TABLE `barbershops`
  ADD PRIMARY KEY (`id`),
  ADD KEY `owner_id` (`owner_id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `shop_id` (`shop_id`),
  ADD KEY `barber_id` (`barber_id`),
  ADD KEY `service_id` (`service_id`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `shop_id` (`shop_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `owners`
--
ALTER TABLE `owners`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `owner_criteria`
--
ALTER TABLE `owner_criteria`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `owner_criteria_checklist`
--
ALTER TABLE `owner_criteria_checklist`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_checklist` (`owner_id`,`criteria_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transaction_id` (`transaction_id`),
  ADD KEY `booking_id` (`booking_id`);

--
-- Indexes for table `promotions`
--
ALTER TABLE `promotions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_id` (`booking_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `fk_review_shop` (`shop_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_id` (`shop_id`);

--
-- Indexes for table `shop_schedules`
--
ALTER TABLE `shop_schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_id` (`shop_id`);

--
-- Indexes for table `shop_sop`
--
ALTER TABLE `shop_sop`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_sub` (`user_id`,`shop_id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `setting_key` (`setting_key`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barbers`
--
ALTER TABLE `barbers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `barbershops`
--
ALTER TABLE `barbershops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=166;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `owners`
--
ALTER TABLE `owners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT for table `owner_criteria`
--
ALTER TABLE `owner_criteria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `owner_criteria_checklist`
--
ALTER TABLE `owner_criteria_checklist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `promotions`
--
ALTER TABLE `promotions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `shop_schedules`
--
ALTER TABLE `shop_schedules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `shop_sop`
--
ALTER TABLE `shop_sop`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barbers`
--
ALTER TABLE `barbers`
  ADD CONSTRAINT `barbers_ibfk_1` FOREIGN KEY (`shop_id`) REFERENCES `barbershops` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `barbers_ibfk_2` FOREIGN KEY (`karyawan_id`) REFERENCES `karyawan` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`shop_id`) REFERENCES `barbershops` (`id`),
  ADD CONSTRAINT `bookings_ibfk_3` FOREIGN KEY (`barber_id`) REFERENCES `barbers` (`id`),
  ADD CONSTRAINT `bookings_ibfk_4` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`);

--
-- Constraints for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD CONSTRAINT `karyawan_ibfk_1` FOREIGN KEY (`shop_id`) REFERENCES `barbershops` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `fk_review_shop` FOREIGN KEY (`shop_id`) REFERENCES `barbershops` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`),
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_ibfk_1` FOREIGN KEY (`shop_id`) REFERENCES `barbershops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shop_schedules`
--
ALTER TABLE `shop_schedules`
  ADD CONSTRAINT `shop_schedules_ibfk_1` FOREIGN KEY (`shop_id`) REFERENCES `barbershops` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
