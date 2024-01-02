/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : localhost:3306
 Source Schema         : eqcs

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 02/01/2024 19:58:00
*/
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for equipment_consumables
-- ----------------------------
DROP TABLE IF EXISTS `equipment_consumables`;
CREATE TABLE `equipment_consumables` (
  `consumable_id` bigint NOT NULL COMMENT '主键',
  `equipment_id` bigint NOT NULL COMMENT '设备id',
  `consumable_name` varchar(64) NOT NULL COMMENT '耗材名称',
  `consumable_no` varchar(128) DEFAULT '' COMMENT '耗材编号',
  `activation_time` datetime DEFAULT NULL COMMENT '开始使用时间',
  `validity` int DEFAULT NULL COMMENT '使用期效',
  `validity_uint` varchar(16) DEFAULT '' COMMENT '使用期效单位',
  `charge_user` bigint DEFAULT NULL COMMENT '负责人，到期后通知其更换',
  `status` varchar(16) DEFAULT '' COMMENT '状态 0正在使用，1已报废 2未使用过',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`consumable_id`),
  KEY `idx_equipment_consumables_eid` (`equipment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='设备耗材表';

-- ----------------------------
-- Records of equipment_consumables
-- ----------------------------
BEGIN;
INSERT INTO `equipment_consumables` (`consumable_id`, `equipment_id`, `consumable_name`, `consumable_no`, `activation_time`, `validity`, `validity_uint`, `charge_user`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1742136398638501889, 1741108854363615234, '耗材1', 'pethc001', '2024-01-02 18:50:26', 6, 'M', 1, 0, 'admin', '2024-01-02 18:50:59', 'admin', '2024-01-02 18:53:57', NULL);
COMMIT;

-- ----------------------------
-- Table structure for equipments
-- ----------------------------
DROP TABLE IF EXISTS `equipments`;
CREATE TABLE `equipments` (
  `equipment_id` bigint NOT NULL COMMENT '主键',
  `equipment_name` varchar(64) NOT NULL COMMENT '设备名称',
  `equipment_no` varchar(128) DEFAULT '' COMMENT '设备序列号',
  `equipment_supplier` varchar(64) DEFAULT '' COMMENT '设备供应商',
  `department` bigint DEFAULT NULL COMMENT '所属科室',
  `location` varchar(128) DEFAULT '' COMMENT '所在位置',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`equipment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='设备表';

-- ----------------------------
-- Records of equipments
-- ----------------------------
BEGIN;
INSERT INTO `equipments` (`equipment_id`, `equipment_name`, `equipment_no`, `equipment_supplier`, `department`, `location`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1741108854363615234, 'PET', '12412434324234', '西门子', 104, 'xxxx', 'admin', '2023-12-30 22:47:54', 'admin', '2024-01-01 19:44:32', NULL);
INSERT INTO `equipments` (`equipment_id`, `equipment_name`, `equipment_no`, `equipment_supplier`, `department`, `location`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1742151723719368705, '呼吸机', '24214214545', '迈瑞', 106, 'wqfafs', 'admin', '2024-01-02 19:51:53', 'admin', '2024-01-02 19:51:53', NULL);
COMMIT;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `table_id` bigint NOT NULL COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
BEGIN;
INSERT INTO `gen_table` (`table_id`, `table_name`, `table_comment`, `sub_table_name`, `sub_table_fk_name`, `class_name`, `tpl_category`, `package_name`, `module_name`, `business_name`, `function_name`, `function_author`, `gen_type`, `gen_path`, `options`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1741094791604686849, 'equipment_consumables', '设备耗材表', NULL, NULL, 'EquipmentConsumables', 'crud', 'com.eqc.system', 'system', 'consumables', '设备耗材', 'yunpeng.zhang', '0', '/', NULL, 'admin', '2023-12-30 21:44:43', 'admin', '2023-12-30 21:44:43', NULL);
INSERT INTO `gen_table` (`table_id`, `table_name`, `table_comment`, `sub_table_name`, `sub_table_fk_name`, `class_name`, `tpl_category`, `package_name`, `module_name`, `business_name`, `function_name`, `function_author`, `gen_type`, `gen_path`, `options`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1741094791780847618, 'equipments', '设备表', NULL, NULL, 'Equipments', 'crud', 'com.eqc.system', 'system', 'equipments', '设备', 'yunpeng.zhang', '0', '/', NULL, 'admin', '2023-12-30 21:44:43', 'admin', '2023-12-30 21:44:43', NULL);
COMMIT;

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `column_id` bigint NOT NULL COMMENT '编号',
  `table_id` bigint DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
BEGIN;
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (1741094791688572930, 1741094791604686849, 'consumable_id', '主键', 'bigint', 'Long', 'consumableId', '1', '0', '1', NULL, '1', '1', NULL, 'EQ', 'input', '', 1, 'admin', '2023-12-30 21:52:01', 'admin', '2023-12-30 21:52:01');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (1741094791696961538, 1741094791604686849, 'equipment_id', '设备id', 'bigint', 'Long', 'equipmentId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-12-30 21:52:01', 'admin', '2023-12-30 21:52:01');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (1741094791713738753, 1741094791604686849, 'consumable_name', '耗材名称', 'varchar(64)', 'String', 'consumableName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2023-12-30 21:52:01', 'admin', '2023-12-30 21:52:01');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (1741094791717933057, 1741094791604686849, 'consumable_no', '耗材编号', 'varchar(128)', 'String', 'consumableNo', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-12-30 21:52:01', 'admin', '2023-12-30 21:52:01');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (1741094791722127362, 1741094791604686849, 'activation_time', '开始使用时间', 'datetime', 'Date', 'activationTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2023-12-30 21:52:01', 'admin', '2023-12-30 21:52:01');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (1741094791722127363, 1741094791604686849, 'validity', '使用期效', 'int', 'Long', 'validity', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-12-30 21:52:01', 'admin', '2023-12-30 21:52:01');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (1741094791726321665, 1741094791604686849, 'validity_uint', '使用期效单位', 'varchar(16)', 'String', 'validityUint', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2023-12-30 21:52:01', 'admin', '2023-12-30 21:52:01');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (1741094791726321666, 1741094791604686849, 'charge_user', '负责人，到期后通知其更换', 'bigint', 'Long', 'chargeUser', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2023-12-30 21:52:01', 'admin', '2023-12-30 21:52:01');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (1741094791730515969, 1741094791604686849, 'status', '状态 0正在使用，1已报废 2未使用过', 'int', 'Long', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 9, 'admin', '2023-12-30 21:52:01', 'admin', '2023-12-30 21:52:01');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (1741094791734710274, 1741094791604686849, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2023-12-30 21:52:01', 'admin', '2023-12-30 21:52:01');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (1741094791738904577, 1741094791604686849, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2023-12-30 21:52:01', 'admin', '2023-12-30 21:52:01');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (1741094791738904578, 1741094791604686849, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2023-12-30 21:52:01', 'admin', '2023-12-30 21:52:01');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (1741094791743098881, 1741094791604686849, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 13, 'admin', '2023-12-30 21:52:01', 'admin', '2023-12-30 21:52:01');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (1741094791743098882, 1741094791604686849, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'textarea', '', 14, 'admin', '2023-12-30 21:52:01', 'admin', '2023-12-30 21:52:01');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (1741094791801819138, 1741094791780847618, 'equipment_id', '主键', 'bigint', 'Long', 'equipmentId', '1', '0', '1', NULL, '1', '1', NULL, 'EQ', 'input', '', 1, 'admin', '2023-12-30 21:52:01', 'admin', '2023-12-30 21:52:01');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (1741094791806013442, 1741094791780847618, 'equipment_name', '设备名称', 'varchar(64)', 'String', 'equipmentName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-12-30 21:52:01', 'admin', '2023-12-30 21:52:01');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (1741094791810207745, 1741094791780847618, 'equipment_no', '设备序列号', 'varchar(128)', 'String', 'equipmentNo', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-12-30 21:52:01', 'admin', '2023-12-30 21:52:01');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (1741094791810207746, 1741094791780847618, 'equipment_supplier', '设备供应商', 'varchar(64)', 'String', 'equipmentSupplier', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-12-30 21:52:01', 'admin', '2023-12-30 21:52:01');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (1741094791814402050, 1741094791780847618, 'department', '所属科室', 'varchar(64)', 'String', 'department', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-12-30 21:52:01', 'admin', '2023-12-30 21:52:01');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (1741094791814402051, 1741094791780847618, 'location', '所在位置', 'varchar(128)', 'String', 'location', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-12-30 21:52:01', 'admin', '2023-12-30 21:52:01');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (1741094791814402052, 1741094791780847618, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2023-12-30 21:52:01', 'admin', '2023-12-30 21:52:01');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (1741094791818596353, 1741094791780847618, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2023-12-30 21:52:01', 'admin', '2023-12-30 21:52:01');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (1741094791818596354, 1741094791780847618, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2023-12-30 21:52:01', 'admin', '2023-12-30 21:52:01');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (1741094791818596355, 1741094791780847618, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2023-12-30 21:52:01', 'admin', '2023-12-30 21:52:01');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (1741094791822790658, 1741094791780847618, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'textarea', '', 11, 'admin', '2023-12-30 21:52:01', 'admin', '2023-12-30 21:52:01');
COMMIT;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` bigint NOT NULL COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
BEGIN;
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2023-12-30 21:44:43', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2023-12-30 21:44:43', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2023-12-30 21:44:43', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'false', 'Y', 'admin', '2023-12-30 21:44:43', 'admin', '2023-12-30 22:11:11', '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2023-12-30 21:44:43', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (11, 'OSS预览列表资源开关', 'sys.oss.previewListResource', 'true', 'Y', 'admin', '2023-12-30 21:44:43', '', NULL, 'true:开启, false:关闭');
COMMIT;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL COMMENT '部门id',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(500) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (100, 0, '0', '浙江大学医学院附属第一医院', 0, 'yz', '15888888888', 'yz@163.com', '0', '0', 'admin', '2023-12-30 21:44:38', 'admin', '2023-12-30 22:33:58');
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (101, 100, '0,100', '之江院区', 1, 'yz', '15888888888', 'yz@qq.com', '0', '0', 'admin', '2023-12-30 21:44:38', 'admin', '2023-12-30 22:34:39');
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-12-30 21:44:38', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (103, 101, '0,100,101', '医工科', 1, 'yz', '15888888888', 'yz@qq.com', '0', '0', 'admin', '2023-12-30 21:44:38', 'admin', '2023-12-30 22:35:14');
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (104, 101, '0,100,101', '放射科', 2, 'yz', '15888888888', 'yz@qq.com', '0', '0', 'admin', '2023-12-30 21:44:38', 'admin', '2023-12-30 22:35:42');
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (105, 101, '0,100,101', '心血管内科', 3, 'yz', '15888888888', 'yz@qq.com', '0', '0', 'admin', '2023-12-30 21:44:38', 'admin', '2023-12-30 22:36:29');
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (106, 101, '0,100,101', '急诊', 4, 'yz', '15888888888', 'yz@qq.com', '0', '0', 'admin', '2023-12-30 21:44:38', 'admin', '2023-12-30 22:37:26');
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-12-30 21:44:38', 'admin', '2023-12-30 22:34:39');
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-12-30 21:44:38', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-12-30 21:44:38', '', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2023-12-30 21:44:42', '', NULL, '性别男');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-12-30 21:44:43', '', NULL, '性别女');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-12-30 21:44:43', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2023-12-30 21:44:43', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2023-12-30 21:44:43', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2023-12-30 21:44:43', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2023-12-30 21:44:43', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2023-12-30 21:44:43', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2023-12-30 21:44:43', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2023-12-30 21:44:43', '', NULL, '通知');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2023-12-30 21:44:43', '', NULL, '公告');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2023-12-30 21:44:43', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2023-12-30 21:44:43', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-12-30 21:44:43', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-12-30 21:44:43', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-12-30 21:44:43', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2023-12-30 21:44:43', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-12-30 21:44:43', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-12-30 21:44:43', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-12-30 21:44:43', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-12-30 21:44:43', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-12-30 21:44:43', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2023-12-30 21:44:43', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2023-12-30 21:44:43', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (29, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-12-30 21:44:43', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1741789663001145346, 1, '年', 'Y', 'sys_time_unit', NULL, 'default', 'N', '0', 'admin', '2024-01-01 19:53:11', 'admin', '2024-01-01 19:53:11', NULL);
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1741789752700530689, 2, '月', 'M', 'sys_time_unit', NULL, 'default', 'N', '0', 'admin', '2024-01-01 19:53:33', 'admin', '2024-01-01 19:53:33', NULL);
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1741789824972582913, 3, '天', 'D', 'sys_time_unit', NULL, 'default', 'N', '0', 'admin', '2024-01-01 19:53:50', 'admin', '2024-01-01 19:53:50', NULL);
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1742135349911506945, 1, '使用中', '0', 'consumable_status', NULL, 'success', 'N', '0', 'admin', '2024-01-02 18:46:49', 'admin', '2024-01-02 18:46:49', NULL);
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1742135466794176514, 2, '已报废', '1', 'consumable_status', NULL, 'danger', 'N', '0', 'admin', '2024-01-02 18:47:17', 'admin', '2024-01-02 18:47:17', NULL);
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1742135570330570753, 3, '未使用', '2', 'consumable_status', NULL, 'primary', 'N', '0', 'admin', '2024-01-02 18:47:42', 'admin', '2024-01-02 18:47:42', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2023-12-30 21:44:42', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2023-12-30 21:44:42', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2023-12-30 21:44:42', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2023-12-30 21:44:42', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2023-12-30 21:44:42', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2023-12-30 21:44:42', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2023-12-30 21:44:42', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2023-12-30 21:44:42', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1741789532021420034, '时间单位', 'sys_time_unit', '0', 'admin', '2024-01-01 19:52:40', 'admin', '2024-01-01 19:52:40', 'Y年 M月 D天');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1741791405407301634, '设备耗材状态', 'consumable_status', '0', 'admin', '2024-01-01 20:00:07', 'admin', '2024-01-01 20:00:07', '0正在使用，1已报废 2未使用过');
COMMIT;

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint NOT NULL COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`),
  KEY `idx_sys_logininfor_s` (`status`),
  KEY `idx_sys_logininfor_lt` (`login_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
BEGIN;
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1741093257789657089, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'OSX', '0', '登录成功', '2023-12-30 21:45:55');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1741097705408647170, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'OSX', '0', '退出成功', '2023-12-30 22:03:36');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1741097750249951234, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'OSX', '0', '登录成功', '2023-12-30 22:03:46');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1741099657131544578, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'OSX', '0', '退出成功', '2023-12-30 22:11:21');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1741099666375790593, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'OSX', '1', '密码输入错误1次', '2023-12-30 22:11:23');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1741099696071462914, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'OSX', '0', '登录成功', '2023-12-30 22:11:30');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1741101930406510594, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'OSX', '0', '退出成功', '2023-12-30 22:20:23');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1741101937192894465, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'OSX', '1', '密码输入错误1次', '2023-12-30 22:20:25');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1741101959426899970, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'OSX', '0', '登录成功', '2023-12-30 22:20:30');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1741103672103890945, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'OSX', '0', '退出成功', '2023-12-30 22:27:18');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1741103699215872001, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'OSX', '0', '登录成功', '2023-12-30 22:27:25');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1741104386964291586, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'OSX', '0', '退出成功', '2023-12-30 22:30:09');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1741104413661036545, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'OSX', '0', '登录成功', '2023-12-30 22:30:15');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1741108087137300482, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'OSX', '0', '退出成功', '2023-12-30 22:44:51');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1741108120859504641, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'OSX', '0', '登录成功', '2023-12-30 22:44:59');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1741743616925200386, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'OSX', '1', '密码输入错误1次', '2024-01-01 16:50:13');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1741743641180860418, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'OSX', '0', '登录成功', '2024-01-01 16:50:19');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1741780082820739073, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'OSX', '1', '密码输入错误1次', '2024-01-01 19:15:07');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1741780106199789570, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'OSX', '0', '登录成功', '2024-01-01 19:15:13');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1741837199959150594, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'OSX', '0', '登录成功', '2024-01-01 23:02:05');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1742133645111480322, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'OSX', '1', '密码输入错误1次', '2024-01-02 18:40:03');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (1742133667945271297, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'OSX', '0', '登录成功', '2024-01-02 18:40:08');
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query_param` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '显示状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2023-12-30 21:44:39', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2023-12-30 21:44:39', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2023-12-30 21:44:39', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2023-12-30 21:44:39', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2023-12-30 21:44:39', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2023-12-30 21:44:39', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2023-12-30 21:44:39', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2023-12-30 21:44:39', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2023-12-30 21:44:39', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2023-12-30 21:44:39', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2023-12-30 21:44:39', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2023-12-30 21:44:39', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2023-12-30 21:44:39', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (112, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2023-12-30 21:44:39', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2023-12-30 21:44:39', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (114, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2023-12-30 21:44:39', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2023-12-30 21:44:39', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (117, 'Admin监控', 2, 5, 'Admin', 'monitor/admin/index', '', 1, 0, 'C', '1', '0', 'monitor:admin:list', 'dashboard', 'admin', '2023-12-30 21:44:39', 'admin', '2024-01-01 19:57:45', 'Admin监控菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (118, '文件管理', 1, 10, 'oss', 'system/oss/index', '', 1, 0, 'C', '0', '0', 'system:oss:list', 'upload', 'admin', '2023-12-30 21:44:39', '', NULL, '文件管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (120, '任务调度中心', 2, 5, 'XxlJob', 'monitor/xxljob/index', '', 1, 0, 'C', '1', '0', 'monitor:xxljob:list', 'job', 'admin', '2023-12-30 21:44:39', 'admin', '2024-01-01 19:58:01', 'Xxl-Job控制台菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2023-12-30 21:44:39', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2023-12-30 21:44:39', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1001, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2023-12-30 21:44:39', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1002, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2023-12-30 21:44:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1003, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2023-12-30 21:44:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1004, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2023-12-30 21:44:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1005, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2023-12-30 21:44:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1006, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2023-12-30 21:44:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1007, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2023-12-30 21:44:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1008, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2023-12-30 21:44:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1009, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2023-12-30 21:44:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1010, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2023-12-30 21:44:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1011, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2023-12-30 21:44:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1012, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2023-12-30 21:44:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1013, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2023-12-30 21:44:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1014, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2023-12-30 21:44:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1015, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2023-12-30 21:44:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1016, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2023-12-30 21:44:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1017, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2023-12-30 21:44:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1018, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2023-12-30 21:44:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1019, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2023-12-30 21:44:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1020, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2023-12-30 21:44:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1021, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2023-12-30 21:44:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1022, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2023-12-30 21:44:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1023, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2023-12-30 21:44:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1024, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2023-12-30 21:44:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1025, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2023-12-30 21:44:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1026, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2023-12-30 21:44:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1027, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2023-12-30 21:44:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1028, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2023-12-30 21:44:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1029, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2023-12-30 21:44:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1030, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2023-12-30 21:44:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1031, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2023-12-30 21:44:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1032, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2023-12-30 21:44:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1033, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2023-12-30 21:44:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1034, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2023-12-30 21:44:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1035, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2023-12-30 21:44:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1036, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2023-12-30 21:44:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1037, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2023-12-30 21:44:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1038, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2023-12-30 21:44:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1039, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2023-12-30 21:44:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1040, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2023-12-30 21:44:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1041, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2023-12-30 21:44:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1042, '日志导出', 500, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2023-12-30 21:44:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1043, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2023-12-30 21:44:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1044, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2023-12-30 21:44:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1045, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2023-12-30 21:44:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2023-12-30 21:44:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2023-12-30 21:44:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2023-12-30 21:44:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1050, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2023-12-30 21:44:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1055, '生成查询', 115, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2023-12-30 21:44:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1056, '生成修改', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2023-12-30 21:44:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1057, '生成删除', 115, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2023-12-30 21:44:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1058, '导入代码', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2023-12-30 21:44:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1059, '预览代码', 115, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2023-12-30 21:44:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1060, '生成代码', 115, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2023-12-30 21:44:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1600, '文件查询', 118, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:query', '#', 'admin', '2023-12-30 21:44:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1601, '文件上传', 118, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:upload', '#', 'admin', '2023-12-30 21:44:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1602, '文件下载', 118, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:download', '#', 'admin', '2023-12-30 21:44:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1603, '文件删除', 118, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:remove', '#', 'admin', '2023-12-30 21:44:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1604, '配置添加', 118, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:add', '#', 'admin', '2023-12-30 21:44:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1605, '配置编辑', 118, 6, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:edit', '#', 'admin', '2023-12-30 21:44:40', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1741093982624108545, '设备管理', 0, 0, 'equipments', 'equipments/index', NULL, 1, 0, 'C', '0', '0', 'equipments:list', 'example', 'admin', '2023-12-30 21:48:48', 'admin', '2023-12-30 22:15:40', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1741094806775484418, '设备查询', 1741093982624108545, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'equipments:query', '#', 'admin', '2023-12-30 21:56:48', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1741094806775484419, '设备新增', 1741093982624108545, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'equipments:add', '#', 'admin', '2023-12-30 21:56:48', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1741094806775484420, '设备修改', 1741093982624108545, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'equipments:edit', '#', 'admin', '2023-12-30 21:56:48', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1741094806775484421, '设备删除', 1741093982624108545, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'equipments:remove', '#', 'admin', '2023-12-30 21:56:48', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query_param`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1741094806775484422, '设备导出', 1741093982624108545, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'equipments:export', '#', 'admin', '2023-12-30 21:56:48', '', NULL, '');
COMMIT;

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` bigint NOT NULL COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
BEGIN;
INSERT INTO `sys_notice` (`notice_id`, `notice_title`, `notice_type`, `notice_content`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '温馨提醒：2018-07-01 新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2023-12-30 21:44:43', '', NULL, '管理员');
INSERT INTO `sys_notice` (`notice_id`, `notice_title`, `notice_type`, `notice_content`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '维护通知：2018-07-01 系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2023-12-30 21:44:43', '', NULL, '管理员');
COMMIT;

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`),
  KEY `idx_sys_oper_log_bt` (`business_type`),
  KEY `idx_sys_oper_log_s` (`status`),
  KEY `idx_sys_oper_log_ot` (`oper_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
BEGIN;
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES (1741093982728966146, '菜单管理', 1, 'com.eqc.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-12-30 21:48:48\",\"updateBy\":\"admin\",\"updateTime\":\"2023-12-30 21:48:48\",\"parentName\":null,\"parentId\":0,\"children\":[],\"menuId\":\"1741093982624108545\",\"menuName\":\"社保管理\",\"orderNum\":0,\"path\":\"/equipments\",\"component\":\"/equipments/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"equipments:*\",\"icon\":\"example\",\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-12-30 21:48:48');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES (1741094084407283714, '菜单管理', 2, 'com.eqc.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-12-30 21:48:48\",\"updateBy\":\"admin\",\"updateTime\":\"2023-12-30 21:49:12\",\"parentName\":null,\"parentId\":0,\"children\":[],\"menuId\":\"1741093982624108545\",\"menuName\":\"社保管理\",\"orderNum\":0,\"path\":\"equipments\",\"component\":\"equipments/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"equipments:*\",\"icon\":\"example\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-12-30 21:49:12');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES (1741094102635728897, '菜单管理', 2, 'com.eqc.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-12-30 21:48:48\",\"updateBy\":\"admin\",\"updateTime\":\"2023-12-30 21:49:16\",\"parentName\":null,\"parentId\":0,\"children\":[],\"menuId\":\"1741093982624108545\",\"menuName\":\"社保管理\",\"orderNum\":0,\"path\":\"equipments\",\"component\":\"equipments/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"equipments:*\",\"icon\":\"example\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-12-30 21:49:17');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES (1741094158390611969, '菜单管理', 2, 'com.eqc.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-12-30 21:48:48\",\"updateBy\":\"admin\",\"updateTime\":\"2023-12-30 21:49:29\",\"parentName\":null,\"parentId\":0,\"children\":[],\"menuId\":\"1741093982624108545\",\"menuName\":\"设备管理\",\"orderNum\":0,\"path\":\"equipments\",\"component\":\"equipments/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"equipments:*\",\"icon\":\"example\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-12-30 21:49:30');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES (1741094302003580930, '菜单管理', 2, 'com.eqc.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-12-30 21:48:48\",\"updateBy\":\"admin\",\"updateTime\":\"2023-12-30 21:50:04\",\"parentName\":null,\"parentId\":0,\"children\":[],\"menuId\":\"1741093982624108545\",\"menuName\":\"设备管理\",\"orderNum\":0,\"path\":\"equipments\",\"component\":\"equipments/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"example\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-12-30 21:50:04');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES (1741094791864733697, '代码生成', 6, 'com.eqc.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '', '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"equipment_consumables,equipments\"', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-12-30 21:52:01');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES (1741096220008468482, '角色管理', 2, 'com.eqc.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '', '/system/role', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-12-30 21:44:39\",\"updateBy\":\"admin\",\"updateTime\":\"2023-12-30 21:57:41\",\"roleId\":2,\"roleName\":\"普通角色\",\"roleKey\":\"common\",\"roleSort\":2,\"dataScope\":\"2\",\"menuCheckStrictly\":true,\"deptCheckStrictly\":true,\"status\":\"0\",\"delFlag\":\"0\",\"remark\":\"普通角色\",\"flag\":false,\"menuIds\":[1,2,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045,1050,109,1046,1047,1048,113,112,3,114,115,1055,1056,1058,1057,1059,1060],\"deptIds\":null,\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-12-30 21:57:42');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES (1741096384366465025, '角色管理', 2, 'com.eqc.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '', '/system/role', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-12-30 21:44:39\",\"updateBy\":\"admin\",\"updateTime\":\"2023-12-30 21:58:20\",\"roleId\":2,\"roleName\":\"普通角色\",\"roleKey\":\"common\",\"roleSort\":2,\"dataScope\":\"2\",\"menuCheckStrictly\":true,\"deptCheckStrictly\":true,\"status\":\"0\",\"delFlag\":\"0\",\"remark\":\"普通角色\",\"flag\":false,\"menuIds\":[1,2,\"1741093982624108545\",\"1741094806775484418\",\"1741094806775484419\",\"1741094806775484420\",\"1741094806775484421\",\"1741094806775484422\",100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045,1050,109,1046,1047,1048,113,112,3,114,115,1055,1056,1058,1057,1059,1060],\"deptIds\":null,\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-12-30 21:58:21');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES (1741096521633452034, '菜单管理', 3, 'com.eqc.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '', '/system/menu/4', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-12-30 21:58:53');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES (1741097474554155009, '菜单管理', 2, 'com.eqc.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-12-30 21:48:48\",\"updateBy\":\"admin\",\"updateTime\":\"2023-12-30 22:02:40\",\"parentName\":null,\"parentId\":0,\"children\":[],\"menuId\":\"1741093982624108545\",\"menuName\":\"设备管理\",\"orderNum\":0,\"path\":\"equipments\",\"component\":\"equipments/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"equipments:list\",\"icon\":\"example\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-12-30 22:02:41');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES (1741098245026828289, '角色管理', 2, 'com.eqc.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '', '/system/role', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-12-30 21:44:39\",\"updateBy\":\"admin\",\"updateTime\":\"2023-12-30 22:05:44\",\"roleId\":2,\"roleName\":\"普通角色\",\"roleKey\":\"common\",\"roleSort\":2,\"dataScope\":\"2\",\"menuCheckStrictly\":true,\"deptCheckStrictly\":true,\"status\":\"0\",\"delFlag\":\"0\",\"remark\":\"普通角色\",\"flag\":false,\"menuIds\":[1,2,\"1741093982624108545\",\"1741094806775484418\",\"1741094806775484419\",\"1741094806775484420\",\"1741094806775484421\",\"1741094806775484422\",100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045,1050,109,1046,1047,1048,113,112,3,114,115,1055,1056,1058,1057,1059,1060],\"deptIds\":null,\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-12-30 22:05:44');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES (1741099616392269826, '参数管理', 2, 'com.eqc.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '', '/system/config', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-12-30 21:44:43\",\"updateBy\":\"admin\",\"updateTime\":\"2023-12-30 22:11:11\",\"configId\":4,\"configName\":\"账号自助-验证码开关\",\"configKey\":\"sys.account.captchaEnabled\",\"configValue\":\"false\",\"configType\":\"Y\",\"remark\":\"是否开启验证码功能（true开启，false关闭）\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-12-30 22:11:11');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES (1741100744706101249, '菜单管理', 2, 'com.eqc.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-12-30 21:48:48\",\"updateBy\":\"admin\",\"updateTime\":\"2023-12-30 22:15:40\",\"parentName\":null,\"parentId\":0,\"children\":[],\"menuId\":\"1741093982624108545\",\"menuName\":\"设备管理\",\"orderNum\":0,\"path\":\"equipments\",\"component\":\"equipments/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"equipments:list\",\"icon\":\"example\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-12-30 22:15:40');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES (1741105347485073409, '部门管理', 2, 'com.eqc.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '', '/system/dept', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-12-30 21:44:38\",\"updateBy\":\"admin\",\"updateTime\":\"2023-12-30 22:33:57\",\"parentName\":null,\"parentId\":0,\"children\":[],\"deptId\":100,\"deptName\":\"浙江大学医学院附属第一医院\",\"orderNum\":0,\"leader\":\"yz\",\"phone\":\"15888888888\",\"email\":\"yz@163.com\",\"status\":\"0\",\"delFlag\":\"0\",\"ancestors\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-12-30 22:33:58');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES (1741105522307858433, '部门管理', 2, 'com.eqc.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '', '/system/dept', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-12-30 21:44:38\",\"updateBy\":\"admin\",\"updateTime\":\"2023-12-30 22:34:39\",\"parentName\":\"浙江大学医学院附属第一医院\",\"parentId\":100,\"children\":[],\"deptId\":101,\"deptName\":\"之江院区\",\"orderNum\":1,\"leader\":\"yz\",\"phone\":\"15888888888\",\"email\":\"yz@qq.com\",\"status\":\"0\",\"delFlag\":\"0\",\"ancestors\":\"0,100\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-12-30 22:34:39');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES (1741105669217550338, '部门管理', 2, 'com.eqc.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '', '/system/dept', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-12-30 21:44:38\",\"updateBy\":\"admin\",\"updateTime\":\"2023-12-30 22:35:14\",\"parentName\":\"之江院区\",\"parentId\":101,\"children\":[],\"deptId\":103,\"deptName\":\"医工科\",\"orderNum\":1,\"leader\":\"yz\",\"phone\":\"15888888888\",\"email\":\"yz@qq.com\",\"status\":\"0\",\"delFlag\":\"0\",\"ancestors\":\"0,100,101\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-12-30 22:35:14');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES (1741105786058276865, '部门管理', 2, 'com.eqc.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '', '/system/dept', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-12-30 21:44:38\",\"updateBy\":\"admin\",\"updateTime\":\"2023-12-30 22:35:42\",\"parentName\":\"之江院区\",\"parentId\":101,\"children\":[],\"deptId\":104,\"deptName\":\"放射科\",\"orderNum\":2,\"leader\":\"yz\",\"phone\":\"15888888888\",\"email\":\"yz@qq.com\",\"status\":\"0\",\"delFlag\":\"0\",\"ancestors\":\"0,100,101\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-12-30 22:35:42');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES (1741105981651255297, '部门管理', 2, 'com.eqc.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '', '/system/dept', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-12-30 21:44:38\",\"updateBy\":\"admin\",\"updateTime\":\"2023-12-30 22:36:28\",\"parentName\":\"之江院区\",\"parentId\":101,\"children\":[],\"deptId\":105,\"deptName\":\"心血管内科\",\"orderNum\":3,\"leader\":\"yz\",\"phone\":\"15888888888\",\"email\":\"yz@qq.com\",\"status\":\"0\",\"delFlag\":\"0\",\"ancestors\":\"0,100,101\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-12-30 22:36:29');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES (1741106219808030722, '部门管理', 2, 'com.eqc.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '', '/system/dept', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-12-30 21:44:38\",\"updateBy\":\"admin\",\"updateTime\":\"2023-12-30 22:37:25\",\"parentName\":\"之江院区\",\"parentId\":101,\"children\":[],\"deptId\":106,\"deptName\":\"急诊\",\"orderNum\":4,\"leader\":\"yz\",\"phone\":\"15888888888\",\"email\":\"yz@qq.com\",\"status\":\"0\",\"delFlag\":\"0\",\"ancestors\":\"0,100,101\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-12-30 22:37:26');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES (1741106236786573313, '部门管理', 3, 'com.eqc.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '', '/system/dept/107', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-12-30 22:37:30');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES (1741106246798376962, '部门管理', 3, 'com.eqc.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '', '/system/dept/102', '127.0.0.1', '内网IP', '{}', '{\"code\":601,\"msg\":\"存在下级部门,不允许删除\",\"data\":null}', 0, '', '2023-12-30 22:37:32');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES (1741106257149919234, '部门管理', 3, 'com.eqc.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '', '/system/dept/102', '127.0.0.1', '内网IP', '{}', '{\"code\":601,\"msg\":\"存在下级部门,不允许删除\",\"data\":null}', 0, '', '2023-12-30 22:37:35');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES (1741106280721907713, '部门管理', 3, 'com.eqc.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '', '/system/dept/102', '127.0.0.1', '内网IP', '{}', '{\"code\":601,\"msg\":\"存在下级部门,不允许删除\",\"data\":null}', 0, '', '2023-12-30 22:37:40');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES (1741106306999222274, '部门管理', 3, 'com.eqc.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '', '/system/dept/108', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-12-30 22:37:46');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES (1741106318206402561, '部门管理', 3, 'com.eqc.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '', '/system/dept/109', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-12-30 22:37:49');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES (1741106332848717826, '部门管理', 3, 'com.eqc.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '', '/system/dept/102', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-12-30 22:37:53');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES (1741106520992612354, '岗位管理', 3, 'com.eqc.web.controller.system.SysPostController.remove()', 'DELETE', 1, 'admin', '', '/system/post/1', '127.0.0.1', '内网IP', '{}', '', 1, '董事长已分配，不能删除!', '2023-12-30 22:38:37');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES (1741106708582858753, '用户管理', 2, 'com.eqc.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-12-30 21:44:38\",\"updateBy\":\"admin\",\"updateTime\":\"2023-12-30 22:39:22\",\"userId\":2,\"deptId\":105,\"userName\":\"lionli\",\"nickName\":\"疯狂的狮子Li\",\"userType\":\"sys_user\",\"email\":\"crazyLionLi@qq.com\",\"phonenumber\":\"15666666666\",\"sex\":\"1\",\"avatar\":\"\",\"status\":\"0\",\"delFlag\":\"0\",\"loginIp\":\"127.0.0.1\",\"loginDate\":\"2023-12-30 21:44:38\",\"remark\":\"测试员\",\"dept\":{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"parentName\":null,\"parentId\":101,\"children\":[],\"deptId\":105,\"deptName\":\"心血管内科\",\"orderNum\":3,\"leader\":\"yz\",\"phone\":null,\"email\":null,\"status\":\"0\",\"delFlag\":null,\"ancestors\":\"0,100,101\"},\"roles\":[{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"roleId\":2,\"roleName\":\"普通角色\",\"roleKey\":\"common\",\"roleSort\":2,\"dataScope\":\"2\",\"menuCheckStrictly\":null,\"deptCheckStrictly\":null,\"status\":\"0\",\"delFlag\":null,\"remark\":null,\"flag\":false,\"menuIds\":null,\"deptIds\":null,\"admin\":false}],\"roleIds\":[2],\"postIds\":[],\"roleId\":null,\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-12-30 22:39:22');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES (1741106808491180034, '岗位管理', 3, 'com.eqc.web.controller.system.SysPostController.remove()', 'DELETE', 1, 'admin', '', '/system/post/1', '127.0.0.1', '内网IP', '{}', '', 1, '董事长已分配，不能删除!', '2023-12-30 22:39:46');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES (1741107053287538690, '个人信息', 2, 'com.eqc.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', '', '/system/user/profile', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-12-30 21:44:38\",\"updateBy\":\"admin\",\"updateTime\":\"2023-12-30 22:40:44\",\"userId\":1,\"deptId\":null,\"userName\":null,\"nickName\":\"yezzy\",\"userType\":\"sys_user\",\"email\":\"yezzy@163.com\",\"phonenumber\":\"15888888888\",\"sex\":\"0\",\"avatar\":null,\"status\":\"0\",\"delFlag\":\"0\",\"loginIp\":\"127.0.0.1\",\"loginDate\":\"2023-12-30 22:30:15\",\"remark\":\"管理员\",\"dept\":{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"parentName\":null,\"parentId\":101,\"children\":[],\"deptId\":103,\"deptName\":\"医工科\",\"orderNum\":1,\"leader\":\"yz\",\"phone\":null,\"email\":null,\"status\":\"0\",\"delFlag\":null,\"ancestors\":\"0,100,101\"},\"roles\":[{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"roleId\":1,\"roleName\":\"超级管理员\",\"roleKey\":\"admin\",\"roleSort\":1,\"dataScope\":\"1\",\"menuCheckStrictly\":null,\"deptCheckStrictly\":null,\"status\":\"0\",\"delFlag\":null,\"remark\":null,\"flag\":false,\"menuIds\":null,\"deptIds\":null,\"admin\":true}],\"roleIds\":null,\"postIds\":null,\"roleId\":null,\"admin\":true}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-12-30 22:40:44');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES (1741107158816227329, '岗位管理', 3, 'com.eqc.web.controller.system.SysPostController.remove()', 'DELETE', 1, 'admin', '', '/system/post/2', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-12-30 22:41:10');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES (1741107285794586625, '岗位管理', 2, 'com.eqc.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', '', '/system/post', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-12-30 21:44:39\",\"updateBy\":\"admin\",\"updateTime\":\"2023-12-30 22:41:39\",\"postId\":3,\"postCode\":\"doctor\",\"postName\":\"医生\",\"postSort\":2,\"status\":\"0\",\"remark\":\"\",\"flag\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-12-30 22:41:40');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES (1741107567362408449, '岗位管理', 2, 'com.eqc.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', '', '/system/post', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-12-30 21:44:38\",\"updateBy\":\"admin\",\"updateTime\":\"2023-12-30 22:42:46\",\"postId\":1,\"postCode\":\"medical-device-engineer\",\"postName\":\"工程师\",\"postSort\":1,\"status\":\"0\",\"remark\":\"\",\"flag\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-12-30 22:42:47');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES (1741107620885921794, '岗位管理', 2, 'com.eqc.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', '', '/system/post', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-12-30 21:44:38\",\"updateBy\":\"admin\",\"updateTime\":\"2023-12-30 22:42:59\",\"postId\":1,\"postCode\":\"medicalDeviceEngineer\",\"postName\":\"工程师\",\"postSort\":1,\"status\":\"0\",\"remark\":\"\",\"flag\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-12-30 22:43:00');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES (1741107748669587458, '岗位管理', 2, 'com.eqc.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', '', '/system/post', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-12-30 21:44:39\",\"updateBy\":\"admin\",\"updateTime\":\"2023-12-30 22:43:30\",\"postId\":4,\"postCode\":\"nurse\",\"postName\":\"护士\",\"postSort\":3,\"status\":\"0\",\"remark\":\"\",\"flag\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-12-30 22:43:30');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES (1741107835017723905, '岗位管理', 2, 'com.eqc.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', '', '/system/post', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-12-30 21:44:38\",\"updateBy\":\"admin\",\"updateTime\":\"2023-12-30 22:43:50\",\"postId\":1,\"postCode\":\"engineer\",\"postName\":\"工程师\",\"postSort\":1,\"status\":\"0\",\"remark\":\"\",\"flag\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-12-30 22:43:51');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES (1741108854464278529, '设备', 1, 'com.eqc.web.controller.equipments.EquipmentsController.add()', 'POST', 1, 'admin', '', '/equipments', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"equipmentId\":\"1741108854363615234\",\"equipmentName\":\"PET\",\"equipmentNo\":\"12412434324234\",\"equipmentSupplier\":\"西门子\",\"department\":\"104\",\"location\":null,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-12-30 22:47:54');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES (1741787484114743298, '设备', 2, 'com.eqc.web.controller.equipments.EquipmentsController.edit()', 'PUT', 1, 'admin', '', '/equipments', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"equipmentId\":\"1741108854363615234\",\"equipmentName\":\"PET\",\"equipmentNo\":\"12412434324234\",\"equipmentSupplier\":\"西门子\",\"department\":\"104\",\"location\":\"xxxx\",\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-01-01 19:44:32');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES (1741787524820463618, '设备耗材', 5, 'com.eqc.web.controller.equipments.EquipmentConsumablesController.export()', 'POST', 1, 'admin', '', '/equipment/consumables/export', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"consumableId\":null,\"equipmentId\":\"1741108854363615234\",\"consumableName\":null,\"consumableNo\":null,\"activationTime\":null,\"validity\":null,\"validityUint\":null,\"chargeUser\":null,\"status\":null,\"remark\":null}', '', 0, '', '2024-01-01 19:44:41');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES (1741789532059168770, '字典类型', 1, 'com.eqc.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-01-01 19:52:39\",\"updateBy\":\"admin\",\"updateTime\":\"2024-01-01 19:52:39\",\"dictId\":\"1741789532021420034\",\"dictName\":\"时间单位\",\"dictType\":\"sys_time_unit\",\"status\":\"0\",\"remark\":\"Y年 M月 D天\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-01-01 19:52:40');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES (1741789663068254210, '字典数据', 1, 'com.eqc.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-01-01 19:53:11\",\"updateBy\":\"admin\",\"updateTime\":\"2024-01-01 19:53:11\",\"dictCode\":\"1741789663001145346\",\"dictSort\":1,\"dictLabel\":\"年\",\"dictValue\":\"Y\",\"dictType\":\"sys_time_unit\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-01-01 19:53:11');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES (1741789752759250945, '字典数据', 1, 'com.eqc.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-01-01 19:53:32\",\"updateBy\":\"admin\",\"updateTime\":\"2024-01-01 19:53:32\",\"dictCode\":\"1741789752700530689\",\"dictSort\":2,\"dictLabel\":\"月\",\"dictValue\":\"M\",\"dictType\":\"sys_time_unit\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-01-01 19:53:33');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES (1741789825018720258, '字典数据', 1, 'com.eqc.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-01-01 19:53:49\",\"updateBy\":\"admin\",\"updateTime\":\"2024-01-01 19:53:49\",\"dictCode\":\"1741789824972582913\",\"dictSort\":3,\"dictLabel\":\"天\",\"dictValue\":\"D\",\"dictType\":\"sys_time_unit\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-01-01 19:53:50');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES (1741790811808428033, '菜单管理', 2, 'com.eqc.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-12-30 21:44:39\",\"updateBy\":\"admin\",\"updateTime\":\"2024-01-01 19:57:45\",\"parentName\":null,\"parentId\":2,\"children\":[],\"menuId\":117,\"menuName\":\"Admin监控\",\"orderNum\":5,\"path\":\"Admin\",\"component\":\"monitor/admin/index\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"1\",\"status\":\"0\",\"perms\":\"monitor:admin:list\",\"icon\":\"dashboard\",\"remark\":\"Admin监控菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-01-01 19:57:45');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES (1741790878921486337, '菜单管理', 2, 'com.eqc.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-12-30 21:44:39\",\"updateBy\":\"admin\",\"updateTime\":\"2024-01-01 19:58:01\",\"parentName\":null,\"parentId\":2,\"children\":[],\"menuId\":120,\"menuName\":\"任务调度中心\",\"orderNum\":5,\"path\":\"XxlJob\",\"component\":\"monitor/xxljob/index\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"1\",\"status\":\"0\",\"perms\":\"monitor:xxljob:list\",\"icon\":\"job\",\"remark\":\"Xxl-Job控制台菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-01-01 19:58:01');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES (1741791405440856065, '字典类型', 1, 'com.eqc.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-01-01 20:00:06\",\"updateBy\":\"admin\",\"updateTime\":\"2024-01-01 20:00:06\",\"dictId\":\"1741791405407301634\",\"dictName\":\"设备耗材状态\",\"dictType\":\"consumable_status\",\"status\":\"0\",\"remark\":\"0正在使用，1已报废 2未使用过\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-01-01 20:00:07');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES (1742135350037336065, '字典数据', 1, 'com.eqc.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-01-02 18:46:49\",\"updateBy\":\"admin\",\"updateTime\":\"2024-01-02 18:46:49\",\"dictCode\":\"1742135349911506945\",\"dictSort\":1,\"dictLabel\":\"使用中\",\"dictValue\":\"0\",\"dictType\":\"consumable_status\",\"cssClass\":null,\"listClass\":\"success\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-01-02 18:46:49');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES (1742135466865479682, '字典数据', 1, 'com.eqc.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-01-02 18:47:17\",\"updateBy\":\"admin\",\"updateTime\":\"2024-01-02 18:47:17\",\"dictCode\":\"1742135466794176514\",\"dictSort\":2,\"dictLabel\":\"已报废\",\"dictValue\":\"1\",\"dictType\":\"consumable_status\",\"cssClass\":null,\"listClass\":\"danger\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-01-02 18:47:17');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES (1742135570389291010, '字典数据', 1, 'com.eqc.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-01-02 18:47:41\",\"updateBy\":\"admin\",\"updateTime\":\"2024-01-02 18:47:41\",\"dictCode\":\"1742135570330570753\",\"dictSort\":3,\"dictLabel\":\"未使用\",\"dictValue\":\"2\",\"dictType\":\"consumable_status\",\"cssClass\":null,\"listClass\":\"primary\",\"isDefault\":null,\"status\":\"0\",\"remark\":null,\"default\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-01-02 18:47:42');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES (1742136398667862018, '设备耗材', 1, 'com.eqc.web.controller.equipments.EquipmentConsumablesController.add()', 'POST', 1, 'admin', '', '/equipment/consumables', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"consumableId\":\"1742136398638501889\",\"equipmentId\":\"1741108854363615234\",\"consumableName\":\"耗材1\",\"consumableNo\":\"pethc001\",\"activationTime\":\"2024-01-02 18:50:26\",\"validity\":6,\"validityUint\":\"M\",\"chargeUser\":1,\"status\":0,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-01-02 18:50:59');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES (1742137142364098561, '设备耗材', 2, 'com.eqc.web.controller.equipments.EquipmentConsumablesController.edit()', 'PUT', 1, 'admin', '', '/equipment/consumables', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"consumableId\":\"1742136398638501889\",\"equipmentId\":\"1741108854363615234\",\"consumableName\":\"耗材1\",\"consumableNo\":\"pethc001\",\"activationTime\":\"2024-01-02 18:50:26\",\"validity\":6,\"validityUint\":\"M\",\"chargeUser\":1,\"status\":0,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-01-02 18:53:57');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES (1742151723824226306, '设备', 1, 'com.eqc.web.controller.equipments.EquipmentsController.add()', 'POST', 1, 'admin', '', '/equipments', '127.0.0.1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"equipmentId\":\"1742151723719368705\",\"equipmentName\":\"呼吸机\",\"equipmentNo\":\"24214214545\",\"equipmentSupplier\":\"迈瑞\",\"department\":106,\"location\":\"wqfafs\",\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-01-02 19:51:53');
COMMIT;

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss` (
  `oss_id` bigint NOT NULL COMMENT '对象存储主键',
  `file_name` varchar(255) NOT NULL DEFAULT '' COMMENT '文件名',
  `original_name` varchar(255) NOT NULL DEFAULT '' COMMENT '原名',
  `file_suffix` varchar(10) NOT NULL DEFAULT '' COMMENT '文件后缀名',
  `url` varchar(500) NOT NULL COMMENT 'URL地址',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '上传人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新人',
  `service` varchar(20) NOT NULL DEFAULT 'minio' COMMENT '服务商',
  PRIMARY KEY (`oss_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='OSS对象存储表';

-- ----------------------------
-- Records of sys_oss
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_oss_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss_config`;
CREATE TABLE `sys_oss_config` (
  `oss_config_id` bigint NOT NULL COMMENT '主建',
  `config_key` varchar(20) NOT NULL DEFAULT '' COMMENT '配置key',
  `access_key` varchar(255) DEFAULT '' COMMENT 'accessKey',
  `secret_key` varchar(255) DEFAULT '' COMMENT '秘钥',
  `bucket_name` varchar(255) DEFAULT '' COMMENT '桶名称',
  `prefix` varchar(255) DEFAULT '' COMMENT '前缀',
  `endpoint` varchar(255) DEFAULT '' COMMENT '访问站点',
  `domain` varchar(255) DEFAULT '' COMMENT '自定义域名',
  `is_https` char(1) DEFAULT 'N' COMMENT '是否https（Y=是,N=否）',
  `region` varchar(255) DEFAULT '' COMMENT '域',
  `access_policy` char(1) NOT NULL DEFAULT '1' COMMENT '桶权限类型(0=private 1=public 2=custom)',
  `status` char(1) DEFAULT '1' COMMENT '是否默认（0=是,1=否）',
  `ext1` varchar(255) DEFAULT '' COMMENT '扩展字段',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`oss_config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='对象存储配置表';

-- ----------------------------
-- Records of sys_oss_config
-- ----------------------------
BEGIN;
INSERT INTO `sys_oss_config` (`oss_config_id`, `config_key`, `access_key`, `secret_key`, `bucket_name`, `prefix`, `endpoint`, `domain`, `is_https`, `region`, `access_policy`, `status`, `ext1`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, 'minio', 'eqc', 'eqc123', 'eqc', '', '127.0.0.1:9000', '', 'N', '', '1', '0', '', 'admin', '2023-12-30 21:44:43', 'admin', '2023-12-30 21:44:43', NULL);
INSERT INTO `sys_oss_config` (`oss_config_id`, `config_key`, `access_key`, `secret_key`, `bucket_name`, `prefix`, `endpoint`, `domain`, `is_https`, `region`, `access_policy`, `status`, `ext1`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, 'qiniu', 'XXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXX', 'eqc', '', 's3-cn-north-1.qiniucs.com', '', 'N', '', '1', '1', '', 'admin', '2023-12-30 21:44:43', 'admin', '2023-12-30 21:44:43', NULL);
INSERT INTO `sys_oss_config` (`oss_config_id`, `config_key`, `access_key`, `secret_key`, `bucket_name`, `prefix`, `endpoint`, `domain`, `is_https`, `region`, `access_policy`, `status`, `ext1`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, 'aliyun', 'XXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXX', 'eqc', '', 'oss-cn-beijing.aliyuncs.com', '', 'N', '', '1', '1', '', 'admin', '2023-12-30 21:44:43', 'admin', '2023-12-30 21:44:43', NULL);
INSERT INTO `sys_oss_config` (`oss_config_id`, `config_key`, `access_key`, `secret_key`, `bucket_name`, `prefix`, `endpoint`, `domain`, `is_https`, `region`, `access_policy`, `status`, `ext1`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4, 'qcloud', 'XXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXX', 'eqc-1250000000', '', 'cos.ap-beijing.myqcloud.com', '', 'N', 'ap-beijing', '1', '1', '', 'admin', '2023-12-30 21:44:43', 'admin', '2023-12-30 21:44:43', NULL);
INSERT INTO `sys_oss_config` (`oss_config_id`, `config_key`, `access_key`, `secret_key`, `bucket_name`, `prefix`, `endpoint`, `domain`, `is_https`, `region`, `access_policy`, `status`, `ext1`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5, 'image', 'eqc', 'eqc123', 'eqc', 'image', '127.0.0.1:9000', '', 'N', '', '1', '1', '', 'admin', '2023-12-30 21:44:43', 'admin', '2023-12-30 21:44:43', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
BEGIN;
INSERT INTO `sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, 'engineer', '工程师', 1, '0', 'admin', '2023-12-30 21:44:38', 'admin', '2023-12-30 22:43:51', '');
INSERT INTO `sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, 'doctor', '医生', 2, '0', 'admin', '2023-12-30 21:44:39', 'admin', '2023-12-30 22:41:40', '');
INSERT INTO `sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4, 'nurse', '护士', 3, '0', 'admin', '2023-12-30 21:44:39', 'admin', '2023-12-30 22:43:30', '');
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `menu_check_strictly`, `dept_check_strictly`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2023-12-30 21:44:39', '', NULL, '超级管理员');
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `menu_check_strictly`, `dept_check_strictly`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2023-12-30 21:44:39', 'admin', '2023-12-30 22:05:44', '普通角色');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_dept` (`role_id`, `dept_id`) VALUES (2, 100);
INSERT INTO `sys_role_dept` (`role_id`, `dept_id`) VALUES (2, 101);
INSERT INTO `sys_role_dept` (`role_id`, `dept_id`) VALUES (2, 105);
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 2);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 3);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 100);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 101);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 102);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 103);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 104);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 105);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 106);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 107);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 108);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 109);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 112);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 113);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 114);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 115);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 500);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 501);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1001);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1002);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1003);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1004);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1005);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1006);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1007);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1008);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1009);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1010);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1011);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1012);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1013);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1014);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1015);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1016);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1017);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1018);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1019);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1020);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1021);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1022);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1023);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1024);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1025);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1026);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1027);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1028);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1029);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1030);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1031);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1032);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1033);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1034);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1035);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1036);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1037);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1038);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1039);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1040);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1041);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1042);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1043);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1044);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1045);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1046);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1047);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1048);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1050);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1055);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1056);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1057);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1058);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1059);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1060);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1741093982624108545);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1741094806775484418);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1741094806775484419);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1741094806775484420);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1741094806775484421);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1741094806775484422);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(10) DEFAULT 'sys_user' COMMENT '用户类型（sys_user系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, 103, 'admin', 'yezzy', 'sys_user', 'yezzy@163.com', '15888888888', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-01-02 18:40:08', 'admin', '2023-12-30 21:44:38', 'admin', '2024-01-02 18:40:08', '管理员');
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, 105, 'lionli', '疯狂的狮子Li', 'sys_user', 'crazyLionLi@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-12-30 21:44:38', 'admin', '2023-12-30 21:44:38', 'admin', '2023-12-30 22:39:22', '测试员');
COMMIT;

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_post` (`user_id`, `post_id`) VALUES (1, 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (1, 1);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (2, 2);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
