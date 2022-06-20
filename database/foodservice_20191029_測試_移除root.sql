-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- 主機: 127.0.0.1
-- 產生時間： 2019-10-29 09:37:57
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

--
-- 資料表的匯出資料 `ad`
--

INSERT INTO `ad` (`id`, `name`, `pic_url`, `pic_alt`, `link`, `list_order`, `status`, `remark`, `c_time`, `c_user_id`, `u_time`, `u_user_id`) VALUES
(1, '烹大師', '/uploads/ad/1568196361.png', '', '', 0, 0, '', '2019-09-11 18:06:01', 1, '2019-09-11 18:06:01', 1),
(2, '高纖味精', '/uploads/ad/1568196396.png', '', '', 0, 0, '', '2019-09-11 18:06:36', 1, '2019-09-11 18:06:36', 1),
(3, 'CookDo', '/uploads/ad/1568196412.png', '', '', 0, 0, '', '2019-09-11 18:06:52', 1, '2019-09-11 18:06:52', 1),
(4, '雞粉', '/uploads/ad/1568196473.png', '', '', 0, 0, '', '2019-09-11 18:07:53', 1, '2019-09-11 18:07:53', 1),
(5, '雞粉', '/uploads/ad/1568196474.png', '', '', 0, 2, '', '2019-09-11 18:07:54', 1, '2019-09-11 18:07:59', 1),
(6, '味素', '/uploads/ad/1568196491.png', '', '', 0, 0, '', '2019-09-11 18:08:11', 1, '2019-09-11 18:08:11', 1),
(7, '馬鈴薯', '/uploads/ad/1568196506.png', '', '', 0, 0, '', '2019-09-11 18:08:26', 1, '2019-09-11 18:08:26', 1);

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

--
-- 資料表的匯出資料 `banner`
--

INSERT INTO `banner` (`id`, `name`, `pic_url`, `pic_alt`, `link`, `blank`, `list_order`, `status`, `remark`, `c_time`, `c_user_id`, `u_time`, `u_user_id`) VALUES
(1, '烹大師', '/uploads/banner/1568196323.jpg', '', '', 0, 0, 0, '', '2019-09-11 18:05:23', 1, '2019-09-11 18:05:23', 1);

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
-- 資料表的匯出資料 `brand`
--

INSERT INTO `brand` (`id`, `name`, `pic_url`, `pic_alt`, `list_order`, `status`, `remark`, `c_time`, `c_user_id`, `u_time`, `u_user_id`) VALUES
(1, 'ほんだし®/烹大師®', '/uploads/brand/1568196040.png', '', 0, 0, '', '2019-09-11 18:00:40', 1, '2019-09-11 18:00:40', 1),
(2, 'ほんだし®/烹大師®', '/uploads/brand/1568196043.png', '', 0, 2, '', '2019-09-11 18:00:43', 1, '2019-09-11 18:00:47', 1),
(3, '高鮮味精', '/uploads/brand/1568196070.png', '', 0, 0, '', '2019-09-11 18:01:10', 1, '2019-09-26 13:54:32', 4),
(4, '味素', '/uploads/brand/1568196085.png', '', 0, 0, '', '2019-09-11 18:01:25', 1, '2019-09-11 18:01:25', 1),
(5, 'S高鮮味精', '/uploads/brand/1569484417.png', '', 0, 0, '', '2019-09-26 13:56:21', 4, '2019-09-26 15:53:38', 4),
(6, '味之素品牌', '/uploads/brand/1569484434.png', '', 0, 0, '', '2019-09-26 13:56:47', 4, '2019-09-26 15:53:54', 4);

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
-- 資料表的匯出資料 `campaign`
--

INSERT INTO `campaign` (`id`, `tag_ids`, `title`, `sub_title`, `content`, `pic_url`, `pic_alt`, `release_date`, `list_order`, `status`, `remark`, `c_time`, `c_user_id`, `u_time`, `u_user_id`) VALUES
(1, '1', '鮮味·高湯的科學與設計演講會', '日本料理職人的思考', '活動時間：即日起～2019年7月31日<br />\r\n活動辦法：', '/uploads/campaign/1571194916.jpg', '', '2019-01-01 00:00:00', 0, 0, '', '2019-09-11 19:54:40', 1, '2019-10-16 11:01:56', 4);

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
-- 資料表的匯出資料 `campaign_tag`
--

INSERT INTO `campaign_tag` (`id`, `name`, `color`, `list_order`, `status`, `remark`, `c_time`, `c_user_id`, `u_time`, `u_user_id`) VALUES
(1, '活動', '#008000', 0, 0, '', '2019-09-11 19:53:15', 1, '2019-09-11 19:53:15', 1);

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
  `content` varchar(512) COLLATE utf8_unicode_ci NOT NULL COMMENT '內容',
  `description` varchar(512) COLLATE utf8_unicode_ci NOT NULL COMMENT '說明',
  `recipepro_id` int(11) NOT NULL COMMENT '專業食譜編號',
  `product_id` int(11) NOT NULL COMMENT '商品編號',
  `tags` text COLLATE utf8_unicode_ci NOT NULL COMMENT '標籤',
  `methods` text COLLATE utf8_unicode_ci NOT NULL COMMENT '烹調方式，以逗號分隔',
  `note` text COLLATE utf8_unicode_ci NOT NULL COMMENT '小筆記',
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
-- 資料表的匯出資料 `higi`
--

INSERT INTO `higi` (`id`, `name`, `pic_url`, `pic_alt`, `content`, `description`, `recipepro_id`, `product_id`, `tags`, `methods`, `note`, `member_only`, `visitor`, `list_order`, `status`, `remark`, `c_time`, `c_user_id`, `u_time`, `u_user_id`) VALUES
(1, '測試', '', '測試', '測試', '', 1, 1, '主菜', '', '測試', 0, 2, 0, 2, '測試', '2019-09-12 13:28:38', 1, '2019-09-16 15:29:49', 1),
(2, '和風義大利麵', '/uploads/higi/1571131662.jfif', '', '只需在義大利麵裡加入', '「ほんだし®/烹大師®」鰹魚風味與醬油，就能製作高湯風味的和風義大利麵 ', 0, 1, '麵食', ',義大利麵250g：醬油10ml＋「ほんだし®/烹大師®」鰹魚風味7g', '加入奶油味道會更加溫潤，也可當作炒烏龍麵的調味。', 0, 39, 0, 0, '', '2019-09-12 17:29:24', 1, '2019-10-28 17:15:43', 2),
(3, '炒麵', '/uploads/higi/1569490277.jpg', '', '在最後的步驟 加入「ほんだし®/烹大師®」鰹魚風味 營造香氣濃郁、滋味豐富的好味道', '在最後的步驟 加入「ほんだし®/烹大師®」鰹魚風味 營造香氣濃郁、滋味豐富的好味道', 0, 1, '主菜', '', '', 0, 23, 0, 0, '', '2019-09-26 17:31:17', 4, '2019-10-28 17:01:10', 2),
(4, '和風咖哩', '/uploads/higi/1571131119.jfif', '', '在最後的步驟 加入「ほんだし®/烹大師®」鰹魚風味 調配出和風咖哩', '', 6, 1, '主菜', '', '', 0, 5, 0, 0, '', '2019-10-15 17:18:39', 4, '2019-10-25 15:40:26', 2),
(5, '柴魚高湯茶泡飯', '/uploads/higi/1571131287.jfif', '', '只需在白飯與配料淋上 「ほんだし®/烹大師®」鰹魚風味＋熱水。 柴魚高湯茶泡飯就完成囉!', '', 0, 1, '主菜', '標準用量：熱水500g加入「ほんだし®/烹大師®」鰹魚風味10g', '', 0, 7, 0, 0, '', '2019-10-15 17:21:27', 4, '2019-10-28 14:53:56', 2);

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

--
-- 資料表的匯出資料 `login_member`
--

INSERT INTO `login_member` (`member_id`, `token`, `login_time`) VALUES
(1, '90588E85-2F8B-4DFA-6506-832E12E52D40', '2019-10-21 15:35:39'),
(3, '1BB36FDF-AE14-6F65-017F-A870E2B960E5', '2019-09-12 16:44:14'),
(4, 'B91E831A-0B48-D9AB-18F6-113BC4E94A8E', '2019-10-25 09:43:02');

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
(4, 'D8405806-62F6-3467-F772-CE7AC88BE220', '2019-10-28 16:27:44'),
(1, 'A506B964-DBBB-4262-BA22-4284D4434C88', '2019-10-21 18:15:09');

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

--
-- 資料表的匯出資料 `member`
--

INSERT INTO `member` (`id`, `account`, `password`, `verification`, `name`, `gender`, `birthday`, `phone`, `restaurant_name`, `restaurant_area_id`, `restaurant_type`, `last_login_time`, `last_login_ip`, `status`, `remark`, `c_time`, `c_user_id`, `u_time`, `u_user_id`) VALUES
(1, 'kelly@ks-design.com.tw', 'scO/yPjuMOa6QckfC/rSpw==', 'E4BE78A4-14BE-5F1B-56C2-0BB2A50D60CE', '凱斯測試', 2, '0000-00-00', '0978365326', '凱斯整合行銷', 11, '日式', '2019-10-21 15:35:39', '210.61.165.238', 0, '', '2019-09-11 20:24:17', 1, '2019-10-21 15:35:39', 2),
(2, 'vicwu0717@gmail.com', 'ipCTZwEr74gtKpe8jQn0eg==', '55ECEBD9-5C96-1EA6-8401-18DD59042E67', 'vic', 1, '0000-00-00', '0918737530', 'vic', 32, '日式', '0000-00-00 00:00:00', '', 0, '', '2019-09-12 13:47:04', 2, '2019-09-12 13:49:35', 1),
(3, 'gaga@ks-design.com.tw', '77VVom/oMRMlf49/tta37Q==', 'F82DFAB3-E458-A984-90C2-2673508C2DA1', 'GAGAtest', 1, '0000-00-00', '87716606', 'MOS', 8, '日式', '2019-09-12 16:44:14', '210.61.165.238', 0, '', '2019-09-12 16:43:33', 2, '2019-09-12 16:44:14', 2),
(4, 'gemma@ajinomoto.com.tw', 'Bq3B5sunjL4zE7Uk17R3YQ==', '7915FE13-DB44-28D1-13EB-B375936CF33F', '郭育瑄', 0, '0000-00-00', '0922254760', '欣葉', 8, '中式', '2019-10-25 09:43:02', '210.61.165.238', 0, '', '2019-10-15 16:50:45', 2, '2019-10-25 09:43:02', 2);

-- --------------------------------------------------------

--
-- 資料表結構 `member_higi`
--

