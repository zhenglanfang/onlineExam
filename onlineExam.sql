-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: localhost    Database: onlineExam
-- ------------------------------------------------------
-- Server version	5.7.22-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group__permission_id_17ec85890dbdac5d_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group__permission_id_17ec85890dbdac5d_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permission_group_id_2c281876eb43144d_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth__content_type_id_36109a79c979c380_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add chapter items',7,'add_chapteritems'),(20,'Can change chapter items',7,'change_chapteritems'),(21,'Can delete chapter items',7,'delete_chapteritems'),(22,'Can add student info',8,'add_studentinfo'),(23,'Can change student info',8,'change_studentinfo'),(24,'Can delete student info',8,'delete_studentinfo'),(25,'Can add teacher info',9,'add_teacherinfo'),(26,'Can change teacher info',9,'change_teacherinfo'),(27,'Can delete teacher info',9,'delete_teacherinfo'),(28,'Can add questions',10,'add_questions'),(29,'Can change questions',10,'change_questions'),(30,'Can delete questions',10,'delete_questions'),(31,'Can add exam info',11,'add_examinfo'),(32,'Can change exam info',11,'change_examinfo'),(33,'Can delete exam info',11,'delete_examinfo'),(34,'Can add paper info',12,'add_paperinfo'),(35,'Can change paper info',12,'change_paperinfo'),(36,'Can delete paper info',12,'delete_paperinfo'),(37,'Can add answer records',13,'add_answerrecords'),(38,'Can change answer records',13,'change_answerrecords'),(39,'Can delete answer records',13,'delete_answerrecords'),(40,'Can add answer',14,'add_answer'),(41,'Can change answer',14,'change_answer'),(42,'Can delete answer',14,'delete_answer');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_58bf8c0efbb67993_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_58bf8c0efbb67993_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_54043160d78fed41_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_u_permission_id_3da8871625ab20a1_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_u_permission_id_3da8871625ab20a1_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissi_user_id_5b566782256609a5_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `djang_content_type_id_5925ab32e4b0049c_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_72c6790122544f52_fk_auth_user_id` (`user_id`),
  CONSTRAINT `djang_content_type_id_5925ab32e4b0049c_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_72c6790122544f52_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_7e1cb94ae1cf2f65_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(14,'exam','answer'),(13,'exam','answerrecords'),(7,'exam','chapteritems'),(11,'exam','examinfo'),(12,'exam','paperinfo'),(10,'exam','questions'),(6,'sessions','session'),(8,'user','studentinfo'),(9,'user','teacherinfo');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-11-13 13:41:59.902458'),(2,'auth','0001_initial','2017-11-13 13:42:00.710857'),(3,'admin','0001_initial','2017-11-13 13:42:00.889154'),(4,'contenttypes','0002_remove_content_type_name','2017-11-13 13:42:03.143562'),(5,'auth','0002_alter_permission_name_max_length','2017-11-13 13:42:03.185043'),(6,'auth','0003_alter_user_email_max_length','2017-11-13 13:42:03.279070'),(7,'auth','0004_alter_user_username_opts','2017-11-13 13:42:03.290382'),(8,'auth','0005_alter_user_last_login_null','2017-11-13 13:42:03.682506'),(9,'auth','0006_require_contenttypes_0002','2017-11-13 13:42:03.684278'),(10,'exam','0001_initial','2017-11-13 13:42:03.905915'),(11,'sessions','0001_initial','2017-11-13 13:42:04.012042'),(12,'user','0001_initial','2017-11-17 07:57:53.836453'),(13,'exam','0002_auto_20171117_1557','2017-11-17 07:57:56.548120'),(14,'exam','0003_auto_20171120_1034','2017-11-20 02:34:34.242081');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('4j8zzdo1ab0s6swo042nll8mo3ptktch','OTZlMmU3MGMwYmE5MDc2MjA0YjI4OGE2NDQ4NWM2ZjZiYjZlY2JlNTp7InN1YmplY3RfaWQiOiIxIiwidXNlcmlkIjoiMSJ9','2017-12-06 03:35:16.590834'),('5s81wfq4rrjq0y7psuuf1cblf3pzjr46','OTZlMmU3MGMwYmE5MDc2MjA0YjI4OGE2NDQ4NWM2ZjZiYjZlY2JlNTp7InN1YmplY3RfaWQiOiIxIiwidXNlcmlkIjoiMSJ9','2017-12-01 13:30:13.832213'),('i923f7ywixk7hyybyf5i19j58sz8dec3','ZjI4MjljY2NiMDZmODMwNGYwMjY5NjI5YTI5YWM0NzAwYzYwNThmNzp7fQ==','2017-12-02 03:21:14.069669'),('kqg8ul68dxmmw4hpdb1s1twmki0b0lim','ZjI4MjljY2NiMDZmODMwNGYwMjY5NjI5YTI5YWM0NzAwYzYwNThmNzp7fQ==','2017-12-02 03:21:31.184059'),('n3opa1gtzr8ry7osctaw6472m6mh9iad','ZjI4MjljY2NiMDZmODMwNGYwMjY5NjI5YTI5YWM0NzAwYzYwNThmNzp7fQ==','2017-12-02 03:21:19.286924'),('rja0gdtsc4misjrzba52z8nn7p25kitt','ZjI4MjljY2NiMDZmODMwNGYwMjY5NjI5YTI5YWM0NzAwYzYwNThmNzp7fQ==','2017-12-02 03:21:25.741387');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_answer`
