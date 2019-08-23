-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 11, 2019 at 04:42 PM
-- Server version: 5.6.26
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `manager`
--

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE IF NOT EXISTS `employees` (
  `id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('work','not work') COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `mobile`, `city`, `photo`, `email`, `status`, `user_id`, `created_at`, `updated_at`) VALUES
(8, 'mohamed', '01021952160', 'damanhour', '15549136602027.jpeg', 'red.devile2011@gmail.com', 'work', 7, '2019-04-10 14:27:40', '2019-04-10 14:27:40'),
(9, 'test1', '76890987663', 'gdg', '15549136957177.jpeg', 'test1@mm', 'work', 7, '2019-04-10 14:28:15', '2019-04-10 14:28:15'),
(10, 'ahmed', '76543298761', 'dd', '15549138248279.jpeg', 'ahmed@gmail.com', 'work', 7, '2019-04-10 14:30:24', '2019-04-10 14:30:24'),
(11, 'aya', '76543987654', 'kaj', '1554913846711.jpeg', 'aya@gmail.com', 'work', 7, '2019-04-10 14:30:46', '2019-04-10 14:30:46'),
(12, 'ali', '01021952122', 'damanhour', '15549138717912.jpeg', 'ali@gmail.com', 'work', 7, '2019-04-10 14:31:11', '2019-04-10 14:31:11'),
(13, 'mahmoud', '01021952121', 'damanhour', '15549139029018.jpeg', 'mahmoud@gmail.com', 'work', 7, '2019-04-10 14:31:42', '2019-04-10 14:31:42'),
(14, 'mohamhh', '01021952199', 'damanhour', '15549139274555.jpeg', 'ndd@lkjf', 'work', 7, '2019-04-10 14:32:07', '2019-04-10 14:32:07'),
(15, 'nour', '01021952177', 'damanhour', '15549139479656.jpeg', 'no@jdhs', 'work', 7, '2019-04-10 14:32:27', '2019-04-10 14:32:27'),
(16, 'omar', '01021952155', 'mm', '15549139762238.jpeg', 'omar@gmail.com', 'work', 7, '2019-04-10 14:32:56', '2019-04-10 14:32:56'),
(17, 'abdo', '01021952124', 'nnn', '15549140118449.jpeg', 'abdo@gmail.com', 'work', 7, '2019-04-10 14:33:31', '2019-04-10 14:33:31'),
(18, 'sara', '01021952888', 'gg', '15549140392214.jpeg', 'sara@gmail.com', 'work', 7, '2019-04-10 14:34:00', '2019-04-10 14:34:00');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint(20) unsigned NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `user_id`, `message`, `created_at`, `updated_at`) VALUES
(89, 7, 'ss', '2019-04-08 07:42:43', '2019-04-08 07:42:43'),
(90, 7, 'sds', '2019-04-08 09:09:47', '2019-04-08 09:09:47'),
(91, 7, 'test', '2019-04-08 09:38:42', '2019-04-08 09:38:42'),
(92, 7, 'dd', '2019-04-08 09:39:08', '2019-04-08 09:39:08'),
(93, 7, 'ff', '2019-04-08 10:12:20', '2019-04-08 10:12:20'),
(94, 7, 'd', '2019-04-08 10:15:10', '2019-04-08 10:15:10'),
(95, 7, 'ffsss', '2019-04-08 10:39:49', '2019-04-08 10:39:49'),
(96, 5, 'yes', '2019-04-08 10:42:04', '2019-04-08 10:42:04'),
(97, 5, 'd', '2019-04-08 11:17:14', '2019-04-08 11:17:14'),
(98, 7, 'ok', '2019-04-09 08:47:03', '2019-04-09 08:47:03'),
(99, 5, 'back.data back.databack.databack.databack.databack.databack.databack.databack.databack.databack.databack.databack.databack.databack.databack.databack.databack.databack.databack.databack.databack.databack.databack.data', '2019-04-09 08:55:41', '2019-04-09 08:55:41');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(9, '2014_10_12_000000_create_users_table', 1),
(10, '2014_10_12_100000_create_password_resets_table', 1),
(11, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(12, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(13, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(14, '2016_06_01_000004_create_oauth_clients_table', 1),
(15, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(16, '2019_03_26_075143_create_employees_table', 1),
(17, '2019_03_27_141724_create_jobs_table', 2),
(18, '2019_03_28_192425_create_notifications_table', 3),
(19, '2019_04_06_122553_create_messages_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE IF NOT EXISTS `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('06c09d08-e30e-4ea4-a661-6aba641c6c2b', 'App\\Notifications\\NotifyOwner', 'App\\User', 7, '{"emp":{"name":"abdo","email":"abdo@gmail.com","mobile":"01021952124","status":"work","user_id":7,"photo":"15549140118449.jpeg","city":"nnn","id":17},"type":"employee"}', NULL, '2019-04-10 14:33:31', '2019-04-10 14:33:31'),
('0a7e8521-e62d-401b-ae3c-65e5cb432037', 'App\\Notifications\\NotifyOwner', 'App\\User', 7, '{"emp":{"name":"aya","email":"aya@gmail.com","mobile":"76543987654","status":"work","user_id":7,"photo":"1554913846711.jpeg","city":"kaj","id":11},"type":"employee"}', NULL, '2019-04-10 14:30:46', '2019-04-10 14:30:46'),
('186844c3-a4d5-497e-9cca-677d5e77e040', 'App\\Notifications\\NotifyOwner', 'App\\User', 7, '{"emp":{"name":"mohamed","email":"red.devile2011@gmail.com","mobile":"01021952160","status":"work","user_id":7,"photo":"15549122595983.jpeg","city":"damanhour","id":7},"type":"employee"}', '2019-04-10 14:34:49', '2019-04-10 14:04:19', '2019-04-10 14:34:49'),
('2ed67014-1a4d-4cdf-9180-fb3a8cc0c15e', 'App\\Notifications\\NotifyOwner', 'App\\User', 5, '{"emp":{"name":"mohamed","email":"red.devile2011@gmail.com","mobile":"01021952160","status":"work","user_id":5,"photo":"15547299035129.png","city":"damanhour","id":19},"type":"employee"}', '2019-04-09 08:48:07', '2019-04-08 11:25:03', '2019-04-09 08:48:07'),
('330bc106-5c45-4806-8822-307b72a06521', 'App\\Notifications\\NotifyOwner', 'App\\User', 7, '{"emp":{"name":"test1","email":"test1@mm","mobile":"76890987663","status":"work","user_id":7,"photo":"15549136957177.jpeg","city":"gdg","id":9},"type":"employee"}', NULL, '2019-04-10 14:28:15', '2019-04-10 14:28:15'),
('3ddb226d-7dda-4000-8a78-5a4c7a199739', 'App\\Notifications\\NotifyOwner', 'App\\User', 7, '{"emp":{"name":"mohamhh","email":"ndd@lkjf","mobile":"01021952199","status":"work","user_id":7,"photo":"15549139274555.jpeg","city":"damanhour","id":14},"type":"employee"}', NULL, '2019-04-10 14:32:07', '2019-04-10 14:32:07'),
('53f8b6d7-4bb7-4ec2-8aca-eba5a809fa83', 'App\\Notifications\\NotifyOwner', 'App\\User', 7, '{"emp":{"name":"mohamed","email":"red.devile2011@gmail.com","mobile":"01021952160","status":"work","user_id":7,"photo":"15549122344297.jpeg","city":"damanhour","id":6},"type":"employee"}', '2019-04-10 14:35:00', '2019-04-10 14:03:54', '2019-04-10 14:35:00'),
('617a9887-dcfe-45f3-af42-9c383b8beff5', 'App\\Notifications\\NotifyOwner', 'App\\User', 7, '{"emp":{"name":"sara","email":"sara@gmail.com","mobile":"01021952888","status":"work","user_id":7,"photo":"15549140392214.jpeg","city":"gg","id":18},"type":"employee"}', NULL, '2019-04-10 14:34:00', '2019-04-10 14:34:00'),
('6586be6b-c0e0-4a93-801d-b2d5c29beb64', 'App\\Notifications\\NotifyOwner', 'App\\User', 7, '{"emp":{"name":"mohamed","email":"red.devile2011@gmail.com","mobile":"01021952160","status":"work","user_id":7,"photo":"15547272549313.png","city":"damanhour","id":18},"type":"employee"}', '2019-04-10 12:56:47', '2019-04-08 10:40:54', '2019-04-10 12:56:47'),
('6fd9e546-19e9-4403-acf7-f9fc35d92a27', 'App\\Notifications\\NotifyOwner', 'App\\User', 5, '{"emp":{"id":99,"user_id":5,"message":"back.data back.databack.databack.databack.databack.databack.databack.databack.databack.databack.databack.databack.databack.databack.databack.databack.databack.databack.databack.databack.databack.databack.databack.data","created_at":"2019-04-09 10:55:41","updated_at":"2019-04-09 10:55:41","user":{"id":5,"name":"admin","email":"admin@gmail.com","email_verified_at":null,"type":"admin","photo":"1554806938.jpeg","bio":"no","created_at":"2019-03-27 08:09:07","updated_at":"2019-04-09 10:48:58"}},"type":"message"}', NULL, '2019-04-09 08:55:41', '2019-04-09 08:55:41'),
('70c8f9a6-1af6-432e-a1d4-da8ff9f12d0d', 'App\\Notifications\\NotifyOwner', 'App\\User', 7, '{"emp":{"name":"ahmed","email":"ahmed@gmail.com","mobile":"01021952161","status":"not work","user_id":7,"photo":"15548959651716.jpeg","city":"damanhour","id":2},"type":"employee"}', '2019-04-10 12:57:01', '2019-04-10 09:32:45', '2019-04-10 12:57:01'),
('7738385a-e2b8-433d-aa7d-b3b32eff2ed6', 'App\\Notifications\\NotifyOwner', 'App\\User', 7, '{"emp":{"name":"ahmed","email":"ahmed@gmail.com","mobile":"76543298761","status":"work","user_id":7,"photo":"15549138248279.jpeg","city":"dd","id":10},"type":"employee"}', NULL, '2019-04-10 14:30:24', '2019-04-10 14:30:24'),
('7a49514c-ef71-4b41-8143-121c0d781552', 'App\\Notifications\\NotifyOwner', 'App\\User', 7, '{"emp":{"name":"mohamed","email":"red.devile2011@gmail.com","mobile":"01021952160","status":"not work","user_id":7,"photo":"15547379627430.jpeg","city":"damanhour","id":21},"type":"employee"}', '2019-04-10 12:56:41', '2019-04-08 13:39:24', '2019-04-10 12:56:41'),
('81e1dae0-a69e-44e4-b55d-16fef630c32e', 'App\\Notifications\\NotifyOwner', 'App\\User', 7, '{"emp":{"name":"mohamed","email":"red.devile2011@gmail.com","mobile":"01021952160","status":"work","user_id":7,"photo":"15549121086959.jpeg","city":"damanhour","id":5},"type":"employee"}', '2019-04-10 14:34:55', '2019-04-10 14:01:50', '2019-04-10 14:34:55'),
('86ac5393-2136-4dd8-864b-03f935b2969b', 'App\\Notifications\\NotifyOwner', 'App\\User', 7, '{"emp":{"id":98,"user_id":7,"message":"ok","created_at":"2019-04-09 10:47:03","updated_at":"2019-04-09 10:47:03","user":{"id":7,"name":"ali","email":"ali@gmail.com","email_verified_at":null,"type":"admin","photo":"1554806337.jpeg","bio":"no","created_at":"2019-03-29 12:15:19","updated_at":"2019-04-09 10:38:58"}},"type":"message"}', '2019-04-10 12:57:07', '2019-04-09 08:47:04', '2019-04-10 12:57:07'),
('9e2cdb5a-fafd-4f67-a867-060fa89693d9', 'App\\Notifications\\NotifyOwner', 'App\\User', 5, '{"emp":{"name":"mohamed","email":"mohamed.khairy.eg@gmail.com","mobile":"01021952161","status":"not work","user_id":5,"photo":"15547325876812.png","city":"damanhour","id":20},"type":"employee"}', '2019-04-09 08:48:01', '2019-04-08 12:09:47', '2019-04-09 08:48:01'),
('a744f9e7-a649-4830-a986-e4fc89d62680', 'App\\Notifications\\NotifyOwner', 'App\\User', 5, '{"emp":{"id":97,"user_id":5,"message":"d","created_at":"2019-04-08 13:17:14","updated_at":"2019-04-08 13:17:14","user":{"id":5,"name":"admin","email":"admin@gmail.com","email_verified_at":null,"type":"admin","photo":"1554288594.jpeg","bio":"no","created_at":"2019-03-27 08:09:07","updated_at":"2019-04-03 10:49:54"}},"type":"message"}', '2019-04-09 08:48:11', '2019-04-08 11:17:14', '2019-04-09 08:48:11'),
('aabc7bf6-ac16-4975-a767-059537212bc8', 'App\\Notifications\\NotifyOwner', 'App\\User', 7, '{"emp":{"name":"omar","email":"omar@gmail.com","mobile":"01021952155","status":"work","user_id":7,"photo":"15549139762238.jpeg","city":"mm","id":16},"type":"employee"}', NULL, '2019-04-10 14:32:56', '2019-04-10 14:32:56'),
('b4401cfc-37a6-47cd-a9f2-548472ebbe90', 'App\\Notifications\\NotifyOwner', 'App\\User', 7, '{"emp":{"name":"mahmoud","email":"mahmoud@gmail.com","mobile":"01021952121","status":"work","user_id":7,"photo":"15549139029018.jpeg","city":"damanhour","id":13},"type":"employee"}', NULL, '2019-04-10 14:31:42', '2019-04-10 14:31:42'),
('be336a2e-5da5-41ea-8b58-45d219c9c5b4', 'App\\Notifications\\NotifyOwner', 'App\\User', 7, '{"emp":{"id":95,"user_id":7,"message":"ffsss","created_at":"2019-04-08 12:39:49","updated_at":"2019-04-08 12:39:49","user":{"id":7,"name":"ali","email":"ali@gmail.com","email_verified_at":null,"type":"admin","photo":"avatar.png","bio":"no","created_at":"2019-03-29 12:15:19","updated_at":"2019-03-29 12:15:19"}},"type":"message"}', '2019-04-10 12:56:53', '2019-04-08 10:39:49', '2019-04-10 12:56:53'),
('d63a76c3-0dfd-4b6b-8a24-f9b4318ae3e5', 'App\\Notifications\\NotifyOwner', 'App\\User', 7, '{"emp":{"name":"ali","email":"ali@gmail.com","mobile":"01021952122","status":"work","user_id":7,"photo":"15549138717912.jpeg","city":"damanhour","id":12},"type":"employee"}', NULL, '2019-04-10 14:31:11', '2019-04-10 14:31:11'),
('ee609856-f3e1-4c8a-94d6-d2ebfe26d2f4', 'App\\Notifications\\NotifyOwner', 'App\\User', 7, '{"emp":{"name":"mohamed","email":"red.devile2011@gmail.com","mobile":"01021952160","status":"work","user_id":7,"photo":"15549136602027.jpeg","city":"damanhour","id":8},"type":"employee"}', NULL, '2019-04-10 14:27:40', '2019-04-10 14:27:40'),
('f3ff30c3-9263-4cf5-91f8-aee72be66a7d', 'App\\Notifications\\NotifyOwner', 'App\\User', 5, '{"emp":{"id":96,"user_id":5,"message":"yes","created_at":"2019-04-08 12:42:04","updated_at":"2019-04-08 12:42:04","user":{"id":5,"name":"admin","email":"admin@gmail.com","email_verified_at":null,"type":"admin","photo":"1554288594.jpeg","bio":"no","created_at":"2019-03-27 08:09:07","updated_at":"2019-04-03 10:49:54"}},"type":"message"}', '2019-04-08 10:42:33', '2019-04-08 10:42:04', '2019-04-08 10:42:33'),
('f715c604-8124-411b-9077-fba29f0bdbbf', 'App\\Notifications\\NotifyOwner', 'App\\User', 7, '{"emp":{"name":"mohamed","email":"red.devile2011@gmail.com","mobile":"01021952160","status":"work","user_id":7,"photo":"15548958931919.jpeg","city":"damanhour","id":1},"type":"employee"}', '2019-04-10 12:54:27', '2019-04-10 09:31:34', '2019-04-10 12:54:27'),
('f96c5b6d-6a3c-4d3a-b0f2-83f69a9af1a8', 'App\\Notifications\\NotifyOwner', 'App\\User', 7, '{"emp":{"name":"nour","email":"no@jdhs","mobile":"01021952177","status":"work","user_id":7,"photo":"15549139479656.jpeg","city":"damanhour","id":15},"type":"employee"}', NULL, '2019-04-10 14:32:28', '2019-04-10 14:32:28');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_auth_codes`
--

INSERT INTO `oauth_auth_codes` (`id`, `user_id`, `client_id`, `scopes`, `revoked`, `expires_at`) VALUES
('4cbe5d0ab0d42ec65ebfa658d18af6ece1c6f961b38208c0062147cda3edc01f1cffb289defc9141', 7, 1, '[]', 0, '2019-04-03 13:35:22'),
('98f32e8062851f2bce72dec2db412e14f928aa5230183483e601fa5dd031ead51d153d504d1399f3', 7, 1, '[]', 0, '2019-04-03 13:48:13'),
('cd461cba61f0218905b6af3ed071a021019807bbf35767a87d57ff4ed592294d8e899fe52a1a6411', 7, 1, '[]', 0, '2019-04-03 13:15:11');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` int(10) unsigned NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, 7, 'mohamed', 'OqG4MEGdTOx8mu00epjzK2zTvv1EQF6Gt9g9Rhww', 'http://localhost:8000/callback', 0, 0, 0, '2019-04-03 08:13:57', '2019-04-03 08:13:57');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'avatar.png',
  `bio` mediumtext COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=212 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `type`, `photo`, `bio`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Mohamed Khairy', 'red.devile2011@gmail.com', NULL, '$2y$10$injBvnoG1D0EqV0/fSONgufpcmG/SeQdi6hEK/wjMgNulJAVieSJG', 'admin', 'https://graph.facebook.com/v3.0/2129673753789329/picture?type=normal', NULL, NULL, '2019-03-26 07:21:14', '2019-03-26 07:21:14'),
