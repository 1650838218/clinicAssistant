/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50727
Source Host           : localhost:3306
Source Database       : clinicassistant

Target Server Type    : MYSQL
Target Server Version : 50727
File Encoding         : 65001

Date: 2019-10-28 21:12:43
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
INSERT INTO `dictionary_item` VALUES ('111', '试试333', '444', '1', null);
INSERT INTO `dictionary_item` VALUES ('161', '中草药', '1', '1', '160');
INSERT INTO `dictionary_item` VALUES ('162', '中成药', '2', '1', '160');
INSERT INTO `dictionary_item` VALUES ('163', '其他', '99', '1', '160');
INSERT INTO `dictionary_item` VALUES ('169', '公斤', '1', '1', '168');
INSERT INTO `dictionary_item` VALUES ('170', '箱', '2', '1', '168');
INSERT INTO `dictionary_item` VALUES ('172', '药品', '1', '1', '171');
INSERT INTO `dictionary_item` VALUES ('173', '医疗器械', '2', '1', '171');
INSERT INTO `dictionary_item` VALUES ('174', '日常用品', '3', '1', '171');
INSERT INTO `dictionary_item` VALUES ('195', '中药饮片', '3', '1', '160');
INSERT INTO `dictionary_item` VALUES ('197', '克', '1', '1', '196');
INSERT INTO `dictionary_item` VALUES ('201', '盒', '3', '1', '168');
INSERT INTO `dictionary_item` VALUES ('202', '瓶', '4', '1', '168');
INSERT INTO `dictionary_item` VALUES ('203', '盒', '2', '1', '196');
INSERT INTO `dictionary_item` VALUES ('204', '瓶', '3', '1', '196');

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
INSERT INTO `hibernate_sequence` VALUES ('207');

