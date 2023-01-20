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
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb3;

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.auth_user: ~9 rows (aproximadamente)
DELETE FROM `auth_user`;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
	(1, 'pbkdf2_sha256$390000$pkC52f5Mz1GHaQwzfGjRl0$RuMjDtjrpjAdSA38U3BmsIjhKMx5pc5VNXET0IlvZJI=', '2023-01-20 01:19:51.727379', 1, 'allen', '', '', '', 1, 1, '2023-01-18 03:36:36.767070'),
	(2, 'pbkdf2_sha256$390000$zMQmXpEzAFmNNICtLBwJ3Z$ilwSDMOq8R8i6+wd62n/Hjpa7GsOBYMA8ZidE410eCk=', '2023-01-20 02:23:33.264962', 0, 'estudiante1_', 'Luis', 'Sarmiento', '', 0, 1, '2023-01-18 03:40:44.000000'),
	(3, 'pbkdf2_sha256$390000$tTjmjRobtJ5MFT3Kd1UQvz$blFExf6zS7tsFsUVNLWRfmfZoINVyyhUssRNyV3qK68=', '2023-01-20 01:21:07.480140', 0, 'docente1_', 'Pedro', 'Martinez', '', 0, 1, '2023-01-18 05:53:45.000000'),
	(4, 'pbkdf2_sha256$390000$g0N53VYUxns8qhVdlZyzOw$aA/DaBxMDrVmK0bzhR7/huD9frmzvZuEMCp3bAjBH80=', '2023-01-20 01:20:12.155872', 0, 'directivo1_', 'alfonso', 'monteros', '', 0, 1, '2023-01-18 06:31:40.000000'),
	(5, 'pbkdf2_sha256$390000$owbWqmNqdnpSdufeVD9yJD$JWPvviLNoP8tUWifpT12yX6gaap850cexl3SHTxSr8c=', NULL, 0, 'docente2_', 'Francis', 'Franco', '', 0, 1, '2023-01-18 07:40:41.000000'),
	(6, 'pbkdf2_sha256$390000$CNR9f1LuW8fhci13xtbmuI$8UbLjtmZLGlsHFzSdvNBBrdRzhyT2Cru+4B+g1fXSUY=', NULL, 0, 'docente3_', 'Julio', 'Alvarez', '', 0, 1, '2023-01-19 19:15:29.000000'),
	(7, 'pbkdf2_sha256$390000$MCFAL7esT9isNp82YUlWh7$FYZxns8uyuneGHY9x/9w0pJHARaAjTfSwaPQHGbZNnE=', '2023-01-19 19:31:22.507819', 0, 'estudiante2_', 'Camila', 'Husrtado', '', 0, 1, '2023-01-19 19:17:24.000000'),
	(8, 'pbkdf2_sha256$390000$ZUbIBt8TOhv7cDphi55l68$UYkr6VFsWhwEC7d5+5Hm4Lskmch+ezfb1qEa73ZUcmU=', NULL, 0, 'docente4_', 'Martha', 'Perez', '', 0, 1, '2023-01-20 00:54:32.000000'),
	(9, 'pbkdf2_sha256$390000$j5XGAh28J1jDlVdGKT9Gws$N5WsOL6SzKD6rIxmwplfGLeZ0n82CiZh9BNE0nTSEYg=', NULL, 0, 'docente5_', 'Ignacio', 'Lopez', '', 0, 1, '2023-01-20 00:55:07.000000'),
	(10, 'pbkdf2_sha256$390000$CBj287nafpBCgrNanZmmNo$eAkmzU5c2p1g8ZeYgYvF60Nkgc8vyQVRXpbcWeo1hDo=', NULL, 0, 'directivo2_', 'Carlos', 'Rios', '', 0, 1, '2023-01-20 00:58:13.000000');
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
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.django_admin_log: ~64 rows (aproximadamente)
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
	(30, '2023-01-18 07:42:14.336309', '5', 'Francis - <QuerySet [<Asignatura: POO - Programacion>]>', 2, '[]', 10, 1),
	(31, '2023-01-19 04:41:32.047883', '2', 'Luis - <QuerySet [<Asignatura: Mate - Matematicas carrear>, <Asignatura: POO - Programacion>]>', 2, '[{"changed": {"fields": ["Estudiante - Docente"]}}]', 11, 1),
	(32, '2023-01-19 19:15:29.662176', '6', 'docente3_', 1, '[{"added": {}}]', 4, 1),
	(33, '2023-01-19 19:16:07.190747', '3', 'ciencias - ciencias naturales', 1, '[{"added": {}}]', 7, 1),
	(34, '2023-01-19 19:16:20.520417', '6', ' - <QuerySet [<Asignatura: ciencias - ciencias naturales>]>', 1, '[{"added": {}}]', 10, 1),
	(35, '2023-01-19 19:16:43.829188', '6', 'docente3_', 2, '[{"changed": {"fields": ["First name", "Last name"]}}]', 4, 1),
	(36, '2023-01-19 19:16:45.292334', '6', 'Julio - <QuerySet [<Asignatura: ciencias - ciencias naturales>]>', 2, '[]', 10, 1),
	(37, '2023-01-19 19:17:24.130725', '7', 'estudiante2_', 1, '[{"added": {}}]', 4, 1),
	(38, '2023-01-19 19:17:39.400678', '7', 'estudiante2_', 2, '[{"changed": {"fields": ["First name", "Last name"]}}]', 4, 1),
	(39, '2023-01-19 19:17:40.429694', '7', 'Camila - <QuerySet [<Asignatura: ciencias - ciencias naturales>]>', 1, '[{"added": {}}]', 11, 1),
	(40, '2023-01-19 20:36:23.096558', '3', 'Pedro - <QuerySet [<Asignatura: Mate - Matematicas carrear>, <Asignatura: POO - Programacion>]>', 2, '[{"changed": {"fields": ["Autoevaluacion - Docente"]}}]', 10, 1),
	(41, '2023-01-19 23:25:04.302940', '3', 'Pedro - <QuerySet [<Asignatura: Mate - Matematicas carrear>]>', 2, '[{"changed": {"fields": ["Autoevaluacion - Docente"]}}]', 10, 1),
	(42, '2023-01-20 00:18:22.297021', '1', 'Desarrollo de software', 1, '[{"added": {}}]', 20, 1),
	(43, '2023-01-20 00:18:32.807158', '2', 'Fisica', 1, '[{"added": {}}]', 20, 1),
	(44, '2023-01-20 00:18:46.769384', '1', 'Desarrollo de software - POO', 1, '[{"added": {}}]', 7, 1),
	(45, '2023-01-20 00:19:05.386343', '2', 'Desarrollo de software - Introduccion a software', 1, '[{"added": {}}]', 7, 1),
	(46, '2023-01-20 00:19:28.536183', '3', 'Fisica - Matematica', 1, '[{"added": {}}]', 7, 1),
	(47, '2023-01-20 00:19:56.280325', '4', 'Fisica - Fisica Aplicada', 1, '[{"added": {}}]', 7, 1),
	(48, '2023-01-20 00:20:14.588298', '5', 'Desarrollo de software - Matematica', 1, '[{"added": {}}]', 7, 1),
	(49, '2023-01-20 00:25:15.278953', '2', 'Luis - <QuerySet [<Asignatura: Desarrollo de software - POO>, <Asignatura: Desarrollo de software - Introduccion a software>, <Asignatura: Desarrollo de software - Matematica>]>', 1, '[{"added": {}}]', 11, 1),
	(50, '2023-01-20 00:25:43.429372', '7', 'Camila - <QuerySet [<Asignatura: Fisica - Matematica>, <Asignatura: Fisica - Fisica Aplicada>]>', 1, '[{"added": {}}]', 11, 1),
	(51, '2023-01-20 00:50:43.433005', '3', 'Pedro - POO', 1, '[{"added": {}}]', 10, 1),
	(52, '2023-01-20 00:51:01.625688', '5', 'Francis - Introduccion a software', 1, '[{"added": {}}]', 10, 1),
	(53, '2023-01-20 00:51:21.438671', '6', 'Julio - Matematica', 1, '[{"added": {}}]', 10, 1),
	(54, '2023-01-20 00:54:32.611167', '8', 'docente4_', 1, '[{"added": {}}]', 4, 1),
	(55, '2023-01-20 00:54:41.273369', '8', 'docente4_', 2, '[{"changed": {"fields": ["First name", "Last name"]}}]', 4, 1),
	(56, '2023-01-20 00:54:48.946554', '8', 'Martha - Matematica', 1, '[{"added": {}}]', 10, 1),
	(57, '2023-01-20 00:55:07.511771', '9', 'docente5_', 1, '[{"added": {}}]', 4, 1),
	(58, '2023-01-20 00:55:20.496126', '9', 'docente5_', 2, '[{"changed": {"fields": ["First name", "Last name"]}}]', 4, 1),
	(59, '2023-01-20 00:55:33.350122', '9', 'Ignacio - Fisica Aplicada', 1, '[{"added": {}}]', 10, 1),
	(60, '2023-01-20 00:57:47.273078', '4', 'alfonso monteros (directivo1_)', 2, '[{"changed": {"fields": ["Directivo - Docente"]}}]', 9, 1),
	(61, '2023-01-20 00:58:13.304895', '10', 'directivo2_', 1, '[{"added": {}}]', 4, 1),
	(62, '2023-01-20 00:58:27.129369', '10', 'directivo2_', 2, '[{"changed": {"fields": ["First name", "Last name"]}}]', 4, 1),
	(63, '2023-01-20 00:58:34.285248', '10', 'Carlos Rios (directivo2_)', 1, '[{"added": {}}]', 9, 1),
	(64, '2023-01-20 01:06:17.730084', '2', 'Desarrollo de software - Introduccion a software', 2, '[]', 7, 1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;

-- Volcando estructura para tabla evaluacion.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.django_content_type: ~19 rows (aproximadamente)
DELETE FROM `django_content_type`;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'auth', 'user'),
	(5, 'contenttypes', 'contenttype'),
	(7, 'evaluacion', 'asignatura'),
	(20, 'evaluacion', 'carrera'),
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.django_migrations: ~22 rows (aproximadamente)
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
	(19, 'sessions', '0001_initial', '2023-01-18 05:43:30.710780'),
	(20, 'evaluacion', '0002_alter_tabulacion_dirtotal_alter_tabulacion_docetotal_and_more', '2023-01-19 04:32:52.255140'),
	(21, 'evaluacion', '0002_rename_estdocente_tabulacion_doctotal', '2023-01-19 20:11:06.519140'),
	(22, 'evaluacion', '0003_alter_evaluacion_totalevaluacion', '2023-01-19 20:16:54.044644');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;

