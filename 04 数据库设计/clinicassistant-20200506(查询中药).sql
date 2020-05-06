-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: clinicassistant
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (208);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `item_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `item_name` varchar(50) NOT NULL COMMENT '品目名称',
  `item_type` varchar(10) NOT NULL COMMENT '品目分类（1：中草药；2：中成药；3：中药饮片；4：医疗耗材；5：其他耗材；字典键：CGPMFL）',
  `item_small_type` varchar(50) DEFAULT NULL COMMENT '品目小类',
  `barcode` varchar(50) DEFAULT NULL COMMENT '条形码',
  `abbr_pinyin` varchar(50) DEFAULT NULL COMMENT '简拼',
  `full_pinyin` varchar(500) DEFAULT NULL COMMENT '全拼',
  `source` varchar(50) DEFAULT NULL COMMENT '方剂出处',
  `flavor_meridian_tropism` varchar(100) DEFAULT NULL COMMENT '性味归经',
  `function` varchar(100) DEFAULT NULL COMMENT '方剂功用',
  `efficacy` varchar(500) DEFAULT NULL COMMENT '功能主治',
  `component` varchar(500) DEFAULT NULL COMMENT '成分',
  `specifications` varchar(100) DEFAULT NULL COMMENT '规格',
  `usage_dosage` varchar(500) DEFAULT NULL COMMENT '用法用量',
  `analysis` varchar(1000) DEFAULT NULL COMMENT '方解',
  `poem` varchar(100) DEFAULT NULL COMMENT '方歌',
  `taboo` varchar(500) DEFAULT NULL COMMENT '禁忌',
  `producer` varchar(100) DEFAULT NULL COMMENT '厂家制造商，产地',
  `is_poison` tinyint(1) unsigned DEFAULT '0' COMMENT '是否有毒（1：是；0：否）',
  `pur_unit` varchar(10) DEFAULT NULL COMMENT '进货包装',
  `stock_unit` varchar(10) DEFAULT NULL COMMENT '零售单位',
  `unit_convert` int(10) unsigned DEFAULT NULL COMMENT '单位换算',
  `stock_warn` decimal(16,6) unsigned DEFAULT NULL COMMENT '库存预警值，保留6位小数可以精确到微克',
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='品目管理表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_acupoint`
--

