-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 04, 2023 at 10:10 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopping_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `com_logo` varchar(100) DEFAULT NULL,
  `com_name` varchar(100) NOT NULL,
  `com_email` varchar(60) NOT NULL,
  `com_phone` varchar(15) DEFAULT NULL,
  `com_address` varchar(255) DEFAULT NULL,
  `cur_format` varchar(10) NOT NULL,
  `admin_role` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_name`, `username`, `password`, `com_logo`, `com_name`, `com_email`, `com_phone`, `com_address`, `cur_format`, `admin_role`) VALUES
(1, 'admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', NULL, 'Inventory', 'inventory@gmail.com', NULL, NULL, '$', 1);

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(11) NOT NULL,
  `brand_title` text NOT NULL,
  `brand_cat` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`, `brand_cat`) VALUES
(13, 'Boquet', 9),
(12, 'Bonsai trees', 9),
(11, 'Gifts', 9),
(10, 'Roses', 9);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL,
  `products` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`, `products`) VALUES
(9, 'Electronics', 0),
(10, 'Men', 0),
(11, 'Women', 0),
(12, 'Furniture', 0);

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `s_no` int(11) NOT NULL,
  `site_name` varchar(100) NOT NULL,
  `site_title` varchar(100) DEFAULT NULL,
  `site_logo` varchar(100) NOT NULL,
  `site_desc` varchar(255) DEFAULT NULL,
  `footer_text` varchar(100) NOT NULL,
  `currency_format` varchar(20) NOT NULL,
  `contact_phone` varchar(15) DEFAULT NULL,
  `contact_email` varchar(100) DEFAULT NULL,
  `contact_address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`s_no`, `site_name`, `site_title`, `site_logo`, `site_desc`, `footer_text`, `currency_format`, `contact_phone`, `contact_email`, `contact_address`) VALUES
(1, 'Go Green', 'Online nursery shop ', 'resizedImage.png', ' Welcome to our nursery store! We offer a wide selection of beautiful plants and gardening supplies to help you create a vibrant and thriving outdoor space. From colorful flowers to lush greenery, our inventory has everything you need to turn your garden.', '', 'Rs.', '9876541230', 'gogreen@gmail.com', '#422203, Dhatrak Phata Nashik');

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `order_id` int(11) NOT NULL,
  `product_id` varchar(100) NOT NULL,
  `product_qty` varchar(100) NOT NULL,
  `total_amount` varchar(10) NOT NULL,
  `product_user` int(11) NOT NULL,
  `order_date` varchar(11) NOT NULL,
  `pay_req_id` varchar(100) DEFAULT NULL,
  `confirm` tinyint(4) NOT NULL DEFAULT 0,
  `delivery` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`order_id`, `product_id`, `product_qty`, `total_amount`, `product_user`, `order_date`, `pay_req_id`, `confirm`, `delivery`) VALUES
