-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 
-- 伺服器版本： 10.1.38-MariaDB
-- PHP 版本： 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `foodservice`
--

-- --------------------------------------------------------

--
-- 資料表結構 `ad`
--

CREATE TABLE `ad` (
  `id` int(11) NOT NULL COMMENT '廣告編號',
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '廣告名稱',
  `pic_url` text COLLATE utf8_unicode_ci NOT NULL COMMENT '圖片網址',
  `pic_alt` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '圖片說明',
  `link` text COLLATE utf8_unicode_ci NOT NULL COMMENT '連結網址',
  `list_order` int(11) NOT NULL COMMENT '列表順序',
  `status` tinyint(1) NOT NULL COMMENT '狀態，0：啟用，1：停用，2：已刪除',
  `remark` text COLLATE utf8_unicode_ci NOT NULL COMMENT '備註',
  `c_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立時間',
  `c_user_id` int(11) NOT NULL COMMENT '建立使者編號',
  `u_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改時間',
  `u_user_id` int(11) NOT NULL COMMENT '修改使用者編號'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `ad`
--

INSERT INTO `ad` (`id`, `name`, `pic_url`, `pic_alt`, `link`, `list_order`, `status`, `remark`, `c_time`, `c_user_id`, `u_time`, `u_user_id`) VALUES
(1, 'Ajinomoto Group', '/uploads/ad/1567073878.png', '', 'https://www.ajinomoto.com/en/numbers/zh/', 1, 0, '', '2019-05-20 12:26:04', 1, '2019-08-29 18:17:58', 1),
(2, 'Ajinomoto Group', '/uploads/ad/1567073887.png', '', 'https://www.ajinomoto.com/en/numbers/zh/', 1, 0, '', '2019-05-20 12:26:05', 1, '2019-08-29 18:18:07', 1),
(3, 'NEWS', '/uploads/ad/1567073895.png', '', 'https://www.ajinomoto.com/en/aboutus/newsletter/zh/', 2, 0, '', '2019-05-20 12:26:38', 1, '2019-08-29 18:18:15', 1),
(4, '1', '/uploads/ad/1567073903.png', '2', '3', 4, 0, '5', '2019-05-20 12:27:00', 1, '2019-08-29 18:18:23', 1);

-- --------------------------------------------------------

--
-- 替換檢視表以便查看 `ad_view`
-- (請參考以下實際畫面)
--
CREATE TABLE `ad_view` (
`id` int(11)
,`name` varchar(64)
,`pic_url` text
,`pic_alt` varchar(64)
,`link` text
,`list_order` int(11)
,`status` tinyint(1)
,`remark` text
,`c_time` datetime
,`c_user_id` int(11)
,`c_user_name` varchar(64)
,`u_time` datetime
,`u_user_id` int(11)
,`u_user_name` varchar(64)
);

-- --------------------------------------------------------

--
-- 資料表結構 `area`
--

CREATE TABLE `area` (
  `id` int(11) NOT NULL COMMENT '鄉鎮市區編號',
  `city_id` int(11) NOT NULL COMMENT '縣市編號',
  `name` varchar(8) COLLATE utf8_unicode_ci NOT NULL COMMENT '鄉鎮市區',
  `zipcode` varchar(3) COLLATE utf8_unicode_ci NOT NULL COMMENT '郵遞區號'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `area`
--

INSERT INTO `area` (`id`, `city_id`, `name`, `zipcode`) VALUES
(1, 1, '仁愛區', '200'),
(2, 1, '中正區', '202'),
(3, 1, '信義區', '201'),
(4, 1, '中山區', '203'),
(5, 1, '安樂區', '204'),
(6, 1, '暖暖區', '205'),
(7, 1, '七堵區', '206'),
(8, 2, '中正區', '100'),
(9, 2, '大同區', '103'),
(10, 2, '中山區', '104'),
(11, 2, '松山區', '105'),
(12, 2, '大安區', '106'),
(13, 2, '萬華區', '108'),
(14, 2, '信義區', '110'),
(15, 2, '士林區', '111'),
(16, 2, '北投區', '112'),
(17, 2, '內湖區', '114'),
(18, 2, '南港區', '115'),
(19, 2, '文山區', '116'),
(20, 3, '板橋區', '220'),
(21, 3, '新莊區', '242'),
(22, 3, '中和區', '235'),
(23, 3, '永和區', '234'),
(24, 3, '土城區', '236'),
(25, 3, '樹林區', '238'),
(26, 3, '三峽區', '237'),
(27, 3, '鶯歌區', '239'),
(28, 3, '三重區', '241'),
(29, 3, '蘆洲區', '247'),
(30, 3, '五股區', '248'),
(31, 3, '泰山區', '243'),
(32, 3, '林口區', '244'),
(33, 3, '八里區', '249'),
(34, 3, '淡水區', '251'),
(35, 3, '三芝區', '252'),
(36, 3, '石門區', '253'),
(37, 3, '金山區', '208'),
(38, 3, '萬里區', '207'),
(39, 3, '汐止區', '221'),
(40, 3, '瑞芳區', '224'),
(41, 3, '平溪區', '226'),
(42, 3, '貢寮區', '228'),
(43, 3, '雙溪區', '227'),
(44, 3, '深坑區', '222'),
(45, 3, '石碇區', '223'),
(46, 3, '新店區', '231'),
(47, 3, '坪林區', '232'),
(48, 3, '烏來區', '233'),
(49, 4, '桃園區', '330'),
(50, 4, '中壢區', '320'),
(51, 4, '平鎮區', '324'),
(52, 4, '八德區', '334'),
(53, 4, '楊梅區', '326'),
(54, 4, '蘆竹區', '338'),
(55, 4, '大溪區', '335'),
(56, 4, '龍潭區', '325'),
(57, 4, '龜山區', '333'),
(58, 4, '大園區', '337'),
(59, 4, '觀音區', '328'),
(60, 4, '新屋區', '327'),
(61, 4, '復興區', '336'),
(62, 5, '東區', '300'),
(63, 5, '北區', '300'),
(64, 5, '香山區', '300'),
(65, 6, '竹北市', '302'),
(66, 6, '竹東鎮', '310'),
(67, 6, '新埔鎮', '305'),
(68, 6, '關西鎮', '306'),
(69, 6, '湖口鄉', '303'),
(70, 6, '新豐鄉', '304'),
(71, 6, '峨眉鄉', '315'),
(72, 6, '寶山鄉', '308'),
(73, 6, '北埔鄉', '314'),
(74, 6, '芎林鄉', '307'),
(75, 6, '橫山鄉', '312'),
(76, 6, '尖石鄉', '313'),
(77, 6, '五峰鄉', '311'),
(78, 7, '宜蘭市', '260'),
(79, 7, '頭城鎮', '261'),
(80, 7, '礁溪鄉', '262'),
(81, 7, '壯圍鄉', '263'),
(82, 7, '員山鄉', '264'),
(83, 7, '羅東鎮', '265'),
(84, 7, '蘇澳鎮', '270'),
(85, 7, '五結鄉', '268'),
(86, 7, '三星鄉', '266'),
(87, 7, '冬山鄉', '269'),
(88, 7, '大同鄉', '267'),
(89, 7, '南澳鄉', '272'),
(90, 8, '苗栗市', '360'),
(91, 8, '頭份市', '351'),
(92, 8, '竹南鎮', '350'),
(93, 8, '後龍鎮', '356'),
(94, 8, '通霄鎮', '357'),
(95, 8, '苑裡鎮', '358'),
(96, 8, '卓蘭鎮', '369'),
(97, 8, '造橋鄉', '361'),
(98, 8, '西湖鄉', '368'),
(99, 8, '頭屋鄉', '362'),
(100, 8, '公館鄉', '363'),
(101, 8, '銅鑼鄉', '366'),
(102, 8, '三義鄉', '367'),
(103, 8, '大湖鄉', '364'),
(104, 8, '獅潭鄉', '354'),
(105, 8, '三灣鄉', '352'),
(106, 8, '南庄鄉', '353'),
(107, 8, '泰安鄉', '365'),
(108, 9, '中區', '400'),
(109, 9, '東區', '401'),
(110, 9, '南區', '402'),
(111, 9, '西區', '403'),
(112, 9, '北區', '404'),
(113, 9, '北屯區', '406'),
(114, 9, '西屯區', '407'),
(115, 9, '南屯區', '408'),
(116, 9, '太平區', '411'),
(117, 9, '大里區', '412'),
(118, 9, '霧峰區', '413'),
(119, 9, '烏日區', '414'),
(120, 9, '豐原區', '420'),
(121, 9, '后里區', '421'),
(122, 9, '石岡區', '422'),
(123, 9, '東勢區', '423'),
(124, 9, '和平區', '424'),
(125, 9, '新社區', '426'),
(126, 9, '潭子區', '427'),
(127, 9, '大雅區', '428'),
(128, 9, '神岡區', '429'),
(129, 9, '大肚區', '432'),
(130, 9, '沙鹿區', '433'),
(131, 9, '龍井區', '434'),
(132, 9, '梧棲區', '435'),
(133, 9, '清水區', '436'),
(134, 9, '大甲區', '437'),
(135, 9, '外埔區', '438'),
(136, 9, '大安區', '439'),
(137, 10, '彰化市', '500'),
(138, 10, '員林市', '510'),
(139, 10, '和美鎮', '508'),
(140, 10, '鹿港鎮', '505'),
(141, 10, '溪湖鎮', '514'),
(142, 10, '二林鎮', '526'),
(143, 10, '田中鎮', '520'),
(144, 10, '北斗鎮', '521'),
(145, 10, '花壇鄉', '503'),
(146, 10, '芬園鄉', '502'),
(147, 10, '大村鄉', '515'),
(148, 10, '永靖鄉', '512'),
(149, 10, '伸港鄉', '509'),
(150, 10, '線西鄉', '507'),
(151, 10, '福興鄉', '506'),
(152, 10, '秀水鄉', '504'),
(153, 10, '埔心鄉', '513'),
(154, 10, '埔鹽鄉', '516'),
(155, 10, '大城鄉', '527'),
(156, 10, '芳苑鄉', '528'),
(157, 10, '竹塘鄉', '525'),
(158, 10, '社頭鄉', '511'),
(159, 10, '二水鄉', '530'),
(160, 10, '田尾鄉', '522'),
(161, 10, '埤頭鄉', '523'),
(162, 10, '溪州鄉', '524'),
(163, 11, '南投市', '540'),
(164, 11, '埔里鎮', '545'),
(165, 11, '草屯鎮', '542'),
(166, 11, '竹山鎮', '557'),
(167, 11, '集集鎮', '552'),
(168, 11, '名間鄉', '551'),
(169, 11, '鹿谷鄉', '558'),
(170, 11, '中寮鄉', '541'),
(171, 11, '魚池鄉', '555'),
(172, 11, '國姓鄉', '544'),
(173, 11, '水里鄉', '553'),
(174, 11, '信義鄉', '556'),
(175, 11, '仁愛鄉', '546'),
(176, 12, '斗六市', '640'),
(177, 12, '斗南鎮', '630'),
(178, 12, '林內鄉', '643'),
(179, 12, '古坑鄉', '646'),
(180, 12, '大埤鄉', '631'),
(181, 12, '莿桐鄉', '647'),
(182, 12, '虎尾鎮', '632'),
(183, 12, '西螺鎮', '648'),
(184, 12, '土庫鎮', '633'),
(185, 12, '褒忠鄉', '634'),
(186, 12, '二崙鄉', '649'),
(187, 12, '崙背鄉', '637'),
(188, 12, '麥寮鄉', '638'),
(189, 12, '臺西鄉', '636'),
(190, 12, '東勢鄉', '635'),
(191, 12, '北港鎮', '651'),
(192, 12, '元長鄉', '655'),
(193, 12, '四湖鄉', '654'),
(194, 12, '口湖鄉', '653'),
(195, 12, '水林鄉', '652'),
(196, 13, '東區', '600'),
(197, 13, '西區', '600'),
(198, 14, '太保市', '612'),
(199, 14, '朴子市', '613'),
(200, 14, '布袋鎮', '625'),
(201, 14, '大林鎮', '622'),
(202, 14, '民雄鄉', '621'),
(203, 14, '溪口鄉', '623'),
(204, 14, '新港鄉', '616'),
(205, 14, '六腳鄉', '615'),
(206, 14, '東石鄉', '614'),
(207, 14, '義竹鄉', '624'),
(208, 14, '鹿草鄉', '611'),
(209, 14, '水上鄉', '608'),
(210, 14, '中埔鄉', '606'),
(211, 14, '竹崎鄉', '604'),
(212, 14, '梅山鄉', '603'),
(213, 14, '番路鄉', '602'),
(214, 14, '大埔鄉', '607'),
(215, 14, '阿里山鄉', '605'),
(216, 15, '中西區', '700'),
(217, 15, '東區', '701'),
(218, 15, '南區', '702'),
(219, 15, '北區', '704'),
(220, 15, '安平區', '708'),
(221, 15, '安南區', '709'),
(222, 15, '永康區', '710'),
(223, 15, '歸仁區', '711'),
(224, 15, '新化區', '712'),
(225, 15, '左鎮區', '713'),
(226, 15, '玉井區', '714'),
(227, 15, '楠西區', '715'),
(228, 15, '南化區', '716'),
(229, 15, '仁德區', '717'),
(230, 15, '關廟區', '718'),
(231, 15, '龍崎區', '719'),
(232, 15, '官田區', '720'),
(233, 15, '麻豆區', '721'),
(234, 15, '佳里區', '722'),
(235, 15, '西港區', '723'),
(236, 15, '七股區', '724'),
(237, 15, '將軍區', '725'),
(238, 15, '學甲區', '726'),
(239, 15, '北門區', '727'),
(240, 15, '新營區', '730'),
(241, 15, '後壁區', '731'),
(242, 15, '白河區', '732'),
(243, 15, '東山區', '733'),
(244, 15, '六甲區', '734'),
(245, 15, '下營區', '735'),
(246, 15, '柳營區', '736'),
(247, 15, '鹽水區', '737'),
(248, 15, '善化區', '741'),
(249, 15, '大內區', '742'),
(250, 15, '山上區', '743'),
(251, 15, '新市區', '744'),
(252, 15, '安定區', '745'),
(253, 16, '楠梓區', '811'),
(254, 16, '左營區', '813'),
(255, 16, '鼓山區', '804'),
(256, 16, '三民區', '807'),
(257, 16, '鹽埕區', '803'),
(258, 16, '前金區', '801'),
(259, 16, '新興區', '800'),
(260, 16, '苓雅區', '802'),
(261, 16, '前鎮區', '806'),
(262, 16, '旗津區', '805'),
(263, 16, '小港區', '812'),
(264, 16, '鳳山區', '830'),
(265, 16, '大寮區', '831'),
(266, 16, '鳥松區', '833'),
(267, 16, '林園區', '832'),
(268, 16, '仁武區', '814'),
(269, 16, '大樹區', '840'),
(270, 16, '大社區', '815'),
(271, 16, '岡山區', '820'),
(272, 16, '路竹區', '821'),
(273, 16, '橋頭區', '825'),
(274, 16, '梓官區', '826'),
(275, 16, '彌陀區', '827'),
(276, 16, '永安區', '828'),
(277, 16, '燕巢區', '824'),
(278, 16, '田寮區', '823'),
(279, 16, '阿蓮區', '822'),
(280, 16, '茄萣區', '852'),
(281, 16, '湖內區', '829'),
(282, 16, '旗山區', '842'),
(283, 16, '美濃區', '843'),
(284, 16, '內門區', '845'),
(285, 16, '杉林區', '846'),
(286, 16, '甲仙區', '847'),
(287, 16, '六龜區', '844'),
(288, 16, '茂林區', '851'),
(289, 16, '桃源區', '848'),
(290, 16, '那瑪夏區', '8'),
(291, 17, '屏東市', '900'),
(292, 17, '潮州鎮', '920'),
(293, 17, '東港鎮', '928'),
(294, 17, '恆春鎮', '946'),
(295, 17, '萬丹鄉', '913'),
(296, 17, '崁頂鄉', '924'),
(297, 17, '新園鄉', '932'),
(298, 17, '林邊鄉', '927'),
(299, 17, '南州鄉', '926'),
(300, 17, '琉球鄉', '929'),
(301, 17, '枋寮鄉', '940'),
(302, 17, '枋山鄉', '941'),
(303, 17, '車城鄉', '944'),
(304, 17, '滿州鄉', '947'),
(305, 17, '高樹鄉', '906'),
(306, 17, '九如鄉', '904'),
(307, 17, '鹽埔鄉', '907'),
(308, 17, '里港鄉', '905'),
(309, 17, '內埔鄉', '912'),
(310, 17, '竹田鄉', '911'),
(311, 17, '長治鄉', '908'),
(312, 17, '麟洛鄉', '909'),
(313, 17, '萬巒鄉', '923'),
(314, 17, '新埤鄉', '925'),
(315, 17, '佳冬鄉', '931'),
(316, 17, '霧臺鄉', '902'),
(317, 17, '泰武鄉', '921'),
(318, 17, '瑪家鄉', '903'),
(319, 17, '來義鄉', '922'),
(320, 17, '春日鄉', '942'),
(321, 17, '獅子鄉', '943'),
(322, 17, '牡丹鄉', '945'),
(323, 17, '三地門鄉', '901'),
(324, 18, '馬公市', '880'),
(325, 18, '湖西鄉', '885'),
(326, 18, '白沙鄉', '884'),
(327, 18, '西嶼鄉', '881'),
(328, 18, '望安鄉', '882'),
(329, 18, '七美鄉', '883'),
(330, 19, '花蓮市', '970'),
(331, 19, '鳳林鎮', '975'),
(332, 19, '玉里鎮', '981'),
(333, 19, '新城鄉', '971'),
(334, 19, '吉安鄉', '973'),
(335, 19, '壽豐鄉', '974'),
(336, 19, '光復鄉', '976'),
(337, 19, '豐濱鄉', '977'),
(338, 19, '瑞穗鄉', '978'),
(339, 19, '富里鄉', '983'),
(340, 19, '秀林鄉', '972'),
(341, 19, '萬榮鄉', '979'),
(342, 19, '卓溪鄉', '982'),
(343, 20, '臺東市', '950'),
(344, 20, '成功鎮', '961'),
(345, 20, '關山鎮', '956'),
(346, 20, '長濱鄉', '962'),
(347, 20, '池上鄉', '958'),
(348, 20, '東河鄉', '959'),
(349, 20, '鹿野鄉', '955'),
(350, 20, '卑南鄉', '954'),
(351, 20, '大武鄉', '965'),
(352, 20, '綠島鄉', '951'),
(353, 20, '太麻里鄉', '963'),
(354, 20, '海端鄉', '957'),
(355, 20, '延平鄉', '953'),
(356, 20, '金峰鄉', '964'),
(357, 20, '達仁鄉', '966'),
(358, 20, '蘭嶼鄉', '952'),
(359, 21, '金城鎮', '893'),
(360, 21, '金湖鎮', '891'),
(361, 21, '金沙鎮', '890'),
(362, 21, '金寧鄉', '892'),
(363, 21, '烈嶼鄉', '894'),
(364, 21, '烏坵鄉', '896'),
(365, 22, '南竿鄉', '209'),
(366, 22, '北竿鄉', '210'),
(367, 22, '莒光鄉', '211'),
(368, 22, '東引鄉', '212');

-- --------------------------------------------------------

--
-- 資料表結構 `banner`
--

CREATE TABLE `banner` (
  `id` int(11) NOT NULL COMMENT 'Banner編號',
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Banner名稱',
  `pic_url` text COLLATE utf8_unicode_ci NOT NULL COMMENT '圖片網址',
  `pic_alt` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '圖片說明',
  `link` text COLLATE utf8_unicode_ci NOT NULL COMMENT '連結網址',
  `blank` tinyint(1) NOT NULL COMMENT '另開視窗',
  `list_order` int(11) NOT NULL COMMENT '列表順序',
  `status` tinyint(1) NOT NULL COMMENT '狀態，0：啟用，1：停用，2：已刪除',
  `remark` text COLLATE utf8_unicode_ci NOT NULL COMMENT '備註',
  `c_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立時間',
  `c_user_id` int(11) NOT NULL COMMENT '建立使者編號',
  `u_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改時間',
  `u_user_id` int(11) NOT NULL COMMENT '修改使用者編號'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `banner`
--

INSERT INTO `banner` (`id`, `name`, `pic_url`, `pic_alt`, `link`, `blank`, `list_order`, `status`, `remark`, `c_time`, `c_user_id`, `u_time`, `u_user_id`) VALUES
(1, '1', '/uploads/banner/1567068227.png', '1', '', 1, 0, 0, '', '2019-08-29 16:43:47', 1, '2019-08-29 16:54:54', 1),
(2, '2', '/uploads/banner/1567068237.png', '2', '', 1, 0, 1, '', '2019-08-29 16:43:57', 1, '2019-09-12 09:45:20', 1),
(3, '3', '/uploads/banner/1567068929.png', '3', '', 0, 0, 1, '', '2019-08-29 16:55:31', 1, '2019-09-12 09:45:25', 1),
(4, '4', '/uploads/banner/1567068944.png', '4', '', 0, 0, 1, '', '2019-08-29 16:55:31', 1, '2019-09-12 09:45:30', 1);

-- --------------------------------------------------------

--
-- 替換檢視表以便查看 `banner_view`
-- (請參考以下實際畫面)
--
CREATE TABLE `banner_view` (
`id` int(11)
,`name` varchar(64)
,`pic_url` text
,`pic_alt` varchar(64)
,`link` text
,`blank` tinyint(1)
,`list_order` int(11)
,`status` tinyint(1)
,`remark` text
,`c_time` datetime
,`c_user_id` int(11)
,`c_user_name` varchar(64)
,`u_time` datetime
,`u_user_id` int(11)
,`u_user_name` varchar(64)
);

-- --------------------------------------------------------

--
-- 資料表結構 `brand`
--

CREATE TABLE `brand` (
  `id` int(11) NOT NULL COMMENT '品牌編號',
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '品牌名稱',
  `pic_url` text COLLATE utf8_unicode_ci NOT NULL COMMENT '圖片網址',
  `pic_alt` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '圖片說明',
  `list_order` int(11) NOT NULL COMMENT '列表順序',
  `status` tinyint(1) NOT NULL COMMENT '狀態，0：啟用，1：停用，2：已刪除',
  `remark` text COLLATE utf8_unicode_ci NOT NULL COMMENT '備註',
  `c_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立時間',
  `c_user_id` int(11) NOT NULL COMMENT '建立使者編號',
  `u_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改時間',
  `u_user_id` int(11) NOT NULL COMMENT '修改使用者編號'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `brand`
--

INSERT INTO `brand` (`id`, `name`, `pic_url`, `pic_alt`, `list_order`, `status`, `remark`, `c_time`, `c_user_id`, `u_time`, `u_user_id`) VALUES
(1, '烹大師', '/uploads/brand/1567073322.png', '', 1, 0, '', '2019-05-20 12:27:43', 1, '2019-08-29 18:08:43', 1),
(2, 'VONO', '/uploads/brand/1567073329.png', '', 2, 0, '', '2019-05-20 12:28:02', 1, '2019-08-29 18:08:49', 1),
(3, 'amino vital', '/uploads/brand/1567073337.png', '', 3, 0, '', '2019-05-20 12:28:26', 1, '2019-08-29 18:08:57', 1),
(4, '品牌名稱', '/uploads/brand/1567073345.png', '圖片說明', 0, 0, '備註', '2019-08-14 16:38:35', 1, '2019-08-29 18:09:05', 1),
(5, '1', '/uploads/brand/1567073352.png', '2', 3, 0, '4', '2019-08-14 16:56:02', 1, '2019-08-29 18:09:12', 1);

-- --------------------------------------------------------

--
-- 替換檢視表以便查看 `brand_view`
-- (請參考以下實際畫面)
--
CREATE TABLE `brand_view` (
`id` int(11)
,`name` varchar(64)
,`pic_url` text
,`pic_alt` varchar(64)
,`list_order` int(11)
,`status` tinyint(1)
,`remark` text
,`c_time` datetime
,`c_user_id` int(11)
,`c_user_name` varchar(64)
,`u_time` datetime
,`u_user_id` int(11)
,`u_user_name` varchar(64)
);

-- --------------------------------------------------------

--
-- 資料表結構 `campaign`
--

CREATE TABLE `campaign` (
  `id` int(11) NOT NULL COMMENT '餐飲情報編號',
  `tag_ids` text COLLATE utf8_unicode_ci NOT NULL COMMENT '餐飲情報標籤編號，複選，逗號分隔',
  `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '標題',
  `sub_title` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '副標題',
  `content` text COLLATE utf8_unicode_ci NOT NULL COMMENT '內容',
  `pic_url` text COLLATE utf8_unicode_ci NOT NULL COMMENT '圖片網址',
  `pic_alt` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '圖片說明',
  `release_date` datetime NOT NULL COMMENT '發佈日期',
  `list_order` int(11) NOT NULL COMMENT '列表順序',
  `status` tinyint(1) NOT NULL COMMENT '狀態，0：啟用，1：停用，2：已刪除',
  `remark` text COLLATE utf8_unicode_ci NOT NULL COMMENT '備註',
  `c_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立時間',
  `c_user_id` int(11) NOT NULL COMMENT '建立使者編號',
  `u_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改時間',
  `u_user_id` int(11) NOT NULL COMMENT '修改使用者編號'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `campaign`
--

INSERT INTO `campaign` (`id`, `tag_ids`, `title`, `sub_title`, `content`, `pic_url`, `pic_alt`, `release_date`, `list_order`, `status`, `remark`, `c_time`, `c_user_id`, `u_time`, `u_user_id`) VALUES
(1, '1,2', '我們與苦瓜的距離', '我們與苦瓜的距離', '內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容', '/uploads/campaign/1567069865.png', '', '2019-05-23 00:00:00', 0, 0, '', '2019-05-23 13:50:45', 3, '2019-09-11 11:41:39', 1),
(2, '3,4', '「味の素 ®」(AJI-NO-MOTO ®) 正式開始銷售', '我們與苦瓜的距離', '', '/uploads/campaign/1567069878.png', '', '2019-05-23 00:00:00', 0, 0, '', '2019-05-23 13:51:14', 3, '2019-08-29 17:11:18', 1),
(3, '3,1', '「味の素 ®」(AJI-NO-MOTO ®) 正式開始銷售', '我們與苦瓜的距離', '', '/uploads/campaign/1567069889.png', '', '2019-05-23 00:00:00', 0, 0, '', '2019-05-23 13:52:18', 3, '2019-08-29 17:11:29', 1),
(4, '4,2', '「味の素 ®」(AJI-NO-MOTO ®) 正式開始銷售', '我們與苦瓜的距離', '', '/uploads/campaign/1567069898.png', '', '2019-05-23 00:00:00', 0, 0, '', '2019-05-23 13:52:31', 3, '2019-08-29 17:11:38', 1),
(5, '4', '主標題', '副標題', '餐飲情報內容', '/uploads/campaign/1567069915.png', '圖片說明', '1910-01-01 00:00:00', 0, 0, '備註', '2019-08-14 15:18:05', 1, '2019-08-30 13:40:37', 1),
(6, '4,2,5', '1', '2', '4<img alt=\"\" src=\"/uploads/editor/1565768901.png\" />', '/uploads/campaign/1567069923.png', '3', '2019-08-07 00:00:00', 5, 0, '6', '2019-08-14 15:47:17', 1, '2019-08-29 17:12:03', 1);

-- --------------------------------------------------------

--
-- 資料表結構 `campaign_tag`
--

CREATE TABLE `campaign_tag` (
  `id` int(11) NOT NULL COMMENT '餐飲情報標籤編號',
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '餐飲情報標籤名稱',
  `color` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '餐飲情報標籤顏色',
  `list_order` int(11) NOT NULL COMMENT '列表順序',
  `status` tinyint(1) NOT NULL COMMENT '狀態，0：啟用，1：停用，2：已刪除',
  `remark` text COLLATE utf8_unicode_ci NOT NULL COMMENT '備註',
  `c_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立時間',
  `c_user_id` int(11) NOT NULL COMMENT '建立使用者編號',
  `u_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改時間',
  `u_user_id` int(11) NOT NULL COMMENT '修改使用者編號'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `campaign_tag`
--

INSERT INTO `campaign_tag` (`id`, `name`, `color`, `list_order`, `status`, `remark`, `c_time`, `c_user_id`, `u_time`, `u_user_id`) VALUES
(1, '企業活動', '#00ff80', 1, 0, '', '2019-03-16 13:30:56', 1, '2019-08-30 12:39:16', 1),
(2, '活動訊息', '#80ff80', 2, 0, '', '2019-03-16 13:31:09', 1, '2019-08-30 11:49:01', 1),
(3, '商品資訊', '#0080ff', 0, 0, '', '2019-03-16 13:31:20', 1, '2019-08-30 11:49:12', 1),
(4, '餐飲情報標籤名稱', '#804040', 0, 0, '備註', '2019-08-14 14:31:26', 1, '2019-08-30 11:49:24', 1),
(5, '5', '#0000ff', 5, 0, '5', '2019-08-14 14:44:38', 1, '2019-08-30 11:49:34', 1);

-- --------------------------------------------------------

--
-- 替換檢視表以便查看 `campaign_tag_view`
-- (請參考以下實際畫面)
--
CREATE TABLE `campaign_tag_view` (
`id` int(11)
,`name` varchar(64)
,`color` varchar(32)
,`list_order` int(11)
,`status` tinyint(1)
,`remark` text
,`c_time` datetime
,`c_user_id` int(11)
,`c_user_name` varchar(64)
,`u_time` datetime
,`u_user_id` int(11)
,`u_user_name` varchar(64)
);

-- --------------------------------------------------------

--
-- 替換檢視表以便查看 `campaign_view`
-- (請參考以下實際畫面)
--
CREATE TABLE `campaign_view` (
`id` int(11)
,`tag_ids` text
,`tag_names` text
,`tag_colors` text
,`title` varchar(64)
,`sub_title` varchar(64)
,`content` text
,`pic_url` text
,`pic_alt` varchar(64)
,`release_date` datetime
,`list_order` int(11)
,`status` tinyint(1)
,`remark` text
,`c_time` datetime
,`c_user_id` int(11)
,`c_user_name` varchar(64)
,`u_time` datetime
,`u_user_id` int(11)
,`u_user_name` varchar(64)
);

-- --------------------------------------------------------

--
-- 資料表結構 `city`
--

CREATE TABLE `city` (
  `id` int(11) NOT NULL COMMENT '縣市編號',
  `name` varchar(8) COLLATE utf8_unicode_ci NOT NULL COMMENT '縣市名稱'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `city`
--

INSERT INTO `city` (`id`, `name`) VALUES
(1, '基隆市'),
(2, '台北市'),
(3, '新北市'),
(4, '桃園市'),
(5, '新竹市'),
(6, '新竹縣'),
(7, '宜蘭縣'),
(8, '苗栗縣'),
(9, '台中市'),
(10, '彰化縣'),
(11, '南投縣'),
(12, '雲林縣'),
(13, '嘉義市'),
(14, '嘉義縣'),
(15, '台南市'),
(16, '高雄市'),
(17, '屏東縣'),
(18, '澎湖縣'),
(19, '花蓮縣'),
(20, '台東縣'),
(21, '金門縣'),
(22, '連江縣');

-- --------------------------------------------------------

--
-- 替換檢視表以便查看 `city_area_view`
-- (請參考以下實際畫面)
--
CREATE TABLE `city_area_view` (
`zipcode` varchar(3)
,`city_id` int(11)
,`city_name` varchar(8)
,`area_id` int(11)
,`area_name` varchar(8)
);

-- --------------------------------------------------------

--
-- 資料表結構 `higi`
--

CREATE TABLE `higi` (
  `id` int(11) NOT NULL COMMENT '招客秘技編號',
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '招客秘技名稱',
  `pic_url` text COLLATE utf8_unicode_ci NOT NULL COMMENT '圖片網址',
  `pic_alt` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '圖片說明',
  `content` varchar(512) COLLATE utf8_unicode_ci NOT NULL COMMENT '內容',
  `description` varchar(512) COLLATE utf8_unicode_ci NOT NULL COMMENT '說明',
  `recipepro_id` int(11) NOT NULL COMMENT '專業食譜編號',
  `product_id` int(11) NOT NULL COMMENT '商品編號',
  `tags` text COLLATE utf8_unicode_ci NOT NULL COMMENT '食材',
  `type` varchar(512) COLLATE utf8_unicode_ci NOT NULL COMMENT '菜色',
  `style` varchar(512) COLLATE utf8_unicode_ci NOT NULL COMMENT '菜式',
  `methods` text COLLATE utf8_unicode_ci NOT NULL COMMENT '烹調方式，以逗號分隔',
  `note` text COLLATE utf8_unicode_ci NOT NULL COMMENT '小筆記',
  `note_pic_url` text COLLATE utf8_unicode_ci NOT NULL COMMENT '小筆記圖片',
  `note_pic_alt` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '小筆記圖片說明',
  `member_only` tinyint(1) NOT NULL COMMENT '會員限定',
  `visitor` int(11) NOT NULL COMMENT '瀏覽人數',
  `list_order` int(11) NOT NULL COMMENT '列表順序',
  `status` tinyint(1) NOT NULL COMMENT '狀態，0：啟用，1：停用，2：已刪除',
  `remark` text COLLATE utf8_unicode_ci NOT NULL COMMENT '備註',
  `c_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立時間',
  `c_user_id` int(11) NOT NULL COMMENT '建立使者編號',
  `u_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改時間',
  `u_user_id` int(11) NOT NULL COMMENT '修改使用者編號'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `higi`
--

INSERT INTO `higi` (`id`, `name`, `pic_url`, `pic_alt`, `content`, `description`, `recipepro_id`, `product_id`, `tags`, `type`, `style`, `methods`, `note`, `note_pic_url`, `note_pic_alt`, `member_only`, `visitor`, `list_order`, `status`, `remark`, `c_time`, `c_user_id`, `u_time`, `u_user_id`) VALUES
(1, '1', '/uploads/product/1574133959.png,/uploads/higi/1566285909.png', '123,456', 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB', 0, 1, '海鮮類,豆類', '韓式', '麵食', '', '456', '/uploads/higi/1574133162.png', '123', 0, 99, 1, 0, '5', '2019-08-16 10:56:05', 1, '2019-11-19 13:31:35', 2),
(2, '2', '/uploads/higi/1566285936.png', '2', '2', '', 2, 2, '', '', '主菜', '', '春季', '', '', 0, 11, 2, 0, '', '2019-08-19 19:43:07', 1, '2019-11-13 09:55:17', 2),
(3, '3', '/uploads/higi/1566285909.png', '3', '3', '', 3, 3, '', '', '湯品', '', '小筆記', '', '', 0, 1, 3, 0, '備註', '2019-08-20 15:05:23', 1, '2019-09-11 13:49:14', 2),
(4, '4', '/uploads/higi/1566285909.png', '4', '4', '', 4, 4, '', '', '湯品', '', '3', '', '', 1, 5, 4, 0, '5', '2019-08-20 15:25:36', 1, '2019-09-11 11:10:51', 2),
(5, '5', '/uploads/higi/1566285909.png', '5', '5', '', 5, 5, '', '', '湯品', '', '', '', '', 0, 1, 5, 0, '', '2019-09-03 12:31:59', 0, '2019-09-03 14:22:32', 2),
(6, '6', '/uploads/higi/1566285909.png', '6', '6', '', 6, 6, '', '', '湯品', '', '', '', '', 1, 0, 6, 0, '', '2019-09-03 12:31:59', 0, '2019-09-03 12:34:15', 0),
(7, '7', '/uploads/higi/1566285909.png', '7', '7', '', 7, 7, '', '', '湯品', '', '', '', '', 1, 0, 7, 0, '', '2019-09-03 12:31:59', 0, '2019-09-03 12:34:15', 0),
(8, '8', '/uploads/higi/1566285909.png', '8', '8', '', 8, 8, '', '', '湯品', '', '', '', '', 1, 0, 8, 0, '', '2019-09-03 12:31:59', 0, '2019-09-03 12:34:15', 0),
(9, '9', '/uploads/higi/1566285909.png', '9', '9', '', 9, 9, '', '', '湯品', '', '', '', '', 1, 0, 9, 0, '', '2019-09-03 12:32:00', 0, '2019-09-03 12:34:15', 0),
(10, '10', '/uploads/higi/1566285909.png', '10', '10', '', 10, 10, '', '', '湯品', '', '', '', '', 1, 0, 10, 0, '', '2019-09-03 12:32:00', 0, '2019-09-03 12:34:15', 0),
(11, '11', '/uploads/higi/1566285909.png', '11', '11', '', 11, 1, '', '', '湯品', '', '', '', '', 1, 0, 11, 0, '', '2019-09-03 12:32:00', 0, '2019-09-03 14:05:03', 0),
(12, '12', '/uploads/higi/1566285909.png', '12', '12', '', 12, 2, '', '', '湯品', '', '', '', '', 1, 3, 12, 0, '', '2019-09-03 12:32:01', 0, '2019-09-11 10:00:51', 2),
(13, '13', '/uploads/higi/1566285909.png', '13', '13', '', 13, 3, '', '', '湯品', '', '', '', '', 1, 0, 13, 0, '', '2019-09-03 12:32:01', 0, '2019-09-03 14:05:03', 0),
(14, '14', '/uploads/higi/1566285909.png', '14', '14', '', 14, 4, '', '', '湯品', '', '', '', '', 1, 1, 14, 0, '', '2019-09-03 12:32:01', 0, '2019-09-11 09:36:57', 2),
(15, '15', '/uploads/higi/1566285909.png', '15', '15', '', 15, 5, '', '', '湯品', '', '', '', '', 1, 0, 15, 0, '', '2019-09-03 12:32:01', 0, '2019-09-03 14:05:03', 0),
(16, '16', '/uploads/higi/1566285936.png', '16', '16', '', 16, 6, '', '', '湯品', '', '', '', '', 0, 0, 16, 0, '', '2019-09-03 12:32:02', 0, '2019-09-03 14:05:03', 0),
(17, '17', '/uploads/higi/1566285936.png', '17', '17', '', 17, 7, '', '', '湯品', '', '', '', '', 0, 0, 17, 0, '', '2019-09-03 12:32:02', 0, '2019-09-03 14:05:03', 0),
(18, '18', '/uploads/higi/1566285936.png', '18', '18', '', 18, 8, '', '', '湯品', '', '', '', '', 0, 0, 18, 0, '', '2019-09-03 12:32:02', 0, '2019-09-03 14:05:03', 0),
(19, '19', '/uploads/higi/1566285936.png', '19', '19', '', 19, 9, '', '', '湯品', '', '', '', '', 0, 0, 19, 0, '', '2019-09-03 12:32:02', 0, '2019-09-03 14:05:03', 0),
(20, '20', '/uploads/higi/1566285936.png', '20', '20', '', 20, 10, '', '', '湯品', '', '', '', '', 0, 0, 20, 0, '', '2019-09-03 12:32:02', 0, '2019-09-03 14:05:03', 0),
(21, '21', '/uploads/higi/1566285936.png', '21', '21', '', 21, 1, '', '', '湯品', '', '', '', '', 0, 3, 21, 0, '', '2019-09-03 12:32:03', 0, '2019-11-19 12:09:08', 2),
(22, '22', '/uploads/higi/1566285936.png', '22', '22', '', 22, 2, '', '', '湯品', '', '', '', '', 0, 0, 22, 0, '', '2019-09-03 12:32:03', 0, '2019-09-03 14:05:08', 0),
(23, '23', '/uploads/higi/1566285936.png', '23', '23', '', 23, 3, '', '', '湯品', '', '', '', '', 0, 0, 23, 0, '', '2019-09-03 12:32:03', 0, '2019-09-03 14:05:08', 0),
(24, '24', '/uploads/higi/1566285936.png', '24', '24', '', 24, 4, '', '', '湯品', '', '', '', '', 0, 3, 24, 0, '', '2019-09-03 12:32:03', 0, '2019-09-11 09:38:14', 2),
(25, '25', '/uploads/higi/1566285936.png', '25', '25', '', 25, 5, '', '', '湯品', '', '', '', '', 0, 0, 25, 0, '', '2019-09-03 12:32:03', 0, '2019-09-03 14:22:25', 0),
(26, '26', '/uploads/higi/1566285936.png', '26', '26', '', 26, 6, '', '', '湯品', '', '', '', '', 0, 0, 26, 0, '', '2019-09-03 12:32:04', 0, '2019-09-03 14:05:08', 0),
(27, '27', '/uploads/higi/1566285936.png', '27', '27', '', 27, 7, '', '', '湯品', '', '', '', '', 0, 0, 27, 0, '', '2019-09-03 12:32:04', 0, '2019-09-03 14:05:08', 0),
(28, '28', '/uploads/higi/1566285936.png', '28', '28', '', 28, 8, '', '', '湯品', '', '', '', '', 0, 0, 28, 0, '', '2019-09-03 12:32:06', 0, '2019-09-03 14:05:08', 0),
(29, '29', '/uploads/higi/1566285936.png', '29', '29', '', 29, 9, '', '', '湯品', '', '', '', '', 0, 0, 29, 0, '', '2019-09-03 12:32:07', 0, '2019-09-03 14:05:08', 0),
(30, '30', '/uploads/higi/1566285936.png', '30', '30', '', 30, 10, '', '', '湯品', '', '', '', '', 0, 0, 30, 0, '', '2019-09-03 12:32:07', 0, '2019-09-03 14:05:08', 0),
(31, '招客秘技名稱', '圖片網址', '圖片說明', '招客秘技內容', '', 0, 0, '', '', '標籤', '烹調方式', '小筆記', '', '', 0, 3, 0, 0, '備註', '2019-09-12 09:37:34', 1, '2019-11-19 11:38:56', 2),
(32, '測試', '/uploads/higi/1568252259.png', '1', '1', '', 3, 1, '', '', '前菜', '', '1', '', '', 0, 12, 0, 0, '', '2019-09-12 09:37:39', 1, '2019-11-19 12:09:12', 2);

-- --------------------------------------------------------

--
-- 替換檢視表以便查看 `higi_view`
-- (請參考以下實際畫面)
--
CREATE TABLE `higi_view` (
`id` int(11)
,`name` varchar(64)
,`pic_url` text
,`pic_alt` varchar(64)
,`content` varchar(512)
,`description` varchar(512)
,`recipepro_id` int(11)
,`recipepro_name` varchar(64)
,`recipepro_pic_url` text
,`recipepro_pic_alt` varchar(64)
,`recipepro_member_only` tinyint(1)
,`brand_id` int(11)
,`brand_name` varchar(64)
,`brand_pic_url` text
,`brand_pic_alt` varchar(64)
,`product_id` int(11)
,`product_name` varchar(64)
,`product_pic_urls` text
,`product_pic_alts` varchar(64)
,`tags` text
,`type` varchar(512)
,`style` varchar(512)
,`methods` text
,`note` text
,`note_pic_url` text
,`note_pic_alt` varchar(64)
,`member_only` tinyint(1)
,`visitor` int(11)
,`list_order` int(11)
,`status` tinyint(1)
,`remark` text
,`c_time` datetime
,`c_user_id` int(11)
,`c_user_name` varchar(64)
,`u_time` datetime
,`u_user_id` int(11)
,`u_user_name` varchar(64)
);

-- --------------------------------------------------------

--
-- 資料表結構 `log`
--

CREATE TABLE `log` (
  `id` int(11) NOT NULL COMMENT '操作記錄編號',
  `user_id` int(11) NOT NULL COMMENT '使用者編號',
  `ip` varchar(128) COLLATE utf8_unicode_ci NOT NULL COMMENT 'IP位址',
  `program_id` int(11) NOT NULL COMMENT '程式編號',
  `method` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'method',
  `endpoint` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'endpoint',
  `verb` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'verb',
  `args` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'args',
  `file` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'file',
  `resultCode` varchar(16) COLLATE utf8_unicode_ci NOT NULL COMMENT 'resultCode',
  `resultMessage` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'resultMessage',
  `resultData` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'resultData',
  `c_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作時間'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `log`
--

INSERT INTO `log` (`id`, `user_id`, `ip`, `program_id`, `method`, `endpoint`, `verb`, `args`, `file`, `resultCode`, `resultMessage`, `resultData`, `c_time`) VALUES
(1, 0, '::1', 45, 'GET', 'banner', '', '[]', 'null', '0', '執行成功', '[{\"id\":\"1\",\"name\":\"1\",\"pic_url\":\"/uploads/banner/1567068227.png\",\"pic_alt\":\"1\",\"link\":\"\",\"blank\":\"1\",\"list_order\":\"0\"}]', '2019-11-19 13:28:02'),
(2, 0, '::1', 57, 'GET', 'campaign', '', '[]', 'null', '0', '執行成功', '[{\"id\":\"5\",\"tag_ids\":\"4\",\"tag_names\":\"餐飲情報標籤名稱\",\"tag_colors\":\"#804040\",\"title\":\"主標題\",\"sub_title\":\"副標題\",\"content\":\"餐飲情報內容\",\"pic_url\":\"/uploads/campaign/1567069915.png\",\"pic_alt\":\"圖片說明\",\"release_date\":\"1910-01-01 00:00:00\",\"list_order\":\"0\"},{\"id\":\"1\",\"tag_ids\":\"1,2\",\"tag_names\":\"企業活動,活動訊息\",\"tag_colors\":\"#00ff80,#80ff80\",\"title\":\"我們與苦瓜的距離\",\"sub_title\":\"我們與苦瓜的距離\",\"content\":\"內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容\",\"pic_url\":\"/uploads/campaign/1567069865.png\",\"pic_alt\":\"\",\"release_date\":\"2019-05-23 00:00:00\",\"list_order\":\"0\"},{\"id\":\"2\",\"tag_ids\":\"3,4\",\"tag_names\":\"商品資訊,餐飲情報標籤名稱\",\"tag_colors\":\"#0080ff,#804040\",\"title\":\"「味の素 ®」(AJI-NO-MOTO ®) 正式開始銷售\",\"sub_title\":\"我們與苦瓜的距離\",\"content\":\"\",\"pic_url\":\"/uploads/campaign/1567069878.png\",\"pic_alt\":\"\",\"release_date\":\"2019-05-23 00:00:00\",\"list_order\":\"0\"},{\"id\":\"3\",\"tag_ids\":\"3,1\",\"tag_names\":\"企業活動,商品資訊\",\"tag_colors\":\"#00ff80,#0080ff\",\"title\":\"「味の素 ®」(AJI-NO-MOTO ®) 正式開始銷售\",\"sub_title\":\"我們與苦瓜的距離\",\"content\":\"\",\"pic_url\":\"/uploads/campaign/1567069889.png\",\"pic_alt\":\"\",\"release_date\":\"2019-05-23 00:00:00\",\"list_order\":\"0\"},{\"id\":\"4\",\"tag_ids\":\"4,2\",\"tag_names\":\"活動訊息,餐飲情報標籤名稱\",\"tag_colors\":\"#80ff80,#804040\",\"title\":\"「味の素 ®」(AJI-NO-MOTO ®) 正式開始銷售\",\"sub_title\":\"我們與苦瓜的距離\",\"content\":\"\",\"pic_url\":\"/uploads/campaign/1567069898.png\",\"pic_alt\":\"\",\"release_date\":\"2019-05-23 00:00:00\",\"list_order\":\"0\"},{\"id\":\"6\",\"tag_ids\":\"4,2,5\",\"tag_names\":\"活動訊息,餐飲情報標籤名稱,5\",\"tag_colors\":\"#80ff80,#804040,#0000ff\",\"title\":\"1\",\"sub_title\":\"2\",\"content\":\"4<img alt=\"\" src=\"/uploads/editor/1565768901.png\" />\",\"pic_url\":\"/uploads/campaign/1567069923.png\",\"pic_alt\":\"3\",\"release_date\":\"2019-08-07 00:00:00\",\"list_order\":\"5\"}]', '2019-11-19 13:28:02'),
(3, 0, '::1', 69, 'GET', 'recipepro', '', '[]', 'null', '0', '執行成功', '[{\"id\":\"1\",\"name\":\"1\",\"pic_url\":\"/uploads/repicepro/1565924165.png\",\"pic_alt\":\"3\",\"feature\":\"6\",\"tags\":\"雞肉,豬肉,根莖類\",\"price\":\"9\",\"type\":\"素食\",\"style\":\"火鍋\",\"product_ids\":\"6,7\",\"product_names\":\"6,7\",\"material_weight\":\"1231231\",\"nutrition\":\"1\",\"member_only\":\"0\",\"visitor\":\"25\",\"list_order\":\"1\"},{\"id\":\"2\",\"name\":\"2\",\"pic_url\":\"/uploads/repicepro/1567072415.png\",\"pic_alt\":\"A\",\"feature\":\"\",\"tags\":\"雞肉\",\"price\":\"999\",\"type\":\"日式\",\"style\":\"火鍋\",\"product_ids\":\"1,2,3,19\",\"product_names\":\"1,2,3,19\",\"material_weight\":\"\",\"nutrition\":\"<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n		<tr>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n		<tr>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>碳水化合物</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n		<tr>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n		<tr>\r\n			<th>碳水化合物</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n\",\"member_only\":\"0\",\"visitor\":\"69\",\"list_order\":\"2\"},{\"id\":\"3\",\"name\":\"3\",\"pic_url\":\"/uploads/repicepro/1565924165.png\",\"pic_alt\":\"3\",\"feature\":\"6\",\"tags\":\"雞肉,豬肉,根莖類\",\"price\":\"9\",\"type\":\"素食\",\"style\":\"火鍋\",\"product_ids\":\"19\",\"product_names\":\"19\",\"material_weight\":\"\",\"nutrition\":\"1\",\"member_only\":\"1\",\"visitor\":\"3\",\"list_order\":\"3\"},{\"id\":\"4\",\"name\":\"4\",\"pic_url\":\"/uploads/repicepro/1567072415.png\",\"pic_alt\":\"A\",\"feature\":\"7\",\"tags\":\"牛肉\",\"price\":\"0\",\"type\":\"中式\",\"style\":\"火鍋\",\"product_ids\":\"1\",\"product_names\":\"1\",\"material_weight\":\"\",\"nutrition\":\"\",\"member_only\":\"0\",\"visitor\":\"12\",\"list_order\":\"4\"},{\"id\":\"5\",\"name\":\"5\",\"pic_url\":\"/uploads/repicepro/1565924165.png\",\"pic_alt\":\"3\",\"feature\":\"6\",\"tags\":\"雞肉,豬肉,根莖類,主菜,火鍋\",\"price\":\"9\",\"type\":\"素食\",\"style\":\"火鍋\",\"product_ids\":\"1\",\"product_names\":\"1\",\"material_weight\":\"\",\"nutrition\":\"1\",\"member_only\":\"1\",\"visitor\":\"3\",\"list_order\":\"5\"},{\"id\":\"6\",\"name\":\"6\",\"pic_url\":\"/uploads/repicepro/1567072415.png\",\"pic_alt\":\"A\",\"feature\":\"7\",\"tags\":\"飯食\",\"price\":\"0\",\"type\":\"中式\",\"style\":\"主菜\",\"product_ids\":\"1\",\"product_names\":\"1\",\"material_weight\":\"\",\"nutrition\":\"\",\"member_only\":\"0\",\"visitor\":\"1\",\"list_order\":\"6\"},{\"id\":\"7\",\"name\":\"7\",\"pic_url\":\"/uploads/repicepro/1567072415.png\",\"pic_alt\":\"A\",\"feature\":\"7\",\"tags\":\"前菜\",\"price\":\"0\",\"type\":\"中式\",\"style\":\"主菜\",\"product_ids\":\"1\",\"product_names\":\"1\",\"material_weight\":\"\",\"nutrition\":\"\",\"member_only\":\"0\",\"visitor\":\"5\",\"list_order\":\"7\"},{\"id\":\"8\",\"name\":\"8\",\"pic_url\":\"/uploads/repicepro/1567072415.png\",\"pic_alt\":\"A\",\"feature\":\"7\",\"tags\":\"前菜\",\"price\":\"0\",\"type\":\"中式\",\"style\":\"主菜\",\"product_ids\":\"1\",\"product_names\":\"1\",\"material_weight\":\"\",\"nutrition\":\"\",\"member_only\":\"0\",\"visitor\":\"3\",\"list_order\":\"8\"},{\"id\":\"9\",\"name\":\"9\",\"pic_url\":\"/uploads/repicepro/1567072415.png\",\"pic_alt\":\"A\",\"feature\":\"7\",\"tags\":\"前菜\",\"price\":\"0\",\"type\":\"中式\",\"style\":\"主菜\",\"product_ids\":\"1\",\"product_names\":\"1\",\"material_weight\":\"\",\"nutrition\":\"\",\"member_only\":\"0\",\"visitor\":\"4\",\"list_order\":\"9\"},{\"id\":\"10\",\"name\":\"10\",\"pic_url\":\"/uploads/repicepro/1567072415.png\",\"pic_alt\":\"A\",\"feature\":\"7\",\"tags\":\"前菜\",\"price\":\"0\",\"type\":\"中式\",\"style\":\"主菜\",\"product_ids\":\"1\",\"product_names\":\"1\",\"material_weight\":\"\",\"nutrition\":\"\",\"member_only\":\"0\",\"visitor\":\"7\",\"list_order\":\"10\"},{\"id\":\"11\",\"name\":\"11\",\"pic_url\":\"/uploads/repicepro/1567072415.png\",\"pic_alt\":\"A\",\"feature\":\"7\",\"tags\":\"前菜\",\"price\":\"0\",\"type\":\"中式\",\"style\":\"主菜\",\"product_ids\":\"1\",\"product_names\":\"1\",\"material_weight\":\"\",\"nutrition\":\"\",\"member_only\":\"0\",\"visitor\":\"4\",\"list_order\":\"11\"}]', '2019-11-19 13:28:02'),
(4, 0, '::1', 65, 'GET', 'product', '', '[]', 'null', '0', '執行成功', '[{\"id\":\"1\",\"brand_id\":\"5\",\"brand_name\":\"1\",\"brand_pic_url\":\"/uploads/brand/1567073352.png\",\"name\":\"1\",\"pic_urls\":\"/uploads/product/1565848035.png,/uploads/product/1565848034.png,/uploads/product/1565848036.png,/uploads/product/1565848037.png,/uploads/product/1565848038.png,/uploads/product/1565848039.png\",\"pic_alts\":\"4,3,,,,\",\"tag\":\"標籤1\",\"content\":\"內容內容內容內容內容內容內容內容內容內容\",\"tips\":\"內容內容內容內容內容內容內容內容內容內容\",\"information\":\"<ul class=\"product-info-box p-a0\">\r\n	<li class=\"d-flex \"><span class=\"title\">原料</span><span class=\"text\">調味劑(L-麩酸鈉、5`-次黃嘌呤核苷磷酸二鈉、琥珀酸二鈉)、食鹽、乳糖、砂糖、乾燻鰹魚、鰹魚抽出物、酵母抽出物、D-木糖、麥芽糖、葡萄糖、糊精</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">淨重</span><span class=\"text\">1公斤</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">原產地</span><span class=\"text\">日本國神奈川縣</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品包裝</span><span class=\"text\">1kgx12袋/箱</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品條碼</span><span class=\"text\">4901001375431</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">外箱尺寸</span><span class=\"text\">522x262x209mm</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存期限</span><span class=\"text\">24個月(常溫未開封狀態下) </span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">過敏原</span><span class=\"text\">2本產品含有牛奶及其製品</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存方法</span><span class=\"text\">開封後，為了避免受潮，請密封存放於乾燥通風處，以確認產品的最佳風味及品質。 </span></li>\r\n</ul>\r\n\",\"mark\":\"<ul class=\"info-box p-a0\">\r\n	<li class=\"d-flex\"><span class=\"title\">每一份量</span><span class=\"text\">1公克</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">本包裝含</span><span class=\"text\">1000份</span></li>\r\n</ul>\r\n\r\n<ul class=\"product-info-box p-a0\">\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\"></span><span class=\"text-e\">每份</span><span class=\"text-h\">每100公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">熱量</span><span class=\"text-e\">2.2大卡</span><span class=\"text-h\">225大卡</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">蛋白質</span><span class=\"text-e\">0.2公克</span><span class=\"text-h\">24.1公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">脂肪</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title p-l10\">飽和脂肪</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title p-l10\">反式脂肪</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">碳水化合物</span><span class=\"text-e\">0.3公克</span><span class=\"text-h\">31.6公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">糖</span><span class=\"text-e\">0.2公克</span><span class=\"text-h\">17.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">鈉</span><span class=\"text-e\">175毫克</span><span class=\"text-h\">17500毫克</span></li>\r\n</ul>\r\n\",\"list_order\":\"1\"},{\"id\":\"2\",\"brand_id\":\"1\",\"brand_name\":\"烹大師\",\"brand_pic_url\":\"/uploads/brand/1567073322.png\",\"name\":\"2\",\"pic_urls\":\"/uploads/product/1567073370.png\",\"pic_alts\":\"\",\"tag\":\"\",\"content\":\"商品內容\",\"tips\":\"美味秘訣\",\"information\":\"<ul class=\"p-a0\">\r\n	<li class=\"d-flex \"><span class=\"title\">原料</span> <span class=\"text\">調味劑(L-麩酸鈉、5&#39;-次黃嘌呤核苷磷酸二鈉、琥珀酸二鈉)、食鹽、乳糖、砂糖、乾燻鰹魚、鰹魚抽出物、酵母抽出物、D-木糖、麥芽糖、葡萄糖、糊精</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">淨重</span> <span class=\"text\">1公斤</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">原產地</span> <span class=\"text\">日本國神奈川縣</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品包裝</span> <span class=\"text\">1kgx12袋/箱</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品條碼</span> <span class=\"text\">4901001375431</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">外箱尺寸</span> <span class=\"text\">522x262x209mm</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存期限</span> <span class=\"text\">24個月(常溫未開封狀態下) </span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">過敏原</span> <span class=\"text\">2本產品含有牛奶及其製品</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存方法</span> <span class=\"text\">開封後，為了避免受潮，請密封存放於乾燥通風處，以確認產品的最佳風味及品質。 </span></li>\r\n</ul>\r\n\",\"mark\":\"<ul class=\"p-a0\">\r\n	<li class=\"d-flex\"><span class=\"title\">每一份量</span> <span class=\"text\">1公克</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">本包裝含</span> <span class=\"text\">1000份</span></li>\r\n</ul>\r\n\r\n<ul class=\"p-a0\">\r\n	<li class=\"d-flex justify-content-between\"><span class=\"text-e\">每份</span> <span class=\"text-h\">每100公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">熱量</span> <span class=\"text-e\">2.2大卡</span> <span class=\"text-h\">225大卡</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">蛋白質</span> <span class=\"text-e\">0.2公克</span> <span class=\"text-h\">24.1公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">脂肪</span> <span class=\"text-e\">0.0公克</span> <span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title p-l10\">飽和脂肪</span> <span class=\"text-e\">0.0公克</span> <span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title p-l10\">反式脂肪</span> <span class=\"text-e\">0.0公克</span> <span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">碳水化合物</span> <span class=\"text-e\">0.3公克</span> <span class=\"text-h\">31.6公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">糖</span> <span class=\"text-e\">0.2公克</span> <span class=\"text-h\">17.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">鈉</span> <span class=\"text-e\">175毫克</span> <span class=\"text-h\">17500毫克</span></li>\r\n</ul>\r\n\",\"list_order\":\"2\"},{\"id\":\"3\",\"brand_id\":\"1\",\"brand_name\":\"烹大師\",\"brand_pic_url\":\"/uploads/brand/1567073322.png\",\"name\":\"3\",\"pic_urls\":\"/uploads/product/1558350652.png\",\"pic_alts\":\"1\",\"tag\":\"\",\"content\":\"<table class=\"info-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>原料</th>\r\n			<td>調味劑(L-麩酸鈉、5&#39;-次黃嘌呤核苷磷酸二鈉、琥珀酸二鈉)、食鹽、乳糖、砂糖、乾燻鰹魚、鰹魚抽出物、酵母抽出物、D-木糖、麥芽糖、葡萄糖、糊精</td>\r\n		</tr>\r\n		<tr>\r\n			<th>容量</th>\r\n			<td>320公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>使用方法</th>\r\n			<td>7公克可調理成1000c.c的高湯&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"tips\":\"\",\"information\":\"\",\"mark\":\"<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">每一份量<span>100公克</span></th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\">每份</th>\r\n			<th>每100公克</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量</th>\r\n			<td>2.2 大卡</td>\r\n			<td>225 打卡</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蛋白質</th>\r\n			<td>0.2 公克</td>\r\n			<td>24.1 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>&nbsp; &nbsp; 飽和脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>&nbsp; &nbsp; 反式脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>碳水化合物</th>\r\n			<td>&nbsp; 0.3 公克</td>\r\n			<td>31.6 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>&nbsp; &nbsp; 糖</th>\r\n			<td>0.2 公克</td>\r\n			<td>17.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈉</th>\r\n			<td>175 毫克</td>\r\n			<td>17500 毫克</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"list_order\":\"3\"},{\"id\":\"4\",\"brand_id\":\"1\",\"brand_name\":\"烹大師\",\"brand_pic_url\":\"/uploads/brand/1567073322.png\",\"name\":\"4\",\"pic_urls\":\"/uploads/product/1558350701.png\",\"pic_alts\":\"\",\"tag\":\"\",\"content\":\"<table class=\"info-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>原料</th>\r\n			<td>調味劑(L-麩酸鈉、5&#39;-次黃嘌呤核苷磷酸二鈉、琥珀酸二鈉)、食鹽、乳糖、砂糖、乾燻鰹魚、鰹魚抽出物、酵母抽出物、D-木糖、麥芽糖、葡萄糖、糊精</td>\r\n		</tr>\r\n		<tr>\r\n			<th>容量</th>\r\n			<td>450公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>使用方法</th>\r\n			<td>7公克可調理成1000c.c的高湯&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"tips\":\"\",\"information\":\"\",\"mark\":\"<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">每一份量<span>100公克</span></th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\">每份</th>\r\n			<th>每100公克</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量</th>\r\n			<td>2.2 大卡</td>\r\n			<td>225 打卡</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蛋白質</th>\r\n			<td>0.2 公克</td>\r\n			<td>24.1 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>&nbsp; &nbsp; 飽和脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>&nbsp; &nbsp; 反式脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>碳水化合物</th>\r\n			<td>&nbsp; 0.3 公克</td>\r\n			<td>31.6 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>&nbsp; &nbsp; 糖</th>\r\n			<td>0.2 公克</td>\r\n			<td>17.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈉</th>\r\n			<td>175 毫克</td>\r\n			<td>17500 毫克</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"list_order\":\"4\"},{\"id\":\"5\",\"brand_id\":\"1\",\"brand_name\":\"烹大師\",\"brand_pic_url\":\"/uploads/brand/1567073322.png\",\"name\":\"5\",\"pic_urls\":\"/uploads/product/1558350747.png\",\"pic_alts\":\"\",\"tag\":\"\",\"content\":\"<table class=\"info-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>原料</th>\r\n			<td>調味劑(L-麩酸鈉、5&#39;-次黃嘌呤核苷磷酸二鈉、琥珀酸二鈉)、食鹽、乳糖、砂糖、乾燻鰹魚、鰹魚抽出物、酵母抽出物、D-木糖、麥芽糖、葡萄糖、糊精</td>\r\n		</tr>\r\n		<tr>\r\n			<th>容量</th>\r\n			<td>65公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>使用方法</th>\r\n			<td>7公克可調理成1000c.c的高湯&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"tips\":\"\",\"information\":\"\",\"mark\":\"<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">每一份量<span>100公克</span></th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\">每份</th>\r\n			<th>每100公克</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量</th>\r\n			<td>2.2 大卡</td>\r\n			<td>225 打卡</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蛋白質</th>\r\n			<td>0.2 公克</td>\r\n			<td>24.1 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>&nbsp; &nbsp; 飽和脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>&nbsp; &nbsp; 反式脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>碳水化合物</th>\r\n			<td>&nbsp; 0.3 公克</td>\r\n			<td>31.6 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>&nbsp; &nbsp; 糖</th>\r\n			<td>0.2 公克</td>\r\n			<td>17.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈉</th>\r\n			<td>175 毫克</td>\r\n			<td>17500 毫克</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"list_order\":\"5\"},{\"id\":\"6\",\"brand_id\":\"2\",\"brand_name\":\"VONO\",\"brand_pic_url\":\"/uploads/brand/1567073329.png\",\"name\":\"6\",\"pic_urls\":\"/uploads/product/1558418208.jpg\",\"pic_alts\":\"\",\"tag\":\"\",\"content\":\"<table class=\"info-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>原料</th>\r\n			<td>甜玉米粉、砂糖、馬鈴薯澱粉、麥芽糊精、脫脂牛乳、棕櫚油、乳糖、玉米糖漿、食鹽、玉米粒、玉米油、棕櫚仁油、調味劑(L-麩酸鈉、5&#39;-次黃嘌呤核苷磷酸二鈉)、酸酪蛋白、關華豆膠、洋蔥、糊精、酵母抽出物、大豆卵磷脂、白胡椒、香料、麵粉、葡萄糖、油菜籽油</td>\r\n		</tr>\r\n		<tr>\r\n			<th>容量</th>\r\n			<td>57.6公克(共3袋)</td>\r\n		</tr>\r\n		<tr>\r\n			<th>使用方法</th>\r\n			<td>將VONO&reg;倒入杯中，注入150ml的熱水(約一般馬克杯6分滿)攪拌15秒即可。</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"tips\":\"\",\"information\":\"\",\"mark\":\"<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">每一份量<span>19.2公克</span></th>\r\n		</tr>\r\n		<tr>\r\n			<th colspan=\"3\">本包裝含3份</th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\">每份</th>\r\n			<th>每100公克</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th style=\"text-align: left;\">熱量</th>\r\n			<td>80大卡</td>\r\n			<td>416大卡</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">蛋白質</th>\r\n			<td>1.2公克</td>\r\n			<td>6.1公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">脂肪</th>\r\n			<td>2.2公克</td>\r\n			<td>11.6公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>飽和脂肪</th>\r\n			<td>1.5公克</td>\r\n			<td>7.8公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>反式脂肪</th>\r\n			<td>0公克</td>\r\n			<td>0公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">碳水化合物</th>\r\n			<td>13.8公克</td>\r\n			<td>71.9公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>糖</th>\r\n			<td>6.1公克</td>\r\n			<td>31.9公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">鈉</th>\r\n			<td>411毫克</td>\r\n			<td>2140毫克</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"list_order\":\"6\"},{\"id\":\"7\",\"brand_id\":\"2\",\"brand_name\":\"VONO\",\"brand_pic_url\":\"/uploads/brand/1567073329.png\",\"name\":\"7\",\"pic_urls\":\"/uploads/product/1558420642.jpg\",\"pic_alts\":\"\",\"tag\":\"\",\"content\":\"<table class=\"info-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>原料</th>\r\n			<td>馬鈴薯澱粉、麥芽糊精、砂糖、棕櫚油、食鹽、全脂牛乳、玉米糖漿、脫脂牛乳、馬鈴薯粉、洋蔥粉、調味劑(L-麩酸鈉、5&lsquo;-次黃嘌呤核苷磷酸二鈉、胺基乙酸)、卡門貝爾起司、洋蔥、棕櫚仁油、還原水飴、酵母抽出物、糊精、玉米油、關華豆膠、豬肉、酸酪蛋白、醬油、白胡椒、鰹魚抽出物、荷蘭芹、大豆卵磷脂、薑黃、玉米芯抽出物、芹菜籽、玉米澱粉、月桂、陳皮、混合生育醇、麵粉、葡萄糖、油菜籽油、迷迭香抽出物</td>\r\n		</tr>\r\n		<tr>\r\n			<th>容量</th>\r\n			<td>46.5公克(共3袋)</td>\r\n		</tr>\r\n		<tr>\r\n			<th>使用方法</th>\r\n			<td>將VONO&reg;倒入杯中，注入150ml的熱水(約一般馬克杯6分滿)攪拌15秒即可。</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"tips\":\"\",\"information\":\"\",\"mark\":\"<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">每一份量<span>15.5公克</span></th>\r\n		</tr>\r\n		<tr>\r\n			<th colspan=\"3\">本包裝含3份</th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\">每份</th>\r\n			<th>每100公克</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th style=\"text-align: left;\">熱量</th>\r\n			<td>64大卡</td>\r\n			<td>413大卡</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">蛋白質</th>\r\n			<td>0.9公克</td>\r\n			<td>5.5公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">脂肪</th>\r\n			<td>1.8公克</td>\r\n			<td>11.5公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>飽和脂肪</th>\r\n			<td>1.3公克</td>\r\n			<td>8.4公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>反式脂肪</th>\r\n			<td>0公克</td>\r\n			<td>0公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">碳水化合物</th>\r\n			<td>11.1公克</td>\r\n			<td>71.8公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>糖</th>\r\n			<td>2.8公克</td>\r\n			<td>17.9公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">鈉</th>\r\n			<td>409毫克</td>\r\n			<td>2640毫克</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"list_order\":\"7\"},{\"id\":\"8\",\"brand_id\":\"2\",\"brand_name\":\"VONO\",\"brand_pic_url\":\"/uploads/brand/1567073329.png\",\"name\":\"8\",\"pic_urls\":\"/uploads/product/1558423834.jpg\",\"pic_alts\":\"\",\"tag\":\"\",\"content\":\"<table class=\"info-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>原料</th>\r\n			<td>馬鈴薯澱粉、南瓜粉、砂糖、脫脂牛乳、棕櫚油、玉米糖漿、食鹽、麥芽糊精、馬鈴薯粉、棕櫚仁油、玉米油、糊精、調味劑(L-麩酸鈉、5&#39;-次黃嘌呤核苷磷酸二鈉)、酵母抽出物、酸酪蛋白、洋蔥抽出物、椰子油、全脂牛乳、葡萄糖糖漿、米糠油、洋蔥、荷蘭芹、大豆卵磷脂、乳糖、白胡椒、豆蔻、月桂、肉桂、陳皮、葡萄糖</td>\r\n		</tr>\r\n		<tr>\r\n			<th>容量</th>\r\n			<td>52.2公克(共3袋)</td>\r\n		</tr>\r\n		<tr>\r\n			<th>使用方法</th>\r\n			<td>將VONO&reg;倒入杯中，注入150ml的熱水(約一般馬克杯6分滿)攪拌15秒即可。</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"tips\":\"\",\"information\":\"\",\"mark\":\"<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">每一份量<span>17.4公克</span></th>\r\n		</tr>\r\n		<tr>\r\n			<th colspan=\"3\">本包裝含3份</th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\">每份</th>\r\n			<th>每100公克</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th style=\"text-align: left;\">熱量</th>\r\n			<td>75大卡</td>\r\n			<td>429大卡</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">蛋白質</th>\r\n			<td>1.1公克</td>\r\n			<td>6.1公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">脂肪</th>\r\n			<td>2.5公克</td>\r\n			<td>14.5公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>飽和脂肪</th>\r\n			<td>2.0公克</td>\r\n			<td>11.5公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>反式脂肪</th>\r\n			<td>0公克</td>\r\n			<td>0公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">碳水化合物</th>\r\n			<td>11.9公克</td>\r\n			<td>68.6公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>糖</th>\r\n			<td>5.0公克</td>\r\n			<td>28.8公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">鈉</th>\r\n			<td>388毫克</td>\r\n			<td>2230毫克</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"list_order\":\"8\"},{\"id\":\"9\",\"brand_id\":\"2\",\"brand_name\":\"VONO\",\"brand_pic_url\":\"/uploads/brand/1567073329.png\",\"name\":\"9\",\"pic_urls\":\"/uploads/product/1558424084.jpg\",\"pic_alts\":\"\",\"tag\":\"\",\"content\":\"<table class=\"info-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>原料</th>\r\n			<td>馬鈴薯澱粉、麥芽糊精、乳糖、棕櫚油、卡門貝爾起司、全脂牛乳、砂糖、馬鈴薯粉、玉米糖漿、食鹽、戈爾根佐拉起司、棕櫚仁油、調味劑(L-麩酸鈉、5&#39;-次黃嘌呤核苷磷酸二鈉、胺基乙酸)、切達起司、椰子油、洋蔥粉、洋蔥、玉米油、關華豆膠、葡萄糖糖漿、脫脂牛乳、酵母抽出物、糊精、酸酪蛋白、鰹魚抽出物、大豆卵磷脂、荷蘭芹、玉米芯抽出物、白胡椒、薑黃、芹菜籽、玉米澱粉、月桂、陳皮</td>\r\n		</tr>\r\n		<tr>\r\n			<th>容量</th>\r\n			<td>54公克(共3袋)</td>\r\n		</tr>\r\n		<tr>\r\n			<th>使用方法</th>\r\n			<td>將VONO&reg;倒入杯中，注入150ml的熱水(約一般馬克杯6分滿)攪拌15秒即可。</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"tips\":\"\",\"information\":\"\",\"mark\":\"<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">每一份量<span>18.0公克</span></th>\r\n		</tr>\r\n		<tr>\r\n			<th colspan=\"3\">本包裝含3份</th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\">每份</th>\r\n			<th>每100公克</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th style=\"text-align: left;\">熱量</th>\r\n			<td>84大卡</td>\r\n			<td>465大卡</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">蛋白質</th>\r\n			<td>1.4公克</td>\r\n			<td>8公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">脂肪</th>\r\n			<td>3.9公克</td>\r\n			<td>21.4公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>飽和脂肪</th>\r\n			<td>2.9公克</td>\r\n			<td>16.2公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>反式脂肪</th>\r\n			<td>0公克</td>\r\n			<td>0公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">碳水化合物</th>\r\n			<td>10.8公克</td>\r\n			<td>60.0公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>糖</th>\r\n			<td>3.6公克</td>\r\n			<td>19.8公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">鈉</th>\r\n			<td>418毫克</td>\r\n			<td>2320毫克</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"list_order\":\"9\"},{\"id\":\"10\",\"brand_id\":\"2\",\"brand_name\":\"VONO\",\"brand_pic_url\":\"/uploads/brand/1567073329.png\",\"name\":\"10\",\"pic_urls\":\"/uploads/product/1558520127.jpg\",\"pic_alts\":\"\",\"tag\":\"\",\"content\":\"<table class=\"info-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>原料</th>\r\n			<td>麩醯胺酸，L-精胺酸，L-白胺酸，L-異白胺酸，L-&alpha;胺基異戊酸，調味劑(檸檬酸、DL-蘋果酸、檸檬酸鈉)，L-羥丁胺酸，鹽酸L-二胺基己酸，L-蛋胺酸，鹽酸L-組織胺酸，L-脯胺酸，脂肪酸蔗糖酯，維生素C，蛋殼粉，麥芽糖漿，阿拉伯膠，甜味劑(阿斯巴甜、醋磺內酯鉀)，L-苯丙胺酸，L-色胺酸，糊精，辛烯基丁二酸鈉澱粉，香料，食用油脂(菜籽油、椰子油、葵花籽油、棕櫚油)，菸鹼酸，檸檬酸亞鐵鈉，丙二醇，維生素E，乳糖，本多酸鈣，脫脂乳粉，維生素B6，維生素B1，發酵乳粉末，維生素B2，纖維素，維生素A，水解澱粉，&alpha;、&beta;、&gamma;-環狀糊精，維生素B12，維生素D3，砂糖<br />\r\n			本產品含牛奶、蛋及其製品 &nbsp;警語:內含苯丙胺酸</td>\r\n		</tr>\r\n		<tr>\r\n			<th>最佳補給時機</th>\r\n			<td>* 運動前 30分鐘補充，維持運動最佳表現<br />\r\n			* 長時間運動中補充，可幫助保持活力<br />\r\n			* 運動後 30分鐘內補充，幫助身體回復</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"tips\":\"\",\"information\":\"\",\"mark\":\"<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">每一份量<span>4.5公克</span></th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\">每份</th>\r\n			<th>每100公克</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th style=\"text-align: left;\">熱量</th>\r\n			<td>17大卡</td>\r\n			<td>385大卡</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">蛋白質</th>\r\n			<td>3.8公克</td>\r\n			<td>84.5公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">脂肪</th>\r\n			<td>0.0公克</td>\r\n			<td>0.0公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>飽和脂肪</th>\r\n			<td>0.0公克</td>\r\n			<td>0.0公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>反式脂肪</th>\r\n			<td>0.0公克</td>\r\n			<td>0.0公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">碳水化合物</th>\r\n			<td>0.5公克</td>\r\n			<td>11.7公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>糖</th>\r\n			<td>0.0公克</td>\r\n			<td>0.0公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">鈉</th>\r\n			<td>1毫克</td>\r\n			<td>18毫克</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n&nbsp;\r\n\r\n<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\" style=\"text-align: center;\">胺基酸成分</th>\r\n			<th><span style=\"font-size:13px;\">Amino acids 3,600mg</span></th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th>BCAA</th>\r\n			<td>白胺酸Leucine<br />\r\n			異白胺酸Isoleucine<br />\r\n			纈胺酸Valine</td>\r\n			<td>540mg<br />\r\n			430mg<br />\r\n			360mg</td>\r\n		</tr>\r\n		<tr>\r\n			<th>&nbsp;</th>\r\n			<td>麩醯胺酸Glutamine</td>\r\n			<td>650mg</td>\r\n		</tr>\r\n		<tr>\r\n			<th>&nbsp;</th>\r\n			<td>精胺酸Arginine</td>\r\n			<td>610mg</td>\r\n		</tr>\r\n		<tr>\r\n			<th>&nbsp;</th>\r\n			<td>其他多種胺基酸Other AAs</td>\r\n			<td>1,010mg</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n&nbsp;\r\n\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td align=\"center\" bgcolor=\"#cea71b\" colspan=\"3\"><span style=\"color:#2c3e50;\">胺基酸成分</span></td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\"right\" bgcolor=\"#fcf6e0\" colspan=\"3\"><span style=\"color:#2c3e50;\">胺基酸Amino acids&nbsp;&nbsp;3,600mg</span></td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\"left\" bgcolor=\"#CEA71B\" rowspan=\"3\"><span style=\"color:#2c3e50;\">BCAA</span></td>\r\n			<td align=\"right\" bgcolor=\"#f9ecc0\"><span style=\"color:#2c3e50;\">白胺酸Leucine</span></td>\r\n			<td align=\"right\" bgcolor=\"#f9ecc0\"><span style=\"color:#2c3e50;\">540mg</span></td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\"right\" bgcolor=\"#fcf6e0\"><span style=\"color:#2c3e50;\">異白胺酸Isoleucine</span></td>\r\n			<td align=\"right\" bgcolor=\"#fcf6e0\"><span style=\"color:#2c3e50;\">430mg</span></td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\"right\" bgcolor=\"#f9ecc0\"><span style=\"color:#2c3e50;\">纈胺酸Valine</span></td>\r\n			<td align=\"right\" bgcolor=\"#f9ecc0\"><span style=\"color:#2c3e50;\">360mg</span></td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\"left\" bgcolor=\"#E7C247\" rowspan=\"3\">&nbsp;</td>\r\n			<td align=\"right\" bgcolor=\"#fcf6e0\"><span style=\"color:#2c3e50;\">麩醯胺酸Glutamine</span></td>\r\n			<td align=\"right\" bgcolor=\"#fcf6e0\"><span style=\"color:#2c3e50;\">650mg</span></td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\"right\" bgcolor=\"#F9ECC0\"><span style=\"color:#2c3e50;\">精胺酸Arginine</span></td>\r\n			<td align=\"right\" bgcolor=\"#F9ECC0\"><span style=\"color:#2c3e50;\">610mg</span></td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\"right\" bgcolor=\"#FCF6E0\"><span style=\"color:#2c3e50;\">其他多種胺基酸Other AAs</span></td>\r\n			<td align=\"right\" bgcolor=\"#FCF6E0\"><span style=\"color:#2c3e50;\">1,010mg</span></td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"list_order\":\"10\"},{\"id\":\"11\",\"brand_id\":\"2\",\"brand_name\":\"VONO\",\"brand_pic_url\":\"/uploads/brand/1567073329.png\",\"name\":\"11\",\"pic_urls\":\"/uploads/product/1558426836.jpg\",\"pic_alts\":\"\",\"tag\":\"\",\"content\":\"<table class=\"info-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>原料</th>\r\n			<td>L-白胺酸，鹽酸L-二胺基己酸，L-&alpha;胺基異戊酸，L-異白胺酸，L-羥丁胺酸，L-苯丙胺酸，甜味劑(麥芽糖醇、阿斯巴甜、醋磺內酯鉀)，脂肪酸蔗糖酯，檸檬酸，L-蛋胺酸，香料，糊精，鹽酸L-組織胺酸，L-色胺酸，酶解大豆卵磷脂，貝殼鈣，菜籽油，微結晶狀&alpha;-纖維素，脂肪酸甘油酯，維生素B2 &nbsp;&nbsp;<br />\r\n			警語:內含苯丙胺酸</td>\r\n		</tr>\r\n		<tr>\r\n			<th>最佳補給時機</th>\r\n			<td>* 比賽前一天睡前 30分鐘補充，調整身體狀態<br />\r\n			* 比賽後 30分鐘內補充，提供身體關鍵營養<br />\r\n			* 就寢前 30分鐘補充，幫助身體持續回復</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"tips\":\"\",\"information\":\"\",\"mark\":\"<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">每一份量<span>4.7公克</span></th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\">每份</th>\r\n			<th>每100公克</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th style=\"text-align: left;\">熱量</th>\r\n			<td>18大卡</td>\r\n			<td>389大卡</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">蛋白質</th>\r\n			<td>4.1公克</td>\r\n			<td>86.7公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">脂肪</th>\r\n			<td>0.0公克</td>\r\n			<td>0.0公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>飽和脂肪</th>\r\n			<td>0.0公克</td>\r\n			<td>0.0公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>反式脂肪</th>\r\n			<td>0.0公克</td>\r\n			<td>0.0公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">碳水化合物</th>\r\n			<td>0.5公克</td>\r\n			<td>10.5公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>糖</th>\r\n			<td>0.0公克</td>\r\n			<td>0.0公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">鈉</th>\r\n			<td>1毫克</td>\r\n			<td>13毫克</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<br />\r\n<br />\r\n&nbsp;\r\n<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">胺基酸成分</th>\r\n		</tr>\r\n		<tr>\r\n			<th colspan=\"3\">必需胺基酸Essential Amino acids 4,000mg</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th>BCAA</th>\r\n			<td>白胺酸Leucine</td>\r\n			<td>1,600mg</td>\r\n		</tr>\r\n		<tr>\r\n			<th>BCAA</th>\r\n			<td>異白胺酸Isoleucine</td>\r\n			<td>430mg</td>\r\n		</tr>\r\n		<tr>\r\n			<th>BCAA</th>\r\n			<td>纈胺酸Valine</td>\r\n			<td>440mg</td>\r\n		</tr>\r\n		<tr>\r\n			<th>&nbsp;</th>\r\n			<td>其他多種胺基酸Other AAs</td>\r\n			<td>1,540mg</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"list_order\":\"11\"},{\"id\":\"12\",\"brand_id\":\"2\",\"brand_name\":\"VONO\",\"brand_pic_url\":\"/uploads/brand/1567073329.png\",\"name\":\"12\",\"pic_urls\":\"/uploads/product/1558515763.png\",\"pic_alts\":\"\",\"tag\":\"\",\"content\":\"<table class=\"info-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>原料</th>\r\n			<td>水，糊精，DL-胺基丙酸，檸檬酸，L-脯胺酸，洋菜，香料，檸檬酸鈉，刺槐豆膠，塔拉膠，醋磺內酯鉀(甜味劑)，維生素B2<br />\r\n			本品生產線亦有生產含芒果原料之產品</td>\r\n		</tr>\r\n		<tr>\r\n			<th>最佳補給時機</th>\r\n			<td>*運動或比賽前30分鐘補充，保持體力充沛<br />\r\n			*運動中後段補充，迅速補充能量</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"tips\":\"\",\"information\":\"\",\"mark\":\"<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">每一份量<span>130公克</span></th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\">每份</th>\r\n			<th>每100公克</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th style=\"text-align: left;\">熱量</th>\r\n			<td>174大卡</td>\r\n			<td>134大卡</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">蛋白質</th>\r\n			<td>4.8公克</td>\r\n			<td>3.7公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">脂肪</th>\r\n			<td>0.0公克</td>\r\n			<td>0.0公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>飽和脂肪</th>\r\n			<td>0.0公克</td>\r\n			<td>0.0公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>反式脂肪</th>\r\n			<td>0.0公克</td>\r\n			<td>0.0公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">碳水化合物</th>\r\n			<td>38.9公克</td>\r\n			<td>29.9公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>糖</th>\r\n			<td>2.3公克</td>\r\n			<td>1.8公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">鈉</th>\r\n			<td>14毫克</td>\r\n			<td>11毫克</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<br />\r\n<br />\r\n&nbsp;\r\n<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">胺基酸成分</th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\" style=\"text-align: left;\">胺基酸Amino acids 5,000mg</th>\r\n		</tr>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"2\" style=\"text-align: left;\">丙胺酸Alanine&nbsp;4,500mg</th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\" style=\"text-align: left;\">脯胺酸Proline&nbsp;500mg</th>\r\n		</tr>\r\n	</thead>\r\n</table>\r\n\",\"list_order\":\"12\"},{\"id\":\"13\",\"brand_id\":\"2\",\"brand_name\":\"VONO\",\"brand_pic_url\":\"/uploads/brand/1567073329.png\",\"name\":\"13\",\"pic_urls\":\"/uploads/product/1558516565.png\",\"pic_alts\":\"\",\"tag\":\"\",\"content\":\"<table class=\"info-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>原料</th>\r\n			<td>調味劑(L-麩酸鈉、DL-胺基丙酸、琥珀酸二鈉、5&#39;-次黃嘌呤核苷磷酸二鈉、5&#39;-鳥嘌呤核苷磷酸二鈉)、食鹽、蔗糖、玉米澱粉、干貝粉、酵母抽出物、扇貝抽出物、糊精</td>\r\n		</tr>\r\n		<tr>\r\n			<th>容量</th>\r\n			<td>40公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>使用方法</th>\r\n			<td>5公克可調理成500c.c的高湯</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"tips\":\"\",\"information\":\"\",\"mark\":\"<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">每一份量<span>1公克</span></th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\">每份</th>\r\n			<th>每100公克</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th style=\"text-align: left;\">熱量</th>\r\n			<td>2.3大卡</td>\r\n			<td>232 大卡</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">蛋白質</th>\r\n			<td>0.3 公克</td>\r\n			<td>&nbsp;29.1公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">&nbsp; &nbsp; 飽和脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">&nbsp; &nbsp; 反式脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">碳水化合物</th>\r\n			<td>&nbsp; 0.3 公克</td>\r\n			<td>28.9 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">&nbsp; &nbsp; 糖</th>\r\n			<td>0.1公克</td>\r\n			<td>8.1 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">鈉</th>\r\n			<td>150 毫克</td>\r\n			<td>15000 毫克</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"list_order\":\"13\"},{\"id\":\"14\",\"brand_id\":\"2\",\"brand_name\":\"VONO\",\"brand_pic_url\":\"/uploads/brand/1567073329.png\",\"name\":\"14\",\"pic_urls\":\"/uploads/product/1558516958.png\",\"pic_alts\":\"\",\"tag\":\"\",\"content\":\"<table class=\"info-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>原料</th>\r\n			<td>調味劑(L-麩酸鈉、DL-胺基丙酸、琥珀酸二鈉、5&#39;-次黃嘌呤核苷磷酸二鈉、5&#39;-鳥嘌呤核苷磷酸二鈉)、食鹽、蔗糖、玉米澱粉、干貝粉、酵母抽出物、扇貝抽出物、糊精</td>\r\n		</tr>\r\n		<tr>\r\n			<th>容量</th>\r\n			<td>40公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>使用方法</th>\r\n			<td>5公克可調理成500c.c的高湯</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"tips\":\"\",\"information\":\"\",\"mark\":\"<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">每一份量<span>1公克</span></th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\">每份</th>\r\n			<th>每100公克</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th style=\"text-align: left;\">熱量</th>\r\n			<td>2.3大卡</td>\r\n			<td>232 大卡</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">蛋白質</th>\r\n			<td>0.3 公克</td>\r\n			<td>&nbsp;29.1公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">&nbsp; &nbsp; 飽和脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">&nbsp; &nbsp; 反式脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">碳水化合物</th>\r\n			<td>&nbsp; 0.3 公克</td>\r\n			<td>28.9 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">&nbsp; &nbsp; 糖</th>\r\n			<td>0.1公克</td>\r\n			<td>8.1 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">鈉</th>\r\n			<td>150 毫克</td>\r\n			<td>15000 毫克</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"list_order\":\"14\"},{\"id\":\"15\",\"brand_id\":\"3\",\"brand_name\":\"amino vital\",\"brand_pic_url\":\"/uploads/brand/1567073337.png\",\"name\":\"15\",\"pic_urls\":\"/uploads/product/1558517236.png\",\"pic_alts\":\"\",\"tag\":\"\",\"content\":\"<table class=\"info-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>原料</th>\r\n			<td>調味劑(L-麩酸鈉、氯化鉀、5&#39;-次黃嘌呤核苷磷酸二鈉、5&#39;-鳥嘌呤核苷磷酸二鈉、琥珀酸二鈉)、食鹽、砂糖、D-甘露醇（甜味劑）、昆布粉、糊精、昆布抽出物</td>\r\n		</tr>\r\n		<tr>\r\n			<th>容量</th>\r\n			<td>40公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>使用方法</th>\r\n			<td>4公克可調理成600c.c的高湯</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"tips\":\"\",\"information\":\"\",\"mark\":\"<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">每一份量<span>1公克</span></th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\">每份</th>\r\n			<th>每100公克</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th style=\"text-align: left;\">熱量</th>\r\n			<td>2.2大卡</td>\r\n			<td>217 大卡</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">蛋白質</th>\r\n			<td>0.2公克</td>\r\n			<td>&nbsp;15.3公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">&nbsp; &nbsp; 飽和脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">&nbsp; &nbsp; 反式脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">碳水化合物</th>\r\n			<td>&nbsp; 0.4公克</td>\r\n			<td>38.9 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">&nbsp; &nbsp; 糖</th>\r\n			<td>0.2公克</td>\r\n			<td>21.3公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">鈉</th>\r\n			<td>156毫克</td>\r\n			<td>15600 毫克</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"list_order\":\"15\"},{\"id\":\"16\",\"brand_id\":\"3\",\"brand_name\":\"amino vital\",\"brand_pic_url\":\"/uploads/brand/1567073337.png\",\"name\":\"16\",\"pic_urls\":\"/uploads/product/1558517382.png\",\"pic_alts\":\"\",\"tag\":\"\",\"content\":\"<table class=\"info-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>原料</th>\r\n			<td>調味劑(L-麩酸鈉、氯化鉀、5&#39;-次黃嘌呤核苷磷酸二鈉、5&#39;-鳥嘌呤核苷磷酸二鈉、琥珀酸二鈉)、食鹽、砂糖、D-甘露醇（甜味劑）、昆布粉、糊精、昆布抽出物</td>\r\n		</tr>\r\n		<tr>\r\n			<th>容量</th>\r\n			<td>112公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>使用方法</th>\r\n			<td>4公克可調理成600c.c的高湯</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"tips\":\"\",\"information\":\"\",\"mark\":\"<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">每一份量<span>1公克</span></th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\">每份</th>\r\n			<th>每100公克</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th style=\"text-align: left;\">熱量</th>\r\n			<td>2.2大卡</td>\r\n			<td>217 大卡</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">蛋白質</th>\r\n			<td>0.2公克</td>\r\n			<td>&nbsp;15.3公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">&nbsp; &nbsp; 飽和脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">&nbsp; &nbsp; 反式脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">碳水化合物</th>\r\n			<td>&nbsp; 0.4公克</td>\r\n			<td>38.9 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">&nbsp; &nbsp; 糖</th>\r\n			<td>0.2公克</td>\r\n			<td>21.3公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">鈉</th>\r\n			<td>156毫克</td>\r\n			<td>15600 毫克</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"list_order\":\"16\"},{\"id\":\"17\",\"brand_id\":\"3\",\"brand_name\":\"amino vital\",\"brand_pic_url\":\"/uploads/brand/1567073337.png\",\"name\":\"17\",\"pic_urls\":\"/uploads/product/1558517383.png\",\"pic_alts\":\"\",\"tag\":\"\",\"content\":\"<table class=\"info-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>原料</th>\r\n			<td>調味劑(L-麩酸鈉、氯化鉀、5&#39;-次黃嘌呤核苷磷酸二鈉、5&#39;-鳥嘌呤核苷磷酸二鈉、琥珀酸二鈉)、食鹽、砂糖、D-甘露醇（甜味劑）、昆布粉、糊精、昆布抽出物</td>\r\n		</tr>\r\n		<tr>\r\n			<th>容量</th>\r\n			<td>112公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>使用方法</th>\r\n			<td>4公克可調理成600c.c的高湯</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"tips\":\"\",\"information\":\"\",\"mark\":\"<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">每一份量<span>1公克</span></th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\">每份</th>\r\n			<th>每100公克</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th style=\"text-align: left;\">熱量</th>\r\n			<td>2.2大卡</td>\r\n			<td>217 大卡</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">蛋白質</th>\r\n			<td>0.2公克</td>\r\n			<td>&nbsp;15.3公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">&nbsp; &nbsp; 飽和脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">&nbsp; &nbsp; 反式脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">碳水化合物</th>\r\n			<td>&nbsp; 0.4公克</td>\r\n			<td>38.9 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">&nbsp; &nbsp; 糖</th>\r\n			<td>0.2公克</td>\r\n			<td>21.3公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">鈉</th>\r\n			<td>156毫克</td>\r\n			<td>15600 毫克</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"list_order\":\"17\"},{\"id\":\"18\",\"brand_id\":\"4\",\"brand_name\":\"品牌名稱\",\"brand_pic_url\":\"/uploads/brand/1567073345.png\",\"name\":\"18\",\"pic_urls\":\"/uploads/product/1565847840.png\",\"pic_alts\":\"圖片說明\",\"tag\":\"\",\"content\":\"商品內容\",\"tips\":\"美味秘訣\",\"information\":\"商品資訊\",\"mark\":\"營養標示\",\"list_order\":\"18\"},{\"id\":\"19\",\"brand_id\":\"5\",\"brand_name\":\"1\",\"brand_pic_url\":\"/uploads/brand/1567073352.png\",\"name\":\"19\",\"pic_urls\":\"\",\"pic_alts\":\"\",\"tag\":\"\",\"content\":\"3\",\"tips\":\"4\",\"information\":\"5\",\"mark\":\"6\",\"list_order\":\"19\"}]', '2019-11-19 13:28:02'),
(5, 0, '::1', 49, 'GET', 'ad', '', '[]', 'null', '0', '執行成功', '[{\"id\":\"1\",\"name\":\"Ajinomoto Group\",\"pic_url\":\"/uploads/ad/1567073878.png\",\"pic_alt\":\"\",\"link\":\"https://www.ajinomoto.com/en/numbers/zh/\",\"list_order\":\"1\"},{\"id\":\"2\",\"name\":\"Ajinomoto Group\",\"pic_url\":\"/uploads/ad/1567073887.png\",\"pic_alt\":\"\",\"link\":\"https://www.ajinomoto.com/en/numbers/zh/\",\"list_order\":\"1\"},{\"id\":\"3\",\"name\":\"NEWS\",\"pic_url\":\"/uploads/ad/1567073895.png\",\"pic_alt\":\"\",\"link\":\"https://www.ajinomoto.com/en/aboutus/newsletter/zh/\",\"list_order\":\"2\"},{\"id\":\"4\",\"name\":\"1\",\"pic_url\":\"/uploads/ad/1567073903.png\",\"pic_alt\":\"2\",\"link\":\"3\",\"list_order\":\"4\"}]', '2019-11-19 13:28:02'),
(6, 0, '::1', 45, 'GET', 'banner', '', '[]', 'null', '0', '執行成功', '[{\"id\":\"1\",\"name\":\"1\",\"pic_url\":\"/uploads/banner/1567068227.png\",\"pic_alt\":\"1\",\"link\":\"\",\"blank\":\"1\",\"list_order\":\"0\"}]', '2019-11-19 13:28:02');
INSERT INTO `log` (`id`, `user_id`, `ip`, `program_id`, `method`, `endpoint`, `verb`, `args`, `file`, `resultCode`, `resultMessage`, `resultData`, `c_time`) VALUES
(7, 0, '::1', 57, 'GET', 'campaign', '', '[]', 'null', '0', '執行成功', '[{\"id\":\"5\",\"tag_ids\":\"4\",\"tag_names\":\"餐飲情報標籤名稱\",\"tag_colors\":\"#804040\",\"title\":\"主標題\",\"sub_title\":\"副標題\",\"content\":\"餐飲情報內容\",\"pic_url\":\"/uploads/campaign/1567069915.png\",\"pic_alt\":\"圖片說明\",\"release_date\":\"1910-01-01 00:00:00\",\"list_order\":\"0\"},{\"id\":\"1\",\"tag_ids\":\"1,2\",\"tag_names\":\"企業活動,活動訊息\",\"tag_colors\":\"#00ff80,#80ff80\",\"title\":\"我們與苦瓜的距離\",\"sub_title\":\"我們與苦瓜的距離\",\"content\":\"內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容\",\"pic_url\":\"/uploads/campaign/1567069865.png\",\"pic_alt\":\"\",\"release_date\":\"2019-05-23 00:00:00\",\"list_order\":\"0\"},{\"id\":\"2\",\"tag_ids\":\"3,4\",\"tag_names\":\"商品資訊,餐飲情報標籤名稱\",\"tag_colors\":\"#0080ff,#804040\",\"title\":\"「味の素 ®」(AJI-NO-MOTO ®) 正式開始銷售\",\"sub_title\":\"我們與苦瓜的距離\",\"content\":\"\",\"pic_url\":\"/uploads/campaign/1567069878.png\",\"pic_alt\":\"\",\"release_date\":\"2019-05-23 00:00:00\",\"list_order\":\"0\"},{\"id\":\"3\",\"tag_ids\":\"3,1\",\"tag_names\":\"企業活動,商品資訊\",\"tag_colors\":\"#00ff80,#0080ff\",\"title\":\"「味の素 ®」(AJI-NO-MOTO ®) 正式開始銷售\",\"sub_title\":\"我們與苦瓜的距離\",\"content\":\"\",\"pic_url\":\"/uploads/campaign/1567069889.png\",\"pic_alt\":\"\",\"release_date\":\"2019-05-23 00:00:00\",\"list_order\":\"0\"},{\"id\":\"4\",\"tag_ids\":\"4,2\",\"tag_names\":\"活動訊息,餐飲情報標籤名稱\",\"tag_colors\":\"#80ff80,#804040\",\"title\":\"「味の素 ®」(AJI-NO-MOTO ®) 正式開始銷售\",\"sub_title\":\"我們與苦瓜的距離\",\"content\":\"\",\"pic_url\":\"/uploads/campaign/1567069898.png\",\"pic_alt\":\"\",\"release_date\":\"2019-05-23 00:00:00\",\"list_order\":\"0\"},{\"id\":\"6\",\"tag_ids\":\"4,2,5\",\"tag_names\":\"活動訊息,餐飲情報標籤名稱,5\",\"tag_colors\":\"#80ff80,#804040,#0000ff\",\"title\":\"1\",\"sub_title\":\"2\",\"content\":\"4<img alt=\"\" src=\"/uploads/editor/1565768901.png\" />\",\"pic_url\":\"/uploads/campaign/1567069923.png\",\"pic_alt\":\"3\",\"release_date\":\"2019-08-07 00:00:00\",\"list_order\":\"5\"}]', '2019-11-19 13:28:02'),
(8, 0, '::1', 69, 'GET', 'recipepro', '', '[]', 'null', '0', '執行成功', '[{\"id\":\"1\",\"name\":\"1\",\"pic_url\":\"/uploads/repicepro/1565924165.png\",\"pic_alt\":\"3\",\"feature\":\"6\",\"tags\":\"雞肉,豬肉,根莖類\",\"price\":\"9\",\"type\":\"素食\",\"style\":\"火鍋\",\"product_ids\":\"6,7\",\"product_names\":\"6,7\",\"material_weight\":\"1231231\",\"nutrition\":\"1\",\"member_only\":\"0\",\"visitor\":\"25\",\"list_order\":\"1\"},{\"id\":\"2\",\"name\":\"2\",\"pic_url\":\"/uploads/repicepro/1567072415.png\",\"pic_alt\":\"A\",\"feature\":\"\",\"tags\":\"雞肉\",\"price\":\"999\",\"type\":\"日式\",\"style\":\"火鍋\",\"product_ids\":\"1,2,3,19\",\"product_names\":\"1,2,3,19\",\"material_weight\":\"\",\"nutrition\":\"<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n		<tr>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n		<tr>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>碳水化合物</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n		<tr>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n		<tr>\r\n			<th>碳水化合物</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n\",\"member_only\":\"0\",\"visitor\":\"69\",\"list_order\":\"2\"},{\"id\":\"3\",\"name\":\"3\",\"pic_url\":\"/uploads/repicepro/1565924165.png\",\"pic_alt\":\"3\",\"feature\":\"6\",\"tags\":\"雞肉,豬肉,根莖類\",\"price\":\"9\",\"type\":\"素食\",\"style\":\"火鍋\",\"product_ids\":\"19\",\"product_names\":\"19\",\"material_weight\":\"\",\"nutrition\":\"1\",\"member_only\":\"1\",\"visitor\":\"3\",\"list_order\":\"3\"},{\"id\":\"4\",\"name\":\"4\",\"pic_url\":\"/uploads/repicepro/1567072415.png\",\"pic_alt\":\"A\",\"feature\":\"7\",\"tags\":\"牛肉\",\"price\":\"0\",\"type\":\"中式\",\"style\":\"火鍋\",\"product_ids\":\"1\",\"product_names\":\"1\",\"material_weight\":\"\",\"nutrition\":\"\",\"member_only\":\"0\",\"visitor\":\"12\",\"list_order\":\"4\"},{\"id\":\"5\",\"name\":\"5\",\"pic_url\":\"/uploads/repicepro/1565924165.png\",\"pic_alt\":\"3\",\"feature\":\"6\",\"tags\":\"雞肉,豬肉,根莖類,主菜,火鍋\",\"price\":\"9\",\"type\":\"素食\",\"style\":\"火鍋\",\"product_ids\":\"1\",\"product_names\":\"1\",\"material_weight\":\"\",\"nutrition\":\"1\",\"member_only\":\"1\",\"visitor\":\"3\",\"list_order\":\"5\"},{\"id\":\"6\",\"name\":\"6\",\"pic_url\":\"/uploads/repicepro/1567072415.png\",\"pic_alt\":\"A\",\"feature\":\"7\",\"tags\":\"飯食\",\"price\":\"0\",\"type\":\"中式\",\"style\":\"主菜\",\"product_ids\":\"1\",\"product_names\":\"1\",\"material_weight\":\"\",\"nutrition\":\"\",\"member_only\":\"0\",\"visitor\":\"1\",\"list_order\":\"6\"},{\"id\":\"7\",\"name\":\"7\",\"pic_url\":\"/uploads/repicepro/1567072415.png\",\"pic_alt\":\"A\",\"feature\":\"7\",\"tags\":\"前菜\",\"price\":\"0\",\"type\":\"中式\",\"style\":\"主菜\",\"product_ids\":\"1\",\"product_names\":\"1\",\"material_weight\":\"\",\"nutrition\":\"\",\"member_only\":\"0\",\"visitor\":\"5\",\"list_order\":\"7\"},{\"id\":\"8\",\"name\":\"8\",\"pic_url\":\"/uploads/repicepro/1567072415.png\",\"pic_alt\":\"A\",\"feature\":\"7\",\"tags\":\"前菜\",\"price\":\"0\",\"type\":\"中式\",\"style\":\"主菜\",\"product_ids\":\"1\",\"product_names\":\"1\",\"material_weight\":\"\",\"nutrition\":\"\",\"member_only\":\"0\",\"visitor\":\"3\",\"list_order\":\"8\"},{\"id\":\"9\",\"name\":\"9\",\"pic_url\":\"/uploads/repicepro/1567072415.png\",\"pic_alt\":\"A\",\"feature\":\"7\",\"tags\":\"前菜\",\"price\":\"0\",\"type\":\"中式\",\"style\":\"主菜\",\"product_ids\":\"1\",\"product_names\":\"1\",\"material_weight\":\"\",\"nutrition\":\"\",\"member_only\":\"0\",\"visitor\":\"4\",\"list_order\":\"9\"},{\"id\":\"10\",\"name\":\"10\",\"pic_url\":\"/uploads/repicepro/1567072415.png\",\"pic_alt\":\"A\",\"feature\":\"7\",\"tags\":\"前菜\",\"price\":\"0\",\"type\":\"中式\",\"style\":\"主菜\",\"product_ids\":\"1\",\"product_names\":\"1\",\"material_weight\":\"\",\"nutrition\":\"\",\"member_only\":\"0\",\"visitor\":\"7\",\"list_order\":\"10\"},{\"id\":\"11\",\"name\":\"11\",\"pic_url\":\"/uploads/repicepro/1567072415.png\",\"pic_alt\":\"A\",\"feature\":\"7\",\"tags\":\"前菜\",\"price\":\"0\",\"type\":\"中式\",\"style\":\"主菜\",\"product_ids\":\"1\",\"product_names\":\"1\",\"material_weight\":\"\",\"nutrition\":\"\",\"member_only\":\"0\",\"visitor\":\"4\",\"list_order\":\"11\"}]', '2019-11-19 13:28:02'),
(9, 0, '::1', 65, 'GET', 'product', '', '[]', 'null', '0', '執行成功', '[{\"id\":\"1\",\"brand_id\":\"5\",\"brand_name\":\"1\",\"brand_pic_url\":\"/uploads/brand/1567073352.png\",\"name\":\"1\",\"pic_urls\":\"/uploads/product/1565848035.png,/uploads/product/1565848034.png,/uploads/product/1565848036.png,/uploads/product/1565848037.png,/uploads/product/1565848038.png,/uploads/product/1565848039.png\",\"pic_alts\":\"4,3,,,,\",\"tag\":\"標籤1\",\"content\":\"內容內容內容內容內容內容內容內容內容內容\",\"tips\":\"內容內容內容內容內容內容內容內容內容內容\",\"information\":\"<ul class=\"product-info-box p-a0\">\r\n	<li class=\"d-flex \"><span class=\"title\">原料</span><span class=\"text\">調味劑(L-麩酸鈉、5`-次黃嘌呤核苷磷酸二鈉、琥珀酸二鈉)、食鹽、乳糖、砂糖、乾燻鰹魚、鰹魚抽出物、酵母抽出物、D-木糖、麥芽糖、葡萄糖、糊精</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">淨重</span><span class=\"text\">1公斤</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">原產地</span><span class=\"text\">日本國神奈川縣</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品包裝</span><span class=\"text\">1kgx12袋/箱</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品條碼</span><span class=\"text\">4901001375431</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">外箱尺寸</span><span class=\"text\">522x262x209mm</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存期限</span><span class=\"text\">24個月(常溫未開封狀態下) </span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">過敏原</span><span class=\"text\">2本產品含有牛奶及其製品</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存方法</span><span class=\"text\">開封後，為了避免受潮，請密封存放於乾燥通風處，以確認產品的最佳風味及品質。 </span></li>\r\n</ul>\r\n\",\"mark\":\"<ul class=\"info-box p-a0\">\r\n	<li class=\"d-flex\"><span class=\"title\">每一份量</span><span class=\"text\">1公克</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">本包裝含</span><span class=\"text\">1000份</span></li>\r\n</ul>\r\n\r\n<ul class=\"product-info-box p-a0\">\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\"></span><span class=\"text-e\">每份</span><span class=\"text-h\">每100公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">熱量</span><span class=\"text-e\">2.2大卡</span><span class=\"text-h\">225大卡</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">蛋白質</span><span class=\"text-e\">0.2公克</span><span class=\"text-h\">24.1公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">脂肪</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title p-l10\">飽和脂肪</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title p-l10\">反式脂肪</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">碳水化合物</span><span class=\"text-e\">0.3公克</span><span class=\"text-h\">31.6公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">糖</span><span class=\"text-e\">0.2公克</span><span class=\"text-h\">17.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">鈉</span><span class=\"text-e\">175毫克</span><span class=\"text-h\">17500毫克</span></li>\r\n</ul>\r\n\",\"list_order\":\"1\"},{\"id\":\"2\",\"brand_id\":\"1\",\"brand_name\":\"烹大師\",\"brand_pic_url\":\"/uploads/brand/1567073322.png\",\"name\":\"2\",\"pic_urls\":\"/uploads/product/1567073370.png\",\"pic_alts\":\"\",\"tag\":\"\",\"content\":\"商品內容\",\"tips\":\"美味秘訣\",\"information\":\"<ul class=\"p-a0\">\r\n	<li class=\"d-flex \"><span class=\"title\">原料</span> <span class=\"text\">調味劑(L-麩酸鈉、5&#39;-次黃嘌呤核苷磷酸二鈉、琥珀酸二鈉)、食鹽、乳糖、砂糖、乾燻鰹魚、鰹魚抽出物、酵母抽出物、D-木糖、麥芽糖、葡萄糖、糊精</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">淨重</span> <span class=\"text\">1公斤</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">原產地</span> <span class=\"text\">日本國神奈川縣</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品包裝</span> <span class=\"text\">1kgx12袋/箱</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品條碼</span> <span class=\"text\">4901001375431</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">外箱尺寸</span> <span class=\"text\">522x262x209mm</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存期限</span> <span class=\"text\">24個月(常溫未開封狀態下) </span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">過敏原</span> <span class=\"text\">2本產品含有牛奶及其製品</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存方法</span> <span class=\"text\">開封後，為了避免受潮，請密封存放於乾燥通風處，以確認產品的最佳風味及品質。 </span></li>\r\n</ul>\r\n\",\"mark\":\"<ul class=\"p-a0\">\r\n	<li class=\"d-flex\"><span class=\"title\">每一份量</span> <span class=\"text\">1公克</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">本包裝含</span> <span class=\"text\">1000份</span></li>\r\n</ul>\r\n\r\n<ul class=\"p-a0\">\r\n	<li class=\"d-flex justify-content-between\"><span class=\"text-e\">每份</span> <span class=\"text-h\">每100公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">熱量</span> <span class=\"text-e\">2.2大卡</span> <span class=\"text-h\">225大卡</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">蛋白質</span> <span class=\"text-e\">0.2公克</span> <span class=\"text-h\">24.1公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">脂肪</span> <span class=\"text-e\">0.0公克</span> <span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title p-l10\">飽和脂肪</span> <span class=\"text-e\">0.0公克</span> <span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title p-l10\">反式脂肪</span> <span class=\"text-e\">0.0公克</span> <span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">碳水化合物</span> <span class=\"text-e\">0.3公克</span> <span class=\"text-h\">31.6公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">糖</span> <span class=\"text-e\">0.2公克</span> <span class=\"text-h\">17.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">鈉</span> <span class=\"text-e\">175毫克</span> <span class=\"text-h\">17500毫克</span></li>\r\n</ul>\r\n\",\"list_order\":\"2\"},{\"id\":\"3\",\"brand_id\":\"1\",\"brand_name\":\"烹大師\",\"brand_pic_url\":\"/uploads/brand/1567073322.png\",\"name\":\"3\",\"pic_urls\":\"/uploads/product/1558350652.png\",\"pic_alts\":\"1\",\"tag\":\"\",\"content\":\"<table class=\"info-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>原料</th>\r\n			<td>調味劑(L-麩酸鈉、5&#39;-次黃嘌呤核苷磷酸二鈉、琥珀酸二鈉)、食鹽、乳糖、砂糖、乾燻鰹魚、鰹魚抽出物、酵母抽出物、D-木糖、麥芽糖、葡萄糖、糊精</td>\r\n		</tr>\r\n		<tr>\r\n			<th>容量</th>\r\n			<td>320公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>使用方法</th>\r\n			<td>7公克可調理成1000c.c的高湯&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"tips\":\"\",\"information\":\"\",\"mark\":\"<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">每一份量<span>100公克</span></th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\">每份</th>\r\n			<th>每100公克</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量</th>\r\n			<td>2.2 大卡</td>\r\n			<td>225 打卡</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蛋白質</th>\r\n			<td>0.2 公克</td>\r\n			<td>24.1 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>&nbsp; &nbsp; 飽和脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>&nbsp; &nbsp; 反式脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>碳水化合物</th>\r\n			<td>&nbsp; 0.3 公克</td>\r\n			<td>31.6 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>&nbsp; &nbsp; 糖</th>\r\n			<td>0.2 公克</td>\r\n			<td>17.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈉</th>\r\n			<td>175 毫克</td>\r\n			<td>17500 毫克</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"list_order\":\"3\"},{\"id\":\"4\",\"brand_id\":\"1\",\"brand_name\":\"烹大師\",\"brand_pic_url\":\"/uploads/brand/1567073322.png\",\"name\":\"4\",\"pic_urls\":\"/uploads/product/1558350701.png\",\"pic_alts\":\"\",\"tag\":\"\",\"content\":\"<table class=\"info-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>原料</th>\r\n			<td>調味劑(L-麩酸鈉、5&#39;-次黃嘌呤核苷磷酸二鈉、琥珀酸二鈉)、食鹽、乳糖、砂糖、乾燻鰹魚、鰹魚抽出物、酵母抽出物、D-木糖、麥芽糖、葡萄糖、糊精</td>\r\n		</tr>\r\n		<tr>\r\n			<th>容量</th>\r\n			<td>450公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>使用方法</th>\r\n			<td>7公克可調理成1000c.c的高湯&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"tips\":\"\",\"information\":\"\",\"mark\":\"<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">每一份量<span>100公克</span></th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\">每份</th>\r\n			<th>每100公克</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量</th>\r\n			<td>2.2 大卡</td>\r\n			<td>225 打卡</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蛋白質</th>\r\n			<td>0.2 公克</td>\r\n			<td>24.1 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>&nbsp; &nbsp; 飽和脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>&nbsp; &nbsp; 反式脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>碳水化合物</th>\r\n			<td>&nbsp; 0.3 公克</td>\r\n			<td>31.6 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>&nbsp; &nbsp; 糖</th>\r\n			<td>0.2 公克</td>\r\n			<td>17.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈉</th>\r\n			<td>175 毫克</td>\r\n			<td>17500 毫克</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"list_order\":\"4\"},{\"id\":\"5\",\"brand_id\":\"1\",\"brand_name\":\"烹大師\",\"brand_pic_url\":\"/uploads/brand/1567073322.png\",\"name\":\"5\",\"pic_urls\":\"/uploads/product/1558350747.png\",\"pic_alts\":\"\",\"tag\":\"\",\"content\":\"<table class=\"info-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>原料</th>\r\n			<td>調味劑(L-麩酸鈉、5&#39;-次黃嘌呤核苷磷酸二鈉、琥珀酸二鈉)、食鹽、乳糖、砂糖、乾燻鰹魚、鰹魚抽出物、酵母抽出物、D-木糖、麥芽糖、葡萄糖、糊精</td>\r\n		</tr>\r\n		<tr>\r\n			<th>容量</th>\r\n			<td>65公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>使用方法</th>\r\n			<td>7公克可調理成1000c.c的高湯&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"tips\":\"\",\"information\":\"\",\"mark\":\"<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">每一份量<span>100公克</span></th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\">每份</th>\r\n			<th>每100公克</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量</th>\r\n			<td>2.2 大卡</td>\r\n			<td>225 打卡</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蛋白質</th>\r\n			<td>0.2 公克</td>\r\n			<td>24.1 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>&nbsp; &nbsp; 飽和脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>&nbsp; &nbsp; 反式脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>碳水化合物</th>\r\n			<td>&nbsp; 0.3 公克</td>\r\n			<td>31.6 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>&nbsp; &nbsp; 糖</th>\r\n			<td>0.2 公克</td>\r\n			<td>17.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈉</th>\r\n			<td>175 毫克</td>\r\n			<td>17500 毫克</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"list_order\":\"5\"},{\"id\":\"6\",\"brand_id\":\"2\",\"brand_name\":\"VONO\",\"brand_pic_url\":\"/uploads/brand/1567073329.png\",\"name\":\"6\",\"pic_urls\":\"/uploads/product/1558418208.jpg\",\"pic_alts\":\"\",\"tag\":\"\",\"content\":\"<table class=\"info-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>原料</th>\r\n			<td>甜玉米粉、砂糖、馬鈴薯澱粉、麥芽糊精、脫脂牛乳、棕櫚油、乳糖、玉米糖漿、食鹽、玉米粒、玉米油、棕櫚仁油、調味劑(L-麩酸鈉、5&#39;-次黃嘌呤核苷磷酸二鈉)、酸酪蛋白、關華豆膠、洋蔥、糊精、酵母抽出物、大豆卵磷脂、白胡椒、香料、麵粉、葡萄糖、油菜籽油</td>\r\n		</tr>\r\n		<tr>\r\n			<th>容量</th>\r\n			<td>57.6公克(共3袋)</td>\r\n		</tr>\r\n		<tr>\r\n			<th>使用方法</th>\r\n			<td>將VONO&reg;倒入杯中，注入150ml的熱水(約一般馬克杯6分滿)攪拌15秒即可。</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"tips\":\"\",\"information\":\"\",\"mark\":\"<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">每一份量<span>19.2公克</span></th>\r\n		</tr>\r\n		<tr>\r\n			<th colspan=\"3\">本包裝含3份</th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\">每份</th>\r\n			<th>每100公克</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th style=\"text-align: left;\">熱量</th>\r\n			<td>80大卡</td>\r\n			<td>416大卡</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">蛋白質</th>\r\n			<td>1.2公克</td>\r\n			<td>6.1公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">脂肪</th>\r\n			<td>2.2公克</td>\r\n			<td>11.6公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>飽和脂肪</th>\r\n			<td>1.5公克</td>\r\n			<td>7.8公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>反式脂肪</th>\r\n			<td>0公克</td>\r\n			<td>0公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">碳水化合物</th>\r\n			<td>13.8公克</td>\r\n			<td>71.9公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>糖</th>\r\n			<td>6.1公克</td>\r\n			<td>31.9公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">鈉</th>\r\n			<td>411毫克</td>\r\n			<td>2140毫克</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"list_order\":\"6\"},{\"id\":\"7\",\"brand_id\":\"2\",\"brand_name\":\"VONO\",\"brand_pic_url\":\"/uploads/brand/1567073329.png\",\"name\":\"7\",\"pic_urls\":\"/uploads/product/1558420642.jpg\",\"pic_alts\":\"\",\"tag\":\"\",\"content\":\"<table class=\"info-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>原料</th>\r\n			<td>馬鈴薯澱粉、麥芽糊精、砂糖、棕櫚油、食鹽、全脂牛乳、玉米糖漿、脫脂牛乳、馬鈴薯粉、洋蔥粉、調味劑(L-麩酸鈉、5&lsquo;-次黃嘌呤核苷磷酸二鈉、胺基乙酸)、卡門貝爾起司、洋蔥、棕櫚仁油、還原水飴、酵母抽出物、糊精、玉米油、關華豆膠、豬肉、酸酪蛋白、醬油、白胡椒、鰹魚抽出物、荷蘭芹、大豆卵磷脂、薑黃、玉米芯抽出物、芹菜籽、玉米澱粉、月桂、陳皮、混合生育醇、麵粉、葡萄糖、油菜籽油、迷迭香抽出物</td>\r\n		</tr>\r\n		<tr>\r\n			<th>容量</th>\r\n			<td>46.5公克(共3袋)</td>\r\n		</tr>\r\n		<tr>\r\n			<th>使用方法</th>\r\n			<td>將VONO&reg;倒入杯中，注入150ml的熱水(約一般馬克杯6分滿)攪拌15秒即可。</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"tips\":\"\",\"information\":\"\",\"mark\":\"<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">每一份量<span>15.5公克</span></th>\r\n		</tr>\r\n		<tr>\r\n			<th colspan=\"3\">本包裝含3份</th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\">每份</th>\r\n			<th>每100公克</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th style=\"text-align: left;\">熱量</th>\r\n			<td>64大卡</td>\r\n			<td>413大卡</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">蛋白質</th>\r\n			<td>0.9公克</td>\r\n			<td>5.5公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">脂肪</th>\r\n			<td>1.8公克</td>\r\n			<td>11.5公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>飽和脂肪</th>\r\n			<td>1.3公克</td>\r\n			<td>8.4公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>反式脂肪</th>\r\n			<td>0公克</td>\r\n			<td>0公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">碳水化合物</th>\r\n			<td>11.1公克</td>\r\n			<td>71.8公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>糖</th>\r\n			<td>2.8公克</td>\r\n			<td>17.9公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">鈉</th>\r\n			<td>409毫克</td>\r\n			<td>2640毫克</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"list_order\":\"7\"},{\"id\":\"8\",\"brand_id\":\"2\",\"brand_name\":\"VONO\",\"brand_pic_url\":\"/uploads/brand/1567073329.png\",\"name\":\"8\",\"pic_urls\":\"/uploads/product/1558423834.jpg\",\"pic_alts\":\"\",\"tag\":\"\",\"content\":\"<table class=\"info-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>原料</th>\r\n			<td>馬鈴薯澱粉、南瓜粉、砂糖、脫脂牛乳、棕櫚油、玉米糖漿、食鹽、麥芽糊精、馬鈴薯粉、棕櫚仁油、玉米油、糊精、調味劑(L-麩酸鈉、5&#39;-次黃嘌呤核苷磷酸二鈉)、酵母抽出物、酸酪蛋白、洋蔥抽出物、椰子油、全脂牛乳、葡萄糖糖漿、米糠油、洋蔥、荷蘭芹、大豆卵磷脂、乳糖、白胡椒、豆蔻、月桂、肉桂、陳皮、葡萄糖</td>\r\n		</tr>\r\n		<tr>\r\n			<th>容量</th>\r\n			<td>52.2公克(共3袋)</td>\r\n		</tr>\r\n		<tr>\r\n			<th>使用方法</th>\r\n			<td>將VONO&reg;倒入杯中，注入150ml的熱水(約一般馬克杯6分滿)攪拌15秒即可。</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"tips\":\"\",\"information\":\"\",\"mark\":\"<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">每一份量<span>17.4公克</span></th>\r\n		</tr>\r\n		<tr>\r\n			<th colspan=\"3\">本包裝含3份</th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\">每份</th>\r\n			<th>每100公克</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th style=\"text-align: left;\">熱量</th>\r\n			<td>75大卡</td>\r\n			<td>429大卡</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">蛋白質</th>\r\n			<td>1.1公克</td>\r\n			<td>6.1公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">脂肪</th>\r\n			<td>2.5公克</td>\r\n			<td>14.5公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>飽和脂肪</th>\r\n			<td>2.0公克</td>\r\n			<td>11.5公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>反式脂肪</th>\r\n			<td>0公克</td>\r\n			<td>0公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">碳水化合物</th>\r\n			<td>11.9公克</td>\r\n			<td>68.6公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>糖</th>\r\n			<td>5.0公克</td>\r\n			<td>28.8公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">鈉</th>\r\n			<td>388毫克</td>\r\n			<td>2230毫克</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"list_order\":\"8\"},{\"id\":\"9\",\"brand_id\":\"2\",\"brand_name\":\"VONO\",\"brand_pic_url\":\"/uploads/brand/1567073329.png\",\"name\":\"9\",\"pic_urls\":\"/uploads/product/1558424084.jpg\",\"pic_alts\":\"\",\"tag\":\"\",\"content\":\"<table class=\"info-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>原料</th>\r\n			<td>馬鈴薯澱粉、麥芽糊精、乳糖、棕櫚油、卡門貝爾起司、全脂牛乳、砂糖、馬鈴薯粉、玉米糖漿、食鹽、戈爾根佐拉起司、棕櫚仁油、調味劑(L-麩酸鈉、5&#39;-次黃嘌呤核苷磷酸二鈉、胺基乙酸)、切達起司、椰子油、洋蔥粉、洋蔥、玉米油、關華豆膠、葡萄糖糖漿、脫脂牛乳、酵母抽出物、糊精、酸酪蛋白、鰹魚抽出物、大豆卵磷脂、荷蘭芹、玉米芯抽出物、白胡椒、薑黃、芹菜籽、玉米澱粉、月桂、陳皮</td>\r\n		</tr>\r\n		<tr>\r\n			<th>容量</th>\r\n			<td>54公克(共3袋)</td>\r\n		</tr>\r\n		<tr>\r\n			<th>使用方法</th>\r\n			<td>將VONO&reg;倒入杯中，注入150ml的熱水(約一般馬克杯6分滿)攪拌15秒即可。</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"tips\":\"\",\"information\":\"\",\"mark\":\"<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">每一份量<span>18.0公克</span></th>\r\n		</tr>\r\n		<tr>\r\n			<th colspan=\"3\">本包裝含3份</th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\">每份</th>\r\n			<th>每100公克</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th style=\"text-align: left;\">熱量</th>\r\n			<td>84大卡</td>\r\n			<td>465大卡</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">蛋白質</th>\r\n			<td>1.4公克</td>\r\n			<td>8公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">脂肪</th>\r\n			<td>3.9公克</td>\r\n			<td>21.4公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>飽和脂肪</th>\r\n			<td>2.9公克</td>\r\n			<td>16.2公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>反式脂肪</th>\r\n			<td>0公克</td>\r\n			<td>0公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">碳水化合物</th>\r\n			<td>10.8公克</td>\r\n			<td>60.0公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>糖</th>\r\n			<td>3.6公克</td>\r\n			<td>19.8公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">鈉</th>\r\n			<td>418毫克</td>\r\n			<td>2320毫克</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"list_order\":\"9\"},{\"id\":\"10\",\"brand_id\":\"2\",\"brand_name\":\"VONO\",\"brand_pic_url\":\"/uploads/brand/1567073329.png\",\"name\":\"10\",\"pic_urls\":\"/uploads/product/1558520127.jpg\",\"pic_alts\":\"\",\"tag\":\"\",\"content\":\"<table class=\"info-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>原料</th>\r\n			<td>麩醯胺酸，L-精胺酸，L-白胺酸，L-異白胺酸，L-&alpha;胺基異戊酸，調味劑(檸檬酸、DL-蘋果酸、檸檬酸鈉)，L-羥丁胺酸，鹽酸L-二胺基己酸，L-蛋胺酸，鹽酸L-組織胺酸，L-脯胺酸，脂肪酸蔗糖酯，維生素C，蛋殼粉，麥芽糖漿，阿拉伯膠，甜味劑(阿斯巴甜、醋磺內酯鉀)，L-苯丙胺酸，L-色胺酸，糊精，辛烯基丁二酸鈉澱粉，香料，食用油脂(菜籽油、椰子油、葵花籽油、棕櫚油)，菸鹼酸，檸檬酸亞鐵鈉，丙二醇，維生素E，乳糖，本多酸鈣，脫脂乳粉，維生素B6，維生素B1，發酵乳粉末，維生素B2，纖維素，維生素A，水解澱粉，&alpha;、&beta;、&gamma;-環狀糊精，維生素B12，維生素D3，砂糖<br />\r\n			本產品含牛奶、蛋及其製品 &nbsp;警語:內含苯丙胺酸</td>\r\n		</tr>\r\n		<tr>\r\n			<th>最佳補給時機</th>\r\n			<td>* 運動前 30分鐘補充，維持運動最佳表現<br />\r\n			* 長時間運動中補充，可幫助保持活力<br />\r\n			* 運動後 30分鐘內補充，幫助身體回復</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"tips\":\"\",\"information\":\"\",\"mark\":\"<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">每一份量<span>4.5公克</span></th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\">每份</th>\r\n			<th>每100公克</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th style=\"text-align: left;\">熱量</th>\r\n			<td>17大卡</td>\r\n			<td>385大卡</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">蛋白質</th>\r\n			<td>3.8公克</td>\r\n			<td>84.5公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">脂肪</th>\r\n			<td>0.0公克</td>\r\n			<td>0.0公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>飽和脂肪</th>\r\n			<td>0.0公克</td>\r\n			<td>0.0公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>反式脂肪</th>\r\n			<td>0.0公克</td>\r\n			<td>0.0公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">碳水化合物</th>\r\n			<td>0.5公克</td>\r\n			<td>11.7公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>糖</th>\r\n			<td>0.0公克</td>\r\n			<td>0.0公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">鈉</th>\r\n			<td>1毫克</td>\r\n			<td>18毫克</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n&nbsp;\r\n\r\n<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\" style=\"text-align: center;\">胺基酸成分</th>\r\n			<th><span style=\"font-size:13px;\">Amino acids 3,600mg</span></th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th>BCAA</th>\r\n			<td>白胺酸Leucine<br />\r\n			異白胺酸Isoleucine<br />\r\n			纈胺酸Valine</td>\r\n			<td>540mg<br />\r\n			430mg<br />\r\n			360mg</td>\r\n		</tr>\r\n		<tr>\r\n			<th>&nbsp;</th>\r\n			<td>麩醯胺酸Glutamine</td>\r\n			<td>650mg</td>\r\n		</tr>\r\n		<tr>\r\n			<th>&nbsp;</th>\r\n			<td>精胺酸Arginine</td>\r\n			<td>610mg</td>\r\n		</tr>\r\n		<tr>\r\n			<th>&nbsp;</th>\r\n			<td>其他多種胺基酸Other AAs</td>\r\n			<td>1,010mg</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n&nbsp;\r\n\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td align=\"center\" bgcolor=\"#cea71b\" colspan=\"3\"><span style=\"color:#2c3e50;\">胺基酸成分</span></td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\"right\" bgcolor=\"#fcf6e0\" colspan=\"3\"><span style=\"color:#2c3e50;\">胺基酸Amino acids&nbsp;&nbsp;3,600mg</span></td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\"left\" bgcolor=\"#CEA71B\" rowspan=\"3\"><span style=\"color:#2c3e50;\">BCAA</span></td>\r\n			<td align=\"right\" bgcolor=\"#f9ecc0\"><span style=\"color:#2c3e50;\">白胺酸Leucine</span></td>\r\n			<td align=\"right\" bgcolor=\"#f9ecc0\"><span style=\"color:#2c3e50;\">540mg</span></td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\"right\" bgcolor=\"#fcf6e0\"><span style=\"color:#2c3e50;\">異白胺酸Isoleucine</span></td>\r\n			<td align=\"right\" bgcolor=\"#fcf6e0\"><span style=\"color:#2c3e50;\">430mg</span></td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\"right\" bgcolor=\"#f9ecc0\"><span style=\"color:#2c3e50;\">纈胺酸Valine</span></td>\r\n			<td align=\"right\" bgcolor=\"#f9ecc0\"><span style=\"color:#2c3e50;\">360mg</span></td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\"left\" bgcolor=\"#E7C247\" rowspan=\"3\">&nbsp;</td>\r\n			<td align=\"right\" bgcolor=\"#fcf6e0\"><span style=\"color:#2c3e50;\">麩醯胺酸Glutamine</span></td>\r\n			<td align=\"right\" bgcolor=\"#fcf6e0\"><span style=\"color:#2c3e50;\">650mg</span></td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\"right\" bgcolor=\"#F9ECC0\"><span style=\"color:#2c3e50;\">精胺酸Arginine</span></td>\r\n			<td align=\"right\" bgcolor=\"#F9ECC0\"><span style=\"color:#2c3e50;\">610mg</span></td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\"right\" bgcolor=\"#FCF6E0\"><span style=\"color:#2c3e50;\">其他多種胺基酸Other AAs</span></td>\r\n			<td align=\"right\" bgcolor=\"#FCF6E0\"><span style=\"color:#2c3e50;\">1,010mg</span></td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"list_order\":\"10\"},{\"id\":\"11\",\"brand_id\":\"2\",\"brand_name\":\"VONO\",\"brand_pic_url\":\"/uploads/brand/1567073329.png\",\"name\":\"11\",\"pic_urls\":\"/uploads/product/1558426836.jpg\",\"pic_alts\":\"\",\"tag\":\"\",\"content\":\"<table class=\"info-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>原料</th>\r\n			<td>L-白胺酸，鹽酸L-二胺基己酸，L-&alpha;胺基異戊酸，L-異白胺酸，L-羥丁胺酸，L-苯丙胺酸，甜味劑(麥芽糖醇、阿斯巴甜、醋磺內酯鉀)，脂肪酸蔗糖酯，檸檬酸，L-蛋胺酸，香料，糊精，鹽酸L-組織胺酸，L-色胺酸，酶解大豆卵磷脂，貝殼鈣，菜籽油，微結晶狀&alpha;-纖維素，脂肪酸甘油酯，維生素B2 &nbsp;&nbsp;<br />\r\n			警語:內含苯丙胺酸</td>\r\n		</tr>\r\n		<tr>\r\n			<th>最佳補給時機</th>\r\n			<td>* 比賽前一天睡前 30分鐘補充，調整身體狀態<br />\r\n			* 比賽後 30分鐘內補充，提供身體關鍵營養<br />\r\n			* 就寢前 30分鐘補充，幫助身體持續回復</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"tips\":\"\",\"information\":\"\",\"mark\":\"<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">每一份量<span>4.7公克</span></th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\">每份</th>\r\n			<th>每100公克</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th style=\"text-align: left;\">熱量</th>\r\n			<td>18大卡</td>\r\n			<td>389大卡</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">蛋白質</th>\r\n			<td>4.1公克</td>\r\n			<td>86.7公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">脂肪</th>\r\n			<td>0.0公克</td>\r\n			<td>0.0公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>飽和脂肪</th>\r\n			<td>0.0公克</td>\r\n			<td>0.0公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>反式脂肪</th>\r\n			<td>0.0公克</td>\r\n			<td>0.0公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">碳水化合物</th>\r\n			<td>0.5公克</td>\r\n			<td>10.5公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>糖</th>\r\n			<td>0.0公克</td>\r\n			<td>0.0公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">鈉</th>\r\n			<td>1毫克</td>\r\n			<td>13毫克</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<br />\r\n<br />\r\n&nbsp;\r\n<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">胺基酸成分</th>\r\n		</tr>\r\n		<tr>\r\n			<th colspan=\"3\">必需胺基酸Essential Amino acids 4,000mg</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th>BCAA</th>\r\n			<td>白胺酸Leucine</td>\r\n			<td>1,600mg</td>\r\n		</tr>\r\n		<tr>\r\n			<th>BCAA</th>\r\n			<td>異白胺酸Isoleucine</td>\r\n			<td>430mg</td>\r\n		</tr>\r\n		<tr>\r\n			<th>BCAA</th>\r\n			<td>纈胺酸Valine</td>\r\n			<td>440mg</td>\r\n		</tr>\r\n		<tr>\r\n			<th>&nbsp;</th>\r\n			<td>其他多種胺基酸Other AAs</td>\r\n			<td>1,540mg</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"list_order\":\"11\"},{\"id\":\"12\",\"brand_id\":\"2\",\"brand_name\":\"VONO\",\"brand_pic_url\":\"/uploads/brand/1567073329.png\",\"name\":\"12\",\"pic_urls\":\"/uploads/product/1558515763.png\",\"pic_alts\":\"\",\"tag\":\"\",\"content\":\"<table class=\"info-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>原料</th>\r\n			<td>水，糊精，DL-胺基丙酸，檸檬酸，L-脯胺酸，洋菜，香料，檸檬酸鈉，刺槐豆膠，塔拉膠，醋磺內酯鉀(甜味劑)，維生素B2<br />\r\n			本品生產線亦有生產含芒果原料之產品</td>\r\n		</tr>\r\n		<tr>\r\n			<th>最佳補給時機</th>\r\n			<td>*運動或比賽前30分鐘補充，保持體力充沛<br />\r\n			*運動中後段補充，迅速補充能量</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"tips\":\"\",\"information\":\"\",\"mark\":\"<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">每一份量<span>130公克</span></th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\">每份</th>\r\n			<th>每100公克</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th style=\"text-align: left;\">熱量</th>\r\n			<td>174大卡</td>\r\n			<td>134大卡</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">蛋白質</th>\r\n			<td>4.8公克</td>\r\n			<td>3.7公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">脂肪</th>\r\n			<td>0.0公克</td>\r\n			<td>0.0公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>飽和脂肪</th>\r\n			<td>0.0公克</td>\r\n			<td>0.0公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>反式脂肪</th>\r\n			<td>0.0公克</td>\r\n			<td>0.0公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">碳水化合物</th>\r\n			<td>38.9公克</td>\r\n			<td>29.9公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>糖</th>\r\n			<td>2.3公克</td>\r\n			<td>1.8公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">鈉</th>\r\n			<td>14毫克</td>\r\n			<td>11毫克</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<br />\r\n<br />\r\n&nbsp;\r\n<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">胺基酸成分</th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\" style=\"text-align: left;\">胺基酸Amino acids 5,000mg</th>\r\n		</tr>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"2\" style=\"text-align: left;\">丙胺酸Alanine&nbsp;4,500mg</th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\" style=\"text-align: left;\">脯胺酸Proline&nbsp;500mg</th>\r\n		</tr>\r\n	</thead>\r\n</table>\r\n\",\"list_order\":\"12\"},{\"id\":\"13\",\"brand_id\":\"2\",\"brand_name\":\"VONO\",\"brand_pic_url\":\"/uploads/brand/1567073329.png\",\"name\":\"13\",\"pic_urls\":\"/uploads/product/1558516565.png\",\"pic_alts\":\"\",\"tag\":\"\",\"content\":\"<table class=\"info-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>原料</th>\r\n			<td>調味劑(L-麩酸鈉、DL-胺基丙酸、琥珀酸二鈉、5&#39;-次黃嘌呤核苷磷酸二鈉、5&#39;-鳥嘌呤核苷磷酸二鈉)、食鹽、蔗糖、玉米澱粉、干貝粉、酵母抽出物、扇貝抽出物、糊精</td>\r\n		</tr>\r\n		<tr>\r\n			<th>容量</th>\r\n			<td>40公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>使用方法</th>\r\n			<td>5公克可調理成500c.c的高湯</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"tips\":\"\",\"information\":\"\",\"mark\":\"<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">每一份量<span>1公克</span></th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\">每份</th>\r\n			<th>每100公克</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th style=\"text-align: left;\">熱量</th>\r\n			<td>2.3大卡</td>\r\n			<td>232 大卡</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">蛋白質</th>\r\n			<td>0.3 公克</td>\r\n			<td>&nbsp;29.1公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">&nbsp; &nbsp; 飽和脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">&nbsp; &nbsp; 反式脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">碳水化合物</th>\r\n			<td>&nbsp; 0.3 公克</td>\r\n			<td>28.9 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">&nbsp; &nbsp; 糖</th>\r\n			<td>0.1公克</td>\r\n			<td>8.1 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">鈉</th>\r\n			<td>150 毫克</td>\r\n			<td>15000 毫克</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"list_order\":\"13\"},{\"id\":\"14\",\"brand_id\":\"2\",\"brand_name\":\"VONO\",\"brand_pic_url\":\"/uploads/brand/1567073329.png\",\"name\":\"14\",\"pic_urls\":\"/uploads/product/1558516958.png\",\"pic_alts\":\"\",\"tag\":\"\",\"content\":\"<table class=\"info-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>原料</th>\r\n			<td>調味劑(L-麩酸鈉、DL-胺基丙酸、琥珀酸二鈉、5&#39;-次黃嘌呤核苷磷酸二鈉、5&#39;-鳥嘌呤核苷磷酸二鈉)、食鹽、蔗糖、玉米澱粉、干貝粉、酵母抽出物、扇貝抽出物、糊精</td>\r\n		</tr>\r\n		<tr>\r\n			<th>容量</th>\r\n			<td>40公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>使用方法</th>\r\n			<td>5公克可調理成500c.c的高湯</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"tips\":\"\",\"information\":\"\",\"mark\":\"<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">每一份量<span>1公克</span></th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\">每份</th>\r\n			<th>每100公克</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th style=\"text-align: left;\">熱量</th>\r\n			<td>2.3大卡</td>\r\n			<td>232 大卡</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">蛋白質</th>\r\n			<td>0.3 公克</td>\r\n			<td>&nbsp;29.1公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">&nbsp; &nbsp; 飽和脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">&nbsp; &nbsp; 反式脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">碳水化合物</th>\r\n			<td>&nbsp; 0.3 公克</td>\r\n			<td>28.9 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">&nbsp; &nbsp; 糖</th>\r\n			<td>0.1公克</td>\r\n			<td>8.1 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">鈉</th>\r\n			<td>150 毫克</td>\r\n			<td>15000 毫克</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"list_order\":\"14\"},{\"id\":\"15\",\"brand_id\":\"3\",\"brand_name\":\"amino vital\",\"brand_pic_url\":\"/uploads/brand/1567073337.png\",\"name\":\"15\",\"pic_urls\":\"/uploads/product/1558517236.png\",\"pic_alts\":\"\",\"tag\":\"\",\"content\":\"<table class=\"info-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>原料</th>\r\n			<td>調味劑(L-麩酸鈉、氯化鉀、5&#39;-次黃嘌呤核苷磷酸二鈉、5&#39;-鳥嘌呤核苷磷酸二鈉、琥珀酸二鈉)、食鹽、砂糖、D-甘露醇（甜味劑）、昆布粉、糊精、昆布抽出物</td>\r\n		</tr>\r\n		<tr>\r\n			<th>容量</th>\r\n			<td>40公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>使用方法</th>\r\n			<td>4公克可調理成600c.c的高湯</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"tips\":\"\",\"information\":\"\",\"mark\":\"<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">每一份量<span>1公克</span></th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\">每份</th>\r\n			<th>每100公克</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th style=\"text-align: left;\">熱量</th>\r\n			<td>2.2大卡</td>\r\n			<td>217 大卡</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">蛋白質</th>\r\n			<td>0.2公克</td>\r\n			<td>&nbsp;15.3公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">&nbsp; &nbsp; 飽和脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">&nbsp; &nbsp; 反式脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">碳水化合物</th>\r\n			<td>&nbsp; 0.4公克</td>\r\n			<td>38.9 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">&nbsp; &nbsp; 糖</th>\r\n			<td>0.2公克</td>\r\n			<td>21.3公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">鈉</th>\r\n			<td>156毫克</td>\r\n			<td>15600 毫克</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"list_order\":\"15\"},{\"id\":\"16\",\"brand_id\":\"3\",\"brand_name\":\"amino vital\",\"brand_pic_url\":\"/uploads/brand/1567073337.png\",\"name\":\"16\",\"pic_urls\":\"/uploads/product/1558517382.png\",\"pic_alts\":\"\",\"tag\":\"\",\"content\":\"<table class=\"info-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>原料</th>\r\n			<td>調味劑(L-麩酸鈉、氯化鉀、5&#39;-次黃嘌呤核苷磷酸二鈉、5&#39;-鳥嘌呤核苷磷酸二鈉、琥珀酸二鈉)、食鹽、砂糖、D-甘露醇（甜味劑）、昆布粉、糊精、昆布抽出物</td>\r\n		</tr>\r\n		<tr>\r\n			<th>容量</th>\r\n			<td>112公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>使用方法</th>\r\n			<td>4公克可調理成600c.c的高湯</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"tips\":\"\",\"information\":\"\",\"mark\":\"<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">每一份量<span>1公克</span></th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\">每份</th>\r\n			<th>每100公克</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th style=\"text-align: left;\">熱量</th>\r\n			<td>2.2大卡</td>\r\n			<td>217 大卡</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">蛋白質</th>\r\n			<td>0.2公克</td>\r\n			<td>&nbsp;15.3公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">&nbsp; &nbsp; 飽和脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">&nbsp; &nbsp; 反式脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">碳水化合物</th>\r\n			<td>&nbsp; 0.4公克</td>\r\n			<td>38.9 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">&nbsp; &nbsp; 糖</th>\r\n			<td>0.2公克</td>\r\n			<td>21.3公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">鈉</th>\r\n			<td>156毫克</td>\r\n			<td>15600 毫克</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"list_order\":\"16\"},{\"id\":\"17\",\"brand_id\":\"3\",\"brand_name\":\"amino vital\",\"brand_pic_url\":\"/uploads/brand/1567073337.png\",\"name\":\"17\",\"pic_urls\":\"/uploads/product/1558517383.png\",\"pic_alts\":\"\",\"tag\":\"\",\"content\":\"<table class=\"info-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>原料</th>\r\n			<td>調味劑(L-麩酸鈉、氯化鉀、5&#39;-次黃嘌呤核苷磷酸二鈉、5&#39;-鳥嘌呤核苷磷酸二鈉、琥珀酸二鈉)、食鹽、砂糖、D-甘露醇（甜味劑）、昆布粉、糊精、昆布抽出物</td>\r\n		</tr>\r\n		<tr>\r\n			<th>容量</th>\r\n			<td>112公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>使用方法</th>\r\n			<td>4公克可調理成600c.c的高湯</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"tips\":\"\",\"information\":\"\",\"mark\":\"<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">每一份量<span>1公克</span></th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\">每份</th>\r\n			<th>每100公克</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th style=\"text-align: left;\">熱量</th>\r\n			<td>2.2大卡</td>\r\n			<td>217 大卡</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">蛋白質</th>\r\n			<td>0.2公克</td>\r\n			<td>&nbsp;15.3公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">&nbsp; &nbsp; 飽和脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">&nbsp; &nbsp; 反式脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">碳水化合物</th>\r\n			<td>&nbsp; 0.4公克</td>\r\n			<td>38.9 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">&nbsp; &nbsp; 糖</th>\r\n			<td>0.2公克</td>\r\n			<td>21.3公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">鈉</th>\r\n			<td>156毫克</td>\r\n			<td>15600 毫克</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"list_order\":\"17\"},{\"id\":\"18\",\"brand_id\":\"4\",\"brand_name\":\"品牌名稱\",\"brand_pic_url\":\"/uploads/brand/1567073345.png\",\"name\":\"18\",\"pic_urls\":\"/uploads/product/1565847840.png\",\"pic_alts\":\"圖片說明\",\"tag\":\"\",\"content\":\"商品內容\",\"tips\":\"美味秘訣\",\"information\":\"商品資訊\",\"mark\":\"營養標示\",\"list_order\":\"18\"},{\"id\":\"19\",\"brand_id\":\"5\",\"brand_name\":\"1\",\"brand_pic_url\":\"/uploads/brand/1567073352.png\",\"name\":\"19\",\"pic_urls\":\"\",\"pic_alts\":\"\",\"tag\":\"\",\"content\":\"3\",\"tips\":\"4\",\"information\":\"5\",\"mark\":\"6\",\"list_order\":\"19\"}]', '2019-11-19 13:28:02'),
(10, 0, '::1', 49, 'GET', 'ad', '', '[]', 'null', '0', '執行成功', '[{\"id\":\"1\",\"name\":\"Ajinomoto Group\",\"pic_url\":\"/uploads/ad/1567073878.png\",\"pic_alt\":\"\",\"link\":\"https://www.ajinomoto.com/en/numbers/zh/\",\"list_order\":\"1\"},{\"id\":\"2\",\"name\":\"Ajinomoto Group\",\"pic_url\":\"/uploads/ad/1567073887.png\",\"pic_alt\":\"\",\"link\":\"https://www.ajinomoto.com/en/numbers/zh/\",\"list_order\":\"1\"},{\"id\":\"3\",\"name\":\"NEWS\",\"pic_url\":\"/uploads/ad/1567073895.png\",\"pic_alt\":\"\",\"link\":\"https://www.ajinomoto.com/en/aboutus/newsletter/zh/\",\"list_order\":\"2\"},{\"id\":\"4\",\"name\":\"1\",\"pic_url\":\"/uploads/ad/1567073903.png\",\"pic_alt\":\"2\",\"link\":\"3\",\"list_order\":\"4\"}]', '2019-11-19 13:28:02'),
(11, 0, '::1', 0, 'POST', 'user', 'login', '[]', '\"\"', '0', '執行成功', '{\"token\":\"563C1EE2-B262-E32E-2449-D79D406A6B1B\"}', '2019-11-19 13:28:35'),
(12, 1, '::1', 31, 'GET', 'user', 'loginuserdata', '[]', 'null', '0', '執行成功', '[{\"id\":\"1\",\"account\":\"admin@ks\",\"name\":\"admin\",\"email\":\"vic@ks-design.com.tw\",\"phone\":\"\",\"last_login_time\":\"2019-11-19 13:28:35\",\"last_login_ip\":\"::1\",\"status\":\"0\",\"remark\":\"\",\"c_time\":\"2019-03-09 15:55:38\",\"c_user_id\":\"0\",\"c_user_name\":null,\"u_time\":\"2019-11-19 13:28:35\",\"u_user_id\":\"1\",\"u_user_name\":\"admin\",\"roles\":[\"1\"]}]', '2019-11-19 13:28:35'),
(13, 1, '::1', 31, 'GET', 'user', 'loginuserdata', '[]', 'null', '0', '執行成功', '[{\"id\":\"1\",\"account\":\"admin@ks\",\"name\":\"admin\",\"email\":\"vic@ks-design.com.tw\",\"phone\":\"\",\"last_login_time\":\"2019-11-19 13:28:35\",\"last_login_ip\":\"::1\",\"status\":\"0\",\"remark\":\"\",\"c_time\":\"2019-03-09 15:55:38\",\"c_user_id\":\"0\",\"c_user_name\":null,\"u_time\":\"2019-11-19 13:28:35\",\"u_user_id\":\"1\",\"u_user_name\":\"admin\",\"roles\":[\"1\"]}]', '2019-11-19 13:28:35');
INSERT INTO `log` (`id`, `user_id`, `ip`, `program_id`, `method`, `endpoint`, `verb`, `args`, `file`, `resultCode`, `resultMessage`, `resultData`, `c_time`) VALUES
(14, 1, '::1', 35, 'GET', 'user', 'loginusermenutree', '[]', 'null', '0', '執行成功', '[{\"id\":\"1\",\"parent_id\":\"0\",\"name\":\"儀表板\",\"url\":\"dashboard.php\",\"icon\":\"fas fa-tachometer-alt\",\"program_ids\":\"\",\"remark\":\"\",\"submenu\":null},{\"id\":\"9\",\"parent_id\":\"0\",\"name\":\"首頁Banner\",\"url\":\"banner_list.php\",\"icon\":\"fas fa-images\",\"program_ids\":\"45,46,47,48\",\"remark\":\"\",\"submenu\":null},{\"id\":\"10\",\"parent_id\":\"0\",\"name\":\"廣告\",\"url\":\"ad_list.php\",\"icon\":\"fas fa-ad\",\"program_ids\":\"49,50,51,52\",\"remark\":\"\",\"submenu\":null},{\"id\":\"11\",\"parent_id\":\"0\",\"name\":\"餐飲情報\",\"url\":\"\",\"icon\":\"fas fa-newspaper\",\"program_ids\":\"\",\"remark\":\"\",\"submenu\":[{\"id\":\"12\",\"parent_id\":\"11\",\"name\":\"餐飲情報標籤\",\"url\":\"campaign_tag_list.php\",\"icon\":\"fas fa-tags\",\"program_ids\":\"53,54,55,56\",\"remark\":\"\",\"submenu\":null},{\"id\":\"13\",\"parent_id\":\"11\",\"name\":\"餐飲情報\",\"url\":\"campaign_list.php\",\"icon\":\"fas fa-newspaper\",\"program_ids\":\"57,58,59,60\",\"remark\":\"\",\"submenu\":null}]},{\"id\":\"15\",\"parent_id\":\"0\",\"name\":\"商品\",\"url\":\"\",\"icon\":\"fas fa-cubes\",\"program_ids\":\"\",\"remark\":\"\",\"submenu\":[{\"id\":\"16\",\"parent_id\":\"15\",\"name\":\"品牌\",\"url\":\"brand_list.php\",\"icon\":\"fas fa-cube\",\"program_ids\":\"61,62,63,64\",\"remark\":\"\",\"submenu\":null},{\"id\":\"17\",\"parent_id\":\"15\",\"name\":\"商品\",\"url\":\"product_list.php\",\"icon\":\"fas fa-cube\",\"program_ids\":\"65,66,67,68\",\"remark\":\"\",\"submenu\":null}]},{\"id\":\"14\",\"parent_id\":\"0\",\"name\":\"專業食譜\",\"url\":\"recipepro_list.php\",\"icon\":\"fas fa-book-open\",\"program_ids\":\"69,70,71,72,73,74,75\",\"remark\":\"\",\"submenu\":null},{\"id\":\"18\",\"parent_id\":\"0\",\"name\":\"招客秘笈\",\"url\":\"skill_list.php\",\"icon\":\"far fa-lightbulb\",\"program_ids\":\"76,77,78,79\",\"remark\":\"\",\"submenu\":null},{\"id\":\"20\",\"parent_id\":\"0\",\"name\":\"標籤\",\"url\":\"tag_list.php\",\"icon\":\"fa fa-tags\",\"program_ids\":\"\",\"remark\":\"\",\"submenu\":null},{\"id\":\"19\",\"parent_id\":\"0\",\"name\":\"會員\",\"url\":\"member_list.php\",\"icon\":\"fas fa-users\",\"program_ids\":\"80,81,82,83,84,85,86\",\"remark\":\"\",\"submenu\":null},{\"id\":\"2\",\"parent_id\":\"0\",\"name\":\"權限\",\"url\":\"\",\"icon\":\"fas fa-users-cog\",\"program_ids\":\"\",\"remark\":\"\",\"submenu\":[{\"id\":\"3\",\"parent_id\":\"2\",\"name\":\"角色\",\"url\":\"role_list.php\",\"icon\":\"fas fa-users\",\"program_ids\":\"9,10,11,12,13,14,15,16,17,18,19,20,21,22\",\"remark\":\"\",\"submenu\":null},{\"id\":\"4\",\"parent_id\":\"2\",\"name\":\"使用者\",\"url\":\"user_list.php\",\"icon\":\"fas fa-user\",\"program_ids\":\"23,24,25,26,27,28,29,30\",\"remark\":\"\",\"submenu\":null}]},{\"id\":\"5\",\"parent_id\":\"0\",\"name\":\"使用者資料\",\"url\":\"\",\"icon\":\"fas fa-user-cog\",\"program_ids\":\"\",\"remark\":\"\",\"submenu\":[{\"id\":\"6\",\"parent_id\":\"5\",\"name\":\"修改資料\",\"url\":\"loginuser_data_edit.php\",\"icon\":\"fas fa-user-edit\",\"program_ids\":\"31,32\",\"remark\":\"\",\"submenu\":null},{\"id\":\"7\",\"parent_id\":\"5\",\"name\":\"修改密碼\",\"url\":\"loginuser_password_edit.php\",\"icon\":\"fas fa-user-lock\",\"program_ids\":\"33\",\"remark\":\"\",\"submenu\":null}]},{\"id\":\"8\",\"parent_id\":\"0\",\"name\":\"操作記錄\",\"url\":\"log_list.php\",\"icon\":\"fas fa-edit\",\"program_ids\":\"40\",\"remark\":\"\",\"submenu\":null}]', '2019-11-19 13:28:35'),
(15, 1, '::1', 31, 'GET', 'user', 'loginuserdata', '[]', 'null', '0', '執行成功', '[{\"id\":\"1\",\"account\":\"admin@ks\",\"name\":\"admin\",\"email\":\"vic@ks-design.com.tw\",\"phone\":\"\",\"last_login_time\":\"2019-11-19 13:28:35\",\"last_login_ip\":\"::1\",\"status\":\"0\",\"remark\":\"\",\"c_time\":\"2019-03-09 15:55:38\",\"c_user_id\":\"0\",\"c_user_name\":null,\"u_time\":\"2019-11-19 13:28:35\",\"u_user_id\":\"1\",\"u_user_name\":\"admin\",\"roles\":[\"1\"]}]', '2019-11-19 13:28:38'),
(16, 1, '::1', 35, 'GET', 'user', 'loginusermenutree', '[]', 'null', '0', '執行成功', '[{\"id\":\"1\",\"parent_id\":\"0\",\"name\":\"儀表板\",\"url\":\"dashboard.php\",\"icon\":\"fas fa-tachometer-alt\",\"program_ids\":\"\",\"remark\":\"\",\"submenu\":null},{\"id\":\"9\",\"parent_id\":\"0\",\"name\":\"首頁Banner\",\"url\":\"banner_list.php\",\"icon\":\"fas fa-images\",\"program_ids\":\"45,46,47,48\",\"remark\":\"\",\"submenu\":null},{\"id\":\"10\",\"parent_id\":\"0\",\"name\":\"廣告\",\"url\":\"ad_list.php\",\"icon\":\"fas fa-ad\",\"program_ids\":\"49,50,51,52\",\"remark\":\"\",\"submenu\":null},{\"id\":\"11\",\"parent_id\":\"0\",\"name\":\"餐飲情報\",\"url\":\"\",\"icon\":\"fas fa-newspaper\",\"program_ids\":\"\",\"remark\":\"\",\"submenu\":[{\"id\":\"12\",\"parent_id\":\"11\",\"name\":\"餐飲情報標籤\",\"url\":\"campaign_tag_list.php\",\"icon\":\"fas fa-tags\",\"program_ids\":\"53,54,55,56\",\"remark\":\"\",\"submenu\":null},{\"id\":\"13\",\"parent_id\":\"11\",\"name\":\"餐飲情報\",\"url\":\"campaign_list.php\",\"icon\":\"fas fa-newspaper\",\"program_ids\":\"57,58,59,60\",\"remark\":\"\",\"submenu\":null}]},{\"id\":\"15\",\"parent_id\":\"0\",\"name\":\"商品\",\"url\":\"\",\"icon\":\"fas fa-cubes\",\"program_ids\":\"\",\"remark\":\"\",\"submenu\":[{\"id\":\"16\",\"parent_id\":\"15\",\"name\":\"品牌\",\"url\":\"brand_list.php\",\"icon\":\"fas fa-cube\",\"program_ids\":\"61,62,63,64\",\"remark\":\"\",\"submenu\":null},{\"id\":\"17\",\"parent_id\":\"15\",\"name\":\"商品\",\"url\":\"product_list.php\",\"icon\":\"fas fa-cube\",\"program_ids\":\"65,66,67,68\",\"remark\":\"\",\"submenu\":null}]},{\"id\":\"14\",\"parent_id\":\"0\",\"name\":\"專業食譜\",\"url\":\"recipepro_list.php\",\"icon\":\"fas fa-book-open\",\"program_ids\":\"69,70,71,72,73,74,75\",\"remark\":\"\",\"submenu\":null},{\"id\":\"18\",\"parent_id\":\"0\",\"name\":\"招客秘笈\",\"url\":\"skill_list.php\",\"icon\":\"far fa-lightbulb\",\"program_ids\":\"76,77,78,79\",\"remark\":\"\",\"submenu\":null},{\"id\":\"20\",\"parent_id\":\"0\",\"name\":\"標籤\",\"url\":\"tag_list.php\",\"icon\":\"fa fa-tags\",\"program_ids\":\"\",\"remark\":\"\",\"submenu\":null},{\"id\":\"19\",\"parent_id\":\"0\",\"name\":\"會員\",\"url\":\"member_list.php\",\"icon\":\"fas fa-users\",\"program_ids\":\"80,81,82,83,84,85,86\",\"remark\":\"\",\"submenu\":null},{\"id\":\"2\",\"parent_id\":\"0\",\"name\":\"權限\",\"url\":\"\",\"icon\":\"fas fa-users-cog\",\"program_ids\":\"\",\"remark\":\"\",\"submenu\":[{\"id\":\"3\",\"parent_id\":\"2\",\"name\":\"角色\",\"url\":\"role_list.php\",\"icon\":\"fas fa-users\",\"program_ids\":\"9,10,11,12,13,14,15,16,17,18,19,20,21,22\",\"remark\":\"\",\"submenu\":null},{\"id\":\"4\",\"parent_id\":\"2\",\"name\":\"使用者\",\"url\":\"user_list.php\",\"icon\":\"fas fa-user\",\"program_ids\":\"23,24,25,26,27,28,29,30\",\"remark\":\"\",\"submenu\":null}]},{\"id\":\"5\",\"parent_id\":\"0\",\"name\":\"使用者資料\",\"url\":\"\",\"icon\":\"fas fa-user-cog\",\"program_ids\":\"\",\"remark\":\"\",\"submenu\":[{\"id\":\"6\",\"parent_id\":\"5\",\"name\":\"修改資料\",\"url\":\"loginuser_data_edit.php\",\"icon\":\"fas fa-user-edit\",\"program_ids\":\"31,32\",\"remark\":\"\",\"submenu\":null},{\"id\":\"7\",\"parent_id\":\"5\",\"name\":\"修改密碼\",\"url\":\"loginuser_password_edit.php\",\"icon\":\"fas fa-user-lock\",\"program_ids\":\"33\",\"remark\":\"\",\"submenu\":null}]},{\"id\":\"8\",\"parent_id\":\"0\",\"name\":\"操作記錄\",\"url\":\"log_list.php\",\"icon\":\"fas fa-edit\",\"program_ids\":\"40\",\"remark\":\"\",\"submenu\":null}]', '2019-11-19 13:28:38'),
(17, 1, '::1', 31, 'GET', 'user', 'loginuserdata', '[]', 'null', '0', '執行成功', '[{\"id\":\"1\",\"account\":\"admin@ks\",\"name\":\"admin\",\"email\":\"vic@ks-design.com.tw\",\"phone\":\"\",\"last_login_time\":\"2019-11-19 13:28:35\",\"last_login_ip\":\"::1\",\"status\":\"0\",\"remark\":\"\",\"c_time\":\"2019-03-09 15:55:38\",\"c_user_id\":\"0\",\"c_user_name\":null,\"u_time\":\"2019-11-19 13:28:35\",\"u_user_id\":\"1\",\"u_user_name\":\"admin\",\"roles\":[\"1\"]}]', '2019-11-19 13:28:38'),
(18, 1, '::1', 31, 'GET', 'user', 'loginuserdata', '[]', 'null', '0', '執行成功', '[{\"id\":\"1\",\"account\":\"admin@ks\",\"name\":\"admin\",\"email\":\"vic@ks-design.com.tw\",\"phone\":\"\",\"last_login_time\":\"2019-11-19 13:28:35\",\"last_login_ip\":\"::1\",\"status\":\"0\",\"remark\":\"\",\"c_time\":\"2019-03-09 15:55:38\",\"c_user_id\":\"0\",\"c_user_name\":null,\"u_time\":\"2019-11-19 13:28:35\",\"u_user_id\":\"1\",\"u_user_name\":\"admin\",\"roles\":[\"1\"]}]', '2019-11-19 13:28:40'),
(19, 1, '::1', 35, 'GET', 'user', 'loginusermenutree', '[]', 'null', '0', '執行成功', '[{\"id\":\"1\",\"parent_id\":\"0\",\"name\":\"儀表板\",\"url\":\"dashboard.php\",\"icon\":\"fas fa-tachometer-alt\",\"program_ids\":\"\",\"remark\":\"\",\"submenu\":null},{\"id\":\"9\",\"parent_id\":\"0\",\"name\":\"首頁Banner\",\"url\":\"banner_list.php\",\"icon\":\"fas fa-images\",\"program_ids\":\"45,46,47,48\",\"remark\":\"\",\"submenu\":null},{\"id\":\"10\",\"parent_id\":\"0\",\"name\":\"廣告\",\"url\":\"ad_list.php\",\"icon\":\"fas fa-ad\",\"program_ids\":\"49,50,51,52\",\"remark\":\"\",\"submenu\":null},{\"id\":\"11\",\"parent_id\":\"0\",\"name\":\"餐飲情報\",\"url\":\"\",\"icon\":\"fas fa-newspaper\",\"program_ids\":\"\",\"remark\":\"\",\"submenu\":[{\"id\":\"12\",\"parent_id\":\"11\",\"name\":\"餐飲情報標籤\",\"url\":\"campaign_tag_list.php\",\"icon\":\"fas fa-tags\",\"program_ids\":\"53,54,55,56\",\"remark\":\"\",\"submenu\":null},{\"id\":\"13\",\"parent_id\":\"11\",\"name\":\"餐飲情報\",\"url\":\"campaign_list.php\",\"icon\":\"fas fa-newspaper\",\"program_ids\":\"57,58,59,60\",\"remark\":\"\",\"submenu\":null}]},{\"id\":\"15\",\"parent_id\":\"0\",\"name\":\"商品\",\"url\":\"\",\"icon\":\"fas fa-cubes\",\"program_ids\":\"\",\"remark\":\"\",\"submenu\":[{\"id\":\"16\",\"parent_id\":\"15\",\"name\":\"品牌\",\"url\":\"brand_list.php\",\"icon\":\"fas fa-cube\",\"program_ids\":\"61,62,63,64\",\"remark\":\"\",\"submenu\":null},{\"id\":\"17\",\"parent_id\":\"15\",\"name\":\"商品\",\"url\":\"product_list.php\",\"icon\":\"fas fa-cube\",\"program_ids\":\"65,66,67,68\",\"remark\":\"\",\"submenu\":null}]},{\"id\":\"14\",\"parent_id\":\"0\",\"name\":\"專業食譜\",\"url\":\"recipepro_list.php\",\"icon\":\"fas fa-book-open\",\"program_ids\":\"69,70,71,72,73,74,75\",\"remark\":\"\",\"submenu\":null},{\"id\":\"18\",\"parent_id\":\"0\",\"name\":\"招客秘笈\",\"url\":\"skill_list.php\",\"icon\":\"far fa-lightbulb\",\"program_ids\":\"76,77,78,79\",\"remark\":\"\",\"submenu\":null},{\"id\":\"20\",\"parent_id\":\"0\",\"name\":\"標籤\",\"url\":\"tag_list.php\",\"icon\":\"fa fa-tags\",\"program_ids\":\"\",\"remark\":\"\",\"submenu\":null},{\"id\":\"19\",\"parent_id\":\"0\",\"name\":\"會員\",\"url\":\"member_list.php\",\"icon\":\"fas fa-users\",\"program_ids\":\"80,81,82,83,84,85,86\",\"remark\":\"\",\"submenu\":null},{\"id\":\"2\",\"parent_id\":\"0\",\"name\":\"權限\",\"url\":\"\",\"icon\":\"fas fa-users-cog\",\"program_ids\":\"\",\"remark\":\"\",\"submenu\":[{\"id\":\"3\",\"parent_id\":\"2\",\"name\":\"角色\",\"url\":\"role_list.php\",\"icon\":\"fas fa-users\",\"program_ids\":\"9,10,11,12,13,14,15,16,17,18,19,20,21,22\",\"remark\":\"\",\"submenu\":null},{\"id\":\"4\",\"parent_id\":\"2\",\"name\":\"使用者\",\"url\":\"user_list.php\",\"icon\":\"fas fa-user\",\"program_ids\":\"23,24,25,26,27,28,29,30\",\"remark\":\"\",\"submenu\":null}]},{\"id\":\"5\",\"parent_id\":\"0\",\"name\":\"使用者資料\",\"url\":\"\",\"icon\":\"fas fa-user-cog\",\"program_ids\":\"\",\"remark\":\"\",\"submenu\":[{\"id\":\"6\",\"parent_id\":\"5\",\"name\":\"修改資料\",\"url\":\"loginuser_data_edit.php\",\"icon\":\"fas fa-user-edit\",\"program_ids\":\"31,32\",\"remark\":\"\",\"submenu\":null},{\"id\":\"7\",\"parent_id\":\"5\",\"name\":\"修改密碼\",\"url\":\"loginuser_password_edit.php\",\"icon\":\"fas fa-user-lock\",\"program_ids\":\"33\",\"remark\":\"\",\"submenu\":null}]},{\"id\":\"8\",\"parent_id\":\"0\",\"name\":\"操作記錄\",\"url\":\"log_list.php\",\"icon\":\"fas fa-edit\",\"program_ids\":\"40\",\"remark\":\"\",\"submenu\":null}]', '2019-11-19 13:28:40'),
(20, 1, '::1', 31, 'GET', 'user', 'loginuserdata', '[]', 'null', '0', '執行成功', '[{\"id\":\"1\",\"account\":\"admin@ks\",\"name\":\"admin\",\"email\":\"vic@ks-design.com.tw\",\"phone\":\"\",\"last_login_time\":\"2019-11-19 13:28:35\",\"last_login_ip\":\"::1\",\"status\":\"0\",\"remark\":\"\",\"c_time\":\"2019-03-09 15:55:38\",\"c_user_id\":\"0\",\"c_user_name\":null,\"u_time\":\"2019-11-19 13:28:35\",\"u_user_id\":\"1\",\"u_user_name\":\"admin\",\"roles\":[\"1\"]}]', '2019-11-19 13:28:41'),
(21, 0, '::1', 0, 'POST', 'user', 'login', '[]', '\"\"', '0', '執行成功', '{\"token\":\"563C1EE2-B262-E32E-2449-D79D406A6B1B\"}', '2019-11-19 13:29:31'),
(22, 1, '::1', 80, 'GET', 'member', '{id}', '[]', 'null', '0', '執行成功', '[{\"id\":\"1\",\"account\":\"vicwu0717@gmail.com\",\"verification\":\"9EC23092-2491-A1FF-BC1C-E01056DEC119\",\"name\":\"vic\",\"gender\":\"1\",\"birthday\":\"0000-00-00\",\"phone\":\"09188888\",\"restaurant_name\":\"vic\",\"restaurant_zipcode\":\"722\",\"restaurant_city_id\":\"15\",\"restaurant_city_name\":\"台南市\",\"restaurant_area_id\":\"234\",\"restaurant_area_name\":\"佳里區\",\"restaurant_type\":\"火鍋\",\"last_login_time\":\"2019-10-30 08:58:46\",\"last_login_ip\":\"::1\",\"status\":\"0\",\"remark\":\"\",\"c_time\":\"2019-10-17 17:38:39\",\"c_user_id\":\"2\",\"c_user_name\":\"web_server\",\"u_time\":\"2019-10-30 08:58:46\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"},{\"id\":\"2\",\"account\":\"vic@ks-design.com.tw\",\"verification\":\"5A4DB362-C2F9-2811-36FC-1D6B00135103\",\"name\":\"vic\",\"gender\":\"1\",\"birthday\":\"0000-00-00\",\"phone\":\"11111111\",\"restaurant_name\":\"11111111\",\"restaurant_zipcode\":\"900\",\"restaurant_city_id\":\"17\",\"restaurant_city_name\":\"屏東縣\",\"restaurant_area_id\":\"291\",\"restaurant_area_name\":\"屏東市\",\"restaurant_type\":\"火鍋\",\"last_login_time\":\"0000-00-00 00:00:00\",\"last_login_ip\":\"\",\"status\":\"0\",\"remark\":\"\",\"c_time\":\"2019-10-30 09:14:13\",\"c_user_id\":\"2\",\"c_user_name\":\"web_server\",\"u_time\":\"2019-10-30 09:14:33\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"}]', '2019-11-19 13:30:59'),
(23, 0, '::1', 0, 'POST', 'member', 'login', '[]', '\"\"', '6', '帳號或密碼錯誤', 'null', '2019-11-19 13:31:17'),
(24, 0, '::1', 0, 'POST', 'member', 'login', '[]', '\"\"', '0', '執行成功', '{\"token\":\"D8DE0C62-7A40-89E9-9A54-3F8EC8295222\"}', '2019-11-19 13:31:21'),
(25, 0, '::1', 0, 'GET', 'member', 'loginmemberdata', '[]', '\"\"', '0', '執行成功', '[{\"id\":\"1\",\"account\":\"vicwu0717@gmail.com\",\"verification\":\"9EC23092-2491-A1FF-BC1C-E01056DEC119\",\"name\":\"vic\",\"gender\":\"1\",\"birthday\":\"0000-00-00\",\"phone\":\"09188888\",\"restaurant_name\":\"vic\",\"restaurant_zipcode\":\"722\",\"restaurant_city_id\":\"15\",\"restaurant_city_name\":\"台南市\",\"restaurant_area_id\":\"234\",\"restaurant_area_name\":\"佳里區\",\"restaurant_type\":\"火鍋\",\"last_login_time\":\"2019-11-19 13:31:21\",\"last_login_ip\":\"::1\",\"status\":\"0\",\"remark\":\"\",\"c_time\":\"2019-10-17 17:38:39\",\"c_user_id\":\"2\",\"c_user_name\":\"web_server\",\"u_time\":\"2019-11-19 13:31:21\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"}]', '2019-11-19 13:31:21'),
(26, 0, '::1', 45, 'GET', 'banner', '', '[]', 'null', '0', '執行成功', '[{\"id\":\"1\",\"name\":\"1\",\"pic_url\":\"/uploads/banner/1567068227.png\",\"pic_alt\":\"1\",\"link\":\"\",\"blank\":\"1\",\"list_order\":\"0\"}]', '2019-11-19 13:31:22'),
(27, 0, '::1', 57, 'GET', 'campaign', '', '[]', 'null', '0', '執行成功', '[{\"id\":\"5\",\"tag_ids\":\"4\",\"tag_names\":\"餐飲情報標籤名稱\",\"tag_colors\":\"#804040\",\"title\":\"主標題\",\"sub_title\":\"副標題\",\"content\":\"餐飲情報內容\",\"pic_url\":\"/uploads/campaign/1567069915.png\",\"pic_alt\":\"圖片說明\",\"release_date\":\"1910-01-01 00:00:00\",\"list_order\":\"0\"},{\"id\":\"1\",\"tag_ids\":\"1,2\",\"tag_names\":\"企業活動,活動訊息\",\"tag_colors\":\"#00ff80,#80ff80\",\"title\":\"我們與苦瓜的距離\",\"sub_title\":\"我們與苦瓜的距離\",\"content\":\"內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容\",\"pic_url\":\"/uploads/campaign/1567069865.png\",\"pic_alt\":\"\",\"release_date\":\"2019-05-23 00:00:00\",\"list_order\":\"0\"},{\"id\":\"2\",\"tag_ids\":\"3,4\",\"tag_names\":\"商品資訊,餐飲情報標籤名稱\",\"tag_colors\":\"#0080ff,#804040\",\"title\":\"「味の素 ®」(AJI-NO-MOTO ®) 正式開始銷售\",\"sub_title\":\"我們與苦瓜的距離\",\"content\":\"\",\"pic_url\":\"/uploads/campaign/1567069878.png\",\"pic_alt\":\"\",\"release_date\":\"2019-05-23 00:00:00\",\"list_order\":\"0\"},{\"id\":\"3\",\"tag_ids\":\"3,1\",\"tag_names\":\"企業活動,商品資訊\",\"tag_colors\":\"#00ff80,#0080ff\",\"title\":\"「味の素 ®」(AJI-NO-MOTO ®) 正式開始銷售\",\"sub_title\":\"我們與苦瓜的距離\",\"content\":\"\",\"pic_url\":\"/uploads/campaign/1567069889.png\",\"pic_alt\":\"\",\"release_date\":\"2019-05-23 00:00:00\",\"list_order\":\"0\"},{\"id\":\"4\",\"tag_ids\":\"4,2\",\"tag_names\":\"活動訊息,餐飲情報標籤名稱\",\"tag_colors\":\"#80ff80,#804040\",\"title\":\"「味の素 ®」(AJI-NO-MOTO ®) 正式開始銷售\",\"sub_title\":\"我們與苦瓜的距離\",\"content\":\"\",\"pic_url\":\"/uploads/campaign/1567069898.png\",\"pic_alt\":\"\",\"release_date\":\"2019-05-23 00:00:00\",\"list_order\":\"0\"},{\"id\":\"6\",\"tag_ids\":\"4,2,5\",\"tag_names\":\"活動訊息,餐飲情報標籤名稱,5\",\"tag_colors\":\"#80ff80,#804040,#0000ff\",\"title\":\"1\",\"sub_title\":\"2\",\"content\":\"4<img alt=\"\" src=\"/uploads/editor/1565768901.png\" />\",\"pic_url\":\"/uploads/campaign/1567069923.png\",\"pic_alt\":\"3\",\"release_date\":\"2019-08-07 00:00:00\",\"list_order\":\"5\"}]', '2019-11-19 13:31:22'),
(28, 0, '::1', 69, 'GET', 'recipepro', '', '[]', 'null', '0', '執行成功', '[{\"id\":\"1\",\"name\":\"1\",\"pic_url\":\"/uploads/repicepro/1565924165.png\",\"pic_alt\":\"3\",\"feature\":\"6\",\"tags\":\"雞肉,豬肉,根莖類\",\"price\":\"9\",\"type\":\"素食\",\"style\":\"火鍋\",\"product_ids\":\"6,7\",\"product_names\":\"6,7\",\"material_weight\":\"1231231\",\"nutrition\":\"1\",\"member_only\":\"0\",\"visitor\":\"25\",\"list_order\":\"1\"},{\"id\":\"2\",\"name\":\"2\",\"pic_url\":\"/uploads/repicepro/1567072415.png\",\"pic_alt\":\"A\",\"feature\":\"\",\"tags\":\"雞肉\",\"price\":\"999\",\"type\":\"日式\",\"style\":\"火鍋\",\"product_ids\":\"1,2,3,19\",\"product_names\":\"1,2,3,19\",\"material_weight\":\"\",\"nutrition\":\"<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n		<tr>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n		<tr>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>碳水化合物</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n		<tr>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n		<tr>\r\n			<th>碳水化合物</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n\",\"member_only\":\"0\",\"visitor\":\"69\",\"list_order\":\"2\"},{\"id\":\"3\",\"name\":\"3\",\"pic_url\":\"/uploads/repicepro/1565924165.png\",\"pic_alt\":\"3\",\"feature\":\"6\",\"tags\":\"雞肉,豬肉,根莖類\",\"price\":\"9\",\"type\":\"素食\",\"style\":\"火鍋\",\"product_ids\":\"19\",\"product_names\":\"19\",\"material_weight\":\"\",\"nutrition\":\"1\",\"member_only\":\"1\",\"visitor\":\"3\",\"list_order\":\"3\"},{\"id\":\"4\",\"name\":\"4\",\"pic_url\":\"/uploads/repicepro/1567072415.png\",\"pic_alt\":\"A\",\"feature\":\"7\",\"tags\":\"牛肉\",\"price\":\"0\",\"type\":\"中式\",\"style\":\"火鍋\",\"product_ids\":\"1\",\"product_names\":\"1\",\"material_weight\":\"\",\"nutrition\":\"\",\"member_only\":\"0\",\"visitor\":\"12\",\"list_order\":\"4\"},{\"id\":\"5\",\"name\":\"5\",\"pic_url\":\"/uploads/repicepro/1565924165.png\",\"pic_alt\":\"3\",\"feature\":\"6\",\"tags\":\"雞肉,豬肉,根莖類,主菜,火鍋\",\"price\":\"9\",\"type\":\"素食\",\"style\":\"火鍋\",\"product_ids\":\"1\",\"product_names\":\"1\",\"material_weight\":\"\",\"nutrition\":\"1\",\"member_only\":\"1\",\"visitor\":\"3\",\"list_order\":\"5\"},{\"id\":\"6\",\"name\":\"6\",\"pic_url\":\"/uploads/repicepro/1567072415.png\",\"pic_alt\":\"A\",\"feature\":\"7\",\"tags\":\"飯食\",\"price\":\"0\",\"type\":\"中式\",\"style\":\"主菜\",\"product_ids\":\"1\",\"product_names\":\"1\",\"material_weight\":\"\",\"nutrition\":\"\",\"member_only\":\"0\",\"visitor\":\"1\",\"list_order\":\"6\"},{\"id\":\"7\",\"name\":\"7\",\"pic_url\":\"/uploads/repicepro/1567072415.png\",\"pic_alt\":\"A\",\"feature\":\"7\",\"tags\":\"前菜\",\"price\":\"0\",\"type\":\"中式\",\"style\":\"主菜\",\"product_ids\":\"1\",\"product_names\":\"1\",\"material_weight\":\"\",\"nutrition\":\"\",\"member_only\":\"0\",\"visitor\":\"5\",\"list_order\":\"7\"},{\"id\":\"8\",\"name\":\"8\",\"pic_url\":\"/uploads/repicepro/1567072415.png\",\"pic_alt\":\"A\",\"feature\":\"7\",\"tags\":\"前菜\",\"price\":\"0\",\"type\":\"中式\",\"style\":\"主菜\",\"product_ids\":\"1\",\"product_names\":\"1\",\"material_weight\":\"\",\"nutrition\":\"\",\"member_only\":\"0\",\"visitor\":\"3\",\"list_order\":\"8\"},{\"id\":\"9\",\"name\":\"9\",\"pic_url\":\"/uploads/repicepro/1567072415.png\",\"pic_alt\":\"A\",\"feature\":\"7\",\"tags\":\"前菜\",\"price\":\"0\",\"type\":\"中式\",\"style\":\"主菜\",\"product_ids\":\"1\",\"product_names\":\"1\",\"material_weight\":\"\",\"nutrition\":\"\",\"member_only\":\"0\",\"visitor\":\"4\",\"list_order\":\"9\"},{\"id\":\"10\",\"name\":\"10\",\"pic_url\":\"/uploads/repicepro/1567072415.png\",\"pic_alt\":\"A\",\"feature\":\"7\",\"tags\":\"前菜\",\"price\":\"0\",\"type\":\"中式\",\"style\":\"主菜\",\"product_ids\":\"1\",\"product_names\":\"1\",\"material_weight\":\"\",\"nutrition\":\"\",\"member_only\":\"0\",\"visitor\":\"7\",\"list_order\":\"10\"},{\"id\":\"11\",\"name\":\"11\",\"pic_url\":\"/uploads/repicepro/1567072415.png\",\"pic_alt\":\"A\",\"feature\":\"7\",\"tags\":\"前菜\",\"price\":\"0\",\"type\":\"中式\",\"style\":\"主菜\",\"product_ids\":\"1\",\"product_names\":\"1\",\"material_weight\":\"\",\"nutrition\":\"\",\"member_only\":\"0\",\"visitor\":\"4\",\"list_order\":\"11\"}]', '2019-11-19 13:31:22');
INSERT INTO `log` (`id`, `user_id`, `ip`, `program_id`, `method`, `endpoint`, `verb`, `args`, `file`, `resultCode`, `resultMessage`, `resultData`, `c_time`) VALUES
(29, 0, '::1', 65, 'GET', 'product', '', '[]', 'null', '0', '執行成功', '[{\"id\":\"1\",\"brand_id\":\"5\",\"brand_name\":\"1\",\"brand_pic_url\":\"/uploads/brand/1567073352.png\",\"name\":\"1\",\"pic_urls\":\"/uploads/product/1565848035.png,/uploads/product/1565848034.png,/uploads/product/1565848036.png,/uploads/product/1565848037.png,/uploads/product/1565848038.png,/uploads/product/1565848039.png\",\"pic_alts\":\"4,3,,,,\",\"tag\":\"標籤1\",\"content\":\"內容內容內容內容內容內容內容內容內容內容\",\"tips\":\"內容內容內容內容內容內容內容內容內容內容\",\"information\":\"<ul class=\"product-info-box p-a0\">\r\n	<li class=\"d-flex \"><span class=\"title\">原料</span><span class=\"text\">調味劑(L-麩酸鈉、5`-次黃嘌呤核苷磷酸二鈉、琥珀酸二鈉)、食鹽、乳糖、砂糖、乾燻鰹魚、鰹魚抽出物、酵母抽出物、D-木糖、麥芽糖、葡萄糖、糊精</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">淨重</span><span class=\"text\">1公斤</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">原產地</span><span class=\"text\">日本國神奈川縣</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品包裝</span><span class=\"text\">1kgx12袋/箱</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品條碼</span><span class=\"text\">4901001375431</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">外箱尺寸</span><span class=\"text\">522x262x209mm</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存期限</span><span class=\"text\">24個月(常溫未開封狀態下) </span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">過敏原</span><span class=\"text\">2本產品含有牛奶及其製品</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存方法</span><span class=\"text\">開封後，為了避免受潮，請密封存放於乾燥通風處，以確認產品的最佳風味及品質。 </span></li>\r\n</ul>\r\n\",\"mark\":\"<ul class=\"info-box p-a0\">\r\n	<li class=\"d-flex\"><span class=\"title\">每一份量</span><span class=\"text\">1公克</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">本包裝含</span><span class=\"text\">1000份</span></li>\r\n</ul>\r\n\r\n<ul class=\"product-info-box p-a0\">\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\"></span><span class=\"text-e\">每份</span><span class=\"text-h\">每100公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">熱量</span><span class=\"text-e\">2.2大卡</span><span class=\"text-h\">225大卡</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">蛋白質</span><span class=\"text-e\">0.2公克</span><span class=\"text-h\">24.1公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">脂肪</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title p-l10\">飽和脂肪</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title p-l10\">反式脂肪</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">碳水化合物</span><span class=\"text-e\">0.3公克</span><span class=\"text-h\">31.6公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">糖</span><span class=\"text-e\">0.2公克</span><span class=\"text-h\">17.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">鈉</span><span class=\"text-e\">175毫克</span><span class=\"text-h\">17500毫克</span></li>\r\n</ul>\r\n\",\"list_order\":\"1\"},{\"id\":\"2\",\"brand_id\":\"1\",\"brand_name\":\"烹大師\",\"brand_pic_url\":\"/uploads/brand/1567073322.png\",\"name\":\"2\",\"pic_urls\":\"/uploads/product/1567073370.png\",\"pic_alts\":\"\",\"tag\":\"\",\"content\":\"商品內容\",\"tips\":\"美味秘訣\",\"information\":\"<ul class=\"p-a0\">\r\n	<li class=\"d-flex \"><span class=\"title\">原料</span> <span class=\"text\">調味劑(L-麩酸鈉、5&#39;-次黃嘌呤核苷磷酸二鈉、琥珀酸二鈉)、食鹽、乳糖、砂糖、乾燻鰹魚、鰹魚抽出物、酵母抽出物、D-木糖、麥芽糖、葡萄糖、糊精</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">淨重</span> <span class=\"text\">1公斤</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">原產地</span> <span class=\"text\">日本國神奈川縣</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品包裝</span> <span class=\"text\">1kgx12袋/箱</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品條碼</span> <span class=\"text\">4901001375431</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">外箱尺寸</span> <span class=\"text\">522x262x209mm</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存期限</span> <span class=\"text\">24個月(常溫未開封狀態下) </span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">過敏原</span> <span class=\"text\">2本產品含有牛奶及其製品</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存方法</span> <span class=\"text\">開封後，為了避免受潮，請密封存放於乾燥通風處，以確認產品的最佳風味及品質。 </span></li>\r\n</ul>\r\n\",\"mark\":\"<ul class=\"p-a0\">\r\n	<li class=\"d-flex\"><span class=\"title\">每一份量</span> <span class=\"text\">1公克</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">本包裝含</span> <span class=\"text\">1000份</span></li>\r\n</ul>\r\n\r\n<ul class=\"p-a0\">\r\n	<li class=\"d-flex justify-content-between\"><span class=\"text-e\">每份</span> <span class=\"text-h\">每100公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">熱量</span> <span class=\"text-e\">2.2大卡</span> <span class=\"text-h\">225大卡</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">蛋白質</span> <span class=\"text-e\">0.2公克</span> <span class=\"text-h\">24.1公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">脂肪</span> <span class=\"text-e\">0.0公克</span> <span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title p-l10\">飽和脂肪</span> <span class=\"text-e\">0.0公克</span> <span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title p-l10\">反式脂肪</span> <span class=\"text-e\">0.0公克</span> <span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">碳水化合物</span> <span class=\"text-e\">0.3公克</span> <span class=\"text-h\">31.6公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">糖</span> <span class=\"text-e\">0.2公克</span> <span class=\"text-h\">17.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">鈉</span> <span class=\"text-e\">175毫克</span> <span class=\"text-h\">17500毫克</span></li>\r\n</ul>\r\n\",\"list_order\":\"2\"},{\"id\":\"3\",\"brand_id\":\"1\",\"brand_name\":\"烹大師\",\"brand_pic_url\":\"/uploads/brand/1567073322.png\",\"name\":\"3\",\"pic_urls\":\"/uploads/product/1558350652.png\",\"pic_alts\":\"1\",\"tag\":\"\",\"content\":\"<table class=\"info-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>原料</th>\r\n			<td>調味劑(L-麩酸鈉、5&#39;-次黃嘌呤核苷磷酸二鈉、琥珀酸二鈉)、食鹽、乳糖、砂糖、乾燻鰹魚、鰹魚抽出物、酵母抽出物、D-木糖、麥芽糖、葡萄糖、糊精</td>\r\n		</tr>\r\n		<tr>\r\n			<th>容量</th>\r\n			<td>320公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>使用方法</th>\r\n			<td>7公克可調理成1000c.c的高湯&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"tips\":\"\",\"information\":\"\",\"mark\":\"<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">每一份量<span>100公克</span></th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\">每份</th>\r\n			<th>每100公克</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量</th>\r\n			<td>2.2 大卡</td>\r\n			<td>225 打卡</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蛋白質</th>\r\n			<td>0.2 公克</td>\r\n			<td>24.1 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>&nbsp; &nbsp; 飽和脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>&nbsp; &nbsp; 反式脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>碳水化合物</th>\r\n			<td>&nbsp; 0.3 公克</td>\r\n			<td>31.6 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>&nbsp; &nbsp; 糖</th>\r\n			<td>0.2 公克</td>\r\n			<td>17.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈉</th>\r\n			<td>175 毫克</td>\r\n			<td>17500 毫克</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"list_order\":\"3\"},{\"id\":\"4\",\"brand_id\":\"1\",\"brand_name\":\"烹大師\",\"brand_pic_url\":\"/uploads/brand/1567073322.png\",\"name\":\"4\",\"pic_urls\":\"/uploads/product/1558350701.png\",\"pic_alts\":\"\",\"tag\":\"\",\"content\":\"<table class=\"info-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>原料</th>\r\n			<td>調味劑(L-麩酸鈉、5&#39;-次黃嘌呤核苷磷酸二鈉、琥珀酸二鈉)、食鹽、乳糖、砂糖、乾燻鰹魚、鰹魚抽出物、酵母抽出物、D-木糖、麥芽糖、葡萄糖、糊精</td>\r\n		</tr>\r\n		<tr>\r\n			<th>容量</th>\r\n			<td>450公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>使用方法</th>\r\n			<td>7公克可調理成1000c.c的高湯&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"tips\":\"\",\"information\":\"\",\"mark\":\"<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">每一份量<span>100公克</span></th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\">每份</th>\r\n			<th>每100公克</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量</th>\r\n			<td>2.2 大卡</td>\r\n			<td>225 打卡</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蛋白質</th>\r\n			<td>0.2 公克</td>\r\n			<td>24.1 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>&nbsp; &nbsp; 飽和脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>&nbsp; &nbsp; 反式脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>碳水化合物</th>\r\n			<td>&nbsp; 0.3 公克</td>\r\n			<td>31.6 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>&nbsp; &nbsp; 糖</th>\r\n			<td>0.2 公克</td>\r\n			<td>17.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈉</th>\r\n			<td>175 毫克</td>\r\n			<td>17500 毫克</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"list_order\":\"4\"},{\"id\":\"5\",\"brand_id\":\"1\",\"brand_name\":\"烹大師\",\"brand_pic_url\":\"/uploads/brand/1567073322.png\",\"name\":\"5\",\"pic_urls\":\"/uploads/product/1558350747.png\",\"pic_alts\":\"\",\"tag\":\"\",\"content\":\"<table class=\"info-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>原料</th>\r\n			<td>調味劑(L-麩酸鈉、5&#39;-次黃嘌呤核苷磷酸二鈉、琥珀酸二鈉)、食鹽、乳糖、砂糖、乾燻鰹魚、鰹魚抽出物、酵母抽出物、D-木糖、麥芽糖、葡萄糖、糊精</td>\r\n		</tr>\r\n		<tr>\r\n			<th>容量</th>\r\n			<td>65公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>使用方法</th>\r\n			<td>7公克可調理成1000c.c的高湯&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"tips\":\"\",\"information\":\"\",\"mark\":\"<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">每一份量<span>100公克</span></th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\">每份</th>\r\n			<th>每100公克</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量</th>\r\n			<td>2.2 大卡</td>\r\n			<td>225 打卡</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蛋白質</th>\r\n			<td>0.2 公克</td>\r\n			<td>24.1 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>&nbsp; &nbsp; 飽和脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>&nbsp; &nbsp; 反式脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>碳水化合物</th>\r\n			<td>&nbsp; 0.3 公克</td>\r\n			<td>31.6 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>&nbsp; &nbsp; 糖</th>\r\n			<td>0.2 公克</td>\r\n			<td>17.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈉</th>\r\n			<td>175 毫克</td>\r\n			<td>17500 毫克</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"list_order\":\"5\"},{\"id\":\"6\",\"brand_id\":\"2\",\"brand_name\":\"VONO\",\"brand_pic_url\":\"/uploads/brand/1567073329.png\",\"name\":\"6\",\"pic_urls\":\"/uploads/product/1558418208.jpg\",\"pic_alts\":\"\",\"tag\":\"\",\"content\":\"<table class=\"info-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>原料</th>\r\n			<td>甜玉米粉、砂糖、馬鈴薯澱粉、麥芽糊精、脫脂牛乳、棕櫚油、乳糖、玉米糖漿、食鹽、玉米粒、玉米油、棕櫚仁油、調味劑(L-麩酸鈉、5&#39;-次黃嘌呤核苷磷酸二鈉)、酸酪蛋白、關華豆膠、洋蔥、糊精、酵母抽出物、大豆卵磷脂、白胡椒、香料、麵粉、葡萄糖、油菜籽油</td>\r\n		</tr>\r\n		<tr>\r\n			<th>容量</th>\r\n			<td>57.6公克(共3袋)</td>\r\n		</tr>\r\n		<tr>\r\n			<th>使用方法</th>\r\n			<td>將VONO&reg;倒入杯中，注入150ml的熱水(約一般馬克杯6分滿)攪拌15秒即可。</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"tips\":\"\",\"information\":\"\",\"mark\":\"<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">每一份量<span>19.2公克</span></th>\r\n		</tr>\r\n		<tr>\r\n			<th colspan=\"3\">本包裝含3份</th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\">每份</th>\r\n			<th>每100公克</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th style=\"text-align: left;\">熱量</th>\r\n			<td>80大卡</td>\r\n			<td>416大卡</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">蛋白質</th>\r\n			<td>1.2公克</td>\r\n			<td>6.1公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">脂肪</th>\r\n			<td>2.2公克</td>\r\n			<td>11.6公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>飽和脂肪</th>\r\n			<td>1.5公克</td>\r\n			<td>7.8公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>反式脂肪</th>\r\n			<td>0公克</td>\r\n			<td>0公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">碳水化合物</th>\r\n			<td>13.8公克</td>\r\n			<td>71.9公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>糖</th>\r\n			<td>6.1公克</td>\r\n			<td>31.9公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">鈉</th>\r\n			<td>411毫克</td>\r\n			<td>2140毫克</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"list_order\":\"6\"},{\"id\":\"7\",\"brand_id\":\"2\",\"brand_name\":\"VONO\",\"brand_pic_url\":\"/uploads/brand/1567073329.png\",\"name\":\"7\",\"pic_urls\":\"/uploads/product/1558420642.jpg\",\"pic_alts\":\"\",\"tag\":\"\",\"content\":\"<table class=\"info-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>原料</th>\r\n			<td>馬鈴薯澱粉、麥芽糊精、砂糖、棕櫚油、食鹽、全脂牛乳、玉米糖漿、脫脂牛乳、馬鈴薯粉、洋蔥粉、調味劑(L-麩酸鈉、5&lsquo;-次黃嘌呤核苷磷酸二鈉、胺基乙酸)、卡門貝爾起司、洋蔥、棕櫚仁油、還原水飴、酵母抽出物、糊精、玉米油、關華豆膠、豬肉、酸酪蛋白、醬油、白胡椒、鰹魚抽出物、荷蘭芹、大豆卵磷脂、薑黃、玉米芯抽出物、芹菜籽、玉米澱粉、月桂、陳皮、混合生育醇、麵粉、葡萄糖、油菜籽油、迷迭香抽出物</td>\r\n		</tr>\r\n		<tr>\r\n			<th>容量</th>\r\n			<td>46.5公克(共3袋)</td>\r\n		</tr>\r\n		<tr>\r\n			<th>使用方法</th>\r\n			<td>將VONO&reg;倒入杯中，注入150ml的熱水(約一般馬克杯6分滿)攪拌15秒即可。</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"tips\":\"\",\"information\":\"\",\"mark\":\"<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">每一份量<span>15.5公克</span></th>\r\n		</tr>\r\n		<tr>\r\n			<th colspan=\"3\">本包裝含3份</th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\">每份</th>\r\n			<th>每100公克</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th style=\"text-align: left;\">熱量</th>\r\n			<td>64大卡</td>\r\n			<td>413大卡</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">蛋白質</th>\r\n			<td>0.9公克</td>\r\n			<td>5.5公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">脂肪</th>\r\n			<td>1.8公克</td>\r\n			<td>11.5公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>飽和脂肪</th>\r\n			<td>1.3公克</td>\r\n			<td>8.4公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>反式脂肪</th>\r\n			<td>0公克</td>\r\n			<td>0公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">碳水化合物</th>\r\n			<td>11.1公克</td>\r\n			<td>71.8公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>糖</th>\r\n			<td>2.8公克</td>\r\n			<td>17.9公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">鈉</th>\r\n			<td>409毫克</td>\r\n			<td>2640毫克</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"list_order\":\"7\"},{\"id\":\"8\",\"brand_id\":\"2\",\"brand_name\":\"VONO\",\"brand_pic_url\":\"/uploads/brand/1567073329.png\",\"name\":\"8\",\"pic_urls\":\"/uploads/product/1558423834.jpg\",\"pic_alts\":\"\",\"tag\":\"\",\"content\":\"<table class=\"info-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>原料</th>\r\n			<td>馬鈴薯澱粉、南瓜粉、砂糖、脫脂牛乳、棕櫚油、玉米糖漿、食鹽、麥芽糊精、馬鈴薯粉、棕櫚仁油、玉米油、糊精、調味劑(L-麩酸鈉、5&#39;-次黃嘌呤核苷磷酸二鈉)、酵母抽出物、酸酪蛋白、洋蔥抽出物、椰子油、全脂牛乳、葡萄糖糖漿、米糠油、洋蔥、荷蘭芹、大豆卵磷脂、乳糖、白胡椒、豆蔻、月桂、肉桂、陳皮、葡萄糖</td>\r\n		</tr>\r\n		<tr>\r\n			<th>容量</th>\r\n			<td>52.2公克(共3袋)</td>\r\n		</tr>\r\n		<tr>\r\n			<th>使用方法</th>\r\n			<td>將VONO&reg;倒入杯中，注入150ml的熱水(約一般馬克杯6分滿)攪拌15秒即可。</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"tips\":\"\",\"information\":\"\",\"mark\":\"<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">每一份量<span>17.4公克</span></th>\r\n		</tr>\r\n		<tr>\r\n			<th colspan=\"3\">本包裝含3份</th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\">每份</th>\r\n			<th>每100公克</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th style=\"text-align: left;\">熱量</th>\r\n			<td>75大卡</td>\r\n			<td>429大卡</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">蛋白質</th>\r\n			<td>1.1公克</td>\r\n			<td>6.1公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">脂肪</th>\r\n			<td>2.5公克</td>\r\n			<td>14.5公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>飽和脂肪</th>\r\n			<td>2.0公克</td>\r\n			<td>11.5公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>反式脂肪</th>\r\n			<td>0公克</td>\r\n			<td>0公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">碳水化合物</th>\r\n			<td>11.9公克</td>\r\n			<td>68.6公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>糖</th>\r\n			<td>5.0公克</td>\r\n			<td>28.8公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">鈉</th>\r\n			<td>388毫克</td>\r\n			<td>2230毫克</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"list_order\":\"8\"},{\"id\":\"9\",\"brand_id\":\"2\",\"brand_name\":\"VONO\",\"brand_pic_url\":\"/uploads/brand/1567073329.png\",\"name\":\"9\",\"pic_urls\":\"/uploads/product/1558424084.jpg\",\"pic_alts\":\"\",\"tag\":\"\",\"content\":\"<table class=\"info-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>原料</th>\r\n			<td>馬鈴薯澱粉、麥芽糊精、乳糖、棕櫚油、卡門貝爾起司、全脂牛乳、砂糖、馬鈴薯粉、玉米糖漿、食鹽、戈爾根佐拉起司、棕櫚仁油、調味劑(L-麩酸鈉、5&#39;-次黃嘌呤核苷磷酸二鈉、胺基乙酸)、切達起司、椰子油、洋蔥粉、洋蔥、玉米油、關華豆膠、葡萄糖糖漿、脫脂牛乳、酵母抽出物、糊精、酸酪蛋白、鰹魚抽出物、大豆卵磷脂、荷蘭芹、玉米芯抽出物、白胡椒、薑黃、芹菜籽、玉米澱粉、月桂、陳皮</td>\r\n		</tr>\r\n		<tr>\r\n			<th>容量</th>\r\n			<td>54公克(共3袋)</td>\r\n		</tr>\r\n		<tr>\r\n			<th>使用方法</th>\r\n			<td>將VONO&reg;倒入杯中，注入150ml的熱水(約一般馬克杯6分滿)攪拌15秒即可。</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"tips\":\"\",\"information\":\"\",\"mark\":\"<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">每一份量<span>18.0公克</span></th>\r\n		</tr>\r\n		<tr>\r\n			<th colspan=\"3\">本包裝含3份</th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\">每份</th>\r\n			<th>每100公克</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th style=\"text-align: left;\">熱量</th>\r\n			<td>84大卡</td>\r\n			<td>465大卡</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">蛋白質</th>\r\n			<td>1.4公克</td>\r\n			<td>8公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">脂肪</th>\r\n			<td>3.9公克</td>\r\n			<td>21.4公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>飽和脂肪</th>\r\n			<td>2.9公克</td>\r\n			<td>16.2公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>反式脂肪</th>\r\n			<td>0公克</td>\r\n			<td>0公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">碳水化合物</th>\r\n			<td>10.8公克</td>\r\n			<td>60.0公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>糖</th>\r\n			<td>3.6公克</td>\r\n			<td>19.8公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">鈉</th>\r\n			<td>418毫克</td>\r\n			<td>2320毫克</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"list_order\":\"9\"},{\"id\":\"10\",\"brand_id\":\"2\",\"brand_name\":\"VONO\",\"brand_pic_url\":\"/uploads/brand/1567073329.png\",\"name\":\"10\",\"pic_urls\":\"/uploads/product/1558520127.jpg\",\"pic_alts\":\"\",\"tag\":\"\",\"content\":\"<table class=\"info-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>原料</th>\r\n			<td>麩醯胺酸，L-精胺酸，L-白胺酸，L-異白胺酸，L-&alpha;胺基異戊酸，調味劑(檸檬酸、DL-蘋果酸、檸檬酸鈉)，L-羥丁胺酸，鹽酸L-二胺基己酸，L-蛋胺酸，鹽酸L-組織胺酸，L-脯胺酸，脂肪酸蔗糖酯，維生素C，蛋殼粉，麥芽糖漿，阿拉伯膠，甜味劑(阿斯巴甜、醋磺內酯鉀)，L-苯丙胺酸，L-色胺酸，糊精，辛烯基丁二酸鈉澱粉，香料，食用油脂(菜籽油、椰子油、葵花籽油、棕櫚油)，菸鹼酸，檸檬酸亞鐵鈉，丙二醇，維生素E，乳糖，本多酸鈣，脫脂乳粉，維生素B6，維生素B1，發酵乳粉末，維生素B2，纖維素，維生素A，水解澱粉，&alpha;、&beta;、&gamma;-環狀糊精，維生素B12，維生素D3，砂糖<br />\r\n			本產品含牛奶、蛋及其製品 &nbsp;警語:內含苯丙胺酸</td>\r\n		</tr>\r\n		<tr>\r\n			<th>最佳補給時機</th>\r\n			<td>* 運動前 30分鐘補充，維持運動最佳表現<br />\r\n			* 長時間運動中補充，可幫助保持活力<br />\r\n			* 運動後 30分鐘內補充，幫助身體回復</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"tips\":\"\",\"information\":\"\",\"mark\":\"<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">每一份量<span>4.5公克</span></th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\">每份</th>\r\n			<th>每100公克</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th style=\"text-align: left;\">熱量</th>\r\n			<td>17大卡</td>\r\n			<td>385大卡</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">蛋白質</th>\r\n			<td>3.8公克</td>\r\n			<td>84.5公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">脂肪</th>\r\n			<td>0.0公克</td>\r\n			<td>0.0公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>飽和脂肪</th>\r\n			<td>0.0公克</td>\r\n			<td>0.0公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>反式脂肪</th>\r\n			<td>0.0公克</td>\r\n			<td>0.0公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">碳水化合物</th>\r\n			<td>0.5公克</td>\r\n			<td>11.7公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>糖</th>\r\n			<td>0.0公克</td>\r\n			<td>0.0公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">鈉</th>\r\n			<td>1毫克</td>\r\n			<td>18毫克</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n&nbsp;\r\n\r\n<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\" style=\"text-align: center;\">胺基酸成分</th>\r\n			<th><span style=\"font-size:13px;\">Amino acids 3,600mg</span></th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th>BCAA</th>\r\n			<td>白胺酸Leucine<br />\r\n			異白胺酸Isoleucine<br />\r\n			纈胺酸Valine</td>\r\n			<td>540mg<br />\r\n			430mg<br />\r\n			360mg</td>\r\n		</tr>\r\n		<tr>\r\n			<th>&nbsp;</th>\r\n			<td>麩醯胺酸Glutamine</td>\r\n			<td>650mg</td>\r\n		</tr>\r\n		<tr>\r\n			<th>&nbsp;</th>\r\n			<td>精胺酸Arginine</td>\r\n			<td>610mg</td>\r\n		</tr>\r\n		<tr>\r\n			<th>&nbsp;</th>\r\n			<td>其他多種胺基酸Other AAs</td>\r\n			<td>1,010mg</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n&nbsp;\r\n\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td align=\"center\" bgcolor=\"#cea71b\" colspan=\"3\"><span style=\"color:#2c3e50;\">胺基酸成分</span></td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\"right\" bgcolor=\"#fcf6e0\" colspan=\"3\"><span style=\"color:#2c3e50;\">胺基酸Amino acids&nbsp;&nbsp;3,600mg</span></td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\"left\" bgcolor=\"#CEA71B\" rowspan=\"3\"><span style=\"color:#2c3e50;\">BCAA</span></td>\r\n			<td align=\"right\" bgcolor=\"#f9ecc0\"><span style=\"color:#2c3e50;\">白胺酸Leucine</span></td>\r\n			<td align=\"right\" bgcolor=\"#f9ecc0\"><span style=\"color:#2c3e50;\">540mg</span></td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\"right\" bgcolor=\"#fcf6e0\"><span style=\"color:#2c3e50;\">異白胺酸Isoleucine</span></td>\r\n			<td align=\"right\" bgcolor=\"#fcf6e0\"><span style=\"color:#2c3e50;\">430mg</span></td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\"right\" bgcolor=\"#f9ecc0\"><span style=\"color:#2c3e50;\">纈胺酸Valine</span></td>\r\n			<td align=\"right\" bgcolor=\"#f9ecc0\"><span style=\"color:#2c3e50;\">360mg</span></td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\"left\" bgcolor=\"#E7C247\" rowspan=\"3\">&nbsp;</td>\r\n			<td align=\"right\" bgcolor=\"#fcf6e0\"><span style=\"color:#2c3e50;\">麩醯胺酸Glutamine</span></td>\r\n			<td align=\"right\" bgcolor=\"#fcf6e0\"><span style=\"color:#2c3e50;\">650mg</span></td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\"right\" bgcolor=\"#F9ECC0\"><span style=\"color:#2c3e50;\">精胺酸Arginine</span></td>\r\n			<td align=\"right\" bgcolor=\"#F9ECC0\"><span style=\"color:#2c3e50;\">610mg</span></td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\"right\" bgcolor=\"#FCF6E0\"><span style=\"color:#2c3e50;\">其他多種胺基酸Other AAs</span></td>\r\n			<td align=\"right\" bgcolor=\"#FCF6E0\"><span style=\"color:#2c3e50;\">1,010mg</span></td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"list_order\":\"10\"},{\"id\":\"11\",\"brand_id\":\"2\",\"brand_name\":\"VONO\",\"brand_pic_url\":\"/uploads/brand/1567073329.png\",\"name\":\"11\",\"pic_urls\":\"/uploads/product/1558426836.jpg\",\"pic_alts\":\"\",\"tag\":\"\",\"content\":\"<table class=\"info-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>原料</th>\r\n			<td>L-白胺酸，鹽酸L-二胺基己酸，L-&alpha;胺基異戊酸，L-異白胺酸，L-羥丁胺酸，L-苯丙胺酸，甜味劑(麥芽糖醇、阿斯巴甜、醋磺內酯鉀)，脂肪酸蔗糖酯，檸檬酸，L-蛋胺酸，香料，糊精，鹽酸L-組織胺酸，L-色胺酸，酶解大豆卵磷脂，貝殼鈣，菜籽油，微結晶狀&alpha;-纖維素，脂肪酸甘油酯，維生素B2 &nbsp;&nbsp;<br />\r\n			警語:內含苯丙胺酸</td>\r\n		</tr>\r\n		<tr>\r\n			<th>最佳補給時機</th>\r\n			<td>* 比賽前一天睡前 30分鐘補充，調整身體狀態<br />\r\n			* 比賽後 30分鐘內補充，提供身體關鍵營養<br />\r\n			* 就寢前 30分鐘補充，幫助身體持續回復</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"tips\":\"\",\"information\":\"\",\"mark\":\"<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">每一份量<span>4.7公克</span></th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\">每份</th>\r\n			<th>每100公克</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th style=\"text-align: left;\">熱量</th>\r\n			<td>18大卡</td>\r\n			<td>389大卡</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">蛋白質</th>\r\n			<td>4.1公克</td>\r\n			<td>86.7公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">脂肪</th>\r\n			<td>0.0公克</td>\r\n			<td>0.0公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>飽和脂肪</th>\r\n			<td>0.0公克</td>\r\n			<td>0.0公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>反式脂肪</th>\r\n			<td>0.0公克</td>\r\n			<td>0.0公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">碳水化合物</th>\r\n			<td>0.5公克</td>\r\n			<td>10.5公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>糖</th>\r\n			<td>0.0公克</td>\r\n			<td>0.0公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">鈉</th>\r\n			<td>1毫克</td>\r\n			<td>13毫克</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<br />\r\n<br />\r\n&nbsp;\r\n<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">胺基酸成分</th>\r\n		</tr>\r\n		<tr>\r\n			<th colspan=\"3\">必需胺基酸Essential Amino acids 4,000mg</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th>BCAA</th>\r\n			<td>白胺酸Leucine</td>\r\n			<td>1,600mg</td>\r\n		</tr>\r\n		<tr>\r\n			<th>BCAA</th>\r\n			<td>異白胺酸Isoleucine</td>\r\n			<td>430mg</td>\r\n		</tr>\r\n		<tr>\r\n			<th>BCAA</th>\r\n			<td>纈胺酸Valine</td>\r\n			<td>440mg</td>\r\n		</tr>\r\n		<tr>\r\n			<th>&nbsp;</th>\r\n			<td>其他多種胺基酸Other AAs</td>\r\n			<td>1,540mg</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"list_order\":\"11\"},{\"id\":\"12\",\"brand_id\":\"2\",\"brand_name\":\"VONO\",\"brand_pic_url\":\"/uploads/brand/1567073329.png\",\"name\":\"12\",\"pic_urls\":\"/uploads/product/1558515763.png\",\"pic_alts\":\"\",\"tag\":\"\",\"content\":\"<table class=\"info-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>原料</th>\r\n			<td>水，糊精，DL-胺基丙酸，檸檬酸，L-脯胺酸，洋菜，香料，檸檬酸鈉，刺槐豆膠，塔拉膠，醋磺內酯鉀(甜味劑)，維生素B2<br />\r\n			本品生產線亦有生產含芒果原料之產品</td>\r\n		</tr>\r\n		<tr>\r\n			<th>最佳補給時機</th>\r\n			<td>*運動或比賽前30分鐘補充，保持體力充沛<br />\r\n			*運動中後段補充，迅速補充能量</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"tips\":\"\",\"information\":\"\",\"mark\":\"<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">每一份量<span>130公克</span></th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\">每份</th>\r\n			<th>每100公克</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th style=\"text-align: left;\">熱量</th>\r\n			<td>174大卡</td>\r\n			<td>134大卡</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">蛋白質</th>\r\n			<td>4.8公克</td>\r\n			<td>3.7公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">脂肪</th>\r\n			<td>0.0公克</td>\r\n			<td>0.0公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>飽和脂肪</th>\r\n			<td>0.0公克</td>\r\n			<td>0.0公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>反式脂肪</th>\r\n			<td>0.0公克</td>\r\n			<td>0.0公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">碳水化合物</th>\r\n			<td>38.9公克</td>\r\n			<td>29.9公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>糖</th>\r\n			<td>2.3公克</td>\r\n			<td>1.8公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">鈉</th>\r\n			<td>14毫克</td>\r\n			<td>11毫克</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<br />\r\n<br />\r\n&nbsp;\r\n<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">胺基酸成分</th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\" style=\"text-align: left;\">胺基酸Amino acids 5,000mg</th>\r\n		</tr>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"2\" style=\"text-align: left;\">丙胺酸Alanine&nbsp;4,500mg</th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\" style=\"text-align: left;\">脯胺酸Proline&nbsp;500mg</th>\r\n		</tr>\r\n	</thead>\r\n</table>\r\n\",\"list_order\":\"12\"},{\"id\":\"13\",\"brand_id\":\"2\",\"brand_name\":\"VONO\",\"brand_pic_url\":\"/uploads/brand/1567073329.png\",\"name\":\"13\",\"pic_urls\":\"/uploads/product/1558516565.png\",\"pic_alts\":\"\",\"tag\":\"\",\"content\":\"<table class=\"info-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>原料</th>\r\n			<td>調味劑(L-麩酸鈉、DL-胺基丙酸、琥珀酸二鈉、5&#39;-次黃嘌呤核苷磷酸二鈉、5&#39;-鳥嘌呤核苷磷酸二鈉)、食鹽、蔗糖、玉米澱粉、干貝粉、酵母抽出物、扇貝抽出物、糊精</td>\r\n		</tr>\r\n		<tr>\r\n			<th>容量</th>\r\n			<td>40公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>使用方法</th>\r\n			<td>5公克可調理成500c.c的高湯</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"tips\":\"\",\"information\":\"\",\"mark\":\"<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">每一份量<span>1公克</span></th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\">每份</th>\r\n			<th>每100公克</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th style=\"text-align: left;\">熱量</th>\r\n			<td>2.3大卡</td>\r\n			<td>232 大卡</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">蛋白質</th>\r\n			<td>0.3 公克</td>\r\n			<td>&nbsp;29.1公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">&nbsp; &nbsp; 飽和脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">&nbsp; &nbsp; 反式脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">碳水化合物</th>\r\n			<td>&nbsp; 0.3 公克</td>\r\n			<td>28.9 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">&nbsp; &nbsp; 糖</th>\r\n			<td>0.1公克</td>\r\n			<td>8.1 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">鈉</th>\r\n			<td>150 毫克</td>\r\n			<td>15000 毫克</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"list_order\":\"13\"},{\"id\":\"14\",\"brand_id\":\"2\",\"brand_name\":\"VONO\",\"brand_pic_url\":\"/uploads/brand/1567073329.png\",\"name\":\"14\",\"pic_urls\":\"/uploads/product/1558516958.png\",\"pic_alts\":\"\",\"tag\":\"\",\"content\":\"<table class=\"info-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>原料</th>\r\n			<td>調味劑(L-麩酸鈉、DL-胺基丙酸、琥珀酸二鈉、5&#39;-次黃嘌呤核苷磷酸二鈉、5&#39;-鳥嘌呤核苷磷酸二鈉)、食鹽、蔗糖、玉米澱粉、干貝粉、酵母抽出物、扇貝抽出物、糊精</td>\r\n		</tr>\r\n		<tr>\r\n			<th>容量</th>\r\n			<td>40公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>使用方法</th>\r\n			<td>5公克可調理成500c.c的高湯</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"tips\":\"\",\"information\":\"\",\"mark\":\"<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">每一份量<span>1公克</span></th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\">每份</th>\r\n			<th>每100公克</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th style=\"text-align: left;\">熱量</th>\r\n			<td>2.3大卡</td>\r\n			<td>232 大卡</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">蛋白質</th>\r\n			<td>0.3 公克</td>\r\n			<td>&nbsp;29.1公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">&nbsp; &nbsp; 飽和脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">&nbsp; &nbsp; 反式脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">碳水化合物</th>\r\n			<td>&nbsp; 0.3 公克</td>\r\n			<td>28.9 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">&nbsp; &nbsp; 糖</th>\r\n			<td>0.1公克</td>\r\n			<td>8.1 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">鈉</th>\r\n			<td>150 毫克</td>\r\n			<td>15000 毫克</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"list_order\":\"14\"},{\"id\":\"15\",\"brand_id\":\"3\",\"brand_name\":\"amino vital\",\"brand_pic_url\":\"/uploads/brand/1567073337.png\",\"name\":\"15\",\"pic_urls\":\"/uploads/product/1558517236.png\",\"pic_alts\":\"\",\"tag\":\"\",\"content\":\"<table class=\"info-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>原料</th>\r\n			<td>調味劑(L-麩酸鈉、氯化鉀、5&#39;-次黃嘌呤核苷磷酸二鈉、5&#39;-鳥嘌呤核苷磷酸二鈉、琥珀酸二鈉)、食鹽、砂糖、D-甘露醇（甜味劑）、昆布粉、糊精、昆布抽出物</td>\r\n		</tr>\r\n		<tr>\r\n			<th>容量</th>\r\n			<td>40公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>使用方法</th>\r\n			<td>4公克可調理成600c.c的高湯</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"tips\":\"\",\"information\":\"\",\"mark\":\"<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">每一份量<span>1公克</span></th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\">每份</th>\r\n			<th>每100公克</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th style=\"text-align: left;\">熱量</th>\r\n			<td>2.2大卡</td>\r\n			<td>217 大卡</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">蛋白質</th>\r\n			<td>0.2公克</td>\r\n			<td>&nbsp;15.3公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">&nbsp; &nbsp; 飽和脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">&nbsp; &nbsp; 反式脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">碳水化合物</th>\r\n			<td>&nbsp; 0.4公克</td>\r\n			<td>38.9 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">&nbsp; &nbsp; 糖</th>\r\n			<td>0.2公克</td>\r\n			<td>21.3公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">鈉</th>\r\n			<td>156毫克</td>\r\n			<td>15600 毫克</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"list_order\":\"15\"},{\"id\":\"16\",\"brand_id\":\"3\",\"brand_name\":\"amino vital\",\"brand_pic_url\":\"/uploads/brand/1567073337.png\",\"name\":\"16\",\"pic_urls\":\"/uploads/product/1558517382.png\",\"pic_alts\":\"\",\"tag\":\"\",\"content\":\"<table class=\"info-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>原料</th>\r\n			<td>調味劑(L-麩酸鈉、氯化鉀、5&#39;-次黃嘌呤核苷磷酸二鈉、5&#39;-鳥嘌呤核苷磷酸二鈉、琥珀酸二鈉)、食鹽、砂糖、D-甘露醇（甜味劑）、昆布粉、糊精、昆布抽出物</td>\r\n		</tr>\r\n		<tr>\r\n			<th>容量</th>\r\n			<td>112公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>使用方法</th>\r\n			<td>4公克可調理成600c.c的高湯</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"tips\":\"\",\"information\":\"\",\"mark\":\"<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">每一份量<span>1公克</span></th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\">每份</th>\r\n			<th>每100公克</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th style=\"text-align: left;\">熱量</th>\r\n			<td>2.2大卡</td>\r\n			<td>217 大卡</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">蛋白質</th>\r\n			<td>0.2公克</td>\r\n			<td>&nbsp;15.3公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">&nbsp; &nbsp; 飽和脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">&nbsp; &nbsp; 反式脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">碳水化合物</th>\r\n			<td>&nbsp; 0.4公克</td>\r\n			<td>38.9 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">&nbsp; &nbsp; 糖</th>\r\n			<td>0.2公克</td>\r\n			<td>21.3公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">鈉</th>\r\n			<td>156毫克</td>\r\n			<td>15600 毫克</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"list_order\":\"16\"},{\"id\":\"17\",\"brand_id\":\"3\",\"brand_name\":\"amino vital\",\"brand_pic_url\":\"/uploads/brand/1567073337.png\",\"name\":\"17\",\"pic_urls\":\"/uploads/product/1558517383.png\",\"pic_alts\":\"\",\"tag\":\"\",\"content\":\"<table class=\"info-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>原料</th>\r\n			<td>調味劑(L-麩酸鈉、氯化鉀、5&#39;-次黃嘌呤核苷磷酸二鈉、5&#39;-鳥嘌呤核苷磷酸二鈉、琥珀酸二鈉)、食鹽、砂糖、D-甘露醇（甜味劑）、昆布粉、糊精、昆布抽出物</td>\r\n		</tr>\r\n		<tr>\r\n			<th>容量</th>\r\n			<td>112公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>使用方法</th>\r\n			<td>4公克可調理成600c.c的高湯</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"tips\":\"\",\"information\":\"\",\"mark\":\"<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">每一份量<span>1公克</span></th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\">每份</th>\r\n			<th>每100公克</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th style=\"text-align: left;\">熱量</th>\r\n			<td>2.2大卡</td>\r\n			<td>217 大卡</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">蛋白質</th>\r\n			<td>0.2公克</td>\r\n			<td>&nbsp;15.3公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">&nbsp; &nbsp; 飽和脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">&nbsp; &nbsp; 反式脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">碳水化合物</th>\r\n			<td>&nbsp; 0.4公克</td>\r\n			<td>38.9 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">&nbsp; &nbsp; 糖</th>\r\n			<td>0.2公克</td>\r\n			<td>21.3公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">鈉</th>\r\n			<td>156毫克</td>\r\n			<td>15600 毫克</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\",\"list_order\":\"17\"},{\"id\":\"18\",\"brand_id\":\"4\",\"brand_name\":\"品牌名稱\",\"brand_pic_url\":\"/uploads/brand/1567073345.png\",\"name\":\"18\",\"pic_urls\":\"/uploads/product/1565847840.png\",\"pic_alts\":\"圖片說明\",\"tag\":\"\",\"content\":\"商品內容\",\"tips\":\"美味秘訣\",\"information\":\"商品資訊\",\"mark\":\"營養標示\",\"list_order\":\"18\"},{\"id\":\"19\",\"brand_id\":\"5\",\"brand_name\":\"1\",\"brand_pic_url\":\"/uploads/brand/1567073352.png\",\"name\":\"19\",\"pic_urls\":\"\",\"pic_alts\":\"\",\"tag\":\"\",\"content\":\"3\",\"tips\":\"4\",\"information\":\"5\",\"mark\":\"6\",\"list_order\":\"19\"}]', '2019-11-19 13:31:22'),
(30, 0, '::1', 49, 'GET', 'ad', '', '[]', 'null', '0', '執行成功', '[{\"id\":\"1\",\"name\":\"Ajinomoto Group\",\"pic_url\":\"/uploads/ad/1567073878.png\",\"pic_alt\":\"\",\"link\":\"https://www.ajinomoto.com/en/numbers/zh/\",\"list_order\":\"1\"},{\"id\":\"2\",\"name\":\"Ajinomoto Group\",\"pic_url\":\"/uploads/ad/1567073887.png\",\"pic_alt\":\"\",\"link\":\"https://www.ajinomoto.com/en/numbers/zh/\",\"list_order\":\"1\"},{\"id\":\"3\",\"name\":\"NEWS\",\"pic_url\":\"/uploads/ad/1567073895.png\",\"pic_alt\":\"\",\"link\":\"https://www.ajinomoto.com/en/aboutus/newsletter/zh/\",\"list_order\":\"2\"},{\"id\":\"4\",\"name\":\"1\",\"pic_url\":\"/uploads/ad/1567073903.png\",\"pic_alt\":\"2\",\"link\":\"3\",\"list_order\":\"4\"}]', '2019-11-19 13:31:22'),
(31, 0, '::1', 0, 'GET', 'member', 'loginmemberdata', '[]', '\"\"', '0', '執行成功', '[{\"id\":\"1\",\"account\":\"vicwu0717@gmail.com\",\"verification\":\"9EC23092-2491-A1FF-BC1C-E01056DEC119\",\"name\":\"vic\",\"gender\":\"1\",\"birthday\":\"0000-00-00\",\"phone\":\"09188888\",\"restaurant_name\":\"vic\",\"restaurant_zipcode\":\"722\",\"restaurant_city_id\":\"15\",\"restaurant_city_name\":\"台南市\",\"restaurant_area_id\":\"234\",\"restaurant_area_name\":\"佳里區\",\"restaurant_type\":\"火鍋\",\"last_login_time\":\"2019-11-19 13:31:21\",\"last_login_ip\":\"::1\",\"status\":\"0\",\"remark\":\"\",\"c_time\":\"2019-10-17 17:38:39\",\"c_user_id\":\"2\",\"c_user_name\":\"web_server\",\"u_time\":\"2019-11-19 13:31:21\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"}]', '2019-11-19 13:31:23'),
(32, 0, '::1', 43, 'GET', 'cityarea', 'city', '[]', 'null', '0', '執行成功', '[{\"id\":\"1\",\"name\":\"基隆市\"},{\"id\":\"2\",\"name\":\"台北市\"},{\"id\":\"3\",\"name\":\"新北市\"},{\"id\":\"4\",\"name\":\"桃園市\"},{\"id\":\"5\",\"name\":\"新竹市\"},{\"id\":\"6\",\"name\":\"新竹縣\"},{\"id\":\"7\",\"name\":\"宜蘭縣\"},{\"id\":\"8\",\"name\":\"苗栗縣\"},{\"id\":\"9\",\"name\":\"台中市\"},{\"id\":\"10\",\"name\":\"彰化縣\"},{\"id\":\"11\",\"name\":\"南投縣\"},{\"id\":\"12\",\"name\":\"雲林縣\"},{\"id\":\"13\",\"name\":\"嘉義市\"},{\"id\":\"14\",\"name\":\"嘉義縣\"},{\"id\":\"15\",\"name\":\"台南市\"},{\"id\":\"16\",\"name\":\"高雄市\"},{\"id\":\"17\",\"name\":\"屏東縣\"},{\"id\":\"18\",\"name\":\"澎湖縣\"},{\"id\":\"19\",\"name\":\"花蓮縣\"},{\"id\":\"20\",\"name\":\"台東縣\"},{\"id\":\"21\",\"name\":\"金門縣\"},{\"id\":\"22\",\"name\":\"連江縣\"}]', '2019-11-19 13:31:23'),
(33, 0, '::1', 0, 'GET', 'member', 'loginmemberrecipepro', '[]', '\"\"', '0', '執行成功', '[{\"id\":\"2\",\"name\":\"2\",\"pic_url\":\"/uploads/repicepro/1567072415.png\",\"pic_alt\":\"A\",\"feature\":\"\",\"tags\":\"雞肉\",\"price\":\"999\",\"type\":\"日式\",\"style\":\"火鍋\",\"product_ids\":\"1,2,3,19\",\"product_names\":\"1,2,3,19\",\"material_weight\":\"\",\"nutrition\":\"<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n		<tr>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n		<tr>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>碳水化合物</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n		<tr>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n		<tr>\r\n			<th>碳水化合物</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n\",\"member_only\":\"0\",\"visitor\":\"69\",\"list_order\":\"2\",\"status\":\"0\",\"remark\":\"\",\"c_time\":\"2019-08-19 19:43:07\",\"c_user_id\":\"1\",\"c_user_name\":\"admin\",\"u_time\":\"2019-11-19 09:45:10\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"},{\"id\":\"4\",\"name\":\"4\",\"pic_url\":\"/uploads/repicepro/1567072415.png\",\"pic_alt\":\"A\",\"feature\":\"7\",\"tags\":\"牛肉\",\"price\":\"0\",\"type\":\"中式\",\"style\":\"火鍋\",\"product_ids\":\"1\",\"product_names\":\"1\",\"material_weight\":\"\",\"nutrition\":\"\",\"member_only\":\"0\",\"visitor\":\"12\",\"list_order\":\"4\",\"status\":\"0\",\"remark\":\"\",\"c_time\":\"2019-08-19 19:43:07\",\"c_user_id\":\"1\",\"c_user_name\":\"admin\",\"u_time\":\"2019-10-05 09:44:51\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"},{\"id\":\"5\",\"name\":\"5\",\"pic_url\":\"/uploads/repicepro/1565924165.png\",\"pic_alt\":\"3\",\"feature\":\"6\",\"tags\":\"雞肉,豬肉,根莖類,主菜,火鍋\",\"price\":\"9\",\"type\":\"素食\",\"style\":\"火鍋\",\"product_ids\":\"1\",\"product_names\":\"1\",\"material_weight\":\"\",\"nutrition\":\"1\",\"member_only\":\"1\",\"visitor\":\"3\",\"list_order\":\"5\",\"status\":\"0\",\"remark\":\"11\",\"c_time\":\"2019-08-16 10:56:05\",\"c_user_id\":\"1\",\"c_user_name\":\"admin\",\"u_time\":\"2019-09-11 09:56:20\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"}]', '2019-11-19 13:31:23'),
(34, 0, '::1', 0, 'GET', 'member', 'loginmemberhigi', '[]', '\"\"', '0', '執行成功', '[{\"id\":\"31\",\"name\":\"招客秘技名稱\",\"pic_url\":\"圖片網址\",\"pic_alt\":\"圖片說明\",\"content\":\"招客秘技內容\",\"description\":\"\",\"recipepro_id\":\"0\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":null,\"brand_name\":null,\"brand_pic_url\":null,\"brand_pic_alt\":null,\"product_id\":\"0\",\"product_name\":null,\"product_pic_urls\":null,\"product_pic_alts\":null,\"tags\":\"\",\"type\":null,\"style\":null,\"methods\":\"烹調方式\",\"note\":\"小筆記\",\"note_pic_url\":null,\"note_pic_alt\":null,\"member_only\":\"0\",\"visitor\":\"3\",\"list_order\":\"0\",\"status\":\"0\",\"remark\":\"備註\",\"c_time\":\"2019-09-12 09:37:34\",\"c_user_id\":\"1\",\"c_user_name\":\"admin\",\"u_time\":\"2019-11-19 11:38:56\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"},{\"id\":\"4\",\"name\":\"4\",\"pic_url\":\"/uploads/higi/1566285909.png\",\"pic_alt\":\"4\",\"content\":\"4\",\"description\":\"\",\"recipepro_id\":\"4\",\"recipepro_name\":\"4\",\"recipepro_pic_url\":\"/uploads/repicepro/1567072415.png\",\"recipepro_pic_alt\":\"A\",\"recipepro_member_only\":\"0\",\"brand_id\":\"1\",\"brand_name\":\"烹大師\",\"brand_pic_url\":\"/uploads/brand/1567073322.png\",\"brand_pic_alt\":\"\",\"product_id\":\"4\",\"product_name\":\"4\",\"product_pic_urls\":\"/uploads/product/1558350701.png\",\"product_pic_alts\":\"\",\"tags\":\"\",\"type\":null,\"style\":null,\"methods\":\"\",\"note\":\"3\",\"note_pic_url\":null,\"note_pic_alt\":null,\"member_only\":\"1\",\"visitor\":\"5\",\"list_order\":\"4\",\"status\":\"0\",\"remark\":\"5\",\"c_time\":\"2019-08-20 15:25:36\",\"c_user_id\":\"1\",\"c_user_name\":\"admin\",\"u_time\":\"2019-09-11 11:10:51\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"},{\"id\":\"14\",\"name\":\"14\",\"pic_url\":\"/uploads/higi/1566285909.png\",\"pic_alt\":\"14\",\"content\":\"14\",\"description\":\"\",\"recipepro_id\":\"14\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":\"1\",\"brand_name\":\"烹大師\",\"brand_pic_url\":\"/uploads/brand/1567073322.png\",\"brand_pic_alt\":\"\",\"product_id\":\"4\",\"product_name\":\"4\",\"product_pic_urls\":\"/uploads/product/1558350701.png\",\"product_pic_alts\":\"\",\"tags\":\"\",\"type\":null,\"style\":null,\"methods\":\"\",\"note\":\"\",\"note_pic_url\":null,\"note_pic_alt\":null,\"member_only\":\"1\",\"visitor\":\"1\",\"list_order\":\"14\",\"status\":\"0\",\"remark\":\"\",\"c_time\":\"2019-09-03 12:32:01\",\"c_user_id\":\"0\",\"c_user_name\":null,\"u_time\":\"2019-09-11 09:36:57\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"},{\"id\":\"24\",\"name\":\"24\",\"pic_url\":\"/uploads/higi/1566285936.png\",\"pic_alt\":\"24\",\"content\":\"24\",\"description\":\"\",\"recipepro_id\":\"24\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":\"1\",\"brand_name\":\"烹大師\",\"brand_pic_url\":\"/uploads/brand/1567073322.png\",\"brand_pic_alt\":\"\",\"product_id\":\"4\",\"product_name\":\"4\",\"product_pic_urls\":\"/uploads/product/1558350701.png\",\"product_pic_alts\":\"\",\"tags\":\"\",\"type\":null,\"style\":null,\"methods\":\"\",\"note\":\"\",\"note_pic_url\":null,\"note_pic_alt\":null,\"member_only\":\"0\",\"visitor\":\"3\",\"list_order\":\"24\",\"status\":\"0\",\"remark\":\"\",\"c_time\":\"2019-09-03 12:32:03\",\"c_user_id\":\"0\",\"c_user_name\":null,\"u_time\":\"2019-09-11 09:38:14\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"}]', '2019-11-19 13:31:23');
INSERT INTO `log` (`id`, `user_id`, `ip`, `program_id`, `method`, `endpoint`, `verb`, `args`, `file`, `resultCode`, `resultMessage`, `resultData`, `c_time`) VALUES
(35, 0, '::1', 44, 'GET', 'cityarea', 'area', '[]', 'null', '0', '執行成功', '[{\"zipcode\":\"700\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"216\",\"area_name\":\"中西區\"},{\"zipcode\":\"701\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"217\",\"area_name\":\"東區\"},{\"zipcode\":\"702\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"218\",\"area_name\":\"南區\"},{\"zipcode\":\"704\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"219\",\"area_name\":\"北區\"},{\"zipcode\":\"708\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"220\",\"area_name\":\"安平區\"},{\"zipcode\":\"709\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"221\",\"area_name\":\"安南區\"},{\"zipcode\":\"710\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"222\",\"area_name\":\"永康區\"},{\"zipcode\":\"711\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"223\",\"area_name\":\"歸仁區\"},{\"zipcode\":\"712\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"224\",\"area_name\":\"新化區\"},{\"zipcode\":\"713\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"225\",\"area_name\":\"左鎮區\"},{\"zipcode\":\"714\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"226\",\"area_name\":\"玉井區\"},{\"zipcode\":\"715\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"227\",\"area_name\":\"楠西區\"},{\"zipcode\":\"716\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"228\",\"area_name\":\"南化區\"},{\"zipcode\":\"717\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"229\",\"area_name\":\"仁德區\"},{\"zipcode\":\"718\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"230\",\"area_name\":\"關廟區\"},{\"zipcode\":\"719\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"231\",\"area_name\":\"龍崎區\"},{\"zipcode\":\"720\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"232\",\"area_name\":\"官田區\"},{\"zipcode\":\"721\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"233\",\"area_name\":\"麻豆區\"},{\"zipcode\":\"722\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"234\",\"area_name\":\"佳里區\"},{\"zipcode\":\"723\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"235\",\"area_name\":\"西港區\"},{\"zipcode\":\"724\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"236\",\"area_name\":\"七股區\"},{\"zipcode\":\"725\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"237\",\"area_name\":\"將軍區\"},{\"zipcode\":\"726\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"238\",\"area_name\":\"學甲區\"},{\"zipcode\":\"727\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"239\",\"area_name\":\"北門區\"},{\"zipcode\":\"730\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"240\",\"area_name\":\"新營區\"},{\"zipcode\":\"731\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"241\",\"area_name\":\"後壁區\"},{\"zipcode\":\"732\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"242\",\"area_name\":\"白河區\"},{\"zipcode\":\"733\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"243\",\"area_name\":\"東山區\"},{\"zipcode\":\"734\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"244\",\"area_name\":\"六甲區\"},{\"zipcode\":\"735\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"245\",\"area_name\":\"下營區\"},{\"zipcode\":\"736\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"246\",\"area_name\":\"柳營區\"},{\"zipcode\":\"737\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"247\",\"area_name\":\"鹽水區\"},{\"zipcode\":\"741\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"248\",\"area_name\":\"善化區\"},{\"zipcode\":\"742\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"249\",\"area_name\":\"大內區\"},{\"zipcode\":\"743\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"250\",\"area_name\":\"山上區\"},{\"zipcode\":\"744\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"251\",\"area_name\":\"新市區\"},{\"zipcode\":\"745\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"252\",\"area_name\":\"安定區\"}]', '2019-11-19 13:31:24'),
(36, 0, '::1', 76, 'GET', 'higi', '', '[]', 'null', '0', '執行成功', '[{\"id\":\"31\",\"name\":\"招客秘技名稱\",\"pic_url\":\"圖片網址\",\"pic_alt\":\"圖片說明\",\"content\":\"招客秘技內容\",\"description\":\"\",\"recipepro_id\":\"0\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":null,\"brand_name\":null,\"brand_pic_url\":null,\"brand_pic_alt\":null,\"product_id\":\"0\",\"product_name\":null,\"product_pic_urls\":null,\"product_pic_alts\":null,\"tags\":\"\",\"type\":\"\",\"style\":\"標籤\",\"methods\":\"烹調方式\",\"note\":\"小筆記\",\"note_pic_url\":\"\",\"note_pic_alt\":\"\",\"member_only\":\"0\",\"visitor\":\"3\",\"list_order\":\"0\"},{\"id\":\"32\",\"name\":\"測試\",\"pic_url\":\"/uploads/higi/1568252259.png\",\"pic_alt\":\"1\",\"content\":\"1\",\"description\":\"\",\"recipepro_id\":\"3\",\"recipepro_name\":\"3\",\"recipepro_pic_url\":\"/uploads/repicepro/1565924165.png\",\"recipepro_pic_alt\":\"3\",\"recipepro_member_only\":\"1\",\"brand_id\":\"5\",\"brand_name\":\"1\",\"brand_pic_url\":\"/uploads/brand/1567073352.png\",\"brand_pic_alt\":\"2\",\"product_id\":\"1\",\"product_name\":\"1\",\"product_pic_urls\":\"/uploads/product/1565848035.png,/uploads/product/1565848034.png,/uploads/product/1565848036.png,/uploads/product/1565848037.png,/uploads/product/1565848038.png,/uploads/product/1565848039.png\",\"product_pic_alts\":\"4,3,,,,\",\"tags\":\"\",\"type\":\"\",\"style\":\"前菜\",\"methods\":\"\",\"note\":\"1\",\"note_pic_url\":\"\",\"note_pic_alt\":\"\",\"member_only\":\"0\",\"visitor\":\"12\",\"list_order\":\"0\"},{\"id\":\"1\",\"name\":\"1\",\"pic_url\":\"/uploads/product/1574133959.png,/uploads/higi/1566285909.png\",\"pic_alt\":\"123,456\",\"content\":\"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\",\"description\":\"BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB\",\"recipepro_id\":\"0\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":\"5\",\"brand_name\":\"1\",\"brand_pic_url\":\"/uploads/brand/1567073352.png\",\"brand_pic_alt\":\"2\",\"product_id\":\"1\",\"product_name\":\"1\",\"product_pic_urls\":\"/uploads/product/1565848035.png,/uploads/product/1565848034.png,/uploads/product/1565848036.png,/uploads/product/1565848037.png,/uploads/product/1565848038.png,/uploads/product/1565848039.png\",\"product_pic_alts\":\"4,3,,,,\",\"tags\":\"海鮮類,豆類\",\"type\":\"韓式\",\"style\":\"麵食\",\"methods\":\"\",\"note\":\"456\",\"note_pic_url\":\"/uploads/higi/1574133162.png\",\"note_pic_alt\":\"123\",\"member_only\":\"0\",\"visitor\":\"98\",\"list_order\":\"1\"},{\"id\":\"2\",\"name\":\"2\",\"pic_url\":\"/uploads/higi/1566285936.png\",\"pic_alt\":\"2\",\"content\":\"2\",\"description\":\"\",\"recipepro_id\":\"2\",\"recipepro_name\":\"2\",\"recipepro_pic_url\":\"/uploads/repicepro/1567072415.png\",\"recipepro_pic_alt\":\"A\",\"recipepro_member_only\":\"0\",\"brand_id\":\"1\",\"brand_name\":\"烹大師\",\"brand_pic_url\":\"/uploads/brand/1567073322.png\",\"brand_pic_alt\":\"\",\"product_id\":\"2\",\"product_name\":\"2\",\"product_pic_urls\":\"/uploads/product/1567073370.png\",\"product_pic_alts\":\"\",\"tags\":\"\",\"type\":\"\",\"style\":\"主菜\",\"methods\":\"\",\"note\":\"春季\",\"note_pic_url\":\"\",\"note_pic_alt\":\"\",\"member_only\":\"0\",\"visitor\":\"11\",\"list_order\":\"2\"},{\"id\":\"3\",\"name\":\"3\",\"pic_url\":\"/uploads/higi/1566285909.png\",\"pic_alt\":\"3\",\"content\":\"3\",\"description\":\"\",\"recipepro_id\":\"3\",\"recipepro_name\":\"3\",\"recipepro_pic_url\":\"/uploads/repicepro/1565924165.png\",\"recipepro_pic_alt\":\"3\",\"recipepro_member_only\":\"1\",\"brand_id\":\"1\",\"brand_name\":\"烹大師\",\"brand_pic_url\":\"/uploads/brand/1567073322.png\",\"brand_pic_alt\":\"\",\"product_id\":\"3\",\"product_name\":\"3\",\"product_pic_urls\":\"/uploads/product/1558350652.png\",\"product_pic_alts\":\"1\",\"tags\":\"\",\"type\":\"\",\"style\":\"湯品\",\"methods\":\"\",\"note\":\"小筆記\",\"note_pic_url\":\"\",\"note_pic_alt\":\"\",\"member_only\":\"0\",\"visitor\":\"1\",\"list_order\":\"3\"},{\"id\":\"4\",\"name\":\"4\",\"pic_url\":\"/uploads/higi/1566285909.png\",\"pic_alt\":\"4\",\"content\":\"4\",\"description\":\"\",\"recipepro_id\":\"4\",\"recipepro_name\":\"4\",\"recipepro_pic_url\":\"/uploads/repicepro/1567072415.png\",\"recipepro_pic_alt\":\"A\",\"recipepro_member_only\":\"0\",\"brand_id\":\"1\",\"brand_name\":\"烹大師\",\"brand_pic_url\":\"/uploads/brand/1567073322.png\",\"brand_pic_alt\":\"\",\"product_id\":\"4\",\"product_name\":\"4\",\"product_pic_urls\":\"/uploads/product/1558350701.png\",\"product_pic_alts\":\"\",\"tags\":\"\",\"type\":\"\",\"style\":\"湯品\",\"methods\":\"\",\"note\":\"3\",\"note_pic_url\":\"\",\"note_pic_alt\":\"\",\"member_only\":\"1\",\"visitor\":\"5\",\"list_order\":\"4\"},{\"id\":\"5\",\"name\":\"5\",\"pic_url\":\"/uploads/higi/1566285909.png\",\"pic_alt\":\"5\",\"content\":\"5\",\"description\":\"\",\"recipepro_id\":\"5\",\"recipepro_name\":\"5\",\"recipepro_pic_url\":\"/uploads/repicepro/1565924165.png\",\"recipepro_pic_alt\":\"3\",\"recipepro_member_only\":\"1\",\"brand_id\":\"1\",\"brand_name\":\"烹大師\",\"brand_pic_url\":\"/uploads/brand/1567073322.png\",\"brand_pic_alt\":\"\",\"product_id\":\"5\",\"product_name\":\"5\",\"product_pic_urls\":\"/uploads/product/1558350747.png\",\"product_pic_alts\":\"\",\"tags\":\"\",\"type\":\"\",\"style\":\"湯品\",\"methods\":\"\",\"note\":\"\",\"note_pic_url\":\"\",\"note_pic_alt\":\"\",\"member_only\":\"0\",\"visitor\":\"1\",\"list_order\":\"5\"},{\"id\":\"6\",\"name\":\"6\",\"pic_url\":\"/uploads/higi/1566285909.png\",\"pic_alt\":\"6\",\"content\":\"6\",\"description\":\"\",\"recipepro_id\":\"6\",\"recipepro_name\":\"6\",\"recipepro_pic_url\":\"/uploads/repicepro/1567072415.png\",\"recipepro_pic_alt\":\"A\",\"recipepro_member_only\":\"0\",\"brand_id\":\"2\",\"brand_name\":\"VONO\",\"brand_pic_url\":\"/uploads/brand/1567073329.png\",\"brand_pic_alt\":\"\",\"product_id\":\"6\",\"product_name\":\"6\",\"product_pic_urls\":\"/uploads/product/1558418208.jpg\",\"product_pic_alts\":\"\",\"tags\":\"\",\"type\":\"\",\"style\":\"湯品\",\"methods\":\"\",\"note\":\"\",\"note_pic_url\":\"\",\"note_pic_alt\":\"\",\"member_only\":\"1\",\"visitor\":\"0\",\"list_order\":\"6\"},{\"id\":\"7\",\"name\":\"7\",\"pic_url\":\"/uploads/higi/1566285909.png\",\"pic_alt\":\"7\",\"content\":\"7\",\"description\":\"\",\"recipepro_id\":\"7\",\"recipepro_name\":\"7\",\"recipepro_pic_url\":\"/uploads/repicepro/1567072415.png\",\"recipepro_pic_alt\":\"A\",\"recipepro_member_only\":\"0\",\"brand_id\":\"2\",\"brand_name\":\"VONO\",\"brand_pic_url\":\"/uploads/brand/1567073329.png\",\"brand_pic_alt\":\"\",\"product_id\":\"7\",\"product_name\":\"7\",\"product_pic_urls\":\"/uploads/product/1558420642.jpg\",\"product_pic_alts\":\"\",\"tags\":\"\",\"type\":\"\",\"style\":\"湯品\",\"methods\":\"\",\"note\":\"\",\"note_pic_url\":\"\",\"note_pic_alt\":\"\",\"member_only\":\"1\",\"visitor\":\"0\",\"list_order\":\"7\"},{\"id\":\"8\",\"name\":\"8\",\"pic_url\":\"/uploads/higi/1566285909.png\",\"pic_alt\":\"8\",\"content\":\"8\",\"description\":\"\",\"recipepro_id\":\"8\",\"recipepro_name\":\"8\",\"recipepro_pic_url\":\"/uploads/repicepro/1567072415.png\",\"recipepro_pic_alt\":\"A\",\"recipepro_member_only\":\"0\",\"brand_id\":\"2\",\"brand_name\":\"VONO\",\"brand_pic_url\":\"/uploads/brand/1567073329.png\",\"brand_pic_alt\":\"\",\"product_id\":\"8\",\"product_name\":\"8\",\"product_pic_urls\":\"/uploads/product/1558423834.jpg\",\"product_pic_alts\":\"\",\"tags\":\"\",\"type\":\"\",\"style\":\"湯品\",\"methods\":\"\",\"note\":\"\",\"note_pic_url\":\"\",\"note_pic_alt\":\"\",\"member_only\":\"1\",\"visitor\":\"0\",\"list_order\":\"8\"},{\"id\":\"9\",\"name\":\"9\",\"pic_url\":\"/uploads/higi/1566285909.png\",\"pic_alt\":\"9\",\"content\":\"9\",\"description\":\"\",\"recipepro_id\":\"9\",\"recipepro_name\":\"9\",\"recipepro_pic_url\":\"/uploads/repicepro/1567072415.png\",\"recipepro_pic_alt\":\"A\",\"recipepro_member_only\":\"0\",\"brand_id\":\"2\",\"brand_name\":\"VONO\",\"brand_pic_url\":\"/uploads/brand/1567073329.png\",\"brand_pic_alt\":\"\",\"product_id\":\"9\",\"product_name\":\"9\",\"product_pic_urls\":\"/uploads/product/1558424084.jpg\",\"product_pic_alts\":\"\",\"tags\":\"\",\"type\":\"\",\"style\":\"湯品\",\"methods\":\"\",\"note\":\"\",\"note_pic_url\":\"\",\"note_pic_alt\":\"\",\"member_only\":\"1\",\"visitor\":\"0\",\"list_order\":\"9\"},{\"id\":\"10\",\"name\":\"10\",\"pic_url\":\"/uploads/higi/1566285909.png\",\"pic_alt\":\"10\",\"content\":\"10\",\"description\":\"\",\"recipepro_id\":\"10\",\"recipepro_name\":\"10\",\"recipepro_pic_url\":\"/uploads/repicepro/1567072415.png\",\"recipepro_pic_alt\":\"A\",\"recipepro_member_only\":\"0\",\"brand_id\":\"2\",\"brand_name\":\"VONO\",\"brand_pic_url\":\"/uploads/brand/1567073329.png\",\"brand_pic_alt\":\"\",\"product_id\":\"10\",\"product_name\":\"10\",\"product_pic_urls\":\"/uploads/product/1558520127.jpg\",\"product_pic_alts\":\"\",\"tags\":\"\",\"type\":\"\",\"style\":\"湯品\",\"methods\":\"\",\"note\":\"\",\"note_pic_url\":\"\",\"note_pic_alt\":\"\",\"member_only\":\"1\",\"visitor\":\"0\",\"list_order\":\"10\"},{\"id\":\"11\",\"name\":\"11\",\"pic_url\":\"/uploads/higi/1566285909.png\",\"pic_alt\":\"11\",\"content\":\"11\",\"description\":\"\",\"recipepro_id\":\"11\",\"recipepro_name\":\"11\",\"recipepro_pic_url\":\"/uploads/repicepro/1567072415.png\",\"recipepro_pic_alt\":\"A\",\"recipepro_member_only\":\"0\",\"brand_id\":\"5\",\"brand_name\":\"1\",\"brand_pic_url\":\"/uploads/brand/1567073352.png\",\"brand_pic_alt\":\"2\",\"product_id\":\"1\",\"product_name\":\"1\",\"product_pic_urls\":\"/uploads/product/1565848035.png,/uploads/product/1565848034.png,/uploads/product/1565848036.png,/uploads/product/1565848037.png,/uploads/product/1565848038.png,/uploads/product/1565848039.png\",\"product_pic_alts\":\"4,3,,,,\",\"tags\":\"\",\"type\":\"\",\"style\":\"湯品\",\"methods\":\"\",\"note\":\"\",\"note_pic_url\":\"\",\"note_pic_alt\":\"\",\"member_only\":\"1\",\"visitor\":\"0\",\"list_order\":\"11\"},{\"id\":\"12\",\"name\":\"12\",\"pic_url\":\"/uploads/higi/1566285909.png\",\"pic_alt\":\"12\",\"content\":\"12\",\"description\":\"\",\"recipepro_id\":\"12\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":\"1\",\"brand_name\":\"烹大師\",\"brand_pic_url\":\"/uploads/brand/1567073322.png\",\"brand_pic_alt\":\"\",\"product_id\":\"2\",\"product_name\":\"2\",\"product_pic_urls\":\"/uploads/product/1567073370.png\",\"product_pic_alts\":\"\",\"tags\":\"\",\"type\":\"\",\"style\":\"湯品\",\"methods\":\"\",\"note\":\"\",\"note_pic_url\":\"\",\"note_pic_alt\":\"\",\"member_only\":\"1\",\"visitor\":\"3\",\"list_order\":\"12\"},{\"id\":\"13\",\"name\":\"13\",\"pic_url\":\"/uploads/higi/1566285909.png\",\"pic_alt\":\"13\",\"content\":\"13\",\"description\":\"\",\"recipepro_id\":\"13\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":\"1\",\"brand_name\":\"烹大師\",\"brand_pic_url\":\"/uploads/brand/1567073322.png\",\"brand_pic_alt\":\"\",\"product_id\":\"3\",\"product_name\":\"3\",\"product_pic_urls\":\"/uploads/product/1558350652.png\",\"product_pic_alts\":\"1\",\"tags\":\"\",\"type\":\"\",\"style\":\"湯品\",\"methods\":\"\",\"note\":\"\",\"note_pic_url\":\"\",\"note_pic_alt\":\"\",\"member_only\":\"1\",\"visitor\":\"0\",\"list_order\":\"13\"},{\"id\":\"14\",\"name\":\"14\",\"pic_url\":\"/uploads/higi/1566285909.png\",\"pic_alt\":\"14\",\"content\":\"14\",\"description\":\"\",\"recipepro_id\":\"14\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":\"1\",\"brand_name\":\"烹大師\",\"brand_pic_url\":\"/uploads/brand/1567073322.png\",\"brand_pic_alt\":\"\",\"product_id\":\"4\",\"product_name\":\"4\",\"product_pic_urls\":\"/uploads/product/1558350701.png\",\"product_pic_alts\":\"\",\"tags\":\"\",\"type\":\"\",\"style\":\"湯品\",\"methods\":\"\",\"note\":\"\",\"note_pic_url\":\"\",\"note_pic_alt\":\"\",\"member_only\":\"1\",\"visitor\":\"1\",\"list_order\":\"14\"},{\"id\":\"15\",\"name\":\"15\",\"pic_url\":\"/uploads/higi/1566285909.png\",\"pic_alt\":\"15\",\"content\":\"15\",\"description\":\"\",\"recipepro_id\":\"15\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":\"1\",\"brand_name\":\"烹大師\",\"brand_pic_url\":\"/uploads/brand/1567073322.png\",\"brand_pic_alt\":\"\",\"product_id\":\"5\",\"product_name\":\"5\",\"product_pic_urls\":\"/uploads/product/1558350747.png\",\"product_pic_alts\":\"\",\"tags\":\"\",\"type\":\"\",\"style\":\"湯品\",\"methods\":\"\",\"note\":\"\",\"note_pic_url\":\"\",\"note_pic_alt\":\"\",\"member_only\":\"1\",\"visitor\":\"0\",\"list_order\":\"15\"},{\"id\":\"16\",\"name\":\"16\",\"pic_url\":\"/uploads/higi/1566285936.png\",\"pic_alt\":\"16\",\"content\":\"16\",\"description\":\"\",\"recipepro_id\":\"16\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":\"2\",\"brand_name\":\"VONO\",\"brand_pic_url\":\"/uploads/brand/1567073329.png\",\"brand_pic_alt\":\"\",\"product_id\":\"6\",\"product_name\":\"6\",\"product_pic_urls\":\"/uploads/product/1558418208.jpg\",\"product_pic_alts\":\"\",\"tags\":\"\",\"type\":\"\",\"style\":\"湯品\",\"methods\":\"\",\"note\":\"\",\"note_pic_url\":\"\",\"note_pic_alt\":\"\",\"member_only\":\"0\",\"visitor\":\"0\",\"list_order\":\"16\"},{\"id\":\"17\",\"name\":\"17\",\"pic_url\":\"/uploads/higi/1566285936.png\",\"pic_alt\":\"17\",\"content\":\"17\",\"description\":\"\",\"recipepro_id\":\"17\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":\"2\",\"brand_name\":\"VONO\",\"brand_pic_url\":\"/uploads/brand/1567073329.png\",\"brand_pic_alt\":\"\",\"product_id\":\"7\",\"product_name\":\"7\",\"product_pic_urls\":\"/uploads/product/1558420642.jpg\",\"product_pic_alts\":\"\",\"tags\":\"\",\"type\":\"\",\"style\":\"湯品\",\"methods\":\"\",\"note\":\"\",\"note_pic_url\":\"\",\"note_pic_alt\":\"\",\"member_only\":\"0\",\"visitor\":\"0\",\"list_order\":\"17\"},{\"id\":\"18\",\"name\":\"18\",\"pic_url\":\"/uploads/higi/1566285936.png\",\"pic_alt\":\"18\",\"content\":\"18\",\"description\":\"\",\"recipepro_id\":\"18\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":\"2\",\"brand_name\":\"VONO\",\"brand_pic_url\":\"/uploads/brand/1567073329.png\",\"brand_pic_alt\":\"\",\"product_id\":\"8\",\"product_name\":\"8\",\"product_pic_urls\":\"/uploads/product/1558423834.jpg\",\"product_pic_alts\":\"\",\"tags\":\"\",\"type\":\"\",\"style\":\"湯品\",\"methods\":\"\",\"note\":\"\",\"note_pic_url\":\"\",\"note_pic_alt\":\"\",\"member_only\":\"0\",\"visitor\":\"0\",\"list_order\":\"18\"},{\"id\":\"19\",\"name\":\"19\",\"pic_url\":\"/uploads/higi/1566285936.png\",\"pic_alt\":\"19\",\"content\":\"19\",\"description\":\"\",\"recipepro_id\":\"19\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":\"2\",\"brand_name\":\"VONO\",\"brand_pic_url\":\"/uploads/brand/1567073329.png\",\"brand_pic_alt\":\"\",\"product_id\":\"9\",\"product_name\":\"9\",\"product_pic_urls\":\"/uploads/product/1558424084.jpg\",\"product_pic_alts\":\"\",\"tags\":\"\",\"type\":\"\",\"style\":\"湯品\",\"methods\":\"\",\"note\":\"\",\"note_pic_url\":\"\",\"note_pic_alt\":\"\",\"member_only\":\"0\",\"visitor\":\"0\",\"list_order\":\"19\"},{\"id\":\"20\",\"name\":\"20\",\"pic_url\":\"/uploads/higi/1566285936.png\",\"pic_alt\":\"20\",\"content\":\"20\",\"description\":\"\",\"recipepro_id\":\"20\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":\"2\",\"brand_name\":\"VONO\",\"brand_pic_url\":\"/uploads/brand/1567073329.png\",\"brand_pic_alt\":\"\",\"product_id\":\"10\",\"product_name\":\"10\",\"product_pic_urls\":\"/uploads/product/1558520127.jpg\",\"product_pic_alts\":\"\",\"tags\":\"\",\"type\":\"\",\"style\":\"湯品\",\"methods\":\"\",\"note\":\"\",\"note_pic_url\":\"\",\"note_pic_alt\":\"\",\"member_only\":\"0\",\"visitor\":\"0\",\"list_order\":\"20\"},{\"id\":\"21\",\"name\":\"21\",\"pic_url\":\"/uploads/higi/1566285936.png\",\"pic_alt\":\"21\",\"content\":\"21\",\"description\":\"\",\"recipepro_id\":\"21\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":\"5\",\"brand_name\":\"1\",\"brand_pic_url\":\"/uploads/brand/1567073352.png\",\"brand_pic_alt\":\"2\",\"product_id\":\"1\",\"product_name\":\"1\",\"product_pic_urls\":\"/uploads/product/1565848035.png,/uploads/product/1565848034.png,/uploads/product/1565848036.png,/uploads/product/1565848037.png,/uploads/product/1565848038.png,/uploads/product/1565848039.png\",\"product_pic_alts\":\"4,3,,,,\",\"tags\":\"\",\"type\":\"\",\"style\":\"湯品\",\"methods\":\"\",\"note\":\"\",\"note_pic_url\":\"\",\"note_pic_alt\":\"\",\"member_only\":\"0\",\"visitor\":\"3\",\"list_order\":\"21\"},{\"id\":\"22\",\"name\":\"22\",\"pic_url\":\"/uploads/higi/1566285936.png\",\"pic_alt\":\"22\",\"content\":\"22\",\"description\":\"\",\"recipepro_id\":\"22\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":\"1\",\"brand_name\":\"烹大師\",\"brand_pic_url\":\"/uploads/brand/1567073322.png\",\"brand_pic_alt\":\"\",\"product_id\":\"2\",\"product_name\":\"2\",\"product_pic_urls\":\"/uploads/product/1567073370.png\",\"product_pic_alts\":\"\",\"tags\":\"\",\"type\":\"\",\"style\":\"湯品\",\"methods\":\"\",\"note\":\"\",\"note_pic_url\":\"\",\"note_pic_alt\":\"\",\"member_only\":\"0\",\"visitor\":\"0\",\"list_order\":\"22\"},{\"id\":\"23\",\"name\":\"23\",\"pic_url\":\"/uploads/higi/1566285936.png\",\"pic_alt\":\"23\",\"content\":\"23\",\"description\":\"\",\"recipepro_id\":\"23\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":\"1\",\"brand_name\":\"烹大師\",\"brand_pic_url\":\"/uploads/brand/1567073322.png\",\"brand_pic_alt\":\"\",\"product_id\":\"3\",\"product_name\":\"3\",\"product_pic_urls\":\"/uploads/product/1558350652.png\",\"product_pic_alts\":\"1\",\"tags\":\"\",\"type\":\"\",\"style\":\"湯品\",\"methods\":\"\",\"note\":\"\",\"note_pic_url\":\"\",\"note_pic_alt\":\"\",\"member_only\":\"0\",\"visitor\":\"0\",\"list_order\":\"23\"},{\"id\":\"24\",\"name\":\"24\",\"pic_url\":\"/uploads/higi/1566285936.png\",\"pic_alt\":\"24\",\"content\":\"24\",\"description\":\"\",\"recipepro_id\":\"24\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":\"1\",\"brand_name\":\"烹大師\",\"brand_pic_url\":\"/uploads/brand/1567073322.png\",\"brand_pic_alt\":\"\",\"product_id\":\"4\",\"product_name\":\"4\",\"product_pic_urls\":\"/uploads/product/1558350701.png\",\"product_pic_alts\":\"\",\"tags\":\"\",\"type\":\"\",\"style\":\"湯品\",\"methods\":\"\",\"note\":\"\",\"note_pic_url\":\"\",\"note_pic_alt\":\"\",\"member_only\":\"0\",\"visitor\":\"3\",\"list_order\":\"24\"},{\"id\":\"25\",\"name\":\"25\",\"pic_url\":\"/uploads/higi/1566285936.png\",\"pic_alt\":\"25\",\"content\":\"25\",\"description\":\"\",\"recipepro_id\":\"25\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":\"1\",\"brand_name\":\"烹大師\",\"brand_pic_url\":\"/uploads/brand/1567073322.png\",\"brand_pic_alt\":\"\",\"product_id\":\"5\",\"product_name\":\"5\",\"product_pic_urls\":\"/uploads/product/1558350747.png\",\"product_pic_alts\":\"\",\"tags\":\"\",\"type\":\"\",\"style\":\"湯品\",\"methods\":\"\",\"note\":\"\",\"note_pic_url\":\"\",\"note_pic_alt\":\"\",\"member_only\":\"0\",\"visitor\":\"0\",\"list_order\":\"25\"},{\"id\":\"26\",\"name\":\"26\",\"pic_url\":\"/uploads/higi/1566285936.png\",\"pic_alt\":\"26\",\"content\":\"26\",\"description\":\"\",\"recipepro_id\":\"26\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":\"2\",\"brand_name\":\"VONO\",\"brand_pic_url\":\"/uploads/brand/1567073329.png\",\"brand_pic_alt\":\"\",\"product_id\":\"6\",\"product_name\":\"6\",\"product_pic_urls\":\"/uploads/product/1558418208.jpg\",\"product_pic_alts\":\"\",\"tags\":\"\",\"type\":\"\",\"style\":\"湯品\",\"methods\":\"\",\"note\":\"\",\"note_pic_url\":\"\",\"note_pic_alt\":\"\",\"member_only\":\"0\",\"visitor\":\"0\",\"list_order\":\"26\"},{\"id\":\"27\",\"name\":\"27\",\"pic_url\":\"/uploads/higi/1566285936.png\",\"pic_alt\":\"27\",\"content\":\"27\",\"description\":\"\",\"recipepro_id\":\"27\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":\"2\",\"brand_name\":\"VONO\",\"brand_pic_url\":\"/uploads/brand/1567073329.png\",\"brand_pic_alt\":\"\",\"product_id\":\"7\",\"product_name\":\"7\",\"product_pic_urls\":\"/uploads/product/1558420642.jpg\",\"product_pic_alts\":\"\",\"tags\":\"\",\"type\":\"\",\"style\":\"湯品\",\"methods\":\"\",\"note\":\"\",\"note_pic_url\":\"\",\"note_pic_alt\":\"\",\"member_only\":\"0\",\"visitor\":\"0\",\"list_order\":\"27\"},{\"id\":\"28\",\"name\":\"28\",\"pic_url\":\"/uploads/higi/1566285936.png\",\"pic_alt\":\"28\",\"content\":\"28\",\"description\":\"\",\"recipepro_id\":\"28\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":\"2\",\"brand_name\":\"VONO\",\"brand_pic_url\":\"/uploads/brand/1567073329.png\",\"brand_pic_alt\":\"\",\"product_id\":\"8\",\"product_name\":\"8\",\"product_pic_urls\":\"/uploads/product/1558423834.jpg\",\"product_pic_alts\":\"\",\"tags\":\"\",\"type\":\"\",\"style\":\"湯品\",\"methods\":\"\",\"note\":\"\",\"note_pic_url\":\"\",\"note_pic_alt\":\"\",\"member_only\":\"0\",\"visitor\":\"0\",\"list_order\":\"28\"},{\"id\":\"29\",\"name\":\"29\",\"pic_url\":\"/uploads/higi/1566285936.png\",\"pic_alt\":\"29\",\"content\":\"29\",\"description\":\"\",\"recipepro_id\":\"29\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":\"2\",\"brand_name\":\"VONO\",\"brand_pic_url\":\"/uploads/brand/1567073329.png\",\"brand_pic_alt\":\"\",\"product_id\":\"9\",\"product_name\":\"9\",\"product_pic_urls\":\"/uploads/product/1558424084.jpg\",\"product_pic_alts\":\"\",\"tags\":\"\",\"type\":\"\",\"style\":\"湯品\",\"methods\":\"\",\"note\":\"\",\"note_pic_url\":\"\",\"note_pic_alt\":\"\",\"member_only\":\"0\",\"visitor\":\"0\",\"list_order\":\"29\"},{\"id\":\"30\",\"name\":\"30\",\"pic_url\":\"/uploads/higi/1566285936.png\",\"pic_alt\":\"30\",\"content\":\"30\",\"description\":\"\",\"recipepro_id\":\"30\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":\"2\",\"brand_name\":\"VONO\",\"brand_pic_url\":\"/uploads/brand/1567073329.png\",\"brand_pic_alt\":\"\",\"product_id\":\"10\",\"product_name\":\"10\",\"product_pic_urls\":\"/uploads/product/1558520127.jpg\",\"product_pic_alts\":\"\",\"tags\":\"\",\"type\":\"\",\"style\":\"湯品\",\"methods\":\"\",\"note\":\"\",\"note_pic_url\":\"\",\"note_pic_alt\":\"\",\"member_only\":\"0\",\"visitor\":\"0\",\"list_order\":\"30\"}]', '2019-11-19 13:31:31'),
(37, 0, '::1', 93, 'GET', 'tag', '', '[]', 'null', '0', '執行成功', '[{\"id\":\"1\",\"category_id\":\"1\",\"category_name\":\"食材\",\"name\":\"雞肉\",\"list_order\":\"0\"},{\"id\":\"2\",\"category_id\":\"1\",\"category_name\":\"食材\",\"name\":\"豬肉\",\"list_order\":\"0\"},{\"id\":\"3\",\"category_id\":\"1\",\"category_name\":\"食材\",\"name\":\"牛肉\",\"list_order\":\"0\"},{\"id\":\"4\",\"category_id\":\"1\",\"category_name\":\"食材\",\"name\":\"海鮮類\",\"list_order\":\"0\"},{\"id\":\"5\",\"category_id\":\"1\",\"category_name\":\"食材\",\"name\":\"葉菜類\",\"list_order\":\"0\"},{\"id\":\"6\",\"category_id\":\"1\",\"category_name\":\"食材\",\"name\":\"根莖類\",\"list_order\":\"0\"},{\"id\":\"7\",\"category_id\":\"1\",\"category_name\":\"食材\",\"name\":\"瓜果類\",\"list_order\":\"0\"},{\"id\":\"8\",\"category_id\":\"1\",\"category_name\":\"食材\",\"name\":\"菇蕈類\",\"list_order\":\"0\"},{\"id\":\"9\",\"category_id\":\"1\",\"category_name\":\"食材\",\"name\":\"豆類\",\"list_order\":\"0\"},{\"id\":\"10\",\"category_id\":\"1\",\"category_name\":\"食材\",\"name\":\"蛋\",\"list_order\":\"0\"},{\"id\":\"11\",\"category_id\":\"1\",\"category_name\":\"食材\",\"name\":\"其他\",\"list_order\":\"0\"}]', '2019-11-19 13:31:31'),
(38, 0, '::1', 93, 'GET', 'tag', '', '[]', 'null', '0', '執行成功', '[{\"id\":\"12\",\"category_id\":\"2\",\"category_name\":\"菜色\",\"name\":\"中式\",\"list_order\":\"0\"},{\"id\":\"13\",\"category_id\":\"2\",\"category_name\":\"菜色\",\"name\":\"日式\",\"list_order\":\"0\"},{\"id\":\"14\",\"category_id\":\"2\",\"category_name\":\"菜色\",\"name\":\"西式\",\"list_order\":\"0\"},{\"id\":\"15\",\"category_id\":\"2\",\"category_name\":\"菜色\",\"name\":\"韓式\",\"list_order\":\"0\"},{\"id\":\"16\",\"category_id\":\"2\",\"category_name\":\"菜色\",\"name\":\"小吃\",\"list_order\":\"0\"},{\"id\":\"17\",\"category_id\":\"2\",\"category_name\":\"菜色\",\"name\":\"素食\",\"list_order\":\"0\"}]', '2019-11-19 13:31:31'),
(39, 0, '::1', 93, 'GET', 'tag', '', '[]', 'null', '0', '執行成功', '[{\"id\":\"18\",\"category_id\":\"3\",\"category_name\":\"菜式\",\"name\":\"主菜\",\"list_order\":\"0\"},{\"id\":\"19\",\"category_id\":\"3\",\"category_name\":\"菜式\",\"name\":\"前菜\",\"list_order\":\"0\"},{\"id\":\"20\",\"category_id\":\"3\",\"category_name\":\"菜式\",\"name\":\"湯品\",\"list_order\":\"0\"},{\"id\":\"21\",\"category_id\":\"3\",\"category_name\":\"菜式\",\"name\":\"火鍋\",\"list_order\":\"0\"},{\"id\":\"22\",\"category_id\":\"3\",\"category_name\":\"菜式\",\"name\":\"飯食\",\"list_order\":\"0\"},{\"id\":\"23\",\"category_id\":\"3\",\"category_name\":\"菜式\",\"name\":\"麵食\",\"list_order\":\"0\"},{\"id\":\"24\",\"category_id\":\"3\",\"category_name\":\"菜式\",\"name\":\"粥品\",\"list_order\":\"0\"},{\"id\":\"25\",\"category_id\":\"3\",\"category_name\":\"菜式\",\"name\":\"羹類\",\"list_order\":\"0\"},{\"id\":\"26\",\"category_id\":\"3\",\"category_name\":\"菜式\",\"name\":\"點心\",\"list_order\":\"0\"},{\"id\":\"27\",\"category_id\":\"3\",\"category_name\":\"菜式\",\"name\":\"其他\",\"list_order\":\"0\"}]', '2019-11-19 13:31:31'),
(40, 0, '::1', 76, 'GET', 'higi', '', '[\"1\"]', 'null', '0', '執行成功', '[{\"id\":\"1\",\"name\":\"1\",\"pic_url\":\"/uploads/product/1574133959.png,/uploads/higi/1566285909.png\",\"pic_alt\":\"123,456\",\"content\":\"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\",\"description\":\"BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB\",\"recipepro_id\":\"0\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":\"5\",\"brand_name\":\"1\",\"brand_pic_url\":\"/uploads/brand/1567073352.png\",\"brand_pic_alt\":\"2\",\"product_id\":\"1\",\"product_name\":\"1\",\"product_pic_urls\":\"/uploads/product/1565848035.png,/uploads/product/1565848034.png,/uploads/product/1565848036.png,/uploads/product/1565848037.png,/uploads/product/1565848038.png,/uploads/product/1565848039.png\",\"product_pic_alts\":\"4,3,,,,\",\"tags\":\"海鮮類,豆類\",\"type\":\"韓式\",\"style\":\"麵食\",\"methods\":\"\",\"note\":\"456\",\"note_pic_url\":\"/uploads/higi/1574133162.png\",\"note_pic_alt\":\"123\",\"member_only\":\"0\",\"visitor\":\"98\",\"list_order\":\"1\"}]', '2019-11-19 13:31:35'),
(41, 0, '::1', 76, 'GET', 'higi', '', '[]', 'null', '0', '執行成功', '[{\"id\":\"32\",\"name\":\"測試\",\"pic_url\":\"/uploads/higi/1568252259.png\",\"pic_alt\":\"1\",\"content\":\"1\",\"description\":\"\",\"recipepro_id\":\"3\",\"recipepro_name\":\"3\",\"recipepro_pic_url\":\"/uploads/repicepro/1565924165.png\",\"recipepro_pic_alt\":\"3\",\"recipepro_member_only\":\"1\",\"brand_id\":\"5\",\"brand_name\":\"1\",\"brand_pic_url\":\"/uploads/brand/1567073352.png\",\"brand_pic_alt\":\"2\",\"product_id\":\"1\",\"product_name\":\"1\",\"product_pic_urls\":\"/uploads/product/1565848035.png,/uploads/product/1565848034.png,/uploads/product/1565848036.png,/uploads/product/1565848037.png,/uploads/product/1565848038.png,/uploads/product/1565848039.png\",\"product_pic_alts\":\"4,3,,,,\",\"tags\":\"\",\"type\":\"\",\"style\":\"前菜\",\"methods\":\"\",\"note\":\"1\",\"note_pic_url\":\"\",\"note_pic_alt\":\"\",\"member_only\":\"0\",\"visitor\":\"12\",\"list_order\":\"0\"},{\"id\":\"1\",\"name\":\"1\",\"pic_url\":\"/uploads/product/1574133959.png,/uploads/higi/1566285909.png\",\"pic_alt\":\"123,456\",\"content\":\"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\",\"description\":\"BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB\",\"recipepro_id\":\"0\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":\"5\",\"brand_name\":\"1\",\"brand_pic_url\":\"/uploads/brand/1567073352.png\",\"brand_pic_alt\":\"2\",\"product_id\":\"1\",\"product_name\":\"1\",\"product_pic_urls\":\"/uploads/product/1565848035.png,/uploads/product/1565848034.png,/uploads/product/1565848036.png,/uploads/product/1565848037.png,/uploads/product/1565848038.png,/uploads/product/1565848039.png\",\"product_pic_alts\":\"4,3,,,,\",\"tags\":\"海鮮類,豆類\",\"type\":\"韓式\",\"style\":\"麵食\",\"methods\":\"\",\"note\":\"456\",\"note_pic_url\":\"/uploads/higi/1574133162.png\",\"note_pic_alt\":\"123\",\"member_only\":\"0\",\"visitor\":\"98\",\"list_order\":\"1\"},{\"id\":\"11\",\"name\":\"11\",\"pic_url\":\"/uploads/higi/1566285909.png\",\"pic_alt\":\"11\",\"content\":\"11\",\"description\":\"\",\"recipepro_id\":\"11\",\"recipepro_name\":\"11\",\"recipepro_pic_url\":\"/uploads/repicepro/1567072415.png\",\"recipepro_pic_alt\":\"A\",\"recipepro_member_only\":\"0\",\"brand_id\":\"5\",\"brand_name\":\"1\",\"brand_pic_url\":\"/uploads/brand/1567073352.png\",\"brand_pic_alt\":\"2\",\"product_id\":\"1\",\"product_name\":\"1\",\"product_pic_urls\":\"/uploads/product/1565848035.png,/uploads/product/1565848034.png,/uploads/product/1565848036.png,/uploads/product/1565848037.png,/uploads/product/1565848038.png,/uploads/product/1565848039.png\",\"product_pic_alts\":\"4,3,,,,\",\"tags\":\"\",\"type\":\"\",\"style\":\"湯品\",\"methods\":\"\",\"note\":\"\",\"note_pic_url\":\"\",\"note_pic_alt\":\"\",\"member_only\":\"1\",\"visitor\":\"0\",\"list_order\":\"11\"},{\"id\":\"21\",\"name\":\"21\",\"pic_url\":\"/uploads/higi/1566285936.png\",\"pic_alt\":\"21\",\"content\":\"21\",\"description\":\"\",\"recipepro_id\":\"21\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":\"5\",\"brand_name\":\"1\",\"brand_pic_url\":\"/uploads/brand/1567073352.png\",\"brand_pic_alt\":\"2\",\"product_id\":\"1\",\"product_name\":\"1\",\"product_pic_urls\":\"/uploads/product/1565848035.png,/uploads/product/1565848034.png,/uploads/product/1565848036.png,/uploads/product/1565848037.png,/uploads/product/1565848038.png,/uploads/product/1565848039.png\",\"product_pic_alts\":\"4,3,,,,\",\"tags\":\"\",\"type\":\"\",\"style\":\"湯品\",\"methods\":\"\",\"note\":\"\",\"note_pic_url\":\"\",\"note_pic_alt\":\"\",\"member_only\":\"0\",\"visitor\":\"3\",\"list_order\":\"21\"}]', '2019-11-19 13:31:35'),
(42, 0, '::1', 0, 'GET', 'member', 'loginmemberhigi', '[]', '\"\"', '0', '執行成功', 'null', '2019-11-19 13:31:35'),
(43, 0, '::1', 0, 'POST', 'user', 'login', '[]', '\"\"', '0', '執行成功', '{\"token\":\"E9BE9A91-3C65-B09B-37B9-3AA4CCD1086F\"}', '2019-11-19 13:31:35'),
(44, 2, '::1', 87, 'PUT', 'higi', 'addvisitor', '[\"1\"]', '\"\"', '0', '執行成功', '{\"id\":\"1\"}', '2019-11-19 13:31:35'),
(45, 0, '::1', 0, 'POST', 'user', 'logout', '[]', '\"\"', '0', '執行成功', 'null', '2019-11-19 13:31:35'),
(46, 0, '::1', 0, 'POST', 'member', 'loginmemberhigi', '[]', '\"\"', '0', '執行成功', '{\"member_id\":\"1\",\"higi_id\":\"1\"}', '2019-11-19 13:31:37'),
(47, 0, '::1', 0, 'GET', 'member', 'loginmemberdata', '[]', '\"\"', '0', '執行成功', '[{\"id\":\"1\",\"account\":\"vicwu0717@gmail.com\",\"verification\":\"9EC23092-2491-A1FF-BC1C-E01056DEC119\",\"name\":\"vic\",\"gender\":\"1\",\"birthday\":\"0000-00-00\",\"phone\":\"09188888\",\"restaurant_name\":\"vic\",\"restaurant_zipcode\":\"722\",\"restaurant_city_id\":\"15\",\"restaurant_city_name\":\"台南市\",\"restaurant_area_id\":\"234\",\"restaurant_area_name\":\"佳里區\",\"restaurant_type\":\"火鍋\",\"last_login_time\":\"2019-11-19 13:31:21\",\"last_login_ip\":\"::1\",\"status\":\"0\",\"remark\":\"\",\"c_time\":\"2019-10-17 17:38:39\",\"c_user_id\":\"2\",\"c_user_name\":\"web_server\",\"u_time\":\"2019-11-19 13:31:21\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"}]', '2019-11-19 13:31:51'),
(48, 0, '::1', 43, 'GET', 'cityarea', 'city', '[]', 'null', '0', '執行成功', '[{\"id\":\"1\",\"name\":\"基隆市\"},{\"id\":\"2\",\"name\":\"台北市\"},{\"id\":\"3\",\"name\":\"新北市\"},{\"id\":\"4\",\"name\":\"桃園市\"},{\"id\":\"5\",\"name\":\"新竹市\"},{\"id\":\"6\",\"name\":\"新竹縣\"},{\"id\":\"7\",\"name\":\"宜蘭縣\"},{\"id\":\"8\",\"name\":\"苗栗縣\"},{\"id\":\"9\",\"name\":\"台中市\"},{\"id\":\"10\",\"name\":\"彰化縣\"},{\"id\":\"11\",\"name\":\"南投縣\"},{\"id\":\"12\",\"name\":\"雲林縣\"},{\"id\":\"13\",\"name\":\"嘉義市\"},{\"id\":\"14\",\"name\":\"嘉義縣\"},{\"id\":\"15\",\"name\":\"台南市\"},{\"id\":\"16\",\"name\":\"高雄市\"},{\"id\":\"17\",\"name\":\"屏東縣\"},{\"id\":\"18\",\"name\":\"澎湖縣\"},{\"id\":\"19\",\"name\":\"花蓮縣\"},{\"id\":\"20\",\"name\":\"台東縣\"},{\"id\":\"21\",\"name\":\"金門縣\"},{\"id\":\"22\",\"name\":\"連江縣\"}]', '2019-11-19 13:31:51'),
(49, 0, '::1', 0, 'GET', 'member', 'loginmemberrecipepro', '[]', '\"\"', '0', '執行成功', '[{\"id\":\"2\",\"name\":\"2\",\"pic_url\":\"/uploads/repicepro/1567072415.png\",\"pic_alt\":\"A\",\"feature\":\"\",\"tags\":\"雞肉\",\"price\":\"999\",\"type\":\"日式\",\"style\":\"火鍋\",\"product_ids\":\"1,2,3,19\",\"product_names\":\"1,2,3,19\",\"material_weight\":\"\",\"nutrition\":\"<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n		<tr>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n		<tr>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>碳水化合物</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n		<tr>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n		<tr>\r\n			<th>碳水化合物</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n\",\"member_only\":\"0\",\"visitor\":\"69\",\"list_order\":\"2\",\"status\":\"0\",\"remark\":\"\",\"c_time\":\"2019-08-19 19:43:07\",\"c_user_id\":\"1\",\"c_user_name\":\"admin\",\"u_time\":\"2019-11-19 09:45:10\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"},{\"id\":\"4\",\"name\":\"4\",\"pic_url\":\"/uploads/repicepro/1567072415.png\",\"pic_alt\":\"A\",\"feature\":\"7\",\"tags\":\"牛肉\",\"price\":\"0\",\"type\":\"中式\",\"style\":\"火鍋\",\"product_ids\":\"1\",\"product_names\":\"1\",\"material_weight\":\"\",\"nutrition\":\"\",\"member_only\":\"0\",\"visitor\":\"12\",\"list_order\":\"4\",\"status\":\"0\",\"remark\":\"\",\"c_time\":\"2019-08-19 19:43:07\",\"c_user_id\":\"1\",\"c_user_name\":\"admin\",\"u_time\":\"2019-10-05 09:44:51\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"},{\"id\":\"5\",\"name\":\"5\",\"pic_url\":\"/uploads/repicepro/1565924165.png\",\"pic_alt\":\"3\",\"feature\":\"6\",\"tags\":\"雞肉,豬肉,根莖類,主菜,火鍋\",\"price\":\"9\",\"type\":\"素食\",\"style\":\"火鍋\",\"product_ids\":\"1\",\"product_names\":\"1\",\"material_weight\":\"\",\"nutrition\":\"1\",\"member_only\":\"1\",\"visitor\":\"3\",\"list_order\":\"5\",\"status\":\"0\",\"remark\":\"11\",\"c_time\":\"2019-08-16 10:56:05\",\"c_user_id\":\"1\",\"c_user_name\":\"admin\",\"u_time\":\"2019-09-11 09:56:20\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"}]', '2019-11-19 13:31:51'),
(50, 0, '::1', 0, 'GET', 'member', 'loginmemberhigi', '[]', '\"\"', '0', '執行成功', '[{\"id\":\"31\",\"name\":\"招客秘技名稱\",\"pic_url\":\"圖片網址\",\"pic_alt\":\"圖片說明\",\"content\":\"招客秘技內容\",\"description\":\"\",\"recipepro_id\":\"0\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":null,\"brand_name\":null,\"brand_pic_url\":null,\"brand_pic_alt\":null,\"product_id\":\"0\",\"product_name\":null,\"product_pic_urls\":null,\"product_pic_alts\":null,\"tags\":\"\",\"type\":null,\"style\":null,\"methods\":\"烹調方式\",\"note\":\"小筆記\",\"note_pic_url\":null,\"note_pic_alt\":null,\"member_only\":\"0\",\"visitor\":\"3\",\"list_order\":\"0\",\"status\":\"0\",\"remark\":\"備註\",\"c_time\":\"2019-09-12 09:37:34\",\"c_user_id\":\"1\",\"c_user_name\":\"admin\",\"u_time\":\"2019-11-19 11:38:56\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"},{\"id\":\"1\",\"name\":\"1\",\"pic_url\":\"/uploads/product/1574133959.png,/uploads/higi/1566285909.png\",\"pic_alt\":\"123,456\",\"content\":\"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\",\"description\":\"BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB\",\"recipepro_id\":\"0\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":\"5\",\"brand_name\":\"1\",\"brand_pic_url\":\"/uploads/brand/1567073352.png\",\"brand_pic_alt\":\"2\",\"product_id\":\"1\",\"product_name\":\"1\",\"product_pic_urls\":\"/uploads/product/1565848035.png,/uploads/product/1565848034.png,/uploads/product/1565848036.png,/uploads/product/1565848037.png,/uploads/product/1565848038.png,/uploads/product/1565848039.png\",\"product_pic_alts\":\"4,3,,,,\",\"tags\":\"海鮮類,豆類\",\"type\":null,\"style\":null,\"methods\":\"\",\"note\":\"456\",\"note_pic_url\":null,\"note_pic_alt\":null,\"member_only\":\"0\",\"visitor\":\"99\",\"list_order\":\"1\",\"status\":\"0\",\"remark\":\"5\",\"c_time\":\"2019-08-16 10:56:05\",\"c_user_id\":\"1\",\"c_user_name\":\"admin\",\"u_time\":\"2019-11-19 13:31:35\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"},{\"id\":\"4\",\"name\":\"4\",\"pic_url\":\"/uploads/higi/1566285909.png\",\"pic_alt\":\"4\",\"content\":\"4\",\"description\":\"\",\"recipepro_id\":\"4\",\"recipepro_name\":\"4\",\"recipepro_pic_url\":\"/uploads/repicepro/1567072415.png\",\"recipepro_pic_alt\":\"A\",\"recipepro_member_only\":\"0\",\"brand_id\":\"1\",\"brand_name\":\"烹大師\",\"brand_pic_url\":\"/uploads/brand/1567073322.png\",\"brand_pic_alt\":\"\",\"product_id\":\"4\",\"product_name\":\"4\",\"product_pic_urls\":\"/uploads/product/1558350701.png\",\"product_pic_alts\":\"\",\"tags\":\"\",\"type\":null,\"style\":null,\"methods\":\"\",\"note\":\"3\",\"note_pic_url\":null,\"note_pic_alt\":null,\"member_only\":\"1\",\"visitor\":\"5\",\"list_order\":\"4\",\"status\":\"0\",\"remark\":\"5\",\"c_time\":\"2019-08-20 15:25:36\",\"c_user_id\":\"1\",\"c_user_name\":\"admin\",\"u_time\":\"2019-09-11 11:10:51\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"},{\"id\":\"14\",\"name\":\"14\",\"pic_url\":\"/uploads/higi/1566285909.png\",\"pic_alt\":\"14\",\"content\":\"14\",\"description\":\"\",\"recipepro_id\":\"14\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":\"1\",\"brand_name\":\"烹大師\",\"brand_pic_url\":\"/uploads/brand/1567073322.png\",\"brand_pic_alt\":\"\",\"product_id\":\"4\",\"product_name\":\"4\",\"product_pic_urls\":\"/uploads/product/1558350701.png\",\"product_pic_alts\":\"\",\"tags\":\"\",\"type\":null,\"style\":null,\"methods\":\"\",\"note\":\"\",\"note_pic_url\":null,\"note_pic_alt\":null,\"member_only\":\"1\",\"visitor\":\"1\",\"list_order\":\"14\",\"status\":\"0\",\"remark\":\"\",\"c_time\":\"2019-09-03 12:32:01\",\"c_user_id\":\"0\",\"c_user_name\":null,\"u_time\":\"2019-09-11 09:36:57\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"},{\"id\":\"24\",\"name\":\"24\",\"pic_url\":\"/uploads/higi/1566285936.png\",\"pic_alt\":\"24\",\"content\":\"24\",\"description\":\"\",\"recipepro_id\":\"24\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":\"1\",\"brand_name\":\"烹大師\",\"brand_pic_url\":\"/uploads/brand/1567073322.png\",\"brand_pic_alt\":\"\",\"product_id\":\"4\",\"product_name\":\"4\",\"product_pic_urls\":\"/uploads/product/1558350701.png\",\"product_pic_alts\":\"\",\"tags\":\"\",\"type\":null,\"style\":null,\"methods\":\"\",\"note\":\"\",\"note_pic_url\":null,\"note_pic_alt\":null,\"member_only\":\"0\",\"visitor\":\"3\",\"list_order\":\"24\",\"status\":\"0\",\"remark\":\"\",\"c_time\":\"2019-09-03 12:32:03\",\"c_user_id\":\"0\",\"c_user_name\":null,\"u_time\":\"2019-09-11 09:38:14\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"}]', '2019-11-19 13:31:51'),
(51, 0, '::1', 44, 'GET', 'cityarea', 'area', '[]', 'null', '0', '執行成功', '[{\"zipcode\":\"700\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"216\",\"area_name\":\"中西區\"},{\"zipcode\":\"701\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"217\",\"area_name\":\"東區\"},{\"zipcode\":\"702\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"218\",\"area_name\":\"南區\"},{\"zipcode\":\"704\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"219\",\"area_name\":\"北區\"},{\"zipcode\":\"708\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"220\",\"area_name\":\"安平區\"},{\"zipcode\":\"709\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"221\",\"area_name\":\"安南區\"},{\"zipcode\":\"710\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"222\",\"area_name\":\"永康區\"},{\"zipcode\":\"711\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"223\",\"area_name\":\"歸仁區\"},{\"zipcode\":\"712\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"224\",\"area_name\":\"新化區\"},{\"zipcode\":\"713\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"225\",\"area_name\":\"左鎮區\"},{\"zipcode\":\"714\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"226\",\"area_name\":\"玉井區\"},{\"zipcode\":\"715\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"227\",\"area_name\":\"楠西區\"},{\"zipcode\":\"716\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"228\",\"area_name\":\"南化區\"},{\"zipcode\":\"717\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"229\",\"area_name\":\"仁德區\"},{\"zipcode\":\"718\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"230\",\"area_name\":\"關廟區\"},{\"zipcode\":\"719\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"231\",\"area_name\":\"龍崎區\"},{\"zipcode\":\"720\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"232\",\"area_name\":\"官田區\"},{\"zipcode\":\"721\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"233\",\"area_name\":\"麻豆區\"},{\"zipcode\":\"722\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"234\",\"area_name\":\"佳里區\"},{\"zipcode\":\"723\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"235\",\"area_name\":\"西港區\"},{\"zipcode\":\"724\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"236\",\"area_name\":\"七股區\"},{\"zipcode\":\"725\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"237\",\"area_name\":\"將軍區\"},{\"zipcode\":\"726\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"238\",\"area_name\":\"學甲區\"},{\"zipcode\":\"727\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"239\",\"area_name\":\"北門區\"},{\"zipcode\":\"730\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"240\",\"area_name\":\"新營區\"},{\"zipcode\":\"731\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"241\",\"area_name\":\"後壁區\"},{\"zipcode\":\"732\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"242\",\"area_name\":\"白河區\"},{\"zipcode\":\"733\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"243\",\"area_name\":\"東山區\"},{\"zipcode\":\"734\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"244\",\"area_name\":\"六甲區\"},{\"zipcode\":\"735\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"245\",\"area_name\":\"下營區\"},{\"zipcode\":\"736\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"246\",\"area_name\":\"柳營區\"},{\"zipcode\":\"737\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"247\",\"area_name\":\"鹽水區\"},{\"zipcode\":\"741\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"248\",\"area_name\":\"善化區\"},{\"zipcode\":\"742\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"249\",\"area_name\":\"大內區\"},{\"zipcode\":\"743\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"250\",\"area_name\":\"山上區\"},{\"zipcode\":\"744\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"251\",\"area_name\":\"新市區\"},{\"zipcode\":\"745\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"252\",\"area_name\":\"安定區\"}]', '2019-11-19 13:31:52');
INSERT INTO `log` (`id`, `user_id`, `ip`, `program_id`, `method`, `endpoint`, `verb`, `args`, `file`, `resultCode`, `resultMessage`, `resultData`, `c_time`) VALUES
(52, 0, '::1', 0, 'GET', 'member', 'loginmemberdata', '[]', '\"\"', '0', '執行成功', '[{\"id\":\"1\",\"account\":\"vicwu0717@gmail.com\",\"verification\":\"9EC23092-2491-A1FF-BC1C-E01056DEC119\",\"name\":\"vic\",\"gender\":\"1\",\"birthday\":\"0000-00-00\",\"phone\":\"09188888\",\"restaurant_name\":\"vic\",\"restaurant_zipcode\":\"722\",\"restaurant_city_id\":\"15\",\"restaurant_city_name\":\"台南市\",\"restaurant_area_id\":\"234\",\"restaurant_area_name\":\"佳里區\",\"restaurant_type\":\"火鍋\",\"last_login_time\":\"2019-11-19 13:31:21\",\"last_login_ip\":\"::1\",\"status\":\"0\",\"remark\":\"\",\"c_time\":\"2019-10-17 17:38:39\",\"c_user_id\":\"2\",\"c_user_name\":\"web_server\",\"u_time\":\"2019-11-19 13:31:21\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"}]', '2019-11-19 13:32:56'),
(53, 0, '::1', 43, 'GET', 'cityarea', 'city', '[]', 'null', '0', '執行成功', '[{\"id\":\"1\",\"name\":\"基隆市\"},{\"id\":\"2\",\"name\":\"台北市\"},{\"id\":\"3\",\"name\":\"新北市\"},{\"id\":\"4\",\"name\":\"桃園市\"},{\"id\":\"5\",\"name\":\"新竹市\"},{\"id\":\"6\",\"name\":\"新竹縣\"},{\"id\":\"7\",\"name\":\"宜蘭縣\"},{\"id\":\"8\",\"name\":\"苗栗縣\"},{\"id\":\"9\",\"name\":\"台中市\"},{\"id\":\"10\",\"name\":\"彰化縣\"},{\"id\":\"11\",\"name\":\"南投縣\"},{\"id\":\"12\",\"name\":\"雲林縣\"},{\"id\":\"13\",\"name\":\"嘉義市\"},{\"id\":\"14\",\"name\":\"嘉義縣\"},{\"id\":\"15\",\"name\":\"台南市\"},{\"id\":\"16\",\"name\":\"高雄市\"},{\"id\":\"17\",\"name\":\"屏東縣\"},{\"id\":\"18\",\"name\":\"澎湖縣\"},{\"id\":\"19\",\"name\":\"花蓮縣\"},{\"id\":\"20\",\"name\":\"台東縣\"},{\"id\":\"21\",\"name\":\"金門縣\"},{\"id\":\"22\",\"name\":\"連江縣\"}]', '2019-11-19 13:32:56'),
(54, 0, '::1', 0, 'GET', 'member', 'loginmemberrecipepro', '[]', '\"\"', '0', '執行成功', '[{\"id\":\"2\",\"name\":\"2\",\"pic_url\":\"/uploads/repicepro/1567072415.png\",\"pic_alt\":\"A\",\"feature\":\"\",\"tags\":\"雞肉\",\"price\":\"999\",\"type\":\"日式\",\"style\":\"火鍋\",\"product_ids\":\"1,2,3,19\",\"product_names\":\"1,2,3,19\",\"material_weight\":\"\",\"nutrition\":\"<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n		<tr>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n		<tr>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>碳水化合物</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n		<tr>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n		<tr>\r\n			<th>碳水化合物</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n\",\"member_only\":\"0\",\"visitor\":\"69\",\"list_order\":\"2\",\"status\":\"0\",\"remark\":\"\",\"c_time\":\"2019-08-19 19:43:07\",\"c_user_id\":\"1\",\"c_user_name\":\"admin\",\"u_time\":\"2019-11-19 09:45:10\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"},{\"id\":\"4\",\"name\":\"4\",\"pic_url\":\"/uploads/repicepro/1567072415.png\",\"pic_alt\":\"A\",\"feature\":\"7\",\"tags\":\"牛肉\",\"price\":\"0\",\"type\":\"中式\",\"style\":\"火鍋\",\"product_ids\":\"1\",\"product_names\":\"1\",\"material_weight\":\"\",\"nutrition\":\"\",\"member_only\":\"0\",\"visitor\":\"12\",\"list_order\":\"4\",\"status\":\"0\",\"remark\":\"\",\"c_time\":\"2019-08-19 19:43:07\",\"c_user_id\":\"1\",\"c_user_name\":\"admin\",\"u_time\":\"2019-10-05 09:44:51\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"},{\"id\":\"5\",\"name\":\"5\",\"pic_url\":\"/uploads/repicepro/1565924165.png\",\"pic_alt\":\"3\",\"feature\":\"6\",\"tags\":\"雞肉,豬肉,根莖類,主菜,火鍋\",\"price\":\"9\",\"type\":\"素食\",\"style\":\"火鍋\",\"product_ids\":\"1\",\"product_names\":\"1\",\"material_weight\":\"\",\"nutrition\":\"1\",\"member_only\":\"1\",\"visitor\":\"3\",\"list_order\":\"5\",\"status\":\"0\",\"remark\":\"11\",\"c_time\":\"2019-08-16 10:56:05\",\"c_user_id\":\"1\",\"c_user_name\":\"admin\",\"u_time\":\"2019-09-11 09:56:20\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"}]', '2019-11-19 13:32:56'),
(55, 0, '::1', 0, 'GET', 'member', 'loginmemberhigi', '[]', '\"\"', '0', '執行成功', '[{\"id\":\"31\",\"name\":\"招客秘技名稱\",\"pic_url\":\"圖片網址\",\"pic_alt\":\"圖片說明\",\"content\":\"招客秘技內容\",\"description\":\"\",\"recipepro_id\":\"0\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":null,\"brand_name\":null,\"brand_pic_url\":null,\"brand_pic_alt\":null,\"product_id\":\"0\",\"product_name\":null,\"product_pic_urls\":null,\"product_pic_alts\":null,\"tags\":\"\",\"type\":null,\"style\":null,\"methods\":\"烹調方式\",\"note\":\"小筆記\",\"note_pic_url\":null,\"note_pic_alt\":null,\"member_only\":\"0\",\"visitor\":\"3\",\"list_order\":\"0\",\"status\":\"0\",\"remark\":\"備註\",\"c_time\":\"2019-09-12 09:37:34\",\"c_user_id\":\"1\",\"c_user_name\":\"admin\",\"u_time\":\"2019-11-19 11:38:56\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"},{\"id\":\"1\",\"name\":\"1\",\"pic_url\":\"/uploads/product/1574133959.png,/uploads/higi/1566285909.png\",\"pic_alt\":\"123,456\",\"content\":\"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\",\"description\":\"BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB\",\"recipepro_id\":\"0\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":\"5\",\"brand_name\":\"1\",\"brand_pic_url\":\"/uploads/brand/1567073352.png\",\"brand_pic_alt\":\"2\",\"product_id\":\"1\",\"product_name\":\"1\",\"product_pic_urls\":\"/uploads/product/1565848035.png,/uploads/product/1565848034.png,/uploads/product/1565848036.png,/uploads/product/1565848037.png,/uploads/product/1565848038.png,/uploads/product/1565848039.png\",\"product_pic_alts\":\"4,3,,,,\",\"tags\":\"海鮮類,豆類\",\"type\":null,\"style\":null,\"methods\":\"\",\"note\":\"456\",\"note_pic_url\":null,\"note_pic_alt\":null,\"member_only\":\"0\",\"visitor\":\"99\",\"list_order\":\"1\",\"status\":\"0\",\"remark\":\"5\",\"c_time\":\"2019-08-16 10:56:05\",\"c_user_id\":\"1\",\"c_user_name\":\"admin\",\"u_time\":\"2019-11-19 13:31:35\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"},{\"id\":\"4\",\"name\":\"4\",\"pic_url\":\"/uploads/higi/1566285909.png\",\"pic_alt\":\"4\",\"content\":\"4\",\"description\":\"\",\"recipepro_id\":\"4\",\"recipepro_name\":\"4\",\"recipepro_pic_url\":\"/uploads/repicepro/1567072415.png\",\"recipepro_pic_alt\":\"A\",\"recipepro_member_only\":\"0\",\"brand_id\":\"1\",\"brand_name\":\"烹大師\",\"brand_pic_url\":\"/uploads/brand/1567073322.png\",\"brand_pic_alt\":\"\",\"product_id\":\"4\",\"product_name\":\"4\",\"product_pic_urls\":\"/uploads/product/1558350701.png\",\"product_pic_alts\":\"\",\"tags\":\"\",\"type\":null,\"style\":null,\"methods\":\"\",\"note\":\"3\",\"note_pic_url\":null,\"note_pic_alt\":null,\"member_only\":\"1\",\"visitor\":\"5\",\"list_order\":\"4\",\"status\":\"0\",\"remark\":\"5\",\"c_time\":\"2019-08-20 15:25:36\",\"c_user_id\":\"1\",\"c_user_name\":\"admin\",\"u_time\":\"2019-09-11 11:10:51\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"},{\"id\":\"14\",\"name\":\"14\",\"pic_url\":\"/uploads/higi/1566285909.png\",\"pic_alt\":\"14\",\"content\":\"14\",\"description\":\"\",\"recipepro_id\":\"14\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":\"1\",\"brand_name\":\"烹大師\",\"brand_pic_url\":\"/uploads/brand/1567073322.png\",\"brand_pic_alt\":\"\",\"product_id\":\"4\",\"product_name\":\"4\",\"product_pic_urls\":\"/uploads/product/1558350701.png\",\"product_pic_alts\":\"\",\"tags\":\"\",\"type\":null,\"style\":null,\"methods\":\"\",\"note\":\"\",\"note_pic_url\":null,\"note_pic_alt\":null,\"member_only\":\"1\",\"visitor\":\"1\",\"list_order\":\"14\",\"status\":\"0\",\"remark\":\"\",\"c_time\":\"2019-09-03 12:32:01\",\"c_user_id\":\"0\",\"c_user_name\":null,\"u_time\":\"2019-09-11 09:36:57\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"},{\"id\":\"24\",\"name\":\"24\",\"pic_url\":\"/uploads/higi/1566285936.png\",\"pic_alt\":\"24\",\"content\":\"24\",\"description\":\"\",\"recipepro_id\":\"24\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":\"1\",\"brand_name\":\"烹大師\",\"brand_pic_url\":\"/uploads/brand/1567073322.png\",\"brand_pic_alt\":\"\",\"product_id\":\"4\",\"product_name\":\"4\",\"product_pic_urls\":\"/uploads/product/1558350701.png\",\"product_pic_alts\":\"\",\"tags\":\"\",\"type\":null,\"style\":null,\"methods\":\"\",\"note\":\"\",\"note_pic_url\":null,\"note_pic_alt\":null,\"member_only\":\"0\",\"visitor\":\"3\",\"list_order\":\"24\",\"status\":\"0\",\"remark\":\"\",\"c_time\":\"2019-09-03 12:32:03\",\"c_user_id\":\"0\",\"c_user_name\":null,\"u_time\":\"2019-09-11 09:38:14\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"}]', '2019-11-19 13:32:56'),
(56, 0, '::1', 44, 'GET', 'cityarea', 'area', '[]', 'null', '0', '執行成功', '[{\"zipcode\":\"700\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"216\",\"area_name\":\"中西區\"},{\"zipcode\":\"701\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"217\",\"area_name\":\"東區\"},{\"zipcode\":\"702\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"218\",\"area_name\":\"南區\"},{\"zipcode\":\"704\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"219\",\"area_name\":\"北區\"},{\"zipcode\":\"708\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"220\",\"area_name\":\"安平區\"},{\"zipcode\":\"709\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"221\",\"area_name\":\"安南區\"},{\"zipcode\":\"710\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"222\",\"area_name\":\"永康區\"},{\"zipcode\":\"711\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"223\",\"area_name\":\"歸仁區\"},{\"zipcode\":\"712\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"224\",\"area_name\":\"新化區\"},{\"zipcode\":\"713\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"225\",\"area_name\":\"左鎮區\"},{\"zipcode\":\"714\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"226\",\"area_name\":\"玉井區\"},{\"zipcode\":\"715\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"227\",\"area_name\":\"楠西區\"},{\"zipcode\":\"716\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"228\",\"area_name\":\"南化區\"},{\"zipcode\":\"717\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"229\",\"area_name\":\"仁德區\"},{\"zipcode\":\"718\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"230\",\"area_name\":\"關廟區\"},{\"zipcode\":\"719\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"231\",\"area_name\":\"龍崎區\"},{\"zipcode\":\"720\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"232\",\"area_name\":\"官田區\"},{\"zipcode\":\"721\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"233\",\"area_name\":\"麻豆區\"},{\"zipcode\":\"722\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"234\",\"area_name\":\"佳里區\"},{\"zipcode\":\"723\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"235\",\"area_name\":\"西港區\"},{\"zipcode\":\"724\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"236\",\"area_name\":\"七股區\"},{\"zipcode\":\"725\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"237\",\"area_name\":\"將軍區\"},{\"zipcode\":\"726\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"238\",\"area_name\":\"學甲區\"},{\"zipcode\":\"727\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"239\",\"area_name\":\"北門區\"},{\"zipcode\":\"730\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"240\",\"area_name\":\"新營區\"},{\"zipcode\":\"731\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"241\",\"area_name\":\"後壁區\"},{\"zipcode\":\"732\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"242\",\"area_name\":\"白河區\"},{\"zipcode\":\"733\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"243\",\"area_name\":\"東山區\"},{\"zipcode\":\"734\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"244\",\"area_name\":\"六甲區\"},{\"zipcode\":\"735\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"245\",\"area_name\":\"下營區\"},{\"zipcode\":\"736\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"246\",\"area_name\":\"柳營區\"},{\"zipcode\":\"737\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"247\",\"area_name\":\"鹽水區\"},{\"zipcode\":\"741\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"248\",\"area_name\":\"善化區\"},{\"zipcode\":\"742\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"249\",\"area_name\":\"大內區\"},{\"zipcode\":\"743\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"250\",\"area_name\":\"山上區\"},{\"zipcode\":\"744\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"251\",\"area_name\":\"新市區\"},{\"zipcode\":\"745\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"252\",\"area_name\":\"安定區\"}]', '2019-11-19 13:32:56'),
(57, 0, '::1', 0, 'GET', 'member', 'loginmemberdata', '[]', '\"\"', '0', '執行成功', '[{\"id\":\"1\",\"account\":\"vicwu0717@gmail.com\",\"verification\":\"9EC23092-2491-A1FF-BC1C-E01056DEC119\",\"name\":\"vic\",\"gender\":\"1\",\"birthday\":\"0000-00-00\",\"phone\":\"09188888\",\"restaurant_name\":\"vic\",\"restaurant_zipcode\":\"722\",\"restaurant_city_id\":\"15\",\"restaurant_city_name\":\"台南市\",\"restaurant_area_id\":\"234\",\"restaurant_area_name\":\"佳里區\",\"restaurant_type\":\"火鍋\",\"last_login_time\":\"2019-11-19 13:31:21\",\"last_login_ip\":\"::1\",\"status\":\"0\",\"remark\":\"\",\"c_time\":\"2019-10-17 17:38:39\",\"c_user_id\":\"2\",\"c_user_name\":\"web_server\",\"u_time\":\"2019-11-19 13:31:21\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"}]', '2019-11-19 13:33:30'),
(58, 0, '::1', 43, 'GET', 'cityarea', 'city', '[]', 'null', '0', '執行成功', '[{\"id\":\"1\",\"name\":\"基隆市\"},{\"id\":\"2\",\"name\":\"台北市\"},{\"id\":\"3\",\"name\":\"新北市\"},{\"id\":\"4\",\"name\":\"桃園市\"},{\"id\":\"5\",\"name\":\"新竹市\"},{\"id\":\"6\",\"name\":\"新竹縣\"},{\"id\":\"7\",\"name\":\"宜蘭縣\"},{\"id\":\"8\",\"name\":\"苗栗縣\"},{\"id\":\"9\",\"name\":\"台中市\"},{\"id\":\"10\",\"name\":\"彰化縣\"},{\"id\":\"11\",\"name\":\"南投縣\"},{\"id\":\"12\",\"name\":\"雲林縣\"},{\"id\":\"13\",\"name\":\"嘉義市\"},{\"id\":\"14\",\"name\":\"嘉義縣\"},{\"id\":\"15\",\"name\":\"台南市\"},{\"id\":\"16\",\"name\":\"高雄市\"},{\"id\":\"17\",\"name\":\"屏東縣\"},{\"id\":\"18\",\"name\":\"澎湖縣\"},{\"id\":\"19\",\"name\":\"花蓮縣\"},{\"id\":\"20\",\"name\":\"台東縣\"},{\"id\":\"21\",\"name\":\"金門縣\"},{\"id\":\"22\",\"name\":\"連江縣\"}]', '2019-11-19 13:33:30'),
(59, 0, '::1', 0, 'GET', 'member', 'loginmemberrecipepro', '[]', '\"\"', '0', '執行成功', '[{\"id\":\"2\",\"name\":\"2\",\"pic_url\":\"/uploads/repicepro/1567072415.png\",\"pic_alt\":\"A\",\"feature\":\"\",\"tags\":\"雞肉\",\"price\":\"999\",\"type\":\"日式\",\"style\":\"火鍋\",\"product_ids\":\"1,2,3,19\",\"product_names\":\"1,2,3,19\",\"material_weight\":\"\",\"nutrition\":\"<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n		<tr>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n		<tr>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>碳水化合物</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n		<tr>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n		<tr>\r\n			<th>碳水化合物</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n\",\"member_only\":\"0\",\"visitor\":\"69\",\"list_order\":\"2\",\"status\":\"0\",\"remark\":\"\",\"c_time\":\"2019-08-19 19:43:07\",\"c_user_id\":\"1\",\"c_user_name\":\"admin\",\"u_time\":\"2019-11-19 09:45:10\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"},{\"id\":\"4\",\"name\":\"4\",\"pic_url\":\"/uploads/repicepro/1567072415.png\",\"pic_alt\":\"A\",\"feature\":\"7\",\"tags\":\"牛肉\",\"price\":\"0\",\"type\":\"中式\",\"style\":\"火鍋\",\"product_ids\":\"1\",\"product_names\":\"1\",\"material_weight\":\"\",\"nutrition\":\"\",\"member_only\":\"0\",\"visitor\":\"12\",\"list_order\":\"4\",\"status\":\"0\",\"remark\":\"\",\"c_time\":\"2019-08-19 19:43:07\",\"c_user_id\":\"1\",\"c_user_name\":\"admin\",\"u_time\":\"2019-10-05 09:44:51\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"},{\"id\":\"5\",\"name\":\"5\",\"pic_url\":\"/uploads/repicepro/1565924165.png\",\"pic_alt\":\"3\",\"feature\":\"6\",\"tags\":\"雞肉,豬肉,根莖類,主菜,火鍋\",\"price\":\"9\",\"type\":\"素食\",\"style\":\"火鍋\",\"product_ids\":\"1\",\"product_names\":\"1\",\"material_weight\":\"\",\"nutrition\":\"1\",\"member_only\":\"1\",\"visitor\":\"3\",\"list_order\":\"5\",\"status\":\"0\",\"remark\":\"11\",\"c_time\":\"2019-08-16 10:56:05\",\"c_user_id\":\"1\",\"c_user_name\":\"admin\",\"u_time\":\"2019-09-11 09:56:20\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"}]', '2019-11-19 13:33:30'),
(60, 0, '::1', 0, 'GET', 'member', 'loginmemberhigi', '[]', '\"\"', '0', '執行成功', '[{\"id\":\"31\",\"name\":\"招客秘技名稱\",\"pic_url\":\"圖片網址\",\"pic_alt\":\"圖片說明\",\"content\":\"招客秘技內容\",\"description\":\"\",\"recipepro_id\":\"0\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":null,\"brand_name\":null,\"brand_pic_url\":null,\"brand_pic_alt\":null,\"product_id\":\"0\",\"product_name\":null,\"product_pic_urls\":null,\"product_pic_alts\":null,\"tags\":\"\",\"type\":null,\"style\":null,\"methods\":\"烹調方式\",\"note\":\"小筆記\",\"note_pic_url\":null,\"note_pic_alt\":null,\"member_only\":\"0\",\"visitor\":\"3\",\"list_order\":\"0\",\"status\":\"0\",\"remark\":\"備註\",\"c_time\":\"2019-09-12 09:37:34\",\"c_user_id\":\"1\",\"c_user_name\":\"admin\",\"u_time\":\"2019-11-19 11:38:56\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"},{\"id\":\"1\",\"name\":\"1\",\"pic_url\":\"/uploads/product/1574133959.png,/uploads/higi/1566285909.png\",\"pic_alt\":\"123,456\",\"content\":\"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\",\"description\":\"BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB\",\"recipepro_id\":\"0\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":\"5\",\"brand_name\":\"1\",\"brand_pic_url\":\"/uploads/brand/1567073352.png\",\"brand_pic_alt\":\"2\",\"product_id\":\"1\",\"product_name\":\"1\",\"product_pic_urls\":\"/uploads/product/1565848035.png,/uploads/product/1565848034.png,/uploads/product/1565848036.png,/uploads/product/1565848037.png,/uploads/product/1565848038.png,/uploads/product/1565848039.png\",\"product_pic_alts\":\"4,3,,,,\",\"tags\":\"海鮮類,豆類\",\"type\":null,\"style\":null,\"methods\":\"\",\"note\":\"456\",\"note_pic_url\":null,\"note_pic_alt\":null,\"member_only\":\"0\",\"visitor\":\"99\",\"list_order\":\"1\",\"status\":\"0\",\"remark\":\"5\",\"c_time\":\"2019-08-16 10:56:05\",\"c_user_id\":\"1\",\"c_user_name\":\"admin\",\"u_time\":\"2019-11-19 13:31:35\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"},{\"id\":\"4\",\"name\":\"4\",\"pic_url\":\"/uploads/higi/1566285909.png\",\"pic_alt\":\"4\",\"content\":\"4\",\"description\":\"\",\"recipepro_id\":\"4\",\"recipepro_name\":\"4\",\"recipepro_pic_url\":\"/uploads/repicepro/1567072415.png\",\"recipepro_pic_alt\":\"A\",\"recipepro_member_only\":\"0\",\"brand_id\":\"1\",\"brand_name\":\"烹大師\",\"brand_pic_url\":\"/uploads/brand/1567073322.png\",\"brand_pic_alt\":\"\",\"product_id\":\"4\",\"product_name\":\"4\",\"product_pic_urls\":\"/uploads/product/1558350701.png\",\"product_pic_alts\":\"\",\"tags\":\"\",\"type\":null,\"style\":null,\"methods\":\"\",\"note\":\"3\",\"note_pic_url\":null,\"note_pic_alt\":null,\"member_only\":\"1\",\"visitor\":\"5\",\"list_order\":\"4\",\"status\":\"0\",\"remark\":\"5\",\"c_time\":\"2019-08-20 15:25:36\",\"c_user_id\":\"1\",\"c_user_name\":\"admin\",\"u_time\":\"2019-09-11 11:10:51\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"},{\"id\":\"14\",\"name\":\"14\",\"pic_url\":\"/uploads/higi/1566285909.png\",\"pic_alt\":\"14\",\"content\":\"14\",\"description\":\"\",\"recipepro_id\":\"14\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":\"1\",\"brand_name\":\"烹大師\",\"brand_pic_url\":\"/uploads/brand/1567073322.png\",\"brand_pic_alt\":\"\",\"product_id\":\"4\",\"product_name\":\"4\",\"product_pic_urls\":\"/uploads/product/1558350701.png\",\"product_pic_alts\":\"\",\"tags\":\"\",\"type\":null,\"style\":null,\"methods\":\"\",\"note\":\"\",\"note_pic_url\":null,\"note_pic_alt\":null,\"member_only\":\"1\",\"visitor\":\"1\",\"list_order\":\"14\",\"status\":\"0\",\"remark\":\"\",\"c_time\":\"2019-09-03 12:32:01\",\"c_user_id\":\"0\",\"c_user_name\":null,\"u_time\":\"2019-09-11 09:36:57\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"},{\"id\":\"24\",\"name\":\"24\",\"pic_url\":\"/uploads/higi/1566285936.png\",\"pic_alt\":\"24\",\"content\":\"24\",\"description\":\"\",\"recipepro_id\":\"24\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":\"1\",\"brand_name\":\"烹大師\",\"brand_pic_url\":\"/uploads/brand/1567073322.png\",\"brand_pic_alt\":\"\",\"product_id\":\"4\",\"product_name\":\"4\",\"product_pic_urls\":\"/uploads/product/1558350701.png\",\"product_pic_alts\":\"\",\"tags\":\"\",\"type\":null,\"style\":null,\"methods\":\"\",\"note\":\"\",\"note_pic_url\":null,\"note_pic_alt\":null,\"member_only\":\"0\",\"visitor\":\"3\",\"list_order\":\"24\",\"status\":\"0\",\"remark\":\"\",\"c_time\":\"2019-09-03 12:32:03\",\"c_user_id\":\"0\",\"c_user_name\":null,\"u_time\":\"2019-09-11 09:38:14\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"}]', '2019-11-19 13:33:30'),
(61, 0, '::1', 44, 'GET', 'cityarea', 'area', '[]', 'null', '0', '執行成功', '[{\"zipcode\":\"700\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"216\",\"area_name\":\"中西區\"},{\"zipcode\":\"701\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"217\",\"area_name\":\"東區\"},{\"zipcode\":\"702\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"218\",\"area_name\":\"南區\"},{\"zipcode\":\"704\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"219\",\"area_name\":\"北區\"},{\"zipcode\":\"708\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"220\",\"area_name\":\"安平區\"},{\"zipcode\":\"709\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"221\",\"area_name\":\"安南區\"},{\"zipcode\":\"710\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"222\",\"area_name\":\"永康區\"},{\"zipcode\":\"711\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"223\",\"area_name\":\"歸仁區\"},{\"zipcode\":\"712\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"224\",\"area_name\":\"新化區\"},{\"zipcode\":\"713\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"225\",\"area_name\":\"左鎮區\"},{\"zipcode\":\"714\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"226\",\"area_name\":\"玉井區\"},{\"zipcode\":\"715\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"227\",\"area_name\":\"楠西區\"},{\"zipcode\":\"716\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"228\",\"area_name\":\"南化區\"},{\"zipcode\":\"717\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"229\",\"area_name\":\"仁德區\"},{\"zipcode\":\"718\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"230\",\"area_name\":\"關廟區\"},{\"zipcode\":\"719\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"231\",\"area_name\":\"龍崎區\"},{\"zipcode\":\"720\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"232\",\"area_name\":\"官田區\"},{\"zipcode\":\"721\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"233\",\"area_name\":\"麻豆區\"},{\"zipcode\":\"722\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"234\",\"area_name\":\"佳里區\"},{\"zipcode\":\"723\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"235\",\"area_name\":\"西港區\"},{\"zipcode\":\"724\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"236\",\"area_name\":\"七股區\"},{\"zipcode\":\"725\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"237\",\"area_name\":\"將軍區\"},{\"zipcode\":\"726\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"238\",\"area_name\":\"學甲區\"},{\"zipcode\":\"727\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"239\",\"area_name\":\"北門區\"},{\"zipcode\":\"730\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"240\",\"area_name\":\"新營區\"},{\"zipcode\":\"731\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"241\",\"area_name\":\"後壁區\"},{\"zipcode\":\"732\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"242\",\"area_name\":\"白河區\"},{\"zipcode\":\"733\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"243\",\"area_name\":\"東山區\"},{\"zipcode\":\"734\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"244\",\"area_name\":\"六甲區\"},{\"zipcode\":\"735\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"245\",\"area_name\":\"下營區\"},{\"zipcode\":\"736\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"246\",\"area_name\":\"柳營區\"},{\"zipcode\":\"737\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"247\",\"area_name\":\"鹽水區\"},{\"zipcode\":\"741\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"248\",\"area_name\":\"善化區\"},{\"zipcode\":\"742\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"249\",\"area_name\":\"大內區\"},{\"zipcode\":\"743\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"250\",\"area_name\":\"山上區\"},{\"zipcode\":\"744\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"251\",\"area_name\":\"新市區\"},{\"zipcode\":\"745\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"252\",\"area_name\":\"安定區\"}]', '2019-11-19 13:33:30'),
(62, 0, '::1', 0, 'GET', 'member', 'loginmemberhigi', '[]', '\"\"', '0', '執行成功', '[{\"id\":\"31\",\"name\":\"招客秘技名稱\",\"pic_url\":\"圖片網址\",\"pic_alt\":\"圖片說明\",\"content\":\"招客秘技內容\",\"description\":\"\",\"recipepro_id\":\"0\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":null,\"brand_name\":null,\"brand_pic_url\":null,\"brand_pic_alt\":null,\"product_id\":\"0\",\"product_name\":null,\"product_pic_urls\":null,\"product_pic_alts\":null,\"tags\":\"\",\"type\":null,\"style\":null,\"methods\":\"烹調方式\",\"note\":\"小筆記\",\"note_pic_url\":null,\"note_pic_alt\":null,\"member_only\":\"0\",\"visitor\":\"3\",\"list_order\":\"0\",\"status\":\"0\",\"remark\":\"備註\",\"c_time\":\"2019-09-12 09:37:34\",\"c_user_id\":\"1\",\"c_user_name\":\"admin\",\"u_time\":\"2019-11-19 11:38:56\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"},{\"id\":\"1\",\"name\":\"1\",\"pic_url\":\"/uploads/product/1574133959.png,/uploads/higi/1566285909.png\",\"pic_alt\":\"123,456\",\"content\":\"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\",\"description\":\"BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB\",\"recipepro_id\":\"0\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":\"5\",\"brand_name\":\"1\",\"brand_pic_url\":\"/uploads/brand/1567073352.png\",\"brand_pic_alt\":\"2\",\"product_id\":\"1\",\"product_name\":\"1\",\"product_pic_urls\":\"/uploads/product/1565848035.png,/uploads/product/1565848034.png,/uploads/product/1565848036.png,/uploads/product/1565848037.png,/uploads/product/1565848038.png,/uploads/product/1565848039.png\",\"product_pic_alts\":\"4,3,,,,\",\"tags\":\"海鮮類,豆類\",\"type\":null,\"style\":null,\"methods\":\"\",\"note\":\"456\",\"note_pic_url\":null,\"note_pic_alt\":null,\"member_only\":\"0\",\"visitor\":\"99\",\"list_order\":\"1\",\"status\":\"0\",\"remark\":\"5\",\"c_time\":\"2019-08-16 10:56:05\",\"c_user_id\":\"1\",\"c_user_name\":\"admin\",\"u_time\":\"2019-11-19 13:31:35\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"},{\"id\":\"4\",\"name\":\"4\",\"pic_url\":\"/uploads/higi/1566285909.png\",\"pic_alt\":\"4\",\"content\":\"4\",\"description\":\"\",\"recipepro_id\":\"4\",\"recipepro_name\":\"4\",\"recipepro_pic_url\":\"/uploads/repicepro/1567072415.png\",\"recipepro_pic_alt\":\"A\",\"recipepro_member_only\":\"0\",\"brand_id\":\"1\",\"brand_name\":\"烹大師\",\"brand_pic_url\":\"/uploads/brand/1567073322.png\",\"brand_pic_alt\":\"\",\"product_id\":\"4\",\"product_name\":\"4\",\"product_pic_urls\":\"/uploads/product/1558350701.png\",\"product_pic_alts\":\"\",\"tags\":\"\",\"type\":null,\"style\":null,\"methods\":\"\",\"note\":\"3\",\"note_pic_url\":null,\"note_pic_alt\":null,\"member_only\":\"1\",\"visitor\":\"5\",\"list_order\":\"4\",\"status\":\"0\",\"remark\":\"5\",\"c_time\":\"2019-08-20 15:25:36\",\"c_user_id\":\"1\",\"c_user_name\":\"admin\",\"u_time\":\"2019-09-11 11:10:51\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"},{\"id\":\"14\",\"name\":\"14\",\"pic_url\":\"/uploads/higi/1566285909.png\",\"pic_alt\":\"14\",\"content\":\"14\",\"description\":\"\",\"recipepro_id\":\"14\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":\"1\",\"brand_name\":\"烹大師\",\"brand_pic_url\":\"/uploads/brand/1567073322.png\",\"brand_pic_alt\":\"\",\"product_id\":\"4\",\"product_name\":\"4\",\"product_pic_urls\":\"/uploads/product/1558350701.png\",\"product_pic_alts\":\"\",\"tags\":\"\",\"type\":null,\"style\":null,\"methods\":\"\",\"note\":\"\",\"note_pic_url\":null,\"note_pic_alt\":null,\"member_only\":\"1\",\"visitor\":\"1\",\"list_order\":\"14\",\"status\":\"0\",\"remark\":\"\",\"c_time\":\"2019-09-03 12:32:01\",\"c_user_id\":\"0\",\"c_user_name\":null,\"u_time\":\"2019-09-11 09:36:57\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"},{\"id\":\"24\",\"name\":\"24\",\"pic_url\":\"/uploads/higi/1566285936.png\",\"pic_alt\":\"24\",\"content\":\"24\",\"description\":\"\",\"recipepro_id\":\"24\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":\"1\",\"brand_name\":\"烹大師\",\"brand_pic_url\":\"/uploads/brand/1567073322.png\",\"brand_pic_alt\":\"\",\"product_id\":\"4\",\"product_name\":\"4\",\"product_pic_urls\":\"/uploads/product/1558350701.png\",\"product_pic_alts\":\"\",\"tags\":\"\",\"type\":null,\"style\":null,\"methods\":\"\",\"note\":\"\",\"note_pic_url\":null,\"note_pic_alt\":null,\"member_only\":\"0\",\"visitor\":\"3\",\"list_order\":\"24\",\"status\":\"0\",\"remark\":\"\",\"c_time\":\"2019-09-03 12:32:03\",\"c_user_id\":\"0\",\"c_user_name\":null,\"u_time\":\"2019-09-11 09:38:14\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"}]', '2019-11-19 13:33:36'),
(63, 0, '::1', 0, 'GET', 'member', 'loginmemberhigi', '[]', '\"\"', '0', '執行成功', '[{\"id\":\"31\",\"name\":\"招客秘技名稱\",\"pic_url\":\"圖片網址\",\"pic_alt\":\"圖片說明\",\"content\":\"招客秘技內容\",\"description\":\"\",\"recipepro_id\":\"0\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":null,\"brand_name\":null,\"brand_pic_url\":null,\"brand_pic_alt\":null,\"product_id\":\"0\",\"product_name\":null,\"product_pic_urls\":null,\"product_pic_alts\":null,\"tags\":\"\",\"type\":null,\"style\":null,\"methods\":\"烹調方式\",\"note\":\"小筆記\",\"note_pic_url\":null,\"note_pic_alt\":null,\"member_only\":\"0\",\"visitor\":\"3\",\"list_order\":\"0\",\"status\":\"0\",\"remark\":\"備註\",\"c_time\":\"2019-09-12 09:37:34\",\"c_user_id\":\"1\",\"c_user_name\":\"admin\",\"u_time\":\"2019-11-19 11:38:56\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"},{\"id\":\"1\",\"name\":\"1\",\"pic_url\":\"/uploads/product/1574133959.png,/uploads/higi/1566285909.png\",\"pic_alt\":\"123,456\",\"content\":\"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\",\"description\":\"BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB\",\"recipepro_id\":\"0\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":\"5\",\"brand_name\":\"1\",\"brand_pic_url\":\"/uploads/brand/1567073352.png\",\"brand_pic_alt\":\"2\",\"product_id\":\"1\",\"product_name\":\"1\",\"product_pic_urls\":\"/uploads/product/1565848035.png,/uploads/product/1565848034.png,/uploads/product/1565848036.png,/uploads/product/1565848037.png,/uploads/product/1565848038.png,/uploads/product/1565848039.png\",\"product_pic_alts\":\"4,3,,,,\",\"tags\":\"海鮮類,豆類\",\"type\":null,\"style\":null,\"methods\":\"\",\"note\":\"456\",\"note_pic_url\":null,\"note_pic_alt\":null,\"member_only\":\"0\",\"visitor\":\"99\",\"list_order\":\"1\",\"status\":\"0\",\"remark\":\"5\",\"c_time\":\"2019-08-16 10:56:05\",\"c_user_id\":\"1\",\"c_user_name\":\"admin\",\"u_time\":\"2019-11-19 13:31:35\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"},{\"id\":\"4\",\"name\":\"4\",\"pic_url\":\"/uploads/higi/1566285909.png\",\"pic_alt\":\"4\",\"content\":\"4\",\"description\":\"\",\"recipepro_id\":\"4\",\"recipepro_name\":\"4\",\"recipepro_pic_url\":\"/uploads/repicepro/1567072415.png\",\"recipepro_pic_alt\":\"A\",\"recipepro_member_only\":\"0\",\"brand_id\":\"1\",\"brand_name\":\"烹大師\",\"brand_pic_url\":\"/uploads/brand/1567073322.png\",\"brand_pic_alt\":\"\",\"product_id\":\"4\",\"product_name\":\"4\",\"product_pic_urls\":\"/uploads/product/1558350701.png\",\"product_pic_alts\":\"\",\"tags\":\"\",\"type\":null,\"style\":null,\"methods\":\"\",\"note\":\"3\",\"note_pic_url\":null,\"note_pic_alt\":null,\"member_only\":\"1\",\"visitor\":\"5\",\"list_order\":\"4\",\"status\":\"0\",\"remark\":\"5\",\"c_time\":\"2019-08-20 15:25:36\",\"c_user_id\":\"1\",\"c_user_name\":\"admin\",\"u_time\":\"2019-09-11 11:10:51\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"},{\"id\":\"14\",\"name\":\"14\",\"pic_url\":\"/uploads/higi/1566285909.png\",\"pic_alt\":\"14\",\"content\":\"14\",\"description\":\"\",\"recipepro_id\":\"14\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":\"1\",\"brand_name\":\"烹大師\",\"brand_pic_url\":\"/uploads/brand/1567073322.png\",\"brand_pic_alt\":\"\",\"product_id\":\"4\",\"product_name\":\"4\",\"product_pic_urls\":\"/uploads/product/1558350701.png\",\"product_pic_alts\":\"\",\"tags\":\"\",\"type\":null,\"style\":null,\"methods\":\"\",\"note\":\"\",\"note_pic_url\":null,\"note_pic_alt\":null,\"member_only\":\"1\",\"visitor\":\"1\",\"list_order\":\"14\",\"status\":\"0\",\"remark\":\"\",\"c_time\":\"2019-09-03 12:32:01\",\"c_user_id\":\"0\",\"c_user_name\":null,\"u_time\":\"2019-09-11 09:36:57\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"},{\"id\":\"24\",\"name\":\"24\",\"pic_url\":\"/uploads/higi/1566285936.png\",\"pic_alt\":\"24\",\"content\":\"24\",\"description\":\"\",\"recipepro_id\":\"24\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":\"1\",\"brand_name\":\"烹大師\",\"brand_pic_url\":\"/uploads/brand/1567073322.png\",\"brand_pic_alt\":\"\",\"product_id\":\"4\",\"product_name\":\"4\",\"product_pic_urls\":\"/uploads/product/1558350701.png\",\"product_pic_alts\":\"\",\"tags\":\"\",\"type\":null,\"style\":null,\"methods\":\"\",\"note\":\"\",\"note_pic_url\":null,\"note_pic_alt\":null,\"member_only\":\"0\",\"visitor\":\"3\",\"list_order\":\"24\",\"status\":\"0\",\"remark\":\"\",\"c_time\":\"2019-09-03 12:32:03\",\"c_user_id\":\"0\",\"c_user_name\":null,\"u_time\":\"2019-09-11 09:38:14\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"}]', '2019-11-19 13:34:02'),
(64, 0, '::1', 0, 'GET', 'member', 'loginmemberhigi', '[]', '\"\"', '0', '執行成功', '[{\"id\":\"31\",\"name\":\"招客秘技名稱\",\"pic_url\":\"圖片網址\",\"pic_alt\":\"圖片說明\",\"content\":\"招客秘技內容\",\"description\":\"\",\"recipepro_id\":\"0\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":null,\"brand_name\":null,\"brand_pic_url\":null,\"brand_pic_alt\":null,\"product_id\":\"0\",\"product_name\":null,\"product_pic_urls\":null,\"product_pic_alts\":null,\"tags\":\"\",\"type\":null,\"style\":null,\"methods\":\"烹調方式\",\"note\":\"小筆記\",\"note_pic_url\":null,\"note_pic_alt\":null,\"member_only\":\"0\",\"visitor\":\"3\",\"list_order\":\"0\",\"status\":\"0\",\"remark\":\"備註\",\"c_time\":\"2019-09-12 09:37:34\",\"c_user_id\":\"1\",\"c_user_name\":\"admin\",\"u_time\":\"2019-11-19 11:38:56\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"},{\"id\":\"1\",\"name\":\"1\",\"pic_url\":\"/uploads/product/1574133959.png,/uploads/higi/1566285909.png\",\"pic_alt\":\"123,456\",\"content\":\"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\",\"description\":\"BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB\",\"recipepro_id\":\"0\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":\"5\",\"brand_name\":\"1\",\"brand_pic_url\":\"/uploads/brand/1567073352.png\",\"brand_pic_alt\":\"2\",\"product_id\":\"1\",\"product_name\":\"1\",\"product_pic_urls\":\"/uploads/product/1565848035.png,/uploads/product/1565848034.png,/uploads/product/1565848036.png,/uploads/product/1565848037.png,/uploads/product/1565848038.png,/uploads/product/1565848039.png\",\"product_pic_alts\":\"4,3,,,,\",\"tags\":\"海鮮類,豆類\",\"type\":null,\"style\":null,\"methods\":\"\",\"note\":\"456\",\"note_pic_url\":null,\"note_pic_alt\":null,\"member_only\":\"0\",\"visitor\":\"99\",\"list_order\":\"1\",\"status\":\"0\",\"remark\":\"5\",\"c_time\":\"2019-08-16 10:56:05\",\"c_user_id\":\"1\",\"c_user_name\":\"admin\",\"u_time\":\"2019-11-19 13:31:35\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"},{\"id\":\"4\",\"name\":\"4\",\"pic_url\":\"/uploads/higi/1566285909.png\",\"pic_alt\":\"4\",\"content\":\"4\",\"description\":\"\",\"recipepro_id\":\"4\",\"recipepro_name\":\"4\",\"recipepro_pic_url\":\"/uploads/repicepro/1567072415.png\",\"recipepro_pic_alt\":\"A\",\"recipepro_member_only\":\"0\",\"brand_id\":\"1\",\"brand_name\":\"烹大師\",\"brand_pic_url\":\"/uploads/brand/1567073322.png\",\"brand_pic_alt\":\"\",\"product_id\":\"4\",\"product_name\":\"4\",\"product_pic_urls\":\"/uploads/product/1558350701.png\",\"product_pic_alts\":\"\",\"tags\":\"\",\"type\":null,\"style\":null,\"methods\":\"\",\"note\":\"3\",\"note_pic_url\":null,\"note_pic_alt\":null,\"member_only\":\"1\",\"visitor\":\"5\",\"list_order\":\"4\",\"status\":\"0\",\"remark\":\"5\",\"c_time\":\"2019-08-20 15:25:36\",\"c_user_id\":\"1\",\"c_user_name\":\"admin\",\"u_time\":\"2019-09-11 11:10:51\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"},{\"id\":\"14\",\"name\":\"14\",\"pic_url\":\"/uploads/higi/1566285909.png\",\"pic_alt\":\"14\",\"content\":\"14\",\"description\":\"\",\"recipepro_id\":\"14\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":\"1\",\"brand_name\":\"烹大師\",\"brand_pic_url\":\"/uploads/brand/1567073322.png\",\"brand_pic_alt\":\"\",\"product_id\":\"4\",\"product_name\":\"4\",\"product_pic_urls\":\"/uploads/product/1558350701.png\",\"product_pic_alts\":\"\",\"tags\":\"\",\"type\":null,\"style\":null,\"methods\":\"\",\"note\":\"\",\"note_pic_url\":null,\"note_pic_alt\":null,\"member_only\":\"1\",\"visitor\":\"1\",\"list_order\":\"14\",\"status\":\"0\",\"remark\":\"\",\"c_time\":\"2019-09-03 12:32:01\",\"c_user_id\":\"0\",\"c_user_name\":null,\"u_time\":\"2019-09-11 09:36:57\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"},{\"id\":\"24\",\"name\":\"24\",\"pic_url\":\"/uploads/higi/1566285936.png\",\"pic_alt\":\"24\",\"content\":\"24\",\"description\":\"\",\"recipepro_id\":\"24\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":\"1\",\"brand_name\":\"烹大師\",\"brand_pic_url\":\"/uploads/brand/1567073322.png\",\"brand_pic_alt\":\"\",\"product_id\":\"4\",\"product_name\":\"4\",\"product_pic_urls\":\"/uploads/product/1558350701.png\",\"product_pic_alts\":\"\",\"tags\":\"\",\"type\":null,\"style\":null,\"methods\":\"\",\"note\":\"\",\"note_pic_url\":null,\"note_pic_alt\":null,\"member_only\":\"0\",\"visitor\":\"3\",\"list_order\":\"24\",\"status\":\"0\",\"remark\":\"\",\"c_time\":\"2019-09-03 12:32:03\",\"c_user_id\":\"0\",\"c_user_name\":null,\"u_time\":\"2019-09-11 09:38:14\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"}]', '2019-11-19 13:36:37'),
(65, 0, '::1', 0, 'GET', 'member', 'loginmemberhigi', '[]', '\"\"', '0', '執行成功', '[{\"id\":\"31\",\"name\":\"招客秘技名稱\",\"pic_url\":\"圖片網址\",\"pic_alt\":\"圖片說明\",\"content\":\"招客秘技內容\",\"description\":\"\",\"recipepro_id\":\"0\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":null,\"brand_name\":null,\"brand_pic_url\":null,\"brand_pic_alt\":null,\"product_id\":\"0\",\"product_name\":null,\"product_pic_urls\":null,\"product_pic_alts\":null,\"tags\":\"\",\"type\":\"\",\"style\":\"標籤\",\"methods\":\"烹調方式\",\"note\":\"小筆記\",\"note_pic_url\":\"\",\"note_pic_alt\":\"\",\"member_only\":\"0\",\"visitor\":\"3\",\"list_order\":\"0\",\"status\":\"0\",\"remark\":\"備註\",\"c_time\":\"2019-09-12 09:37:34\",\"c_user_id\":\"1\",\"c_user_name\":\"admin\",\"u_time\":\"2019-11-19 11:38:56\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"},{\"id\":\"1\",\"name\":\"1\",\"pic_url\":\"/uploads/product/1574133959.png,/uploads/higi/1566285909.png\",\"pic_alt\":\"123,456\",\"content\":\"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\",\"description\":\"BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB\",\"recipepro_id\":\"0\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":\"5\",\"brand_name\":\"1\",\"brand_pic_url\":\"/uploads/brand/1567073352.png\",\"brand_pic_alt\":\"2\",\"product_id\":\"1\",\"product_name\":\"1\",\"product_pic_urls\":\"/uploads/product/1565848035.png,/uploads/product/1565848034.png,/uploads/product/1565848036.png,/uploads/product/1565848037.png,/uploads/product/1565848038.png,/uploads/product/1565848039.png\",\"product_pic_alts\":\"4,3,,,,\",\"tags\":\"海鮮類,豆類\",\"type\":\"韓式\",\"style\":\"麵食\",\"methods\":\"\",\"note\":\"456\",\"note_pic_url\":\"/uploads/higi/1574133162.png\",\"note_pic_alt\":\"123\",\"member_only\":\"0\",\"visitor\":\"99\",\"list_order\":\"1\",\"status\":\"0\",\"remark\":\"5\",\"c_time\":\"2019-08-16 10:56:05\",\"c_user_id\":\"1\",\"c_user_name\":\"admin\",\"u_time\":\"2019-11-19 13:31:35\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"},{\"id\":\"4\",\"name\":\"4\",\"pic_url\":\"/uploads/higi/1566285909.png\",\"pic_alt\":\"4\",\"content\":\"4\",\"description\":\"\",\"recipepro_id\":\"4\",\"recipepro_name\":\"4\",\"recipepro_pic_url\":\"/uploads/repicepro/1567072415.png\",\"recipepro_pic_alt\":\"A\",\"recipepro_member_only\":\"0\",\"brand_id\":\"1\",\"brand_name\":\"烹大師\",\"brand_pic_url\":\"/uploads/brand/1567073322.png\",\"brand_pic_alt\":\"\",\"product_id\":\"4\",\"product_name\":\"4\",\"product_pic_urls\":\"/uploads/product/1558350701.png\",\"product_pic_alts\":\"\",\"tags\":\"\",\"type\":\"\",\"style\":\"湯品\",\"methods\":\"\",\"note\":\"3\",\"note_pic_url\":\"\",\"note_pic_alt\":\"\",\"member_only\":\"1\",\"visitor\":\"5\",\"list_order\":\"4\",\"status\":\"0\",\"remark\":\"5\",\"c_time\":\"2019-08-20 15:25:36\",\"c_user_id\":\"1\",\"c_user_name\":\"admin\",\"u_time\":\"2019-09-11 11:10:51\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"},{\"id\":\"14\",\"name\":\"14\",\"pic_url\":\"/uploads/higi/1566285909.png\",\"pic_alt\":\"14\",\"content\":\"14\",\"description\":\"\",\"recipepro_id\":\"14\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":\"1\",\"brand_name\":\"烹大師\",\"brand_pic_url\":\"/uploads/brand/1567073322.png\",\"brand_pic_alt\":\"\",\"product_id\":\"4\",\"product_name\":\"4\",\"product_pic_urls\":\"/uploads/product/1558350701.png\",\"product_pic_alts\":\"\",\"tags\":\"\",\"type\":\"\",\"style\":\"湯品\",\"methods\":\"\",\"note\":\"\",\"note_pic_url\":\"\",\"note_pic_alt\":\"\",\"member_only\":\"1\",\"visitor\":\"1\",\"list_order\":\"14\",\"status\":\"0\",\"remark\":\"\",\"c_time\":\"2019-09-03 12:32:01\",\"c_user_id\":\"0\",\"c_user_name\":null,\"u_time\":\"2019-09-11 09:36:57\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"},{\"id\":\"24\",\"name\":\"24\",\"pic_url\":\"/uploads/higi/1566285936.png\",\"pic_alt\":\"24\",\"content\":\"24\",\"description\":\"\",\"recipepro_id\":\"24\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":\"1\",\"brand_name\":\"烹大師\",\"brand_pic_url\":\"/uploads/brand/1567073322.png\",\"brand_pic_alt\":\"\",\"product_id\":\"4\",\"product_name\":\"4\",\"product_pic_urls\":\"/uploads/product/1558350701.png\",\"product_pic_alts\":\"\",\"tags\":\"\",\"type\":\"\",\"style\":\"湯品\",\"methods\":\"\",\"note\":\"\",\"note_pic_url\":\"\",\"note_pic_alt\":\"\",\"member_only\":\"0\",\"visitor\":\"3\",\"list_order\":\"24\",\"status\":\"0\",\"remark\":\"\",\"c_time\":\"2019-09-03 12:32:03\",\"c_user_id\":\"0\",\"c_user_name\":null,\"u_time\":\"2019-09-11 09:38:14\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"}]', '2019-11-19 13:37:35'),
(66, 0, '::1', 0, 'GET', 'member', 'loginmemberdata', '[]', '\"\"', '0', '執行成功', '[{\"id\":\"1\",\"account\":\"vicwu0717@gmail.com\",\"verification\":\"9EC23092-2491-A1FF-BC1C-E01056DEC119\",\"name\":\"vic\",\"gender\":\"1\",\"birthday\":\"0000-00-00\",\"phone\":\"09188888\",\"restaurant_name\":\"vic\",\"restaurant_zipcode\":\"722\",\"restaurant_city_id\":\"15\",\"restaurant_city_name\":\"台南市\",\"restaurant_area_id\":\"234\",\"restaurant_area_name\":\"佳里區\",\"restaurant_type\":\"火鍋\",\"last_login_time\":\"2019-11-19 13:31:21\",\"last_login_ip\":\"::1\",\"status\":\"0\",\"remark\":\"\",\"c_time\":\"2019-10-17 17:38:39\",\"c_user_id\":\"2\",\"c_user_name\":\"web_server\",\"u_time\":\"2019-11-19 13:31:21\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"}]', '2019-11-19 13:37:44'),
(67, 0, '::1', 43, 'GET', 'cityarea', 'city', '[]', 'null', '0', '執行成功', '[{\"id\":\"1\",\"name\":\"基隆市\"},{\"id\":\"2\",\"name\":\"台北市\"},{\"id\":\"3\",\"name\":\"新北市\"},{\"id\":\"4\",\"name\":\"桃園市\"},{\"id\":\"5\",\"name\":\"新竹市\"},{\"id\":\"6\",\"name\":\"新竹縣\"},{\"id\":\"7\",\"name\":\"宜蘭縣\"},{\"id\":\"8\",\"name\":\"苗栗縣\"},{\"id\":\"9\",\"name\":\"台中市\"},{\"id\":\"10\",\"name\":\"彰化縣\"},{\"id\":\"11\",\"name\":\"南投縣\"},{\"id\":\"12\",\"name\":\"雲林縣\"},{\"id\":\"13\",\"name\":\"嘉義市\"},{\"id\":\"14\",\"name\":\"嘉義縣\"},{\"id\":\"15\",\"name\":\"台南市\"},{\"id\":\"16\",\"name\":\"高雄市\"},{\"id\":\"17\",\"name\":\"屏東縣\"},{\"id\":\"18\",\"name\":\"澎湖縣\"},{\"id\":\"19\",\"name\":\"花蓮縣\"},{\"id\":\"20\",\"name\":\"台東縣\"},{\"id\":\"21\",\"name\":\"金門縣\"},{\"id\":\"22\",\"name\":\"連江縣\"}]', '2019-11-19 13:37:44');
INSERT INTO `log` (`id`, `user_id`, `ip`, `program_id`, `method`, `endpoint`, `verb`, `args`, `file`, `resultCode`, `resultMessage`, `resultData`, `c_time`) VALUES
(68, 0, '::1', 0, 'GET', 'member', 'loginmemberrecipepro', '[]', '\"\"', '0', '執行成功', '[{\"id\":\"2\",\"name\":\"2\",\"pic_url\":\"/uploads/repicepro/1567072415.png\",\"pic_alt\":\"A\",\"feature\":\"\",\"tags\":\"雞肉\",\"price\":\"999\",\"type\":\"日式\",\"style\":\"火鍋\",\"product_ids\":\"1,2,3,19\",\"product_names\":\"1,2,3,19\",\"material_weight\":\"\",\"nutrition\":\"<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n		<tr>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n		<tr>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>碳水化合物</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n		<tr>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n		<tr>\r\n			<th>碳水化合物</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n\",\"member_only\":\"0\",\"visitor\":\"69\",\"list_order\":\"2\",\"status\":\"0\",\"remark\":\"\",\"c_time\":\"2019-08-19 19:43:07\",\"c_user_id\":\"1\",\"c_user_name\":\"admin\",\"u_time\":\"2019-11-19 09:45:10\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"},{\"id\":\"4\",\"name\":\"4\",\"pic_url\":\"/uploads/repicepro/1567072415.png\",\"pic_alt\":\"A\",\"feature\":\"7\",\"tags\":\"牛肉\",\"price\":\"0\",\"type\":\"中式\",\"style\":\"火鍋\",\"product_ids\":\"1\",\"product_names\":\"1\",\"material_weight\":\"\",\"nutrition\":\"\",\"member_only\":\"0\",\"visitor\":\"12\",\"list_order\":\"4\",\"status\":\"0\",\"remark\":\"\",\"c_time\":\"2019-08-19 19:43:07\",\"c_user_id\":\"1\",\"c_user_name\":\"admin\",\"u_time\":\"2019-10-05 09:44:51\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"},{\"id\":\"5\",\"name\":\"5\",\"pic_url\":\"/uploads/repicepro/1565924165.png\",\"pic_alt\":\"3\",\"feature\":\"6\",\"tags\":\"雞肉,豬肉,根莖類,主菜,火鍋\",\"price\":\"9\",\"type\":\"素食\",\"style\":\"火鍋\",\"product_ids\":\"1\",\"product_names\":\"1\",\"material_weight\":\"\",\"nutrition\":\"1\",\"member_only\":\"1\",\"visitor\":\"3\",\"list_order\":\"5\",\"status\":\"0\",\"remark\":\"11\",\"c_time\":\"2019-08-16 10:56:05\",\"c_user_id\":\"1\",\"c_user_name\":\"admin\",\"u_time\":\"2019-09-11 09:56:20\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"}]', '2019-11-19 13:37:44'),
(69, 0, '::1', 0, 'GET', 'member', 'loginmemberhigi', '[]', '\"\"', '0', '執行成功', '[{\"id\":\"31\",\"name\":\"招客秘技名稱\",\"pic_url\":\"圖片網址\",\"pic_alt\":\"圖片說明\",\"content\":\"招客秘技內容\",\"description\":\"\",\"recipepro_id\":\"0\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":null,\"brand_name\":null,\"brand_pic_url\":null,\"brand_pic_alt\":null,\"product_id\":\"0\",\"product_name\":null,\"product_pic_urls\":null,\"product_pic_alts\":null,\"tags\":\"\",\"type\":\"\",\"style\":\"標籤\",\"methods\":\"烹調方式\",\"note\":\"小筆記\",\"note_pic_url\":\"\",\"note_pic_alt\":\"\",\"member_only\":\"0\",\"visitor\":\"3\",\"list_order\":\"0\",\"status\":\"0\",\"remark\":\"備註\",\"c_time\":\"2019-09-12 09:37:34\",\"c_user_id\":\"1\",\"c_user_name\":\"admin\",\"u_time\":\"2019-11-19 11:38:56\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"},{\"id\":\"1\",\"name\":\"1\",\"pic_url\":\"/uploads/product/1574133959.png,/uploads/higi/1566285909.png\",\"pic_alt\":\"123,456\",\"content\":\"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\",\"description\":\"BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB\",\"recipepro_id\":\"0\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":\"5\",\"brand_name\":\"1\",\"brand_pic_url\":\"/uploads/brand/1567073352.png\",\"brand_pic_alt\":\"2\",\"product_id\":\"1\",\"product_name\":\"1\",\"product_pic_urls\":\"/uploads/product/1565848035.png,/uploads/product/1565848034.png,/uploads/product/1565848036.png,/uploads/product/1565848037.png,/uploads/product/1565848038.png,/uploads/product/1565848039.png\",\"product_pic_alts\":\"4,3,,,,\",\"tags\":\"海鮮類,豆類\",\"type\":\"韓式\",\"style\":\"麵食\",\"methods\":\"\",\"note\":\"456\",\"note_pic_url\":\"/uploads/higi/1574133162.png\",\"note_pic_alt\":\"123\",\"member_only\":\"0\",\"visitor\":\"99\",\"list_order\":\"1\",\"status\":\"0\",\"remark\":\"5\",\"c_time\":\"2019-08-16 10:56:05\",\"c_user_id\":\"1\",\"c_user_name\":\"admin\",\"u_time\":\"2019-11-19 13:31:35\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"},{\"id\":\"4\",\"name\":\"4\",\"pic_url\":\"/uploads/higi/1566285909.png\",\"pic_alt\":\"4\",\"content\":\"4\",\"description\":\"\",\"recipepro_id\":\"4\",\"recipepro_name\":\"4\",\"recipepro_pic_url\":\"/uploads/repicepro/1567072415.png\",\"recipepro_pic_alt\":\"A\",\"recipepro_member_only\":\"0\",\"brand_id\":\"1\",\"brand_name\":\"烹大師\",\"brand_pic_url\":\"/uploads/brand/1567073322.png\",\"brand_pic_alt\":\"\",\"product_id\":\"4\",\"product_name\":\"4\",\"product_pic_urls\":\"/uploads/product/1558350701.png\",\"product_pic_alts\":\"\",\"tags\":\"\",\"type\":\"\",\"style\":\"湯品\",\"methods\":\"\",\"note\":\"3\",\"note_pic_url\":\"\",\"note_pic_alt\":\"\",\"member_only\":\"1\",\"visitor\":\"5\",\"list_order\":\"4\",\"status\":\"0\",\"remark\":\"5\",\"c_time\":\"2019-08-20 15:25:36\",\"c_user_id\":\"1\",\"c_user_name\":\"admin\",\"u_time\":\"2019-09-11 11:10:51\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"},{\"id\":\"14\",\"name\":\"14\",\"pic_url\":\"/uploads/higi/1566285909.png\",\"pic_alt\":\"14\",\"content\":\"14\",\"description\":\"\",\"recipepro_id\":\"14\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":\"1\",\"brand_name\":\"烹大師\",\"brand_pic_url\":\"/uploads/brand/1567073322.png\",\"brand_pic_alt\":\"\",\"product_id\":\"4\",\"product_name\":\"4\",\"product_pic_urls\":\"/uploads/product/1558350701.png\",\"product_pic_alts\":\"\",\"tags\":\"\",\"type\":\"\",\"style\":\"湯品\",\"methods\":\"\",\"note\":\"\",\"note_pic_url\":\"\",\"note_pic_alt\":\"\",\"member_only\":\"1\",\"visitor\":\"1\",\"list_order\":\"14\",\"status\":\"0\",\"remark\":\"\",\"c_time\":\"2019-09-03 12:32:01\",\"c_user_id\":\"0\",\"c_user_name\":null,\"u_time\":\"2019-09-11 09:36:57\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"},{\"id\":\"24\",\"name\":\"24\",\"pic_url\":\"/uploads/higi/1566285936.png\",\"pic_alt\":\"24\",\"content\":\"24\",\"description\":\"\",\"recipepro_id\":\"24\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":\"1\",\"brand_name\":\"烹大師\",\"brand_pic_url\":\"/uploads/brand/1567073322.png\",\"brand_pic_alt\":\"\",\"product_id\":\"4\",\"product_name\":\"4\",\"product_pic_urls\":\"/uploads/product/1558350701.png\",\"product_pic_alts\":\"\",\"tags\":\"\",\"type\":\"\",\"style\":\"湯品\",\"methods\":\"\",\"note\":\"\",\"note_pic_url\":\"\",\"note_pic_alt\":\"\",\"member_only\":\"0\",\"visitor\":\"3\",\"list_order\":\"24\",\"status\":\"0\",\"remark\":\"\",\"c_time\":\"2019-09-03 12:32:03\",\"c_user_id\":\"0\",\"c_user_name\":null,\"u_time\":\"2019-09-11 09:38:14\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"}]', '2019-11-19 13:37:44'),
(70, 0, '::1', 44, 'GET', 'cityarea', 'area', '[]', 'null', '0', '執行成功', '[{\"zipcode\":\"700\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"216\",\"area_name\":\"中西區\"},{\"zipcode\":\"701\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"217\",\"area_name\":\"東區\"},{\"zipcode\":\"702\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"218\",\"area_name\":\"南區\"},{\"zipcode\":\"704\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"219\",\"area_name\":\"北區\"},{\"zipcode\":\"708\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"220\",\"area_name\":\"安平區\"},{\"zipcode\":\"709\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"221\",\"area_name\":\"安南區\"},{\"zipcode\":\"710\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"222\",\"area_name\":\"永康區\"},{\"zipcode\":\"711\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"223\",\"area_name\":\"歸仁區\"},{\"zipcode\":\"712\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"224\",\"area_name\":\"新化區\"},{\"zipcode\":\"713\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"225\",\"area_name\":\"左鎮區\"},{\"zipcode\":\"714\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"226\",\"area_name\":\"玉井區\"},{\"zipcode\":\"715\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"227\",\"area_name\":\"楠西區\"},{\"zipcode\":\"716\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"228\",\"area_name\":\"南化區\"},{\"zipcode\":\"717\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"229\",\"area_name\":\"仁德區\"},{\"zipcode\":\"718\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"230\",\"area_name\":\"關廟區\"},{\"zipcode\":\"719\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"231\",\"area_name\":\"龍崎區\"},{\"zipcode\":\"720\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"232\",\"area_name\":\"官田區\"},{\"zipcode\":\"721\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"233\",\"area_name\":\"麻豆區\"},{\"zipcode\":\"722\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"234\",\"area_name\":\"佳里區\"},{\"zipcode\":\"723\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"235\",\"area_name\":\"西港區\"},{\"zipcode\":\"724\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"236\",\"area_name\":\"七股區\"},{\"zipcode\":\"725\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"237\",\"area_name\":\"將軍區\"},{\"zipcode\":\"726\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"238\",\"area_name\":\"學甲區\"},{\"zipcode\":\"727\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"239\",\"area_name\":\"北門區\"},{\"zipcode\":\"730\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"240\",\"area_name\":\"新營區\"},{\"zipcode\":\"731\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"241\",\"area_name\":\"後壁區\"},{\"zipcode\":\"732\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"242\",\"area_name\":\"白河區\"},{\"zipcode\":\"733\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"243\",\"area_name\":\"東山區\"},{\"zipcode\":\"734\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"244\",\"area_name\":\"六甲區\"},{\"zipcode\":\"735\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"245\",\"area_name\":\"下營區\"},{\"zipcode\":\"736\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"246\",\"area_name\":\"柳營區\"},{\"zipcode\":\"737\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"247\",\"area_name\":\"鹽水區\"},{\"zipcode\":\"741\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"248\",\"area_name\":\"善化區\"},{\"zipcode\":\"742\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"249\",\"area_name\":\"大內區\"},{\"zipcode\":\"743\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"250\",\"area_name\":\"山上區\"},{\"zipcode\":\"744\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"251\",\"area_name\":\"新市區\"},{\"zipcode\":\"745\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"252\",\"area_name\":\"安定區\"}]', '2019-11-19 13:37:44'),
(71, 0, '::1', 0, 'GET', 'member', 'loginmemberdata', '[]', '\"\"', '0', '執行成功', '[{\"id\":\"1\",\"account\":\"vicwu0717@gmail.com\",\"verification\":\"9EC23092-2491-A1FF-BC1C-E01056DEC119\",\"name\":\"vic\",\"gender\":\"1\",\"birthday\":\"0000-00-00\",\"phone\":\"09188888\",\"restaurant_name\":\"vic\",\"restaurant_zipcode\":\"722\",\"restaurant_city_id\":\"15\",\"restaurant_city_name\":\"台南市\",\"restaurant_area_id\":\"234\",\"restaurant_area_name\":\"佳里區\",\"restaurant_type\":\"火鍋\",\"last_login_time\":\"2019-11-19 13:31:21\",\"last_login_ip\":\"::1\",\"status\":\"0\",\"remark\":\"\",\"c_time\":\"2019-10-17 17:38:39\",\"c_user_id\":\"2\",\"c_user_name\":\"web_server\",\"u_time\":\"2019-11-19 13:31:21\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"}]', '2019-11-19 13:38:50'),
(72, 0, '::1', 43, 'GET', 'cityarea', 'city', '[]', 'null', '0', '執行成功', '[{\"id\":\"1\",\"name\":\"基隆市\"},{\"id\":\"2\",\"name\":\"台北市\"},{\"id\":\"3\",\"name\":\"新北市\"},{\"id\":\"4\",\"name\":\"桃園市\"},{\"id\":\"5\",\"name\":\"新竹市\"},{\"id\":\"6\",\"name\":\"新竹縣\"},{\"id\":\"7\",\"name\":\"宜蘭縣\"},{\"id\":\"8\",\"name\":\"苗栗縣\"},{\"id\":\"9\",\"name\":\"台中市\"},{\"id\":\"10\",\"name\":\"彰化縣\"},{\"id\":\"11\",\"name\":\"南投縣\"},{\"id\":\"12\",\"name\":\"雲林縣\"},{\"id\":\"13\",\"name\":\"嘉義市\"},{\"id\":\"14\",\"name\":\"嘉義縣\"},{\"id\":\"15\",\"name\":\"台南市\"},{\"id\":\"16\",\"name\":\"高雄市\"},{\"id\":\"17\",\"name\":\"屏東縣\"},{\"id\":\"18\",\"name\":\"澎湖縣\"},{\"id\":\"19\",\"name\":\"花蓮縣\"},{\"id\":\"20\",\"name\":\"台東縣\"},{\"id\":\"21\",\"name\":\"金門縣\"},{\"id\":\"22\",\"name\":\"連江縣\"}]', '2019-11-19 13:38:50'),
(73, 0, '::1', 0, 'GET', 'member', 'loginmemberrecipepro', '[]', '\"\"', '0', '執行成功', '[{\"id\":\"2\",\"name\":\"2\",\"pic_url\":\"/uploads/repicepro/1567072415.png\",\"pic_alt\":\"A\",\"feature\":\"\",\"tags\":\"雞肉\",\"price\":\"999\",\"type\":\"日式\",\"style\":\"火鍋\",\"product_ids\":\"1,2,3,19\",\"product_names\":\"1,2,3,19\",\"material_weight\":\"\",\"nutrition\":\"<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n		<tr>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n		<tr>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>碳水化合物</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n		<tr>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n		<tr>\r\n			<th>碳水化合物</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n\",\"member_only\":\"0\",\"visitor\":\"69\",\"list_order\":\"2\",\"status\":\"0\",\"remark\":\"\",\"c_time\":\"2019-08-19 19:43:07\",\"c_user_id\":\"1\",\"c_user_name\":\"admin\",\"u_time\":\"2019-11-19 09:45:10\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"},{\"id\":\"4\",\"name\":\"4\",\"pic_url\":\"/uploads/repicepro/1567072415.png\",\"pic_alt\":\"A\",\"feature\":\"7\",\"tags\":\"牛肉\",\"price\":\"0\",\"type\":\"中式\",\"style\":\"火鍋\",\"product_ids\":\"1\",\"product_names\":\"1\",\"material_weight\":\"\",\"nutrition\":\"\",\"member_only\":\"0\",\"visitor\":\"12\",\"list_order\":\"4\",\"status\":\"0\",\"remark\":\"\",\"c_time\":\"2019-08-19 19:43:07\",\"c_user_id\":\"1\",\"c_user_name\":\"admin\",\"u_time\":\"2019-10-05 09:44:51\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"},{\"id\":\"5\",\"name\":\"5\",\"pic_url\":\"/uploads/repicepro/1565924165.png\",\"pic_alt\":\"3\",\"feature\":\"6\",\"tags\":\"雞肉,豬肉,根莖類,主菜,火鍋\",\"price\":\"9\",\"type\":\"素食\",\"style\":\"火鍋\",\"product_ids\":\"1\",\"product_names\":\"1\",\"material_weight\":\"\",\"nutrition\":\"1\",\"member_only\":\"1\",\"visitor\":\"3\",\"list_order\":\"5\",\"status\":\"0\",\"remark\":\"11\",\"c_time\":\"2019-08-16 10:56:05\",\"c_user_id\":\"1\",\"c_user_name\":\"admin\",\"u_time\":\"2019-09-11 09:56:20\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"}]', '2019-11-19 13:38:50'),
(74, 0, '::1', 0, 'GET', 'member', 'loginmemberhigi', '[]', '\"\"', '0', '執行成功', '[{\"id\":\"31\",\"name\":\"招客秘技名稱\",\"pic_url\":\"圖片網址\",\"pic_alt\":\"圖片說明\",\"content\":\"招客秘技內容\",\"description\":\"\",\"recipepro_id\":\"0\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":null,\"brand_name\":null,\"brand_pic_url\":null,\"brand_pic_alt\":null,\"product_id\":\"0\",\"product_name\":null,\"product_pic_urls\":null,\"product_pic_alts\":null,\"tags\":\"\",\"type\":\"\",\"style\":\"標籤\",\"methods\":\"烹調方式\",\"note\":\"小筆記\",\"note_pic_url\":\"\",\"note_pic_alt\":\"\",\"member_only\":\"0\",\"visitor\":\"3\",\"list_order\":\"0\",\"status\":\"0\",\"remark\":\"備註\",\"c_time\":\"2019-09-12 09:37:34\",\"c_user_id\":\"1\",\"c_user_name\":\"admin\",\"u_time\":\"2019-11-19 11:38:56\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"},{\"id\":\"1\",\"name\":\"1\",\"pic_url\":\"/uploads/product/1574133959.png,/uploads/higi/1566285909.png\",\"pic_alt\":\"123,456\",\"content\":\"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\",\"description\":\"BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB\",\"recipepro_id\":\"0\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":\"5\",\"brand_name\":\"1\",\"brand_pic_url\":\"/uploads/brand/1567073352.png\",\"brand_pic_alt\":\"2\",\"product_id\":\"1\",\"product_name\":\"1\",\"product_pic_urls\":\"/uploads/product/1565848035.png,/uploads/product/1565848034.png,/uploads/product/1565848036.png,/uploads/product/1565848037.png,/uploads/product/1565848038.png,/uploads/product/1565848039.png\",\"product_pic_alts\":\"4,3,,,,\",\"tags\":\"海鮮類,豆類\",\"type\":\"韓式\",\"style\":\"麵食\",\"methods\":\"\",\"note\":\"456\",\"note_pic_url\":\"/uploads/higi/1574133162.png\",\"note_pic_alt\":\"123\",\"member_only\":\"0\",\"visitor\":\"99\",\"list_order\":\"1\",\"status\":\"0\",\"remark\":\"5\",\"c_time\":\"2019-08-16 10:56:05\",\"c_user_id\":\"1\",\"c_user_name\":\"admin\",\"u_time\":\"2019-11-19 13:31:35\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"},{\"id\":\"4\",\"name\":\"4\",\"pic_url\":\"/uploads/higi/1566285909.png\",\"pic_alt\":\"4\",\"content\":\"4\",\"description\":\"\",\"recipepro_id\":\"4\",\"recipepro_name\":\"4\",\"recipepro_pic_url\":\"/uploads/repicepro/1567072415.png\",\"recipepro_pic_alt\":\"A\",\"recipepro_member_only\":\"0\",\"brand_id\":\"1\",\"brand_name\":\"烹大師\",\"brand_pic_url\":\"/uploads/brand/1567073322.png\",\"brand_pic_alt\":\"\",\"product_id\":\"4\",\"product_name\":\"4\",\"product_pic_urls\":\"/uploads/product/1558350701.png\",\"product_pic_alts\":\"\",\"tags\":\"\",\"type\":\"\",\"style\":\"湯品\",\"methods\":\"\",\"note\":\"3\",\"note_pic_url\":\"\",\"note_pic_alt\":\"\",\"member_only\":\"1\",\"visitor\":\"5\",\"list_order\":\"4\",\"status\":\"0\",\"remark\":\"5\",\"c_time\":\"2019-08-20 15:25:36\",\"c_user_id\":\"1\",\"c_user_name\":\"admin\",\"u_time\":\"2019-09-11 11:10:51\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"},{\"id\":\"14\",\"name\":\"14\",\"pic_url\":\"/uploads/higi/1566285909.png\",\"pic_alt\":\"14\",\"content\":\"14\",\"description\":\"\",\"recipepro_id\":\"14\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":\"1\",\"brand_name\":\"烹大師\",\"brand_pic_url\":\"/uploads/brand/1567073322.png\",\"brand_pic_alt\":\"\",\"product_id\":\"4\",\"product_name\":\"4\",\"product_pic_urls\":\"/uploads/product/1558350701.png\",\"product_pic_alts\":\"\",\"tags\":\"\",\"type\":\"\",\"style\":\"湯品\",\"methods\":\"\",\"note\":\"\",\"note_pic_url\":\"\",\"note_pic_alt\":\"\",\"member_only\":\"1\",\"visitor\":\"1\",\"list_order\":\"14\",\"status\":\"0\",\"remark\":\"\",\"c_time\":\"2019-09-03 12:32:01\",\"c_user_id\":\"0\",\"c_user_name\":null,\"u_time\":\"2019-09-11 09:36:57\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"},{\"id\":\"24\",\"name\":\"24\",\"pic_url\":\"/uploads/higi/1566285936.png\",\"pic_alt\":\"24\",\"content\":\"24\",\"description\":\"\",\"recipepro_id\":\"24\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":\"1\",\"brand_name\":\"烹大師\",\"brand_pic_url\":\"/uploads/brand/1567073322.png\",\"brand_pic_alt\":\"\",\"product_id\":\"4\",\"product_name\":\"4\",\"product_pic_urls\":\"/uploads/product/1558350701.png\",\"product_pic_alts\":\"\",\"tags\":\"\",\"type\":\"\",\"style\":\"湯品\",\"methods\":\"\",\"note\":\"\",\"note_pic_url\":\"\",\"note_pic_alt\":\"\",\"member_only\":\"0\",\"visitor\":\"3\",\"list_order\":\"24\",\"status\":\"0\",\"remark\":\"\",\"c_time\":\"2019-09-03 12:32:03\",\"c_user_id\":\"0\",\"c_user_name\":null,\"u_time\":\"2019-09-11 09:38:14\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"}]', '2019-11-19 13:38:50'),
(75, 0, '::1', 44, 'GET', 'cityarea', 'area', '[]', 'null', '0', '執行成功', '[{\"zipcode\":\"700\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"216\",\"area_name\":\"中西區\"},{\"zipcode\":\"701\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"217\",\"area_name\":\"東區\"},{\"zipcode\":\"702\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"218\",\"area_name\":\"南區\"},{\"zipcode\":\"704\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"219\",\"area_name\":\"北區\"},{\"zipcode\":\"708\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"220\",\"area_name\":\"安平區\"},{\"zipcode\":\"709\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"221\",\"area_name\":\"安南區\"},{\"zipcode\":\"710\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"222\",\"area_name\":\"永康區\"},{\"zipcode\":\"711\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"223\",\"area_name\":\"歸仁區\"},{\"zipcode\":\"712\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"224\",\"area_name\":\"新化區\"},{\"zipcode\":\"713\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"225\",\"area_name\":\"左鎮區\"},{\"zipcode\":\"714\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"226\",\"area_name\":\"玉井區\"},{\"zipcode\":\"715\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"227\",\"area_name\":\"楠西區\"},{\"zipcode\":\"716\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"228\",\"area_name\":\"南化區\"},{\"zipcode\":\"717\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"229\",\"area_name\":\"仁德區\"},{\"zipcode\":\"718\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"230\",\"area_name\":\"關廟區\"},{\"zipcode\":\"719\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"231\",\"area_name\":\"龍崎區\"},{\"zipcode\":\"720\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"232\",\"area_name\":\"官田區\"},{\"zipcode\":\"721\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"233\",\"area_name\":\"麻豆區\"},{\"zipcode\":\"722\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"234\",\"area_name\":\"佳里區\"},{\"zipcode\":\"723\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"235\",\"area_name\":\"西港區\"},{\"zipcode\":\"724\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"236\",\"area_name\":\"七股區\"},{\"zipcode\":\"725\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"237\",\"area_name\":\"將軍區\"},{\"zipcode\":\"726\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"238\",\"area_name\":\"學甲區\"},{\"zipcode\":\"727\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"239\",\"area_name\":\"北門區\"},{\"zipcode\":\"730\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"240\",\"area_name\":\"新營區\"},{\"zipcode\":\"731\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"241\",\"area_name\":\"後壁區\"},{\"zipcode\":\"732\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"242\",\"area_name\":\"白河區\"},{\"zipcode\":\"733\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"243\",\"area_name\":\"東山區\"},{\"zipcode\":\"734\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"244\",\"area_name\":\"六甲區\"},{\"zipcode\":\"735\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"245\",\"area_name\":\"下營區\"},{\"zipcode\":\"736\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"246\",\"area_name\":\"柳營區\"},{\"zipcode\":\"737\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"247\",\"area_name\":\"鹽水區\"},{\"zipcode\":\"741\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"248\",\"area_name\":\"善化區\"},{\"zipcode\":\"742\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"249\",\"area_name\":\"大內區\"},{\"zipcode\":\"743\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"250\",\"area_name\":\"山上區\"},{\"zipcode\":\"744\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"251\",\"area_name\":\"新市區\"},{\"zipcode\":\"745\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"252\",\"area_name\":\"安定區\"}]', '2019-11-19 13:38:50'),
(76, 0, '::1', 0, 'GET', 'member', 'loginmemberdata', '[]', '\"\"', '0', '執行成功', '[{\"id\":\"1\",\"account\":\"vicwu0717@gmail.com\",\"verification\":\"9EC23092-2491-A1FF-BC1C-E01056DEC119\",\"name\":\"vic\",\"gender\":\"1\",\"birthday\":\"0000-00-00\",\"phone\":\"09188888\",\"restaurant_name\":\"vic\",\"restaurant_zipcode\":\"722\",\"restaurant_city_id\":\"15\",\"restaurant_city_name\":\"台南市\",\"restaurant_area_id\":\"234\",\"restaurant_area_name\":\"佳里區\",\"restaurant_type\":\"火鍋\",\"last_login_time\":\"2019-11-19 13:31:21\",\"last_login_ip\":\"::1\",\"status\":\"0\",\"remark\":\"\",\"c_time\":\"2019-10-17 17:38:39\",\"c_user_id\":\"2\",\"c_user_name\":\"web_server\",\"u_time\":\"2019-11-19 13:31:21\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"}]', '2019-11-19 13:39:04'),
(77, 0, '::1', 43, 'GET', 'cityarea', 'city', '[]', 'null', '0', '執行成功', '[{\"id\":\"1\",\"name\":\"基隆市\"},{\"id\":\"2\",\"name\":\"台北市\"},{\"id\":\"3\",\"name\":\"新北市\"},{\"id\":\"4\",\"name\":\"桃園市\"},{\"id\":\"5\",\"name\":\"新竹市\"},{\"id\":\"6\",\"name\":\"新竹縣\"},{\"id\":\"7\",\"name\":\"宜蘭縣\"},{\"id\":\"8\",\"name\":\"苗栗縣\"},{\"id\":\"9\",\"name\":\"台中市\"},{\"id\":\"10\",\"name\":\"彰化縣\"},{\"id\":\"11\",\"name\":\"南投縣\"},{\"id\":\"12\",\"name\":\"雲林縣\"},{\"id\":\"13\",\"name\":\"嘉義市\"},{\"id\":\"14\",\"name\":\"嘉義縣\"},{\"id\":\"15\",\"name\":\"台南市\"},{\"id\":\"16\",\"name\":\"高雄市\"},{\"id\":\"17\",\"name\":\"屏東縣\"},{\"id\":\"18\",\"name\":\"澎湖縣\"},{\"id\":\"19\",\"name\":\"花蓮縣\"},{\"id\":\"20\",\"name\":\"台東縣\"},{\"id\":\"21\",\"name\":\"金門縣\"},{\"id\":\"22\",\"name\":\"連江縣\"}]', '2019-11-19 13:39:04'),
(78, 0, '::1', 0, 'GET', 'member', 'loginmemberrecipepro', '[]', '\"\"', '0', '執行成功', '[{\"id\":\"2\",\"name\":\"2\",\"pic_url\":\"/uploads/repicepro/1567072415.png\",\"pic_alt\":\"A\",\"feature\":\"\",\"tags\":\"雞肉\",\"price\":\"999\",\"type\":\"日式\",\"style\":\"火鍋\",\"product_ids\":\"1,2,3,19\",\"product_names\":\"1,2,3,19\",\"material_weight\":\"\",\"nutrition\":\"<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n		<tr>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n		<tr>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>碳水化合物</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n		<tr>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n		<tr>\r\n			<th>碳水化合物</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n\",\"member_only\":\"0\",\"visitor\":\"69\",\"list_order\":\"2\",\"status\":\"0\",\"remark\":\"\",\"c_time\":\"2019-08-19 19:43:07\",\"c_user_id\":\"1\",\"c_user_name\":\"admin\",\"u_time\":\"2019-11-19 09:45:10\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"},{\"id\":\"4\",\"name\":\"4\",\"pic_url\":\"/uploads/repicepro/1567072415.png\",\"pic_alt\":\"A\",\"feature\":\"7\",\"tags\":\"牛肉\",\"price\":\"0\",\"type\":\"中式\",\"style\":\"火鍋\",\"product_ids\":\"1\",\"product_names\":\"1\",\"material_weight\":\"\",\"nutrition\":\"\",\"member_only\":\"0\",\"visitor\":\"12\",\"list_order\":\"4\",\"status\":\"0\",\"remark\":\"\",\"c_time\":\"2019-08-19 19:43:07\",\"c_user_id\":\"1\",\"c_user_name\":\"admin\",\"u_time\":\"2019-10-05 09:44:51\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"},{\"id\":\"5\",\"name\":\"5\",\"pic_url\":\"/uploads/repicepro/1565924165.png\",\"pic_alt\":\"3\",\"feature\":\"6\",\"tags\":\"雞肉,豬肉,根莖類,主菜,火鍋\",\"price\":\"9\",\"type\":\"素食\",\"style\":\"火鍋\",\"product_ids\":\"1\",\"product_names\":\"1\",\"material_weight\":\"\",\"nutrition\":\"1\",\"member_only\":\"1\",\"visitor\":\"3\",\"list_order\":\"5\",\"status\":\"0\",\"remark\":\"11\",\"c_time\":\"2019-08-16 10:56:05\",\"c_user_id\":\"1\",\"c_user_name\":\"admin\",\"u_time\":\"2019-09-11 09:56:20\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"}]', '2019-11-19 13:39:04'),
(79, 0, '::1', 0, 'GET', 'member', 'loginmemberhigi', '[]', '\"\"', '0', '執行成功', '[{\"id\":\"31\",\"name\":\"招客秘技名稱\",\"pic_url\":\"圖片網址\",\"pic_alt\":\"圖片說明\",\"content\":\"招客秘技內容\",\"description\":\"\",\"recipepro_id\":\"0\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":null,\"brand_name\":null,\"brand_pic_url\":null,\"brand_pic_alt\":null,\"product_id\":\"0\",\"product_name\":null,\"product_pic_urls\":null,\"product_pic_alts\":null,\"tags\":\"\",\"type\":\"\",\"style\":\"標籤\",\"methods\":\"烹調方式\",\"note\":\"小筆記\",\"note_pic_url\":\"\",\"note_pic_alt\":\"\",\"member_only\":\"0\",\"visitor\":\"3\",\"list_order\":\"0\",\"status\":\"0\",\"remark\":\"備註\",\"c_time\":\"2019-09-12 09:37:34\",\"c_user_id\":\"1\",\"c_user_name\":\"admin\",\"u_time\":\"2019-11-19 11:38:56\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"},{\"id\":\"1\",\"name\":\"1\",\"pic_url\":\"/uploads/product/1574133959.png,/uploads/higi/1566285909.png\",\"pic_alt\":\"123,456\",\"content\":\"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\",\"description\":\"BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB\",\"recipepro_id\":\"0\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":\"5\",\"brand_name\":\"1\",\"brand_pic_url\":\"/uploads/brand/1567073352.png\",\"brand_pic_alt\":\"2\",\"product_id\":\"1\",\"product_name\":\"1\",\"product_pic_urls\":\"/uploads/product/1565848035.png,/uploads/product/1565848034.png,/uploads/product/1565848036.png,/uploads/product/1565848037.png,/uploads/product/1565848038.png,/uploads/product/1565848039.png\",\"product_pic_alts\":\"4,3,,,,\",\"tags\":\"海鮮類,豆類\",\"type\":\"韓式\",\"style\":\"麵食\",\"methods\":\"\",\"note\":\"456\",\"note_pic_url\":\"/uploads/higi/1574133162.png\",\"note_pic_alt\":\"123\",\"member_only\":\"0\",\"visitor\":\"99\",\"list_order\":\"1\",\"status\":\"0\",\"remark\":\"5\",\"c_time\":\"2019-08-16 10:56:05\",\"c_user_id\":\"1\",\"c_user_name\":\"admin\",\"u_time\":\"2019-11-19 13:31:35\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"},{\"id\":\"4\",\"name\":\"4\",\"pic_url\":\"/uploads/higi/1566285909.png\",\"pic_alt\":\"4\",\"content\":\"4\",\"description\":\"\",\"recipepro_id\":\"4\",\"recipepro_name\":\"4\",\"recipepro_pic_url\":\"/uploads/repicepro/1567072415.png\",\"recipepro_pic_alt\":\"A\",\"recipepro_member_only\":\"0\",\"brand_id\":\"1\",\"brand_name\":\"烹大師\",\"brand_pic_url\":\"/uploads/brand/1567073322.png\",\"brand_pic_alt\":\"\",\"product_id\":\"4\",\"product_name\":\"4\",\"product_pic_urls\":\"/uploads/product/1558350701.png\",\"product_pic_alts\":\"\",\"tags\":\"\",\"type\":\"\",\"style\":\"湯品\",\"methods\":\"\",\"note\":\"3\",\"note_pic_url\":\"\",\"note_pic_alt\":\"\",\"member_only\":\"1\",\"visitor\":\"5\",\"list_order\":\"4\",\"status\":\"0\",\"remark\":\"5\",\"c_time\":\"2019-08-20 15:25:36\",\"c_user_id\":\"1\",\"c_user_name\":\"admin\",\"u_time\":\"2019-09-11 11:10:51\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"},{\"id\":\"14\",\"name\":\"14\",\"pic_url\":\"/uploads/higi/1566285909.png\",\"pic_alt\":\"14\",\"content\":\"14\",\"description\":\"\",\"recipepro_id\":\"14\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":\"1\",\"brand_name\":\"烹大師\",\"brand_pic_url\":\"/uploads/brand/1567073322.png\",\"brand_pic_alt\":\"\",\"product_id\":\"4\",\"product_name\":\"4\",\"product_pic_urls\":\"/uploads/product/1558350701.png\",\"product_pic_alts\":\"\",\"tags\":\"\",\"type\":\"\",\"style\":\"湯品\",\"methods\":\"\",\"note\":\"\",\"note_pic_url\":\"\",\"note_pic_alt\":\"\",\"member_only\":\"1\",\"visitor\":\"1\",\"list_order\":\"14\",\"status\":\"0\",\"remark\":\"\",\"c_time\":\"2019-09-03 12:32:01\",\"c_user_id\":\"0\",\"c_user_name\":null,\"u_time\":\"2019-09-11 09:36:57\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"},{\"id\":\"24\",\"name\":\"24\",\"pic_url\":\"/uploads/higi/1566285936.png\",\"pic_alt\":\"24\",\"content\":\"24\",\"description\":\"\",\"recipepro_id\":\"24\",\"recipepro_name\":null,\"recipepro_pic_url\":null,\"recipepro_pic_alt\":null,\"recipepro_member_only\":null,\"brand_id\":\"1\",\"brand_name\":\"烹大師\",\"brand_pic_url\":\"/uploads/brand/1567073322.png\",\"brand_pic_alt\":\"\",\"product_id\":\"4\",\"product_name\":\"4\",\"product_pic_urls\":\"/uploads/product/1558350701.png\",\"product_pic_alts\":\"\",\"tags\":\"\",\"type\":\"\",\"style\":\"湯品\",\"methods\":\"\",\"note\":\"\",\"note_pic_url\":\"\",\"note_pic_alt\":\"\",\"member_only\":\"0\",\"visitor\":\"3\",\"list_order\":\"24\",\"status\":\"0\",\"remark\":\"\",\"c_time\":\"2019-09-03 12:32:03\",\"c_user_id\":\"0\",\"c_user_name\":null,\"u_time\":\"2019-09-11 09:38:14\",\"u_user_id\":\"2\",\"u_user_name\":\"web_server\"}]', '2019-11-19 13:39:04'),
(80, 0, '::1', 44, 'GET', 'cityarea', 'area', '[]', 'null', '0', '執行成功', '[{\"zipcode\":\"700\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"216\",\"area_name\":\"中西區\"},{\"zipcode\":\"701\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"217\",\"area_name\":\"東區\"},{\"zipcode\":\"702\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"218\",\"area_name\":\"南區\"},{\"zipcode\":\"704\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"219\",\"area_name\":\"北區\"},{\"zipcode\":\"708\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"220\",\"area_name\":\"安平區\"},{\"zipcode\":\"709\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"221\",\"area_name\":\"安南區\"},{\"zipcode\":\"710\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"222\",\"area_name\":\"永康區\"},{\"zipcode\":\"711\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"223\",\"area_name\":\"歸仁區\"},{\"zipcode\":\"712\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"224\",\"area_name\":\"新化區\"},{\"zipcode\":\"713\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"225\",\"area_name\":\"左鎮區\"},{\"zipcode\":\"714\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"226\",\"area_name\":\"玉井區\"},{\"zipcode\":\"715\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"227\",\"area_name\":\"楠西區\"},{\"zipcode\":\"716\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"228\",\"area_name\":\"南化區\"},{\"zipcode\":\"717\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"229\",\"area_name\":\"仁德區\"},{\"zipcode\":\"718\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"230\",\"area_name\":\"關廟區\"},{\"zipcode\":\"719\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"231\",\"area_name\":\"龍崎區\"},{\"zipcode\":\"720\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"232\",\"area_name\":\"官田區\"},{\"zipcode\":\"721\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"233\",\"area_name\":\"麻豆區\"},{\"zipcode\":\"722\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"234\",\"area_name\":\"佳里區\"},{\"zipcode\":\"723\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"235\",\"area_name\":\"西港區\"},{\"zipcode\":\"724\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"236\",\"area_name\":\"七股區\"},{\"zipcode\":\"725\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"237\",\"area_name\":\"將軍區\"},{\"zipcode\":\"726\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"238\",\"area_name\":\"學甲區\"},{\"zipcode\":\"727\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"239\",\"area_name\":\"北門區\"},{\"zipcode\":\"730\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"240\",\"area_name\":\"新營區\"},{\"zipcode\":\"731\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"241\",\"area_name\":\"後壁區\"},{\"zipcode\":\"732\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"242\",\"area_name\":\"白河區\"},{\"zipcode\":\"733\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"243\",\"area_name\":\"東山區\"},{\"zipcode\":\"734\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"244\",\"area_name\":\"六甲區\"},{\"zipcode\":\"735\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"245\",\"area_name\":\"下營區\"},{\"zipcode\":\"736\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"246\",\"area_name\":\"柳營區\"},{\"zipcode\":\"737\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"247\",\"area_name\":\"鹽水區\"},{\"zipcode\":\"741\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"248\",\"area_name\":\"善化區\"},{\"zipcode\":\"742\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"249\",\"area_name\":\"大內區\"},{\"zipcode\":\"743\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"250\",\"area_name\":\"山上區\"},{\"zipcode\":\"744\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"251\",\"area_name\":\"新市區\"},{\"zipcode\":\"745\",\"city_id\":\"15\",\"city_name\":\"台南市\",\"area_id\":\"252\",\"area_name\":\"安定區\"}]', '2019-11-19 13:39:04'),
(81, 0, '::1', 0, 'DELETE', 'member', 'loginmemberhigi', '[]', '\"\"', '0', '執行成功', '{\"member_id\":\"1\",\"higi_id\":\"1\"}', '2019-11-19 13:39:13'),
(82, 0, '::1', 0, 'POST', 'member', 'loginmemberhigi', '[]', '\"\"', '0', '執行成功', '{\"member_id\":\"1\",\"higi_id\":\"1\"}', '2019-11-19 13:39:15'),
(83, 0, '::1', 53, 'GET', 'campaigntag', '', '[]', 'null', '0', '執行成功', '[{\"id\":\"3\",\"name\":\"商品資訊\",\"color\":\"#0080ff\",\"list_order\":\"0\"},{\"id\":\"4\",\"name\":\"餐飲情報標籤名稱\",\"color\":\"#804040\",\"list_order\":\"0\"},{\"id\":\"1\",\"name\":\"企業活動\",\"color\":\"#00ff80\",\"list_order\":\"1\"},{\"id\":\"2\",\"name\":\"活動訊息\",\"color\":\"#80ff80\",\"list_order\":\"2\"},{\"id\":\"5\",\"name\":\"5\",\"color\":\"#0000ff\",\"list_order\":\"5\"}]', '2019-11-19 13:39:19'),
(84, 0, '::1', 57, 'GET', 'campaign', '', '[]', 'null', '0', '執行成功', '[{\"id\":\"5\",\"tag_ids\":\"4\",\"tag_names\":\"餐飲情報標籤名稱\",\"tag_colors\":\"#804040\",\"title\":\"主標題\",\"sub_title\":\"副標題\",\"content\":\"餐飲情報內容\",\"pic_url\":\"/uploads/campaign/1567069915.png\",\"pic_alt\":\"圖片說明\",\"release_date\":\"1910-01-01 00:00:00\",\"list_order\":\"0\"},{\"id\":\"1\",\"tag_ids\":\"1,2\",\"tag_names\":\"企業活動,活動訊息\",\"tag_colors\":\"#00ff80,#80ff80\",\"title\":\"我們與苦瓜的距離\",\"sub_title\":\"我們與苦瓜的距離\",\"content\":\"內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容內容\",\"pic_url\":\"/uploads/campaign/1567069865.png\",\"pic_alt\":\"\",\"release_date\":\"2019-05-23 00:00:00\",\"list_order\":\"0\"},{\"id\":\"2\",\"tag_ids\":\"3,4\",\"tag_names\":\"商品資訊,餐飲情報標籤名稱\",\"tag_colors\":\"#0080ff,#804040\",\"title\":\"「味の素 ®」(AJI-NO-MOTO ®) 正式開始銷售\",\"sub_title\":\"我們與苦瓜的距離\",\"content\":\"\",\"pic_url\":\"/uploads/campaign/1567069878.png\",\"pic_alt\":\"\",\"release_date\":\"2019-05-23 00:00:00\",\"list_order\":\"0\"},{\"id\":\"3\",\"tag_ids\":\"3,1\",\"tag_names\":\"企業活動,商品資訊\",\"tag_colors\":\"#00ff80,#0080ff\",\"title\":\"「味の素 ®」(AJI-NO-MOTO ®) 正式開始銷售\",\"sub_title\":\"我們與苦瓜的距離\",\"content\":\"\",\"pic_url\":\"/uploads/campaign/1567069889.png\",\"pic_alt\":\"\",\"release_date\":\"2019-05-23 00:00:00\",\"list_order\":\"0\"},{\"id\":\"4\",\"tag_ids\":\"4,2\",\"tag_names\":\"活動訊息,餐飲情報標籤名稱\",\"tag_colors\":\"#80ff80,#804040\",\"title\":\"「味の素 ®」(AJI-NO-MOTO ®) 正式開始銷售\",\"sub_title\":\"我們與苦瓜的距離\",\"content\":\"\",\"pic_url\":\"/uploads/campaign/1567069898.png\",\"pic_alt\":\"\",\"release_date\":\"2019-05-23 00:00:00\",\"list_order\":\"0\"},{\"id\":\"6\",\"tag_ids\":\"4,2,5\",\"tag_names\":\"活動訊息,餐飲情報標籤名稱,5\",\"tag_colors\":\"#80ff80,#804040,#0000ff\",\"title\":\"1\",\"sub_title\":\"2\",\"content\":\"4<img alt=\"\" src=\"/uploads/editor/1565768901.png\" />\",\"pic_url\":\"/uploads/campaign/1567069923.png\",\"pic_alt\":\"3\",\"release_date\":\"2019-08-07 00:00:00\",\"list_order\":\"5\"}]', '2019-11-19 13:39:19'),
(85, 0, '::1', 69, 'GET', 'recipepro', '', '[]', 'null', '0', '執行成功', '[{\"id\":\"2\",\"name\":\"2\",\"pic_url\":\"/uploads/repicepro/1567072415.png\",\"pic_alt\":\"A\",\"feature\":\"\",\"tags\":\"雞肉\",\"price\":\"999\",\"type\":\"日式\",\"style\":\"火鍋\",\"product_ids\":\"1,2,3,19\",\"product_names\":\"1,2,3,19\",\"material_weight\":\"\",\"nutrition\":\"<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n		<tr>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n		<tr>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>碳水化合物</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n		<tr>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n		<tr>\r\n			<th>碳水化合物</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n\",\"member_only\":\"0\",\"visitor\":\"69\",\"list_order\":\"2\"},{\"id\":\"1\",\"name\":\"1\",\"pic_url\":\"/uploads/repicepro/1565924165.png\",\"pic_alt\":\"3\",\"feature\":\"6\",\"tags\":\"雞肉,豬肉,根莖類\",\"price\":\"9\",\"type\":\"素食\",\"style\":\"火鍋\",\"product_ids\":\"6,7\",\"product_names\":\"6,7\",\"material_weight\":\"1231231\",\"nutrition\":\"1\",\"member_only\":\"0\",\"visitor\":\"25\",\"list_order\":\"1\"},{\"id\":\"4\",\"name\":\"4\",\"pic_url\":\"/uploads/repicepro/1567072415.png\",\"pic_alt\":\"A\",\"feature\":\"7\",\"tags\":\"牛肉\",\"price\":\"0\",\"type\":\"中式\",\"style\":\"火鍋\",\"product_ids\":\"1\",\"product_names\":\"1\",\"material_weight\":\"\",\"nutrition\":\"\",\"member_only\":\"0\",\"visitor\":\"12\",\"list_order\":\"4\"},{\"id\":\"10\",\"name\":\"10\",\"pic_url\":\"/uploads/repicepro/1567072415.png\",\"pic_alt\":\"A\",\"feature\":\"7\",\"tags\":\"前菜\",\"price\":\"0\",\"type\":\"中式\",\"style\":\"主菜\",\"product_ids\":\"1\",\"product_names\":\"1\",\"material_weight\":\"\",\"nutrition\":\"\",\"member_only\":\"0\",\"visitor\":\"7\",\"list_order\":\"10\"},{\"id\":\"7\",\"name\":\"7\",\"pic_url\":\"/uploads/repicepro/1567072415.png\",\"pic_alt\":\"A\",\"feature\":\"7\",\"tags\":\"前菜\",\"price\":\"0\",\"type\":\"中式\",\"style\":\"主菜\",\"product_ids\":\"1\",\"product_names\":\"1\",\"material_weight\":\"\",\"nutrition\":\"\",\"member_only\":\"0\",\"visitor\":\"5\",\"list_order\":\"7\"},{\"id\":\"9\",\"name\":\"9\",\"pic_url\":\"/uploads/repicepro/1567072415.png\",\"pic_alt\":\"A\",\"feature\":\"7\",\"tags\":\"前菜\",\"price\":\"0\",\"type\":\"中式\",\"style\":\"主菜\",\"product_ids\":\"1\",\"product_names\":\"1\",\"material_weight\":\"\",\"nutrition\":\"\",\"member_only\":\"0\",\"visitor\":\"4\",\"list_order\":\"9\"},{\"id\":\"11\",\"name\":\"11\",\"pic_url\":\"/uploads/repicepro/1567072415.png\",\"pic_alt\":\"A\",\"feature\":\"7\",\"tags\":\"前菜\",\"price\":\"0\",\"type\":\"中式\",\"style\":\"主菜\",\"product_ids\":\"1\",\"product_names\":\"1\",\"material_weight\":\"\",\"nutrition\":\"\",\"member_only\":\"0\",\"visitor\":\"4\",\"list_order\":\"11\"},{\"id\":\"3\",\"name\":\"3\",\"pic_url\":\"/uploads/repicepro/1565924165.png\",\"pic_alt\":\"3\",\"feature\":\"6\",\"tags\":\"雞肉,豬肉,根莖類\",\"price\":\"9\",\"type\":\"素食\",\"style\":\"火鍋\",\"product_ids\":\"19\",\"product_names\":\"19\",\"material_weight\":\"\",\"nutrition\":\"1\",\"member_only\":\"1\",\"visitor\":\"3\",\"list_order\":\"3\"},{\"id\":\"5\",\"name\":\"5\",\"pic_url\":\"/uploads/repicepro/1565924165.png\",\"pic_alt\":\"3\",\"feature\":\"6\",\"tags\":\"雞肉,豬肉,根莖類,主菜,火鍋\",\"price\":\"9\",\"type\":\"素食\",\"style\":\"火鍋\",\"product_ids\":\"1\",\"product_names\":\"1\",\"material_weight\":\"\",\"nutrition\":\"1\",\"member_only\":\"1\",\"visitor\":\"3\",\"list_order\":\"5\"},{\"id\":\"8\",\"name\":\"8\",\"pic_url\":\"/uploads/repicepro/1567072415.png\",\"pic_alt\":\"A\",\"feature\":\"7\",\"tags\":\"前菜\",\"price\":\"0\",\"type\":\"中式\",\"style\":\"主菜\",\"product_ids\":\"1\",\"product_names\":\"1\",\"material_weight\":\"\",\"nutrition\":\"\",\"member_only\":\"0\",\"visitor\":\"3\",\"list_order\":\"8\"},{\"id\":\"6\",\"name\":\"6\",\"pic_url\":\"/uploads/repicepro/1567072415.png\",\"pic_alt\":\"A\",\"feature\":\"7\",\"tags\":\"飯食\",\"price\":\"0\",\"type\":\"中式\",\"style\":\"主菜\",\"product_ids\":\"1\",\"product_names\":\"1\",\"material_weight\":\"\",\"nutrition\":\"\",\"member_only\":\"0\",\"visitor\":\"1\",\"list_order\":\"6\"}]', '2019-11-19 13:39:21');
INSERT INTO `log` (`id`, `user_id`, `ip`, `program_id`, `method`, `endpoint`, `verb`, `args`, `file`, `resultCode`, `resultMessage`, `resultData`, `c_time`) VALUES
(86, 0, '::1', 69, 'GET', 'recipepro', '', '[]', 'null', '0', '執行成功', '[{\"id\":\"1\",\"name\":\"1\",\"pic_url\":\"/uploads/repicepro/1565924165.png\",\"pic_alt\":\"3\",\"feature\":\"6\",\"tags\":\"雞肉,豬肉,根莖類\",\"price\":\"9\",\"type\":\"素食\",\"style\":\"火鍋\",\"product_ids\":\"6,7\",\"product_names\":\"6,7\",\"material_weight\":\"1231231\",\"nutrition\":\"1\",\"member_only\":\"0\",\"visitor\":\"25\",\"list_order\":\"1\"},{\"id\":\"2\",\"name\":\"2\",\"pic_url\":\"/uploads/repicepro/1567072415.png\",\"pic_alt\":\"A\",\"feature\":\"\",\"tags\":\"雞肉\",\"price\":\"999\",\"type\":\"日式\",\"style\":\"火鍋\",\"product_ids\":\"1,2,3,19\",\"product_names\":\"1,2,3,19\",\"material_weight\":\"\",\"nutrition\":\"<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n		<tr>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n		<tr>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>碳水化合物</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n		<tr>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n		<tr>\r\n			<th>碳水化合物</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n\",\"member_only\":\"0\",\"visitor\":\"69\",\"list_order\":\"2\"},{\"id\":\"3\",\"name\":\"3\",\"pic_url\":\"/uploads/repicepro/1565924165.png\",\"pic_alt\":\"3\",\"feature\":\"6\",\"tags\":\"雞肉,豬肉,根莖類\",\"price\":\"9\",\"type\":\"素食\",\"style\":\"火鍋\",\"product_ids\":\"19\",\"product_names\":\"19\",\"material_weight\":\"\",\"nutrition\":\"1\",\"member_only\":\"1\",\"visitor\":\"3\",\"list_order\":\"3\"},{\"id\":\"4\",\"name\":\"4\",\"pic_url\":\"/uploads/repicepro/1567072415.png\",\"pic_alt\":\"A\",\"feature\":\"7\",\"tags\":\"牛肉\",\"price\":\"0\",\"type\":\"中式\",\"style\":\"火鍋\",\"product_ids\":\"1\",\"product_names\":\"1\",\"material_weight\":\"\",\"nutrition\":\"\",\"member_only\":\"0\",\"visitor\":\"12\",\"list_order\":\"4\"},{\"id\":\"5\",\"name\":\"5\",\"pic_url\":\"/uploads/repicepro/1565924165.png\",\"pic_alt\":\"3\",\"feature\":\"6\",\"tags\":\"雞肉,豬肉,根莖類,主菜,火鍋\",\"price\":\"9\",\"type\":\"素食\",\"style\":\"火鍋\",\"product_ids\":\"1\",\"product_names\":\"1\",\"material_weight\":\"\",\"nutrition\":\"1\",\"member_only\":\"1\",\"visitor\":\"3\",\"list_order\":\"5\"},{\"id\":\"6\",\"name\":\"6\",\"pic_url\":\"/uploads/repicepro/1567072415.png\",\"pic_alt\":\"A\",\"feature\":\"7\",\"tags\":\"飯食\",\"price\":\"0\",\"type\":\"中式\",\"style\":\"主菜\",\"product_ids\":\"1\",\"product_names\":\"1\",\"material_weight\":\"\",\"nutrition\":\"\",\"member_only\":\"0\",\"visitor\":\"1\",\"list_order\":\"6\"},{\"id\":\"7\",\"name\":\"7\",\"pic_url\":\"/uploads/repicepro/1567072415.png\",\"pic_alt\":\"A\",\"feature\":\"7\",\"tags\":\"前菜\",\"price\":\"0\",\"type\":\"中式\",\"style\":\"主菜\",\"product_ids\":\"1\",\"product_names\":\"1\",\"material_weight\":\"\",\"nutrition\":\"\",\"member_only\":\"0\",\"visitor\":\"5\",\"list_order\":\"7\"},{\"id\":\"8\",\"name\":\"8\",\"pic_url\":\"/uploads/repicepro/1567072415.png\",\"pic_alt\":\"A\",\"feature\":\"7\",\"tags\":\"前菜\",\"price\":\"0\",\"type\":\"中式\",\"style\":\"主菜\",\"product_ids\":\"1\",\"product_names\":\"1\",\"material_weight\":\"\",\"nutrition\":\"\",\"member_only\":\"0\",\"visitor\":\"3\",\"list_order\":\"8\"},{\"id\":\"9\",\"name\":\"9\",\"pic_url\":\"/uploads/repicepro/1567072415.png\",\"pic_alt\":\"A\",\"feature\":\"7\",\"tags\":\"前菜\",\"price\":\"0\",\"type\":\"中式\",\"style\":\"主菜\",\"product_ids\":\"1\",\"product_names\":\"1\",\"material_weight\":\"\",\"nutrition\":\"\",\"member_only\":\"0\",\"visitor\":\"4\",\"list_order\":\"9\"},{\"id\":\"10\",\"name\":\"10\",\"pic_url\":\"/uploads/repicepro/1567072415.png\",\"pic_alt\":\"A\",\"feature\":\"7\",\"tags\":\"前菜\",\"price\":\"0\",\"type\":\"中式\",\"style\":\"主菜\",\"product_ids\":\"1\",\"product_names\":\"1\",\"material_weight\":\"\",\"nutrition\":\"\",\"member_only\":\"0\",\"visitor\":\"7\",\"list_order\":\"10\"},{\"id\":\"11\",\"name\":\"11\",\"pic_url\":\"/uploads/repicepro/1567072415.png\",\"pic_alt\":\"A\",\"feature\":\"7\",\"tags\":\"前菜\",\"price\":\"0\",\"type\":\"中式\",\"style\":\"主菜\",\"product_ids\":\"1\",\"product_names\":\"1\",\"material_weight\":\"\",\"nutrition\":\"\",\"member_only\":\"0\",\"visitor\":\"4\",\"list_order\":\"11\"}]', '2019-11-19 13:39:21'),
(87, 0, '::1', 93, 'GET', 'tag', '', '[]', 'null', '0', '執行成功', '[{\"id\":\"1\",\"category_id\":\"1\",\"category_name\":\"食材\",\"name\":\"雞肉\",\"list_order\":\"0\"},{\"id\":\"2\",\"category_id\":\"1\",\"category_name\":\"食材\",\"name\":\"豬肉\",\"list_order\":\"0\"},{\"id\":\"3\",\"category_id\":\"1\",\"category_name\":\"食材\",\"name\":\"牛肉\",\"list_order\":\"0\"},{\"id\":\"4\",\"category_id\":\"1\",\"category_name\":\"食材\",\"name\":\"海鮮類\",\"list_order\":\"0\"},{\"id\":\"5\",\"category_id\":\"1\",\"category_name\":\"食材\",\"name\":\"葉菜類\",\"list_order\":\"0\"},{\"id\":\"6\",\"category_id\":\"1\",\"category_name\":\"食材\",\"name\":\"根莖類\",\"list_order\":\"0\"},{\"id\":\"7\",\"category_id\":\"1\",\"category_name\":\"食材\",\"name\":\"瓜果類\",\"list_order\":\"0\"},{\"id\":\"8\",\"category_id\":\"1\",\"category_name\":\"食材\",\"name\":\"菇蕈類\",\"list_order\":\"0\"},{\"id\":\"9\",\"category_id\":\"1\",\"category_name\":\"食材\",\"name\":\"豆類\",\"list_order\":\"0\"},{\"id\":\"10\",\"category_id\":\"1\",\"category_name\":\"食材\",\"name\":\"蛋\",\"list_order\":\"0\"},{\"id\":\"11\",\"category_id\":\"1\",\"category_name\":\"食材\",\"name\":\"其他\",\"list_order\":\"0\"}]', '2019-11-19 13:39:21'),
(88, 0, '::1', 93, 'GET', 'tag', '', '[]', 'null', '0', '執行成功', '[{\"id\":\"12\",\"category_id\":\"2\",\"category_name\":\"菜色\",\"name\":\"中式\",\"list_order\":\"0\"},{\"id\":\"13\",\"category_id\":\"2\",\"category_name\":\"菜色\",\"name\":\"日式\",\"list_order\":\"0\"},{\"id\":\"14\",\"category_id\":\"2\",\"category_name\":\"菜色\",\"name\":\"西式\",\"list_order\":\"0\"},{\"id\":\"15\",\"category_id\":\"2\",\"category_name\":\"菜色\",\"name\":\"韓式\",\"list_order\":\"0\"},{\"id\":\"16\",\"category_id\":\"2\",\"category_name\":\"菜色\",\"name\":\"小吃\",\"list_order\":\"0\"},{\"id\":\"17\",\"category_id\":\"2\",\"category_name\":\"菜色\",\"name\":\"素食\",\"list_order\":\"0\"}]', '2019-11-19 13:39:21'),
(89, 0, '::1', 93, 'GET', 'tag', '', '[]', 'null', '0', '執行成功', '[{\"id\":\"18\",\"category_id\":\"3\",\"category_name\":\"菜式\",\"name\":\"主菜\",\"list_order\":\"0\"},{\"id\":\"19\",\"category_id\":\"3\",\"category_name\":\"菜式\",\"name\":\"前菜\",\"list_order\":\"0\"},{\"id\":\"20\",\"category_id\":\"3\",\"category_name\":\"菜式\",\"name\":\"湯品\",\"list_order\":\"0\"},{\"id\":\"21\",\"category_id\":\"3\",\"category_name\":\"菜式\",\"name\":\"火鍋\",\"list_order\":\"0\"},{\"id\":\"22\",\"category_id\":\"3\",\"category_name\":\"菜式\",\"name\":\"飯食\",\"list_order\":\"0\"},{\"id\":\"23\",\"category_id\":\"3\",\"category_name\":\"菜式\",\"name\":\"麵食\",\"list_order\":\"0\"},{\"id\":\"24\",\"category_id\":\"3\",\"category_name\":\"菜式\",\"name\":\"粥品\",\"list_order\":\"0\"},{\"id\":\"25\",\"category_id\":\"3\",\"category_name\":\"菜式\",\"name\":\"羹類\",\"list_order\":\"0\"},{\"id\":\"26\",\"category_id\":\"3\",\"category_name\":\"菜式\",\"name\":\"點心\",\"list_order\":\"0\"},{\"id\":\"27\",\"category_id\":\"3\",\"category_name\":\"菜式\",\"name\":\"其他\",\"list_order\":\"0\"}]', '2019-11-19 13:39:22');

-- --------------------------------------------------------

--
-- 資料表結構 `login_member`
--

CREATE TABLE `login_member` (
  `member_id` int(11) NOT NULL COMMENT '會員編號',
  `token` varchar(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '存取權杖',
  `login_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '登入時間'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `login_member`
--

INSERT INTO `login_member` (`member_id`, `token`, `login_time`) VALUES
(1, 'D8DE0C62-7A40-89E9-9A54-3F8EC8295222', '2019-11-19 13:31:21');

-- --------------------------------------------------------

--
-- 資料表結構 `login_user`
--

CREATE TABLE `login_user` (
  `user_id` int(11) NOT NULL COMMENT '使用者編號',
  `token` varchar(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '存取權杖',
  `login_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '登入時間'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `login_user`
--

INSERT INTO `login_user` (`user_id`, `token`, `login_time`) VALUES
(3, 'BE30830D-2ADA-5E43-A4DB-522F3AE4B563', '2019-11-14 14:02:21'),
(1, '563C1EE2-B262-E32E-2449-D79D406A6B1B', '2019-09-11 16:38:09');

-- --------------------------------------------------------

--
-- 替換檢視表以便查看 `log_view`
-- (請參考以下實際畫面)
--
CREATE TABLE `log_view` (
`id` int(11)
,`user_id` int(11)
,`user_account` varchar(128)
,`user_name` varchar(64)
,`ip` varchar(128)
,`program_id` int(11)
,`program_name` varchar(64)
,`verb` varchar(64)
,`args` text
,`file` text
,`resultCode` varchar(16)
,`resultMessage` varchar(64)
,`resultData` text
,`c_time` datetime
);

-- --------------------------------------------------------

--
-- 資料表結構 `member`
--

CREATE TABLE `member` (
  `id` int(11) NOT NULL COMMENT '會員編號',
  `account` varchar(512) COLLATE utf8_unicode_ci NOT NULL COMMENT '帳號，Email',
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL COMMENT '密碼，AES-ECB加密',
  `verification` varchar(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '驗證碼',
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '姓名',
  `gender` tinyint(4) NOT NULL COMMENT '性別，0未知、1男、2女。',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '聯絡電話',
  `restaurant_name` varchar(512) COLLATE utf8_unicode_ci NOT NULL COMMENT '餐廳名稱',
  `restaurant_area_id` int(11) NOT NULL COMMENT '餐廳區域編號',
  `restaurant_type` text COLLATE utf8_unicode_ci NOT NULL COMMENT '經營型態',
  `last_login_time` datetime DEFAULT NULL COMMENT '最後登入時間',
  `last_login_ip` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '最後登入IP位址',
  `status` int(11) NOT NULL COMMENT '狀態，0：啟用，1：尚未驗證，2：停用，3：已刪除',
  `remark` text COLLATE utf8_unicode_ci NOT NULL COMMENT '備註',
  `c_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立時間',
  `c_user_id` int(11) NOT NULL COMMENT '建立使用者編號',
  `u_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改時間',
  `u_user_id` int(11) NOT NULL COMMENT '修改使用者編號'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `member`
--

INSERT INTO `member` (`id`, `account`, `password`, `verification`, `name`, `gender`, `birthday`, `phone`, `restaurant_name`, `restaurant_area_id`, `restaurant_type`, `last_login_time`, `last_login_ip`, `status`, `remark`, `c_time`, `c_user_id`, `u_time`, `u_user_id`) VALUES
(1, 'vicwu0717@gmail.com', '1LixWw/nhIxrzwERG3boDg==', '9EC23092-2491-A1FF-BC1C-E01056DEC119', 'vic', 1, '0000-00-00', '09188888', 'vic', 234, '火鍋', '2019-11-19 13:31:21', '::1', 0, '', '2019-10-17 17:38:39', 2, '2019-11-19 13:31:21', 2),
(2, 'vic@ks-design.com.tw', '1LixWw/nhIxrzwERG3boDg==', '5A4DB362-C2F9-2811-36FC-1D6B00135103', 'vic', 1, '0000-00-00', '11111111', '11111111', 291, '火鍋', '0000-00-00 00:00:00', '', 0, '', '2019-10-30 09:14:13', 2, '2019-10-30 09:14:33', 2);

-- --------------------------------------------------------

--
-- 資料表結構 `member_higi`
--

CREATE TABLE `member_higi` (
  `member_id` int(11) NOT NULL COMMENT '會員編號',
  `higi_id` int(11) NOT NULL COMMENT '招客秘技編號'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `member_higi`
--

INSERT INTO `member_higi` (`member_id`, `higi_id`) VALUES
(1, 1),
(1, 4),
(1, 14),
(1, 24),
(1, 31);

-- --------------------------------------------------------

--
-- 替換檢視表以便查看 `member_higi_view`
-- (請參考以下實際畫面)
--
CREATE TABLE `member_higi_view` (
`member_id` int(11)
,`member_account` varchar(512)
,`member_name` varchar(64)
,`member_status` int(11)
,`id` int(11)
,`name` varchar(64)
,`pic_url` text
,`pic_alt` varchar(64)
,`content` varchar(512)
,`description` varchar(512)
,`recipepro_id` int(11)
,`recipepro_name` varchar(64)
,`recipepro_pic_url` text
,`recipepro_pic_alt` varchar(64)
,`recipepro_member_only` tinyint(1)
,`brand_id` int(11)
,`brand_name` varchar(64)
,`brand_pic_url` text
,`brand_pic_alt` varchar(64)
,`product_id` int(11)
,`product_name` varchar(64)
,`product_pic_urls` text
,`product_pic_alts` varchar(64)
,`tags` text
,`type` varchar(512)
,`style` varchar(512)
,`methods` text
,`note` text
,`note_pic_url` text
,`note_pic_alt` varchar(64)
,`member_only` tinyint(1)
,`visitor` int(11)
,`list_order` int(11)
,`status` tinyint(1)
,`remark` text
,`c_time` datetime
,`c_user_id` int(11)
,`c_user_name` varchar(64)
,`u_time` datetime
,`u_user_id` int(11)
,`u_user_name` varchar(64)
);

-- --------------------------------------------------------

--
-- 資料表結構 `member_recipepro`
--

CREATE TABLE `member_recipepro` (
  `member_id` int(11) NOT NULL COMMENT '會員編號',
  `recipepro_id` int(11) NOT NULL COMMENT '專業食譜編號'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `member_recipepro`
--

INSERT INTO `member_recipepro` (`member_id`, `recipepro_id`) VALUES
(1, 2),
(1, 4),
(1, 5);

-- --------------------------------------------------------

--
-- 替換檢視表以便查看 `member_recipepro_view`
-- (請參考以下實際畫面)
--
CREATE TABLE `member_recipepro_view` (
`member_id` int(11)
,`member_account` varchar(512)
,`member_name` varchar(64)
,`member_status` int(11)
,`id` int(11)
,`name` varchar(64)
,`pic_url` text
,`pic_alt` varchar(64)
,`feature` text
,`tags` text
,`price` varchar(512)
,`type` varchar(512)
,`style` varchar(512)
,`product_ids` text
,`material_weight` varchar(10)
,`product_names` text
,`nutrition` text
,`member_only` tinyint(1)
,`visitor` int(11)
,`list_order` int(11)
,`status` tinyint(1)
,`remark` text
,`c_time` datetime
,`c_user_id` int(11)
,`c_user_name` varchar(64)
,`u_time` datetime
,`u_user_id` int(11)
,`u_user_name` varchar(64)
);

-- --------------------------------------------------------

--
-- 替換檢視表以便查看 `member_view`
-- (請參考以下實際畫面)
--
CREATE TABLE `member_view` (
`id` int(11)
,`account` varchar(512)
,`verification` varchar(36)
,`name` varchar(64)
,`gender` tinyint(4)
,`birthday` date
,`phone` varchar(20)
,`restaurant_name` varchar(512)
,`restaurant_zipcode` varchar(3)
,`restaurant_city_id` int(11)
,`restaurant_city_name` varchar(8)
,`restaurant_area_id` int(11)
,`restaurant_area_name` varchar(8)
,`restaurant_type` text
,`last_login_time` datetime
,`last_login_ip` varchar(128)
,`status` int(11)
,`remark` text
,`c_time` datetime
,`c_user_id` int(11)
,`c_user_name` varchar(64)
,`u_time` datetime
,`u_user_id` int(11)
,`u_user_name` varchar(64)
);

-- --------------------------------------------------------

--
-- 資料表結構 `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL COMMENT '選單編號',
  `parent_id` int(11) NOT NULL COMMENT '父選單編號',
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '選單名稱',
  `url` varchar(512) COLLATE utf8_unicode_ci NOT NULL COMMENT '連結網址',
  `icon` varchar(128) COLLATE utf8_unicode_ci NOT NULL COMMENT '選單圖示',
  `program_ids` text COLLATE utf8_unicode_ci NOT NULL COMMENT '相關程式編號',
  `list_order` int(11) NOT NULL COMMENT '列表順序',
  `status` tinyint(1) NOT NULL COMMENT '狀態，0：啟用，1：停用，2：已刪除',
  `remark` text COLLATE utf8_unicode_ci NOT NULL COMMENT '備註',
  `c_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立時間	',
  `c_user_id` int(11) NOT NULL COMMENT '建立使用者編號',
  `u_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改時間	',
  `u_user_id` int(11) NOT NULL COMMENT '修改使用者編號	'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `menu`
--

INSERT INTO `menu` (`id`, `parent_id`, `name`, `url`, `icon`, `program_ids`, `list_order`, `status`, `remark`, `c_time`, `c_user_id`, `u_time`, `u_user_id`) VALUES
(1, 0, '儀表板', 'dashboard.php', 'fas fa-tachometer-alt', '', 100, 0, '', '2019-03-11 13:23:02', 1, '2019-03-11 15:13:11', 1),
(2, 0, '權限', '', 'fas fa-users-cog', '', 1000, 0, '', '2019-03-11 14:47:18', 0, '2019-03-11 15:25:56', 0),
(3, 2, '角色', 'role_list.php', 'fas fa-users', '9,10,11,12,13,14,15,16,17,18,19,20,21,22', 1010, 0, '', '2019-03-11 14:47:33', 0, '2019-07-23 16:02:45', 0),
(4, 2, '使用者', 'user_list.php', 'fas fa-user', '23,24,25,26,27,28,29,30', 1020, 0, '', '2019-03-11 14:47:46', 0, '2019-07-23 16:05:09', 0),
(5, 0, '使用者資料', '', 'fas fa-user-cog', '', 1100, 0, '', '2019-03-11 14:48:02', 0, '2019-07-23 14:37:52', 0),
(6, 5, '修改資料', 'loginuser_data_edit.php', 'fas fa-user-edit', '31,32', 1110, 0, '', '2019-03-11 14:48:44', 0, '2019-07-23 16:04:37', 0),
(7, 5, '修改密碼', 'loginuser_password_edit.php', 'fas fa-user-lock', '33', 1120, 0, '', '2019-03-11 14:49:08', 0, '2019-07-23 16:04:45', 0),
(8, 0, '操作記錄', 'log_list.php', 'fas fa-edit', '40', 1200, 0, '', '2019-03-11 14:49:30', 0, '2019-07-23 16:03:49', 0),
(9, 0, '首頁Banner', 'banner_list.php', 'fas fa-images', '45,46,47,48', 200, 0, '', '2019-03-11 13:23:02', 1, '2019-08-23 14:19:17', 1),
(10, 0, '廣告', 'ad_list.php', 'fas fa-ad', '49,50,51,52', 300, 0, '', '2019-08-14 10:20:13', 0, '2019-08-23 14:19:27', 0),
(11, 0, '餐飲情報', '', 'fas fa-newspaper', '', 400, 0, '', '2019-08-14 10:20:32', 0, '2019-08-23 14:14:07', 0),
(12, 11, '餐飲情報標籤', 'campaign_tag_list.php', 'fas fa-tags', '53,54,55,56', 410, 0, '', '2019-08-14 10:20:58', 0, '2019-08-23 14:19:39', 0),
(13, 11, '餐飲情報', 'campaign_list.php', 'fas fa-newspaper', '57,58,59,60', 420, 0, '', '2019-08-14 10:21:16', 0, '2019-08-23 14:21:41', 0),
(14, 0, '專業食譜', 'recipepro_list.php', 'fas fa-book-open', '69,70,71,72,73,74,75', 600, 0, '', '2019-08-14 10:21:47', 0, '2019-08-23 14:22:34', 0),
(15, 0, '商品', '', 'fas fa-cubes', '', 500, 0, '', '2019-08-14 10:22:11', 0, '2019-08-23 14:15:16', 0),
(16, 15, '品牌', 'brand_list.php', 'fas fa-cube', '61,62,63,64', 510, 0, '', '2019-08-14 10:22:30', 0, '2019-08-23 14:22:05', 0),
(17, 15, '商品', 'product_list.php', 'fas fa-cube', '65,66,67,68', 520, 0, '', '2019-08-14 10:22:48', 0, '2019-08-23 14:22:18', 0),
(18, 0, '招客秘笈', 'skill_list.php', 'far fa-lightbulb', '76,77,78,79', 700, 0, '', '2019-08-14 10:23:10', 0, '2019-11-13 11:10:41', 0),
(19, 0, '會員', 'member_list.php', 'fas fa-users', '80,81,82,83,84,85,86', 900, 0, '', '2019-08-14 10:23:26', 0, '2019-11-19 09:49:52', 0),
(20, 0, '標籤', 'tag_list.php', 'fa fa-tags', '', 800, 0, '', '2019-11-19 09:49:47', 0, '2019-11-19 09:54:47', 0);

-- --------------------------------------------------------

--
-- 替換檢視表以便查看 `menu_view`
-- (請參考以下實際畫面)
--
CREATE TABLE `menu_view` (
`id` int(11)
,`parent_id` int(11)
,`parent_name` varchar(64)
,`name` varchar(64)
,`url` varchar(512)
,`icon` varchar(128)
,`program_ids` text
,`list_order` int(11)
,`status` tinyint(1)
,`remark` text
,`c_time` datetime
,`c_user_id` int(11)
,`c_user_name` varchar(64)
,`u_time` datetime
,`u_user_id` int(11)
,`u_user_name` varchar(64)
);

-- --------------------------------------------------------

--
-- 資料表結構 `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL COMMENT '商品編號',
  `brand_id` int(11) NOT NULL COMMENT '品牌編號',
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '商品名稱',
  `pic_urls` text COLLATE utf8_unicode_ci NOT NULL COMMENT '圖片網址，以逗號分隔',
  `pic_alts` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '圖片說明，以逗號分隔',
  `tag` varchar(512) COLLATE utf8_unicode_ci NOT NULL COMMENT '商品標籤',
  `content` text COLLATE utf8_unicode_ci NOT NULL COMMENT '商品內容',
  `tips` text COLLATE utf8_unicode_ci NOT NULL COMMENT '美味秘訣',
  `information` text COLLATE utf8_unicode_ci NOT NULL COMMENT '商品資訊',
  `mark` text COLLATE utf8_unicode_ci NOT NULL COMMENT '營養標示',
  `list_order` int(11) NOT NULL COMMENT '列表順序',
  `status` tinyint(1) NOT NULL COMMENT '狀態，0：啟用，1：停用，2：已刪除',
  `remark` text COLLATE utf8_unicode_ci NOT NULL COMMENT '備註',
  `c_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立時間',
  `c_user_id` int(11) NOT NULL COMMENT '建立使者編號',
  `u_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改時間',
  `u_user_id` int(11) NOT NULL COMMENT '修改使用者編號'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `product`
--

INSERT INTO `product` (`id`, `brand_id`, `name`, `pic_urls`, `pic_alts`, `tag`, `content`, `tips`, `information`, `mark`, `list_order`, `status`, `remark`, `c_time`, `c_user_id`, `u_time`, `u_user_id`) VALUES
(1, 5, '1', '/uploads/product/1565848035.png,/uploads/product/1565848034.png,/uploads/product/1565848036.png,/uploads/product/1565848037.png,/uploads/product/1565848038.png,/uploads/product/1565848039.png', '4,3,,,,', '標籤1', '內容內容內容內容內容內容內容內容內容內容', '內容內容內容內容內容內容內容內容內容內容', '<ul class=\"product-info-box p-a0\">\r\n	<li class=\"d-flex \"><span class=\"title\">原料</span><span class=\"text\">調味劑(L-麩酸鈉、5`-次黃嘌呤核苷磷酸二鈉、琥珀酸二鈉)、食鹽、乳糖、砂糖、乾燻鰹魚、鰹魚抽出物、酵母抽出物、D-木糖、麥芽糖、葡萄糖、糊精</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">淨重</span><span class=\"text\">1公斤</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">原產地</span><span class=\"text\">日本國神奈川縣</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品包裝</span><span class=\"text\">1kgx12袋/箱</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品條碼</span><span class=\"text\">4901001375431</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">外箱尺寸</span><span class=\"text\">522x262x209mm</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存期限</span><span class=\"text\">24個月(常溫未開封狀態下) </span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">過敏原</span><span class=\"text\">2本產品含有牛奶及其製品</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存方法</span><span class=\"text\">開封後，為了避免受潮，請密封存放於乾燥通風處，以確認產品的最佳風味及品質。 </span></li>\r\n</ul>\r\n', '<ul class=\"info-box p-a0\">\r\n	<li class=\"d-flex\"><span class=\"title\">每一份量</span><span class=\"text\">1公克</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">本包裝含</span><span class=\"text\">1000份</span></li>\r\n</ul>\r\n\r\n<ul class=\"product-info-box p-a0\">\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\"></span><span class=\"text-e\">每份</span><span class=\"text-h\">每100公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">熱量</span><span class=\"text-e\">2.2大卡</span><span class=\"text-h\">225大卡</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">蛋白質</span><span class=\"text-e\">0.2公克</span><span class=\"text-h\">24.1公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">脂肪</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title p-l10\">飽和脂肪</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title p-l10\">反式脂肪</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">碳水化合物</span><span class=\"text-e\">0.3公克</span><span class=\"text-h\">31.6公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">糖</span><span class=\"text-e\">0.2公克</span><span class=\"text-h\">17.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">鈉</span><span class=\"text-e\">175毫克</span><span class=\"text-h\">17500毫克</span></li>\r\n</ul>\r\n', 1, 0, '10', '2019-05-20 19:07:14', 1, '2019-09-12 12:02:41', 1),
(2, 1, '2', '/uploads/product/1567073370.png', '', '', '商品內容', '美味秘訣', '<ul class=\"p-a0\">\r\n	<li class=\"d-flex \"><span class=\"title\">原料</span> <span class=\"text\">調味劑(L-麩酸鈉、5&#39;-次黃嘌呤核苷磷酸二鈉、琥珀酸二鈉)、食鹽、乳糖、砂糖、乾燻鰹魚、鰹魚抽出物、酵母抽出物、D-木糖、麥芽糖、葡萄糖、糊精</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">淨重</span> <span class=\"text\">1公斤</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">原產地</span> <span class=\"text\">日本國神奈川縣</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品包裝</span> <span class=\"text\">1kgx12袋/箱</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品條碼</span> <span class=\"text\">4901001375431</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">外箱尺寸</span> <span class=\"text\">522x262x209mm</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存期限</span> <span class=\"text\">24個月(常溫未開封狀態下) </span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">過敏原</span> <span class=\"text\">2本產品含有牛奶及其製品</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存方法</span> <span class=\"text\">開封後，為了避免受潮，請密封存放於乾燥通風處，以確認產品的最佳風味及品質。 </span></li>\r\n</ul>\r\n', '<ul class=\"p-a0\">\r\n	<li class=\"d-flex\"><span class=\"title\">每一份量</span> <span class=\"text\">1公克</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">本包裝含</span> <span class=\"text\">1000份</span></li>\r\n</ul>\r\n\r\n<ul class=\"p-a0\">\r\n	<li class=\"d-flex justify-content-between\"><span class=\"text-e\">每份</span> <span class=\"text-h\">每100公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">熱量</span> <span class=\"text-e\">2.2大卡</span> <span class=\"text-h\">225大卡</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">蛋白質</span> <span class=\"text-e\">0.2公克</span> <span class=\"text-h\">24.1公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">脂肪</span> <span class=\"text-e\">0.0公克</span> <span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title p-l10\">飽和脂肪</span> <span class=\"text-e\">0.0公克</span> <span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title p-l10\">反式脂肪</span> <span class=\"text-e\">0.0公克</span> <span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">碳水化合物</span> <span class=\"text-e\">0.3公克</span> <span class=\"text-h\">31.6公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">糖</span> <span class=\"text-e\">0.2公克</span> <span class=\"text-h\">17.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">鈉</span> <span class=\"text-e\">175毫克</span> <span class=\"text-h\">17500毫克</span></li>\r\n</ul>\r\n', 2, 0, '', '2019-05-20 19:09:21', 1, '2019-09-03 11:23:29', 1),
(3, 1, '3', '/uploads/product/1558350652.png', '1', '', '<table class=\"info-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>原料</th>\r\n			<td>調味劑(L-麩酸鈉、5&#39;-次黃嘌呤核苷磷酸二鈉、琥珀酸二鈉)、食鹽、乳糖、砂糖、乾燻鰹魚、鰹魚抽出物、酵母抽出物、D-木糖、麥芽糖、葡萄糖、糊精</td>\r\n		</tr>\r\n		<tr>\r\n			<th>容量</th>\r\n			<td>320公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>使用方法</th>\r\n			<td>7公克可調理成1000c.c的高湯&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '', '', '<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">每一份量<span>100公克</span></th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\">每份</th>\r\n			<th>每100公克</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量</th>\r\n			<td>2.2 大卡</td>\r\n			<td>225 打卡</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蛋白質</th>\r\n			<td>0.2 公克</td>\r\n			<td>24.1 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>&nbsp; &nbsp; 飽和脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>&nbsp; &nbsp; 反式脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>碳水化合物</th>\r\n			<td>&nbsp; 0.3 公克</td>\r\n			<td>31.6 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>&nbsp; &nbsp; 糖</th>\r\n			<td>0.2 公克</td>\r\n			<td>17.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈉</th>\r\n			<td>175 毫克</td>\r\n			<td>17500 毫克</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 3, 0, '', '2019-05-20 19:10:52', 1, '2019-09-02 20:00:40', 1),
(4, 1, '4', '/uploads/product/1558350701.png', '', '', '<table class=\"info-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>原料</th>\r\n			<td>調味劑(L-麩酸鈉、5&#39;-次黃嘌呤核苷磷酸二鈉、琥珀酸二鈉)、食鹽、乳糖、砂糖、乾燻鰹魚、鰹魚抽出物、酵母抽出物、D-木糖、麥芽糖、葡萄糖、糊精</td>\r\n		</tr>\r\n		<tr>\r\n			<th>容量</th>\r\n			<td>450公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>使用方法</th>\r\n			<td>7公克可調理成1000c.c的高湯&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '', '', '<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">每一份量<span>100公克</span></th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\">每份</th>\r\n			<th>每100公克</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量</th>\r\n			<td>2.2 大卡</td>\r\n			<td>225 打卡</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蛋白質</th>\r\n			<td>0.2 公克</td>\r\n			<td>24.1 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>&nbsp; &nbsp; 飽和脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>&nbsp; &nbsp; 反式脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>碳水化合物</th>\r\n			<td>&nbsp; 0.3 公克</td>\r\n			<td>31.6 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>&nbsp; &nbsp; 糖</th>\r\n			<td>0.2 公克</td>\r\n			<td>17.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈉</th>\r\n			<td>175 毫克</td>\r\n			<td>17500 毫克</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 4, 0, '', '2019-05-20 19:11:41', 1, '2019-09-02 20:00:40', 3),
(5, 1, '5', '/uploads/product/1558350747.png', '', '', '<table class=\"info-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>原料</th>\r\n			<td>調味劑(L-麩酸鈉、5&#39;-次黃嘌呤核苷磷酸二鈉、琥珀酸二鈉)、食鹽、乳糖、砂糖、乾燻鰹魚、鰹魚抽出物、酵母抽出物、D-木糖、麥芽糖、葡萄糖、糊精</td>\r\n		</tr>\r\n		<tr>\r\n			<th>容量</th>\r\n			<td>65公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>使用方法</th>\r\n			<td>7公克可調理成1000c.c的高湯&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '', '', '<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">每一份量<span>100公克</span></th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\">每份</th>\r\n			<th>每100公克</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量</th>\r\n			<td>2.2 大卡</td>\r\n			<td>225 打卡</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蛋白質</th>\r\n			<td>0.2 公克</td>\r\n			<td>24.1 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>&nbsp; &nbsp; 飽和脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>&nbsp; &nbsp; 反式脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>碳水化合物</th>\r\n			<td>&nbsp; 0.3 公克</td>\r\n			<td>31.6 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>&nbsp; &nbsp; 糖</th>\r\n			<td>0.2 公克</td>\r\n			<td>17.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈉</th>\r\n			<td>175 毫克</td>\r\n			<td>17500 毫克</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 5, 0, '', '2019-05-20 19:12:27', 1, '2019-09-02 20:00:40', 3),
(6, 2, '6', '/uploads/product/1558418208.jpg', '', '', '<table class=\"info-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>原料</th>\r\n			<td>甜玉米粉、砂糖、馬鈴薯澱粉、麥芽糊精、脫脂牛乳、棕櫚油、乳糖、玉米糖漿、食鹽、玉米粒、玉米油、棕櫚仁油、調味劑(L-麩酸鈉、5&#39;-次黃嘌呤核苷磷酸二鈉)、酸酪蛋白、關華豆膠、洋蔥、糊精、酵母抽出物、大豆卵磷脂、白胡椒、香料、麵粉、葡萄糖、油菜籽油</td>\r\n		</tr>\r\n		<tr>\r\n			<th>容量</th>\r\n			<td>57.6公克(共3袋)</td>\r\n		</tr>\r\n		<tr>\r\n			<th>使用方法</th>\r\n			<td>將VONO&reg;倒入杯中，注入150ml的熱水(約一般馬克杯6分滿)攪拌15秒即可。</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '', '', '<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">每一份量<span>19.2公克</span></th>\r\n		</tr>\r\n		<tr>\r\n			<th colspan=\"3\">本包裝含3份</th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\">每份</th>\r\n			<th>每100公克</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th style=\"text-align: left;\">熱量</th>\r\n			<td>80大卡</td>\r\n			<td>416大卡</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">蛋白質</th>\r\n			<td>1.2公克</td>\r\n			<td>6.1公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">脂肪</th>\r\n			<td>2.2公克</td>\r\n			<td>11.6公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>飽和脂肪</th>\r\n			<td>1.5公克</td>\r\n			<td>7.8公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>反式脂肪</th>\r\n			<td>0公克</td>\r\n			<td>0公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">碳水化合物</th>\r\n			<td>13.8公克</td>\r\n			<td>71.9公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>糖</th>\r\n			<td>6.1公克</td>\r\n			<td>31.9公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">鈉</th>\r\n			<td>411毫克</td>\r\n			<td>2140毫克</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 6, 0, '', '2019-05-21 13:56:48', 1, '2019-09-02 20:00:40', 3),
(7, 2, '7', '/uploads/product/1558420642.jpg', '', '', '<table class=\"info-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>原料</th>\r\n			<td>馬鈴薯澱粉、麥芽糊精、砂糖、棕櫚油、食鹽、全脂牛乳、玉米糖漿、脫脂牛乳、馬鈴薯粉、洋蔥粉、調味劑(L-麩酸鈉、5&lsquo;-次黃嘌呤核苷磷酸二鈉、胺基乙酸)、卡門貝爾起司、洋蔥、棕櫚仁油、還原水飴、酵母抽出物、糊精、玉米油、關華豆膠、豬肉、酸酪蛋白、醬油、白胡椒、鰹魚抽出物、荷蘭芹、大豆卵磷脂、薑黃、玉米芯抽出物、芹菜籽、玉米澱粉、月桂、陳皮、混合生育醇、麵粉、葡萄糖、油菜籽油、迷迭香抽出物</td>\r\n		</tr>\r\n		<tr>\r\n			<th>容量</th>\r\n			<td>46.5公克(共3袋)</td>\r\n		</tr>\r\n		<tr>\r\n			<th>使用方法</th>\r\n			<td>將VONO&reg;倒入杯中，注入150ml的熱水(約一般馬克杯6分滿)攪拌15秒即可。</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '', '', '<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">每一份量<span>15.5公克</span></th>\r\n		</tr>\r\n		<tr>\r\n			<th colspan=\"3\">本包裝含3份</th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\">每份</th>\r\n			<th>每100公克</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th style=\"text-align: left;\">熱量</th>\r\n			<td>64大卡</td>\r\n			<td>413大卡</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">蛋白質</th>\r\n			<td>0.9公克</td>\r\n			<td>5.5公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">脂肪</th>\r\n			<td>1.8公克</td>\r\n			<td>11.5公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>飽和脂肪</th>\r\n			<td>1.3公克</td>\r\n			<td>8.4公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>反式脂肪</th>\r\n			<td>0公克</td>\r\n			<td>0公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">碳水化合物</th>\r\n			<td>11.1公克</td>\r\n			<td>71.8公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>糖</th>\r\n			<td>2.8公克</td>\r\n			<td>17.9公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">鈉</th>\r\n			<td>409毫克</td>\r\n			<td>2640毫克</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 7, 0, '', '2019-05-21 14:37:22', 1, '2019-09-02 20:00:40', 1),
(8, 2, '8', '/uploads/product/1558423834.jpg', '', '', '<table class=\"info-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>原料</th>\r\n			<td>馬鈴薯澱粉、南瓜粉、砂糖、脫脂牛乳、棕櫚油、玉米糖漿、食鹽、麥芽糊精、馬鈴薯粉、棕櫚仁油、玉米油、糊精、調味劑(L-麩酸鈉、5&#39;-次黃嘌呤核苷磷酸二鈉)、酵母抽出物、酸酪蛋白、洋蔥抽出物、椰子油、全脂牛乳、葡萄糖糖漿、米糠油、洋蔥、荷蘭芹、大豆卵磷脂、乳糖、白胡椒、豆蔻、月桂、肉桂、陳皮、葡萄糖</td>\r\n		</tr>\r\n		<tr>\r\n			<th>容量</th>\r\n			<td>52.2公克(共3袋)</td>\r\n		</tr>\r\n		<tr>\r\n			<th>使用方法</th>\r\n			<td>將VONO&reg;倒入杯中，注入150ml的熱水(約一般馬克杯6分滿)攪拌15秒即可。</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '', '', '<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">每一份量<span>17.4公克</span></th>\r\n		</tr>\r\n		<tr>\r\n			<th colspan=\"3\">本包裝含3份</th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\">每份</th>\r\n			<th>每100公克</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th style=\"text-align: left;\">熱量</th>\r\n			<td>75大卡</td>\r\n			<td>429大卡</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">蛋白質</th>\r\n			<td>1.1公克</td>\r\n			<td>6.1公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">脂肪</th>\r\n			<td>2.5公克</td>\r\n			<td>14.5公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>飽和脂肪</th>\r\n			<td>2.0公克</td>\r\n			<td>11.5公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>反式脂肪</th>\r\n			<td>0公克</td>\r\n			<td>0公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">碳水化合物</th>\r\n			<td>11.9公克</td>\r\n			<td>68.6公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>糖</th>\r\n			<td>5.0公克</td>\r\n			<td>28.8公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">鈉</th>\r\n			<td>388毫克</td>\r\n			<td>2230毫克</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 8, 0, '', '2019-05-21 15:30:34', 1, '2019-09-02 20:00:40', 1),
(9, 2, '9', '/uploads/product/1558424084.jpg', '', '', '<table class=\"info-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>原料</th>\r\n			<td>馬鈴薯澱粉、麥芽糊精、乳糖、棕櫚油、卡門貝爾起司、全脂牛乳、砂糖、馬鈴薯粉、玉米糖漿、食鹽、戈爾根佐拉起司、棕櫚仁油、調味劑(L-麩酸鈉、5&#39;-次黃嘌呤核苷磷酸二鈉、胺基乙酸)、切達起司、椰子油、洋蔥粉、洋蔥、玉米油、關華豆膠、葡萄糖糖漿、脫脂牛乳、酵母抽出物、糊精、酸酪蛋白、鰹魚抽出物、大豆卵磷脂、荷蘭芹、玉米芯抽出物、白胡椒、薑黃、芹菜籽、玉米澱粉、月桂、陳皮</td>\r\n		</tr>\r\n		<tr>\r\n			<th>容量</th>\r\n			<td>54公克(共3袋)</td>\r\n		</tr>\r\n		<tr>\r\n			<th>使用方法</th>\r\n			<td>將VONO&reg;倒入杯中，注入150ml的熱水(約一般馬克杯6分滿)攪拌15秒即可。</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '', '', '<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">每一份量<span>18.0公克</span></th>\r\n		</tr>\r\n		<tr>\r\n			<th colspan=\"3\">本包裝含3份</th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\">每份</th>\r\n			<th>每100公克</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th style=\"text-align: left;\">熱量</th>\r\n			<td>84大卡</td>\r\n			<td>465大卡</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">蛋白質</th>\r\n			<td>1.4公克</td>\r\n			<td>8公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">脂肪</th>\r\n			<td>3.9公克</td>\r\n			<td>21.4公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>飽和脂肪</th>\r\n			<td>2.9公克</td>\r\n			<td>16.2公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>反式脂肪</th>\r\n			<td>0公克</td>\r\n			<td>0公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">碳水化合物</th>\r\n			<td>10.8公克</td>\r\n			<td>60.0公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>糖</th>\r\n			<td>3.6公克</td>\r\n			<td>19.8公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">鈉</th>\r\n			<td>418毫克</td>\r\n			<td>2320毫克</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 9, 0, '', '2019-05-21 15:34:44', 1, '2019-09-02 20:00:40', 1),
(10, 2, '10', '/uploads/product/1558520127.jpg', '', '', '<table class=\"info-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>原料</th>\r\n			<td>麩醯胺酸，L-精胺酸，L-白胺酸，L-異白胺酸，L-&alpha;胺基異戊酸，調味劑(檸檬酸、DL-蘋果酸、檸檬酸鈉)，L-羥丁胺酸，鹽酸L-二胺基己酸，L-蛋胺酸，鹽酸L-組織胺酸，L-脯胺酸，脂肪酸蔗糖酯，維生素C，蛋殼粉，麥芽糖漿，阿拉伯膠，甜味劑(阿斯巴甜、醋磺內酯鉀)，L-苯丙胺酸，L-色胺酸，糊精，辛烯基丁二酸鈉澱粉，香料，食用油脂(菜籽油、椰子油、葵花籽油、棕櫚油)，菸鹼酸，檸檬酸亞鐵鈉，丙二醇，維生素E，乳糖，本多酸鈣，脫脂乳粉，維生素B6，維生素B1，發酵乳粉末，維生素B2，纖維素，維生素A，水解澱粉，&alpha;、&beta;、&gamma;-環狀糊精，維生素B12，維生素D3，砂糖<br />\r\n			本產品含牛奶、蛋及其製品 &nbsp;警語:內含苯丙胺酸</td>\r\n		</tr>\r\n		<tr>\r\n			<th>最佳補給時機</th>\r\n			<td>* 運動前 30分鐘補充，維持運動最佳表現<br />\r\n			* 長時間運動中補充，可幫助保持活力<br />\r\n			* 運動後 30分鐘內補充，幫助身體回復</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '', '', '<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">每一份量<span>4.5公克</span></th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\">每份</th>\r\n			<th>每100公克</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th style=\"text-align: left;\">熱量</th>\r\n			<td>17大卡</td>\r\n			<td>385大卡</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">蛋白質</th>\r\n			<td>3.8公克</td>\r\n			<td>84.5公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">脂肪</th>\r\n			<td>0.0公克</td>\r\n			<td>0.0公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>飽和脂肪</th>\r\n			<td>0.0公克</td>\r\n			<td>0.0公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>反式脂肪</th>\r\n			<td>0.0公克</td>\r\n			<td>0.0公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">碳水化合物</th>\r\n			<td>0.5公克</td>\r\n			<td>11.7公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>糖</th>\r\n			<td>0.0公克</td>\r\n			<td>0.0公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">鈉</th>\r\n			<td>1毫克</td>\r\n			<td>18毫克</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n&nbsp;\r\n\r\n<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\" style=\"text-align: center;\">胺基酸成分</th>\r\n			<th><span style=\"font-size:13px;\">Amino acids 3,600mg</span></th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th>BCAA</th>\r\n			<td>白胺酸Leucine<br />\r\n			異白胺酸Isoleucine<br />\r\n			纈胺酸Valine</td>\r\n			<td>540mg<br />\r\n			430mg<br />\r\n			360mg</td>\r\n		</tr>\r\n		<tr>\r\n			<th>&nbsp;</th>\r\n			<td>麩醯胺酸Glutamine</td>\r\n			<td>650mg</td>\r\n		</tr>\r\n		<tr>\r\n			<th>&nbsp;</th>\r\n			<td>精胺酸Arginine</td>\r\n			<td>610mg</td>\r\n		</tr>\r\n		<tr>\r\n			<th>&nbsp;</th>\r\n			<td>其他多種胺基酸Other AAs</td>\r\n			<td>1,010mg</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n&nbsp;\r\n\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td align=\"center\" bgcolor=\"#cea71b\" colspan=\"3\"><span style=\"color:#2c3e50;\">胺基酸成分</span></td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\"right\" bgcolor=\"#fcf6e0\" colspan=\"3\"><span style=\"color:#2c3e50;\">胺基酸Amino acids&nbsp;&nbsp;3,600mg</span></td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\"left\" bgcolor=\"#CEA71B\" rowspan=\"3\"><span style=\"color:#2c3e50;\">BCAA</span></td>\r\n			<td align=\"right\" bgcolor=\"#f9ecc0\"><span style=\"color:#2c3e50;\">白胺酸Leucine</span></td>\r\n			<td align=\"right\" bgcolor=\"#f9ecc0\"><span style=\"color:#2c3e50;\">540mg</span></td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\"right\" bgcolor=\"#fcf6e0\"><span style=\"color:#2c3e50;\">異白胺酸Isoleucine</span></td>\r\n			<td align=\"right\" bgcolor=\"#fcf6e0\"><span style=\"color:#2c3e50;\">430mg</span></td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\"right\" bgcolor=\"#f9ecc0\"><span style=\"color:#2c3e50;\">纈胺酸Valine</span></td>\r\n			<td align=\"right\" bgcolor=\"#f9ecc0\"><span style=\"color:#2c3e50;\">360mg</span></td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\"left\" bgcolor=\"#E7C247\" rowspan=\"3\">&nbsp;</td>\r\n			<td align=\"right\" bgcolor=\"#fcf6e0\"><span style=\"color:#2c3e50;\">麩醯胺酸Glutamine</span></td>\r\n			<td align=\"right\" bgcolor=\"#fcf6e0\"><span style=\"color:#2c3e50;\">650mg</span></td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\"right\" bgcolor=\"#F9ECC0\"><span style=\"color:#2c3e50;\">精胺酸Arginine</span></td>\r\n			<td align=\"right\" bgcolor=\"#F9ECC0\"><span style=\"color:#2c3e50;\">610mg</span></td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\"right\" bgcolor=\"#FCF6E0\"><span style=\"color:#2c3e50;\">其他多種胺基酸Other AAs</span></td>\r\n			<td align=\"right\" bgcolor=\"#FCF6E0\"><span style=\"color:#2c3e50;\">1,010mg</span></td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 10, 0, '', '2019-05-21 16:08:52', 1, '2019-09-02 20:00:40', 3),
(11, 2, '11', '/uploads/product/1558426836.jpg', '', '', '<table class=\"info-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>原料</th>\r\n			<td>L-白胺酸，鹽酸L-二胺基己酸，L-&alpha;胺基異戊酸，L-異白胺酸，L-羥丁胺酸，L-苯丙胺酸，甜味劑(麥芽糖醇、阿斯巴甜、醋磺內酯鉀)，脂肪酸蔗糖酯，檸檬酸，L-蛋胺酸，香料，糊精，鹽酸L-組織胺酸，L-色胺酸，酶解大豆卵磷脂，貝殼鈣，菜籽油，微結晶狀&alpha;-纖維素，脂肪酸甘油酯，維生素B2 &nbsp;&nbsp;<br />\r\n			警語:內含苯丙胺酸</td>\r\n		</tr>\r\n		<tr>\r\n			<th>最佳補給時機</th>\r\n			<td>* 比賽前一天睡前 30分鐘補充，調整身體狀態<br />\r\n			* 比賽後 30分鐘內補充，提供身體關鍵營養<br />\r\n			* 就寢前 30分鐘補充，幫助身體持續回復</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '', '', '<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">每一份量<span>4.7公克</span></th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\">每份</th>\r\n			<th>每100公克</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th style=\"text-align: left;\">熱量</th>\r\n			<td>18大卡</td>\r\n			<td>389大卡</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">蛋白質</th>\r\n			<td>4.1公克</td>\r\n			<td>86.7公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">脂肪</th>\r\n			<td>0.0公克</td>\r\n			<td>0.0公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>飽和脂肪</th>\r\n			<td>0.0公克</td>\r\n			<td>0.0公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>反式脂肪</th>\r\n			<td>0.0公克</td>\r\n			<td>0.0公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">碳水化合物</th>\r\n			<td>0.5公克</td>\r\n			<td>10.5公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>糖</th>\r\n			<td>0.0公克</td>\r\n			<td>0.0公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">鈉</th>\r\n			<td>1毫克</td>\r\n			<td>13毫克</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<br />\r\n<br />\r\n&nbsp;\r\n<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">胺基酸成分</th>\r\n		</tr>\r\n		<tr>\r\n			<th colspan=\"3\">必需胺基酸Essential Amino acids 4,000mg</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th>BCAA</th>\r\n			<td>白胺酸Leucine</td>\r\n			<td>1,600mg</td>\r\n		</tr>\r\n		<tr>\r\n			<th>BCAA</th>\r\n			<td>異白胺酸Isoleucine</td>\r\n			<td>430mg</td>\r\n		</tr>\r\n		<tr>\r\n			<th>BCAA</th>\r\n			<td>纈胺酸Valine</td>\r\n			<td>440mg</td>\r\n		</tr>\r\n		<tr>\r\n			<th>&nbsp;</th>\r\n			<td>其他多種胺基酸Other AAs</td>\r\n			<td>1,540mg</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 11, 0, '', '2019-05-21 16:20:36', 1, '2019-09-02 20:00:40', 1),
(12, 2, '12', '/uploads/product/1558515763.png', '', '', '<table class=\"info-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>原料</th>\r\n			<td>水，糊精，DL-胺基丙酸，檸檬酸，L-脯胺酸，洋菜，香料，檸檬酸鈉，刺槐豆膠，塔拉膠，醋磺內酯鉀(甜味劑)，維生素B2<br />\r\n			本品生產線亦有生產含芒果原料之產品</td>\r\n		</tr>\r\n		<tr>\r\n			<th>最佳補給時機</th>\r\n			<td>*運動或比賽前30分鐘補充，保持體力充沛<br />\r\n			*運動中後段補充，迅速補充能量</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '', '', '<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">每一份量<span>130公克</span></th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\">每份</th>\r\n			<th>每100公克</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th style=\"text-align: left;\">熱量</th>\r\n			<td>174大卡</td>\r\n			<td>134大卡</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">蛋白質</th>\r\n			<td>4.8公克</td>\r\n			<td>3.7公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">脂肪</th>\r\n			<td>0.0公克</td>\r\n			<td>0.0公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>飽和脂肪</th>\r\n			<td>0.0公克</td>\r\n			<td>0.0公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>反式脂肪</th>\r\n			<td>0.0公克</td>\r\n			<td>0.0公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">碳水化合物</th>\r\n			<td>38.9公克</td>\r\n			<td>29.9公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\"><span style=\"color:#ecf0f1;\">我</span>糖</th>\r\n			<td>2.3公克</td>\r\n			<td>1.8公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">鈉</th>\r\n			<td>14毫克</td>\r\n			<td>11毫克</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<br />\r\n<br />\r\n&nbsp;\r\n<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">胺基酸成分</th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\" style=\"text-align: left;\">胺基酸Amino acids 5,000mg</th>\r\n		</tr>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"2\" style=\"text-align: left;\">丙胺酸Alanine&nbsp;4,500mg</th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\" style=\"text-align: left;\">脯胺酸Proline&nbsp;500mg</th>\r\n		</tr>\r\n	</thead>\r\n</table>\r\n', 12, 0, '', '2019-05-21 16:25:37', 1, '2019-09-02 20:00:40', 3),
(13, 2, '13', '/uploads/product/1558516565.png', '', '', '<table class=\"info-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>原料</th>\r\n			<td>調味劑(L-麩酸鈉、DL-胺基丙酸、琥珀酸二鈉、5&#39;-次黃嘌呤核苷磷酸二鈉、5&#39;-鳥嘌呤核苷磷酸二鈉)、食鹽、蔗糖、玉米澱粉、干貝粉、酵母抽出物、扇貝抽出物、糊精</td>\r\n		</tr>\r\n		<tr>\r\n			<th>容量</th>\r\n			<td>40公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>使用方法</th>\r\n			<td>5公克可調理成500c.c的高湯</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '', '', '<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">每一份量<span>1公克</span></th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\">每份</th>\r\n			<th>每100公克</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th style=\"text-align: left;\">熱量</th>\r\n			<td>2.3大卡</td>\r\n			<td>232 大卡</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">蛋白質</th>\r\n			<td>0.3 公克</td>\r\n			<td>&nbsp;29.1公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">&nbsp; &nbsp; 飽和脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">&nbsp; &nbsp; 反式脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">碳水化合物</th>\r\n			<td>&nbsp; 0.3 公克</td>\r\n			<td>28.9 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">&nbsp; &nbsp; 糖</th>\r\n			<td>0.1公克</td>\r\n			<td>8.1 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">鈉</th>\r\n			<td>150 毫克</td>\r\n			<td>15000 毫克</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 13, 0, '', '2019-05-22 17:16:05', 3, '2019-09-02 20:00:40', 3),
(14, 2, '14', '/uploads/product/1558516958.png', '', '', '<table class=\"info-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>原料</th>\r\n			<td>調味劑(L-麩酸鈉、DL-胺基丙酸、琥珀酸二鈉、5&#39;-次黃嘌呤核苷磷酸二鈉、5&#39;-鳥嘌呤核苷磷酸二鈉)、食鹽、蔗糖、玉米澱粉、干貝粉、酵母抽出物、扇貝抽出物、糊精</td>\r\n		</tr>\r\n		<tr>\r\n			<th>容量</th>\r\n			<td>40公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>使用方法</th>\r\n			<td>5公克可調理成500c.c的高湯</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '', '', '<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">每一份量<span>1公克</span></th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\">每份</th>\r\n			<th>每100公克</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th style=\"text-align: left;\">熱量</th>\r\n			<td>2.3大卡</td>\r\n			<td>232 大卡</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">蛋白質</th>\r\n			<td>0.3 公克</td>\r\n			<td>&nbsp;29.1公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">&nbsp; &nbsp; 飽和脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">&nbsp; &nbsp; 反式脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">碳水化合物</th>\r\n			<td>&nbsp; 0.3 公克</td>\r\n			<td>28.9 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">&nbsp; &nbsp; 糖</th>\r\n			<td>0.1公克</td>\r\n			<td>8.1 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">鈉</th>\r\n			<td>150 毫克</td>\r\n			<td>15000 毫克</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 14, 0, '', '2019-05-22 17:22:38', 3, '2019-09-02 20:00:40', 3),
(15, 3, '15', '/uploads/product/1558517236.png', '', '', '<table class=\"info-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>原料</th>\r\n			<td>調味劑(L-麩酸鈉、氯化鉀、5&#39;-次黃嘌呤核苷磷酸二鈉、5&#39;-鳥嘌呤核苷磷酸二鈉、琥珀酸二鈉)、食鹽、砂糖、D-甘露醇（甜味劑）、昆布粉、糊精、昆布抽出物</td>\r\n		</tr>\r\n		<tr>\r\n			<th>容量</th>\r\n			<td>40公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>使用方法</th>\r\n			<td>4公克可調理成600c.c的高湯</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '', '', '<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">每一份量<span>1公克</span></th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\">每份</th>\r\n			<th>每100公克</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th style=\"text-align: left;\">熱量</th>\r\n			<td>2.2大卡</td>\r\n			<td>217 大卡</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">蛋白質</th>\r\n			<td>0.2公克</td>\r\n			<td>&nbsp;15.3公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">&nbsp; &nbsp; 飽和脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">&nbsp; &nbsp; 反式脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">碳水化合物</th>\r\n			<td>&nbsp; 0.4公克</td>\r\n			<td>38.9 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">&nbsp; &nbsp; 糖</th>\r\n			<td>0.2公克</td>\r\n			<td>21.3公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">鈉</th>\r\n			<td>156毫克</td>\r\n			<td>15600 毫克</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 15, 0, '', '2019-05-22 17:22:40', 3, '2019-09-02 20:00:40', 3),
(16, 3, '16', '/uploads/product/1558517382.png', '', '', '<table class=\"info-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>原料</th>\r\n			<td>調味劑(L-麩酸鈉、氯化鉀、5&#39;-次黃嘌呤核苷磷酸二鈉、5&#39;-鳥嘌呤核苷磷酸二鈉、琥珀酸二鈉)、食鹽、砂糖、D-甘露醇（甜味劑）、昆布粉、糊精、昆布抽出物</td>\r\n		</tr>\r\n		<tr>\r\n			<th>容量</th>\r\n			<td>112公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>使用方法</th>\r\n			<td>4公克可調理成600c.c的高湯</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '', '', '<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">每一份量<span>1公克</span></th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\">每份</th>\r\n			<th>每100公克</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th style=\"text-align: left;\">熱量</th>\r\n			<td>2.2大卡</td>\r\n			<td>217 大卡</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">蛋白質</th>\r\n			<td>0.2公克</td>\r\n			<td>&nbsp;15.3公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">&nbsp; &nbsp; 飽和脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">&nbsp; &nbsp; 反式脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">碳水化合物</th>\r\n			<td>&nbsp; 0.4公克</td>\r\n			<td>38.9 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">&nbsp; &nbsp; 糖</th>\r\n			<td>0.2公克</td>\r\n			<td>21.3公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">鈉</th>\r\n			<td>156毫克</td>\r\n			<td>15600 毫克</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 16, 0, '', '2019-05-22 17:29:42', 3, '2019-09-02 20:00:40', 3),
(17, 3, '17', '/uploads/product/1558517383.png', '', '', '<table class=\"info-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>原料</th>\r\n			<td>調味劑(L-麩酸鈉、氯化鉀、5&#39;-次黃嘌呤核苷磷酸二鈉、5&#39;-鳥嘌呤核苷磷酸二鈉、琥珀酸二鈉)、食鹽、砂糖、D-甘露醇（甜味劑）、昆布粉、糊精、昆布抽出物</td>\r\n		</tr>\r\n		<tr>\r\n			<th>容量</th>\r\n			<td>112公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th>使用方法</th>\r\n			<td>4公克可調理成600c.c的高湯</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '', '', '<table class=\"nutrition-box\">\r\n	<thead>\r\n		<tr class=\"pack-unit\">\r\n			<th colspan=\"3\">每一份量<span>1公克</span></th>\r\n		</tr>\r\n		<tr class=\"unit\">\r\n			<th colspan=\"2\">每份</th>\r\n			<th>每100公克</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th style=\"text-align: left;\">熱量</th>\r\n			<td>2.2大卡</td>\r\n			<td>217 大卡</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">蛋白質</th>\r\n			<td>0.2公克</td>\r\n			<td>&nbsp;15.3公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">&nbsp; &nbsp; 飽和脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">&nbsp; &nbsp; 反式脂肪</th>\r\n			<td>0.0 公克</td>\r\n			<td>0.0 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">碳水化合物</th>\r\n			<td>&nbsp; 0.4公克</td>\r\n			<td>38.9 公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">&nbsp; &nbsp; 糖</th>\r\n			<td>0.2公克</td>\r\n			<td>21.3公克</td>\r\n		</tr>\r\n		<tr>\r\n			<th style=\"text-align: left;\">鈉</th>\r\n			<td>156毫克</td>\r\n			<td>15600 毫克</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 17, 0, '', '2019-05-22 17:29:43', 3, '2019-09-02 20:00:40', 3),
(18, 4, '18', '/uploads/product/1565847840.png', '圖片說明', '', '商品內容', '美味秘訣', '商品資訊', '營養標示', 18, 0, '備註', '2019-08-14 17:53:11', 1, '2019-09-02 20:00:40', 1),
(19, 5, '19', '', '', '', '3', '4', '5', '6', 19, 0, '8', '2019-08-14 18:11:20', 1, '2019-09-02 20:00:40', 1);

-- --------------------------------------------------------

--
-- 替換檢視表以便查看 `product_view`
-- (請參考以下實際畫面)
--
CREATE TABLE `product_view` (
`id` int(11)
,`brand_id` int(11)
,`brand_name` varchar(64)
,`brand_pic_url` text
,`brand_pic_alt` varchar(64)
,`name` varchar(64)
,`pic_urls` text
,`pic_alts` varchar(64)
,`tag` varchar(512)
,`content` text
,`tips` text
,`information` text
,`mark` text
,`list_order` int(11)
,`status` tinyint(1)
,`remark` text
,`c_time` datetime
,`c_user_id` int(11)
,`c_user_name` varchar(64)
,`u_time` datetime
,`u_user_id` int(11)
,`u_user_name` varchar(64)
);

-- --------------------------------------------------------

--
-- 資料表結構 `program`
--

CREATE TABLE `program` (
  `id` int(11) NOT NULL COMMENT '程式編號',
  `category_id` int(11) NOT NULL COMMENT '程式類別編號',
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '程式名稱',
  `guid` varchar(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '程式代號',
  `status` tinyint(1) NOT NULL COMMENT '狀態，0：啟用，1：停用，2：已刪除',
  `remark` text COLLATE utf8_unicode_ci NOT NULL COMMENT '備註',
  `c_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立時間',
  `c_user_id` int(11) NOT NULL COMMENT '建立使用者編號',
  `u_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改時間',
  `u_user_id` int(11) NOT NULL COMMENT '修改使用者編號'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `program`
--

INSERT INTO `program` (`id`, `category_id`, `name`, `guid`, `status`, `remark`, `c_time`, `c_user_id`, `u_time`, `u_user_id`) VALUES
(1, 1, '查詢程式類別', 'A5E214B8-215C-7102-CFA5-30856A548C6A', 0, '', '2019-03-09 17:23:17', 0, '2019-03-09 17:23:17', 0),
(2, 1, '新增程式類別', '250038B2-9B2A-8B92-FEDB-031694588D3F', 0, '', '2019-03-09 17:23:43', 0, '2019-03-09 17:23:43', 0),
(3, 1, '修改程式類別', 'D4AA0838-8D01-A7CB-D35A-E21221C1AA64', 0, '', '2019-03-09 17:24:00', 0, '2019-03-09 17:24:00', 0),
(4, 1, '刪除程式類別', '619CA968-41B5-A481-4EFE-D3C60A5A6CFD', 0, '', '2019-03-09 17:24:17', 0, '2019-03-09 17:24:17', 0),
(5, 2, '查詢程式', 'E47212F0-55F9-748C-9313-F87E74106544', 0, '', '2019-03-09 17:24:48', 0, '2019-03-09 17:24:48', 0),
(6, 2, '新增程式', '75699A30-7CF4-C234-07EA-B515F444A260', 0, '', '2019-03-09 17:25:01', 0, '2019-03-09 17:25:01', 0),
(7, 2, '修改程式', 'BDC15D78-76BB-1882-64EB-A1CD5A3F03BD', 0, '', '2019-03-09 17:25:16', 0, '2019-03-09 17:25:16', 0),
(8, 2, '刪除程式', '3E21AD3D-C59D-6CC9-BCEC-90E562CD127E', 0, '', '2019-03-09 17:25:35', 0, '2019-03-09 17:25:35', 0),
(9, 3, '查詢角色', 'D9D0FB04-1171-CBFF-002F-1D02A7D01E5E', 0, '', '2019-03-09 17:26:01', 0, '2019-03-09 17:26:01', 0),
(10, 3, '新增角色', '2482DDDC-DCB3-C85E-B72D-DAE2330DCE30', 0, '', '2019-03-09 17:26:17', 0, '2019-03-09 17:26:28', 0),
(11, 3, '修改角色', 'F40D8A06-3D77-C197-CE61-25F7666AB056', 0, '', '2019-03-09 17:26:35', 0, '2019-03-09 17:26:35', 0),
(12, 3, '刪除角色', 'E6BADA98-AA9D-8C83-5354-B1DF2A83CB92', 0, '', '2019-03-09 17:26:55', 0, '2019-03-09 17:26:55', 0),
(13, 3, '角色註冊程式', '333CDC63-3438-A89A-005B-4610ED7D00C8', 0, '', '2019-03-09 17:27:11', 0, '2019-03-09 17:27:11', 0),
(14, 3, '角色註冊所有程式', 'C304430C-7147-57C7-88A4-FD082D94121E', 0, '', '2019-03-09 17:27:30', 0, '2019-03-09 17:27:30', 0),
(15, 3, '角色註銷程式', 'A860C4A4-37AE-730D-5B70-C6BA27A5343D', 0, '', '2019-03-09 17:27:46', 0, '2019-03-09 17:27:46', 0),
(16, 3, '角色註銷所有程式', '209D0448-9E99-50DA-056F-580D9130E829', 0, '', '2019-03-09 17:28:04', 0, '2019-03-09 17:28:04', 0),
(17, 3, '查詢角色程式', '1C273312-7AC3-CC8B-DC40-A704E9DCF5A5', 0, '', '2019-03-09 17:28:27', 0, '2019-03-09 17:28:27', 0),
(18, 3, '角色註冊選單', 'FA0100D2-EF87-0731-B345-0C0E347AEE91', 0, '', '2019-03-09 17:28:42', 0, '2019-03-09 17:28:42', 0),
(19, 3, '角色註冊所有選單', '488846F4-CE7B-4334-2EB3-FA994E42CD86', 0, '', '2019-03-09 17:29:02', 0, '2019-03-09 17:29:14', 0),
(20, 3, '角色註銷選單', '901C788A-BDEC-80F4-4971-B2D26154D253', 0, '', '2019-03-09 17:29:12', 0, '2019-03-09 17:29:23', 0),
(21, 3, '角色註銷所有選單', '6BF9D523-FEDE-E45D-677E-3FB9CA5BCA4A', 0, '', '2019-03-09 17:29:48', 0, '2019-03-09 17:29:48', 0),
(22, 3, '查詢角色選單', '5021F926-4DB1-D021-2BE7-5E562BE3423F', 0, '', '2019-03-09 17:30:05', 0, '2019-03-09 17:30:05', 0),
(23, 4, '查詢使用者', '6FFF9949-02F4-5E92-C56C-27817E4C8A63', 0, '', '2019-03-09 17:31:44', 0, '2019-03-09 17:31:44', 0),
(24, 4, '新增使用者', '6DFCB35F-2D2B-76A3-5E86-4DEB4923AC16', 0, '', '2019-03-09 17:32:01', 0, '2019-03-09 17:32:01', 0),
(25, 4, '修改使用者', '6D9B8D25-1E4F-0055-95D4-5735AF276A5B', 0, '', '2019-03-09 17:32:22', 0, '2019-03-09 17:32:22', 0),
(26, 4, '刪除使用者', '8154DEBC-7B54-0D07-EA5F-37DAE7DAC654', 0, '', '2019-03-09 17:32:39', 0, '2019-03-09 17:32:39', 0),
(27, 4, '修改使用者密碼', '3CD3753F-6F16-C0A0-8E55-770D9556EBC0', 0, '', '2019-03-09 17:32:56', 0, '2019-03-09 17:32:56', 0),
(28, 4, '使用者註冊角色', '06A86144-ACF4-2137-EC3C-6CE54C2193B4', 0, '', '2019-03-09 17:33:11', 0, '2019-03-09 17:33:11', 0),
(29, 4, '使用者註銷角色', 'CF98E084-9C98-EA9E-50AE-61104878A87E', 0, '', '2019-03-09 17:33:28', 0, '2019-03-09 17:33:28', 0),
(30, 4, '使用者註銷所有角色', '4B72BE10-FF93-33E3-4A50-40C6BF424B20', 0, '', '2019-03-09 17:33:55', 0, '2019-03-09 17:33:55', 0),
(31, 4, '查詢登入使用者資料', '7B65FAEF-9154-1F99-D624-7A5A55A31E53', 0, '', '2019-03-09 17:34:15', 0, '2019-03-09 17:34:15', 0),
(32, 4, '修改登入使用者資料', 'A5389CFC-FC0B-67A3-C5A0-79D11D487083', 0, '', '2019-03-09 17:34:33', 0, '2019-03-09 17:34:33', 0),
(33, 4, '修改登入使用者密碼', '713911BE-9C23-CAB9-30E7-4618C567DF5B', 0, '', '2019-03-09 17:34:49', 0, '2019-03-09 17:34:49', 0),
(34, 4, '查詢登入使用者程式', 'A7E8C8FA-964D-EA5B-2E00-B6BCD3554366', 0, '', '2019-03-09 17:35:01', 0, '2019-03-09 17:35:01', 0),
(35, 4, '查詢登入使用者樹狀選單', '820D1963-27A0-4D67-B430-F7E32CC7E08C', 0, '', '2019-03-09 17:39:18', 0, '2019-03-09 17:39:18', 0),
(36, 5, '查詢選單', '89996F46-3820-BC89-DA21-8E8BC161B73B', 0, '', '2019-03-09 17:54:36', 1, '2019-03-09 17:59:39', 1),
(37, 5, '新增選單', '6D2FDBFF-8429-ADF4-95F8-E947C9563093', 0, '', '2019-03-09 18:00:57', 1, '2019-03-09 18:00:57', 1),
(38, 5, '修改選單', 'C02A5FF9-CAA4-2A9C-1983-600EA55E0D64', 0, '', '2019-03-09 18:01:16', 1, '2019-03-09 18:01:16', 1),
(39, 5, '刪除選單', '8CADB2EF-4B10-6FD4-E521-7B8E62C43483', 0, '', '2019-03-09 18:01:33', 1, '2019-03-09 18:01:33', 1),
(40, 6, '查詢操作記錄', '999E2E30-F65D-4DDA-D416-036813A8993B', 0, '', '2019-03-09 18:03:58', 1, '2019-07-23 15:40:00', 1),
(43, 7, '查詢縣市', '12D1A070-F262-82BE-707C-5ACAF42543D2', 0, '', '2019-08-14 11:16:46', 1, '2019-08-14 11:16:46', 1),
(44, 7, '查詢鄉鎮市區', 'AF256869-5FEA-66C7-2E9E-4CB76915C9E8', 0, '', '2019-08-14 11:17:05', 1, '2019-08-14 11:17:05', 1),
(45, 8, '查詢首頁Banner', 'C4EF960E-E09C-F712-544C-CC0F2BB16F55', 0, '', '2019-08-14 11:32:14', 1, '2019-08-14 11:32:14', 1),
(46, 8, '新增首頁Banner', '21F54643-5E83-5F76-A9A9-3025D9709A41', 0, '', '2019-08-14 11:32:37', 1, '2019-08-14 11:32:37', 1),
(47, 8, '修改首頁Banner', '1D4F4DEF-9119-1F6A-E74A-ECBA1A01E7B0', 0, '', '2019-08-14 11:32:53', 1, '2019-08-14 11:32:53', 1),
(48, 8, '刪除首頁Banner', '9F20BA8A-0769-FB07-129C-155B5352C8B5', 0, '', '2019-08-14 11:33:06', 1, '2019-08-14 11:33:06', 1),
(49, 9, '查詢廣告', 'AAD3DC2F-2697-579E-2279-C946F4E19075', 0, '', '2019-08-14 13:43:54', 1, '2019-08-14 13:43:54', 1),
(50, 9, '新增廣告', 'A5C5804F-6813-1A0E-5193-8B2ACF517148', 0, '', '2019-08-14 13:44:09', 1, '2019-08-14 13:44:09', 1),
(51, 9, '修改廣告', '0B70E48C-EE2A-3AE1-BD01-7E121A08FD2B', 0, '', '2019-08-14 13:44:27', 1, '2019-08-14 13:44:27', 1),
(52, 9, '刪除廣告', '2724E724-53A2-7409-28AF-76A33C981DA7', 0, '', '2019-08-14 13:44:40', 1, '2019-08-14 13:44:40', 1),
(53, 10, '查詢餐飲情報標籤', 'A6972072-86EA-090B-FD8F-49AB5EFC645E', 0, '', '2019-08-14 14:27:56', 1, '2019-08-14 14:27:56', 1),
(54, 10, '新增餐飲情報標籤', 'E25301FD-12E2-DE74-35FD-251E32F1FD25', 0, '', '2019-08-14 14:28:11', 1, '2019-08-14 14:28:11', 1),
(55, 10, '修改餐飲情報標籤', '4B01A5BD-A381-992A-2AB2-CB41783CCFDB', 0, '', '2019-08-14 14:28:25', 1, '2019-08-14 14:28:25', 1),
(56, 10, '刪除餐飲情報標籤', '88E18D70-0C95-996D-FBD7-2E14F6B225AF', 0, '', '2019-08-14 14:28:39', 1, '2019-08-14 14:28:39', 1),
(57, 11, '查詢餐飲情報', 'FAEA951F-BFB5-6A20-379F-3B4F7B82098F', 0, '', '2019-08-14 15:16:50', 1, '2019-08-14 15:16:50', 1),
(58, 11, '新增餐飲情報', 'C23669F6-4626-1D60-008A-5BDA48210079', 0, '', '2019-08-14 15:17:05', 1, '2019-08-14 15:17:05', 1),
(59, 11, '修改餐飲情報', '69876D85-3705-66FA-54E1-EF8F7AAD544A', 0, '', '2019-08-14 15:17:21', 1, '2019-08-14 15:17:21', 1),
(60, 11, '刪除餐飲情報', '07F68971-5A59-EE4B-285C-59D0A840EC32', 0, '', '2019-08-14 15:17:35', 1, '2019-08-14 15:17:35', 1),
(61, 12, '查詢品牌', '945FE94B-0244-E364-1ED7-29C92CCEF5EE', 0, '', '2019-08-14 16:37:18', 1, '2019-08-14 16:37:18', 1),
(62, 12, '新增品牌', '75E08067-7FF0-6F95-A92D-8414959CB94A', 0, '', '2019-08-14 16:37:32', 1, '2019-08-14 16:37:32', 1),
(63, 12, '修改品牌', '408142A8-9687-65E0-0C38-6D89E7044945', 0, '', '2019-08-14 16:37:46', 1, '2019-08-14 16:37:46', 1),
(64, 12, '刪除品牌', '3671F6BB-8C9D-C906-D30C-9F119C3BE1AE', 0, '', '2019-08-14 16:37:59', 1, '2019-08-14 16:37:59', 1),
(65, 13, '查詢商品', '04732B43-9951-41A2-4669-23CFF9C5511C', 0, '', '2019-08-14 17:47:26', 1, '2019-08-14 17:47:26', 1),
(66, 13, '新增商品', 'C1A391AC-6DA5-3368-8D90-5798F00B3585', 0, '', '2019-08-14 17:47:40', 1, '2019-08-14 17:47:40', 1),
(67, 13, '修改商品', '2B06ADD9-7C12-1EFB-FB4D-7A728B592DBA', 0, '', '2019-08-14 17:47:55', 1, '2019-08-14 17:47:55', 1),
(68, 13, '刪除商品', 'C96C51C8-456B-026B-5629-A9E6A9023731', 0, '', '2019-08-14 17:48:08', 1, '2019-08-14 17:48:08', 1),
(69, 14, '查詢專業食譜', '7AC29E49-0D42-E418-311E-5DF01056F5FB', 0, '', '2019-08-16 10:03:25', 1, '2019-08-16 10:03:25', 1),
(70, 14, '新增專業食譜', '4EB21110-0D03-5FCA-C249-D7B119A2C716', 0, '', '2019-08-16 10:03:41', 1, '2019-08-16 10:03:41', 1),
(71, 14, '修改專業食譜', 'E27B2AEA-D0F7-BF15-A3E7-B80BE874DF3C', 0, '', '2019-08-16 10:03:56', 1, '2019-08-16 10:03:56', 1),
(72, 14, '刪除專業食譜', 'B888A3E3-5588-700F-B841-FD618D4801D2', 0, '', '2019-08-16 10:04:12', 1, '2019-08-16 10:04:12', 1),
(73, 15, '查詢專業食譜內容', 'FA4CB3B0-A777-BEF0-EBAA-BAEFC7E4926C', 0, '', '2019-08-19 09:39:21', 1, '2019-08-19 09:39:21', 1),
(74, 15, '新增專業食譜內容', 'DEA3E52C-E72F-1CD5-87C4-05EC43338813', 0, '', '2019-08-19 09:39:35', 1, '2019-08-19 09:39:35', 1),
(75, 15, '刪除專業食譜內容', 'C4742744-712B-DC32-1BD5-3C73397472BB', 0, '', '2019-08-19 09:39:52', 1, '2019-08-19 09:39:52', 1),
(76, 16, '查詢招客秘技', '9817A811-0AC3-9301-9847-A8AF5047FA43', 0, '', '2019-08-20 15:01:11', 1, '2019-08-20 15:01:11', 1),
(77, 16, '新增招客秘技', 'FE5A89D7-193B-257B-6474-A90A828AA922', 0, '', '2019-08-20 15:01:25', 1, '2019-08-20 15:01:25', 1),
(78, 16, '修改招客秘技', '488C8C4A-A503-7182-02F1-8F01C056B596', 0, '', '2019-08-20 15:01:39', 1, '2019-08-20 15:01:39', 1),
(79, 16, '刪除招客秘技', '9B5FF3D9-F53B-1F3C-0942-452B3BE5716F', 0, '', '2019-08-20 15:01:55', 1, '2019-08-20 15:01:55', 1),
(80, 17, '查詢會員', '738343E4-E840-D20C-4DD2-279F63D55750', 0, '', '2019-08-20 16:53:39', 1, '2019-08-20 16:53:39', 1),
(81, 17, '新增會員', '5C2C9FBB-3955-17D0-100E-C75905E3189D', 0, '', '2019-08-20 16:53:54', 1, '2019-08-20 16:53:54', 1),
(82, 17, '修改會員', '0F0A5EF0-FF5A-A8F7-2671-7BFED240502B', 0, '', '2019-08-20 16:54:09', 1, '2019-08-20 16:54:09', 1),
(83, 17, '修改會員密碼', 'F4E94E66-DDBC-8A33-0512-91B5AE8E1F80', 0, '', '2019-08-20 16:54:23', 1, '2019-08-20 16:54:23', 1),
(84, 17, '啟用會員帳號', 'A688416E-3372-1719-CCCB-BCB6BC657776', 0, '', '2019-08-20 16:54:44', 1, '2019-08-20 16:54:44', 1),
(85, 17, '修改會員密碼', 'CE348E1D-774F-F85B-EDD4-494B6A4423DF', 0, '', '2019-08-20 16:55:04', 1, '2019-08-20 16:55:04', 1),
(86, 17, '刪除會員', '3A5DF0BA-5977-2D2F-5EAF-68B7543B98AF', 0, '', '2019-08-20 16:55:24', 1, '2019-08-20 16:55:24', 1),
(87, 16, '增加招客秘技瀏覽人數', 'A53CAF90-B5F8-CA2A-CE48-48359C948E88', 0, '', '2019-09-02 09:46:58', 1, '2019-09-02 09:46:58', 1),
(88, 14, '增加專業食譜瀏覽人數', '88475F0A-9820-4349-3804-3C287502E10E', 0, '', '2019-09-02 10:03:12', 1, '2019-09-02 10:03:12', 1),
(89, 18, '查詢標籤類別', '02AAAA8D-6C8D-F32D-CDC4-50A3DFE64C18', 0, '', '2019-11-14 14:04:13', 1, '2019-11-14 14:04:13', 1),
(90, 18, '新增標籤類別', '19A3AB3B-619A-D8C7-FD86-0D421EFB48F4', 0, '', '2019-11-14 14:04:28', 1, '2019-11-14 14:04:28', 1),
(91, 18, '修改標籤類別', 'C3AC8109-84A8-3E0E-D70B-B87528979F00', 0, '', '2019-11-14 14:04:41', 1, '2019-11-14 14:04:41', 1),
(92, 18, '刪除標籤類別', '87CBD553-3A55-6E01-0D43-711D5D7206B6', 0, '', '2019-11-14 14:04:56', 1, '2019-11-14 14:04:56', 1),
(93, 18, '查詢標籤', 'D9970BAB-7ACD-E126-E48D-B3270BB03DCC', 0, '', '2019-11-14 14:05:25', 1, '2019-11-14 14:05:25', 1),
(94, 18, '新增標籤', '16DDD9DB-5AC0-1A8A-B434-9724289EBB58', 0, '', '2019-11-14 14:05:38', 1, '2019-11-14 14:05:38', 1),
(95, 18, '修改標籤', '62358D33-6D84-4775-F3AA-DF35DC485EA5', 0, '', '2019-11-14 14:05:54', 1, '2019-11-14 14:05:54', 1),
(96, 18, '刪除標籤', 'BE30830D-2ADA-5E43-A4DB-522F3AE4B563', 0, '', '2019-11-14 14:06:06', 1, '2019-11-14 14:06:06', 1);

-- --------------------------------------------------------

--
-- 資料表結構 `program_category`
--

CREATE TABLE `program_category` (
  `id` int(11) NOT NULL COMMENT '程式類別編號',
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '程式類別名稱',
  `status` tinyint(1) NOT NULL COMMENT '狀態，0：啟用，1：停用，2：已刪除',
  `remark` text COLLATE utf8_unicode_ci NOT NULL COMMENT '備註',
  `c_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立時間',
  `c_user_id` int(11) NOT NULL COMMENT '建立使用者編號',
  `u_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改時間',
  `u_user_id` int(11) NOT NULL COMMENT '修改使用者編號'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `program_category`
--

INSERT INTO `program_category` (`id`, `name`, `status`, `remark`, `c_time`, `c_user_id`, `u_time`, `u_user_id`) VALUES
(1, '程式類別', 0, '', '2019-03-09 16:42:45', 0, '2019-03-09 17:20:29', 0),
(2, '程式', 0, '', '2019-03-09 17:20:29', 0, '2019-03-09 17:20:40', 0),
(3, '角色', 0, '', '2019-03-09 17:20:29', 0, '2019-03-09 17:20:51', 0),
(4, '使用者', 0, '', '2019-03-09 17:20:58', 0, '2019-03-09 17:20:58', 0),
(5, '選單', 0, '', '2019-03-09 17:21:04', 0, '2019-03-09 17:21:04', 0),
(6, '操作記錄', 0, '', '2019-03-09 17:21:25', 0, '2019-03-09 17:21:25', 0),
(7, '縣市-鄉鎮市區', 0, '', '2019-08-14 11:16:11', 1, '2019-08-14 11:16:11', 1),
(8, '首頁Banner', 0, '', '2019-08-14 11:31:36', 1, '2019-08-14 11:31:36', 1),
(9, '廣告', 0, '', '2019-08-14 13:42:27', 1, '2019-08-14 13:42:27', 1),
(10, '餐飲情報標籤', 0, '', '2019-08-14 14:27:15', 1, '2019-08-14 14:27:15', 1),
(11, '餐飲情報', 0, '', '2019-08-14 15:16:14', 1, '2019-08-14 15:16:14', 1),
(12, '品牌', 0, '', '2019-08-14 16:36:46', 1, '2019-08-14 16:36:46', 1),
(13, '商品', 0, '', '2019-08-14 17:46:44', 1, '2019-08-14 17:46:44', 1),
(14, '專業食譜', 0, '', '2019-08-16 10:02:43', 1, '2019-08-16 10:02:43', 1),
(15, '專業食譜內容', 0, '', '2019-08-19 09:38:44', 1, '2019-08-19 09:38:44', 1),
(16, '招客秘技', 0, '', '2019-08-20 15:00:23', 1, '2019-08-20 15:00:23', 1),
(17, '會員', 0, '', '2019-08-20 16:52:59', 1, '2019-08-20 16:52:59', 1),
(18, '標籤類別', 0, '', '2019-11-14 14:03:29', 1, '2019-11-14 14:03:29', 1),
(19, '標籤', 0, '', '2019-11-14 14:03:34', 1, '2019-11-14 14:03:34', 1);

-- --------------------------------------------------------

--
-- 替換檢視表以便查看 `program_category_view`
-- (請參考以下實際畫面)
--
CREATE TABLE `program_category_view` (
`id` int(11)
,`name` varchar(64)
,`status` tinyint(1)
,`remark` text
,`c_time` datetime
,`c_user_id` int(11)
,`c_user_name` varchar(64)
,`u_time` datetime
,`u_user_id` int(11)
,`u_user_name` varchar(64)
);

-- --------------------------------------------------------

--
-- 替換檢視表以便查看 `program_view`
-- (請參考以下實際畫面)
--
CREATE TABLE `program_view` (
`id` int(11)
,`category_id` int(11)
,`category_name` varchar(64)
,`name` varchar(64)
,`guid` varchar(36)
,`status` tinyint(1)
,`remark` text
,`c_time` datetime
,`c_user_id` int(11)
,`c_user_name` varchar(64)
,`u_time` datetime
,`u_user_id` int(11)
,`u_user_name` varchar(64)
);

-- --------------------------------------------------------

--
-- 資料表結構 `recipepro`
--

CREATE TABLE `recipepro` (
  `id` int(11) NOT NULL COMMENT '專業食譜編號',
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '專業食譜名稱',
  `pic_url` text COLLATE utf8_unicode_ci NOT NULL COMMENT '圖片網址',
  `pic_alt` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '圖片說明',
  `feature` text COLLATE utf8_unicode_ci NOT NULL COMMENT '特色',
  `tags` text COLLATE utf8_unicode_ci NOT NULL COMMENT '標籤',
  `price` varchar(512) COLLATE utf8_unicode_ci NOT NULL COMMENT '參考價格',
  `type` varchar(512) COLLATE utf8_unicode_ci NOT NULL COMMENT '菜色類型',
  `style` varchar(512) COLLATE utf8_unicode_ci NOT NULL COMMENT '菜式類型',
  `product_ids` text COLLATE utf8_unicode_ci NOT NULL COMMENT '使用商品編號，以逗號分隔',
  `material_weight` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '材料份量',
  `nutrition` text COLLATE utf8_unicode_ci NOT NULL COMMENT '營養成份',
  `member_only` tinyint(1) NOT NULL COMMENT '會員限定',
  `visitor` int(11) NOT NULL COMMENT '瀏覽人數',
  `list_order` int(11) NOT NULL COMMENT '列表順序',
  `status` tinyint(1) NOT NULL COMMENT '狀態，0：啟用，1：停用，2：已刪除',
  `remark` text COLLATE utf8_unicode_ci NOT NULL COMMENT '備註',
  `c_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立時間',
  `c_user_id` int(11) NOT NULL COMMENT '建立使者編號',
  `u_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改時間',
  `u_user_id` int(11) NOT NULL COMMENT '修改使用者編號'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `recipepro`
--

INSERT INTO `recipepro` (`id`, `name`, `pic_url`, `pic_alt`, `feature`, `tags`, `price`, `type`, `style`, `product_ids`, `material_weight`, `nutrition`, `member_only`, `visitor`, `list_order`, `status`, `remark`, `c_time`, `c_user_id`, `u_time`, `u_user_id`) VALUES
(1, '1', '/uploads/repicepro/1565924165.png', '3', '6', '雞肉,豬肉,根莖類', '9', '素食', '火鍋', '6,7', '1231231', '1', 0, 25, 1, 0, '11', '2019-08-16 10:56:05', 1, '2019-11-14 13:22:55', 2),
(2, '2', '/uploads/repicepro/1567072415.png', 'A', '', '雞肉', '999', '日式', '火鍋', '1,2,3,19', '', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n		<tr>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n		<tr>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>碳水化合物</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n		<tr>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n		<tr>\r\n			<th>碳水化合物</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 69, 2, 0, '', '2019-08-19 19:43:07', 1, '2019-11-19 09:45:10', 2),
(3, '3', '/uploads/repicepro/1565924165.png', '3', '6', '雞肉,豬肉,根莖類', '9', '素食', '火鍋', '19', '', '1', 1, 3, 3, 0, '11', '2019-08-16 10:56:05', 1, '2019-09-11 11:11:15', 2),
(4, '4', '/uploads/repicepro/1567072415.png', 'A', '7', '牛肉', '0', '中式', '火鍋', '1', '', '', 0, 12, 4, 0, '', '2019-08-19 19:43:07', 1, '2019-10-05 09:44:51', 2),
(5, '5', '/uploads/repicepro/1565924165.png', '3', '6', '雞肉,豬肉,根莖類,主菜,火鍋', '9', '素食', '火鍋', '1', '', '1', 1, 3, 5, 0, '11', '2019-08-16 10:56:05', 1, '2019-09-11 09:56:20', 2),
(6, '6', '/uploads/repicepro/1567072415.png', 'A', '7', '飯食', '0', '中式', '主菜', '1', '', '', 0, 1, 6, 0, '', '2019-08-19 19:43:07', 1, '2019-10-05 09:43:03', 2),
(7, '7', '/uploads/repicepro/1567072415.png', 'A', '7', '前菜', '0', '中式', '主菜', '1', '', '', 0, 5, 7, 0, '', '2019-08-19 19:43:07', 1, '2019-10-05 09:46:36', 2),
(8, '8', '/uploads/repicepro/1567072415.png', 'A', '7', '前菜', '0', '中式', '主菜', '1', '', '', 0, 3, 8, 0, '', '2019-08-19 19:43:07', 1, '2019-11-13 11:57:07', 2),
(9, '9', '/uploads/repicepro/1567072415.png', 'A', '7', '前菜', '0', '中式', '主菜', '1', '', '', 0, 4, 9, 0, '', '2019-08-19 19:43:07', 1, '2019-10-05 09:46:48', 2),
(10, '10', '/uploads/repicepro/1567072415.png', 'A', '7', '前菜', '0', '中式', '主菜', '1', '', '', 0, 7, 10, 0, '', '2019-08-19 19:43:07', 1, '2019-11-13 11:57:01', 2),
(11, '11', '/uploads/repicepro/1567072415.png', 'A', '7', '前菜', '0', '中式', '主菜', '1', '', '', 0, 4, 11, 0, '', '2019-08-19 19:43:07', 1, '2019-10-05 09:46:43', 2);

-- --------------------------------------------------------

--
-- 資料表結構 `recipepro_detail`
--

CREATE TABLE `recipepro_detail` (
  `recipepro_id` int(11) NOT NULL COMMENT '專業食譜編號',
  `class` tinyint(4) NOT NULL COMMENT '類別，1：材料，2：料理步驟',
  `names` text COLLATE utf8_unicode_ci NOT NULL COMMENT '名稱，以逗號分隔',
  `contents` text COLLATE utf8_unicode_ci NOT NULL COMMENT '內容，以逗號分隔',
  `links` text COLLATE utf8_unicode_ci NOT NULL COMMENT '連結網址，以逗號分隔',
  `blanks` text COLLATE utf8_unicode_ci NOT NULL COMMENT '另開視窗，以逗號分隔',
  `list_order` int(11) NOT NULL COMMENT '列表順序'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `recipepro_detail`
--

INSERT INTO `recipepro_detail` (`recipepro_id`, `class`, `names`, `contents`, `links`, `blanks`, `list_order`) VALUES
(2, 1, '蝦', '2條', '', '', 0),
(2, 2, '1', '1', 'https://tw.yahoo.com/', '1', 1),
(2, 2, 'S,A', 'Sg,A條', 'https://tw.yahoo.com/,', '1,0', 2),
(2, 2, 'A,C', 'A小匙,C大匙', ',https://tw.yahoo.com/', '0,0', 3),
(2, 3, 'E', '', '', '', 0),
(2, 3, 'D', '', '', '', 1),
(1, 1, '1,2,3,4', '1,2,3,4', '', '', 0),
(1, 1, '5', '5', '', '', 1),
(1, 1, '6,7', '6,7', '', '', 2),
(1, 1, '8', '', '', '', 3);

-- --------------------------------------------------------

--
-- 替換檢視表以便查看 `recipepro_view`
-- (請參考以下實際畫面)
--
CREATE TABLE `recipepro_view` (
`id` int(11)
,`name` varchar(64)
,`pic_url` text
,`pic_alt` varchar(64)
,`feature` text
,`tags` text
,`price` varchar(512)
,`type` varchar(512)
,`style` varchar(512)
,`product_ids` text
,`material_weight` varchar(10)
,`product_names` text
,`nutrition` text
,`member_only` tinyint(1)
,`visitor` int(11)
,`list_order` int(11)
,`status` tinyint(1)
,`remark` text
,`c_time` datetime
,`c_user_id` int(11)
,`c_user_name` varchar(64)
,`u_time` datetime
,`u_user_id` int(11)
,`u_user_name` varchar(64)
);

-- --------------------------------------------------------

--
-- 資料表結構 `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL COMMENT '角色編號',
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '角色名稱',
  `status` tinyint(1) NOT NULL COMMENT '狀態，0：啟用，1：停用，2：已刪除',
  `remark` text COLLATE utf8_unicode_ci NOT NULL COMMENT '備註',
  `c_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立時間',
  `c_user_id` int(11) NOT NULL COMMENT '建立使用者編號',
  `u_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改時間',
  `u_user_id` int(11) NOT NULL COMMENT '修改使用者編號'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `role`
--

INSERT INTO `role` (`id`, `name`, `status`, `remark`, `c_time`, `c_user_id`, `u_time`, `u_user_id`) VALUES
(1, '系統管理員', 0, '', '2019-03-09 15:54:58', 0, '2019-03-09 15:54:58', 0);

-- --------------------------------------------------------

--
-- 資料表結構 `role_menu`
--

CREATE TABLE `role_menu` (
  `role_id` int(11) NOT NULL COMMENT '角色編號',
  `menu_id` int(11) NOT NULL COMMENT '選單編號'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `role_menu`
--

INSERT INTO `role_menu` (`role_id`, `menu_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 20);

-- --------------------------------------------------------

--
-- 替換檢視表以便查看 `role_menu_view`
-- (請參考以下實際畫面)
--
CREATE TABLE `role_menu_view` (
`role_id` int(11)
,`role_name` varchar(64)
,`role_status` tinyint(1)
,`id` int(11)
,`parent_id` int(11)
,`parent_name` varchar(64)
,`name` varchar(64)
,`url` varchar(512)
,`icon` varchar(128)
,`program_ids` text
,`list_order` int(11)
,`status` tinyint(1)
,`remark` text
,`c_time` datetime
,`c_user_id` int(11)
,`c_user_name` varchar(64)
,`u_time` datetime
,`u_user_id` int(11)
,`u_user_name` varchar(64)
);

-- --------------------------------------------------------

--
-- 資料表結構 `role_program`
--

CREATE TABLE `role_program` (
  `role_id` int(11) NOT NULL COMMENT '角色編號',
  `program_id` int(11) NOT NULL COMMENT '程式編號'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `role_program`
--

INSERT INTO `role_program` (`role_id`, `program_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 20),
(1, 21),
(1, 22),
(1, 23),
(1, 24),
(1, 25),
(1, 26),
(1, 27),
(1, 28),
(1, 29),
(1, 30),
(1, 31),
(1, 32),
(1, 33),
(1, 34),
(1, 35),
(1, 36),
(1, 37),
(1, 38),
(1, 39),
(1, 40),
(1, 43),
(1, 44),
(1, 45),
(1, 46),
(1, 47),
(1, 48),
(1, 49),
(1, 50),
(1, 51),
(1, 52),
(1, 53),
(1, 54),
(1, 55),
(1, 56),
(1, 57),
(1, 58),
(1, 59),
(1, 60),
(1, 61),
(1, 62),
(1, 63),
(1, 64),
(1, 65),
(1, 66),
(1, 67),
(1, 68),
(1, 69),
(1, 70),
(1, 71),
(1, 72),
(1, 73),
(1, 74),
(1, 75),
(1, 76),
(1, 77),
(1, 78),
(1, 79),
(1, 80),
(1, 81),
(1, 82),
(1, 83),
(1, 84),
(1, 85),
(1, 86),
(1, 87),
(1, 88),
(1, 89),
(1, 90),
(1, 91),
(1, 92),
(1, 93),
(1, 94),
(1, 95),
(1, 96);

-- --------------------------------------------------------

--
-- 替換檢視表以便查看 `role_program_view`
-- (請參考以下實際畫面)
--
CREATE TABLE `role_program_view` (
`role_id` int(11)
,`role_name` varchar(64)
,`role_status` tinyint(1)
,`id` int(11)
,`category_id` int(11)
,`category_name` varchar(64)
,`name` varchar(64)
,`guid` varchar(36)
,`status` tinyint(1)
,`remark` text
,`c_time` datetime
,`c_user_id` int(11)
,`c_user_name` varchar(64)
,`u_time` datetime
,`u_user_id` int(11)
,`u_user_name` varchar(64)
);

-- --------------------------------------------------------

--
-- 資料表結構 `role_user`
--

CREATE TABLE `role_user` (
  `role_id` int(11) NOT NULL COMMENT '角色編號',
  `user_id` int(11) NOT NULL COMMENT '使用者編號'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `role_user`
--

INSERT INTO `role_user` (`role_id`, `user_id`) VALUES
(1, 1),
(1, 2),
(1, 3);

-- --------------------------------------------------------

--
-- 替換檢視表以便查看 `role_view`
-- (請參考以下實際畫面)
--
CREATE TABLE `role_view` (
`id` int(11)
,`name` varchar(64)
,`status` tinyint(1)
,`remark` text
,`c_time` datetime
,`c_user_id` int(11)
,`c_user_name` varchar(64)
,`u_time` datetime
,`u_user_id` int(11)
,`u_user_name` varchar(64)
);

-- --------------------------------------------------------

--
-- 資料表結構 `tag`
--

CREATE TABLE `tag` (
  `id` int(11) NOT NULL COMMENT '標籤編號',
  `category_id` int(11) NOT NULL COMMENT '標籤類別編號',
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '標籤名稱',
  `list_order` int(11) NOT NULL COMMENT '列表順序	',
  `status` tinyint(1) NOT NULL COMMENT '狀態，0：啟用，1：停用，2：已刪除',
  `remark` text COLLATE utf8_unicode_ci NOT NULL COMMENT '備註',
  `c_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立時間',
  `c_user_id` int(11) NOT NULL COMMENT '建立使用者編號',
  `u_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改時間',
  `u_user_id` int(11) NOT NULL COMMENT '修改使用者編號'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `tag`
--

INSERT INTO `tag` (`id`, `category_id`, `name`, `list_order`, `status`, `remark`, `c_time`, `c_user_id`, `u_time`, `u_user_id`) VALUES
(1, 1, '雞肉', 0, 0, '', '2019-11-04 10:36:34', 1, '2019-11-14 14:31:24', 1),
(2, 1, '豬肉', 0, 0, '', '2019-11-04 10:36:43', 1, '2019-11-19 10:10:44', 1),
(3, 1, '牛肉', 0, 0, '', '2019-11-04 10:36:55', 1, '2019-11-14 14:20:38', 1),
(4, 1, '海鮮類', 0, 0, '', '2019-11-14 14:14:55', 0, '2019-11-14 14:16:01', 0),
(5, 1, '葉菜類', 0, 0, '', '2019-11-14 14:14:56', 0, '2019-11-14 14:16:01', 0),
(6, 1, '根莖類', 0, 0, '', '2019-11-14 14:14:56', 0, '2019-11-14 14:16:01', 0),
(7, 1, '瓜果類', 0, 0, '', '2019-11-14 14:14:56', 0, '2019-11-14 14:16:01', 0),
(8, 1, '菇蕈類', 0, 0, '', '2019-11-14 14:14:56', 0, '2019-11-14 14:16:01', 0),
(9, 1, '豆類', 0, 0, '', '2019-11-14 14:14:56', 0, '2019-11-14 14:16:01', 0),
(10, 1, '蛋', 0, 0, '', '2019-11-14 14:14:57', 0, '2019-11-14 14:16:01', 0),
(11, 1, '其他', 0, 0, '', '2019-11-14 14:14:57', 0, '2019-11-14 14:16:01', 0),
(12, 2, '中式', 0, 0, '', '2019-11-14 14:14:57', 0, '2019-11-14 14:31:26', 0),
(13, 2, '日式', 0, 0, '', '2019-11-14 14:21:21', 0, '2019-11-14 14:23:02', 0),
(14, 2, '西式', 0, 0, '', '2019-11-14 14:21:21', 0, '2019-11-14 14:21:41', 0),
(15, 2, '韓式', 0, 0, '', '2019-11-14 14:21:22', 0, '2019-11-14 14:21:41', 0),
(16, 2, '小吃', 0, 0, '', '2019-11-14 14:21:22', 0, '2019-11-14 14:21:41', 0),
(17, 2, '素食', 0, 0, '', '2019-11-14 14:22:00', 0, '2019-11-14 14:22:00', 0),
(18, 3, '主菜', 0, 0, '', '2019-11-14 14:23:16', 0, '2019-11-14 14:31:28', 0),
(19, 3, '前菜', 0, 0, '', '2019-11-14 14:23:17', 0, '2019-11-14 14:24:01', 0),
(20, 3, '湯品', 0, 0, '', '2019-11-14 14:23:18', 0, '2019-11-14 14:24:01', 0),
(21, 3, '火鍋', 0, 0, '', '2019-11-14 14:23:18', 0, '2019-11-14 14:24:01', 0),
(22, 3, '飯食', 0, 0, '', '2019-11-14 14:23:19', 0, '2019-11-14 14:24:01', 0),
(23, 3, '麵食', 0, 0, '', '2019-11-14 14:23:20', 0, '2019-11-14 14:24:01', 0),
(24, 3, '粥品', 0, 0, '', '2019-11-14 14:23:21', 0, '2019-11-14 14:24:01', 0),
(25, 3, '羹類', 0, 0, '', '2019-11-14 14:23:21', 0, '2019-11-14 14:24:01', 0),
(26, 3, '點心', 0, 0, '', '2019-11-14 14:23:22', 0, '2019-11-14 14:24:01', 0),
(27, 3, '其他', 0, 0, '', '2019-11-14 14:24:09', 0, '2019-11-14 14:25:19', 0),
(28, 4, 'g', 0, 0, '', '2019-11-14 14:25:29', 0, '2019-11-19 10:02:37', 1),
(29, 4, '條', 0, 0, '', '2019-11-14 14:25:30', 0, '2019-11-14 14:26:03', 0),
(30, 4, '小匙', 0, 0, '', '2019-11-14 14:25:30', 0, '2019-11-19 10:02:37', 1),
(31, 4, '大匙', 0, 0, '', '2019-11-14 14:25:31', 0, '2019-11-14 14:26:03', 0),
(32, 4, '適量', 0, 0, '', '2019-11-14 14:25:31', 0, '2019-11-14 14:26:03', 0),
(33, 4, 'c.c.', 0, 0, '', '2019-11-14 14:25:31', 0, '2019-11-14 14:26:03', 0),
(34, 4, '少許', 0, 0, '', '2019-11-14 14:25:32', 0, '2019-11-14 14:27:22', 0);

-- --------------------------------------------------------

--
-- 資料表結構 `tag_category`
--

CREATE TABLE `tag_category` (
  `id` int(11) NOT NULL COMMENT '標籤類別編號',
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '標籤類別名稱',
  `list_order` int(11) NOT NULL COMMENT '列表順序	',
  `status` tinyint(1) NOT NULL COMMENT '狀態，0：啟用，1：停用，2：已刪除',
  `remark` text COLLATE utf8_unicode_ci NOT NULL COMMENT '備註',
  `c_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立時間',
  `c_user_id` int(11) NOT NULL COMMENT '建立使用者編號',
  `u_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改時間',
  `u_user_id` int(11) NOT NULL COMMENT '修改使用者編號'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `tag_category`
--

INSERT INTO `tag_category` (`id`, `name`, `list_order`, `status`, `remark`, `c_time`, `c_user_id`, `u_time`, `u_user_id`) VALUES
(1, '食材', 1, 0, '', '2019-10-31 16:44:19', 1, '2019-11-14 14:14:10', 1),
(2, '菜色', 2, 0, '', '2019-10-31 16:44:26', 1, '2019-11-14 14:13:23', 1),
(3, '菜式', 3, 0, '', '2019-10-31 16:44:37', 1, '2019-11-14 14:13:28', 1),
(4, '材料單位', 4, 0, '', '2019-11-14 14:14:07', 0, '2019-11-14 14:14:07', 0);

-- --------------------------------------------------------

--
-- 替換檢視表以便查看 `tag_category_view`
-- (請參考以下實際畫面)
--
CREATE TABLE `tag_category_view` (
`id` int(11)
,`name` varchar(64)
,`list_order` int(11)
,`status` tinyint(1)
,`remark` text
,`c_time` datetime
,`c_user_id` int(11)
,`c_user_name` varchar(64)
,`u_time` datetime
,`u_user_id` int(11)
,`u_user_name` varchar(64)
);

-- --------------------------------------------------------

--
-- 替換檢視表以便查看 `tag_view`
-- (請參考以下實際畫面)
--
CREATE TABLE `tag_view` (
`id` int(11)
,`category_id` int(11)
,`category_name` varchar(64)
,`name` varchar(64)
,`list_order` int(11)
,`status` tinyint(1)
,`remark` text
,`c_time` datetime
,`c_user_id` int(11)
,`c_user_name` varchar(64)
,`u_time` datetime
,`u_user_id` int(11)
,`u_user_name` varchar(64)
);

-- --------------------------------------------------------

--
-- 資料表結構 `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL COMMENT '使用者編號',
  `account` varchar(128) COLLATE utf8_unicode_ci NOT NULL COMMENT '帳號',
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL COMMENT '密碼，AES-ECB加密',
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '姓名',
  `email` varchar(128) COLLATE utf8_unicode_ci NOT NULL COMMENT '電子郵件',
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '聯絡電話',
  `last_login_time` datetime NOT NULL COMMENT '最後登入時間',
  `last_login_ip` varchar(128) COLLATE utf8_unicode_ci NOT NULL COMMENT '最後登入IP位址',
  `status` tinyint(1) NOT NULL COMMENT '狀態，0：啟用，1：停用，2：已刪除',
  `remark` text COLLATE utf8_unicode_ci NOT NULL COMMENT '備註',
  `c_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立時間',
  `c_user_id` int(11) NOT NULL COMMENT '建立使用者編號',
  `u_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改時間',
  `u_user_id` int(11) NOT NULL COMMENT '修改使用者編號'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `user`
--

INSERT INTO `user` (`id`, `account`, `password`, `name`, `email`, `phone`, `last_login_time`, `last_login_ip`, `status`, `remark`, `c_time`, `c_user_id`, `u_time`, `u_user_id`) VALUES
(1, 'admin@ks', 'KVXTOnThNp7RqzgFRTVyvA==', 'admin', 'vic@ks-design.com.tw', '', '2019-11-19 13:29:31', '::1', 0, '', '2019-03-09 15:55:38', 0, '2019-11-19 13:29:31', 1),
(2, 'web_server', 'f4HEr6Ki2B4+nh5+LCCn+Q==', 'web_server', 'vic@ks-design.com.tw', '02-87716606', '2019-11-19 13:31:35', '::1', 0, '', '2019-07-23 15:44:04', 1, '2019-11-19 13:31:35', 1),
(3, 'vic@ks', '+jg1og867os4dMQD5GQgdQ==', 'vic@ks', 'vic@ks-design.com.tw', '', '2019-11-14 14:02:21', '::1', 0, '', '2019-07-23 15:44:31', 1, '2019-11-14 14:02:21', 1);

-- --------------------------------------------------------

--
-- 替換檢視表以便查看 `user_role_menu_view`
-- (請參考以下實際畫面)
--
CREATE TABLE `user_role_menu_view` (
`user_id` int(11)
,`user_account` varchar(128)
,`user_name` varchar(64)
,`user_status` tinyint(1)
,`id` int(11)
,`parent_id` int(11)
,`name` varchar(64)
,`url` varchar(512)
,`icon` varchar(128)
,`program_ids` text
,`status` tinyint(1)
,`remark` text
,`list_order` int(11)
);

-- --------------------------------------------------------

--
-- 替換檢視表以便查看 `user_role_program_view`
-- (請參考以下實際畫面)
--
CREATE TABLE `user_role_program_view` (
`user_id` int(11)
,`user_account` varchar(128)
,`user_name` varchar(64)
,`user_status` tinyint(1)
,`role_id` int(11)
,`role_name` varchar(64)
,`role_status` tinyint(1)
,`program_id` int(11)
,`program_name` varchar(64)
,`program_status` tinyint(1)
,`program_guid` varchar(36)
,`program_remark` text
,`program_category_id` int(11)
,`program_category_name` varchar(64)
,`program_category_status` tinyint(1)
);

-- --------------------------------------------------------

--
-- 替換檢視表以便查看 `user_view`
-- (請參考以下實際畫面)
--
CREATE TABLE `user_view` (
`id` int(11)
,`account` varchar(128)
,`name` varchar(64)
,`email` varchar(128)
,`phone` varchar(20)
,`last_login_time` datetime
,`last_login_ip` varchar(128)
,`status` tinyint(1)
,`remark` text
,`c_time` datetime
,`c_user_id` int(11)
,`c_user_name` varchar(64)
,`u_time` datetime
,`u_user_id` int(11)
,`u_user_name` varchar(64)
);

-- --------------------------------------------------------

--
-- 檢視表結構 `ad_view`
--
DROP TABLE IF EXISTS `ad_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ad_view`  AS  select `ad`.`id` AS `id`,`ad`.`name` AS `name`,`ad`.`pic_url` AS `pic_url`,`ad`.`pic_alt` AS `pic_alt`,`ad`.`link` AS `link`,`ad`.`list_order` AS `list_order`,`ad`.`status` AS `status`,`ad`.`remark` AS `remark`,`ad`.`c_time` AS `c_time`,`ad`.`c_user_id` AS `c_user_id`,`c_user`.`name` AS `c_user_name`,`ad`.`u_time` AS `u_time`,`ad`.`u_user_id` AS `u_user_id`,`u_user`.`name` AS `u_user_name` from ((`ad` left join `user` `c_user` on((`ad`.`c_user_id` = `c_user`.`id`))) left join `user` `u_user` on((`ad`.`u_user_id` = `u_user`.`id`))) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `banner_view`
--
DROP TABLE IF EXISTS `banner_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `banner_view`  AS  select `banner`.`id` AS `id`,`banner`.`name` AS `name`,`banner`.`pic_url` AS `pic_url`,`banner`.`pic_alt` AS `pic_alt`,`banner`.`link` AS `link`,`banner`.`blank` AS `blank`,`banner`.`list_order` AS `list_order`,`banner`.`status` AS `status`,`banner`.`remark` AS `remark`,`banner`.`c_time` AS `c_time`,`banner`.`c_user_id` AS `c_user_id`,`c_user`.`name` AS `c_user_name`,`banner`.`u_time` AS `u_time`,`banner`.`u_user_id` AS `u_user_id`,`u_user`.`name` AS `u_user_name` from ((`banner` left join `user` `c_user` on((`banner`.`c_user_id` = `c_user`.`id`))) left join `user` `u_user` on((`banner`.`u_user_id` = `u_user`.`id`))) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `brand_view`
--
DROP TABLE IF EXISTS `brand_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `brand_view`  AS  select `brand`.`id` AS `id`,`brand`.`name` AS `name`,`brand`.`pic_url` AS `pic_url`,`brand`.`pic_alt` AS `pic_alt`,`brand`.`list_order` AS `list_order`,`brand`.`status` AS `status`,`brand`.`remark` AS `remark`,`brand`.`c_time` AS `c_time`,`brand`.`c_user_id` AS `c_user_id`,`c_user`.`name` AS `c_user_name`,`brand`.`u_time` AS `u_time`,`brand`.`u_user_id` AS `u_user_id`,`u_user`.`name` AS `u_user_name` from ((`brand` left join `user` `c_user` on((`brand`.`c_user_id` = `c_user`.`id`))) left join `user` `u_user` on((`brand`.`u_user_id` = `u_user`.`id`))) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `campaign_tag_view`
--
DROP TABLE IF EXISTS `campaign_tag_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `campaign_tag_view`  AS  select `campaign_tag`.`id` AS `id`,`campaign_tag`.`name` AS `name`,`campaign_tag`.`color` AS `color`,`campaign_tag`.`list_order` AS `list_order`,`campaign_tag`.`status` AS `status`,`campaign_tag`.`remark` AS `remark`,`campaign_tag`.`c_time` AS `c_time`,`campaign_tag`.`c_user_id` AS `c_user_id`,`c_user`.`name` AS `c_user_name`,`campaign_tag`.`u_time` AS `u_time`,`campaign_tag`.`u_user_id` AS `u_user_id`,`u_user`.`name` AS `u_user_name` from ((`campaign_tag` join `user` `c_user` on((`campaign_tag`.`c_user_id` = `c_user`.`id`))) left join `user` `u_user` on((`campaign_tag`.`u_user_id` = `u_user`.`id`))) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `campaign_view`
--
DROP TABLE IF EXISTS `campaign_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `campaign_view`  AS  select `campaign`.`id` AS `id`,`campaign`.`tag_ids` AS `tag_ids`,group_concat(`s`.`name` separator ',') AS `tag_names`,group_concat(`s`.`color` separator ',') AS `tag_colors`,`campaign`.`title` AS `title`,`campaign`.`sub_title` AS `sub_title`,`campaign`.`content` AS `content`,`campaign`.`pic_url` AS `pic_url`,`campaign`.`pic_alt` AS `pic_alt`,`campaign`.`release_date` AS `release_date`,`campaign`.`list_order` AS `list_order`,`campaign`.`status` AS `status`,`campaign`.`remark` AS `remark`,`campaign`.`c_time` AS `c_time`,`campaign`.`c_user_id` AS `c_user_id`,`c_user`.`name` AS `c_user_name`,`campaign`.`u_time` AS `u_time`,`campaign`.`u_user_id` AS `u_user_id`,`u_user`.`name` AS `u_user_name` from (((`campaign` left join `user` `c_user` on((`campaign`.`c_user_id` = `c_user`.`id`))) left join `user` `u_user` on((`campaign`.`u_user_id` = `u_user`.`id`))) left join `campaign_tag` `s` on(find_in_set(`s`.`id`,`campaign`.`tag_ids`))) group by `campaign`.`id` ;

-- --------------------------------------------------------

--
-- 檢視表結構 `city_area_view`
--
DROP TABLE IF EXISTS `city_area_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `city_area_view`  AS  select `area`.`zipcode` AS `zipcode`,`area`.`city_id` AS `city_id`,`city`.`name` AS `city_name`,`area`.`id` AS `area_id`,`area`.`name` AS `area_name` from (`area` left join `city` on((`area`.`city_id` = `city`.`id`))) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `higi_view`
--
DROP TABLE IF EXISTS `higi_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `higi_view`  AS  select `higi`.`id` AS `id`,`higi`.`name` AS `name`,`higi`.`pic_url` AS `pic_url`,`higi`.`pic_alt` AS `pic_alt`,`higi`.`content` AS `content`,`higi`.`description` AS `description`,`higi`.`recipepro_id` AS `recipepro_id`,`recipepro`.`name` AS `recipepro_name`,`recipepro`.`pic_url` AS `recipepro_pic_url`,`recipepro`.`pic_alt` AS `recipepro_pic_alt`,`recipepro`.`member_only` AS `recipepro_member_only`,`product`.`brand_id` AS `brand_id`,`brand`.`name` AS `brand_name`,`brand`.`pic_url` AS `brand_pic_url`,`brand`.`pic_alt` AS `brand_pic_alt`,`higi`.`product_id` AS `product_id`,`product`.`name` AS `product_name`,`product`.`pic_urls` AS `product_pic_urls`,`product`.`pic_alts` AS `product_pic_alts`,`higi`.`tags` AS `tags`,`higi`.`type` AS `type`,`higi`.`style` AS `style`,`higi`.`methods` AS `methods`,`higi`.`note` AS `note`,`higi`.`note_pic_url` AS `note_pic_url`,`higi`.`note_pic_alt` AS `note_pic_alt`,`higi`.`member_only` AS `member_only`,`higi`.`visitor` AS `visitor`,`higi`.`list_order` AS `list_order`,`higi`.`status` AS `status`,`higi`.`remark` AS `remark`,`higi`.`c_time` AS `c_time`,`higi`.`c_user_id` AS `c_user_id`,`c_user`.`name` AS `c_user_name`,`higi`.`u_time` AS `u_time`,`higi`.`u_user_id` AS `u_user_id`,`u_user`.`name` AS `u_user_name` from (((((`higi` left join `recipepro` on((`higi`.`recipepro_id` = `recipepro`.`id`))) left join `product` on((`higi`.`product_id` = `product`.`id`))) left join `brand` on((`product`.`brand_id` = `brand`.`id`))) left join `user` `c_user` on((`higi`.`c_user_id` = `c_user`.`id`))) left join `user` `u_user` on((`higi`.`u_user_id` = `u_user`.`id`))) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `log_view`
--
DROP TABLE IF EXISTS `log_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `log_view`  AS  select `log`.`id` AS `id`,`log`.`user_id` AS `user_id`,`user`.`account` AS `user_account`,`user`.`name` AS `user_name`,`log`.`ip` AS `ip`,`log`.`program_id` AS `program_id`,`program`.`name` AS `program_name`,`log`.`verb` AS `verb`,`log`.`args` AS `args`,`log`.`file` AS `file`,`log`.`resultCode` AS `resultCode`,`log`.`resultMessage` AS `resultMessage`,`log`.`resultData` AS `resultData`,`log`.`c_time` AS `c_time` from ((`log` left join `user` on((`log`.`user_id` = `user`.`id`))) left join `program` on((`log`.`program_id` = `program`.`id`))) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `member_higi_view`
--
DROP TABLE IF EXISTS `member_higi_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `member_higi_view`  AS  select `member`.`id` AS `member_id`,`member`.`account` AS `member_account`,`member`.`name` AS `member_name`,`member`.`status` AS `member_status`,`higi_view`.`id` AS `id`,`higi_view`.`name` AS `name`,`higi_view`.`pic_url` AS `pic_url`,`higi_view`.`pic_alt` AS `pic_alt`,`higi_view`.`content` AS `content`,`higi_view`.`description` AS `description`,`higi_view`.`recipepro_id` AS `recipepro_id`,`higi_view`.`recipepro_name` AS `recipepro_name`,`higi_view`.`recipepro_pic_url` AS `recipepro_pic_url`,`higi_view`.`recipepro_pic_alt` AS `recipepro_pic_alt`,`higi_view`.`recipepro_member_only` AS `recipepro_member_only`,`higi_view`.`brand_id` AS `brand_id`,`higi_view`.`brand_name` AS `brand_name`,`higi_view`.`brand_pic_url` AS `brand_pic_url`,`higi_view`.`brand_pic_alt` AS `brand_pic_alt`,`higi_view`.`product_id` AS `product_id`,`higi_view`.`product_name` AS `product_name`,`higi_view`.`product_pic_urls` AS `product_pic_urls`,`higi_view`.`product_pic_alts` AS `product_pic_alts`,`higi_view`.`tags` AS `tags`,`higi_view`.`type` AS `type`,`higi_view`.`style` AS `style`,`higi_view`.`methods` AS `methods`,`higi_view`.`note` AS `note`,`higi_view`.`note_pic_url` AS `note_pic_url`,`higi_view`.`note_pic_alt` AS `note_pic_alt`,`higi_view`.`member_only` AS `member_only`,`higi_view`.`visitor` AS `visitor`,`higi_view`.`list_order` AS `list_order`,`higi_view`.`status` AS `status`,`higi_view`.`remark` AS `remark`,`higi_view`.`c_time` AS `c_time`,`higi_view`.`c_user_id` AS `c_user_id`,`higi_view`.`c_user_name` AS `c_user_name`,`higi_view`.`u_time` AS `u_time`,`higi_view`.`u_user_id` AS `u_user_id`,`higi_view`.`u_user_name` AS `u_user_name` from ((`member` join `member_higi` on((`member`.`id` = `member_higi`.`member_id`))) join `higi_view` on((`member_higi`.`higi_id` = `higi_view`.`id`))) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `member_recipepro_view`
--
DROP TABLE IF EXISTS `member_recipepro_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `member_recipepro_view`  AS  select `member`.`id` AS `member_id`,`member`.`account` AS `member_account`,`member`.`name` AS `member_name`,`member`.`status` AS `member_status`,`recipepro_view`.`id` AS `id`,`recipepro_view`.`name` AS `name`,`recipepro_view`.`pic_url` AS `pic_url`,`recipepro_view`.`pic_alt` AS `pic_alt`,`recipepro_view`.`feature` AS `feature`,`recipepro_view`.`tags` AS `tags`,`recipepro_view`.`price` AS `price`,`recipepro_view`.`type` AS `type`,`recipepro_view`.`style` AS `style`,`recipepro_view`.`product_ids` AS `product_ids`,`recipepro_view`.`material_weight` AS `material_weight`,`recipepro_view`.`product_names` AS `product_names`,`recipepro_view`.`nutrition` AS `nutrition`,`recipepro_view`.`member_only` AS `member_only`,`recipepro_view`.`visitor` AS `visitor`,`recipepro_view`.`list_order` AS `list_order`,`recipepro_view`.`status` AS `status`,`recipepro_view`.`remark` AS `remark`,`recipepro_view`.`c_time` AS `c_time`,`recipepro_view`.`c_user_id` AS `c_user_id`,`recipepro_view`.`c_user_name` AS `c_user_name`,`recipepro_view`.`u_time` AS `u_time`,`recipepro_view`.`u_user_id` AS `u_user_id`,`recipepro_view`.`u_user_name` AS `u_user_name` from ((`member` join `member_recipepro` on((`member`.`id` = `member_recipepro`.`member_id`))) join `recipepro_view` on((`member_recipepro`.`recipepro_id` = `recipepro_view`.`id`))) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `member_view`
--
DROP TABLE IF EXISTS `member_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `member_view`  AS  select `member`.`id` AS `id`,`member`.`account` AS `account`,`member`.`verification` AS `verification`,`member`.`name` AS `name`,`member`.`gender` AS `gender`,`member`.`birthday` AS `birthday`,`member`.`phone` AS `phone`,`member`.`restaurant_name` AS `restaurant_name`,`area`.`zipcode` AS `restaurant_zipcode`,`area`.`city_id` AS `restaurant_city_id`,`city`.`name` AS `restaurant_city_name`,`member`.`restaurant_area_id` AS `restaurant_area_id`,`area`.`name` AS `restaurant_area_name`,`member`.`restaurant_type` AS `restaurant_type`,`member`.`last_login_time` AS `last_login_time`,`member`.`last_login_ip` AS `last_login_ip`,`member`.`status` AS `status`,`member`.`remark` AS `remark`,`member`.`c_time` AS `c_time`,`member`.`c_user_id` AS `c_user_id`,`c_user`.`name` AS `c_user_name`,`member`.`u_time` AS `u_time`,`member`.`u_user_id` AS `u_user_id`,`u_user`.`name` AS `u_user_name` from ((((`member` left join `area` on((`member`.`restaurant_area_id` = `area`.`id`))) left join `city` on((`area`.`city_id` = `city`.`id`))) left join `user` `c_user` on((`member`.`c_user_id` = `c_user`.`id`))) left join `user` `u_user` on((`member`.`u_user_id` = `u_user`.`id`))) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `menu_view`
--
DROP TABLE IF EXISTS `menu_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `menu_view`  AS  select `menu`.`id` AS `id`,`menu`.`parent_id` AS `parent_id`,`parent_menu`.`name` AS `parent_name`,`menu`.`name` AS `name`,`menu`.`url` AS `url`,`menu`.`icon` AS `icon`,`menu`.`program_ids` AS `program_ids`,`menu`.`list_order` AS `list_order`,`menu`.`status` AS `status`,`menu`.`remark` AS `remark`,`menu`.`c_time` AS `c_time`,`menu`.`c_user_id` AS `c_user_id`,`c_user`.`name` AS `c_user_name`,`menu`.`u_time` AS `u_time`,`menu`.`u_user_id` AS `u_user_id`,`u_user`.`name` AS `u_user_name` from (((`menu` left join `menu` `parent_menu` on((`menu`.`parent_id` = `parent_menu`.`id`))) left join `user` `c_user` on((`menu`.`c_user_id` = `c_user`.`id`))) left join `user` `u_user` on((`menu`.`u_user_id` = `u_user`.`id`))) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `product_view`
--
DROP TABLE IF EXISTS `product_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `product_view`  AS  select `product`.`id` AS `id`,`product`.`brand_id` AS `brand_id`,`brand`.`name` AS `brand_name`,`brand`.`pic_url` AS `brand_pic_url`,`brand`.`pic_alt` AS `brand_pic_alt`,`product`.`name` AS `name`,`product`.`pic_urls` AS `pic_urls`,`product`.`pic_alts` AS `pic_alts`,`product`.`tag` AS `tag`,`product`.`content` AS `content`,`product`.`tips` AS `tips`,`product`.`information` AS `information`,`product`.`mark` AS `mark`,`product`.`list_order` AS `list_order`,`product`.`status` AS `status`,`product`.`remark` AS `remark`,`product`.`c_time` AS `c_time`,`product`.`c_user_id` AS `c_user_id`,`c_user`.`name` AS `c_user_name`,`product`.`u_time` AS `u_time`,`product`.`u_user_id` AS `u_user_id`,`u_user`.`name` AS `u_user_name` from (((`product` left join `brand` on((`product`.`brand_id` = `brand`.`id`))) left join `user` `c_user` on((`product`.`c_user_id` = `c_user`.`id`))) left join `user` `u_user` on((`product`.`u_user_id` = `u_user`.`id`))) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `program_category_view`
--
DROP TABLE IF EXISTS `program_category_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `program_category_view`  AS  select `program_category`.`id` AS `id`,`program_category`.`name` AS `name`,`program_category`.`status` AS `status`,`program_category`.`remark` AS `remark`,`program_category`.`c_time` AS `c_time`,`program_category`.`c_user_id` AS `c_user_id`,`c_user`.`name` AS `c_user_name`,`program_category`.`u_time` AS `u_time`,`program_category`.`u_user_id` AS `u_user_id`,`u_user`.`name` AS `u_user_name` from ((`program_category` left join `user` `c_user` on((`program_category`.`c_user_id` = `c_user`.`id`))) left join `user` `u_user` on((`program_category`.`u_user_id` = `u_user`.`id`))) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `program_view`
--
DROP TABLE IF EXISTS `program_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `program_view`  AS  select `program`.`id` AS `id`,`program`.`category_id` AS `category_id`,`program_category`.`name` AS `category_name`,`program`.`name` AS `name`,`program`.`guid` AS `guid`,`program`.`status` AS `status`,`program`.`remark` AS `remark`,`program`.`c_time` AS `c_time`,`program`.`c_user_id` AS `c_user_id`,`c_user`.`name` AS `c_user_name`,`program`.`u_time` AS `u_time`,`program`.`u_user_id` AS `u_user_id`,`u_user`.`name` AS `u_user_name` from (((`program` left join `program_category` on((`program`.`category_id` = `program_category`.`id`))) left join `user` `c_user` on((`program`.`c_user_id` = `c_user`.`id`))) left join `user` `u_user` on((`program`.`u_user_id` = `u_user`.`id`))) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `recipepro_view`
--
DROP TABLE IF EXISTS `recipepro_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `recipepro_view`  AS  select `recipepro`.`id` AS `id`,`recipepro`.`name` AS `name`,`recipepro`.`pic_url` AS `pic_url`,`recipepro`.`pic_alt` AS `pic_alt`,`recipepro`.`feature` AS `feature`,`recipepro`.`tags` AS `tags`,`recipepro`.`price` AS `price`,`recipepro`.`type` AS `type`,`recipepro`.`style` AS `style`,`recipepro`.`product_ids` AS `product_ids`,`recipepro`.`material_weight` AS `material_weight`,group_concat(`s`.`name` separator ',') AS `product_names`,`recipepro`.`nutrition` AS `nutrition`,`recipepro`.`member_only` AS `member_only`,`recipepro`.`visitor` AS `visitor`,`recipepro`.`list_order` AS `list_order`,`recipepro`.`status` AS `status`,`recipepro`.`remark` AS `remark`,`recipepro`.`c_time` AS `c_time`,`recipepro`.`c_user_id` AS `c_user_id`,`c_user`.`name` AS `c_user_name`,`recipepro`.`u_time` AS `u_time`,`recipepro`.`u_user_id` AS `u_user_id`,`u_user`.`name` AS `u_user_name` from (((`recipepro` left join `user` `c_user` on((`recipepro`.`c_user_id` = `c_user`.`id`))) left join `user` `u_user` on((`recipepro`.`u_user_id` = `u_user`.`id`))) left join `product` `s` on(find_in_set(`s`.`id`,`recipepro`.`product_ids`))) group by `recipepro`.`id` ;

-- --------------------------------------------------------

--
-- 檢視表結構 `role_menu_view`
--
DROP TABLE IF EXISTS `role_menu_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `role_menu_view`  AS  select `role`.`id` AS `role_id`,`role`.`name` AS `role_name`,`role`.`status` AS `role_status`,`menu_view`.`id` AS `id`,`menu_view`.`parent_id` AS `parent_id`,`menu_view`.`parent_name` AS `parent_name`,`menu_view`.`name` AS `name`,`menu_view`.`url` AS `url`,`menu_view`.`icon` AS `icon`,`menu_view`.`program_ids` AS `program_ids`,`menu_view`.`list_order` AS `list_order`,`menu_view`.`status` AS `status`,`menu_view`.`remark` AS `remark`,`menu_view`.`c_time` AS `c_time`,`menu_view`.`c_user_id` AS `c_user_id`,`menu_view`.`c_user_name` AS `c_user_name`,`menu_view`.`u_time` AS `u_time`,`menu_view`.`u_user_id` AS `u_user_id`,`menu_view`.`u_user_name` AS `u_user_name` from ((`role` left join `role_menu` on((`role`.`id` = `role_menu`.`role_id`))) join `menu_view` on((`role_menu`.`menu_id` = `menu_view`.`id`))) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `role_program_view`
--
DROP TABLE IF EXISTS `role_program_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `role_program_view`  AS  select `role`.`id` AS `role_id`,`role`.`name` AS `role_name`,`role`.`status` AS `role_status`,`program_view`.`id` AS `id`,`program_view`.`category_id` AS `category_id`,`program_view`.`category_name` AS `category_name`,`program_view`.`name` AS `name`,`program_view`.`guid` AS `guid`,`program_view`.`status` AS `status`,`program_view`.`remark` AS `remark`,`program_view`.`c_time` AS `c_time`,`program_view`.`c_user_id` AS `c_user_id`,`program_view`.`c_user_name` AS `c_user_name`,`program_view`.`u_time` AS `u_time`,`program_view`.`u_user_id` AS `u_user_id`,`program_view`.`u_user_name` AS `u_user_name` from ((`role` left join `role_program` on((`role`.`id` = `role_program`.`role_id`))) join `program_view` on((`role_program`.`program_id` = `program_view`.`id`))) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `role_view`
--
DROP TABLE IF EXISTS `role_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `role_view`  AS  select `role`.`id` AS `id`,`role`.`name` AS `name`,`role`.`status` AS `status`,`role`.`remark` AS `remark`,`role`.`c_time` AS `c_time`,`role`.`c_user_id` AS `c_user_id`,`c_user`.`name` AS `c_user_name`,`role`.`u_time` AS `u_time`,`role`.`u_user_id` AS `u_user_id`,`u_user`.`name` AS `u_user_name` from ((`role` left join `user` `c_user` on((`role`.`c_user_id` = `c_user`.`id`))) left join `user` `u_user` on((`role`.`u_user_id` = `u_user`.`id`))) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `tag_category_view`
--
DROP TABLE IF EXISTS `tag_category_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tag_category_view`  AS  select `tag_category`.`id` AS `id`,`tag_category`.`name` AS `name`,`tag_category`.`list_order` AS `list_order`,`tag_category`.`status` AS `status`,`tag_category`.`remark` AS `remark`,`tag_category`.`c_time` AS `c_time`,`tag_category`.`c_user_id` AS `c_user_id`,`c_user`.`name` AS `c_user_name`,`tag_category`.`u_time` AS `u_time`,`tag_category`.`u_user_id` AS `u_user_id`,`u_user`.`name` AS `u_user_name` from ((`tag_category` left join `user` `c_user` on((`tag_category`.`c_user_id` = `c_user`.`id`))) left join `user` `u_user` on((`tag_category`.`u_user_id` = `u_user`.`id`))) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `tag_view`
--
DROP TABLE IF EXISTS `tag_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tag_view`  AS  select `tag`.`id` AS `id`,`tag`.`category_id` AS `category_id`,`tag_category`.`name` AS `category_name`,`tag`.`name` AS `name`,`tag`.`list_order` AS `list_order`,`tag`.`status` AS `status`,`tag`.`remark` AS `remark`,`tag`.`c_time` AS `c_time`,`tag`.`c_user_id` AS `c_user_id`,`c_user`.`name` AS `c_user_name`,`tag`.`u_time` AS `u_time`,`tag`.`u_user_id` AS `u_user_id`,`u_user`.`name` AS `u_user_name` from (((`tag` left join `tag_category` on((`tag`.`category_id` = `tag_category`.`id`))) left join `user` `c_user` on((`tag`.`c_user_id` = `c_user`.`id`))) left join `user` `u_user` on((`tag`.`u_user_id` = `u_user`.`id`))) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `user_role_menu_view`
--
DROP TABLE IF EXISTS `user_role_menu_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `user_role_menu_view`  AS  select `user`.`id` AS `user_id`,`user`.`account` AS `user_account`,`user`.`name` AS `user_name`,`user`.`status` AS `user_status`,`menu`.`id` AS `id`,`menu`.`parent_id` AS `parent_id`,`menu`.`name` AS `name`,`menu`.`url` AS `url`,`menu`.`icon` AS `icon`,`menu`.`program_ids` AS `program_ids`,`menu`.`status` AS `status`,`menu`.`remark` AS `remark`,`menu`.`list_order` AS `list_order` from ((((`user` left join `role_user` on((`user`.`id` = `role_user`.`user_id`))) left join `role` on((`role_user`.`role_id` = `role`.`id`))) left join `role_menu` on((`role`.`id` = `role_menu`.`role_id`))) left join `menu` on((`role_menu`.`menu_id` = `menu`.`id`))) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `user_role_program_view`
--
DROP TABLE IF EXISTS `user_role_program_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `user_role_program_view`  AS  select `user`.`id` AS `user_id`,`user`.`account` AS `user_account`,`user`.`name` AS `user_name`,`user`.`status` AS `user_status`,`role`.`id` AS `role_id`,`role`.`name` AS `role_name`,`role`.`status` AS `role_status`,`program`.`id` AS `program_id`,`program`.`name` AS `program_name`,`program`.`status` AS `program_status`,`program`.`guid` AS `program_guid`,`program_category`.`remark` AS `program_remark`,`program_category`.`id` AS `program_category_id`,`program_category`.`name` AS `program_category_name`,`program_category`.`status` AS `program_category_status` from (((((`user` left join `role_user` on((`user`.`id` = `role_user`.`user_id`))) left join `role` on((`role_user`.`role_id` = `role`.`id`))) left join `role_program` on((`role`.`id` = `role_program`.`role_id`))) left join `program` on((`role_program`.`program_id` = `program`.`id`))) join `program_category` on((`program`.`category_id` = `program_category`.`id`))) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `user_view`
--
DROP TABLE IF EXISTS `user_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `user_view`  AS  select `user`.`id` AS `id`,`user`.`account` AS `account`,`user`.`name` AS `name`,`user`.`email` AS `email`,`user`.`phone` AS `phone`,`user`.`last_login_time` AS `last_login_time`,`user`.`last_login_ip` AS `last_login_ip`,`user`.`status` AS `status`,`user`.`remark` AS `remark`,`user`.`c_time` AS `c_time`,`user`.`c_user_id` AS `c_user_id`,`c_user`.`name` AS `c_user_name`,`user`.`u_time` AS `u_time`,`user`.`u_user_id` AS `u_user_id`,`u_user`.`name` AS `u_user_name` from ((`user` left join `user` `c_user` on((`user`.`c_user_id` = `c_user`.`id`))) left join `user` `u_user` on((`user`.`u_user_id` = `u_user`.`id`))) ;

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `ad`
--
ALTER TABLE `ad`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `campaign`
--
ALTER TABLE `campaign`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `campaign_tag`
--
ALTER TABLE `campaign_tag`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `higi`
--
ALTER TABLE `higi`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `member_higi`
--
ALTER TABLE `member_higi`
  ADD PRIMARY KEY (`member_id`,`higi_id`);

--
-- 資料表索引 `member_recipepro`
--
ALTER TABLE `member_recipepro`
  ADD PRIMARY KEY (`member_id`,`recipepro_id`);

--
-- 資料表索引 `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `program`
--
ALTER TABLE `program`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `program_category`
--
ALTER TABLE `program_category`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `recipepro`
--
ALTER TABLE `recipepro`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `role_menu`
--
ALTER TABLE `role_menu`
  ADD PRIMARY KEY (`role_id`,`menu_id`);

--
-- 資料表索引 `role_program`
--
ALTER TABLE `role_program`
  ADD PRIMARY KEY (`role_id`,`program_id`);

--
-- 資料表索引 `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`role_id`,`user_id`);

--
-- 資料表索引 `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `tag_category`
--
ALTER TABLE `tag_category`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- 在傾印的資料表使用自動增長(AUTO_INCREMENT)
--

--
-- 使用資料表自動增長(AUTO_INCREMENT) `ad`
--
ALTER TABLE `ad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '廣告編號', AUTO_INCREMENT=5;

--
-- 使用資料表自動增長(AUTO_INCREMENT) `area`
--
ALTER TABLE `area`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '鄉鎮市區編號', AUTO_INCREMENT=369;

--
-- 使用資料表自動增長(AUTO_INCREMENT) `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Banner編號', AUTO_INCREMENT=5;

--
-- 使用資料表自動增長(AUTO_INCREMENT) `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '品牌編號', AUTO_INCREMENT=6;

--
-- 使用資料表自動增長(AUTO_INCREMENT) `campaign`
--
ALTER TABLE `campaign`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '餐飲情報編號', AUTO_INCREMENT=7;

--
-- 使用資料表自動增長(AUTO_INCREMENT) `campaign_tag`
--
ALTER TABLE `campaign_tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '餐飲情報標籤編號', AUTO_INCREMENT=6;

--
-- 使用資料表自動增長(AUTO_INCREMENT) `city`
--
ALTER TABLE `city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '縣市編號', AUTO_INCREMENT=23;

--
-- 使用資料表自動增長(AUTO_INCREMENT) `higi`
--
ALTER TABLE `higi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '招客秘技編號', AUTO_INCREMENT=33;

--
-- 使用資料表自動增長(AUTO_INCREMENT) `log`
--
ALTER TABLE `log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '操作記錄編號', AUTO_INCREMENT=90;

--
-- 使用資料表自動增長(AUTO_INCREMENT) `member`
--
ALTER TABLE `member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '會員編號', AUTO_INCREMENT=3;

--
-- 使用資料表自動增長(AUTO_INCREMENT) `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '選單編號', AUTO_INCREMENT=21;

--
-- 使用資料表自動增長(AUTO_INCREMENT) `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品編號', AUTO_INCREMENT=20;

--
-- 使用資料表自動增長(AUTO_INCREMENT) `program`
--
ALTER TABLE `program`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '程式編號', AUTO_INCREMENT=97;

--
-- 使用資料表自動增長(AUTO_INCREMENT) `program_category`
--
ALTER TABLE `program_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '程式類別編號', AUTO_INCREMENT=20;

--
-- 使用資料表自動增長(AUTO_INCREMENT) `recipepro`
--
ALTER TABLE `recipepro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '專業食譜編號', AUTO_INCREMENT=12;

--
-- 使用資料表自動增長(AUTO_INCREMENT) `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色編號', AUTO_INCREMENT=2;

--
-- 使用資料表自動增長(AUTO_INCREMENT) `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '標籤編號', AUTO_INCREMENT=35;

--
-- 使用資料表自動增長(AUTO_INCREMENT) `tag_category`
--
ALTER TABLE `tag_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '標籤類別編號', AUTO_INCREMENT=5;

--
-- 使用資料表自動增長(AUTO_INCREMENT) `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '使用者編號', AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
