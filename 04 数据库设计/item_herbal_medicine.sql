/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 80017
Source Host           : localhost:3306
Source Database       : clinicassistant

Target Server Type    : MYSQL
Target Server Version : 80017
File Encoding         : 65001

Date: 2020-06-01 18:03:28
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
INSERT INTO `hibernate_sequence` VALUES ('295');

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
