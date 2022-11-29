-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: mysql:3306
-- Generation Time: Nov 23, 2022 at 05:27 PM
-- Server version: 10.5.18-MariaDB-1:10.5.18+maria~ubu2004-log
-- PHP Version: 8.0.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blestadb`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts_ach`
--

CREATE TABLE `accounts_ach` (
  `id` int(10) UNSIGNED NOT NULL,
  `contact_id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(128) NOT NULL,
  `last_name` varchar(128) NOT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(3) DEFAULT NULL,
  `zip` varchar(128) DEFAULT NULL,
  `country` varchar(2) NOT NULL DEFAULT 'US',
  `account` text DEFAULT NULL,
  `routing` text DEFAULT NULL,
  `last4` varchar(128) DEFAULT NULL,
  `type` enum('checking','savings') NOT NULL DEFAULT 'checking',
  `gateway_id` int(10) UNSIGNED DEFAULT NULL,
  `client_reference_id` varchar(128) DEFAULT NULL,
  `reference_id` varchar(128) DEFAULT NULL,
  `status` enum('active','inactive','unverified') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_cc`
--

CREATE TABLE `accounts_cc` (
  `id` int(10) UNSIGNED NOT NULL,
  `contact_id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(128) NOT NULL,
  `last_name` varchar(128) NOT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(3) DEFAULT NULL,
  `zip` varchar(128) DEFAULT NULL,
  `country` varchar(2) NOT NULL DEFAULT 'US',
  `number` text DEFAULT NULL,
  `expiration` varchar(128) NOT NULL,
  `last4` varchar(128) DEFAULT NULL,
  `type` enum('amex','bc','cup','dc-cb','dc-er','dc-int','dc-uc','disc','ipi','jcb','lasr','maes','mc','solo','switch','visa','other') NOT NULL,
  `gateway_id` int(10) UNSIGNED DEFAULT NULL,
  `client_reference_id` varchar(255) DEFAULT NULL,
  `reference_id` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `acl_acl`
--

CREATE TABLE `acl_acl` (
  `aro_id` int(11) NOT NULL,
  `aco_id` int(11) NOT NULL,
  `action` varchar(255) NOT NULL,
  `permission` enum('allow','deny') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `acl_acl`
--

INSERT INTO `acl_acl` (`aro_id`, `aco_id`, `action`, `permission`) VALUES
(1, 1, '*', 'allow'),
(1, 1, 'calendar', 'allow'),
(1, 2, '*', 'allow'),
(1, 2, 'accounts', 'allow'),
(1, 2, 'add', 'allow'),
(1, 2, 'addachaccount', 'allow'),
(1, 2, 'addccaccount', 'allow'),
(1, 2, 'addcontact', 'allow'),
(1, 2, 'addnote', 'allow'),
(1, 2, 'addservice', 'allow'),
(1, 2, 'createinvoice', 'allow'),
(1, 2, 'delete', 'allow'),
(1, 2, 'deleteachaccount', 'allow'),
(1, 2, 'deleteccaccount', 'allow'),
(1, 2, 'deletecontact', 'allow'),
(1, 2, 'deletenote', 'allow'),
(1, 2, 'deleteservice', 'allow'),
(1, 2, 'edit', 'allow'),
(1, 2, 'editachaccount', 'allow'),
(1, 2, 'editccaccount', 'allow'),
(1, 2, 'editcontact', 'allow'),
(1, 2, 'editinvoice', 'allow'),
(1, 2, 'editnote', 'allow'),
(1, 2, 'editrecurinvoice', 'allow'),
(1, 2, 'editservice', 'allow'),
(1, 2, 'edittransaction', 'allow'),
(1, 2, 'email', 'allow'),
(1, 2, 'emails', 'allow'),
(1, 2, 'invoices', 'allow'),
(1, 2, 'loginasclient', 'allow'),
(1, 2, 'makepayment', 'allow'),
(1, 2, 'merge', 'allow'),
(1, 2, 'notes', 'allow'),
(1, 2, 'packages', 'allow'),
(1, 2, 'passwordreset', 'allow'),
(1, 2, 'quickupdate', 'allow'),
(1, 2, 'recordpayment', 'allow'),
(1, 2, 'services', 'allow'),
(1, 2, 'transactions', 'allow'),
(1, 2, 'view', 'allow'),
(1, 2, 'viewinvoice', 'allow'),
(1, 3, '*', 'allow'),
(1, 3, 'batch', 'allow'),
(1, 3, 'invoices', 'allow'),
(1, 3, 'printqueue', 'allow'),
(1, 3, 'services', 'allow'),
(1, 3, 'transactions', 'allow'),
(1, 4, '*', 'allow'),
(1, 4, 'add', 'allow'),
(1, 4, 'addgroup', 'allow'),
(1, 4, 'delete', 'allow'),
(1, 4, 'deletegroup', 'allow'),
(1, 4, 'edit', 'allow'),
(1, 4, 'editgroup', 'allow'),
(1, 4, 'groups', 'allow'),
(1, 5, '*', 'allow'),
(1, 5, 'convertcurrency', 'allow'),
(1, 5, 'logs', 'allow'),
(1, 5, 'utilities', 'allow'),
(1, 6, '*', 'allow'),
(1, 7, '*', 'allow'),
(1, 7, 'company', 'allow'),
(1, 7, 'system', 'allow'),
(1, 8, 'addcontacttype', 'allow'),
(1, 8, 'contacttypes', 'allow'),
(1, 8, 'deletecontacttype', 'allow'),
(1, 8, 'editcontacttype', 'allow'),
(1, 8, 'encryption', 'allow'),
(1, 8, 'humanverification', 'allow'),
(1, 8, 'installlanguage', 'allow'),
(1, 8, 'international', 'allow'),
(1, 8, 'localization', 'allow'),
(1, 8, 'marketing', 'allow'),
(1, 8, 'smartsearch', 'allow'),
(1, 8, 'uninstalllanguage', 'allow'),
(1, 9, 'acceptedtypes', 'allow'),
(1, 9, 'addcoupon', 'allow'),
(1, 9, 'coupons', 'allow'),
(1, 9, 'customization', 'allow'),
(1, 9, 'deletecoupon', 'allow'),
(1, 9, 'deliverymethods', 'allow'),
(1, 9, 'editcoupon', 'allow'),
(1, 9, 'invoices', 'allow'),
(1, 9, 'latefees', 'allow'),
(1, 9, 'notices', 'allow'),
(1, 10, '*', 'allow'),
(1, 10, 'install', 'allow'),
(1, 10, 'manage', 'allow'),
(1, 10, 'uninstall', 'allow'),
(1, 10, 'upgrade', 'allow'),
(1, 11, '*', 'allow'),
(1, 11, 'install', 'allow'),
(1, 11, 'manage', 'allow'),
(1, 11, 'uninstall', 'allow'),
(1, 11, 'upgrade', 'allow'),
(1, 12, '*', 'allow'),
(1, 13, 'addsignature', 'allow'),
(1, 13, 'deletesignature', 'allow'),
(1, 13, 'editsignature', 'allow'),
(1, 13, 'edittemplate', 'allow'),
(1, 13, 'mail', 'allow'),
(1, 13, 'mailtest', 'allow'),
(1, 13, 'signatures', 'allow'),
(1, 13, 'templates', 'allow'),
(1, 15, '*', 'allow'),
(1, 16, '*', 'allow'),
(1, 16, 'install', 'allow'),
(1, 16, 'manage', 'allow'),
(1, 16, 'settings', 'allow'),
(1, 16, 'uninstall', 'allow'),
(1, 16, 'upgrade', 'allow'),
(1, 17, '*', 'allow'),
(1, 18, 'addtype', 'allow'),
(1, 18, 'basic', 'allow'),
(1, 18, 'deletetype', 'allow'),
(1, 18, 'edittype', 'allow'),
(1, 18, 'geoip', 'allow'),
(1, 18, 'license', 'allow'),
(1, 18, 'maintenance', 'allow'),
(1, 18, 'paymenttypes', 'allow'),
(1, 19, '*', 'allow'),
(1, 20, '*', 'allow'),
(1, 21, '*', 'allow'),
(1, 22, 'add', 'allow'),
(1, 22, 'addgroup', 'allow'),
(1, 22, 'deletegroup', 'allow'),
(1, 22, 'edit', 'allow'),
(1, 22, 'editgroup', 'allow'),
(1, 22, 'groups', 'allow'),
(1, 22, 'manage', 'allow'),
(1, 22, 'status', 'allow'),
(1, 23, '*', 'allow'),
(1, 24, '*', 'allow'),
(1, 25, '*', 'allow'),
(1, 26, '*', 'allow'),
(1, 27, '*', 'allow'),
(1, 28, '*', 'allow'),
(1, 29, '*', 'allow'),
(1, 29, 'actions', 'allow'),
(1, 29, 'addaction', 'allow'),
(1, 29, 'customize', 'allow'),
(1, 29, 'editaction', 'allow'),
(1, 29, 'layout', 'allow'),
(1, 29, 'navigation', 'allow'),
(1, 30, '*', 'allow'),
(1, 31, '*', 'allow'),
(1, 32, '*', 'allow'),
(1, 33, '*', 'allow'),
(1, 34, 'customfields', 'allow'),
(1, 34, 'general', 'allow'),
(1, 34, 'requiredfields', 'allow'),
(1, 35, '*', 'allow'),
(1, 35, 'configuration', 'allow'),
(1, 35, 'edittemplate', 'allow'),
(1, 35, 'install', 'allow'),
(1, 35, 'manage', 'allow'),
(1, 35, 'templates', 'allow'),
(1, 35, 'uninstall', 'allow'),
(1, 35, 'upgrade', 'allow'),
(1, 36, '*', 'allow'),
(1, 37, '*', 'allow'),
(1, 37, 'billing', 'allow'),
(1, 38, '*', 'allow'),
(1, 38, 'billing', 'allow'),
(1, 39, '*', 'allow'),
(1, 39, 'dashboard', 'allow'),
(1, 40, '*', 'allow'),
(1, 40, 'billing', 'allow'),
(1, 41, '*', 'allow'),
(1, 41, 'browse', 'allow'),
(1, 41, 'configuration', 'allow'),
(1, 41, 'registrars', 'allow'),
(1, 41, 'tlds', 'allow'),
(1, 41, 'whois', 'allow'),
(1, 42, '*', 'allow'),
(1, 42, 'activate', 'allow'),
(1, 42, 'add', 'allow'),
(1, 42, 'deactivate', 'allow'),
(1, 42, 'settings', 'allow'),
(1, 42, 'update', 'allow'),
(1, 43, '*', 'allow'),
(1, 44, '*', 'allow'),
(1, 44, 'dashboard', 'allow'),
(1, 45, '*', 'allow'),
(1, 45, 'add', 'allow'),
(1, 45, 'delete', 'allow'),
(1, 45, 'edit', 'allow'),
(1, 46, '*', 'allow'),
(1, 46, 'approve', 'allow'),
(1, 46, 'decline', 'allow'),
(1, 46, 'edit', 'allow'),
(1, 47, '*', 'allow'),
(1, 48, '*', 'allow'),
(1, 48, 'client', 'allow'),
(1, 48, 'delete', 'allow'),
(1, 49, '*', 'allow'),
(1, 50, '*', 'allow'),
(1, 51, '*', 'allow'),
(1, 52, '*', 'allow'),
(2, 1, '*', 'allow'),
(2, 1, 'calendar', 'allow'),
(2, 2, '*', 'allow'),
(2, 2, 'accounts', 'allow'),
(2, 2, 'add', 'allow'),
(2, 2, 'addachaccount', 'allow'),
(2, 2, 'addccaccount', 'allow'),
(2, 2, 'addcontact', 'allow'),
(2, 2, 'addnote', 'allow'),
(2, 2, 'addservice', 'allow'),
(2, 2, 'createinvoice', 'allow'),
(2, 2, 'delete', 'allow'),
(2, 2, 'deleteachaccount', 'allow'),
(2, 2, 'deleteccaccount', 'allow'),
(2, 2, 'deletecontact', 'allow'),
(2, 2, 'deletenote', 'allow'),
(2, 2, 'deleteservice', 'allow'),
(2, 2, 'edit', 'allow'),
(2, 2, 'editachaccount', 'allow'),
(2, 2, 'editccaccount', 'allow'),
(2, 2, 'editcontact', 'allow'),
(2, 2, 'editinvoice', 'allow'),
(2, 2, 'editnote', 'allow'),
(2, 2, 'editrecurinvoice', 'allow'),
(2, 2, 'editservice', 'allow'),
(2, 2, 'edittransaction', 'allow'),
(2, 2, 'email', 'allow'),
(2, 2, 'emails', 'allow'),
(2, 2, 'invoices', 'allow'),
(2, 2, 'makepayment', 'allow'),
(2, 2, 'merge', 'allow'),
(2, 2, 'notes', 'allow'),
(2, 2, 'packages', 'allow'),
(2, 2, 'passwordreset', 'allow'),
(2, 2, 'quickupdate', 'allow'),
(2, 2, 'recordpayment', 'allow'),
(2, 2, 'services', 'allow'),
(2, 2, 'transactions', 'allow'),
(2, 2, 'view', 'allow'),
(2, 2, 'viewinvoice', 'allow'),
(2, 3, '*', 'allow'),
(2, 3, 'invoices', 'allow'),
(2, 3, 'printqueue', 'allow'),
(2, 3, 'services', 'allow'),
(2, 3, 'transactions', 'allow'),
(2, 4, '*', 'deny'),
(2, 4, 'add', 'deny'),
(2, 4, 'delete', 'allow'),
(2, 4, 'edit', 'deny'),
(2, 4, 'groups', 'deny'),
(2, 5, '*', 'deny'),
(2, 5, 'convertcurrency', 'deny'),
(2, 5, 'logs', 'deny'),
(2, 5, 'mailer', 'deny'),
(2, 6, '*', 'allow'),
(2, 7, '*', 'deny'),
(2, 7, 'company', 'deny'),
(2, 7, 'system', 'deny'),
(2, 8, 'encryption', 'deny'),
(2, 8, 'humanverification', 'deny'),
(2, 8, 'international', 'deny'),
(2, 8, 'localization', 'deny'),
(2, 8, 'smartsearch', 'deny'),
(2, 9, 'coupons', 'deny'),
(2, 9, 'customization', 'deny'),
(2, 9, 'deliverymethods', 'deny'),
(2, 9, 'invoices', 'deny'),
(2, 9, 'latefees', 'deny'),
(2, 9, 'notices', 'deny'),
(2, 10, '*', 'deny'),
(2, 10, 'install', 'deny'),
(2, 10, 'manage', 'deny'),
(2, 10, 'uninstall', 'deny'),
(2, 10, 'upgrade', 'deny'),
(2, 11, '*', 'deny'),
(2, 11, 'install', 'deny'),
(2, 11, 'manage', 'deny'),
(2, 11, 'uninstall', 'deny'),
(2, 11, 'upgrade', 'deny'),
(2, 13, 'mail', 'deny'),
(2, 13, 'mailtest', 'deny'),
(2, 13, 'signatures', 'deny'),
(2, 13, 'templates', 'deny'),
(2, 16, '*', 'deny'),
(2, 16, 'install', 'deny'),
(2, 16, 'manage', 'deny'),
(2, 16, 'settings', 'deny'),
(2, 16, 'uninstall', 'deny'),
(2, 16, 'upgrade', 'deny'),
(2, 17, '*', 'deny'),
(2, 18, 'basic', 'deny'),
(2, 18, 'geoip', 'deny'),
(2, 18, 'license', 'deny'),
(2, 18, 'maintenance', 'deny'),
(2, 19, '*', 'deny'),
(2, 20, '*', 'deny'),
(2, 22, 'groups', 'deny'),
(2, 22, 'manage', 'deny'),
(2, 23, '*', 'deny'),
(2, 24, '*', 'deny'),
(2, 25, '*', 'deny'),
(2, 26, '*', 'deny'),
(2, 29, 'actions', 'deny'),
(2, 29, 'addaction', 'deny'),
(2, 29, 'customize', 'deny'),
(2, 29, 'editaction', 'deny'),
(2, 29, 'layout', 'deny'),
(2, 29, 'navigation', 'deny'),
(2, 31, '*', 'allow'),
(2, 33, '*', 'allow'),
(2, 35, '*', 'deny'),
(2, 35, 'configuration', 'deny'),
(2, 35, 'edittemplate', 'deny'),
(2, 35, 'install', 'deny'),
(2, 35, 'manage', 'deny'),
(2, 35, 'templates', 'deny'),
(2, 35, 'uninstall', 'deny'),
(2, 35, 'upgrade', 'deny');

-- --------------------------------------------------------

--
-- Table structure for table `acl_aco`
--

CREATE TABLE `acl_aco` (
  `id` int(11) NOT NULL,
  `alias` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `acl_aco`
--

INSERT INTO `acl_aco` (`id`, `alias`) VALUES
(3, 'admin_billing'),
(2, 'admin_clients'),
(33, 'admin_clients_service'),
(28, 'admin_company_automation'),
(9, 'admin_company_billing'),
(34, 'admin_company_clientoptions'),
(15, 'admin_company_currencies'),
(13, 'admin_company_emails'),
(36, 'admin_company_feeds'),
(11, 'admin_company_gateways'),
(8, 'admin_company_general'),
(17, 'admin_company_groups'),
(29, 'admin_company_lookandfeel'),
(35, 'admin_company_messengers'),
(10, 'admin_company_modules'),
(16, 'admin_company_plugins'),
(12, 'admin_company_taxes'),
(30, 'admin_company_themes'),
(1, 'admin_main'),
(27, 'admin_package_options'),
(4, 'admin_packages'),
(31, 'admin_reports'),
(32, 'admin_reports_customize'),
(6, 'admin_search'),
(7, 'admin_settings'),
(23, 'admin_system_api'),
(19, 'admin_system_automation'),
(21, 'admin_system_backup'),
(20, 'admin_system_companies'),
(18, 'admin_system_general'),
(25, 'admin_system_help'),
(26, 'admin_system_marketplace'),
(22, 'admin_system_staff'),
(24, 'admin_system_upgrade'),
(5, 'admin_tools'),
(39, 'billing_overview.admin_main'),
(41, 'domains.admin_domains'),
(40, 'feed_reader.admin_main'),
(42, 'order.admin_affiliates'),
(43, 'order.admin_forms'),
(44, 'order.admin_main'),
(45, 'order.admin_payment_methods'),
(46, 'order.admin_payouts'),
(49, 'support_manager.admin_departments'),
(52, 'support_manager.admin_knowledgebase'),
(47, 'support_manager.admin_main'),
(50, 'support_manager.admin_responses'),
(51, 'support_manager.admin_staff'),
(48, 'support_manager.admin_tickets'),
(38, 'system_overview.admin_main'),
(37, 'system_status.admin_main');

-- --------------------------------------------------------

--
-- Table structure for table `acl_aro`
--

CREATE TABLE `acl_aro` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `alias` varchar(255) NOT NULL,
  `lineage` varchar(255) NOT NULL DEFAULT '/'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `acl_aro`
--

INSERT INTO `acl_aro` (`id`, `parent_id`, `alias`, `lineage`) VALUES
(1, NULL, 'staff_group_1', '/'),
(2, NULL, 'staff_group_2', '/');

-- --------------------------------------------------------

--
-- Table structure for table `actions`
--

CREATE TABLE `actions` (
  `id` int(10) UNSIGNED NOT NULL,
  `location` enum('nav_public','nav_client','nav_staff','widget_client_home','widget_staff_home','widget_staff_client','widget_staff_billing','action_staff_client') NOT NULL DEFAULT 'nav_staff',
  `url` varchar(255) NOT NULL,
  `name` varchar(128) NOT NULL,
  `options` text DEFAULT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `plugin_id` int(10) UNSIGNED DEFAULT NULL,
  `editable` tinyint(1) NOT NULL DEFAULT 1,
  `enabled` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `actions`
--

INSERT INTO `actions` (`id`, `location`, `url`, `name`, `options`, `company_id`, `plugin_id`, `editable`, `enabled`) VALUES
(1, 'nav_staff', '', 'Navigation.getprimary.nav_home', NULL, 1, NULL, 0, 1),
(2, 'nav_staff', 'clients/', 'Navigation.getprimary.nav_clients', NULL, 1, NULL, 0, 1),
(3, 'nav_staff', 'billing/', 'Navigation.getprimary.nav_billing', NULL, 1, NULL, 0, 1),
(4, 'nav_staff', 'packages/', 'Navigation.getprimary.nav_packages', NULL, 1, NULL, 0, 1),
(5, 'nav_staff', 'tools/', 'Navigation.getprimary.nav_tools', NULL, 1, NULL, 0, 1),
(6, 'nav_staff', 'billing/index/', 'Navigation.getprimary.nav_billing_overview', NULL, 1, NULL, 0, 1),
(7, 'nav_staff', 'billing/invoices/', 'Navigation.getprimary.nav_billing_invoices', NULL, 1, NULL, 0, 1),
(8, 'nav_staff', 'billing/transactions/', 'Navigation.getprimary.nav_billing_transactions', NULL, 1, NULL, 0, 1),
(9, 'nav_staff', 'billing/services/', 'Navigation.getprimary.nav_billing_services', NULL, 1, NULL, 0, 1),
(10, 'nav_staff', 'reports/', 'Navigation.getprimary.nav_billing_reports', NULL, 1, NULL, 0, 1),
(11, 'nav_staff', 'billing/printqueue/', 'Navigation.getprimary.nav_billing_printqueue', NULL, 1, NULL, 0, 1),
(12, 'nav_staff', 'billing/batch/', 'Navigation.getprimary.nav_billing_batch', NULL, 1, NULL, 0, 1),
(13, 'nav_staff', 'packages/groups/', 'Navigation.getprimary.nav_packages_groups', NULL, 1, NULL, 0, 1),
(14, 'nav_staff', 'package_options/', 'Navigation.getprimary.nav_package_options', 'a:1:{s:5:\"route\";a:2:{s:10:\"controller\";s:21:\"admin_package_options\";s:6:\"action\";s:1:\"*\";}}', 1, NULL, 0, 1),
(15, 'nav_staff', 'tools/logs/', 'Navigation.getprimary.nav_tools_logs', NULL, 1, NULL, 0, 1),
(16, 'nav_staff', 'tools/convertcurrency/', 'Navigation.getprimary.nav_tools_currency', NULL, 1, NULL, 0, 1),
(17, 'nav_client', '', 'Navigation.getprimaryclient.nav_dashboard', NULL, 1, NULL, 0, 1),
(20, 'nav_public', '', 'Navigation.getprimarypublic.nav_dashboard', NULL, 1, NULL, 0, 1),
(21, 'nav_staff', 'tools/utilities/', 'Navigation.getprimary.nav_tools_utilities', NULL, 1, NULL, 0, 1),
(22, 'nav_client', 'services/index/', 'Navigation.getprimaryclient.nav_services', NULL, 1, NULL, 0, 1),
(23, 'widget_client_home', 'invoices/?whole_widget=true', 'ClientInvoices.index.boxtitle_invoices', NULL, 1, NULL, 0, 1),
(24, 'widget_client_home', 'services/?whole_widget=true', 'ClientServices.index.boxtitle_services', NULL, 1, NULL, 0, 1),
(25, 'widget_client_home', 'transactions/?whole_widget=true', 'ClientTransactions.index.boxtitle_transactions', NULL, 1, NULL, 0, 1),
(26, 'widget_staff_home', 'widget/system_status/admin_main/', 'SystemStatusPlugin.name', NULL, 1, 2, 1, 1),
(27, 'widget_staff_billing', 'widget/system_status/admin_main/billing', 'SystemStatusPlugin.name', NULL, 1, 2, 1, 0),
(28, 'widget_staff_home', 'widget/system_overview/admin_main/', 'SystemOverviewPlugin.name', NULL, 1, 3, 1, 1),
(29, 'widget_staff_billing', 'widget/system_overview/admin_main/billing', 'SystemOverviewPlugin.name', NULL, 1, 3, 1, 0),
(30, 'widget_staff_home', 'widget/billing_overview/admin_main/dashboard', 'BillingOverviewPlugin.name', NULL, 1, 4, 1, 0),
(31, 'widget_staff_billing', 'widget/billing_overview/admin_main/', 'BillingOverviewPlugin.name', NULL, 1, 4, 1, 1),
(32, 'widget_staff_home', 'widget/feed_reader/admin_main/', 'FeedReaderPlugin.name', NULL, 1, 5, 1, 1),
(33, 'widget_staff_billing', 'widget/feed_reader/admin_main/billing', 'FeedReaderPlugin.name', NULL, 1, 5, 1, 0),
(34, 'nav_staff', 'plugin/domains/admin_domains/browse/', 'DomainsPlugin.nav_secondary_staff.domains', 'a:1:{s:6:\"parent\";s:8:\"billing/\";}', 1, 7, 1, 1),
(35, 'nav_client', 'plugin/domains/client_main/index/', 'DomainsPlugin.nav_client.domains', 'a:1:{s:6:\"parent\";s:22:\"services/index/active/\";}', 1, 7, 1, 1),
(36, 'nav_staff', 'plugin/domains/admin_domains/tlds/', 'DomainsPlugin.nav_secondary_staff.domain_options', 'a:1:{s:6:\"parent\";s:9:\"packages/\";}', 1, 7, 1, 1),
(37, 'widget_staff_client', 'plugin/domains/admin_main/domains/', 'DomainsPlugin.widget_staff_home.main', NULL, 1, 7, 1, 1),
(38, 'widget_client_home', 'plugin/domains/client_main/widget/', 'DomainsPlugin.widget_client_home.main', NULL, 1, 7, 1, 1),
(39, 'widget_staff_home', 'widget/order/admin_main/dashboard', 'OrderPlugin.admin_main.name', NULL, 1, 8, 1, 0),
(40, 'widget_staff_billing', 'widget/order/admin_main/', 'OrderPlugin.admin_main.name', NULL, 1, 8, 1, 1),
(41, 'nav_staff', 'plugin/order/admin_forms/', 'OrderPlugin.admin_forms.name', 'a:1:{s:6:\"parent\";s:9:\"packages/\";}', 1, 8, 1, 1),
(42, 'nav_client', 'order/', 'OrderPlugin.client.name', 'a:1:{s:8:\"base_uri\";s:6:\"public\";}', 1, 8, 1, 1),
(43, 'nav_client', 'order/orders/', 'OrderPlugin.client_orders.name', NULL, 1, 8, 1, 1),
(44, 'nav_public', 'order/', 'OrderPlugin.client.name', 'a:1:{s:8:\"base_uri\";s:6:\"public\";}', 1, 8, 1, 1),
(45, 'nav_public', 'order/orders/', 'OrderPlugin.client_orders.name', NULL, 1, 8, 1, 1),
(46, 'nav_staff', 'plugin/order/admin_affiliates/', 'OrderPlugin.admin_affiliates.name', 'a:1:{s:6:\"parent\";s:8:\"clients/\";}', 1, 8, 1, 1),
(47, 'nav_client', 'order/affiliates/', 'OrderPlugin.client_affiliates.name', 'a:1:{s:8:\"base_uri\";s:6:\"public\";}', 1, 8, 1, 0),
(48, 'nav_public', 'order/affiliates/', 'OrderPlugin.client_affiliates.name', 'a:1:{s:8:\"base_uri\";s:6:\"public\";}', 1, 8, 1, 0),
(49, 'action_staff_client', 'plugin/order/admin_main/affiliates/', 'OrderPlugin.action_staff_client.affiliates', 'a:2:{s:5:\"class\";s:5:\"users\";s:4:\"icon\";s:8:\"fa-users\";}', 1, 8, 1, 0),
(50, 'nav_client', 'plugin/support_manager/client_main/', 'SupportManagerPlugin.nav_primary_client.main', 'a:0:{}', 1, 9, 1, 1),
(51, 'nav_client', 'plugin/support_manager/client_tickets/', 'SupportManagerPlugin.nav_primary_client.tickets', NULL, 1, 9, 1, 1),
(52, 'nav_client', 'plugin/support_manager/knowledgebase/', 'SupportManagerPlugin.nav_primary_client.knowledgebase', NULL, 1, 9, 1, 1),
(53, 'nav_public', 'plugin/support_manager/client_main/', 'SupportManagerPlugin.nav_primary_client.main', 'a:0:{}', 1, 9, 1, 1),
(54, 'nav_public', 'plugin/support_manager/client_tickets/', 'SupportManagerPlugin.nav_primary_client.tickets', NULL, 1, 9, 1, 1),
(55, 'nav_public', 'plugin/support_manager/knowledgebase/', 'SupportManagerPlugin.nav_primary_client.knowledgebase', NULL, 1, 9, 1, 1),
(56, 'nav_staff', 'plugin/support_manager/admin_main/', 'SupportManagerPlugin.nav_primary_staff.main', 'a:0:{}', 1, 9, 1, 1),
(57, 'nav_staff', 'plugin/support_manager/admin_tickets/', 'SupportManagerPlugin.nav_primary_staff.tickets', NULL, 1, 9, 1, 1),
(58, 'nav_staff', 'plugin/support_manager/admin_departments/', 'SupportManagerPlugin.nav_primary_staff.departments', NULL, 1, 9, 1, 1),
(59, 'nav_staff', 'plugin/support_manager/admin_responses/', 'SupportManagerPlugin.nav_primary_staff.responses', NULL, 1, 9, 1, 1),
(60, 'nav_staff', 'plugin/support_manager/admin_staff/', 'SupportManagerPlugin.nav_primary_staff.staff', NULL, 1, 9, 1, 1),
(61, 'nav_staff', 'plugin/support_manager/admin_knowledgebase/', 'SupportManagerPlugin.nav_primary_staff.knowledgebase', NULL, 1, 9, 1, 1),
(62, 'widget_staff_client', 'plugin/support_manager/admin_tickets/client/', 'SupportManagerPlugin.widget_staff_client.tickets', NULL, 1, 9, 1, 1),
(63, 'action_staff_client', 'plugin/support_manager/admin_tickets/add/', 'SupportManagerPlugin.action_staff_client.add', 'a:2:{s:5:\"class\";s:6:\"ticket\";s:4:\"icon\";s:13:\"fa-ticket-alt\";}', 1, 9, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `api_keys`
--

CREATE TABLE `api_keys` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `user` varchar(64) NOT NULL,
  `key` varchar(64) NOT NULL,
  `date_created` datetime NOT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `billing_overview_settings`
--

CREATE TABLE `billing_overview_settings` (
  `staff_id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `order` int(5) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `calendar_events`
--

CREATE TABLE `calendar_events` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `staff_id` int(10) UNSIGNED NOT NULL,
  `shared` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `title` text NOT NULL,
  `url` text DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `all_day` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_format` varchar(64) NOT NULL,
  `id_value` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `client_group_id` int(10) UNSIGNED NOT NULL,
  `primary_account_id` int(10) UNSIGNED DEFAULT NULL,
  `primary_account_type` enum('ach','cc') DEFAULT NULL,
  `status` enum('active','inactive','fraud') NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_account`
--

CREATE TABLE `client_account` (
  `client_id` int(10) UNSIGNED NOT NULL,
  `account_id` int(10) UNSIGNED NOT NULL,
  `type` enum('ach','cc') NOT NULL DEFAULT 'cc',
  `failed_count` smallint(5) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_fields`
--

CREATE TABLE `client_fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_group_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_lang` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `type` enum('text','checkbox','select','textarea') NOT NULL DEFAULT 'text',
  `values` text DEFAULT NULL,
  `default` text DEFAULT NULL,
  `regex` text DEFAULT NULL,
  `show_client` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `encrypted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `read_only` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_groups`
--

CREATE TABLE `client_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` text DEFAULT NULL,
  `color` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `client_groups`
--

INSERT INTO `client_groups` (`id`, `company_id`, `name`, `description`, `color`) VALUES
(1, 1, 'General', 'This is the default client group.', 'dcdcdc');

-- --------------------------------------------------------

--
-- Table structure for table `client_group_settings`
--

CREATE TABLE `client_group_settings` (
  `key` varchar(32) NOT NULL,
  `client_group_id` int(10) UNSIGNED NOT NULL,
  `value` text NOT NULL,
  `encrypted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `client_group_settings`
--

INSERT INTO `client_group_settings` (`key`, `client_group_id`, `value`, `encrypted`) VALUES
('client_create_addons', 1, 'true', 0),
('shown_contact_fields', 1, 'YToxMzp7aTowO3M6MTA6ImZpcnN0X25hbWUiO2k6MTtzOjk6Imxhc3RfbmFtZSI7aToyO3M6NzoiY29tcGFueSI7aTozO3M6NToidGl0bGUiO2k6NDtzOjg6ImFkZHJlc3MxIjtpOjU7czo4OiJhZGRyZXNzMiI7aTo2O3M6NDoiY2l0eSI7aTo3O3M6NzoiY291bnRyeSI7aTo4O3M6NToic3RhdGUiO2k6OTtzOjM6InppcCI7aToxMDtzOjU6ImVtYWlsIjtpOjExO3M6MzoiZmF4IjtpOjEyO3M6NToicGhvbmUiO30=', 0),
('void_inv_canceled_service_days', 1, '0', 0),
('void_invoice_canceled_service', 1, 'true', 0);

-- --------------------------------------------------------

--
-- Table structure for table `client_notes`
--

CREATE TABLE `client_notes` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `staff_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `stickied` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL,
  `date_updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_packages`
--

CREATE TABLE `client_packages` (
  `client_id` int(10) UNSIGNED NOT NULL,
  `package_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_settings`
--

CREATE TABLE `client_settings` (
  `key` varchar(32) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `value` text NOT NULL,
  `encrypted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_values`
--

CREATE TABLE `client_values` (
  `client_field_id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `value` text NOT NULL,
  `encrypted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_pages`
--

CREATE TABLE `cms_pages` (
  `uri` varchar(255) NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `lang` varchar(5) NOT NULL DEFAULT 'en_us',
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cms_pages`
--

INSERT INTO `cms_pages` (`uri`, `company_id`, `lang`, `title`, `content`) VALUES
('/', 1, 'en_us', 'Client Portal', '\n    <div class=\"col-md-12\">\n        <div class=\"thanks\">\n            <blockquote>\n                <h4>Thank you for installing Blesta!</h4>\n                <p>This is your client portal page, and you may wish to link here from your website. This message can be removed through the staff area under Settings > Plugins > Portal: Manage.</p>\n                <p>\n                    <ul>\n                        <li>You may log into the staff area at <a href=\"{admin_url}\">{admin_url}login/</a>.</li>\n                        <li>Clients may login to the client area at <a href=\"{client_url}\">{client_url}login/</a>.</li>\n                    </ul>\n                </p>\n                <p>We hope you enjoy using Blesta! For help, please see the <a href=\"http://docs.blesta.com\">documentation</a> or visit us on our <a href=\"http://www.blesta.com/forums/\">forums</a>.</p>\n            </blockquote>\n        </div>\n    </div>\n\n    <div class=\"col-md-4 col-sm-6 portal-box\">\n        <a href=\"{client_url}login/\">\n            <div class=\"card\">\n                <div class=\"card-body\">\n                    <i class=\"fas fa-cogs fa-4x\"></i>\n                    <h4>My Account</h4>\n                    <p>Have an account with us? Log in here to manage your account.</p>\n                </div>\n            </div>\n        </a>\n    </div>\n    {% if plugins.support_manager.enabled %}<div class=\"col-md-4 col-sm-6 portal-box\">\n        <a href=\"{client_url}plugin/support_manager/client_tickets/add/\">\n            <div class=\"card\">\n                <div class=\"card-body\">\n                    <i class=\"fas fa-ticket-alt fa-4x\"></i>\n                    <h4>Support</h4>\n                    <p>Looking for help? You can open a trouble ticket here.</p>\n                </div>\n            </div>\n        </a>\n    </div>\n	<div class=\"col-md-4 col-sm-6 portal-box\">\n        <a href=\"{client_url}plugin/support_manager/knowledgebase/\">\n            <div class=\"card\">\n                <div class=\"card-body\">\n                    <i class=\"fas fa-info-circle fa-4x\"></i>\n                    <h4>Knowledge Base</h4>\n                    <p>Have a question? Search the knowledge base for an answer.</p>\n                </div>\n            </div>\n        </a>\n    </div>{% endif %}\n    {% if plugins.order.enabled %}<div class=\"col-md-4 col-sm-6 portal-box\">\n        <a href=\"{blesta_url}order/\">\n            <div class=\"card\">\n                <div class=\"card-body\">\n                    <i class=\"fas fa-shopping-cart fa-4x\"></i>\n                    <h4>Order</h4>\n                    <p>Visit the order form to sign up and purchase new products and services.</p>\n                </div>\n            </div>\n        </a>\n    </div>{% endif %}\n    {% if plugins.download_manager.enabled %}<div class=\"col-md-4 col-sm-6 portal-box\">\n        <a href=\"{client_url}plugin/download_manager/\">\n            <div class=\"card\">\n                <div class=\"card-body\">\n                    <i class=\"fas fa-download fa-4x\"></i>\n                    <h4>Download</h4>\n                    <p>You may need to be logged in to access certain downloads here.</p>\n                </div>\n            </div>\n        </a>\n    </div>{% endif %}');

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(64) NOT NULL,
  `hostname` varchar(255) NOT NULL,
  `address` text DEFAULT NULL,
  `phone` varchar(64) DEFAULT NULL,
  `fax` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`, `hostname`, `address`, `phone`, `fax`) VALUES
(1, 'My Company', 'blestadev1.hexonet.net', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `company_settings`
--

CREATE TABLE `company_settings` (
  `key` varchar(128) NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `value` text NOT NULL,
  `encrypted` tinyint(1) NOT NULL DEFAULT 0,
  `inherit` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `company_settings`
--

INSERT INTO `company_settings` (`key`, `company_id`, `value`, `encrypted`, `inherit`) VALUES
('admin_logo_height', 1, '32', 0, 1),
('apply_inv_late_fees', 1, '7', 0, 1),
('auto_apply_credits', 1, 'true', 0, 1),
('auto_paid_pending_services', 1, 'true', 0, 1),
('autodebit', 1, 'true', 0, 1),
('autodebit_attempts', 1, '1', 0, 1),
('autodebit_days_before_due', 1, '1', 0, 1),
('autosuspend', 1, 'true', 0, 1),
('calendar_begins', 1, 'sunday', 0, 1),
('cancel_service_changes_days', 1, '7', 0, 1),
('cancelation_fee_tax', 1, 'false', 0, 1),
('captcha_enabled_forms', 1, 'a:0:{}', 0, 1),
('cascade_tax', 1, 'false', 0, 1),
('client_change_service_package', 1, 'false', 0, 1),
('client_change_service_term', 1, 'false', 0, 1),
('client_create_addons', 1, 'true', 0, 1),
('client_logo_height', 1, '32', 0, 1),
('client_prorate_credits', 1, 'false', 0, 1),
('client_set_currency', 1, 'false', 0, 1),
('client_set_invoice', 1, 'true', 0, 1),
('client_set_lang', 1, 'true', 0, 1),
('client_view_dir', 1, 'bootstrap', 0, 1),
('clients_cancel_services', 1, 'false', 0, 1),
('clients_format', 1, '{num}', 0, 1),
('clients_increment', 1, '1', 0, 1),
('clients_pad_size', 1, '0', 0, 1),
('clients_pad_str', 1, '0', 0, 1),
('clients_renew_services', 1, 'true', 0, 1),
('clients_start', 1, '1500', 0, 1),
('country', 1, 'US', 0, 1),
('date_format', 1, 'M d, Y', 0, 1),
('datetime_format', 1, 'M d, Y g:i:s A', 0, 1),
('default_currency', 1, 'USD', 0, 1),
('delivery_methods', 1, 'YToxOntpOjA7czo1OiJlbWFpbCI7fQ==', 0, 1),
('domains_dns_management_option_group', 1, '2', 0, 1),
('domains_email_forwarding_option_group', 1, '1', 0, 1),
('domains_expiration_notice_days_after', 1, '1', 0, 1),
('domains_first_reminder_days_before', 1, '35', 0, 1),
('domains_id_protection_option_group', 1, '3', 0, 1),
('domains_package_group', 1, '1', 0, 1),
('domains_renewal_days_before_expiration', 1, '30', 0, 1),
('domains_second_reminder_days_before', 1, '10', 0, 1),
('domains_tld_packages', 1, 'a:3:{s:4:\".com\";s:1:\"1\";s:4:\".net\";s:1:\"2\";s:4:\".org\";s:1:\"3\";}', 0, 1),
('email_verification', 1, 'false', 0, 1),
('enable_eu_vat', 1, 'false', 0, 1),
('enable_tax', 1, 'false', 0, 1),
('exchange_rates_auto_update', 1, 'false', 0, 1),
('exchange_rates_padding', 1, '3', 0, 1),
('exchange_rates_processor', 1, 'x_rates', 0, 1),
('html_email', 1, 'true', 0, 1),
('interfax_password', 1, '', 1, 1),
('interfax_username', 1, '', 1, 1),
('inv_append_descriptions', 1, 'false', 0, 1),
('inv_background', 1, '', 0, 1),
('inv_cache', 1, 'none', 0, 1),
('inv_cache_compress', 1, 'false', 0, 1),
('inv_days_before_renewal', 1, '5', 0, 1),
('inv_display_companyinfo', 1, 'true', 0, 1),
('inv_display_due_date_draft', 1, 'true', 0, 1),
('inv_display_due_date_inv', 1, 'true', 0, 1),
('inv_display_due_date_proforma', 1, 'true', 0, 1),
('inv_display_logo', 1, 'true', 0, 1),
('inv_display_paid_watermark', 1, 'true', 0, 1),
('inv_display_payments', 1, 'true', 0, 1),
('inv_draft_format', 1, 'DRAFT-{num}', 0, 1),
('inv_format', 1, '{num}', 0, 1),
('inv_increment', 1, '1', 0, 1),
('inv_lines_verbose_option_dates', 1, 'false', 0, 1),
('inv_logo', 1, '', 0, 1),
('inv_method', 1, 'email', 0, 1),
('inv_mimetype', 1, 'application/pdf', 0, 1),
('inv_pad_size', 1, '0', 0, 1),
('inv_pad_str', 1, '0', 0, 1),
('inv_paper_size', 1, 'letter', 0, 1),
('inv_proforma_format', 1, 'PROFORMA-{num}', 0, 1),
('inv_proforma_start', 1, '1', 0, 1),
('inv_start', 1, '1', 0, 1),
('inv_suspended_services', 1, 'true', 0, 1),
('inv_template', 1, 'default_invoice', 0, 1),
('inv_terms_en_us', 1, '', 0, 1),
('inv_type', 1, 'standard', 0, 1),
('language', 1, 'en_us', 0, 1),
('late_fee_total_amount', 1, 'true', 0, 1),
('late_fees', 1, '', 0, 1),
('layout_cards_order', 1, 'YTowOnt9', 0, 1),
('logo_admin', 1, '', 0, 1),
('logo_client', 1, '', 0, 1),
('mail_delivery', 1, 'php', 0, 1),
('messenger_configuration', 1, 'YTowOnt9', 0, 1),
('multi_currency_pricing', 1, 'package', 0, 1),
('notice_pending_autodebit', 1, '1', 0, 1),
('notice1', 1, '-1', 0, 1),
('notice2', 1, '3', 0, 1),
('notice3', 1, '7', 0, 1),
('packages_format', 1, '{num}', 0, 1),
('packages_increment', 1, '1', 0, 1),
('packages_pad_size', 1, '0', 0, 1),
('packages_pad_str', 1, '0', 0, 1),
('packages_start', 1, '1', 0, 1),
('payments_allowed_ach', 1, 'true', 0, 1),
('payments_allowed_cc', 1, 'true', 0, 1),
('postalmethods_apikey', 1, '', 1, 1),
('postalmethods_testmode', 1, 'true', 0, 1),
('prevent_unverified_payments', 1, 'false', 0, 1),
('private_key', 1, 'C6Wo7AOn3IYRb9PmVemgG3OhNExPZCjH70ukeQ5e4PccB0Y89NFQ5pmQCm9GjJ60+lrNiRhI6ZjcVY322M3KU1lvRrJAznItbBRH6jQkSP7RZhNBR+r93XiJtfG7P6N0G20YBEIqJ32N+PzcXBgB5QtCfj+DBDmPQ1AJivuMYaAJigCBm2PxpMwDIrEWKTA4hDsytHvNrhHPiPonqooSnowvmceHEic35gdQCCXa/AeDajxD44K+1gzQZyZZ/1Yky+37kZa3Lqa4m9YkDb4lNzq135q4mAkUfSrIhPfmJWbzS4yvZV1I9jIpkw2zZwEOBxOsQmN1OsgWag2XsJFc99eJzc2VzfUcJT7DscD7gws/cDs6NlgH6qFpjNBfShsBYgctWt/UOnK6d8EvArZn5djr56abpPcBPef49DTRSTiTi93ABSd4sqN34Q6A49+H3d3Q15KeGFyskvF1yHmULonCqXIMB4w8NdMe8mOHHTRNW2aeCYbsrP3b2ZHx9hkIieHWjWYpogUPYlU4lOMCZuQxNZD5d0+J7q2McnOEYYC9pnglFGxpBvu2X1hTkmVIAz5GHMRPEfDs9hDrd054cx1yVGfzBnlAu/c14rKohW8vlVmaVzC6tBhCt4G4ooeO2JaU+SUm7CtyLP7l9sw2VXfM3pmqp5ZDr5bQ56/ai7dy9s/AbsrfLsIQvblafr60RzP5jgy76KV9Y/PhCH84OvKYBdLqUBXFz33U3T468sMwlAMfmlNjLm60aukrHkJG8KG24RWBEztcqXjflSEdDAMUHeq5zJPArTtq4+u/b/VjxmgGU4OegHDOEy3UezIuRSSh4V+P4UNUzTELyaG3lHcUt4nciJM9XtreGFZ8z0kE+/1b9B1JCTXM/ztjjjv6A3Gs3spa4/5Wj3Bb5qoC8ztVUONtM7ziAAgXI8tzsSHL68oFdpa0+uCGsa0/dFLmrNlgp3aLsClUZ19YQZK5s+aI9j6sSPR0X8tnQbmpOl3ZLQgUNDci8oB86ko6BI6XCp8lea2N6/KK+NIRKv3uZk87HhAjf14QqqRe9n/KB2PMn6F61YeCQjzhuChvu150/nl3FDjscH9yAidyniavggOP5RcHpUy0CvHtDG788VP9YNfeBxArUt3EnBhGyarbbXqnYSizidmqUXwDBGBV+b0CKc5+wusGbUIo3bzfwaTQy9rtDjZhvh5r1uQ3EpRVGyi9zRhlmGsXus8cvj1De9j/90Fvb6kyQZpgewifpSxIxJuU6JVcfzg5/br4PTzxjqebkOiuFPBnTN6P/grVVxA32Z2+L3jWpDuulka9fZXTOVDNWXTvOj67/QHCytK0wp6RJn4SRq09JgY7MGSAXzFwVRYh/9DlSghENERyEPJG13wBbEOMHUDYVD2kqyizvqyHAmOtqJva05+O5LDGYMHlnORmEUHBroT9XH5N/qMfyC2G/PYqS/x08Qz9Ckg/ddUokxpwgdfjoCOTGRR+54JzicrdSPwRl3S+5S9cQ449ZiWje6VSPF9FJ2tERYSp3aHdDd47mZlcOx8Y1zPm3kr7TrRyXSvzRTQufp/S4/kwiGFdRh4+maSAcWYYqJiDiSdZSthN8WXcox9BrGbjbljMgLc5LiZJKDSH+Hf6hfFfi/jLlJhwcsHG3HfI0IjDKNQq4zV2BTxSC7pMxa94aNyWauP4afSgBB1Tvi1sM8F0KJkO+MgXeGUBkkpSn+HbvHDBoiganqRgc6UvyEKvMLdI4HNtZgB7VqvFq83dOOAPS9WcqzhE/QT4YLrv6KdmxLmAyX/5Mu/gnhcHSf5QpSlHvwSx2GgDql8X4Ex1mkN8rFXBMJavJLj3XtDfRznRkmPX5P/inIkVEbmnMFMBIMPy851CO+oxUf6NKcaK3Rx+OQCtftjYPDHPBQQvmaS+gvVFTqrbiVbn3ThH58goXrrN4evHq3hG8w4NlctU2NMERFFm7DN6dB8y3pNAtU1ZLf79QHqbz3v9vFC+PNHMz6uK4iNDNqZgr28ogDGS5gct59KmwkqSR917cHXkjzzzFMgp/TaBLoV8WRKRmUBjIToUJQirMs2b4kZmZVz2hh6aDWVoZxj7aTyT3dLi6sNmQNanaBgNnhVWQLCN/4S5qjsPkFgnrQvZTxN6LuLVk6wkVpELfL9TGxd73oVrA22Fbuu1yQ9Bf2HUNu+Yelr5plAR0QvXKMSOSYn1t9Ph7/Cr6S6WFtZW0gQNIN3IIav6vhx4kW257oa/YkJKNRq+d9CBoZTaXIL1iULDK+impEVfj8X2m+eFuf3FkZ3TUVGU7sA4p6Ifo8jgecUZvXF/qkAqIIhjjKoWhPd2VcbdVxnj5FUsuMZG4M/JcaGlSXb19eoO8e0YIywF/GIA0EMckSfY8ImS3KZlNnvdVTGsi7y1vUIQX0PRPXrY75kdzyGAHw9P5m9oy2Q1pcJNrYhAPxbPvzyUIBkG+eCLI+WxsjzpiHDpft8ITWfi5zwXolrBl2tfZkOFNXonEQvMX3xfiVXaltBrmN4vWh2PsiCZTNhcNzTEA1IwCkV5zfd5ALlUhimp0YHkuPZDTCIscVjs+mUvHWKVhUx7jahWSJnwnQ96q2YpwsOHRWls0xw8oe6oYWfaxJEhtsnu3ysEthKU8PW6iX8WiOFaQNE0Q5KmxLALFwJuAHq8JyRqYOgcPj5Hd01Y3BVqwmkgBzJgEkGH2LiumuZ2AqEYsIIT+BP/7dRppMbkCKF3t16u/PGGebVRiOX8Xs2F3wOJdO7ZVhgPyc/oqW0MycojFSMerZgLRvk+U4IorsCBhT/jXpFBEdblDw0tOoeUf725Xhr7LfLsXE9f55oFLBL2EzvJxzo9BBPh2pjiytU+1seFLwl97gJpSgxN/e7YtFovAoMkJIddVpYZwbMFwT5c/oj2bb9/OjqKI0/+m+uOsmuouMm6lNMqg9PuJnefEg7Xu0PO+QzF5SmX6VgEXuB/UugyZZjJ5d6HtmbfAgZh8s8Sr+X/mvDOCI2xG1RyEPJgl5o2tWvmbVeZnFqmoku8WWCRhL1onDNPklKNgdQX7RUywXp3HBq1ENy6ciJvctBceupsTF+D0FWxVID15X0+aQ6Z9Fcp3G7E9DoiFiJgMIQSiBng0WNBiiBDncuR9JiJF3/nt3SXJTza0iVEeuJ44SkSKtmnQEyIrdqeuqiUh0xhERlzHIBL8RxE6ZgpbbtJ5nus1/B8Gcl3ISTbfcJ+NTkiyZ2ZK45cCjhoHAuTX2DweRplchfQSMzaVovEkXbrEjH7Cxa4r4LKxSSqVbmBFmhZ6jwcMHMOjRtfhkLtiagIc7s4cUGn', 0, 1),
('private_key_passphrase', 1, '', 0, 1),
('process_paid_service_changes', 1, 'false', 0, 1),
('public_key', 1, '-----BEGIN PUBLIC KEY-----\r\nMIIBojANBgkqhkiG9w0BAQEFAAOCAY8AMIIBigKCAYEAvcqi5mGGpMqnJw0/RRiB\r\n0d0NuSfoND2DTNLUGFrXdkMc3kQUatFpJOFE6GVej1Oy5lH+ldFjG7sVUy6LWAbd\r\nbOS1KXhe/vbt7PQgjd3XLO1x2B6NOplSbJZdKBgASiFy/4z0Zde+R+i9oe062gev\r\nvus7HAWKmU90KZr9yPTVe96Jea16QvzxjfR4SljF8jOQTCYETS6pBXSPMU+82Hvn\r\nhV+TcIGiUhMamCkKm31p5ikajrfX/MinIjN4NQ4V9coZgn9DDPgKHSBEiMeFZ5Qe\r\nRscR4VJ0y4ahjdXJfShfXCC2WQmBg1mvaDDKphqkRE/0WpOWhVUFKIyh2bvLFQc6\r\nvmyDgvIsayg4wROesEYjPYzskvTqVA+oJDFaRjorRii0R/nDCbQ8YODzDxL3zI0J\r\nkgDdG5egk0npo3w8VeZOsrI/v5CVK5+JQS24WeCIp90H3uWP/tUTQgd7qjeIKIN1\r\nmUl186iymGhlmilPCrGsD9YpcIKkj9HwXeQMo1DdPG0/AgMBAAE=\r\n-----END PUBLIC KEY-----', 0, 1),
('receive_email_marketing', 1, 'false', 0, 1),
('required_contact_fields', 1, 'YTowOnt9', 0, 1),
('send_cancellation_notice', 1, 'false', 0, 1),
('send_payment_notices', 1, 'true', 0, 1),
('services_format', 1, '{num}', 0, 1),
('services_increment', 1, '1', 0, 1),
('services_pad_size', 1, '0', 0, 1),
('services_pad_str', 1, '0', 0, 1),
('services_start', 1, '1', 0, 1),
('setup_fee_tax', 1, 'false', 0, 1),
('show_client_tax_id', 1, 'true', 0, 1),
('show_currency_code', 1, 'false', 0, 1),
('show_receive_email_marketing', 1, 'true', 0, 1),
('shown_contact_fields', 1, 'YToxMzp7aTowO3M6MTA6ImZpcnN0X25hbWUiO2k6MTtzOjk6Imxhc3RfbmFtZSI7aToyO3M6NzoiY29tcGFueSI7aTozO3M6NToidGl0bGUiO2k6NDtzOjg6ImFkZHJlc3MxIjtpOjU7czo4OiJhZGRyZXNzMiI7aTo2O3M6NDoiY2l0eSI7aTo3O3M6NzoiY291bnRyeSI7aTo4O3M6NToic3RhdGUiO2k6OTtzOjM6InppcCI7aToxMDtzOjU6ImVtYWlsIjtpOjExO3M6MzoiZmF4IjtpOjEyO3M6NToicGhvbmUiO30=', 0, 1),
('smtp_host', 1, '', 0, 1),
('smtp_password', 1, '', 1, 1),
('smtp_port', 1, '465', 0, 1),
('smtp_security', 1, 'ssl', 0, 1),
('smtp_user', 1, '', 1, 1),
('suspend_services_days_after_due', 1, '7', 0, 1),
('synchronize_addons', 1, 'true', 0, 1),
('tax_exempt', 1, 'false', 0, 1),
('tax_exempt_eu_vat', 1, 'false', 0, 1),
('tax_home_eu_vat', 1, '', 0, 1),
('tax_id', 1, '', 0, 0),
('theme_admin', 1, '25', 0, 1),
('theme_client', 1, '26', 0, 1),
('timezone', 1, 'Europe/Berlin', 0, 1),
('void_inv_canceled_service_days', 1, '0', 0, 1),
('void_invoice_canceled_service', 1, 'true', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `contact_type` enum('primary','billing','other') NOT NULL DEFAULT 'primary',
  `contact_type_id` int(10) UNSIGNED DEFAULT NULL,
  `first_name` varchar(128) NOT NULL,
  `last_name` varchar(128) NOT NULL,
  `title` varchar(64) DEFAULT NULL,
  `company` varchar(128) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(3) DEFAULT NULL,
  `zip` varchar(128) DEFAULT NULL,
  `country` varchar(2) NOT NULL DEFAULT 'US',
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_numbers`
--

CREATE TABLE `contact_numbers` (
  `id` int(10) UNSIGNED NOT NULL,
  `contact_id` int(10) UNSIGNED NOT NULL,
  `number` varchar(64) NOT NULL,
  `type` enum('phone','fax') NOT NULL DEFAULT 'phone',
  `location` enum('home','work','mobile') NOT NULL DEFAULT 'home'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_permissions`
--

CREATE TABLE `contact_permissions` (
  `contact_id` int(10) NOT NULL,
  `area` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_types`
--

CREATE TABLE `contact_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `is_lang` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `alpha2` char(2) NOT NULL,
  `alpha3` char(3) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `alt_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`alpha2`, `alpha3`, `name`, `alt_name`) VALUES
('AD', 'AND', 'Andorra', NULL),
('AE', 'ARE', 'United Arab Emirates', 'الإمارات العربية المتحدة'),
('AF', 'AFG', 'Afghanistan', 'افغانستان'),
('AG', 'ATG', 'Antigua and Barbuda', NULL),
('AI', 'AIA', 'Anguilla', NULL),
('AL', 'ALB', 'Albania', 'Shqipëria'),
('AM', 'ARM', 'Armenia', 'Հայաստան'),
('AN', 'ANT', 'Netherlands Antilles', 'Nederland'),
('AO', 'AGO', 'Angola', NULL),
('AQ', 'ATA', 'Antarctica', NULL),
('AR', 'ARG', 'Argentina', NULL),
('AS', 'ASM', 'American Samoa', 'Sāmoa'),
('AT', 'AUT', 'Austria', 'Österreich'),
('AU', 'AUS', 'Australia', NULL),
('AW', 'ABW', 'Aruba', NULL),
('AX', 'ALA', 'Åland Islands', NULL),
('AZ', 'AZE', 'Azerbaijan', 'Azərbaycan'),
('BA', 'BIH', 'Bosnia and Herzegovina', 'Bosna i Hercegovina'),
('BB', 'BRB', 'Barbados', NULL),
('BD', 'BGD', 'Bangladesh', 'বাংলাদেশ'),
('BE', 'BEL', 'Belgium', 'België'),
('BF', 'BFA', 'Burkina Faso', NULL),
('BG', 'BGR', 'Bulgaria', 'България'),
('BH', 'BHR', 'Bahrain', 'البحرين'),
('BI', 'BDI', 'Burundi', 'Uburundi'),
('BJ', 'BEN', 'Benin', 'Bénin'),
('BL', 'BLM', 'Saint Barthélemy', NULL),
('BM', 'BMU', 'Bermuda', NULL),
('BN', 'BRN', 'Brunei Darussalam', NULL),
('BO', 'BOL', 'Bolivia, Plurinational State of', 'Wuliwya'),
('BR', 'BRA', 'Brazil', 'Brasil'),
('BS', 'BHS', 'Bahamas', NULL),
('BT', 'BTN', 'Bhutan', 'འབྲུག་ཡུལ།'),
('BV', 'BVT', 'Bouvet Island', NULL),
('BW', 'BWA', 'Botswana', NULL),
('BY', 'BLR', 'Belarus', 'Беларусь'),
('BZ', 'BLZ', 'Belize', NULL),
('CA', 'CAN', 'Canada', NULL),
('CC', 'CCK', 'Cocos (Keeling) Islands', NULL),
('CD', 'COD', 'Congo, the Democratic Republic of the', 'Congo, République Démocratique'),
('CF', 'CAF', 'Central African Republic', 'Centrafrique'),
('CG', 'COG', 'Congo', 'Congo, République'),
('CH', 'CHE', 'Switzerland', 'Schweiz'),
('CI', 'CIV', 'Côte D\'Ivoire', NULL),
('CK', 'COK', 'Cook Islands', NULL),
('CL', 'CHL', 'Chile', NULL),
('CM', 'CMR', 'Cameroon', 'Cameroun'),
('CN', 'CHN', 'China', '中國/中国'),
('CO', 'COL', 'Colombia', NULL),
('CR', 'CRI', 'Costa Rica', NULL),
('CU', 'CUB', 'Cuba', NULL),
('CV', 'CPV', 'Cape Verde', 'Cabo Verde'),
('CX', 'CXR', 'Christmas Island', NULL),
('CY', 'CYP', 'Cyprus', 'Κύπρος'),
('CZ', 'CZE', 'Czech Republic', NULL),
('DE', 'DEU', 'Germany', 'Deutschland'),
('DJ', 'DJI', 'Djibouti', 'جيبوتي'),
('DK', 'DNK', 'Denmark', 'Danmark'),
('DM', 'DMA', 'Dominica', NULL),
('DO', 'DOM', 'Dominican Republic', 'República Dominicana'),
('DZ', 'DZA', 'Algeria', 'الجزائر'),
('EC', 'ECU', 'Ecuador', NULL),
('EE', 'EST', 'Estonia', 'Eesti'),
('EG', 'EGY', 'Egypt', 'مصر'),
('EH', 'ESH', 'Western Sahara', 'الصحراء الغربية'),
('ER', 'ERI', 'Eritrea', 'ኤርትራ'),
('ES', 'ESP', 'Spain', 'España'),
('ET', 'ETH', 'Ethiopia', 'ኢትዮጵያ'),
('FI', 'FIN', 'Finland', 'Suomi'),
('FJ', 'FJI', 'Fiji', 'Viti'),
('FK', 'FLK', 'Falkland Islands (Malvinas)', NULL),
('FM', 'FSM', 'Micronesia, Federated States of', NULL),
('FO', 'FRO', 'Faroe Islands', NULL),
('FR', 'FRA', 'France', NULL),
('GA', 'GAB', 'Gabon', NULL),
('GB', 'GBR', 'United Kingdom', NULL),
('GD', 'GRD', 'Grenada', NULL),
('GE', 'GEO', 'Georgia', 'საქართველო'),
('GF', 'GUF', 'French Guiana', NULL),
('GG', 'GGY', 'Guernsey', NULL),
('GH', 'GHA', 'Ghana', NULL),
('GI', 'GIB', 'Gibraltar', NULL),
('GL', 'GRL', 'Greenland', NULL),
('GM', 'GMB', 'Gambia', NULL),
('GN', 'GIN', 'Guinea', 'Guinée'),
('GP', 'GLP', 'Guadeloupe', NULL),
('GQ', 'GNQ', 'Equatorial Guinea', 'Guinée'),
('GR', 'GRC', 'Greece', 'Ελλάδα'),
('GS', 'SGS', 'South Georgia and the South Sandwich Islands', 'საქართველო'),
('GT', 'GTM', 'Guatemala', NULL),
('GU', 'GUM', 'Guam', NULL),
('GW', 'GNB', 'Guinea-Bissau', 'Guiné-Bissau'),
('GY', 'GUY', 'Guyana', NULL),
('HK', 'HKG', 'Hong Kong', NULL),
('HM', 'HMD', 'Heard Island and Mcdonald Islands', NULL),
('HN', 'HND', 'Honduras', NULL),
('HR', 'HRV', 'Croatia', 'Hrvatska'),
('HT', 'HTI', 'Haiti', 'Haïti'),
('HU', 'HUN', 'Hungary', 'Magyarország'),
('ID', 'IDN', 'Indonesia', NULL),
('IE', 'IRL', 'Ireland', 'Éire'),
('IL', 'ISR', 'Israel', 'ישראל'),
('IM', 'IMN', 'Isle of Man', NULL),
('IN', 'IND', 'India', 'भारत'),
('IO', 'IOT', 'British Indian Ocean Territory', 'भारत'),
('IQ', 'IRQ', 'Iraq', 'العراق'),
('IR', 'IRN', 'Iran, Islamic Republic of', 'ایران'),
('IS', 'ISL', 'Iceland', 'Ísland'),
('IT', 'ITA', 'Italy', 'Italia'),
('JE', 'JEY', 'Jersey', NULL),
('JM', 'JAM', 'Jamaica', NULL),
('JO', 'JOR', 'Jordan', 'الأردن'),
('JP', 'JPN', 'Japan', '日本'),
('KE', 'KEN', 'Kenya', NULL),
('KG', 'KGZ', 'Kyrgyzstan', 'Кыргызстан'),
('KH', 'KHM', 'Cambodia', 'កម្ពុជា'),
('KI', 'KIR', 'Kiribati', NULL),
('KM', 'COM', 'Comoros', 'Komori'),
('KN', 'KNA', 'Saint Kitts and Nevis', NULL),
('KP', 'PRK', 'Korea, Democratic People\'s Republic of', '조선'),
('KR', 'KOR', 'Korea, Republic of', '한국'),
('KW', 'KWT', 'Kuwait', 'الكويت'),
('KY', 'CYM', 'Cayman Islands', NULL),
('KZ', 'KAZ', 'Kazakhstan', 'Қазақстан'),
('LA', 'LAO', 'Lao People\'s Democratic Republic', NULL),
('LB', 'LBN', 'Lebanon', 'لبنان'),
('LC', 'LCA', 'Saint Lucia', NULL),
('LI', 'LIE', 'Liechtenstein', NULL),
('LK', 'LKA', 'Sri Lanka', 'ශ්‍රී ලංකාව'),
('LR', 'LBR', 'Liberia', NULL),
('LS', 'LSO', 'Lesotho', NULL),
('LT', 'LTU', 'Lithuania', 'Lietuva'),
('LU', 'LUX', 'Luxembourg', 'Luxemburg'),
('LV', 'LVA', 'Latvia', 'Latvija'),
('LY', 'LBY', 'Libyan Arab Jamahiriya', 'ليبيا'),
('MA', 'MAR', 'Morocco', 'المغرب'),
('MC', 'MCO', 'Monaco', NULL),
('MD', 'MDA', 'Moldova, Republic of', NULL),
('ME', 'MNE', 'Montenegro', 'Црна Гора'),
('MF', 'MAF', 'Saint Martin', NULL),
('MG', 'MDG', 'Madagascar', 'Madagasikara'),
('MH', 'MHL', 'Marshall Islands', 'Aelōn̄ in M̧ajeļ'),
('MK', 'MKD', 'Macedonia, the Former Yugoslav Republic of', 'Македонија'),
('ML', 'MLI', 'Mali', NULL),
('MM', 'MMR', 'Myanmar', NULL),
('MN', 'MNG', 'Mongolia', 'Монгол улс'),
('MO', 'MAC', 'Macao', NULL),
('MP', 'MNP', 'Northern Mariana Islands', NULL),
('MQ', 'MTQ', 'Martinique', NULL),
('MR', 'MRT', 'Mauritania', 'موريتانيا'),
('MS', 'MSR', 'Montserrat', NULL),
('MT', 'MLT', 'Malta', NULL),
('MU', 'MUS', 'Mauritius', 'Maurice'),
('MV', 'MDV', 'Maldives', 'ދިވެހިރާއްޖެ'),
('MW', 'MWI', 'Malawi', 'Malaŵi'),
('MX', 'MEX', 'Mexico', 'México'),
('MY', 'MYS', 'Malaysia', NULL),
('MZ', 'MOZ', 'Mozambique', 'Moçambique'),
('NA', 'NAM', 'Namibia', NULL),
('NC', 'NCL', 'New Caledonia', NULL),
('NE', 'NER', 'Niger', NULL),
('NF', 'NFK', 'Norfolk Island', NULL),
('NG', 'NGA', 'Nigeria', NULL),
('NI', 'NIC', 'Nicaragua', NULL),
('NL', 'NLD', 'Netherlands', 'Nederland'),
('NO', 'NOR', 'Norway', 'Norge / Noreg'),
('NP', 'NPL', 'Nepal', 'नेपाल'),
('NR', 'NRU', 'Nauru', 'Naoero'),
('NU', 'NIU', 'Niue', NULL),
('NZ', 'NZL', 'New Zealand', 'Aotearoa'),
('OM', 'OMN', 'Oman', 'عمان'),
('PA', 'PAN', 'Panama', 'Panamá'),
('PE', 'PER', 'Peru', 'Perú'),
('PF', 'PYF', 'French Polynesia', NULL),
('PG', 'PNG', 'Papua New Guinea', 'Papua Niugini'),
('PH', 'PHL', 'Philippines', 'Pilipinas'),
('PK', 'PAK', 'Pakistan', 'پاکستان'),
('PL', 'POL', 'Poland', 'Polska'),
('PM', 'SPM', 'Saint Pierre and Miquelon', NULL),
('PN', 'PCN', 'Pitcairn', NULL),
('PR', 'PRI', 'Puerto Rico', NULL),
('PS', 'PSE', 'Palestinian Territory, Occupied', NULL),
('PT', 'PRT', 'Portugal', NULL),
('PW', 'PLW', 'Palau', 'Belau'),
('PY', 'PRY', 'Paraguay', 'Paraguái'),
('QA', 'QAT', 'Qatar', 'قطر'),
('RE', 'REU', 'Réunion', NULL),
('RO', 'ROM', 'Romania', 'România'),
('RS', 'SRB', 'Serbia', 'Србија'),
('RU', 'RUS', 'Russian Federation', 'Россия'),
('RW', 'RWA', 'Rwanda', NULL),
('SA', 'SAU', 'Saudi Arabia', 'العربية السعودية'),
('SB', 'SLB', 'Solomon Islands', NULL),
('SC', 'SYC', 'Seychelles', 'Sesel'),
('SD', 'SDN', 'Sudan', 'السودان'),
('SE', 'SWE', 'Sweden', 'Sverige'),
('SG', 'SGP', 'Singapore', '新加坡'),
('SH', 'SHN', 'Saint Helena, Ascension and Tristan Da Cunha', NULL),
('SI', 'SVN', 'Slovenia', 'Slovenija'),
('SJ', 'SJM', 'Svalbard and Jan Mayen', NULL),
('SK', 'SVK', 'Slovakia', 'Slovensko'),
('SL', 'SLE', 'Sierra Leone', NULL),
('SM', 'SMR', 'San Marino', NULL),
('SN', 'SEN', 'Senegal', 'Sénégal'),
('SO', 'SOM', 'Somalia', 'Soomaaliya'),
('SR', 'SUR', 'Suriname', NULL),
('ST', 'STP', 'Sao Tome and Principe', 'São Tomé e Príncipe'),
('SV', 'SLV', 'El Salvador', NULL),
('SY', 'SYR', 'Syrian Arab Republic', 'سورية'),
('SZ', 'SWZ', 'Swaziland', 'eSwatini'),
('TC', 'TCA', 'Turks and Caicos Islands', NULL),
('TD', 'TCD', 'Chad', 'Tchad'),
('TF', 'ATF', 'French Southern Territories', NULL),
('TG', 'TGO', 'Togo', NULL),
('TH', 'THA', 'Thailand', 'ประเทศไทย'),
('TJ', 'TJK', 'Tajikistan', 'Тоҷикистон'),
('TK', 'TKL', 'Tokelau', NULL),
('TL', 'TLS', 'Timor-Leste', NULL),
('TM', 'TKM', 'Turkmenistan', 'Türkmenistan'),
('TN', 'TUN', 'Tunisia', 'تونس'),
('TO', 'TON', 'Tonga', NULL),
('TR', 'TUR', 'Turkey', 'Türkiye'),
('TT', 'TTO', 'Trinidad and Tobago', NULL),
('TV', 'TUV', 'Tuvalu', NULL),
('TW', 'TWN', 'Taiwan, Province of China', '臺灣/台湾'),
('TZ', 'TZA', 'Tanzania, United Republic of', NULL),
('UA', 'UKR', 'Ukraine', 'Україна'),
('UG', 'UGA', 'Uganda', NULL),
('UM', 'UMI', 'United States Minor Outlying Islands', NULL),
('US', 'USA', 'United States', NULL),
('UY', 'URY', 'Uruguay', NULL),
('UZ', 'UZB', 'Uzbekistan', 'Oʻzbekiston'),
('VA', 'VAT', 'Holy See (Vatican City State)', 'Vaticanum'),
('VC', 'VCT', 'Saint Vincent and the Grenadines', NULL),
('VE', 'VEN', 'Venezuela, Bolivarian Republic of', NULL),
('VG', 'VGB', 'Virgin Islands, British', NULL),
('VI', 'VIR', 'Virgin Islands, U.S.', NULL),
('VN', 'VNM', 'Viet Nam', 'Việt Nam'),
('VU', 'VUT', 'Vanuatu', NULL),
('WF', 'WLF', 'Wallis and Futuna', NULL),
('WS', 'WSM', 'Samoa', 'Sāmoa'),
('YE', 'YEM', 'Yemen', 'اليمن'),
('YT', 'MYT', 'Mayotte', NULL),
('ZA', 'ZAF', 'South Africa', 'Suid-Afrika'),
('ZM', 'ZMB', 'Zambia', NULL),
('ZW', 'ZWE', 'Zimbabwe', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(64) NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `used_qty` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `max_qty` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `recurring` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `limit_recurring` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `apply_package_options` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `internal_use_only` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_amounts`
--

CREATE TABLE `coupon_amounts` (
  `coupon_id` int(10) UNSIGNED NOT NULL,
  `currency` char(3) NOT NULL DEFAULT 'USD',
  `amount` decimal(19,4) NOT NULL DEFAULT 0.0000,
  `type` enum('amount','percent') NOT NULL DEFAULT 'percent'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_packages`
--

CREATE TABLE `coupon_packages` (
  `coupon_id` int(10) UNSIGNED NOT NULL,
  `package_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_terms`
--

CREATE TABLE `coupon_terms` (
  `id` int(10) UNSIGNED NOT NULL,
  `coupon_id` int(10) UNSIGNED NOT NULL,
  `term` smallint(5) UNSIGNED NOT NULL,
  `period` enum('day','week','month','year','onetime') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cron_tasks`
--

CREATE TABLE `cron_tasks` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(64) NOT NULL,
  `task_type` enum('module','plugin','system') NOT NULL DEFAULT 'system',
  `dir` varchar(64) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `is_lang` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `type` enum('time','interval') NOT NULL DEFAULT 'interval'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cron_tasks`
--

INSERT INTO `cron_tasks` (`id`, `key`, `task_type`, `dir`, `name`, `description`, `is_lang`, `type`) VALUES
(1, 'create_invoice', 'system', NULL, 'CronTasks.crontask.name.create_invoice', 'CronTasks.crontask.description.create_invoice', 1, 'time'),
(2, 'autodebit', 'system', NULL, 'CronTasks.crontask.name.autodebit', 'CronTasks.crontask.description.autodebit', 1, 'time'),
(3, 'payment_reminders', 'system', NULL, 'CronTasks.crontask.name.payment_reminders', 'CronTasks.crontask.description.payment_reminders', 1, 'time'),
(4, 'apply_payments', 'system', NULL, 'CronTasks.crontask.name.apply_payments', 'CronTasks.crontask.description.apply_payments', 1, 'interval'),
(5, 'provision_pending_services', 'system', NULL, 'CronTasks.crontask.name.provision_pending_services', 'CronTasks.crontask.description.provision_pending_services', 1, 'interval'),
(6, 'cancel_scheduled_services', 'system', NULL, 'CronTasks.crontask.name.cancel_scheduled_services', 'CronTasks.crontask.description.cancel_scheduled_services', 1, 'time'),
(7, 'card_expiration_reminders', 'system', NULL, 'CronTasks.crontask.name.card_expiration_reminders', 'CronTasks.crontask.description.card_expiration_reminders', 1, 'time'),
(8, 'deliver_invoices', 'system', NULL, 'CronTasks.crontask.name.deliver_invoices', 'CronTasks.crontask.description.deliver_invoices', 1, 'interval'),
(9, 'backups_sftp', 'system', NULL, 'CronTasks.crontask.name.backups_sftp', 'CronTasks.crontask.description.backups_sftp', 1, 'interval'),
(10, 'suspend_services', 'system', NULL, 'CronTasks.crontask.name.suspend_services', 'CronTasks.crontask.description.suspend_services', 1, 'time'),
(11, 'exchange_rates', 'system', NULL, 'CronTasks.crontask.name.exchange_rates', 'CronTasks.crontask.description.exchange_rates', 1, 'interval'),
(12, 'deliver_reports', 'system', NULL, 'CronTasks.crontask.name.deliver_reports', 'CronTasks.crontask.description.deliver_reports', 1, 'time'),
(13, 'cleanup_logs', 'system', NULL, 'CronTasks.crontask.name.cleanup_logs', 'CronTasks.crontask.description.cleanup_logs', 1, 'time'),
(14, 'backups_amazons3', 'system', NULL, 'CronTasks.crontask.name.backups_amazons3', 'CronTasks.crontask.description.backups_amazons3', 1, 'interval'),
(15, 'process_renewing_services', 'system', NULL, 'CronTasks.crontask.name.process_renewing_services', 'CronTasks.crontask.description.process_renewing_services', 1, 'interval'),
(16, 'unsuspend_services', 'system', NULL, 'CronTasks.crontask.name.unsuspend_services', 'CronTasks.crontask.description.unsuspend_services', 1, 'interval'),
(17, 'license_validation', 'system', NULL, 'CronTasks.crontask.name.license_validation', NULL, 1, 'interval'),
(18, 'process_service_changes', 'system', NULL, 'CronTasks.crontask.name.process_service_changes', 'CronTasks.crontask.description.process_service_changes', 1, 'interval'),
(19, 'apply_invoice_late_fees', 'system', NULL, 'CronTasks.crontask.name.apply_invoice_late_fees', 'CronTasks.crontask.description.apply_invoice_late_fees', 1, 'time'),
(20, 'domain_synchronization', 'plugin', 'domains', 'Domain Synchronization', 'Synchronize domain services with the expiry date from their registrar module', 0, 'time'),
(21, 'domain_tld_synchronization', 'plugin', 'domains', 'Domain TLD Synchronization', 'Synchronize packages with the TLD pricing from their registrar module', 0, 'interval'),
(22, 'domain_term_change', 'plugin', 'domains', 'Change Domain Term', 'Change services with a term longer than a year to a yearly term', 0, 'time'),
(23, 'domain_renewal_reminders', 'plugin', 'domains', 'Send Renewal Reminders', 'Send email reminders for domains that are drawing close to their renewal date', 0, 'time'),
(24, 'accept_paid_orders', 'plugin', 'order', 'Accept Paid Pending Orders', 'Automatically accepts paid pending orders if the order form allows it.', 0, 'interval'),
(25, 'affiliate_monthly_report', 'plugin', 'order', 'Affiliate Monthly Report', 'A monthly affiliate email report will be sent on the 1st of the month for the previous month.', 0, 'time'),
(26, 'mature_affiliate_referrals', 'plugin', 'order', 'Affiliate Orders', 'Evaluates whether any pending affiliate referrals have reached maturity, and if so, updates them and payout amounts.', 0, 'time'),
(27, 'process_abandoned_orders', 'plugin', 'order', 'Process Abandoned Orders', 'Send reminder emails, perform cancellations, and deactivate clients for abandoned orders', 0, 'interval'),
(28, 'poll_tickets', 'plugin', 'support_manager', 'Download Tickets', 'Connects to the POP3/IMAP server to download emails and convert them into tickets.', 0, 'interval'),
(29, 'close_tickets', 'plugin', 'support_manager', 'Close Tickets', 'Automatically closes open tickets as configured for departments in the Support Manager.', 0, 'interval'),
(30, 'delete_tickets', 'plugin', 'support_manager', 'Delete Trash Tickets', 'Automatically delete trash tickets as configured for departments in the Support Manager.', 0, 'interval'),
(31, 'send_reminders', 'plugin', 'support_manager', 'Send Reminders', 'Automatically send out reminders for tickets of a particular status after a certain period of time.', 0, 'interval');

-- --------------------------------------------------------

--
-- Table structure for table `cron_task_runs`
--

CREATE TABLE `cron_task_runs` (
  `id` int(10) UNSIGNED NOT NULL,
  `task_id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `time` time DEFAULT NULL,
  `interval` int(10) UNSIGNED DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `date_enabled` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cron_task_runs`
--

INSERT INTO `cron_task_runs` (`id`, `task_id`, `company_id`, `time`, `interval`, `enabled`, `date_enabled`) VALUES
(1, 1, 1, '16:05:00', NULL, 1, '2012-01-01 00:00:00'),
(2, 2, 1, '20:00:00', NULL, 1, '2012-01-01 00:00:00'),
(3, 3, 1, '18:00:00', NULL, 1, '2012-01-01 00:00:00'),
(4, 4, 1, NULL, 5, 1, '2012-01-01 00:00:00'),
(5, 5, 1, NULL, 5, 1, '2012-01-01 00:00:00'),
(6, 6, 1, '16:00:00', NULL, 1, '2012-01-01 00:00:00'),
(7, 7, 1, '19:00:00', NULL, 1, '2012-01-01 00:00:00'),
(8, 8, 1, NULL, 5, 1, '2012-01-01 00:00:00'),
(9, 9, 0, NULL, 1440, 1, '2012-01-01 00:00:00'),
(10, 10, 1, '17:00:00', NULL, 1, '2012-01-01 00:00:00'),
(11, 11, 1, NULL, 1380, 0, NULL),
(12, 12, 1, '20:00:00', NULL, 0, NULL),
(13, 13, 1, '00:00:00', NULL, 1, '2012-01-01 00:00:00'),
(14, 14, 0, NULL, 1440, 1, '2012-01-01 00:00:00'),
(15, 15, 1, NULL, 5, 1, '2012-01-01 00:00:00'),
(16, 16, 1, NULL, 5, 1, '2012-01-01 00:00:00'),
(17, 17, 0, NULL, 1440, 1, '2012-01-01 00:00:00'),
(18, 18, 1, NULL, 5, 1, '2022-11-23 16:35:13'),
(19, 19, 1, '00:00:00', NULL, 1, '2022-11-23 16:35:13'),
(20, 20, 1, '08:00:00', NULL, 1, '2022-11-23 16:35:14'),
(21, 21, 1, NULL, 1440, 1, '2022-11-23 16:35:14'),
(22, 22, 1, '08:00:00', NULL, 1, '2022-11-23 16:35:14'),
(23, 23, 1, '08:00:00', NULL, 1, '2022-11-23 16:35:14'),
(24, 24, 1, NULL, 5, 1, '2022-11-23 16:35:15'),
(25, 25, 1, '12:00:00', NULL, 1, '2022-11-23 16:35:15'),
(26, 26, 1, '08:00:00', NULL, 1, '2022-11-23 16:35:15'),
(27, 27, 1, NULL, 5, 1, '2022-11-23 16:35:15'),
(28, 28, 1, NULL, 5, 1, '2022-11-23 16:35:15'),
(29, 29, 1, NULL, 360, 1, '2022-11-23 16:35:15'),
(30, 30, 1, NULL, 360, 1, '2022-11-23 16:35:15'),
(31, 31, 1, NULL, 5, 1, '2022-11-23 16:35:15');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `code` char(3) NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `format` enum('#,###.##','#.###,##','# ###.##','# ###,##','#,##,###.##','# ###','#.###','#,###','####.##','####,##') NOT NULL,
  `precision` tinyint(1) UNSIGNED NOT NULL DEFAULT 4,
  `prefix` varchar(10) DEFAULT NULL,
  `suffix` varchar(10) DEFAULT NULL,
  `exchange_rate` decimal(21,6) NOT NULL DEFAULT 0.000000,
  `exchange_updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`code`, `company_id`, `format`, `precision`, `prefix`, `suffix`, `exchange_rate`, `exchange_updated`) VALUES
('AUD', 1, '#,###.##', 2, '$', NULL, '1.000000', NULL),
('EUR', 1, '#,###.##', 2, '€', NULL, '1.000000', NULL),
('GBP', 1, '#,###.##', 2, '£', NULL, '1.000000', NULL),
('INR', 1, '#,##,###.##', 2, 'Rs.', NULL, '1.000000', NULL),
('JPY', 1, '#,###', 0, '¥', NULL, '1.000000', NULL),
('USD', 1, '#,###.##', 2, '$', NULL, '1.000000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `data_feeds`
--

CREATE TABLE `data_feeds` (
  `feed` varchar(64) NOT NULL,
  `dir` varchar(64) DEFAULT NULL,
  `class` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `data_feeds`
--

INSERT INTO `data_feeds` (`feed`, `dir`, `class`) VALUES
('client', NULL, '\\Blesta\\Core\\Util\\DataFeed\\Feeds\\ClientFeed'),
('package', NULL, '\\Blesta\\Core\\Util\\DataFeed\\Feeds\\PackageFeed'),
('domain', 'domains', '\\DomainsFeed');

-- --------------------------------------------------------

--
-- Table structure for table `data_feed_endpoints`
--

CREATE TABLE `data_feed_endpoints` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `feed` varchar(64) NOT NULL,
  `endpoint` varchar(64) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `data_feed_endpoints`
--

INSERT INTO `data_feed_endpoints` (`id`, `company_id`, `feed`, `endpoint`, `enabled`) VALUES
(1, 1, 'package', 'name', 0),
(2, 1, 'package', 'description', 0),
(3, 1, 'package', 'pricing', 0),
(4, 1, 'client', 'count', 0),
(5, 1, 'domain', 'pricing', 0);

-- --------------------------------------------------------

--
-- Table structure for table `domains_domains`
--

CREATE TABLE `domains_domains` (
  `id` int(10) UNSIGNED NOT NULL,
  `service_id` int(10) UNSIGNED NOT NULL,
  `expiration_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `domains_packages`
--

CREATE TABLE `domains_packages` (
  `id` int(10) UNSIGNED NOT NULL,
  `tld_id` int(10) UNSIGNED NOT NULL,
  `package_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `domains_packages`
--

INSERT INTO `domains_packages` (`id`, `tld_id`, `package_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `domains_tlds`
--

CREATE TABLE `domains_tlds` (
  `id` int(10) UNSIGNED NOT NULL,
  `tld` varchar(64) NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `package_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `domains_tlds`
--

INSERT INTO `domains_tlds` (`id`, `tld`, `company_id`, `package_id`) VALUES
(1, '.com', 1, 1),
(2, '.net', 1, 2),
(3, '.org', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `emails`
--

CREATE TABLE `emails` (
  `id` int(10) UNSIGNED NOT NULL,
  `email_group_id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `lang` char(5) NOT NULL DEFAULT 'en_us',
  `from` varchar(255) NOT NULL,
  `from_name` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `text` mediumtext DEFAULT NULL,
  `html` mediumtext DEFAULT NULL,
  `email_signature_id` int(10) UNSIGNED DEFAULT NULL,
  `include_attachments` tinyint(1) NOT NULL DEFAULT 1,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `emails`
--

INSERT INTO `emails` (`id`, `email_group_id`, `company_id`, `lang`, `from`, `from_name`, `subject`, `text`, `html`, `email_signature_id`, `include_attachments`, `status`) VALUES
(1, 1, 1, 'en_us', 'billing@blestadev1.hexonet.net', 'Billing Department', 'Payment Received', 'Hi {contact.first_name},\r\n\r\nWe have successfully processed payment with your {card_type}, ending in {last_four}. Please keep this email as a receipt for your records.\r\n\r\nAmount: {amount}\r\nTransaction Number: {response.transaction_id}\r\n\r\nThe charge will be listed as being from {company.name} on your credit card statement.\r\n\r\nThank you for your business!', '<p>\r\n	Hi {contact.first_name},<br />\r\n	<br />\r\n	We have successfully processed payment with your {card_type}, ending in {last_four}. Please keep this email as a receipt for your records.<br />\r\n	<br />\r\n	Amount: {amount}<br />\r\n	Transaction Number: {response.transaction_id}<br />\r\n	<br />\r\n	The charge will be listed as being from {company.name} on your credit card statement.<br />\r\n	<br />\r\n	Thank you for your business!</p>\r\n', 1, 1, 'active'),
(2, 2, 1, 'en_us', 'billing@blestadev1.hexonet.net', 'Billing Department', 'Payment Declined', 'Hi {contact.first_name},\r\n\r\nWe tried to charge your {card_type}, ending in {last_four}, in the amount of {amount}, but it was declined.\r\n\r\nResponse Message: {response.message}\r\n\r\nPlease verify that the account details we have on file are correct.\r\n\r\nWe will attempt to charge your card again once a day until it is successful, up to three times.', '<p>\r\n	Hi {contact.first_name},<br />\r\n	<br />\r\n	We tried to charge your {card_type}, ending in {last_four}, in the amount of {amount}, but it was declined.<br />\r\n	<br />\r\n	<strong>Response Message: {response.message}</strong></p>\r\n<p>\r\n	<strong>Please verify that the account details we have on file are correct.</strong><br />\r\n	<br />\r\n	We will attempt to charge your card again once a day until it is successful, up to three times.</p>\r\n', 1, 1, 'active'),
(3, 3, 1, 'en_us', 'billing@blestadev1.hexonet.net', 'Billing Department', 'Payment Error', 'Hi {contact.first_name},\r\n\r\nWe tried to charge your {card_type}, ending in {last_four}, in the amount of {amount}, but the request resulted in an error.\r\n\r\nError Response: {response.message}\r\n\r\nPlease verify that the account details we have on file are correct.\r\n\r\nWe will attempt to charge your card again once a day until it is successful, up to three times.', '<p>\r\n	Hi {contact.first_name},<br />\r\n	<br />\r\n	We tried to charge your {card_type}, ending in {last_four}, in the amount of {amount}, but the request resulted in an error.</p>\r\n<p>\r\n	<strong>Error Response: {response.message}</strong></p>\r\n<p>\r\n	<strong>Please verify that the account details we have on file are correct.</strong><br />\r\n	<br />\r\n	We will attempt to charge your card again once a day until it is successful, up to three times.</p>\r\n', 1, 1, 'active'),
(4, 4, 1, 'en_us', 'billing@blestadev1.hexonet.net', 'Billing Department', 'Payment Submitted', 'Hi {contact.first_name},\r\n\r\nWe have submitted a debit request to your bank for your {account_type} account, ending in {last_four}. Funds should be withdrawn within the next 72 hours, but you may see a pending request in your online banking now. Please keep this email as a receipt for your records.\r\n\r\nAmount: {amount}\r\nTransaction Number: {response.transaction_id}\r\n\r\nThe charge will be listed as being from {company.name} on your bank statement.\r\n\r\nThank you for your business!', '<p>\r\n	Hi {contact.first_name},<br />\r\n	<br />\r\n	We have submitted a debit request to your bank for your {account_type} account, ending in {last_four}. Funds should be withdrawn within the next 72 hours, but you may see a pending request in your online banking now. Please keep this email as a receipt for your records.<br />\r\n	<br />\r\n	Amount: {amount}<br />\r\n	Transaction Number: {response.transaction_id}<br />\r\n	<br />\r\n	The charge will be listed as being from {company.name} on your bank statement.<br />\r\n	<br />\r\n	Thank you for your business!</p>\r\n', 1, 1, 'active'),
(5, 5, 1, 'en_us', 'billing@blestadev1.hexonet.net', 'Billing Department', 'Payment Declined', 'Hi {contact.first_name},\r\n\r\nWe submitted a debit request to your bank for your {account_type} account, ending in {last_four}, in the amount of {amount}, but the request was declined.\r\n\r\nResponse Message: {response.message}\r\n\r\nPlease verify that the account details we have on file are correct.\r\n\r\nWe will attempt this request again once a day until it is successful, up to three times.', '<p>\r\n	Hi {contact.first_name},<br />\r\n	<br />\r\n	We submitted a debit request to your bank for your {account_type} account, ending in {last_four}, in the amount of {amount}, but the request was declined.</p>\r\n<p>\r\n	<strong>Response Message: {response.message}</strong><br />\r\n	<br />\r\n	<strong>Please verify that the account details we have on file are correct.</strong><br />\r\n	<br />\r\n	We will attempt this request again once a day until it is successful, up to three times.</p>\r\n', 1, 1, 'active'),
(6, 6, 1, 'en_us', 'billing@blestadev1.hexonet.net', 'Billing Department', 'Payment Error', 'Hi {contact.first_name},\r\n\r\nWe submitted a debit request to your bank for your {account_type} account, ending in {last_four}, in the amount of {amount}, but the request resulted in an error.\r\n\r\nResponse Message: {response.message}\r\n\r\nPlease verify that the account details we have on file are correct.\r\n\r\nWe will attempt this request again once a day until it is successful, up to three times.', '<p>\r\n	Hi {contact.first_name},<br />\r\n	<br />\r\n	We submitted a debit request to your bank for your {account_type} account, ending in {last_four}, in the amount of {amount}, but the request resulted in an error.</p>\r\n<p>\r\n	<strong>Response Message: {response.message}</strong></p>\r\n<p>\r\n	<strong>Please verify that the account details we have on file are correct.</strong><br />\r\n	<br />\r\n	We will attempt this request again once a day until it is successful, up to three times.</p>\r\n', 1, 1, 'active'),
(7, 7, 1, 'en_us', 'billing@blestadev1.hexonet.net', 'Billing Department', 'Payment Received', 'Hi {contact.first_name},\r\n\r\nWe have received your {payment_type} payment in the amount of {amount} and it has been applied to your account. Please keep this email as a receipt for your records.\r\n\r\nAmount: {amount}\r\nTransaction Number: {transaction_id}\r\n\r\nThank you for your business!', '<p>\r\n	Hi {contact.first_name},<br />\r\n	<br />\r\n	We have received your {payment_type} payment in the amount of {amount} and it has been applied to your account. Please keep this email as a receipt for your records.<br />\r\n	<br />\r\n	Amount: {amount}<br />\r\n	Transaction Number: {transaction_id}<br />\r\n	<br />\r\n	Thank you for your business!</p>\r\n', 1, 1, 'active'),
(8, 8, 1, 'en_us', 'billing@blestadev1.hexonet.net', 'Billing Department', 'Credit Card Expiring Soon', 'Hi {contact.first_name},\r\n\r\nYour {card_type} ending in {last_four} is expiring this month.\r\n\r\nTo update your card, please log into our client area at http://{client_url}. If the card is not updated, we\'ll be unable to process payment for any current or future charges.\r\n\r\nThank you!', '<p>\r\n	Hi {contact.first_name},<br />\r\n	<br />\r\n	Your {card_type} ending in {last_four} is expiring this month.<br />\r\n	<br />\r\n	To update your card, please log into our client area at <a href=\"http://{client_url}\">http://{client_url}</a>. If the card is not updated, we\'ll be unable to process payment for any current or future charges.<br />\r\n	<br />\r\n	Thank you!</p>\r\n', 1, 1, 'active'),
(9, 9, 1, 'en_us', 'billing@blestadev1.hexonet.net', 'Billing Department', 'Invoice Due', 'Hi {contact.first_name},\n\nAn invoice has been created for your account and is attached to this email in PDF format.\n{% for invoice in invoices %}\nInvoice #: {invoice.id_code}\n\n{% if autodebit %}{% if payment_account %}{% if invoice.autodebit_date_formatted %}Auto debit is enabled for your account, so we\'ll automatically process the card you have on file on {invoice.autodebit_date_formatted} unless payment has been applied sooner.{% else %}If you would like us to automatically charge your card, login to your account at http://{client_url} to set up auto debit.{% endif %}{% else %}If you would like us to automatically charge your card, login to your account at http://{client_url} to set up auto debit.{% endif %}{% else %}If you would like us to automatically charge your card, login to your account at http://{client_url} to set up auto debit.{% endif %}\n\nPay Now, visit http://{invoice.payment_url} (No login required)\n{% endfor %}\nIf you have any questions about your invoice, please let us know!', '<p>\n	Hi {contact.first_name},<br />\n	<br />\n	An invoice has been created for your account and is attached to this email in PDF format.<br />\n	{% for invoice in invoices %}<br />\n	Invoice #:<strong> {invoice.id_code}</strong></p>\n<p>\n	{% if autodebit %}{% if payment_account %}{% if invoice.autodebit_date_formatted %}Auto debit is enabled for your account, so we\'ll automatically process the card you have on file on <strong>{invoice.autodebit_date_formatted}</strong> unless payment has been applied sooner.{% else %}If you would like us to automatically charge your card, login to your account at <a href=\"http://{client_url}\">http://{client_url}</a> to set up auto debit.{% endif %}{% else %}If you would like us to automatically charge your card, login to your account at <a href=\"http://{client_url}\">http://{client_url}</a> to set up auto debit.{% endif %}{% else %}If you would like us to automatically charge your card, login to your account at <a href=\"http://{client_url}\">http://{client_url}</a> to set up auto debit.{% endif %}<br />\n	<br />\n	<a href=\"http://{invoice.payment_url}\">Pay Now</a> (No login required)<br />\n	{% endfor %}<br />\nIf you have any questions about your invoice, please let us know!</p>', 1, 1, 'active'),
(10, 10, 1, 'en_us', 'billing@blestadev1.hexonet.net', 'Billing Department', 'Invoice Due (Copy)', 'Hi {contact.first_name},\r\n\r\nAn invoice has been created for your account and is attached to this email in PDF format.\r\n{% for invoice in invoices %}\r\nInvoice #: {invoice.id_code}{% endfor %}\r\nThis invoice has already been paid, so no payment is necessary for this one, but your account may have other balances. To login to your account, please visit http://{client_url}.\r\n\r\nIf you have any questions about your invoice, please let us know!', '<p>\r\n	Hi {contact.first_name},<br />\r\n	<br />\r\n	An invoice has been created for your account and is attached to this email in PDF format.<br />\r\n	{% for invoice in invoices %}<br />\r\n	Invoice #:<strong> {invoice.id_code}</strong>{% endfor %}</p>\r\n<p>\r\n	This invoice has already been paid, so no payment is necessary for this one, but your account may have other balances. To login to your account, please visit <a href=\"http://{client_url}\">http://{client_url}</a>.<br />\r\n	<br />\r\n	If you have any questions about your invoice, please let us know!</p>\r\n', 1, 1, 'active'),
(11, 11, 1, 'en_us', 'billing@blestadev1.hexonet.net', 'Billing Department', 'Invoice Due: Reminder', 'Hi {contact.first_name},\r\n\r\nThis is a reminder that invoice #{invoice.id_code} is due on {invoice.date_due_formatted}. If you have recently mailed in payment for this invoice, you can ignore this reminder.\r\n\r\nPay Now.. http://{payment_url} (No Login Required)\r\n\r\nThank you for your continued business!', '<p>\r\n	Hi {contact.first_name},<br />\r\n	<br />\r\n	This is a reminder that invoice <strong>#{invoice.id_code}</strong> is due on <strong>{invoice.date_due_formatted}</strong>. If you have recently mailed in payment for this invoice, you can ignore this reminder.</p>\r\n<p>\r\n	<a href=\"http://{payment_url}\">Pay Now</a> (No login required)<br />\r\n	<br />\r\n	Thank you for your continued business!</p>\r\n', 1, 1, 'active'),
(12, 12, 1, 'en_us', 'billing@blestadev1.hexonet.net', 'Billing Department', 'Invoice Due: 2nd Notice', 'Hi {contact.first_name},\r\n\r\nThis is the 2nd notice we have sent regarding invoice #{invoice.id_code}. It was due on {invoice.date_due_formatted} and is now past due. If you have recently mailed in payment for this invoice, you can ignore this email.\r\n\r\nPay Now.. http://{payment_url} (No login required)', '<p>\r\n	Hi {contact.first_name},<br />\r\n	<br />\r\n	This is the <strong>2nd notice</strong> we have sent regarding invoice <strong>#{invoice.id_code}</strong>. It was due on <strong>{invoice.date_due_formatted}</strong> and is now past due. If you have recently mailed in payment for this invoice, you can ignore this email.<br />\r\n	<br />\r\n	<a href=\"http://{payment_url}\">Pay Now</a> (No login required)</p>\r\n', 1, 1, 'active'),
(13, 13, 1, 'en_us', 'billing@blestadev1.hexonet.net', 'Billing Department', 'Invoice Due: Last Notice', 'Hi {contact.first_name},\r\n\r\nThis is the 3rd notice we have sent regarding invoice #{invoice.id_code}. It was due on {invoice.date_due_formatted} and is now past due. This is the last notice we will send regarding this particular invoice. If payment is not received soon, the account may be suspended.\r\n\r\nPay Now.. http://{payment_url} (No login required)', '<p>\r\n	Hi {contact.first_name},<br />\r\n	<br />\r\n	This is the <strong>3rd notice</strong> we have sent regarding invoice <strong>#{invoice.id_code}</strong>. It was due on <strong>{invoice.date_due_formatted}</strong> and is now past due. This is the last notice we will send regarding this particular invoice. If payment is not received soon, the account may be suspended.<br />\r\n	<br />\r\n	<a href=\"http://{payment_url}\">Pay Now</a> (No login required)</p>\r\n', 1, 1, 'active'),
(14, 14, 1, 'en_us', 'billing@blestadev1.hexonet.net', 'Billing Department', 'Password Reset', 'Hi {contact.first_name},\r\n\r\nSomeone at the IP address {ip_address} requested a password reset for your account. If this was you, please visit the following URL to reset your password...\r\n\r\nhttp://{password_reset_url}\r\n\r\nIf you did not make this request, you can safely ignore this email.\r\n', '<p>\r\n	Hi {contact.first_name},<br />\r\n	<br />\r\n	Someone at the IP address {ip_address} requested a password reset for your account. If this was you, please visit the following URL to reset your password...<br />\r\n	<br />\r\n	<a href=\"http://{password_reset_url}\">http://{password_reset_url}</a><br />\r\n	<br />\r\n	If you did not make this request, you can safely ignore this email.</p>\r\n', 1, 1, 'active'),
(15, 15, 1, 'en_us', 'billing@blestadev1.hexonet.net', 'Billing Department', 'Service Suspended', 'Hi {contact.first_name},\n\nYour service, {package.name} - {service.name} has been suspended. The service may have been suspended for the following reasons:\n\n1. Non-payment. If your service was suspended for non-payment, you may login at http://{client_uri} to post payment and re-activate the service.\n2. TOS or abuse violation.\n\nIf the service is suspended for an extended period of time, it may be cancelled. Please contact us if you have any questions.', '<p>Hi {contact.first_name},</p>\n<p>Your service, {package.name} - {service.name} has been suspended. The service may have been suspended for the following reasons:</p>\n<ol>\n	<li>Non-payment. If your service was suspended for non-payment, you may login at&nbsp;<a href=\"http://{client_uri}\">http://{client_uri}</a>&nbsp;to post payment and re-activate the service.</li>\n	<li>TOS or abuse violation.</li>\n</ol>\n<p>If the service is suspended for an extended period of time, it may be cancelled. Please contact us if you have any questions.</p>', 1, 1, 'active'),
(16, 16, 1, 'en_us', 'sales@blestadev1.hexonet.net', 'Billing Department', 'Welcome to {company.name}', 'Hi {contact.first_name}!\r\n\r\nThank you for registering with us. Your new account has been set up and you may login to our client area with the details below. Please login and change your password at your earliest convenience.\r\n\r\nLogin at.. http://{client_url}login/ with..\r\n\r\nUsername: {username}\r\nPassword: (Use the password you signed up with)\r\n\r\nIf you placed an order for services, you\'ll receive a separate email once they are activated.\r\n\r\nThank you for choosing {company.name}!', '<p>\r\n	Hi {contact.first_name}!<br />\r\n	<br />\r\n	Thank you for registering with us. Your new account has been set up and you may login to our client area with the details below. Please login and change your password at your earliest convenience.<br />\r\n	<br />\r\n	Login at.. <a href=\"http://{client_url}login/\">http://{client_url}login/</a> with..<br />\r\n	<br />\r\n	Username: {username}<br />\r\n	Password: (Use the password you signed up with)<br />\r\n	<br />\r\n	If you placed an order for services, you&#39;ll receive a separate email once they are activated.<br />\r\n	<br />\r\n	Thank you for choosing {company.name}!</p>\r\n', 2, 1, 'active'),
(17, 17, 1, 'en_us', 'billing@blestadev1.hexonet.net', 'Billing', 'Monthly Aging Invoices Report', 'Hi {staff.first_name},\n\nAn Aging Invoices Report has been generated for {company.name} and is attached to this email as a CSV file.', '<p>\n	Hi {staff.first_name},<br />\n	<br />\n	An Aging Invoices Report has been generated for {company.name} and is attached to this email as a CSV file.</p>', 1, 1, 'active'),
(18, 18, 1, 'en_us', 'billing@blestadev1.hexonet.net', 'Billing', 'Daily Invoice Creation Report', 'Hi {staff.first_name},\n\nA Daily Invoice Creation Report has been generated for {company.name} and is attached to this email as a CSV file.', '<p>\n	Hi {staff.first_name},</p>\n<p>\n	A Daily Invoice Creation Report has been generated for {company.name} and is attached to this email as a CSV file.</p>', 1, 1, 'active'),
(19, 19, 1, 'en_us', 'admin@blestadev1.hexonet.net', 'Admin', 'Suspension Error', 'Hi {staff.first_name},\n\nThere was an error with the {package.name} package, or its module does not support automatic suspension.\n\n{package.name} {service.name}\n--\n{client.id_code}\n{client.first_name} {client.last_name}\n{client.email}\n\nManage Service (http://{admin_uri}clients/editservice/{client.id}/{service.id}/)\n\nThe service may need to be suspended manually.\n{% if errors %}{% for type in errors %}{% for error in type %}\nError: {error}\n\n{% endfor %}{% endfor %}{% endif %}', '<p>\n	Hi {staff.first_name},<br />\n	<br />\n	There was an error with the {package.name} package, or its module does not support automatic suspension.<br />\n	<br />\n	{package.name} {service.name}<br />\n	--<br />\n	{client.id_code}<br />\n	{client.first_name} {client.last_name}<br />\n	{client.email}</p>\n<p>\n	<a href=\"http://{admin_uri}clients/editservice/{client.id}/{service.id}/\">Manage Service</a><br />\n	<br />\n	The service may need to be suspended manually.<br />\n	{% if errors %}{% for type in errors %}{% for error in type %}<br />\n	Error: {error}</p>\n<p>\n	{% endfor %}{% endfor %}{% endif %}</p>', 3, 1, 'active'),
(20, 20, 1, 'en_us', 'admin@blestadev1.hexonet.net', 'Admin', 'Unsuspension Error', 'Hi {staff.first_name},\n\nThere was an error with the {package.name} package, or its module does not support automatic unsuspension.\n\n{package.name} {service.name}\n--\n{client.id_code}\n{client.first_name} {client.last_name}\n{client.email}\n\nManage Service (http://{admin_uri}clients/editservice/{client.id}/{service.id}/)\n\nThe service may need to be unsuspended manually.\n{% if errors %}{% for type in errors %}{% for error in type %}\nError: {error}\n\n{% endfor %}{% endfor %}{% endif %}', '<p>\n	Hi {staff.first_name},<br />\n	<br />\n	There was an error with the {package.name} package, or its module does not support automatic unsuspension.<br />\n	<br />\n	{package.name} {service.name}<br />\n	--<br />\n	{client.id_code}<br />\n	{client.first_name} {client.last_name}<br />\n	{client.email}</p>\n<p>\n	<a href=\"http://{admin_uri}clients/editservice/{client.id}/{service.id}/\">Manage Service</a><br />\n	<br />\n	The service may need to be unsuspended manually.<br />\n	{% if errors %}{% for type in errors %}{% for error in type %}<br />\n	Error: {error}</p>\n<p>\n	{% endfor %}{% endfor %}{% endif %}</p>', 3, 1, 'active'),
(21, 21, 1, 'en_us', 'admin@blestadev1.hexonet.net', 'Admin', 'Cancellation Error', 'Hi {staff.first_name},\n\nThere was an error with the {package.name} package, or its module returned an error on cancellation.\n\n{package.name} {service.name}\n--\n{client.id_code}\n{client.first_name} {client.last_name}\n{client.email}\n\nManage Service (http://{admin_uri}clients/editservice/{client.id}/{service.id}/)\n\nThe service may need to be cancelled manually.\n{% if errors %}{% for type in errors %}{% for error in type %}\nError: {error}\n\n{% endfor %}{% endfor %}{% endif %}', '<p>\n	Hi {staff.first_name},<br />\n	<br />\n	There was an error with the {package.name} package, or its module returned an error on cancellation.<br />\n	<br />\n	{package.name} {service.name}<br />\n	--<br />\n	{client.id_code}<br />\n	{client.first_name} {client.last_name}<br />\n	{client.email}</p>\n<p>\n	<a href=\"http://{admin_uri}clients/editservice/{client.id}/{service.id}/\">Manage Service</a><br />\n	<br />\n	The service may need to be cancelled manually.<br />\n	{% if errors %}{% for type in errors %}{% for error in type %}<br />\n	Error: {error}</p>\n<p>\n	{% endfor %}{% endfor %}{% endif %}</p>', 3, 1, 'active'),
(22, 22, 1, 'en_us', 'billing@blestadev1.hexonet.net', 'Billing Department', 'Scheduled Payment Reminder', 'Hi {contact.first_name},\r\n\r\nThis is a reminder that a payment is scheduled to be charged to your account on {autodebit_date} in the amount of {amount_formatted} for invoice #{invoice.id_code}.\r\n\r\n{% if payment_account.account_type == \"ach\" %}Your {payment_account.type_name} Account ending in {payment_account.last4} will be processed on this date. If we should use a different payment method, or if you need to make a change to this account, please login to our client area at http://{client_uri} to make the correction at your earliest convenience.{% else %}Your {payment_account.type_name} ending in {payment_account.last4} will be processed on this date. If we should use a different payment method, or if you need to make a change to this account, please login to our client area at http://{client_uri} to make the correction at your earliest convenience.{% endif %}\r\n\r\nIf you\'d like to disable automatic payments, you may do so by logging into your account at http://{client_uri}.\r\n\r\nThank you for your continued business!', '<p>\r\n	Hi {contact.first_name},</p>\r\n<p>\r\n	This is a reminder that a payment is scheduled to be charged to your account on {autodebit_date} in the amount of {amount_formatted} for invoice #{invoice.id_code}.</p>\r\n<p>\r\n	{% if payment_account.account_type == \"ach\" %}Your {payment_account.type_name} Account ending in {payment_account.last4} will be processed on this date. If we should use a different payment method, or if you need to make a change to this account, please login to our client area at http://{client_uri} to make the correction at your earliest convenience.{% else %}Your {payment_account.type_name} ending in {payment_account.last4} will be processed on this date. If we should use a different payment method, or if you need to make a change to this account, please login to our client area at <a href=\"http://{client_uri}\">http://{client_uri}</a> to make the correction at your earliest convenience.{% endif %}<br />\r\n	<br />\r\n	If you\'d like to disable automatic payments, you may do so by logging into your account at <a href=\"http://{client_uri}\">http://{client_uri}</a>.<br />\r\n	<br />\r\n	Thank you for your continued business!</p>\r\n', 1, 1, 'active'),
(23, 23, 1, 'en_us', 'admin@blestadev1.hexonet.net', 'Admin', 'Password Reset', 'Hi {staff.first_name},\r\n\r\nSomeone at the IP address {ip_address} requested a password reset for your account. If this was you, please visit the following URL to reset your password..\r\n\r\nhttp://{password_reset_url}\r\n\r\nIf you did not submit this request, please contact your system administrator. No action is required to keep your password the same.', '<p>\r\n	Hi {staff.first_name},<br />\r\n	<br />\r\n	Someone at the IP address <strong>{ip_address}</strong> requested a password reset for your account. If this was you, please visit the following URL to reset your password..<br />\r\n	<br />\r\n	<a href=\"http://{password_reset_url}\">http://{password_reset_url}</a><br />\r\n	<br />\r\n	If you did not submit this request, please contact your system administrator. No action is required to keep your password the same.</p>\r\n', 3, 1, 'active'),
(24, 24, 1, 'en_us', 'sales@blestadev1.hexonet.net', 'Sales', 'New Service Activated', 'Hi {contact.first_name},\r\n\r\nYour service has been approved and activated. Please keep this email for your records.\r\n\r\n{package.email_text}', '<p>\r\n	Hi {contact.first_name},<br />\r\n	<br />\r\n	Your service has been approved and activated. Please keep this email for your records.<br />\r\n	<br />\r\n	{package.email_html}</p>\r\n', 2, 1, 'active'),
(25, 25, 1, 'en_us', 'billing@blestadev1.hexonet.net', 'Billing Department', 'Service Unsuspended', 'Hi {contact.first_name},\n\nYour service, {package.name} - {service.name} has been unsuspended.', '<p>Hi {contact.first_name},</p>\n<p>Your service, {package.name} - {service.name} has been unsuspended.</p>', 1, 1, 'active'),
(26, 26, 1, 'en_us', 'admin@blestadev1.hexonet.net', 'Admin', 'Creation Error', 'Hi {staff.first_name},\n\nThere was an error provisioning the following service:\n\n{package.name} {service.name}\n--\n{client.id_code}\n{client.first_name} {client.last_name}\n{client.email}\n\nManage Service (http://{admin_uri}clients/editservice/{client.id}/{service.id}/)\n\nThe pending service may need to be modified so that it can be provisioned automatically or it may need to be provisioned manually.\n{% if errors %}{% for type in errors %}{% for error in type %}\nError: {error}\n\n{% endfor %}{% endfor %}{% endif %}', '<p>\n	Hi {staff.first_name},<br />\n	<br />\n	There was an error provisioning the following service:<br />\n	<br />\n	{package.name} {service.name}<br />\n	--<br />\n	{client.id_code}<br />\n	{client.first_name} {client.last_name}<br />\n	{client.email}</p>\n<p>\n	<a href=\"http://{admin_uri}clients/editservice/{client.id}/{service.id}/\">Manage Service</a></p>\n<p>\n	The pending service may need to be modified so that it can be provisioned automatically or it may need to be provisioned manually.<br />\n	{% if errors %}{% for type in errors %}{% for error in type %}<br />\n	Error: {error}</p>\n<p>\n	{% endfor %}{% endfor %}{% endif %}</p>', NULL, 1, 'active'),
(27, 27, 1, 'en_us', 'billing@blestadev1.hexonet.net', 'Billing', 'Monthly Tax Liability Report', 'Hi {staff.first_name},\n\nA Tax Liability Report has been generated for {company.name} and is attached to this email as a CSV file.', '<p>Hi {staff.first_name},</p>\n<p>A Tax Liability Report has been generated for {company.name} and is attached to this email as a CSV file.</p>', 1, 1, 'active'),
(28, 28, 1, 'en_us', 'billing@blestadev1.hexonet.net', 'Billing Department', 'Payment Received', 'Hi {contact.first_name},\n\nWe have received your {transaction.gateway_name} payment in the amount of {transaction.amount | currency_format transaction.currency} and it has been applied to your account. Please keep this email as a receipt for your records.\n\nAmount: {transaction.amount | currency_format transaction.currency}\nTransaction Number: {transaction.transaction_id}\n\nThank you for your business!', '<p>\n	Hi {contact.first_name},<br />\n	<br />\n	We have received your {transaction.gateway_name} payment in the amount of {transaction.amount | currency_format transaction.currency} and it has been applied to your account. Please keep this email as a receipt for your records.<br />\n	<br />\n	Amount: {transaction.amount | currency_format transaction.currency}<br />\n	Transaction Number: {transaction.transaction_id}<br />\n	<br />\n	Thank you for your business!</p>', NULL, 1, 'active'),
(29, 29, 1, 'en_us', 'billing@blestadev1.hexonet.net', 'Billing Department', 'Service Canceled', 'Hi {contact.first_name},\n\nYour service, {package.name} - {service.name}, has been canceled.', '<p>Hi {contact.first_name},</p>\n                            <p>Your service, {package.name} - {service.name}, has been canceled.</p>', 1, 1, 'active'),
(30, 30, 1, 'en_us', 'admin@blestadev1.hexonet.net', 'Admin', 'Service Renewal Error', 'Hi {staff.first_name},\n\nThere was an error renewing the following service:\n\n{package.name} {service.name}\n--\n{client.id_code}\n{client.first_name} {client.last_name}\n{client.email}\n\nManage Service (http://{admin_uri}clients/editservice/{client.id}/{service.id}/)\n\nThe service may need to be modified so that it can be renewed automatically.\n{% if errors %}{% for type in errors %}{% for error in type %}\nError: {error}\n\n{% endfor %}{% endfor %}{% endif %}', '<p>\n	Hi {staff.first_name},<br />\n	<br />\n    There was an error renewing the following service:<br />\n	<br />\n	{package.name} {service.name}<br />\n	--<br />\n	{client.id_code}<br />\n	{client.first_name} {client.last_name}<br />\n	{client.email}</p>\n<p>\n	<a href=\"http://{admin_uri}clients/editservice/{client.id}/{service.id}/\">Manage Service</a></p>\n<p>\n    The service may need to be modified so that it can be renewed automatically.<br />\n	{% if errors %}{% for type in errors %}{% for error in type %}<br />\n	Error: {error}</p>\n<p>\n	{% endfor %}{% endfor %}{% endif %}</p>', 3, 1, 'active'),
(31, 31, 1, 'en_us', 'billing@blestadev1.hexonet.net', 'Billing Department', 'Scheduled Cancellation', 'Hi {contact.first_name},\n\nYour service, {package.name} - {service.name}, has been scheduled for cancellation. If no action is taken, it will be cancelled on {service.date_canceled_formatted}. If you believe this action is in error, please contact us as soon as possible.', '<p>Hi {contact.first_name},</p>\n                            <p>Your service, {package.name} - {service.name}, has been scheduled for cancellation. If no action is taken, it will be cancelled on {service.date_canceled_formatted}. If you believe this action is in error, please contact us as soon as possible.</p>', 1, 1, 'active'),
(32, 32, 1, 'en_us', 'billing@blestadev1.hexonet.net', 'Billing Department', 'Forgot Username', 'Hi {contact.first_name},\n\nSomeone at the IP address {ip_address} requested the username for your account.\nThe username for your account is: {username}\n\nIf you did not make this request, you can safely ignore this email.', '<p>Hi {contact.first_name},</p>\n                            <p>Someone at the IP address {ip_address} requested the username for your account.<br/>The username for your account is: <b>{username}</b></p>\n                            <p>If you did not make this request, you can safely ignore this email.</p>', 1, 1, 'active'),
(33, 33, 1, 'en_us', 'billing@blestadev1.hexonet.net', 'Billing Department', 'Verify your Email Address', 'Hi {contact.first_name},\n\nSome features of your account may be restricted, or orders may be held, until your email address is verified. To verify your email address, please click the link below or copy and paste it into your browser.\nhttp://{verification_url}', '<p>Hi {contact.first_name},</p>\n                            <p>Some features of your account may be restricted, or orders may be held, until your email address is verified. To verify your email address, please click the link below or copy and paste it into your browser.<br />http://{verification_url}</p>', 1, 1, 'active'),
(34, 34, 1, 'en_us', 'sales@blestadev1.hexonet.net', 'Domain Manager', '{domain} will expire on {service.date_renews}', 'Hi {contact.first_name},\n\nThis is a reminder that the domain {domain} will expire on {service.date_renews}.\n\nTo renew this domain, please log in at: {client_uri}.\nFailure to renew will result in loss of domain ownership.\n\nThank you for your continued business!', '<p>Hi {contact.first_name},</p>\n\n<p>This is a reminder that the domain {domain} will expire on {service.date_renews}.</p>\n\n<p>To renew this domain, please log in at: {client_uri}.<br/>\nFailure to renew will result in loss of domain ownership.</p>\n\n<p>Thank you for your continued business!</p>', NULL, 1, 'active'),
(35, 35, 1, 'en_us', 'sales@blestadev1.hexonet.net', 'Domain Manager', '{domain} will expire on {service.date_renews} - SECOND NOTICE', 'Hi {contact.first_name},\n\nThis is a reminder that the domain {domain} will expire on {service.date_renews}.\n\nTo renew this domain, please log in at: {client_uri}.\nFailure to renew will result in loss of domain ownership.\n\nThank you for your continued business!', '<p>Hi {contact.first_name},</p>\n\n<p>This is a reminder that the domain {domain} will expire on {service.date_renews}.</p>\n\n<p>To renew this domain, please log in at: {client_uri}.<br/>\nFailure to renew will result in loss of domain ownership.</p>\n\n<p>Thank you for your continued business!</p>', NULL, 1, 'active'),
(36, 36, 1, 'en_us', 'sales@blestadev1.hexonet.net', 'Domain Manager', '{domain} expired on {service.date_renews}', 'Hi {contact.first_name},\n\nThis is a notice that the domain {domain} has expired on {service.date_renews} and is no longer under your ownership.\nTo re-purchase this domain, please log in at: {client_uri}.\n\nIf you believe this expiration is in error, please contact us.', '<p>Hi {contact.first_name},</p>\n\n<p>This is a notice that the domain {domain} has expired on {service.date_renews} and is no longer under your ownership.<br/>\nTo re-purchase this domain, please log in at: {client_uri}.</p>\n\n<p>If you believe this expiration is in error, please contact us.</p>', NULL, 1, 'active'),
(37, 37, 1, 'en_us', 'sales@blestadev1.hexonet.net', 'Blesta Order System', 'An order has been received', 'A new order has been received by the system.\n\nSummary\n\nOrder Form: {order.order_form_name}\nOrder Number: {order.order_number}\nStatus: {order.status}\nAmount: {invoice.total} {order.currency}\nIP Address: {order.ip_address}{% if order.fraud_status !=\"\" %}\nFraud Status: {order.fraud_status}{% endif %}\n\nClient Details\n\n{order.client_id_code}\n{order.client_first_name} {order.client_last_name}\n{order.client_company}\n{order.client_address1}\n{order.client_email}\n\nItems Ordered\n\n{% for item in services %}{item.package.name}\n{item.name}{% for option in item.options %}\n{option.option_label} x{option.qty}: {option.option_value}{% endfor %}\n--\n{% endfor %}', '<p>\n	A new order has been received by the system.</p>\n<p>\n	<strong>Summary</strong></p>\n<p>\n	Order Form: {order.order_form_name}<br />\n	Order Number: {order.order_number}<br />\n	Status: {order.status}<br />\n	Amount: {invoice.total} {order.currency}<br />\n    IP Address: {order.ip_address}{% if order.fraud_status !=\"\" %}<br />\n	Fraud Status: {order.fraud_status}{% endif %}</p>\n<p>\n	<strong>Client Details</strong></p>\n<p>\n	{order.client_id_code}<br />\n	{order.client_first_name} {order.client_last_name}<br />\n	{order.client_company}<br />\n	{order.client_address1}<br />\n	{order.client_email}</p>\n<p>\n	<strong>Items Ordered</strong></p>\n<p>\n	{% for item in services %}{item.package.name}<br />\n	{item.name}{% for option in item.options %}<br />\n	{option.option_label} x{option.qty}: {option.option_value}{% endfor %}</p>\n<p>\n	--<br />\n	{% endfor %}</p>\n', NULL, 1, 'active'),
(38, 38, 1, 'en_us', 'sales@blestadev1.hexonet.net', 'Blesta Order System', 'An order has been received', 'Order Form: {order.order_form_name}\nOrder Number: {order.order_number}\nStatus: {order.status}\nAmount: {invoice.total} {order.currency}\nIP Address: {order.ip_address}{% if order.fraud_status !=\"\" %}\nFraud Status: {order.fraud_status}{% endif %}\n\nClient Details\n\n{order.client_id_code}\n{order.client_first_name} {order.client_last_name}\n{order.client_company}\n{order.client_address1}\n{order.client_email}\n\nItems Ordered\n\n{% for item in services %}{item.package.name}\n{item.name}{% for option in item.options %}\n{option.option_label} x{option.qty}: {option.option_value}{% endfor %}\n--\n{% endfor %}\n', '<p>\n	<strong>Summary</strong></p>\n<p>\n	Order Form: {order.order_form_name}<br />\n	Order Number: {order.order_number}<br />\n	Status: {order.status}<br />\n	Amount: {invoice.total} {order.currency}<br />\n    IP Address: {order.ip_address}{% if order.fraud_status !=\"\" %}<br />\n	Fraud Status: {order.fraud_status}{% endif %}</p>\n<p>\n	<strong>Client Details</strong></p>\n<p>\n	{order.client_id_code}<br />\n	{order.client_first_name} {order.client_last_name}<br />\n	{order.client_company}<br />\n	{order.client_address1}<br />\n	{order.client_email}</p>\n<p>\n	<strong>Items Ordered</strong></p>\n<p>\n	{% for item in services %}{item.package.name}<br />\n	{item.name}{% for option in item.options %}<br />\n	{option.option_label} x{option.qty}: {option.option_value}{% endfor %}<br />\n	--<br />\n	{% endfor %}</p>\n', NULL, 1, 'active'),
(39, 39, 1, 'en_us', 'sales@blestadev1.hexonet.net', 'Blesta Order System', 'Affiliate Payout Request', 'Hello {staff.first_name},\nA payout request has been made by {client.first_name} {client.last_name} (#{affiliate.id}) in the amount of {payout.requested_amount | currency_format payout.requested_currency}.\n', '<p>Hello {staff.first_name},</p>\n<p>A payout request has been made by {client.first_name} {client.last_name} (#{affiliate.id}) in the amount of {payout.requested_amount | currency_format payout.requested_currency}.</p>\n', NULL, 1, 'active'),
(40, 40, 1, 'en_us', 'sales@blestadev1.hexonet.net', 'Blesta Order System', 'Affiliate Payout Request Received', 'Hello {client.first_name},\nYour affiliate payout request for {payout.requested_amount | currency_format payout.requested_currency} has been received by staff and is currently under review.\n', '<p>Hello {client.first_name},</p>\n<p>Your affiliate payout request for {payout.requested_amount | currency_format payout.requested_currency} has been received by staff and is currently under review.</p>\n', NULL, 1, 'active'),
(41, 41, 1, 'en_us', 'sales@blestadev1.hexonet.net', 'Blesta Order System', 'Monthly Affiliate Report', 'Hello {client.first_name},\nThis is your monthly affiliate report.\n\nTotal visitors referred: {affiliate.visits}\nCurrent earnings: {affiliate.meta.total_available | currency_format affiliate.meta.withdrawal_currency}\nAmount withdrawn: {affiliate.meta.total_withdrawn | currency_format affiliate.meta.withdrawal_currency}\n\nNew referrals this month\n{% if signups %}\n{% for referral in referrals %}\n\n----\n\nService: {referral.name}\nSign-up Date: {referral.date_added | date date_format}\nAmount: {referral.amount | currency_format referral.currency}\nCommission: {referral.commission | currency_format referral.currency}\nStatus: {referral.status_formatted}\n{% endfor %}\n{% else %}\nYou have not received any sign-ups during this period.\n{% endif %}\n', '<p>Hello {client.first_name},<br />\nThis is your monthly affiliate report.</p>\n\n<p>\nTotal visitors referred: {affiliate.visits}<br />\nCurrent earnings: {affiliate.meta.total_available | currency_format affiliate.meta.withdrawal_currency}<br />\nAmount withdrawn: {affiliate.meta.total_withdrawn | currency_format affiliate.meta.withdrawal_currency}\n</p>\n\n<p>\nNew referrals this month\n</p>\n{% if signups %}\n{% for referral in referrals %}\n<p>\nService: {referral.name}<br />\nSign-up Date: {referral.date_added | date date_format}<br />\nAmount: {referral.amount | currency_format referral.currency}<br />\nCommission: {referral.commission | currency_format referral.currency}<br />\nStatus: {referral.status_formatted}\n</p>\n{% endfor %}\n{% else %}\n<p>\nYou have not received any sign-ups during this period.\n</p>\n{% endif %}', NULL, 1, 'active'),
(42, 42, 1, 'en_us', 'sales@blestadev1.hexonet.net', 'Blesta Order System', 'Abandoned Order (1st)', 'Hello {client.first_name},\n        \nWe noticed you left the following items in your cart:\n\n{% for item in services %}{item.package.name}\n{item.name}{% for option in item.options %}\n{option.option_label} x{option.qty}: {option.option_value}{% endfor %}\n--\n{% endfor %}\n\nWould you like to resume your order? Pay Now: http://{payment_url} (No Login Required)', '<p>Hello {client.first_name},</p>\n\n<p>  \nWe noticed you left the following items in your cart:\n</p>\n\n<p>\n	{% for item in services %}{item.package.name}<br />\n	{item.name}{% for option in item.options %}<br />\n	{option.option_label} x{option.qty}: {option.option_value}{% endfor %}<br />\n	--<br />\n	{% endfor %}\n</p>\n\n<p>\nWould you like to resume your order? <a href=\"http://{payment_url}\">Pay Now</a> (No Login Required)\n</p>', NULL, 1, 'active'),
(43, 43, 1, 'en_us', 'sales@blestadev1.hexonet.net', 'Blesta Order System', 'Abandoned Order (2nd)', 'Hello {client.first_name},\n        \nWe noticed you left the following items in your cart:\n\n{% for item in services %}{item.package.name}\n{item.name}{% for option in item.options %}\n{option.option_label} x{option.qty}: {option.option_value}{% endfor %}\n--\n{% endfor %}\n\nWould you like to resume your order? Pay Now: http://{payment_url} (No Login Required)', '<p>Hello {client.first_name},</p>\n\n<p>  \nWe noticed you left the following items in your cart:\n</p>\n\n<p>\n	{% for item in services %}{item.package.name}<br />\n	{item.name}{% for option in item.options %}<br />\n	{option.option_label} x{option.qty}: {option.option_value}{% endfor %}<br />\n	--<br />\n	{% endfor %}\n</p>\n\n<p>\nWould you like to resume your order? <a href=\"http://{payment_url}\">Pay Now</a> (No Login Required)\n</p>', NULL, 1, 'active'),
(44, 44, 1, 'en_us', 'sales@blestadev1.hexonet.net', 'Blesta Order System', 'Abandoned Order (3rd)', 'Hello {client.first_name},\n        \nWe noticed you left the following items in your cart:\n\n{% for item in services %}{item.package.name}\n{item.name}{% for option in item.options %}\n{option.option_label} x{option.qty}: {option.option_value}{% endfor %}\n--\n{% endfor %}\n\nWould you like to resume your order? Pay Now: http://{payment_url} (No Login Required)', '<p>Hello {client.first_name},</p>\n\n<p>  \nWe noticed you left the following items in your cart:\n</p>\n\n<p>\n	{% for item in services %}{item.package.name}<br />\n	{item.name}{% for option in item.options %}<br />\n	{option.option_label} x{option.qty}: {option.option_value}{% endfor %}<br />\n	--<br />\n	{% endfor %}\n</p>\n\n<p>\nWould you like to resume your order? <a href=\"http://{payment_url}\">Pay Now</a> (No Login Required)\n</p>', NULL, 1, 'active'),
(45, 45, 1, 'en_us', 'support@blestadev1.hexonet.net', 'Support', 'We have received your ticket', 'We have received your request and someone will be looking at it shortly.', '<p>We have received your request and someone will be looking at it shortly.</p>', NULL, 1, 'active'),
(46, 46, 1, 'en_us', 'support@blestadev1.hexonet.net', 'Support', 'Update to Ticket {ticket_hash_code}', '{ticket.details}\n\n\n--\n\nTo reply to this ticket, be sure to email {ticket.department_email} from the address we sent this notice to. You may also update the ticket in our support area at {update_ticket_url}.', '<p>\n	{ticket.details_html}</p>\n<p>\n	&nbsp;</p>\n<p>\n	--</p>\n<p>\n	To reply to this ticket, be sure to email <a href=\"mailto:{ticket.department_email}\">{ticket.department_email}</a> from the address we sent this notice to. You may also update the ticket in our support area at <a href=\"http://{update_ticket_url}\">{update_ticket_url}</a>.</p>\n', NULL, 1, 'active'),
(47, 47, 1, 'en_us', 'support@blestadev1.hexonet.net', 'Support', 'Support Request Failed', 'Our system received your email, but was unable to process it for one of the following reasons..\n\n1. The email address you sent the message from does not belong to any of our clients and this department only allows existing clients to open tickets.\n\n2. You replied to a ticket notice, and we are unable to determine what ticket number you are responding to.\n\n3. The department you emailed no longer exists.', '<p>\n	Our system received your email, but was unable to process it for one of the following reasons..</p>\n<p>\n	1. The email address you sent the message from does not belong to any of our clients and this department only allows existing clients to open tickets.</p>\n<p>\n	2. You replied to a ticket notice, and we are unable to determine what ticket number you are responding to.</p>\n<p>\n	3. The department you emailed no longer exists.</p>\n', NULL, 1, 'active'),
(48, 48, 1, 'en_us', 'support@blestadev1.hexonet.net', 'Support', 'Update to Ticket {ticket_hash_code}', '{ticket.details}\n\n--\n\nTicket #: {ticket.code}\n\nStatus: {ticket.status_language}\n\nPriority: {ticket.priority_language}\n\nDepartment: {ticket.department_name}\n\n--\n\nTo reply to this ticket, be sure to email {ticket.department_email} from the address we sent this notice to, or you may do so from the Staff interface.', '<p>\n	{ticket.details_html}</p>\n<p>\n	--</p>\n<p>\n	Ticket #: {ticket.code}</p>\n<p>\n	Status: {ticket.status_language}</p>\n<p>\n	Priority: {ticket.priority_language}</p>\n<p>\n	Department: {ticket.department_name}</p>\n<p>\n	--</p>\n<p>\n	To reply to this ticket, be sure to email <a href=\"mailto:{ticket.department_email}\">{ticket.department_email}</a> from the address we sent this notice to, or you may do so from the Staff interface.</p>\n', NULL, 1, 'active'),
(49, 49, 1, 'en_us', 'support@blestadev1.hexonet.net', 'Support', 'Ticket {ticket_hash_code}', '{ticket.details}\n\n--\n\nTicket #: {ticket.code} | Status: {ticket.status_language} | Priority: {ticket.priority_language} | Department: {ticket.department_name}\n', '<p>\n	{ticket.details_html}</p>\n<p>\n	--</p>\n<p>\n	Ticket #: {ticket.code} | Status: {ticket.status_language} | Priority: {ticket.priority_language} | Department: {ticket.department_name}</p>\n<p>\n	&nbsp;</p>\n', NULL, 1, 'active'),
(50, 50, 1, 'en_us', 'support@blestadev1.hexonet.net', 'Support', 'Ticket #{ticket.code} has been assigned to you', '{staff.first_name},\n\nA ticket has been assigned to you.\n\n--\n\nTicket #: {ticket.code} | Status: {ticket.status_language} | Priority: {ticket.priority_language} | Department: {ticket.department_name}\n', '<p>{staff.first_name},</p>\n<p>A ticket has been assigned to you.</p>\n<p>--</p>\n<p>Ticket #: {ticket.code} | Status: {ticket.status_language} | Priority: {ticket.priority_language} | Department: {ticket.department_name}</p>\n', NULL, 1, 'active'),
(51, 51, 1, 'en_us', 'support@blestadev1.hexonet.net', 'Support', 'Ticket #{ticket.code} is waiting for your reply', 'We have not received a reply from you for quite a while, if we do not receive a reply from you soon we will consider the ticket as solved and we will proceed to close it.', '<p>We have not received a reply from you for quite a while, if we do not receive a reply from you soon we will consider the ticket as solved and we will proceed to close it.</p>', NULL, 1, 'active'),
(52, 52, 1, 'en_us', 'support@blestadev1.hexonet.net', 'Support', 'Ticket #{ticket.code} is waiting for your reply', '{staff.first_name},\n\nA ticket is waiting for your reply.\n\n--\n\nTicket #: {ticket.code} | Status: {ticket.status_language} | Priority: {ticket.priority_language} | Department: {ticket.department_name}\n', '<p>{staff.first_name},</p>\n<p>A ticket is waiting for your reply.</p>\n<p>--</p>\n<p>Ticket #: {ticket.code} | Status: {ticket.status_language} | Priority: {ticket.priority_language} | Department: {ticket.department_name}</p>\n', NULL, 1, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `email_groups`
--

CREATE TABLE `email_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `action` varchar(64) NOT NULL,
  `type` enum('client','staff','shared') NOT NULL DEFAULT 'client',
  `notice_type` enum('bcc','to') DEFAULT NULL,
  `plugin_dir` varchar(64) DEFAULT NULL,
  `tags` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `email_groups`
--

INSERT INTO `email_groups` (`id`, `action`, `type`, `notice_type`, `plugin_dir`, `tags`) VALUES
(1, 'payment_cc_approved', 'client', 'bcc', NULL, '{contact.first_name},{contact.last_name},{company.name},{response.transaction_id},{amount},{card_type},{last_four}'),
(2, 'payment_cc_declined', 'client', 'bcc', NULL, '{contact.first_name},{contact.last_name},{company.name},{response.message},{amount},{card_type},{last_four}'),
(3, 'payment_cc_error', 'client', 'bcc', NULL, '{contact.first_name},{contact.last_name},{company.name},{response.message},{amount},{card_type},{last_four}'),
(4, 'payment_ach_approved', 'client', 'bcc', NULL, '{contact.first_name},{contact.last_name},{company.name},{response.transaction_id},{amount},{account_type},{last_four}'),
(5, 'payment_ach_declined', 'client', 'bcc', NULL, '{contact.first_name},{contact.last_name},{company.name},{response.message},{amount},{account_type},{last_four}'),
(6, 'payment_ach_error', 'client', 'bcc', NULL, '{contact.first_name},{contact.last_name},{company.name},{response.message},{amount},{account_type},{last_four}'),
(7, 'payment_manual_approved', 'client', 'bcc', NULL, '{contact.first_name},{contact.last_name},{payment_type},{transaction_id},{amount},{date_added}'),
(8, 'credit_card_expiration', 'client', 'bcc', NULL, '{contact.first_name},{contact.last_name},{last_four},{client_url},{card_type}'),
(9, 'invoice_delivery_unpaid', 'client', 'bcc', NULL, '{contact.first_name},{contact.last_name},{invoices},{autodebit},{client_url},{payment_account.first_name},{payment_account.last_name},{payment_account.account_type},{payment_account.last4}'),
(10, 'invoice_delivery_paid', 'client', 'bcc', NULL, '{contact.first_name},{contact.last_name},{invoices},{autodebit},{client_url},{payment_account.first_name},{payment_account.last_name},{payment_account.account_type},{payment_account.last4}'),
(11, 'invoice_notice_first', 'client', 'bcc', NULL, '{contact.first_name},{contact.last_name},{invoice.id_code},{invoice.date_due_formatted},\r\n{payment_account.first_name},{payment_account.last_name},{payment_account.account_type},{payment_url},{autodebit},{autodebit_date},{autodebit_date_formatted},{client_url}'),
(12, 'invoice_notice_second', 'client', 'bcc', NULL, '{contact.first_name},{contact.last_name},{invoice.id_code},{invoice.date_due_formatted},{payment_account.first_name},{payment_account.last_name},{payment_account.account_type},{payment_url},{autodebit},{autodebit_date},{autodebit_date_formatted},{client_url}'),
(13, 'invoice_notice_third', 'client', 'bcc', NULL, '{contact.first_name},{contact.last_name},{invoice.id_code},{invoice.date_due_formatted},{payment_account.first_name},{payment_account.last_name},{payment_account.account_type},{payment_url},{autodebit},{autodebit_date},{autodebit_date_formatted},{client_url}'),
(14, 'reset_password', 'client', 'bcc', NULL, '{contact.first_name},{contact.last_name},{password_reset_url},{ip_address}'),
(15, 'service_suspension', 'client', 'bcc', NULL, '{contact.first_name},{contact.last_name},{package.name},{service.name},{service.suspension_reason}'),
(16, 'account_welcome', 'client', 'bcc', NULL, '{contact.first_name},{contact.last_name},{company.name},{client_url},{username},{password}'),
(17, 'report_ar', 'staff', 'to', NULL, '{staff.first_name},{staff.last_name},{company.name}'),
(18, 'report_invoice_creation', 'staff', 'to', NULL, '{staff.first_name},{staff.last_name},{company.name}'),
(19, 'service_suspension_error', 'staff', 'to', NULL, '{staff.first_name},{staff.last_name},{client.id_code},{client.first_name},{client.last_name},{client.email},{service.name},{package.name}'),
(20, 'service_unsuspension_error', 'staff', 'to', NULL, '{staff.first_name},{staff.last_name},{client.id_code},{client.first_name},{client.last_name},{client.email},{service.name},{package.name}'),
(21, 'service_cancel_error', 'staff', 'to', NULL, '{staff.first_name},{staff.last_name},{client.id_code},{client.first_name},{client.last_name},{client.email},{service.name},{package.name}'),
(22, 'auto_debit_pending', 'client', 'bcc', NULL, '{contact.first_name},{contact.last_name},{invoice.id_code},{invoice.date_due_formatted},{payment_account.first_name},{payment_account.last_name},{payment_account.account_type},{payment_account.last4},{amount},{amount_formatted},{payment_url},{autodebit_date} {client_url}'),
(23, 'staff_reset_password', 'staff', NULL, NULL, '{staff.first_name},{staff.last_name},{password_reset_url},{ip_address}'),
(24, 'service_creation', 'client', 'bcc', NULL, '{contact.first_name},{contact.last_name},{package.email_html},{package.email_text}'),
(25, 'service_unsuspension', 'client', 'bcc', NULL, '{contact.first_name},{contact.last_name},{package.name},{service.name}'),
(26, 'service_creation_error', 'staff', 'to', NULL, '{staff.first_name},{staff.last_name},{client.id_code},{client.first_name},{client.last_name},{client.email},{service.name},{package.name}'),
(27, 'report_tax_liability', 'staff', 'to', NULL, '{staff.first_name},{staff.last_name},{company.name}'),
(28, 'payment_nonmerchant_approved', 'client', 'bcc', NULL, '{contact.first_name},{contact.last_name},{transaction.amount},{transaction.currency},\n                {transaction.transaction_id},{date_added}'),
(29, 'service_cancellation', 'client', 'bcc', NULL, '{contact.first_name},{contact.last_name},{package.name},{service.name}'),
(30, 'service_renewal_error', 'staff', 'to', NULL, '{staff.first_name},{staff.last_name},{client.id_code},{client.first_name},{client.last_name},\n                {client.email},{service.name},{package.name}'),
(31, 'service_scheduled_cancellation', 'client', 'bcc', NULL, '{contact.first_name},{contact.last_name},{package.name},{service.name},{service.date_canceled_formatted}'),
(32, 'forgot_username', 'client', NULL, NULL, '{contact.first_name},{contact.last_name},{username},{ip_address}'),
(33, 'verify_email', 'client', NULL, NULL, '{verification_url},{contact.first_name},{contact.last_name},{username},{ip_address}'),
(34, 'Domains.domain_renewal_1', 'client', NULL, 'domains', '{domain},{service},{contact},{client_uri}'),
(35, 'Domains.domain_renewal_2', 'client', NULL, 'domains', '{domain},{service},{contact},{client_uri}'),
(36, 'Domains.domain_expiration', 'client', NULL, 'domains', '{domain},{service},{contact},{client_uri}'),
(37, 'Order.received', 'staff', NULL, 'order', '{order},{services},{invoice},{client}'),
(38, 'Order.received_mobile', 'staff', NULL, 'order', '{order},{services},{invoice},{client}'),
(39, 'Order.affiliate_payout_request', 'staff', NULL, 'order', '{staff},{client},{affiliate},{payout}'),
(40, 'Order.affiliate_payout_request_received', 'client', NULL, 'order', '{client},{affiliate},{payout}'),
(41, 'Order.affiliate_monthly_report', 'client', NULL, 'order', '{client},{affiliate},{signups},{referrals}'),
(42, 'Order.abandoned_cart_first', 'client', NULL, 'order', '{order},{services},{client},{payment_url}'),
(43, 'Order.abandoned_cart_second', 'client', NULL, 'order', '{order},{services},{client},{payment_url}'),
(44, 'Order.abandoned_cart_third', 'client', NULL, 'order', '{order},{services},{client},{payment_url}'),
(45, 'SupportManager.ticket_received', 'client', NULL, 'support_manager', '{ticket},{ticket_hash_code},{client},{reply_contact},{update_ticket_url}'),
(46, 'SupportManager.ticket_updated', 'client', NULL, 'support_manager', '{ticket},{update_ticket_url},{ticket_hash_code},{client}'),
(47, 'SupportManager.ticket_bounce', 'client', NULL, 'support_manager', ''),
(48, 'SupportManager.staff_ticket_updated', 'staff', NULL, 'support_manager', '{ticket},{ticket_hash_code},{client},{reply_contact}'),
(49, 'SupportManager.staff_ticket_updated_mobile', 'staff', NULL, 'support_manager', '{ticket},{ticket_hash_code},{client},{reply_contact}'),
(50, 'SupportManager.staff_ticket_assigned', 'staff', NULL, 'support_manager', '{ticket},{staff.first_name},{staff.last_name}'),
(51, 'SupportManager.ticket_reminder', 'client', NULL, 'support_manager', '{ticket},{client}'),
(52, 'SupportManager.staff_ticket_reminder', 'staff', NULL, 'support_manager', '{ticket},{staff.first_name},{staff.last_name}');

-- --------------------------------------------------------

--
-- Table structure for table `email_signatures`
--

CREATE TABLE `email_signatures` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL,
  `text` text NOT NULL,
  `html` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `email_signatures`
--

INSERT INTO `email_signatures` (`id`, `company_id`, `name`, `text`, `html`) VALUES
(1, 1, 'Billing', '', ''),
(2, 1, 'Sales', '', ''),
(3, 1, 'Admin', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `email_verifications`
--

CREATE TABLE `email_verifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `contact_id` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT 0,
  `redirect_url` varchar(255) DEFAULT NULL,
  `date_sent` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feed_reader_articles`
--

CREATE TABLE `feed_reader_articles` (
  `id` int(10) UNSIGNED NOT NULL,
  `feed_id` int(10) UNSIGNED NOT NULL,
  `guid` varchar(255) NOT NULL,
  `data` text DEFAULT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `feed_reader_articles`
--

INSERT INTO `feed_reader_articles` (`id`, `feed_id`, `guid`, `data`, `date`) VALUES
(1, 1, 'https://www.blesta.com/2022/11/15/blesta-5.6-beta-released/', 'YTozOntzOjQ6ImxpbmsiO3M6NTk6Imh0dHBzOi8vd3d3LmJsZXN0YS5jb20vMjAyMi8xMS8xNS9ibGVzdGEtNS42LWJldGEtcmVsZWFzZWQvIjtzOjU6InRpdGxlIjtzOjI0OiJCbGVzdGEgNS42IEJldGEgUmVsZWFzZWQiO3M6MTE6ImRlc2NyaXB0aW9uIjtzOjc3OiI8cD5XZSBhcmUgcGxlYXNlZCB0byBhbm5vdW5jZSB0aGF0IEJsZXN0YSA1LjYuMCBCRVRBIDEgaGFzIGJlZW4gcmVsZWFzZWQhPC9wPiI7fQ==', '2022-11-15 20:47:18'),
(2, 1, 'https://www.blesta.com/2022/10/31/blesta-5-5-3-patch-released/', 'YTozOntzOjQ6ImxpbmsiO3M6NjI6Imh0dHBzOi8vd3d3LmJsZXN0YS5jb20vMjAyMi8xMC8zMS9ibGVzdGEtNS01LTMtcGF0Y2gtcmVsZWFzZWQvIjtzOjU6InRpdGxlIjtzOjI3OiJCbGVzdGEgNS41LjMgUGF0Y2ggUmVsZWFzZWQiO3M6MTE6ImRlc2NyaXB0aW9uIjtzOjExNDoiPHA+V2UgYXJlIHBsZWFzZWQgdG8gYW5ub3VuY2UgdGhlIHJlbGVhc2VkIG9mIEJsZXN0YSA1LjUuMywgd2hpY2ggYWRkcmVzc2VzIGJ1Z3MgZGlzY292ZXJlZCBpbiB0aGUgNS41IGJyYW5jaC48L3A+Ijt9', '2022-10-31 17:25:21'),
(3, 1, 'https://www.blesta.com/2022/09/21/blesta-5-5-2-patch-released/', 'YTozOntzOjQ6ImxpbmsiO3M6NjI6Imh0dHBzOi8vd3d3LmJsZXN0YS5jb20vMjAyMi8wOS8yMS9ibGVzdGEtNS01LTItcGF0Y2gtcmVsZWFzZWQvIjtzOjU6InRpdGxlIjtzOjI3OiJCbGVzdGEgNS41LjIgUGF0Y2ggUmVsZWFzZWQiO3M6MTE6ImRlc2NyaXB0aW9uIjtzOjExNDoiPHA+V2UgYXJlIHBsZWFzZWQgdG8gYW5ub3VuY2UgdGhlIHJlbGVhc2VkIG9mIEJsZXN0YSA1LjUuMiwgd2hpY2ggYWRkcmVzc2VzIGJ1Z3MgZGlzY292ZXJlZCBpbiB0aGUgNS41IGJyYW5jaC48L3A+Ijt9', '2022-09-21 17:25:21'),
(4, 1, 'https://www.blesta.com/2022/08/23/blesta-5-5-1-patch-released/', 'YTozOntzOjQ6ImxpbmsiO3M6NjI6Imh0dHBzOi8vd3d3LmJsZXN0YS5jb20vMjAyMi8wOC8yMy9ibGVzdGEtNS01LTEtcGF0Y2gtcmVsZWFzZWQvIjtzOjU6InRpdGxlIjtzOjI3OiJCbGVzdGEgNS41LjEgUGF0Y2ggUmVsZWFzZWQiO3M6MTE6ImRlc2NyaXB0aW9uIjtzOjExNDoiPHA+V2UgYXJlIHBsZWFzZWQgdG8gYW5ub3VuY2UgdGhlIHJlbGVhc2VkIG9mIEJsZXN0YSA1LjUuMSwgd2hpY2ggYWRkcmVzc2VzIGJ1Z3MgZGlzY292ZXJlZCBpbiB0aGUgNS41IGJyYW5jaC48L3A+Ijt9', '2022-08-23 17:25:21'),
(5, 1, 'https://www.blesta.com/2022/08/09/blesta-5.5-released/', 'YTozOntzOjQ6ImxpbmsiO3M6NTQ6Imh0dHBzOi8vd3d3LmJsZXN0YS5jb20vMjAyMi8wOC8wOS9ibGVzdGEtNS41LXJlbGVhc2VkLyI7czo1OiJ0aXRsZSI7czoxOToiQmxlc3RhIDUuNSBSZWxlYXNlZCI7czoxMToiZGVzY3JpcHRpb24iO3M6NDQ0OiJCbGVzdGEgNS41IGlzIG5vdyBhdmFpbGFibGUhIFRoZSBkb21haW4gbWFuYWdlciBjb250aW51ZXMgdG8gZ2V0IHVwZGF0ZXMsIGluY2x1ZGluZyBhIGJ1bGsgVExEIGltcG9ydCB3aXRoIHByaWNpbmcgbWFya3VwLCBhZHZhbmNlZCByZW5ld2FsIG9mIGRvbWFpbnMsIGFuZCBhdXRvbWF0aWMgcHJpY2Ugb3ZlcnJpZGVzIGZvciBkb21haW5zLCBhbmQgYSBuZXcgaW50ZXJuZXQuYnMgcmVnaXN0cmFyIG1vZHVsZS4gV2UgYWxzbyBhZGRlZCBhbiBhYmFuZG9uZWQgb3JkZXIgZmVhdHVyZSwgYW4gb3B0aW9uIHRvIGhpZGUgY2xpZW50IGZpZWxkcyB0aGF0IGFyZSBub3QgcmVxdWlyZWQgb24gYm90aCBvcmRlciBmb3JtcyBhbmQgd2l0aGluIHRoZSBjbGllbnQgYXJlYSwgYWRqdXN0IHRoZSBzdGFydCB2YWx1ZSBhbmQgZm9ybWF0IG9mIGNsaWVudCBJRCZyc3F1bztzLCBhbmQgbW9yZS4iO30=', '2022-08-09 21:10:28'),
(6, 1, 'https://www.blesta.com/2022/06/30/blesta-5.5-beta-released/', 'YTozOntzOjQ6ImxpbmsiO3M6NTk6Imh0dHBzOi8vd3d3LmJsZXN0YS5jb20vMjAyMi8wNi8zMC9ibGVzdGEtNS41LWJldGEtcmVsZWFzZWQvIjtzOjU6InRpdGxlIjtzOjI0OiJCbGVzdGEgNS41IEJldGEgUmVsZWFzZWQiO3M6MTE6ImRlc2NyaXB0aW9uIjtzOjc3OiI8cD5XZSBhcmUgcGxlYXNlZCB0byBhbm5vdW5jZSB0aGF0IEJsZXN0YSA1LjUuMCBCRVRBIDEgaGFzIGJlZW4gcmVsZWFzZWQhPC9wPiI7fQ==', '2022-06-30 20:47:18'),
(7, 1, 'https://www.blesta.com/2022/05/25/blesta-5-4-1-patch-released/', 'YTozOntzOjQ6ImxpbmsiO3M6NjI6Imh0dHBzOi8vd3d3LmJsZXN0YS5jb20vMjAyMi8wNS8yNS9ibGVzdGEtNS00LTEtcGF0Y2gtcmVsZWFzZWQvIjtzOjU6InRpdGxlIjtzOjI3OiJCbGVzdGEgNS40LjEgUGF0Y2ggUmVsZWFzZWQiO3M6MTE6ImRlc2NyaXB0aW9uIjtzOjExNDoiPHA+V2UgYXJlIHBsZWFzZWQgdG8gYW5ub3VuY2UgdGhlIHJlbGVhc2VkIG9mIEJsZXN0YSA1LjQuMSwgd2hpY2ggYWRkcmVzc2VzIGJ1Z3MgZGlzY292ZXJlZCBpbiB0aGUgNS40IGJyYW5jaC48L3A+Ijt9', '2022-05-25 17:25:21'),
(8, 1, 'https://www.blesta.com/2022/05/04/blesta-5.4-released/', 'YTozOntzOjQ6ImxpbmsiO3M6NTQ6Imh0dHBzOi8vd3d3LmJsZXN0YS5jb20vMjAyMi8wNS8wNC9ibGVzdGEtNS40LXJlbGVhc2VkLyI7czo1OiJ0aXRsZSI7czoxOToiQmxlc3RhIDUuNCBSZWxlYXNlZCI7czoxMToiZGVzY3JpcHRpb24iO3M6NDkyOiI8cD5CbGVzdGEgNS40IGlzIG5vdyBhdmFpbGFibGUhIFRoaXMgcmVsZWFzZSBoYXMgYWRkaXRpb25hbCBpbXByb3ZlbWVudHMgdG8gdGhlIGRvbWFpbiBtYW5hZ2VyLCBjdXN0b20gdGlja2V0IGZpZWxkcyBmb3Igc3VwcG9ydCBkZXBhcnRtZW50cywgZGF0YSBmZWVkcyB3aXRoIGVtYmVkIGNvZGVzIGZvciB5b3VyIHdlYnNpdGUgaW5jbHVkaW5nIGEgVExEIHByaWNpbmcgZ3JpZCwgdGhlIGFiaWxpdHkgdG8gbWFudWFsbHkgc2NhbGUgdGhlIHNpemUgb2YgeW91ciBsb2dvIGZvciB0aGUgY2xpZW50IGFyZWEsIGNvbmZpZyBvcHRpb24gb3ZlcnJpZGVzIHRvIGFsbG93IG1vZHVsZSByb3dzIGFuZCBncm91cHMgdG8gYmUgY2hvc2VuIGJ5IHRoZSBjbGllbnQgKGdyZWF0IGZvciBhbGxvd2luZyB0aGUgY2xpZW50IHRvIGNob29zZSB0aGUgbG9jYXRpb24gZm9yIHRoZWlyIGhvc3RpbmcgYWZ0ZXIgc2VsZWN0aW5nIHRoZWlyIHBsYW4pLCBhbmQgbXVjaCBtb3JlITwvcD4iO30=', '2022-05-04 21:10:28'),
(9, 1, 'https://www.blesta.com/2022/04/14/blesta-5.4-beta-released/', 'YTozOntzOjQ6ImxpbmsiO3M6NTk6Imh0dHBzOi8vd3d3LmJsZXN0YS5jb20vMjAyMi8wNC8xNC9ibGVzdGEtNS40LWJldGEtcmVsZWFzZWQvIjtzOjU6InRpdGxlIjtzOjI0OiJCbGVzdGEgNS40IEJldGEgUmVsZWFzZWQiO3M6MTE6ImRlc2NyaXB0aW9uIjtzOjc3OiI8cD5XZSBhcmUgcGxlYXNlZCB0byBhbm5vdW5jZSB0aGF0IEJsZXN0YSA1LjQuMCBCRVRBIDEgaGFzIGJlZW4gcmVsZWFzZWQhPC9wPiI7fQ==', '2022-04-14 20:47:18'),
(10, 1, 'https://www.blesta.com/2022/04/01/wordpress-manager-blesta-integration/', 'YTozOntzOjQ6ImxpbmsiO3M6NzE6Imh0dHBzOi8vd3d3LmJsZXN0YS5jb20vMjAyMi8wNC8wMS93b3JkcHJlc3MtbWFuYWdlci1ibGVzdGEtaW50ZWdyYXRpb24vIjtzOjU6InRpdGxlIjtzOjM4OiJGZWF0dXJlZCBFeHRlbnNpb24gLSBXb3JkUHJlc3MgTWFuYWdlciI7czoxMToiZGVzY3JpcHRpb24iO3M6NDk1OiJPdXIgZnJpZW5kcyBvdmVyIGF0IFNvZnRhY3Vsb3VzIGhhdmUgcmVsZWFzZWQgYSBuZXcgcGx1Z2luIGZvciBCbGVzdGEgY2FsbGVkIFdvcmRQcmVzcyBNYW5hZ2VyIGJ5IFNvZnRhY3Vsb3VzLiBXaGF0IGRvZXMgdGhlIFdvcmRQcmVzcyBNYW5hZ2VyIHBsdWdpbiBkbz8gVGhlIHBsdWdpbiBhbGxvd3MgY2xpZW50cyB0byBtYW5hZ2UgdGhlaXIgV29yZFByZXNzIGluc3RhbGxhdGlvbnMgZGlyZWN0bHkgZnJvbSB3aXRoaW4gQmxlc3RhLCB1bmRlciB0aGUgJmxkcXVvO01hbmFnZSZyZHF1bzsgbGluayBmb3IgdGhlaXIgaG9zdGluZyBzZXJ2aWNlLiBUaGUgY1BhbmVsIG1vZHVsZSBpcyBjdXJyZW50bHkgc3VwcG9ydGVkLCBhbmQgb3RoZXIgc2hhcmVkIGhvc3RpbmcgbW9kdWxlcyB3aWxsIGxpa2VseSBiZSBzdXBwb3J0ZWQgaW4gdGhlIGZ1dHVyZS4gU2NyZWVuc2hvdCBiZWxvdy4gRm9yIG1vcmUgc2NyZWVuc2hvdHMsIHNlZSB0aGUgbWFya2V0cGxhY2UgbGlzdGluZy4iO30=', '2022-04-01 17:25:21'),
(11, 1, 'https://www.blesta.com/2022/03/31/blesta-5-3-2-patch-released/', 'YTozOntzOjQ6ImxpbmsiO3M6NjI6Imh0dHBzOi8vd3d3LmJsZXN0YS5jb20vMjAyMi8wMy8zMS9ibGVzdGEtNS0zLTItcGF0Y2gtcmVsZWFzZWQvIjtzOjU6InRpdGxlIjtzOjI3OiJCbGVzdGEgNS4zLjIgUGF0Y2ggUmVsZWFzZWQiO3M6MTE6ImRlc2NyaXB0aW9uIjtzOjExNDoiPHA+V2UgYXJlIHBsZWFzZWQgdG8gYW5ub3VuY2UgdGhlIHJlbGVhc2VkIG9mIEJsZXN0YSA1LjMuMiwgd2hpY2ggYWRkcmVzc2VzIGJ1Z3MgZGlzY292ZXJlZCBpbiB0aGUgNS4zIGJyYW5jaC48L3A+Ijt9', '2022-03-31 17:25:21'),
(12, 1, 'https://www.blesta.com/2022/03/22/blesta-5-3-1-patch-released/', 'YTozOntzOjQ6ImxpbmsiO3M6NjI6Imh0dHBzOi8vd3d3LmJsZXN0YS5jb20vMjAyMi8wMy8yMi9ibGVzdGEtNS0zLTEtcGF0Y2gtcmVsZWFzZWQvIjtzOjU6InRpdGxlIjtzOjI3OiJCbGVzdGEgNS4zLjEgUGF0Y2ggUmVsZWFzZWQiO3M6MTE6ImRlc2NyaXB0aW9uIjtzOjExNDoiPHA+V2UgYXJlIHBsZWFzZWQgdG8gYW5ub3VuY2UgdGhlIHJlbGVhc2VkIG9mIEJsZXN0YSA1LjMuMSwgd2hpY2ggYWRkcmVzc2VzIGJ1Z3MgZGlzY292ZXJlZCBpbiB0aGUgNS4zIGJyYW5jaC48L3A+Ijt9', '2022-03-22 17:25:21'),
(13, 1, 'https://www.blesta.com/2022/02/14/blesta-5.3-released/', 'YTozOntzOjQ6ImxpbmsiO3M6NTQ6Imh0dHBzOi8vd3d3LmJsZXN0YS5jb20vMjAyMi8wMi8xNC9ibGVzdGEtNS4zLXJlbGVhc2VkLyI7czo1OiJ0aXRsZSI7czoxOToiQmxlc3RhIDUuMyBSZWxlYXNlZCI7czoxMToiZGVzY3JpcHRpb24iO3M6NDA5OiI8cD5CbGVzdGEgNS4zIGlzIG5vdyBhdmFpbGFibGUhIFRoZSBkb21haW4gbWFuYWdlciBpbnRyb2R1Y2VkIGluIDUuMSBhbmQgdXBkYXRlZCBpbiA1LjIgaGFzIGJlZW4gdXBkYXRlZCBhZ2FpbiB3aXRoIFRMRCBwcmljaW5nIHN5bmMsIGFuZCBhbiBvZmZpY2lhbCBPcGVuU1JTIHJlZ2lzdHJhciBtb2R1bGUuIFdpZGdldHMgb24gdGhlIGNsaWVudCBkYXNoYm9hcmQgY2FuIG5vdyBiZSBzb3J0ZWQgYW5kIGVuYWJsZWQgb3IgZGlzYWJsZWQsIGp1c3QgbGlrZSBjbGllbnQgY2FyZHMuIFNlcnZpY2VzIGNhbiBub3cgYmUgcHVzaGVkIGZyb20gb25lIGNsaWVudCB0byBhbm90aGVyLCBwYWNrYWdlIGRlc2NyaXB0aW9ucyBjYW4gbm93IGJlIGFkZGVkIHRvIGludm9pY2UgbGluZSBpdGVtcywgYW5kIG11Y2ggbW9yZSE8L3A+Ijt9', '2022-02-14 21:10:28'),
(14, 1, 'https://www.blesta.com/2022/01/27/blesta-5.3-beta-released/', 'YTozOntzOjQ6ImxpbmsiO3M6NTk6Imh0dHBzOi8vd3d3LmJsZXN0YS5jb20vMjAyMi8wMS8yNy9ibGVzdGEtNS4zLWJldGEtcmVsZWFzZWQvIjtzOjU6InRpdGxlIjtzOjI0OiJCbGVzdGEgNS4zIEJldGEgUmVsZWFzZWQiO3M6MTE6ImRlc2NyaXB0aW9uIjtzOjc3OiI8cD5XZSBhcmUgcGxlYXNlZCB0byBhbm5vdW5jZSB0aGF0IEJsZXN0YSA1LjMuMCBCRVRBIDEgaGFzIGJlZW4gcmVsZWFzZWQhPC9wPiI7fQ==', '2022-01-27 20:47:18'),
(15, 1, 'https://www.blesta.com/2021/12/14/blesta-5-2-2-patch-released/', 'YTozOntzOjQ6ImxpbmsiO3M6NjI6Imh0dHBzOi8vd3d3LmJsZXN0YS5jb20vMjAyMS8xMi8xNC9ibGVzdGEtNS0yLTItcGF0Y2gtcmVsZWFzZWQvIjtzOjU6InRpdGxlIjtzOjI3OiJCbGVzdGEgNS4yLjIgUGF0Y2ggUmVsZWFzZWQiO3M6MTE6ImRlc2NyaXB0aW9uIjtzOjExNDoiPHA+V2UgYXJlIHBsZWFzZWQgdG8gYW5ub3VuY2UgdGhlIHJlbGVhc2VkIG9mIEJsZXN0YSA1LjIuMiwgd2hpY2ggYWRkcmVzc2VzIGJ1Z3MgZGlzY292ZXJlZCBpbiB0aGUgNS4yIGJyYW5jaC48L3A+Ijt9', '2021-12-14 17:25:21');

-- --------------------------------------------------------

--
-- Table structure for table `feed_reader_defaults`
--

CREATE TABLE `feed_reader_defaults` (
  `feed_id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `feed_reader_defaults`
--

INSERT INTO `feed_reader_defaults` (`feed_id`, `company_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `feed_reader_feeds`
--

CREATE TABLE `feed_reader_feeds` (
  `id` int(10) UNSIGNED NOT NULL,
  `url` varchar(255) NOT NULL,
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `feed_reader_feeds`
--

INSERT INTO `feed_reader_feeds` (`id`, `url`, `updated`) VALUES
(1, 'http://www.blesta.com/feed/', '2022-11-23 16:36:27');

-- --------------------------------------------------------

--
-- Table structure for table `feed_reader_subscribers`
--

CREATE TABLE `feed_reader_subscribers` (
  `feed_id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `staff_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `feed_reader_subscribers`
--

INSERT INTO `feed_reader_subscribers` (`feed_id`, `company_id`, `staff_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `gateways`
--

CREATE TABLE `gateways` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL,
  `class` varchar(128) NOT NULL,
  `version` varchar(16) NOT NULL,
  `type` enum('merchant','nonmerchant','hybrid') NOT NULL DEFAULT 'merchant'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gateway_currencies`
--

CREATE TABLE `gateway_currencies` (
  `gateway_id` int(10) UNSIGNED NOT NULL,
  `currency` char(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gateway_meta`
--

CREATE TABLE `gateway_meta` (
  `gateway_id` int(10) UNSIGNED NOT NULL,
  `key` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `encrypted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_format` varchar(64) NOT NULL,
  `id_value` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `date_billed` datetime NOT NULL,
  `date_due` datetime NOT NULL,
  `date_closed` datetime DEFAULT NULL,
  `date_autodebit` datetime DEFAULT NULL,
  `autodebit` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `status` enum('active','proforma','draft','void') NOT NULL DEFAULT 'active',
  `subtotal` decimal(19,4) NOT NULL DEFAULT 0.0000,
  `total` decimal(19,4) NOT NULL DEFAULT 0.0000,
  `paid` decimal(19,4) NOT NULL DEFAULT 0.0000,
  `previous_due` decimal(19,4) NOT NULL DEFAULT 0.0000,
  `currency` char(3) NOT NULL DEFAULT 'USD',
  `note_public` text DEFAULT NULL,
  `note_private` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices_recur`
--

CREATE TABLE `invoices_recur` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `term` smallint(5) UNSIGNED NOT NULL DEFAULT 1,
  `period` enum('day','week','month','year') NOT NULL DEFAULT 'month',
  `duration` smallint(5) DEFAULT NULL,
  `currency` char(3) NOT NULL DEFAULT 'USD',
  `autodebit` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `date_renews` datetime NOT NULL,
  `date_last_renewed` datetime DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `note_private` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices_recur_created`
--

CREATE TABLE `invoices_recur_created` (
  `invoice_recur_id` int(10) UNSIGNED NOT NULL,
  `invoice_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_delivery`
--

CREATE TABLE `invoice_delivery` (
  `id` int(10) UNSIGNED NOT NULL,
  `invoice_id` int(10) UNSIGNED NOT NULL,
  `method` varchar(32) NOT NULL,
  `date_sent` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_fields`
--

CREATE TABLE `invoice_fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_group_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_lang` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `type` enum('text','checkbox','select','textarea') NOT NULL DEFAULT 'text',
  `values` text DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_late_fees`
--

CREATE TABLE `invoice_late_fees` (
  `invoice_id` int(10) UNSIGNED NOT NULL,
  `invoice_line_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_lines`
--

CREATE TABLE `invoice_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `invoice_id` int(10) UNSIGNED NOT NULL,
  `service_id` int(10) UNSIGNED DEFAULT NULL,
  `description` text NOT NULL,
  `qty` decimal(19,4) NOT NULL DEFAULT 1.0000,
  `amount` decimal(19,4) NOT NULL DEFAULT 0.0000,
  `order` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_line_taxes`
--

CREATE TABLE `invoice_line_taxes` (
  `line_id` int(10) UNSIGNED NOT NULL,
  `tax_id` int(10) UNSIGNED NOT NULL,
  `cascade` tinyint(1) NOT NULL DEFAULT 0,
  `subtract` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_meta`
--

CREATE TABLE `invoice_meta` (
  `invoice_id` int(10) UNSIGNED NOT NULL,
  `key` varchar(32) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_recur_delivery`
--

CREATE TABLE `invoice_recur_delivery` (
  `id` int(10) UNSIGNED NOT NULL,
  `invoice_recur_id` int(10) UNSIGNED NOT NULL,
  `method` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_recur_lines`
--

CREATE TABLE `invoice_recur_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `invoice_recur_id` int(10) UNSIGNED NOT NULL,
  `description` text NOT NULL,
  `qty` decimal(19,4) NOT NULL DEFAULT 1.0000,
  `amount` decimal(19,4) NOT NULL DEFAULT 0.0000,
  `taxable` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `order` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_recur_values`
--

CREATE TABLE `invoice_recur_values` (
  `invoice_field_id` int(10) UNSIGNED NOT NULL,
  `invoice_recur_id` int(10) UNSIGNED NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_values`
--

CREATE TABLE `invoice_values` (
  `invoice_field_id` int(10) UNSIGNED NOT NULL,
  `invoice_id` int(10) UNSIGNED NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `code` char(5) NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`code`, `company_id`, `name`) VALUES
('en_us', 1, 'English, US');

-- --------------------------------------------------------

--
-- Table structure for table `log_account_access`
--

CREATE TABLE `log_account_access` (
  `id` int(10) UNSIGNED NOT NULL,
  `staff_id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(128) NOT NULL,
  `last_name` varchar(128) NOT NULL,
  `type` enum('ach','cc') NOT NULL,
  `account_type` enum('checking','savings','amex','bc','cup','dc-cb','dc-er','dc-int','dc-uc','disc','ipi','jcb','lasr','maes','mc','solo','switch','visa') NOT NULL,
  `last4` varchar(128) DEFAULT NULL,
  `account_id` int(10) UNSIGNED NOT NULL,
  `date_accessed` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log_client_settings`
--

CREATE TABLE `log_client_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `by_user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `change` text NOT NULL,
  `date_changed` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log_contacts`
--

CREATE TABLE `log_contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `contact_id` int(10) UNSIGNED NOT NULL,
  `change` text NOT NULL,
  `date_changed` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log_cron`
--

CREATE TABLE `log_cron` (
  `run_id` int(10) UNSIGNED NOT NULL,
  `event` varchar(32) NOT NULL,
  `group` varchar(32) NOT NULL,
  `output` mediumtext DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log_emails`
--

CREATE TABLE `log_emails` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `to_client_id` int(10) UNSIGNED DEFAULT NULL,
  `from_staff_id` int(10) UNSIGNED DEFAULT NULL,
  `to_address` varchar(255) NOT NULL,
  `from_address` varchar(255) NOT NULL,
  `from_name` varchar(255) NOT NULL,
  `cc_address` text DEFAULT NULL,
  `subject` varchar(255) NOT NULL,
  `body_text` mediumtext DEFAULT NULL,
  `body_html` mediumtext DEFAULT NULL,
  `sent` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `error` text DEFAULT NULL,
  `date_sent` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log_gateways`
--

CREATE TABLE `log_gateways` (
  `id` int(10) UNSIGNED NOT NULL,
  `staff_id` int(10) UNSIGNED DEFAULT NULL,
  `gateway_id` int(10) UNSIGNED NOT NULL,
  `direction` enum('input','output') NOT NULL DEFAULT 'input',
  `url` text NOT NULL,
  `data` text DEFAULT NULL,
  `date_added` datetime NOT NULL,
  `status` enum('error','success') NOT NULL DEFAULT 'error',
  `group` char(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log_messenger`
--

CREATE TABLE `log_messenger` (
  `id` int(10) UNSIGNED NOT NULL,
  `to_user_id` int(10) UNSIGNED DEFAULT NULL,
  `messenger_id` int(10) UNSIGNED NOT NULL,
  `direction` enum('input','output') NOT NULL,
  `data` mediumtext NOT NULL,
  `date_added` datetime NOT NULL,
  `success` tinyint(1) NOT NULL DEFAULT 0,
  `group` char(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log_modules`
--

CREATE TABLE `log_modules` (
  `id` int(10) UNSIGNED NOT NULL,
  `staff_id` int(10) UNSIGNED DEFAULT NULL,
  `module_id` int(10) UNSIGNED NOT NULL,
  `direction` enum('input','output') NOT NULL DEFAULT 'input',
  `url` text NOT NULL,
  `data` text DEFAULT NULL,
  `date_added` datetime NOT NULL,
  `status` enum('error','success') NOT NULL DEFAULT 'error',
  `group` char(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log_services`
--

CREATE TABLE `log_services` (
  `id` int(10) UNSIGNED NOT NULL,
  `service_id` int(10) UNSIGNED NOT NULL,
  `staff_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('suspended','unsuspended') NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log_transactions`
--

CREATE TABLE `log_transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `staff_id` int(10) UNSIGNED DEFAULT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `change` text NOT NULL,
  `date_changed` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log_users`
--

CREATE TABLE `log_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `date_added` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `result` enum('success','failure') NOT NULL DEFAULT 'failure'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `log_users`
--

INSERT INTO `log_users` (`id`, `user_id`, `ip_address`, `company_id`, `date_added`, `date_updated`, `result`) VALUES
(1, 1, '172.16.238.1', 1, '2022-11-23 16:36:26', '2022-11-23 16:36:33', 'success');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `message_group_id` int(10) NOT NULL,
  `company_id` int(10) NOT NULL,
  `type` enum('sms') NOT NULL DEFAULT 'sms',
  `status` enum('active','inactive') NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `message_group_id`, `company_id`, `type`, `status`) VALUES
(1, 1, 1, 'sms', 'inactive'),
(2, 2, 1, 'sms', 'inactive'),
(3, 3, 1, 'sms', 'inactive'),
(4, 4, 1, 'sms', 'inactive'),
(5, 5, 1, 'sms', 'inactive'),
(6, 6, 1, 'sms', 'inactive'),
(7, 7, 1, 'sms', 'inactive'),
(8, 8, 1, 'sms', 'inactive'),
(9, 9, 1, 'sms', 'inactive'),
(10, 10, 1, 'sms', 'inactive'),
(11, 11, 1, 'sms', 'inactive'),
(12, 12, 1, 'sms', 'active'),
(13, 13, 1, 'sms', 'active'),
(14, 14, 1, 'sms', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `message_content`
--

CREATE TABLE `message_content` (
  `message_id` int(10) NOT NULL,
  `lang` varchar(5) NOT NULL,
  `content` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `message_content`
--

INSERT INTO `message_content` (`message_id`, `lang`, `content`) VALUES
(1, 'en_us', 'Hi {contact.first_name}!\nThank you for registering with us. Please login and change your password.\nLogin at http://{client_url}login/ with:\nU: {username}\nP: (Password you signed up with)\nThank you for choosing {company.name}!'),
(2, 'en_us', 'Hi {contact.first_name}, payment will be charged to your account on {autodebit_date} in the amount of {amount_formatted} for invoice #{invoice.id_code}.\n{% if payment_account.account_type == \"ach\" %}Your {payment_account.type_name} Account ending in {payment_account.last4} will be processed on this date. To alter the payment method, please login at http://\\{client_uri}.{% else %}Your {payment_account.type_name} ending in {payment_account.last4} will be processed on this date. To alter the payment method, please login at http://{client_uri}.{% endif %} To disable automatic payments login to your account at http://{client_uri}.\nThank you for your continued business!'),
(3, 'en_us', 'Hi {contact.first_name},\nThis is a reminder that invoice #{invoice.id_code} is due on {invoice.date_due_formatted}. If you have recently mailed in payment for this invoice, you can ignore this reminder.\nPay Now. http://{payment_url} (No Login Required)\nThank you for your continued business!'),
(4, 'en_us', 'Hi {contact.first_name},\nThis is the 2nd notice we have sent regarding invoice #{invoice.id_code}. It was due on {invoice.date_due_formatted} and is now past due. If you have recently mailed in payment for this invoice, you can ignore this email.\nPay Now. http://{payment_url} (No login required)'),
(5, 'en_us', 'Hi {contact.first_name},\nThis is the 3rd notice we have sent regarding invoice #{invoice.id_code}. It was due on {invoice.date_due_formatted} and is now past due. This is the last notice we will send regarding this particular invoice. If payment is not received soon, the account may be suspended.\nPay Now. http://{payment_url} (No login required)'),
(6, 'en_us', 'Hi {contact.first_name},\nYour service \"{service.name}\" has been approved and activated.'),
(7, 'en_us', 'Hi {contact.first_name},\nYour service, {package.name} - {service.name}, has been scheduled for cancellation. It will be cancelled on {service.date_canceled_formatted}. If this is in error, please contact us ASAP.'),
(8, 'en_us', 'Hi {contact.first_name},\nYour service, {package.name} - {service.name} has been suspended. This is most commonly in response to 1) Non-payment 2) TOS or abuse violation.\nSuspended service may be cancelled after an extended period. Please contact us if you have any questions.'),
(9, 'en_us', 'Hi {contact.first_name},\nYour service, {package.name} - {service.name} has been unsuspended.'),
(10, 'en_us', 'Hi {contact.first_name},\nAn invoice has been created for your account.\n{% for invoice in invoices %}\nInvoice #: {invoice.id_code} - {invoice.total} {invoice.currency}\nPay Now, visit http://{invoice.payment_url} (No login required)\n{% endfor %}'),
(11, 'en_us', 'Hi {contact.first_name},\nAn invoice has been created for your account.\n{% for invoice in invoices %}\nInvoice #: {invoice.id_code} - {invoice.total} {invoice.currency}\n{% endfor %}\nThis invoice has already been paid, so no payment is necessary for this one, but your account may have other balances.'),
(12, 'en_us', 'Order Form: {order.order_form_name}\nOrder Number: {order.order_number}\nStatus: {order.status}\nAmount: {invoice.total} {order.currency}\nIP Address: {order.ip_address}{% if order.fraud_status !=\"\" %}\nFraud Status: {order.fraud_status}{% endif %}\n\nClient Details\n\n{order.client_id_code}\n{order.client_first_name} {order.client_last_name}\n{order.client_company}\n{order.client_address1}\n{order.client_email}\n\nItems Ordered\n\n{% for item in services %}{item.package.name}\n{item.name}{% for option in item.options %}\n{option.option_label} x{option.qty}: {option.option_value}{% endfor %}\n--\n{% endfor %}\n'),
(13, 'en_us', 'Ticket #: {ticket.code}\n        \nA ticket has been updated.\n\nStatus: {ticket.status_language}\nPriority: {ticket.priority_language}\nDepartment: {ticket.department_name}\nDetails: {ticket.details}\n'),
(14, 'en_us', 'Ticket #: {ticket.code}\n\nA ticket has been assigned to you.\n\nStatus: {ticket.status_language}\nPriority: {ticket.priority_language}\nDepartment: {ticket.department_name}\n');

-- --------------------------------------------------------

--
-- Table structure for table `message_groups`
--

CREATE TABLE `message_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `action` varchar(64) NOT NULL,
  `type` enum('client','staff','shared') NOT NULL DEFAULT 'client',
  `plugin_dir` varchar(64) DEFAULT NULL,
  `tags` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `message_groups`
--

INSERT INTO `message_groups` (`id`, `action`, `type`, `plugin_dir`, `tags`) VALUES
(1, 'account_welcome', 'client', NULL, '{contact.first_name} {contact.last_name} {company.name} {client_url} {username} {password}'),
(2, 'auto_debit_pending', 'client', NULL, '{contact.first_name} {contact.last_name} {invoice.id_code} {invoice.date_due_formatted} {payment_account.first_name} {payment_account.last_name} {payment_account.account_type} {payment_account.last4} {amount} {amount_formatted} {payment_url} {autodebit_date} {client_url}'),
(3, 'invoice_notice_first', 'client', NULL, '{contact.first_name} {contact.last_name} {invoice.id_code} {invoice.date_due_formatted} {payment_account.first_name} {payment_account.last_name} {payment_account.account_type} {payment_url} {autodebit} {autodebit_date} {autodebit_date_formatted} {client_url}'),
(4, 'invoice_notice_second', 'client', NULL, '{contact.first_name} {contact.last_name} {invoice.id_code} {invoice.date_due_formatted} {payment_account.first_name} {payment_account.last_name} {payment_account.account_type} {payment_url} {autodebit} {autodebit_date} {autodebit_date_formatted} {client_url}'),
(5, 'invoice_notice_third', 'client', NULL, '{contact.first_name} {contact.last_name} {invoice.id_code} {invoice.date_due_formatted} {payment_account.first_name} {payment_account.last_name} {payment_account.account_type} {payment_url} {autodebit} {autodebit_date} {autodebit_date_formatted} {client_url}'),
(6, 'service_creation', 'client', NULL, '{contact.first_name} {contact.last_name} {service.name}'),
(7, 'service_scheduled_cancellation', 'client', NULL, '{contact.first_name} {contact.last_name} {package.name} {service.name} {service.date_canceled_formatted}'),
(8, 'service_suspension', 'client', NULL, '{contact.first_name} {contact.last_name} {package.name} {service.name} {service.suspension_reason}'),
(9, 'service_unsuspension', 'client', NULL, '{contact.first_name} {contact.last_name} {package.name} {service.name}'),
(10, 'invoice_delivery_unpaid', 'client', NULL, '{contact.first_name} {contact.last_name} {invoices} {autodebit} {client_url} {payment_account.first_name} {payment_account.last_name} {payment_account.account_type} {payment_account.last4}'),
(11, 'invoice_delivery_paid', 'client', NULL, '{contact.first_name} {contact.last_name} {invoices} {autodebit} {client_url} {payment_account.first_name} {payment_account.last_name} {payment_account.account_type} {payment_account.last4}'),
(12, 'Order.received_staff', 'staff', 'order', '{order},{services},{invoice},{client}'),
(13, 'SupportManager.staff_ticket_updated', 'staff', 'support_manager', '{ticket},{ticket_hash_code},{client},{reply_contact}'),
(14, 'SupportManager.staff_ticket_assigned', 'staff', 'support_manager', '{ticket},{staff.first_name},{staff.last_name}');

-- --------------------------------------------------------

--
-- Table structure for table `messengers`
--

CREATE TABLE `messengers` (
  `id` int(10) UNSIGNED NOT NULL,
  `dir` varchar(64) NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL,
  `version` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messenger_meta`
--

CREATE TABLE `messenger_meta` (
  `messenger_id` int(10) UNSIGNED NOT NULL,
  `key` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `serialized` tinyint(1) NOT NULL DEFAULT 0,
  `encrypted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `type_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `name` varchar(128) NOT NULL,
  `class` varchar(128) NOT NULL,
  `version` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `company_id`, `type_id`, `name`, `class`, `version`) VALUES
(1, 1, 1, 'None', 'none', '1.0.0'),
(2, 1, 2, 'Generic Domains', 'generic_domains', '1.1.1');

-- --------------------------------------------------------

--
-- Table structure for table `module_client_meta`
--

CREATE TABLE `module_client_meta` (
  `module_id` int(10) UNSIGNED NOT NULL,
  `module_row_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `client_id` int(10) UNSIGNED NOT NULL,
  `key` varchar(32) NOT NULL,
  `value` text DEFAULT NULL,
  `serialized` tinyint(1) NOT NULL DEFAULT 0,
  `encrypted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `module_groups`
--

CREATE TABLE `module_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `module_id` int(10) UNSIGNED NOT NULL,
  `add_order` varchar(32) DEFAULT NULL,
  `name` varchar(128) NOT NULL,
  `force_limits` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `module_meta`
--

CREATE TABLE `module_meta` (
  `module_id` int(10) UNSIGNED NOT NULL,
  `key` varchar(32) NOT NULL,
  `value` text DEFAULT NULL,
  `serialized` tinyint(1) NOT NULL DEFAULT 0,
  `encrypted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `module_rows`
--

CREATE TABLE `module_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `module_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `module_rows`
--

INSERT INTO `module_rows` (`id`, `module_id`) VALUES
(1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `module_row_groups`
--

CREATE TABLE `module_row_groups` (
  `module_group_id` int(10) UNSIGNED NOT NULL,
  `module_row_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `module_row_meta`
--

CREATE TABLE `module_row_meta` (
  `module_row_id` int(10) UNSIGNED NOT NULL,
  `key` varchar(32) NOT NULL,
  `value` text DEFAULT NULL,
  `serialized` tinyint(1) NOT NULL DEFAULT 0,
  `encrypted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `module_row_meta`
--

INSERT INTO `module_row_meta` (`module_row_id`, `key`, `value`, `serialized`, `encrypted`) VALUES
(1, 'name', 'Generic Module Row', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `module_types`
--

CREATE TABLE `module_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `module_types`
--

INSERT INTO `module_types` (`id`, `name`) VALUES
(1, 'generic'),
(2, 'registrar');

-- --------------------------------------------------------

--
-- Table structure for table `navigation_items`
--

CREATE TABLE `navigation_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `action_id` int(10) UNSIGNED NOT NULL,
  `order` smallint(5) UNSIGNED DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `navigation_items`
--

INSERT INTO `navigation_items` (`id`, `action_id`, `order`, `parent_id`) VALUES
(1, 1, 0, NULL),
(2, 2, 1, NULL),
(3, 3, 2, NULL),
(4, 4, 3, NULL),
(5, 5, 4, NULL),
(6, 1, 5, 1),
(7, 2, 6, 2),
(8, 6, 7, 3),
(9, 7, 8, 3),
(10, 8, 9, 3),
(11, 9, 10, 3),
(12, 10, 11, 3),
(13, 11, 12, 3),
(14, 12, 13, 3),
(15, 4, 14, 4),
(16, 13, 15, 4),
(17, 14, 16, 4),
(18, 15, 17, 5),
(19, 16, 18, 5),
(20, 17, 19, NULL),
(23, 20, 22, NULL),
(24, 21, 23, 5),
(25, 22, 20, NULL),
(26, 22, 21, 25),
(27, 26, 24, NULL),
(28, 28, 25, NULL),
(29, 31, 26, NULL),
(30, 32, 27, NULL),
(31, 34, 28, 3),
(32, 35, 29, NULL),
(33, 36, 30, 4),
(34, 37, 31, NULL),
(35, 38, 32, NULL),
(36, 40, 33, NULL),
(37, 41, 34, 4),
(38, 42, 35, NULL),
(39, 42, 36, 38),
(40, 43, 37, 38),
(41, 44, 38, NULL),
(42, 44, 39, 41),
(43, 45, 40, 41),
(44, 46, 41, 2),
(45, 50, 42, NULL),
(46, 51, 43, 45),
(47, 52, 44, 45),
(48, 53, 45, NULL),
(49, 54, 46, 48),
(50, 55, 47, 48),
(51, 56, 48, NULL),
(52, 57, 49, 51),
(53, 58, 50, 51),
(54, 59, 51, 51),
(55, 60, 52, 51),
(56, 61, 53, 51),
(57, 62, 54, NULL),
(58, 63, 55, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_number` varchar(16) NOT NULL,
  `order_form_id` int(10) UNSIGNED NOT NULL,
  `invoice_id` int(10) UNSIGNED NOT NULL,
  `fraud_report` text DEFAULT NULL,
  `fraud_status` enum('allow','review','reject') DEFAULT NULL,
  `status` enum('pending','accepted','fraud','canceled') NOT NULL DEFAULT 'pending',
  `abandoned_notice` enum('unsent','first','second','third','none') NOT NULL DEFAULT 'none',
  `ip_address` varchar(45) DEFAULT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_affiliates`
--

CREATE TABLE `order_affiliates` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(16) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `date_added` datetime NOT NULL,
  `date_updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_affiliate_company_settings`
--

CREATE TABLE `order_affiliate_company_settings` (
  `company_id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order_affiliate_company_settings`
--

INSERT INTO `order_affiliate_company_settings` (`company_id`, `key`, `value`) VALUES
(1, 'commission_amount', '0'),
(1, 'commission_type', 'percentage'),
(1, 'cookie_tld', '180'),
(1, 'enabled', 'false'),
(1, 'maturity_days', '90'),
(1, 'max_withdrawal_amount', '100'),
(1, 'min_withdrawal_amount', '10'),
(1, 'order_frequency', 'first'),
(1, 'order_recurring', 'false'),
(1, 'signup_content', '<p>We pay commissions for every order placed using your custom\n                    affiliate link by tracking visitors you refer to us using a cookie. The cookie will last up to 180\n                    days following the initial visit, so you will get a commission for the referral even if they do not\n                    sign up immediately. If you have any questions, please contact us, or sign up by clicking the button\n                    below.</p>'),
(1, 'withdrawal_currency', 'USD');

-- --------------------------------------------------------

--
-- Table structure for table `order_affiliate_payment_methods`
--

CREATE TABLE `order_affiliate_payment_methods` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_affiliate_payment_method_names`
--

CREATE TABLE `order_affiliate_payment_method_names` (
  `payment_method_id` int(10) UNSIGNED NOT NULL,
  `lang` varchar(5) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_affiliate_payouts`
--

CREATE TABLE `order_affiliate_payouts` (
  `id` int(10) UNSIGNED NOT NULL,
  `affiliate_id` int(10) UNSIGNED NOT NULL,
  `payment_method_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('pending','approved','declined') NOT NULL DEFAULT 'pending',
  `requested_amount` decimal(19,4) NOT NULL DEFAULT 0.0000,
  `requested_currency` char(3) NOT NULL DEFAULT 'USD',
  `paid_amount` decimal(19,4) DEFAULT NULL,
  `paid_currency` char(3) DEFAULT NULL,
  `date_requested` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_affiliate_referrals`
--

CREATE TABLE `order_affiliate_referrals` (
  `id` int(10) UNSIGNED NOT NULL,
  `affiliate_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` enum('pending','mature','canceled') NOT NULL DEFAULT 'pending',
  `amount` decimal(19,4) NOT NULL DEFAULT 0.0000,
  `currency` char(3) NOT NULL DEFAULT 'USD',
  `commission` decimal(19,4) NOT NULL DEFAULT 0.0000,
  `date_added` datetime NOT NULL,
  `date_updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_affiliate_settings`
--

CREATE TABLE `order_affiliate_settings` (
  `affiliate_id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_affiliate_statistics`
--

CREATE TABLE `order_affiliate_statistics` (
  `id` int(10) UNSIGNED NOT NULL,
  `affiliate_id` int(10) UNSIGNED NOT NULL,
  `visits` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sales` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_forms`
--

CREATE TABLE `order_forms` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `label` varchar(32) NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` text NOT NULL,
  `template` varchar(64) NOT NULL,
  `template_style` varchar(64) NOT NULL,
  `type` varchar(64) NOT NULL,
  `client_group_id` int(10) UNSIGNED NOT NULL,
  `manual_review` tinyint(1) NOT NULL DEFAULT 0,
  `allow_coupons` tinyint(1) NOT NULL DEFAULT 0,
  `require_ssl` tinyint(1) NOT NULL DEFAULT 0,
  `require_captcha` tinyint(1) NOT NULL DEFAULT 0,
  `require_tos` tinyint(1) NOT NULL DEFAULT 0,
  `tos_url` varchar(255) DEFAULT NULL,
  `abandoned_cart_first` smallint(5) DEFAULT NULL,
  `abandoned_cart_second` smallint(5) DEFAULT NULL,
  `abandoned_cart_third` smallint(5) DEFAULT NULL,
  `abandoned_cart_cancellation` smallint(5) DEFAULT NULL,
  `inactive_after_cancellation` tinyint(1) NOT NULL DEFAULT 0,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `visibility` enum('public','shared','client') NOT NULL DEFAULT 'shared',
  `date_added` datetime NOT NULL,
  `order` smallint(5) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_form_currencies`
--

CREATE TABLE `order_form_currencies` (
  `order_form_id` int(10) UNSIGNED NOT NULL,
  `currency` char(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_form_gateways`
--

CREATE TABLE `order_form_gateways` (
  `order_form_id` int(10) UNSIGNED NOT NULL,
  `gateway_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_form_groups`
--

CREATE TABLE `order_form_groups` (
  `order_form_id` int(10) UNSIGNED NOT NULL,
  `package_group_id` int(10) UNSIGNED NOT NULL,
  `order` smallint(5) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_form_meta`
--

CREATE TABLE `order_form_meta` (
  `order_form_id` int(10) UNSIGNED NOT NULL,
  `key` varchar(32) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_services`
--

CREATE TABLE `order_services` (
  `order_id` int(10) UNSIGNED NOT NULL,
  `service_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_settings`
--

CREATE TABLE `order_settings` (
  `company_id` int(10) UNSIGNED NOT NULL,
  `key` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `encrypted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_staff_settings`
--

CREATE TABLE `order_staff_settings` (
  `staff_id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `key` varchar(32) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_format` varchar(64) NOT NULL,
  `id_value` int(10) UNSIGNED NOT NULL,
  `module_id` int(10) UNSIGNED DEFAULT NULL,
  `qty` int(10) UNSIGNED DEFAULT NULL,
  `client_qty` int(10) UNSIGNED DEFAULT NULL,
  `module_row` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `module_group` int(10) UNSIGNED DEFAULT NULL,
  `taxable` tinyint(1) NOT NULL DEFAULT 0,
  `single_term` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `status` enum('active','inactive','restricted') NOT NULL DEFAULT 'active',
  `hidden` tinyint(1) DEFAULT 0,
  `company_id` int(10) UNSIGNED NOT NULL,
  `prorata_day` tinyint(3) UNSIGNED DEFAULT NULL,
  `prorata_cutoff` tinyint(3) UNSIGNED DEFAULT NULL,
  `upgrades_use_renewal` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `override_price` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `id_format`, `id_value`, `module_id`, `qty`, `client_qty`, `module_row`, `module_group`, `taxable`, `single_term`, `status`, `hidden`, `company_id`, `prorata_day`, `prorata_cutoff`, `upgrades_use_renewal`, `override_price`) VALUES
(1, '{num}', 1, 2, NULL, NULL, 1, NULL, 0, 0, 'inactive', 1, 1, NULL, NULL, 1, 0),
(2, '{num}', 2, 2, NULL, NULL, 1, NULL, 0, 0, 'inactive', 1, 1, NULL, NULL, 1, 0),
(3, '{num}', 3, 2, NULL, NULL, 1, NULL, 0, 0, 'inactive', 1, 1, NULL, NULL, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `package_descriptions`
--

CREATE TABLE `package_descriptions` (
  `package_id` int(10) UNSIGNED NOT NULL,
  `lang` varchar(5) NOT NULL,
  `html` mediumtext DEFAULT NULL,
  `text` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `package_emails`
--

CREATE TABLE `package_emails` (
  `package_id` int(10) UNSIGNED NOT NULL,
  `lang` char(5) NOT NULL,
  `html` mediumtext DEFAULT NULL,
  `text` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `package_emails`
--

INSERT INTO `package_emails` (`package_id`, `lang`, `html`, `text`) VALUES
(1, 'en_us', '<p>Your new domain is being processed and will be registered soon!</p>\n<p>Domain: {service.domain}</p>\n<p>Thank you for your business!</p>', 'Your new domain is being processed and will be registered soon!\n\nDomain: {service.domain}\n\nThank you for your business!'),
(2, 'en_us', '<p>Your new domain is being processed and will be registered soon!</p>\n<p>Domain: {service.domain}</p>\n<p>Thank you for your business!</p>', 'Your new domain is being processed and will be registered soon!\n\nDomain: {service.domain}\n\nThank you for your business!'),
(3, 'en_us', '<p>Your new domain is being processed and will be registered soon!</p>\n<p>Domain: {service.domain}</p>\n<p>Thank you for your business!</p>', 'Your new domain is being processed and will be registered soon!\n\nDomain: {service.domain}\n\nThank you for your business!');

-- --------------------------------------------------------

--
-- Table structure for table `package_group`
--

CREATE TABLE `package_group` (
  `package_id` int(10) UNSIGNED NOT NULL,
  `package_group_id` int(10) UNSIGNED NOT NULL,
  `order` smallint(5) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `package_group`
--

INSERT INTO `package_group` (`package_id`, `package_group_id`, `order`) VALUES
(1, 1, 0),
(2, 1, 0),
(3, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `package_groups`
--

CREATE TABLE `package_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` enum('standard','addon') NOT NULL DEFAULT 'standard',
  `hidden` tinyint(1) DEFAULT 0,
  `company_id` int(10) UNSIGNED NOT NULL,
  `allow_upgrades` tinyint(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `package_groups`
--

INSERT INTO `package_groups` (`id`, `type`, `hidden`, `company_id`, `allow_upgrades`) VALUES
(1, 'standard', 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `package_group_descriptions`
--

CREATE TABLE `package_group_descriptions` (
  `package_group_id` int(10) UNSIGNED NOT NULL,
  `lang` varchar(5) NOT NULL,
  `description` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `package_group_descriptions`
--

INSERT INTO `package_group_descriptions` (`package_group_id`, `lang`, `description`) VALUES
(1, 'en_us', 'A package group for hiding and managing all the TLD pricing packages');

-- --------------------------------------------------------

--
-- Table structure for table `package_group_names`
--

CREATE TABLE `package_group_names` (
  `package_group_id` int(10) UNSIGNED NOT NULL,
  `lang` varchar(5) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `package_group_names`
--

INSERT INTO `package_group_names` (`package_group_id`, `lang`, `name`) VALUES
(1, 'en_us', 'TLDs Pricing Packages');

-- --------------------------------------------------------

--
-- Table structure for table `package_group_parents`
--

CREATE TABLE `package_group_parents` (
  `group_id` int(10) UNSIGNED NOT NULL,
  `parent_group_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `package_meta`
--

CREATE TABLE `package_meta` (
  `package_id` int(10) UNSIGNED NOT NULL,
  `key` varchar(32) NOT NULL,
  `value` text DEFAULT NULL,
  `serialized` tinyint(1) NOT NULL DEFAULT 0,
  `encrypted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `package_meta`
--

INSERT INTO `package_meta` (`package_id`, `key`, `value`, `serialized`, `encrypted`) VALUES
(1, 'epp_code', '0', 0, 0),
(1, 'tlds', 'a:1:{i:0;s:4:\".com\";}', 1, 0),
(1, 'type', 'domain', 0, 0),
(2, 'epp_code', '0', 0, 0),
(2, 'tlds', 'a:1:{i:0;s:4:\".net\";}', 1, 0),
(2, 'type', 'domain', 0, 0),
(3, 'epp_code', '0', 0, 0),
(3, 'tlds', 'a:1:{i:0;s:4:\".org\";}', 1, 0),
(3, 'type', 'domain', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `package_names`
--

CREATE TABLE `package_names` (
  `package_id` int(10) UNSIGNED NOT NULL,
  `lang` varchar(5) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `package_names`
--

INSERT INTO `package_names` (`package_id`, `lang`, `name`) VALUES
(1, 'en_us', '.com'),
(2, 'en_us', '.net'),
(3, 'en_us', '.org');

-- --------------------------------------------------------

--
-- Table structure for table `package_option`
--

CREATE TABLE `package_option` (
  `package_id` int(10) UNSIGNED NOT NULL,
  `option_group_id` int(10) UNSIGNED NOT NULL,
  `order` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `package_options`
--

CREATE TABLE `package_options` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `label` varchar(128) NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `type` enum('checkbox','radio','select','quantity','text','textarea','password') NOT NULL DEFAULT 'select',
  `addable` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `editable` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `hidden` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `package_options`
--

INSERT INTO `package_options` (`id`, `company_id`, `label`, `name`, `description`, `type`, `addable`, `editable`, `hidden`) VALUES
(1, 1, 'Email Forwarding', 'email_forwarding', NULL, 'checkbox', 1, 1, 1),
(2, 1, 'DNS Management', 'dns_management', NULL, 'checkbox', 1, 1, 1),
(3, 1, 'ID Protection', 'id_protection', NULL, 'checkbox', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `package_option_conditions`
--

CREATE TABLE `package_option_conditions` (
  `id` int(10) UNSIGNED NOT NULL,
  `condition_set_id` int(10) UNSIGNED NOT NULL,
  `trigger_option_id` int(10) UNSIGNED NOT NULL,
  `operator` enum('>','<','=','!=','in','notin') NOT NULL DEFAULT '=',
  `value` varchar(255) DEFAULT NULL,
  `value_id` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `package_option_condition_sets`
--

CREATE TABLE `package_option_condition_sets` (
  `id` int(10) UNSIGNED NOT NULL,
  `option_group_id` int(10) UNSIGNED NOT NULL,
  `option_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `package_option_condition_set_values`
--

CREATE TABLE `package_option_condition_set_values` (
  `condition_set_id` int(10) UNSIGNED NOT NULL,
  `value_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `package_option_group`
--

CREATE TABLE `package_option_group` (
  `option_id` int(10) UNSIGNED NOT NULL,
  `option_group_id` int(10) UNSIGNED NOT NULL,
  `order` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `package_option_group`
--

INSERT INTO `package_option_group` (`option_id`, `option_group_id`, `order`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `package_option_groups`
--

CREATE TABLE `package_option_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` text DEFAULT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT 0,
  `hide_options` tinyint(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `package_option_groups`
--

INSERT INTO `package_option_groups` (`id`, `company_id`, `name`, `description`, `hidden`, `hide_options`) VALUES
(1, 1, 'Email Forwarding', 'Create email addresses at your domain that forward to an external email address.', 1, 1),
(2, 1, 'DNS Management', 'Manage the DNS zone for your domain name through name servers we provide. Create and edit records such as A, CNAME, MX, TXT, and more for your domain.', 1, 1),
(3, 1, 'ID Protection', 'All domain names must have valid contact information as part of ICANN rules. This option will hide these details from the public whois, keeping your information private.', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `package_option_pricing`
--

CREATE TABLE `package_option_pricing` (
  `id` int(10) UNSIGNED NOT NULL,
  `option_value_id` int(10) UNSIGNED NOT NULL,
  `pricing_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `package_option_pricing`
--

INSERT INTO `package_option_pricing` (`id`, `option_value_id`, `pricing_id`) VALUES
(11, 1, 14),
(12, 1, 15),
(13, 1, 16),
(14, 1, 17),
(15, 1, 18),
(16, 1, 19),
(17, 1, 20),
(18, 1, 21),
(19, 1, 22),
(20, 1, 23),
(1, 2, 4),
(2, 2, 5),
(3, 2, 6),
(4, 2, 7),
(5, 2, 8),
(6, 2, 9),
(7, 2, 10),
(8, 2, 11),
(9, 2, 12),
(10, 2, 13),
(21, 3, 24),
(22, 3, 25),
(23, 3, 26),
(24, 3, 27),
(25, 3, 28),
(26, 3, 29),
(27, 3, 30),
(28, 3, 31),
(29, 3, 32),
(30, 3, 33);

-- --------------------------------------------------------

--
-- Table structure for table `package_option_values`
--

CREATE TABLE `package_option_values` (
  `id` int(10) UNSIGNED NOT NULL,
  `option_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `default` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `order` smallint(5) UNSIGNED NOT NULL,
  `min` int(10) UNSIGNED DEFAULT NULL,
  `max` int(10) UNSIGNED DEFAULT NULL,
  `step` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `package_option_values`
--

INSERT INTO `package_option_values` (`id`, `option_id`, `name`, `value`, `default`, `status`, `order`, `min`, `max`, `step`) VALUES
(1, 1, 'Enabled', '1', 0, 'active', 0, NULL, NULL, NULL),
(2, 2, 'Enabled', '1', 0, 'active', 0, NULL, NULL, NULL),
(3, 3, 'Enabled', '1', 0, 'active', 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `package_plugins`
--

CREATE TABLE `package_plugins` (
  `package_id` int(10) UNSIGNED NOT NULL,
  `plugin_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `package_pricing`
--

CREATE TABLE `package_pricing` (
  `id` int(10) UNSIGNED NOT NULL,
  `package_id` int(10) UNSIGNED NOT NULL,
  `pricing_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `package_pricing`
--

INSERT INTO `package_pricing` (`id`, `package_id`, `pricing_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `plugin_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `group_id`, `name`, `alias`, `action`, `plugin_id`) VALUES
(1, 1, 'StaffGroups.permissions.admin_main_calendar', 'admin_main', 'calendar', NULL),
(2, 2, 'StaffGroups.permissions.admin_clients_view', 'admin_clients', 'view', NULL),
(3, 2, 'StaffGroups.permissions.admin_clients_add', 'admin_clients', 'add', NULL),
(4, 2, 'StaffGroups.permissions.admin_clients_edit', 'admin_clients', 'edit', NULL),
(5, 2, 'StaffGroups.permissions.admin_clients_invoices', 'admin_clients', 'invoices', NULL),
(6, 2, 'StaffGroups.permissions.admin_clients_viewinvoice', 'admin_clients', 'viewinvoice', NULL),
(7, 2, 'StaffGroups.permissions.admin_clients_createinvoice', 'admin_clients', 'createinvoice', NULL),
(8, 2, 'StaffGroups.permissions.admin_clients_editinvoice', 'admin_clients', 'editinvoice', NULL),
(9, 2, 'StaffGroups.permissions.admin_clients_editrecurinvoice', 'admin_clients', 'editrecurinvoice', NULL),
(12, 2, 'StaffGroups.permissions.admin_clients_transactions', 'admin_clients', 'transactions', NULL),
(13, 2, 'StaffGroups.permissions.admin_clients_edittransaction', 'admin_clients', 'edittransaction', NULL),
(14, 2, 'StaffGroups.permissions.admin_clients_services', 'admin_clients', 'services', NULL),
(15, 2, 'StaffGroups.permissions.admin_clients_addservice', 'admin_clients', 'addservice', NULL),
(16, 2, 'StaffGroups.permissions.admin_clients_editservice', 'admin_clients', 'editservice', NULL),
(17, 2, 'StaffGroups.permissions.admin_clients_deleteservice', 'admin_clients', 'deleteservice', NULL),
(18, 2, 'StaffGroups.permissions.admin_clients_addcontact', 'admin_clients', 'addcontact', NULL),
(19, 2, 'StaffGroups.permissions.admin_clients_editcontact', 'admin_clients', 'editcontact', NULL),
(20, 2, 'StaffGroups.permissions.admin_clients_deletecontact', 'admin_clients', 'deletecontact', NULL),
(21, 2, 'StaffGroups.permissions.admin_clients_quickupdate', 'admin_clients', 'quickupdate', NULL),
(23, 2, 'StaffGroups.permissions.admin_clients_accounts', 'admin_clients', 'accounts', NULL),
(24, 2, 'StaffGroups.permissions.admin_clients_addccaccount', 'admin_clients', 'addccaccount', NULL),
(25, 2, 'StaffGroups.permissions.admin_clients_addachaccount', 'admin_clients', 'addachaccount', NULL),
(26, 2, 'StaffGroups.permissions.admin_clients_editccaccount', 'admin_clients', 'editccaccount', NULL),
(27, 2, 'StaffGroups.permissions.admin_clients_editachaccount', 'admin_clients', 'editachaccount', NULL),
(28, 2, 'StaffGroups.permissions.admin_clients_deleteccaccount', 'admin_clients', 'deleteccaccount', NULL),
(29, 2, 'StaffGroups.permissions.admin_clients_deleteachaccount', 'admin_clients', 'deleteachaccount', NULL),
(30, 2, 'StaffGroups.permissions.admin_clients_notes', 'admin_clients', 'notes', NULL),
(31, 2, 'StaffGroups.permissions.admin_clients_addnote', 'admin_clients', 'addnote', NULL),
(32, 2, 'StaffGroups.permissions.admin_clients_editnote', 'admin_clients', 'editnote', NULL),
(33, 2, 'StaffGroups.permissions.admin_clients_deletenote', 'admin_clients', 'deletenote', NULL),
(34, 2, 'StaffGroups.permissions.admin_clients_packages', 'admin_clients', 'packages', NULL),
(35, 2, 'StaffGroups.permissions.admin_clients_email', 'admin_clients', 'email', NULL),
(36, 2, 'StaffGroups.permissions.admin_clients_emails', 'admin_clients', 'emails', NULL),
(37, 2, 'StaffGroups.permissions.admin_clients_merge', 'admin_clients', 'merge', NULL),
(38, 2, 'StaffGroups.permissions.admin_clients_delete', 'admin_clients', 'delete', NULL),
(39, 2, 'StaffGroups.permissions.admin_clients_loginasclient', 'admin_clients', 'loginasclient', NULL),
(40, 3, 'StaffGroups.permissions.admin_billing_invoices', 'admin_billing', 'invoices', NULL),
(41, 3, 'StaffGroups.permissions.admin_billing_transactions', 'admin_billing', 'transactions', NULL),
(42, 3, 'StaffGroups.permissions.admin_billing_services', 'admin_billing', 'services', NULL),
(44, 3, 'StaffGroups.permissions.admin_billing_printqueue', 'admin_billing', 'printqueue', NULL),
(45, 3, 'StaffGroups.permissions.admin_billing_batch', 'admin_billing', 'batch', NULL),
(46, 4, 'StaffGroups.permissions.admin_packages_groups', 'admin_packages', 'groups', NULL),
(47, 4, 'StaffGroups.permissions.admin_packages_add', 'admin_packages', 'add', NULL),
(48, 4, 'StaffGroups.permissions.admin_packages_edit', 'admin_packages', 'edit', NULL),
(49, 5, 'StaffGroups.permissions.admin_tools_logs', 'admin_tools', 'logs', NULL),
(50, 5, 'StaffGroups.permissions.admin_tools_convert_currency', 'admin_tools', 'convertcurrency', NULL),
(51, 7, 'StaffGroups.permissions.admin_settings_company', 'admin_settings', 'company', NULL),
(52, 7, 'StaffGroups.permissions.admin_company_general_localization', 'admin_company_general', 'localization', NULL),
(53, 7, 'StaffGroups.permissions.admin_company_general_international', 'admin_company_general', 'international', NULL),
(55, 7, 'StaffGroups.permissions.admin_company_general_encryption', 'admin_company_general', 'encryption', NULL),
(56, 7, 'StaffGroups.permissions.admin_company_billing_invoices', 'admin_company_billing', 'invoices', NULL),
(57, 7, 'StaffGroups.permissions.admin_company_billing_customization', 'admin_company_billing', 'customization', NULL),
(58, 7, 'StaffGroups.permissions.admin_company_billing_deliverymethods', 'admin_company_billing', 'deliverymethods', NULL),
(59, 7, 'StaffGroups.permissions.admin_company_billing_notices', 'admin_company_billing', 'notices', NULL),
(60, 7, 'StaffGroups.permissions.admin_company_billing_coupons', 'admin_company_billing', 'coupons', NULL),
(61, 7, 'StaffGroups.permissions.admin_company_modules', 'admin_company_modules', '*', NULL),
(62, 7, 'StaffGroups.permissions.admin_company_modules_manage', 'admin_company_modules', 'manage', NULL),
(63, 7, 'StaffGroups.permissions.admin_company_modules_install', 'admin_company_modules', 'install', NULL),
(64, 7, 'StaffGroups.permissions.admin_company_modules_uninstall', 'admin_company_modules', 'uninstall', NULL),
(65, 7, 'StaffGroups.permissions.admin_company_modules_upgrade', 'admin_company_modules', 'upgrade', NULL),
(66, 7, 'StaffGroups.permissions.admin_company_gateways', 'admin_company_gateways', '*', NULL),
(67, 7, 'StaffGroups.permissions.admin_company_gateways_manage', 'admin_company_gateways', 'manage', NULL),
(68, 7, 'StaffGroups.permissions.admin_company_gateways_install', 'admin_company_gateways', 'install', NULL),
(69, 7, 'StaffGroups.permissions.admin_company_gateways_uninstall', 'admin_company_gateways', 'uninstall', NULL),
(70, 7, 'StaffGroups.permissions.admin_company_gateways_upgrade', 'admin_company_gateways', 'upgrade', NULL),
(73, 7, 'StaffGroups.permissions.admin_company_emails_mail', 'admin_company_emails', 'mail', NULL),
(74, 7, 'StaffGroups.permissions.admin_company_emails_templates', 'admin_company_emails', 'templates', NULL),
(75, 7, 'StaffGroups.permissions.admin_company_emails_signatures', 'admin_company_emails', 'signatures', NULL),
(79, 7, 'StaffGroups.permissions.admin_company_plugins', 'admin_company_plugins', '*', NULL),
(80, 7, 'StaffGroups.permissions.admin_company_groups', 'admin_company_groups', '*', NULL),
(81, 7, 'StaffGroups.permissions.admin_company_plugins_manage', 'admin_company_plugins', 'manage', NULL),
(82, 7, 'StaffGroups.permissions.admin_company_plugins_install', 'admin_company_plugins', 'install', NULL),
(83, 7, 'StaffGroups.permissions.admin_company_plugins_uninstall', 'admin_company_plugins', 'uninstall', NULL),
(84, 7, 'StaffGroups.permissions.admin_company_plugins_upgrade', 'admin_company_plugins', 'upgrade', NULL),
(85, 7, 'StaffGroups.permissions.admin_settings_system', 'admin_settings', 'system', NULL),
(86, 7, 'StaffGroups.permissions.admin_system_general_basic', 'admin_system_general', 'basic', NULL),
(87, 7, 'StaffGroups.permissions.admin_system_general_geoip', 'admin_system_general', 'geoip', NULL),
(88, 7, 'StaffGroups.permissions.admin_system_general_maintenance', 'admin_system_general', 'maintenance', NULL),
(89, 7, 'StaffGroups.permissions.admin_system_general_license', 'admin_system_general', 'license', NULL),
(90, 7, 'StaffGroups.permissions.admin_system_automation', 'admin_system_automation', '*', NULL),
(91, 7, 'StaffGroups.permissions.admin_system_companies', 'admin_system_companies', '*', NULL),
(96, 7, 'StaffGroups.permissions.admin_system_staff_manage', 'admin_system_staff', 'manage', NULL),
(97, 7, 'StaffGroups.permissions.admin_system_staff_groups', 'admin_system_staff', 'groups', NULL),
(98, 7, 'StaffGroups.permissions.admin_system_api', 'admin_system_api', '*', NULL),
(99, 7, 'StaffGroups.permissions.admin_system_upgrade', 'admin_system_upgrade', '*', NULL),
(100, 7, 'StaffGroups.permissions.admin_system_help', 'admin_system_help', '*', NULL),
(101, 7, 'StaffGroups.permissions.admin_system_marketplace', 'admin_system_marketplace', '*', NULL),
(102, 7, 'StaffGroups.permissions.admin_company_general_contacttypes', 'admin_company_general', 'contacttypes', NULL),
(103, 7, 'StaffGroups.permissions.admin_company_general_addcontacttype', 'admin_company_general', 'addcontacttype', NULL),
(104, 7, 'StaffGroups.permissions.admin_company_general_editcontacttype', 'admin_company_general', 'editcontacttype', NULL),
(105, 7, 'StaffGroups.permissions.admin_company_general_deletecontacttype', 'admin_company_general', 'deletecontacttype', NULL),
(106, 7, 'StaffGroups.permissions.admin_company_general_installlanguage', 'admin_company_general', 'installlanguage', NULL),
(107, 7, 'StaffGroups.permissions.admin_company_general_uninstalllanguage', 'admin_company_general', 'uninstalllanguage', NULL),
(109, 7, 'StaffGroups.permissions.admin_company_billing_acceptedtypes', 'admin_company_billing', 'acceptedtypes', NULL),
(110, 7, 'StaffGroups.permissions.admin_system_general_paymenttypes', 'admin_system_general', 'paymenttypes', NULL),
(111, 7, 'StaffGroups.permissions.admin_system_general_addtype', 'admin_system_general', 'addtype', NULL),
(112, 7, 'StaffGroups.permissions.admin_system_general_edittype', 'admin_system_general', 'edittype', NULL),
(113, 7, 'StaffGroups.permissions.admin_system_general_deletetype', 'admin_system_general', 'deletetype', NULL),
(114, 4, 'StaffGroups.permissions.admin_packages_addgroup', 'admin_packages', 'addgroup', NULL),
(115, 4, 'StaffGroups.permissions.admin_packages_editgroup', 'admin_packages', 'editgroup', NULL),
(116, 4, 'StaffGroups.permissions.admin_packages_deletegroup', 'admin_packages', 'deletegroup', NULL),
(117, 4, 'StaffGroups.permissions.admin_package_options', 'admin_package_options', '*', NULL),
(118, 7, 'StaffGroups.permissions.admin_system_staff_add', 'admin_system_staff', 'add', NULL),
(119, 7, 'StaffGroups.permissions.admin_system_staff_edit', 'admin_system_staff', 'edit', NULL),
(120, 7, 'StaffGroups.permissions.admin_system_staff_status', 'admin_system_staff', 'status', NULL),
(121, 7, 'StaffGroups.permissions.admin_system_staff_addgroup', 'admin_system_staff', 'addgroup', NULL),
(122, 7, 'StaffGroups.permissions.admin_system_staff_editgroup', 'admin_system_staff', 'editgroup', NULL),
(123, 7, 'StaffGroups.permissions.admin_system_staff_deletegroup', 'admin_system_staff', 'deletegroup', NULL),
(124, 7, 'StaffGroups.permissions.admin_company_automation', 'admin_company_automation', '*', NULL),
(125, 7, 'StaffGroups.permissions.admin_company_billing_addcoupon', 'admin_company_billing', 'addcoupon', NULL),
(126, 7, 'StaffGroups.permissions.admin_company_billing_editcoupon', 'admin_company_billing', 'editcoupon', NULL),
(127, 7, 'StaffGroups.permissions.admin_company_billing_deletecoupon', 'admin_company_billing', 'deletecoupon', NULL),
(128, 7, 'StaffGroups.permissions.admin_company_currencies', 'admin_company_currencies', '*', NULL),
(129, 7, 'StaffGroups.permissions.admin_company_emails_edittemplate', 'admin_company_emails', 'edittemplate', NULL),
(130, 7, 'StaffGroups.permissions.admin_company_emails_addsignature', 'admin_company_emails', 'addsignature', NULL),
(131, 7, 'StaffGroups.permissions.admin_company_emails_editsignature', 'admin_company_emails', 'editsignature', NULL),
(132, 7, 'StaffGroups.permissions.admin_company_emails_deletesignature', 'admin_company_emails', 'deletesignature', NULL),
(136, 7, 'StaffGroups.permissions.admin_company_taxes', 'admin_company_taxes', '*', NULL),
(137, 7, 'StaffGroups.permissions.admin_system_backup', 'admin_system_backup', '*', NULL),
(138, 7, 'StaffGroups.permissions.admin_company_lookandfeel', 'admin_company_lookandfeel', '*', NULL),
(139, 7, 'StaffGroups.permissions.admin_company_themes', 'admin_company_themes', '*', NULL),
(140, 2, 'StaffGroups.permissions.admin_clients_recordpayment', 'admin_clients', 'recordpayment', NULL),
(141, 2, 'StaffGroups.permissions.admin_clients_makepayment', 'admin_clients', 'makepayment', NULL),
(142, 3, 'StaffGroups.permissions.admin_reports', 'admin_reports', '*', NULL),
(143, 3, 'StaffGroups.permissions.admin_reports_customize', 'admin_reports_customize', '*', NULL),
(144, 2, 'StaffGroups.permissions.admin_clients_service', 'admin_clients_service', '*', NULL),
(145, 4, 'StaffGroups.permissions.admin_packages_delete', 'admin_packages', 'delete', NULL),
(146, 7, 'StaffGroups.permissions.admin_company_general_marketing', 'admin_company_general', 'marketing', NULL),
(147, 7, 'StaffGroups.permissions.admin_company_clientoptions_general', 'admin_company_clientoptions', 'general', NULL),
(148, 7, 'StaffGroups.permissions.admin_company_clientoptions_customfields', 'admin_company_clientoptions', 'customfields', NULL),
(149, 7, 'StaffGroups.permissions.admin_company_clientoptions_requiredfields', 'admin_company_clientoptions', 'requiredfields', NULL),
(150, 7, 'StaffGroups.permissions.admin_company_plugins_settings', 'admin_company_plugins', 'settings', NULL),
(151, 2, 'StaffGroups.permissions.admin_clients_passwordreset', 'admin_clients', 'passwordreset', NULL),
(152, 7, 'StaffGroups.permissions.admin_company_general_smartsearch', 'admin_company_general', 'smartsearch', NULL),
(153, 7, 'StaffGroups.permissions.admin_company_general_humanverification', 'admin_company_general', 'humanverification', NULL),
(154, 7, 'StaffGroups.permissions.admin_company_billing_latefees', 'admin_company_billing', 'latefees', NULL),
(155, 7, 'StaffGroups.permissions.admin_company_lookandfeel_layout', 'admin_company_lookandfeel', 'layout', NULL),
(156, 7, 'StaffGroups.permissions.admin_company_messengers_manage', 'admin_company_messengers', 'manage', NULL),
(157, 7, 'StaffGroups.permissions.admin_company_messengers_install', 'admin_company_messengers', 'install', NULL),
(158, 7, 'StaffGroups.permissions.admin_company_messengers_uninstall', 'admin_company_messengers', 'uninstall', NULL),
(159, 7, 'StaffGroups.permissions.admin_company_messengers_upgrade', 'admin_company_messengers', 'upgrade', NULL),
(160, 7, 'StaffGroups.permissions.admin_company_messengers_configuration', 'admin_company_messengers', 'configuration', NULL),
(161, 7, 'StaffGroups.permissions.admin_company_messengers_templates', 'admin_company_messengers', 'templates', NULL),
(162, 7, 'StaffGroups.permissions.admin_company_messengers_edittemplate', 'admin_company_messengers', 'edittemplate', NULL),
(163, 7, 'StaffGroups.permissions.admin_company_messengers', 'admin_company_messengers', '*', NULL),
(164, 7, 'StaffGroups.permissions.admin_company_emails_mailtest', 'admin_company_emails', 'mailtest', NULL),
(165, 7, 'StaffGroups.permissions.admin_company_lookandfeel_actions', 'admin_company_lookandfeel', 'actions', NULL),
(166, 7, 'StaffGroups.permissions.admin_company_lookandfeel_addaction', 'admin_company_lookandfeel', 'addaction', NULL),
(167, 7, 'StaffGroups.permissions.admin_company_lookandfeel_editaction', 'admin_company_lookandfeel', 'editaction', NULL),
(168, 7, 'StaffGroups.permissions.admin_company_lookandfeel_navigation', 'admin_company_lookandfeel', 'navigation', NULL),
(169, 7, 'StaffGroups.permissions.admin_company_lookandfeel_customize', 'admin_company_lookandfeel', 'customize', NULL),
(170, 5, 'StaffGroups.permissions.admin_tools_utilities', 'admin_tools', 'utilities', NULL),
(171, 7, 'StaffGroups.permissions.admin_company_feeds', 'admin_company_feeds', '*', NULL),
(172, 3, 'System Status', 'system_status.admin_main', 'billing', 2),
(173, 1, 'System Status', 'system_status.admin_main', '*', 2),
(174, 3, 'System Overview', 'system_overview.admin_main', 'billing', 3),
(175, 1, 'System Overview', 'system_overview.admin_main', '*', 3),
(176, 3, 'Billing at a Glance', 'billing_overview.admin_main', '*', 4),
(177, 1, 'Billing at a Glance', 'billing_overview.admin_main', 'dashboard', 4),
(178, 3, 'Feed Reader', 'feed_reader.admin_main', 'billing', 5),
(179, 1, 'Feed Reader', 'feed_reader.admin_main', '*', 5),
(180, 8, 'Domains', 'domains.admin_domains', 'browse', 7),
(181, 8, 'TLD Pricing', 'domains.admin_domains', 'tlds', 7),
(182, 8, 'Registrars', 'domains.admin_domains', 'registrars', 7),
(183, 8, 'Whois', 'domains.admin_domains', 'whois', 7),
(184, 8, 'Configuration', 'domains.admin_domains', 'configuration', 7),
(185, 4, 'Order Forms', 'order.admin_forms', '*', 8),
(186, 3, 'Orders', 'order.admin_main', '*', 8),
(187, 1, 'Orders', 'order.admin_main', 'dashboard', 8),
(188, 9, 'Affiliates', 'order.admin_affiliates', '*', 8),
(189, 9, 'Add Affiliate', 'order.admin_affiliates', 'add', 8),
(190, 9, 'Update Affiliate', 'order.admin_affiliates', 'update', 8),
(191, 9, 'Activate Affiliate', 'order.admin_affiliates', 'activate', 8),
(192, 9, 'Deactivate Affiliate', 'order.admin_affiliates', 'deactivate', 8),
(193, 9, 'Affiliate Settings', 'order.admin_affiliates', 'settings', 8),
(194, 9, 'Payment Methods', 'order.admin_payment_methods', '*', 8),
(195, 9, 'Add Payment Method', 'order.admin_payment_methods', 'add', 8),
(196, 9, 'Edit Payment Method', 'order.admin_payment_methods', 'edit', 8),
(197, 9, 'Delete Payment Method', 'order.admin_payment_methods', 'delete', 8),
(198, 9, 'Payouts', 'order.admin_payouts', '*', 8),
(199, 9, 'Edit Payout', 'order.admin_payouts', 'edit', 8),
(200, 9, 'Approve Payout', 'order.admin_payouts', 'approve', 8),
(201, 9, 'Decline Payout', 'order.admin_payouts', 'decline', 8),
(202, 10, 'Tickets', 'support_manager.admin_tickets', '*', 9),
(203, 10, 'Client Profile Widget', 'support_manager.admin_tickets', 'client', 9),
(204, 10, 'Permanently Delete Tickets', 'support_manager.admin_tickets', 'delete', 9),
(205, 10, 'Departments', 'support_manager.admin_departments', '*', 9),
(206, 10, 'Responses', 'support_manager.admin_responses', '*', 9),
(207, 10, 'Staff', 'support_manager.admin_staff', '*', 9),
(208, 10, 'Knowledge Base', 'support_manager.admin_knowledgebase', '*', 9);

-- --------------------------------------------------------

--
-- Table structure for table `permission_groups`
--

CREATE TABLE `permission_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `level` enum('staff','client') NOT NULL DEFAULT 'staff',
  `alias` varchar(255) NOT NULL,
  `plugin_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permission_groups`
--

INSERT INTO `permission_groups` (`id`, `name`, `level`, `alias`, `plugin_id`) VALUES
(1, 'StaffGroups.permission_group.home', 'staff', 'admin_main', NULL),
(2, 'StaffGroups.permission_group.clients', 'staff', 'admin_clients', NULL),
(3, 'StaffGroups.permission_group.billing', 'staff', 'admin_billing', NULL),
(4, 'StaffGroups.permission_group.packages', 'staff', 'admin_packages', NULL),
(5, 'StaffGroups.permission_group.tools', 'staff', 'admin_tools', NULL),
(6, 'StaffGroups.permission_group.search', 'staff', 'admin_search', NULL),
(7, 'StaffGroups.permission_group.settings', 'staff', 'admin_settings', NULL),
(8, 'Domains', 'staff', 'domains.admin_domains', 7),
(9, 'Affiliates', 'staff', 'order.admin_affiliates', 8),
(10, 'Support', 'staff', 'support_manager.admin_main', 9);

-- --------------------------------------------------------

--
-- Table structure for table `plugins`
--

CREATE TABLE `plugins` (
  `id` int(10) UNSIGNED NOT NULL,
  `dir` varchar(64) NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL,
  `version` varchar(16) NOT NULL,
  `enabled` tinyint(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `plugins`
--

INSERT INTO `plugins` (`id`, `dir`, `company_id`, `name`, `version`, `enabled`) VALUES
(1, 'client_cards', 1, 'Client Cards', '1.2.0', 1),
(2, 'system_status', 1, 'System Status', '1.12.0', 1),
(3, 'system_overview', 1, 'System Overview', '1.11.0', 1),
(4, 'billing_overview', 1, 'Billing at a Glance', '1.12.0', 1),
(5, 'feed_reader', 1, 'Feed Reader', '2.8.0', 1),
(6, 'cms', 1, 'Portal', '2.8.0', 1),
(7, 'domains', 1, 'Domain Manager', '1.8.0', 1),
(8, 'order', 1, 'Order System', '2.33.4', 1),
(9, 'support_manager', 1, 'Support Manager', '2.28.2', 1);

-- --------------------------------------------------------

--
-- Table structure for table `plugin_cards`
--

CREATE TABLE `plugin_cards` (
  `id` int(10) UNSIGNED NOT NULL,
  `plugin_id` int(10) UNSIGNED NOT NULL,
  `callback` varchar(255) NOT NULL,
  `callback_type` enum('value','html') NOT NULL DEFAULT 'value',
  `text_color` varchar(255) DEFAULT '#343A40',
  `background` varchar(255) DEFAULT NULL,
  `background_type` enum('color','gradient','image') NOT NULL DEFAULT 'color',
  `level` enum('client','staff') NOT NULL DEFAULT 'client',
  `label` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `plugin_cards`
--

INSERT INTO `plugin_cards` (`id`, `plugin_id`, `callback`, `callback_type`, `text_color`, `background`, `background_type`, `level`, `label`, `link`, `enabled`) VALUES
(1, 1, 'a:2:{i:0;s:4:\"this\";i:1;s:16:\"getServicesCount\";}', 'value', '#fffaeb', '#ffc107', 'color', 'client', 'ClientCardsPlugin.card_client.services', 'services/index/active/', 1),
(2, 1, 'a:2:{i:0;s:4:\"this\";i:1;s:16:\"getInvoicesCount\";}', 'value', '#e4f5e7', '#28a746', 'color', 'client', 'ClientCardsPlugin.card_client.invoices', 'invoices/index/open/', 1),
(3, 7, 'a:2:{i:0;s:4:\"this\";i:1;s:14:\"getDomainCount\";}', 'value', '#343A40', '#fff', 'color', 'client', 'DomainsPlugin.card_client.getDomainCount', 'plugin/domains/client_main/', 1),
(4, 8, 'a:2:{i:0;s:4:\"this\";i:1;s:14:\"getOrdersCount\";}', 'value', '#ebebeb', '#343a40', 'color', 'client', 'OrderPlugin.card_client.orders', '/order/orders/', 1),
(5, 9, 'a:2:{i:0;s:4:\"this\";i:1;s:19:\"getOpenTicketsCount\";}', 'value', '#edf6ff', '#007bff', 'color', 'client', 'SupportManagerPlugin.card_client.tickets', '/plugin/support_manager/client_tickets/', 1);

-- --------------------------------------------------------

--
-- Table structure for table `plugin_events`
--

CREATE TABLE `plugin_events` (
  `plugin_id` int(10) UNSIGNED NOT NULL,
  `event` varchar(128) NOT NULL,
  `callback` varchar(128) NOT NULL,
  `enabled` tinyint(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `plugin_events`
--

INSERT INTO `plugin_events` (`plugin_id`, `event`, `callback`, `enabled`) VALUES
(7, 'Packages.deleteAfter', 'a:2:{i:0;s:4:\"this\";i:1;s:16:\"deletePackageTld\";}', 1),
(7, 'Services.addAfter', 'a:2:{i:0;s:4:\"this\";i:1;s:17:\"updateRenewalDate\";}', 1),
(7, 'Services.editAfter', 'a:2:{i:0;s:4:\"this\";i:1;s:17:\"updateRenewalDate\";}', 1),
(8, 'AppController.structure', 'a:2:{i:0;s:4:\"this\";i:1;s:12:\"setEmbedCode\";}', 1),
(8, 'Clients.delete', 'a:2:{i:0;s:4:\"this\";i:1;s:19:\"deleteHangingOrders\";}', 1),
(8, 'Domains.delete', 'a:2:{i:0;s:4:\"this\";i:1;s:20:\"clearTldPricingCache\";}', 1),
(8, 'Domains.disable', 'a:2:{i:0;s:4:\"this\";i:1;s:20:\"clearTldPricingCache\";}', 1),
(8, 'Domains.enable', 'a:2:{i:0;s:4:\"this\";i:1;s:20:\"clearTldPricingCache\";}', 1),
(8, 'Domains.updateDomainsCompanySettingsAfter', 'a:2:{i:0;s:4:\"this\";i:1;s:20:\"clearTldPricingCache\";}', 1),
(8, 'Domains.updatePricingAfter', 'a:2:{i:0;s:4:\"this\";i:1;s:20:\"clearTldPricingCache\";}', 1),
(8, 'Invoices.createFromServices', 'a:2:{i:0;s:4:\"this\";i:1;s:21:\"createRenewalReferral\";}', 1),
(8, 'Invoices.setClosed', 'a:2:{i:0;s:4:\"this\";i:1;s:20:\"registerReferralSale\";}', 1),
(8, 'Navigation.getSearchOptions', 'a:2:{i:0;s:4:\"this\";i:1;s:16:\"getSearchOptions\";}', 1),
(9, 'Clients.delete', 'a:2:{i:0;s:4:\"this\";i:1;s:19:\"deleteClientTickets\";}', 1),
(9, 'Navigation.getSearchOptions', 'a:2:{i:0;s:4:\"this\";i:1;s:16:\"getSearchOptions\";}', 1),
(9, 'Report.clientData', 'a:2:{i:0;s:4:\"this\";i:1;s:13:\"getClientData\";}', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pricings`
--

CREATE TABLE `pricings` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `term` smallint(5) UNSIGNED NOT NULL DEFAULT 1,
  `period` enum('day','week','month','year','onetime') NOT NULL DEFAULT 'month',
  `price` decimal(19,4) NOT NULL DEFAULT 0.0000,
  `price_renews` decimal(19,4) DEFAULT NULL,
  `price_transfer` decimal(19,4) DEFAULT NULL,
  `setup_fee` decimal(19,4) NOT NULL DEFAULT 0.0000,
  `cancel_fee` decimal(19,4) NOT NULL DEFAULT 0.0000,
  `currency` char(3) NOT NULL DEFAULT 'USD'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pricings`
--

INSERT INTO `pricings` (`id`, `company_id`, `term`, `period`, `price`, `price_renews`, `price_transfer`, `setup_fee`, `cancel_fee`, `currency`) VALUES
(1, 1, 1, 'year', '0.0000', NULL, NULL, '0.0000', '0.0000', 'USD'),
(2, 1, 1, 'year', '0.0000', NULL, NULL, '0.0000', '0.0000', 'USD'),
(3, 1, 1, 'year', '0.0000', NULL, NULL, '0.0000', '0.0000', 'USD'),
(4, 1, 1, 'year', '0.0000', NULL, NULL, '0.0000', '0.0000', 'USD'),
(5, 1, 2, 'year', '0.0000', NULL, NULL, '0.0000', '0.0000', 'USD'),
(6, 1, 3, 'year', '0.0000', NULL, NULL, '0.0000', '0.0000', 'USD'),
(7, 1, 4, 'year', '0.0000', NULL, NULL, '0.0000', '0.0000', 'USD'),
(8, 1, 5, 'year', '0.0000', NULL, NULL, '0.0000', '0.0000', 'USD'),
(9, 1, 6, 'year', '0.0000', NULL, NULL, '0.0000', '0.0000', 'USD'),
(10, 1, 7, 'year', '0.0000', NULL, NULL, '0.0000', '0.0000', 'USD'),
(11, 1, 8, 'year', '0.0000', NULL, NULL, '0.0000', '0.0000', 'USD'),
(12, 1, 9, 'year', '0.0000', NULL, NULL, '0.0000', '0.0000', 'USD'),
(13, 1, 10, 'year', '0.0000', NULL, NULL, '0.0000', '0.0000', 'USD'),
(14, 1, 1, 'year', '0.0000', NULL, NULL, '0.0000', '0.0000', 'USD'),
(15, 1, 2, 'year', '0.0000', NULL, NULL, '0.0000', '0.0000', 'USD'),
(16, 1, 3, 'year', '0.0000', NULL, NULL, '0.0000', '0.0000', 'USD'),
(17, 1, 4, 'year', '0.0000', NULL, NULL, '0.0000', '0.0000', 'USD'),
(18, 1, 5, 'year', '0.0000', NULL, NULL, '0.0000', '0.0000', 'USD'),
(19, 1, 6, 'year', '0.0000', NULL, NULL, '0.0000', '0.0000', 'USD'),
(20, 1, 7, 'year', '0.0000', NULL, NULL, '0.0000', '0.0000', 'USD'),
(21, 1, 8, 'year', '0.0000', NULL, NULL, '0.0000', '0.0000', 'USD'),
(22, 1, 9, 'year', '0.0000', NULL, NULL, '0.0000', '0.0000', 'USD'),
(23, 1, 10, 'year', '0.0000', NULL, NULL, '0.0000', '0.0000', 'USD'),
(24, 1, 1, 'year', '0.0000', NULL, NULL, '0.0000', '0.0000', 'USD'),
(25, 1, 2, 'year', '0.0000', NULL, NULL, '0.0000', '0.0000', 'USD'),
(26, 1, 3, 'year', '0.0000', NULL, NULL, '0.0000', '0.0000', 'USD'),
(27, 1, 4, 'year', '0.0000', NULL, NULL, '0.0000', '0.0000', 'USD'),
(28, 1, 5, 'year', '0.0000', NULL, NULL, '0.0000', '0.0000', 'USD'),
(29, 1, 6, 'year', '0.0000', NULL, NULL, '0.0000', '0.0000', 'USD'),
(30, 1, 7, 'year', '0.0000', NULL, NULL, '0.0000', '0.0000', 'USD'),
(31, 1, 8, 'year', '0.0000', NULL, NULL, '0.0000', '0.0000', 'USD'),
(32, 1, 9, 'year', '0.0000', NULL, NULL, '0.0000', '0.0000', 'USD'),
(33, 1, 10, 'year', '0.0000', NULL, NULL, '0.0000', '0.0000', 'USD');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `query` mediumtext NOT NULL,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `report_fields`
--

CREATE TABLE `report_fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `report_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL,
  `label` varchar(255) NOT NULL,
  `type` enum('text','date','select') NOT NULL,
  `values` text DEFAULT NULL,
  `regex` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_service_id` int(10) UNSIGNED DEFAULT NULL,
  `package_group_id` int(10) UNSIGNED DEFAULT NULL,
  `id_format` varchar(64) NOT NULL,
  `id_value` int(10) NOT NULL,
  `pricing_id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `module_row_id` int(10) UNSIGNED NOT NULL,
  `coupon_id` int(10) UNSIGNED DEFAULT NULL,
  `qty` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `override_price` decimal(19,4) DEFAULT NULL,
  `override_currency` varchar(3) DEFAULT NULL,
  `status` enum('active','canceled','pending','suspended','in_review') NOT NULL DEFAULT 'pending',
  `suspension_reason` text DEFAULT NULL,
  `cancellation_reason` text DEFAULT NULL,
  `date_added` datetime NOT NULL,
  `date_renews` datetime DEFAULT NULL,
  `date_last_renewed` datetime DEFAULT NULL,
  `date_suspended` datetime DEFAULT NULL,
  `date_canceled` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service_changes`
--

CREATE TABLE `service_changes` (
  `id` int(10) UNSIGNED NOT NULL,
  `service_id` int(10) UNSIGNED NOT NULL,
  `invoice_id` int(10) UNSIGNED NOT NULL,
  `status` enum('pending','completed','canceled','error') NOT NULL DEFAULT 'pending',
  `data` mediumtext NOT NULL,
  `date_added` datetime NOT NULL,
  `date_status` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service_fields`
--

CREATE TABLE `service_fields` (
  `service_id` int(10) UNSIGNED NOT NULL,
  `key` varchar(32) NOT NULL,
  `value` mediumtext NOT NULL,
  `serialized` tinyint(1) NOT NULL DEFAULT 0,
  `encrypted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service_invoices`
--

CREATE TABLE `service_invoices` (
  `invoice_id` int(10) UNSIGNED NOT NULL,
  `service_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service_options`
--

CREATE TABLE `service_options` (
  `id` int(10) UNSIGNED NOT NULL,
  `service_id` int(10) UNSIGNED NOT NULL,
  `option_pricing_id` int(10) UNSIGNED NOT NULL,
  `qty` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `value` mediumtext DEFAULT NULL,
  `encrypted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(64) NOT NULL,
  `expire` datetime NOT NULL,
  `value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `expire`, `value`) VALUES
('892umq3gj72h572basq0269ll9', '2022-11-23 17:06:33', 'blesta_company_id|s:1:\"1\";blesta_id|s:1:\"1\";ip|s:12:\"172.16.238.1\";blesta_staff_id|s:1:\"1\";');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `key` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `encrypted` tinyint(1) NOT NULL DEFAULT 0,
  `comment` varchar(255) DEFAULT NULL,
  `inherit` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`key`, `value`, `encrypted`, `comment`, `inherit`) VALUES
('amazons3_access_key', '', 1, '', 1),
('amazons3_bucket', '', 0, '', 1),
('amazons3_rate', '24', 0, '', 1),
('amazons3_secret_key', '', 1, '', 1),
('autodebit', 'true', 0, '', 1),
('autodebit_attempts', '1', 0, '', 1),
('autodebit_days_before_due', '1', 0, '', 1),
('autosuspend', 'true', 0, '', 1),
('behind_proxy', 'false', 0, NULL, 1),
('calendar_begins', 'sunday', 0, '', 1),
('cancelation_fee_tax', 'false', 0, '', 1),
('cascade_tax', 'false', 0, '', 1),
('client_set_currency', 'false', 0, '', 1),
('client_set_invoice', 'true', 0, '', 1),
('client_set_lang', 'true', 0, '', 1),
('clients_cancel_services', 'false', 0, '', 1),
('clients_format', '{num}', 0, '', 1),
('clients_increment', '1', 0, '', 1),
('clients_pad_size', '0', 0, '', 1),
('clients_pad_str', '0', 0, '', 1),
('clients_start', '1500', 0, '', 1),
('country', 'US', 0, '', 1),
('cron_key', '', 1, '', 1),
('database_version', '5.5.0-b2', 0, NULL, 1),
('date_format', 'M d, Y', 0, '', 1),
('datetime_format', 'M d, Y g:i:s A', 0, '', 1),
('default_currency', 'USD', 0, '', 1),
('enable_tax', 'false', 0, '', 1),
('exchange_rates_auto_update', 'false', 0, '', 1),
('exchange_rates_padding', '3', 0, '', 1),
('exchange_rates_processor', 'x_rates', 0, '', 1),
('exchange_rates_processor_key', '', 0, 'The Exchange Rate Processor API Key', 1),
('ftp_host', '', 0, '', 1),
('ftp_password', '', 1, '', 1),
('ftp_path', '', 0, '', 1),
('ftp_port', '22', 0, '', 1),
('ftp_rate', '24', 0, '', 1),
('ftp_username', '', 1, '', 1),
('geoip_enabled', 'false', 0, '', 1),
('html_email', 'true', 0, '', 1),
('interfax_password', '', 1, '', 1),
('interfax_username', '', 1, '', 1),
('inv_days_before_renewal', '5', 0, '', 1),
('inv_draft_format', 'DRAFT-{num}', 0, '', 1),
('inv_format', '{num}', 0, 'The format of the invoice number', 1),
('inv_increment', '1', 0, 'The increment step for each incrementation of NUMBER in the given format. (1 = 1, 2, 3; 2 = 2, 4, 6; 3 = 3, 6, 9; etc.) ', 1),
('inv_method', 'email', 0, '', 1),
('inv_pad_size', '0', 0, 'The size of padding to perform on the auto-incrementing NUMBER portion of the invoice number', 1),
('inv_pad_str', '0', 0, 'The string to pad the auto-incrementing NUMBER with', 1),
('inv_start', '1', 0, 'The start value for incrementing the auto-incrementing NUMBER in the given format', 1),
('inv_suspended_services', 'true', 0, '', 1),
('language', 'en_us', 0, '', 1),
('license_data', 'IxG05bzs0VAjDOs6+bCyNQwweEYVHKABk9FhLtKQTTf6KvTiYRF45FgebybwEAaFAQBRhIGrX19hpgtLrStOK8MiJ4UuM/d0yMuIbg2Q7mybR95++3+dH/R4+giCBrkq307BAmeDKo/4hlz+e51eztt2S8dVtTvBQ4k7x7kZMI0bBYZj8SJ6ZI46xHz/iHDWiAASgd7qvdQzl79y2Mct51ztXp8rmuN+xdtuBDBTFEQH4BV/ZbXUtV6eFlTbcgvfsrLiur2y0KuNVzQ7Ma5rMurvtoxDMcEAEcLY0iSDeFxjo8MJAIlSkx7L9zSOUcz72TvKBKjG3nKg+YgDgjrlJAnUHJJI2F31Zt/Z4oCzq25Puo03Rd16URh2/DKdRkjB6LwS/CZyneU/Za9v+BRR8KEbgmGsWsBmFrLfBRlS9v7/xWBDJW26IJ6lZNqHPhfNTKKFmLm6d50Rrt7aBt0KJaNc6DZGkENHWq5YtFoiRuAukRaK87pb4gB987GgaFoTd85ZcQ5qY/AUcIZLrL5xBRgLs77Er0+mhuatUr9Pk4c=$poC360amv0/RERE3IGg+/nvaZmQTBrLTbqv5pp2CisE/r2ikTO8/6lQDi8Thd6Q1v/qz7iNVeYCpmqYcg9OuglVZOb6HdrU4ndArHNW3MBZNPDTcYEPsH4y9GPinQl0l90FJE9FfO8DJzojU4Ir1X0pb4/Qnd+gqoMST+wOBYFM=', 0, NULL, 1),
('license_key', 'dev-zwkdnh6okvpaud5x', 0, '', 1),
('license_public_key', '-----BEGIN PUBLIC KEY-----\r\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCu9XCaCP6P7WrqLb3Rnf31/bQi\r\nX7inQ++f6+I+a+rWS0uCLy3163KU2WryBrniOGFewMWjWUW4tuNKezNWoZnwiHnY\r\nmOPyVie4egk+iNBGd4PPEsMdDBBjQOk/4Ri/tvcIXA+XZBmTOvJ5D7TP1AJtz3So\r\nA+9wCMeWB9LulXIjIwIDAQAB\r\n-----END PUBLIC KEY-----', 0, NULL, 1),
('log_days', '30', 0, '', 1),
('log_dir', '/var/www/html/logs_blesta/', 0, NULL, 1),
('mail_delivery', 'php', 0, '', 1),
('maintenance_mode', 'false', 0, '', 1),
('maintenance_reason', '', 0, '', 1),
('multi_currency_pricing', 'package', 0, '', 1),
('root_web_dir', '/var/www/html/blesta/', 0, NULL, 1),
('services_format', '{num}', 0, 'The format of the services number', 1),
('services_increment', '1', 0, 'The increment step for each incrementation of NUMBER in the given format. (1 = 1, 2, 3; 2 = 2, 4, 6; 3 = 3, 6, 9; etc.) ', 1),
('services_pad_size', '0', 0, '', 1),
('services_pad_str', '0', 0, '', 1),
('services_start', '1', 0, '', 1),
('setup_fee_tax', 'false', 0, '', 1),
('show_currency_code', 'false', 0, '', 1),
('smtp_host', '', 0, '', 1),
('smtp_password', '', 1, '', 1),
('smtp_port', '465', 0, '', 1),
('smtp_security', 'ssl', 0, '', 1),
('smtp_user', '', 1, '', 1),
('tax_exempt', 'false', 0, '', 1),
('tax_id', '', 0, '', 0),
('temp_dir', '/tmp/', 0, '', 1),
('timezone', 'America/Los_Angeles', 0, '', 1),
('uploads_dir', '/var/www/html/uploads/', 0, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(128) NOT NULL,
  `last_name` varchar(128) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_mobile` varchar(255) DEFAULT NULL,
  `number_mobile` varchar(64) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `user_id`, `first_name`, `last_name`, `email`, `email_mobile`, `number_mobile`, `status`) VALUES
(1, 1, 'Hexonet', 'Admin', 'middleware@hexonet.net', NULL, NULL, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `staff_group`
--

CREATE TABLE `staff_group` (
  `staff_id` int(10) UNSIGNED NOT NULL,
  `staff_group_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `staff_group`
--

INSERT INTO `staff_group` (`staff_id`, `staff_group_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `staff_groups`
--

CREATE TABLE `staff_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(64) NOT NULL,
  `session_lock` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `staff_groups`
--

INSERT INTO `staff_groups` (`id`, `company_id`, `name`, `session_lock`) VALUES
(1, 1, 'Administrators', 0),
(2, 1, 'Billing', 0);

-- --------------------------------------------------------

--
-- Table structure for table `staff_group_notices`
--

CREATE TABLE `staff_group_notices` (
  `staff_group_id` int(10) UNSIGNED NOT NULL,
  `action` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff_links`
--

CREATE TABLE `staff_links` (
  `staff_id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `uri` varchar(255) NOT NULL,
  `title` varchar(64) NOT NULL,
  `order` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff_notices`
--

CREATE TABLE `staff_notices` (
  `staff_group_id` int(10) UNSIGNED NOT NULL,
  `staff_id` int(10) UNSIGNED NOT NULL,
  `action` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff_settings`
--

CREATE TABLE `staff_settings` (
  `key` varchar(32) NOT NULL,
  `staff_id` int(10) UNSIGNED NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `staff_settings`
--

INSERT INTO `staff_settings` (`key`, `staff_id`, `value`) VALUES
('billingWidgets_1_state', 1, 'YToyOntzOjY0OiJlZjYwYjU2ODk1NzgzZWNlYjkwZjYyMTAwMTU3YzI0ZmY4Y2I0YTRhYjNlMzgwMzBkNWYyMGY2ODNlOGY2NTlmIjthOjI6e3M6NDoib3BlbiI7YjoxO3M6Nzoic2VjdGlvbiI7czo4OiJzZWN0aW9uMSI7fXM6NjQ6IjE1ZWQwM2VlOTA3NTU2YTcwMDViNGI3OWVmZmU4ZGMwM2IxMmNhMTU2ZGYzMzFiMzFlOTcxZjhlYjBkYWQ3NTEiO2E6Mjp7czo0OiJvcGVuIjtiOjE7czo3OiJzZWN0aW9uIjtzOjg6InNlY3Rpb24xIjt9fQ=='),
('dashboardWidgets_1_state', 1, 'YTozOntzOjY0OiJmZmRkNzM2OTYwMzBjZGMxMmViMmIwOTI3MTMzYzM3OWYxYWU4NDZhODQ3NGM1ZmEzYTcxYjQyY2E0MjFmMzA4IjthOjI6e3M6Nzoic2VjdGlvbiI7czo4OiJzZWN0aW9uMSI7czo0OiJvcGVuIjtiOjE7fXM6NjQ6IjQ1Y2Y4MzU0MWU5OTE2NmE4ODRmMGUwYTZkMjI5OTE5MjZiMTY0Nzk5MmJjMzA3ZTE4ZGQzMDhhZmJkMjdiOGEiO2E6Mjp7czo3OiJzZWN0aW9uIjtzOjg6InNlY3Rpb24zIjtzOjQ6Im9wZW4iO2I6MTt9czo2NDoiNDQxODg4YmVmMDhkMzkyODJmNmMxZDczZTdiZWFjYTQ5MDk5NzE0OTI4N2E0NDgyMGM5ZTZiM2ViZjgxMmViMiI7YToyOntzOjc6InNlY3Rpb24iO3M6ODoic2VjdGlvbjIiO3M6NDoib3BlbiI7YjoxO319');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `country_alpha2` char(2) NOT NULL,
  `code` varchar(3) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`country_alpha2`, `code`, `name`) VALUES
('AD', '02', 'Canillo'),
('AD', '03', 'Encamp'),
('AD', '04', 'La Massana'),
('AD', '05', 'Ordino'),
('AD', '06', 'Sant Julià de Lòria'),
('AD', '07', 'Andorra la Vella'),
('AD', '08', 'Escaldes-Engordany'),
('AE', 'AJ', 'Ajman'),
('AE', 'AZ', 'Abu Z¸aby [Abu Dhabi]'),
('AE', 'DU', 'Dubayy [Dubai]'),
('AE', 'FU', 'Al Fujayrah'),
('AE', 'RK', 'Ra’s al Khaymah'),
('AE', 'SH', 'Ash Shariqah [Sharjah]'),
('AE', 'UQ', 'Umm al Qaywayn'),
('AF', 'BAL', 'Balkh'),
('AF', 'BAM', 'Bāmyān'),
('AF', 'BDG', 'Bādghīs'),
('AF', 'BDS', 'Badakhshān'),
('AF', 'BGL', 'Baghlān'),
('AF', 'DAY', 'Dāykundī'),
('AF', 'FRA', 'Farāh'),
('AF', 'FYB', 'Fāryāb'),
('AF', 'GHA', 'Ghaznī'),
('AF', 'GHO', 'Ghōr'),
('AF', 'HEL', 'Helmand'),
('AF', 'HER', 'Herāt'),
('AF', 'JOW', 'Jowzjān'),
('AF', 'KAB', 'Kābul'),
('AF', 'KAN', 'Kandahār'),
('AF', 'KAP', 'Kāpīsā'),
('AF', 'KDZ', 'Kunduz'),
('AF', 'KHO', 'Khōst'),
('AF', 'KNR', 'Kunar'),
('AF', 'LAG', 'Laghmān'),
('AF', 'LOG', 'Lōgar'),
('AF', 'NAN', 'Nangarhār'),
('AF', 'NIM', 'Nīmrōz'),
('AF', 'NUR', 'Nūristān'),
('AF', 'PAN', 'Panjshayr'),
('AF', 'PAR', 'Parwān'),
('AF', 'PIA', 'Paktia'),
('AF', 'PKA', 'Paktika'),
('AF', 'SAM', 'Samangan'),
('AF', 'SAR', 'Sar-e Pul'),
('AF', 'TAK', 'Takhar'),
('AF', 'URU', 'Uruzgān'),
('AF', 'WAR', 'Wardak'),
('AF', 'ZAB', 'Zābul'),
('AG', '03', 'Saint George'),
('AG', '04', 'Saint John’s'),
('AG', '05', 'Saint Mary'),
('AG', '06', 'Saint Paul'),
('AG', '07', 'Saint Peter'),
('AG', '08', 'Saint Philip'),
('AG', '10', 'Barbuda'),
('AG', '11', 'Redonda'),
('AL', '01', 'Berat'),
('AL', '02', 'Durrës'),
('AL', '03', 'Elbasan'),
('AL', '04', 'Fier'),
('AL', '05', 'Gjirokastër'),
('AL', '06', 'Korçë'),
('AL', '07', 'Kukës'),
('AL', '08', 'Lezhë'),
('AL', '09', 'Dibër'),
('AL', '10', 'Shkodër'),
('AL', '11', 'Tiranë'),
('AL', '12', 'Vlorë'),
('AL', 'BR', 'Berat'),
('AL', 'BU', 'Bulqizë'),
('AL', 'DI', 'Dibër'),
('AL', 'DL', 'Delvinë'),
('AL', 'DR', 'Durrës'),
('AL', 'DV', 'Devoll'),
('AL', 'EL', 'Elbasan'),
('AL', 'ER', 'Kolonjë'),
('AL', 'FR', 'Fier'),
('AL', 'GJ', 'Gjirokastër'),
('AL', 'GR', 'Gramsh'),
('AL', 'HA', 'Has'),
('AL', 'KA', 'Kavajë'),
('AL', 'KB', 'Kurbin'),
('AL', 'KC', 'Kuçovë'),
('AL', 'KO', 'Korçë'),
('AL', 'KR', 'Krujë'),
('AL', 'KU', 'Kukës'),
('AL', 'LB', 'Librazhd'),
('AL', 'LE', 'Lezhë'),
('AL', 'LU', 'Lushnjë'),
('AL', 'MK', 'Mallakastër'),
('AL', 'MM', 'Malësi e Madhe'),
('AL', 'MR', 'Mirditë'),
('AL', 'MT', 'Mat'),
('AL', 'PG', 'Pogradec'),
('AL', 'PQ', 'Peqin'),
('AL', 'PR', 'Përmet'),
('AL', 'PU', 'Pukë'),
('AL', 'SH', 'Shkodër'),
('AL', 'SK', 'Skrapar'),
('AL', 'SR', 'Sarandë'),
('AL', 'TE', 'Tepelenë'),
('AL', 'TP', 'Tropojë'),
('AL', 'TR', 'Tiranë'),
('AL', 'VL', 'Vlorë'),
('AM', 'AG', 'Aragac̣otn'),
('AM', 'AR', 'Ararat'),
('AM', 'AV', 'Armavir'),
('AM', 'ER', 'Erevan'),
('AM', 'GR', 'Gegark\'unik\''),
('AM', 'KT', 'Kotayk\''),
('AM', 'LO', 'Loṙi'),
('AM', 'SH', 'Širak'),
('AM', 'SU', 'Syunik\''),
('AM', 'TV', 'Tavuš'),
('AM', 'VD', 'Vayoc Jor'),
('AO', 'BGO', 'Bengo'),
('AO', 'BGU', 'Benguela'),
('AO', 'BIE', 'Bié'),
('AO', 'CAB', 'Cabinda'),
('AO', 'CCU', 'Cuando-Cubango'),
('AO', 'CNN', 'Cunene'),
('AO', 'CNO', 'Cuanza Norte'),
('AO', 'CUS', 'Cuanza Sul'),
('AO', 'HUA', 'Huambo'),
('AO', 'HUI', 'Huíla'),
('AO', 'LNO', 'Lunda Norte'),
('AO', 'LSU', 'Lunda Sul'),
('AO', 'LUA', 'Luanda'),
('AO', 'MAL', 'Malange'),
('AO', 'MOX', 'Moxico'),
('AO', 'NAM', 'Namibe'),
('AO', 'UIG', 'Uíge'),
('AO', 'ZAI', 'Zaire'),
('AR', 'A', 'Salta'),
('AR', 'B', 'Buenos Aires'),
('AR', 'C', 'Ciudad Autónoma de Buenos Aires'),
('AR', 'D', 'San Luis'),
('AR', 'E', 'Entre Ríos'),
('AR', 'F', 'La Rioja'),
('AR', 'G', 'Santiago del Estero'),
('AR', 'H', 'Chaco'),
('AR', 'J', 'San Juan'),
('AR', 'K', 'Catamarca'),
('AR', 'L', 'La Pampa'),
('AR', 'M', 'Mendoza'),
('AR', 'N', 'Misiones'),
('AR', 'P', 'Formosa'),
('AR', 'Q', 'Neuquén'),
('AR', 'R', 'Río Negro'),
('AR', 'S', 'Santa Fe'),
('AR', 'T', 'Tucumán'),
('AR', 'U', 'Chubut'),
('AR', 'V', 'Tierra del Fuego'),
('AR', 'W', 'Corrientes'),
('AR', 'X', 'Córdoba'),
('AR', 'Y', 'Jujuy'),
('AR', 'Z', 'Santa Cruz'),
('AT', '1', 'Burgenland'),
('AT', '2', 'Kärnten'),
('AT', '3', 'Niederösterreich'),
('AT', '4', 'Oberösterreich'),
('AT', '5', 'Salzburg'),
('AT', '6', 'Steiermark'),
('AT', '7', 'Tirol'),
('AT', '8', 'Vorarlberg'),
('AT', '9', 'Wien'),
('AU', 'ACT', 'Australian Capital Territory'),
('AU', 'NSW', 'New South Wales'),
('AU', 'NT', 'Northern Territory'),
('AU', 'QLD', 'Queensland'),
('AU', 'SA', 'South Australia'),
('AU', 'TAS', 'Tasmania'),
('AU', 'VIC', 'Victoria'),
('AU', 'WA', 'Western Australia'),
('AZ', 'ABS', 'Abseron'),
('AZ', 'AGA', 'Agstafa'),
('AZ', 'AGC', 'Agcabädi'),
('AZ', 'AGM', 'Agdam'),
('AZ', 'AGS', 'Agdas'),
('AZ', 'AGU', 'Agsu'),
('AZ', 'AST', 'Astara'),
('AZ', 'BA', 'Baki'),
('AZ', 'BAB', 'Babäk'),
('AZ', 'BAL', 'Balakän'),
('AZ', 'BAR', 'Bärdä'),
('AZ', 'BEY', 'Beyläqan'),
('AZ', 'BIL', 'Biläsuvar'),
('AZ', 'CAB', 'Cäbrayil'),
('AZ', 'CAL', 'Cälilabab'),
('AZ', 'CUL', 'Culfa'),
('AZ', 'DAS', 'Daskäsän'),
('AZ', 'FUZ', 'Füzuli'),
('AZ', 'GA', 'Gəncə'),
('AZ', 'GAD', 'Gädäbäy'),
('AZ', 'GOR', 'Goranboy'),
('AZ', 'GOY', 'Göyçay'),
('AZ', 'GYG', 'Göygöl'),
('AZ', 'HAC', 'Haciqabul'),
('AZ', 'IMI', 'Imisli'),
('AZ', 'ISM', 'Ismayilli'),
('AZ', 'KAL', 'Kälbäcär'),
('AZ', 'KAN', 'Kǝngǝrli'),
('AZ', 'KUR', 'Kürdämir'),
('AZ', 'LA', 'Lənkəran'),
('AZ', 'LAC', 'Laçin'),
('AZ', 'LAN', 'Länkäran'),
('AZ', 'LER', 'Lerik'),
('AZ', 'MAS', 'Masalli'),
('AZ', 'MI', 'Mingəçevir'),
('AZ', 'NA', 'Naftalan'),
('AZ', 'NEF', 'Neftçala'),
('AZ', 'NV', 'Naxçıvan'),
('AZ', 'NX', 'Naxçivan'),
('AZ', 'OGU', 'Oguz'),
('AZ', 'ORD', 'Ordubad'),
('AZ', 'QAB', 'Qäbälä'),
('AZ', 'QAX', 'Qax'),
('AZ', 'QAZ', 'Qazax'),
('AZ', 'QBA', 'Quba'),
('AZ', 'QBI', 'Qubadli'),
('AZ', 'QOB', 'Qobustan'),
('AZ', 'QUS', 'Qusar'),
('AZ', 'SA', 'Şəki'),
('AZ', 'SAB', 'Sabirabad'),
('AZ', 'SAD', 'Sädäräk'),
('AZ', 'SAH', 'Sahbuz'),
('AZ', 'SAK', 'Säki'),
('AZ', 'SAL', 'Salyan'),
('AZ', 'SAR', 'Särur'),
('AZ', 'SAT', 'Saatli'),
('AZ', 'SBN', 'Şabran'),
('AZ', 'SIY', 'Siyäzän'),
('AZ', 'SKR', 'Sämkir'),
('AZ', 'SM', 'Sumqayıt'),
('AZ', 'SMI', 'Samaxi'),
('AZ', 'SMX', 'Samux'),
('AZ', 'SR', 'Şirvan'),
('AZ', 'SUS', 'Susa'),
('AZ', 'TAR', 'Tärtär'),
('AZ', 'TOV', 'Tovuz'),
('AZ', 'UCA', 'Ucar'),
('AZ', 'XA', 'Xankəndi'),
('AZ', 'XAC', 'Xaçmaz'),
('AZ', 'XCI', 'Xocali'),
('AZ', 'XIZ', 'Xizi'),
('AZ', 'XVD', 'Xocavänd'),
('AZ', 'YAR', 'Yardimli'),
('AZ', 'YE', 'Yevlax City'),
('AZ', 'YEV', 'Yevlax'),
('AZ', 'ZAN', 'Zängilan'),
('AZ', 'ZAQ', 'Zaqatala'),
('AZ', 'ZAR', 'Zärdab'),
('BA', '01', 'Unsko-sanski kanton'),
('BA', '02', 'Posavski kanton'),
('BA', '03', 'Tuzlanski kanton'),
('BA', '04', 'Zeničko-dobojski kanton'),
('BA', '05', 'Bosansko-podrinjski kanton'),
('BA', '06', 'Srednjobosanski kanton'),
('BA', '07', 'Hercegovačko-neretvanski kanton'),
('BA', '08', 'Zapadnohercegovački kanton'),
('BA', '09', 'Kanton Sarajevo'),
('BA', '10', 'Kanton br. 10'),
('BA', 'BIH', 'Federacija Bosna i Hercegovina'),
('BA', 'BRC', 'Brčko distrikt'),
('BA', 'SRP', 'Republika Srpska'),
('BB', '01', 'Christ Church'),
('BB', '02', 'Saint Andrew'),
('BB', '03', 'Saint George'),
('BB', '04', 'Saint James'),
('BB', '05', 'Saint John'),
('BB', '06', 'Saint Joseph'),
('BB', '07', 'Saint Lucy'),
('BB', '08', 'Saint Michael'),
('BB', '09', 'Saint Peter'),
('BB', '10', 'Saint Philip'),
('BB', '11', 'Saint Thomas'),
('BD', '01', 'Bandarban'),
('BD', '02', 'Barguna'),
('BD', '03', 'Bogra'),
('BD', '04', 'Brahmanbaria'),
('BD', '05', 'Bagerhat'),
('BD', '06', 'Barisal'),
('BD', '07', 'Bhola'),
('BD', '08', 'Comilla'),
('BD', '09', 'Chandpur'),
('BD', '10', 'Chittagong'),
('BD', '11', 'Cox\'s Bazar'),
('BD', '12', 'Chuadanga'),
('BD', '13', 'Dhaka'),
('BD', '14', 'Dinajpur'),
('BD', '15', 'Faridpur'),
('BD', '16', 'Feni'),
('BD', '17', 'Gopalganj'),
('BD', '18', 'Gazipur'),
('BD', '19', 'Gaibandha'),
('BD', '20', 'Habiganj'),
('BD', '21', 'Jamalpur'),
('BD', '22', 'Jessore'),
('BD', '23', 'Jhenaidah'),
('BD', '24', 'Jaipurhat'),
('BD', '25', 'Jhalakati'),
('BD', '26', 'Kishoreganj'),
('BD', '27', 'Khulna'),
('BD', '28', 'Kurigram'),
('BD', '29', 'Khagrachari'),
('BD', '30', 'Kushtia'),
('BD', '31', 'Lakshmipur'),
('BD', '32', 'Lalmonirhat'),
('BD', '33', 'Manikganj'),
('BD', '34', 'Mymensingh'),
('BD', '35', 'Munshiganj'),
('BD', '36', 'Madaripur'),
('BD', '37', 'Magura'),
('BD', '38', 'Moulvibazar'),
('BD', '39', 'Meherpur'),
('BD', '40', 'Narayanganj'),
('BD', '41', 'Netrakona'),
('BD', '42', 'Narsingdi'),
('BD', '43', 'Narail'),
('BD', '44', 'Natore'),
('BD', '45', 'Nawabganj'),
('BD', '46', 'Nilphamari'),
('BD', '47', 'Noakhali'),
('BD', '48', 'Naogaon'),
('BD', '49', 'Pabna'),
('BD', '50', 'Pirojpur'),
('BD', '51', 'Patuakhali'),
('BD', '52', 'Panchagarh'),
('BD', '53', 'Rajbari'),
('BD', '54', 'Rajshahi'),
('BD', '55', 'Rangpur'),
('BD', '56', 'Rangamati Parbattya Chattagram'),
('BD', '57', 'Sherpur'),
('BD', '58', 'Satkhira'),
('BD', '59', 'Sirajganj'),
('BD', '60', 'Sylhet'),
('BD', '61', 'Sunamganj'),
('BD', '62', 'Shariatpur'),
('BD', '63', 'Tangail'),
('BD', '64', 'Thakurgaon'),
('BD', 'A', 'Barisal'),
('BD', 'B', 'Chittagong'),
('BD', 'C', 'Dhaka'),
('BD', 'D', 'Khulna'),
('BD', 'E', 'Rajshahi'),
('BD', 'F', 'Rangpur'),
('BD', 'G', 'Sylhet'),
('BE', 'BRU', 'Brussels'),
('BE', 'VAN', 'Antwerpen'),
('BE', 'VBR', 'Vlaams Brabant'),
('BE', 'VLG', 'Flemish Region'),
('BE', 'VLI', 'Limburg'),
('BE', 'VOV', 'Oost-Vlaanderen'),
('BE', 'VWV', 'West-Vlaanderen'),
('BE', 'WAL', 'Wallonia'),
('BE', 'WBR', 'Brabant Wallon'),
('BE', 'WHT', 'Hainaut'),
('BE', 'WLG', 'Liège'),
('BE', 'WLX', 'Luxembourg'),
('BE', 'WNA', 'Namur'),
('BF', '01', 'Boucle du Mouhoun'),
('BF', '02', 'Cascades'),
('BF', '03', 'Centre'),
('BF', '04', 'Centre-Est'),
('BF', '05', 'Centre-Nord'),
('BF', '06', 'Centre-Ouest'),
('BF', '07', 'Centre-Sud'),
('BF', '08', 'Est'),
('BF', '09', 'Hauts-Bassins'),
('BF', '10', 'Nord'),
('BF', '11', 'Plateau-Central'),
('BF', '12', 'Sahel'),
('BF', '13', 'Sud-Ouest'),
('BF', 'BAL', 'Balé'),
('BF', 'BAM', 'Bam'),
('BF', 'BAN', 'Banwa'),
('BF', 'BAZ', 'Bazèga'),
('BF', 'BGR', 'Bougouriba'),
('BF', 'BLG', 'Boulgou'),
('BF', 'BLK', 'Boulkiemdé'),
('BF', 'COM', 'Comoé'),
('BF', 'GAN', 'Ganzourgou'),
('BF', 'GNA', 'Gnagna'),
('BF', 'GOU', 'Gourma'),
('BF', 'HOU', 'Houet'),
('BF', 'IOB', 'Ioba'),
('BF', 'KAD', 'Kadiogo'),
('BF', 'KEN', 'Kénédougou'),
('BF', 'KMD', 'Komondjari'),
('BF', 'KMP', 'Kompienga'),
('BF', 'KOP', 'Koulpélogo'),
('BF', 'KOS', 'Kossi'),
('BF', 'KOT', 'Kouritenga'),
('BF', 'KOW', 'Kourwéogo'),
('BF', 'LER', 'Léraba'),
('BF', 'LOR', 'Loroum'),
('BF', 'MOU', 'Mouhoun'),
('BF', 'NAM', 'Namentenga'),
('BF', 'NAO', 'Nahouri'),
('BF', 'NAY', 'Nayala'),
('BF', 'NOU', 'Noumbiel'),
('BF', 'OUB', 'Oubritenga'),
('BF', 'OUD', 'Oudalan'),
('BF', 'PAS', 'Passoré'),
('BF', 'PON', 'Poni'),
('BF', 'SEN', 'Séno'),
('BF', 'SIS', 'Sissili'),
('BF', 'SMT', 'Sanmatenga'),
('BF', 'SNG', 'Sanguié'),
('BF', 'SOM', 'Soum'),
('BF', 'SOR', 'Sourou'),
('BF', 'TAP', 'Tapoa'),
('BF', 'TUI', 'Tui'),
('BF', 'YAG', 'Yagha'),
('BF', 'YAT', 'Yatenga'),
('BF', 'ZIR', 'Ziro'),
('BF', 'ZON', 'Zondoma'),
('BF', 'ZOU', 'Zoundwéogo'),
('BG', '01', 'Blagoevgrad'),
('BG', '02', 'Burgas'),
('BG', '03', 'Varna'),
('BG', '04', 'Veliko Tarnovo'),
('BG', '05', 'Vidin'),
('BG', '06', 'Vratsa'),
('BG', '07', 'Gabrovo'),
('BG', '08', 'Dobrich'),
('BG', '09', 'Kardzhali'),
('BG', '10', 'Kjustendil'),
('BG', '11', 'Lovech'),
('BG', '12', 'Montana'),
('BG', '13', 'Pazardzhik'),
('BG', '14', 'Pernik'),
('BG', '15', 'Pleven'),
('BG', '16', 'Plovdiv'),
('BG', '17', 'Razgrad'),
('BG', '18', 'Ruse'),
('BG', '19', 'Silistra'),
('BG', '20', 'Sliven'),
('BG', '21', 'Smolyan'),
('BG', '22', 'Sofia-Grad'),
('BG', '23', 'Sofia'),
('BG', '24', 'Stara Zagora'),
('BG', '25', 'Targovishte'),
('BG', '26', 'Haskovo'),
('BG', '27', 'Šumen'),
('BG', '28', 'Yambol'),
('BH', '13', 'Al Manamah'),
('BH', '14', 'Al Janubiyah'),
('BH', '15', 'Al Muharraq'),
('BH', '16', 'Al Wustá'),
('BH', '17', 'Ash Shamaliyah'),
('BI', 'BB', 'Bubanza'),
('BI', 'BL', 'Bujumbura Rural'),
('BI', 'BM', 'Bujumbura Mairie'),
('BI', 'BR', 'Bururi'),
('BI', 'CA', 'Cankuzo'),
('BI', 'CI', 'Cibitoke'),
('BI', 'GI', 'Gitega'),
('BI', 'KI', 'Kirundo'),
('BI', 'KR', 'Karuzi'),
('BI', 'KY', 'Kayanza'),
('BI', 'MA', 'Makamba'),
('BI', 'MU', 'Muramvya'),
('BI', 'MW', 'Mwaro'),
('BI', 'MY', 'Muyinga'),
('BI', 'NG', 'Ngozi'),
('BI', 'RT', 'Rutana'),
('BI', 'RY', 'Ruyigi'),
('BJ', 'AK', 'Atakora'),
('BJ', 'AL', 'Alibori'),
('BJ', 'AQ', 'Atlantique'),
('BJ', 'BO', 'Borgou'),
('BJ', 'CO', 'Collines'),
('BJ', 'DO', 'Donga'),
('BJ', 'KO', 'Kouffo'),
('BJ', 'LI', 'Littoral'),
('BJ', 'MO', 'Mono'),
('BJ', 'OU', 'Ouémé'),
('BJ', 'PL', 'Plateau'),
('BJ', 'ZO', 'Zou'),
('BM', 'DEV', 'Devonshire'),
('BM', 'HA', 'Hamilton municipality'),
('BM', 'HAM', 'Hamilton'),
('BM', 'PAG', 'Paget'),
('BM', 'PEM', 'Pembroke'),
('BM', 'SAN', 'Sandys'),
('BM', 'SG', 'Saint George municipality'),
('BM', 'SGE', 'Saint George'),
('BM', 'SMI', 'Smiths'),
('BM', 'SOU', 'Southampton'),
('BM', 'WAR', 'Warwick'),
('BN', 'BE', 'Belait'),
('BN', 'BM', 'Brunei-Muara'),
('BN', 'TE', 'Temburong'),
('BN', 'TU', 'Tutong'),
('BO', 'B', 'El Beni'),
('BO', 'C', 'Cochabamba'),
('BO', 'H', 'Chuquisaca'),
('BO', 'L', 'La Paz'),
('BO', 'N', 'Pando'),
('BO', 'O', 'Oruro'),
('BO', 'P', 'Potosí'),
('BO', 'S', 'Santa Cruz'),
('BO', 'T', 'Tarija'),
('BQ', 'BO', 'Bonaire'),
('BQ', 'SA', 'Saba'),
('BQ', 'SE', 'Sint Eustatius'),
('BR', 'AC', 'Acre'),
('BR', 'AL', 'Alagoas'),
('BR', 'AM', 'Amazonas'),
('BR', 'AP', 'Amapá'),
('BR', 'BA', 'Bahia'),
('BR', 'CE', 'Ceará'),
('BR', 'DF', 'Distrito Federal'),
('BR', 'ES', 'Espírito Santo'),
('BR', 'GO', 'Goiás'),
('BR', 'MA', 'Maranhão'),
('BR', 'MG', 'Minas Gerais'),
('BR', 'MS', 'Mato Grosso do Sul'),
('BR', 'MT', 'Mato Grosso'),
('BR', 'PA', 'Pará'),
('BR', 'PB', 'Paraíba'),
('BR', 'PE', 'Pernambuco'),
('BR', 'PI', 'Piauí'),
('BR', 'PR', 'Paraná'),
('BR', 'RJ', 'Rio de Janeiro'),
('BR', 'RN', 'Rio Grande do Norte'),
('BR', 'RO', 'Rondônia'),
('BR', 'RR', 'Roraima'),
('BR', 'RS', 'Rio Grande do Sul'),
('BR', 'SC', 'Santa Catarina'),
('BR', 'SE', 'Sergipe'),
('BR', 'SP', 'São Paulo'),
('BR', 'TO', 'Tocantins'),
('BS', 'AK', 'Acklins Islands'),
('BS', 'BI', 'Bimini and Cat Cay'),
('BS', 'BP', 'Black Point'),
('BS', 'BY', 'Berry Islands'),
('BS', 'CE', 'Central Eleuthera'),
('BS', 'CI', 'Cat Island'),
('BS', 'CK', 'Crooked Island and Long Cay'),
('BS', 'CO', 'Central Abaco'),
('BS', 'CS', 'Central Andros'),
('BS', 'EG', 'East Grand Bahama'),
('BS', 'EX', 'Exuma'),
('BS', 'FP', 'City of Freeport'),
('BS', 'GC', 'Grand Cay'),
('BS', 'GT', 'Green Turtle Cay'),
('BS', 'HI', 'Harbour Island'),
('BS', 'HT', 'Hope Town'),
('BS', 'IN', 'Inagua'),
('BS', 'LI', 'Long Island'),
('BS', 'MC', 'Mangrove Cay'),
('BS', 'MG', 'Mayaguana'),
('BS', 'MI', 'Moore’s Island'),
('BS', 'NE', 'North Eleuthera'),
('BS', 'NO', 'North Abaco'),
('BS', 'NS', 'North Andros'),
('BS', 'RC', 'Rum Cay'),
('BS', 'RI', 'Ragged Island'),
('BS', 'SA', 'South Andros'),
('BS', 'SE', 'South Eleuthera'),
('BS', 'SO', 'South Abaco'),
('BS', 'SS', 'San Salvador'),
('BS', 'SW', 'Spanish Wells'),
('BS', 'WG', 'West Grand Bahama'),
('BT', '11', 'Paro'),
('BT', '12', 'Chhukha'),
('BT', '13', 'Ha'),
('BT', '14', 'Samtse'),
('BT', '15', 'Thimphu'),
('BT', '21', 'Tsirang'),
('BT', '22', 'Dagana'),
('BT', '23', 'Punakha'),
('BT', '24', 'Wangdue Phodrang'),
('BT', '31', 'Sarpang'),
('BT', '32', 'Trongsa'),
('BT', '33', 'Bumthang'),
('BT', '34', 'Zhemgang'),
('BT', '41', 'Trashigang'),
('BT', '42', 'Monggar'),
('BT', '43', 'Pemagatshel'),
('BT', '44', 'Lhuentse'),
('BT', '45', 'Samdrup Jongkha'),
('BT', 'GA', 'Gasa'),
('BT', 'TY', 'Trashi Yangtse'),
('BW', 'CE', 'Central'),
('BW', 'GH', 'Ghanzi'),
('BW', 'KG', 'Kgalagadi'),
('BW', 'KL', 'Kgatleng'),
('BW', 'KW', 'Kweneng'),
('BW', 'NE', 'North-East'),
('BW', 'NW', 'North-West'),
('BW', 'SE', 'South-East'),
('BW', 'SO', 'Southern'),
('BY', 'BR', 'Brestskaya voblasts'),
('BY', 'HM', 'Horad Minsk'),
('BY', 'HO', 'Homyel\'skaya voblasts'),
('BY', 'HR', 'Hrodzenskaya voblasts'),
('BY', 'MA', 'Mahilyowskaya voblasts'),
('BY', 'MI', 'Minskaya voblasts'),
('BY', 'VI', 'Vitsyebskaya voblasts'),
('BZ', 'BZ', 'Belize'),
('BZ', 'CY', 'Cayo'),
('BZ', 'CZL', 'Corozal'),
('BZ', 'OW', 'Orange Walk'),
('BZ', 'SC', 'Stann Creek'),
('BZ', 'TOL', 'Toledo'),
('CA', 'AB', 'Alberta'),
('CA', 'BC', 'British Columbia'),
('CA', 'MB', 'Manitoba'),
('CA', 'NB', 'New Brunswick'),
('CA', 'NL', 'Newfoundland and Labrador'),
('CA', 'NS', 'Nova Scotia'),
('CA', 'NT', 'Northwest Territories'),
('CA', 'NU', 'Nunavut'),
('CA', 'ON', 'Ontario'),
('CA', 'PE', 'Prince Edward Island'),
('CA', 'QC', 'Quebec'),
('CA', 'SK', 'Saskatchewan'),
('CA', 'YT', 'Yukon Territory'),
('CD', 'BC', 'Bas-Congo'),
('CD', 'BN', 'Bandundu'),
('CD', 'EQ', 'Équateur'),
('CD', 'KA', 'Katanga'),
('CD', 'KE', 'Kasai-Oriental'),
('CD', 'KN', 'Kinshasa'),
('CD', 'KW', 'Kasai-Occidental'),
('CD', 'MA', 'Maniema'),
('CD', 'NK', 'Nord-Kivu'),
('CD', 'OR', 'Orientale'),
('CD', 'SK', 'Sud-Kivu'),
('CF', 'AC', 'Ouham'),
('CF', 'BB', 'Bamingui-Bangoran'),
('CF', 'BGF', 'Bangui'),
('CF', 'BK', 'Basse-Kotto'),
('CF', 'HK', 'Haute-Kotto'),
('CF', 'HM', 'Haut-Mbomou'),
('CF', 'HS', 'Haute-Sangha / Mambéré-Kadéï'),
('CF', 'KB', 'Gribingui'),
('CF', 'KG', 'Kémo-Gribingui'),
('CF', 'LB', 'Lobaye'),
('CF', 'MB', 'Mbomou'),
('CF', 'MP', 'Ombella-Mpoko'),
('CF', 'NM', 'Nana-Mambéré'),
('CF', 'OP', 'Ouham-Pendé'),
('CF', 'SE', 'Sangha'),
('CF', 'UK', 'Ouaka'),
('CF', 'VK', 'Vakaga'),
('CG', '11', 'Bouenza'),
('CG', '12', 'Pool'),
('CG', '13', 'Sangha'),
('CG', '14', 'Plateaux'),
('CG', '15', 'Cuvette-Ouest'),
('CG', '2', 'Lékoumou'),
('CG', '5', 'Kouilou'),
('CG', '7', 'Likouala'),
('CG', '8', 'Cuvette'),
('CG', '9', 'Niari'),
('CG', 'BZV', 'Brazzaville'),
('CH', 'AG', 'Aargau'),
('CH', 'AI', 'Appenzell Innerrhoden'),
('CH', 'AR', 'Appenzell Ausserrhoden'),
('CH', 'BE', 'Bern'),
('CH', 'BL', 'Basel-Landschaft'),
('CH', 'BS', 'Basel-Stadt'),
('CH', 'FR', 'Fribourg'),
('CH', 'GE', 'Genève'),
('CH', 'GL', 'Glarus'),
('CH', 'GR', 'Graubünden'),
('CH', 'JU', 'Jura'),
('CH', 'LU', 'Luzern'),
('CH', 'NE', 'Neuchâtel'),
('CH', 'NW', 'Nidwalden'),
('CH', 'OW', 'Obwalden'),
('CH', 'SG', 'Sankt Gallen'),
('CH', 'SH', 'Schaffhausen'),
('CH', 'SO', 'Solothurn'),
('CH', 'SZ', 'Schwyz'),
('CH', 'TG', 'Thurgau'),
('CH', 'TI', 'Ticino'),
('CH', 'UR', 'Uri'),
('CH', 'VD', 'Vaud'),
('CH', 'VS', 'Valais'),
('CH', 'ZG', 'Zug'),
('CH', 'ZH', 'Zürich'),
('CI', '01', 'Lagunes'),
('CI', '02', 'Haut-Sassandra'),
('CI', '03', 'Savanes'),
('CI', '04', 'Vallée du Bandama'),
('CI', '05', 'Moyen-Comoé'),
('CI', '06', '18 Montagnes'),
('CI', '07', 'Lacs'),
('CI', '08', 'Zanzan'),
('CI', '09', 'Bas-Sassandra'),
('CI', '10', 'Denguélé'),
('CI', '11', 'Nzi-Comoé'),
('CI', '12', 'Marahoué'),
('CI', '13', 'Sud-Comoé'),
('CI', '14', 'Worodougou'),
('CI', '15', 'Sud-Bandama'),
('CI', '16', 'Agnébi'),
('CI', '17', 'Bafing'),
('CI', '18', 'Fromager'),
('CI', '19', 'Moyen-Cavally'),
('CL', 'AI', 'Aisén del General Carlos Ibáñez del Campo'),
('CL', 'AN', 'Antofagasta'),
('CL', 'AP', 'Arica y Parinacota'),
('CL', 'AR', 'Araucanía'),
('CL', 'AT', 'Atacama'),
('CL', 'BI', 'Bío-Bío'),
('CL', 'CO', 'Coquimbo'),
('CL', 'LI', 'Libertador General Bernardo O\'Higgins'),
('CL', 'LL', 'Los Lagos'),
('CL', 'LR', 'Los Ríos'),
('CL', 'MA', 'Magallanes'),
('CL', 'ML', 'Maule'),
('CL', 'RM', 'Región Metropolitana de Santiago'),
('CL', 'TA', 'Tarapacá'),
('CL', 'VS', 'Valparaíso'),
('CM', 'AD', 'Adamaoua'),
('CM', 'CE', 'Centre'),
('CM', 'EN', 'Far North'),
('CM', 'ES', 'East'),
('CM', 'LT', 'Littoral'),
('CM', 'NO', 'North'),
('CM', 'NW', 'North-West'),
('CM', 'OU', 'West'),
('CM', 'SU', 'South'),
('CM', 'SW', 'South-West'),
('CN', '11', 'Beijing'),
('CN', '12', 'Tianjin'),
('CN', '13', 'Hebei'),
('CN', '14', 'Shanxi'),
('CN', '15', 'Nei Mongol'),
('CN', '21', 'Liaoning'),
('CN', '22', 'Jilin'),
('CN', '23', 'Heilongjiang'),
('CN', '31', 'Shanghai'),
('CN', '32', 'Jiangsu'),
('CN', '33', 'Zhejiang'),
('CN', '34', 'Anhui'),
('CN', '35', 'Fujian'),
('CN', '36', 'Jiangxi'),
('CN', '37', 'Shandong'),
('CN', '41', 'Henan'),
('CN', '42', 'Hubei'),
('CN', '43', 'Hunan'),
('CN', '44', 'Guangdong'),
('CN', '45', 'Guangxi'),
('CN', '46', 'Hainan'),
('CN', '50', 'Chongqing'),
('CN', '51', 'Sichuan'),
('CN', '52', 'Guizhou'),
('CN', '53', 'Yunnan'),
('CN', '54', 'Xizang'),
('CN', '61', 'Shaanxi'),
('CN', '62', 'Gansu'),
('CN', '63', 'Qinghai'),
('CN', '64', 'Ningxia'),
('CN', '65', 'Xinjiang'),
('CN', '71', 'Taiwan *'),
('CN', '91', 'Xianggang'),
('CN', '92', 'Aomen'),
('CO', 'AMA', 'Amazonas'),
('CO', 'ANT', 'Antioquia'),
('CO', 'ARA', 'Arauca'),
('CO', 'ATL', 'Atlántico'),
('CO', 'BOL', 'Bolívar'),
('CO', 'BOY', 'Boyacá'),
('CO', 'CAL', 'Caldas'),
('CO', 'CAQ', 'Caquetá'),
('CO', 'CAS', 'Casanare'),
('CO', 'CAU', 'Cauca'),
('CO', 'CES', 'Cesar'),
('CO', 'CHO', 'Chocó'),
('CO', 'COR', 'Córdoba'),
('CO', 'CUN', 'Cundinamarca'),
('CO', 'DC', 'Distrito Capital de Bogotá'),
('CO', 'GUA', 'Guainía'),
('CO', 'GUV', 'Guaviare'),
('CO', 'HUI', 'Huila'),
('CO', 'LAG', 'La Guajira'),
('CO', 'MAG', 'Magdalena'),
('CO', 'MET', 'Meta'),
('CO', 'NAR', 'Nariño'),
('CO', 'NSA', 'Norte de Santander'),
('CO', 'PUT', 'Putumayo'),
('CO', 'QUI', 'Quindío'),
('CO', 'RIS', 'Risaralda'),
('CO', 'SAN', 'Santander'),
('CO', 'SAP', 'San Andrés, Providencia y Santa Catalina'),
('CO', 'SUC', 'Sucre'),
('CO', 'TOL', 'Tolima'),
('CO', 'VAC', 'Valle del Cauca'),
('CO', 'VAU', 'Vaupés'),
('CO', 'VID', 'Vichada'),
('CR', 'A', 'Alajuela'),
('CR', 'C', 'Cartago'),
('CR', 'G', 'Guanacaste'),
('CR', 'H', 'Heredia'),
('CR', 'L', 'Limón'),
('CR', 'P', 'Puntarenas'),
('CR', 'SJ', 'San José'),
('CU', '01', 'Pinar del Río'),
('CU', '02', 'La Habana'),
('CU', '03', 'Ciudad de La Habana'),
('CU', '04', 'Matanzas'),
('CU', '05', 'Villa Clara'),
('CU', '06', 'Cienfuegos'),
('CU', '07', 'Sancti Spíritus'),
('CU', '08', 'Ciego de Ávila'),
('CU', '09', 'Camagüey'),
('CU', '10', 'Las Tunas'),
('CU', '11', 'Holguín'),
('CU', '12', 'Granma'),
('CU', '13', 'Santiago de Cuba'),
('CU', '14', 'Guantánamo'),
('CU', '99', 'Isla de la Juventud'),
('CV', 'B', 'Ilhas de Barlavento'),
('CV', 'BR', 'Brava'),
('CV', 'BV', 'Boa Vista'),
('CV', 'CA', 'Santa Catarina'),
('CV', 'CF', 'Santa Catarina do Fogo'),
('CV', 'CR', 'Santa Cruz'),
('CV', 'MA', 'Maio'),
('CV', 'MO', 'Mosteiros'),
('CV', 'PA', 'Paul'),
('CV', 'PN', 'Porto Novo'),
('CV', 'PR', 'Praia'),
('CV', 'RB', 'Ribeira Brava'),
('CV', 'RG', 'Ribeira Grande'),
('CV', 'RS', 'Ribeira Grande de Santiago'),
('CV', 'S', 'Ilhas de Sotavento'),
('CV', 'SD', 'São Domingos'),
('CV', 'SF', 'São Filipe'),
('CV', 'SL', 'Sal'),
('CV', 'SM', 'São Miguel'),
('CV', 'SO', 'São Lourenço dos Órgãos'),
('CV', 'SS', 'São Salvador do Mundo'),
('CV', 'SV', 'São Vicente'),
('CV', 'TA', 'Tarrafal'),
('CV', 'TS', 'Tarrafal de São Nicolau'),
('CY', '01', 'Lefkosia'),
('CY', '02', 'Lemesos'),
('CY', '03', 'Larnaka'),
('CY', '04', 'Ammochostos'),
('CY', '05', 'Pafos'),
('CY', '06', 'Keryneia'),
('CZ', '101', 'Praha 1'),
('CZ', '102', 'Praha 2'),
('CZ', '103', 'Praha 3'),
('CZ', '104', 'Praha 4'),
('CZ', '105', 'Praha 5'),
('CZ', '106', 'Praha 6'),
('CZ', '107', 'Praha 7'),
('CZ', '108', 'Praha 8'),
('CZ', '109', 'Praha 9'),
('CZ', '10A', 'Praha 10'),
('CZ', '10B', 'Praha 11'),
('CZ', '10C', 'Praha 12'),
('CZ', '10D', 'Praha 13'),
('CZ', '10E', 'Praha 14'),
('CZ', '10F', 'Praha 15'),
('CZ', '201', 'Benešov'),
('CZ', '202', 'Beroun'),
('CZ', '203', 'Kladno'),
('CZ', '204', 'Kolín'),
('CZ', '205', 'Kutná Hora'),
('CZ', '206', 'Mělník'),
('CZ', '207', 'Mladá Boleslav'),
('CZ', '208', 'Nymburk'),
('CZ', '209', 'Praha východ'),
('CZ', '20A', 'Praha západ'),
('CZ', '20B', 'Příbram'),
('CZ', '20C', 'Rakovník'),
('CZ', '311', 'České Budějovice'),
('CZ', '312', 'Český Krumlov'),
('CZ', '313', 'Jindřichův Hradec'),
('CZ', '314', 'Písek'),
('CZ', '315', 'Prachatice'),
('CZ', '316', 'Strakonice'),
('CZ', '317', 'Tábor'),
('CZ', '321', 'Domažlice'),
('CZ', '322', 'Klatovy'),
('CZ', '323', 'Plzeň město'),
('CZ', '324', 'Plzeň jih'),
('CZ', '325', 'Plzeň sever'),
('CZ', '326', 'Rokycany'),
('CZ', '327', 'Tachov'),
('CZ', '411', 'Cheb'),
('CZ', '412', 'Karlovy Vary'),
('CZ', '413', 'Sokolov'),
('CZ', '421', 'Děčín'),
('CZ', '422', 'Chomutov'),
('CZ', '423', 'Litoměřice'),
('CZ', '424', 'Louny'),
('CZ', '425', 'Most'),
('CZ', '426', 'Teplice'),
('CZ', '427', 'Ústí nad Labem'),
('CZ', '511', 'Česká Lípa'),
('CZ', '512', 'Jablonec nad Nisou'),
('CZ', '513', 'Liberec'),
('CZ', '514', 'Semily'),
('CZ', '521', 'Hradec Králové'),
('CZ', '522', 'Jičín'),
('CZ', '523', 'Náchod'),
('CZ', '524', 'Rychnov nad Kněžnou'),
('CZ', '525', 'Trutnov'),
('CZ', '531', 'Chrudim'),
('CZ', '532', 'Pardubice'),
('CZ', '533', 'Svitavy'),
('CZ', '534', 'Ústí nad Orlicí'),
('CZ', '611', 'Havlíčkův Brod'),
('CZ', '612', 'Jihlava'),
('CZ', '613', 'Pelhřimov'),
('CZ', '614', 'Třebíč'),
('CZ', '615', 'Žd’ár nad Sázavou'),
('CZ', '621', 'Blansko'),
('CZ', '622', 'Brno-město'),
('CZ', '623', 'Brno-venkov'),
('CZ', '624', 'Břeclav'),
('CZ', '625', 'Hodonín'),
('CZ', '626', 'Vyškov'),
('CZ', '627', 'Znojmo'),
('CZ', '711', 'Jeseník'),
('CZ', '712', 'Olomouc'),
('CZ', '713', 'Prostĕjov'),
('CZ', '714', 'Přerov'),
('CZ', '715', 'Šumperk'),
('CZ', '721', 'Kromĕříž'),
('CZ', '722', 'Uherské Hradištĕ'),
('CZ', '723', 'Vsetín'),
('CZ', '724', 'Zlín'),
('CZ', '801', 'Bruntál'),
('CZ', '802', 'Frýdek Místek'),
('CZ', '803', 'Karviná'),
('CZ', '804', 'Nový Jičín'),
('CZ', '805', 'Opava'),
('CZ', '806', 'Ostrava město'),
('CZ', 'JC', 'Jihoceský kraj'),
('CZ', 'JM', 'Jihomoravský kraj'),
('CZ', 'KA', 'Karlovarský kraj'),
('CZ', 'KR', 'Královéhradecký kraj'),
('CZ', 'LI', 'Liberecký kraj'),
('CZ', 'MO', 'Moravskoslezský kraj'),
('CZ', 'OL', 'Olomoucký kraj'),
('CZ', 'PA', 'Pardubický kraj'),
('CZ', 'PL', 'Plzenský kraj'),
('CZ', 'PR', 'Praha, hlavní mesto'),
('CZ', 'ST', 'Stredoceský kraj'),
('CZ', 'US', 'Ústecký kraj'),
('CZ', 'VY', 'Vysocina'),
('CZ', 'ZL', 'Zlínský kraj'),
('DE', 'BB', 'Brandenburg'),
('DE', 'BE', 'Berlin'),
('DE', 'BW', 'Baden-Württemberg'),
('DE', 'BY', 'Bayern'),
('DE', 'HB', 'Bremen'),
('DE', 'HE', 'Hessen'),
('DE', 'HH', 'Hamburg'),
('DE', 'MV', 'Mecklenburg-Vorpommern'),
('DE', 'NI', 'Niedersachsen'),
('DE', 'NW', 'Nordrhein-Westfalen'),
('DE', 'RP', 'Rheinland-Pfalz'),
('DE', 'SH', 'Schleswig-Holstein'),
('DE', 'SL', 'Saarland'),
('DE', 'SN', 'Sachsen'),
('DE', 'ST', 'Sachsen-Anhalt'),
('DE', 'TH', 'Thüringen'),
('DJ', 'AR', 'Arta'),
('DJ', 'AS', 'Ali Sabieh'),
('DJ', 'DI', 'Dikhil'),
('DJ', 'DJ', 'Djibouti'),
('DJ', 'OB', 'Obock'),
('DJ', 'TA', 'Tadjourah'),
('DK', '81', 'North Jutland'),
('DK', '82', 'Central Jutland'),
('DK', '83', 'South Denmark'),
('DK', '84', 'Capital'),
('DK', '85', 'Zeeland'),
('DM', '02', 'Saint Andrew'),
('DM', '03', 'Saint David'),
('DM', '04', 'Saint George'),
('DM', '05', 'Saint John'),
('DM', '06', 'Saint Joseph'),
('DM', '07', 'Saint Luke'),
('DM', '08', 'Saint Mark'),
('DM', '09', 'Saint Patrick'),
('DM', '10', 'Saint Paul'),
('DM', '11', 'Saint Peter'),
('DO', '01', 'Distrito Nacional'),
('DO', '02', 'Azua'),
('DO', '03', 'Bahoruco'),
('DO', '04', 'Barahona'),
('DO', '05', 'Dajabón'),
('DO', '06', 'Duarte'),
('DO', '07', 'La Estrelleta [Elías Piña]'),
('DO', '08', 'El Seybo [El Seibo]'),
('DO', '09', 'Espaillat'),
('DO', '10', 'Independencia'),
('DO', '11', 'La Altagracia'),
('DO', '12', 'La Romana'),
('DO', '13', 'La Vega'),
('DO', '14', 'María Trinidad Sánchez'),
('DO', '15', 'Monte Cristi'),
('DO', '16', 'Pedernales'),
('DO', '17', 'Peravia'),
('DO', '18', 'Puerto Plata'),
('DO', '19', 'Salcedo'),
('DO', '20', 'Samaná'),
('DO', '21', 'San Cristóbal'),
('DO', '22', 'San Juan'),
('DO', '23', 'San Pedro de Macorís'),
('DO', '24', 'Sánchez Ramírez'),
('DO', '25', 'Santiago'),
('DO', '26', 'Santiago Rodríguez'),
('DO', '27', 'Valverde'),
('DO', '28', 'Monseñor Nouel'),
('DO', '29', 'Monte Plata'),
('DO', '30', 'Hato Mayor'),
('DO', '31', 'San Jose de Ocoa'),
('DO', '32', 'Santo Domingo'),
('DZ', '01', 'Adrar'),
('DZ', '02', 'Chlef'),
('DZ', '03', 'Laghouat'),
('DZ', '04', 'Oum el Bouaghi'),
('DZ', '05', 'Batna'),
('DZ', '06', 'Béjaïa'),
('DZ', '07', 'Biskra'),
('DZ', '08', 'Béchar'),
('DZ', '09', 'Blida'),
('DZ', '10', 'Bouira'),
('DZ', '11', 'Tamanghasset'),
('DZ', '12', 'Tébessa'),
('DZ', '13', 'Tlemcen'),
('DZ', '14', 'Tiaret'),
('DZ', '15', 'Tizi Ouzou'),
('DZ', '16', 'Alger'),
('DZ', '17', 'Djelfa'),
('DZ', '18', 'Jijel'),
('DZ', '19', 'Sétif'),
('DZ', '20', 'Saïda'),
('DZ', '21', 'Skikda'),
('DZ', '22', 'Sidi Bel Abbès'),
('DZ', '23', 'Annaba'),
('DZ', '24', 'Guelma'),
('DZ', '25', 'Constantine'),
('DZ', '26', 'Médéa'),
('DZ', '27', 'Mostaganem'),
('DZ', '28', 'Msila'),
('DZ', '29', 'Mascara'),
('DZ', '30', 'Ouargla'),
('DZ', '31', 'Oran'),
('DZ', '32', 'El Bayadh'),
('DZ', '33', 'Illizi'),
('DZ', '34', 'Bordj Bou Arréridj'),
('DZ', '35', 'Boumerdès'),
('DZ', '36', 'El Tarf'),
('DZ', '37', 'Tindouf'),
('DZ', '38', 'Tissemsilt'),
('DZ', '39', 'El Oued'),
('DZ', '40', 'Khenchela'),
('DZ', '41', 'Souk Ahras'),
('DZ', '42', 'Tipaza'),
('DZ', '43', 'Mila'),
('DZ', '44', 'Aïn Defla'),
('DZ', '45', 'Naama'),
('DZ', '46', 'Aïn Témouchent'),
('DZ', '47', 'Ghardaïa'),
('DZ', '48', 'Relizane'),
('EC', 'A', 'Azuay'),
('EC', 'B', 'Bolívar'),
('EC', 'C', 'Carchi'),
('EC', 'D', 'Orellana'),
('EC', 'E', 'Esmeraldas'),
('EC', 'F', 'Cañar'),
('EC', 'G', 'Guayas'),
('EC', 'H', 'Chimborazo'),
('EC', 'I', 'Imbabura'),
('EC', 'L', 'Loja'),
('EC', 'M', 'Manabí'),
('EC', 'N', 'Napo'),
('EC', 'O', 'El Oro'),
('EC', 'P', 'Pichincha'),
('EC', 'R', 'Los Ríos'),
('EC', 'S', 'Morona-Santiago'),
('EC', 'SD', 'Santo Domingo de los Tsachilas'),
('EC', 'SE', 'Santa Elena'),
('EC', 'T', 'Tungurahua'),
('EC', 'U', 'Sucumbíos'),
('EC', 'W', 'Galápagos'),
('EC', 'X', 'Cotopaxi'),
('EC', 'Y', 'Pastaza'),
('EC', 'Z', 'Zamora-Chinchipe'),
('EE', '37', 'Harjumaa'),
('EE', '39', 'Hiiumaa'),
('EE', '44', 'Ida-Virumaa'),
('EE', '49', 'Jõgevamaa'),
('EE', '51', 'Järvamaa'),
('EE', '57', 'Läänemaa'),
('EE', '59', 'Lääne-Virumaa'),
('EE', '65', 'Põlvamaa'),
('EE', '67', 'Pärnumaa'),
('EE', '70', 'Raplamaa'),
('EE', '74', 'Saaremaa'),
('EE', '78', 'Tartumaa'),
('EE', '82', 'Valgamaa'),
('EE', '84', 'Viljandimaa'),
('EE', '86', 'Võrumaa'),
('EG', 'ALX', 'Al Iskandariyah'),
('EG', 'ASN', 'Aswan'),
('EG', 'AST', 'Asyut'),
('EG', 'BA', 'Al Bahr al Ahmar'),
('EG', 'BH', 'Al Buhayrah'),
('EG', 'BNS', 'Bani Suwayf'),
('EG', 'C', 'Al Qahirah'),
('EG', 'DK', 'Ad Daqahliyah'),
('EG', 'DT', 'Dumyat'),
('EG', 'FYM', 'Al Fayyum'),
('EG', 'GH', 'Al Gharbiyah'),
('EG', 'GZ', 'Al Jizah'),
('EG', 'HU', 'Ḩulwān'),
('EG', 'IS', 'Al Ismā`īlīyah'),
('EG', 'JS', 'Janub Sina\''),
('EG', 'KB', 'Al Qalyubiyah'),
('EG', 'KFS', 'Kafr ash Shaykh'),
('EG', 'KN', 'Qina'),
('EG', 'LX', 'al-Uqsur'),
('EG', 'MN', 'Al Minya'),
('EG', 'MNF', 'Al Minufiyah'),
('EG', 'MT', 'Matrūh'),
('EG', 'PTS', 'Būr Sa`īd'),
('EG', 'SHG', 'Suhaj'),
('EG', 'SHR', 'Ash Sharqiyah'),
('EG', 'SIN', 'Shamal Sina\''),
('EG', 'SU', 'As Sādis min Uktūbar'),
('EG', 'SUZ', 'As Suways'),
('EG', 'WAD', 'Al Wadi al Jadid'),
('EH', 'BOD', 'Boujdour'),
('EH', 'ESM', 'Es Semara'),
('EH', 'LAA', 'Laayoune'),
('EH', 'OUD', 'Oued el Dahab'),
('ER', 'AN', 'Anseba'),
('ER', 'DK', 'Debubawi K’eyyĭḥ Baḥri'),
('ER', 'DU', 'Debub'),
('ER', 'GB', 'Gash-Barka'),
('ER', 'MA', 'Ma’ĭkel'),
('ER', 'SK', 'Semienawi K’eyyĭḥ Baḥri'),
('ES', 'A', 'Alicante'),
('ES', 'AB', 'Albacete'),
('ES', 'AL', 'Almería'),
('ES', 'AN', 'Andalucía'),
('ES', 'AR', 'Aragón'),
('ES', 'AS', 'Asturias, Principado de'),
('ES', 'AV', 'Ávila'),
('ES', 'B', 'Barcelona'),
('ES', 'BA', 'Badajoz'),
('ES', 'BI', 'Vizcaya'),
('ES', 'BU', 'Burgos'),
('ES', 'C', 'A Coruña'),
('ES', 'CA', 'Cádiz'),
('ES', 'CB', 'Cantabria'),
('ES', 'CC', 'Cáceres'),
('ES', 'CE', 'Ceuta'),
('ES', 'CL', 'Castilla y León'),
('ES', 'CM', 'Castilla-La Mancha'),
('ES', 'CN', 'Canarias'),
('ES', 'CO', 'Córdoba'),
('ES', 'CR', 'Ciudad Real'),
('ES', 'CS', 'Castellón'),
('ES', 'CT', 'Catalunya'),
('ES', 'CU', 'Cuenca'),
('ES', 'EX', 'Extremadura'),
('ES', 'GA', 'Galicia'),
('ES', 'GC', 'Las Palmas'),
('ES', 'GI', 'Girona'),
('ES', 'GR', 'Granada'),
('ES', 'GU', 'Guadalajara'),
('ES', 'H', 'Huelva'),
('ES', 'HU', 'Huesca'),
('ES', 'IB', 'Illes Balears'),
('ES', 'J', 'Jaén'),
('ES', 'L', 'Lleida'),
('ES', 'LE', 'León'),
('ES', 'LO', 'La Rioja'),
('ES', 'LU', 'Lugo'),
('ES', 'M', 'Madrid'),
('ES', 'MA', 'Málaga'),
('ES', 'MC', 'Murcia, Región de'),
('ES', 'MD', 'Madrid, Comunidad de'),
('ES', 'ML', 'Melilla'),
('ES', 'MU', 'Murcia'),
('ES', 'NA', 'Navarra'),
('ES', 'NC', 'Navarra, Comunidad Foral de'),
('ES', 'O', 'Asturias'),
('ES', 'OR', 'Ourense'),
('ES', 'P', 'Palencia'),
('ES', 'PM', 'Baleares'),
('ES', 'PO', 'Pontevedra'),
('ES', 'PV', 'País Vasco'),
('ES', 'RI', 'La Rioja'),
('ES', 'S', 'Cantabria'),
('ES', 'SA', 'Salamanca'),
('ES', 'SE', 'Sevilla'),
('ES', 'SG', 'Segovia'),
('ES', 'SO', 'Soria'),
('ES', 'SS', 'Guipúzcoa'),
('ES', 'T', 'Tarragona'),
('ES', 'TE', 'Teruel'),
('ES', 'TF', 'Santa Cruz de Tenerife'),
('ES', 'TO', 'Toledo'),
('ES', 'V', 'Valencia'),
('ES', 'VA', 'Valladolid'),
('ES', 'VC', 'Valenciana, Comunidad'),
('ES', 'VI', 'Álava'),
('ES', 'Z', 'Zaragoza'),
('ES', 'ZA', 'Zamora'),
('ET', 'AA', 'Adis Abeba'),
('ET', 'AF', 'Afar'),
('ET', 'AM', 'Amara'),
('ET', 'BE', 'Binshangul Gumuz'),
('ET', 'DD', 'Dire Dawa'),
('ET', 'GA', 'Gambela Hizboch'),
('ET', 'HA', 'Hareri Hizb'),
('ET', 'OR', 'Oromiya'),
('ET', 'SN', 'YeDebub Biheroch Bihereseboch na Hizboch'),
('ET', 'SO', 'Sumale'),
('ET', 'TI', 'Tigray'),
('FI', '01', 'Ahvenanmaan maakunta'),
('FI', '02', 'Etelä-Karjala'),
('FI', '03', 'Etelä-Pohjanmaa'),
('FI', '04', 'Etelä-Savo'),
('FI', '05', 'Kainuu'),
('FI', '06', 'Kanta-Häme'),
('FI', '07', 'Keski-Pohjanmaa'),
('FI', '08', 'Keski-Suomi'),
('FI', '09', 'Kymenlaakso'),
('FI', '10', 'Lappi'),
('FI', '11', 'Pirkanmaa'),
('FI', '12', 'Pohjanmaa'),
('FI', '13', 'Pohjois-Karjala'),
('FI', '14', 'Pohjois-Pohjanmaa'),
('FI', '15', 'Pohjois-Savo'),
('FI', '16', 'Päijät-Häme'),
('FI', '17', 'Satakunta'),
('FI', '18', 'Uusimaa'),
('FI', '19', 'Varsinais-Suomi'),
('FJ', 'C', 'Central'),
('FJ', 'E', 'Eastern'),
('FJ', 'N', 'Northern'),
('FJ', 'R', 'Rotuma'),
('FJ', 'W', 'Western'),
('FM', 'KSA', 'Kosrae'),
('FM', 'PNI', 'Pohnpei'),
('FM', 'TRK', 'Chuuk'),
('FM', 'YAP', 'Yap'),
('FR', '01', 'Ain'),
('FR', '02', 'Aisne'),
('FR', '03', 'Allier'),
('FR', '04', 'Alpes-de-Haute-Provence'),
('FR', '05', 'Hautes-Alpes'),
('FR', '06', 'Alpes-Maritimes'),
('FR', '07', 'Ardèche'),
('FR', '08', 'Ardennes'),
('FR', '09', 'Ariège'),
('FR', '10', 'Aube'),
('FR', '11', 'Aude'),
('FR', '12', 'Aveyron'),
('FR', '13', 'Bouches-du-Rhône'),
('FR', '14', 'Calvados'),
('FR', '15', 'Cantal'),
('FR', '16', 'Charente'),
('FR', '17', 'Charente-Maritime'),
('FR', '18', 'Cher'),
('FR', '19', 'Corrèze'),
('FR', '21', 'Côte-d\'Or'),
('FR', '22', 'Côtes-d\'Armor'),
('FR', '23', 'Creuse'),
('FR', '24', 'Dordogne'),
('FR', '25', 'Doubs'),
('FR', '26', 'Drôme'),
('FR', '27', 'Eure'),
('FR', '28', 'Eure-et-Loir'),
('FR', '29', 'Finistère'),
('FR', '2A', 'Corse-du-Sud'),
('FR', '2B', 'Haute-Corse'),
('FR', '30', 'Gard'),
('FR', '31', 'Haute-Garonne'),
('FR', '32', 'Gers'),
('FR', '33', 'Gironde'),
('FR', '34', 'Hérault'),
('FR', '35', 'Ille-et-Vilaine'),
('FR', '36', 'Indre'),
('FR', '37', 'Indre-et-Loire'),
('FR', '38', 'Isère'),
('FR', '39', 'Jura'),
('FR', '40', 'Landes'),
('FR', '41', 'Loir-et-Cher'),
('FR', '42', 'Loire'),
('FR', '43', 'Haute-Loire'),
('FR', '44', 'Loire-Atlantique'),
('FR', '45', 'Loiret'),
('FR', '46', 'Lot'),
('FR', '47', 'Lot-et-Garonne'),
('FR', '48', 'Lozère'),
('FR', '49', 'Maine-et-Loire'),
('FR', '50', 'Manche'),
('FR', '51', 'Marne'),
('FR', '52', 'Haute-Marne'),
('FR', '53', 'Mayenne'),
('FR', '54', 'Meurthe-et-Moselle'),
('FR', '55', 'Meuse'),
('FR', '56', 'Morbihan'),
('FR', '57', 'Moselle'),
('FR', '58', 'Nièvre'),
('FR', '59', 'Nord'),
('FR', '60', 'Oise'),
('FR', '61', 'Orne'),
('FR', '62', 'Pas-de-Calais'),
('FR', '63', 'Puy-de-Dôme'),
('FR', '64', 'Pyrénées-Atlantiques'),
('FR', '65', 'Hautes-Pyrénées'),
('FR', '66', 'Pyrénées-Orientales'),
('FR', '67', 'Bas-Rhin'),
('FR', '68', 'Haut-Rhin'),
('FR', '69', 'Rhône'),
('FR', '70', 'Haute-Saône'),
('FR', '71', 'Saône-et-Loire'),
('FR', '72', 'Sarthe'),
('FR', '73', 'Savoie'),
('FR', '74', 'Haute-Savoie'),
('FR', '75', 'Paris'),
('FR', '76', 'Seine-Maritime'),
('FR', '77', 'Seine-et-Marne'),
('FR', '78', 'Yvelines'),
('FR', '79', 'Deux-Sèvres'),
('FR', '80', 'Somme'),
('FR', '81', 'Tarn'),
('FR', '82', 'Tarn-et-Garonne'),
('FR', '83', 'Var'),
('FR', '84', 'Vaucluse'),
('FR', '85', 'Vendée'),
('FR', '86', 'Vienne'),
('FR', '87', 'Haute-Vienne'),
('FR', '88', 'Vosges'),
('FR', '89', 'Yonne'),
('FR', '90', 'Territoire de Belfort'),
('FR', '91', 'Essonne'),
('FR', '92', 'Hauts-de-Seine'),
('FR', '93', 'Seine-Saint-Denis'),
('FR', '94', 'Val-de-Marne'),
('FR', '95', 'Val-d\'Oise'),
('FR', 'A', 'Alsace'),
('FR', 'B', 'Aquitaine'),
('FR', 'BL', 'Saint-Barthélemy'),
('FR', 'C', 'Auvergne'),
('FR', 'CP', 'Clipperton'),
('FR', 'D', 'Bourgogne'),
('FR', 'E', 'Bretagne'),
('FR', 'F', 'Centre'),
('FR', 'G', 'Champagne-Ardenne'),
('FR', 'GF', 'Guyane'),
('FR', 'GP', 'Guadeloupe'),
('FR', 'H', 'Corse'),
('FR', 'I', 'Franche-Comté'),
('FR', 'J', 'Île-de-France'),
('FR', 'K', 'Languedoc-Roussillon'),
('FR', 'L', 'Limousin'),
('FR', 'M', 'Lorraine'),
('FR', 'MF', 'Saint-Martin'),
('FR', 'MQ', 'Martinique'),
('FR', 'N', 'Midi-Pyrénées'),
('FR', 'NC', 'Nouvelle-Calédonie'),
('FR', 'O', 'Nord-Pas-de-Calais'),
('FR', 'P', 'Basse-Normandie'),
('FR', 'PF', 'Polynésie française'),
('FR', 'PM', 'Saint-Pierre-et-Miquelon'),
('FR', 'Q', 'Haute-Normandie'),
('FR', 'R', 'Pays-de-la-Loire'),
('FR', 'RE', 'La Réunion'),
('FR', 'S', 'Picardie'),
('FR', 'T', 'Poitou-Charentes'),
('FR', 'TF', 'Terres Australes Françaises'),
('FR', 'U', 'Provence-Alpes-Côte-d\'Azur'),
('FR', 'V', 'Rhône-Alpes'),
('FR', 'WF', 'Wallis et Futuna'),
('FR', 'YT', 'Mayotte'),
('GA', '1', 'Estuaire'),
('GA', '2', 'Haut-Ogooué'),
('GA', '3', 'Moyen-Ogooué'),
('GA', '4', 'Ngounié'),
('GA', '5', 'Nyanga'),
('GA', '6', 'Ogooué-Ivindo'),
('GA', '7', 'Ogooué-Lolo'),
('GA', '8', 'Ogooué-Maritime'),
('GA', '9', 'Woleu-Ntem'),
('GB', 'ABD', 'Aberdeenshire'),
('GB', 'ABE', 'Aberdeen City'),
('GB', 'AGB', 'Argyll and Bute'),
('GB', 'AGY', 'Isle of Anglesey [Sir Ynys Môn GB-YNM]'),
('GB', 'ANS', 'Angus'),
('GB', 'ANT', 'Antrim'),
('GB', 'ARD', 'Ards'),
('GB', 'ARM', 'Armagh'),
('GB', 'BAS', 'Bath and North East Somerset'),
('GB', 'BBD', 'Blackburn with Darwen'),
('GB', 'BDF', 'Bedfordshire'),
('GB', 'BDG', 'Barking and Dagenham'),
('GB', 'BEN', 'Brent'),
('GB', 'BEX', 'Bexley'),
('GB', 'BFS', 'Belfast'),
('GB', 'BGE', 'Bridgend [Pen-y-bont ar Ogwr GB-POG]'),
('GB', 'BGW', 'Blaenau Gwent'),
('GB', 'BIR', 'Birmingham'),
('GB', 'BKM', 'Buckinghamshire'),
('GB', 'BLA', 'Ballymena'),
('GB', 'BLY', 'Ballymoney'),
('GB', 'BMH', 'Bournemouth'),
('GB', 'BNB', 'Banbridge'),
('GB', 'BNE', 'Barnet'),
('GB', 'BNH', 'Brighton and Hove'),
('GB', 'BNS', 'Barnsley'),
('GB', 'BOL', 'Bolton'),
('GB', 'BPL', 'Blackpool'),
('GB', 'BRC', 'Bracknell Forest'),
('GB', 'BRD', 'Bradford'),
('GB', 'BRY', 'Bromley'),
('GB', 'BST', 'Bristol, City of'),
('GB', 'BUR', 'Bury'),
('GB', 'CAM', 'Cambridgeshire'),
('GB', 'CAY', 'Caerphilly [Caerffili GB-CAF]'),
('GB', 'CGN', 'Ceredigion [Sir Ceredigion]'),
('GB', 'CGV', 'Craigavon'),
('GB', 'CHS', 'Cheshire'),
('GB', 'CKF', 'Carrickfergus'),
('GB', 'CKT', 'Cookstown'),
('GB', 'CLD', 'Calderdale'),
('GB', 'CLK', 'Clackmannanshire'),
('GB', 'CLR', 'Coleraine'),
('GB', 'CMA', 'Cumbria'),
('GB', 'CMD', 'Camden'),
('GB', 'CMN', 'Carmarthenshire [Sir Gaerfyrddin GB-GFY]'),
('GB', 'CON', 'Cornwall'),
('GB', 'COV', 'Coventry'),
('GB', 'CRF', 'Cardiff [Caerdydd GB-CRD]'),
('GB', 'CRY', 'Croydon'),
('GB', 'CSR', 'Castlereagh'),
('GB', 'CWY', 'Conwy'),
('GB', 'DAL', 'Darlington'),
('GB', 'DBY', 'Derbyshire'),
('GB', 'DEN', 'Denbighshire [Sir Ddinbych GB-DDB]'),
('GB', 'DER', 'Derby'),
('GB', 'DEV', 'Devon'),
('GB', 'DGN', 'Dungannon and South Tyrone'),
('GB', 'DGY', 'Dumfries and Galloway'),
('GB', 'DNC', 'Doncaster'),
('GB', 'DND', 'Dundee City'),
('GB', 'DOR', 'Dorset'),
('GB', 'DOW', 'Down'),
('GB', 'DRY', 'Derry'),
('GB', 'DUD', 'Dudley'),
('GB', 'DUR', 'Durham'),
('GB', 'EAL', 'Ealing'),
('GB', 'EAY', 'East Ayrshire'),
('GB', 'EDH', 'Edinburgh, City of'),
('GB', 'EDU', 'East Dunbartonshire'),
('GB', 'ELN', 'East Lothian'),
('GB', 'ELS', 'Eilean Siar'),
('GB', 'ENF', 'Enfield'),
('GB', 'ENG', 'England'),
('GB', 'ERW', 'East Renfrewshire'),
('GB', 'ERY', 'East Riding of Yorkshire'),
('GB', 'ESS', 'Essex'),
('GB', 'ESX', 'East Sussex'),
('GB', 'FAL', 'Falkirk'),
('GB', 'FER', 'Fermanagh'),
('GB', 'FIF', 'Fife'),
('GB', 'FLN', 'Flintshire [Sir y Fflint GB-FFL]'),
('GB', 'GAT', 'Gateshead'),
('GB', 'GLG', 'Glasgow City'),
('GB', 'GLS', 'Gloucestershire'),
('GB', 'GRE', 'Greenwich'),
('GB', 'GWN', 'Gwynedd'),
('GB', 'HAL', 'Halton'),
('GB', 'HAM', 'Hampshire'),
('GB', 'HAV', 'Havering'),
('GB', 'HCK', 'Hackney'),
('GB', 'HEF', 'Herefordshire, County of'),
('GB', 'HIL', 'Hillingdon'),
('GB', 'HLD', 'Highland'),
('GB', 'HMF', 'Hammersmith and Fulham'),
('GB', 'HNS', 'Hounslow'),
('GB', 'HPL', 'Hartlepool'),
('GB', 'HRT', 'Hertfordshire'),
('GB', 'HRW', 'Harrow'),
('GB', 'HRY', 'Haringey'),
('GB', 'IOS', 'Isles of Scilly'),
('GB', 'IOW', 'Isle of Wight'),
('GB', 'ISL', 'Islington'),
('GB', 'IVC', 'Inverclyde'),
('GB', 'KEC', 'Kensington and Chelsea'),
('GB', 'KEN', 'Kent'),
('GB', 'KHL', 'Kingston upon Hull, City of'),
('GB', 'KIR', 'Kirklees'),
('GB', 'KTT', 'Kingston upon Thames'),
('GB', 'KWL', 'Knowsley'),
('GB', 'LAN', 'Lancashire'),
('GB', 'LBH', 'Lambeth'),
('GB', 'LCE', 'Leicester'),
('GB', 'LDS', 'Leeds'),
('GB', 'LEC', 'Leicestershire'),
('GB', 'LEW', 'Lewisham'),
('GB', 'LIN', 'Lincolnshire'),
('GB', 'LIV', 'Liverpool'),
('GB', 'LMV', 'Limavady'),
('GB', 'LND', 'London, City of'),
('GB', 'LRN', 'Larne'),
('GB', 'LSB', 'Lisburn'),
('GB', 'LUT', 'Luton'),
('GB', 'MAN', 'Manchester'),
('GB', 'MDB', 'Middlesbrough'),
('GB', 'MDW', 'Medway'),
('GB', 'MFT', 'Magherafelt'),
('GB', 'MIK', 'Milton Keynes'),
('GB', 'MLN', 'Midlothian'),
('GB', 'MON', 'Monmouthshire [Sir Fynwy GB-FYN]'),
('GB', 'MRT', 'Merton'),
('GB', 'MRY', 'Moray'),
('GB', 'MTY', 'Merthyr Tydfil [Merthyr Tudful GB-MTU]'),
('GB', 'MYL', 'Moyle'),
('GB', 'NAY', 'North Ayrshire'),
('GB', 'NBL', 'Northumberland'),
('GB', 'NDN', 'North Down'),
('GB', 'NEL', 'North East Lincolnshire'),
('GB', 'NET', 'Newcastle upon Tyne'),
('GB', 'NFK', 'Norfolk'),
('GB', 'NGM', 'Nottingham'),
('GB', 'NIR', 'Northern Ireland'),
('GB', 'NLK', 'North Lanarkshire'),
('GB', 'NLN', 'North Lincolnshire'),
('GB', 'NSM', 'North Somerset'),
('GB', 'NTA', 'Newtownabbey'),
('GB', 'NTH', 'Northamptonshire'),
('GB', 'NTL', 'Neath Port Talbot [Castell-nedd Port Talbot GB-CTL]'),
('GB', 'NTT', 'Nottinghamshire'),
('GB', 'NTY', 'North Tyneside'),
('GB', 'NWM', 'Newham'),
('GB', 'NWP', 'Newport [Casnewydd GB-CNW]'),
('GB', 'NYK', 'North Yorkshire'),
('GB', 'NYM', 'Newry and Mourne'),
('GB', 'OLD', 'Oldham'),
('GB', 'OMH', 'Omagh'),
('GB', 'ORK', 'Orkney Islands'),
('GB', 'OXF', 'Oxfordshire'),
('GB', 'PEM', 'Pembrokeshire [Sir Benfro GB-BNF]'),
('GB', 'PKN', 'Perth and Kinross'),
('GB', 'PLY', 'Plymouth'),
('GB', 'POL', 'Poole'),
('GB', 'POR', 'Portsmouth'),
('GB', 'POW', 'Powys'),
('GB', 'PTE', 'Peterborough'),
('GB', 'RCC', 'Redcar and Cleveland'),
('GB', 'RCH', 'Rochdale'),
('GB', 'RCT', 'Rhondda, Cynon, Taff [Rhondda, Cynon,Taf]'),
('GB', 'RDB', 'Redbridge'),
('GB', 'RDG', 'Reading'),
('GB', 'RFW', 'Renfrewshire'),
('GB', 'RIC', 'Richmond upon Thames'),
('GB', 'ROT', 'Rotherham'),
('GB', 'RUT', 'Rutland'),
('GB', 'SAW', 'Sandwell'),
('GB', 'SAY', 'South Ayrshire'),
('GB', 'SCB', 'Scottish Borders, The'),
('GB', 'SCT', 'Scotland'),
('GB', 'SFK', 'Suffolk'),
('GB', 'SFT', 'Sefton'),
('GB', 'SGC', 'South Gloucestershire'),
('GB', 'SHF', 'Sheffield'),
('GB', 'SHN', 'St. Helens'),
('GB', 'SHR', 'Shropshire'),
('GB', 'SKP', 'Stockport'),
('GB', 'SLF', 'Salford'),
('GB', 'SLG', 'Slough'),
('GB', 'SLK', 'South Lanarkshire'),
('GB', 'SND', 'Sunderland'),
('GB', 'SOL', 'Solihull'),
('GB', 'SOM', 'Somerset'),
('GB', 'SOS', 'Southend-on-Sea'),
('GB', 'SRY', 'Surrey'),
('GB', 'STB', 'Strabane'),
('GB', 'STE', 'Stoke-on-Trent'),
('GB', 'STG', 'Stirling'),
('GB', 'STH', 'Southampton'),
('GB', 'STN', 'Sutton'),
('GB', 'STS', 'Staffordshire'),
('GB', 'STT', 'Stockton-on-Tees'),
('GB', 'STY', 'South Tyneside'),
('GB', 'SWA', 'Swansea [Abertawe GB-ATA]'),
('GB', 'SWD', 'Swindon'),
('GB', 'SWK', 'Southwark'),
('GB', 'TAM', 'Tameside'),
('GB', 'TFW', 'Telford and Wrekin'),
('GB', 'THR', 'Thurrock'),
('GB', 'TOB', 'Torbay'),
('GB', 'TOF', 'Torfaen [Tor-faen]'),
('GB', 'TRF', 'Trafford'),
('GB', 'TWH', 'Tower Hamlets'),
('GB', 'VGL', 'Vale of Glamorgan, The [Bro Morgannwg GB-BMG]'),
('GB', 'WAR', 'Warwickshire'),
('GB', 'WBK', 'West Berkshire'),
('GB', 'WDU', 'West Dunbartonshire'),
('GB', 'WFT', 'Waltham Forest'),
('GB', 'WGN', 'Wigan'),
('GB', 'WIL', 'Wiltshire'),
('GB', 'WKF', 'Wakefield'),
('GB', 'WLL', 'Walsall'),
('GB', 'WLN', 'West Lothian'),
('GB', 'WLS', 'Wales'),
('GB', 'WLV', 'Wolverhampton'),
('GB', 'WND', 'Wandsworth'),
('GB', 'WNM', 'Windsor and Maidenhead'),
('GB', 'WOK', 'Wokingham'),
('GB', 'WOR', 'Worcestershire'),
('GB', 'WRL', 'Wirral'),
('GB', 'WRT', 'Warrington'),
('GB', 'WRX', 'Wrexham [Wrecsam GB-WRC]'),
('GB', 'WSM', 'Westminster'),
('GB', 'WSX', 'West Sussex'),
('GB', 'YOR', 'York'),
('GB', 'ZET', 'Shetland Islands'),
('GD', '01', 'Saint Andrew'),
('GD', '02', 'Saint David'),
('GD', '03', 'Saint George'),
('GD', '04', 'Saint John'),
('GD', '05', 'Saint Mark'),
('GD', '06', 'Saint Patrick'),
('GD', '10', 'Southern Grenadine Islands'),
('GE', 'AB', 'Abkhazia'),
('GE', 'AJ', 'Ajaria'),
('GE', 'GU', 'Guria'),
('GE', 'IM', 'Imereti'),
('GE', 'KA', 'Kakheti'),
('GE', 'KK', 'Kvemo Kartli'),
('GE', 'MM', 'Mtskheta-Mtianeti'),
('GE', 'RL', 'Racha-Lechkhumi [and] Kvemo Svaneti'),
('GE', 'SJ', 'Samtskhe-Javakheti'),
('GE', 'SK', 'Shida Kartli'),
('GE', 'SZ', 'Samegrelo-Zemo Svaneti'),
('GE', 'TB', 'Tbilisi'),
('GH', 'AA', 'Greater Accra'),
('GH', 'AH', 'Ashanti'),
('GH', 'BA', 'Brong-Ahafo'),
('GH', 'CP', 'Central'),
('GH', 'EP', 'Eastern'),
('GH', 'NP', 'Northern'),
('GH', 'TV', 'Volta'),
('GH', 'UE', 'Upper East'),
('GH', 'UW', 'Upper West'),
('GH', 'WP', 'Western'),
('GL', 'KU', 'Kommune Kujalleq'),
('GL', 'QA', 'Qaasuitsup Kommunia'),
('GL', 'QE', 'Qeqqata Kommunia'),
('GL', 'SM', 'Kommuneqarfik Sermersooq'),
('GM', 'B', 'Banjul'),
('GM', 'L', 'Lower River'),
('GM', 'M', 'MacCarthy Island'),
('GM', 'N', 'North Bank'),
('GM', 'U', 'Upper River'),
('GM', 'W', 'Western'),
('GN', 'B', 'Boké'),
('GN', 'BE', 'Beyla'),
('GN', 'BF', 'Boffa'),
('GN', 'BK', 'Boké'),
('GN', 'C', 'Conakry'),
('GN', 'CO', 'Coyah'),
('GN', 'D', 'Kindia'),
('GN', 'DB', 'Dabola'),
('GN', 'DI', 'Dinguiraye'),
('GN', 'DL', 'Dalaba'),
('GN', 'DU', 'Dubréka'),
('GN', 'F', 'faranah'),
('GN', 'FA', 'Faranah'),
('GN', 'FO', 'Forécariah'),
('GN', 'FR', 'Fria'),
('GN', 'GA', 'Gaoual'),
('GN', 'GU', 'Guékédou'),
('GN', 'K', 'Kankan'),
('GN', 'KA', 'Kankan'),
('GN', 'KB', 'Koubia'),
('GN', 'KD', 'Kindia'),
('GN', 'KE', 'Kérouané'),
('GN', 'KN', 'Koundara'),
('GN', 'KO', 'Kouroussa'),
('GN', 'KS', 'Kissidougou'),
('GN', 'L', 'Labé'),
('GN', 'LA', 'Labé'),
('GN', 'LE', 'Lélouma'),
('GN', 'LO', 'Lola'),
('GN', 'M', 'Mamou'),
('GN', 'MC', 'Macenta'),
('GN', 'MD', 'Mandiana'),
('GN', 'ML', 'Mali'),
('GN', 'MM', 'Mamou'),
('GN', 'N', 'Nzérékoré'),
('GN', 'NZ', 'Nzérékoré'),
('GN', 'PI', 'Pita'),
('GN', 'SI', 'Siguiri'),
('GN', 'TE', 'Télimélé'),
('GN', 'TO', 'Tougué'),
('GN', 'YO', 'Yomou'),
('GQ', 'AN', 'Annobón'),
('GQ', 'BN', 'Bioko Norte'),
('GQ', 'BS', 'Bioko Sur'),
('GQ', 'C', 'Región Continental'),
('GQ', 'CS', 'Centro Sur'),
('GQ', 'I', 'Región Insular'),
('GQ', 'KN', 'Kie-Ntem'),
('GQ', 'LI', 'Litoral'),
('GQ', 'WN', 'Wele-Nzás'),
('GR', '01', 'Aitolia kai Akarnania'),
('GR', '03', 'Voiotia'),
('GR', '04', 'Evvoia'),
('GR', '05', 'Evrytania'),
('GR', '06', 'Fthiotida'),
('GR', '07', 'Fokida'),
('GR', '11', 'Argolida'),
('GR', '12', 'Arkadia'),
('GR', '13', 'Achaïa'),
('GR', '14', 'Ileia'),
('GR', '15', 'Korinthia'),
('GR', '16', 'Lakonia'),
('GR', '17', 'Messinia'),
('GR', '21', 'Zakynthos'),
('GR', '22', 'Kerkyra'),
('GR', '23', 'Kefallonia'),
('GR', '24', 'Lefkada'),
('GR', '31', 'Arta'),
('GR', '32', 'Thesprotia'),
('GR', '33', 'Ioannina'),
('GR', '34', 'Preveza'),
('GR', '41', 'Karditsa'),
('GR', '42', 'Larisa'),
('GR', '43', 'Magnisia'),
('GR', '44', 'Trikala'),
('GR', '51', 'Grevena'),
('GR', '52', 'Drama'),
('GR', '53', 'Imathia'),
('GR', '54', 'Thessaloniki'),
('GR', '55', 'Kavala'),
('GR', '56', 'Kastoria'),
('GR', '57', 'Kilkis'),
('GR', '58', 'Kozani'),
('GR', '59', 'Pella'),
('GR', '61', 'Pieria'),
('GR', '62', 'Serres'),
('GR', '63', 'Florina'),
('GR', '64', 'Chalkidiki'),
('GR', '69', 'Agio Oros'),
('GR', '71', 'Evros'),
('GR', '72', 'Xanthi'),
('GR', '73', 'Rodopi'),
('GR', '81', 'Dodekanisos'),
('GR', '82', 'Kyklades'),
('GR', '83', 'Lesvos'),
('GR', '84', 'Samos'),
('GR', '85', 'Chios'),
('GR', '91', 'Irakleio'),
('GR', '92', 'Lasithi'),
('GR', '93', 'Rethymno'),
('GR', '94', 'Chania'),
('GR', 'A', 'Anatoliki Makedonia kai Thraki'),
('GR', 'A1', 'Attiki'),
('GR', 'B', 'Kentriki Makedonia'),
('GR', 'C', 'Dytiki Makedonia'),
('GR', 'D', 'Ipeiros'),
('GR', 'E', 'Thessalia'),
('GR', 'F', 'Ionia Nisia'),
('GR', 'G', 'Dytiki Ellada'),
('GR', 'H', 'Sterea Ellada'),
('GR', 'I', 'Attiki'),
('GR', 'J', 'Peloponnisos'),
('GR', 'K', 'Voreio Aigaio'),
('GR', 'L', 'Notio Aigaio'),
('GR', 'M', 'Kriti'),
('GT', 'AV', 'Alta Verapaz'),
('GT', 'BV', 'Baja Verapaz'),
('GT', 'CM', 'Chimaltenango'),
('GT', 'CQ', 'Chiquimula'),
('GT', 'ES', 'Escuintla'),
('GT', 'GU', 'Guatemala'),
('GT', 'HU', 'Huehuetenango'),
('GT', 'IZ', 'Izabal'),
('GT', 'JA', 'Jalapa'),
('GT', 'JU', 'Jutiapa'),
('GT', 'PE', 'Petén'),
('GT', 'PR', 'El Progreso'),
('GT', 'QC', 'Quiché'),
('GT', 'QZ', 'Quetzaltenango'),
('GT', 'RE', 'Retalhuleu'),
('GT', 'SA', 'Sacatepéquez'),
('GT', 'SM', 'San Marcos'),
('GT', 'SO', 'Sololá'),
('GT', 'SR', 'Santa Rosa'),
('GT', 'SU', 'Suchitepéquez'),
('GT', 'TO', 'Totonicapán'),
('GT', 'ZA', 'Zacapa'),
('GW', 'BA', 'Bafatá'),
('GW', 'BL', 'Bolama'),
('GW', 'BM', 'Biombo'),
('GW', 'BS', 'Bissau'),
('GW', 'CA', 'Cacheu'),
('GW', 'GA', 'Gabú'),
('GW', 'L', 'Leste'),
('GW', 'N', 'Norte'),
('GW', 'OI', 'Oio'),
('GW', 'QU', 'Quinara'),
('GW', 'S', 'Sul'),
('GW', 'TO', 'Tombali'),
('GY', 'BA', 'Barima-Waini'),
('GY', 'CU', 'Cuyuni-Mazaruni'),
('GY', 'DE', 'Demerara-Mahaica'),
('GY', 'EB', 'East Berbice-Corentyne'),
('GY', 'ES', 'Essequibo Islands-West Demerara'),
('GY', 'MA', 'Mahaica-Berbice'),
('GY', 'PM', 'Pomeroon-Supenaam'),
('GY', 'PT', 'Potaro-Siparuni'),
('GY', 'UD', 'Upper Demerara-Berbice'),
('GY', 'UT', 'Upper Takutu-Upper Essequibo'),
('HN', 'AT', 'Atlántida'),
('HN', 'CH', 'Choluteca'),
('HN', 'CL', 'Colón'),
('HN', 'CM', 'Comayagua'),
('HN', 'CP', 'Copán'),
('HN', 'CR', 'Cortés'),
('HN', 'EP', 'El Paraíso'),
('HN', 'FM', 'Francisco Morazán'),
('HN', 'GD', 'Gracias a Dios'),
('HN', 'IB', 'Islas de la Bahía'),
('HN', 'IN', 'Intibucá'),
('HN', 'LE', 'Lempira'),
('HN', 'LP', 'La Paz'),
('HN', 'OC', 'Ocotepeque'),
('HN', 'OL', 'Olancho'),
('HN', 'SB', 'Santa Bárbara'),
('HN', 'VA', 'Valle'),
('HN', 'YO', 'Yoro'),
('HR', '01', 'Zagrebacka županija'),
('HR', '02', 'Krapinsko-zagorska županija'),
('HR', '03', 'Sisacko-moslavacka županija'),
('HR', '04', 'Karlovacka županija'),
('HR', '05', 'Varaždinska županija'),
('HR', '06', 'Koprivnicko-križevacka županija'),
('HR', '07', 'Bjelovarsko-bilogorska županija'),
('HR', '08', 'Primorsko-goranska županija'),
('HR', '09', 'Licko-senjska županija'),
('HR', '10', 'Viroviticko-podravska županija'),
('HR', '11', 'Požeško-slavonska županija'),
('HR', '12', 'Brodsko-posavska županija'),
('HR', '13', 'Zadarska županija'),
('HR', '14', 'Osjecko-baranjska županija'),
('HR', '15', 'Šibensko-kninska županija'),
('HR', '16', 'Vukovarsko-srijemska županija'),
('HR', '17', 'Splitsko-dalmatinska županija'),
('HR', '18', 'Istarska županija'),
('HR', '19', 'Dubrovacko-neretvanska županija'),
('HR', '20', 'Medimurska županija'),
('HR', '21', 'Grad Zagreb'),
('HT', 'AR', 'Artibonite'),
('HT', 'CE', 'Centre'),
('HT', 'GA', 'Grande-Anse'),
('HT', 'ND', 'Nord'),
('HT', 'NE', 'Nord-Est'),
('HT', 'NI', 'Nippes'),
('HT', 'NO', 'Nord-Ouest'),
('HT', 'OU', 'Ouest'),
('HT', 'SD', 'Sud'),
('HT', 'SE', 'Sud-Est'),
('HU', 'BA', 'Baranya'),
('HU', 'BC', 'Békéscsaba'),
('HU', 'BE', 'Békés'),
('HU', 'BK', 'Bács-Kiskun'),
('HU', 'BU', 'Budapest'),
('HU', 'BZ', 'Borsod-Abaúj-Zemplén'),
('HU', 'CS', 'Csongrád'),
('HU', 'DE', 'Debrecen'),
('HU', 'DU', 'Dunaújváros'),
('HU', 'EG', 'Eger'),
('HU', 'ER', 'Erd'),
('HU', 'FE', 'Fejér'),
('HU', 'GS', 'Gyor-Moson-Sopron'),
('HU', 'GY', 'Gyor'),
('HU', 'HB', 'Hajdú-Bihar'),
('HU', 'HE', 'Heves'),
('HU', 'HV', 'Hódmezovásárhely'),
('HU', 'JN', 'Jász-Nagykun-Szolnok'),
('HU', 'KE', 'Komárom-Esztergom'),
('HU', 'KM', 'Kecskemét'),
('HU', 'KV', 'Kaposvár'),
('HU', 'MI', 'Miskolc'),
('HU', 'NK', 'Nagykanizsa'),
('HU', 'NO', 'Nógrád'),
('HU', 'NY', 'Nyíregyháza'),
('HU', 'PE', 'Pest'),
('HU', 'PS', 'Pécs'),
('HU', 'SD', 'Szeged'),
('HU', 'SF', 'Székesfehérvár'),
('HU', 'SH', 'Szombathely'),
('HU', 'SK', 'Szolnok'),
('HU', 'SN', 'Sopron'),
('HU', 'SO', 'Somogy'),
('HU', 'SS', 'Szekszárd'),
('HU', 'ST', 'Salgótarján'),
('HU', 'SZ', 'Szabolcs-Szatmár-Bereg'),
('HU', 'TB', 'Tatabánya'),
('HU', 'TO', 'Tolna'),
('HU', 'VA', 'Vas'),
('HU', 'VE', 'Veszprém');
INSERT INTO `states` (`country_alpha2`, `code`, `name`) VALUES
('HU', 'VM', 'Veszprém City'),
('HU', 'ZA', 'Zala'),
('HU', 'ZE', 'Zalaegerszeg'),
('ID', 'AC', 'Aceh'),
('ID', 'BA', 'Bali'),
('ID', 'BB', 'Bangka Belitung'),
('ID', 'BE', 'Bengkulu'),
('ID', 'BT', 'Banten'),
('ID', 'GO', 'Gorontalo'),
('ID', 'IJ', 'Papua'),
('ID', 'JA', 'Jambi'),
('ID', 'JB', 'Jawa Barat'),
('ID', 'JI', 'Jawa Timur'),
('ID', 'JK', 'Jakarta Raya'),
('ID', 'JT', 'Jawa Tengah'),
('ID', 'JW', 'Jawa'),
('ID', 'KA', 'Kalimantan'),
('ID', 'KB', 'Kalimantan Barat'),
('ID', 'KI', 'Kalimantan Timur'),
('ID', 'KR', 'Kepulauan Riau'),
('ID', 'KS', 'Kalimantan Selatan'),
('ID', 'KT', 'Kalimantan Tengah'),
('ID', 'LA', 'Lampung'),
('ID', 'MA', 'Maluku'),
('ID', 'ML', 'Maluku'),
('ID', 'MU', 'Maluku Utara'),
('ID', 'NB', 'Nusa Tenggara Barat'),
('ID', 'NT', 'Nusa Tenggara Timur'),
('ID', 'NU', 'Nusa Tenggara'),
('ID', 'PA', 'Papua'),
('ID', 'PB', 'Papua Barat'),
('ID', 'RI', 'Riau'),
('ID', 'SA', 'Sulawesi Utara'),
('ID', 'SB', 'Sumatera Barat'),
('ID', 'SG', 'Sulawesi Tenggara'),
('ID', 'SL', 'Sulawesi'),
('ID', 'SM', 'Sumatera'),
('ID', 'SN', 'Sulawesi Selatan'),
('ID', 'SR', 'Sulawesi Barat'),
('ID', 'SS', 'Sumatera Selatan'),
('ID', 'ST', 'Sulawesi Tengah'),
('ID', 'SU', 'Sumatera Utara'),
('ID', 'YO', 'Yogyakarta'),
('IE', 'C', 'Connaught'),
('IE', 'CE', 'Clare'),
('IE', 'CN', 'Cavan'),
('IE', 'CO', 'Cork'),
('IE', 'CW', 'Carlow'),
('IE', 'D', 'Dublin'),
('IE', 'DL', 'Donegal'),
('IE', 'G', 'Galway'),
('IE', 'KE', 'Kildare'),
('IE', 'KK', 'Kilkenny'),
('IE', 'KY', 'Kerry'),
('IE', 'L', 'Leinster'),
('IE', 'LD', 'Longford'),
('IE', 'LH', 'Louth'),
('IE', 'LK', 'Limerick'),
('IE', 'LM', 'Leitrim'),
('IE', 'LS', 'Laois'),
('IE', 'M', 'Munster'),
('IE', 'MH', 'Meath'),
('IE', 'MN', 'Monaghan'),
('IE', 'MO', 'Mayo'),
('IE', 'OY', 'Offaly'),
('IE', 'RN', 'Roscommon'),
('IE', 'SO', 'Sligo'),
('IE', 'TA', 'Tipperary'),
('IE', 'U', 'Ulster'),
('IE', 'WD', 'Waterford'),
('IE', 'WH', 'Westmeath'),
('IE', 'WW', 'Wicklow'),
('IE', 'WX', 'Wexford'),
('IL', 'D', 'HaDarom'),
('IL', 'HA', 'Haifa'),
('IL', 'JM', 'Yerushalayim'),
('IL', 'M', 'HaMerkaz'),
('IL', 'TA', 'Tel-Aviv'),
('IL', 'Z', 'HaZafon'),
('IN', 'AN', 'Andaman and Nicobar Islands'),
('IN', 'AP', 'Andhra Pradesh'),
('IN', 'AR', 'Arunachal Pradesh'),
('IN', 'AS', 'Assam'),
('IN', 'BR', 'Bihar'),
('IN', 'CH', 'Chandigarh'),
('IN', 'CT', 'Chhattisgarh'),
('IN', 'DD', 'Daman and Diu'),
('IN', 'DL', 'Delhi'),
('IN', 'DN', 'Dadra and Nagar Haveli'),
('IN', 'GA', 'Goa'),
('IN', 'GJ', 'Gujarat'),
('IN', 'HP', 'Himachal Pradesh'),
('IN', 'HR', 'Haryana'),
('IN', 'JH', 'Jharkhand'),
('IN', 'JK', 'Jammu and Kashmir'),
('IN', 'KA', 'Karnataka'),
('IN', 'KL', 'Kerala'),
('IN', 'LD', 'Lakshadweep'),
('IN', 'MH', 'Maharashtra'),
('IN', 'ML', 'Meghalaya'),
('IN', 'MN', 'Manipur'),
('IN', 'MP', 'Madhya Pradesh'),
('IN', 'MZ', 'Mizoram'),
('IN', 'NL', 'Nagaland'),
('IN', 'OR', 'Orissa'),
('IN', 'PB', 'Punjab'),
('IN', 'PY', 'Pondicherry'),
('IN', 'RJ', 'Rajasthan'),
('IN', 'SK', 'Sikkim'),
('IN', 'TN', 'Tamil Nadu'),
('IN', 'TR', 'Tripura'),
('IN', 'UP', 'Uttar Pradesh'),
('IN', 'UT', 'Uttaranchal'),
('IN', 'WB', 'West Bengal'),
('IQ', 'AN', 'Al Anbar'),
('IQ', 'AR', 'Arbil'),
('IQ', 'BA', 'Al Basrah'),
('IQ', 'BB', 'Babil'),
('IQ', 'BG', 'Baghdad'),
('IQ', 'DA', 'Dahuk'),
('IQ', 'DI', 'Diyalá'),
('IQ', 'DQ', 'Dhi Qar'),
('IQ', 'KA', 'Karbala\''),
('IQ', 'MA', 'Maysan'),
('IQ', 'MU', 'Al Muthanná'),
('IQ', 'NA', 'An Najaf'),
('IQ', 'NI', 'Ninawá'),
('IQ', 'QA', 'Al Qadisiyah'),
('IQ', 'SD', 'Salah ad Din'),
('IQ', 'SU', 'As Sulaymaniyah'),
('IQ', 'TS', 'At Ta\'mim'),
('IQ', 'WA', 'Wasit'),
('IR', '01', 'Az¯arbayjan-e Sharqi'),
('IR', '02', 'Az¯arbayjan-e Gharbi'),
('IR', '03', 'Ardabil'),
('IR', '04', 'Esfahan'),
('IR', '05', 'Ilam'),
('IR', '06', 'Bushehr'),
('IR', '07', 'Tehran'),
('IR', '08', 'Chahar Mah¸all va Bakhtiari'),
('IR', '09', 'Khorasan'),
('IR', '10', 'Khuzestan'),
('IR', '11', 'Zanjan'),
('IR', '12', 'Semnan'),
('IR', '13', 'Sistan va Baluchestan'),
('IR', '14', 'Fars'),
('IR', '15', 'Kerman'),
('IR', '16', 'Kordestan'),
('IR', '17', 'Kermanshah'),
('IR', '18', 'Kohkiluyeh va Buyer Ahmad'),
('IR', '19', 'Gilan'),
('IR', '20', 'Lorestan'),
('IR', '21', 'Mazandaran'),
('IR', '22', 'Markazi'),
('IR', '23', 'Hormozgan'),
('IR', '24', 'Hamadan'),
('IR', '25', 'Yazd'),
('IR', '26', 'Qom'),
('IR', '27', 'Golestan'),
('IR', '28', 'Qazvin'),
('IR', '29', 'Khorasan-e Janubi'),
('IR', '30', 'Khorasan-e Razavi'),
('IR', '31', 'Khorasan-e Shemali'),
('IS', '0', 'Reykjavík'),
('IS', '1', 'Höfuðborgarsvæði utan Reykjavíkur'),
('IS', '2', 'Suðurnes'),
('IS', '3', 'Vesturland'),
('IS', '4', 'Vestfirðir'),
('IS', '5', 'Norðurland vestra'),
('IS', '6', 'Norðurland eystra'),
('IS', '7', 'Austurland'),
('IS', '8', 'Suðurland'),
('IT', '21', 'Piemonte'),
('IT', '23', 'Valle d\'Aosta'),
('IT', '25', 'Lombardia'),
('IT', '32', 'Trentino-Alto Adige'),
('IT', '34', 'Veneto'),
('IT', '36', 'Friuli-Venezia Giulia'),
('IT', '42', 'Liguria'),
('IT', '45', 'Emilia-Romagna'),
('IT', '52', 'Toscana'),
('IT', '55', 'Umbria'),
('IT', '57', 'Marche'),
('IT', '62', 'Lazio'),
('IT', '65', 'Abruzzo'),
('IT', '67', 'Molise'),
('IT', '72', 'Campania'),
('IT', '75', 'Puglia'),
('IT', '77', 'Basilicata'),
('IT', '78', 'Calabria'),
('IT', '82', 'Sicilia'),
('IT', '88', 'Sardegna'),
('IT', 'AG', 'Agrigento'),
('IT', 'AL', 'Alessandria'),
('IT', 'AN', 'Ancona'),
('IT', 'AO', 'Aosta'),
('IT', 'AP', 'Ascoli Piceno'),
('IT', 'AQ', 'L\'Aquila'),
('IT', 'AR', 'Arezzo'),
('IT', 'AT', 'Asti'),
('IT', 'AV', 'Avellino'),
('IT', 'BA', 'Bari'),
('IT', 'BG', 'Bergamo'),
('IT', 'BI', 'Biella'),
('IT', 'BL', 'Belluno'),
('IT', 'BN', 'Benevento'),
('IT', 'BO', 'Bologna'),
('IT', 'BR', 'Brindisi'),
('IT', 'BS', 'Brescia'),
('IT', 'BT', 'Barletta-Andria-Trani'),
('IT', 'BZ', 'Bolzano'),
('IT', 'CA', 'Cagliari'),
('IT', 'CB', 'Campobasso'),
('IT', 'CE', 'Caserta'),
('IT', 'CH', 'Chieti'),
('IT', 'CI', 'Carbonia-Iglesias'),
('IT', 'CL', 'Caltanissetta'),
('IT', 'CN', 'Cuneo'),
('IT', 'CO', 'Como'),
('IT', 'CR', 'Cremona'),
('IT', 'CS', 'Cosenza'),
('IT', 'CT', 'Catania'),
('IT', 'CZ', 'Catanzaro'),
('IT', 'EN', 'Enna'),
('IT', 'FC', 'Forli-Cesena'),
('IT', 'FE', 'Ferrara'),
('IT', 'FG', 'Foggia'),
('IT', 'FI', 'Firenze'),
('IT', 'FM', 'Fermo'),
('IT', 'FR', 'Frosinone'),
('IT', 'GE', 'Genova'),
('IT', 'GO', 'Gorizia'),
('IT', 'GR', 'Grosseto'),
('IT', 'IM', 'Imperia'),
('IT', 'IS', 'Isernia'),
('IT', 'KR', 'Crotone'),
('IT', 'LC', 'Lecco'),
('IT', 'LE', 'Lecce'),
('IT', 'LI', 'Livorno'),
('IT', 'LO', 'Lodi'),
('IT', 'LT', 'Latina'),
('IT', 'LU', 'Lucca'),
('IT', 'MB', 'Monza e Brianza'),
('IT', 'MC', 'Macerata'),
('IT', 'ME', 'Messina'),
('IT', 'MI', 'Milano'),
('IT', 'MN', 'Mantova'),
('IT', 'MO', 'Modena'),
('IT', 'MS', 'Massa-Carrara'),
('IT', 'MT', 'Matera'),
('IT', 'NA', 'Napoli'),
('IT', 'NO', 'Novara'),
('IT', 'NU', 'Nuoro'),
('IT', 'OG', 'Ogliastra'),
('IT', 'OR', 'Oristano'),
('IT', 'OT', 'Olbia-Tempio'),
('IT', 'PA', 'Palermo'),
('IT', 'PC', 'Piacenza'),
('IT', 'PD', 'Padova'),
('IT', 'PE', 'Pescara'),
('IT', 'PG', 'Perugia'),
('IT', 'PI', 'Pisa'),
('IT', 'PN', 'Pordenone'),
('IT', 'PO', 'Prato'),
('IT', 'PR', 'Parma'),
('IT', 'PT', 'Pistoia'),
('IT', 'PU', 'Pesaro e Urbino'),
('IT', 'PV', 'Pavia'),
('IT', 'PZ', 'Potenza'),
('IT', 'RA', 'Ravenna'),
('IT', 'RC', 'Reggio Calabria'),
('IT', 'RE', 'Reggio Emilia'),
('IT', 'RG', 'Ragusa'),
('IT', 'RI', 'Rieti'),
('IT', 'RM', 'Roma'),
('IT', 'RN', 'Rimini'),
('IT', 'RO', 'Rovigo'),
('IT', 'SA', 'Salerno'),
('IT', 'SI', 'Siena'),
('IT', 'SO', 'Sondrio'),
('IT', 'SP', 'La Spezia'),
('IT', 'SR', 'Siracusa'),
('IT', 'SS', 'Sassari'),
('IT', 'SV', 'Savona'),
('IT', 'TA', 'Taranto'),
('IT', 'TE', 'Teramo'),
('IT', 'TN', 'Trento'),
('IT', 'TO', 'Torino'),
('IT', 'TP', 'Trapani'),
('IT', 'TR', 'Terni'),
('IT', 'TS', 'Trieste'),
('IT', 'TV', 'Treviso'),
('IT', 'UD', 'Udine'),
('IT', 'VA', 'Varese'),
('IT', 'VB', 'Verbano-Cusio-Ossola'),
('IT', 'VC', 'Vercelli'),
('IT', 'VE', 'Venezia'),
('IT', 'VI', 'Vicenza'),
('IT', 'VR', 'Verona'),
('IT', 'VS', 'Medio Campidano'),
('IT', 'VT', 'Viterbo'),
('IT', 'VV', 'Vibo Valentia'),
('JM', '01', 'Kingston'),
('JM', '02', 'Saint Andrew'),
('JM', '03', 'Saint Thomas'),
('JM', '04', 'Portland'),
('JM', '05', 'Saint Mary'),
('JM', '06', 'Saint Ann'),
('JM', '07', 'Trelawny'),
('JM', '08', 'Saint James'),
('JM', '09', 'Hanover'),
('JM', '10', 'Westmoreland'),
('JM', '11', 'Saint Elizabeth'),
('JM', '12', 'Manchester'),
('JM', '13', 'Clarendon'),
('JM', '14', 'Saint Catherine'),
('JO', 'AJ', '‘Ajlūn'),
('JO', 'AM', '‘Ammān'),
('JO', 'AQ', 'Al ‘Aqabah'),
('JO', 'AT', 'At Tafilah'),
('JO', 'AZ', 'Az Zarqā\''),
('JO', 'BA', 'Al Balqa\''),
('JO', 'IR', 'Irbid'),
('JO', 'JA', 'Jarash'),
('JO', 'KA', 'Al Karak'),
('JO', 'MA', 'Al Mafraq'),
('JO', 'MD', 'Mādabā'),
('JO', 'MN', 'Ma`an'),
('JP', '01', 'Hokkaidô [Hokkaido]'),
('JP', '02', 'Aomori'),
('JP', '03', 'Iwate'),
('JP', '04', 'Miyagi'),
('JP', '05', 'Akita'),
('JP', '06', 'Yamagata'),
('JP', '07', 'Hukusima [Fukushima]'),
('JP', '08', 'Ibaraki'),
('JP', '09', 'Totigi [Tochigi]'),
('JP', '10', 'Gunma'),
('JP', '11', 'Saitama'),
('JP', '12', 'Tiba [Chiba]'),
('JP', '13', 'Tôkyô [Tokyo]'),
('JP', '14', 'Kanagawa'),
('JP', '15', 'Niigata'),
('JP', '16', 'Toyama'),
('JP', '17', 'Isikawa [Ishikawa]'),
('JP', '18', 'Hukui [Fukui]'),
('JP', '19', 'Yamanasi [Yamanashi]'),
('JP', '20', 'Nagano'),
('JP', '21', 'Gihu [Gifu]'),
('JP', '22', 'Sizuoka [Shizuoka]'),
('JP', '23', 'Aiti [Aichi]'),
('JP', '24', 'Mie'),
('JP', '25', 'Siga [Shiga]'),
('JP', '26', 'Kyôto [Kyoto]'),
('JP', '27', 'Ôsaka [Osaka]'),
('JP', '28', 'Hyôgo [Hyogo]'),
('JP', '29', 'Nara'),
('JP', '30', 'Wakayama'),
('JP', '31', 'Tottori'),
('JP', '32', 'Simane [Shimane]'),
('JP', '33', 'Okayama'),
('JP', '34', 'Hirosima [Hiroshima]'),
('JP', '35', 'Yamaguti [Yamaguchi]'),
('JP', '36', 'Tokusima [Tokushima]'),
('JP', '37', 'Kagawa'),
('JP', '38', 'Ehime'),
('JP', '39', 'Kôti [Kochi]'),
('JP', '40', 'Hukuoka [Fukuoka]'),
('JP', '41', 'Saga'),
('JP', '42', 'Nagasaki'),
('JP', '43', 'Kumamoto'),
('JP', '44', 'Ôita [Oita]'),
('JP', '45', 'Miyazaki'),
('JP', '46', 'Kagosima [Kagoshima]'),
('JP', '47', 'Okinawa'),
('KE', '110', 'Nairobi'),
('KE', '200', 'Central'),
('KE', '300', 'Coast'),
('KE', '400', 'Eastern'),
('KE', '500', 'North-Eastern'),
('KE', '600', 'Nyanza'),
('KE', '700', 'Rift Valley'),
('KE', '800', 'Western'),
('KG', 'B', 'Batken'),
('KG', 'C', 'Chü'),
('KG', 'GB', 'Bishkek'),
('KG', 'J', 'Jalal-Abad'),
('KG', 'N', 'Naryn'),
('KG', 'O', 'Osh'),
('KG', 'T', 'Talas'),
('KG', 'Y', 'Ysyk-Köl'),
('KH', '1', 'Banteay Mean Chey [Bântéay Méanchey]'),
('KH', '10', 'Kracheh [Krâchéh]'),
('KH', '11', 'Mondol Kiri [Môndól Kiri]'),
('KH', '12', 'Phnom Penh [Phnum Pénh]'),
('KH', '13', 'Preah Vihear [Preah Vihéar]'),
('KH', '14', 'Prey Veaeng [Prey Vêng]'),
('KH', '15', 'Pousaat [Pouthisat]'),
('KH', '16', 'Rotanak Kiri [Rôtânôkiri]'),
('KH', '17', 'Siem Reab [Siemréab]'),
('KH', '18', 'Krong Preah Sihanouk [Krong Preah Sihanouk]'),
('KH', '19', 'Stueng Traeng [Stœ̆ng Trêng]'),
('KH', '2', 'Baat Dambang [Batdâmbâng]'),
('KH', '20', 'Svaay Rieng [Svay Rieng]'),
('KH', '21', 'Taakaev [Takêv]'),
('KH', '22', 'Otdar Mean Chey [Otdâr Méanchey]'),
('KH', '23', 'Krong Kaeb [Krong Kêb]'),
('KH', '24', 'Krong Pailin [Krong Pailin]'),
('KH', '3', 'Kampong Chaam [Kâmpóng Cham]'),
('KH', '4', 'Kampong Chhnang [Kâmpóng Chhnang]'),
('KH', '5', 'Kampong Spueu [Kâmpóng Spœ]'),
('KH', '6', 'Kampong Thum [Kâmpóng Thum]'),
('KH', '7', 'Kampot [Kâmpôt]'),
('KH', '8', 'Kandaal [Kândal]'),
('KH', '9', 'Kaoh Kong [Kaôh Kong]'),
('KI', 'G', 'Gilbert Islands'),
('KI', 'L', 'Line Islands'),
('KI', 'P', 'Phoenix Islands'),
('KM', 'A', 'Andjouân'),
('KM', 'G', 'Andjazîdja'),
('KM', 'M', 'Moûhîlî'),
('KN', '01', 'Christ Church Nichola Town'),
('KN', '02', 'Saint Anne Sandy Point'),
('KN', '03', 'Saint George Basseterre'),
('KN', '04', 'Saint George Gingerland'),
('KN', '05', 'Saint James Windward'),
('KN', '06', 'Saint John Capisterre'),
('KN', '07', 'Saint John Figtree'),
('KN', '08', 'Saint Mary Cayon'),
('KN', '09', 'Saint Paul Capisterre'),
('KN', '10', 'Saint Paul Charlestown'),
('KN', '11', 'Saint Peter Basseterre'),
('KN', '12', 'Saint Thomas Lowland'),
('KN', '13', 'Saint Thomas Middle Island'),
('KN', '15', 'Trinity Palmetto Point'),
('KN', 'K', 'Saint Kitts'),
('KN', 'N', 'Nevis'),
('KP', '01', 'Pyongyang'),
('KP', '02', 'Pyongan-namdo'),
('KP', '03', 'Pyongan-bukdo'),
('KP', '04', 'Chagang-do'),
('KP', '05', 'Hwanghae-namdo'),
('KP', '06', 'Hwanghae-bukto'),
('KP', '07', 'Kangwon-do'),
('KP', '08', 'Hamgyong-namdo'),
('KP', '09', 'Hamgyong-bukdo'),
('KP', '10', 'Yanggang-do'),
('KP', '13', 'Nason'),
('KR', '11', 'Seoul Teugbyeolsi [Seoul-T\'ukpyolshi]'),
('KR', '26', 'Busan Gwang\'yeogsi [Pusan-Kwangyokshi]'),
('KR', '27', 'Daegu Gwang\'yeogsi [Taegu-Kwangyokshi]'),
('KR', '28', 'Incheon Gwang\'yeogsi [Inch\'n-Kwangyokshi]'),
('KR', '29', 'Gwangju Gwang\'yeogsi [Kwangju-Kwangyokshi]'),
('KR', '30', 'Daejeon Gwang\'yeogsi [Taejon-Kwangyokshi]'),
('KR', '31', 'Ulsan Gwang\'yeogsi [Ulsan-Kwangyokshi]'),
('KR', '41', 'Gyeonggido [Kyonggi-do]'),
('KR', '42', 'Gang\'weondo [Kang-won-do]'),
('KR', '43', 'Chungcheongbugdo [Ch\'ungch\'ongbuk-do]'),
('KR', '44', 'Chungcheongnamdo [Ch\'ungch\'ongnam-do]'),
('KR', '45', 'Jeonrabugdo[Chollabuk-do]'),
('KR', '46', 'Jeonranamdo [Chollanam-do]'),
('KR', '47', 'Gyeongsangbugdo [Kyongsangbuk-do]'),
('KR', '48', 'Gyeongsangnamdo [Kyongsangnam-do]'),
('KR', '49', 'Jejudo [Cheju-do]'),
('KW', 'AH', 'Al Ahmadi'),
('KW', 'FA', 'Al Farwaniyah'),
('KW', 'HA', 'Hawalli'),
('KW', 'JA', 'Al Jahrah'),
('KW', 'KU', 'Al Kuwayt'),
('KW', 'MU', 'Mubarak al-Kabir'),
('KY', '01~', 'Bodden Town'),
('KY', '02~', 'Cayman Brac'),
('KY', '03~', 'East End'),
('KY', '04~', 'George Town'),
('KY', '06~', 'North Side'),
('KY', '07~', 'West Bay'),
('KY', 'Ky-', 'Little Cayman'),
('KZ', 'AKM', 'Aqmola oblysy'),
('KZ', 'AKT', 'Aqtöbe oblysy'),
('KZ', 'ALA', 'Almaty'),
('KZ', 'ALM', 'Almaty oblysy'),
('KZ', 'AST', 'Astana'),
('KZ', 'ATY', 'Atyrau oblysy'),
('KZ', 'BAY', 'Bayqongyr'),
('KZ', 'KAR', 'Qaraghandy oblysy'),
('KZ', 'KUS', 'Qostanay oblysy'),
('KZ', 'KZY', 'Qyzylorda oblysy'),
('KZ', 'MAN', 'Mangghystau oblysy'),
('KZ', 'PAV', 'Pavlodar oblysy'),
('KZ', 'SEV', 'Soltüstik Qazaqstan oblysy'),
('KZ', 'VOS', 'Shyghys Qazaqstan oblysy'),
('KZ', 'YUZ', 'Ongtüstik Qazaqstan oblysy'),
('KZ', 'ZAP', 'Batys Qazaqstan oblysy'),
('KZ', 'ZHA', 'Zhambyl oblysy'),
('LA', 'AT', 'Attapu [Attopeu]'),
('LA', 'BK', 'Bokèo'),
('LA', 'BL', 'Bolikhamxai [Borikhane]'),
('LA', 'CH', 'Champasak [Champassak]'),
('LA', 'HO', 'Houaphan'),
('LA', 'KH', 'Khammouan'),
('LA', 'LM', 'Louang Namtha'),
('LA', 'LP', 'Louangphabang [Louang Prabang]'),
('LA', 'OU', 'Oudômxai [Oudomsai]'),
('LA', 'PH', 'Phôngsali [Phong Saly]'),
('LA', 'SL', 'Salavan [Saravane]'),
('LA', 'SV', 'Savannakhét'),
('LA', 'VI', 'Vientiane'),
('LA', 'VT', 'Vientiane Prefecture'),
('LA', 'XA', 'Xaignabouli [Sayaboury]'),
('LA', 'XE', 'Xékong [Sékong]'),
('LA', 'XI', 'Xiangkhoang [Xieng Khouang]'),
('LA', 'XN', 'Xaisômboun'),
('LB', 'AK', 'Aakkar'),
('LB', 'AS', 'Loubnâne ech Chemâli'),
('LB', 'BA', 'Beirut'),
('LB', 'BH', 'Baalbek-Hermel'),
('LB', 'BI', 'El Béqaa'),
('LB', 'JA', 'Loubnâne ej Jnoûbi'),
('LB', 'JL', 'Jabal Loubnâne'),
('LB', 'NA', 'Nabatîyé'),
('LC', '01', 'Anse-la-Raye'),
('LC', '02', 'Castries'),
('LC', '03', 'Choiseul'),
('LC', '04', 'Dauphin'),
('LC', '05', 'Dennery'),
('LC', '06', 'Gros Inlet'),
('LC', '07', 'Laborie'),
('LC', '08', 'Micoud'),
('LC', '09', 'Praslin'),
('LC', '10', 'Soufrière'),
('LC', '11', 'Vieux Fort'),
('LI', '01', 'Balzers'),
('LI', '02', 'Eschen'),
('LI', '03', 'Gamprin'),
('LI', '04', 'Mauren'),
('LI', '05', 'Planken'),
('LI', '06', 'Ruggell'),
('LI', '07', 'Schaan'),
('LI', '08', 'Schellenberg'),
('LI', '09', 'Triesen'),
('LI', '10', 'Triesenberg'),
('LI', '11', 'Vaduz'),
('LK', '1', 'Basnāhira paḷāta'),
('LK', '11', 'Kŏḷamba'),
('LK', '12', 'Gampaha'),
('LK', '13', 'Kalutara'),
('LK', '2', 'Madhyama paḷāta'),
('LK', '21', 'Mahanuvara'),
('LK', '22', 'Mātale'),
('LK', '23', 'Nuvara Ĕliya'),
('LK', '3', 'Dakuṇu paḷāta'),
('LK', '31', 'Gālla'),
('LK', '32', 'Mātara'),
('LK', '33', 'Hambantŏṭa'),
('LK', '4', 'Uturu paḷāta'),
('LK', '41', 'Yāpanaya'),
('LK', '42', 'Kilinŏchchi'),
('LK', '43', 'Mannārama'),
('LK', '44', 'Vavuniyāva'),
('LK', '45', 'Mulativ'),
('LK', '5', 'Mattiya mākāṇam'),
('LK', '51', 'Madakalapuva'),
('LK', '52', 'Ampāra'),
('LK', '53', 'Trikuṇāmalaya'),
('LK', '6', 'Vayamba paḷāta'),
('LK', '61', 'Kuruṇægala'),
('LK', '62', 'Puttalama'),
('LK', '7', 'Uturumæ̆da paḷāta'),
('LK', '71', 'Anurādhapura'),
('LK', '72', 'Pŏḷŏnnaruva'),
('LK', '8', 'Ūva paḷāta'),
('LK', '81', 'Badulla'),
('LK', '82', 'Mŏṇarāgala'),
('LK', '9', 'Sabaragamuva paḷāta'),
('LK', '91', 'Ratnapura'),
('LK', '92', 'Kegalla'),
('LR', 'BG', 'Bong'),
('LR', 'BM', 'Bomi'),
('LR', 'CM', 'Grand Cape Mount'),
('LR', 'GB', 'Grand Bassa'),
('LR', 'GG', 'Grand Gedeh'),
('LR', 'GK', 'Grand Kru'),
('LR', 'LO', 'Lofa'),
('LR', 'MG', 'Margibi'),
('LR', 'MO', 'Montserrado'),
('LR', 'MY', 'Maryland'),
('LR', 'NI', 'Nimba'),
('LR', 'RI', 'Rivercess'),
('LR', 'SI', 'Sinoe'),
('LR', 'X1~', 'Gbarpolu'),
('LR', 'X2~', 'River Gee'),
('LS', 'A', 'Maseru'),
('LS', 'B', 'Butha-Buthe'),
('LS', 'C', 'Leribe'),
('LS', 'D', 'Berea'),
('LS', 'E', 'Mafeteng'),
('LS', 'F', 'Mohale\'s Hoek'),
('LS', 'G', 'Quthing'),
('LS', 'H', 'Qacha\'s Nek'),
('LS', 'J', 'Mokhotlong'),
('LS', 'K', 'Thaba-Tseka'),
('LT', 'AL', 'Alytaus Apskritis'),
('LT', 'KL', 'Klaipedos Apskritis'),
('LT', 'KU', 'Kauno Apskritis'),
('LT', 'MR', 'Marijampoles Apskritis'),
('LT', 'PN', 'Panevežio Apskritis'),
('LT', 'SA', 'Šiauliu Apskritis'),
('LT', 'TA', 'Taurages Apskritis'),
('LT', 'TE', 'Telšiu Apskritis'),
('LT', 'UT', 'Utenos Apskritis'),
('LT', 'VL', 'Vilniaus Apskritis'),
('LU', 'D', 'Diekirch'),
('LU', 'G', 'Grevenmacher'),
('LU', 'L', 'Luxembourg'),
('LV', '001', 'Aglonas novads'),
('LV', '002', 'Aizkraukles novads'),
('LV', '003', 'Aizputes novads'),
('LV', '004', 'Aknīstes novads'),
('LV', '005', 'Alojas novads'),
('LV', '006', 'Alsungas novads'),
('LV', '007', 'Alūksnes novads'),
('LV', '008', 'Amatas novads'),
('LV', '009', 'Apes novads'),
('LV', '010', 'Auces novads'),
('LV', '011', 'Ādažu novads'),
('LV', '012', 'Babītes novads'),
('LV', '013', 'Baldones novads'),
('LV', '014', 'Baltinavas novads'),
('LV', '015', 'Balvu novads'),
('LV', '016', 'Bauskas novads'),
('LV', '017', 'Beverīnas novads'),
('LV', '018', 'Brocēnu novads'),
('LV', '019', 'Burtnieku novads'),
('LV', '020', 'Carnikavas novads'),
('LV', '021', 'Cesvaines novads'),
('LV', '022', 'Cēsu novads'),
('LV', '023', 'Ciblas novads'),
('LV', '024', 'Dagdas novads'),
('LV', '025', 'Daugavpils novads'),
('LV', '026', 'Dobeles novads'),
('LV', '027', 'Dundagas novads'),
('LV', '028', 'Durbes novads'),
('LV', '029', 'Engures novads'),
('LV', '030', 'Ērgļu novads'),
('LV', '031', 'Garkalnes novads'),
('LV', '032', 'Grobiņas novads'),
('LV', '033', 'Gulbenes novads'),
('LV', '034', 'Iecavas novads'),
('LV', '035', 'Ikšķiles novads'),
('LV', '036', 'Ilūkstes novads'),
('LV', '037', 'Inčukalna novads'),
('LV', '038', 'Jaunjelgavas novads'),
('LV', '039', 'Jaunpiebalgas novads'),
('LV', '040', 'Jaunpils novads'),
('LV', '041', 'Jelgavas novads'),
('LV', '042', 'Jēkabpils novads'),
('LV', '043', 'Kandavas novads'),
('LV', '044', 'Kārsavas novads'),
('LV', '045', 'Kocēnu novads'),
('LV', '046', 'Kokneses novads'),
('LV', '047', 'Krāslavas novads'),
('LV', '048', 'Krimuldas novads'),
('LV', '049', 'Krustpils novads'),
('LV', '050', 'Kuldīgas novads'),
('LV', '051', 'Ķeguma novads'),
('LV', '052', 'Ķekavas novads'),
('LV', '053', 'Lielvārdes novads'),
('LV', '054', 'Limbažu novads'),
('LV', '055', 'Līgatnes novads'),
('LV', '056', 'Līvānu novads'),
('LV', '057', 'Lubānas novads'),
('LV', '058', 'Ludzas novads'),
('LV', '059', 'Madonas novads'),
('LV', '060', 'Mazsalacas novads'),
('LV', '061', 'Mālpils novads'),
('LV', '062', 'Mārupes novads'),
('LV', '063', 'Mērsraga novads'),
('LV', '064', 'Naukšēnu novads'),
('LV', '065', 'Neretas novads'),
('LV', '066', 'Nīcas novads'),
('LV', '067', 'Ogres novads'),
('LV', '068', 'Olaines novads'),
('LV', '069', 'Ozolnieku novads'),
('LV', '070', 'Pārgaujas novads'),
('LV', '071', 'Pāvilostas novads'),
('LV', '072', 'Pļaviņu novads'),
('LV', '073', 'Preiļu novads'),
('LV', '074', 'Priekules novads'),
('LV', '075', 'Priekuļu novads'),
('LV', '076', 'Raunas novads'),
('LV', '077', 'Rēzeknes novads'),
('LV', '078', 'Riebiņu novads'),
('LV', '079', 'Rojas novads'),
('LV', '080', 'Ropažu novads'),
('LV', '081', 'Rucavas novads'),
('LV', '082', 'Rugāju novads'),
('LV', '083', 'Rundāles novads'),
('LV', '084', 'Rūjienas novads'),
('LV', '085', 'Salas novads'),
('LV', '086', 'Salacgrīvas novads'),
('LV', '087', 'Salaspils novads'),
('LV', '088', 'Saldus novads'),
('LV', '089', 'Saulkrastu novads'),
('LV', '090', 'Sējas novads'),
('LV', '091', 'Siguldas novads'),
('LV', '092', 'Skrīveru novads'),
('LV', '093', 'Skrundas novads'),
('LV', '094', 'Smiltenes novads'),
('LV', '095', 'Stopiņu novads'),
('LV', '096', 'Strenču novads'),
('LV', '097', 'Talsu novads'),
('LV', '098', 'Tērvetes novads'),
('LV', '099', 'Tukuma novads'),
('LV', '100', 'Vaiņodes novads'),
('LV', '101', 'Valkas novads'),
('LV', '102', 'Varakļānu novads'),
('LV', '103', 'Vārkavas novads'),
('LV', '104', 'Vecpiebalgas novads'),
('LV', '105', 'Vecumnieku novads'),
('LV', '106', 'Ventspils novads'),
('LV', '107', 'Viesītes novads'),
('LV', '108', 'Viļakas novads'),
('LV', '109', 'Viļānu novads'),
('LV', '110', 'Zilupes novads'),
('LV', 'DGV', 'Daugavpils'),
('LV', 'JEL', 'Jelgava'),
('LV', 'JKB', 'Jēkabpils'),
('LV', 'JUR', 'Jurmala'),
('LV', 'LPX', 'Liepaja'),
('LV', 'REZ', 'Rezekne'),
('LV', 'RIX', 'Riga'),
('LV', 'VEN', 'Ventspils'),
('LV', 'VMR', 'Valmiera'),
('LY', 'BA', 'Banghazi'),
('LY', 'BU', 'Al Butnan'),
('LY', 'DR', 'Darnah'),
('LY', 'GT', 'Ghat'),
('LY', 'JA', 'Al Jabal al Akhḑar'),
('LY', 'JG', 'Al Jabal al Gharbī'),
('LY', 'JI', 'Al Jifarah'),
('LY', 'JU', 'Al Jufrah'),
('LY', 'KF', 'Al Kufrah'),
('LY', 'MB', 'Al Marqab'),
('LY', 'MI', 'Misratah'),
('LY', 'MJ', 'Al Marj'),
('LY', 'MQ', 'Murzuq'),
('LY', 'NL', 'Nalut'),
('LY', 'NQ', 'An Nuqat al Khams'),
('LY', 'SB', 'Sabha'),
('LY', 'SR', 'Surt'),
('LY', 'TB', 'Tarabulus'),
('LY', 'WA', 'Al Wāḩāt'),
('LY', 'WD', 'Wādī al Ḩayāt'),
('LY', 'WS', 'Wādī ash Shāţiʾ'),
('LY', 'ZA', 'Az Zawiyah'),
('MA', '01', 'Tanger-Tetouan'),
('MA', '02', 'Gharb-Chrarda-Beni Hssen'),
('MA', '03', 'Taza-Al Hoceima-Taounate'),
('MA', '04', 'L\'Oriental'),
('MA', '05', 'Fes-Boulemane'),
('MA', '06', 'Meknes-Tafilalet'),
('MA', '07', 'Rabat-Salé-Zemmour-Zaer'),
('MA', '08', 'Grand Casablanca'),
('MA', '09', 'Chaouia-Ouardigh'),
('MA', '10', 'Doukkala-Abda'),
('MA', '11', 'Marrakech-Tensift-Al Haouz'),
('MA', '12', 'Tadla-Azilal'),
('MA', '13', 'Souss-Massa-Draa'),
('MA', '14', 'Guelmim-Es Smar'),
('MA', '15', 'Laayoune-Boujdour-Sakia El Hamra'),
('MA', '16', 'Oued ed Dahab-Lagouira'),
('MA', 'AGD', 'Agadir-Ida-Outanane'),
('MA', 'AOU', 'Aousserd'),
('MA', 'ASZ', 'Assa-Zag'),
('MA', 'AZI', 'Azilal'),
('MA', 'BEM', 'Beni Mellal'),
('MA', 'BER', 'Berkane'),
('MA', 'BES', 'Ben Slimane'),
('MA', 'BOD', 'Boujdour'),
('MA', 'BOM', 'Boulemane'),
('MA', 'CAS', 'Casablanca [Dar el Beïda]*'),
('MA', 'CHE', 'Chefchaouen'),
('MA', 'CHI', 'Chichaoua'),
('MA', 'CHT', 'Chtouka-Ait Baha'),
('MA', 'ERR', 'Errachidia'),
('MA', 'ESI', 'Essaouira'),
('MA', 'ESM', 'Es Smara'),
('MA', 'FAH', 'Fahs-Beni Makada'),
('MA', 'FES', 'Fès-Dar-Dbibegh'),
('MA', 'FIG', 'Figuig'),
('MA', 'GUE', 'Guelmim'),
('MA', 'HAJ', 'El Hajeb'),
('MA', 'HAO', 'Al Haouz'),
('MA', 'HOC', 'Al Hoceïma'),
('MA', 'IFR', 'Ifrane'),
('MA', 'INE', 'Inezgane-Ait Melloul'),
('MA', 'JDI', 'El Jadida'),
('MA', 'JRA', 'Jrada'),
('MA', 'KEN', 'Kénitra'),
('MA', 'KES', 'Kelaat es Sraghna'),
('MA', 'KHE', 'Khemisset'),
('MA', 'KHN', 'Khenifra'),
('MA', 'KHO', 'Khouribga'),
('MA', 'LAA', 'Laâyoune*'),
('MA', 'LAR', 'Larache'),
('MA', 'MED', 'Mediouna'),
('MA', 'MEK', 'Meknès'),
('MA', 'MMD', 'Marrakech-Medina'),
('MA', 'MMN', 'Marrakech-Menara'),
('MA', 'MOH', 'Mohammadia'),
('MA', 'MOU', 'Moulay Yacoub'),
('MA', 'NAD', 'Nador'),
('MA', 'NOU', 'Nouaceur'),
('MA', 'OUA', 'Ouarzazate'),
('MA', 'OUD', 'Oued ed Dahab'),
('MA', 'OUJ', 'Oujda*'),
('MA', 'RAB', 'Rabat'),
('MA', 'SAF', 'Safi'),
('MA', 'SAL', 'Connaught Salé'),
('MA', 'SEF', 'Sefrou'),
('MA', 'SET', 'Settat'),
('MA', 'SIK', 'Sidi Kacem'),
('MA', 'SKH', 'Skhirate-Témara'),
('MA', 'SYB', 'Sidi Youssef Ben Ali'),
('MA', 'TAI', 'Taourirt'),
('MA', 'TAO', 'Taounate'),
('MA', 'TAR', 'Taroudant'),
('MA', 'TAT', 'Tata'),
('MA', 'TAZ', 'Taza'),
('MA', 'TIZ', 'Tiznit'),
('MA', 'TNG', 'Tanger-Assilah'),
('MA', 'TNT', 'Tan-Tan'),
('MA', 'ZAG', 'Zagora'),
('MC', 'CL', 'La Colle'),
('MC', 'CO', 'La Condamine'),
('MC', 'FO', 'Fontvieille'),
('MC', 'GA', 'La Gare'),
('MC', 'JE', 'Jardin Exotique'),
('MC', 'LA', 'Larvotto'),
('MC', 'MA', 'Malbousquet'),
('MC', 'MC', 'Monte-Carlo'),
('MC', 'MG', 'Moneghetti'),
('MC', 'MO', 'Monaco-Ville'),
('MC', 'MU', 'Moulins'),
('MC', 'PH', 'Port-Hercule'),
('MC', 'SD', 'Sainte-Dévote'),
('MC', 'SO', 'La Source'),
('MC', 'SP', 'Spélugues'),
('MC', 'SR', 'Saint-Roman'),
('MC', 'VR', 'Vallon de la Rousse'),
('MD', 'AN', 'Anenii Noi'),
('MD', 'BA', 'Bălţi'),
('MD', 'BD', 'Tighina'),
('MD', 'BR', 'Briceni'),
('MD', 'BS', 'Basarabeasca'),
('MD', 'CA', 'Cahul'),
('MD', 'CL', 'Călăraşi'),
('MD', 'CM', 'Cimişlia'),
('MD', 'CR', 'Criuleni'),
('MD', 'CS', 'Căuşeni'),
('MD', 'CT', 'Cantemir'),
('MD', 'CU', 'Chisinau'),
('MD', 'DO', 'Donduşeni'),
('MD', 'DR', 'Drochia'),
('MD', 'DU', 'Dubăsari'),
('MD', 'ED', 'Edinet'),
('MD', 'FA', 'Făleşti'),
('MD', 'FL', 'Floreşti'),
('MD', 'GA', 'Gagauzia, Unitatea teritoriala autonoma'),
('MD', 'GL', 'Glodeni'),
('MD', 'HI', 'Hînceşti'),
('MD', 'IA', 'Ialoveni'),
('MD', 'LE', 'Leova'),
('MD', 'NI', 'Nisporeni'),
('MD', 'OC', 'Ocniţa'),
('MD', 'OR', 'Orhei'),
('MD', 'RE', 'Rezina'),
('MD', 'RI', 'Rîşcani'),
('MD', 'SD', 'Şoldăneşti'),
('MD', 'SI', 'Sîngerei'),
('MD', 'SN', 'Stînga Nistrului, unitatea teritoriala din'),
('MD', 'SO', 'Soroca'),
('MD', 'ST', 'Străşeni'),
('MD', 'SV', 'Ştefan Vodă'),
('MD', 'TA', 'Taraclia'),
('MD', 'TE', 'Teleneşti'),
('MD', 'UN', 'Ungheni'),
('ME', '01', 'Andrijevica'),
('ME', '02', 'Bar'),
('ME', '03', 'Berane'),
('ME', '04', 'Bijelo Polje'),
('ME', '05', 'Budva'),
('ME', '06', 'Cetinje'),
('ME', '07', 'Danilovgrad'),
('ME', '08', 'Herceg-Novi'),
('ME', '09', 'Kolašin'),
('ME', '10', 'Kotor'),
('ME', '11', 'Mojkovac'),
('ME', '12', 'Nikšic´'),
('ME', '13', 'Plav'),
('ME', '14', 'Pljevlja'),
('ME', '15', 'Plužine'),
('ME', '16', 'Podgorica'),
('ME', '17', 'Rožaje'),
('ME', '18', 'Šavnik'),
('ME', '19', 'Tivat'),
('ME', '20', 'Ulcinj'),
('ME', '21', 'Žabljak'),
('MG', 'A', 'Toamasina'),
('MG', 'D', 'Antsiranana'),
('MG', 'F', 'Fianarantsoa'),
('MG', 'M', 'Mahajanga'),
('MG', 'T', 'Antananarivo'),
('MG', 'U', 'Toliara'),
('MH', 'ALK', 'Ailuk'),
('MH', 'ALL', 'Ailinglaplap'),
('MH', 'ARN', 'Arno'),
('MH', 'AUR', 'Aur'),
('MH', 'EBO', 'Ebon'),
('MH', 'ENI', 'Enewetak'),
('MH', 'JAB', 'Jabat'),
('MH', 'JAL', 'Jaluit'),
('MH', 'KIL', 'Kili'),
('MH', 'KWA', 'Kwajalein'),
('MH', 'L', 'Ralik chain'),
('MH', 'LAE', 'Lae'),
('MH', 'LIB', 'Lib'),
('MH', 'LIK', 'Likiep'),
('MH', 'MAJ', 'Majuro'),
('MH', 'MAL', 'Maloelap'),
('MH', 'MEJ', 'Mejit'),
('MH', 'MIL', 'Mili'),
('MH', 'NMK', 'Namdrik'),
('MH', 'NMU', 'Namu'),
('MH', 'RON', 'Rongelap'),
('MH', 'T', 'Ratak chain'),
('MH', 'UJA', 'Ujae'),
('MH', 'UTI', 'Utirik'),
('MH', 'WTH', 'Wotho'),
('MH', 'WTJ', 'Wotje'),
('MK', '01', 'Aerodrom'),
('MK', '02', 'Aračinovo'),
('MK', '03', 'Berovo'),
('MK', '04', 'Bitola'),
('MK', '05', 'Bogdanci'),
('MK', '06', 'Bogovinje'),
('MK', '07', 'Bosilovo'),
('MK', '08', 'Brvenica'),
('MK', '09', 'Butel'),
('MK', '10', 'Valandovo'),
('MK', '11', 'Vasilevo'),
('MK', '12', 'Vevčani'),
('MK', '13', 'Veles'),
('MK', '14', 'Vinica'),
('MK', '15', 'Vraneštica'),
('MK', '16', 'Vrapčište'),
('MK', '17', 'Gazi Baba'),
('MK', '18', 'Gevgelija'),
('MK', '19', 'Gostivar'),
('MK', '20', 'Gradsko'),
('MK', '21', 'Debar'),
('MK', '22', 'Debarca'),
('MK', '23', 'Delčevo'),
('MK', '24', 'Demir Kapija'),
('MK', '25', 'Demir Hisar'),
('MK', '26', 'Dojran'),
('MK', '27', 'Dolneni'),
('MK', '28', 'Drugovo'),
('MK', '29', 'Gjorče Petrov'),
('MK', '30', 'Želino'),
('MK', '31', 'Zajas'),
('MK', '32', 'Zelenikovo'),
('MK', '33', 'Zrnovci'),
('MK', '34', 'Ilinden'),
('MK', '35', 'Jegunovce'),
('MK', '36', 'Kavadarci'),
('MK', '37', 'Karbinci'),
('MK', '38', 'Karpoš'),
('MK', '39', 'Kisela Voda'),
('MK', '40', 'Kičevo'),
('MK', '41', 'Konče'),
('MK', '42', 'Kočani'),
('MK', '43', 'Kratovo'),
('MK', '44', 'Kriva Palanka'),
('MK', '45', 'Krivogaštani'),
('MK', '46', 'Kruševo'),
('MK', '47', 'Kumanovo'),
('MK', '48', 'Lipkovo'),
('MK', '49', 'Lozovo'),
('MK', '50', 'Mavrovo i Rostuša'),
('MK', '51', 'Makedonska Kamenica'),
('MK', '52', 'Makedonski Brod'),
('MK', '53', 'Mogila'),
('MK', '54', 'Negotino'),
('MK', '55', 'Novaci'),
('MK', '56', 'Novo Selo'),
('MK', '57', 'Oslomej'),
('MK', '58', 'Ohrid'),
('MK', '59', 'Petrovec'),
('MK', '60', 'Pehčevo'),
('MK', '61', 'Plasnica'),
('MK', '62', 'Prilep'),
('MK', '63', 'Probištip'),
('MK', '64', 'Radoviš'),
('MK', '65', 'Rankovce'),
('MK', '66', 'Resen'),
('MK', '67', 'Rosoman'),
('MK', '68', 'Saraj'),
('MK', '69', 'Sveti Nikole'),
('MK', '70', 'Sopište'),
('MK', '71', 'Staro Nagoričane'),
('MK', '72', 'Struga'),
('MK', '73', 'Strumica'),
('MK', '74', 'Studeničani'),
('MK', '75', 'Tearce'),
('MK', '76', 'Tetovo'),
('MK', '77', 'Centar'),
('MK', '78', 'Centar Župa'),
('MK', '79', 'Čair'),
('MK', '80', 'Čaška'),
('MK', '81', 'Češinovo-Obleševo'),
('MK', '82', 'Čučer Sandevo'),
('MK', '83', 'Štip'),
('MK', '84', 'Šuto Orizari'),
('ML', '1', 'Kayes'),
('ML', '2', 'Koulikoro'),
('ML', '3', 'Sikasso'),
('ML', '4', 'Ségou'),
('ML', '5', 'Mopti'),
('ML', '6', 'Tombouctou'),
('ML', '7', 'Gao'),
('ML', '8', 'Kidal'),
('ML', 'BKO', 'Bamako'),
('MM', '01', 'Sagaing'),
('MM', '02', 'Bago'),
('MM', '03', 'Magway'),
('MM', '04', 'Mandalay'),
('MM', '05', 'Tanintharyi'),
('MM', '06', 'Yangon'),
('MM', '07', 'Ayeyarwady'),
('MM', '11', 'Kachin'),
('MM', '12', 'Kayah'),
('MM', '13', 'Kayin'),
('MM', '14', 'Chin'),
('MM', '15', 'Mon'),
('MM', '16', 'Rakhine'),
('MM', '17', 'Shan'),
('MN', '035', 'Orhon'),
('MN', '037', 'Darhan uul'),
('MN', '039', 'Hentiy'),
('MN', '041', 'Hövsgöl'),
('MN', '043', 'Hovd'),
('MN', '046', 'Uvs'),
('MN', '047', 'Töv'),
('MN', '049', 'Selenge'),
('MN', '051', 'Sühbaatar'),
('MN', '053', 'Ömnögovi'),
('MN', '055', 'Övörhangay'),
('MN', '057', 'Dzavhan'),
('MN', '059', 'Dundgovi'),
('MN', '061', 'Dornod'),
('MN', '063', 'Dornogovi'),
('MN', '064', 'Govi-Sümber'),
('MN', '065', 'Govi-Altay'),
('MN', '067', 'Bulgan'),
('MN', '069', 'Bayanhongor'),
('MN', '071', 'Bayan-Ölgiy'),
('MN', '073', 'Arhangay'),
('MN', '1', 'Ulaanbaatar'),
('MO', 'I', 'Ilhas'),
('MO', 'M', 'Macau'),
('MR', '01', 'Hodh ech Chargui'),
('MR', '02', 'Hodh el Gharbi'),
('MR', '03', 'Assaba'),
('MR', '04', 'Gorgol'),
('MR', '05', 'Brakna'),
('MR', '06', 'Trarza'),
('MR', '07', 'Adrar'),
('MR', '08', 'Dakhlet Nouâdhibou'),
('MR', '09', 'Tagant'),
('MR', '10', 'Guidimaka'),
('MR', '11', 'Tiris Zemmour'),
('MR', '12', 'Inchiri'),
('MR', 'NKC', 'Nouakchott'),
('MT', '01', 'Attard'),
('MT', '02', 'Balzan'),
('MT', '03', 'Birgu'),
('MT', '04', 'Birkirkara'),
('MT', '05', 'Birżebbuġa'),
('MT', '06', 'Bormla'),
('MT', '07', 'Dingli'),
('MT', '08', 'Fgura'),
('MT', '09', 'Floriana'),
('MT', '10', 'Fontana'),
('MT', '11', 'Gudja'),
('MT', '12', 'Gżira'),
('MT', '13', 'Għajnsielem'),
('MT', '14', 'Għarb'),
('MT', '15', 'Għargħur'),
('MT', '16', 'Għasri'),
('MT', '17', 'Għaxaq'),
('MT', '18', 'Ħamrun'),
('MT', '19', 'Iklin'),
('MT', '20', 'Isla'),
('MT', '21', 'Kalkara'),
('MT', '22', 'Kerċem'),
('MT', '23', 'Kirkop'),
('MT', '24', 'Lija'),
('MT', '25', 'Luqa'),
('MT', '26', 'Marsa'),
('MT', '27', 'Marsaskala'),
('MT', '28', 'Marsaxlokk'),
('MT', '29', 'Mdina'),
('MT', '30', 'Mellieħa'),
('MT', '31', 'Mġarr'),
('MT', '32', 'Mosta'),
('MT', '33', 'Mqabba'),
('MT', '34', 'Msida'),
('MT', '35', 'Mtarfa'),
('MT', '36', 'Munxar'),
('MT', '37', 'Nadur'),
('MT', '38', 'Naxxar'),
('MT', '39', 'Paola'),
('MT', '40', 'Pembroke'),
('MT', '41', 'Pietà'),
('MT', '42', 'Qala'),
('MT', '43', 'Qormi'),
('MT', '44', 'Qrendi'),
('MT', '45', 'Rabat Għawdex'),
('MT', '46', 'Rabat Malta'),
('MT', '47', 'Safi'),
('MT', '48', 'San Ġiljan'),
('MT', '49', 'San Ġwann'),
('MT', '50', 'San Lawrenz'),
('MT', '51', 'San Pawl il-Baħar'),
('MT', '52', 'Sannat'),
('MT', '53', 'Santa Luċija'),
('MT', '54', 'Santa Venera'),
('MT', '55', 'Siġġiewi'),
('MT', '56', 'Sliema'),
('MT', '57', 'Swieqi'),
('MT', '58', 'Ta’ Xbiex'),
('MT', '59', 'Tarxien'),
('MT', '60', 'Valletta'),
('MT', '61', 'Xagħra'),
('MT', '62', 'Xewkija'),
('MT', '63', 'Xgħajra'),
('MT', '64', 'Żabbar'),
('MT', '65', 'Żebbuġ Għawdex'),
('MT', '66', 'Żebbuġ Malta'),
('MT', '67', 'Żejtun'),
('MT', '68', 'Żurrieq'),
('MU', 'AG', 'Agalega Islands'),
('MU', 'BL', 'Black River'),
('MU', 'BR', 'Beau Bassin-Rose Hill'),
('MU', 'CC', 'Cargados Carajos Shoals [Saint Brandon Islands]'),
('MU', 'CU', 'Curepipe'),
('MU', 'FL', 'Flacq'),
('MU', 'GP', 'Grand Port'),
('MU', 'MO', 'Moka'),
('MU', 'PA', 'Pamplemousses'),
('MU', 'PL', 'Port Louis City'),
('MU', 'PU', 'Port Louis District'),
('MU', 'PW', 'Plaines Wilhems'),
('MU', 'QB', 'Quatre Bornes'),
('MU', 'RO', 'Rodrigues Island'),
('MU', 'RR', 'Rivière du Rempart'),
('MU', 'SA', 'Savanne'),
('MU', 'VP', 'Vacoas-Phoenix'),
('MV', '00', 'Alif Dhaal'),
('MV', '01', 'Seenu'),
('MV', '02', 'Alif'),
('MV', '03', 'Lhaviyani'),
('MV', '04', 'Vaavu'),
('MV', '05', 'Laamu'),
('MV', '07', 'Haa Alif'),
('MV', '08', 'Thaa'),
('MV', '12', 'Meemu'),
('MV', '13', 'Raa'),
('MV', '14', 'Faafu'),
('MV', '17', 'Dhaalu'),
('MV', '20', 'Baa'),
('MV', '23', 'Haa Dhaalu'),
('MV', '24', 'Shaviyani'),
('MV', '25', 'Noonu'),
('MV', '26', 'Kaafu'),
('MV', '27', 'Gaaf Alif'),
('MV', '28', 'Gaafu Dhaalu'),
('MV', '29', 'Gnaviyani'),
('MV', 'CE', 'Central'),
('MV', 'MLE', 'Male'),
('MV', 'NC', 'North Central'),
('MV', 'NO', 'North'),
('MV', 'SC', 'South Central'),
('MV', 'SU', 'South'),
('MV', 'UN', 'Upper North'),
('MV', 'US', 'Upper South'),
('MW', 'BA', 'Balaka'),
('MW', 'BL', 'Blantyre'),
('MW', 'C', 'Central Region'),
('MW', 'CK', 'Chikwawa'),
('MW', 'CR', 'Chiradzulu'),
('MW', 'CT', 'Chitipa'),
('MW', 'DE', 'Dedza'),
('MW', 'DO', 'Dowa'),
('MW', 'KR', 'Karonga'),
('MW', 'KS', 'Kasungu'),
('MW', 'LI', 'Lilongwe'),
('MW', 'LK', 'Likoma'),
('MW', 'MC', 'Mchinji'),
('MW', 'MG', 'Mangochi'),
('MW', 'MH', 'Machinga'),
('MW', 'MU', 'Mulanje'),
('MW', 'MW', 'Mwanza'),
('MW', 'MZ', 'Mzimba'),
('MW', 'N', 'Northern Region'),
('MW', 'NB', 'Nkhata Bay'),
('MW', 'NE', 'Neno'),
('MW', 'NI', 'Ntchisi'),
('MW', 'NK', 'Nkhotakota'),
('MW', 'NS', 'Nsanje'),
('MW', 'NU', 'Ntcheu'),
('MW', 'PH', 'Phalombe'),
('MW', 'RU', 'Rumphi'),
('MW', 'S', 'Southern Region'),
('MW', 'SA', 'Salima'),
('MW', 'TH', 'Thyolo'),
('MW', 'ZO', 'Zomba'),
('MX', 'AGU', 'Aguascalientes'),
('MX', 'BCN', 'Baja California'),
('MX', 'BCS', 'Baja California Sur'),
('MX', 'CAM', 'Campeche'),
('MX', 'CHH', 'Chihuahua'),
('MX', 'CHP', 'Chiapas'),
('MX', 'COA', 'Coahuila'),
('MX', 'COL', 'Colima'),
('MX', 'DIF', 'Distrito Federal'),
('MX', 'DUR', 'Durango'),
('MX', 'GRO', 'Guerrero'),
('MX', 'GUA', 'Guanajuato'),
('MX', 'HID', 'Hidalgo'),
('MX', 'JAL', 'Jalisco'),
('MX', 'MEX', 'México'),
('MX', 'MIC', 'Michoacán'),
('MX', 'MOR', 'Morelos'),
('MX', 'NAY', 'Nayarit'),
('MX', 'NLE', 'Nuevo León'),
('MX', 'OAX', 'Oaxaca'),
('MX', 'PUE', 'Puebla'),
('MX', 'QUE', 'Querétaro'),
('MX', 'ROO', 'Quintana Roo'),
('MX', 'SIN', 'Sinaloa'),
('MX', 'SLP', 'San Luis Potosí'),
('MX', 'SON', 'Sonora'),
('MX', 'TAB', 'Tabasco'),
('MX', 'TAM', 'Tamaulipas'),
('MX', 'TLA', 'Tlaxcala'),
('MX', 'VER', 'Veracruz'),
('MX', 'YUC', 'Yucatán'),
('MX', 'ZAC', 'Zacatecas'),
('MY', '01', 'Johor'),
('MY', '02', 'Kedah'),
('MY', '03', 'Kelantan'),
('MY', '04', 'Melaka'),
('MY', '05', 'Negeri Sembilan'),
('MY', '06', 'Pahang'),
('MY', '07', 'Pulau Pinang'),
('MY', '08', 'Perak'),
('MY', '09', 'Perlis'),
('MY', '10', 'Selangor'),
('MY', '11', 'Terengganu'),
('MY', '12', 'Sabah'),
('MY', '13', 'Sarawak'),
('MY', '14', 'Wilayah Persekutuan Kuala Lumpur'),
('MY', '15', 'Wilayah Persekutuan Labuan'),
('MY', '16', 'Wilayah Persekutuan Putrajaya'),
('MZ', 'A', 'Niassa'),
('MZ', 'B', 'Manica'),
('MZ', 'G', 'Gaza'),
('MZ', 'I', 'Inhambane'),
('MZ', 'L', 'Maputo'),
('MZ', 'MPM', 'Maputo City'),
('MZ', 'N', 'Nampula'),
('MZ', 'P', 'Cabo Delgado'),
('MZ', 'Q', 'Zambézia'),
('MZ', 'S', 'Sofala'),
('MZ', 'T', 'Tete'),
('NA', 'CA', 'Caprivi'),
('NA', 'ER', 'Erongo'),
('NA', 'HA', 'Hardap'),
('NA', 'KA', 'Karas'),
('NA', 'KH', 'Khomas'),
('NA', 'KU', 'Kunene'),
('NA', 'OD', 'Otjozondjupa'),
('NA', 'OH', 'Omaheke'),
('NA', 'OK', 'Okavango'),
('NA', 'ON', 'Oshana'),
('NA', 'OS', 'Omusati'),
('NA', 'OT', 'Oshikoto'),
('NA', 'OW', 'Ohangwena'),
('NE', '1', 'Agadez'),
('NE', '2', 'Diffa'),
('NE', '3', 'Dosso'),
('NE', '4', 'Maradi'),
('NE', '5', 'Tahoua'),
('NE', '6', 'Tillabéri'),
('NE', '7', 'Zinder'),
('NE', '8', 'Niamey'),
('NG', 'AB', 'Abia'),
('NG', 'AD', 'Adamawa'),
('NG', 'AK', 'Akwa Ibom'),
('NG', 'AN', 'Anambra'),
('NG', 'BA', 'Bauchi'),
('NG', 'BE', 'Benue'),
('NG', 'BO', 'Borno'),
('NG', 'BY', 'Bayelsa'),
('NG', 'CR', 'Cross River'),
('NG', 'DE', 'Delta'),
('NG', 'EB', 'Ebonyi'),
('NG', 'ED', 'Edo'),
('NG', 'EK', 'Ekiti'),
('NG', 'EN', 'Enugu'),
('NG', 'FC', 'Abuja Federal Capital Territory'),
('NG', 'GO', 'Gombe'),
('NG', 'IM', 'Imo'),
('NG', 'JI', 'Jigawa'),
('NG', 'KD', 'Kaduna'),
('NG', 'KE', 'Kebbi'),
('NG', 'KN', 'Kano'),
('NG', 'KO', 'Kogi'),
('NG', 'KT', 'Katsina'),
('NG', 'KW', 'Kwara'),
('NG', 'LA', 'Lagos'),
('NG', 'NA', 'Nassarawa'),
('NG', 'NI', 'Niger'),
('NG', 'OG', 'Ogun'),
('NG', 'ON', 'Ondo'),
('NG', 'OS', 'Osun'),
('NG', 'OY', 'Oyo'),
('NG', 'PL', 'Plateau'),
('NG', 'RI', 'Rivers'),
('NG', 'SO', 'Sokoto'),
('NG', 'TA', 'Taraba'),
('NG', 'YO', 'Yobe'),
('NG', 'ZA', 'Zamfara'),
('NI', 'AN', 'Atlántico Norte*'),
('NI', 'AS', 'Atlántico Sur*'),
('NI', 'BO', 'Boaco'),
('NI', 'CA', 'Carazo'),
('NI', 'CI', 'Chinandega'),
('NI', 'CO', 'Chontales'),
('NI', 'ES', 'Estelí'),
('NI', 'GR', 'Granada'),
('NI', 'JI', 'Jinotega'),
('NI', 'LE', 'León'),
('NI', 'MD', 'Madriz'),
('NI', 'MN', 'Managua'),
('NI', 'MS', 'Masaya'),
('NI', 'MT', 'Matagalpa'),
('NI', 'NS', 'Nueva Segovia'),
('NI', 'RI', 'Rivas'),
('NI', 'SJ', 'Río San Juan'),
('NL', 'AW', 'Aruba'),
('NL', 'BQ1', 'Bonaire'),
('NL', 'BQ2', 'Saba'),
('NL', 'BQ3', 'Sint Eustatius'),
('NL', 'CW', 'Curaçao'),
('NL', 'DR', 'Drenthe'),
('NL', 'FL', 'Flevoland'),
('NL', 'FR', 'Friesland'),
('NL', 'GE', 'Gelderland'),
('NL', 'GR', 'Groningen'),
('NL', 'LI', 'Limburg'),
('NL', 'NB', 'Noord-Brabant'),
('NL', 'NH', 'Noord-Holland'),
('NL', 'OV', 'Overijssel'),
('NL', 'SX', 'Sint Maarten'),
('NL', 'UT', 'Utrecht'),
('NL', 'ZE', 'Zeeland'),
('NL', 'ZH', 'Zuid-Holland'),
('NO', '01', 'Østfold'),
('NO', '02', 'Akershus'),
('NO', '03', 'Oslo'),
('NO', '04', 'Hedmark'),
('NO', '05', 'Oppland'),
('NO', '06', 'Buskerud'),
('NO', '07', 'Vestfold'),
('NO', '08', 'Telemark'),
('NO', '09', 'Aust-Agder'),
('NO', '10', 'Vest-Agder'),
('NO', '11', 'Rogaland'),
('NO', '12', 'Hordaland'),
('NO', '14', 'Sogn og Fjordane'),
('NO', '15', 'Møre og Romsdal'),
('NO', '16', 'Sør-Trøndelag'),
('NO', '17', 'Nord-Trøndelag'),
('NO', '18', 'Nordland'),
('NO', '19', 'Troms'),
('NO', '20', 'Finnmark'),
('NO', '21', 'Svalbard'),
('NO', '22', 'Jan Mayen'),
('NP', '1', 'Madhyamanchal'),
('NP', '2', 'Madhya Pashchimanchal'),
('NP', '3', 'Pashchimanchal'),
('NP', '4', 'Purwanchal'),
('NP', '5', 'Sudur Pashchimanchal'),
('NP', 'BA', 'Bagmati'),
('NP', 'BH', 'Bheri'),
('NP', 'DH', 'Dhawalagiri'),
('NP', 'GA', 'Gandaki'),
('NP', 'JA', 'Janakpur'),
('NP', 'KA', 'Karnali'),
('NP', 'KO', 'Kosi [Koshi]'),
('NP', 'LU', 'Lumbini'),
('NP', 'MA', 'Mahakali'),
('NP', 'ME', 'Mechi'),
('NP', 'NA', 'Narayani'),
('NP', 'RA', 'Rapti'),
('NP', 'SA', 'Sagarmatha'),
('NP', 'SE', 'Seti'),
('NR', '01', 'Aiwo'),
('NR', '02', 'Anabar'),
('NR', '03', 'Anetan'),
('NR', '04', 'Anibare'),
('NR', '05', 'Baiti'),
('NR', '06', 'Boe'),
('NR', '07', 'Buada'),
('NR', '08', 'Denigomodu'),
('NR', '09', 'Ewa'),
('NR', '10', 'Ijuw'),
('NR', '11', 'Meneng'),
('NR', '12', 'Nibok'),
('NR', '13', 'Uaboe'),
('NR', '14', 'Yaren'),
('NZ', 'AUK', 'Auckland'),
('NZ', 'BOP', 'Bay of Plenty'),
('NZ', 'CAN', 'Canterbury'),
('NZ', 'CIT', 'Chatham Islands Territory'),
('NZ', 'GIS', 'Gisborne District'),
('NZ', 'HKB', 'Hawkes\'s Bay'),
('NZ', 'MBH', 'Marlborough District'),
('NZ', 'MWT', 'Manawatu-Wanganui'),
('NZ', 'N', 'North Island'),
('NZ', 'NSN', 'Nelson City'),
('NZ', 'NTL', 'Northland'),
('NZ', 'OTA', 'Otago'),
('NZ', 'S', 'South Island'),
('NZ', 'STL', 'Southland'),
('NZ', 'TAS', 'Tasman District'),
('NZ', 'TKI', 'Taranaki'),
('NZ', 'WGN', 'Wellington'),
('NZ', 'WKO', 'Waikato'),
('NZ', 'WTC', 'West Coast'),
('OM', 'BA', 'Al Batinah'),
('OM', 'BU', 'Al Buraymi'),
('OM', 'DA', 'Ad Dakhiliyah'),
('OM', 'MA', 'Masqat'),
('OM', 'MU', 'Musandam'),
('OM', 'SH', 'Ash Sharqiyah'),
('OM', 'WU', 'Al Wustá'),
('OM', 'ZA', 'Az̧ Z̧āhirah'),
('OM', 'ZU', 'Z̧ufār'),
('PA', '1', 'Bocas del Toro'),
('PA', '2', 'Coclé'),
('PA', '3', 'Colón'),
('PA', '4', 'Chiriquí'),
('PA', '5', 'Darién'),
('PA', '6', 'Herrera'),
('PA', '7', 'Los Santos'),
('PA', '8', 'Panamá'),
('PA', '9', 'Veraguas'),
('PA', 'EM', 'Emberá'),
('PA', 'KY', 'Kuna Yala'),
('PA', 'NB', 'Ngöbe-Buglé'),
('PE', 'AMA', 'Amazonas'),
('PE', 'ANC', 'Ancash'),
('PE', 'APU', 'Apurímac'),
('PE', 'ARE', 'Arequipa'),
('PE', 'AYA', 'Ayacucho'),
('PE', 'CAJ', 'Cajamarca'),
('PE', 'CAL', 'El Callao'),
('PE', 'CUS', 'Cusco [Cuzco]'),
('PE', 'HUC', 'Huánuco'),
('PE', 'HUV', 'Huancavelica'),
('PE', 'ICA', 'Ica'),
('PE', 'JUN', 'Junín'),
('PE', 'LAL', 'La Libertad'),
('PE', 'LAM', 'Lambayeque'),
('PE', 'LIM', 'Lima'),
('PE', 'LMA', 'Municipalidad Metropolitana de Lima'),
('PE', 'LOR', 'Loreto'),
('PE', 'MDD', 'Madre de Dios'),
('PE', 'MOQ', 'Moquegua'),
('PE', 'PAS', 'Pasco'),
('PE', 'PIU', 'Piura'),
('PE', 'PUN', 'Puno'),
('PE', 'SAM', 'San Martín'),
('PE', 'TAC', 'Tacna'),
('PE', 'TUM', 'Tumbes'),
('PE', 'UCA', 'Ucayali'),
('PG', 'CPK', 'Chimbu'),
('PG', 'CPM', 'Central'),
('PG', 'EBR', 'East New Britain'),
('PG', 'EHG', 'Eastern Highlands'),
('PG', 'EPW', 'Enga'),
('PG', 'ESW', 'East Sepik'),
('PG', 'GPK', 'Gulf'),
('PG', 'MBA', 'Milne Bay'),
('PG', 'MPL', 'Morobe'),
('PG', 'MPM', 'Madang'),
('PG', 'MRL', 'Manus'),
('PG', 'NCD', 'National Capital District'),
('PG', 'NIK', 'New Ireland'),
('PG', 'NPP', 'Northern'),
('PG', 'NSB', 'Bougainville'),
('PG', 'SAN', 'Sandaun [West Sepik]'),
('PG', 'SHM', 'Southern Highlands'),
('PG', 'WBK', 'West New Britain'),
('PG', 'WHM', 'Western Highlands'),
('PG', 'WPD', 'Western'),
('PH', '00', 'National Capital Region'),
('PH', '01', 'Ilocos'),
('PH', '02', 'Cagayan Valley'),
('PH', '03', 'Central Luzon'),
('PH', '05', 'Bicol'),
('PH', '06', 'Western Visayas'),
('PH', '07', 'Central Visayas'),
('PH', '08', 'Eastern Visayas'),
('PH', '09', 'Zamboanga Peninsula'),
('PH', '10', 'Northern Mindanao'),
('PH', '11', 'Davao'),
('PH', '12', 'Soccsksargen'),
('PH', '13', 'Caraga'),
('PH', '14', 'Autonomous Region in Muslim Mindanao'),
('PH', '15', 'Cordillera Administrative Region'),
('PH', '40', 'CALABARZON'),
('PH', '41', 'MIMAROPA'),
('PH', 'ABR', 'Abra'),
('PH', 'AGN', 'Agusan del Norte'),
('PH', 'AGS', 'Agusan del Sur'),
('PH', 'AKL', 'Aklan'),
('PH', 'ALB', 'Albay'),
('PH', 'ANT', 'Antique'),
('PH', 'APA', 'Apayao'),
('PH', 'AUR', 'Aurora'),
('PH', 'BAN', 'Bataan'),
('PH', 'BAS', 'Basilan'),
('PH', 'BEN', 'Benguet'),
('PH', 'BIL', 'Biliran'),
('PH', 'BOH', 'Bohol'),
('PH', 'BTG', 'Batangas'),
('PH', 'BTN', 'Batanes'),
('PH', 'BUK', 'Bukidnon'),
('PH', 'BUL', 'Bulacan'),
('PH', 'CAG', 'Cagayan'),
('PH', 'CAM', 'Camiguin'),
('PH', 'CAN', 'Camarines Norte'),
('PH', 'CAP', 'Capiz'),
('PH', 'CAS', 'Camarines Sur'),
('PH', 'CAT', 'Catanduanes'),
('PH', 'CAV', 'Cavite'),
('PH', 'CEB', 'Cebu'),
('PH', 'COM', 'Compostela Valley'),
('PH', 'DAO', 'Davao Oriental'),
('PH', 'DAS', 'Davao del Sur'),
('PH', 'DAV', 'Davao del Norte'),
('PH', 'DIN', 'Dinagat Islands'),
('PH', 'EAS', 'Eastern Samar'),
('PH', 'GUI', 'Guimaras'),
('PH', 'IFU', 'Ifugao'),
('PH', 'ILI', 'Iloilo'),
('PH', 'ILN', 'Ilocos Norte'),
('PH', 'ILS', 'Ilocos Sur'),
('PH', 'ISA', 'Isabela'),
('PH', 'KAL', 'Kalinga'),
('PH', 'LAG', 'Laguna'),
('PH', 'LAN', 'Lanao del Norte'),
('PH', 'LAS', 'Lanao del Sur'),
('PH', 'LEY', 'Leyte'),
('PH', 'LUN', 'La Union'),
('PH', 'MAD', 'Marinduque'),
('PH', 'MAG', 'Maguindanao'),
('PH', 'MAS', 'Masbate'),
('PH', 'MDC', 'Mindoro Occidental'),
('PH', 'MDR', 'Mindoro Oriental'),
('PH', 'MOU', 'Mountain Province'),
('PH', 'MSC', 'Misamis Occidental'),
('PH', 'MSR', 'Misamis Oriental'),
('PH', 'NCO', 'Cotabato'),
('PH', 'NEC', 'Negros Occidental'),
('PH', 'NER', 'Negros Oriental'),
('PH', 'NSA', 'Northern Samar'),
('PH', 'NUE', 'Nueva Ecija'),
('PH', 'NUV', 'Nueva Vizcaya'),
('PH', 'PAM', 'Pampanga'),
('PH', 'PAN', 'Pangasinan'),
('PH', 'PLW', 'Palawan'),
('PH', 'QUE', 'Quezon'),
('PH', 'QUI', 'Quirino'),
('PH', 'RIZ', 'Rizal'),
('PH', 'ROM', 'Romblon'),
('PH', 'SAR', 'Sarangani'),
('PH', 'SCO', 'South Cotabato'),
('PH', 'SIG', 'Siquijor'),
('PH', 'SLE', 'Southern Leyte'),
('PH', 'SLU', 'Sulu'),
('PH', 'SOR', 'Sorsogon'),
('PH', 'SUK', 'Sultan Kudarat'),
('PH', 'SUN', 'Surigao del Norte'),
('PH', 'SUR', 'Surigao del Sur'),
('PH', 'TAR', 'Tarlac'),
('PH', 'TAW', 'Tawi-Tawi'),
('PH', 'WSA', 'Western Samar'),
('PH', 'X2~', 'Shariff Kabunsuan'),
('PH', 'ZAN', 'Zamboanga del Norte'),
('PH', 'ZAS', 'Zamboanga del Sur'),
('PH', 'ZMB', 'Zambales'),
('PH', 'ZSI', 'Zamboanga Sibuguey [Zamboanga Sibugay]'),
('PK', 'BA', 'Baluchistan'),
('PK', 'GB', 'Gilgit-Baltistan'),
('PK', 'IS', 'Islamabad'),
('PK', 'JK', 'Azad Kashmir'),
('PK', 'KP', 'Khyber Pakhtunkhwa'),
('PK', 'PB', 'Punjab'),
('PK', 'SD', 'Sindh'),
('PK', 'TA', 'Federally Administered Tribal Areas'),
('PL', 'DS', 'Dolnoslaskie'),
('PL', 'KP', 'Kujawsko-pomorskie'),
('PL', 'LB', 'Lubuskie'),
('PL', 'LD', 'Lódzkie'),
('PL', 'LU', 'Lubelskie'),
('PL', 'MA', 'Malopolskie'),
('PL', 'MZ', 'Mazowieckie'),
('PL', 'OP', 'Opolskie'),
('PL', 'PD', 'Podlaskie'),
('PL', 'PK', 'Podkarpackie'),
('PL', 'PM', 'Pomorskie'),
('PL', 'SK', 'Swietokrzyskie'),
('PL', 'SL', 'Slaskie'),
('PL', 'WN', 'Warminsko-mazurskie'),
('PL', 'WP', 'Wielkopolskie'),
('PL', 'ZP', 'Zachodniopomorskie'),
('PS', 'BTH', 'Bethlehem Bayt Laḩm'),
('PS', 'DEB', 'Deir El Balah Dayr al Balaḩ'),
('PS', 'GZA', 'Gaza Ghazzah'),
('PS', 'HBN', 'Hebron Al Khalīl'),
('PS', 'JEM', 'Jerusalem Al Quds'),
('PS', 'JEN', 'Jenin Janīn'),
('PS', 'JRH', 'Jericho – Al Aghwar Arīḩā wa al Aghwār'),
('PS', 'KYS', 'Khan Yunis Khān Yūnis'),
('PS', 'NBS', 'Nablus Nāblus'),
('PS', 'NGZ', 'North Gaza Shamāl Ghazzah'),
('PS', 'QQA', 'Qalqilya Qalqīlyah'),
('PS', 'RBH', 'Ramallah Rām Allāh wa al Bīrah'),
('PS', 'RFH', 'Rafah Rafaḩ'),
('PS', 'SLT', 'Salfit Salfīt'),
('PS', 'TBS', 'Tubas Ţūbās'),
('PS', 'TKM', 'Tulkarm Ţūlkarm'),
('PT', '01', 'Aveiro'),
('PT', '02', 'Beja'),
('PT', '03', 'Braga'),
('PT', '04', 'Bragança'),
('PT', '05', 'Castelo Branco'),
('PT', '06', 'Coimbra'),
('PT', '07', 'Évora'),
('PT', '08', 'Faro'),
('PT', '09', 'Guarda'),
('PT', '10', 'Leiria'),
('PT', '11', 'Lisboa'),
('PT', '12', 'Portalegre'),
('PT', '13', 'Porto'),
('PT', '14', 'Santarém'),
('PT', '15', 'Setúbal'),
('PT', '16', 'Viana do Castelo'),
('PT', '17', 'Vila Real'),
('PT', '18', 'Viseu'),
('PT', '20', 'Região Autónoma dos Açores'),
('PT', '30', 'Região Autónoma da Madeira'),
('PW', '002', 'Aimeliik'),
('PW', '004', 'Airai'),
('PW', '010', 'Angaur'),
('PW', '050', 'Hatobohei'),
('PW', '100', 'Kayangel'),
('PW', '150', 'Koror'),
('PW', '212', 'Melekeok'),
('PW', '214', 'Ngaraard'),
('PW', '218', 'Ngarchelong'),
('PW', '222', 'Ngardmau'),
('PW', '224', 'Ngatpang'),
('PW', '226', 'Ngchesar'),
('PW', '227', 'Ngeremlengui'),
('PW', '228', 'Ngiwal'),
('PW', '350', 'Peleliu'),
('PW', '370', 'Sonsorol'),
('PY', '1', 'Concepción'),
('PY', '10', 'Alto Paraná'),
('PY', '11', 'Central'),
('PY', '12', 'Ñeembucú'),
('PY', '13', 'Amambay'),
('PY', '14', 'Canindeyú'),
('PY', '15', 'Presidente Hayes'),
('PY', '16', 'Alto Paraguay'),
('PY', '19', 'Boquerón'),
('PY', '2', 'San Pedro'),
('PY', '3', 'Cordillera'),
('PY', '4', 'Guairá'),
('PY', '5', 'Caaguazú'),
('PY', '6', 'Caazapá'),
('PY', '7', 'Itapúa'),
('PY', '8', 'Misiones'),
('PY', '9', 'Paraguarí'),
('PY', 'ASU', 'Asunción'),
('QA', 'DA', 'Ad Dawhah'),
('QA', 'KH', 'Al Khawr wa adh Dhakhīrah'),
('QA', 'MS', 'Madinat ash Shamal'),
('QA', 'RA', 'Ar Rayyan'),
('QA', 'US', 'Umm Salal'),
('QA', 'WA', 'Al Wakrah'),
('QA', 'X1~', 'Umm Sa\'id'),
('QA', 'ZA', 'Az̧ Z̧a‘āyin'),
('RO', 'AB', 'Alba'),
('RO', 'AG', 'Arges'),
('RO', 'AR', 'Arad'),
('RO', 'B', 'Bucuresti'),
('RO', 'BC', 'Bacau'),
('RO', 'BH', 'Bihor'),
('RO', 'BN', 'Bistrita-Nasaud'),
('RO', 'BR', 'Braila'),
('RO', 'BT', 'Botosani'),
('RO', 'BV', 'Brasov'),
('RO', 'BZ', 'Buzau'),
('RO', 'CJ', 'Cluj'),
('RO', 'CL', 'Calarasi'),
('RO', 'CS', 'Caras-Severin'),
('RO', 'CT', 'Constanta'),
('RO', 'CV', 'Covasna'),
('RO', 'DB', 'Dâmbovita'),
('RO', 'DJ', 'Dolj'),
('RO', 'GJ', 'Gorj'),
('RO', 'GL', 'Galati'),
('RO', 'GR', 'Giurgiu'),
('RO', 'HD', 'Hunedoara'),
('RO', 'HR', 'Harghita'),
('RO', 'IF', 'Ilfov'),
('RO', 'IL', 'Ialomita'),
('RO', 'IS', 'Iasi'),
('RO', 'MH', 'Mehedinti'),
('RO', 'MM', 'Maramures'),
('RO', 'MS', 'Mures'),
('RO', 'NT', 'Neamt'),
('RO', 'OT', 'Olt'),
('RO', 'PH', 'Prahova'),
('RO', 'SB', 'Sibiu'),
('RO', 'SJ', 'Salaj'),
('RO', 'SM', 'Satu Mare'),
('RO', 'SV', 'Suceava'),
('RO', 'TL', 'Tulcea'),
('RO', 'TM', 'Timis'),
('RO', 'TR', 'Teleorman'),
('RO', 'VL', 'Vâlcea'),
('RO', 'VN', 'Vrancea'),
('RO', 'VS', 'Vaslui'),
('RS', '00', 'Belgrade'),
('RS', '01', 'Severnobački okrug'),
('RS', '02', 'Srednjebanatski okrug'),
('RS', '03', 'Severnobanatski okrug'),
('RS', '04', 'Južnobanatski okrug'),
('RS', '05', 'Zapadnobaèki okrug'),
('RS', '06', 'Južnobanatski okrug'),
('RS', '07', 'Sremski okrug'),
('RS', '08', 'Mačvanski okrug'),
('RS', '09', 'Kolubarski okrug'),
('RS', '10', 'Podunavski okrug'),
('RS', '11', 'Braničevski okrug'),
('RS', '12', 'Šumadijski okrug'),
('RS', '13', 'Pomoravski okrug'),
('RS', '14', 'Borski okrug'),
('RS', '15', 'Zajeèarski okrug'),
('RS', '16', 'Zlatiborski okrug'),
('RS', '17', 'Moravički okrug'),
('RS', '18', 'Raška okrug'),
('RS', '19', 'Rasinski okrug'),
('RS', '20', 'Nišavski okrug'),
('RS', '21', 'Toplièki okrug'),
('RS', '22', 'Pirotski okrug'),
('RS', '23', 'Jablanički okrug'),
('RS', '24', 'Pčinjski okrug'),
('RS', '25', 'Kosovski okrug'),
('RS', '26', 'Pećki okrug'),
('RS', '27', 'Prizrenski okrug'),
('RS', '28', 'Kosovsko-Mitrovački okrug'),
('RS', '29', 'Kosovsko-Pomoravski okrug'),
('RU', 'AD', 'Adygeya, Respublika'),
('RU', 'AL', 'Altay, Respublika'),
('RU', 'ALT', 'Altayskiy kray'),
('RU', 'AMU', 'Amurskaya oblast\''),
('RU', 'ARK', 'Arkhangel\'skaya oblast\''),
('RU', 'AST', 'Astrakhanskaya oblast\''),
('RU', 'BA', 'Bashkortostan, Respublika'),
('RU', 'BEL', 'Belgorodskaya oblast\''),
('RU', 'BRY', 'Bryanskaya oblast\''),
('RU', 'BU', 'Buryatiya, Respublika'),
('RU', 'CE', 'Chechenskaya Respublika'),
('RU', 'CHE', 'Chelyabinskaya oblast\''),
('RU', 'CHU', 'Chukotskiy avtonomnyy okrug'),
('RU', 'CU', 'Chuvashskaya Respublika'),
('RU', 'DA', 'Dagestan, Respublika'),
('RU', 'IN', 'Ingushskaya Respublika [Respublika Ingushetiya]'),
('RU', 'IRK', 'Irkutskaya oblast\''),
('RU', 'IVA', 'Ivanovskaya oblast\''),
('RU', 'KAM', 'Kamchatskaya oblast\''),
('RU', 'KB', 'Kabardino-Balkarskaya Respublika'),
('RU', 'KC', 'Karachayevo-Cherkesskaya Respublika'),
('RU', 'KDA', 'Krasnodarskiy kray'),
('RU', 'KEM', 'Kemerovskaya oblast\''),
('RU', 'KGD', 'Kaliningradskaya oblast\''),
('RU', 'KGN', 'Kurganskaya oblast\''),
('RU', 'KHA', 'Khabarovskiy kray'),
('RU', 'KHM', 'Khanty-Mansiyskiy avtonomnyy okrug [Yugra]'),
('RU', 'KIR', 'Kirovskaya oblast\''),
('RU', 'KK', 'Khakasiya, Respublika'),
('RU', 'KL', 'Kalmykiya, Respublika'),
('RU', 'KLU', 'Kaluzhskaya oblast\''),
('RU', 'KO', 'Komi, Respublika'),
('RU', 'KOS', 'Kostromskaya oblast\''),
('RU', 'KR', 'Kareliya, Respublika'),
('RU', 'KRS', 'Kurskaya oblast\''),
('RU', 'KYA', 'Krasnoyarskiy kray'),
('RU', 'LEN', 'Leningradskaya oblast\''),
('RU', 'LIP', 'Lipetskaya oblast\''),
('RU', 'MAG', 'Magadanskaya oblast\''),
('RU', 'ME', 'Mariy El, Respublika'),
('RU', 'MO', 'Mordoviya, Respublika'),
('RU', 'MOS', 'Moskovskaya oblast\''),
('RU', 'MOW', 'Moskva'),
('RU', 'MUR', 'Murmanskaya oblast\''),
('RU', 'NEN', 'Nenetskiy avtonomnyy okrug'),
('RU', 'NGR', 'Novgorodskaya oblast\''),
('RU', 'NIZ', 'Nizhegorodskaya oblast\''),
('RU', 'NVS', 'Novosibirskaya oblast\''),
('RU', 'OMS', 'Omskaya oblast\''),
('RU', 'ORE', 'Orenburgskaya oblast\''),
('RU', 'ORL', 'Orlovskaya oblast\''),
('RU', 'PER', 'Perm'),
('RU', 'PNZ', 'Penzenskaya oblast\''),
('RU', 'PRI', 'Primorskiy kray'),
('RU', 'PSK', 'Pskovskaya oblast\''),
('RU', 'ROS', 'Rostovskaya oblast\''),
('RU', 'RYA', 'Ryazanskaya oblast\''),
('RU', 'SA', 'Sakha, Respublika [Yakutiya]'),
('RU', 'SAK', 'Sakhalinskaya oblast\''),
('RU', 'SAM', 'Samarskaya oblast\''),
('RU', 'SAR', 'Saratovskaya oblast\''),
('RU', 'SE', 'Severnaya Osetiya, Respublika [Alaniya] [Respublika Severnaya Osetiya-Alaniya]');
INSERT INTO `states` (`country_alpha2`, `code`, `name`) VALUES
('RU', 'SMO', 'Smolenskaya oblast\''),
('RU', 'SPE', 'Sankt-Peterburg'),
('RU', 'STA', 'Stavropol\'skiy kray'),
('RU', 'SVE', 'Sverdlovskaya oblast\''),
('RU', 'TA', 'Tatarstan, Respublika'),
('RU', 'TAM', 'Tambovskaya oblast\''),
('RU', 'TOM', 'Tomskaya oblast\''),
('RU', 'TUL', 'Tul\'skaya oblast\''),
('RU', 'TVE', 'Tverskaya oblast\''),
('RU', 'TY', 'Tyva, Respublika [Tuva]'),
('RU', 'TYU', 'Tyumenskaya oblast\''),
('RU', 'UD', 'Udmurtskaya Respublika'),
('RU', 'ULY', 'Ul\'yanovskaya oblast\''),
('RU', 'VGG', 'Volgogradskaya oblast\''),
('RU', 'VLA', 'Vladimirskaya oblast\''),
('RU', 'VLG', 'Vologodskaya oblast\''),
('RU', 'VOR', 'Voronezhskaya oblast\''),
('RU', 'X1~', 'Komi-Permyak'),
('RU', 'YAN', 'Yamalo-Nenetskiy avtonomnyy okrug'),
('RU', 'YAR', 'Yaroslavskaya oblast\''),
('RU', 'YEV', 'Yevreyskaya avtonomnaya oblast\''),
('RU', 'ZAB', 'Zabajkal\'skij kraj'),
('RW', '01', 'Ville de Kigali'),
('RW', '02', 'Est'),
('RW', '03', 'Nord'),
('RW', '04', 'Ouest'),
('RW', '05', 'Sud'),
('SA', '01', 'Ar Riyāḑ'),
('SA', '02', 'Makkah'),
('SA', '03', 'Al Madinah'),
('SA', '04', 'Ash Sharqiyah'),
('SA', '05', 'Al Qasim'),
('SA', '06', 'Ḩā\'il'),
('SA', '07', 'Tabuk'),
('SA', '08', 'Al Ḩudūd ash Shamālīyah'),
('SA', '09', 'Jizan'),
('SA', '10', 'Najran'),
('SA', '11', 'Al Bāḩah'),
('SA', '12', 'Al Jawf'),
('SA', '14', '\'Asīr'),
('SB', 'CE', 'Central'),
('SB', 'CH', 'Choiseul'),
('SB', 'CT', 'Capital Territory'),
('SB', 'GU', 'Guadalcanal'),
('SB', 'IS', 'Isabel'),
('SB', 'MK', 'Makira'),
('SB', 'ML', 'Malaita'),
('SB', 'RB', 'Rennell and Bellona'),
('SB', 'TE', 'Temotu'),
('SB', 'WE', 'Western'),
('SC', '01', 'Anse aux Pins'),
('SC', '02', 'Anse Boileau'),
('SC', '03', 'Anse Étoile'),
('SC', '04', 'Au Cap'),
('SC', '05', 'Anse Royale'),
('SC', '06', 'Baie Lazare'),
('SC', '07', 'Baie Sainte Anne'),
('SC', '08', 'Beau Vallon'),
('SC', '09', 'Bel Air'),
('SC', '10', 'Bel Ombre'),
('SC', '11', 'Cascade'),
('SC', '12', 'Glacis'),
('SC', '13', 'Grand Anse Mahe'),
('SC', '14', 'Grand Anse Praslin'),
('SC', '15', 'La Digue'),
('SC', '16', 'English River'),
('SC', '17', 'Mont Buxton'),
('SC', '18', 'Mont Fleuri'),
('SC', '19', 'Plaisance'),
('SC', '20', 'Pointe La Rue'),
('SC', '21', 'Port Glaud'),
('SC', '22', 'Saint Louis'),
('SC', '23', 'Takamaka'),
('SC', '24', 'Les Mamelles'),
('SC', '25', 'Roche Caiman'),
('SD', '10', 'Gharb Kurdufan'),
('SD', 'DC', 'Zalingei'),
('SD', 'DE', 'Sharq Dārfūr'),
('SD', 'DN', 'Shamal Darfur'),
('SD', 'DS', 'Janub Darfur'),
('SD', 'DW', 'Gharb Darfur'),
('SD', 'GD', 'Al Qaḑārif'),
('SD', 'GZ', 'Al Jazirah'),
('SD', 'KA', 'Kassala'),
('SD', 'KH', 'Al Khartum'),
('SD', 'KN', 'Shamal Kurdufan'),
('SD', 'KS', 'Janub Kurdufan'),
('SD', 'NB', 'An Nil al Azraq'),
('SD', 'NO', 'Ash Shamaliyah'),
('SD', 'NR', 'An Nil'),
('SD', 'NW', 'An Nīl al Abyaḑ'),
('SD', 'RS', 'Al Bah¸r al Ah¸mar'),
('SD', 'SI', 'Sinnar'),
('SE', 'AB', 'Stockholms län [SE-01]'),
('SE', 'AC', 'Västerbottens län [SE-24]'),
('SE', 'BD', 'Norrbottens län [SE-25]'),
('SE', 'C', 'Uppsala län [SE-03]'),
('SE', 'D', 'Södermanlands län [SE-04]'),
('SE', 'E', 'Östergötlands län [SE-05]'),
('SE', 'F', 'Jönköpings län [SE-06]'),
('SE', 'G', 'Kronobergs län [SE-07]'),
('SE', 'H', 'Kalmar län [SE-08]'),
('SE', 'I', 'Gotlands län [SE-09]'),
('SE', 'K', 'Blekinge län [SE-10]'),
('SE', 'M', 'Skåne län [SE-12]'),
('SE', 'N', 'Hallands län [SE-13]'),
('SE', 'O', 'Västra Götalands län [SE-14]'),
('SE', 'S', 'Värmlands län [SE-17]'),
('SE', 'T', 'Örebro län [SE-18]'),
('SE', 'U', 'Västmanlands län [SE-19]'),
('SE', 'W', 'Dalarnas län [SE-20]'),
('SE', 'X', 'Gävleborgs län [SE-21]'),
('SE', 'Y', 'Västernorrlands län [SE-22]'),
('SE', 'Z', 'Jämtlands län [SE-23]'),
('SG', '01', 'Central Singapore'),
('SG', '02', 'North East'),
('SG', '03', 'North West'),
('SG', '04', 'South East'),
('SG', '05', 'South West'),
('SG', 'X1~', 'Singapore - No State'),
('SH', 'AC', 'Ascension'),
('SH', 'HL', 'Saint Helena'),
('SH', 'SH', 'Saint Helena'),
('SH', 'TA', 'Tristan da Cunha'),
('SI', '001', 'Ajdovšcina'),
('SI', '002', 'Beltinci'),
('SI', '003', 'Bled'),
('SI', '004', 'Bohinj'),
('SI', '005', 'Borovnica'),
('SI', '006', 'Bovec'),
('SI', '007', 'Brda'),
('SI', '008', 'Brezovica'),
('SI', '009', 'Brežice'),
('SI', '010', 'Tišina'),
('SI', '011', 'Celje'),
('SI', '012', 'Cerklje na Gorenjskem'),
('SI', '013', 'Cerknica'),
('SI', '014', 'Cerkno'),
('SI', '015', 'Crenšovci'),
('SI', '016', 'Crna na Koroškem'),
('SI', '017', 'Crnomelj'),
('SI', '018', 'Destrnik'),
('SI', '019', 'Divaca'),
('SI', '020', 'Dobrepolje'),
('SI', '021', 'Dobrova-Polhov Gradec'),
('SI', '022', 'Dol pri Ljubljani'),
('SI', '023', 'Domžale'),
('SI', '024', 'Dornava'),
('SI', '025', 'Dravograd'),
('SI', '026', 'Duplek'),
('SI', '027', 'Gorenja vas-Poljane'),
('SI', '028', 'Gorišnica'),
('SI', '029', 'Gornja Radgona'),
('SI', '030', 'Gornji Grad'),
('SI', '031', 'Gornji Petrovci'),
('SI', '032', 'Grosuplje'),
('SI', '033', 'Šalovci'),
('SI', '034', 'Hrastnik'),
('SI', '035', 'Hrpelje-Kozina'),
('SI', '036', 'Idrija'),
('SI', '037', 'Ig'),
('SI', '038', 'Ilirska Bistrica'),
('SI', '039', 'Ivancna Gorica'),
('SI', '040', 'Izola/Isola'),
('SI', '041', 'Jesenice'),
('SI', '042', 'Juršinci'),
('SI', '043', 'Kamnik'),
('SI', '044', 'Kanal'),
('SI', '045', 'Kidricevo'),
('SI', '046', 'Kobarid'),
('SI', '047', 'Kobilje'),
('SI', '048', 'Kocevje'),
('SI', '049', 'Komen'),
('SI', '050', 'Koper/Capodistria'),
('SI', '051', 'Kozje'),
('SI', '052', 'Kranj'),
('SI', '053', 'Kranjska Gora'),
('SI', '054', 'Krško'),
('SI', '055', 'Kungota'),
('SI', '056', 'Kuzma'),
('SI', '057', 'Laško'),
('SI', '058', 'Lenart'),
('SI', '059', 'Lendava/Lendva'),
('SI', '060', 'Litija'),
('SI', '061', 'Ljubljana'),
('SI', '062', 'Ljubno'),
('SI', '063', 'Ljutomer'),
('SI', '064', 'Logatec'),
('SI', '065', 'Loška dolina'),
('SI', '066', 'Loški Potok'),
('SI', '067', 'Luce'),
('SI', '068', 'Lukovica'),
('SI', '069', 'Majšperk'),
('SI', '070', 'Maribor'),
('SI', '071', 'Medvode'),
('SI', '072', 'Mengeš'),
('SI', '073', 'Metlika'),
('SI', '074', 'Mežica'),
('SI', '075', 'Miren-Kostanjevica'),
('SI', '076', 'Mislinja'),
('SI', '077', 'Moravce'),
('SI', '078', 'Moravske Toplice'),
('SI', '079', 'Mozirje'),
('SI', '080', 'Murska Sobota'),
('SI', '081', 'Muta'),
('SI', '082', 'Naklo'),
('SI', '083', 'Nazarje'),
('SI', '084', 'Nova Gorica'),
('SI', '085', 'Novo mesto'),
('SI', '086', 'Odranci'),
('SI', '087', 'Ormož'),
('SI', '088', 'Osilnica'),
('SI', '089', 'Pesnica'),
('SI', '090', 'Piran/Pirano'),
('SI', '091', 'Pivka'),
('SI', '092', 'Podcetrtek'),
('SI', '093', 'Podvelka'),
('SI', '094', 'Postojna'),
('SI', '095', 'Preddvor'),
('SI', '096', 'Ptuj'),
('SI', '097', 'Puconci'),
('SI', '098', 'Race-Fram'),
('SI', '099', 'Radece'),
('SI', '100', 'Radenci'),
('SI', '101', 'Radlje ob Dravi'),
('SI', '102', 'Radovljica'),
('SI', '103', 'Ravne na Koroškem'),
('SI', '104', 'Ribnica'),
('SI', '105', 'Rogašovci'),
('SI', '106', 'Rogaška Slatina'),
('SI', '107', 'Rogatec'),
('SI', '108', 'Ruše'),
('SI', '109', 'Semic'),
('SI', '110', 'Sevnica'),
('SI', '111', 'Sežana'),
('SI', '112', 'Slovenj Gradec'),
('SI', '113', 'Slovenska Bistrica'),
('SI', '114', 'Slovenske Konjice'),
('SI', '115', 'Starše'),
('SI', '116', 'Sveti Jurij'),
('SI', '117', 'Šencur'),
('SI', '118', 'Šentilj'),
('SI', '119', 'Šentjernej'),
('SI', '120', 'Šentjur pri Celju'),
('SI', '121', 'Škocjan'),
('SI', '122', 'Škofja Loka'),
('SI', '123', 'Škofljica'),
('SI', '124', 'Šmarje pri Jelšah'),
('SI', '125', 'Šmartno ob Paki'),
('SI', '126', 'Šoštanj'),
('SI', '127', 'Štore'),
('SI', '128', 'Tolmin'),
('SI', '129', 'Trbovlje'),
('SI', '130', 'Trebnje'),
('SI', '131', 'Tržic'),
('SI', '132', 'Turnišce'),
('SI', '133', 'Velenje'),
('SI', '134', 'Velike Lašce'),
('SI', '135', 'Videm'),
('SI', '136', 'Vipava'),
('SI', '137', 'Vitanje'),
('SI', '138', 'Vodice'),
('SI', '139', 'Vojnik'),
('SI', '140', 'Vrhnika'),
('SI', '141', 'Vuzenica'),
('SI', '142', 'Zagorje ob Savi'),
('SI', '143', 'Zavrc'),
('SI', '144', 'Zrece'),
('SI', '146', 'Železniki'),
('SI', '147', 'Žiri'),
('SI', '148', 'Benedikt'),
('SI', '149', 'Bistrica ob Sotli'),
('SI', '150', 'Bloke'),
('SI', '151', 'Braslovce'),
('SI', '152', 'Cankova'),
('SI', '153', 'Cerkvenjak'),
('SI', '154', 'Dobje'),
('SI', '155', 'Dobrna'),
('SI', '156', 'Dobrovnik/Dobronak'),
('SI', '157', 'Dolenjske Toplice'),
('SI', '158', 'Grad'),
('SI', '159', 'Hajdina'),
('SI', '160', 'Hoce-Slivnica'),
('SI', '161', 'Hodoš/Hodos'),
('SI', '162', 'Horjul'),
('SI', '163', 'Jezersko'),
('SI', '164', 'Komenda'),
('SI', '165', 'Kostel'),
('SI', '166', 'Križevci'),
('SI', '167', 'Lovrenc na Pohorju'),
('SI', '168', 'Markovci'),
('SI', '169', 'Miklavž na Dravskem polju'),
('SI', '170', 'Mirna Pec'),
('SI', '171', 'Oplotnica'),
('SI', '172', 'Podlehnik'),
('SI', '173', 'Polzela'),
('SI', '174', 'Prebold'),
('SI', '175', 'Prevalje'),
('SI', '176', 'Razkrižje'),
('SI', '177', 'Ribnica na Pohorju'),
('SI', '178', 'Selnica ob Dravi'),
('SI', '179', 'Sodražica'),
('SI', '180', 'Solcava'),
('SI', '181', 'Sveta Ana'),
('SI', '182', 'Sveti Andraž v Slovenskih goricah'),
('SI', '183', 'Šempeter-Vrtojba'),
('SI', '184', 'Tabor'),
('SI', '185', 'Trnovska vas'),
('SI', '186', 'Trzin'),
('SI', '187', 'Velika Polana'),
('SI', '188', 'Veržej'),
('SI', '189', 'Vransko'),
('SI', '190', 'Žalec'),
('SI', '191', 'Žetale'),
('SI', '192', 'Žirovnica'),
('SI', '193', 'Žužemberk'),
('SI', '194', 'Šmartno pri Litiji'),
('SI', '195', 'Apače'),
('SI', '196', 'Kosanjevica na Krki'),
('SI', '197', 'Cirkulane'),
('SI', '198', 'Makole'),
('SI', '199', 'Mokronog-Trebelno'),
('SI', '200', 'Poljčane'),
('SI', '201', 'Renče-Vogrsko'),
('SI', '202', 'Središče ob Dravi'),
('SI', '203', 'Straža'),
('SI', '204', 'Sveta Trojica v Slovenskih Goricah'),
('SI', '205', 'Sveti Tomaž'),
('SI', '206', 'Šmarješke Toplice'),
('SI', '207', 'Gorje'),
('SI', '208', 'Log-Dragomer'),
('SI', '209', 'Rečica ob Savinji'),
('SI', '210', 'Sveti Jurij v Slovenskih Goricah'),
('SI', '211', 'Šentrupert'),
('SK', 'BC', 'Banskobystrický kraj'),
('SK', 'BL', 'Bratislavský kraj'),
('SK', 'KI', 'Košický kraj'),
('SK', 'NI', 'Nitriansky kraj'),
('SK', 'PV', 'Prešovský kraj'),
('SK', 'TA', 'Trnavský kraj'),
('SK', 'TC', 'Trenciansky kraj'),
('SK', 'ZI', 'Žilinský kraj'),
('SL', 'E', 'Eastern'),
('SL', 'N', 'Northern'),
('SL', 'S', 'Southern'),
('SL', 'W', 'Western Area'),
('SM', '01', 'Acquaviva'),
('SM', '02', 'Chiesanuova'),
('SM', '03', 'Domagnano'),
('SM', '04', 'Faetano'),
('SM', '05', 'Fiorentino'),
('SM', '06', 'Borgo Maggiore'),
('SM', '07', 'San Marino'),
('SM', '08', 'Montegiardino'),
('SM', '09', 'Serravalle'),
('SN', 'DB', 'Diourbel'),
('SN', 'DK', 'Dakar'),
('SN', 'FK', 'Fatick'),
('SN', 'KA', 'Kaffrine'),
('SN', 'KD', 'Kolda'),
('SN', 'KE', 'Kédougou'),
('SN', 'KL', 'Kaolack'),
('SN', 'LG', 'Louga'),
('SN', 'MT', 'Matam'),
('SN', 'SE', 'Sédhiou'),
('SN', 'SL', 'Saint-Louis'),
('SN', 'TC', 'Tambacounda'),
('SN', 'TH', 'Thiès'),
('SN', 'ZG', 'Ziguinchor'),
('SO', 'AW', 'Awdal'),
('SO', 'BK', 'Bakool'),
('SO', 'BN', 'Banaadir'),
('SO', 'BR', 'Bari'),
('SO', 'BY', 'Bay'),
('SO', 'GA', 'Galguduud'),
('SO', 'GE', 'Gedo'),
('SO', 'HI', 'Hiiraan'),
('SO', 'JD', 'Jubbada Dhexe'),
('SO', 'JH', 'Jubbada Hoose'),
('SO', 'MU', 'Mudug'),
('SO', 'NU', 'Nugaal'),
('SO', 'SA', 'Sanaag'),
('SO', 'SD', 'Shabeellaha Dhexe'),
('SO', 'SH', 'Shabeellaha Hoose'),
('SO', 'SO', 'Sool'),
('SO', 'TO', 'Togdheer'),
('SO', 'WO', 'Woqooyi Galbeed'),
('SR', 'BR', 'Brokopondo'),
('SR', 'CM', 'Commewijne'),
('SR', 'CR', 'Coronie'),
('SR', 'MA', 'Marowijne'),
('SR', 'NI', 'Nickerie'),
('SR', 'PM', 'Paramaribo'),
('SR', 'PR', 'Para'),
('SR', 'SA', 'Saramacca'),
('SR', 'SI', 'Sipaliwini'),
('SR', 'WA', 'Wanica'),
('SS', 'BN', 'Northern Bahr el-Ghazal'),
('SS', 'BW', 'Western Bahr el-Ghazal'),
('SS', 'EC', 'Central Equatoria'),
('SS', 'EE', 'Eastern Equatoria'),
('SS', 'EW', 'Western Equatoria'),
('SS', 'JG', 'Jonglei'),
('SS', 'LK', 'Lakes'),
('SS', 'NU', 'Upper Nile'),
('SS', 'UY', 'Unity'),
('SS', 'WR', 'Warrap'),
('ST', 'P', 'Príncipe'),
('ST', 'S', 'São Tomé'),
('SV', 'AH', 'Ahuachapán'),
('SV', 'CA', 'Cabañas'),
('SV', 'CH', 'Chalatenango'),
('SV', 'CU', 'Cuscatlán'),
('SV', 'LI', 'La Libertad'),
('SV', 'MO', 'Morazán'),
('SV', 'PA', 'La Paz'),
('SV', 'SA', 'Santa Ana'),
('SV', 'SM', 'San Miguel'),
('SV', 'SO', 'Sonsonate'),
('SV', 'SS', 'San Salvador'),
('SV', 'SV', 'San Vicente'),
('SV', 'UN', 'La Unión'),
('SV', 'US', 'Usulután'),
('SY', 'DI', 'Dimashq'),
('SY', 'DR', 'Dar\'ā'),
('SY', 'DY', 'Dayr az Zawr'),
('SY', 'HA', 'Al Ḩasakah'),
('SY', 'HI', 'Ḩimş'),
('SY', 'HL', 'Ḩalab'),
('SY', 'HM', 'Ḩamāh'),
('SY', 'ID', 'Idlib'),
('SY', 'LA', 'Al Ladhiqiyah'),
('SY', 'QU', 'Al Qunaytirah'),
('SY', 'RA', 'Ar Raqqah'),
('SY', 'RD', 'Rif Dimashq'),
('SY', 'SU', 'As Suwayda\''),
('SY', 'TA', 'Tartus'),
('SZ', 'HH', 'Hhohho'),
('SZ', 'LU', 'Lubombo'),
('SZ', 'MA', 'Manzini'),
('SZ', 'SH', 'Shiselweni'),
('TD', 'BA', 'Al Baṭḩah'),
('TD', 'BG', 'Baḩr al Ghazāl'),
('TD', 'BO', 'Būrkū'),
('TD', 'CB', 'Shārī Bāqirmī'),
('TD', 'EN', 'Innīdī'),
('TD', 'GR', 'Qīrā'),
('TD', 'HL', 'Ḥajjar Lamīs'),
('TD', 'KA', 'Kānim'),
('TD', 'LC', 'Al Buḩayrah'),
('TD', 'LO', 'Lūqūn al Gharbī'),
('TD', 'LR', 'Lūqūn ash Sharqī'),
('TD', 'MA', 'Māndūl'),
('TD', 'MC', 'Shārī al Awsaṭ'),
('TD', 'ME', 'Māyū Kībbī ash Sharqī'),
('TD', 'MO', 'Māyū Kībbī al Gharbī'),
('TD', 'ND', 'Madīnat Injamīnā'),
('TD', 'OD', 'Waddāy'),
('TD', 'SA', 'Salāmāt'),
('TD', 'SI', 'Sīlā'),
('TD', 'TA', 'Tānjilī'),
('TD', 'TI', 'Tibastī'),
('TD', 'WF', 'Wādī Fīrā'),
('TF', 'X1~', 'Ile Saint-Paul et Ile Amsterdam'),
('TF', 'X2~', 'Crozet Islands'),
('TF', 'X3~', 'Kerguelen'),
('TF', 'X4~', 'Iles Eparses'),
('TG', 'C', 'Centre'),
('TG', 'K', 'Kara'),
('TG', 'M', 'Maritime'),
('TG', 'P', 'Plateaux'),
('TG', 'S', 'Savannes'),
('TH', '10', 'Krung Thep Maha Nakhon [Bangkok]'),
('TH', '11', 'Samut Prakan'),
('TH', '12', 'Nonthaburi'),
('TH', '13', 'Pathum Thani'),
('TH', '14', 'Phra Nakhon Si Ayutthaya'),
('TH', '15', 'Ang Thong'),
('TH', '16', 'Lop Buri'),
('TH', '17', 'Sing Buri'),
('TH', '18', 'Chai Nat'),
('TH', '19', 'Saraburi'),
('TH', '20', 'Chon Buri'),
('TH', '21', 'Rayong'),
('TH', '22', 'Chanthaburi'),
('TH', '23', 'Trat'),
('TH', '24', 'Chachoengsao'),
('TH', '25', 'Prachin Buri'),
('TH', '26', 'Nakhon Nayok'),
('TH', '27', 'Sa Kaeo'),
('TH', '30', 'Nakhon Ratchasima'),
('TH', '31', 'Buri Ram'),
('TH', '32', 'Surin'),
('TH', '33', 'Si Sa Ket'),
('TH', '34', 'Ubon Ratchathani'),
('TH', '35', 'Yasothon'),
('TH', '36', 'Chaiyaphum'),
('TH', '37', 'Amnat Charoen'),
('TH', '39', 'Nong Bua Lam Phu'),
('TH', '40', 'Khon Kaen'),
('TH', '41', 'Udon Thani'),
('TH', '42', 'Loei'),
('TH', '43', 'Nong Khai'),
('TH', '44', 'Maha Sarakham'),
('TH', '45', 'Roi Et'),
('TH', '46', 'Kalasin'),
('TH', '47', 'Sakon Nakhon'),
('TH', '48', 'Nakhon Phanom'),
('TH', '49', 'Mukdahan'),
('TH', '50', 'Chiang Mai'),
('TH', '51', 'Lamphun'),
('TH', '52', 'Lampang'),
('TH', '53', 'Uttaradit'),
('TH', '54', 'Phrae'),
('TH', '55', 'Nan'),
('TH', '56', 'Phayao'),
('TH', '57', 'Chiang Rai'),
('TH', '58', 'Mae Hong Son'),
('TH', '60', 'Nakhon Sawan'),
('TH', '61', 'Uthai Thani'),
('TH', '62', 'Kamphaeng Phet'),
('TH', '63', 'Tak'),
('TH', '64', 'Sukhothai'),
('TH', '65', 'Phitsanulok'),
('TH', '66', 'Phichit'),
('TH', '67', 'Phetchabun'),
('TH', '70', 'Ratchaburi'),
('TH', '71', 'Kanchanaburi'),
('TH', '72', 'Suphan Buri'),
('TH', '73', 'Nakhon Pathom'),
('TH', '74', 'Samut Sakhon'),
('TH', '75', 'Samut Songkhram'),
('TH', '76', 'Phetchaburi'),
('TH', '77', 'Prachuap Khiri Khan'),
('TH', '80', 'Nakhon Si Thammarat'),
('TH', '81', 'Krabi'),
('TH', '82', 'Phangnga'),
('TH', '83', 'Phuket'),
('TH', '84', 'Surat Thani'),
('TH', '85', 'Ranong'),
('TH', '86', 'Chumphon'),
('TH', '90', 'Songkhla'),
('TH', '91', 'Satun'),
('TH', '92', 'Trang'),
('TH', '93', 'Phatthalung'),
('TH', '94', 'Pattani'),
('TH', '95', 'Yala'),
('TH', '96', 'Narathiwat'),
('TH', 'S', 'Phatthaya'),
('TJ', 'GB', 'Gorno-Badakhshan'),
('TJ', 'KT', 'Khatlon'),
('TJ', 'SU', 'Sughd'),
('TJ', 'X1~', 'Dushanbe'),
('TL', 'AL', 'Aileu'),
('TL', 'AN', 'Ainaro'),
('TL', 'BA', 'Baucau'),
('TL', 'BO', 'Bobonaro'),
('TL', 'CO', 'Cova Lima'),
('TL', 'DI', 'Díli'),
('TL', 'ER', 'Ermera'),
('TL', 'LA', 'Lautem'),
('TL', 'LI', 'Liquiça'),
('TL', 'MF', 'Manufahi'),
('TL', 'MT', 'Manatuto'),
('TL', 'OE', 'Oecussi'),
('TL', 'VI', 'Viqueque'),
('TM', 'A', 'Ahal'),
('TM', 'B', 'Balkan'),
('TM', 'D', 'Dasoguz'),
('TM', 'L', 'Lebap'),
('TM', 'M', 'Mary'),
('TM', 'S', 'Aşgabat'),
('TN', '11', 'Tunis'),
('TN', '12', 'Ariana'),
('TN', '13', 'Ben Arous'),
('TN', '14', 'La Manouba'),
('TN', '21', 'Nabeul'),
('TN', '22', 'Zaghouan'),
('TN', '23', 'Bizerte'),
('TN', '31', 'Béja'),
('TN', '32', 'Jendouba'),
('TN', '33', 'Le Kef'),
('TN', '34', 'Siliana'),
('TN', '41', 'Kairouan'),
('TN', '42', 'Kasserine'),
('TN', '43', 'Sidi Bouzid'),
('TN', '51', 'Sousse'),
('TN', '52', 'Monastir'),
('TN', '53', 'Mahdia'),
('TN', '61', 'Sfax'),
('TN', '71', 'Gafsa'),
('TN', '72', 'Tozeur'),
('TN', '73', 'Kebili'),
('TN', '81', 'Gabès'),
('TN', '82', 'Medenine'),
('TN', '83', 'Tataouine'),
('TO', '01', 'Eua'),
('TO', '02', 'Ha\'apai'),
('TO', '03', 'Niuas'),
('TO', '04', 'Tongatapu'),
('TO', '05', 'Vava\'u'),
('TR', '01', 'Adana'),
('TR', '02', 'Adiyaman'),
('TR', '03', 'Afyonkarahisar'),
('TR', '04', 'Agri'),
('TR', '05', 'Amasya'),
('TR', '06', 'Ankara'),
('TR', '07', 'Antalya'),
('TR', '08', 'Artvin'),
('TR', '09', 'Aydin'),
('TR', '10', 'Balikesir'),
('TR', '11', 'Bilecik'),
('TR', '12', 'Bingöl'),
('TR', '13', 'Bitlis'),
('TR', '14', 'Bolu'),
('TR', '15', 'Burdur'),
('TR', '16', 'Bursa'),
('TR', '17', 'Çanakkale'),
('TR', '18', 'Çankiri'),
('TR', '19', 'Çorum'),
('TR', '20', 'Denizli'),
('TR', '21', 'Diyarbakir'),
('TR', '22', 'Edirne'),
('TR', '23', 'Elazig'),
('TR', '24', 'Erzincan'),
('TR', '25', 'Erzurum'),
('TR', '26', 'Eskisehir'),
('TR', '27', 'Gaziantep'),
('TR', '28', 'Giresun'),
('TR', '29', 'Gümüshane'),
('TR', '30', 'Hakkâri'),
('TR', '31', 'Hatay'),
('TR', '32', 'Isparta'),
('TR', '33', 'Mersin'),
('TR', '34', 'Istanbul'),
('TR', '35', 'Izmir'),
('TR', '36', 'Kars'),
('TR', '37', 'Kastamonu'),
('TR', '38', 'Kayseri'),
('TR', '39', 'Kirklareli'),
('TR', '40', 'Kirsehir'),
('TR', '41', 'Kocaeli'),
('TR', '42', 'Konya'),
('TR', '43', 'Kütahya'),
('TR', '44', 'Malatya'),
('TR', '45', 'Manisa'),
('TR', '46', 'Kahramanmaras'),
('TR', '47', 'Mardin'),
('TR', '48', 'Mugla'),
('TR', '49', 'Mus'),
('TR', '50', 'Nevsehir'),
('TR', '51', 'Nigde'),
('TR', '52', 'Ordu'),
('TR', '53', 'Rize'),
('TR', '54', 'Sakarya'),
('TR', '55', 'Samsun'),
('TR', '56', 'Siirt'),
('TR', '57', 'Sinop'),
('TR', '58', 'Sivas'),
('TR', '59', 'Tekirdag'),
('TR', '60', 'Tokat'),
('TR', '61', 'Trabzon'),
('TR', '62', 'Tunceli'),
('TR', '63', 'Sanliurfa'),
('TR', '64', 'Usak'),
('TR', '65', 'Van'),
('TR', '66', 'Yozgat'),
('TR', '67', 'Zonguldak'),
('TR', '68', 'Aksaray'),
('TR', '69', 'Bayburt'),
('TR', '70', 'Karaman'),
('TR', '71', 'Kirikkale'),
('TR', '72', 'Batman'),
('TR', '73', 'Sirnak'),
('TR', '74', 'Bartin'),
('TR', '75', 'Ardahan'),
('TR', '76', 'Igdir'),
('TR', '77', 'Yalova'),
('TR', '78', 'Karabük'),
('TR', '79', 'Kilis'),
('TR', '80', 'Osmaniye'),
('TR', '81', 'Düzce'),
('TT', 'ARI', 'Arima'),
('TT', 'CHA', 'Chaguanas'),
('TT', 'CTT', 'Couva-Tabaquite-Talparo'),
('TT', 'DMN', 'Diego Martin'),
('TT', 'ETO', 'Eastern Tobago'),
('TT', 'PED', 'Penal-Debe'),
('TT', 'POS', 'Port of Spain'),
('TT', 'PRT', 'Princes Town'),
('TT', 'PTF', 'Point Fortin'),
('TT', 'RCM', 'Rio Claro-Mayaro'),
('TT', 'SFO', 'San Fernando'),
('TT', 'SGE', 'Sangre Grande'),
('TT', 'SIP', 'Siparia'),
('TT', 'SJL', 'San Juan-Laventille'),
('TT', 'TUP', 'Tunapuna-Piarco'),
('TT', 'WTO', 'Western Tobago'),
('TV', 'FUN', 'Funafuti'),
('TV', 'NIT', 'Niutao'),
('TV', 'NIU', 'Nui'),
('TV', 'NKF', 'Nukufetau'),
('TV', 'NKL', 'Nukulaelae'),
('TV', 'NMA', 'Nanumea'),
('TV', 'NMG', 'Nanumanga'),
('TV', 'VAI', 'Vaitupu'),
('TW', 'CHA', 'Changhua'),
('TW', 'CYI', 'Chiayi Municipality'),
('TW', 'CYQ', 'Chiayi'),
('TW', 'HSQ', 'Hsinchu'),
('TW', 'HSZ', 'Hsinchu Municipality'),
('TW', 'HUA', 'Hualien'),
('TW', 'ILA', 'Ilan'),
('TW', 'KEE', 'Keelung Municipality'),
('TW', 'KHH', 'Kaohsiung Special Municipality'),
('TW', 'KHQ', 'Kaohsiung'),
('TW', 'MIA', 'Miaoli'),
('TW', 'NAN', 'Nantou'),
('TW', 'PEN', 'Penghu'),
('TW', 'PIF', 'Pingtung'),
('TW', 'TAO', 'Taoyuan'),
('TW', 'TNN', 'Tainan Municipality'),
('TW', 'TNQ', 'Tainan'),
('TW', 'TPE', 'Taipei Special Municipality'),
('TW', 'TPQ', 'Taipei'),
('TW', 'TTT', 'Taitung'),
('TW', 'TXG', 'Taichung Municipality'),
('TW', 'TXQ', 'Taichung'),
('TW', 'YUN', 'Yunlin'),
('TZ', '01', 'Arusha'),
('TZ', '02', 'Dar es Salaam'),
('TZ', '03', 'Dodoma'),
('TZ', '04', 'Iringa'),
('TZ', '05', 'Kagera'),
('TZ', '06', 'Kaskazini Pemba'),
('TZ', '07', 'Kaskazini Unguja'),
('TZ', '08', 'Kigoma'),
('TZ', '09', 'Kilimanjaro'),
('TZ', '10', 'Kusini Pemba'),
('TZ', '11', 'Kusini Unguja'),
('TZ', '12', 'Lindi'),
('TZ', '13', 'Mara'),
('TZ', '14', 'Mbeya'),
('TZ', '15', 'Mjini Magharibi'),
('TZ', '16', 'Morogoro'),
('TZ', '17', 'Mtwara'),
('TZ', '18', 'Mwanza'),
('TZ', '19', 'Pwani'),
('TZ', '20', 'Rukwa'),
('TZ', '21', 'Ruvuma'),
('TZ', '22', 'Shinyanga'),
('TZ', '23', 'Singida'),
('TZ', '24', 'Tabora'),
('TZ', '25', 'Tanga'),
('TZ', '26', 'Manyara'),
('UA', '05', 'Vinnyts\'ka Oblast\''),
('UA', '07', 'Volyns\'ka Oblast\''),
('UA', '09', 'Luhans\'ka Oblast\''),
('UA', '12', 'Dnipropetrovs\'ka Oblast\''),
('UA', '14', 'Donets\'ka Oblast\''),
('UA', '18', 'Zhytomyrs\'ka Oblast\''),
('UA', '21', 'Zakarpats\'ka Oblast\''),
('UA', '23', 'Zaporiz\'ka Oblast\''),
('UA', '26', 'Ivano-Frankivs\'ka Oblast\''),
('UA', '30', 'Kyïv'),
('UA', '32', 'Kyïvs\'ka Oblast\''),
('UA', '35', 'Kirovohrads\'ka Oblast\''),
('UA', '40', 'Sevastopol\''),
('UA', '43', 'Respublika Krym'),
('UA', '46', 'L\'vivs\'ka Oblast\''),
('UA', '48', 'Mykolaïvs\'ka Oblast\''),
('UA', '51', 'Odes\'ka Oblast\''),
('UA', '53', 'Poltavs\'ka Oblast\''),
('UA', '56', 'Rivnens\'ka Oblast\''),
('UA', '59', 'Sums\'ka Oblast\''),
('UA', '61', 'Ternopil\'s\'ka Oblast\''),
('UA', '63', 'Kharkivs\'ka Oblast\''),
('UA', '65', 'Khersons\'ka Oblast\''),
('UA', '68', 'Khmel\'nyts\'ka Oblast\''),
('UA', '71', 'Cherkas\'ka Oblast\''),
('UA', '74', 'Chernihivs\'ka Oblast\''),
('UA', '77', 'Chernivets\'ka Oblast\''),
('UG', '101', 'Kalangala'),
('UG', '102', 'Kampala'),
('UG', '103', 'Kiboga'),
('UG', '104', 'Luwero'),
('UG', '105', 'Masaka'),
('UG', '106', 'Mpigi'),
('UG', '107', 'Mubende'),
('UG', '108', 'Mukono'),
('UG', '109', 'Nakasongola'),
('UG', '110', 'Rakai'),
('UG', '111', 'Sembabule'),
('UG', '112', 'Kayunga'),
('UG', '113', 'Wakiso'),
('UG', '114', 'Mityana'),
('UG', '115', 'Nakaseke'),
('UG', '116', 'Lyantonde'),
('UG', '201', 'Bugiri'),
('UG', '202', 'Busia'),
('UG', '203', 'Iganga'),
('UG', '204', 'Jinja'),
('UG', '205', 'Kamuli'),
('UG', '206', 'Kapchorwa'),
('UG', '207', 'Katakwi'),
('UG', '208', 'Kumi'),
('UG', '209', 'Mbale'),
('UG', '210', 'Pallisa'),
('UG', '211', 'Soroti'),
('UG', '212', 'Tororo'),
('UG', '213', 'Kaberamaido'),
('UG', '214', 'Mayuge'),
('UG', '215', 'Sironko'),
('UG', '216', 'Amuria'),
('UG', '217', 'Budaka'),
('UG', '218', 'Bukwa'),
('UG', '219', 'Butaleja'),
('UG', '220', 'Kaliro'),
('UG', '221', 'Manafwa'),
('UG', '222', 'Namutumba'),
('UG', '223', 'Bududa'),
('UG', '224', 'Bukedea'),
('UG', '301', 'Adjumani'),
('UG', '302', 'Apac'),
('UG', '303', 'Arua'),
('UG', '304', 'Gulu'),
('UG', '305', 'Kitgum'),
('UG', '306', 'Kotido'),
('UG', '307', 'Lira'),
('UG', '308', 'Moroto'),
('UG', '309', 'Moyo'),
('UG', '310', 'Nebbi'),
('UG', '311', 'Nakapiripirit'),
('UG', '312', 'Pader'),
('UG', '313', 'Yumbe'),
('UG', '314', 'Amolatar'),
('UG', '315', 'Kaabong'),
('UG', '316', 'Koboko'),
('UG', '317', 'Abim'),
('UG', '318', 'Dokolo'),
('UG', '319', 'Amuru'),
('UG', '320', 'Maracha'),
('UG', '321', 'Oyam'),
('UG', '401', 'Bundibugyo'),
('UG', '402', 'Bushenyi'),
('UG', '403', 'Hoima'),
('UG', '404', 'Kabale'),
('UG', '405', 'Kabarole'),
('UG', '406', 'Kasese'),
('UG', '407', 'Kibaale'),
('UG', '408', 'Kisoro'),
('UG', '409', 'Masindi'),
('UG', '410', 'Mbarara'),
('UG', '411', 'Ntungamo'),
('UG', '412', 'Rukungiri'),
('UG', '413', 'Kamwenge'),
('UG', '414', 'Kanungu'),
('UG', '415', 'Kyenjojo'),
('UG', '416', 'Ibanda'),
('UG', '417', 'Isingiro'),
('UG', '418', 'Kiruhura'),
('UG', '419', 'Buliisa'),
('UG', 'C', 'Central'),
('UG', 'E', 'Eastern'),
('UG', 'N', 'Northern'),
('UG', 'W', 'Western'),
('UM', '67', 'Johnston Atoll'),
('UM', '71', 'Midway Islands'),
('UM', '76', 'Navassa Island'),
('UM', '79', 'Wake Island'),
('UM', '81', 'Baker Island'),
('UM', '84', 'Howland Island'),
('UM', '86', 'Jarvis Island'),
('UM', '89', 'Kingman Reef'),
('UM', '95', 'Palmyra Atoll'),
('US', 'AK', 'Alaska'),
('US', 'AL', 'Alabama'),
('US', 'AR', 'Arkansas'),
('US', 'AS', 'American Samoa'),
('US', 'AZ', 'Arizona'),
('US', 'CA', 'California'),
('US', 'CO', 'Colorado'),
('US', 'CT', 'Connecticut'),
('US', 'DC', 'District of Columbia'),
('US', 'DE', 'Delaware'),
('US', 'FL', 'Florida'),
('US', 'GA', 'Georgia'),
('US', 'GU', 'Guam'),
('US', 'HI', 'Hawaii'),
('US', 'IA', 'Iowa'),
('US', 'ID', 'Idaho'),
('US', 'IL', 'Illinois'),
('US', 'IN', 'Indiana'),
('US', 'KS', 'Kansas'),
('US', 'KY', 'Kentucky'),
('US', 'LA', 'Louisiana'),
('US', 'MA', 'Massachusetts'),
('US', 'MD', 'Maryland'),
('US', 'ME', 'Maine'),
('US', 'MI', 'Michigan'),
('US', 'MN', 'Minnesota'),
('US', 'MO', 'Missouri'),
('US', 'MP', 'Northern Mariana Islands'),
('US', 'MS', 'Mississippi'),
('US', 'MT', 'Montana'),
('US', 'NC', 'North Carolina'),
('US', 'ND', 'North Dakota'),
('US', 'NE', 'Nebraska'),
('US', 'NH', 'New Hampshire'),
('US', 'NJ', 'New Jersey'),
('US', 'NM', 'New Mexico'),
('US', 'NV', 'Nevada'),
('US', 'NY', 'New York'),
('US', 'OH', 'Ohio'),
('US', 'OK', 'Oklahoma'),
('US', 'OR', 'Oregon'),
('US', 'PA', 'Pennsylvania'),
('US', 'PR', 'Puerto Rico'),
('US', 'RI', 'Rhode Island'),
('US', 'SC', 'South Carolina'),
('US', 'SD', 'South Dakota'),
('US', 'TN', 'Tennessee'),
('US', 'TX', 'Texas'),
('US', 'UM', 'United States Minor Outlying Islands'),
('US', 'UT', 'Utah'),
('US', 'VA', 'Virginia'),
('US', 'VI', 'Virgin Islands, U.S.'),
('US', 'VT', 'Vermont'),
('US', 'WA', 'Washington'),
('US', 'WI', 'Wisconsin'),
('US', 'WV', 'West Virginia'),
('US', 'WY', 'Wyoming'),
('UY', 'AR', 'Artigas'),
('UY', 'DU', 'Durazno'),
('UY', 'FD', 'Florida'),
('UY', 'FS', 'Flores'),
('UY', 'LA', 'Lavalleja'),
('UY', 'MA', 'Maldonado'),
('UY', 'MO', 'Montevideo'),
('UY', 'PA', 'Paysandú'),
('UY', 'RN', 'Río Negro'),
('UY', 'RO', 'Rocha'),
('UY', 'RV', 'Rivera'),
('UY', 'SA', 'Salto'),
('UY', 'SJ', 'San José'),
('UY', 'SO', 'Soriano'),
('UY', 'TA', 'Tacuarembó'),
('UY', 'TT', 'Treinta y Tres'),
('UZ', 'AN', 'Andijon'),
('UZ', 'BU', 'Buxoro'),
('UZ', 'FA', 'Farg‘ona'),
('UZ', 'JI', 'Jizzax'),
('UZ', 'NG', 'Namangan'),
('UZ', 'NW', 'Navoiy'),
('UZ', 'QA', 'Qashqadaryo'),
('UZ', 'QR', 'Qoraqalpog‘iston Respublikasi'),
('UZ', 'SA', 'Samarqand'),
('UZ', 'SI', 'Sirdaryo'),
('UZ', 'SU', 'Surxondaryo'),
('UZ', 'TK', 'Toshkent City'),
('UZ', 'TO', 'Toshkent'),
('UZ', 'XO', 'Xorazm'),
('VC', '01', 'Charlotte'),
('VC', '02', 'Saint Andrew'),
('VC', '03', 'Saint David'),
('VC', '04', 'Saint George'),
('VC', '05', 'Saint Patrick'),
('VC', '06', 'Grenadines'),
('VE', 'A', 'Distrito Federal'),
('VE', 'B', 'Anzoátegui'),
('VE', 'C', 'Apure'),
('VE', 'D', 'Aragua'),
('VE', 'E', 'Barinas'),
('VE', 'F', 'Bolívar'),
('VE', 'G', 'Carabobo'),
('VE', 'H', 'Cojedes'),
('VE', 'I', 'Falcón'),
('VE', 'J', 'Guárico'),
('VE', 'K', 'Lara'),
('VE', 'L', 'Mérida'),
('VE', 'M', 'Miranda'),
('VE', 'N', 'Monagas'),
('VE', 'O', 'Nueva Esparta'),
('VE', 'P', 'Portuguesa'),
('VE', 'R', 'Sucre'),
('VE', 'S', 'Táchira'),
('VE', 'T', 'Trujillo'),
('VE', 'U', 'Yaracuy'),
('VE', 'V', 'Zulia'),
('VE', 'W', 'Dependencias Federales'),
('VE', 'X', 'Vargas'),
('VE', 'Y', 'Delta Amacuro'),
('VE', 'Z', 'Amazonas'),
('VN', '01', 'Lai Chau'),
('VN', '02', 'Lao Cai'),
('VN', '03', 'Ha Giang'),
('VN', '04', 'Cao Bang'),
('VN', '05', 'Son La'),
('VN', '06', 'Yen Bai'),
('VN', '07', 'Tuyen Quang'),
('VN', '09', 'Lang Son'),
('VN', '13', 'Quang Ninh'),
('VN', '14', 'Hoa Binh'),
('VN', '15', 'Ha Tay'),
('VN', '18', 'Ninh Binh'),
('VN', '20', 'Thai Binh'),
('VN', '21', 'Thanh Hoa'),
('VN', '22', 'Nghe An'),
('VN', '23', 'Ha Tinh'),
('VN', '24', 'Quang Binh'),
('VN', '25', 'Quang Tri'),
('VN', '26', 'Thua Thien-Hue'),
('VN', '27', 'Quang Nam'),
('VN', '28', 'Kon Tum'),
('VN', '29', 'Quang Ngai'),
('VN', '30', 'Gia Lai'),
('VN', '31', 'Binh Dinh'),
('VN', '32', 'Phu Yen'),
('VN', '33', 'Dac Lac'),
('VN', '34', 'Khanh Hoa'),
('VN', '35', 'Lam Dong'),
('VN', '36', 'Ninh Thuan'),
('VN', '37', 'Tay Ninh'),
('VN', '39', 'Dong Nai'),
('VN', '40', 'Binh Thuan'),
('VN', '41', 'Long An'),
('VN', '43', 'Ba Ria-Vung Tau'),
('VN', '44', 'An Giang'),
('VN', '45', 'Dong Thap'),
('VN', '46', 'Tien Giang'),
('VN', '47', 'Kien Giang'),
('VN', '49', 'Vinh Long'),
('VN', '50', 'Ben Tre'),
('VN', '51', 'Tra Vinh'),
('VN', '52', 'Soc Trang'),
('VN', '53', 'Bac Can'),
('VN', '54', 'Bac Giang'),
('VN', '55', 'Bac Lieu'),
('VN', '56', 'Bac Ninh'),
('VN', '57', 'Binh Duong'),
('VN', '58', 'Binh Phuoc'),
('VN', '59', 'Ca Mau'),
('VN', '61', 'Hai Duong'),
('VN', '63', 'Ha Nam'),
('VN', '66', 'Hung Yen'),
('VN', '67', 'Nam Dinh'),
('VN', '68', 'Phu Tho'),
('VN', '69', 'Thai Nguyen'),
('VN', '70', 'Vinh Phuc'),
('VN', '71', 'Dien Bien'),
('VN', '72', 'Dak Nong'),
('VN', '73', 'Hau Giang'),
('VN', 'CT', 'Can Tho'),
('VN', 'DN', 'Da Nang'),
('VN', 'HN', 'Ha Noi'),
('VN', 'HP', 'Hai Phong'),
('VN', 'SG', 'Ho Chi Minh [Sai Gon]'),
('VU', 'MAP', 'Malampa'),
('VU', 'PAM', 'Pénama'),
('VU', 'SAM', 'Sanma'),
('VU', 'SEE', 'Shéfa'),
('VU', 'TAE', 'Taféa'),
('VU', 'TOB', 'Torba'),
('WS', 'AA', 'A\'ana'),
('WS', 'AL', 'Aiga-i-le-Tai'),
('WS', 'AT', 'Atua'),
('WS', 'FA', 'Fa\'asaleleaga'),
('WS', 'GE', 'Gaga\'emauga'),
('WS', 'GI', 'Gagaifomauga'),
('WS', 'PA', 'Palauli'),
('WS', 'SA', 'Satupa\'itea'),
('WS', 'TU', 'Tuamasaga'),
('WS', 'VF', 'Va\'a-o-Fonoti'),
('WS', 'VS', 'Vaisigano'),
('YE', 'AB', 'Abyan'),
('YE', 'AD', 'ʿAdan'),
('YE', 'AM', 'Amran'),
('YE', 'BA', 'Al Bayḑā\''),
('YE', 'DA', 'Ad Dāli‘'),
('YE', 'DH', 'Dhamar'),
('YE', 'HD', 'Hadramawt'),
('YE', 'HJ', 'Hajjah'),
('YE', 'HU', 'Al Ḩudaydah'),
('YE', 'IB', 'Ibb'),
('YE', 'JA', 'Al Jawf'),
('YE', 'LA', 'Laḩij'),
('YE', 'MA', 'Ma\'rib'),
('YE', 'MR', 'Al Mahrah'),
('YE', 'MW', 'Al Mahwit'),
('YE', 'RA', 'Raymah'),
('YE', 'SA', 'Şan‘ā'),
('YE', 'SD', 'Sa`dah'),
('YE', 'SH', 'Shabwah'),
('YE', 'SN', 'Sanʿā'),
('YE', 'TA', 'Taʿizz'),
('ZA', 'EC', 'Eastern Cape'),
('ZA', 'FS', 'Free State'),
('ZA', 'GT', 'Gauteng'),
('ZA', 'LP', 'Limpopo'),
('ZA', 'MP', 'Mpumalanga'),
('ZA', 'NC', 'Northern Cape'),
('ZA', 'NL', 'Kwazulu-Natal'),
('ZA', 'NW', 'North-West'),
('ZA', 'WC', 'Western Cape'),
('ZM', '01', 'Western'),
('ZM', '02', 'Central'),
('ZM', '03', 'Eastern'),
('ZM', '04', 'Luapula'),
('ZM', '05', 'Northern'),
('ZM', '06', 'North-Western'),
('ZM', '07', 'Southern'),
('ZM', '08', 'Copperbelt'),
('ZM', '09', 'Lusaka'),
('ZW', 'BU', 'Bulawayo'),
('ZW', 'HA', 'Harare'),
('ZW', 'MA', 'Manicaland'),
('ZW', 'MC', 'Mashonaland Central'),
('ZW', 'ME', 'Mashonaland East'),
('ZW', 'MI', 'Midlands'),
('ZW', 'MN', 'Matabeleland North'),
('ZW', 'MS', 'Matabeleland South'),
('ZW', 'MV', 'Masvingo'),
('ZW', 'MW', 'Mashonaland West');

-- --------------------------------------------------------

--
-- Table structure for table `support_attachments`
--

CREATE TABLE `support_attachments` (
  `id` int(10) UNSIGNED NOT NULL,
  `reply_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_departments`
--

CREATE TABLE `support_departments` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `email` varchar(255) NOT NULL,
  `method` enum('pipe','pop3','imap','none') NOT NULL DEFAULT 'pipe',
  `default_priority` enum('emergency','critical','high','medium','low') NOT NULL DEFAULT 'low',
  `host` varchar(128) DEFAULT NULL,
  `user` varchar(64) DEFAULT NULL,
  `pass` text DEFAULT NULL,
  `port` smallint(6) DEFAULT NULL,
  `security` enum('none','ssl','tls') DEFAULT NULL,
  `box_name` varchar(255) DEFAULT NULL,
  `mark_messages` enum('read','deleted') DEFAULT NULL,
  `clients_only` tinyint(1) NOT NULL DEFAULT 1,
  `require_captcha` tinyint(1) NOT NULL DEFAULT 0,
  `override_from_email` tinyint(1) NOT NULL DEFAULT 1,
  `send_ticket_received` tinyint(1) NOT NULL DEFAULT 1,
  `automatic_transition` tinyint(1) NOT NULL DEFAULT 0,
  `close_ticket_interval` int(10) DEFAULT NULL,
  `delete_ticket_interval` int(10) DEFAULT NULL,
  `reminder_ticket_interval` int(10) DEFAULT NULL,
  `reminder_ticket_status` text DEFAULT NULL,
  `reminder_ticket_priority` text DEFAULT NULL,
  `include_attachments` tinyint(1) NOT NULL DEFAULT 0,
  `attachment_types` text DEFAULT NULL,
  `max_attachment_size` int(10) DEFAULT NULL,
  `response_id` int(10) DEFAULT NULL,
  `status` enum('hidden','visible') NOT NULL DEFAULT 'visible'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_department_fields`
--

CREATE TABLE `support_department_fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `department_id` int(10) UNSIGNED NOT NULL,
  `order` int(10) UNSIGNED NOT NULL,
  `label` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `visibility` enum('client','staff') DEFAULT NULL,
  `type` enum('checkbox','radio','select','quantity','text','textarea','password') DEFAULT 'text',
  `min` int(10) UNSIGNED DEFAULT NULL,
  `max` int(10) UNSIGNED DEFAULT NULL,
  `step` int(10) UNSIGNED DEFAULT NULL,
  `client_add` tinyint(1) NOT NULL DEFAULT 0,
  `encrypted` tinyint(1) NOT NULL DEFAULT 0,
  `auto_delete` tinyint(1) NOT NULL DEFAULT 0,
  `options` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_kb_articles`
--

CREATE TABLE `support_kb_articles` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `access` enum('public','private','hidden') NOT NULL DEFAULT 'public',
  `up_votes` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `down_votes` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_kb_article_categories`
--

CREATE TABLE `support_kb_article_categories` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `article_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_kb_article_content`
--

CREATE TABLE `support_kb_article_content` (
  `article_id` int(10) UNSIGNED NOT NULL,
  `lang` char(5) NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` mediumtext NOT NULL,
  `content_type` enum('text','html') NOT NULL DEFAULT 'text'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_kb_categories`
--

CREATE TABLE `support_kb_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `access` enum('public','private','hidden') NOT NULL DEFAULT 'public',
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_reminders`
--

CREATE TABLE `support_reminders` (
  `id` int(10) UNSIGNED NOT NULL,
  `ticket_id` int(10) UNSIGNED NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `date_sent` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_replies`
--

CREATE TABLE `support_replies` (
  `id` int(10) UNSIGNED NOT NULL,
  `ticket_id` int(10) UNSIGNED NOT NULL,
  `staff_id` int(10) UNSIGNED DEFAULT NULL,
  `contact_id` int(10) UNSIGNED DEFAULT NULL,
  `type` enum('reply','note','log') NOT NULL DEFAULT 'reply',
  `details` mediumtext NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_responses`
--

CREATE TABLE `support_responses` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(64) NOT NULL,
  `details` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_response_categories`
--

CREATE TABLE `support_response_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_settings`
--

CREATE TABLE `support_settings` (
  `key` varchar(32) NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_staff_departments`
--

CREATE TABLE `support_staff_departments` (
  `department_id` int(10) UNSIGNED NOT NULL,
  `staff_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_staff_schedules`
--

CREATE TABLE `support_staff_schedules` (
  `staff_id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `day` enum('sun','mon','tue','wed','thu','fri','sat') NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_staff_settings`
--

CREATE TABLE `support_staff_settings` (
  `key` varchar(32) NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `staff_id` int(10) UNSIGNED NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` int(10) UNSIGNED NOT NULL,
  `department_id` int(10) UNSIGNED NOT NULL,
  `staff_id` int(10) UNSIGNED DEFAULT NULL,
  `service_id` int(10) UNSIGNED DEFAULT NULL,
  `client_id` int(10) UNSIGNED DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `summary` varchar(255) NOT NULL,
  `priority` enum('emergency','critical','high','medium','low') NOT NULL DEFAULT 'low',
  `status` enum('open','awaiting_reply','in_progress','on_hold','closed','trash') NOT NULL DEFAULT 'open',
  `date_added` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `date_closed` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_ticket_fields`
--

CREATE TABLE `support_ticket_fields` (
  `ticket_id` int(10) UNSIGNED NOT NULL,
  `field_id` int(10) UNSIGNED NOT NULL,
  `value` text NOT NULL,
  `encrypted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_events`
--

CREATE TABLE `system_events` (
  `event` varchar(255) NOT NULL,
  `observer` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `system_events`
--

INSERT INTO `system_events` (`event`, `observer`) VALUES
('Clients.delete', '\\Blesta\\Core\\Util\\Events\\Handlers\\ClientAccount'),
('Clients.delete', '\\Blesta\\Core\\Util\\Events\\Handlers\\ClientNotes'),
('Clients.delete', '\\Blesta\\Core\\Util\\Events\\Handlers\\ClientPackages'),
('Clients.delete', '\\Blesta\\Core\\Util\\Events\\Handlers\\Clients'),
('Clients.delete', '\\Blesta\\Core\\Util\\Events\\Handlers\\ClientSettings'),
('Clients.delete', '\\Blesta\\Core\\Util\\Events\\Handlers\\ClientValues'),
('Clients.delete', '\\Blesta\\Core\\Util\\Events\\Handlers\\Contacts'),
('Clients.delete', '\\Blesta\\Core\\Util\\Events\\Handlers\\Invoices'),
('Clients.delete', '\\Blesta\\Core\\Util\\Events\\Handlers\\InvoicesRecur'),
('Clients.delete', '\\Blesta\\Core\\Util\\Events\\Handlers\\LogClientSettings'),
('Clients.delete', '\\Blesta\\Core\\Util\\Events\\Handlers\\LogEmails'),
('Clients.delete', '\\Blesta\\Core\\Util\\Events\\Handlers\\Services'),
('Clients.delete', '\\Blesta\\Core\\Util\\Events\\Handlers\\Transactions'),
('Contacts.delete', '\\Blesta\\Core\\Util\\Events\\Handlers\\AccountsAch'),
('Contacts.delete', '\\Blesta\\Core\\Util\\Events\\Handlers\\AccountsCc'),
('Contacts.delete', '\\Blesta\\Core\\Util\\Events\\Handlers\\Contacts'),
('Contacts.delete', '\\Blesta\\Core\\Util\\Events\\Handlers\\LogContacts'),
('Users.delete', '\\Blesta\\Core\\Util\\Events\\Handlers\\LogUsers');

-- --------------------------------------------------------

--
-- Table structure for table `system_overview_settings`
--

CREATE TABLE `system_overview_settings` (
  `staff_id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `order` int(5) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `system_overview_settings`
--

INSERT INTO `system_overview_settings` (`staff_id`, `company_id`, `key`, `value`, `order`) VALUES
(1, 1, 'active_users_today', '1', 2),
(1, 1, 'clients_active', '1', 1),
(1, 1, 'date_range', '7', 12),
(1, 1, 'graph_clients', '1', 9),
(1, 1, 'graph_services', '1', 10),
(1, 1, 'open_tickets', '0', 7),
(1, 1, 'pending_orders', '0', 6),
(1, 1, 'recurring_invoices', '1', 5),
(1, 1, 'services_active', '1', 3),
(1, 1, 'services_scheduled_cancellation', '0', 4),
(1, 1, 'show_legend', '1', 11),
(1, 1, 'show_one_tab', '0', 8);

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `level` tinyint(2) UNSIGNED NOT NULL DEFAULT 1,
  `name` varchar(64) DEFAULT NULL,
  `amount` decimal(19,4) NOT NULL DEFAULT 0.0000,
  `type` enum('inclusive_calculated','inclusive','exclusive') NOT NULL DEFAULT 'exclusive',
  `country` varchar(2) DEFAULT NULL,
  `state` varchar(3) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `themes`
--

CREATE TABLE `themes` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(64) NOT NULL,
  `type` enum('admin','client') NOT NULL DEFAULT 'admin',
  `data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `themes`
--

INSERT INTO `themes` (`id`, `company_id`, `name`, `type`, `data`) VALUES
(2, 1, 'Blesta Green', 'admin', 'YToyOntzOjY6ImNvbG9ycyI7YToxNzp7czoyNToidGhlbWVfaGVhZGVyX2JnX2NvbG9yX3RvcCI7czo2OiI2YWIzMWQiO3M6Mjg6InRoZW1lX2hlYWRlcl9iZ19jb2xvcl9ib3R0b20iO3M6NjoiYWJkNDdmIjtzOjIzOiJ0aGVtZV9oZWFkZXJfdGV4dF9jb2xvciI7czo2OiJlNGU0ZTQiO3M6Mzc6InRoZW1lX25hdmlnYXRpb25fYmFja2dyb3VuZF9jb2xvcl90b3AiO3M6NjoiNTg2MTU5IjtzOjQwOiJ0aGVtZV9uYXZpZ2F0aW9uX2JhY2tncm91bmRfY29sb3JfYm90dG9tIjtzOjY6IjQ1NGE0MiI7czoyNzoidGhlbWVfbmF2aWdhdGlvbl90ZXh0X2NvbG9yIjtzOjY6ImFmYWZhZiI7czozMjoidGhlbWVfc3VibmF2aWdhdGlvbl9iZ19jb2xvcl90b3AiO3M6NjoiMjIyMzI2IjtzOjM1OiJ0aGVtZV9zdWJuYXZpZ2F0aW9uX2JnX2NvbG9yX2JvdHRvbSI7czo2OiIzMzM0MzkiO3M6MzM6InRoZW1lX3dpZGdldF9oZWFkaW5nX2JnX2NvbG9yX3RvcCI7czo2OiJhMWNmNzAiO3M6MzY6InRoZW1lX3dpZGdldF9oZWFkaW5nX2JnX2NvbG9yX2JvdHRvbSI7czo2OiI3Y2JjMzciO3M6Mzg6InRoZW1lX3dpZGdldF9pY29uX2hlYWRpbmdfYmdfY29sb3JfdG9wIjtzOjY6Ijc2YjkyZSI7czo0MToidGhlbWVfd2lkZ2V0X2ljb25faGVhZGluZ19iZ19jb2xvcl9ib3R0b20iO3M6NjoiOWRjZDY5IjtzOjIwOiJ0aGVtZV9ib3hfdGV4dF9jb2xvciI7czo2OiJmZmZmZmYiO3M6MTc6InRoZW1lX3RleHRfc2hhZG93IjtzOjY6Ijc3OTk5OSI7czoyNDoidGhlbWVfYWN0aW9uc190ZXh0X2NvbG9yIjtzOjY6IjUwODAxZSI7czoyNDoidGhlbWVfaGlnaGxpZ2h0X2JnX2NvbG9yIjtzOjY6ImY0ZmZmMyI7czoyMjoidGhlbWVfYm94X3NoYWRvd19jb2xvciI7czo2OiJiZmJmYmYiO31zOjg6ImxvZ29fdXJsIjtzOjA6IiI7fQ=='),
(3, 1, 'Real Teal', 'admin', 'YToyOntzOjY6ImNvbG9ycyI7YToxNzp7czoyNToidGhlbWVfaGVhZGVyX2JnX2NvbG9yX3RvcCI7czo2OiIxNjkyYTUiO3M6Mjg6InRoZW1lX2hlYWRlcl9iZ19jb2xvcl9ib3R0b20iO3M6NjoiN2FjMmNiIjtzOjIzOiJ0aGVtZV9oZWFkZXJfdGV4dF9jb2xvciI7czo2OiJlNGU0ZTQiO3M6Mzc6InRoZW1lX25hdmlnYXRpb25fYmFja2dyb3VuZF9jb2xvcl90b3AiO3M6NjoiNWE1ZDYzIjtzOjQwOiJ0aGVtZV9uYXZpZ2F0aW9uX2JhY2tncm91bmRfY29sb3JfYm90dG9tIjtzOjY6IjQyNDQ0YSI7czoyNzoidGhlbWVfbmF2aWdhdGlvbl90ZXh0X2NvbG9yIjtzOjY6ImFmYWZhZiI7czozMjoidGhlbWVfc3VibmF2aWdhdGlvbl9iZ19jb2xvcl90b3AiO3M6NjoiMjIyMzI2IjtzOjM1OiJ0aGVtZV9zdWJuYXZpZ2F0aW9uX2JnX2NvbG9yX2JvdHRvbSI7czo2OiIzMzM0MzkiO3M6MzM6InRoZW1lX3dpZGdldF9oZWFkaW5nX2JnX2NvbG9yX3RvcCI7czo2OiI2Y2JiYzYiO3M6MzY6InRoZW1lX3dpZGdldF9oZWFkaW5nX2JnX2NvbG9yX2JvdHRvbSI7czo2OiIzMDllYWYiO3M6Mzg6InRoZW1lX3dpZGdldF9pY29uX2hlYWRpbmdfYmdfY29sb3JfdG9wIjtzOjY6IjI3OWFhYyI7czo0MToidGhlbWVfd2lkZ2V0X2ljb25faGVhZGluZ19iZ19jb2xvcl9ib3R0b20iO3M6NjoiNjViNmMzIjtzOjIwOiJ0aGVtZV9ib3hfdGV4dF9jb2xvciI7czo2OiJmZmZmZmYiO3M6MTc6InRoZW1lX3RleHRfc2hhZG93IjtzOjY6Ijc3OTk5OSI7czoyNDoidGhlbWVfYWN0aW9uc190ZXh0X2NvbG9yIjtzOjY6IjA5NTg2NiI7czoyNDoidGhlbWVfaGlnaGxpZ2h0X2JnX2NvbG9yIjtzOjY6ImViZmNmZiI7czoyMjoidGhlbWVfYm94X3NoYWRvd19jb2xvciI7czo2OiJiZmJmYmYiO31zOjg6ImxvZ29fdXJsIjtzOjA6IiI7fQ=='),
(6, 1, 'Soft Blue', 'admin', 'YToyOntzOjY6ImNvbG9ycyI7YToxNzp7czoyNToidGhlbWVfaGVhZGVyX2JnX2NvbG9yX3RvcCI7czo2OiI3OGE5YzkiO3M6Mjg6InRoZW1lX2hlYWRlcl9iZ19jb2xvcl9ib3R0b20iO3M6NjoiYjNjZWUxIjtzOjIzOiJ0aGVtZV9oZWFkZXJfdGV4dF9jb2xvciI7czo2OiJlNGU0ZTQiO3M6Mzc6InRoZW1lX25hdmlnYXRpb25fYmFja2dyb3VuZF9jb2xvcl90b3AiO3M6NjoiNWE1ZDYzIjtzOjQwOiJ0aGVtZV9uYXZpZ2F0aW9uX2JhY2tncm91bmRfY29sb3JfYm90dG9tIjtzOjY6IjQyNDQ0YSI7czoyNzoidGhlbWVfbmF2aWdhdGlvbl90ZXh0X2NvbG9yIjtzOjY6ImFmYWZhZiI7czozMjoidGhlbWVfc3VibmF2aWdhdGlvbl9iZ19jb2xvcl90b3AiO3M6NjoiMjIyMzI2IjtzOjM1OiJ0aGVtZV9zdWJuYXZpZ2F0aW9uX2JnX2NvbG9yX2JvdHRvbSI7czo2OiIzMzM0MzkiO3M6MzM6InRoZW1lX3dpZGdldF9oZWFkaW5nX2JnX2NvbG9yX3RvcCI7czo2OiJhYWM4ZGQiO3M6MzY6InRoZW1lX3dpZGdldF9oZWFkaW5nX2JnX2NvbG9yX2JvdHRvbSI7czo2OiI4NmIxY2YiO3M6Mzg6InRoZW1lX3dpZGdldF9pY29uX2hlYWRpbmdfYmdfY29sb3JfdG9wIjtzOjY6IjgyYWVjZCI7czo0MToidGhlbWVfd2lkZ2V0X2ljb25faGVhZGluZ19iZ19jb2xvcl9ib3R0b20iO3M6NjoiYTZjNWRiIjtzOjIwOiJ0aGVtZV9ib3hfdGV4dF9jb2xvciI7czo2OiJmZmZmZmYiO3M6MTc6InRoZW1lX3RleHRfc2hhZG93IjtzOjY6Ijc3OTk5OSI7czoyNDoidGhlbWVfYWN0aW9uc190ZXh0X2NvbG9yIjtzOjY6Ijc4YThjOSI7czoyNDoidGhlbWVfaGlnaGxpZ2h0X2JnX2NvbG9yIjtzOjY6ImVjZjdmZiI7czoyMjoidGhlbWVfYm94X3NoYWRvd19jb2xvciI7czo2OiJiZmJmYmYiO31zOjg6ImxvZ29fdXJsIjtzOjA6IiI7fQ=='),
(7, 1, 'Busy Bee', 'admin', 'YToyOntzOjY6ImNvbG9ycyI7YToyMDp7czoyNToidGhlbWVfaGVhZGVyX2JnX2NvbG9yX3RvcCI7czo2OiJmNWNmMGYiO3M6Mjg6InRoZW1lX2hlYWRlcl9iZ19jb2xvcl9ib3R0b20iO3M6NjoiZThjMDBlIjtzOjIzOiJ0aGVtZV9oZWFkZXJfdGV4dF9jb2xvciI7czo2OiJmNWYzZTgiO3M6Mzc6InRoZW1lX25hdmlnYXRpb25fYmFja2dyb3VuZF9jb2xvcl90b3AiO3M6NjoiNTI0NzFjIjtzOjQwOiJ0aGVtZV9uYXZpZ2F0aW9uX2JhY2tncm91bmRfY29sb3JfYm90dG9tIjtzOjY6IjQxMzgxMCI7czoyNzoidGhlbWVfbmF2aWdhdGlvbl90ZXh0X2NvbG9yIjtzOjY6ImYwZWNkOCI7czozMzoidGhlbWVfbmF2aWdhdGlvbl90ZXh0X2hvdmVyX2NvbG9yIjtzOjY6ImY1ZjNlOCI7czozMjoidGhlbWVfc3VibmF2aWdhdGlvbl9iZ19jb2xvcl90b3AiO3M6NjoiZGJkN2MzIjtzOjM1OiJ0aGVtZV9zdWJuYXZpZ2F0aW9uX2JnX2NvbG9yX2JvdHRvbSI7czo2OiJlY2U4ZDIiO3M6MzA6InRoZW1lX3N1Ym5hdmlnYXRpb25fdGV4dF9jb2xvciI7czo2OiI2MzU3MmEiO3M6Mzc6InRoZW1lX3N1Ym5hdmlnYXRpb25fdGV4dF9hY3RpdmVfY29sb3IiO3M6NjoiNDEzODEwIjtzOjMzOiJ0aGVtZV93aWRnZXRfaGVhZGluZ19iZ19jb2xvcl90b3AiO3M6NjoiZThjMDBlIjtzOjM2OiJ0aGVtZV93aWRnZXRfaGVhZGluZ19iZ19jb2xvcl9ib3R0b20iO3M6NjoiZjVjZjBmIjtzOjM4OiJ0aGVtZV93aWRnZXRfaWNvbl9oZWFkaW5nX2JnX2NvbG9yX3RvcCI7czo2OiJmMGNhMGMiO3M6NDE6InRoZW1lX3dpZGdldF9pY29uX2hlYWRpbmdfYmdfY29sb3JfYm90dG9tIjtzOjY6ImU2YmEwYyI7czoyMDoidGhlbWVfYm94X3RleHRfY29sb3IiO3M6NjoiZmZmZmZmIjtzOjE3OiJ0aGVtZV90ZXh0X3NoYWRvdyI7czo2OiI3MDYzMzEiO3M6MjQ6InRoZW1lX2FjdGlvbnNfdGV4dF9jb2xvciI7czo2OiI0MTM4MTAiO3M6MjQ6InRoZW1lX2hpZ2hsaWdodF9iZ19jb2xvciI7czo2OiJmZmZmZDEiO3M6MjI6InRoZW1lX2JveF9zaGFkb3dfY29sb3IiO3M6NjoiYmZiZmJmIjt9czo4OiJsb2dvX3VybCI7czowOiIiO30='),
(8, 1, 'Standard Issue', 'admin', 'YToyOntzOjY6ImNvbG9ycyI7YToyMDp7czoyNToidGhlbWVfaGVhZGVyX2JnX2NvbG9yX3RvcCI7czo2OiI3Yjg0NTAiO3M6Mjg6InRoZW1lX2hlYWRlcl9iZ19jb2xvcl9ib3R0b20iO3M6NjoiNjg3MDQyIjtzOjIzOiJ0aGVtZV9oZWFkZXJfdGV4dF9jb2xvciI7czo2OiJmZGZmZjAiO3M6Mzc6InRoZW1lX25hdmlnYXRpb25fYmFja2dyb3VuZF9jb2xvcl90b3AiO3M6NjoiOTc5Zjc5IjtzOjQwOiJ0aGVtZV9uYXZpZ2F0aW9uX2JhY2tncm91bmRfY29sb3JfYm90dG9tIjtzOjY6IjhjOTQ2YiI7czoyNzoidGhlbWVfbmF2aWdhdGlvbl90ZXh0X2NvbG9yIjtzOjY6ImU5ZWJkYSI7czozMzoidGhlbWVfbmF2aWdhdGlvbl90ZXh0X2hvdmVyX2NvbG9yIjtzOjY6ImZmZmZmZiI7czozMjoidGhlbWVfc3VibmF2aWdhdGlvbl9iZ19jb2xvcl90b3AiO3M6NjoiNjk2MDQxIjtzOjM1OiJ0aGVtZV9zdWJuYXZpZ2F0aW9uX2JnX2NvbG9yX2JvdHRvbSI7czo2OiI3ZDcxNDkiO3M6MzA6InRoZW1lX3N1Ym5hdmlnYXRpb25fdGV4dF9jb2xvciI7czo2OiJiMGEwNmYiO3M6Mzc6InRoZW1lX3N1Ym5hdmlnYXRpb25fdGV4dF9hY3RpdmVfY29sb3IiO3M6NjoiZDFjNWEzIjtzOjMzOiJ0aGVtZV93aWRnZXRfaGVhZGluZ19iZ19jb2xvcl90b3AiO3M6NjoiN2I4NDUwIjtzOjM2OiJ0aGVtZV93aWRnZXRfaGVhZGluZ19iZ19jb2xvcl9ib3R0b20iO3M6NjoiOTU5ZTY3IjtzOjM4OiJ0aGVtZV93aWRnZXRfaWNvbl9oZWFkaW5nX2JnX2NvbG9yX3RvcCI7czo2OiI5NTllNjciO3M6NDE6InRoZW1lX3dpZGdldF9pY29uX2hlYWRpbmdfYmdfY29sb3JfYm90dG9tIjtzOjY6IjdiODQ1MCI7czoyMDoidGhlbWVfYm94X3RleHRfY29sb3IiO3M6NjoiZmZmZmZmIjtzOjE3OiJ0aGVtZV90ZXh0X3NoYWRvdyI7czo2OiI1YzYzMzgiO3M6MjQ6InRoZW1lX2FjdGlvbnNfdGV4dF9jb2xvciI7czo2OiI2OTYwNDEiO3M6MjQ6InRoZW1lX2hpZ2hsaWdodF9iZ19jb2xvciI7czo2OiJmYWZmZTAiO3M6MjI6InRoZW1lX2JveF9zaGFkb3dfY29sb3IiO3M6NjoiYmZiZmJmIjt9czo4OiJsb2dvX3VybCI7czowOiIiO30='),
(9, 1, 'Yesteryear', 'admin', 'YToyOntzOjY6ImNvbG9ycyI7YToyMDp7czoyNToidGhlbWVfaGVhZGVyX2JnX2NvbG9yX3RvcCI7czo2OiIxYTRkODAiO3M6Mjg6InRoZW1lX2hlYWRlcl9iZ19jb2xvcl9ib3R0b20iO3M6NjoiMWE0ZDgwIjtzOjIzOiJ0aGVtZV9oZWFkZXJfdGV4dF9jb2xvciI7czo2OiJmZmZmZmYiO3M6Mzc6InRoZW1lX25hdmlnYXRpb25fYmFja2dyb3VuZF9jb2xvcl90b3AiO3M6NjoiMjE2MmEzIjtzOjQwOiJ0aGVtZV9uYXZpZ2F0aW9uX2JhY2tncm91bmRfY29sb3JfYm90dG9tIjtzOjY6IjIxNjJhMyI7czoyNzoidGhlbWVfbmF2aWdhdGlvbl90ZXh0X2NvbG9yIjtzOjY6ImZmZmZmZiI7czozMzoidGhlbWVfbmF2aWdhdGlvbl90ZXh0X2hvdmVyX2NvbG9yIjtzOjY6IjAwMDAwMCI7czozMjoidGhlbWVfc3VibmF2aWdhdGlvbl9iZ19jb2xvcl90b3AiO3M6NjoiZTlmMGZlIjtzOjM1OiJ0aGVtZV9zdWJuYXZpZ2F0aW9uX2JnX2NvbG9yX2JvdHRvbSI7czo2OiJlOWYwZmUiO3M6MzA6InRoZW1lX3N1Ym5hdmlnYXRpb25fdGV4dF9jb2xvciI7czo2OiIzZDNjM2QiO3M6Mzc6InRoZW1lX3N1Ym5hdmlnYXRpb25fdGV4dF9hY3RpdmVfY29sb3IiO3M6NjoiMDAwMDAwIjtzOjMzOiJ0aGVtZV93aWRnZXRfaGVhZGluZ19iZ19jb2xvcl90b3AiO3M6NjoiZTBlMGUwIjtzOjM2OiJ0aGVtZV93aWRnZXRfaGVhZGluZ19iZ19jb2xvcl9ib3R0b20iO3M6NjoiZTBlMGUwIjtzOjM4OiJ0aGVtZV93aWRnZXRfaWNvbl9oZWFkaW5nX2JnX2NvbG9yX3RvcCI7czo2OiJkOWQ1ZDkiO3M6NDE6InRoZW1lX3dpZGdldF9pY29uX2hlYWRpbmdfYmdfY29sb3JfYm90dG9tIjtzOjY6ImQ5ZDVkOSI7czoyMDoidGhlbWVfYm94X3RleHRfY29sb3IiO3M6NjoiMDAwMDAwIjtzOjE3OiJ0aGVtZV90ZXh0X3NoYWRvdyI7czo2OiJiYWJhYmEiO3M6MjQ6InRoZW1lX2FjdGlvbnNfdGV4dF9jb2xvciI7czo2OiIyMDJmNjAiO3M6MjQ6InRoZW1lX2hpZ2hsaWdodF9iZ19jb2xvciI7czo2OiJlOWYwZmUiO3M6MjI6InRoZW1lX2JveF9zaGFkb3dfY29sb3IiO3M6NjoiYmZiZmJmIjt9czo4OiJsb2dvX3VybCI7czowOiIiO30='),
(10, 1, 'Galactic', 'admin', 'YToyOntzOjY6ImNvbG9ycyI7YToyMDp7czoyNToidGhlbWVfaGVhZGVyX2JnX2NvbG9yX3RvcCI7czo2OiIxZjFmMWYiO3M6Mjg6InRoZW1lX2hlYWRlcl9iZ19jb2xvcl9ib3R0b20iO3M6NjoiMzAzMDMwIjtzOjIzOiJ0aGVtZV9oZWFkZXJfdGV4dF9jb2xvciI7czo2OiJmMGYwZjAiO3M6Mzc6InRoZW1lX25hdmlnYXRpb25fYmFja2dyb3VuZF9jb2xvcl90b3AiO3M6NjoiYzljN2M5IjtzOjQwOiJ0aGVtZV9uYXZpZ2F0aW9uX2JhY2tncm91bmRfY29sb3JfYm90dG9tIjtzOjY6ImJhYjZiYSI7czoyNzoidGhlbWVfbmF2aWdhdGlvbl90ZXh0X2NvbG9yIjtzOjY6ImYwZjBmMCI7czozMzoidGhlbWVfbmF2aWdhdGlvbl90ZXh0X2hvdmVyX2NvbG9yIjtzOjY6ImZmZmZmZiI7czozMjoidGhlbWVfc3VibmF2aWdhdGlvbl9iZ19jb2xvcl90b3AiO3M6NjoiZDY0MDAwIjtzOjM1OiJ0aGVtZV9zdWJuYXZpZ2F0aW9uX2JnX2NvbG9yX2JvdHRvbSI7czo2OiJmMDQ4MDAiO3M6MzA6InRoZW1lX3N1Ym5hdmlnYXRpb25fdGV4dF9jb2xvciI7czo2OiJmYWFkOGMiO3M6Mzc6InRoZW1lX3N1Ym5hdmlnYXRpb25fdGV4dF9hY3RpdmVfY29sb3IiO3M6NjoiZjdjZWJjIjtzOjMzOiJ0aGVtZV93aWRnZXRfaGVhZGluZ19iZ19jb2xvcl90b3AiO3M6NjoiMzAzMDMwIjtzOjM2OiJ0aGVtZV93aWRnZXRfaGVhZGluZ19iZ19jb2xvcl9ib3R0b20iO3M6NjoiMWYxZjFmIjtzOjM4OiJ0aGVtZV93aWRnZXRfaWNvbl9oZWFkaW5nX2JnX2NvbG9yX3RvcCI7czo2OiIzMDJmMzAiO3M6NDE6InRoZW1lX3dpZGdldF9pY29uX2hlYWRpbmdfYmdfY29sb3JfYm90dG9tIjtzOjY6IjM4MzgzOCI7czoyMDoidGhlbWVfYm94X3RleHRfY29sb3IiO3M6NjoiZjBmMGYwIjtzOjE3OiJ0aGVtZV90ZXh0X3NoYWRvdyI7czo2OiIyNDI0MjQiO3M6MjQ6InRoZW1lX2FjdGlvbnNfdGV4dF9jb2xvciI7czo2OiJkNjQwMDAiO3M6MjQ6InRoZW1lX2hpZ2hsaWdodF9iZ19jb2xvciI7czo2OiJmZmYxZWIiO3M6MjI6InRoZW1lX2JveF9zaGFkb3dfY29sb3IiO3M6NjoiYmZiZmJmIjt9czo4OiJsb2dvX3VybCI7czowOiIiO30='),
(11, 1, 'Sponge', 'admin', 'YToyOntzOjY6ImNvbG9ycyI7YToyMDp7czoyNToidGhlbWVfaGVhZGVyX2JnX2NvbG9yX3RvcCI7czo2OiJhOWNkZDYiO3M6Mjg6InRoZW1lX2hlYWRlcl9iZ19jb2xvcl9ib3R0b20iO3M6NjoiOWJjMmNjIjtzOjIzOiJ0aGVtZV9oZWFkZXJfdGV4dF9jb2xvciI7czo2OiJmZmZmZmYiO3M6Mzc6InRoZW1lX25hdmlnYXRpb25fYmFja2dyb3VuZF9jb2xvcl90b3AiO3M6NjoiYmNhYTkyIjtzOjQwOiJ0aGVtZV9uYXZpZ2F0aW9uX2JhY2tncm91bmRfY29sb3JfYm90dG9tIjtzOjY6ImJhYTg5MCI7czoyNzoidGhlbWVfbmF2aWdhdGlvbl90ZXh0X2NvbG9yIjtzOjY6ImYyZWVlOSI7czozMzoidGhlbWVfbmF2aWdhdGlvbl90ZXh0X2hvdmVyX2NvbG9yIjtzOjY6ImZmZmZmZiI7czozMjoidGhlbWVfc3VibmF2aWdhdGlvbl9iZ19jb2xvcl90b3AiO3M6NjoiNjU2MjU3IjtzOjM1OiJ0aGVtZV9zdWJuYXZpZ2F0aW9uX2JnX2NvbG9yX2JvdHRvbSI7czo2OiI3ODc3NzMiO3M6MzA6InRoZW1lX3N1Ym5hdmlnYXRpb25fdGV4dF9jb2xvciI7czo2OiJiOGI0YTUiO3M6Mzc6InRoZW1lX3N1Ym5hdmlnYXRpb25fdGV4dF9hY3RpdmVfY29sb3IiO3M6NjoiZDFjY2JjIjtzOjMzOiJ0aGVtZV93aWRnZXRfaGVhZGluZ19iZ19jb2xvcl90b3AiO3M6NjoiYTljZGQ2IjtzOjM2OiJ0aGVtZV93aWRnZXRfaGVhZGluZ19iZ19jb2xvcl9ib3R0b20iO3M6NjoiOWZjN2QxIjtzOjM4OiJ0aGVtZV93aWRnZXRfaWNvbl9oZWFkaW5nX2JnX2NvbG9yX3RvcCI7czo2OiI5N2MxY2MiO3M6NDE6InRoZW1lX3dpZGdldF9pY29uX2hlYWRpbmdfYmdfY29sb3JfYm90dG9tIjtzOjY6ImIxZDdlMCI7czoyMDoidGhlbWVfYm94X3RleHRfY29sb3IiO3M6NjoiZmZmZmZmIjtzOjE3OiJ0aGVtZV90ZXh0X3NoYWRvdyI7czo2OiI4MjdmNzIiO3M6MjQ6InRoZW1lX2FjdGlvbnNfdGV4dF9jb2xvciI7czo2OiI2NTYyNTciO3M6MjQ6InRoZW1lX2hpZ2hsaWdodF9iZ19jb2xvciI7czo2OiJlYmZiZmYiO3M6MjI6InRoZW1lX2JveF9zaGFkb3dfY29sb3IiO3M6NjoiYmZiZmJmIjt9czo4OiJsb2dvX3VybCI7czowOiIiO30='),
(13, 1, 'Minegrass', 'client', 'YToyOntzOjY6ImNvbG9ycyI7YTo2MDp7czozMDoidGhlbWVfcHJpbWFyeV9hbGVydF90ZXh0X2NvbG9yIjtzOjY6IjAwNDA4NSI7czozNjoidGhlbWVfcHJpbWFyeV9hbGVydF9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6ImNjZTVmZiI7czozMjoidGhlbWVfcHJpbWFyeV9hbGVydF9ib3JkZXJfY29sb3IiO3M6NjoiYjhkYWZmIjtzOjMyOiJ0aGVtZV9zZWNvbmRhcnlfYWxlcnRfdGV4dF9jb2xvciI7czo2OiIzODNkNDEiO3M6Mzg6InRoZW1lX3NlY29uZGFyeV9hbGVydF9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6ImUyZTNlNSI7czozNDoidGhlbWVfc2Vjb25kYXJ5X2FsZXJ0X2JvcmRlcl9jb2xvciI7czo2OiJkNmQ4ZGIiO3M6MzA6InRoZW1lX3N1Y2Nlc3NfYWxlcnRfdGV4dF9jb2xvciI7czo2OiIxNTU3MjQiO3M6MzY6InRoZW1lX3N1Y2Nlc3NfYWxlcnRfYmFja2dyb3VuZF9jb2xvciI7czo2OiJkNGVkZGEiO3M6MzI6InRoZW1lX3N1Y2Nlc3NfYWxlcnRfYm9yZGVyX2NvbG9yIjtzOjY6ImMzZTZjYiI7czoyNzoidGhlbWVfaW5mb19hbGVydF90ZXh0X2NvbG9yIjtzOjY6IjBjNTQ2MCI7czozMzoidGhlbWVfaW5mb19hbGVydF9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6ImQxZWNmMSI7czoyOToidGhlbWVfaW5mb19hbGVydF9ib3JkZXJfY29sb3IiO3M6NjoiYmVlNWViIjtzOjMwOiJ0aGVtZV93YXJuaW5nX2FsZXJ0X3RleHRfY29sb3IiO3M6NjoiODU2NDA0IjtzOjM2OiJ0aGVtZV93YXJuaW5nX2FsZXJ0X2JhY2tncm91bmRfY29sb3IiO3M6NjoiZmZmM2NkIjtzOjMyOiJ0aGVtZV93YXJuaW5nX2FsZXJ0X2JvcmRlcl9jb2xvciI7czo2OiJmZmVlYmEiO3M6Mjk6InRoZW1lX2Rhbmdlcl9hbGVydF90ZXh0X2NvbG9yIjtzOjY6IjcyMWMyNCI7czozNToidGhlbWVfZGFuZ2VyX2FsZXJ0X2JhY2tncm91bmRfY29sb3IiO3M6NjoiZjhkN2RhIjtzOjMxOiJ0aGVtZV9kYW5nZXJfYWxlcnRfYm9yZGVyX2NvbG9yIjtzOjY6ImY1YzZjYiI7czoyODoidGhlbWVfbGlnaHRfYWxlcnRfdGV4dF9jb2xvciI7czo2OiI4MTgxODIiO3M6MzQ6InRoZW1lX2xpZ2h0X2FsZXJ0X2JhY2tncm91bmRfY29sb3IiO3M6NjoiZmVmZWZlIjtzOjMwOiJ0aGVtZV9saWdodF9hbGVydF9ib3JkZXJfY29sb3IiO3M6NjoiZmRmZGZlIjtzOjMxOiJ0aGVtZV9wcmltYXJ5X2J1dHRvbl90ZXh0X2NvbG9yIjtzOjY6ImZmZmZmZiI7czozNzoidGhlbWVfcHJpbWFyeV9idXR0b25fYmFja2dyb3VuZF9jb2xvciI7czo2OiIwMDdiZmYiO3M6MzI6InRoZW1lX3ByaW1hcnlfYnV0dG9uX2hvdmVyX2NvbG9yIjtzOjY6IjAwNjlkOSI7czozMzoidGhlbWVfc2Vjb25kYXJ5X2J1dHRvbl90ZXh0X2NvbG9yIjtzOjY6ImZmZmZmZiI7czozOToidGhlbWVfc2Vjb25kYXJ5X2J1dHRvbl9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6IjZjNzU3ZCI7czozNDoidGhlbWVfc2Vjb25kYXJ5X2J1dHRvbl9ob3Zlcl9jb2xvciI7czo2OiI1YTYyNjgiO3M6MzE6InRoZW1lX3N1Y2Nlc3NfYnV0dG9uX3RleHRfY29sb3IiO3M6NjoiZmZmZmZmIjtzOjM3OiJ0aGVtZV9zdWNjZXNzX2J1dHRvbl9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6IjI4YTc0NSI7czozMjoidGhlbWVfc3VjY2Vzc19idXR0b25faG92ZXJfY29sb3IiO3M6NjoiMjE4ODM4IjtzOjI4OiJ0aGVtZV9pbmZvX2J1dHRvbl90ZXh0X2NvbG9yIjtzOjY6ImZmZmZmZiI7czozNDoidGhlbWVfaW5mb19idXR0b25fYmFja2dyb3VuZF9jb2xvciI7czo2OiIxN2EyYjgiO3M6Mjk6InRoZW1lX2luZm9fYnV0dG9uX2hvdmVyX2NvbG9yIjtzOjY6IjEzODQ5NiI7czozMToidGhlbWVfd2FybmluZ19idXR0b25fdGV4dF9jb2xvciI7czo2OiIyMTI1MjkiO3M6Mzc6InRoZW1lX3dhcm5pbmdfYnV0dG9uX2JhY2tncm91bmRfY29sb3IiO3M6NjoiZmZjMTA3IjtzOjMyOiJ0aGVtZV93YXJuaW5nX2J1dHRvbl9ob3Zlcl9jb2xvciI7czo2OiJlMGE4MDAiO3M6MzA6InRoZW1lX2Rhbmdlcl9idXR0b25fdGV4dF9jb2xvciI7czo2OiJmZmZmZmYiO3M6MzY6InRoZW1lX2Rhbmdlcl9idXR0b25fYmFja2dyb3VuZF9jb2xvciI7czo2OiJkYzM1NDUiO3M6MzE6InRoZW1lX2Rhbmdlcl9idXR0b25faG92ZXJfY29sb3IiO3M6NjoiYzgyMzMzIjtzOjI5OiJ0aGVtZV9saWdodF9idXR0b25fdGV4dF9jb2xvciI7czo2OiIyMTI1MjkiO3M6MzU6InRoZW1lX2xpZ2h0X2J1dHRvbl9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6ImZmZmZmZiI7czozMDoidGhlbWVfbGlnaHRfYnV0dG9uX2hvdmVyX2NvbG9yIjtzOjY6ImUyZTZlYSI7czoyNToidGhlbWVfaGVhZGVyX2JnX2NvbG9yX3RvcCI7czo2OiIzZDZjMjAiO3M6Mjg6InRoZW1lX2hlYWRlcl9iZ19jb2xvcl9ib3R0b20iO3M6NjoiNmM5YTNmIjtzOjM3OiJ0aGVtZV9wYWdlX3RpdGxlX2JhY2tncm91bmRfY29sb3JfdG9wIjtzOjY6IjUyMzkyMiI7czo0MDoidGhlbWVfcGFnZV90aXRsZV9iYWNrZ3JvdW5kX2NvbG9yX2JvdHRvbSI7czo2OiIzZDI4MTUiO3M6Mjc6InRoZW1lX3BhZ2VfdGl0bGVfdGV4dF9jb2xvciI7czo2OiJmZmZmZmYiO3M6Mzc6InRoZW1lX25hdmlnYXRpb25fYmFja2dyb3VuZF9jb2xvcl90b3AiO3M6NjoiMzMxZjBlIjtzOjQwOiJ0aGVtZV9uYXZpZ2F0aW9uX2JhY2tncm91bmRfY29sb3JfYm90dG9tIjtzOjY6IjYxNDYyZSI7czoyNzoidGhlbWVfbmF2aWdhdGlvbl90ZXh0X2NvbG9yIjtzOjY6ImUwY2VjMCI7czozNDoidGhlbWVfbmF2aWdhdGlvbl90ZXh0X2FjdGl2ZV9jb2xvciI7czo2OiJlOGUzZGYiO3M6Mjc6InRoZW1lX3BhZ2VfYmFja2dyb3VuZF9jb2xvciI7czo2OiJmNWYyZjAiO3M6Mzk6InRoZW1lX3BhbmVsX2hlYWRlcl9iYWNrZ3JvdW5kX2NvbG9yX3RvcCI7czo2OiI2YzlhM2YiO3M6NDI6InRoZW1lX3BhbmVsX2hlYWRlcl9iYWNrZ3JvdW5kX2NvbG9yX2JvdHRvbSI7czo2OiIzZDZjMjAiO3M6Mjk6InRoZW1lX3BhbmVsX2hlYWRlcl90ZXh0X2NvbG9yIjtzOjY6ImZmZmZmZiI7czoxNjoidGhlbWVfbGlua19jb2xvciI7czo2OiI2YzlhM2YiO3M6MjU6InRoZW1lX2xpbmtfc2V0dGluZ3NfY29sb3IiO3M6NjoiNmM5YTNmIjtzOjI3OiJ0aGVtZV9oaWdobGlnaHRfaG92ZXJfY29sb3IiO3M6NjoiZDdlNmM4IjtzOjQxOiJ0aGVtZV9oaWdobGlnaHRfbmF2aWdhdGlvbl90ZXh0X2NvbG9yX3RvcCI7czo2OiJlZmVmZWYiO3M6NDc6InRoZW1lX2hpZ2hsaWdodF9uYXZpZ2F0aW9uX2hvdmVyX3RleHRfY29sb3JfdG9wIjtzOjY6ImZmZmZmZiI7fXM6ODoibG9nb191cmwiO3M6MDoiIjt9'),
(14, 1, 'Cloudy Day', 'client', 'YToyOntzOjY6ImNvbG9ycyI7YTo2MDp7czozMDoidGhlbWVfcHJpbWFyeV9hbGVydF90ZXh0X2NvbG9yIjtzOjY6IjAwNDA4NSI7czozNjoidGhlbWVfcHJpbWFyeV9hbGVydF9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6ImNjZTVmZiI7czozMjoidGhlbWVfcHJpbWFyeV9hbGVydF9ib3JkZXJfY29sb3IiO3M6NjoiYjhkYWZmIjtzOjMyOiJ0aGVtZV9zZWNvbmRhcnlfYWxlcnRfdGV4dF9jb2xvciI7czo2OiIzODNkNDEiO3M6Mzg6InRoZW1lX3NlY29uZGFyeV9hbGVydF9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6ImUyZTNlNSI7czozNDoidGhlbWVfc2Vjb25kYXJ5X2FsZXJ0X2JvcmRlcl9jb2xvciI7czo2OiJkNmQ4ZGIiO3M6MzA6InRoZW1lX3N1Y2Nlc3NfYWxlcnRfdGV4dF9jb2xvciI7czo2OiIxNTU3MjQiO3M6MzY6InRoZW1lX3N1Y2Nlc3NfYWxlcnRfYmFja2dyb3VuZF9jb2xvciI7czo2OiJkNGVkZGEiO3M6MzI6InRoZW1lX3N1Y2Nlc3NfYWxlcnRfYm9yZGVyX2NvbG9yIjtzOjY6ImMzZTZjYiI7czoyNzoidGhlbWVfaW5mb19hbGVydF90ZXh0X2NvbG9yIjtzOjY6IjBjNTQ2MCI7czozMzoidGhlbWVfaW5mb19hbGVydF9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6ImQxZWNmMSI7czoyOToidGhlbWVfaW5mb19hbGVydF9ib3JkZXJfY29sb3IiO3M6NjoiYmVlNWViIjtzOjMwOiJ0aGVtZV93YXJuaW5nX2FsZXJ0X3RleHRfY29sb3IiO3M6NjoiODU2NDA0IjtzOjM2OiJ0aGVtZV93YXJuaW5nX2FsZXJ0X2JhY2tncm91bmRfY29sb3IiO3M6NjoiZmZmM2NkIjtzOjMyOiJ0aGVtZV93YXJuaW5nX2FsZXJ0X2JvcmRlcl9jb2xvciI7czo2OiJmZmVlYmEiO3M6Mjk6InRoZW1lX2Rhbmdlcl9hbGVydF90ZXh0X2NvbG9yIjtzOjY6IjcyMWMyNCI7czozNToidGhlbWVfZGFuZ2VyX2FsZXJ0X2JhY2tncm91bmRfY29sb3IiO3M6NjoiZjhkN2RhIjtzOjMxOiJ0aGVtZV9kYW5nZXJfYWxlcnRfYm9yZGVyX2NvbG9yIjtzOjY6ImY1YzZjYiI7czoyODoidGhlbWVfbGlnaHRfYWxlcnRfdGV4dF9jb2xvciI7czo2OiI4MTgxODIiO3M6MzQ6InRoZW1lX2xpZ2h0X2FsZXJ0X2JhY2tncm91bmRfY29sb3IiO3M6NjoiZmVmZWZlIjtzOjMwOiJ0aGVtZV9saWdodF9hbGVydF9ib3JkZXJfY29sb3IiO3M6NjoiZmRmZGZlIjtzOjMxOiJ0aGVtZV9wcmltYXJ5X2J1dHRvbl90ZXh0X2NvbG9yIjtzOjY6ImZmZmZmZiI7czozNzoidGhlbWVfcHJpbWFyeV9idXR0b25fYmFja2dyb3VuZF9jb2xvciI7czo2OiIwMDdiZmYiO3M6MzI6InRoZW1lX3ByaW1hcnlfYnV0dG9uX2hvdmVyX2NvbG9yIjtzOjY6IjAwNjlkOSI7czozMzoidGhlbWVfc2Vjb25kYXJ5X2J1dHRvbl90ZXh0X2NvbG9yIjtzOjY6ImZmZmZmZiI7czozOToidGhlbWVfc2Vjb25kYXJ5X2J1dHRvbl9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6IjZjNzU3ZCI7czozNDoidGhlbWVfc2Vjb25kYXJ5X2J1dHRvbl9ob3Zlcl9jb2xvciI7czo2OiI1YTYyNjgiO3M6MzE6InRoZW1lX3N1Y2Nlc3NfYnV0dG9uX3RleHRfY29sb3IiO3M6NjoiZmZmZmZmIjtzOjM3OiJ0aGVtZV9zdWNjZXNzX2J1dHRvbl9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6IjI4YTc0NSI7czozMjoidGhlbWVfc3VjY2Vzc19idXR0b25faG92ZXJfY29sb3IiO3M6NjoiMjE4ODM4IjtzOjI4OiJ0aGVtZV9pbmZvX2J1dHRvbl90ZXh0X2NvbG9yIjtzOjY6ImZmZmZmZiI7czozNDoidGhlbWVfaW5mb19idXR0b25fYmFja2dyb3VuZF9jb2xvciI7czo2OiIxN2EyYjgiO3M6Mjk6InRoZW1lX2luZm9fYnV0dG9uX2hvdmVyX2NvbG9yIjtzOjY6IjEzODQ5NiI7czozMToidGhlbWVfd2FybmluZ19idXR0b25fdGV4dF9jb2xvciI7czo2OiIyMTI1MjkiO3M6Mzc6InRoZW1lX3dhcm5pbmdfYnV0dG9uX2JhY2tncm91bmRfY29sb3IiO3M6NjoiZmZjMTA3IjtzOjMyOiJ0aGVtZV93YXJuaW5nX2J1dHRvbl9ob3Zlcl9jb2xvciI7czo2OiJlMGE4MDAiO3M6MzA6InRoZW1lX2Rhbmdlcl9idXR0b25fdGV4dF9jb2xvciI7czo2OiJmZmZmZmYiO3M6MzY6InRoZW1lX2Rhbmdlcl9idXR0b25fYmFja2dyb3VuZF9jb2xvciI7czo2OiJkYzM1NDUiO3M6MzE6InRoZW1lX2Rhbmdlcl9idXR0b25faG92ZXJfY29sb3IiO3M6NjoiYzgyMzMzIjtzOjI5OiJ0aGVtZV9saWdodF9idXR0b25fdGV4dF9jb2xvciI7czo2OiIyMTI1MjkiO3M6MzU6InRoZW1lX2xpZ2h0X2J1dHRvbl9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6ImZmZmZmZiI7czozMDoidGhlbWVfbGlnaHRfYnV0dG9uX2hvdmVyX2NvbG9yIjtzOjY6ImUyZTZlYSI7czoyNToidGhlbWVfaGVhZGVyX2JnX2NvbG9yX3RvcCI7czo2OiJiNmI1YWUiO3M6Mjg6InRoZW1lX2hlYWRlcl9iZ19jb2xvcl9ib3R0b20iO3M6NjoiYjZiNWFlIjtzOjM3OiJ0aGVtZV9wYWdlX3RpdGxlX2JhY2tncm91bmRfY29sb3JfdG9wIjtzOjY6ImM5YzhjMSI7czo0MDoidGhlbWVfcGFnZV90aXRsZV9iYWNrZ3JvdW5kX2NvbG9yX2JvdHRvbSI7czo2OiJkOWQ4ZDAiO3M6Mjc6InRoZW1lX3BhZ2VfdGl0bGVfdGV4dF9jb2xvciI7czo2OiI2ZTZkNjgiO3M6Mzc6InRoZW1lX25hdmlnYXRpb25fYmFja2dyb3VuZF9jb2xvcl90b3AiO3M6NjoiYzljOGMxIjtzOjQwOiJ0aGVtZV9uYXZpZ2F0aW9uX2JhY2tncm91bmRfY29sb3JfYm90dG9tIjtzOjY6ImQ5ZDhkMCI7czoyNzoidGhlbWVfbmF2aWdhdGlvbl90ZXh0X2NvbG9yIjtzOjY6IjhmOGU4OSI7czozNDoidGhlbWVfbmF2aWdhdGlvbl90ZXh0X2FjdGl2ZV9jb2xvciI7czo2OiI2ZTZkNjgiO3M6Mjc6InRoZW1lX3BhZ2VfYmFja2dyb3VuZF9jb2xvciI7czo2OiJmNWY1ZjIiO3M6Mzk6InRoZW1lX3BhbmVsX2hlYWRlcl9iYWNrZ3JvdW5kX2NvbG9yX3RvcCI7czo2OiJjOWM4YzEiO3M6NDI6InRoZW1lX3BhbmVsX2hlYWRlcl9iYWNrZ3JvdW5kX2NvbG9yX2JvdHRvbSI7czo2OiJjOWM4YzEiO3M6Mjk6InRoZW1lX3BhbmVsX2hlYWRlcl90ZXh0X2NvbG9yIjtzOjY6IjZlNmQ2OCI7czoxNjoidGhlbWVfbGlua19jb2xvciI7czo2OiI2ZTZkNjgiO3M6MjU6InRoZW1lX2xpbmtfc2V0dGluZ3NfY29sb3IiO3M6NjoiNmU2ZDY4IjtzOjI3OiJ0aGVtZV9oaWdobGlnaHRfaG92ZXJfY29sb3IiO3M6NjoiZTZlNmU2IjtzOjQxOiJ0aGVtZV9oaWdobGlnaHRfbmF2aWdhdGlvbl90ZXh0X2NvbG9yX3RvcCI7czo2OiI0ZjRmNGYiO3M6NDc6InRoZW1lX2hpZ2hsaWdodF9uYXZpZ2F0aW9uX2hvdmVyX3RleHRfY29sb3JfdG9wIjtzOjY6IjJmMmYyZiI7fXM6ODoibG9nb191cmwiO3M6MDoiIjt9'),
(15, 1, 'Vintage', 'client', 'YToyOntzOjY6ImNvbG9ycyI7YTo2MDp7czozMDoidGhlbWVfcHJpbWFyeV9hbGVydF90ZXh0X2NvbG9yIjtzOjY6IjAwNDA4NSI7czozNjoidGhlbWVfcHJpbWFyeV9hbGVydF9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6ImNjZTVmZiI7czozMjoidGhlbWVfcHJpbWFyeV9hbGVydF9ib3JkZXJfY29sb3IiO3M6NjoiYjhkYWZmIjtzOjMyOiJ0aGVtZV9zZWNvbmRhcnlfYWxlcnRfdGV4dF9jb2xvciI7czo2OiIzODNkNDEiO3M6Mzg6InRoZW1lX3NlY29uZGFyeV9hbGVydF9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6ImUyZTNlNSI7czozNDoidGhlbWVfc2Vjb25kYXJ5X2FsZXJ0X2JvcmRlcl9jb2xvciI7czo2OiJkNmQ4ZGIiO3M6MzA6InRoZW1lX3N1Y2Nlc3NfYWxlcnRfdGV4dF9jb2xvciI7czo2OiIxNTU3MjQiO3M6MzY6InRoZW1lX3N1Y2Nlc3NfYWxlcnRfYmFja2dyb3VuZF9jb2xvciI7czo2OiJkNGVkZGEiO3M6MzI6InRoZW1lX3N1Y2Nlc3NfYWxlcnRfYm9yZGVyX2NvbG9yIjtzOjY6ImMzZTZjYiI7czoyNzoidGhlbWVfaW5mb19hbGVydF90ZXh0X2NvbG9yIjtzOjY6IjBjNTQ2MCI7czozMzoidGhlbWVfaW5mb19hbGVydF9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6ImQxZWNmMSI7czoyOToidGhlbWVfaW5mb19hbGVydF9ib3JkZXJfY29sb3IiO3M6NjoiYmVlNWViIjtzOjMwOiJ0aGVtZV93YXJuaW5nX2FsZXJ0X3RleHRfY29sb3IiO3M6NjoiODU2NDA0IjtzOjM2OiJ0aGVtZV93YXJuaW5nX2FsZXJ0X2JhY2tncm91bmRfY29sb3IiO3M6NjoiZmZmM2NkIjtzOjMyOiJ0aGVtZV93YXJuaW5nX2FsZXJ0X2JvcmRlcl9jb2xvciI7czo2OiJmZmVlYmEiO3M6Mjk6InRoZW1lX2Rhbmdlcl9hbGVydF90ZXh0X2NvbG9yIjtzOjY6IjcyMWMyNCI7czozNToidGhlbWVfZGFuZ2VyX2FsZXJ0X2JhY2tncm91bmRfY29sb3IiO3M6NjoiZjhkN2RhIjtzOjMxOiJ0aGVtZV9kYW5nZXJfYWxlcnRfYm9yZGVyX2NvbG9yIjtzOjY6ImY1YzZjYiI7czoyODoidGhlbWVfbGlnaHRfYWxlcnRfdGV4dF9jb2xvciI7czo2OiI4MTgxODIiO3M6MzQ6InRoZW1lX2xpZ2h0X2FsZXJ0X2JhY2tncm91bmRfY29sb3IiO3M6NjoiZmVmZWZlIjtzOjMwOiJ0aGVtZV9saWdodF9hbGVydF9ib3JkZXJfY29sb3IiO3M6NjoiZmRmZGZlIjtzOjMxOiJ0aGVtZV9wcmltYXJ5X2J1dHRvbl90ZXh0X2NvbG9yIjtzOjY6ImZmZmZmZiI7czozNzoidGhlbWVfcHJpbWFyeV9idXR0b25fYmFja2dyb3VuZF9jb2xvciI7czo2OiIwMDdiZmYiO3M6MzI6InRoZW1lX3ByaW1hcnlfYnV0dG9uX2hvdmVyX2NvbG9yIjtzOjY6IjAwNjlkOSI7czozMzoidGhlbWVfc2Vjb25kYXJ5X2J1dHRvbl90ZXh0X2NvbG9yIjtzOjY6ImZmZmZmZiI7czozOToidGhlbWVfc2Vjb25kYXJ5X2J1dHRvbl9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6IjZjNzU3ZCI7czozNDoidGhlbWVfc2Vjb25kYXJ5X2J1dHRvbl9ob3Zlcl9jb2xvciI7czo2OiI1YTYyNjgiO3M6MzE6InRoZW1lX3N1Y2Nlc3NfYnV0dG9uX3RleHRfY29sb3IiO3M6NjoiZmZmZmZmIjtzOjM3OiJ0aGVtZV9zdWNjZXNzX2J1dHRvbl9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6IjI4YTc0NSI7czozMjoidGhlbWVfc3VjY2Vzc19idXR0b25faG92ZXJfY29sb3IiO3M6NjoiMjE4ODM4IjtzOjI4OiJ0aGVtZV9pbmZvX2J1dHRvbl90ZXh0X2NvbG9yIjtzOjY6ImZmZmZmZiI7czozNDoidGhlbWVfaW5mb19idXR0b25fYmFja2dyb3VuZF9jb2xvciI7czo2OiIxN2EyYjgiO3M6Mjk6InRoZW1lX2luZm9fYnV0dG9uX2hvdmVyX2NvbG9yIjtzOjY6IjEzODQ5NiI7czozMToidGhlbWVfd2FybmluZ19idXR0b25fdGV4dF9jb2xvciI7czo2OiIyMTI1MjkiO3M6Mzc6InRoZW1lX3dhcm5pbmdfYnV0dG9uX2JhY2tncm91bmRfY29sb3IiO3M6NjoiZmZjMTA3IjtzOjMyOiJ0aGVtZV93YXJuaW5nX2J1dHRvbl9ob3Zlcl9jb2xvciI7czo2OiJlMGE4MDAiO3M6MzA6InRoZW1lX2Rhbmdlcl9idXR0b25fdGV4dF9jb2xvciI7czo2OiJmZmZmZmYiO3M6MzY6InRoZW1lX2Rhbmdlcl9idXR0b25fYmFja2dyb3VuZF9jb2xvciI7czo2OiJkYzM1NDUiO3M6MzE6InRoZW1lX2Rhbmdlcl9idXR0b25faG92ZXJfY29sb3IiO3M6NjoiYzgyMzMzIjtzOjI5OiJ0aGVtZV9saWdodF9idXR0b25fdGV4dF9jb2xvciI7czo2OiIyMTI1MjkiO3M6MzU6InRoZW1lX2xpZ2h0X2J1dHRvbl9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6ImZmZmZmZiI7czozMDoidGhlbWVfbGlnaHRfYnV0dG9uX2hvdmVyX2NvbG9yIjtzOjY6ImUyZTZlYSI7czoyNToidGhlbWVfaGVhZGVyX2JnX2NvbG9yX3RvcCI7czo2OiJhMzJjMjgiO3M6Mjg6InRoZW1lX2hlYWRlcl9iZ19jb2xvcl9ib3R0b20iO3M6NjoiYTMyYzI4IjtzOjM3OiJ0aGVtZV9wYWdlX3RpdGxlX2JhY2tncm91bmRfY29sb3JfdG9wIjtzOjY6ImJjYTg3NSI7czo0MDoidGhlbWVfcGFnZV90aXRsZV9iYWNrZ3JvdW5kX2NvbG9yX2JvdHRvbSI7czo2OiJhZDk4NjIiO3M6Mjc6InRoZW1lX3BhZ2VfdGl0bGVfdGV4dF9jb2xvciI7czo2OiJmZmZjZjUiO3M6Mzc6InRoZW1lX25hdmlnYXRpb25fYmFja2dyb3VuZF9jb2xvcl90b3AiO3M6NjoiOTQ4MDRkIjtzOjQwOiJ0aGVtZV9uYXZpZ2F0aW9uX2JhY2tncm91bmRfY29sb3JfYm90dG9tIjtzOjY6ImJjYTg3NSI7czoyNzoidGhlbWVfbmF2aWdhdGlvbl90ZXh0X2NvbG9yIjtzOjY6ImYwZTlkOCI7czozNDoidGhlbWVfbmF2aWdhdGlvbl90ZXh0X2FjdGl2ZV9jb2xvciI7czo2OiJmZmZjZjUiO3M6Mjc6InRoZW1lX3BhZ2VfYmFja2dyb3VuZF9jb2xvciI7czo2OiJmYWY3ZjAiO3M6Mzk6InRoZW1lX3BhbmVsX2hlYWRlcl9iYWNrZ3JvdW5kX2NvbG9yX3RvcCI7czo2OiJhMzJjMjgiO3M6NDI6InRoZW1lX3BhbmVsX2hlYWRlcl9iYWNrZ3JvdW5kX2NvbG9yX2JvdHRvbSI7czo2OiJhMzJjMjgiO3M6Mjk6InRoZW1lX3BhbmVsX2hlYWRlcl90ZXh0X2NvbG9yIjtzOjY6ImZmZmNmNSI7czoxNjoidGhlbWVfbGlua19jb2xvciI7czo2OiIxYzA5MGIiO3M6MjU6InRoZW1lX2xpbmtfc2V0dGluZ3NfY29sb3IiO3M6NjoiMWMwOTBiIjtzOjI3OiJ0aGVtZV9oaWdobGlnaHRfaG92ZXJfY29sb3IiO3M6NjoiZWRlNGNlIjtzOjQxOiJ0aGVtZV9oaWdobGlnaHRfbmF2aWdhdGlvbl90ZXh0X2NvbG9yX3RvcCI7czo2OiJlZmVmZWYiO3M6NDc6InRoZW1lX2hpZ2hsaWdodF9uYXZpZ2F0aW9uX2hvdmVyX3RleHRfY29sb3JfdG9wIjtzOjY6ImZmZmZmZiI7fXM6ODoibG9nb191cmwiO3M6MDoiIjt9'),
(16, 1, 'Clean', 'client', 'YToyOntzOjY6ImNvbG9ycyI7YTo2MDp7czozMDoidGhlbWVfcHJpbWFyeV9hbGVydF90ZXh0X2NvbG9yIjtzOjY6IjAwNDA4NSI7czozNjoidGhlbWVfcHJpbWFyeV9hbGVydF9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6ImNjZTVmZiI7czozMjoidGhlbWVfcHJpbWFyeV9hbGVydF9ib3JkZXJfY29sb3IiO3M6NjoiYjhkYWZmIjtzOjMyOiJ0aGVtZV9zZWNvbmRhcnlfYWxlcnRfdGV4dF9jb2xvciI7czo2OiIzODNkNDEiO3M6Mzg6InRoZW1lX3NlY29uZGFyeV9hbGVydF9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6ImUyZTNlNSI7czozNDoidGhlbWVfc2Vjb25kYXJ5X2FsZXJ0X2JvcmRlcl9jb2xvciI7czo2OiJkNmQ4ZGIiO3M6MzA6InRoZW1lX3N1Y2Nlc3NfYWxlcnRfdGV4dF9jb2xvciI7czo2OiIxNTU3MjQiO3M6MzY6InRoZW1lX3N1Y2Nlc3NfYWxlcnRfYmFja2dyb3VuZF9jb2xvciI7czo2OiJkNGVkZGEiO3M6MzI6InRoZW1lX3N1Y2Nlc3NfYWxlcnRfYm9yZGVyX2NvbG9yIjtzOjY6ImMzZTZjYiI7czoyNzoidGhlbWVfaW5mb19hbGVydF90ZXh0X2NvbG9yIjtzOjY6IjBjNTQ2MCI7czozMzoidGhlbWVfaW5mb19hbGVydF9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6ImQxZWNmMSI7czoyOToidGhlbWVfaW5mb19hbGVydF9ib3JkZXJfY29sb3IiO3M6NjoiYmVlNWViIjtzOjMwOiJ0aGVtZV93YXJuaW5nX2FsZXJ0X3RleHRfY29sb3IiO3M6NjoiODU2NDA0IjtzOjM2OiJ0aGVtZV93YXJuaW5nX2FsZXJ0X2JhY2tncm91bmRfY29sb3IiO3M6NjoiZmZmM2NkIjtzOjMyOiJ0aGVtZV93YXJuaW5nX2FsZXJ0X2JvcmRlcl9jb2xvciI7czo2OiJmZmVlYmEiO3M6Mjk6InRoZW1lX2Rhbmdlcl9hbGVydF90ZXh0X2NvbG9yIjtzOjY6IjcyMWMyNCI7czozNToidGhlbWVfZGFuZ2VyX2FsZXJ0X2JhY2tncm91bmRfY29sb3IiO3M6NjoiZjhkN2RhIjtzOjMxOiJ0aGVtZV9kYW5nZXJfYWxlcnRfYm9yZGVyX2NvbG9yIjtzOjY6ImY1YzZjYiI7czoyODoidGhlbWVfbGlnaHRfYWxlcnRfdGV4dF9jb2xvciI7czo2OiI4MTgxODIiO3M6MzQ6InRoZW1lX2xpZ2h0X2FsZXJ0X2JhY2tncm91bmRfY29sb3IiO3M6NjoiZmVmZWZlIjtzOjMwOiJ0aGVtZV9saWdodF9hbGVydF9ib3JkZXJfY29sb3IiO3M6NjoiZmRmZGZlIjtzOjMxOiJ0aGVtZV9wcmltYXJ5X2J1dHRvbl90ZXh0X2NvbG9yIjtzOjY6ImZmZmZmZiI7czozNzoidGhlbWVfcHJpbWFyeV9idXR0b25fYmFja2dyb3VuZF9jb2xvciI7czo2OiIwMDdiZmYiO3M6MzI6InRoZW1lX3ByaW1hcnlfYnV0dG9uX2hvdmVyX2NvbG9yIjtzOjY6IjAwNjlkOSI7czozMzoidGhlbWVfc2Vjb25kYXJ5X2J1dHRvbl90ZXh0X2NvbG9yIjtzOjY6ImZmZmZmZiI7czozOToidGhlbWVfc2Vjb25kYXJ5X2J1dHRvbl9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6IjZjNzU3ZCI7czozNDoidGhlbWVfc2Vjb25kYXJ5X2J1dHRvbl9ob3Zlcl9jb2xvciI7czo2OiI1YTYyNjgiO3M6MzE6InRoZW1lX3N1Y2Nlc3NfYnV0dG9uX3RleHRfY29sb3IiO3M6NjoiZmZmZmZmIjtzOjM3OiJ0aGVtZV9zdWNjZXNzX2J1dHRvbl9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6IjI4YTc0NSI7czozMjoidGhlbWVfc3VjY2Vzc19idXR0b25faG92ZXJfY29sb3IiO3M6NjoiMjE4ODM4IjtzOjI4OiJ0aGVtZV9pbmZvX2J1dHRvbl90ZXh0X2NvbG9yIjtzOjY6ImZmZmZmZiI7czozNDoidGhlbWVfaW5mb19idXR0b25fYmFja2dyb3VuZF9jb2xvciI7czo2OiIxN2EyYjgiO3M6Mjk6InRoZW1lX2luZm9fYnV0dG9uX2hvdmVyX2NvbG9yIjtzOjY6IjEzODQ5NiI7czozMToidGhlbWVfd2FybmluZ19idXR0b25fdGV4dF9jb2xvciI7czo2OiIyMTI1MjkiO3M6Mzc6InRoZW1lX3dhcm5pbmdfYnV0dG9uX2JhY2tncm91bmRfY29sb3IiO3M6NjoiZmZjMTA3IjtzOjMyOiJ0aGVtZV93YXJuaW5nX2J1dHRvbl9ob3Zlcl9jb2xvciI7czo2OiJlMGE4MDAiO3M6MzA6InRoZW1lX2Rhbmdlcl9idXR0b25fdGV4dF9jb2xvciI7czo2OiJmZmZmZmYiO3M6MzY6InRoZW1lX2Rhbmdlcl9idXR0b25fYmFja2dyb3VuZF9jb2xvciI7czo2OiJkYzM1NDUiO3M6MzE6InRoZW1lX2Rhbmdlcl9idXR0b25faG92ZXJfY29sb3IiO3M6NjoiYzgyMzMzIjtzOjI5OiJ0aGVtZV9saWdodF9idXR0b25fdGV4dF9jb2xvciI7czo2OiIyMTI1MjkiO3M6MzU6InRoZW1lX2xpZ2h0X2J1dHRvbl9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6ImZmZmZmZiI7czozMDoidGhlbWVfbGlnaHRfYnV0dG9uX2hvdmVyX2NvbG9yIjtzOjY6ImUyZTZlYSI7czoyNToidGhlbWVfaGVhZGVyX2JnX2NvbG9yX3RvcCI7czo2OiJmZmZmZmYiO3M6Mjg6InRoZW1lX2hlYWRlcl9iZ19jb2xvcl9ib3R0b20iO3M6NjoiZmZmZmZmIjtzOjM3OiJ0aGVtZV9wYWdlX3RpdGxlX2JhY2tncm91bmRfY29sb3JfdG9wIjtzOjY6ImY1ZjVmNSI7czo0MDoidGhlbWVfcGFnZV90aXRsZV9iYWNrZ3JvdW5kX2NvbG9yX2JvdHRvbSI7czo2OiJmNWY1ZjUiO3M6Mjc6InRoZW1lX3BhZ2VfdGl0bGVfdGV4dF9jb2xvciI7czo2OiIzMzMzMzMiO3M6Mzc6InRoZW1lX25hdmlnYXRpb25fYmFja2dyb3VuZF9jb2xvcl90b3AiO3M6NjoiYjUyZDAwIjtzOjQwOiJ0aGVtZV9uYXZpZ2F0aW9uX2JhY2tncm91bmRfY29sb3JfYm90dG9tIjtzOjY6ImI1MmQwMCI7czoyNzoidGhlbWVfbmF2aWdhdGlvbl90ZXh0X2NvbG9yIjtzOjY6ImViZTlkOSI7czozNDoidGhlbWVfbmF2aWdhdGlvbl90ZXh0X2FjdGl2ZV9jb2xvciI7czo2OiJmYWZhZjUiO3M6Mjc6InRoZW1lX3BhZ2VfYmFja2dyb3VuZF9jb2xvciI7czo2OiJmZmZmZmYiO3M6Mzk6InRoZW1lX3BhbmVsX2hlYWRlcl9iYWNrZ3JvdW5kX2NvbG9yX3RvcCI7czo2OiIzMzMzMzMiO3M6NDI6InRoZW1lX3BhbmVsX2hlYWRlcl9iYWNrZ3JvdW5kX2NvbG9yX2JvdHRvbSI7czo2OiIzMzMzMzMiO3M6Mjk6InRoZW1lX3BhbmVsX2hlYWRlcl90ZXh0X2NvbG9yIjtzOjY6ImZmZmZmZiI7czoxNjoidGhlbWVfbGlua19jb2xvciI7czo2OiJiNTJkMDAiO3M6MjU6InRoZW1lX2xpbmtfc2V0dGluZ3NfY29sb3IiO3M6NjoiYjUyZDAwIjtzOjI3OiJ0aGVtZV9oaWdobGlnaHRfaG92ZXJfY29sb3IiO3M6NjoiZmFlNmUxIjtzOjQxOiJ0aGVtZV9oaWdobGlnaHRfbmF2aWdhdGlvbl90ZXh0X2NvbG9yX3RvcCI7czo2OiI0ZjRmNGYiO3M6NDc6InRoZW1lX2hpZ2hsaWdodF9uYXZpZ2F0aW9uX2hvdmVyX3RleHRfY29sb3JfdG9wIjtzOjY6IjhmOGY4ZiI7fXM6ODoibG9nb191cmwiO3M6MDoiIjt9'),
(17, 1, 'Booty', 'client', 'YToyOntzOjY6ImNvbG9ycyI7YTo2MDp7czozMDoidGhlbWVfcHJpbWFyeV9hbGVydF90ZXh0X2NvbG9yIjtzOjY6IjAwNDA4NSI7czozNjoidGhlbWVfcHJpbWFyeV9hbGVydF9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6ImNjZTVmZiI7czozMjoidGhlbWVfcHJpbWFyeV9hbGVydF9ib3JkZXJfY29sb3IiO3M6NjoiYjhkYWZmIjtzOjMyOiJ0aGVtZV9zZWNvbmRhcnlfYWxlcnRfdGV4dF9jb2xvciI7czo2OiIzODNkNDEiO3M6Mzg6InRoZW1lX3NlY29uZGFyeV9hbGVydF9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6ImUyZTNlNSI7czozNDoidGhlbWVfc2Vjb25kYXJ5X2FsZXJ0X2JvcmRlcl9jb2xvciI7czo2OiJkNmQ4ZGIiO3M6MzA6InRoZW1lX3N1Y2Nlc3NfYWxlcnRfdGV4dF9jb2xvciI7czo2OiIxNTU3MjQiO3M6MzY6InRoZW1lX3N1Y2Nlc3NfYWxlcnRfYmFja2dyb3VuZF9jb2xvciI7czo2OiJkNGVkZGEiO3M6MzI6InRoZW1lX3N1Y2Nlc3NfYWxlcnRfYm9yZGVyX2NvbG9yIjtzOjY6ImMzZTZjYiI7czoyNzoidGhlbWVfaW5mb19hbGVydF90ZXh0X2NvbG9yIjtzOjY6IjBjNTQ2MCI7czozMzoidGhlbWVfaW5mb19hbGVydF9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6ImQxZWNmMSI7czoyOToidGhlbWVfaW5mb19hbGVydF9ib3JkZXJfY29sb3IiO3M6NjoiYmVlNWViIjtzOjMwOiJ0aGVtZV93YXJuaW5nX2FsZXJ0X3RleHRfY29sb3IiO3M6NjoiODU2NDA0IjtzOjM2OiJ0aGVtZV93YXJuaW5nX2FsZXJ0X2JhY2tncm91bmRfY29sb3IiO3M6NjoiZmZmM2NkIjtzOjMyOiJ0aGVtZV93YXJuaW5nX2FsZXJ0X2JvcmRlcl9jb2xvciI7czo2OiJmZmVlYmEiO3M6Mjk6InRoZW1lX2Rhbmdlcl9hbGVydF90ZXh0X2NvbG9yIjtzOjY6IjcyMWMyNCI7czozNToidGhlbWVfZGFuZ2VyX2FsZXJ0X2JhY2tncm91bmRfY29sb3IiO3M6NjoiZjhkN2RhIjtzOjMxOiJ0aGVtZV9kYW5nZXJfYWxlcnRfYm9yZGVyX2NvbG9yIjtzOjY6ImY1YzZjYiI7czoyODoidGhlbWVfbGlnaHRfYWxlcnRfdGV4dF9jb2xvciI7czo2OiI4MTgxODIiO3M6MzQ6InRoZW1lX2xpZ2h0X2FsZXJ0X2JhY2tncm91bmRfY29sb3IiO3M6NjoiZmVmZWZlIjtzOjMwOiJ0aGVtZV9saWdodF9hbGVydF9ib3JkZXJfY29sb3IiO3M6NjoiZmRmZGZlIjtzOjMxOiJ0aGVtZV9wcmltYXJ5X2J1dHRvbl90ZXh0X2NvbG9yIjtzOjY6ImZmZmZmZiI7czozNzoidGhlbWVfcHJpbWFyeV9idXR0b25fYmFja2dyb3VuZF9jb2xvciI7czo2OiIwMDdiZmYiO3M6MzI6InRoZW1lX3ByaW1hcnlfYnV0dG9uX2hvdmVyX2NvbG9yIjtzOjY6IjAwNjlkOSI7czozMzoidGhlbWVfc2Vjb25kYXJ5X2J1dHRvbl90ZXh0X2NvbG9yIjtzOjY6ImZmZmZmZiI7czozOToidGhlbWVfc2Vjb25kYXJ5X2J1dHRvbl9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6IjZjNzU3ZCI7czozNDoidGhlbWVfc2Vjb25kYXJ5X2J1dHRvbl9ob3Zlcl9jb2xvciI7czo2OiI1YTYyNjgiO3M6MzE6InRoZW1lX3N1Y2Nlc3NfYnV0dG9uX3RleHRfY29sb3IiO3M6NjoiZmZmZmZmIjtzOjM3OiJ0aGVtZV9zdWNjZXNzX2J1dHRvbl9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6IjI4YTc0NSI7czozMjoidGhlbWVfc3VjY2Vzc19idXR0b25faG92ZXJfY29sb3IiO3M6NjoiMjE4ODM4IjtzOjI4OiJ0aGVtZV9pbmZvX2J1dHRvbl90ZXh0X2NvbG9yIjtzOjY6ImZmZmZmZiI7czozNDoidGhlbWVfaW5mb19idXR0b25fYmFja2dyb3VuZF9jb2xvciI7czo2OiIxN2EyYjgiO3M6Mjk6InRoZW1lX2luZm9fYnV0dG9uX2hvdmVyX2NvbG9yIjtzOjY6IjEzODQ5NiI7czozMToidGhlbWVfd2FybmluZ19idXR0b25fdGV4dF9jb2xvciI7czo2OiIyMTI1MjkiO3M6Mzc6InRoZW1lX3dhcm5pbmdfYnV0dG9uX2JhY2tncm91bmRfY29sb3IiO3M6NjoiZmZjMTA3IjtzOjMyOiJ0aGVtZV93YXJuaW5nX2J1dHRvbl9ob3Zlcl9jb2xvciI7czo2OiJlMGE4MDAiO3M6MzA6InRoZW1lX2Rhbmdlcl9idXR0b25fdGV4dF9jb2xvciI7czo2OiJmZmZmZmYiO3M6MzY6InRoZW1lX2Rhbmdlcl9idXR0b25fYmFja2dyb3VuZF9jb2xvciI7czo2OiJkYzM1NDUiO3M6MzE6InRoZW1lX2Rhbmdlcl9idXR0b25faG92ZXJfY29sb3IiO3M6NjoiYzgyMzMzIjtzOjI5OiJ0aGVtZV9saWdodF9idXR0b25fdGV4dF9jb2xvciI7czo2OiIyMTI1MjkiO3M6MzU6InRoZW1lX2xpZ2h0X2J1dHRvbl9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6ImZmZmZmZiI7czozMDoidGhlbWVfbGlnaHRfYnV0dG9uX2hvdmVyX2NvbG9yIjtzOjY6ImUyZTZlYSI7czoyNToidGhlbWVfaGVhZGVyX2JnX2NvbG9yX3RvcCI7czo2OiI1NjNkN2MiO3M6Mjg6InRoZW1lX2hlYWRlcl9iZ19jb2xvcl9ib3R0b20iO3M6NjoiNmU1NDk5IjtzOjM3OiJ0aGVtZV9wYWdlX3RpdGxlX2JhY2tncm91bmRfY29sb3JfdG9wIjtzOjY6IjU2M2Q3YyI7czo0MDoidGhlbWVfcGFnZV90aXRsZV9iYWNrZ3JvdW5kX2NvbG9yX2JvdHRvbSI7czo2OiI1NjNkN2MiO3M6Mjc6InRoZW1lX3BhZ2VfdGl0bGVfdGV4dF9jb2xvciI7czo2OiJmZmZmZmYiO3M6Mzc6InRoZW1lX25hdmlnYXRpb25fYmFja2dyb3VuZF9jb2xvcl90b3AiO3M6NjoiNmU1NDk5IjtzOjQwOiJ0aGVtZV9uYXZpZ2F0aW9uX2JhY2tncm91bmRfY29sb3JfYm90dG9tIjtzOjY6IjcwNTk5OSI7czoyNzoidGhlbWVfbmF2aWdhdGlvbl90ZXh0X2NvbG9yIjtzOjY6ImNkYmZlMyI7czozNDoidGhlbWVfbmF2aWdhdGlvbl90ZXh0X2FjdGl2ZV9jb2xvciI7czo2OiJmZmZmZmYiO3M6Mjc6InRoZW1lX3BhZ2VfYmFja2dyb3VuZF9jb2xvciI7czo2OiJmZmZmZmYiO3M6Mzk6InRoZW1lX3BhbmVsX2hlYWRlcl9iYWNrZ3JvdW5kX2NvbG9yX3RvcCI7czo2OiI1NjNkN2MiO3M6NDI6InRoZW1lX3BhbmVsX2hlYWRlcl9iYWNrZ3JvdW5kX2NvbG9yX2JvdHRvbSI7czo2OiI1NjNkN2MiO3M6Mjk6InRoZW1lX3BhbmVsX2hlYWRlcl90ZXh0X2NvbG9yIjtzOjY6ImZmZmZmZiI7czoxNjoidGhlbWVfbGlua19jb2xvciI7czo2OiI3ODc4NzgiO3M6MjU6InRoZW1lX2xpbmtfc2V0dGluZ3NfY29sb3IiO3M6NjoiNzg3ODc4IjtzOjI3OiJ0aGVtZV9oaWdobGlnaHRfaG92ZXJfY29sb3IiO3M6NjoiZGNkMWYwIjtzOjQxOiJ0aGVtZV9oaWdobGlnaHRfbmF2aWdhdGlvbl90ZXh0X2NvbG9yX3RvcCI7czo2OiJlZmVmZWYiO3M6NDc6InRoZW1lX2hpZ2hsaWdodF9uYXZpZ2F0aW9uX2hvdmVyX3RleHRfY29sb3JfdG9wIjtzOjY6ImZmZmZmZiI7fXM6ODoibG9nb191cmwiO3M6MDoiIjt9'),
(18, 1, 'Slate', 'client', 'YToyOntzOjY6ImNvbG9ycyI7YTo2MDp7czozMDoidGhlbWVfcHJpbWFyeV9hbGVydF90ZXh0X2NvbG9yIjtzOjY6IjAwNDA4NSI7czozNjoidGhlbWVfcHJpbWFyeV9hbGVydF9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6ImNjZTVmZiI7czozMjoidGhlbWVfcHJpbWFyeV9hbGVydF9ib3JkZXJfY29sb3IiO3M6NjoiYjhkYWZmIjtzOjMyOiJ0aGVtZV9zZWNvbmRhcnlfYWxlcnRfdGV4dF9jb2xvciI7czo2OiIzODNkNDEiO3M6Mzg6InRoZW1lX3NlY29uZGFyeV9hbGVydF9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6ImUyZTNlNSI7czozNDoidGhlbWVfc2Vjb25kYXJ5X2FsZXJ0X2JvcmRlcl9jb2xvciI7czo2OiJkNmQ4ZGIiO3M6MzA6InRoZW1lX3N1Y2Nlc3NfYWxlcnRfdGV4dF9jb2xvciI7czo2OiIxNTU3MjQiO3M6MzY6InRoZW1lX3N1Y2Nlc3NfYWxlcnRfYmFja2dyb3VuZF9jb2xvciI7czo2OiJkNGVkZGEiO3M6MzI6InRoZW1lX3N1Y2Nlc3NfYWxlcnRfYm9yZGVyX2NvbG9yIjtzOjY6ImMzZTZjYiI7czoyNzoidGhlbWVfaW5mb19hbGVydF90ZXh0X2NvbG9yIjtzOjY6IjBjNTQ2MCI7czozMzoidGhlbWVfaW5mb19hbGVydF9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6ImQxZWNmMSI7czoyOToidGhlbWVfaW5mb19hbGVydF9ib3JkZXJfY29sb3IiO3M6NjoiYmVlNWViIjtzOjMwOiJ0aGVtZV93YXJuaW5nX2FsZXJ0X3RleHRfY29sb3IiO3M6NjoiODU2NDA0IjtzOjM2OiJ0aGVtZV93YXJuaW5nX2FsZXJ0X2JhY2tncm91bmRfY29sb3IiO3M6NjoiZmZmM2NkIjtzOjMyOiJ0aGVtZV93YXJuaW5nX2FsZXJ0X2JvcmRlcl9jb2xvciI7czo2OiJmZmVlYmEiO3M6Mjk6InRoZW1lX2Rhbmdlcl9hbGVydF90ZXh0X2NvbG9yIjtzOjY6IjcyMWMyNCI7czozNToidGhlbWVfZGFuZ2VyX2FsZXJ0X2JhY2tncm91bmRfY29sb3IiO3M6NjoiZjhkN2RhIjtzOjMxOiJ0aGVtZV9kYW5nZXJfYWxlcnRfYm9yZGVyX2NvbG9yIjtzOjY6ImY1YzZjYiI7czoyODoidGhlbWVfbGlnaHRfYWxlcnRfdGV4dF9jb2xvciI7czo2OiI4MTgxODIiO3M6MzQ6InRoZW1lX2xpZ2h0X2FsZXJ0X2JhY2tncm91bmRfY29sb3IiO3M6NjoiZmVmZWZlIjtzOjMwOiJ0aGVtZV9saWdodF9hbGVydF9ib3JkZXJfY29sb3IiO3M6NjoiZmRmZGZlIjtzOjMxOiJ0aGVtZV9wcmltYXJ5X2J1dHRvbl90ZXh0X2NvbG9yIjtzOjY6ImZmZmZmZiI7czozNzoidGhlbWVfcHJpbWFyeV9idXR0b25fYmFja2dyb3VuZF9jb2xvciI7czo2OiIwMDdiZmYiO3M6MzI6InRoZW1lX3ByaW1hcnlfYnV0dG9uX2hvdmVyX2NvbG9yIjtzOjY6IjAwNjlkOSI7czozMzoidGhlbWVfc2Vjb25kYXJ5X2J1dHRvbl90ZXh0X2NvbG9yIjtzOjY6ImZmZmZmZiI7czozOToidGhlbWVfc2Vjb25kYXJ5X2J1dHRvbl9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6IjZjNzU3ZCI7czozNDoidGhlbWVfc2Vjb25kYXJ5X2J1dHRvbl9ob3Zlcl9jb2xvciI7czo2OiI1YTYyNjgiO3M6MzE6InRoZW1lX3N1Y2Nlc3NfYnV0dG9uX3RleHRfY29sb3IiO3M6NjoiZmZmZmZmIjtzOjM3OiJ0aGVtZV9zdWNjZXNzX2J1dHRvbl9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6IjI4YTc0NSI7czozMjoidGhlbWVfc3VjY2Vzc19idXR0b25faG92ZXJfY29sb3IiO3M6NjoiMjE4ODM4IjtzOjI4OiJ0aGVtZV9pbmZvX2J1dHRvbl90ZXh0X2NvbG9yIjtzOjY6ImZmZmZmZiI7czozNDoidGhlbWVfaW5mb19idXR0b25fYmFja2dyb3VuZF9jb2xvciI7czo2OiIxN2EyYjgiO3M6Mjk6InRoZW1lX2luZm9fYnV0dG9uX2hvdmVyX2NvbG9yIjtzOjY6IjEzODQ5NiI7czozMToidGhlbWVfd2FybmluZ19idXR0b25fdGV4dF9jb2xvciI7czo2OiIyMTI1MjkiO3M6Mzc6InRoZW1lX3dhcm5pbmdfYnV0dG9uX2JhY2tncm91bmRfY29sb3IiO3M6NjoiZmZjMTA3IjtzOjMyOiJ0aGVtZV93YXJuaW5nX2J1dHRvbl9ob3Zlcl9jb2xvciI7czo2OiJlMGE4MDAiO3M6MzA6InRoZW1lX2Rhbmdlcl9idXR0b25fdGV4dF9jb2xvciI7czo2OiJmZmZmZmYiO3M6MzY6InRoZW1lX2Rhbmdlcl9idXR0b25fYmFja2dyb3VuZF9jb2xvciI7czo2OiJkYzM1NDUiO3M6MzE6InRoZW1lX2Rhbmdlcl9idXR0b25faG92ZXJfY29sb3IiO3M6NjoiYzgyMzMzIjtzOjI5OiJ0aGVtZV9saWdodF9idXR0b25fdGV4dF9jb2xvciI7czo2OiIyMTI1MjkiO3M6MzU6InRoZW1lX2xpZ2h0X2J1dHRvbl9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6ImZmZmZmZiI7czozMDoidGhlbWVfbGlnaHRfYnV0dG9uX2hvdmVyX2NvbG9yIjtzOjY6ImUyZTZlYSI7czoyNToidGhlbWVfaGVhZGVyX2JnX2NvbG9yX3RvcCI7czo2OiJmZmZmZmYiO3M6Mjg6InRoZW1lX2hlYWRlcl9iZ19jb2xvcl9ib3R0b20iO3M6NjoiZmZmZmZmIjtzOjM3OiJ0aGVtZV9wYWdlX3RpdGxlX2JhY2tncm91bmRfY29sb3JfdG9wIjtzOjY6ImY1ZjVmNSI7czo0MDoidGhlbWVfcGFnZV90aXRsZV9iYWNrZ3JvdW5kX2NvbG9yX2JvdHRvbSI7czo2OiJmMGYwZjAiO3M6Mjc6InRoZW1lX3BhZ2VfdGl0bGVfdGV4dF9jb2xvciI7czo2OiIzYTNhM2EiO3M6Mzc6InRoZW1lX25hdmlnYXRpb25fYmFja2dyb3VuZF9jb2xvcl90b3AiO3M6NjoiNGY0ZjRmIjtzOjQwOiJ0aGVtZV9uYXZpZ2F0aW9uX2JhY2tncm91bmRfY29sb3JfYm90dG9tIjtzOjY6IjRmNGY0ZiI7czoyNzoidGhlbWVfbmF2aWdhdGlvbl90ZXh0X2NvbG9yIjtzOjY6ImViZWJlYiI7czozNDoidGhlbWVfbmF2aWdhdGlvbl90ZXh0X2FjdGl2ZV9jb2xvciI7czo2OiJmZmZmZmYiO3M6Mjc6InRoZW1lX3BhZ2VfYmFja2dyb3VuZF9jb2xvciI7czo2OiJmYWZhZmEiO3M6Mzk6InRoZW1lX3BhbmVsX2hlYWRlcl9iYWNrZ3JvdW5kX2NvbG9yX3RvcCI7czo2OiI0ZjRmNGYiO3M6NDI6InRoZW1lX3BhbmVsX2hlYWRlcl9iYWNrZ3JvdW5kX2NvbG9yX2JvdHRvbSI7czo2OiI0ZjRmNGYiO3M6Mjk6InRoZW1lX3BhbmVsX2hlYWRlcl90ZXh0X2NvbG9yIjtzOjY6ImYyZjJmMiI7czoxNjoidGhlbWVfbGlua19jb2xvciI7czo2OiIwMDc0YjIiO3M6MjU6InRoZW1lX2xpbmtfc2V0dGluZ3NfY29sb3IiO3M6NjoiNGY0ZjRmIjtzOjI3OiJ0aGVtZV9oaWdobGlnaHRfaG92ZXJfY29sb3IiO3M6NjoiZTBmNWZmIjtzOjQxOiJ0aGVtZV9oaWdobGlnaHRfbmF2aWdhdGlvbl90ZXh0X2NvbG9yX3RvcCI7czo2OiI0ZjRmNGYiO3M6NDc6InRoZW1lX2hpZ2hsaWdodF9uYXZpZ2F0aW9uX2hvdmVyX3RleHRfY29sb3JfdG9wIjtzOjY6IjhmOGY4ZiI7fXM6ODoibG9nb191cmwiO3M6MDoiIjt9'),
(19, 1, 'Venustas', 'client', 'YToyOntzOjY6ImNvbG9ycyI7YTo2MDp7czozMDoidGhlbWVfcHJpbWFyeV9hbGVydF90ZXh0X2NvbG9yIjtzOjY6IjAwNDA4NSI7czozNjoidGhlbWVfcHJpbWFyeV9hbGVydF9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6ImNjZTVmZiI7czozMjoidGhlbWVfcHJpbWFyeV9hbGVydF9ib3JkZXJfY29sb3IiO3M6NjoiYjhkYWZmIjtzOjMyOiJ0aGVtZV9zZWNvbmRhcnlfYWxlcnRfdGV4dF9jb2xvciI7czo2OiIzODNkNDEiO3M6Mzg6InRoZW1lX3NlY29uZGFyeV9hbGVydF9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6ImUyZTNlNSI7czozNDoidGhlbWVfc2Vjb25kYXJ5X2FsZXJ0X2JvcmRlcl9jb2xvciI7czo2OiJkNmQ4ZGIiO3M6MzA6InRoZW1lX3N1Y2Nlc3NfYWxlcnRfdGV4dF9jb2xvciI7czo2OiIxNTU3MjQiO3M6MzY6InRoZW1lX3N1Y2Nlc3NfYWxlcnRfYmFja2dyb3VuZF9jb2xvciI7czo2OiJkNGVkZGEiO3M6MzI6InRoZW1lX3N1Y2Nlc3NfYWxlcnRfYm9yZGVyX2NvbG9yIjtzOjY6ImMzZTZjYiI7czoyNzoidGhlbWVfaW5mb19hbGVydF90ZXh0X2NvbG9yIjtzOjY6IjBjNTQ2MCI7czozMzoidGhlbWVfaW5mb19hbGVydF9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6ImQxZWNmMSI7czoyOToidGhlbWVfaW5mb19hbGVydF9ib3JkZXJfY29sb3IiO3M6NjoiYmVlNWViIjtzOjMwOiJ0aGVtZV93YXJuaW5nX2FsZXJ0X3RleHRfY29sb3IiO3M6NjoiODU2NDA0IjtzOjM2OiJ0aGVtZV93YXJuaW5nX2FsZXJ0X2JhY2tncm91bmRfY29sb3IiO3M6NjoiZmZmM2NkIjtzOjMyOiJ0aGVtZV93YXJuaW5nX2FsZXJ0X2JvcmRlcl9jb2xvciI7czo2OiJmZmVlYmEiO3M6Mjk6InRoZW1lX2Rhbmdlcl9hbGVydF90ZXh0X2NvbG9yIjtzOjY6IjcyMWMyNCI7czozNToidGhlbWVfZGFuZ2VyX2FsZXJ0X2JhY2tncm91bmRfY29sb3IiO3M6NjoiZjhkN2RhIjtzOjMxOiJ0aGVtZV9kYW5nZXJfYWxlcnRfYm9yZGVyX2NvbG9yIjtzOjY6ImY1YzZjYiI7czoyODoidGhlbWVfbGlnaHRfYWxlcnRfdGV4dF9jb2xvciI7czo2OiI4MTgxODIiO3M6MzQ6InRoZW1lX2xpZ2h0X2FsZXJ0X2JhY2tncm91bmRfY29sb3IiO3M6NjoiZmVmZWZlIjtzOjMwOiJ0aGVtZV9saWdodF9hbGVydF9ib3JkZXJfY29sb3IiO3M6NjoiZmRmZGZlIjtzOjMxOiJ0aGVtZV9wcmltYXJ5X2J1dHRvbl90ZXh0X2NvbG9yIjtzOjY6ImZmZmZmZiI7czozNzoidGhlbWVfcHJpbWFyeV9idXR0b25fYmFja2dyb3VuZF9jb2xvciI7czo2OiIwMDdiZmYiO3M6MzI6InRoZW1lX3ByaW1hcnlfYnV0dG9uX2hvdmVyX2NvbG9yIjtzOjY6IjAwNjlkOSI7czozMzoidGhlbWVfc2Vjb25kYXJ5X2J1dHRvbl90ZXh0X2NvbG9yIjtzOjY6ImZmZmZmZiI7czozOToidGhlbWVfc2Vjb25kYXJ5X2J1dHRvbl9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6IjZjNzU3ZCI7czozNDoidGhlbWVfc2Vjb25kYXJ5X2J1dHRvbl9ob3Zlcl9jb2xvciI7czo2OiI1YTYyNjgiO3M6MzE6InRoZW1lX3N1Y2Nlc3NfYnV0dG9uX3RleHRfY29sb3IiO3M6NjoiZmZmZmZmIjtzOjM3OiJ0aGVtZV9zdWNjZXNzX2J1dHRvbl9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6IjI4YTc0NSI7czozMjoidGhlbWVfc3VjY2Vzc19idXR0b25faG92ZXJfY29sb3IiO3M6NjoiMjE4ODM4IjtzOjI4OiJ0aGVtZV9pbmZvX2J1dHRvbl90ZXh0X2NvbG9yIjtzOjY6ImZmZmZmZiI7czozNDoidGhlbWVfaW5mb19idXR0b25fYmFja2dyb3VuZF9jb2xvciI7czo2OiIxN2EyYjgiO3M6Mjk6InRoZW1lX2luZm9fYnV0dG9uX2hvdmVyX2NvbG9yIjtzOjY6IjEzODQ5NiI7czozMToidGhlbWVfd2FybmluZ19idXR0b25fdGV4dF9jb2xvciI7czo2OiIyMTI1MjkiO3M6Mzc6InRoZW1lX3dhcm5pbmdfYnV0dG9uX2JhY2tncm91bmRfY29sb3IiO3M6NjoiZmZjMTA3IjtzOjMyOiJ0aGVtZV93YXJuaW5nX2J1dHRvbl9ob3Zlcl9jb2xvciI7czo2OiJlMGE4MDAiO3M6MzA6InRoZW1lX2Rhbmdlcl9idXR0b25fdGV4dF9jb2xvciI7czo2OiJmZmZmZmYiO3M6MzY6InRoZW1lX2Rhbmdlcl9idXR0b25fYmFja2dyb3VuZF9jb2xvciI7czo2OiJkYzM1NDUiO3M6MzE6InRoZW1lX2Rhbmdlcl9idXR0b25faG92ZXJfY29sb3IiO3M6NjoiYzgyMzMzIjtzOjI5OiJ0aGVtZV9saWdodF9idXR0b25fdGV4dF9jb2xvciI7czo2OiIyMTI1MjkiO3M6MzU6InRoZW1lX2xpZ2h0X2J1dHRvbl9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6ImZmZmZmZiI7czozMDoidGhlbWVfbGlnaHRfYnV0dG9uX2hvdmVyX2NvbG9yIjtzOjY6ImUyZTZlYSI7czoyNToidGhlbWVfaGVhZGVyX2JnX2NvbG9yX3RvcCI7czo2OiI0MjEyNGEiO3M6Mjg6InRoZW1lX2hlYWRlcl9iZ19jb2xvcl9ib3R0b20iO3M6NjoiNDIxMjRhIjtzOjM3OiJ0aGVtZV9wYWdlX3RpdGxlX2JhY2tncm91bmRfY29sb3JfdG9wIjtzOjY6IjVkMTk2MyI7czo0MDoidGhlbWVfcGFnZV90aXRsZV9iYWNrZ3JvdW5kX2NvbG9yX2JvdHRvbSI7czo2OiI1ZDE5NjMiO3M6Mjc6InRoZW1lX3BhZ2VfdGl0bGVfdGV4dF9jb2xvciI7czo2OiJmZmZmZmYiO3M6Mzc6InRoZW1lX25hdmlnYXRpb25fYmFja2dyb3VuZF9jb2xvcl90b3AiO3M6NjoiNDIxMjRhIjtzOjQwOiJ0aGVtZV9uYXZpZ2F0aW9uX2JhY2tncm91bmRfY29sb3JfYm90dG9tIjtzOjY6IjQyMTI0YSI7czoyNzoidGhlbWVfbmF2aWdhdGlvbl90ZXh0X2NvbG9yIjtzOjY6ImZmZmZmZiI7czozNDoidGhlbWVfbmF2aWdhdGlvbl90ZXh0X2FjdGl2ZV9jb2xvciI7czo2OiJiNWQ5OGYiO3M6Mjc6InRoZW1lX3BhZ2VfYmFja2dyb3VuZF9jb2xvciI7czo2OiJmOGU4ZmMiO3M6Mzk6InRoZW1lX3BhbmVsX2hlYWRlcl9iYWNrZ3JvdW5kX2NvbG9yX3RvcCI7czo2OiI0MjEyNGEiO3M6NDI6InRoZW1lX3BhbmVsX2hlYWRlcl9iYWNrZ3JvdW5kX2NvbG9yX2JvdHRvbSI7czo2OiI1ZDE5NjMiO3M6Mjk6InRoZW1lX3BhbmVsX2hlYWRlcl90ZXh0X2NvbG9yIjtzOjY6ImZmZmZmZiI7czoxNjoidGhlbWVfbGlua19jb2xvciI7czo2OiIyMDJmNjAiO3M6MjU6InRoZW1lX2xpbmtfc2V0dGluZ3NfY29sb3IiO3M6NjoiMDAwMDAwIjtzOjI3OiJ0aGVtZV9oaWdobGlnaHRfaG92ZXJfY29sb3IiO3M6NjoiZTZlNmU2IjtzOjQxOiJ0aGVtZV9oaWdobGlnaHRfbmF2aWdhdGlvbl90ZXh0X2NvbG9yX3RvcCI7czo2OiJlZmVmZWYiO3M6NDc6InRoZW1lX2hpZ2hsaWdodF9uYXZpZ2F0aW9uX2hvdmVyX3RleHRfY29sb3JfdG9wIjtzOjY6ImZmZmZmZiI7fXM6ODoibG9nb191cmwiO3M6MDoiIjt9'),
(20, 1, 'WHMBlesta', 'admin', 'YToyOntzOjY6ImNvbG9ycyI7YToyMDp7czoyNToidGhlbWVfaGVhZGVyX2JnX2NvbG9yX3RvcCI7czo2OiIzMzMzMzMiO3M6Mjg6InRoZW1lX2hlYWRlcl9iZ19jb2xvcl9ib3R0b20iO3M6NjoiMzMzMzMzIjtzOjIzOiJ0aGVtZV9oZWFkZXJfdGV4dF9jb2xvciI7czo2OiJmZmZmZmYiO3M6Mzc6InRoZW1lX25hdmlnYXRpb25fYmFja2dyb3VuZF9jb2xvcl90b3AiO3M6NjoiNEM0QzRDIjtzOjQwOiJ0aGVtZV9uYXZpZ2F0aW9uX2JhY2tncm91bmRfY29sb3JfYm90dG9tIjtzOjY6IjRDNEM0QyI7czoyNzoidGhlbWVfbmF2aWdhdGlvbl90ZXh0X2NvbG9yIjtzOjY6ImZmZmZmZiI7czozMzoidGhlbWVfbmF2aWdhdGlvbl90ZXh0X2hvdmVyX2NvbG9yIjtzOjY6IjZlNmU2ZSI7czozMjoidGhlbWVfc3VibmF2aWdhdGlvbl9iZ19jb2xvcl90b3AiO3M6NjoiRUFFQUVBIjtzOjM1OiJ0aGVtZV9zdWJuYXZpZ2F0aW9uX2JnX2NvbG9yX2JvdHRvbSI7czo2OiJFQUVBRUEiO3M6MzA6InRoZW1lX3N1Ym5hdmlnYXRpb25fdGV4dF9jb2xvciI7czo2OiI2ZTZlNmUiO3M6Mzc6InRoZW1lX3N1Ym5hdmlnYXRpb25fdGV4dF9hY3RpdmVfY29sb3IiO3M6NjoiNmU2ZTZlIjtzOjMzOiJ0aGVtZV93aWRnZXRfaGVhZGluZ19iZ19jb2xvcl90b3AiO3M6NjoiRUFFQUVBIjtzOjM2OiJ0aGVtZV93aWRnZXRfaGVhZGluZ19iZ19jb2xvcl9ib3R0b20iO3M6NjoiRUFFQUVBIjtzOjM4OiJ0aGVtZV93aWRnZXRfaWNvbl9oZWFkaW5nX2JnX2NvbG9yX3RvcCI7czo2OiJEMEQwRDAiO3M6NDE6InRoZW1lX3dpZGdldF9pY29uX2hlYWRpbmdfYmdfY29sb3JfYm90dG9tIjtzOjY6IkQwRDBEMCI7czoyMDoidGhlbWVfYm94X3RleHRfY29sb3IiO3M6NjoiNmU2ZTZlIjtzOjE3OiJ0aGVtZV90ZXh0X3NoYWRvdyI7czo2OiIwMDAwMDAiO3M6MjQ6InRoZW1lX2FjdGlvbnNfdGV4dF9jb2xvciI7czo2OiI2ZTZlNmUiO3M6MjQ6InRoZW1lX2hpZ2hsaWdodF9iZ19jb2xvciI7czo2OiJGNzhFMUUiO3M6MjI6InRoZW1lX2JveF9zaGFkb3dfY29sb3IiO3M6NjoiYmZiZmJmIjt9czo4OiJsb2dvX3VybCI7czowOiIiO30='),
(22, 1, 'Blesta Blue', 'admin', 'YToyOntzOjY6ImNvbG9ycyI7YToyMDp7czoyNToidGhlbWVfaGVhZGVyX2JnX2NvbG9yX3RvcCI7czo2OiIwMDc0YjIiO3M6Mjg6InRoZW1lX2hlYWRlcl9iZ19jb2xvcl9ib3R0b20iO3M6NjoiNmRhZmQzIjtzOjIzOiJ0aGVtZV9oZWFkZXJfdGV4dF9jb2xvciI7czo2OiJlNGU0ZTQiO3M6Mzc6InRoZW1lX25hdmlnYXRpb25fYmFja2dyb3VuZF9jb2xvcl90b3AiO3M6NjoiNWE1ZDYzIjtzOjQwOiJ0aGVtZV9uYXZpZ2F0aW9uX2JhY2tncm91bmRfY29sb3JfYm90dG9tIjtzOjY6IjQyNDQ0YSI7czoyNzoidGhlbWVfbmF2aWdhdGlvbl90ZXh0X2NvbG9yIjtzOjY6ImFmYWZhZiI7czozMzoidGhlbWVfbmF2aWdhdGlvbl90ZXh0X2hvdmVyX2NvbG9yIjtzOjY6ImZmZmZmZiI7czozMjoidGhlbWVfc3VibmF2aWdhdGlvbl9iZ19jb2xvcl90b3AiO3M6NjoiMjIyMzI2IjtzOjM1OiJ0aGVtZV9zdWJuYXZpZ2F0aW9uX2JnX2NvbG9yX2JvdHRvbSI7czo2OiIzMzM0MzkiO3M6MzA6InRoZW1lX3N1Ym5hdmlnYXRpb25fdGV4dF9jb2xvciI7czo2OiJhZmFmYWYiO3M6Mzc6InRoZW1lX3N1Ym5hdmlnYXRpb25fdGV4dF9hY3RpdmVfY29sb3IiO3M6NjoiZDhkOGQ4IjtzOjMzOiJ0aGVtZV93aWRnZXRfaGVhZGluZ19iZ19jb2xvcl90b3AiO3M6NjoiNmRhZmQzIjtzOjM2OiJ0aGVtZV93aWRnZXRfaGVhZGluZ19iZ19jb2xvcl9ib3R0b20iO3M6NjoiMDA3NGIyIjtzOjM4OiJ0aGVtZV93aWRnZXRfaWNvbl9oZWFkaW5nX2JnX2NvbG9yX3RvcCI7czo2OiIxMzdlYjgiO3M6NDE6InRoZW1lX3dpZGdldF9pY29uX2hlYWRpbmdfYmdfY29sb3JfYm90dG9tIjtzOjY6IjU2YTRjYyI7czoyMDoidGhlbWVfYm94X3RleHRfY29sb3IiO3M6NjoiZmZmZmZmIjtzOjE3OiJ0aGVtZV90ZXh0X3NoYWRvdyI7czo2OiI3Nzk5OTkiO3M6MjQ6InRoZW1lX2FjdGlvbnNfdGV4dF9jb2xvciI7czo2OiIwMDc1YjIiO3M6MjQ6InRoZW1lX2hpZ2hsaWdodF9iZ19jb2xvciI7czo2OiJlY2Y3ZmYiO3M6MjI6InRoZW1lX2JveF9zaGFkb3dfY29sb3IiO3M6NjoiYmZiZmJmIjt9czo4OiJsb2dvX3VybCI7czowOiIiO30='),
(24, 1, 'Blesta Blue', 'client', 'YToyOntzOjY6ImNvbG9ycyI7YTo2MDp7czozMDoidGhlbWVfcHJpbWFyeV9hbGVydF90ZXh0X2NvbG9yIjtzOjY6IjAwNDA4NSI7czozNjoidGhlbWVfcHJpbWFyeV9hbGVydF9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6ImNjZTVmZiI7czozMjoidGhlbWVfcHJpbWFyeV9hbGVydF9ib3JkZXJfY29sb3IiO3M6NjoiYjhkYWZmIjtzOjMyOiJ0aGVtZV9zZWNvbmRhcnlfYWxlcnRfdGV4dF9jb2xvciI7czo2OiIzODNkNDEiO3M6Mzg6InRoZW1lX3NlY29uZGFyeV9hbGVydF9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6ImUyZTNlNSI7czozNDoidGhlbWVfc2Vjb25kYXJ5X2FsZXJ0X2JvcmRlcl9jb2xvciI7czo2OiJkNmQ4ZGIiO3M6MzA6InRoZW1lX3N1Y2Nlc3NfYWxlcnRfdGV4dF9jb2xvciI7czo2OiIxNTU3MjQiO3M6MzY6InRoZW1lX3N1Y2Nlc3NfYWxlcnRfYmFja2dyb3VuZF9jb2xvciI7czo2OiJkNGVkZGEiO3M6MzI6InRoZW1lX3N1Y2Nlc3NfYWxlcnRfYm9yZGVyX2NvbG9yIjtzOjY6ImMzZTZjYiI7czoyNzoidGhlbWVfaW5mb19hbGVydF90ZXh0X2NvbG9yIjtzOjY6IjBjNTQ2MCI7czozMzoidGhlbWVfaW5mb19hbGVydF9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6ImQxZWNmMSI7czoyOToidGhlbWVfaW5mb19hbGVydF9ib3JkZXJfY29sb3IiO3M6NjoiYmVlNWViIjtzOjMwOiJ0aGVtZV93YXJuaW5nX2FsZXJ0X3RleHRfY29sb3IiO3M6NjoiODU2NDA0IjtzOjM2OiJ0aGVtZV93YXJuaW5nX2FsZXJ0X2JhY2tncm91bmRfY29sb3IiO3M6NjoiZmZmM2NkIjtzOjMyOiJ0aGVtZV93YXJuaW5nX2FsZXJ0X2JvcmRlcl9jb2xvciI7czo2OiJmZmVlYmEiO3M6Mjk6InRoZW1lX2Rhbmdlcl9hbGVydF90ZXh0X2NvbG9yIjtzOjY6IjcyMWMyNCI7czozNToidGhlbWVfZGFuZ2VyX2FsZXJ0X2JhY2tncm91bmRfY29sb3IiO3M6NjoiZjhkN2RhIjtzOjMxOiJ0aGVtZV9kYW5nZXJfYWxlcnRfYm9yZGVyX2NvbG9yIjtzOjY6ImY1YzZjYiI7czoyODoidGhlbWVfbGlnaHRfYWxlcnRfdGV4dF9jb2xvciI7czo2OiI4MTgxODIiO3M6MzQ6InRoZW1lX2xpZ2h0X2FsZXJ0X2JhY2tncm91bmRfY29sb3IiO3M6NjoiZmVmZWZlIjtzOjMwOiJ0aGVtZV9saWdodF9hbGVydF9ib3JkZXJfY29sb3IiO3M6NjoiZmRmZGZlIjtzOjMxOiJ0aGVtZV9wcmltYXJ5X2J1dHRvbl90ZXh0X2NvbG9yIjtzOjY6ImZmZmZmZiI7czozNzoidGhlbWVfcHJpbWFyeV9idXR0b25fYmFja2dyb3VuZF9jb2xvciI7czo2OiIwMDdiZmYiO3M6MzI6InRoZW1lX3ByaW1hcnlfYnV0dG9uX2hvdmVyX2NvbG9yIjtzOjY6IjAwNjlkOSI7czozMzoidGhlbWVfc2Vjb25kYXJ5X2J1dHRvbl90ZXh0X2NvbG9yIjtzOjY6ImZmZmZmZiI7czozOToidGhlbWVfc2Vjb25kYXJ5X2J1dHRvbl9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6IjZjNzU3ZCI7czozNDoidGhlbWVfc2Vjb25kYXJ5X2J1dHRvbl9ob3Zlcl9jb2xvciI7czo2OiI1YTYyNjgiO3M6MzE6InRoZW1lX3N1Y2Nlc3NfYnV0dG9uX3RleHRfY29sb3IiO3M6NjoiZmZmZmZmIjtzOjM3OiJ0aGVtZV9zdWNjZXNzX2J1dHRvbl9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6IjI4YTc0NSI7czozMjoidGhlbWVfc3VjY2Vzc19idXR0b25faG92ZXJfY29sb3IiO3M6NjoiMjE4ODM4IjtzOjI4OiJ0aGVtZV9pbmZvX2J1dHRvbl90ZXh0X2NvbG9yIjtzOjY6ImZmZmZmZiI7czozNDoidGhlbWVfaW5mb19idXR0b25fYmFja2dyb3VuZF9jb2xvciI7czo2OiIxN2EyYjgiO3M6Mjk6InRoZW1lX2luZm9fYnV0dG9uX2hvdmVyX2NvbG9yIjtzOjY6IjEzODQ5NiI7czozMToidGhlbWVfd2FybmluZ19idXR0b25fdGV4dF9jb2xvciI7czo2OiIyMTI1MjkiO3M6Mzc6InRoZW1lX3dhcm5pbmdfYnV0dG9uX2JhY2tncm91bmRfY29sb3IiO3M6NjoiZmZjMTA3IjtzOjMyOiJ0aGVtZV93YXJuaW5nX2J1dHRvbl9ob3Zlcl9jb2xvciI7czo2OiJlMGE4MDAiO3M6MzA6InRoZW1lX2Rhbmdlcl9idXR0b25fdGV4dF9jb2xvciI7czo2OiJmZmZmZmYiO3M6MzY6InRoZW1lX2Rhbmdlcl9idXR0b25fYmFja2dyb3VuZF9jb2xvciI7czo2OiJkYzM1NDUiO3M6MzE6InRoZW1lX2Rhbmdlcl9idXR0b25faG92ZXJfY29sb3IiO3M6NjoiYzgyMzMzIjtzOjI5OiJ0aGVtZV9saWdodF9idXR0b25fdGV4dF9jb2xvciI7czo2OiIyMTI1MjkiO3M6MzU6InRoZW1lX2xpZ2h0X2J1dHRvbl9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6ImZmZmZmZiI7czozMDoidGhlbWVfbGlnaHRfYnV0dG9uX2hvdmVyX2NvbG9yIjtzOjY6ImUyZTZlYSI7czoyNToidGhlbWVfaGVhZGVyX2JnX2NvbG9yX3RvcCI7czo2OiIwMDc0YjIiO3M6Mjg6InRoZW1lX2hlYWRlcl9iZ19jb2xvcl9ib3R0b20iO3M6NjoiNmZiMWQ0IjtzOjM3OiJ0aGVtZV9wYWdlX3RpdGxlX2JhY2tncm91bmRfY29sb3JfdG9wIjtzOjY6IjIyMjMyNiI7czo0MDoidGhlbWVfcGFnZV90aXRsZV9iYWNrZ3JvdW5kX2NvbG9yX2JvdHRvbSI7czo2OiIzNDM1M2EiO3M6Mjc6InRoZW1lX3BhZ2VfdGl0bGVfdGV4dF9jb2xvciI7czo2OiJmZmZmZmYiO3M6Mzc6InRoZW1lX25hdmlnYXRpb25fYmFja2dyb3VuZF9jb2xvcl90b3AiO3M6NjoiMjIyMzI2IjtzOjQwOiJ0aGVtZV9uYXZpZ2F0aW9uX2JhY2tncm91bmRfY29sb3JfYm90dG9tIjtzOjY6IjM0MzUzYSI7czoyNzoidGhlbWVfbmF2aWdhdGlvbl90ZXh0X2NvbG9yIjtzOjY6ImI3YjdiNyI7czozNDoidGhlbWVfbmF2aWdhdGlvbl90ZXh0X2FjdGl2ZV9jb2xvciI7czo2OiJmZmZmZmYiO3M6Mjc6InRoZW1lX3BhZ2VfYmFja2dyb3VuZF9jb2xvciI7czo2OiJmOGY4ZjgiO3M6Mzk6InRoZW1lX3BhbmVsX2hlYWRlcl9iYWNrZ3JvdW5kX2NvbG9yX3RvcCI7czo2OiI2ZmIxZGYiO3M6NDI6InRoZW1lX3BhbmVsX2hlYWRlcl9iYWNrZ3JvdW5kX2NvbG9yX2JvdHRvbSI7czo2OiIwMDc1YjIiO3M6Mjk6InRoZW1lX3BhbmVsX2hlYWRlcl90ZXh0X2NvbG9yIjtzOjY6ImZmZmZmZiI7czoxNjoidGhlbWVfbGlua19jb2xvciI7czo2OiIwMDc0YjIiO3M6MjU6InRoZW1lX2xpbmtfc2V0dGluZ3NfY29sb3IiO3M6NjoiOGNjMjRhIjtzOjI3OiJ0aGVtZV9oaWdobGlnaHRfaG92ZXJfY29sb3IiO3M6NjoiZWNmN2ZmIjtzOjQxOiJ0aGVtZV9oaWdobGlnaHRfbmF2aWdhdGlvbl90ZXh0X2NvbG9yX3RvcCI7czo2OiJlZmVmZWYiO3M6NDc6InRoZW1lX2hpZ2hsaWdodF9uYXZpZ2F0aW9uX2hvdmVyX3RleHRfY29sb3JfdG9wIjtzOjY6ImZmZmZmZiI7fXM6ODoibG9nb191cmwiO3M6MDoiIjt9');
INSERT INTO `themes` (`id`, `company_id`, `name`, `type`, `data`) VALUES
(25, NULL, 'FIVE', 'admin', 'YToyOntzOjY6ImNvbG9ycyI7YToyMDp7czoyNToidGhlbWVfaGVhZGVyX2JnX2NvbG9yX3RvcCI7czo2OiIyNTI4MmIiO3M6Mjg6InRoZW1lX2hlYWRlcl9iZ19jb2xvcl9ib3R0b20iO3M6NjoiMjUyODJiIjtzOjIzOiJ0aGVtZV9oZWFkZXJfdGV4dF9jb2xvciI7czo2OiJmZmZmZmYiO3M6Mzc6InRoZW1lX25hdmlnYXRpb25fYmFja2dyb3VuZF9jb2xvcl90b3AiO3M6NjoiM2U0MzQ3IjtzOjQwOiJ0aGVtZV9uYXZpZ2F0aW9uX2JhY2tncm91bmRfY29sb3JfYm90dG9tIjtzOjY6IjNlNDM0NyI7czoyNzoidGhlbWVfbmF2aWdhdGlvbl90ZXh0X2NvbG9yIjtzOjY6ImZmZmZmZiI7czozMzoidGhlbWVfbmF2aWdhdGlvbl90ZXh0X2hvdmVyX2NvbG9yIjtzOjY6IjU4NWY2NSI7czozMjoidGhlbWVfc3VibmF2aWdhdGlvbl9iZ19jb2xvcl90b3AiO3M6NjoiZWRlZGVkIjtzOjM1OiJ0aGVtZV9zdWJuYXZpZ2F0aW9uX2JnX2NvbG9yX2JvdHRvbSI7czo2OiJlZGVkZWQiO3M6MzA6InRoZW1lX3N1Ym5hdmlnYXRpb25fdGV4dF9jb2xvciI7czo2OiI3NTdiODIiO3M6Mzc6InRoZW1lX3N1Ym5hdmlnYXRpb25fdGV4dF9hY3RpdmVfY29sb3IiO3M6NjoiMzkzYzQwIjtzOjMzOiJ0aGVtZV93aWRnZXRfaGVhZGluZ19iZ19jb2xvcl90b3AiO3M6NjoiZWZlZmVmIjtzOjM2OiJ0aGVtZV93aWRnZXRfaGVhZGluZ19iZ19jb2xvcl9ib3R0b20iO3M6NjoiZWZlZmVmIjtzOjM4OiJ0aGVtZV93aWRnZXRfaWNvbl9oZWFkaW5nX2JnX2NvbG9yX3RvcCI7czo2OiJkZWRlZGUiO3M6NDE6InRoZW1lX3dpZGdldF9pY29uX2hlYWRpbmdfYmdfY29sb3JfYm90dG9tIjtzOjY6ImRlZGVkZSI7czoyMDoidGhlbWVfYm94X3RleHRfY29sb3IiO3M6NjoiNjI2OTcwIjtzOjE3OiJ0aGVtZV90ZXh0X3NoYWRvdyI7czo2OiJmZmZmZmYiO3M6MjQ6InRoZW1lX2FjdGlvbnNfdGV4dF9jb2xvciI7czo2OiIwZTYyOTIiO3M6MjQ6InRoZW1lX2hpZ2hsaWdodF9iZ19jb2xvciI7czo2OiJlY2Y3ZmYiO3M6MjI6InRoZW1lX2JveF9zaGFkb3dfY29sb3IiO3M6MTE6InRyYW5zcGFyZW50Ijt9czo4OiJsb2dvX3VybCI7czowOiIiO30='),
(26, NULL, 'FIVE', 'client', 'YToyOntzOjY6ImNvbG9ycyI7YTo2MDp7czoyNToidGhlbWVfaGVhZGVyX2JnX2NvbG9yX3RvcCI7czo2OiJmZmZmZmYiO3M6Mjg6InRoZW1lX2hlYWRlcl9iZ19jb2xvcl9ib3R0b20iO3M6NjoiZmZmZmZmIjtzOjM3OiJ0aGVtZV9wYWdlX3RpdGxlX2JhY2tncm91bmRfY29sb3JfdG9wIjtzOjY6ImY3ZjlmYiI7czo0MDoidGhlbWVfcGFnZV90aXRsZV9iYWNrZ3JvdW5kX2NvbG9yX2JvdHRvbSI7czo2OiJmOWY5ZmIiO3M6Mjc6InRoZW1lX3BhZ2VfdGl0bGVfdGV4dF9jb2xvciI7czo2OiIyMzI2MjkiO3M6Mzc6InRoZW1lX25hdmlnYXRpb25fYmFja2dyb3VuZF9jb2xvcl90b3AiO3M6NjoiMmUzMzM4IjtzOjQwOiJ0aGVtZV9uYXZpZ2F0aW9uX2JhY2tncm91bmRfY29sb3JfYm90dG9tIjtzOjY6IjJlMzMzOCI7czoyNzoidGhlbWVfbmF2aWdhdGlvbl90ZXh0X2NvbG9yIjtzOjY6ImQ4ZGJkZSI7czozNDoidGhlbWVfbmF2aWdhdGlvbl90ZXh0X2FjdGl2ZV9jb2xvciI7czo2OiJmYmZjZmQiO3M6Mjc6InRoZW1lX3BhZ2VfYmFja2dyb3VuZF9jb2xvciI7czo2OiJmZmZmZmYiO3M6Mzk6InRoZW1lX3BhbmVsX2hlYWRlcl9iYWNrZ3JvdW5kX2NvbG9yX3RvcCI7czo2OiIyZTMzMzgiO3M6NDI6InRoZW1lX3BhbmVsX2hlYWRlcl9iYWNrZ3JvdW5kX2NvbG9yX2JvdHRvbSI7czo2OiIyZTMzMzgiO3M6Mjk6InRoZW1lX3BhbmVsX2hlYWRlcl90ZXh0X2NvbG9yIjtzOjY6ImYyZjJmMiI7czoxNjoidGhlbWVfbGlua19jb2xvciI7czo2OiIwMDc0YjIiO3M6MjU6InRoZW1lX2xpbmtfc2V0dGluZ3NfY29sb3IiO3M6NjoiNGY0ZjRmIjtzOjI3OiJ0aGVtZV9oaWdobGlnaHRfaG92ZXJfY29sb3IiO3M6NjoiZDFlY2YxIjtzOjQxOiJ0aGVtZV9oaWdobGlnaHRfbmF2aWdhdGlvbl90ZXh0X2NvbG9yX3RvcCI7czo2OiJlYmViZWIiO3M6NDc6InRoZW1lX2hpZ2hsaWdodF9uYXZpZ2F0aW9uX2hvdmVyX3RleHRfY29sb3JfdG9wIjtzOjY6ImZmZmZmZiI7czozMDoidGhlbWVfcHJpbWFyeV9hbGVydF90ZXh0X2NvbG9yIjtzOjY6IjAwNDA4NSI7czozNjoidGhlbWVfcHJpbWFyeV9hbGVydF9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6ImNjZTVmZiI7czozMjoidGhlbWVfcHJpbWFyeV9hbGVydF9ib3JkZXJfY29sb3IiO3M6NjoiYjhkYWZmIjtzOjMyOiJ0aGVtZV9zZWNvbmRhcnlfYWxlcnRfdGV4dF9jb2xvciI7czo2OiIzODNkNDEiO3M6Mzg6InRoZW1lX3NlY29uZGFyeV9hbGVydF9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6ImUyZTNlNSI7czozNDoidGhlbWVfc2Vjb25kYXJ5X2FsZXJ0X2JvcmRlcl9jb2xvciI7czo2OiJkNmQ4ZGIiO3M6MzA6InRoZW1lX3N1Y2Nlc3NfYWxlcnRfdGV4dF9jb2xvciI7czo2OiIxNTU3MjUiO3M6MzY6InRoZW1lX3N1Y2Nlc3NfYWxlcnRfYmFja2dyb3VuZF9jb2xvciI7czo2OiJkNGVkZGEiO3M6MzI6InRoZW1lX3N1Y2Nlc3NfYWxlcnRfYm9yZGVyX2NvbG9yIjtzOjY6ImMzZTZjYiI7czoyNzoidGhlbWVfaW5mb19hbGVydF90ZXh0X2NvbG9yIjtzOjY6IjBjNTM2MCI7czozMzoidGhlbWVfaW5mb19hbGVydF9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6ImQxZWNmMSI7czoyOToidGhlbWVfaW5mb19hbGVydF9ib3JkZXJfY29sb3IiO3M6NjoiYmVlNWViIjtzOjMwOiJ0aGVtZV93YXJuaW5nX2FsZXJ0X3RleHRfY29sb3IiO3M6NjoiODU2NTA0IjtzOjM2OiJ0aGVtZV93YXJuaW5nX2FsZXJ0X2JhY2tncm91bmRfY29sb3IiO3M6NjoiZmZmM2NkIjtzOjMyOiJ0aGVtZV93YXJuaW5nX2FsZXJ0X2JvcmRlcl9jb2xvciI7czo2OiJmZmVlYmEiO3M6Mjk6InRoZW1lX2Rhbmdlcl9hbGVydF90ZXh0X2NvbG9yIjtzOjY6IjcyMWMyNSI7czozNToidGhlbWVfZGFuZ2VyX2FsZXJ0X2JhY2tncm91bmRfY29sb3IiO3M6NjoiZjhkN2RhIjtzOjMxOiJ0aGVtZV9kYW5nZXJfYWxlcnRfYm9yZGVyX2NvbG9yIjtzOjY6ImY1YzZjYiI7czoyODoidGhlbWVfbGlnaHRfYWxlcnRfdGV4dF9jb2xvciI7czo2OiI4MTgxODIiO3M6MzQ6InRoZW1lX2xpZ2h0X2FsZXJ0X2JhY2tncm91bmRfY29sb3IiO3M6NjoiZmVmZWZlIjtzOjMwOiJ0aGVtZV9saWdodF9hbGVydF9ib3JkZXJfY29sb3IiO3M6NjoiZmRmZGZlIjtzOjMxOiJ0aGVtZV9wcmltYXJ5X2J1dHRvbl90ZXh0X2NvbG9yIjtzOjY6ImZmZmZmZiI7czozNzoidGhlbWVfcHJpbWFyeV9idXR0b25fYmFja2dyb3VuZF9jb2xvciI7czo2OiIwMDdiZmYiO3M6MzI6InRoZW1lX3ByaW1hcnlfYnV0dG9uX2hvdmVyX2NvbG9yIjtzOjY6IjAwNjlkOSI7czozMzoidGhlbWVfc2Vjb25kYXJ5X2J1dHRvbl90ZXh0X2NvbG9yIjtzOjY6ImZmZmZmZiI7czozOToidGhlbWVfc2Vjb25kYXJ5X2J1dHRvbl9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6IjZjNzU3ZCI7czozNDoidGhlbWVfc2Vjb25kYXJ5X2J1dHRvbl9ob3Zlcl9jb2xvciI7czo2OiI1NDViNjIiO3M6MzE6InRoZW1lX3N1Y2Nlc3NfYnV0dG9uX3RleHRfY29sb3IiO3M6NjoiZmZmZmZmIjtzOjM3OiJ0aGVtZV9zdWNjZXNzX2J1dHRvbl9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6IjI4YTc0NiI7czozMjoidGhlbWVfc3VjY2Vzc19idXR0b25faG92ZXJfY29sb3IiO3M6NjoiMjE4ODM4IjtzOjI4OiJ0aGVtZV9pbmZvX2J1dHRvbl90ZXh0X2NvbG9yIjtzOjY6ImZmZmZmZiI7czozNDoidGhlbWVfaW5mb19idXR0b25fYmFja2dyb3VuZF9jb2xvciI7czo2OiIxN2EzYjgiO3M6Mjk6InRoZW1lX2luZm9fYnV0dG9uX2hvdmVyX2NvbG9yIjtzOjY6IjEzODU5NiI7czozMToidGhlbWVfd2FybmluZ19idXR0b25fdGV4dF9jb2xvciI7czo2OiJmZmZmZmYiO3M6Mzc6InRoZW1lX3dhcm5pbmdfYnV0dG9uX2JhY2tncm91bmRfY29sb3IiO3M6NjoiZmZjMTA3IjtzOjMyOiJ0aGVtZV93YXJuaW5nX2J1dHRvbl9ob3Zlcl9jb2xvciI7czo2OiJlMGE4MDAiO3M6MzA6InRoZW1lX2Rhbmdlcl9idXR0b25fdGV4dF9jb2xvciI7czo2OiJmZmZmZmYiO3M6MzY6InRoZW1lX2Rhbmdlcl9idXR0b25fYmFja2dyb3VuZF9jb2xvciI7czo2OiJkYzM1NDUiO3M6MzE6InRoZW1lX2Rhbmdlcl9idXR0b25faG92ZXJfY29sb3IiO3M6NjoiYzgyMzM0IjtzOjI5OiJ0aGVtZV9saWdodF9idXR0b25fdGV4dF9jb2xvciI7czo2OiIyMTI1MjkiO3M6MzU6InRoZW1lX2xpZ2h0X2J1dHRvbl9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6ImZmZmZmZiI7czozMDoidGhlbWVfbGlnaHRfYnV0dG9uX2hvdmVyX2NvbG9yIjtzOjY6ImUyZTZlYSI7fXM6ODoibG9nb191cmwiO3M6MDoiIjt9'),
(27, 1, 'FIVE Light', 'admin', 'YToyOntzOjY6ImNvbG9ycyI7YToyMDp7czoyNToidGhlbWVfaGVhZGVyX2JnX2NvbG9yX3RvcCI7czo2OiJmZmZmZmYiO3M6Mjg6InRoZW1lX2hlYWRlcl9iZ19jb2xvcl9ib3R0b20iO3M6NjoiZmZmZmZmIjtzOjIzOiJ0aGVtZV9oZWFkZXJfdGV4dF9jb2xvciI7czo2OiIzZDNkM2QiO3M6Mzc6InRoZW1lX25hdmlnYXRpb25fYmFja2dyb3VuZF9jb2xvcl90b3AiO3M6NjoiM2U0MzQ3IjtzOjQwOiJ0aGVtZV9uYXZpZ2F0aW9uX2JhY2tncm91bmRfY29sb3JfYm90dG9tIjtzOjY6IjNlNDM0NyI7czoyNzoidGhlbWVfbmF2aWdhdGlvbl90ZXh0X2NvbG9yIjtzOjY6ImZmZmZmZiI7czozMzoidGhlbWVfbmF2aWdhdGlvbl90ZXh0X2hvdmVyX2NvbG9yIjtzOjY6IjU4NWY2NSI7czozMjoidGhlbWVfc3VibmF2aWdhdGlvbl9iZ19jb2xvcl90b3AiO3M6NjoiZWRlZGVkIjtzOjM1OiJ0aGVtZV9zdWJuYXZpZ2F0aW9uX2JnX2NvbG9yX2JvdHRvbSI7czo2OiJlZGVkZWQiO3M6MzA6InRoZW1lX3N1Ym5hdmlnYXRpb25fdGV4dF9jb2xvciI7czo2OiI3NTdiODIiO3M6Mzc6InRoZW1lX3N1Ym5hdmlnYXRpb25fdGV4dF9hY3RpdmVfY29sb3IiO3M6NjoiMzkzYzQwIjtzOjMzOiJ0aGVtZV93aWRnZXRfaGVhZGluZ19iZ19jb2xvcl90b3AiO3M6NjoiZWZlZmVmIjtzOjM2OiJ0aGVtZV93aWRnZXRfaGVhZGluZ19iZ19jb2xvcl9ib3R0b20iO3M6NjoiZWZlZmVmIjtzOjM4OiJ0aGVtZV93aWRnZXRfaWNvbl9oZWFkaW5nX2JnX2NvbG9yX3RvcCI7czo2OiJkZWRlZGUiO3M6NDE6InRoZW1lX3dpZGdldF9pY29uX2hlYWRpbmdfYmdfY29sb3JfYm90dG9tIjtzOjY6ImRlZGVkZSI7czoyMDoidGhlbWVfYm94X3RleHRfY29sb3IiO3M6NjoiNjI2OTcwIjtzOjE3OiJ0aGVtZV90ZXh0X3NoYWRvdyI7czo2OiJmZmZmZmYiO3M6MjQ6InRoZW1lX2FjdGlvbnNfdGV4dF9jb2xvciI7czo2OiIxNTdiYjgiO3M6MjQ6InRoZW1lX2hpZ2hsaWdodF9iZ19jb2xvciI7czo2OiJlY2Y3ZmYiO3M6MjI6InRoZW1lX2JveF9zaGFkb3dfY29sb3IiO3M6MTE6InRyYW5zcGFyZW50Ijt9czo4OiJsb2dvX3VybCI7czowOiIiO30='),
(28, 1, 'FOUR', 'admin', 'YToyOntzOjY6ImNvbG9ycyI7YToyMDp7czoyNToidGhlbWVfaGVhZGVyX2JnX2NvbG9yX3RvcCI7czo2OiIzMzMzMzMiO3M6Mjg6InRoZW1lX2hlYWRlcl9iZ19jb2xvcl9ib3R0b20iO3M6NjoiMzMzMzMzIjtzOjIzOiJ0aGVtZV9oZWFkZXJfdGV4dF9jb2xvciI7czo2OiJmZmZmZmYiO3M6Mzc6InRoZW1lX25hdmlnYXRpb25fYmFja2dyb3VuZF9jb2xvcl90b3AiO3M6NjoiNGM0YzRjIjtzOjQwOiJ0aGVtZV9uYXZpZ2F0aW9uX2JhY2tncm91bmRfY29sb3JfYm90dG9tIjtzOjY6IjRjNGM0YyI7czoyNzoidGhlbWVfbmF2aWdhdGlvbl90ZXh0X2NvbG9yIjtzOjY6ImZmZmZmZiI7czozMzoidGhlbWVfbmF2aWdhdGlvbl90ZXh0X2hvdmVyX2NvbG9yIjtzOjY6IjZlNmU2ZSI7czozMjoidGhlbWVfc3VibmF2aWdhdGlvbl9iZ19jb2xvcl90b3AiO3M6NjoiZWFlYWVhIjtzOjM1OiJ0aGVtZV9zdWJuYXZpZ2F0aW9uX2JnX2NvbG9yX2JvdHRvbSI7czo2OiJlYWVhZWEiO3M6MzA6InRoZW1lX3N1Ym5hdmlnYXRpb25fdGV4dF9jb2xvciI7czo2OiI4YzhjOGMiO3M6Mzc6InRoZW1lX3N1Ym5hdmlnYXRpb25fdGV4dF9hY3RpdmVfY29sb3IiO3M6NjoiM2QzZDNkIjtzOjMzOiJ0aGVtZV93aWRnZXRfaGVhZGluZ19iZ19jb2xvcl90b3AiO3M6NjoiZWFlYWVhIjtzOjM2OiJ0aGVtZV93aWRnZXRfaGVhZGluZ19iZ19jb2xvcl9ib3R0b20iO3M6NjoiZWFlYWVhIjtzOjM4OiJ0aGVtZV93aWRnZXRfaWNvbl9oZWFkaW5nX2JnX2NvbG9yX3RvcCI7czo2OiJkMmQyZDIiO3M6NDE6InRoZW1lX3dpZGdldF9pY29uX2hlYWRpbmdfYmdfY29sb3JfYm90dG9tIjtzOjY6ImUyZTFlMSI7czoyMDoidGhlbWVfYm94X3RleHRfY29sb3IiO3M6NjoiNmU2ZTZlIjtzOjE3OiJ0aGVtZV90ZXh0X3NoYWRvdyI7czo2OiJmZmZmZmYiO3M6MjQ6InRoZW1lX2FjdGlvbnNfdGV4dF9jb2xvciI7czo2OiIxNTdiYjgiO3M6MjQ6InRoZW1lX2hpZ2hsaWdodF9iZ19jb2xvciI7czo2OiJlY2Y3ZmYiO3M6MjI6InRoZW1lX2JveF9zaGFkb3dfY29sb3IiO3M6MTE6InRyYW5zcGFyZW50Ijt9czo4OiJsb2dvX3VybCI7czowOiIiO30='),
(29, 1, 'FOUR', 'client', 'YToyOntzOjY6ImNvbG9ycyI7YTo2MDp7czozMDoidGhlbWVfcHJpbWFyeV9hbGVydF90ZXh0X2NvbG9yIjtzOjY6IjAwNDA4NSI7czozNjoidGhlbWVfcHJpbWFyeV9hbGVydF9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6ImNjZTVmZiI7czozMjoidGhlbWVfcHJpbWFyeV9hbGVydF9ib3JkZXJfY29sb3IiO3M6NjoiYjhkYWZmIjtzOjMyOiJ0aGVtZV9zZWNvbmRhcnlfYWxlcnRfdGV4dF9jb2xvciI7czo2OiIzODNkNDEiO3M6Mzg6InRoZW1lX3NlY29uZGFyeV9hbGVydF9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6ImUyZTNlNSI7czozNDoidGhlbWVfc2Vjb25kYXJ5X2FsZXJ0X2JvcmRlcl9jb2xvciI7czo2OiJkNmQ4ZGIiO3M6MzA6InRoZW1lX3N1Y2Nlc3NfYWxlcnRfdGV4dF9jb2xvciI7czo2OiIxNTU3MjQiO3M6MzY6InRoZW1lX3N1Y2Nlc3NfYWxlcnRfYmFja2dyb3VuZF9jb2xvciI7czo2OiJkNGVkZGEiO3M6MzI6InRoZW1lX3N1Y2Nlc3NfYWxlcnRfYm9yZGVyX2NvbG9yIjtzOjY6ImMzZTZjYiI7czoyNzoidGhlbWVfaW5mb19hbGVydF90ZXh0X2NvbG9yIjtzOjY6IjBjNTQ2MCI7czozMzoidGhlbWVfaW5mb19hbGVydF9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6ImQxZWNmMSI7czoyOToidGhlbWVfaW5mb19hbGVydF9ib3JkZXJfY29sb3IiO3M6NjoiYmVlNWViIjtzOjMwOiJ0aGVtZV93YXJuaW5nX2FsZXJ0X3RleHRfY29sb3IiO3M6NjoiODU2NDA0IjtzOjM2OiJ0aGVtZV93YXJuaW5nX2FsZXJ0X2JhY2tncm91bmRfY29sb3IiO3M6NjoiZmZmM2NkIjtzOjMyOiJ0aGVtZV93YXJuaW5nX2FsZXJ0X2JvcmRlcl9jb2xvciI7czo2OiJmZmVlYmEiO3M6Mjk6InRoZW1lX2Rhbmdlcl9hbGVydF90ZXh0X2NvbG9yIjtzOjY6IjcyMWMyNCI7czozNToidGhlbWVfZGFuZ2VyX2FsZXJ0X2JhY2tncm91bmRfY29sb3IiO3M6NjoiZjhkN2RhIjtzOjMxOiJ0aGVtZV9kYW5nZXJfYWxlcnRfYm9yZGVyX2NvbG9yIjtzOjY6ImY1YzZjYiI7czoyODoidGhlbWVfbGlnaHRfYWxlcnRfdGV4dF9jb2xvciI7czo2OiI4MTgxODIiO3M6MzQ6InRoZW1lX2xpZ2h0X2FsZXJ0X2JhY2tncm91bmRfY29sb3IiO3M6NjoiZmVmZWZlIjtzOjMwOiJ0aGVtZV9saWdodF9hbGVydF9ib3JkZXJfY29sb3IiO3M6NjoiZmRmZGZlIjtzOjMxOiJ0aGVtZV9wcmltYXJ5X2J1dHRvbl90ZXh0X2NvbG9yIjtzOjY6ImZmZmZmZiI7czozNzoidGhlbWVfcHJpbWFyeV9idXR0b25fYmFja2dyb3VuZF9jb2xvciI7czo2OiIwMDdiZmYiO3M6MzI6InRoZW1lX3ByaW1hcnlfYnV0dG9uX2hvdmVyX2NvbG9yIjtzOjY6IjAwNjlkOSI7czozMzoidGhlbWVfc2Vjb25kYXJ5X2J1dHRvbl90ZXh0X2NvbG9yIjtzOjY6ImZmZmZmZiI7czozOToidGhlbWVfc2Vjb25kYXJ5X2J1dHRvbl9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6IjZjNzU3ZCI7czozNDoidGhlbWVfc2Vjb25kYXJ5X2J1dHRvbl9ob3Zlcl9jb2xvciI7czo2OiI1YTYyNjgiO3M6MzE6InRoZW1lX3N1Y2Nlc3NfYnV0dG9uX3RleHRfY29sb3IiO3M6NjoiZmZmZmZmIjtzOjM3OiJ0aGVtZV9zdWNjZXNzX2J1dHRvbl9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6IjI4YTc0NSI7czozMjoidGhlbWVfc3VjY2Vzc19idXR0b25faG92ZXJfY29sb3IiO3M6NjoiMjE4ODM4IjtzOjI4OiJ0aGVtZV9pbmZvX2J1dHRvbl90ZXh0X2NvbG9yIjtzOjY6ImZmZmZmZiI7czozNDoidGhlbWVfaW5mb19idXR0b25fYmFja2dyb3VuZF9jb2xvciI7czo2OiIxN2EyYjgiO3M6Mjk6InRoZW1lX2luZm9fYnV0dG9uX2hvdmVyX2NvbG9yIjtzOjY6IjEzODQ5NiI7czozMToidGhlbWVfd2FybmluZ19idXR0b25fdGV4dF9jb2xvciI7czo2OiIyMTI1MjkiO3M6Mzc6InRoZW1lX3dhcm5pbmdfYnV0dG9uX2JhY2tncm91bmRfY29sb3IiO3M6NjoiZmZjMTA3IjtzOjMyOiJ0aGVtZV93YXJuaW5nX2J1dHRvbl9ob3Zlcl9jb2xvciI7czo2OiJlMGE4MDAiO3M6MzA6InRoZW1lX2Rhbmdlcl9idXR0b25fdGV4dF9jb2xvciI7czo2OiJmZmZmZmYiO3M6MzY6InRoZW1lX2Rhbmdlcl9idXR0b25fYmFja2dyb3VuZF9jb2xvciI7czo2OiJkYzM1NDUiO3M6MzE6InRoZW1lX2Rhbmdlcl9idXR0b25faG92ZXJfY29sb3IiO3M6NjoiYzgyMzMzIjtzOjI5OiJ0aGVtZV9saWdodF9idXR0b25fdGV4dF9jb2xvciI7czo2OiIyMTI1MjkiO3M6MzU6InRoZW1lX2xpZ2h0X2J1dHRvbl9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6ImZmZmZmZiI7czozMDoidGhlbWVfbGlnaHRfYnV0dG9uX2hvdmVyX2NvbG9yIjtzOjY6ImUyZTZlYSI7czoyNToidGhlbWVfaGVhZGVyX2JnX2NvbG9yX3RvcCI7czo2OiJmZmZmZmYiO3M6Mjg6InRoZW1lX2hlYWRlcl9iZ19jb2xvcl9ib3R0b20iO3M6NjoiZmZmZmZmIjtzOjM3OiJ0aGVtZV9wYWdlX3RpdGxlX2JhY2tncm91bmRfY29sb3JfdG9wIjtzOjY6ImY1ZjVmNSI7czo0MDoidGhlbWVfcGFnZV90aXRsZV9iYWNrZ3JvdW5kX2NvbG9yX2JvdHRvbSI7czo2OiJmMGYwZjAiO3M6Mjc6InRoZW1lX3BhZ2VfdGl0bGVfdGV4dF9jb2xvciI7czo2OiIzYTNhM2EiO3M6Mzc6InRoZW1lX25hdmlnYXRpb25fYmFja2dyb3VuZF9jb2xvcl90b3AiO3M6NjoiNGY0ZjRmIjtzOjQwOiJ0aGVtZV9uYXZpZ2F0aW9uX2JhY2tncm91bmRfY29sb3JfYm90dG9tIjtzOjY6IjRmNGY0ZiI7czoyNzoidGhlbWVfbmF2aWdhdGlvbl90ZXh0X2NvbG9yIjtzOjY6ImViZWJlYiI7czozNDoidGhlbWVfbmF2aWdhdGlvbl90ZXh0X2FjdGl2ZV9jb2xvciI7czo2OiJmZmZmZmYiO3M6Mjc6InRoZW1lX3BhZ2VfYmFja2dyb3VuZF9jb2xvciI7czo2OiJmZmZmZmYiO3M6Mzk6InRoZW1lX3BhbmVsX2hlYWRlcl9iYWNrZ3JvdW5kX2NvbG9yX3RvcCI7czo2OiI0ZjRmNGYiO3M6NDI6InRoZW1lX3BhbmVsX2hlYWRlcl9iYWNrZ3JvdW5kX2NvbG9yX2JvdHRvbSI7czo2OiI0ZjRmNGYiO3M6Mjk6InRoZW1lX3BhbmVsX2hlYWRlcl90ZXh0X2NvbG9yIjtzOjY6ImYyZjJmMiI7czoxNjoidGhlbWVfbGlua19jb2xvciI7czo2OiIwMDc0YjIiO3M6MjU6InRoZW1lX2xpbmtfc2V0dGluZ3NfY29sb3IiO3M6NjoiNGY0ZjRmIjtzOjI3OiJ0aGVtZV9oaWdobGlnaHRfaG92ZXJfY29sb3IiO3M6NjoiZTBmNWZmIjtzOjQxOiJ0aGVtZV9oaWdobGlnaHRfbmF2aWdhdGlvbl90ZXh0X2NvbG9yX3RvcCI7czo2OiI0ZjRmNGYiO3M6NDc6InRoZW1lX2hpZ2hsaWdodF9uYXZpZ2F0aW9uX2hvdmVyX3RleHRfY29sb3JfdG9wIjtzOjY6IjhmOGY4ZiI7fXM6ODoibG9nb191cmwiO3M6MDoiIjt9');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(19,4) NOT NULL DEFAULT 0.0000,
  `currency` char(3) NOT NULL DEFAULT 'USD',
  `type` enum('cc','ach','other') NOT NULL DEFAULT 'other',
  `transaction_type_id` int(10) UNSIGNED DEFAULT NULL,
  `account_id` int(10) UNSIGNED DEFAULT NULL,
  `gateway_id` int(10) UNSIGNED DEFAULT NULL,
  `transaction_id` varchar(128) DEFAULT NULL,
  `parent_transaction_id` varchar(128) DEFAULT NULL,
  `reference_id` varchar(128) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `status` enum('approved','declined','void','error','pending','refunded','returned') NOT NULL DEFAULT 'approved',
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_applied`
--

CREATE TABLE `transaction_applied` (
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `invoice_id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(19,4) NOT NULL DEFAULT 0.0000,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_types`
--

CREATE TABLE `transaction_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(32) NOT NULL,
  `type` enum('debit','credit') NOT NULL DEFAULT 'debit',
  `is_lang` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `transaction_types`
--

INSERT INTO `transaction_types` (`id`, `name`, `type`, `is_lang`) VALUES
(1, 'cash', 'debit', 1),
(2, 'check', 'debit', 1),
(3, 'money_order', 'debit', 1),
(4, 'in_house_credit', 'credit', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(64) NOT NULL,
  `two_factor_mode` enum('none','motp','totp') NOT NULL DEFAULT 'none',
  `two_factor_key` varchar(128) DEFAULT NULL,
  `two_factor_pin` varchar(128) DEFAULT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `two_factor_mode`, `two_factor_key`, `two_factor_pin`, `date_added`) VALUES
(1, 'admin', '$2y$12$y2W2DJ6MVokEfMwEfUaaaut1j2ePo4HcOo/jnp5q7wpBoNTVDzb/i', 'none', NULL, NULL, '2022-11-23 16:36:25');

-- --------------------------------------------------------

--
-- Table structure for table `user_otps`
--

CREATE TABLE `user_otps` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `otp` varchar(16) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts_ach`
--
ALTER TABLE `accounts_ach`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contact_id` (`contact_id`),
  ADD KEY `gateway_id` (`gateway_id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `accounts_cc`
--
ALTER TABLE `accounts_cc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contact_id` (`contact_id`),
  ADD KEY `gateway_id` (`gateway_id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `acl_acl`
--
ALTER TABLE `acl_acl`
  ADD PRIMARY KEY (`aro_id`,`aco_id`,`action`);

--
-- Indexes for table `acl_aco`
--
ALTER TABLE `acl_aco`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `alias` (`alias`);

--
-- Indexes for table `acl_aro`
--
ALTER TABLE `acl_aro`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `alias` (`alias`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `actions`
--
ALTER TABLE `actions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `url` (`url`,`location`,`company_id`),
  ADD KEY `location` (`location`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `plugin_id` (`plugin_id`),
  ADD KEY `enabled` (`enabled`),
  ADD KEY `editable` (`editable`);

--
-- Indexes for table `api_keys`
--
ALTER TABLE `api_keys`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `company_id` (`company_id`,`user`);

--
-- Indexes for table `billing_overview_settings`
--
ALTER TABLE `billing_overview_settings`
  ADD PRIMARY KEY (`staff_id`,`company_id`,`key`);

--
-- Indexes for table `calendar_events`
--
ALTER TABLE `calendar_events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `shared` (`shared`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `primary_account_id` (`primary_account_id`),
  ADD KEY `id_format` (`id_format`),
  ADD KEY `id_value` (`id_value`),
  ADD KEY `status` (`status`),
  ADD KEY `client_group_id` (`client_group_id`);

--
-- Indexes for table `client_account`
--
ALTER TABLE `client_account`
  ADD PRIMARY KEY (`client_id`),
  ADD KEY `account_id` (`account_id`,`type`);

--
-- Indexes for table `client_fields`
--
ALTER TABLE `client_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_idclient_group_id` (`client_group_id`);

--
-- Indexes for table `client_groups`
--
ALTER TABLE `client_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `client_group_settings`
--
ALTER TABLE `client_group_settings`
  ADD PRIMARY KEY (`key`,`client_group_id`);

--
-- Indexes for table `client_notes`
--
ALTER TABLE `client_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `stickied` (`stickied`);

--
-- Indexes for table `client_packages`
--
ALTER TABLE `client_packages`
  ADD PRIMARY KEY (`client_id`,`package_id`);

--
-- Indexes for table `client_settings`
--
ALTER TABLE `client_settings`
  ADD PRIMARY KEY (`key`,`client_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `client_values`
--
ALTER TABLE `client_values`
  ADD PRIMARY KEY (`client_field_id`,`client_id`);

--
-- Indexes for table `cms_pages`
--
ALTER TABLE `cms_pages`
  ADD PRIMARY KEY (`uri`,`company_id`,`lang`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `hostname` (`hostname`);

--
-- Indexes for table `company_settings`
--
ALTER TABLE `company_settings`
  ADD PRIMARY KEY (`key`,`company_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `contact_type` (`contact_type`),
  ADD KEY `client_id` (`client_id`,`contact_type`);

--
-- Indexes for table `contact_numbers`
--
ALTER TABLE `contact_numbers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contact_id` (`contact_id`);

--
-- Indexes for table `contact_permissions`
--
ALTER TABLE `contact_permissions`
  ADD PRIMARY KEY (`contact_id`,`area`);

--
-- Indexes for table `contact_types`
--
ALTER TABLE `contact_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`alpha2`),
  ADD UNIQUE KEY `alpha3` (`alpha3`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`,`company_id`);

--
-- Indexes for table `coupon_amounts`
--
ALTER TABLE `coupon_amounts`
  ADD PRIMARY KEY (`coupon_id`,`currency`);

--
-- Indexes for table `coupon_packages`
--
ALTER TABLE `coupon_packages`
  ADD PRIMARY KEY (`coupon_id`,`package_id`);

--
-- Indexes for table `coupon_terms`
--
ALTER TABLE `coupon_terms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupon_id` (`coupon_id`,`period`,`term`);

--
-- Indexes for table `cron_tasks`
--
ALTER TABLE `cron_tasks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`,`task_type`,`dir`);

--
-- Indexes for table `cron_task_runs`
--
ALTER TABLE `cron_task_runs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_id` (`task_id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`code`,`company_id`);

--
-- Indexes for table `data_feeds`
--
ALTER TABLE `data_feeds`
  ADD PRIMARY KEY (`feed`),
  ADD KEY `dir` (`dir`,`class`);

--
-- Indexes for table `data_feed_endpoints`
--
ALTER TABLE `data_feed_endpoints`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`,`feed`,`endpoint`);

--
-- Indexes for table `domains_domains`
--
ALTER TABLE `domains_domains`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `service_id` (`service_id`);

--
-- Indexes for table `domains_packages`
--
ALTER TABLE `domains_packages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tld_id` (`tld_id`,`package_id`);

--
-- Indexes for table `domains_tlds`
--
ALTER TABLE `domains_tlds`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tld` (`tld`,`company_id`);

--
-- Indexes for table `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_group_id` (`email_group_id`,`company_id`,`lang`);

--
-- Indexes for table `email_groups`
--
ALTER TABLE `email_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `action` (`action`);

--
-- Indexes for table `email_signatures`
--
ALTER TABLE `email_signatures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `email_verifications`
--
ALTER TABLE `email_verifications`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `contact_id` (`contact_id`,`email`);

--
-- Indexes for table `feed_reader_articles`
--
ALTER TABLE `feed_reader_articles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `feed_id` (`feed_id`,`guid`);

--
-- Indexes for table `feed_reader_defaults`
--
ALTER TABLE `feed_reader_defaults`
  ADD PRIMARY KEY (`feed_id`,`company_id`);

--
-- Indexes for table `feed_reader_feeds`
--
ALTER TABLE `feed_reader_feeds`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `url` (`url`);

--
-- Indexes for table `feed_reader_subscribers`
--
ALTER TABLE `feed_reader_subscribers`
  ADD PRIMARY KEY (`feed_id`,`company_id`,`staff_id`);

--
-- Indexes for table `gateways`
--
ALTER TABLE `gateways`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `company_id` (`company_id`,`class`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `gateway_currencies`
--
ALTER TABLE `gateway_currencies`
  ADD PRIMARY KEY (`gateway_id`,`currency`);

--
-- Indexes for table `gateway_meta`
--
ALTER TABLE `gateway_meta`
  ADD PRIMARY KEY (`gateway_id`,`key`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`),
  ADD KEY `id_value` (`id_value`),
  ADD KEY `id_format` (`id_format`),
  ADD KEY `date_billed` (`date_billed`,`status`),
  ADD KEY `client_id` (`client_id`,`status`,`date_billed`,`date_closed`);

--
-- Indexes for table `invoices_recur`
--
ALTER TABLE `invoices_recur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`,`date_renews`);

--
-- Indexes for table `invoices_recur_created`
--
ALTER TABLE `invoices_recur_created`
  ADD PRIMARY KEY (`invoice_recur_id`,`invoice_id`);

--
-- Indexes for table `invoice_delivery`
--
ALTER TABLE `invoice_delivery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_id` (`invoice_id`);

--
-- Indexes for table `invoice_fields`
--
ALTER TABLE `invoice_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_group_id` (`client_group_id`);

--
-- Indexes for table `invoice_late_fees`
--
ALTER TABLE `invoice_late_fees`
  ADD PRIMARY KEY (`invoice_id`,`invoice_line_id`);

--
-- Indexes for table `invoice_lines`
--
ALTER TABLE `invoice_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_id` (`invoice_id`),
  ADD KEY `service_id` (`service_id`);

--
-- Indexes for table `invoice_line_taxes`
--
ALTER TABLE `invoice_line_taxes`
  ADD PRIMARY KEY (`line_id`,`tax_id`);

--
-- Indexes for table `invoice_meta`
--
ALTER TABLE `invoice_meta`
  ADD PRIMARY KEY (`invoice_id`,`key`);

--
-- Indexes for table `invoice_recur_delivery`
--
ALTER TABLE `invoice_recur_delivery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_recur_id` (`invoice_recur_id`);

--
-- Indexes for table `invoice_recur_lines`
--
ALTER TABLE `invoice_recur_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_id` (`invoice_recur_id`);

--
-- Indexes for table `invoice_recur_values`
--
ALTER TABLE `invoice_recur_values`
  ADD PRIMARY KEY (`invoice_field_id`,`invoice_recur_id`);

--
-- Indexes for table `invoice_values`
--
ALTER TABLE `invoice_values`
  ADD PRIMARY KEY (`invoice_field_id`,`invoice_id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`code`,`company_id`);

--
-- Indexes for table `log_account_access`
--
ALTER TABLE `log_account_access`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `account_id` (`account_id`);

--
-- Indexes for table `log_client_settings`
--
ALTER TABLE `log_client_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `by_user_id` (`by_user_id`,`ip_address`),
  ADD KEY `ip_address` (`ip_address`),
  ADD KEY `date_changed` (`date_changed`);

--
-- Indexes for table `log_contacts`
--
ALTER TABLE `log_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contact_id` (`contact_id`);

--
-- Indexes for table `log_cron`
--
ALTER TABLE `log_cron`
  ADD PRIMARY KEY (`run_id`,`group`,`event`);

--
-- Indexes for table `log_emails`
--
ALTER TABLE `log_emails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `from_staff_id` (`from_staff_id`),
  ADD KEY `to_client_id` (`to_client_id`,`date_sent`),
  ADD KEY `sent` (`sent`);

--
-- Indexes for table `log_gateways`
--
ALTER TABLE `log_gateways`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `gateway_id` (`gateway_id`),
  ADD KEY `group` (`group`);

--
-- Indexes for table `log_messenger`
--
ALTER TABLE `log_messenger`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messenger_id` (`messenger_id`,`to_user_id`);

--
-- Indexes for table `log_modules`
--
ALTER TABLE `log_modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `module_id` (`module_id`),
  ADD KEY `group` (`group`);

--
-- Indexes for table `log_services`
--
ALTER TABLE `log_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_id` (`service_id`,`status`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indexes for table `log_transactions`
--
ALTER TABLE `log_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `transaction_id` (`transaction_id`);

--
-- Indexes for table `log_users`
--
ALTER TABLE `log_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `result` (`result`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `message_group_id` (`message_group_id`);

--
-- Indexes for table `message_content`
--
ALTER TABLE `message_content`
  ADD PRIMARY KEY (`message_id`,`lang`);

--
-- Indexes for table `message_groups`
--
ALTER TABLE `message_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `action` (`action`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `messengers`
--
ALTER TABLE `messengers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `company_id` (`company_id`,`dir`);

--
-- Indexes for table `messenger_meta`
--
ALTER TABLE `messenger_meta`
  ADD PRIMARY KEY (`messenger_id`,`key`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `company_id` (`company_id`,`class`);

--
-- Indexes for table `module_client_meta`
--
ALTER TABLE `module_client_meta`
  ADD PRIMARY KEY (`client_id`,`key`,`module_id`,`module_row_id`);

--
-- Indexes for table `module_groups`
--
ALTER TABLE `module_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module_id` (`module_id`);

--
-- Indexes for table `module_meta`
--
ALTER TABLE `module_meta`
  ADD PRIMARY KEY (`module_id`,`key`);

--
-- Indexes for table `module_rows`
--
ALTER TABLE `module_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module_id` (`module_id`);

--
-- Indexes for table `module_row_groups`
--
ALTER TABLE `module_row_groups`
  ADD PRIMARY KEY (`module_group_id`,`module_row_id`);

--
-- Indexes for table `module_row_meta`
--
ALTER TABLE `module_row_meta`
  ADD PRIMARY KEY (`module_row_id`,`key`);

--
-- Indexes for table `module_types`
--
ALTER TABLE `module_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `navigation_items`
--
ALTER TABLE `navigation_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `action_id` (`action_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_number` (`order_number`),
  ADD KEY `order_form_id` (`order_form_id`),
  ADD KEY `invoice_id` (`invoice_id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `order_affiliates`
--
ALTER TABLE `order_affiliates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `client_id` (`client_id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `status` (`status`,`client_id`);

--
-- Indexes for table `order_affiliate_company_settings`
--
ALTER TABLE `order_affiliate_company_settings`
  ADD PRIMARY KEY (`company_id`,`key`);

--
-- Indexes for table `order_affiliate_payment_methods`
--
ALTER TABLE `order_affiliate_payment_methods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `order_affiliate_payment_method_names`
--
ALTER TABLE `order_affiliate_payment_method_names`
  ADD PRIMARY KEY (`payment_method_id`,`lang`);

--
-- Indexes for table `order_affiliate_payouts`
--
ALTER TABLE `order_affiliate_payouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `affiliate_id` (`affiliate_id`,`status`),
  ADD KEY `payment_method_id` (`payment_method_id`);

--
-- Indexes for table `order_affiliate_referrals`
--
ALTER TABLE `order_affiliate_referrals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `affiliate_id` (`affiliate_id`,`date_added`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `order_affiliate_settings`
--
ALTER TABLE `order_affiliate_settings`
  ADD PRIMARY KEY (`affiliate_id`,`key`);

--
-- Indexes for table `order_affiliate_statistics`
--
ALTER TABLE `order_affiliate_statistics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_forms`
--
ALTER TABLE `order_forms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `label` (`label`,`company_id`),
  ADD KEY `status` (`status`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `order_form_currencies`
--
ALTER TABLE `order_form_currencies`
  ADD PRIMARY KEY (`order_form_id`,`currency`);

--
-- Indexes for table `order_form_gateways`
--
ALTER TABLE `order_form_gateways`
  ADD PRIMARY KEY (`order_form_id`,`gateway_id`);

--
-- Indexes for table `order_form_groups`
--
ALTER TABLE `order_form_groups`
  ADD PRIMARY KEY (`order_form_id`,`package_group_id`);

--
-- Indexes for table `order_form_meta`
--
ALTER TABLE `order_form_meta`
  ADD PRIMARY KEY (`order_form_id`,`key`);

--
-- Indexes for table `order_services`
--
ALTER TABLE `order_services`
  ADD PRIMARY KEY (`order_id`,`service_id`);

--
-- Indexes for table `order_settings`
--
ALTER TABLE `order_settings`
  ADD PRIMARY KEY (`key`,`company_id`);

--
-- Indexes for table `order_staff_settings`
--
ALTER TABLE `order_staff_settings`
  ADD PRIMARY KEY (`staff_id`,`company_id`,`key`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module_id` (`module_id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `module_row` (`module_row`),
  ADD KEY `module_group` (`module_group`),
  ADD KEY `id_value` (`id_value`),
  ADD KEY `id_format` (`id_format`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `package_descriptions`
--
ALTER TABLE `package_descriptions`
  ADD PRIMARY KEY (`package_id`,`lang`);

--
-- Indexes for table `package_emails`
--
ALTER TABLE `package_emails`
  ADD PRIMARY KEY (`package_id`,`lang`);

--
-- Indexes for table `package_group`
--
ALTER TABLE `package_group`
  ADD PRIMARY KEY (`package_id`,`package_group_id`);

--
-- Indexes for table `package_groups`
--
ALTER TABLE `package_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `package_group_descriptions`
--
ALTER TABLE `package_group_descriptions`
  ADD PRIMARY KEY (`package_group_id`,`lang`);

--
-- Indexes for table `package_group_names`
--
ALTER TABLE `package_group_names`
  ADD PRIMARY KEY (`package_group_id`,`lang`);

--
-- Indexes for table `package_group_parents`
--
ALTER TABLE `package_group_parents`
  ADD PRIMARY KEY (`group_id`,`parent_group_id`);

--
-- Indexes for table `package_meta`
--
ALTER TABLE `package_meta`
  ADD PRIMARY KEY (`package_id`,`key`);

--
-- Indexes for table `package_names`
--
ALTER TABLE `package_names`
  ADD PRIMARY KEY (`package_id`,`lang`);

--
-- Indexes for table `package_option`
--
ALTER TABLE `package_option`
  ADD PRIMARY KEY (`package_id`,`option_group_id`);

--
-- Indexes for table `package_options`
--
ALTER TABLE `package_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `package_option_conditions`
--
ALTER TABLE `package_option_conditions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package_option_condition_sets`
--
ALTER TABLE `package_option_condition_sets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package_option_condition_set_values`
--
ALTER TABLE `package_option_condition_set_values`
  ADD PRIMARY KEY (`condition_set_id`,`value_id`);

--
-- Indexes for table `package_option_group`
--
ALTER TABLE `package_option_group`
  ADD PRIMARY KEY (`option_id`,`option_group_id`);

--
-- Indexes for table `package_option_groups`
--
ALTER TABLE `package_option_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `package_option_pricing`
--
ALTER TABLE `package_option_pricing`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `option_value_id` (`option_value_id`,`pricing_id`);

--
-- Indexes for table `package_option_values`
--
ALTER TABLE `package_option_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `option_id` (`option_id`,`status`);

--
-- Indexes for table `package_plugins`
--
ALTER TABLE `package_plugins`
  ADD PRIMARY KEY (`package_id`,`plugin_id`);

--
-- Indexes for table `package_pricing`
--
ALTER TABLE `package_pricing`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `package_id` (`package_id`,`pricing_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`group_id`),
  ADD KEY `plugin_id` (`plugin_id`),
  ADD KEY `alias` (`alias`,`action`);

--
-- Indexes for table `permission_groups`
--
ALTER TABLE `permission_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `level` (`level`,`alias`),
  ADD KEY `plugin_id` (`plugin_id`);

--
-- Indexes for table `plugins`
--
ALTER TABLE `plugins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dir` (`dir`,`company_id`),
  ADD KEY `company_id` (`company_id`,`enabled`,`dir`);

--
-- Indexes for table `plugin_cards`
--
ALTER TABLE `plugin_cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plugin_events`
--
ALTER TABLE `plugin_events`
  ADD PRIMARY KEY (`plugin_id`,`event`),
  ADD KEY `enabled` (`enabled`);

--
-- Indexes for table `pricings`
--
ALTER TABLE `pricings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`,`date_created`);

--
-- Indexes for table `report_fields`
--
ALTER TABLE `report_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `report_id` (`report_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pricing_id` (`pricing_id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `module_row_id` (`module_row_id`),
  ADD KEY `status` (`status`),
  ADD KEY `parent_service_id` (`parent_service_id`),
  ADD KEY `id_format` (`id_format`),
  ADD KEY `id_value` (`id_value`),
  ADD KEY `package_group_id` (`package_group_id`);

--
-- Indexes for table `service_changes`
--
ALTER TABLE `service_changes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `invoice_id` (`invoice_id`),
  ADD KEY `service_id` (`service_id`),
  ADD KEY `status` (`status`,`date_status`);

--
-- Indexes for table `service_fields`
--
ALTER TABLE `service_fields`
  ADD PRIMARY KEY (`service_id`,`key`);

--
-- Indexes for table `service_invoices`
--
ALTER TABLE `service_invoices`
  ADD PRIMARY KEY (`invoice_id`,`service_id`);

--
-- Indexes for table `service_options`
--
ALTER TABLE `service_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_id` (`service_id`),
  ADD KEY `option_pricing_id` (`option_pricing_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expire` (`expire`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `staff_group`
--
ALTER TABLE `staff_group`
  ADD PRIMARY KEY (`staff_id`,`staff_group_id`);

--
-- Indexes for table `staff_groups`
--
ALTER TABLE `staff_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `staff_group_notices`
--
ALTER TABLE `staff_group_notices`
  ADD PRIMARY KEY (`staff_group_id`,`action`);

--
-- Indexes for table `staff_links`
--
ALTER TABLE `staff_links`
  ADD PRIMARY KEY (`staff_id`,`company_id`,`uri`);

--
-- Indexes for table `staff_notices`
--
ALTER TABLE `staff_notices`
  ADD PRIMARY KEY (`staff_group_id`,`staff_id`,`action`);

--
-- Indexes for table `staff_settings`
--
ALTER TABLE `staff_settings`
  ADD PRIMARY KEY (`key`,`staff_id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`country_alpha2`,`code`);

--
-- Indexes for table `support_attachments`
--
ALTER TABLE `support_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reply_id` (`reply_id`);

--
-- Indexes for table `support_departments`
--
ALTER TABLE `support_departments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `status` (`status`,`company_id`);

--
-- Indexes for table `support_department_fields`
--
ALTER TABLE `support_department_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_kb_articles`
--
ALTER TABLE `support_kb_articles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`,`access`);

--
-- Indexes for table `support_kb_article_categories`
--
ALTER TABLE `support_kb_article_categories`
  ADD PRIMARY KEY (`category_id`,`article_id`);

--
-- Indexes for table `support_kb_article_content`
--
ALTER TABLE `support_kb_article_content`
  ADD PRIMARY KEY (`article_id`,`lang`);

--
-- Indexes for table `support_kb_categories`
--
ALTER TABLE `support_kb_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`,`parent_id`,`access`);

--
-- Indexes for table `support_reminders`
--
ALTER TABLE `support_reminders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_replies`
--
ALTER TABLE `support_replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_id` (`ticket_id`,`type`);
ALTER TABLE `support_replies` ADD FULLTEXT KEY `details` (`details`);

--
-- Indexes for table `support_responses`
--
ALTER TABLE `support_responses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `support_response_categories`
--
ALTER TABLE `support_response_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `parent_id` (`parent_id`,`company_id`);

--
-- Indexes for table `support_settings`
--
ALTER TABLE `support_settings`
  ADD PRIMARY KEY (`key`,`company_id`);

--
-- Indexes for table `support_staff_departments`
--
ALTER TABLE `support_staff_departments`
  ADD PRIMARY KEY (`department_id`,`staff_id`);

--
-- Indexes for table `support_staff_schedules`
--
ALTER TABLE `support_staff_schedules`
  ADD PRIMARY KEY (`staff_id`,`company_id`,`day`);

--
-- Indexes for table `support_staff_settings`
--
ALTER TABLE `support_staff_settings`
  ADD PRIMARY KEY (`key`,`company_id`,`staff_id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `code` (`code`),
  ADD KEY `date_added` (`date_added`,`status`),
  ADD KEY `department_id` (`department_id`,`status`);

--
-- Indexes for table `support_ticket_fields`
--
ALTER TABLE `support_ticket_fields`
  ADD PRIMARY KEY (`ticket_id`,`field_id`);

--
-- Indexes for table `system_events`
--
ALTER TABLE `system_events`
  ADD PRIMARY KEY (`event`,`observer`);

--
-- Indexes for table `system_overview_settings`
--
ALTER TABLE `system_overview_settings`
  ADD PRIMARY KEY (`staff_id`,`company_id`,`key`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `country` (`country`,`state`);

--
-- Indexes for table `themes`
--
ALTER TABLE `themes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `reference_id` (`reference_id`),
  ADD KEY `gateway_id` (`gateway_id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `transaction_id` (`transaction_id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `transaction_applied`
--
ALTER TABLE `transaction_applied`
  ADD PRIMARY KEY (`transaction_id`,`invoice_id`),
  ADD KEY `invoice_id` (`invoice_id`);

--
-- Indexes for table `transaction_types`
--
ALTER TABLE `transaction_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `user_otps`
--
ALTER TABLE `user_otps`
  ADD PRIMARY KEY (`user_id`,`otp`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts_ach`
--
ALTER TABLE `accounts_ach`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `accounts_cc`
--
ALTER TABLE `accounts_cc`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `acl_aco`
--
ALTER TABLE `acl_aco`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `acl_aro`
--
ALTER TABLE `acl_aro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `actions`
--
ALTER TABLE `actions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `api_keys`
--
ALTER TABLE `api_keys`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `calendar_events`
--
ALTER TABLE `calendar_events`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_fields`
--
ALTER TABLE `client_fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_groups`
--
ALTER TABLE `client_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `client_notes`
--
ALTER TABLE `client_notes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact_numbers`
--
ALTER TABLE `contact_numbers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact_types`
--
ALTER TABLE `contact_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupon_terms`
--
ALTER TABLE `coupon_terms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cron_tasks`
--
ALTER TABLE `cron_tasks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `cron_task_runs`
--
ALTER TABLE `cron_task_runs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `data_feed_endpoints`
--
ALTER TABLE `data_feed_endpoints`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `domains_domains`
--
ALTER TABLE `domains_domains`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `domains_packages`
--
ALTER TABLE `domains_packages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `domains_tlds`
--
ALTER TABLE `domains_tlds`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `emails`
--
ALTER TABLE `emails`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `email_groups`
--
ALTER TABLE `email_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `email_signatures`
--
ALTER TABLE `email_signatures`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `email_verifications`
--
ALTER TABLE `email_verifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feed_reader_articles`
--
ALTER TABLE `feed_reader_articles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `feed_reader_feeds`
--
ALTER TABLE `feed_reader_feeds`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `gateways`
--
ALTER TABLE `gateways`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gateway_meta`
--
ALTER TABLE `gateway_meta`
  MODIFY `gateway_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices_recur`
--
ALTER TABLE `invoices_recur`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_delivery`
--
ALTER TABLE `invoice_delivery`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_fields`
--
ALTER TABLE `invoice_fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_lines`
--
ALTER TABLE `invoice_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_recur_delivery`
--
ALTER TABLE `invoice_recur_delivery`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_recur_lines`
--
ALTER TABLE `invoice_recur_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_account_access`
--
ALTER TABLE `log_account_access`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_client_settings`
--
ALTER TABLE `log_client_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_contacts`
--
ALTER TABLE `log_contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_emails`
--
ALTER TABLE `log_emails`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_gateways`
--
ALTER TABLE `log_gateways`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_messenger`
--
ALTER TABLE `log_messenger`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_modules`
--
ALTER TABLE `log_modules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_services`
--
ALTER TABLE `log_services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_transactions`
--
ALTER TABLE `log_transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_users`
--
ALTER TABLE `log_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `message_groups`
--
ALTER TABLE `message_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `messengers`
--
ALTER TABLE `messengers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messenger_meta`
--
ALTER TABLE `messenger_meta`
  MODIFY `messenger_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `module_groups`
--
ALTER TABLE `module_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `module_rows`
--
ALTER TABLE `module_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `module_types`
--
ALTER TABLE `module_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `navigation_items`
--
ALTER TABLE `navigation_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_affiliates`
--
ALTER TABLE `order_affiliates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_affiliate_payment_methods`
--
ALTER TABLE `order_affiliate_payment_methods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_affiliate_payouts`
--
ALTER TABLE `order_affiliate_payouts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_affiliate_referrals`
--
ALTER TABLE `order_affiliate_referrals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_affiliate_statistics`
--
ALTER TABLE `order_affiliate_statistics`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_forms`
--
ALTER TABLE `order_forms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `package_groups`
--
ALTER TABLE `package_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `package_options`
--
ALTER TABLE `package_options`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `package_option_conditions`
--
ALTER TABLE `package_option_conditions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `package_option_condition_sets`
--
ALTER TABLE `package_option_condition_sets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `package_option_groups`
--
ALTER TABLE `package_option_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `package_option_pricing`
--
ALTER TABLE `package_option_pricing`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `package_option_values`
--
ALTER TABLE `package_option_values`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `package_pricing`
--
ALTER TABLE `package_pricing`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=209;

--
-- AUTO_INCREMENT for table `permission_groups`
--
ALTER TABLE `permission_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `plugins`
--
ALTER TABLE `plugins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `plugin_cards`
--
ALTER TABLE `plugin_cards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pricings`
--
ALTER TABLE `pricings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `report_fields`
--
ALTER TABLE `report_fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service_changes`
--
ALTER TABLE `service_changes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service_options`
--
ALTER TABLE `service_options`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `staff_groups`
--
ALTER TABLE `staff_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `support_attachments`
--
ALTER TABLE `support_attachments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_departments`
--
ALTER TABLE `support_departments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_department_fields`
--
ALTER TABLE `support_department_fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_kb_articles`
--
ALTER TABLE `support_kb_articles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_kb_categories`
--
ALTER TABLE `support_kb_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_reminders`
--
ALTER TABLE `support_reminders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_replies`
--
ALTER TABLE `support_replies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_responses`
--
ALTER TABLE `support_responses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_response_categories`
--
ALTER TABLE `support_response_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `themes`
--
ALTER TABLE `themes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaction_types`
--
ALTER TABLE `transaction_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
