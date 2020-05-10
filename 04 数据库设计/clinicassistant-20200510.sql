/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50727
Source Host           : localhost:3306
Source Database       : clinicassistant

Target Server Type    : MYSQL
Target Server Version : 50727
File Encoding         : 65001

Date: 2020-05-10 14:42:35
*/

SET FOREIGN_KEY_CHECKS=0;

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
INSERT INTO `hibernate_sequence` VALUES ('208');

-- ----------------------------
-- Table structure for `medical_record`
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
-- Table structure for `med_skill`
-- ----------------------------
DROP TABLE IF EXISTS `med_skill`;
CREATE TABLE `med_skill` (
  `skill_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `skill_name` varchar(50) DEFAULT NULL COMMENT '项目名称',
  `unit_price` decimal(12,2) unsigned DEFAULT NULL COMMENT '单价',
  PRIMARY KEY (`skill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='医技项目';

-- ----------------------------
-- Records of med_skill
-- ----------------------------
INSERT INTO `med_skill` VALUES ('1', '电针', '30.00');
INSERT INTO `med_skill` VALUES ('3', '艾灸', '40.00');
INSERT INTO `med_skill` VALUES ('4', '药饼灸', '50.00');
INSERT INTO `med_skill` VALUES ('5', '温针灸', '50.00');

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
-- Table structure for `pur_item`
-- ----------------------------
DROP TABLE IF EXISTS `pur_item`;
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

-- ----------------------------
-- Records of pur_item
-- ----------------------------
INSERT INTO `pur_item` VALUES ('1', '当归', '1', null, 'DG', 'danggui', '甘、辛，温。归 肝 、心 、脾经 。', '补 血活血 ，调经 止痛，润肠通便。', null, null, '6-12g。', '', null, '0', '1', '1', '1000', '500.000000');
INSERT INTO `pur_item` VALUES ('2', '黄芪', '1', null, 'HQ', 'huangqi', '甘，微温。归肺、脾经。', '补气升阳，固表止汗，利水消肿，生津养血，行滞通痹，托毒排脓，敛疮生肌。', null, null, '9-30g。', '', null, '0', '1', '1', '1000', '500.000000');
INSERT INTO `pur_item` VALUES ('3', '川贝', '1', null, 'CB', 'chuanbei', '苦、甘,微寒。归肺、心经。', '淸热润肺，化痰止咳，散结消痈。', null, null, '3〜10g;研粉冲服，一次1〜2g。', '不宜与川乌、制川乌、草乌、制草乌、附子同用。', null, '0', '1', '1', '1000', '500.000000');
INSERT INTO `pur_item` VALUES ('4', '金银花', '1', '', 'JYH', 'jinyinhua', null, '', '', '', '', '', '', '0', '1', '1', '1000', '500.000000');
INSERT INTO `pur_item` VALUES ('5', '三七', '1', '', 'SQ', 'sanqi', null, '', '', '', '', '', '', '0', '1', '1', '1000', '500.000000');
INSERT INTO `pur_item` VALUES ('6', '党参', '1', '', 'DS', 'dangshen', null, '', '', '', '', '', '', '0', '1', '1', '1000', '500.000000');
INSERT INTO `pur_item` VALUES ('7', '白术', '1', '', 'BZ', 'baizhu', null, '', '', '', '', '', '', '0', '1', '1', '1000', '500.000000');
INSERT INTO `pur_item` VALUES ('8', '人参', '1', '', 'RS', 'renshen', null, '', '', '', '', '', '', '0', '1', '1', '1000', '500.000000');
INSERT INTO `pur_item` VALUES ('9', '茯苓', '1', '', 'FL', 'fuling', null, '', '', '', '', '', '', '0', '1', '1', '1000', '500.000000');
INSERT INTO `pur_item` VALUES ('10', '甘草', '1', '', 'GC', 'gancao', null, '', '', '', '', '', '', '0', '1', '1', '1000', '500.000000');
INSERT INTO `pur_item` VALUES ('11', '熟地', '1', '', 'SD', 'shudi', null, '', '', '', '', '', '', '0', '1', '1', '1000', '500.000000');
INSERT INTO `pur_item` VALUES ('12', '鸡血藤', '1', '', 'JXT', 'jixieteng', null, '', '', '', '', '', '', '0', '1', '1', '1000', '500.000000');
INSERT INTO `pur_item` VALUES ('13', '西洋参', '1', '', 'XYS', 'xiyangshen', null, '', '', '', '', '', '', '0', '1', '1', '1000', '500.000000');
INSERT INTO `pur_item` VALUES ('14', '板蓝根', '1', '', 'BLG', 'banlangen', null, '', '', '', '', '', '', '0', '1', '1', '1000', '500.000000');
INSERT INTO `pur_item` VALUES ('15', '柴胡', '1', '', 'CH', 'chaihu', null, '', '', '', '', '', '', '0', '1', '1', '1000', '500.000000');
INSERT INTO `pur_item` VALUES ('16', '半夏', '1', '', 'BX', 'banxia', null, '', '', '', '', '', '', '0', '1', '1', '1000', '500.000000');
INSERT INTO `pur_item` VALUES ('17', '枸杞子', '1', '', 'GQZ', 'gouqizi', null, '', '', '', '', '', '', '0', '1', '1', '1000', '500.000000');
INSERT INTO `pur_item` VALUES ('18', '川芎', '1', '', 'CX', 'chuanxiong', null, '', '', '', '', '', '', '0', '1', '1', '1000', '500.000000');
INSERT INTO `pur_item` VALUES ('19', '六味地黄丸', '2', '', 'LWDHW', 'liuweidihuangwan', null, '滋阴补肾。用于肾阴亏损，头晕耳鸣，腰膝酸软，骨蒸潮热，盗汗遗精。', '熟地黄、山茱萸(制)、山药、牡丹皮、茯苓、泽泻。', '每丸重9克', '口服。小蜜丸一次9克，一日2次。', '忌辛辣食物及不易消化食物。', '江西药都樟树制药有限公司 ', '0', '4', '3', '1', '10.000000');
INSERT INTO `pur_item` VALUES ('20', '双黄连颗粒', '2', '', 'SHLKL', 'shuanghuangliankeli', null, '疏风解表，清热解毒。用于外感风热所致的感冒，症见发热、咳嗽、咽痛。', '金银花、黄芩、连翘。', '颗粒剂。每袋装5克。', '开水冲服，一日3次，一次10克；小儿酌减或遵医嘱。', '孕妇及脾胃虚寒者慎服。', '', '0', '3', '2', '1', '10.000000');
INSERT INTO `pur_item` VALUES ('21', '荆防败毒丸', '2', '', 'JFBDW', 'jingfangbaiduwan', null, '清热散风，解毒消肿。用于流行性感冒，恶寒发热，头痛咳嗽，瘟毒发颐。', '防风、荆芥、赤茯苓、羌活、独活、川芎、柴胡(去头)、薄荷、前胡、桔梗(去芦)、枳壳、党参(去芦)、甘草。', '水丸剂。每10粒重1克，每袋9克。', '口服。一次1袋，一日2次。', '忌食生凉饮食。', '', '0', '3', '2', '1', '10.000000');
INSERT INTO `pur_item` VALUES ('24', '当归饮片', '3', '', 'DGYP', 'dangguiyinpian', null, null, null, '50g/袋', '3-10g', '', '河北', '0', '17', '6', '50', '50.000000');
INSERT INTO `pur_item` VALUES ('25', '蕲大妈十年陈艾柱', '4', '51755830293', 'QDMSNCAZ', 'qidamashinianchenaizhu', null, null, null, '54柱/盒', null, null, '蕲大妈', null, '17', '5', '50', '50.000000');
INSERT INTO `pur_item` VALUES ('26', '中号购物袋', '5', null, null, null, null, null, null, '中号', null, null, '陈林', null, null, null, null, null);
INSERT INTO `pur_item` VALUES ('27', '包药纸', '5', null, null, null, null, null, null, '30*30', null, null, '淘宝', null, null, null, null, null);
INSERT INTO `pur_item` VALUES ('28', '体温计', '4', '', 'TWJ', 'tiwenji', null, null, null, '', null, null, '', null, '6', '9', '1', '5.000000');
INSERT INTO `pur_item` VALUES ('29', '睡衣', '5', null, null, null, null, null, null, '', null, null, '', null, null, null, null, null);
INSERT INTO `pur_item` VALUES ('30', '床单', '5', null, null, null, null, null, null, '', null, null, '', null, null, null, null, null);
INSERT INTO `pur_item` VALUES ('31', '一次性纸杯', '5', null, null, null, null, null, null, '', null, null, '', null, null, null, null, null);
INSERT INTO `pur_item` VALUES ('32', '一次性拖鞋', '5', null, null, null, null, null, null, '', null, null, '', null, null, null, null, null);
INSERT INTO `pur_item` VALUES ('33', '针灸针', '4', '', 'ZJZ', 'zhenjiuzhen', null, null, null, '', null, null, '', null, '', '', null, null);
INSERT INTO `pur_item` VALUES ('34', '酒精', '4', '', 'JJ', 'jiujing', null, null, null, '', null, null, '', null, '', '', null, null);
INSERT INTO `pur_item` VALUES ('35', '棉球', '4', '', 'MQ', 'mianqiu', null, null, null, '', null, null, '', null, '', '', null, null);
INSERT INTO `pur_item` VALUES ('39', '煎药机', '4', '', 'JYJ', 'jianyaoji', null, null, null, '2L（200克药材）', null, null, '', null, '', '', null, null);
INSERT INTO `pur_item` VALUES ('40', '名片', '5', null, null, null, null, null, null, '', null, null, '', null, null, null, null, null);
INSERT INTO `pur_item` VALUES ('41', '宣传手册', '5', null, null, null, null, null, null, '', null, null, '', null, null, null, null, null);
INSERT INTO `pur_item` VALUES ('42', '传单', '5', null, null, null, null, null, null, '', null, null, '', null, null, null, null, null);
INSERT INTO `pur_item` VALUES ('43', '香囊袋', '5', null, null, null, null, null, null, '', null, null, '', null, null, null, null, null);

-- ----------------------------
-- Table structure for `pur_order`
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='采购单';

-- ----------------------------
-- Records of pur_order
-- ----------------------------
INSERT INTO `pur_order` VALUES ('9', '19122887', '2019-12-28', '1', '5000.0000', null, '', '2019-12-28 19:14:16', '2019-12-28 19:14:16');

-- ----------------------------
-- Table structure for `pur_order_detail`
-- ----------------------------
DROP TABLE IF EXISTS `pur_order_detail`;
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

-- ----------------------------
-- Records of pur_order_detail
-- ----------------------------
INSERT INTO `pur_order_detail` VALUES ('19', '9', '5', '', '', '', '10.0000', '200.0000', '2000.0000');
INSERT INTO `pur_order_detail` VALUES ('20', '9', '3', '', '', '', '1.0000', '3000.0000', '3000.0000');

-- ----------------------------
-- Table structure for `pur_stock`
-- ----------------------------
DROP TABLE IF EXISTS `pur_stock`;
CREATE TABLE `pur_stock` (
  `pur_stock_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `pur_order_id` bigint(20) DEFAULT NULL COMMENT '采购单ID',
  `pur_item_id` bigint(20) unsigned DEFAULT NULL COMMENT '品目ID',
  `batch_number` varchar(50) DEFAULT NULL COMMENT '批号',
  `manufacture_date` varchar(10) DEFAULT NULL COMMENT '生产日期',
  `expire_date` varchar(10) DEFAULT NULL COMMENT '有效期至',
  `stock_count` decimal(14,4) DEFAULT NULL COMMENT '库存数量',
  `selling_price` decimal(14,4) DEFAULT NULL COMMENT '零售价',
  `stock_state` tinyint(1) unsigned DEFAULT '1' COMMENT '库存状态(1：正常；2：已退货；3：已过期；4：已下架；5：已售完)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`pur_stock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='库存明细';

-- ----------------------------
-- Records of pur_stock
-- ----------------------------
INSERT INTO `pur_stock` VALUES ('15', '9', '5', '', '', '', '400.0000', '1.0000', '1', '2019-12-29 18:48:23', '2020-01-01 16:12:10');
INSERT INTO `pur_stock` VALUES ('16', '9', '3', '', '', '', '1000.0000', '5.0000', '1', '2019-12-29 18:48:23', '2020-01-01 10:28:12');

-- ----------------------------
-- Table structure for `pur_supplier`
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='供应商';

-- ----------------------------
-- Records of pur_supplier
-- ----------------------------
INSERT INTO `pur_supplier` VALUES ('1', '安国药材', '李安国', '15613305755', '', '', '中药材批发', '保定安国');
INSERT INTO `pur_supplier` VALUES ('2', '周楼周俊晓', '周俊晓', '15613308755', '', '', '中药材批发', '周楼');
INSERT INTO `pur_supplier` VALUES ('3', '隔壁老王', '王子君', '15636584588', '赵无延', '16525664587', '医疗用品，耗材', '河南安阳');

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
-- Table structure for `settle_account`
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
-- Table structure for `sys_dictionary`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionary`;
CREATE TABLE `sys_dictionary` (
  `dict_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `dict_key` varchar(50) NOT NULL COMMENT '字典键',
  `dict_name` varchar(50) NOT NULL COMMENT '字典名称或字典项名称',
  `dict_value` varchar(10) DEFAULT NULL COMMENT '字典项的值',
  `dict_order` decimal(10,5) DEFAULT NULL COMMENT '顺序号',
  `is_use` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否有效',
  `dict_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '字典类型；1：字典类型；2：字典项',
  PRIMARY KEY (`dict_id`)
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8;

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

-- ----------------------------
-- Table structure for `sys_menu`
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
) ENGINE=MyISAM AUTO_INCREMENT=215 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('51', '0', '系统管理', '', 'layui-icon-home', '1.00000', '1');
INSERT INTO `sys_menu` VALUES ('52', '51', '菜单管理', '/views/module/system/menu/menu.html', '', '1.00000', '1');
INSERT INTO `sys_menu` VALUES ('53', '51', '字典管理', '/views/module/system/dictionary/dictionary.html', '', '2.00000', '1');
INSERT INTO `sys_menu` VALUES ('157', '0', '采购管理', '', 'layui-icon-component', '2.00000', '1');
INSERT INTO `sys_menu` VALUES ('158', '157', '采购品目', '/views/module/purchase/item/purItem.html', '', '2.00000', '1');
INSERT INTO `sys_menu` VALUES ('167', '157', '新建采购单', '/views/module/purchase/order/purOrderForm.html', '', '3.00000', '1');
INSERT INTO `sys_menu` VALUES ('205', '0', '病历管理', '', 'layui-icon-component', '5.00000', '1');
INSERT INTO `sys_menu` VALUES ('206', '205', '新建病历', '/views/module/record/medicalRecordForm.html', '', '1.00000', '1');
INSERT INTO `sys_menu` VALUES ('208', '157', '供应商', '/views/module/purchase/supplier/supplier.html', '', '1.00000', '1');
INSERT INTO `sys_menu` VALUES ('209', '157', '采购单查询', '/views/module/purchase/order/purOrderQuery.html', '', '4.00000', '1');
INSERT INTO `sys_menu` VALUES ('210', '157', '库存盘点', '/views/module/purchase/stock/purStockQuery.html', '', '5.00000', '1');
INSERT INTO `sys_menu` VALUES ('212', '0', '医技项目', '/views/module/skill/medicalSkill.html', 'layui-icon-component', '3.00000', '1');
INSERT INTO `sys_menu` VALUES ('213', '0', '处方管理', '/views/module/prescription/prescription.html', 'layui-icon-component', '4.00000', '1');
INSERT INTO `sys_menu` VALUES ('214', '205', '病历查询', '/views/module/pharmacy/pharmacyitem/pharmacyItem.html', '', '2.00000', '1');
