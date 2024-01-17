-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 17, 2024 at 04:04 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gis_map`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id_cat` int(10) NOT NULL,
  `nama_category` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id_cat`, `nama_category`) VALUES
(1, 'fasilitas'),
(2, 'keamanan');

-- --------------------------------------------------------

--
-- Table structure for table `data_perusahaan`
--

CREATE TABLE `data_perusahaan` (
  `id_perusahaan` int(10) NOT NULL,
  `x` decimal(8,5) NOT NULL,
  `y` decimal(8,5) NOT NULL,
  `nama_perusahaan` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `foto` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_perusahaan`
--

INSERT INTO `data_perusahaan` (`id_perusahaan`, `x`, `y`, `nama_perusahaan`, `alamat`, `foto`) VALUES
(7, '3.61917', '98.60551', 'Pool 4', 'JJ94+J6X, Jl. Perjuangan, Kp. Lalang, Kec. Sunggal, Kabupaten Deli Serdang, Sumatera Utara 20125, Indonesia', ''),
(6, '3.60477', '98.68687', 'Pool 3', 'Jl. Pelita I No.57, Sidorame Bar. II, Kec. Medan Perjuangan, Kota Medan, Sumatera Utara 20233, Indonesia', ''),
(5, '3.61660', '98.63091', 'Pool 2', 'JJ8J+F77, Jl. Kemuning - 2, Helvetia, Kec. Medan Helvetia, Kota Medan, Sumatera Utara 20124, Indonesia', ''),
(4, '3.60752', '98.62490', 'AAAAA', 'Jl. Mesjid Arrahman No.15d, Tj. Gusta, Kec. Medan Helvetia, Kota Medan, Sumatera Utara 20123, Indonesia', '');

-- --------------------------------------------------------

--
-- Table structure for table `fasilitas`
--

