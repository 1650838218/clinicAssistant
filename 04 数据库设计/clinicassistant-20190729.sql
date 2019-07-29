/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50727
Source Host           : localhost:3306
Source Database       : clinicassistant

Target Server Type    : MYSQL
Target Server Version : 50727
File Encoding         : 65001

Date: 2019-07-29 22:20:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `cf_disease`
-- ----------------------------
DROP TABLE IF EXISTS `cf_disease`;
CREATE TABLE `cf_disease` (
  `id` int(11) NOT NULL COMMENT 'id',
  `name` varchar(10) NOT NULL COMMENT '疾病名称',
  `pid` int(11) NOT NULL COMMENT '父ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='处方管理--疾病';

-- ----------------------------
-- Records of cf_disease
-- ----------------------------
INSERT INTO `cf_disease` VALUES ('39', '感冒', '-1');
INSERT INTO `cf_disease` VALUES ('40', '风寒证', '39');
INSERT INTO `cf_disease` VALUES ('41', '风热证', '39');
INSERT INTO `cf_disease` VALUES ('42', '暑湿证', '39');

-- ----------------------------
-- Table structure for `cf_prescribe`
-- ----------------------------
DROP TABLE IF EXISTS `cf_prescribe`;
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

-- ----------------------------
-- Records of cf_prescribe
-- ----------------------------
INSERT INTO `cf_prescribe` VALUES ('43', 'YQS', '连翘,豆豉,薄荷,竹叶', '40', null, '银翘散', '0');
INSERT INTO `cf_prescribe` VALUES ('44', 'JFBDS', '荆芥,防风,生姜', '41', null, '荆防败毒散', '0');
INSERT INTO `cf_prescribe` VALUES ('45', 'JF', '柴胡,薄荷', '41', null, '江防', '0');
INSERT INTO `cf_prescribe` VALUES ('46', 'BDS', '川芎,涪陵,甘草,茯苓', '41', null, '败毒散', '0');

-- ----------------------------
-- Table structure for `dictionary_item`
-- ----------------------------
DROP TABLE IF EXISTS `dictionary_item`;
CREATE TABLE `dictionary_item` (
  `dict_item_id` int(11) NOT NULL,
  `dict_item_name` varchar(500) NOT NULL,
  `dict_item_value` varchar(500) NOT NULL,
  `is_use` int(11) NOT NULL,
  `dict_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`dict_item_id`),
  KEY `FKic69dyivqlp4q39vorqawkla3` (`dict_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dictionary_item
-- ----------------------------
INSERT INTO `dictionary_item` VALUES ('109', '试试222', '33', '1', '108');
INSERT INTO `dictionary_item` VALUES ('110', '试试1111', '222', '1', '108');
INSERT INTO `dictionary_item` VALUES ('111', '试试333', '444', '1', null);
INSERT INTO `dictionary_item` VALUES ('113', 'aaa', '1', '1', '112');
INSERT INTO `dictionary_item` VALUES ('114', 'bbb', '2', '1', '112');
INSERT INTO `dictionary_item` VALUES ('116', '试试', '3 ', '1', '115');
INSERT INTO `dictionary_item` VALUES ('161', '中草药', '1', '1', '160');
INSERT INTO `dictionary_item` VALUES ('162', '中成药', '2', '1', '160');
INSERT INTO `dictionary_item` VALUES ('163', '其他', '99', '1', '160');
INSERT INTO `dictionary_item` VALUES ('169', '公斤（千克）', '1', '1', '168');
INSERT INTO `dictionary_item` VALUES ('170', '箱', '2', '1', '168');
INSERT INTO `dictionary_item` VALUES ('172', '药品', '1', '1', '171');
INSERT INTO `dictionary_item` VALUES ('173', '医疗器械', '2', '1', '171');
INSERT INTO `dictionary_item` VALUES ('174', '日常用品', '3', '1', '171');
INSERT INTO `dictionary_item` VALUES ('195', '中药饮片', '3', '1', '160');
INSERT INTO `dictionary_item` VALUES ('197', '克（g）', '1', '1', '196');

-- ----------------------------
-- Table structure for `dictionary_type`
-- ----------------------------
DROP TABLE IF EXISTS `dictionary_type`;
CREATE TABLE `dictionary_type` (
  `dict_type_id` int(11) NOT NULL,
  `dict_type_key` varchar(500) NOT NULL,
  `dict_type_name` varchar(500) NOT NULL,
  `menu_id` int(11) NOT NULL,
  PRIMARY KEY (`dict_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dictionary_type
-- ----------------------------
INSERT INTO `dictionary_type` VALUES ('108', '22', '事实上', '52');
INSERT INTO `dictionary_type` VALUES ('112', 'CS', '测试1', '52');
INSERT INTO `dictionary_type` VALUES ('115', 'CSA', '测试2', '52');
INSERT INTO `dictionary_type` VALUES ('160', 'YPFL', '药品分类', '158');
INSERT INTO `dictionary_type` VALUES ('168', 'SLDW', '数量单位', '167');
INSERT INTO `dictionary_type` VALUES ('171', 'CGDLX', '采购单类型', '167');
INSERT INTO `dictionary_type` VALUES ('196', 'KCDW', '库存单位', '158');

-- ----------------------------
-- Table structure for `dict_many_level_item`
-- ----------------------------
DROP TABLE IF EXISTS `dict_many_level_item`;
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

-- ----------------------------
-- Records of dict_many_level_item
-- ----------------------------
INSERT INTO `dict_many_level_item` VALUES ('130', '1|', '解表剂', '', '0', '129');
INSERT INTO `dict_many_level_item` VALUES ('131', '1|1|', '辛温解表', '1|', '0', '129');
INSERT INTO `dict_many_level_item` VALUES ('132', '1|2|', '辛凉解表', '1|', '1', '129');
INSERT INTO `dict_many_level_item` VALUES ('133', '1|3|', '扶正解表', '1|', '2', '129');
INSERT INTO `dict_many_level_item` VALUES ('135', '1|', '解表剂', '', '0', null);
INSERT INTO `dict_many_level_item` VALUES ('138', '1|', '解表剂', '', '0', null);
INSERT INTO `dict_many_level_item` VALUES ('141', '1|', '解表剂', '', '0', null);

-- ----------------------------
-- Table structure for `dict_many_level_type`
-- ----------------------------
DROP TABLE IF EXISTS `dict_many_level_type`;
CREATE TABLE `dict_many_level_type` (
  `dict_type_id` int(11) NOT NULL,
  `dict_type_name` varchar(500) NOT NULL,
  `dict_type_key` varchar(50) NOT NULL,
  PRIMARY KEY (`dict_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dict_many_level_type
-- ----------------------------
INSERT INTO `dict_many_level_type` VALUES ('129', '方剂类型', 'FJLX');

-- ----------------------------
-- Table structure for `hibernate_sequence`
-- ----------------------------
DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hibernate_sequence
-- ----------------------------
INSERT INTO `hibernate_sequence` VALUES ('201');

-- ----------------------------
-- Table structure for `menu`
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `menu_id` int(11) NOT NULL,
  `is_use` varchar(5) DEFAULT NULL,
  `menu_name` varchar(500) NOT NULL,
  `menu_order` int(11) DEFAULT NULL,
  `menu_url` varchar(255) DEFAULT NULL,
  `parent_menu_id` int(11) NOT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('51', '1', '系统管理', '1', '', '0');
INSERT INTO `menu` VALUES ('52', '0', '菜单管理', '1', '#/system/menu', '51');
INSERT INTO `menu` VALUES ('53', '1', '一级字典', '2', '#/system/oneLevel', '51');
INSERT INTO `menu` VALUES ('157', '1', '药房管理', '1', '', '0');
INSERT INTO `menu` VALUES ('158', '1', '药房品目', '1', '#/pharmacy/pharmacyitem', '157');
INSERT INTO `menu` VALUES ('166', '1', '供货商', '2', '#/pharmacy/supplier', '157');
INSERT INTO `menu` VALUES ('167', '1', '采购单', '3', '#/pharmacy/purchasebill', '157');

-- ----------------------------
-- Table structure for `pharmacy_item`
-- ----------------------------
DROP TABLE IF EXISTS `pharmacy_item`;
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
  `stock_warn` double(12,2) NOT NULL COMMENT '库存预警值',
  `stock_unit` tinyint(2) NOT NULL COMMENT '库存单位',
  PRIMARY KEY (`pharmacy_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='药房品目';

-- ----------------------------
-- Records of pharmacy_item
-- ----------------------------

-- ----------------------------
-- Table structure for `purchase_order`
-- ----------------------------
DROP TABLE IF EXISTS `purchase_order`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采购单';

-- ----------------------------
-- Records of purchase_order
-- ----------------------------

-- ----------------------------
-- Table structure for `purchase_order_detail`
-- ----------------------------
DROP TABLE IF EXISTS `purchase_order_detail`;
CREATE TABLE `purchase_order_detail` (
  `purchase_order_detail_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `purchase_order_id` bigint(20) unsigned DEFAULT NULL COMMENT '采购单ID',
  `pharmacy_item_id` bigint(20) unsigned DEFAULT NULL COMMENT '品目ID',
  `goods_name` varchar(50) DEFAULT NULL COMMENT '商品名称',
  `batch_number` varchar(50) DEFAULT NULL COMMENT '批号',
  `manufacture_date` varchar(10) DEFAULT NULL COMMENT '生产日期',
  `expire_date` varchar(10) DEFAULT NULL COMMENT '有效期至',
  `purchase_count` double(12,2) DEFAULT NULL COMMENT '数量',
  `purchase_unit` tinyint(2) DEFAULT NULL COMMENT '单位',
  `unit_price` double(12,2) DEFAULT NULL COMMENT '单价',
  `total_price` double(12,2) DEFAULT NULL COMMENT '总价',
  PRIMARY KEY (`purchase_order_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采购单明细';

-- ----------------------------
-- Records of purchase_order_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `supplier`
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='供应商';

-- ----------------------------
-- Records of supplier
-- ----------------------------

-- ----------------------------
-- Table structure for `warehousing_entry`
-- ----------------------------
DROP TABLE IF EXISTS `warehousing_entry`;
CREATE TABLE `warehousing_entry` (
  `warehousing_entry_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `purchase_order_id` bigint(20) unsigned DEFAULT NULL COMMENT '采购单ID',
  `warehousing_entry_code` varchar(17) DEFAULT NULL COMMENT '入库单号',
  `warehousing_entry_date` varchar(10) DEFAULT NULL COMMENT '入库日期',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`warehousing_entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='入库单';

-- ----------------------------
-- Records of warehousing_entry
-- ----------------------------

-- ----------------------------
-- Table structure for `warehousing_entry_detail`
-- ----------------------------
DROP TABLE IF EXISTS `warehousing_entry_detail`;
CREATE TABLE `warehousing_entry_detail` (
  `warehousing_entry_detail_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `warehousing_entry_id` bigint(20) unsigned DEFAULT NULL COMMENT '入库单ID',
  `purchase_order_detail_id` bigint(20) unsigned DEFAULT NULL COMMENT '采购单明细ID',
  `stock_count` double(12,2) DEFAULT NULL COMMENT '库存数量',
  `selling_price` double(12,2) DEFAULT NULL COMMENT '零售价',
  PRIMARY KEY (`warehousing_entry_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='入库单明细';

-- ----------------------------
-- Records of warehousing_entry_detail
-- ----------------------------
