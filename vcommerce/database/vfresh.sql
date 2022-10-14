-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 14, 2022 at 03:01 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vfresh`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart_list`
--

CREATE TABLE `cart_list` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `category_list`
--

CREATE TABLE `category_list` (
  `id` int(30) NOT NULL,
  `vendor_id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category_list`
--

INSERT INTO `category_list` (`id`, `vendor_id`, `name`, `description`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(11, 8, 'Gạo ST', 'Các giống gạo mlem nhất thế giới', 1, 0, '2022-10-14 19:11:32', NULL),
(12, 5, 'Đặc biệt', 'loại sản phẩm đặc biệt', 1, 0, '2022-10-14 19:22:19', NULL),
(13, 5, 'Các loại rau', 'các loại rau nhà lá vườn', 1, 0, '2022-10-14 19:22:39', NULL),
(14, 5, 'Các loại củ quả', 'củ quả mlem mlem', 1, 0, '2022-10-14 19:22:57', NULL),
(15, 6, 'Hạt sấy khô', 'Hạt sấy khô khô quá là khô', 1, 0, '2022-10-14 19:48:06', NULL),
(16, 6, 'Hoa quả tươi đóng lon', 'Hoa quả tươi đóng lon', 1, 0, '2022-10-14 19:48:20', NULL),
(17, 7, 'Thịt bò', 'Thịt từ con bò', 1, 0, '2022-10-14 19:54:28', NULL),
(18, 7, 'Thịt heo', 'thịt từ con heo', 1, 0, '2022-10-14 19:54:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `client_list`
--

CREATE TABLE `client_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `firstname` text NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` text NOT NULL,
  `gender` text NOT NULL,
  `contact` text NOT NULL,
  `address` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` double NOT NULL DEFAULT 0,
  `price` double NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `client_id` int(30) NOT NULL,
  `vendor_id` int(30) NOT NULL,
  `total_amount` double NOT NULL DEFAULT 0,
  `delivery_address` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product_list`
--

CREATE TABLE `product_list` (
  `id` int(30) NOT NULL,
  `vendor_id` int(30) DEFAULT NULL,
  `category_id` int(30) DEFAULT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `price` double NOT NULL DEFAULT 0,
  `image_path` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_list`
--

INSERT INTO `product_list` (`id`, `vendor_id`, `category_id`, `name`, `description`, `price`, `image_path`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(10, 8, 11, 'ST25', '&lt;p&gt;Gạo mlem nhất thế giới hiện nay&lt;/p&gt;', 10000000, 'uploads/products/4.png', 1, 0, '2022-10-14 19:12:17', '2022-10-14 19:35:19'),
(11, 8, 11, 'ST24', '&lt;p&gt;&Iacute;t mlem hơn ST25 một t&iacute;&lt;/p&gt;', 8000000, 'uploads/products/5.png', 1, 0, '2022-10-14 19:12:58', '2022-10-14 19:35:31'),
(12, 5, 13, 'Rau muống', '&lt;p&gt;&lt;div class=&quot;g&quot; style=&quot;font-family: arial, sans-serif; font-size: 14px; line-height: 1.58; text-align: left; width: 600px; margin: 0px; clear: both; padding-bottom: 0px; color: rgb(32, 33, 36); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;&quot;&gt;&lt;div lang=&quot;vi&quot; data-hveid=&quot;CAgQAA&quot; data-ved=&quot;2ahUKEwjyib2Z29_6AhWHBIgKHfAFBGIQFSgAegQICBAA&quot;&gt;&lt;div class=&quot;tF2Cxc&quot; style=&quot;position: relative; clear: both; padding-bottom: 0px;&quot;&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/p&gt;&lt;div class=&quot;wDYxhc&quot; data-md=&quot;61&quot; lang=&quot;vi-VN&quot; style=&quot;clear: none; padding-top: 0px; border-radius: 8px; padding-left: 0px; padding-right: 0px; color: rgb(32, 33, 36); font-family: arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;&quot;&gt;&lt;div class=&quot;LGOjhe&quot; data-attrid=&quot;wa:/description&quot; aria-level=&quot;3&quot; role=&quot;heading&quot; data-hveid=&quot;CBMQAA&quot; style=&quot;overflow: hidden; padding-bottom: 20px;&quot;&gt;&lt;span class=&quot;ILfuVd&quot; lang=&quot;vi&quot; style=&quot;font-size: 16px; line-height: 24px;&quot;&gt;&lt;span class=&quot;hgKElc&quot; style=&quot;padding: 0px 8px 0px 0px;&quot;&gt;Gi&aacute; trị dinh dưỡng c&oacute; trong rau muống gồm c&oacute; vitamin A, B, C, canxi, phospho, c&aacute;c chất dinh dưỡng v&agrave; đặc biệt l&agrave; h&agrave;m lượng chất sắt dồi d&agrave;o. Ăn rau muống một c&aacute;ch hợp l&yacute; sẽ c&oacute; rất nhiều c&ocirc;ng dụng như:&lt;span&gt;&amp;nbsp;&lt;/span&gt;&lt;b&gt;Thanh nhiệt giải độc, ph&ograve;ng chống tiểu đường, ph&ograve;ng chống c&aacute;c bệnh tim mạch&lt;/b&gt;...&lt;/span&gt;&lt;/span&gt;&lt;/div&gt;&lt;/div&gt;', 5000000, 'uploads/products/2.png', 1, 0, '2022-10-14 19:25:07', '2022-10-14 19:35:53'),
(13, 5, 13, 'Húng quế', '&lt;p&gt;&lt;span style=&quot;color: rgb(32, 33, 36); font-family: arial, sans-serif;&quot;&gt;L&aacute; rau h&uacute;ng quế c&oacute; khả năng&nbsp;&lt;/span&gt;&lt;b style=&quot;color: rgb(32, 33, 36); font-family: arial, sans-serif;&quot;&gt;thanh lọc cơ thể&lt;/b&gt;&lt;span style=&quot;color: rgb(32, 33, 36); font-family: arial, sans-serif;&quot;&gt;&nbsp;rất hiệu quả. Khi ăn sống loại gia vị n&agrave;y, ch&uacute;ng sẽ lọc sạch m&aacute;u cung cấp cho da, mang lại cho bạn một l&agrave;n da s&aacute;ng b&oacute;ng v&agrave; ngăn ngừa hiệu quả sự xuất hiện của mụn.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 4000000, 'uploads/products/3.png', 1, 0, '2022-10-14 19:26:31', '2022-10-14 19:36:05'),
(14, 5, 13, 'Mồng tơi', '&lt;div class=&quot;co8aDb&quot; aria-level=&quot;3&quot; role=&quot;heading&quot; style=&quot;margin-bottom: 12px; font-family: &amp;quot;Google Sans&amp;quot;, arial, sans-serif; color: rgb(32, 33, 36);&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-family: Arial;&quot;&gt;8&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-family: Arial;&quot;&gt;lợi &iacute;ch&lt;/span&gt;&lt;span style=&quot;font-family: Arial;&quot;&gt;&amp;nbsp;bất ngờ khi ăn&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-family: Arial;&quot;&gt;rau mồng tơi&lt;/span&gt;&lt;span style=&quot;font-family: Arial;&quot;&gt;&amp;nbsp;mỗi ng&agrave;y&lt;/span&gt;&lt;/b&gt;&lt;/div&gt;&lt;p style=&quot;padding: 0px 20px; color: rgb(32, 33, 36); font-family: arial, sans-serif;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;padding: 0px 20px; color: rgb(32, 33, 36); font-family: arial, sans-serif;&quot;&gt;&lt;ul class=&quot;i8Z77e&quot; style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px;&quot;&gt;&lt;ul&gt;&lt;/ul&gt;&lt;/ul&gt;&lt;/p&gt;&lt;ul&gt;&lt;li style=&quot;margin: 0px 0px 4px; padding: 0px; list-style-type: disc;&quot;&gt;L&agrave;m đẹp da. ...&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 4px; padding: 0px; list-style-type: disc;&quot;&gt;Ngăn ngừa lo&atilde;ng xương. ...&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 4px; padding: 0px; list-style-type: disc;&quot;&gt;Giảm nguy cơ thiếu sắt. ...&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 4px; padding: 0px; list-style-type: disc;&quot;&gt;Hỗ trợ sự ph&aacute;t triển của em b&eacute; ...&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 4px; padding: 0px; list-style-type: disc;&quot;&gt;Giữ cho đ&ocirc;i mắt khỏe mạnh. ...&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 4px; padding: 0px; list-style-type: disc;&quot;&gt;Gi&agrave;u chất chống oxy h&oacute;a. ...&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 4px; padding: 0px; list-style-type: disc;&quot;&gt;Hỗ trợ sức khỏe tim mạch. ...&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 4px; padding: 0px; list-style-type: disc;&quot;&gt;Phục hồi vết thương.&lt;/li&gt;&lt;/ul&gt;', 3000000, 'uploads/products/1.png', 1, 0, '2022-10-14 19:31:04', '2022-10-14 19:36:17'),
(15, 5, 14, 'Bí ngô', '&lt;p&gt;&lt;span style=&quot;color: rgb(32, 33, 36); font-family: arial, sans-serif;&quot;&gt;B&iacute; ng&ocirc; cũng l&agrave; một trong những nguồn lutein v&agrave; zeaxanthin, hai hợp chất c&oacute; khả năng&amp;nbsp;&lt;/span&gt;&lt;b style=&quot;color: rgb(32, 33, 36); font-family: arial, sans-serif;&quot;&gt;l&agrave;m giảm nguy cơ tho&aacute;i h&oacute;a điểm v&agrave;ng li&ecirc;n quan đến tuổi t&aacute;c (AMD) v&agrave; đục thủy tinh thể&lt;/b&gt;&lt;span style=&quot;color: rgb(32, 33, 36); font-family: arial, sans-serif;&quot;&gt;. Ngo&agrave;i ra, b&iacute; ng&ocirc; chứa nhiều vitamin C v&agrave; E, c&oacute; chức năng như chất chống oxy h&oacute;a v&agrave; c&oacute; thể ngăn chặn c&aacute;c gốc tự do g&acirc;y tổn hại cho c&aacute;c tế b&agrave;o mắt.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 6000000, 'uploads/products/6.png', 1, 0, '2022-10-14 19:38:23', '2022-10-14 19:38:52'),
(16, 5, 12, 'Lê Hưng', '&lt;p&gt;Miễn ph&iacute; free ship&lt;/p&gt;', 0, 'uploads/products/11.png', 1, 0, '2022-10-14 19:39:43', '2022-10-14 19:40:12'),
(17, 6, 15, 'Hạt điều', '&lt;p&gt;t&ocirc;i biết n&oacute; rất ngon&lt;/p&gt;', 7000000, 'uploads/products/7.png', 1, 0, '2022-10-14 19:49:59', '2022-10-14 19:52:29'),
(18, 6, 16, 'Nhãn đóng hộp', '&lt;p&gt;đảm bảo tươi&lt;/p&gt;', 3000000, 'uploads/products/8.png', 1, 0, '2022-10-14 19:51:48', '2022-10-14 19:52:44'),
(19, 7, 17, 'Bò wagyu', '&lt;p&gt;Thượng hạng&lt;/p&gt;', 11000000, 'uploads/products/9.png', 1, 0, '2022-10-14 19:56:13', '2022-10-14 19:57:59'),
(20, 7, 18, 'Heo ăn chuối ', '&lt;p&gt;Của bầu Đức&lt;/p&gt;', 5000000, 'uploads/products/10.png', 1, 0, '2022-10-14 19:56:46', '2022-10-14 19:58:12');

-- --------------------------------------------------------

--
-- Table structure for table `shop_type_list`
--

CREATE TABLE `shop_type_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shop_type_list`
--

INSERT INTO `shop_type_list` (`id`, `name`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(6, 'Nông sản cơ bản, thiết yếu', 1, 0, '2022-10-14 18:37:43', '2022-10-14 19:43:40'),
(7, 'Nông sản phái sinh ', 1, 0, '2022-10-14 18:38:07', '2022-10-14 19:43:49'),
(8, 'Nông sản chế biến ', 1, 0, '2022-10-14 18:38:43', '2022-10-14 19:43:59');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', ''),
(6, 'short_name', 'VFresh'),
(11, 'logo', 'uploads/VFRESH.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/banner_img2.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/avatar-1.png?v=1644472635', NULL, 1, '2021-01-20 14:02:37', '2022-02-10 13:57:15');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_list`
--

CREATE TABLE `vendor_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `shop_type_id` int(30) NOT NULL,
  `shop_name` text NOT NULL,
  `shop_owner` text NOT NULL,
  `contact` text NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vendor_list`
--

INSERT INTO `vendor_list` (`id`, `code`, `shop_type_id`, `shop_name`, `shop_owner`, `contact`, `username`, `password`, `avatar`, `status`, `delete_flag`, `date_created`, `date_updated`, `email`) VALUES
(5, '202210-00001', 6, 'Nông sản Lê Hưng', 'Lê Tuấn Hưng', '0912345678', 'shop01', '6f253286e4e82bcc67d95a527bd5ffc4', 'uploads/vendors/5.png', 1, 0, '2022-10-14 18:40:27', '2022-10-14 19:20:38', 'hung.lechpro@hcmut.edu.vn'),
(6, '202210-00002', 8, 'Đóng hộp Lê Tèo', 'Lê Tèo', '09123234234', 'shop02', '21c4eab76f0bd3adc06fe15797ced087', 'uploads/vendors/6.png', 1, 0, '2022-10-14 18:50:30', '2022-10-14 19:20:13', 'donghop@leteo.industry.vn'),
(7, '202210-00003', 7, 'Gia súc Thăng Thiên', 'Nguyễn An Lành', '0897563412', 'shop03', 'c086acef9556f08fa796b3787c46eaa0', 'uploads/vendors/7.png', 1, 0, '2022-10-14 18:56:37', '2022-10-14 19:19:58', 'anlanh@luagao.shop03.org'),
(8, '202210-00004', 6, 'Lúa gạo Nevermind', 'Lê Thành Thái', '1800922345', 'shop04', 'aa12af4466408a9f5950cb5efe935a85', 'uploads/vendors/8.png', 1, 0, '2022-10-14 19:10:22', '2022-10-14 19:19:41', 'thanhthai@chongphap.vn');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart_list`
--
ALTER TABLE `cart_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `category_list`
--
ALTER TABLE `category_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_id` (`vendor_id`);

--
-- Indexes for table `client_list`
--
ALTER TABLE `client_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `vendor_id` (`vendor_id`);

--
-- Indexes for table `product_list`
--
ALTER TABLE `product_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_id` (`vendor_id`),
  ADD KEY `category_id` (`category_id`) USING BTREE;

--
-- Indexes for table `shop_type_list`
--
ALTER TABLE `shop_type_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_list`
--
ALTER TABLE `vendor_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_type_id` (`shop_type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart_list`
--
ALTER TABLE `cart_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `category_list`
--
ALTER TABLE `category_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `client_list`
--
ALTER TABLE `client_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product_list`
--
ALTER TABLE `product_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `shop_type_list`
--
ALTER TABLE `shop_type_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `vendor_list`
--
ALTER TABLE `vendor_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart_list`
--
ALTER TABLE `cart_list`
  ADD CONSTRAINT `cart_list_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_list_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category_list`
--
ALTER TABLE `category_list`
  ADD CONSTRAINT `category_list_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_list`
--
ALTER TABLE `order_list`
  ADD CONSTRAINT `order_list_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_list_ibfk_2` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_list`
--
ALTER TABLE `product_list`
  ADD CONSTRAINT `product_list_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_list` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `product_list_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vendor_list`
--
ALTER TABLE `vendor_list`
  ADD CONSTRAINT `vendor_list_ibfk_1` FOREIGN KEY (`shop_type_id`) REFERENCES `shop_type_list` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
