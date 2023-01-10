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
	(13, 'Can add content type', 4, 'add_contenttype'),
	(14, 'Can change content type', 4, 'change_contenttype'),
	(15, 'Can delete content type', 4, 'delete_contenttype'),
	(16, 'Can view content type', 4, 'view_contenttype'),
	(17, 'Can add session', 5, 'add_session'),
	(18, 'Can change session', 5, 'change_session'),
	(19, 'Can delete session', 5, 'delete_session'),
	(20, 'Can view session', 5, 'view_session'),
	(21, 'Can add user', 6, 'add_user'),
	(22, 'Can change user', 6, 'change_user'),
	(23, 'Can delete user', 6, 'delete_user'),
	(24, 'Can view user', 6, 'view_user'),
	(25, 'Can add Cuestionario', 7, 'add_cuestionario'),
	(26, 'Can change Cuestionario', 7, 'change_cuestionario'),
	(27, 'Can delete Cuestionario', 7, 'delete_cuestionario'),
	(28, 'Can view Cuestionario', 7, 'view_cuestionario'),
	(29, 'Can add Periodo Académico', 8, 'add_periodoacademico'),
	(30, 'Can change Periodo Académico', 8, 'change_periodoacademico'),
	(31, 'Can delete Periodo Académico', 8, 'delete_periodoacademico'),
	(32, 'Can view Periodo Académico', 8, 'view_periodoacademico'),
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
	(45, 'Can add Pregunta', 12, 'add_pregunta'),
	(46, 'Can change Pregunta', 12, 'change_pregunta'),
	(47, 'Can delete Pregunta', 12, 'delete_pregunta'),
	(48, 'Can view Pregunta', 12, 'view_pregunta'),
	(49, 'Can add Periodo Evaluación', 13, 'add_periodoevaluacion'),
	(50, 'Can change Periodo Evaluación', 13, 'change_periodoevaluacion'),
	(51, 'Can delete Periodo Evaluación', 13, 'delete_periodoevaluacion'),
	(52, 'Can view Periodo Evaluación', 13, 'view_periodoevaluacion'),
	(53, 'Can add Configuracion', 14, 'add_configuracion'),
	(54, 'Can change Configuracion', 14, 'change_configuracion'),
	(55, 'Can delete Configuracion', 14, 'delete_configuracion'),
	(56, 'Can view Configuracion', 14, 'view_configuracion'),
	(57, 'Can add asignatura', 15, 'add_asignatura'),
	(58, 'Can change asignatura', 15, 'change_asignatura'),
	(59, 'Can delete asignatura', 15, 'delete_asignatura'),
	(60, 'Can view asignatura', 15, 'view_asignatura'),
	(61, 'Can add Evaluacion', 16, 'add_evaluacion'),
	(62, 'Can change Evaluacion', 16, 'change_evaluacion'),
	(63, 'Can delete Evaluacion', 16, 'delete_evaluacion'),
	(64, 'Can view Evaluacion', 16, 'view_evaluacion');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;

