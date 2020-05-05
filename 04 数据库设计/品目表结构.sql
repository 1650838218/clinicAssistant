DROP TABLE `item_all`;
CREATE TABLE `item_all` (
  `item_uid` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `item_id` bigint(20) NOT NULL COMMENT '品目ID',
  `item_name` varchar(50) NOT NULL COMMENT '品目名称',
  `item_type` varchar(10) NOT NULL COMMENT '品目分类（1：中草药；2：中成药；3：中药饮片；4：医疗耗材；5：其他耗材；字典键：CGPMFL）',
  PRIMARY KEY (`item_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='品目管理总表';

DROP TABLE `item_herbal_medicine`;
CREATE TABLE `item_herbal_medicine` (
  `item_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '品目ID',
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

DROP TABLE `item_patent_medicine`;
CREATE TABLE `item_patent_medicine` (
  `item_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '品目ID',
  `item_name` varchar(50) NOT NULL COMMENT '成药名称',
  `abbr_pinyin` varchar(50) DEFAULT NULL COMMENT '简拼',
  `full_pinyin` varchar(500) DEFAULT NULL COMMENT '全拼',
  `barcode` varchar(50) DEFAULT NULL COMMENT '条形码',
  `item_type` varchar(10) NOT NULL COMMENT '成药分类',
  `component` varchar(500) DEFAULT NULL COMMENT '组成',
  `function` varchar(100) DEFAULT NULL COMMENT '功用',
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

DROP TABLE `item_prescription`;
CREATE TABLE `item_prescription` (
  `item_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '品目ID',
  `item_name` varchar(50) NOT NULL COMMENT '方剂名称',
  `abbr_pinyin` varchar(50) DEFAULT NULL COMMENT '简拼',
  `full_pinyin` varchar(500) DEFAULT NULL COMMENT '全拼',
  `barcode` varchar(50) DEFAULT NULL COMMENT '条形码',
  `item_type` varchar(50) DEFAULT NULL COMMENT '方剂分类',
  `source` varchar(50) DEFAULT NULL COMMENT '方剂出处',
  `component` varchar(500) DEFAULT NULL COMMENT '组成',
  `usage_dosage` varchar(500) DEFAULT NULL COMMENT '用法用量',
  `function` varchar(100) DEFAULT NULL COMMENT '功用',
  `efficacy` varchar(500) DEFAULT NULL COMMENT '主治',
  `analysis` varchar(1000) DEFAULT NULL COMMENT '方解',
  `poem` varchar(100) DEFAULT NULL COMMENT '方歌',
  `taboo` varchar(500) DEFAULT NULL COMMENT '禁忌',
  `is_poison` tinyint(1) unsigned DEFAULT '0' COMMENT '是否有毒（1：是；0：否）',
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='方剂表';

DROP TABLE `item_meridian`;
CREATE TABLE `item_meridian` (
  `item_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '品目ID',
  `item_name` varchar(50) NOT NULL COMMENT '经络名称',
  `abbr_pinyin` varchar(50) DEFAULT NULL COMMENT '简拼',
  `full_pinyin` varchar(500) DEFAULT NULL COMMENT '全拼',
  `item_type` varchar(10) NOT NULL COMMENT '经络分类',
  `circulation_route` varchar(100) DEFAULT NULL COMMENT '循行部位',
  `function` varchar(500) DEFAULT NULL COMMENT '基本功能',
  `original_text` varchar(500) DEFAULT NULL COMMENT '原文（灵枢经脉）',
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='经络表';

DROP TABLE `item_acupoint`;
CREATE TABLE `item_acupoint` (
  `item_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '品目ID',
  `item_name` varchar(50) NOT NULL COMMENT '腧穴名称',
  `abbr_pinyin` varchar(50) DEFAULT NULL COMMENT '简拼',
  `full_pinyin` varchar(500) DEFAULT NULL COMMENT '全拼',
  `item_type` varchar(10) NOT NULL COMMENT '所属经络',
  `analysis` varchar(1000) DEFAULT NULL COMMENT '定位',
  `efficacy` varchar(500) DEFAULT NULL COMMENT '主治',
  `usage_dosage` varchar(500) DEFAULT NULL COMMENT '操作',
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='腧穴表';

DROP TABLE `item_medical_supply`;
CREATE TABLE `item_medical_supply` (
  `item_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '品目ID',
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

DROP TABLE `item_skill`;
CREATE TABLE `item_skill` (
  `item_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '品目ID',
  `item_name` varchar(50) NOT NULL COMMENT '项目名称',
  `abbr_pinyin` varchar(50) DEFAULT NULL COMMENT '简拼',
  `full_pinyin` varchar(500) DEFAULT NULL COMMENT '全拼',
  `unit_price` decimal(12,2) unsigned DEFAULT NULL COMMENT '单价',
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='医疗项目表';

DROP TABLE `item_consumable`;
CREATE TABLE `item_consumable` (
  `item_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '品目ID',
  `item_name` varchar(50) NOT NULL COMMENT '耗材名称',
  `abbr_pinyin` varchar(50) DEFAULT NULL COMMENT '简拼',
  `full_pinyin` varchar(500) DEFAULT NULL COMMENT '全拼',
  `specifications` varchar(100) DEFAULT NULL COMMENT '规格',
  `producer` varchar(100) DEFAULT NULL COMMENT '品牌厂家',
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='其他耗材表';