-- Volcando estructura para tabla evaluacion.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.django_session: ~9 rows (aproximadamente)
DELETE FROM `django_session`;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('586qekp6uegu3k37hv0o4fm4e5dbaw70', '.eJxVjE0OwiAYBe_C2pDyW3Dp3jOQxwdI1dCktCvj3bVJF7p9M_NeLGBba9h6XsKU2JlpdvrdIuiR2w7SHe02c5rbukyR7wo_aOfXOeXn5XD_Dip6_daSvCUtVDEgSw6pyEIqSyeyGx2AJGC9N9JoqDg6D2g72FKKEkOWlr0_-_A4OA:1pI5vY:VsaAzm96zPVaxyhCQE1q6PIwlrfdFs7_SQzIVLRY9Us', '2023-02-01 10:44:20.562954'),
	('65ptqs4stbamzn23msrrxrtmd237fzr2', '.eJxVjDsOwyAQRO9CHSG-a5Myvc-AFliCkwgkY1dR7h5bcpGUM-_NvJnHbS1-67T4ObErk-zy2wWMT6oHSA-s98Zjq-syB34o_KSdTy3R63a6fwcFe9nXJooURzIiuBgGR0IiJlAmg1KKcgQLNiNopzNpA2AGhD1Zo-WotSP2-QLrZDdR:1pIbVw:sDj7-hEsVGNFTynr5d9VoYVM2VGfFE-j9RtltbPgJDo', '2023-02-02 20:28:00.108991'),
	('6jhj685caf16cmxfc5ljnkjl4fs2tdq8', '.eJxVjEEOwiAQRe_C2pBhSgdw6d4zNFOGStVAUtqV8e7apAvd_vfef6mBtzUPW0vLMIs6q06dfreR4yOVHcidy63qWMu6zKPeFX3Qpq9V0vNyuH8HmVv-1mMvPQQIiU3naOosBucQxCZipgTB4-SiM_3kkcBz8AJI6IisEQio3h-9oTZl:1pI2eB:qqn0cJrMuCLBX04fuv4jQAd0i__GNdhZufTIR5b_47g', '2023-02-01 07:14:11.507237'),
	('bncp5qau4b3tkol8dlvccis4tamouthh', '.eJxVjEEOwiAQRe_C2hCEEapL956BDDODVA0kpV0Z726bdKHb_977bxVxmUtcukxxZHVRVh1-t4T0lLoBfmC9N02tztOY9KbonXZ9ayyv6-7-HRTsZa29kBuMA4As1guY4Jk4IUiykG0YGAQpp9OZDIZ8DICrioZJsiN26vMF-rA5GA:1pIZXK:t460nOW3oIm3ueMxHrqFzNiNjfYw7rHtFyFCj3cyg_4', '2023-02-02 18:21:18.361781'),
	('dj6fk2trbqxsk95ihntfdcvxcs0hyptl', '.eJxVjDsOwyAQRO9CHSG-a5Myvc-AFliCkwgkY1dR7h5bcpGUM-_NvJnHbS1-67T4ObErk-zy2wWMT6oHSA-s98Zjq-syB34o_KSdTy3R63a6fwcFe9nXJooURzIiuBgGR0IiJlAmg1KKcgQLNiNopzNpA2AGhD1Zo-WotSP2-QLrZDdR:1pI3ji:r_HuxpCakWq5D5pbzmTEc0mf2AcQ2rPgHqeTH2GkQPw', '2023-02-01 08:23:58.765286'),
	('fdwtuu2irxb2z4vtvz4jbmv1pvcgmjg6', '.eJxVjDsOwyAQRO9CHSG-a5Myvc-AFliCkwgkY1dR7h5bcpGUM-_NvJnHbS1-67T4ObErk-zy2wWMT6oHSA-s98Zjq-syB34o_KSdTy3R63a6fwcFe9nXJooURzIiuBgGR0IiJlAmg1KKcgQLNiNopzNpA2AGhD1Zo-WotSP2-QLrZDdR:1pIMYB:TCXoIENZLzC1H5XiinjLQfOUxAPl7g7zEccRw1R1IYE', '2023-02-02 04:29:19.734709'),
	('isrglr69im2oj6fb7lcv24kf6m6ydhf3', '.eJxVjDsOwyAQRO9CHSG-a5Myvc-AFliCkwgkY1dR7h5bcpGUM-_NvJnHbS1-67T4ObErk-zy2wWMT6oHSA-s98Zjq-syB34o_KSdTy3R63a6fwcFe9nXJooURzIiuBgGR0IiJlAmg1KKcgQLNiNopzNpA2AGhD1Zo-WotSP2-QLrZDdR:1pI1Fy:-CAu9ygP967FIVCmyTWx9_Ea3v_eBpFyDzd7meNX11o', '2023-02-01 05:45:06.731867'),
	('jww8cuzebzlm0rklfz7np6al0raxa8b1', '.eJxVjDsOwyAQRO9CHSG-a5Myvc-AFliCkwgkY1dR7h5bcpGUM-_NvJnHbS1-67T4ObErk-zy2wWMT6oHSA-s98Zjq-syB34o_KSdTy3R63a6fwcFe9nXJooURzIiuBgGR0IiJlAmg1KKcgQLNiNopzNpA2AGhD1Zo-WotSP2-QLrZDdR:1pIg4N:KiHcxw1-Qt4ksRp1o-Yn9MSsyiuAqe-XtZoO1KcNRf0', '2023-02-03 01:19:51.734381'),
	('r92du3m2oau43hl9f9o72yo1eqro6g9u', '.eJxVjDsOwyAQRO9CHSG-a5Myvc-AFliCkwgkY1dR7h5bcpGUM-_NvJnHbS1-67T4ObErk-zy2wWMT6oHSA-s98Zjq-syB34o_KSdTy3R63a6fwcFe9nXJooURzIiuBgGR0IiJlAmg1KKcgQLNiNopzNpA2AGhD1Zo-WotSP2-QLrZDdR:1pIYfp:GErnzjbEc3dQHIqLskGQaHflkIJ8i-MB-b5joqueAUs', '2023-02-02 17:26:01.189036'),
	('tht8l7wuh154d9jghe07tuo5tzo0krlv', '.eJxVjEEOwiAQRe_C2hCEEapL956BDDODVA0kpV0Z726bdKHb_977bxVxmUtcukxxZHVRVh1-t4T0lLoBfmC9N02tztOY9KbonXZ9ayyv6-7-HRTsZa29kBuMA4As1guY4Jk4IUiykG0YGAQpp9OZDIZ8DICrioZJsiN26vMF-rA5GA:1pIh41:Rn9mYXHothD2ebmiySLmgqzAXkgJNX-XXrDqGegi5V4', '2023-02-03 02:23:33.268859');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;