--

DROP TABLE IF EXISTS `exam_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_answer` varchar(300) NOT NULL,
  `score` int(11) NOT NULL,
  `answer_record_id` int(11) NOT NULL,
  `que_id` int(11) NOT NULL,
  `stu_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `exam_answer_3e84199c` (`answer_record_id`),
  KEY `exam_answer_c7b7791d` (`que_id`),
  KEY `exam_answer_e753610b` (`stu_id`),
  CONSTRAINT `exam__answer_record_id_6ba44ede6d845c6c_fk_exam_answerrecords_id` FOREIGN KEY (`answer_record_id`) REFERENCES `exam_answerrecords` (`id`),
  CONSTRAINT `exam_answer_que_id_6eb5a4f57a904fcd_fk_exam_questions_id` FOREIGN KEY (`que_id`) REFERENCES `exam_questions` (`id`),
  CONSTRAINT `exam_answer_stu_id_4b249562b65866c8_fk_user_studentinfo_id` FOREIGN KEY (`stu_id`) REFERENCES `user_studentinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_answer`
--

LOCK TABLES `exam_answer` WRITE;
/*!40000 ALTER TABLE `exam_answer` DISABLE KEYS */;
INSERT INTO `exam_answer` VALUES (1,'B',0,1,1,1),(2,'1',1,2,39,1),(3,'1',1,2,45,1),(4,'1',0,2,48,1),(5,'1',0,2,40,1),(6,'1',1,2,46,1),(7,'0',1,3,44,1),(8,'1',0,3,43,1),(9,'0',1,3,22,1),(10,'0',0,3,12,1),(11,'1',0,3,41,1),(12,'1',0,4,40,1),(13,'0',1,4,48,1),(14,'1',1,4,12,1),(15,'1',0,4,43,1),(16,'0',1,4,41,1),(17,'C',0,5,1,1),(18,'C',0,6,1,1),(19,'0',1,7,43,1),(20,'1',0,7,41,1),(21,'1',0,7,40,1),(22,'0',0,7,12,1),(23,'0',1,7,48,1),(24,' a                       ',0,8,49,1),(25,'      a                  ',0,8,50,1),(26,' a                       ',0,8,24,1),(27,' a                       ',0,8,51,1),(28,' a                       ',0,8,52,1),(29,'C',0,9,4,1),(30,'D',1,10,6,1);
/*!40000 ALTER TABLE `exam_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_answerrecords`
--

DROP TABLE IF EXISTS `exam_answerrecords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam_answerrecords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `answer_date` date NOT NULL,
  `chapter_id` int(11) DEFAULT NULL,
  `exam_id` int(11),
  `stu_id` int(11) NOT NULL,
  `used_time` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `exam_answerr_chapter_id_450074f0ab3f33f8_fk_exam_chapteritems_id` (`chapter_id`),
  KEY `exam_answerrecords_09631ec7` (`exam_id`),
  KEY `exam_answerrecords_e753610b` (`stu_id`),
  CONSTRAINT `exam_answerr_chapter_id_450074f0ab3f33f8_fk_exam_chapteritems_id` FOREIGN KEY (`chapter_id`) REFERENCES `exam_chapteritems` (`id`),
  CONSTRAINT `exam_answerrecord_stu_id_4bbb9c4350b898a1_fk_user_studentinfo_id` FOREIGN KEY (`stu_id`) REFERENCES `user_studentinfo` (`id`),
  CONSTRAINT `exam_answerrecords_exam_id_43e668f158b94f4c_fk_exam_examinfo_id` FOREIGN KEY (`exam_id`) REFERENCES `exam_examinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_answerrecords`
