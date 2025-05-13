-- MySQL dump 10.13  Distrib 8.4.0, for Win64 (x86_64)
--
-- Host: localhost    Database: datbandb3
-- ------------------------------------------------------
-- Server version	8.4.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add menu item',6,'add_menuitem'),(22,'Can change menu item',6,'change_menuitem'),(23,'Can delete menu item',6,'delete_menuitem'),(24,'Can view menu item',6,'view_menuitem'),(25,'Can add session',7,'add_session'),(26,'Can change session',7,'change_session'),(27,'Can delete session',7,'delete_session'),(28,'Can view session',7,'view_session'),(29,'Can add ban',8,'add_ban'),(30,'Can change ban',8,'change_ban'),(31,'Can delete ban',8,'delete_ban'),(32,'Can view ban',8,'view_ban'),(33,'Can add dat ban',9,'add_datban'),(34,'Can change dat ban',9,'change_datban'),(35,'Can delete dat ban',9,'delete_datban'),(36,'Can view dat ban',9,'view_datban'),(37,'Can add loai mon an',10,'add_loaimonan'),(38,'Can change loai mon an',10,'change_loaimonan'),(39,'Can delete loai mon an',10,'delete_loaimonan'),(40,'Can view loai mon an',10,'view_loaimonan'),(41,'Can add nguoi dung',11,'add_nguoidung'),(42,'Can change nguoi dung',11,'change_nguoidung'),(43,'Can delete nguoi dung',11,'delete_nguoidung'),(44,'Can view nguoi dung',11,'view_nguoidung'),(45,'Can add vai tro',12,'add_vaitro'),(46,'Can change vai tro',12,'change_vaitro'),(47,'Can delete vai tro',12,'delete_vaitro'),(48,'Can view vai tro',12,'view_vaitro'),(49,'Can add don hang',13,'add_donhang'),(50,'Can change don hang',13,'change_donhang'),(51,'Can delete don hang',13,'delete_donhang'),(52,'Can view don hang',13,'view_donhang'),(53,'Can add mon an',14,'add_monan'),(54,'Can change mon an',14,'change_monan'),(55,'Can delete mon an',14,'delete_monan'),(56,'Can view mon an',14,'view_monan'),(57,'Can add thanh toan',15,'add_thanhtoan'),(58,'Can change thanh toan',15,'change_thanhtoan'),(59,'Can delete thanh toan',15,'delete_thanhtoan'),(60,'Can view thanh toan',15,'view_thanhtoan'),(61,'Can add chi tiet don',16,'add_chitietdon'),(62,'Can change chi tiet don',16,'change_chitietdon'),(63,'Can delete chi tiet don',16,'delete_chitietdon'),(64,'Can view chi tiet don',16,'view_chitietdon'),(65,'Can add danh gia',17,'add_danhgia'),(66,'Can change danh gia',17,'change_danhgia'),(67,'Can delete danh gia',17,'delete_danhgia'),(68,'Can view danh gia',17,'view_danhgia'),(69,'Can add profile',18,'add_profile'),(70,'Can change profile',18,'change_profile'),(71,'Can delete profile',18,'delete_profile'),(72,'Can view profile',18,'view_profile');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$870000$Rv6rIzeckHxZXR6RIct7Ge$1IIP+Kv/72U9YQsGL8ai9DntqDj/wjAjq3Kc94vS+MY=','2025-05-10 09:46:56.284107',0,'khanh@gmail.com','','','khanh@gmail.com',0,1,'2025-05-10 09:45:51.499634'),(2,'pbkdf2_sha256$870000$dcmJSZK29Fhqz436wmiSKy$MwHE/zZa70zLDdCgfeYYTwVXhWKn+7BAIiGyTNTDMsE=','2025-05-11 00:31:14.155286',0,'khanh1@gmail.com','','','khanh1@gmail.com',0,1,'2025-05-10 09:47:20.159467'),(12,'pbkdf2_sha256$870000$REnEmAcFyadDbquSWq3Jns$dcjKEjq5iN8fsu+U1pbpjRHl1S3dJ/wW6OHGGJxqsxQ=',NULL,0,'example_user','','','khanhgg@gmail.com',0,1,'2025-05-11 02:19:44.822459'),(13,'pbkdf2_sha256$870000$cHp4whbF5KWUaDkeqn5BW8$5rZJiUq0apxsfU66Y0T6JahjtpiCRgZLvlkbWCZMjvc=',NULL,0,'khanh5@gmail.com','','','khanh5@gmail.com',0,1,'2025-05-11 10:09:02.432056'),(14,'pbkdf2_sha256$870000$c4sFxeAuWL15l6rUA8OsSn$YQkDiP2uX5e5aAyMlJSNuZDT/rU6HCWv4tESqIriB78=',NULL,0,'khanh10@gmail.com','','','khanh10@gmail.com',0,1,'2025-05-11 10:09:57.596810');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ban`
--

DROP TABLE IF EXISTS `ban`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ban` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TenBan` varchar(50) NOT NULL,
  `SoChoNgoi` int NOT NULL,
  `ViTri` varchar(50) DEFAULT NULL,
  `TrangThai` varchar(20) DEFAULT 'Trống',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ban`
--