-- Volcando estructura para tabla evaluacion.evaluacion_asignatura
CREATE TABLE IF NOT EXISTS `evaluacion_asignatura` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `semestre` varchar(10) NOT NULL,
  `paralelo` varchar(50) NOT NULL,
  `nombre` longtext NOT NULL,
  `duracion` double NOT NULL,
  `estadoAsignatura` tinyint(1) NOT NULL,
  `carrera_id` bigint(20) NOT NULL,
  `cuestionario_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `evaluacion_asignatur_carrera_id_ae8345c1_fk_evaluacio` (`carrera_id`),
  KEY `evaluacion_asignatur_cuestionario_id_49dadd9d_fk_evaluacio` (`cuestionario_id`),
  CONSTRAINT `evaluacion_asignatur_carrera_id_ae8345c1_fk_evaluacio` FOREIGN KEY (`carrera_id`) REFERENCES `evaluacion_carrera` (`id`),
  CONSTRAINT `evaluacion_asignatur_cuestionario_id_49dadd9d_fk_evaluacio` FOREIGN KEY (`cuestionario_id`) REFERENCES `evaluacion_cuestionario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.evaluacion_asignatura: ~4 rows (aproximadamente)
DELETE FROM `evaluacion_asignatura`;
/*!40000 ALTER TABLE `evaluacion_asignatura` DISABLE KEYS */;
INSERT INTO `evaluacion_asignatura` (`id`, `semestre`, `paralelo`, `nombre`, `duracion`, `estadoAsignatura`, `carrera_id`, `cuestionario_id`) VALUES
	(1, '3', 'B', 'POO', 123, 1, 1, 1),
	(2, '1', 'A', 'Introduccion a software', 123, 1, 1, 1),
	(3, '4', 'A', 'Matematica', 123, 1, 2, 1),
	(4, '7', 'A', 'Fisica Aplicada', 123, 1, 2, 1),
	(5, '2', 'A', 'Matematica', 123, 1, 1, 1);
