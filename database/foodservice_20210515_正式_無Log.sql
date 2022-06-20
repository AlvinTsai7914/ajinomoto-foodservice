-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- 主機： localhost:3306
-- 產生時間： 2021 年 05 月 15 日 09:53
-- 伺服器版本： 10.2.14-MariaDB
-- PHP 版本： 5.6.30

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
  `c_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '建立時間',
  `c_user_id` int(11) NOT NULL COMMENT '建立使者編號',
  `u_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '修改時間',
  `u_user_id` int(11) NOT NULL COMMENT '修改使用者編號'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `ad`
--

INSERT INTO `ad` (`id`, `name`, `pic_url`, `pic_alt`, `link`, `list_order`, `status`, `remark`, `c_time`, `c_user_id`, `u_time`, `u_user_id`) VALUES
(1, '烹大師鰹魚', '/uploads/ad/1579243849.jpg', '', 'https://www.ajinomoto.com.tw/foodservice/selected.php', 0, 0, '', '2020-01-17 14:47:51', 7, '2020-01-17 14:50:49', 7),
(2, '鮮味系列調味料', '/uploads/ad/1580377034.jpg', '', 'https://www.ajinomoto.com.tw/foodservice/safety.php', 0, 0, '', '2020-01-30 16:57:35', 7, '2020-01-30 17:37:14', 7);

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
  `c_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '建立時間',
  `c_user_id` int(11) NOT NULL COMMENT '建立使者編號',
  `u_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '修改時間',
  `u_user_id` int(11) NOT NULL COMMENT '修改使用者編號'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `banner`
--

INSERT INTO `banner` (`id`, `name`, `pic_url`, `pic_alt`, `link`, `blank`, `list_order`, `status`, `remark`, `c_time`, `c_user_id`, `u_time`, `u_user_id`) VALUES
(1, '烹大師三品', '/uploads/banner/1577322678.jpg', '', '', 0, 3, 0, '', '2019-12-26 09:11:18', 1, '2020-11-04 15:29:22', 7),
(2, '雞粉', '/uploads/banner/1577322715.jpg', '', 'https://www.ajinomoto.com.tw/foodservice/product-detail.php?id=4', 0, 4, 0, '', '2019-12-26 09:11:55', 1, '2020-11-04 15:29:29', 7),
(3, '鮮味', '/uploads/banner/1577322737.jpg', '', '', 0, 5, 0, '', '2019-12-26 09:12:17', 1, '2020-11-04 15:29:35', 7),
(4, '50周年', '/uploads/banner/1604474900.jpg', '', '', 0, 1, 0, '', '2020-11-04 15:11:49', 7, '2020-11-04 15:28:33', 7),
(5, 'AjiPanda', '/uploads/banner/1604475760.jpg', '', '', 0, 2, 0, '', '2020-11-04 15:42:40', 7, '2020-11-04 15:42:40', 7);

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
  `c_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '建立時間',
  `c_user_id` int(11) NOT NULL COMMENT '建立使者編號',
  `u_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '修改時間',
  `u_user_id` int(11) NOT NULL COMMENT '修改使用者編號'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `brand`
--

INSERT INTO `brand` (`id`, `name`, `pic_url`, `pic_alt`, `list_order`, `status`, `remark`, `c_time`, `c_user_id`, `u_time`, `u_user_id`) VALUES
(1, '烹大師', '/uploads/brand/1618474044.png', '', 0, 0, '', '2019-12-24 11:26:02', 1, '2021-04-15 16:07:24', 7),
(2, '鮮味', '/uploads/brand/1577165177.jpg', '', 0, 0, '', '2019-12-24 13:26:17', 1, '2019-12-24 13:26:17', 1),
(3, '高鮮味精', '/uploads/brand/1577167202.jpg', '', 0, 0, '', '2019-12-24 13:48:45', 1, '2019-12-24 14:00:02', 1),
(4, '味之素品牌', '/uploads/brand/1577166559.jpg', '', 0, 0, '', '2019-12-24 13:49:19', 1, '2019-12-24 13:49:19', 1),
(5, '加工通路商品', '/uploads/brand/1598582267.png', '', 0, 0, '', '2020-08-28 10:37:47', 7, '2020-08-28 10:37:47', 7);

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
  `c_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '建立時間',
  `c_user_id` int(11) NOT NULL COMMENT '建立使者編號',
  `u_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '修改時間',
  `u_user_id` int(11) NOT NULL COMMENT '修改使用者編號'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `campaign`
--

INSERT INTO `campaign` (`id`, `tag_ids`, `title`, `sub_title`, `content`, `pic_url`, `pic_alt`, `release_date`, `list_order`, `status`, `remark`, `c_time`, `c_user_id`, `u_time`, `u_user_id`) VALUES
(1, '1', '「味之素沙拉醬」買一送一活動開跑', '數量有限 送完為止', '<div style=\"background: rgb(238, 238, 238); border: 1px solid rgb(204, 204, 204); padding: 5px 10px; text-align: center;\"><span style=\"font-size:24px;\"><span style=\"color:#e74c3c;\"><big><span comic=\"\" ms=\"\" sans=\"\">日本味之素集團暢銷50周年商品</span></big><br />\r\n<big><span style=\"font-family:Comic Sans MS,cursive;\">「味之素品牌」沙拉醬</span><span comic=\"\" ms=\"\" sans=\"\"></span></big></span></span></div>\r\n\r\n<div style=\"text-align: center;\"><span style=\"font-size:20px;\"></span><br />\r\n<span style=\"font-size:18px;\"></span><span style=\"font-size:16px;\">*全蛋製作，口味柔和清爽!<br />\r\n*不搶食材原味，適合做醬料基底!<br />\r\n*良好的保水性和耐熱性!</span><span style=\"font-size:18px;\"><br />\r\n<br />\r\n<span style=\"color:#e74c3c;\">嚐鮮優惠買一送一</span><br />\r\n數量有限 送完為止喔!!</span><span style=\"font-size:20px;\"></span><br />\r\n<br />\r\n<img alt=\"\" src=\"/foodservice/uploads/editor/1594049290.png\" style=\"max-width:600px\" /></div>\r\n', '/uploads/campaign/1593592825.jpg', '', '2020-07-01 00:00:00', 0, 1, '', '2020-07-01 16:25:54', 7, '2020-09-29 16:23:06', 7),
(2, '3', '時間就是味道', '「時間」是讓生意興隆的根基', '<!-- Image Map Generated by http://www.image-map.net/ -->\r\n<img src=\"https://www.ajinomoto.com.tw/foodservice/uploads/editor/1603417035.jpg\" usemap=\"#image-map\">\r\n<map name=\"image-map\">\r\n<area alt=\"\" coords=\"734,1840,636,1729\" href=\"https://www.ajinomoto.com.tw/foodservice/product-detail.php?id=1\" shape=\"rect\" target=\"_blank\" title=\"\" /> <area alt=\"\" coords=\"638,2132,736,2252\" href=\"https://www.ajinomoto.com.tw/foodservice/product-detail.php?id=1\" shape=\"rect\" target=\"_blank\" title=\"\" /> <area alt=\"\" coords=\"613,2548,678,2633\" href=\"https://www.ajinomoto.com.tw/foodservice/product-detail.php?id=1\" shape=\"rect\" target=\"_blank\" title=\"\" /> <area alt=\"\" coords=\"762,2551,816,2627\" href=\"https://www.ajinomoto.com.tw/foodservice/product-detail.php?id=1\" shape=\"rect\" target=\"\" title=\"\" /> <area alt=\"\" coords=\"336,3411,404,3502\" href=\"https://www.ajinomoto.com.tw/foodservice/product-detail.php?id=1\" shape=\"rect\" target=\"\" title=\"\" /> <area alt=\"\" coords=\"649,4533,726,4627\" href=\"https://www.ajinomoto.com.tw/foodservice/product-detail.php?id=1\" shape=\"rect\" target=\"\" title=\"\" /> <area alt=\"\" coords=\"336,5367,404,5460\" href=\"https://www.ajinomoto.com.tw/foodservice/product-detail.php?id=1\" shape=\"rect\" target=\"\" title=\"\" /> <area alt=\"\" coords=\"685,2549,740,2634\" href=\"https://www.ajinomoto.com.tw/foodservice/product-detail.php?id=3\" shape=\"rect\" target=\"\" title=\"\" /> <area alt=\"\" coords=\"410,3413,477,3500\" href=\"https://www.ajinomoto.com.tw/foodservice/product-detail.php?id=3\" shape=\"rect\" target=\"\" title=\"\" /> <area alt=\"\" coords=\"823,2554,873,2630\" href=\"https://www.ajinomoto.com.tw/foodservice/product-detail.php?id=4\" shape=\"rect\" target=\"\" title=\"\" /> <area alt=\"\" coords=\"787,3424,863,3505\" href=\"https://www.ajinomoto.com.tw/foodservice/product-detail.php?id=4\" shape=\"rect\" target=\"\" title=\"\" /> <area alt=\"\" coords=\"819,3741,890,3825\" href=\"https://www.ajinomoto.com.tw/foodservice/product-detail.php?id=4\" shape=\"rect\" target=\"\" title=\"\" /> <area alt=\"\" coords=\"360,4946,448,5046\" href=\"https://www.ajinomoto.com.tw/foodservice/product-detail.php?id=4\" shape=\"rect\" target=\"\" title=\"\" /> <area alt=\"\" coords=\"761,4938,831,5024\" href=\"https://www.ajinomoto.com.tw/foodservice/product-detail.php?id=4\" shape=\"rect\" target=\"\" title=\"\" /> <area alt=\"\" coords=\"763,5364,830,5457\" href=\"https://www.ajinomoto.com.tw/foodservice/product-detail.php?id=4\" shape=\"rect\" target=\"\" title=\"\" /> <area alt=\"\" coords=\"823,5585,887,5667\" href=\"https://www.ajinomoto.com.tw/foodservice/product-detail.php?id=4\" shape=\"rect\" target=\"\" title=\"\" /> <area alt=\"\" coords=\"878,2551,930,2638\" href=\"https://www.ajinomoto.com.tw/foodservice/product-detail.php?id=9\" shape=\"rect\" target=\"\" title=\"\" /> <area alt=\"\" coords=\"835,4937,895,5025\" href=\"https://www.ajinomoto.com.tw/foodservice/product-detail.php?id=9\" shape=\"rect\" target=\"\" title=\"\" /> <area alt=\"\" coords=\"408,5368,479,5465\" href=\"https://www.ajinomoto.com.tw/foodservice/product-detail.php?id=8\" shape=\"rect\" target=\"\" title=\"\" /> <area alt=\"\" coords=\"836,5364,909,5456\" href=\"https://www.ajinomoto.com.tw/foodservice/product-detail.php?id=8\" shape=\"rect\" target=\"\" title=\"\" /> <area alt=\"\" coords=\"790,1691,912,1793\" href=\"https://www.ajinomoto.com.tw/foodservice/recipepro-detail.php?id=214\" shape=\"rect\" target=\"\" title=\"\" /> <area alt=\"\" coords=\"791,1801,914,1901\" href=\"https://www.ajinomoto.com.tw/foodservice/recipepro-detail.php?id=215\" shape=\"rect\" target=\"\" title=\"\" /> <area alt=\"\" coords=\"790,2097,911,2205\" href=\"https://www.ajinomoto.com.tw/foodservice/recipepro-detail.php?id=218\" shape=\"rect\" target=\"\" title=\"\" /> <area alt=\"\" coords=\"792,2210,910,2303\" href=\"https://www.ajinomoto.com.tw/foodservice/recipepro-detail.php?id=219\" shape=\"rect\" target=\"\" title=\"\" /> <area alt=\"\" coords=\"282,3597,397,3695\" href=\"https://www.ajinomoto.com.tw/foodservice/recipepro-detail.php?id=220\" shape=\"rect\" target=\"\" title=\"\" /> <area alt=\"\" coords=\"401,3597,521,3696\" href=\"https://www.ajinomoto.com.tw/foodservice/recipepro-detail.php?id=221\" shape=\"rect\" target=\"\" title=\"\" /> <area alt=\"\" coords=\"736,3599,855,3695\" href=\"https://www.ajinomoto.com.tw/foodservice/recipepro-detail.php?id=222\" shape=\"rect\" target=\"\" title=\"\" /></map>', '/uploads/campaign/1601963292.jpg', '', '2020-10-05 00:00:00', 0, 0, '', '2020-09-29 18:26:38', 1, '2020-10-23 09:41:12', 1),
(3, '3', '直擊日本專家訣竅!調味應用術', '直擊日本專家訣竅!調味應用術', '<!-- Image Map Generated by http://www.image-map.net/ --><img src=\"https://www.ajinomoto.com.tw/foodservice/uploads/editor/1601951483.jpg\" usemap=\"#image-map\" /><map name=\"image-map\"><area alt=\"\" coords=\"800,597,577,295\" href=\"https://www.ajinomoto.com.tw/foodservice/product-detail.php?id=3\" shape=\"rect\" target=\"\" title=\"\" /> <area alt=\"\" coords=\"626,4362,976,4835\" href=\"https://www.ajinomoto.com.tw/foodservice/product-detail.php?id=3\" shape=\"rect\" target=\"\" title=\"\" /></map>', '/uploads/campaign/1601963302.jpg', '', '2020-10-05 00:00:00', 0, 0, '', '2020-09-29 18:28:19', 1, '2020-10-06 13:48:22', 1),
(4, '3', '適合餐飲業現場-「冷凍肉的美味烹調法」', '適合餐飲業現場-「冷凍肉的美味烹調法」', '<!-- Image Map Generated by http://www.image-map.net/ --><img src=\"https://www.ajinomoto.com.tw/foodservice/uploads/editor/1603244709.jpg\" usemap=\"#image-map\" /><map name=\"image-map\"><area alt=\"\" coords=\"152,1392,265,1545\" href=\"https://www.ajinomoto.com.tw/foodservice/product-detail.php?id=9\" shape=\"rect\" target=\"_blank\" title=\"\" /> <area alt=\"\" coords=\"910,4991,992,5108\" href=\"https://www.ajinomoto.com.tw/foodservice/product-detail.php?id=9\" shape=\"rect\" target=\"_blank\" title=\"\" /> <area alt=\"\" coords=\"369,3456,494,3616\" href=\"https://www.ajinomoto.com.tw/foodservice/product-detail.php?id=8\" shape=\"rect\" target=\"_blank\" title=\"\" /> <area alt=\"\" coords=\"162,2925,270,3082\" href=\"https://www.ajinomoto.com.tw/foodservice/product-detail.php?id=4\" shape=\"rect\" target=\"_blank\" title=\"\" /> <area alt=\"\" coords=\"136,4788,224,4944\" href=\"https://www.ajinomoto.com.tw/foodservice/product-detail.php?id=4\" shape=\"rect\" target=\"_blank\" title=\"\" /> <area alt=\"\" coords=\"427,4988,508,5120\" href=\"https://www.ajinomoto.com.tw/foodservice/product-detail.php?id=4\" shape=\"rect\" target=\"_blank\" title=\"\" /></map>', '/uploads/campaign/1601963421.jpg', '', '2020-10-05 00:00:00', 0, 0, '', '2020-09-29 18:30:21', 1, '2020-10-21 09:48:50', 1),
(5, '3', '蒸烤箱烹調技巧-「讓冷凍魚美味大翻身」', '蒸烤箱烹調技巧-「讓冷凍魚美味大翻身」', '<!-- Image Map Generated by http://www.image-map.net/ --><img src=\"https://www.ajinomoto.com.tw/foodservice/uploads/editor/1602840626.jpg\" usemap=\"#image-map\" /><map name=\"image-map\"><area alt=\"\" coords=\"170,1185,309,1347\" href=\"https://www.ajinomoto.com.tw/foodservice/product-detail.php?id=8\" shape=\"rect\" target=\"\" title=\"\" /> <area alt=\"\" coords=\"187,1930,268,2026\" href=\"https://www.ajinomoto.com.tw/foodservice/product-detail.php?id=8\" shape=\"rect\" target=\"\" title=\"\" /> <area alt=\"\" coords=\"511,3033,618,3156\" href=\"https://www.ajinomoto.com.tw/foodservice/product-detail.php?id=8\" shape=\"rect\" target=\"\" title=\"\" /> <area alt=\"\" coords=\"175,4239,280,4362\" href=\"https://www.ajinomoto.com.tw/foodservice/product-detail.php?id=8\" shape=\"rect\" target=\"\" title=\"\" /> <area alt=\"\" coords=\"335,1178,471,1355\" href=\"https://www.ajinomoto.com.tw/foodservice/product-detail.php?id=3\" shape=\"rect\" target=\"\" title=\"\" /> <area alt=\"\" coords=\"274,1931,343,2027\" href=\"https://www.ajinomoto.com.tw/foodservice/product-detail.php?id=3\" shape=\"rect\" target=\"\" title=\"\" /> <area alt=\"\" coords=\"664,3031,785,3156\" href=\"https://www.ajinomoto.com.tw/foodservice/product-detail.php?id=3\" shape=\"rect\" target=\"\" title=\"\" /> <area alt=\"\" coords=\"432,4230,547,4358\" href=\"https://www.ajinomoto.com.tw/foodservice/product-detail.php?id=3\" shape=\"rect\" target=\"\" title=\"\" /></map>', '/uploads/campaign/1601963321.jpg', '', '2020-10-05 00:00:00', 0, 0, '', '2020-09-29 18:31:40', 1, '2020-10-16 17:56:16', 1),
(6, '3', '秘訣!日本知名大廚的私房烹飪技巧大公開!', '秘訣!日本知名大廚的私房烹飪技巧大公開!', '<!-- Image Map Generated by http://www.image-map.net/ --><img src=\"https://www.ajinomoto.com.tw/foodservice/uploads/editor/1601951974.jpg\" usemap=\"#image-map\" /><map name=\"image-map\"><area alt=\"\" coords=\"918,186,803,21\" href=\"https://www.ajinomoto.com.tw/foodservice/product-detail.php?id=9\" shape=\"rect\" target=\"\" title=\"\" /> <area alt=\"\" coords=\"924,21,1043,185\" href=\"https://www.ajinomoto.com.tw/foodservice/product-detail.php?id=8\" shape=\"0\" target=\"\" title=\"\" /></map>', '/uploads/campaign/1601963383.jpg', '', '2020-10-05 00:00:00', 8, 0, '', '2020-09-29 18:35:34', 1, '2020-10-19 21:30:29', 1),
(7, '7', '一、日本料理的核心「高湯」', '一、日本料理的核心「高湯」', '<img alt=\"\" src=\"/foodservice/uploads/editor/1601962792.jpg\" />', '/uploads/campaign/1601963393.jpg', '', '2020-10-05 00:00:00', 1, 0, '', '2020-09-29 18:40:28', 1, '2020-10-16 18:03:31', 1),
(8, '7', '二、「高湯」的地區性', '二、「高湯」的地區性', '<!-- Image Map Generated by http://www.image-map.net/ --><img src=\"https://www.ajinomoto.com.tw/foodservice/uploads/editor/1601962830.jpg\" usemap=\"#image-map\" /><map name=\"image-map\"><area alt=\"\" coords=\"109,1246,556,1862\" href=\"https://www.ajinomoto.com.tw/foodservice/foodserviceimg/japan_fish1.jpg\" shape=\"rect\" target=\"_blank\" title=\"\" /> <area alt=\"\" coords=\"572,1244,958,1491\" href=\"https://www.ajinomoto.com.tw/foodservice/foodserviceimg/japan_fish2.jpg\" shape=\"rect\" target=\"_blank\" title=\"\" /> <area alt=\"\" coords=\"569,1504,961,1861\" href=\"https://www.ajinomoto.com.tw/foodservice/foodserviceimg/japan_fish3.jpg\" shape=\"rect\" target=\"_blank\" title=\"\" /> <area alt=\"\" coords=\"109,2905,557,3526\" href=\"https://www.ajinomoto.com.tw/foodservice/foodserviceimg/japan_khumbu1.jpg\" shape=\"rect\" target=\"_blank\" title=\"\" /> <area alt=\"\" coords=\"568,2903,957,3150\" href=\"https://www.ajinomoto.com.tw/foodservice/foodserviceimg/japan_khumbu2.jpg\" shape=\"rect\" target=\"_blank\" title=\"\" /> <area alt=\"\" coords=\"569,3165,958,3524\" href=\"https://www.ajinomoto.com.tw/foodservice/foodserviceimg/japan_khumbu3.jpg\" shape=\"rect\" target=\"\" title=\"\" /></map>', '/uploads/campaign/1601963402.jpg', '', '2020-10-05 00:00:00', 2, 0, '', '2020-09-29 18:43:21', 1, '2020-10-16 18:03:40', 1),
(9, '7', '三、「調味料」的地區性', '三、「調味料」的地區性', '<!-- Image Map Generated by http://www.image-map.net/ --><img src=\"https://www.ajinomoto.com.tw/foodservice/uploads/editor/1601962861.jpg\" usemap=\"#image-map\" /><map name=\"image-map\"><area alt=\"\" coords=\"109,1497,546,2116\" href=\"https://www.ajinomoto.com.tw/foodservice/foodserviceimg/japan_soy1.jpg\" shape=\"rect\" target=\"_blank\" title=\"\" /> <area alt=\"\" coords=\"565,1496,953,1743\" href=\"https://www.ajinomoto.com.tw/foodservice/foodserviceimg/japan_soy2.jpg\" shape=\"rect\" target=\"_blank\" title=\"\" /> <area alt=\"\" coords=\"566,1761,953,2117\" href=\"https://www.ajinomoto.com.tw/foodservice/foodserviceimg/japan_soy3.jpg\" shape=\"rect\" target=\"_blank\" title=\"\" /> <area alt=\"\" coords=\"111,3222,551,3837\" href=\"https://www.ajinomoto.com.tw/foodservice/foodserviceimg/japan_miso1.jpg\" shape=\"rect\" target=\"_blank\" title=\"\" /> <area alt=\"\" coords=\"569,3221,955,3467\" href=\"https://www.ajinomoto.com.tw/foodservice/foodserviceimg/japan_miso3.jpg\" shape=\"rect\" target=\"_blank\" title=\"\" /> <area alt=\"\" coords=\"570,3481,958,3842\" href=\"https://www.ajinomoto.com.tw/foodservice/foodserviceimg/japan_miso2.jpg\" shape=\"rect\" target=\"_blank\" title=\"\" /></map>', '/uploads/campaign/1601963411.jpg', '', '2020-10-05 00:00:00', 3, 0, '', '2020-09-29 18:47:09', 1, '2020-10-16 18:03:51', 1),
(10, '7', '四、鄉土料理的多樣性', '四、鄉土料理的多樣性', '<!-- Image Map Generated by http://www.image-map.net/ --><img src=\"https://www.ajinomoto.com.tw/foodservice/uploads/editor/1602043568.jpg\" usemap=\"#image-map\" /><map name=\"image-map\"><area alt=\"\" coords=\"100,1119,970,2032\" href=\"https://www.ajinomoto.com.tw/foodservice/foodserviceimg/45_g2.jpg\" shape=\"rect\" target=\"_blank\" title=\"\" /> <area alt=\"\" coords=\"101,2096,971,3096\" href=\"https://www.ajinomoto.com.tw/foodservice/foodserviceimg/45_g.jpg\" shape=\"rect\" target=\"_blank\" title=\"\" /> <area alt=\"\" coords=\"101,4560,968,5465\" href=\"https://www.ajinomoto.com.tw/foodservice/foodserviceimg/45_sushi2.jpg\" shape=\"rect\" target=\"_blank\" title=\"\" /> <area alt=\"\" coords=\"101,5535,968,6436\" href=\"https://www.ajinomoto.com.tw/foodservice/foodserviceimg/45_sushi3.jpg\" shape=\"rect\" target=\"_blank\" title=\"\" /> <area alt=\"\" coords=\"99,7137,970,7991\" href=\"https://www.ajinomoto.com.tw/foodservice/foodserviceimg/45_noodle2.jpg\" shape=\"rect\" target=\"_blank\" title=\"\" /> <area alt=\"\" coords=\"102,8446,967,9340\" href=\"https://www.ajinomoto.com.tw/foodservice/foodserviceimg/45_noodle3.jpg\" shape=\"rect\" target=\"_blank\" title=\"\" /></map>', '/uploads/campaign/1601963432.jpg', '', '2020-10-05 00:00:00', 4, 0, '', '2020-09-29 18:52:32', 1, '2020-10-16 18:03:59', 1),
(11, '7', '五、「水」與「高湯」的深厚關係', '五、「水」與「高湯」的深厚關係', '<!-- Image Map Generated by http://www.image-map.net/ --><img src=\"https://www.ajinomoto.com.tw/foodservice/uploads/editor/1601962889.jpg\" usemap=\"#image-map\" /><map name=\"image-map\"><area alt=\"\" coords=\"105,2557,969,3468\" href=\"https://www.ajinomoto.com.tw/foodservice/foodserviceimg/45_w2.jpg\" shape=\"rect\" target=\"_blank\" title=\"\" /></map>', '/uploads/campaign/1601963442.jpg', '', '2020-10-05 00:00:00', 5, 0, '', '2020-09-29 18:55:49', 1, '2020-10-16 18:04:08', 1),
(12, '8', '給大廚的「味噌湯進化論」', '變換味噌湯，午餐定食豐富化', '<!-- Image Map Generated by http://www.image-map.net/ -->\r\n<img src=\"https://www.ajinomoto.com.tw/foodservice/uploads/editor/1617177995.jpg\" usemap=\"#image-map\">\r\n\r\n<map name=\"image-map\">\r\n    <area target=\"\" alt=\"\" title=\"\" href=\"https://www.ajinomoto.com.tw/foodservice/recipepro-detail.php?id=239\" coords=\"548,2199,761,2258\" shape=\"rect\">\r\n    <area target=\"\" alt=\"\" title=\"\" href=\"https://www.ajinomoto.com.tw/foodservice/recipepro-detail.php?id=240\" coords=\"143,2585,353,2639\" shape=\"rect\">\r\n    <area target=\"\" alt=\"\" title=\"\" href=\"https://www.ajinomoto.com.tw/foodservice/recipepro-detail.php?id=248\" coords=\"550,3014,757,3065\" shape=\"rect\">\r\n    <area target=\"\" alt=\"\" title=\"\" href=\"https://www.ajinomoto.com.tw/foodservice/recipepro-detail.php?id=241\" coords=\"142,3415,353,3468\" shape=\"rect\">\r\n    <area target=\"\" alt=\"\" title=\"\" href=\"https://www.ajinomoto.com.tw/foodservice/recipepro-detail.php?id=242\" coords=\"548,4228,761,4283\" shape=\"rect\">\r\n    <area target=\"\" alt=\"\" title=\"\" href=\"https://www.ajinomoto.com.tw/foodservice/recipepro-detail.php?id=243\" coords=\"147,4646,354,4697\" shape=\"rect\">\r\n    <area target=\"\" alt=\"\" title=\"\" href=\"https://www.ajinomoto.com.tw/foodservice/recipepro-detail.php?id=244\" coords=\"547,5036,761,5092\" shape=\"rect\">\r\n    <area target=\"\" alt=\"\" title=\"\" href=\"https://www.ajinomoto.com.tw/foodservice/recipepro-detail.php?id=245\" coords=\"140,5495,355,5552\" shape=\"rect\">\r\n    <area target=\"\" alt=\"\" title=\"\" href=\"https://www.ajinomoto.com.tw/foodservice/recipepro-detail.php?id=249\" coords=\"548,6302,758,6354\" shape=\"rect\">\r\n    <area target=\"\" alt=\"\" title=\"\" href=\"https://www.ajinomoto.com.tw/foodservice/recipepro-detail.php?id=246\" coords=\"141,6729,356,6782\" shape=\"rect\">\r\n    <area target=\"\" alt=\"\" title=\"\" href=\"https://www.ajinomoto.com.tw/foodservice/recipepro-detail.php?id=247\" coords=\"546,7139,760,7196\" shape=\"rect\">\r\n</map>', '/uploads/campaign/1615863872.jpg', '', '1970-01-01 00:00:00', 0, 0, '', '2021-03-16 10:03:41', 1, '2021-03-31 16:20:50', 1),
(13, '9', '預防食物中毒的注意事項', '提供給欲開始經營外送的餐廳業者', '<img alt=\"\" src=\"/foodservice/uploads/editor/1620033811.jpg\" />', '/uploads/campaign/1620034397.jpg', '', '1970-01-01 00:00:00', 0, 0, '', '2021-05-03 17:28:26', 1, '2021-05-03 17:33:17', 1);

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
  `c_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '建立時間',
  `c_user_id` int(11) NOT NULL COMMENT '建立使用者編號',
  `u_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '修改時間',
  `u_user_id` int(11) NOT NULL COMMENT '修改使用者編號'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `campaign_tag`
--

INSERT INTO `campaign_tag` (`id`, `name`, `color`, `list_order`, `status`, `remark`, `c_time`, `c_user_id`, `u_time`, `u_user_id`) VALUES
(1, '最新活動', '#df0c56', 0, 1, '', '2020-07-01 16:17:50', 7, '2020-10-15 15:24:18', 7),
(2, '時間就是味道', '#1eae5c', 0, 1, '', '2020-09-17 11:51:35', 7, '2020-09-17 13:47:00', 7),
(3, '調味料運用術', '#c9c9c9', 0, 0, '', '2020-09-17 11:51:35', 7, '2020-10-19 21:31:40', 1),
(4, '冷凍肉烹調法', '#1eae5c', 0, 1, '', '2020-09-29 18:22:32', 1, '2020-09-29 18:22:32', 1),
(5, '冷凍魚烹調法', '#1eae5c', 0, 1, '', '2020-09-29 18:22:50', 1, '2020-09-30 09:49:49', 1),
(6, '私房烹飪技巧', '#1eae5c', 0, 1, '', '2020-09-29 18:23:33', 1, '2020-09-30 09:49:56', 1),
(7, '認識日本飲食文化', '#bdbdbd', 0, 0, '', '2020-09-29 18:23:33', 1, '2020-10-19 21:31:16', 1),
(8, '味噌湯進化論', '#dbdbdb', 0, 0, '', '2021-03-16 10:01:09', 1, '2021-03-19 13:44:41', 1),
(9, '食中毒特集', '#000000', 0, 0, '', '2021-05-03 17:22:20', 1, '2021-05-03 17:22:20', 1);

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
,`tag_names` mediumtext
,`tag_colors` mediumtext
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
  `c_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '建立時間',
  `c_user_id` int(11) NOT NULL COMMENT '建立使者編號',
  `u_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '修改時間',
  `u_user_id` int(11) NOT NULL COMMENT '修改使用者編號'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `higi`
--

INSERT INTO `higi` (`id`, `name`, `pic_url`, `pic_alt`, `content`, `description`, `recipepro_id`, `product_id`, `tags`, `type`, `style`, `methods`, `note`, `note_pic_url`, `note_pic_alt`, `member_only`, `visitor`, `list_order`, `status`, `remark`, `c_time`, `c_user_id`, `u_time`, `u_user_id`) VALUES
(1, '和風義大利麵', '/uploads/product/1577958698.jfif', '', '在義大利麵裡 只需加入「ほんだし®/烹大師®」鰹魚風味與醬油', '製作高湯風味的和風義大利麵', 0, 1, '其他', '日式', '主食', ',■標準用量：,義大利麵250g：醬油10ml＋「ほんだし®/烹大師®」鰹魚風味7g', '加入奶油味道會更加溫潤，也可當作炒烏龍麵的調味。', '/uploads/higi/1577958700.jfif', '', 0, 45, 0, 0, '', '2020-01-02 17:51:40', 1, '2021-04-18 21:28:14', 2),
(2, '炒麵', '/uploads/product/1578014629.jfif', '', '在最後的步驟 加入「ほんだし®/烹大師®」鰹魚風味', '營造香氣濃郁、滋味豐富的好味道', 161, 1, '豬肉,葉菜類', '中式', '主食', ',詳情請點取相關料理！', '', '', '', 0, 27, 0, 0, '', '2020-01-03 09:23:50', 1, '2021-03-04 17:57:46', 2),
(3, '和風咖哩', '/uploads/product/1578014776.jfif', '', '在最後的步驟 加入「ほんだし®/烹大師®」鰹魚風味', '調配出和風咖哩', 162, 1, '海鮮類,根莖類', '日式', '主食', ',詳情請點取相關料理！', '', '', '', 0, 26, 0, 0, '', '2020-01-03 09:26:17', 1, '2021-01-16 12:04:19', 2),
(4, '柴魚高湯茶泡飯', '/uploads/product/1578015335.jfif', '', '只需在白飯與配料淋上 「ほんだし®/烹大師®」鰹魚風味＋熱水。', '柴魚高湯茶泡飯就完成囉!', 163, 1, '其他', '日式', '主食', ',■標準用量：,熱水500g加入「ほんだし®/烹大師®」鰹魚風味10g', '', '', '', 0, 12, 0, 0, '', '2020-01-03 09:35:36', 1, '2021-03-03 06:40:33', 2),
(5, '什錦飯', '/uploads/product/1578015480.jfif', '', '在白米加入 「ほんだし®/烹大師®」鰹魚風味＋醬油＋配料後蒸煮', '輕鬆烹調出鰹魚高湯的豐富香氣', 164, 1, '雞肉,菇蕈類', '日式', '主食', ',■標準用量：,5杯米加入「ほんだし®/烹大師®」鰹魚風味7g', '放涼後依舊保有高湯的香氣。', '/uploads/higi/1578015482.jfif', '', 0, 26, 0, 0, '', '2020-01-03 09:38:02', 1, '2020-12-18 11:18:44', 2),
(6, '柴魚風味飯糰', '/uploads/product/1578015548.jfif', '', '在白飯灑上「ほんだし®/烹大師®」鰹魚風味，', '輕鬆調理出帶有柴魚香氣的不變好滋味', 165, 1, '其他', '日式', '主食', ',■標準用量：,5杯白飯加入「ほんだし®/烹大師®」鰹魚風味8g', '再拌入醬油的話，最適合製作烤飯糰。', '/uploads/higi/1578040239.', '', 0, 16, 0, 0, '', '2020-01-03 09:39:09', 1, '2020-12-18 11:19:26', 2),
(7, '味噌湯', '/uploads/product/1578015676.jfif', '', '最後一個步驟 加入「ほんだし®/烹大師®」鰹魚風味', '突顯出鰹魚風味', 166, 1, '豆類', '日式', '湯羹類', '詳情請點取相關料理！', '', '', '', 0, 13, 0, 0, '', '2020-01-03 09:41:17', 1, '2020-12-20 19:47:56', 2),
(8, '大阪燒', '/uploads/product/1578015792.jfif', '', '在低筋麵粉、山藥等 加入「ほんだし®/烹大師®」鰹魚風味製作的高湯', '調配出鬆軟帶有柴魚風味的麵糊', 167, 1, '豬肉', '日式', '主食', '■標準用量：,低筋麵粉100g加入「ほんだし®/烹大師®」鰹魚風味3g,■注意事項：,等高湯冷卻後加入！', '', '', '', 0, 16, 0, 0, '', '2020-01-03 09:43:13', 1, '2021-04-14 10:23:56', 2),
(9, '燒肉醬汁', '/uploads/product/1578015896.jfif', '', '加入大蔥、洋蔥、麻油等 拌入「ほんだし®/烹大師®」鰹魚風味', '製作風味濃郁、有深度的蔥鹽醬汁', 168, 1, '根莖類', '其他', '其他', ',■標準用量：,約10份／400g： 大蔥70g、洋蔥70g、大蒜35g、薑30g、芝麻粉適量、麻油190ml、「ほんだし®/烹大師®」鰹魚風味5g', '「ほんだし®/烹大師®」鰹魚風味的高湯口感與鹽分能調和風味強烈的蔥與麻油，增添深度。若加熱麻油並在最後淋上，會使香氣倍增。', '/uploads/higi/1578016022.', '', 0, 21, 0, 0, '', '2020-01-03 09:44:57', 1, '2021-03-22 09:57:40', 2),
(10, '豬肉涮涮鍋 佐芥末橘醋', '/uploads/product/1578016002.jfif', '', '在芝麻粉、日本芥末等裡拌入「ほんだし®/烹大師®」鰹魚風味', '調製讓人上癮的濃郁風味芥末橘醋', 169, 1, '豬肉', '其他', '其他', ',■標準用量：,約10份／500g :芝麻粉50g、日本芥末30g、橘醋260ml、醬油150ml、「ほんだし®/烹大師®」鰹魚風味10g', '「ほんだし®/烹大師®」鰹魚風味可以襯托融合芝麻、日本芥末、橘醋的特殊風味。', '/uploads/higi/1578016004.jfif', '', 0, 11, 0, 0, '', '2020-01-03 09:46:44', 1, '2020-12-18 11:21:47', 2),
(11, '餃子', '/uploads/product/1578016135.jfif', '', '在餡料裡加入「ほんだし®/烹大師®」鰹魚風味', '利用調味料，增添味道豐富度', 0, 1, '豬肉', '中式', '主食', '', '料理完成示意圖', '/uploads/higi/1578016137.jfif', '', 1, 11, 0, 0, '', '2020-01-03 09:48:58', 1, '2020-06-05 14:08:26', 2),
(12, '白蘿蔔泥', '/uploads/product/1578016329.jfif', '', '白蘿蔔泥 與「ほんだし®/烹大師®」鰹魚風味，', '只需混合就能調配出柴魚風味的白蘿蔔泥', 170, 1, '根莖類', '其他', '其他', ',■標準用量：,白蘿蔔100g加入「ほんだし®/烹大師®」鰹魚風味3g', '', '', '', 1, 3, 0, 0, '', '2020-01-03 09:52:10', 1, '2020-04-08 14:24:39', 7),
(13, '串炸物', '/uploads/product/1578016426.jfif', '', '在麵糊液(低筋麵粉、牛奶等) 加入「ほんだし®/烹大師®」鰹魚風味', '製作襯托食材滋味的外皮', 171, 1, '豬肉', '中式', '配菜', ',■標準用量：,低筋麵粉100g加入「ほんだし®/烹大師®」鰹魚風味3g,■注意事項：,使用牛奶當基底可增添濃郁度！', '', '', '', 1, 4, 0, 0, '', '2020-01-03 09:53:47', 1, '2020-04-08 14:24:20', 7),
(14, '燉白蘿蔔', '/uploads/product/1578016614.jfif', '', '在最後一個步驟加入「ほんだし®/烹大師®」鰹魚風味', '突顯出柴魚風味', 172, 1, '根莖類', '日式', '配菜', ',詳情請點取相關料理！', '', '', '', 1, 4, 0, 0, '', '2020-01-03 09:56:55', 1, '2020-04-08 14:23:36', 7),
(15, '火鍋肉丸', '/uploads/product/1578016717.jfif', '', '在絞肉裡 加入「ほんだし®/烹大師®」鰹魚風味', '輕鬆調製火鍋肉丸', 0, 1, '豬肉', '中式', '配菜', ',■標準用量：,絞肉500g：「ほんだし®/烹大師®」鰹魚風味5g（加入山藥可讓味道更溫潤）', '料理完成示意圖', '/uploads/higi/1578016719.jfif', '', 0, 109, 0, 0, '', '2020-01-03 09:58:39', 1, '2021-02-23 10:18:27', 2),
(16, '炸絞肉排', '/uploads/product/1578017199.jfif', '', '攪拌肉的時候 加入「ほんだし®/烹大師®」鰹魚風味', '可以抑制肉與脂肪的腥味', 173, 1, '豬肉', '日式', '主菜', ',■標準用量：,牛絞肉400g加入「ほんだし®/烹大師®」鰹魚風味4g', '', '', '', 1, 5, 0, 0, '', '2020-01-03 10:06:40', 1, '2020-04-08 14:23:02', 7),
(17, '漢堡醬汁', '/uploads/product/1578017326.jfif', '', '在蛋黃、白蘿蔔泥等 拌入「ほんだし®/烹大師®」鰹魚風味', '製作帶有柴魚片香氣的溫潤蘿蔔泥醬', 0, 1, '其他', '其他', '其他', ',■標準用量：,約10份／400g： 蛋黃40g、白蘿蔔泥260g、顆粒黃芥末40g、檸檬汁10ml、醬油40ml、「ほんだし®/烹大師®」鰹魚風味10g', '「ほんだし®/烹大師®」鰹魚風味能夠緩和白蘿蔔泥的酸味與辛辣。', '/uploads/higi/1578017328.jfif', '', 1, 6, 0, 0, '', '2020-01-03 10:08:48', 1, '2020-06-05 14:08:44', 2),
(18, '高湯煎蛋捲', '/uploads/product/1578023207.jfif', '', '在蛋裡 加入「ほんだし®/烹大師®」昆布風味＋水(溫水)', '只需煎熟，即可輕鬆製作高湯煎蛋捲。', 174, 3, '蛋', '日式', '配菜', '■標準用量：,4顆蛋內加入水80c.c.+「ほんだし®/烹大師®」昆布風味6g,■注意事項：,用熱水溶解「ほんだし®/烹大師®」昆布風味，放涼後加入蛋裡。', '', '', '', 0, 56, 0, 0, '', '2020-01-03 11:46:48', 1, '2020-12-31 02:40:17', 2),
(19, '涮肉片沙拉', '/uploads/product/1578023282.jfif', '', '先將豬腰肉片 加入「ほんだし®/烹大師®」昆布風味的熱水中預煮', '即能抑制肉的腥味，增添甜味。', 175, 3, '豬肉', '日式', '配菜', ',■標準用量：,熱水500cc加入「ほんだし®/烹大師®」昆布風味5g', '請別將水煮沸，依序汆燙每一片肉，豬肉就不會收縮，汆燙後用冰水冰鎮。', '/uploads/higi/1578023284.jfif', '', 0, 11, 0, 0, '', '2020-01-03 11:48:04', 1, '2021-02-23 10:12:25', 2),
(20, '昆布淺漬', '/uploads/product/1578023412.jfif', '', '只需在蔬菜中加入「ほんだし®/烹大師®」昆布風味', '攪拌後醃漬，即能製作昆布風味的淺漬。', 176, 3, '葉菜類', '日式', '配菜', ',■標準用量：,蔬菜100g加入「ほんだし®/烹大師®」昆布風味5g', '', '', '', 0, 138, 0, 0, '', '2020-01-03 11:50:13', 1, '2021-03-04 17:58:20', 2),
(21, '香蒜辣椒義大利麵', '/uploads/product/1578023480.jfif', '', '只需在義大利麵內加入「ほんだし®/烹大師®」昆布風味翻炒即可', '義大利麵的新‧萬能調味料', 0, 3, '其他', '西式', '主食', ',■標準用量：,義大利麵250g＋「ほんだし®/烹大師®」昆布風味7g', '取代義大利麵的經典提味調味料「昆布茶」，適用於香蒜辣椒義大利麵等簡單的義大利麵。', '/uploads/higi/1578023818.', '', 0, 94, 0, 0, '', '2020-01-03 11:51:21', 1, '2021-03-29 14:24:46', 2),
(22, '海鮮咖哩', '/uploads/product/1578023870.jfif', '', '在綜合海鮮內使用加入「ほんだし®/烹大師®」昆布風味的熱水', '補充水煮時流失的鮮味', 177, 3, '海鮮類', '日式', '主食', ',■標準用量：,熱水500c.c.加入「ほんだし®/烹大師®」昆布風味5g', '', '', '', 0, 18, 0, 0, '', '2020-01-03 11:57:51', 1, '2021-02-23 10:18:46', 2),
(23, '炒烏龍麵', '/uploads/product/1578028230.jfif', '', '在最後一個步驟 加入「ほんだし®/烹大師®」昆布風味', '帶來香氣十足的溫潤風味', 0, 3, '其他', '日式', '主食', ',適當撒入「ほんだし®/烹大師®」昆布風味調味！', '料理示意圖', '/uploads/higi/1578028232.jfif', '', 1, 8, 0, 0, '', '2020-01-03 13:10:32', 1, '2020-11-25 16:32:37', 2),
(24, '筑前煮', '/uploads/product/1578028321.jfif', '', '在切好的雞腿肉  加入「ほんだし®/烹大師®」昆布風味揉入調味', '為雞肉預先調味，製作充滿高湯滋味的煮物。', 0, 3, '雞肉', '日式', '配菜', ',■標準用量：,肉1kg加入「ほんだし®/烹大師®」昆布風味5g', '料理示意圖', '/uploads/higi/1578028356.', '', 1, 6, 0, 0, '', '2020-01-03 13:12:02', 1, '2020-11-25 15:27:56', 2),
(25, '鹽烤物', '/uploads/product/1578028426.jfif', '', '解凍冷凍鯖魚後 以「ほんだし®/烹大師®」昆布風味＋水浸泡', '減少魚腥味，增添鮮味。', 178, 3, '海鮮類', '日式', '配菜', ',■標準用量：,水1L加入「ほんだし®/烹大師®」昆布風味5g', '浸泡30分鐘以上效果更佳！', '/uploads/higi/1578028428.jfif', '', 1, 4, 0, 0, '', '2020-01-03 13:13:48', 1, '2021-02-23 10:42:28', 2),
(26, '義大利麵醬汁-和風昆布芥末奶油', '/uploads/product/1578028647.jfif', '', '在奶油、芥末、檸檬汁裡 加入「ほんだし®/烹大師®」昆布風味', '調配獨特的和風昆布芥末奶油。', 179, 3, '海鮮類', '日式', '主食', ',■標準用量：,約10份／200g：奶油120g、芥末30g、檸檬汁20ml、「ほんだし®/烹大師®」昆布風味30g。,■注意事項：,「ほんだし®/烹大師®」昆布風味5g的風味與鮮味，可以緩和味道強烈的芥末奶油，用保鮮膜包住冷凍保存，要使用時再切下需要的份量。', '', '', '', 0, 36, 0, 0, '', '2020-01-03 13:17:28', 1, '2020-12-18 11:26:45', 2),
(27, '酒蒸蛤蜊', '/uploads/product/1578028742.jfif', '', '只需在蛤蜊上蒸煮前，淋在「ほんだし®/烹大師®」昆布風味＋酒', '即能讓蛤蜊的鮮味倍增。', 180, 3, '海鮮類', '中式', '配菜', ',「ほんだし®/烹大師®」昆布風味與酒一起（趁還帶著水氣）灑上。', '', '', '', 1, 10, 0, 0, '', '2020-01-03 13:19:03', 1, '2020-11-25 16:26:30', 2),
(28, '冰鎮蕃茄', '/uploads/product/1578028843.jfif', '', '在冰鎮蕃茄上 噴上鮮味水(「味之素®」S高鮮味精＋水)', '即能提升蕃茄的鮮味', 181, 9, '瓜果類', '日式', '涼拌', ',■標準用量：,【調味鹽作法】以「1:1」比例，混合炒過去水的鹽與鮮味調味料「味之素」 S高鮮味精」。,■注意事項：,稍微用熱水汆燙蕃茄，放入冷水裡就能輕鬆剝皮。', '', '', '', 0, 16, 0, 0, '', '2020-01-03 13:20:45', 1, '2021-02-03 20:02:41', 2),
(29, '炒飯', '/uploads/product/1578042382.jfif', '', '在冷凍飯 噴上鮮味水(「味之素®」S高鮮味精＋水)', '補足解凍流失的鮮味！', 182, 9, '雞肉,海鮮類', '中式', '主食', '■標準用量：,200c.c.水加入「味之素®」S高鮮味精 6g,■注意事項：,可以用於提味，因此非常適合製作炒飯等配餐。', '', '', '', 0, 19, 0, 0, '', '2020-01-03 17:06:23', 1, '2021-04-20 08:31:08', 2),
(30, '烤雞腿', '/uploads/product/1578043986.jfif', '', '在雞腿肉 噴上「味之素®」S高鮮味精+鹽+酒', '烤雞腿更能提升雞肉鮮甜！', 0, 9, '雞肉', '中式', '配菜', ',■標準用量：,200c.c.酒加入「味之素®」S高鮮味精 4g、鹽10g', '料理示意圖', '/uploads/higi/1578043988.jfif', '', 0, 10, 0, 0, '', '2020-01-03 17:33:08', 1, '2021-02-23 10:12:45', 2),
(31, '炸雞翅', '/uploads/product/1578044061.jfif', '', '在炸雞翅 撒上「味之素®」S高鮮味精＋咖哩粉＋鹽', '輕鬆調味製作出香辣咖哩口味的炸雞翅', 0, 9, '雞肉', '中式', '涼拌', ',■標準用量：,「味之素®」S高鮮味精:鹽:咖哩粉:羅勒＝0.5:1:1:0.2', '', '/uploads/higi/1578044063.jfif', '料理示意圖', 0, 11, 0, 0, '', '2020-01-03 17:34:23', 1, '2021-02-23 10:18:54', 2),
(32, '餃子', '/uploads/product/1578044124.jfif', '', '提味時使用 「味之素®」S高鮮味精＋薑＋蒜＋ 醬油＋鹽＋胡椒', '利用調味料增加味道的豐富度', 0, 9, '豬肉', '中式', '主食', '', '料理示意圖', '/uploads/higi/1578044126.jfif', '', 1, 2, 0, 0, '', '2020-01-03 17:35:26', 1, '2020-04-08 14:20:11', 7),
(33, '烤雞', '/uploads/product/1578044184.jfif', '', '在雞胸肉裡 揉入「味之素®」S高鮮味精＋沙拉油＋水 ', '補足鮮味、打造多汁口感', 0, 9, '雞肉', '中式', '配菜', ',■標準用量：,「味之素®」S高鮮味精：沙拉油：水＝1：1：10', '料理示意圖', '/uploads/higi/1578044186.jfif', '', 1, 5, 0, 0, '', '2020-01-03 17:36:26', 1, '2020-04-21 18:22:02', 2),
(34, '天麩羅調味鹽', '/uploads/product/1578044251.jfif', '', '只需混合 鹽與「味之素®」S高鮮味精', '即能襯托天麩羅食材的鮮味', 0, 9, '其他', '其他', '其他', ',■標準用量：,鹽10g加入「味之素®」S高鮮味精3g', '料理示意圖', '/uploads/higi/1578044253.jfif', '', 1, 3, 0, 0, '', '2020-01-03 17:37:33', 1, '2020-04-21 18:22:09', 2),
(35, '飾菜（燒肉）', '/uploads/product/1578044332.jfif', '', '在冷凍青花椰菜 噴上鮮味水(「味之素®」S高鮮味精＋水) 再蒸煮', '不會像水煮一樣軟爛，還能增添鮮甜味', 0, 9, '葉菜類', '中式', '配菜', ',■標準用量：,水1L加入「味之素®」S高鮮味精10g', '料理示意圖', '/uploads/higi/1578044334.jfif', '', 1, 5, 0, 0, '', '2020-01-03 17:38:54', 1, '2021-03-30 15:43:36', 2),
(36, '蒸煮雞', '/uploads/product/1578044430.jfif', '', '在雞胸肉裡 拌入「味之素®」S高鮮味精＋酒再蒸煮', '製作無腥味的清蒸雞肉', 0, 9, '雞肉', '中式', '配菜', ',■標準用量：,「味之素®」S高鮮味精4g、200cc酒', '料理示意圖', '/uploads/higi/1578044432.jfif', '', 1, 7, 0, 0, '', '2020-01-03 17:40:32', 1, '2020-12-10 17:03:48', 2),
(37, '炒帆立貝', '/uploads/product/1578044584.jfif', '', '在冷凍帆立貝 噴上鮮味水(「AJI-NO-MOTO® PLUS®」高鮮味精1KG＋水)', '補足解凍流失的鮮味', 183, 8, '海鮮類', '中式', '配菜', ',■標準用量：,水200c.c.加入「AJI-NO-MOTO® PLUS®」高鮮味精1KG3g', '', '', '', 0, 98, 0, 0, '', '2020-01-03 17:43:05', 1, '2021-04-08 21:16:52', 2),
(38, '蒲燒鰻魚', '/uploads/product/1578044641.jfif', '', '將蒲燒鰻魚 浸入「味之素®」S高鮮味精＋綠茶後，再次燒烤', '能降低鰻魚特有的腥味 烤出鬆軟口感', 0, 9, '海鮮類', '日式', '配菜', ',■標準用量：,綠茶500c.c.加入「味之素®」S高鮮味精 2g', '', '/uploads/higi/1578044643.jfif', '', 1, 4, 0, 0, '', '2020-01-03 17:44:03', 1, '2020-04-21 18:19:12', 2),
(39, '炸豬排', '/uploads/product/1578044712.jfif', '', '在豬腰肉 撒上調味鹽(「味之素®」S高鮮味精｣＋鹽）', '使用最適合的調味鹽提味', 184, 9, '豬肉', '日式', '配菜', ',■標準用量：,「味之素®」S高鮮味精：鹽＝1：1,■注意事項：,【調味鹽作法】以「1:1」比例，混合炒過去水的鹽與「味之素」S高鮮味精', '', '', '', 1, 5, 0, 0, '', '2020-01-03 17:45:13', 1, '2020-12-15 10:49:27', 2),
(40, '法式奶油烤鮭魚排', '/uploads/product/1578044765.jfif', '', '在冷凍鮭魚 噴上鮮味酒（「味之素®」S高鮮味精＋酒）', '降低鮭魚特有的油脂腥味', 185, 9, '海鮮類', '西式', '配菜', ',■標準用量：,水100c.c.、酒100c.c.、「味之素®」S高鮮味精4g', '', '', '', 1, 10, 0, 0, '', '2020-01-03 17:46:06', 1, '2020-04-08 14:17:11', 7),
(41, '炸花枝', '/uploads/product/1578044839.jfif', '', '將冷凍花枝捲 使用鮮味水(「味之素®」S高鮮味精＋水)清洗', '降低腥臭味', 186, 9, '海鮮類', '中式', '配菜', ',■標準用量：,水1L加入「味之素®」S高鮮味精 20g', '', '', '', 1, 7, 0, 0, '', '2020-01-03 17:47:20', 1, '2020-04-08 14:16:45', 7),
(42, '炸牡蠣', '/uploads/product/1578044920.jfif', '', '在冷凍牡蠣 沾上鮮味牛奶(「味之素®」S高鮮味精＋牛奶)', '能降低腥臭味，襯托牡蠣鮮味，創造濃郁口感。', 187, 9, '海鮮類', '中式', '配菜', ',■標準用量：,牛奶300c.c.加入「味之素®」S高鮮味精 3g', '', '', '', 1, 5, 0, 0, '', '2020-01-03 17:48:41', 1, '2021-02-23 10:42:12', 2),
(43, '海鮮沙拉', '/uploads/product/1578045517.jfif', '', '將冷凍水煮去殼蝦 使用鮮味水（「味之素®」S高鮮味精＋水）醃漬', '降低腥臭味，突顯鮮味。', 188, 9, '海鮮類', '西式', '配菜', ',■標準用量：,水1L加入「味之素®」S高鮮味精 10g', '醃漬1小時以上效果更佳', '/uploads/higi/1578045519.jfif', '', 1, 2, 0, 0, '', '2020-01-03 17:58:39', 1, '2020-04-08 14:16:05', 7),
(44, '燙青菜', '/uploads/product/1578045605.jfif', '', '青菜汆燙後 用鮮味水(「味之素®」S高鮮味精」＋水)的冰水冰鎮', '去除青菜澀味並增添甜味', 189, 9, '葉菜類', '中式', '配菜', ',■標準用量：,冰水1L加入「味之素®」S高鮮味精 10g', '最適合用於剛進入產季的青菜！', '/uploads/higi/1578045699.', '', 1, 8, 0, 0, '', '2020-01-03 18:00:08', 1, '2020-04-21 18:21:44', 2),
(45, '烤螃蟹', '/uploads/product/1578045674.jfif', '', '在冷凍螃蟹 噴上鮮味水（「味之素®」S高鮮味精＋水）', '補足解凍流失的鮮味，增加甜味。', 0, 9, '海鮮類', '日式', '配菜', ',■標準用量：,水1L加入「味之素®」S高鮮味精 10g', '料理示意圖', '/uploads/higi/1578045676.jfif', '', 1, 2, 0, 0, '', '2020-01-03 18:01:16', 1, '2020-06-01 09:54:32', 7),
(46, '醋飯', '/uploads/product/1578045782.jfif', '', '在白飯裡拌入「味之素®」S高鮮味精」＋壽司醋（醋＋砂糖）', '能消除醋的刺激味道，創造溫潤好滋味。', 190, 9, '其他', '其他', '主食', ',■標準用量：,醋100c.c.加入「味之素®」S高鮮味精3g,■注意事項：,使用這項訣竅的話，就連穀物醋都能製作出溫潤的醋飯。', '', '', '', 1, 3, 0, 0, '', '2020-01-03 18:03:03', 1, '2020-04-08 14:15:23', 7),
(47, '油封砂囊', '/uploads/product/1578045975.jfif', '', '在砂囊 撒上 「味之素®」S高鮮味精＋鹽', '靜置後用油封烹調後，簡單保存', 0, 9, '雞肉', '中式', '配菜', ',■標準用量：,砂囊：「味之素®」S高鮮味精 ：鹽＝500g：3g：10g', '可冷凍保存或冷藏保存，且連同油一起保存。可使用烹煮用的油製作義大利麵等料理。', '/uploads/higi/1578045977.jfif', '', 1, 5, 0, 0, '', '2020-01-03 18:06:17', 1, '2020-04-08 14:14:13', 7),
(48, '毛豆', '/uploads/product/1578046078.jfif', '', '將冷凍毛豆 使用鮮味水(「味之素®」S高鮮味精＋水)解凍', '使用鮮味水解凍後撒上鹽　提升鮮甜感', 191, 9, '豆類', '日式', '涼拌', ',■標準用量：,水1L加入「味之素®」S高鮮味精 4g', '', '', '', 1, 8, 0, 0, '', '2020-01-03 18:07:59', 1, '2020-04-08 14:14:00', 7),
(49, '醃五花肉', '/uploads/product/1592189568.jpg', '', '將AJINOMOTO PLUS高鮮味精放入豬肉塊抓醃 ', '鮮味增倍，添加濃厚口感 ', 217, 8, '豬肉', '中式', '配菜', ',■標準用量：,肉1kg對「AJI-NO-MOTO® PLUS®」高鮮味精4g ', '', '', '', 0, 72, 0, 0, '', '2020-06-15 10:52:49', 7, '2021-04-24 11:29:31', 2);

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
  `c_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '操作時間'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `login_member`
--

CREATE TABLE `login_member` (
  `member_id` int(11) NOT NULL COMMENT '會員編號',
  `token` varchar(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '存取權杖',
  `login_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '登入時間'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `login_member`
--

INSERT INTO `login_member` (`member_id`, `token`, `login_time`) VALUES
(1, 'C0B98449-8530-26CC-C1D2-C957E4B3A8F8', '2020-01-02 16:59:25'),
(2, '48B67254-1EF6-8190-15D9-48FC25EA3B88', '2021-03-30 15:43:32'),
(3, '9C6BE612-05D3-DF3F-5E6E-895BE76D2CB5', '2020-04-21 18:21:15'),
(5, '7B2E5B78-C5C8-FCAE-758C-08E8EF2159A3', '2020-05-14 17:05:21'),
(4, 'B9BBE65C-BB56-A2C1-E427-6A6C5777240B', '2020-05-11 17:29:53'),
(8, '0946BA14-F633-8F12-ABCA-A1344B5250AC', '2020-06-05 14:08:01'),
(10, 'C9541852-64A5-6328-75A9-64A46A6234DC', '2020-07-28 23:13:21'),
(12, '62A6796C-16AD-FBB6-C297-1F8E59F6B88F', '2020-10-09 19:36:24'),
(14, 'D13F4ADF-CFAA-D00F-2592-3E090877046B', '2020-11-06 10:40:27'),
(15, 'B102B81D-FBA5-44E4-143E-578109F7A7D7', '2020-11-09 12:15:09'),
(16, '54C56070-C34B-8CF9-E3DB-3CA90F79F8C8', '2020-11-28 09:30:07'),
(17, 'D59A207C-BDAF-897A-0443-35AF65E07822', '2021-01-07 00:29:16'),
(18, 'A69E6122-65E4-26A4-DAF0-87969D4B9989', '2021-01-27 12:07:05'),
(21, '63A30307-DAA6-5AA4-97CE-8F15BF18538E', '2021-03-14 21:08:21'),
(22, '823DFF24-26EE-1978-DF9E-D3C5E1E18B2D', '2021-03-26 02:04:30'),
(23, '2BAE7596-CD48-FDEF-90CC-AFBD32AAA319', '2021-04-12 10:37:20');

-- --------------------------------------------------------

--
-- 資料表結構 `login_user`
--

CREATE TABLE `login_user` (
  `user_id` int(11) NOT NULL COMMENT '使用者編號',
  `token` varchar(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '存取權杖',
  `login_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '登入時間'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `login_user`
--

INSERT INTO `login_user` (`user_id`, `token`, `login_time`) VALUES
(1, '60C0E122-BF5A-2418-264C-8941F8326913', '2019-12-20 14:02:30'),
(2, 'A61E41A7-4BF0-09B2-F78D-06C40C3A623B', '2019-12-24 17:22:05'),
(7, '587E4444-75B7-2C13-4F0B-A6FEA159D7CE', '2021-05-14 15:04:12');

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
  `c_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '建立時間',
  `c_user_id` int(11) NOT NULL COMMENT '建立使用者編號',
  `u_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '修改時間',
  `u_user_id` int(11) NOT NULL COMMENT '修改使用者編號'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `member`
--

INSERT INTO `member` (`id`, `account`, `password`, `verification`, `name`, `gender`, `birthday`, `phone`, `restaurant_name`, `restaurant_area_id`, `restaurant_type`, `last_login_time`, `last_login_ip`, `status`, `remark`, `c_time`, `c_user_id`, `u_time`, `u_user_id`) VALUES
(1, 'kenny@ks-design.com.tw', 'r2haDrSJg9GxUY4pNZxGtg==', 'B5E19306-6091-F5F0-DC1B-6E037EB35CC1', '李肯尼', 1, NULL, '0955056706', '凱斯', 11, '中式', '2020-01-02 16:59:25', '219.84.199.61', 0, '', '2020-01-02 16:58:17', 2, '2020-01-02 16:58:17', 2),
(2, 'gemma@ajinomoto.com.tw', 'Bq3B5sunjL4zE7Uk17R3YQ==', '0D5C1882-3B63-2197-200B-5513C009B726', '郭育瑄', 1, NULL, '23962028', '台灣味之素', 8, '中式', '2021-03-30 15:43:32', '219.84.199.61', 0, '', '2020-04-10 13:49:58', 2, '2020-04-10 13:49:58', 2),
(3, 'komcom1845@gmail.com', '4syUjY9U4Fxrg0up98i9Ag==', '39414945-DCB5-D74E-41F9-9B3673299CF6', '張明忠', 1, NULL, '0980414199', '夯一鍋', 116, '火鍋', '2020-04-21 18:21:15', '219.84.199.61', 0, '', '2020-04-21 17:59:40', 2, '2020-04-21 17:59:40', 2),
(4, 'mickeymouseonly@hotmail.com', 'GG+/c55EQK8fPNnEFUsk7g==', '56A23F2A-236F-F184-6878-D3661E875CD1', '黃柏元', 1, NULL, '0936937890', '美好食光', 49, '中式', '2020-05-11 17:29:53', '219.84.199.61', 0, '', '2020-05-11 16:51:15', 2, '2020-05-11 16:51:15', 2),
(5, 'edwina0301@yahoo.com.tw', 'gQJmiwMhDG/+j3d5X7QSDA==', 'F8C7E36D-4970-049D-C979-E31673CA22E8', '戴姿涵', 2, NULL, '0225097776', '榕樹下麵攤', 131, '中式', '2020-05-14 17:05:21', '219.84.199.61', 0, '', '2020-05-11 17:05:53', 2, '2020-05-11 17:05:53', 2),
(6, 'a0970657939@gmail.com', 'EcxCoF8Yg/zqYr62m3Gawg==', 'F7D5A127-C6D7-E5E9-B6F4-E9B3B3F827F0', '蔡韻璇', 2, NULL, '0970657939', '大哥廚房', 11, '複合', NULL, NULL, 1, '', '2020-05-11 17:31:57', 2, '2020-05-11 17:31:57', 2),
(7, 'shinichiro_yamashita@ajinomoto.com', 'azb0ZW6eYevsHxirxmPB9Q==', '55C840ED-053A-91CB-FF0E-3FB72DDE8061', '山下真一朗', 1, NULL, '09052057358', 'なし', 8, '日式', NULL, NULL, 0, '', '2020-06-03 11:46:48', 2, '2020-06-03 11:46:48', 2),
(8, 'barbie881012@gmail.com', 'KLMW+RWShF2wvUMFE4jPCA==', '9D5F535A-1E6D-BED7-2D89-2362D6B5C0C3', '蔡宗憲', 1, NULL, '0933021925', '天天小館', 191, '中式', '2020-06-05 14:08:01', '219.84.199.61', 0, '', '2020-06-05 14:04:33', 2, '2020-06-05 14:04:33', 2),
(9, 'mendy6910@gmail.com', 'xBCc49wOBSJaXiSDjuWNYQ==', '3BAA065B-7367-502D-403B-52F1B6569E4B', '陳天翔', 1, NULL, '0921360147', '小龍商行', 138, '中式', NULL, NULL, 0, '', '2020-06-29 08:16:55', 2, '2020-06-29 08:16:55', 2),
(10, 'baby_5068@yahoo.com.tw', '37hlacHd1ZaQBxfFkkiDqA==', 'C7696EAC-8C0A-A607-00C1-CFA7769288C6', '張芯語', 2, NULL, '0935965068', '關東煮-餐車', 2, '日式', '2020-07-28 23:13:21', '219.84.199.61', 0, '', '2020-07-28 23:11:10', 2, '2020-07-28 23:11:10', 2),
(11, 'seven777jn777@gmail.com', 'Y4HImPYcKUK1ND8FKMkhqg==', '90464764-5E51-2BCA-62D2-06BB14C523FA', '楊智傑', 1, NULL, '0916916225', '焱馬號', 26, '中式', NULL, NULL, 0, '', '2020-09-10 16:47:27', 2, '2020-09-10 16:47:27', 2),
(12, 'migoesnp@gmail.com', 'uXxJ6UpKdahGzC9vBlHfSA==', '687199DE-53B2-0CCE-F540-0D344B9EEB98', '陳文倩', 2, NULL, '0976463918', '福來東咖啡', 343, '日式', '2020-10-09 19:36:24', '219.84.199.61', 0, '', '2020-10-09 19:32:13', 2, '2020-10-09 19:32:13', 2),
(13, 'allure0629@gmail.com', 'aa+yU0tjAX4YwAqkRknDMw==', '0D1270EB-EC42-1C48-1862-A6CB41D3588B', '許雅淳', 2, NULL, '0925189581', '米盒屋手作餐盒', 255, '中式', NULL, NULL, 1, '', '2020-10-10 11:12:08', 2, '2020-10-10 11:12:08', 2),
(14, 'tenii180606@gmail.com', 'fj2OBrqdkcY3z79e6Bfyew==', 'F2CB01BC-9FAA-CC31-956C-AEFAC8EF6AF0', '田義食品', 1, NULL, '037-854287', '田義食品股份有限公司', 95, '複合', '2020-11-06 10:40:27', '219.84.199.61', 0, '', '2020-11-06 10:39:56', 2, '2020-11-06 10:39:56', 2),
(15, 'vincent8171@yahoo.com.tw', 'cJcDoErEfxvq55iSwzfZww==', 'A8BBB028-99A3-0A3B-68FA-94CE7C6F0DAA', '陳國志', 1, NULL, '032115184', '珍天下', 57, '複合', '2020-11-09 12:15:09', '219.84.199.61', 0, '', '2020-11-09 12:13:34', 2, '2020-11-09 12:13:34', 2),
(16, 'yuehtinglee57@gmail.com', '9dIGRtQy2NlksDDUwVCc3Q==', 'D12822D5-C203-CEEF-ED16-BE1A864F72B4', '李岳庭', 1, NULL, '0922910808', '菁手作', 255, '中式', '2020-11-28 09:30:07', '219.84.199.61', 0, '', '2020-11-28 09:25:30', 2, '2020-11-28 09:25:30', 2),
(17, 'gomr31792566@gmail.com', 'eh0gS+YMwTF1DA458pJvDw==', 'CEECD070-941D-AE9F-C055-1E4A7ADACDFF', '陳依琳', 2, NULL, '0985815339', '歐樂米', 144, '複合', '2021-01-07 00:29:16', '219.84.199.61', 0, '', '2021-01-07 00:28:26', 2, '2021-01-07 00:28:26', 2),
(18, 'z755147@gmail.com', 'tPfWjY25WirW5BIbILjJXw==', 'D60FE915-30FA-8CAD-4A82-340CCD7ED86D', '曾任弘', 1, NULL, '0960699016', '鳳弘泰越商店', 57, '中式', '2021-01-27 12:07:05', '219.84.199.61', 0, '', '2021-01-17 11:20:49', 2, '2021-01-17 11:20:49', 2),
(19, 'a0926607509@gmail.com', 'dPT8tfljy8CP9Yu0ACym+w==', '05F85A21-E5B3-00A6-167D-CD4501526F36', '邱宥翔', 1, NULL, '0926606509', '佐佐木料理館', 291, '日式', NULL, NULL, 1, '', '2021-02-22 11:23:07', 2, '2021-02-22 11:23:07', 2),
(20, 'yolanda@ajinomoto.com.tw', 'Hj4bpqXrU/isu2dMsv/tdQ==', 'D7E89696-C945-FD8D-BA47-200DD128BD48', 'Yolanda Chen', 1, NULL, '23062028', 'aaaa', 8, '中式', NULL, NULL, 0, '', '2021-02-23 09:01:31', 2, '2021-02-23 09:01:31', 2),
(21, 'yulike521@yahoo.com.tw', 'zB3zoaB4WTBGGhuVeL6mWA==', '43ACE605-EA3A-0E54-03D2-72B031DBB1FB', '朱玉如', 2, NULL, '0963750393', '椿萱雅集', 62, '複合', '2021-03-14 21:08:21', '219.84.199.61', 0, '', '2021-03-14 21:07:17', 2, '2021-03-14 21:07:17', 2),
(22, 'daniel9549@gmail.com', 'siFiurI2tGg021j30hPEDg==', '3A0316BC-DAA7-36A8-5931-676F74B67489', '王彥文', 1, NULL, '0912520502', '沐府Nabemono', 65, '火鍋', '2021-03-26 02:04:31', '219.84.199.61', 0, '', '2021-03-26 02:03:44', 2, '2021-03-26 02:03:44', 2),
(23, 'st920238@gmail.com', 'fHG5Kwh0h9ru1AhIAXGI8A==', '07D225B0-59A0-EB2D-F661-88CF996DC33A', '鍾綺芳', 2, NULL, '0912391448', '起家雞', 21, '連鎖體系', '2021-04-12 10:37:20', '219.84.199.61', 0, '', '2021-04-12 10:22:24', 2, '2021-04-12 10:22:24', 2);

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
(5, 37);

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
,`methods` text
,`note` text
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
,`product_names` mediumtext
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
  `c_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '建立時間	',
  `c_user_id` int(11) NOT NULL COMMENT '建立使用者編號',
  `u_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '修改時間	',
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
(20, 0, '標籤', 'tag_list.php', 'fa fa-tags', '', 800, 0, '', '2019-11-19 09:49:47', 0, '2019-11-19 09:54:47', 0),
(21, 20, '食材', 'tag1_list.php', 'fa fa-tag', '89,90,91,92,93,94,95,96', 810, 0, '', '2019-12-18 17:54:20', 0, '2019-12-18 18:28:15', 0),
(22, 20, '菜色', 'tag2_list.php', 'fa fa-tag', '89,90,91,92,93,94,95,96', 820, 0, '', '2019-12-18 17:55:20', 0, '2019-12-18 18:28:16', 0),
(23, 20, '菜式', 'tag3_list.php', 'fa fa-tag', '89,90,91,92,93,94,95,96', 830, 0, '', '2019-12-18 17:55:51', 0, '2019-12-18 18:28:17', 0),
(24, 20, '材料單位', 'tag4_list.php', 'fa fa-tag', '89,90,91,92,93,94,95,96', 840, 0, '', '2019-12-18 17:56:18', 0, '2019-12-18 18:28:19', 0);

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
  `c_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '建立時間',
  `c_user_id` int(11) NOT NULL COMMENT '建立使者編號',
  `u_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '修改時間',
  `u_user_id` int(11) NOT NULL COMMENT '修改使用者編號'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `product`
--

INSERT INTO `product` (`id`, `brand_id`, `name`, `pic_urls`, `pic_alts`, `tag`, `content`, `tips`, `information`, `mark`, `list_order`, `status`, `remark`, `c_time`, `c_user_id`, `u_time`, `u_user_id`) VALUES
(1, 1, '「ほんだし®」鰹魚風味1KG', '/uploads/product/1618473533.png', '', '讓味道有了深度', '「ほんだし&reg;/烹大師&reg;」鰹魚風味自1970年開始販售以來一直是日本味之素公司的人氣商品之一。素材使用太平洋赤道附近海域捕獲之鰹魚，立即以低溫-20度&deg;C冷凍保存，運至日本燒津等港口上岸後，再經由專家嚴選，採用獨家製成乾燻鰹魚。被挑中的鰹魚脂肪含量低、品質絕佳，經過嚴謹的品質、衛生管理及加工後，再經過耐心地烘焙，製成「ほんだし&reg;/烹大師&reg;」鰹魚風味，具獨特的香氣與風味。「ほんだし&reg;/烹大師&reg;」鰹魚風味無論是烹調蔬菜、海鮮、肉類等不同食材，皆能完美引出食材原有風味；適各式炒、湯、火鍋等料理，提升鮮美的層次，讓您同時調理出美味與健康。', '「ほんだし&reg;/烹大師&reg;」鰹魚風味自1970年在日本推出以來，始終秉持著三項堅持:香氣、醇度、美味，用於料理能有效提引並調和食材原本的風味。而獨特的顆粒狀產品設計，具有味道均衡、易溶解、保存性佳等特點，方便好用，不僅是家庭主婦的好幫手，也是飯店餐廳調味時的最佳選擇。', '<ul class=\"product-info-box p-a0\">\r\n	<li class=\"d-flex \"><span class=\"title\">原料</span><span class=\"text\">調味劑(L-麩酸鈉、5&#39;-次黃嘌呤核苷磷酸二鈉、琥珀酸二鈉)、食鹽、乳糖、砂糖、乾燻鰹魚、鰹魚抽出物、酵母抽出物、D-木糖、麥芽糖、葡萄糖、糊精</span></li>\r\n	<li class=\"d-flex \"><span class=\"title\">使用方法</span><span class=\"text\">7公克可調理成1000c.c.的高湯</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">淨重</span><span class=\"text\">1公斤</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">原產地</span><span class=\"text\">日本國神奈川縣</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品包裝</span><span class=\"text\">1kgx12袋/箱</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品條碼</span><span class=\"text\">4901001375431</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">外箱尺寸</span><span class=\"text\">506x286x234mm</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存期限</span><span class=\"text\">24個月(常溫未開封狀態下) </span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">注意事項</span><span class=\"text\">本產品含奶類、魚類及其製品</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存方法</span><span class=\"text\">開封後，為了避免受潮，請密封存放於乾燥通風處，以確認產品的最佳風味及品質。 </span></li>\r\n</ul>\r\n', '<ul class=\"info-box p-a0\">\r\n	<li class=\"d-flex\"><span class=\"title\">每一份量</span><span class=\"text\">1公克</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">本包裝含</span><span class=\"text\">1000份</span></li>\r\n</ul>\r\n\r\n<ul class=\"product-info-box p-a0\">\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\"></span><span class=\"text-e\">每份</span><span class=\"text-h\">每100公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">熱量</span><span class=\"text-e\">2.3大卡</span><span class=\"text-h\">234大卡</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">蛋白質</span><span class=\"text-e\">0.2公克</span><span class=\"text-h\">23.9公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">脂肪</span><span class=\"text-e\">0.01公克</span><span class=\"text-h\">1.1公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">&nbsp;&nbsp;&nbsp;&nbsp;飽和脂肪</span><span class=\"text-e\">0.01公克</span><span class=\"text-h\">0.5公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">&nbsp;&nbsp;&nbsp;&nbsp;反式脂肪</span><span class=\"text-e\">0公克</span><span class=\"text-h\">0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">碳水化合物</span><span class=\"text-e\">0.3公克</span><span class=\"text-h\">32.1公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">&nbsp;&nbsp;&nbsp;&nbsp;糖</span><span class=\"text-e\">0.2公克</span><span class=\"text-h\">21.9公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">鈉</span><span class=\"text-e\">175毫克</span><span class=\"text-h\">17514毫克</span></li>\r\n</ul>\r\n', 1, 0, '', '2019-12-24 11:32:28', 1, '2021-04-27 09:47:04', 7),
(2, 1, '「ほんだし®」干貝風味500G', '/uploads/product/1618473575.png', '', '嚴選干貝 甘甜幸福味', '具有濃厚鮮味的干貝，一向是傳統海鮮乾貨的代表。不論是入菜或是製成湯頭，都常見於中華料理中。然而，因為使用前處理繁瑣而且無法隨取隨用，再加上價格昂貴，造成一般使用上的諸多不便。「 ほんだし&reg; / 烹大師&reg; 」干貝風味為嚴選高級干貝研製而成的調味料。不需經過繁複的處理，即可享受干貝原始的甘甜鮮美。適用於各式家常料理，可輕鬆提引出食材原有的風味，只要添加一小匙，就能讓餐桌上的每道佳餚充滿幸福的心意。', '「ほんだし&reg;/烹大師&reg;」干貝風味，使用嚴選並於長時間乾燥後製成之干貝作為原料，保留了干貝最原始的濃郁風味及鮮味，不必經過浸泡等處理，即可直接享受到干貝之自然甘甜風味！', '<ul class=\"product-info-box p-a0\">\r\n	<li class=\"d-flex \"><span class=\"title\">原料</span><span class=\"text\">調味劑(L-麩酸鈉、DL-胺基丙酸、琥珀酸二鈉、5&#39;-次黃嘌呤核苷磷酸二鈉、5&#39;-鳥嘌呤核苷磷酸二鈉)、食鹽、蔗糖、玉米澱粉、干貝粉、酵母抽出物、扇貝抽出物、糊精</span></li>\r\n	<li class=\"d-flex \"><span class=\"title\">使用方法</span><span class=\"text\">10公克可調理成1000c.c.的高湯</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">淨重</span><span class=\"text\">500公克</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">原產地</span><span class=\"text\">中國上海</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品包裝</span><span class=\"text\">500gx12盒/箱</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品條碼</span><span class=\"text\">6933544300128</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">外箱尺寸</span><span class=\"text\">412x242x205mm</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存期限</span><span class=\"text\">18個月(常溫未開封狀態下)</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">注意事項</span><span class=\"text\">本產品生產製程之設備有處理甲殼類、奶類、蛋、麩質穀物類、大豆、魚類及其製品。</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存方法</span><span class=\"text\">本產品是萃取干貝精華研製而成。開封後，為了避免受潮，請密封存放於乾燥通風處，以確保產品的最佳風味及品質。 </span></li>\r\n</ul>\r\n', '<ul class=\"info-box p-a0\">\r\n	<li class=\"d-flex\"><span class=\"title\">每一份量</span><span class=\"text\">1公克</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">本包裝含</span><span class=\"text\">500份</span></li>\r\n</ul>\r\n\r\n<ul class=\"product-info-box p-a0\">\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\"></span><span class=\"text-e\">每份</span><span class=\"text-h\">每100公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">熱量</span><span class=\"text-e\">2.3大卡</span><span class=\"text-h\">226大卡</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">蛋白質</span><span class=\"text-e\">0.3公克</span><span class=\"text-h\">29.8公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">脂肪</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.4公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">&nbsp;&nbsp;&nbsp;&nbsp;飽和脂肪</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.1公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">&nbsp;&nbsp;&nbsp;&nbsp;反式脂肪</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">碳水化合物</span><span class=\"text-e\">0.3公克</span><span class=\"text-h\">25.7公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">&nbsp;&nbsp;&nbsp;&nbsp;糖</span><span class=\"text-e\">0.1公克</span><span class=\"text-h\">8.7公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">鈉</span><span class=\"text-e\">160毫克</span><span class=\"text-h\">16044毫克</span></li>\r\n</ul>\r\n', 2, 0, '', '2019-12-24 11:37:36', 1, '2021-04-27 09:47:59', 7),
(3, 1, '「ほんだし®」昆布風味500G', '/uploads/product/1577159664.png', '', '嚴選北海道真昆布', '「昆布」為日本普遍使用之高湯原料，種類眾多，有真昆布、羅臼昆布、利尻昆布、日高昆布等，其中有「昆布之王」美譽的真昆布，其肉質寬厚，一直是最適合熬煮高湯的食材選擇。「ほんだし&reg;/烹大師&reg;」昆布風味使用嚴選北海道品質最優良的真昆布精製而成，可調製出風味高雅而清澄的高湯；口感溫順鮮甜，能提引出食材原有風味，是最適合烹調素食料理的高品質調味料。也是烹調湯品、炒菜類或涼拌小菜時的最佳選擇。', '「ほんだし&reg;/烹大師&reg;」昆布風味使用嚴選北海道「真昆布」製成，保留了昆布上方不易保存的白色粉末「D-甘露醇」，自然呈現最接近昆布高湯的清澄風味！', '<ul class=\"product-info-box p-a0\">\r\n	<li class=\"d-flex \"><span class=\"title\">原料</span><span class=\"text\">調味劑(L-麩酸鈉、氯化鉀、5&#39;-次黃嘌呤核苷磷酸二鈉、5&#39;-鳥嘌呤核苷磷酸二鈉、琥珀酸二鈉)、食鹽、砂糖、D-甘露醇（甜味劑）、昆布粉、糊精、昆布抽出物</span></li>\r\n	<li class=\"d-flex \"><span class=\"title\">使用方法</span><span class=\"text\">7公克可調理成1000c.c.的高湯</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">淨重</span><span class=\"text\">500公克</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">原產地</span><span class=\"text\">日本國三重縣</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品包裝</span><span class=\"text\">500gx12袋/箱</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品條碼</span><span class=\"text\">4901001375486</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">外箱尺寸</span><span class=\"text\">410x220x175mm</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存期限</span><span class=\"text\">24個月(常溫未開封狀態下)</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">注意事項</span><span class=\"text\">D-甘露醇為昆布表面白色粉末物質之一，屬糖醇類的一種。</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存方法</span><span class=\"text\">本產品是萃取昆布精華研製而成。開封後，為了避免受潮，請密封存放於乾燥通風處，以確保產品的最佳風味及品質。 </span></li>\r\n</ul>\r\n', '<ul class=\"info-box p-a0\">\r\n	<li class=\"d-flex\"><span class=\"title\">每一份量</span><span class=\"text\">1公克</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">本包裝含</span><span class=\"text\">500份</span></li>\r\n</ul>\r\n\r\n<ul class=\"product-info-box p-a0\">\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\"></span><span class=\"text-e\">每份</span><span class=\"text-h\">每100公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">熱量</span><span class=\"text-e\">2.2大卡</span><span class=\"text-h\">217大卡</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">蛋白質</span><span class=\"text-e\">0.2公克</span><span class=\"text-h\">15.3公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">脂肪</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">&nbsp;&nbsp;&nbsp;&nbsp;飽和脂肪</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">&nbsp;&nbsp;&nbsp;&nbsp;反式脂肪</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">碳水化合物</span><span class=\"text-e\">0.4公克</span><span class=\"text-h\">38.9公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">&nbsp;&nbsp;&nbsp;&nbsp;糖</span><span class=\"text-e\">0.2公克</span><span class=\"text-h\">21.3公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">鈉</span><span class=\"text-e\">156毫克</span><span class=\"text-h\">15600毫克</span></li>\r\n</ul>\r\n', 3, 0, '', '2019-12-24 11:54:25', 1, '2020-03-31 17:33:49', 7),
(4, 1, '「ほんだし®」雞粉1KG', '/uploads/product/1618474142.png', '', '嚴選鮮雞原料', '「ほんだし&reg;/烹大師&reg;」雞粉由日本調味料專家味之素集團研發製造，先進國際生產技術及多項嚴格品質控制，提供消費者營養、安心的美味。「ほんだし&reg;/烹大師&reg;」雞粉選用高品質的自然鮮雞原料，運用現代工藝萃取原雞精華，展現出鮮雞的自然、香醇、鮮甜。採用專業生產技術，高品質粉末顆粒易溶解，可搭配於任何料理，自然提升菜餚的鮮甜美味。', '依照料理的不同需求，除了單一使用「ほんだし&reg;/烹大師&reg;」雞粉可增加食材的鮮味外，搭配「ほんだし&reg;/烹大師&reg;」系列調味料:鰹魚風味、干貝風味或昆布風味一起使用，可以互相搭配，達到相乘效果的美味應用。', '<ul class=\"product-info-box p-a0\">\r\n	<li class=\"d-flex \"><span class=\"title\">原料</span><span class=\"text\">食鹽、調味劑(L-麩酸鈉、5&rsquo;&ndash;次黃嘌呤核苷磷酸二鈉、5 &rsquo;&ndash;鳥嘌呤核苷磷酸二鈉)、玉米澱粉、麥芽糊精、糖、雞肉、雞湯、雞油、醬油、水解大豆蛋白、香料、酵母抽出物、油菜籽油、白胡椒粉、酵素水解小麥蛋白、玉米油、棕櫚油</span></li>\r\n	<li class=\"d-flex \"><span class=\"title\">使用方法</span><span class=\"text\">15公克可調理成1000c.c.的高湯</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">淨重</span><span class=\"text\">1公斤</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">原產地</span><span class=\"text\">台灣</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品包裝</span><span class=\"text\">1kgx6罐/箱</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品條碼</span><span class=\"text\">4711173780120</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">外箱尺寸</span><span class=\"text\">325x223x228mm</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存期限</span><span class=\"text\">18個月(常溫未開封狀態下)</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">注意事項</span><span class=\"text\">●開啟內蓋拉環時請垂直拉起，並請注意罐緣鋒利，避免割傷。<br />\r\n	●本產品含有大豆、小麥及其製品</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存方法</span><span class=\"text\">開封後，為了避免受潮，請密封存放於乾燥通風處，以確認產品的最佳風味及品質。 </span></li>\r\n</ul>\r\n', '<ul class=\"info-box p-a0\">\r\n	<li class=\"d-flex\"><span class=\"title\">每一份量</span><span class=\"text\">1公克</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">本包裝含</span><span class=\"text\">1000份</span></li>\r\n</ul>\r\n\r\n<ul class=\"product-info-box p-a0\">\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\"></span><span class=\"text-e\">每份</span><span class=\"text-h\">每100公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">熱量</span><span class=\"text-e\">2.1大卡</span><span class=\"text-h\">212大卡</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">蛋白質</span><span class=\"text-e\">0.1公克</span><span class=\"text-h\">13.8公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">脂肪</span><span class=\"text-e\">0.02公克</span><span class=\"text-h\">2.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">&nbsp;&nbsp;&nbsp;&nbsp;飽和脂肪</span><span class=\"text-e\">0.01公克</span><span class=\"text-h\">0.7公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">&nbsp;&nbsp;&nbsp;&nbsp;反式脂肪</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">碳水化合物</span><span class=\"text-e\">0.3公克</span><span class=\"text-h\">34.4公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">&nbsp;&nbsp;&nbsp;&nbsp;糖</span><span class=\"text-e\">0.04公克</span><span class=\"text-h\">3.5公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">鈉</span><span class=\"text-e\">181毫克</span><span class=\"text-h\">18100毫克</span></li>\r\n</ul>\r\n', 4, 0, '', '2019-12-24 11:58:20', 1, '2021-04-27 09:48:32', 7),
(5, 1, '「ほんだし®」雞粉2KG', '/uploads/product/1577164419.png', '', '嚴選鮮雞原料', '「ほんだし&reg;/烹大師&reg;」雞粉由日本調味料專家味之素集團研發製造，製程採用國際先進生產技術及嚴謹品質管理控制系統，提供顧客安心、安全的美味。「ほんだし&reg;/烹大師&reg;」雞粉選用高品質的自然鮮雞原料，運用現代工藝萃取原雞精華，展現出鮮雞的自然、香醇、鮮甜。採用專業生產技術，高品質粉末顆粒易溶解，可搭配於任何料理，自然提升菜餚的鮮甜美味。', '依照料理的不同需求，除了單一使用「ほんだし&reg;/烹大師&reg;」雞粉調味料可增加食材的鮮味外，搭配「ほんだし&reg;/烹大師&reg;」系列調味料:鰹魚風味、干貝風味或昆布風味一起使用，可以互相搭配，達到相乘效果的美味應用。', '<ul class=\"product-info-box p-a0\">\r\n	<li class=\"d-flex \"><span class=\"title\">原料</span><span class=\"text\">食鹽、調味劑(L-麩酸鈉、5&rsquo;&ndash;次黃嘌呤核苷磷酸二鈉、5 &rsquo;&ndash;鳥嘌呤核苷磷酸二鈉)、玉米澱粉、麥芽糊精、糖、雞肉、雞湯、雞油、醬油、水解大豆蛋白、香料、酵母抽出物、油菜籽油、白胡椒粉、酵素水解小麥蛋白、玉米油、棕櫚油</span></li>\r\n	<li class=\"d-flex \"><span class=\"title\">使用方法</span><span class=\"text\">15公克可調理成1000c.c.的高湯</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">淨重</span><span class=\"text\">2公斤</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">原產地</span><span class=\"text\">台灣</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品包裝</span><span class=\"text\">2kgx6袋/箱</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品條碼</span><span class=\"text\">4711173780151</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">外箱尺寸</span><span class=\"text\">422x342x167mm</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存期限</span><span class=\"text\">15個月(常溫未開封狀態下)</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">注意事項</span><span class=\"text\">本產品含有大豆、小麥及其製品</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存方法</span><span class=\"text\">開封後，為了避免受潮，請密封存放於乾燥通風處，以確認產品的最佳風味及品質。 </span></li>\r\n</ul>\r\n', '<ul class=\"info-box p-a0\">\r\n	<li class=\"d-flex\"><span class=\"title\">每一份量</span><span class=\"text\">1公克</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">本包裝含</span><span class=\"text\">2000份</span></li>\r\n</ul>\r\n\r\n<ul class=\"product-info-box p-a0\">\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\"></span><span class=\"text-e\">每份</span><span class=\"text-h\">每100公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">熱量</span><span class=\"text-e\">2.1大卡</span><span class=\"text-h\">212大卡</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">蛋白質</span><span class=\"text-e\">0.1公克</span><span class=\"text-h\">13.8公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">脂肪</span><span class=\"text-e\">0.02公克</span><span class=\"text-h\">2.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">&nbsp;&nbsp;&nbsp;&nbsp;飽和脂肪</span><span class=\"text-e\">0.01公克</span><span class=\"text-h\">0.7公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">&nbsp;&nbsp;&nbsp;&nbsp;反式脂肪</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">碳水化合物</span><span class=\"text-e\">0.3公克</span><span class=\"text-h\">34.4公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">&nbsp;&nbsp;&nbsp;&nbsp;糖</span><span class=\"text-e\">0.04公克</span><span class=\"text-h\">3.5公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">鈉</span><span class=\"text-e\">181毫克</span><span class=\"text-h\">18100毫克</span></li>\r\n</ul>\r\n', 5, 0, '', '2019-12-24 13:13:40', 1, '2021-04-27 09:48:52', 7),
(6, 2, '「味の素®」 味精1KG', '/uploads/product/1577165474.jpg', '', '以天然原料甘蔗、樹薯等發酵而成', '使用「味の素&reg;」鮮味調味料烹調，能賦予料理鮮味(UMAMI)，同時引出食材原有風味，提升菜餚整體鮮美度。從醃製食材到煎、煮、炒、湯等各式料理都適用。', '＜使用方法＞(10人份)<br />\r\n●提味、提鮮：<br />\r\n水餃餡等餡料．．．．．．1小匙(約3-5g)<br />\r\n炒飯、炒麵、炒青菜．．．1-2小匙(約5-9g)<br />\r\n<br />\r\n●調和菜餚整體風味&nbsp;<br />\r\n火鍋、高湯．．．．．．．1-2小匙(約5-9g)<br />\r\n清湯、味噌湯．．．．．．1小匙(約3-5g)', '<ul class=\"product-info-box p-a0\">\r\n	<li class=\"d-flex \"><span class=\"title\">產品登錄碼</span><span class=\"text\">TFAB1C007690007</span></li>\r\n	<li class=\"d-flex \"><span class=\"title\">原料</span><span class=\"text\">L-麩酸鈉</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">淨重</span><span class=\"text\">1公斤</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">原產地</span><span class=\"text\">泰國</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品包裝</span><span class=\"text\">1kgx12袋/箱</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品條碼</span><span class=\"text\">47111737800014</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">外箱尺寸</span><span class=\"text\">402x322x154mm</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存期限</span><span class=\"text\">5年(常溫未開封狀態下)</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">注意事項</span><span class=\"text\">限於食品製造或加工必須時使用</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存方法</span><span class=\"text\">開封後，為了避免受潮，請密封存放於乾燥通風處，以確保產品的最佳風味及品質。 </span></li>\r\n</ul>\r\n', '<ul class=\"info-box p-a0\">\r\n	<li class=\"d-flex\"><span class=\"title\">每一份量</span><span class=\"text\">1公克</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">本包裝含</span><span class=\"text\">1000份</span></li>\r\n</ul>\r\n\r\n<ul class=\"product-info-box p-a0\">\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\"></span><span class=\"text-e\">每份</span><span class=\"text-h\">每100公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">熱量</span><span class=\"text-e\">2.9大卡</span><span class=\"text-h\">293.2大卡</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">蛋白質</span><span class=\"text-e\">0.4公克</span><span class=\"text-h\">44.1公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">脂肪</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">&nbsp;&nbsp;&nbsp;&nbsp;飽和脂肪</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">&nbsp;&nbsp;&nbsp;&nbsp;反式脂肪</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">碳水化合物</span><span class=\"text-e\">0.3公克</span><span class=\"text-h\">29.2公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">&nbsp;&nbsp;&nbsp;&nbsp;糖</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">鈉</span><span class=\"text-e\">117毫克</span><span class=\"text-h\">11700毫克</span></li>\r\n</ul>\r\n', 7, 0, '', '2019-12-24 13:31:15', 1, '2021-04-27 09:50:32', 7),
(7, 2, '「味の素®」 金罐高鮮味精1KG', '/uploads/product/1577165826.jpg', '', '日本原裝進口', '味の素&reg; 金罐高鮮味精是由天然甘蔗、樹薯等發酵而成的鮮味調味料，含有I+G鮮味成分，適當添加於佳餚中，可有效引出食材原有的風味，讓料理更加鮮美。', '鮮味(UMAMI)物質，例如:麩胺酸鈉，如果與核甘酸組合，會讓原有的鮮味(UMAMI)飛躍式的提升，這種「鮮味(UMAMI)相乘效果」可普遍應用在各式料理中，增添佳餚風味。', '<ul class=\"product-info-box p-a0\">\r\n	<li class=\"d-flex \"><span class=\"title\">產品登錄碼</span><span class=\"text\">TFAB200000046579</span></li>\r\n	<li class=\"d-flex \"><span class=\"title\">原料</span><span class=\"text\">L-麩酸鈉、5&#39;-次黃嘌呤核苷磷酸二鈉、5&#39;-鳥嘌呤核苷磷酸二鈉</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">淨重</span><span class=\"text\">1公斤(990~1030公克)</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">使用範圍及用量標準</span><span class=\"text\">本品可於各類食品中視實際需要適量使用</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">使用限制</span><span class=\"text\">限於食品製造或加工必須時使用</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">原產地</span><span class=\"text\">日本國佐賀縣</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品包裝</span><span class=\"text\">1kgx12罐/箱</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品條碼</span><span class=\"text\">4901001000081</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">外箱尺寸</span><span class=\"text\">551x263x193mm</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存期限</span><span class=\"text\">5年(常溫未開封狀態下)</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存方法</span><span class=\"text\">開封後，為了避免受潮，請密封存放於乾燥通風處，以確保產品的最佳風味及品質。 </span></li>\r\n</ul>\r\n', '<ul class=\"info-box p-a0\">\r\n	<li class=\"d-flex\"><span class=\"title\">每一份量</span><span class=\"text\">1公克</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">本包裝含</span><span class=\"text\">1000份</span></li>\r\n</ul>\r\n\r\n<ul class=\"product-info-box p-a0\">\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\"></span><span class=\"text-e\">每份</span><span class=\"text-h\">每100公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">熱量</span><span class=\"text-e\">2.9大卡</span><span class=\"text-h\">291.6大卡</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">蛋白質</span><span class=\"text-e\">0.5公克</span><span class=\"text-h\">46.8公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">脂肪</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">&nbsp;&nbsp;&nbsp;&nbsp;飽和脂肪</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">&nbsp;&nbsp;&nbsp;&nbsp;反式脂肪</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">碳水化合物</span><span class=\"text-e\">0.3公克</span><span class=\"text-h\">26.1公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">&nbsp;&nbsp;&nbsp;&nbsp;糖</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">鈉</span><span class=\"text-e\">116毫克</span><span class=\"text-h\">11600毫克</span></li>\r\n</ul>\r\n', 8, 0, '', '2019-12-24 13:37:07', 1, '2021-04-27 09:51:02', 7),
(8, 3, '「AJI-NO-MOTO® PLUS®」高鮮味精1KG', '/uploads/product/1577166196.jpg', '', '用量只要一般高鮮1/2小匙', 'AJI-NO-MOTO&reg; PLUS&reg; 高鲜味精採用味之素集團獨家造粒技術將鮮味成分完整平均封存於粒子中，內含高I+G鮮味成分，只需傳統味精1/4用量，即能提引出食材原有風味，並讓料理呈現更具豐富口感的自然鮮美。從熬煮湯品到大火快炒類、蒸煮類等料理皆可使用。', '＜使用方法＞<br />\r\n●高湯(1公升)．．．．．．1/4小匙<br />\r\n●湯、羹(1公升)．．．．．1/2小匙<br />\r\n●炒麵(10人份)．．．．． &nbsp;1/4小匙', '<ul class=\"product-info-box p-a0\">\r\n	<li class=\"d-flex \"><span class=\"title\">產品登錄碼</span><span class=\"text\">TFAB20000002458</span></li>\r\n	<li class=\"d-flex \"><span class=\"title\">原料</span><span class=\"text\">L-麩酸鈉、5&#39;-次黃嘌呤核苷磷酸二鈉、5&#39;-鳥嘌呤核苷磷酸二鈉</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">淨重</span><span class=\"text\">1公斤</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">使用範圍<br />\r\n	及用量標準</span><span class=\"text\">本品可於各類食品中視實際需要適量使用</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">使用限制</span><span class=\"text\">限於食品製造或加工必須時使用</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">原產地</span><span class=\"text\">越南</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品包裝</span><span class=\"text\">1kgx12盒/箱</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品條碼</span><span class=\"text\">4711173780601</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">外箱尺寸</span><span class=\"text\">410x315x195mm</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存期限</span><span class=\"text\"><span class=\"text\">5年(常溫未開封狀態下)</span></span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存方法</span><span class=\"text\">開封後，為了避免受潮，請密封存放於乾燥通風處，以確認產品的最佳風味及品質。 </span></li>\r\n</ul>\r\n', '<ul class=\"info-box p-a0\">\r\n	<li class=\"d-flex\"><span class=\"title\">每一份量</span><span class=\"text\">1公克</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">本包裝含</span><span class=\"text\">1000份</span></li>\r\n</ul>\r\n\r\n<ul class=\"product-info-box p-a0\">\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\"></span><span class=\"text-e\">每份</span><span class=\"text-h\">每100公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">熱量</span><span class=\"text-e\">2.9大卡</span><span class=\"text-h\">290大卡</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">蛋白質</span><span class=\"text-e\">0.5公克</span><span class=\"text-h\">47.3公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">脂肪</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">&nbsp;&nbsp;&nbsp;&nbsp;飽和脂肪</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">&nbsp;&nbsp;&nbsp;&nbsp;反式脂肪</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">碳水化合物</span><span class=\"text-e\">0.3公克</span><span class=\"text-h\">25.1公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">&nbsp;&nbsp;&nbsp;&nbsp;糖</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">鈉</span><span class=\"text-e\">122毫克</span><span class=\"text-h\">12200毫克</span></li>\r\n</ul>\r\n', 9, 0, '', '2019-12-24 13:43:17', 1, '2021-04-27 09:52:34', 7),
(9, 2, '「味の素®」S高鮮味精1KG', '/uploads/product/1577166495.jpg', '', '日本老店、拉麵店 長久指名使用', '＜商品特色＞<br />\r\n●同時含有乾燻鰹魚及香菇中的鮮味成份及昆布中的鮮味成份，少量使用就可輕鬆讓料理更美味的一款鮮味調味料。<br />\r\n●可提引出食材原本的風味，完美調和料理的整體均衡感。<br />\r\n●耐熱性高，在料理的前、中、後使用效果都一樣。<br />\r\n●使用在減鹽料理時可以補上不足的風味，讓料理更可口。', '＜使用方法＞<br />\r\n●前置處理<br />\r\n水餃餡、漢堡肉(10人份)．．． 3~5g<br />\r\n燙青菜．．．．．．．．．．．1L熱水+3~5g<br />\r\n海鮮類．．．．．．．．．．．適量<br />\r\n<br />\r\n●烹調<br />\r\n炒飯、炒青菜(10人份)．．． ．5~9g<br />\r\n拉麵、湯品．．．．．．．．．1L水+10g<br />\r\n沙拉醬．．．．．．．．．．．500ml+2g', '<ul class=\"product-info-box p-a0\">\r\n	<li class=\"d-flex \"><span class=\"title\">產品登錄碼</span><span class=\"text\">TFAB20000057672</span></li>\r\n	<li class=\"d-flex \"><span class=\"title\">原料</span><span class=\"text\">L-麩酸鈉、5&#39;-次黃嘌呤核苷磷酸二鈉、5&#39;-鳥嘌呤核苷磷酸二鈉</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">淨重</span><span class=\"text\">1公斤(900公克~1030公克)/袋</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">使用範圍<br />\r\n	及用量標準</span><span class=\"text\">本品可於各類食品中視實際需要適量使用</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">使用限制</span><span class=\"text\">限於食品製造或加工必須時使用</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">原產地</span><span class=\"text\">日本國佐賀縣</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品包裝</span><span class=\"text\">1kgx12袋/箱</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品條碼</span><span class=\"text\">4901001194186</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">外箱尺寸</span><span class=\"text\">456x296x167mm</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存期限</span><span class=\"text\">5年(常溫未開封狀態下)</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存方法</span><span class=\"text\">開封後，請密封並放置於陰涼乾燥處 </span></li>\r\n</ul>\r\n', '<ul class=\"info-box p-a0\">\r\n	<li class=\"d-flex\"><span class=\"title\"></span><br />\r\n	<span class=\"text-h\"></span></li>\r\n</ul>\r\n', 10, 0, '', '2019-12-24 13:48:16', 1, '2020-03-31 17:38:08', 7),
(10, 4, '「味之素品牌」沙拉醬1KG', '/uploads/product/1577167130.jpg', '', '日本味之素集團暢銷50年商品', '＜商品特色＞<br />\r\n●酸味及鹹味適中， 口味柔和清爽，卻又不失濃郁感。<br />\r\n●沒有特別突出的味道，適合作為突顯原食材味道的料理的基底。<br />\r\n●擁有良好的保水性及耐熱性，所以非常適用於各式沙拉及燒烤料理。', '＜使用方法＞<br />\r\n沾醬醬底、燒烤料理、沙拉、調理麵包、小菜等。', '<ul class=\"product-info-box p-a0\">\r\n	<li class=\"d-flex \"><span class=\"title\">原料</span><span class=\"text\">食用植物油(菜籽油、大豆油、玉米油、棕櫚油)、葡萄糖漿、水、釀造食醋、加鹽蛋液(雞蛋、食鹽)、食鹽、蛋黃粉(蛋黃、食鹽、葡萄糖、二氧化矽、磷脂酶)、Ｌ-麩胺鈉、濃縮檸檬汁、芥子抽出物</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">淨重</span><span class=\"text\">1公斤</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">原產地</span><span class=\"text\">日本國三重縣</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品包裝</span><span class=\"text\">1kgx10罐/箱</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品條碼</span><span class=\"text\">4901001103782</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">外箱尺寸</span><span class=\"text\">428 x 214 x252 mm</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存期限</span><span class=\"text\">10個月(常溫未開封狀態下)</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存條件</span><span class=\"text\">請放置於陰涼、無陽光直曬處，勿保存於0℃以下環境。開封後，請蓋好瓶蓋冷藏保存，並儘早食用完畢。 </span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">過敏原資訊</span><span class=\"text\">本產品含有過敏原蛋、大豆及其製品。</span></li>\r\n</ul>\r\n', '<ul class=\"info-box p-a0\">\r\n	<li class=\"d-flex\"><span class=\"title\">每一份量</span><span class=\"text\">10公克</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">本包裝含100份</span></li>\r\n</ul>\r\n\r\n<ul class=\"product-info-box p-a0\">\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\"></span><span class=\"text-e\">每份</span><span class=\"text-h\">每100公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">熱量</span><span class=\"text-e\">69.9大卡</span><span class=\"text-h\">699.2大卡</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">蛋白質</span><span class=\"text-e\">0.1公克</span><span class=\"text-h\">0.8公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">脂肪</span><span class=\"text-e\">7.5公克</span><span class=\"text-h\">74.8公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">&nbsp;&nbsp;&nbsp;&nbsp;飽和脂肪</span><span class=\"text-e\">1.0公克</span><span class=\"text-h\">10.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">&nbsp;&nbsp;&nbsp;&nbsp;反式脂肪</span><span class=\"text-e\">0.1公克</span><span class=\"text-h\">0.9公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">碳水化合物</span><span class=\"text-e\">0.6公克</span><span class=\"text-h\">5.7公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">&nbsp;&nbsp;&nbsp;&nbsp;糖</span><span class=\"text-e\">0.2公克</span><span class=\"text-h\">2.1公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">鈉</span><span class=\"text-e\">61毫克</span><span class=\"text-h\">612毫克</span></li>\r\n</ul>\r\n', 11, 0, '', '2019-12-24 13:58:51', 1, '2020-07-23 11:58:58', 7),
(11, 1, '「ほんだし®」香菇風味500G', '/uploads/product/1585648753.jpg', '', '嚴選香菇 清甜入味', '嚴選台灣產高品質香菇，採用獨家技術與秘製配方，提引出香菇原有的天然清談，風味純粹、口感圓潤，能完美融入全素料理及炒菜、燉飯、火鍋湯品等各種烹調方式，巧妙增添料理整體風味與層次。', '使用方法:<br />\r\n用10公克「ほんだし&reg;」香菇風味可調理1000c.c.的高湯', '<ul class=\"product-info-box p-a0\">\r\n	<li class=\"d-flex \"><span class=\"title\">原料</span><span class=\"text\">食鹽、香菇、L-麩酸鈉、砂糖、麥芽<span style=\"display: inline !important;\">糊精、<span style=\"display: inline !important;\">葡萄糖、大豆水解蛋白、醬油、蘑菇、</span></span>5`-次黃嘌呤核苷磷酸二鈉、<span style=\"display: inline !important;\">5`-鳥嘌呤核苷磷酸二鈉、胺基乙酸、</span><span style=\"display: inline !important;\">酵母抽出物、黑胡椒、氧化澱粉、葵花籽油、芥花油、<span style=\"display: inline !important;\">糊精、琥珀酸、碳酸鉀、檸檬酸</span></span></span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">淨重</span><span class=\"text\">500公克</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">原產地</span><span class=\"text\">台灣</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品包裝</span><span class=\"text\">500gx12盒/箱</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品條碼</span><span class=\"text\">4711173780922</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">外箱尺寸</span><span class=\"text\">370x245x213mm</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存期限</span><span class=\"text\">12個月(常溫未開封狀態下) </span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">過敏原</span><span class=\"text\">本產品含有大豆、含麩質之穀物及其製品</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存方法</span><span class=\"text\">開封後，為了避免受潮，請密封存放於乾燥通風處，以確認產品的最佳風味及品質。 </span></li>\r\n</ul>\r\n', '<ul class=\"info-box p-a0\">\r\n	<li class=\"d-flex\"><span class=\"title\">每一份量</span><span class=\"text\">1公克</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">本包裝含</span><span class=\"text\">500份</span></li>\r\n</ul>\r\n\r\n<ul class=\"product-info-box p-a0\">\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\"></span><span class=\"text-e\">每份</span><span class=\"text-h\">每100公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">熱量</span><span class=\"text-e\">2.2大卡</span><span class=\"text-h\">224大卡</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">蛋白質</span><span class=\"text-e\">0.2公克</span><span class=\"text-h\">16.3公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">脂肪</span><span class=\"text-e\">0.01公克</span><span class=\"text-h\">0.7公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">&nbsp;&nbsp;&nbsp;&nbsp;飽和脂肪</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.1公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">&nbsp;&nbsp;&nbsp;&nbsp;反式脂肪</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">碳水化合物</span><span class=\"text-e\">0.4公克</span><span class=\"text-h\">38.2公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">&nbsp;&nbsp;&nbsp;&nbsp;糖</span><span class=\"text-e\">0.1公克</span><span class=\"text-h\">9.3公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">鈉</span><span class=\"text-e\">162毫克</span><span class=\"text-h\">16200毫克</span></li>\r\n</ul>\r\n', 6, 0, '', '2020-03-03 15:15:50', 7, '2021-04-27 09:49:17', 7),
(12, 1, '加工商品', '', '', '', '內容內容內容內容內容內容內容內容內容內容', '內容內容內容內容內容內容內容內容內容內容', '<ul class=\"product-info-box p-a0\">\r\n	<li class=\"d-flex \"><span class=\"title\">原料</span><span class=\"text\">調味劑(L-麩酸鈉、5`-次黃嘌呤核苷磷酸二鈉、琥珀酸二鈉)、食鹽、乳糖、砂糖、乾燻鰹魚、鰹魚抽出物、酵母抽出物、D-木糖、麥芽糖、葡萄糖、糊精</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">淨重</span><span class=\"text\">1公斤</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">原產地</span><span class=\"text\">日本國神奈川縣</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品包裝</span><span class=\"text\">1kgx12袋/箱</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品條碼</span><span class=\"text\">4901001375431</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">外箱尺寸</span><span class=\"text\">522x262x209mm</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存期限</span><span class=\"text\">24個月(常溫未開封狀態下) </span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">過敏原</span><span class=\"text\">2本產品含有牛奶及其製品</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存方法</span><span class=\"text\">開封後，為了避免受潮，請密封存放於乾燥通風處，以確認產品的最佳風味及品質。 </span></li>\r\n</ul>\r\n', '<ul class=\"info-box p-a0\">\r\n	<li class=\"d-flex\"><span class=\"title\"><img alt=\"\" src=\"/foodservice/uploads/editor/1597286753.jpg\" /></span><br />\r\n	<span class=\"text-h\"></span></li>\r\n</ul>\r\n', 0, 1, '', '2020-08-13 10:46:08', 7, '2020-08-13 10:48:09', 7),
(13, 4, '天調', '/uploads/product/1598508392.jpg', '', '', '<span style=\"font-size:12pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-family:\">主要作用是增加「</span>KOKUMI<span style=\"font-family:\">」，即增強食物味道的豐富與強烈感。<br />\r\n「</span>KOKUMI<span style=\"font-family:\">」即日文「濃郁感」的意思，是屬於酸、甜、苦、鹹、鮮味等五種基本味道外的另一種味道。</span></span></span><br />\r\n<span style=\"font-size:12pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-family:\">產品可廣泛應用至泡麵、風味調味料、休閒點心等食品。</span></span></span>', '<span style=\"font-size:12pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-family:\">類別</span>:<br />\r\n<span 2=\"\" lang=\"EN-US\" style=\"font-family:\" wingdings=\"\">&Ucirc;</span><span style=\"font-family:\">酵素水解植物蛋白系列</span><br />\r\n<span 2=\"\" lang=\"EN-US\" style=\"font-family:\" wingdings=\"\">&Ucirc;</span><span style=\"font-family:\">酵母萃取物系列</span><br />\r\n<span 2=\"\" lang=\"EN-US\" style=\"font-family:\" wingdings=\"\">&Ucirc;</span><span style=\"font-family:\">水解植物蛋白系列</span><br />\r\n*<span 2=\"\" lang=\"EN-US\" style=\"font-family:\" wingdings=\"\">&Ucirc;</span><span style=\"font-family:\">增強口感系列</span><br />\r\n<span 2=\"\" lang=\"EN-US\" style=\"font-family:\" wingdings=\"\">&Ucirc;</span><span style=\"font-family:\">增強風味系列</span></span></span>', '', '', 0, 1, '', '2020-08-27 14:06:33', 7, '2020-08-27 16:50:25', 7),
(14, 5, '加工通路商品', '/uploads/product/1598608560.jpg,/uploads/product/1598608314.jpg', ',', '加工通路商品介紹', '<img alt=\"\" src=\"/foodservice/uploads/editor/1598595120.jpg\" style=\"width:80%\" />\r\n<table border=\"0\" cellpadding=\"2\" cellspacing=\"3\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"\" src=\"/foodservice//uploads/editor/1598530970.jpg\" /><br />\r\n			<img alt=\"\" src=\"/foodservice/uploads/editor/1598583018.jpg\" style=\"width:130px;\" /><br />\r\n			<br />\r\n			<img alt=\"\" src=\"/foodservice/uploads/editor/1598583031.jpg\" style=\"width:130px;\" /><br />\r\n			<img alt=\"\" src=\"/foodservice//uploads/editor/1598531014.jpg\" /><br />\r\n			&nbsp;</td>\r\n			<td><strong>&lt;天調&gt;</strong><br />\r\n			主要作用是增加「KOKUMI」即增強食物味道的豐富與強烈感。「KOKUMI」即日文「濃郁感」的意思,是屬於酸、甜、苦、鹹、鮮味等五種基本味道外的另一種味道。產品可廣泛應用至泡麵、風味調味料、休閒點心等食品。<br />\r\n			類別 : 酵素水解植物蛋白系列、酵母萃取物系列、水解植物蛋白系列、增強口感系列、增強風味系列\r\n			<hr /></td>\r\n		</tr>\r\n		<tr>\r\n			<td><img alt=\"\" src=\"/foodservice//uploads/editor/1598534152.jpg\" /><img alt=\"\" src=\"/foodservice/uploads/editor/1598583043.jpg\" style=\"width:130px;\" /></td>\r\n			<td><strong>&lt;「味の素&reg;」(AJI-NO-MOTO&reg;)&gt;</strong><br />\r\n			「味の素&reg;」(AJI-NO-MOTO&reg;)鮮味調味料以天然原料甘蔗、樹薯等發酵而成，於1909年推出至今已行銷全球超過130個國家，是世界上歷史最悠久的味精品牌。<br />\r\n			L-麩酸鈉純度高達99%以上。<br />\r\n			類別 : MS-FC、MSG-RC、WF-5(高鮮)\r\n			<hr /></td>\r\n		</tr>\r\n		<tr>\r\n			<td><img alt=\"\" src=\"/foodservice//uploads/editor/1598535053.jpg\" /><br />\r\n			<br />\r\n			<img alt=\"\" src=\"/foodservice/uploads/editor/1598583053.jpg\" style=\"width:130px;\" /></td>\r\n			<td><strong>&lt;核苷酸&gt;</strong><br />\r\n			味之素核苷酸(AJITIDE)是一種鮮味調味品，與「味の素&reg;」(AJI-NO-MOTO&reg;)共用具有相乘效果。<br />\r\n			包括:①肌苷酸鈉(IMP)、②肌苷酸鈉(IMP)與鳥苷酸鈉(GMP)所製成的混合物(I+G)等兩種產品。<br />\r\n			類別 : IMP I+G\r\n			<hr /></td>\r\n		</tr>\r\n		<tr>\r\n			<td><img alt=\"\" src=\"/foodservice//uploads/editor/1598536069.jpg\" /><img alt=\"\" src=\"/foodservice/uploads/editor/1598583081.jpg\" style=\"width:130px;\" /><br />\r\n			<img alt=\"\" src=\"/foodservice//uploads/editor/1598536069.jpg\" /><br />\r\n			&nbsp;</td>\r\n			<td><strong><tg酵素></tg酵素>&lt;TG酵素&gt;</strong><br />\r\n			谷氨酰胺轉胺酶(TG)是利用交聯鍵連接蛋白質分子的酵素，用途在改良食品物性和黏合力上，可加強提高產品的附加價值。「味の素株式会社」為全球首家將自然界廣泛分布的酵素工業化，並成功將其使用於食品加工用途。<br />\r\n			類別:&nbsp; TG-B(黏著用)、TG-K(煉製品用)、Super Curd(豆腐用)、STG-M(製麵用)、肉用調味料(畜肉用)\r\n			<hr /></td>\r\n		</tr>\r\n		<tr>\r\n			<td><img alt=\"\" src=\"/foodservice//uploads/editor/1598536191.jpg\" /><br />\r\n			<img alt=\"\" src=\"/foodservice/uploads/editor/1598583124.jpg\" style=\"width:130px;\" /><br />\r\n			&nbsp;</td>\r\n			<td><strong>&lt;阿斯巴甜&gt;</strong><br />\r\n			1.阿斯巴甜為胺基酸系甜味劑，甜度約為砂糖的200倍。<br />\r\n			2.可延續甜味並能增強食品的風味及香氣。<br />\r\n			3.零熱量。<br />\r\n			達到同等甜味的成本約只需砂糖1/3。<br />\r\n			類別 : 粉末&nbsp;\r\n			<hr /></td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '', '', '', 20, 0, '', '2020-08-28 10:52:14', 7, '2020-09-09 17:11:25', 7);

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
  `c_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '建立時間',
  `c_user_id` int(11) NOT NULL COMMENT '建立使用者編號',
  `u_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '修改時間',
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
  `c_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '建立時間',
  `c_user_id` int(11) NOT NULL COMMENT '建立使用者編號',
  `u_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '修改時間',
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
  `material_weight` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '材料份量	',
  `nutrition` text COLLATE utf8_unicode_ci NOT NULL COMMENT '營養成份',
  `member_only` tinyint(1) NOT NULL COMMENT '會員限定',
  `visitor` int(11) NOT NULL COMMENT '瀏覽人數',
  `list_order` int(11) NOT NULL COMMENT '列表順序',
  `status` tinyint(1) NOT NULL COMMENT '狀態，0：啟用，1：停用，2：已刪除',
  `remark` text COLLATE utf8_unicode_ci NOT NULL COMMENT '備註',
  `c_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '建立時間',
  `c_user_id` int(11) NOT NULL COMMENT '建立使者編號',
  `u_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '修改時間',
  `u_user_id` int(11) NOT NULL COMMENT '修改使用者編號'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `recipepro`
--

INSERT INTO `recipepro` (`id`, `name`, `pic_url`, `pic_alt`, `feature`, `tags`, `price`, `type`, `style`, `product_ids`, `material_weight`, `nutrition`, `member_only`, `visitor`, `list_order`, `status`, `remark`, `c_time`, `c_user_id`, `u_time`, `u_user_id`) VALUES
(1, '什錦湯麵', '/uploads/repicepro/1577179312.jpg', '', '', '雞肉,葉菜類,菇蕈類', '近期公開', '中式', '主食', '2', '2人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>427</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>24.7</td>\r\n			<th>脂肪(g)</th>\r\n			<td>11.6</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>52.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>83</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.6</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>60</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.1</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.17</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.21</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>24</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>52</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>3.3</td>\r\n			<th>鹽分(g)</th>\r\n			<td>4.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>45</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 54, 0, 0, '', '2019-12-24 17:21:52', 1, '2021-03-30 10:51:36', 2),
(2, '昆布燉白蘿蔔', '/uploads/repicepro/1577179523.jpg', '', '', '根莖類', '近期公開', '素食', '配菜', '3', '2人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>171</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>9.8</td>\r\n			<th>脂肪(g)</th>\r\n			<td>0.6</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>35.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>320</td>\r\n			<th>鐵(mg)</th>\r\n			<td>3.8</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>1</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>16</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.23</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>30</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>55</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>0</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>14.2</td>\r\n			<th>鹽分(g)</th>\r\n			<td>15</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>470</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 35, 0, 0, '', '2019-12-24 17:25:23', 1, '2021-04-16 23:25:07', 2),
(3, '炸芋頭茄子', '/uploads/repicepro/1577179951.jpg', '', '', '根莖類,瓜果類', '近期公開', '素食', '主菜', '3', '2人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>950</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>13.5</td>\r\n			<th>脂肪(g)</th>\r\n			<td>55.9</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>83.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>180</td>\r\n			<th>鐵(mg)</th>\r\n			<td>3.7</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>74</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>10</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.51</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.34</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.87</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>46</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>3</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>19.6</td>\r\n			<th>鹽分(g)</th>\r\n			<td>8.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>360</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 26, 0, 0, '', '2019-12-24 17:32:31', 1, '2021-03-25 12:31:14', 2),
(4, '油菜杏鮑菇清湯', '/uploads/repicepro/1577180511.jpg', '', '', '菇蕈類', '近期公開', '素食', '湯羹類', '3', '2人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>47</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>6.1</td>\r\n			<th>脂肪(g)</th>\r\n			<td>0.5</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>10.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>82</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.8</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>8</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.19</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.36</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.28</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>65</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>0</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>5.5</td>\r\n			<th>鹽分(g)</th>\r\n			<td>5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>150</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 31, 0, 0, '', '2019-12-24 17:41:51', 1, '2021-04-12 21:18:54', 2),
(5, '綠蘆筍蛤仔湯', '/uploads/repicepro/1577180736.jpg', '', '', '海鮮類,根莖類', '近期公開', '日式', '湯羹類', '3', '2人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>61</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>8.1</td>\r\n			<th>脂肪(g)</th>\r\n			<td>0.7</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>5.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>140</td>\r\n			<th>鐵(mg)</th>\r\n			<td>2.4</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>22</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.14</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.23</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.14</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>28.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>8</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>25</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>0.9</td>\r\n			<th>鹽分(g)</th>\r\n			<td>10</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>46</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 14, 0, 0, '', '2019-12-24 17:45:36', 1, '2021-04-12 21:10:55', 2),
(6, '什錦鱈魚火鍋', '/uploads/repicepro/1577181639.jpg', '', '', '海鮮類', '近期公開', '中式', '火鍋', '3', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>590</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>71.1</td>\r\n			<th>脂肪(g)</th>\r\n			<td>17.7</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>41</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>570</td>\r\n			<th>鐵(mg)</th>\r\n			<td>8.8</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>445</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>4.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.76</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.92</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>1.04</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>5.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>91</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>150</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>15.5</td>\r\n			<th>鹽分(g)</th>\r\n			<td>15.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>472</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 18, 0, 0, '', '2019-12-24 18:00:39', 1, '2021-03-25 13:06:33', 2),
(7, '馬鈴薯炒豬五花', '/uploads/repicepro/1577182279.jpg', '', '', '根莖類', '近期公開', '日式', '配菜', '3', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>1778</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>49.1</td>\r\n			<th>脂肪(g)</th>\r\n			<td>83.7</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>182.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>130</td>\r\n			<th>鐵(mg)</th>\r\n			<td>5.5</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>730</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>3.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>1.72</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.65</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>2.13</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>1.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>190</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>140</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>54.8</td>\r\n			<th>鹽分(g)</th>\r\n			<td>14.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>349</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 14, 0, 0, '', '2019-12-24 18:11:19', 1, '2020-12-18 19:16:53', 2),
(8, '牛蒡鮮雞盅', '/uploads/repicepro/1577182780.jpg', '', '以漢方素材入味，雞湯更加滋養鮮甜', '雞肉', '近期公開', '中式', '湯羹類', '2,3', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>230</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>19.3</td>\r\n			<th>脂肪(g)</th>\r\n			<td>10.4</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>33</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>38</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.08</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.14</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.34</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>2</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>68</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>3</td>\r\n			<th>鹽分(g)</th>\r\n			<td>2.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>50</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 13, 0, 0, '', '2019-12-24 18:16:44', 1, '2021-04-27 09:55:45', 2),
(9, '香辣X0醬', '/uploads/repicepro/1577183251.jpg', '', '匯集海味的鮮香和適度的辣勁，入口即是頂級的美味', '其他', '近期公開', '其他', '其他', '1,2', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>2600</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>97.1</td>\r\n			<th>脂肪(g)</th>\r\n			<td>196.7</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>101.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>2100</td>\r\n			<th>鐵(mg)</th>\r\n			<td>9</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>438</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>16.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.57</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.66</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>1.07</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>11.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>82</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>350</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>7</td>\r\n			<th>鹽分(g)</th>\r\n			<td>14.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>143</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 54, 0, 0, '', '2019-12-24 18:27:31', 1, '2021-05-01 23:27:20', 2),
(10, '榨菜炒肚絲', '/uploads/repicepro/1577183486.jpg', '', '榨菜的爽脆搭配上肚絲的特有口感，讓人一吃上癮', '豬肉,葉菜類', '近期公開', '中式', '配菜', '2,3', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>164</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>19.7</td>\r\n			<th>脂肪(g)</th>\r\n			<td>6.3</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>6.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>79</td>\r\n			<th>鐵(mg)</th>\r\n			<td>3.1</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>62</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.14</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.31</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.16</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>16</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>250</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>3.3</td>\r\n			<th>鹽分(g)</th>\r\n			<td>6.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>92</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 10, 0, 0, '', '2019-12-24 18:31:26', 1, '2021-03-09 14:59:16', 2),
(11, '肉片炒五色', '/uploads/repicepro/1577236142.jpg', '', '以鳳梨入菜，讓肉片更加柔嫩與可口', '豬肉', '近期公開', '中式', '配菜', '3', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>192</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>10</td>\r\n			<th>脂肪(g)</th>\r\n			<td>9.4</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>16.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>9</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.4</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>15</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.33</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.1</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.22</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>7</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>24</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>2.5</td>\r\n			<th>鹽分(g)</th>\r\n			<td>1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>68</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 15, 0, 0, '', '2019-12-25 09:09:03', 1, '2021-03-02 13:17:14', 2),
(12, '南北杏萬壽棗燉雞', '/uploads/repicepro/1577236667.jpg', '', '雞腿肉與多種乾貨的炆火慢燉，湯頭清香甘甜', '雞肉,瓜果類', '近期公開', '中式', '主菜', '3', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>502</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>27</td>\r\n			<th>脂肪(g)</th>\r\n			<td>33.5</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>18.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>38</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.7</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>109</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.13</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.4</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>27</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>52</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>130</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>3.3</td>\r\n			<th>鹽分(g)</th>\r\n			<td>2.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>0</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 15, 0, 0, '', '2019-12-25 09:17:47', 1, '2021-03-20 00:24:38', 2),
(13, '素燴獅子頭', '/uploads/repicepro/1577237382.jpg', '', '新鮮香菇混合著豆腐的醇香，讓人不禁想大快朵頤', '豆類', '近期公開', '素食', '配菜', '3', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>218</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>12.1</td>\r\n			<th>脂肪(g)</th>\r\n			<td>7.8</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>23.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>83</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.8</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>92</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.1</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.16</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.15</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>18</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>0</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>3.9</td>\r\n			<th>鹽分(g)</th>\r\n			<td>2.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>90</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 13, 0, 0, '', '2019-12-25 09:29:42', 1, '2021-04-14 20:08:04', 2),
(14, '蘆筍炒腐皮', '/uploads/repicepro/1577237645.jpg', '', '鮮綠的蘆筍搭配腐皮，營養與口感兼具', '根莖類,豆類', '近期公開', '素食', '配菜', '3', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>147</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>13.6</td>\r\n			<th>脂肪(g)</th>\r\n			<td>7.7</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>7.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>61</td>\r\n			<th>鐵(mg)</th>\r\n			<td>2.4</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>100</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.21</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.26</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.22</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>12</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>0</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>3.1</td>\r\n			<th>鹽分(g)</th>\r\n			<td>0.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>123</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 16, 0, 0, '', '2019-12-25 09:34:05', 1, '2021-05-01 18:12:53', 2),
(15, '火腿冬瓜盅', '/uploads/repicepro/1577237911.jpg', '', '鮮雞肉搭配冬瓜烹燉，是利水清熱的最佳湯品', '豬肉,瓜果類', '近期公開', '中式', '湯羹類', '2', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>277</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>25.6</td>\r\n			<th>脂肪(g)</th>\r\n			<td>15.9</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>6.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>27</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.1</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>40</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.46</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.28</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.39</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>57</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>110</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>1.5</td>\r\n			<th>鹽分(g)</th>\r\n			<td>3.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>95</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 9, 0, 0, '', '2019-12-25 09:38:31', 1, '2021-03-10 05:24:39', 2),
(16, '雙囍繡球', '/uploads/repicepro/1577238166.jpg', '', '金黃的地瓜與淡紫的芋頭，是味覺與視覺的雙重享受', '豬肉,根莖類', '近期公開', '中式', '其他', '2', '6人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>261</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>15</td>\r\n			<th>脂肪(g)</th>\r\n			<td>13</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>19.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>26</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.3</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>99</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.54</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.21</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.42</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>10</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>79</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>1.9</td>\r\n			<th>鹽分(g)</th>\r\n			<td>0.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>17</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 28, 0, 0, '', '2019-12-25 09:42:46', 1, '2021-03-08 00:22:31', 2),
(17, '西蘭花雞片', '/uploads/repicepro/1577238807.jpg', '', '滑嫩雞片佐上厚片杏鮑菇，還有紹興酒香，讓人吮指回味', '雞肉', '近期公開', '中式', '配菜', '2', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>221</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>26.6</td>\r\n			<th>脂肪(g)</th>\r\n			<td>8.4</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>9.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>32</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.1</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>59</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.22</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.33</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.81</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>66</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>73</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>4.4</td>\r\n			<th>鹽分(g)</th>\r\n			<td>1.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>109</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 8, 0, 0, '', '2019-12-25 09:53:27', 1, '2020-07-30 13:38:19', 2),
(18, '琵琶蝦', '/uploads/repicepro/1577239025.jpg', '', '草蝦的彈牙口感和著絞肉的鮮甜，美味在嘴裡久久不散', '海鮮類', '近期公開', '中式', '配菜', '2', '6人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>75</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>7.4</td>\r\n			<th>脂肪(g)</th>\r\n			<td>3</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>3.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>19</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.4</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>85</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.1</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.09</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.09</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>2</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>43</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>0.5</td>\r\n			<th>鹽分(g)</th>\r\n			<td>0.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>17</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 11, 0, 0, '', '2019-12-25 09:57:05', 1, '2021-04-23 13:49:36', 2),
(19, '龍果炒魚球', '/uploads/repicepro/1577239360.jpg', '', '鮮甜的火龍果住以細緻圓鱈，令人食指大動', '海鮮類,瓜果類', '近期公開', '中式', '配菜', '1', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>146</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>17.9</td>\r\n			<th>脂肪(g)</th>\r\n			<td>2.4</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>11.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>37</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.6</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>23</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.14</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.22</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.23</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>47</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>44</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>1.9</td>\r\n			<th>鹽分(g)</th>\r\n			<td>2.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>50</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 8, 0, 0, '', '2019-12-25 10:02:40', 1, '2021-02-02 12:30:14', 2),
(20, '茄汁紅蝦濃湯', '/uploads/repicepro/1577239761.jpg', '', '嚴選牛蕃茄加上胭脂蝦，一口入嘴甜酸滋味在味蕾上蔓延', '海鮮類,瓜果類', '近期公開', '中式', '湯羹類', '1', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>119</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>12.8</td>\r\n			<th>脂肪(g)</th>\r\n			<td>1.1</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>15.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>50</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.5</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>81</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>3.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.1</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.06</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.19</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>1.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>28</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>65</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>2.2</td>\r\n			<th>鹽分(g)</th>\r\n			<td>2.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>183</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 15, 0, 0, '', '2019-12-25 10:09:21', 1, '2021-04-24 18:27:58', 2),
(21, '三色炒麵線', '/uploads/repicepro/1577240278.jpg', '', '手工麵線與多樣食材的懷古風情，令人回味無窮', '豬肉,根莖類', '近期公開', '中式', '主食', '1', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>508</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>19.6</td>\r\n			<th>脂肪(g)</th>\r\n			<td>9.4</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>84.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>430</td>\r\n			<th>鐵(mg)</th>\r\n			<td>2.3</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>5</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.19</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.17</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.16</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>5</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>60</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>4.9</td>\r\n			<th>鹽分(g)</th>\r\n			<td>9.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>52</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 14, 0, 0, '', '2019-12-25 10:17:58', 1, '2021-04-23 13:52:28', 2),
(22, '鮮菇蚵嗲', '/uploads/repicepro/1577240469.jpg', '', '經大火酥炸的肥美鮮蚵配上香菇，一口咬下内餡香氣四溢', '海鮮類,菇蕈類', '近期公開', '中式', '其他', '1', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>140</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>7.6</td>\r\n			<th>脂肪(g)</th>\r\n			<td>2.8</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>21.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>63</td>\r\n			<th>鐵(mg)</th>\r\n			<td>2.2</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>63</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.1</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.21</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.12</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>11.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>6</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>72</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>2.2</td>\r\n			<th>鹽分(g)</th>\r\n			<td>2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>46</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 11, 0, 0, '', '2019-12-25 10:21:15', 1, '2021-03-25 13:03:43', 2),
(23, '橙品牛菲力', '/uploads/repicepro/1577240750.jpg', '', '干貝風味與橙汁的完美結合，配上入口即化的牛菲力，果然很「橙」意！', '牛肉', '近期公開', '西式', '主菜', '2', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>942</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>57.6</td>\r\n			<th>脂肪(g)</th>\r\n			<td>45.8</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>76.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>120</td>\r\n			<th>鐵(mg)</th>\r\n			<td>8.7</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>130</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>4.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.87</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>1.03</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>1.73</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>300</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>150</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>8.5</td>\r\n			<th>鹽分(g)</th>\r\n			<td>5.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>228</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 13, 0, 0, '', '2019-12-25 10:25:50', 1, '2021-05-14 15:00:48', 2),
(24, '蝦蚌過香江', '/uploads/repicepro/1577241729.jpg', '', '蝦丸裡有著干貝獨特的甘甜，成為您的獨門絕活，客人怎能拒絕！', '海鮮類', '近期公開', '中式', '湯羹類', '2', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>1172</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>154.9</td>\r\n			<th>脂肪(g)</th>\r\n			<td>43.4</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>30.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>680</td>\r\n			<th>鐵(mg)</th>\r\n			<td>4.6</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>165</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>14.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.83</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.59</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.91</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>35.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>52</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>1200</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>4.1</td>\r\n			<th>鹽分(g)</th>\r\n			<td>8.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>342</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 14, 0, 0, '', '2019-12-25 10:42:11', 1, '2021-03-01 14:17:17', 2),
(25, '翡翠香豆腐', '/uploads/repicepro/1577242604.jpg', '', '簡單的手法讓人擁有多種口感，昆布風味與菠菜製成的綠醬，令人食慾大開！', '豆類', '近期公開', '素食', '配菜', '3', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>526</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>44.4</td>\r\n			<th>脂肪(g)</th>\r\n			<td>23.1</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>36.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>56</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.9</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>358</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>2.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.14</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>3.53</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.17</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>48</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>0</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>4.4</td>\r\n			<th>鹽分(g)</th>\r\n			<td>5.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>150</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 33, 0, 0, '', '2019-12-25 10:56:44', 1, '2021-02-20 15:51:25', 2),
(26, '蟹寶如意捲', '/uploads/repicepro/1577243015.jpg', '', '昆布風味提升了餡料的豐富口感，天然的好滋味都在這一捲中！', '葉菜類,豆類', '近期公開', '素食', '配菜', '3', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>1815</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>29.1</td>\r\n			<th>脂肪(g)</th>\r\n			<td>173.6</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>30.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>240</td>\r\n			<th>鐵(mg)</th>\r\n			<td>3.6</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>325</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>17.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.44</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.62</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.52</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>46</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>2</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>9.1</td>\r\n			<th>鹽分(g)</th>\r\n			<td>6.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>335</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 9, 0, 0, '', '2019-12-25 11:03:35', 1, '2020-12-25 12:35:38', 2),
(27, '天香仙酒雞', '/uploads/repicepro/1577244712.jpg', '', '鰹魚風味提升了啤酒的香氣、雞肉的甘甜，讓料理更有層次感！', '雞肉', '近期公開', '中式', '主菜', '1', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>2823</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>113.2</td>\r\n			<th>脂肪(g)</th>\r\n			<td>217</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>62</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>170</td>\r\n			<th>鐵(mg)</th>\r\n			<td>11</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>572</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>14.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.67</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>1.99</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>1.62</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>3.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>40</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>530</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>9.1</td>\r\n			<th>鹽分(g)</th>\r\n			<td>23.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>210</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 20, 0, 0, '', '2019-12-25 11:31:52', 1, '2021-05-06 00:44:21', 2),
(28, '鱈魚現芙蓉', '/uploads/repicepro/1577244998.jpg', '', '羹湯的最佳伙伴鰹魚風味與鱈魚再一次的滿分演出，清甜爽口，滑嫩入心！', '海鮮類', '近期公開', '中式', '主食', '1', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>646</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>83.3</td>\r\n			<th>脂肪(g)</th>\r\n			<td>7.1</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>60.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>330</td>\r\n			<th>鐵(mg)</th>\r\n			<td>5.9</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>681</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>7.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.58</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>1.3</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.73</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>4.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>110</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>240</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>8.3</td>\r\n			<th>鹽分(g)</th>\r\n			<td>11.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>400</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 16, 0, 0, '', '2019-12-25 11:36:38', 1, '2021-04-13 01:13:32', 2),
(29, '百香燻魚捲', '/uploads/repicepro/1577245313.jpg', '', '鰹魚風味緩和了百香果酸，不搶主菜的鋒頭而增加整體的完成度，絕配！', '海鮮類,瓜果類', '近期公開', '西式', '配菜', '1', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>905</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>50.1</td>\r\n			<th>脂肪(g)</th>\r\n			<td>28.3</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>110.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>160</td>\r\n			<th>鐵(mg)</th>\r\n			<td>3.1</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>243</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>7.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.64</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.56</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>1.17</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>3.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>46</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>350</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>3.8</td>\r\n			<th>鹽分(g)</th>\r\n			<td>3.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>200</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 78, 0, 0, '', '2019-12-25 11:41:53', 1, '2020-12-25 11:52:58', 2),
(30, '奶油香酥雞', '/uploads/repicepro/1577245509.jpg', '', '淋上有干貝鮮美風味的白醬，您還擔心客人不懂您料理的精彩嗎？', '雞肉', '近期公開', '西式', '主菜', '2', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>1547</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>72.6</td>\r\n			<th>脂肪(g)</th>\r\n			<td>113.7</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>53.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>520</td>\r\n			<th>鐵(mg)</th>\r\n			<td>4.3</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>780</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>2.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.64</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>1.57</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>1.06</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>2.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>47</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>420</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>10.7</td>\r\n			<th>鹽分(g)</th>\r\n			<td>9.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>299</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 10, 0, 0, '', '2019-12-25 11:45:09', 1, '2020-12-15 11:51:39', 2),
(31, '冬瓜春水鴨', '/uploads/repicepro/1577245711.jpg', '', '鰹魚風味讓清雅的冬瓜湯多了鮮甜，鋪上香嫩烤鴨肉，健康的巧思讓客人讚不絕口。', '其他', '近期公開', '中式', '湯羹類', '1', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>586</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>19.2</td>\r\n			<th>脂肪(g)</th>\r\n			<td>48.1</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>19.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>81</td>\r\n			<th>鐵(mg)</th>\r\n			<td>2.5</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>72</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.38</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.35</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.54</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>2.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>130</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>86</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>5.6</td>\r\n			<th>鹽分(g)</th>\r\n			<td>3.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>433</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 5, 0, 0, '', '2019-12-25 11:48:31', 1, '2020-12-16 11:33:17', 2),
(32, '百合養生湯', '/uploads/repicepro/1577245922.jpg', '', '養身氣息濃郁的百合湯裡，加上昆布風味增加鮮蔬的清甜，是客人吃膩山珍海味食的必備清新湯品。', '根莖類,瓜果類', '近期公開', '素食', '湯羹類', '3', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>203</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>5.3</td>\r\n			<th>脂肪(g)</th>\r\n			<td>5.9</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>36</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>69</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.6</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>10</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.14</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.17</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>23</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>91</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>0</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>8.5</td>\r\n			<th>鹽分(g)</th>\r\n			<td>2.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>260</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 8, 0, 0, '', '2019-12-25 11:52:02', 1, '2021-02-14 23:13:38', 2),
(33, '咖哩逗三鮮', '/uploads/repicepro/1577246178.jpg', '', '因鰹魚風味的加入，提升三鮮本身的層次感，不只促進客人食慾、連視覺也很享受喔！', '海鮮類', '近期公開', '中式', '主菜', '1', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>328</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>41.2</td>\r\n			<th>脂肪(g)</th>\r\n			<td>5.2</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>32.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>280</td>\r\n			<th>鐵(mg)</th>\r\n			<td>7</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>210</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>9.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.42</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.79</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.76</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>8.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>230</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>97</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>14.3</td>\r\n			<th>鹽分(g)</th>\r\n			<td>2.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>338</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 19, 0, 0, '', '2019-12-25 11:56:18', 1, '2021-02-18 21:27:50', 2),
(34, '涼夏什錦菇', '/uploads/repicepro/1577246352.jpg', '', '清爽的鮮菇加上昆布風味時，簡單的涼拌小品也能輕易吸引客人的味蕾。', '菇蕈類', '近期公開', '中式', '配菜', '3', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>101</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>9.5</td>\r\n			<th>脂肪(g)</th>\r\n			<td>1.5</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>20.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>51</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.2</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>26</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.49</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.63</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.45</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>72</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>0</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>8.1</td>\r\n			<th>鹽分(g)</th>\r\n			<td>4.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>345</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 3, 0, 0, '', '2019-12-25 11:59:12', 1, '2020-09-10 17:19:56', 2),
(35, '橙果風尚鮮', '/uploads/repicepro/1577251167.jpg', '', '干貝風味緩和水果特有的酸甜感，讓新鮮干貝與金黃鮮蝦呈現精緻風味，可是夏季的人氣佳餚喔！', '海鮮類', '近期公開', '中式', '主菜', '2', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>570</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>96.3</td>\r\n			<th>脂肪(g)</th>\r\n			<td>4.3</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>35.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>400</td>\r\n			<th>鐵(mg)</th>\r\n			<td>2.1</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>70</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>8.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.61</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.53</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>1.06</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>5.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>110</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>620</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>7.2</td>\r\n			<th>鹽分(g)</th>\r\n			<td>3.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>71</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 16, 0, 0, '', '2019-12-25 13:19:28', 1, '2020-12-22 15:31:18', 2),
(36, '鱸魚黃金湯', '/uploads/repicepro/1577251372.jpg', '', '干貝風味引誘出南瓜湯的香醇，與鮮嫩的鱸魚譜出黃金戀曲，是道賞心悅目的人間美味！', '海鮮類,瓜果類', '近期公開', '中式', '湯羹類', '2', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>615</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>76.8</td>\r\n			<th>脂肪(g)</th>\r\n			<td>15.5</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>34.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>130</td>\r\n			<th>鐵(mg)</th>\r\n			<td>4</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>817</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>9.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.29</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>1.16</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>1.47</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>7.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>63</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>240</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>8.7</td>\r\n			<th>鹽分(g)</th>\r\n			<td>2.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>273</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 11, 0, 0, '', '2019-12-25 13:22:52', 1, '2020-12-24 20:16:11', 2),
(37, '台式海鮮粥', '/uploads/repicepro/1577251656.jpg', '', '', '海鮮類', '近期公開', '小吃', '主食', '2', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>137</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>15.4</td>\r\n			<th>脂肪(g)</th>\r\n			<td>0.9</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>20.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>77</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.3</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>5</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.06</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.1</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.09</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>12.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>1</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>63</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>0.1</td>\r\n			<th>鹽分(g)</th>\r\n			<td>3.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>0</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 11, 0, 0, '', '2019-12-25 13:27:36', 1, '2021-01-26 11:14:45', 2),
(38, '水餃餡料', '/uploads/repicepro/1577252215.jpg', '', '', '豬肉', '近期公開', '小吃', '主食', '2', '50~60顆', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>1946</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>113.4</td>\r\n			<th>脂肪(g)</th>\r\n			<td>153.6</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>12.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>78</td>\r\n			<th>鐵(mg)</th>\r\n			<td>7.6</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>65</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>3.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>4.25</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>1.49</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>2.42</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>3.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>37</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>440</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>4.8</td>\r\n			<th>鹽分(g)</th>\r\n			<td>16.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>210</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 4, 0, 0, '', '2019-12-25 13:36:55', 1, '2020-12-15 10:57:34', 2);
INSERT INTO `recipepro` (`id`, `name`, `pic_url`, `pic_alt`, `feature`, `tags`, `price`, `type`, `style`, `product_ids`, `material_weight`, `nutrition`, `member_only`, `visitor`, `list_order`, `status`, `remark`, `c_time`, `c_user_id`, `u_time`, `u_user_id`) VALUES
(39, '土魠魚羹', '/uploads/repicepro/1577252578.jpg', '', '', '海鮮類', '近期公開', '小吃', '湯羹類', '2', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>170</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>16.5</td>\r\n			<th>脂肪(g)</th>\r\n			<td>7.6</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>7.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>23</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.8</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>151</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.09</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.29</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.33</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>1</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>45</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>1.1</td>\r\n			<th>鹽分(g)</th>\r\n			<td>2.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>45</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 7, 0, 0, '', '2019-12-25 13:42:58', 1, '2021-01-23 14:45:28', 2),
(40, '韭黃肉絲', '/uploads/repicepro/1577253247.jpg', '', '', '豬肉,根莖類', '近期公開', '小吃', '配菜', '2', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>121</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>7.3</td>\r\n			<th>脂肪(g)</th>\r\n			<td>7</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>7.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>17</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.7</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>79</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.26</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.12</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.19</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>10</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>17</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>2.3</td>\r\n			<th>鹽分(g)</th>\r\n			<td>0.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>88</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 12, 0, 0, '', '2019-12-25 13:54:09', 1, '2020-12-23 13:34:29', 2),
(41, '鮮筍蛤蜊湯', '/uploads/repicepro/1577253731.jpg', '', '', '海鮮類,根莖類', '近期公開', '小吃', '湯羹類', '2', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>37</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>4.2</td>\r\n			<th>脂肪(g)</th>\r\n			<td>0.3</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>4.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>180</td>\r\n			<th>鐵(mg)</th>\r\n			<td>3</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>160</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.08</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.19</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.17</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>8.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>88</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>8</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>2.9</td>\r\n			<th>鹽分(g)</th>\r\n			<td>1.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>130</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 13, 0, 0, '', '2019-12-25 14:02:11', 1, '2021-04-12 14:39:58', 2),
(42, '干貝香菇雞湯', '/uploads/repicepro/1577254039.jpg', '', '', '雞肉,菇蕈類', '近期公開', '小吃', '湯羹類', '2', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>203</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>13.9</td>\r\n			<th>脂肪(g)</th>\r\n			<td>14.3</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>3.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>9</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.8</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>35</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.08</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.23</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.16</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>2</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>67</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>1.8</td>\r\n			<th>鹽分(g)</th>\r\n			<td>2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>9</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 11, 0, 0, '', '2019-12-25 14:07:19', 1, '2020-12-13 12:02:53', 2),
(43, '鹽酥菇', '/uploads/repicepro/1577254202.jpg', '', '', '菇蕈類', '近期公開', '小吃', '其他', '3', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>78</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>4.2</td>\r\n			<th>脂肪(g)</th>\r\n			<td>6.1</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>3.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>79</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.2</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>18</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.06</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.16</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.07</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>0</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>6</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>1.7</td>\r\n			<th>鹽分(g)</th>\r\n			<td>0.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>50</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 23, 0, 0, '', '2019-12-25 14:10:02', 1, '2021-03-15 01:43:10', 2),
(44, '照燒豬肋排', '/uploads/repicepro/1577254413.jpg', '', '', '豬肉', '近期公開', '中式', '主菜', '1', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>591</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>45.2</td>\r\n			<th>脂肪(g)</th>\r\n			<td>17.2</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>60.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>520</td>\r\n			<th>鐵(mg)</th>\r\n			<td>6.5</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>703</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>3.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.64</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.49</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.94</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>120</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>33</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>9.5</td>\r\n			<th>鹽分(g)</th>\r\n			<td>8.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>608</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 7, 0, 0, '', '2019-12-25 14:13:33', 1, '2021-02-24 21:10:14', 2),
(45, '四神湯', '/uploads/repicepro/1577254664.jpg', '', '', '豬肉,其他', '近期公開', '小吃', '湯羹類', '3', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>365</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>15.4</td>\r\n			<th>脂肪(g)</th>\r\n			<td>13.9</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>42.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>19</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.3</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>13</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.18</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.09</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.08</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>1</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>200</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>0</td>\r\n			<th>鹽分(g)</th>\r\n			<td>1.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>0</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 13, 0, 0, '', '2019-12-25 14:17:44', 1, '2020-12-24 20:05:24', 2),
(46, '滷味小菜', '/uploads/repicepro/1577255762.jpg', '', '', '牛肉,豆類,蛋', '近期公開', '小吃', '其他', '1', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>1501</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>50.2</td>\r\n			<th>脂肪(g)</th>\r\n			<td>125</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>33.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>260</td>\r\n			<th>鐵(mg)</th>\r\n			<td>4.9</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>187</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>3.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.23</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.71</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.28</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>2.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>10</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>580</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>4</td>\r\n			<th>鹽分(g)</th>\r\n			<td>7.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>25</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 13, 0, 0, '', '2019-12-25 14:27:15', 1, '2021-01-31 07:41:11', 2),
(47, '香菇肉羹湯', '/uploads/repicepro/1577255596.jpg', '', '', '豬肉,菇蕈類,蛋', '近期公開', '小吃', '湯羹類', '1', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>213</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>17.4</td>\r\n			<th>脂肪(g)</th>\r\n			<td>8.8</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>15.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>23</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.9</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>112</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.61</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.25</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.31</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>3</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>99</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>2.2</td>\r\n			<th>鹽分(g)</th>\r\n			<td>1.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>52</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 12, 0, 0, '', '2019-12-25 14:33:16', 1, '2021-03-08 13:42:29', 2),
(48, '什錦炒麵', '/uploads/repicepro/1577256053.jpg', '', '', '海鮮類', '近期公開', '小吃', '主食', '1', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>270</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>23.2</td>\r\n			<th>脂肪(g)</th>\r\n			<td>5.3</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>30.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>64</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.8</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>79</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.24</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.13</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.24</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>30</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>210</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>3.2</td>\r\n			<th>鹽分(g)</th>\r\n			<td>2.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>94</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 11, 0, 0, '', '2019-12-25 14:40:54', 1, '2021-01-27 10:46:50', 2),
(49, '蚵仔麵線', '/uploads/repicepro/1577256311.jpg', '', '', '海鮮類', '近期公開', '小吃', '主食', '1', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>304</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>28.6</td>\r\n			<th>脂肪(g)</th>\r\n			<td>12.6</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>17.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>43</td>\r\n			<th>鐵(mg)</th>\r\n			<td>2</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>73</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.04</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.09</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.03</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>6.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>2</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>140</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>0.7</td>\r\n			<th>鹽分(g)</th>\r\n			<td>2.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>18</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 17, 0, 0, '', '2019-12-25 14:45:11', 1, '2020-12-15 11:04:00', 2),
(50, '台式海鮮味噌湯', '/uploads/repicepro/1577256701.jpg', '', '', '海鮮類', '近期公開', '日式', '湯羹類', '1', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>190</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>22.9</td>\r\n			<th>脂肪(g)</th>\r\n			<td>6</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>9.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>150</td>\r\n			<th>鐵(mg)</th>\r\n			<td>2.8</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>142</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.12</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.26</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.27</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>17.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>26</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>72</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>1.3</td>\r\n			<th>鹽分(g)</th>\r\n			<td>3.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>35</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 10, 0, 0, '', '2019-12-25 14:51:41', 1, '2021-03-22 14:18:14', 2),
(51, '蟹柳冷蕎麥麵', '/uploads/repicepro/1577256911.jpg', '', '', '海鮮類', '近期公開', '小吃', '主食', '1', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>241</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>16.3</td>\r\n			<th>脂肪(g)</th>\r\n			<td>4.8</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>30.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>55</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.8</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>113</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.17</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.18</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.14</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>5.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>7</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>130</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>2.1</td>\r\n			<th>鹽分(g)</th>\r\n			<td>4.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>10</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 4, 0, 0, '', '2019-12-25 14:55:11', 1, '2020-05-23 21:56:55', 2),
(52, 'XO醬海鮮盞', '/uploads/repicepro/1577257395.jpg', '', '', '海鮮類', '近期公開', '中式', '配菜', '2', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>518</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>30.9</td>\r\n			<th>脂肪(g)</th>\r\n			<td>26.4</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>45.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>130</td>\r\n			<th>鐵(mg)</th>\r\n			<td>2.4</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>167</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>3.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.28</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.27</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.55</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>1.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>16</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>110</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>9.9</td>\r\n			<th>鹽分(g)</th>\r\n			<td>3.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>161</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 18, 0, 0, '', '2019-12-25 15:03:15', 1, '2021-03-15 01:44:10', 2),
(53, '七味脆皮炸生蠔', '/uploads/repicepro/1577257618.jpg', '', '', '海鮮類', '近期公開', '中式', '配菜', '2', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>1370</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>38</td>\r\n			<th>脂肪(g)</th>\r\n			<td>93.6</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>98.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>540</td>\r\n			<th>鐵(mg)</th>\r\n			<td>8.7</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>474</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>3.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.51</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.82</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.45</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>21.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>36</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>280</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>11.8</td>\r\n			<th>鹽分(g)</th>\r\n			<td>6.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>94</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 12, 0, 0, '', '2019-12-25 15:06:58', 1, '2021-03-15 01:33:37', 2),
(54, '上湯魚生鍋', '/uploads/repicepro/1577257816.jpg', '', '', '海鮮類', '近期公開', '中式', '火鍋', '2', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>699</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>43.7</td>\r\n			<th>脂肪(g)</th>\r\n			<td>35.7</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>54</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>270</td>\r\n			<th>鐵(mg)</th>\r\n			<td>2.9</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>243</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>6.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.32</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.47</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.6</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>2.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>14</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>92</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>5.6</td>\r\n			<th>鹽分(g)</th>\r\n			<td>9.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>80</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 9, 0, 0, '', '2019-12-25 15:10:16', 1, '2020-09-14 04:10:47', 2),
(55, '干貝白果雞肉粥', '/uploads/repicepro/1577258001.jpg', '', '', '雞肉,海鮮類', '近期公開', '中式', '主食', '2', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>1296</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>97.3</td>\r\n			<th>脂肪(g)</th>\r\n			<td>58.3</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>87.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>100</td>\r\n			<th>鐵(mg)</th>\r\n			<td>4.7</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>215</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>7.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.69</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>1.02</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>1.22</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>4.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>29</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>570</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>4.8</td>\r\n			<th>鹽分(g)</th>\r\n			<td>16.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>85</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 9, 0, 0, '', '2019-12-25 15:13:21', 1, '2021-04-23 13:50:29', 2),
(56, '海皇蒸乳酪', '/uploads/repicepro/1577258717.jpg', '', '', '海鮮類', '近期公開', '中式', '湯羹類', '2', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>450</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>68</td>\r\n			<th>脂肪(g)</th>\r\n			<td>9</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>22.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>280</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.9</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>516</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>6.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.27</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.82</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.39</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>10.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>9</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>220</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>4</td>\r\n			<th>鹽分(g)</th>\r\n			<td>7.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>91</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 6, 0, 0, '', '2019-12-25 15:25:17', 1, '2020-12-24 20:04:34', 2),
(57, '水晶白玉捲', '/uploads/repicepro/1577259033.jpg', '', '', '海鮮類,葉菜類,瓜果類', '近期公開', '中式', '配菜', '2', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>438</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>27.8</td>\r\n			<th>脂肪(g)</th>\r\n			<td>25.9</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>29.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>500</td>\r\n			<th>鐵(mg)</th>\r\n			<td>6.2</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>699</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>4.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.27</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.52</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.56</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>1.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>190</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>190</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>11.8</td>\r\n			<th>鹽分(g)</th>\r\n			<td>5.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>625</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 13, 0, 0, '', '2019-12-25 15:30:33', 1, '2020-12-25 11:51:07', 2),
(58, '冬瑤燉雞湯', '/uploads/repicepro/1577259198.jpg', '', '', '雞肉,瓜果類', '近期公開', '中式', '湯羹類', '2', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>1562</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>147.7</td>\r\n			<th>脂肪(g)</th>\r\n			<td>95.1</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>11.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>96</td>\r\n			<th>鐵(mg)</th>\r\n			<td>5</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>370</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.61</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.94</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>2.42</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>2.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>98</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>630</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>2.9</td>\r\n			<th>鹽分(g)</th>\r\n			<td>4.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>210</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 9, 0, 0, '', '2019-12-25 15:33:19', 1, '2021-04-29 16:52:55', 2),
(59, '芝士海鮮塔', '/uploads/repicepro/1577259468.jpg', '', '', '海鮮類', '近期公開', '中式', '其他', '2', '４人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>758</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>52.6</td>\r\n			<th>脂肪(g)</th>\r\n			<td>36.4</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>53.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>350</td>\r\n			<th>鐵(mg)</th>\r\n			<td>2.3</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>308</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>8.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.31</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.59</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.74</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>10.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>150</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>280</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>4.6</td>\r\n			<th>鹽分(g)</th>\r\n			<td>3.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>185</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 5, 0, 0, '', '2019-12-25 15:37:48', 1, '2021-04-30 23:07:19', 2),
(60, '金湯海皇羹', '/uploads/repicepro/1577259702.jpg', '', '', '海鮮類,瓜果類,菇蕈類', '近期公開', '中式', '湯羹類', '2', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>886</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>49.7</td>\r\n			<th>脂肪(g)</th>\r\n			<td>17.6</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>140.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>240</td>\r\n			<th>鐵(mg)</th>\r\n			<td>4.3</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>311</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>13.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.9</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.81</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>1.69</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>2.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>130</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>140</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>25.3</td>\r\n			<th>鹽分(g)</th>\r\n			<td>15.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>773</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 5, 0, 0, '', '2019-12-25 15:41:42', 1, '2020-12-24 20:11:45', 2),
(61, '春筍燉三寶', '/uploads/repicepro/1577261539.jpg', '', '', '豬肉,根莖類', '近期公開', '中式', '湯羹類', '2', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>485</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>40.5</td>\r\n			<th>脂肪(g)</th>\r\n			<td>26.4</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>25.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>78</td>\r\n			<th>鐵(mg)</th>\r\n			<td>10.5</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>14</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>2.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.55</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.7</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.42</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>27</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>230</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>15.2</td>\r\n			<th>鹽分(g)</th>\r\n			<td>8.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>234</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 12, 0, 0, '', '2019-12-25 16:12:19', 1, '2021-02-24 19:48:47', 2),
(62, '銀芽干貝酥', '/uploads/repicepro/1577261728.jpg', '', '', '海鮮類', '近期公開', '中式', '配菜', '2', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>288</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>41.2</td>\r\n			<th>脂肪(g)</th>\r\n			<td>5.2</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>20.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>65</td>\r\n			<th>鐵(mg)</th>\r\n			<td>2</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>46</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>4.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.26</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.43</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.54</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>2.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>160</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>75</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>6.6</td>\r\n			<th>鹽分(g)</th>\r\n			<td>7.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>455</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 13, 0, 0, '', '2019-12-25 16:15:28', 1, '2021-03-25 12:30:40', 2),
(63, '鮭魚干貝炒飯', '/uploads/repicepro/1577262076.jpg', '', '', '海鮮類,蛋', '近期公開', '中式', '主食', '2', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>850</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>64.4</td>\r\n			<th>脂肪(g)</th>\r\n			<td>32.6</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>66.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>110</td>\r\n			<th>鐵(mg)</th>\r\n			<td>3.4</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>313</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>4.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.47</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.86</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.77</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>7.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>17</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>610</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>3.9</td>\r\n			<th>鹽分(g)</th>\r\n			<td>9.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>65</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 11, 0, 0, '', '2019-12-25 16:21:16', 1, '2021-04-07 10:40:24', 2),
(64, '蟹肉干貝濃湯', '/uploads/repicepro/1577262417.jpg', '', '', '海鮮類', '近期公開', '西式', '湯羹類', '2', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>873</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>66</td>\r\n			<th>脂肪(g)</th>\r\n			<td>38.6</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>66</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>450</td>\r\n			<th>鐵(mg)</th>\r\n			<td>2.9</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>510</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>9.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.38</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.72</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.68</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>16.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>59</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>340</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>8.4</td>\r\n			<th>鹽分(g)</th>\r\n			<td>17.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>292</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 14, 0, 0, '', '2019-12-25 16:26:57', 1, '2021-01-21 09:11:41', 2),
(65, '昆布菌菇鍋', '/uploads/repicepro/1577262723.jpg', '', '', '菇蕈類', '近期公開', '素食', '火鍋', '3', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>539</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>45.3</td>\r\n			<th>脂肪(g)</th>\r\n			<td>27.4</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>41.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>520</td>\r\n			<th>鐵(mg)</th>\r\n			<td>9.4</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>275</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>4.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.67</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.99</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.67</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.99</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>0.67</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>0.1</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>52</td>\r\n			<th>鹽分(g)</th>\r\n			<td>0</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>19.7</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 8, 0, 0, '', '2019-12-25 16:32:03', 1, '2021-04-12 15:12:07', 2),
(66, '燕語花香凍', '/uploads/repicepro/1577263255.jpg', '', '', '根莖類,瓜果類', '近期公開', '中式', '配菜', '3', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>179</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>7.5</td>\r\n			<th>脂肪(g)</th>\r\n			<td>4.9</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>31.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>210</td>\r\n			<th>鐵(mg)</th>\r\n			<td>2.5</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>83</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>2.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.17</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.14</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.29</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>53</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>0</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>8.9</td>\r\n			<th>鹽分(g)</th>\r\n			<td>5.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>173</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 10, 0, 0, '', '2019-12-25 16:40:55', 1, '2020-12-25 12:05:42', 2),
(67, '羅漢上素齋', '/uploads/repicepro/1577263618.jpg', '', '', '根莖類,菇蕈類,其他', '近期公開', '素食', '配菜', '3', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>326</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>21.1</td>\r\n			<th>脂肪(g)</th>\r\n			<td>6.6</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>52.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>180</td>\r\n			<th>鐵(mg)</th>\r\n			<td>10.4</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>483</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>4.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.55</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>1.31</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.43</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>73</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>0</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>11.6</td>\r\n			<th>鹽分(g)</th>\r\n			<td>3.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>359</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 23, 0, 0, '', '2019-12-25 16:46:58', 1, '2020-12-25 12:37:25', 2),
(68, '翡翠炒雙霸', '/uploads/repicepro/1577265457.jpg', '', '', '海鮮類,瓜果類', '近期公開', '中式', '主菜', '1', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>368</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>34.5</td>\r\n			<th>脂肪(g)</th>\r\n			<td>4.9</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>58.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>110</td>\r\n			<th>鐵(mg)</th>\r\n			<td>3</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>93</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>4.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.47</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.62</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.95</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>1.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>190</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>99</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>17.8</td>\r\n			<th>鹽分(g)</th>\r\n			<td>10.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>324</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 10, 0, 0, '', '2019-12-25 17:17:37', 1, '2021-04-26 11:55:56', 2),
(69, '西湖蓴菜牛肉羹', '/uploads/repicepro/1577265685.jpg', '', '', '牛肉,根莖類,菇蕈類,豆類', '近期公開', '中式', '火鍋', '1', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>629</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>49.5</td>\r\n			<th>脂肪(g)</th>\r\n			<td>35.8</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>28.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>150</td>\r\n			<th>鐵(mg)</th>\r\n			<td>5.1</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>19</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>3.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.34</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.82</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.65</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>2.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>110</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>100</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>6</td>\r\n			<th>鹽分(g)</th>\r\n			<td>9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>228</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 9, 0, 0, '', '2019-12-25 17:21:25', 1, '2020-12-16 12:13:37', 2),
(70, '豆漿蒸石斑捲', '/uploads/repicepro/1577265921.jpg', '', '', '海鮮類,豆類', '近期公開', '中式', '主菜', '1', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>671</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>44.4</td>\r\n			<th>脂肪(g)</th>\r\n			<td>34.3</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>53.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>240</td>\r\n			<th>鐵(mg)</th>\r\n			<td>8.4</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>162</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>14.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.47</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.53</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.66</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>2.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>140</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>89</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>22.2</td>\r\n			<th>鹽分(g)</th>\r\n			<td>4.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>191</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 11, 0, 0, '', '2019-12-25 17:25:21', 1, '2020-12-17 11:08:17', 2),
(71, '金縷琵琶蝦', '/uploads/repicepro/1577266325.jpg', '', '', '海鮮類', '近期公開', '中式', '主菜', '1', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>448</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>40.3</td>\r\n			<th>脂肪(g)</th>\r\n			<td>21.5</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>20</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>140</td>\r\n			<th>鐵(mg)</th>\r\n			<td>2.7</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>79</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>5.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.19</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.22</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.37</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>2.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>23</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>340</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>3.5</td>\r\n			<th>鹽分(g)</th>\r\n			<td>7.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>135</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 16, 0, 0, '', '2019-12-25 17:32:05', 1, '2020-12-14 11:43:34', 2),
(72, '義式蕃茄海鮮湯', '/uploads/repicepro/1577266626.jpg', '', '', '海鮮類', '近期公開', '西式', '湯羹類', '1', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>695</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>92.9</td>\r\n			<th>脂肪(g)</th>\r\n			<td>18.2</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>37.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>360</td>\r\n			<th>鐵(mg)</th>\r\n			<td>6.7</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>305</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>12.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.53</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.71</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>1.25</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>45.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>68</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>1300</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>6.5</td>\r\n			<th>鹽分(g)</th>\r\n			<td>12.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>365</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 12, 0, 0, '', '2019-12-25 17:37:06', 1, '2021-01-31 07:41:12', 2),
(73, '翡翠海鮮羹', '/uploads/repicepro/1577266833.jpg', '', '', '海鮮類', '近期公開', '中式', '湯羹類', '1', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>451</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>45.2</td>\r\n			<th>脂肪(g)</th>\r\n			<td>7.5</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>52</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>160</td>\r\n			<th>鐵(mg)</th>\r\n			<td>4.1</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>482</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>6.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.4</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.86</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.68</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>2.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>50</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>120</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>6.7</td>\r\n			<th>鹽分(g)</th>\r\n			<td>9.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>173</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 7, 0, 0, '', '2019-12-25 17:40:33', 1, '2021-03-17 04:25:05', 2),
(74, '蟹黃海鮮煲', '/uploads/repicepro/1577267103.jpg', '', '', '海鮮類', '近期公開', '中式', '主菜', '1', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>809</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>64.7</td>\r\n			<th>脂肪(g)</th>\r\n			<td>45.8</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>35.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>370</td>\r\n			<th>鐵(mg)</th>\r\n			<td>5.6</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>36</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>6.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.76</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.6</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.78</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>4.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>33</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>150</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>11</td>\r\n			<th>鹽分(g)</th>\r\n			<td>8.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>112</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 24, 0, 0, '', '2019-12-25 17:45:03', 1, '2021-04-26 11:55:49', 2),
(75, '香雞蘋果花', '/uploads/repicepro/1577267278.jpg', '', '咬開香軟的蛋皮，淡淡的蘋果香氣與清脆蘋果粒， 伴隨著嫩甜的雞肉丁，口感層次更加豐當。', '雞肉,蛋', '近期公開', '中式', '配菜', '1', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>217</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>10.2</td>\r\n			<th>脂肪(g)</th>\r\n			<td>17.3</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>5.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>33</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.2</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>62</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.1</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.21</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.12</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>2</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>140</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>1.1</td>\r\n			<th>鹽分(g)</th>\r\n			<td>0.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>0</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 9, 0, 0, '', '2019-12-25 17:47:58', 1, '2020-12-25 11:44:59', 2),
(76, '蝦泥百花環', '/uploads/repicepro/1577267431.jpg', '', '蝦泥的鲜甜配上大黃瓜的清脆，加上鰹魚風味，整體風味更加融合！', '海鮮類', '近期公開', '中式', '配菜', '1', '4顆', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>64</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>12</td>\r\n			<th>脂肪(g)</th>\r\n			<td>0.3</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>3.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>47</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.8</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>21</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.04</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.09</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.09</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>10</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>92</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>0.8</td>\r\n			<th>鹽分(g)</th>\r\n			<td>0.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>65</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 20, 0, 0, '', '2019-12-25 17:50:31', 1, '2021-03-15 01:49:35', 2),
(77, '酸辣月中鮮', '/uploads/repicepro/1577267678.jpg', '', '鰹魚風味讓湯中的海鲜食材鲜美無比， 締造出與一般酸辣湯不同的層次與風味！', '海鮮類', '近期公開', '中式', '湯羹類', '1', '４人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>140</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>17</td>\r\n			<th>脂肪(g)</th>\r\n			<td>5.9</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>2.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>51</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.7</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>42</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.08</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.16</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.11</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>6.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>2</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>240</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>0.1</td>\r\n			<th>鹽分(g)</th>\r\n			<td>2.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>0</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 9, 0, 0, '', '2019-12-25 17:54:38', 1, '2020-12-16 11:48:32', 2);
INSERT INTO `recipepro` (`id`, `name`, `pic_url`, `pic_alt`, `feature`, `tags`, `price`, `type`, `style`, `product_ids`, `material_weight`, `nutrition`, `member_only`, `visitor`, `list_order`, `status`, `remark`, `c_time`, `c_user_id`, `u_time`, `u_user_id`) VALUES
(78, '紫米金瓜露', '/uploads/repicepro/1577267889.jpg', '', ' 一咬開竹笙所包覆的紫米球， 鬆軟中是滲著干貝鮮甜的豬里肌， 搭配濃醇的南瓜沾醬，風味獨特！', '豬肉,瓜果類', '近期公開', '中式', '其他', '2', '４顆', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>340</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>19.3</td>\r\n			<th>脂肪(g)</th>\r\n			<td>13.1</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>33.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>23</td>\r\n			<th>鐵(mg)</th>\r\n			<td>2.6</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>36</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.54</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.29</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.36</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>9</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>35</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>2.7</td>\r\n			<th>鹽分(g)</th>\r\n			<td>1.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>60</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 11, 0, 0, '', '2019-12-25 17:58:09', 1, '2021-03-15 01:42:45', 2),
(79, '黃金野菇濃湯', '/uploads/repicepro/1577268090.jpg', '', '奶油為湯底的濃湯，以干貝風味引出甘甜口感，搭配地瓜及新鲜菌菇，沒有一般奶油濃湯的甜膩感。', '根莖類,菇蕈類', '近期公開', '中式', '湯羹類', '2', '４人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>644</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>13.5</td>\r\n			<th>脂肪(g)</th>\r\n			<td>47</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>40.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>160</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.8</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>323</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>2.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>1.13</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>6.34</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.28</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>24</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>110</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>2.7</td>\r\n			<th>鹽分(g)</th>\r\n			<td>1.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>134</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 16, 0, 0, '', '2019-12-25 18:01:30', 1, '2020-12-30 19:59:24', 2),
(80, '鯛魚金閣捲', '/uploads/repicepro/1577268300.jpg', '', '潮鯛用干貝風味事先醃過，經過烹煮風味更清甜， 搭配酥脆海苔與芝麻的香氣， 彈牙多汁！', '海鮮類', '近期公開', '中式', '配菜', '2', '4小捲', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>366</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>19.6</td>\r\n			<th>脂肪(g)</th>\r\n			<td>27.9</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>54</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.2</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>200</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>4.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.32</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.27</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.5</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>3.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>12</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>100</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>2.9</td>\r\n			<th>鹽分(g)</th>\r\n			<td>0.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>56</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 13, 0, 0, '', '2019-12-25 18:05:00', 1, '2021-01-25 14:58:49', 2),
(81, '鮮蔬羅宋湯', '/uploads/repicepro/1577325021.jpg', '', '昆布風味巧妙融合各種鮮蔬風味， 讓沒有肉品加持的湯頭，也能有濃郁的滋味！', '根莖類,瓜果類', '近期公開', '素食', '主菜', '3', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>110</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>3.4</td>\r\n			<th>脂肪(g)</th>\r\n			<td>2.2</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>21.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>53</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.1</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>225</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>3.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.17</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.11</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.33</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>38</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>0</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>6.6</td>\r\n			<th>鹽分(g)</th>\r\n			<td>0.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>137</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 3, 0, 0, '', '2019-12-26 09:50:21', 1, '2020-10-09 08:26:27', 2),
(82, '秋蟹淮山柳', '/uploads/repicepro/1577325263.jpg', '', '軟綿帶Q感的山藥，沾上昆布風味所調的蟹粉醬汁，亦爽朗亦香濃，十足創意招牌菜！', '海鮮類,根莖類', '近期公開', '中式', '配菜', '3', '４捲', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>201</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>7</td>\r\n			<th>脂肪(g)</th>\r\n			<td>13</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>13.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>250</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.2</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>135</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>2.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.14</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.19</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.12</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>1.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>7</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>24</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>1.2</td>\r\n			<th>鹽分(g)</th>\r\n			<td>0.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>90</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 19, 0, 0, '', '2019-12-26 09:54:23', 1, '2020-12-25 12:17:45', 2),
(83, '四喜鑲中卷', '/uploads/repicepro/1577325899.jpg', '', '', '海鮮類,根莖類', '近期公開', '中式', '主菜', '1', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>145</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>16</td>\r\n			<th>脂肪(g)</th>\r\n			<td>2.8</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>13</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>27</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.8</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>113</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.08</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.11</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.14</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>1.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>10</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>320</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>1.6</td>\r\n			<th>鹽分(g)</th>\r\n			<td>1.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>21</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 14, 0, 0, '', '2019-12-26 10:04:59', 1, '2021-04-13 01:14:35', 2),
(84, '杏香鳳翼翅', '/uploads/repicepro/1577326399.jpg', '', '', '雞肉,海鮮類', '近期公開', '中式', '配菜', '2', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>216</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>13.1</td>\r\n			<th>脂肪(g)</th>\r\n			<td>13.1</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>7.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>16</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.6</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>59</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.06</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0..09</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.25</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>2.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>2</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>76</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>0.5</td>\r\n			<th>鹽分(g)</th>\r\n			<td>7.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>8</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 13, 0, 0, '', '2019-12-26 10:13:19', 1, '2021-03-31 11:21:24', 2),
(85, '春筍荔芋素香盅', '/uploads/repicepro/1577326610.jpg', '', '', '根莖類', '近期公開', '中式', '主菜', '3', '1盅', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>268</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>9.1</td>\r\n			<th>脂肪(g)</th>\r\n			<td>2</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>61.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>66</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.8</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>8</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.26</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.28</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.3</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>40</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>0</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>9.9</td>\r\n			<th>鹽分(g)</th>\r\n			<td>4.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>55</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 12, 0, 0, '', '2019-12-26 10:16:50', 1, '2020-12-15 11:13:18', 2),
(86, '珍菇絲瓜捲', '/uploads/repicepro/1577326839.jpg', '', '', '瓜果類,菇蕈類', '近期公開', '中式', '主菜', '3', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>61</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>1.5</td>\r\n			<th>脂肪(g)</th>\r\n			<td>3.1</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>7.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>12</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.3</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>92</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.06</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.07</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.1</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>16</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>0</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>1.3</td>\r\n			<th>鹽分(g)</th>\r\n			<td>2.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>62</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 8, 0, 0, '', '2019-12-26 10:20:39', 1, '2020-12-25 13:06:36', 2),
(87, '琵琶豆腐煲', '/uploads/repicepro/1577327114.jpg', '', '', '菇蕈類,豆類', '近期公開', '中式', '主菜', '3', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>183</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>7.4</td>\r\n			<th>脂肪(g)</th>\r\n			<td>4.3</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>21.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>58</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.6</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>30</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.16</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.21</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.14</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>32</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>0</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>6.3</td>\r\n			<th>鹽分(g)</th>\r\n			<td>6.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>51</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 11, 0, 0, '', '2019-12-26 10:25:14', 1, '2020-12-17 10:50:10', 2),
(88, '葡汁焗雙蔬', '/uploads/repicepro/1577327375.jpg', '', '', '葉菜類', '近期公開', '中式', '主菜', '2', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>142</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>6.8</td>\r\n			<th>脂肪(g)</th>\r\n			<td>100</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>6.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>110</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.9</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>74</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.1</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.7</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.1</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>10</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>28</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>1.6</td>\r\n			<th>鹽分(g)</th>\r\n			<td>3.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>64</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 10, 0, 0, '', '2019-12-26 10:29:35', 1, '2021-03-05 12:57:48', 2),
(89, '日式豆腐牛五花', '/uploads/repicepro/1577327881.jpg', '', '', '牛肉,豆類', '近期公開', '日式', '主菜', '1', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>361</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>16.6</td>\r\n			<th>脂肪(g)</th>\r\n			<td>24.3</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>14.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>130</td>\r\n			<th>鐵(mg)</th>\r\n			<td>2.8</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>156</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.14</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.14</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.32</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>4</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>40</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>3.2</td>\r\n			<th>鹽分(g)</th>\r\n			<td>2.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>63</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 14, 0, 0, '', '2019-12-26 10:38:01', 1, '2021-01-19 23:34:22', 2),
(90, '鰈魚梅花煮', '/uploads/repicepro/1577328044.jpg', '', '', '海鮮類', '近期公開', '日式', '主菜', '1', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>98</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>11.9</td>\r\n			<th>脂肪(g)</th>\r\n			<td>0.9</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>9.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>41</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.8</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>78</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.09</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.28</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.15</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>1.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>11</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>36</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>1.9</td>\r\n			<th>鹽分(g)</th>\r\n			<td>3.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>48</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 6, 0, 0, '', '2019-12-26 10:40:44', 1, '2020-12-17 10:27:59', 2),
(91, '南蠻風雞肉', '/uploads/repicepro/1577328363.jpg', '', '', '雞肉', '近期公開', '日式', '主菜', '1', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>424</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>27.8</td>\r\n			<th>脂肪(g)</th>\r\n			<td>21.4</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>25.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>52</td>\r\n			<th>鐵(mg)</th>\r\n			<td>2.1</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>151</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>3.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.24</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.36</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.7</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>84</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>130</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>5.1</td>\r\n			<th>鹽分(g)</th>\r\n			<td>3.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>105</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 7, 0, 0, '', '2019-12-26 10:46:03', 1, '2020-12-09 17:41:09', 2),
(92, '日式白菜燉豬肉', '/uploads/repicepro/1577328536.jpg', '', '', '豬肉,葉菜類', '近期公開', '日式', '主菜', '1', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>325</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>8.4</td>\r\n			<th>脂肪(g)</th>\r\n			<td>20.2</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>22.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>73</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.8</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>18</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.28</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.11</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.27</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>31</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>5</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>2.1</td>\r\n			<th>鹽分(g)</th>\r\n			<td>31</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>160</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 9, 0, 0, '', '2019-12-26 10:48:56', 1, '2021-01-28 12:27:21', 2),
(93, '照燒獅魚', '/uploads/repicepro/1577328694.jpg', '', '', '海鮮類', '近期公開', '日式', '主菜', '1', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>356</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>23.4</td>\r\n			<th>脂肪(g)</th>\r\n			<td>17.8</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>17.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>40</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.8</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>56</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>2.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.28</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.43</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.55</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>3.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>26</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>72</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>1.9</td>\r\n			<th>鹽分(g)</th>\r\n			<td>2.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>125</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 5, 0, 0, '', '2019-12-26 10:51:34', 1, '2020-12-15 11:49:22', 2),
(94, '日式酥炸雞排', '/uploads/repicepro/1577329054.jpg', '', '', '雞肉', '近期公開', '日式', '主菜', '1', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>531</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>19.1</td>\r\n			<th>脂肪(g)</th>\r\n			<td>34</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>34.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>70</td>\r\n			<th>鐵(mg)</th>\r\n			<td>2.3</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>176</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.15</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.36</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.27</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>10</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>240</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>1.8</td>\r\n			<th>鹽分(g)</th>\r\n			<td>4.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>79</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 7, 0, 0, '', '2019-12-26 10:57:34', 1, '2021-01-19 23:35:57', 2),
(95, '日式燉煮五花肉', '/uploads/repicepro/1577329297.jpg', '', '', '豬肉', '近期公開', '日式', '主菜', '1', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>997</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>30.2</td>\r\n			<th>脂肪(g)</th>\r\n			<td>80.7</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>19.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>40</td>\r\n			<th>鐵(mg)</th>\r\n			<td>2.7</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>193</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.97</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.36</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.58</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>20</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>140</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>1.5</td>\r\n			<th>鹽分(g)</th>\r\n			<td>5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>55</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 19, 0, 0, '', '2019-12-26 11:01:37', 1, '2021-02-14 23:12:17', 2),
(96, '馬鈴薯燉雞絞肉', '/uploads/repicepro/1577329666.jpg', '', '', '雞肉,根莖類', '近期公開', '日式', '主菜', '1', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>223</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>10</td>\r\n			<th>脂肪(g)</th>\r\n			<td>4.9</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>28.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>22</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.9</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>157</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.13</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.13</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.44</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>26</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>32</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>7.9</td>\r\n			<th>鹽分(g)</th>\r\n			<td>2.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>120</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 11, 0, 0, '', '2019-12-26 11:07:46', 1, '2021-03-27 04:40:55', 2),
(97, '雞翅日式燉煮', '/uploads/repicepro/1577329969.jpg', '', '', '雞肉,根莖類', '近期公開', '日式', '主菜', '1', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>227</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>13.8</td>\r\n			<th>脂肪(g)</th>\r\n			<td>11.4</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>13.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>38</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.8</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>36</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.08</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.1</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.28</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>11</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>84</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>1.2</td>\r\n			<th>鹽分(g)</th>\r\n			<td>2.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>90</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 1, 0, 0, 0, '', '2019-12-26 11:12:49', 1, '2020-01-30 16:54:39', 7),
(98, '鱈魚牛蒡日式燉煮', '/uploads/repicepro/1577330240.jpg', '', '', '海鮮類,根莖類', '近期公開', '日式', '配菜', '1', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>399</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>29.8</td>\r\n			<th>脂肪(g)</th>\r\n			<td>0.7</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>61.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>190</td>\r\n			<th>鐵(mg)</th>\r\n			<td>2.4</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>1396</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>3.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.38</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.36</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.53</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>1.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>18</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>75</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>16.2</td>\r\n			<th>鹽分(g)</th>\r\n			<td>4.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>400</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 1, 0, 0, '', '2019-12-26 11:17:20', 1, '2020-12-25 11:50:49', 2),
(99, '和風雞肉丸', '/uploads/repicepro/1577330539.jpg', '', '', '雞肉', '近期公開', '日式', '主菜', '1', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>412</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>17.4</td>\r\n			<th>脂肪(g)</th>\r\n			<td>27</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>17.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>10</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.5</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>7</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.08</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.09</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.07</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>9</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>0</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>1.4</td>\r\n			<th>鹽分(g)</th>\r\n			<td>4.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>45</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 7, 0, 0, '', '2019-12-26 11:22:19', 1, '2021-04-27 13:49:30', 2),
(100, '南蠻風鯖魚煮', '/uploads/repicepro/1577331199.jpg', '', '', '海鮮類', '近期公開', '日式', '主菜', '1', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>326</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>33.2</td>\r\n			<th>脂肪(g)</th>\r\n			<td>6.4</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>29.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>89</td>\r\n			<th>鐵(mg)</th>\r\n			<td>3.6</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>185</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.31</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.51</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>1.01</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>15.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>45</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>72</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>2.5</td>\r\n			<th>鹽分(g)</th>\r\n			<td>5.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>82</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 9, 0, 0, '', '2019-12-26 11:33:19', 1, '2020-12-25 12:55:14', 2),
(101, '辣炒花枝', '/uploads/repicepro/1577331734.jpg', '', '', '海鮮類', '近期公開', '韓式', '主菜', '1', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>358</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>20.1</td>\r\n			<th>脂肪(g)</th>\r\n			<td>10.2</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>47.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>160</td>\r\n			<th>鐵(mg)</th>\r\n			<td>2.4</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>381</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>3.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.2</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.26</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.57</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>1.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>66</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>1</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>7.8</td>\r\n			<th>鹽分(g)</th>\r\n			<td>3.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>216</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 9, 0, 0, '', '2019-12-26 11:42:14', 1, '2021-05-14 15:00:50', 2),
(102, '韓式燉馬鈴薯', '/uploads/repicepro/1577331967.jpg', '', '', '根莖類', '近期公開', '韓式', '配菜', '1', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>256</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>5</td>\r\n			<th>脂肪(g)</th>\r\n			<td>6.7</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>42.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>33</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.8</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>19</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.14</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.1</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.4</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>43</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>0</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>12.2</td>\r\n			<th>鹽分(g)</th>\r\n			<td>3.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>122</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 6, 0, 0, '', '2019-12-26 11:46:07', 1, '2020-12-25 11:46:21', 2),
(103, '泡菜豆腐鍋', '/uploads/repicepro/1577332281.jpg', '', '', '葉菜類,豆類', '近期公開', '韓式', '火鍋', '1', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>607</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>31.1</td>\r\n			<th>脂肪(g)</th>\r\n			<td>41.9</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>22.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>350</td>\r\n			<th>鐵(mg)</th>\r\n			<td>7</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>148</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>2.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.49</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.63</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.62</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>10.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>15</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>260</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>5.2</td>\r\n			<th>鹽分(g)</th>\r\n			<td>23.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>60</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 10, 0, 0, '', '2019-12-26 11:51:21', 1, '2021-01-19 23:31:22', 2),
(104, '泡菜豬肉鍋', '/uploads/repicepro/1577332609.jpg', '', '', '豬肉,葉菜類', '近期公開', '中式', '火鍋', '1', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>366</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>16.9</td>\r\n			<th>脂肪(g)</th>\r\n			<td>24.3</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>18.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>120</td>\r\n			<th>鐵(mg)</th>\r\n			<td>2.9</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>73</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.39</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.34</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.38</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>31</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>38</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>3.8</td>\r\n			<th>鹽分(g)</th>\r\n			<td>4.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>117</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 11, 0, 0, '', '2019-12-26 11:56:49', 1, '2021-01-19 23:36:08', 2),
(105, '辣海鮮湯麵', '/uploads/repicepro/1577348682.jpg', '', '', '海鮮類', '近期公開', '韓式', '主食', '1', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>749</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>44.6</td>\r\n			<th>脂肪(g)</th>\r\n			<td>24.1</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>82</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>290</td>\r\n			<th>鐵(mg)</th>\r\n			<td>6.3</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>255</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.25</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.49</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.55</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>16.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>110</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>220</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>6.1</td>\r\n			<th>鹽分(g)</th>\r\n			<td>16.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>172</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 8, 0, 0, '', '2019-12-26 16:24:42', 1, '2020-12-09 12:30:03', 2),
(106, '韓式炸醬麵', '/uploads/repicepro/1577349191.jpg', '', '', '豬肉', '近期公開', '韓式', '主食', '1', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>1015</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>26.5</td>\r\n			<th>脂肪(g)</th>\r\n			<td>53.2</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>98.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>84</td>\r\n			<th>鐵(mg)</th>\r\n			<td>3</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>318</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>2.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.73</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.32</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.72</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>28</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>81</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>10.2</td>\r\n			<th>鹽分(g)</th>\r\n			<td>15.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>205</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 4, 0, 0, '', '2019-12-26 16:33:11', 1, '2020-12-09 12:01:01', 2),
(107, '豆瓣醬海鮮鍋', '/uploads/repicepro/1577349784.jpg', '', '', '海鮮類,豆類', '近期公開', '韓式', '火鍋', '1', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>218</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>14.8</td>\r\n			<th>脂肪(g)</th>\r\n			<td>6.6</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>7.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>110</td>\r\n			<th>鐵(mg)</th>\r\n			<td>3.1</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>172</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>3.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.23</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.26</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.66</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>3.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>35</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>22</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>6.9</td>\r\n			<th>鹽分(g)</th>\r\n			<td>1.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>119</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 10, 0, 0, '', '2019-12-26 16:43:04', 1, '2021-01-19 23:34:58', 2),
(108, '泡菜海鮮煎餅', '/uploads/repicepro/1577350834.jpg', '', '', '海鮮類', '近期公開', '韓式', '其他', '1', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>429</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>27.3</td>\r\n			<th>脂肪(g)</th>\r\n			<td>14.7</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>43.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>100</td>\r\n			<th>鐵(mg)</th>\r\n			<td>2.2</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>80</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>4.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.15</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.34</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.33</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>1.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>21</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>130</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>2.6</td>\r\n			<th>鹽分(g)</th>\r\n			<td>8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>50</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 6, 0, 0, '', '2019-12-26 17:00:34', 1, '2020-12-09 11:17:20', 2),
(109, '奶油干貝燒時蔬', '/uploads/repicepro/1577351274.jpg', '', '', '海鮮類', '近期公開', '中式', '主菜', '2', '6人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>116</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>6.9</td>\r\n			<th>脂肪(g)</th>\r\n			<td>7.5</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>5.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>13</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.4</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>77</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.06</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.08</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.09</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>13</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>26</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>1.2</td>\r\n			<th>鹽分(g)</th>\r\n			<td>0.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>38</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 10, 0, 0, '', '2019-12-26 17:07:54', 1, '2020-12-17 11:08:05', 2),
(110, '清燉豬頰肉鮮蔬干貝凍派', '/uploads/repicepro/1577668628.jpg', '', '', '豬肉', '近期公開', '中式', '配菜', '2', '6人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>490</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>17.5</td>\r\n			<th>脂肪(g)</th>\r\n			<td>41.9</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>7.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>44</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.1</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>100</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.46</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.21</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.38</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>29</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>65</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>2.7</td>\r\n			<th>鹽分(g)</th>\r\n			<td>1.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>97</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 22, 0, 0, '', '2019-12-26 17:13:09', 1, '2021-04-05 18:24:58', 2),
(111, '乳酪蕃茄海鮮湯', '/uploads/repicepro/1577351823.jpg', '', '', '海鮮類', '近期公開', '西式', '湯羹類', '2', '2人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>486</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>32.8</td>\r\n			<th>脂肪(g)</th>\r\n			<td>23.4</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>33.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>300</td>\r\n			<th>鐵(mg)</th>\r\n			<td>2</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>382</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>6.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.32</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.31</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.62</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>51</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>100</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>5.3</td>\r\n			<th>鹽分(g)</th>\r\n			<td>4.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>277</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 14, 0, 0, '', '2019-12-26 17:17:03', 1, '2020-12-16 11:48:39', 2),
(112, '何首烏干貝雞湯 ', '/uploads/repicepro/1577351992.jpg', '', '', '雞肉', '近期公開', '中式', '湯羹類', '2', '6人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>311</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>28</td>\r\n			<th>脂肪(g)</th>\r\n			<td>17.3</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>6.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>19</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.1</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>59</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.08</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.22</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.39</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>8</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>110</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>1</td>\r\n			<th>鹽分(g)</th>\r\n			<td>1.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>17</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 33, 0, 0, '', '2019-12-26 17:19:52', 1, '2020-12-24 20:04:59', 2),
(113, '香蕈芥藍天使麵', '/uploads/repicepro/1577352232.jpg', '', '', '海鮮類,菇蕈類', '近期公開', '西式', '主食', '2', '2人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>808</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>36.3</td>\r\n			<th>脂肪(g)</th>\r\n			<td>44.3</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>60</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>200</td>\r\n			<th>鐵(mg)</th>\r\n			<td>3.3</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>508</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.6</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.62</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>1.25</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>2.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>280</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>290</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>6.6</td>\r\n			<th>鹽分(g)</th>\r\n			<td>4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>215</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 19, 0, 0, '', '2019-12-26 17:23:52', 1, '2020-12-15 11:03:43', 2),
(114, '蝦仁鮮味餃', '/uploads/repicepro/1577352401.jpg', '', '', '豬肉', '近期公開', '中式', '主食', '2', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>205</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>17.7</td>\r\n			<th>脂肪(g)</th>\r\n			<td>4.9</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>20.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>30</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>12</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.21</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.1</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.17</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>2</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>82</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>1.1</td>\r\n			<th>鹽分(g)</th>\r\n			<td>1.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>10</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 14, 0, 0, '', '2019-12-26 17:26:41', 1, '2021-03-22 10:15:08', 2),
(115, '乾煸子排', '/uploads/repicepro/1577352726.jpg', '', '', '豬肉', '近期公開', '中式', '主菜', '1,4', '4~6人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>529</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>16.4</td>\r\n			<th>脂肪(g)</th>\r\n			<td>37</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>28.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>380</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.7</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>26</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.45</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.14</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.25</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>8</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>89</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>0.5</td>\r\n			<th>鹽分(g)</th>\r\n			<td>2.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>16</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 14, 0, 0, '', '2019-12-26 17:32:06', 1, '2021-04-27 15:36:10', 2),
(116, '蕃茄燉雞', '/uploads/repicepro/1577352901.jpg', '', '', '雞肉', '近期公開', '中式', '湯羹類', '2,4', '4~6人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>500</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>41.2</td>\r\n			<th>脂肪(g)</th>\r\n			<td>26.6</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>22.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>120</td>\r\n			<th>鐵(mg)</th>\r\n			<td>3.4</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>292</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>4.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.38</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.45</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.93</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>17.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>70</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>170</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>4.5</td>\r\n			<th>鹽分(g)</th>\r\n			<td>3.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>450</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 16, 0, 0, '', '2019-12-26 17:35:01', 1, '2021-04-27 11:58:21', 2);
INSERT INTO `recipepro` (`id`, `name`, `pic_url`, `pic_alt`, `feature`, `tags`, `price`, `type`, `style`, `product_ids`, `material_weight`, `nutrition`, `member_only`, `visitor`, `list_order`, `status`, `remark`, `c_time`, `c_user_id`, `u_time`, `u_user_id`) VALUES
(117, '剁椒鱸魚片', '/uploads/repicepro/1577353070.jpg', '', '', '海鮮類', '近期公開', '中式', '主菜', '3,4', '4~6人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>284</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>17.1</td>\r\n			<th>脂肪(g)</th>\r\n			<td>20.7</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>4.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>9</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.3</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>38</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>3.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.25</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.08</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.48</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>1.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>13</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>45</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>0.6</td>\r\n			<th>鹽分(g)</th>\r\n			<td>1.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>5</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 12, 0, 0, '', '2019-12-26 17:37:50', 1, '2021-04-13 01:08:12', 2),
(118, '滷味', '/uploads/repicepro/1577353284.jpg', '', '', '菇蕈類,豆類,蛋', '近期公開', '中式', '主菜', '8', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>234</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>13.8</td>\r\n			<th>脂肪(g)</th>\r\n			<td>6.4</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>29.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>150</td>\r\n			<th>鐵(mg)</th>\r\n			<td>2.9</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>60</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.12</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.2</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.16</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>34</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>63</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>2.6</td>\r\n			<th>鹽分(g)</th>\r\n			<td>10.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>48</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 13, 0, 0, '', '2019-12-26 17:41:24', 1, '2021-02-17 02:38:04', 2),
(119, '芹香泡白蝦', '/uploads/repicepro/1577353492.jpg', '', '', '海鮮類', '近期公開', '中式', '主菜', '2,4', '4~6人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>129</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>13.6</td>\r\n			<th>脂肪(g)</th>\r\n			<td>3.7</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>10.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>57</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.9</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>22</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.1</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.08</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.44</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>5</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>77</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>1.8</td>\r\n			<th>鹽分(g)</th>\r\n			<td>2.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>10</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 28, 0, 0, '', '2019-12-26 17:44:52', 1, '2020-12-17 11:09:11', 2),
(120, '蕃茄海鮮湯', '/uploads/repicepro/1577431209.jpg', '', '', '海鮮類', '近期公開', '中式', '湯羹類', '8', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>91</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>9.3</td>\r\n			<th>脂肪(g)</th>\r\n			<td>2.8</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>6.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>38</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.6</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>28</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.12</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.07</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.2</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>6.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>9</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>20</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>0.8</td>\r\n			<th>鹽分(g)</th>\r\n			<td>2.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>55</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 9, 0, 0, '', '2019-12-27 15:20:09', 1, '2020-12-24 20:06:51', 2),
(121, '餛飩湯', '/uploads/repicepro/1577432208.jpg', '', '', '豬肉', '近期公開', '中式', '湯羹類', '8', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>836</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>46.8</td>\r\n			<th>脂肪(g)</th>\r\n			<td>61.8</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>13.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>54</td>\r\n			<th>鐵(mg)</th>\r\n			<td>3.3</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>97</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>1.76</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.61</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.96</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>1.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>18</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>190</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>1</td>\r\n			<th>鹽分(g)</th>\r\n			<td>4.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>50</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 15, 0, 0, '', '2019-12-27 15:36:48', 1, '2021-02-24 16:01:31', 2),
(122, '木須炒什錦', '/uploads/repicepro/1577437478.jpg', '', '', '豬肉,海鮮類', '近期公開', '中式', '主菜', '8', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>152</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>12</td>\r\n			<th>脂肪(g)</th>\r\n			<td>8</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>7.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>49</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.1</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>131</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.23</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.18</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.21</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>25</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>120</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>1.5</td>\r\n			<th>鹽分(g)</th>\r\n			<td>0.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>63</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 14, 0, 0, '', '2019-12-27 17:04:38', 1, '2020-12-14 11:33:40', 2),
(123, '霜降黑豚涮涮鍋', '/uploads/repicepro/1577437939.jpg', '', ' 以「ほんだし®/烹大師®」鰹魚風味及昆布風味調味， 讓湯底增加了清爽度，又不會搶了食材本身的滋味。', '豬肉,葉菜類,菇蕈類', '近期公開', '中式', '火鍋', '1,3', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>760</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>40.2</td>\r\n			<th>脂肪(g)</th>\r\n			<td>57.5</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>17.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>540</td>\r\n			<th>鐵(mg)</th>\r\n			<td>6.6</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>184</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.81</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.35</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.63</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>31</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>71</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>6.2</td>\r\n			<th>鹽分(g)</th>\r\n			<td>1.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>221</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 13, 0, 0, '', '2019-12-27 17:12:19', 1, '2021-03-25 13:10:39', 2),
(124, '泰式海鮮酸辣鍋', '/uploads/repicepro/1577669653.jpg', '', '泰式海鮮湯底搭配「ほんだし®/烹大師®」干貝風味及雞粉，湯頭鮮味十足，提升海鮮酸辣鍋的美味。', '海鮮類,葉菜類', '近期公開', '異國', '其他', '2,4', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>374</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>43.8</td>\r\n			<th>脂肪(g)</th>\r\n			<td>10.1</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>28.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>200</td>\r\n			<th>鐵(mg)</th>\r\n			<td>2.8</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>233</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>5.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.22</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.5</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.74</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>16.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>3</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>280</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>4.8</td>\r\n			<th>鹽分(g)</th>\r\n			<td>8.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>280</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 8, 0, 0, '', '2019-12-30 09:34:13', 1, '2021-03-22 10:30:19', 2),
(125, '地雞合鴨相撲力士鍋(鹽味)', '/uploads/repicepro/1577670698.jpg', '', '白湯底(雞骨/豚骨蔬菜) 提鮮祕訣： 使用「ほんだし®/烹大師®」雞粉及讓鍋底更增加濃郁層次的風味。', '雞肉,豬肉,其他', '近期公開', '中式', '火鍋', '4,8', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>1040</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>42.9</td>\r\n			<th>脂肪(g)</th>\r\n			<td>72.2</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>48.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>210</td>\r\n			<th>鐵(mg)</th>\r\n			<td>4.3</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>389</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>2.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.75</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>1.5</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>1.12</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>1.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>56</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>170</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>10.3</td>\r\n			<th>鹽分(g)</th>\r\n			<td>7.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>419</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 26, 0, 0, '', '2019-12-30 09:51:38', 1, '2021-05-14 14:29:40', 2),
(126, '南瓜野菇鍋', '/uploads/repicepro/1577671353.jpg', '', '提鮮祕訣：純粹的南瓜湯底加入「ほんだし®/烹大師®」昆布風味， 可提升湯底風味的呈現！', '葉菜類,瓜果類', '近期公開', '素食', '火鍋', '3', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>266</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>12.2</td>\r\n			<th>脂肪(g)</th>\r\n			<td>13</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>28.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>230</td>\r\n			<th>鐵(mg)</th>\r\n			<td>3.6</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>416</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>5.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.38</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.34</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.45</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>66</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>24</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>9.2</td>\r\n			<th>鹽分(g)</th>\r\n			<td>3.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>369</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 13, 0, 0, '', '2019-12-30 10:02:33', 1, '2021-02-19 10:14:17', 2),
(127, '五味杏鮑菇', '/uploads/repicepro/1577671671.jpg', '', '提鮮秘訣：加入「ほんだし®/烹大師®」雞粉的五味醬更顯百搭，不單只用在海鮮上！', '菇蕈類', '近期公開', '中式', '配菜', '4', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>26</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>2.5</td>\r\n			<th>脂肪(g)</th>\r\n			<td>0.5</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>6.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>4</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.3</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>0.6</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.09</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.17</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.13</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>2</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>0</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>2.7</td>\r\n			<th>鹽分(g)</th>\r\n			<td>0.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>17</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 16, 0, 0, '', '2019-12-30 10:07:51', 1, '2020-12-14 15:14:16', 2),
(128, '五味醬', '/uploads/repicepro/1577671895.jpg', '', '醬色：紅色濃稠狀', '其他', '近期公開', '其他', '其他', '4', '1小碗', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>213</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>5.8</td>\r\n			<th>脂肪(g)</th>\r\n			<td>7.1</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>31.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>27</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.4</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>109</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>3.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.14</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.14</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.47</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>14</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>0</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>3.3</td>\r\n			<th>鹽分(g)</th>\r\n			<td>0.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>100</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 12, 0, 0, '', '2019-12-30 10:11:35', 1, '2020-12-09 11:38:34', 2),
(129, '香煎圓鱈佐水果油醋醬', '/uploads/repicepro/1577672426.jpg', '', '提鮮秘訣：看似油膩的醬汁，加入「ほんだし®/烹大師®」 昆布風味後，能提升整體的清爽度。', '海鮮類', '近期公開', '中式', '主菜', '3', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>198</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>17.1</td>\r\n			<th>脂肪(g)</th>\r\n			<td>12.7</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>38</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.7</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>44</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.04</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.17</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.13</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>1.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>9</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>59</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>0.5</td>\r\n			<th>鹽分(g)</th>\r\n			<td>1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>25</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 97, 0, 0, '', '2019-12-30 10:20:26', 1, '2020-12-15 11:12:44', 2),
(130, '水果油醋醬', '/uploads/repicepro/1577672791.jpg', '', '醬色：油黃色液體狀', '其他', '近期公開', '其他', '其他', '3', '1小碗', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>1524</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>7.3</td>\r\n			<th>脂肪(g)</th>\r\n			<td>134.1</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>69.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>190</td>\r\n			<th>鐵(mg)</th>\r\n			<td>2.2</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>36</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>11.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.4</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.16</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.35</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>180</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>1</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>7.9</td>\r\n			<th>鹽分(g)</th>\r\n			<td>4.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>50</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 36, 0, 0, '', '2019-12-30 10:26:31', 1, '2021-04-10 02:49:13', 2),
(131, '葛瑪蘭小里肌 佐金桔芒果醬', '/uploads/repicepro/1577673129.jpg', '', '提鮮秘訣：「ほんだし®/烹大師®」干貝風味是讓金桔芒果醬汁甜而不膩的秘訣。', '豬肉', '近期公開', '中式', '主菜', '2', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>593</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>27.8</td>\r\n			<th>脂肪(g)</th>\r\n			<td>39.6</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>26.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>130</td>\r\n			<th>鐵(mg)</th>\r\n			<td>2.5</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>153</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>2.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.89</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.47</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.46</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>22</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>290</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>1.2</td>\r\n			<th>鹽分(g)</th>\r\n			<td>0.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>0</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 23, 0, 0, '', '2019-12-30 10:32:09', 1, '2020-12-18 19:14:19', 2),
(132, '金桔芒果醬', '/uploads/repicepro/1577677074.jpg', '', '醬色：土黃色液體狀', '其他', '近期公開', '其他', '其他', '2', '1小碗', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>248</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>3.8</td>\r\n			<th>脂肪(g)</th>\r\n			<td>1.1</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>60.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>65</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>133</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>4.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.13</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.18</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.38</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>57</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>0</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>5.8</td>\r\n			<th>鹽分(g)</th>\r\n			<td>4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>5</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 8, 0, 0, '', '2019-12-30 10:32:11', 1, '2021-03-15 01:42:14', 2),
(133, '酥炸小卷 佐泰式辣醬', '/uploads/repicepro/1577677248.jpg', '', '泰國香料為基底加入「ほんだし®/烹大師®」雞粉調配出泰式辣醬，呈現鹹、鮮、香、酸、辣的豐富層次。', '海鮮類', '近期公開', '異國', '配菜', '2', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>68</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>15.4</td>\r\n			<th>脂肪(g)</th>\r\n			<td>13.1</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>19.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>19</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.3</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>10</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>2.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.04</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.03</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.1</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>1.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>4</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>260</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>0.8</td>\r\n			<th>鹽分(g)</th>\r\n			<td>0.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>19</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 9, 0, 0, '', '2019-12-30 11:34:08', 1, '2020-12-14 14:33:58', 2),
(134, '泰式辣醬', '/uploads/repicepro/1577678319.jpg', '', '醬色：五彩顏色液體狀', '其他', '近期公開', '其他', '其他', '4', '1小碗', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>268</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>14.1</td>\r\n			<th>脂肪(g)</th>\r\n			<td>2.4</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>54</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>48</td>\r\n			<th>鐵(mg)</th>\r\n			<td>2.4</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>217</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>4.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.17</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.34</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.72</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>1.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>54</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>0</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>7.8</td>\r\n			<th>鹽分(g)</th>\r\n			<td>22.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>5</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 16, 0, 0, '', '2019-12-30 11:58:39', 1, '2020-12-09 11:39:36', 2),
(135, '鮮嫩白切雞 佐椒麻蔥油醬', '/uploads/repicepro/1577682768.jpg', '', '蔥油的清香，加入「ほんだし®/烹大師®」干貝風味的海洋氣息，融合海陸雙鮮的美味', '雞肉', '近期公開', '中式', '主菜', '2', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>369</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>25</td>\r\n			<th>脂肪(g)</th>\r\n			<td>27.4</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>1.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>18</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.4</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>68</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.11</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.34</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.27</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>4</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>130</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>0.5</td>\r\n			<th>鹽分(g)</th>\r\n			<td>0.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>22</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 14, 0, 0, '', '2019-12-30 13:12:49', 1, '2020-12-18 18:47:35', 2),
(136, '椒麻蔥油醬', '/uploads/repicepro/1577683394.jpg', '', '醬色：深綠色稠狀', '其他', '近期公開', '其他', '其他', '2', '1小碗', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>50</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>1.8</td>\r\n			<th>脂肪(g)</th>\r\n			<td>1.1</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>9.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>36</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.3</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>7</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.05</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.04</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.12</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>14</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>2</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>2.5</td>\r\n			<th>鹽分(g)</th>\r\n			<td>1.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>100</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 9, 0, 0, '', '2019-12-30 13:23:14', 1, '2020-12-09 11:31:12', 2),
(137, '清燙美人腿 佐腐乳醬', '/uploads/repicepro/1577683912.jpg', '', '腐乳發酵過後的 香氣，加入「ほんだし®/烹大師®」鰹魚風味，使腐乳醬汁更為鮮美。', '根莖類', '近期公開', '中式', '配菜', '1', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>32</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>1.9</td>\r\n			<th>脂肪(g)</th>\r\n			<td>0.6</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>6.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>3</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.3</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>2</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.06</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.04</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>12</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>9</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>0</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>3.5</td>\r\n			<th>鹽分(g)</th>\r\n			<td>1.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>150</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 69, 0, 0, '', '2019-12-30 13:31:52', 1, '2021-01-25 14:57:54', 2),
(138, '腐乳醬', '/uploads/repicepro/1577684131.jpg', '', '醬色：乳白色液體狀', '其他', '近期公開', '其他', '其他', '1', '1小碗', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>385</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>7.4</td>\r\n			<th>脂肪(g)</th>\r\n			<td>26.7</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>23.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>0</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>0</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>0</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>0</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>0</td>\r\n			<th>鹽分(g)</th>\r\n			<td>7.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>0</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 20, 0, 0, '', '2019-12-30 13:35:31', 1, '2020-12-25 13:10:38', 2),
(139, '黑白切 佐蒜蓉醬油', '/uploads/repicepro/1577684359.jpg', '', '傳統的蒜蓉醬，加入「ほんだし®/烹大師®」雞粉後，味道更濃郁順口，有別一般傳統的蒜蓉醬油！', '豬肉', '近期公開', '中式', '主菜', '4', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>1710</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>156.7</td>\r\n			<th>脂肪(g)</th>\r\n			<td>110.3</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>5.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>610</td>\r\n			<th>鐵(mg)</th>\r\n			<td>26.4</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>110</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>4.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>1.72</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>4.02</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>1.5</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>12</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>17</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>1600</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>2.5</td>\r\n			<th>鹽分(g)</th>\r\n			<td>0.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>50</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 16, 0, 0, '', '2019-12-30 13:39:19', 1, '2020-12-25 13:08:13', 2),
(140, '蒜蓉醬油', '/uploads/repicepro/1577684585.jpg', '', '醬色：深咖啡色半稠狀', '其他', '近期公開', '其他', '其他', '4', '1小碗', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>169</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>12.2</td>\r\n			<th>脂肪(g)</th>\r\n			<td>5.7</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>17.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>25</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.5</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>64</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.08</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.14</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.65</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>1.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>19</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>0</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>3</td>\r\n			<th>鹽分(g)</th>\r\n			<td>21.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>43</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 5, 0, 0, '', '2019-12-30 13:43:05', 1, '2020-12-25 13:08:30', 2),
(141, '泰式炸天使蝦 佐酸甜辣醬', '/uploads/repicepro/1577684841.jpg', '', '特調酸甜辣醬加入「ほんだし®/烹大師®」干貝風味，醬汁更鮮甜可口，沾附食用口感瞬間提升。', '海鮮類', '近期公開', '異國', '主菜', '4', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>153</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>6.2</td>\r\n			<th>脂肪(g)</th>\r\n			<td>3.1</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>23.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>48</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.7</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>60</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.06</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.07</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.05</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>21</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>23</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>0.7</td>\r\n			<th>鹽分(g)</th>\r\n			<td>0.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>0</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 14, 0, 0, '', '2019-12-30 13:47:21', 1, '2021-03-25 14:00:55', 2),
(142, '酸甜辣醬', '/uploads/repicepro/1577685647.jpg', '', '醬色：暗紅色稠狀', '其他', '近期公開', '其他', '其他', '2', '１小碗', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>187</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>3</td>\r\n			<th>脂肪(g)</th>\r\n			<td>10.5</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>20.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>8</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.6</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>15</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.07</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.05</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.47</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>4</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>0</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>1.9</td>\r\n			<th>鹽分(g)</th>\r\n			<td>1.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>0</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 6, 0, 0, '', '2019-12-30 14:00:47', 1, '2020-12-25 13:09:51', 2),
(143, '咖哩海鮮蟳鍋', '/uploads/repicepro/1577686779.jpg', '', '咖哩醬加入「ほんだし®」雞粉增加香氣，再加入「ほんだし®」干貝風味提升蟳鍋的鮮美海味。', '海鮮類', '近期公開', '中式', '火鍋', '1,2', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>866</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>44.7</td>\r\n			<th>脂肪(g)</th>\r\n			<td>55.8</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>45</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>960</td>\r\n			<th>鐵(mg)</th>\r\n			<td>5.5</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>21</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>7.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.17</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.22</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.87</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>5.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>11</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>460</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>6.3</td>\r\n			<th>鹽分(g)</th>\r\n			<td>4.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>69</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 12, 0, 0, '', '2019-12-30 14:19:39', 1, '2021-02-14 23:12:39', 2),
(144, '辣味胡麻雞絲', '/uploads/repicepro/1577687337.jpg', '', '薑蔥炆煮雞胸肉，用「ほんだし®」雞粉替代鹽可讓雞胸肉更軟嫩不柴！', '雞肉,海鮮類', '近期公開', '中式', '主菜', '2,4', ' 4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>385</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>12.6</td>\r\n			<th>脂肪(g)</th>\r\n			<td>11.2</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>57</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>82</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.4</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>178</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.1</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.16</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.38</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>9</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>91</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>3.6</td>\r\n			<th>鹽分(g)</th>\r\n			<td>2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>70</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 14, 0, 0, '', '2019-12-30 14:28:57', 1, '2021-05-06 00:45:33', 2),
(145, '上湯龍蝦義式細麵', '/uploads/repicepro/1577687870.jpg', '', '', '海鮮類', '近期公開', '西式', '主食', '2', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>611</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>17.8</td>\r\n			<th>脂肪(g)</th>\r\n			<td>34.7</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>51.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>50</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.2</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>318</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>3.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.12</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.11</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.32</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>29</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>130</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>3.2</td>\r\n			<th>鹽分(g)</th>\r\n			<td>2.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>59</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 8, 0, 0, '', '2019-12-30 14:37:50', 1, '2021-04-07 10:41:49', 2),
(146, '蝦鬆醬鑲溫室黃瓜', '/uploads/repicepro/1577688265.jpg', '', '蝦鬆醬以蝦乾製作取「ほんだし®/烹大師®」雞粉、干貝風味來增添香氣與提升鮮甜海味！', '海鮮類,瓜果類', '近期公開', '中式', '配菜', '2,4', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>371</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>11.6</td>\r\n			<th>脂肪(g)</th>\r\n			<td>28.4</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>5.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>1400</td>\r\n			<th>鐵(mg)</th>\r\n			<td>3.2</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>30</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>3.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.03</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.06</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.08</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>2.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>7</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>100</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>0.3</td>\r\n			<th>鹽分(g)</th>\r\n			<td>2.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>20</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 18, 0, 0, '', '2019-12-30 14:44:25', 1, '2021-03-05 12:48:23', 2),
(147, '銀蘿龍膽鱻魚湯', '/uploads/repicepro/1577688588.jpg', '', '龍膽魚鮮味與白蘿蔔烹調出鮮甜美味湯頭，加入適量「ほんだし®」鰹魚風味更能品嚐到鮮香好滋味。', '海鮮類,菇蕈類', '近期公開', '中式', '湯羹類', '1', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>141</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>10.1</td>\r\n			<th>脂肪(g)</th>\r\n			<td>4.3</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>12.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>84</td>\r\n			<th>鐵(mg)</th>\r\n			<td>2.8</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>26</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.13</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.23</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.22</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>26.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>44</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>38</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>3.5</td>\r\n			<th>鹽分(g)</th>\r\n			<td>2.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>208</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 14, 0, 0, '', '2019-12-30 14:49:49', 1, '2021-04-12 14:35:41', 2),
(148, '蒜香粄條鮮蝦捲', '/uploads/repicepro/1577688898.jpg', '', '蝦內餡以「ほんだし®」雞粉增加味道的豐富度，醬汁加入「ほんだし®」鰹魚風味呈現香濃海鮮料理！', '海鮮類,葉菜類,其他', '近期公開', '中式', '主食', '1,4', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>562</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>15.8</td>\r\n			<th>脂肪(g)</th>\r\n			<td>18</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>79.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>71</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.1</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>74</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>9</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.07</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.18</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>17</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>72</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>2</td>\r\n			<th>鹽分(g)</th>\r\n			<td>3.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>60</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 12, 0, 0, '', '2019-12-30 14:54:58', 1, '2020-12-15 11:03:30', 2),
(149, '金瓜起司燴玉帶', '/uploads/repicepro/1577690071.jpg', '', '清甜的金瓜泥與干貝烹調清爽可口，加入「ほんだし®」干貝風味增加鹹鮮味，不會蓋過食材原有風味，有畫龍點睛之美。', '海鮮類', '近期公開', '中式', '主菜', '2', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>285</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>10.3</td>\r\n			<th>脂肪(g)</th>\r\n			<td>14.8</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>28.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>94</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.8</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>283</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>6.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.13</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.16</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.42</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>130</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>200</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>4.3</td>\r\n			<th>鹽分(g)</th>\r\n			<td>2.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>160</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 13, 0, 0, '', '2019-12-30 15:14:31', 1, '2020-12-17 10:29:03', 2),
(150, '松子南瓜養生飯', '/uploads/repicepro/1577690833.jpg', '', '此道養生飯以「ほんだし®」昆布風味來調味，是一道呈現蔬菜原有風味的素食料理。', '瓜果類', '近期公開', '素食', '主食', '3', '2人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>288&nbsp;</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>6.7</td>\r\n			<th>脂肪(g)</th>\r\n			<td>6.3</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>50</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>13</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.9</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>39</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.13</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.07</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.11</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>13</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>0</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>3.2</td>\r\n			<th>鹽分(g)</th>\r\n			<td>3.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>51</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 8, 0, 0, '', '2019-12-30 15:27:13', 1, '2021-01-26 11:16:18', 2),
(151, '香檳茸荷葉飯', '/uploads/repicepro/1577691121.jpg', '', '用「ほんだし®」干貝風味與雞粉取代一般的醬油調味，更讓糯米飯和食材的香味能完全釋放。', '豬肉,菇蕈類', '近期公開', '中式', '主食', '2,4', '10人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>434</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>11.9</td>\r\n			<th>脂肪(g)</th>\r\n			<td>22.3</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>47</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>14</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.6</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>25</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.05</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.15</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.05</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>0</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>76</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>2.3</td>\r\n			<th>鹽分(g)</th>\r\n			<td>1.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>20</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 6, 0, 0, '', '2019-12-30 15:32:01', 1, '2020-12-15 11:04:13', 2),
(152, '豆豉風味琵琶蝦', '/uploads/repicepro/1577691691.jpg', '', '以「ほんだし®」鰹魚風味帶出蝦球的鮮味，「ほんだし®」雞粉的鹹香來增添這道菜的風味。', '海鮮類', '近期公開', '中式', '主菜', '1,4', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>219</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>11.2</td>\r\n			<th>脂肪(g)</th>\r\n			<td>15.4</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>6.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>39</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.8</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>46</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.19</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.09</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.2</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>7</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>160</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>0.8</td>\r\n			<th>鹽分(g)</th>\r\n			<td>2.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>28</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 12, 0, 0, '', '2019-12-30 15:41:31', 1, '2020-12-25 13:01:53', 2),
(153, '黑蒜香芋燉桂丁雞', '/uploads/repicepro/1577692029.jpg', '', '湯頭簡單使用「ほんだし®/烹大師®」雞粉調味，能凸顯現出食材本身的味道，更能湯頭也更鮮美豐富。', '雞肉', '近期公開', '中式', '湯羹類', '4', '10人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>349</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>22.3</td>\r\n			<th>脂肪(g)</th>\r\n			<td>17</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>206</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>32</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.3</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>60</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.14</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.21</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.56</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>18</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>100</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>1.7</td>\r\n			<th>鹽分(g)</th>\r\n			<td>0.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>63</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 8, 0, 0, '', '2019-12-30 15:47:09', 1, '2021-03-07 15:27:04', 2),
(154, '九孔金瓜螺肉煲', '/uploads/repicepro/1577692592.jpg', '', '這道菜是以酒家菜魷魚螺肉蒜加以改良，加入南瓜及螺肉罐醬汁以「ほんだし®」昆布風味調味！', '豬肉,海鮮類', '近期公開', '中式', '湯羹類', '3,4', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>269</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>19.6</td>\r\n			<th>脂肪(g)</th>\r\n			<td>13.1</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>16.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>110</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.9</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>263</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>4.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.24</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.17</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.28</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>2.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>33</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>200</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>2.7</td>\r\n			<th>鹽分(g)</th>\r\n			<td>3.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>95</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 10, 0, 0, '', '2019-12-30 15:56:32', 1, '2021-05-02 09:50:46', 2);
INSERT INTO `recipepro` (`id`, `name`, `pic_url`, `pic_alt`, `feature`, `tags`, `price`, `type`, `style`, `product_ids`, `material_weight`, `nutrition`, `member_only`, `visitor`, `list_order`, `status`, `remark`, `c_time`, `c_user_id`, `u_time`, `u_user_id`) VALUES
(155, '古法鑲處女蟳', '/uploads/repicepro/1577695102.jpg', '', '這道創意手工菜以「ほんだし®/烹大師®」雞粉調味肉餡，增添肉餡鹹鮮味。', '豬肉,海鮮類', '近期公開', '中式', '主菜', '3,4', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>379</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>27.1</td>\r\n			<th>脂肪(g)</th>\r\n			<td>14.2</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>33.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>76</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.8</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>36</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>2.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.57</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.25</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.44</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>2.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>5</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>120</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>1.2</td>\r\n			<th>鹽分(g)</th>\r\n			<td>2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>50</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 14, 0, 0, '', '2019-12-30 16:34:14', 1, '2021-01-13 23:56:10', 2),
(156, '剝皮辣椒蒸虱目魚肚', '/uploads/repicepro/1577695049.jpg', '', '運用花蓮特產剝皮辣椒的甘甜，及花椒油的香麻，再加入「ほんだし®/烹大師®」昆布風味來提升虱目魚的鮮甘香麻！', '海鮮類', '近期公開', '中式', '主菜', '3', '10人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>298</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>11</td>\r\n			<th>脂肪(g)</th>\r\n			<td>24.1</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>8.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>42</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.5</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>234</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.07</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.25</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.63</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>8.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>43</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>34</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>4.3</td>\r\n			<th>鹽分(g)</th>\r\n			<td>1.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>32</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 18, 0, 0, '', '2019-12-30 16:37:29', 1, '2021-03-02 13:17:36', 2),
(157, '什錦西魯肉(真空包)', '/uploads/repicepro/1577695839.jpg', '', '', '豬肉,葉菜類,根莖類,菇蕈類,蛋', '近期公開', '中式', '主菜', '8', '60人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>1351</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>98.3</td>\r\n			<th>脂肪(g)</th>\r\n			<td>89</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>33.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>2300</td>\r\n			<th>鐵(mg)</th>\r\n			<td>5.5</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>114</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>2.26</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>1.05</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>2.05</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>40.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>40</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>310</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>7.9</td>\r\n			<th>鹽分(g)</th>\r\n			<td>6.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>435</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 14, 0, 0, '', '2019-12-30 16:50:39', 1, '2020-12-25 12:52:24', 2),
(158, '鮮烤玫瑰魚片', '/uploads/repicepro/1577696110.jpg', '', '', '海鮮類', '近期公開', '中式', '主菜', '8', '1人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>127</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>17.4</td>\r\n			<th>脂肪(g)</th>\r\n			<td>5.3</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>0.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>11</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.3</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>10</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.2</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.14</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.39</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>3.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>1</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>46</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>0</td>\r\n			<th>鹽分(g)</th>\r\n			<td>0.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>0</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 9, 0, 0, '', '2019-12-30 16:55:10', 1, '2020-12-19 15:47:50', 2),
(159, '黃金滷豬腳', '/uploads/repicepro/1577696283.jpg', '', '', '豬肉', '近期公開', '中式', '主菜', '8', '10人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>592</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>40.3</td>\r\n			<th>脂肪(g)</th>\r\n			<td>33.5</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>29.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>30</td>\r\n			<th>鐵(mg)</th>\r\n			<td>2.8</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>12</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.1</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.25</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.07</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>1</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>200</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>0.3</td>\r\n			<th>鹽分(g)</th>\r\n			<td>5.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>25</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 15, 0, 0, '', '2019-12-30 16:58:03', 1, '2021-03-15 01:35:01', 2),
(160, '日式炸天婦羅', '/uploads/repicepro/1588644095.jpg', '', '', '海鮮類', '近期公開', '日式', '配菜', '8', '1~2人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>1009</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>31</td>\r\n			<th>脂肪(g)</th>\r\n			<td>34.3</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>135</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>140</td>\r\n			<th>鐵(mg)</th>\r\n			<td>4.2</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>99</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.31</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.4</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.37</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>1.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>33</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>360</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>7.1</td>\r\n			<th>鹽分(g)</th>\r\n			<td>4.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>136</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 14, 0, 0, '', '2019-12-30 17:10:01', 1, '2021-02-01 17:46:52', 2),
(161, '炒麵', '/uploads/repicepro/1577772819.jfif', '', '滲透到麵裡的濃郁炒麵醬是關鍵！', '豬肉,海鮮類,葉菜類', '近期公開', '日式', '主食', '1', '1人份', '<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>535</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>23</td>\r\n			<th>脂肪(g)</th>\r\n			<td>12.9</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>77.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>107</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.6</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>81</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.45</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.16</td>\r\n			<th>維生素C(mg)</th>\r\n			<td>5.3</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>45</td>\r\n		</tr>\r\n		<tr>\r\n			<th>膳食纖維(g)</th>\r\n			<td>5.3</td>\r\n			<th>鹽分(g)</th>\r\n			<td>4.1</td>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>100</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 0, 15, 0, 0, '', '2019-12-31 14:13:39', 1, '2021-01-26 11:18:14', 2),
(162, '和風咖哩', '/uploads/repicepro/1577773520.jfif', '', '烹煮和風咖哩！', '海鮮類', '近期公開', '日式', '主食', '1', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>581</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>14.7</td>\r\n			<th>脂肪(g)</th>\r\n			<td>15.1</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>93.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>65</td>\r\n			<th>鐵(mg)</th>\r\n			<td>2.2</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>83</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.12</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.1</td>\r\n			<th>維生素C(mg)</th>\r\n			<td>7</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>79</td>\r\n		</tr>\r\n		<tr>\r\n			<th>膳食纖維(g)</th>\r\n			<td>2.9</td>\r\n			<th>鹽分(g)</th>\r\n			<td>4.4</td>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>35</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 14, 0, 0, '', '2019-12-31 14:25:20', 1, '2020-12-09 12:31:26', 2),
(163, '柴魚高湯茶泡飯', '/uploads/repicepro/1577773835.jfif', '', '只要用熱水稀釋！製作柴魚風味的茶泡飯', '其他', '近期公開', '日式', '主食', '1', '2人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>264</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>5</td>\r\n			<th>脂肪(g)</th>\r\n			<td>0.5</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>57.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>8</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.2</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>0</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.03</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.02</td>\r\n			<th>維生素C(mg)</th>\r\n			<td>0</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>膳食纖維(g)</th>\r\n			<td>0.5</td>\r\n			<th>鹽分(g)</th>\r\n			<td>2.3</td>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>1</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 17, 0, 0, '', '2019-12-31 14:30:35', 1, '2021-03-05 12:39:26', 2),
(164, '什錦飯', '/uploads/repicepro/1577774382.jfif', '', '輕輕鬆鬆就能烹煮出柴魚高湯的豐富香氣！', '雞肉,菇蕈類', '近期公開', '日式', '主食', '1', '5人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>74</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>5.5</td>\r\n			<th>脂肪(g)</th>\r\n			<td>1.7</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>23</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.5</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>38</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.04</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.06</td>\r\n			<th>維生素C(mg)</th>\r\n			<td>2</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>膳食纖維(g)</th>\r\n			<td>1.1</td>\r\n			<th>鹽分(g)</th>\r\n			<td>2.3</td>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>21</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 9, 0, 0, '', '2019-12-31 14:39:42', 1, '2020-09-18 15:00:03', 2),
(165, '柴魚風味飯糰', '/uploads/repicepro/1577774593.jfif', '', '製作淡淡柴魚風味的飯糰！', '其他', '近期公開', '日式', '主食', '1', '5人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>169</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>2.6</td>\r\n			<th>脂肪(g)</th>\r\n			<td>0.3</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>37.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>3</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.1</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>0</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.02</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.01</td>\r\n			<th>維生素C(mg)</th>\r\n			<td>0</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>0</td>\r\n		</tr>\r\n		<tr>\r\n			<th>膳食纖維(g)</th>\r\n			<td>0.3</td>\r\n			<th>鹽分(g)</th>\r\n			<td>0.2</td>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>0</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 6, 0, 0, '', '2019-12-31 14:43:13', 1, '2020-12-09 12:03:33', 2),
(166, '味噌湯', '/uploads/repicepro/1577774957.jfif', '', '經典味噌湯，鮮明的風味！', '豆類', '近期公開', '日式', '湯羹類', '1', '5人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>535</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>23</td>\r\n			<th>脂肪(g)</th>\r\n			<td>12.9</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>77.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>107</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.6</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>81</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.45</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.16</td>\r\n			<th>維生素C(mg)</th>\r\n			<td>31</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>45</td>\r\n		</tr>\r\n		<tr>\r\n			<th>膳食纖維(g)</th>\r\n			<td>5.3</td>\r\n			<th>鹽分(g)</th>\r\n			<td>4.1</td>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>100</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 19, 0, 0, '', '2019-12-31 14:49:17', 1, '2021-03-31 16:12:26', 2),
(167, '大阪燒', '/uploads/repicepro/1577782122.jfif', '', '使用「ほんだし®/烹大師®」鰹魚風味製作鬆軟帶有柴魚風味的麵糊！', '豬肉,葉菜類', '近期公開', '日式', '配菜', '1,10', '10人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>273</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>17.1</td>\r\n			<th>脂肪(g)</th>\r\n			<td>16.2</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>13.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>68</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.4</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>83</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.38</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.32</td>\r\n			<th>維生素C(mg)</th>\r\n			<td>35</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>240</td>\r\n		</tr>\r\n		<tr>\r\n			<th>膳食纖維(g)</th>\r\n			<td>1.8</td>\r\n			<th>鹽分(g)</th>\r\n			<td>1</td>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>85</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 42, 0, 0, '', '2019-12-31 16:48:43', 1, '2021-05-12 21:39:28', 2),
(168, '蔥鹽芝麻醬汁', '/uploads/repicepro/1577782423.jfif', '', '調配風味豐富又有深度的蔥鹽醬汁！', '其他', '近期公開', '其他', '其他', '1', '10人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>187</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>0.5</td>\r\n			<th>脂肪(g)</th>\r\n			<td>19.1</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>2.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>5</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.1</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>0</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.01</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.01</td>\r\n			<th>維生素C(mg)</th>\r\n			<td>2</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>0</td>\r\n		</tr>\r\n		<tr>\r\n			<th>膳食纖維(g)</th>\r\n			<td>0.6</td>\r\n			<th>鹽分(g)</th>\r\n			<td>0.2</td>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>21</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 14, 0, 0, '', '2019-12-31 16:53:43', 1, '2021-04-01 15:09:54', 2),
(169, '豬肉涮涮鍋 佐芥末橘醋', '/uploads/repicepro/1577782704.jfif', '', '製作讓人上癮的濃郁風味芥末橘醋！', '豬肉', '近期公開', '日式', '主食', '1', '2人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>227</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>25.7</td>\r\n			<th>脂肪(g)</th>\r\n			<td>9.4</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>10.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>171</td>\r\n			<th>鐵(mg)</th>\r\n			<td>3</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>119</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>1.05</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.35</td>\r\n			<th>維生素C(mg)</th>\r\n			<td>42</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>67</td>\r\n		</tr>\r\n		<tr>\r\n			<th>膳食纖維(g)</th>\r\n			<td>2.4</td>\r\n			<th>鹽分(g)</th>\r\n			<td>3.4</td>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>105</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 9, 0, 0, '', '2019-12-31 16:58:24', 1, '2020-08-11 10:36:38', 2),
(170, '白蘿蔔泥佐烤鯖魚', '/uploads/repicepro/1577782987.jfif', '', '多花一道手續，在白蘿蔔泥裡加入「ほんだし®/烹大師®」鰹魚風味。', '海鮮類', '近期公開', '日式', '主菜', '1', '2人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>506</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>41.8</td>\r\n			<th>脂肪(g)</th>\r\n			<td>33.7</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>3.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>27</td>\r\n			<th>鐵(mg)</th>\r\n			<td>2.5</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>74</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>2.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.43</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.63</td>\r\n			<th>維生素C(mg)</th>\r\n			<td>8</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>122</td>\r\n		</tr>\r\n		<tr>\r\n			<th>膳食纖維(g)</th>\r\n			<td>0.7</td>\r\n			<th>鹽分(g)</th>\r\n			<td>2.6</td>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>50</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 7, 0, 0, '', '2019-12-31 17:03:07', 1, '2020-09-14 04:09:49', 2),
(171, '串炸物', '/uploads/repicepro/1577783388.jfif', '', '襯托食材美味的外皮！', '豬肉', '近期公開', '日式', '配菜', '1', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>659</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>30.4</td>\r\n			<th>脂肪(g)</th>\r\n			<td>38.9</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>42.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>129</td>\r\n			<th>鐵(mg)</th>\r\n			<td>2</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>39</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>5.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.53</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.25</td>\r\n			<th>維生素C(mg)</th>\r\n			<td>19</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>192</td>\r\n		</tr>\r\n		<tr>\r\n			<th>膳食纖維(g)</th>\r\n			<td>3</td>\r\n			<th>鹽分(g)</th>\r\n			<td>5</td>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>109</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 18, 0, 0, '', '2019-12-31 17:09:48', 1, '2021-03-15 01:32:38', 2),
(172, '燉白蘿蔔', '/uploads/repicepro/1577783915.jfif', '', '美味滲透進食材裡', '根莖類', '近期公開', '日式', '配菜', '1', '3人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>92</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>&nbsp;2.6</td>\r\n			<th>脂肪(g)</th>\r\n			<td>0.1</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>15.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>30</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.5</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>167</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.05</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.05</td>\r\n			<th>維生素C(mg)</th>\r\n			<td>12</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>0</td>\r\n		</tr>\r\n		<tr>\r\n			<th>膳食纖維(g)</th>\r\n			<td>1.9</td>\r\n			<th>鹽分(g)</th>\r\n			<td>2</td>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>107</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 5, 0, 0, '', '2019-12-31 17:18:35', 1, '2021-04-26 11:55:52', 2),
(173, '炸絞肉排', '/uploads/repicepro/1577784379.jfif', '', '利用「ほんだし®/烹大師®」鰹魚風味提味！', '豬肉', '近期公開', '日式', '主菜', '1', '8人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>408</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>11.6</td>\r\n			<th>脂肪(g)</th>\r\n			<td>34.2</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>10</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>23</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.7</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>38</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.07</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.15</td>\r\n			<th>維生素C(mg)</th>\r\n			<td>4</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>90</td>\r\n		</tr>\r\n		<tr>\r\n			<th>膳食纖維(g)</th>\r\n			<td>0.9</td>\r\n			<th>鹽分(g)</th>\r\n			<td>1.4</td>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>28</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 11, 0, 0, '', '2019-12-31 17:26:19', 1, '2020-12-17 10:51:51', 2),
(174, '日式煎蛋捲', '/uploads/repicepro/1577784751.jfif', '', '只需加入、攪拌、煎蛋！超簡單日式煎蛋捲', '蛋', '近期公開', '日式', '配菜', '3', '2人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>217</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>13</td>\r\n			<th>脂肪(g)</th>\r\n			<td>16.5</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>1.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>56</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.9</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>153</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.06</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.44</td>\r\n			<th>維生素C(mg)</th>\r\n			<td>1</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>429</td>\r\n		</tr>\r\n		<tr>\r\n			<th>膳食纖維(g)</th>\r\n			<td>0.1</td>\r\n			<th>鹽分(g)</th>\r\n			<td>1.6</td>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>10</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 14, 0, 0, '', '2019-12-31 17:32:31', 1, '2020-11-25 16:29:40', 2),
(175, '涮肉片沙拉', '/uploads/repicepro/1577785183.jfif', '', '使用「ほんだし®/烹大師®」昆布風味減少肉的腥味，增添甜味！', '豬肉,葉菜類', '近期公開', '日式', '配菜', '3', '1人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>220</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>22.2</td>\r\n			<th>脂肪(g)</th>\r\n			<td>12</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>22</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.7</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>38</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.78</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.18</td>\r\n			<th>維生素C(mg)</th>\r\n			<td>10</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>61</td>\r\n		</tr>\r\n		<tr>\r\n			<th>膳食纖維(g)</th>\r\n			<td>0.5</td>\r\n			<th>鹽分(g)</th>\r\n			<td>.2</td>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>24</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 16, 0, 0, '', '2019-12-31 17:39:43', 1, '2020-11-27 08:55:59', 2),
(176, '淺漬', '/uploads/repicepro/1577785534.jfif', '', '只需加入攪拌再醃漬！製作昆布風味的淺漬小菜', '葉菜類', '近期公開', '日式', '配菜', '3', '2人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>15</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>1</td>\r\n			<th>脂肪(g)</th>\r\n			<td>0.1</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>3.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>20</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.2</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>6</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.02</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.02</td>\r\n			<th>維生素C(mg)</th>\r\n			<td>17</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>0</td>\r\n		</tr>\r\n		<tr>\r\n			<th>膳食纖維(g)</th>\r\n			<td>0.8</td>\r\n			<th>鹽分(g)</th>\r\n			<td>1</td>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>50</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 28, 0, 0, '', '2019-12-31 17:45:34', 1, '2020-12-14 15:05:18', 2),
(177, '海鮮咖哩', '/uploads/repicepro/1577785964.jfif', '', '海鮮也需要事先調味！', '海鮮類', '近期公開', '其他', '主食', '3,4', '5人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>603</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>16.5</td>\r\n			<th>脂肪(g)</th>\r\n			<td>16.9</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>92.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>74</td>\r\n			<th>鐵(mg)</th>\r\n			<td>2.1</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>38</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.1</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.1</td>\r\n			<th>維生素C(mg)</th>\r\n			<td>7</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>115</td>\r\n		</tr>\r\n		<tr>\r\n			<th>膳食纖維(g)</th>\r\n			<td>2.6</td>\r\n			<th>鹽分(g)</th>\r\n			<td>6.6</td>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>77</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 11, 0, 0, '', '2019-12-31 17:52:44', 1, '2020-12-18 11:24:50', 2),
(178, '鹽烤鯖魚', '/uploads/repicepro/1577786234.jfif', '', '減少魚腥味，增添鮮味！', '海鮮類', '近期公開', '日式', '主菜', '3', '1人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>501</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>41.6</td>\r\n			<th>脂肪(g)</th>\r\n			<td>33.6</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>1.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>15</td>\r\n			<th>鐵(mg)</th>\r\n			<td>2.4</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>74</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>2.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.42</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.62</td>\r\n			<th>維生素C(mg)</th>\r\n			<td>3</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>122</td>\r\n		</tr>\r\n		<tr>\r\n			<th>膳食纖維(g)</th>\r\n			<td>0.1</td>\r\n			<th>鹽分(g)</th>\r\n			<td>1.6</td>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>10</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 81, 0, 0, '', '2019-12-31 17:57:14', 1, '2021-05-10 11:30:03', 2),
(179, '昆布芥末奶油的蛤蜊義大利麵', '/uploads/repicepro/1577786407.jfif', '', '調配帶有強烈和風的昆布芥末奶油！', '海鮮類', '近期公開', '西式', '主食', '3', '2人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>304</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>7.4</td>\r\n			<th>脂肪(g)</th>\r\n			<td>11.5</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>35</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>27</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.5</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>69</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.07</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.07</td>\r\n			<th>維生素C(mg)</th>\r\n			<td>3</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>35</td>\r\n		</tr>\r\n		<tr>\r\n			<th>膳食纖維(g)</th>\r\n			<td>1.8</td>\r\n			<th>鹽分(g)</th>\r\n			<td>3.1</td>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>2</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 13, 0, 0, '', '2019-12-31 18:00:07', 1, '2020-11-25 16:19:16', 2),
(180, '酒蒸蛤蜊', '/uploads/repicepro/1577786539.jfif', '', '只需淋上再蒸煮！蛤蜊的鮮味就會倍增！', '海鮮類', '近期公開', '中式', '配菜', '3', '1人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>63</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>5.4</td>\r\n			<th>脂肪(g)</th>\r\n			<td>0.2</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>2.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>55</td>\r\n			<th>鐵(mg)</th>\r\n			<td>3</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>3</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.02</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.13</td>\r\n			<th>維生素C(mg)</th>\r\n			<td>1</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>32</td>\r\n		</tr>\r\n		<tr>\r\n			<th>膳食纖維(g)</th>\r\n			<td>0</td>\r\n			<th>鹽分(g)</th>\r\n			<td>3</td>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>0</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 6, 0, 0, '', '2019-12-31 18:02:19', 1, '2021-04-12 02:44:28', 2),
(181, '冰鎮蕃茄', '/uploads/repicepro/1577930265.jfif', '', '只加入調味鹽！即能襯托出蕃茄的鮮味', '瓜果類', '近期公開', '日式', '配菜', '9', '1人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>40</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>1.8</td>\r\n			<th>脂肪(g)</th>\r\n			<td>0.2</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>9.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>16</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.4</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>87</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.1</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.04</td>\r\n			<th>維生素C(mg)</th>\r\n			<td>29</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>0</td>\r\n		</tr>\r\n		<tr>\r\n			<th>膳食纖維(g)</th>\r\n			<td>1.9</td>\r\n			<th>鹽分(g)</th>\r\n			<td>1.2</td>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>194</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 11, 0, 0, '', '2020-01-02 09:57:45', 1, '2020-12-14 14:32:33', 2),
(182, '炒飯', '/uploads/repicepro/1577930581.jfif', '', '補足鮮味的冷凍白飯也能再次創造好滋味！', '豬肉,海鮮類', '近期公開', '中式', '主食', '9', '1人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>584</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>18.9</td>\r\n			<th>脂肪(g)</th>\r\n			<td>19.1</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>79.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>48</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.5</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>80</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>2.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.24</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.29</td>\r\n			<th>維生素C(mg)</th>\r\n			<td>7</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>230</td>\r\n		</tr>\r\n		<tr>\r\n			<th>膳食纖維(g)</th>\r\n			<td>1.4</td>\r\n			<th>鹽分(g)</th>\r\n			<td>4.2</td>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>20</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 7, 0, 0, '', '2020-01-02 10:03:01', 1, '2020-12-09 12:03:41', 2),
(183, '炒帆立貝', '/uploads/repicepro/1577931065.jfif', '', '補足解凍流失的鮮味，創作更極致的美味！', '海鮮類', '近期公開', '中式', '配菜', '4,8', '2人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>269</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>13.6</td>\r\n			<th>脂肪(g)</th>\r\n			<td>20.5</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>7.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>14</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.4</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>19</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>3.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.07</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.16</td>\r\n			<th>維生素C(mg)</th>\r\n			<td>27</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>21</td>\r\n		</tr>\r\n		<tr>\r\n			<th>膳食纖維(g)</th>\r\n			<td>1.8</td>\r\n			<th>鹽分(g)</th>\r\n			<td>5.2</td>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>34</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 238, 0, 0, '', '2020-01-02 10:11:05', 1, '2021-04-27 15:43:08', 2),
(184, '日式炸豬排', '/uploads/repicepro/1577931491.jfif', '', '使用調味鹽幫豬肉提味！', '豬肉', '近期公開', '日式', '主菜', '9', '1人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>638</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>30.5</td>\r\n			<th>脂肪(g)</th>\r\n			<td>51.5</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>8.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>42</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.9</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>30</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>3.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>1.08</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.26</td>\r\n			<th>維生素C(mg)</th>\r\n			<td>29</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>92</td>\r\n		</tr>\r\n		<tr>\r\n			<th>膳食纖維(g)</th>\r\n			<td>1.5</td>\r\n			<th>鹽分(g)</th>\r\n			<td>1.9</td>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>99</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 12, 0, 0, '', '2020-01-02 10:18:11', 1, '2020-12-09 17:39:40', 2),
(185, '法式奶油烤鮭魚排', '/uploads/repicepro/1577931907.jfif', '', '降低鮭魚的腥味，強調鮮味！', '海鮮類', '近期公開', '日式', '主菜', '9', '1人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>515</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>22.2</td>\r\n			<th>脂肪(g)</th>\r\n			<td>36.3</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>10.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>22</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.5</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>223</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>4.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.27</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.12</td>\r\n			<th>維生素C(mg)</th>\r\n			<td>18</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>93</td>\r\n		</tr>\r\n		<tr>\r\n			<th>膳食纖維(g)</th>\r\n			<td>1.3</td>\r\n			<th>鹽分(g)</th>\r\n			<td>0.9</td>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>30</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 19, 0, 0, '', '2020-01-02 10:25:07', 1, '2021-03-25 16:06:27', 2),
(186, '炸花枝', '/uploads/repicepro/1577932174.jfif', '', '使用「味之素®」S高鮮味精降低花枝的腥臭味！', '海鮮類', '近期公開', '日式', '配菜', '9', '2人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>219</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>13.8</td>\r\n			<th>脂肪(g)</th>\r\n			<td>16.2</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>3.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>22</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.2</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>10</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>3.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.03</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.05</td>\r\n			<th>維生素C(mg)</th>\r\n			<td>11</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>158</td>\r\n		</tr>\r\n		<tr>\r\n			<th>膳食纖維(g)</th>\r\n			<td>0.4</td>\r\n			<th>鹽分(g)</th>\r\n			<td>2.1</td>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>17</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 12, 0, 0, '', '2020-01-02 10:29:34', 1, '2021-05-07 10:13:55', 2),
(187, '炸牡蠣', '/uploads/repicepro/1577932735.jfif', '', '降低腥臭味，襯托牡蠣鮮味，創造濃郁口感。', '海鮮類', '近期公開', '日式', '配菜', '9', '2人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>650</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>16.6</td>\r\n			<th>脂肪(g)</th>\r\n			<td>53.1</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>24.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>329</td>\r\n			<th>鐵(mg)</th>\r\n			<td>3.5</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>134</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>8.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.14</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.46</td>\r\n			<th>維生素C(mg)</th>\r\n			<td>19</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>107</td>\r\n		</tr>\r\n		<tr>\r\n			<th>膳食纖維(g)</th>\r\n			<td>0.8</td>\r\n			<th>鹽分(g)</th>\r\n			<td>5.2</td>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>35</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 5, 0, 0, '', '2020-01-02 10:38:55', 1, '2020-12-25 11:47:44', 2),
(188, '海鮮沙拉', '/uploads/repicepro/1577932952.jfif', '', '使用「味之素®」S高鮮味精降低蝦子的腥味，突顯鮮味！', '海鮮類', '近期公開', '西式', '涼拌', '9', '2人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>130</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>9.6</td>\r\n			<th>脂肪(g)</th>\r\n			<td>7.9</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>34</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.7</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>51</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.05</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.07</td>\r\n			<th>維生素C(mg)</th>\r\n			<td>16</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>80</td>\r\n		</tr>\r\n		<tr>\r\n			<th>膳食纖維(g)</th>\r\n			<td>1.1</td>\r\n			<th>鹽分(g)</th>\r\n			<td>1.5</td>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>37</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 7, 0, 0, '', '2020-01-02 10:42:32', 1, '2021-01-27 17:29:40', 2),
(189, '燙青菜', '/uploads/repicepro/1577935335.jfif', '', '去除青菜澀味並增添甜味', '葉菜類', '近期公開', '中式', '配菜', '9', '5人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>12</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>1.4</td>\r\n			<th>脂肪(g)</th>\r\n			<td>0.1</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>83</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.2</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>142</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.02</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.04</td>\r\n			<th>維生素C(mg)</th>\r\n			<td>11</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>0</td>\r\n		</tr>\r\n		<tr>\r\n			<th>膳食纖維(g)</th>\r\n			<td>1.3</td>\r\n			<th>鹽分(g)</th>\r\n			<td>0.5</td>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>55</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 12, 0, 0, '', '2020-01-02 11:22:15', 1, '2021-03-05 12:50:52', 2),
(190, '鐵火卷', '/uploads/repicepro/1577935571.jfif', '', '使用「味之素®」S高鮮味精消除醋的刺激味道，創造溫潤好滋味！', '海鮮類', '近期公開', '日式', '主食', '9', '10人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>313</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>19.9</td>\r\n			<th>脂肪(g)</th>\r\n			<td>1.3</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>54.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>23</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.1</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>119</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.1</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.11</td>\r\n			<th>維生素C(mg)</th>\r\n			<td>8</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>31</td>\r\n		</tr>\r\n		<tr>\r\n			<th>膳食纖維(g)</th>\r\n			<td>1.4</td>\r\n			<th>鹽分(g)</th>\r\n			<td>4.7</td>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>0</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 8, 0, 0, '', '2020-01-02 11:26:11', 1, '2020-12-15 11:04:06', 2),
(191, '水煮毛豆', '/uploads/repicepro/1577935823.jfif', '', '煮出鮮甜滋味！', '豆類', '近期公開', '日式', '配菜', '9', '10人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>244</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>20.4</td>\r\n			<th>脂肪(g)</th>\r\n			<td>11.4</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>16.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>116</td>\r\n			<th>鐵(mg)</th>\r\n			<td>3.8</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>23</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.42</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.2</td>\r\n			<th>維生素C(mg)</th>\r\n			<td>41</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>0</td>\r\n		</tr>\r\n		<tr>\r\n			<th>膳食纖維(g)</th>\r\n			<td>11</td>\r\n			<th>鹽分(g)</th>\r\n			<td>1.5</td>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>150</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 10, 0, 0, '', '2020-01-02 11:30:23', 1, '2021-04-12 01:42:47', 2),
(192, '大阪燒', '/uploads/repicepro/1578288240.jpg', '', '使用「ほんだし®/烹大師®」鰹魚風味，做出鬆軟且保有鰹魚風味的麵糊！', '豬肉', '近期公開', '日式', '配菜', '1,10', '10人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>273</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>17.1</td>\r\n			<th>脂肪(g)</th>\r\n			<td>16.2</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>13.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>68</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.4</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>83</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.38</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.32</td>\r\n			<th>維生素C(mg)</th>\r\n			<td>35</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>240</td>\r\n		</tr>\r\n		<tr>\r\n			<th>膳食纖維(g)</th>\r\n			<td>1.8</td>\r\n			<th>鹽分(g)</th>\r\n			<td>1</td>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>85</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 8, 0, 1, '和大阪燒食譜重複', '2020-01-06 13:24:00', 1, '2021-01-05 17:19:02', 7),
(193, '綜合焗烤野菜', '/uploads/repicepro/1578288590.jfif', '', '使用酸味適中的沙拉醬，讓野菜更美味', '瓜果類', '近期公開', '西式', '配菜', '4,10', '2人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>190</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>1.3</td>\r\n			<th>脂肪(g)</th>\r\n			<td>18.7</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>4.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>17</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.4</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>31</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.05</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.04</td>\r\n			<th>維生素C(mg)</th>\r\n			<td>16</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>0</td>\r\n		</tr>\r\n		<tr>\r\n			<th>膳食纖維(g)</th>\r\n			<td>1.1</td>\r\n			<th>鹽分(g)</th>\r\n			<td>0.9</td>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>90</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 49, 0, 0, '', '2020-01-06 13:29:50', 1, '2021-05-01 18:54:56', 2),
(194, '日式炸蝦佐塔塔醬', '/uploads/repicepro/1578294517.jfif', '', '酸味適中的沙拉醬製成的塔塔醬', '海鮮類', '近期公開', '西式', '配菜', '4,10', '1人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>349</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>14.9</td>\r\n			<th>脂肪(g)</th>\r\n			<td>18.4</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>32</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>91</td>\r\n			<th>鐵(mg)</th>\r\n			<td>2.3</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>35</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.1</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.16</td>\r\n			<th>維生素C(mg)</th>\r\n			<td>41</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>42</td>\r\n		</tr>\r\n		<tr>\r\n			<th>膳食纖維(g)</th>\r\n			<td>2</td>\r\n			<th>鹽分(g)</th>\r\n			<td>1.7</td>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>102</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 13, 0, 0, '', '2020-01-06 15:08:37', 1, '2021-05-01 23:29:20', 2),
(195, '日式美乃滋炸蝦', '/uploads/repicepro/1578294726.jfif', '', '使用「味之素品牌」沙拉醬，做出酸味適中的醬汁', '海鮮類', '近期公開', '西式', '配菜', '10', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>112</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>6.1</td>\r\n			<th>脂肪(g)</th>\r\n			<td>8.4</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>2.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>16</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.3</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>8</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.04</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.02</td>\r\n			<th>維生素C(mg)</th>\r\n			<td>1</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>46</td>\r\n		</tr>\r\n		<tr>\r\n			<th>膳食纖維(g)</th>\r\n			<td>0.3</td>\r\n			<th>鹽分(g)</th>\r\n			<td>0.7</td>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>16</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 15, 0, 0, '', '2020-01-06 15:12:06', 1, '2021-03-15 01:31:45', 2),
(196, '蓮藕、里芋拌辣味美乃滋', '/uploads/repicepro/1578304608.jfif', '', '沙拉醬+韓式辣醬的辣味讓人食指大動!', '根莖類', '近期公開', '日式', '配菜', '10', '2人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>263</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>3.4</td>\r\n			<th>脂肪(g)</th>\r\n			<td>21</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>16.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>58</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.9</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>6</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>3.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.09</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.03</td>\r\n			<th>維生素C(mg)</th>\r\n			<td>22</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>10</td>\r\n		</tr>\r\n		<tr>\r\n			<th>膳食纖維(g)</th>\r\n			<td>2.2</td>\r\n			<th>鹽分(g)</th>\r\n			<td>1.9</td>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>40</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 73, 0, 0, '', '2020-01-06 17:56:48', 1, '2021-03-03 15:58:09', 2),
(197, '牛肉蕃茄酪梨生春捲', '/uploads/repicepro/1578304985.jfif', '', '將牛肉、蕃茄、酪梨等十分對味的食材捲成美味又方便吃的春捲', '牛肉', '近期公開', '異國', '配菜', '4,10', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>292</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>10</td>\r\n			<th>脂肪(g)</th>\r\n			<td>21.3</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>16.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>26</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.8</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>68</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>3.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.15</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.2</td>\r\n			<th>維生素C(mg)</th>\r\n			<td>26</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>30</td>\r\n		</tr>\r\n		<tr>\r\n			<th>膳食纖維(g)</th>\r\n			<td>3.6</td>\r\n			<th>鹽分(g)</th>\r\n			<td>1.2</td>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>140</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 18, 0, 0, '', '2020-01-06 18:03:05', 1, '2021-02-26 17:18:35', 2),
(198, '竹筍佐味噌美乃滋田樂', '/uploads/repicepro/1578305178.jfif', '', '田樂風竹筍別有一番風味~', '根莖類', '近期公開', '日式', '配菜', '10', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>54</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>2.4</td>\r\n			<th>脂肪(g)</th>\r\n			<td>3.1</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>4.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>12</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.4</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>1</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.03</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.06</td>\r\n			<th>維生素C(mg)</th>\r\n			<td>5</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>膳食纖維(g)</th>\r\n			<td>1.6</td>\r\n			<th>鹽分(g)</th>\r\n			<td>0.7</td>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>50</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 59, 0, 0, '', '2020-01-06 18:06:18', 1, '2021-03-30 21:54:39', 2),
(199, '油菜花與雞里肌肉的和風芝麻沙拉', '/uploads/repicepro/1578305413.jfif', '', '爽口的油菜花與雞里肌肉佐以帶有芝麻清香濃郁風味的沙拉醬，絕配!', '雞肉,葉菜類', '近期公開', '西式', '配菜', '10', '2人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>297</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>14.9</td>\r\n			<th>脂肪(g)</th>\r\n			<td>22.3</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>10.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>159</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.6</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>317</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>4.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.22</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.34</td>\r\n			<th>維生素C(mg)</th>\r\n			<td>112</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>34</td>\r\n		</tr>\r\n		<tr>\r\n			<th>膳食纖維(g)</th>\r\n			<td>5.4</td>\r\n			<th>鹽分(g)</th>\r\n			<td>1.2</td>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>113</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 57, 0, 0, '', '2020-01-06 18:10:13', 1, '2021-01-29 14:09:58', 2);
INSERT INTO `recipepro` (`id`, `name`, `pic_url`, `pic_alt`, `feature`, `tags`, `price`, `type`, `style`, `product_ids`, `material_weight`, `nutrition`, `member_only`, `visitor`, `list_order`, `status`, `remark`, `c_time`, `c_user_id`, `u_time`, `u_user_id`) VALUES
(200, '雞肉丸', '/uploads/repicepro/1578305642.jfif', '', '秘密武器沙拉醬讓濃郁感倍增。', '雞肉', '近期公開', '日式', '配菜', '10', '2人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>326</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>18.5</td>\r\n			<th>脂肪(g)</th>\r\n			<td>21.7</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>9.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>15</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>39</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>2.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.1</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.19</td>\r\n			<th>維生素C(mg)</th>\r\n			<td>2</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>83</td>\r\n		</tr>\r\n		<tr>\r\n			<th>膳食纖維(g)</th>\r\n			<td>0.2</td>\r\n			<th>鹽分(g)</th>\r\n			<td>2.4</td>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>7</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 39, 0, 0, '', '2020-01-06 18:14:02', 1, '2021-05-14 13:51:50', 2),
(201, '白菜大阪燒', '/uploads/repicepro/1578305885.jfif', '', '以白菜為主角的酥脆大阪燒!', '葉菜類', '近期公開', '日式', '配菜', '1,10', '2人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>575</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>14.2</td>\r\n			<th>脂肪(g)</th>\r\n			<td>18.2</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>84.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>142</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.7</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>58</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>2.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.2</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.22</td>\r\n			<th>維生素C(mg)</th>\r\n			<td>48</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>107</td>\r\n		</tr>\r\n		<tr>\r\n			<th>膳食纖維(g)</th>\r\n			<td>5.8</td>\r\n			<th>鹽分(g)</th>\r\n			<td>1.5</td>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>250</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 15, 0, 0, '', '2020-01-06 18:18:05', 1, '2020-12-25 11:48:34', 2),
(202, '味噌美乃滋沙拉棒', '/uploads/repicepro/1578306105.jfif', '', '簡單的美味讓你忍不住一口接一口!', '葉菜類,根莖類', '近期公開', '日式', '配菜', '10', '2人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>225</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>2.6</td>\r\n			<th>脂肪(g)</th>\r\n			<td>20</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>9.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>49</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.5</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>229</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>3.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.08</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.08</td>\r\n			<th>維生素C(mg)</th>\r\n			<td>15</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>10</td>\r\n		</tr>\r\n		<tr>\r\n			<th>膳食纖維(g)</th>\r\n			<td>2.1</td>\r\n			<th>鹽分(g)</th>\r\n			<td>1.1</td>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>120</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 2, 0, 0, '', '2020-01-06 18:21:45', 1, '2021-05-07 17:09:19', 2),
(203, '鮪魚及豐富青菜的義式前菜', '/uploads/repicepro/1578306351.jfif', '', '充分提引出鮪魚美味的美乃滋調醬!', '海鮮類,葉菜類', '近期公開', '西式', '配菜', '10', '2人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>255</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>9.8</td>\r\n			<th>脂肪(g)</th>\r\n			<td>22.6</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>1.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>13</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.6</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>48</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>3.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.05</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.04</td>\r\n			<th>維生素C(mg)</th>\r\n			<td>3</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>23</td>\r\n		</tr>\r\n		<tr>\r\n			<th>膳食纖維(g)</th>\r\n			<td>0.3</td>\r\n			<th>鹽分(g)</th>\r\n			<td>0.5</td>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>17</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 4, 0, 0, '', '2020-01-06 18:25:51', 1, '2020-10-17 00:23:30', 2),
(204, '雞肉苦瓜沙拉', '/uploads/repicepro/1578306602.jfif', '', '味道淡泊的雞胸肉有了沙拉醬也能成為白飯的好朋友', '雞肉,根莖類', '近期公開', '西式', '配菜', '10', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>198</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>13</td>\r\n			<th>脂肪(g)</th>\r\n			<td>13.9</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>3.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>10</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.4</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>21</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>2.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.08</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.08</td>\r\n			<th>維生素C(mg)</th>\r\n			<td>23</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>41</td>\r\n		</tr>\r\n		<tr>\r\n			<th>膳食纖維(g)</th>\r\n			<td>1.1</td>\r\n			<th>鹽分(g)</th>\r\n			<td>0.8</td>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>38</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 4, 0, 0, '', '2020-01-06 18:30:02', 1, '2020-12-25 12:19:10', 2),
(205, '玉米肉丸子', '/uploads/repicepro/1578306887.jfif', '', '豬絞肉加入沙拉醬會有意想不到的鬆軟口感!', '豬肉', '近期公開', '日式', '配菜', '10', '2人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>402</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>22.6</td>\r\n			<th>脂肪(g)</th>\r\n			<td>27.2</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>12.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>26</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.8</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>41</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.78</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.36</td>\r\n			<th>維生素C(mg)</th>\r\n			<td>8</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>130</td>\r\n		</tr>\r\n		<tr>\r\n			<th>膳食纖維(g)</th>\r\n			<td>1.9</td>\r\n			<th>鹽分(g)</th>\r\n			<td>1.2</td>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>70</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 13, 0, 0, '', '2020-01-06 18:34:47', 1, '2021-02-26 17:18:20', 2),
(206, '珍菇銀翅羹湯', '/uploads/repicepro/1583309129.jpg', '', '', '葉菜類,菇蕈類', '近期公開', '素食', '主菜', '11', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>94</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>3.7</td>\r\n			<th>脂肪(g)</th>\r\n			<td>3.4</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>15</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>58</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.9</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>79</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.13</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.13</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.2</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>24</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>0</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>4.2</td>\r\n			<th>鹽分(g)</th>\r\n			<td>2.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>204</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 182, 0, 0, '', '2020-03-04 16:05:29', 7, '2021-05-01 23:26:57', 2),
(207, '海苔醬燒什錦豆腐', '/uploads/repicepro/1583309432.jpg', '', '', '根莖類,菇蕈類,豆類', '近期公開', '素食', '主菜', '11', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>152</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>12.3</td>\r\n			<th>脂肪(g)</th>\r\n			<td>8.4</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>8.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>140</td>\r\n			<th>鐵(mg)</th>\r\n			<td>2.3</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>78</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.17</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.14</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.13</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>5</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>0</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>2.8</td>\r\n			<th>鹽分(g)</th>\r\n			<td>1.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>64</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 15, 0, 0, '', '2020-03-04 16:10:32', 7, '2020-12-15 11:08:50', 2),
(208, '金瓜蛋酥米粉', '/uploads/repicepro/1583310021.jpg', '', '', '瓜果類,菇蕈類', '近期公開', '中式', '主食', '11', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>238</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>7.6</td>\r\n			<th>脂肪(g)</th>\r\n			<td>4.3</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>44.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>28</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.4</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>347</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>5.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.15</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.24</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.28</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>45</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>43</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>6.2</td>\r\n			<th>鹽分(g)</th>\r\n			<td>0.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>118</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 13, 0, 0, '', '2020-03-04 16:20:21', 7, '2020-12-15 11:04:17', 2),
(209, '梅干菜燜雙色苦瓜', '/uploads/repicepro/1583310402.jpg', '', '', '瓜果類', '近期公開', '中式', '主菜', '11', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>44</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>2</td>\r\n			<th>脂肪(g)</th>\r\n			<td>1.5</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>8.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>10</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.4</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>19</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.05</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.11</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.07</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>50</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>0</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>3.4</td>\r\n			<th>鹽分(g)</th>\r\n			<td>1.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>77</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 105, 0, 0, '', '2020-03-04 16:26:42', 7, '2021-02-18 21:27:51', 2),
(210, '藥燉牛蒡薏仁養生湯', '/uploads/repicepro/1583310697.jpg', '', '', '根莖類,其他', '近期公開', '異國', '湯羹類', '11', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>204</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>8.6</td>\r\n			<th>脂肪(g)</th>\r\n			<td>2</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>36.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>58</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.5</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>0.2</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1.25</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.15</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.2</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.24</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>5</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>0</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>7.4</td>\r\n			<th>鹽分(g)</th>\r\n			<td>3.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>155</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 14, 0, 0, '', '2020-03-04 16:31:37', 7, '2020-12-24 20:07:52', 2),
(211, '松露野菇燉飯', '/uploads/repicepro/1583311324.jpg', '', '', '菇蕈類', '近期公開', '西式', '主食', '11', '2人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>466</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>9</td>\r\n			<th>脂肪(g)</th>\r\n			<td>32.2</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>37.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>90</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.6</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>275</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.13</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.48</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.19</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.08</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>58</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>70</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>3.6</td>\r\n			<th>鹽分(g)</th>\r\n			<td>3.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>138</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 114, 0, 0, '', '2020-03-04 16:42:10', 7, '2021-02-19 10:14:29', 2),
(212, '銀杏冬茸翡翠羹', '/uploads/repicepro/1583311985.jpg', '', '', '葉菜類,瓜果類,菇蕈類', '近期公開', '中式', '主菜', '11', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>174</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>1.9</td>\r\n			<th>脂肪(g)</th>\r\n			<td>1.4</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>8.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>35</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>90</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.06</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.13</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.09</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>50</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>0</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>2.3</td>\r\n			<th>鹽分(g)</th>\r\n			<td>1.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>125</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 129, 0, 0, '', '2020-03-04 16:43:07', 7, '2021-02-24 19:18:38', 2),
(213, '嫩煎雞腿佐香草蘑菇醬', '/uploads/repicepro/1583312224.jpg', '', '', '菇蕈類', '近期公開', '西式', '其他', '11', '2人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>492</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>30.8</td>\r\n			<th>脂肪(g)</th>\r\n			<td>34</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>15.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>47</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.8</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>161</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.32</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.53</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>1.02</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>18</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>160</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>5.25</td>\r\n			<th>鹽分(g)</th>\r\n			<td>2.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>126</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 15, 0, 0, '', '2020-03-04 16:43:38', 7, '2021-04-29 16:50:25', 2),
(214, '白胡椒高湯茶泡飯', '/uploads/repicepro/1601283069.jpg', '', '簡單的高湯茶泡飯，撒上白胡椒，神來一筆!', '其他', '近期公開', '日式', '主食', '1', '2人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>136</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>2.8</td>\r\n			<th>脂肪(g)</th>\r\n			<td>0.3</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>29.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>9</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.2</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>1</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.0</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.02</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.01</td>\r\n			<th>維生素C(mg)</th>\r\n			<td>0</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>膳食纖維(g)</th>\r\n			<td>0.5</td>\r\n			<th>鹽分(g)</th>\r\n			<td>3.0</td>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>7</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 80, 0, 0, '', '2020-03-04 16:44:35', 7, '2021-05-14 18:20:35', 2),
(215, '蕃茄烏龍冷麵', '/uploads/repicepro/1601283359.jpg', '', '', '瓜果類', '近期公開', '日式', '主食', '1,8', '2人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>273</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>19.6</td>\r\n			<th>脂肪(g)</th>\r\n			<td>7.3</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>29.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>80</td>\r\n			<th>鐵(mg)</th>\r\n			<td>2.1</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>139</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>2.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.15</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.32</td>\r\n			<th>維生素C(mg)</th>\r\n			<td>24</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>225</td>\r\n		</tr>\r\n		<tr>\r\n			<th>膳食纖維(g)</th>\r\n			<td>1.7</td>\r\n			<th>鹽分(g)</th>\r\n			<td>6.4</td>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>158</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 62, 0, 0, '', '2020-03-04 16:45:33', 7, '2021-05-15 09:10:42', 2),
(216, '五穀干貝風味粽', '/uploads/repicepro/1592187798.png', '', '', '豬肉', '近期公開', '中式', '其他', '8', '10人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>360</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>15.9</td>\r\n			<th>脂肪(g)</th>\r\n			<td>10.3</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>49.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>380</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.8</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>51</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.47</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.24</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.26</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>1</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>150</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>2.4</td>\r\n			<th>鹽分(g)</th>\r\n			<td>1.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>23</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 93, 0, 0, '', '2020-06-15 10:23:18', 7, '2020-12-09 11:40:20', 2),
(217, '醃五花肉', '/uploads/repicepro/1592189243.jpg', '', '鮮味增倍，添加濃厚口感 ', '豬肉', '近期公開', '中式', '配菜', '8', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>681</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>20.4</td>\r\n			<th>脂肪(g)</th>\r\n			<td>44.3</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>31.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>31</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.3</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>14</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.66</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.2</td>\r\n			<th>維生素C(mg)</th>\r\n			<td>11</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>88</td>\r\n		</tr>\r\n		<tr>\r\n			<th>膳食纖維(g)</th>\r\n			<td>1.2</td>\r\n			<th>鹽分(g)</th>\r\n			<td>3.1</td>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>84</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 113, 0, 0, '', '2020-06-15 10:47:23', 7, '2021-04-27 11:27:09', 2),
(218, '豬肉味噌湯', '/uploads/repicepro/1601283764.jpg', '', '', '豬肉', '近期公開', '日式', '配菜', '1', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>90</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>4.0</td>\r\n			<th>脂肪(g)</th>\r\n			<td>4.3</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>8.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>28</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.8</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>73</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.08</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.04</td>\r\n			<th>維生素C(mg)</th>\r\n			<td>4</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>膳食纖維(g)</th>\r\n			<td>2.0</td>\r\n			<th>鹽分(g)</th>\r\n			<td>2.5</td>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>35</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 64, 0, 0, '', '2020-09-28 17:02:44', 7, '2021-05-14 18:22:52', 2),
(219, '濃鰹魚高湯味的海藻雜炊', '/uploads/repicepro/1601284184.jpg', '', '海藻香氣四溢，充滿海味的雜炊', '海鮮類', '近期公開', '日式', '主食', '1', '2人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>319</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>9.4</td>\r\n			<th>脂肪(g)</th>\r\n			<td>3.1</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>59.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>39</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.1</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>44</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.06</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.17</td>\r\n			<th>維生素C(mg)</th>\r\n			<td>1</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>105</td>\r\n		</tr>\r\n		<tr>\r\n			<th>膳食纖維(g)</th>\r\n			<td>1.3</td>\r\n			<th>鹽分(g)</th>\r\n			<td>3.9</td>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>0</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 60, 0, 0, '', '2020-09-28 17:09:44', 7, '2021-05-14 18:22:34', 2),
(220, '白肉魚佐蘿蔔泥', '/uploads/repicepro/1601284452.jpg', '', '瞬間感受到雙倍鮮味、雙重美味', '海鮮類', '近期', '日式', '配菜', '1,3', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>127</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>13.7</td>\r\n			<th>脂肪(g)</th>\r\n			<td>5.5</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>4.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>37</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.3</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>10</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.09</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.08</td>\r\n			<th>維生素C(mg)</th>\r\n			<td>6</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>44</td>\r\n		</tr>\r\n		<tr>\r\n			<th>膳食纖維(g)</th>\r\n			<td>0.7</td>\r\n			<th>鹽分(g)</th>\r\n			<td>1.1</td>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>50</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 93, 0, 0, '', '2020-09-28 17:14:12', 7, '2021-05-14 18:21:59', 2),
(221, '花枝生魚片拌山茼蒿沙拉', '/uploads/repicepro/1601284733.jpg', '', '溫醬汁與山茼蒿一起食用，別有風味!', '海鮮類', '近期', '西式', '涼拌', '1,3', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>156</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>5.4</td>\r\n			<th>脂肪(g)</th>\r\n			<td>13.5</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>2.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>89</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.1</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>190</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.07</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.09</td>\r\n			<th>維生素C(mg)</th>\r\n			<td>10</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>36</td>\r\n		</tr>\r\n		<tr>\r\n			<th>膳食纖維(g)</th>\r\n			<td>1.9</td>\r\n			<th>鹽分(g)</th>\r\n			<td>0.5</td>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>50</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 56, 0, 0, '', '2020-09-28 17:18:53', 7, '2021-05-14 18:20:52', 2),
(222, '煎餃', '/uploads/repicepro/1601284987.jpg', '', '餃子的調味決定一切!', '豬肉', '近期', '中式', '主食', '4', '1人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>443</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>21.0</td>\r\n			<th>脂肪(g)</th>\r\n			<td>29.7</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>19.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>18</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.3</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>10</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>2.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.72</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.24</td>\r\n			<th>維生素C(mg)</th>\r\n			<td>4</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>75</td>\r\n		</tr>\r\n		<tr>\r\n			<th>膳食纖維(g)</th>\r\n			<td>1.2</td>\r\n			<th>鹽分(g)</th>\r\n			<td>0.5</td>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>20</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 97, 0, 0, '', '2020-09-28 17:23:07', 7, '2021-05-14 18:21:41', 2),
(223, '古早味白菜滷', '/uploads/repicepro/1601888488.jpg', '', '', '葉菜類', '1', '中式', '主菜', '1', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>219</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>10.5</td>\r\n			<th>脂肪(g)</th>\r\n			<td>14.9</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>14.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>570</td>\r\n			<th>鐵(mg)</th>\r\n			<td>2.4</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>102</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.14</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.25</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.33</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>58</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>100</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>6.5</td>\r\n			<th>鹽分(g)</th>\r\n			<td>2.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>323</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 9, 0, 0, '', '2020-10-05 17:01:28', 7, '2021-02-27 11:32:14', 2),
(224, '紅蟳米糕', '/uploads/repicepro/1601888840.jpg', '', '', '海鮮類', '-', '中式', '主菜', '2', '6人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>223</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>12.8</td>\r\n			<th>脂肪(g)</th>\r\n			<td>5.6</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>29.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>260</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.9</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>1.3</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.1</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.2</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.15</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>2.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>1</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>53</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>3.7</td>\r\n			<th>鹽分(g)</th>\r\n			<td>2.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>14</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 78, 0, 0, '', '2020-10-05 17:07:20', 7, '2021-02-09 14:07:26', 2),
(225, '麻辣鴨血臭豆腐', '/uploads/repicepro/1601889289.jpg', '', '', '其他', '-', '中式', '主菜', '1,4', '4人', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>723</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>60.8</td>\r\n			<th>脂肪(g)</th>\r\n			<td>31.1</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>50</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>36</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.5</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>58</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.14</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.22</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.23</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>8</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>72</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>2.9</td>\r\n			<th>鹽分(g)</th>\r\n			<td>7.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>58.5</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 6, 0, 0, '', '2020-10-05 17:14:49', 7, '2020-12-15 11:52:19', 2),
(226, '猴頭菇竹笙燉四寶', '/uploads/repicepro/1601889834.jpg', '', '', '菇蕈類', '-', '中式', '湯羹類', '3,11', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>209</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>11.9</td>\r\n			<th>脂肪(g)</th>\r\n			<td>4.9</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>35.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>59</td>\r\n			<th>鐵(mg)</th>\r\n			<td>9.9</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>3.2</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.27</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.74</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.11</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>10</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>0</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>9.4</td>\r\n			<th>鹽分(g)</th>\r\n			<td>2.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>113</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 54, 0, 0, '', '2020-10-05 17:23:54', 7, '2021-03-08 19:09:20', 2),
(227, '筍乾大封', '/uploads/repicepro/1601890339.jpg', '', '', '豬肉,葉菜類', '-', '中式', '主菜', '4', '6人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>972</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>30</td>\r\n			<th>脂肪(g)</th>\r\n			<td>84.4</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>9.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>71</td>\r\n			<th>鐵(mg)</th>\r\n			<td>2.3</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>109.7</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.94</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.31</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.62</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>16</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>140</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>1.7</td>\r\n			<th>鹽分(g)</th>\r\n			<td>5.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>79.5</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 81, 0, 0, '', '2020-10-05 17:32:19', 7, '2021-04-13 01:10:32', 2),
(228, '魷魚螺肉蒜', '/uploads/repicepro/1601890724.jpg', '', '', '海鮮類', '-', '中式', '湯羹類', '1', '6人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>257</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>28.2</td>\r\n			<th>脂肪(g)</th>\r\n			<td>11.9</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>11.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>490</td>\r\n			<th>鐵(mg)</th>\r\n			<td>4.1</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>19.2</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.18</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.3</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.18</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>4.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>4</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>310</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>5.7</td>\r\n			<th>鹽分(g)</th>\r\n			<td>5.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>74.5</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 83, 0, 0, '', '2020-10-05 17:38:44', 7, '2021-05-13 11:50:12', 2),
(229, '雙冬燴芥菜', '/uploads/repicepro/1601891036.jpg', '', '', '根莖類,菇蕈類', '-', '中式', '配菜', '11', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>220</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>9.7</td>\r\n			<th>脂肪(g)</th>\r\n			<td>10.2</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>30.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>160</td>\r\n			<th>鐵(mg)</th>\r\n			<td>3</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>258.3</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>4.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.27</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.49</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.33</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>71</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>0</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>11.1</td>\r\n			<th>鹽分(g)</th>\r\n			<td>3.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>189.5</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 64, 0, 0, '', '2020-10-05 17:43:56', 7, '2021-01-04 01:35:24', 2),
(230, '糯米鳳眼果雞湯', '/uploads/repicepro/1601891700.jpg', '', '', '雞肉', '-', '中式', '湯羹類', '1,4', '6人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>657</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>56</td>\r\n			<th>脂肪(g)</th>\r\n			<td>31</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>34.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>40</td>\r\n			<th>鐵(mg)</th>\r\n			<td>2</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>94.5</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.32</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.47</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.71</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>5</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>190</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>4.5</td>\r\n			<th>鹽分(g)</th>\r\n			<td>5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>13.5</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 101, 0, 0, '', '2020-10-05 17:55:00', 7, '2021-05-14 15:16:19', 2),
(231, '香煎松阪豬起司乳香燉飯', '/uploads/repicepro/1602754506.jpg', '', '', '豬肉', '-', '西式', '主食', '4,11', '2人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>702</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>16.7</td>\r\n			<th>脂肪(g)</th>\r\n			<td>51.6</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>37</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>62</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.9</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>68</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.42</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.18</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.43</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>8</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>81</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>2.3</td>\r\n			<th>鹽分(g)</th>\r\n			<td>1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>86</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 5, 0, 0, '', '2020-10-15 17:35:06', 7, '2020-12-01 13:21:22', 2),
(232, '雞肉鮮蔬南瓜燉飯', '/uploads/repicepro/1602755001.jpg', '', '', '雞肉', '-', '日式', '主食', '4,11', '2人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>1254</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>63.7</td>\r\n			<th>脂肪(g)</th>\r\n			<td>53</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>130</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>210</td>\r\n			<th>鐵(mg)</th>\r\n			<td>6.7</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>708</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>18.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>1.05</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>1.21</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>1.99</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>230</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>250</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>26.5</td>\r\n			<th>鹽分(g)</th>\r\n			<td>4.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>1006</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 4, 0, 0, '', '2020-10-15 17:43:21', 7, '2020-10-27 15:00:38', 2),
(233, '海鮮義大利麵(微辣)', '/uploads/repicepro/1602756183.jpg', '', '', '海鮮類', '-', '西式', '主食', '1,2', '1人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>751</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>61.3</td>\r\n			<th>脂肪(g)</th>\r\n			<td>14.6</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>86.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>150</td>\r\n			<th>鐵(mg)</th>\r\n			<td>5.5</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>76</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>5.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.41</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.52</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.91</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>23.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>19</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>480</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>8.1</td>\r\n			<th>鹽分(g)</th>\r\n			<td>3.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>50</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 12, 0, 0, '', '2020-10-15 18:03:03', 7, '2021-03-29 15:06:30', 2),
(234, '明太子蟹肉義大利麵', '/uploads/repicepro/1602756605.jpg', '', '', '海鮮類', '-', '西式', '主食', '2,4', '1人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>988</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>34.5</td>\r\n			<th>脂肪(g)</th>\r\n			<td>54.8</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>83</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>170</td>\r\n			<th>鐵(mg)</th>\r\n			<td>2.6</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>349</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>5.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.54</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.76</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.48</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>8.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>34</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>230</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>7.8</td>\r\n			<th>鹽分(g)</th>\r\n			<td>4.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>63</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 10, 0, 0, '', '2020-10-15 18:10:05', 7, '2021-04-29 16:52:11', 2),
(235, '澳式酪梨舒肥雞胸手工可頌', '/uploads/repicepro/1603241593.jpg', '', '', '雞肉,瓜果類', '-', '西式', '主食', '4,10', '1人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>887</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>54</td>\r\n			<th>脂肪(g)</th>\r\n			<td>55.6</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>43.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>150</td>\r\n			<th>鐵(mg)</th>\r\n			<td>2</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>253</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>6.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.34</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.44</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>1.44</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>31</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>190</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>5.2</td>\r\n			<th>鹽分(g)</th>\r\n			<td>2.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>100</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 7, 0, 0, '', '2020-10-21 08:53:13', 7, '2021-05-01 18:10:32', 2),
(236, '手做牽絲蕈菇經典原味貝果', '/uploads/repicepro/1603242039.jpg', '', '', '牛肉', '-', '西式', '主食', '4,10', '1人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>858</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>33.4</td>\r\n			<th>脂肪(g)</th>\r\n			<td>46.3</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>75.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>130</td>\r\n			<th>鐵(mg)</th>\r\n			<td>4.6</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>138</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>4.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.35</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.47</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.63</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>2.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>24</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>200</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>5</td>\r\n			<th>鹽分(g)</th>\r\n			<td>2.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>198</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 5, 0, 0, '', '2020-10-21 09:00:39', 7, '2021-05-01 18:14:08', 2),
(237, '波士頓龍蝦濃湯', '/uploads/repicepro/1603253001.jpg', '', '', '豬肉', '-', '西式', '主食', '4,11', '2人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>651</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>17.9</td>\r\n			<th>脂肪(g)</th>\r\n			<td>30.3</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>73.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>220</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.3</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>668</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>4.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.25</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.28</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.64</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>34</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>77</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>8</td>\r\n			<th>鹽分(g)</th>\r\n			<td>3.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>375</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 63, 0, 0, '', '2020-10-21 09:09:07', 7, '2021-04-29 16:51:03', 2),
(238, '慢燉牛小排佐紅酒醬', '/uploads/repicepro/1603252932.jpg', '', '', '牛肉', '-', '西式', '涼拌', '1,11', '2人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>1601</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>39.4</td>\r\n			<th>脂肪(g)</th>\r\n			<td>139</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>16</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>41</td>\r\n			<th>鐵(mg)</th>\r\n			<td>50.1</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>280</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>2.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.24</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.43</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.92</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>5.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>10</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>295</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>3.4</td>\r\n			<th>鹽分(g)</th>\r\n			<td>2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>133</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 59, 0, 0, '', '2020-10-21 09:24:29', 7, '2021-04-08 13:23:48', 2),
(239, '日本蕪菁味噌湯', '/uploads/repicepro/1614396645.jpg', '', '使用冬季盛產的根莖類，增添味噌湯的鮮甜感。', '根莖類,豆類', '1', '日式', '湯羹類', '1', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>105</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>5.1</td>\r\n			<th>脂肪(g)</th>\r\n			<td>5.4</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>9.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>112</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.4</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>198</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.08</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.08</td>\r\n			<th>維生素C(mg)</th>\r\n			<td>21</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>0</td>\r\n		</tr>\r\n		<tr>\r\n			<th>膳食纖維(g)</th>\r\n			<td>3</td>\r\n			<th>鹽分(g)</th>\r\n			<td>1.9</td>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>113</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 34, 0, 0, '', '2021-02-27 11:30:45', 7, '2021-05-14 21:10:28', 2),
(240, '土當歸與豌豆味噌湯', '/uploads/repicepro/1614397318.jpg', '', '飄散著春天香氣的味噌湯。添加土當歸成為享受香氣與口感的一道料理。', '根莖類,豆類', '-', '日式', '湯羹類', '1', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>34</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>2.3</td>\r\n			<th>脂肪(g)</th>\r\n			<td>0.8</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>4.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>18</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.7</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>4</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.02</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.03</td>\r\n			<th>維生素C(mg)</th>\r\n			<td>6</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>0</td>\r\n		</tr>\r\n		<tr>\r\n			<th>膳食纖維(g)</th>\r\n			<td>1.1</td>\r\n			<th>鹽分(g)</th>\r\n			<td>2.1</td>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>24</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 26, 0, 0, '', '2021-02-27 11:41:58', 7, '2021-05-14 21:10:36', 2);
INSERT INTO `recipepro` (`id`, `name`, `pic_url`, `pic_alt`, `feature`, `tags`, `price`, `type`, `style`, `product_ids`, `material_weight`, `nutrition`, `member_only`, `visitor`, `list_order`, `status`, `remark`, `c_time`, `c_user_id`, `u_time`, `u_user_id`) VALUES
(241, '烤菇味噌湯', '/uploads/repicepro/1614397732.jpg', '', '秋天的當季食材，凸顯菇類烤過後濃郁香氣的味噌湯。', '菇蕈類', '-', '日式', '湯羹類', '1', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>38</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>3</td>\r\n			<th>脂肪(g)</th>\r\n			<td>0.9</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>6.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>12</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.8</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>0</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.1</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.09</td>\r\n			<th>維生素C(mg)</th>\r\n			<td>0</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>0</td>\r\n		</tr>\r\n		<tr>\r\n			<th>膳食纖維(g)</th>\r\n			<td>2.5</td>\r\n			<th>鹽分(g)</th>\r\n			<td>1.8</td>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>0</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 29, 0, 0, '', '2021-02-27 11:48:53', 7, '2021-05-14 21:10:45', 2),
(242, '雞肉蔬菜味噌湯', '/uploads/repicepro/1614398088.jpg', '', '滿滿的蔬菜和雞肉等，不論視覺和味覺都很享受的味噌湯。', '雞肉,葉菜類,根莖類', '-', '日式', '湯羹類', '1', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>111</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>5.5</td>\r\n			<th>脂肪(g)</th>\r\n			<td>6.6</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>7.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>30</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.7</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>47</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.04</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.06</td>\r\n			<th>維生素C(mg)</th>\r\n			<td>8</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>18</td>\r\n		</tr>\r\n		<tr>\r\n			<th>膳食纖維(g)</th>\r\n			<td>1.4</td>\r\n			<th>鹽分(g)</th>\r\n			<td>2.1</td>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>35</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 25, 0, 0, '', '2021-02-27 11:54:48', 7, '2021-05-14 21:10:52', 2),
(243, '鯖魚蔬菜味噌湯', '/uploads/repicepro/1614398398.jpg', '', '加入充滿鮮味的鯖魚罐頭和滿滿蔬菜，份量充足的味噌湯。', '海鮮類,葉菜類,根莖類', '-', '日式', '湯羹類', '1', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>166</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>15.3</td>\r\n			<th>脂肪(g)</th>\r\n			<td>7.3</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>8.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>185</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.7</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>73</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>2.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.13</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.27</td>\r\n			<th>維生素C(mg)</th>\r\n			<td>17</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>51</td>\r\n		</tr>\r\n		<tr>\r\n			<th>膳食纖維(g)</th>\r\n			<td>1.6</td>\r\n			<th>鹽分(g)</th>\r\n			<td>2.9</td>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>35</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 23, 0, 0, '', '2021-02-27 11:59:58', 7, '2021-05-14 21:11:00', 2),
(244, '圓圓食材的味噌湯', '/uploads/repicepro/1614399109.jpg', '', '加入圓形又色彩鮮艷的食材，充滿視覺饗宴的味噌湯', '雞肉,葉菜類,根莖類', '-', '日式', '湯羹類', '1', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>106</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>7.9</td>\r\n			<th>脂肪(g)</th>\r\n			<td>4.3</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>8.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>43</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.1</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>29</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.06</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.08</td>\r\n			<th>維生素C(mg)</th>\r\n			<td>9</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>24</td>\r\n		</tr>\r\n		<tr>\r\n			<th>膳食纖維(g)</th>\r\n			<td>2</td>\r\n			<th>鹽分(g)</th>\r\n			<td>2.3</td>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>20</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 21, 0, 0, '', '2021-02-27 12:11:49', 7, '2021-05-14 21:11:08', 2),
(245, '麻辣味噌韓式鍋', '/uploads/repicepro/1614399416.jpg', '', '辣味中帶點麻，令人上癮的濃郁口感味噌湯。', '牛肉,葉菜類,豆類', '-', '韓式', '湯羹類', '1', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>246</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>8.6</td>\r\n			<th>脂肪(g)</th>\r\n			<td>18.3</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>11.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>87</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.9</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>52</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.09</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.15</td>\r\n			<th>維生素C(mg)</th>\r\n			<td>14</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>20</td>\r\n		</tr>\r\n		<tr>\r\n			<th>膳食纖維(g)</th>\r\n			<td>3.9</td>\r\n			<th>鹽分(g)</th>\r\n			<td>3.9</td>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>75</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 33, 0, 0, '', '2021-02-27 12:16:56', 7, '2021-05-14 21:11:15', 2),
(246, '豬肉水雲菜的沖繩式味噌湯', '/uploads/repicepro/1614399811.jpg', '', '豬肉的甘甜和味噌醇厚的口味相當速配。散發淡淡海岸香氣的味噌湯。', '豬肉,葉菜類,豆類', '-', '日式', '湯羹類', '1', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>90</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>8.4</td>\r\n			<th>脂肪(g)</th>\r\n			<td>4</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>5.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>60</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.3</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>38</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.18</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.09</td>\r\n			<th>維生素C(mg)</th>\r\n			<td>6</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>10</td>\r\n		</tr>\r\n		<tr>\r\n			<th>膳食纖維(g)</th>\r\n			<td>1.7</td>\r\n			<th>鹽分(g)</th>\r\n			<td>2.2</td>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>43</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 21, 0, 0, '', '2021-02-27 12:23:31', 7, '2021-05-14 21:11:23', 2),
(247, '湯料豐富納豆湯', '/uploads/repicepro/1614400146.jpg', '', '山形縣的本土料理。加入滿滿切細的納豆，口味令人著迷的味噌湯。', '根莖類,豆類', '-', '日式', '湯羹類', '1', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>251</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>17.2</td>\r\n			<th>脂肪(g)</th>\r\n			<td>12.6</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>17.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>275</td>\r\n			<th>鐵(mg)</th>\r\n			<td>4.1</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>8</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.09</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.35</td>\r\n			<th>維生素C(mg)</th>\r\n			<td>2</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>0</td>\r\n		</tr>\r\n		<tr>\r\n			<th>膳食纖維(g)</th>\r\n			<td>7.9</td>\r\n			<th>鹽分(g)</th>\r\n			<td>2.4</td>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>80</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 15, 0, 0, '', '2021-02-27 12:29:06', 7, '2021-05-14 21:11:29', 2),
(248, '日本生薑與茄子味噌湯', '/uploads/repicepro/1615279227.jpg', '', '使用夏日特有食材的味噌湯。 由日本生薑清爽的香氣與清淡的風味 所醞釀出的口感。', '瓜果類', '-', '日式', '湯羹類', '1', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>47</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>2.1</td>\r\n			<th>脂肪(g)</th>\r\n			<td>2.2</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>4.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>20</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.6</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>3</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.03</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.03</td>\r\n			<th>維生素C(mg)</th>\r\n			<td>2</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>膳食纖維(g)</th>\r\n			<td>1.5</td>\r\n			<th>鹽分(g)</th>\r\n			<td>1.7</td>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>45</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 24, 0, 0, '', '2021-03-09 16:40:27', 7, '2021-05-14 21:11:37', 2),
(249, '鮭魚與蔬菜石狩鍋', '/uploads/repicepro/1615871683.jpg', '', '能享用北海道當地料理「石狩鍋」的 味噌湯。 一道令人無法抗拒鮭魚和蔬菜鮮味的湯品。', '海鮮類', '-', '日式', '湯羹類', '1', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>133</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>8.3</td>\r\n			<th>脂肪(g)</th>\r\n			<td>3.5</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>17.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>28</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.8</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>150</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.12</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.09</td>\r\n			<th>維生素C(mg)</th>\r\n			<td>28</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>16</td>\r\n		</tr>\r\n		<tr>\r\n			<th>膳食纖維(g)</th>\r\n			<td>2.2</td>\r\n			<th>鹽分(g)</th>\r\n			<td>1.9</td>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>36</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 57, 0, 0, '', '2021-03-09 16:45:49', 7, '2021-05-14 21:11:45', 2),
(250, '水煮牛', '/uploads/repicepro/1620975928.jpg', '', '久煮辣味穩定延續', '牛肉', '１', '中式', '主菜', '8', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>上稿</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>上稿</td>\r\n			<th>脂肪(g)</th>\r\n			<td>上稿</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>上稿</td>\r\n			<th>鐵(mg)</th>\r\n			<td>上稿</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>上稿</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>上稿</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>上稿</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>上稿</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>上稿</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>上稿</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>上稿</td>\r\n			<th>鹽分(g)</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 7, 0, 1, '', '2021-05-14 14:37:51', 7, '2021-05-14 15:23:22', 7);

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
(5, 1, '蛤蜊', '240g', '', '', 0),
(5, 1, '綠蘆筍', '4根', '', '', 1),
(5, 1, '水', '3杯', '', '', 2),
(5, 2, '「ほんだし ®/烹大師®」昆布風味,鹽,醬油', '1.3小匙,1小匙,0.5小匙', ',,', '0,0,0', 0),
(5, 2, '蔥', '適量', '', '0', 1),
(5, 3, '將蛤蜊放入鹽水中吐沙，且仔細清洗外殼。剝除綠蘆筍根部1/3的皮，斜切成約5cm長，蔥切成蔥花狀。', '', '', '1', 0),
(5, 3, '將做法①的蛤蜊放入約3杯量的水後，開火煮至半熟時轉小火。再加入做法①的綠蘆筍和調味料Ⓐ，續煮至殻開為止。', '', '', '1', 1),
(5, 3, '盛盤後，加上做法①的蔥花即完成。', '', '', '1', 2),
(6, 1, '木棉豆腐', '300  g', '', '', 0),
(6, 1, '鳕魚', '200  g', '', '', 1),
(6, 1, '香菇', '8朵', '', '', 2),
(6, 1, '青蔥', '1根', '', '', 3),
(6, 1, '茼蒿菜', '100  g', '', '', 4),
(6, 1, '白菜', '200  g', '', '', 5),
(6, 2, '「ほんだし ®/烹大師®」昆布風味,醬油,柚子酢,高湯', '1小匙,3大匙,1小匙,3大匙', ',,,', '0,0,0,0', 0),
(6, 2, '「ほんだし ®/烹大師®」昆布風味,水,蔥花', '1大匙,3杯,少許', ',,', '0,0,0', 1),
(6, 3, '將調味料Ⓐ混合製成沾醬。', '', '', '1', 0),
(6, 3, '將豆腐切成塊狀，鳕魚切成一口大小，香菇去柄，青蔥斜切，去除茼蒿較硬的莖，先將調味料Ⓑ放入鍋中煮，後加入以上準備好的食材。', '', '', '1', 1),
(6, 3, '煮好的料理沾用做法①的醬汁即可食用。', '', '', '1', 2),
(8, 1, '牛蒡乾', '50g', '', '', 1),
(8, 1, '雞', '半隻', '', '', 2),
(8, 1, '當歸', '1片', '', '', 3),
(8, 1, '枸杞', '8g', '', '', 4),
(8, 1, '薑', '30g', '', '', 5),
(8, 1, '水', '1500c.c.', '', '', 6),
(8, 2, '「ほんだし ®/烹大師®」干貝風味,「ほんだし ®/烹大師®」昆布風味', '2大匙,1大匙', ',', '0,0', 1),
(8, 2, '紹興酒', '3大匙', '', '0', 2),
(8, 3, '雞肉剁塊，先以沸水汆燙過，再漂洗乾淨。牛蒡乾、當歸、枸杞洗淨備用。', '', '', '1', 0),
(8, 3, '將所有材料放入燉盅内，加入1500c.c.的水及紹興酒，放入蒸鍋内大火蒸一小時，再加入調味料Ⓐ拌勻即可。', '', '', '1', 1),
(10, 1, '豬肚', '400g', '', '', 0),
(10, 1, '榨菜', '150g', '', '', 1),
(10, 1, '芹菜', '100g', '', '', 2),
(10, 1, '蔥', '2根', '', '', 3),
(10, 1, '薑', '30g', '', '', 4),
(10, 1, '辣椒', '1根', '', '', 5),
(10, 2, '油', '1大匙', '', '0', 0),
(10, 2, '酒', '1大匙', '', '0', 1),
(10, 2, '「ほんだし ®/烹大師®」鰹魚風味,「ほんだし ®/烹大師®」昆布風味,醋,香油', '1/2大匙,1/2大匙,1/2大匙,1大匙', ',,,', '0,0,0,0', 2),
(10, 3, '豬肚煮熟後切絲，榨菜洗淨切絲，芹菜切段，蔥切段，薑切絲，辣椒切絲。', '', '', '1', 0),
(10, 3, '鍋内倒入1大匙油，先爆香蔥、薑、辣椒，再放入豬肚及榨菜、芹菜拌炒，熗入酒後，再加入調味料Ⓐ拌炒均勻即可。', '', '', '1', 1),
(9, 1, '朝天椒', '300g', '', '', 1),
(9, 1, '蒜頭酥', '150g', '', '', 2),
(9, 1, '紅蔥頭酥', '150g', '', '', 3),
(9, 1, '蝦米', '100g', '', '', 4),
(9, 1, '珠貝', '300g', '', '', 5),
(9, 1, '馬友鹹魚', '150g', '', '', 6),
(9, 1, '扁魚乾', '50g', '', '', 7),
(9, 1, '金華火腿', '150g', '', '', 8),
(9, 2, '「ほんだし ®/烹大師®」鰹魚風味', '1大匙', '', '0', 1),
(9, 2, '糖', '150', '', '0', 2),
(9, 2, '「ほんだし ®/烹大師®」干貝風味', '1大匙', '', '0', 3),
(9, 2, '花生油', '500c.c.', '', '0', 4),
(9, 2, '香油', '150c.c.', '', '0', 5),
(9, 2, '醬油', '3大匙', '', '0', 6),
(9, 3, '珠貝洗淨，用水泡軟，其它材料全部切細碎。', '', '', '1', 0),
(9, 3, '内倒入花生油500c.c.、香油150c.c.小火慢慢加熱至100 ℃，再依序放入朝天椒、蝦米、扁魚乾、馬友鹹魚、金華火腿、蒜頭酥、 紅蔥頭酥，慢火——炒香。', '', '', '1', 1),
(9, 3, '再加入糖150g、醬油3大匙、「ほんだし ®/烹大師®」 鰹魚風味1大匙、「ほんだし ®/烹大師®」干貝風味1大匙炒均勻融合即可。', '', '', '1', 2),
(11, 1, '里肌肉', '160g', '', '', 1),
(11, 1, '荸薺', '80g', '', '', 2),
(11, 1, '新鮮金針', '80g', '', '', 3),
(11, 1, '木耳', '120g', '', '', 4),
(11, 1, '蕃茄', '120g', '', '', 5),
(11, 1, '罐頭鳳梨', '80g', '', '', 6),
(11, 1, '嫩薑', '20g', '', '', 7),
(11, 2, '「ほんだし ®/烹大師®」昆布風味', '1大匙', '', '0', 1),
(11, 2, '米酒', '1大匙', '', '0', 2),
(11, 2, '香油', '1/2大匙', '', '0', 3),
(11, 3, '里肌肉切片，荸薺切片，木耳切片，蕃茄切片，嫩薑切末。', '', '', '1', 0),
(11, 3, '鍋内倒入1大匙油、先爆香薑末及里肌肉，熗入米酒後，加入少許水及荸薺、新鮮金針、木耳、蕃茄、鳳梨片拌炒至湯汁快收乾時，放入「ほんだし ®/烹大師®」昆布風味 1大匙及香油炒勻即可。', '', '', '1', 1),
(14, 1, '蘆筍', '300g ', '', '', 0),
(14, 1, '乾腐皮', '80g ', '', '', 1),
(14, 1, '紅蘿蔔', '50g', '', '', 2),
(14, 1, '蘑菇', '150g', '', '', 3),
(14, 1, '薑', '30g', '', '', 4),
(14, 1, '水', '150c.c.', '', '', 5),
(14, 2, '「ほんだし ®/烹大師®」昆布風味', '1大匙', '', '0', 0),
(14, 2, '香油', '1小匙', '', '0', 1),
(14, 3, '蘆筍刨除粗皮切斜段、乾腐皮略為泡軟，紅蘿蔔切片狀，蘑菇對切半，薑切片。', '', '', '1', 0),
(14, 3, '鍋内倒入1大匙油，先爆香薑片，再放入蘆筍、紅蘿蔔、腐皮、蘑菇拌炒勻後，加入150c.c.的水煮至湯汁微乾前，加入「ほんだし ®/烹大師®」昆布風味1大匙拌炒勻，淋入香油即可。', '', '', '1', 1),
(15, 1, '雞腿肉', '400g', '', '', 0),
(15, 1, '香菇', '20g', '', '', 1),
(15, 1, '火腿肉', '150g', '', '', 2),
(15, 1, '冬瓜', '500g', '', '', 3),
(15, 1, '薑', '30g', '', '', 4),
(15, 1, '香菜', '少許', '', '', 5),
(15, 1, '水', '1500c.c.', '', '', 6),
(15, 2, '「ほんだし ®/烹大師®」干貝風味', '2大匙', '', '0', 0),
(15, 2, '胡椒粉', '1/2小匙', '', '0', 1),
(15, 3, '雞腿肉切丁塊，香菇泡軟後對切，火腿肉洗淨切丁塊，冬瓜切塊，薑切片。', '', '', '1', 0),
(15, 3, '雞腿肉與火腿先放入沸水中汆燙過，再以清水洗淨。', '', '', '1', 1),
(15, 3, '將雞腿肉、香菇、火腿、冬瓜、薑片放入燉盅内，加入1500c.c.的水，大火蒸1小時，再放入「ほんだし ®/烹大師®」干貝風味2大匙、胡椒粉1/2小匙及香菜拌勻即可。', '', '', '1', 2),
(18, 1, '草蝦仁', '240g', '', '', 0),
(18, 1, '絞肉', '50g', '', '', 1),
(18, 1, '紅蘿蔔', '50g', '', '', 2),
(18, 1, '蔥', '1根', '', '', 3),
(18, 1, '嫩薑', '20g', '', '', 4),
(18, 1, '蛋白', '1顆', '', '', 5),
(18, 2, '「ほんだし ®/烹大師®」干貝風味', '2/3大匙', '', '0', 0),
(18, 2, '米酒', '1大匙', '', '0', 1),
(18, 2, '胡椒粉', '1/2小匙', '', '0', 2),
(18, 2, '香油', '1小匙', '', '0', 3),
(18, 2, '太白粉', '1大匙', '', '0', 4),
(18, 3, ' 將草蝦仁、絞肉、紅蘿蔔、蔥、薑、蛋白、「ほんだし ®/烹大師®」干貝風味等所有調味料，全部放入食物處理機内攪打成泥狀。', '', '', '1', 0),
(18, 3, '瓷湯匙上先抹上少許油，再把拌好的蝦漿填在湯匙上，放入蒸鍋内，小火蒸8分鐘即可。', '', '', '1', 1),
(19, 1, '火龍果', '150  g', '', '', 0),
(19, 1, '圓鱈魚', '300  g', '', '', 1),
(19, 1, '紅甜椒', '50  g', '', '', 2),
(19, 1, '黃甜椒', '50  g', '', '', 3),
(19, 1, '韭黃', '100g', '', '', 4),
(19, 1, '蒜頭', '1瓣', '', '', 5),
(19, 1, '嫩薑', '30  g', '', '', 6),
(19, 2, '「ほんだし ®/烹大師®」鰹魚風味,胡椒粉,紹興酒,蛋白,香油,太白粉', '1大匙,1/2小匙,1小匙 ,1/2顆,1小匙,1大匙', ',,,,,', '0,0,0,0,0,0', 0),
(19, 2, '「ほんだし ®/烹大師®」鰹魚風味', '1大匙', '', '0', 1),
(19, 2, '紹興酒', '1大匙', '', '0', 2),
(19, 2, '香油', '1小匙', '', '0', 3),
(19, 3, '火龍果切片，圖鱈魚切片、並用調味料Ⓐ抓醃過，紅、黃甜椒切片，韭黃切段狀，蒜頭及薑切片狀。', '', '', '1', 0),
(19, 3, '先將抓醃好的圓鱈魚過油備用。', '', '', '1', 1),
(19, 3, '鍋内倒入1大匙油，先爆香蒜片、薑片，再放入紅、黄甜椒、韭黃、圖鱈魚、火龍果等，拌炒均勻。熗入紹興酒、「ほんだし ®/烹大師®」鰹魚風味拌勻，再滴入香油即可。', '', '', '1', 2),
(20, 1, '胭脂紅蝦仁', '200g ', '', '', 0),
(20, 1, '牛蕃茄', '4顆(約600g) ', '', '', 1),
(20, 1, '洋蔥', '1/2顆 ', '', '', 2),
(20, 1, '香菜', '30g', '', '', 3),
(20, 1, '水', '600c.c.', '', '', 4),
(20, 2, '「ほんだし ®/烹大師®」鰹魚風味', '2大匙', '', '0', 0),
(20, 2, '麵粉', '20  g', '', '0', 1),
(20, 2, '胡椒粉', '1小匙', '', '0', 2),
(20, 3, '牛蕃茄去皮去籽後，攪碎成泥狀，洋蔥切碎，香菜切碎。', '', '', '1', 0),
(20, 3, '鍋内倒入1大匙油，先炒香洋蔥，再炒香麵粉，熄火、 倒入600c.c.的冷水拌勻，再加入蕃茄泥拌勻再開火煮開。', '', '', '1', 1),
(20, 3, '放入胭脂紅蝦仁及「ほんだし ®/烹大師®」鰹魚風味、胡椒粉，蝦仁煮熟即可。', '', '', '1', 2),
(20, 3, '食用時再搭配少許香菜一起食用。', '', '', '1', 3),
(21, 1, '手工麵線', '400g', '', '', 0),
(21, 1, '豬肉', '50g', '', '', 1),
(21, 1, '竹筍', '50g', '', '', 2),
(21, 1, '韭黃', '80g', '', '', 3),
(21, 1, '蝦乾', '20g', '', '', 4),
(21, 1, '香菇', '20g', '', '', 5),
(21, 1, '扁魚乾', '1片', '', '', 6),
(21, 1, '蔥', '2根', '', '', 7),
(21, 1, '油蔥酥', '3大匙', '', '', 8),
(21, 2, '「ほんだし ®/烹大師®」鰹魚風味', '1大匙', '', '0', 0),
(21, 2, '高湯', '300c.c.', '', '0', 1),
(21, 2, '醬油', '2大匙', '', '0', 2),
(21, 2, '糖', '1大匙', '', '0', 3),
(21, 2, '胡椒粉', '1小匙', '', '0', 4),
(21, 2, '香油', '少許', '', '0', 5),
(21, 3, '麵線先剪短，然後入油鍋炸至表面酥黃，撈起後入滾水汆燙備用。', '', '', '1', 0),
(21, 3, '豬肉、竹筍、 扁魚乾切絲，韭黃 、蔥切小段，蝦乾、香菇泡軟切絲備用。', '', '', '1', 1),
(21, 3, '起油鍋用2大匙油爆香蝦乾、香菇、扁魚乾、豬肉絲，接著放入竹筍炒勻再倒入高湯，與「ほんだし ®/烹大師®」鰹魚風味1大匙、醬油、糖、胡椒粉、油蔥酥調味後，放入蔥段、韭黃拌炒，大火煮開放入麵線及香油拌勻即', '', '', '1', 2),
(22, 1, '新鮮香菇', '4朶', '', '', 0),
(22, 1, '鮮蚵仔', '200g', '', '', 1),
(22, 1, '韭黃', '50g', '', '', 2),
(22, 1, '芹菜', '50g', '', '', 3),
(22, 1, '蛋', '1顆', '', '', 4),
(22, 2, '「ほんだし ®/烹大師®」鰹魚風味,胡椒粉,麵粉', '1/2大匙,1/2大匙,3大匙', ',,', '0,0,0', 0),
(22, 2, '「ほんだし ®/烹大師®」昆布風味,七味辣椒粉', '1大匙,1大匙', ',', '0,0', 1),
(22, 3, '新鮮香菇去蒂，鮮蚵洗淨，韭黃及芹菜切末。', '', '', '1', 0),
(22, 3, '鮮蚵與韭黃、芹菜、蛋、和調味料Ⓐ拌勻。', '', '', '1', 1),
(22, 3, '酥炸粉與等量的水拌勻備用。另以調味料Ⓑ拌勻當沾料。', '', '', '1', 2),
(22, 3, '新鮮菇内面先灑上太白粉，放上拌好的鮮蚵，淋上調好的酥炸粉，再放入油鍋内炸熟。食用時再搭配沾料一起食用。', '', '', '1', 3),
(23, 1, '菲力', '250  g', '', '', 0),
(23, 1, '蘆筍', '2支', '', '', 1),
(23, 1, '南瓜', '50  g', '', '', 2),
(23, 1, '洋蔥片', '60  g', '', '', 3),
(23, 1, '紅甜椒片', '50g', '', '', 4),
(23, 1, '柳松菇', '50g', '', '', 5),
(23, 1, '柳丁', '2顆', '', '', 6),
(23, 1, '柳橙汁', '200c.c.', '', '', 7),
(23, 1, '蒜末', '少許', '', '', 8),
(23, 1, '乾辣椒', '少許', '', '', 9),
(23, 2, '「ほんだし ®/烹大師®」干貝風味', '2小匙', '', '0', 0),
(23, 2, '白醋', '2小匙', '', '0', 1),
(23, 2, '糖', '1/2小匙', '', '0', 2),
(23, 2, '鹽', '1/2小匙', '', '0', 3),
(23, 2, '太白粉勾芡', '1小匙', '', '0', 4),
(23, 3, '菲力切小塊，蘆筍切段、南瓜切片。', '', '', '1', 0),
(23, 3, '將做法①及洋蔥片、紅甜椒片、柳松菇大火拌炒，加「ほんだし ®/烹大師®」干貝風味1小匙，煎香起鍋。', '', '', '1', 1),
(23, 3, '爆香乾辣椒、蒜末。', '', '', '1', 2),
(23, 3, '將柳丁去皮，切小塊，加入市售柳橙200c.c.、「ほんだし ®/烹大師®」干貝風味1小匙、白醋、糖、鹽，以中火熬煮約2~3分鐘，起鍋前淋上太白粉勾芡成芡汁。', '', '', '1', 3),
(23, 3, '以做法③熱鍋，將做法①與②的材料放入鍋中稍稍拌炒，再與做法④快速拌炒均勻即可。', '', '', '1', 4),
(24, 1, '帶殼白蝦', '900g', '', '', 1),
(24, 1, '蛤蜊', '250g', '', '', 2),
(24, 1, '蕃茄', '2顆', '', '', 3),
(24, 1, '蘆筍', '4支', '', '', 4),
(24, 1, '板油', '40g', '', '', 5),
(24, 1, '蛋白', '半顆', '', '', 6),
(24, 1, '薑末', '少許', '', '', 7),
(24, 1, '太白粉', '1大匙', '', '', 8),
(24, 1, '水', '1200c.c.', '', '', 9),
(24, 2, '「ほんだし ®/烹大師®」干貝風味', '3小匙', '', '0', 1),
(24, 2, '鹽', '1小匙', '', '0', 2),
(24, 3, '白蝦去殼取沙腸、拍成泥狀。與薑末、蛋白、板油、太白粉、「ほんだし ®/烹大師®」干貝風味1小匙，攪拌均勻成蝦泥。反覆甩打至有黏性即可。', '', '', '1', 0),
(24, 3, '蕃茄去皮切1/4小塊放入鍋中，待湯滾將蝦泥做成小丸子、放入湯鍋中，待蝦丸浮起放入蘆筍、蛤蜊與「ほんだし ®/烹大師®」干貝風味2小匙、鹽即可。', '', '', '1', 1),
(25, 1, '蛋豆腐', '1盒', '', '', 0),
(25, 1, '小黃瓜絲', '30g', '', '', 1),
(25, 1, '木耳絲', '20g', '', '', 2),
(25, 1, '素火腿絲', '30g', '', '', 3),
(25, 1, '小豆苗', '20g', '', '', 4),
(25, 1, '菠菜', '80g', '', '', 5),
(25, 1, '豆酥', '50g', '', '', 6),
(25, 2, '「ほんだし ®/烹大師®」昆布風味', '2小匙', '', '0', 0),
(25, 3, '豆腐切塊放盤中、小黃瓜絲、木耳絲、素火腿絲、小豆苗汆燙置於豆腐上。', '', '', '1', 0),
(25, 3, '菠菜切末、置油鍋中小火慢煮5~10分鐘後，加入「ほんだし ®/烹大師®」昆布風味1小匙增加風味，即成綠醬。', '', '', '1', 1),
(25, 3, '豆酥放入「ほんだし ®/烹大師®」昆布風味1小匙炒酥。', '', '', '1', 2),
(25, 3, ' 將做法②及做法③放置豆腐四周即可。', '', '', '1', 3),
(26, 1, '紅蘿蔔', '半條', '', '', 1),
(26, 1, '板豆腐 ', '半板', '', '', 2),
(26, 1, '高麗菜', '2張', '', '', 3),
(26, 1, '洋菇', ' 8顆', '', '', 4),
(26, 1, '素火腿', ' 50g', '', '', 5),
(26, 1, '生香菇', '3朵', '', '', 6),
(26, 1, '柳松菇', '30g', '', '', 7),
(26, 1, '香菜', '少許', '', '', 8),
(26, 1, '太白粉', '少許', '', '', 9),
(26, 2, '「ほんだし ®/烹大師®」昆布風味,素咖哩粉', ' 1小匙,少許', ',', '0,0', 1),
(26, 2, '「ほんだし ®/烹大師®」昆布風味,鹽,糖,太白粉 ', '1小匙,1/2小匙,1/2小匙,適量', ',,,', '0,0,0,0', 2),
(26, 3, '將紅蘿蔔刮成膏狀，放入炒鍋以沙拉油小火炒20~30分鐘成素蟹黃，拌入調味料Ⓐ，即成 「ほんだし ®/烹大師®」素蟹黃。', '', '', '1', 0),
(26, 3, '將香菇去蒂、香菜、柳松菇、洋菇、素火腿切成小丁。', '', '', '1', 1),
(26, 3, '將板豆腐過篩，篩過的豆腐與做法②混合攪拌，加入調味料Ⓑ製成餡料。', '', '', '1', 2),
(26, 3, '汆燙後的高麗菜葉取出泡冷水後鋪平，把做法③的餡料捲進菜葉中。放入鍋中蒸5分鐘，淋上做法① 即可。', '', '', '1', 3),
(27, 1, '洋蔥末,蔥白,蒜末,薑末,泡過水的乾辣椒末,豆瓣醬', '80g,50g,1大匙,1大匙,40g,1碗', '', '', 1),
(27, 1, '雞腿', '2隻', '', '', 2),
(27, 1, '杏鮑菇', '1朵', '', '', 3),
(27, 1, '四季豆', '5支', '', '', 4),
(27, 1, '啤酒', '350c.c.', '', '', 5),
(27, 2, '「ほんだし ®/烹大師®」鰹魚風味', '1小匙', '', '0', 0),
(27, 2, '沙拉油', '2碗', '', '0', 1),
(27, 2, '「ほんだし ®/烹大師®」鰹魚風味,糖,鹽,太白粉', '1小匙,1小匙,少許,少許', ',,,', '0,0,0,0', 2),
(27, 3, '用沙拉油將材料Ⓐ小火慢炒，至醬汁收油、水分略乾變紅色即可。', '', '', '1', 0),
(27, 3, '將杏鮑菇切塊狀、四季豆斜切備用。', '', '', '1', 1),
(27, 3, '雞腿切塊、加入調味料Ⓐ 拌勻醃2小時，下油鍋油煎至酥香。 ', '', '', '1', 2),
(27, 3, '將做法① 下鍋大火拌炒加入做法②、做法③ 及「ほんだし ®/烹大師®」鰹魚風味1小匙，加入300c.c.的啤酒，待湯汁　收乾。待起鍋前在加入50c.c.的啤酒拌炒過後即可。', '', '', '1', 3),
(28, 1, '去骨鱈魚', '300g', '', '', 1),
(28, 1, '海蝦', '80g', '', '', 2),
(28, 1, '大白菜心', '4顆', '', '', 3),
(28, 1, '菠菜', '4束', '', '', 4),
(28, 1, '蛋白', '4顆', '', '', 5),
(28, 1, '薑片', '少許', '', '', 6),
(28, 1, '水', '1500c.c.', '', '', 7),
(28, 2, '「ほんだし ®/烹大師®」鰹魚風味', '3小匙', '', '0', 1),
(28, 2, '鹽', '1小匙', '', '0', 2),
(28, 2, '太白粉水', '少許', '', '0', 3),
(28, 2, '胡椒粉', '少許', '', '0', 4),
(28, 2, '香油 ', '少許', '', '0', 5),
(28, 3, '將汆燙過的鱈魚、處理過的海蝦拌入「ほんだし ®/烹大師®」鰹魚風味1小匙、鹽少許、太白粉少許。菠菜切末，備用。', '', '', '1', 0),
(28, 3, '爆香薑片後、放入大白菜心大火快炒1分鐘後撈起。', '', '', '1', 1),
(28, 3, '1500c.c.水煮滾後、加入做法① 、② 的材料、及「ほんだし ®/烹大師®」鰹魚風味2小匙、鹽少許，待湯第二次沸騰再加入太白粉水勾芡。慢慢加上蛋白、菠菜輕攪散佈至湯面，灑上胡椒粉、滴上香油即可。', '', '', '1', 2),
(29, 1, '鯛魚', '1條', '', '', 0),
(29, 1, '水煮蛋', '1顆', '', '', 1),
(29, 1, '小黃瓜', '2條', '', '', 2),
(29, 1, '百香果', '4顆', '', '', 3),
(29, 1, '洋蔥末', '1小匙', '', '', 4),
(29, 1, '吉士粉', '1小匙', '', '', 5),
(29, 1, '麵粉', '60g', '', '', 6),
(29, 2, '「ほんだし ®/烹大師®」鰹魚風味', '2小匙', '', '0', 0),
(29, 2, '胡椒粉', '少許', '', '0', 1),
(29, 2, '糖', '40g', '', '0', 2),
(29, 2, '糖', '少許', '', '0', 3),
(29, 2, '鹽', '少許', '', '0', 4),
(29, 2, '美乃滋', '1大匙', '', '0', 5),
(29, 2, '醃料：,糖,麵粉', ',40  g,60  g', ',,', '0,0,0', 6),
(29, 3, '鯛魚肉抹「ほんだし ®/烹大師®」鰹魚風味1小匙、胡椒粉醃入味，先蒸熟再放入燻鍋中、用糖與麵粉當燻料，燻上色放涼。', '', '', '1', 0),
(29, 3, '將水煮蛋切碎、與洋蔥末、糖、鹽、美乃滋拌成塔塔醬。', '', '', '1', 1),
(29, 3, '小黃瓜除去外皮，將瓜肉片成薄片，5公分切段。', '', '', '1', 2),
(29, 3, '將百香果果肉取出，過篩取果汁。將百香果汁與吉士粉小火煮勻後，加入 「ほんだし ®/烹大師®」鰹魚風味1小匙即可。', '', '', '1', 3),
(29, 3, '小黃瓜片攤開，包入燻魚肉、塔塔醬捲成圓柱狀，淋上做法④即可。', '', '', '1', 4),
(30, 1, '去骨雞腿', '1支', '', '', 0),
(30, 1, '熟馬鈴薯', '1/2顆', '', '', 1),
(30, 1, '四季豆', '5支', '', '', 2),
(30, 1, '生香菇', '4朵', '', '', 3),
(30, 1, '蕃茄', '1顆', '', '', 4),
(30, 1, '紅洋蔥', '1/8顆', '', '', 5),
(30, 1, '無鹽奶油', '半塊', '', '', 6),
(30, 1, '牛奶', '400c.c.', '', '', 7),
(30, 1, '麵粉', '少許', '', '', 8),
(30, 2, '「ほんだし ®/烹大師®」干貝風味', '2小匙', '', '0', 0),
(30, 2, '鹽', '1小匙', '', '0', 1),
(30, 2, '胡椒粉', '少許', '', '0', 2),
(30, 3, '雞腿抹鹽、胡椒粉醃入味；放入有奶油的平底鍋中煎香，灑上「ほんだし ®/烹大師®」干貝風味1小匙。', '', '', '1', 0),
(30, 3, '馬鈴薯與紅洋蔥切片、四季豆切段、生香菇去蒂切片、蕃茄切塊，放入鍋中煎熟。', '', '', '1', 1),
(30, 3, ' 奶油與麵粉炒勻，加入鮮奶、「ほんだし ®/烹大師®」干貝風味1小匙煮成醬汁淋在做法①及做法②即可。', '', '', '1', 2),
(31, 1, '冬瓜', '300g', '', '', 0),
(31, 1, '去骨烤鴨肉', '100g', '', '', 1),
(31, 1, '生香菇', '2朵', '', '', 2),
(31, 1, '脆筍', '80g', '', '', 3),
(31, 1, '蔥', '1支', '', '', 4),
(31, 1, '薑', '1塊', '', '', 5),
(31, 1, '香菜', '少許', '', '', 6),
(31, 1, '水', '800c.c.', '', '', 7),
(31, 2, '「ほんだし ®/烹大師®」鰹魚風味', '1/2小匙', '', '0', 0),
(31, 2, '鹽', '1/4小匙', '', '0', 1),
(31, 3, '將冬瓜、去骨烤鴨肉、脆筍、薑等切成片狀。', '', '', '1', 0),
(31, 3, '生香菇去蒂、背面雕花備用。', '', '', '1', 1),
(31, 3, '蔥切段、用油爆香蔥段後，加入一碗水煮出蔥味做湯底後，撈出蔥渣。', '', '', '1', 2),
(31, 3, '做法③加入冬瓜片、香菇、脆筍片、薑片後加入800c.c.的水，待湯沸騰後加入調味料Ⓐ。', '', '', '1', 3),
(31, 3, '上桌前加入鴨肉與香菜即可。', '', '', '1', 4),
(32, 1, '百合', '50g', '', '', 1),
(32, 1, '蘆筍', '3支', '', '', 2),
(32, 1, '冬瓜', '半斤', '', '', 3),
(32, 1, '生香菇', '2朵', '', '', 4),
(32, 1, '薑絲', '少許', '', '', 5),
(32, 1, '紅棗', '6顆', '', '', 6),
(32, 1, '水', '1000c.c.', '', '', 7),
(32, 2, '「ほんだし ®/烹大師®」昆布風味', '1/2小匙', '', '0', 1),
(32, 2, '鹽', '1/4小匙', '', '0', 2),
(32, 2, '香油', '少許', '', '0', 3),
(32, 2, '胡椒粉', '少許', '', '0', 4),
(32, 3, '百合切除蒂頭，逐一剝下洗淨備用；蘆筍除硬皮、生香菇去蒂背面雕花。', '', '', '1', 0),
(32, 3, '冬瓜切片；紅棗泡水備用。', '', '', '1', 1),
(32, 3, '用油爆香薑絲後，放入1，000c.c.的水煮沸。', '', '', '1', 2),
(32, 3, '放入做法①、②等食材，待水再次沸騰時加入「ほんだし ®/烹大師®」昆布風味，灑上鹽並撒上少許胡椒粉、香油即可。', '', '', '1', 3),
(33, 1, '淡菜', '4個', '', '', 0),
(33, 1, '草蝦', '4隻', '', '', 1),
(33, 1, '花枝', '100g', '', '', 2),
(33, 1, '茄子', '半條', '', '', 3),
(33, 1, '南瓜', '80g', '', '', 4),
(33, 1, '花椰菜', '1小朵', '', '', 5),
(33, 1, '吉士粉', '少許', '', '', 6),
(33, 1, '太白粉', '少許', '', '', 7),
(33, 2, '「ほんだし ®/烹大師®」鰹魚風味', '1/4小匙', '', '0', 0),
(33, 2, '泰式紅咖哩粉', '1大匙', '', '0', 1),
(33, 3, '淡菜肉摘毛邊洗淨、汆燙後瀝乾；草蝦剖背去泥腸抹上少許太白粉，起油鍋將草蝦煎出香味備用。', '', '', '1', 0),
(33, 3, '花枝切段斜切雕花、花椰菜切小朵汆燙備用。', '', '', '1', 1),
(33, 3, '南瓜切片、茄子斜切片，兩者沾吉士粉炸至金黃。', '', '', '1', 2),
(33, 3, '熱油鍋爆香加入半碗水與咖哩粉，續再加入做法①、②等燒煮，最後灑上「ほんだし ®/烹大師®」鰹魚風味，待收汁前加入做法③拌勻即可。', '', '', '1', 3),
(39, 1, '土魠魚', '225g', '', '', 0),
(39, 1, '竹筍', '少許', '', '', 1),
(39, 1, '紅蘿蔔', '少許', '', '', 2),
(39, 1, '香菜', '少許', '', '', 3),
(39, 1, '蒜頭酥', '1小匙', '', '', 4),
(39, 1, '水', '1500c.c.', '', '', 5),
(39, 2, '「ほんだし ®/烹大師®」干貝風味,鹽,糖,白胡椒,太白粉水', '3小匙,1小匙,1小匙,少許,適量', ',,,,', '0,0,0,0,0', 0),
(39, 2, '醃料：,鹽,地瓜粉', ',少許,少許', ',,', '0,0,0', 1),
(39, 3, '土魠魚切塊、與鹽、地瓜粉拌勻，放入油鍋中炸至金黃備用。', '', '', '1', 0),
(39, 3, '將紅蘿蔔、竹筍切絲備用。', '', '', '1', 1),
(39, 3, '1500c.c.水沸騰後，加入紅蘿蔔絲、筍絲、蒜頭酥等，再加入調味料Ⓐ，勾薄芡。', '', '', '1', 2),
(39, 3, '上桌前，加上土魠魚及香菜即可。', '', '', '1', 3),
(38, 1, '絞肉', '600g', '', '', 1),
(38, 1, '韭黃', '150g', '', '', 2),
(38, 1, '蔥花', '1大匙', '', '', 3),
(38, 1, '薑末', '2小匙', '', '', 4),
(38, 1, '水', '100c.c.', '', '', 5),
(38, 2, '「ほんだし ®/烹大師®」干貝風味', '3小匙', '', '0', 1),
(38, 2, '鹽', '2小匙', '', '0', 2),
(38, 2, '白胡椒', '1/2小匙', '', '0', 3),
(38, 2, '香油', '50c.c.', '', '0', 4),
(38, 3, '買回來的絞肉，用菜刀剁一剁增加口感。', '', '', '1', 0),
(38, 3, '將韭黃切末，與其他食材一起攪拌。用力拌勻、甩打餡料約20分鐘，使其更富黏性。', '', '', '1', 1),
(38, 3, '將備好的餡料，放入冷藏保存一晚，隔天即可使用。', '', '', '1', 2),
(40, 1, '韭黃', '15g', '', '', 0),
(40, 1, '筍絲 ', '37.5g ', '', '', 1),
(40, 1, '肉絲', '75g', '', '', 2),
(40, 1, '木耳絲', '少許', '', '', 3),
(40, 1, '紅蘿蔔絲', '少許', '', '', 4),
(40, 1, '蔥段', '少許', '', '', 5),
(40, 1, '紅辣椒', '少許', '', '', 6),
(40, 2, '醃料：,「ほんだし ®/烹大師®」干貝風味,太白粉,水,沙拉油', ',1/2小匙,少許, 50c.c., 1大匙', ',,,,', '0,0,0,0,0', 0),
(40, 2, '「ほんだし ®/烹大師®」干貝風味,糖,白胡椒,酒', '1小匙,1/2小匙,1/2小匙,1小匙', ',,,', '0,0,0,0', 1),
(40, 2, '芡汁', '適量', '', '0', 2),
(40, 2, '香油', ' 1小匙', '', '0', 3),
(40, 3, '韭黃切段、 肉絲用調味料Ⓐ拌勻略醃。 ', '', '', '1', 0),
(40, 3, '爆香蔥段、辣椒、肉絲， 依序加入木耳絲、筍絲、紅蘿蔔絲。 再加入調味料Ⓑ', '', '', '1', 1),
(40, 3, '最後加入韭黃一起大火快炒， 勾芡、淋上香油即可。 ', '', '', '1', 2),
(41, 1, '竹筍', '1支 ', '', '', 0),
(41, 1, '蛤蜊', '300g', '', '', 1),
(41, 1, '小白菜', '1顆 ', '', '', 2),
(41, 1, '水', '1500c.c.', '', '', 3),
(41, 2, '「ほんだし ®/烹大師®」干貝風味', '1小匙', '', '0', 0),
(41, 2, '鹽', '1/2小匙', '', '0', 1),
(41, 2, '酒', '1大匙', '', '0', 2),
(41, 3, '竹筍切塊、小白菜洗淨切段備用。              ', '', '', '1', 0),
(41, 3, '蛤蜊吐沙，備用。              ', '', '', '1', 1),
(41, 3, '將竹筍放入1，500c.c.的湯鍋中，小火煮約20分鐘。  ', '', '', '1', 2),
(41, 3, '放入蛤蜊，待蛤蜊打開後，加入小白菜、「ほんだし ®/烹大師®」干貝風味及鹽、酒等即可。 ', '', '', '1', 3),
(42, 1, '乾燥香菇', '10朵 ', '', '', 0),
(42, 1, '雞腿', '1隻 ', '', '', 1),
(42, 1, '蔥白', '少許', '', '', 2),
(42, 1, '薑片', '3片 ', '', '', 3),
(42, 1, '水', '1500c.c.', '', '', 4),
(42, 2, '「ほんだし ®/烹大師®」干貝風味', '1小匙', '', '0', 0),
(42, 2, '鹽', '1小匙', '', '0', 1),
(42, 2, '酒', '1大匙', '', '0', 2),
(42, 3, '雞肉汆燙去血水，切塊。     ', '', '', '1', 0),
(42, 3, '將香菇浸泡水中，備用。     ', '', '', '1', 1),
(42, 3, '將1500c.c.水、雞腿、薑片放入鍋中，小火慢煮。     ', '', '', '1', 2),
(42, 3, '待再次沸騰時，加入香菇、蔥白，及「ほんだし ®/烹大師®」干貝風味及其他調味料。熬煮20分鐘即可。 ', '', '', '1', 3),
(47, 1, '肉羹,香菇絲, 筍絲,木耳絲,紅蘿蔔絲', '300g,1大匙 ,75g,37g,37g', '', '', 0),
(47, 1, '雞蛋', '1顆', '', '', 1),
(47, 1, '香菜', '少許', '', '', 2),
(47, 1, '水', '1500c.c.', '', '', 3),
(47, 2, '「ほんだし ®/烹大師®」鰹魚風味,糖,白胡椒粉', '3小匙,2小匙,1/4小匙', ',,', '0,0,0', 0),
(47, 2, '太白粉水', '少許', '', '0', 1),
(47, 3, '雞蛋打成蛋汁，備用。  ', '', '', '1', 0),
(47, 3, '等水沸騰後，加入材料Ⓐ。再加入調味料Ⓐ，小火慢煮。  ', '', '', '1', 1),
(47, 3, '勾薄芡、加入做法①、香菜即可。  ', '', '', '1', 2),
(46, 1, '滷包,豬油,蒜仁,水', '2包,2碗,5粒,1500c.c.', '', '', 1),
(46, 1, '牛肚,水煮蛋,豆乾,黑豆乾', '300g,8顆,112  g,112g', '', '', 2),
(46, 1, '水煮花生', '1碗', '', '', 3),
(46, 1, '海帶', '75g', '', '', 4),
(46, 1, '花干', '150g', '', '', 5),
(46, 2, '「ほんだし ®/烹大師®」鰹魚風味', ' 1大匙', '', '0', 1),
(46, 2, '醬油', '100c.c.', '', '0', 2),
(46, 2, '糖', '1/2大匙', '', '0', 3),
(46, 2, '鹽', '1/2大匙', '', '0', 4),
(46, 3, '將材料Ⓐ、醬油、糖、鹽以小火熬煮2小時。增加香味呈現，最後加上「ほんだし ®/烹大師®」鰹魚風味。', '', '', '1', 0),
(46, 3, '先將材料Ⓑ，放入做法①的鍋中，熬煮2小時。', '', '', '1', 1),
(46, 3, '再取另乾淨湯鍋，倒入少許滷汁，放入花生、海帶、以小火滷5分鐘，熄火讓海帶悶熟即可。花生需悶較久的時間。', '', '', '1', 2),
(46, 3, '花干需放入更清淡的滷汁中，小火滷約半小時即可。', '', '', '1', 3),
(48, 1, '肉絲 ', '75  g', '', '', 0),
(48, 1, '蝦仁', '8隻', '', '', 1),
(48, 1, '透抽', '150g', '', '', 2),
(48, 1, '蔥白', '少許', '', '', 3),
(48, 1, '紅蔥頭', '少許', '', '', 4),
(48, 1, '高麗菜絲', '300g', '', '', 5),
(48, 1, '紅蘿蔔絲', '少許', '', '', 6),
(48, 1, '木耳絲', '少許', '', '', 7),
(48, 1, '油麵', '300g', '', '', 8),
(48, 1, '水', '500c.c. ', '', '', 9),
(48, 2, '「ほんだし ®/烹大師®」鰹魚風味', '3小匙 ', '', '0', 0),
(48, 2, '糖', '1/2小匙 ', '', '0', 1),
(48, 2, '白胡椒粉', '1/4小匙 ', '', '0', 2),
(48, 2, '醬油', '1大匙 ', '', '0', 3),
(48, 3, '蝦仁剖背去沙腸、透抽切塊、背面雕花備用。 ', '', '', '1', 0),
(48, 3, '爆香蔥白、紅蔥頭、肉絲。 ', '', '', '1', 1),
(48, 3, '續放入高麗菜、紅蘿蔔絲、木耳絲、蝦仁、透抽、及100c.c.的水。加入「ほんだし ®/烹大師®」鰹魚風味1小匙及其他調味料拌勻、撈出。 ', '', '', '1', 2),
(48, 3, '將麵放入炒鍋中，加入400c.c.的水及「ほんだし ®/烹大師®」鰹魚風味2小匙一起快炒。 ', '', '', '1', 3),
(48, 3, '待麵軟後放入做法③炒勻即可。 ', '', '', '1', 4),
(49, 1, '蚵仔', '100  g', '', '', 0),
(49, 1, '紅麵線', '100  g', '', '', 1),
(49, 1, '大腸', '1條 ', '', '', 2),
(49, 1, '紅蘿蔔絲', '35  g', '', '', 3),
(49, 1, '木耳絲', '35  g', '', '', 4),
(49, 1, '蒜泥', '1小匙 ', '', '', 5),
(49, 1, '香菜', '適量', '', '', 6),
(49, 1, '水', '1000c.c.', '', '', 7),
(49, 2, '「ほんだし ®/烹大師®」鰹魚風味 ', ' 2小匙', '', '0', 0),
(49, 2, '柴魚粉', '1小碗', '', '0', 1),
(49, 2, '鹽', '1/2小匙', '', '0', 2),
(49, 2, '地瓜粉', '1/2杯', '', '0', 3),
(49, 2, '糖', '1/3小匙', '', '0', 4),
(49, 2, '香油', '1小匙', '', '0', 5),
(49, 2, '烏醋', '1小匙', '', '0', 6),
(49, 2, '胡椒粉', '適量', '', '0', 7),
(49, 2, '太白粉', '適量', '', '0', 8),
(49, 3, '將大腸洗淨先以酒、醬油、糖等滷一小時，切塊備用。 ', '', '', '1', 0),
(49, 3, '蚵仔洗淨、裹上地瓜粉以滾水燙約40~50秒。 ', '', '', '1', 1),
(49, 3, '紅麵線剪長段泡水略洗淨。 ', '', '', '1', 2),
(49, 3, '「ほんだし ®/烹大師®」鰹魚風味1小匙與柴魚片加1，000c.c.的水熬成高湯，撈除柴魚片。', '', '', '1', 3),
(49, 3, '在做法④中，放入紅蘿蔔絲、木耳絲與麵線略煮。', '', '', '1', 4),
(49, 3, '以「ほんだし ®/烹大師®」鰹魚風味1小匙調味，最後以太白粉勾芡至合適的稠度，放入蚵仔及大腸塊、香油。最後再依個人口味酌量加入蒜泥、烏醋、香菜即可。 ', '', '', '1', 5),
(55, 1, '白米', '1杯', '', '', 0),
(55, 1, '干貝', '8粒', '', '', 1),
(55, 1, '銀杏(白果)', '50g', '', '', 2),
(55, 1, '雞腿', '1支', '', '', 3),
(55, 1, '雞蛋', '1粒', '', '', 4),
(55, 1, '香菇', '2朵', '', '', 5),
(55, 1, '油條', '1條', '', '', 6),
(55, 1, '蔥', '1支', '', '', 7),
(55, 1, '香菜', '少許', '', '', 8),
(55, 2, '「ほんだし ®/烹大師®」干貝風味', '2小匙', '', '0', 0),
(55, 2, '鹽', '2小匙', '', '0', 1),
(55, 2, '胡椒粉', '適量', '', '0', 2),
(55, 3, '將白米洗淨加入8杯水及干貝、銀杏一起熬煮約30~35分鐘。', '', '', '1', 0),
(55, 3, '雞腿去骨、切成片狀加入1/2蛋白略醃。蔥切成蔥花、油條切片、香菇切絲備用。', '', '', '1', 1),
(55, 3, '做法①熬成粥後，加入雞腿肉、香菇繼續熬煮。', '', '', '1', 2),
(55, 3, '最後用「ほんだし ®/烹大師®」干貝風味及其他調味料調味即可盛碗。', '', '', '1', 3),
(55, 3, '在食用前撒上蔥花、香菜、油條即完成。', '', '', '1', 4),
(56, 1, '新鮮干貝', '2個', '', '', 0),
(56, 1, '花枝', '75g', '', '', 1),
(56, 1, '蝦', '4隻', '', '', 2),
(56, 1, '蟹肉', '75g', '', '', 3),
(56, 1, '秋葵', '2支', '', '', 4),
(56, 1, '紅蘿蔔', '75g', '', '', 5),
(56, 1, '冬菇', '1朵', '', '', 6),
(56, 1, '蛋白', '3顆', '', '', 7),
(56, 1, '水', '200c.c.', '', '', 8),
(56, 2, '「ほんだし ®/烹大師®」干貝風味', '2小匙', '', '0', 0),
(56, 2, '鹽', '1小匙', '', '0', 1),
(56, 2, '鮮奶', '100c.c.', '', '0', 2),
(56, 2, '太白粉', '適量', '', '0', 3),
(56, 2, '香油', '適量', '', '0', 4),
(56, 3, '將新鮮干貝、花枝、蝦、蟹肉切成丁狀，汆燙備用。', '', '', '1', 0),
(56, 3, '秋葵、紅蘿蔔、冬菇切片。', '', '', '1', 1),
(56, 3, '在蛋白中加入鮮奶、200c.c.的水充分攪拌後，放入「ほんだし ®/烹大師®」干貝風味，倒入碗中入蒸籠蒸約10~12分鐘後取出。', '', '', '1', 2),
(56, 3, '將做法①的食材加入1/2杯水略煮調味後， 加入少許太白粉芶芡，淋在做法③上即可。 ', '', '', '1', 3),
(57, 1, '蝦仁', '200  g', '', '', 0),
(57, 1, '青江菜', '4朵', '', '', 1),
(57, 1, '冬菇', '2朵', '', '', 2),
(57, 1, '洋火腿片', '1片', '', '', 3),
(57, 1, '冬瓜', '300g', '', '', 4),
(57, 1, '香菜', '少許', '', '', 5),
(57, 1, '水', '200c.c.', '', '', 6),
(57, 2, '「ほんだし ®/烹大師®」干貝風味', '1小匙', '', '0', 0),
(57, 2, '鹽', '1/2小匙', '', '0', 1),
(57, 2, '胡椒粉', '適量', '', '0', 2),
(57, 2, '芡汁', '適量', '', '0', 3),
(57, 2, '香油', '適量', '', '0', 4),
(57, 2, '豬油,鹽,太白粉', '20g,1/2小匙,2小匙', ',,', '0,0,0', 5),
(57, 3, '蝦仁剁成泥加入調味料Ⓐ後，充分攪拌。', '', '', '1', 0),
(57, 3, '青江菜燙熟先擺置盤中，冬菇、火腿切片備用。', '', '', '1', 1),
(57, 3, '冬瓜切成薄片備用。', '', '', '1', 2),
(57, 3, '將蝦泥、冬菇、火腿、香菜以冬瓜薄片捲起，放進蒸籠大火蒸約3~4分鐘，取出至盤中。', '', '', '1', 3),
(57, 3, '水煮沸加入「ほんだし ®/烹大師®」干貝風味以及其他調味料，再酌以適量的太白粉水勾芡，加點香油淋在菜面上即可。', '', '', '1', 4),
(58, 1, '土雞', '1000  g', '', '', 0),
(58, 1, '火腿', '20g', '', '', 1),
(58, 1, '薑', '1塊', '', '', 2),
(58, 1, '冬瓜', '300g', '', '', 3),
(58, 1, '水', '1500c.c.', '', '', 4),
(58, 2, '「ほんだし ®/烹大師®」干貝風味', '3小匙', '', '0', 0),
(58, 2, '鹽', '1小匙', '', '0', 1),
(58, 2, '紹興酒', '1小匙', '', '0', 2),
(58, 3, '土雞斬成小塊，雞塊用熱水汆燙備用。', '', '', '1', 0),
(58, 3, '火腿、薑切片備用。', '', '', '1', 1),
(58, 3, '冬瓜雕花，將火腿夾至中間。', '', '', '1', 2),
(58, 3, '以水調勻「ほんだし ®/烹大師®」干貝風味及其他調味料。', '', '', '1', 3),
(58, 3, '將備好的食材放入湯盅，加入做法④，放入蒸籠以中火蒸1小時即可。', '', '', '1', 4),
(59, 1, '蟹肉', '75g', '', '', 0),
(59, 1, '蝦仁', '75g', '', '', 1),
(59, 1, '花枝', '75g', '', '', 2),
(59, 1, '洋蔥', '1/2顆', '', '', 3),
(59, 1, '鳳梨', '50  g', '', '', 4),
(59, 1, '洋菇', '2朵', '', '', 5),
(59, 1, '綠甜椒', '50  g', '', '', 6),
(59, 1, '紅甜椒', '50  g', '', '', 7),
(59, 1, '蛋塔油皮', '4片', '', '', 8),
(59, 2, '「ほんだし ®/烹大師®」干貝風味', '1小匙', '', '0', 0),
(59, 2, '糖', '1小匙', '', '0', 1),
(59, 2, '鮮奶', '100c.c.', '', '0', 2),
(59, 2, '奶油', '2塊', '', '0', 3),
(59, 2, '麵粉', '適量', '', '0', 4),
(59, 2, '乳酪絲', '適量', '', '0', 5),
(59, 2, '西洋芹', '適量', '', '0', 6),
(59, 3, ' 將蟹肉、蝦仁、花枝切成丁，汆燙備用。洋蔥、鳳梨、洋菇、綠甜椒、紅甜椒切丁，用奶油略炒香。', '', '', '1', 0),
(59, 3, '將蛋塔油皮鋪至蛋塔杯中，備用。', '', '', '1', 1),
(59, 3, '將做法①的食材放入蛋塔杯裡。', '', '', '1', 2),
(59, 3, '將「ほんだし ®/烹大師®」干貝風味、糖與鮮奶充分混合，加入奶油、麵粉煮成白醬，淋在做法③上，灑上乳酪絲放入烤箱以上火180℃、下火180℃烘烤12分鐘取出，在上方灑上西洋芹即可。', '', '', '1', 3),
(61, 1, '綠竹筍', '200  g', '', '', 0),
(61, 1, '冬菇', '4朵', '', '', 1),
(61, 1, '豬肚', '75g', '', '', 2),
(61, 1, '蔥', '少許', '', '', 3),
(61, 1, '排骨', '120  g', '', '', 4),
(61, 1, '薑', '1塊', '', '', 5),
(61, 1, '竹笙', '竹笙', '', '', 6),
(61, 1, '枸杞', '5g', '', '', 7),
(61, 1, '水', '1500c.c.', '', '', 8),
(61, 2, '「ほんだし ®/烹大師®」干貝風味', '2小匙', '', '0', 0),
(61, 2, '鹽', '1小匙', '', '0', 1),
(61, 2, '酒', '1小匙', '', '0', 2),
(61, 3, '綠竹筍切滾刀、冬菇切片，將以上的食材，事先汆燙備用。', '', '', '1', 0),
(61, 3, '豬肚洗淨加蔥，水煮30分鐘撈起，豬肚切片備用。', '', '', '1', 1),
(61, 3, '排骨切小塊，加薑汆燙去血水備用。', '', '', '1', 2),
(61, 3, '將做法①、做法②、做法③及竹笙、枸杞等材料放入湯盅。', '', '', '1', 3),
(61, 3, '以水調勻「ほんだし ®/烹大師®」干貝風味及其他調味料後，一起倒入湯盅，放入蒸鍋蒸約1小時即可。', '', '', '1', 4),
(62, 1, '干貝絲', '50g', '', '', 0),
(62, 1, '銀芽', '300g', '', '', 1),
(62, 1, '韭黃', '80g', '', '', 2),
(62, 1, '紅甜椒', '1/4顆', '', '', 3),
(62, 1, '黃甜椒', '1/4顆', '', '', 4),
(62, 2, '「ほんだし ®/烹大師®」干貝風味', '1小匙', '', '0', 0),
(62, 2, '鹽', '0.5小匙', '', '0', 1),
(62, 2, '酒', '1小匙', '', '0', 2),
(62, 2, '香油', '1小匙', '', '0', 3),
(62, 3, '干貝絲用油鍋以中火炸至酥脆，瀝乾油備用。', '', '', '1', 0),
(62, 3, '銀芽切去頭尾，韭黃切長約4公分段備用，紅黃甜椒切絲。', '', '', '1', 1),
(62, 3, ' 熱鍋略炒銀芽、韭黃、紅黃甜椒等，加入「ほんだし ®/烹大師®」干貝風味及其他調味料，充分拌炒。', '', '', '1', 2),
(62, 3, '將做法③盛盤，撒上干貝酥即可。', '', '', '1', 3),
(65, 1, '冬菇', '4朵', '', '', 0),
(65, 1, '金針菇', '100g', '', '', 1),
(65, 1, '鴻禧菇', '35g', '', '', 2),
(65, 1, '茶樹菇', '20g', '', '', 3),
(65, 1, '杏鮑菇', '40g', '', '', 4),
(65, 1, '山茼蒿', '50g', '', '', 5),
(65, 1, '凍豆腐', '4塊', '', '', 6),
(65, 1, '蕃茄', '1顆', '', '', 7),
(65, 1, '枸杞', '15g', '', '', 8),
(65, 1, '玉米筍', '100g', '', '', 9),
(65, 1, '水', '1000c.c.', '', '', 10),
(65, 2, '「ほんだし ®/烹大師®」昆布風味', '1.5 小匙', '', '0', 0),
(65, 2, '鹽', '1小匙', '', '0', 1),
(65, 2, '香油', '1小匙', '', '0', 2),
(65, 3, '冬菇、金針菇、鴻禧菇、茶樹菇去蒂洗淨，杏鮑菇切片。', '', '', '1', 0),
(65, 3, '山茼蒿洗淨備用，凍豆腐切小丁，蕃茄切塊。', '', '', '1', 1),
(65, 3, '準備砂鍋依序將做法①、②及枸杞、玉米筍放入砂鍋，將熱水煮沸以「ほんだし ®/烹大師®」昆布風味及其他調味料調味即可。', '', '', '1', 2),
(66, 1, '南瓜', '35  g', '', '', 0),
(66, 1, '芋頭', '35  g', '', '', 1),
(66, 1, '牛蕃茄', '1/2顆', '', '', 2),
(66, 1, '花椰菜', '30g', '', '', 3),
(66, 1, '海帶芽', '10g', '', '', 4),
(66, 2, '「ほんだし ®/烹大師®」昆布風味,淡醬油,桂花醬,洋菜粉,水', '1小匙,1/2小匙,1/2小匙,2小匙,200c.c.', ',,,,', '0,0,0,0,0', 0),
(66, 2, '和風胡麻醬', '2大匙', '', '0', 1),
(66, 3, '南瓜、芋頭切丁蒸10分鐘。花椰菜切小塊、汆燙過後以冰塊冰鎮。', '', '', '1', 0),
(66, 3, '牛蕃茄去皮切塊，海帶芽泡熱水發脹。', '', '', '1', 1),
(66, 3, '將調味料Ⓐ煮熟調勻，置放冷卻。', '', '', '1', 2),
(66, 3, '先將做法①與②放於模具中，再將做法③一起倒入其中。將製好的蔬菜凍排盤，淋上和風胡麻醬即可。 ', '', '', '1', 3),
(67, 1, '雲耳', '10g', '', '', 0),
(67, 1, '木耳', '10g', '', '', 1),
(67, 1, '瑜耳', '10g', '', '', 2),
(67, 1, '冬菇', '2朵', '', '', 3),
(67, 1, '洋菇', '35g', '', '', 4),
(67, 1, '猴菇', '2朵', '', '', 5),
(67, 1, '竹筍', '75g', '', '', 6),
(67, 1, '紅蘿蔔', '35g', '', '', 7),
(67, 1, '白果', '8粒', '', '', 8),
(67, 1, '玉米筍', '4支', '', '', 9),
(67, 1, '芥菜', '100g', '', '', 10),
(67, 1, '水', '1杯', '', '', 11),
(67, 2, '「ほんだし ®/烹大師®」昆布風味', '2小匙', '', '0', 0),
(67, 2, '糖', '1/2小匙', '', '0', 1),
(67, 2, '素蠔油', '1小匙', '', '0', 2),
(67, 2, '太白粉', '1小匙', '', '0', 3),
(67, 2, '香油', '1小匙', '', '0', 4),
(67, 3, '雲耳、木耳、瑜耳用熱水泡發、洗淨備用。', '', '', '1', 0),
(67, 3, '冬菇、洋菇、猴菇、竹筍、紅蘿蔔切片。', '', '', '1', 1),
(67, 3, '白果蒸熟備用，玉米筍切小塊，芥菜燙熟擺至盤中裝飾。', '', '', '1', 2),
(67, 3, '將以上的材料放入炒鍋內略炒，加水及調味料Ⓐ，燜煮2~3分鐘至湯汁收乾。', '', '', '1', 3),
(67, 3, '上桌前，加入太白粉水勾芡，淋上香油炒勻即可。  ', '', '', '1', 4),
(64, 1, '竹筍', '1支', '', '', 1),
(64, 1, '吐司丁', '35g', '', '', 2),
(64, 1, '蟹肉', '150g', '', '', 3),
(64, 1, '蝦仁', '100g', '', '', 4),
(64, 1, '洋菇', '35g', '', '', 5),
(64, 1, '花椰菜', '4朵', '', '', 6),
(64, 1, '紅蘿蔔', '35g', '', '', 7),
(64, 1, '洋蔥', '1/2顆', '', '', 8),
(64, 1, '茴香', '少許', '', '', 9),
(64, 1, '水', '1000c.c.', '', '', 10),
(64, 2, '「ほんだし ®/烹大師®」干貝風味', '2小匙', '', '0', 0),
(64, 2, '鹽', '2小匙', '', '0', 1),
(64, 2, '鮮奶', '150c.c.', '', '0', 2),
(64, 2, '鮮奶油', '50c.c.', '', '0', 3),
(64, 2, '麵粉', '2大匙', '', '0', 4),
(64, 2, '起司塊', '2小匙', '', '0', 5),
(64, 2, '奶油', '1小匙', '', '0', 6),
(64, 3, '竹筍以滾水煮10分鐘，剝除硬殼並切成丁。', '', '', '1', 0),
(64, 3, '蟹肉、蝦仁、洋菇、花椰菜、紅蘿蔔、洋蔥等切成丁備用。', '', '', '1', 1),
(64, 3, '將麵粉炒香，調製成麵糊備用。吐司條切丁，用烤箱將之烤乾。', '', '', '1', 2),
(64, 3, '潤鍋以奶油炒香洋蔥丁，加水煮沸後放入做法① ＆②。再次沸騰時加入「ほんだし ®/烹大師®」干貝風味及剩餘的調味料、再添入鮮奶＆鮮奶油＆起司塊增加濃郁感。', '', '', '1', 3),
(64, 3, '在做法④中加入適量麵糊勾芡，煮成濃稠狀，最後撒上吐司丁、茴香即可。', '', '', '1', 4),
(63, 1, '鮭魚', '110g', '', '', 1),
(63, 1, '紅蘿蔔', '20g', '', '', 2),
(63, 1, '蔥', '1支', '', '', 3),
(63, 1, '甜豆', '30g', '', '', 4),
(63, 1, '干貝絲', '30g', '', '', 5),
(63, 1, '雞蛋', '2顆', '', '', 6),
(63, 1, '白飯', '350g', '', '', 7),
(63, 2, '「ほんだし ®/烹大師®」干貝風味', '1小匙', '', '0', 1),
(63, 2, '鹽', '1小匙', '', '0', 2),
(63, 2, '胡椒粉', '適量', '', '0', 3),
(63, 2, '沙拉油', '1大匙', '', '0', 4),
(63, 3, '將鮭魚、紅蘿蔔、蔥等切成丁，甜豆切小段，干貝絲炸酥、鮭魚丁過油備用。', '', '', '1', 0),
(63, 3, '熱鍋把雞蛋炒香，加入白飯快速拌炒。將飯炒鬆。', '', '', '1', 1),
(63, 3, '將做法①加入「ほんだし ®/烹大師®」干貝風味及其他調味料與蔬菜食材拌勻。', '', '', '1', 2),
(63, 3, ' 最後加入做法②以大火炒香即可。 ', '', '', '1', 3),
(68, 1, '鮮干貝', '4顆', '', '', 0),
(68, 1, '蝦仁', '4隻', '', '', 1),
(68, 1, '甜豆', '150g', '', '', 2),
(68, 1, '紅甜椒', '1/4顆', '', '', 3),
(68, 1, '黃甜椒', '1/4顆', '', '', 4),
(68, 1, '香菇', '2朵', '', '', 5),
(68, 1, '百合', '40g', '', '', 6),
(68, 1, '蔥', '1支', '', '', 7),
(68, 1, '薑', '3片', '', '', 8),
(68, 1, '蒜頭', '2顆', '', '', 9),
(68, 2, '「ほんだし ®/烹大師®」鰹魚風味', '2小匙', '', '0', 0),
(68, 2, '鹽', '1小匙', '', '0', 1),
(68, 2, '水', '2小匙', '', '0', 2),
(68, 2, '酒', '適量', '', '0', 3),
(68, 2, '香油', '適量', '', '0', 4),
(68, 2, '胡椒粉', '適量', '', '0', 5),
(68, 3, '蝦仁剖背取沙腸備用，甜豆去絲，將上述食材與鮮干貝一起汆燙。', '', '', '1', 0),
(68, 3, '紅黃甜椒切菱形，香菇切片，百合去蒂，蔥、薑、蒜切片備用。', '', '', '1', 1),
(68, 3, '熱鍋後加入少許油，炒香蔥、薑、蒜數秒，贊酒觸香後，放入做法① 、做法② 的食材以大火拌炒。', '', '', '1', 2),
(68, 3, '最後加入少許水及「ほんだし ®/烹大師®」鰹魚風味與其他調味料，快炒均勻即可。', '', '', '1', 3),
(69, 1, '牛里肌', '150  g', '', '', 0),
(69, 1, '荸薺', '50  g', '', '', 1),
(69, 1, '竹筍', '50  g', '', '', 2),
(69, 1, '豆腐', '1/2盒', '', '', 3),
(69, 1, '草菇', '50g', '', '', 4),
(69, 1, '蔥', '1支', '', '', 5),
(69, 1, '蓴菜', '100g', '', '', 6),
(69, 1, '蛋白液', '50g', '', '', 7),
(69, 1, '香菜', '10  g', '', '', 8),
(69, 1, '水', '1000', '', '', 9),
(69, 2, '「ほんだし ®/烹大師®」鰹魚風味', '2小匙', '', '0', 0),
(69, 2, '鹽', '1小匙', '', '0', 1),
(69, 2, '太白粉', '2小匙', '', '0', 2),
(69, 2, '胡椒粉', '少許', '', '0', 3),
(69, 2, '香油', '少許', '', '0', 4),
(69, 3, '牛里肌肉去筋、再切成碎丁。將太白粉1小匙、蛋白液1小匙充分攪拌，再加入牛碎丁，醃至入味後放至冷藏約10分鐘。', '', '', '1', 0),
(69, 3, '荸薺、竹筍、豆腐、草菇切菱形片備用。蔥切成蔥花。', '', '', '1', 1),
(69, 3, '蓴菜先用熱滾水汆燙、瀝乾水分備用。', '', '', '1', 2),
(69, 3, '汆燙做法①、做法②。', '', '', '1', 3),
(69, 3, '水煮沸騰後，加入做法④下鍋煮開，加入「ほんだし ®/烹大師®」鰹魚風味及其他調味料再以太白粉水勾芡，淋上蛋白液拌勻。', '', '', '1', 4),
(69, 3, '最後放上蓴菜、蔥花、香菜即可。', '', '', '1', 5),
(70, 1, '石斑肉', '150  g', '', '', 0),
(70, 1, '豆漿', '400  g', '', '', 1),
(70, 1, '山蘇', '4片', '', '', 2),
(70, 1, '竹筍', '1/2支', '', '', 3),
(70, 1, '甜椒', '35g', '', '', 4),
(70, 1, '韭菜', '4根', '', '', 5),
(70, 1, '洋菜粉', '20g', '', '', 6),
(70, 1, '花椰菜', '4朵', '', '', 7),
(70, 1, '銀杏', '8顆', '', '', 8),
(70, 2, '「ほんだし ®/烹大師®」鰹魚風味,鹽', '1/4小匙,1/4小匙', ',', '0,0', 0),
(70, 2, 'ほんだし ®/烹大師®」鰹魚風味,太白粉,淡口醬油,水', '1/2小匙,1小匙,1匙,150c.c.', ',,,', '0,0,0,0', 1),
(70, 3, '豆漿加洋菜粉及調味料Ⓐ，加熱至70℃，即可倒入容器冷卻置涼。', '', '', '1', 0),
(70, 3, '石斑肉切長方薄片、竹筍、甜椒切成條狀，韭菜、花椰菜、銀杏汆燙備用。', '', '', '1', 1),
(70, 3, '以石斑魚薄片依序將山蘇、筍條、甜椒條捲起成圓筒狀。', '', '', '1', 2),
(70, 3, '將做法③以韭菜做捆綁，即可入蒸籠蒸4分鐘。', '', '', '1', 3),
(70, 3, '將石斑魚捲、花椰菜、銀杏放在豆漿凍上。煮滾調味料Ⓑ後，稍稍勾薄芡，將芡汁淋在石斑捲上即可。', '', '', '1', 4),
(72, 1, '蝦仁,蛤蜊,蟹腳,小卷,淡菜', '4隻,8顆,2隻,1支,3顆', '', '', 0),
(72, 1, '洋蔥', '1/2顆', '', '', 1),
(72, 1, '牛番茄', '2顆', '', '', 2),
(72, 1, '蒜頭', '2顆', '', '', 3),
(72, 1, '九層塔', '20g', '', '', 4),
(72, 1, '西洋芹碎粒', '少許', '', '', 5),
(72, 2, '「ほんだし ®/烹大師®」鰹魚風味', '1小匙', '', '0', 0),
(72, 2, '鹽', '1小匙', '', '0', 1),
(72, 2, '橄欖油', '1大匙', '', '0', 2),
(72, 2, '番茄糊', '2小匙', '', '0', 3),
(72, 2, '蕃茄醬', '3小匙', '', '0', 4),
(72, 2, '黑胡椒粒', '適量', '', '0', 5),
(72, 2, '義大利香料', '適量', '', '0', 6),
(72, 2, '水', '900c.c.', '', '0', 7),
(72, 2, '白酒', '少許', '', '0', 8),
(72, 3, '蝦仁剖背取沙腸，小卷切塊後，將材料Ⓐ全數汆燙數秒後撈起。', '', '', '1', 0),
(72, 3, '洋蔥切丁，牛番茄汆燙去皮切丁，蒜頭切丁。', '', '', '1', 1),
(72, 3, '以橄欖油炒香洋蔥丁、蒜丁後淋上少許白酒，加入與牛蕃茄丁、與蕃茄糊、蕃茄醬，煮滾約5~10分鐘。', '', '', '1', 2),
(72, 3, '將水煮沸加入做法③與做法①，煮約3~5分鐘，放入「ほんだし ®/烹大師®」鰹魚風味及其他調味料。上桌前加上九層塔、灑上少許香料即可。', '', '', '1', 3),
(73, 1, '蝦仁', '50g', '', '', 0),
(73, 1, '海參', '50g', '', '', 1),
(73, 1, '鯛魚', '50g', '', '', 2),
(73, 1, '魚板', '35g', '', '', 3),
(73, 1, '菠菜', '150g', '', '', 4),
(73, 1, '蛋白', '3顆', '', '', 5),
(73, 1, '香菇', '2朵', '', '', 6),
(73, 1, '竹筍', '35g', '', '', 7),
(73, 1, '荸薺', '35g', '', '', 8),
(73, 1, '水', '1200c.c.', '', '', 9),
(73, 2, '「ほんだし ®/烹大師®」鰹魚風味', '1小匙', '', '0', 0),
(73, 2, '鹽', '1小匙', '', '0', 1),
(73, 2, '太白粉水', '2大匙', '', '0', 2),
(73, 2, '玉米粉', '1大匙', '', '0', 3),
(73, 2, '香油', '適量', '', '0', 4),
(73, 3, '將蝦仁、海參、鯛魚、魚板切成丁狀，汆燙備用。', '', '', '1', 0),
(73, 3, '菠菜切碎加2顆蛋白、玉米粉用果汁機打碎過濾，準備油鍋，油溫約50℃。將菠菜汁倒入攪拌待浮起後即可撈起濾油再沖水備用。', '', '', '1', 1),
(73, 3, '香菇、竹筍、荸薺切丁狀。', '', '', '1', 2),
(73, 3, '水煮沸後放入做法①、②、③，放入「ほんだし ®/烹大師®」鰹魚風味及鹽，以太白粉勾芡，淋上1顆蛋白攪拌均勻滴上香油即可盛碗。', '', '', '1', 3),
(77, 1, '帶殼草蝦(大)', '6尾', '', '', 0),
(77, 1, '淡菜', '5顆', '', '', 1),
(77, 1, '蛤蜊', '120g', '', '', 2),
(77, 1, '中卷', '150g', '', '', 3),
(77, 1, '蛋黃', '1顆', '', '', 4),
(77, 1, '水', '1200c.c.', '', '', 5),
(77, 2, '「ほんだし ®/烹大師®」鰹魚風味', '4小匙', '', '0', 0),
(77, 2, '大紅浙醋', '1小匙', '', '0', 1),
(77, 2, '辣豆瓣醬', '1小匙', '', '0', 2),
(77, 2, '橄欖油', '適量', '', '0', 3),
(77, 2, 'TABASCO', '適量', '', '0', 4),
(77, 2, '白酒', '少許', '', '0', 5),
(77, 2, '老抽', '少許', '', '0', 6),
(77, 3, '草蝦剝殼留頭尾，開背去除腸泥備用。', '', '', '1', 0),
(77, 3, '淡菜洗淨備用。', '', '', '1', 1),
(77, 3, '蛤蜊吐沙、洗淨備用。', '', '', '1', 2),
(77, 3, '中卷洗淨，切成圈狀備用。', '', '', '1', 3),
(77, 3, '熱鍋以少許橄欖油，將上述材料下鍋煎至微香後加人少許白酒增加香氣。', '', '', '1', 4),
(77, 3, '將水及「ほんだし ®/烹大師®」鰹魚風味、大紅浙醋、辣豆瓣醬、TABASCO、老抽，一起煮開。', '', '', '1', 5),
(77, 3, '在做法⑥中加入做法⑤ ，再次沸騰時，打入一顆蛋黃充分攪拌即可起鍋。', '', '', '1', 6),
(78, 1, '南瓜', '240g', '', '', 0),
(78, 1, '豬里肌肉', '220g', '', '', 1),
(78, 1, '紫米', '200g', '', '', 2),
(78, 1, '竹笙外膜', '4張', '', '', 3),
(78, 1, '蛋白', '3顆', '', '', 4),
(78, 1, '水', '200c.c.', '', '', 5),
(78, 2, '「ほんだし ®/烹大師®」干貝風味', '3小匙', '', '0', 0),
(78, 2, '糖', '1小匙', '', '0', 1),
(78, 2, '太白粉', '40  g', '', '0', 2),
(78, 3, '南瓜刨去外皮，去除內籽切成厚約2公分的片狀，入鍋蒸15分鐘，再用果汁機打成泥狀。', '', '', '1', 0),
(78, 3, '竹笙泡水備用。', '', '', '1', 1),
(78, 3, '紫米泡水入鍋蒸30分鐘後，取出置涼增加黏性。', '', '', '1', 2),
(78, 3, '里肌肉洗淨，剁碎加入「ほんだし ®/烹大師®」干貝風味1小匙、蛋白、太白粉略醃。', '', '', '1', 3),
(78, 3, '小火煮水加人做法①及「ほんだし ®/烹大師®」干貝風味2小匙、糖，續煮成南瓜醬汁。', '', '', '1', 4),
(78, 3, '將紫米包裹住做法④，再用竹笙外膜套在球體外。', '', '', '1', 5),
(78, 3, '再將完成的做法⑥入蒸鍋蒸約10分鐘後，取出淋上做法⑤即可。', '', '', '1', 6),
(80, 1, '潮鯛(台灣吳郭魚)', '270  g', '', '', 0),
(80, 1, '紅蘿蔔', '70g', '', '', 1),
(80, 1, '生香菇', '70g', '', '', 2),
(80, 1, '蘆筍', '70g', '', '', 3),
(80, 1, '海苔', '4張', '', '', 4),
(80, 1, '黑芝麻', '適量', '', '', 5),
(80, 1, '白芝麻', '適量', '', '', 6),
(80, 1, '雞蛋', '1顆', '', '', 7),
(80, 2, '「ほんだし ®/烹大師®」干貝風味', '1小匙', '', '0', 0),
(80, 2, '米酒', '1小匙', '', '0', 1),
(80, 2, '太白粉', '1小匙', '', '0', 2),
(80, 2, '中筋麵粉', '少許', '', '0', 3),
(80, 2, '沙拉油', '適量', '', '0', 4),
(80, 3, '潮鯛洗淨切長方形片狀，以「ほんだし ®/烹大師®」干貝風味、太白粉、米酒略醃10分鐘備用。', '', '', '1', 0),
(80, 3, '將紅蘿蔔、生香菇、蘆筍切成長條狀，汆燙後撈起備用。', '', '', '1', 1),
(80, 3, '海苔平鋪，再將做法①與做法②依序包覆其中，捲成圓柱狀，再用麵粉糊粘邊。', '', '', '1', 2),
(80, 3, '將做法③依序裹上麵粉、打好的蛋汁、黑芝麻、白芝麻等。', '', '', '1', 3),
(80, 3, '起油鍋，油溫約160℃時轉小火，將做好的海苔魚捲下鍋炸至金黃色即可。', '', '', '1', 4),
(75, 1, '去骨雞胸肉', '80g', '', '', 1),
(75, 1, '五爪蘋果', '80g', '', '', 2),
(75, 1, '松子', '40g', '', '', 3),
(75, 1, '雞蛋', '2顆', '', '', 4),
(75, 1, '蛋白', '1/2顆', '', '', 5),
(75, 1, '水', '20c.c.', '', '', 6),
(75, 2, '「ほんだし ®/烹大師®」鰹魚風味', '1又1/4小匙', '', '0', 1),
(75, 2, '太白粉', '1/4小匙', '', '0', 2),
(75, 2, '鮮奶油', '50c.c.', '', '0', 3),
(75, 2, '沙拉油', '適量', '', '0', 4),
(75, 3, '將雞蛋打成蛋汁，煎成蛋皮薄片。(可加點太白粉增加韌性)', '', '', '1', 0),
(75, 3, '松子放人烤箱中，以160度火烤12分鐘，取出放涼備用。', '', '', '1', 1),
(75, 3, '蘋果削皮，切成1公分正方狀。', '', '', '1', 2),
(75, 3, '雞胸肉切成小丁狀，「ほんだし ®/烹大師®」鰹魚風味1/2小匙、太白粉以及半顆蛋白略醃10分鐘後，再將醃過的雞肉丁過油備用。', '', '', '1', 3),
(75, 3, '熱鍋加水、「ほんだし ®/烹大師®」鰹魚風味3/4小匙、鮮奶油以小火充分攪拌均勻后，加入做法③及做法④ 。', '', '', '1', 4),
(75, 3, '在做法⑤中以太白粉勾茨後，再續加入做法②，充分拌勻後即成內餡料。', '', '', '1', 5),
(75, 3, '用煎好的蛋皮將內餡包成球型，再用鋁箔紙固定住開口處，多出來的蛋皮往外翻成花朵狀，放進烤箱以180℃烤3分鐘即可。', '', '', '1', 6),
(76, 1, '大黃瓜', '240g', '', '', 1),
(76, 1, '蝦仁', '215g', '', '', 2),
(76, 1, '蘆筍', '20g', '', '', 3),
(76, 1, '蛋白', '1顆', '', '', 4),
(76, 1, '水', '70c.c.', '', '', 5),
(76, 2, '「ほんだし ®/烹大師®」鰹魚風味', '1小匙', '', '0', 1),
(76, 2, '太白粉', '1小匙', '', '0', 2),
(76, 2, '松露醬', '1小匙', '', '0', 3),
(76, 3, '大黃瓜刨去外皮，切成寬約2公分的圓圈狀，去除內籽備用。', '', '', '1', 0),
(76, 3, '蘆筍洗淨，留筍尖部位約7公分長備用。', '', '', '1', 1),
(76, 3, '蝦仁洗淨去腸泥，用菜刀拍成肉泥狀後，加入「ほんだし ®/烹大師®」鰹魚風味1/2小匙、蛋白做適量的調味。', '', '', '1', 2),
(76, 3, '熱鍋後加入水、「ほんだし ®/烹大師®」鰹魚風味1/2小匙、太白粉、松露醬，充分攪拌，製成特製松露醬汁。', '', '', '1', 3),
(76, 3, '將做法③鑲入大黃瓜中，並穿入蘆筍尖，下鍋蒸約6分鐘取出淋上做法④即可。', '', '', '1', 4),
(79, 1, '地瓜', '360g', '', '', 1),
(79, 1, '羊菌菇', '100g', '', '', 2),
(79, 1, '鴻禧菇', '100g', '', '', 3),
(79, 1, '不起絲起司', '60g', '', '', 4),
(79, 1, '牛油', '60g', '', '', 5),
(79, 1, '蒜頭', '10g', '', '', 6),
(79, 1, '水', '600cc.', '', '', 7),
(79, 1, '動物性鮮奶油', '200c.c.', '', '', 8),
(79, 2, '「ほんだし ®/烹大師®」干貝風味', '3小匙', '', '0', 1),
(79, 2, '橄欖油', '2大匙', '', '0', 2),
(79, 2, '麵粉', '少許', '', '0', 3),
(79, 3, '地瓜削皮洗淨，入鍋蒸至熟軟後，取出挖球備用。', '', '', '1', 0),
(79, 3, '將蒜頭、羊菌菇切片，鴻禧菇去蒂頭備用。', '', '', '1', 1),
(79, 3, '熱鍋加入橄欖油炒香蒜片，再將蒜片撈起。', '', '', '1', 2),
(79, 3, '在做法③中加入水、「ほんだし ®/烹大師®」干貝風味、起司、牛油、鮮奶油等一起以小火煮開。', '', '', '1', 3),
(79, 3, '將做法④中加入做法②，再以麵粉勾茨，最後加入地瓜泥球即可。', '', '', '1', 4),
(84, 1, '雞翅中段', '4隻', '', '', 0),
(84, 1, '旗魚魚漿', '80g', '', '', 1),
(84, 1, '蝦卵', '1大匙', '', '', 2),
(84, 1, '馬蹄碎', '25g', '', '', 3),
(84, 1, '芹菜末', '20g', '', '', 4),
(84, 1, '薑末', '1大匙', '', '', 5),
(84, 1, '杏仁碎', '25g', '', '', 6),
(84, 1, '蛋液', '少許', '', '', 7),
(84, 1, '蔥', '少許', '', '', 8),
(84, 1, '薑', '少許', '', '', 9),
(84, 1, '水', '200c.c.', '', '', 10),
(84, 2, '「ほんだし ®/烹大師®」干貝風味,太白粉,鹽,糖,胡椒粉', '1小匙,1小匙,1/2小匙,1/2小匙,少許', ',,,,', '0,0,0,0,0', 0),
(84, 2, '「ほんだし ®/烹大師®」干貝風味', '1小匙', '', '0', 1),
(84, 2, '酒', '35g', '', '0', 2),
(84, 2, '甘露醬油', '35g', '', '0', 3),
(84, 2, '味醂', '15g', '', '0', 4),
(84, 2, '太白粉水', '少許', '', '0', 5),
(84, 3, '雞翅去骨、留皮備用。', '', '', '1', 0),
(84, 3, '旗魚魚漿、蝦卵、馬蹄碎、芹菜末與薑末等，以調味料Ⓐ攪拌均勻成內餡。', '', '', '1', 1),
(84, 3, '將做法②鑲入雞翅內，雞翅開口處沾少許蛋液後以杏仁碎粒封口。', '', '', '1', 2),
(84, 3, '熱油鍋120℃放入雞翅炸熟撈起。', '', '', '1', 3),
(84, 3, '爆香少許薑、蔥後依序放入酒、甘露醬油、味醂、「ほんだし ®/烹大師®」干貝風味1小匙、水，煮開後放入做法④，入蒸籠蒸20分鐘後取出排盤。', '', '', '1', 4),
(84, 3, '剩餘的蒸籠雞翅醬汁勾芡回淋做法⑤即可。', '', '', '1', 5),
(85, 1, '荔甫芋', '120g', '', '', 0),
(85, 1, '冬菇', '15g', '', '', 1),
(85, 1, '竹筍', '15g', '', '', 2),
(85, 1, '豆腐', '25g', '', '', 3),
(85, 1, '甜豆', '25g', '', '', 4),
(85, 1, '水', '300c.c.', '', '', 5),
(85, 2, '「ほんだし ®/烹大師®」昆布風味', '2小匙', '', '0', 0),
(85, 2, '素蠔油', '1大匙', '', '0', 1),
(85, 2, '糖', '1/2小匙', '', '0', 2),
(85, 2, '胡椒粉', '適量', '', '0', 3),
(85, 2, '太白粉水', '1大匙', '', '0', 4),
(85, 3, '荔甫芋中間挖空修成圓柱狀。', '', '', '1', 0),
(85, 3, '將水與「ほんだし ®/烹大師®」昆布風味1小匙調成高湯，放入做法① 、以小火煮15分鐘。', '', '', '1', 1),
(85, 3, '冬菇、竹筍、豆腐等食材切成丁。', '', '', '1', 2),
(85, 3, '熱油鍋將做法③略炒並加入「ほんだし ®/烹大師®」昆布風味1小匙及其他調味料後，收乾湯汁勾少許芡汁，盛入芋頭盅內。', '', '', '1', 3),
(85, 3, '再以汆燙過的甜豆裝飾即可。', '', '', '1', 4),
(86, 1, '澎湖絲瓜', '150  g', '', '', 0),
(86, 1, '柳松菇', '30  g', '', '', 1),
(86, 1, '玉米筍', '45g', '', '', 2),
(86, 1, '紅蘿蔔', '37.5  g', '', '', 3),
(86, 1, '紫山藥', ' 50g', '', '', 4),
(86, 1, '紅甜椒', '30g', '', '', 5),
(86, 1, '紅蘿蔔末', '10g', '', '', 6),
(86, 1, '水', '300c.c.', '', '', 7),
(86, 2, '「ほんだし ®/烹大師®」昆布風味', '1小匙', '', '0', 0),
(86, 2, '鹽', '1小匙', '', '0', 1),
(86, 2, '糖', '少許', '', '0', 2),
(86, 2, '香油', '少許', '', '0', 3),
(86, 2, '素蠔油', '1大匙', '', '0', 4),
(86, 2, '太白粉水', '1大匙', '', '0', 5),
(86, 3, '將澎湖絲瓜洗淨去皮，切成圓柱狀後、捲切成薄片備用。', '', '', '1', 0),
(86, 3, '柳松菇洗淨備用、紅蘿蔔切絲、玉米筍＆紫山藥＆紅甜椒洗淨切成長條狀。', '', '', '1', 1),
(86, 3, '以澎湖絲瓜薄片依序將柳松菇、玉米筍、紅甜椒包捲起來，再以紅蘿蔔絲綁成結。', '', '', '1', 2),
(86, 3, '將水與「ほんだし ®/烹大師®」昆布風味昆布風味及其他調味料一起煮開，放入絲瓜捲及紫山藥以小火煨煮入味。', '', '', '1', 3),
(86, 3, '將紫山藥＆絲瓜捲排盤後，再將做法④的剩餘湯汁加入紅蘿蔔末煮開勾薄芡淋上絲瓜捲即可。', '', '', '1', 4),
(87, 1, '冬菇', '25g', '', '', 0),
(87, 1, '金針菇', '25g', '', '', 1),
(87, 1, '杏鮑菇', '25g', '', '', 2),
(87, 1, '豆腐', '1盒', '', '', 3),
(87, 1, '草菇', '37g', '', '', 4),
(87, 1, '玉米筍', '25g', '', '', 5),
(87, 1, '綠花椰菜', '4朵', '', '', 6),
(87, 1, '紅蘿蔔片', '25g', '', '', 7),
(87, 2, '「ほんだし ®/烹大師®」昆布風味,鹽 ,胡椒粉,太白粉,卡士達粉', '1小匙,1小匙,適量,50g,50g', ',,,,', '0,0,0,0,0', 0),
(87, 2, '「ほんだし ®/烹大師®」昆布風味,素蠔油,水,太白粉水,砂糖 ,香油', '1大匙,1大匙,150c.c.,1大匙,1/2小匙,適量', ',,,,,', '0,0,0,0,0,0', 1),
(87, 3, '冬菇、金針菇、杏鮑菇、豆腐切碎粒，與調味料Ⓐ充分拌勻。', '', '', '1', 0),
(87, 3, '用湯匙將做法①擠成八顆丸子，油炸至金黃色成琵琶豆腐。', '', '', '1', 1),
(87, 3, '綠花椰菜燙熟備用。', '', '', '1', 2),
(87, 3, '將草菇、玉米筍、紅蘿蔔片、做法②一同下鍋加入調味料Ⓑ以小火燜煮至收乾湯汁，即可盛入砂鍋中，最後再擺入做法③即可。', '', '', '1', 3),
(88, 1, '芽白菜心', '120  g', '', '', 0),
(88, 1, '蘆筍', '120g', '', '', 1),
(88, 1, '蟹肉 ', '50g', '', '', 2),
(88, 1, '起士絲', '37.5g', '', '', 3),
(88, 1, '薑片', '2片', '', '', 4),
(88, 1, '水', '580c.c.', '', '', 5),
(88, 2, '「ほんだし ®/烹大師®」干貝風味', '1.5大匙', '', '0', 0),
(88, 2, '鹽', '1小匙', '', '0', 1),
(88, 2, '咖哩粉', '1大匙', '', '0', 2),
(88, 2, '椰漿', '40c.c.', '', '0', 3),
(88, 2, '奶油', '2大匙', '', '0', 4),
(88, 2, '麵粉', '1大匙', '', '0', 5),
(88, 3, '爆香薑片後，加入水500c.c.待沸騰時，加入「ほんだし ®/烹大師®」干貝風味1大匙，再依序放入芽白菜心、蘆筍，煮熟後撈起。', '', '', '1', 0),
(88, 3, '將做法①和蟹肉排入烤盤。', '', '', '1', 1),
(88, 3, '將「ほんだし ®/烹大師®」干貝風味1小匙與80c.c.的水、及其他調味料煮勻成葡汁醬，淋上做法②後，灑上起士絲。', '', '', '1', 2),
(88, 3, '烤盤預熱10分鐘後，將做法③放入烤箱以180℃溫度烤約12分鐘即可。', '', '', '1', 3),
(89, 1, '牛五花肉片', '240g', '', '', 0),
(89, 1, '木棉豆腐', '360g ', '', '', 1),
(89, 1, '蔥', '80g', '', '', 2),
(89, 1, '蒟蒻絲', '130g ', '', '', 3),
(89, 1, '紅蘿蔔', '80g ', '', '', 4),
(89, 1, '洋蔥 ', '90g ', '', '', 5),
(89, 1, '水', '560c.c. ', '', '', 6),
(89, 2, '「ほんだし ®/烹大師®」鰹魚風味 ', '1小匙 ', '', '0', 0),
(89, 2, '酒', '3大匙', '', '0', 1),
(89, 2, '醬油', '3大匙', '', '0', 2),
(89, 2, '砂糖', '2又1/2大匙', '', '0', 3),
(89, 3, '木棉豆腐切塊、蔥斜切片、紅蘿蔔切粗絲、洋蔥對切成八等分。', '', '', '1', 0),
(89, 3, '鍋中放入560c.c.的水、「ほんだし ®/烹大師®」鰹魚風味及其他調味料，煮沸後，再將做法①及全部的食材一起放入鍋中，熬煮至入味即可起鍋。', '', '', '1', 1),
(90, 1, '鰈魚魚片', '200g', '', '', 0),
(90, 1, '鴻喜菇', '100g', '', '', 1),
(90, 1, '蔥', '1支', '', '', 2),
(90, 1, '鴨兒芹', '60g  ', '', '', 3),
(90, 1, '日式酸梅', '4顆', '', '', 4),
(90, 1, '豆苗', '少許', '', '', 5),
(90, 1, '薑片', '15g', '', '', 6),
(90, 2, '「ほんだし ®/烹大師®」鰹魚風味', '2小匙 ', '', '0', 0),
(90, 2, '味醂', '2又2/3大匙 ', '', '0', 1),
(90, 2, '醬油', '1大匙', '', '0', 2),
(90, 3, '在鰈魚魚皮上劃上幾刀。鴻喜菇分成小朵。將蔥、鴨兒芹切約4cm長。酸梅去子。', '', '', '1', 0),
(90, 3, '鍋中放入水，煮沸後加入薑片、「ほんだし ®/烹大師®」鰹魚風味及其他的調味料，再加入鴻喜菇、蔥、酸梅一起熬煮。', '', '', '1', 1),
(90, 3, '待做法②沸騰後，放入鰈魚熬煮。再次沸騰後，加入鴨兒芹稍稍燉煮。', '', '', '1', 2),
(90, 3, '將豆苗鋪在餐盤上，再盛上做法③即可。', '', '', '1', 3),
(91, 1, '雞腿肉', '2隻 ', '', '', 0),
(91, 1, '蓮藕', '10cm', '', '', 1),
(91, 1, '牛蒡', '2/3支', '', '', 2),
(91, 1, '小青椒', '12根', '', '', 3),
(91, 1, '紅甜椒', '1顆', '', '', 4),
(91, 1, '昆布', '12cm', '', '', 5),
(91, 1, '地瓜粉', '2大匙 ', '', '', 6),
(91, 1, '乾燥紅辣椒', '4根', '', '', 7),
(91, 1, '水', '500c.c. ', '', '', 8),
(91, 2, '「ほんだし ®/烹大師®」鰹魚風味', '1小匙', '', '0', 0),
(91, 2, '鹽', '1/2小匙', '', '0', 1),
(91, 2, '醋', '4大匙', '', '0', 2),
(91, 2, '味醂', '2大匙', '', '0', 3),
(91, 2, '醬油', '3大匙', '', '0', 4),
(91, 3, '雞肉切成六等分。', '', '', '1', 0),
(91, 3, '牛蒡刨除外皮，切約6~7cm的片狀。蓮藕刨除外皮，切厚約7~8mm的輪狀。', '', '', '1', 1),
(91, 3, '小青椒以竹籤戳幾個小洞備用。紅甜椒切片。', '', '', '1', 2),
(91, 3, '鍋中放入乾燥紅辣椒4根、水500c.c.、「ほんだし ®/烹大師®」鰹魚風味及其他的調味料等，待沸騰後加入昆布一起熬煮，製成南蠻醬汁備用。', '', '', '1', 3),
(91, 3, '做法①沾取些許地瓜粉並與做法②＆做法③依序以中溫油炸撈起瀝乾後，以做法④醃漬約半天至一天即可。', '', '', '1', 4),
(92, 1, '豬五花', '200g', '', '', 0),
(92, 1, '白菜', '640g', '', '', 1),
(92, 1, '水', '400c.c.', '', '', 2),
(92, 2, '「ほんだし ®/烹大師®」鰹魚風味', '1/3小匙', '', '0', 0),
(92, 2, '淡口醬油', '180c.c.', '', '0', 1),
(92, 2, '味醂', '150c.c.', '', '0', 2),
(92, 2, '酒', '80c.c.', '', '0', 3),
(92, 3, '白菜切段備用。', '', '', '1', 0),
(92, 3, '將水放入鍋中、再加入「ほんだし ®/烹大師®」鰹魚風味及其他調味料，待煮沸後，依序放入豬五花、白菜心、白菜葉，煮至食材熟軟即可。', '', '', '1', 1),
(93, 1, '獅魚', '4片', '', '', 0),
(93, 1, '蕪菁', '4顆', '', '', 1),
(93, 1, '紅辣椒片', '少許', '', '', 2),
(93, 2, '醬油,酒,味醂', '3大匙,3大匙,3大匙', ',,', '0,0,0', 0),
(93, 2, '「ほんだし ®/烹大師®」鰹魚風味,醋,砂糖,鹽', '少許,3大匙 ,1大匙,1/3小匙', ',,,', '0,0,0,0', 1),
(93, 3, '充分混合調味料Ⓐ，加入獅魚醃漬約10分鐘。', '', '', '1', 0),
(93, 3, '蕪菁刨除外皮，切約4cm厚片，在切面上以刀深刻縱橫交錯的紋路，灑上少許鹽，再以調味料Ⓑ及紅辣椒片醃漬，製成日式菊花蕪菁。', '', '', '1', 1),
(93, 3, '熱油鍋以大火煎做法1獅魚的魚皮面，魚肉部份以小火煎熟，盛盤。將做法①的醬汁再次加熱後淋上獅魚，並加上做法②一起上桌即可。', '', '', '1', 2),
(94, 1, '雞腿肉', '2片(220g)', '', '', 0),
(94, 1, '蛋液', '2顆 ', '', '', 1),
(94, 1, '蕃茄', '1顆', '', '', 2),
(94, 1, '美乃滋 ', '130g ', '', '', 3),
(94, 1, '萵苣', '1/2顆', '', '', 4),
(94, 1, '麵粉', '50g', '', '', 5),
(94, 1, '水煮蛋,醃蕗蕎,醃黃瓜', '1顆,5顆,1條', '', '', 6),
(94, 2, '「ほんだし ®/烹大師®」鰹魚風味,胡椒', '1小匙,少許', ',', '0,0', 0),
(94, 2, '「ほんだし ®/烹大師®」鰹魚風味,醬油,醋,砂糖', '1小匙,4大匙,4大匙,4大匙', ',,,', '0,0,0,0', 1),
(94, 3, '雞腿肉每一片切成六等分，灑上調味料Ⓐ後，充分拌揉約10~15分鐘。', '', '', '1', 0),
(94, 3, '鍋中放入調味料Ⓑ，以小火煮成醬汁。', '', '', '1', 1),
(94, 3, '將材料Ⓐ切成碎丁，再與美乃滋充分攪拌製成塔塔醬。', '', '', '1', 2),
(94, 3, '做法①輕灑上麵粉後再沾取蛋液，以約165℃的中溫油炸約4分鐘即可。', '', '', '1', 3),
(94, 3, '油炸好的做法④，淋上做法②充分醃漬後，盛盤，放上切好的萵苣＆蕃茄，淋上塔塔醬即可。', '', '', '1', 4),
(95, 1, '豬五花肉塊', '800g', '', '', 0),
(95, 1, '菠菜', '200g', '', '', 1),
(95, 1, '薑片', '1小塊', '', '', 2),
(95, 1, '黃芥末', '少許', '', '', 3),
(95, 1, '水', '1000c.c.', '', '', 4),
(95, 2, '「ほんだし ®/烹大師®」鰹魚風味', '2小匙', '', '0', 0),
(95, 2, '砂糖', '4又2/3大匙 ', '', '0', 1),
(95, 2, '醬油', '5大匙', '', '0', 2),
(95, 2, '酒', '5大匙', '', '0', 3),
(95, 2, '鹽', ' 1/2小匙', '', '0', 4),
(95, 3, '維持豬五花肉塊狀放入熱水中，以小火煮約2小時至熟軟後，熄火將之冷卻。待五花肉冷卻後切約4cm X 5cm大小的塊狀。', '', '', '1', 0),
(95, 3, '鍋中放入1000c.c.的水、薑片、「ほんだし ®/烹大師®」鰹魚風味及其他調味料，再將做法① 的五花肉放入鍋中，以小火一起熬煮約1小時至五花肉入味。', '', '', '1', 1),
(95, 3, '菠菜汆燙過後，切約4cm長備用。', '', '', '1', 2),
(95, 3, '將做法②的豬五花與做法③的菠菜一起盛盤，再淋上做法②中所熬煮的湯汁，最後附上黃芥末即可。', '', '', '1', 3),
(96, 1, '雞絞肉', '160g', '', '', 0),
(96, 1, '馬鈴薯', '320g', '', '', 1),
(96, 1, '紅蘿蔔', '80g', '', '', 2),
(96, 1, '洋蔥', '80g', '', '', 3),
(96, 1, '水', '560c.c.', '', '', 4),
(96, 2, '「ほんだし ®/烹大師®」鰹魚風味', '1小匙', '', '0', 0),
(96, 2, '酒', '4又2/3大匙', '', '0', 1),
(96, 2, '味醂', '4又2/3大匙', '', '0', 2),
(96, 2, '醬油', '2又2/3大匙', '', '0', 3),
(96, 3, '將馬鈴薯、紅蘿蔔以滾刀切成塊狀備用。再將洋蔥對切成八等分。', '', '', '1', 0),
(96, 3, '鍋中放入水、全部的材料、「ほんだし ®/烹大師®」鰹魚風味及其他的調味料，一起熬煮。', '', '', '1', 1),
(96, 3, '將食材煮至入味，即可熄火盛盤。', '', '', '1', 2),
(98, 1, '鱈魚片', '520g', '', '', 0),
(98, 1, '紅蘿蔔', '800g', '', '', 1),
(98, 1, '牛蒡', '牛蒡', '', '', 2),
(98, 1, '水', '1000c.c.', '', '', 3),
(98, 2, '「ほんだし ®/烹大師®」鰹魚風味', '1小匙', '', '0', 0),
(98, 2, '酒', '6又2/3大匙', '', '0', 1),
(98, 2, '味醂', '5又1/3大匙 ', '', '0', 2),
(98, 2, '醬油', '4大匙', '', '0', 3),
(98, 3, '將紅蘿蔔、牛蒡以滾刀切塊狀；鱈魚切片備用。', '', '', '1', 0),
(98, 3, '在鍋中加入水、「ほんだし ®/烹大師®」鰹魚風味及其他調味料，再將全部的食材一起放入熬煮至入味即可。', '', '', '1', 1),
(99, 1, '雞肉丸', '400  g', '', '', 0),
(99, 1, '鴻喜菇', '120  g', '', '', 1),
(99, 1, '荷蘭豆', '60g', '', '', 2),
(99, 1, '水', '560c.c.', '', '', 3),
(99, 2, '「ほんだし ®/烹大師®」鰹魚風味', '1/2小匙', '', '0', 0),
(99, 2, '酒', '6又2/3大匙 ', '', '0', 1),
(99, 2, '味醂', '5又1/3大匙', '', '0', 2),
(99, 2, '醬油', '3大匙', '', '0', 3),
(99, 3, '鴻喜菇去蒂、荷蘭豆汆燙過後，切約1cm長。', '', '', '1', 0),
(99, 3, '鍋中加入水、「ほんだし ®/烹大師®」鰹魚風味及其他的調味料一起煮沸後，再加入雞肉丸、鴻喜菇等食材，一起熬煮至雞肉丸入味。', '', '', '1', 1),
(99, 3, '盛盤後，撒上荷蘭豆即可。', '', '', '1', 2),
(100, 1, '鯖魚 ', '8隻', '', '', 0),
(100, 1, '油菜花', '8支', '', '', 1),
(100, 1, '紅蘿蔔', '100g', '', '', 2),
(100, 1, '洋蔥', '1/2顆', '', '', 3),
(100, 1, '水', '500c.c.', '', '', 4),
(100, 2, '麵粉', '2大匙 ', '', '0', 0),
(100, 2, '「ほんだし ®/烹大師®」鰹魚風味,醋,醬油,砂糖,鹽', '2小匙,250c.c.,125c.c. ,4大匙,少許', ',,,,', '0,0,0,0,0', 1),
(100, 3, '去除油菜花的硬莖，以熱水汆燙備用。洋蔥切絲，厚約3mm寬。紅蘿蔔切細絲、長約4cm即可。', '', '', '1', 0),
(100, 3, '將水、調味料Ⓐ充分混合、製成南蠻醬汁。', '', '', '1', 1),
(100, 3, '將處理過後的鯖魚裹上麵粉，以175℃的熱油油炸，再浸泡至做法②中，浸漬時間約一個晚上。', '', '', '1', 2),
(100, 3, '快炒洋蔥及紅蘿蔔後，將食材浸泡至做法②中，浸漬時間約一個晚上。', '', '', '1', 3),
(100, 3, '食用前的30分鐘~1小時，先將油菜花浸漬在做法②中。', '', '', '1', 4),
(100, 3, '待食用時，再將浸漬在做法②中的食材取出擺盤即可。', '', '', '1', 5),
(101, 1, '花枝', '1隻', '', '', 0),
(101, 1, '高麗菜', '1/2顆', '', '', 1),
(101, 1, '洋蔥,青蔥,韓式青椒,韓式紅椒,紅蘿蔔', '1顆,3支,2顆,1顆,1條', '', '', 2),
(101, 1, '蒜片', '1大匙', '', '', 3),
(101, 1, '芝麻 ', '2大匙', '', '', 4),
(101, 1, '薑末', '1大匙', '', '', 5),
(101, 1, '白飯', '4碗', '', '', 6),
(101, 2, '「ほんだし ®/烹大師®」鰹魚風味', '1小匙', '', '0', 0),
(101, 2, '醬油', '4大匙', '', '0', 1),
(101, 2, '韓國辣椒粉', '2大匙', '', '0', 2),
(101, 2, '韓國辣椒醬', '2大匙', '', '0', 3),
(101, 2, '糖', '1大匙', '', '0', 4),
(101, 2, '黑胡椒粉', '1/2小匙', '', '0', 5),
(101, 2, '香油', '2大匙', '', '0', 6),
(101, 3, '將花枝洗淨、並切成易入口大小。', '', '', '1', 0),
(101, 3, '高麗菜洗淨、切絲。', '', '', '1', 1),
(101, 3, '將洋蔥、青蔥、韓式青紅椒、紅蘿蔔切絲備用。', '', '', '1', 2),
(101, 3, '將全部的調味料與及材料Ⓐ充分混合，製成醬料。', '', '', '1', 3),
(101, 3, '熱油鍋爆香薑末，再加入做法①快炒約30秒。再加入做法③持續翻炒後，倒入做法④充分攪拌。', '', '', '1', 4),
(101, 3, '上桌前將高麗菜絲鋪在底層，再放上做法⑤並附上白飯即可。', '', '', '1', 5),
(102, 1, '小馬鈴薯', '450  g', '', '', 0),
(102, 1, '乾辣椒片', '2支', '', '', 1),
(102, 1, '大蒜', '10小瓣', '', '', 2),
(102, 1, '芝麻,大蒜末,水', '1小匙,2大匙,200c.c.', '', '', 3),
(102, 2, '香油', '2大匙', '', '0', 0),
(102, 2, '「ほんだし ®/烹大師®」鰹魚風味,醬油,糖,玉米糖漿,味醂', '1大匙,4大匙,2大匙,2大匙,3大匙', ',,,,', '0,0,0,0,0', 1),
(102, 3, '挑選出易入口大小的馬鈴薯洗淨瀝乾。', '', '', '1', 0),
(102, 3, '將調味料Ⓐ及【材料A】充分混合後，以細火慢熬成醬汁備用。', '', '', '1', 1),
(102, 3, '熱鍋以香油爆香乾辣椒，以小火慢煎製成辣椒油。', '', '', '1', 2),
(102, 3, '加入做法① 慢慢翻炒至金黃色後，加入做法 ②與大蒜，蓋上鍋蓋燜煮。', '', '', '1', 3),
(102, 3, '慢慢攪拌做法④，待湯汁變濃稠後即可上桌。', '', '', '1', 4),
(104, 1, '醃泡菜', '450  g', '', '', 0),
(104, 1, '德式香腸', '120g', '', '', 1),
(104, 1, '豬肉', '120g', '', '', 2),
(104, 1, '豆腐 ', '1盒', '', '', 3),
(104, 1, '青蔥', '1支', '', '', 4),
(104, 1, '蒜末', ' 1大匙', '', '', 5),
(104, 1, '水', ' 600c.c.', '', '', 6),
(104, 2, '「ほんだし ®/烹大師®」鰹魚風味', '1大匙', '', '0', 0),
(104, 2, '韓國辣椒粉', '4大匙', '', '0', 1),
(104, 2, '鹽', '少許', '', '0', 2),
(104, 3, '以手擦拭掉泡菜上的多餘水分並切成段。', '', '', '1', 0),
(104, 3, '青蔥、德式香腸、豬肉、豆腐切成易入口大小。', '', '', '1', 1),
(104, 3, '熱鍋後，放入豬肉與泡菜迅速翻炒，並依序加入蒜末、韓國辣椒粉、「ほんだし ®/烹大師®」鰹魚風味、德式香腸、水等，充分攪拌過後煮至沸騰。', '', '', '1', 2),
(104, 3, '熬煮至泡菜熟軟後，續加入豆腐、青蔥與鹽稍做調味即可。', '', '', '1', 3),
(105, 1, '雞蛋麵', '450g', '', '', 0),
(105, 1, '薑片', '1片', '', '', 1),
(105, 1, '乾辣椒', '3支', '', '', 2),
(105, 1, '章魚', '1隻', '', '', 3),
(105, 1, '鮮蚵', '16顆', '', '', 4),
(105, 1, '鮮蝦', '8隻', '', '', 5),
(105, 1, '大白菜葉', '8片', '', '', 6),
(105, 1, '洋蔥', '1顆', '', '', 7),
(105, 1, '青蔥', '2支', '', '', 8),
(105, 1, '玉米油', '2大匙', '', '', 9),
(105, 1, '蒜末', '1大匙', '', '', 10),
(105, 1, '水', '1600c.c.', '', '', 11),
(105, 2, '「ほんだし ®/烹大師®」鰹魚風味', '1大匙', '', '0', 0),
(105, 2, '韓式辣椒粉', '4大匙', '', '0', 1),
(105, 2, '醬油', '2大匙', '', '0', 2),
(105, 2, '香油', '4大匙', '', '0', 3),
(105, 2, '味醂', '1大匙', '', '0', 4),
(105, 2, '鹽', '2大匙', '', '0', 5),
(105, 2, '黑胡椒粉', '1小匙', '', '0', 6),
(105, 3, '章魚洗淨切塊備用。', '', '', '1', 0),
(105, 3, '大白菜葉、洋蔥、青蔥切成易入口大小。乾辣椒切片備用。', '', '', '1', 1),
(105, 3, '將全部的調味料與大蒜末充分混合製成醬汁備用。', '', '', '1', 2),
(105, 3, '熱鍋以玉米油爆香薑片與乾辣椒，以中火慢慢翻炒製成辣椒油。', '', '', '1', 3),
(105, 3, '做法④中加入做法②的蔬菜及做法③的醬汁慢慢攪拌並加入水，熬煮成湯汁。', '', '', '1', 4),
(105, 3, '最後加入章魚、鮮蚵、鮮蝦及雞蛋麵，待煮熟後即可上桌。', '', '', '1', 5),
(106, 1, '烏龍麵', '450g', '', '', 0),
(106, 1, '豬五花', '450g', '', '', 1),
(106, 1, '馬鈴薯', '2顆', '', '', 2),
(106, 1, '洋蔥', '2顆', '', '', 3),
(106, 1, '紅蘿蔔', '1條', '', '', 4),
(106, 1, '薑', '1小塊', '', '', 5),
(106, 1, '水', '1000c.c.', '', '', 6),
(106, 1, '小黃瓜', '1條', '', '', 7),
(106, 1, '青蔥', '1支', '', '', 8),
(106, 1, '玉米糊 :,水,玉米粉', ',6大匙,2大匙', '', '', 9),
(106, 2, '「ほんだし ®/烹大師®」鰹魚風味', '1大匙', '', '0', 0),
(106, 2, '韓式黑豆瓣醬', '230  g', '', '0', 1),
(106, 2, '糖', '2大匙', '', '0', 2),
(106, 2, '醬油', '2大匙', '', '0', 3),
(106, 2, '香油', '2大匙', '', '0', 4),
(106, 2, '味醂', '1大匙', '', '0', 5),
(106, 3, '豬五花、馬鈴薯、洋蔥、紅蘿蔔切成小丁。薑切成片。', '', '', '1', 0),
(106, 3, '小黃瓜、青蔥切絲。', '', '', '1', 1),
(106, 3, '汆燙過後的烏龍麵置於碗中。', '', '', '1', 2),
(106, 3, '將全部的調味料及200c.c.的水充分混合製成炸醬麵醬汁備用。', '', '', '1', 3),
(106, 3, '熱油鍋爆香薑片，再加入豬五花略炒至金黃色後，續加入馬鈴薯、洋蔥、紅蘿蔔等炒熟。', '', '', '1', 4),
(106, 3, '將800c.c.的水、玉米糊與做法④加入做法⑤裡，攪拌均勻。', '', '', '1', 5),
(106, 3, '上桌前將做法⑥淋在烏龍麵上，並加上做法②即可。', '', '', '1', 6),
(107, 1, '牛肉', '120  g', '', '', 0),
(107, 1, '蛤蜊 ', '120g', '', '', 1),
(107, 1, '蕪菁', '120g', '', '', 2),
(107, 1, '洋蔥', '120g', '', '', 3),
(107, 1, '青蔥', '2支', '', '', 4),
(107, 1, '韓式青椒', '2顆', '', '', 5),
(107, 1, '韓式紅椒', '1顆', '', '', 6),
(107, 1, '南瓜', '240g', '', '', 7),
(107, 1, '豆腐', '1盒', '', '', 8),
(107, 1, '大蒜丁', '1大匙', '', '', 9),
(107, 1, '水', '800c.c.', '', '', 10),
(107, 2, '「ほんだし ®/烹大師®」鰹魚風味', '1大匙', '', '0', 0),
(107, 2, '韓式豆瓣醬', '4大匙', '', '0', 1),
(107, 3, '蛤蜊浸泡鹽水、吐沙備用。', '', '', '1', 0),
(107, 3, '青蔥切段。', '', '', '1', 1),
(107, 3, '將牛肉、蕪菁、洋蔥、南瓜、豆腐切成易入口大小。', '', '', '1', 2),
(107, 3, '韓式青椒、紅椒切成約5cm大小的輪狀。', '', '', '1', 3),
(107, 3, '倒水入鍋中、並依序加入牛肉、蕪菁、韓式豆瓣醬、大蒜丁及「ほんだし ®/烹大師®」鰹魚風味。', '', '', '1', 4),
(107, 3, '待做法⑤沸騰後，加入做法①。', '', '', '1', 5),
(107, 3, '再次沸騰後，再加入洋蔥、青蔥、南瓜、豆腐及做法④等材料，煮至食材入味即可。', '', '', '1', 6),
(108, 1, '韓式泡菜', '2杯', '', '', 0);
INSERT INTO `recipepro_detail` (`recipepro_id`, `class`, `names`, `contents`, `links`, `blanks`, `list_order`) VALUES
(108, 1, '花枝', '450g', '', '', 1),
(108, 1, '蛋', '2顆', '', '', 2),
(108, 1, '芝蔴', '1大匙', '', '', 3),
(108, 1, '水', '600c.c.', '', '', 4),
(108, 2, '「ほんだし ®/烹大師®」鰹魚風味,糖,鹽,辣豆瓣醬,韓國辣椒粉,油,麵粉,糯米粉', '1大匙,1小匙,1小匙,1大匙,1大匙,2大匙,2杯,1杯', ',,,,,,,', '0,0,0,0,0,0,0,0', 0),
(108, 2, '醬油,韓國辣椒粉,糖,香油,檸檬汁', '4大匙,1大匙,1大匙,1大匙,4大匙', ',,,,', '0,0,0,0,0', 1),
(108, 3, '充分混合調味料Ⓑ與芝蔴製成沾醬備用。', '', '', '1', 0),
(108, 3, '泡菜與花枝切成易入口大小。', '', '', '1', 1),
(108, 3, '將調味料Ⓐ、蛋、水、做法②充分混合。', '', '', '1', 2),
(108, 3, '熱油鍋後，倒入做法③至鍋中，將煎餅兩面煎至金黃色即可起鍋，並搭配做法①的沾醬一起上桌。', '', '', '1', 3),
(109, 1, '鮮干貝', '10顆', '', '', 0),
(109, 1, '小玉米筍', '4支', '', '', 1),
(109, 1, '綠花椰菜', '20g(約4朵)', '', '', 2),
(109, 1, '鴻禧菇', '40g', '', '', 3),
(109, 1, '美白菇', '40g', '', '', 4),
(109, 1, '紅蘿蔔', '30g', '', '', 5),
(109, 1, '甜豆仁', '30g', '', '', 6),
(109, 1, '白果', '20g', '', '', 7),
(109, 2, '「ほんだし ®/烹大師®」干貝風味', '1/2小匙', '', '0', 0),
(109, 2, '開水', '50c.c.', '', '0', 1),
(109, 2, '胡椒', '5g', '', '0', 2),
(109, 2, '鹽巴', '3g', '', '0', 3),
(109, 2, '奶油', '40g', '', '0', 4),
(109, 2, '米酒', '10c.c.', '', '0', 5),
(109, 2, '橄欖油', '10c.c.', '', '0', 6),
(109, 3, '干貝洗淨，以胡椒、米酒和少許「ほんだし ®/烹大師®」干貝風味醃漬，再將表面水份吸乾。', '', '', '1', 0),
(109, 3, '所有蔬菜洗淨，切成適當形狀，白果汆燙後備用。', '', '', '1', 1),
(109, 3, '熱鍋塗上少許橄欖油，放入干貝將雙面煎至上色後取出。', '', '', '1', 2),
(109, 3, '煎過干貝的鍋子，加入所有蔬菜，加入開水與「ほんだし ®/烹大師®」干貝風味，蓋上鍋蓋， 開中火等待三分鐘，打開鍋蓋，放入煎過的干貝後，蓋鍋再燜燒一分鐘，開蓋後加入奶油與鹽巴拌勻即可。', '', '', '1', 3),
(111, 1, '鱸魚菲力', '50g', '', '', 0),
(111, 1, '花枝', '1/2隻', '', '', 1),
(111, 1, '蛤蜊', '6顆', '', '', 2),
(111, 1, '草蝦', '6隻', '', '', 3),
(111, 1, '馬鈴薯丁', '30g', '', '', 4),
(111, 1, '西洋芹丁', '30g', '', '', 5),
(111, 1, '紅蘿蔔丁', '30g', '', '', 6),
(111, 1, '洋蔥丁', '30g', '', '', 7),
(111, 1, '小蕃茄', '6顆', '', '', 8),
(111, 1, '蒜頭碎', '10g', '', '', 9),
(111, 1, '紅牛蕃茄', '2顆', '', '', 10),
(111, 1, '奶油', '40g', '', '', 11),
(111, 1, '開水', '1000c.c.', '', '', 12),
(111, 2, '「ほんだし ®/烹大師®」干貝風味', '5g', '', '0', 0),
(111, 2, '白酒', '30c.c.', '', '0', 1),
(111, 2, '白胡椒', '5g', '', '0', 2),
(111, 2, '月桂葉', '1片', '', '0', 3),
(111, 2, '蕃茄醬', '80g', '', '0', 4),
(111, 2, '起司粉', '30g', '', '0', 5),
(111, 2, '九層塔', '適量', '', '0', 6),
(111, 2, '起司餅', '裝飾用', '', '0', 7),
(111, 3, '鱸魚切塊、花枝切花刀、草蝦開背去除腸泥以少許「ほんだし ®/烹大師®」干貝風味、白胡椒、白酒醃漬。', '', '', '1', 0),
(111, 3, '牛蕃茄切塊，小蕃茄切半備用。', '', '', '1', 1),
(111, 3, '熱鍋加入奶油，鱸魚取出擦乾，皮面朝下煎脆後取出，接續炒香蒜頭碎、洋蔥丁、西洋芹丁、紅蘿蔔丁、馬鈴薯丁至香軟，接續放入蕃茄丁炒至軟爛，再加入蕃茄醬炒香。', '', '', '1', 2),
(111, 3, '做法③加入開水與「ほんだし ®/烹大師®」干貝風味， 一起熬煮約5分鐘至蔬菜熟透，再放入所有海鮮與月桂葉熬煮5分鐘，起鍋灑入起司粉與白胡椒並以九層塔、起司餅、小蕃茄裝飾。', '', '', '1', 3),
(113, 1, '鯛魚片', '1/2塊', '', '', 0),
(113, 1, '洋蔥', '30g', '', '', 1),
(113, 1, '洋菇', '5顆', '', '', 2),
(113, 1, '杏鮑菇', '2支', '', '', 3),
(113, 1, '芥藍菜', '30g', '', '', 4),
(113, 1, '黃甜椒', '1/2顆', '', '', 5),
(113, 1, '紅甜椒', '1/2顆', '', '', 6),
(113, 1, '牛奶', '100c.c.', '', '', 7),
(113, 1, '熟天使麵', '120g', '', '', 8),
(113, 1, '奶油 ', '50g', '', '', 9),
(113, 2, '「ほんだし ®/烹大師®」干貝風味', '5g', '', '0', 0),
(113, 2, '白酒 ', '50c.c.', '', '0', 1),
(113, 2, '鮮奶油', '50c.c.', '', '0', 2),
(113, 2, '胡椒', '3g', '', '0', 3),
(113, 2, '鹽巴', '3g', '', '0', 4),
(113, 2, '香料麵包沾粉：,麵包粉,巴西利末,蛋黃液', ',50g,10g,1顆', ',,,', '0,0,0,0', 5),
(113, 3, '鯛魚洗淨，切粗條，以少許「ほんだし ®/烹大師®」干貝風味、胡椒、白酒醃漬。', '', '', '1', 0),
(113, 3, '將所有菇類與蔬菜切成細絲，備用。', '', '', '1', 1),
(113, 3, '乾鍋加入奶油，加熱炒香洋蔥絲、洋菇絲、杏鮑菇絲至香軟，加入白酒加熱濃縮，再放入牛奶與鮮奶油，並加入「ほんだし ®/烹大師®」干貝風味一起煮，待醬汁濃縮至2/3，接續放入甜椒絲與芥藍菜絲，並加入天使麵拌', '', '', '1', 2),
(113, 3, '混合麵包粉與巴西利末成為香料麵包粉，取出鯛魚片，先沾上蛋黃液，再沾上香料麵包粉，放入170℃油鍋炸至表面金黃後取出，放在炒好的香蕈芥藍天使麵即可。', '', '', '1', 3),
(114, 1, '豬絞肉', '100g', '', '', 0),
(114, 1, '蝦仁', '150g ', '', '', 1),
(114, 1, '玉米粒', '20g', '', '', 2),
(114, 1, '荸薺末', '20g ', '', '', 3),
(114, 1, '米酒', '10c.c.', '', '', 4),
(114, 1, '芹菜末', '20g', '', '', 5),
(114, 2, '「ほんだし ®/烹大師®」干貝風味', '6g', '', '0', 0),
(114, 2, '開水', '200c.c.', '', '0', 1),
(114, 2, '吉利丁片', '6片', '', '0', 2),
(114, 3, '吉利丁泡冰水軟化後取出瀝乾水份，開水加入「ほんだし ®/烹大師®」干貝風味開火煮熱，加入吉利丁成為干貝凍溶液，倒入盤中冷卻成凍，再搗成碎狀。', '', '', '1', 0),
(114, 3, '將蝦仁擦乾水份，取1/2剁成碎狀，另1/2切成丁，芹菜、荸薺切成末。', '', '', '1', 1),
(114, 3, '將豬絞肉與做法②所有材料一起拌和，並加入米酒充分攪拌，最後加入干貝凍與玉米粒成為餃子餡，以水餃皮包成水餃備用。', '', '', '1', 2),
(114, 3, '煮一鍋熱水，待沸騰後，放入干貝水餃煮至浮至水面，再加入一碗冷水，等待水餃再度浮起即可撈出享用。', '', '', '1', 3),
(116, 1, '黑柿蕃茄', '1800g', '', '', 0),
(116, 1, '土雞', '1隻', '', '', 1),
(116, 1, '蛤蜊', '600g', '', '', 2),
(116, 1, '薑片', '2片', '', '', 3),
(116, 1, '蔥', '1支', '', '', 4),
(116, 1, '水', '1000c.c.', '', '', 5),
(116, 2, '「ほんだし ®/烹大師®」雞粉', '1小匙', '', '0', 0),
(116, 2, '「ほんだし ®/烹大師®」干貝風味', '1小匙', '', '0', 1),
(116, 2, '米酒', '1小匙', '', '0', 2),
(116, 2, '鹽', '1小匙', '', '0', 3),
(116, 3, '土雞剖背汆燙去血水，放入湯鍋中，加入適量的水及薑片、蔥、米酒再放入電鍋中蒸70分鐘。', '', '', '1', 0),
(116, 3, '蕃茄外皮劃刀，放入滾水中汆燙去掉外膜後切塊。', '', '', '1', 1),
(116, 3, '蕃茄與蒸好的雞連湯一同放入砂鍋中，小火熬煮30分鐘，「ほんだし ®/烹大師®」雞粉、「ほんだし ®/烹大師®」干貝風味、 鹽調味即可。', '', '', '1', 2),
(116, 3, '※美味方程式：冷熱食用皆美味。', '', '', '1', 3),
(117, 1, '冷凍鱸魚清肉', '1片', '', '', 0),
(117, 1, '湖南剁椒', '2大匙', '', '', 1),
(117, 1, '蒜末', '少許', '', '', 2),
(117, 1, '薑末', '少許', '', '', 3),
(117, 1, '蔥花', '少許', '', '', 4),
(117, 2, '「ほんだし ®/烹大師®」昆布風味', '1小匙      ', '', '0', 0),
(117, 2, '「ほんだし ®/烹大師®」雞粉', '1/2大匙', '', '0', 1),
(117, 2, '豆豉', '1大匙', '', '0', 2),
(117, 2, '香油', '1大匙', '', '0', 3),
(117, 2, '糖', '1小匙', '', '0', 4),
(117, 2, '特製辣油', '3大匙', '', '0', 5),
(117, 2, '米酒', '1大匙', '', '0', 6),
(117, 3, '鱸魚肉上抹上「ほんだし ®/烹大師®」昆布風味醃4小時。', '', '', '1', 0),
(117, 3, '將魚肉斜切成片狀，每2片捲成花朵狀。', '', '', '1', 1),
(117, 3, '「ほんだし ®/烹大師®」雞粉、湖南剁椒、蒜末、薑末、豆豉(需剁碎) 、香油、特製辣油、米酒、糖拌勻後淋在鱸魚肉上，蒸5分鐘後取出灑上蔥花即可。', '', '', '1', 2),
(118, 1, '花干', '1塊', '', '', 0),
(118, 1, '蛋', '1個', '', '', 1),
(118, 1, '海帶結', '3個', '', '', 2),
(118, 1, '海帶串', '1串', '', '', 3),
(118, 1, '豆包', '1個', '', '', 4),
(118, 1, '白靈菇', '少許', '', '', 5),
(118, 1, '大豆干', '1塊', '', '', 6),
(118, 1, '素雞', '1個', '', '', 7),
(118, 1, '四季豆', '少許', '', '', 8),
(118, 1, '綠花椰菜', '少許', '', '', 9),
(118, 2, '滷包', '', '', '0', 0),
(118, 2, '「ほんだし ®/烹大師®」雞粉', '4小匙', '', '0', 1),
(118, 2, '「AJINOMOTO PLUS」高鮮味精', '1又1/2小匙', '', '0', 2),
(118, 2, '鹽', '3小匙', '', '0', 3),
(118, 2, '糖', '2小匙', '', '0', 4),
(118, 2, '醬油', '', '', '0', 5),
(118, 3, '準備水4000c.c.，加入調味料，煮半小時。', '', '', '1', 0),
(118, 3, '待滷包出味後，依序加入食材放入滷汁中即可。', '', '', '1', 1),
(1, 1, '油麵', '300g', '', '', 1),
(1, 1, '雞腿肉', '100g', '', '', 2),
(1, 1, '魚漿製品', '100  g', '', '', 3),
(1, 1, '小白菜', '50g', '', '', 4),
(1, 1, '新鮮香菇', '40g', '', '', 5),
(1, 1, '水', '800c.c.', '', '', 6),
(1, 2, '「ほんだし ®/烹大師®」干貝風味', '1又1/2大匙', '', '0', 1),
(1, 2, '胡椒粉', '1小匙', '', '0', 2),
(1, 2, '香油', '1/2大匙', '', '0', 3),
(1, 3, '先將雞腿肉剁成小塊狀，小白菜洗淨切段，新鮮香菇表面略刻＊字痕。', '', '', '1', 0),
(1, 3, '將800c.c.的水煮開後，放入做法①的雞腿肉煮3分鐘後，再放入油麵、魚漿製品、做法①的香菇、「ほんだし ®/烹大師®」干貝風味，再煮3分鐘後放入小白菜、胡椒粉、香油，煮1分鐘即可食用。', '', '', '1', 1),
(119, 1, '熟白蝦', '8隻', '', '', 1),
(119, 1, '芹菜', '2支', '', '', 2),
(119, 1, '香菜', '5根', '', '', 3),
(119, 1, '蒜仁', '10粒', '', '', 4),
(119, 2, '水', '500c.c.', '', '0', 1),
(119, 2, '「ほんだし ®/烹大師®」雞粉,「ほんだし ®/烹大師®」干貝風味,米酒,魚露,辣椒粉,花椒粉,花椒油', '1小匙,2小匙,1大匙,1大匙,1大匙,2小匙,少許', ',,,,,,', '0,0,0,0,0,0,0', 2),
(119, 3, '蒜仁拍碎放入500c.c.水中煮10分鐘，放入芹菜段與香菜末煮3分鐘，再加入調味料Ⓐ 進行調味。', '', '', '1', 0),
(119, 3, '醬汁放涼後加入熟白蝦一起泡製約4小時。', '', '', '1', 1),
(119, 3, '熟白蝦擺入盤中、淋上醬汁即可食用。', '', '', '1', 2),
(119, 3, '※美味方程式：浸泡後更美味。', '', '', '1', 3),
(17, 1, '雞胸肉', '200  g', '', '', 1),
(17, 1, '綠花椰菜', '200  g', '', '', 2),
(17, 1, '杏鮑菇', '200  g', '', '', 3),
(17, 1, '蔥', '3根', '', '', 4),
(17, 1, '薑', '40  g', '', '', 5),
(17, 1, '辣椒', '1根', '', '', 6),
(17, 2, '「ほんだし ®/烹大師®」干貝風味,胡椒粉,紹興酒,蛋白,香油,太白粉', '1小匙,1/2小匙 ,1大匙,1/2顆,1小匙,1/2大匙', ',,,,,', '0,0,0,0,0,0', 1),
(17, 2, '「ほんだし ®/烹大師®」干貝風味', '1大匙', '', '0', 2),
(17, 2, '紹興酒', '1大匙', '', '0', 3),
(17, 2, '香油', '1小匙', '', '0', 4),
(17, 3, '雞胸肉切片狀，先以調味料Ⓐ抓醃過，再過油備用。', '', '', '1', 0),
(17, 3, '綠花椰菜切小朶狀再燙熟備用。杏鮑菇切滾刀塊，蔥切段，薑及辣椒切片狀。', '', '', '1', 1),
(17, 3, '鍋内放入1大匙油，先爆香蔥、薑、辣椒，再放入杏鮑菇炒勻。', '', '', '1', 2),
(17, 3, ' 熗入紹興酒後，放入雞胸肉、綠花椰菜、「ほんだし ®/烹大師®」干貝風味拌炒勻，滴入香油拌勻即可。', '', '', '1', 3),
(83, 1, '透抽(中卷) ', '300g', '', '', 1),
(83, 1, '馬鈴薯', '1/2顆', '', '', 2),
(83, 1, '紫山藥', '25g', '', '', 3),
(83, 1, '土雞蛋', '1顆', '', '', 4),
(83, 1, '紅蘿蔔', '25g', '', '', 5),
(83, 1, '小黃瓜', '25g', '', '', 6),
(83, 1, '菠菜', '37.5g', '', '', 7),
(83, 1, '海苔片', '1/2張', '', '', 8),
(83, 2, '白醋,糖', '2大匙,2大匙', ',', '0,0', 1),
(83, 2, '「ほんだし ®/烹大師®」鰹魚風味,鹽,胡椒粉,太白粉', '1小匙,1/2小匙,少許,15g', ',,,', '0,0,0,0', 2),
(83, 3, '紫山藥、紅蘿蔔、小黃瓜切長條汆燙後，以調味料Ⓐ醃約10分鐘。', '', '', '1', 0),
(83, 3, '全雞蛋煎成蛋皮切長條備用、菠菜汆燙。', '', '', '1', 1),
(83, 3, '透抽洗淨去內臟備用。', '', '', '1', 2),
(83, 3, '馬鈴薯蒸熟打成泥後，加上調味料Ⓑ。', '', '', '1', 3),
(83, 3, '將菠菜攤開後鋪上馬鈴薯泥，再鋪上海苔片及其他材料。', '', '', '1', 4),
(83, 3, '做法⑤需捲起成圓柱狀，填入透抽裡、以牙籤封口，蒸約5分鐘、待涼切成圓捲片即可排盤。', '', '', '1', 5),
(120, 1, '蕃茄', '1個', '', '', 0),
(120, 1, '蛤蜊', '200  g', '', '', 1),
(120, 1, '魚片', '100  g', '', '', 2),
(120, 1, '魚丸', '5顆', '', '', 3),
(120, 1, '海帶結', '5個', '', '', 4),
(120, 1, '蔥花', '少許', '', '', 5),
(120, 1, '水', '1200c.c.', '', '', 6),
(120, 2, '「AJINOMOTO PLUS」高鮮味精', '1小匙', '', '0', 0),
(120, 2, '鹽', '1小匙', '', '0', 1),
(120, 3, '蕃茄切塊狀、魚片切片、魚丸切十字刀口備用。', '', '', '1', 0),
(120, 3, '取湯鍋倒入1200c.c.的水，水滾後放入海帶結煮5分鐘。', '', '', '1', 1),
(120, 3, '將其他材料與調味料放入鍋中一起煮，待魚片熟、蛤蜊殼開後灑上蔥花即可起鍋。', '', '', '1', 2),
(121, 1, '餡料：,豬絞肉,蔥末,薑末,紅蔥酥末', ',1000g,1大匙,1大匙,1大匙', '', '', 0),
(121, 1, '湯頭：,青江菜,芹菜末,蔥末,水', ',少許,少許,少許,1200c.c.', '', '', 1),
(121, 2, '餡料：,「AJINOMOTO PLUS」高鮮味精,鹽,白胡椒,香油', ',3小匙,1小匙,1小匙,5大匙', ',,,,', '0,0,0,0,0', 0),
(121, 2, '湯頭：,鹽,「AJINOMOTO PLUS」高鮮味精,香油', ',1小匙,1/2小匙,少許', ',,,', '0,0,0,0', 1),
(121, 3, '豬絞肉加入蔥末1大匙、薑末1大匙、紅蔥酥末1大匙拌勻，再加入餡料調味料充分拌勻至黏稠狀。', '', '', '1', 0),
(121, 3, '將餡料分別包進餛飩皮中，包好的餛飩下滾水鍋煮熟。', '', '', '1', 1),
(121, 3, '鍋中入水1200c.c.，加入鹽、「AJINOMOTO PLUS」高鮮味精煮開。', '', '', '1', 2),
(121, 3, '將煮熟的餛飩、燙好的青江菜與高湯放入碗中，最後再滴 入幾滴香油即可。', '', '', '1', 3),
(122, 1, '蛋', '1個', '', '', 0),
(122, 1, '豬肉片', '100g', '', '', 1),
(122, 1, '蝦仁', '10隻', '', '', 2),
(122, 1, '高麗菜', '200g', '', '', 3),
(122, 1, '紅蘿蔔', '50g', '', '', 4),
(122, 1, '紅辣椒', '1根', '', '', 5),
(122, 2, '「AJINOMOTO PLUS」高鮮味精', '1/4小匙', '', '0', 0),
(122, 2, '鹽', '1/4小匙', '', '0', 1),
(122, 2, '香油', '少許', '', '0', 2),
(122, 2, '太白粉', '少許', '', '0', 3),
(122, 2, '辣椒粉', '少許', '', '0', 4),
(122, 3, '高麗菜切塊、紅辣椒去籽切絲、紅蘿蔔切絲、蝦仁挑去腸泥，豬肉片加入少許太白粉及辣椒粉拌勻備用。', '', '', '1', 0),
(122, 3, '炒鍋中放一大匙油，油熱後將蛋液倒入鍋中炒香，陸續加入豬肉片、蝦仁、高麗菜、紅蘿蔔及少許的水，再加入鹽、「AJINOMOTO PLUS」高鮮味精拌炒均勻，起鍋前滴入少許香油即可。', '', '', '1', 1),
(103, 1, '泡菜', '2杯', '', '', 1),
(103, 1, '蛤蜊', '360g', '', '', 2),
(103, 1, '豆腐', '4盒', '', '', 3),
(103, 1, '大蒜', '4支', '', '', 4),
(103, 1, '蛋', '4顆', '', '', 5),
(103, 1, '水', '400c.c.', '', '', 6),
(103, 1, '蔥花,大蒜丁', '8大匙,4大匙 ', '', '', 7),
(103, 2, '鹽', '4小匙', '', '0', 1),
(103, 2, '「ほんだし ®/烹大師®」鰹魚風味,韓國辣椒粉,沙拉油,醬油,香油', '4小匙,4大匙,4大匙,4大匙,4大匙', ',,,,', '0,0,0,0,0', 2),
(103, 3, '將鹽灑至豆腐上方，稍做醃製約10分鐘。', '', '', '1', 0),
(103, 3, '蛤蜊洗淨、吐沙備用。大蒜切段。', '', '', '1', 1),
(103, 3, '將調味料Ⓐ與材料Ⓐ放入陶鍋中並充分混合，再加入已切成段的泡菜稍做拌炒。', '', '', '1', 2),
(103, 3, '在做法③中，加入豆腐、水煮至沸騰。', '', '', '1', 3),
(103, 3, '最後再加入蛤蜊、大蒜、蛋與鹽稍做調味即可。', '', '', '1', 4),
(110, 1, '豬頰肉', '1塊', '', '', 1),
(110, 1, '鮮干貝', '6顆', '', '', 2),
(110, 1, '中型蘆筍', '4支', '', '', 3),
(110, 1, '紅蘿蔔條', '1/3支', '', '', 4),
(110, 1, '高麗菜葉', '4片', '', '', 5),
(110, 1, '青花菜', '30g', '', '', 6),
(110, 1, '鮮香菇', '6朵', '', '', 7),
(110, 1, '小玉米筍', '4根', '', '', 8),
(110, 1, '吉利丁凍', '數片(100c.c.高湯對2片吉利丁)', '', '', 9),
(110, 2, '鹽巴', '5g', '', '0', 1),
(110, 2, '米酒 ', '適量', '', '0', 2),
(110, 2, '干貝高湯：,「ほんだし ®/烹大師®」干貝風味,水', ',10  g,1000c.c.', ',,', '0,0,0', 3),
(110, 2, '干貝鮮味油醋：,紅蔥頭末,蒜頭末,巴西利末,橄欖油,白醋', ',1顆,1顆,5g,50c.c.,20c.c.', ',,,,,', '0,0,0,0,0,0', 4),
(110, 3, '蔬菜洗淨後，切成適當的長條狀。', '', '', '1', 0),
(110, 3, '豬頰肉洗淨，以米酒略微醃漬，平底鍋放入少許油，煎至表面上色後，放入干貝高湯內，加蓋後中火煮約30分鐘至豬頰肉軟嫩取出切厚片。(也可使用現成的熟豬肉等)', '', '', '1', 1),
(110, 3, '用做法 ②的高湯，將所有蔬菜燙熟，鮮干貝燙1分鐘後取出。', '', '', '1', 2),
(110, 3, '做法③煮過食材的干貝高湯，以100c.c.高湯對2片吉利丁的比例，煮成干貝凍溶液略微降溫備用。', '', '', '1', 3),
(110, 3, '取適當有深度的模型，鋪上保鮮膜及高麗菜後，分層放入其它蔬菜、豬頰肉與干貝，並加入干貝凍溶液，等待冷卻後，放入冰箱冷藏2小時即可取出切片。', '', '', '1', 4),
(110, 3, '干貝鮮味油醋的所有材料，放入空瓶內，充分搖晃至乳化便可搭配凍派食用。', '', '', '1', 5),
(124, 1, '湯底材料：,蝦頭,橄欖油,香茅,檸檬葉,南薑,牛蕃茄切塊,紅辣椒切段,水', ',適量,1大匙,2支,5片,2片,2顆,1根,2500c.c.', '', '', 0),
(124, 1, '鍋物材料：,大沙公,白蝦,龍膽石斑,透抽,貽貝,蛤蠣,香菜切段,大白菜,大蔥,金針菇,糯米椒', ',1隻,4隻,4片,1隻,4個,8粒,3根,1/4顆,1支,80g,3根', '', '', 1),
(124, 2, '「ほんだし®/烹大師®」干貝風味', '20  g', '', '0', 0),
(124, 2, '「ほんだし®/烹大師®」雞粉', '10  g', '', '0', 1),
(124, 2, '細砂糖', '10  g', '', '0', 2),
(124, 2, '魚露', '10  g', '', '0', 3),
(124, 2, '泰式酸辣醬', '100  g', '', '0', 4),
(124, 2, '檸檬汁', '20  g', '', '0', 5),
(124, 3, '鍋中加入橄欖油把蝦頭炒香後，將所有湯底材料加入，煮至沸騰後，轉小火熬煮約20分鐘，放入「ほんだし®/烹大師®」干貝風味20g、「ほんだし®/烹大師®」雞粉10g與其他調味料後再次煮開，讓味道均勻融合後', '', '', '1', 0),
(124, 3, '大沙公開殼去腮幫，分切大塊狀備用。', '', '', '1', 1),
(124, 3, '依序將所有鍋物材料排入鍋中，加入做法①的湯底煮至沸騰後，放入香菜即可。', '', '', '1', 2),
(126, 1, '湯底材料：,南瓜去皮切片,紅蘿蔔切片,昆布高湯', ',400g,50g,1200c.c.', '', '', 1),
(126, 1, '鍋物材料：,娃娃菜,水菜,嫩豆腐,豆皮福袋,南瓜片,秋葵,牛蕃茄,玉米,雪白菇,杏鮑菇切片,泡發海帶芽', ',3株,100g,1塊,1個,2片,1支,2塊,50g,50  g,50  g,30  g', '', '', 2),
(126, 2, '「ほんだし®/烹大師®」昆布風味', '20  g', '', '0', 1),
(126, 2, '橄欖油', '30  g', '', '0', 2),
(126, 2, '鹽', '適量', '', '0', 3),
(126, 2, '白胡椒', '適量', '', '0', 4),
(126, 3, '昆布高湯做法：昆布30g輕輕擦拭去昆布表面的髒污，加入2公升的水浸泡約30分鐘，以中火熬煮至水沸騰前將昆布撈出備用。', '', '', '1', 0),
(126, 3, '湯底材料中的南瓜與紅蘿蔔先用一半的橄欖油小火炒出甜味，再與昆布高湯、與另一半的橄欖油放入果汁機中攪打成細緻的湯汁，倒入鍋中煮滾後加入「ほんだし®/烹大師®」昆布風味20g與其他調味成湯底備用。', '', '', '1', 1),
(126, 3, '依序將所有鍋物材料排入鍋中，加入做法② 的湯底煮至熟透即可。', '', '', '1', 2),
(128, 1, '紅辣椒', '10  g', '', '', 0),
(128, 1, '蒜', '15  g', '', '', 1),
(128, 1, '薑', '10  g', '', '', 2),
(128, 2, '蕃茄沙司', '100  g', '', '0', 0),
(128, 2, '泰式雞醬', '20  g', '', '0', 1),
(128, 2, '白醋', '10c.c.', '', '0', 2),
(128, 2, '烏醋', '10c.c.', '', '0', 3),
(128, 2, '糖', '8  g', '', '0', 4),
(128, 2, '香油', '5c.c.', '', '0', 5),
(128, 3, '將薑、蒜及紅辣椒切成細末。', '', '', '1', 0),
(128, 3, ' 把所有調味料與做法1的材料攪拌均勻即完成五味醬。', '', '', '1', 1),
(127, 1, '杏鮑菇', '300g', '', '', 1),
(127, 1, '蔥絲', '少許', '', '', 2),
(127, 2, '五味醬', '', 'https://www.ajinomoto.com.tw/foodservice/recipepro-detail.php?id=128', '0', 1),
(127, 3, '杏鮑菇水煮15分鐘取出瀝乾冷卻。', '', '', '1', 0),
(127, 3, '杏鮑菇切片擺盤附沾醬。', '', '', '1', 1),
(127, 3, '放上蔥絲點綴即完成。', '', '', '1', 2),
(129, 1, '圓鱈(4片)', '400  g', '', '', 1),
(129, 1, '綜合生菜', '100g', '', '', 2),
(129, 2, '鹽', '3g', '', '0', 0),
(129, 2, '黑胡椒粗粒', '3g', '', '0', 1),
(129, 2, '水果油醋醬', '', 'https://www.ajinomoto.com.tw/foodservice/recipepro-detail.php?id=130', '0', 2),
(129, 3, '先將圓鱈用鹽及黑胡椒粗粒醃10分鐘。', '', '', '1', 0),
(129, 3, '平底鍋加熱，以中火將圓鱈兩面各煎約2分鐘至表面焦香。', '', '', '1', 1),
(129, 3, '盤子底部鋪上綜合生菜擺盤，附上水果油醋醬即可。', '', '', '1', 2),
(130, 1, '橄欖油', '120c.c.', '', '', 0),
(130, 1, '洋蔥末 ', '50  g', '', '', 1),
(130, 1, '香吉士', '1個', '', '', 2),
(130, 1, '檸檬', '1.5個', '', '', 3),
(130, 2, '「ほんだし®/烹大師®」昆布風味', '1  g', '', '0', 0),
(130, 2, '法式芥茉醬', '50  g', '', '0', 1),
(130, 2, '糖', '20g', '', '0', 2),
(130, 2, '鹽', '2g', '', '0', 3),
(130, 2, '黑胡椒細粒', '1g', '', '0', 4),
(130, 2, '烏醋', '10g', '', '0', 5),
(130, 2, '糖', '8g', '', '0', 6),
(130, 2, '香油', '5c.c.', '', '0', 7),
(130, 3, '將香吉士及檸檬壓汁。', '', '', '1', 0),
(130, 3, '與橄欖油及調味料攪拌均勻即完成水果油醋醬。', '', '', '1', 1),
(131, 1, '葛瑪蘭小里肌,鮮奶,蛋黃,麵粉', '400g,200c.c.,1個,35g', '', '', 0),
(131, 1, '麵包粉,黑胡椒粗粒,巴西里末', '100g,2g,10g', '', '', 1),
(131, 2, '「ほんだし®/烹大師®」雞粉', '1g', '', '0', 0),
(131, 2, '黑胡椒粗粒', '1  g', '', '0', 1),
(131, 2, '鹽', '1  g', '', '0', 2),
(131, 2, '金桔芒果醬', '', 'https://www.ajinomoto.com.tw/foodservice/recipepro-detail.php?id=132', '0', 3),
(131, 3, '把材料Ⓐ小里肌與鮮奶先浸泡30分鐘，瀝乾鮮奶將里肌及調味料放入真空袋用低溫59℃隔水加熱60分鐘備用。', '', '', '1', 0),
(131, 3, '把材料Ⓑ一起攪拌均勻成裹粉備用。', '', '', '1', 1),
(131, 3, '將小里肌用紙巾吸乾水份，依序沾裹麵粉及蛋黃後，再沾上做法2的裹粉，以180℃油溫炸4-5分鐘至9分熟，瀝乾油份後靜置2分鐘，讓內部血水收乾    再切片擺盤，附上金桔芒果醬即可。', '', '', '1', 2),
(132, 1, '愛文芒果', '150  g', '', '', 0),
(132, 1, '金桔醬', '60  g', '', '', 1),
(132, 1, '嫩子薑', '3g', '', '', 2),
(132, 1, '朝天椒', '2  g', '', '', 3),
(132, 2, '「ほんだし®/烹大師®」干貝風味', '2  g', '', '0', 0),
(132, 2, '新鮮檸檬汁', '15c.c.', '', '0', 1),
(132, 2, '辣椒', '10  g', '', '0', 2),
(132, 2, '泰國魚露', '10c.c.', '', '0', 3),
(132, 2, '鹽', '0.5  g', '', '0', 4),
(132, 3, '將所有材料洗淨，芒果去除果皮及不要的部份。', '', '', '1', 0),
(132, 3, '把所有材料及調味料用果汁機打勻即完成金桔芒果醬。', '', '', '1', 1),
(134, 1, '新鮮檸檬汁', '100c.c.', '', '', 0),
(134, 1, '朝天椒', '15  g', '', '', 1),
(134, 1, '蒜末', '30  g', '', '', 2),
(134, 1, '新鮮香茅', ' 10g', '', '', 3),
(134, 1, '香菜', '10g', '', '', 4),
(134, 1, '紅蔥頭', '5  g', '', '', 5),
(134, 2, '糖', '20', '', '0', 0),
(134, 2, '「ほんだし®/烹大師®」雞粉', '7  g', '', '0', 1),
(134, 2, '泰國魚露 ', '75c.c.', '', '0', 2),
(134, 2, 'TABASCO辣椒醬', '20  g', '', '0', 3),
(134, 3, '將蒜末、紅蔥頭、朝天椒、香菜及香茅切細粒狀備用。', '', '', '1', 0),
(134, 3, '把所有材料與調味料一起攪拌均勻即完成泰式辣醬。', '', '', '1', 1),
(133, 1, '小卷', '300g', '', '', 1),
(133, 1, '低筋麵粉', '200g', '', '', 2),
(133, 1, '蘇打水', '150g', '', '', 3),
(133, 1, '綜合生菜', ' 75g', '', '', 4),
(133, 2, '泰式辣醬', '', 'https://www.ajinomoto.com.tw/foodservice/recipepro-detail.php?id=134', '0', 1),
(133, 3, '先將小卷去除內臟，吸乾水份表面拍上少許低筋麵粉備用。', '', '', '1', 0),
(133, 3, '將低筋麵粉和蘇打水混合均勻成麵糊。', '', '', '1', 1),
(133, 3, '小卷沾附麵糊，以180度的油溫炸至金黃酥脆。', '', '', '1', 2),
(133, 3, '小卷用紙巾吸除多餘油脂，將綜合生菜鋪底後擺盤，附上泰式辣醬即可。', '', '', '1', 3),
(135, 1, '帶骨仿土雞腿', '2支', '', '', 1),
(135, 1, '薑片', '3片', '', '', 2),
(135, 1, '蔥段', '2支', '', '', 3),
(135, 1, '水', '3000c.c.', '', '', 4),
(135, 2, '鹽', '2g', '', '0', 0),
(135, 2, '椒麻蔥油醬', '', 'https://www.ajinomoto.com.tw/foodservice/recipepro-detail.php?id=136', '0', 1),
(135, 3, '將水加熱後，放入鹽、薑片及蔥段，水滾後放入雞腿，轉小火浸泡20分鐘。', '', '', '1', 0),
(135, 3, '將雞腿取出冰鎮，待冷卻後將骨頭去除。', '', '', '1', 1),
(135, 3, '切塊擺盤，淋上椒麻蔥油醬即可。', '', '', '1', 2),
(136, 1, '三星蔥 ', '100  g', '', '', 1),
(136, 2, '「ほんだし®/烹大師®」干貝風味', '1.5  g', '', '0', 1),
(136, 2, '大紅袍花椒油', '1  g', '', '0', 2),
(136, 2, '礦泉水', '500c.c.', '', '0', 3),
(136, 2, '果糖', '1g', '', '0', 4),
(136, 2, '鹽', '0.5g', '', '0', 5),
(136, 3, '將三星蔥切段放果汁機加入礦泉水攪打成細末，靜置半小時待蔥末沉澱。', '', '', '1', 0),
(136, 3, '用細網將水瀝乾，再加入調味料攪拌均勻。', '', '', '1', 1),
(136, 3, '需冷藏靜置一個晚上讓味道融合在一起即可。', '', '', '1', 2),
(136, 3, '※美味方程式：蔥白及尾端部分不用，可多加一些礦泉水去除蔥的苦味。', '', '', '0', 3),
(137, 1, '茭白筍', '600  g', '', '', 0),
(137, 2, '水', '2000c.c.', '', '0', 0),
(137, 2, '鹽', '5g', '', '0', 1),
(137, 2, '腐乳醬(「ほんだし®/烹大師®」鰹魚風味)', '', 'https://www.ajinomoto.com.tw/foodservice/recipepro-detail.php?id=138', '0', 2),
(137, 3, '將水煮滾後加入鹽，再放入茭白筍煮約10分鐘。', '', '', '1', 0),
(137, 3, '將茭白筍撈出後冰鎮冷卻。', '', '', '1', 1),
(137, 3, '去除表皮纖維，切成6公分長條狀擺盤，附上腐乳醬即可。', '', '', '1', 2),
(138, 1, '白豆腐乳', '50  g', '', '', 0),
(138, 1, '米豆醬', '15  g', '', '', 1),
(138, 1, '礦泉水', '25c.c.', '', '', 2),
(138, 1, '米酒', '5c.c.', '', '', 3),
(138, 2, '「ほんだし®/烹大師®」鰹魚風味', '3  g', '', '0', 0),
(138, 2, '香油', '20c.c.', '', '0', 1),
(138, 2, '糖', '10  g', '', '0', 2),
(138, 3, '將白豆腐乳與烹大師鰹魚風味、礦泉水、糖、米酒及香油放入果汁機打成泥醬。', '', '', '1', 0),
(138, 3, '加入米豆醬攪拌均勻即完成腐乳醬。', '', '', '1', 1),
(139, 1, '粉腸 ', '500  g', '', '', 1),
(139, 1, '豬心', '1個', '', '', 2),
(139, 1, '油豆腐', '3個', '', '', 3),
(139, 1, '豬大骨', '1付', '', '', 4),
(139, 1, '水', '5000c.c.', '', '', 5),
(139, 1, '薑絲', '50g', '', '', 6),
(139, 2, '蒜蓉醬油(使用「ほんだし®/烹大師®」雞粉)', '', 'https://www.ajinomoto.com.tw/foodservice/recipepro-detail.php?id=140', '0', 1),
(139, 3, '豬大骨汆燙洗淨放入湯桶加水小火熬煮30分鐘備用。', '', '', '1', 0),
(139, 3, '粉腸修除脂肪，豬心洗淨汆燙後放入大骨湯熬煮一小時再放入油豆腐    煮30分鐘撈起備用。', '', '', '1', 1),
(139, 3, '粉腸切3.5cm，豬心切片，油豆腐切小正方形排盤放上薑絲，附醬汁    即完成。', '', '', '1', 2),
(140, 1, '蒜末', '30  g', '', '', 0),
(140, 1, '辣椒末', '10  g', '', '', 1),
(140, 1, '香菜末', '3  g', '', '', 2),
(140, 2, '「ほんだし®/烹大師®」雞粉', '1  g', '', '0', 0),
(140, 2, '蒸魚醬油', '80c.c.', '', '0', 1),
(140, 2, '醬油膏', '20  g', '', '0', 2),
(140, 2, '檸檬汁', '5c.c.', '', '0', 3),
(140, 2, '香油 ', '5c.c.', '', '0', 4),
(140, 2, '糖', '2  g', '', '0', 5),
(140, 3, '取15g蒜末以160度油溫炸至金黃色，瀝乾冷卻備用。', '', '', '1', 0),
(140, 3, '將全部材料及調味料攪拌均勻後，加入做法1的蒜末即完成。', '', '', '1', 1),
(141, 1, '天使蝦 ', '4隻', '', '', 1),
(141, 1, '鹽', '少許', '', '', 2),
(141, 1, '麵包粉', '100  g', '', '', 3),
(141, 1, '巴西里末', '10  g', '', '', 4),
(141, 2, '「ほんだし®/烹大師®」雞粉', '1  g', '', '0', 0),
(141, 2, '黑胡椒細粒', '2  g', '', '0', 1),
(141, 2, '酸甜辣醬', '', 'https://www.ajinomoto.com.tw/foodservice/recipepro-detail.php?id=142', '0', 2),
(141, 3, '天使蝦去頭跟殼，留蝦尾開背攤開成蝴蝶形，去除沙筋後抓少許鹽醃3分鐘備用。', '', '', '1', 0),
(141, 3, ' 將麵包粉、黑胡椒細粒、巴西里末及檸檬攪拌均勻成裹粉備用。', '', '', '1', 1),
(141, 3, '蝦整隻攤開，再依序沾麵粉、蛋黃後再沾上裹粉，只留蝦尾不用沾。', '', '', '1', 2),
(141, 3, '以180℃的油溫，將蝦炸至金黃酥脆後，瀝乾油擺盤淋上酸甜辣醬即可。', '', '', '1', 3),
(142, 1, '蒜末', '30g', '', '', 0),
(142, 2, '「ほんだし®/烹大師®」干貝風味', '1  g', '', '0', 0),
(142, 2, '醬油膏', '0.5  g', '', '0', 1),
(142, 2, '番茄醬', '0.5  g', '', '0', 2),
(142, 2, '辣醬', ' 0.1g', '', '0', 3),
(142, 2, '糖', '10g', '', '0', 4),
(142, 2, '香油', '10g', '', '0', 5),
(142, 2, '醬油 ', '5c.c.', '', '0', 6),
(142, 2, '日式七味粉', '2g', '', '0', 7),
(142, 3, '將所有調味料攪拌均勻即完成酸甜辣醬。', '', '', '1', 0),
(143, 1, '紅蔥頭', '50  g', '', '', 1),
(143, 1, '蒜末', '75  g', '', '', 2),
(143, 1, '冷凍草蝦', '8隻', '', '', 3),
(143, 1, '沙公', '500g', '', '', 4),
(143, 1, '西洋菜', '150g', '', '', 5),
(143, 1, '中卷', '1隻', '', '', 6),
(143, 1, '玉米筍', '50g', '', '', 7),
(143, 1, '秋葵', '50g', '', '', 8),
(143, 1, '雞粉高湯：,ほんだし®/烹大師®」雞粉,水', ',2小匙,600c.c.', '', '', 9),
(143, 2, '鹽', '1/4小匙', '', '0', 1),
(143, 2, '「ほんだし®/烹大師®」干貝風味', '1/2小匙', '', '0', 2),
(143, 2, '椰奶', '200c.c.', '', '0', 3),
(143, 2, '沙拉油', '2大匙', '', '0', 4),
(143, 2, '南洋咖哩醬：,大蝦米,紅蔥頭,蒜頭,冷凍香茅,鬱金香粉,印度咖哩粉,新鮮南薑,沙拉油,糖,「ほんだし®/烹大師®」雞粉,鹽', ',60g,120g,80g,60g,20g,40g,50g,150g,20g ,1大匙,1/4小匙', ',,,,,,,,,,,', '0,0,0,0,0,0,0,0,0,0,0,0', 5),
(143, 3, '南洋咖哩醬作法：大蝦米先泡水3分鐘，瀝乾剁碎備用。冷凍香茅、新鮮南薑、紅蔥頭跟蒜頭都切成細末備用。油鍋中小火將紅葱頭、蒜頭炒香後放入蝦米、南薑、香茅小火炒10分鐘後加入「ほんだし®/烹大師®」 雞粉、', '', '', '1', 0),
(143, 3, '沙公刷洗乾淨殺青，草蝦去除鬚腳跟腸泥背部劃刀，中卷切十字花紋切割成三角形備用。', '', '', '1', 1),
(143, 3, '沙公切成8塊切口處沾太白粉用油溫200℃炸至5分熟，瀝乾油備用。', '', '', '1', 2),
(143, 3, '西洋菜切除根部洗淨後汆燙，秋葵、玉米筍、中卷汆燙瀝乾水備用。', '', '', '1', 3),
(143, 3, '用油爆香蒜末、紅蔥頭、咖哩醬後加入高湯600c.c.，沸騰後依序放入沙公燒3分鐘後，放入草蝦及「ほんだし®/烹大師®」干貝風味及鹽調味，最後放入中卷、秋葵、玉米筍倒入椰奶中火滾一分鐘。', '', '', '1', 4),
(143, 3, '裝盤先於砂鍋內放入西洋菜，再放入沙公最後將其他配料排入砂鍋即可。', '', '', '1', 5),
(144, 1, '雞胸肉 ', '150  g', '', '', 1),
(144, 1, '小黃瓜', '1條', '', '', 2),
(144, 1, '綠豆粉皮', '200g', '', '', 3),
(144, 1, '紅蘿蔔', '75g', '', '', 4),
(144, 1, '雞蛋', '1個', '', '', 5),
(144, 1, '蔥', '1支', '', '', 6),
(144, 1, '薑 ', '3片', '', '', 7),
(144, 2, '「ほんだし®/烹大師®」雞粉', '1/2小匙', '', '0', 1),
(144, 2, '白胡椒粒', '少許', '', '0', 2),
(144, 2, '鹽', '少許', '', '0', 3),
(144, 2, '辣味胡麻醬汁：,日本胡麻醬,糖,醬油膏,蒜末,花椒粉,礦泉水,白醋 ,紅辣油,「ほんだし®/烹大師®」干貝風味', ',50  g,5  g,30  g,15  g,少許,75c.c.,15  g,30g,1/2小匙', ',,,,,,,,,', '0,0,0,0,0,0,0,0,0,0', 4),
(144, 3, '辣味胡麻醬汁：將辣味胡麻醬汁的調味料與「ほんだし®/烹大師®」干貝風味混合攪拌均勻即可。', '', '', '1', 0),
(144, 3, ' 用薑、蔥、白胡椒粒、鹽、及「ほんだし®/烹大師®」雞粉，以小火水煮雞胸肉約10分鐘關火後再泡15分鐘冷卻備用。', '', '', '1', 1),
(144, 3, '雞胸肉剝成細絲、綠豆粉皮切0.5公分條狀，紅蘿蔔與小黃瓜切細絲，雞蛋打散，煎成蛋皮切細絲備用。', '', '', '1', 2),
(144, 3, '綠豆粉皮放入盤鋪平後放雞絲、小黃瓜絲、紅蘿蔔絲及蛋絲排列整齊，淋上辣味胡麻醬汁即可。', '', '', '1', 3),
(145, 1, '波士頓龍蝦 (600~650g)', '1隻', '', '', 1),
(145, 1, '日本太白粉', '75  g', '', '', 2),
(145, 1, '義大利細扁麵', '100g  ', '', '', 3),
(145, 1, '西蘭花', '75g', '', '', 4),
(145, 1, '小蕃茄', '80g', '', '', 5),
(145, 1, '去皮蒜頭', '35g', '', '', 6),
(145, 1, '紅蔥頭', '50g', '', '', 7),
(145, 1, '宜蘭青蔥花', '75g', '', '', 8),
(145, 1, '無鹽奶油塊', '150g ', '', '', 9),
(145, 1, '干貝高湯：,「ほんだし®/烹大師®」干貝風味,水', ',1小匙,450c.c.', '', '', 10),
(145, 2, '「ほんだし®/烹大師®」干貝風味', '1/2小匙', '', '0', 1),
(145, 2, '鹽', '1/4小匙', '', '0', 2),
(145, 2, '醬油 ', '2大匙', '', '0', 3),
(145, 2, '細砂糖 ', '1大匙', '', '0', 4),
(145, 2, '紹興酒', '3大匙', '', '0', 5),
(145, 3, '義大利細扁麵煮至8分熟，拌入少許橄欖油冷卻備用。', '', '', '1', 0),
(145, 3, '波士頓龍蝦對切後，剪除腳及頭部毛囊約切成6塊，在切口處沾日本太白粉以180℃的油溫炸約30秒撈起瀝乾油備用。', '', '', '1', 1),
(145, 3, '鍋裡依序放入無鹽奶油塊、蒜頭、紅蔥頭及以小火炒香後加入材料Ⓐ高湯及龍蝦，蓋上鍋蓋中火燜煮3~4分鐘，放 入「ほんだし®/烹大師®」干貝風味、鹽、醬油、糖後加入蔥花、 紹興酒再烹煮30秒。', '', '', '1', 2),
(145, 3, '將龍蝦及一半湯汁取出後再將剩餘湯汁放入麵條，讓湯汁包覆麵條即可先裝盤。', '', '', '1', 3),
(145, 3, '最後將龍蝦及湯汁、西蘭花、小蕃茄以小火煨煮1分鐘即完成。', '', '', '1', 4),
(147, 1, '海瓜子(吐沙1小時)', '200  g', '', '', 0),
(147, 1, '白蘿蔔(切細絲200g)', '600  g', '', '', 1),
(147, 1, '米酒', '100c.c.', '', '', 2),
(147, 1, '水', '600c.c.', '', '', 3),
(147, 1, '白胡椒粒', '3  g', '', '', 5),
(147, 1, '龍膽石斑清肉', '120  g', '', '', 6),
(147, 1, '金針菇', '40g', '', '', 7),
(147, 1, '鴻喜菇', '75g', '', '', 8),
(147, 1, '彩椒片', ' 50g', '', '', 9),
(147, 1, '荷蘭豆', '50g', '', '', 10),
(147, 2, '「ほんだし®/烹大師®」鰹魚風味', '1/2小匙', '', '0', 0),
(147, 2, '鹽', '1/4小匙', '', '0', 1),
(147, 3, '白蘿蔔400g切大塊、海瓜子200g、白胡椒粒、水、米酒大火煮30分鐘，過濾後加入 「ほんだし®/烹大師®」鰹魚風味、鹽調味備用。', '', '', '1', 0),
(147, 3, '龍膽石斑切0.7公分薄片浸泡熱水3分鐘至約7分熟，白蘿蔔200g切細絲汆燙備用。', '', '', '1', 1),
(147, 3, '砂鍋內依序放入白蘿蔔絲、金針菇、彩椒片、荷蘭豆、龍膽石斑及鴻喜菇倒入做法①的鰹魚高湯，用小火煮滾後放上芹菜粒即可。', '', '', '1', 2),
(148, 1, '草蝦仁', '300  g', '', '', 0),
(148, 1, '豬板油', '50  g', '', '', 1),
(148, 1, '韭黃段', '40  g', '', '', 2),
(148, 1, '青江菜', '1朵', '', '', 3),
(148, 1, '粄條', '2張', '', '', 4),
(148, 1, '熟蒜酥', '50g ', '', '', 5),
(148, 1, '甜蘿勒苗', '少許', '', '', 6),
(148, 2, '鹽 ', '1/2小匙', '', '0', 0),
(148, 2, '香油', '1小匙', '', '0', 1),
(148, 2, '糖', '1小匙', '', '0', 2),
(148, 2, '「ほんだし®/烹大師®」雞粉', '1/2小匙', '', '0', 3),
(148, 2, '太白粉', '1小匙', '', '0', 4),
(148, 2, ' 蒜蓉醬汁： ,「ほんだし®/烹大師®」鰹魚風味,蒸魚醬油,水,生蒜末,炸好熟蒜酥', ',1/4小匙,75c.c.,75c.c.,50g,50g', ',,,,,', '0,0,0,0,0,0', 5),
(148, 3, '蒜蓉醬做法：將熟蒜酥與生蒜末及「ほんだし®/烹大師®」鰹魚風味與其它醬汁材料攪拌均勻即可。', '', '', '1', 0),
(148, 3, '蝦仁去腸泥後切粗粒，豬板油切成細粒加入「ほんだし®/烹大師®」雞粉及其它調味料攪拌至呈膠質狀備用。 ', '', '', '1', 1),
(148, 3, '粄條切成8x10公分長條狀，攤開抹上太白粉鋪上做法①的餡料後加韭黃段捲起用大火蒸8分鐘。', '', '', '1', 2),
(148, 3, '青江菜汆燙撈起擺盤，擺上熟蒜酥淋上蒜蓉醬及甜蘿勒苗點綴即可。', '', '', '1', 3),
(149, 1, '日本生食干貝', '4粒', '', '', 0),
(149, 1, '澎湖絲瓜(8cm長切絲)', '1/3條', '', '', 1),
(149, 1, '新鮮香菇(切絲)', '1朵', '', '', 2),
(149, 1, '紅甜椒(切條)', '1/4個', '', '', 3),
(149, 1, '黃甜椒(切條)', '1/4個', '', '', 4),
(149, 1, '青椒(切條)', '1/4個', '', '', 5),
(149, 1, '紫蘇葉', '4片', '', '', 6),
(149, 1, '橘皮南瓜', '150  g', '', '', 7),
(149, 1, '紅肉地瓜', '150  g', '', '', 8),
(149, 1, '生鹹蛋黃(120℃烤10分鐘)', '2個', '', '', 9),
(149, 1, '無鹽奶油 ', '50g', '', '', 10),
(149, 1, '高湯(以ほんだし®/烹大師®」干貝風味調製)', '150c.c.', '', '', 11),
(149, 2, '起士粉', '10g', '', '0', 0),
(149, 2, '鹽', '適量', '', '0', 1),
(149, 2, '糖', '1/2小匙', '', '0', 2),
(149, 2, '「ほんだし®/烹大師®」干貝風味', '1/2小匙', '', '0', 3),
(149, 3, '把橘皮南瓜及紅肉地瓜去皮蒸熟打成泥備用。  ', '', '', '1', 0),
(149, 3, '新鮮香菇汆燙後切成絲，澎湖絲瓜刨皮去籽囊切成細絲汆燙備用。', '', '', '1', 1),
(149, 3, '將紅甜椒、黃甜椒、青椒切6公分長條穿入干貝中間，以小火煎約5分熟備用。', '', '', '1', 2),
(149, 3, '小火將奶油與鹹蛋黃炒香後加入高湯150c.c.再放入做法1的瓜泥，加入「ほんだし®/烹大師®」干貝風味、鹽、糖， 炒勻備用。', '', '', '1', 3),
(149, 3, '紫蘇葉排列於器皿，依序放上做法④的瓜泥、做法③的干貝及做法②的絲瓜絲、香菇絲，再撒上起司粉即可。', '', '', '1', 4),
(150, 1, '小金瓜(容器)', '1個', '', '', 0),
(150, 1, '芋頭', '15  g', '', '', 1),
(150, 1, '橘皮南瓜', '20  g', '', '', 2),
(150, 1, '杏鮑菇', '15  g', '', '', 3),
(150, 1, '芹菜', '5  g', '', '', 4),
(150, 1, '紫地瓜', '20  g', '', '', 5),
(150, 1, '美國蘆筍', '10  g', '', '', 6),
(150, 1, '松子', '15  g', '', '', 7),
(150, 1, '玉里香米', '150g ', '', '', 8),
(150, 1, '黑糯米', '50g', '', '', 9),
(150, 1, '客家菜脯', '15g', '', '', 10),
(150, 1, '黑松露醬', '35g', '', '', 11),
(150, 2, '「ほんだし®/烹大師®」昆布風味', '1/4小匙', '', '0', 0),
(150, 2, '醬油 ', '1/2小匙', '', '0', 1),
(150, 2, '鹽', '少許 ', '', '0', 2),
(150, 3, '小金瓜切1/4開口蒸熟當盛飯容器。', '', '', '1', 0),
(150, 3, '松子先汆燙浸泡20分鐘，再以低溫120℃ 油炸6-8分鐘瀝乾油備用。', '', '', '1', 1),
(150, 3, '橘皮南瓜、紫地瓜、芋頭、杏鮑菇切0.5公分小丁，油溫150℃炸至酥脆後瀝乾油備用。', '', '', '1', 2),
(150, 3, '客家菜脯泡水3分鐘後切粗粒、美國蘆筍切粗粒、芹菜切細粒備用。', '', '', '1', 3),
(150, 3, '鍋子放油，先將客家菜脯及黑糯米飯炒香後，再加入做法3的配料，用中小火慢慢炒到粒粒分明，最後放黑松露醬及「ほんだし®/烹大師®」昆布風味、醬油及少許鹽炒勻後放入小金瓜容器裡再撒上松子即可。', '', '', '1', 4),
(150, 3, '※美味方程式：①黑糯米需泡水隔夜才能蒸的Q彈②將黑糯米和玉里香米蒸45分鐘冷卻備用。', '', '', '0', 5),
(151, 1, '長糯米', '600g', '', '', 0),
(151, 1, '香檳茸', '10朵', '', '', 1),
(151, 1, '傳統香腸', '300g', '', '', 2),
(151, 1, '蛋', '3顆', '', '', 3),
(151, 1, '油蔥酥', '150  g', '', '', 4),
(151, 1, '芝麻香油', '75g', '', '', 5),
(151, 1, '乾荷葉(22g/張)', '3張', '', '', 6),
(151, 1, '綠粽葉', '10張', '', '', 7),
(151, 2, '「ほんだし®/烹大師®」干貝風味', '5g', '', '0', 0),
(151, 2, '「ほんだし®/烹大師®」雞粉', '5g', '', '0', 1),
(151, 2, '白胡椒粉', '12  g', '', '0', 2),
(151, 2, '糖', '26  g', '', '0', 3),
(151, 2, '鹽', '3.5  g', '', '0', 4),
(151, 3, '長糯米浸泡12小時，瀝乾水分後蒸50分鐘備用。', '', '', '1', 0),
(151, 3, '乾荷葉泡熱水30分鐘後去蒂頭，裁切成4小張，香檳茸縱切成1/2大小，以烤箱溫度100 ℃ 烤20分鐘後取出備用。', '', '', '1', 1),
(151, 3, '傳統香腸蒸15分鐘後切0.5公分粒狀，蛋打散炒出香氣帶些許焦黃備用。', '', '', '1', 2),
(151, 3, '做法①的糯米飯，加入做法③的蛋、香腸及油蔥酥、香油與調味料拌勻備用。', '', '', '1', 3),
(151, 3, '做法②的荷葉鋪底，先放上做法④再放入香檳茸，包成長型圓柱狀後再包上綠粽葉，蒸20分鐘即可。', '', '', '1', 4),
(151, 3, '※美味方程式：香檳茸烤過後有濃郁的杏仁堅果香味，再以荷葉包覆米飯，蒸熱後會有淡淡的清香。', '', '', '0', 5),
(152, 1, '澎湖虎蝦', '4隻', '', '', 1),
(152, 1, '噶瑪蘭豬五花', '120  g', '', '', 2),
(152, 1, '韭菜花粒', '35  g', '', '', 3),
(152, 1, '洋蔥粒', '50  g', '', '', 4),
(152, 1, '乾豆豉', '15  g', '', '', 5),
(152, 1, '乾辣椒', '10  g', '', '', 6),
(152, 1, '蒜片', '10  g', '', '', 7),
(152, 1, '嫩薑末 ', '10  g', '', '', 8),
(152, 1, '蔥花', '10  g', '', '', 9),
(152, 1, '蛋黃', '1顆', '', '', 10),
(152, 1, '高筋麵粉', '100g', '', '', 11),
(152, 2, '「ほんだし®/烹大師®」鰹魚風味', '2g', '', '0', 1),
(152, 2, '「ほんだし®/烹大師®」雞粉', '1g', '', '0', 2),
(152, 2, '紹興酒', '5c.c.', '', '0', 3),
(152, 2, '醬油', '2c.c.', '', '0', 4),
(152, 2, '鹽 ', '少許 ', '', '0', 5),
(152, 2, '玉米粉 ', '少許 ', '', '0', 6),
(152, 2, '醃料：,「ほんだし®/烹大師®」雞粉,鹽,玉米粉', ',少許,少許,少許', ',,,', '0,0,0,0', 7),
(152, 3, '噶瑪蘭豬五花切0.2公分細條狀，用少許醬油醃漬5分鐘後炒香備用。', '', '', '1', 0),
(152, 3, '澎湖虎蝦去殼留尾，割背洗淨後以醃料醃5分鐘，再加入蛋黃，沾上高筋麵粉炸至金黃色瀝油備用。', '', '', '1', 1),
(152, 3, '韭菜花用大火炒加少許鹽，去青澀味瀝乾水分備用。', '', '', '1', 2),
(152, 3, '乾辣椒、嫩薑末、蔥花、蒜片、洋蔥粒爆香，加入乾豆豉、做法①的五花肉、做法③的韭菜花粒，再加入「ほんだし®/烹大師®」鰹魚風味、「ほんだし®/烹大師®」雞粉及醬油炒至微乾。', '', '', '1', 3),
(152, 3, '淋上紹興酒嗆鍋再放入蝦球炒拌均勻即可。', '', '', '1', 4),
(153, 1, '桂丁雞', '1隻', '', '', 0),
(153, 1, '雲林黑蒜', '80g', '', '', 1),
(153, 1, '大甲芋頭', '600g', '', '', 2),
(153, 1, '枸杞', '15g', '', '', 3),
(153, 1, '水', '1800c.c.', '', '', 4),
(153, 2, '「ほんだし®/烹大師®」雞粉', '5g', '', '0', 0),
(153, 2, '米酒', '150c.c.', '', '0', 1),
(153, 2, '鹽', '2g', '', '0', 2),
(153, 3, '桂丁雞氽燙2分鐘，撈起浸泡冷水，去除血水瀝乾備用。', '', '', '1', 0),
(153, 3, '大甲芋頭去皮後切大滾刀塊，以180 ℃油溫炸至金黃色撈起瀝乾油，再氽燙備用。', '', '', '1', 1),
(153, 3, '依序將桂丁雞、芋頭、黑蒜頭放入燉盅內，滾水加入「ほんだし®/烹大師®雞粉、鹽及米酒，再倒入燉盅燉兩小時。', '', '', '1', 2),
(153, 3, '枸杞先以少許米酒浸泡，倒入做法③即可。', '', '', '1', 3),
(155, 1, '東港處女蟳', '300g', '', '', 1),
(155, 1, '日本葛粉', '100g', '', '', 2),
(155, 1, '西生菜', '150g', '', '', 3),
(155, 1, '絞肉', '300g', '', '', 4),
(155, 1, '草蝦泥', '150g', '', '', 5),
(155, 1, '荸薺', '75g', '', '', 6),
(155, 1, '薑末', '15g', '', '', 7),
(155, 1, '青蔥末', '10g', '', '', 8),
(155, 2, '「ほんだし®/烹大師®」雞粉', '3  g', '', '0', 1),
(155, 2, '「ほんだし®/烹大師®」昆布風味', '3g', '', '0', 2),
(155, 2, '胡椒粉', '0.2g', '', '0', 3),
(155, 2, '鹽', '1.5  g', '', '0', 4),
(155, 2, '糖', '5  g', '', '0', 5),
(155, 2, '醬油', '10c.c.', '', '0', 6),
(155, 2, '玉米粉', '2  g', '', '0', 7),
(155, 2, '芝麻香油', ' 2g', '', '0', 8),
(155, 2, '太白粉(沾黏蟹用)', '15g', '', '0', 9),
(155, 2, '紹興酒', '3  g', '', '0', 10),
(155, 2, '芹菜末', '15  g', '', '0', 11),
(155, 2, '香菜', '10  g', '', '0', 12),
(155, 3, '日本葛粉用冷水浸泡1小時，荸薺切碎備用。', '', '', '1', 0),
(155, 3, '肉餡製作：絞肉、草蝦泥依序加入薑末、蔥末、「ほんだし®/烹大師®」雞粉調味，攪拌摔打出膠質後再放荸薺碎、香油、胡椒粉再攪拌均勻分成10粒備用。', '', '', '1', 1),
(155, 3, '處女蟳洗淨後打開蟹蓋，去除肺部毛囊及腳尖，身體 及蟹鉗分別切成10塊，用刀輕輕拍裂，於刀口處沾黏太白粉，包上做法②的肉餡呈球狀，以180℃油溫炸至8分熟，瀝乾油備用。', '', '', '1', 2),
(155, 3, '西生菜汆燙放入砂鍋，依序排入燙熟葛粉及做法③的蟹肉塊。', '', '', '1', 3),
(155, 3, '高湯加紹興酒倒入砂鍋小火燒5分鐘，放入蔥絲即可。', '', '', '1', 4),
(156, 1, '台南虱目魚肚(無刺) ', '500  g', '', '', 1),
(156, 1, '花蓮剝皮辣椒', '180  g', '', '', 2),
(156, 1, '薑茉', '35  g', '', '', 3),
(156, 1, '蒜末', '35  g', '', '', 4),
(156, 1, '青蔥', ' 50g', '', '', 5),
(156, 1, '白芝麻(熟)', '15g', '', '', 6),
(156, 2, '「ほんだし®/烹大師®」昆布風味', '2g', '', '0', 1),
(156, 2, '剁椒醬', '300g', '', '0', 2),
(156, 2, '大紅袍花椒油', '25g', '', '0', 3),
(156, 2, '海苔醬', '20g', '', '0', 4),
(156, 2, '芝麻香油', '5g', '', '0', 5),
(156, 3, '剝皮辣椒粒、薑末、蒜泥、海苔醬加入「ほんだし®/烹大師®」昆布風味攪拌均勻成剝皮辣椒醬備用。', '', '', '1', 0),
(156, 3, '虱目魚肚洗淨，分切成約2公分長條狀。', '', '', '1', 1),
(156, 3, '放入器皿中將剁椒醬鋪在盤底，再放上虱目魚片，再將剝皮辣椒醬鋪於魚肚上，放入蒸籠蒸5分鐘。', '', '', '1', 2),
(156, 3, '灑上蔥花，取花椒油、香油燒熱淋於蔥花，撒上白芝麻即可。 ', '', '', '1', 3),
(157, 1, '海參段', '12kg', '', '', 1),
(157, 1, '魚皮段', '12kg', '', '', 2),
(157, 1, '木耳絲', '3kg', '', '', 3),
(157, 1, '紅蘿蔔絲 ', '2條', '', '', 4),
(157, 1, '金茸菇(罐裝)', ' 20罐(3600公克)', '', '', 5),
(157, 1, '豬肉絲', '12kg', '', '', 6),
(157, 1, '大白菜絲', '12kg', '', '', 7),
(157, 1, '桶筍絲', '6kg', '', '', 8),
(157, 1, '紅蔥酥', '1200g', '', '', 9),
(157, 1, '蛋酥', '1200g', '', '', 10),
(157, 1, '高湯', '36公升', '', '', 11),
(157, 2, '「AJINOMOTO PLUS」高鮮味精', '180  g', '', '0', 1),
(157, 2, '黑胡椒粉 ', '180  g', '', '0', 2),
(157, 2, '地瓜粉', '少許', '', '0', 3),
(157, 3, '高湯作法：豬大骨6kg與36公升的水加入「AJINOMOTO PLUS」高鮮味精4大匙熬煮。', '', '', '1', 0),
(157, 3, '豬肉絲加入「AJINOMOTO PLUS」高鮮味精及黑胡椒粉調味，再加少許地瓜粉抓勻後蒸熟，冷卻備用。', '', '', '1', 1),
(157, 3, '海參段、魚皮段、木耳絲、紅蘿蔔絲、金茸菇各別氽燙後冷卻備用。', '', '', '1', 2),
(157, 3, '將做法①及做法②的材料混合均勻備用，大白菜絲及桶筍絲各別氽燙後冷卻備用。', '', '', '1', 3),
(157, 3, '真空包包裝時，每包取350g做法③、大白菜絲80g、桶筍絲60g、紅蔥酥20g及蛋酥20g，再加入600c.c.高湯即可。', '', '', '1', 4),
(157, 3, '注意事項：本份食譜約可製作60包真空包，每包含湯汁約重1200公克。', '', '', '0', 5),
(158, 1, '鮭魚', '80  g', '', '', 0),
(158, 2, '「AJINOMOTO PLUS」高鮮味精', '1g', '', '0', 0),
(158, 2, '胡椒鹽 ', '少許', '', '0', 1),
(158, 3, '鮭魚切成0.3公分的薄片。', '', '', '1', 0),
(158, 3, '加入「AJINOMOTO PLUS」高鮮味精與魚片一起抓醃均勻。', '', '', '1', 1),
(158, 3, '將5片鮭魚片排成一長條狀，再捲起來圍成玫瑰的樣子。', '', '', '1', 2),
(158, 3, '以烤箱溫度約180℃ 烤6至8分鐘後，撒上少許胡椒鹽即可。', '', '', '1', 3),
(159, 1, '後腿豬腳', '3kg', '', '', 0),
(159, 1, '紅蔥酥', '150g', '', '', 1),
(159, 1, '蔥段', '100g', '', '', 2),
(159, 1, '水', '8000c.c.', '', '', 3),
(159, 2, '「AJINOMOTO PLUS」高鮮味精', '30  g', '', '0', 0),
(159, 2, '麥芽糖', '150  g', '', '0', 1),
(159, 2, '醬油膏 ', '300c.c.', '', '0', 2),
(159, 2, '醬油', '150c.c.', '', '0', 3),
(159, 2, '滷包', '1包', '', '0', 4),
(159, 2, '八角', '適量', '', '0', 5),
(159, 3, '將後腿豬腳切段後，洗淨汆燙備用。', '', '', '1', 0),
(159, 3, '做法①的豬腳抹上醬油膏，以150℃油溫炸成金黃色。', '', '', '1', 1),
(159, 3, '蔥段爆香後，將所有材料放入鍋中滷約2小時。', '', '', '1', 2),
(161, 1, '炒麵用蒸麵', '160  g', '', '', 0),
(161, 1, '櫻花蝦', '2  g', '', '', 1),
(161, 1, '海苔粉', ' 少許', '', '', 2),
(161, 1, '沙拉油', '4g', '', '', 3),
(161, 1, '豬肉片,高麗菜(切3cm大小),豆芽菜,紅蘿蔔(切絲),洋蔥(切條),青椒(切絲)', '50  g,50  g,40  g,10g,10g,10g', '', '', 4),
(161, 2, '辣醬油, 中濃醬汁, 蕃茄醬, 「ほんだし®/烹大師®」鰹魚風味', '15  g,15g,5g,2  g', ',,,', '0,0,0,0', 0),
(161, 3, '用平底鍋熱油，拌炒材料Ⓐ。', '', '', '1', 0),
(161, 3, '在做法①裡放入炒麵用的蒸麵，一邊炒開一邊加入調味料Ⓐ，繼續拌炒。', '', '', '1', 1),
(161, 3, '將做法②盛裝到容器裡，撒上海苔粉、櫻花蝦。', '', '', '1', 2),
(163, 1, '白飯 ', '300  g', '', '', 0),
(163, 1, '熱水', '500  g', '', '', 1),
(163, 1, '梅干', '2  g', '', '', 2),
(163, 1, '海苔絲', '適量', '', '', 3),
(163, 2, '「ほんだし®/烹大師®」鰹魚風味', '10  g', '', '0', 0),
(163, 3, '用鍋子將水煮沸，溶化「ほんだし®/烹大師®」鰹魚風味。', '', '', '1', 0),
(163, 3, '將飯裝入碗裡，倒入做法①，並放入梅干、海苔。', '', '', '1', 1),
(166, 1, '水 ', '800c.c.', '', '', 0),
(166, 1, '絹豆腐(切1.5cm塊狀)  ,海帶芽片(乾) ', '250g,5g', '', '', 1),
(166, 2, '味噌', '75  g', '', '0', 0),
(166, 2, '「ほんだし®/烹大師®」鰹魚風味', '15  g', '', '0', 1),
(166, 3, '在鍋裡放入水，煮沸之後加入材料Ⓐ，稍微煮滾。', '', '', '1', 0),
(166, 3, '將味噌融入做法①，最後加入「ほんだし®/烹大師®」鰹魚風味。', '', '', '1', 1),
(166, 3, '將做法②盛裝到容器裡。', '', '', '1', 2),
(168, 1, '蔥末,洋蔥末,蒜末,薑末,芝麻粉', '70  g,70  g,35g,30g,適量', '', '', 1),
(168, 2, '「ほんだし®/烹大師®」鰹魚風味', '5  g', '', '0', 0),
(168, 2, '麻油', '190  g', '', '0', 1),
(168, 3, '將材料Ⓐ、「ほんだし®/烹大師®」鰹魚風味放入碗裡，淋上充分加熱過的麻油後攪拌，放置1小時讓味道融合(1人份40g)。', '', '', '1', 0),
(168, 3, ' 加熱烤網，烤燒牛肉片，將肉片盛裝到容器裡，沾取小盤子裡的做法①。', '', '', '1', 1),
(169, 1, '涮涮鍋豬肉片', '200  g', '', '', 0),
(169, 1, '熱水', '500c.c.', '', '', 1),
(169, 1, '蔥(斜切薄片) ,白菜,小松菜', '50g,100  g,11  g', '', '', 2),
(169, 2, '「ほんだし®/烹大師®」鰹魚風味,白芝麻粉,日本芥末,橘醋,醬油', '2  g,10g,6g,52g,30c.c.', ',,,,', '0,0,0,0,0', 0),
(169, 3, '事先將調味料Ⓐ放入碗裡，徹底攪拌讓味道混合(1人份50g)。', '', '', '1', 0),
(169, 3, '在涮涮鍋專用鍋將水煮滾，將涮涮鍋豬肉、材料Ⓐ分別盛放在容器與竹籃上，用另外的小器皿盛裝做法①，以供沾取。', '', '', '1', 1),
(170, 1, '鯖魚(半隻)(切成1/2) ', '2片', '', '', 0),
(170, 1, '鹽', '3  g', '', '', 1),
(170, 1, '白蘿蔔泥', '100  g', '', '', 2),
(170, 2, '「ほんだし®/烹大師®」 鰹魚風味', '3  g', '', '0', 0),
(170, 3, '將白蘿蔔泥和「ほんだし®/烹大師®」 鰹魚風味放入碗裡攪拌。', '', '', '1', 0),
(170, 3, '用烤魚網烤已撒上鹽的鯖魚。', '', '', '1', 1),
(170, 3, '將做法②盛裝道容器裡，放入做法①。', '', '', '1', 2),
(171, 1, '麵包粉', '適量', '', '', 0),
(171, 1, '豬腰肉(一口大小) ', '200g', '', '', 1),
(171, 1, '大蔥(切2cm大小) ', '150  g', '', '', 2),
(171, 1, '洋蔥(切瓣)', '200g', '', '', 3),
(171, 1, '蝦子', '12隻', '', '', 4),
(171, 1, '高麗菜(切3cm大小) ', '100  g', '', '', 5),
(171, 1, '沙拉油(油炸用) ', '適量', '', '', 6),
(171, 1, '低筋麵粉', '100  g', '', '', 7),
(171, 2, '「ほんだし®/烹大師®」 鰹魚風味,牛奶,雞蛋', '3,100  g,60  g', ',,', '0,0,0', 0),
(171, 2, '辣醬油,「味之素」 S高鮮味精', '200  g,2  g', ',', '0,0', 1),
(171, 3, '按照豬腰肉、大蔥的順序用竹籤串起，製作8根；用竹籤穿過蝦子，製作12根；用竹籤穿過洋蔥，製作4根。', '', '', '1', 0),
(171, 3, '將低筋麵粉和調味料Ⓐ放入碗裡攪拌均勻，製作麵糊液。', '', '', '1', 1),
(171, 3, '在做法①裹上做法②，再沾滿麵包粉。', '', '', '1', 2),
(171, 3, '用鍋子加熱炸油，油炸做法③。', '', '', '1', 3),
(171, 3, '在碗裡攪拌調味料Ⓑ，盛裝到小器皿裡。', '', '', '1', 4),
(171, 3, '將做法④裝入容器裡，用別的容器盛裝高麗菜，沾取做法⑤享用。', '', '', '1', 5),
(172, 1, '水煮蠶豆', '30g', '', '', 0),
(172, 1, '水', '400c.c.', '', '', 1),
(172, 1, '白蘿蔔(切2cm厚的半月形) ,紅蘿蔔(切2cm厚的半月形)', '250  g,80  g', '', '', 2),
(172, 2, '「ほんだし®/烹大師®」 鰹魚風味,醬油,酒,砂糖,味醂', '3g,30  g, 50  g,7  g,30  g', ',,,,', '0,0,0,0,0', 0),
(172, 3, '在鍋裡加入水、材料Ⓐ預煮。', '', '', '1', 0),
(172, 3, '將調味料Ⓐ放入做法①裡，煮至材料Ⓐ變軟。', '', '', '1', 1),
(172, 3, '將蠶豆放入做法②裡，稍微烹煮。', '', '', '1', 2),
(172, 3, '將做法③盛放到容器裡。', '', '', '1', 3),
(173, 1, '牛絞肉,牛脂,洋蔥末(炒過),生麵包粉,雞蛋', '400  g,100g,200g,90g,100g', '', '', 0),
(173, 1, '麵粉,雞蛋,生麵包粉', '適量,適量,適量', '', '', 1),
(173, 1, '水菜(切4cm長),迷你蕃茄(切成1/2) ', '10  g,15  g', '', '', 2),
(173, 2, '沙拉油(油炸用)  ', '適量', '', '0', 0),
(173, 2, '中濃醬汁', '5  g', '', '0', 1),
(173, 2, '蕃茄醬,辣醬油,鹽,胡椒,「ほんだし®/烹大師®」鰹魚風味', '25  g,25  g,5  g,1g,4g', ',,,,', '0,0,0,0,0', 2),
(173, 3, '在碗裡將材料Ⓐ、調味料Ⓐ攪拌均勻，分成16等分並做出形狀(1人份2個)。', '', '', '1', 0),
(173, 3, '對做法 ①依序裹上材料Ⓑ後油炸(160℃)。', '', '', '1', 1),
(173, 3, '將做法②、材料Ⓒ盛裝到容器裡，淋上中濃醬汁。', '', '', '1', 2),
(174, 1, '雞蛋', '4顆', '', '', 0),
(174, 1, '水', '80  g', '', '', 1),
(174, 1, '白蘿蔔泥', '20  g', '', '', 2),
(174, 1, '沙拉油', '12  g', '', '', 3),
(174, 2, '「ほんだし®/烹大師®」昆布風味', '6  g', '', '0', 0),
(174, 3, '在碗裡倒入水，加入「ほんだし®/烹大師®」昆布風味使其溶解，加入雞蛋後攪拌均勻。', '', '', '1', 0),
(174, 3, '將沙拉油倒入玉子燒專用平底鍋，慢慢倒入蛋汁，煎捲蛋汁並調整形狀。', '', '', '1', 1),
(174, 3, '將分切好的做法②盛裝到容器裡，放上白蘿蔔泥。', '', '', '1', 2),
(175, 1, '涮豬腰肉片', '100  g', '', '', 0),
(175, 1, '熱水', '500c.c.', '', '', 1),
(175, 1, '冰水', '適量', '', '', 2),
(175, 1, '萵苣', '20  g', '', '', 3),
(175, 1, '蔥白絲,辣椒絲 ', '5  g,適量', '', '', 4),
(175, 2, '「ほんだし®/烹大師®」昆布風味', '5  g', '', '0', 0),
(175, 2, '橘醋', '10  g', '', '0', 1),
(175, 3, '先在碗裡準備冰水。', '', '', '1', 0),
(175, 3, '用鍋子煮沸熱水並溶解「ほんだし®/烹大師®」昆布風味，不再讓水煮開，依序汆燙每一片肉片後，用做法①冰鎮。', '', '', '1', 1),
(175, 3, '將做法②放到瀝網瀝乾水分。', '', '', '1', 2),
(175, 3, '將萵苣鋪在容器上，盛做法③後用材料Ⓐ裝飾，以畫圓方式淋上橘醋。', '', '', '1', 3),
(176, 1, '高麗菜(切3cm大小) ,小黃瓜(切薄片),薑絲', '70  g,30  g,適量', '', '', 1),
(176, 2, '「ほんだし®/烹大師®」昆布風味', '5  g', '', '0', 1),
(176, 3, '先在碗裡放入材料Ⓐ、「ほんだし®/烹大師®」昆布風味後醃製10分鐘。', '', '', '1', 0),
(176, 3, '盛裝做法①即可。', '', '', '1', 1),
(178, 1, '鯖魚(半隻)(冷凍/解凍)', '200  g', '', '', 0),
(178, 1, '水', '500c.c.', '', '', 1),
(178, 1, '白蘿蔔泥', '10  g', '', '', 2),
(178, 2, '「ほんだし®/烹大師®」昆布風味 ', '2.5  g', '', '0', 0),
(178, 3, '在盤子裡攪拌混合水、「ほんだし®/烹大師®」昆布風味，將鯖魚浸在盤中30分鐘以上。', '', '', '1', 0),
(178, 3, '瀝去做法①的水分，加熱烤網，將鯖魚烤至焦黃色。', '', '', '1', 1),
(178, 3, '將做法②盛裝到容器裡，放上白蘿蔔泥。', '', '', '1', 2),
(179, 1, '義大利麵(水煮)', '200  g', '', '', 0),
(179, 1, '蛤蜊', '100  g', '', '', 1),
(179, 1, '酒', '50c.c.', '', '', 2),
(179, 1, '細香蔥(蔥花) ', '適量', '', '', 3),
(179, 1, '奶油', '26  g', '', '', 4),
(179, 1, '芥末', '6  g', '', '', 5),
(179, 1, '檸檬汁', '4c.c.', '', '', 6),
(179, 2, '「ほんだし®/烹大師®」昆布風味', '6  g', '', '0', 0),
(179, 3, '碗裡拌勻「ほんだし®/烹大師®」昆布風味、奶油、芥末、檸檬汁，製作芥末奶油(1人份20g)，可多製作一些，用保鮮膜包住後冷凍保存。', '', '', '1', 0),
(179, 3, '將已吐沙的蛤蜊放入平底鍋，加酒蓋上鍋蓋，用酒蒸至蛤蜊殼打開。', '', '', '1', 1),
(179, 3, ' 在做法②加入煮好的義大利麵、做法①，攪拌均勻。', '', '', '1', 2),
(179, 3, '將做法③盛裝到容器裡，撒上細香蔥。', '', '', '1', 3),
(180, 1, '蛤蜊 ', '200g', '', '', 0),
(180, 1, '酒 ', '30c.c.', '', '', 1),
(180, 1, '萬用蔥(蔥花)', '適量', '', '', 2),
(180, 2, '「ほんだし®/烹大師®」昆布風味', '3  g', '', '0', 0),
(180, 3, '在鍋子裡放入蛤蜊、酒、「ほんだし®/烹大師®」昆布風味，蓋上鍋蓋，蒸煮到蛤蜊殼打開。', '', '', '1', 0),
(180, 3, '將做法①盛裝到容器裡，撒上萬用蔥。', '', '', '1', 1),
(162, 1, '綜合海鮮', '180  g', '', '', 0),
(162, 1, '沙拉油', '12  g', '', '', 1),
(162, 1, '水 ', '600  g', '', '', 2),
(162, 1, '白飯', '800g', '', '', 3),
(162, 1, '洋蔥(切瓣),紅蘿蔔(隨意切) ,蓮藕(隨意切),鴻喜菇(小瓣)', '60  g,50  g,50  g,50  g', '', '', 4),
(162, 2, '「ほんだし®/烹大師®」鰹魚風味', '4g', '', '0', 1),
(162, 2, '咖哩塊', '130  g', '', '0', 2),
(162, 3, '將沙拉油倒入鍋中，放入材料Ⓐ拌炒，接著加入綜合海鮮。', '', '', '1', 0),
(162, 3, '將做法①倒入水煮開，撈出雜質，接著放入咖哩塊，確認完全溶解。', '', '', '1', 1),
(162, 3, '將「ほんだし®/烹大師®」鰹魚風味加入做法②調整味道，完成烹調。', '', '', '1', 2),
(162, 3, '將白飯裝入碗裡，淋上做法③。', '', '', '1', 3),
(164, 1, '米', '3杯', '', '', 1),
(164, 1, '水', '適量', '', '', 2),
(164, 1, '雞胸肉(切絲),香菇(切片) ,豆皮(切絲) ,鴻喜菇(小瓣) ,紅蘿蔔(切絲),牛蒡(切絲) ', '60  g,80  g,20  g,45  g,30  g,40g', '', '', 3),
(164, 2, '「ほんだし®/烹大師®」鰹魚風味,水,醬油 ,味醂 ,鹽', '4  g,500c.c.,45c.c.,45c.c.,2g', ',,,,', '0,0,0,0,0', 0),
(164, 3, '在鍋裡攪拌調味料Ⓐ，放入材料Ⓐ後烹煮。', '', '', '1', 0),
(164, 3, '將做法①的配料與高湯分開。', '', '', '1', 1),
(164, 3, '在電鍋裡放入洗好的米與做法②的高湯，調整電鍋裡的水量，加入做法②的配料蒸煮，煮好後攪拌均勻。', '', '', '1', 2),
(164, 3, '將做法③盛裝到容器裡。', '', '', '1', 3),
(181, 1, '蕃茄', '200  g', '', '', 1),
(181, 1, '熱水', '適量', '', '', 2),
(181, 2, '「味之素®」S高鮮味精', '1  g', '', '0', 1),
(181, 2, '鹽', '1g', '', '0', 2),
(181, 3, '用平底鍋炒鹽去除水分，製作調味鹽，以1:1比例拌入「味の素®」S高鮮味精。', '', '', '1', 0),
(181, 3, '在鍋子裡煮開水，迅速汆燙蕃茄後放入冷水中剝皮，接著切片。', '', '', '1', 1),
(181, 3, '在盤子排放做法②後撒上做法①，包上保鮮膜後放入冰箱冰鎮。', '', '', '1', 2),
(181, 3, '將做法③盛放到容器裡。', '', '', '1', 3),
(182, 1, '白飯(冷凍)  ', '200  g', '', '', 1),
(182, 1, '蛋汁', '1顆', '', '', 2),
(182, 1, '蔥末 ', '10  g', '', '', 3),
(182, 1, '沙拉油', '12  g', '', '', 4),
(182, 1, '蝦仁 ,叉燒,冷凍青豆', '15  g,15  g,10  g', '', '', 5),
(182, 2, '鹽', '2  g', '', '0', 1),
(182, 2, '胡椒 ', '適量', '', '0', 2),
(182, 2, '醬油', '適量', '', '0', 3),
(182, 2, '「味之素®」S高鮮味精,水', '6  g,200  g', ',', '0,0', 4),
(182, 3, '將調味料Ⓐ裝入噴瓶，製作鮮味水。', '', '', '1', 0),
(182, 3, '將做法①噴在冷凍白飯上提味，用微波爐加熱。', '', '', '1', 1),
(182, 3, '充分預熱平底鍋，倒入沙拉油，待油布滿鍋底後，放入做法②，邊炒邊打散。', '', '', '1', 2),
(182, 3, '當做法③散開之後，加入材料Ⓐ、鹽、胡椒、醬油調味，並放入蔥末。', '', '', '1', 3),
(182, 3, '將做法④盛裝到容器裡。', '', '', '1', 4),
(189, 1, '小松菜(汆燙)(切5cm長) ', '300g', '', '', 0),
(189, 1, '冰水', '500c.c.', '', '', 1),
(189, 1, '柴魚片', '適量', '', '', 2),
(189, 2, '「味之素®」S高鮮味精', '5  g', '', '0', 0),
(189, 2, '醬油 ', '7  g', '', '0', 1),
(189, 3, '在碗裡放入「味之素®」S高鮮味精，使用冰水製作鮮味水，冰鎮已汆燙的小松菜。', '', '', '1', 0),
(189, 3, '稍微瀝掉做法①的水分，整齊切成容易食用的大小。', '', '', '1', 1),
(189, 3, '將做法②盛裝到容器裡，撒上柴魚片後淋上醬油。', '', '', '1', 2),
(191, 1, '冷凍毛豆', '150  g', '', '', 0),
(191, 2, '鹽', '1  g', '', '0', 0),
(191, 2, '「味之素®」S高鮮味精,水', '2  g,500c.c.', ',', '0,0', 1),
(191, 3, '在碗裡放入調味料Ⓐ，使用鹽製作鮮味水，放入冷凍毛豆解凍。', '', '', '1', 0),
(191, 3, '將瀝過水的做法①盛裝到容器裡。', '', '', '1', 1),
(186, 1, '冷凍花枝捲 ', '150  g', '', '', 1),
(186, 1, '麵粉 ', '適量', '', '', 2),
(186, 1, '蛋汁 ', '適量', '', '', 3),
(186, 1, '麵包粉 ', '適量', '', '', 4),
(186, 1, '沙拉油(油炸用)', '適量', '', '', 5),
(186, 1, '塔塔醬', '15g', '', '', 6),
(186, 1, '高麗菜絲,迷你蕃茄,檸檬瓣', '20  g,15  g,15  g', '', '', 7),
(186, 2, '「味之素®」S高鮮味精,水', '10  g,500c.c.', ',', '0,0', 1),
(186, 3, '在碗裡放入調味料Ⓐ後攪拌，製作鮮味水。', '', '', '1', 0),
(186, 3, '以做法①清洗冷凍花枝捲。', '', '', '1', 1),
(186, 3, '用餐巾紙擦去做法②的水分。', '', '', '1', 2),
(186, 3, '將麵粉撒在做法③上，沾上蛋汁後裹滿麵包粉。', '', '', '1', 3),
(186, 3, '使用加熱至180℃的油來油炸做法④。', '', '', '1', 4),
(186, 3, '將做法⑤、塔塔醬、材料Ⓐ盛裝到容器裡。', '', '', '1', 5),
(16, 1, '豬絞肉', '400  g', '', '', 1),
(16, 1, '紅蘿蔔', '80  g', '', '', 2),
(16, 1, '荸薺', '120  g', '', '', 3),
(16, 1, '蛋', '1顆', '', '', 4),
(16, 1, '蔥', '1根', '', '', 5),
(16, 1, '薑', '30  g', '', '', 6),
(16, 1, '芋頭', '150  g', '', '', 7),
(16, 1, '地瓜', '150  g', '', '', 8),
(16, 2, '「ほんだし ®/烹大師®」干貝風味', '1大匙', '', '0', 1),
(16, 2, '醬油', '1小匙', '', '0', 2),
(16, 2, '米酒', '1大匙', '', '0', 3),
(16, 2, '胡椒粉', '1/2小匙', '', '0', 4),
(16, 2, '香油', '1小匙', '', '0', 5),
(16, 2, '太白粉', '2大匙', '', '0', 6),
(16, 3, '紅蘿蔔切末，荸薺切末，蔥、薑切末，芋頭及地瓜切丁狀。', '', '', '1', 0),
(16, 3, '先將豬絞肉、紅蘿蔔、荸薺、 蛋、蔥、薑、「ほんだし ®/烹大師®」干貝風味等所有調味料拌勻，再分成6等份球狀。', '', '', '1', 1),
(16, 3, '再將肉球分別沾上芋頭丁及地瓜丁，放入蒸鍋内大火蒸15分鐘即可。', '', '', '1', 2),
(16, 3, '※美味方程式：也可改為油炸至熟', '', '', '0', 3),
(34, 1, '柳松菇', '50g', '', '', 1),
(34, 1, '秀珍菇', '50g', '', '', 2),
(34, 1, '杏鮑菇', '2支', '', '', 3),
(34, 1, '西洋芹', '2支', '', '', 4),
(34, 1, '素火腿', '20g', '', '', 5),
(34, 1, '紅甜椒', '20g', '', '', 6),
(34, 1, '黃甜椒', '20g', '', '', 7),
(34, 2, '「ほんだし ®/烹大師®」昆布風味', '1小匙', '', '0', 1),
(34, 2, '鹽', '1/2小匙', '', '0', 2),
(34, 2, '素蠔油', '適量', '', '0', 3),
(34, 3, '西洋芹去老皮、切細斜刀、素火腿切絲備用。', '', '', '1', 0),
(34, 3, '秀珍菇切段、紅甜椒、黃甜椒切絲汆燙備用。', '', '', '1', 1),
(34, 3, '杏鮑菇改刀煎至金黃色備用、柳松菇用素蠔油先行燉煮。', '', '', '1', 2),
(34, 3, ' 將上述材料與「ほんだし ®/烹大師®」昆布風味、鹽充分攪拌即可。', '', '', '1', 3),
(34, 3, '※美味方程式：此道料理也可用熱炒的方式呈現。', '', '', '0', 4),
(35, 1, '大草蝦', '6隻', '', '', 1),
(35, 1, '新鮮干貝', '100g', '', '', 2),
(35, 1, '蘆筍', '2支', '', '', 3),
(35, 1, '柳丁', '1顆', '', '', 4),
(35, 1, '柳松菇', '50g', '', '', 5),
(35, 1, '檸檬', '半顆', '', '', 6),
(35, 1, '辣椒', '1條', '', '', 7),
(35, 1, '蒜仁', '3顆', '', '', 8),
(35, 2, '「ほんだし ®/烹大師®」干貝風味', '1小匙', '', '0', 1),
(35, 2, '胡椒粉', '少許', '', '0', 2),
(35, 2, '鹽', '少許', '', '0', 3),
(35, 2, '芡汁', '1大匙', '', '0', 4),
(35, 3, '蘆筍切斜段、柳松菇去蒂，兩者汆燙備用。', '', '', '1', 0),
(35, 3, '蝦去頭去殼剖背挑泥腸，蝦筋斬斷鋪平，灑胡椒粉、鹽後，沾吉士粉煎至金黃色備用。', '', '', '1', 1),
(35, 3, '將新鮮干貝汆燙備用。', '', '', '1', 2),
(35, 3, '檸檬擠汁、柳丁去皮取肉切小丁。', '', '', '1', 3),
(35, 3, '蒜仁、辣椒切片爆香，將做法①、②、③ 等放入鍋中拌炒。', '', '', '1', 4),
(35, 3, '最後加入半碗水、與做法④及「ほんだし ®/烹大師®」干貝風味與芡汁，拌炒均勻即可。', '', '', '1', 5),
(35, 3, '※美味方程式：將新鮮干貝用「ほんだし ®/烹大師®」干貝風味稍微醃製，可提升新鮮干貝的原有風味喔！', '', '', '0', 6),
(36, 1, '小鱸魚', '600g', '', '', 1),
(36, 1, '南瓜', '300g', '', '', 2),
(36, 1, '枸杞', '20  g', '', '', 3),
(36, 1, '薑片', '少許', '', '', 4),
(36, 1, '蒜段', '少許', '', '', 5),
(36, 1, '蔥花', '少許', '', '', 6),
(36, 1, '水', '1000c.c.', '', '', 7),
(36, 2, '「ほんだし ®/烹大師®」干貝風味,鹽', '1/2小匙,1/4小匙', ',', '0,0', 1),
(36, 3, '鱸魚切段後，熱鍋爆薑片，將鱸魚的表面煎至金黃後，取出備用。', '', '', '1', 0),
(36, 3, '南瓜切片約1公分厚、枸杞泡水備用。', '', '', '1', 1),
(36, 3, '南瓜用蒸籠蒸過取出，保留蒸過的高湯水與南瓜片備用。', '', '', '1', 2),
(36, 3, '將做法 ③的高湯再加上1，000c.c.的水，煮滾後加入鱸魚、南瓜片、枸杞、蒜段等。當再次煮滾時，放入調味料Ⓐ、蔥花即可。', '', '', '1', 3),
(36, 3, '※美味方程式：將南瓜預先蒸過，可保留其原形、減少烹煮的時間。', '', '', '0', 4),
(37, 1, '花枝', '75g', '', '', 1),
(37, 1, '蛤蜊', '10粒', '', '', 2),
(37, 1, '蝦仁', '6隻', '', '', 3),
(37, 1, '魚板', '少許', '', '', 4),
(37, 1, '白飯', '1碗', '', '', 5),
(37, 1, '蒜頭酥', '1小匙', '', '', 6),
(37, 1, '水', '1500c.c.', '', '', 7),
(37, 2, '「ほんだし ®/烹大師®」干貝風味', '3小匙', '', '0', 1),
(37, 2, '鹽', '1/2小匙', '', '0', 2),
(37, 2, '白胡椒', '1/4小匙', '', '0', 3),
(37, 3, '魚板切絲、花枝背面斜切雕花。', '', '', '1', 0),
(37, 3, '蝦仁剖背取沙腸、蛤蜊吐沙備用。', '', '', '1', 1),
(37, 3, '將水煮滾、轉小火依序加入花枝、蝦仁、蛤蜊、魚板等，待水再次沸騰時，加入「ほんだし ®/烹大師®」干貝風味及其他調味料。', '', '', '1', 2),
(37, 3, ' 最後加上少許蒜頭酥即可。 ※美味方程式：台式粥品與廣式粥', '', '', '1', 3),
(37, 3, '※美味方程式：台式粥品與廣式粥品不同點在於，台式粥品是用白飯直接與食材烹煮，所以吃得到粒粒分明的米粒，且烹調時間較短。廣東粥是慢火去熬煮，粥品呈現較糊，但口感濃郁。', '', '', '0', 4),
(43, 1, '杏鮑菇', '150g', '', '', 1),
(43, 1, '吉士粉', '1大匙 ', '', '', 2),
(43, 1, '水', '1大匙 ', '', '', 3),
(43, 2, '「ほんだし ®/烹大師®」昆布風味', '1/2小匙', '', '0', 1),
(43, 2, '鹽', '1/4小匙', '', '0', 2),
(43, 2, '七味粉', '少許', '', '0', 3),
(43, 3, '杏鮑菇切厚片備用。 ', '', '', '1', 0),
(43, 3, '吉士粉與水攪拌均勻。 ', '', '', '1', 1),
(43, 3, '將杏鮑菇與做法②，充分拌勻。 ', '', '', '1', 2),
(43, 3, '熱鍋後，將做法③放入油鍋中炸至酥香。 撈出、瀝油，再灑「ほんだし ®/烹大師®」昆布風味及其他調味料即可。 ', '', '', '1', 3),
(43, 3, '※美味方程式： 此道料理亦可更換其他不同的食材。', '', '', '0', 4),
(44, 1, '豬肋排', '50  g', '', '', 1),
(44, 1, '青花菜', '4朵', '', '', 2),
(44, 1, '洋蔥', '1顆', '', '', 3),
(44, 1, '薑', '2片', '', '', 4),
(44, 1, '蒜頭', '2顆', '', '', 5),
(44, 1, '蔥', '2支', '', '', 6),
(44, 2, '「ほんだし ®/烹大師®」鰹魚風味', '2小匙', '', '0', 1),
(44, 2, '酒', '1/6杯', '', '0', 2),
(44, 2, '醬油', '1/6杯', '', '0', 3),
(44, 2, '冰糖', '2大匙', '', '0', 4),
(44, 2, '七味粉', '適量', '', '0', 5),
(44, 2, '芝麻', '適量', '', '0', 6),
(44, 2, '柴魚片', '35  g', '', '0', 7),
(44, 2, '水', '500c.c.', '', '0', 8),
(44, 3, '豬肋排先以熱油炸過，洋蔥切塊、薑切片。', '', '', '1', 0),
(44, 3, '青花菜切成小朵、燙熟後擺至餐盤四周裝飾備用。', '', '', '1', 1),
(44, 3, '「ほんだし ®/烹大師®」鰹魚風味0.5小匙與柴魚片加水熬成柴魚湯(將湯汁過濾備用)。', '', '', '1', 2),
(44, 3, '炒香洋蔥、蔥、蒜頭後，放入做法①和做法③，煮滾後加入「ほんだし ®/烹大師®」鰹魚風味1.5小匙與其他的調味料，一起燜煮再蓋上鍋蓋以小火悶煮60~70分鐘。', '', '', '1', 3),
(44, 3, '將做法④的豬肋排撈起，以炒鍋收乾，並勾薄芡、淋上香油、灑上芝麻，即可裝盤上桌。', '', '', '1', 4),
(44, 3, '※美味方程式：煲豬肋排先以大火燒滾後，在以小火燜煮才能入味。', '', '', '0', 5),
(45, 1, '四神湯料包(蓮子、淮山、薏仁、茯苓)', '1包', '', '', 1),
(45, 1, '豬小腸', '300g', '', '', 2),
(45, 1, '豬排骨', '150g', '', '', 3),
(45, 1, '枸杞', '少許', '', '', 4),
(45, 1, '水', '1500c.c.', '', '', 5),
(45, 2, '「ほんだし ®/烹大師®」昆布風味', '1小匙', '', '0', 1),
(45, 2, '鹽', '1/2小匙', '', '0', 2),
(45, 2, '酒', '1大匙', '', '0', 3),
(45, 2, '麵粉', '少許', '', '0', 4),
(45, 2, '沙拉油', '少許', '', '0', 5),
(45, 3, '將豬排骨放入鍋中，小火慢煮20分鐘。 ', '', '', '1', 0),
(45, 3, '將四神湯料包洗淨、並把淮山、薏仁、茯苓泡水約30分鐘備用。 ', '', '', '1', 1),
(45, 3, '將做法②與水一起熬煮， 加入調味料Ⓐ後，放入鍋中蒸30分鐘。 ', '', '', '1', 2),
(45, 3, '將豬小腸以麵粉和沙拉油搓洗，洗淨後切小段，汆燙備用。  加入做法②，蒸30分鐘，起鍋前再加入枸杞即可。 ', '', '', '1', 3),
(45, 3, '※美味方程式：一般四神湯的湯料是蓮子、淮山、芡實、茯苓， 但為節省成本，建議可將芡實改為薏仁。    ', '', '', '0', 4),
(50, 1, '水', '1500c.c.', '', '', 1),
(50, 1, '鱸魚,蛤蜊,牡蠣,蝦仁,魚丸,魚板', '150  g,8粒,8粒,4隻,4粒,4片', '', '', 2),
(50, 1, '嫩豆腐', '半塊', '', '', 3),
(50, 1, '小白菜', '1顆', '', '', 4),
(50, 1, '蔥花', '少許', '', '', 5),
(50, 2, '「ほんだし ®/烹大師®」鰹魚風味', '3小匙', '', '0', 1),
(50, 2, '糖', '1/4小匙 ', '', '0', 2),
(50, 2, '味噌', ' 2小匙 ', '', '0', 3),
(50, 2, '米酒', '1小匙 ', '', '0', 4),
(50, 3, '將味噌放至濾網中邊過篩、邊與水調勻。 ', '', '', '1', 0),
(50, 3, '待1500c.c.水沸騰後，加入材料Ⓐ。', '', '', '1', 1),
(50, 3, '二次沸騰後，加入嫩豆腐、小白菜、「ほんだし ®/烹大師®」鰹魚風味及其他調味料，灑上蔥花即可。  ', '', '', '1', 2),
(50, 3, '※美味方程式：可再加上柴魚花增加風味。  ', '', '', '0', 3),
(51, 1, '蕎麥麵', '100g', '', '', 1),
(51, 1, '鮭魚卵', '30  g', '', '', 2),
(51, 1, '蟹柳絲', '35  g', '', '', 3),
(51, 1, '蔥花', '1支 ', '', '', 4),
(51, 1, '海苔絲', '10g', '', '', 5),
(51, 1, '生蛋黃', '1顆 ', '', '', 6),
(51, 1, '芝麻', '1小匙 ', '', '', 7),
(51, 1, '水', '500c.c.', '', '', 8),
(51, 2, '「ほんだし ®/烹大師®」鰹魚風味,淡味醬油,味醂,柴魚片', '1小匙,70c.c. ,70c.c. ,30g  ', ',,,', '0,0,0,0', 1),
(51, 3, '將蕎麥麵放入滾水中，汆燙約5~7分鐘，用網杓撈起迅速放入冷水中，用水搓洗、去除麵條上的黏滑，瀝乾水分後放在碗內備用。  ', '', '', '1', 0),
(51, 3, '將蟹柳絲放在蕎麥麵上，中間放上鮭魚卵，再將蔥花、蛋黃放入已調好的調味料Ⓐ。灑上海苔絲、芝麻即可。  ', '', '', '1', 1),
(51, 3, '※美味方程式：可搭配小黃瓜絲、蛋絲、蝦、海鮮等配料。 ', '', '', '0', 2),
(52, 1, '芋頭', '200  g', '', '', 1),
(52, 1, '蟹管肉', '35  g', '', '', 2),
(52, 1, '蝦仁', '50g', '', '', 3),
(52, 1, '鮮干貝', '40g', '', '', 4),
(52, 1, '蘆筍', '75g', '', '', 5),
(52, 1, '香菇', '2朵', '', '', 6),
(52, 1, '紅蘿蔔', '25g', '', '', 7),
(52, 1, '蔥', '1支', '', '', 8),
(52, 1, '蒜蓉', '1小匙', '', '', 9),
(52, 1, '夏威夷豆', '12顆', '', '', 10),
(52, 2, '「ほんだし ®/烹大師®」干貝風味', '1小匙', '', '0', 1),
(52, 2, '蠔油', '1小匙', '', '0', 2),
(52, 2, 'XO醬干貝醬', '1小匙', '', '0', 3),
(52, 2, '太白粉', '1小匙', '', '0', 4),
(52, 2, '香油', '1小匙', '', '0', 5),
(52, 3, '芋頭切絲，用模具炸成盞型。', '', '', '1', 0),
(52, 3, '蟹肉、蝦仁、帶子切小丁，用溫油過油撈起。', '', '', '1', 1),
(52, 3, '蔥切成段、蘆筍切斜段，香菇、紅蘿蔔切片備用。', '', '', '1', 2),
(52, 3, '先炒香蔥、蒜蓉，加入做法③及XO干貝醬略炒。', '', '', '1', 3),
(52, 3, '在做法④中加入做法②的食材，以「ほんだし ®/烹大師®」干貝風味及其他調味料，用大火快速翻炒均勻，裝入小芋巢撒上夏威夷豆即可。', '', '', '1', 4),
(52, 3, '※美味方程式：XO干貝醬可用「ほんだし ®/烹大師®」干貝風味做調味，風味更加豐富。', '', '', '0', 5),
(53, 1, '生蠔', '4顆', '', '', 1),
(53, 1, '雞蛋', '1顆', '', '', 2),
(53, 1, '卷鬚生菜', '50g', '', '', 3),
(53, 1, '蘿蔓生菜', '4片', '', '', 4),
(53, 1, '海苔絲', '10g', '', '', 5),
(53, 2, '「ほんだし ®/烹大師®」干貝風味', '3小匙', '', '0', 1),
(53, 2, '七味粉', '3小匙', '', '0', 2),
(53, 2, '黑白芝麻', '各15g', '', '0', 3),
(53, 2, '麵粉', '50g', '', '0', 4),
(53, 2, '麵包粉', '1杯', '', '0', 5),
(53, 2, '美乃滋', '適量', '', '0', 6),
(53, 3, '生蠔去殼、將生蠔肉取出洗淨，殼備用。', '', '', '1', 0),
(53, 3, '生蠔先沾麵粉再沾雞蛋、麵包粉，熱油鍋以150~160 ℃ 的高溫油炸，炸約2~3分鐘。至生蠔顏色金黃酥脆，瀝乾油即可。', '', '', '1', 1),
(53, 3, '將「ほんだし ®/烹大師®」干貝風味及其他調味料一起混合並磨碎。', '', '', '1', 2),
(53, 3, '依序將生菜、炸生蠔放入生蠔殼內，灑上做法③及美乃滋、綴以海苔絲即可。', '', '', '1', 3),
(53, 3, '※美味方程式：如先將生蠔以「ほんだし ®/烹大師®」干貝風味略醃，可提高生蠔的鮮美度。 ', '', '', '0', 4),
(54, 1, '鱸魚', '1尾', '', '', 1),
(54, 1, '油條', '2條', '', '', 2),
(54, 1, '蔥', '2支', '', '', 3),
(54, 1, '薑', '35g', '', '', 4),
(54, 1, '芝麻', '15g', '', '', 5),
(54, 1, '香菜', '15g', '', '', 6),
(54, 1, '水', '1000c.c.', '', '', 7),
(54, 2, '「ほんだし ®/烹大師®」干貝風味', '2小匙', '', '0', 1),
(54, 2, '鹽', '1小匙', '', '0', 2),
(54, 2, '胡椒粉', '適量', '', '0', 3),
(54, 2, '香油', '適量', '', '0', 4),
(54, 3, '鱸魚去頭尾取肉，切薄片。', '', '', '1', 0),
(54, 3, '油條切段，蔥與薑切絲，備用。', '', '', '1', 1),
(54, 3, '將做法②的食材依序排在碗底，上面鋪上做法①灑上芝麻與香菜。', '', '', '1', 2),
(54, 3, '將水煮沸加「ほんだし ®/烹大師®」干貝風味及其他調味料，再次沸騰時淋在魚片上約八分即可。', '', '', '1', 3),
(54, 3, '※美味方程式：利用煮沸的「ほんだし ®/烹大師®」干貝風味湯沖泡材料，將食材泡熟可保留香氣。', '', '', '0', 4),
(60, 1, '南瓜', '400  g', '', '', 1),
(60, 1, '地瓜', '1條', '', '', 2),
(60, 1, '洋蔥', '1/2顆', '', '', 3),
(60, 1, '蝦仁', '75g', '', '', 4),
(60, 1, '花枝', '75g', '', '', 5),
(60, 1, '白肉魚', '75g', '', '', 6),
(60, 1, '洋菇', '75g', '', '', 7),
(60, 1, '冬菇', '75g', '', '', 8),
(60, 1, '水', '900c.c.', '', '', 9),
(60, 2, '「ほんだし ®/烹大師®」干貝風味', '2小匙', '', '0', 1);
INSERT INTO `recipepro_detail` (`recipepro_id`, `class`, `names`, `contents`, `links`, `blanks`, `list_order`) VALUES
(60, 2, '鹽', '2小匙', '', '0', 2),
(60, 2, '奶油', '1塊', '', '0', 3),
(60, 2, '鮮奶油', '1小杯', '', '0', 4),
(60, 2, '胡椒粉', '適量', '', '0', 5),
(60, 3, '南瓜、地瓜去皮蒸約20分鐘，切成丁狀，洋蔥切成丁狀，事先炒熟。', '', '', '1', 0),
(60, 3, '將做法① 的食材加1杯水用果汁機打成泥。', '', '', '1', 1),
(60, 3, '蝦仁、花枝、白肉魚切小塊，洋菇、冬菇切小丁。', '', '', '1', 2),
(60, 3, '水煮沸加入做法② 待滾時，加入全部材料。當再次沸騰後等3~5分鐘。', '', '', '1', 3),
(60, 3, '加入「ほんだし ®/烹大師®」干貝風味及其他的調味料再次沸騰後即可裝盤。', '', '', '1', 4),
(60, 3, '※美味方程式：可加入些許烘烤的麵包丁，增加豐富感。', '', '', '0', 5),
(71, 1, '南瓜', '120  g', '', '', 1),
(71, 1, '草蝦仁', '150  g', '', '', 2),
(71, 1, '草蝦', '4尾', '', '', 3),
(71, 1, '白膘', '20g', '', '', 4),
(71, 1, '芹菜', '25  g', '', '', 5),
(71, 1, '荸薺', '2顆', '', '', 6),
(71, 1, '魚子醬', '1小匙', '', '', 7),
(71, 1, '蛋白', '5  g', '', '', 8),
(71, 2, '「ほんだし ®/烹大師®」鰹魚風味,鹽,玉米粉,香油,胡椒粉', '1/3小匙,1/4小匙,4g,適量,適量', ',,,,', '0,0,0,0,0', 1),
(71, 2, '「ほんだし ®/烹大師®」鰹魚風味,鹽,香油,太白粉,水', '1/2小匙,1/3小匙,1大匙,1小匙,200c.c.', ',,,,', '0,0,0,0,0', 2),
(71, 3, '南瓜切葉型薄片約30片、草蝦去殼留尾。', '', '', '1', 0),
(71, 3, '草蝦仁拍成泥後，加入芹菜末、荸薺末、白膘、蛋白與調味料Ⓐ，拌成蝦泥。', '', '', '1', 1),
(71, 3, '將做法②揉成蝦丸、鑲入草蝦露出蝦尾，再將南瓜片依序黏上蝦丸，放入蒸籠蒸5~6分鐘。', '', '', '1', 2),
(71, 3, '水煮沸，加入調味料Ⓑ及魚子醬輕攪拌勻，將製好的芡汁淋上做法③即可。', '', '', '1', 3),
(71, 3, '※美味方程式：白膘即為將已切成片的五花肉先以煮熟或是蒸過一遍後去除油膩的肉片。', '', '', '0', 4),
(74, 1, '蟹管肉', '50g', '', '', 1),
(74, 1, '花枝', '60  g', '', '', 2),
(74, 1, '蝦仁', '60g', '', '', 3),
(74, 1, '鮭魚', '60g', '', '', 4),
(74, 1, '豆腐', '1合', '', '', 5),
(74, 1, '冬菇', '2朵', '', '', 6),
(74, 1, '甜豆', '30g', '', '', 7),
(74, 1, '洋菇', '2朵', '', '', 8),
(74, 1, '火腿', '2片', '', '', 9),
(74, 1, '蟹黃', '30g', '', '', 10),
(74, 1, '蔥', '1支', '', '', 11),
(74, 1, '薑', '1片', '', '', 12),
(74, 1, '紅蔥頭', '2粒', '', '', 13),
(74, 2, '「ほんだし ®/烹大師®」鰹魚風味', '2小匙', '', '0', 1),
(74, 2, '鹽', '1/2小匙', '', '0', 2),
(74, 2, '太白粉水', '適量', '', '0', 3),
(74, 2, '酒', '1小匙', '', '0', 4),
(74, 2, '胡椒粉', '適量', '', '0', 5),
(74, 2, '香油', '適量', '', '0', 6),
(74, 2, '油', '2大匙', '', '0', 7),
(74, 2, '水', '250c.c.', '', '0', 8),
(74, 3, '將蟹管肉、花枝、蝦仁、鮭魚切粗丁，豆腐切方塊丁，以熱水汆燙。', '', '', '1', 0),
(74, 3, '將冬菇、甜豆、洋菇、火腿切細丁，蔥切成蔥花備用，再將薑與紅蔥頭切成末。', '', '', '1', 1),
(74, 3, '倒入2大匙油至鍋中，炒香做法②備用。', '', '', '1', 2),
(74, 3, '在做法③中放入水，和豆腐略煮2分鐘後再放入做法①，並以「ほんだし ®/烹大師®」鰹魚風味、鹽調味。', '', '', '1', 3),
(74, 3, ' 最後加入蟹黃煮1分鐘，以太白粉水勾芡即可。', '', '', '1', 4),
(74, 3, '※美味方程式：蟹黃不可烹調過久，以免老化，可先行蒸或炒熟，另行放入。', '', '', '0', 5),
(81, 1, '牛蕃茄', '100g', '', '', 1),
(81, 1, '馬鈴薯', '120  g', '', '', 2),
(81, 1, '高麗菜', '160g', '', '', 3),
(81, 1, '紅蘿蔔', '100g', '', '', 4),
(81, 1, '西芹', '60g', '', '', 5),
(81, 1, '水', '800c.c.', '', '', 6),
(81, 2, '「ほんだし ®/烹大師®」昆布風味', '2小匙', '', '0', 1),
(81, 2, '蕃茄糊', '10大匙', '', '0', 2),
(81, 2, '橄欖油', '2小匙', '', '0', 3),
(81, 3, '紅蘿蔔、馬鈴薯削皮切滾刀狀；蕃茄切片狀；西芹去厚皮，切段；高麗菜切塊備用。', '', '', '1', 0),
(81, 3, '熱鍋下些許橄欖油將蕃茄糊炒香，再加水及「ほんだし ®/烹大師®」昆布風味。', '', '', '1', 1),
(81, 3, '待水滾時，加入做法①、②以小火燉煮約50分鐘即可。', '', '', '1', 2),
(81, 3, ' ※美味方程式：非素食者可加入牛膝肉及洋蔥等食材，增加風味。', '', '', '0', 3),
(82, 1, '日本山藥', '300g', '', '', 1),
(82, 1, '蟹肉', '80g', '', '', 2),
(82, 1, '蟹黃', '80g', '', '', 3),
(82, 1, '紅蘿蔔泥', '75g', '', '', 4),
(82, 1, '枸杞', '10g', '', '', 5),
(82, 1, '蝦米', '適量', '', '', 6),
(82, 1, '香菜', '適量', '', '', 7),
(82, 1, '水', '200c.c.', '', '', 8),
(82, 2, '「ほんだし ®/烹大師®」昆布風味', '1小匙', '', '0', 1),
(82, 2, '沙拉油', '50c.c.', '', '0', 2),
(82, 2, '太白粉', '適量', '', '0', 3),
(82, 3, '山藥削皮洗淨，刨成細條狀，捲起入鍋蒸3分鐘取出。', '', '', '1', 0),
(82, 3, '蟹肉燙水撈起，剁碎備用。蝦米剁碎。枸杞泡水備用。', '', '', '1', 1),
(82, 3, '熱鍋下油爆香蝦米，加入水、「ほんだし ®/烹大師®」昆布風味、蟹肉、蟹黃、紅蘿蔔泥，小火慢煮熟成蟹粉醬汁。', '', '', '1', 2),
(82, 3, '最後再以太白粉勾茨，淋於做法①，灑上枸杞、香菜即可。', '', '', '1', 3),
(82, 3, '※美味方程式：蟹粉醬汁也可以水果醋替代，成為另一道夏日涼品。', '', '', '0', 4),
(115, 1, '子排', '4支', '', '', 1),
(115, 1, '蔥', '1枝', '', '', 2),
(115, 1, '薑片', '2片', '', '', 3),
(115, 1, '開洋', '少許', '', '', 4),
(115, 1, '冬菜', '少許', '', '', 5),
(115, 1, '肉末', '少許', '', '', 6),
(115, 1, '蔥花', '少許', '', '', 7),
(115, 1, '薑末', '少許', '', '', 8),
(115, 1, '辣椒末', '少許', '', '', 9),
(115, 1, '蒜末', '少許', '', '', 10),
(115, 1, '蒜頭酥', '1大匙', '', '', 11),
(115, 1, '酥炸粉', '1碗', '', '', 12),
(115, 2, '醃料：,「ほんだし ®/烹大師®」雞粉', ',1大匙', ',', '0,0', 1),
(115, 2, '炒料：,「ほんだし ®/烹大師®」鰹魚風味,胡椒粉,鹽,水,梅林醬,香油', ', 1/2大匙,少許,少許,1碗,少許,1/2大匙', ',,,,,,', '0,0,0,0,0,0,0', 2),
(115, 3, '子排連同水、「ほんだし ®/烹大師®」雞粉、蔥、薑醃1天，再放入電鍋中蒸50分鐘。', '', '', '1', 0),
(115, 3, '開洋、冬菜洗淨剁碎備用。', '', '', '1', 1),
(115, 3, '蒸好子排沾酥炸粉炸至酥香撈出油倒掉，加入肉末、開洋末、冬菜末、蔥花、蒜末、     薑末、辣椒末、蒜頭酥爆香，再放入子排、「ほんだし ®/烹大師®」鰹魚風味、鹽、胡椒粉、香油、梅林醬等拌勻即可。', '', '', '1', 2),
(115, 3, '※美味方程式：先醃再炒，香氣十足。', '', '', '0', 3),
(197, 1, '春捲皮', '8片', '', '', 0),
(197, 1, '牛肉薄片', '150g', '', '', 1),
(197, 1, '蕃茄(切丁)', '200g', '', '', 2),
(197, 1, '太白粉水', '少許', '', '', 3),
(197, 1, '沙拉油', '12g', '', '', 4),
(197, 1, '小蕃茄(切5mm寬輪狀),萵苣(切1cm寬條狀),酪梨(切7~8mm寬條狀)', '120g,240g,140g', '', '', 5),
(197, 2, '「ほんだし®/烹大師®」雞粉,砂糖,孜然粉', '5g,3g,2g(可依個人喜好添加)', ',,', '0,0,0', 0),
(197, 2, '「味之素品牌」沙拉醬,豆瓣醬,蜂蜜', '30g,12g,14g(可依個人喜好添加)', ',,', '0,0,0', 1),
(197, 3, '起鍋熱油，放入牛肉，炒至牛肉變色後加入蕃茄丁、調味料Ⓐ繼續拌炒後，放入太白粉水勾芡後，盛盤放冷。', '', '', '1', 0),
(197, 3, '將春捲皮舖平後依序放入材料Ⓐ的食材及做法1後捲起。', '', '', '1', 1),
(197, 3, '將每條春捲切成3等分，切面朝上，盛盤，盤邊綴以拌好的調味料Ⓑ。', '', '', '1', 2),
(199, 1, '油菜花(先汆燙後切成4cm段)', '200g', '', '', 0),
(199, 1, '雞里肌肉', '75g', '', '', 1),
(199, 1, '鴻喜菇(撕成小瓣),紅蘿蔔(切絲)', '45g,', '', '', 2),
(199, 1, '白芝麻細粒,香油', '9g,4g', '', '', 3),
(199, 2, '酒,鹽,胡椒', '15c.c.,1g,少許', ',,', '0,0,0', 0),
(199, 2, '「味之素品牌」沙拉醬,「ほんだし®/烹大師®」鰹魚風味', '45g,1.5g', ',', '0,0', 1),
(199, 3, '耐熱容器底部先放入材料Ⓐ，再舖上雞里肌肉撒入調味料Ⓐ。以保鮮膜封住後放入微波爐(600W)加熱4分30秒後，放置至熱氣散去後，用手將雞里肌肉撕成小塊。', '', '', '1', 0),
(199, 3, '在碗中放入材料Ⓑ、調味料Ⓑ拌勻作成醬汁。', '', '', '1', 1),
(199, 3, '將油菜花盛盤，舖上做法①，淋上做法②即可。', '', '', '1', 2),
(200, 1, '沙拉油', '8g', '', '', 0),
(200, 1, '雞絞肉,青蔥細丁,薑汁', '200g,10g,3g', '', '', 1),
(200, 2, '「味之素品牌」沙拉醬,太白粉,鹽,胡椒', '15g,9g,1.7g,少許', ',,,', '0,0,0,0', 0),
(200, 2, '醬油,米醂,酒,砂糖,「ほんだし®/烹大師®」鰹魚風味', '12c.c.,12c.c.,10c.c.,2g,1.5g', ',,,,', '0,0,0,0,0', 1),
(200, 3, '在碗中放入材料Ⓐ和調味料Ⓐ拌勻，手上塗上少許沙拉油(份量外)後將其分成6等分，搓揉成丸狀。', '', '', '1', 0),
(200, 3, '起鍋熱油，放入做法①。煎至上色後翻面，蓋上鍋蓋，續以小火煎3~4分鐘。', '', '', '1', 1),
(200, 3, '掀開鍋蓋轉中火，加入材料Ⓑ，煎至醬汁收乾即可。', '', '', '1', 2),
(201, 1, '白菜葉切絲', '500g', '', '', 0),
(201, 1, '沙拉油', '24g', '', '', 1),
(201, 1, '低筋麵粉,水,蛋液', '200g,200c.c.,1顆', '', '', 2),
(201, 1, '海苔粉,柴魚片', '適量,適量', '', '', 3),
(201, 2, '「ほんだし®/烹大師®」鰹魚風味', '6g', '', '0', 0),
(201, 2, '大阪燒醬,「味之素品牌」沙拉醬', '適量,5g', ',', '0,0', 1),
(201, 3, '在碗中放入材料Ⓐ、「ほんだし®/烹大師®」鰹魚風味攪拌，再加入白菜拌勻，做成麵糊。', '', '', '1', 0),
(201, 3, '起油鍋先放入一半的油，放入做法①的一半量煎熟。上色後翻面，蓋上鍋蓋後燜燒。另一半亦同樣調理。', '', '', '1', 1),
(201, 3, '盛盤後淋上材料Ⓑ、調味料Ⓐ即可。', '', '', '1', 2),
(202, 1, '紅蘿蔔(條狀),小黄瓜(條狀),白蘿蔔(條狀),蘆筍(煮熟),大頭菜', '60g,60g,50g,40g,30g', '', '', 0),
(202, 1, '牛乳,芝麻細粒', '10g,2g', '', '', 1),
(202, 2, '「味之素品牌」沙拉醬,味噌,「ほんだし®/烹大師®」鰹魚風味,砂糖,辣椒粉', '50g,7.5g,1g,2.5g,適量', ',,,,', '0,0,0,0,0', 0),
(202, 3, '碗中放入調味料Ⓐ和材料Ⓑ拌勻。', '', '', '1', 0),
(202, 3, '盤中擺入材料Ⓐ，再綴以做法①。', '', '', '1', 1),
(203, 1, '生鮪魚片(薄片)', '70g', '', '', 0),
(203, 1, '菊苣,西洋芹(切5cm段),紫洋蔥(切薄片)', '10g,10g,10g', '', '', 1),
(203, 1, '蕪菁(切薄片),羅勒葉,細葉芹', '10g,適量,適量', '', '', 2),
(203, 1, '沙拉油,山葵泥', '25g,3g', '', '', 3),
(203, 2, '「味之素品牌」沙拉醬', '25g', '', '0', 0),
(203, 2, '醬油', '2g', '', '0', 1),
(203, 3, '盤中擺入材料Ⓐ，舖上鮪魚片，撒入材料Ⓑ。', '', '', '1', 0),
(203, 3, '碗中放入材料Ⓒ和「味之素品牌」沙拉醬、醬油拌勻後，淋在做法①上。', '', '', '1', 1),
(204, 1, '雞胸肉', '210g', '', '', 0),
(204, 1, '苦瓜(切成5mm寬半月型)', '120g', '', '', 1),
(204, 1, '蕃茄(切半月型)', '50g', '', '', 2),
(204, 1, '雞肉煮汁', '15c.c.', '', '', 3),
(204, 1, '青蔥,薑片,沙拉油', '10g,3g,12g', '', '', 4),
(204, 1, '柴魚花,花生粒', '適量,17g', '', '', 5),
(204, 2, '酒', '30c.c.', '', '0', 0),
(204, 2, '鹽', '1g', '', '0', 1),
(204, 2, '「味之素品牌」沙拉醬,醬油,「ほんだし®/烹大師®」鰹魚風味', '30g,3c.c.,2g', ',,', '0,0,0', 2),
(204, 3, '雞肉先分成同等大小，放入耐熱容器中加入材料Ⓐ、酒、鹽，以保鮮膜封口放入微波爐(600W)加熱4分鐘。待熱氣散去後切成一口大小。', '', '', '1', 0),
(204, 3, '苦瓜以加入少量砂糖、鹽、油(份量外)的熱水汆燙。', '', '', '1', 1),
(204, 3, '盤中盛入雞肉、苦瓜，撒入材料Ⓑ，淋上拌勻的材料調味料Ⓐ和雞肉煮汁，最後擺上蕃茄裝飾。', '', '', '1', 2),
(205, 1, '豬絞肉', '200g', '', '', 0),
(205, 1, '洋蔥粒', '50g', '', '', 1),
(205, 1, '玉米粒', '175g', '', '', 2),
(205, 1, '蛋白', '15g', '', '', 3),
(205, 1, '太白粉', '適量', '', '', 4),
(205, 1, '荷蘭芹(裝飾用)', '適量', '', '', 5),
(205, 1, '沙拉油', '4g', '', '', 6),
(205, 1, '荷蘭芹,蛋液,麵包粉', '3g,25g,9g', '', '', 7),
(205, 2, '「ほんだし®/烹大師®」雞粉,「味之素品牌」沙拉醬,荷蘭芹,蛋液,麵包粉,鹽,胡椒,酒', '1.5g,15g,3g,25g,9g,1g,少許,15c.c.', ',,,,,,,', '0,0,0,0,0,0,0,0', 0),
(205, 3, '起鍋熱油，將洋蔥炒軟後放涼。', '', '', '1', 0),
(205, 3, '碗中放入豬絞肉、做法①及材料Ⓐ和調味料Ⓐ，拌至有黏性。搓揉成8個肉丸子，塗上蛋白。', '', '', '1', 1),
(205, 3, '玉米粒裹上太白粉，鑲在做法②上，將肉丸子一顆一顆擺到蒸籠紙上。', '', '', '1', 2),
(205, 3, '擺進蒸籠中，以大火蒸10分鐘。蒸好後連同蒸籠紙將肉丸子取出。', '', '', '1', 3),
(205, 3, '擺盤後取下蒸籠紙，再放上荷蘭芹裝飾。', '', '', '1', 4),
(97, 1, '白蘿蔔', '400g', '', '', 1),
(97, 1, '雞翅', '8支(約450g)', '', '', 2),
(97, 1, '薑絲', '少許', '', '', 3),
(97, 1, '水', '500c.c.', '', '', 4),
(97, 2, '「ほんだし ®/烹大師®」鰹魚風味', '1小匙', '', '0', 1),
(97, 2, '酒', '3大匙', '', '0', 2),
(97, 2, '醬油', '3大匙', '', '0', 3),
(97, 2, '砂糖', '2又1/2大匙', '', '0', 4),
(97, 3, '白蘿蔔去皮、切厚約1.5cm的輪狀，以熱水滾煮約30分鐘至熟軟。雞翅以熱水汆燙過後、迅速撈起瀝乾水份。     ', '', '', '1', 0),
(97, 3, '鍋中加入水、「ほんだし ®/烹大師®」鰹魚風味及其他的調味料等，待醬汁沸騰時，加入做法①，續以小火熬煮30分鐘，至湯汁濃稠。', '', '', '1', 1),
(97, 3, '盛盤後加上些許薑絲即可。', '', '', '1', 2),
(2, 1, '白蘿蔔', '1/2條', '', '', 1),
(2, 1, '昆布', '20g', '', '', 2),
(2, 1, '水', '適量', '', '', 3),
(2, 1, '柚子皮', '切絲適量', '', '', 4),
(2, 2, '「ほんだし ®/烹大師®」昆布風味', '2小匙', '', '0', 1),
(2, 2, '醬油', '4大匙', '', '0', 2),
(2, 3, '白蘿蔔、昆布切成適當大小。', '', '', '1', 0),
(2, 3, '放入做法①於鍋內，並加適量水淹至白蘿蔔為止。加入調味料Ⓐ將白蘿蔔燉煮至熟軟為止。', '', '', '1', 1),
(2, 3, '將做法②盛入器皿中，最後灑上切絲的柚子皮。', '', '', '1', 2),
(3, 1, '小芋頭', '8個', '', '', 1),
(3, 1, '茄子', '2條', '', '', 2),
(3, 1, '秋葵', '12根', '', '', 3),
(3, 1, '油', '適量', '', '', 4),
(3, 2, '「ほんだし ®/烹大師®」昆布風味,醬油,味醂,水,鹽', '1小匙,1.5大匙,3大匙,1.5杯,0.5小匙', ',,,,', '0,0,0,0,0', 1),
(3, 2, '薑泥', '適量', '', '0', 2),
(3, 3, '未削皮的芋頭切除兩邊頂端後，放入塑膠袋中，用微波爐(500瓦)加熱約5-6分鐘後剝皮。', '', '', '1', 0),
(3, 3, '將茄子横切約2公分厚，秋葵去除花萼後再各分為2-3等分。', '', '', '1', 1),
(3, 3, '用約180℃的油將做法① 、②炸至酥脆。', '', '', '1', 2),
(3, 3, '將做法③盛入器皿中，淋上已加熱調製完成的調味料 Ⓐ，最後在頂端放置薑泥。', '', '', '1', 3),
(4, 1, '油菜', '1/4束', '', '', 1),
(4, 1, '杏鮑菇', '2支', '', '', 2),
(4, 1, '水', '3杯', '', '', 3),
(4, 2, '「ほんだし ®/烹大師®」昆布風味,鹽,醬油', '1.3小匙,0.5小匙0.5小匙,0.5小匙', ',,', '0,0,0', 1),
(4, 2, ' 柚子皮', '適量', '', '0', 2),
(4, 3, '油菜切約5公分長，將杏鮑菇切半以後再切薄片。', '', '', '1', 0),
(4, 3, '鍋内放入3杯量的水，調味料Ⓐ加熱沸騰後，再加入做法①的油菜、杏鮑菇，再轉中火煮2-3分鐘。', '', '', '1', 1),
(4, 3, '盛入器皿，再依個人喜好放置柚子皮即可。', '', '', '1', 2),
(7, 1, '薄片豬五花肉', '200g', '', '', 1),
(7, 1, '馬鈴薯', '4個', '', '', 2),
(7, 1, '紅蘿蔔', '1個', '', '', 3),
(7, 1, '洋蔥', '1個', '', '', 4),
(7, 1, '豌豆莢', '8枚', '', '', 5),
(7, 1, '水', '3杯', '', '', 6),
(7, 2, '「ほんだし ®/烹大師®」昆布風味', '2小匙', '', '0', 1),
(7, 2, '水', '3杯', '', '0', 2),
(7, 2, '油', '1大匙', '', '0', 3),
(7, 2, '味醂,砂糖,酒', '4大匙,2大匙,2大匙', ',,', '0,0,0', 4),
(7, 2, '醬油,鹽', '4大匙,少許', ',', '0,0', 5),
(7, 3, '馬鈴薯切2~4等分，紅蘿蔔隨意切塊，洋蔥切絲， 豌豆莢拔絲。', '', '', '1', 0),
(7, 3, '熱油後加入豬肉及「ほんだし ®/烹大師®」昆布風味1小匙快炒，半熟後再加入做法①的馬鈴薯、紅蘿蔔、洋蔥、豌豆莢快炒。', '', '', '1', 1),
(7, 3, '將水、「ほんだし ®/烹大師®」昆布風味1小匙，加入調味料Ⓐ中以中火煮10分鐘後，再加入調味料Ⓑ煮10分鐘。', '', '', '1', 2),
(12, 1, '仿土雞腿', '2隻', '', '', 1),
(12, 1, '木瓜', '400g', '', '', 2),
(12, 1, '紅棗', '40g', '', '', 3),
(12, 1, '南、北杏', '20g', '', '', 4),
(12, 1, '水', '1000c.c.', '', '', 5),
(12, 2, '「ほんだし ®/烹大師®」昆布風味', '2大匙', '', '0', 1),
(12, 2, '米酒', '50c.c.', '', '0', 2),
(12, 3, '仿土雞腿剁塊，先以沸水汆燙去血水，再以清水洗淨。', '', '', '1', 0),
(12, 3, '木瓜去皮籽後切塊，紅棗及南北杏洗淨。', '', '', '1', 1),
(12, 3, '將仿土雞腿、木瓜、紅棗、南北杏放入燉盅内，加入1000c.c.的水及米酒，蓋上保鮮膜，隔水燉煮1小時，再放入「ほんだし ®/烹大師®」昆布風味 2大匙調味即可。', '', '', '1', 2),
(13, 1, '板豆腐', '120g', '', '', 1),
(13, 1, '新鮮香菇', '120g', '', '', 2),
(13, 1, '刈薯=洋地瓜=豆薯', '100g', '', '', 3),
(13, 1, '素火腿', '160g', '', '', 4),
(13, 1, '芹菜', '100g', '', '', 5),
(13, 1, '薑', '20g', '', '', 6),
(13, 1, '青江菜', '2株', '', '', 7),
(13, 1, '枸杞', '1大匙', '', '', 8),
(13, 1, '水', '400c.c.', '', '', 9),
(13, 2, '「ほんだし ®/烹大師®」昆布風味 ,麵粉,香油', '1大匙,4大匙,1大匙', ',,', '0,0,0', 1),
(13, 2, '素蠔油', '2大匙', '', '0', 2),
(13, 2, '糖', '1小匙', '', '0', 3),
(13, 2, '胡椒粉', '少許', '', '0', 4),
(13, 2, '太白粉', '1大匙', '', '0', 5),
(13, 3, '板豆腐攪碎，新鮮香菇、刈薯、素火腿、芹菜、薑切碎，再與調味料Ⓐ拌勻，再分成四等份，搓揉成球狀，放入油鍋内炸熟。', '', '', '1', 0),
(13, 3, '青江菜對切後，汆燙熟排盤。', '', '', '1', 1),
(13, 3, ' 鍋内加入400c.c.水煮開，放入炸好的素獅子頭、枸杞、素蠔油、糖、胡椒粉煮3分鐘，再以太白粉水勾芡即可。', '', '', '1', 2),
(165, 1, '白飯', '500  g', '', '', 1),
(165, 1, '飯糰用海苔', '適量', '', '', 2),
(165, 2, '「ほんだし®/烹大師®」鰹魚風味', '2.5  g', '', '0', 1),
(165, 3, '在碗裡放入白飯、「ほんだし®/烹大師®」鰹魚風味攪拌均勻。', '', '', '1', 0),
(165, 3, '用手捏製做法①，包上海苔製作成飯糰。', '', '', '1', 1),
(165, 3, '將做法②盛裝到容器裡。', '', '', '1', 2),
(184, 1, '豬腰肉(厚片)', '150  g', '', '', 1),
(184, 1, '麵粉', '適量', '', '', 3),
(184, 1, '蛋汁', '適量', '', '', 4),
(184, 1, '麵包粉', '適量', '', '', 5),
(184, 1, '沙拉油(油炸用) ', '適量', '', '', 6),
(184, 2, '「味之素®」S高鮮味精', '1  g', '', '0', 1),
(184, 2, '鹽', '1g', '', '0', 2),
(184, 2, '豬排醬汁', '10  g', '', '0', 3),
(184, 3, '以1：1比例混合鹽與「味之素®」S高鮮味精。', '', '', '1', 0),
(184, 3, '切去豬腰肉的筋後拍打，撒上做法①作為提味。', '', '', '1', 1),
(184, 3, '將做法②裹滿麵粉，沾上蛋汁再裹滿麵包粉。', '', '', '1', 2),
(184, 3, '用鍋子將炸油加熱到170℃，放入做法②炸到呈現酥脆褐黃色。', '', '', '1', 3),
(184, 3, '將材料Ⓐ放到容器裡，盛裝切好的做法④，以畫圓方式淋上豬排醬汁。', '', '', '1', 4),
(185, 1, '鮭魚(冷凍) ', '100  g', '', '', 1),
(185, 1, '水 ', '50c.c.', '', '', 2),
(185, 1, '酒', '50c.c.', '', '', 3),
(185, 1, '麵粉', '適量', '', '', 4),
(185, 1, '焦化奶油', '10  g', '', '', 5),
(185, 1, '香芹末', '適量', '', '', 6),
(185, 1, '青花椰菜(水煮)(小瓣) ,馬鈴薯(水煮、切1cm薄片),紅蘿蔔(水煮、一口大小)', '10  g,30  g,20  g', '', '', 7),
(185, 2, '「味之素®」S高鮮味精', '2  g', '', '0', 1),
(185, 2, '橄欖油', '12  g', '', '0', 2),
(185, 2, '檸檬汁', '適量', '', '0', 3),
(185, 3, '在碗裡混合「味之素®」S高鮮味精、水、酒，製作鮮味酒後裝入噴瓶，噴灑在鮭魚上。', '', '', '1', 0),
(185, 3, '在做法①撒上麵粉。', '', '', '1', 1),
(185, 3, '將橄欖油倒入預熱好的平底鍋，將做法②煎至雙面焦黃，轉小火蓋上鍋蓋蒸烤。', '', '', '1', 2),
(185, 3, '在小鍋裡混合焦化奶油、檸檬汁、香芹，製作醬汁。', '', '', '1', 3),
(185, 3, '將做法③、材料Ⓐ盛裝到容器裡，淋上做法④。', '', '', '1', 4),
(154, 1, '貢寮九孔', '4顆', '', '', 1),
(154, 1, '橘皮南瓜', '250g', '', '', 2),
(154, 1, '乾魷魚', '50g', '', '', 3),
(154, 1, '螺肉(罐頭) ', '70  g', '', '', 4),
(154, 1, '高山娃娃菜', '150  g', '', '', 5),
(154, 1, '噶瑪蘭豬五花', '120  g', '', '', 6),
(154, 1, '雞高湯(「ほんだし®」雞粉15g與1公升水量調製) ', '150c.c.', '', '', 7),
(154, 2, '「ほんだし®/烹大師®」昆布風味', '3  g', '', '0', 1),
(154, 2, '白胡椒粉', '2  g', '', '0', 2),
(154, 2, '鹽', '2  g', '', '0', 3),
(154, 2, '醬油 ', '少許', '', '0', 4),
(154, 2, '冰糖 ', '少許', '', '0', 5),
(154, 3, '噶瑪蘭豬五花切塊狀，油炸後用少許冰糖及醬油滷40分鐘，再放入蒸籠蒸約30分鐘取出備用。', '', '', '1', 0),
(154, 3, '橘皮南瓜去皮切塊，乾魷魚泡水後切1公分寬條狀，高山娃娃菜對切，將三種材料汆燙備用。', '', '', '1', 1),
(154, 3, '貢寮九孔汆燙30秒後放入冰水備用。', '', '', '1', 2),
(154, 3, '鍋中放入高山娃娃菜、南瓜塊、做法①的五花肉、魷魚乾、螺肉、雞高湯與螺肉罐頭的汁，再加入調味料燒滾後放上做法③的九孔即可。', '', '', '1', 3),
(187, 1, '手粉', '適量', '', '', 1),
(187, 1, '蛋汁', '適量', '', '', 2),
(187, 1, '麵包粉', '適量', '', '', 3),
(187, 1, '沙拉油(油炸用) ', '適量', '', '', 4),
(187, 1, '「味之素®」沙拉醬', '60g', '', '', 5),
(187, 1, '辣醬油', '50  g', '', '', 6),
(187, 1, '牛奶,牡蠣(去殼)(冷凍) ', '300c.c.,300  g', '', '', 7),
(187, 1, '高麗菜絲,紅蘿蔔(削皮)(切絲),香芹末 ', '60適量,10g,', '', '', 8),
(187, 2, '「味之素®」S高鮮味精', '3  g', '', '0', 1),
(187, 3, '將材料Ⓐ和「味之素」S高鮮味精放入碗裡。', '', '', '1', 0),
(187, 3, '以廚房用餐巾紙擦拭做法①的水分，依序裹上手粉、蛋汁、麵包粉，使用加熱至180℃的油，將做法①油炸到呈現褐黃色。', '', '', '1', 1),
(187, 3, '在不同容器裡放入「味之素®」沙拉醬、辣醬油。 (4) 將做法②、材料Ⓑ盛裝到其他容器，附上做法③。', '', '', '1', 2),
(190, 1, '白飯', '1000  g', '', '', 1),
(190, 1, '鮪魚(骨邊肉)', '600  g', '', '', 2),
(190, 1, '烤海苔 ', '10片', '', '', 3),
(190, 2, '醋,砂糖,鹽,「味之素®」S高鮮味精', '220  g,150  g,50  g,6g', ',,,', '0,0,0,0', 1),
(190, 3, '將調味料Ⓐ放入碗裡攪拌均勻，製作壽司醋。', '', '', '1', 0),
(190, 3, '在木桶裡放入白飯，倒入做法①用飯瓢切拌均勻。', '', '', '1', 1),
(190, 3, '將烤海苔攤開在竹簾上，鋪上做法②後放上鮪魚捲起，切成8等分。', '', '', '1', 2),
(190, 3, '將做法③盛裝在容器裡。', '', '', '1', 3),
(188, 1, '水煮蝦(冷凍、去殼) ', '100  g', '', '', 1),
(188, 1, '香芹末', '適量', '', '', 2),
(188, 1, '千島醬', '30g', '', '', 3),
(188, 1, '青花椰菜(水煮)(小瓣),葉萵苣 ,蒲燒蛋(切絲) ', '50  g,25  g,15  g', '', '', 4),
(188, 2, '「味之素®」S高鮮味精,水', '5  g,500g', ',', '0,0', 1),
(188, 3, '將調味料Ⓐ放入碗裡攪拌，製作鮮味水。', '', '', '1', 0),
(188, 3, '用做法①醃漬冷凍水煮蝦1小時以上。', '', '', '1', 1),
(188, 3, '以餐巾紙擦拭做法②的水分。', '', '', '1', 2),
(188, 3, '將材料Ⓐ鋪在容器裡，盛裝做法③並撒上香芹裝飾，最後淋上千島醬。', '', '', '1', 3),
(177, 1, '綜合海鮮', '300  g', '', '', 1),
(177, 1, '洋蔥(切1cm小丁) ', '400  g', '', '', 2),
(177, 1, '蒜末', '3  g', '', '', 3),
(177, 1, '薑末 ', '5  g', '', '', 4),
(177, 1, '咖哩塊', '100  g', '', '', 5),
(177, 1, '白飯', '1000  g', '', '', 6),
(177, 1, '熱水', '500c.c.', '', '', 7),
(177, 1, '奶油', '30g', '', '', 8),
(177, 1, '沙拉油', '20g', '', '', 9),
(177, 1, '水', '850c.c.', '', '', 10),
(177, 1, '鹽', '10  g', '', '', 11),
(177, 1, '胡椒', '0.2  g', '', '', 12),
(177, 2, '「ほんだし®/烹大師®」昆布風味', '5  g', '', '0', 1),
(177, 2, '「ほんだし®/烹大師®」雞粉', '20  g', '', '0', 2),
(177, 3, '將「ほんだし®/烹大師®」昆布風味 、熱水放入鍋子裡，水煮冷凍綜合海鮮，若想要入味，請浸上1天。', '', '', '1', 0),
(177, 3, '在鍋子裡放入奶油、沙拉油，拌炒蒜末、薑末，接著加入洋蔥後拌炒15分鐘左右。', '', '', '1', 1),
(177, 3, '將水、「ほんだし®/烹大師®」雞粉加入做法②裡煮沸，撈去雜質後，加入咖哩塊，確定咖哩塊徹底溶解。', '', '', '1', 2),
(177, 3, '將做法①加入做法③，用鹽、胡椒調味後完成。', '', '', '1', 3),
(177, 3, '將白飯盛入容器裡，淋上做法④。', '', '', '1', 4),
(123, 1, '湯底材料：,水,昆布,柴魚片', ',2000c.c.,40g,60g', '', '', 1),
(123, 1, '鍋物材料：,霜降豬肉,燒豆腐,大白菜,大蔥,鮮香菇,金針菇,春菊切段,日本葛粉條泡軟,白蘿蔔片條狀,紅蘿蔔花刀,洋蔥,高湯昆布(取自湯底材料)', ',2塊,4塊,1/4顆,1支,兩朵,80g,100g,30g,50g,2片,半顆,1片', '', '', 2),
(123, 2, '「ほんだし®/烹大師®」鰹魚風味', '20  g', '', '0', 1),
(123, 2, '「ほんだし®/烹大師®」昆布風味', '20  g', '', '0', 2),
(123, 3, '將昆布表面的灰塵拭淨，放入2公升的水中浸泡約2~3小時。', '', '', '1', 0),
(123, 3, '以中火慢煮，在水煮沸前將昆布撈起，熄火後再將柴魚片放入，等柴魚片全部沈入鍋底後撈除浮沫。', '', '', '1', 1),
(123, 3, '用紗布慢慢過濾煮汁，不可擠壓擰扭要讓高湯自然滴落，才能萃取出高雅清澈的湯汁，最後加入「ほんだし®/烹大師®」鰹魚風味20g、「ほんだし®/烹大師®」昆布風味20g調味備用。', '', '', '1', 2),
(123, 3, '將霜降肉切成薄片備用。', '', '', '1', 3),
(123, 3, '所有鍋物材料排入鍋中，加入做法③的湯底煮至沸騰後，再涮入肉片食用即可。', '', '', '1', 4),
(112, 1, '土雞全雞', '1隻', '', '', 1),
(112, 1, '鮮干貝', '8顆', '', '', 2),
(112, 1, '冬瓜', '100g', '', '', 3),
(112, 1, '何首烏', '15g', '', '', 4),
(112, 1, '蜜棗', '1顆', '', '', 5),
(112, 1, '薑片', '5g', '', '', 6),
(112, 1, '黃耆', '8g', '', '', 7),
(112, 1, '枸杞', '5g', '', '', 8),
(112, 1, '紅棗', '20g', '', '', 9),
(112, 1, '冷開水', '適量', '', '', 10),
(112, 2, '「ほんだし ®/烹大師®」干貝風味', '12  g', '', '0', 1),
(112, 2, '鹽巴', '5g', '', '0', 2),
(112, 2, '米酒', '30c.c.', '', '0', 3),
(112, 3, '全雞洗淨後汆燙，冬瓜去皮切成大塊後備用。', '', '', '1', 0),
(112, 3, '中藥材洗淨，瀝乾水分備用。', '', '', '1', 1),
(112, 3, '取一深湯鍋，放入全雞、冬瓜、中藥材、薑片，並加入「ほんだし ®/烹大師®」干貝風味，接續加入冷開水蓋過全雞，以中火燉煮約50分鐘（或者放入蒸鍋蒸1.5小時）後，再度煮至微滾，並放入鮮干貝、米酒煮約3分鐘，加鹽巴調味後即可。', '', '', '1', 2),
(207, 1, '板豆腐', '1盒', '', '', 1),
(207, 1, '川耳', '8朵', '', '', 2),
(207, 1, '紅蘿蔔', '8片', '', '', 3),
(207, 1, '皇帝豆', '8顆', '', '', 4),
(207, 1, '洋菇', '4顆', '', '', 5),
(207, 1, '玉米筍', '4支', '', '', 6),
(207, 1, '秋葵', '4支', '', '', 7),
(207, 1, '水', '100c.c.', '', '', 8),
(207, 2, '「ほんだし ®/烹大師®」香菇風味', '1小匙', '', '0', 1),
(207, 2, '海苔醬', '3小匙', '', '0', 2),
(207, 2, '蔭油膏', '2小匙', '', '0', 3),
(207, 2, '太白粉水', '少許', '', '0', 4),
(207, 2, '香油', '少許', '', '0', 5),
(207, 3, '板豆腐切片，川耳泡水備用。', '', '', '1', 0),
(207, 3, '紅蘿蔔切片，玉米筍、秋葵斜切段，洋菇對切，再將食材燙熟備用。', '', '', '1', 1),
(207, 3, '熱鍋下少許油，將板豆腐煎至兩面微焦後倒出。', '', '', '1', 2),
(207, 3, '鍋中餘油先炒香海苔醬，加入「ほんだし ®/烹大師®」香菇風味及水，再加入蔭油膏調味，將所有食材放入鍋中燒至剩少許湯汁，最後以太白粉水勾芡滴上香油即可。', '', '', '1', 3),
(206, 1, '大白菜', '1/4顆', '', '', 1),
(206, 1, '絲瓜', '1/2條', '', '', 2),
(206, 1, '紅蘿蔔', '1/3條', '', '', 3),
(206, 1, '綠竹筍', '1/2支', '', '', 4),
(206, 1, '鮮香菇', '4朵', '', '', 5),
(206, 1, '黃金菇', '80g', '', '', 6),
(206, 1, '銀芽', '40g', '', '', 7),
(206, 1, '金針', '20g', '', '', 8),
(206, 1, '素魚翅', '15g', '', '', 9),
(206, 1, '碗豆仁', '少許', '', '', 10),
(206, 1, '髮菜', '少許', '', '', 11),
(206, 2, '香菇高湯：,「ほんだし ®/烹大師®」香菇風味,水', ',8g,800c.c.', ',,', '0,0,0', 1),
(206, 2, '香油', '1大匙', '', '0', 2),
(206, 2, '鹽', '1小匙', '', '0', 3),
(206, 2, '烏醋', '2小匙', '', '0', 4),
(206, 2, '白胡椒粉', '少許', '', '0', 5),
(206, 2, '太白粉水', '少許', '', '0', 6),
(206, 3, '大白菜洗淨切粗絲備用。', '', '', '1', 0),
(206, 3, '鮮香菇切絲，綠竹筍、紅蘿蔔切細絲，絲瓜去皮去籽切絲，金針、髮菜、素魚翅泡軟。', '', '', '1', 1),
(206, 3, '將做法②的材料燙熟備用。', '', '', '1', 2),
(206, 3, '以香油先將大白菜絲炒香，再加入香菇高湯及鹽、烏醋、白胡椒粉和其它食材，煮滾後以太白粉水勾芡滴上香油即完成。', '', '', '1', 3),
(209, 1, '山苦瓜', '1/2條', '', '', 0),
(209, 1, '白苦瓜', '1/2條', '', '', 1),
(209, 1, '梅干菜', '40g', '', '', 2),
(209, 1, '冬菇', '4朵', '', '', 3),
(209, 1, '破布子', '12顆', '', '', 4),
(209, 1, '紅辣椒片', '1條', '', '', 5),
(209, 1, '薑末', '少許', '', '', 6),
(209, 2, '香菇高湯：,「ほんだし ®/烹大師®」香菇風味,水', ',4g,100c.c.', ',,', '0,0,0', 0),
(209, 2, '蔭油膏', '2小匙', '', '0', 1),
(209, 2, '糖', '1小匙', '', '0', 2),
(209, 2, '香油', '少許', '', '0', 3),
(209, 3, '將山苦瓜和白苦瓜去籽切塊、冬菇切小塊、梅干菜泡水洗淨切粗粒備用。', '', '', '1', 0),
(209, 3, '起油鍋將山苦瓜和白苦瓜炸熟透瀝乾油備用。', '', '', '1', 1),
(209, 3, '同鍋爆香薑末及冬菇，再加入梅干菜炒香，陸續加入香菇高湯、破布子及做法②的苦瓜燜煮。', '', '', '1', 2),
(209, 3, '最後加入蔭油膏、糖煮至醬汁燒乾，撒上辣椒片翻炒，滴入香油即完成。', '', '', '1', 3),
(211, 1, '義大利米', '150  g', '', '', 0),
(211, 1, '洋菇片', '100  g', '', '', 1),
(211, 1, '草菇片', '100  g', '', '', 2),
(211, 1, '鴻喜菇', '半包', '', '', 3),
(211, 1, '洋蔥末', '40  g', '', '', 4),
(211, 1, '秋葵', '2支', '', '', 5),
(211, 1, '黑松露', '4片', '', '', 6),
(211, 1, '巴西里碎', '少許', '', '', 7),
(211, 2, '香菇高湯:：,「ほんだし ®/烹大師®」香菇風味,水', ',6  g,600c.c.', ',,', '0,0,0', 0),
(211, 2, '松露醬', '2小匙', '', '0', 1),
(211, 2, '鹽', '少許', '', '0', 2),
(211, 2, '松露油', '少許', '', '0', 3),
(211, 2, '鮮奶油', '60  g', '', '0', 4),
(211, 2, '無鹽奶油', '30  g', '', '0', 5),
(211, 2, '橄欖油', '適量', '', '0', 6),
(211, 2, '橄欖油', '少許', '', '0', 7),
(211, 3, '鍋中加少許橄欖油及奶油將洋蔥爆香，再將洋菇片、草菇片、鴻喜菇炒至焦香，再加入義大利米炒香後加入香菇高湯200c.c.轉中小火燉煮，過程中須持續攪拌。', '', '', '1', 0),
(211, 3, '待湯汁收乾後再加入香菇高湯200c.c.繼續燉煮。', '', '', '1', 1),
(211, 3, '湯汁再次收乾後加入香菇高湯200c.c.及鮮奶油、松露醬繼續燉煮。', '', '', '1', 2),
(211, 3, '煮至燉飯保留少許醬汁加入少許鹽調味後盛盤。', '', '', '1', 3),
(211, 3, '擺上松露片，滴上少許松露油再撒上巴西里碎及起司粉，綴以秋葵斜切片即可。', '', '', '1', 4),
(208, 1, '南瓜', '1/4顆', '', '', 1),
(208, 1, '米粉', '80g', '', '', 2),
(208, 1, '冬菇絲', '4朵', '', '', 3),
(208, 1, '杏鮑菇絲', '40g', '', '', 4),
(208, 1, '銀芽', '40g', '', '', 5),
(208, 1, '雞蛋', '1顆', '', '', 6),
(208, 1, '芹菜末', '少許', '', '', 7),
(208, 1, '南瓜籽', '少許', '', '', 8),
(208, 1, '香菜', '少許', '', '', 9),
(208, 2, '「ほんだし ®/烹大師®」香菇風味', '1又 1/2小匙', '', '0', 1),
(208, 2, '水', '50c.c.', '', '0', 2),
(208, 2, '醬油', '3小匙', '', '0', 3),
(208, 2, '白胡椒粉', '少許', '', '0', 4),
(208, 2, '香油', '少許', '', '0', 5),
(208, 3, '南瓜切絲、冬菇切絲、雞蛋打成蛋花，南瓜籽乾鍋炒熟備用。', '', '', '1', 0),
(208, 3, '煮滾水加少許油小火將米粉燙30秒後，撈起燜3分鐘後備用。', '', '', '1', 1),
(208, 3, '起油鍋將杏鮑菇炸至金黃色，蛋花炸成蛋酥備用。', '', '', '1', 2),
(208, 3, '起油鍋依續加入南瓜絲、冬菇絲、銀芽、米粉、所有調味料翻炒至南瓜軟爛，撒上南瓜籽、芹菜末、杏鮑菇絲、蛋酥、香菜即完成。', '', '', '1', 3),
(208, 3, '※美味方程式：示範料理為奶蛋素，全素者可將蛋酥去除。', '', '', '0', 4),
(212, 1, '去皮冬瓜肉', '400  g', '', '', 0),
(212, 1, '菠菜葉', '100  g', '', '', 1),
(212, 1, '銀杏', '12顆', '', '', 2),
(212, 1, '鴻喜菇', '半包', '', '', 3),
(212, 1, '枸杞', '8顆', '', '', 4),
(212, 2, '香菇高湯：,「ほんだし ®/烹大師®」香菇風味,水', ',６g,600c.c.', ',,', '0,0,0', 0),
(212, 2, '鹽', '少許', '', '0', 1),
(212, 2, '香油', '少許', '', '0', 2),
(212, 2, '太白粉水', '少許', '', '0', 3),
(212, 3, '將冬瓜蒸熟用調理機打成泥。', '', '', '1', 0),
(212, 3, '將菠菜燙熟切成末。', '', '', '1', 1),
(212, 3, '香菇高湯煮滾後依序加入冬瓜泥、銀杏、鴻喜菇，以少許鹽調味，再用太白粉水勾芡後盛入碗中撒上枸杞，淋上香油即完成。', '', '', '1', 2),
(210, 1, '牛蒡,薏仁,南北杏,白木耳,蓮子,紅棗,玉竹片,淮山片,當歸', '1/2條,40g,10g,10g,15顆,6顆,6片,6片,1片', '', '', 1),
(210, 1, '鴻喜菇,鮮百合,枸杞', '1包,40g,20顆', '', '', 2),
(210, 2, '香菇高湯：,「ほんだし ®/烹大師®」香菇風味,水', ',10g,1000c.c.', ',,', '0,0,0', 1),
(210, 2, '米酒', '100c.c.', '', '0', 2),
(210, 2, '鹽', '1小匙', '', '0', 3),
(210, 3, '薏仁先泡水3小時後瀝乾備用。', '', '', '1', 0),
(210, 3, '牛蒡帶皮刷洗乾淨切片，白木耳泡水洗淨備用。', '', '', '1', 1),
(210, 3, '取湯鍋倒入調味料Ⓐ香菇高湯，沸騰後加入材料Ⓐ蓋上鍋蓋小火煮1小時。', '', '', '1', 2),
(210, 3, '加入材料Ⓑ及米酒和鹽調味後再煮5分鐘即可。', '', '', '1', 3),
(213, 1, '去骨肉雞腿', '2支', '', '', 1),
(213, 1, '洋菇片', '100  g', '', '', 2),
(213, 1, '鮮香菇片', '100  g', '', '', 3),
(213, 1, '洋蔥末', '50  g', '', '', 4),
(213, 1, '百里香', '2支', '', '', 5),
(213, 1, '迷迭香', '2支', '', '', 6),
(213, 1, '蒜頭', '8顆', '', '', 7),
(213, 2, '香菇高湯：,「ほんだし ®/烹大師®」香菇風味,水', ',1.5  g,150c.c.', ',,', '0,0,0', 1),
(213, 2, '無鹽奶油', '40  g', '', '0', 2),
(213, 2, '白胡椒粉', '少許', '', '0', 3),
(213, 2, '鮮奶油', '40  g', '', '0', 4),
(213, 2, '鹽', '少許', '', '0', 5),
(213, 2, '橄欖油', '適量', '', '0', 6),
(213, 3, '先將雞腿以橄欖油、百里香1支、迷迭香1支、蒜頭5顆醃兩小時。', '', '', '1', 0),
(213, 3, '鍋子燒熱將雞腿煎至兩面焦香再移到烤箱烤熟。', '', '', '1', 1),
(213, 3, '用煎過雞腿後的鍋子加入奶油爆香洋蔥末及蒜末，再把洋菇片、鮮香菇片炒到焦香，加入香菇高湯、鮮奶油、百里香及迷迭香熬煮20分鐘後挑出香草，再加白胡椒粉及鹽調味後，用調理機打成泥狀成為醬汁。', '', '', '1', 2),
(213, 3, '將烤熟雞腿切塊盛盤，再將醬汁加熱淋上雞腿即完成。', '', '', '1', 3),
(160, 1, '拉長蝦 ', '3隻', '', '', 1),
(160, 1, '中卷圈', '2個', '', '', 2),
(160, 1, '茄子段', '2塊', '', '', 3),
(160, 1, '青椒段', '2塊', '', '', 4),
(160, 1, '鮮香菇', '2小朵', '', '', 5),
(160, 1, '地瓜片', '4片', '', '', 6),
(160, 2, '炸粉漿：,麵粉,蛋液,麵包粉,脆酥粉,「AJINOMOTO PLUS」高鮮味精,水', ',100  g,2顆,120g,100g,3  g,適量', ',,,,,,', '0,0,0,0,0,0,0', 1),
(160, 2, '「AJINOMOTO PLUS」高鮮味精,鮮味水,鹽', '5g,1公升(水1公升+AJINOMOTO PLUS高鮮味精5g),少許', ',,', '0,0,0', 2),
(160, 3, '拉長蝦及中卷圈以鮮味水洗淨，擦乾灑上「AJINOMOTO PLUS」高鮮味精醃漬。', '', '', '1', 0),
(160, 3, '做法①依序裹上麵粉、蛋液及麵包粉後，先以150℃的油溫炸熟，再以180 ℃的油溫炸至金黃色備用。', '', '', '1', 1),
(160, 3, '茄子段、青椒段、鮮香菇及地瓜片撒上「AJINOMOTO PLUS」高鮮味精及少許鹽後抓勻備用。', '', '', '1', 2),
(160, 3, '「AJINOMOTO PLUS」高鮮味精3g與脆酥粉100g混合均勻，加入適量的水調製炸粉漿稠度呈滴水狀。', '', '', '1', 3),
(160, 3, '做法③裹上炸粉漿，以180 ℃油溫炸至金黃色，將炸好的天婦羅排盤即可。', '', '', '1', 4),
(196, 1, '白芝麻細粒', '適量', '', '', 1),
(196, 1, '蓮藕(切成5mm寬半月型) ,里芋(5mm寬輪切)', '80g,85g', '', '', 2),
(196, 1, '白芝麻細粒,蒜泥 ', '7g,少許', '', '', 3),
(196, 2, '「味之素品牌」沙拉醬', '50g', '', '0', 0),
(196, 2, '韓式辣醬', '12g', '', '0', 1),
(196, 2, '「ほんだし®/烹大師®」鰹魚風味', '4.5g', '', '0', 2),
(196, 3, '在鍋中放入水300c.c.、「ほんだし®/烹大師®」鰹魚風味4.5g煮沸，加入材料Ⓐ，煮3~4分鐘至食材可以竹籤穿透的程度。', '', '', '1', 0),
(196, 3, '食材煮熟後直接在湯汁中放涼。冷卻後盛至竹篩中去除水氣。', '', '', '1', 1),
(196, 3, '在碗中將材料Ⓑ、「味之素品牌」沙拉醬、韓式辣醬攪拌均勻後，將做法②加入拌勻。', '', '', '1', 2),
(196, 3, '盛盤後撒入芝麻粒即可。', '', '', '1', 3),
(146, 1, '紅蔥頭 ', ' 75g', '', '', 1),
(146, 1, '朝天椒(切碎)', '15g', '', '', 2),
(146, 1, '香港蝦干(切碎)', '120g', '', '', 3),
(146, 1, '溫室小黃瓜(切6cm長挑直點的)', '1條', '', '', 4),
(146, 2, '沙拉油', '150c.c.', '', '0', 1),
(146, 2, '泰國檸檬葉', '10葉', '', '0', 2),
(146, 2, '「ほんだし®/烹大師®」干貝風味', '1/2小匙', '', '0', 3),
(146, 2, '「ほんだし®/烹大師®」雞粉', '1/2小匙', '', '0', 4),
(146, 2, '糖,泰國魚露,新鮮檸檬汁', '40g,40g,30c.c.', ',,', '0,0,0', 5),
(146, 3, '香港蝦干洗淨後浸泡2分鐘，略軟後吸乾水份搗碎備用。', '', '', '1', 0),
(146, 3, '紅蔥頭切細末、朝天椒切碎、泰國檸檬葉切碎。', '', '', '1', 1),
(146, 3, '小火熱油下紅蔥頭爆香，再加入做法①的香港蝦乾及朝天椒，再加入調味料Ⓐ炒3-4分鐘。', '', '', '1', 2),
(146, 3, '待些許微焦並發出香氣，最後下「ほんだし®/烹大師®」干貝風味、「ほんだし®/烹大師®」雞粉炒勻即過濾掉油冷卻備用。', '', '', '1', 3),
(146, 3, '小黃瓜洗淨擦乾，先對半切成6公分長條，再將中間小黃瓜籽挖空，把蝦鬆鑲入小黃瓜內即可。', '', '', '1', 4),
(183, 1, '冷凍帆立貝', '120  g', '', '', 1),
(183, 1, '綠蘆筍(切4cm長)', '50g', '', '', 2),
(183, 1, '甜椒(紅)(切條)', '30  g', '', '', 3),
(183, 1, '舞菇(小瓣) ', '80  g', '', '', 4),
(183, 1, '太白粉液', '少許', '', '', 5),
(183, 1, '沙拉油', '40  g', '', '', 6),
(183, 2, '「AJI-NO-MOTO® PLUS®」高鮮味精1KG,水 ', '3  g,200c.c.', ',', '0,0', 1),
(183, 2, '水,「ほんだし®/烹大師®」雞粉,鹽,胡椒', '100c.c.,10g,4g,適量', ',,,', '0,0,0,0', 2),
(183, 3, '在碗裡混合調味料Ⓐ，製作鮮味水，接著裝入噴瓶。', '', '', '1', 0),
(183, 3, '將帆立貝放在盤子上，噴上做法①。', '', '', '1', 1),
(183, 3, '將沙拉油倒入平底鍋，放入舞菇、蘆筍、甜椒、做法②拌炒。', '', '', '1', 2),
(183, 3, '將調味料Ⓑ加入做法③後繼續拌炒後，使用太白粉液勾芡。', '', '', '1', 3),
(183, 3, '將做法④盛裝在容器裡。', '', '', '1', 4),
(216, 1, '圓糯米', '400g', '', '', 1),
(216, 1, '五穀米', '200g', '', '', 2),
(216, 1, '紅蔥末', '30g', '', '', 3),
(216, 1, '香菇', '10朵', '', '', 4),
(216, 1, '蝦米', '50g', '', '', 5),
(216, 1, '梅花肉', '300g', '', '', 6),
(216, 1, '鹹蛋黃', '5顆', '', '', 7),
(216, 1, '乾干貝', '3顆', '', '', 8),
(216, 1, '橄欖油', '適量', '', '', 9),
(216, 2, '「AJI-NO-MOTO® PLUS®」高鮮味精,鹽,糖　,胡椒粉　,米酒', '1/2小匙,1/2小匙,1/4小匙,少許,1/2大匙', ',,,,', '0,0,0,0,0', 1),
(216, 2, '「AJI-NO-MOTO® PLUS®」高鮮味精,糖,鹽,米酒　,胡椒粉', '1/2小匙,少許,1/4小匙,1/2大匙,少許', ',,,,', '0,0,0,0,0', 2),
(216, 3, '粽葉洗淨瀝乾，備用。', '', '', '1', 0),
(216, 3, '五穀米洗淨泡水6小時；糯米洗淨泡水3小時；香菇泡軟；蝦米泡水10分鐘；乾干貝用冷水浸泡隔夜後剝絲備用；梅花肉洗淨切塊。', '', '', '1', 1),
(216, 3, '鹹蛋黃加少許米酒烤香，待涼後切塊，備用。', '', '', '1', 2),
(216, 3, '取鍋倒入橄欖油，加入紅蔥末爆香，放入做法②的五穀米、糯米炒2分鐘，加入調味料Ⓐ 拌炒均勻，取出備用。', '', '', '1', 3),
(216, 3, '再起油鍋，加入紅蔥末、蝦米爆香，取出備用。再加入香菇、做法②的梅花肉塊、干貝絲、調味料Ⓑ炒香，蓋上鍋蓋以小火燜煮10分鐘，拌炒後取出備用。', '', '', '1', 4),
(216, 3, '取做法①的2片粽葉，先後放入做法④、⑤的米飯和饀料，以及做法③鹹蛋，蓋上米飯後包好粽葉綁好粽繩，重覆此步驟至材料用完，放入沸水中煮滾，再蓋上鍋蓋以小火煮70分鐘即可。', '', '', '1', 5),
(193, 1, '大黄瓜(切1cm厚圓片，煮熟),蕃茄(切1cm厚半月型)', '110g,70g', '', '', 1),
(193, 2, '「味之素品牌」沙拉醬,「ほんだし®/烹大師®」雞粉', '50g,2g', ',', '0,0', 1),
(193, 3, '碗中加入調味料Ⓐ後混合，做成沙拉醬。', '', '', '1', 0),
(193, 3, '在盤中盛作材料Ⓑ，淋上做法①，在預熱至200℃的烤箱中烤7分鐘即可。', '', '', '1', 1),
(167, 1, '低筋麵粉', '100  g', '', '', 1),
(167, 1, '豬里肌肉片', '400g', '', '', 2),
(167, 1, '「味之素品牌」沙拉醬', '30  g', '', '', 3),
(167, 1, '柴魚片', '適量', '', '', 4),
(167, 1, '海苔粉', '適量', '', '', 5),
(167, 1, '沙拉油 ', '適量', '', '', 6),
(167, 1, '山藥泥,雞蛋', '25  g, 10顆', '', '', 7),
(167, 1, '高麗菜(切絲),炸麵渣,紅薑 ', '1000  g,少許,少許', '', '', 8),
(167, 2, '大阪燒醬汁', '適量', '', '0', 1),
(167, 2, '「ほんだし®/烹大師®」鰹魚風味,熱水', '15  g,700  g', ',', '0,0', 2),
(167, 3, '在鉢中放入調味料Ⓐ，製作高湯，放冷備用。', '', '', '1', 0),
(167, 3, '另個鉢中放入低筋麵粉，加入做法①，混合後加入材料Ⓐ拌勻。', '', '', '1', 1),
(167, 3, '做法②中加入材料Ⓑ，製作大阪燒的麵糊。', '', '', '1', 2),
(167, 3, '在熱好的鐵板放入沙拉油，依序放入豬里肌肉片及做法③的麵糰，將兩面煎熟。', '', '', '1', 3),
(167, 3, '將做法④盛盤，依序淋上大阪燒醬及「味之素品牌」沙拉醬，灑上海苔粉、最後鋪上柴魚片即可。', '', '', '1', 4),
(194, 1, '炸蝦', '3隻', '', '', 0),
(194, 1, '萵苣', '60g', '', '', 1),
(194, 1, '水煮蛋(切小塊),洋蔥切小塊(先過水),芹菜末', '10g,2g,適量', '', '', 2),
(194, 1, '高麗菜切絲,蕃茄(月牙形切法),檸檬(月牙形切法)', '60g,40g,20g', '', '', 3),
(194, 2, '「味之素品牌」沙拉醬,「ほんだし®/烹大師®」雞粉', '20g,0.5g', ',', '0,0', 1),
(194, 3, '鉢中放入調味料Ⓐ、材料Ⓐ，做成塔塔醬。', '', '', '1', 0),
(194, 3, '盤中盛入炸蝦及加入做法①，擺上萵苣裝飾。', '', '', '1', 1),
(195, 1, '蝦(去腸泥、剝殼留尾)', '240g', '', '', 0),
(195, 1, '低筋麵粉', '適量', '', '', 1),
(195, 1, '天婦羅炸粉(先以適量的水溶好)', '適量', '', '', 2),
(195, 1, '沙拉油(炸物用)', '適量', '', '', 3),
(195, 1, '萵苣', '65g', '', '', 4),
(195, 2, '「味之素品牌」沙拉醬,蕃茄醬', '25g,25g', ',', '0,0', 1),
(195, 2, '鹽', '1.2g', '', '0', 2),
(195, 3, '鉢中放入調味料Ⓐ後攪拌均勻成千島醬。', '', '', '1', 0),
(195, 3, '蝦子上灑入鹽、低筋麵粉拌勻後，裏上天婦羅炸粉，以180℃的油炸熟。', '', '', '1', 1),
(195, 3, '做法①中放入做法②拌勻後盛盤。', '', '', '1', 2),
(214, 1, '熱白飯', '150  g', '', '', 1),
(214, 1, '酸梅', '1個', '', '', 2),
(214, 1, '海苔絲', '適量', '', '', 3),
(214, 2, '「ほんだし ®/烹大師®」鰹魚風味,熱水', '7g,250c.c.', ',', '0,0', 0),
(214, 2, '白胡椒', '適量', '', '0', 1),
(214, 2, '白芝麻', '適量', '', '0', 2),
(214, 3, '鍋中放入調味料Ⓐ煮至沸騰。', '', '', '1', 0),
(214, 3, '碗中乘入白飯，到入做法①後放上酸梅、海苔絲。', '', '', '1', 1),
(214, 3, '最後撒上白胡椒、白芝麻即可。', '', '', '1', 2),
(218, 1, '五花肉片(切4cm),白蘿蔔(切5mm銀杏葉形),胡蘿蔔(切5mm銀杏葉形),牛蒡(切成薄片),小芋頭(切1cm圓形),蒟蒻(切2cm塊狀後汆燙)', '40g,80  g,40  g,20  g,80  g,30  g', '', '', 0),
(218, 2, '味噌', '45g', '', '0', 0),
(218, 2, '「ほんだし ®/烹大師®」鰹魚風味,水', '5g,700  g', ',', '0,0', 1),
(218, 2, '「ほんだし ®/烹大師®」鰹魚風味,水', '5g,700 g', ',', '0,0', 2),
(218, 3, '鍋中放入調味料Ⓐ煮沸後轉小火，放材料Ⓐ將食材煮熟。', '', '', '1', 0),
(218, 3, '取出做法①的食材，放入保鮮盒待冷卻後，蓋上蓋子保存。', '', '', '1', 1),
(218, 3, '取另一鍋放入調味料Ⓑ煮沸後關火，將味增放入攪拌至溶解。', '', '', '1', 2),
(218, 3, '打開做法②的蓋子，放入微波爐(600W)加熱1分30秒後。', '', '', '1', 3),
(218, 3, '湯碗放入做法④的食材和做法③的高湯，最後撒上蔥末裝飾即可。', '', '', '1', 4),
(219, 1, '米,海藻', '300  g,6  g', '', '', 0),
(219, 1, '蛋液', '1顆', '', '', 1),
(219, 1, '蔥末', '適量', '', '', 2),
(219, 2, '白芝麻 ', '適量', '', '0', 0),
(219, 2, '「ほんだし ®/烹大師®」鰹魚風味,水,醬油,酒', '4g,500  g,36  g,15  g', ',,,', '0,0,0,0', 1),
(219, 3, '鍋中放入調味料Ⓐ煮沸後，加入材料Ⓐ煮5分鐘。', '', '', '1', 0),
(219, 3, '將做法①加入蛋液輕微攪拌。', '', '', '1', 1),
(219, 3, '撒上蔥末、白芝麻裝飾即可。', '', '', '1', 2),
(222, 1, '豬絞肉,蔥末', '100g,20g', '', '', 0),
(222, 1, '餃子皮', '5張', '', '', 1),
(222, 1, '熱水', '200g', '', '', 2),
(222, 1, '沙拉油', '12  g', '', '', 3),
(222, 2, '「ほんだし ®/烹大師®」雞粉', '1  g', '', '0', 0),
(222, 3, '碗放入材料Ⓐ和「ほんだし ®/烹大師®」雞粉混合均勻後，包入餃子皮。', '', '', '1', 0),
(222, 3, '平底鍋倒入沙拉油加熱，將做法①擺上。', '', '', '1', 1),
(222, 3, '加入熱水，悶煮至沒有水氣為止即可盛盤。', '', '', '1', 2),
(221, 1, '山茼蒿(葉摘除)', '200  g', '', '', 1),
(221, 1, '花枝(生魚片)', '80  g', '', '', 2),
(221, 2, '白芝麻', '9  g', '', '0', 1),
(221, 2, '芝麻油,醋,「ほんだし ®/烹大師®」鰹魚風味,「ほんだし ®/烹大師®」昆布風味', '48  g,45  g,1  g,1.5  g', ',,,', '0,0,0,0', 2),
(221, 3, '將山茼蒿、花枝盛盤，撒上白芝麻裝飾。', '', '', '1', 0),
(221, 3, '鍋中放入調味料Ⓐ煮沸後，淋在做法①即可。', '', '', '1', 1),
(220, 1, '白肉魚(切一口大小)', '300g', '', '', 1),
(220, 1, '鹽', '1g', '', '', 2),
(220, 1, '小麥粉', '適量', '', '', 3),
(220, 1, '綠紫蘇切絲', '1  g', '', '', 4),
(220, 1, '沙拉油(作為炸油使用)', '適量', '', '', 5),
(220, 2, '蘿蔔泥,「ほんだし ®/烹大師®」昆布風味,「ほんだし ®/烹大師®」鰹魚風味,醋,砂糖,薄口醬油', '200  g,2  g,2  g,40  g,7  g,5  g', ',,,,,', '0,0,0,0,0,0', 1),
(220, 3, ' 將白肉魚塗上鹽調味後，撒上小麥粉，放入沙拉油內油炸。', '', '', '1', 0),
(220, 3, '將調味料Ⓐ放在碗中攪拌均勻。', '', '', '1', 1),
(220, 3, '將做法①盛盤，淋上做法②，撒上綠紫蘇絲即可。', '', '', '1', 2),
(215, 1, '蕃茄(燙過去皮)', '300  g', '', '', 1),
(215, 1, '甜不辣(汆燙', '100  g', '', '', 2),
(215, 1, '水煮蛋', '2個', '', '', 3),
(215, 1, '鱈寶(切一半)', '60  g', '', '', 4),
(215, 1, '綠蘆筍(汆燙後切一半)', '24  g', '', '', 5),
(215, 2, '「ほんだし ®/烹大師®」鰹魚風味,「AJINOMOTO PLUS」高鮮味精,味醂,醬油,鹽,水', '7.2g,3  g,40  g,24  g,2.4  g,600  g', ',,,,,', '0,0,0,0,0,0', 1),
(215, 3, '鍋中放入調味料Ⓐ、甜不辣、水煮蛋開小火煮約30分。', '', '', '1', 0),
(215, 3, '再放入蕃茄、鱈寶煮約3分後，放置冰箱約半天。', '', '', '1', 1),
(215, 3, '將做法②的食材盛盤，剩餘湯汁，用來汆燙蘆筍後，擺盤即可。', '', '', '1', 2),
(230, 1, '土雞', '1隻', '', '', 0),
(230, 1, '乾小香菇', '6朵', '', '', 1),
(230, 1, '金華火腿肉', '30  g', '', '', 2),
(230, 1, '日本干貝', '6-8顆', '', '', 3),
(230, 1, '薑', '15  g', '', '', 4),
(230, 1, '鳳眼果', '12顆', '', '', 5),
(230, 1, '圓糯米', '175  g', '', '', 6),
(230, 1, '紅棗', '12顆', '', '', 7),
(230, 1, '青蔥', '少許', '', '', 8),
(230, 1, '水', '2400c.c.', '', '', 9),
(230, 2, '「ほんだし ®/烹大師®」鰹魚風味', '1小匙', '', '0', 0),
(230, 2, '「ほんだし ®/烹大師®」雞粉', '1大匙', '', '0', 1),
(230, 2, '鹽', '1小匙', '', '0', 2),
(230, 2, '米酒', '2大匙', '', '0', 3),
(230, 2, '香油', '1大匙', '', '0', 4),
(230, 3, '香菇、圓糯米、紅棗泡水隔夜，香菇去蒂頭後切片備用。金華火腿切薄片備用。', '', '', '1', 0),
(230, 3, '取一碗放入香菇、圓糯米100g、少許紅棗、鳳眼果、干貝，再加入少許「ほんだし ®/烹大師®」雞粉、香油拌勻後塞入土雞內，再取一竹籤將雞皮封口。', '', '', '1', 1),
(230, 3, '取一燜燒鍋放入水，將土雞、干貝、金華火腿、紅棗、鳳眼果、薑片、圓糯米75g放入後，加蓋燜煮30分鐘。', '', '', '1', 2),
(230, 3, '將燜煮好的土雞取出將竹籤拿掉，先將雞湯倒入砂鍋開大火煮至湯汁變濃稠乳白，放入土雞、蔥段，再加上「ほんだし ®/烹大師®」鰹魚風味、雞粉、鹽、米酒進行調味即可。', '', '', '1', 3),
(230, 3, ' ★ 美味方程式:煮熟白米飯半碗+少許雞湯放入果汁機打碎放進高湯熬煮，可讓口感更有層次。', '', '', '0', 4),
(229, 1, '大芥菜仁', '400  g', '', '', 1),
(229, 1, '白果罐', '1/2罐', '', '', 2),
(229, 1, '乾冬菇', '8朵', '', '', 3),
(229, 1, '竹筍', '300  g', '', '', 4),
(229, 1, '紅蘿蔔', '10  g', '', '', 5),
(229, 2, '「ほんだし ®/烹大師®」香菇風味', '1大匙', '', '0', 1),
(229, 2, '鹽', '1/2大匙', '', '0', 2),
(229, 2, '素蠔油', '1大匙', '', '0', 3),
(229, 2, '糖', '1/2大匙', '', '0', 4),
(229, 2, '香油', '少許', '', '0', 5),
(229, 2, '太白粉水', '1大匙', '', '0', 6),
(229, 2, '沙拉油', '2大匙', '', '0', 7),
(229, 2, '水', '1杯', '', '0', 8),
(229, 3, '乾冬菇泡水隔夜後去蒂洗淨，用電鍋加水蒸熟備用。', '', '', '1', 0),
(229, 3, '竹筍切片、紅蘿蔔刻水花滾水汆燙再泡冷水冰鎮備用。', '', '', '1', 1),
(229, 3, '芥菜切柳葉形、白果滾水加糖汆燙去除苦味再泡冷水冰鎮。', '', '', '1', 2),
(229, 3, '熱鍋放油、素蠔油、水拌勻，再放入冬菇、竹筍小火加蓋煮5分鐘後，加入「ほんだし ®/烹大師®」香菇風味、鹽 、糖調味再繼續炆煮。', '', '', '1', 3),
(229, 3, '接著放入芥菜、紅蘿蔔、白果煮至入味後，以太白粉水芶薄欠，淋上少許香油即可盛入盤中。', '', '', '1', 4),
(229, 3, ' ★ 美味方程式：芥菜先用砂糖汆燙去苦味後，用冷水冰鎮，保持脆度。', '', '', '0', 5),
(226, 1, '娃娃菜', '150g', '', '', 1),
(226, 1, '乾竹笙', '20g', '', '', 2),
(226, 1, '乾冬菇', '30g', '', '', 3),
(226, 1, '乾蟲草花', '15g', '', '', 4),
(226, 1, '猴頭菇罐', '100g', '', '', 5),
(226, 1, '薑片', '2片', '', '', 6),
(226, 1, '山藥', '100g', '', '', 7),
(226, 1, '雲耳', '30g', '', '', 8),
(226, 1, '枸杞', '1大匙', '', '', 9),
(226, 1, '紅棗', '6顆', '', '', 10),
(226, 1, '水', '1000c.c.', '', '', 11),
(226, 2, '「ほんだし ®/烹大師®」昆布風味', '1小匙', '', '0', 1),
(226, 2, '「ほんだし ®/烹大師®」香菇風味', '1小匙', '', '0', 2),
(226, 2, '鹽', '1又1/2小匙', '', '0', 3),
(226, 2, '糖', '1/2小匙', '', '0', 4),
(226, 2, '香油', '1大匙', '', '0', 5),
(226, 3, '乾竹笙、乾冬菇、蟲草花先泡水4小時後瀝乾備用。', '', '', '1', 0),
(226, 3, '竹笙切段、冬菇去蒂頭、猴頭菇切塊、山藥去皮切大塊、雲耳切四方塊洗淨備用。', '', '', '1', 1),
(226, 3, '娃娃菜切齊後洗淨備用。', '', '', '1', 2),
(226, 3, '取湯鍋倒入水1000c.c.煮滾後，加入材料(娃娃菜除外)略煮後，再加入調味料(香油除外)後，最後放入電鍋燉煮30分鐘。', '', '', '1', 3),
(226, 3, '娃娃菜用滾水燙熟後，放入湯內，淋上香油即可。', '', '', '1', 4),
(226, 3, '★美味方程式:喜歡乾淨透徹的湯色，可先將材料(娃娃菜除外)用滾水煮沸去雜質。', '', '', '0', 5),
(228, 1, '阿根廷乾魷魚', '1隻', '', '', 1),
(228, 1, '乾香菇', '60g', '', '', 2),
(228, 1, '蒜苗', '3根', '', '', 3),
(228, 1, '芹菜', '2根', '', '', 4),
(228, 1, '竹筍', '300g', '', '', 5),
(228, 1, '排骨', '350g', '', '', 6),
(228, 1, '蝦米', '15g', '', '', 7),
(228, 1, '薑片', '15g', '', '', 8),
(228, 1, '蛤蜊', '150g', '', '', 9),
(228, 1, '螺肉罐頭', '1罐', '', '', 10),
(228, 1, '螺肉汁', '1/3罐，', '', '', 11),
(228, 1, '水', '1800c.c.', '', '', 12),
(228, 2, '「ほんだし ®/烹大師®」鰹魚風味', '1大匙', '', '0', 1),
(228, 2, '鹽', '1大匙', '', '0', 2),
(228, 2, '胡椒粉', '1/2大匙', '', '0', 3),
(228, 2, '紹興酒', '1大匙', '', '0', 4),
(228, 2, '醬油', '1大匙', '', '0', 5),
(228, 2, '香油', '少許', '', '0', 6),
(228, 3, '乾魷魚、乾香菇泡水隔夜，乾魷魚切粗條狀，香菇去蒂頭切片備用。', '', '', '1', 0),
(228, 3, '蒜苗切斜片、芹菜切4公分長段，竹筍切片、排骨切塊狀汆燙備用。', '', '', '1', 1),
(228, 3, '取湯鍋倒入水煮開後，放入排骨、蝦米、薑片熬湯，半小時後放入螺肉、螺肉汁、魷魚、竹筍片、香菇熬煮20分鐘。', '', '', '1', 2),
(228, 3, '最後放入蛤蜊、芹菜、蒜苗、調味料(香油除外)等繼續熬煮10分鐘，淋上少許香油即可。', '', '', '1', 3),
(228, 3, ' ★ 美味方程式:使用螺肉罐的螺肉汁，可提升湯頭的鮮味喔!', '', '', '1', 4),
(231, 1, '松阪豬', '1塊', '', '', 1),
(231, 1, '洋菇', '4朵', '', '', 2),
(231, 1, '洋蔥', '1/4顆', '', '', 3),
(231, 1, '蒜頭', '1顆', '', '', 4),
(231, 1, '義大利米(煮熟)', '150g', '', '', 5),
(231, 1, '蔥花', '適量', '', '', 6),
(231, 2, '橄欖油', '適量', '', '0', 1),
(231, 2, '「ほんだし ®/烹大師®」雞粉', '1/4小匙', '', '0', 2),
(231, 2, '香菇高湯,「ほんだし ®/烹大師®」香菇風味,水', ',5g,500c.c.', ',,', '0,0,0', 3),
(231, 2, '白酒', '適量', '', '0', 4),
(231, 2, '動物性鮮奶油', '50g', '', '0', 5),
(231, 2, '帕馬森起司', '適量', '', '0', 6),
(231, 3, '松阪豬倒入橄欖油及ほんだし雞粉醃製備用。', '', '', '1', 0),
(231, 3, '洋菇切片，洋蔥切碎，蒜頭洗淨切末備用。', '', '', '1', 1),
(231, 3, '鍋中加入橄欖油，放入洋菇炒至焦香取出。原鍋加入洋蔥碎及蒜末炒香並加入白酒提升香氣後，放入煮熟義大利米、香菇高湯拌勻燉煮，煮至燉飯略為收乾熄火，加入洋菇、動物性鮮奶油調味拌勻盛盤。', '', '', '1', 2),
(231, 3, '熱鍋，將松阪豬兩面煎上色，切片擺上，撒上帕馬森起司與蔥花即可。', '', '', '1', 3),
(231, 3, '★ 美味方程式:松阪豬利用橄欖油封醃製可保留美味(橄欖油可再加入蔥、蒜)', '', '', '0', 4),
(238, 1, '無骨牛小排', '600g', '', '', 1),
(238, 1, '洋蔥', '1/2個', '', '', 2),
(238, 1, '杏鮑菇', '1小碗', '', '', 3),
(238, 1, '紅蘿蔔', '1/2根', '', '', 4),
(238, 2, '紅酒', '250c.c.', '', '0', 1),
(238, 2, '橄欖油', '適量', '', '0', 2),
(238, 2, '蕃茄醬', '適量', '', '0', 3),
(238, 2, '香菇高湯,「ほんだし ®/烹大師®」香菇風味,水', ',5g,500c.c.', ',,', '0,0,0', 4),
(238, 2, '「ほんだし ®/烹大師®」鰹魚風味', '1/4 小匙', '', '0', 5),
(238, 3, '無骨牛小排切成小塊，置於容器中，洋蔥切絲，舖在牛小排塊上面。', '', '', '1', 0),
(238, 3, '杏鮑菇、紅蘿蔔洗淨切滾刀塊備用。', '', '', '1', 1),
(238, 3, '將做法①淋上紅酒，以保鮮膜封好容器口，放入冰箱冷藏醃漬約4小時，再將牛小排取出，留下其中的紅酒醃汁及洋蔥絲備用。', '', '', '1', 2),
(238, 3, '熱鍋倒入橄欖油，將做法③的牛小排塊放入鍋中，以中火煎至兩面微焦後，再加入做法③的紅酒醃汁、洋蔥絲、蕃茄醬和香菇高湯一起煮至沸騰後，倒入燉鍋中。', '', '', '1', 3),
(238, 3, '做法④的燉鍋中加入做法②以及「ほんだし ®/烹大師®」鰹魚風味，以小火煮約90分鐘至牛小排的肉變軟、湯汁略微收乾即可。', '', '', '1', 4),
(227, 1, '五花肉', '1.2kg', '', '', 1),
(227, 1, '筍乾', '100g', '', '', 2),
(227, 1, '青江菜', '300g', '', '', 3),
(227, 1, '青蔥', '37.5g', '', '', 4),
(227, 1, '薑', '20g', '', '', 5),
(227, 1, '辣椒', '1根', '', '', 6),
(227, 1, '蒜頭', '20g', '', '', 7),
(227, 2, '「ほんだし ®/烹大師®」雞粉', '1大匙', '', '0', 1),
(227, 2, '米酒', '100g', '', '0', 2),
(227, 2, '醬油', '150g', '', '0', 3),
(227, 2, '冰糖', '3小匙', '', '0', 4),
(227, 2, '水', '1800c.c.', '', '0', 5),
(227, 2, '滷肉香料包', '1包', '', '0', 6),
(227, 2, '沙拉油', '2大匙', '', '0', 7),
(227, 2, '蠔油', '1大匙', '', '0', 8),
(227, 2, '太白粉水', '1大匙', '', '0', 9),
(227, 3, '薑去皮切片、青蔥切斷。', '', '', '1', 0),
(227, 3, '筍乾泡水4小時後，換水3次洗淨雜質。接著取一鍋水加熱，水滾後放入筍乾煮10分鐘，放入冷水後泡隔夜。', '', '', '1', 1),
(227, 3, '熱鍋放油，將五花肉皮的那面放入鍋中煎，中小火煎到皮呈現金黃色。', '', '', '1', 2),
(227, 3, '利用鍋中的餘油，放入薑片、青蔥段、蒜頭、辣椒煎炒到金黃色，再放入冰糖炒至焦糖色後，放入「ほんだし ®/烹大師®」雞粉、米酒、水、醬油、蠔油等調味料煮滾，放入煎上色的五花肉、滷肉香料包加鍋蓋用小火炆煮100分鐘。', '', '', '1', 3),
(227, 3, '五花肉滷好後取出一半的滷汁，再將五花肉放入電鍋蒸30分鐘讓肉質更加軟嫩。', '', '', '1', 4),
(227, 3, '另一半的滷汁和筍乾，加入少許水，用小火炆煮10~15分鐘讓筍乾入味上色後即可。', '', '', '1', 5),
(227, 3, '將五花封肉放在筍乾上，滷汁燒開用太白粉水勾薄芡後，淋在五花封肉上，最後再放上汆燙後的青江菜盛盤裝飾即可。', '', '', '1', 6),
(225, 1, '鴨血', '300  g', '', '', 1),
(225, 1, '臭豆腐', '4塊', '', '', 2),
(225, 1, '大紅袍花椒粒', '1/2大匙', '', '', 3),
(225, 1, '乾辣椒', '15  g', '', '', 4),
(225, 1, '蒜末', '20  g', '', '', 5),
(225, 1, '薑末', '10  g', '', '', 6),
(225, 1, '秀珍菇', '1包', '', '', 7),
(225, 1, '蒜苗', '1支', '', '', 8),
(225, 1, '白菜', '75g', '', '', 9),
(225, 1, '水', '800c.c.', '', '', 10),
(225, 2, '「ほんだし ®/烹大師®」鰹魚風味', '1小匙', '', '0', 1),
(225, 2, '「ほんだし ®/烹大師®」雞粉', '1/2大匙', '', '0', 2),
(225, 2, '蠔油', '1大匙', '', '0', 3),
(225, 2, '醬油', '1/2大匙', '', '0', 4),
(225, 2, '鹽', '1/2大匙', '', '0', 5),
(225, 2, '辣油', '3大匙', '', '0', 6),
(225, 2, '辣豆瓣醬', '3大匙， ', '', '0', 7),
(225, 2, '黃金豆醬', '2大匙', '', '0', 8),
(225, 2, '香料包', '1包', '', '0', 9),
(225, 2, '花椒油', '1/2大匙', '', '0', 10),
(225, 2, '花椒粉', '1/2大匙', '', '0', 11),
(225, 2, '香油', '少許 ', '', '0', 12),
(225, 3, '用辣油爆香花椒粒、乾辣椒、再放入辣豆瓣醬2大匙、蒜末、薑末，接著放入水和香料包略煮出味道，最後進行過濾成為辣湯。', '', '', '1', 0),
(225, 3, '另起油鍋爆香辣豆瓣醬1大匙、黃金豆醬後，加入辣湯煮 滾。', '', '', '1', 1),
(225, 3, '取臭豆腐、鴨血切塊、白菜切片放入辣湯裡炆煮，再加「ほんだし ®/烹大師®」鰹魚風味、雞粉、蠔油、醬油、鹽、花椒粉煮至入味。', '', '', '1', 2),
(225, 3, '最後加入秀珍菇、蒜苗拌煮，起鍋前淋入花椒油、香油即可。', '', '', '1', 3),
(223, 1, '山東大白菜', '1顆', '', '', 1),
(223, 1, '紅蘿蔔', '30g', '', '', 2),
(223, 1, '乾香菇', '15g', '', '', 3),
(223, 1, '炸豬皮', '45g', '', '', 4),
(223, 1, '雞蛋', '1顆', '', '', 5),
(223, 1, '蝦米', '25g', '', '', 6),
(223, 1, '薑', '20g', '', '', 7),
(223, 1, '黑木耳', '45g', '', '', 8),
(223, 1, '香菜', '少許', '', '', 9),
(223, 2, '「ほんだし ®/烹大師®」鰹魚風味', '1小匙', '', '0', 1),
(223, 2, '沙拉油', '3小匙', '', '0', 2),
(223, 2, '鹽', '1小匙', '', '0', 3),
(223, 2, '米酒', '1小匙', '', '0', 4),
(223, 2, '香油', '2小匙', '', '0', 5),
(223, 2, '水', '1杯', '', '0', 6),
(223, 3, '將白菜、紅蘿蔔、黑木耳切片，香菇、炸豬皮泡水泡軟切片備用。', '', '', '1', 0),
(223, 3, '雞蛋打散，蛋花炸成蛋酥備用。', '', '', '1', 1),
(223, 3, '熱鍋用油爆香蝦米和薑片，再放入白菜梗、炸豬皮，以及「ほんだし ®/烹大師®」鰹魚風味、鹽、米酒、水開小火慢炒至軟。', '', '', '1', 2),
(223, 3, '大約10分鐘後白菜梗煮軟後，放入白菜葉、紅蘿蔔、黑木耳、香菇、蛋酥，再用小火燜煮3~5分鐘後淋上少許香油即可盛盤，最後再放香菜點綴即可。', '', '', '1', 3),
(237, 1, '<濃湯底>,波士頓龍蝦,紅蘿蔔,西洋芹,洋蔥', ',1隻,1根,2根,1顆', '', '', 1),
(237, 1, '<龍蝦肉沙拉>,櫛瓜,蒜頭,洋蔥', ',1/4 根,1顆 ,1/4 顆', '', '', 2),
(237, 2, '<濃湯底>,奶油,白酒,干貝高湯(ほんだし干貝風味10g+水1000c.c.),橄欖油,麵粉,牛奶,「ほんだし ®/烹大師®」鰹魚風味', ',1小碗,適量,1000c.c.,適量,1小碗,1小碗,1/4 小匙', ',,,,,,,', '0,0,0,0,0,0,0,0', 1),
(237, 2, '<龍蝦肉沙拉>,「味之素品牌」沙拉醬,果糖 ,義大利綜合香料', ',適量,適量,少許', ',,,', '0,0,0,0', 2),
(237, 3, '將紅蘿蔔、西洋芹、洋蔥洗淨切丁備用。', '', '', '1', 0),
(237, 3, '將龍蝦洗淨去殼，龍蝦肉取出汆燙備用。', '', '', '1', 1),
(237, 3, '熱鍋用奶油炒香做法①的蔬菜及龍蝦殼，淋入白酒提味，加入干貝高湯熬煮1小時，再將龍蝦殼取出。', '', '', '1', 2),
(237, 3, '熱鍋倒入橄欖油，小火將麵粉炒至變色後，加入牛奶拌勻備用。', '', '', '1', 3),
(237, 3, '做法③用調理機均質過篩，以小火熬煮後，慢慢倒入做法④至濃稠，最後加入「ほんだし ®/烹大師®」鰹魚風味調味。', '', '', '1', 4),
(237, 3, '將龍蝦肉、蒜頭、洋蔥切碎，櫛瓜切丁，將「味之素品牌」沙拉醬、果糖與綜合香料拌勻成龍蝦沙拉。', '', '', '1', 5),
(237, 3, '在湯盤擺上龍蝦肉沙拉，倒入做法⑤濃湯即可。', '', '', '1', 6),
(237, 3, '★蝦殼炒香後更能帶出鮮甜味同時也可去腥。', '', '', '0', 7),
(236, 1, '原味貝果', '1個', '', '', 1),
(236, 1, '洋蔥', '1/4個', '', '', 2),
(236, 1, '蒜頭', '1顆', '', '', 3),
(236, 1, '牛絞肉', '100g', '', '', 4),
(236, 1, '蘑菇', '1小碗', '', '', 5),
(236, 1, '起司片', '1片', '', '', 6),
(236, 1, '蕃茄', '4片', '', '', 7),
(236, 1, '紫洋蔥圈', '3圈 ', '', '', 8),
(236, 1, '萵苣', '適量', '', '', 9),
(236, 1, '水煮蛋切片', '1個', '', '', 10),
(236, 2, '「ほんだし ®/烹大師®」雞粉', '1/4小匙', '', '0', 1),
(236, 2, '鹽', '適量', '', '0', 2),
(236, 2, '橄欖油', '適量', '', '0', 3),
(236, 2, '「味之素品牌」沙拉醬', '1小匙', '', '0', 4),
(236, 2, '黃芥末', '1小匙', '', '0', 5),
(236, 2, '蜂蜜', '3小匙', '', '0', 6),
(236, 3, '將洋蔥洗淨切碎，蒜頭去皮切碎，拌入牛絞肉，加入「ほんだし ®/烹大師®」雞粉、鹽，反覆摔打至黏稠。', '', '', '1', 0),
(236, 3, '蘑菇切塊，鍋中加入橄欖油，放入蘑菇炒至焦香取出。', '', '', '1', 1),
(236, 3, '鍋中加入橄欖油，將做法①放入兩面煎上色後取出，放上做法②磨菇，鋪上起司片，放入180˚C烤箱烤上色。', '', '', '1', 2),
(236, 3, '拌入「味之素品牌」沙拉醬、黃芥末與蜂蜜調勻為日式蜂蜜芥末醬。', '', '', '1', 3),
(236, 3, '將原味貝果剖開抹上日式蜂蜜芥末醬，依序擺上材料(萵苣、蕃茄、紫洋蔥圈與水煮蛋切片)盛盤即可。', '', '', '1', 4),
(236, 3, '★美味方程式:①蘑菇炒至焦香，更能帶出菇類甜度及香氣。②日式蜂蜜芥末醬比例:芥末醬：蜂蜜：沙拉醬 =1:3:1', '', '', '0', 5),
(235, 1, '去骨雞胸', '1塊', '', '', 1),
(235, 1, '酪梨', '1/2顆', '', '', 2),
(235, 1, '奶油生菜', '適量', '', '', 3),
(235, 1, '牛蕃茄', '1/2顆', '', '', 4),
(235, 1, '馬茲瑞拉起司', '3片', '', '', 5),
(235, 1, '可頌', '1個', '', '', 6),
(235, 2, '「ほんだし ®/烹大師®」雞粉', '1/4小匙', '', '0', 1),
(235, 2, '迷迭香', '少許', '', '0', 2),
(235, 2, '鹽', '少許', '', '0', 3),
(235, 2, '「味之素品牌」沙拉醬', '3小匙', '', '0', 4),
(235, 2, '蕃茄醬', '1小匙', '', '0', 5),
(235, 2, '果糖', '2小匙', '', '0', 6),
(235, 3, '將去骨雞胸加入「ほんだし ®/烹大師®」雞粉、迷迭香、鹽，以58˚C 溫水醃製70分鐘後取出切片備用。', '', '', '1', 0),
(235, 3, '將酪梨洗淨切片，奶油生菜洗淨冰鎮，牛蕃茄洗淨切片，馬茲瑞拉起司切片備用。', '', '', '1', 1),
(235, 3, '「味之素品牌」沙拉醬、蕃茄醬、果糖調勻為日式千島醬。', '', '', '1', 2),
(235, 3, '將可頌剖開依序擺入材料，淋上日式千島醬盛盤即可。', '', '', '1', 3),
(235, 3, '★美味方程式:①利用「ほんだし ®/烹大師®」雞粉醃製，可以將鮮味提升。②日式千島醬比例: 蕃茄醬：果糖：沙拉醬 =1:2:3', '', '', '0', 4),
(234, 1, '義大利細麵', '1人份', '', '', 1),
(234, 1, '蒜頭', '1顆', '', '', 2),
(234, 1, '洋蔥', '1/4顆', '', '', 3),
(234, 1, '明太子', '1碗', '', '', 4),
(234, 1, '蟹腿肉', '半盒', '', '', 5),
(234, 1, '海苔絲', '適量', '', '', 6),
(234, 2, '鹽', '少許', '', '0', 1),
(234, 2, '橄欖油', '少許', '', '0', 2),
(234, 2, '白酒', '適量', '', '0', 3),
(234, 2, '起士粉', '適量', '', '0', 4),
(234, 2, '動物性鮮奶油', '50g', '', '0', 5),
(234, 2, '「ほんだし ®/烹大師®」干貝風味', '1/4 小匙', '', '0', 6),
(234, 2, '「ほんだし ®/烹大師®」雞粉', '1/4 小匙', '', '0', 7),
(234, 3, '鍋中水燒至滾開，加入鹽和橄欖油，放入義大利細麵煮至熟，撈出瀝乾備用。', '', '', '1', 0),
(234, 3, '蒜頭去皮切末，洋蔥切絲，明太子以鮮奶油及ほんだし干貝風味拌勻。', '', '', '1', 1),
(234, 3, '蟹腿肉加入白酒及ほんだし雞粉醃製備用。', '', '', '1', 2),
(234, 3, '熱鍋倒入橄欖油小火炒香蒜末及洋蔥絲，放入蟹腿肉大火拌炒並淋上白酒提味。', '', '', '1', 3),
(234, 3, '取2湯勺做法 ①麵湯和明太子鮮奶油拌勻後加入做法④，大火煮至湯汁滾開，再放入義大利細麵拌勻盛盤，最後灑上起士粉和海苔絲裝飾即可。', '', '', '1', 4),
(234, 3, '★美味方程式:①明太子本身鹹味已足，無須再加入過多鹽。②動物性鮮奶油切勿過度加熱。', '', '', '0', 5),
(233, 1, '義大利寬扁麵', '1人份', '', '', 1),
(233, 1, '蒜頭', '3顆', '', '', 2),
(233, 1, '蛤蜊', '1小碗', '', '', 3),
(233, 1, '草蝦', '6尾', '', '', 4),
(233, 1, '中卷', '1隻', '', '', 5),
(233, 1, '紅辣椒', '1根', '', '', 6),
(233, 1, '蘆筍', '3根', '', '', 7),
(233, 1, '干貝', '6顆', '', '', 8),
(233, 2, '鹽', '少許', '', '0', 1),
(233, 2, '橄欖油', '少許', '', '0', 2),
(233, 2, '白酒', '少許', '', '0', 3),
(233, 2, '「ほんだし ®/烹大師®」鰹魚風味', '1/4 小匙', '', '0', 4),
(233, 2, '「ほんだし ®/烹大師®」干貝風味', '1/4 小匙', '', '0', 5),
(233, 3, '鍋中水燒至滾開，加入鹽和橄欖油，再放入寬扁麵大火煮至熟，撈出瀝乾備用。', '', '', '1', 0),
(233, 3, '蒜頭去皮切片，紅辣椒、蘆筍切段。', '', '', '1', 1),
(233, 3, '蛤蜊洗淨泡水吐沙，草蝦去殼洗淨，中卷去除內膜和內臟，洗淨後切圈狀。', '', '', '1', 2),
(233, 3, '小火爆香蒜片及紅辣椒、蘆筍炒出香氣後取出，再放入蛤蜊大火拌勻並淋入白酒提味，蓋上鍋蓋煮至蛤蜊打開後盛出備用。', '', '', '1', 3),
(233, 3, '取2湯勺做法①麵湯和少許橄欖油，再加入蒜片與紅辣椒於鍋中，大火煮滾至湯汁呈淺乳白色，再放入草蝦、中卷片、寬扁麵和「ほんだし ®/烹大師®」鰹魚風味、干貝風味調味，最後放入蛤蜊拌勻入味，盛盤。', '', '', '1', 4),
(233, 3, '干貝兩面煎上色，再放入蘆筍擺盤即可。', '', '', '1', 5),
(233, 3, '★美味方程式:①蛤蜊開殼後先挑起，避免肉老掉。②最後加入調過味的煮麵水，使麵汁略呈濃稠，讓小麥香更濃郁。', '', '', '0', 6),
(232, 1, '去骨雞腿', '1隻', '', '', 1),
(232, 1, '綠櫛瓜', '1/4根', '', '', 2),
(232, 1, '紅甜椒', '1/4 顆', '', '', 3),
(232, 1, '帶皮南瓜', '1小碗', '', '', 4),
(232, 1, '培根', '1條', '', '', 5),
(232, 1, '鴻喜菇', '1小碗', '', '', 6),
(232, 1, '洋蔥', '1/4顆', '', '', 7),
(232, 1, '義大利米(煮熟)', ' 1碗', '', '', 8),
(232, 1, '蝦夷蔥', '適量', '', '', 9),
(232, 1, '去皮南瓜', '600g', '', '', 10),
(232, 2, '雞高湯,「ほんだし ®/烹大師®」雞粉,水', ',5g,500c.c.', ',,', '0,0,0', 1),
(232, 2, '南瓜醬(以下材料放入調理機均質),去皮南瓜蒸熟,「ほんだし ®/烹大師®」香菇風味,水', ',600g,2g,200c.c.', ',,,', '0,0,0,0', 2),
(232, 3, '去骨雞腿、綠櫛瓜、紅甜椒洗淨切丁，帶皮南瓜洗淨切塊蒸熟，培根切片、鴻喜菇洗淨，洋蔥切碎備用。', '', '', '1', 0),
(232, 3, '鍋中加入雞腿丁煎香取出，原鍋加入奶油、綠櫛瓜、紅甜椒、培根、鴻喜菇、洋蔥碎炒香，加入煮熟義大利米拌勻，再加入雞高湯燉煮收乾。', '', '', '1', 1),
(232, 3, '取另一鍋加熱南瓜醬，放入去骨雞腿丁及做法②所有材料，中小火煮至濃稠盛盤，放入蒸熟帶皮南瓜及蝦夷蔥切細珠裝飾。', '', '', '1', 2),
(232, 3, '★美味方程式:乾煎雞腿釋放出雞油，更可以帶出濃郁香氣。', '', '', '0', 3),
(224, 1, '紅蟳', '1隻', '', '', 1),
(224, 1, '長糯米', '300  g', '', '', 2),
(224, 1, '乾香菇', '45  g', '', '', 3),
(224, 1, '蝦米', '20  g', '', '', 4),
(224, 1, '薑', '15  g', '', '', 5),
(224, 1, '五花肉絲', '40  g', '', '', 6),
(224, 1, '紅蔥頭', '20  g', '', '', 7),
(224, 1, '香菜', '少許', '', '', 8),
(224, 2, '「ほんだし ®/烹大師®」干貝風味', '1大匙', '', '0', 1),
(224, 2, '米酒', '75  g', '', '0', 2),
(224, 2, '醬油', '2小匙', '', '0', 3),
(224, 2, '蠔油', '2小匙', '', '0', 4),
(224, 2, '胡椒粉', '1大匙', '', '0', 5),
(224, 2, '麻油', '2大匙', '', '0', 6),
(224, 2, '鹽', '少許', '', '0', 7),
(224, 2, '糖', '少許', '', '0', 8),
(224, 3, '糯米、乾香菇泡水隔夜，乾香菇切絲、紅蔥頭切片、薑去皮切成薑末、紅蟳洗淨切塊備用。', '', '', '1', 0),
(224, 3, '糯米瀝乾後放入蒸鍋蒸35~40分鐘後取出，紅蔥頭炸成紅蔥酥。', '', '', '1', 1),
(224, 3, '熱鍋用麻油炒香薑末、肉絲、香菇絲、蝦米等材料，再將其餘的調味料，放入蒸熟的糯米一起拌炒均勻即可盛盤。', '', '', '1', 2),
(224, 3, '紅蟳蒸10分鐘後取出，將熟的紅蟳放在炒好的糯米飯上，再進蒸鍋蒸10分鐘取出，放上香菜點綴即可。', '', '', '1', 3),
(224, 3, '★美味方程式:薑末與蝦米切碎可以提升鮮味，香味更突出。', '', '', '0', 4),
(192, 1, '山芋泥,雞蛋', '25g,10個 ', '', '', 1),
(192, 1, '高麗菜(切粗菜絲),天婦羅花,紅薑', '1000g,少許,少許', '', '', 2),
(192, 1, '熱水', '700c.c.', '', '', 3),
(192, 1, '低筋麵粉', '100g', '', '', 4),
(192, 1, '豬里肌肉', '400g', '', '', 5),
(192, 1, '柴魚片', '適量', '', '', 6),
(192, 1, '海苔粉', '適量', '', '', 7),
(192, 1, '沙拉油', '適量', '', '', 8),
(192, 2, '「ほんだし®/烹大師®」鰹魚風味', '15g', '', '0', 1),
(192, 2, '「味之素品牌」沙拉醬', '30g', '', '0', 2),
(192, 2, '大阪燒醬', '適量', '', '0', 3),
(192, 3, '在鉢中放入熱水700c.c.、「ほんだし®/烹大師®」鰹魚風味15g，調成高湯，放冷備用。', '', '', '1', 0),
(192, 3, '另個鉢中放入低筋麵粉，加入做法①，混合後加入材料Ⓐ拌勻。', '', '', '1', 1),
(192, 3, '做法②中加入材料Ⓑ，做成大阪燒的麵皮。', '', '', '1', 2),
(192, 3, '在熱好的鐵板上放入沙拉油，依序放入豬里肌肉及做法③的麵皮，將兩面煎熟。', '', '', '1', 3),
(192, 3, '將做法④盛盤，依序淋上大阪燒醬及「味之素品牌」沙拉醬，灑上海苔粉，最後放上柴魚片即可。', '', '', '1', 4),
(198, 1, '新鮮竹筍(對半切)', '400g', '', '', 1),
(198, 1, '山椒嫩葉', '少許', '', '', 2),
(198, 2, '水,酒,薄鹽醬油,「ほんだし®/烹大師®」鰹魚風味', '150c.c.,15c.c.,6c.c.,1g', ',,,', '0,0,0,0', 1),
(198, 2, '「味之素品牌」沙拉醬,西京味噌', '15g ,16g', ',', '0,0', 2),
(198, 3, '新鮮竹筍放入調味料Ⓐ煮熟。', '', '', '1', 0),
(198, 3, '做法①的竹筍上塗上拌好的調味料Ⓑ，放入烤箱烤約5分鐘至表面呈焦糖色。', '', '', '1', 1),
(198, 3, '盛盤後綴以山椒嫩葉。', '', '', '1', 2),
(217, 1, '豬五花(一口大小) ', '500g', '', '', 1),
(217, 1, '蘿蔔(切厚度1cm半圓形) ', '350g', '', '', 2),
(217, 1, '薑(切薄片) ', '20g ', '', '', 3),
(217, 2, '酒,味醂,糖,醬油', '200c.c.,65c.c.,65g ,65c.c.', ',,,', '0,0,0,0', 1),
(217, 2, '「AJI-NO-MOTO® PLUS®」高鮮味精', '2g', '', '0', 2),
(217, 2, '水 ', '800c.c.', '', '0', 3),
(217, 3, '將豬五花、AJINOMOTO PLUS高鮮味精放入碗中抓醃。 ', '', '', '1', 0),
(217, 3, '平底鍋加熱，先將脂肪較多的肉丟下逼油，再將做法1的豬五花放入並煎至上色。 ', '', '', '1', 1),
(217, 3, '在鍋內放入做法①、水、蘿蔔、薑後，在熬煮過程中，將雜質撈起。 ', '', '', '1', 2),
(217, 3, '煮熟後，加入調味料Ⓐ後蓋上蓋子，用小火滾到醬汁剩一半即可。 ', '', '', '1', 3),
(239, 1, '白蘿蔔（切粗絲4公分）', '300g', '', '', 1),
(239, 1, '胡蘿蔔（切粗絲4公分）', '100g', '', '', 2),
(239, 1, '日本蕪菁（切4公分）', '100g', '', '', 3),
(239, 1, '木棉豆腐（細塊、瀝乾）', '150g', '', '', 4),
(239, 2, '水', '800c.c.', '', '0', 1),
(239, 2, '「ほんだし ®/烹大師®」鰹魚風味 ', '4g', 'https://www.ajinomoto.com.tw/foodservice/product-detail.php?id=1', '0', 2),
(239, 2, '味噌', '45g', '', '0', 3),
(239, 2, '麻油', '12g', '', '0', 4),
(239, 3, '將麻油加入炒鍋以中火加熱後，放入豆腐炒至表面沾附油。依序放入胡蘿蔔和白蘿蔔快速翻炒。', '', '', '1', 0),
(239, 3, '在水中加入「ほんだし ®/烹大師®」鰹魚風味2g並煮沸，上蓋再以小火煮15分鐘。放入日本蕪菁、味噌，再加入剩餘的「ほんだし ®/烹大師®」鰹魚風味，在即將煮沸前關火。', '', '', '1', 1),
(246, 1, '豬大腿（切丁3cm）', '60g', '', '', 0),
(246, 1, '木棉豆腐（切丁2cm）,韭菜（切段3cm）,豆芽菜', '150g,50g,120g', '', '', 1),
(246, 1, '水雲菜', '40g', '', '', 2),
(246, 2, '胡椒', '少許', '', '0', 0),
(246, 2, '水', '800c.c.', '', '0', 1),
(246, 2, '「ほんだし ®/烹大師®」鰹魚風味 ', '4.5g', 'https://www.ajinomoto.com.tw/foodservice/product-detail.php?id=1', '0', 2),
(246, 2, '味噌', '54g', '', '0', 3),
(246, 3, '鍋中放入水、「ほんだし ®/烹大師®」鰹魚風味半份和沾滿胡椒的豬肉煮至微滾，再以小火煮10分鐘。', '', '', '1', 0),
(246, 3, '加入材料Ⓐ與味噌化開，把剩餘的「ほんだし ®/烹大師®」鰹魚風味倒入煮沸，最後放入水雲菜稍微燉煮即可。', '', '', '1', 1),
(247, 1, '納豆', '200g', '', '', 0),
(247, 1, '木棉豆腐（切丁1cm）', '150g', '', '', 1),
(247, 1, '油豆腐（切丁1cm、瀝油）,蒟蒻（切丁1cm、先燙過）,芋頭莖（切1cm・泡開）', '60g,125g,40g', '', '', 2),
(247, 1, '蔥花,水芹菜株', '20g,20g', '', '', 3),
(247, 2, '水,「ほんだし ®/烹大師®」鰹魚風味 ', '800c.c.,6g', ',https://www.ajinomoto.com.tw/foodservice/product-detail.php?id=1', '0,0', 0),
(247, 2, '味噌,酒', '54g,15c.c.', ',', '0,0', 1),
(247, 3, '用菜刀將納豆細切，放到研缽中充分壓磨。', '', '', '1', 0),
(247, 3, '鍋中放入調味料Ⓐ、材料Ⓐ後煮至微滾後關火。', '', '', '1', 1),
(247, 3, '在做法①中加入調味料Ⓑ和做法②的湯汁200c.c.後攪拌均勻。', '', '', '1', 2),
(247, 3, '再把做法②加熱，加入豆腐。再把做法③倒入並攪拌，在即將煮沸前關火。', '', '', '1', 3),
(247, 3, '盛入器皿，用材料Ⓑ來點綴。', '', '', '1', 4),
(240, 1, '豌豆（去絲）', '35g', '', '', 1),
(240, 1, '土當歸（切段5公分）', '60g', '', '', 2),
(240, 2, '水', '700c.c.', '', '0', 1),
(240, 2, '「ほんだし ®/烹大師®」鰹魚風味 ', '4g', 'https://www.ajinomoto.com.tw/foodservice/product-detail.php?id=1', '0', 2),
(240, 2, '味噌', '54g', '', '0', 3),
(240, 3, '鍋中放入水加熱煮沸後，加入「ほんだし ®/烹大師®」鰹魚風味和豌豆再加熱至微滾。', '', '', '1', 0),
(240, 3, '開小火並加入味噌化開，在即將煮沸前關火，加入土當歸後盛入器皿。', '', '', '1', 1),
(241, 1, '鴻喜菇（分小株）', '100g', '', '', 1),
(241, 1, '金針菇（切半）', '100g', '', '', 2),
(241, 2, '水,「ほんだし ®/烹大師®」鰹魚風味,味噌', '600c.c.,4g,45g', ',https://www.ajinomoto.com.tw/foodservice/product-detail.php?id=1,', '0,0,0', 1),
(241, 2, '酒', '15c.c.', '', '0', 2),
(241, 3, '將鴻喜菇和金針菇上淋滿酒，攤平在已熱鍋的平底鍋上(不加油)，用小火烤至微軟。', '', '', '1', 0),
(241, 3, '在鍋中加入調味料Ⓐ ，加熱至微滾。', '', '', '1', 1),
(241, 3, '把（1）盛入器皿，倒入（2）的湯汁。', '', '', '1', 2),
(242, 1, '雞腿肉（切小塊）', '80g', '', '', 1),
(242, 1, '大蔥（斜切薄片、浸泡冷水）', '20g', '', '', 2),
(242, 1, '大白菜（切細絲）,胡蘿蔔（切細絲）,地瓜（切丁1cm）', '100g,20g,30g', '', '', 3),
(242, 2, '水,「ほんだし ®/烹大師®」鰹魚風味', '800c.c.,6g', ',https://www.ajinomoto.com.tw/foodservice/product-detail.php?id=1', '0,0', 1),
(242, 2, '味噌', '45g', '', '0', 2),
(242, 2, '沙拉油', '12g', '', '0', 3),
(242, 3, '鍋中放入油加熱，將雞肉炒至變色後，加入材料Ⓐ再翻炒。', '', '', '1', 0),
(242, 3, '再加入調味料Ⓐ煮沸後，撈掉浮沫，煮5分鐘後放入味噌化開。', '', '', '1', 1),
(242, 3, '盛入器皿，灑上瀝乾的蔥花。', '', '', '1', 2),
(243, 1, '含湯汁的鯖魚罐頭（到掉一半湯汁）,馬鈴薯（滾刀一口大小）,高麗菜（一口大小）,胡蘿蔔（切粗絲）', '240g,70g,100g,40g', '', '', 1),
(243, 1, '薑絲', '少許', '', '', 2);
INSERT INTO `recipepro_detail` (`recipepro_id`, `class`, `names`, `contents`, `links`, `blanks`, `list_order`) VALUES
(243, 2, '水,「ほんだし ®/烹大師®」鰹魚風味', '800c.c.,6g', ',https://www.ajinomoto.com.tw/foodservice/product-detail.php?id=1', '0,0', 1),
(243, 2, '味噌', '54g', '', '0', 2),
(243, 3, '將材料Ⓐ與調味料Ⓐ都放入鍋中煮沸後撈掉浮沫，煮3分鐘左右關火，放入味噌化開。', '', '', '1', 0),
(243, 3, '盛入器皿，放上薑絲。', '', '', '1', 1),
(245, 1, '泡菜', '130g', '', '', 1),
(245, 1, '牛五花肉（切薄片）', '80g', '', '', 2),
(245, 1, '蒜頭（壓扁）', '1片', '', '', 3),
(245, 1, '香菇（切半）', '3朵', '', '', 4),
(245, 1, '秋葵（切半）', '6條', '', '', 5),
(245, 1, '韭菜（切4cm）', '0.5束', '', '', 6),
(245, 1, '蔥（斜切）', '0.5根', '', '', 7),
(245, 1, '木棉豆腐 ', '75g', '', '', 8),
(245, 2, '麻油', '2大匙', '', '0', 1),
(245, 2, '水', '800c.c.', '', '0', 2),
(245, 2, '「ほんだし ®/烹大師®」鰹魚風味', '2g', 'https://www.ajinomoto.com.tw/foodservice/product-detail.php?id=1', '0', 3),
(245, 2, '紅味噌', '5大匙', '', '0', 4),
(245, 3, '鍋中放入麻油加熱後爆香蒜頭，再加入牛五花拌炒至變色。', '', '', '1', 0),
(245, 3, '加入香菇和秋葵一起翻炒，再加入水、「ほんだし ®/烹大師®」鰹魚風味煮至微滾。', '', '', '1', 1),
(245, 3, '加入泡菜和豆腐燉煮7~8分鐘後，再放入紅味噌化開。最後加入韭菜與蔥煮沸，盛入器皿。', '', '', '1', 2),
(249, 1, '微鹽醃漬鮭魚 (約一口大小)     ,馬鈴薯 (切小塊)                     ,洋蔥 (切1cm)                  ,紅蘿蔔 (切滾刀)                ', '100g,270g,50g,75g', '', '', 1),
(249, 1, '小蔥 (切3公分長)                                 ', '18g', '', '', 2),
(249, 2, '水', '800c.c.', '', '0', 1),
(249, 2, '「ほんだし ®/烹大師®」鰹魚風味', '3g', 'https://www.ajinomoto.com.tw/foodservice/product-detail.php?id=1', '0', 2),
(249, 2, '味噌                                                         ', '36g', '', '0', 3),
(249, 3, '鍋中放入水、「ほんだし ®/烹大師®」鰹魚風味1.5g、材料Ⓐ以中火加熱。', '', '', '1', 0),
(249, 3, '沸騰後轉小火，撈掉浮沫，放入馬鈴薯煮20分鐘至鬆軟。', '', '', '1', 1),
(249, 3, '因鮭魚會釋出鹽味，需要視味道濃淡並將味噌化開，把剩下的「ほんだし ®/烹大師®」鰹魚風味加進湯中，煮至微滾，撒上蔥段。', '', '', '1', 2),
(248, 1, '茄子(斜切半月形1cm)', '160g', '', '', 1),
(248, 1, '日本薑(切薄片)', '20g', '', '', 2),
(248, 2, '水', '600c.c.', '', '0', 1),
(248, 2, '「ほんだし ®/烹大師®」鰹魚風味', '3g', 'https://www.ajinomoto.com.tw/foodservice/product-detail.php?id=1', '0', 2),
(248, 2, '味噌', '45g', '', '0', 3),
(248, 2, '沙拉油', '6g', '', '0', 4),
(248, 3, '鍋中放入油加熱，把茄子炒至軟後加水。', '', '', '1', 0),
(248, 3, '將茄子煮熟後，放入日本生薑、「ほんだし/烹大師® 鰹魚」，        把味噌化開，調整口味後，盛入器皿。', '', '', '1', 1),
(244, 1, '雞絞肉,薑末 ', '120g,少許', '', '', 1),
(244, 1, '球狀蒟蒻,冷凍芋頭', '100g,100g', '', '', 2),
(244, 1, '小蕃茄', '60g', '', '', 3),
(244, 1, '日本蕪菁（切3cm）', '20g', '', '', 4),
(244, 2, '鹽,胡椒', '1g,少許', ',', '0,0', 1),
(244, 2, '水,「ほんだし ®/烹大師®」鰹魚風味', '800c.c.,6g', ',https://www.ajinomoto.com.tw/foodservice/product-detail.php?id=1', '0,0', 2),
(244, 2, '味噌', '45g', '', '0', 3),
(244, 3, '在深碗內放入材料Ⓐ、調味料Ⓐ並充分攪拌後，製作成雞肉丸子。', '', '', '1', 0),
(244, 3, '鍋中放入材料Ⓑ、調味料Ⓑ加熱至煮沸後，用沾濕的湯匙拿取做法①的丸子。', '', '', '1', 1),
(244, 3, '將雞肉丸子加熱後，加入味噌化開，再加入小番茄。', '', '', '1', 2),
(244, 3, '盛入器皿，放上日本蕪菁。', '', '', '1', 3),
(125, 1, '湯底材料：,水,豬大骨(約兩支),雞骨架,雞腳(切除指甲),豬背油,洋蔥,蒜仁,蒜苗,蘋果,薑,清酒', ',5000c.c.,600g,300g,100g,200g,2顆,30g,半支,半顆,30g,100c.c.', '', '', 1),
(125, 1, '雞肉丸子材料：,去骨土雞腿泥,洋蔥碎,白芝麻 ,蔥碎,蛋白,香油,和風醬油,「ほんだし®/烹大師®」雞粉,白胡椒粉', ',1隻,1/4顆,1大匙,1根,1根,1大匙,1大匙,1/2大匙,1/2小匙', '', '', 2),
(125, 1, '鍋物材料：,櫻桃鴨胸片,五花肉片,蛋豆腐,大白菜,春菊,洋蔥,金針菇,鴻喜菇,紅蘿蔔,地瓜,莫札瑞拉軟式起司,甜玉米', ',200g,180  g,1塊,1/4顆,150g,1/2顆,80  g,100  g,80  g,4塊,4塊,3段', '', '', 3),
(125, 2, '「ほんだし®/烹大師®」雞粉', '20  g', '', '0', 1),
(125, 2, '「AJINOMOTO PLUS」高鮮味精', '10  g', '', '0', 2),
(125, 2, '鹽', '10  g', '', '0', 3),
(125, 3, '豬大骨、雞骨架、雞腳、豬背油先用滾水汆燙約20分鐘去除血水，用水沖洗乾淨，再將所有材料與5公升的水放入鍋中大火煮滾，轉中火保持沸騰，期間需常撈除浮沫雜質，煮約3～4小時後，湯汁剩1/2的量時，', '', '', '1', 0),
(125, 3, '用紗布過濾，再加入「ほんだし®/烹大師®」雞粉20g、AJINOMOTO PLUS高鮮味精10g、鹽10g調味即為豚骨高湯備用。', '', '', '1', 1),
(125, 3, '將雞肉丸子材料放入盆中混合均勻、將做法①的高湯加熱至80度(不沸騰)，用圓形湯匙挖至鍋中不要翻動，待丸子浮上水面撈起備用。櫻桃鴨胸片成薄片備用。', '', '', '1', 2),
(125, 3, '將鍋物材料與雞肉丸子依續放入鍋中，大火煮滾後，再涮入櫻桃鴨胸片即可。', '', '', '1', 3),
(250, 1, '牛肉片', '200  g', '', '', 1),
(250, 1, '蒜苗', '2支', '', '', 2),
(250, 1, '芹菜', '50g', '', '', 3),
(250, 1, '黃豆芽', '80g', '', '', 4),
(250, 1, '乾辣椒', '20g', '', '', 5),
(250, 1, '花椒粒', '10g', '', '', 6),
(250, 1, '香菜', '少許', '', '', 7),
(250, 1, '薑', '20g', '', '', 8),
(250, 1, '蒜頭', '20g', '', '', 9),
(250, 2, '太白粉水', '少許', '', '0', 1),
(250, 2, '鹽', '1/4小匙', '', '0', 2),
(250, 2, '「AJINOMOTO PLUS」高鮮味精', '1小匙', 'https://www.ajinomoto.com.tw/foodservice/product-detail.php?id=8', '0', 3),
(250, 2, '米酒', '1大匙', '', '0', 4),
(250, 2, '花椒油', '80g', '', '0', 5),
(250, 2, '麻辣湯底：,辣豆瓣,麻辣醬,高湯', ',80g,50g,500g', ',,,', '0,0,0,0', 6),
(250, 3, '蒜苗切斜片，芹菜切段，蒜頭、薑切末。', '', '', '1', 0),
(250, 3, '牛肉片醃少許太白粉水。', '', '', '1', 1),
(250, 3, '鍋放入少許沙拉油，炒香乾辣椒與花椒粒後撈出，剁碎備用。', '', '', '1', 2),
(250, 3, '原鍋將蒜苗、芹菜、黃豆芽炒軟，下鹽巴放入砂鍋內備用。', '', '', '1', 3),
(250, 3, '鍋中放入油1大匙，爆香蒜末、薑末，加入調好的麻辣湯底、「AJINOMOTO PLUS」高鮮味精與米酒）煮滾後關火，一片一片放入牛肉片後再開火，煮至微滾即可起鍋倒入砂鍋內。', '', '', '1', 4),
(250, 3, '將做法③放入砂鍋內。', '', '', '1', 5),
(250, 3, '鍋中加入花椒油，加熱至160°c，淋入砂鍋內，最後放上香菜即可。', '', '', '1', 6),
(250, 3, '▶完美比例◀「AJINOMOTO PLUS」高鮮味精: 麻辣湯底=5g: 500g', '', '', '0', 7);

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
,`product_names` mediumtext
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
  `c_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '建立時間',
  `c_user_id` int(11) NOT NULL COMMENT '建立使用者編號',
  `u_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '修改時間',
  `u_user_id` int(11) NOT NULL COMMENT '修改使用者編號'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `role`
--

INSERT INTO `role` (`id`, `name`, `status`, `remark`, `c_time`, `c_user_id`, `u_time`, `u_user_id`) VALUES
(1, '系統管理員', 0, '', '2019-03-09 15:54:58', 0, '2019-03-09 15:54:58', 0),
(2, '管理者', 0, '台灣味之素管理者', '2019-09-16 16:22:11', 1, '2019-09-16 16:22:11', 1),
(3, 'gemma', 2, '', '2020-01-15 11:46:16', 1, '2020-01-15 11:47:15', 1);

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
(1, 20),
(1, 21),
(1, 22),
(1, 23),
(1, 24),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 9),
(2, 10),
(2, 11),
(2, 12),
(2, 13),
(2, 14),
(2, 15),
(2, 16),
(2, 17),
(2, 18),
(2, 19),
(2, 20),
(2, 21),
(2, 22),
(2, 23),
(2, 24),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(3, 6),
(3, 7),
(3, 8),
(3, 9),
(3, 10),
(3, 11),
(3, 12),
(3, 13),
(3, 14),
(3, 15),
(3, 16),
(3, 17),
(3, 18),
(3, 19),
(3, 20),
(3, 21),
(3, 22),
(3, 23),
(3, 24);

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
(1, 96),
(2, 9),
(2, 10),
(2, 11),
(2, 12),
(2, 13),
(2, 14),
(2, 15),
(2, 16),
(2, 17),
(2, 18),
(2, 19),
(2, 20),
(2, 21),
(2, 22),
(2, 23),
(2, 24),
(2, 25),
(2, 26),
(2, 27),
(2, 28),
(2, 29),
(2, 30),
(2, 31),
(2, 32),
(2, 33),
(2, 34),
(2, 35),
(2, 36),
(2, 37),
(2, 38),
(2, 39),
(2, 43),
(2, 44),
(2, 45),
(2, 46),
(2, 47),
(2, 48),
(2, 49),
(2, 50),
(2, 51),
(2, 52),
(2, 53),
(2, 54),
(2, 55),
(2, 56),
(2, 57),
(2, 58),
(2, 59),
(2, 60),
(2, 61),
(2, 62),
(2, 63),
(2, 64),
(2, 65),
(2, 66),
(2, 67),
(2, 68),
(2, 69),
(2, 70),
(2, 71),
(2, 72),
(2, 73),
(2, 74),
(2, 75),
(2, 76),
(2, 77),
(2, 78),
(2, 79),
(2, 80),
(2, 81),
(2, 82),
(2, 83),
(2, 84),
(2, 85),
(2, 86),
(2, 87),
(2, 88),
(2, 89),
(2, 90),
(2, 91),
(2, 92),
(2, 93),
(2, 94),
(2, 95),
(2, 96),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(3, 6),
(3, 7),
(3, 8),
(3, 9),
(3, 10),
(3, 11),
(3, 12),
(3, 13),
(3, 14),
(3, 15),
(3, 16),
(3, 17),
(3, 18),
(3, 19),
(3, 20),
(3, 21),
(3, 22),
(3, 23),
(3, 24),
(3, 25),
(3, 26),
(3, 27),
(3, 28),
(3, 29),
(3, 30),
(3, 31),
(3, 32),
(3, 33),
(3, 34),
(3, 35),
(3, 36),
(3, 37),
(3, 38),
(3, 39),
(3, 40),
(3, 43),
(3, 44),
(3, 45),
(3, 46),
(3, 47),
(3, 48),
(3, 49),
(3, 50),
(3, 51),
(3, 52),
(3, 53),
(3, 54),
(3, 55),
(3, 56),
(3, 57),
(3, 58),
(3, 59),
(3, 60),
(3, 61),
(3, 62),
(3, 63),
(3, 64),
(3, 65),
(3, 66),
(3, 67),
(3, 68),
(3, 69),
(3, 70),
(3, 71),
(3, 72),
(3, 73),
(3, 74),
(3, 75),
(3, 76),
(3, 77),
(3, 78),
(3, 79),
(3, 80),
(3, 81),
(3, 82),
(3, 83),
(3, 84),
(3, 85),
(3, 86),
(3, 87),
(3, 88),
(3, 89),
(3, 90),
(3, 91),
(3, 92),
(3, 93),
(3, 94),
(3, 95),
(3, 96);

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
(1, 3),
(1, 5),
(1, 6),
(1, 7),
(2, 4);

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
  `c_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '建立時間',
  `c_user_id` int(11) NOT NULL COMMENT '建立使用者編號',
  `u_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '修改時間',
  `u_user_id` int(11) NOT NULL COMMENT '修改使用者編號'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `tag`
--

INSERT INTO `tag` (`id`, `category_id`, `name`, `list_order`, `status`, `remark`, `c_time`, `c_user_id`, `u_time`, `u_user_id`) VALUES
(1, 1, '雞肉', 0, 0, '', '2019-12-24 17:03:40', 1, '2019-12-24 17:03:40', 1),
(2, 1, '豬肉', 0, 0, '', '2019-12-24 17:03:48', 1, '2019-12-24 17:03:48', 1),
(3, 1, '牛肉', 0, 0, '', '2019-12-24 17:03:54', 1, '2019-12-24 17:03:54', 1),
(4, 1, '海鮮類', 0, 0, '', '2019-12-24 17:04:03', 1, '2019-12-24 17:04:03', 1),
(5, 1, '葉菜類', 0, 0, '', '2019-12-24 17:04:12', 1, '2019-12-24 17:04:12', 1),
(6, 1, '根莖類', 0, 0, '', '2019-12-24 17:04:18', 1, '2019-12-24 17:04:18', 1),
(7, 1, '瓜果類', 0, 0, '', '2019-12-24 17:04:25', 1, '2019-12-24 17:04:25', 1),
(8, 1, '菇蕈類', 0, 0, '', '2019-12-24 17:04:34', 1, '2019-12-24 17:04:34', 1),
(9, 1, '豆類', 0, 0, '', '2019-12-24 17:04:46', 1, '2019-12-25 09:22:16', 1),
(10, 1, '蛋', 0, 0, '', '2019-12-24 17:04:51', 1, '2019-12-25 09:22:25', 1),
(11, 2, '中式', 0, 0, '', '2019-12-24 17:05:05', 1, '2019-12-24 17:05:05', 1),
(12, 2, '日式', 0, 0, '', '2019-12-24 17:05:11', 1, '2019-12-24 17:05:11', 1),
(13, 2, '西式', 0, 0, '', '2019-12-24 17:05:18', 1, '2019-12-24 17:05:18', 1),
(14, 2, '韓式', 0, 0, '', '2019-12-24 17:05:31', 1, '2019-12-24 17:05:31', 1),
(15, 2, '異國', 0, 0, '', '2019-12-24 17:05:40', 1, '2019-12-24 17:05:40', 1),
(16, 2, '素食', 0, 0, '', '2019-12-24 17:05:45', 1, '2019-12-24 17:05:45', 1),
(17, 2, '小吃', 0, 0, '', '2019-12-24 17:06:09', 1, '2019-12-24 17:06:09', 1),
(18, 2, '其他', 0, 0, '', '2019-12-24 17:06:17', 1, '2019-12-24 17:06:17', 1),
(19, 3, '主菜', 0, 0, '', '2019-12-24 17:06:38', 1, '2019-12-24 17:06:38', 1),
(20, 3, '主食', 0, 0, '', '2019-12-24 17:10:15', 1, '2019-12-24 17:10:15', 1),
(21, 3, '涼拌', 0, 0, '', '2019-12-24 17:10:22', 1, '2019-12-24 17:10:22', 1),
(22, 3, '配菜', 0, 0, '', '2019-12-24 17:10:29', 1, '2019-12-24 17:10:29', 1),
(23, 3, '湯羹類', 0, 0, '', '2019-12-24 17:10:37', 1, '2019-12-24 17:10:37', 1),
(24, 3, '火鍋', 0, 0, '', '2019-12-24 17:12:05', 1, '2019-12-24 17:12:17', 1),
(25, 3, '其他', 0, 0, '', '2019-12-24 17:12:56', 1, '2019-12-24 17:12:56', 1),
(26, 4, '  g', 0, 0, '', '2019-12-24 17:13:37', 1, '2019-12-24 17:13:37', 1),
(27, 4, 'c.c.', 0, 0, '', '2019-12-24 17:13:44', 1, '2019-12-24 17:13:44', 1),
(28, 4, '小匙', 0, 0, '', '2019-12-24 17:14:02', 1, '2019-12-24 17:14:02', 1),
(29, 4, '大匙', 0, 0, '', '2019-12-24 17:14:08', 1, '2019-12-24 17:14:08', 1),
(30, 4, '適量', 0, 0, '', '2019-12-24 17:14:16', 1, '2019-12-24 17:14:16', 1),
(31, 4, '少許', 0, 0, '', '2019-12-24 17:14:31', 1, '2019-12-24 17:14:31', 1),
(32, 4, '顆', 0, 0, '', '2019-12-24 17:15:11', 1, '2019-12-24 17:15:11', 1),
(33, 4, '支', 0, 0, '', '2019-12-24 17:15:22', 1, '2019-12-24 17:15:22', 1),
(34, 4, '根', 0, 0, '', '2019-12-24 17:15:37', 1, '2019-12-24 17:15:37', 1),
(35, 4, '片', 0, 0, '', '2019-12-24 17:16:06', 1, '2019-12-24 17:16:06', 1),
(36, 1, '其他', 0, 0, '', '2019-12-25 09:20:58', 1, '2019-12-25 09:20:58', 1);

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
  `c_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '建立時間',
  `c_user_id` int(11) NOT NULL COMMENT '建立使用者編號',
  `u_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '修改時間',
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
  `last_login_time` datetime DEFAULT NULL COMMENT '最後登入時間',
  `last_login_ip` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '最後登入IP位址',
  `status` tinyint(1) NOT NULL COMMENT '狀態，0：啟用，1：停用，2：已刪除',
  `remark` text COLLATE utf8_unicode_ci NOT NULL COMMENT '備註',
  `c_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '建立時間',
  `c_user_id` int(11) NOT NULL COMMENT '建立使用者編號',
  `u_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '修改時間',
  `u_user_id` int(11) NOT NULL COMMENT '修改使用者編號'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `user`
--

INSERT INTO `user` (`id`, `account`, `password`, `name`, `email`, `phone`, `last_login_time`, `last_login_ip`, `status`, `remark`, `c_time`, `c_user_id`, `u_time`, `u_user_id`) VALUES
(1, 'admin@ks', 'KVXTOnThNp7RqzgFRTVyvA==', 'admin', 'vic@ks-design.com.tw', '', '2021-05-03 17:15:22', '219.84.199.61', 0, '', '2019-03-09 15:55:38', 0, '2020-01-06 09:28:01', 1),
(2, 'web_server', 'f4HEr6Ki2B4+nh5+LCCn+Q==', 'web_server', 'vic@ks-design.com.tw', '02-87716606', '2021-05-15 09:10:42', '219.84.199.61', 0, '', '2019-07-23 15:44:04', 1, '2020-01-06 09:15:48', 1),
(3, 'vic@ks', '+jg1og867os4dMQD5GQgdQ==', 'vic@ks', 'vic@ks-design.com.tw', '', '2019-09-02 10:01:00', '::1', 2, '', '2019-07-23 15:44:31', 1, '2019-09-02 10:01:00', 1),
(4, 'admin', '/qj2561j1v5QJ326e7PwSw==', '管理者', 'gemma@ajinomoto.com.tw', '', '2019-11-25 10:54:16', '219.84.199.61', 2, '', '2019-09-16 16:24:19', 1, '2019-12-24 11:43:20', 1),
(5, 'kenny', '/qj2561j1v5QJ326e7PwSw==', '李肯尼', 'kenny@ks-design.com.tw', '', NULL, NULL, 0, '', '2020-01-06 09:56:13', 1, '2020-01-06 09:56:13', 1),
(6, 'amber', '/qj2561j1v5QJ326e7PwSw==', '李肯尼', 'kenny@ks-design.com.tw', '', NULL, NULL, 2, '', '2020-01-06 09:59:55', 1, '2020-01-06 09:59:55', 1),
(7, 'gemma', 'Bq3B5sunjL4zE7Uk17R3YQ==', '郭育瑄', 'gemma@ajinomoto.com.tw', '', '2021-05-14 15:04:12', '219.84.199.61', 0, '', '2020-01-15 11:47:09', 1, '2020-01-15 11:47:09', 1);

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

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `ad_view`  AS  select `ad`.`id` AS `id`,`ad`.`name` AS `name`,`ad`.`pic_url` AS `pic_url`,`ad`.`pic_alt` AS `pic_alt`,`ad`.`link` AS `link`,`ad`.`list_order` AS `list_order`,`ad`.`status` AS `status`,`ad`.`remark` AS `remark`,`ad`.`c_time` AS `c_time`,`ad`.`c_user_id` AS `c_user_id`,`c_user`.`name` AS `c_user_name`,`ad`.`u_time` AS `u_time`,`ad`.`u_user_id` AS `u_user_id`,`u_user`.`name` AS `u_user_name` from ((`ad` left join `user` `c_user` on(`ad`.`c_user_id` = `c_user`.`id`)) left join `user` `u_user` on(`ad`.`u_user_id` = `u_user`.`id`)) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `banner_view`
--
DROP TABLE IF EXISTS `banner_view`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `banner_view`  AS  select `banner`.`id` AS `id`,`banner`.`name` AS `name`,`banner`.`pic_url` AS `pic_url`,`banner`.`pic_alt` AS `pic_alt`,`banner`.`link` AS `link`,`banner`.`blank` AS `blank`,`banner`.`list_order` AS `list_order`,`banner`.`status` AS `status`,`banner`.`remark` AS `remark`,`banner`.`c_time` AS `c_time`,`banner`.`c_user_id` AS `c_user_id`,`c_user`.`name` AS `c_user_name`,`banner`.`u_time` AS `u_time`,`banner`.`u_user_id` AS `u_user_id`,`u_user`.`name` AS `u_user_name` from ((`banner` left join `user` `c_user` on(`banner`.`c_user_id` = `c_user`.`id`)) left join `user` `u_user` on(`banner`.`u_user_id` = `u_user`.`id`)) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `brand_view`
--
DROP TABLE IF EXISTS `brand_view`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `brand_view`  AS  select `brand`.`id` AS `id`,`brand`.`name` AS `name`,`brand`.`pic_url` AS `pic_url`,`brand`.`pic_alt` AS `pic_alt`,`brand`.`list_order` AS `list_order`,`brand`.`status` AS `status`,`brand`.`remark` AS `remark`,`brand`.`c_time` AS `c_time`,`brand`.`c_user_id` AS `c_user_id`,`c_user`.`name` AS `c_user_name`,`brand`.`u_time` AS `u_time`,`brand`.`u_user_id` AS `u_user_id`,`u_user`.`name` AS `u_user_name` from ((`brand` left join `user` `c_user` on(`brand`.`c_user_id` = `c_user`.`id`)) left join `user` `u_user` on(`brand`.`u_user_id` = `u_user`.`id`)) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `campaign_tag_view`
--
DROP TABLE IF EXISTS `campaign_tag_view`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `campaign_tag_view`  AS  select `campaign_tag`.`id` AS `id`,`campaign_tag`.`name` AS `name`,`campaign_tag`.`color` AS `color`,`campaign_tag`.`list_order` AS `list_order`,`campaign_tag`.`status` AS `status`,`campaign_tag`.`remark` AS `remark`,`campaign_tag`.`c_time` AS `c_time`,`campaign_tag`.`c_user_id` AS `c_user_id`,`c_user`.`name` AS `c_user_name`,`campaign_tag`.`u_time` AS `u_time`,`campaign_tag`.`u_user_id` AS `u_user_id`,`u_user`.`name` AS `u_user_name` from ((`campaign_tag` join `user` `c_user` on(`campaign_tag`.`c_user_id` = `c_user`.`id`)) left join `user` `u_user` on(`campaign_tag`.`u_user_id` = `u_user`.`id`)) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `campaign_view`
--
DROP TABLE IF EXISTS `campaign_view`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `campaign_view`  AS  select `campaign`.`id` AS `id`,`campaign`.`tag_ids` AS `tag_ids`,group_concat(`s`.`name` separator ',') AS `tag_names`,group_concat(`s`.`color` separator ',') AS `tag_colors`,`campaign`.`title` AS `title`,`campaign`.`sub_title` AS `sub_title`,`campaign`.`content` AS `content`,`campaign`.`pic_url` AS `pic_url`,`campaign`.`pic_alt` AS `pic_alt`,`campaign`.`release_date` AS `release_date`,`campaign`.`list_order` AS `list_order`,`campaign`.`status` AS `status`,`campaign`.`remark` AS `remark`,`campaign`.`c_time` AS `c_time`,`campaign`.`c_user_id` AS `c_user_id`,`c_user`.`name` AS `c_user_name`,`campaign`.`u_time` AS `u_time`,`campaign`.`u_user_id` AS `u_user_id`,`u_user`.`name` AS `u_user_name` from (((`campaign` left join `user` `c_user` on(`campaign`.`c_user_id` = `c_user`.`id`)) left join `user` `u_user` on(`campaign`.`u_user_id` = `u_user`.`id`)) left join `campaign_tag` `s` on(find_in_set(`s`.`id`,`campaign`.`tag_ids`))) group by `campaign`.`id` ;

-- --------------------------------------------------------

--
-- 檢視表結構 `city_area_view`
--
DROP TABLE IF EXISTS `city_area_view`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `city_area_view`  AS  select `area`.`zipcode` AS `zipcode`,`area`.`city_id` AS `city_id`,`city`.`name` AS `city_name`,`area`.`id` AS `area_id`,`area`.`name` AS `area_name` from (`area` left join `city` on(`area`.`city_id` = `city`.`id`)) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `higi_view`
--
DROP TABLE IF EXISTS `higi_view`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `higi_view`  AS  select `higi`.`id` AS `id`,`higi`.`name` AS `name`,`higi`.`pic_url` AS `pic_url`,`higi`.`pic_alt` AS `pic_alt`,`higi`.`content` AS `content`,`higi`.`description` AS `description`,`higi`.`recipepro_id` AS `recipepro_id`,`recipepro`.`name` AS `recipepro_name`,`recipepro`.`pic_url` AS `recipepro_pic_url`,`recipepro`.`pic_alt` AS `recipepro_pic_alt`,`recipepro`.`member_only` AS `recipepro_member_only`,`product`.`brand_id` AS `brand_id`,`brand`.`name` AS `brand_name`,`brand`.`pic_url` AS `brand_pic_url`,`brand`.`pic_alt` AS `brand_pic_alt`,`higi`.`product_id` AS `product_id`,`product`.`name` AS `product_name`,`product`.`pic_urls` AS `product_pic_urls`,`product`.`pic_alts` AS `product_pic_alts`,`higi`.`tags` AS `tags`,`higi`.`type` AS `type`,`higi`.`style` AS `style`,`higi`.`methods` AS `methods`,`higi`.`note` AS `note`,`higi`.`note_pic_url` AS `note_pic_url`,`higi`.`note_pic_alt` AS `note_pic_alt`,`higi`.`member_only` AS `member_only`,`higi`.`visitor` AS `visitor`,`higi`.`list_order` AS `list_order`,`higi`.`status` AS `status`,`higi`.`remark` AS `remark`,`higi`.`c_time` AS `c_time`,`higi`.`c_user_id` AS `c_user_id`,`c_user`.`name` AS `c_user_name`,`higi`.`u_time` AS `u_time`,`higi`.`u_user_id` AS `u_user_id`,`u_user`.`name` AS `u_user_name` from (((((`higi` left join `recipepro` on(`higi`.`recipepro_id` = `recipepro`.`id`)) left join `product` on(`higi`.`product_id` = `product`.`id`)) left join `brand` on(`product`.`brand_id` = `brand`.`id`)) left join `user` `c_user` on(`higi`.`c_user_id` = `c_user`.`id`)) left join `user` `u_user` on(`higi`.`u_user_id` = `u_user`.`id`)) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `log_view`
--
DROP TABLE IF EXISTS `log_view`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `log_view`  AS  select `log`.`id` AS `id`,`log`.`user_id` AS `user_id`,`user`.`account` AS `user_account`,`user`.`name` AS `user_name`,`log`.`ip` AS `ip`,`log`.`program_id` AS `program_id`,`program`.`name` AS `program_name`,`log`.`verb` AS `verb`,`log`.`args` AS `args`,`log`.`file` AS `file`,`log`.`resultCode` AS `resultCode`,`log`.`resultMessage` AS `resultMessage`,`log`.`resultData` AS `resultData`,`log`.`c_time` AS `c_time` from ((`log` left join `user` on(`log`.`user_id` = `user`.`id`)) left join `program` on(`log`.`program_id` = `program`.`id`)) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `member_higi_view`
--
DROP TABLE IF EXISTS `member_higi_view`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `member_higi_view`  AS  select `member`.`id` AS `member_id`,`member`.`account` AS `member_account`,`member`.`name` AS `member_name`,`member`.`status` AS `member_status`,`higi_view`.`id` AS `id`,`higi_view`.`name` AS `name`,`higi_view`.`pic_url` AS `pic_url`,`higi_view`.`pic_alt` AS `pic_alt`,`higi_view`.`content` AS `content`,`higi_view`.`description` AS `description`,`higi_view`.`recipepro_id` AS `recipepro_id`,`higi_view`.`recipepro_name` AS `recipepro_name`,`higi_view`.`recipepro_pic_url` AS `recipepro_pic_url`,`higi_view`.`recipepro_pic_alt` AS `recipepro_pic_alt`,`higi_view`.`recipepro_member_only` AS `recipepro_member_only`,`higi_view`.`brand_id` AS `brand_id`,`higi_view`.`brand_name` AS `brand_name`,`higi_view`.`brand_pic_url` AS `brand_pic_url`,`higi_view`.`brand_pic_alt` AS `brand_pic_alt`,`higi_view`.`product_id` AS `product_id`,`higi_view`.`product_name` AS `product_name`,`higi_view`.`product_pic_urls` AS `product_pic_urls`,`higi_view`.`product_pic_alts` AS `product_pic_alts`,`higi_view`.`tags` AS `tags`,`higi_view`.`methods` AS `methods`,`higi_view`.`note` AS `note`,`higi_view`.`member_only` AS `member_only`,`higi_view`.`visitor` AS `visitor`,`higi_view`.`list_order` AS `list_order`,`higi_view`.`status` AS `status`,`higi_view`.`remark` AS `remark`,`higi_view`.`c_time` AS `c_time`,`higi_view`.`c_user_id` AS `c_user_id`,`higi_view`.`c_user_name` AS `c_user_name`,`higi_view`.`u_time` AS `u_time`,`higi_view`.`u_user_id` AS `u_user_id`,`higi_view`.`u_user_name` AS `u_user_name` from ((`member` join `member_higi` on(`member`.`id` = `member_higi`.`member_id`)) join `higi_view` on(`member_higi`.`higi_id` = `higi_view`.`id`)) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `member_recipepro_view`
--
DROP TABLE IF EXISTS `member_recipepro_view`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `member_recipepro_view`  AS  select `member`.`id` AS `member_id`,`member`.`account` AS `member_account`,`member`.`name` AS `member_name`,`member`.`status` AS `member_status`,`recipepro_view`.`id` AS `id`,`recipepro_view`.`name` AS `name`,`recipepro_view`.`pic_url` AS `pic_url`,`recipepro_view`.`pic_alt` AS `pic_alt`,`recipepro_view`.`feature` AS `feature`,`recipepro_view`.`tags` AS `tags`,`recipepro_view`.`price` AS `price`,`recipepro_view`.`type` AS `type`,`recipepro_view`.`style` AS `style`,`recipepro_view`.`product_ids` AS `product_ids`,`recipepro_view`.`material_weight` AS `material_weight`,`recipepro_view`.`product_names` AS `product_names`,`recipepro_view`.`nutrition` AS `nutrition`,`recipepro_view`.`member_only` AS `member_only`,`recipepro_view`.`visitor` AS `visitor`,`recipepro_view`.`list_order` AS `list_order`,`recipepro_view`.`status` AS `status`,`recipepro_view`.`remark` AS `remark`,`recipepro_view`.`c_time` AS `c_time`,`recipepro_view`.`c_user_id` AS `c_user_id`,`recipepro_view`.`c_user_name` AS `c_user_name`,`recipepro_view`.`u_time` AS `u_time`,`recipepro_view`.`u_user_id` AS `u_user_id`,`recipepro_view`.`u_user_name` AS `u_user_name` from ((`member` join `member_recipepro` on(`member`.`id` = `member_recipepro`.`member_id`)) join `recipepro_view` on(`member_recipepro`.`recipepro_id` = `recipepro_view`.`id`)) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `member_view`
--
DROP TABLE IF EXISTS `member_view`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `member_view`  AS  select `member`.`id` AS `id`,`member`.`account` AS `account`,`member`.`verification` AS `verification`,`member`.`name` AS `name`,`member`.`gender` AS `gender`,`member`.`birthday` AS `birthday`,`member`.`phone` AS `phone`,`member`.`restaurant_name` AS `restaurant_name`,`area`.`zipcode` AS `restaurant_zipcode`,`area`.`city_id` AS `restaurant_city_id`,`city`.`name` AS `restaurant_city_name`,`member`.`restaurant_area_id` AS `restaurant_area_id`,`area`.`name` AS `restaurant_area_name`,`member`.`restaurant_type` AS `restaurant_type`,`member`.`last_login_time` AS `last_login_time`,`member`.`last_login_ip` AS `last_login_ip`,`member`.`status` AS `status`,`member`.`remark` AS `remark`,`member`.`c_time` AS `c_time`,`member`.`c_user_id` AS `c_user_id`,`c_user`.`name` AS `c_user_name`,`member`.`u_time` AS `u_time`,`member`.`u_user_id` AS `u_user_id`,`u_user`.`name` AS `u_user_name` from ((((`member` left join `area` on(`member`.`restaurant_area_id` = `area`.`id`)) left join `city` on(`area`.`city_id` = `city`.`id`)) left join `user` `c_user` on(`member`.`c_user_id` = `c_user`.`id`)) left join `user` `u_user` on(`member`.`u_user_id` = `u_user`.`id`)) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `menu_view`
--
DROP TABLE IF EXISTS `menu_view`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `menu_view`  AS  select `menu`.`id` AS `id`,`menu`.`parent_id` AS `parent_id`,`parent_menu`.`name` AS `parent_name`,`menu`.`name` AS `name`,`menu`.`url` AS `url`,`menu`.`icon` AS `icon`,`menu`.`program_ids` AS `program_ids`,`menu`.`list_order` AS `list_order`,`menu`.`status` AS `status`,`menu`.`remark` AS `remark`,`menu`.`c_time` AS `c_time`,`menu`.`c_user_id` AS `c_user_id`,`c_user`.`name` AS `c_user_name`,`menu`.`u_time` AS `u_time`,`menu`.`u_user_id` AS `u_user_id`,`u_user`.`name` AS `u_user_name` from (((`menu` left join `menu` `parent_menu` on(`menu`.`parent_id` = `parent_menu`.`id`)) left join `user` `c_user` on(`menu`.`c_user_id` = `c_user`.`id`)) left join `user` `u_user` on(`menu`.`u_user_id` = `u_user`.`id`)) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `product_view`
--
DROP TABLE IF EXISTS `product_view`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `product_view`  AS  select `product`.`id` AS `id`,`product`.`brand_id` AS `brand_id`,`brand`.`name` AS `brand_name`,`brand`.`pic_url` AS `brand_pic_url`,`brand`.`pic_alt` AS `brand_pic_alt`,`product`.`name` AS `name`,`product`.`pic_urls` AS `pic_urls`,`product`.`pic_alts` AS `pic_alts`,`product`.`tag` AS `tag`,`product`.`content` AS `content`,`product`.`tips` AS `tips`,`product`.`information` AS `information`,`product`.`mark` AS `mark`,`product`.`list_order` AS `list_order`,`product`.`status` AS `status`,`product`.`remark` AS `remark`,`product`.`c_time` AS `c_time`,`product`.`c_user_id` AS `c_user_id`,`c_user`.`name` AS `c_user_name`,`product`.`u_time` AS `u_time`,`product`.`u_user_id` AS `u_user_id`,`u_user`.`name` AS `u_user_name` from (((`product` left join `brand` on(`product`.`brand_id` = `brand`.`id`)) left join `user` `c_user` on(`product`.`c_user_id` = `c_user`.`id`)) left join `user` `u_user` on(`product`.`u_user_id` = `u_user`.`id`)) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `program_category_view`
--
DROP TABLE IF EXISTS `program_category_view`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `program_category_view`  AS  select `program_category`.`id` AS `id`,`program_category`.`name` AS `name`,`program_category`.`status` AS `status`,`program_category`.`remark` AS `remark`,`program_category`.`c_time` AS `c_time`,`program_category`.`c_user_id` AS `c_user_id`,`c_user`.`name` AS `c_user_name`,`program_category`.`u_time` AS `u_time`,`program_category`.`u_user_id` AS `u_user_id`,`u_user`.`name` AS `u_user_name` from ((`program_category` left join `user` `c_user` on(`program_category`.`c_user_id` = `c_user`.`id`)) left join `user` `u_user` on(`program_category`.`u_user_id` = `u_user`.`id`)) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `program_view`
--
DROP TABLE IF EXISTS `program_view`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `program_view`  AS  select `program`.`id` AS `id`,`program`.`category_id` AS `category_id`,`program_category`.`name` AS `category_name`,`program`.`name` AS `name`,`program`.`guid` AS `guid`,`program`.`status` AS `status`,`program`.`remark` AS `remark`,`program`.`c_time` AS `c_time`,`program`.`c_user_id` AS `c_user_id`,`c_user`.`name` AS `c_user_name`,`program`.`u_time` AS `u_time`,`program`.`u_user_id` AS `u_user_id`,`u_user`.`name` AS `u_user_name` from (((`program` left join `program_category` on(`program`.`category_id` = `program_category`.`id`)) left join `user` `c_user` on(`program`.`c_user_id` = `c_user`.`id`)) left join `user` `u_user` on(`program`.`u_user_id` = `u_user`.`id`)) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `recipepro_view`
--
DROP TABLE IF EXISTS `recipepro_view`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `recipepro_view`  AS  select `recipepro`.`id` AS `id`,`recipepro`.`name` AS `name`,`recipepro`.`pic_url` AS `pic_url`,`recipepro`.`pic_alt` AS `pic_alt`,`recipepro`.`feature` AS `feature`,`recipepro`.`tags` AS `tags`,`recipepro`.`price` AS `price`,`recipepro`.`type` AS `type`,`recipepro`.`style` AS `style`,`recipepro`.`product_ids` AS `product_ids`,`recipepro`.`material_weight` AS `material_weight`,group_concat(`s`.`name` separator ',') AS `product_names`,`recipepro`.`nutrition` AS `nutrition`,`recipepro`.`member_only` AS `member_only`,`recipepro`.`visitor` AS `visitor`,`recipepro`.`list_order` AS `list_order`,`recipepro`.`status` AS `status`,`recipepro`.`remark` AS `remark`,`recipepro`.`c_time` AS `c_time`,`recipepro`.`c_user_id` AS `c_user_id`,`c_user`.`name` AS `c_user_name`,`recipepro`.`u_time` AS `u_time`,`recipepro`.`u_user_id` AS `u_user_id`,`u_user`.`name` AS `u_user_name` from (((`recipepro` left join `user` `c_user` on(`recipepro`.`c_user_id` = `c_user`.`id`)) left join `user` `u_user` on(`recipepro`.`u_user_id` = `u_user`.`id`)) left join `product` `s` on(find_in_set(`s`.`id`,`recipepro`.`product_ids`))) group by `recipepro`.`id` ;

-- --------------------------------------------------------

--
-- 檢視表結構 `role_menu_view`
--
DROP TABLE IF EXISTS `role_menu_view`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `role_menu_view`  AS  select `role`.`id` AS `role_id`,`role`.`name` AS `role_name`,`role`.`status` AS `role_status`,`menu_view`.`id` AS `id`,`menu_view`.`parent_id` AS `parent_id`,`menu_view`.`parent_name` AS `parent_name`,`menu_view`.`name` AS `name`,`menu_view`.`url` AS `url`,`menu_view`.`icon` AS `icon`,`menu_view`.`program_ids` AS `program_ids`,`menu_view`.`list_order` AS `list_order`,`menu_view`.`status` AS `status`,`menu_view`.`remark` AS `remark`,`menu_view`.`c_time` AS `c_time`,`menu_view`.`c_user_id` AS `c_user_id`,`menu_view`.`c_user_name` AS `c_user_name`,`menu_view`.`u_time` AS `u_time`,`menu_view`.`u_user_id` AS `u_user_id`,`menu_view`.`u_user_name` AS `u_user_name` from ((`role` left join `role_menu` on(`role`.`id` = `role_menu`.`role_id`)) join `menu_view` on(`role_menu`.`menu_id` = `menu_view`.`id`)) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `role_program_view`
--
DROP TABLE IF EXISTS `role_program_view`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `role_program_view`  AS  select `role`.`id` AS `role_id`,`role`.`name` AS `role_name`,`role`.`status` AS `role_status`,`program_view`.`id` AS `id`,`program_view`.`category_id` AS `category_id`,`program_view`.`category_name` AS `category_name`,`program_view`.`name` AS `name`,`program_view`.`guid` AS `guid`,`program_view`.`status` AS `status`,`program_view`.`remark` AS `remark`,`program_view`.`c_time` AS `c_time`,`program_view`.`c_user_id` AS `c_user_id`,`program_view`.`c_user_name` AS `c_user_name`,`program_view`.`u_time` AS `u_time`,`program_view`.`u_user_id` AS `u_user_id`,`program_view`.`u_user_name` AS `u_user_name` from ((`role` left join `role_program` on(`role`.`id` = `role_program`.`role_id`)) join `program_view` on(`role_program`.`program_id` = `program_view`.`id`)) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `role_view`
--
DROP TABLE IF EXISTS `role_view`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `role_view`  AS  select `role`.`id` AS `id`,`role`.`name` AS `name`,`role`.`status` AS `status`,`role`.`remark` AS `remark`,`role`.`c_time` AS `c_time`,`role`.`c_user_id` AS `c_user_id`,`c_user`.`name` AS `c_user_name`,`role`.`u_time` AS `u_time`,`role`.`u_user_id` AS `u_user_id`,`u_user`.`name` AS `u_user_name` from ((`role` left join `user` `c_user` on(`role`.`c_user_id` = `c_user`.`id`)) left join `user` `u_user` on(`role`.`u_user_id` = `u_user`.`id`)) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `tag_category_view`
--
DROP TABLE IF EXISTS `tag_category_view`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `tag_category_view`  AS  select `tag_category`.`id` AS `id`,`tag_category`.`name` AS `name`,`tag_category`.`list_order` AS `list_order`,`tag_category`.`status` AS `status`,`tag_category`.`remark` AS `remark`,`tag_category`.`c_time` AS `c_time`,`tag_category`.`c_user_id` AS `c_user_id`,`c_user`.`name` AS `c_user_name`,`tag_category`.`u_time` AS `u_time`,`tag_category`.`u_user_id` AS `u_user_id`,`u_user`.`name` AS `u_user_name` from ((`tag_category` left join `user` `c_user` on(`tag_category`.`c_user_id` = `c_user`.`id`)) left join `user` `u_user` on(`tag_category`.`u_user_id` = `u_user`.`id`)) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `tag_view`
--
DROP TABLE IF EXISTS `tag_view`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `tag_view`  AS  select `tag`.`id` AS `id`,`tag`.`category_id` AS `category_id`,`tag_category`.`name` AS `category_name`,`tag`.`name` AS `name`,`tag`.`list_order` AS `list_order`,`tag`.`status` AS `status`,`tag`.`remark` AS `remark`,`tag`.`c_time` AS `c_time`,`tag`.`c_user_id` AS `c_user_id`,`c_user`.`name` AS `c_user_name`,`tag`.`u_time` AS `u_time`,`tag`.`u_user_id` AS `u_user_id`,`u_user`.`name` AS `u_user_name` from (((`tag` left join `tag_category` on(`tag`.`category_id` = `tag_category`.`id`)) left join `user` `c_user` on(`tag`.`c_user_id` = `c_user`.`id`)) left join `user` `u_user` on(`tag`.`u_user_id` = `u_user`.`id`)) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `user_role_menu_view`
--
DROP TABLE IF EXISTS `user_role_menu_view`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `user_role_menu_view`  AS  select `user`.`id` AS `user_id`,`user`.`account` AS `user_account`,`user`.`name` AS `user_name`,`user`.`status` AS `user_status`,`menu`.`id` AS `id`,`menu`.`parent_id` AS `parent_id`,`menu`.`name` AS `name`,`menu`.`url` AS `url`,`menu`.`icon` AS `icon`,`menu`.`program_ids` AS `program_ids`,`menu`.`status` AS `status`,`menu`.`remark` AS `remark`,`menu`.`list_order` AS `list_order` from ((((`user` left join `role_user` on(`user`.`id` = `role_user`.`user_id`)) left join `role` on(`role_user`.`role_id` = `role`.`id`)) left join `role_menu` on(`role`.`id` = `role_menu`.`role_id`)) left join `menu` on(`role_menu`.`menu_id` = `menu`.`id`)) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `user_role_program_view`
--
DROP TABLE IF EXISTS `user_role_program_view`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `user_role_program_view`  AS  select `user`.`id` AS `user_id`,`user`.`account` AS `user_account`,`user`.`name` AS `user_name`,`user`.`status` AS `user_status`,`role`.`id` AS `role_id`,`role`.`name` AS `role_name`,`role`.`status` AS `role_status`,`program`.`id` AS `program_id`,`program`.`name` AS `program_name`,`program`.`status` AS `program_status`,`program`.`guid` AS `program_guid`,`program_category`.`remark` AS `program_remark`,`program_category`.`id` AS `program_category_id`,`program_category`.`name` AS `program_category_name`,`program_category`.`status` AS `program_category_status` from (((((`user` left join `role_user` on(`user`.`id` = `role_user`.`user_id`)) left join `role` on(`role_user`.`role_id` = `role`.`id`)) left join `role_program` on(`role`.`id` = `role_program`.`role_id`)) left join `program` on(`role_program`.`program_id` = `program`.`id`)) join `program_category` on(`program`.`category_id` = `program_category`.`id`)) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `user_view`
--
DROP TABLE IF EXISTS `user_view`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `user_view`  AS  select `user`.`id` AS `id`,`user`.`account` AS `account`,`user`.`name` AS `name`,`user`.`email` AS `email`,`user`.`phone` AS `phone`,`user`.`last_login_time` AS `last_login_time`,`user`.`last_login_ip` AS `last_login_ip`,`user`.`status` AS `status`,`user`.`remark` AS `remark`,`user`.`c_time` AS `c_time`,`user`.`c_user_id` AS `c_user_id`,`c_user`.`name` AS `c_user_name`,`user`.`u_time` AS `u_time`,`user`.`u_user_id` AS `u_user_id`,`u_user`.`name` AS `u_user_name` from ((`user` left join `user` `c_user` on(`user`.`c_user_id` = `c_user`.`id`)) left join `user` `u_user` on(`user`.`u_user_id` = `u_user`.`id`)) ;

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
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `ad`
--
ALTER TABLE `ad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '廣告編號', AUTO_INCREMENT=3;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `area`
--
ALTER TABLE `area`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '鄉鎮市區編號', AUTO_INCREMENT=369;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Banner編號', AUTO_INCREMENT=6;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '品牌編號', AUTO_INCREMENT=6;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `campaign`
--
ALTER TABLE `campaign`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '餐飲情報編號', AUTO_INCREMENT=14;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `campaign_tag`
--
ALTER TABLE `campaign_tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '餐飲情報標籤編號', AUTO_INCREMENT=10;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `city`
--
ALTER TABLE `city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '縣市編號', AUTO_INCREMENT=23;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `higi`
--
ALTER TABLE `higi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '招客秘技編號', AUTO_INCREMENT=50;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `log`
--
ALTER TABLE `log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '操作記錄編號';

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `member`
--
ALTER TABLE `member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '會員編號', AUTO_INCREMENT=24;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '選單編號', AUTO_INCREMENT=25;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品編號', AUTO_INCREMENT=15;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `program`
--
ALTER TABLE `program`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '程式編號', AUTO_INCREMENT=97;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `program_category`
--
ALTER TABLE `program_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '程式類別編號', AUTO_INCREMENT=20;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `recipepro`
--
ALTER TABLE `recipepro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '專業食譜編號', AUTO_INCREMENT=251;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色編號', AUTO_INCREMENT=4;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '標籤編號', AUTO_INCREMENT=37;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tag_category`
--
ALTER TABLE `tag_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '標籤類別編號', AUTO_INCREMENT=5;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '使用者編號', AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