LOCK TABLES `ban` WRITE;
/*!40000 ALTER TABLE `ban` DISABLE KEYS */;
INSERT INTO `ban` VALUES (1,'Bàn 1',4,'gần cửa sổ','Trống'),(2,'Bàn 2',2,'gần quầy bar','Trống'),(3,'Bàn 3',6,'cạnh sân vườn','Trống'),(4,'Bàn 4',4,'gần phòng VIP','Trống'),(5,'Bàn 5',8,'góc phòng','Trống'),(6,'Bàn 6',6,'gần cửa sổ','Trống'),(7,'Bàn 7',7,'gần quầy bar','Trống'),(12,'Bàn 8',6,'cạnh sân vườn','Trống'),(13,'Bàn 9',4,'gần phòng VIP','Trống'),(14,'Bàn 10',8,'góc phòng','Trống'),(15,'Bàn 11',8,'góc phòng','Trống');
/*!40000 ALTER TABLE `ban` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chitietdon`
--

DROP TABLE IF EXISTS `chitietdon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chitietdon` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `IDDonHang` int NOT NULL,
  `IDMonAn` int NOT NULL,
  `SoLuong` int NOT NULL,
  `Gia` decimal(10,2) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDDonHang` (`IDDonHang`),
  KEY `IDMonAn` (`IDMonAn`),
  CONSTRAINT `chitietdon_ibfk_1` FOREIGN KEY (`IDDonHang`) REFERENCES `donhang` (`ID`),
  CONSTRAINT `chitietdon_ibfk_2` FOREIGN KEY (`IDMonAn`) REFERENCES `monan` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chitietdon`
--

LOCK TABLES `chitietdon` WRITE;
/*!40000 ALTER TABLE `chitietdon` DISABLE KEYS */;
INSERT INTO `chitietdon` VALUES (36,28,135,5,80000.00),(37,28,136,3,70000.00);
/*!40000 ALTER TABLE `chitietdon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `danhgia`
--

DROP TABLE IF EXISTS `danhgia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `danhgia` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `IDThanhToan` int NOT NULL,
  `Diem` int NOT NULL,
  `NoiDung` text,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IDThanhToan` (`IDThanhToan`),
  CONSTRAINT `danhgia_ibfk_1` FOREIGN KEY (`IDThanhToan`) REFERENCES `thanhtoan` (`ID`),
  CONSTRAINT `danhgia_chk_1` CHECK ((`Diem` between 1 and 5))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `danhgia`
--

LOCK TABLES `danhgia` WRITE;
/*!40000 ALTER TABLE `danhgia` DISABLE KEYS */;
/*!40000 ALTER TABLE `danhgia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datban`
--

DROP TABLE IF EXISTS `datban`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datban` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `IDNguoiDung` int NOT NULL,
  `IDBan` int NOT NULL,
  `Ngay` date NOT NULL,
  `Gio` time NOT NULL,
  `SoNguoi` int NOT NULL,
  `TrangThai` varchar(20) DEFAULT 'Đang chờ',
  PRIMARY KEY (`ID`),
  KEY `IDNguoiDung` (`IDNguoiDung`),
  KEY `IDBan` (`IDBan`),
  CONSTRAINT `datban_ibfk_1` FOREIGN KEY (`IDNguoiDung`) REFERENCES `nguoidung` (`ID`),
  CONSTRAINT `datban_ibfk_2` FOREIGN KEY (`IDBan`) REFERENCES `ban` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datban`
--

LOCK TABLES `datban` WRITE;
/*!40000 ALTER TABLE `datban` DISABLE KEYS */;
INSERT INTO `datban` VALUES (58,1,4,'2025-05-12','19:00:00',2,'Đang chờ'),(59,2,1,'2025-05-12','18:00:00',3,'Đang chờ'),(60,2,3,'2025-05-12','18:00:00',2,'Đang chờ'),(61,2,12,'2025-05-12','19:00:00',2,'Đang chờ'),(62,2,2,'2025-05-12','19:00:00',2,'Đang chờ'),(63,2,3,'2025-05-13','18:00:00',2,'Đang chờ'),(64,2,12,'2025-05-13','18:00:00',7,'Đang chờ'),(65,2,5,'2025-05-13','18:00:00',6,'Đang chờ'),(66,2,5,'2025-05-13','19:00:00',2,'Đang chờ'),(67,2,3,'2025-05-13','13:00:00',2,'Đang chờ'),(68,2,4,'2025-05-13','12:00:00',10,'Đang chờ'),(69,2,3,'2025-05-13','19:00:00',8,'Đang chờ'),(70,2,3,'2025-05-14','13:00:00',2,'Đang chờ');
/*!40000 ALTER TABLE `datban` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(6,'api','menuitem'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(8,'restaurant','ban'),(16,'restaurant','chitietdon'),(17,'restaurant','danhgia'),(9,'restaurant','datban'),(13,'restaurant','donhang'),(10,'restaurant','loaimonan'),(14,'restaurant','monan'),(11,'restaurant','nguoidung'),(18,'restaurant','profile'),(15,'restaurant','thanhtoan'),(12,'restaurant','vaitro'),(7,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-05-08 15:39:51.842605'),(2,'auth','0001_initial','2025-05-08 15:39:52.481454'),(3,'admin','0001_initial','2025-05-08 15:39:52.632540'),(4,'admin','0002_logentry_remove_auto_add','2025-05-08 15:39:52.640012'),(5,'admin','0003_logentry_add_action_flag_choices','2025-05-08 15:39:52.647175'),(6,'contenttypes','0002_remove_content_type_name','2025-05-08 15:39:52.757847'),(7,'auth','0002_alter_permission_name_max_length','2025-05-08 15:39:52.838333'),(8,'auth','0003_alter_user_email_max_length','2025-05-08 15:39:52.864024'),(9,'auth','0004_alter_user_username_opts','2025-05-08 15:39:52.871543'),(10,'auth','0005_alter_user_last_login_null','2025-05-08 15:39:52.939459'),(11,'auth','0006_require_contenttypes_0002','2025-05-08 15:39:52.942996'),(12,'auth','0007_alter_validators_add_error_messages','2025-05-08 15:39:52.950749'),(13,'auth','0008_alter_user_username_max_length','2025-05-08 15:39:53.019606'),(14,'auth','0009_alter_user_last_name_max_length','2025-05-08 15:39:53.094907'),(15,'auth','0010_alter_group_name_max_length','2025-05-08 15:39:53.115764'),(16,'auth','0011_update_proxy_permissions','2025-05-08 15:39:53.125493'),(17,'auth','0012_alter_user_first_name_max_length','2025-05-08 15:39:53.194261'),(18,'restaurant','0001_initial','2025-05-08 15:41:10.060600'),(19,'restaurant','0002_alter_ban_options_alter_chitietdon_options_and_more','2025-05-08 15:41:10.065333'),(20,'sessions','0001_initial','2025-05-08 15:42:18.973498'),(21,'restaurant','0003_alter_nguoidung_options','2025-05-09 20:31:04.042279'),(22,'restaurant','0004_alter_nguoidung_options','2025-05-09 20:36:32.799078'),(23,'restaurant','0005_profile_delete_nguoidung','2025-05-10 10:02:25.025788');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('06m2fgikuk4cbowb0elqjl12mwmywsne','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDjNd:0R3URYfbtG_4nAeFF6uzM3YDqH6TlpvKUQse4f4iY0k','2025-05-24 12:32:37.787389'),('0obr8lqoiill0y9pf438elgiuuvt1da5','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDibK:5fPdXkUl-f_1YKdZRlJ6c-WZRV3cS9k2kywQ6QyTa8s','2025-05-24 11:42:42.086652'),('0qepvztfon1ccekv3otn6t6dc1qzzsos','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDiQt:6QFhS58LvaRuLZLv9rlAeSvCIkrGWnphWfvkvT2yieg','2025-05-24 11:31:55.762870'),('19pappdwgwmzr8jic72ncfbpbndk67x0','.eJxVjbEOwjAQQ_8lM4oupW0SNrozMld3uYMWqkRqWjEg_p1G6gCLB9vPfqse12Xo1yxzP7I6KQPq8GsShqfEkvAD4z3pkOIyj6RLRe9p1udpSq9NrhuTL4ll6nbwb23APJQTJhK0DRtL2JrAQnCEqhbxtnYtV46hahxgILKCaD2AwZtxUrMJXtTnC53LPgI:1uDgnI:AndtJR6jzsr6lKhbwSgrcjTHth7LkdfquBFSofe7OX4','2025-05-24 09:46:56.288107'),('1cejn4p6my6hw3ik2a65ge962is3te4k','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDjVC:_4yVIhAr7qOn57zTIQdKMfNqtZAtK8xmzXjWzSO1Aqk','2025-05-24 12:40:26.545151'),('2crm6juyig63om8qhvluxbx4nvconquw','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDjOO:TOAlF0CznG35yjcju9W0DlbYKauxr0ZtlQXsgqlB9N8','2025-05-24 12:33:24.760185'),('31aunn68pfjbdldkvx159ysr3wgcqx42','e30:1uDfgB:rm3GwQhAE4CzUjdtQ_-hyTvjo38JXYLPVnTK5t63mt0','2025-05-24 08:35:31.544524'),('3byi1s28iqb6o4rcq07a4wnq8bnfkze4','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDiVL:5fmhdQYjZj0SXcZLO5-swTTW1NmQ4bqh7uaM1WcZEC8','2025-05-24 11:36:31.160938'),('3eizrcqzcychb72t00cobrwct9wdox0e','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDibI:ms0PgS236UAW4kJw5hdGIIHvg5BzZW4ad8uSRzp14OE','2025-05-24 11:42:40.893946'),('3h9dyh5xls5slhvfuglqw5llbgxlxbmd','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDibD:Tr6t87fiwKdOsCD-ARc5Ky_S9uFTqkaYf8TnHqqMToU','2025-05-24 11:42:35.078812'),('3nqzgjftxb0rau5aobfwdtbhunhtf65t','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDjCC:hJztG_eiURfTb78_PJMw1y0uj71WCHLK8IVW27nVBkg','2025-05-24 12:20:48.701695'),('3smr9use2zg0lsi5xdxlkvvc77tcfss3','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDjDq:kGjIRgQHzrFMS5P-anKVXUR5LoOA3ZY_rbm6b-t0S_U','2025-05-24 12:22:30.443342'),('4b1786x62nb5itgxtdrsox0ml0005fjl','e30:1uDdoG:jZ2I__0zctAkp3t4oYSo-yCbV7CnVOxFiinex02P4P8','2025-05-24 06:35:44.515421'),('5f7zeai4ll3tc31bk761dt7e9hhgfd03','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDieM:b1TPq0k7v8W2xBG6IRWpTkYg_qiqW24fSL9x1huZCIg','2025-05-24 11:45:50.334375'),('6o793ic45we2hxk5s0jibwf30fl1byk1','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDicw:BYSA61NTUm-hbrJFBR1YCkYvDiSBSI5PE_iaR3pgURc','2025-05-24 11:44:22.471148'),('6thp4oys5qucwd3knmrnza5qu43xz2l3','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDib5:DxVCH_lJAPQOofBcd4vC0bOPwgoDoqgHaHWjTF2m8rY','2025-05-24 11:42:27.366744'),('6yhnz82wow9jxn62gs5qo6mblyfrd8lw','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDih6:Uf2SmFOyzEgj6kNVaMlP6NzhbzpTJ9Vn496jNmzFrZI','2025-05-24 11:48:40.661055'),('81mgagy4a2toft9ofd8k2rovmth3oh8j','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDjNe:jeUlY7jfnyjhacDkAHNGfahY1onyJ6E-T8bjJqxZimo','2025-05-24 12:32:38.487769'),('8ifywky0ue8kbgs3qzc1401eh7boqd33','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDjNb:7pF0c7fH108-wzcP9k6-GsOo2LmKE1QgGW_Yg_SajEo','2025-05-24 12:32:35.554221'),('8qp63zcf64mfyaga7lyzb9hehlhw9id3','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDih4:YhG8HCQNrv8srz1ITZpqf8Ejz4MzC1RegyHGgpOAjy8','2025-05-24 11:48:38.973566'),('8tb77tjbf3nh13cqdodxduljmsk6h8bb','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDiX3:YVYF2qx4jGnUM4FpDrdt8XBZ1S13Dsb4n5wsa5T2GMs','2025-05-24 11:38:17.931312'),('9e0nvwfq1xsux912mbg6p2fzpvlqaher','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDjDA:9NE2cqMMiimBxqOhTT5hiLcoDp2Pj-RRIlPIQw1DNME','2025-05-24 12:21:48.826841'),('9ifd4dn9luw6hmpj7kp4d4uvd6cqhmhv','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDjOP:KgI1G5IjZ3WTxNBBY2DB4u030XY1M_xTMS8TBpMgKQY','2025-05-24 12:33:25.481392'),('9ke0fsce74evu6po9hoq145tywj2x51k','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDjOO:TOAlF0CznG35yjcju9W0DlbYKauxr0ZtlQXsgqlB9N8','2025-05-24 12:33:24.087496'),('9nky3xk3896eq7cr8l1h0le29k8o24yr','e30:1uDffI:emB-2LJlXWgIJE7LSNhqdTZuLyGIHNh81O-FBVbNL5o','2025-05-24 08:34:36.788065'),('9whtncri1xn67fce1xkvb4g6migequcr','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDjNf:dbkRQf5vK8Woziw5NPlyk2wtMWXEYfvFqiMbFZaZnt4','2025-05-24 12:32:39.141221'),('9xmorg35ye43g6kcbd6u7mi9nv3bq154','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDjNY:m-vmw-r_uNVNp4Xe7UXN8w0LdwceRcbRVFvwHj7XORE','2025-05-24 12:32:32.448924'),('afywyznq0afzorfyvoahgy0ik85lfw6f','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDib9:7IluPudTQ5ztepwd2nP1DTjvVjAgzET3Wd5ZTvIESbI','2025-05-24 11:42:31.898732'),('at5rlsfg2wqlr1g019ngggmj7mi4owgh','e30:1uDgG3:PpUygdajjrWBWifZmM0toKq4q5DOdqfCKHWfNCWM91E','2025-05-24 09:12:35.411343'),('b9p8w0n35dh3efpqumnilfrk4gcbbswh','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDjJL:p7Ooe21-Fb0bC88NgDiZQf71lD2xLh5m3phbFKprLU0','2025-05-24 12:28:11.897471'),('bc33qgxt38mmhkif80ox830njakv9ai8','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDjNA:ef8jP3-xHZuPcQCAcW6mFCYWAe74pnNHyfwFkEAZ41o','2025-05-24 12:32:08.851986'),('buco9s44w1a7gv03n1tp2zgoynvsmyxq','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDjCG:iLLnHqxRpi0a7DmLmwJ4zZiHt37ppAGml9vifay7Hio','2025-05-24 12:20:52.862610'),('d2yk12mj22vt3ph2mrepy0z4f8mbkvqk','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDjDE:FpkH_Dvhnq_tDEP85CtCW_OuBOjqzq2SQUvetVVPhoA','2025-05-24 12:21:52.969501'),('dafdeodv3wp7kphawrn0jp6o4bc1vdnf','.eJxVjLkOwjAQRP_FNbJ8JD7oSE9Jba29axKIYilORIH4dxIpBTRTzMx7bxZgXfqwVprDgOzMHDv9dhHSk6Z9wAdM98JTmZZ5iHy_8GOt_DKO5bXFbWPqtSCN3QH-2Xqo_aayUUXtm5SJtDOYnRdS50YAkjVCGisdSduCsjI5IFBSZEDdtoDglbfs8wVcIj0B:1uDgZZ:ZxXdGm1Tb_Vt3IWkpsb-Z5PUlZsmma_t2KK1n9Y7qEQ','2025-05-24 09:32:45.362309'),('dn7nwrl2lshxunu63xbiwpln1868kywg','.eJxVjLkOwjAQRP_FNbJ8JD7oSE9Jba29axKIYilORIH4dxIpBTRTzMx7bxZgXfqwVprDgOzMHDv9dhHSk6Z9wAdM98JTmZZ5iHy_8GOt_DKO5bXFbWPqtSCN3QH-2Xqo_aayUUXtm5SJtDOYnRdS50YAkjVCGisdSduCsjI5IFBSZEDdtoDglbfs8wVcIj0B:1uDgYd:mrsmCbpxHmfNFzI0tIp5hzjVAZAW2Vm1I-cMFvKZ1-8','2025-05-24 09:31:47.190447'),('ds1ts1wcxzwc34hcbutywqry1283f5o5','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDieN:K_XfBVKRpVFdA8-QCK3u2oAOcMZUGlm_Pp5ZMCqZt2w','2025-05-24 11:45:51.127042'),('ea05kbhk65cypo2o0z38vdlywxjnjuh9','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDjOM:RSeAjXrnGUC-YiLq84xH77frrnW0THgLsRH8ZHBeijM','2025-05-24 12:33:22.832789'),('evyuwylgzn1n1taktvgfd6zdld5heh99','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDjDD:evqFaekkE-ltJcSvHw_-uUTxNwIBuyQJBKjCBr7qyW8','2025-05-24 12:21:51.768707'),('ewuk45ksqbjd1legrx5qummc7z63fl3m','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDjON:ykD_kBmWCvapvkWtDb0w78s4sYi7dd1kCPs90XzhkIU','2025-05-24 12:33:23.570911'),('ewvngse9h60j9dd4bhb2cftf062vve6f','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDjVE:sJza81E23lFFCy9wxKoin3QiTY1vxHY-9rKIC9-8aeM','2025-05-24 12:40:28.181592'),('f21gzounom8srliem4wlaoq47pyeu4z1','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDiYY:Jvc-ZUnvECrwvCnkXNnb35gaN1Bw5_t_JUPqYX2t5FU','2025-05-24 11:39:50.247229'),('f31wpw5l26cjwhtepryp45anlmfg77uc','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDib7:YVd4NXhj_sKdLv0Yb8I_pWeNCF4_nvIzfngxlQvHdVI','2025-05-24 11:42:29.775534'),('f4tri8a80s8z96n60pxdbuhz9awphx8d','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDieK:add83uZ8MoL5sRcelMxUrdBtlZZv8ePnGkqt-xQ5L1w','2025-05-24 11:45:48.964240'),('fvmyy2691f4bb4rt89g378rrbqarh8h3','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDiXD:jNA-_ZrpBJuer96Ryhd3guPvMkwoGnWYjbKPIaFjpow','2025-05-24 11:38:27.958638'),('fwnzr63zdbkmqp6w9urbj0dce7qhvbhf','.eJxVjLEOgjAURf-ls2naR0vBTXZH5-a17yEooQmFOBj_3ZIw6HKHe-85b-FxWwe_ZV78SOIstBan3zJgfPK8L_TA-Z5kTPO6jEHuF3msWV6mKb1K3AqTr4l46g7wzzZgHooKHLBxre6Ba4BWhUZXKraxAmPZWaTYuJpYKdsrDNaEqgZsNGAwpMiQ-HwBWJA8tg:1uDhF6:5dMq8RM0I-CRK8oNedlZDsm01qjJm8lXUkgJrCsI9uQ','2025-05-24 10:15:40.709128'),('g0183oeaqjuez5z5vit0iz10tjyety06','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDjNd:0R3URYfbtG_4nAeFF6uzM3YDqH6TlpvKUQse4f4iY0k','2025-05-24 12:32:37.085255'),('gckttv52lbd5hbk3l1f3moq58meidmm9','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDib4:dw5fB4Ko3bHmH2fLUTwYi4PY8_LSCsVcbol2xOQBsck','2025-05-24 11:42:26.303657'),('gojvgxt91pwinyckty6zfi6qpe4vzxmv','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDjOE:hcnP_aESKaIIr5qWsAEHGEZNBLrcgeTWMmctVi0MxPM','2025-05-24 12:33:14.138980'),('i82zlchcf9fxof3wanql47qfn9iluv7r','.eJxVjLkOwjAQRP_FNbJ8JD7oSE9Jba29axKIYilORIH4dxIpBTRTzMx7bxZgXfqwVprDgOzMHDv9dhHSk6Z9wAdM98JTmZZ5iHy_8GOt_DKO5bXFbWPqtSCN3QH-2Xqo_aayUUXtm5SJtDOYnRdS50YAkjVCGisdSduCsjI5IFBSZEDdtoDglbfs8wVcIj0B:1uDgZ0:iy85IsCb11X0umpTVHFwAdvJ4nz4cUGUtO82rzULtxc','2025-05-24 09:32:10.798367'),('iso7jca0ew1fprplrpdtidlfl7lgi574','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDib8:_2rvJE4pY8Myt_PTXXfnXMyrXgLUsUbKY94DrOrJZ7o','2025-05-24 11:42:30.830716'),('iu55m50kvde03dgmezisjm18x0p1dw98','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDibF:AbCYD0EBpuD83NK8FthFDGXPW0FisANIBurVVtjq4WE','2025-05-24 11:42:37.191813'),('j0uywl9axku7zknzo6nsfzg60uintebn','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDjN7:eAFV_E_QKg1NnX4TGcGxYZMnYCij3tuzlzPgs9Id4w0','2025-05-24 12:32:05.650492'),('k0v93ch94yw757f00eqhdg4fnwwukdi1','.eJxVjLkOwjAQRP_FNbJ8JD7oSE9Jba29axKIYilORIH4dxIpBTRTzMx7bxZgXfqwVprDgOzMHDv9dhHSk6Z9wAdM98JTmZZ5iHy_8GOt_DKO5bXFbWPqtSCN3QH-2Xqo_aayUUXtm5SJtDOYnRdS50YAkjVCGisdSduCsjI5IFBSZEDdtoDglbfs8wVcIj0B:1uDfdF:BBTTfASKlMUIpXvcInY-eTv1QXAuGgAx9ZGaJbrESkY','2025-05-24 08:32:29.460073'),('k8zy22nwfmx1s5j1sd7tmycr7sx9iyua','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDjDH:Lz_a9PMRySz7O0g4EZOdAWKKnsw0fR4p22JxO_VYguI','2025-05-24 12:21:55.408552'),('kkhetam5ek4pdp7wb3kxr7emjz1jdemp','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDieQ:WhmcLFdx8X_WPJhmE77Litkt2wxjB0NRLJhfsiUqV6Y','2025-05-24 11:45:54.439218'),('ks4uwxbu1hywx396wa2135vhqugjseug','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDuaz:R5Y-WF1gFCmN-mfC_L0GQi79TBVVvjY_1yS_RyhsM9A','2025-05-25 00:31:09.380297'),('kt3f0mzyvuqbty5uzkjobjwe0u40nv3j','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDjCI:FbqU9yrL-XvcM2t1CgThMrQTmAuS_2_gRBdd2wxKh_s','2025-05-24 12:20:54.105236'),('lvp422jyl1id8v7eyz5n5kw65uva9smt','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDjDC:Wyuz5w-GVQu-dgcz9HKfQ-LXHq7du4gOc5xVSbHm3RU','2025-05-24 12:21:50.526567'),('m6fuz743ijvbn77qnbpl9e3pydb064t0','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDiVN:Q19flJYEVHT_zoUZPKeuj18Hl4mU5wIyyvwGzL8iiyk','2025-05-24 11:36:33.331431'),('mkhkqsghvlngpu0vdtb8bybqve9a07xd','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDub4:hzgbGnhWlfktq7TBmDqo94tgKghDJSUPDMvFGBmQysY','2025-05-25 00:31:14.163156'),('mva3udck42dqlk3aomdsp1pb5vzccqrx','e30:1uDff9:0LtJpQ6KqHcAzmTb3OkC1pvWPqqK7xEnP9eumNMP5xs','2025-05-24 08:34:27.909975'),('nusn4wfryoyhaswbndhwngphfoyoyl7y','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDjNc:jIGzkIu7L2n15Q_zcUkzXEzIghCxg6g0ReIPhwl223k','2025-05-24 12:32:36.378085'),('nx42e0bkd9tv4tvokq9zz66qtywh46c6','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDub2:Ojtgo4zKUUazfg6cQIRpW18NcecunisiE0DVqJn5IC0','2025-05-25 00:31:12.013912'),('o02jvyzdulppkixx69x9nyt1y7ojc8te','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDih3:afOIDr77yd1uB5EmyF2vw4r1GVNKLQYl7eA_1TzzHvo','2025-05-24 11:48:37.623574'),('ob5rwhcfv60gadfzs9enddo96hsu2q2x','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDiVS:eJ448IQdYvKZ13qAv1wqbnX1RjFW20c6DLK1tkSPbUQ','2025-05-24 11:36:38.100063'),('obqemmy8cgbvbeyjfnrieu4qw7tjp32v','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDiXC:boaJt9G9j_6M69qhMCwwPIQKPTr-pA4lSyKyoyiE-Ug','2025-05-24 11:38:26.988146'),('ocp31dcd585bg8otrg4gy0gwcfgyybze','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDjNz:F8nPqm-mdaqAM4NrP8pKsGR9n6zoBqWLHoz9sgPKFJA','2025-05-24 12:32:59.552066'),('ofawfzn6ijmy74bfhov8dr7nflepw7t4','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDiX5:GWCwbxXG9wEoWNZG9Bg6q-dvLX__0tOK0-Gw-kBori0','2025-05-24 11:38:19.205712'),('oqwhfgbb71xg94wmos212bcjdyxduwbd','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDiYb:9qJQ1VEejk7GRbpfj0uoca6KD5WgH9TvOQB6mRj5ZsI','2025-05-24 11:39:53.762573'),('pb2zpn97i6ou9vehj2wl7q2zajhyysb3','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDiVU:YgyyglQAUahnzw6A5UBwBfljqvTG6ILZ-l4bb1ZlHQY','2025-05-24 11:36:40.938046'),('pbkkewc65a7c9i03x2lpe8eicd65ntff','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDjCF:qnG9VQpUhw8Q-4EbbVteIPx2hyvDYemMchGL_l-r6zg','2025-05-24 12:20:51.363311'),('pnla8b6f3qnlhygpxbd21ploftgl4a13','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDieP:ohNk6aBeVDNRsyD5IAaXVenvB6cT9aIovJ1AniLs2-A','2025-05-24 11:45:53.117693'),('qnac6i1tl0fmcemrbj1mc8w8qb9cbnet','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDib1:B9Kw29V0sodEZVpjlOpFI9NQvOxbXFTIpIRt6Moiz1E','2025-05-24 11:42:23.177877'),('qnahqrkfewzd1581zyejby323fmevaq0','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDiaz:h4ryjHPdMCLpbeY_VPRF1hQDPsonbWZethIEMxQ7LW8','2025-05-24 11:42:21.598759'),('r1mdb3qhvzbf7b8w2e367ch6y0n9ke83','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDiX6:jLwZYqjzNCHNjLsEOK7K4ejEn7nQU3ra4KMWrk0LAsA','2025-05-24 11:38:20.480037'),('rn15900zq1rag1429d5gqtbweb2qu7co','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDiR1:LkHDxm7dm8cffbA4Chj_ZVrV3jKvwTG6hpkHsVPR3Ck','2025-05-24 11:32:03.178667'),('s00463fml6h6d5eobe0lrbkosuzy629x','e30:1uDdop:e_2bIS1nocRgu95LegeRoHN59x0ONmhcrqasq4HoqMw','2025-05-24 06:36:19.788778'),('s0frr2ft8tvz84n554jtq455poa1689x','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDjN9:o8mVzEJsxvNG_V-Qgp8Tuf1dGbY1FVxcsd-NAFeuxf8','2025-05-24 12:32:07.725569'),('sl263oxdae04pxeuvgtzml6q667q2ljv','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDiXF:uPNUdehoJBZxshmJ7abbJgAiLClu4w_bGOdTp02TPvI','2025-05-24 11:38:29.147848'),('susbw1mo3r9kqrbmugxhwtsl038nruug','e30:1uDdlb:XsfETx5FTSszvKsy361sKWxQxN3Jb-OPPzkDcAZ9gDY','2025-05-24 06:32:59.338586'),('sw2e1lgjq3losgat5o82b2dgtmyl94f3','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDib3:ooUT9MJntmYre2eXJnkNCB5KsGOME1oY0uetXmzWObA','2025-05-24 11:42:25.303595'),('tutg4xrkj6k99eizp2qpc4m6a37wnml2','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDiVT:CvSNrmcBXHcHe6-xp5PrB3gv-dhWqCuIs5XlEWdgYRQ','2025-05-24 11:36:39.603643'),('uawf02ucosok7vfif02zorsnts25091a','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDiYa:mdWA4vpkfYLq-oy8jZVBSiQJU_7orUU1XF3iJoTMve0','2025-05-24 11:39:52.864505'),('ulwir5o0klvlq7hitis36g8v4o2ub95p','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDiQg:eN25BjbMgYnS-vNU074snMbrvkbKptyfPb6fr_0AolA','2025-05-24 11:31:42.738542'),('vdbnd2qaesmf4v50ps5s72g1andry4fb','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDibH:j_IFKK1gev1CPslSQVlvtDOiXh2IWccEKNCcutes2f4','2025-05-24 11:42:39.470351'),('wwdx1dypf1e7265nh9htb828n444za4g','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDjNC:qOAE_0HCu0Acs3yp8_RKJarp_gOs_sch3ErlUF_VnUY','2025-05-24 12:32:10.048580'),('xkuhknh2nsnhi4dwyl9mdm5xp8wc1j17','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDjOQ:KABpmoRg2papuy2VnIvUxngj1q8Cri140JwA_8DMGVQ','2025-05-24 12:33:26.412398'),('xu6ilegpccl0856rn62kj5h6a9ymtiov','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDib2:HkACd3xJtoq_jhFJXiZ3a3qglnzTSua0W6HnpFYOUXQ','2025-05-24 11:42:24.263902'),('xzjordefionmovput0hsbveacaff94vg','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDjNE:ZJQ3ZD1snauLzMk_tVHfKzOiTIywAtByY2fbauDR9eg','2025-05-24 12:32:12.280740'),('y8sla7calorjqov216jos4iiy3imryil','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDjND:E36UK_9wMQ7cMwzjrylYH6hr3wGVffd3M_BrmANG9lM','2025-05-24 12:32:11.194464'),('y9ortswqkcm5tfm3rkb2mdhx00szic7t','.eJxVjLEOgjAURf-ls2naR0vBTXZH5-a17yEooQmFOBj_3ZIw6HKHe-85b-FxWwe_ZV78SOIstBan3zJgfPK8L_TA-Z5kTPO6jEHuF3msWV6mKb1K3AqTr4l46g7wzzZgHooKHLBxre6Ba4BWhUZXKraxAmPZWaTYuJpYKdsrDNaEqgZsNGAwpMiQ-HwBWJA8tg:1uDgno:DpeerKprp_ZLweIv2bT8_bmJds45QjFj8yMlrT1oKI4','2025-05-24 09:47:28.050002'),('z9s8wbfxbllwei2ptiwb7feupy131b66','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDjDG:2bl3H2tkeGfiSiLvujsIB9_fXqGkDWRaqRG_HpClfGg','2025-05-24 12:21:54.214124'),('zgzm6xkne7dz84v09xuxb50sahzjxeyb','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDib6:8dXue5Cc6e33evngfqEjij4BpNXrbWj65JWDEEAOpCg','2025-05-24 11:42:28.411331'),('zrvvvw82droqoq0q70ti24qzqg73hbz9','.eJxVjTEPgjAUhP9LZ9O0j5aCm-yOzuS17yEoaRMKcTD-d2nCoMsNd_fdvUWP2zr2W-aln0icBYjTr-cxPDmWgB4Y70mGFNdl8rJU5JFmeZnn9NrltjP5mojn7gD_1kbMY_lwwMa1egCuAVrlG12p0IYKjGVnkULjamKl7KDQW-OrGrDRgN6QIkPi8wUyyDyG:1uDjNa:VxA8f1rX3baI8Mcg0jfGUzyJrKGg1VgAjN566THBIMg','2025-05-24 12:32:34.566612');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donhang`
--

DROP TABLE IF EXISTS `donhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donhang` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `IDDatBan` int NOT NULL,
  `TongTien` decimal(10,2) DEFAULT '0.00',
  `TrangThai` varchar(20) DEFAULT 'Đang xử lý',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IDDatBan` (`IDDatBan`),
  CONSTRAINT `donhang_ibfk_1` FOREIGN KEY (`IDDatBan`) REFERENCES `datban` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donhang`
--

LOCK TABLES `donhang` WRITE;
/*!40000 ALTER TABLE `donhang` DISABLE KEYS */;
INSERT INTO `donhang` VALUES (16,58,210000.00,'Đã Xác Nhận'),(17,59,210000.00,'Đã Xác Nhận'),(18,60,490000.00,'Đã Xác Nhận'),(19,61,230000.00,'Đã Xác Nhận'),(20,62,375000.00,'Đã Xác Nhận'),(21,63,220000.00,'Đã Xác Nhận'),(22,64,650000.00,'Đã Xác Nhận'),(23,65,265000.00,'Đã Xác Nhận'),(24,66,145000.00,'Đã Xác Nhận'),(25,67,315000.00,'Đã Xác Nhận'),(26,68,515000.00,'Đã Xác Nhận'),(27,69,170000.00,'Đã Xác Nhận'),(28,70,610000.00,'Đã Xác Nhận');
/*!40000 ALTER TABLE `donhang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loaimonan`
--

DROP TABLE IF EXISTS `loaimonan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loaimonan` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TenLoai` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loaimonan`
--

LOCK TABLES `loaimonan` WRITE;
/*!40000 ALTER TABLE `loaimonan` DISABLE KEYS */;
INSERT INTO `loaimonan` VALUES (1,'Món chính'),(2,'Món khai vị'),(3,'Món tráng miệng'),(4,'Món Lẩu'),(5,'Món mặn'),(6,'Món nướng'),(7,'Món nước'),(8,'Nước uống');
/*!40000 ALTER TABLE `loaimonan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monan`
--

DROP TABLE IF EXISTS `monan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `monan` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TenMon` varchar(100) NOT NULL,
  `Gia` int DEFAULT NULL,
  `IDLoai` int DEFAULT NULL,
  `HinhAnh` varchar(255) DEFAULT NULL,
  `MoTa` text,
  PRIMARY KEY (`ID`),
  KEY `IDLoai` (`IDLoai`),
  CONSTRAINT `monan_ibfk_1` FOREIGN KEY (`IDLoai`) REFERENCES `loaimonan` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monan`
--

LOCK TABLES `monan` WRITE;
/*!40000 ALTER TABLE `monan` DISABLE KEYS */;
INSERT INTO `monan` VALUES (135,'Phở đặt biệt',80000,1,'/images/anh1.png','Thịt bò tái, nạm, gân đa dạng'),(136,'Phở tái',70000,1,'/images/anh2.png','Thịt bò tái mềm, ngọt tự nhiên'),(137,'Phở gà',69000,1,'/images/anh3.png','Gà luộc xé nhỏ, nước dùng thanh'),(138,'Gà nướng mật ong',120000,1,'/images/anh4.png','Gà ướp mật ong, da giòn vàng'),(139,'Gà Xào Sả Ớt',79000,5,'/images/anh5.png','Gà xào sả ớt cay, thơm lừng'),(140,'Tôm Sú Nướng Muối Ớt',127000,6,'/images/anh6.png','Tôm nướng muối ớt giữ vị ngọt'),(141,'Lẩu Hải Sản Chua Cay',280000,4,'/images/anh7.png','Lẩu hải sản chua cay kiểu Thái'),(142,'Cơm Gà Hải Nam',85000,1,'/images/anh8.png','Cơm gà thơm, nước chấm gừng'),(143,'Bún Chả Hà Nội',75000,1,'/images/anh9.png','Thịt nướng thơm, bún rau sống'),(144,'Cá Kho Tộ',90000,5,'/images/anh10.png','Cá kho đậm đà nước mắm'),(145,'Bánh Xèo Tôm Thịt',70000,1,'/images/anh11.png','Bánh xèo giòn rụm, nhân tôm thịt'),(146,'Gỏi Cuốn Tôm Thịt',50000,2,'/images/anh12.png','Gỏi cuốn tôm thịt, rau sống'),(147,'Chả Giò Chiên Giòn',60000,2,'/images/anh13.png','Chả giò giòn, nhân đa dạng'),(148,'Gỏi Đu Đủ Bò Khô',65000,2,'/images/anh14.png','Gỏi đu đủ bò khô, đậu phộng'),(149,'Bánh Bèo Huế',55000,2,'/images/anh15.png','Bánh bèo tôm cháy, mỡ hành'),(150,'Súp Cua Trứng',60000,2,'/images/anh16.png','Súp cua trứng, ngô, nấm thơm'),(151,'Bánh Canh Cua',80000,7,'/images/anh17.png','Bánh canh cua giò heo sánh'),(152,'Bún Riêu Cua',70000,7,'/images/anh18.png','Bún riêu cua chua nhẹ, đậu'),(153,'Hủ Tiếu Nam Vang',75000,7,'/images/anh19.png','Hủ tiếu tôm thịt, trứng cút'),(154,'Mì Quảng',70000,7,'/images/anh20.png','Mì Quảng tôm thịt, đậu phộng'),(155,'Bún Bò Huế',80000,7,'/images/anh21.png','Bún bò Huế cay nồng, sả'),(156,'Cơm Tấm Sườn Bì Chả',85000,1,'/images/anh22.png','Cơm tấm sườn, bì, chả đậm'),(157,'Bò Lúc Lắc Khoai Tây',90000,1,'/images/anh23.png','Bò lúc lắc sốt đậm, khoai'),(158,'Lẩu Gà Lá É',280000,4,'/images/anh24.png','Lẩu gà lá é thơm mát'),(159,'Lẩu Thái Hải Sản',300000,4,'/images/anh25.png','Lẩu Thái hải sản chua cay'),(160,'Chè Ba Màu',30000,3,'/images/anh26.png','Chè ba màu đậu và thạch'),(161,'Chè Khúc Bạch',35000,3,'/images/anh27.png','Chè khúc bạch hạnh nhân béo'),(162,'Sữa Chua Nếp Cẩm',25000,3,'/images/anh28.png','Sữa chua nếp cẩm dẻo thơm'),(163,'Rau Câu Dừa',20000,3,'/images/anh29.png','Rau câu dừa hai lớp béo'),(164,'Bánh Flan Caramel',25000,3,'/images/anh30.png','Bánh flan caramel mềm mịn'),(165,'Kem Dừa',35000,3,'/images/anh31.png','Kem dừa mát, đậu phộng giòn'),(166,'Chuối Nếp Nướng',20000,3,'/images/anh32.png','Chuối nếp nướng thơm, chan nước'),(167,'Trái Cây Dầm Sữa',30000,3,'/images/anh33.png','Trái cây dầm sữa mát ngọt'),(168,'Chè Bắp',25000,3,'/images/anh34.png','Chè bắp nước cốt dừa béo'),(169,'Chè Thái',35000,3,'/images/anh35.png','Chè Thái thạch mít sầu riêng'),(170,'Nước Mía Tắc',15000,8,'/images/anh36.png','Nước mía tắc mát lạnh'),(171,'Trà Đào Cam Sả',25000,8,'/images/anh37.png','Trà đào cam sả tươi mát'),(172,'Sinh Tố Bơ',30000,8,'/images/anh38.png','Sinh tố bơ sánh mịn'),(173,'Nước Chanh Dây',20000,8,'/images/anh39.png','Nước chanh dây chua ngọt'),(174,'Trà Sữa Trân Châu',35000,8,'/images/anh40.png','Trà sữa trân châu béo, dai'),(175,'Nước Dừa Tươi',25000,8,'/images/anh41.png','Nước dừa tươi mát lạnh'),(176,'Sinh Tố Dâu',30000,8,'/images/anh42.png','Sinh tố dâu tươi, ngọt mát'),(177,'Sinh Tố Xoài',30000,8,'/images/anh43.png','Sinh tố xoài tươi, ngọt mát');
/*!40000 ALTER TABLE `monan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nguoidung`
--

DROP TABLE IF EXISTS `nguoidung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nguoidung` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `IDVaiTro` int NOT NULL DEFAULT '3',
  `HoTen` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `SDT` varchar(20) NOT NULL,
  `MatKhau` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Email` (`Email`),
  KEY `IDVaiTro` (`IDVaiTro`),
  CONSTRAINT `nguoidung_ibfk_1` FOREIGN KEY (`IDVaiTro`) REFERENCES `vaitro` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nguoidung`
--

LOCK TABLES `nguoidung` WRITE;
/*!40000 ALTER TABLE `nguoidung` DISABLE KEYS */;
INSERT INTO `nguoidung` VALUES (1,3,'Nguyễn Văn Khánh','khanh@gmail.com','0987654321','pbkdf2_sha256$870000$Rv6rIzeckHxZXR6RIct7Ge$1IIP+Kv/72U9YQsGL8ai9DntqDj/wjAjq3Kc94vS+MY='),(2,3,'Nguyễn Văn A','khanh1@gmail.com','0123456789','pbkdf2_sha256$870000$dcmJSZK29Fhqz436wmiSKy$MwHE/zZa70zLDdCgfeYYTwVXhWKn+7BAIiGyTNTDMsE='),(12,3,'Nguyễn Văn A','khanhgg@gmail.com','0123456789','pbkdf2_sha256$870000$REnEmAcFyadDbquSWq3Jns$dcjKEjq5iN8fsu+U1pbpjRHl1S3dJ/wW6OHGGJxqsxQ='),(13,3,'kjhgfds','khanh5@gmail.com','098765432','pbkdf2_sha256$870000$cHp4whbF5KWUaDkeqn5BW8$5rZJiUq0apxsfU66Y0T6JahjtpiCRgZLvlkbWCZMjvc='),(14,3,'ưeffffefe','khanh10@gmail.com','0976676453','pbkdf2_sha256$870000$c4sFxeAuWL15l6rUA8OsSn$YQkDiP2uX5e5aAyMlJSNuZDT/rU6HCWv4tESqIriB78=');
/*!40000 ALTER TABLE `nguoidung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thanhtoan`
--

DROP TABLE IF EXISTS `thanhtoan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thanhtoan` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `IDDonHang` int NOT NULL,
  `SoTien` decimal(10,2) NOT NULL,
  `PhuongThuc` varchar(20) NOT NULL,
  `TrangThai` varchar(20) DEFAULT 'Thành công',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IDDonHang` (`IDDonHang`),
  CONSTRAINT `thanhtoan_ibfk_1` FOREIGN KEY (`IDDonHang`) REFERENCES `donhang` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thanhtoan`
--

LOCK TABLES `thanhtoan` WRITE;
/*!40000 ALTER TABLE `thanhtoan` DISABLE KEYS */;
INSERT INTO `thanhtoan` VALUES (1,16,210000.00,'Chuyển khoản','Thành công'),(2,17,210000.00,'Chuyển khoản','Thành công'),(3,18,490000.00,'Chuyển khoản','Thành công'),(4,19,230000.00,'Thẻ tín dụng','Thành công'),(5,20,375000.00,'Chuyển khoản','Thành công'),(6,21,220000.00,'Chuyển khoản','Thành công'),(7,22,650000.00,'Chuyển khoản','Thành công'),(8,23,265000.00,'Chuyển khoản','Thành công'),(9,24,145000.00,'Chuyển khoản','Thành công'),(10,25,315000.00,'Chuyển khoản','Thành công'),(11,26,515000.00,'Chuyển khoản','Thành công'),(12,27,170000.00,'Chuyển khoản','Thành công'),(13,28,610000.00,'Chuyển khoản','Thành công');
/*!40000 ALTER TABLE `thanhtoan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vaitro`
--

DROP TABLE IF EXISTS `vaitro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vaitro` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TenVaiTro` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vaitro`
--

LOCK TABLES `vaitro` WRITE;
/*!40000 ALTER TABLE `vaitro` DISABLE KEYS */;
INSERT INTO `vaitro` VALUES (1,'Admin'),(2,'Nhân Viên'),(3,'Người Dùng');
/*!40000 ALTER TABLE `vaitro` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-13 21:29:17
