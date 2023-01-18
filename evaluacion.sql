-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.6.8-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para evaluacion
CREATE DATABASE IF NOT EXISTS `evaluacion` /*!40100 DEFAULT CHARACTER SET utf8mb3 */;
USE `evaluacion`;

-- Volcando estructura para tabla evaluacion.auth_group
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.auth_group: ~0 rows (aproximadamente)
DELETE FROM `auth_group`;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;

-- Volcando estructura para tabla evaluacion.auth_group_permissions
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.auth_group_permissions: ~0 rows (aproximadamente)
DELETE FROM `auth_group_permissions`;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;

-- Volcando estructura para tabla evaluacion.auth_permission
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.auth_permission: ~72 rows (aproximadamente)
DELETE FROM `auth_permission`;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add log entry', 1, 'add_logentry'),
	(2, 'Can change log entry', 1, 'change_logentry'),
	(3, 'Can delete log entry', 1, 'delete_logentry'),
	(4, 'Can view log entry', 1, 'view_logentry'),
	(5, 'Can add permission', 2, 'add_permission'),
	(6, 'Can change permission', 2, 'change_permission'),
	(7, 'Can delete permission', 2, 'delete_permission'),
	(8, 'Can view permission', 2, 'view_permission'),
	(9, 'Can add group', 3, 'add_group'),
	(10, 'Can change group', 3, 'change_group'),
	(11, 'Can delete group', 3, 'delete_group'),
	(12, 'Can view group', 3, 'view_group'),
	(13, 'Can add user', 4, 'add_user'),
	(14, 'Can change user', 4, 'change_user'),
	(15, 'Can delete user', 4, 'delete_user'),
	(16, 'Can view user', 4, 'view_user'),
	(17, 'Can add content type', 5, 'add_contenttype'),
	(18, 'Can change content type', 5, 'change_contenttype'),
	(19, 'Can delete content type', 5, 'delete_contenttype'),
	(20, 'Can view content type', 5, 'view_contenttype'),
	(21, 'Can add session', 6, 'add_session'),
	(22, 'Can change session', 6, 'change_session'),
	(23, 'Can delete session', 6, 'delete_session'),
	(24, 'Can view session', 6, 'view_session'),
	(25, 'Can add asignatura', 7, 'add_asignatura'),
	(26, 'Can change asignatura', 7, 'change_asignatura'),
	(27, 'Can delete asignatura', 7, 'delete_asignatura'),
	(28, 'Can view asignatura', 7, 'view_asignatura'),
	(29, 'Can add Cuestionario', 8, 'add_cuestionario'),
	(30, 'Can change Cuestionario', 8, 'change_cuestionario'),
	(31, 'Can delete Cuestionario', 8, 'delete_cuestionario'),
	(32, 'Can view Cuestionario', 8, 'view_cuestionario'),
	(33, 'Can add DirectivoAsignaturaDocente', 9, 'add_directivoasignaturadocente'),
	(34, 'Can change DirectivoAsignaturaDocente', 9, 'change_directivoasignaturadocente'),
	(35, 'Can delete DirectivoAsignaturaDocente', 9, 'delete_directivoasignaturadocente'),
	(36, 'Can view DirectivoAsignaturaDocente', 9, 'view_directivoasignaturadocente'),
	(37, 'Can add Asignatura', 10, 'add_docenteasignaturadocente'),
	(38, 'Can change Asignatura', 10, 'change_docenteasignaturadocente'),
	(39, 'Can delete Asignatura', 10, 'delete_docenteasignaturadocente'),
	(40, 'Can view Asignatura', 10, 'view_docenteasignaturadocente'),
	(41, 'Can add EstudianteAsignaturaDocente', 11, 'add_estudianteasignaturadocente'),
	(42, 'Can change EstudianteAsignaturaDocente', 11, 'change_estudianteasignaturadocente'),
	(43, 'Can delete EstudianteAsignaturaDocente', 11, 'delete_estudianteasignaturadocente'),
	(44, 'Can view EstudianteAsignaturaDocente', 11, 'view_estudianteasignaturadocente'),
	(45, 'Can add Periodo Académico', 12, 'add_periodoacademico'),
	(46, 'Can change Periodo Académico', 12, 'change_periodoacademico'),
	(47, 'Can delete Periodo Académico', 12, 'delete_periodoacademico'),
	(48, 'Can view Periodo Académico', 12, 'view_periodoacademico'),
	(49, 'Can add Pregunta', 13, 'add_pregunta'),
	(50, 'Can change Pregunta', 13, 'change_pregunta'),
	(51, 'Can delete Pregunta', 13, 'delete_pregunta'),
	(52, 'Can view Pregunta', 13, 'view_pregunta'),
	(53, 'Can add Tabulacion', 14, 'add_tabulacion'),
	(54, 'Can change Tabulacion', 14, 'change_tabulacion'),
	(55, 'Can delete Tabulacion', 14, 'delete_tabulacion'),
	(56, 'Can view Tabulacion', 14, 'view_tabulacion'),
	(57, 'Can add Respuesta', 15, 'add_respuesta'),
	(58, 'Can change Respuesta', 15, 'change_respuesta'),
	(59, 'Can delete Respuesta', 15, 'delete_respuesta'),
	(60, 'Can view Respuesta', 15, 'view_respuesta'),
	(61, 'Can add Periodo Evaluación', 16, 'add_periodoevaluacion'),
	(62, 'Can change Periodo Evaluación', 16, 'change_periodoevaluacion'),
	(63, 'Can delete Periodo Evaluación', 16, 'delete_periodoevaluacion'),
	(64, 'Can view Periodo Evaluación', 16, 'view_periodoevaluacion'),
	(65, 'Can add Evaluacion', 17, 'add_evaluacion'),
	(66, 'Can change Evaluacion', 17, 'change_evaluacion'),
	(67, 'Can delete Evaluacion', 17, 'delete_evaluacion'),
	(68, 'Can view Evaluacion', 17, 'view_evaluacion'),
	(69, 'Can add Configuracion', 18, 'add_configuracion'),
	(70, 'Can change Configuracion', 18, 'change_configuracion'),
	(71, 'Can delete Configuracion', 18, 'delete_configuracion'),
	(72, 'Can view Configuracion', 18, 'view_configuracion');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;