-- Volcando estructura para tabla evaluacion.django_admin_log
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_evaluacion_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_evaluacion_user_id` FOREIGN KEY (`user_id`) REFERENCES `evaluacion_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.django_admin_log: ~21 rows (aproximadamente)
DELETE FROM `django_admin_log`;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
	(2, '2023-01-10 14:35:35.840321', '8', 'eee', 1, '[{"added": {}}]', 6, 7),
	(3, '2023-01-10 14:37:04.366194', '8', 'eee', 3, '', 6, 7),
	(4, '2023-01-10 14:37:22.395509', '9', 'eee', 1, '[{"added": {}}]', 6, 7),
	(5, '2023-01-10 14:41:20.660692', '10', 'luis', 3, '', 6, 7),
	(6, '2023-01-10 14:41:20.662829', '9', 'eee', 3, '', 6, 7),
	(7, '2023-01-10 14:41:38.577312', '11', 'user1_', 1, '[{"added": {}}]', 6, 7),
	(8, '2023-01-10 14:49:08.046164', '1', 'Periodo 2022', 1, '[{"added": {}}]', 8, 7),
	(9, '2023-01-10 14:49:09.474040', '1', 'Periodo 2022', 1, '[{"added": {}}]', 13, 7),
	(10, '2023-01-10 14:49:12.156234', '1', 'Cuestionario 1', 1, '[{"added": {}}]', 7, 7),
	(11, '2023-01-10 14:49:29.821456', '1', '1 - Pregunta1', 1, '[{"added": {}}]', 12, 7),
	(12, '2023-01-10 14:49:40.420292', '2', '2 - Pregunta', 1, '[{"added": {}}]', 12, 7),
	(13, '2023-01-10 14:49:48.609230', '3', '3 - Pregunta', 1, '[{"added": {}}]', 12, 7),
	(14, '2023-01-10 14:49:53.725715', '4', '4 - Pregunta', 1, '[{"added": {}}]', 12, 7),
	(15, '2023-01-10 14:50:17.714799', '1', 'Mate - Matematica', 1, '[{"added": {}}]', 15, 7),
	(16, '2023-01-10 14:50:37.255324', '2', 'POO - PROGRAMACION DE OBJETOS', 1, '[{"added": {}}]', 15, 7),
	(17, '2023-01-10 14:51:00.285964', '11', 'estudiante1', 2, '[{"changed": {"fields": ["Username"]}}]', 6, 7),
	(18, '2023-01-10 14:51:19.828339', '12', 'estudiante2', 1, '[{"added": {}}]', 6, 7),
	(19, '2023-01-10 14:51:44.306895', '11', 'Luis - <QuerySet [<Asignatura: Mate - Matematica>, <Asignatura: POO - PROGRAMACION DE OBJETOS>]>', 1, '[{"added": {}}]', 11, 7),
	(20, '2023-01-10 14:51:49.385510', '12', 'Luis222 - <QuerySet [<Asignatura: POO - PROGRAMACION DE OBJETOS>]>', 1, '[{"added": {}}]', 11, 7),
	(21, '2023-01-10 14:53:15.264257', '13', 'docente1', 1, '[{"added": {}}]', 6, 7),
	(22, '2023-01-10 14:53:45.655111', '13', 'DOCENTE LUIS - <QuerySet [<Asignatura: Mate - Matematica>, <Asignatura: POO - PROGRAMACION DE OBJETOS>]>', 1, '[{"added": {}}]', 10, 7),
	(23, '2023-01-10 15:06:43.823859', '11', 'estudiante1', 2, '[{"changed": {"fields": ["Password"]}}]', 6, 7),
	(24, '2023-01-10 16:32:45.146322', '2', '2 - Pregunta 2', 2, '[{"changed": {"fields": ["Texto"]}}]', 12, 7),
	(25, '2023-01-10 16:32:49.486087', '3', '3 - Pregunta 3', 2, '[{"changed": {"fields": ["Texto"]}}]', 12, 7),
	(26, '2023-01-10 16:32:52.048123', '4', '4 - Pregunta 4', 2, '[{"changed": {"fields": ["Texto"]}}]', 12, 7),
	(27, '2023-01-10 17:14:13.305179', '1', 'Configuraciones de la Aplicación', 1, '[{"added": {}}]', 14, 7);
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
	(4, 'contenttypes', 'contenttype'),
	(15, 'evaluacion', 'asignatura'),
	(14, 'evaluacion', 'configuracion'),
	(7, 'evaluacion', 'cuestionario'),
	(9, 'evaluacion', 'directivoasignaturadocente'),
	(10, 'evaluacion', 'docenteasignaturadocente'),
	(11, 'evaluacion', 'estudianteasignaturadocente'),
	(16, 'evaluacion', 'evaluacion'),
	(8, 'evaluacion', 'periodoacademico'),
	(13, 'evaluacion', 'periodoevaluacion'),
	(12, 'evaluacion', 'pregunta'),
	(6, 'evaluacion', 'user'),
	(5, 'sessions', 'session');
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
	(1, 'contenttypes', '0001_initial', '2023-01-10 13:57:27.358430'),
	(2, 'contenttypes', '0002_remove_content_type_name', '2023-01-10 13:57:27.455619'),
	(3, 'auth', '0001_initial', '2023-01-10 13:57:27.870900'),
	(4, 'auth', '0002_alter_permission_name_max_length', '2023-01-10 13:57:27.944198'),
	(5, 'auth', '0003_alter_user_email_max_length', '2023-01-10 13:57:27.950192'),
	(6, 'auth', '0004_alter_user_username_opts', '2023-01-10 13:57:27.956109'),
	(7, 'auth', '0005_alter_user_last_login_null', '2023-01-10 13:57:27.962109'),
	(8, 'auth', '0006_require_contenttypes_0002', '2023-01-10 13:57:27.966109'),
	(9, 'auth', '0007_alter_validators_add_error_messages', '2023-01-10 13:57:27.972109'),
	(10, 'auth', '0008_alter_user_username_max_length', '2023-01-10 13:57:27.978109'),
	(11, 'auth', '0009_alter_user_last_name_max_length', '2023-01-10 13:57:27.983282'),
	(12, 'auth', '0010_alter_group_name_max_length', '2023-01-10 13:57:28.051385'),
	(13, 'auth', '0011_update_proxy_permissions', '2023-01-10 13:57:28.058266'),
	(14, 'auth', '0012_alter_user_first_name_max_length', '2023-01-10 13:57:28.064460'),
	(15, 'evaluacion', '0001_initial', '2023-01-10 13:57:30.654033'),
	(16, 'admin', '0001_initial', '2023-01-10 13:57:30.835998'),
	(17, 'admin', '0002_logentry_remove_auto_add', '2023-01-10 13:57:30.847895'),
	(18, 'admin', '0003_logentry_add_action_flag_choices', '2023-01-10 13:57:30.857938'),
	(19, 'sessions', '0001_initial', '2023-01-10 13:57:30.936628');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;