CREATE TABLE `fasilitas` (
  `id_fasilitas` int(10) NOT NULL,
  `id_cat` int(10) NOT NULL,
  `nama_fasilitas` varchar(100) NOT NULL,
  `pilihana` varchar(100) NOT NULL,
  `pilihanb` varchar(100) NOT NULL,
  `pilihanc` varchar(100) NOT NULL,
  `pilihand` varchar(100) NOT NULL,
  `pilihane` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fasilitas`
--

INSERT INTO `fasilitas` (`id_fasilitas`, `id_cat`, `nama_fasilitas`, `pilihana`, `pilihanb`, `pilihanc`, `pilihand`, `pilihane`) VALUES
(1, 2, 'qwdkqwdk', 'qwdkqwdk', 'kwdqkdwqwkd', 'kdqwkdqkwdqwk', 'dkqwdkqwdk', 'qdqwdqwdk');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(10) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `id_kantor` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `status`, `id_kantor`) VALUES
(1, 'admin', 'admin', 'admin', 0),
(5, 'adminlangkat', 'adminlangkat', 'admincabang', 2),
(3, 'andri', 'andri', 'pembina', 1),
(4, 'adminmedan', 'adminmedan', 'admincabang', 1),
(6, 'adminsiantar', 'adminsiantar', 'admincabang', 3),
(7, 'adminrantau', 'adminrantau', 'admincabang', 4),
(8, 'adminserdang', 'adminserdang', 'admincabang', 5),
(9, 'adminlangsa', 'adminlangsa', 'admincabang', 6),
(10, 'adminacehselatan', 'adminacehselatan', 'admincabang', 7),
(11, 'adminsidempuan', 'adminsidempuan', 'admincabang', 8),
(12, 'adminlhokseumawe', 'adminlhokseumawe', 'admincabang', 9),
(13, 'adminacehtengah', 'adminacehtengah', 'admincabang', 10),
(14, 'adminbanda', 'adminbanda', 'admincabang', 11),
(15, 'adminpadanglawas', 'adminpadanglawas', 'admincabang', 12),
(16, 'adminkisaran', 'bpjstkb02', 'admincabang', 13),
(17, 'adminbinjai', 'adminbinjai', 'admincabang', 14),
(18, 'adminlabura', 'adminlabura', 'admincabang', 15),
(19, 'adminmadina', 'adminmadina', 'admincabang', 16),
(20, 'adminbelawan', 'adminbelawan', 'admincabang', 17),
(21, 'adminlabusel', 'adminlabusel', 'admincabang', 18),
(22, 'adminmeulaboh', 'adminmeulaboh', 'admincabang', 19),
(23, 'admintamora', 'admintamora', 'admincabang', 20),
(24, 'adminhumbang', 'adminhumbang', 'admincabang', 21),
(25, 'adminbatubara', 'adminbatubara', 'admincabang', 22),
(26, 'adminpidie', 'adminpidie', 'admincabang', 23),
(27, 'adminnias', 'adminnias', 'admincabang', 24),
(28, 'admintebing', 'admintebing', 'admincabang', 25),
(29, 'admintaput', 'admintaput', 'admincabang', 26),
(30, 'adminagara', 'adminagara', 'admincabang', 27),
(31, 'adminkaro', 'adminkaro', 'admincabang', 28),
(32, 'admintoba', 'admintoba', 'admincabang', 29),
(33, 'adminsibolga', 'adminsibolga', 'admincabang', 30),
(34, 'adminbireun', 'adminbireun', 'admincabang', 31),
(35, '', '', 'pembina', 3),
(36, 'admintamora', 'admintamora', 'pembina', 20),
(37, '', '', 'pembina', 20),
(38, 'MA150530', '25071990', 'pembina', 20),
(39, 'YUNITA', 'LANGSA123', 'pembina', 6),
(40, 'AS274500', 'KISARAN2', 'pembina', 13),
(41, 'DI176110', 'KISARAN2', 'pembina', 13),
(42, 'RA165820', 'KISARAN2', 'pembina', 13),
(43, 'SE156160', 'KISARAN2', 'pembina', 13),
(44, 'AD150620', 'WELCOME1', 'pembina', 6),
(45, 'IN274520', 'WELCOME1', 'pembina', 6),
(46, 'MU165200', 'WELCOME1', 'pembina', 6),
(47, 'WI148170', 'WELCOME1', 'pembina', 6),
(48, '', '', 'admincabang', 3),
(49, 'AG126870', 'WELCOME1', 'admincabang', 3),
(50, 'BO144800', 'WELCOME1', 'admincabang', 3),
(51, 'DI248140', 'WELCOME1', 'admincabang', 3),
(52, 'DO174610', 'WELCOME1', 'admincabang', 3),
(53, 'EK250500', 'WELCOME1', 'admincabang', 3),
(54, 'ER281450', 'WELCOME1', 'admincabang', 3),
(55, 'GI156260', 'WELCOME1', 'admincabang', 3),
(56, 'HE133750', 'WELCOME1', 'admincabang', 3),
(57, 'LA150920', 'WELCOME1', 'admincabang', 3),
(58, 'LI250900', 'WELCOME1', 'admincabang', 3),
(59, 'MA153360', 'WELCOME1', 'admincabang', 3),
(60, 'MY178390', 'WELCOME1', 'admincabang', 3),
(61, 'NU126910', 'WELCOME1', 'admincabang', 3),
(62, 'NU179830', 'WELCOME1', 'admincabang', 3),
(63, 'RE133840', 'WELCOME1', 'admincabang', 3),
(64, 'RI160630', 'WELCOME1', 'admincabang', 3),
(65, 'RI178690', 'WELCOME1', 'admincabang', 3),
(66, 'RO150550', 'WELCOME1', 'admincabang', 3),
(67, 'BE250930', 'WELCOME1', 'admincabang', 3),
(68, 'AITKAD01', 'welcome1', 'pembina', 1),
(69, 'DA165770', 'WELCOME1', 'pembina', 14),
(70, 'DW260990', 'WELCOME1', 'pembina', 14),
(71, 'EV243610', 'WELCOME1', 'pembina', 14),
(255, 'RA165820', 'KISARAN3', 'pembina', 13),
(73, 'SR248060', 'WELCOME1', 'pembina', 14),
(74, 'AB167120', 'WELCOME1', 'pembina', 3),
(75, 'AB167120', 'WELCOME1', 'pembina', 3),
(76, 'AB167120', 'WELCOME1', 'pembina', 3),
(77, 'AB165890', 'WELCOME1', 'pembina', 2),
(78, 'AS233710', 'WELCOME1', 'pembina', 2),
(79, 'SM145630', 'WELCOME1', 'pembina', 2),
(80, 'AB167120', 'welcome1', 'pembina', 3),
(81, 'abdel', 'welcome1', 'pembina', 3),
(82, 'boycl', 'welcome1', 'pembina', 3),
(83, 'DONA', 'WELCOME1', 'pembina', 3),
(84, 'donath', 'welcome1', 'pembina', 3),
(85, 'ekamp', 'welcome1', 'pembina', 3),
(86, 'liaws', 'welcome1', 'pembina', 3),
(87, 'rizkih', 'welcome1', 'pembina', 3),
(88, 'winarso', 'welcome1', 'pembina', 3),
(89, 'KR137900', 'KR1281', 'pembina', 20),
(90, 'FR248290', 'JOJO13MILE16', 'pembina', 20),
(91, 'prince_gucci', 'ahn1234', 'pembina', 19),
(92, 'prince_gucci', 'ahn1234', 'pembina', 19),
(93, 'JE274570', 'WELCOME2', 'pembina', 19),
(94, 'TU174580', 'WELCOME2', 'pembina', 19),
(95, 'AN164540', 'WELCOME1', 'pembina', 1),
(96, 'AITKAD01', 'WELCOME01', 'pembina', 1),
(97, 'AN164540', 'WELCOME01', 'pembina', 1),
(98, 'AR141690', 'WELCOME01', 'pembina', 1),
(99, 'AU164640', 'WELCOME01', 'pembina', 1),
(100, 'DI170880', 'WELCOME01', 'pembina', 1),
(101, 'ER244790', 'WELCOME01', 'pembina', 1),
(102, 'FI112259', 'WELCOME01', 'pembina', 1),
(103, 'MU250660', 'WELCOME01', 'pembina', 1),
(104, 'RA153290', 'WELCOME01', 'pembina', 1),
(105, 'RA274540', 'WELCOME01', 'pembina', 1),
(106, 'RE153370', 'WELCOME01', 'pembina', 1),
(107, 'RI244840', 'WELCOME01', 'pembina', 1),
(108, 'SA253300', 'WELCOME01', 'pembina', 1),
(109, 'SU150750', 'WELCOME01', 'pembina', 1),
(110, 'SU174550', 'WELCOME01', 'pembina', 1),
(111, 'YU150870', 'WELCOME01', 'pembina', 1),
(112, 'YU270890', 'WELCOME01', 'pembina', 1),
(113, 'KAKACAB', 'LANGSA789', 'admincabang', 6),
(114, 'INES', 'WELCOME1', 'admincabang', 6),
(115, 'FAHMI', 'LANGSA789', 'admincabang', 6),
(116, 'TE167100', 'WELCOME1', 'pembina', 11),
(117, 'IR150740', 'kopi1', 'pembina', 11),
(118, 'WI153430', 'DARAT63', 'pembina', 20),
(119, 'MA150530', '25071990', 'pembina', 20),
(120, 'FE254590', 'WELCOME1', 'pembina', 20),
(121, 'abdel', 'welcome1', 'pembina', 3),
(122, 'AM274530', 'WELCOME1', 'pembina', 9),
(123, 'FA119590', 'WELCOME1', 'pembina', 9),
(124, 'IQ148400', 'WELCOME1', 'pembina', 9),
(125, 'NU260640', 'WELCOME1', 'pembina', 9),
(126, 'PI167090', 'WELCOME1', 'pembina', 9),
(127, 'SY248260', 'WELCOME1', 'pembina', 9),
(128, 'IL181690', 'WELCOME1', 'pembina', 9),
(129, 'AP260680', 'AP260680', 'pembina', 8),
(130, 'AL165860', 'AL165860', 'pembina', 8),
(131, 'MU260660', 'MU260660', 'pembina', 8),
(132, 'RA168360', 'RA168360', 'pembina', 8),
(133, 'RO134090', 'RO134090', 'pembina', 8),
(134, 'NU260640', 'WELCOME1', 'pembina', 9),
(135, 'NU260640', 'welcome1', 'pembina', 9),
(136, 'hadaa00', 'welcome1', 'pembina', 9),
(137, 'nurhadawiyah.harahap', 'welcome1', 'pembina', 9),
(138, 'NU260640', 'welcome1', 'pembina', 9),
(139, 'lhokseumawe', 'lhokseumawe', 'admincabang', 9),
(140, 'INES', 'LANGSA123', 'pembina', 6),
(141, 'WIRA', 'LANGSA123', 'pembina', 6),
(142, 'FAHMI', 'LANGSA123', 'pembina', 6),
(143, 'ADE', 'LANGSA123', 'pembina', 6),
(144, 'DI176110', 'KISARAN2', 'pembina', 13),
(145, 'prince_gucci', 'ahn1234', 'pembina', 19),
(146, 'JE274570', 'WELCOME2', 'pembina', 19),
(147, 'adminmbo', 'adminmbo', 'admincabang', 19),
(148, 'DE251130', 'DE251130', 'pembina', 17),
(149, 'ER141700', 'ER141700', 'pembina', 17),
(150, 'EU244810', 'EU244810', 'pembina', 17),
(151, 'FA167130', 'FA167130', 'pembina', 17),
(152, 'FA168370', 'FA168370', 'pembina', 17),
(153, 'HA156580', 'HA156580', 'pembina', 17),
(154, 'LA250950', 'LA250950', 'pembina', 17),
(155, 'LE122480', 'LE122480', 'pembina', 17),
(156, 'MU162790', 'MU162790', 'pembina', 17),
(157, 'RH244830', 'RH244830', 'pembina', 17),
(158, 'SH173840', 'SH173840', 'pembina', 17),
(159, 'TI234010', 'TI234010', 'pembina', 17),
(160, 'WA150510', 'WA150510', 'pembina', 17),
(161, 'ZE153260', 'ZE153260', 'pembina', 17),
(162, 'edwinsaputra', 'edwinsaputra1', 'pembina', 19),
(163, 'edwinsaputra', 'edwinsaputra1', 'pembina', 19),
(164, 'ferdiahn', 'ahn1234', 'pembina', 19),
(165, 'JE274570', 'welcome2', 'pembina', 19),
(166, 'TU174580', 'welcome22', 'pembina', 19),
(167, 'TU174580', 'welcome2', 'pembina', 19),
(168, 'jellyta', 'welcome2', 'pembina', 19),
(169, 'tulusdwp', 'welcome2', 'pembina', 19),
(171, 'AR145650', 'WELCOME1', 'pembina', 11),
(172, 'CU251090', 'WELCOME1', 'pembina', 11),
(173, 'IK168330', 'WELCOME1', 'pembina', 11),
(174, 'NO250880', 'WELCOME1', 'pembina', 11),
(175, 'RI259050', 'WELCOME1', 'pembina', 11),
(176, 'RO179920', 'WELCOME1', 'pembina', 11),
(177, 'TE167100', 'WELCOME1', 'pembina', 11),
(178, 'IR150740', 'KOPI1', 'pembina', 11),
(179, 'NU260640', 'WELCOME1', 'pembina', 9),
(180, 'NU260640', 'WELCOME1', 'pembina', 9),
(181, 'HADAA00', 'WELCOME1', 'pembina', 9),
(182, 'NU260640', 'WELCOME1', 'pembina', 9),
(183, 'TE167100', 'WELCOME1', 'pembina', 11),
(184, 'TE167100', 'Welcome1', 'pembina', 11),
(185, 'TE167100', 'Banda1234', 'pembina', 11),
(186, 'KU151120', 'WELCOME1', 'pembina', 20),
(187, 'MA253340', 'WELCOME1', 'pembina', 20),
(188, 'RO174620', 'WELCOME1', 'pembina', 20),
(189, 'SA134070', 'WELCOME1', 'pembina', 20),
(190, 'SI262840', 'WELCOME1', 'pembina', 20),
(191, 'RO179920', 'WELCOME1', 'pembina', 11),
(192, 'RO179920', 'banda123', 'pembina', 11),
(193, 'AR145650', 'WELCOME1', 'pembina', 11),
(194, 'AR145650', 'banda123', 'pembina', 11),
(195, 'IR150740', 'sigli123', 'pembina', 11),
(196, 'abdel', 'Siantar123', 'pembina', 3),
(197, 'IR150740', 'kopi1', 'pembina', 11),
(254, 'UD241530', 'WELCOME1', 'pembina', 25),
(253, 'KU167150', 'WELCOME1', 'pembina', 25),
(252, 'WI153430', 'WELCOME1', 'pembina', 5),
(202, 'EV243610', 'WELCOME1', 'pembina', 14),
(251, 'IN233660', 'WELCOME1', 'pembina', 5),
(250, 'AD148220', 'WELCOME1', 'pembina', 5),
(205, 'RI151890', 'Welcome789', 'pembina', 14),
(206, 'RO174620', 'CANIAGO9', 'pembina', 20),
(207, 'MARTUNIS', 'WELCOME1', 'admincabang', 6),
(208, 'NU260640', 'WELCOME1', 'pembina', 9),
(209, 'HA179450', 'WELCOME01', 'pembina', 1),
(210, 'AB178890', 'WELCOME01', 'pembina', 1),
(211, 'TI277790', 'WELCOME01', 'pembina', 1),
(212, 'WI278850', 'WELCOME01', 'pembina', 1),
(213, 'MA160540', 'WELCOME1', 'pembina', 6),
(214, 'abdel', 'welcome1', 'pembina', 3),
(215, 'RO174620', 'WELCOME1', 'pembina', 20),
(216, 'RO174620', 'WELCOME1', 'pembina', 20),
(217, 'RO174620', 'WELCOME1', 'pembina', 20),
(218, 'SA134070', 'WELCOME1', 'pembina', 20),
(219, 'RO174620', 'WELCOME1', 'pembina', 20),
(220, 'RO174620', 'WELCOME1', 'pembina', 20),
(221, 'RO174620', 'Welcome789', 'pembina', 20),
(222, 'UD241530', 'WELCOME1', 'pembina', 20),
(223, 'KU167150', 'WELCOME1', 'pembina', 20),
(224, 'DI176110', 'KISARAN2', 'pembina', 13),
(225, 'MU179660', 'welcome1', 'pembina', 19),
(226, 'AP260680', 'AP260680', 'pembina', 8),
(227, 'YU182240', 'YU182240', 'pembina', 8),
(228, 'AP260680', 'AP260680', 'pembina', 8),
(229, 'AP260680', 'AP260680', 'pembina', 8),
(230, 'FI179400', 'WELCOME1', 'pembina', 11),
(231, 'IK168330', 'WELCOME1', 'pembina', 11),
(232, 'TE167100', 'Banda1234', 'pembina', 11),
(233, 'IK168330', 'BANDA123', 'pembina', 11),
(234, 'TE167100', 'Banda123', 'pembina', 11),
(235, 'AP260680', 'Pasid1234', 'pembina', 8),
(236, 'AP260680', 'Pasid1234', 'pembina', 8),
(237, 'AP260680', 'Welcome1234', 'pembina', 8),
(238, 'AP260680', 'AP260680', 'pembina', 8),
(239, 'AP260680', 'Welcome1234', 'pembina', 8),
(240, 'AP260680', 'Welcome1234', 'pembina', 8),
(241, 'YU248210', 'LANGSA123', 'pembina', 6),
(242, 'IN274520', 'LANGSA123', 'pembina', 6),
(243, 'AP260680', '1234Welcome', 'pembina', 8),
(244, 'DI176110', 'KISARAN2', 'pembina', 13),
(245, 'DI176110', 'KISARAN3', 'pembina', 13),
(246, 'SI262840', 'WELCOME1', 'pembina', 20),
(247, 'SI262840', 'WELCOME1', 'pembina', 20),
(248, 'SI262840', 'WELCOME2', 'pembina', 20),
(249, 'SA134070', 'WELCOME2', 'pembina', 20),
(256, 'EV243610', 'welcome1', 'pembina', 14),
(257, 'EV243610', 'WELCOME1', 'pembina', 14),
(258, 'EV243610', 'WELCOME1', 'pembina', 14),
(259, 'DE160670', 'DE160670', 'pembina', 16),
(260, 'FA141640', 'FA141640', 'pembina', 16),
(261, 'SE172900', 'SE172900', 'pembina', 16),
(262, 'HO276120', 'BATUBARA2', 'pembina', 22),
(263, 'HO276120', 'WELCOME1', 'pembina', 22),
(264, 'SU156270', 'WELCOME1', 'pembina', 22),
(265, 'DE153250', 'WELCOME1', 'pembina', 15),
(266, 'HE128750', 'WELCOME1', 'pembina', 15),
(267, 'HE128750', 'WELCOME1', 'pembina', 15),
(268, 'SA262820', 'WELCOME1', 'pembina', 15),
(269, 'AC128480', 'WELCOME1', 'pembina', 4),
(270, 'LE174510', 'WELCOME1', 'pembina', 4),
(271, 'RI243590', 'WELCOME1', 'pembina', 4),
(272, 'DH150640', 'WELCOME1', 'pembina', 18),
(273, 'IR150740', 'KOPI1', 'pembina', 11),
(274, 'IR150740', 'KOPI1', 'pembina', 23),
(275, 'IR150740', 'KOPI1', 'pembina', 23),
(276, 'NU250850', 'AYIE1', 'pembina', 23),
(277, 'SY233810', 'ADMIN1', 'pembina', 23),
(278, '', '', 'pembina', 27),
(279, '', '', 'pembina', 0),
(280, 'BO181280', 'WELCOME1', 'pembina', 27),
(281, 'lasber', 'welcome1', 'pembina', 21),
(282, 'hendriktm', 'welcome1', 'pembina', 21),
(283, 'nugraha', 'welcome1', 'pembina', 21),
(284, 'romulus', 'welcome1', 'pembina', 29),
(285, 'redy', 'welcome1', 'pembina', 29),
(286, 'myoga', 'welcome1', 'pembina', 29),
(287, 'ridwan', 'ridwan', 'pembina', 29),
(288, 'romulus', 'welcome1', 'pembina', 29),
(289, 'maryanto', 'welcome1', 'pembina', 26),
(290, 'agusps', 'welcome1', 'pembina', 26),
(291, 'rizkitri', 'welcome1', 'pembina', 26),
(292, 'SE156160', 'KISARAN3', 'pembina', 13),
(293, 'adminacehtengah', 'adminacehtengah', 'pembina', 10),
(294, 'IR150740', 'WELCOME1', 'pembina', 23),
(295, 'SI262840', 'WELCOME9', 'pembina', 20),
(296, 'DE160670', 'DE160670', 'pembina', 16),
(297, 'FA141640', 'FA141640', 'pembina', 16),
(298, 'SE172900', 'SE172900', 'pembina', 16),
(299, 'AR176130', 'AR176130', 'pembina', 12),
(300, 'BO172910', 'BO172910', 'pembina', 12),
(301, 'MA133950', 'MA133950', 'pembina', 12),
(302, 'SA153390', 'SA153390', 'pembina', 30),
(303, 'YU253810', 'YU253810', 'pembina', 30),
(304, 'BA126400', 'BA126400', 'pembina', 30),
(305, 'ZA1374480', 'WELCOME1', 'pembina', 9),
(306, 'RO174620', 'Welcome2', 'pembina', 20),
(307, 'RO179920', 'WELCOME1', 'pembina', 23),
(308, 'RO179920', 'PIDIE1', 'pembina', 23),
(309, 'nugraha', 'welcome1', 'pembina', 21),
(310, 'EV243610', 'Welcome789', 'pembina', 14),
(311, 'MU160540', 'LANGSA123', 'pembina', 6),
(312, 'IK180490', 'LANGSA123', 'pembina', 6),
(313, 'abdelsurya', 'welcome1', 'pembina', 3),
(314, 'RO179920', 'PIDIE1', 'pembina', 23),
(315, 'ridwan', 'ridwan', 'pembina', 29),
(316, 'ridwan', 'ridwan', 'pembina', 29),
(317, 'ridwan', 'ridwan', 'pembina', 29),
(318, 'ridwan', 'welcome1', 'pembina', 29),
(319, 'AR145650', 'WELCOME1', 'pembina', 11),
(320, 'AR145650', 'BANDA123', 'pembina', 11),
(321, 'AR145650', 'banda123', 'pembina', 11),
(322, 'AR145650', 'banda123', 'pembina', 11),
(323, 'AR145650', 'Banda123', 'pembina', 11),
(324, 'AR145650', 'WELCOME1', 'pembina', 11),
(325, 'AR145650', 'Welcome789', 'pembina', 11),
(326, 'NU279840', 'WELCOME1', 'pembina', 20),
(327, 'IK168330', 'Welcome789', 'pembina', 11),
(328, 'RI259050', 'Welcome789', 'pembina', 11),
(329, 'KR137900', 'KR1281', 'pembina', 20),
(330, 'SI262840', 'WELCOME9', 'pembina', 20),
(331, 'SI262840', 'WELCOME9', 'pembina', 20),
(332, 'SI262840', 'WELCOME9', 'pembina', 20),
(333, 'adminacehselatan', 'adminacehselatan', 'pembina', 7),
(334, 'adminacehselatan', 'adminacehselatan', 'pembina', 7),
(335, 'SI262840', 'WELCOME1', 'pembina', 20),
(336, 'SI262840', 'FIRA19', 'pembina', 20),
(337, 'rifqi', 'welcome2', 'pembina', 19),
(338, 'BO181280', 'WELCOME1', 'pembina', 6),
(339, 'RR156170', 'WELCOME1', 'pembina', 6),
(340, 'AL165860', 'WELCOME01', 'pembina', 1),
(341, 'AL181060', 'WELCOME1', 'pembina', 17),
(342, 'SH173840', 'WELCOME1', 'pembina', 17),
(343, 'WA150510', 'WELCOME1', 'pembina', 17),
(344, 'LE122480', 'WELCOME1', 'pembina', 17),
(345, '', '', 'pembina', 31),
(346, 'DH150640', 'WELCOME1', 'pembina', 31),
(347, 'RH182230', 'WELCOME1', 'pembina', 31),
(348, 'YU124680', 'WELCOME1', 'pembina', 31),
(349, 'SM145630', 'SM145630', 'pembina', 8),
(350, '', '', 'pembina', 0),
(351, 'YU182240', 'YUSWIRIADI123', 'pembina', 8),
(352, 'ZA1374480', 'WELCOME1', 'pembina', 9),
(353, 'ZA137880', 'WELCOME1', 'pembina', 9),
(354, 'NU250850', 'AYIE1', 'pembina', 23),
(355, 'RI168060', 'WELCOME1', 'pembina', 11),
(356, 'FA141640', 'WELCOME1', 'pembina', 16),
(357, 'DE160670', 'WELCOME1', 'pembina', 16),
(358, 'FA141640', 'WELCOME1', 'pembina', 16),
(359, 'IDHAM ARUBI', 'IDHAMARUBI', 'pembina', 16),
(360, 'AC128480', 'WELCOME1', 'pembina', 4),
(361, 'YU177800', 'WELCOME1', 'pembina', 4),
(362, 'AC128480', 'WELCOME1', 'pembina', 4),
(363, 'EU244810', 'WELCOME1234', 'pembina', 17),
(364, 'NU260640', 'WELCOME1', 'pembina', 9),
(365, 'NU260640', 'HADA22', 'pembina', 9),
(366, 'HO276120', 'WELCOME1', 'pembina', 22),
(367, 'MU181930 ', 'WELCOME1', 'pembina', 22),
(368, 'HO276120', 'WELCOME1', 'pembina', 22),
(369, 'SU156270', 'WELCOME1', 'pembina', 22),
(370, 'HO276120', 'WELCOME2', 'pembina', 22),
(371, 'SU156270', 'WELCOME2', 'pembina', 22),
(372, 'MU181930', 'WELCOME2', 'pembina', 22),
(373, 'AA250800', 'WELCOME01', 'pembina', 1),
(374, 'MU150760', 'WELCOME01', 'pembina', 1),
(375, 'AA250800', 'WELCOME01', 'pembina', 1),
(376, 'WELCOME1', 'WELCOME1', 'pembina', 1),
(377, 'AA250800', 'WELCOME1', 'pembina', 1),
(378, 'YU253810', 'WELCOME1', 'pembina', 30),
(379, 'SU150820', 'WELCOME1', 'pembina', 1),
(380, 'MA148050', 'WELCOME1', 'pembina', 2),
(381, 'YU248210', 'WELCOME1', 'pembina', 2),
(382, 'FAHMI', 'WELCOME1', 'pembina', 6),
(383, 'FAHMI', 'LANGSA2', 'pembina', 6),
(384, 'VE241550', 'WELCOME1', 'pembina', 28),
(385, 'CH181310', 'CH181310', 'pembina', 12),
(386, 'CH181310', 'CH181310', 'pembina', 12),
(387, 'CH181310', 'Pasid12345', 'pembina', 12),
(388, 'AN160560', 'WELCOME1', 'pembina', 14),
(389, 'MO160780', 'WELCOME1', 'pembina', 14),
(390, 'AN160560', 'WELCOME1', 'pembina', 14),
(391, 'RO174620', 'Welcome2', 'pembina', 20),
(392, 'RO174620', 'WELCOME2', 'pembina', 20),
(393, 'KR137900', 'WELCOME1', 'pembina', 20),
(394, 'RO174620', 'Romi123456', 'pembina', 20),
(395, 'RO134090', 'RO134090', 'pembina', 24),
(396, 'RO134090', 'WELCOME1', 'pembina', 24);

-- --------------------------------------------------------

--
-- Table structure for table `utama`
--

CREATE TABLE `utama` (
  `id_utama` int(10) NOT NULL,
  `id_kantor` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `utama`
--

INSERT INTO `utama` (`id_utama`, `id_kantor`) VALUES
(1, 9),
(2, 11),
(3, 6),
(4, 19),
(5, 1),
(6, 3),
(7, 13),
(8, 8),
(9, 20),
(10, 17),
(11, 14);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id_cat`);

--
-- Indexes for table `data_perusahaan`
--
ALTER TABLE `data_perusahaan`
  ADD PRIMARY KEY (`id_perusahaan`);

--
-- Indexes for table `fasilitas`
--
ALTER TABLE `fasilitas`
  ADD PRIMARY KEY (`id_fasilitas`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `utama`
--
ALTER TABLE `utama`
  ADD PRIMARY KEY (`id_utama`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id_cat` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `data_perusahaan`
--
ALTER TABLE `data_perusahaan`
  MODIFY `id_perusahaan` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `fasilitas`
--
ALTER TABLE `fasilitas`
  MODIFY `id_fasilitas` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=397;

--
-- AUTO_INCREMENT for table `utama`
--
ALTER TABLE `utama`
  MODIFY `id_utama` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