-- Volcando estructura para tabla evaluacion.auth_user
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.auth_user: ~5 rows (aproximadamente)
DELETE FROM `auth_user`;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
	(1, 'pbkdf2_sha256$390000$pkC52f5Mz1GHaQwzfGjRl0$RuMjDtjrpjAdSA38U3BmsIjhKMx5pc5VNXET0IlvZJI=', '2023-01-18 08:23:58.759287', 1, 'allen', '', '', '', 1, 1, '2023-01-18 03:36:36.767070'),
	(2, 'pbkdf2_sha256$390000$zMQmXpEzAFmNNICtLBwJ3Z$ilwSDMOq8R8i6+wd62n/Hjpa7GsOBYMA8ZidE410eCk=', '2023-01-18 07:47:06.986457', 0, 'estudiante1_', 'Luis', 'Sarmiento', '', 0, 1, '2023-01-18 03:40:44.000000'),
	(3, 'pbkdf2_sha256$390000$tTjmjRobtJ5MFT3Kd1UQvz$blFExf6zS7tsFsUVNLWRfmfZoINVyyhUssRNyV3qK68=', '2023-01-18 07:46:47.578556', 0, 'docente1_', 'Pedro', 'Martinez', '', 0, 1, '2023-01-18 05:53:45.000000'),
	(4, 'pbkdf2_sha256$390000$g0N53VYUxns8qhVdlZyzOw$aA/DaBxMDrVmK0bzhR7/huD9frmzvZuEMCp3bAjBH80=', '2023-01-18 10:44:20.557048', 0, 'directivo1_', 'alfonso', 'monteros', '', 0, 1, '2023-01-18 06:31:40.000000'),
	(5, 'pbkdf2_sha256$390000$owbWqmNqdnpSdufeVD9yJD$JWPvviLNoP8tUWifpT12yX6gaap850cexl3SHTxSr8c=', NULL, 0, 'docente2_', 'Francis', 'Franco', '', 0, 1, '2023-01-18 07:40:41.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;

-- Volcando estructura para tabla evaluacion.auth_user_groups
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.auth_user_groups: ~0 rows (aproximadamente)
DELETE FROM `auth_user_groups`;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;

-- Volcando estructura para tabla evaluacion.auth_user_user_permissions
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.auth_user_user_permissions: ~0 rows (aproximadamente)
DELETE FROM `auth_user_user_permissions`;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;

-- Volcando estructura para tabla evaluacion.django_admin_log
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.django_admin_log: ~30 rows (aproximadamente)
DELETE FROM `django_admin_log`;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
	(1, '2023-01-18 05:45:29.731006', '2', ' - <QuerySet [<Asignatura: Mate - Matematicas carrear>]>', 1, '[{"added": {}}]', 11, 1),
	(2, '2023-01-18 05:53:45.497091', '3', 'docente1_', 1, '[{"added": {}}]', 4, 1),
	(3, '2023-01-18 05:54:29.553230', '1', 'Cuestionario Estudiante - Asignatura', 2, '[{"changed": {"fields": ["Nombre"]}}]', 8, 1),
	(4, '2023-01-18 05:55:22.928391', '2', 'Cuestionario Autoevaluacion Docente', 1, '[{"added": {}}]', 8, 1),
	(5, '2023-01-18 05:55:53.469056', '3', 'Cuestionario Directivo Docente', 1, '[{"added": {}}]', 8, 1),
	(6, '2023-01-18 05:56:16.692649', '3', ' - <QuerySet [<Asignatura: Mate - Matematicas carrear>]>', 1, '[{"added": {}}]', 10, 1),
	(7, '2023-01-18 05:57:50.767567', '3', 'docente1_', 2, '[{"changed": {"fields": ["First name", "Last name"]}}]', 4, 1),
	(8, '2023-01-18 05:57:57.943367', '2', 'estudiante1_', 2, '[{"changed": {"fields": ["First name", "Last name"]}}]', 4, 1),
	(9, '2023-01-18 05:59:50.592912', '1', '1 - Como está', 1, '[{"added": {}}]', 13, 1),
	(10, '2023-01-18 05:59:59.712137', '2', '2 - que tal', 1, '[{"added": {}}]', 13, 1),
	(11, '2023-01-18 06:00:06.555921', '3', '3 - tercera pregunta', 1, '[{"added": {}}]', 13, 1),
	(12, '2023-01-18 06:00:18.824553', '4', '1 - que tal docente', 1, '[{"added": {}}]', 13, 1),
	(13, '2023-01-18 06:00:25.698853', '5', '2 - como esta docente', 1, '[{"added": {}}]', 13, 1),
	(14, '2023-01-18 06:00:32.912821', '6', '3 - adios docente', 1, '[{"added": {}}]', 13, 1),
	(15, '2023-01-18 06:00:41.563466', '7', '1 - le cae bien el docente', 1, '[{"added": {}}]', 13, 1),
	(16, '2023-01-18 06:00:50.279862', '8', '2 - es un docente bueno?', 1, '[{"added": {}}]', 13, 1),
	(17, '2023-01-18 06:00:57.791838', '9', '3 - que opina del docente', 1, '[{"added": {}}]', 13, 1),
	(18, '2023-01-18 06:31:40.749704', '4', 'directivo1_', 1, '[{"added": {}}]', 4, 1),
	(19, '2023-01-18 06:32:56.471070', '4', ' ', 1, '[{"added": {}}]', 9, 1),
	(20, '2023-01-18 06:34:29.556994', '4', 'directivo1_', 2, '[{"changed": {"fields": ["First name", "Last name"]}}]', 4, 1),
	(21, '2023-01-18 06:34:30.602262', '4', 'alfonso monteros (directivo1_)', 2, '[]', 9, 1),
	(22, '2023-01-18 07:19:49.479932', '3', 'Pedro - <QuerySet [<Asignatura: Mate - Matematicas carrear>]>', 2, '[{"changed": {"fields": ["Directivo"]}}]', 10, 1),
	(23, '2023-01-18 07:39:56.388744', '3', 'Pedro - <QuerySet [<Asignatura: Mate - Matematicas carrear>]>', 1, '[{"added": {}}]', 10, 1),
	(24, '2023-01-18 07:40:04.188060', '4', 'alfonso monteros (directivo1_)', 2, '[{"changed": {"fields": ["Directivo - Docente"]}}]', 9, 1),
	(25, '2023-01-18 07:40:41.469061', '5', 'docente2_', 1, '[{"added": {}}]', 4, 1),
	(26, '2023-01-18 07:41:33.580060', '2', 'POO - Programacion', 1, '[{"added": {}}]', 7, 1),
	(27, '2023-01-18 07:41:49.502115', '5', ' - <QuerySet [<Asignatura: POO - Programacion>]>', 1, '[{"added": {}}]', 10, 1),
	(28, '2023-01-18 07:41:56.539029', '4', 'alfonso monteros (directivo1_)', 2, '[{"changed": {"fields": ["Directivo - Docente"]}}]', 9, 1),
	(29, '2023-01-18 07:42:11.590710', '5', 'docente2_', 2, '[{"changed": {"fields": ["First name", "Last name"]}}]', 4, 1),
	(30, '2023-01-18 07:42:14.336309', '5', 'Francis - <QuerySet [<Asignatura: POO - Programacion>]>', 2, '[]', 10, 1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;

-- Volcando estructura para tabla evaluacion.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.django_content_type: ~18 rows (aproximadamente)
DELETE FROM `django_content_type`;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'auth', 'user'),
	(5, 'contenttypes', 'contenttype'),
	(7, 'evaluacion', 'asignatura'),
	(18, 'evaluacion', 'configuracion'),
	(8, 'evaluacion', 'cuestionario'),
	(9, 'evaluacion', 'directivoasignaturadocente'),
	(10, 'evaluacion', 'docenteasignaturadocente'),
	(11, 'evaluacion', 'estudianteasignaturadocente'),
	(17, 'evaluacion', 'evaluacion'),
	(12, 'evaluacion', 'periodoacademico'),
	(16, 'evaluacion', 'periodoevaluacion'),
	(13, 'evaluacion', 'pregunta'),
	(15, 'evaluacion', 'respuesta'),
	(14, 'evaluacion', 'tabulacion'),
	(6, 'sessions', 'session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;

-- Volcando estructura para tabla evaluacion.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.django_migrations: ~19 rows (aproximadamente)
DELETE FROM `django_migrations`;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2023-01-18 05:43:26.996002'),
	(2, 'auth', '0001_initial', '2023-01-18 05:43:27.817249'),
	(3, 'admin', '0001_initial', '2023-01-18 05:43:27.983499'),
	(4, 'admin', '0002_logentry_remove_auto_add', '2023-01-18 05:43:27.991492'),
	(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-01-18 05:43:28.003827'),
	(6, 'contenttypes', '0002_remove_content_type_name', '2023-01-18 05:43:28.113674'),
	(7, 'auth', '0002_alter_permission_name_max_length', '2023-01-18 05:43:28.186710'),
	(8, 'auth', '0003_alter_user_email_max_length', '2023-01-18 05:43:28.254818'),
	(9, 'auth', '0004_alter_user_username_opts', '2023-01-18 05:43:28.261822'),
	(10, 'auth', '0005_alter_user_last_login_null', '2023-01-18 05:43:28.330336'),
	(11, 'auth', '0006_require_contenttypes_0002', '2023-01-18 05:43:28.334336'),
	(12, 'auth', '0007_alter_validators_add_error_messages', '2023-01-18 05:43:28.342474'),
	(13, 'auth', '0008_alter_user_username_max_length', '2023-01-18 05:43:28.383235'),
	(14, 'auth', '0009_alter_user_last_name_max_length', '2023-01-18 05:43:28.422833'),
	(15, 'auth', '0010_alter_group_name_max_length', '2023-01-18 05:43:28.491888'),
	(16, 'auth', '0011_update_proxy_permissions', '2023-01-18 05:43:28.498880'),
	(17, 'auth', '0012_alter_user_first_name_max_length', '2023-01-18 05:43:28.538857'),
	(18, 'evaluacion', '0001_initial', '2023-01-18 05:43:30.633596'),
	(19, 'sessions', '0001_initial', '2023-01-18 05:43:30.710780');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;

-- Volcando estructura para tabla evaluacion.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.django_session: ~4 rows (aproximadamente)
DELETE FROM `django_session`;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('586qekp6uegu3k37hv0o4fm4e5dbaw70', '.eJxVjE0OwiAYBe_C2pDyW3Dp3jOQxwdI1dCktCvj3bVJF7p9M_NeLGBba9h6XsKU2JlpdvrdIuiR2w7SHe02c5rbukyR7wo_aOfXOeXn5XD_Dip6_daSvCUtVDEgSw6pyEIqSyeyGx2AJGC9N9JoqDg6D2g72FKKEkOWlr0_-_A4OA:1pI5vY:VsaAzm96zPVaxyhCQE1q6PIwlrfdFs7_SQzIVLRY9Us', '2023-02-01 10:44:20.562954'),
	('6jhj685caf16cmxfc5ljnkjl4fs2tdq8', '.eJxVjEEOwiAQRe_C2pBhSgdw6d4zNFOGStVAUtqV8e7apAvd_vfef6mBtzUPW0vLMIs6q06dfreR4yOVHcidy63qWMu6zKPeFX3Qpq9V0vNyuH8HmVv-1mMvPQQIiU3naOosBucQxCZipgTB4-SiM_3kkcBz8AJI6IisEQio3h-9oTZl:1pI2eB:qqn0cJrMuCLBX04fuv4jQAd0i__GNdhZufTIR5b_47g', '2023-02-01 07:14:11.507237'),
	('dj6fk2trbqxsk95ihntfdcvxcs0hyptl', '.eJxVjDsOwyAQRO9CHSG-a5Myvc-AFliCkwgkY1dR7h5bcpGUM-_NvJnHbS1-67T4ObErk-zy2wWMT6oHSA-s98Zjq-syB34o_KSdTy3R63a6fwcFe9nXJooURzIiuBgGR0IiJlAmg1KKcgQLNiNopzNpA2AGhD1Zo-WotSP2-QLrZDdR:1pI3ji:r_HuxpCakWq5D5pbzmTEc0mf2AcQ2rPgHqeTH2GkQPw', '2023-02-01 08:23:58.765286'),
	('isrglr69im2oj6fb7lcv24kf6m6ydhf3', '.eJxVjDsOwyAQRO9CHSG-a5Myvc-AFliCkwgkY1dR7h5bcpGUM-_NvJnHbS1-67T4ObErk-zy2wWMT6oHSA-s98Zjq-syB34o_KSdTy3R63a6fwcFe9nXJooURzIiuBgGR0IiJlAmg1KKcgQLNiNopzNpA2AGhD1Zo-WotSP2-QLrZDdR:1pI1Fy:-CAu9ygP967FIVCmyTWx9_Ea3v_eBpFyDzd7meNX11o', '2023-02-01 05:45:06.731867');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;

-- Volcando estructura para tabla evaluacion.evaluacion_asignatura
CREATE TABLE IF NOT EXISTS `evaluacion_asignatura` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `carrera` varchar(100) NOT NULL,
  `semestre` varchar(10) NOT NULL,
  `paralelo` varchar(50) NOT NULL,
  `nombre` longtext NOT NULL,
  `duracion` double NOT NULL,
  `estadoAsignatura` tinyint(1) NOT NULL,
  `cuestionario_id` bigint(20) DEFAULT NULL,
  `periodoAcademico_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `evaluacion_asignatur_cuestionario_id_49dadd9d_fk_evaluacio` (`cuestionario_id`),
  KEY `evaluacion_asignatur_periodoAcademico_id_403a3ae8_fk_evaluacio` (`periodoAcademico_id`),
  CONSTRAINT `evaluacion_asignatur_cuestionario_id_49dadd9d_fk_evaluacio` FOREIGN KEY (`cuestionario_id`) REFERENCES `evaluacion_cuestionario` (`id`),
  CONSTRAINT `evaluacion_asignatur_periodoAcademico_id_403a3ae8_fk_evaluacio` FOREIGN KEY (`periodoAcademico_id`) REFERENCES `evaluacion_periodoacademico` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.evaluacion_asignatura: ~1 rows (aproximadamente)
DELETE FROM `evaluacion_asignatura`;
/*!40000 ALTER TABLE `evaluacion_asignatura` DISABLE KEYS */;
INSERT INTO `evaluacion_asignatura` (`id`, `carrera`, `semestre`, `paralelo`, `nombre`, `duracion`, `estadoAsignatura`, `cuestionario_id`, `periodoAcademico_id`) VALUES
	(1, 'Mate', '3', 'B', 'Matematicas carrear', 123, 1, 1, 1),
	(2, 'POO', '3', 'B', 'Programacion', 123, 1, 1, 1);
/*!40000 ALTER TABLE `evaluacion_asignatura` ENABLE KEYS */;

-- Volcando estructura para tabla evaluacion.evaluacion_configuracion
CREATE TABLE IF NOT EXISTS `evaluacion_configuracion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `periodoAcademicoActual_id` bigint(20) DEFAULT NULL,
  `periodoEvaluacionActual_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `periodoAcademicoActual_id` (`periodoAcademicoActual_id`),
  UNIQUE KEY `periodoEvaluacionActual_id` (`periodoEvaluacionActual_id`),
  CONSTRAINT `evaluacion_configura_periodoAcademicoActu_e6811e72_fk_evaluacio` FOREIGN KEY (`periodoAcademicoActual_id`) REFERENCES `evaluacion_periodoacademico` (`id`),
  CONSTRAINT `evaluacion_configura_periodoEvaluacionAct_cb58324e_fk_evaluacio` FOREIGN KEY (`periodoEvaluacionActual_id`) REFERENCES `evaluacion_periodoevaluacion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.evaluacion_configuracion: ~0 rows (aproximadamente)
DELETE FROM `evaluacion_configuracion`;
/*!40000 ALTER TABLE `evaluacion_configuracion` DISABLE KEYS */;
INSERT INTO `evaluacion_configuracion` (`id`, `periodoAcademicoActual_id`, `periodoEvaluacionActual_id`) VALUES
	(1, 1, 1);
/*!40000 ALTER TABLE `evaluacion_configuracion` ENABLE KEYS */;

-- Volcando estructura para tabla evaluacion.evaluacion_cuestionario
CREATE TABLE IF NOT EXISTS `evaluacion_cuestionario` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `encabezado` longtext NOT NULL,
  `fecha_inicio` datetime(6) NOT NULL,
  `fecha_fin` datetime(6) NOT NULL,
  `peso` int(11) NOT NULL,
  `tipoInformante` varchar(15) NOT NULL,
  `periodoEvaluacion_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `evaluacion_cuestiona_periodoEvaluacion_id_369b7ab2_fk_evaluacio` (`periodoEvaluacion_id`),
  CONSTRAINT `evaluacion_cuestiona_periodoEvaluacion_id_369b7ab2_fk_evaluacio` FOREIGN KEY (`periodoEvaluacion_id`) REFERENCES `evaluacion_periodoevaluacion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.evaluacion_cuestionario: ~3 rows (aproximadamente)
DELETE FROM `evaluacion_cuestionario`;
/*!40000 ALTER TABLE `evaluacion_cuestionario` DISABLE KEYS */;
INSERT INTO `evaluacion_cuestionario` (`id`, `nombre`, `titulo`, `encabezado`, `fecha_inicio`, `fecha_fin`, `peso`, `tipoInformante`, `periodoEvaluacion_id`) VALUES
	(1, 'Cuestionario Estudiante - Asignatura', 'Cuestionario 1', 'nigun encabezado', '2023-01-18 03:39:37.000000', '2023-02-01 03:39:37.000000', 1, 'academico', 1),
	(2, 'Cuestionario Autoevaluacion Docente', 'Autoevalucion de Docentes', 'Es el encabezado del cuestionario de docentes', '2023-01-18 05:54:45.000000', '2023-01-31 05:54:45.000000', 1, 'academico', 1),
	(3, 'Cuestionario Directivo Docente', 'Cuestionario a evualura docente por un directivo', 'Cuestionario a evualura docente por un directivo', '2023-01-18 05:55:25.000000', '2023-01-25 05:55:25.000000', 1, 'academico', 1);
/*!40000 ALTER TABLE `evaluacion_cuestionario` ENABLE KEYS */;

-- Volcando estructura para tabla evaluacion.evaluacion_directivoasignaturadocente
CREATE TABLE IF NOT EXISTS `evaluacion_directivoasignaturadocente` (
  `directivo_id` int(11) NOT NULL,
  `is_directivo` tinyint(1) NOT NULL,
  `cedula` varchar(10) NOT NULL,
  PRIMARY KEY (`directivo_id`),
  UNIQUE KEY `cedula` (`cedula`),
  CONSTRAINT `evaluacion_directivo_directivo_id_8db1d55d_fk_auth_user` FOREIGN KEY (`directivo_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.evaluacion_directivoasignaturadocente: ~0 rows (aproximadamente)
DELETE FROM `evaluacion_directivoasignaturadocente`;
/*!40000 ALTER TABLE `evaluacion_directivoasignaturadocente` DISABLE KEYS */;
INSERT INTO `evaluacion_directivoasignaturadocente` (`directivo_id`, `is_directivo`, `cedula`) VALUES
	(4, 1, '1108');
/*!40000 ALTER TABLE `evaluacion_directivoasignaturadocente` ENABLE KEYS */;

-- Volcando estructura para tabla evaluacion.evaluacion_directivoasignaturadocente_docente
CREATE TABLE IF NOT EXISTS `evaluacion_directivoasignaturadocente_docente` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `directivoasignaturadocente_id` int(11) NOT NULL,
  `docenteasignaturadocente_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `evaluacion_directivoasig_directivoasignaturadocen_420f88e3_uniq` (`directivoasignaturadocente_id`,`docenteasignaturadocente_id`),
  KEY `evaluacion_directivo_docenteasignaturadoc_4f16bdac_fk_evaluacio` (`docenteasignaturadocente_id`),
  CONSTRAINT `evaluacion_directivo_directivoasignaturad_91a7a6e8_fk_evaluacio` FOREIGN KEY (`directivoasignaturadocente_id`) REFERENCES `evaluacion_directivoasignaturadocente` (`directivo_id`),
  CONSTRAINT `evaluacion_directivo_docenteasignaturadoc_4f16bdac_fk_evaluacio` FOREIGN KEY (`docenteasignaturadocente_id`) REFERENCES `evaluacion_docenteasignaturadocente` (`docente_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.evaluacion_directivoasignaturadocente_docente: ~2 rows (aproximadamente)
DELETE FROM `evaluacion_directivoasignaturadocente_docente`;
/*!40000 ALTER TABLE `evaluacion_directivoasignaturadocente_docente` DISABLE KEYS */;
INSERT INTO `evaluacion_directivoasignaturadocente_docente` (`id`, `directivoasignaturadocente_id`, `docenteasignaturadocente_id`) VALUES
	(1, 4, 3),
	(2, 4, 5);
/*!40000 ALTER TABLE `evaluacion_directivoasignaturadocente_docente` ENABLE KEYS */;

-- Volcando estructura para tabla evaluacion.evaluacion_docenteasignaturadocente
CREATE TABLE IF NOT EXISTS `evaluacion_docenteasignaturadocente` (
  `docente_id` int(11) NOT NULL,
  `is_docente` tinyint(1) NOT NULL,
  `cedula` varchar(10) NOT NULL,
  PRIMARY KEY (`docente_id`),
  UNIQUE KEY `cedula` (`cedula`),
  CONSTRAINT `evaluacion_docenteas_docente_id_fefde24b_fk_auth_user` FOREIGN KEY (`docente_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.evaluacion_docenteasignaturadocente: ~2 rows (aproximadamente)
DELETE FROM `evaluacion_docenteasignaturadocente`;
/*!40000 ALTER TABLE `evaluacion_docenteasignaturadocente` DISABLE KEYS */;
INSERT INTO `evaluacion_docenteasignaturadocente` (`docente_id`, `is_docente`, `cedula`) VALUES
	(3, 1, '1107'),
	(5, 1, '1109');
/*!40000 ALTER TABLE `evaluacion_docenteasignaturadocente` ENABLE KEYS */;

-- Volcando estructura para tabla evaluacion.evaluacion_docenteasignaturadocente_asignaturas
CREATE TABLE IF NOT EXISTS `evaluacion_docenteasignaturadocente_asignaturas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `docenteasignaturadocente_id` int(11) NOT NULL,
  `asignatura_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `evaluacion_docenteasigna_docenteasignaturadocente_8fa30710_uniq` (`docenteasignaturadocente_id`,`asignatura_id`),
  KEY `evaluacion_docenteas_asignatura_id_cce3220f_fk_evaluacio` (`asignatura_id`),
  CONSTRAINT `evaluacion_docenteas_asignatura_id_cce3220f_fk_evaluacio` FOREIGN KEY (`asignatura_id`) REFERENCES `evaluacion_asignatura` (`id`),
  CONSTRAINT `evaluacion_docenteas_docenteasignaturadoc_ba2503fd_fk_evaluacio` FOREIGN KEY (`docenteasignaturadocente_id`) REFERENCES `evaluacion_docenteasignaturadocente` (`docente_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.evaluacion_docenteasignaturadocente_asignaturas: ~1 rows (aproximadamente)
DELETE FROM `evaluacion_docenteasignaturadocente_asignaturas`;
/*!40000 ALTER TABLE `evaluacion_docenteasignaturadocente_asignaturas` DISABLE KEYS */;
INSERT INTO `evaluacion_docenteasignaturadocente_asignaturas` (`id`, `docenteasignaturadocente_id`, `asignatura_id`) VALUES
	(1, 3, 1),
	(2, 5, 2);
/*!40000 ALTER TABLE `evaluacion_docenteasignaturadocente_asignaturas` ENABLE KEYS */;

-- Volcando estructura para tabla evaluacion.evaluacion_docenteasignaturadocente_cuestionarios
CREATE TABLE IF NOT EXISTS `evaluacion_docenteasignaturadocente_cuestionarios` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `docenteasignaturadocente_id` int(11) NOT NULL,
  `cuestionario_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `evaluacion_docenteasigna_docenteasignaturadocente_8d0298fc_uniq` (`docenteasignaturadocente_id`,`cuestionario_id`),
  KEY `evaluacion_docenteas_cuestionario_id_5ed110ba_fk_evaluacio` (`cuestionario_id`),
  CONSTRAINT `evaluacion_docenteas_cuestionario_id_5ed110ba_fk_evaluacio` FOREIGN KEY (`cuestionario_id`) REFERENCES `evaluacion_cuestionario` (`id`),
  CONSTRAINT `evaluacion_docenteas_docenteasignaturadoc_bfcb064f_fk_evaluacio` FOREIGN KEY (`docenteasignaturadocente_id`) REFERENCES `evaluacion_docenteasignaturadocente` (`docente_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.evaluacion_docenteasignaturadocente_cuestionarios: ~4 rows (aproximadamente)
DELETE FROM `evaluacion_docenteasignaturadocente_cuestionarios`;
/*!40000 ALTER TABLE `evaluacion_docenteasignaturadocente_cuestionarios` DISABLE KEYS */;
INSERT INTO `evaluacion_docenteasignaturadocente_cuestionarios` (`id`, `docenteasignaturadocente_id`, `cuestionario_id`) VALUES
	(1, 3, 2),
	(2, 3, 3),
	(3, 5, 2),
	(4, 5, 3);
/*!40000 ALTER TABLE `evaluacion_docenteasignaturadocente_cuestionarios` ENABLE KEYS */;

-- Volcando estructura para tabla evaluacion.evaluacion_estudianteasignaturadocente
CREATE TABLE IF NOT EXISTS `evaluacion_estudianteasignaturadocente` (
  `estudiante_id` int(11) NOT NULL,
  `cedula` varchar(10) NOT NULL,
  `is_estudiante` tinyint(1) NOT NULL,
  PRIMARY KEY (`estudiante_id`),
  UNIQUE KEY `cedula` (`cedula`),
  CONSTRAINT `evaluacion_estudiant_estudiante_id_37e5e8c8_fk_auth_user` FOREIGN KEY (`estudiante_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.evaluacion_estudianteasignaturadocente: ~0 rows (aproximadamente)
DELETE FROM `evaluacion_estudianteasignaturadocente`;
/*!40000 ALTER TABLE `evaluacion_estudianteasignaturadocente` DISABLE KEYS */;
INSERT INTO `evaluacion_estudianteasignaturadocente` (`estudiante_id`, `cedula`, `is_estudiante`) VALUES
	(2, '1106', 1);
/*!40000 ALTER TABLE `evaluacion_estudianteasignaturadocente` ENABLE KEYS */;

-- Volcando estructura para tabla evaluacion.evaluacion_estudianteasignaturadocente_asignaturaestudiante
CREATE TABLE IF NOT EXISTS `evaluacion_estudianteasignaturadocente_asignaturaestudiante` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `estudianteasignaturadocente_id` int(11) NOT NULL,
  `asignatura_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `evaluacion_estudianteasi_estudianteasignaturadoce_57d678c5_uniq` (`estudianteasignaturadocente_id`,`asignatura_id`),
  KEY `evaluacion_estudiant_asignatura_id_10c08a1a_fk_evaluacio` (`asignatura_id`),
  CONSTRAINT `evaluacion_estudiant_asignatura_id_10c08a1a_fk_evaluacio` FOREIGN KEY (`asignatura_id`) REFERENCES `evaluacion_asignatura` (`id`),
  CONSTRAINT `evaluacion_estudiant_estudianteasignatura_13813d72_fk_evaluacio` FOREIGN KEY (`estudianteasignaturadocente_id`) REFERENCES `evaluacion_estudianteasignaturadocente` (`estudiante_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.evaluacion_estudianteasignaturadocente_asignaturaestudiante: ~0 rows (aproximadamente)
DELETE FROM `evaluacion_estudianteasignaturadocente_asignaturaestudiante`;
/*!40000 ALTER TABLE `evaluacion_estudianteasignaturadocente_asignaturaestudiante` DISABLE KEYS */;
INSERT INTO `evaluacion_estudianteasignaturadocente_asignaturaestudiante` (`id`, `estudianteasignaturadocente_id`, `asignatura_id`) VALUES
	(1, 2, 1);
/*!40000 ALTER TABLE `evaluacion_estudianteasignaturadocente_asignaturaestudiante` ENABLE KEYS */;

-- Volcando estructura para tabla evaluacion.evaluacion_evaluacion
CREATE TABLE IF NOT EXISTS `evaluacion_evaluacion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `totalEvaluacion` int(11) DEFAULT NULL,
  `cuestionario_id` bigint(20) NOT NULL,
  `directivo_id` int(11) DEFAULT NULL,
  `docente_id` int(11) DEFAULT NULL,
  `estudiante_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `evaluacion_evaluacio_cuestionario_id_be37ca2d_fk_evaluacio` (`cuestionario_id`),
  KEY `evaluacion_evaluacio_directivo_id_9a4b8bda_fk_evaluacio` (`directivo_id`),
  KEY `evaluacion_evaluacio_docente_id_dbfc66a9_fk_evaluacio` (`docente_id`),
  KEY `evaluacion_evaluacio_estudiante_id_cc62728d_fk_evaluacio` (`estudiante_id`),
  CONSTRAINT `evaluacion_evaluacio_cuestionario_id_be37ca2d_fk_evaluacio` FOREIGN KEY (`cuestionario_id`) REFERENCES `evaluacion_cuestionario` (`id`),
  CONSTRAINT `evaluacion_evaluacio_directivo_id_9a4b8bda_fk_evaluacio` FOREIGN KEY (`directivo_id`) REFERENCES `evaluacion_docenteasignaturadocente` (`docente_id`),
  CONSTRAINT `evaluacion_evaluacio_docente_id_dbfc66a9_fk_evaluacio` FOREIGN KEY (`docente_id`) REFERENCES `evaluacion_directivoasignaturadocente` (`directivo_id`),
  CONSTRAINT `evaluacion_evaluacio_estudiante_id_cc62728d_fk_evaluacio` FOREIGN KEY (`estudiante_id`) REFERENCES `evaluacion_estudianteasignaturadocente` (`estudiante_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.evaluacion_evaluacion: ~0 rows (aproximadamente)
DELETE FROM `evaluacion_evaluacion`;
/*!40000 ALTER TABLE `evaluacion_evaluacion` DISABLE KEYS */;
INSERT INTO `evaluacion_evaluacion` (`id`, `totalEvaluacion`, `cuestionario_id`, `directivo_id`, `docente_id`, `estudiante_id`) VALUES
	(1, 12, 1, NULL, NULL, 2);
/*!40000 ALTER TABLE `evaluacion_evaluacion` ENABLE KEYS */;

-- Volcando estructura para tabla evaluacion.evaluacion_periodoacademico
CREATE TABLE IF NOT EXISTS `evaluacion_periodoacademico` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `periodo_lectivo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.evaluacion_periodoacademico: ~0 rows (aproximadamente)
DELETE FROM `evaluacion_periodoacademico`;
/*!40000 ALTER TABLE `evaluacion_periodoacademico` DISABLE KEYS */;
INSERT INTO `evaluacion_periodoacademico` (`id`, `nombre`, `fecha_inicio`, `fecha_fin`, `periodo_lectivo`) VALUES
	(1, 'Periodo 2023', '2023-01-17', '2023-01-31', '2023');
/*!40000 ALTER TABLE `evaluacion_periodoacademico` ENABLE KEYS */;

-- Volcando estructura para tabla evaluacion.evaluacion_periodoevaluacion
CREATE TABLE IF NOT EXISTS `evaluacion_periodoevaluacion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `titulo` varchar(300) NOT NULL,
  `descripcion` longtext DEFAULT NULL,
  `observaciones` longtext DEFAULT NULL,
  `fecha_autorizacion` datetime(6) NOT NULL,
  `fecha_aprobacion` datetime(6) NOT NULL,
  `fecha_inicio_publicacion` datetime(6) NOT NULL,
  `fecha_fin` datetime(6) NOT NULL,
  `periodoAcademico_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `evaluacion_periodoev_periodoAcademico_id_3e6dab97_fk_evaluacio` (`periodoAcademico_id`),
  CONSTRAINT `evaluacion_periodoev_periodoAcademico_id_3e6dab97_fk_evaluacio` FOREIGN KEY (`periodoAcademico_id`) REFERENCES `evaluacion_periodoacademico` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.evaluacion_periodoevaluacion: ~0 rows (aproximadamente)
DELETE FROM `evaluacion_periodoevaluacion`;
/*!40000 ALTER TABLE `evaluacion_periodoevaluacion` DISABLE KEYS */;
INSERT INTO `evaluacion_periodoevaluacion` (`id`, `nombre`, `titulo`, `descripcion`, `observaciones`, `fecha_autorizacion`, `fecha_aprobacion`, `fecha_inicio_publicacion`, `fecha_fin`, `periodoAcademico_id`) VALUES
	(1, 'Periodo Evaulacion 2023', 'evaluacion1', 'es una evaulacion', 'niguna', '2023-01-18 03:39:14.000000', '2023-01-18 03:39:15.000000', '2023-01-18 03:39:16.000000', '2023-02-01 03:39:17.000000', 1);
/*!40000 ALTER TABLE `evaluacion_periodoevaluacion` ENABLE KEYS */;

-- Volcando estructura para tabla evaluacion.evaluacion_pregunta
CREATE TABLE IF NOT EXISTS `evaluacion_pregunta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `texto` longtext NOT NULL,
  `orden` int(11) NOT NULL,
  `cuestionario_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `evaluacion_pregunta_cuestionario_id_6f0ded0a_fk_evaluacio` (`cuestionario_id`),
  CONSTRAINT `evaluacion_pregunta_cuestionario_id_6f0ded0a_fk_evaluacio` FOREIGN KEY (`cuestionario_id`) REFERENCES `evaluacion_cuestionario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.evaluacion_pregunta: ~9 rows (aproximadamente)
DELETE FROM `evaluacion_pregunta`;
/*!40000 ALTER TABLE `evaluacion_pregunta` DISABLE KEYS */;
INSERT INTO `evaluacion_pregunta` (`id`, `texto`, `orden`, `cuestionario_id`) VALUES
	(1, 'Como está', 1, 1),
	(2, 'que tal', 2, 1),
	(3, 'tercera pregunta', 3, 1),
	(4, 'que tal docente', 1, 2),
	(5, 'como esta docente', 2, 2),
	(6, 'adios docente', 3, 2),
	(7, 'le cae bien el docente', 1, 3),
	(8, 'es un docente bueno?', 2, 3),
	(9, 'que opina del docente', 3, 3);
/*!40000 ALTER TABLE `evaluacion_pregunta` ENABLE KEYS */;

-- Volcando estructura para tabla evaluacion.evaluacion_respuesta
CREATE TABLE IF NOT EXISTS `evaluacion_respuesta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `respuesta` varchar(15) NOT NULL,
  `pregunta_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `evaluacion_respuesta_pregunta_id_db7bed3b_fk_evaluacio` (`pregunta_id`),
  CONSTRAINT `evaluacion_respuesta_pregunta_id_db7bed3b_fk_evaluacio` FOREIGN KEY (`pregunta_id`) REFERENCES `evaluacion_pregunta` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.evaluacion_respuesta: ~0 rows (aproximadamente)
DELETE FROM `evaluacion_respuesta`;
/*!40000 ALTER TABLE `evaluacion_respuesta` DISABLE KEYS */;
INSERT INTO `evaluacion_respuesta` (`id`, `respuesta`, `pregunta_id`) VALUES
	(1, '3', 1),
	(2, '4', 2),
	(3, '5', 3);
/*!40000 ALTER TABLE `evaluacion_respuesta` ENABLE KEYS */;

-- Volcando estructura para tabla evaluacion.evaluacion_tabulacion
CREATE TABLE IF NOT EXISTS `evaluacion_tabulacion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `estTotal` int(11) NOT NULL,
  `doceTotal` int(11) NOT NULL,
  `dirTotal` int(11) NOT NULL,
  `total` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.evaluacion_tabulacion: ~0 rows (aproximadamente)
DELETE FROM `evaluacion_tabulacion`;
/*!40000 ALTER TABLE `evaluacion_tabulacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `evaluacion_tabulacion` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
