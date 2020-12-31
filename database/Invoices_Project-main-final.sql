-- --------------------------------------------------------
-- Hôte :                        localhost
-- Version du serveur:           5.7.24 - MySQL Community Server (GPL)
-- SE du serveur:                Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Listage de la structure de la base pour invoices_project-main
CREATE DATABASE IF NOT EXISTS `invoices_project-main` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `invoices_project-main`;

-- Listage de la structure de la table invoices_project-main. failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table invoices_project-main.failed_jobs : ~0 rows (environ)
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Listage de la structure de la table invoices_project-main. invoices
CREATE TABLE IF NOT EXISTS `invoices` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_number` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_Date` date DEFAULT NULL,
  `Due_date` date DEFAULT NULL,
  `product` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `section_id` bigint(20) unsigned NOT NULL,
  `Amount_collection` decimal(8,2) DEFAULT NULL,
  `Amount_Commission` decimal(8,2) NOT NULL,
  `Discount` decimal(8,2) NOT NULL,
  `Value_VAT` decimal(8,2) NOT NULL,
  `Rate_VAT` varchar(999) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Total` decimal(8,2) NOT NULL,
  `Status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Value_Status` int(11) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `Payment_Date` date DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoices_section_id_foreign` (`section_id`),
  CONSTRAINT `invoices_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table invoices_project-main.invoices : ~0 rows (environ)
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;

-- Listage de la structure de la table invoices_project-main. invoices_details
CREATE TABLE IF NOT EXISTS `invoices_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_Invoice` bigint(20) unsigned NOT NULL,
  `invoice_number` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Section` varchar(999) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Value_Status` int(11) NOT NULL,
  `Payment_Date` date DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `user` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoices_details_id_invoice_foreign` (`id_Invoice`),
  CONSTRAINT `invoices_details_id_invoice_foreign` FOREIGN KEY (`id_Invoice`) REFERENCES `invoices` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table invoices_project-main.invoices_details : ~0 rows (environ)
/*!40000 ALTER TABLE `invoices_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoices_details` ENABLE KEYS */;