/*!40000 ALTER TABLE `evaluacion_asignatura` ENABLE KEYS */;

-- Volcando estructura para tabla evaluacion.evaluacion_carrera
CREATE TABLE IF NOT EXISTS `evaluacion_carrera` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `periodoAcademico_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `evaluacion_carrera_periodoAcademico_id_7fd7aec4_fk_evaluacio` (`periodoAcademico_id`),
  CONSTRAINT `evaluacion_carrera_periodoAcademico_id_7fd7aec4_fk_evaluacio` FOREIGN KEY (`periodoAcademico_id`) REFERENCES `evaluacion_periodoacademico` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.evaluacion_carrera: ~2 rows (aproximadamente)
DELETE FROM `evaluacion_carrera`;
/*!40000 ALTER TABLE `evaluacion_carrera` DISABLE KEYS */;
INSERT INTO `evaluacion_carrera` (`id`, `nombre`, `periodoAcademico_id`) VALUES
	(1, 'Desarrollo de software', 1),
	(2, 'Fisica', 1);
/*!40000 ALTER TABLE `evaluacion_carrera` ENABLE KEYS */;

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
	(4, 1, '1108'),
	(10, 1, '11013');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.evaluacion_directivoasignaturadocente_docente: ~5 rows (aproximadamente)
DELETE FROM `evaluacion_directivoasignaturadocente_docente`;
/*!40000 ALTER TABLE `evaluacion_directivoasignaturadocente_docente` DISABLE KEYS */;
INSERT INTO `evaluacion_directivoasignaturadocente_docente` (`id`, `directivoasignaturadocente_id`, `docenteasignaturadocente_id`) VALUES
	(1, 4, 3),
	(2, 4, 5),
	(3, 4, 6),
	(4, 10, 8),
	(5, 10, 9);
/*!40000 ALTER TABLE `evaluacion_directivoasignaturadocente_docente` ENABLE KEYS */;

-- Volcando estructura para tabla evaluacion.evaluacion_docenteasignaturadocente
CREATE TABLE IF NOT EXISTS `evaluacion_docenteasignaturadocente` (
  `docente_id` int(11) NOT NULL,
  `is_docente` tinyint(1) NOT NULL,
  `cedula` varchar(10) NOT NULL,
  `asignatura_id` bigint(20) NOT NULL,
  PRIMARY KEY (`docente_id`),
  UNIQUE KEY `cedula` (`cedula`),
  KEY `evaluacion_docenteas_asignatura_id_88c5e80f_fk_evaluacio` (`asignatura_id`),
  CONSTRAINT `evaluacion_docenteas_asignatura_id_88c5e80f_fk_evaluacio` FOREIGN KEY (`asignatura_id`) REFERENCES `evaluacion_asignatura` (`id`),
  CONSTRAINT `evaluacion_docenteas_docente_id_fefde24b_fk_auth_user` FOREIGN KEY (`docente_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.evaluacion_docenteasignaturadocente: ~4 rows (aproximadamente)
