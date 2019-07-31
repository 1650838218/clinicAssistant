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
-- Table structure for table `cf_disease`
--

DROP TABLE IF EXISTS `cf_disease`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cf_disease` (
  `id` int(11) NOT NULL COMMENT 'id',
  `name` varchar(10) NOT NULL COMMENT '疾病名称',
  `pid` int(11) NOT NULL COMMENT '父ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='处方管理--疾病';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cf_disease`
--

LOCK TABLES `cf_disease` WRITE;
/*!40000 ALTER TABLE `cf_disease` DISABLE KEYS */;
INSERT INTO `cf_disease` VALUES (39,'感冒',-1),(40,'风寒证',39),(41,'风热证',39),(42,'暑湿证',39);
/*!40000 ALTER TABLE `cf_disease` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cf_prescribe`
--

DROP TABLE IF EXISTS `cf_prescribe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cf_prescribe` (
  `id` int(11) NOT NULL,
  `abbreviation` varchar(20) NOT NULL,
  `details` varchar(1000) DEFAULT NULL,
  `disease_id` int(11) NOT NULL,
  `doggerel` varchar(100) DEFAULT NULL,
  `name` varchar(20) NOT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKm3c3ac33s45l685m3sgkuclpg` (`disease_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cf_prescribe`
--

LOCK TABLES `cf_prescribe` WRITE;
/*!40000 ALTER TABLE `cf_prescribe` DISABLE KEYS */;
INSERT INTO `cf_prescribe` VALUES (43,'YQS','连翘,豆豉,薄荷,竹叶',40,NULL,'银翘散',0),(44,'JFBDS','荆芥,防风,生姜',41,NULL,'荆防败毒散',0),(45,'JF','柴胡,薄荷',41,NULL,'江防',0),(46,'BDS','川芎,涪陵,甘草,茯苓',41,NULL,'败毒散',0);
/*!40000 ALTER TABLE `cf_prescribe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dict_many_level_item`
--

DROP TABLE IF EXISTS `dict_many_level_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dict_many_level_item` (
  `dict_item_id` int(11) NOT NULL,
  `node_id` varchar(255) NOT NULL,
  `node_name` varchar(500) NOT NULL,
  `parent_node_id` varchar(255) NOT NULL,
  `sequence_number` int(11) DEFAULT NULL,
  `dict_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`dict_item_id`),
  KEY `FKp97kc8s32wbtox810v6e1n5gj` (`dict_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dict_many_level_item`
--

LOCK TABLES `dict_many_level_item` WRITE;
/*!40000 ALTER TABLE `dict_many_level_item` DISABLE KEYS */;
INSERT INTO `dict_many_level_item` VALUES (130,'1|','解表剂','',0,129),(131,'1|1|','辛温解表','1|',0,129),(132,'1|2|','辛凉解表','1|',1,129),(133,'1|3|','扶正解表','1|',2,129),(135,'1|','解表剂','',0,NULL),(138,'1|','解表剂','',0,NULL),(141,'1|','解表剂','',0,NULL);
/*!40000 ALTER TABLE `dict_many_level_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dict_many_level_type`
--

DROP TABLE IF EXISTS `dict_many_level_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dict_many_level_type` (
  `dict_type_id` int(11) NOT NULL,
  `dict_type_name` varchar(500) NOT NULL,
  `dict_type_key` varchar(50) NOT NULL,
  PRIMARY KEY (`dict_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dict_many_level_type`
--

LOCK TABLES `dict_many_level_type` WRITE;
/*!40000 ALTER TABLE `dict_many_level_type` DISABLE KEYS */;
INSERT INTO `dict_many_level_type` VALUES (129,'方剂类型','FJLX');
/*!40000 ALTER TABLE `dict_many_level_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dictionary_item`
--

DROP TABLE IF EXISTS `dictionary_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dictionary_item` (
  `dict_item_id` int(11) NOT NULL,
  `dict_item_name` varchar(500) NOT NULL,
  `dict_item_value` varchar(500) NOT NULL,
  `is_use` int(11) NOT NULL,
  `dict_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`dict_item_id`),
  KEY `FKic69dyivqlp4q39vorqawkla3` (`dict_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dictionary_item`
--

LOCK TABLES `dictionary_item` WRITE;
/*!40000 ALTER TABLE `dictionary_item` DISABLE KEYS */;
INSERT INTO `dictionary_item` VALUES (109,'试试222','33',1,108),(110,'试试1111','222',1,108),(111,'试试333','444',1,NULL),(113,'aaa','1',1,112),(114,'bbb','2',1,112),(116,'试试','3 ',1,115),(161,'中草药','1',1,160),(162,'中成药','2',1,160),(163,'其他','99',1,160),(169,'公斤','1',1,168),(170,'箱','2',1,168),(172,'药品','1',1,171),(173,'医疗器械','2',1,171),(174,'日常用品','3',1,171),(195,'中药饮片','3',1,160),(197,'克（g）','1',1,196);
/*!40000 ALTER TABLE `dictionary_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dictionary_type`
--

DROP TABLE IF EXISTS `dictionary_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dictionary_type` (
  `dict_type_id` int(11) NOT NULL,
  `dict_type_key` varchar(500) NOT NULL,
  `dict_type_name` varchar(500) NOT NULL,
  `menu_id` int(11) NOT NULL,
  PRIMARY KEY (`dict_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dictionary_type`
--

LOCK TABLES `dictionary_type` WRITE;
/*!40000 ALTER TABLE `dictionary_type` DISABLE KEYS */;
INSERT INTO `dictionary_type` VALUES (108,'22','事实上',52),(112,'CS','测试1',52),(115,'CSA','测试2',52),(160,'YPFL','药品分类',158),(168,'SLDW','采购单位',167),(171,'CGDLX','采购单类型',167),(196,'KCDW','库存单位',158);
/*!40000 ALTER TABLE `dictionary_type` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `hibernate_sequence` VALUES (206);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `menu_id` int(11) NOT NULL,
  `is_use` varchar(5) DEFAULT NULL,
  `menu_name` varchar(500) NOT NULL,
  `menu_order` int(11) DEFAULT NULL,
  `menu_url` varchar(255) DEFAULT NULL,
  `parent_menu_id` int(11) NOT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (51,'1','系统管理',1,'',0),(52,'0','菜单管理',1,'#/system/menu',51),(53,'1','一级字典',2,'#/system/oneLevel',51),(157,'1','药房管理',1,'',0),(158,'1','药房品目',1,'#/pharmacy/pharmacyitem',157),(166,'1','供货商',2,'#/pharmacy/supplier',157),(167,'1','采购单',3,'#/pharmacy/purchasebill',157);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmacy_item`
--

DROP TABLE IF EXISTS `pharmacy_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pharmacy_item` (
  `pharmacy_item_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `pharmacy_item_name` varchar(50) NOT NULL COMMENT '药品名称',
  `pharmacy_item_type` tinyint(2) NOT NULL COMMENT '药品类型',
  `poisonous` bit(1) DEFAULT b'0' COMMENT '是否有毒（1：是；0：否）',
  `barcode` varchar(50) DEFAULT NULL COMMENT '条形码',
  `abbreviation` varchar(50) NOT NULL COMMENT '简拼',
  `full_pinyin` varchar(500) NOT NULL COMMENT '全拼',
  `component` varchar(500) DEFAULT NULL COMMENT '成分',
  `function_attending` varchar(500) DEFAULT NULL COMMENT '功能主治',
  `specifications` varchar(100) DEFAULT NULL COMMENT '规格',
  `usage_and_dosage` varchar(500) DEFAULT NULL COMMENT '用法用量',
  `taboo` varchar(500) DEFAULT NULL COMMENT '禁忌',
  `manufacturer` varchar(100) DEFAULT NULL COMMENT '厂家制造商',
  `purchase_unit` varchar(50) NOT NULL COMMENT '采购单位',
  `stock_unit` varchar(50) NOT NULL COMMENT '库存单位',
  `unit_convert` double(12,2) NOT NULL COMMENT '单位换算',
  `stock_warn` double(12,2) NOT NULL COMMENT '库存预警值',
  PRIMARY KEY (`pharmacy_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='药房品目';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmacy_item`
--

LOCK TABLES `pharmacy_item` WRITE;
/*!40000 ALTER TABLE `pharmacy_item` DISABLE KEYS */;
INSERT INTO `pharmacy_item` VALUES (1,'三七',1,_binary '\0','','SQ','sanqi','','','10g*袋','','','神威','1','1',1000.00,5000.00),(2,'西洋参',1,_binary '\0','','XYS','xiyangshen','','','','','','','1','1',1000.00,1000.00),(3,'人参',1,_binary '\0','','RS','renshen','','','100g','','','','1','1',1000.00,500.00);
/*!40000 ALTER TABLE `pharmacy_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_order`
--

DROP TABLE IF EXISTS `purchase_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase_order` (
  `purchase_order_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `purchase_order_code` varchar(17) DEFAULT NULL COMMENT '采购单号',
  `purchase_order_date` varchar(10) DEFAULT NULL COMMENT '采购日期',
  `purchase_order_type` tinyint(2) DEFAULT NULL COMMENT '采购单类型(1:药品采购单；2：耗材采购单)',
  `supplier_id` bigint(20) unsigned DEFAULT NULL COMMENT '供应商ID',
  `total_price` double(12,2) DEFAULT NULL COMMENT '采购单金额',
  `purchase_order_picture` blob COMMENT '照片附件',
  `is_entry` bit(1) DEFAULT NULL COMMENT '是否入库（1：是；0：否）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`purchase_order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='采购单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_order`
--

LOCK TABLES `purchase_order` WRITE;
/*!40000 ALTER TABLE `purchase_order` DISABLE KEYS */;
INSERT INTO `purchase_order` VALUES (2,'190730949','2019-07-30',1,1,1000.00,NULL,_binary '\0','2019-07-30 13:32:51','2019-07-30 13:32:51'),(3,'190731386','2019-07-31',1,1,25000.00,NULL,_binary '\0','2019-07-31 14:51:33','2019-07-31 14:51:33'),(4,'190731774','2019-07-31',1,1,1000.00,NULL,_binary '\0','2019-07-31 15:25:29','2019-07-31 15:25:29');
/*!40000 ALTER TABLE `purchase_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_order_detail`
--

DROP TABLE IF EXISTS `purchase_order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase_order_detail` (
  `purchase_order_detail_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `purchase_order_id` bigint(20) unsigned DEFAULT NULL COMMENT '采购单ID',
  `pharmacy_item_id` bigint(20) unsigned DEFAULT NULL COMMENT '品目ID',
  `goods_name` varchar(50) DEFAULT NULL COMMENT '商品名称',
  `batch_number` varchar(50) DEFAULT NULL COMMENT '批号',
  `manufacture_date` varchar(10) DEFAULT NULL COMMENT '生产日期',
  `expire_date` varchar(10) DEFAULT NULL COMMENT '有效期至',
  `purchase_count` double(12,2) DEFAULT NULL COMMENT '数量',
  `unit_price` double(12,2) DEFAULT NULL COMMENT '单价',
  `total_price` double(12,2) DEFAULT NULL COMMENT '总价',
  PRIMARY KEY (`purchase_order_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='采购单明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_order_detail`
--

LOCK TABLES `purchase_order_detail` WRITE;
/*!40000 ALTER TABLE `purchase_order_detail` DISABLE KEYS */;
INSERT INTO `purchase_order_detail` VALUES (1,3,1,NULL,'11','2019-07-01','2019-07-31',50.00,500.00,25000.00),(2,4,3,NULL,'11','2019-07-01','2019-07-31',5.00,200.00,1000.00);
/*!40000 ALTER TABLE `purchase_order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `supplier_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `supplier_name` varchar(50) DEFAULT NULL COMMENT '供应商名称',
  `link_man_1` varchar(50) DEFAULT NULL COMMENT '联系人1',
  `phone_1` varchar(30) DEFAULT NULL COMMENT '联系电话1',
  `link_man_2` varchar(50) DEFAULT NULL COMMENT '联系人2',
  `phone_2` varchar(30) DEFAULT NULL COMMENT '联系电话2',
  `main_products` varchar(500) DEFAULT NULL COMMENT '主营',
  `address` varchar(500) DEFAULT NULL COMMENT '供应商地址',
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='供应商';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'神威制药','康有为','15613305777','康俊祥','15613305755','中草药，中成药','河北省栾城市');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehousing_entry`
--

DROP TABLE IF EXISTS `warehousing_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehousing_entry` (
  `warehousing_entry_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `purchase_order_id` bigint(20) unsigned DEFAULT NULL COMMENT '采购单ID',
  `warehousing_entry_code` varchar(17) DEFAULT NULL COMMENT '入库单号',
  `warehousing_entry_date` varchar(10) DEFAULT NULL COMMENT '入库日期',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`warehousing_entry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='入库单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehousing_entry`
--

LOCK TABLES `warehousing_entry` WRITE;
/*!40000 ALTER TABLE `warehousing_entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `warehousing_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehousing_entry_detail`
--

DROP TABLE IF EXISTS `warehousing_entry_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehousing_entry_detail` (
  `warehousing_entry_detail_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `warehousing_entry_id` bigint(20) unsigned DEFAULT NULL COMMENT '入库单ID',
  `pharmacy_item_id` bigint(20) unsigned DEFAULT NULL COMMENT '品目ID',
  `batch_number` varchar(50) DEFAULT NULL COMMENT '批号',
  `manufacture_date` varchar(10) DEFAULT NULL COMMENT '生产日期',
  `expire_date` varchar(10) DEFAULT NULL COMMENT '有效期至',
  `stock_count` double(12,2) DEFAULT NULL COMMENT '库存数量',
  `selling_price` double(12,2) DEFAULT NULL COMMENT '零售价',
  PRIMARY KEY (`warehousing_entry_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='入库单明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehousing_entry_detail`
--

LOCK TABLES `warehousing_entry_detail` WRITE;
/*!40000 ALTER TABLE `warehousing_entry_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `warehousing_entry_detail` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-31 17:38:14
