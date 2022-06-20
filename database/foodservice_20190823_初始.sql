-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- 主機: 127.0.0.1
-- 產生時間： 2019-08-23 08:32:36
-- 伺服器版本: 10.1.37-MariaDB
-- PHP 版本： 7.3.1

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
-- 資料表的匯出資料 `area`
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

-- --------------------------------------------------------

--
-- 資料表結構 `campaign_tag`
--

CREATE TABLE `campaign_tag` (
  `id` int(11) NOT NULL COMMENT '餐飲情報標籤編號',
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '餐飲情報標籤名稱',
  `list_order` int(11) NOT NULL COMMENT '列表順序',
  `status` tinyint(1) NOT NULL COMMENT '狀態，0：啟用，1：停用，2：已刪除',
  `remark` text COLLATE utf8_unicode_ci NOT NULL COMMENT '備註',
  `c_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立時間',
  `c_user_id` int(11) NOT NULL COMMENT '建立使用者編號',
  `u_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改時間',
  `u_user_id` int(11) NOT NULL COMMENT '修改使用者編號'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 替換檢視表以便查看 `campaign_tag_view`
-- (請參考以下實際畫面)
--
CREATE TABLE `campaign_tag_view` (
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
-- 替換檢視表以便查看 `campaign_view`
-- (請參考以下實際畫面)
--
CREATE TABLE `campaign_view` (
`id` int(11)
,`tag_ids` text
,`tag_names` text
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
-- 資料表的匯出資料 `city`
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
  `recipepro_id` int(11) NOT NULL COMMENT '專業食譜編號',
  `product_id` int(11) NOT NULL COMMENT '商品編號',
  `methods` text COLLATE utf8_unicode_ci NOT NULL COMMENT '烹調方式，以逗號分隔',
  `note` text COLLATE utf8_unicode_ci NOT NULL COMMENT '小筆記',
  `member_only` tinyint(1) NOT NULL COMMENT '會員限定',
  `list_order` int(11) NOT NULL COMMENT '列表順序',
  `status` tinyint(1) NOT NULL COMMENT '狀態，0：啟用，1：停用，2：已刪除',
  `remark` text COLLATE utf8_unicode_ci NOT NULL COMMENT '備註',
  `c_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立時間',
  `c_user_id` int(11) NOT NULL COMMENT '建立使者編號',
  `u_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改時間',
  `u_user_id` int(11) NOT NULL COMMENT '修改使用者編號'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
,`recipepro_id` int(11)
,`recipepro_name` varchar(64)
,`recipepro_pic_url` text
,`recipepro_pic_alt` varchar(64)
,`brand_id` int(11)
,`brand_name` varchar(64)
,`brand_pic_url` text
,`brand_pic_alt` varchar(64)
,`product_id` int(11)
,`product_name` varchar(64)
,`product_pic_urls` text
,`product_pic_alts` varchar(64)
,`methods` text
,`note` text
,`member_only` tinyint(1)
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

-- --------------------------------------------------------

--
-- 資料表結構 `login_member`
--

CREATE TABLE `login_member` (
  `member_id` int(11) NOT NULL COMMENT '會員編號',
  `token` varchar(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '存取權杖',
  `login_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '登入時間'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
-- 資料表的匯出資料 `login_user`
--

INSERT INTO `login_user` (`user_id`, `token`, `login_time`) VALUES
(1, '556BEFA0-70B6-9FC2-076D-4735BC3BA178', '2019-08-23 14:29:52');

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
  `birthday` date NOT NULL COMMENT '生日',
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '聯絡電話',
  `restaurant_name` varchar(512) COLLATE utf8_unicode_ci NOT NULL COMMENT '餐廳名稱',
  `restaurant_area_id` int(11) NOT NULL COMMENT '餐廳區域編號',
  `restaurant_type` text COLLATE utf8_unicode_ci NOT NULL COMMENT '經營型態',
  `last_login_time` datetime NOT NULL COMMENT '最後登入時間',
  `last_login_ip` varchar(128) COLLATE utf8_unicode_ci NOT NULL COMMENT '最後登入IP位址',
  `status` int(11) NOT NULL COMMENT '狀態，0：啟用，1：尚未驗證，2：停用，3：已刪除',
  `remark` text COLLATE utf8_unicode_ci NOT NULL COMMENT '備註',
  `c_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立時間',
  `c_user_id` int(11) NOT NULL COMMENT '建立使用者編號',
  `u_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改時間',
  `u_user_id` int(11) NOT NULL COMMENT '修改使用者編號'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `member_higi`
--

CREATE TABLE `member_higi` (
  `member_id` int(11) NOT NULL COMMENT '會員編號',
  `higi_id` int(11) NOT NULL COMMENT '招客秘技編號'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
,`recipepro_id` int(11)
,`recipepro_name` varchar(64)
,`recipepro_pic_url` text
,`recipepro_pic_alt` varchar(64)
,`brand_id` int(11)
,`brand_name` varchar(64)
,`brand_pic_url` text
,`brand_pic_alt` varchar(64)
,`product_id` int(11)
,`product_name` varchar(64)
,`product_pic_urls` text
,`product_pic_alts` varchar(64)
,`methods` text
,`note` text
,`member_only` tinyint(1)
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
,`price` varchar(512)
,`type` varchar(512)
,`style` varchar(512)
,`season` varchar(512)
,`product_ids` text
,`nutrition` text
,`member_only` tinyint(1)
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
-- 資料表的匯出資料 `menu`
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
(18, 0, '招客秘技', 'higi_list.php', 'far fa-lightbulb', '76,77,78,79', 700, 0, '', '2019-08-14 10:23:10', 0, '2019-08-23 14:22:43', 0),
(19, 0, '會員', 'member_list.php', 'fas fa-users', '80,81,82,83,84,85,86', 800, 0, '', '2019-08-14 10:23:26', 0, '2019-08-23 14:22:53', 0);

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
-- 資料表的匯出資料 `program`
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
(86, 17, '刪除會員', '3A5DF0BA-5977-2D2F-5EAF-68B7543B98AF', 0, '', '2019-08-20 16:55:24', 1, '2019-08-20 16:55:24', 1);

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
-- 資料表的匯出資料 `program_category`
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
(17, '會員', 0, '', '2019-08-20 16:52:59', 1, '2019-08-20 16:52:59', 1);

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
  `price` varchar(512) COLLATE utf8_unicode_ci NOT NULL COMMENT '參考價格',
  `type` varchar(512) COLLATE utf8_unicode_ci NOT NULL COMMENT '菜色類型',
  `style` varchar(512) COLLATE utf8_unicode_ci NOT NULL COMMENT '菜式類型',
  `season` varchar(512) COLLATE utf8_unicode_ci NOT NULL COMMENT '季節',
  `product_ids` text COLLATE utf8_unicode_ci NOT NULL COMMENT '使用商品編號，以逗號分隔',
  `nutrition` text COLLATE utf8_unicode_ci NOT NULL COMMENT '營養成份',
  `member_only` tinyint(1) NOT NULL COMMENT '會員限定',
  `list_order` int(11) NOT NULL COMMENT '列表順序',
  `status` tinyint(1) NOT NULL COMMENT '狀態，0：啟用，1：停用，2：已刪除',
  `remark` text COLLATE utf8_unicode_ci NOT NULL COMMENT '備註',
  `c_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立時間',
  `c_user_id` int(11) NOT NULL COMMENT '建立使者編號',
  `u_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改時間',
  `u_user_id` int(11) NOT NULL COMMENT '修改使用者編號'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `recipepro_detail`
--

CREATE TABLE `recipepro_detail` (
  `recipepro_id` int(11) NOT NULL COMMENT '專業食譜編號',
  `class` tinyint(4) NOT NULL COMMENT '類別，1：材料，2：料理步驟',
  `names` varchar(256) COLLATE utf8_unicode_ci NOT NULL COMMENT '名稱，以逗號分隔',
  `contents` varchar(256) COLLATE utf8_unicode_ci NOT NULL COMMENT '內容，以逗號分隔',
  `list_order` int(11) NOT NULL COMMENT '列表順序'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
,`price` varchar(512)
,`type` varchar(512)
,`style` varchar(512)
,`season` varchar(512)
,`product_ids` text
,`nutrition` text
,`member_only` tinyint(1)
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
-- 資料表的匯出資料 `role`
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
-- 資料表的匯出資料 `role_menu`
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
(1, 19);

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
-- 資料表的匯出資料 `role_program`
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
(1, 86);

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
-- 資料表的匯出資料 `role_user`
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
-- 資料表的匯出資料 `user`
--

INSERT INTO `user` (`id`, `account`, `password`, `name`, `email`, `phone`, `last_login_time`, `last_login_ip`, `status`, `remark`, `c_time`, `c_user_id`, `u_time`, `u_user_id`) VALUES
(1, 'admin@ks', 'KVXTOnThNp7RqzgFRTVyvA==', 'admin', 'vic@ks-design.com.tw', '', '2019-08-23 14:29:52', '210.61.165.238', 0, '', '2019-03-09 15:55:38', 0, '2019-08-23 14:29:52', 1),
(2, 'web_server', 'f4HEr6Ki2B4+nh5+LCCn+Q==', 'web_server', 'vic@ks-design.com.tw', '02-87716606', '2019-08-20 18:31:47', '::1', 0, '', '2019-07-23 15:44:04', 1, '2019-08-20 18:31:47', 1),
(3, 'vic@ks', '+jg1og867os4dMQD5GQgdQ==', 'vic@ks', 'vic@ks-design.com.tw', '', '2019-07-23 15:49:49', '::1', 0, '', '2019-07-23 15:44:31', 1, '2019-08-20 17:04:12', 1);

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

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `campaign_tag_view`  AS  select `campaign_tag`.`id` AS `id`,`campaign_tag`.`name` AS `name`,`campaign_tag`.`list_order` AS `list_order`,`campaign_tag`.`status` AS `status`,`campaign_tag`.`remark` AS `remark`,`campaign_tag`.`c_time` AS `c_time`,`campaign_tag`.`c_user_id` AS `c_user_id`,`c_user`.`name` AS `c_user_name`,`campaign_tag`.`u_time` AS `u_time`,`campaign_tag`.`u_user_id` AS `u_user_id`,`u_user`.`name` AS `u_user_name` from ((`campaign_tag` join `user` `c_user` on((`campaign_tag`.`c_user_id` = `c_user`.`id`))) left join `user` `u_user` on((`campaign_tag`.`u_user_id` = `u_user`.`id`))) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `campaign_view`
--
DROP TABLE IF EXISTS `campaign_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `campaign_view`  AS  select `campaign`.`id` AS `id`,`campaign`.`tag_ids` AS `tag_ids`,group_concat(`s`.`name` separator ',') AS `tag_names`,`campaign`.`title` AS `title`,`campaign`.`sub_title` AS `sub_title`,`campaign`.`content` AS `content`,`campaign`.`pic_url` AS `pic_url`,`campaign`.`pic_alt` AS `pic_alt`,`campaign`.`release_date` AS `release_date`,`campaign`.`list_order` AS `list_order`,`campaign`.`status` AS `status`,`campaign`.`remark` AS `remark`,`campaign`.`c_time` AS `c_time`,`campaign`.`c_user_id` AS `c_user_id`,`c_user`.`name` AS `c_user_name`,`campaign`.`u_time` AS `u_time`,`campaign`.`u_user_id` AS `u_user_id`,`u_user`.`name` AS `u_user_name` from (((`campaign` left join `user` `c_user` on((`campaign`.`c_user_id` = `c_user`.`id`))) left join `user` `u_user` on((`campaign`.`u_user_id` = `u_user`.`id`))) left join `campaign_tag` `s` on(find_in_set(`s`.`id`,`campaign`.`tag_ids`))) group by `campaign`.`id` ;

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

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `higi_view`  AS  select `higi`.`id` AS `id`,`higi`.`name` AS `name`,`higi`.`pic_url` AS `pic_url`,`higi`.`pic_alt` AS `pic_alt`,`higi`.`recipepro_id` AS `recipepro_id`,`recipepro`.`name` AS `recipepro_name`,`recipepro`.`pic_url` AS `recipepro_pic_url`,`recipepro`.`pic_alt` AS `recipepro_pic_alt`,`product`.`brand_id` AS `brand_id`,`brand`.`name` AS `brand_name`,`brand`.`pic_url` AS `brand_pic_url`,`brand`.`pic_alt` AS `brand_pic_alt`,`higi`.`product_id` AS `product_id`,`product`.`name` AS `product_name`,`product`.`pic_urls` AS `product_pic_urls`,`product`.`pic_alts` AS `product_pic_alts`,`higi`.`methods` AS `methods`,`higi`.`note` AS `note`,`higi`.`member_only` AS `member_only`,`higi`.`list_order` AS `list_order`,`higi`.`status` AS `status`,`higi`.`remark` AS `remark`,`higi`.`c_time` AS `c_time`,`higi`.`c_user_id` AS `c_user_id`,`c_user`.`name` AS `c_user_name`,`higi`.`u_time` AS `u_time`,`higi`.`u_user_id` AS `u_user_id`,`u_user`.`name` AS `u_user_name` from (((((`higi` left join `recipepro` on((`higi`.`recipepro_id` = `recipepro`.`id`))) left join `product` on((`higi`.`product_id` = `product`.`id`))) left join `brand` on((`product`.`brand_id` = `brand`.`id`))) left join `user` `c_user` on((`higi`.`c_user_id` = `c_user`.`id`))) left join `user` `u_user` on((`higi`.`u_user_id` = `u_user`.`id`))) ;

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

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `member_higi_view`  AS  select `member`.`id` AS `member_id`,`member`.`account` AS `member_account`,`member`.`name` AS `member_name`,`member`.`status` AS `member_status`,`higi_view`.`id` AS `id`,`higi_view`.`name` AS `name`,`higi_view`.`pic_url` AS `pic_url`,`higi_view`.`pic_alt` AS `pic_alt`,`higi_view`.`recipepro_id` AS `recipepro_id`,`higi_view`.`recipepro_name` AS `recipepro_name`,`higi_view`.`recipepro_pic_url` AS `recipepro_pic_url`,`higi_view`.`recipepro_pic_alt` AS `recipepro_pic_alt`,`higi_view`.`brand_id` AS `brand_id`,`higi_view`.`brand_name` AS `brand_name`,`higi_view`.`brand_pic_url` AS `brand_pic_url`,`higi_view`.`brand_pic_alt` AS `brand_pic_alt`,`higi_view`.`product_id` AS `product_id`,`higi_view`.`product_name` AS `product_name`,`higi_view`.`product_pic_urls` AS `product_pic_urls`,`higi_view`.`product_pic_alts` AS `product_pic_alts`,`higi_view`.`methods` AS `methods`,`higi_view`.`note` AS `note`,`higi_view`.`member_only` AS `member_only`,`higi_view`.`list_order` AS `list_order`,`higi_view`.`status` AS `status`,`higi_view`.`remark` AS `remark`,`higi_view`.`c_time` AS `c_time`,`higi_view`.`c_user_id` AS `c_user_id`,`higi_view`.`c_user_name` AS `c_user_name`,`higi_view`.`u_time` AS `u_time`,`higi_view`.`u_user_id` AS `u_user_id`,`higi_view`.`u_user_name` AS `u_user_name` from ((`member` join `member_higi` on((`member`.`id` = `member_higi`.`member_id`))) join `higi_view` on((`member_higi`.`higi_id` = `higi_view`.`id`))) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `member_recipepro_view`
--
DROP TABLE IF EXISTS `member_recipepro_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `member_recipepro_view`  AS  select `member`.`id` AS `member_id`,`member`.`account` AS `member_account`,`member`.`name` AS `member_name`,`member`.`status` AS `member_status`,`recipepro_view`.`id` AS `id`,`recipepro_view`.`name` AS `name`,`recipepro_view`.`pic_url` AS `pic_url`,`recipepro_view`.`pic_alt` AS `pic_alt`,`recipepro_view`.`feature` AS `feature`,`recipepro_view`.`price` AS `price`,`recipepro_view`.`type` AS `type`,`recipepro_view`.`style` AS `style`,`recipepro_view`.`season` AS `season`,`recipepro_view`.`product_ids` AS `product_ids`,`recipepro_view`.`nutrition` AS `nutrition`,`recipepro_view`.`member_only` AS `member_only`,`recipepro_view`.`list_order` AS `list_order`,`recipepro_view`.`status` AS `status`,`recipepro_view`.`remark` AS `remark`,`recipepro_view`.`c_time` AS `c_time`,`recipepro_view`.`c_user_id` AS `c_user_id`,`recipepro_view`.`c_user_name` AS `c_user_name`,`recipepro_view`.`u_time` AS `u_time`,`recipepro_view`.`u_user_id` AS `u_user_id`,`recipepro_view`.`u_user_name` AS `u_user_name` from ((`member` join `member_recipepro` on((`member`.`id` = `member_recipepro`.`member_id`))) join `recipepro_view` on((`member_recipepro`.`recipepro_id` = `recipepro_view`.`id`))) ;

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

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `recipepro_view`  AS  select `recipepro`.`id` AS `id`,`recipepro`.`name` AS `name`,`recipepro`.`pic_url` AS `pic_url`,`recipepro`.`pic_alt` AS `pic_alt`,`recipepro`.`feature` AS `feature`,`recipepro`.`price` AS `price`,`recipepro`.`type` AS `type`,`recipepro`.`style` AS `style`,`recipepro`.`season` AS `season`,`recipepro`.`product_ids` AS `product_ids`,`recipepro`.`nutrition` AS `nutrition`,`recipepro`.`member_only` AS `member_only`,`recipepro`.`list_order` AS `list_order`,`recipepro`.`status` AS `status`,`recipepro`.`remark` AS `remark`,`recipepro`.`c_time` AS `c_time`,`recipepro`.`c_user_id` AS `c_user_id`,`c_user`.`name` AS `c_user_name`,`recipepro`.`u_time` AS `u_time`,`recipepro`.`u_user_id` AS `u_user_id`,`u_user`.`name` AS `u_user_name` from ((`recipepro` left join `user` `c_user` on((`recipepro`.`c_user_id` = `c_user`.`id`))) left join `user` `u_user` on((`recipepro`.`u_user_id` = `u_user`.`id`))) ;

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
-- 已匯出資料表的索引
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
-- 資料表索引 `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- 在匯出的資料表使用 AUTO_INCREMENT
--

--
-- 使用資料表 AUTO_INCREMENT `ad`
--
ALTER TABLE `ad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '廣告編號';

--
-- 使用資料表 AUTO_INCREMENT `area`
--
ALTER TABLE `area`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '鄉鎮市區編號', AUTO_INCREMENT=369;

--
-- 使用資料表 AUTO_INCREMENT `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Banner編號';

--
-- 使用資料表 AUTO_INCREMENT `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '品牌編號';

--
-- 使用資料表 AUTO_INCREMENT `campaign`
--
ALTER TABLE `campaign`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '餐飲情報編號';

--
-- 使用資料表 AUTO_INCREMENT `campaign_tag`
--
ALTER TABLE `campaign_tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '餐飲情報標籤編號';

--
-- 使用資料表 AUTO_INCREMENT `city`
--
ALTER TABLE `city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '縣市編號', AUTO_INCREMENT=23;

--
-- 使用資料表 AUTO_INCREMENT `higi`
--
ALTER TABLE `higi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '招客秘技編號';

--
-- 使用資料表 AUTO_INCREMENT `log`
--
ALTER TABLE `log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '操作記錄編號';

--
-- 使用資料表 AUTO_INCREMENT `member`
--
ALTER TABLE `member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '會員編號';

--
-- 使用資料表 AUTO_INCREMENT `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '選單編號', AUTO_INCREMENT=20;

--
-- 使用資料表 AUTO_INCREMENT `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品編號';

--
-- 使用資料表 AUTO_INCREMENT `program`
--
ALTER TABLE `program`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '程式編號', AUTO_INCREMENT=87;

--
-- 使用資料表 AUTO_INCREMENT `program_category`
--
ALTER TABLE `program_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '程式類別編號', AUTO_INCREMENT=18;

--
-- 使用資料表 AUTO_INCREMENT `recipepro`
--
ALTER TABLE `recipepro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '專業食譜編號';

--
-- 使用資料表 AUTO_INCREMENT `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色編號', AUTO_INCREMENT=2;

--
-- 使用資料表 AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '使用者編號', AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
