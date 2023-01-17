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
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.auth_permission: ~64 rows (aproximadamente)
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
	(53, 'Can add Periodo Evaluación', 14, 'add_periodoevaluacion'),
	(54, 'Can change Periodo Evaluación', 14, 'change_periodoevaluacion'),
	(55, 'Can delete Periodo Evaluación', 14, 'delete_periodoevaluacion'),
	(56, 'Can view Periodo Evaluación', 14, 'view_periodoevaluacion'),
	(57, 'Can add Evaluacion', 15, 'add_evaluacion'),
	(58, 'Can change Evaluacion', 15, 'change_evaluacion'),
	(59, 'Can delete Evaluacion', 15, 'delete_evaluacion'),
	(60, 'Can view Evaluacion', 15, 'view_evaluacion'),
	(61, 'Can add Configuracion', 16, 'add_configuracion'),
	(62, 'Can change Configuracion', 16, 'change_configuracion'),
	(63, 'Can delete Configuracion', 16, 'delete_configuracion'),
	(64, 'Can view Configuracion', 16, 'view_configuracion');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.auth_user: ~8 rows (aproximadamente)
DELETE FROM `auth_user`;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
	(1, 'pbkdf2_sha256$390000$2shzcQcTdaOnJeWuNiNtJZ$1fxtFXag3r99DE6zcWokaGthttVHC4Hwj/TZbIDBRoI=', '2023-01-17 00:38:29.502349', 1, 'allen', '', '', '', 1, 1, '2023-01-17 00:08:25.904453'),
	(2, 'pbkdf2_sha256$390000$hNnTLN6VN2oGtSwJH84asO$O8cphGR5/uDRSnr+HLHaIP07FpP2mjhpkBhuNlnI08w=', '2023-01-17 01:23:43.086366', 0, 'estudiante1_', '', '', '', 0, 1, '2023-01-17 00:09:51.683918'),
	(3, 'pbkdf2_sha256$390000$N2RHY5q4ZBBd8525QxVroI$obt8XNpqSOJox1TkQXY78DbNyLvKkra8n9o6EpUKb8M=', '2023-01-17 01:23:51.988561', 0, 'estudiante2_', '', '', '', 0, 1, '2023-01-17 00:12:27.309430'),
	(4, 'pbkdf2_sha256$390000$Li5iZb284SIrTwhKIhyhKa$OcItcPOicJ8XycbikKkqDXUz+q1nhDtLjRMFf+iCzmo=', NULL, 0, 'directivo1_', '', '', '', 0, 1, '2023-01-17 00:13:16.221380'),
	(5, 'pbkdf2_sha256$390000$6uYiLVGVWA6n1Flqi2yl4g$hj6ePiav127LPjxh5ygRaX7G+EgdNzm0bux0M50rgGM=', NULL, 0, 'docente1_', 'Luis', 'Sarmiento', '', 0, 1, '2023-01-17 00:13:23.000000'),
	(6, 'pbkdf2_sha256$390000$iCajhqNmpSQuqZA0f09I4s$usMqMwrqiG3FImrrxk495ZYuuPUucqo/Ij3edd6o9B8=', NULL, 0, 'directivo2_', '', '', '', 0, 1, '2023-01-17 00:42:30.292602'),
	(7, 'pbkdf2_sha256$390000$JMyTGhIvLTWU2v4yVOcEFY$gXUI+R2hT1j5ManwJ250tWfJQKLkA3DSuM86TxKWPL4=', NULL, 0, 'docente2_', 'Juan', 'Marco', '', 0, 1, '2023-01-17 00:43:44.000000'),
	(8, 'pbkdf2_sha256$390000$uDeK0B46TRvdcXfZkeb9Dl$lH2dAZHi9Fpj0lIxFrCgidkXlf4YhlCMKwsQ1r9rEJM=', NULL, 0, 'docente3_', 'Fernadno', 'Valdivieso', '', 0, 1, '2023-01-17 01:00:25.000000');
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.django_admin_log: ~29 rows (aproximadamente)
DELETE FROM `django_admin_log`;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
	(1, '2023-01-17 00:09:51.795910', '2', 'estudiante1_', 1, '[{"added": {}}]', 4, 1),
	(2, '2023-01-17 00:10:26.790315', '1', 'Periodo 2022', 1, '[{"added": {}}]', 12, 1),
	(3, '2023-01-17 00:11:34.097398', '1', 'Periodo 2023', 1, '[{"added": {}}]', 14, 1),
	(4, '2023-01-17 00:11:37.226364', '1', 'Cuestionario 1', 1, '[{"added": {}}]', 8, 1),
	(5, '2023-01-17 00:11:41.780976', '1', 'Mate - carrera de mate', 1, '[{"added": {}}]', 7, 1),
	(6, '2023-01-17 00:12:04.347447', '2', 'POO - Porgramcion de objetos', 1, '[{"added": {}}]', 7, 1),
	(7, '2023-01-17 00:12:08.492405', '2', ' - <QuerySet [<Asignatura: Mate - carrera de mate>, <Asignatura: POO - Porgramcion de objetos>]>', 1, '[{"added": {}}]', 11, 1),
	(8, '2023-01-17 00:12:27.420111', '3', 'estudiante2_', 1, '[{"added": {}}]', 4, 1),
	(9, '2023-01-17 00:12:56.771752', '3', ' - <QuerySet [<Asignatura: POO - Porgramcion de objetos>]>', 1, '[{"added": {}}]', 11, 1),
	(10, '2023-01-17 00:13:16.331377', '4', 'directivo1_', 1, '[{"added": {}}]', 4, 1),
	(11, '2023-01-17 00:13:23.977738', '5', 'docente1_', 1, '[{"added": {}}]', 4, 1),
	(12, '2023-01-17 00:13:38.592094', '4', ' - <QuerySet [<User: docente1_>]>', 1, '[{"added": {}}]', 9, 1),
	(13, '2023-01-17 00:13:51.127928', '5', ' - <QuerySet [<Asignatura: Mate - carrera de mate>, <Asignatura: POO - Porgramcion de objetos>]>', 1, '[{"added": {}}]', 10, 1),
	(14, '2023-01-17 00:14:02.339390', '1', 'Configuraciones de la Aplicación', 1, '[{"added": {}}]', 16, 1),
	(15, '2023-01-17 00:14:40.504786', '1', '1 - Pregunta nro 1 que piensa', 1, '[{"added": {}}]', 13, 1),
	(16, '2023-01-17 00:14:50.752440', '2', '2 - pregunta 2 que mal esta', 1, '[{"added": {}}]', 13, 1),
	(17, '2023-01-17 00:14:58.854173', '3', '3 - pregunta 3 que pex que pex', 1, '[{"added": {}}]', 13, 1),
	(18, '2023-01-17 00:38:38.634126', '5', 'docente1_', 2, '[{"changed": {"fields": ["First name", "Last name"]}}]', 4, 1),
	(19, '2023-01-17 00:42:30.403607', '6', 'directivo2_', 1, '[{"added": {}}]', 4, 1),
	(20, '2023-01-17 00:42:32.741175', '6', ' - <QuerySet [<Asignatura: Mate - carrera de mate>]>', 1, '[{"added": {}}]', 11, 1),
	(21, '2023-01-17 00:43:44.543041', '7', 'docente2_', 1, '[{"added": {}}]', 4, 1),
	(22, '2023-01-17 00:43:59.360052', '6', ' - <QuerySet [<Asignatura: Mate - carrera de mate>]>', 3, '', 11, 1),
	(23, '2023-01-17 00:44:16.644933', '7', ' - <QuerySet [<Asignatura: Mate - carrera de mate>]>', 1, '[{"added": {}}]', 10, 1),
	(24, '2023-01-17 00:44:31.508279', '7', 'docente2_', 2, '[{"changed": {"fields": ["First name", "Last name"]}}]', 4, 1),
	(25, '2023-01-17 01:00:25.410648', '8', 'docente3_', 1, '[{"added": {}}]', 4, 1),
	(26, '2023-01-17 01:00:30.302212', '8', ' - <QuerySet [<Asignatura: POO - Porgramcion de objetos>]>', 1, '[{"added": {}}]', 10, 1),
	(27, '2023-01-17 01:00:51.728318', '8', 'docente3_', 2, '[{"changed": {"fields": ["First name", "Last name"]}}]', 4, 1),
	(28, '2023-01-17 01:00:53.625305', '8', 'Fernadno - <QuerySet [<Asignatura: POO - Porgramcion de objetos>]>', 2, '[]', 10, 1),
	(29, '2023-01-17 01:01:48.308426', '3', 'Ciencias - ciencuias naturales', 1, '[{"added": {}}]', 7, 1),
	(30, '2023-01-17 01:01:57.553444', '8', 'Fernadno - <QuerySet [<Asignatura: POO - Porgramcion de objetos>, <Asignatura: Ciencias - ciencuias naturales>]>', 2, '[{"changed": {"fields": ["Autoevaluacion - Docente"]}}]', 10, 1),
	(31, '2023-01-17 01:02:18.909754', '3', ' - <QuerySet [<Asignatura: POO - Porgramcion de objetos>, <Asignatura: Ciencias - ciencuias naturales>]>', 2, '[{"changed": {"fields": ["Estudiante - Docente"]}}]', 11, 1),
	(32, '2023-01-17 01:36:46.676324', '8', 'Fernadno - <QuerySet [<Asignatura: Ciencias - ciencuias naturales>]>', 2, '[{"changed": {"fields": ["Autoevaluacion - Docente"]}}]', 10, 1),
	(33, '2023-01-17 01:37:01.393752', '5', 'Luis - <QuerySet [<Asignatura: POO - Porgramcion de objetos>]>', 2, '[{"changed": {"fields": ["Autoevaluacion - Docente"]}}]', 10, 1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;

-- Volcando estructura para tabla evaluacion.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.django_content_type: ~16 rows (aproximadamente)
DELETE FROM `django_content_type`;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'auth', 'user'),
	(5, 'contenttypes', 'contenttype'),
	(7, 'evaluacion', 'asignatura'),
	(16, 'evaluacion', 'configuracion'),
	(8, 'evaluacion', 'cuestionario'),
	(9, 'evaluacion', 'directivoasignaturadocente'),
	(10, 'evaluacion', 'docenteasignaturadocente'),
	(11, 'evaluacion', 'estudianteasignaturadocente'),
	(15, 'evaluacion', 'evaluacion'),
	(12, 'evaluacion', 'periodoacademico'),
	(14, 'evaluacion', 'periodoevaluacion'),
	(13, 'evaluacion', 'pregunta'),
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
	(1, 'contenttypes', '0001_initial', '2023-01-17 00:07:49.855370'),
	(2, 'auth', '0001_initial', '2023-01-17 00:07:50.712790'),
	(3, 'admin', '0001_initial', '2023-01-17 00:07:50.873899'),
	(4, 'admin', '0002_logentry_remove_auto_add', '2023-01-17 00:07:50.881899'),
	(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-01-17 00:07:50.888902'),
	(6, 'contenttypes', '0002_remove_content_type_name', '2023-01-17 00:07:50.990946'),
	(7, 'auth', '0002_alter_permission_name_max_length', '2023-01-17 00:07:51.062700'),
	(8, 'auth', '0003_alter_user_email_max_length', '2023-01-17 00:07:51.132234'),
	(9, 'auth', '0004_alter_user_username_opts', '2023-01-17 00:07:51.138239'),
	(10, 'auth', '0005_alter_user_last_login_null', '2023-01-17 00:07:51.204417'),
	(11, 'auth', '0006_require_contenttypes_0002', '2023-01-17 00:07:51.209418'),
	(12, 'auth', '0007_alter_validators_add_error_messages', '2023-01-17 00:07:51.217418'),
	(13, 'auth', '0008_alter_user_username_max_length', '2023-01-17 00:07:51.256417'),
	(14, 'auth', '0009_alter_user_last_name_max_length', '2023-01-17 00:07:51.295461'),
	(15, 'auth', '0010_alter_group_name_max_length', '2023-01-17 00:07:51.363374'),
	(16, 'auth', '0011_update_proxy_permissions', '2023-01-17 00:07:51.371390'),
	(17, 'auth', '0012_alter_user_first_name_max_length', '2023-01-17 00:07:51.409831'),
	(18, 'evaluacion', '0001_initial', '2023-01-17 00:07:53.849180'),
	(19, 'sessions', '0001_initial', '2023-01-17 00:07:53.975111');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;

-- Volcando estructura para tabla evaluacion.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.django_session: ~2 rows (aproximadamente)
DELETE FROM `django_session`;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('l8vjb890t1evsovcx9q73zdyrco5yxje', '.eJxVjMsOwiAQAP-FsyGAvPTovd_QLLuLVA0kpT0Z_92Q9KDXmcm8xQz7Vua98zovJK7iLE6_LAE-uQ5BD6j3JrHVbV2SHIk8bJdTI37djvZvUKCXsU2oLEQfrcoGjdOUlQZii4TeRR0MRg1smQMgmxRzVnChwFp7l3wQny_1ETiH:1pHahb:OmbB5x9bpVti34NwGnFEBagnt1mm9YIHRrECzreeB7g', '2023-01-31 01:23:51.991563'),
	('syv5gpd0aeknau1yxo8ppm307c5sucw6', '.eJxVjEEOwiAQRe_C2pACQ6e4dO8ZyAAzUjVtUtqV8e7apAvd_vfef6lI21rj1niJY1FnZdTpd0uUHzztoNxpus06z9O6jEnvij5o09e58PNyuH8HlVr91qHD4E3qAxFkCwM67jsGEAkA1mTE5MTxAOgRBEtAIbEChOI8W1TvD8R_N2s:1pHZzh:Pua77aUcTTNCOThSQeByguPwKVLc2xzuRF_uVWBAOZQ', '2023-01-31 00:38:29.507355');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.evaluacion_asignatura: ~2 rows (aproximadamente)
DELETE FROM `evaluacion_asignatura`;
/*!40000 ALTER TABLE `evaluacion_asignatura` DISABLE KEYS */;
INSERT INTO `evaluacion_asignatura` (`id`, `carrera`, `semestre`, `paralelo`, `nombre`, `duracion`, `estadoAsignatura`, `cuestionario_id`, `periodoAcademico_id`) VALUES
	(1, 'Mate', '3', 'a', 'carrera de mate', 134, 1, 1, 1),
	(2, 'POO', '1', 'A', 'Porgramcion de objetos', 120, 1, 1, 1),
	(3, 'Ciencias', '8', 'A', 'ciencuias naturales', 123, 1, 1, 1);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.evaluacion_cuestionario: ~0 rows (aproximadamente)
DELETE FROM `evaluacion_cuestionario`;
/*!40000 ALTER TABLE `evaluacion_cuestionario` DISABLE KEYS */;
INSERT INTO `evaluacion_cuestionario` (`id`, `nombre`, `titulo`, `encabezado`, `fecha_inicio`, `fecha_fin`, `peso`, `tipoInformante`, `periodoEvaluacion_id`) VALUES
	(1, 'Cuestionario 1', 'Cuestionario de preguntas 1', 'es un cuestionario', '2023-01-17 00:10:47.000000', '2023-01-25 00:10:52.000000', 1, 'academico', 1);
/*!40000 ALTER TABLE `evaluacion_cuestionario` ENABLE KEYS */;

-- Volcando estructura para tabla evaluacion.evaluacion_directivoasignaturadocente
CREATE TABLE IF NOT EXISTS `evaluacion_directivoasignaturadocente` (
  `directivo_id` int(11) NOT NULL,
  `is_directivo` tinyint(1) NOT NULL,
  PRIMARY KEY (`directivo_id`),
  CONSTRAINT `evaluacion_directivo_directivo_id_8db1d55d_fk_auth_user` FOREIGN KEY (`directivo_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.evaluacion_directivoasignaturadocente: ~0 rows (aproximadamente)
DELETE FROM `evaluacion_directivoasignaturadocente`;
/*!40000 ALTER TABLE `evaluacion_directivoasignaturadocente` DISABLE KEYS */;
INSERT INTO `evaluacion_directivoasignaturadocente` (`directivo_id`, `is_directivo`) VALUES
	(4, 1);
/*!40000 ALTER TABLE `evaluacion_directivoasignaturadocente` ENABLE KEYS */;

-- Volcando estructura para tabla evaluacion.evaluacion_directivoasignaturadocente_docente
CREATE TABLE IF NOT EXISTS `evaluacion_directivoasignaturadocente_docente` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `directivoasignaturadocente_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `evaluacion_directivoasig_directivoasignaturadocen_3a03cadc_uniq` (`directivoasignaturadocente_id`,`user_id`),
  KEY `evaluacion_directivo_user_id_fcf60e95_fk_auth_user` (`user_id`),
  CONSTRAINT `evaluacion_directivo_directivoasignaturad_91a7a6e8_fk_evaluacio` FOREIGN KEY (`directivoasignaturadocente_id`) REFERENCES `evaluacion_directivoasignaturadocente` (`directivo_id`),
  CONSTRAINT `evaluacion_directivo_user_id_fcf60e95_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.evaluacion_directivoasignaturadocente_docente: ~0 rows (aproximadamente)
DELETE FROM `evaluacion_directivoasignaturadocente_docente`;
/*!40000 ALTER TABLE `evaluacion_directivoasignaturadocente_docente` DISABLE KEYS */;
INSERT INTO `evaluacion_directivoasignaturadocente_docente` (`id`, `directivoasignaturadocente_id`, `user_id`) VALUES
	(1, 4, 5);
/*!40000 ALTER TABLE `evaluacion_directivoasignaturadocente_docente` ENABLE KEYS */;

-- Volcando estructura para tabla evaluacion.evaluacion_docenteasignaturadocente
CREATE TABLE IF NOT EXISTS `evaluacion_docenteasignaturadocente` (
  `docente_id` int(11) NOT NULL,
  `is_docente` tinyint(1) NOT NULL,
  PRIMARY KEY (`docente_id`),
  CONSTRAINT `evaluacion_docenteas_docente_id_fefde24b_fk_auth_user` FOREIGN KEY (`docente_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.evaluacion_docenteasignaturadocente: ~2 rows (aproximadamente)
DELETE FROM `evaluacion_docenteasignaturadocente`;
/*!40000 ALTER TABLE `evaluacion_docenteasignaturadocente` DISABLE KEYS */;
INSERT INTO `evaluacion_docenteasignaturadocente` (`docente_id`, `is_docente`) VALUES
	(5, 1),
	(7, 1),
	(8, 1);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.evaluacion_docenteasignaturadocente_asignaturas: ~4 rows (aproximadamente)
DELETE FROM `evaluacion_docenteasignaturadocente_asignaturas`;
/*!40000 ALTER TABLE `evaluacion_docenteasignaturadocente_asignaturas` DISABLE KEYS */;
INSERT INTO `evaluacion_docenteasignaturadocente_asignaturas` (`id`, `docenteasignaturadocente_id`, `asignatura_id`) VALUES
	(2, 5, 2),
	(3, 7, 1),
	(5, 8, 3);
/*!40000 ALTER TABLE `evaluacion_docenteasignaturadocente_asignaturas` ENABLE KEYS */;

-- Volcando estructura para tabla evaluacion.evaluacion_estudianteasignaturadocente
CREATE TABLE IF NOT EXISTS `evaluacion_estudianteasignaturadocente` (
  `estudiante_id` int(11) NOT NULL,
  `is_estudiante` tinyint(1) NOT NULL,
  PRIMARY KEY (`estudiante_id`),
  CONSTRAINT `evaluacion_estudiant_estudiante_id_37e5e8c8_fk_auth_user` FOREIGN KEY (`estudiante_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.evaluacion_estudianteasignaturadocente: ~2 rows (aproximadamente)
DELETE FROM `evaluacion_estudianteasignaturadocente`;
/*!40000 ALTER TABLE `evaluacion_estudianteasignaturadocente` DISABLE KEYS */;
INSERT INTO `evaluacion_estudianteasignaturadocente` (`estudiante_id`, `is_estudiante`) VALUES
	(2, 1),
	(3, 1);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.evaluacion_estudianteasignaturadocente_asignaturaestudiante: ~4 rows (aproximadamente)
DELETE FROM `evaluacion_estudianteasignaturadocente_asignaturaestudiante`;
/*!40000 ALTER TABLE `evaluacion_estudianteasignaturadocente_asignaturaestudiante` DISABLE KEYS */;
INSERT INTO `evaluacion_estudianteasignaturadocente_asignaturaestudiante` (`id`, `estudianteasignaturadocente_id`, `asignatura_id`) VALUES
	(1, 2, 1),
	(2, 2, 2),
	(3, 3, 2),
	(5, 3, 3);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.evaluacion_evaluacion: ~0 rows (aproximadamente)
DELETE FROM `evaluacion_evaluacion`;
/*!40000 ALTER TABLE `evaluacion_evaluacion` DISABLE KEYS */;
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
	(1, 'Periodo 2022', '2023-01-03', '2023-01-31', '2023');
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
	(1, 'Periodo 2023', 'periodo de evaluacion 2023', 'es una periodo de evaluacion', '', '2023-01-17 00:11:26.000000', '2023-01-17 00:11:27.000000', '2023-01-17 00:11:29.000000', '2023-01-25 00:11:32.000000', 1);
/*!40000 ALTER TABLE `evaluacion_periodoevaluacion` ENABLE KEYS */;

-- Volcando estructura para tabla evaluacion.evaluacion_pregunta
CREATE TABLE IF NOT EXISTS `evaluacion_pregunta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `texto` longtext NOT NULL,
  `orden` int(11) NOT NULL,
  `respuesta` varchar(15) NOT NULL,
  `cuestionario_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `evaluacion_pregunta_cuestionario_id_6f0ded0a_fk_evaluacio` (`cuestionario_id`),
  CONSTRAINT `evaluacion_pregunta_cuestionario_id_6f0ded0a_fk_evaluacio` FOREIGN KEY (`cuestionario_id`) REFERENCES `evaluacion_cuestionario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.evaluacion_pregunta: ~2 rows (aproximadamente)
DELETE FROM `evaluacion_pregunta`;
/*!40000 ALTER TABLE `evaluacion_pregunta` DISABLE KEYS */;
INSERT INTO `evaluacion_pregunta` (`id`, `texto`, `orden`, `respuesta`, `cuestionario_id`) VALUES
	(1, 'Pregunta nro 1 que piensa', 1, '0', 1),
	(2, 'pregunta 2 que mal esta', 2, '0', 1),
	(3, 'pregunta 3 que pex que pex', 3, '0', 1);
/*!40000 ALTER TABLE `evaluacion_pregunta` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
