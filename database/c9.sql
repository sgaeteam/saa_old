-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tempo de Geração: 11/06/2018 às 16:18
-- Versão do servidor: 5.5.59-0ubuntu0.14.04.1
-- Versão do PHP: 5.6.33-3+ubuntu14.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de dados: `c9`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `area__competencias`
--

CREATE TABLE IF NOT EXISTS `area__competencias` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sigla` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `descricao` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Fazendo dump de dados para tabela `area__competencias`
--

INSERT INTO `area__competencias` (`id`, `sigla`, `descricao`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'E', 'MM', '2018-03-08 11:23:42', '2018-03-08 11:23:42', NULL),
(2, 'CD', 'A', '2018-03-08 11:23:42', '2018-03-08 11:23:42', NULL),
(3, 'DE', 'RLAM', '2018-03-08 11:23:42', '2018-03-08 11:23:42', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `atividades`
--

CREATE TABLE IF NOT EXISTS `atividades` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `sigla` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `descricao` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `data_inicio` date NOT NULL,
  `data_fim` date NOT NULL,
  `data_cancelamento` date DEFAULT NULL,
  `duracao` time NOT NULL,
  `hora_inicio_seg` time DEFAULT NULL,
  `hora_inicio_ter` time DEFAULT NULL,
  `hora_inicio_qua` time DEFAULT NULL,
  `hora_inicio_qui` time DEFAULT NULL,
  `hora_inicio_sex` time DEFAULT NULL,
  `hora_inicio_sab` time DEFAULT NULL,
  `hora_inicio_dom` time DEFAULT NULL,
  `tipoatividade_id` int(11) NOT NULL,
  `professor_id` int(11) NOT NULL,
  `espaco_id` int(11) NOT NULL,
  `agendado` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Fazendo dump de dados para tabela `atividades`
--

INSERT INTO `atividades` (`id`, `titulo`, `sigla`, `descricao`, `data_inicio`, `data_fim`, `data_cancelamento`, `duracao`, `hora_inicio_seg`, `hora_inicio_ter`, `hora_inicio_qua`, `hora_inicio_qui`, `hora_inicio_sex`, `hora_inicio_sab`, `hora_inicio_dom`, `tipoatividade_id`, `professor_id`, `espaco_id`, `agendado`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Futebol Sênior', 'FUTS', 'Aulas de futebol para melhor idade', '2018-03-30', '2018-10-31', '0000-00-00', '01:00:00', '20:00:00', '00:00:00', '20:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', 3, 2, 9, 1, '2018-03-26 11:45:38', '2018-04-25 04:34:29', NULL),
(2, 'Aula de Dança para Casais', '', '', '2018-05-14', '2018-05-31', '0000-00-00', '02:00:00', '20:30:00', '00:00:00', '09:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', 2, 1, 8, 1, '2018-03-26 11:55:08', '2018-05-15 23:34:08', NULL),
(3, 'Natação Baby', 'NTBY', '', '2018-05-15', '2018-06-30', NULL, '01:00:00', '00:00:00', '08:00:00', '00:00:00', '08:00:00', '00:00:00', '00:00:00', '00:00:00', 8, 3, 11, 1, '2018-05-16 15:53:36', NULL, NULL),
(4, 'Baby Swimming', 'BYSW', '', '2018-05-16', '2018-07-06', NULL, '02:30:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '07:00:00', '00:00:00', '00:00:00', 8, 1, 11, 0, '2018-05-16 17:38:53', '2018-05-16 17:46:42', '2018-05-22 13:44:15'),
(5, 'Xmen''s Soccer', 'XS', '', '2018-05-28', '2018-06-30', NULL, '01:30:00', '08:00:00', '16:00:00', '08:00:00', '16:00:00', '19:00:00', '00:00:00', '00:00:00', 3, 3, 9, 1, '2018-05-24 08:41:04', NULL, NULL),
(6, 'Capoeira do Professor Raimundo', '', '', '2018-06-11', '2018-08-04', NULL, '02:45:00', '10:00:00', '00:00:00', '10:00:00', '00:00:00', '14:00:00', '00:00:00', '00:00:00', 1, 2, 8, 1, '2018-06-05 17:53:20', NULL, NULL),
(7, 'Natação dos Patos', '', '', '2018-06-07', '2018-06-08', NULL, '05:00:00', '00:00:00', '00:00:00', '00:00:00', '14:00:00', '12:00:00', '12:00:00', '00:00:00', 8, 1, 11, 1, '2018-06-06 18:02:43', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `categorias`
--

CREATE TABLE IF NOT EXISTS `categorias` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `descricao` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `mensalidade` double NOT NULL,
  `convites` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=20 ;

--
-- Fazendo dump de dados para tabela `categorias`
--

INSERT INTO `categorias` (`id`, `created_at`, `updated_at`, `deleted_at`, `descricao`, `mensalidade`, `convites`) VALUES
(1, '2018-02-27 03:44:26', '2018-02-27 03:44:26', NULL, 'Sócio A', 40.13, 4),
(2, '2018-02-27 03:44:26', '2018-02-27 03:44:26', NULL, 'Sócio B', 50, 4),
(3, '2018-02-27 03:44:26', '2018-02-27 03:44:26', NULL, 'Sócio Benemérito', 0, 4),
(4, '2018-02-27 03:44:26', '2018-02-27 03:44:26', NULL, 'Sócio Remido', 0, 4),
(5, '2018-02-27 03:44:26', '2018-02-27 03:44:26', NULL, 'Sócio Afim', 40.13, 4),
(6, '2018-02-27 03:44:26', '2018-02-27 03:44:26', NULL, 'Sócio a Petros', 40.13, 4),
(7, '2018-02-27 03:44:26', '2018-02-27 03:44:26', NULL, 'Sócio Honorário', 0, 4),
(8, '2018-02-27 03:44:26', '2018-02-27 03:44:26', NULL, 'Sócio Contribuinte', 50, 4),
(9, '2018-02-27 03:44:26', '2018-02-27 03:44:26', NULL, 'Conveniado', 0, 2),
(10, '2018-02-27 03:44:26', '2018-02-27 03:44:26', NULL, 'CEPE(S)', 35.11, 4),
(11, '2018-02-27 03:44:26', '2018-02-27 03:44:26', NULL, 'COMAB', 20, 4),
(12, '2018-02-27 03:44:26', '2018-02-27 03:44:26', NULL, 'SINDPREV/BA', 6.1, 4),
(13, '2018-02-27 03:44:26', '2018-02-27 03:44:26', NULL, 'ELEQUEIROZ', 5.13, 4),
(14, '2018-02-27 03:44:26', '2018-02-27 03:44:26', NULL, 'BR Distribuidoras S.A.', 40.13, 4),
(15, '2018-02-27 03:44:26', '2018-02-27 03:44:26', NULL, 'Unificado', 5.13, 4),
(16, '2018-02-27 03:44:26', '2018-02-27 03:44:26', NULL, 'Sócio Atleta', 40, 4),
(17, '2018-02-27 03:44:26', '2018-02-27 03:44:26', NULL, 'SINDI-SAUDE', 6.1, 4),
(18, '2018-02-27 03:44:26', '2018-02-27 03:44:26', NULL, 'DESENBAHIA', 20, 4),
(19, '2018-02-27 03:44:26', '2018-02-27 03:44:26', NULL, 'AMIRFA', 40, 4);

-- --------------------------------------------------------

--
-- Estrutura para tabela `cms_apicustom`
--

CREATE TABLE IF NOT EXISTS `cms_apicustom` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permalink` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tabel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `aksi` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `kolom` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `orderby` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sub_query_1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sql_where` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nama` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keterangan` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parameter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `method_type` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parameters` longtext COLLATE utf8_unicode_ci,
  `responses` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cms_apikey`
--

CREATE TABLE IF NOT EXISTS `cms_apikey` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `screetkey` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hit` int(11) DEFAULT NULL,
  `status` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cms_dashboard`
--

CREATE TABLE IF NOT EXISTS `cms_dashboard` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_cms_privileges` int(11) DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cms_email_queues`
--

CREATE TABLE IF NOT EXISTS `cms_email_queues` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `send_at` datetime DEFAULT NULL,
  `email_recipient` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_from_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_from_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_cc_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_content` text COLLATE utf8_unicode_ci,
  `email_attachments` text COLLATE utf8_unicode_ci,
  `is_sent` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cms_email_templates`
--

CREATE TABLE IF NOT EXISTS `cms_email_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `from_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `from_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cc_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Fazendo dump de dados para tabela `cms_email_templates`
--