DELETE FROM `evaluacion_docenteasignaturadocente`;
/*!40000 ALTER TABLE `evaluacion_docenteasignaturadocente` DISABLE KEYS */;
INSERT INTO `evaluacion_docenteasignaturadocente` (`docente_id`, `is_docente`, `cedula`, `asignatura_id`) VALUES
	(3, 1, '1107', 1),
	(5, 1, '1108', 2),
	(6, 1, '11010', 5),
	(8, 1, '11020', 3),
	(9, 1, '11012', 4);
/*!40000 ALTER TABLE `evaluacion_docenteasignaturadocente` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.evaluacion_docenteasignaturadocente_cuestionarios: ~8 rows (aproximadamente)
DELETE FROM `evaluacion_docenteasignaturadocente_cuestionarios`;
/*!40000 ALTER TABLE `evaluacion_docenteasignaturadocente_cuestionarios` DISABLE KEYS */;
INSERT INTO `evaluacion_docenteasignaturadocente_cuestionarios` (`id`, `docenteasignaturadocente_id`, `cuestionario_id`) VALUES
	(1, 3, 2),
	(2, 3, 3),
	(3, 5, 2),
	(4, 5, 3),
	(5, 6, 2),
	(6, 6, 3),
	(7, 8, 2),
	(8, 8, 3),
	(9, 9, 2),
	(10, 9, 3);
