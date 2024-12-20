﻿--Laboratorio 4 de Dereck Josué Soto Bonilla

--1 Utilice la base de datos EMPRESA
USE Empresa
GO


--2 Cree una tabla ciudadano, con campos ID, nombre, ciudad, edad
CREATE TABLE Ciudadano 
(
	IDCiudadano INT PRIMARY KEY,
	Nombre NVARCHAR (50) NOT NULL,
	Ciudad NVARCHAR (50) NOT NULL,
	Edad INT NOT NULL
)
GO

--3 Inserte 900 registros usando la IA https://www.mockaroo.com/
INSERT INTO Ciudadano
VALUES
	(1, 'Mack', 'Lapaz', 74),
	(2, 'Marthe', 'Santa Monica', 33),
	(3, 'Katleen', 'Santa Ana', 97),
	(4, 'Mollee', 'Antsohihy', 95),
	(5, 'Roby', 'Vakhsh', 66),
	(6, 'Daffie', 'Chimtāl', 20),
	(7, 'Antoni', 'Kuala Tuha', 69),
	(8, 'Timothee', 'Cipaku', 63),
	(9, 'Kristopher', 'Albacete', 21),
	(10, 'Caldwell', 'Ratilangi', 30),
	(11, 'Bank', 'Yongchuan', 94),
	(12, 'Clywd', 'Taibao', 99),
	(13, 'Neal', 'Tabiauan', 79),
	(14, 'Edmund', 'Yessentuki', 95),
	(15, 'Tabby', 'Tullich', 95),
	(16, 'Timoteo', 'Dobje pri Planini', 78),
	(17, 'Marion', 'Malczyce', 67),
	(18, 'Clio', 'Birmingham', 26),
	(19, 'Lenette', 'Fristad', 27),
	(20, 'Sid', 'Jezerce', 89),
	(21, 'Steffen', 'Skoki', 65),
	(22, 'Antonie', 'Santo Aleixo', 54),
	(23, 'Pamelina', 'Shengao', 51),
	(24, 'Jessie', 'Bang Krathum', 56),
	(25, 'Justinn', 'Duanjia', 52),
	(26, 'Valeria', 'Lydenburg', 59),
	(27, 'Jeffie', 'Dazhan', 89),
	(28, 'Diannne', 'Zárate', 50),
	(29, 'Charlotta', 'Guaynabo', 59),
	(30, 'Leshia', 'Paninggaran', 82),
	(31, 'Humfrey', 'Changshan', 24),
	(32, 'Marlane', 'Udi', 100),
	(33, 'Durant', 'Chilecito', 78),
	(34, 'Carver', 'Lakshmīpur', 53),
	(35, 'Malva', 'Roblin', 34),
	(36, 'Mirella', 'Buenavista', 52),
	(37, 'Beverley', 'Bouças', 76),
	(38, 'Florance', 'Tiandiba', 37),
	(39, 'Blaire', 'Arroio do Meio', 20),
	(40, 'Raynard', 'San Joaquin', 22),
	(41, 'Shannan', 'Wuppertal', 29),
	(42, 'Justinian', 'Xijia', 94),
	(43, 'Valeda', 'Saguing', 49),
	(44, 'Wallace', 'Calceta', 89),
	(45, 'Nikita', 'Stuttgart', 79),
	(46, 'Bealle', 'Uruçuca', 72),
	(47, 'Lanae', 'Gengwan', 45),
	(48, 'Andriana', 'Shah Alam', 50),
	(49, 'Olag', 'Chervonoarmiys’k', 47),
	(50, 'Octavia', 'Sacramento', 61),
	(51, 'Kippy', 'Meru', 100),
	(52, 'Sterne', 'Mīrābād', 89),
	(53, 'Benjamin', 'Vale da Pedra', 31),
	(54, 'Jennee', 'Guantian', 22),
	(55, 'Rusty', 'Francisco I Madero', 25),
	(56, 'Udall', 'Medaya', 64),
	(57, 'Donavon', 'Yartsevo', 38),
	(58, 'Cassie', 'Montpellier', 22),
	(59, 'Legra', 'Barreiros', 81),
	(60, 'Enrica', 'Constanza', 49),
	(61, 'Tracee', 'Darnah', 71),
	(62, 'Gale', 'Miki', 42),
	(63, 'Sonia', 'Tieling', 56),
	(64, 'Mort', 'Jati', 90),
	(65, 'Stacy', 'Kaiaf', 100),
	(66, 'Kirby', 'Rondonópolis', 51),
	(67, 'Gibb', 'Pak Phayun', 35),
	(68, 'Abbey', 'Zagoryanskiy', 97),
	(69, 'Garvy', 'Gandra', 68),
	(70, 'Conn', 'Venilale', 99),
	(71, 'Ciro', 'Dugulubgey', 57),
	(72, 'Chelsey', 'Taiping', 47),
	(73, 'Renado', 'Veliko Tŭrnovo', 85),
	(74, 'Coleen', 'Novokuz’minki', 81),
	(75, 'Gratiana', 'Bode Sadu', 18),
	(76, 'Magdalene', 'Veliko Tŭrnovo', 36),
	(77, 'Bili', 'Craigavon', 59),
	(78, 'Ursola', 'San Pedro', 38),
	(79, 'Nataniel', 'Dazhipo', 90),
	(80, 'Mariele', 'Majie', 45),
	(81, 'Francyne', 'Lamont', 41),
	(82, 'Sherye', 'Jibu', 51),
	(83, 'Candy', 'Janowiec', 77),
	(84, 'Mohammed', 'Loukhi', 59),
	(85, 'Kelci', 'Vila Nova', 37),
	(86, 'Kelwin', 'Borok', 47),
	(87, 'Georas', 'Port Maria', 38),
	(88, 'Cash', 'Kremenets’', 97),
	(89, 'Analise', 'General Cabrera', 93),
	(90, 'Jordain', 'Januária', 53),
	(91, 'Brucie', 'Kaiyun', 32),
	(92, 'Ignazio', 'Palama', 69),
	(93, 'Lian', 'Arvidsjaur', 27),
	(94, 'Chelsy', 'Higashine', 18),
	(95, 'Cecil', 'Tanggulangin', 49),
	(96, 'Sondra', 'San Jose', 94),
	(97, 'Etta', 'Uglyanets', 50),
	(98, 'Audre', 'Quillota', 22),
	(99, 'Hilda', 'Ḩājī Khēl', 42),
	(100, 'Marijo', 'Pégeia', 65),
	(101, 'Bren', 'Bitola', 20),
	(102, 'Alika', 'Maloma', 45),
	(103, 'Alverta', 'Saint-Étienne', 32),
	(104, 'Jamima', 'Sumberan', 51),
	(105, 'Gillan', 'Patiya', 36),
	(106, 'Guthrie', 'Nijemci', 81),
	(107, 'Devlen', 'Halimpu', 37),
	(108, 'Olivie', 'Donan', 79),
	(109, 'Gae', 'Vårdö', 96),
	(110, 'Pearl', 'Gunung Timur', 84),
	(111, 'Zonda', 'Laju Kidul', 70),
	(112, 'Minta', 'Senhor do Bonfim', 71),
	(113, 'Aretha', 'Xinmin', 75),
	(114, 'Horatio', 'Chemnitz', 88),
	(115, 'Moyra', 'Karanganyar', 93),
	(116, 'Beale', 'Amnat Charoen', 72),
	(117, 'Euphemia', 'Ake-Eze', 65),
	(118, 'Warner', 'Sawahrandu', 28),
	(119, 'Sibylle', 'Cikupa', 49),
	(120, 'Delmor', 'Na Chaluai', 61),
	(121, 'Haroun', 'Dimitrovgrad', 40),
	(122, 'Tymon', 'Zhendong', 50),
	(123, 'Ferdinande', 'Kavýli', 21),
	(124, 'Raquela', 'Xujia', 85),
	(125, 'Lyndsey', 'Mūdīyah', 48),
	(126, 'Dreddy', 'Sison', 46),
	(127, 'Rozanne', 'Don Tan', 52),
	(128, 'Bert', 'Likino-Dulevo', 22),
	(129, 'Darrel', 'Midland', 49),
	(130, 'Glad', 'Larkird', 25),
	(131, 'Franny', 'Luleå', 88),
	(132, 'Aldon', 'Beigang', 100),
	(133, 'Rahal', 'Cibugel', 71),
	(134, 'Berte', 'Argivai', 70),
	(135, 'Lanita', 'Londiani', 61),
	(136, 'Bradford', 'Pasco', 48),
	(137, 'Arlin', 'Qujing', 82),
	(138, 'Talbot', 'Yaosai', 27),
	(139, 'Merrile', 'Ar Ruţbah', 21),
	(140, 'Tarra', 'Oleiros', 91),
	(141, 'Melisa', 'Longtang', 30),
	(142, 'Waldemar', 'Shuyuan Zhen', 29),
	(143, 'Loy', 'Paris 06', 98),
	(144, 'Shari', 'Tiepu', 73),
	(145, 'Tyne', 'Ban Phan Don', 84),
	(146, 'Cymbre', 'Yasugichō', 89),
	(147, 'Amandy', 'Safed', 46),
	(148, 'Rosemary', 'Saint-Paul', 18),
	(149, 'Addy', 'Aksha', 95),
	(150, 'Sibbie', 'Huangshi', 84),
	(151, 'Christi', 'Slovenski Javornik', 63),
	(152, 'Antone', 'Tanahwurung', 42),
	(153, 'Lyman', 'Zhuxing Chaoxianzu', 61),
	(154, 'Lorrayne', 'Bayan Tuohai', 86),
	(155, 'Zedekiah', 'Guérande', 25),
	(156, 'Jerome', 'Khun Han', 93),
	(157, 'Knox', 'Thanh Ba', 40),
	(158, 'Jamil', 'Iwakura', 93),
	(159, 'Brandi', 'Oued Lill', 62),
	(160, 'Bobette', 'Bagumbayan', 54),
	(161, 'Layney', 'Oliveira de Frades', 44),
	(162, 'Randi', 'Osa', 54),
	(163, 'Wolf', 'Větřní', 85),
	(164, 'Theadora', 'Mantar', 23),
	(165, 'Nikita', 'Jalasenga', 61),
	(166, 'Shanta', 'Buçimas', 45),
	(167, 'Paten', 'Waekolong', 91),
	(168, 'Keelia', 'Xiying', 42),
	(169, 'Benedick', 'Santiago del Estero', 68),
	(170, 'Laverne', 'Lazarat', 95),
	(171, 'Wells', 'Orsay', 56),
	(172, 'Aileen', 'Didi Lilo', 51),
	(173, 'Merrilee', 'Abengourou', 32),
	(174, 'Valery', 'Nueve de Julio', 96),
	(175, 'Cornall', 'Shahrud', 88),
	(176, 'Dulsea', 'La Rochelle', 52),
	(177, 'Barrie', 'Pedroso', 64),
	(178, 'Kania', 'Podhum', 39),
	(179, 'Mercedes', 'Yala', 69),
	(180, 'Roderic', 'Mönhbulag', 51),
	(181, 'Shaine', 'Kiruru', 92),
	(182, 'Karel', 'Ennery', 31),
	(183, 'Rip', 'Ciudad Choluteca', 40),
	(184, 'Devinne', 'Xichehe', 54),
	(185, 'Thom', 'Tālīn', 27),
	(186, 'Verile', 'Bordeaux', 72),
	(187, 'Janean', 'Dayr as Sūdān', 60),
	(188, 'Pet', 'Tân Châu', 91),
	(189, 'Ambrosius', 'Guará', 74),
	(190, 'Tessie', 'Nagykanizsa', 34),
	(191, 'Orion', 'Daping', 66),
	(192, 'Dorene', 'Cucutilla', 42),
	(193, 'Arnoldo', 'Alenquer', 98),
	(194, 'Lorianne', 'Rokycany', 59),
	(195, 'Ave', 'Heshi', 79),
	(196, 'Gideon', 'Sila Lat', 98),
	(197, 'Minda', 'Dve Mogili', 50),
	(198, 'Melosa', 'Saint-Louis', 52),
	(199, 'Kizzee', 'Pępowo', 56),
	(200, 'Gavra', 'Sanjiang', 31),
	(201, 'Patsy', 'Stoczek', 63),
	(202, 'Creighton', 'Torrance', 37),
	(203, 'Lorraine', 'Xingtai', 23),
	(204, 'Pavia', 'Bordeaux', 83),
	(205, 'Halsy', 'Oliveira', 22),
	(206, 'Douglas', 'Rano', 71),
	(207, 'Sally', 'Saint-Sauveur', 71),
	(208, 'Leonanie', 'Mainit', 36),
	(209, 'Carmelita', 'Velyka Bahachka', 50),
	(210, 'Ryann', 'Saint-Gratien', 55),
	(211, 'Astrix', 'Nāgarpur', 23),
	(212, 'Bliss', 'Greenwood', 25),
	(213, 'Clarice', 'Kiarajangkung', 79),
	(214, 'Adan', 'Danao', 45),
	(215, 'Maire', 'Somita', 62),
	(216, 'Rene', 'Bogandinskiy', 41),
	(217, 'Raddie', 'Kaiama', 51),
	(218, 'Nissie', 'Gyeongsan-si', 86),
	(219, 'Jillene', 'Ţahţā', 33),
	(220, 'Sig', 'Żarki', 49),
	(221, 'Anabel', 'Botucatu', 61),
	(222, 'Hendrick', 'Drogomyśl', 52),
	(223, 'Lucian', 'Machico', 78),
	(224, 'Mattheus', 'Nyala', 58),
	(225, 'Ros', 'Blama', 60),
	(226, 'Ashleigh', 'Unity', 25),
	(227, 'Linell', 'Retenggoma', 80),
	(228, 'Conrad', 'Huayana', 67),
	(229, 'Diane', 'Belverde', 78),
	(230, 'Aileen', 'Aygepat', 20),
	(231, 'Fleurette', 'Santa Cruz do Bispo', 99),
	(232, 'Wernher', 'Pacarkeling', 57),
	(233, 'Zachary', 'Pingpu', 65),
	(234, 'Doll', 'Pyongyang', 40),
	(235, 'Eugine', 'Sal’sk', 97),
	(236, 'L,urette', 'Berbera', 94),
	(237, 'Valry', 'Tatuí', 95),
	(238, 'Jerrie', 'Muleba', 55),
	(239, 'Julina', 'Zhdanov', 22),
	(240, 'Ethyl', 'Housuo', 62),
	(241, 'Cullan', 'Berlin', 81),
	(242, 'Karyn', 'Agoo', 32),
	(243, 'Janis', 'Casal das Figueiras', 41),
	(244, 'Law', 'São João da Barra', 88),
	(245, 'Obidiah', 'Linshe', 79),
	(246, 'Gena', 'Youzha', 97),
	(247, 'Gisella', 'Wensu', 27),
	(248, 'Culley', 'Lajeosa do Mondego', 77),
	(249, 'Delano', 'Cashel', 60),
	(250, 'Uri', 'Hammam Sousse', 95),
	(251, 'Lindsay', 'Bako', 85),
	(252, 'Rocky', 'Sukpak', 70),
	(253, 'Padget', 'Makoko', 46),
	(254, 'Silvan', 'Rasskazovo', 71),
	(255, 'Erinna', 'Safi', 42),
	(256, 'Rhetta', 'Stepanivka', 61),
	(257, 'Ailbert', 'Laya', 49),
	(258, 'Brandi', 'Benito Juarez', 41),
	(259, 'Tamera', 'Kama', 96),
	(260, 'Liv', 'Hwawŏn', 90),
	(261, 'Veronique', 'Kushar', 20),
	(262, 'Dorice', 'Az Zuwaytīnah', 23),
	(263, 'Antonina', 'Rahayu Dua', 61),
	(264, 'Correy', 'Senneterre', 91),
	(265, 'Felice', 'Los Ángeles', 58),
	(266, 'Burton', 'Nauchnyy Gorodok', 34),
	(267, 'Whitman', 'Az Zabadānī', 48),
	(268, 'Merill', 'Costeira do Pirajubae', 31),
	(269, 'Jillana', 'Tours', 51),
	(270, 'Shaina', 'Jasionów', 93),
	(271, 'Modesta', 'Nailong', 48),
	(272, 'Francisca', 'Hujra', 90),
	(273, 'Wake', 'Papakura', 59),
	(274, 'Albrecht', 'Cambas', 27),
	(275, 'Claiborn', 'Guolemude', 70),
	(276, 'Dillie', 'Los Angeles', 53),
	(277, 'Cherin', 'Kratovo', 40),
	(278, 'Maryl', 'Roissy Charles-de-Gaulle', 91),
	(279, 'Roseann', 'Zaleszany', 79),
	(280, 'Glen', 'Karang Daye', 37),
	(281, 'Florry', 'Kalnibolotskaya', 65),
	(282, 'Gifford', 'Padamulya', 26),
	(283, 'Timothea', 'Kurmanayevka', 52),
	(284, 'Jermain', 'Banhā', 93),
	(285, 'Livvyy', 'Wanmingang', 30),
	(286, 'Gerardo', 'Thap Than', 49),
	(287, 'Nataniel', 'Överkalix', 35),
	(288, 'Jasun', 'Guinabsan', 40),
	(289, 'Buddie', 'Albacete', 96),
	(290, 'Cary', 'Oriximiná', 32),
	(291, 'Lilas', 'Huamu', 42),
	(292, 'Calvin', 'T’ianet’i', 60),
	(293, 'Luca', 'Utabi', 78),
	(294, 'Trudie', 'La Unión', 82),
	(295, 'Donica', 'Bulo', 79),
	(296, 'Basilius', 'Fomento', 87),
	(297, 'Winonah', 'Esigodini', 98),
	(298, 'Franni', 'Ujung', 42),
	(299, 'Giulietta', 'Yiqian', 98),
	(300, 'Petronilla', 'Georgiyevskaya', 52),
	(301, 'Stafani', 'Liqiao', 86),
	(302, 'Catherina', 'Krajan Dermawuharjo', 92),
	(303, 'Eugen', 'Cururupu', 55),
	(304, 'Dahlia', 'Banjar Pedawa', 31),
	(305, 'Shandie', 'Xinpu', 77),
	(306, 'Jonathan', 'Tamanar', 44),
	(307, 'Conrad', 'Kousa', 95),
	(308, 'Mathilde', 'La Victoria', 66),
	(309, 'Duky', 'Chaiyaphum', 20),
	(310, 'Charlie', 'Lordelo', 93),
	(311, 'Udall', 'Inongo', 86),
	(312, 'Glori', 'Lianyuan', 99),
	(313, 'Chandal', 'Nauchnyy Gorodok', 56),
	(314, 'Beilul', 'Shimen', 80),
	(315, 'Terrel', 'Kuala Terengganu', 40),
	(316, 'Maxim', 'Hengyang', 55),
	(317, 'Ade', 'Tourcoing', 37),
	(318, 'Abba', 'Cordova', 22),
	(319, 'Murry', 'Santa Lucía', 37),
	(320, 'Cherey', 'Malgobek', 100),
	(321, 'Dorelia', 'Jianping', 48),
	(322, 'Jobye', 'Charlotte', 67),
	(323, 'Roz', 'Kankara', 52),
	(324, 'Archy', 'Hatavch', 70),
	(325, 'Zia', 'Aygestan', 99),
	(326, 'Paloma', 'Charlotte', 25),
	(327, 'Bancroft', 'Zīrakī', 53),
	(328, 'Mohammed', 'Taiping', 61),
	(329, 'Lissy', 'Casselman', 69),
	(330, 'Antonino', 'Reda', 60),
	(331, 'Aristotle', 'Radnice', 48),
	(332, 'Lucine', 'Sabá', 86),
	(333, 'Jacinda', 'Hodoš', 61),
	(334, 'Dorene', 'Klishkivtsi', 56),
	(335, 'Wyatan', 'Zala', 90),
	(336, 'Stacie', 'Shymkent', 29),
	(337, 'Ophelie', 'Cihambali', 80),
	(338, 'Penrod', 'Sarirejo Satu', 93),
	(339, 'Saul', 'Fonte Boa', 95),
	(340, 'Lyda', 'Jambesari', 20),
	(341, 'Jesus', 'Chibombo', 24),
	(342, 'Meg', 'Laiyang', 97),
	(343, 'Riordan', 'Xiaxihao', 55),
	(344, 'Kelci', 'Ditsaan', 32),
	(345, 'Yolande', 'Francisco I Madero', 97),
	(346, 'Marielle', 'Cihaur', 61),
	(347, 'Paula', 'Rubio', 77),
	(348, 'Philbert', 'Maswa', 65),
	(349, 'Ros', 'Ono', 22),
	(350, 'Giana', 'Presidente Epitácio', 81),
	(351, 'Shelia', 'Thị Trấn Nga Sơn', 24),
	(352, 'Howey', 'Wenshao', 24),
	(353, 'Ferguson', 'Binucayan', 18),
	(354, 'Kessia', 'Brisbane', 52),
	(355, 'Morten', 'Štitar', 31),
	(356, 'Tann', 'Outing', 50),
	(357, 'Aigneis', 'Jiapeng', 38),
	(358, 'Benn', 'Amagasaki', 55),
	(359, 'Em', 'Boende', 89),
	(360, 'Truda', 'Boston', 25),
	(361, 'Marrissa', 'Piraju', 100),
	(362, 'Rory', 'Mandalay', 44),
	(363, 'Torry', 'Imider', 96),
	(364, 'Camellia', 'Qiubin', 63),
	(365, 'Umeko', 'Altenberg bei Linz', 63),
	(366, 'Larine', 'Daytona Beach', 62),
	(367, 'Raff', 'Abaza', 86),
	(368, 'Humfrey', 'Jiangning', 38),
	(369, 'Javier', 'Mingyu', 25),
	(370, 'Feliza', 'San Carlos de Bolívar', 90),
	(371, 'Alaster', 'Almirante Tamandaré', 71),
	(372, 'Filip', 'Conchal', 67),
	(373, 'Martha', 'Tân Hòa', 49),
	(374, 'Chadd', 'Büzmeýin', 62),
	(375, 'Steffen', 'Marelesu', 21),
	(376, 'Jory', 'Hatogaya-honchō', 39),
	(377, 'Niels', 'Sindangjawa', 93),
	(378, 'Orion', 'Longxing', 51),
	(379, 'Bard', 'Yaring', 85),
	(380, 'Janeczka', 'Palangue', 93),
	(381, 'Abelard', 'Raheny', 85),
	(382, 'Orville', 'Xai-Xai', 49),
	(383, 'Humfrey', 'Yitulihe', 83),
	(384, 'Katey', 'Angkup', 22),
	(385, 'Fields', 'Urjala', 26),
	(386, 'Frederica', 'Kalde Panga', 92),
	(387, 'Constantina', 'Pejibaye', 50),
	(388, 'Zedekiah', 'Koumac', 29),
	(389, 'Jarib', 'Francisco I Madero', 92),
	(390, 'Abbott', 'Engel’-Yurt', 66),
	(391, 'Brittani', 'Baishi', 39),
	(392, 'Teirtza', 'Sanli', 94),
	(393, 'Gwyneth', 'Remedios', 52),
	(394, 'Lanette', 'Murcia', 53),
	(395, 'Natalya', 'Yanhe', 30),
	(396, 'Odelia', 'Guaratuba', 69),
	(397, 'Mercie', 'Gostovići', 37),
	(398, 'Shannon', 'Lopatinskiy', 89),
	(399, 'Margaretha', 'Shanmu', 94),
	(400, 'Boycie', 'Kafachan', 72),
	(401, 'Bank', 'Hongchuan', 19),
	(402, 'Wilhelm', 'Venilale', 27),
	(403, 'Nickolaus', 'Havlíčkův Brod', 28),
	(404, 'Frans', 'Oslo', 30),
	(405, 'Ferdie', 'Ala-Buka', 48),
	(406, 'Shadow', 'Kemiri Daya', 19),
	(407, 'Marten', 'Karpokhórion', 22),
	(408, 'Tudor', 'Marseille', 36),
	(409, 'Janella', 'Maomiaoji', 44),
	(410, 'Shellie', 'San Pablo', 54),
	(411, 'Rodrique', 'Américo Brasiliense', 90),
	(412, 'Leoine', 'Blatná', 46),
	(413, 'Kissiah', 'Heqiao', 94),
	(414, 'Marline', 'La Esperanza', 79),
	(415, 'Kalinda', 'Castêlo', 67),
	(416, 'Clarette', 'Brunssum', 59),
	(417, 'Jerad', 'Joroinen', 33),
	(418, 'Robin', 'Zhoutou', 34),
	(419, 'Pamelina', 'Ete', 59),
	(420, 'Cathi', 'Thị Trấn Nghèn', 73),
	(421, 'Philippine', 'Tijão', 33),
	(422, 'Munmro', 'Nekrasovka', 86),
	(423, 'Philis', 'Morales', 32),
	(424, 'Matias', 'Västanfjärd', 47),
	(425, 'Adeline', 'Nizhniy Dzhengutay', 20),
	(426, 'Marc', 'Franca', 36),
	(427, 'Wilburt', 'Paujiles', 81),
	(428, 'Vivianne', 'Iwase', 60),
	(429, 'Betti', 'Yueshan', 55),
	(430, 'Maximilian', 'Starcevica', 20),
	(431, 'Emmaline', 'Créteil', 92),
	(432, 'Ellene', 'Vanáton', 98),
	(433, 'Leland', 'Karangsonojabon', 54),
	(434, 'Ebonee', 'Victoria', 89),
	(435, 'Celestyna', 'Masuguru', 76),
	(436, 'Maure', 'Kaišiadorys', 40),
	(437, 'Emelyne', 'Castainço', 39),
	(438, 'Broderic', 'Fengmu', 54),
	(439, 'Tulley', 'Stari Grad', 56),
	(440, 'Kizzie', 'Jiujie', 85),
	(441, 'Bree', 'La Esperanza', 25),
	(442, 'Franciskus', 'San Marcos', 25),
	(443, 'Laurice', 'Longqiao', 48),
	(444, 'Rayner', 'Túquerres', 48),
	(445, 'Feodor', 'Batken', 78),
	(446, 'Richardo', 'Unaí', 24),
	(447, 'Casi', 'Graz', 74),
	(448, 'Ruttger', 'Kungshamn', 100),
	(449, 'Joellen', 'Cikadongdong', 41),
	(450, 'Debor', 'Garupá', 65),
	(451, 'Kylie', 'Boyuibe', 69),
	(452, 'Florrie', 'Daijiaba', 78),
	(453, 'Mariska', 'San Cristóbal', 56),
	(454, 'Thatcher', 'Barreiro do Jaíba', 42),
	(455, 'Leanora', 'Bato', 47),
	(456, 'Mohandis', 'Plottier', 62),
	(457, 'Herbie', 'Bojonggaling', 57),
	(458, 'Maurene', 'Czarna Białostocka', 61),
	(459, 'Ellynn', 'Fujia', 19),
	(460, 'Jean', 'Biryulëvo Zapadnoye', 51),
	(461, 'Eden', 'Xinpeicun', 58),
	(462, 'Becka', 'Aramecina', 21),
	(463, 'Wandie', 'Kupchino', 35),
	(464, 'Granville', 'San Rafael', 71),
	(465, 'Candi', 'Vendargues', 66),
	(466, 'Cori', 'Roissy Charles-de-Gaulle', 82),
	(467, 'Orel', 'Santa Teresa', 73),
	(468, 'Tally', 'Espanola', 94),
	(469, 'Francklin', 'Patani', 81),
	(470, 'Marijn', 'Druju', 62),
	(471, 'Cindelyn', 'Brades', 26),
	(472, 'Dalenna', 'Novoarkhanhel’s’k', 68),
	(473, 'Miriam', 'Banayoyo', 63),
	(474, 'Wang', 'Lokorae', 72),
	(475, 'Alick', 'Shijiao', 97),
	(476, 'Denny', 'Sfax', 89),
	(477, 'Paulette', 'Stodolishche', 22),
	(478, 'Othilia', 'Obroshyne', 63),
	(479, 'Byram', 'Bherāmāra', 88),
	(480, 'Lanny', 'Ibaraki', 62),
	(481, 'Carena', 'Ostankinskiy', 93),
	(482, 'Merrill', 'Paranaguá', 21),
	(483, 'Dione', 'Kuznechikha', 69),
	(484, 'Derry', 'Tiepu', 49),
	(485, 'Jena', 'Riihimäki', 31),
	(486, 'Mick', 'Funabashi', 72),
	(487, 'Bernadina', 'Balad', 47),
	(488, 'Giavani', 'Hujigou', 46),
	(489, 'Warde', 'Dayrūţ', 55),
	(490, 'Kristina', 'Yushang', 90),
	(491, 'Amalita', 'Karangmulya', 61),
	(492, 'Lynelle', 'Alofi', 24),
	(493, 'Eimile', 'Zhoushizhuang', 95),
	(494, 'Maxie', 'Lourdes', 96),
	(495, 'Merilee', 'Datang', 62),
	(496, 'Sander', 'Taghazout', 88),
	(497, 'Francine', 'Tanjung', 31),
	(498, 'Trevor', 'Xiongzhang', 72),
	(499, 'Sven', 'Koźmin Wielkopolski', 67),
	(500, 'Billy', 'Sandaowan', 89),
	(501, 'Mordecai', 'Kaliro', 70),
	(502, 'Sal', 'Tours', 100),
	(503, 'Aileen', 'Santa Rosa', 40),
	(504, 'Skippie', 'Lesuhe', 65),
	(505, 'Brice', 'Dieppe', 28),
	(506, 'Linnea', 'Banjar Tengah', 46),
	(507, 'Jeffrey', 'Kihangara', 60),
	(508, 'Deane', 'Alajuela', 36),
	(509, 'Sandy', 'Lagoa', 20),
	(510, 'Marthe', 'Neópolis', 28),
	(511, 'Analiese', 'Zakan-Yurt', 38),
	(512, 'Meryl', 'Khao Yoi', 56),
	(513, 'Daveen', 'Sebewe', 30),
	(514, 'Arri', 'Baiyin', 84),
	(515, 'Alikee', 'Paulo Afonso', 60),
	(516, 'Michaella', 'Igreja', 29),
	(517, 'Alf', 'Diavatá', 88),
	(518, 'Faun', 'Nzérékoré', 20),
	(519, 'Nikki', 'Kelodan', 61),
	(520, 'Cirilo', 'Lahad Datu', 72),
	(521, 'Danna', 'Lafiagi', 91),
	(522, 'Moise', 'Sogcho', 45),
	(523, 'Helaina', 'San Luis del Palmar', 57),
	(524, 'Rhoda', 'Non Suwan', 84),
	(525, 'Charin', 'Jinsha', 80),
	(526, 'Quill', 'Chiang Yuen', 66),
	(527, 'Roderic', 'Páno Polemídia', 33),
	(528, 'Carolin', 'Oklahoma City', 36),
	(529, 'Mareah', 'Duyên Hải', 50),
	(530, 'Ario', 'Alurbulu', 48),
	(531, 'Bernadine', 'Pisarzowice', 26),
	(532, 'Vina', 'Lukavec', 72),
	(533, 'Rozamond', 'Göteborg', 87),
	(534, 'Garnette', 'Qijiazuo', 27),
	(535, 'Rodger', 'Strängnäs', 40),
	(536, 'Dexter', 'Ondangwa', 80),
	(537, 'Vincent', 'Sölvesborg', 35),
	(538, 'Ophelia', 'Studená', 56),
	(539, 'Ignace', 'El Benque', 25),
	(540, 'Melosa', 'Dalu', 84),
	(541, 'Dorolice', 'Rzhev', 36),
	(542, 'Brewster', 'Hucun', 58),
	(543, 'Katine', 'Kyrenia', 86),
	(544, 'Gilberta', 'Botlhapatlou', 62),
	(545, 'Ichabod', 'Coasa', 92),
	(546, 'Evanne', 'Sarrazola', 26),
	(547, 'Marquita', '‘Irbīn', 86),
	(548, 'Sabina', 'Kwaluseni', 77),
	(549, 'Aliza', 'Criciúma', 100),
	(550, 'Carlotta', 'Plaeng Yao', 62),
	(551, 'Irina', 'Ōmura', 86),
	(552, 'Michelina', 'Patitírion', 63),
	(553, 'Abram', 'Hanshou', 53),
	(554, 'Rowen', 'Jiyang', 47),
	(555, 'Merell', 'Borzytuchom', 35),
	(556, 'Philipa', 'Noenoni', 41),
	(557, 'Creighton', 'Rodez', 66),
	(558, 'Avram', 'Caxias do Sul', 76),
	(559, 'Micah', 'Lubin', 39),
	(560, 'Rurik', 'Taipingchuan', 54),
	(561, 'Betteanne', 'Banjar Medura', 81),
	(562, 'Tito', 'Saxin', 92),
	(563, 'Johnna', 'Haradok', 44),
	(564, 'Brook', 'Herálec', 99),
	(565, 'Willard', 'Progreso', 82),
	(566, 'Brew', 'Colcabamba', 100),
	(567, 'Gwen', 'Belém', 46),
	(568, 'Orella', 'Cam Lộ', 58),
	(569, 'Felecia', 'Madamba', 23),
	(570, 'Field', 'Decatur', 31),
	(571, 'Ibbie', 'Enewetak', 22),
	(572, 'Tabby', 'Normanton', 55),
	(573, 'Prue', 'Aldeia da Piedade', 59),
	(574, 'Shae', 'Centro Habana', 75),
	(575, 'Becky', 'Ban Na Muang', 53),
	(576, 'Myron', 'Gabaldon', 30),
	(577, 'Corabel', 'Krasni Okny', 76),
	(578, 'Artemus', 'Fleury-les-Aubrais', 52),
	(579, 'Lauretta', 'Old Kilcullen', 25),
	(580, 'Emlynne', 'Hongmiao', 40),
	(581, 'Thomasina', 'Bujanovac', 24),
	(582, 'Hillary', 'Kletek', 54),
	(583, 'Jayme', 'Raci Kulon', 31),
	(584, 'Georgeanne', 'Butou', 34),
	(585, 'Pamella', 'Langxi', 96),
	(586, 'Flinn', 'Lagos', 79),
	(587, 'Cathy', 'Seka', 56),
	(588, 'Cristina', 'Zhantang', 32),
	(589, 'Skipper', 'Jawhar', 32),
	(590, 'Celie', 'Tsowkêy', 39),
	(591, 'Priscilla', 'Magumeri', 95),
	(592, 'Erik', 'La Mula', 47),
	(593, 'Derrik', 'Longquan', 67),
	(594, 'Tyrus', 'Corgo', 66),
	(595, 'Wilton', 'Keroak', 91),
	(596, 'Pascal', 'Svenljunga', 88),
	(597, 'Dolorita', 'El Cafetal', 75),
	(598, 'Cobbie', 'Yanjiang', 63),
	(599, 'Winonah', 'Chitungwiza', 43),
	(600, 'Georg', 'Jovim', 19),
	(601, 'Corbin', 'Izumi', 94),
	(602, 'Celene', 'União dos Palmares', 61),
	(603, 'Olia', 'Albrechtice', 57),
	(604, 'Filippo', 'Shipaidong', 73),
	(605, 'Stillmann', 'Kuiyong', 96),
	(606, 'Evvy', 'Schirmeck', 96),
	(607, 'Marlin', 'Novo Selo', 39),
	(608, 'Ring', 'Prnjavor', 98),
	(609, 'Sibylle', 'Namyangju', 49),
	(610, 'Juliana', 'Huarong', 91),
	(611, 'Joe', 'Jiucaizhuang', 46),
	(612, 'Roosevelt', 'Myski', 87),
	(613, 'Stesha', 'Orlândia', 90),
	(614, 'Jarid', 'Novyy Svit', 20),
	(615, 'Davin', 'San José de Miranda', 45),
	(616, 'Roland', 'Laiyang', 41),
	(617, 'Zola', 'Quintas', 66),
	(618, 'Lorant', 'Peddie', 32),
	(619, 'Robinett', 'Kiryandongo', 27),
	(620, 'Pepi', 'El Bagre', 20),
	(621, 'Bobina', 'Tullinge', 76),
	(622, 'Dion', 'Ruše', 28),
	(623, 'Persis', 'Guangshan', 60),
	(624, 'Tammara', 'Saribudolok', 37),
	(625, 'Giorgia', 'Guérande', 64),
	(626, 'Pennie', 'La Habana Vieja', 33),
	(627, 'Godfrey', 'Ezeiza', 20),
	(628, 'Jephthah', 'Sundsvall', 87),
	(629, 'Sonnnie', 'Arnage', 63),
	(630, 'Alica', 'Pakisrejo', 57),
	(631, 'Dianna', 'Oslo', 67),
	(632, 'Beret', 'San Patricio', 36),
	(633, 'Kerwin', 'Alençon', 85),
	(634, 'Elisha', 'Chiri-Yurt', 80),
	(635, 'Brooke', 'Shahe', 18),
	(636, 'Brenn', 'Al Muwayh', 40),
	(637, 'Sibyl', 'Tajan', 23),
	(638, 'Bentlee', 'Reforma', 94),
	(639, 'Nolan', 'Nemuro', 68),
	(640, 'Shelly', 'Alicante/Alacant', 92),
	(641, 'Cecile', 'Passa Quatro', 80),
	(642, 'Hermon', 'Hermanus', 84),
	(643, 'Kriste', 'Skhira', 34),
	(644, 'Freida', 'Skole', 76),
	(645, 'Irwin', 'Nanxiang', 77),
	(646, 'Shoshanna', 'Gulong', 41),
	(647, 'Ax', 'Smiřice', 72),
	(648, 'Lambert', 'Goris', 21),
	(649, 'Shem', 'Zhuge', 59),
	(650, 'Alys', 'Albanel', 23),
	(651, 'Gaven', 'Takamatsu-shi', 71),
	(652, 'Shayna', 'Scottsdale', 34),
	(653, 'Karlyn', 'Posse', 84),
	(654, 'Glenden', 'Ollantaytambo', 29),
	(655, 'Shanna', 'Yuanyang Zhen', 52),
	(656, 'Moina', 'Yangxunqiao', 25),
	(657, 'Jarrett', 'Molagavita', 41),
	(658, 'Westley', 'Güiria', 24),
	(659, 'Gaston', 'Jales', 65),
	(660, 'Ilyse', 'Ogwashi-Uku', 58),
	(661, 'Randolph', 'Molinos', 27),
	(662, 'Lester', 'Moscow', 22),
	(663, 'Julieta', 'Santo Domingo', 61),
	(664, 'Antoni', 'Babice', 93),
	(665, 'Ibby', 'Marcos Juárez', 30),
	(666, 'Artair', 'Dejilin', 97),
	(667, 'Minette', 'Pangani', 68),
	(668, 'Brook', 'Nkayi', 30),
	(669, 'Royce', 'Hacıqabul', 80),
	(670, 'Lars', 'Malitbog', 93),
	(671, 'Waylon', 'Guanting', 55),
	(672, 'Dunn', 'Herálec', 64),
	(673, 'Granville', 'Dordrecht', 62),
	(674, 'Wynn', 'Heliconia', 43),
	(675, 'Leyla', 'Şanā’', 91),
	(676, 'Libby', 'Bokani', 60),
	(677, 'Adoree', 'Guabito', 38),
	(678, 'Bendite', 'Laylay', 18),
	(679, 'Maryjane', 'Rudna Mała', 82),
	(680, 'Babbie', 'São Lourenço do Sul', 81),
	(681, 'Dorris', 'El Carmen de Bolívar', 20),
	(682, 'Joya', 'Sindangan', 70),
	(683, 'Walton', 'Bābol', 66),
	(684, 'Luis', 'Huangwan', 86),
	(685, 'Roderich', 'Barcelona', 21),
	(686, 'Beaufort', 'Matadi', 74),
	(687, 'Roz', 'Manisi', 55),
	(688, 'Lucretia', 'Fanyang', 31),
	(689, 'Natal', 'Ilha de Moçambique', 50),
	(690, 'Quentin', 'Lapuan', 22),
	(691, 'Jorge', 'Xiyang', 60),
	(692, 'Brendin', 'Karney Shomron', 64),
	(693, 'Adan', 'Gancheng', 100),
	(694, 'Jo-anne', 'Mataigou', 67),
	(695, 'Minerva', 'Bayasgalant', 23),
	(696, 'Web', '‘Afīf', 37),
	(697, 'Davidson', 'Sidikalang', 79),
	(698, 'Leonanie', 'Acas', 98),
	(699, 'Erica', 'Oneop', 89),
	(700, 'Justina', 'Kampokpok', 96),
	(701, 'Jess', 'Pofadder', 33),
	(702, 'Maiga', 'Fuenlabrada', 55),
	(703, 'Idalia', 'Caoyan', 75),
	(704, 'Bernarr', 'Staryy Urukh', 38),
	(705, 'Dusty', 'Xinfeng', 30),
	(706, 'Dolph', 'Isahaya', 97),
	(707, 'Mirilla', 'Tawangrejo', 58),
	(708, 'Rosella', 'Tsimlyansk', 56),
	(709, 'Elisabetta', 'Open Stage', 90),
	(710, 'Buffy', 'Kawanishi', 93),
	(711, 'Mel', 'Shiqiao', 90),
	(712, 'Melodee', 'Carmen', 50),
	(713, 'Fayina', 'Elato', 52),
	(714, 'Teodorico', 'Kobrinskoye', 32),
	(715, 'Cyndy', 'Spas', 20),
	(716, 'Lamont', 'Banjar Tiga', 100),
	(717, 'Mollee', 'Tsinandali', 85),
	(718, 'Ambrose', 'Ciburial', 86),
	(719, 'Phaedra', 'København', 98),
	(720, 'Robbin', 'Cachadinha', 66),
	(721, 'Gian', 'Yaita', 30),
	(722, 'Abigail', 'Rappang', 70),
	(723, 'Danit', 'Handegate', 89),
	(724, 'Patrizio', 'Wojciechów', 93),
	(725, 'Brien', 'Handaqi', 64),
	(726, 'Vivian', 'Porto União', 44),
	(727, 'Gayel', 'Myanaung', 87),
	(728, 'Merwyn', 'Curuggoong', 25),
	(729, 'Renault', 'Mulhouse', 63),
	(730, 'Karel', 'Beihuaidian', 36),
	(731, 'Phillis', 'Johor Bahru', 54),
	(732, 'Yoshiko', 'Hirado', 22),
	(733, 'Felicity', 'Nagbukel', 83),
	(734, 'Nicholle', 'Xiangrong', 38),
	(735, 'Stanfield', 'Bílovice', 22),
	(736, 'Dwight', 'Jiamachi', 63),
	(737, 'Lyman', 'La Guama', 21),
	(738, 'Luelle', 'Lazaro Cardenas', 35),
	(739, 'Alleen', 'Wilmington', 86),
	(740, 'Pearce', 'Beiwenquan', 76),
	(741, 'Mil', 'Yidu', 37),
	(742, 'Cesar', 'Envigado', 28),
	(743, 'Nanette', 'Long Thành', 78),
	(744, 'Sapphire', 'Grzmiąca', 35),
	(745, 'Raddy', 'Sindangsuka', 88),
	(746, 'Esteban', 'Sipirok', 55),
	(747, 'Kevan', 'Thatèng', 80),
	(748, 'Abelard', 'Miyata', 72),
	(749, 'Freddie', 'Daliyuan', 79),
	(750, 'Cinnamon', 'Marne-la-Vallée', 38),
	(751, 'Rebe', 'Nato', 88),
	(752, 'Marje', 'Lavradio', 27),
	(753, 'Gian', 'Komyshany', 41),
	(754, 'Wally', 'Postmasburg', 61),
	(755, 'Lorelei', 'Bobigny', 34),
	(756, 'Neill', 'Rio Piracicaba', 64),
	(757, 'Lockwood', 'Artesianón', 99),
	(758, 'Wernher', 'Bandar-e Ganāveh', 53),
	(759, 'Norbert', 'Kao Liao', 86),
	(760, 'Genni', 'Tintafor', 35),
	(761, 'Heida', 'Cortes', 59),
	(762, 'Othilia', 'Bohicon', 97),
	(763, 'Darcy', 'Ágios Týchon', 22),
	(764, 'Darill', 'Olenegorsk', 79),
	(765, 'Ajay', 'New York City', 81),
	(766, 'Doyle', 'Korolev', 26),
	(767, 'Paola', 'Chinameca', 39),
	(768, 'Tony', 'Şafāshahr', 23),
	(769, 'Rivi', 'Aketi', 74),
	(770, 'Nada', 'Legok', 83),
	(771, 'Barbee', 'Tsuma', 89),
	(772, 'Julissa', 'Talnakh', 81),
	(773, 'Ada', 'Xiabao', 52),
	(774, 'Menard', 'San Pedro', 47),
	(775, 'Kassie', 'Konkwesso', 34),
	(776, 'Annis', 'Pawłosiów', 36),
	(777, 'Lanny', 'Yangxu', 45),
	(778, 'Dre', 'Bela Vista', 99),
	(779, 'Freddie', 'Canoinhas', 44),
	(780, 'Jesus', 'Las Vegas', 96),
	(781, 'Warde', 'Salcedo', 53),
	(782, 'Franklyn', 'Chengshan', 50),
	(783, 'Wilden', 'Yevlakh', 66),
	(784, 'Stanford', 'Brunssum', 66),
	(785, 'Kelsey', 'Chybie', 56),
	(786, 'Marquita', 'Changle', 79),
	(787, 'Felicia', 'Għaxaq', 59),
	(788, 'Oby', 'Baima', 18),
	(789, 'Kingsley', 'Benghazi', 85),
	(790, 'Alic', 'Póvoa', 54),
	(791, 'Bert', 'Ningmute', 25),
	(792, 'Orrin', 'Höshigiyn-Ar', 46),
	(793, 'Mildred', 'Gutalac', 36),
	(794, 'Averell', 'Guadalupe', 73),
	(795, 'Clive', 'Tashkent', 61),
	(796, 'Trudi', 'Haolibao', 26),
	(797, 'Ahmed', 'Adelaide Mail Centre', 84),
	(798, 'Guendolen', 'Oranjestad', 100),
	(799, 'Alain', 'Lumbatan', 19),
	(800, 'Quinn', 'Shebekino', 85),
	(801, 'Dodi', 'Kuanheum', 49),
	(802, 'Daniel', 'Summerland', 94),
	(803, 'Aviva', 'Xintang', 18),
	(804, 'Marcellina', 'Bulan', 54),
	(805, 'Carlye', 'Bayan Tuohai', 99),
	(806, 'Devinne', 'Maringá', 81),
	(807, 'Shela', 'Kimitsu', 85),
	(808, 'Zorina', 'Sebu', 51),
	(809, 'Mechelle', 'Goya', 21),
	(810, 'Glenn', 'Río Limpio', 30),
	(811, 'Misti', 'Juazeiro do Norte', 95),
	(812, 'Orella', 'Les Sables-d''Olonne', 34),
	(813, 'Cristin', 'Põltsamaa', 40),
	(814, 'Jobie', 'Loma Bonita', 67),
	(815, 'Josie', 'Mapalad', 20),
	(816, 'Ursula', 'Pancan', 26),
	(817, 'Chariot', 'Baz', 26),
	(818, 'Pall', 'Pingpo', 52),
	(819, 'Mala', 'Duancun', 74),
	(820, 'Rania', 'Munjul', 56),
	(821, 'Ali', 'Masis', 92),
	(822, 'Carmella', 'General Levalle', 24),
	(823, 'Fanchon', 'Saga', 34),
	(824, 'Wilt', 'Znamenka', 51),
	(825, 'Reube', 'Qintong', 56),
	(826, 'Tawnya', 'Teresópolis', 96),
	(827, 'Jed', 'Sabá', 63),
	(828, 'Dorotea', 'Azara', 75),
	(829, 'Marshal', 'Siaya', 31),
	(830, 'Aleda', 'Simões Filho', 34),
	(831, 'Baldwin', 'Dazu', 70),
	(832, 'Kip', 'Libušín', 32),
	(833, 'Delinda', 'Dehui', 32),
	(834, 'Mia', 'Bardīyah', 51),
	(835, 'Cordy', 'Batagay-Alyta', 94),
	(836, 'Carolynn', 'Jishan', 48),
	(837, 'Ronald', 'Colcabamba', 50),
	(838, 'Virgina', 'Hīrna', 45),
	(839, 'Ellis', 'Ampahana', 31),
	(840, 'Sullivan', 'Zebrzydowice', 65),
	(841, 'Gregorio', 'Ban Phan Don', 58),
	(842, 'Nanny', 'Sehwān', 49),
	(843, 'Bettye', 'Wufeng', 98),
	(844, 'Caitlin', 'Ban Dung', 55),
	(845, 'Selene', 'Narsaq', 86),
	(846, 'Clayson', 'Lukavec', 67),
	(847, 'Hanny', 'Briceni', 59),
	(848, 'Carmelle', 'Cibingbin', 86),
	(849, 'Elset', 'Zumiao', 34),
	(850, 'Howie', 'Nice', 29),
	(851, 'Matthias', 'Tānsen', 52),
	(852, 'Shae', 'Tiantai Chengguanzhen', 62),
	(853, 'Casandra', 'Kuching', 100),
	(854, 'Chev', 'Hilotongan', 38),
	(855, 'Wylie', 'Alarobia', 71),
	(856, 'Erminia', 'Keles Timur', 19),
	(857, 'Nonna', 'Vyksa', 43),
	(858, 'Beilul', 'Hufang', 32),
	(859, 'Royce', 'Wanjiazhuang', 71),
	(860, 'Renelle', 'Minsk', 71),
	(861, 'Patin', 'La Unión', 82),
	(862, 'Jordana', 'Jinli', 35),
	(863, 'Udale', 'Abua', 58),
	(864, 'Anselm', 'Podgortsy', 81),
	(865, 'Zabrina', 'Ichupampa', 22),
	(866, 'Ronny', 'Rana', 21),
	(867, 'Dennie', 'Hengshitang', 56),
	(868, 'Gwendolyn', 'Kislyakovskaya', 48),
	(869, 'Matthew', 'Saxin', 64),
	(870, 'Deeyn', 'Drezdenko', 34),
	(871, 'Lars', 'Letlhakeng', 43),
	(872, 'Reynolds', 'Nikulino', 89),
	(873, 'Westbrook', 'Santiago Nonualco', 64),
	(874, 'Thatch', 'La Plaine-Saint-Denis', 64),
	(875, 'Myrta', 'Pravda', 96),
	(876, 'Kassandra', 'Maragogipe', 30),
	(877, 'Bernadine', 'Sim', 82),
	(878, 'Jobey', 'San Martín', 87),
	(879, 'Chiquia', 'Lokorae', 80),
	(880, 'Mab', 'Matarraque', 23),
	(881, 'Chester', 'Armamar', 20),
	(882, 'Carita', 'Paterson', 27),
	(883, 'Timofei', 'Gonbad-e Kāvūs', 75),
	(884, 'Ferrel', 'Marapat', 20),
	(885, 'Nilson', 'Sundbyberg', 36),
	(886, 'Shae', 'Balibagan Oeste', 18),
	(887, 'Gui', 'Verkhnyaya Toyma', 35),
	(888, 'Merrill', 'Cimanggu', 56),
	(889, 'Ruddy', 'Krajan Tengah', 59),
	(890, 'Kirby', 'Kedatuan', 23),
	(891, 'Denni', 'Shikhazany', 26),
	(892, 'Brnaba', 'Tiandu', 79),
	(893, 'Wolfie', 'Lipie', 78),
	(894, 'Fionnula', 'Iwo', 58),
	(895, 'Franklyn', 'Mingfeng', 76),
	(896, 'Wat', 'Cartagena', 54),
	(897, 'Nikki', 'Beauvais', 94),
	(898, 'Kacy', 'Cipicung', 35),
	(899, 'Harlen', 'RMI Capitol', 57),
	(900, 'Jacquenetta', 'Stará Paka', 18)
