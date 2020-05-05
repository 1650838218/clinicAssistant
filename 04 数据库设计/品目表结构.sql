DROP TABLE `item_all`;
CREATE TABLE `item_all` (
  `item_uid` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '����ID',
  `item_id` bigint(20) NOT NULL COMMENT 'ƷĿID',
  `item_name` varchar(50) NOT NULL COMMENT 'ƷĿ����',
  `item_type` varchar(10) NOT NULL COMMENT 'ƷĿ���ࣨ1���в�ҩ��2���г�ҩ��3����ҩ��Ƭ��4��ҽ�ƺĲģ�5�������Ĳģ��ֵ����CGPMFL��',
  PRIMARY KEY (`item_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ƷĿ�����ܱ�';

DROP TABLE `item_herbal_medicine`;
CREATE TABLE `item_herbal_medicine` (
  `item_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ƷĿID',
  `item_name` varchar(50) NOT NULL COMMENT '��ҩ����',
  `abbr_pinyin` varchar(50) DEFAULT NULL COMMENT '��ƴ',
  `full_pinyin` varchar(500) DEFAULT NULL COMMENT 'ȫƴ',
  `item_type` varchar(50) DEFAULT NULL COMMENT '��ҩ����',
  `flavor_meridian_tropism` varchar(100) DEFAULT NULL COMMENT '��ζ�龭',
  `efficacy` varchar(50) DEFAULT NULL COMMENT '��Ч',
  `application` varchar(1000) DEFAULT NULL COMMENT 'Ӧ��',
  `usage_dosage` varchar(500) DEFAULT NULL COMMENT '�÷�����',
  `taboo` varchar(500) DEFAULT NULL COMMENT '����',
  `producer` varchar(100) DEFAULT NULL COMMENT '����',
  `is_poison` tinyint(1) unsigned DEFAULT '0' COMMENT '�Ƿ��ж���1���ǣ�0����',
  `pur_unit` varchar(10) DEFAULT NULL COMMENT '������װ',
  `stock_unit` varchar(10) DEFAULT NULL COMMENT '���۵�λ',
  `unit_convert` int(10) unsigned DEFAULT NULL COMMENT '��λ����',
  `stock_warn` decimal(16,6) unsigned DEFAULT NULL COMMENT '���Ԥ��ֵ������6λС�����Ծ�ȷ��΢��',
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��ҩ��';

DROP TABLE `item_patent_medicine`;
CREATE TABLE `item_patent_medicine` (
  `item_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ƷĿID',
  `item_name` varchar(50) NOT NULL COMMENT '��ҩ����',
  `abbr_pinyin` varchar(50) DEFAULT NULL COMMENT '��ƴ',
  `full_pinyin` varchar(500) DEFAULT NULL COMMENT 'ȫƴ',
  `barcode` varchar(50) DEFAULT NULL COMMENT '������',
  `item_type` varchar(10) NOT NULL COMMENT '��ҩ����',
  `component` varchar(500) DEFAULT NULL COMMENT '���',
  `function` varchar(100) DEFAULT NULL COMMENT '����',
  `efficacy` varchar(500) DEFAULT NULL COMMENT '����',
  `usage_dosage` varchar(500) DEFAULT NULL COMMENT '�÷�����',
  `specifications` varchar(100) DEFAULT NULL COMMENT '���',
  `taboo` varchar(500) DEFAULT NULL COMMENT '����',
  `producer` varchar(100) DEFAULT NULL COMMENT '����������',
  `is_poison` tinyint(1) unsigned DEFAULT '0' COMMENT '�Ƿ��ж���1���ǣ�0����',
  `pur_unit` varchar(10) DEFAULT NULL COMMENT '������װ',
  `stock_unit` varchar(10) DEFAULT NULL COMMENT '���۵�λ',
  `unit_convert` int(10) unsigned DEFAULT NULL COMMENT '��λ����',
  `stock_warn` decimal(16,6) unsigned DEFAULT NULL COMMENT '���Ԥ��ֵ������6λС�����Ծ�ȷ��΢��',
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��ҩ��';

DROP TABLE `item_prescription`;
CREATE TABLE `item_prescription` (
  `item_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ƷĿID',
  `item_name` varchar(50) NOT NULL COMMENT '��������',
  `abbr_pinyin` varchar(50) DEFAULT NULL COMMENT '��ƴ',
  `full_pinyin` varchar(500) DEFAULT NULL COMMENT 'ȫƴ',
  `barcode` varchar(50) DEFAULT NULL COMMENT '������',
  `item_type` varchar(50) DEFAULT NULL COMMENT '��������',
  `source` varchar(50) DEFAULT NULL COMMENT '��������',
  `component` varchar(500) DEFAULT NULL COMMENT '���',
  `usage_dosage` varchar(500) DEFAULT NULL COMMENT '�÷�����',
  `function` varchar(100) DEFAULT NULL COMMENT '����',
  `efficacy` varchar(500) DEFAULT NULL COMMENT '����',
  `analysis` varchar(1000) DEFAULT NULL COMMENT '����',
  `poem` varchar(100) DEFAULT NULL COMMENT '����',
  `taboo` varchar(500) DEFAULT NULL COMMENT '����',
  `is_poison` tinyint(1) unsigned DEFAULT '0' COMMENT '�Ƿ��ж���1���ǣ�0����',
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='������';

DROP TABLE `item_meridian`;
CREATE TABLE `item_meridian` (
  `item_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ƷĿID',
  `item_name` varchar(50) NOT NULL COMMENT '��������',
  `abbr_pinyin` varchar(50) DEFAULT NULL COMMENT '��ƴ',
  `full_pinyin` varchar(500) DEFAULT NULL COMMENT 'ȫƴ',
  `item_type` varchar(10) NOT NULL COMMENT '�������',
  `circulation_route` varchar(100) DEFAULT NULL COMMENT 'ѭ�в�λ',
  `function` varchar(500) DEFAULT NULL COMMENT '��������',
  `original_text` varchar(500) DEFAULT NULL COMMENT 'ԭ�ģ����ྭ����',
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�����';

DROP TABLE `item_acupoint`;
CREATE TABLE `item_acupoint` (
  `item_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ƷĿID',
  `item_name` varchar(50) NOT NULL COMMENT '��Ѩ����',
  `abbr_pinyin` varchar(50) DEFAULT NULL COMMENT '��ƴ',
  `full_pinyin` varchar(500) DEFAULT NULL COMMENT 'ȫƴ',
  `item_type` varchar(10) NOT NULL COMMENT '��������',
  `analysis` varchar(1000) DEFAULT NULL COMMENT '��λ',
  `efficacy` varchar(500) DEFAULT NULL COMMENT '����',
  `usage_dosage` varchar(500) DEFAULT NULL COMMENT '����',
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��Ѩ��';

DROP TABLE `item_medical_supply`;
CREATE TABLE `item_medical_supply` (
  `item_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ƷĿID',
  `item_name` varchar(50) NOT NULL COMMENT '��Ʒ����',
  `abbr_pinyin` varchar(50) DEFAULT NULL COMMENT '��ƴ',
  `full_pinyin` varchar(500) DEFAULT NULL COMMENT 'ȫƴ',
  `barcode` varchar(50) DEFAULT NULL COMMENT '������',
  `specifications` varchar(100) DEFAULT NULL COMMENT '���',
  `producer` varchar(100) DEFAULT NULL COMMENT 'Ʒ�Ƴ���',
  `pur_unit` varchar(10) DEFAULT NULL COMMENT '������װ',
  `stock_unit` varchar(10) DEFAULT NULL COMMENT '���۵�λ',
  `unit_convert` int(10) unsigned DEFAULT NULL COMMENT '��λ����',
  `stock_warn` decimal(16,6) unsigned DEFAULT NULL COMMENT '���Ԥ��ֵ������6λС�����Ծ�ȷ��΢��',
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ҽ����Ʒ��';

DROP TABLE `item_skill`;
CREATE TABLE `item_skill` (
  `item_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ƷĿID',
  `item_name` varchar(50) NOT NULL COMMENT '��Ŀ����',
  `abbr_pinyin` varchar(50) DEFAULT NULL COMMENT '��ƴ',
  `full_pinyin` varchar(500) DEFAULT NULL COMMENT 'ȫƴ',
  `unit_price` decimal(12,2) unsigned DEFAULT NULL COMMENT '����',
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ҽ����Ŀ��';

DROP TABLE `item_consumable`;
CREATE TABLE `item_consumable` (
  `item_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ƷĿID',
  `item_name` varchar(50) NOT NULL COMMENT '�Ĳ�����',
  `abbr_pinyin` varchar(50) DEFAULT NULL COMMENT '��ƴ',
  `full_pinyin` varchar(500) DEFAULT NULL COMMENT 'ȫƴ',
  `specifications` varchar(100) DEFAULT NULL COMMENT '���',
  `producer` varchar(100) DEFAULT NULL COMMENT 'Ʒ�Ƴ���',
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�����Ĳı�';