-- Listage de la structure de la table invoices_project-main. invoice_attachments
CREATE TABLE IF NOT EXISTS `invoice_attachments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `file_name` varchar(999) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_number` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Created_by` varchar(999) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_attachments_invoice_id_foreign` (`invoice_id`),
  CONSTRAINT `invoice_attachments_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table invoices_project-main.invoice_attachments : ~0 rows (environ)
/*!40000 ALTER TABLE `invoice_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_attachments` ENABLE KEYS */;

-- Listage de la structure de la table invoices_project-main. migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table invoices_project-main.migrations : ~10 rows (environ)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2020_09_15_191008_create_sections_table', 1),
	(5, '2020_09_16_164252_create_invoices_table', 1),
	(6, '2020_09_19_150429_create_products_table', 1),
	(7, '2020_09_25_203659_create_invoices_details_table', 1),
	(8, '2020_09_25_205105_create_invoice_attachments_table', 1),
	(9, '2020_10_28_174351_create_permission_tables', 1),
	(10, '2020_11_24_141850_create_notifications_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Listage de la structure de la table invoices_project-main. model_has_permissions
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table invoices_project-main.model_has_permissions : ~0 rows (environ)
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;

-- Listage de la structure de la table invoices_project-main. model_has_roles
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table invoices_project-main.model_has_roles : ~0 rows (environ)
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
	(1, 'App\\User', 1);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;

-- Listage de la structure de la table invoices_project-main. notifications
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table invoices_project-main.notifications : ~0 rows (environ)
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;

-- Listage de la structure de la table invoices_project-main. password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table invoices_project-main.password_resets : ~0 rows (environ)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Listage de la structure de la table invoices_project-main. permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table invoices_project-main.permissions : ~0 rows (environ)
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(1, 'الفواتير', 'web', '2020-12-31 10:05:14', '2020-12-31 10:05:14'),
	(2, 'قائمة الفواتير', 'web', '2020-12-31 10:05:14', '2020-12-31 10:05:14'),
	(3, 'الفواتير المدفوعة', 'web', '2020-12-31 10:05:15', '2020-12-31 10:05:15'),
	(4, 'الفواتير المدفوعة جزئيا', 'web', '2020-12-31 10:05:15', '2020-12-31 10:05:15'),
	(5, 'الفواتير الغير مدفوعة', 'web', '2020-12-31 10:05:15', '2020-12-31 10:05:15'),
	(6, 'ارشيف الفواتير', 'web', '2020-12-31 10:05:15', '2020-12-31 10:05:15'),
	(7, 'التقارير', 'web', '2020-12-31 10:05:15', '2020-12-31 10:05:15'),
	(8, 'تقرير الفواتير', 'web', '2020-12-31 10:05:15', '2020-12-31 10:05:15'),
	(9, 'تقرير العملاء', 'web', '2020-12-31 10:05:15', '2020-12-31 10:05:15'),
	(10, 'المستخدمين', 'web', '2020-12-31 10:05:15', '2020-12-31 10:05:15'),
	(11, 'قائمة المستخدمين', 'web', '2020-12-31 10:05:15', '2020-12-31 10:05:15'),
	(12, 'صلاحيات المستخدمين', 'web', '2020-12-31 10:05:15', '2020-12-31 10:05:15'),
	(13, 'الاعدادات', 'web', '2020-12-31 10:05:15', '2020-12-31 10:05:15'),
	(14, 'المنتجات', 'web', '2020-12-31 10:05:15', '2020-12-31 10:05:15'),
	(15, 'الاقسام', 'web', '2020-12-31 10:05:15', '2020-12-31 10:05:15'),
	(16, 'اضافة فاتورة', 'web', '2020-12-31 10:05:15', '2020-12-31 10:05:15'),
	(17, 'حذف الفاتورة', 'web', '2020-12-31 10:05:15', '2020-12-31 10:05:15'),
	(18, 'تصدير EXCEL', 'web', '2020-12-31 10:05:15', '2020-12-31 10:05:15'),
	(19, 'تغير حالة الدفع', 'web', '2020-12-31 10:05:15', '2020-12-31 10:05:15'),
	(20, 'تعديل الفاتورة', 'web', '2020-12-31 10:05:15', '2020-12-31 10:05:15'),
	(21, 'ارشفة الفاتورة', 'web', '2020-12-31 10:05:15', '2020-12-31 10:05:15'),
	(22, 'طباعةالفاتورة', 'web', '2020-12-31 10:05:15', '2020-12-31 10:05:15'),
	(23, 'اضافة مرفق', 'web', '2020-12-31 10:05:15', '2020-12-31 10:05:15'),
	(24, 'حذف المرفق', 'web', '2020-12-31 10:05:15', '2020-12-31 10:05:15'),
	(25, 'اضافة مستخدم', 'web', '2020-12-31 10:05:15', '2020-12-31 10:05:15'),
	(26, 'تعديل مستخدم', 'web', '2020-12-31 10:05:16', '2020-12-31 10:05:16'),
	(27, 'حذف مستخدم', 'web', '2020-12-31 10:05:16', '2020-12-31 10:05:16'),
	(28, 'عرض صلاحية', 'web', '2020-12-31 10:05:16', '2020-12-31 10:05:16'),
	(29, 'اضافة صلاحية', 'web', '2020-12-31 10:05:16', '2020-12-31 10:05:16'),
	(30, 'تعديل صلاحية', 'web', '2020-12-31 10:05:16', '2020-12-31 10:05:16'),
	(31, 'حذف صلاحية', 'web', '2020-12-31 10:05:16', '2020-12-31 10:05:16'),
	(32, 'اضافة منتج', 'web', '2020-12-31 10:05:16', '2020-12-31 10:05:16'),
	(33, 'تعديل منتج', 'web', '2020-12-31 10:05:16', '2020-12-31 10:05:16'),
	(34, 'حذف منتج', 'web', '2020-12-31 10:05:16', '2020-12-31 10:05:16'),
	(35, 'اضافة قسم', 'web', '2020-12-31 10:05:16', '2020-12-31 10:05:16'),
	(36, 'تعديل قسم', 'web', '2020-12-31 10:05:16', '2020-12-31 10:05:16'),
	(37, 'حذف قسم', 'web', '2020-12-31 10:05:16', '2020-12-31 10:05:16'),
	(38, 'الاشعارات', 'web', '2020-12-31 10:05:16', '2020-12-31 10:05:16');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- Listage de la structure de la table invoices_project-main. products
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Product_name` varchar(999) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `section_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_section_id_foreign` (`section_id`),
  CONSTRAINT `products_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table invoices_project-main.products : ~0 rows (environ)
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- Listage de la structure de la table invoices_project-main. roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table invoices_project-main.roles : ~0 rows (environ)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(1, 'owner', 'web', '2020-12-31 10:05:59', '2020-12-31 10:05:59');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Listage de la structure de la table invoices_project-main. role_has_permissions
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table invoices_project-main.role_has_permissions : ~0 rows (environ)
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 1),
	(6, 1),
	(7, 1),
	(8, 1),
	(9, 1),
	(10, 1),
	(11, 1),
	(12, 1),
	(13, 1),
	(14, 1),
	(15, 1),
	(16, 1),
	(17, 1),
	(18, 1),
	(19, 1),
	(20, 1),
	(21, 1),
	(22, 1),
	(23, 1),
	(24, 1),
	(25, 1),
	(26, 1),
	(27, 1),
	(28, 1),
	(29, 1),
	(30, 1),
	(31, 1),
	(32, 1),
	(33, 1),
	(34, 1),
	(35, 1),
	(36, 1),
	(37, 1),
	(38, 1);
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;

-- Listage de la structure de la table invoices_project-main. sections
CREATE TABLE IF NOT EXISTS `sections` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `section_name` varchar(999) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `Created_by` varchar(999) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table invoices_project-main.sections : ~0 rows (environ)
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;

-- Listage de la structure de la table invoices_project-main. users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table invoices_project-main.users : ~0 rows (environ)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `roles_name`, `Status`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'samirgamal', 'samir.gamal77@yahoo.com', NULL, '$2y$10$T8Zqn.pUodVL6.mHCsxiBeoJTQ6k08oPLqeAan1JbnSz7fsyzYsne', '["owner"]', 'مفعل', NULL, '2020-12-31 10:05:59', '2020-12-31 10:05:59');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