--

LOCK TABLES `exam_answerrecords` WRITE;
/*!40000 ALTER TABLE `exam_answerrecords` DISABLE KEYS */;
INSERT INTO `exam_answerrecords` VALUES (1,'2017-11-20',11,NULL,1,'0:0:2'),(2,'2017-11-20',11,NULL,1,'0:8:29'),(3,'2017-11-20',11,NULL,1,'0:0:5'),(4,'2017-11-20',11,NULL,1,'0:0:8'),(5,'2017-11-20',11,NULL,1,'0:0:2'),(6,'2017-11-20',11,NULL,1,'0:0:2'),(7,'2017-11-20',11,NULL,1,'0:0:5'),(8,'2017-11-20',11,NULL,1,'0:1:6'),(9,'2017-11-20',14,NULL,1,'0:0:1'),(10,'2017-11-20',16,NULL,1,'0:0:2');
/*!40000 ALTER TABLE `exam_answerrecords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_chapteritems`
--

DROP TABLE IF EXISTS `exam_chapteritems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam_chapteritems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ctitle` varchar(30) NOT NULL,
  `subject_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exam_chapter_subject_id_422d548b89de7a60_fk_exam_chapteritems_id` (`subject_id`),
  CONSTRAINT `exam_chapter_subject_id_422d548b89de7a60_fk_exam_chapteritems_id` FOREIGN KEY (`subject_id`) REFERENCES `exam_chapteritems` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_chapteritems`
--

LOCK TABLES `exam_chapteritems` WRITE;
/*!40000 ALTER TABLE `exam_chapteritems` DISABLE KEYS */;
INSERT INTO `exam_chapteritems` VALUES (1,'人工智能+Python',NULL),(11,'第一章 Linux操作系统基础',1),(12,'第二章 Python语法基础',1),(13,'第三章 Python核心编程 ',1),(14,'第四章 数据结构和算法',1),(15,'第五章 数据库',1),(16,'第六章 Web前端',1),(17,'第七章 Django',1),(18,'第八章 爬虫',1),(19,'第九章 Tornado',1),(20,'第十章 人工智能基础',1),(21,'第十一章 人工智能进阶',1);
/*!40000 ALTER TABLE `exam_chapteritems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_examinfo`
--

DROP TABLE IF EXISTS `exam_examinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam_examinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL,
  `exam_time` datetime(6) NOT NULL,
  `total_time` varchar(10) NOT NULL,
  `mark` int(11) NOT NULL,
  `tea_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `exam_examinfo_tea_id_764cc0f28fcba9f5_fk_user_teacherinfo_id` (`tea_id`),
  CONSTRAINT `exam_examinfo_tea_id_764cc0f28fcba9f5_fk_user_teacherinfo_id` FOREIGN KEY (`tea_id`) REFERENCES `user_teacherinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_examinfo`
--

LOCK TABLES `exam_examinfo` WRITE;
/*!40000 ALTER TABLE `exam_examinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_examinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_examinfo_stu`
--

DROP TABLE IF EXISTS `exam_examinfo_stu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam_examinfo_stu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `examinfo_id` int(11) NOT NULL,
  `studentinfo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `examinfo_id` (`examinfo_id`,`studentinfo_id`),
  KEY `exam_exam_studentinfo_id_64acff12f5cdad94_fk_user_studentinfo_id` (`studentinfo_id`),
  CONSTRAINT `exam_exam_studentinfo_id_64acff12f5cdad94_fk_user_studentinfo_id` FOREIGN KEY (`studentinfo_id`) REFERENCES `user_studentinfo` (`id`),
  CONSTRAINT `exam_examinfo_s_examinfo_id_4c012e625d9c6d28_fk_exam_examinfo_id` FOREIGN KEY (`examinfo_id`) REFERENCES `exam_examinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_examinfo_stu`
--

LOCK TABLES `exam_examinfo_stu` WRITE;
/*!40000 ALTER TABLE `exam_examinfo_stu` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_examinfo_stu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_paperinfo`
--

DROP TABLE IF EXISTS `exam_paperinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam_paperinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_id` int(11) NOT NULL,
  `que_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `exam_paperinfo_exam_id_a4a84a75dd173b8_fk_exam_examinfo_id` (`exam_id`),
  KEY `exam_paperinfo_c7b7791d` (`que_id`),
  CONSTRAINT `exam_paperinfo_exam_id_a4a84a75dd173b8_fk_exam_examinfo_id` FOREIGN KEY (`exam_id`) REFERENCES `exam_examinfo` (`id`),
  CONSTRAINT `exam_paperinfo_que_id_67fd341686a6c26c_fk_exam_questions_id` FOREIGN KEY (`que_id`) REFERENCES `exam_questions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_paperinfo`
--

LOCK TABLES `exam_paperinfo` WRITE;
/*!40000 ALTER TABLE `exam_paperinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_paperinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_questions`
--

DROP TABLE IF EXISTS `exam_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `que_type` varchar(10) NOT NULL,
  `que_content` varchar(500) NOT NULL,
  `que_A` varchar(30) DEFAULT NULL,
  `que_B` varchar(30) DEFAULT NULL,
  `que_C` varchar(30) DEFAULT NULL,
  `que_D` varchar(30) DEFAULT NULL,
  `que_answer` varchar(600) NOT NULL,
  `level` varchar(1) NOT NULL,
  `point_value` int(11) NOT NULL DEFAULT '0',
  `chapter_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exam_questio_chapter_id_79a5319751527f19_fk_exam_chapteritems_id` (`chapter_id`),
  CONSTRAINT `exam_questio_chapter_id_79a5319751527f19_fk_exam_chapteritems_id` FOREIGN KEY (`chapter_id`) REFERENCES `exam_chapteritems` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_questions`
--

LOCK TABLES `exam_questions` WRITE;
/*!40000 ALTER TABLE `exam_questions` DISABLE KEYS */;
INSERT INTO `exam_questions` VALUES (1,'1','本课程的目标定位是什么?','学习Python语言','学习计算机的工作原理','学习各种算法','学习用计算机解决问题','A','1',1,11),(2,'1','下列哪个标识符是合法的?','var-name','!@#$%','_100','elif','D','1',1,12),(3,'1','执行下列语句后的显示结果是什么? >>> world=”world” \r\n>>> print “hello”+ world','helloworld','“hello”world','hello world','语法错  ','A','1',1,13),(4,'1','算法是指: ','数学的计算公式','程序设计语言的语句序列','对问题的精确描述','解决问题的精确步骤','D','2',1,14),(5,'1','type(1+2L*3.14)的结果是: [A] <type ‘int’>','<type ‘long’>','<type ‘int’> ','<type ‘float’>','<type ‘str’>','C','3',1,15),(6,'1','在创建Linux分区时，一定要创建（ D ）两个分区','FAT/NTFS ',' FAT/SWAP','NTFS/SWAP ','SWAP/根分区 ','D','1',1,16),(7,'2','函数eval()用于数值表达式求值,例如eval(2*3+1)。',NULL,NULL,NULL,NULL,'0','1',1,17),(8,'2','执行了import math之后即可执行语句print sin(pi/2)',NULL,NULL,NULL,NULL,'0','2',1,18),(9,'3','写出下列程序的运行结果：五、def func(s, i, j):\r\nif i < j:\r\n    func(s, i + 1, j - 1)   \r\ns[i],s[j] = s[j], s[i]   \r\ndef main():\r\na = [10, 6, 23, -90, 0, 3]\r\nfunc(a, 0, len(a)-1)\r\nfor i in range(6):\r\nprint  a[i]\r\nprint \"\\n\" \r\nmain()','',NULL,NULL,NULL,'3 \r\n0 \r\n‐90 \r\n23 \r\n6 \r\n10','3',5,19),(10,'1','当登录Linux时，一个具有唯一进程ID号的shell将被调用，这个ID是什么','NID',' PID','UID','CID','B','2',1,20),(11,'2','成批添加用户的命令是  newuser ',NULL,NULL,NULL,NULL,'1','1',1,21),(12,'2','将前一个命令的标准输出作为后一个命令的标准输入，称之为   管道        \r\n ',NULL,NULL,NULL,NULL,'1','1',1,11),(13,'1','选出对下列语句不符合语法要求的表达式：','range(0,10)','”Hello”','(1,2,3)','{1,2,3,4,5}','D','1',1,12),(14,'2','选择排序算法是一个时间复杂度为nlogn算法',NULL,NULL,NULL,NULL,'0','1',1,13),(15,'2','Hanoi塔的解法体现了分而治之(divide-and-conquer)方法的典型用途',NULL,NULL,NULL,NULL,'0','1',1,14),(16,'2','一个函数中只允许有一条return语句',NULL,NULL,NULL,NULL,'0','1',1,15),(17,'2','存在一个程序判别一个Python程序的运行是否可以停止。',NULL,NULL,NULL,NULL,'0','1',1,16),(18,'2','Python语言是面向对象的。',NULL,NULL,NULL,NULL,'1','1',1,17),(19,'2','可用open(“file1”,”r”）方式打开文件并进行修改。',NULL,NULL,NULL,NULL,'0','1',1,18),(20,'2','一个函数中只允许有一条return语句。',NULL,NULL,NULL,NULL,'0','1',0,19),(21,'2','Hanoi塔的解法体现了分而治之(divide-and-conquer)方法的典型用途。',NULL,NULL,NULL,NULL,'0','1',0,20),(22,'2','选择排序算法是一个时间复杂度为nlogn算法。',NULL,NULL,NULL,NULL,'0','1',0,11),(23,'2','Python可以不对变量如a初始化就可在表达式如b=a+1中使用该变量。',NULL,NULL,NULL,NULL,'0','1',0,12),(24,'3','五、(1)．打印100～200间的全部素数,输出格式为每行10个：\r\n[----1----]\r\nn = 0  \r\nfor m in range(101, 201, 2):\r\n   k = int(math.sqrt(m))\r\n   for i in range([----2----], k+1):\r\n      if m % i == 0:    \r\n [----3----]  \r\n if i == [----4----]:\r\nif n % 10 == 0:   \r\n print \"\\n\" \r\n 	print \"%d \" % m,\r\n     [--  5  --] ',NULL,NULL,NULL,NULL,'import math \r\n2 \r\nbreak \r\nk \r\nn += 1','3',0,11),(25,'3','五、(1)．打印100～200间的全部素数,输出格式为每行10个：\r\n[----1----]\r\nn = 0  \r\nfor m in range(101, 201, 2):\r\n   k = int(math.sqrt(m))\r\n   for i in range([----2----], k+1):\r\n      if m % i == 0:    \r\n [----3----]  \r\n if i == [----4----]:\r\nif n % 10 == 0:   \r\n print \"\\n\" \r\n 	print \"%d \" % m,\r\n     [--  5  --] ',NULL,NULL,NULL,NULL,'import math \r\n2 \r\nbreak \r\nk \r\nn += 1','3',0,13),(26,'3','def func(a,b):\r\n     if (a < b):\r\n         a, b = b, a\r\n     r = a % b\r\n     if r == 0:\r\n          return b\r\n     else:\r\n          return func(b,r)\r\n  ans = func(342,84) \r\n  print ans ',NULL,NULL,NULL,NULL,'6','3',0,14),(27,'3','def foo(list,num):\r\nif num == 1:\r\n             list.append(0)\r\n    elif num == 2:\r\n             foo(list,1)\r\n            list.append(1)\r\n    elif num > 2:\r\n             foo(list,num-1)\r\n             list.append(list[-1]+list[-2])\r\nmylist = []\r\nfoo(mylist,10) \r\nprint mylist ',NULL,NULL,NULL,NULL,'[0, 1, 1, 2, 3, 5, 8, 13, 21, 34]','3',0,15),(32,'1','本课程的目标定位是什么?','学习用计算机解决问题','学习Python语言','学习计算机的工作原理','学习各种算法','A','1',1,11),(34,'1','下列哪个标识符是合法的?','elif','var-name','!@#$%','_100','A','1',1,11),(35,'1','对n个数做归并排序(merge sort),这个算法是:','logn时间的','线性时间的','nlogn时间的','n2时间的','D','1',1,11),(36,'1','程序设计的原型(Prototyping)方法是指: ','先设计程序框架结构,再逐步精化细节','先设计类,再实例化为对象','先设计简单版本,再逐步增加功能','以上都不是','C','1',0,11),(37,'1','达式1+2L*3.14>0的结果类型是:','int','long','float','bool','B','1',0,11),(38,'1','执行下列语句后的显示结果是什么? \r\n>>> s = ”GOOD MORNING”\r\n>>> print s[3:-4]','D MOR		','D MORN	','OD MOR	','OD MORN','A','2',0,11),(39,'2','高级语言程序要被机器执行,只有用解释器来解释执行.',NULL,NULL,NULL,NULL,'1','1',0,11),(40,'2','不同类型的数据不能相互运算. ',NULL,NULL,NULL,NULL,'0','2',0,11),(41,'2','由于引号表示字符串的开始和结束,所以字符串本身不能包含引号',NULL,NULL,NULL,NULL,'0','1',0,11),(42,'2','计算机科学并非研究计算机的科学,正如天文学并非研究望远镜.  ',NULL,NULL,NULL,NULL,'1','1',0,11),(43,'2','算法和程序是不同的概念.',NULL,NULL,NULL,NULL,'0','1',0,11),(44,'2','面的程序段是错的:                                        \r\ntemp = 42 \r\nprint \"The temperature is\" + temp',NULL,NULL,NULL,NULL,'0','1',0,11),(45,'2','同一Python变量可以先后赋予不同类型的值. ',NULL,NULL,NULL,NULL,'1','1',0,11),(46,'2','计算机的计算是确定的,因此并不能真正产生随机数.',NULL,NULL,NULL,NULL,'1','1',0,11),(47,'2','对象就是类的实例.',NULL,NULL,NULL,NULL,'0','1',0,11),(48,'2','Hanoi塔问题属于不可解问题. ',NULL,NULL,NULL,NULL,'0','1',0,11),(49,'3','编写程序: 输入一个文件A, A中每行包含若干数值.生成文件B, B中每行是A中对应行的数值的平均值.',NULL,NULL,NULL,NULL,'Import string\r\nfileA  =  raw_input(“Enter a data file:  ”)\r\ninfile  =  open(fileA,’r’)\r\noutfile  =  open (‘B.dat’,’w’)\r\n\r\nline  =  infile.readline()\r\nwhile line  != “”：\r\n	sum  =  0.0\r\n	count  =  0\r\n	for xStr in string.split(line):\r\n		sum  =  sum  +  eval(xStr)\r\n		count  =  count  + 1\r\n	avg  =  sum/count\r\n	outfile.write(str(avg)+’n’)\r\n	line  =  infile.readline()\r\n\r\ninfile.close()\r\noutfile.close()','1',0,11),(50,'3','用分而治之(divide and conquer)和递归方法设计程序:产生并打印一个序列的全排列.\r\n例如,序列[1,2,3]的全排列123,132,213,231,312,321可以这样获得:\r\n1为前缀, 后接[2,3]的全排列\r\n2为前缀, 后接[1,3]的全排列\r\n3为前缀, 后接[1,2]的全排列\r\n而[2,3]等序列的全排列依此类推.\r\n下面给出了这个程序的部分代码,在理解上述算法的基础上补足所缺的代码.\r\n# 函数perm(list,k,m):产生前缀为list[0:k]后接list[k:m+1]的全排列\r\ndef perm(list,k,m):',NULL,NULL,NULL,NULL,'def perm(list,k,m):\r\n    if k == m:                        \r\n        for i in    range(m+1)①    :\r\n            print list[i],\r\n        print\r\n    else:\r\n        for i in   range(k,m+1) ②   :\r\n            list[k],list[i] = list[i],list[k]\r\n            perm(list,k+1,m)  ③      \r\n            list[k],list[i] = list[i],list[k]   \r\nmyList = input(“Input a list([1,2,3,...]): “)\r\nperm(myList,0,    len(myList)-1 ④   )','1',0,11),(51,'3','下面程序的功能是什么?\r\ndef f(a, b):\r\nif b == 0:\r\n        print a\r\nelse:\r\n        f(b, a%b)\r\n\r\na, b = input(“Enter two natural numbers: ”)\r\nprint f(a, b)',NULL,NULL,NULL,NULL,'def f(a, b):\r\nif b == 0:\r\n        print a\r\nelse:\r\n        f(b, a%b)\r\n\r\na, b = input(“Enter two natural numbers: ”)\r\nprint f(a, b)','1',0,11),(52,'3','下面程序的输出是什么?\r\ndef f(a, b, c):\r\nx = y = 0\r\nfor i in range(c):\r\n        x = x + a + y\r\ny = y + b\r\nreturn x\r\nprint f(-5, 2, 10)',NULL,NULL,NULL,NULL,'下面程序的输出是什么?','1',0,11);
/*!40000 ALTER TABLE `exam_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_studentinfo`
--

DROP TABLE IF EXISTS `user_studentinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_studentinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_name` varchar(20) NOT NULL,
  `stu_pwd` varchar(40) NOT NULL,
  `grade` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_studentinfo`
--

LOCK TABLES `user_studentinfo` WRITE;
/*!40000 ALTER TABLE `user_studentinfo` DISABLE KEYS */;
INSERT INTO `user_studentinfo` VALUES (1,'夏明','123456','1707PythonB');
/*!40000 ALTER TABLE `user_studentinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_teacherinfo`
--

DROP TABLE IF EXISTS `user_teacherinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_teacherinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tea_name` varchar(20) NOT NULL,
  `tea_pwd` varchar(40) NOT NULL,
  `tea_introduction` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_teacherinfo`
--

LOCK TABLES `user_teacherinfo` WRITE;
/*!40000 ALTER TABLE `user_teacherinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_teacherinfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-24 18:15:41