/*!40000 ALTER TABLE `evaluacion_docenteasignaturadocente_cuestionarios` ENABLE KEYS */;

-- Volcando estructura para tabla evaluacion.evaluacion_estudianteasignaturadocente
CREATE TABLE IF NOT EXISTS `evaluacion_estudianteasignaturadocente` (
  `estudiante_id` int(11) NOT NULL,
  `cedula` varchar(10) NOT NULL,
  `is_estudiante` tinyint(1) NOT NULL,
  `carrera_id` bigint(20) NOT NULL,
  PRIMARY KEY (`estudiante_id`),
  UNIQUE KEY `cedula` (`cedula`),
  KEY `evaluacion_estudiant_carrera_id_f2ca090a_fk_evaluacio` (`carrera_id`),
  CONSTRAINT `evaluacion_estudiant_carrera_id_f2ca090a_fk_evaluacio` FOREIGN KEY (`carrera_id`) REFERENCES `evaluacion_carrera` (`id`),
  CONSTRAINT `evaluacion_estudiant_estudiante_id_37e5e8c8_fk_auth_user` FOREIGN KEY (`estudiante_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.evaluacion_estudianteasignaturadocente: ~2 rows (aproximadamente)
DELETE FROM `evaluacion_estudianteasignaturadocente`;
/*!40000 ALTER TABLE `evaluacion_estudianteasignaturadocente` DISABLE KEYS */;
INSERT INTO `evaluacion_estudianteasignaturadocente` (`estudiante_id`, `cedula`, `is_estudiante`, `carrera_id`) VALUES
	(2, '1106', 1, 1),
	(7, '11011', 1, 2);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.evaluacion_estudianteasignaturadocente_asignaturaestudiante: ~3 rows (aproximadamente)
DELETE FROM `evaluacion_estudianteasignaturadocente_asignaturaestudiante`;
/*!40000 ALTER TABLE `evaluacion_estudianteasignaturadocente_asignaturaestudiante` DISABLE KEYS */;
INSERT INTO `evaluacion_estudianteasignaturadocente_asignaturaestudiante` (`id`, `estudianteasignaturadocente_id`, `asignatura_id`) VALUES
	(1, 2, 1),
	(2, 2, 2),
	(3, 7, 3);
/*!40000 ALTER TABLE `evaluacion_estudianteasignaturadocente_asignaturaestudiante` ENABLE KEYS */;

-- Volcando estructura para tabla evaluacion.evaluacion_evaluacion
CREATE TABLE IF NOT EXISTS `evaluacion_evaluacion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `totalEvaluacion` decimal(5,2) DEFAULT NULL,
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
  CONSTRAINT `evaluacion_evaluacio_directivo_id_9a4b8bda_fk_evaluacio` FOREIGN KEY (`directivo_id`) REFERENCES `evaluacion_directivoasignaturadocente` (`directivo_id`),
  CONSTRAINT `evaluacion_evaluacio_docente_id_dbfc66a9_fk_evaluacio` FOREIGN KEY (`docente_id`) REFERENCES `evaluacion_docenteasignaturadocente` (`docente_id`),
  CONSTRAINT `evaluacion_evaluacio_estudiante_id_cc62728d_fk_evaluacio` FOREIGN KEY (`estudiante_id`) REFERENCES `evaluacion_estudianteasignaturadocente` (`estudiante_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.evaluacion_evaluacion: ~0 rows (aproximadamente)
DELETE FROM `evaluacion_evaluacion`;
/*!40000 ALTER TABLE `evaluacion_evaluacion` DISABLE KEYS */;
INSERT INTO `evaluacion_evaluacion` (`id`, `totalEvaluacion`, `cuestionario_id`, `directivo_id`, `docente_id`, `estudiante_id`) VALUES
	(1, 3.33, 1, NULL, 3, 2),
	(2, 2.33, 1, NULL, 5, 2);
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.evaluacion_respuesta: ~9 rows (aproximadamente)
DELETE FROM `evaluacion_respuesta`;
/*!40000 ALTER TABLE `evaluacion_respuesta` DISABLE KEYS */;
INSERT INTO `evaluacion_respuesta` (`id`, `respuesta`, `pregunta_id`) VALUES
	(1, '1', 1),
	(2, '3', 2),
	(3, '5', 3),
	(4, '2', 1),
	(5, '3', 2),
	(6, '4', 3),
	(7, '2', 1),
	(8, '3', 2),
	(9, '3', 3),
	(10, '2', 1),
	(11, '3', 2),
	(12, '5', 3),
	(13, '1', 1),
	(14, '2', 2),
	(15, '4', 3);
/*!40000 ALTER TABLE `evaluacion_respuesta` ENABLE KEYS */;

-- Volcando estructura para tabla evaluacion.evaluacion_tabulacion
CREATE TABLE IF NOT EXISTS `evaluacion_tabulacion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `estTotal` decimal(5,2) NOT NULL,
  `docTotal` decimal(5,2) NOT NULL,
  `dirTotal` decimal(5,2) NOT NULL,
  `total` decimal(5,2) DEFAULT NULL,
  `docente_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `evaluacion_tabulacio_docente_id_9d4155f1_fk_evaluacio` (`docente_id`),
  CONSTRAINT `evaluacion_tabulacio_docente_id_9d4155f1_fk_evaluacio` FOREIGN KEY (`docente_id`) REFERENCES `evaluacion_docenteasignaturadocente` (`docente_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla evaluacion.evaluacion_tabulacion: ~3 rows (aproximadamente)
DELETE FROM `evaluacion_tabulacion`;
/*!40000 ALTER TABLE `evaluacion_tabulacion` DISABLE KEYS */;
INSERT INTO `evaluacion_tabulacion` (`id`, `estTotal`, `docTotal`, `dirTotal`, `total`, `docente_id`) VALUES
	(3, 3.33, 0.00, 0.00, 1.11, 3),
	(5, 2.83, 0.00, 0.00, 0.94, 5),
	(6, 3.00, 0.00, 0.00, 1.00, 6);
/*!40000 ALTER TABLE `evaluacion_tabulacion` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