-- ----------------------------
-- Table structure for `medical_record`
-- ----------------------------
DROP TABLE IF EXISTS `medical_record`;
CREATE TABLE `medical_record` (
  `record_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
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
  `total_money` decimal(12,2) DEFAULT NULL COMMENT '总金额',
  `payment_state` tinyint(1) unsigned DEFAULT NULL COMMENT '结算状态（1：未结算；2：已结算）',
  `payment_time` datetime DEFAULT NULL COMMENT '结算时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='病历';

-- ----------------------------
-- Records of medical_record
-- ----------------------------
INSERT INTO `medical_record` VALUES ('1', '2019-10-27 11:29', '孙悟空', '1', '28Y', '15613305755', '妖怪', '周楼', null, null, '事实上试试', '事实上试试', '风寒感冒', '辛温解表', '3', '350.00', null, null, null);
INSERT INTO `medical_record` VALUES ('3', '2019-10-27 17:0', '孙悟空', '1', '15Y', '15613305755', '妖怪', '周楼', null, null, '事实上', '事实上', '风寒感冒', '辛温解表', '2,3', '120.00', '1', null, null);
INSERT INTO `medical_record` VALUES ('4', '2019-10-28 20:26', '孙悟空12', '1', '23Y', '15613305755', '妖怪', '周楼', null, null, '事实上', '大大', '风寒感冒', '辛温解表', '2', '30.00', '1', null, null);
INSERT INTO `medical_record` VALUES ('6', '2019-10-28 20:30', '孙悟空21', '1', '23Y', '15613305755', '妖怪', '周楼', null, null, '的地方', '的', '风寒感冒', '辛温解表', '1,2', '84.00', '1', null, null);

-- ----------------------------
-- Table structure for `medical_record_rx`
-- ----------------------------
DROP TABLE IF EXISTS `medical_record_rx`;
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='病历处方';

-- ----------------------------
-- Records of medical_record_rx
-- ----------------------------
INSERT INTO `medical_record_rx` VALUES ('1', '1', '3', null, null, null, '350.00', '啊啊啊');
INSERT INTO `medical_record_rx` VALUES ('5', '3', '2', null, null, null, '30.00', 'DD');
INSERT INTO `medical_record_rx` VALUES ('6', '3', '3', null, null, null, '90.00', 'BB');
INSERT INTO `medical_record_rx` VALUES ('7', '4', '2', null, null, null, '30.00', 'CC');
INSERT INTO `medical_record_rx` VALUES ('8', '6', '1', '3', null, null, '54.00', 'DD');
INSERT INTO `medical_record_rx` VALUES ('9', '6', '2', null, null, null, '30.00', '啊啊啊');

-- ----------------------------
-- Table structure for `medical_record_rx_detail`
-- ----------------------------
DROP TABLE IF EXISTS `medical_record_rx_detail`;
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='病历处方明细';

-- ----------------------------
-- Records of medical_record_rx_detail
-- ----------------------------
INSERT INTO `medical_record_rx_detail` VALUES ('1', '1', '3', '1', null, '5.00', null, null, '30.00', '150.00');
INSERT INTO `medical_record_rx_detail` VALUES ('2', '1', '3', '3', null, '5.00', null, null, '40.00', '200.00');
INSERT INTO `medical_record_rx_detail` VALUES ('5', '3', '2', null, '11', null, null, null, null, '30.00');
INSERT INTO `medical_record_rx_detail` VALUES ('6', '3', '3', '1', null, '3.00', null, null, '30.00', '90.00');
INSERT INTO `medical_record_rx_detail` VALUES ('7', '4', '2', null, '11', null, null, null, null, '30.00');
INSERT INTO `medical_record_rx_detail` VALUES ('8', '6', '1', null, '2', '30.00', null, null, null, null);
INSERT INTO `medical_record_rx_detail` VALUES ('9', '6', '1', null, '1', '6.00', null, null, null, null);
INSERT INTO `medical_record_rx_detail` VALUES ('10', '6', '2', null, '19', null, null, null, null, '30.00');

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
INSERT INTO `menu` VALUES ('53', '1', '字典管理', '2', '#/system/oneLevel', '51');
INSERT INTO `menu` VALUES ('157', '1', '药房管理', '1', '', '0');
INSERT INTO `menu` VALUES ('158', '1', '药房品目', '1', '#/pharmacy/pharmacyitem', '157');
INSERT INTO `menu` VALUES ('166', '1', '供货商', '2', '#/pharmacy/supplier', '157');
INSERT INTO `menu` VALUES ('167', '1', '采购单', '3', '#/pharmacy/purchasebill', '157');
INSERT INTO `menu` VALUES ('205', '1', '病历管理', '5', '', '0');
INSERT INTO `menu` VALUES ('206', '1', '新建病历', '1', '#/record/medicalRecordForm', '205');

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='药房品目';

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
INSERT INTO `pharmacy_item` VALUES ('19', '六味地黄丸', '2', '', '', 'LWDHW', 'liuweidihuangwan', '熟地黄、山茱萸(制)、山药、牡丹皮、茯苓、泽泻。', '滋阴补肾。用于肾阴亏损，头晕耳鸣，腰膝酸软，骨蒸潮热，盗汗遗精。', '每丸重9克', '口服。小蜜丸一次9克，一日2次。', '忌辛辣食物及不易消化食物。', '江西药都樟树制药有限公司 ', '4', '3', '1.00', '10.00');
INSERT INTO `pharmacy_item` VALUES ('20', '双黄连颗粒', '2', '', '', 'SHLKL', 'shuanghuangliankeli', '金银花、黄芩、连翘。', '疏风解表，清热解毒。用于外感风热所致的感冒，症见发热、咳嗽、咽痛。', '颗粒剂。每袋装5克。', '开水冲服，一日3次，一次10克；小儿酌减或遵医嘱。', '孕妇及脾胃虚寒者慎服。', '', '3', '2', '1.00', '10.00');
INSERT INTO `pharmacy_item` VALUES ('21', '荆防败毒丸', '2', '', '', 'JFBDW', 'jingfangbaiduwan', '防风、荆芥、赤茯苓、羌活、独活、川芎、柴胡(去头)、薄荷、前胡、桔梗(去芦)、枳壳、党参(去芦)、甘草。', '清热散风，解毒消肿。用于流行性感冒，恶寒发热，头痛咳嗽，瘟毒发颐。', '水丸剂。每10粒重1克，每袋9克。', '口服。一次1袋，一日2次。', '忌食生凉饮食。', '', '3', '2', '1.00', '10.00');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='处方';

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='采购单';

-- ----------------------------
-- Records of purchase_order
-- ----------------------------
INSERT INTO `purchase_order` VALUES ('1', '190810305', '2019-08-10', '1', '1', '1500.00', null, '', '2019-08-10 16:22:14', '2019-08-10 16:22:14');
INSERT INTO `purchase_order` VALUES ('2', '190810347', '2019-08-10', '1', '2', '2800.00', null, '', '2019-08-10 16:23:26', '2019-08-10 16:23:26');
INSERT INTO `purchase_order` VALUES ('3', '190810255', '2019-08-10', '1', '1', '400.00', null, '', '2019-08-10 16:24:11', '2019-08-10 16:24:11');
INSERT INTO `purchase_order` VALUES ('4', '190831291', '2019-08-31', '1', '1', '725.00', null, '', '2019-08-31 15:59:30', '2019-08-31 15:59:30');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='采购单明细';

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
INSERT INTO `purchase_order_detail` VALUES ('10', '4', '20', null, '111', '2019-08-06', '2021-08-25', '20.00', '10.00', '200.00');
INSERT INTO `purchase_order_detail` VALUES ('11', '4', '19', null, '222', '2019-08-05', '2021-08-10', '15.00', '15.00', '225.00');
INSERT INTO `purchase_order_detail` VALUES ('12', '4', '21', null, '333', '2019-08-04', '2021-08-10', '15.00', '20.00', '300.00');

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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='处方目录';

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='库存明细';

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
INSERT INTO `stock_detail` VALUES ('10', '4', '20', '111', '2019-08-06', '2021-08-25', '20.00', '20.00', '1', '2019-08-31 16:00:15', '2019-08-31 16:00:15');
INSERT INTO `stock_detail` VALUES ('11', '4', '19', '222', '2019-08-05', '2021-08-10', '15.00', '30.00', '1', '2019-08-31 16:00:15', '2019-08-31 16:00:15');
INSERT INTO `stock_detail` VALUES ('12', '4', '21', '333', '2019-08-04', '2021-08-10', '15.00', '40.00', '1', '2019-08-31 16:00:15', '2019-08-31 16:00:15');

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