GO

--Verificar datos de tabla
SELECT * FROM Ciudadano
SELECT COUNT (*) FROM Ciudadano 

--4 Cree 3 filegroups, llamados Ciudadano1, Ciudadano2 y Ciudadano3
ALTER DATABASE Empresa
ADD FILEGROUP Ciudadano1
GO

ALTER DATABASE Empresa
ADD FILEGROUP Ciudadano2
GO

ALTER DATABASE Empresa
ADD FILEGROUP Ciudadano3
GO

--5 Cree los archivos adicionales .ndf indique size y filegrowth 20bm y 30% respectivamente, adjunte captura del directorio
ALTER DATABASE Empresa
ADD FILE (NAME=FGCiudadano1, FILENAME = 'C:\ADBD\Ciudadano1.ndf',
	SIZE= 20MB, FILEGROWTH =30%) TO FILEGROUP Ciudadano1
GO

ALTER DATABASE Empresa
ADD FILE (NAME=FGCiudadano2, FILENAME = 'C:\ADBD\Ciudadano2.ndf',
	SIZE= 20MB, FILEGROWTH =30%) TO FILEGROUP Ciudadano2
GO
ALTER DATABASE Empresa
ADD FILE (NAME=FGCiudadano3, FILENAME = 'C:\ADBD\Ciudadano3.ndf',
	SIZE= 20MB, FILEGROWTH =30%) TO FILEGROUP Ciudadano3
