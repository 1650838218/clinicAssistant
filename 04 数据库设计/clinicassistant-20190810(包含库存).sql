/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50727
Source Host           : localhost:3306
Source Database       : clinicassistant

Target Server Type    : MYSQL
Target Server Version : 50727
File Encoding         : 65001

Date: 2019-08-10 16:30:53
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
-- Table structure for `medical_skill`
-- ----------------------------
DROP TABLE IF EXISTS `medical_skill`;
CREATE TABLE `medical_skill` (
  `skill_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `skill_name` varchar(50) DEFAULT NULL COMMENT '项目名称',
  `unit_price` decimal(12,2) unsigned DEFAULT NULL COMMENT '单价',
  PRIMARY KEY (`skill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='医技项目';

-- ----------------------------
-- Records of medical_skill
-- ----------------------------
INSERT INTO `medical_skill` VALUES ('1', '电针', '30.00');
INSERT INTO `medical_skill` VALUES ('3', '艾灸', '40.00');
INSERT INTO `medical_skill` VALUES ('4', '药饼灸', '50.00');

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
  `purchase_unit` varchar(50) NOT NULL COMMENT '采购单位',
  `stock_unit` varchar(50) NOT NULL COMMENT '库存单位',
  `unit_convert` double(12,2) NOT NULL COMMENT '单位换算',
  `stock_warn` double(12,2) NOT NULL COMMENT '库存预警值',
  PRIMARY KEY (`pharmacy_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='药房品目';

-- ----------------------------
-- Records of pharmacy_item
-- ----------------------------
INSERT INTO `pharmacy_item` VALUES ('1', '当归', '1', '', '', 'DG', 'danggui', '', '', '', '', '', '', '1', '1', '1000.00', '500.00');
INSERT INTO `pharmacy_item` VALUES ('2', '黄芪', '1', '', '', 'HQ', 'huangqi', '', '', '', '', '', '', '1', '1', '1000.00', '500.00');
INSERT INTO `pharmacy_item` VALUES ('3', '川贝', '1', '', '', 'CB', 'chuanbei', '', '', '', '', '', '', '1', '1', '1000.00', '500.00');
INSERT INTO `pharmacy_item` VALUES ('4', '金银花', '1', '', '', 'JYH', 'jinyinhua', '', '', '', '', '', '', '1', '1', '1000.00', '500.00');
INSERT INTO `pharmacy_item` VALUES ('5', '三七', '1', '', '', 'SQ', 'sanqi', '', '', '', '', '', '', '1', '1', '1000.00', '500.00');
INSERT INTO `pharmacy_item` VALUES ('6', '党参', '1', '', '', 'DS', 'dangshen', '', '', '', '', '', '', '1', '1', '1000.00', '500.00');
INSERT INTO `pharmacy_item` VALUES ('7', '白术', '1', '', '', 'BZ', 'baizhu', '', '', '', '', '', '', '1', '1', '1000.00', '500.00');
INSERT INTO `pharmacy_item` VALUES ('8', '人参', '1', '', '', 'RS', 'renshen', '', '', '', '', '', '', '1', '1', '1000.00', '500.00');
INSERT INTO `pharmacy_item` VALUES ('9', '茯苓', '1', '', '', 'FL', 'fuling', '', '', '', '', '', '', '1', '1', '1000.00', '500.00');
INSERT INTO `pharmacy_item` VALUES ('10', '甘草', '1', '', '', 'GC', 'gancao', '', '', '', '', '', '', '1', '1', '1000.00', '500.00');
INSERT INTO `pharmacy_item` VALUES ('11', '熟地', '1', '', '', 'SD', 'shudi', '', '', '', '', '', '', '1', '1', '1000.00', '500.00');
INSERT INTO `pharmacy_item` VALUES ('12', '鸡血藤', '1', '', '', 'JXT', 'jixieteng', '', '', '', '', '', '', '1', '1', '1000.00', '500.00');
INSERT INTO `pharmacy_item` VALUES ('13', '西洋参', '1', '', '', 'XYS', 'xiyangshen', '', '', '', '', '', '', '1', '1', '1000.00', '500.00');
INSERT INTO `pharmacy_item` VALUES ('14', '板蓝根', '1', '', '', 'BLG', 'banlangen', '', '', '', '', '', '', '1', '1', '1000.00', '500.00');
INSERT INTO `pharmacy_item` VALUES ('15', '柴胡', '1', '', '', 'CH', 'chaihu', '', '', '', '', '', '', '1', '1', '1000.00', '500.00');
INSERT INTO `pharmacy_item` VALUES ('16', '半夏', '1', '', '', 'BX', 'banxia', '', '', '', '', '', '', '1', '1', '1000.00', '500.00');
INSERT INTO `pharmacy_item` VALUES ('17', '枸杞子', '1', '', '', 'GQZ', 'gouqizi', '', '', '', '', '', '', '1', '1', '1000.00', '500.00');
INSERT INTO `pharmacy_item` VALUES ('18', '川芎', '1', '', '', 'CX', 'chuanxiong', '', '', '', '', '', '', '1', '1', '1000.00', '500.00');

-- ----------------------------
-- Table structure for `prescription`
-- ----------------------------
DROP TABLE IF EXISTS `prescription`;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='处方';

-- ----------------------------
-- Records of prescription
-- ----------------------------
INSERT INTO `prescription` VALUES ('5', '当归补血汤', null, '35', '010', '伤寒论', '黄芪30g  当归6g', '日三次，空腹服用', '补血', '血虚', '', '', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='采购单';

-- ----------------------------
-- Records of purchase_order
-- ----------------------------
INSERT INTO `purchase_order` VALUES ('1', '190810305', '2019-08-10', '1', '1', '1500.00', null, '', '2019-08-10 16:22:14', '2019-08-10 16:22:14');
INSERT INTO `purchase_order` VALUES ('2', '190810347', '2019-08-10', '1', '2', '2800.00', null, '', '2019-08-10 16:23:26', '2019-08-10 16:23:26');
INSERT INTO `purchase_order` VALUES ('3', '190810255', '2019-08-10', '1', '1', '400.00', null, '', '2019-08-10 16:24:11', '2019-08-10 16:24:11');

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
  `unit_price` double(12,2) DEFAULT NULL COMMENT '单价',
  `total_price` double(12,2) DEFAULT NULL COMMENT '总价',
  PRIMARY KEY (`purchase_order_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='采购单明细';

-- ----------------------------
-- Records of purchase_order_detail
-- ----------------------------
INSERT INTO `purchase_order_detail` VALUES ('1', '1', '5', null, '', '', '', '5.00', '100.00', '500.00');
INSERT INTO `purchase_order_detail` VALUES ('2', '1', '2', null, '', '', '', '5.00', '100.00', '500.00');
INSERT INTO `purchase_order_detail` VALUES ('3', '1', '1', null, '', '', '', '5.00', '100.00', '500.00');
INSERT INTO `purchase_order_detail` VALUES ('4', '2', '11', null, '', '', '', '5.00', '200.00', '1000.00');
INSERT INTO `purchase_order_detail` VALUES ('5', '2', '5', null, '', '', '', '5.00', '120.00', '600.00');
INSERT INTO `purchase_order_detail` VALUES ('6', '2', '1', null, '', '', '', '5.00', '120.00', '600.00');
INSERT INTO `purchase_order_detail` VALUES ('7', '2', '2', null, '', '', '', '5.00', '120.00', '600.00');
INSERT INTO `purchase_order_detail` VALUES ('8', '3', '5', null, '', '', '', '2.00', '100.00', '200.00');
INSERT INTO `purchase_order_detail` VALUES ('9', '3', '2', null, '', '', '', '2.00', '100.00', '200.00');

-- ----------------------------
-- Table structure for `rx_catalogue`
-- ----------------------------
DROP TABLE IF EXISTS `rx_catalogue`;
CREATE TABLE `rx_catalogue` (
  `catalogue_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '目录ID',
  `parent_catalogue_id` int(10) unsigned DEFAULT NULL COMMENT '父目录ID',
  `catalogue_type` tinyint(1) NOT NULL COMMENT '目录类型(1:目录;2:处方)',
  `catalogue_name` varchar(50) NOT NULL COMMENT '目录名称',
  `catalogue_order` int(3) DEFAULT NULL COMMENT '目录顺序',
  PRIMARY KEY (`catalogue_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='处方目录';

-- ----------------------------
-- Records of rx_catalogue
-- ----------------------------
INSERT INTO `rx_catalogue` VALUES ('33', null, '1', '补益剂', '0');
INSERT INTO `rx_catalogue` VALUES ('34', '33', '1', '补血剂', '0');
INSERT INTO `rx_catalogue` VALUES ('35', '34', '2', '当归补血汤', '0');

-- ----------------------------
-- Table structure for `stock_detail`
-- ----------------------------
DROP TABLE IF EXISTS `stock_detail`;
CREATE TABLE `stock_detail` (
  `stock_detail_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `purchase_order_id` bigint(20) DEFAULT NULL COMMENT '采购单ID',
  `pharmacy_item_id` bigint(20) unsigned DEFAULT NULL COMMENT '品目ID',
  `batch_number` varchar(50) DEFAULT NULL COMMENT '批号',
  `manufacture_date` varchar(10) DEFAULT NULL COMMENT '生产日期',
  `expire_date` varchar(10) DEFAULT NULL COMMENT '有效期至',
  `stock_count` double(12,2) DEFAULT NULL COMMENT '库存数量',
  `selling_price` double(12,2) DEFAULT NULL COMMENT '零售价',
  `stock_state` tinyint(1) unsigned DEFAULT '1' COMMENT '库存状态(1：正常；2：已退货；3：已过期)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`stock_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='库存明细';

-- ----------------------------
-- Records of stock_detail
-- ----------------------------
INSERT INTO `stock_detail` VALUES ('1', '1', '5', '', '', '', '5000.00', '0.50', '1', '2019-08-10 16:24:54', '2019-08-10 16:24:54');
INSERT INTO `stock_detail` VALUES ('2', '1', '2', '', '', '', '5000.00', '0.50', '1', '2019-08-10 16:24:54', '2019-08-10 16:24:54');
INSERT INTO `stock_detail` VALUES ('3', '1', '1', '', '', '', '5000.00', '0.50', '1', '2019-08-10 16:24:54', '2019-08-10 16:24:54');
INSERT INTO `stock_detail` VALUES ('4', '2', '11', '', '', '', '5000.00', '0.80', '1', '2019-08-10 16:25:54', '2019-08-10 16:25:54');
INSERT INTO `stock_detail` VALUES ('5', '2', '5', '', '', '', '5000.00', '0.60', '1', '2019-08-10 16:25:54', '2019-08-10 16:25:54');
INSERT INTO `stock_detail` VALUES ('6', '2', '1', '', '', '', '5000.00', '0.60', '1', '2019-08-10 16:25:54', '2019-08-10 16:25:54');
INSERT INTO `stock_detail` VALUES ('7', '2', '2', '', '', '', '5000.00', '0.60', '1', '2019-08-10 16:25:54', '2019-08-10 16:25:54');
INSERT INTO `stock_detail` VALUES ('8', '3', '5', '', '', '', '2000.00', '0.50', '1', '2019-08-10 16:26:45', '2019-08-10 16:26:45');
INSERT INTO `stock_detail` VALUES ('9', '3', '2', '', '', '', '2000.00', '0.50', '1', '2019-08-10 16:26:45', '2019-08-10 16:26:45');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='供应商';

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES ('1', '安国药材', '李安国', '15613305755', '', '', '中药材批发', '保定安国');
INSERT INTO `supplier` VALUES ('2', '周楼周俊晓', '周俊晓', '15613308755', '', '', '中药材批发', '周楼');