(19, '12', '1', '299', 2, '2020-11-17', 'd7a5b179cd07480782fc2d21edec7031', 1, 1),
(18, '12', '1', '299', 2, '2020-11-17', '4e2738d7eade4f57b5fd32434239d35f', 1, 0),
(17, '11', '1', '759', 2, '2020-11-12', 'd388939cdaca4087acca75574a34b035', 1, 0),
(20, '12', '1', '299', 2, '2020-11-17', 'a0f61b1acd6b444ba5856cc4387e7710', 0, 0),
(21, '12', '2', '598', 2, '2020-11-17', '0e2fdf1541994d338c676201097d2481', 1, 0),
(22, '12', '1', '299', 2, '2020-11-17', '8b0791e3eb764e45b497b0f0c401d9d6', 1, 0),
(23, '12', '1', '299', 2, '2020-11-17', '92c9c474ae864d01b81f7e2f4d3a098e', 1, 0),
(27, '11', '1', '759', 2, '2020-11-17', '6863fbdf68be45d5a77aa01774a80885', 1, 0),
(28, '11', '1', '759', 2, '2020-11-17', 'ee7d6cea937c4f06b6e5e1fffe47b778', 1, 1),
(29, '12', '1', '299', 2, '2020-11-17', 'f7ce91d5964c462fa3972f6cb5373d4a', 0, 1),
(30, '11', '2', '1518', 2, '2020-11-30', '939d866425ef479c84e276e664ce5a31', 0, 0),
(38, '11,12,', '1,1,', '1058', 2, '2020-12-01', '2c648ec714914c18b447309d691b7eef', 0, 0),
(37, '4,12,', '2,1,', '94279', 4, '2020-12-01', 'd19818d2ba3543ffa03a79a7eb64901b', 0, 0),
(36, '10,11,12,', '1,1,1,', '1342', 4, '2020-12-01', 'df952fa6bacd4f389de80b1080ed3871', 0, 1),
(39, '11,12,', '1,1,', '1058', 2, '2020-12-01', '700bf310ca4a4697b59184f61309275a', 0, 0),
(40, '11,12,', '1,1,', '1058', 2, '2020-12-01', '639ccfba60cd41eeba02ba5ff1849249', 0, 0),
(41, '11,12,', '1,1,', '1058', 2, '2020-12-01', '792c6616026948e48a2fcc07eb35c158', 0, 0),
(42, '11,12,', '1,1,', '1058', 2, '2020-12-02', '153427404661463f83a5e8bd080a95e9', 0, 0),
(43, '11,12,', '1,1,', '1058', 2, '2020-12-02', '37473185580340ab8c54d102204c7bf9', 0, 0),
(44, '11,12,', '1,1,', '1058', 2, '2020-12-02', '2bb8d2ccf3544d0089d211abf4d55e36', 0, 1),
(45, '12,13,', '1,1,', '1532', 2, '2020-12-02', '63148f0e7b7043f5a5e470a9ac1d3dde', 0, 1),
(46, '12,', '1,', '299', 2, '2020-12-04', '3c209af45445486c8aefb6cfb55dcbb7', 0, 0),
(47, '4,', '1,', '1499', 15, '2023-05-02', '26e361cf65b544239cf6bc06c759607c', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `item_number` varchar(50) NOT NULL,
  `txn_id` varchar(50) NOT NULL,
  `payment_gross` float(10,2) NOT NULL,
  `currency_code` varchar(5) NOT NULL,
  `payment_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `item_number`, `txn_id`, `payment_gross`, `currency_code`, `payment_status`) VALUES
(5, '11', 'd388939cdaca4087acca75574a34b035', 759.00, '', 'credit'),
(6, '12', '4e2738d7eade4f57b5fd32434239d35f', 299.00, '', 'credit'),
(7, '12', 'd7a5b179cd07480782fc2d21edec7031', 299.00, '', 'credit'),
(8, '12', 'a0f61b1acd6b444ba5856cc4387e7710', 299.00, '', 'pending'),
(9, '12', '0e2fdf1541994d338c676201097d2481', 598.00, '', 'credit'),
(10, '12', '8b0791e3eb764e45b497b0f0c401d9d6', 299.00, '', 'credit'),
(11, '12', '92c9c474ae864d01b81f7e2f4d3a098e', 299.00, '', 'credit'),
(20, '11', '6863fbdf68be45d5a77aa01774a80885', 759.00, '', 'credit'),
(21, '11', 'ee7d6cea937c4f06b6e5e1fffe47b778', 759.00, '', 'credit'),
(22, '12', 'f7ce91d5964c462fa3972f6cb5373d4a', 299.00, '', 'credit'),
(23, '11', '939d866425ef479c84e276e664ce5a31', 1518.00, '', 'credit'),
(29, '10,11,12,', 'df952fa6bacd4f389de80b1080ed3871', 1342.00, '', 'credit'),
(30, '4,12,', 'd19818d2ba3543ffa03a79a7eb64901b', 94279.00, '', 'credit'),
(31, '11,12,', '2c648ec714914c18b447309d691b7eef', 1058.00, '', 'credit'),
(32, '11,12,', '700bf310ca4a4697b59184f61309275a', 1058.00, '', 'credit'),
(33, '11,12,', '639ccfba60cd41eeba02ba5ff1849249', 1058.00, '', 'credit'),
(34, '11,12,', '792c6616026948e48a2fcc07eb35c158', 1058.00, '', 'credit'),
(35, '11,12,', '153427404661463f83a5e8bd080a95e9', 1058.00, '', 'credit'),
(36, '11,12,', '37473185580340ab8c54d102204c7bf9', 1058.00, '', 'credit'),
(37, '11,12,', '2bb8d2ccf3544d0089d211abf4d55e36', 1058.00, '', 'credit'),
(38, '12,13,', '63148f0e7b7043f5a5e470a9ac1d3dde', 1532.00, '', 'credit'),
(39, '12,', '3c209af45445486c8aefb6cfb55dcbb7', 299.00, '', 'credit'),
(40, '4,', '26e361cf65b544239cf6bc06c759607c', 1499.00, '', 'credit');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_code` varchar(100) NOT NULL,
  `product_cat` int(100) NOT NULL,
  `product_sub_cat` int(11) NOT NULL,
  `product_brand` int(100) DEFAULT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` varchar(100) NOT NULL,
  `product_desc` text NOT NULL,
  `featured_image` text NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 1,
  `product_keywords` text DEFAULT NULL,
  `product_views` int(11) DEFAULT 0,
  `product_status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_code`, `product_cat`, `product_sub_cat`, `product_brand`, `product_title`, `product_price`, `product_desc`, `featured_image`, `qty`, `product_keywords`, `product_views`, `product_status`) VALUES
(2, '5fc500f4330ad', 9, 18, 10, 'Samsung Galaxy A20s (Blue, 32 GB)  (3 GB RAM)', '12900', '3 GB RAM | 32 GB ROM | Expandable Upto 512 GB\r\n16.51 cm (6.5 inch) HD+ Display\r\n13MP + 8MP + 5MP | 8MP Front Camera\r\n4000 mAh Lithium Ion Battery\r\nQualcomm SDM450-B01 Processor', '1598962160galaxy-a20s.jpeg', 0, NULL, 1, 1),
(3, '5fc500ec98a64', 9, 18, 13, 'Enchanting Orchids Bouquet', '299', 'A stunning bunch of orchids to wow the special someone. Beautifully wrapped in delicate non-woven paper and tied with ribbon, this designer bouquet is sure to bring a smile on your loved one\'s face.\r\n\r\nProduct Details:\r\n6 Purple Orchids\r\nGreen Murraya Leaf Filler\r\nFNP Baby Pink Non Woven Packing Sheet', 'bb1.jpg', 1, NULL, 32, 1),
(4, '5fc500e4de9c2', 9, 19, 12, 'Desert Rose Adenium Plant', '1499', 'Plant Name- Ficus Ginseng Bonsai\r\nPlant Type- Bonsai/Air Purifying\r\nPlant Placement- Indoors & Outdoors\r\n \r\nCare Instructions\r\nKeep plants in medium light locations, out of direct sunlight.\r\nNatural light is best, but some plants can also thrive in office fluorescent light.\r\nPlant soil should be kept moist at all time.\r\nBe careful to avoid overwatering.', 'aa.jpg', 1, NULL, 18, 1),
(5, '5fc500decacd2', 9, 19, 12, 'Ficus Ginseng Bonsai In Sea House Planter', '1699', 'Ficus Ginseng Bonsai 7 inches, Blue and White Sea house Resin Planter 4x5 Inches.\r\n\r\n Care Instructions\r\nKeep plants in medium light locations, out of direct sunlight.\r\nNatural light is best, but some plants can also thrive in office fluorescent light.\r\nPlant soil should be kept moist at all time.\r\nBe careful to avoid overwatering.\r\nDo not allow plants to stand in water.', 'aa1.jpg', 1, NULL, 2, 1),
(6, '5fc500d9502a7', 12, 25, 0, 'Super Granite Pebbles (Black, Rodi, Polished) - 1 kg', '677', 'Extra 30% Off on Checkout\r\n\r\n(MRP Inclusive of all taxes)\r\n\r\nShipping ?79 for entire order\r\nDispatch in 7 days\r\nCountry of origin: India', 'dd1.jpg', 1, NULL, 1, 1),
(7, '5fc500d3ae088', 12, 25, 0, 'Stone (White) - 1 kg', '566', 'images are for reference purposes only. Actual product may vary in shape or appearance based on climate, age, height, etc. The product is replaceable but not returnable.', 'dd2.jpg', 1, NULL, 7, 1),
(8, '5fc500cd9a2c4', 12, 24, 0, 'Plant Pack For Healthy Home-Office', '2750', 'This gift pack contains jade plant + Money Plant Golden + Peace Lily + Syngonium variegated + ArecaPalm (Small) plants in colourfull pots.\r\nPlants in this pack are very easy to care and require low maintenance.\r\nAll plants in this pack are NASA recommended air purifier plants.\r\nPlant in this pack Best for AC rooms, office desk, Home.\r\nPlant in this pack Best indoor plant for low light conditions.\r\n', 'hh6.jfif', 1, NULL, 0, 1),
(9, '5fc500c7c7bef', 10, 26, 0, 'Sher Planter - Nicobar', '999', '10% Instant Discount on Bank Of Baroda Credit Cards\r\n10% Instant Discount on Federal Bank Debit Cards\r\n\r\nA home for your plants, this stoneware planter makes for a great table accessory.', 'cc1.jfif', 1, NULL, 2, 1),
(11, '5fc500bc5d3e3', 11, 27, 0, 'Pansy F1 Blotch Mixed Color - Flower Seeds', '99', 'Images are for reference purposes only. Actual product may vary in shape or appearance based on climate, age, height, etc. The product is replaceable but not returnable.', 'ee1.jpg', 3, NULL, 15, 1),
(12, '5fc500b5570aa', 11, 28, 0, 'DAP Fertilizer for Home Plant - All purpose Gardening Fertilizer (1kg)', '1999', 'Plant fertilizer for Home Plants helps grow greener, faster-growing plants.\r\nFertilizer for flowers, fertilizers for home plants provides an excellent effect on overall plant growth, encourages the growth of shoots/leaves and improves the quality and shelf life of the produce\r\nGood quality, rich in all essential plant nutrients. Use of fertilizer home garden.', 'ff6.jfif', 12, NULL, 14, 1),
(14, '5fc500e4de9c2', 9, 19, 12, 'Pachira Bonsai Plant In Handmade Terracotta Pot', '999', 'Plant Name- Pachira Bonsai Plant\r\nHeight- Upto 18 Inches\r\nPlant Placement- Indoor\r\nPachira is a tropical wetland tree of the mallow family Malvaceae, native to Central and South America where it grows in swamps.\r\n Care instrustion:-\r\nKeep plants in medium light locations, out of direct sunlight.\r\nNatural light is best, but some plants can also thrive in office fluorescent lightPlant soil should be kept moist at all time.Be careful to avoid overwatering.Do not allow plants to stand in water.\r\n', 'aa2.jpg', 1, NULL, 16, 1),
(15, '5fc500e4de9c2', 9, 19, 12, 'Desert Rose Adenium Plant', '1499', 'Plant Name- Ficus Ginseng Bonsai\r\nPlant Type- Bonsai/Air Purifying\r\nPlant Placement- Indoors & Outdoors\r\n \r\nCare Instructions\r\nKeep plants in medium light locations, out of direct sunlight.\r\nNatural light is best, but some plants can also thrive in office fluorescent light.\r\nPlant soil should be kept moist at all time.\r\nBe careful to avoid overwatering.', 'aa3.jpg', 1, NULL, 18, 1),
(16, '5fc500e4de9c2', 9, 19, 12, 'Desert Rose Adenium Plant', '1499', 'Plant Name- Ficus Ginseng Bonsai\r\nPlant Type- Bonsai/Air Purifying\r\nPlant Placement- Indoors & Outdoors\r\n \r\nCare Instructions\r\nKeep plants in medium light locations, out of direct sunlight.\r\nNatural light is best, but some plants can also thrive in office fluorescent light.\r\nPlant soil should be kept moist at all time.\r\nBe careful to avoid overwatering.', 'aa4.jpg', 1, NULL, 16, 1),
(17, '5fc500e4de9c2', 9, 19, 12, 'Desert Rose Adenium Plant', '1499', 'Plant Name- Ficus Ginseng Bonsai\r\nPlant Type- Bonsai/Air Purifying\r\nPlant Placement- Indoors & Outdoors\r\n \r\nCare Instructions\r\nKeep plants in medium light locations, out of direct sunlight.\r\nNatural light is best, but some plants can also thrive in office fluorescent light.\r\nPlant soil should be kept moist at all time.\r\nBe careful to avoid overwatering.', 'aa5.jpg', 1, NULL, 14, 1),
(18, '5fc500ec98a64', 9, 18, 13, 'Floral Symphony Basket', '999', 'Whether your loved one has a green thumb or simply enjoys the beauty of flowers, this floral arrangement is a perfect gift that will brighten up their day and show them how much you care. The delicate and soothings of the flowers and the charming presentation of the basket make this a gift that will be treasured for a long time to come.\r\nProduct Details:\r\nPremium, unscented aqua pink roses (5 pieces)\r\nPremiun, unscented baby pink carnations (5 pieces)\r\nPremium, unscented purple daisy flower (2 pieces)', 'bb2.jpg', 1, NULL, 32, 1),
(19, '5fc500ec98a64', 9, 18, 13, 'Abundant Love Bouquet', '499', 'This stunning bouquet is a symbol of boundless love and is sure to bring a smile to the face of a special person on any significant occasion. Whether you are near or far, this bouquet is the perfect way to express your love and gratitude for all the love and support. The bouquet features roses, which signify admiration and are arranged with the utmost care and precision.\r\nProduct Details:\r\nPremium, unscented dark pink roses (26 pieces)\r\nEmbellished with green morpankhi leaf filler\r\nFNP Off White N Light Pink non woven packing sheet', 'bb3.jpg', 1, NULL, 32, 1),
(20, '5fc500ec98a64', 9, 18, 13, 'Yellow Elegances Gerbera Blossoms', '699', 'Product Details:\r\n8 Red Gerberas\r\nFillers-Green Color Asparagus & White Gypsy Flower\r\nWrapped up with Red Non Woven Paper\r\nTied with a Red Ribbon\r\nCountry of Origin: India', 'bb4.jpg', 1, NULL, 32, 1),
(21, '5fc500ec98a64', 9, 18, 13, 'Confetti Wishes Floral Bouquet', '799', 'confetti of happiness delivered on special someones birthday. This impressive bouquet of pink roses sprinkled with White Gypsophila Gypsy Fillers and happy birthday wrapping paper will brighten up their day in an adorable way.\r\nProduct Details:\r\n10 yellow Roses\r\nFillers- White Gypsophila Gypsy Fillers\r\nGreen Morpankhi Leaf Filler\r\nHappy Birthday Pink Paper & Non Woven Plain Pink Paper', 'bb5.jpg', 1, NULL, 35, 1),
(23, '5fc500ec98a64', 9, 18, 13, 'Exotic Garden of Love', '999', 'For the people who love exotic and unique flowers or simply appreciate the beauty of a well-crafted floral box, here is the perfect gift that will show how much you care. The stunning, intricate design and luxurious presentation makes it perfect to express adoration towards them. This exquisite box features roses, Asiatic lilies and daisies arranged with precision and care to create a perfect balance and textures.', 'bb6.jpg', 1, NULL, 34, 1),
(26, '5fc500d9502a7', 12, 25, 0, 'Natural Chips Pebbles (Red, Small, Unpolished) - 1 kg', '488', 'images are for reference purposes only. Actual product may vary in shape or appearance based on climate, age, height, etc. The product is replaceable but not returnable.', 'dd4.jpg', 1, NULL, 1, 1),
(27, '5fc500d9502a7', 12, 25, 0, 'Onex Pebbles (Black, Medium) - 1 kg', '899', 'Extra 30% Off on Checkout\r\n\r\n(MRP Inclusive of all taxes)\r\n\r\nShipping ?79 for entire order\r\nDispatch in 7 days\r\nCountry of origin: India', 'dd5.jpg', 1, NULL, 2, 1),
(28, '5fc500d9502a7', 12, 25, 0, 'Aquarium Pebbles (Yellow, Small) - 1 kg', '299', 'Extra 30% Off on Checkout\r\n\r\n(MRP Inclusive of all taxes)\r\n\r\nShipping ?79 for entire order\r\nDispatch in 7 days\r\nCountry of origin: India', 'dd3.jpg', 1, NULL, 1, 1),
(29, '5fc500d3ae088', 12, 25, 0, 'Chips Pebbles (Black, Small, Polished) - 1 kg', '799', 'Extra 30% Off on Checkout\r\n\r\n(MRP Inclusive of all taxes)\r\n\r\nShipping ?79 for entire order\r\nDispatch in 7 days\r\nCountry of origin: India', 'dd6.jpg', 1, NULL, 6, 1),
(30, '5fc500c285db4', 10, 26, 0, 'Livzing Plastic Flower Pot ', '499', 'Get extra 5.0% off (price inclusive of discount)\r\n10% Instant Discount on Federal Bank Debit Cards\r\n10% Instant Discount on Bank Of Baroda Credit Cards', 'cc.jfif', 1, NULL, 2, 1),
(31, '5fc500c7c7bef', 10, 26, 0, 'Ugaoo Peace Lily Plant with Self Watering Pot ', '499', 'It has dark glossy green, oblong, lanceolate leaves which bears long-lasting pure white, large, unusual looking flowers (spathes). With ability to grow in low light , this flowering beauty is one of the easiest indoor plant suitable in living room, balcony, or bedroom. ', 'cc2.jfif', 1, NULL, 3, 1),
(32, '5fc500c7c7bef', 10, 26, 0, 'HandCrafted pots', '1199', '10% Instant Discount on Bank Of Baroda Credit Cards\r\n10% Instant Discount on Federal Bank Debit Cards', 'cc3.jfif', 1, NULL, 4, 1),
(33, '5fc500c285db4', 10, 26, 0, 'Kraft Seeds Gamla Planter Pots', '899', 'Get extra 5.0% off (price inclusive of discount)\r\n10% Instant Discount on Federal Bank Debit Cards\r\n10% Instant Discount on Bank Of Baroda Credit Cards', 'cc4.jfif', 1, NULL, 4, 1),
(34, '5fc500c7c7bef', 10, 26, 0, 'Garden\'s Need Designer Round Shape 07 Inch Poppy Flower Plastic Pot for Office, Home', '1499', '10% Instant Discount on Bank Of Baroda Credit Cards\r\n10% Instant Discount on Federal Bank Debit Cards', 'cc5.jfif', 1, NULL, 3, 1),
(35, '5fc500bc5d3e3', 11, 27, 0, 'Cockscomb Mixed Color - Desi Flower Seeds', '88', 'Images are for reference purposes only. Actual product may vary in shape or appearance based on climate, age, height, etc. The product is replaceable but not returnable.', 'ee2.jpg', 3, NULL, 14, 1),
(36, '5fc500bc5d3e3', 11, 27, 0, 'Premium Sunflower Seeds, 200 g', '45', 'fresh sunflower seeds packed in a polybag\r\nHygienically packed in facility meeting food safety standards\r\nQuality assured - our products are rigorously tested against the industry\'s highest quality standards\r\nPacked in food safe material', 'ee5.jpg', 3, NULL, 14, 1),
(37, '5fc500bc5d3e3', 11, 27, 0, ' Pumpkin Seeds, 200g', '77', '', 'ee4.jpg', 3, NULL, 15, 1),
(38, '5fc500bc5d3e3', 11, 27, 0, 'Air Purifier Indoor Growing Mix Succulent Seeds- 35 Seeds - Grow Year Round', '199', 'Grow Indoor & Outdoor Both\r\nVery Easy to Grow & Care\r\nPurify Air and Absorb EMF Radiation', 'ee6.jpg', 3, NULL, 17, 1),
(39, '5fc500bc5d3e3', 11, 27, 0, 'NatureVit Psyllium Seeds, 1 kg [Isabgol Beej]', '759', 'NatureVit Psyllium Seed, 1 Kg [Isabgol Beej] [ Crop of 2020 Sortex Clean ]\r\nPsyllium Seeds are an Agri-Farm Product of the Dried Ripe Seeds of Plantago Ovata forks (farm. Plantaginaceae) and it has been cleaned free of all dust, Agri Farm Fibers, Wastes, Mud, Stones, and Iron Particles.\r\nPsyllium Seeds is Boat shaped, Seed Coats are white in color while the fleshy part is red in color because of which the seeds have a pinkish hue. After dipping in water the seeds swell up and become fragrant.', 'ee2.jpg', 3, NULL, 14, 1),
(41, '5fc500b5570aa', 11, 28, 0, 'TrustBasket Organic Vermicompost Fertilizer Manure For Plants 5 Kg Green', '899', 'Special Price  Get extra 10.0% off (price inclusive of discount)\r\nBank Offer10% Instant Discount on Federal Bank Debit Cards', 'ff1.jfif', 12, NULL, 16, 1),
(42, '5fc500b5570aa', 11, 28, 0, 'OrganicDews Liquid Seaweed Concentrate for Plants 250 ml with Measuring Cup 25 ml Fertilizer for ', '799', 'Special Price  Get extra 10.0% off (price inclusive of discount)\r\nBank Offer10% Instant Discount on Federal Bank Debit Cards', 'ff5.jfif', 12, NULL, 14, 1),
(43, '5fc500b5570aa', 11, 28, 0, 'NANO NPK', '999', 'Special Price  Get extra 10.0% off (price inclusive of discount)\r\nBank Offer10% Instant Discount on Federal Bank Debit Cards', 'ff3.jfif', 12, NULL, 15, 1),
(44, '5fc500b5570aa', 11, 28, 0, 'ACTIVE IPM BIO Fertilizer CONSORTIA Plant Growth Promoter, Nutrition Enhancer Suppliment, BioStimulant, Immunity Builder for Plants & Crops', '1299', 'Solubilizes insoluble phosphates in rhizosphere which helps in crop growth and development. Mobilizes Potash from soil and makes it available to the plant throughout its growth stage. Improves crop yield by 20 to 25%. Can reduce chemical fertilizer use to the extent of 20%. Improves soil fertility by increasing the number of useful microbes in rhizosphere.\r\nDesigned for optimum performance leading to Complete Customer Delight. Absolutely zero chemical residues.', 'ff2.jfif', 12, NULL, 15, 1),
(45, '5fc500b5570aa', 11, 28, 0, 'Tapas Bio Npk Plants & Crops', '1999', 'Solubilizes insoluble phosphates in rhizosphere which helps in crop growth and development. Mobilizes Potash from soil and makes it available to the plant throughout its growth stage. Improves crop yield by 20 to 25%. Can reduce chemical fertilizer use to the extent of 20%. Improves soil fertility by increasing the number of useful microbes in rhizosphere.\r\nDesigned for optimum performance leading to Complete Customer Delight. Absolutely zero chemical residues.', 'ff4.jfif', 12, NULL, 15, 1),
(46, '5fc500cd9a2c4', 12, 24, 0, '5 Best Fragrant Plants', '2750', 'You plant a hope when you bring Fragrant Plants at your Home.\r\nYou hope that it grows a happy life and brings in luck and kindness & Fragrance in your household.\r\nThese Plants play a very important role as they energize our surroundings.', 'hh5.jfif', 1, NULL, 0, 1),
(47, '5fc500cd9a2c4', 12, 24, 0, 'Plant Pack For Healthy Home-Office', '2999', 'This gift pack contains jade plant + Money Plant Golden + Peace Lily + Syngonium variegated + ArecaPalm (Small) plants in colourfull pots.\r\nPlants in this pack are very easy to care and require low maintenance.\r\nAll plants in this pack are NASA recommended air purifier plants.\r\nPlant in this pack Best for AC rooms, office desk, Home.\r\nPlant in this pack Best indoor plant for low light conditions.', 'hh3.jfif', 1, NULL, 0, 1),
(48, '5fc500cd9a2c4', 12, 24, 0, 'Top 3 Die Hard Succulents Pack', '1999', 'You get 3 succulent plants + 3 Colorful Pots in a single pack.\r\nPlants in this pack are easy to care for and require low maintenance.\r\nSucculent plants are hard to kill and impart beauty to your garden.', 'hh2.jpg', 1, NULL, 0, 1),
(49, '5fc500cd9a2c4', 12, 24, 0, 'Repbulic Day Special (5 Plants Pack)', '399', 'You will get 5 air purifier plants potted in colorful plastic pots along with pebbles in a single pack.\r\nPlants in this pack require low maintenance and care.\r\nThese plants will increase the aesthetic look of your house with their beautiful look.\r\nPlants in this pack can survive in AC rooms having indirect bright light. (Away from AC vents).', 'hh.jfif', 1, '', 1, 1),
(50, '5fc500cd9a2c4', 12, 24, 0, 'Mini Succulent Garden Pack', '750', 'Pack of 2 Beautiful Succulents\r\nAny beautiful succulent plants - 3\r\n3 inch (8 cm) Grower Round Plastic Pot - 2', 'hh1.jfif', 1, NULL, 1, 1),
(51, '5fc500cd9a2c4', 9, 24, 11, 'Thank You Hampers', '499', 'Premium, unscented  \r\nEmbellished with white gypsophila gypsy fillers and victoria leaf\r\nWrapped in Happy Birthday pink paper and non woven plain pink paper\r\nFNP Green message card and lock string\r\nTied with FNP branded pink and red organza ribbon\r\nTruffle cream cake (500gm)', 'oo5.jfif', 1, NULL, 2, 1),
(52, '5fc500cd9a2c4', 9, 24, 11, 'Mini Succulent Garden Pack', '750', 'Pack of 2 Beautiful Succulents\r\nAny beautiful succulent plants - 3\r\n3 inch (8 cm) Grower Round Plastic Pot - 2', 'hh1.jfif', 1, NULL, 3, 1),
(53, '5fc500cd9a2c4', 9, 24, 11, 'Mothers Day special', '299', 'Pack of 2 Beautiful Succulents\r\nAny beautiful succulent plants - 3\r\n3 inch (8 cm) Grower Round Plastic Pot - 2', 'oo3.jfif', 1, NULL, 2, 1),
(54, '5fc500cd9a2c4', 9, 24, 11, 'Gifts for birthday ', '750', 'Pack of 2 Beautiful Succulents\r\nAny beautiful succulent plants - 3\r\n3 inch (8 cm) Grower Round Plastic Pot - 2', 'oo4.jfif', 1, NULL, 2, 1),
(55, '5fc500cd9a2c4', 9, 24, 11, 'valentines special for you ', '999', 'Pack of 2 Beautiful Succulents\r\nAny beautiful succulent plants - 3\r\n3 inch (8 cm) Grower Round Plastic Pot - 2', 'oo1.jfif', 1, NULL, 3, 1),
(56, '5fc500cd9a2c4', 9, 24, 11, 'Big Bang Hampers', '1999', 'Pack of 8 Beautiful Succulents\r\nAny beautiful succulent plants - 9\r\n3 inch (8 cm) Grower Round Plastic Pot - 2', 'oo6.jfif', 1, NULL, 2, 1),
(57, '5fc500cd9a2c4', 9, 24, 10, 'Yellow Roses ', '199', 'This product will be Hand Delivered to your doorstep.\r\nThe image displayed is indicative in nature.\r\nSince plants are natural products, actual product may vary in shape, as per the availability.', 'll2.jfif', 1, NULL, 2, 1),
(58, '5fc500cd9a2c4', 9, 24, 10, 'Red Roses', '299', 'his product will be Hand Delivered to your doorstep.\r\nThe image displayed is indicative in nature.\r\nSince plants are natural products, actual product may vary in shape, as per the availability.', 'll1.jfif', 1, NULL, 2, 1),
(59, '5fc500cd9a2c4', 9, 24, 10, 'Pink Roses', '89', 'This product will be Hand Delivered to your doorstep.\r\nThe image displayed is indicative in nature.\r\nSince plants are natural products, actual product may vary in shape, as per the availability.', 'll4.jfif', 1, NULL, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_cart`
--

CREATE TABLE `product_cart` (
  `s_no` int(11) NOT NULL,
  `p_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `sub_cat_id` int(11) NOT NULL,
  `sub_cat_title` varchar(100) NOT NULL,
  `cat_parent` int(11) NOT NULL,
  `cat_products` int(11) NOT NULL DEFAULT 0,
  `show_in_header` tinyint(4) NOT NULL DEFAULT 1,
  `show_in_footer` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`sub_cat_id`, `sub_cat_title`, `cat_parent`, `cat_products`, `show_in_header`, `show_in_footer`) VALUES
(19, 'Plants', 9, 2, 1, 0),
(21, 'Combos', 9, 0, 1, 0),
(20, 'Accesories', 9, 0, 1, 0),
(18, 'Flowers', 9, 2, 1, 1),
(22, 'Kitchen', 12, 0, 1, 0),
(23, 'Tableware', 12, 0, 0, 1),
(24, 'gardening', 12, 1, 0, 1),
(25, 'Pebbles', 12, 2, 1, 1),
(26, 'Pots', 10, 2, 1, 1),
(27, 'seeds', 11, 1, 1, 1),
(28, 'Fertilizers', 11, 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `f_name` varchar(50) NOT NULL,
  `l_name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `address` text NOT NULL,
  `city` text NOT NULL,
  `user_role` int(11) DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `f_name`, `l_name`, `username`, `email`, `password`, `mobile`, `address`, `city`, `user_role`) VALUES
(2, 'user12', 'user', 'user@gmail.com', '', '24c9e15e52afc47c225b757e7bee1f9d', '9856231042', '#1234', 'delhi', 1),
(3, 'user2', 'user last', 'user2@gmail.com', '', '7e58d63b60197ceb55a1c487989a3720', '9999999999', '#kdjfg s gfd gdfjgkdsf gsdfkgjk', 'Delhi', 1),
(4, 'user3', 'user last', 'user3@gmail.com', '', '92877af70a45fd6a2ed7fe81e1236b78', '9999999999', '#hsd sdfsd fs df asdf', 'dsf asdf a', 1),
(5, 'user testing', 'user last', 'user4@gmail.com', '', '3f02ebe3d7929b091e3d8ccfde2f3bc6', '999999999', '#dsjg sdf sd f', 'dskfs f aslkf', 1),
(6, 'sadsadsa', 'sdsadsa', 'hh@gmail.com', '', '5e36941b3d856737e81516acd45edc50', '999999999', 'dsfsd fs', 'sdf a', 1),
(7, 'dsf sdfsd safasd', 'sdd fsdfsadf', 'user5@gmail.com', '', '0a791842f52a0acfbb3a783378c066b8', '9999999999', 'dsf adfasd', 'dsafsadf', 1),
(8, 'dsf sdfsd safasd', 'sdd fsdfsadf', 'user51@gmail.com', '', '0a791842f52a0acfbb3a783378c066b8', '9999999999', 'dsf adfasd', 'dsafsadf', 1),
(9, 'dsf sdfsd safasd', 'sdd fsdfsadf', 'user51s@gmail.com', '', '0a791842f52a0acfbb3a783378c066b8', '9999999999', 'dsf adfasd', 'dsafsadf', 1),
(10, 'sfnsdfbsd', 'sdfasdfsa', 'useryusdfnds@gmail.com', '', 'ba407c68e2448c005ee7459f89dd3e63', '9999999999', '#d dsfh', 'dsfdsf', 1),
(11, 's ds ad', 'sad sad', 'rti@gmail.com', '', '620dc68bbfc5d7654e44817a8d3b2cdf', '9999999999', '#fg', 'adsad', 1),
(12, 's ds ad', 'sad sad', 'rtis@gmail.com', '', '620dc68bbfc5d7654e44817a8d3b2cdf', '9999999999', '#fg', 'adsad', 1),
(13, 's ds ad', 'sad sad', 'rtisf@gmail.com', '', '620dc68bbfc5d7654e44817a8d3b2cdf', '9999999999', '#fg', 'adsad', 1),
(14, 'final user', 'user last', 'userf@gmail.com', '', 'add5092c13fbcc5cceaf1fdb98411871', '9999999999', 'lcnsd', 'dsfs df', 1),
(15, 'megharaj', 'narkhede', 'megharajnarkhede0@gmail.com', '', '25d55ad283aa400af464c76d713c07ad', '7558386492', 'chavdi javal faizpur tal yawal', 'nashik', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`s_no`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_cart`
--
ALTER TABLE `product_cart`
  ADD PRIMARY KEY (`s_no`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`sub_cat_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `s_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `product_cart`
--
ALTER TABLE `product_cart`
  MODIFY `s_no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `sub_cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