GO

--6 Cree la función de partición
CREATE PARTITION FUNCTION FN_CiudadParticion (VARCHAR(150))
AS RANGE LEFT
FOR VALUES ('J','S')
GO

--7 Cree el esquema de partición, este realizará la partición por ciudad en orden alfabético 
CREATE PARTITION SCHEME EsquemaPartition AS PARTITION FN_CiudadParticion --utiliza la funcion de particion 
TO (Ciudadano1, Ciudadano2, Ciudadano3)
GO

--8 Al insertar en la tabla nuevos registros, deberá filtrarse por ciudad e insertar en la partición correspondiente / Adjunte captura de un select que muestre datos en cada partición
INSERT INTO Ciudadano (IDCiudadano, Nombre, Ciudad, Edad)
VALUES (901, 'Dereck', 'Alajuela', 28),
       (902, 'Allan', 'Limón', 33),
       (903, 'Mathias', 'Venecia', 40);
GO

SELECT IDCiudadano, Nombre, Ciudad, $PARTITION.FN_CiudadParticion(Ciudad) AS Particion, Edad
FROM Ciudadano;
GO

--9 Haga un insert de 3 registros manera que quede un registro se inserte en Ciudadano1, Ciudadano2 y Ciudadano3
INSERT INTO Ciudadano (IDCiudadano, Nombre, Ciudad, Edad)
VALUES 
	(904, 'Juan', 'Monaco', 27),
	(905, 'Pedro', 'Barcelona', 37),
	(906, 'María', 'Tilaran', 41)
GO

--10 Haga un select y muestre los últimos 3 registros insertados mostrando en cuál partición quedó insertado / Adjunte captura
SELECT TOP 3 IDCiudadano, Nombre, Ciudad, $PARTITION.FN_CiudadParticion(Ciudad) AS Particion, Edad
FROM Ciudadano
ORDER BY IDCiudadano DESC;
GO

--11 Adjunte el archivo sql con el nombre Lab4NOMBRE_ESTUDIANTE.sql, las capturas deberán adjuntarse en un PDF con el siguiente nombre  Lab4NOMBRE_ESTUDIANTE.pdf