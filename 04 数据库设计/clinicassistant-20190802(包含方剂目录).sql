/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 80017
Source Host           : localhost:3306
Source Database       : clinicassistant

Target Server Type    : MYSQL
Target Server Version : 80017
File Encoding         : 65001

Date: 2019-08-02 15:27:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cf_disease
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
-- Table structure for cf_prescribe
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
-- Table structure for dictionary_item
-- ----------------------------
DROP TABLE IF EXISTS `dictionary_item`;
CREATE TABLE `dictionary_item` (
  `dict_item_id` int(11) NOT NULL,
  `dict_item_name` varchar(500) NOT NULL,
  `dict_item_value` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
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
INSERT INTO `dictionary_item` VALUES ('169', '公斤', '1', '1', '168');
INSERT INTO `dictionary_item` VALUES ('170', '箱', '2', '1', '168');
INSERT INTO `dictionary_item` VALUES ('172', '药品', '1', '1', '171');
INSERT INTO `dictionary_item` VALUES ('173', '医疗器械', '2', '1', '171');
INSERT INTO `dictionary_item` VALUES ('174', '日常用品', '3', '1', '171');
INSERT INTO `dictionary_item` VALUES ('195', '中药饮片', '3', '1', '160');
INSERT INTO `dictionary_item` VALUES ('197', '克（g）', '1', '1', '196');

-- ----------------------------
-- Table structure for dictionary_type
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
INSERT INTO `dictionary_type` VALUES ('168', 'SLDW', '采购单位', '167');
INSERT INTO `dictionary_type` VALUES ('171', 'CGDLX', '采购单类型', '167');
INSERT INTO `dictionary_type` VALUES ('196', 'KCDW', '库存单位', '158');

-- ----------------------------
-- Table structure for dict_many_level_item
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
INSERT INTO `dict_many_level_item` VALUES ('206', '2|', '泻下剂', '', '1', '129');
INSERT INTO `dict_many_level_item` VALUES ('207', '2|1|', '寒下', '2|', '0', '129');
INSERT INTO `dict_many_level_item` VALUES ('208', '2|2|', '温下', '2|', '1', '129');
INSERT INTO `dict_many_level_item` VALUES ('209', '2|3|', '润下', '2|', '2', '129');
INSERT INTO `dict_many_level_item` VALUES ('210', '2|4|', '逐水', '2|', '3', '129');
INSERT INTO `dict_many_level_item` VALUES ('211', '2|5|', '攻补兼施', '2|', '4', '129');
INSERT INTO `dict_many_level_item` VALUES ('212', '3|', '和解剂', '', '2', '129');
INSERT INTO `dict_many_level_item` VALUES ('213', '3|1|', '和解少阳', '3|', '0', '129');
INSERT INTO `dict_many_level_item` VALUES ('214', '3|2|', '调和肝脾', '3|', '1', '129');
INSERT INTO `dict_many_level_item` VALUES ('215', '3|3|', '调和肠胃', '3|', '2', '129');
INSERT INTO `dict_many_level_item` VALUES ('216', '4|', '清热剂', '', '3', '129');
INSERT INTO `dict_many_level_item` VALUES ('217', '4|1|', '清气分热', '4|', '0', '129');
INSERT INTO `dict_many_level_item` VALUES ('218', '4|2|', '清营凉血', '4|', '1', '129');
INSERT INTO `dict_many_level_item` VALUES ('219', '4|3|', '清热解毒', '4|', '2', '129');
INSERT INTO `dict_many_level_item` VALUES ('220', '4|4|', '气血两清', '4|', '3', '129');
INSERT INTO `dict_many_level_item` VALUES ('221', '4|5|', '清脏腑热', '4|', '4', '129');
INSERT INTO `dict_many_level_item` VALUES ('222', '4|6|', '清虚热', '4|', '5', '129');
INSERT INTO `dict_many_level_item` VALUES ('223', '5|', '祛暑剂', '', '4', '129');
INSERT INTO `dict_many_level_item` VALUES ('224', '5|1|', '祛暑清热', '5|', '0', '129');
INSERT INTO `dict_many_level_item` VALUES ('225', '5|2|', '祛暑解表', '5|', '1', '129');
INSERT INTO `dict_many_level_item` VALUES ('226', '5|3|', '祛暑利湿', '5|', '2', '129');
INSERT INTO `dict_many_level_item` VALUES ('227', '5|4|', '清暑益气', '5|', '3', '129');
INSERT INTO `dict_many_level_item` VALUES ('228', '6|', '温里剂', '', '5', '129');
INSERT INTO `dict_many_level_item` VALUES ('229', '6|1|', '温中祛寒', '6|', '0', '129');
INSERT INTO `dict_many_level_item` VALUES ('230', '6|2|', '回阳救逆', '6|', '1', '129');
INSERT INTO `dict_many_level_item` VALUES ('231', '6|3|', '温经散寒', '6|', '2', '129');
INSERT INTO `dict_many_level_item` VALUES ('232', '7|', '表里双解剂', '', '6', '129');
INSERT INTO `dict_many_level_item` VALUES ('233', '7|1|', '解表攻里', '7|', '0', '129');
INSERT INTO `dict_many_level_item` VALUES ('234', '7|2|', '解表清里', '7|', '1', '129');
INSERT INTO `dict_many_level_item` VALUES ('235', '7|3|', '解表温里', '7|', '2', '129');
INSERT INTO `dict_many_level_item` VALUES ('236', '8|', '补益剂', '', '7', '129');
INSERT INTO `dict_many_level_item` VALUES ('237', '8|1|', '补气', '8|', '0', '129');
INSERT INTO `dict_many_level_item` VALUES ('238', '8|2|', '补血', '8|', '1', '129');
INSERT INTO `dict_many_level_item` VALUES ('239', '8|3|', '气血双补', '8|', '2', '129');
INSERT INTO `dict_many_level_item` VALUES ('240', '8|4|', '补阴', '8|', '3', '129');
INSERT INTO `dict_many_level_item` VALUES ('241', '8|5|', '补阳', '8|', '4', '129');
INSERT INTO `dict_many_level_item` VALUES ('242', '9|', '安神剂', '', '8', '129');
INSERT INTO `dict_many_level_item` VALUES ('243', '9|1|', '重镇安神', '9|', '0', '129');
INSERT INTO `dict_many_level_item` VALUES ('244', '9|2|', '滋养安神', '9|', '1', '129');
INSERT INTO `dict_many_level_item` VALUES ('245', '10|', '开窍剂', '', '9', '129');
INSERT INTO `dict_many_level_item` VALUES ('246', '10|1|', '凉开', '10|', '0', '129');
INSERT INTO `dict_many_level_item` VALUES ('247', '10|2|', '温开', '10|', '1', '129');
INSERT INTO `dict_many_level_item` VALUES ('248', '11|', '固涩剂', '', '10', '129');
INSERT INTO `dict_many_level_item` VALUES ('249', '11|1|', '固表止汗', '11|', '0', '129');
INSERT INTO `dict_many_level_item` VALUES ('250', '11|2|', '敛肺止咳', '11|', '1', '129');
INSERT INTO `dict_many_level_item` VALUES ('251', '11|3|', '涩肠固脱', '11|', '2', '129');
INSERT INTO `dict_many_level_item` VALUES ('252', '11|4|', '涩精止遗', '11|', '3', '129');
INSERT INTO `dict_many_level_item` VALUES ('253', '11|5|', '固崩止带', '11|', '4', '129');
INSERT INTO `dict_many_level_item` VALUES ('254', '12|', '理气剂', '', '11', '129');
INSERT INTO `dict_many_level_item` VALUES ('255', '12|1|', '行气', '12|', '0', '129');
INSERT INTO `dict_many_level_item` VALUES ('256', '12|2|', '降气', '12|', '1', '129');
INSERT INTO `dict_many_level_item` VALUES ('257', '13|', '理血剂', '', '12', '129');
INSERT INTO `dict_many_level_item` VALUES ('258', '13|1|', '活血祛瘀', '13|', '0', '129');
INSERT INTO `dict_many_level_item` VALUES ('259', '13|2|', '止血', '13|', '1', '129');
INSERT INTO `dict_many_level_item` VALUES ('260', '14|', '治风剂', '', '13', '129');
INSERT INTO `dict_many_level_item` VALUES ('261', '14|1|', '疏散外风', '14|', '0', '129');
INSERT INTO `dict_many_level_item` VALUES ('262', '14|2|', '平息内风', '14|', '1', '129');
INSERT INTO `dict_many_level_item` VALUES ('263', '15|', '治燥剂', '', '14', '129');
INSERT INTO `dict_many_level_item` VALUES ('264', '15|1|', '轻宜润燥', '15|', '0', '129');
INSERT INTO `dict_many_level_item` VALUES ('265', '15|2|', '滋阴润燥', '15|', '1', '129');
INSERT INTO `dict_many_level_item` VALUES ('266', '16|', '祛湿剂', '', '15', '129');
INSERT INTO `dict_many_level_item` VALUES ('267', '16|1|', '燥湿和胃', '16|', '0', '129');
INSERT INTO `dict_many_level_item` VALUES ('268', '16|2|', '清热祛湿', '16|', '1', '129');
INSERT INTO `dict_many_level_item` VALUES ('269', '16|3|', '利水渗湿', '16|', '2', '129');
INSERT INTO `dict_many_level_item` VALUES ('270', '16|4|', '温化水湿', '16|', '3', '129');
INSERT INTO `dict_many_level_item` VALUES ('271', '16|5|', '祛风胜湿', '16|', '4', '129');
INSERT INTO `dict_many_level_item` VALUES ('272', '17|', '祛痰剂', '', '16', '129');
INSERT INTO `dict_many_level_item` VALUES ('273', '17|1|', '燥湿化痰', '17|', '0', '129');
INSERT INTO `dict_many_level_item` VALUES ('274', '17|2|', '清热化痰', '17|', '1', '129');
INSERT INTO `dict_many_level_item` VALUES ('275', '17|3|', '润燥化痰', '17|', '2', '129');
INSERT INTO `dict_many_level_item` VALUES ('276', '17|4|', '温化寒痰', '17|', '3', '129');
INSERT INTO `dict_many_level_item` VALUES ('277', '17|5|', '治风化痰', '17|', '4', '129');
INSERT INTO `dict_many_level_item` VALUES ('278', '18|', '消导化积剂', '', '17', '129');
INSERT INTO `dict_many_level_item` VALUES ('279', '18|1|', '消食导滞', '18|', '0', '129');
INSERT INTO `dict_many_level_item` VALUES ('280', '18|2|', '消痞化积', '18|', '1', '129');
INSERT INTO `dict_many_level_item` VALUES ('281', '19|', '驱虫剂', '', '18', '129');
INSERT INTO `dict_many_level_item` VALUES ('282', '20|', '涌吐剂', '', '19', '129');
INSERT INTO `dict_many_level_item` VALUES ('283', '21|', '痈疡剂', '', '20', '129');

-- ----------------------------
-- Table structure for dict_many_level_type
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
-- Table structure for hibernate_sequence
-- ----------------------------
DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hibernate_sequence
-- ----------------------------
INSERT INTO `hibernate_sequence` VALUES ('284');

-- ----------------------------
-- Table structure for menu
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
-- Table structure for pharmacy_item
-- ----------------------------
DROP TABLE IF EXISTS `pharmacy_item`;
CREATE TABLE `pharmacy_item` (
  `pharmacy_item_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `pharmacy_item_name` varchar(50) NOT NULL COMMENT '药品名称',
  `pharmacy_item_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '药品类型',
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

-- ----------------------------
-- Records of pharmacy_item
-- ----------------------------
INSERT INTO `pharmacy_item` VALUES ('1', '三七', '1', '\0', '', 'SQ', 'sanqi', '', '', '10g*袋', '', '', '神威', '1', '1', '1000.00', '5000.00');
INSERT INTO `pharmacy_item` VALUES ('2', '西洋参', '1', '\0', '', 'XYS', 'xiyangshen', '', '', '', '', '', '', '1', '1', '1000.00', '1000.00');
INSERT INTO `pharmacy_item` VALUES ('3', '人参', '1', '\0', '', 'RS', 'renshen', '', '', '100g', '', '', '', '1', '1', '1000.00', '500.00');

-- ----------------------------
-- Table structure for purchase_order
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='采购单';

-- ----------------------------
-- Records of purchase_order
-- ----------------------------
INSERT INTO `purchase_order` VALUES ('2', '190730949', '2019-07-30', '1', '1', '1000.00', null, '\0', '2019-07-30 13:32:51', '2019-07-30 13:32:51');
INSERT INTO `purchase_order` VALUES ('3', '190731386', '2019-07-31', '1', '1', '25000.00', null, '\0', '2019-07-31 14:51:33', '2019-07-31 14:51:33');
INSERT INTO `purchase_order` VALUES ('4', '190731774', '2019-07-31', '1', '1', '1000.00', null, '', '2019-07-31 15:25:29', '2019-07-31 15:25:29');

-- ----------------------------
-- Table structure for purchase_order_detail
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
  `stock_state` tinyint(1) unsigned DEFAULT '1' COMMENT '库存状态(1：正常；2：已退货；3：已过期)',
  PRIMARY KEY (`purchase_order_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='采购单明细';

-- ----------------------------
-- Records of purchase_order_detail
-- ----------------------------
INSERT INTO `purchase_order_detail` VALUES ('1', '3', '1', null, '11', '2019-07-01', '2019-07-31', '50.00', '500.00', '25000.00', '1');
INSERT INTO `purchase_order_detail` VALUES ('2', '4', '3', null, '11', '2019-07-01', '2019-07-31', '5.00', '200.00', '1000.00', '1');

-- ----------------------------
-- Table structure for stock_detail
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
  `stock_state` tinyint(1) unsigned DEFAULT '1' COMMENT '库存状态(1：正常；2：已退货；3：已过期，4：下架)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`stock_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='库存明细';

-- ----------------------------
-- Records of stock_detail
-- ----------------------------
INSERT INTO `stock_detail` VALUES ('12', '4', '3', '11', '2019-07-01', '2019-07-31', '5000.00', '6.00', '1', '2019-08-01 15:25:33', '2019-08-02 11:23:04');

-- ----------------------------
-- Table structure for supplier
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='供应商';

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES ('1', '神威制药', '康有为', '15613305777', '康俊祥', '15613305755', '中草药，中成药', '河北省栾城市');