(5, 'admin', 'admin@gmail.com', NULL, '$2y$10$DurqwMVuzqlE02.dLmNP5.NqgOdFqOtqHzCF/PJug4gZBuSwbF5fi', 'admin', '1554806938.jpeg', 'no', NULL, '2019-03-27 06:09:07', '2019-04-09 08:48:58'),
(7, 'ali', 'ali@gmail.com', NULL, '$2y$10$J2SztPpFVUvMKEN56dEmjOnzo/CaYuBk5PE1SL6iKvJh6UHnqr8PO', 'admin', '1554806337.jpeg', 'no', NULL, '2019-03-29 10:15:19', '2019-04-09 08:38:58'),
(12, 'Dr. Clemens Rolfson I', 'rosella.vonrueden@example.net', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'r0BAXRiFHX', '2019-04-08 14:52:34', '2019-04-08 14:52:34'),
(16, 'Narciso Keebler', 'cwhite@example.com', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'YbZTnBvpFY', '2019-04-08 14:52:34', '2019-04-08 14:52:34'),
(23, 'Brock Upton', 'abbigail29@example.net', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'eEii2lWIll', '2019-04-08 14:52:34', '2019-04-08 14:52:34'),
(25, 'Kris Fay', 'ankunding.alf@example.com', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'DsXmF1llht', '2019-04-08 14:52:34', '2019-04-08 14:52:34'),
(26, 'Wendy Keeling', 'nicklaus77@example.com', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'XRsl6VU6hl', '2019-04-08 14:52:34', '2019-04-08 14:52:34'),
(29, 'Susan Grady', 'kaelyn44@example.com', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'pIsk3OHrMj', '2019-04-08 14:52:34', '2019-04-08 14:52:34'),
(30, 'Whitney Wintheiser', 'gino52@example.net', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'eJ8kcOH6d8', '2019-04-08 14:52:35', '2019-04-08 14:52:35'),
(31, 'Dr. Gabriel Vandervort Jr.', 'wiza.bart@example.com', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'b7F5hGYXi9', '2019-04-08 14:52:35', '2019-04-08 14:52:35'),
(32, 'Aliya Jakubowski', 'novella94@example.org', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'h2fNpzG8NI', '2019-04-08 14:52:35', '2019-04-08 14:52:35'),
(33, 'Alford Nolan', 'cleora25@example.com', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'ApBh3OXuz2', '2019-04-08 14:52:35', '2019-04-08 14:52:35'),
(34, 'Okey Boyer', 'bfarrell@example.net', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'Xk4NOG6sAg', '2019-04-08 14:52:35', '2019-04-08 14:52:35'),
(35, 'Ms. Hertha Streich V', 'runte.virginie@example.org', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'zbfLPdIi6Z', '2019-04-08 14:52:35', '2019-04-08 14:52:35'),
(36, 'Prof. Lawrence Labadie', 'alisha04@example.com', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'YK5OYuWWm8', '2019-04-08 14:52:35', '2019-04-08 14:52:35'),
(37, 'Clement Hane', 'omcclure@example.org', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'zgjVQS1nb3', '2019-04-08 14:52:35', '2019-04-08 14:52:35'),
(38, 'Prof. Abbigail Grant II', 'lilyan44@example.net', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'vkavVoZ1iG', '2019-04-08 14:52:35', '2019-04-08 14:52:35'),
(39, 'Georgiana Macejkovic', 'cortney69@example.net', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'CjUb4pYKE4', '2019-04-08 14:52:35', '2019-04-08 14:52:35'),
(40, 'Donavon McLaughlin', 'mustafa.robel@example.net', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'NGkxRZ7CEZ', '2019-04-08 14:52:35', '2019-04-08 14:52:35'),
(41, 'Summer Johnson', 'justice.hudson@example.net', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'YZDn3nHY7C', '2019-04-08 14:52:35', '2019-04-08 14:52:35'),
(42, 'Mr. Carey Quitzon PhD', 'pgaylord@example.com', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'REECc1ojXl', '2019-04-08 14:52:35', '2019-04-08 14:52:35'),
(43, 'Jana Heaney', 'art.stracke@example.net', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'ziDjWArKIF', '2019-04-08 14:52:35', '2019-04-08 14:52:35'),
(44, 'Darien Williamson', 'rempel.scarlett@example.com', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'f3EZZX5mVK', '2019-04-08 14:52:35', '2019-04-08 14:52:35'),
(45, 'Prof. Cordell Willms MD', 'bauch.marta@example.net', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'cd4KkieHhk', '2019-04-08 14:52:35', '2019-04-08 14:52:35'),
(46, 'Robert Okuneva MD', 'reagan.lehner@example.com', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'LG6mzGLH2w', '2019-04-08 14:52:35', '2019-04-08 14:52:35'),
(47, 'Cicero Roob', 'hoeger.ruby@example.net', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'mjqbbW55FB', '2019-04-08 14:52:35', '2019-04-08 14:52:35'),
(48, 'Cooper Stehr', 'schmidt.verna@example.org', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'kMMD7Y0fsq', '2019-04-08 14:52:35', '2019-04-08 14:52:35'),
(49, 'Dr. Kira Kuhlman', 'glenda.leannon@example.com', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'fiVA8f7AvD', '2019-04-08 14:52:35', '2019-04-08 14:52:35'),
(50, 'Mrs. Hildegard Marquardt DDS', 'adriel22@example.org', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'NYl6im3f0V', '2019-04-08 14:52:35', '2019-04-08 14:52:35'),
(51, 'Donald Rogahn', 'wilfrid.kohler@example.org', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'FFCvJmc4uh', '2019-04-08 14:52:35', '2019-04-08 14:52:35'),
(52, 'Laney Stamm', 'zherman@example.org', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'Uf3ZmHsEXz', '2019-04-08 14:52:35', '2019-04-08 14:52:35'),
(53, 'Hortense Kuhlman', 'nannie86@example.org', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'NUSLdvExUb', '2019-04-08 14:52:35', '2019-04-08 14:52:35'),
(54, 'Anastasia Stracke', 'jarod.dubuque@example.org', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, '1EeerFW0W8', '2019-04-08 14:52:35', '2019-04-08 14:52:35'),
(55, 'Elbert Smith MD', 'fstanton@example.net', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'QA1h56DJuG', '2019-04-08 14:52:35', '2019-04-08 14:52:35'),
(56, 'Prof. Savion Mante', 'memmerich@example.com', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'D5bZbfLX8q', '2019-04-08 14:52:36', '2019-04-08 14:52:36'),
(57, 'Coby Veum', 'shaun66@example.org', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'Nb5Ul7y3xB', '2019-04-08 14:52:36', '2019-04-08 14:52:36'),
(58, 'Lavonne Hintz', 'aschowalter@example.org', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'CT26mjjBGl', '2019-04-08 14:52:36', '2019-04-08 14:52:36'),
(59, 'Casimer Braun', 'daryl.tillman@example.com', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'MQ3CpFqaCo', '2019-04-08 14:52:36', '2019-04-08 14:52:36'),
(60, 'Dr. Daniela Shanahan', 'zrippin@example.com', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, '2cxSHvQ6CI', '2019-04-08 14:52:36', '2019-04-08 14:52:36'),
(61, 'Marina Renner', 'gleichner.randi@example.net', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'wpXk5SSvf0', '2019-04-08 14:52:36', '2019-04-08 14:52:36'),
(62, 'Adelbert Rath', 'htremblay@example.com', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'KDDTFifNsm', '2019-04-08 14:52:36', '2019-04-08 14:52:36'),
(63, 'Mrs. Jadyn Kemmer III', 'akemmer@example.org', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'nJVcjzxTL7', '2019-04-08 14:52:36', '2019-04-08 14:52:36'),
(64, 'Prof. Enrique Schroeder', 'harris.christiana@example.net', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, '9HH1rfTzVs', '2019-04-08 14:52:36', '2019-04-08 14:52:36'),
(65, 'Dr. Carmella Considine Sr.', 'kuhn.kamren@example.org', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'eot3zE5A7Q', '2019-04-08 14:52:36', '2019-04-08 14:52:36'),
(66, 'Gabriella Kub', 'bkuhlman@example.org', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'YjvCu6vWOI', '2019-04-08 14:52:36', '2019-04-08 14:52:36'),
(67, 'Ms. Maudie Olson', 'friesen.aracely@example.org', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'YrlKSDrnwV', '2019-04-08 14:52:36', '2019-04-08 14:52:36'),
(68, 'Darrin Bailey', 'selmer34@example.com', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, '5HdZK216H6', '2019-04-08 14:52:36', '2019-04-08 14:52:36'),
(69, 'Mr. Morris Donnelly DDS', 'bwisoky@example.net', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, '5NnetUcp3n', '2019-04-08 14:52:36', '2019-04-08 14:52:36'),
(70, 'Ms. Sylvia Bogisich III', 'gerlach.lorine@example.com', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'IWU10HhEuy', '2019-04-08 14:52:36', '2019-04-08 14:52:36'),
(71, 'Alvena Torp', 'vgutmann@example.net', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'qIhCG1mN33', '2019-04-08 14:52:37', '2019-04-08 14:52:37'),
(72, 'Davion Kuhn', 'jewel82@example.net', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'iY62kFVsej', '2019-04-08 14:52:37', '2019-04-08 14:52:37'),
(73, 'Abagail Windler', 'molly.armstrong@example.net', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'eXvnJdPdam', '2019-04-08 14:52:37', '2019-04-08 14:52:37'),
(74, 'Elian Olson', 'durgan.victor@example.org', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, '0OWpSUA0D7', '2019-04-08 14:52:37', '2019-04-08 14:52:37'),
(75, 'Nakia Mertz', 'trey87@example.com', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, '3eTAkYssS9', '2019-04-08 14:52:37', '2019-04-08 14:52:37'),
(76, 'Mrs. Mellie Schaefer III', 'korbin04@example.org', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'C4KE10MaEK', '2019-04-08 14:52:37', '2019-04-08 14:52:37'),
(77, 'Sid Macejkovic', 'williamson.bernita@example.com', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, '09xXDDtHX0', '2019-04-08 14:52:37', '2019-04-08 14:52:37'),
(78, 'Bobby Jenkins Sr.', 'jfarrell@example.com', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'Y15MLTq60w', '2019-04-08 14:52:37', '2019-04-08 14:52:37'),
(79, 'Florian Schuster', 'ashtyn38@example.net', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'DiDyXTBkSO', '2019-04-08 14:52:37', '2019-04-08 14:52:37'),
(80, 'Leonel Wehner', 'dprice@example.com', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'PmlulbAFn3', '2019-04-08 14:52:37', '2019-04-08 14:52:37'),
(81, 'Duncan Volkman', 'ortiz.theresia@example.net', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'lCWfBBZ0qv', '2019-04-08 14:52:37', '2019-04-08 14:52:37'),
(82, 'Louisa Parisian', 'efrain.feil@example.net', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'hMC7MvrxQA', '2019-04-08 14:52:37', '2019-04-08 14:52:37'),
(83, 'Brendon Bergstrom', 'vernon43@example.com', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'MH8U2EcoPE', '2019-04-08 14:52:37', '2019-04-08 14:52:37'),
(84, 'Reynold Swaniawski', 'jprohaska@example.org', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'LYfKhPdCBu', '2019-04-08 14:52:37', '2019-04-08 14:52:37'),
(85, 'Cameron Tromp', 'angel43@example.org', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'URSlH0D4j5', '2019-04-08 14:52:37', '2019-04-08 14:52:37'),
(86, 'Kirk Bogisich', 'winifred.wisoky@example.net', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, '7kiGM4PpCe', '2019-04-08 14:52:37', '2019-04-08 14:52:37'),
(87, 'Dr. Weston Green', 'kaitlin03@example.net', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, '42LPsv03l2', '2019-04-08 14:52:37', '2019-04-08 14:52:37'),
(88, 'Randal Kuvalis', 'elenor11@example.net', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'bXlFo3wLZ9', '2019-04-08 14:52:37', '2019-04-08 14:52:37'),
(89, 'Corbin D''Amore', 'gennaro.schiller@example.com', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'ZkfznGf2kH', '2019-04-08 14:52:37', '2019-04-08 14:52:37'),
(90, 'Angus Lynch', 'dbeatty@example.com', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'Hp1574iKYz', '2019-04-08 14:52:37', '2019-04-08 14:52:37'),
(91, 'Miss Kylee Dare MD', 'albert.gleason@example.com', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'fZui2cvNGH', '2019-04-08 14:52:37', '2019-04-08 14:52:37'),
(92, 'Sofia Rippin PhD', 'ezra.mertz@example.org', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'XhfZuuCHfx', '2019-04-08 14:52:37', '2019-04-08 14:52:37'),
(93, 'Alysha Hermiston', 'wbecker@example.net', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'dTmNxXWOQq', '2019-04-08 14:52:37', '2019-04-08 14:52:37'),
(94, 'Jannie O''Connell', 'lucious55@example.com', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'Ptz1pRdw5j', '2019-04-08 14:52:37', '2019-04-08 14:52:37'),
(95, 'Hal Cormier', 'green.duncan@example.net', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'sSGfzIld8Q', '2019-04-08 14:52:37', '2019-04-08 14:52:37'),
(96, 'Kieran Gulgowski', 'jschoen@example.net', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'PU8UEj2WEC', '2019-04-08 14:52:38', '2019-04-08 14:52:38'),
(97, 'Asia Koss', 'bernadine.dickinson@example.org', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'DATkd6BCEM', '2019-04-08 14:52:38', '2019-04-08 14:52:38'),
(98, 'Prof. Diamond Nienow DVM', 'allie22@example.net', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'DMcCmCkUC2', '2019-04-08 14:52:38', '2019-04-08 14:52:38'),
(99, 'Mr. Derek Schamberger DVM', 'dach.kristopher@example.org', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, '5WLMzSXgfN', '2019-04-08 14:52:38', '2019-04-08 14:52:38'),
(100, 'Philip Jacobson', 'von.asia@example.org', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'qgJR8tQCoC', '2019-04-08 14:52:38', '2019-04-08 14:52:38'),
(101, 'Mr. Jed Denesik', 'qjenkins@example.org', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'zAexE9AgVd', '2019-04-08 14:52:38', '2019-04-08 14:52:38'),
(102, 'Maiya Pagac', 'okon.vern@example.org', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'yUZ0P0H0EM', '2019-04-08 14:52:38', '2019-04-08 14:52:38'),
(103, 'Luz Haag DVM', 'tatum60@example.net', '2019-04-08 14:52:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'la0JJwGnOH', '2019-04-08 14:52:38', '2019-04-08 14:52:38'),
(104, 'Pierre Muller', 'murray.jayda@example.com', '2019-04-08 14:52:34', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'FDg8kO6HDk', '2019-04-08 14:52:38', '2019-04-08 14:52:38'),
(105, 'Anya Grimes', 'emanuel.durgan@example.net', '2019-04-08 14:52:34', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'vUOCBA9rGT', '2019-04-08 14:52:38', '2019-04-08 14:52:38'),
(106, 'Miss Savanah Boyer DDS', 'wkohler@example.com', '2019-04-08 14:52:34', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'uBJsgMJfvo', '2019-04-08 14:52:38', '2019-04-08 14:52:38'),
(107, 'Ashlynn Watsica DDS', 'linda.ratke@example.net', '2019-04-08 14:52:34', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'fBzPf8ZZR7', '2019-04-08 14:52:38', '2019-04-08 14:52:38'),
(108, 'Judy Predovic', 'cheaney@example.net', '2019-04-08 14:52:34', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'TkQ9hMUTNu', '2019-04-08 14:52:38', '2019-04-08 14:52:38'),
(109, 'Alden Cruickshank', 'doyle.dangelo@example.org', '2019-04-08 14:52:34', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'H5xpoWH8KV', '2019-04-08 14:52:38', '2019-04-08 14:52:38'),
(110, 'Major Pagac', 'drodriguez@example.org', '2019-04-08 14:52:34', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, '0FuwgUGu98', '2019-04-08 14:52:38', '2019-04-08 14:52:38'),
(111, 'Carlie Abernathy V', 'lherzog@example.com', '2019-04-08 14:52:34', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'HmI6uFWN4A', '2019-04-08 14:52:38', '2019-04-08 14:52:38'),
(112, 'Hilda McCullough DVM', 'jarrett.hilpert@example.com', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'sLkBJwnRaY', '2019-04-10 08:59:52', '2019-04-10 08:59:52'),
(113, 'Burley Homenick', 'eichmann.pink@example.com', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'RurgTIXCff', '2019-04-10 08:59:53', '2019-04-10 08:59:53'),
(114, 'Ms. Amira Armstrong', 'laurence47@example.com', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'BlIFjDORMY', '2019-04-10 08:59:53', '2019-04-10 08:59:53'),
(115, 'Wilber Graham Jr.', 'janae.steuber@example.net', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'RLUy4sARgF', '2019-04-10 08:59:53', '2019-04-10 08:59:53'),
(116, 'Hank Hand', 'casimer.konopelski@example.com', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'XHIRh4G8UQ', '2019-04-10 08:59:53', '2019-04-10 08:59:53'),
(117, 'Joaquin Price', 'brook.schmitt@example.net', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'KokBVPHuvT', '2019-04-10 08:59:53', '2019-04-10 08:59:53'),
(118, 'Prof. Malcolm Skiles', 'clinton79@example.net', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'IDSsseohX2', '2019-04-10 08:59:53', '2019-04-10 08:59:53'),
(119, 'Candelario Champlin', 'kiehn.jamil@example.org', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'gWINRlN9Ru', '2019-04-10 08:59:53', '2019-04-10 08:59:53'),
(120, 'Mrs. Shanie Blick', 'williamson.mylene@example.net', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'kE5kHHIM6C', '2019-04-10 08:59:53', '2019-04-10 08:59:53'),
(121, 'Dr. Lois McLaughlin', 'blick.elyse@example.com', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'QYAQFTIqwX', '2019-04-10 08:59:53', '2019-04-10 08:59:53'),
(122, 'Mikel Jacobson', 'dedric39@example.org', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'czWtgGEEpB', '2019-04-10 08:59:53', '2019-04-10 08:59:53'),
(123, 'Dr. Deontae Predovic MD', 'carolanne71@example.org', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'v3vry0P8GR', '2019-04-10 08:59:53', '2019-04-10 08:59:53'),
(124, 'Taurean Cummings', 'frieda70@example.net', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'LWPz5qqsQ1', '2019-04-10 08:59:53', '2019-04-10 08:59:53'),
(125, 'Jayce Stehr', 'ubednar@example.net', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, '96ym9xuiJd', '2019-04-10 08:59:53', '2019-04-10 08:59:53'),
(126, 'Marquis Schultz', 'blake01@example.com', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'jJnPqFOmYY', '2019-04-10 08:59:53', '2019-04-10 08:59:53'),
(127, 'Frankie Lowe Sr.', 'ramona28@example.com', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'QkBEXtk7xz', '2019-04-10 08:59:53', '2019-04-10 08:59:53'),
(128, 'Rosalyn Hackett', 'libby85@example.org', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'YLHzw2EF1p', '2019-04-10 08:59:53', '2019-04-10 08:59:53'),
(129, 'Guiseppe Harber PhD', 'akuhic@example.net', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'Z8gSal0MbO', '2019-04-10 08:59:53', '2019-04-10 08:59:53'),
(130, 'Miss Crystal Skiles IV', 'will.virginia@example.org', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'JGQBhoJuid', '2019-04-10 08:59:53', '2019-04-10 08:59:53'),
(131, 'Prof. Karen Beahan IV', 'lind.candelario@example.net', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'GnT0Ns9RHt', '2019-04-10 08:59:53', '2019-04-10 08:59:53'),
(132, 'Zula Pollich', 'blanche48@example.org', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'Zm22c61Rhb', '2019-04-10 08:59:53', '2019-04-10 08:59:53'),
(133, 'Mr. Gaetano Bradtke II', 'neva.hayes@example.net', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'J1W4PRLWx7', '2019-04-10 08:59:53', '2019-04-10 08:59:53'),
(134, 'Ms. Krystal Becker', 'austin.metz@example.net', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'uryQNnzFzx', '2019-04-10 08:59:53', '2019-04-10 08:59:53'),
(135, 'Diana Baumbach', 'cpouros@example.org', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'JaZlZJaEhA', '2019-04-10 08:59:53', '2019-04-10 08:59:53'),
(136, 'Novella Wisoky', 'wisoky.darren@example.com', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, '0V2yylBJWT', '2019-04-10 08:59:53', '2019-04-10 08:59:53'),
(137, 'Amos Mayer', 'zita.kemmer@example.com', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'Y8TT39DpRM', '2019-04-10 08:59:53', '2019-04-10 08:59:53'),
(138, 'Earlene Rippin', 'jordy33@example.com', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'wccRZNui3m', '2019-04-10 08:59:53', '2019-04-10 08:59:53'),
(139, 'Nella Jenkins', 'leonel.ward@example.com', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'FLyggS8DEG', '2019-04-10 08:59:53', '2019-04-10 08:59:53'),
(140, 'Dortha Hand', 'clovis.bechtelar@example.com', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'D1qkN9dtbz', '2019-04-10 08:59:53', '2019-04-10 08:59:53'),
(141, 'Mrs. Eugenia Sauer', 'bleffler@example.net', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, '5rImwY0i1b', '2019-04-10 08:59:53', '2019-04-10 08:59:53'),
(142, 'Merritt VonRueden III', 'ykris@example.com', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'u8P3cQjA7S', '2019-04-10 08:59:53', '2019-04-10 08:59:53'),
(143, 'Graciela Bartell', 'hturcotte@example.org', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'g8XnkL11qt', '2019-04-10 08:59:53', '2019-04-10 08:59:53'),
(144, 'Betsy Wehner', 'lewis.hermann@example.net', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'OMEKY7jAfA', '2019-04-10 08:59:53', '2019-04-10 08:59:53'),
(145, 'Jeromy Hudson', 'weimann.tiana@example.com', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'tqYbKBCXBI', '2019-04-10 08:59:53', '2019-04-10 08:59:53'),
(146, 'Janelle Rau', 'dell.paucek@example.com', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'cVPB8NfDyX', '2019-04-10 08:59:54', '2019-04-10 08:59:54'),
(147, 'Summer White', 'jacobson.buford@example.com', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'RVels0WH3S', '2019-04-10 08:59:54', '2019-04-10 08:59:54'),
(148, 'Miss Georgette Kozey', 'jaqueline.orn@example.org', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'Stf3fR3eU5', '2019-04-10 08:59:54', '2019-04-10 08:59:54'),
(149, 'Elva McKenzie', 'wunsch.dolly@example.net', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'U0ZSUnx8uY', '2019-04-10 08:59:54', '2019-04-10 08:59:54'),
(150, 'Elyssa Kuhic', 'srowe@example.org', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'Jl5viciuKH', '2019-04-10 08:59:54', '2019-04-10 08:59:54'),
(151, 'Dayna Stark II', 'mcasper@example.com', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'hjEMMhk6rN', '2019-04-10 08:59:54', '2019-04-10 08:59:54'),
(152, 'Miss Katelin Ledner II', 'hackett.rubie@example.com', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'dBWeBK4XMw', '2019-04-10 08:59:54', '2019-04-10 08:59:54'),
(153, 'Fidel Kovacek V', 'harber.vilma@example.net', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'Cv4ga8Xu6V', '2019-04-10 08:59:54', '2019-04-10 08:59:54'),
(154, 'Prof. Emanuel Upton II', 'zwalsh@example.org', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'lhd2VlQX3Q', '2019-04-10 08:59:54', '2019-04-10 08:59:54'),
(155, 'Zella Runolfsson', 'uorn@example.org', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'oqdAPVNNXk', '2019-04-10 08:59:54', '2019-04-10 08:59:54'),
(156, 'Emelia Klocko', 'emmalee68@example.net', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'Sy5Qno85yh', '2019-04-10 08:59:54', '2019-04-10 08:59:54'),
(157, 'Faye Cole', 'hintz.bonita@example.com', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'PFXXv8aSeO', '2019-04-10 08:59:54', '2019-04-10 08:59:54'),
(158, 'Katharina Kemmer', 'kuphal.darrel@example.com', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'yf1iQxihmf', '2019-04-10 08:59:54', '2019-04-10 08:59:54'),
(159, 'Lori Terry', 'melvina34@example.net', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'lMjUPQdfqz', '2019-04-10 08:59:54', '2019-04-10 08:59:54'),
(160, 'Kamren Haag', 'maci.vonrueden@example.org', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'uQKTCpEpiJ', '2019-04-10 08:59:54', '2019-04-10 08:59:54'),
(161, 'Yesenia Stamm', 'saul02@example.org', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'TgxnBbHaSi', '2019-04-10 08:59:54', '2019-04-10 08:59:54'),
(162, 'Jacky Thompson', 'jalyn.balistreri@example.org', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'N1whgVvfXm', '2019-04-10 08:59:54', '2019-04-10 08:59:54'),
(163, 'Kyler Bergnaum III', 'tpurdy@example.org', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'mlF0F69HJ4', '2019-04-10 08:59:54', '2019-04-10 08:59:54'),
(164, 'Jaylen Schneider', 'powlowski.adeline@example.org', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'rIBKDZs99p', '2019-04-10 08:59:54', '2019-04-10 08:59:54'),
(165, 'Brook Muller', 'deontae.jones@example.com', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'kx2iozOset', '2019-04-10 08:59:54', '2019-04-10 08:59:54'),
(166, 'Emie Nitzsche', 'dkihn@example.com', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'wo2U1wCMOZ', '2019-04-10 08:59:54', '2019-04-10 08:59:54'),
(167, 'Emely Champlin', 'ismith@example.org', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'b7Iq3i1bKa', '2019-04-10 08:59:54', '2019-04-10 08:59:54'),
(168, 'Prof. Emmet Simonis DDS', 'monahan.gabe@example.net', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'OsxveJqB2G', '2019-04-10 08:59:54', '2019-04-10 08:59:54'),
(169, 'Dr. Consuelo Shanahan', 'ujerde@example.com', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, '6Nk63Xfk6K', '2019-04-10 08:59:54', '2019-04-10 08:59:54'),
(170, 'Rocky Oberbrunner', 'dorris.paucek@example.org', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'l2rTS8SHf3', '2019-04-10 08:59:54', '2019-04-10 08:59:54'),
(171, 'Carissa Pollich', 'logan.torp@example.net', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'kA2kicCvhb', '2019-04-10 08:59:54', '2019-04-10 08:59:54'),
(172, 'Darron Langworth', 'camylle.daniel@example.net', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'JxxXuyWkZn', '2019-04-10 08:59:54', '2019-04-10 08:59:54'),
(173, 'Miss Zola Vandervort II', 'raphaelle.doyle@example.com', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'ztLyymFA2u', '2019-04-10 08:59:54', '2019-04-10 08:59:54'),
(174, 'Mrs. Eliane Lowe DDS', 'libby.satterfield@example.com', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'qXfzxSCM6c', '2019-04-10 08:59:54', '2019-04-10 08:59:54'),
(175, 'Dr. Ambrose McClure V', 'eldora.rempel@example.net', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'Ya2n0MwzXX', '2019-04-10 08:59:54', '2019-04-10 08:59:54'),
(176, 'Princess Wuckert', 'leuschke.queenie@example.com', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, '5zSNUBLcHx', '2019-04-10 08:59:54', '2019-04-10 08:59:54'),
(177, 'Zion Kling', 'trisha.terry@example.net', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'E1Xexi6gdx', '2019-04-10 08:59:54', '2019-04-10 08:59:54'),
(178, 'Khalid Lakin', 'otis68@example.net', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'zbwECJCU7X', '2019-04-10 08:59:54', '2019-04-10 08:59:54'),
(179, 'Ms. Selena Medhurst DVM', 'tremblay.wilbert@example.com', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, '8edtLJwG5x', '2019-04-10 08:59:54', '2019-04-10 08:59:54'),
(180, 'Crystel Sauer', 'shemar.schroeder@example.net', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'zbi1xS7Mrs', '2019-04-10 08:59:54', '2019-04-10 08:59:54'),
(181, 'Prof. Armando Parker', 'stoltenberg.houston@example.net', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'fE0jI8IaPf', '2019-04-10 08:59:54', '2019-04-10 08:59:54'),
(182, 'Daniella Bode', 'rory48@example.org', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'NdbdSRej8f', '2019-04-10 08:59:54', '2019-04-10 08:59:54'),
(183, 'Dawson Dibbert', 'oberbrunner.madge@example.net', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, '2nZ3MHtfw2', '2019-04-10 08:59:54', '2019-04-10 08:59:54'),
(184, 'Dr. Doug Schaden II', 'brenden19@example.com', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, '37JQfyCxlr', '2019-04-10 08:59:54', '2019-04-10 08:59:54'),
(185, 'Prof. Aidan Rowe PhD', 'ruben.strosin@example.org', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'KErfP4bQvF', '2019-04-10 08:59:54', '2019-04-10 08:59:54'),
(186, 'Gregoria Strosin II', 'crist.jaida@example.org', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, '4aglAA0npn', '2019-04-10 08:59:54', '2019-04-10 08:59:54'),
(187, 'Jannie Abbott', 'carlie.rau@example.com', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'fEwnFGxvpe', '2019-04-10 08:59:54', '2019-04-10 08:59:54'),
(188, 'Adelle Pfannerstill', 'coty86@example.net', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'zekwUsc45C', '2019-04-10 08:59:54', '2019-04-10 08:59:54'),
(189, 'Mr. Frankie Hilpert DVM', 'chuel@example.com', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'ggweuwE1Wh', '2019-04-10 08:59:55', '2019-04-10 08:59:55'),
(190, 'Carmen Rempel', 'wschultz@example.org', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'jqW7A1pTR7', '2019-04-10 08:59:55', '2019-04-10 08:59:55'),
(191, 'Cecil Franecki', 'breitenberg.macey@example.com', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'aSH45oVZNu', '2019-04-10 08:59:55', '2019-04-10 08:59:55'),
(192, 'Alf Lynch', 'loyal91@example.org', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'bEuxA7leEk', '2019-04-10 08:59:55', '2019-04-10 08:59:55'),
(193, 'Prof. Bell Gislason I', 'erin.zieme@example.net', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'w2Ww53arI2', '2019-04-10 08:59:55', '2019-04-10 08:59:55'),
(194, 'Percy Quigley', 'jamie.boyer@example.net', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, '6oExx483LF', '2019-04-10 08:59:55', '2019-04-10 08:59:55'),
(195, 'Isadore Leuschke', 'cassidy.lynch@example.org', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'DN3x9SIv6b', '2019-04-10 08:59:55', '2019-04-10 08:59:55'),
(196, 'Mr. Rosario Gleason Jr.', 'dbradtke@example.com', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, '8Gxiprr5ak', '2019-04-10 08:59:55', '2019-04-10 08:59:55'),
(197, 'Deshaun Thiel', 'littel.dana@example.org', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'SNRPAJqd6r', '2019-04-10 08:59:55', '2019-04-10 08:59:55'),
(198, 'Cydney Bradtke', 'micah.ritchie@example.net', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'aw0p2i8wos', '2019-04-10 08:59:55', '2019-04-10 08:59:55'),
(199, 'Mr. Leo Hauck I', 'roger42@example.org', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, '9n13O4UD5B', '2019-04-10 08:59:55', '2019-04-10 08:59:55'),
(200, 'Edyth Weber', 'ryan.quigley@example.net', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'dlWJINmpzL', '2019-04-10 08:59:55', '2019-04-10 08:59:55'),
(201, 'Aric Zemlak', 'akshlerin@example.org', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'nL6TYCC91Q', '2019-04-10 08:59:55', '2019-04-10 08:59:55'),
(202, 'Francis Becker', 'ytrantow@example.com', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, '3U8Vu5Mxhr', '2019-04-10 08:59:55', '2019-04-10 08:59:55'),
(203, 'Jovany Erdman', 'aliza.rice@example.com', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'V1kIc3P7Z8', '2019-04-10 08:59:55', '2019-04-10 08:59:55'),
(204, 'Chandler Mann', 'jadon.konopelski@example.com', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'tdEe9YkRta', '2019-04-10 08:59:55', '2019-04-10 08:59:55'),
(205, 'Dr. Ceasar Weimann PhD', 'akeem.johnston@example.net', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'OEfbvN3yjD', '2019-04-10 08:59:55', '2019-04-10 08:59:55'),
(206, 'Wilford Considine', 'shayna.zemlak@example.org', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'HrpwpKW3Xl', '2019-04-10 08:59:55', '2019-04-10 08:59:55'),
(207, 'Ethel Padberg', 'feil.flavio@example.net', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'db3TOQaPax', '2019-04-10 08:59:55', '2019-04-10 08:59:55'),
(208, 'Dr. Fern Davis II', 'skunde@example.net', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'pPS0kaANwB', '2019-04-10 08:59:55', '2019-04-10 08:59:55'),
(209, 'Anais Schuster', 'kuhlman.julian@example.net', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'bxHyJ7BmvY', '2019-04-10 08:59:55', '2019-04-10 08:59:55'),
(210, 'Joan Schulist', 'greenholt.ernesto@example.org', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'FLZwlHtf5p', '2019-04-10 08:59:55', '2019-04-10 08:59:55'),
(211, 'Isom Gulgowski', 'tressie.langworth@example.org', '2019-04-10 08:59:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 'avatar.png', NULL, 'dfJLibFAi9', '2019-04-10 08:59:55', '2019-04-10 08:59:55');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=100;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=212;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