CREATE TABLE `member_higi` (
  `member_id` int(11) NOT NULL COMMENT '會員編號',
  `higi_id` int(11) NOT NULL COMMENT '招客秘技編號'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 資料表的匯出資料 `member_higi`
--

INSERT INTO `member_higi` (`member_id`, `higi_id`) VALUES
(3, 1),
(4, 3);

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

--
-- 資料表的匯出資料 `member_recipepro`
--

INSERT INTO `member_recipepro` (`member_id`, `recipepro_id`) VALUES
(1, 1),
(4, 5);

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

--
-- 資料表的匯出資料 `product`
--

INSERT INTO `product` (`id`, `brand_id`, `name`, `pic_urls`, `pic_alts`, `tag`, `content`, `tips`, `information`, `mark`, `list_order`, `status`, `remark`, `c_time`, `c_user_id`, `u_time`, `u_user_id`) VALUES
(1, 1, '「ほんだし®/烹大師®」鰹魚風味1公斤', '/uploads/product/1571652636.png', '', '讓味道有了深度', '「ほんだし&reg;/烹大師&reg;」鰹魚風味自1970年開始販售以來一直是日本味之素公司的人氣商品之一。素材使用太平洋赤道附近海域捕獲之鰹魚，立即以低溫-20度&deg;C冷凍保存，運至日本燒津、枕崎等港口上岸後，再經由專家嚴選，採用獨家製成乾燻鰹魚。被挑中的鰹魚脂肪含量低、品質絕佳，經過嚴謹的品質、衛生管理及加工後，再經過耐心地烘焙，製成「ほんだし&reg;/烹大師&reg;」鰹魚風味，具獨特的香氣與風味。「ほんだし&reg;/烹大師&reg;」鰹魚風味能呈現料理清淡鮮美的味道，無論是烹調蔬菜、海鮮、肉類等不同食材，皆能完美引出食材原有風味；適各式炒、湯、火鍋等料理，提升鮮美的層次，讓您同時調理出味與健康。', '「ほんだし&reg;/烹大師&reg;」鰹魚風味自1970年在日本推出以來，始終秉持著三項堅持:香氣、醇度、美味，用於料理能有效提引並調和食材原本的風味。而獨特的顆粒狀產品設計，具有味道均衡、易溶解、保存性佳等特點，方便好用，不僅是家庭主婦的好幫手，也是飯店餐廳調味時的最佳選擇。', '<ul class=\"product-info-box p-a0\">\r\n	<li class=\"d-flex \"><span class=\"title\">原料</span><span class=\"text\">調味劑(L-麩酸鈉、5`-次黃嘌呤核苷磷酸二鈉、琥珀酸二鈉)、食鹽、乳糖、砂糖、乾燻鰹魚、鰹魚抽出物、酵母抽出物、D-木糖、麥芽糖、葡萄糖、糊精</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">淨重</span><span class=\"text\">1公斤</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">使用方法</span><span class=\"text\">７公克可調理成1000c.<span style=\"display: inline !important;\">c.</span>的高湯</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">原產地</span><span class=\"text\">日本國神奈川縣</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品包裝</span><span class=\"text\">1kgx12袋/箱</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品條碼</span><span class=\"text\">4901001375431</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">外箱尺寸</span><span class=\"text\">522x262x209mm</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存期限</span><span class=\"text\">24個月(常溫未開封狀態下) </span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">注意事項</span><span class=\"text\">本產品含有牛奶及其製品</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存方法</span><span class=\"text\">開封後，為了避免受潮，請密封存放於乾燥通風處，以確認產品的最佳風味及品質。 </span></li>\r\n</ul>\r\n', '<ul class=\"info-box p-a0\">\r\n	<li class=\"d-flex\"><span class=\"title\">每一份量</span><span class=\"text\">1公克</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">本包裝含</span><span class=\"text\">1000份</span></li>\r\n</ul>\r\n\r\n<ul class=\"product-info-box p-a0\">\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\"></span><span class=\"text-e\">每份</span><span class=\"text-h\">每100公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">熱量</span><span class=\"text-e\">2.2大卡</span><span class=\"text-h\">225大卡</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">蛋白質</span><span class=\"text-e\">0.2公克</span><span class=\"text-h\">24.1公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">脂肪</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title p-l10\">飽和脂肪</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title p-l10\">反式脂肪</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">碳水化合物</span><span class=\"text-e\">0.3公克</span><span class=\"text-h\">31.6公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">糖</span><span class=\"text-e\">0.2公克</span><span class=\"text-h\">17.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">鈉</span><span class=\"text-e\">175毫克</span><span class=\"text-h\">17500毫克</span></li>\r\n</ul>\r\n', 0, 0, '', '2019-09-11 18:03:53', 1, '2019-10-21 18:10:37', 1),
(2, 1, '「ほんだし®/烹大師®」干貝風味500公克', '/uploads/product/1568196661.png', '', '嚴選干貝 甘甜幸福味		', '具有濃厚鮮味的干貝，一向是傳統海鮮乾貨的代表。不論是入菜或是製成湯頭，都常見於中華料理中。然而，因為使用前處理繁瑣而且無法隨取隨用，再加上價格昂貴，造成一般使用上的諸多不便。「 ほんだし&reg; / 烹大師&reg; 」干貝風味為嚴選高級干貝凝縮而成的天然調味料。不需經過繁複的處理，即可享受干貝原始的甘甜鮮美。適用於各式家常料理，可輕鬆提引出食材原有的風味，只要添加一小匙，就能讓餐桌上的每道佳餚充滿幸福的心意。', '「ほんだし&reg;/烹大師&reg;」干貝風味，使用嚴選並於長時間乾燥後製成之干貝作為原料，保留了干貝最原始的濃郁風味及醇味，不必經過浸泡等處理，即可直接享受到干貝之自然甘甜風味！', '<ul class=\"product-info-box p-a0\">\r\n	<li class=\"d-flex \"><span class=\"title\"></span></li>\r\n	<li class=\"d-flex \"><span class=\"title\">原料</span><span class=\"text\">調味劑(L-麩酸鈉、DL-胺基丙酸、琥珀酸二鈉、5&#39;-次黃嘌呤核苷磷酸二鈉、5&#39;-鳥嘌呤核苷磷酸二鈉)、食鹽、蔗糖、玉米澱粉、干貝粉、酵母抽出物、扇貝抽出物、糊精</span></li>\r\n	<li class=\"d-flex \"><span class=\"title\">使用方法</span><span class=\"text\">10公克可調理成1000c.c<span style=\"display: inline !important;\">.</span>的高湯</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">淨重</span><span class=\"text\">500公克</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">原產地</span><span class=\"text\">中國上海</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品包裝</span><span class=\"text\">500gx12盒/箱</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品條碼</span><span class=\"text\">6933544300128</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">外箱尺寸</span><span class=\"text\">408x238x198mm</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存期限</span><span class=\"text\">18個月(常溫未開封狀態下) </span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">注意事項</span><span class=\"text\">本產品生產製程之設備有處理蝦、蛋、牛奶及其製品。</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存方法</span><span class=\"text\">本產品是萃取干貝精華研製而成。開封後，為了避免受潮，請密封存放於乾燥通風處，以確保產品的最佳風味及品質。</span></li>\r\n	<li class=\"d-flex\"><span class=\"text\"> </span></li>\r\n</ul>\r\n', '<ul class=\"info-box p-a0\">\r\n	<li class=\"d-flex\"><span class=\"title\"></span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">每一份量</span><span class=\"text\">1公克</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">本包裝含</span><span class=\"text\">500份</span></li>\r\n</ul>\r\n\r\n<ul class=\"product-info-box p-a0\">\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\"></span><span class=\"text-e\">每份</span><span class=\"text-h\">每100公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">熱量</span><span class=\"text-e\">2.3大卡</span><span class=\"text-h\">232大卡</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">蛋白質</span><span class=\"text-e\">0.3公克</span><span class=\"text-h\">29.1公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">脂肪</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title p-l10\">飽和脂肪</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title p-l10\">反式脂肪</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">碳水化合物</span><span class=\"text-e\">0.3公克</span><span class=\"text-h\">28.9公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">糖</span><span class=\"text-e\">0.1公克</span><span class=\"text-h\">8.1公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">鈉</span><span class=\"text-e\">150毫克</span><span class=\"text-h\">15000毫克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"text-h\"></span></li>\r\n</ul>\r\n', 0, 0, '', '2019-09-11 18:09:30', 1, '2019-10-21 16:42:55', 4),
(3, 1, '「ほんだし®/烹大師®」干貝風味500公克', '/uploads/product/1568196570.png', '', '嚴選干貝 甘甜幸福味		', '具有濃厚鮮味的干貝，一向是傳統海鮮乾貨的代表。不論是入菜或是製成湯頭，都常見於中華料理中。然而，因為使用前處理繁瑣而且無法隨取隨用，再加上價格昂貴，造成一般使用上的諸多不便。「 ほんだし&reg; / 烹大師&reg; 」干貝風味為嚴選高級干貝凝縮而成的天然調味料。不需經過繁複的處理，即可享受干貝原始的甘甜鮮美。適用於各式家常料理，可輕鬆提引出食材原有的風味，只要添加一小匙，就能讓餐桌上的每道佳餚充滿幸福的心意。', '「ほんだし&reg;/烹大師&reg;」干貝風味，使用嚴選並於長時間乾燥後製成之干貝作為原料，保留了干貝最原始的濃郁風味及醇味，不必經過浸泡等處理，即可直接享受到干貝之自然甘甜風味~', '<ul class=\"p-a0\">\r\n	<li class=\"d-flex \"><span class=\"title\">原料</span><span class=\"text\">調味劑(L-麩酸鈉、5`-次黃嘌呤核苷磷酸二鈉、琥珀酸二鈉)、食鹽、乳糖、砂糖、乾燻鰹魚、鰹魚抽出物、酵母抽出物、D-木糖、麥芽糖、葡萄糖、糊精</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">淨重</span><span class=\"text\">1公斤</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">原產地</span><span class=\"text\">日本國神奈川縣</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品包裝</span><span class=\"text\">1kgx12袋/箱</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品條碼</span><span class=\"text\">4901001375431</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">外箱尺寸</span><span class=\"text\">522x262x209mm</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存期限</span><span class=\"text\">24個月(常溫未開封狀態下) </span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">過敏原</span><span class=\"text\">2本產品含有牛奶及其製品</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存方法</span><span class=\"text\">開封後，為了避免受潮，請密封存放於乾燥通風處，以確認產品的最佳風味及品質。 </span></li>\r\n</ul>\r\n', '<ul class=\"p-a0\">\r\n	<li class=\"d-flex\"><span class=\"title\">每一份量</span><span class=\"text\">1公克</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">本包裝含</span><span class=\"text\">1000份</span></li>\r\n</ul>\r\n\r\n<ul class=\"p-a0\">\r\n	<li class=\"d-flex justify-content-between\"><span class=\"text-e\">每份</span><span class=\"text-h\">每100公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">熱量</span><span class=\"text-e\">2.2大卡</span><span class=\"text-h\">225大卡</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">蛋白質</span><span class=\"text-e\">0.2公克</span><span class=\"text-h\">24.1公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">脂肪</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title p-l10\">飽和脂肪</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title p-l10\">反式脂肪</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">碳水化合物</span><span class=\"text-e\">0.3公克</span><span class=\"text-h\">31.6公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">糖</span><span class=\"text-e\">0.2公克</span><span class=\"text-h\">17.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">鈉</span><span class=\"text-e\">175毫克</span><span class=\"text-h\">17500毫克</span></li>\r\n</ul>\r\n', 0, 2, '', '2019-09-11 18:09:31', 1, '2019-09-11 18:09:37', 1),
(4, 1, '「ほんだし®/烹大師®」干貝風味500公克', '/uploads/product/1568196571.png', '', '嚴選干貝 甘甜幸福味		', '具有濃厚鮮味的干貝，一向是傳統海鮮乾貨的代表。不論是入菜或是製成湯頭，都常見於中華料理中。然而，因為使用前處理繁瑣而且無法隨取隨用，再加上價格昂貴，造成一般使用上的諸多不便。「 ほんだし&reg; / 烹大師&reg; 」干貝風味為嚴選高級干貝凝縮而成的天然調味料。不需經過繁複的處理，即可享受干貝原始的甘甜鮮美。適用於各式家常料理，可輕鬆提引出食材原有的風味，只要添加一小匙，就能讓餐桌上的每道佳餚充滿幸福的心意。', '「ほんだし&reg;/烹大師&reg;」干貝風味，使用嚴選並於長時間乾燥後製成之干貝作為原料，保留了干貝最原始的濃郁風味及醇味，不必經過浸泡等處理，即可直接享受到干貝之自然甘甜風味~', '<ul class=\"p-a0\">\r\n	<li class=\"d-flex \"><span class=\"title\">原料</span><span class=\"text\">調味劑(L-麩酸鈉、5`-次黃嘌呤核苷磷酸二鈉、琥珀酸二鈉)、食鹽、乳糖、砂糖、乾燻鰹魚、鰹魚抽出物、酵母抽出物、D-木糖、麥芽糖、葡萄糖、糊精</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">淨重</span><span class=\"text\">1公斤</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">原產地</span><span class=\"text\">日本國神奈川縣</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品包裝</span><span class=\"text\">1kgx12袋/箱</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品條碼</span><span class=\"text\">4901001375431</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">外箱尺寸</span><span class=\"text\">522x262x209mm</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存期限</span><span class=\"text\">24個月(常溫未開封狀態下) </span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">過敏原</span><span class=\"text\">2本產品含有牛奶及其製品</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存方法</span><span class=\"text\">開封後，為了避免受潮，請密封存放於乾燥通風處，以確認產品的最佳風味及品質。 </span></li>\r\n</ul>\r\n', '<ul class=\"p-a0\">\r\n	<li class=\"d-flex\"><span class=\"title\">每一份量</span><span class=\"text\">1公克</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">本包裝含</span><span class=\"text\">1000份</span></li>\r\n</ul>\r\n\r\n<ul class=\"p-a0\">\r\n	<li class=\"d-flex justify-content-between\"><span class=\"text-e\">每份</span><span class=\"text-h\">每100公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">熱量</span><span class=\"text-e\">2.2大卡</span><span class=\"text-h\">225大卡</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">蛋白質</span><span class=\"text-e\">0.2公克</span><span class=\"text-h\">24.1公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">脂肪</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title p-l10\">飽和脂肪</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title p-l10\">反式脂肪</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">碳水化合物</span><span class=\"text-e\">0.3公克</span><span class=\"text-h\">31.6公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">糖</span><span class=\"text-e\">0.2公克</span><span class=\"text-h\">17.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">鈉</span><span class=\"text-e\">175毫克</span><span class=\"text-h\">17500毫克</span></li>\r\n</ul>\r\n', 0, 2, '', '2019-09-11 18:09:32', 1, '2019-09-11 18:09:42', 1),
(5, 1, '「ほんだし®/烹大師®」昆布風味500公克', '/uploads/product/1571653868.png', '', '使用嚴選北海道真昆布', '「昆布」為日本普遍使用之高湯原料，種類眾多，有真昆布、羅臼昆布、利尻昆布、日高昆布等，其中有「昆布之王」美譽的真昆布，其肉質寬厚，一直是最適合熬煮高湯的食材選擇。「ほんだし&reg;/烹大師&reg;」昆布風味使用嚴選北海道品質最優良的真昆布精製而成，可調製出風味高雅而清澄的高湯；口感溫順鮮甜，能提引出食材原有風味，是最適合烹調素食料理的高品質風味調味料。也是烹調湯品、炒菜類或涼拌小菜時的最佳選擇。', '「ほんだし&reg;/烹大師&reg;」昆布風味使用嚴選北海道「真昆布」製成，保留了昆布上方不易保存的白色粉末「D-甘露醇」，自然呈現最接近昆布的清澄風味！', '<ul class=\"product-info-box p-a0\">\r\n	<li class=\"d-flex \"><span class=\"title\">原料</span><span class=\"text\">調味劑(L-麩酸鈉、氯化鉀、5&#39;-次黃嘌呤核苷磷酸二鈉、5&#39;-鳥嘌呤核苷磷酸二鈉、琥珀酸二鈉)、食鹽、砂糖、D-甘露醇（甜味劑）、昆布粉、糊精、昆布抽出物</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">使用方法</span><span class=\"text\">7公克可調理成1000c.c.的高湯</span></li>\r\n	<li class=\"d-flex\"><span class=\"text\"></span><br />\r\n	<span class=\"title\">淨重</span><span class=\"text\">500公克</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">原產地</span><span class=\"text\">日本國三重縣</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品包裝</span><span class=\"text\">500gx12盒/箱</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品條碼</span><span class=\"text\">4901001375486</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">外箱尺寸</span><span class=\"text\">410x220x175mm</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存期限</span><span class=\"text\">24個月(常溫未開封狀態下)</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">注意事項</span><span class=\"text\">D-甘露醇為昆布表面白色粉末物質之一，屬糖醇類的一種。</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存方法</span><span class=\"text\">本產品是萃取昆布精華研製而成。開封後，為了避免受潮，請密封存放於乾燥通風處，以確保產品的最佳風味及品質。 </span></li>\r\n</ul>\r\n', '<ul class=\"info-box p-a0\">\r\n	<li class=\"d-flex\"><span class=\"title\"></span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">每一份量</span><span class=\"text\">1公克</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">本包裝含</span><span class=\"text\">500份</span></li>\r\n</ul>\r\n\r\n<ul class=\"product-info-box p-a0\">\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\"></span><span class=\"text-e\">每份</span><span class=\"text-h\">每100公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">熱量</span><span class=\"text-e\">2.2大卡</span><span class=\"text-h\">217大卡</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">蛋白質</span><span class=\"text-e\">0.2公克</span><span class=\"text-h\">15.3公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">脂肪</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title p-l10\">飽和脂肪</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title p-l10\">反式脂肪</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">碳水化合物</span><span class=\"text-e\">0.4公克</span><span class=\"text-h\">38.9公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">糖</span><span class=\"text-e\">0.2公克</span><span class=\"text-h\">21.3公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">鈉</span><span class=\"text-e\">156毫克</span><span class=\"text-h\">15600毫克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"text-h\"></span></li>\r\n</ul>\r\n', 0, 0, '', '2019-09-11 18:12:48', 1, '2019-10-21 18:31:09', 1),
(6, 1, '「ほんだし®/烹大師®」雞粉風味1公斤', '/uploads/product/1571650913.png', '', '嚴選鮮雞原料', '「ほんだし&reg;/烹大師&reg;」雞粉有日本調味料專家味之素集團研發製造，先進國際生產技術及多項層層嚴格品質控制。提供消費者營養、安心的美味。「ほんだし&reg;/烹大師&reg;」雞粉調味料選用高品的自然鮮雞原料，運用現代工藝萃取原雞精華，展現出鮮雞的自然、香醇、鮮甜。採用專業生產技術，高品質粉末顆粒易容解，可搭配於任何料理，自然提升菜餚的鮮甜美味。', '依照料理的不同需求，除了單一使用「ほんだし&reg;/烹大師&reg;」雞粉調味料可增加食材的鮮味外，搭配「ほんだし&reg;/烹大師&reg;」系列調味料:鰹魚風味、干貝風味或昆布風味一起使用，可以互相搭配，達到相乘效果的美味應用。', '<ul class=\"product-info-box p-a0\">\r\n	<li class=\"d-flex \"><span class=\"title\">原料</span><span class=\"text\">食鹽、調味劑(L-麩酸鈉、5&rsquo;&ndash;次黃嘌呤核苷磷酸二鈉、5 &rsquo;&ndash;鳥嘌呤核苷磷酸二鈉)、玉米澱粉、麥芽糊精、糖、雞肉、雞湯、雞油、醬油、水解大豆蛋白、香料、酵母抽出物、油菜籽油、白胡椒粉、酵素水解小麥蛋白、玉米油、棕櫚油</span></li>\r\n	<li class=\"d-flex \"><span class=\"title\">使用方法</span><span class=\"text\">15公克可調理成1000c.c的高湯</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">淨重</span><span class=\"text\">1公斤</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">原產地</span><span class=\"text\">台灣</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品包裝</span>1kgx6罐/箱</li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品條碼</span><span class=\"text\">4711173780120</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">外箱尺寸</span><span class=\"text\">320x218x213mm</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存期限</span><span class=\"text\">18個月(常溫未開封狀態下) </span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">注意事項</span><span class=\"text\">●開啟內蓋拉環時請垂直拉起，並請注意罐緣鋒利，避免割傷。<br />\r\n	●本產品含有大豆、小麥及其製品</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存方法</span><span class=\"text\">開封後，為了避免受潮，請密封存放於乾燥通風處，以確保產品的最佳風味及品質。 </span></li>\r\n</ul>\r\n', '<ul class=\"info-box p-a0\">\r\n	<li class=\"d-flex\"><span class=\"title\">每一份量</span><span class=\"text\">1公克</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">本包裝含</span><span class=\"text\">1000份</span></li>\r\n</ul>\r\n\r\n<ul class=\"product-info-box p-a0\">\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\"></span><span class=\"text-e\">每份</span><span class=\"text-h\">每100公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">熱量</span><span class=\"text-e\">2.1大卡</span><span class=\"text-h\">212大卡</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">蛋白質</span><span class=\"text-e\">0.1公克</span><span class=\"text-h\">13.8公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">脂肪</span><span class=\"text-e\">0.02公克</span><span class=\"text-h\">2.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title p-l10\">飽和脂肪</span><span class=\"text-e\">0.01公克</span><span class=\"text-h\">0.7公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title p-l10\">反式脂肪</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">碳水化合物</span><span class=\"text-e\">0.3公克</span><span class=\"text-h\">34.4公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">糖</span><span class=\"text-e\">0.04公克</span><span class=\"text-h\">3.5公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">鈉</span><span class=\"text-e\">181毫克</span><span class=\"text-h\">18100毫克</span></li>\r\n</ul>\r\n', 0, 0, '', '2019-09-11 18:13:38', 1, '2019-10-21 17:41:54', 1),
(7, 1, '「ほんだし®/烹大師®」雞粉風味1公斤', '/uploads/product/1568196818.png', '', '嚴選鮮雞原料', '「ほんだし&reg;/烹大師&reg;」雞粉有日本調味料專家味之素集團研發製造，先進國際生產技術及多項層層嚴格品質控制。提供消費者營養、安心的美味。「ほんだし&reg;/烹大師&reg;」雞粉調味料選用高品的自然鮮雞原料，運用現代工藝萃取原雞精華，展現出鮮雞的自然、香醇、鮮甜。採用專業生產技術，高品質粉末顆粒易容解，可搭配於任何料理，自然提升菜餚的鮮甜美味。', '依照料理的不同需求，除了單一使用「ほんだし&reg;/烹大師&reg;」雞粉調味料可增加食材的鮮味外，搭配「ほんだし&reg;/烹大師&reg;」系列調味料:鰹魚風味、干貝風味或昆布風味一起使用，可以互相搭配，達到相乘效果的美味應用。', '<ul class=\"p-a0\">\r\n	<li class=\"d-flex \"><span class=\"title\">原料</span><span class=\"text\">調味劑(L-麩酸鈉、5`-次黃嘌呤核苷磷酸二鈉、琥珀酸二鈉)、食鹽、乳糖、砂糖、乾燻鰹魚、鰹魚抽出物、酵母抽出物、D-木糖、麥芽糖、葡萄糖、糊精</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">淨重</span><span class=\"text\">1公斤</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">原產地</span><span class=\"text\">日本國神奈川縣</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品包裝</span><span class=\"text\">1kgx12袋/箱</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品條碼</span><span class=\"text\">4901001375431</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">外箱尺寸</span><span class=\"text\">522x262x209mm</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存期限</span><span class=\"text\">24個月(常溫未開封狀態下) </span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">過敏原</span><span class=\"text\">2本產品含有牛奶及其製品</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存方法</span><span class=\"text\">開封後，為了避免受潮，請密封存放於乾燥通風處，以確認產品的最佳風味及品質。 </span></li>\r\n</ul>\r\n', '<ul class=\"p-a0\">\r\n	<li class=\"d-flex\"><span class=\"title\">每一份量</span><span class=\"text\">1公克</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">本包裝含</span><span class=\"text\">1000份</span></li>\r\n</ul>\r\n\r\n<ul class=\"p-a0\">\r\n	<li class=\"d-flex justify-content-between\"><span class=\"text-e\">每份</span><span class=\"text-h\">每100公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">熱量</span><span class=\"text-e\">2.2大卡</span><span class=\"text-h\">225大卡</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">蛋白質</span><span class=\"text-e\">0.2公克</span><span class=\"text-h\">24.1公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">脂肪</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title p-l10\">飽和脂肪</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title p-l10\">反式脂肪</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">碳水化合物</span><span class=\"text-e\">0.3公克</span><span class=\"text-h\">31.6公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">糖</span><span class=\"text-e\">0.2公克</span><span class=\"text-h\">17.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">鈉</span><span class=\"text-e\">175毫克</span><span class=\"text-h\">17500毫克</span></li>\r\n</ul>\r\n', 0, 2, '', '2019-09-11 18:13:39', 1, '2019-09-11 18:13:44', 1),
(8, 1, '「ほんだし®/烹大師®」雞粉風味2公斤', '/uploads/product/1571651297.png', '', '嚴選鮮雞原料', '「ほんだし&reg;/烹大師&reg;」雞粉有日本調味料專家味之素集團研發製造，先進國際生產技術及多項層層嚴格品質控制。提供消費者營養、安心的美味。「ほんだし&reg;/烹大師&reg;」雞粉調味料選用高品的自然鮮雞原料，運用現代工藝萃取原雞精華，展現出鮮雞的自然、香醇、鮮甜。採用專業生產技術，高品質粉末顆粒易容解，可搭配於任何料理，自然提升菜餚的鮮甜美味。', '依照料理的不同需求，除了單一使用「ほんだし&reg;/烹大師&reg;」雞粉調味料可增加食材的鮮味外，搭配「ほんだし&reg;/烹大師&reg;」系列調味料:鰹魚風味、干貝風味或昆布風味一起使用，可以互相搭配，達到相乘效果的美味應用。', '<ul class=\"product-info-box p-a0\">\r\n	<li class=\"d-flex \"><span class=\"title\">原料</span><span class=\"text\">食鹽、調味劑(L-麩酸鈉、5&rsquo;&ndash;次黃嘌呤核苷磷酸二鈉、5 &rsquo;&ndash;鳥嘌呤核苷磷酸二鈉)、玉米澱粉、麥芽糊精、糖、雞肉、雞湯、雞油、醬油、水解大豆蛋白、香料、酵母抽出物、油菜籽油、白胡椒粉、酵素水解小麥蛋白、玉米油、棕櫚油</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">淨重</span><span class=\"text\">2公斤</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">原產地</span><span class=\"text\">台灣</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品包裝</span><span class=\"text\">2kgx6袋/箱</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品條碼</span><span class=\"text\">4711173780151</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">外箱尺寸</span><span class=\"text\">417x337x152mm</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存期限</span><span class=\"text\">15個月(常溫未開封狀態下) </span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">注意事項</span><span class=\"text\">本產品含有大豆、小麥及其製品</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存方法</span><span class=\"text\">開封後，為了避免受潮，請密封存放於乾燥通風處，以確保產品的最佳風味及品質。 </span></li>\r\n</ul>\r\n', '<ul class=\"info-box p-a0\">\r\n	<li class=\"d-flex\"><span class=\"title\">每一份量</span><span class=\"text\">1公克</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">本包裝含2</span><span class=\"text\">000份</span></li>\r\n</ul>\r\n\r\n<ul class=\"product-info-box p-a0\">\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\"></span><span class=\"text-e\">每份</span><span class=\"text-h\">每100公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">熱量</span><span class=\"text-e\">2.1大卡</span><span class=\"text-h\">212大卡</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">蛋白質</span><span class=\"text-e\">0.1公克</span><span class=\"text-h\">13.8公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">脂肪</span><span class=\"text-e\">0.02公克</span><span class=\"text-h\">2.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title p-l10\">飽和脂肪</span><span class=\"text-e\">0.01公克</span><span class=\"text-h\">0.7公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title p-l10\">反式脂肪</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">碳水化合物</span><span class=\"text-e\">0.3公克</span><span class=\"text-h\">34.4公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">糖</span><span class=\"text-e\">0.04公克</span><span class=\"text-h\">3.5公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">鈉</span><span class=\"text-e\">181毫克</span><span class=\"text-h\">18100毫克</span></li>\r\n</ul>\r\n', 0, 0, '', '2019-09-11 18:15:07', 1, '2019-10-21 17:48:18', 1),
(9, 4, '味の素® ', '/uploads/product/1568200630.jpg', '', '以天然原料甘蔗、樹薯等發酵而成', '使用味の素&reg;鮮味調味料烹調，能賦予料理鮮味(UMAMI)，同時引出食材原有風味，提升菜餚整體鮮美度。從醃製食材到煎、煮、炒、湯等各式料理都適用。', '＜使用方法＞(10人份)<br />\r\n●提味、提鮮：<br />\r\n水餃餡等餡料．．．．．．1小匙(約3-5g)<br />\r\n炒飯、炒麵、炒青菜．．．1-2小匙(約5-9g)<br />\r\n<br />\r\n●調和菜餚整體風味&nbsp;<br />\r\n火鍋、高湯．．．．．．．1-2小匙(約5-9g)<br />\r\n清湯、味增湯．．．．．．1小匙(約3-5g)', '<ul class=\"product-info-box p-a0\">\r\n	<li class=\"d-flex \"><span class=\"title\">產品登錄碼</span><span class=\"text\">TFAB1C007690007</span></li>\r\n	<li class=\"d-flex \"><span class=\"title\">原料</span><span class=\"text\">L-麩酸鈉</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">淨重</span><span class=\"text\">1公斤</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">使用範圍<br />\r\n	及用量標準</span><span class=\"text\">本品可於各類食品中視實際需要適量使用</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">使用限制</span><span class=\"text\">限於食品製造或加工必須時使用</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">原產地</span><span class=\"text\">泰國</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品包裝</span><span class=\"text\">1kgx12袋/箱</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品條碼</span><span class=\"text\">47111737800014</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">外箱尺寸</span><span class=\"text\">398x318x145mm</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存期限</span><span class=\"text\">5年(常溫未開封狀態下) </span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存方法</span><span class=\"text\">開封後，為了避免受潮，請密封存放於乾燥通風處，以確保產品的最佳風味及品質。 </span></li>\r\n</ul>\r\n', '<ul class=\"info-box p-a0\">\r\n	<li class=\"d-flex\"><span class=\"title\"></span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">每一份量</span><span class=\"text\">1公克</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">本包裝含</span><span class=\"text\">1000份</span></li>\r\n</ul>\r\n\r\n<ul class=\"product-info-box p-a0\">\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\"></span><span class=\"text-e\">每份</span><span class=\"text-h\">每100公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">熱量</span><span class=\"text-e\">2.9大卡</span><span class=\"text-h\"><span class=\"text-e\">293.2<span style=\"display: inline !important;\">大卡</span></span></span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">蛋白質</span><span class=\"text-e\">0.4公克</span><span class=\"text-h\"><span class=\"text-e\">44.1<span style=\"display: inline !important;\">公克</span></span></span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">脂肪</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title p-l10\">飽和脂肪</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title p-l10\">反式脂肪</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">碳水化合物</span><span class=\"text-e\">0.3公克</span><span class=\"text-h\">29.2公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">糖</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">鈉</span><span class=\"text-e\">117毫克</span><span class=\"text-h\">11700毫克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"text-h\"></span></li>\r\n</ul>\r\n', 0, 0, '', '2019-09-11 19:17:11', 1, '2019-10-21 17:10:57', 4),
(10, 4, '味の素® 高級味精(金罐)	', '/uploads/product/1568200662.jpg', '', '日本原裝進口', '味の素&reg;高級味精是由天然甘蔗、樹薯等發酵而成的鮮味調味料，成分添加2.5%核甘酸，增加鮮味的相乘效果，讓您的使用量只需原本味精的1/3~1/5，即可達到同樣料理美味的效果。適當添加於佳餚中，可有效引出食材原有的風味，讓料理更加鮮美。', '鮮味(UMAMI)物質，例如:麩胺酸鈉，如果與核甘酸組合，會讓原有的鮮味(UMAMI)飛躍式的提升，這種「鮮味(UMAMI)相乘效果」可普遍應用在各式料理中，增添佳餚風味。', '<ul class=\"product-info-box p-a0\">\r\n	<li class=\"d-flex \"><span class=\"title\">產品登錄碼</span><span class=\"text\">TFAB200000046579</span></li>\r\n	<li class=\"d-flex \"><span class=\"title\">原料</span><span class=\"text\">L-麩酸鈉、5&#39;-次黃嘌呤核苷磷酸二鈉、5&#39;-鳥嘌呤核苷磷酸二鈉</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">淨重</span><span class=\"text\">1公斤(990~1030公克)</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">使用範圍<br />\r\n	及用量標準</span><span class=\"text\">本品可於各類食品中視實際需要適量使用</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">使用限制</span><span class=\"text\">限於食品製造或加工必須時使用</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">原產地</span><span class=\"text\">日本國佐賀縣</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品包裝</span><span class=\"text\">1kgx12罐/箱</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品條碼</span><span class=\"text\">4901001000081</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">外箱尺寸</span><span class=\"text\">547x259x187mm</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存期限</span><span class=\"text\">5年(常溫未開封狀態下)</span><span class=\"text\"></span><br />\r\n	<span class=\"title\"></span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存方法</span><span class=\"text\">開封後，為了避免受潮，請密封存放於乾燥通風處，以確保產品的最佳風味及品質。 </span></li>\r\n</ul>\r\n', '<ul class=\"info-box p-a0\">\r\n	<li class=\"d-flex\"><span class=\"title\">每一份量</span><span class=\"text\">1公克</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">本包裝含</span><span class=\"text\">1000份</span></li>\r\n</ul>\r\n\r\n<ul class=\"product-info-box p-a0\">\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\"></span><span class=\"text-e\">每份</span><span class=\"text-h\">每100公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">熱量</span><span class=\"text-e\">2.9大卡</span><span class=\"text-h\">291.6大卡</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">蛋白質</span><span class=\"text-e\">0.5公克</span><span class=\"text-h\">46.8公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">脂肪</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title p-l10\">飽和脂肪</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title p-l10\">反式脂肪</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">碳水化合物</span><span class=\"text-e\">0.3公克</span><span class=\"text-h\">26.1公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">糖</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">鈉</span><span class=\"text-e\">116毫克</span><span class=\"text-h\">11600毫克</span></li>\r\n</ul>\r\n', 0, 0, '', '2019-09-11 19:17:43', 1, '2019-10-21 17:13:37', 4),
(11, 3, 'AJI-NO-MOTO® PLUS®  高鮮味精', '/uploads/product/1568200974.png', '', '用量只要一般高鮮1/2小匙', 'AJI-NO-MOTO&reg; PLUS&reg; 高鲜味精採用味之素集團獨家造粒技術將鮮味成分完整平均封存於粒子中，內含高I+G鮮味成分，只需傳統味精1/4用量，即能提引出食材原有風味，並讓料理呈現更具豐富口感的自然鮮美。從熬煮湯品到大火快炒類、蒸煮類等料理皆可使用。', '＜使用方法＞<br />\r\n●高湯(1公升)．．．．．．1/4小匙<br />\r\n●湯、羹(1公升)．．．．．1/2小匙<br />\r\n●炒麵(10人份)．．．．．&nbsp; 1/4小匙', '<ul class=\"product-info-box p-a0\">\r\n	<li class=\"d-flex \"><span class=\"title\">產品登錄碼</span><span class=\"text\">TFAB20000002458</span></li>\r\n	<li class=\"d-flex \"><span class=\"title\">原料</span><span class=\"text\">L-麩酸鈉、5&#39;-次黃嘌呤核苷磷酸二鈉、5&#39;-鳥嘌呤核苷磷酸二鈉</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">淨重</span><span class=\"text\">1公斤</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">使用範圍<br />\r\n	及用量標準</span><span class=\"text\">本品可於各類食品中視實際需要適量使用</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">使用限制</span><span class=\"text\">限於食品製造或加工必須時使用</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">原產地</span><span class=\"text\">越南</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品包裝</span><span class=\"text\">1kgx12盒/箱</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品條碼</span><span class=\"text\">4711173780601</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">外箱尺寸</span><span class=\"text\">405x313x190mm</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存期限</span><span class=\"text\">5年(常溫未開封狀態下) </span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存方法</span><span class=\"text\">開封後，為了避免受潮，請密封存放於乾燥通風處，以確保產品的最佳風味及品質。 </span></li>\r\n</ul>\r\n', '<ul class=\"info-box p-a0\">\r\n	<li class=\"d-flex\"><span class=\"title\">每一份量</span><span class=\"text\">1公克</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">本包裝含</span><span class=\"text\">1000份</span></li>\r\n</ul>\r\n\r\n<ul class=\"product-info-box p-a0\">\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\"></span><span class=\"text-e\">每份</span><span class=\"text-h\">每100公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">熱量</span><span class=\"text-e\">2.9大卡</span><span class=\"text-h\">290大卡</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">蛋白質</span><span class=\"text-e\">0.5公克</span><span class=\"text-h\">47.3公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">脂肪</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title p-l10\">飽和脂肪</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title p-l10\">反式脂肪</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">碳水化合物</span><span class=\"text-e\">0.3公克</span><span class=\"text-h\">25.1公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">糖</span><span class=\"text-e\">0.0公克</span><span class=\"text-h\">0.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">鈉</span><span class=\"text-e\">122毫克</span><span class=\"text-h\">12200毫克</span></li>\r\n</ul>\r\n', 0, 0, '', '2019-09-11 19:21:04', 1, '2019-10-21 17:17:47', 4),
(12, 5, '味の素®S高鮮味精', '/uploads/product/1569479415.jpg', '', '日本老店、拉麵店 長久指名使用', '＜商品特色＞<br />\r\n●同時含有乾燻鰹魚及香菇中的鮮味成份及昆布中的鮮味成份，少量使用就可輕鬆讓料理更美味的一款鮮味調味料。<br />\r\n●可提引出食材原本的風味，完美調和料理的整體均衡感。<br />\r\n●耐熱性高，在料理的前、中、後使用效果都一樣。<br />\r\n●使用在減鹽料理時可以補上不足的風味，讓料理更可口', '＜使用方法＞<br />\r\n●前置處理<br />\r\n水餃餡、漢堡肉(10人份)．．． 3~5g<br />\r\n燙青菜．．．．．．．．．．．1L熱水+3~5g<br />\r\n海鮮類．．．．．．．．．．．適量<br />\r\n<br />\r\n●烹調<br />\r\n炒飯、炒青菜(10人份)．．． ．5~9g<br />\r\n拉麵、湯品．．．．．．．．．1L水+10g<br />\r\n沙拉醬．．．．．．．．．．．500ml+2g', '<ul class=\"product-info-box p-a0\">\r\n	<li class=\"d-flex \"><span class=\"title\">產品登錄碼</span><span class=\"text\">TFAB20000057672</span><span class=\"text\"></span></li>\r\n	<li class=\"d-flex \"><span class=\"title\">原料</span><span class=\"text\">L-麩酸鈉、5&#39;-次黃嘌呤核苷磷酸二鈉、5&#39;-鳥嘌呤核苷磷酸二鈉</span><span class=\"text\"></span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">淨重</span><span class=\"text\">1公斤(900公克~1030公克)/袋</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">使用範圍<br />\r\n	及用量標準</span><span class=\"text\">本品可於各類食品中視實際需要適量使用</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">使用限制</span><span class=\"text\"></span>限於食品製造或加工必須時使用</li>\r\n	<li class=\"d-flex\"><span class=\"title\">原產地&nbsp;</span><span class=\"text\">日本國佐賀縣</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品包裝</span><span class=\"text\">1kgx12袋/箱</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品條碼</span><span class=\"text\">4901001194186</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">外箱尺寸</span><span class=\"text\">456x296x167mm</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存期限</span><span class=\"text\">5年(常溫未開封狀態下) </span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存方法</span><span class=\"text\">開封後，請密封並放置於陰涼乾燥處</span><span class=\"text\"> </span></li>\r\n</ul>\r\n', '<ul class=\"info-box p-a0\">\r\n	<li class=\"d-flex\">&nbsp;</li>\r\n</ul>\r\n', 0, 0, '', '2019-09-26 14:30:16', 4, '2019-10-21 17:21:51', 4),
(13, 6, '沙拉醬', '/uploads/product/1571652215.png', '', '日本味之素集團暢銷50年商品', '＜商品特色＞<br />\r\n●酸味及鹹味適中， 口味柔和清爽，卻又不失濃郁感。<br />\r\n●沒有特別突出的味道，適合作為突顯原食材味道的料理的基底。<br />\r\n●擁有耐熱性，所以非常適用於各式沙拉及燒烤料理。', '＜使用方法＞<br />\r\n沾醬醬底、燒烤料理、沙拉、調理麵包、小菜等。', '<ul class=\"product-info-box p-a0\">\r\n	<li class=\"d-flex \"><span class=\"title\">原料</span><span class=\"text\">食用植物油(菜籽油、大豆油、玉米油、棕櫚油)、葡萄糖漿、水、釀造食醋、加鹽蛋液(雞蛋、食鹽)、食鹽、蛋黃粉(蛋黃、食鹽、葡萄糖、二氧化矽、磷脂酶)、Ｌ-麩胺鈉、濃縮檸檬汁、芥子抽出物</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">淨重</span><span class=\"text\">1公斤</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">原產地</span><span class=\"text\">日本國三重縣</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品包裝</span><span class=\"text\">1kgx10罐/箱</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">產品條碼</span><span class=\"text\">4901001103782</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">外箱尺寸</span><span class=\"text\">428 x 214 x252 mm</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存期限</span><span class=\"text\">10個月(常溫未開封狀態下) </span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">保存條件</span><span class=\"text\">請放置於陰涼、無陽光直曬處，勿保存於0℃以下環境。開封後，請蓋好瓶蓋冷藏保存，並儘早食用完畢。</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">過敏原資訊</span><span class=\"text\">本產品含有過敏原蛋及其製品</span></li>\r\n</ul>\r\n', '<ul class=\"info-box p-a0\">\r\n	<li class=\"d-flex\"><span class=\"title\">每一份量</span><span class=\"text\">1公克</span></li>\r\n	<li class=\"d-flex\"><span class=\"title\">本包裝含</span><span class=\"text\">100份</span></li>\r\n</ul>\r\n\r\n<ul class=\"product-info-box p-a0\">\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\"></span><span class=\"text-e\">每份</span><span class=\"text-h\">每100公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">熱量</span><span class=\"text-e\">69.9大卡</span><span class=\"text-h\">699.2大卡</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">蛋白質</span><span class=\"text-e\">0.1公克</span><span class=\"text-h\">0.8公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">脂肪</span><span class=\"text-e\">7.5公克</span><span class=\"text-h\">74.8公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title p-l10\">飽和脂肪</span><span class=\"text-e\">1.0公克</span><span class=\"text-h\">10.0公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title p-l10\">反式脂肪</span><span class=\"text-e\">0.1公克</span><span class=\"text-h\">0.9公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">碳水化合物</span><span class=\"text-e\">0.6公克</span><span class=\"text-h\">5.7公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">糖</span><span class=\"text-e\">0.2公克</span><span class=\"text-h\">2.1公克</span></li>\r\n	<li class=\"d-flex justify-content-between\"><span class=\"title\">鈉</span><span class=\"text-e\">61毫克</span><span class=\"text-h\">612毫克</span></li>\r\n</ul>\r\n', 0, 0, '', '2019-09-26 15:41:15', 4, '2019-10-21 18:07:49', 4);

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
(86, 17, '刪除會員', '3A5DF0BA-5977-2D2F-5EAF-68B7543B98AF', 0, '', '2019-08-20 16:55:24', 1, '2019-08-20 16:55:24', 1),
(87, 16, '增加招客秘技瀏覽人數', 'A53CAF90-B5F8-CA2A-CE48-48359C948E88', 0, '', '2019-09-02 09:46:58', 1, '2019-09-02 09:46:58', 1),
(88, 14, '增加專業食譜瀏覽人數', '88475F0A-9820-4349-3804-3C287502E10E', 0, '', '2019-09-02 10:03:12', 1, '2019-09-02 10:03:12', 1);

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
  `c_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立時間',
  `c_user_id` int(11) NOT NULL COMMENT '建立使者編號',
  `u_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改時間',
  `u_user_id` int(11) NOT NULL COMMENT '修改使用者編號'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 資料表的匯出資料 `recipepro`
--

INSERT INTO `recipepro` (`id`, `name`, `pic_url`, `pic_alt`, `feature`, `tags`, `price`, `type`, `style`, `product_ids`, `material_weight`, `nutrition`, `member_only`, `visitor`, `list_order`, `status`, `remark`, `c_time`, `c_user_id`, `u_time`, `u_user_id`) VALUES
(1, '什錦湯麵', '/uploads/repicepro/1568794480.jpg', '', '', '雞肉,葉菜類', '近期公開', '中式', '麵食', '2', '2人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>427</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>24.7</td>\r\n			<th>脂肪(g)</th>\r\n			<td>11.6</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>52.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>83</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.6</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>60</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.1</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.17</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.21</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>24</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>52</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>3.3</td>\r\n			<th>鹽分(g)</th>\r\n			<td>4.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>45</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 46, 0, 0, '', '2019-09-11 20:19:04', 1, '2019-10-29 14:10:36', 2),
(2, '昆布燉白蘿蔔 (素食料理)', '/uploads/repicepro/1568794808.jpg', '', '', '根莖類', '近期公開', '素食', '主菜', '5', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>171</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>9.8</td>\r\n			<th>脂肪(g)</th>\r\n			<td>0.6</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>35.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>320</td>\r\n			<th>鐵(mg)</th>\r\n			<td>3.8</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>1</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>16</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.23</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>30</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>55</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>0</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>14.2</td>\r\n			<th>鹽分(g)</th>\r\n			<td>15</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>470</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 47, 0, 0, '', '2019-09-18 16:19:44', 4, '2019-10-27 21:55:28', 2),
(3, '炸芋頭茄子 (素食料理)', '/uploads/repicepro/1568795575.jpg', '', '', '瓜果類', '近期公開', '素食', '主菜', '5', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>950</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>13.5</td>\r\n			<th>脂肪(g)</th>\r\n			<td>55.9</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>83.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>180</td>\r\n			<th>鐵(mg)</th>\r\n			<td>3.7</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>74</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>10</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.51</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.34</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.87</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>46</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>3</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>19.6</td>\r\n			<th>鹽分(g)</th>\r\n			<td>8.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>360</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 14, 0, 0, '', '2019-09-18 16:32:55', 4, '2019-10-24 17:38:47', 4),
(4, '油菜杏鮑菇清湯(素食料理)', '/uploads/repicepro/1568795803.jpg', '', '', '葉菜類,菇蕈類', '近期公開', '素食', '湯品', '5', '4', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>47</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>52</td>\r\n			<th>脂肪(g)</th>\r\n			<td>0.5</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>10.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>上稿</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.8</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>8</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.19</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.36</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.28</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>65</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>0</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>5.5</td>\r\n			<th>鹽分(g)</th>\r\n			<td>5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>150</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 4, 0, 0, '', '2019-09-18 16:36:43', 4, '2019-10-25 14:56:15', 2),
(5, '綠蘆筍蛤仔湯', '/uploads/repicepro/1571910636.jpg', '', '', '海鮮類,根莖類', '近期公開', '日式', '湯品', '5', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>61</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>8.1</td>\r\n			<th>脂肪(g)</th>\r\n			<td>0.7</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>5.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>140</td>\r\n			<th>鐵(mg)</th>\r\n			<td>2.4</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>22</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.14</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.23</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.14</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>28.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>8</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>25</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>0.9</td>\r\n			<th>鹽分(g)</th>\r\n			<td>10</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>46</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 14, 0, 0, '', '2019-09-27 13:37:44', 4, '2019-10-25 09:43:16', 2),
(6, '什錦鱈魚火鍋', '/uploads/repicepro/1571911080.jpg', '', '', '海鮮類', '近期公開', '中式', '火鍋', '5', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>590</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>71.1</td>\r\n			<th>脂肪(g)</th>\r\n			<td>17.7</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>41</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>570</td>\r\n			<th>鐵(mg)</th>\r\n			<td>8.8</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>445</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>4.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.76</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.92</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>1.04</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>5.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>91</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>150</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>15.5</td>\r\n			<th>鹽分(g)</th>\r\n			<td>15.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>472</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 7, 0, 0, '', '2019-10-15 16:37:08', 4, '2019-10-24 18:06:15', 2),
(7, '馬鈴薯炒猪五花', '/uploads/repicepro/1571911552.jpg', '', '', '豬肉,根莖類', '近期公開', '日式', '主菜', '5', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>上稿</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>上稿</td>\r\n			<th>脂肪(g)</th>\r\n			<td>上稿</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>上稿</td>\r\n			<th>鐵(mg)</th>\r\n			<td>上稿</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>上稿</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>上稿</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>上稿</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>上稿</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>上稿</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>上稿</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>上稿</td>\r\n			<th>鹽分(g)</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>上稿</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 5, 0, 0, '', '2019-10-15 17:42:59', 4, '2019-10-28 17:16:14', 2),
(8, 'TEST', '/uploads/repicepro/1571307717.jpg', '', 'TESTTEST', '牛肉', '100', '日式', '前菜', '2', '', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n		<tr>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n		<tr>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>碳水化合物</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n		<tr>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n		<tr>\r\n			<th>碳水化合物</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n			<th>上稿</th>\r\n			<td>上稿</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 3, 0, 2, '', '2019-10-17 18:21:57', 1, '2019-10-17 18:56:04', 1),
(9, '乾煸子排', '/uploads/repicepro/1571367630.jpg', '', '', '豬肉', '1111', '中式', '主菜', '1,6', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>427</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>24.7</td>\r\n			<th>脂肪(g)</th>\r\n			<td>11.6</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>52.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>83</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.6</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>60</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.1</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.17</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.21</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>24</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>52</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>3.3</td>\r\n			<th>鹽分(g)</th>\r\n			<td>4.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>45</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 22, 0, 0, '', '2019-10-18 11:00:30', 4, '2019-10-28 17:00:11', 2),
(10, '香辣X0醬', '/uploads/repicepro/1571903849.jpg', '匯集海味的鮮香和適度的辣勁，入口即是頂級的美味', '匯集海味的鮮香和適度的辣勁，入口即是頂級的美味', '其他', '123', '中式', '其他', '1,2', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>2600</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>97.1</td>\r\n			<th>脂肪(g)</th>\r\n			<td>196.7</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>101.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>2100</td>\r\n			<th>鐵(mg)</th>\r\n			<td>9</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>438</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>16.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.57</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.66</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>1.07</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>11.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>82</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>350</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>7</td>\r\n			<th>鹽分(g)</th>\r\n			<td>82</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>143</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 1, 0, 0, '', '2019-10-24 15:57:29', 4, '2019-10-24 15:57:38', 2),
(11, '榨菜炒肚絲', '/uploads/repicepro/1571904376.jpg', '', '榨菜的爽脆搭配上肚絲的特有口感，讓人一吃上癮', '葉菜類', '123', '中式', '主菜', '1,5', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>164</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>19.7</td>\r\n			<th>脂肪(g)</th>\r\n			<td>6.3</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>6.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>79</td>\r\n			<th>鐵(mg)</th>\r\n			<td>3.1</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>62</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.14</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.31</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.16</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>16</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>250</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>3.3</td>\r\n			<th>鹽分(g)</th>\r\n			<td>6.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>92</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 1, 0, 0, '', '2019-10-24 16:06:16', 4, '2019-10-24 16:06:22', 2),
(12, '肉片炒五色', '/uploads/repicepro/1571904803.jpg', '', '以鳳梨入菜，讓肉片更加柔嫩與可口', '豬肉,根莖類,菇蕈類', '123', '中式', '主菜', '5', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>192</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>10</td>\r\n			<th>脂肪(g)</th>\r\n			<td>9.4</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>16.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>9</td>\r\n			<th>鐵(mg)</th>\r\n			<td>0.4</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>15</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.33</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.1</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.22</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>7</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>24</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>25</td>\r\n			<th>鹽分(g)</th>\r\n			<td>1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>68</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 3, 0, 0, '', '2019-10-24 16:13:23', 4, '2019-10-25 15:42:31', 2),
(13, '南北杏 萬壽棗燉雞', '/uploads/repicepro/1571905123.jpg', '', '雞腿肉與多種乾貨的文火慢燉，湯頭清香甘甜', '雞肉', '123', '中式', '主菜', '5', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>502</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>27</td>\r\n			<th>脂肪(g)</th>\r\n			<td>33.5</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>18.3</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>38</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.7</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>109</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.13</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.4</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>27</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>52</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>130</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>3.3</td>\r\n			<th>鹽分(g)</th>\r\n			<td>2.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>0</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 1, 0, 0, '', '2019-10-24 16:18:43', 4, '2019-10-24 16:19:00', 2),
(14, '素燴獅子頭(素食料理)', '/uploads/repicepro/1571905874.jpg', '', '新鮮香菇混合著豆腐的醇香，讓人不禁想大快朵頤', '葉菜類,菇蕈類,豆類', '123', '素食', '主菜', '5', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>218</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>12.1</td>\r\n			<th>脂肪(g)</th>\r\n			<td>7.8</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>23.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>83</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.8</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>92</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.6</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.1</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.16</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.15</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>18</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>0</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>3.9</td>\r\n			<th>鹽分(g)</th>\r\n			<td>2.2</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>90</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 2, 0, 0, '', '2019-10-24 16:30:53', 4, '2019-10-25 09:19:31', 2),
(15, '蘆筍炒腐皮(素食料理)', '/uploads/repicepro/1571906073.jpg', '', '鮮綠的蘆筍搭配腐皮，營養與口感兼具', '根莖類,瓜果類', '123', '素食', '主菜', '5', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>147</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>13.6</td>\r\n			<th>脂肪(g)</th>\r\n			<td>7.7</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>7.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>61</td>\r\n			<th>鐵(mg)</th>\r\n			<td>2.4</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>100</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1.7</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.21</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.26</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.22</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>12</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>0</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>3.1</td>\r\n			<th>鹽分(g)</th>\r\n			<td>0.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>123</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 2, 0, 0, '', '2019-10-24 16:34:33', 4, '2019-10-28 14:54:24', 2),
(16, '火腿冬瓜盅', '/uploads/repicepro/1571906552.jpg', '', '鮮雞肉搭配冬瓜烹燉，是利水清熱的最佳湯品', '雞肉,豬肉,根莖類', '123', '中式', '湯品', '2', '4人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>277</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>25.6</td>\r\n			<th>脂肪(g)</th>\r\n			<td>15.9</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>6.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>27</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.1</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>40</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>0.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.46</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.28</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.39</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.8</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>57</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>110</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>1.5</td>\r\n			<th>鹽分(g)</th>\r\n			<td>3.1</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>95</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 1, 0, 0, '', '2019-10-24 16:42:32', 4, '2019-10-24 16:42:37', 2),
(17, '雙囍繡球', '/uploads/repicepro/1571907014.jpg', '', '金黃的地瓜與淡紫的芋頭，是味覺與視覺的雙重享受', '根莖類', '近期公開', '中式', '點心', '2', '6人份', '<div class=\"table-wrap p-tb20\">\r\n<table class=\"recipe-nutrition-box\">\r\n	<tbody>\r\n		<tr>\r\n			<th>熱量(Kcal)</th>\r\n			<td>261</td>\r\n			<th>蛋白質(g)</th>\r\n			<td>15</td>\r\n			<th>脂肪(g)</th>\r\n			<td>13</td>\r\n			<th>碳水化合物(g)</th>\r\n			<td>19.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>鈣(mg)</th>\r\n			<td>26</td>\r\n			<th>鐵(mg)</th>\r\n			<td>1.3</td>\r\n			<th>維生素A(&mu;g)</th>\r\n			<td>99</td>\r\n			<th>維生素E(mg)</th>\r\n			<td>1.4</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素B1(mg)</th>\r\n			<td>0.54</td>\r\n			<th>維生素B2(mg)</th>\r\n			<td>0.21</td>\r\n			<th>維生素B6(mg)</th>\r\n			<td>0.42</td>\r\n			<th>維生素B12(mg)</th>\r\n			<td>0.5</td>\r\n		</tr>\r\n		<tr>\r\n			<th>維生素C(mg)</th>\r\n			<td>10</td>\r\n			<th>膽固醇(mg)</th>\r\n			<td>79</td>\r\n			<th>膳食纖維(g)</th>\r\n			<td>1.9</td>\r\n			<th>鹽分(g)</th>\r\n			<td>0.9</td>\r\n		</tr>\r\n		<tr>\r\n			<th>蔬菜攝取量(g)</th>\r\n			<td>17</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n			<th>&nbsp;</th>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n', 0, 4, 0, 0, '', '2019-10-24 16:50:14', 4, '2019-10-25 15:48:30', 2);

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
-- 資料表的匯出資料 `recipepro_detail`
--

INSERT INTO `recipepro_detail` (`recipepro_id`, `class`, `names`, `contents`, `links`, `blanks`, `list_order`) VALUES
(8, 1, 'TEST', '1小匙', '', '', 0),
(8, 2, '特殊調味料：', '', '', '0', 0),
(8, 2, '鹽,糖', '1小匙,1小匙', ',', '0,0', 1),
(8, 2, 'salt,oil', '1大匙,1小匙', ',', '0,0', 2),
(8, 3, 'TEST', '', '', '', 0),
(9, 1, '子排', '4支', '', '', 0),
(9, 1, '蔥', '1枝', '', '', 1),
(9, 2, '醃料：,「ほんだし ®/烹大師®」雞粉', ',1大匙', ',', '0,0', 1),
(9, 2, '炒料：,「ほんだし ®/烹大師®」鰹魚風味,胡椒粉,鹽', ',1/2大匙,少許,少許', ',,,', '0,0,0,0', 2),
(9, 3, '子排連同水、「ほんだし ®/烹大師®」雞粉、蔥、薑醃1天，再放入電鍋中蒸50分鐘。', '', '', '', 0),
(9, 3, '開洋、冬菜洗淨剁碎備用。', '', '', '', 1),
(9, 3, '蒸好子排沾酥炸粉炸至酥香撈出油倒掉，加入肉末、開洋末、冬菜末、蔥花、蒜末、     薑末、辣椒末、蒜頭酥爆香，再放入子排、「ほんだし ®/烹大師®」鰹魚風味、鹽、胡椒粉、香油、梅林醬等拌勻即可。', '', '', '', 2),
(9, 3, '※美味方程式：先醃再炒，香氣十足。', '', '', '', 3),
(10, 1, '朝天椒', '300g', '', '', 0),
(10, 1, '蒜頭酥', '150g', '', '', 1),
(10, 1, '紅蔥頭酥', '150g', '', '', 2),
(10, 1, '蝦米', '100g', '', '', 3),
(10, 1, '珠貝', '300g', '', '', 4),
(10, 1, '馬友鹹魚', '150g', '', '', 5),
(10, 1, '扁魚乾', '50g', '', '', 6),
(10, 1, '金華火腿', '150g', '', '', 7),
(10, 2, '「ほんだし ®/烹大師®」鰹魚風味 ', '1大匙', '', '0', 0),
(10, 2, '「ほんだし ®/烹大師®」干貝風味', '1大匙', '', '0', 1),
(10, 2, '花生油', '500c.c.', '', '0', 2),
(10, 2, '香油', '150c.c.', '', '0', 3),
(10, 2, '糖', '150g', '', '0', 4),
(10, 2, '醬油', '3大匙', '', '0', 5),
(10, 3, '珠貝洗淨，用水泡軟，其它材料全部切細碎。', '', '', '', 0),
(10, 3, '鍋内倒入花生油500c.c.，香油150c.c.小火慢慢加熱至100℃ ，再依序放入朝天椒、蝦米、扁魚乾、馬友鹹魚、金華火腿、蒜頭酥、 紅蔥頭酥，慢火——炒香。', '', '', '', 1),
(10, 3, '再加入糖150g、醬油3大匙、「ほんだし ®/烹大師®」 鰹魚風味調味料1大匙、「ほんだし ®/烹大師®」干貝風味調味料1大匙炒均勻融合即可。', '', '', '', 2),
(11, 1, '豬肚', '400g', '', '', 0),
(11, 1, '榨菜', '150g', '', '', 1),
(11, 1, '芹菜', '100g', '', '', 2),
(11, 1, '蔥', '2根', '', '', 3),
(11, 1, '薑', '30g', '', '', 4),
(11, 1, '辣椒', '1根', '', '', 5),
(11, 2, '酒', '1大匙', '', '0', 0),
(11, 2, '「ほんだし ®/烹大師®」鰹魚風味,「ほんだし ®/烹大師®」昆布風味,醋,香油', '1/2大匙,1/2大匙,1/2大匙,1小匙', ',,,', '0,0,0,0', 1),
(11, 3, '豬肚煮熟後切絲，榨菜洗淨切絲，芹菜切段，蔥切段，薑切絲，辣椒切絲。', '', '', '', 0),
(11, 3, '鍋内倒入1大匙油，先爆香蔥、薑、辣椒，再放入豬肚及榨菜、芹菜拌炒，熗入酒後，再加入調味料 Ⓐ拌炒均勻即可。', '', '', '', 1),
(12, 1, '里肌肉', '160g', '', '', 0),
(12, 1, '荸薺', '80g', '', '', 1),
(12, 1, '新鮮金針', '80g', '', '', 2),
(12, 1, '木耳', '120g', '', '', 3),
(12, 1, '蕃茄', '120g', '', '', 4),
(12, 1, '罐頭鳳梨', '80g', '', '', 5),
(12, 1, '嫩薑', '20g', '', '', 6),
(12, 2, '「ほんだし ®/烹大師®」昆布風味 ', '1大匙', '', '0', 0),
(12, 2, '米酒', '1大匙', '', '0', 1),
(12, 2, '香油', '1/2大匙', '', '0', 2),
(12, 3, '里肌肉切片，荸薺切片，木耳切片，蕃茄切片，嫩薑切末。', '', '', '', 0),
(12, 3, '鍋内倒入1大匙油、先爆香薑末及里肌肉，熗入米酒後，加入少許 水及荸薺、新鮮金針、木耳、蕃茄、鳳梨片拌炒至湯汁快收乾時，放入「ほんだし ®/烹大師®」昆布風味 1大匙及香油炒勻即可。', '', '', '', 1),
(13, 1, '仿土雞腿', '2隻', '', '', 0),
(13, 1, '木瓜', '400g', '', '', 1),
(13, 1, '紅棗', '40g', '', '', 2),
(13, 1, '南、北杏', '各20g', '', '', 3),
(13, 2, '「ほんだし ®/烹大師®」昆布風味', '2大匙', '', '0', 0),
(13, 2, '米酒', '50c.c.', '', '0', 1),
(13, 3, ' 仿土雞腿剁塊，先以沸水汆燙去血水，再以清水洗淨。', '', '', '', 0),
(13, 3, '木瓜去皮籽後切塊，紅棗及南北杏洗淨。', '', '', '', 1),
(13, 3, '將仿土雞腿、木瓜、紅棗、南北杏放入燉盅内，加入1000c.c.的水及米酒，蓋上保鮮膜，隔水燉煮1小時，再放入「ほんだし ®/烹大師®」昆布風味2大匙調味即可。', '', '', '', 2),
(15, 1, '蘆筍', '300g ', '', '', 0),
(15, 1, '乾腐皮', '80g ', '', '', 1),
(15, 1, '紅蘿蔔', '50g', '', '', 2),
(15, 1, '蘑菇', '150g', '', '', 3),
(15, 1, '薑', '30g', '', '', 4),
(15, 2, '「ほんだし ®/烹大師®」昆布風味', '1大匙', '', '0', 0),
(15, 2, '香油', '1小匙', '', '0', 1),
(15, 3, '蘆筍刨除粗皮切斜段、乾腐皮略為泡軟，紅蘿蔔切片狀，蘑菇對切半，薑切片。', '', '', '', 0),
(15, 3, '鍋内倒入1大匙油，先爆香薑片，再放入蘆筍、紅蘿蔔、腐皮、蘑菇拌炒勻後，加入150c.c.的水煮至湯汁微乾前，加入「ほんだし ®/烹大師®」昆布風味1大匙拌炒勻，淋入香油即可。', '', '', '', 1),
(16, 1, '雞腿肉', '400g', '', '', 0),
(16, 1, '香菇', '20g', '', '', 1),
(16, 1, '火腿肉', '150g', '', '', 2),
(16, 1, '冬瓜', '500g', '', '', 3),
(16, 1, '薑', '30g', '', '', 4),
(16, 1, '香菜', '少許', '', '', 5),
(16, 2, '「ほんだし ®/烹大師®」干貝風味,胡椒粉', '2大匙,1/2小匙', ',', '0,0', 0),
(16, 3, '雞腿肉、火腿肉洗淨切丁塊，香菇泡軟後對切，冬瓜切塊，薑切片。', '', '', '', 0),
(16, 3, '雞腿肉與火腿肉先放入沸水中汆燙過，再以清水洗淨。', '', '', '', 1),
(16, 3, '將雞腿肉、香菇、火腿肉、冬瓜、薑片放入燉盅内，加入1500c.c.的水，大火蒸1小時，再放入調味料Ⓐ及香菜拌勻即可。', '', '', '', 2),
(1, 1, '油麵', '300g', '', '', 0),
(1, 1, '雞腿肉', '100g', '', '', 1),
(1, 1, '魚漿製品', '100g', '', '', 2),
(1, 1, '小白菜', '50g', '', '', 3),
(1, 1, '新鮮香菇', '40g', '', '', 4),
(1, 2, '「ほんだし ®/烹大師®」干貝風味調味料', '1又1/2大匙', '', '1', 1),
(1, 2, '胡椒粉', '1小匙', '', '0', 2),
(1, 2, '香油', '1/2大匙', '', '0', 3),
(1, 3, '先將雞腿肉剁成小塊狀，小白菜洗淨切段，新鮮香菇表面略刻＊字痕。', '', '', '', 0),
(1, 3, '將800c.c.的水煮開後，放入做法①的雞腿肉煮3分鐘後，再放入油麵、魚漿製品、做法1的香菇、烹大師，再煮3分鐘後放入小白菜、胡椒粉、香油，煮1分鐘即可食用。', '', '', '', 1),
(17, 1, '豬絞肉', '400g', '', '', 0),
(17, 1, '紅蘿蔔', '80g', '', '', 1),
(17, 1, '荸薺', '120g', '', '', 2),
(17, 1, '蛋', '1顆', '', '', 3),
(17, 1, '蔥', '1根', '', '', 4),
(17, 1, '薑', '30g', '', '', 5),
(17, 1, '芋頭', '150g', '', '', 6),
(17, 1, '地瓜', '150g', '', '', 7),
(17, 2, '「ほんだし ®/烹大師®」干貝風味,醬油,米酒,胡椒粉,香油,太白粉', '1大匙,1小匙,1大匙,1/2小匙,1小匙,2大匙', ',,,,,', '0,0,0,0,0,0', 1),
(17, 3, '紅蘿蔔切末，荸薺切末，蔥、薑切末，芋頭及地瓜切丁狀。', '', '', '', 0),
(17, 3, '先將豬絞肉、紅蘿蔔、荸薺、 蛋、蔥、薑、調味料A拌勻，再分成6等份球狀。', '', '', '', 1),
(17, 3, '再將肉球分別沾上芋頭丁及地瓜丁，放入蒸鍋内大火蒸15分鐘即可。', '', '', '', 2),
(17, 3, '※美味方程式：也可改為油炸至熟', '', '', '', 3),
(14, 1, '板豆腐', '120g', '', '', 0),
(14, 1, '新鮮香菇', '120g', '', '', 1),
(14, 1, '刈薯=洋地瓜=豆薯', '100g', '', '', 2),
(14, 1, '素火腿', '160g', '', '', 3),
(14, 1, '芹菜', '100g', '', '', 4),
(14, 1, '薑', '20g', '', '', 5),
(14, 1, '青江菜', '2株', '', '', 6),
(14, 1, '枸杞', '1大匙', '', '', 7),
(14, 2, '素壕油', '2大匙', '', '0', 1),
(14, 2, '糖', '1小匙', '', '0', 2),
(14, 2, '胡椒粉', '少許', '', '0', 3),
(14, 2, '太白粉', '1大匙', '', '0', 4),
(14, 2, '「ほんだし ®/烹大師®」昆布風味,麵粉,香油', '1大匙,4大匙,1大匙', ',,', '0,0,0', 5),
(14, 3, '板豆腐攪碎，新鮮香菇、刈薯、素火腿、芹菜、薑切碎。再與調味料Ⓐ拌勻，再分成四等份，搓揉成球狀，放入油鍋内炸熟。', '', '', '', 0),
(14, 3, '青江菜對切後，汆燙熟排盤。', '', '', '', 1),
(14, 3, '鍋内加入400c.c.水煮開，放入炸好的素獅子頭、枸杞、素蠔油、糖、胡椒粉煮3分鐘，再以太白粉水苟荧即可。', '', '', '', 2),
(2, 1, '白蘿蔔', '1/2條', '', '', 0),
(2, 1, '昆布', '20g', '', '', 1),
(2, 1, '水', '適量', '', '', 2),
(2, 1, '柚子皮', '切絲適量', '', '', 3),
(2, 2, 'ほんだし ®/烹大師®」昆布風味,醬油', '2小匙,4大匙', ',', '0,0', 1),
(2, 3, '白蘿蔔、昆布切成適當大小。', '', '', '', 0),
(2, 3, '放入做法①於鍋內，並加適量水淹至白蘿蔔為止。加入Ⓐ調味將白蘿蔔燉煮至熟軟為止。', '', '', '', 1),
(2, 3, ' 將做法②盛入器皿中，最後灑上切絲的柚子皮', '', '', '', 2),
(3, 1, '小芋頭', '8個', '', '', 0),
(3, 1, '茄子', '2條', '', '', 1),
(3, 1, '秋葵', '12根', '', '', 2),
(3, 1, '油', '適量', '', '', 3),
(3, 2, '水', '1.5杯', '', '0', 1),
(3, 2, '鹽', '0.5小匙', '', '0', 2),
(3, 2, '薑泥', '適量', '', '0', 3),
(3, 3, '未削皮的芋頭切除兩邊頂端後，放入塑膠袋中，用微波爐(500瓦)加熱約5-6分鐘後剝皮。', '', '', '', 0),
(3, 3, '將茄子横切約2公分厚，秋葵去除花萼後再各分為2-3等分。', '', '', '', 1),
(3, 3, '使用約180℃ 的油將做法①、②炸至酥脆。', '', '', '', 2),
(3, 3, '將做法③盛入器皿中，淋上已加熱調製完成的Ⓐ調味，最後在頂端放置薑泥。', '', '', '', 3),
(4, 1, '油菜', '1/4束', '', '', 0),
(4, 1, '杏鮑菇', '2支', '', '', 1),
(4, 2, '水', '3杯', '', '0', 1),
(4, 2, '柚子皮', '適量', '', '0', 2),
(4, 2, '「ほんだし ®/烹大師®」昆布風味,鹽,醬油', '1.3小匙,0.5小匙,0.5小匙', ',,', '0,0,0', 3),
(4, 3, '油菜切約5公分長，將杏鮑菇切半以後再切薄片。', '', '', '', 0),
(4, 3, '鍋内放入3杯量的水，調味料Ⓐ加熱沸騰後，再加入做法①的油菜、杏鮑菇，再轉中火煮2-3分鐘。', '', '', '', 1),
(4, 3, '盛入器皿，再依個人喜好放置柚子皮即可。', '', '', '', 2),
(5, 1, '蛤蠣', '240g', '', '', 0),
(5, 1, '綠蘆筍', '4根', '', '', 1),
(5, 2, '水,蔥', '3杯,適量', ',', '0,0', 0),
(5, 2, '「ほんだし ®/烹大師®」昆布風味,鹽,醬油', '1.3小匙,1小匙,0.5小匙', ',,', '0,0,0', 1),
(5, 3, '將蛤仔放入鹽水中吐沙，且詳细清洗外殼。剝除綠蘆筍根部1/3的皮，斜切成約5cm長，蔥切成蔥花狀。', '', '', '', 0),
(5, 3, '將做法①的蛤仔放入約一鍋份量的水中後，開火煮至半熟時轉小火。再加入做法①的綠蘆筍和調味料Ⓐ，續煮至殻開為止。', '', '', '', 1),
(5, 3, '盛盤後，加上做法①的蔥花即完成。', '', '', '', 2),
(6, 1, '木棉豆腐', '300g', '', '', 0),
(6, 1, '鳕魚', '200g', '', '', 1),
(6, 1, '香菇', '8朵', '', '', 2),
(6, 1, '青蔥', '1根', '', '', 3),
(6, 1, '茼蒿菜', '100g', '', '', 4),
(6, 1, '白菜', '200g', '', '', 5),
(6, 2, '「ほんだし®/烹大師®」昆布風味,醬油,柚子酢,高湯', '1大匙,3大匙,3大匙,3大匙', ',,,', '0,0,0,0', 0),
(6, 2, 'ほんだし ®/烹大師®」昆布風味,水,蔥花', '1大匙,3杯,少許', ',,', '0,0,0', 1),
(6, 3, '將調味料Ⓐ混合製成沾醬。', '', '', '', 0),
(6, 3, '將豆腐切成塊狀，鳕魚切成一口大小，香菇去柄，青蔥斜切，去除茼蒿較硬的莖，先將Ⓑ的材料放入鍋中煮，後加入以上準備好的食材。', '', '', '', 1),
(6, 3, '煮好的料理沾用做法①的普汁即可食用。', '', '', '', 2),
(7, 1, '薄片猪五花肉', '200g', '', '', 0),
(7, 1, '馬鈴薯', '4個', '', '', 1),
(7, 1, '海苔絲', '適量', '', '', 2),
(7, 1, '紅蘿蔔', '1個', '', '', 3),
(7, 1, '洋蔥', '1個', '', '', 4),
(7, 1, '豌豆莢', '8枚', '', '', 5),
(7, 2, '「ほんだし ®/烹大師®」昆布風味', '2小匙', '', '0', 0),
(7, 2, '水', '3杯', '', '0', 1),
(7, 2, '油', '1大匙', '', '0', 2),
(7, 2, '味醂,砂糖,酒', '4大匙,2大匙,2大匙', ',,', '0,0,0', 3),
(7, 2, '醬油,鹽', '4大匙,少許', ',', '0,0', 4),
(7, 3, '馬鈴薯切2~4等分，紅蘿蔔隨意切塊，洋蔥切絲。', '', '', '', 0),
(7, 3, '熱油後加入猪肉及「ほんだし ®/烹大師®」昆布風味1小匙快炒，半熟後再加入做法①的馬鈴薯、紅蘿蔔、洋蔥快炒。', '', '', '', 1),
(7, 3, '將水、1小匙烹大師昆布風味，加入調味料Ⓐ 中以中火煮10分鐘後，再加入調味料Ⓑ煮10分鐘即可。', '', '', '', 2);

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
-- 資料表的匯出資料 `role`
--

INSERT INTO `role` (`id`, `name`, `status`, `remark`, `c_time`, `c_user_id`, `u_time`, `u_user_id`) VALUES
(1, '系統管理員', 0, '', '2019-03-09 15:54:58', 0, '2019-03-09 15:54:58', 0),
(2, '管理者', 0, '台灣味之素管理者', '2019-09-16 16:22:11', 1, '2019-09-16 16:22:11', 1);

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
(1, 19),
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
(2, 19);

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
(1, 86),
(1, 87),
(1, 88),
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
(2, 88);

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
(1, 3),
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
(1, 'admin@ks', 'KVXTOnThNp7RqzgFRTVyvA==', 'admin', 'vic@ks-design.com.tw', '', '2019-10-29 16:25:10', '210.61.165.238', 0, '', '2019-03-09 15:55:38', 0, '2019-10-29 16:25:10', 1),
(2, 'web_server', 'f4HEr6Ki2B4+nh5+LCCn+Q==', 'web_server', 'vic@ks-design.com.tw', '02-87716606', '2019-10-29 14:10:36', '210.61.165.238', 0, '', '2019-07-23 15:44:04', 1, '2019-10-29 14:10:36', 1),
(3, 'vic@ks', '+jg1og867os4dMQD5GQgdQ==', 'vic@ks', 'vic@ks-design.com.tw', '', '2019-09-02 10:01:00', '::1', 0, '', '2019-07-23 15:44:31', 1, '2019-09-02 10:01:00', 1),
(4, 'admin', '/qj2561j1v5QJ326e7PwSw==', '管理者', 'gemma@ajinomoto.com.tw', '', '2019-10-28 16:27:44', '210.61.165.238', 0, '', '2019-09-16 16:24:19', 1, '2019-10-28 16:27:44', 1);

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

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `ad_view`  AS  select `ad`.`id` AS `id`,`ad`.`name` AS `name`,`ad`.`pic_url` AS `pic_url`,`ad`.`pic_alt` AS `pic_alt`,`ad`.`link` AS `link`,`ad`.`list_order` AS `list_order`,`ad`.`status` AS `status`,`ad`.`remark` AS `remark`,`ad`.`c_time` AS `c_time`,`ad`.`c_user_id` AS `c_user_id`,`c_user`.`name` AS `c_user_name`,`ad`.`u_time` AS `u_time`,`ad`.`u_user_id` AS `u_user_id`,`u_user`.`name` AS `u_user_name` from ((`ad` left join `user` `c_user` on((`ad`.`c_user_id` = `c_user`.`id`))) left join `user` `u_user` on((`ad`.`u_user_id` = `u_user`.`id`))) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `banner_view`
--
DROP TABLE IF EXISTS `banner_view`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `banner_view`  AS  select `banner`.`id` AS `id`,`banner`.`name` AS `name`,`banner`.`pic_url` AS `pic_url`,`banner`.`pic_alt` AS `pic_alt`,`banner`.`link` AS `link`,`banner`.`blank` AS `blank`,`banner`.`list_order` AS `list_order`,`banner`.`status` AS `status`,`banner`.`remark` AS `remark`,`banner`.`c_time` AS `c_time`,`banner`.`c_user_id` AS `c_user_id`,`c_user`.`name` AS `c_user_name`,`banner`.`u_time` AS `u_time`,`banner`.`u_user_id` AS `u_user_id`,`u_user`.`name` AS `u_user_name` from ((`banner` left join `user` `c_user` on((`banner`.`c_user_id` = `c_user`.`id`))) left join `user` `u_user` on((`banner`.`u_user_id` = `u_user`.`id`))) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `brand_view`
--
DROP TABLE IF EXISTS `brand_view`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `brand_view`  AS  select `brand`.`id` AS `id`,`brand`.`name` AS `name`,`brand`.`pic_url` AS `pic_url`,`brand`.`pic_alt` AS `pic_alt`,`brand`.`list_order` AS `list_order`,`brand`.`status` AS `status`,`brand`.`remark` AS `remark`,`brand`.`c_time` AS `c_time`,`brand`.`c_user_id` AS `c_user_id`,`c_user`.`name` AS `c_user_name`,`brand`.`u_time` AS `u_time`,`brand`.`u_user_id` AS `u_user_id`,`u_user`.`name` AS `u_user_name` from ((`brand` left join `user` `c_user` on((`brand`.`c_user_id` = `c_user`.`id`))) left join `user` `u_user` on((`brand`.`u_user_id` = `u_user`.`id`))) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `campaign_tag_view`
--
DROP TABLE IF EXISTS `campaign_tag_view`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `campaign_tag_view`  AS  select `campaign_tag`.`id` AS `id`,`campaign_tag`.`name` AS `name`,`campaign_tag`.`color` AS `color`,`campaign_tag`.`list_order` AS `list_order`,`campaign_tag`.`status` AS `status`,`campaign_tag`.`remark` AS `remark`,`campaign_tag`.`c_time` AS `c_time`,`campaign_tag`.`c_user_id` AS `c_user_id`,`c_user`.`name` AS `c_user_name`,`campaign_tag`.`u_time` AS `u_time`,`campaign_tag`.`u_user_id` AS `u_user_id`,`u_user`.`name` AS `u_user_name` from ((`campaign_tag` join `user` `c_user` on((`campaign_tag`.`c_user_id` = `c_user`.`id`))) left join `user` `u_user` on((`campaign_tag`.`u_user_id` = `u_user`.`id`))) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `campaign_view`
--
DROP TABLE IF EXISTS `campaign_view`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `campaign_view`  AS  select `campaign`.`id` AS `id`,`campaign`.`tag_ids` AS `tag_ids`,group_concat(`s`.`name` separator ',') AS `tag_names`,group_concat(`s`.`color` separator ',') AS `tag_colors`,`campaign`.`title` AS `title`,`campaign`.`sub_title` AS `sub_title`,`campaign`.`content` AS `content`,`campaign`.`pic_url` AS `pic_url`,`campaign`.`pic_alt` AS `pic_alt`,`campaign`.`release_date` AS `release_date`,`campaign`.`list_order` AS `list_order`,`campaign`.`status` AS `status`,`campaign`.`remark` AS `remark`,`campaign`.`c_time` AS `c_time`,`campaign`.`c_user_id` AS `c_user_id`,`c_user`.`name` AS `c_user_name`,`campaign`.`u_time` AS `u_time`,`campaign`.`u_user_id` AS `u_user_id`,`u_user`.`name` AS `u_user_name` from (((`campaign` left join `user` `c_user` on((`campaign`.`c_user_id` = `c_user`.`id`))) left join `user` `u_user` on((`campaign`.`u_user_id` = `u_user`.`id`))) left join `campaign_tag` `s` on(find_in_set(`s`.`id`,`campaign`.`tag_ids`))) group by `campaign`.`id` ;

-- --------------------------------------------------------

--
-- 檢視表結構 `city_area_view`
--
DROP TABLE IF EXISTS `city_area_view`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `city_area_view`  AS  select `area`.`zipcode` AS `zipcode`,`area`.`city_id` AS `city_id`,`city`.`name` AS `city_name`,`area`.`id` AS `area_id`,`area`.`name` AS `area_name` from (`area` left join `city` on((`area`.`city_id` = `city`.`id`))) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `higi_view`
--
DROP TABLE IF EXISTS `higi_view`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `higi_view`  AS  select `higi`.`id` AS `id`,`higi`.`name` AS `name`,`higi`.`pic_url` AS `pic_url`,`higi`.`pic_alt` AS `pic_alt`,`higi`.`content` AS `content`,`higi`.`description` AS `description`,`higi`.`recipepro_id` AS `recipepro_id`,`recipepro`.`name` AS `recipepro_name`,`recipepro`.`pic_url` AS `recipepro_pic_url`,`recipepro`.`pic_alt` AS `recipepro_pic_alt`,`recipepro`.`member_only` AS `recipepro_member_only`,`product`.`brand_id` AS `brand_id`,`brand`.`name` AS `brand_name`,`brand`.`pic_url` AS `brand_pic_url`,`brand`.`pic_alt` AS `brand_pic_alt`,`higi`.`product_id` AS `product_id`,`product`.`name` AS `product_name`,`product`.`pic_urls` AS `product_pic_urls`,`product`.`pic_alts` AS `product_pic_alts`,`higi`.`tags` AS `tags`,`higi`.`methods` AS `methods`,`higi`.`note` AS `note`,`higi`.`member_only` AS `member_only`,`higi`.`visitor` AS `visitor`,`higi`.`list_order` AS `list_order`,`higi`.`status` AS `status`,`higi`.`remark` AS `remark`,`higi`.`c_time` AS `c_time`,`higi`.`c_user_id` AS `c_user_id`,`c_user`.`name` AS `c_user_name`,`higi`.`u_time` AS `u_time`,`higi`.`u_user_id` AS `u_user_id`,`u_user`.`name` AS `u_user_name` from (((((`higi` left join `recipepro` on((`higi`.`recipepro_id` = `recipepro`.`id`))) left join `product` on((`higi`.`product_id` = `product`.`id`))) left join `brand` on((`product`.`brand_id` = `brand`.`id`))) left join `user` `c_user` on((`higi`.`c_user_id` = `c_user`.`id`))) left join `user` `u_user` on((`higi`.`u_user_id` = `u_user`.`id`))) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `log_view`
--
DROP TABLE IF EXISTS `log_view`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `log_view`  AS  select `log`.`id` AS `id`,`log`.`user_id` AS `user_id`,`user`.`account` AS `user_account`,`user`.`name` AS `user_name`,`log`.`ip` AS `ip`,`log`.`program_id` AS `program_id`,`program`.`name` AS `program_name`,`log`.`verb` AS `verb`,`log`.`args` AS `args`,`log`.`file` AS `file`,`log`.`resultCode` AS `resultCode`,`log`.`resultMessage` AS `resultMessage`,`log`.`resultData` AS `resultData`,`log`.`c_time` AS `c_time` from ((`log` left join `user` on((`log`.`user_id` = `user`.`id`))) left join `program` on((`log`.`program_id` = `program`.`id`))) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `member_higi_view`
--
DROP TABLE IF EXISTS `member_higi_view`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `member_higi_view`  AS  select `member`.`id` AS `member_id`,`member`.`account` AS `member_account`,`member`.`name` AS `member_name`,`member`.`status` AS `member_status`,`higi_view`.`id` AS `id`,`higi_view`.`name` AS `name`,`higi_view`.`pic_url` AS `pic_url`,`higi_view`.`pic_alt` AS `pic_alt`,`higi_view`.`content` AS `content`,`higi_view`.`recipepro_id` AS `recipepro_id`,`higi_view`.`recipepro_name` AS `recipepro_name`,`higi_view`.`recipepro_pic_url` AS `recipepro_pic_url`,`higi_view`.`recipepro_pic_alt` AS `recipepro_pic_alt`,`higi_view`.`recipepro_member_only` AS `recipepro_member_only`,`higi_view`.`brand_id` AS `brand_id`,`higi_view`.`brand_name` AS `brand_name`,`higi_view`.`brand_pic_url` AS `brand_pic_url`,`higi_view`.`brand_pic_alt` AS `brand_pic_alt`,`higi_view`.`product_id` AS `product_id`,`higi_view`.`product_name` AS `product_name`,`higi_view`.`product_pic_urls` AS `product_pic_urls`,`higi_view`.`product_pic_alts` AS `product_pic_alts`,`higi_view`.`tags` AS `tags`,`higi_view`.`methods` AS `methods`,`higi_view`.`note` AS `note`,`higi_view`.`member_only` AS `member_only`,`higi_view`.`visitor` AS `visitor`,`higi_view`.`list_order` AS `list_order`,`higi_view`.`status` AS `status`,`higi_view`.`remark` AS `remark`,`higi_view`.`c_time` AS `c_time`,`higi_view`.`c_user_id` AS `c_user_id`,`higi_view`.`c_user_name` AS `c_user_name`,`higi_view`.`u_time` AS `u_time`,`higi_view`.`u_user_id` AS `u_user_id`,`higi_view`.`u_user_name` AS `u_user_name` from ((`member` join `member_higi` on((`member`.`id` = `member_higi`.`member_id`))) join `higi_view` on((`member_higi`.`higi_id` = `higi_view`.`id`))) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `member_recipepro_view`
--
DROP TABLE IF EXISTS `member_recipepro_view`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `member_recipepro_view`  AS  select `member`.`id` AS `member_id`,`member`.`account` AS `member_account`,`member`.`name` AS `member_name`,`member`.`status` AS `member_status`,`recipepro_view`.`id` AS `id`,`recipepro_view`.`name` AS `name`,`recipepro_view`.`pic_url` AS `pic_url`,`recipepro_view`.`pic_alt` AS `pic_alt`,`recipepro_view`.`feature` AS `feature`,`recipepro_view`.`tags` AS `tags`,`recipepro_view`.`price` AS `price`,`recipepro_view`.`type` AS `type`,`recipepro_view`.`style` AS `style`,`recipepro_view`.`product_ids` AS `product_ids`,`recipepro_view`.`product_names` AS `product_names`,`recipepro_view`.`nutrition` AS `nutrition`,`recipepro_view`.`member_only` AS `member_only`,`recipepro_view`.`visitor` AS `visitor`,`recipepro_view`.`list_order` AS `list_order`,`recipepro_view`.`status` AS `status`,`recipepro_view`.`remark` AS `remark`,`recipepro_view`.`c_time` AS `c_time`,`recipepro_view`.`c_user_id` AS `c_user_id`,`recipepro_view`.`c_user_name` AS `c_user_name`,`recipepro_view`.`u_time` AS `u_time`,`recipepro_view`.`u_user_id` AS `u_user_id`,`recipepro_view`.`u_user_name` AS `u_user_name` from ((`member` join `member_recipepro` on((`member`.`id` = `member_recipepro`.`member_id`))) join `recipepro_view` on((`member_recipepro`.`recipepro_id` = `recipepro_view`.`id`))) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `member_view`
--
DROP TABLE IF EXISTS `member_view`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `member_view`  AS  select `member`.`id` AS `id`,`member`.`account` AS `account`,`member`.`verification` AS `verification`,`member`.`name` AS `name`,`member`.`gender` AS `gender`,`member`.`birthday` AS `birthday`,`member`.`phone` AS `phone`,`member`.`restaurant_name` AS `restaurant_name`,`area`.`zipcode` AS `restaurant_zipcode`,`area`.`city_id` AS `restaurant_city_id`,`city`.`name` AS `restaurant_city_name`,`member`.`restaurant_area_id` AS `restaurant_area_id`,`area`.`name` AS `restaurant_area_name`,`member`.`restaurant_type` AS `restaurant_type`,`member`.`last_login_time` AS `last_login_time`,`member`.`last_login_ip` AS `last_login_ip`,`member`.`status` AS `status`,`member`.`remark` AS `remark`,`member`.`c_time` AS `c_time`,`member`.`c_user_id` AS `c_user_id`,`c_user`.`name` AS `c_user_name`,`member`.`u_time` AS `u_time`,`member`.`u_user_id` AS `u_user_id`,`u_user`.`name` AS `u_user_name` from ((((`member` left join `area` on((`member`.`restaurant_area_id` = `area`.`id`))) left join `city` on((`area`.`city_id` = `city`.`id`))) left join `user` `c_user` on((`member`.`c_user_id` = `c_user`.`id`))) left join `user` `u_user` on((`member`.`u_user_id` = `u_user`.`id`))) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `menu_view`
--
DROP TABLE IF EXISTS `menu_view`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `menu_view`  AS  select `menu`.`id` AS `id`,`menu`.`parent_id` AS `parent_id`,`parent_menu`.`name` AS `parent_name`,`menu`.`name` AS `name`,`menu`.`url` AS `url`,`menu`.`icon` AS `icon`,`menu`.`program_ids` AS `program_ids`,`menu`.`list_order` AS `list_order`,`menu`.`status` AS `status`,`menu`.`remark` AS `remark`,`menu`.`c_time` AS `c_time`,`menu`.`c_user_id` AS `c_user_id`,`c_user`.`name` AS `c_user_name`,`menu`.`u_time` AS `u_time`,`menu`.`u_user_id` AS `u_user_id`,`u_user`.`name` AS `u_user_name` from (((`menu` left join `menu` `parent_menu` on((`menu`.`parent_id` = `parent_menu`.`id`))) left join `user` `c_user` on((`menu`.`c_user_id` = `c_user`.`id`))) left join `user` `u_user` on((`menu`.`u_user_id` = `u_user`.`id`))) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `product_view`
--
DROP TABLE IF EXISTS `product_view`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `product_view`  AS  select `product`.`id` AS `id`,`product`.`brand_id` AS `brand_id`,`brand`.`name` AS `brand_name`,`brand`.`pic_url` AS `brand_pic_url`,`brand`.`pic_alt` AS `brand_pic_alt`,`product`.`name` AS `name`,`product`.`pic_urls` AS `pic_urls`,`product`.`pic_alts` AS `pic_alts`,`product`.`tag` AS `tag`,`product`.`content` AS `content`,`product`.`tips` AS `tips`,`product`.`information` AS `information`,`product`.`mark` AS `mark`,`product`.`list_order` AS `list_order`,`product`.`status` AS `status`,`product`.`remark` AS `remark`,`product`.`c_time` AS `c_time`,`product`.`c_user_id` AS `c_user_id`,`c_user`.`name` AS `c_user_name`,`product`.`u_time` AS `u_time`,`product`.`u_user_id` AS `u_user_id`,`u_user`.`name` AS `u_user_name` from (((`product` left join `brand` on((`product`.`brand_id` = `brand`.`id`))) left join `user` `c_user` on((`product`.`c_user_id` = `c_user`.`id`))) left join `user` `u_user` on((`product`.`u_user_id` = `u_user`.`id`))) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `program_category_view`
--
DROP TABLE IF EXISTS `program_category_view`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `program_category_view`  AS  select `program_category`.`id` AS `id`,`program_category`.`name` AS `name`,`program_category`.`status` AS `status`,`program_category`.`remark` AS `remark`,`program_category`.`c_time` AS `c_time`,`program_category`.`c_user_id` AS `c_user_id`,`c_user`.`name` AS `c_user_name`,`program_category`.`u_time` AS `u_time`,`program_category`.`u_user_id` AS `u_user_id`,`u_user`.`name` AS `u_user_name` from ((`program_category` left join `user` `c_user` on((`program_category`.`c_user_id` = `c_user`.`id`))) left join `user` `u_user` on((`program_category`.`u_user_id` = `u_user`.`id`))) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `program_view`
--
DROP TABLE IF EXISTS `program_view`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `program_view`  AS  select `program`.`id` AS `id`,`program`.`category_id` AS `category_id`,`program_category`.`name` AS `category_name`,`program`.`name` AS `name`,`program`.`guid` AS `guid`,`program`.`status` AS `status`,`program`.`remark` AS `remark`,`program`.`c_time` AS `c_time`,`program`.`c_user_id` AS `c_user_id`,`c_user`.`name` AS `c_user_name`,`program`.`u_time` AS `u_time`,`program`.`u_user_id` AS `u_user_id`,`u_user`.`name` AS `u_user_name` from (((`program` left join `program_category` on((`program`.`category_id` = `program_category`.`id`))) left join `user` `c_user` on((`program`.`c_user_id` = `c_user`.`id`))) left join `user` `u_user` on((`program`.`u_user_id` = `u_user`.`id`))) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `recipepro_view`
--
DROP TABLE IF EXISTS `recipepro_view`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `recipepro_view`  AS  select `recipepro`.`id` AS `id`,`recipepro`.`name` AS `name`,`recipepro`.`pic_url` AS `pic_url`,`recipepro`.`pic_alt` AS `pic_alt`,`recipepro`.`feature` AS `feature`,`recipepro`.`tags` AS `tags`,`recipepro`.`price` AS `price`,`recipepro`.`type` AS `type`,`recipepro`.`style` AS `style`,`recipepro`.`product_ids` AS `product_ids`,`recipepro`.`material_weight` AS `material_weight`,group_concat(`s`.`name` separator ',') AS `product_names`,`recipepro`.`nutrition` AS `nutrition`,`recipepro`.`member_only` AS `member_only`,`recipepro`.`visitor` AS `visitor`,`recipepro`.`list_order` AS `list_order`,`recipepro`.`status` AS `status`,`recipepro`.`remark` AS `remark`,`recipepro`.`c_time` AS `c_time`,`recipepro`.`c_user_id` AS `c_user_id`,`c_user`.`name` AS `c_user_name`,`recipepro`.`u_time` AS `u_time`,`recipepro`.`u_user_id` AS `u_user_id`,`u_user`.`name` AS `u_user_name` from (((`recipepro` left join `user` `c_user` on((`recipepro`.`c_user_id` = `c_user`.`id`))) left join `user` `u_user` on((`recipepro`.`u_user_id` = `u_user`.`id`))) left join `product` `s` on(find_in_set(`s`.`id`,`recipepro`.`product_ids`))) group by `recipepro`.`id` ;

-- --------------------------------------------------------

--
-- 檢視表結構 `role_menu_view`
--
DROP TABLE IF EXISTS `role_menu_view`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `role_menu_view`  AS  select `role`.`id` AS `role_id`,`role`.`name` AS `role_name`,`role`.`status` AS `role_status`,`menu_view`.`id` AS `id`,`menu_view`.`parent_id` AS `parent_id`,`menu_view`.`parent_name` AS `parent_name`,`menu_view`.`name` AS `name`,`menu_view`.`url` AS `url`,`menu_view`.`icon` AS `icon`,`menu_view`.`program_ids` AS `program_ids`,`menu_view`.`list_order` AS `list_order`,`menu_view`.`status` AS `status`,`menu_view`.`remark` AS `remark`,`menu_view`.`c_time` AS `c_time`,`menu_view`.`c_user_id` AS `c_user_id`,`menu_view`.`c_user_name` AS `c_user_name`,`menu_view`.`u_time` AS `u_time`,`menu_view`.`u_user_id` AS `u_user_id`,`menu_view`.`u_user_name` AS `u_user_name` from ((`role` left join `role_menu` on((`role`.`id` = `role_menu`.`role_id`))) join `menu_view` on((`role_menu`.`menu_id` = `menu_view`.`id`))) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `role_program_view`
--
DROP TABLE IF EXISTS `role_program_view`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `role_program_view`  AS  select `role`.`id` AS `role_id`,`role`.`name` AS `role_name`,`role`.`status` AS `role_status`,`program_view`.`id` AS `id`,`program_view`.`category_id` AS `category_id`,`program_view`.`category_name` AS `category_name`,`program_view`.`name` AS `name`,`program_view`.`guid` AS `guid`,`program_view`.`status` AS `status`,`program_view`.`remark` AS `remark`,`program_view`.`c_time` AS `c_time`,`program_view`.`c_user_id` AS `c_user_id`,`program_view`.`c_user_name` AS `c_user_name`,`program_view`.`u_time` AS `u_time`,`program_view`.`u_user_id` AS `u_user_id`,`program_view`.`u_user_name` AS `u_user_name` from ((`role` left join `role_program` on((`role`.`id` = `role_program`.`role_id`))) join `program_view` on((`role_program`.`program_id` = `program_view`.`id`))) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `role_view`
--
DROP TABLE IF EXISTS `role_view`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `role_view`  AS  select `role`.`id` AS `id`,`role`.`name` AS `name`,`role`.`status` AS `status`,`role`.`remark` AS `remark`,`role`.`c_time` AS `c_time`,`role`.`c_user_id` AS `c_user_id`,`c_user`.`name` AS `c_user_name`,`role`.`u_time` AS `u_time`,`role`.`u_user_id` AS `u_user_id`,`u_user`.`name` AS `u_user_name` from ((`role` left join `user` `c_user` on((`role`.`c_user_id` = `c_user`.`id`))) left join `user` `u_user` on((`role`.`u_user_id` = `u_user`.`id`))) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `user_role_menu_view`
--
DROP TABLE IF EXISTS `user_role_menu_view`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `user_role_menu_view`  AS  select `user`.`id` AS `user_id`,`user`.`account` AS `user_account`,`user`.`name` AS `user_name`,`user`.`status` AS `user_status`,`menu`.`id` AS `id`,`menu`.`parent_id` AS `parent_id`,`menu`.`name` AS `name`,`menu`.`url` AS `url`,`menu`.`icon` AS `icon`,`menu`.`program_ids` AS `program_ids`,`menu`.`status` AS `status`,`menu`.`remark` AS `remark`,`menu`.`list_order` AS `list_order` from ((((`user` left join `role_user` on((`user`.`id` = `role_user`.`user_id`))) left join `role` on((`role_user`.`role_id` = `role`.`id`))) left join `role_menu` on((`role`.`id` = `role_menu`.`role_id`))) left join `menu` on((`role_menu`.`menu_id` = `menu`.`id`))) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `user_role_program_view`
--
DROP TABLE IF EXISTS `user_role_program_view`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `user_role_program_view`  AS  select `user`.`id` AS `user_id`,`user`.`account` AS `user_account`,`user`.`name` AS `user_name`,`user`.`status` AS `user_status`,`role`.`id` AS `role_id`,`role`.`name` AS `role_name`,`role`.`status` AS `role_status`,`program`.`id` AS `program_id`,`program`.`name` AS `program_name`,`program`.`status` AS `program_status`,`program`.`guid` AS `program_guid`,`program_category`.`remark` AS `program_remark`,`program_category`.`id` AS `program_category_id`,`program_category`.`name` AS `program_category_name`,`program_category`.`status` AS `program_category_status` from (((((`user` left join `role_user` on((`user`.`id` = `role_user`.`user_id`))) left join `role` on((`role_user`.`role_id` = `role`.`id`))) left join `role_program` on((`role`.`id` = `role_program`.`role_id`))) left join `program` on((`role_program`.`program_id` = `program`.`id`))) join `program_category` on((`program`.`category_id` = `program_category`.`id`))) ;

-- --------------------------------------------------------

--
-- 檢視表結構 `user_view`
--
DROP TABLE IF EXISTS `user_view`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `user_view`  AS  select `user`.`id` AS `id`,`user`.`account` AS `account`,`user`.`name` AS `name`,`user`.`email` AS `email`,`user`.`phone` AS `phone`,`user`.`last_login_time` AS `last_login_time`,`user`.`last_login_ip` AS `last_login_ip`,`user`.`status` AS `status`,`user`.`remark` AS `remark`,`user`.`c_time` AS `c_time`,`user`.`c_user_id` AS `c_user_id`,`c_user`.`name` AS `c_user_name`,`user`.`u_time` AS `u_time`,`user`.`u_user_id` AS `u_user_id`,`u_user`.`name` AS `u_user_name` from ((`user` left join `user` `c_user` on((`user`.`c_user_id` = `c_user`.`id`))) left join `user` `u_user` on((`user`.`u_user_id` = `u_user`.`id`))) ;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '廣告編號', AUTO_INCREMENT=8;

--
-- 使用資料表 AUTO_INCREMENT `area`
--
ALTER TABLE `area`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '鄉鎮市區編號', AUTO_INCREMENT=369;

--
-- 使用資料表 AUTO_INCREMENT `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Banner編號', AUTO_INCREMENT=2;

--
-- 使用資料表 AUTO_INCREMENT `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '品牌編號', AUTO_INCREMENT=7;

--
-- 使用資料表 AUTO_INCREMENT `campaign`
--
ALTER TABLE `campaign`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '餐飲情報編號', AUTO_INCREMENT=2;

--
-- 使用資料表 AUTO_INCREMENT `campaign_tag`
--
ALTER TABLE `campaign_tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '餐飲情報標籤編號', AUTO_INCREMENT=2;

--
-- 使用資料表 AUTO_INCREMENT `city`
--
ALTER TABLE `city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '縣市編號', AUTO_INCREMENT=23;

--
-- 使用資料表 AUTO_INCREMENT `higi`
--
ALTER TABLE `higi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '招客秘技編號', AUTO_INCREMENT=6;

--
-- 使用資料表 AUTO_INCREMENT `log`
--
ALTER TABLE `log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '操作記錄編號';

--
-- 使用資料表 AUTO_INCREMENT `member`
--
ALTER TABLE `member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '會員編號', AUTO_INCREMENT=5;

--
-- 使用資料表 AUTO_INCREMENT `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '選單編號', AUTO_INCREMENT=20;

--
-- 使用資料表 AUTO_INCREMENT `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品編號', AUTO_INCREMENT=14;

--
-- 使用資料表 AUTO_INCREMENT `program`
--
ALTER TABLE `program`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '程式編號', AUTO_INCREMENT=89;

--
-- 使用資料表 AUTO_INCREMENT `program_category`
--
ALTER TABLE `program_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '程式類別編號', AUTO_INCREMENT=18;

--
-- 使用資料表 AUTO_INCREMENT `recipepro`
--
ALTER TABLE `recipepro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '專業食譜編號', AUTO_INCREMENT=18;

--
-- 使用資料表 AUTO_INCREMENT `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色編號', AUTO_INCREMENT=3;

--
-- 使用資料表 AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '使用者編號', AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
