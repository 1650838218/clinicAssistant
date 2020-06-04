/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 80017
Source Host           : localhost:3306
Source Database       : clinicassistant

Target Server Type    : MYSQL
Target Server Version : 80017
File Encoding         : 65001

Date: 2020-06-04 16:18:12
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
INSERT INTO `hibernate_sequence` VALUES ('434');

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
