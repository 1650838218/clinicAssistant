/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50727
Source Host           : localhost:3306
Source Database       : clinicassistant

Target Server Type    : MYSQL
Target Server Version : 50727
File Encoding         : 65001

Date: 2020-06-07 22:21:24
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
INSERT INTO `hibernate_sequence` VALUES ('564');

-- ----------------------------
-- Table structure for `item_acupoint`
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
-- Table structure for `item_all`
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
-- Table structure for `item_consumable`
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
  `pur_unit_name` varchar(10) DEFAULT NULL COMMENT '进货包装',
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='其他耗材表';

-- ----------------------------
-- Records of item_consumable
-- ----------------------------

-- ----------------------------
-- Table structure for `item_herbal_medicine`
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
  `pur_unit_name` varchar(10) DEFAULT NULL COMMENT '进货包装',
  `stock_unit` varchar(10) DEFAULT NULL COMMENT '零售单位',
  `stock_unit_name` varchar(10) DEFAULT NULL COMMENT '零售单位',
  `unit_convert` int(10) unsigned DEFAULT NULL COMMENT '单位换算',
  `stock_warn` decimal(16,6) unsigned DEFAULT NULL COMMENT '库存预警值，保留6位小数可以精确到微克',
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='中药表';

-- ----------------------------
-- Records of item_herbal_medicine
-- ----------------------------
INSERT INTO `item_herbal_medicine` VALUES ('210', '麻黄', 'MH', 'mahuang', '1', '辛、微苦，温。归肺、膀胱经。', '发汗，平喘，利水。', null, '1.5~10g。宜先煎。解表生用，平喘炙用或生用。', '本品发汗力较强，故表虚自汗及阴虚盗汗，喘咳由于肾不纳气者均应忌用。', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('211', '桂枝', 'GZ', 'guizhi', '1', '辛、甘，温。归心、肺、膀胱经。', '发汗解表，温经通阳。', null, '3~10g。', '本品辛温助热，易伤阴动血，凡温热病及阴虚阳盛，血热妄行诸证均忌用；孕妇及月经过多着慎用', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('212', '紫苏', 'ZS', 'zisu', '1', '辛、温。归肺、脾经。', '发表散寒，行气宽中，解鱼蟹毒。', null, '3~10g。不宜久煎。', '', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('213', '生姜', 'SJ', 'shengjiang', '1', '辛，微温。归肺、脾经。', '发汗解表，温中止呕，温肺止咳。', null, '3~10g，煎服或捣汁冲服。', '本品辛温，对于阴虚内热及热盛之证忌用。', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('214', '香薷', 'XR', 'xiangru', '1', '辛，微温。归肺、胃经。', '发汗解表，和中化湿，利水消肿。', null, '3~10g。利水退肿须浓煎。', '本品发汗力较强，表虚有汗者忌用。', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('215', '荆芥', 'JJ', 'jingjie', '1', '辛，微温。归肺、肝经。', '祛风解表，止血。', null, '3~10g。不宜久煎。用于止血，须炒炭用。', '', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('216', '防风', 'FF', 'fangfeng', '1', '辛、甘，微温。归膀胱，肝，脾经。', '祛风解表，胜湿，止痛，解痉。', null, '3~10g，入煎剂、酒剂或丸散用。', '本品主要用于外风，凡血虚发痉及阴虚火旺者慎用。', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('217', '羌活', 'QH', 'qianghuo', '1', '辛、苦，温。归膀胱、肾经。', '解表散寒，祛风胜湿，止痛。', null, '3~10g。', '', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('218', '白芷', 'BZ', 'baizhi', '1', '辛，温。归肺、胃经。', '解表，祛风燥湿，消肿排脓，止痛。', null, '3~10g。', '', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('219', '藁本', 'GB', 'gaoben', '1', '辛，温。归膀胱经。', '发表散寒，祛风胜湿，止痛。', null, '2~10g。', '', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('220', '苍耳子', 'CEZ', 'cangerzi', '1', '辛、苦，温。归肺经。', '通鼻窍，祛风湿，止痛。', null, '3~10g，煎服，或入丸散。', '血虚头痛不宜用。过量易致中毒，引起呕吐、腹痛、腹泻等证。', null, '1', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('221', '辛夷', 'XY', 'xinyi', '1', '辛，温。归肺、胃经。', '散风寒，通鼻窍。', null, '3~10g。本品有毛，刺激咽喉，内服时，宜用纱布包煎。外用适量。', '', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('222', '葱白', 'CB', 'congbai', '1', '辛，温。归肺、胃经。', '发汗解表，散寒通阳，解毒散结。', null, '3~10g。外用适量。', '不宜与蜂蜜共同内服。', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('223', '胡荽', 'HS', 'husui', '1', '辛，温。归肺、胃经。', '发汗透疹。', null, '3~6g。外用适量。', '因热毒雍盛而非风寒外束所致的疹出不透忌服。', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('224', '柽柳', 'CL', 'chengliu', '1', '辛，平。归肺、胃、心经。', '发汗透疹。', null, '3~10g。外用适量。', '麻疹已透者不宜用。用量过大能令人心烦。', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('225', '薄荷', 'BH', 'bohe', '2', '辛，凉。归肝、肺经。', '疏散风热，清利头目，利咽，透疹。', null, '2~10g。不宜久煎。', '表虚自汗者不宜用。', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('226', '牛蒡子', 'NBZ', 'niubangzi', '2', '辛、苦，寒。归肺、胃经。', '疏散风热，解毒透疹，利咽散肿。', null, '3~10g，煎服或入散剂。', '本品能滑肠，气虚便溏者忌用。', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('227', '蝉蜕', 'CT', 'chantui', '2', '甘，寒。归肺、肝经。', '疏风热，透疹，明目退翳，息风止痉。', null, '3~10g，煎服或作丸散。', '', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('228', '淡豆豉', 'DDC', 'dandouchi', '2', '辛、甘、微苦，寒。归肺、胃经。', '解表，除烦。', null, '10~15g。', '', null, '0', '2', '斤', '1', '克', '500', '1000.000000');
INSERT INTO `item_herbal_medicine` VALUES ('229', '桑叶', 'SY', 'sangye', '2', '苦、甘，寒。归肺、肝经。', '疏风清热，清肝明目。', null, '5~10g，煎服或入丸散。外用煎水洗眼。', '', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('230', '菊花', 'JH', 'juhua', '2', '辛、甘、苦，微寒。归肝、肺经。', '疏风清热，解毒，明目。', null, '10~15g，煎服或入丸散。外感风热多用黄菊花，清热明目和平肝多用白菊花。', '', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('231', '蔓荆子', 'MJZ', 'manjingzi', '2', '辛、苦，平。归膀胱、肝、胃经。', '疏散风热，清利头目。', null, '6~12g，煎服或浸酒，并入丸散用。', '', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('232', '葛根', 'GG', 'gegen', '2', '甘、辛，凉。归脾、胃经。', '发表解肌，升阳透疹，解热生津。', null, '10~20g，煎服或入丸散。止泻宜煨用。', '', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('233', '柴胡', 'CH', 'chaihu', '2', '苦。辛，微寒。归心包络、肝、三焦、胆经。', '和解退热，疏肝解郁，升举阳气。', null, '3~10g。升举阳气用5~6g，疏肝解郁用10g，退热用20g以上。', '本品性能生发，故真阴亏损，肝阳上升之证忌用。', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('234', '升麻', 'SM', 'shengma', '2', '辛、甘，微寒。归肺、脾、大肠、胃经。', '发表透疹，清热解毒，升阳举陷。', null, '3~10g。升举阳气多用炙升麻。', '本品具升浮之性，凡阴虚阳浮，喘满气逆及麻疹已透，均当忌用。', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('235', '浮萍', 'FP', 'fuping', '2', '辛，寒。归肺、膀胱经。', '发汗解表，透疹，祛风止痒，利水消肿。', null, '3~10g。散剂每次1~2g。外用适量。', '', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('236', '木贼', 'MZ', 'muzei', '2', '甘、苦，平。归肺、肝经。', '疏散风热，明目退翳，止血。', null, '3~10g。', '', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('237', '石膏', 'SG', 'shigao', '3', '辛、甘，大寒。归肺、胃经。', '清热泻火，除烦止渴。', null, '15~60g。内服宜生用。入汤剂宜打碎先煎。外用须经火煅研末。', '脾胃虚寒及阴虚内热忌服。', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('238', '知母', 'ZM', 'zhimu', '3', '苦、甘，寒。归肺、胃、肾经。', '清热泻火，滋阴润燥。', null, '6~12g。', '本品性质寒润，能滑肠，故脾虚便溏者不宜用。', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('239', '芦根', 'LG', 'lugen', '3', '甘，寒。归肺、胃经。', '清热生津，止呕，除烦。', null, '15~30g。鲜品可用加倍或更高剂量 。鲜品可捣汁服。', '', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('240', '天花粉', 'THF', 'tianhuafen', '3', '苦、微甘，寒。归肺、胃经。', '清热生津，消肿排脓。', null, '10~15g，煎服或入丸散。外用研末，水或醋调敷。', '脾胃虚寒、大便滑泄者忌用。', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('241', '竹叶', 'ZY', 'zhuye', '3', '甘、淡，寒。归心、肺、胃经。', '清热除烦，生津，利尿。', null, '6~15g。', '', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('242', '栀子', 'ZZ', 'zhizi', '3', '苦，寒。归心、肺、胃、三焦经。', '泻火除烦，清热利湿，凉血解毒。', null, '3~10g。外用适量。', '脾虚便溏，食少者忌用。', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('243', '夏枯草', 'XKC', 'xiakucao', '3', '苦、辛，寒。归肝、胆经。', '清肝火，散郁结，降血压。', null, '10~15g，煎服或熬膏服。', '', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('244', '淡竹叶', 'DZY', 'danzhuye', '3', '甘、淡、寒。归心、胃、小肠经。', '清热除烦，利尿。', null, '10~15g。', '', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('245', '寒水石', 'HSS', 'hanshuishi', '3', '咸，大寒。归胃、肾经。', '清热泻火。', null, '10~15g。外用适量。', '', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('246', '鸭跖草', 'YZC', 'yazhicao', '3', '甘、苦，寒。归肺、胃、膀胱经。', '清热，解毒，利尿。', null, '15~30g；鲜品30~60g。外用适量。', '', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('247', '谷精草', 'GJC', 'gujingcao', '3', '甘，平。归肝、胃经。', '疏散风热，明目退翳。', null, '6~15g。', '', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('248', '密蒙花', 'MMH', 'mimenghua', '3', '甘，微寒。归肝经。', '清肝，明目，退翳。', null, '6~10g。', '', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('249', '青葙子', 'QXZ', 'qingxiangzi', '3', '苦，微寒。归肝经。', '清泻肝火，明目，退翳。', null, '3~15g。', '本品清热力强，且有散瞳孔的作用，肝肾虚及青光眼患者忌用。', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('250', '黄芩', 'HQ', 'huangqin', '4', '苦，寒。归肺、胆、胃、大肠经。', '清热燥湿，泻火解毒，止血，安胎。', null, '3~10g，煎服或入丸散。清热多用生黄芩，安胎多用炒制品；清上焦热可用酒芩；止血则多炒成炭用。', '本品苦寒伐生气，脾胃虚寒、少食、便溏者忌用。', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('251', '黄连', 'HL', 'huanglian', '4', '苦，寒。归心、肝、胃、大肠经。', '清热燥湿，泻火解毒。', null, '2~10g，煎服或入丸散。外用适量。', '本品大苦大寒，过量或服用较久，易致败胃。凡胃寒呕吐，脾虚泄泻之证均忌用。', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('252', '黄柏', 'HB', 'huangbai', '4', '苦，寒。归肾、膀胱、大肠经。', '清热燥湿，泻火解毒，退虚热。', null, '3~10g，煎服或入丸散。外用适量。', '本品大苦大寒，易损胃气，脾胃虚寒者忌用。', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('253', '龙胆草', 'LDC', 'longdancao', '4', '苦，寒。归肝、胆、胃经。', '清热燥湿，泻肝火。', null, '3~6g，煎服或入丸散。外用适量。', '脾胃虚寒者不宜用。', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('254', '苦参', 'KS', 'kushen', '4', '苦，寒。归心、肝、胃、大肠、膀胱经。', '清热燥湿，祛风杀虫，利尿。', null, '3~10g，煎服或入丸散。外用适量。', '苦寒之品，凡脾胃虚寒者忌用。反黎芦。', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('255', '犀角', 'XJ', 'xijiao', '5', '苦、咸，寒。归心、肝、胃经', '凉血止血，泻火解毒，安神定惊。', null, '1.5~6g，锉为细粉冲服或磨汁服，或入丸散剂。', '孕妇慎用，畏川乌，草乌。', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('256', '生地黄', 'SDH', 'shengdihuang', '5', '甘、苦，寒。归心、肝、肾经。', '清热凉血，养阴生津。', null, '10~30g，煎服或以鲜品捣汁入药。', '本品性寒而滞，脾虚湿滞，腹满便溏者不宜用。', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('257', '玄参', 'XC', 'xuancan', '5', '苦、甘、咸，寒。归肺、胃、肾经。', '清热，解毒，养阴。', null, '10~15g，煎服或入丸散。', '本品性寒而滞，脾胃虚寒，胸闷少食者不宜用。反黎芦。', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('258', '牡丹皮', 'MDP', 'mudanpi', '5', '苦、辛，微寒。归心、肝、肾经。', '清热凉血，活血散瘀。', null, '6~12g，煎服或入丸散。', '血虚有寒、孕妇及月经过多者不宜用。', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('259', '赤芍', 'CS', 'chishao', '5', '苦，微寒。归肝经。', '清热凉血，祛瘀止痛。', null, '1~15g，煎服或入丸散。', '虚寒性的经闭等忌用。反黎芦。', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('260', '紫草', 'ZC', 'zicao', '5', '甘，寒。归心、肝经。', '凉血活血，解毒透疹。', null, '3~10g，煎服，或作散剂。外用可油浸用或熬膏。', '本品有轻泻作用，脾虚便溏者忌服。', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('261', '金银花', 'JYH', 'jinyinhua', '6', '甘，寒。归肺、胃、大肠经。', '清热解毒。', null, '10~15g。外用适量。', '', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('262', '连翘', 'LQ', 'lianqiao', '6', '苦，微寒。归肺、心，胆经。', '清热解毒，消痈散结。', null, '6~15g。', '', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('263', '蒲公英', 'PGY', 'pugongying', '6', '苦、甘，寒。归肝、胃经。', '清热解毒，利湿。', null, '10~30g。外用适量。', '用量过大，可致缓泻。', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('264', '紫花地丁', 'ZHDD', 'zihuadiding', '6', '苦、辛，寒。归心、肝经。', '清热解毒。', null, '10~16g。外用适量。', '', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('265', '大青叶', 'DQY', 'daqingye', '6', '苦，大寒。归心、肺、胃经。', '清热解毒，凉血消斑。', null, '10~15g。外用适量。', '脾胃虚寒证忌用。', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('266', '青黛', 'QD', 'qingdai', '6', '咸，寒。归肝、肺、胃经。', '清热解毒，凉血散肿。', null, '1.5~3g，作散剂冲服或作丸服。外用于敷或调敷患部。', '胃寒者慎用。', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('267', '穿心莲', 'CXL', 'chuanxinlian', '6', '苦，寒。归肺、胃、大肠、小肠经。', '清热解毒，燥湿。', null, '6~15g，煎服；多作丸、散、片剂。外用适量。', '本品苦寒，不宜多服久服，以免损胃气。', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('268', '牛黄', 'NH', 'niuhuang', '6', '苦，凉。归肝、心经。', '清热解毒，息风止痉，化痰开窍。', null, '0.2~0.5g，入丸散剂。外用适量。', '孕妇慎用，非实热证不宜。', null, '0', '2', '斤', '1', '克', '500', '100.000000');
INSERT INTO `item_herbal_medicine` VALUES ('269', '蚤休(重楼)', 'ZX (CL )', 'zaoxiu(chonglou)', '6', '苦，微寒。归肝经。', '清热解毒，消肿止痛，息风定惊。', null, '5~10g，煎服或入丸散。', '', null, '1', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('270', '拳参(紫参)', 'QS(ZS)', 'quanshen(zishen)', '6', '苦，凉。', '清热解毒，去湿，散痈肿。', null, '3~12g，煎服或入丸散。外用研敷或煎水含漱、洗疮。', '', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('271', '半边莲', 'BBL', 'banbianlian', '6', '辛，寒。归心、小肠、肺经。', '清热解毒，利水消肿。', null, '干品10~15g；鲜草30~60g，煎服。外用适量。', '虚证水肿忌用。', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('272', '垂盆草', 'CPC', 'chuipencao', '6', '甘、淡、微酸，凉。归肝、胆、小肠经。', '清热解毒，利湿。', null, '10~30g；鲜品50~100g。外用适量。', '', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('273', '土茯苓', 'TFL', 'tufuling', '6', '甘、淡，平。归肝、胃经。', '解毒，除湿，利关节。', null, '15~60g。', '', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('274', '鱼腥草', 'YXC', 'yuxingcao', '6', '辛、微寒。归肺经。', '清热解毒，排脓，利尿。', null, '15~30g。外用适量。', '', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('275', '射干', 'SG', 'shegan', '6', '苦，寒。归肺经。', '清热解毒，祛痰利咽。', null, '6~10g。', '孕妇忌用或慎用。', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('276', '山豆根', 'SDG', 'shandougen', '6', '苦，寒。归肺经。', '清热解毒，利咽喉，散肿止痛。', null, '6~10g，煎服，或磨汁服。外用含漱或研末涂敷患处。', '本品苦寒，不宜于脾胃虚寒、少食、便溏者。', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('277', '马勃', 'MB', 'mabo', '6', '辛，平。归肺经。', '清肺，利咽，解毒，止血。', null, '3~6g，煎服或入丸散。外用适量。', '', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('278', '马齿苋', 'MCX', 'machixian', '6', '酸，寒。归大肠、肝经。', '清热解毒，凉血止血。', null, '30~60g，鲜品加倍。外用适量。', '', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('279', '白头翁', 'BTW', 'baitouweng', '6', '苦，寒。归大肠经。', '清热，解毒，凉血。', null, '6~15g，煎服或入丸散。', '', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('280', '秦皮', 'QP', 'qinpi', '6', '苦，寒。归肝、胆、大肠经。', '清热解毒，清肝明目。', null, '3~12g，煎服或入丸散。外用可煎水洗眼。', '', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('281', '鸦胆子', 'YDZ', 'yadanzi', '6', '苦，寒。归大肠、肝经。', '清热解毒，截疟治痢，腐蚀赘疣。', null, '每次10~15粒（治疟疾）或10~30粒（治痢）。味极苦，不宜入汤剂，可装胶囊或桂圆肉包裹吞服。外用适量。', '现已知本品对胃肠道及肝肾均有损害，不宜多用久服。胃肠出血及肝肾病患者，应忌用或慎用。', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('282', '红藤', 'HT', 'hongteng', '6', '苦，平。归大肠经。', '清热解毒，活血止痛。为治尝痈腹痛之要药。', null, '15~30g，煎服或浸酒服。', '', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('283', '败酱草', 'BJC', 'baijiangcao', '6', '辛、苦，微寒。归胃、大肠、肝经。', '清热解毒，消痈排脓，祛瘀止痛。', null, '6~15g。外用适量。', '', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('284', '白花蛇舌草', 'BHSSC', 'baihuasheshecao', '6', '微苦、甘，寒。归胃、大肠、小肠经。', '清热，利湿，解毒，消痈。', null, '15~60g。外用适量。', '', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('285', '熊胆', 'XD', 'xiongdan', '6', '苦，寒。归肝、胆、心经。', '清热解毒，止痉，明目。', null, '1~2.5g。外用适量。内服多作丸、散剂，不入汤剂。', '', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('286', '白蔹', 'BL', 'bailian', '6', '苦、辛，微寒。归心、胃、肝经。', '清热解毒，敛疮生肌。', null, '5~10g。外用适量。', '反乌头。', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('287', '白鲜皮', 'BXP', 'baixianpi', '6', '苦，寒。归脾、胃经。', '清热解毒，除湿，止痒。', null, '6~10g。外用适量。', '', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('288', '漏芦', 'LL', 'loulu', '6', '苦，寒。归胃经。', '清热解毒，消痈肿，下乳汁。', null, '3~12g。', '', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('289', '山慈菇(毛慈菇)', 'SCG (MCG)', 'shancigu(maocigu)', '6', '辛，寒。归肝、胃经。', '清热解毒，消痈散结。', null, '3~6g。外用适量。', '', null, '1', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('290', '四季青', 'SJQ', 'sijiqing', '6', '苦、涩，寒。归肺、心经。', '清热解毒，凉血，敛疮。', null, '15~30g。外用适量。', '', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('291', '金荞麦', 'JQM', 'jinqiaomai', '6', '苦，平。归肺、脾、胃经。', '清热解毒，清肺化痰，健脾消食。', null, '15~30g。', '', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('292', '地锦草', 'DJC', 'dijincao', '6', '苦、辛，平。归肝、胃、大肠经。', '清热解毒，止血，活血，利湿。', null, '15~30g。外用适量。', '', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('293', '白毛夏枯草', 'BMXKC', 'baimaoxiakucao', '6', '苦，寒。归肺、肝、心经。', '清热解毒，祛痰止咳，凉血止血。', null, '10~30g。外用适量。', '', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('294', '绿豆', 'LD', 'lvdou', '6', '甘，寒。归心、胃经。', '清热解毒，消暑。', null, '15~30g。外用适量。', '', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('295', '青蒿', 'QH', 'qinghao', '7', '苦、辛，寒。归肝、胆、肾经。', '退虚热，凉血，解暑，截疟。', null, '3~10g，煎服，或鲜用绞汁。不宜久煎。', '', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('296', '白薇', 'BW', 'baiwei', '7', '苦、咸，寒。归胃、肝经。', '清热凉血，利尿通淋，解毒疗疮。', null, '3~12g，煎服或入丸散剂。', '', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('297', '地骨皮', 'DGP', 'digupi', '7', '甘、淡，寒。归肺、肾经。', '凉血退蒸，清泄肺热。', null, '6~15g。', '外感风寒发热及脾虚便溏者不宜用。', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('298', '银柴胡', 'YCH', 'yinchaihu', '7', '甘，微寒。归肝、胃经。', '退虚热，清疳热。', null, '3~10g，煎服或入丸散。', '外感风寒，血虚无热者忌用。', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('299', '胡黄连', 'HHL', 'huhuanglian', '7', '苦，寒。归心、肝、胃、大肠经。', '退虚热，除疳热，清湿热。', null, '3~10g。', '', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('300', '大黄', 'DH', 'dahuang', '8', '苦，寒。归脾、胃、大肠、肝、心经。', '泻下攻积，清热泻火，解毒，活血祛瘀。', null, '3~12g。外用适量。生大黄泻下力较强，欲攻下者宜生用；入汤剂应后下，或用开水泡服，久煎则泻下力减弱。酒制大黄泻下力较弱，活血作用较好，宜于瘀血证及不宜峻下者。大黄炭则多用于出血证。', '妇女怀孕、月经期、哺乳期应慎用或忌用。', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('301', '芒硝', 'MX', 'mangxiao', '8', '咸、苦，寒。归胃、大肠经。', '泻下，软坚，清热。', null, '10~15g。冲入药汁内或开水溶化后服。外用适量。', '孕妇忌用。', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('302', '番泻叶', 'FXY', 'fanxieye', '8', '甘、苦，寒。归大肠经。', '泻下导滞。', null, '缓下1.5~3g，攻下5~10g，用开水泡服，入汤剂后下。', '妇女哺乳期、月经期及孕妇忌用。剂量过大，有恶心、呕吐、腹痛等副作用。', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('303', '芦荟', 'LH', 'luhui', '8', '苦，寒。归肝、大肠经。', '泻下，清肝，杀虫。', null, '1~2g，宜入丸散，不入汤剂。外用适量，研敷患处。', '脾胃虚寒、食少便溏者及孕妇忌用。', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('304', '火麻仁', 'HMR', 'huomaren', '9', '甘，平。归脾、大肠经。', '润肠通便。', null, '10~30g。', '', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('305', '郁李仁', 'YLR', 'yuliren', '9', '辛、苦，平。归大肠、小肠经。', '润肠通便，利水消肿。', null, '5~12g。', '', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('306', '甘遂', 'GS', 'gansui', '10', '苦、甘、寒。归肺、肾、大肠经。', '泻水逐饮，消肿散结。', null, '本品有效成分不溶于水，宜入丸散，每次0.5~1g。醋制可减低毒性。外用适量生用。', '虚弱者及孕妇忌用。反甘草。', null, '1', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('307', '大戟', 'DJ', 'daji', '10', '苦、辛，寒。归肺、肾、大肠经。', '泻水逐饮，消肿散结。', null, '1.5~3g，散剂每次1g。醋制以减低毒性。', '虚弱者及孕妇忌用。反甘草。', null, '1', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('308', '芫花', 'YH', 'yuanhua', '10', '辛、苦，温。归肺、肾、大肠经。', '泻水逐饮，祛痰止咳，外用杀虫疗疮。', null, '1.5~3g，散剂每次服0.6g。外用适量。醋炒以减低毒性。', '虚弱者及孕妇忌用。反甘草。', null, '1', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('309', '巴豆', 'BD', 'badou', '10', '辛，热。归胃、大肠、肺经。', '泻下冷积，逐水退肿，祛痰利咽。', null, '大多制成巴豆霜用，以减低毒性。内服0.1~0.3g，多入丸散。外用适量。', '服巴豆时，不宜食热粥、饮开水等热物，以免加剧泻下。服巴豆后如泻下不止，用黄连、黄柏煎汤冷服，或食冷粥以缓解。体弱者及孕妇忌用。畏牵牛。', null, '1', '2', '斤', '1', '克', '500', '50.000000');
INSERT INTO `item_herbal_medicine` VALUES ('310', '牵牛子', 'QNZ', 'qianniuzi', '10', '苦，寒。归肺、肾、大肠经。', '泻下，逐水，去积，杀虫。', null, '3~10g，打碎入煎；散剂1.5~3g。生用或炒用，炒用药性较缓。', '脾虚水肿及孕妇忌用。', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('311', '商陆', 'SL', 'shanglu', '10', '苦，寒。归肺、肾、大肠经。', '泻下利水，消肿散结。', null, '5~10g。外用适量', '', null, '1', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('312', '千金子', 'QJZ', 'qianjinzi', '10', '辛，温。归肝、肾、大肠经。', '逐水退肿，破血消癥。', null, '1~2g，制霜入丸散用。外用适量。', '体虚者及孕妇忌用。', null, '1', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('313', '独活', 'DH', 'duhuo', '11', '辛、苦，温。归肝、肾、膀胱经。', '祛风湿，止痛，解表。', null, '3~10g。', '', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('314', '威灵仙', 'WLX', 'weilingxian', '11', '辛、咸，温。归膀胱经。', '祛风湿，通经络，止痹痛，治骨鲠。', null, '5~10g，治骨鲠可用30g。', '本品性走窜，久服易伤正气，体弱者宜慎用。', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('315', '防己', 'FJ', 'fangji', '11', '苦、辛，寒。归膀胱、肾、脾经。', '祛风湿，止痛，利水。', null, '5~10g。', '本品苦寒较甚，不宜大量使用，以免损伤胃气。食欲不振及阴虚无湿热者忌用。', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('316', '秦艽', 'QJ', 'qinjiao', '11', '苦、辛，微寒。归胃、肝、胆经。', '祛风湿，舒筋络，清虚热。', null, '5~10g。', '', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('317', '豨莶草', 'XXC', 'xixiancao', '11', '苦，寒。归肝、肾经。', '祛风湿，通经络，清热解毒。', null, '10~15g。治风湿痹症宜制用，治痈肿、湿疹宜生用。', '', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('318', '臭梧桐', 'CWT', 'chouwutong', '11', '辛、苦、甘，凉。归肝经。', '祛风湿。', null, '5~15g。', '', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('319', '木瓜', 'MG', 'mugua', '11', '酸，温。归肝、脾经。', '舒筋活络，化湿和胃。', null, '6~12g。', '', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('320', '络石藤', 'LST', 'luoshiteng', '11', '苦，微寒。归心、肝经。', '祛风通络，凉血消肿。', null, '6~15g。', '', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('321', '徐长卿', 'XCQ', 'xuchangqing', '11', '辛，温。归肝、胃经。', '祛风止痛，止痒。', null, '3~10g，散剂1.5~3g。本品芳香入汤剂不宜久煎。', '', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('322', '桑枝', 'SZ', 'sangzhi', '11', '苦，平。归肝经。', '祛风通络。', null, '10~30g。', '', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('323', '桑寄生', 'SJS', 'sangjisheng', '11', '苦，平。归肝、肾经。', '祛风湿，补肝肾，强筋骨，安胎。', null, '10~20g。', '', null, '0', '2', '斤', '1', '克', '500', '500.000000');
INSERT INTO `item_herbal_medicine` VALUES ('324', '五加皮', 'WJP', 'wujiapi', '11', '辛、苦，温。归肝、肾经。', '祛风湿，强筋骨。', null, '5~10g。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('325', '虎骨', 'HG', 'hugu', '11', '辛，温。归肝、肾经。', '祛风定痛，强筋健骨。', null, '3~6g，入丸剂或浸酒服。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('326', '白花蛇', 'BHS', 'baihuashe', '11', '甘、咸，温。归肝经。', '祛风，活络，定惊。', null, '3~10g，研末服1~1.5g。', '', null, '1', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('327', '海桐皮', 'HTP', 'haitongpi', '11', '苦、辛，平。归肝经。', '祛风湿，通经络。', null, '6~12g。外用适量。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('328', '蚕沙', 'CS', 'cansha', '11', '甘、辛，温。归肝、脾、胃经。', '祛风除湿，和胃化浊。', null, '5~10g。外用适量。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('329', '寻骨风', 'XGF', 'xungufeng', '11', '辛、苦，平。归肝经。', '祛风湿，通络，止痛。', null, '10~15g。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('330', '海风藤', 'HFT', 'haifengteng', '11', '辛、苦，微温。归肝经。', '祛风湿，通经络。', null, '5~10g。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('331', '千年健', 'QNJ', 'qiannianjian', '11', '苦、辛，温。归肝、肾经。', '祛风湿，健筋骨。', null, '5~10g。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('332', '松节', 'SJ', 'songjie', '11', '苦，温。归肝经。', '祛风燥湿，止痛。', null, '10~15g。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('333', '苍术', 'CZ', 'cangzhu', '12', '辛、苦，温。归脾、胃经。', '燥湿健脾，祛风湿。', null, '5~10g。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('334', '厚朴', 'HP', 'houpo', '12', '苦、辛，温。归脾、胃、肺、大肠经。', '行气，燥湿，消积，平喘。', null, '3~10g。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('335', '藿香', 'HX', 'huoxiang', '12', '辛，微温。归脾、胃、肺经。', '化湿，解暑，止呕。', null, '5~10g。鲜品加倍。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('336', '佩兰', 'PL', 'peilan', '12', '辛，平。归脾、胃经。', '化湿，解暑。', null, '5~10g。鲜品加倍。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('337', '砂仁', 'SR', 'sharen', '12', '辛，温。归脾、胃经。', '化湿，行气，温中，安胎。', null, '3~6g。入汤剂宜后下。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('338', '白豆蔻', 'BDK', 'baidoukou', '12', '辛，温。归肺、脾、胃经。', '化湿，行气，温中，止呕。', null, '3~6g。入汤剂宜后下。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('339', '草豆蔻', 'CDK', 'caodoukou', '12', '辛，温。归脾、胃经。', '燥湿，温中，行气。', null, '3~6g。入汤剂宜后下。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('340', '草果', 'CG', 'caoguo', '12', '辛，温。归脾、胃经。', '燥湿，温中，截疟。', null, '3~6g。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('341', '茯苓', 'FL', 'fuling', '13', '甘、淡，平。归心、脾、肾经。', '利水渗湿，健脾，安神。', null, '10~15g。用于安神，可以朱砂拌用，处方写朱茯苓或朱衣茯苓。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('342', '猪苓', 'ZL', 'zhuling', '13', '甘、淡，平。归肾、膀胱经。', '利水渗湿。', null, '5~10g。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('343', '泽泻', 'ZX', 'zexie', '13', '甘、淡，寒。归肾、膀胱经。', '利水渗湿，泄热。', null, '5~10g。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('344', '薏苡仁', 'YYR', 'yiyiren', '13', '甘、淡，微寒。归脾、胃、肺经。', '利水渗湿，健脾，除痹，清热排脓。', null, '10~30g。本品力缓，用量须大，宜久服。健脾炒用，其余生用。除入汤剂，丸散外，亦可做羹或与粳米煮粥、饭食用，为食疗佳品。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('345', '车前子', 'CQZ', 'cheqianzi', '13', '甘，寒。归肾、肝、肺经。', '利水通淋，止泻，清肝明目，清肺化痰。', null, '5~10g，布包入汤剂。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('346', '滑石', 'HS', 'huashi', '13', '甘、淡，寒。归胃、膀胱经。', '利水通淋，清解暑热。', null, '10~15g。外用适量。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('347', '木通', 'MT', 'mutong', '13', '苦，寒。归心、小肠、膀胱经。', '利水通淋，泄热，通乳。', null, '3~6g。', '据现代文献报道，有用大剂量关木通（60g）而致急性肾功能衰竭者。故本品用量不宜过大。孕妇慎用。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('348', '通草', 'TC', 'tongcao', '13', '甘、淡，微寒。归肺、胃经。', '清热利水，通乳。', null, '2~5g。', '孕妇慎用。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('349', '金钱草', 'JQC', 'jinqiancao', '13', '甘、淡，平。归肝、胆、肾、膀胱经。', '利水通淋，除湿退黄，解毒消肿。', null, '30~60g，鲜者加倍。外用适量。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('350', '海金沙', 'HJS', 'haijinsha', '13', '甘，寒。归膀胱、小肠经。', '利水通淋。', null, '6~12g，布包入煎。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('351', '石韦', 'SW', 'shiwei', '13', '苦、甘，微寒。归肺、膀胱经。', '利水通淋，止咳。', null, '5~10g。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('352', '萆薢', 'BX', 'bixie', '13', '苦，平。归肝、胃、膀胱经。', '利湿浊，祛风湿。', null, '10~15g。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('353', '茵陈蒿', 'YCH', 'yinchenhao', '13', '苦，微寒。归脾、胃、肝、胆经。', '清利湿热，退黄疸。', null, '10~30g。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('354', '地肤子', 'DFZ', 'difuzi', '13', '苦，寒。归膀胱经。', '清热利水，止痒。', null, '10~15g。外用适量。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('355', '冬瓜皮', 'DGP', 'dongguapi', '13', '甘，微寒。归肺、小肠经。', '利水消肿。', null, '15~30g。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('356', '葫芦', 'HL', 'hulu', '13', '甘，平。归肺、小肠经。', '利水消肿。', null, '15~30g。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('357', '赤小豆', 'CXD', 'chixiaodou', '13', '甘、酸，平。归心、小肠经。', '利水消肿，解毒排脓。', null, '10~30g。外用适量。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('358', '泽漆', 'ZQ', 'zeqi', '13', '辛、苦，微寒。归大肠、小肠、肺经。', '利水消肿，化痰止咳、散结。', null, '5~10g。可敷膏供内服或外用。', '', null, '1', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('359', '萹蓄', 'BX', 'bianxu', '13', '苦，微寒。归膀胱经。', '利水通淋，杀虫止痒。', null, '10~15g，外用适量。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('360', '瞿麦', 'QM', 'qumai', '13', '苦，寒。归心、小肠、膀胱经。', '利水通淋。', null, '10~15g。', '孕妇忌用。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('361', '灯心草', 'DXC', 'dengxincao', '13', '甘、淡，微寒。归心、肺、小肠经。', '利水通淋，清心除烦。', null, '1.5~2.5g，或入丸散。治心烦惊痫，朱砂拌用，处方写朱灯心。外用煅存性研末。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('362', '冬葵子', 'DKZ', 'dongkuizi', '13', '甘，寒。归大肠、小肠、膀胱经。', '利水通淋，下乳，润肠。', null, '10~15g。', '孕妇慎用。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('363', '附子', 'FZ', 'fuzi', '14', '辛，热。归心、肾、脾经。', '回阳救逆，补火助阳，散寒止痛。', null, '3~15g。入汤剂应先煎30~60分钟以减弱其毒性。', '孕妇忌用。', null, '1', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('364', '干姜', 'GJ', 'ganjiang', '14', '辛，热。归脾、胃、心、肺经。', '温中，回阳，温肺化引。', null, '3~10g。', '孕妇慎用。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('365', '肉桂', 'RG', 'rougui', '14', '辛、甘，热。归肾、脾、心、肝经。', '补火助阳，散寒止痛，温通经脉。', null, '2~5g，研末冲服，每次1~2g，或入丸散。入汤剂应后下。官桂作用较弱，用量可适当增加。', '阴虚火旺，里有实热，血热妄行者及孕妇忌用。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('366', '吴茱萸', 'WZY', 'wuzhuyu', '14', '辛、苦，热。归肝、脾、胃经。', '散寒止痛，疏肝下气，燥湿。', null, '1.5~5g。外用适量。', '本品辛热燥烈，易损气动火，不宜多用久服，阴虚有热者忌用。', null, '1', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('367', '细辛', 'XX', 'xixin', '14', '辛，温。归肺、肾经。', '祛风，散寒止痛，温肺化饮，宜通鼻窍。', null, '1~3g。外用适量，可研末吹鼻或外敷。', '气虚多汗、阴虚阳亢头痛、阴虚肺热咳嗽等忌用；用量不宜过大；反藜芦。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('368', '花椒', 'HJ', 'huajiao', '14', '辛，热。归脾、胃、肾经。', '温中，止痛，杀虫。', null, '2~5g。外用适量。', '', null, '1', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('369', '荜茇', 'BB', 'biba', '14', '辛，热。归胃、大肠经。', '温中止痛。', null, '2~5g。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('370', '荜澄茄', 'BCQ', 'bichengqie', '14', '辛，温。归脾、胃、肾、膀胱经。', '温中止痛。', null, '2~5g。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('371', '丁香', 'DX', 'dingxiang', '14', '辛，温。归脾、胃、肾经。', '温中降逆，温肾助阳。', null, '2~5g。', '畏郁金。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('372', '高良姜', 'GLJ', 'gaoliangjiang', '14', '辛，热。归脾、胃经。', '温中止痛。', null, '3~10g。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('373', '小茴香', 'XHX', 'xiaohuixiang', '14', '辛，温。归肝、肾、脾、胃经。', '祛寒止痛，理气和胃。', null, '3~8g。外用适量。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('374', '胡椒', 'HJ', 'hujiao', '14', '辛，热。归胃、大肠经。', '温中止痛。', null, '2~4g，研粉吞服每次0.5~1g。外用适量。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('375', '陈皮', 'CP', 'chenpi', '15', '辛、苦，温。归脾、肺经。', '理气，调中，燥湿，化痰。', null, '3~10g。', '本品辛散苦燥，温能助热，舌赤少津、内有实热者须慎用。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('376', '青皮', 'QP', 'qingpi', '15', '苦、辛，温。归肝、胆、胃经。', '疏肝破气，散结消滞。', null, '3~10g。', '本品性烈耗气，气虚者当慎用。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('377', '枳实', 'ZS', 'zhishi', '15', '苦、辛，微寒。归脾、胃、大肠经。', '破气消积，化痰除痞。', null, '3~10g，大剂量可用15g。', '脾胃虚弱及孕妇慎用。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('378', '佛手', 'FS', 'foshou', '15', '辛、苦，温。归肝、脾、胃、肺经。', '舒肝，理气，和中，化痰。', null, '3~10g。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('379', '香橼', 'XY', 'xiangyuan', '15', '辛、微苦、酸，温。归肝、脾、肺经。', '疏肝，理气，和中，化痰。', null, '3~10g。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('380', '枸橘', 'GJ', 'gouju', '15', '辛、苦，温。归肝、胃经。', '破气散结，疏肝行滞。', null, '3~10g。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('381', '木香', 'MX', 'muxiang', '15', '辛、苦，温。归脾、胃、大肠、胆经。', '行气，调中，止痛。', null, '3~10g。生用专行气滞，煨熟用以止泻。', '本品辛温香燥，凡阴虚火旺者慎用。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('382', '香附', 'XF', 'xiangfu', '15', '辛、微苦、微甘，平。归肝、三焦经。', '疏肝理气，调经止痛。', null, '6~12g。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('383', '乌药', 'WY', 'wuyao', '15', '辛，温。归肺、脾、肾、膀胱经。', '行气止痛，温肾散寒。', null, '3~10g。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('384', '沉香', 'CX', 'chenxiang', '15', '辛、苦，温。归脾、胃、肾经。', '行气止痛，降逆调中，温肾纳气。', null, '1~1.5g，研末冲服，亦可用原药磨汁服。', '本品辛温助热，阴虚火旺者慎用。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('385', '川楝子', 'CLZ', 'chuanlianzi', '15', '苦，寒。归肝、胃、小肠、膀胱经。', '行气止痛，杀虫，疗癣。', null, '3~10g。外用适量。', '本品味苦性寒，凡脾胃虚寒者不宜用。', null, '1', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('386', '荔枝核', 'LZH', 'lizhihe', '15', '甘、涩，温。归肝、胃经。', '理气止痛，祛寒散滞。', null, '10~15g。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('387', '青木香', 'QMX', 'qingmuxiang', '15', '辛、苦，微寒。归肝、胃经。', '行气止痛，解毒消肿。', null, '3~10g，散剂1.5~2g，吞服。外用适量。', '本品不宜多用，多服易引起恶心呕吐。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('388', '薤白', 'XB', 'xiebai', '15', '辛、苦，温。归肺、胃、大肠经。', '通阳散结，行气导滞。', null, '5~10g。', '气虚无滞者及胃弱纳呆、不耐蒜味者不宜用。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('389', '檀香', 'TX', 'tanxiang', '15', '辛，温。归脾、胃、肺经。', '理气调中，散寒止痛。', null, '1~3g。或入丸散。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('390', '刀豆', 'DD', 'daodou', '15', '甘，温。归胃、肾经。', '降气止呃。', null, '10~15g。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('391', '柿蒂', 'SD', 'shidi', '15', '苦，平。归胃经。', '降气止呃。', null, '6~10g。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('392', '甘松', 'GS', 'gansong', '15', '辛、甘，温。归脾、胃经。', '行气止痛，开郁醒脾。', null, '3~6g。外用适量。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('393', '娑罗子(开心果)', 'SLZ(KXG)', 'suoluozi(kaixinguo)', '15', '甘，温。归肝、胃经。', '疏肝理气，宽中和胃。', null, '3~10g。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('394', '八月札', 'BYZ', 'bayuezha', '15', '苦，平。归肝、胃经。', '疏肝理气散结。', null, '6~12g。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('395', '玫瑰花', 'MGH', 'meiguihua', '15', '甘、微苦，温。归肝、脾经。', '行气解郁，和血散瘀。', null, '3~6g。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('396', '绿萼梅', 'LEM', 'lvemei', '15', '酸、涩，平。归肝、胃经。', '疏肝解郁，理气和胃。', null, '3~6g。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('397', '九香虫', 'JXC', 'jiuxiangchong', '15', '咸，温。归脾、肝、肾经。', '行气止痛，温肾助阳。', null, '3~5g。', '凡阴虚内热者忌用。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('398', '山楂', 'SZ', 'shanzha', '16', '酸、甘，微温。归脾、胃、肝经。', '消食化积，活血散瘀。', null, '10~15g，大剂量30g。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('399', '神曲', 'SQ', 'shenqu', '16', '甘、辛，温。归脾、胃经。', '消食和胃。', null, '6~15g。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('400', '麦芽', 'MY', 'maiya', '16', '甘，平。归脾、胃、肝经。', '消食和中，回乳。', null, '10~15g，大剂量30~120g。', '授乳期不宜用。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('401', '谷芽', 'GY', 'guya', '16', '甘，平。归脾、胃经。', '消食和中，健脾开胃。', null, '10~15g，大剂量30g。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('402', '莱菔子', 'LFZ', 'laifuzi', '16', '辛、甘，平。归脾、胃、肺经。', '消食化积，降气化痰。', null, '6~10g。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('403', '鸡内金', 'JNJ', 'jinajin', '16', '甘，平。归脾、胃、小肠、膀胱经。', '运脾消食，固精止遗。', null, '3~10g。研末服，每次1.5~3g，效果比煎剂好。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('404', '使君子', 'SJZ', 'shijunzi', '17', '甘，温。归脾、胃经。', '杀虫消积。', null, '6~10g。炒香嚼服，小儿每岁每天1粒~1粒半，总量不超过20粒。', '大量服用能引起呃逆、眩晕、呕吐等反应；与热茶同服，亦能引起呃逆。一般在停药后即可缓解。必要时可对证用药。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('405', '苦楝皮', 'KLP', 'kulianpi', '17', '苦，寒。归脾、胃、肝经。', '杀虫，疗癣。', null, '6~15g，鲜品15~30g。外用适量。', '本品有一定毒性，不宜持续和过量服用。体虚者慎用，肝病患者忌用。', null, '1', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('406', '槟榔', 'BL', 'binglang', '17', '辛、苦，温。归胃、大肠经。', '杀虫，消积，行气，利水。', null, '6~15g。单用杀绦虫、姜片虫时，可用60~120g。', '脾虚便溏者不宜服用。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('407', '南瓜子', 'NGZ', 'nanguazi', '17', '甘，平。归胃、大肠经。', '杀虫。', null, '60~120g。连壳或去壳后研细粉用冷开水调服。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('408', '鹤草芽', 'HCY', 'hecaoya', '17', '苦、涩，凉。归肝、小肠、大肠经。', '杀虫。', null, '本品不宜入煎。研粉吞服，每次30~50g，用温开水送服。小儿按每公斤体重用0.7~0.8g计算。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('409', '雷丸', 'LW', 'leiwan', '17', '苦，寒。归胃、大肠经。', '杀虫。', null, '6~15g。宜入丸、散剂。用以驱杀绦虫，每次服粉剂12~18g，日服3次，用冷开水调，饭后服。连服3天。', '', null, '1', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('410', '鹤虱', 'HS', 'heshi', '17', '苦、辛，平。归脾、胃经。', '杀虫。', null, '3~10g。', '', null, '1', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('411', '榧子', 'FZ', 'feizi', '17', '甘，平。归肺、大肠经。', '杀虫。', null, '30~50g。炒熟去壳，取种仁嚼服；亦可连壳生用，打碎入煎。治钩虫病，每天用30~40个，炒熟去壳，在空腹时1次嚼服，连服至大便虫卵消失为止。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('412', '芜荑', 'WY', 'wuyi', '17', '辛、苦，温。归脾、胃经。', '杀虫消疳。', null, '3~10g。外用适量。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('413', '贯众', 'GZ', 'guanzhong', '17', '苦，微寒。归肝、脾经。', '杀虫，清热解毒，止血。', null, '10~15g。用以驱虫及清热解毒宜生用；用以止血，宜炒炭用。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('414', '大蓟', 'DJ', 'daji', '18', '甘、苦，凉。归心、肝经。', '凉血止血，散瘀消痈。', null, '10~15g，鲜品可用30~60hg。外用适量，捣敷患处。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('415', '小蓟', 'XJ', 'xiaoji', '18', '甘，凉。归心、肝经。', '凉血止血，解毒消痈。', null, '10~15g，鲜品可用30~60g。外用适量', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('416', '地榆', 'DY', 'diyu', '18', '苦、酸，微寒。归肝、胃、大肠经。', '凉血止血，解毒敛疮。', null, '10~15g。外用适量。', '对于大面积烧伤，不宜使用地榆制剂外涂，以防它所含水解型鞣质被身体大量吸收而引起中毒性肝炎。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('417', '苎麻根', 'ZMG', 'zhumagen', '18', '甘，寒。归心、肝经。', '凉血止血，清热安胎，利尿，解毒。', null, '10~30g。外用适量。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('418', '紫珠', 'ZZ', 'zizhu', '18', '苦、涩，凉。归肝、肺、胃经。', '收敛止血，解毒疗疮。', null, '10~15g；研末服，每次1.5~3g。外用适量。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('419', '白茅根', 'BMG', 'baimaogen', '18', '甘，寒。归肺、胃、膀胱经。', '凉血止血，清热利尿。', null, '15~30g；鲜品30~60g。以鲜品为佳。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('420', '槐花', 'HH', 'huaihua', '18', '苦，微寒。归肝、大肠经。', '凉血止血。', null, '10~15g。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('421', '侧柏叶', 'CBY', 'cebaiye', '18', '苦、涩，微寒。归肺、肝、大肠经。', '凉血止血，祛痰止咳。', null, '10~15g。外用适量。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('422', '仙鹤草', 'XHC', 'xianhecao', '18', '苦、涩，平。归肺、肝、脾经。', '收敛止血，止痢，杀虫。', null, '10~15g，大剂量可用30~60g。外用适量。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('423', '白及', 'BJ', 'baiji', '18', '苦、甘、涩，微寒。归肺、肝、胃经。', '收敛止血，消肿生肌。', null, '3~10g；研末服，每次1.5~3g。外用适量。', '传统认为本品与乌头想反。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('424', '棕榈炭', 'ZLT', 'zonglvtan', '18', '苦、涩，平。归肺、肝、大肠经。', '收敛止血。', null, '3~10g。研末服，每次1~1.5g。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('425', '血余炭', 'XYT', 'xieyutan', '18', '苦，平。归肝、胃经。', '止血散瘀，补阴利尿。', null, '6~10g；研末服，每次1.5~3g。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('426', '三七', 'SQ', 'sanqi', '18', '甘、微苦，温。归肝。胃经。', '化瘀止血，活血定痛。', null, '3~10g。研粉吞服，每次1~1.5g。外用适量。', '本品性温，凡出血而见阴虚口干者，须配滋阴凉血药同用。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('427', '茜草', 'QC', 'qiancao', '18', '苦，寒。归肝经。', '凉血止血，活血祛瘀。', null, '10~15g。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('428', '蒲黄', 'PH', 'puhuang', '18', '甘，平。归肝、心包经。', '收涩止血，行血祛瘀。', null, '3~10g，包煎。外用适量。', '生蒲黄有收缩子宫作用，故孕妇忌服，但可用于产后子宫收缩不良的出血。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('429', '花蕊石', 'HRS', 'huaruishi', '18', '酸、涩，平。归肝经。', '止血，化瘀。', null, '10~15g；研末服，每次1~1.5g。外用适量。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('430', '艾叶', 'AY', 'aiye', '18', '苦、辛，温。归肝、脾、肾经。', '温经止血，散寒止痛。', null, '3~10g。外用适量。艾叶油（胶囊装）每次服0.1ml，每日三次。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('431', '灶心土(伏龙肝)', 'ZXT(FLG)', 'zaoxintu(fulonggan)', '18', '辛，微温。归脾、胃经。', '温中止血，止呕，止泻。', null, '15~30g，布袋包，先煎。或用60~120g，煎汤代水。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('432', '羊蹄', 'YT', 'yangti', '18', '苦、涩，寒。归心、肝、大肠经。', '凉血止血，杀虫疗癣。', null, '10~15g。外用适量。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('433', '藕节', 'OJ', 'oujie', '18', '甘、涩，平。归肝、肺、胃经。', '收敛止血。', null, '10~15g。生用止血化瘀，炒炭用收涩止血。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('434', '川芎', 'CX', 'chuanxiong', '19', '辛，温。归肝、胆、心包经。', '活血行气，祛风止痛。', null, '3~10g；研末吞服，每次1~1.5g。', '本品辛温升散，凡阴虚火旺、舌红口干者不宜应用；对妇女月经过多及出血性疾病，亦不宜应用。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('435', '乳香', 'RX', 'ruxiang', '19', '辛、苦，温。归心、肝、脾经。', '活血止痛，消肿生肌。', null, '3~10g。外用适量。', '本品味苦，入煎剂汤液浑浊，胃弱者多服易致呕吐，故用量不宜过多，对胃弱者尤应慎用。无瘀滞者及孕妇不宜用。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('436', '没药', 'MY', 'moyao', '19', '苦，平。归心、肝、脾经。', '活血止痛，消肿生肌。', null, '3~10g。外用适量。', '本品味苦，入煎剂汤液浑浊，胃弱者多服易致呕吐，故用量不宜过多，对胃弱者尤应慎用。无瘀滞者及孕妇不宜用。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('437', '延胡索', 'YHS', 'yanhusuo', '19', '辛、苦，温。归心、肝、脾经。', '活血，行气，止痛。', null, '5~10g，研末服，每次1.5~3g，用温开水送服。醋制可加强止痛之功。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('438', '郁金', 'YJ', 'yujin', '19', '辛、苦，寒。归心、肝、胆经。', '活血止痛，行气解郁，凉血清心，利胆退黄。', null, '6~12g。', '畏丁香', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('439', '姜黄', 'JH', 'jianghuang', '19', '辛、苦，温。归肝、脾经。', '破血行气，通经止痛。', null, '5~10g。外用适量。以麻油或菜油调匀成膏，外敷。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('440', '莪术', 'ES', 'eshu', '19', '辛、苦，温。归肝、脾经。', '破血祛瘀，行气止痛。', null, '3~10g。醋制能加强止痛之功。', '月经过多及孕妇忌用。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('441', '三棱', 'SL', 'sanleng', '19', '苦，平。归肝、脾经。', '破血祛瘀，行气止痛。', null, '3~10g。醋炒能加强止痛之功。', '月经过多及孕妇忌用。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('442', '丹参', 'DS', 'danshen', '19', '苦，微寒。归心、心包、肝经。', '活血祛瘀，凉血消痈，养血安神。', null, '5~15g。酒炒可增强活血之功。', '反藜芦。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('443', '虎杖', 'HZ', 'huzhang', '19', '苦，寒。归肝、胆、肺经。', '活血定痛，清热利湿，解毒，化痰止咳。', null, '10~30g。外用适量。', '孕妇忌服。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('444', '益母草', 'YMC', 'yimucao', '19', '辛、苦，微寒。归心、肝、膀胱经。', '活血祛瘀，利尿消肿。', null, '10~15g，大剂量可用30g。外用适量，取鲜品洗净，捣烂外敷。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('445', '鸡血藤', 'JXT', 'jixieteng', '19', '苦、微甘，温。归肝经。', '行血补血，舒筋活络。', null, '10~15g，大剂量可用30g。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('446', '桃仁', 'TR', 'taoren', '19', '苦，平。归心、肝、肺、大肠经。', '活血祛瘀，润肠通便。', null, '6~10g，捣碎，入煎剂。', '孕妇忌服。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('447', '红花', 'HH', 'honghua', '19', '辛，温。归心、肝经。', '活血祛瘀，通经。', null, '3~10g。', '孕妇忌用。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('448', '五灵脂', 'WLZ', 'wulingzhi', '19', '苦、甘，温。归肝经。', '活血止痛，化瘀止血。', null, '3~10g，包煎，或入丸、散用。外用适量。外治蛇虫咬伤，可配雄黄（五灵脂2份，雄黄1份），共研细末，用麻油或菜油调涂患处。', '孕妇慎用。人参畏五灵脂。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('449', '牛膝', 'NX', 'niuxi', '19', '苦、酸，平。归肝、肾经。', '活血祛瘀，补肝肾，强筋骨，利尿通淋，引血下行。', null, '6~15g。', '孕妇及月经过多者忌用。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('450', '穿山甲', 'CSJ', 'chuanshanjia', '19', '咸，微寒。归肝、胃经。', '活血通经，下乳，消肿排脓。', null, '3~10g；亦可研末吞服，每次1~1.5g。以研末吞服效果较好。', '孕妇忌用。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('451', '土鳖虫(土元)', 'TBC(TY)', 'tubiechong(tuyuan)', '19', '咸，寒。归肝经。', '破血逐瘀，续筋接骨。', null, '3~10g；研末吞服，每次1~1.5g。', '孕妇忌服。', null, '1', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('452', '水蛭', 'SZ', 'shuizhi', '19', '咸、苦，平。归肝经。', '破血逐瘀。', null, '3~6g；焙干研末吞服，每次0.3~0.5g。', '孕妇忌服。', null, '1', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('453', '虻虫', 'MC', 'mengchong', '19', '苦，微寒。归肝经。', '破血逐瘀。', null, '1~1.5g；焙干研末吞服，每次0.3g。', '孕妇忌服。', null, '1', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('454', '降香', 'JX', 'jiangxiang', '19', '辛，温。归心、肝经。', '活血散瘀，止血定痛。', null, '3~6g；研末吞服，每次1~2g。外用适量，研末外敷患处。', '凡阴虚火盛，血热妄行而无瘀滞者不宜用。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('455', '泽兰', 'ZL', 'zelan', '19', '苦、辛，微温。归肝、脾经。', '活血祛瘀，行水消肿。', null, '10~15g。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('456', '月季花', 'YJH', 'yuejihua', '19', '甘，温。归肝经。', '活血调经，消肿。', null, '3~6g。', '多用久服，可能引起便溏腹泻，故对脾胃虚弱者宜慎用；孕妇亦不宜服用。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('457', '凌霄花', 'LXH', 'lingxiaohua', '19', '辛，微寒。归肝、心包经。', '活血破瘀，凉血祛风。', null, '3~10g。外用适量。', '孕妇忌服。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('458', '自然铜', 'ZRT', 'zirantong', '19', '辛，平。归肝经。', '散瘀止痛，接骨疗伤。', null, '10~15g；煅研细末入散剂，每次0.3g。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('459', '王不留行', 'WBLX', 'wangbuliuxing', '19', '苦，平。归肝、胃经。', '活血通经，下乳。', null, '6~10g。', '孕妇慎用。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('460', '刘寄奴', 'LJN', 'liujinu', '19', '苦，温。归心、脾经。', '破血通经，散瘀止痛。', null, '3~10g。外用适量。', '孕妇忌服。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('461', '苏木', 'SM', 'sumu', '19', '甘、咸、微辛，平。归心、肝、脾经。', '活血通经，祛瘀止痛。', null, '3~10g。', '孕妇忌用。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('462', '干漆', 'GQ', 'ganqi', '19', '辛、苦，温。归肝、胃经。', '破血祛瘀，通经，杀虫。', null, '入丸散剂用，每次吞服0.06~0.1g。不宜入煎。', '本品破血通经之力较强，故孕妇及无瘀滞者忌用；又能伤营血，损胃气，故虫证体虚者亦不宜用。畏蟹。', null, '1', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('463', '半夏', 'BX', 'banxia', '20', '辛，温。归脾、胃、肺经。', '燥湿化痰，降逆止呕，消痞散结。', null, '5~10g。外用生品适量，研末用酒调敷。', '反乌头。因其性温燥，对阴亏燥咳、血证、热痰等证，当忌用或慎用。', null, '1', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('464', '天南星', 'TNX', 'tiannanxing', '20', '苦、辛，温。归肺、肝、脾经。', '燥湿化痰，祛风止痉。', null, '制南星，5~10g；生南星多入丸散用，一次量0.3~1g。外用适量。', '孕妇慎用。生南星一般不作内服。', null, '1', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('465', '白附子', 'BFZ', 'baifuzi', '20', '辛、甘，温。归脾、胃经。', '燥湿化痰，祛风止痉，解毒散结。', null, '3~5g。外用适量，熬膏敷患处。', '孕妇忌服。生品一般不作内服。', null, '1', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('466', '白芥子', 'BJZ', 'baijiezi', '20', '辛，温。归肺经。', '温肺祛痰，利气散结，通络止痛。', null, '3~10g。外用适量，研末醋调敷。', '外敷有发泡作用，皮肤过敏者忌用。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('467', '皂荚', 'ZJ', 'zaojia', '20', '辛，温。归肺、大肠经。', '祛痰，开窍。', null, '1.5~5g，焙焦存性，研粉吞服，每次0.6~1.5g。', '内服计量过大，可引起呕吐及腹泻。本品辛散走窜，凡孕妇、气虚阴亏及有咯血倾向者均不宜服。', null, '1', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('468', '桔梗', 'JG', 'jiegeng', '20', '苦、辛，平。归肺经。', '开宣肺气，祛痰，排脓。', null, '3~10g。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('469', '旋复花', 'XFH', 'xuanfuhua', '20', '苦、辛、咸，微温。归肺、脾、胃、大肠经。', '消痰行水，降气止呕。', null, '3~10g，包煎。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('470', '白前', 'BQ', 'baiqian', '20', '辛、甘，平。归肺经。', '祛痰，降气止咳。', null, '3~10g。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('471', '前胡', 'QH', 'qianhu', '20', '苦、辛，微寒。归肺经。', '降气祛痰，宜散风热。', null, '6~10g。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('472', '瓜蒌', 'GL', 'gualou', '20', '甘，寒。归肺、胃、大肠经。', '瓜蒌皮清肺化痰，利气宽胸；瓜蒌仁润肺化痰，润肠通便；全瓜蒌兼具以上功效。', null, '全瓜蒌10~20g；瓜蒌皮6~12g；瓜蒌仁10~15g。', '反乌头。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('473', '川贝母', 'CBM', 'chuanbeimu', '20', '苦、甘，微寒。归肺、心经。', '化痰止咳，清热散结。', null, '3~10g；研细粉冲服，每次1~1.5g。', '反乌头。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('474', '浙贝母', 'ZBM', 'zhebeimu', '20', '苦，寒。归肺、心经。', '化痰止咳，清热散结。', null, '3~10g；研细粉冲服，每次1~1.5g。', '反乌头。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('475', '天竺黄', 'TZH', 'tianzhuhuang', '20', '甘，寒。归心、肝、胆经。', '清热化痰，清心定惊。', null, '3~6g，入汤剂；研粉吞服，每次0.6~1g。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('476', '竹茹', 'ZR', 'zhuru', '20', '甘，微寒。归肺、胃、胆经。', '清化热痰，除烦止呕。', null, '6~10g。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('477', '竹沥', 'ZL', 'zhuli', '20', '甘，寒。归心、肺、胃经。', '清肺降火，滑痰利窍。', null, '30~50g，冲服。', '本品性寒质滑，对寒嗽及脾虚便泄者忌用。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('478', '浮海石', 'FHS', 'fuhaishi', '20', '咸，寒。归肺经。', '清肺化痰，软坚散结。', null, '6~10g。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('479', '海蛤壳', 'HGK', 'haigeke', '20', '苦、咸，寒。归肺、胃经。', '清肺化痰，软坚散结。', null, '10~15g，蛤粉宜包煎；入丸散，1~3g。外用适量。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('480', '礞石', 'MS', 'mengshi', '20', '甘、咸，平。归肺、肝经。', '下气消痰，平肝镇经。', null, '6~10g；入丸散剂，1.5~3g。', '孕妇慎用。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('481', '海藻', 'HZ', 'haizao', '20', '咸，寒。归肝、胃、肾经。', '消痰软坚，利水。', null, '10~15g。', '凡甘草。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('482', '昆布', 'KB', 'kunbu', '20', '咸，寒。归肝、胃、肾经。', '消痰软坚，利水。', null, '10~15g。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('483', '黄药子', 'HYZ', 'huangyaozi', '20', '苦，寒。归肺、肝经。', '散结消瘿，清热解毒，凉血止血。', null, '10~15g。', '本品多服、久服可引起消化道反应（如呕吐、腹泻、腹痛），并对肝功能有一定损害，故凡脾胃虚弱和有肝脏疾患的病人慎用。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('484', '胖大海', 'PDH', 'pandahai', '20', '甘，寒。归肺、大肠经。', '清宣肺气，清肠通便。', null, '3~5枚，沸水泡服或煎服。入用散剂，用量减半。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('485', '猪胆汁', 'ZDZ', 'zhudanzhi', '20', '苦，寒。归肺、肝、胆经。', '清肺化痰，清热解毒。', null, '6~10g，燉服。胆汁膏每服1g。外用（点眼与涂敷）以及灌肠，均用适量。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('486', '蔊菜', 'HC', 'hancai', '20', '辛、苦，平。归肺、肝经。', '祛痰止咳，清热解毒，利湿退黄。', null, '10~30g。外用适量。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('487', '杏仁', 'XR', 'xingren', '21', '苦，微温。归肺、大肠经。', '止咳平喘，润肠通便。', null, '3~10g，宜后下。', '有小毒，勿过量；婴儿慎用。', null, '1', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('488', '百部', 'BB', 'baibu', '21', '甘、苦，平。归肺经。', '润肺止咳，灭虱杀虫。', null, '5~10g。外用适量。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('489', '紫菀', 'ZW', 'ziwan', '21', '苦、甘，微温。归肺经。', '化痰止咳。', null, '5~10g。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('490', '款冬花', 'KDH', 'kuandonghua', '21', '辛，温。归肺经。', '润肺下气，止咳化痰。', null, '5~10g。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('491', '苏子', 'SZ', 'suzi', '21', '辛，温。归肺、大肠经。', '止咳平喘，润肠通便。', null, '5~10g。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('492', '桑白皮', 'SBP', 'sangbaipi', '21', '甘，寒。归肺经。', '泻肺平喘，利尿消肿。', null, '10~15g。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('493', '葶苈子', 'TLZ', 'tinglizi', '21', '苦、辛，大寒。归肺、膀胱经。', '泻肺平喘，利水消肿。', null, '3~10g。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('494', '枇杷叶', 'PPY', 'pipaye', '21', '苦，平。归肺、胃经。', '化痰止咳，和胃降逆。', null, '10~15g。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('495', '马兜铃', 'MDL', 'madouling', '21', '苦、微辛，寒。归肺、大肠经。', '清肺化痰，止咳平喘。', null, '3~10g。', '剂量过大，易致呕吐。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('496', '矮地茶', 'ADC', 'aidicha', '21', '苦，平。归肺、肝经。', '止咳祛痰，利水渗湿，活血祛瘀。', null, '10~30g。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('497', '白果', 'BG', 'baiguo', '21', '甘、苦、涩，平。归肺经。', '敛肺平喘，收涩止带。', null, '6~10g。', '大量与生食易引起中毒，宜加注意；咳嗽痰稠不利者慎用。', null, '1', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('498', '洋金花', 'YJH', 'yangjinhua', '21', '辛、温。归心、肺、脾经。', '止咳平喘，止痛镇痉。', null, '0.3~0.6g，散剂吞服。如作卷烟吸，分次用，每日量不超过1.5g。外用适量。', '本品有剧毒。应控制剂量，以免中毒。青光眼、眼压增高者忌用。心脏病、高血压以及体弱、孕妇当慎用。因本品服后妨碍出汗，故表证未解者忌用。又热咳痰稠、咳痰不利者亦慎用。', null, '1', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('499', '朱砂', 'ZS', 'zhusha', '22', '甘，寒。归心经。', '镇心安神，清热解毒。', null, '0.3~1g，研末冲服，入丸散剂，或拌染他药同煎。外用适量。', '内服不宜过量，也不可持续服用，免致汞中毒。肝肾功能不正常者，慎用朱砂，以免加重病情。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('500', '磁石', 'CS', 'cishi', '22', '辛、咸，寒。归肝、心、肾经。', '潜阳安神，聪耳明目，纳气平喘。', null, '10~30g。入丸、散，每次用1~3g。', '因吞服后不宜消化，如入丸、散，不可多服。脾胃虚弱者慎用。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('501', '龙骨', 'LG', 'longgu', '22', '甘、涩，微寒。归心、肝经。', '平肝潜阳，镇静安神，收敛固涩。', null, '15~30g，入煎剂宜先煎。外用适量。收敛固涩煅用，其他生用。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('502', '琥珀', 'HP', 'hupo', '22', '甘，平。归心、肝、膀胱经。', '定惊安神，活血散瘀，利尿通淋。', null, '1.5~3g，研末冲服，不入煎剂。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('503', '酸枣仁', 'SZR', 'suanzaoren', '22', '甘，平。归心、肝经。', '养心安神，敛汗。', null, '10~18g。亦可研末，睡前吞服，每服1.5~3g。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('504', '柏子仁', 'BZR', 'baiziren', '22', '甘，平。归心、肾、大肠经。', '养心安神，润肠通便。', null, '10~18g。', '便溏及多痰者慎用。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('505', '远志', 'YZ', 'yuanzhi', '22', '辛、苦，微温。归肺、心经。', '宁心安神，祛痰开窍，消痈肿。', null, '3~10g。外用适量。', '有溃疡病及胃炎者慎用。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('506', '合欢皮', 'HHP', 'hehuanpi', '22', '甘，平。归心、肝经。', '安神解郁，活血消肿。', null, '10~15g。气缓力微，需重用久服。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('507', '羚羊角', 'LYJ', 'lingyangjiao', '23', '咸，寒。归肝、心经。', '平肝息风，清肝明目，清热解毒。', null, '1~3g。入煎剂宜另煎汁冲服，亦可磨汁或锉末服，每次0.3~0.5g。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('508', '石决明', 'SJM', 'shijueming', '23', '咸，寒。归肝经。', '平肝潜阳，清肝明目。', null, '15~30g，入煎剂宜先煎。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('509', '牡蛎', 'ML', 'muli', '23', '咸，微寒。归肝、肾经。', '平肝潜阳，软件散结，收敛固涩。', null, '15~30g，先煎。除收敛固涩系煅用外，均生用。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('510', '珍珠', 'ZZ', 'zhenzhu', '23', '甘、咸，寒。归心、肝经。', '镇心定惊，清肝除翳，收敛生肌。', null, '0.3~1g，多入丸散。外用适量。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('511', '珍珠母', 'ZZM', 'zhenzhumu', '23', '咸，寒。归肝、心经。', '平肝潜阳，清肝明目。', null, '15~30g。宜先煎。外用适量。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('512', '玳瑁', 'DM', 'daimao', '23', '甘、咸，寒。归心、肝经。', '平肝定惊，清热解毒。', null, '3~6g，入丸散，少煎服。亦可水磨取汁服。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('513', '紫贝齿', 'ZBC', 'zibeichi', '23', '咸，平。归肝经。', '镇惊安神，清肝明目。', null, '10~15g，打碎，先煎。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('514', '代赭石', 'DZS', 'daizheshi', '23', '苦，寒。归肝、心经。', '平肝潜阳，降逆，止血。', null, '10~30g。', '孕妇慎用。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('515', '钩藤', 'GT', 'gouteng', '23', '甘，微寒。归肝、心包经。', '息风止痉，清热平肝。', null, '10~15g，不宜久煎。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('516', '天麻', 'TM', 'tianma', '23', '甘，平。归肝经。', '息风止痉，平肝潜阳。', null, '3~10g。研末吞服，每次1~1.5g。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('517', '刺蒺藜', 'CJL', 'cijili', '23', '苦、辛，平。归肝经。', '平肝疏肝，祛风明目。', null, '6~10g。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('518', '决明子', 'JMZ', 'juemingzi', '23', '甘、苦，微寒。归肝、大肠经。', '清肝明目，润肠通便。', null, '10~15g。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('519', '穞豆衣', 'LDY', 'ludouyi', '23', '甘，平。归肝经。', '养血平肝，滋阴清热。', null, '6~10g。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('520', '全蝎', 'QX', 'quanxie', '23', '辛，平。归肝经。', '息风止痉，解毒散结，通络止痛。', null, '2~5g。研末吞服，每次0.6~1g。外用适量。', '本品有毒，用量不可过大。血虚生风者慎用。', null, '1', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('521', '蜈蚣', 'WG', 'wugong', '23', '辛，温。归肝经。', '息风止痉，解毒散结，通络止痛。', null, '1~3g。研末吞服，每次0.6~1g。外用适量，研末或油浸涂敷患处。', '本品有毒，用量不可过大。孕妇忌用。', null, '1', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('522', '白僵蚕', 'BJC', 'baijiangcan', '23', '咸、辛，平。归肝、肺经。', '息风止痉，祛风止痛，解毒散结。', null, '3~10g；散结每服1~1.5g。散风热宜生用，一般多炒制用。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('523', '地龙', 'DL', 'dilong', '23', '咸，寒。归肝、脾、膀胱经。', '清热息风，平喘，通络，利尿。', null, '5~15g；鲜品10~20g。研粉吞服，每次1~2g。外用适量。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('524', '罗布麻', 'LBM', 'luobuma', '23', '淡、涩，微寒。归肝经。', '平肝，清热，降血压，利水。', null, '3~10g，水煎服或开水泡服。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('525', '麝香', 'SX', 'shexiang', '24', '辛，温。归心、脾经。', '开窍醒神，活血散结，止痛，催产。', null, '0.06~0.1g，入丸散，不宜入煎剂。外用适量。', '孕妇忌用。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('526', '冰片', 'BP', 'bingpian', '24', '辛、苦，微寒。归心、脾、肺经。', '开窍醒神，清热止痛。', null, '0.03~0.1g，入丸散，不宜入煎剂。外用适量。', '孕妇慎用。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('527', '苏合香', 'SHX', 'suhexiang', '24', '辛，温。归心、脾经。', '开窍辟秽，止痛。', null, '0.3~1g，宜入丸剂，不入煎剂。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('528', '石菖蒲', 'SCP', 'shichangpu', '24', '辛，温。归心、胃经。', '开窍宁神，化湿和胃。', null, '5~8g，鲜品加倍。外用适量。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('529', '人参', 'RS', 'renshen', '25', '甘、微苦，微温。归脾、肺经。', '大补元气，补脾益肺，生津止渴，安神增智。', null, '5~10g，宜文火另煎，将参汁兑入其他药汤内引服。研末吞服，每次1~2g，日服2~3次。如挽救虚脱，当用大量（15~30g）煎汁分数次灌服。', '实证、热证而正气不虚者忌服。反藜芦，畏五灵脂，恶皂荚，均忌同用。服人参不宜喝茶和吃萝卜，以免影响药力。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('530', '西洋参', 'XYS', 'xiyangshen', '25', '苦、微甘，寒。归心、肺、肾经。', '补气养阴，清火生津。', null, '3~6g，另煎和服。', '本品性寒，能伤阳助湿，故中阳衰微，胃有寒湿者忌用。忌铁器火炒，反藜芦。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('531', '党参', 'DS', 'dangshen', '25', '甘，平。归脾、肺经。', '补中益气，生津养血。', null, '10~30g。', '本品对虚寒证最为适宜，如若属热证，则不宜单独应用。反藜芦，也不宜同用。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('532', '太子参', 'TZC', 'taizican', '25', '甘、微苦，平。归脾、肺经。', '补气生津。', null, '10~30g。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('533', '黄芪', 'HQ', 'huangqi', '25', '甘，微温。归脾、肺经。', '补气升阳，益卫固表，托毒生肌，利水退肿。', null, '10~15g，大剂量可用30~60g。补气升阳宜炙用，其他方面多生用。', '本品补气升阳，易于助火，又能止汗，故凡表实邪盛、气滞湿阻、食积内停、阴虚阳亢、痈疽初起或溃后热毒尚盛等证，均不宜用。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('534', '白术', 'BZ', 'baizhu', '25', '苦、甘，温。归脾、胃经。', '补气健脾，燥湿利水，止汗安胎。', null, '5~15g。燥湿利水宜生用，补气健脾宜炒用，健脾止泻宜炒焦用。', '本品燥湿伤阴，故只适用于中焦有湿之症，如属阴虚内热或津液亏耗燥渴者，均不宜服。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('535', '山药', 'SY', 'shanyao', '25', '甘，平。归脾、肺、肾经。', '益气养阴，补脾肺肾。', null, '煎服10~30g，大量60~250g。研末吞服，每次6~10g。补阴宜生用，健脾止泻宜炒黄用。', '本品养阴能助湿，故湿盛中满或有积滞者忌服。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('536', '扁豆', 'BD', 'biandou', '25', '甘，微温。归脾、胃经。', '健脾化湿。', null, '10~20g。健脾止泻宜炒用，消暑宜生用。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('537', '甘草', 'GC', 'gancao', '25', '甘，平。归心、肺、脾、胃经', '补脾益气，润肺止咳，缓急止痛，缓和药性。', null, '2~10g。清火解毒宜生用，补中缓急宜炙用。', '本品味甘，能助湿壅气，令人中满，故湿盛而胸腹胀满及呕吐者忌服。反大戟、芫花、海藻。久服较大剂量的甘草，每易引起浮肿，使用当注意。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('538', '大枣', 'DZ', 'dazao', '25', '甘，温。归脾、胃经。', '补中益气，养血安神，缓和药性。', null, '3~12枚，或10~30g。为丸服当去皮核捣烂。', '本品助湿生热，令人中满，故湿盛脘腹胀满、食积、虫积，龋齿作痛，以及痰热咳嗽均忌服。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('539', '饴糖', 'YT', 'yitang', '25', '甘，温。归脾、胃、肺经。', '补脾益气，缓急止痛，润肺止咳。', null, '30~60g，入汤剂分二、三次融化服。也可熬膏或为丸服。', '本品助湿生热，令人中满，故湿热内郁、中满吐逆、痰热咳嗽、小儿疳积等证，均不宜服。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('540', '蜂蜜', 'FM', 'fengmi', '25', '甘，平。归脾、肺、大肠经。', '补中缓急，润肺止咳，滑肠通便。', null, '15~30g。冲服，或入丸剂、膏剂。外用适量敷患处。', '因能助湿，令人中满，且可滑肠，故有湿热痰滞、胸闷不宽及便溏或泄泻者忌服。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('541', '鹿茸', 'LR', 'lurong', '26', '甘、咸，温。归肝、肾经。', '补肾阳，益精血，强筋骨。', null, '1~3g，研细末，一日三次分服。或入丸散，随方配制。', '服用本品宜从小量开始，缓缓增加，不宜骤用大量，以免阳升风动，头晕目赤，或伤阴动血。凡阴虚阳亢、血分有热、胃火盛或肺有痰热以及外感热病者均忌服。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('542', '巴戟天', 'BJT', 'bajitian', '26', '辛、甘，微温。归肾经。', '补肾助阳，祛风除湿', null, '10~15g。', '本品补肾助阳，性质柔润，不若淫羊藿之燥散，但只适用于阳虚有寒湿之证，如阴虚火旺或有湿热者均不宜服。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('543', '肉苁蓉', 'RCR', 'roucongrong', '25', '甘、咸，温。归肾、大肠经。', '补肾助阳，润肠通便。', null, '10~20g。', '本品补阳不燥，药力和缓，入药少则不效，故用量宜大。因能助阳，滑肠，故阴虚火旺及大便泄泻者忌服。肠胃有实热之大便秘结者亦不宜用。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('544', '淫羊藿', 'YYH', 'yinyanghuo', '26', '辛、甘，温。归肝、肾经。', '补肾壮阳，祛风除湿。', null, '10~15g，水煎服；也可禁酒、熬膏或入丸散。', '阴虚火旺者不宜服。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('545', '葫芦巴', 'HLB', 'huluba', '26', '苦，温。归肝、肾经。', '温肾阳，逐寒湿。', null, '3~10g；煎服或入丸散。', '阴虚火旺或有湿热者忌服。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('546', '杜仲', 'DZ', 'duzhong', '26', '甘，温。归肝、肾经。', '补肝肾，强筋骨，安胎。', null, '10~15g。炒用疗效较生用为佳。', '为温补之品，阴虚火旺者慎用。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('547', '续断', 'XD', 'xuduan', '26', '苦、甘、辛，微温。归肝、肾经。', '补肝肾，行血脉，续筋骨。', null, '10~20g。崩漏下血宜炒用。外用适量研末敷。', '', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('548', '狗脊', 'GJ', 'gouji', '26', '苦、甘，温。归肝、肾经。', '补肝肾，强腰膝，祛风湿。', null, '10~15g。', '因有温补固摄作用，所以肾虚有热，小便不利或短涩黄赤、口苦舌干均忌服。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('549', '骨碎补', 'GSB', 'gusuibu', '26', '苦，温。归肝、肾经。', '补肾，活血，止血，续伤。', null, '内服10~20g，煎汤或入丸散。外用适量捣烂或晒干研末敷，也可浸酒擦患处。', '阴虚内热及无瘀血者不宜服。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('550', '补骨脂', 'BGZ', 'buguzhi', '26', '苦、辛，大温。归肾、脾经。', '补肾壮阳，固精缩尿，温脾止泻。', null, '5~10g。', '本品性质温燥，能伤阴助火，故阴虚火旺及大便秘结者忌服。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('551', '益智仁', 'YZR', 'yizhiren', '26', '辛，温。归脾、肾经。', '温脾开胃摄唾，暖肾固精缩尿。', null, '3~6g。', '本品燥热，能伤阴助火，故阴虚火旺或因热而患遗精、尿频、崩漏等证均忌服。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('552', '冬虫夏草', 'DCXC', 'dongchongxiacao', '26', '甘，温。归肾、肺经。', '益肾补肺，止血化痰。', null, '5~10g，煎汤服；或与鸡、鸭、猪肉等炖服；也可以入丸散。', '有表邪者不宜用。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('553', '蛤蚧', 'GJ', 'gejie', '26', '咸，平。归肺、肾经。', '补肺气，助肾阳，定喘嗽，益精血。', null, '3~7g，水煎服；研末服每次1~2g，一日三次；浸酒服用1~2对。', '风寒或实热喘咳均忌服。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('554', '胡桃肉', 'HTR', 'hutaorou', '26', '甘，温。归肾、肺、大肠经。', '补肾，温肺，润肠。', null, '10~30g。定喘止咳宜连皮用，润肠通便宜去皮用。', '阴虚火旺，痰热咳嗽及便溏者均不宜服。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('555', '紫河车', 'ZHC', 'ziheche', '26', '甘、咸，温。归肺、肝、肾经。', '补精，养血，益气。', null, '1.5~3g，研末装胶囊吞服，一日二、三次，重症用量加倍；也可入丸散。如用鲜胎盘，每次半个至一个，水煮服食。', '阴虚火旺者不宜单独应用。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('556', '菟丝子', 'TSZ', 'tusizi', '26', '辛、甘，平。归肝、肾经。', '补阳益阴，固精缩尿，明目止泻。', null, '10~15g。', '本品为平补之药，但仍偏补阳，故阴虚火旺，大便燥结、小便短赤者不宜服。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('557', '沙苑子', 'SYZ', 'shayuanzi', '26', '甘，温。归肝、肾经。', '补肾固精，养肝明目。', null, '10~20g。', '本品为温补固涩之品，阴虚火旺及小便不利者忌服。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('558', '锁阳', 'SY', 'suoyang', '26', '甘，温。归肝、肾、大肠经。', '补肾助阳，润肠通便。', null, '10~15g。', '阴虚阳旺、脾虚泄泻、实热便秘均忌服。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('559', '黄狗肾', 'HGS', 'huanggoushen', '26', '咸，温。归肾经。', '补肾壮阳。', null, '1.5~3g，入丸散。', '内热多火者忌服。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('560', '韭子', 'JZ', 'jiuzi', '26', '辛、甘，温。归肝、肾经。', '补肝肾，暖腰膝，壮阳，固精。', null, '5~10g，水煎或入丸散。', '阴虚火旺者忌服。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('561', '阳起石', 'YQS', 'yangqishi', '26', '咸，微温。归肾经。', '温肾壮阳。', null, '3~6g，入丸散服。', '阴虚火旺者忌用。不宜久服。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('562', '当归', 'DG', 'danggui', '27', '甘、辛，温。归肝、心、脾经。', '补血，活血，止痛，润肠。', null, '5~15g。补血用当归身，破血用当归尾，和血（即补血活血）用全当归酒制能加强活血的功效。', '湿盛中满、大便泄泻者忌服。', null, '0', '2', '斤', '1', '克', '500', null);
INSERT INTO `item_herbal_medicine` VALUES ('563', '熟地黄', 'SDH', 'shudihuang', '27', '甘，微温。归肝、肾经。', '养血滋阴，补精益髓。', null, '10~30g。宜与健脾胃药如陈皮、砂仁等同用。熟地炭用于止血。', '本品性质粘腻，较生地更甚，有碍消化，凡气滞痰多、脘腹胀痛、食少便溏者忌服。', null, '0', '2', '斤', '1', '克', '500', null);

-- ----------------------------
-- Table structure for `item_medical_supply`
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
  `pur_unit_name` varchar(10) DEFAULT NULL COMMENT '进货包装',
  `stock_unit` varchar(10) DEFAULT NULL COMMENT '零售单位',
  `stock_unit_name` varchar(10) DEFAULT NULL COMMENT '零售单位',
  `unit_convert` int(10) unsigned DEFAULT NULL COMMENT '单位换算',
  `stock_warn` decimal(16,6) unsigned DEFAULT NULL COMMENT '库存预警值，保留6位小数可以精确到微克',
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='医疗用品表';

-- ----------------------------
-- Records of item_medical_supply
-- ----------------------------

-- ----------------------------
-- Table structure for `item_meridian`
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
-- Table structure for `item_patent_medicine`
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
  `pur_unit_name` varchar(10) DEFAULT NULL COMMENT '进货包装',
  `stock_unit` varchar(10) DEFAULT NULL COMMENT '零售单位',
  `stock_unit_name` varchar(10) DEFAULT NULL COMMENT '零售单位',
  `unit_convert` int(10) unsigned DEFAULT NULL COMMENT '单位换算',
  `stock_warn` decimal(16,6) unsigned DEFAULT NULL COMMENT '库存预警值，保留6位小数可以精确到微克',
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='成药表';

-- ----------------------------
-- Records of item_patent_medicine
-- ----------------------------

-- ----------------------------
-- Table structure for `item_prescription`
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
-- Table structure for `item_skill`
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='采购单';

-- ----------------------------
-- Records of pur_order
-- ----------------------------
INSERT INTO `pur_order` VALUES ('25', '200523869', '2020-05-23', '1', '200.0000', null, '', '2020-05-23 15:48:55', '2020-05-23 15:48:55');
INSERT INTO `pur_order` VALUES ('26', '200523132', '2020-05-23', '1', '250.0000', null, '', '2020-05-23 15:50:54', '2020-05-23 15:50:54');
INSERT INTO `pur_order` VALUES ('27', '200523419', '2020-05-23', '1', '90.0000', null, '', '2020-05-23 17:27:39', '2020-05-23 17:27:39');

-- ----------------------------
-- Table structure for `pur_order_detail`
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
  `pur_unit_name` varchar(10) DEFAULT NULL COMMENT '进货包装',
  `unit_price` decimal(14,4) unsigned DEFAULT NULL COMMENT '进价',
  `total_price` decimal(14,4) unsigned DEFAULT NULL COMMENT '总价',
  PRIMARY KEY (`pur_order_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='采购单明细';

-- ----------------------------
-- Records of pur_order_detail
-- ----------------------------
INSERT INTO `pur_order_detail` VALUES ('33', '25', '210', '麻黄', 'HerbalMedicine', '', '', '', '10.0000', '斤', '20.0000', '200.0000');
INSERT INTO `pur_order_detail` VALUES ('34', '26', '211', '桂枝', 'HerbalMedicine', '', '', '', '10.0000', '斤', '25.0000', '250.0000');
INSERT INTO `pur_order_detail` VALUES ('35', '27', '212', '紫苏', 'HerbalMedicine', '', '', '', '5.0000', '斤', '10.0000', '50.0000');
INSERT INTO `pur_order_detail` VALUES ('36', '27', '213', '生姜', 'HerbalMedicine', '', '', '', '5.0000', '斤', '8.0000', '40.0000');

-- ----------------------------
-- Table structure for `pur_stock`
-- ----------------------------
DROP TABLE IF EXISTS `pur_stock`;
CREATE TABLE `pur_stock` (
  `pur_stock_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `pur_order_id` bigint(20) DEFAULT NULL COMMENT '采购单ID',
  `item_id` bigint(20) unsigned DEFAULT NULL COMMENT '品目ID',
  `item_name` varchar(50) DEFAULT NULL COMMENT '品目名称',
  `abbr_pinyin` varchar(50) DEFAULT NULL COMMENT '简拼',
  `full_pinyin` varchar(500) DEFAULT NULL COMMENT '全拼',
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='库存明细';

-- ----------------------------
-- Records of pur_stock
-- ----------------------------
INSERT INTO `pur_stock` VALUES ('20', '26', '211', '桂枝', 'GZ', 'guizhi', 'HerbalMedicine', '', '', '', '5000.0000', '克', '0.3000', '1', '2020-05-23 17:22:46', '2020-05-23 17:22:46');
INSERT INTO `pur_stock` VALUES ('21', '25', '210', '麻黄', 'MH', 'mahuang', 'HerbalMedicine', '', '', '', '5000.0000', '克', '0.3000', '1', '2020-05-23 17:25:03', '2020-05-23 17:25:03');
INSERT INTO `pur_stock` VALUES ('22', '27', '212', '紫苏', 'ZS', 'zisu', 'HerbalMedicine', '', '', '', '2500.0000', '克', '0.2000', '1', '2020-05-23 17:28:15', '2020-05-23 17:28:15');
INSERT INTO `pur_stock` VALUES ('23', '27', '213', '生姜', 'SJ', 'shengjiang', 'HerbalMedicine', '', '', '', '2500.0000', '克', '0.2000', '1', '2020-05-23 17:28:15', '2020-05-23 17:28:15');

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
-- Table structure for `rx_catalog`
-- ----------------------------
DROP TABLE IF EXISTS `rx_catalog`;
CREATE TABLE `rx_catalog` (
  `catalog_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '目录ID',
  `parent_catalog_id` int(10) unsigned DEFAULT NULL COMMENT '父目录ID',
  `catalog_type` tinyint(1) NOT NULL COMMENT '目录类型(1:目录;2:方剂)',
  `catalog_name` varchar(50) NOT NULL COMMENT '目录名称',
  `catalog_order` int(3) DEFAULT NULL COMMENT '目录顺序',
  PRIMARY KEY (`catalog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='方剂目录';

-- ----------------------------
-- Records of rx_catalog
-- ----------------------------
INSERT INTO `rx_catalog` VALUES ('33', null, '1', '补益剂', '0');
INSERT INTO `rx_catalog` VALUES ('34', '33', '1', '补血剂', '0');
INSERT INTO `rx_catalog` VALUES ('35', '34', '2', '当归补血汤', '0');

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
-- Table structure for `rx_detail`
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
-- View structure for `item_purchase`
-- ----------------------------
DROP VIEW IF EXISTS `item_purchase`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `item_purchase` AS select `item_herbal_medicine`.`item_id` AS `item_id`,`item_herbal_medicine`.`item_name` AS `item_name`,'HerbalMedicine' AS `item_type`,`item_herbal_medicine`.`abbr_pinyin` AS `abbr_pinyin`,`item_herbal_medicine`.`full_pinyin` AS `full_pinyin`,`item_herbal_medicine`.`pur_unit_name` AS `pur_unit_name`,`item_herbal_medicine`.`stock_unit_name` AS `stock_unit_name`,`item_herbal_medicine`.`unit_convert` AS `unit_convert`,`item_herbal_medicine`.`stock_warn` AS `stock_warn` from `item_herbal_medicine` union all select `item_medical_supply`.`item_id` AS `item_id`,`item_medical_supply`.`item_name` AS `item_name`,'MedicalSupply' AS `item_type`,`item_medical_supply`.`abbr_pinyin` AS `abbr_pinyin`,`item_medical_supply`.`full_pinyin` AS `full_pinyin`,`item_medical_supply`.`pur_unit_name` AS `pur_unit_name`,`item_medical_supply`.`stock_unit_name` AS `stock_unit_name`,`item_medical_supply`.`unit_convert` AS `unit_convert`,`item_medical_supply`.`stock_warn` AS `stock_warn` from `item_medical_supply` union all select `item_patent_medicine`.`item_id` AS `item_id`,`item_patent_medicine`.`item_name` AS `item_name`,'PatentMedicine' AS `item_type`,`item_patent_medicine`.`abbr_pinyin` AS `abbr_pinyin`,`item_patent_medicine`.`full_pinyin` AS `full_pinyin`,`item_patent_medicine`.`pur_unit_name` AS `pur_unit_name`,`item_patent_medicine`.`stock_unit_name` AS `stock_unit_name`,`item_patent_medicine`.`unit_convert` AS `unit_convert`,`item_patent_medicine`.`stock_warn` AS `stock_warn` from `item_patent_medicine` union all select `item_consumable`.`item_id` AS `item_id`,`item_consumable`.`item_name` AS `item_name`,'Consumable' AS `item_type`,`item_consumable`.`abbr_pinyin` AS `abbr_pinyin`,`item_consumable`.`full_pinyin` AS `full_pinyin`,`item_consumable`.`pur_unit_name` AS `pur_unit_name`,`item_consumable`.`pur_unit_name` AS `stock_unit_name`,1 AS `unit_convert`,100000 AS `stock_warn` from `item_consumable` ;