DROP TABLE IF EXISTS `item_acupoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_acupoint` (
  `item_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '品目ID',
  `item_name` varchar(50) NOT NULL COMMENT '腧穴名称',
  `abbr_pinyin` varchar(50) DEFAULT NULL COMMENT '简拼',
  `full_pinyin` varchar(500) DEFAULT NULL COMMENT '全拼',
  `item_type` varchar(10) NOT NULL COMMENT '所属经络',
  `location` varchar(500) DEFAULT NULL COMMENT '定位',
  `efficacy` varchar(500) DEFAULT NULL COMMENT '主治',
  `operation` varchar(100) DEFAULT NULL COMMENT '操作',
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='腧穴表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_acupoint`
--

LOCK TABLES `item_acupoint` WRITE;
/*!40000 ALTER TABLE `item_acupoint` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_acupoint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_all`
--

DROP TABLE IF EXISTS `item_all`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_all` (
  `item_uid` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `item_id` bigint(20) NOT NULL COMMENT '品目ID',
  `item_name` varchar(50) NOT NULL COMMENT '品目名称',
  `item_type` varchar(50) NOT NULL COMMENT '品目分类（1：中草药；2：中成药；3：中药饮片；4：医疗耗材；5：其他耗材；字典键：CGPMFL）',
  PRIMARY KEY (`item_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='品目管理总表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_all`
--

LOCK TABLES `item_all` WRITE;
/*!40000 ALTER TABLE `item_all` DISABLE KEYS */;
INSERT INTO `item_all` VALUES (1,3,'黄芪','HerbalMedicine'),(2,2,'元胡止痛片','PatentMedicine'),(3,1,'酒精','MedicalSupply'),(4,2,'酒精1','MedicalSupply'),(5,3,'酒精2','MedicalSupply'),(6,4,'酒精24','MedicalSupply'),(7,5,'酒精244','MedicalSupply'),(8,6,'酒精6','MedicalSupply'),(9,7,'酒精苗期','MedicalSupply'),(10,1,'方便袋','Consumable'),(11,1,'方便袋','Consumable'),(12,1,'方便袋1','Consumable'),(13,1,'足太阴脾经','Meridian'),(14,1,'白虎汤','Prescription'),(15,1,'针灸','Skill');
/*!40000 ALTER TABLE `item_all` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_consumable`
--

DROP TABLE IF EXISTS `item_consumable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_consumable` (
  `item_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '品目ID',
  `item_name` varchar(50) NOT NULL COMMENT '耗材名称',
  `abbr_pinyin` varchar(50) DEFAULT NULL COMMENT '简拼',
  `full_pinyin` varchar(500) DEFAULT NULL COMMENT '全拼',
  `specifications` varchar(100) DEFAULT NULL COMMENT '规格',
  `producer` varchar(100) DEFAULT NULL COMMENT '品牌厂家',
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='其他耗材表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_consumable`
--

LOCK TABLES `item_consumable` WRITE;
/*!40000 ALTER TABLE `item_consumable` DISABLE KEYS */;
INSERT INTO `item_consumable` VALUES (1,'方便袋1',NULL,NULL,'50只/包','河北1');
/*!40000 ALTER TABLE `item_consumable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_herbal_medicine`
--

DROP TABLE IF EXISTS `item_herbal_medicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_herbal_medicine` (
  `item_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '品目ID',
  `item_name` varchar(50) NOT NULL COMMENT '中药名称',
  `abbr_pinyin` varchar(50) DEFAULT NULL COMMENT '简拼',
  `full_pinyin` varchar(500) DEFAULT NULL COMMENT '全拼',
  `item_type` varchar(50) DEFAULT NULL COMMENT '中药分类',
  `flavor_meridian_tropism` varchar(100) DEFAULT NULL COMMENT '性味归经',
  `efficacy` varchar(50) DEFAULT NULL COMMENT '功效',
  `application` varchar(1000) DEFAULT NULL COMMENT '应用',
  `usage_dosage` varchar(500) DEFAULT NULL COMMENT '用法用量',
  `taboo` varchar(500) DEFAULT NULL COMMENT '禁忌',
  `producer` varchar(100) DEFAULT NULL COMMENT '产地',
  `is_poison` tinyint(1) unsigned DEFAULT '0' COMMENT '是否有毒（1：是；0：否）',
  `pur_unit` varchar(10) DEFAULT NULL COMMENT '进货包装',
  `stock_unit` varchar(10) DEFAULT NULL COMMENT '零售单位',
  `unit_convert` int(10) unsigned DEFAULT NULL COMMENT '单位换算',
  `stock_warn` decimal(16,6) unsigned DEFAULT NULL COMMENT '库存预警值，保留6位小数可以精确到微克',
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='中药表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_herbal_medicine`
--

LOCK TABLES `item_herbal_medicine` WRITE;
/*!40000 ALTER TABLE `item_herbal_medicine` DISABLE KEYS */;
INSERT INTO `item_herbal_medicine` VALUES (3,'黄芪','HQ','huangqi','','辛甘温，归肺经','补气',NULL,'10-15g','所属',NULL,NULL,'2','1',500,500.000000);
/*!40000 ALTER TABLE `item_herbal_medicine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_medical_supply`
--

DROP TABLE IF EXISTS `item_medical_supply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_medical_supply` (
  `item_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '品目ID',
  `item_name` varchar(50) NOT NULL COMMENT '用品名称',
  `abbr_pinyin` varchar(50) DEFAULT NULL COMMENT '简拼',
  `full_pinyin` varchar(500) DEFAULT NULL COMMENT '全拼',
  `barcode` varchar(50) DEFAULT NULL COMMENT '条形码',
  `specifications` varchar(100) DEFAULT NULL COMMENT '规格',
  `producer` varchar(100) DEFAULT NULL COMMENT '品牌厂家',
  `pur_unit` varchar(10) DEFAULT NULL COMMENT '进货包装',
  `stock_unit` varchar(10) DEFAULT NULL COMMENT '零售单位',
  `unit_convert` int(10) unsigned DEFAULT NULL COMMENT '单位换算',
  `stock_warn` decimal(16,6) unsigned DEFAULT NULL COMMENT '库存预警值，保留6位小数可以精确到微克',
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='医疗用品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_medical_supply`
--

LOCK TABLES `item_medical_supply` WRITE;
/*!40000 ALTER TABLE `item_medical_supply` DISABLE KEYS */;
INSERT INTO `item_medical_supply` VALUES (1,'酒精','JJ','jiujing',NULL,'500ml/瓶','杭州欧拓普','17','6',50,5.000000),(2,'酒精1','JJ1','jiujing1',NULL,'500ml/瓶','杭州欧拓普','17','6',50,5.000000),(3,'酒精2','JJ2','jiujing2',NULL,'500ml/瓶','杭州欧拓普','17','6',50,5.000000),(4,'酒精24','JJ2','jiujing24',NULL,'500ml/瓶','杭州欧拓普','17','6',50,5.000000),(5,'酒精244','JJ2','jiujing244',NULL,'500ml/瓶','杭州欧拓普','17','6',50,5.000000),(6,'酒精6','JJ6','jiujing6',NULL,'500ml/瓶','杭州欧拓普','17','6',50,5.000000),(7,'酒精苗期','JJMQ','jiujingmiaoqi',NULL,'sss','ssss','1','1',22,2.000000);
/*!40000 ALTER TABLE `item_medical_supply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_meridian`
--

DROP TABLE IF EXISTS `item_meridian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_meridian` (
  `item_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '品目ID',
  `item_name` varchar(50) NOT NULL COMMENT '经络名称',
  `abbr_pinyin` varchar(50) DEFAULT NULL COMMENT '简拼',
  `full_pinyin` varchar(500) DEFAULT NULL COMMENT '全拼',
  `item_type` varchar(10) NOT NULL COMMENT '经络分类',
  `circulation_route` varchar(1000) DEFAULT NULL COMMENT '循行部位',
  `functions` varchar(500) DEFAULT NULL COMMENT '基本功能',
  `original_text` varchar(500) DEFAULT NULL COMMENT '原文（灵枢经脉）',
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='经络表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_meridian`
--

LOCK TABLES `item_meridian` WRITE;
/*!40000 ALTER TABLE `item_meridian` DISABLE KEYS */;
INSERT INTO `item_meridian` VALUES (1,'足太阴脾经','ZTYPJ','zutaiyinpijing','','sss',NULL,'对对对');
/*!40000 ALTER TABLE `item_meridian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_patent_medicine`
--

DROP TABLE IF EXISTS `item_patent_medicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_patent_medicine` (
  `item_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '品目ID',
  `item_name` varchar(50) NOT NULL COMMENT '成药名称',
  `abbr_pinyin` varchar(50) DEFAULT NULL COMMENT '简拼',
  `full_pinyin` varchar(500) DEFAULT NULL COMMENT '全拼',
  `barcode` varchar(50) DEFAULT NULL COMMENT '条形码',
  `item_type` varchar(10) DEFAULT NULL COMMENT '成药分类',
  `component` varchar(500) DEFAULT NULL COMMENT '组成',
  `functions` varchar(100) DEFAULT NULL COMMENT '功用',
  `efficacy` varchar(500) DEFAULT NULL COMMENT '主治',
  `usage_dosage` varchar(500) DEFAULT NULL COMMENT '用法用量',
  `specifications` varchar(100) DEFAULT NULL COMMENT '规格',
  `taboo` varchar(500) DEFAULT NULL COMMENT '禁忌',
  `producer` varchar(100) DEFAULT NULL COMMENT '厂家制造商',
  `is_poison` tinyint(1) unsigned DEFAULT '0' COMMENT '是否有毒（1：是；0：否）',
  `pur_unit` varchar(10) DEFAULT NULL COMMENT '进货包装',
  `stock_unit` varchar(10) DEFAULT NULL COMMENT '零售单位',
  `unit_convert` int(10) unsigned DEFAULT NULL COMMENT '单位换算',
  `stock_warn` decimal(16,6) unsigned DEFAULT NULL COMMENT '库存预警值，保留6位小数可以精确到微克',
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='成药表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_patent_medicine`
--

LOCK TABLES `item_patent_medicine` WRITE;
/*!40000 ALTER TABLE `item_patent_medicine` DISABLE KEYS */;
INSERT INTO `item_patent_medicine` VALUES (1,'元胡止痛片','YHZTP','yuanhuzhitongpian',NULL,'4','醋延胡索，白芷',NULL,'用于气滞血瘀的胃痛，胁痛，头痛及痛经','口服，一次4-6片，一日3次','12*2','尚不明确','商丘市金马药业有限公司',0,'3','5',1,5.000000),(2,'元胡止痛片','YHZTP','yuanhuzhitongpian',NULL,'','试试',NULL,'试试','','','','',NULL,'3','5',1,2.000000);
/*!40000 ALTER TABLE `item_patent_medicine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_prescription`
--

DROP TABLE IF EXISTS `item_prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_prescription` (
  `item_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '品目ID',
  `item_name` varchar(50) NOT NULL COMMENT '方剂名称',
  `abbr_pinyin` varchar(50) DEFAULT NULL COMMENT '简拼',
  `full_pinyin` varchar(500) DEFAULT NULL COMMENT '全拼',
  `barcode` varchar(50) DEFAULT NULL COMMENT '条形码',
  `item_type` varchar(50) DEFAULT NULL COMMENT '方剂分类',
  `source` varchar(50) DEFAULT NULL COMMENT '方剂出处',
  `component` varchar(500) DEFAULT NULL COMMENT '组成',
  `usage_dosage` varchar(500) DEFAULT NULL COMMENT '用法用量',
  `functions` varchar(100) DEFAULT NULL COMMENT '功用',
  `efficacy` varchar(500) DEFAULT NULL COMMENT '主治',
  `analysis` varchar(1000) DEFAULT NULL COMMENT '方解',
  `poem` varchar(100) DEFAULT NULL COMMENT '方歌',
  `taboo` varchar(500) DEFAULT NULL COMMENT '禁忌',
  `is_poison` tinyint(1) unsigned DEFAULT '0' COMMENT '是否有毒（1：是；0：否）',
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='方剂表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_prescription`
--

LOCK TABLES `item_prescription` WRITE;
/*!40000 ALTER TABLE `item_prescription` DISABLE KEYS */;
INSERT INTO `item_prescription` VALUES (1,'白虎汤','BHT','baihutang',NULL,'','1','石膏','1',NULL,'胃热','1','1','1',0);
/*!40000 ALTER TABLE `item_prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_skill`
--

DROP TABLE IF EXISTS `item_skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_skill` (
  `item_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '品目ID',
  `item_name` varchar(50) NOT NULL COMMENT '项目名称',
  `abbr_pinyin` varchar(50) DEFAULT NULL COMMENT '简拼',
  `full_pinyin` varchar(500) DEFAULT NULL COMMENT '全拼',
  `unit_price` decimal(12,2) unsigned DEFAULT NULL COMMENT '单价',
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='医疗项目表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_skill`
--

LOCK TABLES `item_skill` WRITE;
/*!40000 ALTER TABLE `item_skill` DISABLE KEYS */;
INSERT INTO `item_skill` VALUES (1,'针灸','ZJ','zhenjiu',40.00);
/*!40000 ALTER TABLE `item_skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `med_skill`
--

DROP TABLE IF EXISTS `med_skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `med_skill` (
  `skill_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `skill_name` varchar(50) DEFAULT NULL COMMENT '项目名称',
  `unit_price` decimal(12,2) unsigned DEFAULT NULL COMMENT '单价',
  PRIMARY KEY (`skill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='医技项目';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `med_skill`
--

LOCK TABLES `med_skill` WRITE;
/*!40000 ALTER TABLE `med_skill` DISABLE KEYS */;
INSERT INTO `med_skill` VALUES (1,'电针',30.00),(3,'艾灸',40.00),(4,'药饼灸',50.00);
/*!40000 ALTER TABLE `med_skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medical_record`
--

DROP TABLE IF EXISTS `medical_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medical_record` (
  `record_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `register_number` varchar(10) DEFAULT NULL COMMENT '就诊号',
  `arrive_time` varchar(20) DEFAULT NULL COMMENT '就诊时间',
  `patient_name` varchar(10) DEFAULT NULL COMMENT '患者姓名',
  `patient_sex` tinyint(1) unsigned DEFAULT NULL COMMENT '患者性别',
  `patient_age` varchar(5) DEFAULT NULL COMMENT '年龄',
  `patient_phone` varchar(15) DEFAULT NULL COMMENT '电话',
  `patient_job` varchar(20) DEFAULT NULL COMMENT '职业',
  `patient_address` varchar(50) DEFAULT NULL COMMENT '住址',
  `self_speak` varchar(500) DEFAULT NULL COMMENT '主诉',
  `medical_history` varchar(500) DEFAULT NULL COMMENT '病史',
  `look_smell_ask_press` varchar(500) DEFAULT NULL COMMENT '望闻切诊',
  `analysis` varchar(500) DEFAULT NULL COMMENT '辩证分析',
  `diagnosis` varchar(100) DEFAULT NULL COMMENT '诊断',
  `therapeutic_method` varchar(100) DEFAULT NULL COMMENT '治法',
  `prescription_type` varchar(10) DEFAULT NULL COMMENT '处方类型（1：中药方；2：中成药方；3：医技项目；），可多选，用逗号分隔',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='病历';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_record`
--

LOCK TABLES `medical_record` WRITE;
/*!40000 ALTER TABLE `medical_record` DISABLE KEYS */;
INSERT INTO `medical_record` VALUES (1,NULL,'2019-10-27 11:29','孙悟空',1,'28Y','15613305755','妖怪','周楼',NULL,NULL,'事实上试试','事实上试试','风寒感冒','辛温解表','3',NULL),(3,NULL,'2019-10-27 17:0','孙悟空',1,'15Y','15613305755','妖怪','周楼',NULL,NULL,'事实上','事实上','风寒感冒','辛温解表','2,3',NULL),(4,NULL,'2019-10-28 20:26','孙悟空12',1,'23Y','15613305755','妖怪','周楼',NULL,NULL,'事实上','大大','风寒感冒','辛温解表','2',NULL),(6,NULL,'2019-10-28 20:30','孙悟空21',1,'23Y','15613305755','妖怪','周楼',NULL,NULL,'的地方','的','风寒感冒','辛温解表','1,2',NULL),(7,NULL,'2019-11-3 15:43','孙悟空',1,'28Y','15613305755','妖怪','周楼',NULL,NULL,'啦啦啦啦','啪啪啪','风寒感冒','辛温解表','3','2019-11-03 15:44:38'),(8,NULL,'2019-11-3 16:12','',1,'Y','','','',NULL,NULL,'','','','','3','2019-11-03 16:12:29'),(9,NULL,'2019-11-3 16:14','',1,'Y','','','',NULL,NULL,'','','','','3','2019-11-03 16:14:46'),(10,NULL,'2019-11-3 16:54','',1,'Y','','','',NULL,NULL,'','','','','2','2019-11-03 16:54:58'),(11,NULL,'2019-11-3 16:58','',1,'Y','','','',NULL,NULL,'','','','','2','2019-11-03 16:58:29'),(12,NULL,'2019-11-3 17:0','',1,'Y','','','',NULL,NULL,'','','','','2','2019-11-03 17:08:33');
/*!40000 ALTER TABLE `medical_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medical_record_rx`
--

DROP TABLE IF EXISTS `medical_record_rx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medical_record_rx` (
  `record_rx_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `record_id` bigint(20) unsigned NOT NULL COMMENT '病历ID',
  `rx_type` tinyint(1) NOT NULL COMMENT '处方类型（1：中药方；2：中成药方；3：医技项目）',
  `dose_count` int(2) unsigned DEFAULT NULL COMMENT '剂数',
  `single_money` decimal(12,2) unsigned DEFAULT NULL COMMENT '单剂金额',
  `usage_dose` varchar(100) DEFAULT NULL COMMENT '用法用量',
  `total_money` decimal(12,2) unsigned DEFAULT NULL COMMENT '总金额',
  `advice` varchar(100) DEFAULT NULL COMMENT '医嘱',
  PRIMARY KEY (`record_rx_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='病历处方';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_record_rx`
--

LOCK TABLES `medical_record_rx` WRITE;
/*!40000 ALTER TABLE `medical_record_rx` DISABLE KEYS */;
INSERT INTO `medical_record_rx` VALUES (1,1,3,NULL,NULL,NULL,350.00,'啊啊啊'),(5,3,2,NULL,NULL,NULL,30.00,'DD'),(6,3,3,NULL,NULL,NULL,90.00,'BB'),(7,4,2,NULL,NULL,NULL,30.00,'CC'),(8,6,1,3,NULL,NULL,54.00,'DD'),(9,6,2,NULL,NULL,NULL,30.00,'啊啊啊'),(10,7,3,NULL,NULL,NULL,240.00,'密密麻麻'),(11,8,3,NULL,NULL,NULL,150.00,''),(12,9,3,NULL,NULL,NULL,180.00,''),(13,10,2,NULL,NULL,NULL,150.00,''),(14,11,2,NULL,NULL,NULL,150.00,''),(16,12,2,NULL,NULL,NULL,300.00,'');
/*!40000 ALTER TABLE `medical_record_rx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medical_record_rx_detail`
--

DROP TABLE IF EXISTS `medical_record_rx_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medical_record_rx_detail` (
  `rx_detail_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `record_id` bigint(20) DEFAULT NULL COMMENT '病历ID',
  `rx_type` tinyint(1) DEFAULT NULL COMMENT '处方类型',
  `skill_id` bigint(20) unsigned DEFAULT NULL COMMENT '医技项目ID',
  `pharmacy_item_id` bigint(20) DEFAULT NULL COMMENT '药房品目ID',
  `dose` decimal(12,2) DEFAULT NULL COMMENT '剂量/数量/诊疗次数',
  `unit_name` varchar(10) DEFAULT NULL COMMENT '单位',
  `usage_dose` varchar(50) DEFAULT NULL COMMENT '用法用量',
  `unit_price` decimal(12,2) DEFAULT NULL COMMENT '单价',
  `total_money` decimal(12,2) DEFAULT NULL COMMENT '金额',
  PRIMARY KEY (`rx_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='病历处方明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_record_rx_detail`
--

LOCK TABLES `medical_record_rx_detail` WRITE;
/*!40000 ALTER TABLE `medical_record_rx_detail` DISABLE KEYS */;
INSERT INTO `medical_record_rx_detail` VALUES (1,1,3,1,NULL,5.00,NULL,NULL,30.00,150.00),(2,1,3,3,NULL,5.00,NULL,NULL,40.00,200.00),(5,3,2,NULL,11,NULL,NULL,NULL,NULL,30.00),(6,3,3,1,NULL,3.00,NULL,NULL,30.00,90.00),(7,4,2,NULL,11,NULL,NULL,NULL,NULL,30.00),(8,6,1,NULL,2,30.00,NULL,NULL,NULL,NULL),(9,6,1,NULL,1,6.00,NULL,NULL,NULL,NULL),(10,6,2,NULL,19,NULL,NULL,NULL,NULL,30.00),(11,7,3,1,NULL,3.00,NULL,NULL,30.00,90.00),(12,7,3,4,NULL,3.00,NULL,NULL,50.00,150.00),(13,8,3,1,NULL,5.00,NULL,NULL,30.00,150.00),(14,9,3,1,NULL,6.00,NULL,NULL,30.00,180.00),(15,10,2,NULL,19,NULL,NULL,NULL,NULL,150.00),(16,11,2,NULL,19,NULL,NULL,NULL,NULL,150.00),(18,12,2,NULL,19,NULL,NULL,NULL,NULL,300.00);
/*!40000 ALTER TABLE `medical_record_rx_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medical_skill`
--

DROP TABLE IF EXISTS `medical_skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medical_skill` (
  `skill_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `skill_name` varchar(50) DEFAULT NULL COMMENT '项目名称',
  `unit_price` decimal(12,2) unsigned DEFAULT NULL COMMENT '单价',
  PRIMARY KEY (`skill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='医技项目';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_skill`
--

LOCK TABLES `medical_skill` WRITE;
/*!40000 ALTER TABLE `medical_skill` DISABLE KEYS */;
INSERT INTO `medical_skill` VALUES (1,'电针',30.00),(3,'艾灸',40.00),(4,'药饼灸',50.00);
/*!40000 ALTER TABLE `medical_skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescription`
--

DROP TABLE IF EXISTS `prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescription` (
  `prescription_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `prescription_name` varchar(20) NOT NULL COMMENT '方剂名称',
  `abbreviation` varchar(20) DEFAULT NULL COMMENT '方剂简称',
  `catalogue_id` int(10) unsigned NOT NULL COMMENT '方剂目录ID:解表剂,补气剂等',
  `prescription_type` varchar(10) NOT NULL COMMENT '方剂类型（1：经方，2：验方，3：时方，4：单方，5：偏方，6：秘方）',
  `prescription_source` varchar(20) DEFAULT NULL COMMENT '方剂出处',
  `prescription_component` varchar(1000) NOT NULL COMMENT '方剂组成（JSON格式的字符串）',
  `taking_method` varchar(100) DEFAULT NULL COMMENT '服用方法',
  `prescription_function` varchar(100) NOT NULL COMMENT '方剂功用',
  `prescription_attending` varchar(500) NOT NULL COMMENT '方剂主治',
  `prescription_explain` varchar(2000) DEFAULT NULL COMMENT '方解',
  `prescription_taboo` varchar(100) DEFAULT NULL COMMENT '禁忌',
  `prescription_song` varchar(100) DEFAULT NULL COMMENT '方歌',
  PRIMARY KEY (`prescription_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='处方';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription`
--

LOCK TABLES `prescription` WRITE;
/*!40000 ALTER TABLE `prescription` DISABLE KEYS */;
INSERT INTO `prescription` VALUES (5,'当归补血汤',NULL,35,'010','伤寒论','黄芪30g  当归6g','日三次，空腹服用','补血','血虚','','','');
/*!40000 ALTER TABLE `prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pur_item`
--

DROP TABLE IF EXISTS `pur_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pur_item` (
  `pur_item_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `pur_item_name` varchar(50) NOT NULL COMMENT '品目名称',
  `pur_item_type` varchar(10) NOT NULL COMMENT '品目分类（1：中草药；2：中成药；3：中药饮片；4：医疗耗材；5：其他耗材；字典键：CGPMFL）',
  `barcode` varchar(50) DEFAULT NULL COMMENT '条形码',
  `abbr_pinyin` varchar(50) DEFAULT NULL COMMENT '简拼',
  `full_pinyin` varchar(500) DEFAULT NULL COMMENT '全拼',
  `flavor_meridian_tropism` varchar(100) DEFAULT NULL COMMENT '性味归经',
  `efficacy` varchar(500) DEFAULT NULL COMMENT '功效，功能主治',
  `component` varchar(500) DEFAULT NULL COMMENT '成分',
  `specifications` varchar(100) DEFAULT NULL COMMENT '规格',
  `usage_dosage` varchar(500) DEFAULT NULL COMMENT '用法用量',
  `taboo` varchar(500) DEFAULT NULL COMMENT '禁忌',
  `producer` varchar(100) DEFAULT NULL COMMENT '厂家制造商，产地',
  `is_poison` tinyint(1) unsigned DEFAULT '0' COMMENT '是否有毒（1：是；0：否）',
  `pur_unit` varchar(10) DEFAULT NULL COMMENT '采购单位',
  `stock_unit` varchar(10) DEFAULT NULL COMMENT '库存单位',
  `unit_convert` int(10) unsigned DEFAULT NULL COMMENT '单位换算',
  `stock_warn` decimal(16,6) unsigned DEFAULT NULL COMMENT '库存预警值，保留6位小数可以精确到微克',
  PRIMARY KEY (`pur_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='采购品目';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pur_item`
--

LOCK TABLES `pur_item` WRITE;
/*!40000 ALTER TABLE `pur_item` DISABLE KEYS */;
INSERT INTO `pur_item` VALUES (1,'当归','1',NULL,'DG','danggui','甘、辛，温。归 肝 、心 、脾经 。','补 血活血 ，调经 止痛，润肠通便。',NULL,NULL,'6-12g。','',NULL,0,'1','1',1000,500.000000),(2,'黄芪','1',NULL,'HQ','huangqi','甘，微温。归肺、脾经。','补气升阳，固表止汗，利水消肿，生津养血，行滞通痹，托毒排脓，敛疮生肌。',NULL,NULL,'9-30g。','',NULL,0,'1','1',1000,500.000000),(3,'川贝','1',NULL,'CB','chuanbei','苦、甘,微寒。归肺、心经。','淸热润肺，化痰止咳，散结消痈。',NULL,NULL,'3〜10g;研粉冲服，一次1〜2g。','不宜与川乌、制川乌、草乌、制草乌、附子同用。',NULL,0,'1','1',1000,500.000000),(4,'金银花','1','','JYH','jinyinhua',NULL,'','','','','','',0,'1','1',1000,500.000000),(5,'三七','1','','SQ','sanqi',NULL,'','','','','','',0,'1','1',1000,500.000000),(6,'党参','1','','DS','dangshen',NULL,'','','','','','',0,'1','1',1000,500.000000),(7,'白术','1','','BZ','baizhu',NULL,'','','','','','',0,'1','1',1000,500.000000),(8,'人参','1','','RS','renshen',NULL,'','','','','','',0,'1','1',1000,500.000000),(9,'茯苓','1','','FL','fuling',NULL,'','','','','','',0,'1','1',1000,500.000000),(10,'甘草','1','','GC','gancao',NULL,'','','','','','',0,'1','1',1000,500.000000),(11,'熟地','1','','SD','shudi',NULL,'','','','','','',0,'1','1',1000,500.000000),(12,'鸡血藤','1','','JXT','jixieteng',NULL,'','','','','','',0,'1','1',1000,500.000000),(13,'西洋参','1','','XYS','xiyangshen',NULL,'','','','','','',0,'1','1',1000,500.000000),(14,'板蓝根','1','','BLG','banlangen',NULL,'','','','','','',0,'1','1',1000,500.000000),(15,'柴胡','1','','CH','chaihu',NULL,'','','','','','',0,'1','1',1000,500.000000),(16,'半夏','1','','BX','banxia',NULL,'','','','','','',0,'1','1',1000,500.000000),(17,'枸杞子','1','','GQZ','gouqizi',NULL,'','','','','','',0,'1','1',1000,500.000000),(18,'川芎','1','','CX','chuanxiong',NULL,'','','','','','',0,'1','1',1000,500.000000),(19,'六味地黄丸','2','','LWDHW','liuweidihuangwan',NULL,'滋阴补肾。用于肾阴亏损，头晕耳鸣，腰膝酸软，骨蒸潮热，盗汗遗精。','熟地黄、山茱萸(制)、山药、牡丹皮、茯苓、泽泻。','每丸重9克','口服。小蜜丸一次9克，一日2次。','忌辛辣食物及不易消化食物。','江西药都樟树制药有限公司 ',0,'4','3',1,10.000000),(20,'双黄连颗粒','2','','SHLKL','shuanghuangliankeli',NULL,'疏风解表，清热解毒。用于外感风热所致的感冒，症见发热、咳嗽、咽痛。','金银花、黄芩、连翘。','颗粒剂。每袋装5克。','开水冲服，一日3次，一次10克；小儿酌减或遵医嘱。','孕妇及脾胃虚寒者慎服。','',0,'3','2',1,10.000000),(21,'荆防败毒丸','2','','JFBDW','jingfangbaiduwan',NULL,'清热散风，解毒消肿。用于流行性感冒，恶寒发热，头痛咳嗽，瘟毒发颐。','防风、荆芥、赤茯苓、羌活、独活、川芎、柴胡(去头)、薄荷、前胡、桔梗(去芦)、枳壳、党参(去芦)、甘草。','水丸剂。每10粒重1克，每袋9克。','口服。一次1袋，一日2次。','忌食生凉饮食。','',0,'3','2',1,10.000000),(24,'当归饮片','3','','DGYP','dangguiyinpian',NULL,NULL,NULL,'50g/袋','3-10g','','河北',0,'17','6',50,50.000000),(25,'蕲大妈十年陈艾柱','4','51755830293','QDMSNCAZ','qidamashinianchenaizhu',NULL,NULL,NULL,'54柱/盒',NULL,NULL,'蕲大妈',NULL,'17','5',50,50.000000),(26,'中号购物袋','5',NULL,NULL,NULL,NULL,NULL,NULL,'中号',NULL,NULL,'陈林',NULL,NULL,NULL,NULL,NULL),(27,'包药纸','5',NULL,NULL,NULL,NULL,NULL,NULL,'30*30',NULL,NULL,'淘宝',NULL,NULL,NULL,NULL,NULL),(28,'体温计','4','','TWJ','tiwenji',NULL,NULL,NULL,'',NULL,NULL,'',NULL,'6','9',1,5.000000),(29,'睡衣','5',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL),(30,'床单','5',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL),(31,'一次性纸杯','5',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL),(32,'一次性拖鞋','5',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL),(33,'针灸针','4','','ZJZ','zhenjiuzhen',NULL,NULL,NULL,'',NULL,NULL,'',NULL,'','',NULL,NULL),(34,'酒精','4','','JJ','jiujing',NULL,NULL,NULL,'',NULL,NULL,'',NULL,'','',NULL,NULL),(35,'棉球','4','','MQ','mianqiu',NULL,NULL,NULL,'',NULL,NULL,'',NULL,'','',NULL,NULL),(39,'煎药机','4','','JYJ','jianyaoji',NULL,NULL,NULL,'2L（200克药材）',NULL,NULL,'',NULL,'','',NULL,NULL),(40,'名片','5',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL),(41,'宣传手册','5',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL),(42,'传单','5',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL),(43,'香囊袋','5',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `pur_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pur_order`
--

DROP TABLE IF EXISTS `pur_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pur_order` (
  `pur_order_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `pur_order_code` varchar(17) DEFAULT NULL COMMENT '采购单号',
  `pur_order_date` varchar(10) DEFAULT NULL COMMENT '采购日期',
  `supplier_id` bigint(20) unsigned DEFAULT NULL COMMENT '供应商ID',
  `total_price` decimal(14,4) unsigned DEFAULT NULL COMMENT '采购单金额',
  `pur_order_picture` blob COMMENT '照片附件',
  `is_entry` bit(1) DEFAULT NULL COMMENT '是否入库（1：是；0：否）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`pur_order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='采购单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pur_order`
--

LOCK TABLES `pur_order` WRITE;
/*!40000 ALTER TABLE `pur_order` DISABLE KEYS */;
INSERT INTO `pur_order` VALUES (9,'19122887','2019-12-28',1,5000.0000,NULL,_binary '','2019-12-28 19:14:16','2019-12-28 19:14:16');
/*!40000 ALTER TABLE `pur_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pur_order_detail`
--

DROP TABLE IF EXISTS `pur_order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pur_order_detail` (
  `pur_order_detail_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `pur_order_id` bigint(20) unsigned DEFAULT NULL COMMENT '采购单ID',
  `pur_item_id` bigint(20) unsigned DEFAULT NULL COMMENT '品目ID',
  `batch_number` varchar(50) DEFAULT NULL COMMENT '批号',
  `manufacture_date` varchar(10) DEFAULT NULL COMMENT '生产日期',
  `expire_date` varchar(10) DEFAULT NULL COMMENT '有效期至',
  `pur_count` decimal(14,4) unsigned DEFAULT NULL COMMENT '采购数量',
  `unit_price` decimal(14,4) unsigned DEFAULT NULL COMMENT '进价',
  `total_price` decimal(14,4) unsigned DEFAULT NULL COMMENT '总价',
  PRIMARY KEY (`pur_order_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='采购单明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pur_order_detail`
--

LOCK TABLES `pur_order_detail` WRITE;
/*!40000 ALTER TABLE `pur_order_detail` DISABLE KEYS */;
INSERT INTO `pur_order_detail` VALUES (19,9,5,'','','',10.0000,200.0000,2000.0000),(20,9,3,'','','',1.0000,3000.0000,3000.0000);
/*!40000 ALTER TABLE `pur_order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pur_stock`
--

DROP TABLE IF EXISTS `pur_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pur_stock` (
  `pur_stock_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `pur_order_id` bigint(20) DEFAULT NULL COMMENT '采购单ID',
  `pur_item_id` bigint(20) unsigned DEFAULT NULL COMMENT '品目ID',
  `batch_number` varchar(50) DEFAULT NULL COMMENT '批号',
  `manufacture_date` varchar(10) DEFAULT NULL COMMENT '生产日期',
  `expire_date` varchar(10) DEFAULT NULL COMMENT '有效期至',
  `stock_count` decimal(14,4) DEFAULT NULL COMMENT '库存数量',
  `selling_price` decimal(14,4) DEFAULT NULL COMMENT '零售价',
  `stock_state` tinyint(1) unsigned DEFAULT '1' COMMENT '库存状态(1：正常；2：已退货；3：已过期)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`pur_stock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='库存明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pur_stock`
--

LOCK TABLES `pur_stock` WRITE;
/*!40000 ALTER TABLE `pur_stock` DISABLE KEYS */;
INSERT INTO `pur_stock` VALUES (15,9,5,'','','',400.0000,1.0000,1,'2019-12-29 18:48:23','2020-01-01 16:12:10'),(16,9,3,'','','',1000.0000,5.0000,1,'2019-12-29 18:48:23','2020-01-01 10:28:12');
/*!40000 ALTER TABLE `pur_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pur_supplier`
--

DROP TABLE IF EXISTS `pur_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pur_supplier` (
  `supplier_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `supplier_name` varchar(50) DEFAULT NULL COMMENT '供应商名称',
  `link_man_1` varchar(50) DEFAULT NULL COMMENT '联系人1',
  `phone_1` varchar(30) DEFAULT NULL COMMENT '联系电话1',
  `link_man_2` varchar(50) DEFAULT NULL COMMENT '联系人2',
  `phone_2` varchar(30) DEFAULT NULL COMMENT '联系电话2',
  `main_products` varchar(500) DEFAULT NULL COMMENT '主营',
  `address` varchar(500) DEFAULT NULL COMMENT '供应商地址',
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='供应商';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pur_supplier`
--

LOCK TABLES `pur_supplier` WRITE;
/*!40000 ALTER TABLE `pur_supplier` DISABLE KEYS */;
INSERT INTO `pur_supplier` VALUES (1,'安国药材','李安国','15613305755','','','中药材批发','保定安国'),(2,'周楼周俊晓','周俊晓','15613308755','','','中药材批发','周楼'),(3,'隔壁老王','王子君','15636584588','赵无延','16525664587','医疗用品，耗材','河南安阳');
/*!40000 ALTER TABLE `pur_supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rx_catalog`
--

DROP TABLE IF EXISTS `rx_catalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rx_catalog` (
  `catalog_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '目录ID',
  `parent_catalog_id` int(10) unsigned DEFAULT NULL COMMENT '父目录ID',
  `catalog_type` tinyint(1) NOT NULL COMMENT '目录类型(1:目录;2:方剂)',
  `catalog_name` varchar(50) NOT NULL COMMENT '目录名称',
  `catalog_order` int(3) DEFAULT NULL COMMENT '目录顺序',
  PRIMARY KEY (`catalog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='方剂目录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rx_catalog`
--

LOCK TABLES `rx_catalog` WRITE;
/*!40000 ALTER TABLE `rx_catalog` DISABLE KEYS */;
INSERT INTO `rx_catalog` VALUES (33,NULL,1,'补益剂',0),(34,33,1,'补血剂',0),(35,34,2,'当归补血汤',0);
/*!40000 ALTER TABLE `rx_catalog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rx_catalogue`
--

DROP TABLE IF EXISTS `rx_catalogue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rx_catalogue` (
  `catalogue_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '目录ID',
  `parent_catalogue_id` int(10) unsigned DEFAULT NULL COMMENT '父目录ID',
  `catalogue_type` tinyint(1) NOT NULL COMMENT '目录类型(1:目录;2:处方)',
  `catalogue_name` varchar(50) NOT NULL COMMENT '目录名称',
  `catalogue_order` int(3) DEFAULT NULL COMMENT '目录顺序',
  PRIMARY KEY (`catalogue_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='处方目录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rx_catalogue`
--

LOCK TABLES `rx_catalogue` WRITE;
/*!40000 ALTER TABLE `rx_catalogue` DISABLE KEYS */;
INSERT INTO `rx_catalogue` VALUES (33,NULL,1,'补益剂',0),(34,33,1,'补血剂',0),(35,34,2,'当归补血汤',0),(36,NULL,1,'新增分类',1),(37,NULL,1,'新增分类',2),(38,37,1,'新增目录',0),(39,38,1,'新增目录',0),(40,NULL,1,'新增分类',3);
/*!40000 ALTER TABLE `rx_catalogue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rx_detail`
--

DROP TABLE IF EXISTS `rx_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rx_detail` (
  `rx_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `rx_name` varchar(20) NOT NULL COMMENT '方剂名称',
  `rx_abbr` varchar(20) DEFAULT NULL COMMENT '方剂简称',
  `catalog_id` int(10) unsigned NOT NULL COMMENT '方剂目录ID:解表剂,补气剂等',
  `rx_source` varchar(20) DEFAULT NULL COMMENT '方剂出处',
  `rx_component` varchar(1000) NOT NULL COMMENT '方剂组成（JSON格式的字符串）',
  `taking_method` varchar(100) DEFAULT NULL COMMENT '服用方法',
  `rx_function` varchar(100) NOT NULL COMMENT '方剂功用',
  `rx_taboo` varchar(100) DEFAULT NULL COMMENT '禁忌',
  `rx_song` varchar(100) DEFAULT NULL COMMENT '方歌',
  PRIMARY KEY (`rx_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='方剂详情';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rx_detail`
--

LOCK TABLES `rx_detail` WRITE;
/*!40000 ALTER TABLE `rx_detail` DISABLE KEYS */;
INSERT INTO `rx_detail` VALUES (5,'当归补血汤',NULL,35,'伤寒论','黄芪30g  当归6g','日三次，空腹服用','补血','','');
/*!40000 ALTER TABLE `rx_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settle_account`
--

DROP TABLE IF EXISTS `settle_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settle_account` (
  `settle_account_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `record_id` bigint(20) unsigned NOT NULL COMMENT '病历ID',
  `vip_card_number` varchar(15) DEFAULT NULL COMMENT '会员卡号',
  `receivable` decimal(12,2) DEFAULT NULL COMMENT '应收',
  `discount` decimal(5,2) DEFAULT NULL COMMENT '折扣',
  `actual_receivable` decimal(12,2) DEFAULT NULL COMMENT '实收',
  `give_change` decimal(12,2) DEFAULT NULL COMMENT '找零',
  `payment_type` tinyint(1) unsigned DEFAULT NULL COMMENT '支付方式',
  `payment_state` tinyint(1) unsigned DEFAULT NULL COMMENT '支付状态',
  `payment_time` datetime DEFAULT NULL COMMENT '支付时间',
  PRIMARY KEY (`settle_account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='结算表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settle_account`
--

LOCK TABLES `settle_account` WRITE;
/*!40000 ALTER TABLE `settle_account` DISABLE KEYS */;
INSERT INTO `settle_account` VALUES (1,7,NULL,240.00,NULL,NULL,NULL,NULL,1,NULL),(2,8,NULL,150.00,NULL,NULL,NULL,NULL,1,NULL),(3,9,NULL,180.00,NULL,NULL,NULL,NULL,1,NULL),(4,10,NULL,150.00,NULL,NULL,NULL,NULL,1,NULL),(5,11,NULL,150.00,NULL,NULL,NULL,NULL,1,NULL),(6,12,'15613305755',300.00,23.50,300.00,23.50,2,2,'2019-11-03 17:08:50'),(7,12,NULL,300.00,NULL,NULL,NULL,NULL,1,NULL);
/*!40000 ALTER TABLE `settle_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dictionary`
--

DROP TABLE IF EXISTS `sys_dictionary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dictionary` (
  `dict_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `dict_key` varchar(50) NOT NULL COMMENT '字典键',
  `dict_name` varchar(50) NOT NULL COMMENT '字典名称或字典项名称',
  `dict_value` varchar(50) DEFAULT NULL COMMENT '字典项的值',
  `dict_order` decimal(10,5) DEFAULT NULL COMMENT '顺序号',
  `is_use` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否有效',
  `dict_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '字典类型；1：字典类型；2：字典项',
  PRIMARY KEY (`dict_id`)
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dictionary`
--

LOCK TABLES `sys_dictionary` WRITE;
/*!40000 ALTER TABLE `sys_dictionary` DISABLE KEYS */;
INSERT INTO `sys_dictionary` VALUES (91,'LSDW','零售单位',NULL,NULL,1,1),(92,'LSDW','克','1',1.00000,1,2),(93,'LSDW','毫克','2',2.00000,1,2),(94,'LSDW','升','3',3.00000,1,2),(95,'LSDW','毫升','4',4.00000,1,2),(96,'LSDW','盒','5',5.00000,1,2),(97,'LSDW','瓶','6',6.00000,1,2),(98,'LSDW','袋','7',7.00000,1,2),(99,'LSDW','包','8',8.00000,1,2),(100,'LSDW','支','9',9.00000,1,2),(101,'LSDW','片','10',10.00000,1,2),(102,'LSDW','粒','11',11.00000,1,2),(103,'LSDW','个','12',12.00000,1,2),(104,'LSDW','套','13',13.00000,1,2),(105,'LSDW','贴','14',14.00000,1,2),(126,'JHBZ','进货包装',NULL,NULL,1,1),(127,'JHBZ','公斤','1',1.00000,1,2),(128,'JHBZ','斤','2',2.00000,1,2),(129,'JHBZ','箱','17',2.50000,1,2),(130,'JHBZ','盒','3',3.00000,1,2),(131,'JHBZ','瓶','4',4.00000,1,2),(132,'JHBZ','袋','5',5.00000,1,2),(133,'JHBZ','支','6',6.00000,1,2),(134,'JHBZ','板','7',7.00000,1,2),(135,'JHBZ','片','8',8.00000,0,2),(136,'JHBZ','包','9',9.00000,1,2),(137,'JHBZ','粒','10',10.00000,0,2),(138,'JHBZ','卷','11',11.00000,0,2),(139,'JHBZ','个','12',12.00000,0,2),(140,'JHBZ','筒','13',13.00000,0,2),(141,'JHBZ','桶','14',14.00000,0,2),(142,'JHBZ','组','15',15.00000,0,2),(143,'JHBZ','条','16',16.00000,0,2),(144,'JHBZ','套','18',18.00000,0,2),(145,'JHBZ','对','19',19.00000,0,2),(146,'PMFL','品目分类',NULL,NULL,1,1),(147,'PMFL','中药','HerbalMedicine',1.00000,1,2),(148,'PMFL','成药','PatentMedicine',2.00000,1,2),(149,'PMFL','医疗用品','MedicalSupply',3.00000,1,2),(150,'PMFL','其他耗材','Consumable',4.00000,1,2),(151,'PMFL','方剂','Prescription',7.00000,1,2),(152,'PMFL','经络','Meridian',5.00000,1,2),(153,'PMFL','诊疗项目','Skill',8.00000,1,2),(154,'PMFL','腧穴','Acupoint',6.00000,1,2),(163,'FJCC','方剂出处',NULL,NULL,1,1),(164,'FJCC','伤寒论','1',1.00000,1,2),(165,'FJCC','金匮要略','2',2.00000,1,2),(166,'FJCC','温病条辨','3',3.00000,1,2),(167,'FJCC','太平惠民和剂局方','4',4.00000,1,2),(168,'FJCC','景岳全书','5',5.00000,1,2),(169,'FJCC','东垣试效方','6',6.00000,1,2),(170,'FJCC','疫疹一得','7',7.00000,1,2),(171,'FJCC','卫生宝鉴','8',8.00000,1,2),(172,'FJCC','宣明论方','9',9.00000,1,2),(173,'HerbalMedicine','中药分类',NULL,NULL,1,1),(174,'HerbalMedicine','辛温解表','1',1.00000,1,2),(175,'PatentMedicine','成药分类',NULL,NULL,1,1),(176,'PatentMedicine','补血','1',1.00000,1,2),(177,'Meridian','经络分类',NULL,NULL,1,1),(178,'Meridian','正经','1',1.00000,1,2),(179,'Acupoint','经络',NULL,NULL,1,1),(180,'Acupoint','手太阴肺经','1',1.00000,1,2),(181,'Prescription','方剂分类',NULL,NULL,1,1),(182,'Prescription','涌吐','1',1.00000,1,2);
/*!40000 ALTER TABLE `sys_dictionary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `parent_menu_id` bigint(20) NOT NULL COMMENT '父级菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `menu_url` varchar(255) DEFAULT NULL COMMENT '菜单URL',
  `menu_icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `menu_order` decimal(10,5) DEFAULT NULL COMMENT '菜单顺序号',
  `is_valid` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否有效',
  PRIMARY KEY (`menu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=224 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (51,0,'系统管理','','layui-icon-home',1.00000,1),(52,51,'菜单管理','/views/module/system/menu/menu.html','',1.00000,1),(53,51,'字典管理','/views/module/system/dictionary/dictionary.html','',2.00000,1),(157,0,'采购管理','','layui-icon-component',2.00000,1),(158,157,'采购品目','/views/module/purchase/item/purItem.html','',2.00000,1),(167,157,'新建采购单','/views/module/purchase/order/purOrderForm.html','',3.00000,1),(205,0,'病历管理','','layui-icon-component',5.00000,1),(206,205,'新建病历','/views/module/record/medicalRecordForm.html','',1.00000,1),(208,157,'供应商','/views/module/purchase/supplier/supplier.html','',1.00000,1),(209,157,'采购单查询','/views/module/purchase/order/purOrderQuery.html','',4.00000,1),(210,157,'库存盘点','/views/module/purchase/stock/purStockQuery.html','',5.00000,1),(215,0,'品目管理','','layui-icon-component',1.50000,1),(216,215,'中药','/views/module/item/herbalmedicine/itemHerbalMedicine.html','',1.00000,1),(212,0,'医技项目','/views/module/skill/medicalSkill.html','layui-icon-component',3.00000,1),(213,0,'方剂管理','/views/module/prescription/prescription.html','layui-icon-component',4.00000,1),(214,205,'病历查询','/views/module/pharmacy/pharmacyitem/pharmacyItem.html','',2.00000,1),(217,215,'成药','','',2.00000,1),(218,215,'方剂','','',3.00000,1),(219,215,'经络','','',4.00000,1),(220,215,'医疗用品','','',5.00000,1),(221,215,'其他耗材','','',6.00000,1),(222,215,'诊疗项目','','',7.00000,1),(223,215,'新增品目','/views/module/item/add/itemAdd.html','',0.00000,1);
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-06 17:59:59
