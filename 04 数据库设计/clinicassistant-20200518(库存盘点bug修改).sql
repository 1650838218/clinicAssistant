/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 80017
Source Host           : localhost:3306
Source Database       : clinicassistant

Target Server Type    : MYSQL
Target Server Version : 80017
File Encoding         : 65001

Date: 2020-05-18 13:41:33
*/

SET FOREIGN_KEY_CHECKS=0;

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
INSERT INTO `hibernate_sequence` VALUES ('211');

-- ----------------------------
-- Table structure for item_acupoint
-- ----------------------------
DROP TABLE IF EXISTS `item_acupoint`;
CREATE TABLE `item_acupoint` (
  `item_id` bigint(20) unsigned NOT NULL COMMENT '品目ID',
  `item_name` varchar(50) NOT NULL COMMENT '腧穴名称',
  `abbr_pinyin` varchar(50) DEFAULT NULL COMMENT '简拼',
  `full_pinyin` varchar(500) DEFAULT NULL COMMENT '全拼',
  `item_type` varchar(10) NOT NULL COMMENT '所属经络',
  `location` varchar(500) DEFAULT NULL COMMENT '定位',
  `efficacy` varchar(500) DEFAULT NULL COMMENT '主治',
  `operation` varchar(100) DEFAULT NULL COMMENT '操作',
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='腧穴表';

-- ----------------------------
-- Records of item_acupoint
-- ----------------------------

-- ----------------------------
-- Table structure for item_all
-- ----------------------------
DROP TABLE IF EXISTS `item_all`;
CREATE TABLE `item_all` (
  `item_uid` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `item_id` bigint(20) NOT NULL COMMENT '品目ID',
  `item_name` varchar(50) NOT NULL COMMENT '品目名称',
  `item_type` varchar(50) NOT NULL COMMENT '品目分类（1：中草药；2：中成药；3：中药饮片；4：医疗耗材；5：其他耗材；字典键：CGPMFL）',
  PRIMARY KEY (`item_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='品目管理总表';

-- ----------------------------
-- Records of item_all
-- ----------------------------

-- ----------------------------
-- Table structure for item_consumable
-- ----------------------------
DROP TABLE IF EXISTS `item_consumable`;
CREATE TABLE `item_consumable` (
  `item_id` bigint(20) unsigned NOT NULL COMMENT '品目ID',
  `item_name` varchar(50) NOT NULL COMMENT '耗材名称',
  `abbr_pinyin` varchar(50) DEFAULT NULL COMMENT '简拼',
  `full_pinyin` varchar(500) DEFAULT NULL COMMENT '全拼',
  `specifications` varchar(100) DEFAULT NULL COMMENT '规格',
  `producer` varchar(100) DEFAULT NULL COMMENT '品牌厂家',
  `pur_unit` varchar(10) DEFAULT NULL COMMENT '进货包装',
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='其他耗材表';

-- ----------------------------
-- Records of item_consumable
-- ----------------------------

-- ----------------------------
-- Table structure for item_herbal_medicine
-- ----------------------------
DROP TABLE IF EXISTS `item_herbal_medicine`;
CREATE TABLE `item_herbal_medicine` (
  `item_id` bigint(20) unsigned NOT NULL COMMENT '品目ID',
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='中药表';

-- ----------------------------
-- Records of item_herbal_medicine
-- ----------------------------
INSERT INTO `item_herbal_medicine` VALUES ('210', '麻黄', 'MH', 'mahuang', '1', '辛、微苦，温。归肺、膀胱经。', '发汗，平喘，利水。', null, '1.5~10g。宜先煎。解表生用，平喘炙用或生用。', '本品发汗力较强，故表虚自汗及阴虚盗汗，喘咳由于肾不纳气者均应忌用。', null, null, '2', '1', '500', '500.000000');

-- ----------------------------
-- Table structure for item_medical_supply
-- ----------------------------
DROP TABLE IF EXISTS `item_medical_supply`;
CREATE TABLE `item_medical_supply` (
  `item_id` bigint(20) unsigned NOT NULL COMMENT '品目ID',
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='医疗用品表';

-- ----------------------------
-- Records of item_medical_supply
-- ----------------------------

-- ----------------------------
-- Table structure for item_meridian
-- ----------------------------
DROP TABLE IF EXISTS `item_meridian`;
CREATE TABLE `item_meridian` (
  `item_id` bigint(20) unsigned NOT NULL COMMENT '品目ID',
  `item_name` varchar(50) NOT NULL COMMENT '经络名称',
  `abbr_pinyin` varchar(50) DEFAULT NULL COMMENT '简拼',
  `full_pinyin` varchar(500) DEFAULT NULL COMMENT '全拼',
  `item_type` varchar(10) NOT NULL COMMENT '经络分类',
  `circulation_route` varchar(1000) DEFAULT NULL COMMENT '循行部位',
  `functions` varchar(500) DEFAULT NULL COMMENT '基本功能',
  `original_text` varchar(500) DEFAULT NULL COMMENT '原文（灵枢经脉）',
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='经络表';

-- ----------------------------
-- Records of item_meridian
-- ----------------------------

-- ----------------------------
-- Table structure for item_patent_medicine
-- ----------------------------
DROP TABLE IF EXISTS `item_patent_medicine`;
CREATE TABLE `item_patent_medicine` (
  `item_id` bigint(20) unsigned NOT NULL COMMENT '品目ID',
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='成药表';

-- ----------------------------
-- Records of item_patent_medicine
-- ----------------------------

-- ----------------------------
-- Table structure for item_prescription
-- ----------------------------
DROP TABLE IF EXISTS `item_prescription`;
CREATE TABLE `item_prescription` (
  `item_id` bigint(20) unsigned NOT NULL COMMENT '品目ID',
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='方剂表';

-- ----------------------------
-- Records of item_prescription
-- ----------------------------

-- ----------------------------
-- Table structure for item_skill
-- ----------------------------
DROP TABLE IF EXISTS `item_skill`;
CREATE TABLE `item_skill` (
  `item_id` bigint(20) unsigned NOT NULL COMMENT '品目ID',
  `item_name` varchar(50) NOT NULL COMMENT '项目名称',
  `abbr_pinyin` varchar(50) DEFAULT NULL COMMENT '简拼',
  `full_pinyin` varchar(500) DEFAULT NULL COMMENT '全拼',
  `unit_price` decimal(12,2) unsigned DEFAULT NULL COMMENT '单价',
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='医疗项目表';

-- ----------------------------
-- Records of item_skill
-- ----------------------------

-- ----------------------------
-- Table structure for medical_record
-- ----------------------------
DROP TABLE IF EXISTS `medical_record`;
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

-- ----------------------------
-- Records of medical_record
-- ----------------------------
INSERT INTO `medical_record` VALUES ('1', null, '2019-10-27 11:29', '孙悟空', '1', '28Y', '15613305755', '妖怪', '周楼', null, null, '事实上试试', '事实上试试', '风寒感冒', '辛温解表', '3', null);
INSERT INTO `medical_record` VALUES ('3', null, '2019-10-27 17:0', '孙悟空', '1', '15Y', '15613305755', '妖怪', '周楼', null, null, '事实上', '事实上', '风寒感冒', '辛温解表', '2,3', null);
INSERT INTO `medical_record` VALUES ('4', null, '2019-10-28 20:26', '孙悟空12', '1', '23Y', '15613305755', '妖怪', '周楼', null, null, '事实上', '大大', '风寒感冒', '辛温解表', '2', null);
INSERT INTO `medical_record` VALUES ('6', null, '2019-10-28 20:30', '孙悟空21', '1', '23Y', '15613305755', '妖怪', '周楼', null, null, '的地方', '的', '风寒感冒', '辛温解表', '1,2', null);
INSERT INTO `medical_record` VALUES ('7', null, '2019-11-3 15:43', '孙悟空', '1', '28Y', '15613305755', '妖怪', '周楼', null, null, '啦啦啦啦', '啪啪啪', '风寒感冒', '辛温解表', '3', '2019-11-03 15:44:38');
INSERT INTO `medical_record` VALUES ('8', null, '2019-11-3 16:12', '', '1', 'Y', '', '', '', null, null, '', '', '', '', '3', '2019-11-03 16:12:29');
INSERT INTO `medical_record` VALUES ('9', null, '2019-11-3 16:14', '', '1', 'Y', '', '', '', null, null, '', '', '', '', '3', '2019-11-03 16:14:46');
INSERT INTO `medical_record` VALUES ('10', null, '2019-11-3 16:54', '', '1', 'Y', '', '', '', null, null, '', '', '', '', '2', '2019-11-03 16:54:58');
INSERT INTO `medical_record` VALUES ('11', null, '2019-11-3 16:58', '', '1', 'Y', '', '', '', null, null, '', '', '', '', '2', '2019-11-03 16:58:29');
INSERT INTO `medical_record` VALUES ('12', null, '2019-11-3 17:0', '', '1', 'Y', '', '', '', null, null, '', '', '', '', '2', '2019-11-03 17:08:33');

-- ----------------------------
-- Table structure for medical_record_rx
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='病历处方';

-- ----------------------------
-- Records of medical_record_rx
-- ----------------------------
INSERT INTO `medical_record_rx` VALUES ('1', '1', '3', null, null, null, '350.00', '啊啊啊');
INSERT INTO `medical_record_rx` VALUES ('5', '3', '2', null, null, null, '30.00', 'DD');
INSERT INTO `medical_record_rx` VALUES ('6', '3', '3', null, null, null, '90.00', 'BB');
INSERT INTO `medical_record_rx` VALUES ('7', '4', '2', null, null, null, '30.00', 'CC');
INSERT INTO `medical_record_rx` VALUES ('8', '6', '1', '3', null, null, '54.00', 'DD');
INSERT INTO `medical_record_rx` VALUES ('9', '6', '2', null, null, null, '30.00', '啊啊啊');
INSERT INTO `medical_record_rx` VALUES ('10', '7', '3', null, null, null, '240.00', '密密麻麻');
INSERT INTO `medical_record_rx` VALUES ('11', '8', '3', null, null, null, '150.00', '');
INSERT INTO `medical_record_rx` VALUES ('12', '9', '3', null, null, null, '180.00', '');
INSERT INTO `medical_record_rx` VALUES ('13', '10', '2', null, null, null, '150.00', '');
INSERT INTO `medical_record_rx` VALUES ('14', '11', '2', null, null, null, '150.00', '');
INSERT INTO `medical_record_rx` VALUES ('16', '12', '2', null, null, null, '300.00', '');

-- ----------------------------
-- Table structure for medical_record_rx_detail
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='病历处方明细';

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
INSERT INTO `medical_record_rx_detail` VALUES ('11', '7', '3', '1', null, '3.00', null, null, '30.00', '90.00');
INSERT INTO `medical_record_rx_detail` VALUES ('12', '7', '3', '4', null, '3.00', null, null, '50.00', '150.00');
INSERT INTO `medical_record_rx_detail` VALUES ('13', '8', '3', '1', null, '5.00', null, null, '30.00', '150.00');
INSERT INTO `medical_record_rx_detail` VALUES ('14', '9', '3', '1', null, '6.00', null, null, '30.00', '180.00');
INSERT INTO `medical_record_rx_detail` VALUES ('15', '10', '2', null, '19', null, null, null, null, '150.00');
INSERT INTO `medical_record_rx_detail` VALUES ('16', '11', '2', null, '19', null, null, null, null, '150.00');
INSERT INTO `medical_record_rx_detail` VALUES ('18', '12', '2', null, '19', null, null, null, null, '300.00');

-- ----------------------------
-- Table structure for medical_skill
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
-- Table structure for prescription
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
-- Table structure for pur_order
-- ----------------------------
DROP TABLE IF EXISTS `pur_order`;
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='采购单';

-- ----------------------------
-- Records of pur_order
-- ----------------------------
INSERT INTO `pur_order` VALUES ('23', '200518306', '2020-05-18', '1', '14.0000', null, '', '2020-05-18 13:08:58', '2020-05-18 13:08:58');
INSERT INTO `pur_order` VALUES ('24', '200518875', '2020-05-18', '1', '14.0000', null, '', '2020-05-18 13:40:13', '2020-05-18 13:40:13');

-- ----------------------------
-- Table structure for pur_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `pur_order_detail`;
CREATE TABLE `pur_order_detail` (
  `pur_order_detail_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `pur_order_id` bigint(20) unsigned DEFAULT NULL COMMENT '采购单ID',
  `item_id` bigint(20) unsigned DEFAULT NULL COMMENT '品目ID',
  `item_name` varchar(50) DEFAULT NULL COMMENT '品目名称',
  `item_type` varchar(50) DEFAULT NULL COMMENT '品目类型',
  `batch_number` varchar(50) DEFAULT NULL COMMENT '批号',
  `manufacture_date` varchar(10) DEFAULT NULL COMMENT '生产日期',
  `expire_date` varchar(10) DEFAULT NULL COMMENT '有效期至',
  `pur_count` decimal(14,4) unsigned DEFAULT NULL COMMENT '采购数量',
  `pur_unit_name` varchar(5) DEFAULT NULL COMMENT '进货包装',
  `unit_price` decimal(14,4) unsigned DEFAULT NULL COMMENT '进价',
  `total_price` decimal(14,4) unsigned DEFAULT NULL COMMENT '总价',
  PRIMARY KEY (`pur_order_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='采购单明细';

-- ----------------------------
-- Records of pur_order_detail
-- ----------------------------
INSERT INTO `pur_order_detail` VALUES ('31', '23', '210', '麻黄', 'HerbalMedicine', '', '', '', '2.0000', '斤', '7.0000', '14.0000');
INSERT INTO `pur_order_detail` VALUES ('32', '24', '210', '麻黄', 'HerbalMedicine', '', '', '', '2.0000', '斤', '7.0000', '14.0000');

-- ----------------------------
-- Table structure for pur_stock
-- ----------------------------
DROP TABLE IF EXISTS `pur_stock`;
CREATE TABLE `pur_stock` (
  `pur_stock_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `pur_order_id` bigint(20) DEFAULT NULL COMMENT '采购单ID',
  `item_id` bigint(20) unsigned DEFAULT NULL COMMENT '品目ID',
  `item_name` varchar(50) DEFAULT NULL COMMENT '品目名称',
  `item_type` varchar(50) DEFAULT NULL COMMENT '品目类型',
  `batch_number` varchar(50) DEFAULT NULL COMMENT '批号',
  `manufacture_date` varchar(10) DEFAULT NULL COMMENT '生产日期',
  `expire_date` varchar(10) DEFAULT NULL COMMENT '有效期至',
  `stock_count` decimal(14,4) DEFAULT NULL COMMENT '库存数量',
  `stock_unit_name` varchar(10) DEFAULT NULL COMMENT '库存单位',
  `selling_price` decimal(14,4) DEFAULT NULL COMMENT '零售价',
  `stock_state` tinyint(1) unsigned DEFAULT '1' COMMENT '库存状态(1：正常；2：已退货；3：已过期)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`pur_stock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='库存明细';

-- ----------------------------
-- Records of pur_stock
-- ----------------------------
INSERT INTO `pur_stock` VALUES ('18', '23', '210', '麻黄', 'HerbalMedicine', '', '', '', null, null, '0.1000', '1', '2020-05-18 13:28:48', '2020-05-18 13:28:48');
INSERT INTO `pur_stock` VALUES ('19', '24', '210', '麻黄', 'HerbalMedicine', '', '', '', null, null, '0.1000', '1', '2020-05-18 13:40:32', '2020-05-18 13:40:32');

-- ----------------------------
-- Table structure for pur_supplier
-- ----------------------------
DROP TABLE IF EXISTS `pur_supplier`;
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

-- ----------------------------
-- Records of pur_supplier
-- ----------------------------
INSERT INTO `pur_supplier` VALUES ('1', '安国药材', '李安国', '15613305755', '', '', '中药材批发', '保定安国');
INSERT INTO `pur_supplier` VALUES ('2', '周楼周俊晓', '周俊晓', '15613308755', '', '', '中药材批发', '周楼');
INSERT INTO `pur_supplier` VALUES ('3', '隔壁老王', '王子君', '15636584588', '赵无延', '16525664587', '医疗用品，耗材', '河南安阳');

-- ----------------------------
-- Table structure for rx_catalog
-- ----------------------------
DROP TABLE IF EXISTS `rx_catalog`;
CREATE TABLE `rx_catalog` (
  `catalog_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '目录ID',
  `parent_catalog_id` int(10) unsigned DEFAULT NULL COMMENT '父目录ID',
  `catalog_type` tinyint(1) NOT NULL COMMENT '目录类型(1:目录;2:方剂)',
  `catalog_name` varchar(50) NOT NULL COMMENT '目录名称',
  `catalog_order` int(3) DEFAULT NULL COMMENT '目录顺序',
  PRIMARY KEY (`catalog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='方剂目录';

-- ----------------------------
-- Records of rx_catalog
-- ----------------------------
INSERT INTO `rx_catalog` VALUES ('33', null, '1', '补益剂', '0');
INSERT INTO `rx_catalog` VALUES ('34', '33', '1', '补血剂', '0');
INSERT INTO `rx_catalog` VALUES ('35', '34', '2', '当归补血汤', '0');

-- ----------------------------
-- Table structure for rx_catalogue
-- ----------------------------
DROP TABLE IF EXISTS `rx_catalogue`;
CREATE TABLE `rx_catalogue` (
  `catalogue_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '目录ID',
  `parent_catalogue_id` int(10) unsigned DEFAULT NULL COMMENT '父目录ID',
  `catalogue_type` tinyint(1) NOT NULL COMMENT '目录类型(1:目录;2:处方)',
  `catalogue_name` varchar(50) NOT NULL COMMENT '目录名称',
  `catalogue_order` int(3) DEFAULT NULL COMMENT '目录顺序',
  PRIMARY KEY (`catalogue_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='处方目录';

-- ----------------------------
-- Records of rx_catalogue
-- ----------------------------
INSERT INTO `rx_catalogue` VALUES ('33', null, '1', '补益剂', '0');
INSERT INTO `rx_catalogue` VALUES ('34', '33', '1', '补血剂', '0');
INSERT INTO `rx_catalogue` VALUES ('35', '34', '2', '当归补血汤', '0');
INSERT INTO `rx_catalogue` VALUES ('36', null, '1', '新增分类', '1');
INSERT INTO `rx_catalogue` VALUES ('37', null, '1', '新增分类', '2');
INSERT INTO `rx_catalogue` VALUES ('38', '37', '1', '新增目录', '0');
INSERT INTO `rx_catalogue` VALUES ('39', '38', '1', '新增目录', '0');
INSERT INTO `rx_catalogue` VALUES ('40', null, '1', '新增分类', '3');

-- ----------------------------
-- Table structure for rx_detail
-- ----------------------------
DROP TABLE IF EXISTS `rx_detail`;
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

-- ----------------------------
-- Records of rx_detail
-- ----------------------------
INSERT INTO `rx_detail` VALUES ('5', '当归补血汤', null, '35', '伤寒论', '黄芪30g  当归6g', '日三次，空腹服用', '补血', '', '');

-- ----------------------------
-- Table structure for settle_account
-- ----------------------------
DROP TABLE IF EXISTS `settle_account`;
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

-- ----------------------------
-- Records of settle_account
-- ----------------------------
INSERT INTO `settle_account` VALUES ('1', '7', null, '240.00', null, null, null, null, '1', null);
INSERT INTO `settle_account` VALUES ('2', '8', null, '150.00', null, null, null, null, '1', null);
INSERT INTO `settle_account` VALUES ('3', '9', null, '180.00', null, null, null, null, '1', null);
INSERT INTO `settle_account` VALUES ('4', '10', null, '150.00', null, null, null, null, '1', null);
INSERT INTO `settle_account` VALUES ('5', '11', null, '150.00', null, null, null, null, '1', null);
INSERT INTO `settle_account` VALUES ('6', '12', '15613305755', '300.00', '23.50', '300.00', '23.50', '2', '2', '2019-11-03 17:08:50');
INSERT INTO `settle_account` VALUES ('7', '12', null, '300.00', null, null, null, null, '1', null);

-- ----------------------------
-- Table structure for sys_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionary`;
CREATE TABLE `sys_dictionary` (
  `dict_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `dict_key` varchar(50) NOT NULL COMMENT '字典键',
  `dict_name` varchar(50) NOT NULL COMMENT '字典名称或字典项名称',
  `dict_value` varchar(50) DEFAULT NULL COMMENT '字典项的值',
  `dict_order` decimal(10,5) DEFAULT NULL COMMENT '顺序号',
  `is_use` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否有效',
  `dict_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '字典类型；1：字典类型；2：字典项',
  PRIMARY KEY (`dict_id`)
) ENGINE=InnoDB AUTO_INCREMENT=344 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dictionary
-- ----------------------------
INSERT INTO `sys_dictionary` VALUES ('25', 'CGPMFL', '采购品目分类', null, null, '1', '1');
INSERT INTO `sys_dictionary` VALUES ('26', 'CGPMFL', '中药材', '1', '1.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('27', 'CGPMFL', '中成药', '2', '2.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('28', 'CGPMFL', '中药饮片', '3', '3.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('29', 'CGPMFL', '医疗用品', '4', '4.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('30', 'CGPMFL', '其他耗材', '5', '5.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('91', 'LSDW', '零售单位', null, null, '1', '1');
INSERT INTO `sys_dictionary` VALUES ('92', 'LSDW', '克', '1', '1.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('93', 'LSDW', '毫克', '2', '2.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('94', 'LSDW', '升', '3', '3.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('95', 'LSDW', '毫升', '4', '4.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('96', 'LSDW', '盒', '5', '5.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('97', 'LSDW', '瓶', '6', '6.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('98', 'LSDW', '袋', '7', '7.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('99', 'LSDW', '包', '8', '8.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('100', 'LSDW', '支', '9', '9.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('101', 'LSDW', '片', '10', '10.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('102', 'LSDW', '粒', '11', '11.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('103', 'LSDW', '个', '12', '12.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('104', 'LSDW', '套', '13', '13.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('105', 'LSDW', '贴', '14', '14.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('126', 'JHBZ', '进货包装', null, null, '1', '1');
INSERT INTO `sys_dictionary` VALUES ('127', 'JHBZ', '公斤', '1', '1.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('128', 'JHBZ', '斤', '2', '2.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('129', 'JHBZ', '箱', '17', '2.50000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('130', 'JHBZ', '盒', '3', '3.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('131', 'JHBZ', '瓶', '4', '4.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('132', 'JHBZ', '袋', '5', '5.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('133', 'JHBZ', '支', '6', '6.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('134', 'JHBZ', '板', '7', '7.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('135', 'JHBZ', '片', '8', '8.00000', '0', '2');
INSERT INTO `sys_dictionary` VALUES ('136', 'JHBZ', '包', '9', '9.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('137', 'JHBZ', '粒', '10', '10.00000', '0', '2');
INSERT INTO `sys_dictionary` VALUES ('138', 'JHBZ', '卷', '11', '11.00000', '0', '2');
INSERT INTO `sys_dictionary` VALUES ('139', 'JHBZ', '个', '12', '12.00000', '0', '2');
INSERT INTO `sys_dictionary` VALUES ('140', 'JHBZ', '筒', '13', '13.00000', '0', '2');
INSERT INTO `sys_dictionary` VALUES ('141', 'JHBZ', '桶', '14', '14.00000', '0', '2');
INSERT INTO `sys_dictionary` VALUES ('142', 'JHBZ', '组', '15', '15.00000', '0', '2');
INSERT INTO `sys_dictionary` VALUES ('143', 'JHBZ', '条', '16', '16.00000', '0', '2');
INSERT INTO `sys_dictionary` VALUES ('144', 'JHBZ', '套', '18', '18.00000', '0', '2');
INSERT INTO `sys_dictionary` VALUES ('145', 'JHBZ', '对', '19', '19.00000', '0', '2');
INSERT INTO `sys_dictionary` VALUES ('146', 'PMFL', '品目分类', null, null, '1', '1');
INSERT INTO `sys_dictionary` VALUES ('147', 'PMFL', '中药', 'HerbalMedicine', '1.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('148', 'PMFL', '成药', 'PatentMedicine', '2.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('149', 'PMFL', '医疗用品', 'MedicalSupply', '3.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('150', 'PMFL', '其他耗材', 'Consumable', '4.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('151', 'PMFL', '方剂', 'Prescription', '7.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('152', 'PMFL', '经络', 'Meridian', '5.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('153', 'PMFL', '诊疗项目', 'Skill', '8.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('154', 'PMFL', '腧穴', 'Acupoint', '6.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('163', 'FJCC', '方剂出处', null, null, '1', '1');
INSERT INTO `sys_dictionary` VALUES ('164', 'FJCC', '伤寒论', '1', '1.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('165', 'FJCC', '金匮要略', '2', '2.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('166', 'FJCC', '温病条辨', '3', '3.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('167', 'FJCC', '太平惠民和剂局方', '4', '4.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('168', 'FJCC', '景岳全书', '5', '5.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('169', 'FJCC', '东垣试效方', '6', '6.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('170', 'FJCC', '疫疹一得', '7', '7.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('171', 'FJCC', '卫生宝鉴', '8', '8.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('172', 'FJCC', '宣明论方', '9', '9.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('175', 'PatentMedicine', '成药分类', null, null, '1', '1');
INSERT INTO `sys_dictionary` VALUES ('176', 'PatentMedicine', '补血', '1', '1.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('177', 'Meridian', '经络分类', null, null, '1', '1');
INSERT INTO `sys_dictionary` VALUES ('178', 'Meridian', '正经', '1', '1.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('179', 'Acupoint', '经络', null, null, '1', '1');
INSERT INTO `sys_dictionary` VALUES ('180', 'Acupoint', '手太阴肺经', '1', '1.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('181', 'Prescription', '方剂分类', null, null, '1', '1');
INSERT INTO `sys_dictionary` VALUES ('182', 'Prescription', '涌吐', '1', '1.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('312', 'HerbalMedicine', '中药分类', null, null, '1', '1');
INSERT INTO `sys_dictionary` VALUES ('313', 'HerbalMedicine', '辛温解表药', '1', '1.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('314', 'HerbalMedicine', '辛凉解表药', '2', '2.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('315', 'HerbalMedicine', '清热泻火药', '3', '3.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('316', 'HerbalMedicine', '清热燥湿药', '4', '4.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('317', 'HerbalMedicine', '清热凉血药', '5', '5.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('318', 'HerbalMedicine', '清热解毒药', '6', '6.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('319', 'HerbalMedicine', '清虚热药', '7', '7.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('320', 'HerbalMedicine', '攻下药', '8', '8.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('321', 'HerbalMedicine', '润下药', '9', '9.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('322', 'HerbalMedicine', '峻下逐水药', '10', '10.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('323', 'HerbalMedicine', '祛风湿药', '11', '11.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('324', 'HerbalMedicine', '芳香化湿药', '12', '12.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('325', 'HerbalMedicine', '利水渗湿药', '13', '13.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('326', 'HerbalMedicine', '温里药', '14', '14.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('327', 'HerbalMedicine', '理气药', '15', '15.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('328', 'HerbalMedicine', '消食药', '16', '16.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('329', 'HerbalMedicine', '驱虫药', '17', '17.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('330', 'HerbalMedicine', '止血药', '18', '18.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('331', 'HerbalMedicine', '活血祛瘀药', '19', '19.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('332', 'HerbalMedicine', '化痰药', '20', '20.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('333', 'HerbalMedicine', '止咳平喘药', '21', '21.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('334', 'HerbalMedicine', '安神药', '22', '22.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('335', 'HerbalMedicine', '平肝熄风药', '23', '23.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('336', 'HerbalMedicine', '开窍药', '24', '24.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('337', 'HerbalMedicine', '补气药', '25', '25.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('338', 'HerbalMedicine', '补阳药', '26', '26.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('339', 'HerbalMedicine', '补血药', '27', '27.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('340', 'HerbalMedicine', '补阴药', '28', '28.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('341', 'HerbalMedicine', '收涩药', '29', '29.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('342', 'HerbalMedicine', '涌吐药', '30', '30.00000', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('343', 'HerbalMedicine', '外用药及其他', '31', '31.00000', '1', '2');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `parent_menu_id` bigint(20) NOT NULL COMMENT '父级菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `menu_url` varchar(255) DEFAULT NULL COMMENT '菜单URL',
  `menu_icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `menu_order` decimal(10,5) DEFAULT NULL COMMENT '菜单顺序号',
  `is_valid` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否有效',
  PRIMARY KEY (`menu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=225 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('51', '0', '系统管理', '', 'layui-icon-home', '1.00000', '1');
INSERT INTO `sys_menu` VALUES ('52', '51', '菜单管理', '/views/module/system/menu/menu.html', '', '1.00000', '1');
INSERT INTO `sys_menu` VALUES ('53', '51', '字典管理', '/views/module/system/dictionary/dictionary.html', '', '2.00000', '1');
INSERT INTO `sys_menu` VALUES ('157', '0', '采购管理', '', 'layui-icon-component', '2.00000', '1');
INSERT INTO `sys_menu` VALUES ('158', '157', '采购品目', '/views/module/purchase/item/purItem.html', '', '2.00000', '0');
INSERT INTO `sys_menu` VALUES ('167', '157', '新建采购单', '/views/module/purchase/order/orderForm.html', '', '3.00000', '1');
INSERT INTO `sys_menu` VALUES ('205', '0', '病历管理', '', 'layui-icon-component', '5.00000', '1');
INSERT INTO `sys_menu` VALUES ('206', '205', '新建病历', '/views/module/record/medicalRecordForm.html', '', '1.00000', '1');
INSERT INTO `sys_menu` VALUES ('208', '157', '供应商', '/views/module/purchase/supplier/supplier.html', '', '1.00000', '1');
INSERT INTO `sys_menu` VALUES ('209', '157', '采购单查询', '/views/module/purchase/order/orderQuery.html', '', '4.00000', '1');
INSERT INTO `sys_menu` VALUES ('210', '157', '库存盘点', '/views/module/purchase/stock/purStockQuery.html', '', '5.00000', '1');
INSERT INTO `sys_menu` VALUES ('215', '0', '品目管理', '', 'layui-icon-component', '1.50000', '1');
INSERT INTO `sys_menu` VALUES ('216', '215', '中药', '/views/module/item/herbalmedicine/herbalMedicine.html', '', '1.00000', '1');
INSERT INTO `sys_menu` VALUES ('212', '0', '医技项目', '/views/module/skill/medicalSkill.html', 'layui-icon-component', '3.00000', '0');
INSERT INTO `sys_menu` VALUES ('213', '0', '方剂管理', '/views/module/prescription/prescription.html', 'layui-icon-component', '4.00000', '0');
INSERT INTO `sys_menu` VALUES ('214', '205', '病历查询', '/views/module/pharmacy/pharmacyitem/pharmacyItem.html', '', '2.00000', '1');
INSERT INTO `sys_menu` VALUES ('217', '215', '成药', '/views/module/item/patentmedicine/patentMedicine.html', '', '2.00000', '1');
INSERT INTO `sys_menu` VALUES ('218', '215', '方剂', '/views/module/item/prescription/prescription.html', '', '3.00000', '1');
INSERT INTO `sys_menu` VALUES ('219', '215', '经络', '/views/module/item/meridian/meridian.html', '', '4.00000', '1');
INSERT INTO `sys_menu` VALUES ('220', '215', '医疗用品', '/views/module/item/medicalsupply/medicalSupply.html', '', '5.00000', '1');
INSERT INTO `sys_menu` VALUES ('221', '215', '其他耗材', '/views/module/item/consumable/consumable.html', '', '6.00000', '1');
INSERT INTO `sys_menu` VALUES ('222', '215', '诊疗项目', '/views/module/item/skill/skill.html', '', '7.00000', '1');
INSERT INTO `sys_menu` VALUES ('223', '215', '新增品目', '/views/module/item/add/itemAdd.html', '', '0.00000', '0');
INSERT INTO `sys_menu` VALUES ('224', '215', '腧穴', '/views/module/item/acupoint/acupoint.html', '', '4.50000', '1');

-- ----------------------------
-- View structure for item_purchase
-- ----------------------------
DROP VIEW IF EXISTS `item_purchase`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `item_purchase` AS select `item_herbal_medicine`.`item_id` AS `item_id`,`item_herbal_medicine`.`item_name` AS `item_name`,'HerbalMedicine' AS `item_type`,`item_herbal_medicine`.`abbr_pinyin` AS `abbr_pinyin`,`item_herbal_medicine`.`full_pinyin` AS `full_pinyin`,`item_herbal_medicine`.`pur_unit` AS `pur_unit`,`item_herbal_medicine`.`stock_unit` AS `stock_unit`,`item_herbal_medicine`.`unit_convert` AS `unit_convert`,`item_herbal_medicine`.`stock_warn` AS `stock_warn` from `item_herbal_medicine` union all select `item_medical_supply`.`item_id` AS `item_id`,`item_medical_supply`.`item_name` AS `item_name`,'MedicalSupply' AS `item_type`,`item_medical_supply`.`abbr_pinyin` AS `abbr_pinyin`,`item_medical_supply`.`full_pinyin` AS `full_pinyin`,`item_medical_supply`.`pur_unit` AS `pur_unit`,`item_medical_supply`.`stock_unit` AS `stock_unit`,`item_medical_supply`.`unit_convert` AS `unit_convert`,`item_medical_supply`.`stock_warn` AS `stock_warn` from `item_medical_supply` union all select `item_patent_medicine`.`item_id` AS `item_id`,`item_patent_medicine`.`item_name` AS `item_name`,'PatentMedicine' AS `item_type`,`item_patent_medicine`.`abbr_pinyin` AS `abbr_pinyin`,`item_patent_medicine`.`full_pinyin` AS `full_pinyin`,`item_patent_medicine`.`pur_unit` AS `pur_unit`,`item_patent_medicine`.`stock_unit` AS `stock_unit`,`item_patent_medicine`.`unit_convert` AS `unit_convert`,`item_patent_medicine`.`stock_warn` AS `stock_warn` from `item_patent_medicine` union all select `item_consumable`.`item_id` AS `item_id`,`item_consumable`.`item_name` AS `item_name`,'Consumable' AS `item_type`,`item_consumable`.`abbr_pinyin` AS `abbr_pinyin`,`item_consumable`.`full_pinyin` AS `full_pinyin`,`item_consumable`.`pur_unit` AS `pur_unit`,`item_consumable`.`pur_unit` AS `stock_unit`,1 AS `unit_convert`,100000 AS `stock_warn` from `item_consumable` ;