-- Volcando estructura para tabla evaluacion.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.django_session: ~1 rows (aproximadamente)
DELETE FROM `django_session`;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
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

-- Volcando datos para la tabla evaluacion.evaluacion_asignatura: ~2 rows (aproximadamente)
DELETE FROM `evaluacion_asignatura`;
/*!40000 ALTER TABLE `evaluacion_asignatura` DISABLE KEYS */;
INSERT INTO `evaluacion_asignatura` (`id`, `carrera`, `semestre`, `paralelo`, `nombre`, `duracion`, `estadoAsignatura`, `cuestionario_id`, `periodoAcademico_id`) VALUES
	(1, 'Mate', '1', 'A', 'Matematica', 12, 1, 1, 1),
	(2, 'POO', '3', 'B', 'PROGRAMACION DE OBJETOS', 134, 1, 1, 1);
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

-- Volcando datos para la tabla evaluacion.evaluacion_cuestionario: ~1 rows (aproximadamente)
DELETE FROM `evaluacion_cuestionario`;
/*!40000 ALTER TABLE `evaluacion_cuestionario` DISABLE KEYS */;
INSERT INTO `evaluacion_cuestionario` (`id`, `nombre`, `titulo`, `encabezado`, `fecha_inicio`, `fecha_fin`, `peso`, `tipoInformante`, `periodoEvaluacion_id`) VALUES
	(1, 'Cuestionario 1', 'Cuestionario 1', 'Cuestionario 1', '2023-01-10 14:48:34.000000', '2023-01-10 14:48:35.000000', 1, 'academico', 1);
/*!40000 ALTER TABLE `evaluacion_cuestionario` ENABLE KEYS */;