INSERT INTO `cms_email_templates` (`id`, `name`, `slug`, `subject`, `content`, `description`, `from_name`, `from_email`, `cc_email`, `created_at`, `updated_at`) VALUES
(1, 'Email Template Forgot Password Backend', 'forgot_password_backend', NULL, '<p>Hi,</p><p>Someone requested forgot password, here is your new password : </p><p>[password]</p><p><br></p><p>--</p><p>Regards,</p><p>Admin</p>', '[password]', 'System', 'system@crudbooster.com', NULL, '2018-02-22 18:58:51', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `cms_logs`
--

CREATE TABLE IF NOT EXISTS `cms_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ipaddress` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `useragent` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_cms_users` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=593 ;

--
-- Fazendo dump de dados para tabela `cms_logs`
--

INSERT INTO `cms_logs` (`id`, `ipaddress`, `useragent`, `url`, `description`, `id_cms_users`, `created_at`, `updated_at`) VALUES
(1, '10.240.1.136', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.167 Safari/537.36', 'http://lab-cloned-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com login with IP Address 10.240.1.136', 1, '2018-02-22 19:00:10', NULL),
(2, '10.240.0.207', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.167 Safari/537.36', 'http://lab-cloned-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com login with IP Address 10.240.0.207', 1, '2018-02-22 19:05:24', NULL),
(3, '10.240.0.207', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.167 Safari/537.36', 'http://lab-cloned-sgaeteam.c9users.io/admin/logout', 'admin@crudbooster.com logout', 1, '2018-02-22 19:05:45', NULL),
(4, '10.240.0.116', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.167 Safari/537.36', 'http://lab-cloned-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com login with IP Address 10.240.0.116', 1, '2018-02-22 19:25:57', NULL),
(5, '10.240.0.207', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.167 Safari/537.36', 'http://lab-cloned-sgaeteam.c9users.io/admin/logout', 'admin@crudbooster.com logout', 1, '2018-02-22 19:26:26', NULL),
(6, '10.240.0.207', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.167 Safari/537.36', 'http://sgc-crudbooster-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com login with IP Address 10.240.0.207', 1, '2018-02-22 20:53:29', NULL),
(7, '10.240.1.78', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.167 Safari/537.36', 'http://sgc-crudbooster-sgaeteam.c9users.io/admin/produtos/add-save', 'Add New Data 1 at Produtos', 1, '2018-02-22 21:40:16', NULL),
(8, '10.240.1.21', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.167 Safari/537.36', 'http://sgc-crudbooster-sgaeteam.c9users.io/admin/produtos/add-save', 'Add New Data 2 at Produtos', 1, '2018-02-22 21:41:09', NULL),
(9, '10.240.0.116', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.167 Safari/537.36', 'http://sgc-crudbooster-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com login with IP Address 10.240.0.116', 1, '2018-02-23 21:34:01', NULL),
(10, '10.240.0.233', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.167 Safari/537.36', 'http://sgc-crudbooster-sgaeteam.c9users.io/admin/produtos/add-save', 'Add New Data 3 at Produtos', 1, '2018-02-23 21:34:35', NULL),
(11, '10.240.0.41', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.167 Safari/537.36', 'http://sgc-crudbooster-sgaeteam.c9users.io/admin/clientes/add-save', 'Add New Data 1 at Clientes', 1, '2018-02-23 21:38:37', NULL),
(12, '10.240.1.136', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.167 Safari/537.36', 'http://sgc-crudbooster-sgaeteam.c9users.io/admin/clientes/add-save', 'Add New Data 2 at Clientes', 1, '2018-02-23 21:38:44', NULL),
(13, '10.240.0.171', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.167 Safari/537.36', 'http://sgc-crudbooster-sgaeteam.c9users.io/admin/clientes/add-save', 'Add New Data 3 at Clientes', 1, '2018-02-23 21:39:03', NULL),
(14, '10.240.0.42', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com login with IP Address 10.240.0.42', 1, '2018-02-24 09:52:29', NULL),
(15, '10.240.0.68', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-sgaeteam.c9users.io/admin/module_generator/delete/14', 'Delete data Eventos at Module Generator', 1, '2018-02-24 11:25:39', NULL),
(16, '10.240.0.116', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-sgaeteam.c9users.io/admin/module_generator/delete/14', 'Delete data Eventos at Module Generator', 1, '2018-02-24 11:41:25', NULL),
(17, '10.240.0.171', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com login with IP Address 10.240.0.171', 1, '2018-02-24 11:45:22', NULL),
(18, '10.240.1.78', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-sgaeteam.c9users.io/admin/eventos/add-save', 'Add New Data 1 at Eventos', 1, '2018-02-24 11:46:07', NULL),
(19, '10.240.1.192', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-sgaeteam.c9users.io/admin/eventos/add-save', 'Add New Data 2 at Eventos', 1, '2018-02-24 11:52:38', NULL),
(20, '10.240.0.207', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com login with IP Address 10.240.0.207', 1, '2018-02-25 18:42:04', NULL),
(21, '10.240.1.254', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.167 Safari/537.36', 'http://sgc-crudbooster-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com login with IP Address 10.240.1.254', 1, '2018-02-26 20:31:13', NULL),
(22, '10.240.0.118', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.167 Safari/537.36', 'http://sgc-crudbooster-sgaeteam.c9users.io/admin/eventos/add-save', 'Add New Data 3 at Eventos', 1, '2018-02-26 21:50:55', NULL),
(23, '10.240.0.231', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com login with IP Address 10.240.0.231', 1, '2018-02-26 23:39:07', NULL),
(24, '10.240.2.56', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-sgaeteam.c9users.io/admin/menu_management/edit-save/1', 'Update data Produtos at Menu Management', 1, '2018-02-27 00:46:10', NULL),
(25, '10.240.1.241', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-sgaeteam.c9users.io/admin/menu_management/add-save', 'Add New Data Associados at Menu Management', 1, '2018-02-27 01:13:14', NULL),
(26, '10.240.2.46', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-sgaeteam.c9users.io/admin/menu_management/add-save', 'Add New Data Cadastros at Menu Management', 1, '2018-02-27 02:28:08', NULL),
(27, '10.240.1.78', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-sgaeteam.c9users.io/admin/menu_management/add-save', 'Add New Data Tabelas Básicas at Menu Management', 1, '2018-02-27 02:28:48', NULL),
(28, '10.240.0.171', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-sgaeteam.c9users.io/admin/menu_management/edit-save/6', 'Update data Administração at Menu Management', 1, '2018-02-27 03:11:58', NULL),
(29, '10.240.2.147', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-sgaeteam.c9users.io/admin/menu_management/edit-save/6', 'Update data Administração at Menu Management', 1, '2018-02-27 03:14:44', NULL),
(30, '10.240.2.56', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-sgaeteam.c9users.io/admin/menu_management/add-save', 'Add New Data Relatórios at Menu Management', 1, '2018-02-27 03:17:44', NULL),
(31, '10.240.1.21', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-sgaeteam.c9users.io/admin/menu_management/edit-save/5', 'Update data Cadastros at Menu Management', 1, '2018-02-27 03:20:06', NULL),
(32, '10.240.2.46', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-sgaeteam.c9users.io/admin/menu_management/edit-save/7', 'Update data Relatórios at Menu Management', 1, '2018-02-27 03:20:54', NULL),
(33, '10.240.1.21', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com login with IP Address 10.240.1.21', 1, '2018-02-27 23:25:03', NULL),
(34, '10.240.2.46', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-sgaeteam.c9users.io/admin/menu_management/edit-save/9', 'Update data Cobranças at Menu Management', 1, '2018-02-27 23:56:02', NULL),
(35, '10.240.2.147', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', 'http://sgc-crudbooster-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com login with IP Address 10.240.2.147', 1, '2018-02-28 15:36:48', NULL),
(36, '10.240.0.116', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', 'http://sgc-crudbooster-sgaeteam.c9users.io/admin/logout', 'admin@crudbooster.com logout', 1, '2018-02-28 15:43:57', NULL),
(37, '10.240.1.136', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.167 Safari/537.36', 'http://sgc-crudbooster-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com login with IP Address 10.240.1.136', 1, '2018-02-28 16:05:11', NULL),
(38, '10.240.1.60', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.167 Safari/537.36', 'http://sgc-crudbooster-sgaeteam.c9users.io/admin/logout', 'admin@crudbooster.com logout', 1, '2018-02-28 16:06:09', NULL),
(39, '10.240.0.171', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.167 Safari/537.36', 'http://sgc-crudbooster-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.171', 1, '2018-02-28 16:07:27', NULL),
(40, '10.240.1.21', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.167 Safari/537.36', 'http://sgc-crudbooster-sgaeteam.c9users.io/admin/logout', 'admin@crudbooster.com sair', 1, '2018-02-28 16:07:39', NULL),
(41, '10.240.1.136', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', 'http://sgc-crudbooster-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.1.136', 1, '2018-02-28 16:07:44', NULL),
(42, '10.240.0.231', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.167 Safari/537.36', 'http://sgc-crudbooster-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.231', 1, '2018-02-28 16:08:07', NULL),
(43, '10.240.1.60', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.167 Safari/537.36', 'http://sgc-crudbooster-sgaeteam.c9users.io/admin/logout', 'admin@crudbooster.com sair', 1, '2018-02-28 16:08:51', NULL),
(44, '10.240.0.68', 'Mozilla/5.0 (Windows NT 6.1; rv:48.0) Gecko/20100101 Firefox/48.0', 'http://sgc-crudbooster-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.68', 1, '2018-02-28 16:40:06', NULL),
(45, '10.240.0.116', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.116', 1, '2018-03-02 01:55:32', NULL),
(46, '10.240.0.238', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', 'http://sgc-crudbooster-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.238', 1, '2018-03-03 19:41:36', NULL),
(47, '10.240.1.21', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', 'http://sgc-crudbooster-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.1.21', 1, '2018-03-03 20:04:08', NULL),
(48, '10.240.1.78', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.1.78', 1, '2018-03-04 20:17:20', NULL),
(49, '10.240.1.78', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.1.78', 1, '2018-03-04 20:52:09', NULL),
(50, '10.240.2.147', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.2.147', 1, '2018-03-04 20:54:35', NULL),
(51, '10.240.0.207', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.207', 1, '2018-03-04 23:05:48', NULL),
(52, '10.240.0.42', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.42', 1, '2018-03-05 00:02:53', NULL),
(53, '10.240.0.118', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.118', 1, '2018-03-05 00:09:40', NULL),
(54, '10.240.0.171', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.171', 1, '2018-03-05 00:59:23', NULL),
(55, '10.240.1.21', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.1.21', 1, '2018-03-05 09:22:55', NULL),
(56, '10.240.2.147', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.2.147', 1, '2018-03-06 00:07:00', NULL),
(57, '10.240.0.207', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/produtos/add-save', 'Adicionar novo conteúdo de 1 em Produtos', 1, '2018-03-06 00:09:46', NULL),
(58, '10.240.0.68', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/produtos/add-save', 'Adicionar novo conteúdo de 2 em Produtos', 1, '2018-03-06 00:10:11', NULL),
(59, '10.240.1.21', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/produtos/add-save', 'Adicionar novo conteúdo de 3 em Produtos', 1, '2018-03-06 00:10:33', NULL),
(60, '10.240.0.42', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.42', 1, '2018-03-06 06:31:08', NULL),
(61, '10.240.1.78', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/eventos/add-save', 'Adicionar novo conteúdo de 4 em Eventos', 1, '2018-03-06 06:41:58', NULL),
(62, '10.240.1.192', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/eventos/add-save', 'Adicionar novo conteúdo de 5 em Eventos', 1, '2018-03-06 07:51:43', NULL),
(63, '10.240.1.21', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.1.21', 1, '2018-03-07 09:19:55', NULL),
(64, '10.240.1.21', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.1.21', 1, '2018-03-07 09:34:37', NULL),
(65, '10.240.1.60', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-moacirmn.c9users.io/admin/logout', 'admin@crudbooster.com sair', 1, '2018-03-07 09:47:41', NULL),
(66, '10.240.0.207', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.207', 1, '2018-03-07 09:48:03', NULL),
(67, '10.240.1.78', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-moacirmn.c9users.io/admin/menu_management/edit-save/10', 'Atualizar dados de Atividades em Menu Management', 1, '2018-03-07 09:49:40', NULL),
(68, '10.240.0.233', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.233', 1, '2018-03-07 21:27:35', NULL),
(69, '10.240.0.207', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/eventos/add-save', 'Adicionar novo conteúdo de 6 em Eventos', 1, '2018-03-07 21:30:33', NULL),
(70, '10.240.0.41', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/eventos/edit-save/6', 'Atualizar dados de  em Eventos', 1, '2018-03-08 00:56:47', NULL),
(71, '10.240.2.147', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/eventos/edit-save/5', 'Atualizar dados de  em Eventos', 1, '2018-03-08 01:11:36', NULL),
(72, '10.240.0.42', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/eventos/edit-save/6', 'Atualizar dados de  em Eventos', 1, '2018-03-08 01:12:38', NULL),
(73, '10.240.1.21', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', 'http://sgc-crudbooster-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.1.21', 1, '2018-03-08 03:23:33', NULL),
(74, '10.240.0.207', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', 'http://sgc-crudbooster-moacirmn.c9users.io/admin/logout', 'admin@crudbooster.com sair', 1, '2018-03-08 03:24:06', NULL),
(75, '10.240.0.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.118', 1, '2018-03-08 09:49:34', NULL),
(76, '10.240.0.238', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.238', 1, '2018-03-08 11:25:28', NULL),
(77, '10.240.0.171', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-moacirmn.c9users.io/admin/logout', 'admin@crudbooster.com sair', 1, '2018-03-08 11:33:43', NULL),
(78, '10.240.0.231', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.231', 1, '2018-03-08 11:34:03', NULL),
(79, '10.240.0.68', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-moacirmn.c9users.io/admin/logout', 'admin@crudbooster.com sair', 1, '2018-03-08 11:37:08', NULL),
(80, '10.240.0.116', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.116', 1, '2018-03-09 03:38:12', NULL),
(81, '10.240.0.118', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.118', 1, '2018-03-09 04:41:47', NULL),
(82, '10.240.0.41', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.41', 1, '2018-03-09 09:27:12', NULL),
(83, '10.240.0.238', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-moacirmn.c9users.io/admin/logout', 'admin@crudbooster.com sair', 1, '2018-03-09 10:25:49', NULL),
(84, '10.240.1.21', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.1.21', 1, '2018-03-09 10:26:15', NULL),
(85, '10.240.2.147', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.2.147', 1, '2018-03-10 07:32:17', NULL),
(86, '10.240.0.42', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/eventos/edit-save/6', 'Atualizar dados de  em Eventos', 1, '2018-03-10 07:34:01', NULL),
(87, '10.240.0.42', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/menu_management/edit-save/12', 'Atualizar dados de Áreas de Competências em Menu Management', 1, '2018-03-10 07:56:54', NULL),
(88, '10.240.0.118', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/menu_management/delete/14', 'Excluir o conteúdo de Socios em Menu Management', 1, '2018-03-11 01:38:22', NULL),
(89, '10.240.2.147', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/menu_management/edit-save/3', 'Atualizar dados de Aluguel de Espaços em Menu Management', 1, '2018-03-11 01:46:17', NULL),
(90, '10.240.0.68', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/menu_management/edit-save/4', 'Atualizar dados de Sócios em Menu Management', 1, '2018-03-11 01:56:10', NULL),
(91, '10.240.0.171', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.171', 1, '2018-03-11 02:08:26', NULL),
(92, '10.240.0.207', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.207', 1, '2018-03-11 03:13:34', NULL),
(93, '10.240.0.171', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.171', 1, '2018-03-11 03:57:23', NULL),
(94, '10.240.1.21', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/socios/add-save', 'Adicionar novo conteúdo de 1 em Socios', 1, '2018-03-11 04:03:53', NULL),
(95, '10.240.0.68', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/socios/add-save', 'Adicionar novo conteúdo de 2 em Socios', 1, '2018-03-11 04:11:42', NULL),
(96, '10.240.0.116', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.116', 1, '2018-03-11 04:42:39', NULL),
(97, '10.240.0.233', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/menu_management/edit-save/14', 'Atualizar dados de Dependentes em Menu Management', 1, '2018-03-11 04:58:12', NULL),
(98, '10.240.0.42', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/dependentes/add-save', 'Adicionar novo conteúdo de 1 em Dependentes', 1, '2018-03-11 05:02:48', NULL),
(99, '10.240.0.41', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/dependentes/add-save', 'Adicionar novo conteúdo de 2 em Dependentes', 1, '2018-03-11 05:03:44', NULL),
(100, '10.240.0.116', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.116', 1, '2018-03-11 05:21:53', NULL),
(101, '10.240.0.171', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/socios/edit-save/2', 'Atualizar dados de  em Socios', 1, '2018-03-11 05:44:30', NULL),
(102, '10.240.1.60', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.1.60', 1, '2018-03-11 06:06:42', NULL),
(103, '10.240.1.60', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.1.60', 1, '2018-03-11 06:26:21', NULL),
(104, '10.240.0.42', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.42', 1, '2018-03-11 06:29:26', NULL),
(105, '10.240.0.171', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.171', 1, '2018-03-11 06:55:44', NULL),
(106, '10.240.0.207', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.207', 1, '2018-03-11 06:57:17', NULL),
(107, '10.240.0.116', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/socios/edit-save/1', 'Atualizar dados de  em Socios', 1, '2018-03-11 07:03:40', NULL),
(108, '10.240.0.207', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.207', 1, '2018-03-11 07:04:33', NULL),
(109, '10.240.0.231', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/dependentes/edit-save/2', 'Atualizar dados de  em Dependentes', 1, '2018-03-11 07:05:02', NULL),
(110, '10.240.1.60', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/dependentes/edit-save/1', 'Atualizar dados de  em Dependentes', 1, '2018-03-11 07:05:24', NULL),
(111, '10.240.0.116', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.116', 1, '2018-03-11 07:05:46', NULL),
(112, '10.240.0.231', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.231', 1, '2018-03-11 07:08:04', NULL),
(113, '10.240.0.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.118', 1, '2018-03-11 07:09:41', NULL),
(114, '10.240.0.41', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/menu_management/edit-save/12', 'Atualizar dados de Área de Competências em Menu Management', 1, '2018-03-11 07:12:08', NULL),
(115, '10.240.0.171', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/menu_management/edit-save/3', 'Atualizar dados de Aluguel de Espaços em Menu Management', 1, '2018-03-11 07:13:44', NULL),
(116, '10.240.0.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.118', 1, '2018-03-11 07:28:28', NULL),
(117, '10.240.0.171', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.171', 1, '2018-03-11 07:33:24', NULL),
(118, '10.240.0.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.118', 1, '2018-03-11 08:05:45', NULL),
(119, '10.240.0.42', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.42', 1, '2018-03-11 08:12:45', NULL),
(120, '10.240.2.147', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.2.147', 1, '2018-03-11 08:16:59', NULL),
(121, '10.240.0.116', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.116', 1, '2018-03-11 08:18:15', NULL),
(122, '10.240.0.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com login with IP Address 10.240.0.118', 1, '2018-03-11 08:23:42', NULL),
(123, '10.240.0.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com login with IP Address 10.240.0.118', 1, '2018-03-11 08:27:37', NULL),
(124, '10.240.0.171', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com login with IP Address 10.240.0.171', 1, '2018-03-11 08:30:41', NULL),
(125, '10.240.0.68', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com login with IP Address 10.240.0.68', 1, '2018-03-11 08:50:22', NULL),
(126, '10.240.0.68', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-moacirmn.c9users.io/admin/socios/edit-save/1', 'Update data  at Socios', 1, '2018-03-11 08:51:54', NULL),
(127, '10.240.1.136', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com login with IP Address 10.240.1.136', 1, '2018-03-11 08:57:09', NULL),
(128, '10.240.1.136', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-moacirmn.c9users.io/admin/socios/edit-save/2', 'Update data  at Socios', 1, '2018-03-11 08:57:54', NULL),
(129, '10.240.1.136', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-moacirmn.c9users.io/admin/socios/edit-save/2', 'Update data  at Socios', 1, '2018-03-11 08:59:11', NULL),
(130, '10.240.2.147', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com login with IP Address 10.240.2.147', 1, '2018-03-11 09:04:01', NULL),
(131, '10.240.1.60', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com login with IP Address 10.240.1.60', 1, '2018-03-11 09:06:08', NULL),
(132, '10.240.0.41', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com login with IP Address 10.240.0.41', 1, '2018-03-11 09:06:11', NULL),
(133, '10.240.0.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com login with IP Address 10.240.0.118', 1, '2018-03-11 09:14:51', NULL),
(134, '10.240.0.116', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com login with IP Address 10.240.0.116', 1, '2018-03-11 09:19:23', NULL),
(135, '10.240.2.147', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com login with IP Address 10.240.2.147', 1, '2018-03-11 09:38:29', NULL),
(136, '10.240.0.68', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-moacirmn.c9users.io/admin/socios/edit-save/1', 'Update data  at Socios', 1, '2018-03-11 09:39:03', NULL),
(137, '10.240.2.147', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.2.147', 1, '2018-03-11 13:43:58', NULL),
(138, '10.240.1.136', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.1.136', 1, '2018-03-11 13:49:17', NULL),
(139, '10.240.0.118', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.118', 1, '2018-03-11 21:02:55', NULL),
(140, '10.240.1.136', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/module_generator/delete/13', 'Excluir o conteúdo de Clientes em Module Generator', 1, '2018-03-11 21:08:44', NULL),
(141, '10.240.0.233', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/module_generator/delete/13', 'Excluir o conteúdo de Clientes em Module Generator', 1, '2018-03-11 21:13:49', NULL),
(142, '10.240.1.136', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.1.136', 1, '2018-03-13 07:55:29', NULL),
(143, '10.240.0.231', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com login with IP Address 10.240.0.231', 1, '2018-03-14 07:04:24', NULL),
(144, '10.240.0.171', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-moacirmn.c9users.io/admin/socios/edit-save/2', 'Update data  at Socios', 1, '2018-03-14 07:12:24', NULL),
(145, '10.240.0.41', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com login with IP Address 10.240.0.41', 1, '2018-03-14 07:18:12', NULL),
(146, '10.240.0.171', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com login with IP Address 10.240.0.171', 1, '2018-03-14 07:21:42', NULL),
(147, '10.240.0.171', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com login with IP Address 10.240.0.171', 1, '2018-03-14 07:25:36', NULL),
(148, '10.240.2.147', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com login with IP Address 10.240.2.147', 1, '2018-03-14 07:34:02', NULL),
(149, '10.240.0.171', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com login with IP Address 10.240.0.171', 1, '2018-03-14 07:36:57', NULL),
(150, '10.240.1.21', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com login with IP Address 10.240.1.21', 1, '2018-03-14 07:42:10', NULL),
(151, '10.240.0.42', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com login with IP Address 10.240.0.42', 1, '2018-03-14 07:44:21', NULL),
(152, '10.240.1.60', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.1.60', 1, '2018-03-14 07:56:22', NULL),
(153, '10.240.1.60', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com login with IP Address 10.240.1.60', 1, '2018-03-14 08:24:31', NULL),
(154, '10.240.0.207', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com login with IP Address 10.240.0.207', 1, '2018-03-14 08:41:16', NULL),
(155, '10.240.0.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com login with IP Address 10.240.0.118', 1, '2018-03-14 08:46:47', NULL),
(156, '10.240.0.41', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.41', 1, '2018-03-14 09:23:12', NULL),
(157, '10.240.1.21', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.1.21', 1, '2018-03-14 22:48:38', NULL),
(158, '10.240.0.118', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/eventos/add-save', 'Adicionar novo conteúdo de 7 em Aluguel de Espaços', 1, '2018-03-14 23:39:42', NULL),
(159, '10.240.1.21', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/eventos/add-save', 'Adicionar novo conteúdo de 8 em Aluguel de Espaços', 1, '2018-03-14 23:59:33', NULL),
(160, '10.240.0.118', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/eventos/edit-save/8', 'Atualizar dados de  em Aluguel de Espaços', 1, '2018-03-15 00:03:03', NULL),
(161, '10.240.2.147', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.2.147', 1, '2018-03-16 06:12:35', NULL),
(162, '10.240.0.207', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.207', 1, '2018-03-17 22:58:52', NULL),
(163, '10.240.0.116', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.116', 1, '2018-03-18 05:35:48', NULL),
(164, '10.240.0.68', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.68', 1, '2018-03-19 02:16:27', NULL),
(165, '10.240.0.42', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.42', 1, '2018-03-19 15:06:02', NULL),
(166, '10.240.1.136', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', 'http://sgc-crudbooster-stable-cloned-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.1.136', 1, '2018-03-21 03:17:39', NULL),
(167, '10.240.0.68', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', 'http://sgc-crudbooster-stable-cloned-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.68', 1, '2018-03-21 03:17:40', NULL),
(168, '10.240.0.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-crudbooster-stable-cloned-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.233', 1, '2018-03-21 03:26:03', NULL),
(169, '10.240.0.233', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.233', 1, '2018-03-22 06:44:24', NULL),
(170, '10.240.1.60', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 'http://sgc-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.1.60', 1, '2018-03-22 23:07:41', NULL),
(171, '10.240.1.60', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 'http://sgc-moacirmn.c9users.io/admin/logout', 'admin@crudbooster.com sair', 1, '2018-03-22 23:20:35', NULL),
(172, '10.240.0.207', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 'http://sgc-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.207', 1, '2018-03-22 23:20:42', NULL),
(173, '10.240.1.78', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 'http://sgc-moacirmn.c9users.io/admin/logout', 'admin@crudbooster.com sair', 1, '2018-03-22 23:24:13', NULL),
(174, '10.240.0.207', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.207', 1, '2018-03-24 08:18:32', NULL),
(175, '10.240.0.42', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/statistic_builder/add-save', 'Adicionar novo conteúdo de Total de Sócios em Statistic Builder', 1, '2018-03-24 08:19:51', NULL),
(176, '10.240.1.136', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.1.136', 1, '2018-03-24 08:48:14', NULL),
(177, '10.240.0.68', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/statistic_builder/edit-save/1', 'Atualizar dados de Dashboard Administrador em Statistic Builder', 1, '2018-03-24 08:50:06', NULL),
(178, '10.240.2.147', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.2.147', 1, '2018-03-26 07:22:54', NULL),
(179, '10.240.0.68', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.68', 1, '2018-03-26 07:24:36', NULL),
(180, '10.240.0.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/statistic_builder/edit-save/1', 'Atualizar dados de Dashboard Super Administrador em Statistic Builder', 1, '2018-03-26 07:26:32', NULL),
(181, '10.240.1.136', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/module_generator/delete/17', 'Excluir o conteúdo de Atividades em Module Generator', 1, '2018-03-26 07:26:58', NULL),
(182, '10.240.0.171', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 'http://sgc-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.171', 1, '2018-03-26 07:37:48', NULL),
(183, '10.240.0.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 'http://sgc-moacirmn.c9users.io/admin/statistic_builder/delete/1', 'Excluir o conteúdo de Dashboard Super Administrador em Statistic Builder', 1, '2018-03-26 07:39:58', NULL),
(184, '10.240.0.68', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 'http://sgc-moacirmn.c9users.io/admin/statistic_builder/delete/1', 'Excluir o conteúdo de Dashboard Super Administrador em Statistic Builder', 1, '2018-03-26 07:40:16', NULL),
(185, '10.240.0.68', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 'http://sgc-moacirmn.c9users.io/admin/statistic_builder/edit-save/1', 'Atualizar dados de Dashboard Super Administrador em Statistic Builder', 1, '2018-03-26 07:40:34', NULL),
(186, '10.240.0.116', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/menu_management/edit-save/16', 'Atualizar dados de Tipos de Atividade em Menu Management', 1, '2018-03-26 07:42:00', NULL),
(187, '10.240.0.68', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 'http://sgc-moacirmn.c9users.io/admin/statistic_builder/delete/1', 'Excluir o conteúdo de Dashboard Super Administrador em Statistic Builder', 1, '2018-03-26 07:43:55', NULL),
(188, '10.240.0.68', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/tipo_atividades/add-save', 'Adicionar novo conteúdo de 12 em Tipos de Atividade', 1, '2018-03-26 08:01:01', NULL),
(189, '10.240.1.136', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/tipo_atividades/add-save', 'Adicionar novo conteúdo de 13 em Tipos de Atividade', 1, '2018-03-26 08:02:30', NULL);
INSERT INTO `cms_logs` (`id`, `ipaddress`, `useragent`, `url`, `description`, `id_cms_users`, `created_at`, `updated_at`) VALUES
(190, '10.240.0.68', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 'http://sgc-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.68', 1, '2018-03-26 08:33:58', NULL),
(191, '10.240.1.21', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/menu_management/edit-save/17', 'Atualizar dados de Professores em Menu Management', 1, '2018-03-26 09:43:20', NULL),
(192, '10.240.0.116', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/fornecedores/add-save', 'Adicionar novo conteúdo de 1 em Fornecedores', 1, '2018-03-26 09:59:38', NULL),
(193, '10.240.1.21', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/fornecedores/add-save', 'Adicionar novo conteúdo de 2 em Fornecedores', 1, '2018-03-26 10:01:28', NULL),
(194, '10.240.0.231', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/produtos/add-save', 'Adicionar novo conteúdo de 4 em Produtos', 1, '2018-03-26 10:21:39', NULL),
(195, '10.240.1.78', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/produtos/add-save', 'Adicionar novo conteúdo de 5 em Produtos', 1, '2018-03-26 10:22:40', NULL),
(196, '10.240.0.207', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/produtos/edit-save/3', 'Atualizar dados de  em Produtos', 1, '2018-03-26 10:23:13', NULL),
(197, '10.240.1.21', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/produtos/edit-save/1', 'Atualizar dados de  em Produtos', 1, '2018-03-26 10:23:44', NULL),
(198, '10.240.1.21', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/produtos/edit-save/2', 'Atualizar dados de  em Produtos', 1, '2018-03-26 10:24:14', NULL),
(199, '10.240.1.136', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/professores/add-save', 'Adicionar novo conteúdo de 1 em Professores', 1, '2018-03-26 10:30:12', NULL),
(200, '10.240.2.147', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/professores/add-save', 'Adicionar novo conteúdo de 2 em Professores', 1, '2018-03-26 10:30:52', NULL),
(201, '10.240.0.68', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/usuarios/add-save', 'Adicionar novo conteúdo de 1 em Usuários', 1, '2018-03-26 10:34:59', NULL),
(202, '10.240.0.42', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/usuarios/add-save', 'Adicionar novo conteúdo de 2 em Usuários', 1, '2018-03-26 10:35:52', NULL),
(203, '10.240.0.171', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/usuarios/add-save', 'Adicionar novo conteúdo de 3 em Usuários', 1, '2018-03-26 10:36:37', NULL),
(204, '10.240.0.68', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/usuarios/add-save', 'Adicionar novo conteúdo de 4 em Usuários', 1, '2018-03-26 10:37:09', NULL),
(205, '10.240.0.42', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/menu_management/edit-save/18', 'Atualizar dados de Usuários em Menu Management', 1, '2018-03-26 10:40:24', NULL),
(206, '10.240.2.147', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/menu_management/edit-save/15', 'Atualizar dados de Fornecedores em Menu Management', 1, '2018-03-26 10:43:52', NULL),
(207, '10.240.0.42', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/fornecedores/add-save', 'Adicionar novo conteúdo de 3 em Fornecedores', 1, '2018-03-26 10:46:50', NULL),
(208, '10.240.1.60', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/menu_management/edit-save/3', 'Atualizar dados de Alugar Espaços em Menu Management', 1, '2018-03-26 11:01:04', NULL),
(209, '10.240.0.207', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/matriculas/add-save', 'Adicionar novo conteúdo de 1 em Matricular Usuários', 1, '2018-03-26 11:08:50', NULL),
(210, '10.240.0.116', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/matriculas/add-save', 'Adicionar novo conteúdo de 2 em Matricular Usuários', 1, '2018-03-26 11:09:29', NULL),
(211, '10.240.1.78', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/matriculas/delete/2', 'Excluir o conteúdo de 2 em Matricular Usuários', 1, '2018-03-26 11:11:43', NULL),
(212, '10.240.1.21', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/matriculas/delete/1', 'Excluir o conteúdo de 1 em Matricular Usuários', 1, '2018-03-26 11:11:57', NULL),
(213, '10.240.0.207', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/eventos/edit-save/8', 'Atualizar dados de  em Alugar Espaços', 1, '2018-03-26 11:21:52', NULL),
(214, '10.240.0.116', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/eventos/edit-save/6', 'Atualizar dados de  em Alugar Espaços', 1, '2018-03-26 11:23:14', NULL),
(215, '10.240.0.231', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/menu_management/edit-save/19', 'Atualizar dados de Agendar Atividades em Menu Management', 1, '2018-03-26 11:26:08', NULL),
(216, '10.240.0.42', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/menu_management/edit-save/3', 'Atualizar dados de Alugar Espaços em Menu Management', 1, '2018-03-26 11:26:47', NULL),
(217, '10.240.1.21', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/menu_management/edit-save/20', 'Atualizar dados de Matricular Usuários em Menu Management', 1, '2018-03-26 11:36:16', NULL),
(218, '10.240.0.171', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/atividades/add-save', 'Adicionar novo conteúdo de 1 em Agendar Atividades', 1, '2018-03-26 11:45:38', NULL),
(219, '10.240.0.116', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/atividades/add-save', 'Adicionar novo conteúdo de 2 em Agendar Atividades', 1, '2018-03-26 11:55:09', NULL),
(220, '10.240.1.78', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/matriculas/add-save', 'Adicionar novo conteúdo de 3 em Matricular Usuários', 1, '2018-03-26 11:57:21', NULL),
(221, '10.240.0.233', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/matriculas/add-save', 'Adicionar novo conteúdo de 4 em Matricular Usuários', 1, '2018-03-26 11:57:51', NULL),
(222, '10.240.0.118', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/matriculas/add-save', 'Adicionar novo conteúdo de 5 em Matricular Usuários', 1, '2018-03-26 12:00:18', NULL),
(223, '10.240.0.233', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.233', 1, '2018-03-26 19:16:49', NULL),
(224, '10.240.1.60', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.1.60', 1, '2018-03-26 19:20:47', NULL),
(225, '10.240.1.78', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/logout', 'admin@crudbooster.com sair', 1, '2018-03-26 19:41:16', NULL),
(226, '10.240.1.136', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/dependentes/add-save', 'Adicionar novo conteúdo de 3 em Dependentes', 1, '2018-03-26 20:12:51', NULL),
(227, '10.240.0.171', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/dependentes/edit-save/3', 'Atualizar dados de  em Dependentes', 1, '2018-03-26 20:13:36', NULL),
(228, '10.240.0.68', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/logout', 'admin@crudbooster.com sair', 1, '2018-03-26 20:57:12', NULL),
(229, '10.240.0.42', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.42', 1, '2018-03-26 20:58:37', NULL),
(230, '10.240.0.233', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/logout', 'admin@crudbooster.com sair', 1, '2018-03-26 20:58:48', NULL),
(231, '10.240.0.42', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 'http://sgc-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.42', 1, '2018-03-26 22:54:40', NULL),
(232, '10.240.1.136', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 'http://sgc-moacirmn.c9users.io/admin/statistic_builder/edit-save/1', 'Atualizar dados de Dashboard Super Administrador em Statistic Builder', 1, '2018-03-26 23:07:09', NULL),
(233, '10.240.0.207', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 'http://sgc-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.207', 1, '2018-03-26 23:51:37', NULL),
(234, '10.240.0.231', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.231', 1, '2018-03-27 03:15:24', NULL),
(235, '10.240.0.171', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.171', 1, '2018-03-27 10:56:46', NULL),
(236, '10.240.1.136', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/menu_management/add-save', 'Adicionar novo conteúdo de Dashboar Statistics em Menu Management', 1, '2018-03-27 11:01:38', NULL),
(237, '10.240.1.136', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/menu_management/delete/21', 'Excluir o conteúdo de Dashboar Statistics em Menu Management', 1, '2018-03-27 11:10:57', NULL),
(238, '10.240.0.207', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.207', 1, '2018-03-27 11:12:14', NULL),
(239, '10.240.1.21', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.1.21', 1, '2018-03-27 11:13:53', NULL),
(240, '10.240.2.147', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.2.147', 1, '2018-03-27 11:23:28', NULL),
(241, '10.240.1.78', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/menu_management/edit-save/21', 'Atualizar dados de Dashboar Statistics em Menu Management', 1, '2018-03-27 11:26:32', NULL),
(242, '10.240.1.78', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 'http://sgc-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.1.78', 1, '2018-03-27 23:07:58', NULL),
(243, '10.240.1.136', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 'http://sgc-moacirmn.c9users.io/admin/statistic_builder/edit-save/1', 'Atualizar dados de Dashboard Principal em Statistic Builder', 1, '2018-03-27 23:08:55', NULL),
(244, '10.240.1.136', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 'http://sgc-moacirmn.c9users.io/admin/logout', 'admin@crudbooster.com sair', 1, '2018-03-27 23:53:58', NULL),
(245, '10.240.2.147', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.2.147', 1, '2018-03-28 06:54:01', NULL),
(246, '10.240.0.42', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/espacos/edit-save/9', 'Atualizar dados de  em Espaços', 1, '2018-03-28 07:33:11', NULL),
(247, '10.240.1.21', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/espacos/edit-save/11', 'Atualizar dados de  em Espaços', 1, '2018-03-28 07:58:18', NULL),
(248, '10.240.0.207', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.207', 1, '2018-03-28 10:37:16', NULL),
(249, '10.240.0.207', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 'http://sgc-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.207', 1, '2018-03-28 22:04:27', NULL),
(250, '10.240.1.21', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 'http://sgc-moacirmn.c9users.io/admin/logout', 'admin@crudbooster.com sair', 1, '2018-03-28 22:08:59', NULL),
(251, '10.240.2.147', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.2.147', 1, '2018-03-29 08:03:14', NULL),
(252, '10.240.1.60', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/espacos/edit-save/6', 'Atualizar dados de  em Espaços', 1, '2018-03-29 14:52:50', NULL),
(253, '10.240.0.233', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/eventos/add-save', 'Adicionar novo conteúdo de 9 em Alugar Espaços', 1, '2018-03-29 15:58:13', NULL),
(254, '10.240.0.231', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/professores/add-save', 'Adicionar novo conteúdo de 3 em Professores', 1, '2018-03-29 16:17:06', NULL),
(255, '10.240.0.42', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.42', 1, '2018-03-30 00:04:35', NULL),
(256, '10.240.1.136', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.1.136', 1, '2018-03-30 03:46:19', NULL),
(257, '10.240.0.116', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/statistic_builder/edit-save/1', 'Atualizar dados de Dashboard Contadores em Statistic Builder', 1, '2018-03-30 05:39:08', NULL),
(258, '10.240.2.147', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/menu_management/edit-save/21', 'Atualizar dados de Dashboard Contadores em Menu Management', 1, '2018-03-30 11:26:58', NULL),
(259, '10.240.0.231', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/menu_management/edit-save/21', 'Atualizar dados de Dashboard Contadores em Menu Management', 1, '2018-03-30 11:34:39', NULL),
(260, '10.240.0.68', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/menu_management/edit-save/21', 'Atualizar dados de Dashboard Contadores em Menu Management', 1, '2018-03-30 11:39:57', NULL),
(261, '10.240.1.78', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/menu_management/edit-save/21', 'Atualizar dados de Dashboard Contadores em Menu Management', 1, '2018-03-30 11:41:26', NULL),
(262, '10.240.0.207', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/menu_management/edit-save/21', 'Atualizar dados de Dashboard Contadores em Menu Management', 1, '2018-03-30 11:44:58', NULL),
(263, '10.240.0.207', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/menu_management/edit-save/21', 'Atualizar dados de Dashboard Contadores em Menu Management', 1, '2018-03-30 11:47:32', NULL),
(264, '10.240.0.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.233', 1, '2018-03-31 02:44:01', NULL),
(265, '10.240.0.231', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.231', 1, '2018-03-31 03:02:03', NULL),
(266, '10.240.0.42', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/menu_management/edit-save/21', 'Atualizar dados de Dashboard Contadores em Menu Management', 1, '2018-03-31 04:18:37', NULL),
(267, '10.240.0.116', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/menu_management/edit-save/21', 'Atualizar dados de Dashboard Contadores em Menu Management', 1, '2018-03-31 04:19:17', NULL),
(268, '10.240.1.78', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/menu_management/edit-save/21', 'Atualizar dados de Dashboard Contadores em Menu Management', 1, '2018-03-31 05:26:16', NULL),
(269, '10.240.0.231', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.231', 1, '2018-03-31 05:40:17', NULL),
(270, '10.240.1.78', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.1.78', 1, '2018-03-31 08:18:11', NULL),
(271, '10.240.1.78', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.1.78', 1, '2018-03-31 17:53:19', NULL),
(272, '10.240.0.171', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/menu_management/edit-save/21', 'Atualizar dados de Visão Geral em Menu Management', 1, '2018-03-31 17:59:29', NULL),
(273, '10.240.0.233', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/atividades/add-save', 'Adicionar novo conteúdo de 3 em Agendar Atividades', 1, '2018-03-31 23:18:07', NULL),
(274, '10.240.0.42', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/atividades/delete/3', 'Excluir o conteúdo de 3 em Agendar Atividades', 1, '2018-03-31 23:18:20', NULL),
(275, '10.240.1.21', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.1.21', 1, '2018-04-01 17:46:16', NULL),
(276, '10.240.0.207', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.207', 1, '2018-04-01 18:00:54', NULL),
(277, '10.240.0.171', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.171', 1, '2018-04-02 15:54:56', NULL),
(278, '10.240.0.118', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 'http://sgc-crudbooster-stable-cloned-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.118', 1, '2018-04-03 03:56:42', NULL),
(279, '10.240.0.68', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-recovery-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.68', 1, '2018-04-03 05:14:55', NULL),
(280, '10.240.1.136', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 'http://sgc-crudbooster-stable-recovery-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.1.136', 1, '2018-04-04 04:07:56', NULL),
(281, '10.240.1.21', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 'http://sgc-crudbooster-stable-recovery-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.1.21', 1, '2018-04-04 04:17:32', NULL),
(282, '10.240.0.231', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-recovery-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.231', 1, '2018-04-04 10:46:18', NULL),
(283, '10.240.1.136', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.1.136', 1, '2018-04-04 10:48:39', NULL),
(284, '10.240.0.171', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.171', 1, '2018-04-05 07:33:24', NULL),
(285, '10.240.0.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.118', 1, '2018-04-05 08:21:26', NULL),
(286, '10.240.0.231', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/logout', 'admin@crudbooster.com sair', 1, '2018-04-05 08:51:53', NULL),
(287, '10.240.0.118', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.118', 1, '2018-04-05 15:50:47', NULL),
(288, '10.240.0.42', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.42', 1, '2018-04-08 12:55:50', NULL),
(289, '10.240.1.78', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/eventos/edit-save/7', 'Atualizar dados de  em Alugar Espaços', 1, '2018-04-08 13:01:59', NULL),
(290, '10.240.0.231', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/espacos/edit-save/8', 'Atualizar dados de  em Espaços', 1, '2018-04-08 13:18:19', NULL),
(291, '10.240.1.21', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.1.21', 1, '2018-04-09 05:41:33', NULL),
(292, '10.240.0.116', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.116', 1, '2018-04-10 04:56:32', NULL),
(293, '10.240.1.60', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/eventos/add-save', 'Adicionar novo conteúdo de 10 em Alugar Espaços', 1, '2018-04-10 05:03:04', NULL),
(294, '10.240.0.231', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/eventos/add-save', 'Adicionar novo conteúdo de 11 em Alugar Espaços', 1, '2018-04-10 05:26:04', NULL),
(295, '10.240.1.78', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.1.78', 1, '2018-04-10 07:31:29', NULL),
(296, '10.240.0.207', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/eventos/add-save', 'Adicionar novo conteúdo de 12 em Alugar Espaços', 1, '2018-04-10 08:49:53', NULL),
(297, '10.240.1.60', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.1.60', 1, '2018-04-10 11:35:01', NULL),
(298, '10.240.0.42', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/eventos/add-save', 'Adicionar novo conteúdo de 13 em Alugar Espaços', 1, '2018-04-10 11:38:42', NULL),
(299, '10.240.0.116', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.116', 1, '2018-04-12 00:49:22', NULL),
(300, '10.240.1.78', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/eventos/add-save', 'Adicionar novo conteúdo de 14 em Alugar Espaços', 1, '2018-04-12 00:51:21', NULL),
(301, '10.240.0.207', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/eventos/add-save', 'Adicionar novo conteúdo de 15 em Alugar Espaços', 1, '2018-04-12 01:21:29', NULL),
(302, '10.240.0.118', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/eventos/add-save', 'Adicionar novo conteúdo de 16 em Alugar Espaços', 1, '2018-04-12 01:22:07', NULL),
(303, '10.240.0.116', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/eventos/add-save', 'Adicionar novo conteúdo de 17 em Alugar Espaços', 1, '2018-04-12 02:56:10', NULL),
(304, '10.240.0.233', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/eventos/add-save', 'Adicionar novo conteúdo de 18 em Alugar Espaços', 1, '2018-04-12 03:01:04', NULL),
(305, '10.240.2.147', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/eventos/add-save', 'Adicionar novo conteúdo de 19 em Alugar Espaços', 1, '2018-04-12 03:11:20', NULL),
(306, '10.240.0.207', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/eventos/add-save', 'Adicionar novo conteúdo de 20 em Alugar Espaços', 1, '2018-04-12 03:12:54', NULL),
(307, '10.240.0.207', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/eventos/add-save', 'Adicionar novo conteúdo de 21 em Alugar Espaços', 1, '2018-04-12 03:49:47', NULL),
(308, '10.240.0.207', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.207', 1, '2018-04-12 12:49:56', NULL),
(309, '10.240.2.147', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/eventos/add-save', 'Adicionar novo conteúdo de 22 em Alugar Espaços', 1, '2018-04-12 12:55:07', NULL),
(310, '10.240.0.233', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/eventos/action-selected', 'Excluir o conteúdo de 21,20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3 em Alugar Espaços', 1, '2018-04-12 12:55:40', NULL),
(311, '10.240.1.21', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/eventos/action-selected', 'Excluir o conteúdo de 2,1 em Alugar Espaços', 1, '2018-04-12 12:55:59', NULL),
(312, '10.240.2.147', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/eventos/add-save', 'Adicionar novo conteúdo de 23 em Alugar Espaços', 1, '2018-04-12 13:20:58', NULL),
(313, '10.240.2.147', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.2.147', 1, '2018-04-13 10:07:11', NULL),
(314, '10.240.1.60', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/produtos/edit-save/5', 'Atualizar dados de  em Produtos', 1, '2018-04-13 10:25:56', NULL),
(315, '10.240.0.207', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/produtos/edit-save/5', 'Atualizar dados de  em Produtos', 1, '2018-04-13 10:28:10', NULL),
(316, '10.240.0.116', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/produtos/edit-save/5', 'Atualizar dados de  em Produtos', 1, '2018-04-13 10:29:34', NULL),
(317, '10.240.0.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/produtos/edit-save/5', 'Atualizar dados de  em Produtos', 1, '2018-04-13 10:30:53', NULL),
(318, '10.240.1.21', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/produtos/edit-save/5', 'Atualizar dados de  em Produtos', 1, '2018-04-13 10:32:59', NULL),
(319, '10.240.1.78', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/produtos/edit-save/5', 'Atualizar dados de  em Produtos', 1, '2018-04-13 10:36:08', NULL),
(320, '10.240.0.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/produtos/edit-save/5', 'Atualizar dados de  em Produtos', 1, '2018-04-13 10:44:17', NULL),
(321, '10.240.0.116', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/produtos/edit-save/5', 'Atualizar dados de  em Produtos', 1, '2018-04-13 10:53:23', NULL),
(322, '10.240.1.60', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/produtos/edit-save/5', 'Atualizar dados de  em Produtos', 1, '2018-04-13 10:57:53', NULL),
(323, '10.240.0.233', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.233', 1, '2018-04-14 03:55:09', NULL),
(324, '10.240.1.60', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.1.60', 1, '2018-04-14 17:11:36', NULL),
(325, '10.240.0.233', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/eventos/add-save', 'Adicionar novo conteúdo de 24 em Alugar Espaços', 1, '2018-04-16 06:49:38', NULL),
(326, '10.240.0.42', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/atividades/edit-save/2', 'Atualizar dados de  em Agendar Atividades', 1, '2018-04-16 07:38:37', NULL),
(327, '10.240.1.78', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/atividades/edit-save/2', 'Atualizar dados de  em Agendar Atividades', 1, '2018-04-16 07:44:07', NULL),
(328, '10.240.0.42', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.42', 1, '2018-04-16 08:11:42', NULL),
(329, '10.240.2.147', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.2.147', 1, '2018-04-16 09:41:44', NULL),
(330, '10.240.0.42', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.42', 1, '2018-04-17 08:57:33', NULL),
(331, '10.240.1.136', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.1.136', 1, '2018-04-18 06:23:53', NULL),
(332, '10.240.0.207', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-backup-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.207', 1, '2018-04-20 07:47:30', NULL),
(333, '10.240.0.207', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.207', 1, '2018-04-20 07:50:50', NULL),
(334, '10.240.0.171', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.171', 1, '2018-04-20 08:21:36', NULL),
(335, '10.240.0.116', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/menu_management/add-save', 'Adicionar novo conteúdo de Dashboard em Menu Management', 1, '2018-04-20 08:23:02', NULL),
(336, '10.240.0.207', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.207', 1, '2018-04-20 13:47:37', NULL),
(337, '10.240.0.118', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.118', 1, '2018-04-21 20:49:53', NULL),
(338, '10.240.1.136', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.1.136', 1, '2018-04-22 05:42:02', NULL),
(339, '10.240.0.118', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.118', 1, '2018-04-22 09:18:27', NULL),
(340, '10.240.1.136', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.1.136', 1, '2018-04-22 09:57:12', NULL),
(341, '10.240.0.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.118', 1, '2018-04-22 11:02:29', NULL),
(342, '10.240.1.136', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/produtos/edit-save/5', 'Atualizar dados de  em Produtos', 1, '2018-04-22 11:06:43', NULL),
(343, '10.240.1.21', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/logout', 'admin@crudbooster.com sair', 1, '2018-04-22 11:12:01', NULL),
(344, '10.240.1.21', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.1.21', 1, '2018-04-22 11:26:59', NULL),
(345, '10.240.0.207', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.207', 1, '2018-04-22 11:27:01', NULL),
(346, '10.240.0.68', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/produtos/edit-save/5', 'Atualizar dados de  em Produtos', 1, '2018-04-22 11:38:14', NULL),
(347, '10.240.0.116', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/produtos/edit-save/5', 'Atualizar dados de  em Produtos', 1, '2018-04-22 11:46:48', NULL),
(348, '10.240.0.116', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/produtos/edit-save/5', 'Atualizar dados de  em Produtos', 1, '2018-04-22 11:49:49', NULL),
(349, '10.240.0.171', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/atividades/edit-save/1', 'Atualizar dados de  em Agendar Atividades', 1, '2018-04-22 12:21:44', NULL),
(350, '10.240.0.42', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/atividades/edit-save/1', 'Atualizar dados de  em Agendar Atividades', 1, '2018-04-22 12:25:09', NULL),
(351, '10.240.0.42', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/atividades/edit-save/1', 'Atualizar dados de  em Agendar Atividades', 1, '2018-04-22 12:26:39', NULL),
(352, '10.240.0.116', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/produtos/edit-save/5', 'Atualizar dados de  em Produtos', 1, '2018-04-22 12:26:39', NULL),
(353, '10.240.1.60', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/atividades/edit-save/1', 'Atualizar dados de  em Agendar Atividades', 1, '2018-04-22 12:42:47', NULL),
(354, '10.240.0.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/produtos/edit-save/5', 'Atualizar dados de  em Produtos', 1, '2018-04-22 12:50:23', NULL),
(355, '10.240.0.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/produtos/edit-save/5', 'Atualizar dados de  em Produtos', 1, '2018-04-22 12:51:49', NULL),
(356, '10.240.0.231', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/produtos/edit-save/5', 'Atualizar dados de  em Produtos', 1, '2018-04-22 12:52:11', NULL),
(357, '10.240.0.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/produtos/edit-save/5', 'Atualizar dados de  em Produtos', 1, '2018-04-22 12:52:53', NULL),
(358, '10.240.0.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/produtos/edit-save/5', 'Atualizar dados de  em Produtos', 1, '2018-04-22 12:54:04', NULL),
(359, '10.240.1.136', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/produtos/edit-save/5', 'Atualizar dados de  em Produtos', 1, '2018-04-22 12:54:45', NULL),
(360, '10.240.1.60', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/produtos/edit-save/5', 'Atualizar dados de  em Produtos', 1, '2018-04-22 12:56:17', NULL),
(361, '10.240.1.136', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/produtos/edit-save/5', 'Atualizar dados de  em Produtos', 1, '2018-04-22 12:57:04', NULL),
(362, '10.240.0.42', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/produtos/edit-save/5', 'Atualizar dados de  em Produtos', 1, '2018-04-22 12:57:45', NULL),
(363, '10.240.0.68', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/produtos/edit-save/5', 'Atualizar dados de  em Produtos', 1, '2018-04-22 12:59:06', NULL),
(364, '10.240.1.21', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/produtos/edit-save/5', 'Atualizar dados de  em Produtos', 1, '2018-04-22 13:00:02', NULL),
(365, '10.240.0.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/produtos/edit-save/5', 'Atualizar dados de  em Produtos', 1, '2018-04-22 13:00:44', NULL),
(366, '10.240.0.68', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/produtos/edit-save/5', 'Atualizar dados de  em Produtos', 1, '2018-04-22 13:01:51', NULL),
(367, '10.240.1.60', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/produtos/edit-save/5', 'Atualizar dados de  em Produtos', 1, '2018-04-22 13:03:18', NULL),
(368, '10.240.1.78', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/atividades/edit-save/1', 'Atualizar dados de  em Agendar Atividades', 1, '2018-04-22 13:03:19', NULL),
(369, '10.240.0.42', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/produtos/edit-save/5', 'Atualizar dados de  em Produtos', 1, '2018-04-22 13:04:39', NULL),
(370, '10.240.1.136', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/module_generator/delete/26', 'Excluir o conteúdo de Agendar Atividades em Module Generator', 1, '2018-04-22 13:05:10', NULL),
(371, '10.240.0.42', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/produtos/edit-save/5', 'Atualizar dados de  em Produtos', 1, '2018-04-22 13:05:38', NULL),
(372, '10.240.0.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/produtos/edit-save/5', 'Atualizar dados de  em Produtos', 1, '2018-04-22 13:06:57', NULL),
(373, '10.240.0.116', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/produtos/edit-save/5', 'Atualizar dados de  em Produtos', 1, '2018-04-22 13:17:46', NULL),
(374, '10.240.0.231', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/produtos/edit-save/5', 'Atualizar dados de  em Produtos', 1, '2018-04-22 13:20:16', NULL),
(375, '10.240.0.231', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/produtos/edit-save/5', 'Atualizar dados de  em Produtos', 1, '2018-04-22 13:21:05', NULL),
(376, '10.240.0.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/atividades/edit-save/1', 'Atualizar dados de  em Agendar Atividades', 1, '2018-04-22 13:33:31', NULL),
(377, '10.240.0.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/atividades/edit-save/1', 'Atualizar dados de  em Agendar Atividades', 1, '2018-04-22 13:37:34', NULL),
(378, '10.240.1.78', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.1.78', 1, '2018-04-22 19:15:56', NULL),
(379, '10.240.1.78', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-backup-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.1.78', 1, '2018-04-22 19:17:41', NULL),
(380, '10.240.1.136', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.1.136', 1, '2018-04-23 04:53:00', NULL),
(381, '10.240.1.60', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/produtos/edit-save/5', 'Atualizar dados de  em Produtos', 1, '2018-04-23 04:53:43', NULL);
INSERT INTO `cms_logs` (`id`, `ipaddress`, `useragent`, `url`, `description`, `id_cms_users`, `created_at`, `updated_at`) VALUES
(382, '10.240.0.207', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/produtos/edit-save/5', 'Atualizar dados de  em Produtos', 1, '2018-04-23 04:54:27', NULL),
(383, '10.240.1.78', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/produtos/edit-save/5', 'Atualizar dados de  em Produtos', 1, '2018-04-23 04:56:03', NULL),
(384, '10.240.2.147', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/produtos/edit-save/5', 'Atualizar dados de  em Produtos', 1, '2018-04-23 04:57:57', NULL),
(385, '10.240.0.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/produtos/edit-save/5', 'Atualizar dados de  em Produtos', 1, '2018-04-23 04:59:09', NULL),
(386, '10.240.0.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/produtos/edit-save/5', 'Atualizar dados de  em Produtos', 1, '2018-04-23 05:00:38', NULL),
(387, '10.240.0.231', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/produtos/edit-save/5', 'Atualizar dados de  em Produtos', 1, '2018-04-23 05:02:17', NULL),
(388, '10.240.2.147', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/produtos/edit-save/5', 'Atualizar dados de  em Produtos', 1, '2018-04-23 05:05:21', NULL),
(389, '10.240.1.78', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/produtos/edit-save/5', 'Atualizar dados de  em Produtos', 1, '2018-04-23 05:06:41', NULL),
(390, '10.240.1.136', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/produtos/edit-save/5', 'Atualizar dados de  em Produtos', 1, '2018-04-23 05:09:27', NULL),
(391, '10.240.0.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/produtos/edit-save/10', 'Atualizar dados de  em Produtos', 1, '2018-04-23 05:15:06', NULL),
(392, '10.240.0.207', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/produtos/edit-save/10', 'Atualizar dados de  em Produtos', 1, '2018-04-23 05:15:48', NULL),
(393, '10.240.0.116', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/produtos/edit-save/10', 'Atualizar dados de  em Produtos', 1, '2018-04-23 05:16:47', NULL),
(394, '10.240.0.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/produtos/edit-save/10', 'Atualizar dados de  em Produtos', 1, '2018-04-23 05:31:39', NULL),
(395, '10.240.0.231', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/produtos/edit-save/10', 'Atualizar dados de  em Produtos', 1, '2018-04-23 05:34:56', NULL),
(396, '10.240.1.136', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/produtos/edit-save/10', 'Atualizar dados de  em Produtos', 1, '2018-04-23 05:36:17', NULL),
(397, '10.240.0.171', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/produtos/edit-save/10', 'Atualizar dados de  em Produtos', 1, '2018-04-23 05:37:39', NULL),
(398, '10.240.1.21', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/produtos/edit-save/10', 'Atualizar dados de  em Produtos', 1, '2018-04-23 05:38:31', NULL),
(399, '10.240.0.42', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/produtos/edit-save/10', 'Atualizar dados de  em Produtos', 1, '2018-04-23 05:41:40', NULL),
(400, '10.240.0.42', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/produtos/edit-save/10', 'Atualizar dados de  em Produtos', 1, '2018-04-23 05:44:25', NULL),
(401, '10.240.2.147', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/produtos/edit-save/10', 'Atualizar dados de  em Produtos', 1, '2018-04-23 05:45:24', NULL),
(402, '10.240.1.78', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/produtos/edit-save/10', 'Atualizar dados de  em Produtos', 1, '2018-04-23 05:47:23', NULL),
(403, '10.240.1.78', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.1.78', 1, '2018-04-23 06:56:41', NULL),
(404, '10.240.1.78', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.1.78', 1, '2018-04-23 20:26:03', NULL),
(405, '10.240.0.171', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.171', 1, '2018-04-24 07:45:09', NULL),
(406, '10.240.1.136', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.1.136', 1, '2018-04-25 03:52:34', NULL),
(407, '10.240.0.116', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.116', 1, '2018-04-25 04:33:46', NULL),
(408, '10.240.2.147', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/atividades/edit-save/1', 'Atualizar dados de  em Agendar Atividades', 1, '2018-04-25 04:34:29', NULL),
(409, '10.240.2.147', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.2.147', 1, '2018-04-25 08:12:06', NULL),
(410, '10.240.0.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/produtos/edit-save/10', 'Atualizar dados de  em Produtos', 1, '2018-04-25 08:12:47', NULL),
(411, '10.240.2.147', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/produtos/edit-save/10', 'Atualizar dados de  em Produtos', 1, '2018-04-25 08:13:34', NULL),
(412, '10.240.0.42', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/produtos/edit-save/10', 'Atualizar dados de  em Produtos', 1, '2018-04-25 08:20:07', NULL),
(413, '10.240.1.78', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/produtos/edit-save/10', 'Atualizar dados de  em Produtos', 1, '2018-04-25 08:23:56', NULL),
(414, '10.240.1.60', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/produtos/edit-save/10', 'Atualizar dados de  em Produtos', 1, '2018-04-25 08:29:06', NULL),
(415, '10.240.0.231', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-moacirmn.c9users.io/admin/produtos/edit-save/10', 'Atualizar dados de  em Produtos', 1, '2018-04-25 08:30:57', NULL),
(416, '10.240.2.147', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.2.147', 1, '2018-04-25 09:15:35', NULL),
(417, '10.240.1.60', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.1.60', 1, '2018-04-25 18:20:00', NULL),
(418, '10.240.0.233', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.233', 1, '2018-04-25 22:49:40', NULL),
(419, '10.240.1.21', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.1.21', 1, '2018-04-26 00:25:23', NULL),
(420, '10.240.2.147', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.2.147', 1, '2018-04-26 04:07:18', NULL),
(421, '10.240.1.60', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/atividades/edit-save/2', 'Atualizar dados de  em Agendar Atividades', 1, '2018-04-26 04:24:14', NULL),
(422, '10.240.0.231', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/eventos/add-save', 'Adicionar novo conteúdo de 25 em Alugar Espaços', 1, '2018-04-26 04:27:09', NULL),
(423, '10.240.1.60', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.1.60', 1, '2018-04-26 06:22:35', NULL),
(424, '10.240.1.21', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.1.21', 1, '2018-04-28 03:03:43', NULL),
(425, '10.240.0.118', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/logout', 'admin@crudbooster.com sair', 1, '2018-05-11 12:18:01', NULL),
(426, '10.240.0.42', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.42', 1, '2018-05-11 12:18:04', NULL),
(427, '10.240.0.233', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/eventos/action-selected', 'Excluir o conteúdo de 145,144,143,142,141,140,139,138,137,136,135,134,133,132,131,130,129,128,127,126 em Alugar Espaços', 1, '2018-05-11 13:17:39', NULL),
(428, '10.240.1.78', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/eventos/action-selected', 'Excluir o conteúdo de 125,124,123,122,121,120,119,118,117,116,115,114,113,112,111,110,109,108,107,106 em Alugar Espaços', 1, '2018-05-11 13:17:51', NULL),
(429, '10.240.1.21', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/eventos/action-selected', 'Excluir o conteúdo de 105,104,103,102,101,100,99,98,97,96,95,94,93,92,91,90,89,88,87,86 em Alugar Espaços', 1, '2018-05-11 13:18:01', NULL),
(430, '10.240.1.78', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/eventos/action-selected', 'Excluir o conteúdo de 205,204,203,202,201,200,199,198,197,196,195,194,193,192,191,190,189,188,187,186 em Alugar Espaços', 1, '2018-05-11 13:47:43', NULL),
(431, '10.240.0.116', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/eventos/action-selected', 'Excluir o conteúdo de 185,184,183,182,181,180,179,178,177,176,175,174,173,172,171,170,169,168,167,166 em Alugar Espaços', 1, '2018-05-11 13:48:06', NULL),
(432, '10.240.1.78', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/eventos/action-selected', 'Excluir o conteúdo de 165,164,163,162,161,160,159,158,157,156,155,154,153,152,151,150,149,148,147,146 em Alugar Espaços', 1, '2018-05-11 13:48:13', NULL),
(433, '10.240.0.207', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/eventos/action-selected', 'Excluir o conteúdo de 265,264,263,262,261,260,259,258,257,256,255,254,253,252,251,250,249,248,247,246 em Alugar Espaços', 1, '2018-05-11 13:49:58', NULL),
(434, '10.240.1.60', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/eventos/action-selected', 'Excluir o conteúdo de 245,244,243,242,241,240,239,238,237,236,235,234,233,232,231,230,229,228,227,226 em Alugar Espaços', 1, '2018-05-11 13:50:07', NULL),
(435, '10.240.1.78', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/eventos/action-selected', 'Excluir o conteúdo de 225,224,223,222,221,220,219,218,217,216,215,214,213,212,211,210,209,208,207,206 em Alugar Espaços', 1, '2018-05-11 13:50:12', NULL),
(436, '10.240.0.118', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.118', 1, '2018-05-11 18:35:22', NULL),
(437, '10.240.0.42', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/menu_management/edit-save/22', 'Atualizar dados de Dashboard em Menu Management', 1, '2018-05-11 20:17:51', NULL),
(438, '10.240.1.78', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.1.78', 1, '2018-05-11 20:18:03', NULL),
(439, '10.240.1.21', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/menu_management/edit-save/22', 'Atualizar dados de Dashboard em Menu Management', 1, '2018-05-11 20:20:04', NULL),
(440, '10.240.1.21', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/menu_management/edit-save/22', 'Atualizar dados de Dashboard em Menu Management', 1, '2018-05-11 20:20:39', NULL),
(441, '10.240.0.233', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/menu_management/edit-save/22', 'Atualizar dados de Dashboard em Menu Management', 1, '2018-05-11 20:21:36', NULL),
(442, '10.240.0.233', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/menu_management/edit-save/22', 'Atualizar dados de Dashboard em Menu Management', 1, '2018-05-11 20:22:46', NULL),
(443, '10.240.1.60', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.1.60', 1, '2018-05-11 20:25:36', NULL),
(444, '10.240.0.116', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.116', 1, '2018-05-11 20:57:05', NULL),
(445, '10.240.0.233', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.233', 1, '2018-05-11 20:59:30', NULL),
(446, '10.240.0.231', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.231', 1, '2018-05-11 21:00:52', NULL),
(447, '10.240.0.42', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.42', 1, '2018-05-11 21:02:53', NULL),
(448, '10.240.0.116', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.116', 1, '2018-05-12 02:59:20', NULL),
(449, '10.240.1.60', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.1.60', 1, '2018-05-12 03:12:40', NULL),
(450, '10.240.0.42', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/menu_management/delete/22', 'Excluir o conteúdo de Dashboard em Menu Management', 1, '2018-05-12 03:13:13', NULL),
(451, '10.240.0.207', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/menu_management/edit-save/22', 'Atualizar dados de Dashboard em Menu Management', 1, '2018-05-12 03:13:53', NULL),
(452, '10.240.0.231', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.231', 1, '2018-05-13 07:45:31', NULL),
(453, '10.240.1.60', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/logout', ' sair', NULL, '2018-05-13 14:00:08', NULL),
(454, '10.240.0.231', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.231', 1, '2018-05-13 14:00:23', NULL),
(455, '10.240.0.68', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.68', 1, '2018-05-15 08:57:25', NULL),
(456, '10.240.1.78', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.1.78', 1, '2018-05-15 16:08:41', NULL),
(457, '10.240.2.147', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.2.147', 1, '2018-05-15 20:16:04', NULL),
(458, '10.240.1.60', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/eventos/add-save', 'Adicionar novo conteúdo de 326 em Alugar Espaços', 1, '2018-05-15 22:16:12', NULL),
(459, '10.240.0.42', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.42', 1, '2018-05-15 23:28:44', NULL),
(460, '10.240.1.78', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/atividades/edit-save/2', 'Atualizar dados de  em Agendar Atividades', 1, '2018-05-15 23:29:54', NULL),
(461, '10.240.0.42', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/atividades/edit-save/2', 'Atualizar dados de  em Agendar Atividades', 1, '2018-05-15 23:34:08', NULL),
(462, '10.240.0.231', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/atividades/agendar/2', 'Agendar atividade 2 em Agendar Atividades', 1, '2018-05-16 00:29:51', NULL),
(463, '10.240.0.68', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/atividades/suspender/2', 'Suspender atividade 2 em Agendar Atividades', 1, '2018-05-16 01:18:28', NULL),
(464, '10.240.1.60', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/atividades/agendar/2', 'Agendar atividade 2 em Agendar Atividades', 1, '2018-05-16 01:23:06', NULL),
(465, '10.240.0.118', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/atividades/suspender/2', 'Suspender atividade 2 em Agendar Atividades', 1, '2018-05-16 01:37:05', NULL),
(466, '10.240.0.233', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/atividades/agendar/2', 'Agendar atividade 2 em Agendar Atividades', 1, '2018-05-16 01:45:13', NULL),
(467, '10.240.1.78', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/atividades/suspender/2', 'Suspender atividade 2 em Agendar Atividades', 1, '2018-05-16 01:48:49', NULL),
(468, '10.240.0.231', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/atividades/agendar/2', 'Agendar atividade 2 em Agendar Atividades', 1, '2018-05-16 02:07:42', NULL),
(469, '10.240.1.78', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/atividades/suspender/2', 'Suspender atividade 2 em Agendar Atividades', 1, '2018-05-16 02:08:56', NULL),
(470, '10.240.0.171', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/menu_management/delete/22', 'Excluir o conteúdo de Dashboard em Menu Management', 1, '2018-05-15 23:20:11', NULL),
(471, '10.240.0.207', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.207', 1, '2018-05-16 00:13:15', NULL),
(472, '10.240.0.207', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.207', 1, '2018-05-16 12:32:35', NULL),
(473, '10.240.1.60', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.1.60', 1, '2018-05-16 14:17:31', NULL),
(474, '10.240.0.233', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/atividades/add-save', 'Adicionar novo conteúdo de 3 em Agendar Atividades', 1, '2018-05-16 15:53:36', NULL),
(475, '10.240.1.21', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/atividades/agendar/3', 'Agendar atividade 3 em Agendar Atividades', 1, '2018-05-16 16:02:56', NULL),
(476, '10.240.0.171', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.171', 1, '2018-05-16 16:30:17', NULL),
(477, '10.240.0.231', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/atividades/suspender/3', 'Suspender atividade 3 em Agendar Atividades', 1, '2018-05-16 17:35:21', NULL),
(478, '10.240.0.42', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/atividades/add-save', 'Adicionar novo conteúdo de 4 em Agendar Atividades', 1, '2018-05-16 17:38:53', NULL),
(479, '10.240.1.21', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/atividades/agendar/4', 'Agendar atividade 4 em Agendar Atividades', 1, '2018-05-16 17:39:17', NULL),
(480, '10.240.2.147', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/atividades/suspender/4', 'Suspender atividade 4 em Agendar Atividades', 1, '2018-05-16 17:41:06', NULL),
(481, '10.240.1.60', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/atividades/agendar/4', 'Agendar atividade 4 em Agendar Atividades', 1, '2018-05-16 17:42:40', NULL),
(482, '10.240.0.118', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/atividades/edit-save/4', 'Atualizar dados de  em Agendar Atividades', 1, '2018-05-16 17:46:42', NULL),
(483, '10.240.1.21', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.1.21', 1, '2018-05-17 09:15:37', NULL),
(484, '10.240.2.147', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/matriculas/add-save', 'Adicionar novo conteúdo de 6 em Matricular Usuários', 1, '2018-05-17 09:29:36', NULL),
(485, '10.240.2.147', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/usuarios/add-save', 'Adicionar novo conteúdo de 5 em Usuários', 1, '2018-05-17 09:59:57', NULL),
(486, '10.240.1.78', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.1.78', 1, '2018-05-17 22:40:18', NULL),
(487, '10.240.1.60', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.1.60', 1, '2018-05-19 03:27:22', NULL),
(488, '10.240.2.147', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/atividades/agendar/3', 'Agendar atividade 3 em Agendar Atividades', 1, '2018-05-19 06:34:44', NULL),
(489, '10.240.1.60', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/eventos/edit-save/25', 'Atualizar dados de  em Alugar Espaços', 1, '2018-05-19 07:18:17', NULL),
(490, '10.240.0.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/eventos/edit-save/25', 'Atualizar dados de  em Alugar Espaços', 1, '2018-05-19 07:27:57', NULL),
(491, '10.240.1.60', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.1.60', 1, '2018-05-21 23:24:11', NULL),
(492, '10.240.0.118', 'Mozilla/5.0 (Windows NT 6.1; rv:40.0) Gecko/20100101 Firefox/40.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.118', 1, '2018-05-22 13:33:10', NULL),
(493, '10.240.0.42', 'Mozilla/5.0 (Windows NT 6.1; rv:40.0) Gecko/20100101 Firefox/40.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/atividades/delete/4', 'Excluir o conteúdo de 4 em Agendar Atividades', 1, '2018-05-22 13:37:29', NULL),
(494, '10.240.0.231', 'Mozilla/5.0 (Windows NT 6.1; rv:40.0) Gecko/20100101 Firefox/40.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/atividades/delete/4', 'Excluir o conteúdo de 4 em Agendar Atividades', 1, '2018-05-22 13:44:15', NULL),
(495, '10.240.0.233', 'Mozilla/5.0 (Windows NT 6.1; rv:40.0) Gecko/20100101 Firefox/40.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/eventos/add-save', 'Adicionar novo conteúdo de 379 em Alugar Espaços', 1, '2018-05-22 13:52:13', NULL),
(496, '10.240.0.231', 'Mozilla/5.0 (Windows NT 6.1; rv:40.0) Gecko/20100101 Firefox/40.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/eventos/edit-save/22', 'Atualizar dados de  em Alugar Espaços', 1, '2018-05-22 14:06:12', NULL),
(497, '10.240.0.68', 'Mozilla/5.0 (Windows NT 6.1; rv:40.0) Gecko/20100101 Firefox/40.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/eventos/delete/22', 'Excluir o conteúdo de 22 em Alugar Espaços', 1, '2018-05-22 14:06:49', NULL),
(498, '10.240.0.207', 'Mozilla/5.0 (Windows NT 6.1; rv:40.0) Gecko/20100101 Firefox/40.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/eventos/delete/22', 'Excluir o conteúdo de 22 em Alugar Espaços', 1, '2018-05-22 14:07:32', NULL),
(499, '10.240.0.118', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/socios/add-save', 'Adicionar novo conteúdo de 3 em Socios', 1, '2018-05-23 05:26:29', NULL),
(500, '10.240.0.118', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/dependentes/add-save', 'Adicionar novo conteúdo de 4 em Dependentes', 1, '2018-05-23 05:27:40', NULL),
(501, '10.240.0.171', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/dependentes/edit-save/4', 'Atualizar dados de  em Dependentes', 1, '2018-05-23 05:28:22', NULL),
(502, '10.240.0.68', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/socios/delete/3', 'Excluir o conteúdo de 3 em Socios', 1, '2018-05-23 05:29:56', NULL),
(503, '10.240.0.116', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.116', 1, '2018-05-23 19:50:37', NULL),
(504, '10.240.1.78', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.1.78', 1, '2018-05-23 22:56:28', NULL),
(505, '10.240.1.21', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.1.21', 1, '2018-05-24 08:37:45', NULL),
(506, '10.240.0.118', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', 'http://sgc-crudbooster-stable-sgaeteam.c9users.io/admin/atividades/add-save', 'Adicionar novo conteúdo de 5 em Agendar Atividades', 1, '2018-05-24 08:41:04', NULL),
(507, '10.240.1.21', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.1.21', 1, '2018-05-28 13:09:39', NULL),
(508, '10.240.0.118', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-sgaeteam.c9users.io/admin/eventos/add-save', 'Adicionar novo conteúdo de 380 em Alugar Espaços', 1, '2018-05-28 13:23:30', NULL),
(509, '10.240.0.207', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-sgaeteam.c9users.io/admin/eventos/add-save', 'Adicionar novo conteúdo de 381 em Alugar Espaços', 1, '2018-05-28 17:41:07', NULL),
(510, '10.240.1.60', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-sgaeteam.c9users.io/admin/eventos/add-save', 'Adicionar novo conteúdo de 382 em Alugar Espaços', 1, '2018-05-28 17:51:31', NULL),
(511, '10.240.2.147', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-sgaeteam.c9users.io/admin/eventos/add-save', 'Adicionar novo conteúdo de 383 em Alugar Espaços', 1, '2018-05-28 17:54:05', NULL),
(512, '10.240.2.147', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0 FirePHP/0.7.4', 'http://sgc-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.2.147', 1, '2018-05-28 21:51:25', NULL),
(513, '10.240.0.68', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0 FirePHP/0.7.4', 'http://sgc-sgaeteam.c9users.io/admin/eventos/add-save', 'Adicionar novo conteúdo de 384 em Alugar Espaços', 1, '2018-05-28 21:53:36', NULL),
(514, '10.240.0.68', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0 FirePHP/0.7.4', 'http://sgc-sgaeteam.c9users.io/admin/eventos/add-save', 'Adicionar novo conteúdo de 385 em Alugar Espaços', 1, '2018-05-28 21:59:50', NULL),
(515, '10.240.0.207', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', 'http://sgc-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.207', 1, '2018-05-29 12:52:48', NULL),
(516, '10.240.1.60', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', 'http://sgc-sgaeteam.c9users.io/admin/eventos/edit-save/382', 'Atualizar dados de  em Alugar Espaços', 1, '2018-05-29 12:56:55', NULL),
(517, '10.240.0.231', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', 'http://sgc-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.231', 1, '2018-05-29 20:09:36', NULL),
(518, '10.240.1.21', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', 'http://sgc-sgaeteam.c9users.io/admin/eventos/add-save', 'Adicionar novo conteúdo de 386 em Alugar Espaços', 1, '2018-05-29 20:41:44', NULL),
(519, '10.240.0.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', 'http://sgc-sgaeteam.c9users.io/admin/atividades/agendar/2', 'Agendar atividade 2 em Agendar Atividades', 1, '2018-05-29 21:10:25', NULL),
(520, '10.240.0.171', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', 'http://sgc-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.171', 1, '2018-05-29 21:59:41', NULL),
(521, '10.240.0.233', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.233', 1, '2018-05-30 05:58:38', NULL),
(522, '10.240.1.21', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', 'http://sgc-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.1.21', 1, '2018-05-30 14:09:17', NULL),
(523, '10.240.1.60', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', 'http://sgc-sgaeteam.c9users.io/admin/eventos/add-save', 'Adicionar novo conteúdo de 392 em Alugar Espaços', 1, '2018-05-30 14:14:15', NULL),
(524, '10.240.1.21', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', 'http://sgc-sgaeteam.c9users.io/admin/socios/add-save', 'Adicionar novo conteúdo de 4 em Socios', 1, '2018-05-30 14:25:55', NULL),
(525, '10.240.0.171', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', 'http://sgc-sgaeteam.c9users.io/admin/socios/edit-save/4', 'Atualizar dados de  em Socios', 1, '2018-05-30 14:27:12', NULL),
(526, '10.240.0.207', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', 'http://sgc-sgaeteam.c9users.io/admin/socios/edit-save/4', 'Atualizar dados de  em Socios', 1, '2018-05-30 14:29:28', NULL),
(527, '10.240.0.207', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.207', 1, '2018-06-01 06:33:00', NULL),
(528, '10.240.2.147', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-sgaeteam.c9users.io/admin/menu_management/edit-save/21', 'Atualizar dados de Visão Geral em Menu Management', 1, '2018-06-01 07:03:10', NULL),
(529, '10.240.1.21', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-sgaeteam.c9users.io/admin/menu_management/edit-save/21', 'Atualizar dados de Visão Geral em Menu Management', 1, '2018-06-01 07:08:23', NULL),
(530, '10.240.1.21', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-sgaeteam.c9users.io/admin/statistic_builder/edit-save/1', 'Atualizar dados de Painel de Controle em Statistic Builder', 1, '2018-06-01 07:10:10', NULL),
(531, '10.240.1.78', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.1.78', 1, '2018-06-02 10:56:59', NULL),
(532, '10.240.0.118', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-sgaeteam.c9users.io/admin/socios/add-save', 'Adicionar novo conteúdo de 5 em Socios', 1, '2018-06-02 19:01:54', NULL),
(533, '10.240.1.21', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-sgaeteam.c9users.io/admin/socios/add-save', 'Adicionar novo conteúdo de 6 em Socios', 1, '2018-06-02 19:15:26', NULL),
(534, '10.240.2.147', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-sgaeteam.c9users.io/admin/socios/add-save', 'Adicionar novo conteúdo de 7 em Socios', 1, '2018-06-02 19:40:37', NULL),
(535, '10.240.0.42', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-sgaeteam.c9users.io/admin/socios/add-save', 'Adicionar novo conteúdo de 8 em Socios', 1, '2018-06-02 19:44:03', NULL),
(536, '10.240.0.68', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-sgaeteam.c9users.io/admin/socios/edit-save/8', 'Atualizar dados de  em Socios', 1, '2018-06-02 19:45:50', NULL),
(537, '10.240.0.207', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-sgaeteam.c9users.io/admin/socios/add-save', 'Adicionar novo conteúdo de 9 em Socios', 1, '2018-06-02 19:48:36', NULL),
(538, '10.240.0.42', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.42', 1, '2018-06-03 08:21:45', NULL),
(539, '10.240.1.78', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-sgaeteam.c9users.io/admin/dependentes/action-selected', 'Excluir o conteúdo de 3,2,1 em Dependentes', 1, '2018-06-03 08:27:58', NULL),
(540, '10.240.0.231', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-sgaeteam.c9users.io/admin/socios/add-save', 'Adicionar novo conteúdo de 10 em Socios', 1, '2018-06-03 19:59:11', NULL),
(541, '10.240.0.233', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-sgaeteam.c9users.io/admin/socios/add-save', 'Adicionar novo conteúdo de 11 em Socios', 1, '2018-06-03 20:04:44', NULL),
(542, '10.240.0.207', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', 'http://sgc-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.207', 1, '2018-06-03 21:05:16', NULL),
(543, '10.240.0.42', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', 'http://sgc-sgaeteam.c9users.io/admin/socios/add-save', 'Adicionar novo conteúdo de 12 em Socios', 1, '2018-06-03 21:09:23', NULL),
(544, '10.240.0.118', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.118', 1, '2018-06-04 19:39:10', NULL),
(545, '10.240.1.21', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-sgaeteam.c9users.io/admin/atividades/agendar/5', 'Agendar atividade 5 em Agendar Atividades', 1, '2018-06-04 20:00:53', NULL),
(546, '10.240.0.68', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-sgaeteam.c9users.io/admin/atividades/suspender/5', 'Suspender atividade 5 em Agendar Atividades', 1, '2018-06-04 20:06:29', NULL),
(547, '10.240.0.118', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-sgaeteam.c9users.io/admin/atividades/agendar/5', 'Agendar atividade 5 em Agendar Atividades', 1, '2018-06-04 20:07:23', NULL),
(548, '10.240.1.21', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-sgaeteam.c9users.io/admin/atividades/suspender/1', 'Suspender atividade 1 em Agendar Atividades', 1, '2018-06-04 20:22:19', NULL),
(549, '10.240.1.78', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-sgaeteam.c9users.io/admin/atividades/suspender/2', 'Suspender atividade 2 em Agendar Atividades', 1, '2018-06-04 20:22:28', NULL),
(550, '10.240.1.60', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-sgaeteam.c9users.io/admin/atividades/suspender/3', 'Suspender atividade 3 em Agendar Atividades', 1, '2018-06-04 20:22:51', NULL),
(551, '10.240.1.60', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-sgaeteam.c9users.io/admin/atividades/agendar/3', 'Agendar atividade 3 em Agendar Atividades', 1, '2018-06-04 20:25:28', NULL),
(552, '10.240.1.21', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-sgaeteam.c9users.io/admin/atividades/agendar/2', 'Agendar atividade 2 em Agendar Atividades', 1, '2018-06-04 20:25:39', NULL),
(553, '10.240.1.60', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-sgaeteam.c9users.io/admin/atividades/agendar/1', 'Agendar atividade 1 em Agendar Atividades', 1, '2018-06-04 20:25:50', NULL),
(554, '10.240.0.68', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-sgaeteam.c9users.io/admin/socios/add-save', 'Adicionar novo conteúdo de 13 em Socios', 1, '2018-06-04 20:37:26', NULL),
(555, '10.240.1.21', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-sgaeteam.c9users.io/admin/dependentes/add-save', 'Adicionar novo conteúdo de 16 em Dependentes', 1, '2018-06-04 21:34:42', NULL),
(556, '10.240.1.60', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.1.60', 1, '2018-06-04 21:42:27', NULL),
(557, '10.240.1.21', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-sgaeteam.c9users.io/admin/dependentes/add-save', 'Adicionar novo conteúdo de 17 em Dependentes', 1, '2018-06-04 21:45:22', NULL),
(558, '10.240.0.171', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-sgaeteam.c9users.io/admin/dependentes/action-selected', 'Excluir o conteúdo de 16,15,14,13,12,11,10,9,8,7,6,5 em Dependentes', 1, '2018-06-04 21:52:20', NULL),
(559, '10.240.0.207', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0', 'http://sgc-sgaeteam.c9users.io/admin/socios/add-save', 'Adicionar novo conteúdo de 14 em Socios', 1, '2018-06-04 21:54:54', NULL),
(560, '10.240.1.60', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', 'http://sgc-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.1.60', 1, '2018-06-05 17:06:05', NULL),
(561, '10.240.0.68', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', 'http://sgc-sgaeteam.c9users.io/admin/dependentes/add-save', 'Adicionar novo conteúdo de 19 em Dependentes', 1, '2018-06-05 17:16:57', NULL),
(562, '10.240.0.42', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', 'http://sgc-sgaeteam.c9users.io/admin/dependentes/delete/18', 'Excluir o conteúdo de 18 em Dependentes', 1, '2018-06-05 17:17:08', NULL),
(563, '10.240.0.68', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', 'http://sgc-sgaeteam.c9users.io/admin/dependentes/add-save', 'Adicionar novo conteúdo de 20 em Dependentes', 1, '2018-06-05 17:19:23', NULL),
(564, '10.240.0.231', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', 'http://sgc-sgaeteam.c9users.io/admin/dependentes/add-save', 'Adicionar novo conteúdo de 21 em Dependentes', 1, '2018-06-05 17:29:49', NULL),
(565, '10.240.1.78', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', 'http://sgc-sgaeteam.c9users.io/admin/dependentes/add-save', 'Adicionar novo conteúdo de 22 em Dependentes', 1, '2018-06-05 17:42:18', NULL),
(566, '10.240.0.207', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', 'http://sgc-sgaeteam.c9users.io/admin/dependentes/add-save', 'Adicionar novo conteúdo de 23 em Dependentes', 1, '2018-06-05 17:43:05', NULL),
(567, '10.240.0.171', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', 'http://sgc-sgaeteam.c9users.io/admin/dependentes/delete/21', 'Excluir o conteúdo de 21 em Dependentes', 1, '2018-06-05 17:43:19', NULL);
INSERT INTO `cms_logs` (`id`, `ipaddress`, `useragent`, `url`, `description`, `id_cms_users`, `created_at`, `updated_at`) VALUES
(568, '10.240.0.42', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', 'http://sgc-sgaeteam.c9users.io/admin/dependentes/add-save', 'Adicionar novo conteúdo de 24 em Dependentes', 1, '2018-06-05 17:44:32', NULL),
(569, '10.240.0.116', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', 'http://sgc-sgaeteam.c9users.io/admin/socios/add-save', 'Adicionar novo conteúdo de 15 em Socios', 1, '2018-06-05 17:46:49', NULL),
(570, '10.240.1.21', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', 'http://sgc-sgaeteam.c9users.io/admin/atividades/add-save', 'Adicionar novo conteúdo de 6 em Agendar Atividades', 1, '2018-06-05 17:53:20', NULL),
(571, '10.240.0.171', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', 'http://sgc-sgaeteam.c9users.io/admin/atividades/agendar/6', 'Agendar atividade 6 em Agendar Atividades', 1, '2018-06-05 17:54:42', NULL),
(572, '10.240.0.233', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', 'http://sgc-sgaeteam.c9users.io/admin/dependentes/add-save', 'Adicionar novo conteúdo de 26 em Dependentes', 1, '2018-06-05 18:18:18', NULL),
(573, '10.240.0.42', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', 'http://sgc-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.42', 1, '2018-06-06 11:00:26', NULL),
(574, '10.240.2.147', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', 'http://sgc-sgaeteam.c9users.io/admin/socios/add-save', 'Adicionar novo conteúdo de 16 em Socios', 1, '2018-06-06 11:30:51', NULL),
(575, '10.240.2.147', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', 'http://sgc-sgaeteam.c9users.io/admin/atividades/add-save', 'Adicionar novo conteúdo de 7 em Agendar Atividades', 1, '2018-06-06 18:02:43', NULL),
(576, '10.240.0.231', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', 'http://sgc-sgaeteam.c9users.io/admin/atividades/agendar/7', 'Agendar atividade 7 em Agendar Atividades', 1, '2018-06-06 18:03:03', NULL),
(577, '10.240.1.60', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', 'http://sgc-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.1.60', 1, '2018-06-07 16:56:33', NULL),
(578, '10.240.2.147', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', 'http://sgc-sgaeteam.c9users.io/admin/socios/add-save', 'Adicionar novo conteúdo de 17 em Socios', 1, '2018-06-07 17:07:25', NULL),
(579, '10.240.0.233', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', 'http://sgc-sgaeteam.c9users.io/admin/socios/add-save', 'Adicionar novo conteúdo de 18 em Socios', 1, '2018-06-07 17:13:49', NULL),
(580, '10.240.0.233', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', 'http://sgc-sgaeteam.c9users.io/admin/socios/add-save', 'Adicionar novo conteúdo de 26 em Socios', 1, '2018-06-07 18:10:36', NULL),
(581, '10.240.0.231', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', 'http://sgc-sgaeteam.c9users.io/admin/socios/add-save', 'Adicionar novo conteúdo de 29 em Socios', 1, '2018-06-07 18:13:51', NULL),
(582, '10.240.1.21', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', 'http://sgc-sgaeteam.c9users.io/admin/socios/add-save', 'Adicionar novo conteúdo de 31 em Socios', 1, '2018-06-07 18:17:57', NULL),
(583, '10.240.0.42', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', 'http://sgc-sgaeteam.c9users.io/admin/socios/add-save', 'Adicionar novo conteúdo de 38 em Socios', 1, '2018-06-07 18:27:22', NULL),
(584, '10.240.0.233', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', 'http://sgc-sgaeteam.c9users.io/admin/socios/add-save', 'Adicionar novo conteúdo de 39 em Socios', 1, '2018-06-07 18:31:27', NULL),
(585, '10.240.1.21', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', 'http://sgc-sgaeteam.c9users.io/admin/socios/add-save', 'Adicionar novo conteúdo de 40 em Socios', 1, '2018-06-07 18:33:18', NULL),
(586, '10.240.0.42', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', 'http://sgc-sgaeteam.c9users.io/admin/eventos/add-save', 'Adicionar novo conteúdo de 513 em Alugar Espaços', 1, '2018-06-07 18:35:29', NULL),
(587, '10.240.0.116', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', 'http://sgc-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.116', 1, '2018-06-07 22:52:10', NULL),
(588, '10.240.1.21', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', 'http://sgc-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.1.21', 1, '2018-06-08 17:26:08', NULL),
(589, '10.240.0.207', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', 'http://sgc-sgaeteam.c9users.io/admin/socios/action-selected', 'Excluir o conteúdo de 38,37,36,35,34,33,32,31,30,29,28,27,26,25,24,23,22,21 em Socios', 1, '2018-06-08 18:12:17', NULL),
(590, '10.240.0.233', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', 'http://sgc-sgaeteam.c9users.io/admin/socios/action-selected', 'Excluir o conteúdo de 20,19,16,14,4 em Socios', 1, '2018-06-08 18:14:56', NULL),
(591, '10.240.0.68', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', 'http://sgc-sgaeteam.c9users.io/admin/login', 'admin@crudbooster.com se logou com o endereo de IP 10.240.0.68', 1, '2018-06-09 18:32:16', NULL),
(592, '10.240.0.68', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', 'http://sgc-sgaeteam.c9users.io/admin/logout', 'admin@crudbooster.com sair', 1, '2018-06-09 18:38:06', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `cms_menus`
--

CREATE TABLE IF NOT EXISTS `cms_menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'url',
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_dashboard` tinyint(1) NOT NULL DEFAULT '0',
  `id_cms_privileges` int(11) DEFAULT NULL,
  `sorting` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=24 ;

--
-- Fazendo dump de dados para tabela `cms_menus`
--

INSERT INTO `cms_menus` (`id`, `name`, `type`, `path`, `color`, `icon`, `parent_id`, `is_active`, `is_dashboard`, `id_cms_privileges`, `sorting`, `created_at`, `updated_at`) VALUES
(1, 'Produtos', 'Route', 'AdminProdutosControllerGetIndex', 'normal', 'fa fa-product-hunt', 5, 1, 0, 1, 7, '2018-02-22 21:31:49', '2018-02-27 00:46:10'),
(15, 'Fornecedores', 'Route', 'AdminFornecedoresControllerGetIndex', 'normal', 'fa fa-database', 5, 1, 0, 1, 6, '2018-03-22 23:08:43', '2018-03-26 10:43:51'),
(3, 'Alugar Espaços', 'Route', 'AdminEventosControllerGetIndex', 'normal', 'fa fa-calendar-plus-o', 6, 1, 0, 1, 1, '2018-02-24 11:42:29', '2018-03-26 11:26:47'),
(4, 'Sócios', 'Module', 'socios', 'normal', 'fa fa-group', 5, 1, 0, 1, 9, '2018-02-27 01:13:14', '2018-03-11 01:56:09'),
(5, 'Cadastros', 'URL', '#', 'green', 'fa fa-book', 0, 1, 0, 1, 2, '2018-02-27 02:28:08', '2018-02-27 03:20:06'),
(6, 'Administração', 'URL', '#', 'aqua', 'fa fa-gears', 0, 1, 0, 1, 3, '2018-02-27 02:28:48', '2018-02-27 03:14:44'),
(7, 'Relatórios', 'URL', '#', 'yellow', 'fa fa-newspaper-o', 0, 1, 0, 1, 4, '2018-02-27 03:17:44', '2018-02-27 03:20:54'),
(8, 'Categorias', 'Route', 'AdminCategoriasControllerGetIndex', NULL, 'fa fa-flag-checkered', 5, 1, 0, 1, 2, '2018-02-27 03:46:08', NULL),
(9, 'Cobranças', 'Route', 'AdminCobrancasControllerGetIndex', 'normal', 'fa fa-thumbs-o-up', 5, 1, 0, 1, 3, '2018-02-27 23:52:01', '2018-02-27 23:56:02'),
(16, 'Tipos de Atividade', 'Route', 'AdminTipoAtividadesControllerGetIndex', 'normal', 'fa fa-bicycle', 5, 1, 0, 1, 10, '2018-03-26 07:35:11', '2018-03-26 07:42:00'),
(11, 'Users', 'Route', 'AdminCmsUsersControllerGetIndex', 'normal', 'fa fa-users', 0, 1, 0, 1, 5, '2018-03-08 00:54:59', NULL),
(12, 'Área de Competências', 'Route', 'AdminAreaCompetenciasControllerGetIndex', 'normal', 'fa fa-gears', 5, 1, 0, 1, 1, '2018-03-08 11:30:33', '2018-03-11 07:12:08'),
(13, 'Espaços', 'Route', 'AdminEspacosControllerGetIndex', NULL, 'fa fa-sitemap', 5, 1, 0, 1, 5, '2018-03-09 09:59:50', NULL),
(14, 'Dependentes', 'Route', 'AdminDependentesControllerGetIndex', 'normal', 'fa fa-smile-o', 5, 1, 0, 1, 4, '2018-03-11 04:48:48', '2018-03-11 04:58:11'),
(17, 'Professores', 'Route', 'AdminProfessoresControllerGetIndex', 'normal', 'fa fa-mortar-board', 5, 1, 0, 1, 8, '2018-03-26 09:37:57', '2018-03-26 09:43:20'),
(18, 'Usuários', 'Route', 'AdminUsuariosControllerGetIndex', 'normal', 'fa fa-child', 5, 1, 0, 1, 11, '2018-03-26 09:46:29', '2018-03-26 10:40:24'),
(20, 'Matricular Usuários', 'Route', 'AdminMatriculasControllerGetIndex', 'normal', 'fa fa-user-plus', 6, 1, 0, 1, 3, '2018-03-26 10:55:52', '2018-03-26 11:36:16'),
(23, 'Agendar Atividades', 'Route', 'AdminAtividadesControllerGetIndex', NULL, 'fa fa-calendar-check-o', 6, 1, 0, 1, 2, '2018-04-22 13:12:09', NULL),
(21, 'Visão Geral', 'Statistic', 'statistic_builder/show/dashboad-contadores', 'normal', 'fa fa-bar-chart-o', 7, 1, 1, 1, 1, '2018-03-27 11:01:38', '2018-06-01 07:08:23');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cms_moduls`
--

CREATE TABLE IF NOT EXISTS `cms_moduls` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `table_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_protected` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=29 ;

--
-- Fazendo dump de dados para tabela `cms_moduls`
--

INSERT INTO `cms_moduls` (`id`, `name`, `icon`, `path`, `table_name`, `controller`, `is_protected`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Notifications', 'fa fa-cog', 'notifications', 'cms_notifications', 'NotificationsController', 1, 1, '2018-02-22 18:58:51', NULL),
(2, 'Privileges', 'fa fa-cog', 'privileges', 'cms_privileges', 'PrivilegesController', 1, 1, '2018-02-22 18:58:51', NULL),
(3, 'Privileges Roles', 'fa fa-cog', 'privileges_roles', 'cms_privileges_roles', 'PrivilegesRolesController', 1, 1, '2018-02-22 18:58:51', NULL),
(4, 'Users', 'fa fa-users', 'users', 'cms_users', 'AdminCmsUsersController', 0, 1, '2018-02-22 18:58:51', NULL),
(5, 'Settings', 'fa fa-cog', 'settings', 'cms_settings', 'SettingsController', 1, 1, '2018-02-22 18:58:51', NULL),
(6, 'Module Generator', 'fa fa-database', 'module_generator', 'cms_moduls', 'ModulsController', 1, 1, '2018-02-22 18:58:51', NULL),
(7, 'Menu Management', 'fa fa-bars', 'menu_management', 'cms_menus', 'MenusController', 1, 1, '2018-02-22 18:58:51', NULL),
(8, 'Email Template', 'fa fa-envelope-o', 'email_templates', 'cms_email_templates', 'EmailTemplatesController', 1, 1, '2018-02-22 18:58:51', NULL),
(9, 'Statistic Builder', 'fa fa-dashboard', 'statistic_builder', 'cms_statistics', 'StatisticBuilderController', 1, 1, '2018-02-22 18:58:51', NULL),
(10, 'API Generator', 'fa fa-cloud-download', 'api_generator', '', 'ApiCustomController', 1, 1, '2018-02-22 18:58:51', NULL),
(11, 'Logs', 'fa fa-flag-o', 'logs', 'cms_logs', 'LogsController', 1, 1, '2018-02-22 18:58:51', NULL),
(12, 'Produtos', 'fa fa-product-hunt', 'produtos', 'produtos', 'AdminProdutosController', 0, 0, '2018-02-22 21:31:49', NULL),
(24, 'Professores', 'fa fa-graduation-cap', 'professores', 'professores', 'AdminProfessoresController', 0, 0, '2018-03-26 09:37:39', NULL),
(14, 'Alugar Espaços', 'fa fa-calendar-plus-o', 'eventos', 'eventos', 'AdminEventosController', 0, 0, '2018-02-24 11:42:29', NULL),
(15, 'Categorias', 'fa fa-flag-checkered', 'categorias', 'categorias', 'AdminCategoriasController', 0, 0, '2018-02-27 03:46:08', NULL),
(16, 'Cobranças', 'fa fa-thumbs-o-up', 'cobrancas', 'cobrancas', 'AdminCobrancasController', 0, 0, '2018-02-27 23:52:01', NULL),
(25, 'Usuários', 'fa fa-child', 'usuarios', 'usuarios', 'AdminUsuariosController', 0, 0, '2018-03-26 09:46:00', NULL),
(18, 'Área de Competências', 'fa fa-cogs', 'area__competencias', 'area__competencias', 'AdminAreaCompetenciasController', 0, 0, '2018-03-08 11:30:26', NULL),
(19, 'Espaços', 'fa fa-sitemap', 'espacos', 'espacos', 'AdminEspacosController', 0, 0, '2018-03-09 09:59:38', NULL),
(20, 'Socios', 'fa fa-users', 'socios', 'socios', 'AdminSociosController', 0, 0, '2018-03-10 21:21:32', NULL),
(21, 'Dependentes', 'fa fa-smile-o', 'dependentes', 'dependentes', 'AdminDependentesController', 0, 0, '2018-03-11 04:48:33', NULL),
(22, 'Fornecedores', 'fa fa-database', 'fornecedores', 'fornecedores', 'AdminFornecedoresController', 0, 0, '2018-03-22 23:08:30', NULL),
(23, 'Tipos de Atividade', 'fa fa-bicycle', 'tipo_atividades', 'tipo_atividades', 'AdminTipoAtividadesController', 0, 0, '2018-03-26 07:35:06', NULL),
(28, 'Agendar Atividades', 'fa fa-calendar-check-o', 'atividades', 'atividades', 'AdminAtividadesController', 0, 0, '2018-03-26 07:35:06', NULL),
(27, 'Matricular Usuários', 'fa fa-user-plus', 'matriculas', 'matriculas', 'AdminMatriculasController', 0, 0, '2018-03-26 10:55:43', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `cms_notifications`
--

CREATE TABLE IF NOT EXISTS `cms_notifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_cms_users` int(11) DEFAULT NULL,
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cms_privileges`
--

CREATE TABLE IF NOT EXISTS `cms_privileges` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_superadmin` tinyint(1) DEFAULT NULL,
  `theme_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Fazendo dump de dados para tabela `cms_privileges`
--

INSERT INTO `cms_privileges` (`id`, `name`, `is_superadmin`, `theme_color`, `created_at`, `updated_at`) VALUES
(1, 'Super Administrator', 1, 'skin-blue-light', '2018-02-22 18:58:51', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `cms_privileges_roles`
--

CREATE TABLE IF NOT EXISTS `cms_privileges_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_visible` tinyint(1) DEFAULT NULL,
  `is_create` tinyint(1) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT NULL,
  `is_edit` tinyint(1) DEFAULT NULL,
  `is_delete` tinyint(1) DEFAULT NULL,
  `id_cms_privileges` int(11) DEFAULT NULL,
  `id_cms_moduls` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=31 ;

--
-- Fazendo dump de dados para tabela `cms_privileges_roles`
--

INSERT INTO `cms_privileges_roles` (`id`, `is_visible`, `is_create`, `is_read`, `is_edit`, `is_delete`, `id_cms_privileges`, `id_cms_moduls`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 0, 0, 0, 1, 1, '2018-02-22 18:58:51', NULL),
(2, 1, 1, 1, 1, 1, 1, 2, '2018-02-22 18:58:51', NULL),
(3, 0, 1, 1, 1, 1, 1, 3, '2018-02-22 18:58:51', NULL),
(4, 1, 1, 1, 1, 1, 1, 4, '2018-02-22 18:58:51', NULL),
(5, 1, 1, 1, 1, 1, 1, 5, '2018-02-22 18:58:51', NULL),
(6, 1, 1, 1, 1, 1, 1, 6, '2018-02-22 18:58:51', NULL),
(7, 1, 1, 1, 1, 1, 1, 7, '2018-02-22 18:58:51', NULL),
(8, 1, 1, 1, 1, 1, 1, 8, '2018-02-22 18:58:51', NULL),
(9, 1, 1, 1, 1, 1, 1, 9, '2018-02-22 18:58:51', NULL),
(10, 1, 1, 1, 1, 1, 1, 10, '2018-02-22 18:58:51', NULL),
(11, 1, 0, 1, 0, 1, 1, 11, '2018-02-22 18:58:51', NULL),
(12, 1, 1, 1, 1, 1, 1, 12, NULL, NULL),
(13, 1, 1, 1, 1, 1, 1, 13, NULL, NULL),
(14, 1, 1, 1, 1, 1, 1, 14, NULL, NULL),
(15, 1, 1, 1, 1, 1, 1, 14, NULL, NULL),
(16, 1, 1, 1, 1, 1, 1, 14, NULL, NULL),
(17, 1, 1, 1, 1, 1, 1, 15, NULL, NULL),
(18, 1, 1, 1, 1, 1, 1, 16, NULL, NULL),
(19, 1, 1, 1, 1, 1, 1, 17, NULL, NULL),
(20, 1, 1, 1, 1, 1, 1, 18, NULL, NULL),
(21, 1, 1, 1, 1, 1, 1, 19, NULL, NULL),
(22, 1, 1, 1, 1, 1, 1, 20, NULL, NULL),
(23, 1, 1, 1, 1, 1, 1, 21, NULL, NULL),
(24, 1, 1, 1, 1, 1, 1, 22, NULL, NULL),
(25, 1, 1, 1, 1, 1, 1, 23, NULL, NULL),
(26, 1, 1, 1, 1, 1, 1, 24, NULL, NULL),
(27, 1, 1, 1, 1, 1, 1, 25, NULL, NULL),
(28, 1, 1, 1, 1, 1, 1, 26, NULL, NULL),
(29, 1, 1, 1, 1, 1, 1, 27, NULL, NULL),
(30, 1, 1, 1, 1, 1, 1, 28, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `cms_settings`
--

CREATE TABLE IF NOT EXISTS `cms_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `content_input_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dataenum` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `helper` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `group_setting` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=17 ;

--
-- Fazendo dump de dados para tabela `cms_settings`
--

INSERT INTO `cms_settings` (`id`, `name`, `content`, `content_input_type`, `dataenum`, `helper`, `created_at`, `updated_at`, `group_setting`, `label`) VALUES
(1, 'login_background_color', NULL, 'text', NULL, 'Input hexacode', '2018-02-22 18:58:51', NULL, 'Login Register Style', 'Login Background Color'),
(2, 'login_font_color', NULL, 'text', NULL, 'Input hexacode', '2018-02-22 18:58:51', NULL, 'Login Register Style', 'Login Font Color'),
(3, 'login_background_image', NULL, 'upload_image', NULL, NULL, '2018-02-22 18:58:51', NULL, 'Login Register Style', 'Login Background Image'),
(4, 'email_sender', 'support@crudbooster.com', 'text', NULL, NULL, '2018-02-22 18:58:51', NULL, 'Email Setting', 'Email Sender'),
(5, 'smtp_driver', 'mail', 'select', 'smtp,mail,sendmail', NULL, '2018-02-22 18:58:51', NULL, 'Email Setting', 'Mail Driver'),
(6, 'smtp_host', '', 'text', NULL, NULL, '2018-02-22 18:58:51', NULL, 'Email Setting', 'SMTP Host'),
(7, 'smtp_port', '25', 'text', NULL, 'default 25', '2018-02-22 18:58:51', NULL, 'Email Setting', 'SMTP Port'),
(8, 'smtp_username', '', 'text', NULL, NULL, '2018-02-22 18:58:51', NULL, 'Email Setting', 'SMTP Username'),
(9, 'smtp_password', '', 'text', NULL, NULL, '2018-02-22 18:58:51', NULL, 'Email Setting', 'SMTP Password'),
(10, 'appname', 'SGC 1.0 Admin', 'text', NULL, NULL, '2018-02-22 18:58:51', NULL, 'Application Setting', 'Application Name'),
(11, 'default_paper_size', 'A4', 'text', NULL, 'Paper size, ex : A4, Legal, etc', '2018-02-22 18:58:51', NULL, 'Application Setting', 'Default Paper Print Size'),
(12, 'logo', NULL, 'upload_image', NULL, NULL, '2018-02-22 18:58:51', NULL, 'Application Setting', 'Logo'),
(13, 'favicon', NULL, 'upload_image', NULL, NULL, '2018-02-22 18:58:51', NULL, 'Application Setting', 'Favicon'),
(14, 'api_debug_mode', 'true', 'select', 'true,false', NULL, '2018-02-22 18:58:51', NULL, 'Application Setting', 'API Debug Mode'),
(15, 'google_api_key', '', 'text', NULL, NULL, '2018-02-22 18:58:51', NULL, 'Application Setting', 'Google API Key'),
(16, 'google_fcm_key', '', 'text', NULL, NULL, '2018-02-22 18:58:51', NULL, 'Application Setting', 'Google FCM Key');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cms_statistics`
--

CREATE TABLE IF NOT EXISTS `cms_statistics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Fazendo dump de dados para tabela `cms_statistics`
--

INSERT INTO `cms_statistics` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Painel de Controle', 'dashboad-contadores', '2018-03-24 08:19:51', '2018-06-01 07:10:10');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cms_statistic_components`
--

CREATE TABLE IF NOT EXISTS `cms_statistic_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_cms_statistics` int(11) DEFAULT NULL,
  `componentID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `component_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `area_name` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sorting` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `config` longtext COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=17 ;

--
-- Fazendo dump de dados para tabela `cms_statistic_components`
--

INSERT INTO `cms_statistic_components` (`id`, `id_cms_statistics`, `componentID`, `component_name`, `area_name`, `sorting`, `name`, `config`, `created_at`, `updated_at`) VALUES
(1, 1, 'a968b6bb462e24d3fd98baea26d34ec8', 'smallbox', 'area2', 0, NULL, '{"name":"Total de S\\u00f3cios","icon":"ion-person-stalker","color":"bg-green","link":"socios?m=4","sql":"select count(id) from socios where deleted_at is null"}', '2018-03-24 08:22:38', NULL),
(2, 1, '64045cc1d27e6331448c2df16ed74c00', 'smallbox', 'area1', 0, NULL, '{"name":"Total de eventos no m\\u00eas","icon":"ion-ios-calendar","color":"bg-red","link":"eventos?m=3","sql":"SELECT count(id) FROM `eventos` WHERE DATE_FORMAT(`start_date`, ''%m\\/%Y'') =  DATE_FORMAT(now(),''%m\\/%Y'') and `deleted_at` is null"}', '2018-03-24 08:22:47', NULL),
(3, 1, 'cdcbdce9a3c9f252b8bb1778a1dd958f', 'smallbox', 'area3', 0, NULL, '{"name":"Total de dependentes","icon":"ion-person-add","color":"bg-aqua","link":"dependentes?m=14","sql":"select count(id) from dependentes where `deleted_at` is null"}', '2018-03-24 08:22:51', NULL),
(4, 1, '03057bb2ad1c75a8d4832b1b61d71df2', 'smallbox', 'area4', 0, NULL, '{"name":"Total de Professores","icon":"ion-bag","color":"bg-yellow","link":"professores?m=17","sql":"select count(id) from professores where `deleted_at`is null"}', '2018-03-30 05:35:28', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `cms_users`
--

CREATE TABLE IF NOT EXISTS `cms_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_cms_privileges` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Fazendo dump de dados para tabela `cms_users`
--

INSERT INTO `cms_users` (`id`, `name`, `photo`, `email`, `password`, `id_cms_privileges`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Super Admin', NULL, 'admin@crudbooster.com', '$2y$10$L.s6zuKEs4C/jR/Qyc6Q/.AdjjJhn61c63bSdL/GLhv5OFUIzjY26', 1, '2018-02-22 18:58:51', NULL, 'Active');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cobrancas`
--

CREATE TABLE IF NOT EXISTS `cobrancas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `descricao` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Fazendo dump de dados para tabela `cobrancas`
--

INSERT INTO `cobrancas` (`id`, `created_at`, `updated_at`, `deleted_at`, `descricao`) VALUES
(1, '2018-02-27 23:48:17', '2018-02-27 23:48:17', NULL, 'Secretaria'),
(2, '2018-02-27 23:48:17', '2018-02-27 23:48:17', NULL, 'BANEB - Ag. Centro'),
(3, '2018-02-27 23:48:17', '2018-02-27 23:48:17', NULL, 'Folha de Pagamento'),
(4, '2018-02-27 23:48:17', '2018-02-27 23:48:17', NULL, 'Isento de Pagamento'),
(5, '2018-02-27 23:48:17', '2018-02-27 23:48:17', NULL, 'Sócio Afim');

-- --------------------------------------------------------

--
-- Estrutura para tabela `dependentes`
--

CREATE TABLE IF NOT EXISTS `dependentes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `socio_id` int(11) NOT NULL,
  `dependente_nome` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `dependente_sexo` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dependente_dtnasc` date DEFAULT NULL,
  `dependente_grau` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=36 ;

--
-- Fazendo dump de dados para tabela `dependentes`
--

INSERT INTO `dependentes` (`id`, `created_at`, `updated_at`, `deleted_at`, `socio_id`, `dependente_nome`, `dependente_sexo`, `dependente_dtnasc`, `dependente_grau`) VALUES
(1, '2018-03-11 05:02:47', '2018-03-11 07:05:23', '2018-06-03 08:27:58', 2, '', NULL, NULL, NULL),
(2, '2018-03-11 05:03:43', '2018-03-11 07:05:01', '2018-06-03 08:27:58', 2, '', NULL, NULL, NULL),
(3, '2018-03-26 20:12:50', '2018-03-26 20:13:36', '2018-06-03 08:27:58', 1, '', NULL, NULL, NULL),
(4, '2018-05-23 05:27:40', '2018-05-23 05:28:22', '2018-05-23 05:29:56', 3, '', NULL, NULL, NULL),
(5, NULL, NULL, '2018-06-04 21:52:20', 5, 'Bebe de Rosemary', NULL, NULL, NULL),
(6, NULL, NULL, '2018-06-04 21:52:20', 6, 'Gigi', NULL, NULL, NULL),
(7, NULL, NULL, '2018-06-04 21:52:20', 6, 'Nega do Fortal', NULL, NULL, NULL),
(8, NULL, NULL, '2018-06-04 21:52:20', 6, 'Ereny', NULL, NULL, NULL),
(9, NULL, NULL, '2018-06-04 21:52:20', 7, 'BobNelson', 'M', '0000-00-00', 'Filho'),
(10, NULL, NULL, '2018-06-04 21:52:20', 8, 'feiticeira', 'f', '0000-00-00', 'filha'),
(11, NULL, NULL, '2018-06-04 21:52:20', 9, 'Da Lua', 'M', '0000-00-00', 'MAluco'),
(12, NULL, NULL, '2018-06-04 21:52:20', 10, 'Vitolinha', 'M', '0000-00-00', 'Papai Smurf'),
(13, NULL, NULL, '2018-06-04 21:52:20', 11, 'Neymar Jr', 'M', '0000-00-00', 'Filho(a)'),
(14, NULL, NULL, '2018-06-04 21:52:20', 12, 'Walter Jr', 'Masculino', '0000-00-00', 'Filho(a)'),
(15, NULL, NULL, '2018-06-04 21:52:20', 13, 'Gandhy', 'Masculino', '0000-00-00', 'Neto(a)'),
(16, '2018-06-04 21:34:42', NULL, '2018-06-04 21:52:20', 9, 'Teste do Rato', 'Masculino', '0000-00-00', 'Filho(a)'),
(17, '2018-06-04 21:45:22', NULL, NULL, 7, 'Teste do Rato', 'Feminino', '2018-06-05', 'Cônjuge'),
(18, NULL, NULL, '2018-06-05 17:17:08', 14, 'Vitolinha', 'Masculino', '0000-00-00', 'Filho(a)'),
(19, '2018-06-05 17:16:57', NULL, NULL, 13, 'Hoje', 'Feminino', '2018-06-05', 'Filho(a)'),
(20, '2018-06-05 17:19:23', NULL, NULL, 10, 'Vitolinha', 'Masculino', '1973-07-03', 'Filho(a)'),
(21, '2018-06-05 17:29:49', NULL, '2018-06-05 17:43:19', 12, 'Victor Roberto', 'Masculino', '0000-00-00', 'Cônjuge'),
(22, '2018-06-05 17:42:18', NULL, NULL, 9, 'Victor Roberto', 'Masculino', '2018-01-20', 'Cônjuge'),
(23, '2018-06-05 17:43:05', NULL, NULL, 6, 'Moa Voa Voa', 'Masculino', '1983-04-03', 'Filho(a)'),
(24, '2018-06-05 17:44:32', NULL, NULL, 2, 'Vilma Flintstones', 'Feminino', '1973-07-19', 'Cônjuge'),
(25, NULL, NULL, NULL, 15, 'Gohan', 'Masculino', '0000-00-00', 'Filho(a)'),
(26, '2018-06-05 18:18:18', NULL, NULL, 7, 'Zezé', 'Feminino', '2018-06-26', 'Cônjuge'),
(27, NULL, NULL, NULL, 16, 'Sem Datinha', 'Masculino', '0000-00-00', 'Filho(a)'),
(28, NULL, NULL, NULL, 17, 'Pipoca', 'Feminino', '0000-00-00', 'Filho(a)'),
(29, NULL, NULL, NULL, 18, 'SAIPRO', 'Masculino', '0000-00-00', 'Filho(a)'),
(30, NULL, NULL, NULL, 26, 'Bernardo', 'Masculino', '0000-00-00', 'Filho(a)'),
(31, NULL, NULL, NULL, 29, 'Victor Roberto', 'Feminino', '0000-00-00', 'Filho(a)'),
(32, NULL, NULL, '2018-06-08 18:12:17', 38, 'BIC', 'Feminino', '1983-04-03', 'Filho(a)'),
(33, '2018-06-07 00:00:00', NULL, NULL, 39, 'Katy Perry', 'Feminino', '1991-04-03', 'Cônjuge'),
(34, '2018-06-07 18:33:18', NULL, NULL, 40, 'Pedro', 'Masculino', '1995-07-19', 'Filho(a)'),
(35, '2018-06-07 18:33:18', NULL, NULL, 40, 'Jaqueline', 'Feminino', '1973-07-19', 'Cônjuge');

-- --------------------------------------------------------

--
-- Estrutura para tabela `espacos`
--

CREATE TABLE IF NOT EXISTS `espacos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `descricao` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `capacidade` int(11) NOT NULL,
  `finalidade` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=12 ;

--
-- Fazendo dump de dados para tabela `espacos`
--

INSERT INTO `espacos` (`id`, `nome`, `descricao`, `capacidade`, `finalidade`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Recanto Familiar', 'Um espaço familiar, voltado para a descontração dos sócios e não sócios com seus amigos e parentes. Aonde pode ser feito um churrasco e também assar uma pizza, comportando 40 pessoas, onde são fornecidas cadeiras, mesas, grelha e pá de pizza.', 40, '', '2018-03-09 09:55:41', '2018-03-09 09:55:41', NULL),
(2, 'Salão Verde', 'O espaço é voltado a realização de festas de aniversário, casamentos, bodas, confraternizações, chás beneficientes, coquetéis e convenções. Coberto, o ambiente possui ar condicionado e é equipado com freezer, cozinha com fogão, geladeira, mesas pranchões (3m x 60 cm)ou mesas redondas (1,50 diâmetro) e cadeiras de plástico. Para 250 pessoas.', 250, '', '2018-03-09 09:55:42', '2018-03-09 09:55:42', NULL),
(3, 'Salão Amarelo', 'Outro espaço destinado a eventos sociais é o Salão Amarelo. Com ar condicionado, cozinha com fogão e freezer, o espaço tem capacidade para 150 pessoas e é ideal para a celebração de aniversário, casamentos, bodas, confraternizações, chás beneficentes, coquetéis e convenções. Juntamente com o aluguel do salão, estão inclusas mesas pranchões (3m x 60 cm)ou mesas redondas (1,50 diâmetro) e cadeiras de plástico.', 150, '', '2018-03-09 09:55:42', '2018-03-09 09:55:42', NULL),
(4, 'Churrasqueira VIP', 'Trata-se de um espaço social, onde podem ser realizados aniversários confraternizações, entre outros, inclusive sendo anexa ao Salão Verde (que possui capacidade para 250 pessoas). Sua estrutura conta com ar condicionado, ventilador e freezer, com cadeiras de plástico e mesas pranchões (3m x 60 cm)ou mesas redondas ( 1,50 diâmetro)todos estes utensílios em um espaço totalmente coberto, com capacidade para 60 pessoas. \n                 Por ser anexa ao Salão Verde, a churrasqueira vip pode ser alugada juntamente com o salão, desta maneira, se alugados juntos, passa para uma capacidade total de 310 pessoas ( 60 pessoas na churrasqueira e 250 pessoas no salão).', 310, '', '2018-03-09 09:55:42', '2018-03-09 09:55:42', NULL),
(5, 'Churrasqueira Social', '', 0, '', '2018-03-09 09:55:42', '2018-03-09 09:55:42', NULL),
(6, 'Churrasqueira Familiar', '', 50, 'Eventos', '2018-03-09 09:55:42', '2018-03-29 14:52:49', NULL),
(7, 'Campo de Futebol Society', '', 0, '', '2018-03-09 09:55:42', '2018-03-09 09:55:42', NULL),
(8, 'Quadra Poliesportiva', '', 22, 'Atividades & Eventos', '2018-03-09 09:55:42', '2018-04-08 13:18:18', NULL),
(9, 'Campo de Futebol (Gramado)', 'Gramado para futebol com 11 de linha.', 45, 'Atividades & Eventos', '2018-03-09 09:55:42', '2018-03-28 07:33:10', NULL),
(10, 'Piscina Adulto', '', 0, '', '2018-03-09 09:55:42', '2018-03-09 09:55:42', NULL),
(11, 'Piscina Infantil', '', 0, 'Atividades', '2018-03-09 09:55:42', '2018-03-28 07:58:18', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `eventos`
--

CREATE TABLE IF NOT EXISTS `eventos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `total` double NOT NULL,
  `titulo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `all_day` tinyint(1) NOT NULL,
  `socio_id` int(11) DEFAULT NULL,
  `espaco_id` int(11) NOT NULL,
  `atividade_id` int(11) DEFAULT NULL,
  `professor_id` int(11) DEFAULT NULL,
  `espaco_valor` double NOT NULL,
  `espaco_desconto` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=514 ;

--
-- Fazendo dump de dados para tabela `eventos`
--

INSERT INTO `eventos` (`id`, `created_at`, `updated_at`, `deleted_at`, `total`, `titulo`, `start_date`, `end_date`, `all_day`, `socio_id`, `espaco_id`, `atividade_id`, `professor_id`, `espaco_valor`, `espaco_desconto`) VALUES
(1, '2018-02-24 11:46:07', NULL, '2018-04-12 12:55:58', 10000, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, NULL, 0, NULL, NULL, 0, 0),
(2, '2018-02-24 11:52:38', NULL, '2018-04-12 12:55:58', 1000, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, NULL, 0, NULL, NULL, 0, 0),
(3, '2018-02-26 21:50:55', NULL, '2018-04-12 12:55:40', 65000, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, NULL, 0, NULL, NULL, 0, 0),
(4, '2018-03-06 06:41:57', NULL, '2018-04-12 12:55:40', 67500, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, NULL, 0, NULL, NULL, 0, 0),
(5, '2018-03-06 07:51:43', '2018-03-08 01:11:36', '2018-04-12 12:55:40', 95000, 'Baba do Marceleza', '2018-03-10 15:30:00', '2018-03-10 18:00:00', 0, NULL, 0, NULL, NULL, 0, 0),
(6, '2018-03-07 21:30:33', '2018-03-26 11:23:12', '2018-04-12 12:55:40', 250000, 'Reuniao SGC', '2018-03-20 18:00:00', '2018-03-20 18:55:00', 0, 1, 0, NULL, NULL, 0, 0),
(7, '2018-03-14 23:39:41', '2018-04-08 13:01:58', '2018-04-12 12:55:40', 124998, 'Evento Continuo X', '2018-03-14 14:00:00', '2018-03-16 18:00:00', 0, 1, 9, NULL, NULL, 8000, 0),
(8, '2018-03-14 23:59:33', '2018-03-26 11:21:51', '2018-04-12 12:55:40', 500000, 'Aniversário de 15 anos', '2018-03-13 19:00:00', '2018-03-18 00:00:00', 0, 2, 0, NULL, NULL, 0, 0),
(9, '2018-03-29 15:58:12', NULL, '2018-04-12 12:55:40', 9, 'Almoço Mexicano con la familia', '2018-03-31 11:00:00', '2018-03-31 16:00:00', 0, 1, 6, NULL, NULL, 10000, 1000),
(10, '2018-04-10 05:03:04', NULL, '2018-04-12 12:55:40', 12, 'Yabbadabbadoo', '2018-03-31 12:00:00', '2018-03-31 13:00:00', 0, 2, 6, NULL, NULL, 12345, 0),
(11, '2018-04-10 05:26:04', NULL, '2018-04-12 12:55:40', 12, 'Yabbadabbadoo 2', '2018-03-31 12:00:00', '2018-03-31 13:00:00', 0, 2, 6, NULL, NULL, 12345, 0),
(12, '2018-04-10 08:49:50', NULL, '2018-04-12 12:55:40', 1000, 'Yabbadabbadoo 4', '2018-03-31 13:00:00', '2018-03-31 14:00:00', 0, 2, 6, NULL, NULL, 1000000, 0),
(13, '2018-04-10 11:38:41', NULL, '2018-04-12 12:55:40', 1234, 'Yabbadabbadoo 5', '2018-03-31 13:00:00', '2018-03-31 15:00:00', 0, 2, 6, NULL, NULL, 1234567, 0),
(14, '2018-04-12 00:51:20', NULL, '2018-04-12 12:55:40', 987654, 'Desfile de lingerie', '2018-03-31 14:00:00', '2018-03-31 17:00:00', 0, 2, 6, NULL, NULL, 987654321, 0),
(15, '2018-04-12 01:21:29', NULL, '2018-04-12 12:55:40', 987654, 'Baby Swimming', '2018-03-31 12:00:00', '2018-03-31 15:00:00', 0, 1, 6, NULL, NULL, 987654321, 0),
(16, '2018-04-12 01:22:07', NULL, '2018-04-12 12:55:40', 987654, 'Scarface', '2018-03-31 12:00:00', '2018-03-31 15:00:00', 0, 1, 6, NULL, NULL, 987654321, 0),
(17, '2018-04-12 02:56:10', NULL, '2018-04-12 12:55:40', 987654, 'Teste Evento', '2018-03-31 12:00:00', '2018-03-31 15:00:00', 0, 1, 6, NULL, NULL, 987654321, 0),
(18, '2018-04-12 03:01:03', NULL, '2018-04-12 12:55:40', 987654, 'Champs', '2018-03-31 12:00:00', '2018-03-31 15:00:00', 0, 1, 6, NULL, NULL, 987654321, 0),
(19, '2018-04-12 03:11:19', NULL, '2018-04-12 12:55:40', 987654, 'Champs', '2018-03-31 12:00:00', '2018-03-31 15:00:00', 0, 1, 6, NULL, NULL, 987654321, 0),
(20, '2018-04-12 03:12:53', NULL, '2018-04-12 12:55:40', 987654, 'Champs Lig', '2018-03-31 14:00:00', '2018-03-31 17:00:00', 0, 2, 6, NULL, NULL, 987654321, 0),
(21, '2018-04-12 03:49:47', NULL, '2018-04-12 12:55:40', 987654, 'Champs Lig', '2018-03-31 14:00:00', '2018-03-31 17:00:00', 0, 2, 6, NULL, NULL, 987654321, 0),
(22, '2018-04-12 12:55:06', '2018-05-22 14:06:12', '2018-05-22 14:07:32', 4583723767, 'Baba da Aldeia', '2018-05-30 15:30:00', '2018-05-30 18:00:00', 0, 1, 9, NULL, NULL, 1223456767, 0),
(23, '2018-04-12 13:20:58', NULL, NULL, 1223, 'Aniversário', '2018-04-14 13:00:00', '2018-04-14 18:00:00', 0, 2, 9, NULL, NULL, 1223456, 0),
(24, '2018-04-16 06:49:38', NULL, NULL, 10, 'Almoço Mexicano con la familia 2', '2018-04-16 00:00:00', '2018-04-17 18:00:00', 0, 1, 6, NULL, NULL, 10000, 0),
(25, '2018-04-26 04:27:08', '2018-05-19 07:27:57', NULL, 125057, 'Baba Yabbadabbadoo', '2018-05-19 19:00:00', '2018-05-19 21:00:00', 0, 2, 9, NULL, NULL, 1250570, 0),
(278, '2018-05-11 19:56:47', '2018-05-11 19:56:47', NULL, 0, 'Futebol Sênior', '2018-05-16 20:00:00', '2018-05-16 21:00:00', 0, NULL, 9, 1, NULL, 0, 0),
(279, '2018-05-11 19:56:47', '2018-05-11 19:56:47', NULL, 0, 'Futebol Sênior', '2018-05-21 20:00:00', '2018-05-21 21:00:00', 0, NULL, 9, 1, NULL, 0, 0),
(280, '2018-05-11 19:56:47', '2018-05-11 19:56:47', NULL, 0, 'Futebol Sênior', '2018-05-23 20:00:00', '2018-05-23 21:00:00', 0, NULL, 9, 1, NULL, 0, 0),
(281, '2018-05-11 19:56:47', '2018-05-11 19:56:47', NULL, 0, 'Futebol Sênior', '2018-05-28 20:00:00', '2018-05-28 21:00:00', 0, NULL, 9, 1, NULL, 0, 0),
(282, '2018-05-11 19:56:47', '2018-05-11 19:56:47', NULL, 0, 'Futebol Sênior', '2018-05-30 20:00:00', '2018-05-30 21:00:00', 0, NULL, 9, 1, NULL, 0, 0),
(266, '2018-05-11 19:56:47', '2018-05-11 19:56:47', NULL, 0, 'Futebol Sênior', '2018-04-02 20:00:00', '2018-04-02 21:00:00', 0, NULL, 9, 1, NULL, 0, 0),
(267, '2018-05-11 19:56:47', '2018-05-11 19:56:47', NULL, 0, 'Futebol Sênior', '2018-04-04 20:00:00', '2018-04-04 21:00:00', 0, NULL, 9, 1, NULL, 0, 0),
(268, '2018-05-11 19:56:47', '2018-05-11 19:56:47', NULL, 0, 'Futebol Sênior', '2018-04-09 20:00:00', '2018-04-09 21:00:00', 0, NULL, 9, 1, NULL, 0, 0),
(269, '2018-05-11 19:56:47', '2018-05-11 19:56:47', NULL, 0, 'Futebol Sênior', '2018-04-11 20:00:00', '2018-04-11 21:00:00', 0, NULL, 9, 1, NULL, 0, 0),
(270, '2018-05-11 19:56:47', '2018-05-11 19:56:47', NULL, 0, 'Futebol Sênior', '2018-04-16 20:00:00', '2018-04-16 21:00:00', 0, NULL, 9, 1, NULL, 0, 0),
(271, '2018-05-11 19:56:47', '2018-05-11 19:56:47', NULL, 0, 'Futebol Sênior', '2018-04-18 20:00:00', '2018-04-18 21:00:00', 0, NULL, 9, 1, NULL, 0, 0),
(272, '2018-05-11 19:56:47', '2018-05-11 19:56:47', NULL, 0, 'Futebol Sênior', '2018-04-23 20:00:00', '2018-04-23 21:00:00', 0, NULL, 9, 1, NULL, 0, 0),
(273, '2018-05-11 19:56:47', '2018-05-11 19:56:47', NULL, 0, 'Futebol Sênior', '2018-04-25 20:00:00', '2018-04-25 21:00:00', 0, NULL, 9, 1, NULL, 0, 0),
(274, '2018-05-11 19:56:47', '2018-05-11 19:56:47', NULL, 0, 'Futebol Sênior', '2018-04-30 20:00:00', '2018-04-30 21:00:00', 0, NULL, 9, 1, NULL, 0, 0),
(292, '2018-05-11 19:56:47', '2018-05-11 19:56:47', '2018-06-04 20:22:19', 0, 'Futebol Sênior', '2018-07-04 20:00:00', '2018-07-04 21:00:00', 0, NULL, 9, 1, NULL, 0, 0),
(287, '2018-05-11 19:56:47', '2018-05-11 19:56:47', '2018-06-04 20:22:19', 0, 'Futebol Sênior', '2018-06-18 20:00:00', '2018-06-18 21:00:00', 0, NULL, 9, 1, NULL, 0, 0),
(288, '2018-05-11 19:56:47', '2018-05-11 19:56:47', '2018-06-04 20:22:19', 0, 'Futebol Sênior', '2018-06-20 20:00:00', '2018-06-20 21:00:00', 0, NULL, 9, 1, NULL, 0, 0),
(289, '2018-05-11 19:56:47', '2018-05-11 19:56:47', '2018-06-04 20:22:19', 0, 'Futebol Sênior', '2018-06-25 20:00:00', '2018-06-25 21:00:00', 0, NULL, 9, 1, NULL, 0, 0),
(290, '2018-05-11 19:56:47', '2018-05-11 19:56:47', '2018-06-04 20:22:19', 0, 'Futebol Sênior', '2018-06-27 20:00:00', '2018-06-27 21:00:00', 0, NULL, 9, 1, NULL, 0, 0),
(291, '2018-05-11 19:56:47', '2018-05-11 19:56:47', '2018-06-04 20:22:19', 0, 'Futebol Sênior', '2018-07-02 20:00:00', '2018-07-02 21:00:00', 0, NULL, 9, 1, NULL, 0, 0),
(293, '2018-05-11 19:56:47', '2018-05-11 19:56:47', '2018-06-04 20:22:19', 0, 'Futebol Sênior', '2018-07-09 20:00:00', '2018-07-09 21:00:00', 0, NULL, 9, 1, NULL, 0, 0),
(283, '2018-05-11 19:56:47', '2018-05-11 19:56:47', NULL, 0, 'Futebol Sênior', '2018-06-04 20:00:00', '2018-06-04 21:00:00', 0, NULL, 9, 1, NULL, 0, 0),
(284, '2018-05-11 19:56:47', '2018-05-11 19:56:47', '2018-06-04 20:22:19', 0, 'Futebol Sênior', '2018-06-06 20:00:00', '2018-06-06 21:00:00', 0, NULL, 9, 1, NULL, 0, 0),
(275, '2018-05-11 19:56:47', '2018-05-11 19:56:47', NULL, 0, 'Futebol Sênior', '2018-05-02 20:00:00', '2018-05-02 21:00:00', 0, NULL, 9, 1, NULL, 0, 0),
(276, '2018-05-11 19:56:47', '2018-05-11 19:56:47', NULL, 0, 'Futebol Sênior', '2018-05-09 20:00:00', '2018-05-09 21:00:00', 0, NULL, 9, 1, NULL, 0, 0),
(277, '2018-05-11 19:56:47', '2018-05-11 19:56:47', NULL, 0, 'Futebol Sênior', '2018-05-14 20:00:00', '2018-05-14 21:00:00', 0, NULL, 9, 1, NULL, 0, 0),
(286, '2018-05-11 19:56:47', '2018-05-11 19:56:47', '2018-06-04 20:22:19', 0, 'Futebol Sênior', '2018-06-13 20:00:00', '2018-06-13 21:00:00', 0, NULL, 9, 1, NULL, 0, 0),
(285, '2018-05-11 19:56:47', '2018-05-11 19:56:47', '2018-06-04 20:22:19', 0, 'Futebol Sênior', '2018-06-11 20:00:00', '2018-06-11 21:00:00', 0, NULL, 9, 1, NULL, 0, 0),
(313, '2018-05-11 19:56:47', '2018-05-11 19:56:47', '2018-06-04 20:22:19', 0, 'Futebol Sênior', '2018-09-17 20:00:00', '2018-09-17 21:00:00', 0, NULL, 9, 1, NULL, 0, 0),
(312, '2018-05-11 19:56:47', '2018-05-11 19:56:47', '2018-06-04 20:22:19', 0, 'Futebol Sênior', '2018-09-12 20:00:00', '2018-09-12 21:00:00', 0, NULL, 9, 1, NULL, 0, 0),
(311, '2018-05-11 19:56:47', '2018-05-11 19:56:47', '2018-06-04 20:22:19', 0, 'Futebol Sênior', '2018-09-10 20:00:00', '2018-09-10 21:00:00', 0, NULL, 9, 1, NULL, 0, 0),
(309, '2018-05-11 19:56:47', '2018-05-11 19:56:47', '2018-06-04 20:22:19', 0, 'Futebol Sênior', '2018-09-03 20:00:00', '2018-09-03 21:00:00', 0, NULL, 9, 1, NULL, 0, 0),
(310, '2018-05-11 19:56:47', '2018-05-11 19:56:47', '2018-06-04 20:22:19', 0, 'Futebol Sênior', '2018-09-05 20:00:00', '2018-09-05 21:00:00', 0, NULL, 9, 1, NULL, 0, 0),
(316, '2018-05-11 19:56:47', '2018-05-11 19:56:47', '2018-06-04 20:22:19', 0, 'Futebol Sênior', '2018-09-26 20:00:00', '2018-09-26 21:00:00', 0, NULL, 9, 1, NULL, 0, 0),
(315, '2018-05-11 19:56:47', '2018-05-11 19:56:47', '2018-06-04 20:22:19', 0, 'Futebol Sênior', '2018-09-24 20:00:00', '2018-09-24 21:00:00', 0, NULL, 9, 1, NULL, 0, 0),
(314, '2018-05-11 19:56:47', '2018-05-11 19:56:47', '2018-06-04 20:22:19', 0, 'Futebol Sênior', '2018-09-19 20:00:00', '2018-09-19 21:00:00', 0, NULL, 9, 1, NULL, 0, 0),
(304, '2018-05-11 19:56:47', '2018-05-11 19:56:47', '2018-06-04 20:22:19', 0, 'Futebol Sênior', '2018-08-15 20:00:00', '2018-08-15 21:00:00', 0, NULL, 9, 1, NULL, 0, 0),
(305, '2018-05-11 19:56:47', '2018-05-11 19:56:47', '2018-06-04 20:22:19', 0, 'Futebol Sênior', '2018-08-20 20:00:00', '2018-08-20 21:00:00', 0, NULL, 9, 1, NULL, 0, 0),
(306, '2018-05-11 19:56:47', '2018-05-11 19:56:47', '2018-06-04 20:22:19', 0, 'Futebol Sênior', '2018-08-22 20:00:00', '2018-08-22 21:00:00', 0, NULL, 9, 1, NULL, 0, 0),
(307, '2018-05-11 19:56:47', '2018-05-11 19:56:47', '2018-06-04 20:22:19', 0, 'Futebol Sênior', '2018-08-27 20:00:00', '2018-08-27 21:00:00', 0, NULL, 9, 1, NULL, 0, 0),
(308, '2018-05-11 19:56:47', '2018-05-11 19:56:47', '2018-06-04 20:22:19', 0, 'Futebol Sênior', '2018-08-29 20:00:00', '2018-08-29 21:00:00', 0, NULL, 9, 1, NULL, 0, 0),
(303, '2018-05-11 19:56:47', '2018-05-11 19:56:47', '2018-06-04 20:22:19', 0, 'Futebol Sênior', '2018-08-13 20:00:00', '2018-08-13 21:00:00', 0, NULL, 9, 1, NULL, 0, 0),
(302, '2018-05-11 19:56:47', '2018-05-11 19:56:47', '2018-06-04 20:22:19', 0, 'Futebol Sênior', '2018-08-08 20:00:00', '2018-08-08 21:00:00', 0, NULL, 9, 1, NULL, 0, 0),
(294, '2018-05-11 19:56:47', '2018-05-11 19:56:47', '2018-06-04 20:22:19', 0, 'Futebol Sênior', '2018-07-11 20:00:00', '2018-07-11 21:00:00', 0, NULL, 9, 1, NULL, 0, 0),
(295, '2018-05-11 19:56:47', '2018-05-11 19:56:47', '2018-06-04 20:22:19', 0, 'Futebol Sênior', '2018-07-16 20:00:00', '2018-07-16 21:00:00', 0, NULL, 9, 1, NULL, 0, 0),
(296, '2018-05-11 19:56:47', '2018-05-11 19:56:47', '2018-06-04 20:22:19', 0, 'Futebol Sênior', '2018-07-18 20:00:00', '2018-07-18 21:00:00', 0, NULL, 9, 1, NULL, 0, 0),
(297, '2018-05-11 19:56:47', '2018-05-11 19:56:47', '2018-06-04 20:22:19', 0, 'Futebol Sênior', '2018-07-23 20:00:00', '2018-07-23 21:00:00', 0, NULL, 9, 1, NULL, 0, 0),
(298, '2018-05-11 19:56:47', '2018-05-11 19:56:47', '2018-06-04 20:22:19', 0, 'Futebol Sênior', '2018-07-25 20:00:00', '2018-07-25 21:00:00', 0, NULL, 9, 1, NULL, 0, 0),
(299, '2018-05-11 19:56:47', '2018-05-11 19:56:47', '2018-06-04 20:22:19', 0, 'Futebol Sênior', '2018-07-30 20:00:00', '2018-07-30 21:00:00', 0, NULL, 9, 1, NULL, 0, 0),
(300, '2018-05-11 19:56:47', '2018-05-11 19:56:47', '2018-06-04 20:22:19', 0, 'Futebol Sênior', '2018-08-01 20:00:00', '2018-08-01 21:00:00', 0, NULL, 9, 1, NULL, 0, 0),
(301, '2018-05-11 19:56:47', '2018-05-11 19:56:47', '2018-06-04 20:22:19', 0, 'Futebol Sênior', '2018-08-06 20:00:00', '2018-08-06 21:00:00', 0, NULL, 9, 1, NULL, 0, 0),
(338, '2018-05-16 16:02:56', '2018-05-16 16:02:56', NULL, 0, 'Natação Baby', '2018-05-15 08:00:00', '2018-05-15 09:00:00', 0, NULL, 11, 3, NULL, 0, 0),
(337, '2018-05-16 02:07:42', '2018-05-16 02:07:42', '2018-05-16 02:08:56', 0, 'Aula de Dança para Casais', '2018-05-30 09:00:00', '2018-05-30 11:00:00', 0, NULL, 8, 2, NULL, 0, 0),
(334, '2018-05-16 02:07:42', '2018-05-16 02:07:42', '2018-05-16 02:08:56', 0, 'Aula de Dança para Casais', '2018-05-21 20:30:00', '2018-05-21 22:30:00', 0, NULL, 8, 2, NULL, 0, 0),
(335, '2018-05-16 02:07:42', '2018-05-16 02:07:42', '2018-05-16 02:08:56', 0, 'Aula de Dança para Casais', '2018-05-23 09:00:00', '2018-05-23 11:00:00', 0, NULL, 8, 2, NULL, 0, 0),
(336, '2018-05-16 02:07:42', '2018-05-16 02:07:42', '2018-05-16 02:08:56', 0, 'Aula de Dança para Casais', '2018-05-28 20:30:00', '2018-05-28 22:30:00', 0, NULL, 8, 2, NULL, 0, 0),
(343, '2018-05-16 16:02:56', '2018-05-16 16:02:56', '2018-05-16 17:35:21', 0, 'Natação Baby', '2018-05-31 08:00:00', '2018-05-31 09:00:00', 0, NULL, 11, 3, NULL, 0, 0),
(342, '2018-05-16 16:02:56', '2018-05-16 16:02:56', '2018-05-16 17:35:21', 0, 'Natação Baby', '2018-05-29 08:00:00', '2018-05-29 09:00:00', 0, NULL, 11, 3, NULL, 0, 0),
(341, '2018-05-16 16:02:56', '2018-05-16 16:02:56', '2018-05-16 17:35:21', 0, 'Natação Baby', '2018-05-24 08:00:00', '2018-05-24 09:00:00', 0, NULL, 11, 3, NULL, 0, 0),
(340, '2018-05-16 16:02:56', '2018-05-16 16:02:56', '2018-05-16 17:35:21', 0, 'Natação Baby', '2018-05-22 08:00:00', '2018-05-22 09:00:00', 0, NULL, 11, 3, NULL, 0, 0),
(339, '2018-05-16 16:02:56', '2018-05-16 16:02:56', '2018-05-16 17:35:21', 0, 'Natação Baby', '2018-05-17 08:00:00', '2018-05-17 09:00:00', 0, NULL, 11, 3, NULL, 0, 0),
(329, '2018-05-16 00:29:51', '2018-05-16 00:29:51', '2018-05-16 01:48:49', 0, 'Aula de Dança para Casais', '2018-05-21 20:30:00', '2018-05-21 22:30:00', 0, NULL, 8, 2, NULL, 0, 0),
(330, '2018-05-16 00:29:51', '2018-05-16 00:29:51', '2018-05-16 01:48:49', 0, 'Aula de Dança para Casais', '2018-05-23 09:00:00', '2018-05-23 11:00:00', 0, NULL, 8, 2, NULL, 0, 0),
(331, '2018-05-16 00:29:51', '2018-05-16 00:29:51', '2018-05-16 01:48:49', 0, 'Aula de Dança para Casais', '2018-05-28 20:30:00', '2018-05-28 22:30:00', 0, NULL, 8, 2, NULL, 0, 0),
(332, '2018-05-16 00:29:51', '2018-05-16 00:29:51', '2018-05-16 01:48:49', 0, 'Aula de Dança para Casais', '2018-05-30 09:00:00', '2018-05-30 11:00:00', 0, NULL, 8, 2, NULL, 0, 0),
(333, '2018-05-16 02:07:42', '2018-05-16 02:07:42', '2018-05-16 02:08:56', 0, 'Aula de Dança para Casais', '2018-05-16 09:00:00', '2018-05-16 11:00:00', 0, NULL, 8, 2, NULL, 0, 0),
(325, '2018-05-11 19:56:47', '2018-05-11 19:56:47', '2018-06-04 20:22:19', 0, 'Futebol Sênior', '2018-10-29 20:00:00', '2018-10-29 21:00:00', 0, NULL, 9, 1, NULL, 0, 0),
(326, '2018-05-15 22:16:12', '2018-05-16 01:18:28', '2018-05-16 01:18:28', 9170, 'Volley Scarface', '2018-05-20 08:00:00', '2018-05-20 10:00:00', 0, 1, 8, NULL, NULL, 100000, 20000),
(327, '2018-05-16 00:29:51', '2018-05-16 00:29:51', NULL, 0, 'Aula de Dança para Casais', '2018-05-14 20:30:00', '2018-05-14 22:30:00', 0, NULL, 8, 2, NULL, 0, 0),
(328, '2018-05-16 00:29:51', '2018-05-16 00:29:51', '2018-05-16 01:48:49', 0, 'Aula de Dança para Casais', '2018-05-16 09:00:00', '2018-05-16 11:00:00', 0, NULL, 8, 2, NULL, 0, 0),
(323, '2018-05-11 19:56:47', '2018-05-11 19:56:47', '2018-06-04 20:22:19', 0, 'Futebol Sênior', '2018-10-22 20:00:00', '2018-10-22 21:00:00', 0, NULL, 9, 1, NULL, 0, 0),
(324, '2018-05-11 19:56:47', '2018-05-11 19:56:47', '2018-06-04 20:22:19', 0, 'Futebol Sênior', '2018-10-24 20:00:00', '2018-10-24 21:00:00', 0, NULL, 9, 1, NULL, 0, 0),
(317, '2018-05-11 19:56:47', '2018-05-11 19:56:47', '2018-06-04 20:22:19', 0, 'Futebol Sênior', '2018-10-01 20:00:00', '2018-10-01 21:00:00', 0, NULL, 9, 1, NULL, 0, 0),
(318, '2018-05-11 19:56:47', '2018-05-11 19:56:47', '2018-06-04 20:22:19', 0, 'Futebol Sênior', '2018-10-03 20:00:00', '2018-10-03 21:00:00', 0, NULL, 9, 1, NULL, 0, 0),
(319, '2018-05-11 19:56:47', '2018-05-11 19:56:47', '2018-06-04 20:22:19', 0, 'Futebol Sênior', '2018-10-08 20:00:00', '2018-10-08 21:00:00', 0, NULL, 9, 1, NULL, 0, 0),
(320, '2018-05-11 19:56:47', '2018-05-11 19:56:47', '2018-06-04 20:22:19', 0, 'Futebol Sênior', '2018-10-10 20:00:00', '2018-10-10 21:00:00', 0, NULL, 9, 1, NULL, 0, 0),
(321, '2018-05-11 19:56:47', '2018-05-11 19:56:47', '2018-06-04 20:22:19', 0, 'Futebol Sênior', '2018-10-15 20:00:00', '2018-10-15 21:00:00', 0, NULL, 9, 1, NULL, 0, 0),
(322, '2018-05-11 19:56:47', '2018-05-11 19:56:47', '2018-06-04 20:22:19', 0, 'Futebol Sênior', '2018-10-17 20:00:00', '2018-10-17 21:00:00', 0, NULL, 9, 1, NULL, 0, 0),
(344, '2018-05-16 16:02:56', '2018-05-16 16:02:56', '2018-05-16 17:35:21', 0, 'Natação Baby', '2018-06-05 08:00:00', '2018-06-05 09:00:00', 0, NULL, 11, 3, NULL, 0, 0),
(345, '2018-05-16 16:02:56', '2018-05-16 16:02:56', '2018-05-16 17:35:21', 0, 'Natação Baby', '2018-06-07 08:00:00', '2018-06-07 09:00:00', 0, NULL, 11, 3, NULL, 0, 0),
(346, '2018-05-16 16:02:56', '2018-05-16 16:02:56', '2018-05-16 17:35:21', 0, 'Natação Baby', '2018-06-12 08:00:00', '2018-06-12 09:00:00', 0, NULL, 11, 3, NULL, 0, 0),
(347, '2018-05-16 16:02:56', '2018-05-16 16:02:56', '2018-05-16 17:35:21', 0, 'Natação Baby', '2018-06-14 08:00:00', '2018-06-14 09:00:00', 0, NULL, 11, 3, NULL, 0, 0),
(348, '2018-05-16 16:02:56', '2018-05-16 16:02:56', '2018-05-16 17:35:21', 0, 'Natação Baby', '2018-06-19 08:00:00', '2018-06-19 09:00:00', 0, NULL, 11, 3, NULL, 0, 0),
(349, '2018-05-16 16:02:56', '2018-05-16 16:02:56', '2018-05-16 17:35:21', 0, 'Natação Baby', '2018-06-21 08:00:00', '2018-06-21 09:00:00', 0, NULL, 11, 3, NULL, 0, 0),
(350, '2018-05-16 16:02:56', '2018-05-16 16:02:56', '2018-05-16 17:35:21', 0, 'Natação Baby', '2018-06-26 08:00:00', '2018-06-26 09:00:00', 0, NULL, 11, 3, NULL, 0, 0),
(351, '2018-05-16 16:02:56', '2018-05-16 16:02:56', '2018-05-16 17:35:21', 0, 'Natação Baby', '2018-06-28 08:00:00', '2018-06-28 09:00:00', 0, NULL, 11, 3, NULL, 0, 0),
(352, '2018-05-16 17:39:17', '2018-05-16 17:39:17', '2018-05-16 17:41:06', 0, 'Baby Swimming', '2018-05-18 07:00:00', '2018-05-18 09:00:30', 0, NULL, 11, 4, NULL, 0, 0),
(353, '2018-05-16 17:39:17', '2018-05-16 17:39:17', '2018-05-16 17:41:06', 0, 'Baby Swimming', '2018-05-25 07:00:00', '2018-05-25 09:00:30', 0, NULL, 11, 4, NULL, 0, 0),
(354, '2018-05-16 17:39:17', '2018-05-16 17:39:17', '2018-05-16 17:41:06', 0, 'Baby Swimming', '2018-06-01 07:00:00', '2018-06-01 09:00:30', 0, NULL, 11, 4, NULL, 0, 0),
(355, '2018-05-16 17:39:17', '2018-05-16 17:39:17', '2018-05-16 17:41:06', 0, 'Baby Swimming', '2018-06-08 07:00:00', '2018-06-08 09:00:30', 0, NULL, 11, 4, NULL, 0, 0),
(356, '2018-05-16 17:39:17', '2018-05-16 17:39:17', '2018-05-16 17:41:06', 0, 'Baby Swimming', '2018-06-15 07:00:00', '2018-06-15 09:00:30', 0, NULL, 11, 4, NULL, 0, 0),
(357, '2018-05-16 17:39:17', '2018-05-16 17:39:17', '2018-05-16 17:41:06', 0, 'Baby Swimming', '2018-06-22 07:00:00', '2018-06-22 09:00:30', 0, NULL, 11, 4, NULL, 0, 0),
(358, '2018-05-16 17:39:17', '2018-05-16 17:39:17', '2018-05-16 17:41:06', 0, 'Baby Swimming', '2018-06-29 07:00:00', '2018-06-29 09:00:30', 0, NULL, 11, 4, NULL, 0, 0),
(359, '2018-05-16 17:42:40', '2018-05-16 17:42:40', NULL, 0, 'Baby Swimming', '2018-05-18 07:00:00', '2018-05-18 09:00:30', 0, NULL, 11, 4, NULL, 0, 0),
(360, '2018-05-16 17:42:40', '2018-05-16 17:42:40', '2018-05-22 13:44:15', 0, 'Baby Swimming', '2018-05-25 07:00:00', '2018-05-25 09:00:30', 0, NULL, 11, 4, NULL, 0, 0),
(361, '2018-05-16 17:42:40', '2018-05-16 17:42:40', '2018-05-22 13:44:15', 0, 'Baby Swimming', '2018-06-01 07:00:00', '2018-06-01 09:00:30', 0, NULL, 11, 4, NULL, 0, 0),
(362, '2018-05-16 17:42:40', '2018-05-16 17:42:40', '2018-05-22 13:44:15', 0, 'Baby Swimming', '2018-06-08 07:00:00', '2018-06-08 09:00:30', 0, NULL, 11, 4, NULL, 0, 0),
(363, '2018-05-16 17:42:40', '2018-05-16 17:42:40', '2018-05-22 13:44:15', 0, 'Baby Swimming', '2018-06-15 07:00:00', '2018-06-15 09:00:30', 0, NULL, 11, 4, NULL, 0, 0),
(364, '2018-05-16 17:42:40', '2018-05-16 17:42:40', '2018-05-22 13:44:15', 0, 'Baby Swimming', '2018-06-22 07:00:00', '2018-06-22 09:00:30', 0, NULL, 11, 4, NULL, 0, 0),
(365, '2018-05-16 17:42:40', '2018-05-16 17:42:40', '2018-05-22 13:44:15', 0, 'Baby Swimming', '2018-06-29 07:00:00', '2018-06-29 09:00:30', 0, NULL, 11, 4, NULL, 0, 0),
(366, '2018-05-19 06:34:44', '2018-05-19 06:34:44', NULL, 0, 'Natação Baby', '2018-05-17 08:00:00', '2018-05-17 09:00:00', 0, NULL, 11, 3, NULL, 0, 0),
(367, '2018-05-19 06:34:44', '2018-05-19 06:34:44', NULL, 0, 'Natação Baby', '2018-05-22 08:00:00', '2018-05-22 09:00:00', 0, NULL, 11, 3, NULL, 0, 0),
(368, '2018-05-19 06:34:44', '2018-05-19 06:34:44', NULL, 0, 'Natação Baby', '2018-05-24 08:00:00', '2018-05-24 09:00:00', 0, NULL, 11, 3, NULL, 0, 0),
(369, '2018-05-19 06:34:44', '2018-05-19 06:34:44', NULL, 0, 'Natação Baby', '2018-05-29 08:00:00', '2018-05-29 09:00:00', 0, NULL, 11, 3, NULL, 0, 0),
(370, '2018-05-19 06:34:44', '2018-05-19 06:34:44', NULL, 0, 'Natação Baby', '2018-05-31 08:00:00', '2018-05-31 09:00:00', 0, NULL, 11, 3, NULL, 0, 0),
(371, '2018-05-19 06:34:44', '2018-05-19 06:34:44', '2018-06-04 20:22:51', 0, 'Natação Baby', '2018-06-05 08:00:00', '2018-06-05 09:00:00', 0, NULL, 11, 3, NULL, 0, 0),
(372, '2018-05-19 06:34:44', '2018-05-19 06:34:44', '2018-06-04 20:22:51', 0, 'Natação Baby', '2018-06-07 08:00:00', '2018-06-07 09:00:00', 0, NULL, 11, 3, NULL, 0, 0),
(373, '2018-05-19 06:34:44', '2018-05-19 06:34:44', '2018-06-04 20:22:51', 0, 'Natação Baby', '2018-06-12 08:00:00', '2018-06-12 09:00:00', 0, NULL, 11, 3, NULL, 0, 0),
(374, '2018-05-19 06:34:44', '2018-05-19 06:34:44', '2018-06-04 20:22:51', 0, 'Natação Baby', '2018-06-14 08:00:00', '2018-06-14 09:00:00', 0, NULL, 11, 3, NULL, 0, 0),
(375, '2018-05-19 06:34:44', '2018-05-19 06:34:44', '2018-06-04 20:22:51', 0, 'Natação Baby', '2018-06-19 08:00:00', '2018-06-19 09:00:00', 0, NULL, 11, 3, NULL, 0, 0),
(376, '2018-05-19 06:34:44', '2018-05-19 06:34:44', '2018-06-04 20:22:51', 0, 'Natação Baby', '2018-06-21 08:00:00', '2018-06-21 09:00:00', 0, NULL, 11, 3, NULL, 0, 0),
(377, '2018-05-19 06:34:44', '2018-05-19 06:34:44', '2018-06-04 20:22:51', 0, 'Natação Baby', '2018-06-26 08:00:00', '2018-06-26 09:00:00', 0, NULL, 11, 3, NULL, 0, 0),
(378, '2018-05-19 06:34:44', '2018-05-19 06:34:44', '2018-06-04 20:22:51', 0, 'Natação Baby', '2018-06-28 08:00:00', '2018-06-28 09:00:00', 0, NULL, 11, 3, NULL, 0, 0),
(379, '2018-05-22 13:52:13', NULL, NULL, 12245, 'Evento do Rato', '2018-05-25 10:00:00', '2018-05-25 12:00:00', 0, 2, 8, NULL, NULL, 1234500, 10000),
(380, '2018-05-28 13:23:30', NULL, NULL, 1234578, 'Baba Scarface La Revancha', '2018-05-30 15:00:00', '2018-05-30 17:00:00', 0, 1, 9, NULL, NULL, 1234578, 0),
(381, '2018-05-28 17:41:07', NULL, NULL, 0, 'Yabadabadoo', '2018-05-29 00:00:00', '2018-05-29 10:00:00', 0, 2, 8, NULL, NULL, 0, 0),
(382, '2018-05-28 17:51:31', '2018-05-29 12:56:55', NULL, 255.59, 'Yabadabadoo', '2018-06-13 00:00:00', '2018-06-29 00:00:00', 0, 1, 6, NULL, NULL, 255.59, 0),
(383, '2018-05-28 17:54:05', NULL, NULL, 199, 'Yabadabadoo', '2018-06-01 00:00:00', '2018-06-02 00:00:00', 0, 1, 6, NULL, NULL, 199, 0),
(384, '2018-05-28 21:53:36', NULL, NULL, 1224, 'Evento', '2018-05-29 12:00:00', '2018-05-29 18:00:00', 0, 2, 6, NULL, NULL, 1224, 0),
(385, '2018-05-28 21:59:50', NULL, NULL, 12.24, 'Evento', '2018-06-04 14:00:00', '2018-06-04 22:00:00', 0, 1, 6, NULL, NULL, 12.24, 0),
(386, '2018-05-29 20:41:44', NULL, NULL, 1.5000000000000002, 'Evento Intruso', '2018-06-04 06:00:00', '2018-06-04 09:00:00', 0, 2, 6, NULL, NULL, 2.99, 1.49),
(387, '2018-05-29 21:10:25', '2018-05-29 21:10:25', NULL, 0, 'Aula de Dança para Casais', '2018-05-16 09:00:00', '2018-05-16 11:00:00', 0, NULL, 8, 2, NULL, 0, 0),
(388, '2018-05-29 21:10:25', '2018-05-29 21:10:25', NULL, 0, 'Aula de Dança para Casais', '2018-05-21 20:30:00', '2018-05-21 22:30:00', 0, NULL, 8, 2, NULL, 0, 0),
(389, '2018-05-29 21:10:25', '2018-05-29 21:10:25', NULL, 0, 'Aula de Dança para Casais', '2018-05-23 09:00:00', '2018-05-23 11:00:00', 0, NULL, 8, 2, NULL, 0, 0),
(390, '2018-05-29 21:10:25', '2018-05-29 21:10:25', NULL, 0, 'Aula de Dança para Casais', '2018-05-28 20:30:00', '2018-05-28 22:30:00', 0, NULL, 8, 2, NULL, 0, 0),
(391, '2018-05-29 21:10:25', '2018-05-29 21:10:25', NULL, 0, 'Aula de Dança para Casais', '2018-05-30 09:00:00', '2018-05-30 11:00:00', 0, NULL, 8, 2, NULL, 0, 0),
(392, '2018-05-30 14:14:15', NULL, NULL, 110.99, 'Teste do Rato', '2018-05-30 15:00:00', '2018-05-30 18:00:00', 0, 2, 8, NULL, NULL, 110.99, 0),
(393, '2018-06-04 20:00:52', '2018-06-04 20:00:52', NULL, 0, 'Xmen''s Soccer', '2018-05-28 08:00:00', '2018-05-28 09:00:30', 0, NULL, 9, 5, NULL, 0, 0),
(394, '2018-06-04 20:00:52', '2018-06-04 20:00:52', NULL, 0, 'Xmen''s Soccer', '2018-05-29 16:00:00', '2018-05-29 17:00:30', 0, NULL, 9, 5, NULL, 0, 0),
(395, '2018-06-04 20:00:52', '2018-06-04 20:00:52', NULL, 0, 'Xmen''s Soccer', '2018-05-30 08:00:00', '2018-05-30 09:00:30', 0, NULL, 9, 5, NULL, 0, 0),
(396, '2018-06-04 20:00:52', '2018-06-04 20:00:52', NULL, 0, 'Xmen''s Soccer', '2018-05-31 16:00:00', '2018-05-31 17:00:30', 0, NULL, 9, 5, NULL, 0, 0),
(397, '2018-06-04 20:00:52', '2018-06-04 20:00:52', NULL, 0, 'Xmen''s Soccer', '2018-06-01 19:00:00', '2018-06-01 20:00:30', 0, NULL, 9, 5, NULL, 0, 0),
(398, '2018-06-04 20:00:52', '2018-06-04 20:00:52', NULL, 0, 'Xmen''s Soccer', '2018-06-04 08:00:00', '2018-06-04 09:00:30', 0, NULL, 9, 5, NULL, 0, 0),
(399, '2018-06-04 20:00:52', '2018-06-04 20:00:52', '2018-06-04 20:06:29', 0, 'Xmen''s Soccer', '2018-06-05 16:00:00', '2018-06-05 17:00:30', 0, NULL, 9, 5, NULL, 0, 0),
(400, '2018-06-04 20:00:52', '2018-06-04 20:00:52', '2018-06-04 20:06:29', 0, 'Xmen''s Soccer', '2018-06-06 08:00:00', '2018-06-06 09:00:30', 0, NULL, 9, 5, NULL, 0, 0),
(401, '2018-06-04 20:00:52', '2018-06-04 20:00:52', '2018-06-04 20:06:29', 0, 'Xmen''s Soccer', '2018-06-07 16:00:00', '2018-06-07 17:00:30', 0, NULL, 9, 5, NULL, 0, 0),
(402, '2018-06-04 20:00:52', '2018-06-04 20:00:52', '2018-06-04 20:06:29', 0, 'Xmen''s Soccer', '2018-06-08 19:00:00', '2018-06-08 20:00:30', 0, NULL, 9, 5, NULL, 0, 0),
(403, '2018-06-04 20:00:52', '2018-06-04 20:00:52', '2018-06-04 20:06:29', 0, 'Xmen''s Soccer', '2018-06-11 08:00:00', '2018-06-11 09:00:30', 0, NULL, 9, 5, NULL, 0, 0),
(404, '2018-06-04 20:00:52', '2018-06-04 20:00:52', '2018-06-04 20:06:29', 0, 'Xmen''s Soccer', '2018-06-12 16:00:00', '2018-06-12 17:00:30', 0, NULL, 9, 5, NULL, 0, 0),
(405, '2018-06-04 20:00:52', '2018-06-04 20:00:52', '2018-06-04 20:06:29', 0, 'Xmen''s Soccer', '2018-06-13 08:00:00', '2018-06-13 09:00:30', 0, NULL, 9, 5, NULL, 0, 0),
(406, '2018-06-04 20:00:52', '2018-06-04 20:00:52', '2018-06-04 20:06:29', 0, 'Xmen''s Soccer', '2018-06-14 16:00:00', '2018-06-14 17:00:30', 0, NULL, 9, 5, NULL, 0, 0),
(407, '2018-06-04 20:00:52', '2018-06-04 20:00:52', '2018-06-04 20:06:29', 0, 'Xmen''s Soccer', '2018-06-15 19:00:00', '2018-06-15 20:00:30', 0, NULL, 9, 5, NULL, 0, 0),
(408, '2018-06-04 20:00:52', '2018-06-04 20:00:52', '2018-06-04 20:06:29', 0, 'Xmen''s Soccer', '2018-06-18 08:00:00', '2018-06-18 09:00:30', 0, NULL, 9, 5, NULL, 0, 0),
(409, '2018-06-04 20:00:52', '2018-06-04 20:00:52', '2018-06-04 20:06:29', 0, 'Xmen''s Soccer', '2018-06-19 16:00:00', '2018-06-19 17:00:30', 0, NULL, 9, 5, NULL, 0, 0),
(410, '2018-06-04 20:00:52', '2018-06-04 20:00:52', '2018-06-04 20:06:29', 0, 'Xmen''s Soccer', '2018-06-20 08:00:00', '2018-06-20 09:00:30', 0, NULL, 9, 5, NULL, 0, 0),
(411, '2018-06-04 20:00:52', '2018-06-04 20:00:52', '2018-06-04 20:06:29', 0, 'Xmen''s Soccer', '2018-06-21 16:00:00', '2018-06-21 17:00:30', 0, NULL, 9, 5, NULL, 0, 0),
(412, '2018-06-04 20:00:52', '2018-06-04 20:00:52', '2018-06-04 20:06:29', 0, 'Xmen''s Soccer', '2018-06-22 19:00:00', '2018-06-22 20:00:30', 0, NULL, 9, 5, NULL, 0, 0),
(413, '2018-06-04 20:00:52', '2018-06-04 20:00:52', '2018-06-04 20:06:29', 0, 'Xmen''s Soccer', '2018-06-25 08:00:00', '2018-06-25 09:00:30', 0, NULL, 9, 5, NULL, 0, 0),
(414, '2018-06-04 20:00:53', '2018-06-04 20:00:53', '2018-06-04 20:06:29', 0, 'Xmen''s Soccer', '2018-06-26 16:00:00', '2018-06-26 17:00:30', 0, NULL, 9, 5, NULL, 0, 0),
(415, '2018-06-04 20:00:53', '2018-06-04 20:00:53', '2018-06-04 20:06:29', 0, 'Xmen''s Soccer', '2018-06-27 08:00:00', '2018-06-27 09:00:30', 0, NULL, 9, 5, NULL, 0, 0),
(416, '2018-06-04 20:00:53', '2018-06-04 20:00:53', '2018-06-04 20:06:29', 0, 'Xmen''s Soccer', '2018-06-28 16:00:00', '2018-06-28 17:00:30', 0, NULL, 9, 5, NULL, 0, 0),
(417, '2018-06-04 20:00:53', '2018-06-04 20:00:53', '2018-06-04 20:06:29', 0, 'Xmen''s Soccer', '2018-06-29 19:00:00', '2018-06-29 20:00:30', 0, NULL, 9, 5, NULL, 0, 0),
(418, '2018-06-04 20:07:22', '2018-06-04 20:07:22', NULL, 0, 'Xmen''s Soccer', '2018-06-05 16:00:00', '2018-06-05 17:00:30', 0, NULL, 9, 5, 3, 0, 0),
(419, '2018-06-04 20:07:22', '2018-06-04 20:07:22', NULL, 0, 'Xmen''s Soccer', '2018-06-06 08:00:00', '2018-06-06 09:00:30', 0, NULL, 9, 5, 3, 0, 0),
(420, '2018-06-04 20:07:22', '2018-06-04 20:07:22', NULL, 0, 'Xmen''s Soccer', '2018-06-07 16:00:00', '2018-06-07 17:00:30', 0, NULL, 9, 5, 3, 0, 0),
(421, '2018-06-04 20:07:22', '2018-06-04 20:07:22', NULL, 0, 'Xmen''s Soccer', '2018-06-08 19:00:00', '2018-06-08 20:00:30', 0, NULL, 9, 5, 3, 0, 0),
(422, '2018-06-04 20:07:22', '2018-06-04 20:07:22', NULL, 0, 'Xmen''s Soccer', '2018-06-11 08:00:00', '2018-06-11 09:00:30', 0, NULL, 9, 5, 3, 0, 0),
(423, '2018-06-04 20:07:22', '2018-06-04 20:07:22', NULL, 0, 'Xmen''s Soccer', '2018-06-12 16:00:00', '2018-06-12 17:00:30', 0, NULL, 9, 5, 3, 0, 0),
(424, '2018-06-04 20:07:22', '2018-06-04 20:07:22', NULL, 0, 'Xmen''s Soccer', '2018-06-13 08:00:00', '2018-06-13 09:00:30', 0, NULL, 9, 5, 3, 0, 0),
(425, '2018-06-04 20:07:22', '2018-06-04 20:07:22', NULL, 0, 'Xmen''s Soccer', '2018-06-14 16:00:00', '2018-06-14 17:00:30', 0, NULL, 9, 5, 3, 0, 0),
(426, '2018-06-04 20:07:23', '2018-06-04 20:07:23', NULL, 0, 'Xmen''s Soccer', '2018-06-15 19:00:00', '2018-06-15 20:00:30', 0, NULL, 9, 5, 3, 0, 0),
(427, '2018-06-04 20:07:23', '2018-06-04 20:07:23', NULL, 0, 'Xmen''s Soccer', '2018-06-18 08:00:00', '2018-06-18 09:00:30', 0, NULL, 9, 5, 3, 0, 0),
(428, '2018-06-04 20:07:23', '2018-06-04 20:07:23', NULL, 0, 'Xmen''s Soccer', '2018-06-19 16:00:00', '2018-06-19 17:00:30', 0, NULL, 9, 5, 3, 0, 0),
(429, '2018-06-04 20:07:23', '2018-06-04 20:07:23', NULL, 0, 'Xmen''s Soccer', '2018-06-20 08:00:00', '2018-06-20 09:00:30', 0, NULL, 9, 5, 3, 0, 0),
(430, '2018-06-04 20:07:23', '2018-06-04 20:07:23', NULL, 0, 'Xmen''s Soccer', '2018-06-21 16:00:00', '2018-06-21 17:00:30', 0, NULL, 9, 5, 3, 0, 0),
(431, '2018-06-04 20:07:23', '2018-06-04 20:07:23', NULL, 0, 'Xmen''s Soccer', '2018-06-22 19:00:00', '2018-06-22 20:00:30', 0, NULL, 9, 5, 3, 0, 0),
(432, '2018-06-04 20:07:23', '2018-06-04 20:07:23', NULL, 0, 'Xmen''s Soccer', '2018-06-25 08:00:00', '2018-06-25 09:00:30', 0, NULL, 9, 5, 3, 0, 0),
(433, '2018-06-04 20:07:23', '2018-06-04 20:07:23', NULL, 0, 'Xmen''s Soccer', '2018-06-26 16:00:00', '2018-06-26 17:00:30', 0, NULL, 9, 5, 3, 0, 0),
(434, '2018-06-04 20:07:23', '2018-06-04 20:07:23', NULL, 0, 'Xmen''s Soccer', '2018-06-27 08:00:00', '2018-06-27 09:00:30', 0, NULL, 9, 5, 3, 0, 0),
(435, '2018-06-04 20:07:23', '2018-06-04 20:07:23', NULL, 0, 'Xmen''s Soccer', '2018-06-28 16:00:00', '2018-06-28 17:00:30', 0, NULL, 9, 5, 3, 0, 0),
(436, '2018-06-04 20:07:23', '2018-06-04 20:07:23', NULL, 0, 'Xmen''s Soccer', '2018-06-29 19:00:00', '2018-06-29 20:00:30', 0, NULL, 9, 5, 3, 0, 0),
(437, '2018-06-04 20:25:28', '2018-06-04 20:25:28', NULL, 0, 'Natação Baby', '2018-06-05 08:00:00', '2018-06-05 09:00:00', 0, NULL, 11, 3, 3, 0, 0),
(438, '2018-06-04 20:25:28', '2018-06-04 20:25:28', NULL, 0, 'Natação Baby', '2018-06-07 08:00:00', '2018-06-07 09:00:00', 0, NULL, 11, 3, 3, 0, 0),
(439, '2018-06-04 20:25:28', '2018-06-04 20:25:28', NULL, 0, 'Natação Baby', '2018-06-12 08:00:00', '2018-06-12 09:00:00', 0, NULL, 11, 3, 3, 0, 0),
(440, '2018-06-04 20:25:28', '2018-06-04 20:25:28', NULL, 0, 'Natação Baby', '2018-06-14 08:00:00', '2018-06-14 09:00:00', 0, NULL, 11, 3, 3, 0, 0),
(441, '2018-06-04 20:25:28', '2018-06-04 20:25:28', NULL, 0, 'Natação Baby', '2018-06-19 08:00:00', '2018-06-19 09:00:00', 0, NULL, 11, 3, 3, 0, 0),
(442, '2018-06-04 20:25:28', '2018-06-04 20:25:28', NULL, 0, 'Natação Baby', '2018-06-21 08:00:00', '2018-06-21 09:00:00', 0, NULL, 11, 3, 3, 0, 0),
(443, '2018-06-04 20:25:28', '2018-06-04 20:25:28', NULL, 0, 'Natação Baby', '2018-06-26 08:00:00', '2018-06-26 09:00:00', 0, NULL, 11, 3, 3, 0, 0),
(444, '2018-06-04 20:25:28', '2018-06-04 20:25:28', NULL, 0, 'Natação Baby', '2018-06-28 08:00:00', '2018-06-28 09:00:00', 0, NULL, 11, 3, 3, 0, 0),
(445, '2018-06-04 20:25:49', '2018-06-04 20:25:49', NULL, 0, 'Futebol Sênior', '2018-05-07 20:00:00', '2018-05-07 21:00:00', 0, NULL, 9, 1, 2, 0, 0),
(446, '2018-06-04 20:25:49', '2018-06-04 20:25:49', NULL, 0, 'Futebol Sênior', '2018-06-06 20:00:00', '2018-06-06 21:00:00', 0, NULL, 9, 1, 2, 0, 0),
(447, '2018-06-04 20:25:49', '2018-06-04 20:25:49', NULL, 0, 'Futebol Sênior', '2018-06-11 20:00:00', '2018-06-11 21:00:00', 0, NULL, 9, 1, 2, 0, 0),
(448, '2018-06-04 20:25:49', '2018-06-04 20:25:49', NULL, 0, 'Futebol Sênior', '2018-06-13 20:00:00', '2018-06-13 21:00:00', 0, NULL, 9, 1, 2, 0, 0),
(449, '2018-06-04 20:25:49', '2018-06-04 20:25:49', NULL, 0, 'Futebol Sênior', '2018-06-18 20:00:00', '2018-06-18 21:00:00', 0, NULL, 9, 1, 2, 0, 0),
(450, '2018-06-04 20:25:49', '2018-06-04 20:25:49', NULL, 0, 'Futebol Sênior', '2018-06-20 20:00:00', '2018-06-20 21:00:00', 0, NULL, 9, 1, 2, 0, 0),
(451, '2018-06-04 20:25:49', '2018-06-04 20:25:49', NULL, 0, 'Futebol Sênior', '2018-06-25 20:00:00', '2018-06-25 21:00:00', 0, NULL, 9, 1, 2, 0, 0),
(452, '2018-06-04 20:25:49', '2018-06-04 20:25:49', NULL, 0, 'Futebol Sênior', '2018-06-27 20:00:00', '2018-06-27 21:00:00', 0, NULL, 9, 1, 2, 0, 0),
(453, '2018-06-04 20:25:49', '2018-06-04 20:25:49', NULL, 0, 'Futebol Sênior', '2018-07-02 20:00:00', '2018-07-02 21:00:00', 0, NULL, 9, 1, 2, 0, 0),
(454, '2018-06-04 20:25:49', '2018-06-04 20:25:49', NULL, 0, 'Futebol Sênior', '2018-07-04 20:00:00', '2018-07-04 21:00:00', 0, NULL, 9, 1, 2, 0, 0),
(455, '2018-06-04 20:25:49', '2018-06-04 20:25:49', NULL, 0, 'Futebol Sênior', '2018-07-09 20:00:00', '2018-07-09 21:00:00', 0, NULL, 9, 1, 2, 0, 0),
(456, '2018-06-04 20:25:49', '2018-06-04 20:25:49', NULL, 0, 'Futebol Sênior', '2018-07-11 20:00:00', '2018-07-11 21:00:00', 0, NULL, 9, 1, 2, 0, 0),
(457, '2018-06-04 20:25:49', '2018-06-04 20:25:49', NULL, 0, 'Futebol Sênior', '2018-07-16 20:00:00', '2018-07-16 21:00:00', 0, NULL, 9, 1, 2, 0, 0),
(458, '2018-06-04 20:25:49', '2018-06-04 20:25:49', NULL, 0, 'Futebol Sênior', '2018-07-18 20:00:00', '2018-07-18 21:00:00', 0, NULL, 9, 1, 2, 0, 0),
(459, '2018-06-04 20:25:49', '2018-06-04 20:25:49', NULL, 0, 'Futebol Sênior', '2018-07-23 20:00:00', '2018-07-23 21:00:00', 0, NULL, 9, 1, 2, 0, 0),
(460, '2018-06-04 20:25:49', '2018-06-04 20:25:49', NULL, 0, 'Futebol Sênior', '2018-07-25 20:00:00', '2018-07-25 21:00:00', 0, NULL, 9, 1, 2, 0, 0),
(461, '2018-06-04 20:25:49', '2018-06-04 20:25:49', NULL, 0, 'Futebol Sênior', '2018-07-30 20:00:00', '2018-07-30 21:00:00', 0, NULL, 9, 1, 2, 0, 0),
(462, '2018-06-04 20:25:49', '2018-06-04 20:25:49', NULL, 0, 'Futebol Sênior', '2018-08-01 20:00:00', '2018-08-01 21:00:00', 0, NULL, 9, 1, 2, 0, 0),
(463, '2018-06-04 20:25:49', '2018-06-04 20:25:49', NULL, 0, 'Futebol Sênior', '2018-08-06 20:00:00', '2018-08-06 21:00:00', 0, NULL, 9, 1, 2, 0, 0),
(464, '2018-06-04 20:25:49', '2018-06-04 20:25:49', NULL, 0, 'Futebol Sênior', '2018-08-08 20:00:00', '2018-08-08 21:00:00', 0, NULL, 9, 1, 2, 0, 0),
(465, '2018-06-04 20:25:49', '2018-06-04 20:25:49', NULL, 0, 'Futebol Sênior', '2018-08-13 20:00:00', '2018-08-13 21:00:00', 0, NULL, 9, 1, 2, 0, 0),
(466, '2018-06-04 20:25:49', '2018-06-04 20:25:49', NULL, 0, 'Futebol Sênior', '2018-08-15 20:00:00', '2018-08-15 21:00:00', 0, NULL, 9, 1, 2, 0, 0),
(467, '2018-06-04 20:25:49', '2018-06-04 20:25:49', NULL, 0, 'Futebol Sênior', '2018-08-20 20:00:00', '2018-08-20 21:00:00', 0, NULL, 9, 1, 2, 0, 0),
(468, '2018-06-04 20:25:49', '2018-06-04 20:25:49', NULL, 0, 'Futebol Sênior', '2018-08-22 20:00:00', '2018-08-22 21:00:00', 0, NULL, 9, 1, 2, 0, 0),
(469, '2018-06-04 20:25:49', '2018-06-04 20:25:49', NULL, 0, 'Futebol Sênior', '2018-08-27 20:00:00', '2018-08-27 21:00:00', 0, NULL, 9, 1, 2, 0, 0),
(470, '2018-06-04 20:25:49', '2018-06-04 20:25:49', NULL, 0, 'Futebol Sênior', '2018-08-29 20:00:00', '2018-08-29 21:00:00', 0, NULL, 9, 1, 2, 0, 0),
(471, '2018-06-04 20:25:49', '2018-06-04 20:25:49', NULL, 0, 'Futebol Sênior', '2018-09-03 20:00:00', '2018-09-03 21:00:00', 0, NULL, 9, 1, 2, 0, 0),
(472, '2018-06-04 20:25:49', '2018-06-04 20:25:49', NULL, 0, 'Futebol Sênior', '2018-09-05 20:00:00', '2018-09-05 21:00:00', 0, NULL, 9, 1, 2, 0, 0),
(473, '2018-06-04 20:25:49', '2018-06-04 20:25:49', NULL, 0, 'Futebol Sênior', '2018-09-10 20:00:00', '2018-09-10 21:00:00', 0, NULL, 9, 1, 2, 0, 0),
(474, '2018-06-04 20:25:49', '2018-06-04 20:25:49', NULL, 0, 'Futebol Sênior', '2018-09-12 20:00:00', '2018-09-12 21:00:00', 0, NULL, 9, 1, 2, 0, 0),
(475, '2018-06-04 20:25:49', '2018-06-04 20:25:49', NULL, 0, 'Futebol Sênior', '2018-09-17 20:00:00', '2018-09-17 21:00:00', 0, NULL, 9, 1, 2, 0, 0),
(476, '2018-06-04 20:25:49', '2018-06-04 20:25:49', NULL, 0, 'Futebol Sênior', '2018-09-19 20:00:00', '2018-09-19 21:00:00', 0, NULL, 9, 1, 2, 0, 0),
(477, '2018-06-04 20:25:50', '2018-06-04 20:25:50', NULL, 0, 'Futebol Sênior', '2018-09-24 20:00:00', '2018-09-24 21:00:00', 0, NULL, 9, 1, 2, 0, 0),
(478, '2018-06-04 20:25:50', '2018-06-04 20:25:50', NULL, 0, 'Futebol Sênior', '2018-09-26 20:00:00', '2018-09-26 21:00:00', 0, NULL, 9, 1, 2, 0, 0),
(479, '2018-06-04 20:25:50', '2018-06-04 20:25:50', NULL, 0, 'Futebol Sênior', '2018-10-01 20:00:00', '2018-10-01 21:00:00', 0, NULL, 9, 1, 2, 0, 0),
(480, '2018-06-04 20:25:50', '2018-06-04 20:25:50', NULL, 0, 'Futebol Sênior', '2018-10-03 20:00:00', '2018-10-03 21:00:00', 0, NULL, 9, 1, 2, 0, 0),
(481, '2018-06-04 20:25:50', '2018-06-04 20:25:50', NULL, 0, 'Futebol Sênior', '2018-10-08 20:00:00', '2018-10-08 21:00:00', 0, NULL, 9, 1, 2, 0, 0),
(482, '2018-06-04 20:25:50', '2018-06-04 20:25:50', NULL, 0, 'Futebol Sênior', '2018-10-10 20:00:00', '2018-10-10 21:00:00', 0, NULL, 9, 1, 2, 0, 0),
(483, '2018-06-04 20:25:50', '2018-06-04 20:25:50', NULL, 0, 'Futebol Sênior', '2018-10-15 20:00:00', '2018-10-15 21:00:00', 0, NULL, 9, 1, 2, 0, 0),
(484, '2018-06-04 20:25:50', '2018-06-04 20:25:50', NULL, 0, 'Futebol Sênior', '2018-10-17 20:00:00', '2018-10-17 21:00:00', 0, NULL, 9, 1, 2, 0, 0),
(485, '2018-06-04 20:25:50', '2018-06-04 20:25:50', NULL, 0, 'Futebol Sênior', '2018-10-22 20:00:00', '2018-10-22 21:00:00', 0, NULL, 9, 1, 2, 0, 0),
(486, '2018-06-04 20:25:50', '2018-06-04 20:25:50', NULL, 0, 'Futebol Sênior', '2018-10-24 20:00:00', '2018-10-24 21:00:00', 0, NULL, 9, 1, 2, 0, 0),
(487, '2018-06-04 20:25:50', '2018-06-04 20:25:50', NULL, 0, 'Futebol Sênior', '2018-10-29 20:00:00', '2018-10-29 21:00:00', 0, NULL, 9, 1, 2, 0, 0),
(488, '2018-06-05 17:54:42', '2018-06-05 17:54:42', NULL, 0, 'Capoeira do Professor Raimundo', '2018-06-11 10:00:00', '2018-06-11 12:00:45', 0, NULL, 8, 6, 2, 0, 0),
(489, '2018-06-05 17:54:42', '2018-06-05 17:54:42', NULL, 0, 'Capoeira do Professor Raimundo', '2018-06-13 10:00:00', '2018-06-13 12:00:45', 0, NULL, 8, 6, 2, 0, 0),
(490, '2018-06-05 17:54:42', '2018-06-05 17:54:42', NULL, 0, 'Capoeira do Professor Raimundo', '2018-06-15 14:00:00', '2018-06-15 16:00:45', 0, NULL, 8, 6, 2, 0, 0),
(491, '2018-06-05 17:54:42', '2018-06-05 17:54:42', NULL, 0, 'Capoeira do Professor Raimundo', '2018-06-18 10:00:00', '2018-06-18 12:00:45', 0, NULL, 8, 6, 2, 0, 0),
(492, '2018-06-05 17:54:42', '2018-06-05 17:54:42', NULL, 0, 'Capoeira do Professor Raimundo', '2018-06-20 10:00:00', '2018-06-20 12:00:45', 0, NULL, 8, 6, 2, 0, 0),
(493, '2018-06-05 17:54:42', '2018-06-05 17:54:42', NULL, 0, 'Capoeira do Professor Raimundo', '2018-06-22 14:00:00', '2018-06-22 16:00:45', 0, NULL, 8, 6, 2, 0, 0),
(494, '2018-06-05 17:54:42', '2018-06-05 17:54:42', NULL, 0, 'Capoeira do Professor Raimundo', '2018-06-25 10:00:00', '2018-06-25 12:00:45', 0, NULL, 8, 6, 2, 0, 0),
(495, '2018-06-05 17:54:42', '2018-06-05 17:54:42', NULL, 0, 'Capoeira do Professor Raimundo', '2018-06-27 10:00:00', '2018-06-27 12:00:45', 0, NULL, 8, 6, 2, 0, 0),
(496, '2018-06-05 17:54:42', '2018-06-05 17:54:42', NULL, 0, 'Capoeira do Professor Raimundo', '2018-06-29 14:00:00', '2018-06-29 16:00:45', 0, NULL, 8, 6, 2, 0, 0),
(497, '2018-06-05 17:54:42', '2018-06-05 17:54:42', NULL, 0, 'Capoeira do Professor Raimundo', '2018-07-02 10:00:00', '2018-07-02 12:00:45', 0, NULL, 8, 6, 2, 0, 0),
(498, '2018-06-05 17:54:42', '2018-06-05 17:54:42', NULL, 0, 'Capoeira do Professor Raimundo', '2018-07-04 10:00:00', '2018-07-04 12:00:45', 0, NULL, 8, 6, 2, 0, 0),
(499, '2018-06-05 17:54:42', '2018-06-05 17:54:42', NULL, 0, 'Capoeira do Professor Raimundo', '2018-07-06 14:00:00', '2018-07-06 16:00:45', 0, NULL, 8, 6, 2, 0, 0),
(500, '2018-06-05 17:54:42', '2018-06-05 17:54:42', NULL, 0, 'Capoeira do Professor Raimundo', '2018-07-09 10:00:00', '2018-07-09 12:00:45', 0, NULL, 8, 6, 2, 0, 0),
(501, '2018-06-05 17:54:42', '2018-06-05 17:54:42', NULL, 0, 'Capoeira do Professor Raimundo', '2018-07-11 10:00:00', '2018-07-11 12:00:45', 0, NULL, 8, 6, 2, 0, 0),
(502, '2018-06-05 17:54:42', '2018-06-05 17:54:42', NULL, 0, 'Capoeira do Professor Raimundo', '2018-07-13 14:00:00', '2018-07-13 16:00:45', 0, NULL, 8, 6, 2, 0, 0),
(503, '2018-06-05 17:54:42', '2018-06-05 17:54:42', NULL, 0, 'Capoeira do Professor Raimundo', '2018-07-16 10:00:00', '2018-07-16 12:00:45', 0, NULL, 8, 6, 2, 0, 0),
(504, '2018-06-05 17:54:42', '2018-06-05 17:54:42', NULL, 0, 'Capoeira do Professor Raimundo', '2018-07-18 10:00:00', '2018-07-18 12:00:45', 0, NULL, 8, 6, 2, 0, 0),
(505, '2018-06-05 17:54:42', '2018-06-05 17:54:42', NULL, 0, 'Capoeira do Professor Raimundo', '2018-07-20 14:00:00', '2018-07-20 16:00:45', 0, NULL, 8, 6, 2, 0, 0),
(506, '2018-06-05 17:54:42', '2018-06-05 17:54:42', NULL, 0, 'Capoeira do Professor Raimundo', '2018-07-23 10:00:00', '2018-07-23 12:00:45', 0, NULL, 8, 6, 2, 0, 0),
(507, '2018-06-05 17:54:42', '2018-06-05 17:54:42', NULL, 0, 'Capoeira do Professor Raimundo', '2018-07-25 10:00:00', '2018-07-25 12:00:45', 0, NULL, 8, 6, 2, 0, 0),
(508, '2018-06-05 17:54:42', '2018-06-05 17:54:42', NULL, 0, 'Capoeira do Professor Raimundo', '2018-07-27 14:00:00', '2018-07-27 16:00:45', 0, NULL, 8, 6, 2, 0, 0),
(509, '2018-06-05 17:54:42', '2018-06-05 17:54:42', NULL, 0, 'Capoeira do Professor Raimundo', '2018-07-30 10:00:00', '2018-07-30 12:00:45', 0, NULL, 8, 6, 2, 0, 0),
(510, '2018-06-05 17:54:42', '2018-06-05 17:54:42', NULL, 0, 'Capoeira do Professor Raimundo', '2018-08-01 10:00:00', '2018-08-01 12:00:45', 0, NULL, 8, 6, 2, 0, 0),
(511, '2018-06-05 17:54:42', '2018-06-05 17:54:42', NULL, 0, 'Capoeira do Professor Raimundo', '2018-08-03 14:00:00', '2018-08-03 16:00:45', 0, NULL, 8, 6, 2, 0, 0),
(512, '2018-06-06 18:03:03', '2018-06-06 18:03:03', NULL, 0, 'Natação dos Patos', '2018-06-07 14:00:00', '2018-06-07 19:00:00', 0, NULL, 11, 7, 1, 0, 0),
(513, '2018-06-07 18:35:29', NULL, NULL, 50092.200000000004, 'Volley Cabral', '2018-06-23 11:00:00', '2018-06-23 14:00:00', 0, 40, 8, NULL, NULL, 100, 10);

-- --------------------------------------------------------

--
-- Estrutura para tabela `evento__detalhes`
--

CREATE TABLE IF NOT EXISTS `evento__detalhes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `evento_id` int(11) DEFAULT NULL,
  `produto_id` int(11) DEFAULT NULL,
  `produto_valor` double NOT NULL,
  `quantidade` int(11) NOT NULL DEFAULT '0',
  `sub_total` double NOT NULL,
  `desconto` double NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=21 ;

--
-- Fazendo dump de dados para tabela `evento__detalhes`
--

INSERT INTO `evento__detalhes` (`id`, `created_at`, `updated_at`, `evento_id`, `produto_id`, `produto_valor`, `quantidade`, `sub_total`, `desconto`, `deleted_at`) VALUES
(1, NULL, NULL, 3, 1, 5500, 10, 55000, 0, NULL),
(2, NULL, NULL, 3, 3, 2000, 1, 2000, 0, NULL),
(3, NULL, NULL, 3, 2, 4000, 2, 8000, 0, NULL),
(4, NULL, NULL, 4, 3, 2500, 1, 2500, 0, NULL),
(5, NULL, NULL, 4, 2, 3000, 5, 15000, 0, NULL),
(6, NULL, NULL, 4, 1, 5000, 10, 50000, 0, NULL),
(10, NULL, NULL, 5, 3, 2500, 20, 50000, 0, NULL),
(11, NULL, NULL, 5, 1, 5000, 10, 45000, 5000, NULL),
(15, NULL, NULL, 6, 3, 2500, 100, 250000, 0, NULL),
(16, NULL, NULL, 7, 3, 2500, 50, 124990, 10, NULL),
(14, NULL, NULL, 8, 1, 5000, 100, 500000, 0, NULL),
(17, NULL, NULL, 326, 5, 4545, 2, 9090, 0, NULL),
(19, NULL, NULL, 22, 5, 4545, 60, 272700, 0, '2018-05-22 14:07:32'),
(18, NULL, NULL, 22, 10, 50045, 666, 33329970, 0, '2018-05-22 14:07:32'),
(20, '2018-06-07 18:35:29', NULL, 513, 3, 2500.11, 20, 50002.200000000004, 0, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `fornecedores`
--

CREATE TABLE IF NOT EXISTS `fornecedores` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `documento` varchar(18) COLLATE utf8_unicode_ci NOT NULL,
  `tipo_documento` varchar(18) COLLATE utf8_unicode_ci NOT NULL,
  `nome_contato` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `telefone` varchar(14) COLLATE utf8_unicode_ci NOT NULL,
  `celular` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Fazendo dump de dados para tabela `fornecedores`
--

INSERT INTO `fornecedores` (`id`, `nome`, `documento`, `tipo_documento`, `nome_contato`, `telefone`, `celular`, `email`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Quiosque da Mangueira', '123345/0001', 'CNPJ', 'Zé do Bar', '(71) 3372-7393', '71 991832575', 'zedobar@hotmail.com', '2018-03-26 09:59:38', NULL, NULL),
(2, 'Distribuidora de Bebidas PEPSICO', '123456-83/0001', 'CNPJ', 'Gordiola Dibebis', '(73) 3527-8366', '71 991832575', 'gordiola@pepsico.com.br', '2018-03-26 10:01:28', NULL, NULL),
(3, 'Restaurante da Piscina', '123.321.222-01', 'CPF', 'Boca de Galinha', '(71)33206747', '71 991832575', 'bocadegalinha@tjba.jus.br', '2018-03-26 10:46:46', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `matriculas`
--

CREATE TABLE IF NOT EXISTS `matriculas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `atividade_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `data_matricula` date NOT NULL,
  `mensalidade` double NOT NULL,
  `desconto` double NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Fazendo dump de dados para tabela `matriculas`
--

INSERT INTO `matriculas` (`id`, `atividade_id`, `usuario_id`, `data_matricula`, `mensalidade`, `desconto`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, 3, '2018-03-26', 30000, 0, '2018-03-26 11:08:49', NULL, '2018-03-26 11:11:57'),
(2, 3, 1, '2018-03-20', 50000, 20000, '2018-03-26 11:09:29', NULL, '2018-03-26 11:11:43'),
(3, 2, 2, '2018-03-26', 50000, 30000, '2018-03-26 11:57:21', NULL, NULL),
(4, 2, 4, '2018-03-26', 20000, 0, '2018-03-26 11:57:51', NULL, NULL),
(5, 1, 3, '2018-03-26', 100000, 0, '2018-03-26 12:00:17', NULL, NULL),
(6, 1, 4, '2018-05-17', 130000, 0, '2018-05-17 09:29:36', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=65 ;

--
-- Fazendo dump de dados para tabela `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2016_08_07_145904_add_table_cms_apicustom', 1),
(2, '2016_08_07_150834_add_table_cms_dashboard', 1),
(3, '2016_08_07_151210_add_table_cms_logs', 1),
(4, '2016_08_07_152014_add_table_cms_privileges', 1),
(5, '2016_08_07_152214_add_table_cms_privileges_roles', 1),
(6, '2016_08_07_152320_add_table_cms_settings', 1),
(7, '2016_08_07_152421_add_table_cms_users', 1),
(8, '2016_08_07_154624_add_table_cms_moduls', 1),
(9, '2016_08_17_225409_add_status_cms_users', 1),
(10, '2016_08_20_125418_add_table_cms_notifications', 1),
(11, '2016_09_04_033706_add_table_cms_email_queues', 1),
(12, '2016_09_16_035347_add_group_setting', 1),
(13, '2016_09_16_045425_add_label_setting', 1),
(14, '2016_09_17_104728_create_nullable_cms_apicustom', 1),
(15, '2016_10_01_141740_add_method_type_apicustom', 1),
(16, '2016_10_01_141846_add_parameters_apicustom', 1),
(17, '2016_10_01_141934_add_responses_apicustom', 1),
(18, '2016_10_01_144826_add_table_apikey', 1),
(19, '2016_11_14_141657_create_cms_menus', 1),
(20, '2016_11_15_132350_create_cms_email_templates', 1),
(21, '2016_11_15_190410_create_cms_statistics', 1),
(22, '2016_11_17_102740_create_cms_statistic_components', 1),
(23, '2018_02_22_212328_create_produtos_table', 1),
(24, '2018_02_23_210556_create_clientes_table', 1),
(25, '2018_02_23_210625_create_eventos_table', 1),
(26, '2018_02_23_211318_create_evento__detalhes_table', 1),
(27, '2018_02_27_022453_create_categorias_table', 1),
(28, '2018_02_27_233741_create_cobrancas_table', 1),
(29, '2018_03_04_232159_add_dates_to_eventos', 1),
(33, '2018_03_05_233403_add_desconto_to_eventos_detalhe', 2),
(34, '2018_03_07_003914_create_atividades_table', 3),
(35, '2018_03_07_012758_create_atividades_table', 4),
(36, '2018_03_08_024246_create_area_competencias_table', 5),
(37, '2018_03_09_013541_create_espacos_table', 6),
(39, '2018_03_10_000657_create_socios_table', 7),
(40, '2018_03_10_202030_create_dependentes_table', 8),
(41, '2018_03_10_222213_alter_dependentes_table', 9),
(42, '2018_03_10_222521_alter_socios_table', 9),
(44, '2018_03_14_014557_alter_eventos_table', 10),
(45, '2018_03_14_160549_alter_espacos_table', 10),
(46, '2018_03_21_161352_create_fornecedores_table', 11),
(47, '2018_03_23_022544_alter_eventos_table_new_fields', 12),
(50, '2018_03_25_234448_alter_espacos_table_add_destinacao', 13),
(51, '2018_03_26_000254_alter_eventos_table_del_professor', 14),
(52, '2018_03_26_001311_alter_atividades_table_name', 15),
(53, '2018_03_26_010945_create_table_atividades', 16),
(54, '2018_03_26_020844_alter_produtos_table_add_fornecedor', 16),
(55, '2018_03_26_021429_create_table_professores', 16),
(56, '2018_03_26_021800_create_table_usuarios', 16),
(57, '2018_03_26_022115_create_table_matriculas', 16),
(58, '2018_03_28_000211_alter_table_eventos_rename_destino', 17),
(59, '2018_03_28_004018_alter_table_eventos_add_valor_espaco', 18),
(60, '2018_04_03_210149_alter_table_atividades_add_espacoid', 19),
(61, '2018_05_15_084259_alter_table_atividades_add_agendado', 20),
(62, '2018_05_22_135743_add_delete_to_evento_detalhes', 21),
(63, '2018_05_24_185310_alter_table_eventos_add_professorid', 22),
(64, '2018_06_02_184824_alter_table_dependentes_rename_fields', 23);

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

CREATE TABLE IF NOT EXISTS `produtos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `valor` double(8,2) NOT NULL,
  `fornecedor_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11 ;

--
-- Fazendo dump de dados para tabela `produtos`
--

INSERT INTO `produtos` (`id`, `nome`, `valor`, `fornecedor_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Cerveja Itaipava 493ml', 500000.45, 2, '2018-03-06 00:09:46', '2018-03-26 10:23:43', NULL),
(2, 'Coca-cola 1L', 3000.12, 1, '2018-03-06 00:10:11', '2018-03-26 10:24:13', NULL),
(3, 'Água 1L', 2500.11, 1, '2018-03-06 00:10:32', '2018-03-26 10:23:13', NULL),
(4, 'Cerveja Skol 350ml', 3500.13, 1, '2018-03-26 10:21:39', NULL, NULL),
(5, 'Cerveja Heineken Longneck 355ml', 4545.00, 2, '2018-03-26 10:22:40', '2018-04-23 05:09:27', NULL),
(10, 'moa', 50045.00, 1, NULL, '2018-04-25 08:30:40', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `professores`
--

CREATE TABLE IF NOT EXISTS `professores` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `documento` varchar(18) COLLATE utf8_unicode_ci NOT NULL,
  `tipo_documento` varchar(18) COLLATE utf8_unicode_ci NOT NULL,
  `telefone` varchar(14) COLLATE utf8_unicode_ci NOT NULL,
  `celular` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `hora_aula` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Fazendo dump de dados para tabela `professores`
--

INSERT INTO `professores` (`id`, `nome`, `documento`, `tipo_documento`, `telefone`, `celular`, `email`, `hora_aula`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Pardal', '001.002.004-55', 'CPF', '', '', '', 120000, '2018-03-26 10:30:11', NULL, NULL),
(2, 'Raimundo Nonato', '123456-97', 'RG', '', '', '', 50000, '2018-03-26 10:30:51', NULL, NULL),
(3, 'Xavier', '123.321.222-01', 'CPF', '', '', '', 7050, '2018-03-29 16:17:06', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `socios`
--

CREATE TABLE IF NOT EXISTS `socios` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `nome` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `matricula` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `funcao` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cpf` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rg` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `endereco` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bairro` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cidade` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estado` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cep` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `celular` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ramal` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sexo` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estado_civil` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nacionalidade` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `naturalidade` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lotacao` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unidade` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `profissao` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `areacompetencia_id` int(11) DEFAULT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  `cobranca_id` int(11) DEFAULT NULL,
  `outra_matricula` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data_adesao` date DEFAULT NULL,
  `obs` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=41 ;

--
-- Fazendo dump de dados para tabela `socios`
--

INSERT INTO `socios` (`id`, `created_at`, `updated_at`, `deleted_at`, `nome`, `matricula`, `funcao`, `cpf`, `rg`, `data_nascimento`, `endereco`, `bairro`, `cidade`, `estado`, `cep`, `telefone`, `celular`, `email`, `ramal`, `sexo`, `estado_civil`, `nacionalidade`, `naturalidade`, `lotacao`, `unidade`, `profissao`, `areacompetencia_id`, `categoria_id`, `cobranca_id`, `outra_matricula`, `data_adesao`, `obs`) VALUES
(1, '2018-03-11 04:03:53', '2018-03-11 09:39:02', NULL, 'Tony Montana', '1982', 'Administrador', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 3, 11, 1, '', '1960-12-31', ''),
(2, '2018-03-11 04:11:41', '2018-03-14 07:12:24', NULL, 'Fred Flintstones', 'YabbaDabbaDoo', '', '', '', '1900-12-14', '', '', '', '', '', '', '', '', '', 'M', 'C', '', '', '', '', '', 3, 14, 3, '', '1900-12-21', ''),
(3, '2018-05-23 05:26:29', NULL, '2018-05-23 05:29:56', 'PALOMA SANTANA DA SILVA MOREIRA', '', '', '', '', '1999-07-21', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 3, 14, 3, '', '0000-00-00', ''),
(4, '2018-05-30 14:25:55', '2018-05-30 14:29:28', '2018-06-08 18:14:56', 'Vitola Freirinha', '', '', '', '', '0000-00-00', 'Rua da Gratidão', '', 'Salvador', 'BA', '41650-19', '', '', '', '', '', '', '', '', '', '', '', 1, 14, 4, '', '1969-12-31', ''),
(5, '2018-06-02 19:01:54', NULL, NULL, 'Vitor Alberto Smith Freire', '', '', '', '', '1969-12-31', '', '', '', '', '', '', '', '', '', 'Masculino', 'Casado(a)', '', '', '', '', '', 3, 9, 4, '', '1969-12-31', ''),
(6, '2018-06-02 19:15:26', NULL, NULL, 'Moa', '', '', '', '', '1983-04-03', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 3, 10, 1, '', '0000-00-00', ''),
(7, '2018-06-02 19:40:37', NULL, NULL, 'Bob Pai', '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', 'Masculino', '', '', '', '', '', '', 3, 11, 1, '', '0000-00-00', ''),
(8, '2018-06-02 19:44:03', '2018-06-02 19:45:50', NULL, 'Mr M', '', '', '', '', '2018-06-02', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 1, 14, 4, '', '0000-00-00', ''),
(9, '2018-06-02 19:48:36', NULL, NULL, 'Luamar', '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 1, 19, 3, '', '0000-00-00', ''),
(10, '2018-06-03 19:59:11', NULL, NULL, 'Vitolão', '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 1, 14, 5, '', '0000-00-00', ''),
(11, '2018-06-03 20:04:44', NULL, NULL, 'Neymar', '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 2, 11, 4, '', '0000-00-00', ''),
(12, '2018-06-03 21:09:23', NULL, NULL, 'Walter', '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 2, 10, 4, '', '0000-00-00', ''),
(13, '2018-06-04 20:37:26', NULL, NULL, 'Mahatma', '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 1, 11, 5, '', '0000-00-00', ''),
(14, '2018-06-04 21:54:54', NULL, '2018-06-08 18:14:56', 'Vitor Alberto Smith', '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 1, 19, 3, '', '0000-00-00', ''),
(15, '2018-06-05 17:46:49', NULL, NULL, 'Goku', '', '', '', '', '1975-11-26', '', '', '', 'BA', '', '', '', '', '', 'Feminino', 'União Estável', '', '', '', '', '', 1, 10, 1, '', '2018-06-05', ''),
(16, '2018-06-06 11:30:51', NULL, '2018-06-08 18:14:56', 'Sem data', '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 1, 11, 1, '', '0000-00-00', ''),
(17, '2018-06-07 17:07:25', NULL, NULL, 'Joca', '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 1, 19, 1, '', '0000-00-00', ''),
(18, '2018-06-07 17:13:49', NULL, NULL, 'Andreca', '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 2, 19, 4, '', '0000-00-00', ''),
(19, '2018-06-07 17:19:11', NULL, '2018-06-08 18:14:56', 'Luciana', '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 2, 9, 1, '', '0000-00-00', ''),
(20, '2018-06-07 17:20:20', NULL, '2018-06-08 18:14:56', 'Luciana', '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 2, 9, 1, '', '0000-00-00', ''),
(21, '2018-06-07 17:51:26', NULL, '2018-06-08 18:12:17', 'Luciana', '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 2, 9, 1, '', '0000-00-00', ''),
(22, '2018-06-07 17:56:58', NULL, '2018-06-08 18:12:17', 'Luciana', '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 2, 9, 1, '', '0000-00-00', ''),
(23, '2018-06-07 18:03:26', NULL, '2018-06-08 18:12:17', 'Luciana', '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 2, 9, 1, '', '0000-00-00', ''),
(24, '2018-06-07 18:04:09', NULL, '2018-06-08 18:12:17', 'Luciana', '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 2, 9, 1, '', '0000-00-00', ''),
(25, '2018-06-07 18:04:45', NULL, '2018-06-08 18:12:17', 'Luciana', '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 2, 9, 1, '', '0000-00-00', ''),
(26, '2018-06-07 18:10:36', NULL, '2018-06-08 18:12:17', 'Luciana', '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 2, 9, 1, '', '0000-00-00', ''),
(27, '2018-06-07 18:12:16', NULL, '2018-06-08 18:12:17', 'FABIANO', '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 3, 10, 1, '', '0000-00-00', ''),
(28, '2018-06-07 18:12:57', NULL, '2018-06-08 18:12:17', 'FABIANO', '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 3, 10, 1, '', '0000-00-00', ''),
(29, '2018-06-07 18:13:51', NULL, '2018-06-08 18:12:17', 'FABIANO', '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 3, 10, 1, '', '0000-00-00', ''),
(30, '2018-06-07 18:16:48', NULL, '2018-06-08 18:12:17', 'rbgraga', '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 1, 9, 1, '', '0000-00-00', ''),
(31, '2018-06-07 18:17:57', NULL, '2018-06-08 18:12:17', 'rbgraga', '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 1, 9, 1, '', '0000-00-00', ''),
(32, '2018-06-07 18:18:26', NULL, '2018-06-08 18:12:17', 'BLIC CONDOMINIOS LTDA', '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 1, 14, 3, '', '0000-00-00', ''),
(33, '2018-06-07 18:20:36', NULL, '2018-06-08 18:12:17', 'BLIC CONDOMINIOS LTDA', '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 1, 14, 3, '', '0000-00-00', ''),
(34, '2018-06-07 18:21:22', NULL, '2018-06-08 18:12:17', 'BLIC CONDOMINIOS LTDA', '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 1, 14, 3, '', '0000-00-00', ''),
(35, '2018-06-07 18:22:41', NULL, '2018-06-08 18:12:17', 'BLIC CONDOMINIOS LTDA', '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 1, 14, 3, '', '0000-00-00', ''),
(36, '2018-06-07 18:24:59', NULL, '2018-06-08 18:12:17', 'BLIC CONDOMINIOS LTDA', '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 1, 14, 3, '', '0000-00-00', ''),
(37, '2018-06-07 18:26:55', NULL, '2018-06-08 18:12:17', 'BLIC CONDOMINIOS LTDA', '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 1, 14, 3, '', '0000-00-00', ''),
(38, '2018-06-07 18:27:22', NULL, '2018-06-08 18:12:17', 'BLIC CONDOMINIOS LTDA', '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 1, 14, 3, '', '0000-00-00', ''),
(39, '2018-06-07 18:31:27', NULL, NULL, 'Calvin Harris', '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', 'Masculino', '', '', '', '', '', '', 1, 11, 4, '', '0000-00-00', ''),
(40, '2018-06-07 18:33:18', NULL, NULL, 'Roberto Cabral', '', '', '', '', '1975-11-26', '', '', 'Valença', 'BA', '', '', '', '', '', 'Masculino', 'Casado(a)', '', '', '', '', '', 1, 11, 1, '', '0000-00-00', '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipo_atividades`
--

CREATE TABLE IF NOT EXISTS `tipo_atividades` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `mensalidade` double(7,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=14 ;

--
-- Fazendo dump de dados para tabela `tipo_atividades`
--

INSERT INTO `tipo_atividades` (`id`, `descricao`, `mensalidade`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Capoeira', 40.13, '2018-03-08 09:47:58', '2018-03-08 09:47:58', NULL),
(2, 'Dança de Salão', 50.00, '2018-03-08 09:47:59', '2018-03-08 09:47:59', NULL),
(3, 'Futebol de Campo', 0.00, '2018-03-08 09:47:59', '2018-03-08 09:47:59', NULL),
(4, 'Futebol Society', 0.00, '2018-03-08 09:47:59', '2018-03-08 09:47:59', NULL),
(5, 'Futebol de Mesa', 0.00, '2018-03-08 09:48:00', '2018-03-08 09:48:00', NULL),
(6, 'Handebol', 0.00, '2018-03-08 09:48:00', '2018-03-08 09:48:00', NULL),
(7, 'Karate', 40.13, '2018-03-08 09:48:00', '2018-03-08 09:48:00', NULL),
(8, 'Natação', 0.00, '2018-03-08 09:48:00', '2018-03-08 09:48:00', NULL),
(9, 'Patinação', 50.00, '2018-03-08 09:48:01', '2018-03-08 09:48:01', NULL),
(10, 'Pilates', 0.00, '2018-03-08 09:48:01', '2018-03-08 09:48:01', NULL),
(11, 'Tai Chi Chuan', 20.00, '2018-03-08 09:48:01', '2018-03-08 09:48:01', NULL),
(12, 'Jiu-jitsu', 80.00, '2018-03-26 08:01:01', NULL, NULL),
(13, 'Zumba', 100.00, '2018-03-26 08:02:29', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `cpf` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rg` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `endereco` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bairro` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cidade` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estado` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cep` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `celular` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ramal` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sexo` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estado_civil` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nacionalidade` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `naturalidade` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lotacao` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unidade` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `profissao` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cobranca_id` int(11) DEFAULT NULL,
  `obs` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Fazendo dump de dados para tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `cpf`, `rg`, `data_nascimento`, `endereco`, `bairro`, `cidade`, `estado`, `cep`, `telefone`, `celular`, `email`, `ramal`, `sexo`, `estado_civil`, `nacionalidade`, `naturalidade`, `lotacao`, `unidade`, `profissao`, `cobranca_id`, `obs`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Paulo Cintura', '', '', '1972-07-13', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 1, '', '2018-03-26 10:34:58', NULL, NULL),
(2, 'Pato Donald', '', '', '1931-12-24', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 4, '', '2018-03-26 10:35:52', NULL, NULL),
(3, 'Seu Boneco', '', '', '1984-10-30', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 4, '', '2018-03-26 10:36:36', NULL, NULL),
(4, 'Margarida', '', '', '1945-05-21', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 1, '', '2018-03-26 10:37:09', NULL, NULL),
(5, 'Bolsonaro 2018', '12314312343', '3214234234', '2018-05-31', 'rua do ai quem quer', 'ogro gogo', 'melao', 'do', '54665464', '5450000045454', '4546405450', 'chota12@genitallia.c', '4546464', 'd', 'e', '', '', '', '', '', 1, '', '2018-05-17 09:59:57', NULL, NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
