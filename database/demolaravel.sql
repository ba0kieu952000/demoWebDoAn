-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 23, 2021 lúc 06:02 AM
-- Phiên bản máy phục vụ: 10.4.14-MariaDB
-- Phiên bản PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `demolaravel`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_12_20_165811_create_tbl_admin_table', 1),
(5, '2020_12_25_100436_create_tbl_category_product', 2),
(6, '2020_12_25_101407_create_tbl_category_product', 3),
(7, '2020_12_29_141402_create_tbl_brand_product', 4),
(9, '2021_01_23_105139_create_tbl_product', 5),
(10, '2021_04_10_152227_tbl_customer', 6),
(11, '2021_04_10_162826_tbl_shipping', 7),
(12, '2021_04_19_163332_tbl_order', 8),
(13, '2021_04_19_163549_tbl_order_details', 8);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `admin_id` int(10) UNSIGNED NOT NULL,
  `admin_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_admin`
--

INSERT INTO `tbl_admin` (`admin_id`, `admin_password`, `admin_email`, `admin_phone`, `admin_name`, `created_at`, `updated_at`) VALUES
(1, '4297f44b13955235245b2497399d7a93', 'admin@gmail.com', '0334914295', 'QuocBao', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_brand_product`
--

CREATE TABLE `tbl_brand_product` (
  `brand_id` int(10) UNSIGNED NOT NULL,
  `brand_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_brand_product`
--

INSERT INTO `tbl_brand_product` (`brand_id`, `brand_name`, `brand_desc`, `brand_status`, `created_at`, `updated_at`) VALUES
(1, 'Apple', 'Thương hiệu nhà táo!', 1, NULL, NULL),
(3, 'Asus', 'Asus', 1, NULL, NULL),
(5, 'Vsmart', 'Một thương hiệu của người Việt', 1, NULL, NULL),
(6, 'Oppo', 'Hãng Oppo', 1, NULL, NULL),
(7, 'Samsung', 'Một thương hiệu đến từ Hàn, đây là một tập đoàn công nghê lớn.', 1, NULL, NULL),
(8, 'Dell', 'Hãng sản xuất Dell nổi tiếng đứng Top.', 1, NULL, NULL),
(9, 'HP', 'Một trong những công ty lớn mạnh và thành công', 1, NULL, NULL),
(10, 'Lenovo', 'Hãng sản xuất Lenovo', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_category_product`
--

CREATE TABLE `tbl_category_product` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_category_product`
--

INSERT INTO `tbl_category_product` (`category_id`, `category_name`, `category_desc`, `category_status`, `created_at`, `updated_at`) VALUES
(6, 'Điện thoại', 'Các loại Smart Phone', 1, NULL, NULL),
(7, 'Laptop', 'Các loại máy tính sách tay', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_customers`
--

CREATE TABLE `tbl_customers` (
  `customer_id` int(10) UNSIGNED NOT NULL,
  `customer_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_customers`
--

INSERT INTO `tbl_customers` (`customer_id`, `customer_name`, `customer_email`, `customer_password`, `customer_phone`, `created_at`, `updated_at`) VALUES
(1, 'Quốc Bảo', 'admin@gmail.com', '4297f44b13955235245b2497399d7a93', '0334914295', NULL, NULL),
(2, 'BaoKieu', 'ba0kieu952000@gmail.com', '398c676087ee785c884a424124a4a329', '0334914295', NULL, NULL),
(3, 'aaaaa', 'admin@gmail.com', '4297f44b13955235245b2497399d7a93', '01234564789', NULL, NULL),
(4, 'sdfsdf', 'admin@gmail.com', '4297f44b13955235245b2497399d7a93', '0123456798', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_order`
--

CREATE TABLE `tbl_order` (
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` int(11) NOT NULL,
  `shipping_id` int(11) NOT NULL,
  `order_total` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_order`
--

INSERT INTO `tbl_order` (`order_id`, `customer_id`, `shipping_id`, `order_total`, `order_status`, `created_at`, `updated_at`) VALUES
(7, 2, 6, '25,380,000.00', 0, NULL, NULL),
(8, 2, 6, '25,380,000.00', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_order_details`
--

CREATE TABLE `tbl_order_details` (
  `order_details_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_sales_quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_order_details`
--

INSERT INTO `tbl_order_details` (`order_details_id`, `order_id`, `product_id`, `product_name`, `product_price`, `product_sales_quantity`, `created_at`, `updated_at`) VALUES
(1, 7, 44, 'OPPO Reno4', '7490000', 1, NULL, NULL),
(2, 7, 39, 'Lenovo Ideapad Flex 5', '17890000', 1, NULL, NULL),
(3, 8, 44, 'OPPO Reno4', '7490000', 1, NULL, NULL),
(4, 8, 39, 'Lenovo Ideapad Flex 5', '17890000', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_product`
--

CREATE TABLE `tbl_product` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `product_desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_product`
--

INSERT INTO `tbl_product` (`product_id`, `product_name`, `category_id`, `brand_id`, `product_desc`, `product_content`, `product_price`, `product_image`, `product_status`, `created_at`, `updated_at`) VALUES
(10, 'Iphone 12 pro max (Xanh dương 128GB)', 6, 1, '<p>Chip: A14 Bionic chip</p>\r\n\r\n<p>GB: 128gb.</p>\r\n\r\n<p>Camera: Pro 12MP Ultra Wide&nbsp;</p>\r\n\r\n<p>SIM Card: Dual SIM (nano-SIM and eSIM)</p>', '<p>&nbsp;- Display:</p>\r\n\r\n<p>+ &nbsp;Super Retina XDR display</p>\r\n\r\n<p>+ 6.7‑inch (diagonal) all-screen OLED display</p>\r\n\r\n<p>+ 2778‑by‑1284‑pixel resolution at 458 ppi</p>\r\n\r\n<p>&nbsp;- GB:&nbsp; 128gb</p>\r\n\r\n<p>&nbsp;- Chip: A14 Bionic chip</p>\r\n\r\n<p>&nbsp;- Camera:&nbsp;</p>\r\n\r\n<p>+ Pro 12MP Ultra Wide and Wide cameras</p>\r\n\r\n<p>+ Ultra Wide: &fnof;/2.4 aperture and 120&deg; field of view</p>\r\n\r\n<p>+ Digital zoom up to 10x (iphone 12 Pro)</p>\r\n\r\n<p>+ Five‑element lens (Ultra Wide); six-elements lens(Telephoto); seven‑element lens (Wide)</p>\r\n\r\n<p>+ Night mode portrairs enabled by LiDAR Scanner</p>\r\n\r\n<p>+ Apple ProRaw*</p>\r\n\r\n<p>&nbsp;- SIM Card: Dual SIM (nano-SIM and eSIM)</p>\r\n\r\n<p><strong>- Power and Battery: </strong></p>\r\n\r\n<p><strong>+ B</strong>uilt-in rechargeable lithium‑ion battery</p>\r\n\r\n<p>+ Charging via USB to computer system or power&nbsp;adapter</p>\r\n\r\n<p>+ Qi wireless charging up to 7.5W10</p>\r\n\r\n<p>+ F<strong>ast-charge capable</strong>: Up to 50% charge in 30 minutes&nbsp;with 20W adapter or higher (sold separately)</p>\r\n\r\n<p>+ Magsafe wireless charging up to 15W10</p>\r\n\r\n<p>&nbsp;- Operating System: IOS 14</p>\r\n\r\n<p>&nbsp;</p>', '29900000', 'iphone-12-pro-max-xanh-duong-new-600x600-600x60015.jpg', 1, NULL, NULL),
(11, 'Iphone 12 pro max (Xanh dương  256GB)', 6, 1, '<p>Chip: A14 Bionic chip</p>\r\n\r\n<p>GB: 256gb</p>\r\n\r\n<p>Camera: Pro 12MP Ultra Wide&nbsp;</p>\r\n\r\n<p>SIM Card: Dual SIM (nano-SIM and eSIM)</p>', '<p>&nbsp;- Display:</p>\r\n\r\n<p>+ &nbsp;Super Retina XDR display</p>\r\n\r\n<p>+ 6.7‑inch (diagonal) all-screen OLED display</p>\r\n\r\n<p>+ 2778‑by‑1284‑pixel resolution at 458 ppi</p>\r\n\r\n<p>&nbsp;- GB:&nbsp; 128gb</p>\r\n\r\n<p>&nbsp;- Chip: A14 Bionic chip</p>\r\n\r\n<p>&nbsp;- Camera:&nbsp;</p>\r\n\r\n<p>+ Pro 12MP Ultra Wide and Wide cameras</p>\r\n\r\n<p>+ Ultra Wide: &fnof;/2.4 aperture and 120&deg; field of view</p>\r\n\r\n<p>+ Digital zoom up to 10x (iphone 12 Pro)</p>\r\n\r\n<p>+ Five‑element lens (Ultra Wide); six-elements lens(Telephoto); seven‑element lens (Wide)</p>\r\n\r\n<p>+ Night mode portrairs enabled by LiDAR Scanner</p>\r\n\r\n<p>+ Apple ProRaw*</p>\r\n\r\n<p>&nbsp;- SIM Card: Dual SIM (nano-SIM and eSIM)</p>\r\n\r\n<p><strong>- Power and Battery:</strong></p>\r\n\r\n<p><strong>+ B</strong>uilt-in rechargeable lithium‑ion battery</p>\r\n\r\n<p>+ Charging via USB to computer system or power&nbsp;adapter</p>\r\n\r\n<p>+ Qi wireless charging up to 7.5W10</p>\r\n\r\n<p>+ F<strong>ast-charge capable</strong>: Up to 50% charge in 30 minutes&nbsp;with 20W adapter or higher (sold separately)</p>\r\n\r\n<p>+ Magsafe wireless charging up to 15W10</p>\r\n\r\n<p>&nbsp;- Operating System: IOS 14</p>', '34999000', 'iphone-12-pro-max-xanh-duong-new-600x600-600x60062.jpg', 1, NULL, NULL),
(12, 'Iphone 12 pro max (Xanh dương 512GB)', 6, 1, '<p>Chip: A14 Bionic chip</p>\r\n\r\n<p>GB: 512gb</p>\r\n\r\n<p>Camera: Pro 12MP Ultra Wide&nbsp;</p>\r\n\r\n<p>SIM Card: Dual SIM (nano-SIM and eSIM)</p>', '<p>&nbsp;- Display:</p>\r\n\r\n<p>+ &nbsp;Super Retina XDR display</p>\r\n\r\n<p>+ 6.7‑inch (diagonal) all-screen OLED display</p>\r\n\r\n<p>+ 2778‑by‑1284‑pixel resolution at 458 ppi</p>\r\n\r\n<p>&nbsp;- GB:&nbsp; 128gb</p>\r\n\r\n<p>&nbsp;- Chip: A14 Bionic chip</p>\r\n\r\n<p>&nbsp;- Camera:&nbsp;</p>\r\n\r\n<p>+ Pro 12MP Ultra Wide and Wide cameras</p>\r\n\r\n<p>+ Ultra Wide: &fnof;/2.4 aperture and 120&deg; field of view</p>\r\n\r\n<p>+ Digital zoom up to 10x (iphone 12 Pro)</p>\r\n\r\n<p>+ Five‑element lens (Ultra Wide); six-elements lens(Telephoto); seven‑element lens (Wide)</p>\r\n\r\n<p>+ Night mode portrairs enabled by LiDAR Scanner</p>\r\n\r\n<p>+ Apple ProRaw*</p>\r\n\r\n<p>&nbsp;- SIM Card: Dual SIM (nano-SIM and eSIM)</p>\r\n\r\n<p><strong>- Power and Battery:</strong></p>\r\n\r\n<p><strong>+ B</strong>uilt-in rechargeable lithium‑ion battery</p>\r\n\r\n<p>+ Charging via USB to computer system or power&nbsp;adapter</p>\r\n\r\n<p>+ Qi wireless charging up to 7.5W10</p>\r\n\r\n<p>+ F<strong>ast-charge capable</strong>: Up to 50% charge in 30 minutes&nbsp;with 20W adapter or higher (sold separately)</p>\r\n\r\n<p>+ Magsafe wireless charging up to 15W10</p>\r\n\r\n<p>&nbsp;- Operating System: IOS 14</p>', '39000000', 'iphone-12-pro-max-xanh-duong-new-600x600-600x60016.jpg', 1, NULL, NULL),
(13, 'Iphone 12 Pro (Bạc 128GB)', 6, 1, '<p>- Chip:&nbsp;A14 Bionic chip</p>\r\n\r\n<p>- Bộ nhớ:&nbsp; 128gb</p>\r\n\r\n<p>- Hệ điều h&agrave;nh: IOS</p>\r\n\r\n<p>- Display: 6.1 inch OLED</p>', '<p>- Display:</p>\r\n\r\n<p>+ &nbsp;Super Retina XDR display</p>\r\n\r\n<p>+ 6.1‑inch (diagonal) all-screen OLED display</p>\r\n\r\n<p>+ 2532‑by‑1170‑pixel resolution at 460 ppi</p>\r\n\r\n<p>- GB: &nbsp;128gb.</p>\r\n\r\n<p>- Chip: A14 Bionic chip</p>\r\n\r\n<p>- Camera:&nbsp;</p>\r\n\r\n<p>+ Pro 12MP Ultra Wide and Wide cameras</p>\r\n\r\n<p>+ Ultra Wide: &fnof;/2.4 aperture and 120&deg; field of view</p>\r\n\r\n<p>+ Digital zoom up to 10x (iphone 12 Pro)</p>\r\n\r\n<p>+ Five‑element lens (Ultra Wide); six-elements lens(Telephoto); seven‑element lens (Wide)</p>\r\n\r\n<p>+ Night mode portrairs enabled by LiDAR Scanner</p>\r\n\r\n<p>+ Apple ProRaw*</p>\r\n\r\n<p>- SIM Card: Dual SIM (nano-SIM and eSIM)</p>\r\n\r\n<p>- Power and Battery:</p>\r\n\r\n<p>+<strong> B</strong>uilt-in rechargeable lithium‑ion battery</p>\r\n\r\n<p>+ Charging via USB to computer system or power&nbsp;adapter</p>\r\n\r\n<p>+ Qi wireless charging up to 7.5W10</p>\r\n\r\n<p>+ F<strong>ast-charge capable</strong>: Up to 50% charge in 30 minutes&nbsp;with 20W adapter or higher (sold separately)</p>\r\n\r\n<p>+ Magsafe wireless charging up to 15W10</p>\r\n\r\n<p>- Operating System: IOS 14</p>', '28990000', 'iphone-12-pro-bac-new-600x600-600x60092.jpg', 1, NULL, NULL),
(14, 'Iphone 12 (Xanh dương 64GB)', 6, 1, '<p>- Chip:&nbsp;A14 Bionic chip</p>\r\n\r\n<p>- Bộ nhớ:&nbsp; 64gb</p>\r\n\r\n<p>- Hệ điều h&agrave;nh: IOS</p>\r\n\r\n<p>- Display:&nbsp;6.1‑inch&nbsp;all-screen OLED</p>', '<p>- Display:</p>\r\n\r\n<p>+ &nbsp;Super Retina XDR display</p>\r\n\r\n<p>+ 6.1‑inch (diagonal) all-screen OLED display</p>\r\n\r\n<p>+ 2532‑by‑1170‑pixel resolution at 460 ppi</p>\r\n\r\n<p>- GB: 64gb</p>\r\n\r\n<p>- Chip: A14 Bionic chip</p>\r\n\r\n<p>- Camera:&nbsp;</p>\r\n\r\n<p>+ Dual 12MP Ultra Wide and Wide cameras</p>\r\n\r\n<p>+ Ultra Wide: &fnof;/2.4 aperture and 120&deg; field of view</p>\r\n\r\n<p>+ Digital zoom up to 5x</p>\r\n\r\n<p>+ Five‑element lens (Ultra Wide); seven‑element lens (Wide)</p>\r\n\r\n<p>+ 100% Focus Pixels (Wide)</p>\r\n\r\n<p>+ Next-generation Smart HDR for photos</p>\r\n\r\n<p>- SIM Card: Dual SIM (nano-SIM and eSIM)</p>\r\n\r\n<p><strong>-</strong> Power and Battery:</p>\r\n\r\n<p>+<strong> B</strong>uilt-in rechargeable lithium‑ion battery</p>\r\n\r\n<p>+ Charging via USB to computer system or power&nbsp;adapter</p>\r\n\r\n<p>+ Qi wireless charging up to 7.5W10</p>\r\n\r\n<p>+ Fast-charge capable: Up to 50% charge in 30 minutes&nbsp;with 20W adapter or higher (sold separately)</p>\r\n\r\n<p>+ Magsafe wireless charging up to 15W10</p>\r\n\r\n<p>- Operating System: IOS 14</p>', '22990000', 'iphone-12-xanh-duong-new-600x600-600x60088.jpg', 1, NULL, NULL),
(15, 'Iphone 12 (Đỏ 64GB)', 6, 1, '<p>- Chip:&nbsp;A14 Bionic chip</p>\r\n\r\n<p>- Bộ nhớ:&nbsp; 64gb</p>\r\n\r\n<p>- Hệ điều h&agrave;nh: IOS</p>\r\n\r\n<p>- Display:&nbsp;6.1‑inch&nbsp;all-screen OLED</p>', '<p>- Display:</p>\r\n\r\n<p>+ &nbsp;Super Retina XDR display</p>\r\n\r\n<p>+ 6.1‑inch (diagonal) all-screen OLED display</p>\r\n\r\n<p>+ 2532‑by‑1170‑pixel resolution at 460 ppi</p>\r\n\r\n<p>- GB: 64gb</p>\r\n\r\n<p>- Chip: A14 Bionic chip</p>\r\n\r\n<p>- Camera:&nbsp;</p>\r\n\r\n<p>+ Dual 12MP Ultra Wide and Wide cameras</p>\r\n\r\n<p>+ Ultra Wide: &fnof;/2.4 aperture and 120&deg; field of view</p>\r\n\r\n<p>+ Digital zoom up to 5x</p>\r\n\r\n<p>+ Five‑element lens (Ultra Wide); seven‑element lens (Wide)</p>\r\n\r\n<p>+ 100% Focus Pixels (Wide)</p>\r\n\r\n<p>+ Next-generation Smart HDR for photos</p>\r\n\r\n<p>- SIM Card: Dual SIM (nano-SIM and eSIM)</p>\r\n\r\n<p><strong>-</strong>&nbsp;Power and Battery:</p>\r\n\r\n<p>+<strong>&nbsp;B</strong>uilt-in rechargeable lithium‑ion battery</p>\r\n\r\n<p>+ Charging via USB to computer system or power&nbsp;adapter</p>\r\n\r\n<p>+ Qi wireless charging up to 7.5W10</p>\r\n\r\n<p>+ Fast-charge capable: Up to 50% charge in 30 minutes&nbsp;with 20W adapter or higher (sold separately)</p>\r\n\r\n<p>+ Magsafe wireless charging up to 15W10</p>\r\n\r\n<p>- Operating System: IOS 14</p>', '22990000', 'iphone-12-do-new-600x600-200x20065.jpg', 1, NULL, NULL),
(16, 'Iphone 11 128GB', 6, 1, '<p>Chip:&nbsp;A11 Bionic chip</p>\r\n\r\n<p>Bộ nhớ: 128gb</p>\r\n\r\n<p>Hệ điều h&agrave;nh: IOS</p>\r\n\r\n<p>Display:&nbsp;</p>\r\n\r\n<p>Camera: Dual 12MP Ultra Wide and Wide cameras</p>', '<p>- Display:</p>\r\n\r\n<p>+ &nbsp;Liquid Retina HD display</p>\r\n\r\n<p>+ 6.1‑inch (diagonal) all-screen LCD Multi-Touch display with IPS technology</p>\r\n\r\n<p>+ 1792‑by‑828‑pixel resolution at 326 ppi</p>\r\n\r\n<p>- GB: 128gb</p>\r\n\r\n<p>- Chip: A11 Bionic chip</p>\r\n\r\n<p>- Camera: &nbsp;</p>\r\n\r\n<p>+ Dual 12MP Ultra Wide and Wide cameras</p>\r\n\r\n<p>+ Ultra Wide: &fnof;/2.4 aperture and 120&deg; field of view</p>\r\n\r\n<p>+ Five‑element lens (Ultra Wide); six‑element lens (Wide)</p>\r\n\r\n<p>+ 100% Focus Pixels (Wide)</p>\r\n\r\n<p>+ Next-generation Smart HDR for photos</p>\r\n\r\n<p>- Apple Card:</p>\r\n\r\n<p>+ Credit card created by Apple, designed for iPhone</p>\r\n\r\n<p>+ Pay with Apple Pay using Face ID in stores, within apps, and on the web</p>\r\n\r\n<p>+Use the Wallet app to apply for, manage, and use Apple Card</p>\r\n\r\n<p>- SIM Card: Dual SIM (nano-SIM and eSIM)</p>\r\n\r\n<p>- Power and Battery:</p>\r\n\r\n<p>+ Lasts up to 1&nbsp;hour longer than iPhone&nbsp;XR</p>\r\n\r\n<p>+ Built-in rechargeable lithium‑ion battery</p>\r\n\r\n<p>+ Charging via USB to computer system or power&nbsp;adapter</p>\r\n\r\n<p>+ Wireless charging</p>\r\n\r\n<p>+ Fast-charge capabl<strong>e</strong>: Up to 50% charge in 30 minutes&nbsp;with 18W adapter or higher (sold separately)</p>', '19490000', 'iphone-11-xanhla-600x600-1-600x60073.jpg', 1, NULL, NULL),
(17, 'Iphone 8 Plus 128GB', 6, 1, '<p>Chip:&nbsp;A11 Bionic chip</p>\r\n\r\n<p>Bộ nhớ: 128gb</p>\r\n\r\n<p>Hệ điều h&agrave;nh: IOS</p>\r\n\r\n<p>Camera:&nbsp;Dual 12MP Wide, and Telephoto cameras</p>', '<p>- Display:</p>\r\n\r\n<p>+ 5.5-inch (diagonal) widescreen LCD Multi‑Touch display with IPS technology</p>\r\n\r\n<p>+ Retina HD display</p>\r\n\r\n<p>+ HDR display</p>\r\n\r\n<p>+ 1920-by-1080-pixel resolution at 401&nbsp;ppi</p>\r\n\r\n<p>+ 625 nits max brightness (typical)</p>\r\n\r\n<p>- GB: 128gb</p>\r\n\r\n<p>- Chip: A11 Bionic chip</p>\r\n\r\n<p>- Camera:&nbsp;</p>\r\n\r\n<p>+ Dual 12MP Wide, and Telephoto cameras</p>\r\n\r\n<p>+ Wide: &fnof;/1.8 aperture</p>\r\n\r\n<p>+ Telephoto: &fnof;/2.8 aperture</p>\r\n\r\n<p>+ Portrait mode</p>\r\n\r\n<p>+ 2x optical zoom in; digital zoom up to&nbsp;10x</p>\r\n\r\n<p>+ Auto HDR for photos</p>\r\n\r\n<p>- Apple Card:</p>\r\n\r\n<p>+ Credit card created by Apple, designed for iPhone</p>\r\n\r\n<p>+ Pay with Apple Pay using Face ID in stores, within apps, and on the web</p>\r\n\r\n<p>+Use the Wallet app to apply for, manage, and use Apple Card</p>\r\n\r\n<p>- SIM Card: Nano-SIM</p>\r\n\r\n<p><strong>- </strong>Power and Battery:</p>\r\n\r\n<p>+ <strong>L</strong>asts about the same as iPhone&nbsp;7&nbsp;Plus</p>\r\n\r\n<p>+ Built-in rechargeable lithium‑ion battery</p>\r\n\r\n<p>+ Charging via USB to computer system or power&nbsp;adapter</p>\r\n\r\n<p>+ Fast-charge capable</p>\r\n\r\n<p>+ Up to 50% charge in 30 minutes&nbsp;with 18W adapter or higher (sold separately)</p>', '5990000', 'iphone-8-plus-hh-600x600-600x60046.jpg', 1, NULL, NULL),
(18, 'Iphone SE 2020 64GB', 6, 1, '<p>Chip:&nbsp;A13 Bionic chip</p>\r\n\r\n<p>Hệ điều h&agrave;nh: IOS</p>\r\n\r\n<p>Bộ nhớ: 64gb</p>\r\n\r\n<p>Camera:&nbsp;Single 12MP Wide camera</p>', '<p>- Display:</p>\r\n\r\n<p>+ Retina HD display</p>\r\n\r\n<p>+ 4.7‑inch (diagonal) widescreen LCD Multi-Touch display with IPS technology</p>\r\n\r\n<p>+ 1334‑by‑750‑pixel resolution at 326 ppi</p>\r\n\r\n<p>+ 1400:1 contrast ratio (typical)</p>\r\n\r\n<p>+ 625 nits max brightness (typical)</p>\r\n\r\n<p>- GB: 64gb</p>\r\n\r\n<p>- Chip: A13 Bionic chip</p>\r\n\r\n<p>- Camera:&nbsp;</p>\r\n\r\n<p>+ Single 12MP Wide camera</p>\r\n\r\n<p>+ Ultra Wide: &fnof;/1.8 aperture</p>\r\n\r\n<p>+ Five‑element lens (Ultra Wide); six‑element lens (Wide)</p>\r\n\r\n<p>+ True Tone flash with Slow Sync</p>\r\n\r\n<p>+ Portrait Lighting with six effects (Natural, Studio, Contour, Stage, Stage&nbsp;Mono, High‑Key&nbsp;Mono)</p>\r\n\r\n<p>- Apple Card:</p>\r\n\r\n<p>+ Credit card created by Apple, designed for iPhone</p>\r\n\r\n<p>+ Pay with Apple Pay using Face ID in stores, within apps, and on the web</p>\r\n\r\n<p>+Use the Wallet app to apply for, manage, and use Apple Card</p>\r\n\r\n<p>- SIM Card: Dual SIM (nano-SIM and eSIM)</p>\r\n\r\n<p>- Power and Battery<strong>: </strong></p>\r\n\r\n<p>+<strong> </strong>Lasts about the same as iPhone&nbsp;8</p>\r\n\r\n<p>+ Built-in rechargeable lithium‑ion battery</p>\r\n\r\n<p>+ Charging via USB to computer system or power&nbsp;adapter</p>\r\n\r\n<p>+ Wireless charging</p>\r\n\r\n<p>+ Fast-charge capable: Up to 50% charge in 30 minutes&nbsp;with 18W adapter or higher (sold separately)</p>', '10490000', 'iphone-se-2020-trang-600x600-600x60033.jpg', 1, NULL, NULL),
(19, 'Iphone X 64GB', 6, 1, '<p>Chip: A11 Bionic chip</p>\r\n\r\n<p>Bộ nhớ: 64gb</p>\r\n\r\n<p>Hệ điều h&agrave;nh: IOS</p>\r\n\r\n<p>Camera:&nbsp;Dual 12MP Wide,&nbsp;Telephoto cameras</p>', '<p>- Display:</p>\r\n\r\n<p>+ Super Retina HD display</p>\r\n\r\n<p>+ 5.8‑inch (diagonal) all-screen OLED Multi-Touch display</p>\r\n\r\n<p>+ 2436‑by‑1125‑pixel resolution at 458 ppi</p>\r\n\r\n<p>+ 1,000,000:1 contrast ratio (typical)</p>\r\n\r\n<p>+ 625 nits max brightness (typical)</p>\r\n\r\n<p>+ 3D touch</p>\r\n\r\n<p>- GB: 64gb, 256gb</p>\r\n\r\n<p>- Chip: A11 Bionic chip</p>\r\n\r\n<p>- Camera:&nbsp;</p>\r\n\r\n<p>+ Dual 12MP Wide and Telephoto cameras</p>\r\n\r\n<p>+ Ultra Wide: &fnof;/1.8 aperture</p>\r\n\r\n<p>+ Telephoto: &fnof;/2.4 aperture</p>\r\n\r\n<p>+ True Tone flash with Slow Sync</p>\r\n\r\n<p>+ Portrait Lighting with six effects (Natural, Studio, Contour, Stage, Stage&nbsp;Mono, High‑Key&nbsp;Mono)</p>\r\n\r\n<p>- Apple Card:</p>\r\n\r\n<p>+ Credit card created by Apple, designed for iPhone</p>\r\n\r\n<p>+ Pay with Apple Pay using Face ID in stores, within apps, and on the web</p>\r\n\r\n<p>+Use the Wallet app to apply for, manage, and use Apple Card</p>\r\n\r\n<p>- SIM Card: Dual SIM (nano-SIM and eSIM)</p>\r\n\r\n<p>- Power and Battery:</p>\r\n\r\n<p>+ Lasts up to 2 hours longer than iPhone&nbsp;7</p>\r\n\r\n<p>+ Built-in rechargeable lithium‑ion battery</p>\r\n\r\n<p>+ Charging via USB to computer system or power&nbsp;adapter</p>\r\n\r\n<p>+ Video playback :&nbsp;Up to 13&nbsp;hours</p>\r\n\r\n<p>+ Audio playback:&nbsp;Up to 60&nbsp;hours</p>\r\n\r\n<p>+ Fast-charge capable: Up to 50% charge in 30 minutes&nbsp;with 18W adapter or higher (sold separately)</p>', '8990000', 'iphone-x-256gb-silver-600x600-ud-600x60012.jpg', 1, NULL, NULL),
(20, 'Vsmart Bee 3', 6, 5, '<p>CPU: Media Tek MT6739WW 4 nh&acirc;n</p>\r\n\r\n<p>Ram: 2G</p>\r\n\r\n<p>Bộ nhớ trong: 16gb</p>\r\n\r\n<p>M&agrave;n h&igrave;nh: IPS LCD, 6.0&quot;, HD+</p>\r\n\r\n<p>Pin: 3000 mAh</p>\r\n\r\n<p>Camera trước - sau: 5 - 8 MP</p>', '<p>CPU: Media Tek MT6739WW 4 nh&acirc;n</p>\r\n\r\n<p>Ram: 2G</p>\r\n\r\n<p>Bộ nhớ trong: 16gb</p>\r\n\r\n<p>M&agrave;n h&igrave;nh: IPS LCD, 6.0&quot;, HD+</p>\r\n\r\n<p>Pin: 3000 mAh</p>\r\n\r\n<p>Camera trước - sau: 5 - 8 MP</p>\r\n\r\n<p>Thẻ nhớ: MicroSD, hỗ trợ tối đa 64gb</p>\r\n\r\n<p>Thẻ Sim: 2 sim, hỗ trợ 4G</p>', '1550000', 'vsmart-bee-3-blue-600x60067.jpg', 1, NULL, NULL),
(21, 'Vsmart Aris Pro', 6, 5, '<p>CPU: Snapdragon 730 8 nh&acirc;n</p>\r\n\r\n<p>Ram: 8GB</p>\r\n\r\n<p>Bộ nhớ trong: 128gb</p>\r\n\r\n<p>Hệ điều h&agrave;nh: Android 10</p>\r\n\r\n<p>Pin: 4000 mAh - c&oacute; sạc nhanh</p>', '<p>M&agrave;n h&igrave;nh: AMOLED, 6.39&quot;, Full HD+</p>\r\n\r\n<p>Camera sau: Ch&iacute;nh 64MP &amp; phụ 8MP, 8MP, 2MP</p>\r\n\r\n<p>Camera trước: 20MP</p>\r\n\r\n<p>CPU: Snapdragon 730 8 nh&acirc;n</p>\r\n\r\n<p>Ram: 8GB</p>\r\n\r\n<p>Bộ nhớ trong: 128gb</p>\r\n\r\n<p>Thẻ nhớ: Kh&ocirc;ng hỗ trợ</p>\r\n\r\n<p>Sim: 2 Nano sim, hỗ trợ 4G</p>\r\n\r\n<p>Hệ điều h&agrave;nh: Android 10</p>\r\n\r\n<p>Pin: 4000 mAh - c&oacute; sạc nhanh</p>', '8490000', 'vsmart-aris-pro-green-600jpg-600x60011.jpg', 1, NULL, NULL),
(22, 'Vsmart Aris', 6, 5, '<p>CPU: Snapdragon 730 8 nh&acirc;n</p>\r\n\r\n<p>Ram: 6GB</p>\r\n\r\n<p>Bộ nhớ: 64gb</p>\r\n\r\n<p>Hệ điều h&agrave;nh: Android 10</p>\r\n\r\n<p>Pin: 4000 mAh</p>', '<p>M&agrave;n h&igrave;nh: AMOLED, 6.39&quot;, Full HD+</p>\r\n\r\n<p>CPU: Snapdragon 730 8 nh&acirc;n</p>\r\n\r\n<p>Ram: 6GB</p>\r\n\r\n<p>Camera sau: Ch&iacute;nh 64MP &amp; phụ 8MP, 8MP, 2MP</p>\r\n\r\n<p>Camera trước: 20MP</p>\r\n\r\n<p>Bộ nhớ: 64gb</p>\r\n\r\n<p>Thẻ nhớ: Kh&ocirc;ng hỗ trợ</p>\r\n\r\n<p>Sim: 2 Nano sim, hỗ trợ 4G</p>\r\n\r\n<p>Hệ điều h&agrave;nh: Android 10</p>\r\n\r\n<p>Pin: 4000 mAh</p>', '6990000', 'vsmart-aris-pro-green-600jpg-600x60097.jpg', 1, NULL, NULL),
(23, 'Vsmart Live 4 6GB', 6, 5, '<p>CPU: Snapdragon 675 8 nh&acirc;n</p>\r\n\r\n<p>Ram: 6GB</p>\r\n\r\n<p>Bộ nhớ trong: 64gb</p>\r\n\r\n<p>Hệ điều h&agrave;nh: Android 10</p>\r\n\r\n<p>Pin: 5000 mAh - c&oacute; sạc nhanh</p>', '<p>M&agrave;n h&igrave;nh: LTPS IPS LCD, 6.5&quot;, Full HD+</p>\r\n\r\n<p>Camera sau: Ch&iacute;nh 48MP &amp; phụ 8MP, 5MP, 2MP</p>\r\n\r\n<p>Camera trước: 13MP</p>\r\n\r\n<p>CPU: Snapdragon 675 8 nh&acirc;n</p>\r\n\r\n<p>Ram: 6GB</p>\r\n\r\n<p>Bộ nhớ trong: 64gb</p>\r\n\r\n<p>Thẻ nhớ: Kh&ocirc;ng hỗ trợ</p>\r\n\r\n<p>Sim: 2 Nano sim, hỗ trợ 4G</p>\r\n\r\n<p>Hệ điều h&agrave;nh: Android 10</p>\r\n\r\n<p>Pin: 4000 mAh - c&oacute; sạc nhanh</p>', '4290000', 'vsmart-live-4-den-600x60072.jpg', 1, NULL, NULL),
(24, 'Vsmart Actice 3', 6, 5, '<p>CPU: Media Tek Helio P60 8 nh&acirc;n</p>\r\n\r\n<p>Ram: 6GB</p>\r\n\r\n<p>Bộ nhớ trong: 64gb</p>\r\n\r\n<p>Hệ điều h&agrave;nh: Android 9.0(PIE)</p>\r\n\r\n<p>Pin: 4020 mAh - c&oacute; sạc nhanh</p>', '<p>M&agrave;n h&igrave;nh: AMOLED, 6.39&quot;, Full HD+</p>\r\n\r\n<p>Camera sau: Ch&iacute;nh 48MP &amp; phụ 8MP,&nbsp;2MP</p>\r\n\r\n<p>Camera trước: 16MP</p>\r\n\r\n<p>CPU: Media Tek Helio P60 8 nh&acirc;n</p>\r\n\r\n<p>Ram: 6GB</p>\r\n\r\n<p>Bộ nhớ trong: 64gb</p>\r\n\r\n<p>Hệ điều h&agrave;nh: Android 9.0 (PIE)</p>\r\n\r\n<p>Thẻ nhớ: MicroSD, tối đa 256gb</p>\r\n\r\n<p>Sim: 2 Nano sim, hỗ trợ 4G</p>\r\n\r\n<p>Pin: 4020 mAh - c&oacute; sạc nhanh</p>', '3590000', 'vsmart-active-3-tim-600x600-600x60022.jpg', 1, NULL, NULL),
(25, 'Vsmart Joy 3', 6, 5, '<p>CPU: Snapdragon 632 8 nh&acirc;n</p>\r\n\r\n<p>Ram: 3GB</p>\r\n\r\n<p>Bộ nhớ trong: 32gb</p>\r\n\r\n<p>Hệ điều h&agrave;nh: Android 9.0 (PIE)</p>\r\n\r\n<p>Pin: 5000 mAh - c&oacute; sạc nhanh</p>', '<p>M&agrave;n h&igrave;nh: IPS LCD, 6.5&quot;, Full HD+</p>\r\n\r\n<p>Camera sau: Ch&iacute;nh 13MP &amp; phụ 8MP, 2MP</p>\r\n\r\n<p>Camera trước: 8MP</p>\r\n\r\n<p>CPU: Snapdragon 632 8 nh&acirc;n</p>\r\n\r\n<p>Ram: 3GB</p>\r\n\r\n<p>Bộ nhớ trong: 32gb</p>\r\n\r\n<p>Hệ điều h&agrave;nh: Android 9.0 (PIE)</p>\r\n\r\n<p>Thẻ nhớ: MicroSD, tối đa 64GB</p>\r\n\r\n<p>Sim: 2 Nano sim, hỗ trợ 4G</p>\r\n\r\n<p>Pin: 5000 mAh - c&oacute; sạc nhanh</p>', '2250000', 'vsmart-joy-3-tim-new-600x600-600x60017.jpg', 1, NULL, NULL),
(26, 'Samsung Galaxy S21 Ultra 5G', 6, 7, '<p>CPU: Exynos 990 8 nh&acirc;n</p>\r\n\r\n<p>Ram: 12GB</p>\r\n\r\n<p>Bộ nhớ: 256gb</p>\r\n\r\n<p>Camera sau: 108MP, 12MP, 12MP, Laser AF</p>\r\n\r\n<p>Camera trước: 40MP</p>\r\n\r\n<p>Pin: 4500 mAh, c&oacute; sạc nhanh</p>', '<p>M&agrave;n h&igrave;nh: Dynamic AMOLED 2X</p>\r\n\r\n<p>&nbsp;+ 6.9&quot;, Quad HD+ (2K+)</p>\r\n\r\n<p>CPU: Exynos 990 8 nh&acirc;n</p>\r\n\r\n<p>Ram: 12GB</p>\r\n\r\n<p>Bộ nhớ: 256gb</p>\r\n\r\n<p>Camera sau: 108MP, 12MP, 12MP, Laser AF</p>\r\n\r\n<p>Camera trước: 40MP</p>\r\n\r\n<p>Hệ điều h&agrave;nh: Android 10</p>\r\n\r\n<p>Sim: 2 Nano sim</p>\r\n\r\n<p>+ Hoặc 1 Nano sim v&agrave; 1 eSim</p>\r\n\r\n<p>Pin: 4500 mAh, c&oacute; sạc nhanh</p>', '30990000', 'samsung-galaxy-s21-ultra-256gb-den-600x600-1-600x60057.jpg', 1, NULL, NULL),
(27, 'Samsung Galaxy S21 5G', 6, 7, '<p>CPU: Exynos 2100 8 nh&acirc;n</p>\r\n\r\n<p>Ram: 12GB</p>\r\n\r\n<p>Bộ nhớ: 128gb</p>\r\n\r\n<p>Hệ điều h&agrave;nh: Android 11</p>\r\n\r\n<p>Camera sau: 108MP, 12MP, 12MP, Laser AF</p>\r\n\r\n<p>Camera trước: 40MP</p>\r\n\r\n<p>Pin: 4800 mAh, c&oacute; sạc nhanh</p>', '<p>M&agrave;n h&igrave;nh: Dynamic AMOLED 2X,&nbsp;6.7&quot;, Full HD+</p>\r\n\r\n<p>Camera sau: 64MP, 12MP, 12MP</p>\r\n\r\n<p>Camera trước: 10MP</p>\r\n\r\n<p>CPU: Exynos 2100 8 nh&acirc;n</p>\r\n\r\n<p>Ram: 12GB</p>\r\n\r\n<p>Bộ nhớ: 128gb</p>\r\n\r\n<p>Hệ điều h&agrave;nh: Android 11</p>\r\n\r\n<p>Camera sau: 108MP, 12MP, 12MP, Laser AF</p>\r\n\r\n<p>Camera trước: 40MP</p>\r\n\r\n<p>Sim (Hỗ trợ 5G): 2 Nano sim</p>\r\n\r\n<p>+ Hoặc 1 Nano sim v&agrave; 1 eSim</p>\r\n\r\n<p>Pin: 4800 mAh, c&oacute; sạc nhanh</p>', '20990000', 'samsung-galaxy-s21-tim-600x600-600x60042.jpg', 1, NULL, NULL),
(28, 'Samsung Galaxy Note 10+', 6, 7, '<p>CPU: Exynos 9825 8 nh&acirc;n</p>\r\n\r\n<p>Ram: 12GB</p>\r\n\r\n<p>Bộ nhớ: 256gb</p>\r\n\r\n<p>Camera sau: 12MP, Phụ 12MP, 16MPTOF 3D</p>\r\n\r\n<p>Camera trước: 10MP</p>\r\n\r\n<p>Pin: 4300 mAh, c&oacute; sạc nhanh</p>', '<p>M&agrave;n h&igrave;nh: Dynamic AMOLED, 6.8&quot;,</p>\r\n\r\n<p>+ Quad HD+ (2K+)</p>\r\n\r\n<p>Hệ điều h&agrave;nh: Android 9 (PIE)</p>\r\n\r\n<p>Camera sau:&nbsp;12 MP &amp; Phụ 12 MP, 16 MP, TOF 3D</p>\r\n\r\n<p>Camera trước: 10 MP</p>\r\n\r\n<p>CPU:&nbsp;Exynos 9825 8 nh&acirc;n</p>\r\n\r\n<p>Ram: 12 GB</p>\r\n\r\n<p>Bộ nhớ trong: 256 GB</p>\r\n\r\n<p>Thẻ nhớ: MicroSD, tối đa 1TB</p>\r\n\r\n<p>Thẻ SIM: 2 Nano sim chung khe thẻ nhớ</p>\r\n\r\n<p>Dung lượng pin: 4300 mAh, c&oacute; sạc nhanh</p>', '16490000', 'samsung-galaxy-note-10-plus-silver-new-600x60088.jpg', 1, NULL, NULL),
(29, 'Samsung Galaxy Note 20', 6, 7, '<p>CPU: Exynos 990 8 nh&acirc;n</p>\r\n\r\n<p>Ram: 8GB</p>\r\n\r\n<p>Bộ nhớ: 256gb</p>\r\n\r\n<p>Hệ điều h&agrave;nh: Android 10</p>\r\n\r\n<p>Pin: 4300 mAh, c&oacute; sạc nhanh</p>', '<p>M&agrave;n h&igrave;nh:Super AMOLED Plus, 6.7&quot;, Full HD+</p>\r\n\r\n<p>CPU: Exynos 990 8 nh&acirc;n</p>\r\n\r\n<p>Camera sau: 64MP, Phụ:&nbsp;12MP, 12MP</p>\r\n\r\n<p>Camera trước: 10MP</p>\r\n\r\n<p>Ram: 8GB</p>\r\n\r\n<p>Bộ nhớ: 256gb</p>\r\n\r\n<p>Hệ điều h&agrave;nh: Android 10</p>\r\n\r\n<p>Sim: 2 Nano sim</p>\r\n\r\n<p>+ Hoặc 1 Nano sim v&agrave; 1 eSim</p>\r\n\r\n<p>Pin: 4300 mAh, c&oacute; sạc nhanh</p>', '19990000', 'samsung-galaxy-note-20-062220-122200-fix-600x60089.jpg', 1, NULL, NULL),
(30, 'MacBook Pro M1 2020', 7, 1, '<p>CPU: Apple M1</p>\r\n\r\n<p>Ram: 8GB</p>\r\n\r\n<p>Ổ cứng: SSD 256gb</p>\r\n\r\n<p>Hệ điều h&agrave;nh: Mac OS</p>\r\n\r\n<p>K&iacute;ch thước:&nbsp; D&agrave;y 15.6 mm, 1.4 kg</p>', '<p>CPU: Apple M1</p>\r\n\r\n<p>RAM: 8GB</p>\r\n\r\n<p>Ổ cứng: SSD 256gb</p>\r\n\r\n<p>M&agrave;n h&igrave;nh:</p>\r\n\r\n<p>13.3 inch, Retina (2560 x 1600)</p>\r\n\r\n<p>Card m&agrave;n h&igrave;nh: Card đồ họa t&iacute;ch hợp, 8 nh&acirc;n GPU</p>\r\n\r\n<p>Cổng kết nối: 2 x Thurderbolt 3 (USB-C)</p>\r\n\r\n<p>Hệ điều h&agrave;nh: Mac OS</p>\r\n\r\n<p>Thiết kế: Vỏ kim loại nguy&ecirc;n khối, PIN liền</p>\r\n\r\n<p>K&iacute;ch thước: D&agrave;y 15.6 mm, 1.4 kg</p>\r\n\r\n<p>Thời điểm ra mắt: 2020</p>', '31990000', 'R774ecb094eee4fb7b5ffc49e97e0926877.jpg', 1, NULL, NULL),
(31, 'Apple MacBook Air M1 2020', 7, 1, '<p>CPU: Apple M1</p>\r\n\r\n<p>Ram: 8GB</p>\r\n\r\n<p>Ổ cứng: SSD 256gb</p>\r\n\r\n<p>Hệ điều h&agrave;nh: Mac OS</p>\r\n\r\n<p>K&iacute;ch thước:&nbsp; D&agrave;y 16.1 mm, 1.4 kg</p>', '<p>CPU: Apple M1</p>\r\n\r\n<p>Ram: 8GB</p>\r\n\r\n<p>Ổ cứng: SSD 256gb</p>\r\n\r\n<p>M&agrave;n h&igrave;nh: 13.3 inch, Retina (2560 x 1600)</p>\r\n\r\n<p>Hệ điều h&agrave;nh: Mac OS</p>\r\n\r\n<p>Card m&agrave;n h&igrave;nh: Card đồ họa t&iacute;ch hợp, 7 nh&acirc;n GPU</p>\r\n\r\n<p>Cổng kết nối: 2 x Thurderbolt 3 (USB-C)</p>\r\n\r\n<p>K&iacute;ch thước:&nbsp; D&agrave;y 16.1 mm, 1.4 kg</p>\r\n\r\n<p>Thời điểm ra mắt: 2020</p>', '27490000', 'apple-macbook-air-2020-mgnd3saa-600x60026.jpg', 1, NULL, NULL),
(32, 'Dell Vostro 3400 70234073 Black', 7, 8, '<p>CPU Intel Core i5-1135G7</p>\r\n\r\n<p>+ (8MB, up to 4.20GHz)</p>\r\n\r\n<p>RAM 8GB DDR4 2666MHz</p>\r\n\r\n<p>SSD 256GB M.2 PCIe NVMe 3x4</p>\r\n\r\n<p>VGA Intel Iris Xe Graphics</p>', '<p>CPU Intel Core i5-1135G7 (8MB, up to 4.20GHz)</p>\r\n\r\n<p>RAM 8GB DDR4 2666MHz</p>\r\n\r\n<p>SSD 256GB M.2 PCIe NVMe 3x4</p>\r\n\r\n<p>VGA Intel Iris Xe Graphics</p>\r\n\r\n<p>Display 14.0Inch FHD WVA Anti-glare 60Hz</p>\r\n\r\n<p>Pin 3Cell 42WHrs</p>\r\n\r\n<p>Color Black (Đen)</p>\r\n\r\n<p>Weight 1.64 kg</p>\r\n\r\n<p>OS Windows 10 Home</p>', '16990000', '18705_laptop_dell_vostro_3400_70234073_145.jpg', 1, NULL, NULL),
(33, 'Dell XPS 13 9310 JGNH61', 7, 8, '<p>CPU Intel Core i7-1165G7 (12MB, up to 4.70GHz)</p>\r\n\r\n<p>RAM 16GB LPDDR4x 4267MHz Onboard</p>\r\n\r\n<p>SSD 512GB M.2 2280 PCIe NVMe Gen3 x4</p>\r\n\r\n<p>VGA Intel Iris Xe Graphics</p>', '<p>CPU Intel Core i7-1165G7 (12MB, up to 4.70GHz)</p>\r\n\r\n<p>RAM 16GB LPDDR4x 4267MHz Onboard</p>\r\n\r\n<p>SSD 512GB M.2 2280 PCIe NVMe Gen3 x4</p>\r\n\r\n<p>VGA Intel Iris Xe Graphics</p>\r\n\r\n<p>Display 13.4 Inch UHD Touch IPS 60Hz Anti-Glare</p>\r\n\r\n<p>Pin 4Cell 51WHrs</p>\r\n\r\n<p>Finger Print, vỏ alu, Led Keyboard, Pen</p>\r\n\r\n<p>Weight 1.27 kg</p>\r\n\r\n<p>Color Platinum Silver (Bạc)</p>\r\n\r\n<p>OS Windows 10 Home</p>', '56690000', '18747_laptop_dell_xps_13_9310_2_in_1_jgnh61_112.png', 1, NULL, NULL),
(34, 'Asus TUF Gaming FX506LI-HN039T', 7, 3, '<p>CPU Intel Core i5-10300H (8MB, up to 4.50GHz)</p>\r\n\r\n<p>RAM 8GB DDR4 2933MHz</p>\r\n\r\n<p>SSD 512G PCIE</p>\r\n\r\n<p>VGA NVIDIA Geforce GTX 1650Ti 4GB GDDR6</p>', '<p>CPU Intel Core i5-10300H (8MB, up to 4.50GHz)</p>\r\n\r\n<p>RAM 8GB DDR4 2933MHz (c&ograve;n 1 slot)</p>\r\n\r\n<p>SSD 512G PCIE</p>\r\n\r\n<p>VGA NVIDIA Geforce GTX 1650Ti 4GB GDDR6</p>\r\n\r\n<p>Display 15.6inch FHD IPS, Non-Glare, 144Hz Nanoedge</p>\r\n\r\n<p>Pin 3cell 48WHrs</p>\r\n\r\n<p>Weight 2.20 kg</p>\r\n\r\n<p>Color GRAY METAL</p>\r\n\r\n<p>OS Windows 10 64bits</p>', '20390000', '18471-asus-tuf-gaming-fx506li-hn039t62.jpg', 1, NULL, NULL),
(35, 'Asus ROG Strix G17 G713QR-HG072T', 7, 3, '<p>CPU AMD Ryzen R7-5800H (16MB, up to 4.40GHz)</p>\r\n\r\n<p>RAM 16GB DDR4 3200MHz (2x8GB)</p>\r\n\r\n<p>SSD 1TB M.2 NVMe PCIe 3.0</p>\r\n\r\n<p>VGA NVIDIA Geforce RTX 3070 8GB GDDR6</p>', '<p>CPU AMD Ryzen R7-5800H (16MB, up to 4.40GHz)</p>\r\n\r\n<p>RAM 16GB DDR4 3200MHz (2x8GB)</p>\r\n\r\n<p>SSD 1TB M.2 NVMe PCIe 3.0</p>\r\n\r\n<p>VGA NVIDIA Geforce RTX 3070 8GB GDDR6</p>\r\n\r\n<p>Display 17.3inch FHD IPS 300Hz</p>\r\n\r\n<p>Pin 4Cell 90WHrs</p>\r\n\r\n<p>Per-Key RGB</p>\r\n\r\n<p>Weight 2.70 kg</p>\r\n\r\n<p>Color Eclipse Gray (X&aacute;m)</p>\r\n\r\n<p>OS Windows 10 Home</p>', '48490000', '18967_laptop_asus_rog_strix_g17_g713qr_hg072t_113.png', 1, NULL, NULL),
(36, 'HP ProBook 450 G8 2H0U4PA', 7, 9, '<p>CPU Intel Core i3-1115G4 (6MB, up to 4.10GHz)</p>\r\n\r\n<p>RAM 4GB DDR4 3200MHz</p>\r\n\r\n<p>SSD 256GB PCIe NVMe M.2</p>\r\n\r\n<p>VGA Intel UHD Graphics</p>', '<p>CPU Intel Core i3-1115G4 (6MB, up to 4.10GHz)</p>\r\n\r\n<p>RAM 4GB DDR4 3200MHz</p>\r\n\r\n<p>SSD 256GB PCIe NVMe M.2</p>\r\n\r\n<p>Display 15.6Inch HD Anti-Glare</p>\r\n\r\n<p>VGA Intel UHD Graphics</p>\r\n\r\n<p>Pin 3Cell 45WHrs</p>\r\n\r\n<p>Color Silver (Bạc)</p>\r\n\r\n<p>Vỏ Alu, Led Keyboard</p>\r\n\r\n<p>Weight 1.74 kg</p>\r\n\r\n<p>OS Windows 10 Home SL</p>', '14190000', '18776_laptop_hp_probook_450_g8_2h0u4pa_141.png', 1, NULL, NULL),
(37, 'HP 250 G7 15H39PA', 7, 9, '<p>CPU: Intel&reg; Core&trade; i5- 1035G1 Processor (6M Cache, 3.60 GHz)</p>\r\n\r\n<p>RAM: 4GB DDR4</p>\r\n\r\n<p>SSD: 256GB</p>\r\n\r\n<p>VGA: Geforce MX110 2GB GDDR5</p>', '<p>CPU: Intel&reg; Core&trade; i5- 1035G1 Processor (6M Cache, 3.60 GHz)</p>\r\n\r\n<p>RAM: 4GB DDR4</p>\r\n\r\n<p>SSD: 256GB</p>\r\n\r\n<p>VGA: Geforce MX110 2GB GDDR5</p>\r\n\r\n<p>DISPLAY: 15.6Inch FHD</p>\r\n\r\n<p>PIN 3Cell 41WHr</p>\r\n\r\n<p>WLac/BT5</p>\r\n\r\n<p>M&agrave;u: X&aacute;m</p>\r\n\r\n<p>OS: Windows 10</p>', '14390000', '18523-laptop-hp-250-g7-15h39pa8.jpg', 1, NULL, NULL),
(38, 'Lenovo V15-IIL 82C500MNVN', 7, 10, '<p>CPU Intel Core i3-1005G1 (4MB, upto 3.40GHz)</p>\r\n\r\n<p>RAM 4GB DDR4 2666Mhz</p>\r\n\r\n<p>SSD 256GB M.2 2242 PCIe NVMe 3.0x2</p>\r\n\r\n<p>VGA Intel UHD Graphics</p>', '<p>CPU Intel Core i3-1005G1 (4MB, upto 3.40GHz)</p>\r\n\r\n<p>RAM 4GB DDR4 2666Mhz</p>\r\n\r\n<p>SSD 256GB M.2 2242 PCIe NVMe 3.0x2</p>\r\n\r\n<p>VGA Intel UHD Graphics</p>\r\n\r\n<p>Display 15.6Inch FHD TN 220nits Anti-glare</p>\r\n\r\n<p>Pin 2Cell 30Whrs</p>\r\n\r\n<p>Color X&aacute;m</p>\r\n\r\n<p>Weight 1.85 kg</p>\r\n\r\n<p>OS Free Dos</p>', '9250000', '18295-lenovo-v15-iil-82c500mnvn-145.jpg', 1, NULL, NULL),
(39, 'Lenovo Ideapad Flex 5', 7, 10, '<p>CPU Intel Core i5-1135G7 (8MB, up to 4.20GHz)</p>\r\n\r\n<p>RAM 8GB DDR4 3200MHz Onboard</p>\r\n\r\n<p>SSD 512GB M.2 2242 PCIe 3.0x4 NVMe</p>\r\n\r\n<p>VGA Intel Iris Xe Graphics</p>', '<p>CPU Intel Core i5-1135G7 (8MB, up to 4.20GHz)</p>\r\n\r\n<p>RAM 8GB DDR4 3200MHz Onboard</p>\r\n\r\n<p>SSD 512GB M.2 2242 PCIe 3.0x4 NVMe</p>\r\n\r\n<p>VGA Intel Iris Xe Graphics</p>\r\n\r\n<p>Display 14.0Inch FHD Touch IPS 250nits Glossy</p>\r\n\r\n<p>Pin 3Cell 52.5WHrs</p>\r\n\r\n<p>Color Graphite Grey (X&aacute;m)</p>\r\n\r\n<p>Fingerprint, Backlit Keyboard</p>\r\n\r\n<p>Lenovo Digital Pen</p>\r\n\r\n<p>Weight 1.50 kg</p>\r\n\r\n<p>OS Windows 10 Home</p>', '17890000', '18902_laptop_lenovo_ideapad_flex_5_14itl05_82hs00f9vn_167.png', 1, NULL, NULL),
(42, 'OPPO Reno4 Pro', 6, 6, '<p>CPU: Snapdragon 720G 8 nh&acirc;n</p>\r\n\r\n<p>Ram: 8GB</p>\r\n\r\n<p>Bộ nhớ: 256gb</p>\r\n\r\n<p>Hệ điều h&agrave;nh: Android 10</p>\r\n\r\n<p>Dung lượng: 4000 mAh, c&oacute; sạc nhanh</p>', '<p>- M&agrave;n h&igrave;nh: AMOLED, 6.5&quot;, Full HD+</p>\r\n\r\n<p>- Camera sau: Ch&iacute;nh 48 MP &amp; Phụ 8 MP, 2 MP, 2 MP</p>\r\n\r\n<p>- Camera trước:32 MP</p>\r\n\r\n<p>-CPU: Snapdragon 720G 8 nh&acirc;n</p>\r\n\r\n<p>- Ram: 8GB</p>\r\n\r\n<p>- Bộ nhớ: 256gb</p>\r\n\r\n<p>- Hệ điều h&agrave;nh: Android 10</p>\r\n\r\n<p>- Dung lượng: 4000 mAh, c&oacute; sạc nhanh</p>', '10990000', 'oppo-reno4-pro-trang-600x60094.jpg', 1, NULL, NULL),
(43, 'OPPO Reno5', 6, 6, '<p>Chip xử l&yacute;: Snapdragon 720G 8 nh&acirc;n</p>\r\n\r\n<p>RAM: 8 GB</p>\r\n\r\n<p>Hệ điều h&agrave;nh: Android 11</p>\r\n\r\n<p>Pin: 4310 mAh, C&oacute; sạc nhanh</p>', '<p>- M&agrave;n h&igrave;nh: AMOLED, 6.43&quot;, Full HD+</p>\r\n\r\n<p>- Hệ điều h&agrave;nh: Android 11</p>\r\n\r\n<p>-Camera sau: Ch&iacute;nh 64 MP &amp; Phụ 8 MP, 2 MP, 2 MP</p>\r\n\r\n<p>- Camera trước: 44 MP</p>\r\n\r\n<p>- Chip xử l&yacute;: Snapdragon 720G 8 nh&acirc;n</p>\r\n\r\n<p>- RAM: 8 GB</p>\r\n\r\n<p>- Bộ nhớ trong: 128 GB</p>\r\n\r\n<p>- SIM: 2 Nano sim, hỗ trợ 4G</p>\r\n\r\n<p>- Pin: 4310 mAh, C&oacute; sạc nhanh</p>', '8690000', 'oppo-reno5-trang-600x600-1-600x60036.jpg', 1, NULL, NULL),
(44, 'OPPO Reno4', 6, 6, '<p>CPU: Snapdragon 720G 8 nh&acirc;n</p>\r\n\r\n<p>Ram: 8GB</p>\r\n\r\n<p>Bộ nhớ trong: 128 GB</p>\r\n\r\n<p>Hệ điều h&agrave;nh: Android 10</p>', '<p>- M&agrave;n h&igrave;nh: AMOLED, 6.4&quot;, Full HD+</p>\r\n\r\n<p>- Hệ điều h&agrave;nh: Android 10</p>\r\n\r\n<p>- Camera sau: Ch&iacute;nh 48 MP &amp; Phụ 8 MP, 2 MP, 2 MP</p>\r\n\r\n<p>- Camera trước: Ch&iacute;nh 32 MP &amp; Phụ cảm biến th&ocirc;ng minh A.I</p>\r\n\r\n<p>- CPU: Snapdragon 720G 8 nh&acirc;n</p>\r\n\r\n<p>- Ram: 8GB</p>\r\n\r\n<p>- Bộ nhớ trong: 128 GB</p>\r\n\r\n<p>- Thẻ nhớ: MicroSD, tối đa 256gb</p>\r\n\r\n<p>- Thẻ SIM: 2 Nano sim, hộ trợ 4G</p>\r\n\r\n<p>- Dung lượng pin: 4015 mAh, c&oacute; sạc nhanh</p>', '7490000', 'oppo-reno4-tim-1-600x60053.jpg', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_shipping`
--

CREATE TABLE `tbl_shipping` (
  `shipping_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(11) NOT NULL,
  `shipping_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_shipping`
--

INSERT INTO `tbl_shipping` (`shipping_id`, `customer_id`, `shipping_name`, `shipping_email`, `shipping_phone`, `shipping_address`, `shipping_message`, `created_at`, `updated_at`) VALUES
(1, 2, 'Kieu Quoc Bao', 'admin@gmail.com', '0334914295', '123 sao hoa', 'giao  trong tuan nay nhe shop', NULL, NULL),
(2, 2, 'Kieu Quoc Bao', 'ba0kieu952000@gmail.com', '0334914295', '123 sao hoa', 'Giao trong tuan', NULL, NULL),
(3, 2, 'Kieu Quoc Bao', 'ba0kieu952000@gmail.com', '0334914295', '123 sao hoa', 'Giao trong tuan', NULL, NULL),
(4, 2, 'Kieu Quoc Bao', 'ba0kieu952000@gmail.com', '0334914295', '123 sao hoa', 'Giao trong tuan', NULL, NULL),
(5, 2, 'Kieu Quoc Bao', 'ba0kieu952000@gmail.com', '0334914295', '123 sao hoa', 'Giao trong tuan', NULL, NULL),
(6, 2, 'Kieu Quoc Bao', 'ba0kieu952000@gmail.com', '0334914295', '123 sao hoa', 'Giao trong tuan', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Chỉ mục cho bảng `tbl_brand_product`
--
ALTER TABLE `tbl_brand_product`
  ADD PRIMARY KEY (`brand_id`);

--
-- Chỉ mục cho bảng `tbl_category_product`
--
ALTER TABLE `tbl_category_product`
  ADD PRIMARY KEY (`category_id`);

--
-- Chỉ mục cho bảng `tbl_customers`
--
ALTER TABLE `tbl_customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Chỉ mục cho bảng `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Chỉ mục cho bảng `tbl_order_details`
--
ALTER TABLE `tbl_order_details`
  ADD PRIMARY KEY (`order_details_id`);

--
-- Chỉ mục cho bảng `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`product_id`);

--
-- Chỉ mục cho bảng `tbl_shipping`
--
ALTER TABLE `tbl_shipping`
  ADD PRIMARY KEY (`shipping_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `admin_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `tbl_brand_product`
--
ALTER TABLE `tbl_brand_product`
  MODIFY `brand_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `tbl_category_product`
--
ALTER TABLE `tbl_category_product`
  MODIFY `category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `tbl_customers`
--
ALTER TABLE `tbl_customers`
  MODIFY `customer_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `order_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `tbl_order_details`
--
ALTER TABLE `tbl_order_details`
  MODIFY `order_details_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `product_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT cho bảng `tbl_shipping`
--
ALTER TABLE `tbl_shipping`
  MODIFY `shipping_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