-- Volcando estructura para tabla evaluacion.evaluacion_directivoasignaturadocente
CREATE TABLE IF NOT EXISTS `evaluacion_directivoasignaturadocente` (
  `directivo_id` bigint(20) NOT NULL,
  PRIMARY KEY (`directivo_id`),
  CONSTRAINT `evaluacion_directivo_directivo_id_8db1d55d_fk_evaluacio` FOREIGN KEY (`directivo_id`) REFERENCES `evaluacion_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.evaluacion_directivoasignaturadocente: ~0 rows (aproximadamente)
DELETE FROM `evaluacion_directivoasignaturadocente`;
/*!40000 ALTER TABLE `evaluacion_directivoasignaturadocente` DISABLE KEYS */;
/*!40000 ALTER TABLE `evaluacion_directivoasignaturadocente` ENABLE KEYS */;

-- Volcando estructura para tabla evaluacion.evaluacion_directivoasignaturadocente_docente
CREATE TABLE IF NOT EXISTS `evaluacion_directivoasignaturadocente_docente` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `directivoasignaturadocente_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `evaluacion_directivoasig_directivoasignaturadocen_3a03cadc_uniq` (`directivoasignaturadocente_id`,`user_id`),
  KEY `evaluacion_directivo_user_id_fcf60e95_fk_evaluacio` (`user_id`),
  CONSTRAINT `evaluacion_directivo_directivoasignaturad_91a7a6e8_fk_evaluacio` FOREIGN KEY (`directivoasignaturadocente_id`) REFERENCES `evaluacion_directivoasignaturadocente` (`directivo_id`),
  CONSTRAINT `evaluacion_directivo_user_id_fcf60e95_fk_evaluacio` FOREIGN KEY (`user_id`) REFERENCES `evaluacion_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.evaluacion_directivoasignaturadocente_docente: ~0 rows (aproximadamente)
DELETE FROM `evaluacion_directivoasignaturadocente_docente`;
/*!40000 ALTER TABLE `evaluacion_directivoasignaturadocente_docente` DISABLE KEYS */;
/*!40000 ALTER TABLE `evaluacion_directivoasignaturadocente_docente` ENABLE KEYS */;

-- Volcando estructura para tabla evaluacion.evaluacion_docenteasignaturadocente
CREATE TABLE IF NOT EXISTS `evaluacion_docenteasignaturadocente` (
  `docente_id` bigint(20) NOT NULL,
  PRIMARY KEY (`docente_id`),
  CONSTRAINT `evaluacion_docenteas_docente_id_fefde24b_fk_evaluacio` FOREIGN KEY (`docente_id`) REFERENCES `evaluacion_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.evaluacion_docenteasignaturadocente: ~1 rows (aproximadamente)
DELETE FROM `evaluacion_docenteasignaturadocente`;
/*!40000 ALTER TABLE `evaluacion_docenteasignaturadocente` DISABLE KEYS */;
INSERT INTO `evaluacion_docenteasignaturadocente` (`docente_id`) VALUES
	(13);
/*!40000 ALTER TABLE `evaluacion_docenteasignaturadocente` ENABLE KEYS */;

-- Volcando estructura para tabla evaluacion.evaluacion_docenteasignaturadocente_asignaturas
CREATE TABLE IF NOT EXISTS `evaluacion_docenteasignaturadocente_asignaturas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `docenteasignaturadocente_id` bigint(20) NOT NULL,
  `asignatura_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `evaluacion_docenteasigna_docenteasignaturadocente_8fa30710_uniq` (`docenteasignaturadocente_id`,`asignatura_id`),
  KEY `evaluacion_docenteas_asignatura_id_cce3220f_fk_evaluacio` (`asignatura_id`),
  CONSTRAINT `evaluacion_docenteas_asignatura_id_cce3220f_fk_evaluacio` FOREIGN KEY (`asignatura_id`) REFERENCES `evaluacion_asignatura` (`id`),
  CONSTRAINT `evaluacion_docenteas_docenteasignaturadoc_ba2503fd_fk_evaluacio` FOREIGN KEY (`docenteasignaturadocente_id`) REFERENCES `evaluacion_docenteasignaturadocente` (`docente_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.evaluacion_docenteasignaturadocente_asignaturas: ~2 rows (aproximadamente)
DELETE FROM `evaluacion_docenteasignaturadocente_asignaturas`;
/*!40000 ALTER TABLE `evaluacion_docenteasignaturadocente_asignaturas` DISABLE KEYS */;
INSERT INTO `evaluacion_docenteasignaturadocente_asignaturas` (`id`, `docenteasignaturadocente_id`, `asignatura_id`) VALUES
	(1, 13, 1),
	(2, 13, 2);
/*!40000 ALTER TABLE `evaluacion_docenteasignaturadocente_asignaturas` ENABLE KEYS */;

-- Volcando estructura para tabla evaluacion.evaluacion_estudianteasignaturadocente
CREATE TABLE IF NOT EXISTS `evaluacion_estudianteasignaturadocente` (
  `estudiante_id` bigint(20) NOT NULL,
  PRIMARY KEY (`estudiante_id`),
  CONSTRAINT `evaluacion_estudiant_estudiante_id_37e5e8c8_fk_evaluacio` FOREIGN KEY (`estudiante_id`) REFERENCES `evaluacion_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.evaluacion_estudianteasignaturadocente: ~2 rows (aproximadamente)
DELETE FROM `evaluacion_estudianteasignaturadocente`;
/*!40000 ALTER TABLE `evaluacion_estudianteasignaturadocente` DISABLE KEYS */;
INSERT INTO `evaluacion_estudianteasignaturadocente` (`estudiante_id`) VALUES
	(11),
	(12);
/*!40000 ALTER TABLE `evaluacion_estudianteasignaturadocente` ENABLE KEYS */;

-- Volcando estructura para tabla evaluacion.evaluacion_estudianteasignaturadocente_asignaturaestudiante
CREATE TABLE IF NOT EXISTS `evaluacion_estudianteasignaturadocente_asignaturaestudiante` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `estudianteasignaturadocente_id` bigint(20) NOT NULL,
  `asignatura_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `evaluacion_estudianteasi_estudianteasignaturadoce_57d678c5_uniq` (`estudianteasignaturadocente_id`,`asignatura_id`),
  KEY `evaluacion_estudiant_asignatura_id_10c08a1a_fk_evaluacio` (`asignatura_id`),
  CONSTRAINT `evaluacion_estudiant_asignatura_id_10c08a1a_fk_evaluacio` FOREIGN KEY (`asignatura_id`) REFERENCES `evaluacion_asignatura` (`id`),
  CONSTRAINT `evaluacion_estudiant_estudianteasignatura_13813d72_fk_evaluacio` FOREIGN KEY (`estudianteasignaturadocente_id`) REFERENCES `evaluacion_estudianteasignaturadocente` (`estudiante_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.evaluacion_estudianteasignaturadocente_asignaturaestudiante: ~3 rows (aproximadamente)
DELETE FROM `evaluacion_estudianteasignaturadocente_asignaturaestudiante`;
/*!40000 ALTER TABLE `evaluacion_estudianteasignaturadocente_asignaturaestudiante` DISABLE KEYS */;
INSERT INTO `evaluacion_estudianteasignaturadocente_asignaturaestudiante` (`id`, `estudianteasignaturadocente_id`, `asignatura_id`) VALUES
	(1, 11, 1),
	(2, 11, 2),
	(3, 12, 2);
/*!40000 ALTER TABLE `evaluacion_estudianteasignaturadocente_asignaturaestudiante` ENABLE KEYS */;

-- Volcando estructura para tabla evaluacion.evaluacion_evaluacion
CREATE TABLE IF NOT EXISTS `evaluacion_evaluacion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `totalEvaluacion` int(11) DEFAULT NULL,
  `cuestionario_id` bigint(20) NOT NULL,
  `directivo_id` bigint(20) DEFAULT NULL,
  `docente_id` bigint(20) DEFAULT NULL,
  `estudiante_id` bigint(20) DEFAULT NULL,
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

-- Volcando datos para la tabla evaluacion.evaluacion_periodoacademico: ~1 rows (aproximadamente)
DELETE FROM `evaluacion_periodoacademico`;
/*!40000 ALTER TABLE `evaluacion_periodoacademico` DISABLE KEYS */;
INSERT INTO `evaluacion_periodoacademico` (`id`, `nombre`, `fecha_inicio`, `fecha_fin`, `periodo_lectivo`) VALUES
	(1, 'Periodo 2022', '2023-01-10', '2023-01-28', '2023');
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

-- Volcando datos para la tabla evaluacion.evaluacion_periodoevaluacion: ~1 rows (aproximadamente)
DELETE FROM `evaluacion_periodoevaluacion`;
/*!40000 ALTER TABLE `evaluacion_periodoevaluacion` DISABLE KEYS */;
INSERT INTO `evaluacion_periodoevaluacion` (`id`, `nombre`, `titulo`, `descripcion`, `observaciones`, `fecha_autorizacion`, `fecha_aprobacion`, `fecha_inicio_publicacion`, `fecha_fin`, `periodoAcademico_id`) VALUES
	(1, 'Periodo 2022', 'evaluacion1', 'Cuestionario 1', 'Cuestionario 1', '2023-01-10 14:48:51.000000', '2023-01-10 11:48:53.000000', '2023-01-10 14:48:55.000000', '2023-01-20 14:48:56.000000', 1);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.evaluacion_pregunta: ~4 rows (aproximadamente)
DELETE FROM `evaluacion_pregunta`;
/*!40000 ALTER TABLE `evaluacion_pregunta` DISABLE KEYS */;
INSERT INTO `evaluacion_pregunta` (`id`, `texto`, `orden`, `respuesta`, `cuestionario_id`) VALUES
	(1, 'Pregunta1', 1, '2', 1),
	(2, 'Pregunta 2', 2, '2', 1),
	(3, 'Pregunta 3', 3, '2', 1),
	(4, 'Pregunta 4', 4, '2', 1);
/*!40000 ALTER TABLE `evaluacion_pregunta` ENABLE KEYS */;

-- Volcando estructura para tabla evaluacion.evaluacion_user
CREATE TABLE IF NOT EXISTS `evaluacion_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `is_estudiante` tinyint(1) NOT NULL,
  `is_docente` tinyint(1) NOT NULL,
  `is_directivo` tinyint(1) NOT NULL,
  `first_name` varchar(80) NOT NULL,
  `last_name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.evaluacion_user: ~4 rows (aproximadamente)
DELETE FROM `evaluacion_user`;
/*!40000 ALTER TABLE `evaluacion_user` DISABLE KEYS */;
INSERT INTO `evaluacion_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `email`, `is_staff`, `is_active`, `date_joined`, `is_estudiante`, `is_docente`, `is_directivo`, `first_name`, `last_name`) VALUES
	(7, 'pbkdf2_sha256$390000$8VNI4vsRavZfFF1gn4TEFE$2iP/IQN6anj2Xljk9z834Zde5ZYx5Q5Ee7BbjMUqDms=', '2023-01-10 17:13:22.640958', 1, 'allen', '', 1, 1, '2023-01-10 14:35:12.492210', 0, 0, 0, '', ''),
	(11, 'pbkdf2_sha256$390000$1x6EkcRC4sZrOI7ArsutnP$kcQ+LXqk65VzbSXqmaFTYC90Sy7zzROPhAB35a/+qjI=', '2023-01-10 17:14:38.656566', 0, 'estudiante1', '', 0, 1, '2023-01-10 14:41:22.000000', 1, 0, 0, 'Luis', 'Sarmiento'),
	(12, 'pbkdf2_sha256$390000$S2LCbvTpTRAf0AY4Wr3egi$MMODvZ1DNUiv0AfrgEUZMTZNgTPcBTZ7GBpDyzgiwww=', '2023-01-10 17:15:17.472707', 0, 'estudiante2', '', 0, 1, '2023-01-10 14:51:03.000000', 1, 0, 0, 'Luis222', 'Sarmiento222'),
	(13, 'pbkdf2_sha256$390000$ucZ0zCnchkhpssQqFxyLW3$vSKlB4PnOLZzXjrur/dyqjVsBDvH/Flrhv44PYwBuRM=', '2023-01-10 14:52:58.000000', 0, 'docente1', '', 0, 1, '2023-01-10 14:52:54.000000', 0, 1, 0, 'DOCENTE LUIS', 'APELLIDO DOCENTE');
/*!40000 ALTER TABLE `evaluacion_user` ENABLE KEYS */;

-- Volcando estructura para tabla evaluacion.evaluacion_user_groups
CREATE TABLE IF NOT EXISTS `evaluacion_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `evaluacion_user_groups_user_id_group_id_8c210da2_uniq` (`user_id`,`group_id`),
  KEY `evaluacion_user_groups_group_id_e93f9c44_fk_auth_group_id` (`group_id`),
  CONSTRAINT `evaluacion_user_groups_group_id_e93f9c44_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `evaluacion_user_groups_user_id_951fe7a5_fk_evaluacion_user_id` FOREIGN KEY (`user_id`) REFERENCES `evaluacion_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.evaluacion_user_groups: ~0 rows (aproximadamente)
DELETE FROM `evaluacion_user_groups`;
/*!40000 ALTER TABLE `evaluacion_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `evaluacion_user_groups` ENABLE KEYS */;

-- Volcando estructura para tabla evaluacion.evaluacion_user_user_permissions
CREATE TABLE IF NOT EXISTS `evaluacion_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `evaluacion_user_user_per_user_id_permission_id_c18681ab_uniq` (`user_id`,`permission_id`),
  KEY `evaluacion_user_user_permission_id_d67d7907_fk_auth_perm` (`permission_id`),
  CONSTRAINT `evaluacion_user_user_permission_id_d67d7907_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `evaluacion_user_user_user_id_6bbcf672_fk_evaluacio` FOREIGN KEY (`user_id`) REFERENCES `evaluacion_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.evaluacion_user_user_permissions: ~0 rows (aproximadamente)
DELETE FROM `evaluacion_user_user_permissions`;
/*!40000 ALTER TABLE `evaluacion_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `evaluacion_user_user_permissions` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
