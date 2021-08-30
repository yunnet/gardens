/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50711
 Source Host           : localhost:3306
 Source Schema         : iot

 Target Server Type    : MySQL
 Target Server Version : 50711
 File Encoding         : 65001

 Date: 12/07/2018 09:37:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for equipment_customer
-- ----------------------------
DROP TABLE IF EXISTS `equipment_customer`;
CREATE TABLE `equipment_customer`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `customer_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客户编号',
  `customer_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客户名称',
  `customer_desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客户全称',
  `contacts` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系人',
  `phone` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系电话',
  `address` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `zone` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区域',
  `longitude` decimal(12, 6) NOT NULL DEFAULT 0.000000 COMMENT '经度',
  `latitude` decimal(12, 6) NOT NULL DEFAULT 0.000000 COMMENT '纬度',
  `tag` int(11) NULL DEFAULT 0 COMMENT '状态:0.正常1.删除',
  `createuser` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `createdate` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `changeuser` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `changedate` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `rowver` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '时间戳',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_customer_no`(`customer_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of equipment_customer
-- ----------------------------
INSERT INTO `equipment_customer` VALUES (1, '1000', '电力1000', '北方电力股份有限公司1000', '柯经理', '020-88888888', '广州市天河区', '天河区', 113.350545, 23.123564, 0, '超级管理员', '2018-05-23 10:11:47', '超级管理员', '2018-07-12 09:05:50', '2018-07-12 09:05:50');
INSERT INTO `equipment_customer` VALUES (2, '1001', '电力1001', '北方电力股份有限公司1000', '周经理', '13812345678', '广州市黄埔区云城路8号', '黄埔区', 113.551707, 23.148001, 0, '超级管理员', '2018-05-23 09:52:45', '超级管理员', '2018-05-23 09:52:45', '2018-07-12 09:10:02');
INSERT INTO `equipment_customer` VALUES (3, '1002', '电力1002', '北方电力股份有限公司1000', '刘经理', '13812345678', '广州市天河区沾益直街19号', '天河区', 113.338312, 23.152797, 0, '超级管理员', '2018-05-23 09:54:39', '超级管理员', '2018-05-23 09:54:39', '2018-07-12 09:10:50');
INSERT INTO `equipment_customer` VALUES (4, '1003', '电力1003', '北方电力股份有限公司1000', '贺经理', '13812345678', '广州市南沙区红安路2号', '南沙区', 113.578354, 22.654290, 0, '超级管理员', '2018-05-23 09:55:12', '超级管理员', '2018-05-23 09:55:12', '2018-07-12 09:10:47');
INSERT INTO `equipment_customer` VALUES (5, '1004', '电力1004', '北方电力股份有限公司1000', '黎经理', '13812345678', '广州市海珠区南1601-1603号', '海珠区', 113.321635, 23.079626, 0, '超级管理员', '2018-05-23 09:57:39', '超级管理员', '2018-05-23 09:57:39', '2018-07-12 09:10:07');
INSERT INTO `equipment_customer` VALUES (6, '1005', '电力1005', '北方电力股份有限公司1000', '黄经理', '13812345678', '广州市海珠区东路2-8号', '海珠区', 113.377393, 23.105734, 0, '超级管理员', '2018-05-23 10:00:11', '超级管理员', '2018-05-25 22:12:22', '2018-07-12 09:10:45');
INSERT INTO `equipment_customer` VALUES (7, '1006', '电力1006', '北方电力股份有限公司1000', '劳经理', '13812345678', '广州市黄埔区大道112号', '黄埔区', 113.437901, 23.170523, 0, '超级管理员', '2018-05-23 10:01:26', '超级管理员', '2018-05-23 10:01:26', '2018-07-12 09:10:09');
INSERT INTO `equipment_customer` VALUES (8, '1007', '电力1007', '北方电力股份有限公司1000', '林经理', '13812345678', '广州市白云区机场高速与广花公路交界', '白云区', 113.265005, 23.218402, 0, '超级管理员', '2018-05-23 10:08:03', '超级管理员', '2018-05-23 10:08:03', '2018-07-12 09:10:43');
INSERT INTO `equipment_customer` VALUES (9, '1008', '电力1008', '北方电力股份有限公司1000', '周经理', '13812345678', '广州市海珠区1066号', '海珠区', 113.376268, 23.103193, 0, '超级管理员', '2018-05-23 10:10:59', '超级管理员', '2018-06-04 09:35:46', '2018-07-12 09:10:41');
INSERT INTO `equipment_customer` VALUES (10, '1009', '电力1009', '北方电力股份有限公司1009', '粱博伟', '13812345678', '广州黄埔区17号1楼', '黄埔区', 113.446613, 23.186369, 0, '超级管理员', '2018-05-23 10:14:11', '超级管理员', '2018-05-28 21:07:02', '2018-07-12 09:10:19');
INSERT INTO `equipment_customer` VALUES (11, '1010', '电力1010', '北方电力股份有限公司1010', '陈老师', '13812345678', '广东省清远市学府路', '其它', 113.099542, 23.724371, 0, '超级管理员', '2018-05-23 10:14:38', '超级管理员', '2018-05-23 10:14:38', '2018-07-12 09:10:20');
INSERT INTO `equipment_customer` VALUES (12, '1011', '电力1011', '北方电力股份有限公司1011', '周经理', '13812345678', '广州市海珠区1088号', '海珠区', 113.378743, 23.102501, 0, '超级管理员', '2018-05-23 10:19:36', '超级管理员', '2018-05-28 14:58:38', '2018-07-12 09:10:38');
INSERT INTO `equipment_customer` VALUES (13, '1012', '电力1012', '北方电力股份有限公司1012', '洪经理', '13812345678', '广州市萝岗区一横路1号', '黄埔区', 113.504177, 23.397516, 0, '超级管理员', '2018-05-23 14:14:27', '超级管理员', '2018-05-28 15:01:37', '2018-07-12 09:10:36');
INSERT INTO `equipment_customer` VALUES (14, '1013', '电力1013', '北方电力股份有限公司1013', '周经理', '13812345678', '广州市海珠区黄埔村北码头28号', '海珠区', 113.405503, 23.101601, 0, '超级管理员', '2018-05-27 08:18:38', '超级管理员', '2018-06-14 23:18:24', '2018-07-12 09:10:31');
INSERT INTO `equipment_customer` VALUES (16, '1014', '电力1014', '北方电力股份有限公司1014', '何经理', '13812345678', '广州市越秀区63号', '越秀区', 113.273724, 23.128511, 0, '超级管理员', '2018-07-04 11:36:34', '超级管理员', '2018-07-04 11:37:43', '2018-07-12 09:10:40');

-- ----------------------------
-- Table structure for equipment_dtu_config
-- ----------------------------
DROP TABLE IF EXISTS `equipment_dtu_config`;
CREATE TABLE `equipment_dtu_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `dtu_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'dtu编号',
  `sim_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sim卡号',
  `room_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电房编号',
  `time_interval` int(11) NULL DEFAULT 5 COMMENT '采集间隔',
  `tag` int(11) NULL DEFAULT 0 COMMENT '状态:0.正常1.删除',
  `createuser` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `createdate` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `changeuser` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `changedate` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `rowver` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '时间戳',
  `electrical_room_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电房编号',
  `customer_id` varchar(38) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_dtu_no`(`dtu_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 80 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of equipment_dtu_config
-- ----------------------------
INSERT INTO `equipment_dtu_config` VALUES (1, '900000000001', '1064873237914', '10020001', 1, 0, 'root', '2017-08-17 09:21:17', '超级管理员', '2018-06-28 14:15:49', '2018-06-28 14:15:49', 'DF20171018000008', '1aabe40f-c8d3-4d58-970e-f5eb9a557596');
INSERT INTO `equipment_dtu_config` VALUES (2, '900000000002', '1064720403999', '10020002', 5, 0, 'root', '2017-08-17 09:22:19', 'root', '2017-08-17 09:22:19', '2018-05-24 20:23:19', 'DF20171017000068', '1aabe40f-c8d3-4d58-970e-f5eb9a557596');
INSERT INTO `equipment_dtu_config` VALUES (3, '900000000003', '1064720403967', '', 2, 1, 'root', '2017-08-19 16:40:36', '超级管理员', '2018-05-30 22:44:40', '2018-05-30 22:44:41', NULL, '');
INSERT INTO `equipment_dtu_config` VALUES (7, '900000000007', '1064720403994', '10070001', 5, 0, 'root', '2017-08-19 16:54:43', 'root', '2017-08-19 16:54:43', '2018-05-24 21:35:11', 'DF20171018000032', '3cefa0df-7b12-4c61-b330-b16f9260c25e');
INSERT INTO `equipment_dtu_config` VALUES (8, '900000000008', '1064720403993', '10040005', 5, 0, 'root', '2017-08-19 17:02:18', 'root', '2017-08-19 17:02:18', '2018-05-24 20:55:06', 'DF20170929002078', '8df5424c-4d89-42e7-b0e5-36b3a2b91b3b');
INSERT INTO `equipment_dtu_config` VALUES (9, '900000000009', '1064720403992', '10070002', 5, 0, 'root', '2017-08-19 17:04:05', 'root', '2017-08-19 17:04:05', '2018-05-24 21:35:38', 'DF20171018000034', '3cefa0df-7b12-4c61-b330-b16f9260c25e');
INSERT INTO `equipment_dtu_config` VALUES (10, '900000000010', '1064720403991', '10070003', 5, 0, 'root', '2017-08-19 17:06:00', 'root', '2017-08-19 17:06:00', '2018-05-24 21:36:14', 'DF20171018000035', '3cefa0df-7b12-4c61-b330-b16f9260c25e');
INSERT INTO `equipment_dtu_config` VALUES (11, '900000000011', '1064720403990', '10070004', 5, 0, 'root', '2017-08-19 17:07:38', 'root', '2017-08-19 17:07:38', '2018-05-24 21:36:40', 'DF20171018000036', '3cefa0df-7b12-4c61-b330-b16f9260c25e');
INSERT INTO `equipment_dtu_config` VALUES (12, '900000000014', '1064720403980', '10040003', 5, 0, 'root', '2017-09-14 15:52:34', 'root', '2017-09-14 15:52:34', '2018-05-24 20:55:25', 'DF20170929002080', '8df5424c-4d89-42e7-b0e5-36b3a2b91b3b');
INSERT INTO `equipment_dtu_config` VALUES (13, '900000000016', '1064720403982', '10040004', 5, 0, 'root', '2017-09-14 15:52:47', 'root', '2017-10-17 11:02:32', '2018-05-24 20:55:42', 'DF20170929002172', '8df5424c-4d89-42e7-b0e5-36b3a2b91b3b');
INSERT INTO `equipment_dtu_config` VALUES (14, '900000000018', '1064720403902', '10050001', 5, 1, 'root', '2017-09-14 22:04:16', '超级管理员', '2018-06-04 15:00:43', '2018-06-04 15:00:44', 'DF20170927001874', 'f31e9b25-d214-48a5-817b-f9ed8130a0be');
INSERT INTO `equipment_dtu_config` VALUES (15, '900000000012', '1064720403978', '10050005', 5, 0, 'root', '2017-09-14 23:12:34', '超级管理员', '2018-06-04 10:36:27', '2018-06-04 10:36:28', NULL, NULL);
INSERT INTO `equipment_dtu_config` VALUES (16, '900000000020', '1064720403904', '10050002', 5, 0, 'root', '2017-09-14 23:47:49', 'root', '2017-09-14 23:47:49', '2018-05-24 21:16:46', 'DF20170927001871', 'f31e9b25-d214-48a5-817b-f9ed8130a0be');
INSERT INTO `equipment_dtu_config` VALUES (17, '900000000017', '1064720403901', '10050003', 5, 0, 'root', '2017-09-15 14:50:36', 'root', '2017-09-15 14:50:36', '2018-05-24 21:17:26', 'DF20170927001873', 'f31e9b25-d214-48a5-817b-f9ed8130a0be');
INSERT INTO `equipment_dtu_config` VALUES (18, '900000000015', '1064720403981', '10050004', 5, 0, 'root', '2017-09-20 13:34:35', 'root', '2017-09-20 13:34:35', '2018-05-24 21:18:07', 'DF20170927001875', 'f31e9b25-d214-48a5-817b-f9ed8130a0be');
INSERT INTO `equipment_dtu_config` VALUES (19, '900000000021', '1064720403905', '10050004', 5, 0, 'root', '2017-09-20 14:42:21', 'root', '2017-09-20 14:42:21', '2018-05-24 21:18:11', 'DF20170927001875', 'f31e9b25-d214-48a5-817b-f9ed8130a0be');
INSERT INTO `equipment_dtu_config` VALUES (20, '900000000019', '1064720403903', '10050001', 5, 0, 'root', '2017-09-21 11:15:40', 'root', '2017-09-21 11:15:40', '2018-05-24 21:18:17', 'DF20170927001874', 'f31e9b25-d214-48a5-817b-f9ed8130a0be');
INSERT INTO `equipment_dtu_config` VALUES (21, '900000000025', '1064720403954', '10060001', 5, 0, 'root', '2017-09-25 12:59:22', 'root', '2017-09-25 12:59:22', '2018-05-24 21:22:15', 'DF20170927001890', '0d435bab-21e6-4d3e-aca8-f02b131db975');
INSERT INTO `equipment_dtu_config` VALUES (22, '900000000024', '1064720403953', '10060002', 5, 0, 'root', '2017-09-25 13:07:29', 'root', '2017-09-25 13:07:29', '2018-05-24 21:23:01', 'DF20170927001905', '0d435bab-21e6-4d3e-aca8-f02b131db975');
INSERT INTO `equipment_dtu_config` VALUES (23, '900000000026', '1064720403955', '10060010', 5, 0, 'root', '2017-09-25 13:07:43', '超级管理员', '2018-06-04 10:37:36', '2018-06-04 10:37:37', 'DF20170927001888', '0d435bab-21e6-4d3e-aca8-f02b131db975');
INSERT INTO `equipment_dtu_config` VALUES (24, '900000000027', '1064720403956', '10060001', 5, 0, 'root', '2017-09-25 13:07:54', 'root', '2017-09-25 13:07:54', '2018-05-24 21:24:11', 'DF20170927001890', '0d435bab-21e6-4d3e-aca8-f02b131db975');
INSERT INTO `equipment_dtu_config` VALUES (25, '900000000028', '1064720403957', '10060003', 5, 0, 'root', '2017-09-25 13:08:09', 'root', '2017-09-25 13:08:09', '2018-05-24 21:24:48', 'DF20170927001904', '0d435bab-21e6-4d3e-aca8-f02b131db975');
INSERT INTO `equipment_dtu_config` VALUES (26, '900000000023', '1064720403964', '10060004', 5, 0, 'root', '2017-09-25 14:11:47', 'root', '2017-09-25 14:11:47', '2018-05-24 21:25:22', 'DF20170927001900', '0d435bab-21e6-4d3e-aca8-f02b131db975');
INSERT INTO `equipment_dtu_config` VALUES (27, '900000000032', '1064720403961', '10060005', 5, 0, 'root', '2017-09-25 14:51:00', 'root', '2017-09-25 14:51:00', '2018-05-24 21:25:50', 'DF20170928001964', '0d435bab-21e6-4d3e-aca8-f02b131db975');
INSERT INTO `equipment_dtu_config` VALUES (28, '900000000031', '1064720403960', '10060006', 5, 0, 'root', '2017-09-25 16:06:11', 'root', '2017-09-25 16:06:11', '2018-05-24 21:29:30', 'DF20170927001914', '0d435bab-21e6-4d3e-aca8-f02b131db975');
INSERT INTO `equipment_dtu_config` VALUES (29, '900000000033', '1064720403962', '10060007', 5, 0, 'root', '2017-09-25 16:46:51', 'root', '2017-09-25 16:46:51', '2018-05-24 21:30:19', 'DF20170927001915', '0d435bab-21e6-4d3e-aca8-f02b131db975');
INSERT INTO `equipment_dtu_config` VALUES (30, '900000000030', '1064720403959', '10060008', 5, 0, 'root', '2017-09-25 16:55:05', 'root', '2017-09-25 16:55:05', '2018-05-24 21:30:53', 'DF20170928001967', '0d435bab-21e6-4d3e-aca8-f02b131db975');
INSERT INTO `equipment_dtu_config` VALUES (31, '900000000029', '1064720403958', '10060009', 5, 0, 'root', '2017-09-25 16:56:24', 'root', '2017-09-25 16:56:24', '2018-05-24 21:31:19', 'DF20170927001913', '0d435bab-21e6-4d3e-aca8-f02b131db975');
INSERT INTO `equipment_dtu_config` VALUES (33, '900000000035', '1064720403983', '10010001', 5, 0, 'root', '2017-09-27 15:11:14', '超级管理员', '2018-05-30 15:04:45', '2018-05-30 15:04:45', 'DF20170929002023', '9d04b252-73bc-47a6-999e-27a3725855c4');
INSERT INTO `equipment_dtu_config` VALUES (34, '900000000036', '1064720403984', '10010002', 5, 0, 'root', '2017-09-27 15:11:25', '超级管理员', '2018-05-30 15:05:19', '2018-05-30 15:05:18', 'DF20170929002021', '9d04b252-73bc-47a6-999e-27a3725855c4');
INSERT INTO `equipment_dtu_config` VALUES (40, '900000000004', '1064720403997', '10040001', 5, 0, '超级管理员', '2017-10-17 11:16:46', '超级管理员', '2017-10-17 14:17:02', '2018-05-24 20:55:56', 'DF20170929002031', '8df5424c-4d89-42e7-b0e5-36b3a2b91b3b');
INSERT INTO `equipment_dtu_config` VALUES (41, '900000000013', '1064720403979', '10040002', 5, 0, '超级管理员', '2017-10-17 14:10:57', '超级管理员', '2017-10-25 15:56:32', '2018-05-24 20:56:12', 'DF20171017000013', '8df5424c-4d89-42e7-b0e5-36b3a2b91b3b');
INSERT INTO `equipment_dtu_config` VALUES (53, '900000000006', '1064720403995', '10030001', 5, 0, '超级管理员', '2017-11-06 11:15:45', 'root', NULL, '2018-05-24 21:11:03', 'DF20171106000023', 'd13eb8ad-e3a4-428e-989f-1a377dcbb96c');
INSERT INTO `equipment_dtu_config` VALUES (57, '900000000034', '1064720403963 ', '10030002', 5, 0, '超级管理员', '2017-11-07 10:11:42', NULL, NULL, '2018-05-24 21:11:06', 'DF20171106000027', 'd13eb8ad-e3a4-428e-989f-1a377dcbb96c');
INSERT INTO `equipment_dtu_config` VALUES (58, '900000000022', '1064720403906 ', '10030003', 5, 0, '超级管理员', '2017-11-07 10:12:20', NULL, NULL, '2018-05-24 21:12:03', 'DF20171106000029', 'd13eb8ad-e3a4-428e-989f-1a377dcbb96c');
INSERT INTO `equipment_dtu_config` VALUES (59, '900000000005', '1064720403996 ', '10030004', 5, 0, '超级管理员', '2017-11-07 10:12:52', NULL, NULL, '2018-05-24 21:12:37', 'DF20171106000031', 'd13eb8ad-e3a4-428e-989f-1a377dcbb96c');
INSERT INTO `equipment_dtu_config` VALUES (62, '900000000038', '1064720403965', '10100001', 5, 0, '超级管理员', '2018-04-19 10:14:26', '超级管理员', '2018-04-19 13:27:21', '2018-05-24 21:40:06', '', '93871b50-5f7e-42d5-b044-3bdd91bace4a');
INSERT INTO `equipment_dtu_config` VALUES (64, '900000000039', '1064720403952', '10100002', 5, 0, '超级管理员', '2018-04-19 10:15:07', '超级管理员', '2018-04-19 16:46:36', '2018-05-24 21:40:12', '', '93871b50-5f7e-42d5-b044-3bdd91bace4a');
INSERT INTO `equipment_dtu_config` VALUES (65, '900000000040', '1064720403989', '10080001', 5, 0, '超级管理员', '2018-05-11 13:54:56', '超级管理员', '2018-06-04 10:39:24', '2018-06-04 10:39:24', '', NULL);
INSERT INTO `equipment_dtu_config` VALUES (66, '900000000041', '1064720403988', '10090001', 5, 0, '超级管理员', '2018-05-17 14:58:51', '超级管理员', '2018-05-28 10:14:16', '2018-05-28 10:14:16', '', NULL);
INSERT INTO `equipment_dtu_config` VALUES (67, '900000000042', '1064720403985', '10110001', 5, 0, '超级管理员', '2018-05-21 15:04:50', '超级管理员', '2018-06-04 10:40:25', '2018-06-04 10:40:26', '', NULL);
INSERT INTO `equipment_dtu_config` VALUES (73, '900000000037', '1064720403986', '10120001', 1, 0, '超级管理员', '2018-05-23 14:06:38', '超级管理员', '2018-06-27 16:25:57', '2018-06-27 16:25:57', '', '12669913-e5a2-4ee4-92fc-09d171562f70');
INSERT INTO `equipment_dtu_config` VALUES (74, '900000000043', '1064720403999', '10130001', 5, 0, '超级管理员', '2018-05-27 07:38:42', '超级管理员', '2018-05-27 11:16:28', '2018-05-31 11:47:42', '', 'b5a684f0-39ff-454b-bd07-0469a4f3053b');
INSERT INTO `equipment_dtu_config` VALUES (75, '900000000044', '1064873237919', '10130002', 5, 0, '超级管理员', '2018-05-27 07:38:57', '超级管理员', '2018-05-27 08:06:41', '2018-05-27 11:11:51', '', NULL);
INSERT INTO `equipment_dtu_config` VALUES (76, '900000000045', '1064873237923', '10130003', 5, 0, '超级管理员', '2018-05-27 07:39:04', '超级管理员', '2018-06-04 10:45:19', '2018-06-04 10:45:19', '', NULL);
INSERT INTO `equipment_dtu_config` VALUES (77, '900000000046', '1064873237905', '10140001', 5, 0, '超级管理员', '2018-07-04 12:53:28', '超级管理员', '2018-07-04 12:53:28', '2018-07-04 12:53:27', NULL, NULL);
INSERT INTO `equipment_dtu_config` VALUES (78, '900000000047', '1064873237906', '10140001', 5, 0, '超级管理员', '2018-07-04 12:54:24', '超级管理员', '2018-07-04 12:54:24', '2018-07-04 12:54:23', NULL, NULL);
INSERT INTO `equipment_dtu_config` VALUES (79, '900000000048', '1064873237907', '10140001', 5, 0, '超级管理员', '2018-07-04 12:54:46', '超级管理员', '2018-07-04 12:54:46', '2018-07-04 12:54:45', NULL, NULL);

-- ----------------------------
-- Table structure for equipment_gateway
-- ----------------------------
DROP TABLE IF EXISTS `equipment_gateway`;
CREATE TABLE `equipment_gateway`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `gateway_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网关编号',
  `gateway_desc` varchar(38) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网关名称',
  `tag` int(11) NULL DEFAULT 0 COMMENT '属性:0.正常1.删除',
  `createuser` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `createdate` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `changeuser` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `changedate` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `rowver` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '时间戳',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_gateway_no`(`gateway_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of equipment_gateway
-- ----------------------------
INSERT INTO `equipment_gateway` VALUES (1, '1000', '1000网关', 0, 'root', '2018-01-30 09:30:07', '超级管理员', '2018-02-07 17:45:15', '2018-07-12 09:15:21');
INSERT INTO `equipment_gateway` VALUES (2, '1001', '1001网关', 0, 'root', '2018-01-30 09:30:23', '超级管理员', '2018-07-12 09:04:17', '2018-07-12 09:04:16');
INSERT INTO `equipment_gateway` VALUES (3, '1002', '1002网关', 0, 'root', '2018-01-30 09:30:38', '超级管理员', '2018-07-12 09:04:25', '2018-07-12 09:04:25');

-- ----------------------------
-- Table structure for equipment_meter_addr_config
-- ----------------------------
DROP TABLE IF EXISTS `equipment_meter_addr_config`;
CREATE TABLE `equipment_meter_addr_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `meter_type_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电表类型编号',
  `segment_start_addr` int(11) NULL DEFAULT 0 COMMENT '分段起始地址',
  `segment_len` int(11) NULL DEFAULT NULL COMMENT '读取寄存器长度',
  `segment_no` int(11) NULL DEFAULT NULL COMMENT '第几段',
  `tag` int(11) NULL DEFAULT 0 COMMENT '状态:0.正常1.删除',
  `createuser` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `createdate` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `changeuser` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `changedate` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `rowver` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '时间戳',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of equipment_meter_addr_config
-- ----------------------------
INSERT INTO `equipment_meter_addr_config` VALUES (1, '1000', 0, 36, 1, 0, 'root', '2017-08-12 10:02:30', 'root', '2017-08-12 10:02:30', '2017-09-15 15:16:32');
INSERT INTO `equipment_meter_addr_config` VALUES (2, '1004', 0, 100, 1, 0, 'root', '2017-08-14 10:08:35', 'root', '2017-08-14 10:08:35', '2017-08-14 10:08:35');
INSERT INTO `equipment_meter_addr_config` VALUES (3, '1004', 100, 24, 2, 0, 'root', '2017-08-14 10:08:57', 'root', '2017-08-14 10:08:57', '2017-08-14 10:08:57');
INSERT INTO `equipment_meter_addr_config` VALUES (4, '1002', 0, 51, 1, 0, 'root', '2017-09-14 10:50:55', 'root', '2017-09-14 10:50:55', '2017-09-14 10:50:55');
INSERT INTO `equipment_meter_addr_config` VALUES (5, '1001', 0, 56, 1, 0, 'root', '2017-09-25 13:04:39', 'root', '2017-09-25 13:04:39', '2017-09-25 13:22:16');
INSERT INTO `equipment_meter_addr_config` VALUES (6, '1001', 4096, 6, 2, 0, 'root', '2017-09-25 14:31:54', 'root', '2017-09-25 14:31:54', '2017-09-26 16:52:46');
INSERT INTO `equipment_meter_addr_config` VALUES (7, '1006', 0, 47, 1, 0, 'root', '2017-09-27 11:31:40', 'root', '2017-09-27 11:31:40', '2017-09-27 11:31:40');
INSERT INTO `equipment_meter_addr_config` VALUES (8, '1004', 513, 100, 3, 0, 'root', '2017-11-20 15:46:32', 'root', '2017-11-20 15:46:32', '2017-11-20 15:48:50');
INSERT INTO `equipment_meter_addr_config` VALUES (9, '1004', 613, 86, 4, 0, 'root', '2017-11-20 15:49:14', 'root', '2017-11-20 15:49:14', '2017-11-20 15:50:13');
INSERT INTO `equipment_meter_addr_config` VALUES (10, '1007', 0, 53, 1, 0, '超级管理员', '2018-05-30 09:12:45', '超级管理员', '2018-05-30 17:55:26', '2018-05-30 17:55:26');
INSERT INTO `equipment_meter_addr_config` VALUES (12, '1007', 100, 14, 2, 0, '超级管理员', '2018-05-30 17:49:36', '超级管理员', '2018-05-30 17:55:11', '2018-05-30 17:55:10');

-- ----------------------------
-- Table structure for equipment_meter_config
-- ----------------------------
DROP TABLE IF EXISTS `equipment_meter_config`;
CREATE TABLE `equipment_meter_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `dtu_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'dtu编号',
  `meter_address` int(11) NOT NULL COMMENT '表地址',
  `meter_type_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电表类型编号',
  `gateway_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网关编号',
  `gateway_qzone` int(11) NULL DEFAULT NULL COMMENT '网关区域编码',
  `gateway_address` int(11) NULL DEFAULT NULL COMMENT '网关地址',
  `gateway_site` int(11) NULL DEFAULT NULL COMMENT '网关主站标识',
  `loop_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回路名称',
  `pt` int(11) NULL DEFAULT 1 COMMENT '电压互感器变比',
  `ct` int(11) NULL DEFAULT 1 COMMENT '电流互感器变比',
  `tag` int(11) NULL DEFAULT 0 COMMENT '状态:0.正常1.删除',
  `createuser` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `createdate` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `changeuser` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `changedate` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `rowver` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '时间戳',
  `customer_id` varchar(38) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户id',
  `used` int(2) NULL DEFAULT 0 COMMENT '是否使用',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_meter_addr_type`(`meter_type_no`, `dtu_no`, `meter_address`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 207 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of equipment_meter_config
-- ----------------------------
INSERT INTO `equipment_meter_config` VALUES (1, '900000000001', 1, '1004', '1002', 0, 0, 0, '专变低压电源进线', 1, 1, 0, 'root', '2017-08-17 09:27:42', '超级管理员', '2018-06-04 08:42:32', '2018-06-04 08:42:33', '1aabe40f-c8d3-4d58-970e-f5eb9a557596', 1);
INSERT INTO `equipment_meter_config` VALUES (2, '900000000001', 2, '1004', '1002', 0, 0, 0, '1-12层办公用电', 1, 1, 0, 'root', '2017-08-17 13:59:57', '超级管理员', '2018-06-04 08:42:42', '2018-06-04 08:42:43', '1aabe40f-c8d3-4d58-970e-f5eb9a557596', 1);
INSERT INTO `equipment_meter_config` VALUES (3, '900000000001', 3, '1004', '1002', 0, 0, 0, '分断低压进线', 1, 1, 0, 'root', '2017-08-17 14:23:54', '超级管理员', '2018-06-04 08:42:58', '2018-06-04 08:42:59', '1aabe40f-c8d3-4d58-970e-f5eb9a557596', 1);
INSERT INTO `equipment_meter_config` VALUES (4, '900000000002', 1, '1004', '1001', 4401, 100, 1, 'G1进线', 1, 1, 0, 'root', '2017-08-18 12:41:36', '超级管理员', '2018-06-04 08:43:18', '2018-06-04 08:43:19', '1aabe40f-c8d3-4d58-970e-f5eb9a557596', 1);
INSERT INTO `equipment_meter_config` VALUES (5, '900000000006', 1, '1004', '1000', 0, 0, 0, '1号综合房1#低压进线', 1, 600, 0, 'root', '2017-08-21 14:46:28', '超级管理员', '2018-06-04 08:45:35', '2018-06-04 08:45:36', 'd13eb8ad-e3a4-428e-989f-1a377dcbb96c', 1);
INSERT INTO `equipment_meter_config` VALUES (6, '900000000006', 2, '1004', '1000', 0, 0, 0, '1号综合房2#低压进线', 1, 600, 0, 'root', '2017-08-21 14:46:55', '超级管理员', '2018-06-04 08:45:46', '2018-06-04 08:45:47', 'd13eb8ad-e3a4-428e-989f-1a377dcbb96c', 1);
INSERT INTO `equipment_meter_config` VALUES (7, '900000000007', 1, '1004', '1000', 0, 0, 0, '7AA1进线', 1, 1, 0, 'root', '2017-08-29 12:35:30', '超级管理员', '2018-06-04 08:46:07', '2018-06-04 08:46:08', '3cefa0df-7b12-4c61-b330-b16f9260c25e', 1);
INSERT INTO `equipment_meter_config` VALUES (8, '900000000011', 1, '1004', '1000', 0, 0, 0, 'J1栋进线', 1, 200, 0, 'root', '2017-08-29 13:37:08', '超级管理员', '2018-06-04 08:47:23', '2018-06-04 08:47:24', '3cefa0df-7b12-4c61-b330-b16f9260c25e', 1);
INSERT INTO `equipment_meter_config` VALUES (9, '900000000008', 93, '1002', '1000', 0, 0, 0, '#3低压进线', 1, 500, 0, 'root', '2017-09-14 10:51:52', '超级管理员', '2018-06-04 14:50:00', '2018-06-04 14:50:01', '8df5424c-4d89-42e7-b0e5-36b3a2b91b3b', 1);
INSERT INTO `equipment_meter_config` VALUES (10, '900000000008', 97, '1002', '1000', 0, 0, 0, '#4低压进线', 1, 500, 0, 'root', '2017-09-14 10:52:23', '超级管理员', '2018-06-04 14:50:17', '2018-06-04 14:50:17', '8df5424c-4d89-42e7-b0e5-36b3a2b91b3b', 1);
INSERT INTO `equipment_meter_config` VALUES (11, '900000000008', 90, '1002', '1000', 0, 0, 0, '#2低压进线', 1, 600, 0, 'root', '2017-09-14 11:13:27', '超级管理员', '2018-06-04 14:50:30', '2018-06-04 14:50:31', '8df5424c-4d89-42e7-b0e5-36b3a2b91b3b', 1);
INSERT INTO `equipment_meter_config` VALUES (12, '900000000008', 92, '1002', '1000', 0, 0, 0, '#1低压进线', 1, 600, 0, 'root', '2017-09-14 11:13:55', '超级管理员', '2018-06-04 14:50:42', '2018-06-04 14:50:43', '8df5424c-4d89-42e7-b0e5-36b3a2b91b3b', 1);
INSERT INTO `equipment_meter_config` VALUES (13, '900000000014', 38, '1002', '1000', 0, 0, 0, '#5低压进线', 1, 600, 0, 'root', '2017-09-14 15:39:14', '超级管理员', '2018-06-04 08:54:00', '2018-06-04 08:54:01', '8df5424c-4d89-42e7-b0e5-36b3a2b91b3b', 1);
INSERT INTO `equipment_meter_config` VALUES (14, '900000000014', 40, '1002', '1000', 0, 0, 0, '#6低压进线', 1, 600, 0, 'root', '2017-09-14 15:39:49', '超级管理员', '2018-06-04 08:54:10', '2018-06-04 08:54:10', '8df5424c-4d89-42e7-b0e5-36b3a2b91b3b', 1);
INSERT INTO `equipment_meter_config` VALUES (15, '900000000016', 1, '1004', '1000', 0, 0, 0, '特斯拉高压房左高压进线', 1, 1, 0, 'root', '2017-09-14 15:43:45', '超级管理员', '2018-06-04 08:56:08', '2018-06-04 08:56:09', '8df5424c-4d89-42e7-b0e5-36b3a2b91b3b', 1);
INSERT INTO `equipment_meter_config` VALUES (16, '900000000016', 2, '1004', '1000', 0, 0, 0, '特斯拉高压房右高压进线', 1, 1, 0, 'root', '2017-09-14 15:44:00', '超级管理员', '2018-06-04 08:56:17', '2018-06-04 08:56:18', '8df5424c-4d89-42e7-b0e5-36b3a2b91b3b', 1);
INSERT INTO `equipment_meter_config` VALUES (17, '900000000020', 1, '1004', '1000', 0, 0, 0, '1#高压进线', 100, 300, 0, 'root', '2017-09-14 23:50:46', '超级管理员', '2018-06-04 08:58:18', '2018-06-04 08:58:19', 'f31e9b25-d214-48a5-817b-f9ed8130a0be', 1);
INSERT INTO `equipment_meter_config` VALUES (18, '900000000017', 13, '1000', '1000', 0, 0, 0, 'E1/1号低压进线', 1, 800, 0, 'root', '2017-09-15 14:52:04', '超级管理员', '2018-06-04 08:56:36', '2018-06-04 08:56:37', 'f31e9b25-d214-48a5-817b-f9ed8130a0be', 1);
INSERT INTO `equipment_meter_config` VALUES (19, '900000000017', 36, '1000', '1000', 0, 0, 0, 'E1/2号低压进线', 1, 800, 0, 'root', '2017-09-15 14:52:04', '超级管理员', '2018-06-04 08:56:43', '2018-06-04 08:56:43', 'f31e9b25-d214-48a5-817b-f9ed8130a0be', 1);
INSERT INTO `equipment_meter_config` VALUES (20, '900000000017', 48, '1000', '1000', 0, 0, 0, '3W/2号低压进线', 1, 600, 0, 'root', '2017-09-15 14:53:17', '超级管理员', '2018-06-04 08:56:50', '2018-06-04 08:56:50', 'f31e9b25-d214-48a5-817b-f9ed8130a0be', 1);
INSERT INTO `equipment_meter_config` VALUES (21, '900000000015', 7, '1000', '1000', 0, 0, 0, '1W/8号低压进线', 1, 800, 1, 'root', '2017-09-20 13:35:36', '超级管理员', '2018-06-04 08:55:08', '2018-06-04 08:55:09', 'f31e9b25-d214-48a5-817b-f9ed8130a0be', 1);
INSERT INTO `equipment_meter_config` VALUES (22, '900000000015', 6, '1000', '1000', 0, 0, 0, '2W/2号低压进线', 1, 600, 1, 'root', '2017-09-20 13:36:19', '超级管理员', '2018-06-04 08:54:57', '2018-06-04 08:54:57', 'f31e9b25-d214-48a5-817b-f9ed8130a0be', 1);
INSERT INTO `equipment_meter_config` VALUES (23, '900000000015', 55, '1000', '1000', 0, 0, 0, '1W/2号低压进线', 1, 800, 1, 'root', '2017-09-20 13:37:02', '超级管理员', '2018-06-04 08:55:33', '2018-06-04 08:55:34', 'f31e9b25-d214-48a5-817b-f9ed8130a0be', 1);
INSERT INTO `equipment_meter_config` VALUES (24, '900000000015', 45, '1000', '1000', 0, 0, 0, '1W/6号低压进线', 1, 800, 1, 'root', '2017-09-20 13:37:40', '超级管理员', '2018-06-04 08:55:18', '2018-06-04 08:55:18', 'f31e9b25-d214-48a5-817b-f9ed8130a0be', 1);
INSERT INTO `equipment_meter_config` VALUES (25, '900000000015', 57, '1000', '1000', 0, 0, 0, '1W/4号低压进线', 1, 800, 1, 'root', '2017-09-20 13:39:01', '超级管理员', '2018-06-04 08:55:25', '2018-06-04 08:55:26', 'f31e9b25-d214-48a5-817b-f9ed8130a0be', 1);
INSERT INTO `equipment_meter_config` VALUES (26, '900000000021', 1, '1004', '1000', 0, 0, 0, '2#高压进线', 100, 300, 0, 'root', '2017-09-20 14:43:10', '超级管理员', '2018-06-04 08:58:40', '2018-06-04 08:58:41', 'f31e9b25-d214-48a5-817b-f9ed8130a0be', 1);
INSERT INTO `equipment_meter_config` VALUES (27, '900000000018', 54, '1004', '1000', NULL, NULL, NULL, NULL, 1, 600, 1, 'root', '2017-09-20 15:15:34', '超级管理员', '2018-04-28 09:17:11', '2018-05-21 15:54:50', 'f31e9b25-d214-48a5-817b-f9ed8130a0be', 0);
INSERT INTO `equipment_meter_config` VALUES (28, '900000000018', 33, '1004', '1000', NULL, NULL, NULL, NULL, 1, 800, 1, 'root', '2017-09-20 15:16:19', '超级管理员', '2018-04-28 09:17:16', '2018-05-21 15:54:54', 'f31e9b25-d214-48a5-817b-f9ed8130a0be', 0);
INSERT INTO `equipment_meter_config` VALUES (29, '900000000018', 50, '1004', '1000', NULL, NULL, NULL, NULL, 1, 800, 1, 'root', '2017-09-20 15:16:45', '超级管理员', '2018-04-28 09:17:20', '2018-05-21 15:54:58', 'f31e9b25-d214-48a5-817b-f9ed8130a0be', 0);
INSERT INTO `equipment_meter_config` VALUES (30, '900000000019', 54, '1000', '1000', 0, 0, 0, 'E2/2号低压进线', 1, 600, 1, 'root', '2017-09-21 11:15:20', '超级管理员', '2018-06-04 08:58:00', '2018-06-04 08:58:00', 'f31e9b25-d214-48a5-817b-f9ed8130a0be', 1);
INSERT INTO `equipment_meter_config` VALUES (31, '900000000019', 50, '1000', '1000', 0, 0, 0, 'E2/4号低压进线', 1, 800, 1, 'root', '2017-09-21 12:23:34', '超级管理员', '2018-06-04 08:57:52', '2018-06-04 08:57:52', 'f31e9b25-d214-48a5-817b-f9ed8130a0be', 1);
INSERT INTO `equipment_meter_config` VALUES (32, '900000000019', 33, '1000', '1000', 0, 0, 0, 'E2/5号低压进线', 1, 800, 1, 'root', '2017-09-21 14:02:20', '超级管理员', '2018-06-04 08:57:40', '2018-06-04 08:57:40', 'f31e9b25-d214-48a5-817b-f9ed8130a0be', 1);
INSERT INTO `equipment_meter_config` VALUES (33, '900000000004', 1, '1004', '1000', 0, 0, 0, '1#高压进线', 100, 250, 0, 'root', '2017-09-22 20:35:46', '超级管理员', '2018-06-04 08:43:37', '2018-06-04 08:43:38', '8df5424c-4d89-42e7-b0e5-36b3a2b91b3b', 1);
INSERT INTO `equipment_meter_config` VALUES (34, '900000000025', 2, '1001', '1000', 0, 0, 0, 'B区2T1低压进线', 1, 400, 0, 'root', '2017-09-25 13:01:04', '超级管理员', '2018-06-04 09:01:47', '2018-06-04 09:01:48', '0d435bab-21e6-4d3e-aca8-f02b131db975', 1);
INSERT INTO `equipment_meter_config` VALUES (35, '900000000025', 3, '1001', '1000', 0, 0, 0, 'B区2T2低压进线', 1, 500, 0, 'root', '2017-09-25 13:01:40', '超级管理员', '2018-06-04 09:01:54', '2018-06-04 09:01:55', '0d435bab-21e6-4d3e-aca8-f02b131db975', 1);
INSERT INTO `equipment_meter_config` VALUES (36, '900000000024', 2, '1001', '1000', 0, 0, 0, 'A区1T6低压进线', 1, 300, 0, 'root', '2017-09-25 14:05:38', '超级管理员', '2018-06-04 09:00:03', '2018-06-04 09:00:04', '0d435bab-21e6-4d3e-aca8-f02b131db975', 1);
INSERT INTO `equipment_meter_config` VALUES (37, '900000000024', 3, '1001', '1000', 0, 0, 0, 'A区1T5低压进线', 1, 300, 0, 'root', '2017-09-25 14:05:52', '超级管理员', '2018-06-04 09:00:15', '2018-06-04 09:00:16', '0d435bab-21e6-4d3e-aca8-f02b131db975', 1);
INSERT INTO `equipment_meter_config` VALUES (38, '900000000028', 2, '1001', '1000', 0, 0, 0, 'A区1T2低压进线', 1, 600, 0, 'root', '2017-09-25 14:06:19', '超级管理员', '2018-06-04 09:03:02', '2018-06-04 09:03:03', '0d435bab-21e6-4d3e-aca8-f02b131db975', 1);
INSERT INTO `equipment_meter_config` VALUES (39, '900000000028', 3, '1001', '1000', 0, 0, 0, 'A区1T1低压进线', 1, 600, 0, 'root', '2017-09-25 14:06:36', '超级管理员', '2018-06-04 09:03:08', '2018-06-04 09:03:08', '0d435bab-21e6-4d3e-aca8-f02b131db975', 1);
INSERT INTO `equipment_meter_config` VALUES (40, '900000000023', 2, '1001', '1000', 0, 0, 0, 'B区2T4低压进线', 1, 700, 0, 'root', '2017-09-25 14:07:07', '超级管理员', '2018-06-04 08:59:32', '2018-06-04 08:59:32', '0d435bab-21e6-4d3e-aca8-f02b131db975', 1);
INSERT INTO `equipment_meter_config` VALUES (41, '900000000023', 3, '1001', '1000', 0, 0, 0, 'B区2T3低压进线', 1, 700, 0, 'root', '2017-09-25 14:07:25', '超级管理员', '2018-06-04 08:59:41', '2018-06-04 08:59:42', '0d435bab-21e6-4d3e-aca8-f02b131db975', 1);
INSERT INTO `equipment_meter_config` VALUES (42, '900000000027', 2, '1001', '1000', 0, 0, 0, 'A区1T4低压进线', 1, 600, 0, 'root', '2017-09-25 14:07:48', '超级管理员', '2018-06-04 09:02:38', '2018-06-04 09:02:38', '0d435bab-21e6-4d3e-aca8-f02b131db975', 1);
INSERT INTO `equipment_meter_config` VALUES (43, '900000000027', 3, '1001', '1000', 0, 0, 0, 'A区1T3低压进线', 1, 600, 0, 'root', '2017-09-25 14:08:08', '超级管理员', '2018-06-04 09:02:43', '2018-06-04 09:02:44', '0d435bab-21e6-4d3e-aca8-f02b131db975', 1);
INSERT INTO `equipment_meter_config` VALUES (44, '900000000026', 2, '1001', '1000', 0, 0, 0, 'B区2T6低压进线', 1, 300, 0, 'root', '2017-09-25 14:08:37', '超级管理员', '2018-06-04 09:02:15', '2018-06-04 09:02:16', '0d435bab-21e6-4d3e-aca8-f02b131db975', 1);
INSERT INTO `equipment_meter_config` VALUES (45, '900000000026', 3, '1001', '1000', 0, 0, 0, 'B区2T5低压进线', 1, 300, 0, 'root', '2017-09-25 14:08:55', '超级管理员', '2018-06-04 09:02:22', '2018-06-04 09:02:22', '0d435bab-21e6-4d3e-aca8-f02b131db975', 1);
INSERT INTO `equipment_meter_config` VALUES (46, '900000000032', 1, '1004', '1000', 0, 0, 0, '1#高压进线', 100, 150, 0, 'root', '2017-09-25 15:12:08', '超级管理员', '2018-06-04 09:04:30', '2018-06-04 09:04:30', '0d435bab-21e6-4d3e-aca8-f02b131db975', 1);
INSERT INTO `equipment_meter_config` VALUES (47, '900000000031', 2, '1001', '1000', 0, 0, 0, 'C区3T4低压进线', 1, 500, 0, 'root', '2017-09-25 16:05:37', '超级管理员', '2018-06-04 09:04:06', '2018-06-04 09:04:07', '0d435bab-21e6-4d3e-aca8-f02b131db975', 1);
INSERT INTO `equipment_meter_config` VALUES (48, '900000000031', 3, '1001', '1000', 0, 0, 0, 'C区3T3低压进线', 1, 500, 0, 'root', '2017-09-25 16:05:54', '超级管理员', '2018-06-04 09:04:14', '2018-06-04 09:04:14', '0d435bab-21e6-4d3e-aca8-f02b131db975', 1);
INSERT INTO `equipment_meter_config` VALUES (49, '900000000033', 2, '1001', '1000', 0, 0, 0, 'C区3T2低压进线', 1, 800, 0, 'root', '2017-09-25 16:46:20', '超级管理员', '2018-06-04 09:04:47', '2018-06-04 09:04:47', '0d435bab-21e6-4d3e-aca8-f02b131db975', 1);
INSERT INTO `equipment_meter_config` VALUES (50, '900000000033', 3, '1001', '1000', 0, 0, 0, 'C区3T1低压进线', 1, 500, 0, 'root', '2017-09-25 16:46:37', '超级管理员', '2018-06-04 09:04:53', '2018-06-04 09:04:53', '0d435bab-21e6-4d3e-aca8-f02b131db975', 1);
INSERT INTO `equipment_meter_config` VALUES (51, '900000000030', 1, '1004', '1000', 0, 0, 0, '2#高压进线', 100, 300, 0, 'root', '2017-09-25 16:54:49', '超级管理员', '2018-06-04 09:03:50', '2018-06-04 09:03:51', '0d435bab-21e6-4d3e-aca8-f02b131db975', 1);
INSERT INTO `equipment_meter_config` VALUES (52, '900000000029', 2, '1001', '1000', 0, 0, 0, 'C区3T5低压进线', 1, 500, 0, 'root', '2017-09-25 16:55:55', '超级管理员', '2018-06-04 09:03:23', '2018-06-04 09:03:24', '0d435bab-21e6-4d3e-aca8-f02b131db975', 1);
INSERT INTO `equipment_meter_config` VALUES (53, '900000000029', 3, '1001', '1000', 0, 0, 0, 'C区3T6低压进线', 1, 500, 0, 'root', '2017-09-25 16:56:12', '超级管理员', '2018-06-04 09:03:30', '2018-06-04 09:03:31', '0d435bab-21e6-4d3e-aca8-f02b131db975', 1);
INSERT INTO `equipment_meter_config` VALUES (54, '900000000012', 1, '1004', '1000', 0, 0, 0, '1#高压进线', 100, 250, 0, 'root', '2017-09-27 10:28:04', '超级管理员', '2018-06-04 14:52:00', '2018-06-04 14:52:00', NULL, 1);
INSERT INTO `equipment_meter_config` VALUES (77, '900000000035', 1, '1004', '1000', 0, 0, 0, '3期总开关', 1, 1000, 0, 'root', '2018-03-14 09:17:03', '超级管理员', '2018-06-04 09:05:44', '2018-06-04 09:05:44', '9d04b252-73bc-47a6-999e-27a3725855c4', 1);
INSERT INTO `equipment_meter_config` VALUES (78, '900000000035', 2, '1004', '1000', 0, 0, 0, '实业多肽车间', 1, 400, 0, 'root', '2017-09-29 16:01:22', '超级管理员', '2018-06-04 09:05:51', '2018-06-04 09:05:52', '9d04b252-73bc-47a6-999e-27a3725855c4', 1);
INSERT INTO `equipment_meter_config` VALUES (79, '900000000035', 3, '1004', '1000', 0, 0, 0, 'NL2、3号线', 1, 300, 0, 'root', '2017-09-29 16:01:51', '超级管理员', '2018-06-04 09:06:06', '2018-06-04 09:06:07', '9d04b252-73bc-47a6-999e-27a3725855c4', 1);
INSERT INTO `equipment_meter_config` VALUES (80, '900000000035', 4, '1004', '1000', 0, 0, 0, '透气膜高混机航吊', 1, 50, 0, 'root', '2017-09-29 16:02:15', '超级管理员', '2018-06-04 09:06:15', '2018-06-04 09:06:16', '9d04b252-73bc-47a6-999e-27a3725855c4', 1);
INSERT INTO `equipment_meter_config` VALUES (81, '900000000035', 5, '1004', '1000', 0, 0, 0, '楼顶环保除尘总开关', 1, 50, 0, 'root', '2017-09-29 16:02:15', '超级管理员', '2018-06-04 09:06:23', '2018-06-04 09:06:23', '9d04b252-73bc-47a6-999e-27a3725855c4', 1);
INSERT INTO `equipment_meter_config` VALUES (82, '900000000035', 6, '1004', '1000', 0, 0, 0, 'NL10、11号线', 1, 160, 0, 'root', '2017-09-29 16:02:15', '超级管理员', '2018-06-04 09:06:30', '2018-06-04 09:06:31', '9d04b252-73bc-47a6-999e-27a3725855c4', 1);
INSERT INTO `equipment_meter_config` VALUES (83, '900000000035', 7, '1004', '1000', 0, 0, 0, 'NL8号线', 1, 80, 0, 'root', '2017-09-29 16:02:15', '超级管理员', '2018-06-04 09:06:39', '2018-06-04 09:06:40', '9d04b252-73bc-47a6-999e-27a3725855c4', 1);
INSERT INTO `equipment_meter_config` VALUES (84, '900000000035', 8, '1004', '1000', 0, 0, 0, '新厂房照明与电梯', 1, 50, 0, 'root', '2017-09-29 16:02:15', '超级管理员', '2018-06-04 09:06:46', '2018-06-04 09:06:47', '9d04b252-73bc-47a6-999e-27a3725855c4', 1);
INSERT INTO `equipment_meter_config` VALUES (85, '900000000035', 9, '1004', '1000', 0, 0, 0, 'NL5号线', 1, 400, 0, 'root', '2017-09-29 16:02:15', '超级管理员', '2018-06-04 09:06:54', '2018-06-04 09:06:55', '9d04b252-73bc-47a6-999e-27a3725855c4', 1);
INSERT INTO `equipment_meter_config` VALUES (86, '900000000035', 10, '1004', '1000', 0, 0, 0, '高压总进线', 100, 80, 0, 'root', '2017-09-29 16:02:15', '超级管理员', '2018-06-04 09:07:02', '2018-06-04 09:07:02', '9d04b252-73bc-47a6-999e-27a3725855c4', 1);
INSERT INTO `equipment_meter_config` VALUES (87, '900000000035', 11, '1004', '1000', 0, 0, 0, '3期高压柜', 100, 40, 0, 'root', '2017-09-29 16:02:15', '超级管理员', '2018-06-04 14:52:41', '2018-06-04 14:52:42', '9d04b252-73bc-47a6-999e-27a3725855c4', 1);
INSERT INTO `equipment_meter_config` VALUES (88, '900000000036', 1, '1004', '1000', 0, 0, 0, '1期总开关', 1, 400, 0, 'root', '2017-09-29 16:02:15', '超级管理员', '2018-06-04 09:07:28', '2018-06-04 09:07:28', '9d04b252-73bc-47a6-999e-27a3725855c4', 1);
INSERT INTO `equipment_meter_config` VALUES (89, '900000000036', 2, '1004', '1000', 0, 0, 0, '三先车间', 1, 120, 0, 'root', '2017-09-29 16:02:15', '超级管理员', '2018-06-04 09:07:37', '2018-06-04 09:07:37', '9d04b252-73bc-47a6-999e-27a3725855c4', 1);
INSERT INTO `equipment_meter_config` VALUES (90, '900000000036', 3, '1004', '1000', 0, 0, 0, '研发楼动力', 1, 80, 0, 'root', '2017-09-29 16:02:15', '超级管理员', '2018-06-04 09:07:46', '2018-06-04 09:07:47', '9d04b252-73bc-47a6-999e-27a3725855c4', 1);
INSERT INTO `equipment_meter_config` VALUES (91, '900000000036', 4, '1004', '1000', 0, 0, 0, '旧厂房风机', 1, 80, 0, 'root', '2017-09-29 16:02:15', '超级管理员', '2018-06-04 09:07:55', '2018-06-04 09:07:56', '9d04b252-73bc-47a6-999e-27a3725855c4', 1);
INSERT INTO `equipment_meter_config` VALUES (92, '900000000036', 5, '1004', '1000', 0, 0, 0, '2号生产线', 1, 80, 0, 'root', '2017-09-29 16:02:15', '超级管理员', '2018-06-04 09:08:02', '2018-06-04 09:08:02', '9d04b252-73bc-47a6-999e-27a3725855c4', 1);
INSERT INTO `equipment_meter_config` VALUES (93, '900000000036', 6, '1004', '1000', 0, 0, 0, '食品车间', 1, 120, 0, 'root', '2017-09-29 16:02:15', '超级管理员', '2018-06-04 09:08:10', '2018-06-04 09:08:11', '9d04b252-73bc-47a6-999e-27a3725855c4', 1);
INSERT INTO `equipment_meter_config` VALUES (94, '900000000036', 7, '1004', '1000', 0, 0, 0, '研发楼空调', 1, 50, 0, 'root', '2017-09-29 16:02:15', '超级管理员', '2018-06-04 09:08:18', '2018-06-04 09:08:18', '9d04b252-73bc-47a6-999e-27a3725855c4', 1);
INSERT INTO `equipment_meter_config` VALUES (95, '900000000036', 8, '1004', '1000', 0, 0, 0, '实验机', 1, 50, 0, 'root', '2017-09-29 16:02:15', '超级管理员', '2018-06-04 09:08:26', '2018-06-04 09:08:27', '9d04b252-73bc-47a6-999e-27a3725855c4', 1);
INSERT INTO `equipment_meter_config` VALUES (96, '900000000036', 9, '1004', '1000', 0, 0, 0, '1号、10号生产线', 1, 120, 0, 'root', '2017-09-29 16:02:15', '超级管理员', '2018-06-04 09:08:34', '2018-06-04 09:08:35', '9d04b252-73bc-47a6-999e-27a3725855c4', 1);
INSERT INTO `equipment_meter_config` VALUES (97, '900000000036', 10, '1004', '1000', 0, 0, 0, '2期总开关', 1, 400, 0, 'root', '2017-09-29 16:02:15', '超级管理员', '2018-06-04 09:08:43', '2018-06-04 09:08:44', '9d04b252-73bc-47a6-999e-27a3725855c4', 1);
INSERT INTO `equipment_meter_config` VALUES (98, '900000000036', 11, '1004', '1000', 0, 0, 0, '4号、9号生产线', 1, 120, 0, 'root', '2017-09-29 16:02:15', '超级管理员', '2018-06-04 09:08:52', '2018-06-04 09:08:53', '9d04b252-73bc-47a6-999e-27a3725855c4', 1);
INSERT INTO `equipment_meter_config` VALUES (99, '900000000036', 12, '1004', '1000', 0, 0, 0, '6号、8号生产线', 1, 120, 0, 'root', '2017-09-29 16:02:15', '超级管理员', '2018-06-04 09:09:00', '2018-06-04 09:09:00', '9d04b252-73bc-47a6-999e-27a3725855c4', 1);
INSERT INTO `equipment_meter_config` VALUES (100, '900000000036', 13, '1004', '1000', 0, 0, 0, '3号生产线', 1, 160, 0, 'root', '2017-09-29 16:02:15', '超级管理员', '2018-06-04 09:09:07', '2018-06-04 09:09:08', '9d04b252-73bc-47a6-999e-27a3725855c4', 1);
INSERT INTO `equipment_meter_config` VALUES (101, '900000000036', 14, '1004', '1000', 0, 0, 0, '1期高压总电表', 100, 30, 0, 'root', '2017-09-29 16:02:15', '超级管理员', '2018-06-04 09:09:16', '2018-06-04 09:09:16', '9d04b252-73bc-47a6-999e-27a3725855c4', 1);
INSERT INTO `equipment_meter_config` VALUES (102, '900000000036', 15, '1004', '1000', 0, 0, 0, '1期变压器高压表', 100, 15, 0, 'root', '2017-09-29 16:02:15', '超级管理员', '2018-06-04 14:54:46', '2018-06-04 14:54:47', '9d04b252-73bc-47a6-999e-27a3725855c4', 1);
INSERT INTO `equipment_meter_config` VALUES (103, '900000000036', 16, '1004', '1000', 0, 0, 0, '2期变压器高压表', 100, 15, 0, 'root', '2017-09-29 16:02:15', '超级管理员', '2018-06-04 14:54:59', '2018-06-04 14:55:00', '9d04b252-73bc-47a6-999e-27a3725855c4', 1);
INSERT INTO `equipment_meter_config` VALUES (104, '900000000009', 1, '1004', '1000', 0, 0, 0, '6AA1进线', 1, 400, 0, 'root', '2017-10-13 11:45:42', '超级管理员', '2018-06-04 08:46:29', '2018-06-04 08:46:30', '3cefa0df-7b12-4c61-b330-b16f9260c25e', 1);
INSERT INTO `equipment_meter_config` VALUES (105, '900000000009', 2, '1004', '1000', 0, 0, 0, '5AA2进线', 1, 400, 0, 'root', '2017-10-13 11:46:24', '超级管理员', '2018-06-04 08:46:36', '2018-06-04 08:46:37', '3cefa0df-7b12-4c61-b330-b16f9260c25e', 1);
INSERT INTO `equipment_meter_config` VALUES (109, '900000000013', 51, '1004', '1000', 0, 0, 0, '1D1低压进线', 1, 500, 0, '超级管理员', '2017-10-17 14:25:49', '超级管理员', '2018-06-04 08:50:50', '2018-06-04 08:50:51', '8df5424c-4d89-42e7-b0e5-36b3a2b91b3b', 1);
INSERT INTO `equipment_meter_config` VALUES (110, '900000000013', 52, '1004', '1000', 0, 0, 0, '2D1低压进线', 1, 500, 0, '超级管理员', '2017-10-17 14:32:44', '超级管理员', '2018-06-04 08:50:59', '2018-06-04 08:50:59', '8df5424c-4d89-42e7-b0e5-36b3a2b91b3b', 1);
INSERT INTO `equipment_meter_config` VALUES (111, '900000000013', 11, '1006', '1000', 0, 0, 0, 'M栋办公用电1', 1, 120, 0, '超级管理员', '2017-10-17 14:33:07', '超级管理员', '2018-06-04 08:51:11', '2018-06-04 08:51:12', '8df5424c-4d89-42e7-b0e5-36b3a2b91b3b', 1);
INSERT INTO `equipment_meter_config` VALUES (112, '900000000013', 12, '1006', '1000', 0, 0, 0, 'K栋办公用电1', 1, 80, 0, '超级管理员', '2017-10-17 14:33:43', '超级管理员', '2018-06-04 08:51:20', '2018-06-04 08:51:21', '8df5424c-4d89-42e7-b0e5-36b3a2b91b3b', 1);
INSERT INTO `equipment_meter_config` VALUES (113, '900000000013', 13, '1006', '1000', 0, 0, 0, '尖岛公共用电', 1, 50, 0, '超级管理员', '2017-10-17 14:35:35', '超级管理员', '2018-06-04 08:52:02', '2018-06-04 08:52:03', '8df5424c-4d89-42e7-b0e5-36b3a2b91b3b', 1);
INSERT INTO `equipment_meter_config` VALUES (114, '900000000013', 14, '1006', '1000', 0, 0, 0, '1D4备用4', 1, 80, 0, '超级管理员', '2017-10-17 14:35:57', '超级管理员', '2018-06-04 08:52:18', '2018-06-04 08:52:19', '8df5424c-4d89-42e7-b0e5-36b3a2b91b3b', 1);
INSERT INTO `equipment_meter_config` VALUES (115, '900000000013', 15, '1006', '1000', 0, 0, 0, '1D4备用5', 1, 80, 0, '超级管理员', '2017-10-17 14:36:12', '超级管理员', '2018-06-04 08:52:27', '2018-06-04 08:52:28', '8df5424c-4d89-42e7-b0e5-36b3a2b91b3b', 1);
INSERT INTO `equipment_meter_config` VALUES (116, '900000000013', 16, '1006', '1000', 0, 0, 0, '备用1', 1, 50, 0, '超级管理员', '2017-10-17 14:36:55', '超级管理员', '2018-06-04 08:52:37', '2018-06-04 08:52:37', '8df5424c-4d89-42e7-b0e5-36b3a2b91b3b', 1);
INSERT INTO `equipment_meter_config` VALUES (118, '900000000013', 17, '1006', '1000', 0, 0, 0, 'M栋办公用电2', 1, 120, 0, '超级管理员', '2017-10-17 14:38:42', '超级管理员', '2018-06-04 08:52:48', '2018-06-04 08:52:49', '8df5424c-4d89-42e7-b0e5-36b3a2b91b3b', 1);
INSERT INTO `equipment_meter_config` VALUES (119, '900000000013', 18, '1006', '1000', 0, 0, 0, 'K栋办公用电2', 1, 80, 0, '超级管理员', '2017-10-17 14:49:29', '超级管理员', '2018-06-04 08:52:58', '2018-06-04 08:52:59', '8df5424c-4d89-42e7-b0e5-36b3a2b91b3b', 1);
INSERT INTO `equipment_meter_config` VALUES (120, '900000000013', 19, '1006', '1000', 0, 0, 0, '备用4', 1, 80, 0, '超级管理员', '2017-10-17 14:49:55', '超级管理员', '2018-06-04 08:53:05', '2018-06-04 08:53:06', '8df5424c-4d89-42e7-b0e5-36b3a2b91b3b', 1);
INSERT INTO `equipment_meter_config` VALUES (121, '900000000013', 20, '1006', '1000', 0, 0, 0, '备用5', 1, 80, 0, '超级管理员', '2017-10-17 14:50:16', '超级管理员', '2018-06-04 08:53:14', '2018-06-04 08:53:14', '8df5424c-4d89-42e7-b0e5-36b3a2b91b3b', 1);
INSERT INTO `equipment_meter_config` VALUES (122, '900000000013', 6, '1006', '1000', 0, 0, 0, '水泵房用电', 1, 80, 0, '超级管理员', '2017-10-17 14:50:50', '超级管理员', '2018-06-04 08:50:10', '2018-06-04 08:50:11', '8df5424c-4d89-42e7-b0e5-36b3a2b91b3b', 1);
INSERT INTO `equipment_meter_config` VALUES (123, '900000000013', 7, '1006', '1000', 0, 0, 0, 'L栋办公用电1', 1, 80, 0, '超级管理员', '2017-10-17 14:51:13', '超级管理员', '2018-06-04 08:50:00', '2018-06-04 08:50:01', '8df5424c-4d89-42e7-b0e5-36b3a2b91b3b', 1);
INSERT INTO `equipment_meter_config` VALUES (124, '900000000013', 8, '1006', '1000', 0, 0, 0, 'L栋办公用电2', 1, 80, 0, '超级管理员', '2017-10-17 14:51:26', '超级管理员', '2018-06-04 08:49:46', '2018-06-04 08:49:47', '8df5424c-4d89-42e7-b0e5-36b3a2b91b3b', 1);
INSERT INTO `equipment_meter_config` VALUES (125, '900000000013', 9, '1006', '1000', 0, 0, 0, '2D4备用4', 1, 80, 0, '超级管理员', '2017-10-17 14:51:46', '超级管理员', '2018-06-04 08:49:33', '2018-06-04 08:49:34', '8df5424c-4d89-42e7-b0e5-36b3a2b91b3b', 1);
INSERT INTO `equipment_meter_config` VALUES (126, '900000000013', 10, '1006', '1000', 0, 0, 0, '2D4备用5', 1, 80, 0, '超级管理员', '2017-10-17 14:52:00', '超级管理员', '2018-06-04 08:49:23', '2018-06-04 08:49:24', '8df5424c-4d89-42e7-b0e5-36b3a2b91b3b', 1);
INSERT INTO `equipment_meter_config` VALUES (127, '900000000013', 1, '1006', '1000', 0, 0, 0, '丰国4S店用电', 1, 120, 0, '超级管理员', '2017-10-17 14:52:28', '超级管理员', '2018-06-04 08:48:21', '2018-06-04 08:48:22', '8df5424c-4d89-42e7-b0e5-36b3a2b91b3b', 1);
INSERT INTO `equipment_meter_config` VALUES (128, '900000000013', 2, '1006', '1000', 0, 0, 0, '2D5备用2', 1, 120, 0, '超级管理员', '2017-10-17 14:52:41', '超级管理员', '2018-06-04 08:48:36', '2018-06-04 08:48:37', '8df5424c-4d89-42e7-b0e5-36b3a2b91b3b', 1);
INSERT INTO `equipment_meter_config` VALUES (129, '900000000013', 3, '1006', '1000', 0, 0, 0, '综合楼中央空调用电', 1, 80, 0, '超级管理员', '2017-10-17 14:52:57', '超级管理员', '2018-06-04 08:48:48', '2018-06-04 08:48:49', '8df5424c-4d89-42e7-b0e5-36b3a2b91b3b', 1);
INSERT INTO `equipment_meter_config` VALUES (130, '900000000013', 4, '1006', '1000', 0, 0, 0, '2D5备用4', 1, 80, 0, '超级管理员', '2017-10-17 14:53:31', '超级管理员', '2018-06-04 08:49:03', '2018-06-04 08:49:04', '8df5424c-4d89-42e7-b0e5-36b3a2b91b3b', 1);
INSERT INTO `equipment_meter_config` VALUES (131, '900000000013', 5, '1006', '1000', 0, 0, 0, '2D5备用5', 1, 50, 0, '超级管理员', '2017-10-17 14:54:07', '超级管理员', '2018-06-04 08:49:13', '2018-06-04 08:49:14', '8df5424c-4d89-42e7-b0e5-36b3a2b91b3b', 1);
INSERT INTO `equipment_meter_config` VALUES (137, '900000000010', 1, '1004', '1000', 0, 0, 0, '派出所进线', 1, 80, 1, '超级管理员', '2017-10-18 17:55:57', '超级管理员', '2018-06-04 08:46:56', '2018-06-04 08:46:56', '3cefa0df-7b12-4c61-b330-b16f9260c25e', 1);
INSERT INTO `equipment_meter_config` VALUES (141, '900000000005', 1, '1004', '1000', 0, 0, 0, '4号综合房#6进线', 1, 600, 0, 'root', '2017-11-05 20:34:08', '超级管理员', '2018-06-04 08:45:06', '2018-06-04 08:45:07', 'd13eb8ad-e3a4-428e-989f-1a377dcbb96c', 1);
INSERT INTO `equipment_meter_config` VALUES (142, '900000000005', 2, '1004', '1000', 0, 0, 0, '4号电房#7低压进线', 1, 600, 0, 'root', '2017-11-05 20:34:59', '超级管理员', '2018-06-04 08:44:54', '2018-06-04 08:44:55', 'd13eb8ad-e3a4-428e-989f-1a377dcbb96c', 1);
INSERT INTO `equipment_meter_config` VALUES (143, '900000000034', 1, '1004', '1000', 0, 0, 0, '2号电房B2低压进线', 1, 1000, 0, 'root', '2017-11-05 20:36:01', '超级管理员', '2018-06-04 09:05:08', '2018-06-04 09:05:09', 'd13eb8ad-e3a4-428e-989f-1a377dcbb96c', 1);
INSERT INTO `equipment_meter_config` VALUES (144, '900000000034', 2, '1004', '1000', 0, 0, 0, '2号电房B1低压进线', 1, 1000, 0, 'root', '2017-11-05 20:36:27', '超级管理员', '2018-06-04 09:05:23', '2018-06-04 09:05:23', 'd13eb8ad-e3a4-428e-989f-1a377dcbb96c', 1);
INSERT INTO `equipment_meter_config` VALUES (145, '900000000022', 1, '1004', '1000', 0, 0, 0, '3号电房B1低压进线', 1, 240, 0, 'root', '2017-11-05 20:37:29', '超级管理员', '2018-06-04 08:59:05', '2018-06-04 08:59:06', 'd13eb8ad-e3a4-428e-989f-1a377dcbb96c', 1);
INSERT INTO `equipment_meter_config` VALUES (163, '900000000038', 1, '1004', '1000', 0, 0, 0, '1#变压器进线', 1, 1, 0, '超级管理员', '2018-04-19 10:16:09', '超级管理员', '2018-06-04 14:55:33', '2018-06-04 14:55:34', '93871b50-5f7e-42d5-b044-3bdd91bace4a', 1);
INSERT INTO `equipment_meter_config` VALUES (164, '900000000039', 1, '1004', '1000', 0, 0, 0, '2#配变进线', 1, 1, 0, '超级管理员', '2018-04-19 10:17:00', '超级管理员', '2018-06-04 14:55:45', '2018-06-04 14:55:46', '93871b50-5f7e-42d5-b044-3bdd91bace4a', 1);
INSERT INTO `equipment_meter_config` VALUES (169, '900000000040', 1, '1007', '1002', 0, 0, 0, 'T8变进线', 1, 1, 0, '超级管理员', '2018-05-11 14:03:48', '超级管理员', '2018-06-04 09:10:30', '2018-06-04 09:10:31', 'ebe2d572-9b98-47c2-9d6a-5fdbde7b768f', 0);
INSERT INTO `equipment_meter_config` VALUES (170, '900000000040', 2, '1007', '1002', 0, 0, 0, 'T6变进线', 1, 1, 0, '超级管理员', '2018-05-11 14:03:48', '超级管理员', '2018-06-04 09:10:36', '2018-06-04 09:10:37', 'ebe2d572-9b98-47c2-9d6a-5fdbde7b768f', 0);
INSERT INTO `equipment_meter_config` VALUES (171, '900000000040', 3, '1007', '1002', 0, 0, 0, 'T7变进线', 1, 1, 0, '超级管理员', '2018-05-11 14:03:48', '超级管理员', '2018-06-04 09:10:43', '2018-06-04 09:10:43', 'ebe2d572-9b98-47c2-9d6a-5fdbde7b768f', 0);
INSERT INTO `equipment_meter_config` VALUES (172, '900000000040', 4, '1007', '1002', 0, 0, 0, 'T9变进线', 1, 1, 0, '超级管理员', '2018-05-11 14:03:48', '超级管理员', '2018-06-04 09:10:49', '2018-06-04 09:10:50', 'ebe2d572-9b98-47c2-9d6a-5fdbde7b768f', 0);
INSERT INTO `equipment_meter_config` VALUES (173, '900000000040', 5, '1007', '1002', 0, 0, 0, 'T10变进线', 1, 1, 0, '超级管理员', '2018-05-11 14:03:48', '超级管理员', '2018-06-04 09:10:55', '2018-06-04 09:10:55', 'ebe2d572-9b98-47c2-9d6a-5fdbde7b768f', 0);
INSERT INTO `equipment_meter_config` VALUES (174, '900000000041', 1, '1009', '1002', 0, 0, 0, '#1变进线', 1, 1, 0, '超级管理员', '2018-05-17 14:59:57', '超级管理员', '2018-06-04 09:11:17', '2018-06-04 09:11:18', '14df1636-05f5-4bf2-88d8-92d649a3c957', 0);
INSERT INTO `equipment_meter_config` VALUES (175, '900000000042', 1, '1004', '1002', 0, 0, 1, '2-1T变进线', 1, 1, 0, '超级管理员', '2018-05-21 15:05:46', '超级管理员', '2018-06-04 09:11:50', '2018-06-04 09:11:51', 'c6e8703f-04f9-4750-8fd6-b007eef5861b', 0);
INSERT INTO `equipment_meter_config` VALUES (176, '900000000042', 2, '1004', '1002', 0, 0, 2, '2-2T变进线', 1, 1, 0, '超级管理员', '2018-05-21 15:06:37', '超级管理员', '2018-06-04 09:11:57', '2018-06-04 09:11:57', 'c6e8703f-04f9-4750-8fd6-b007eef5861b', 0);
INSERT INTO `equipment_meter_config` VALUES (177, '900000000042', 3, '1004', '1002', 0, 0, 3, '1-1T变进线', 1, 1, 0, '超级管理员', '2018-05-21 15:07:58', '超级管理员', '2018-06-04 09:12:04', '2018-06-04 09:12:05', 'c6e8703f-04f9-4750-8fd6-b007eef5861b', 0);
INSERT INTO `equipment_meter_config` VALUES (178, '900000000042', 4, '1004', '1002', 0, 0, 4, '1-2T变进线', 1, 1, 1, '超级管理员', '2018-05-21 15:08:43', '超级管理员', '2018-06-04 09:12:11', '2018-06-04 09:12:12', 'c6e8703f-04f9-4750-8fd6-b007eef5861b', 0);
INSERT INTO `equipment_meter_config` VALUES (179, '900000000042', 5, '1004', '1002', 0, 0, 5, '1-3T变进线', 1, 1, 1, '超级管理员', '2018-05-21 15:09:54', '超级管理员', '2018-06-04 09:12:19', '2018-06-04 09:12:19', 'c6e8703f-04f9-4750-8fd6-b007eef5861b', 0);
INSERT INTO `equipment_meter_config` VALUES (180, '900000000042', 6, '1004', '1002', 0, 0, 6, '1-4T变进线', 1, 1, 0, '超级管理员', '2018-05-21 15:10:45', '超级管理员', '2018-06-04 09:12:26', '2018-06-04 09:12:27', 'c6e8703f-04f9-4750-8fd6-b007eef5861b', 0);
INSERT INTO `equipment_meter_config` VALUES (181, '900000000042', 7, '1004', '1002', 0, 0, 7, '1-5T变进线', 1, 1, 1, '超级管理员', '2018-05-21 15:11:11', '超级管理员', '2018-06-04 09:12:34', '2018-06-04 09:12:35', 'c6e8703f-04f9-4750-8fd6-b007eef5861b', 0);
INSERT INTO `equipment_meter_config` VALUES (182, '900000000042', 8, '1004', '1002', 0, 0, 8, '1-6T变进线', 1, 1, 0, '超级管理员', '2018-05-21 15:12:11', '超级管理员', '2018-06-04 09:12:42', '2018-06-04 09:12:42', 'c6e8703f-04f9-4750-8fd6-b007eef5861b', 0);
INSERT INTO `equipment_meter_config` VALUES (183, '900000000042', 9, '1004', '1002', 0, 0, 9, '1-7T变进线', 1, 1, 0, '超级管理员', '2018-05-21 15:12:56', '超级管理员', '2018-06-04 09:12:49', '2018-06-04 09:12:50', 'c6e8703f-04f9-4750-8fd6-b007eef5861b', 0);
INSERT INTO `equipment_meter_config` VALUES (184, '900000000042', 10, '1004', '1002', 0, 0, 10, '1-8T变进线', 1, 1, 1, '超级管理员', '2018-05-21 15:13:33', '超级管理员', '2018-06-04 09:12:58', '2018-06-04 09:12:59', 'c6e8703f-04f9-4750-8fd6-b007eef5861b', 0);
INSERT INTO `equipment_meter_config` VALUES (185, '900000000037', 1, '1004', '1000', 0, 0, 0, 'K1变进线', 1, 1, 0, '超级管理员', '2018-05-23 14:07:36', '超级管理员', '2018-06-04 09:09:41', '2018-06-04 09:09:42', '12669913-e5a2-4ee4-92fc-09d171562f70', 0);
INSERT INTO `equipment_meter_config` VALUES (186, '900000000037', 2, '1004', '1000', 0, 0, 0, 'K3变进线', 1, 1, 0, '超级管理员', '2018-05-23 14:07:53', '超级管理员', '2018-06-04 09:09:49', '2018-06-04 09:09:49', '12669913-e5a2-4ee4-92fc-09d171562f70', 0);
INSERT INTO `equipment_meter_config` VALUES (187, '900000000019', 58, '1000', '1000', 0, 0, 0, 'E2/1号低压进线', 1, 600, 0, '超级管理员', '2018-05-25 12:16:33', '超级管理员', '2018-06-04 14:56:33', '2018-06-04 14:56:33', NULL, 0);
INSERT INTO `equipment_meter_config` VALUES (188, '900000000019', 66, '1000', '1000', 0, 0, 0, 'E2/3低压进线', 1, 800, 0, '超级管理员', '2018-05-25 12:29:52', '超级管理员', '2018-06-04 14:56:46', '2018-06-04 14:56:47', NULL, 0);
INSERT INTO `equipment_meter_config` VALUES (189, '900000000019', 35, '1000', '1000', 0, 0, 0, 'E2/6低压进线', 1, 800, 0, '超级管理员', '2018-05-25 12:31:22', '超级管理员', '2018-06-04 14:57:01', '2018-06-04 14:57:01', NULL, 0);
INSERT INTO `equipment_meter_config` VALUES (190, '900000000015', 98, '1000', '1000', 0, 0, 0, '1W/5号低压进线', 1, 800, 0, '超级管理员', '2018-05-25 13:00:10', '超级管理员', '2018-06-04 14:58:23', '2018-06-04 14:58:24', NULL, 0);
INSERT INTO `equipment_meter_config` VALUES (191, '900000000015', 26, '1000', '1000', 0, 0, 0, '1W/1号低压进线', 1, 800, 0, '超级管理员', '2018-05-25 13:01:03', '超级管理员', '2018-06-04 14:57:51', '2018-06-04 14:57:52', NULL, 0);
INSERT INTO `equipment_meter_config` VALUES (192, '900000000015', 28, '1000', '1000', 0, 0, 0, '2W/1号低压进线', 1, 600, 0, '超级管理员', '2018-05-25 13:01:30', '超级管理员', '2018-06-04 14:58:08', '2018-06-04 14:58:08', NULL, 0);
INSERT INTO `equipment_meter_config` VALUES (193, '900000000015', 76, '1000', '1000', 0, 0, 0, '1W/7号低压进线', 1, 800, 0, '超级管理员', '2018-05-25 13:02:00', '超级管理员', '2018-06-04 14:58:33', '2018-06-04 14:58:34', NULL, 0);
INSERT INTO `equipment_meter_config` VALUES (194, '900000000043', 1, '1004', '1000', 0, 0, 0, '#1变进线', 1, 1, 0, '超级管理员', '2018-05-27 08:05:02', '超级管理员', '2018-06-04 09:13:21', '2018-06-04 09:13:22', 'b5a684f0-39ff-454b-bd07-0469a4f3053b', 0);
INSERT INTO `equipment_meter_config` VALUES (195, '900000000044', 1, '1004', '1000', 0, 0, 0, '#2变进线', 1, 1, 0, '超级管理员', '2018-05-27 08:06:05', '超级管理员', '2018-06-04 09:13:39', '2018-06-04 09:13:40', 'b5a684f0-39ff-454b-bd07-0469a4f3053b', 0);
INSERT INTO `equipment_meter_config` VALUES (196, '900000000045', 1, '1004', '1000', 0, 0, 0, '#3变进线', 1, 1, 0, '超级管理员', '2018-05-27 08:06:24', '超级管理员', '2018-06-04 09:13:54', '2018-06-04 09:13:55', 'b5a684f0-39ff-454b-bd07-0469a4f3053b', 0);
INSERT INTO `equipment_meter_config` VALUES (197, '900000000041', 2, '1009', '1002', 0, 0, 0, '#2变进线', 1, 1, 0, '超级管理员', '2018-05-28 10:26:43', '超级管理员', '2018-06-04 09:11:22', '2018-06-04 09:11:23', '14df1636-05f5-4bf2-88d8-92d649a3c957', 0);
INSERT INTO `equipment_meter_config` VALUES (198, '900000000041', 3, '1009', '1002', 0, 0, 0, '#3变进线', 1, 1, 0, '超级管理员', '2018-05-28 10:27:06', '超级管理员', '2018-06-04 09:11:27', '2018-06-04 09:11:28', '14df1636-05f5-4bf2-88d8-92d649a3c957', 0);
INSERT INTO `equipment_meter_config` VALUES (199, '900000000003', 1, '1007', '1000', 0, 0, 0, NULL, 1, 1, 1, '超级管理员', '2018-05-30 11:40:19', '超级管理员', '2018-05-30 22:45:58', '2018-05-30 22:45:58', NULL, 0);
INSERT INTO `equipment_meter_config` VALUES (200, '900000000046', 1, '1004', '1000', 0, 0, 0, '#1变进线', 1, 1, 1, '超级管理员', '2018-07-04 12:55:44', '超级管理员', '2018-07-04 12:55:44', '2018-07-04 12:55:43', NULL, 0);
INSERT INTO `equipment_meter_config` VALUES (201, '900000000046', 2, '1004', '1000', 0, 0, 0, '#2变进线', 1, 1, 1, '超级管理员', '2018-07-04 12:56:20', '超级管理员', '2018-07-04 12:56:20', '2018-07-04 12:56:20', NULL, 0);
INSERT INTO `equipment_meter_config` VALUES (202, '900000000047', 1, '1004', '1000', 0, 0, 0, '#3变进线', 1, 1, 1, '超级管理员', '2018-07-04 12:57:07', '超级管理员', '2018-07-04 12:57:07', '2018-07-04 12:57:06', NULL, 0);
INSERT INTO `equipment_meter_config` VALUES (203, '900000000047', 2, '1004', '1000', 0, 0, 0, '#4变进线', 1, 1, 1, '超级管理员', '2018-07-04 12:57:39', '超级管理员', '2018-07-04 12:57:39', '2018-07-04 12:57:38', NULL, 0);
INSERT INTO `equipment_meter_config` VALUES (204, '900000000048', 1, '1004', '1000', 0, 0, 0, '#5变进线', 1, 1, 1, '超级管理员', '2018-07-04 12:58:21', '超级管理员', '2018-07-04 12:58:21', '2018-07-04 12:58:20', NULL, 0);
INSERT INTO `equipment_meter_config` VALUES (206, '900000000048', 2, '1004', '1000', 0, 0, 0, '#6变进线', 1, 1, 1, '超级管理员', '2018-07-04 12:58:56', '超级管理员', '2018-07-04 12:58:56', '2018-07-04 12:58:55', NULL, 0);

-- ----------------------------
-- Table structure for equipment_meter_config_field
-- ----------------------------
DROP TABLE IF EXISTS `equipment_meter_config_field`;
CREATE TABLE `equipment_meter_config_field`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `dtu_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'dtu编号',
  `meter_address` int(11) NOT NULL COMMENT '表地址',
  `meter_type_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电表类型编号',
  `gateway_no` int(11) NOT NULL COMMENT '网关编号',
  `ds_addr` int(11) NULL DEFAULT NULL COMMENT '网关传输地址',
  `field_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段',
  `tag` int(11) NULL DEFAULT 0 COMMENT '状态:0.正常1.删除',
  `createuser` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `createdate` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `changeuser` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `changedate` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `rowver` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '时间戳',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_gateway_field_addr`(`dtu_no`, `meter_address`, `gateway_no`, `ds_addr`, `field_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 585 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of equipment_meter_config_field
-- ----------------------------
INSERT INTO `equipment_meter_config_field` VALUES (43, '900000000001', 1, '1004', 1002, 1, 'a_active_power', 0, 'root', '2018-01-30 16:00:14', 'root', '2018-01-30 16:00:14', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (44, '900000000001', 1, '1004', 1002, 2, 'b_active_power', 0, 'root', '2018-01-30 16:02:28', 'root', '2018-01-30 16:02:28', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (45, '900000000001', 1, '1004', 1002, 3, 'c_active_power', 0, 'root', '2018-01-30 16:03:31', 'root', '2018-01-30 16:03:31', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (46, '900000000001', 1, '1004', 1002, 4, 'total_active_power', 0, 'root', '2018-01-30 16:03:31', 'root', '2018-01-30 16:03:31', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (47, '900000000001', 1, '1004', 1002, 5, 'a_reactive_power', 0, 'root', '2018-01-30 16:03:31', 'root', '2018-01-30 16:03:31', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (48, '900000000001', 1, '1004', 1002, 1, 'b_reactive_power', 0, 'root', '2018-01-30 16:04:49', 'root', '2018-01-30 16:04:49', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (49, '900000000001', 1, '1004', 1002, 7, 'c_reactive_power', 0, 'root', '2018-01-30 16:04:49', 'root', '2018-01-30 16:04:49', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (50, '900000000001', 1, '1004', 1002, 8, 'total_reactive_power', 0, 'root', '2018-01-30 16:04:49', 'root', '2018-01-30 16:04:49', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (51, '900000000001', 1, '1004', 1002, 9, 'a_ap_power', 0, 'root', '2018-01-30 16:07:00', 'root', '2018-01-30 16:07:00', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (52, '900000000001', 1, '1004', 1002, 10, 'b_ap_power', 0, 'root', '2018-01-30 16:07:00', 'root', '2018-01-30 16:07:00', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (53, '900000000001', 1, '1004', 1002, 11, 'c_ap_power', 0, 'root', '2018-01-30 16:07:00', 'root', '2018-01-30 16:07:00', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (54, '900000000001', 1, '1004', 1002, 12, 'total_ap_power', 0, 'root', '2018-01-30 16:07:33', 'root', '2018-01-30 16:07:33', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (55, '900000000001', 1, '1004', 1002, 13, 'a_voltage', 0, 'root', '2018-01-30 16:07:33', 'root', '2018-01-30 16:07:33', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (56, '900000000001', 1, '1004', 1002, 14, 'b_voltage', 0, 'root', '2018-01-30 16:07:33', 'root', '2018-01-30 16:07:33', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (57, '900000000001', 1, '1004', 1002, 15, 'c_voltage', 0, 'root', '2018-01-30 16:07:52', 'root', '2018-01-30 16:07:52', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (58, '900000000001', 1, '1004', 1002, 16, 'a_electricity', 0, 'root', '2018-01-30 16:07:52', 'root', '2018-01-30 16:07:52', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (59, '900000000001', 1, '1004', 1002, 17, 'b_electricity', 0, 'root', '2018-01-30 16:07:52', 'root', '2018-01-30 16:07:52', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (60, '900000000001', 1, '1004', 1002, 18, 'c_electricity', 0, 'root', '2018-01-30 16:08:14', 'root', '2018-01-30 16:08:14', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (61, '900000000001', 1, '1004', 1002, 19, 'a_power_factor', 0, 'root', '2018-01-30 16:08:14', 'root', '2018-01-30 16:08:14', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (62, '900000000001', 1, '1004', 1002, 20, 'b_power_factor', 0, 'root', '2018-01-30 16:08:14', 'root', '2018-01-30 16:08:14', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (63, '900000000001', 1, '1004', 1002, 21, 'c_power_factor', 0, 'root', '2018-01-30 16:08:53', 'root', '2018-01-30 16:08:53', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (64, '900000000001', 1, '1004', 1002, 22, 'total_power_factor', 0, 'root', '2018-01-30 16:08:53', 'root', '2018-01-30 16:08:53', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (65, '900000000001', 1, '1004', 1002, 23, 'frequency', 0, 'root', '2018-01-30 16:08:53', 'root', '2018-01-30 16:08:53', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (66, '900000000001', 1, '1004', 1002, 24, 'total_p_at_ee', 0, 'root', '2018-01-30 16:09:36', 'root', '2018-01-30 16:09:36', '2018-02-01 16:31:02');
INSERT INTO `equipment_meter_config_field` VALUES (67, '900000000001', 1, '1004', 1002, 25, 'total_r_at_ee', 0, 'root', '2018-01-30 16:09:36', 'root', '2018-01-30 16:09:36', '2018-02-01 16:31:05');
INSERT INTO `equipment_meter_config_field` VALUES (68, '900000000001', 1, '1004', 1002, 26, 'total_p_reat_ee', 0, 'root', '2018-01-30 16:10:03', 'root', '2018-01-30 16:10:03', '2018-02-01 16:31:07');
INSERT INTO `equipment_meter_config_field` VALUES (69, '900000000001', 1, '1004', 1002, 27, 'total_r_reat_ee', 0, 'root', '2018-01-30 16:10:03', 'root', '2018-01-30 16:10:03', '2018-02-01 16:31:10');
INSERT INTO `equipment_meter_config_field` VALUES (70, '900000000001', 1, '1004', 1002, 28, 'total_at_ee', 0, 'root', '2018-01-30 16:10:03', 'root', '2018-01-30 16:10:03', '2018-02-01 16:31:12');
INSERT INTO `equipment_meter_config_field` VALUES (71, '900000000001', 1, '1004', 1002, 29, 'total_p_reat_ee', 0, 'root', '2018-01-30 16:10:28', 'root', '2018-01-30 16:10:28', '2018-02-01 16:31:15');
INSERT INTO `equipment_meter_config_field` VALUES (72, '900000000001', 1, '1004', 1002, 30, 'total_ap_a_ee', 0, 'root', '2018-01-30 16:10:28', 'root', '2018-01-30 16:10:28', '2018-02-01 16:31:17');
INSERT INTO `equipment_meter_config_field` VALUES (73, '900000000001', 1, '1004', 1002, 31, 'uab_line_voltage', 0, 'root', '2018-01-30 16:12:43', 'root', '2018-01-30 16:12:43', '2018-02-01 16:31:20');
INSERT INTO `equipment_meter_config_field` VALUES (74, '900000000001', 1, '1004', 1002, 32, 'ubc_line_voltage', 0, 'root', '2018-01-30 16:12:43', 'root', '2018-01-30 16:12:43', '2018-02-01 16:31:22');
INSERT INTO `equipment_meter_config_field` VALUES (75, '900000000001', 1, '1004', 1002, 33, 'uac_line_voltage', 0, 'root', '2018-01-30 16:12:43', 'root', '2018-01-30 16:12:43', '2018-02-01 16:31:24');
INSERT INTO `equipment_meter_config_field` VALUES (76, '900000000001', 2, '1004', 1002, 34, 'a_active_power', 0, 'root', '2018-01-30 16:00:14', 'root', '2018-01-30 16:00:14', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (77, '900000000001', 2, '1004', 1002, 35, 'b_active_power', 0, 'root', '2018-01-30 16:02:28', 'root', '2018-01-30 16:02:28', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (78, '900000000001', 2, '1004', 1002, 36, 'c_active_power', 0, 'root', '2018-01-30 16:03:31', 'root', '2018-01-30 16:03:31', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (79, '900000000001', 2, '1004', 1002, 37, 'total_active_power', 0, 'root', '2018-01-30 16:03:31', 'root', '2018-01-30 16:03:31', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (80, '900000000001', 2, '1004', 1002, 38, 'a_reactive_power', 0, 'root', '2018-01-30 16:03:31', 'root', '2018-01-30 16:03:31', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (81, '900000000001', 2, '1004', 1002, 39, 'b_reactive_power', 0, 'root', '2018-01-30 16:04:49', 'root', '2018-01-30 16:04:49', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (82, '900000000001', 2, '1004', 1002, 40, 'c_reactive_power', 0, 'root', '2018-01-30 16:04:49', 'root', '2018-01-30 16:04:49', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (83, '900000000001', 2, '1004', 1002, 41, 'total_reactive_power', 0, 'root', '2018-01-30 16:04:49', 'root', '2018-01-30 16:04:49', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (84, '900000000001', 2, '1004', 1002, 42, 'a_ap_power', 0, 'root', '2018-01-30 16:07:00', 'root', '2018-01-30 16:07:00', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (85, '900000000001', 2, '1004', 1002, 43, 'b_ap_power', 0, 'root', '2018-01-30 16:07:00', 'root', '2018-01-30 16:07:00', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (86, '900000000001', 2, '1004', 1002, 44, 'c_ap_power', 0, 'root', '2018-01-30 16:07:00', 'root', '2018-01-30 16:07:00', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (87, '900000000001', 2, '1004', 1002, 45, 'total_ap_power', 0, 'root', '2018-01-30 16:07:33', 'root', '2018-01-30 16:07:33', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (88, '900000000001', 2, '1004', 1002, 46, 'a_voltage', 0, 'root', '2018-01-30 16:07:33', 'root', '2018-01-30 16:07:33', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (89, '900000000001', 2, '1004', 1002, 47, 'b_voltage', 0, 'root', '2018-01-30 16:07:33', 'root', '2018-01-30 16:07:33', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (90, '900000000001', 2, '1004', 1002, 48, 'c_voltage', 0, 'root', '2018-01-30 16:07:52', 'root', '2018-01-30 16:07:52', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (91, '900000000001', 2, '1004', 1002, 49, 'a_electricity', 0, 'root', '2018-01-30 16:07:52', 'root', '2018-01-30 16:07:52', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (92, '900000000001', 2, '1004', 1002, 50, 'b_electricity', 0, 'root', '2018-01-30 16:07:52', 'root', '2018-01-30 16:07:52', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (93, '900000000001', 2, '1004', 1002, 51, 'c_electricity', 0, 'root', '2018-01-30 16:08:14', 'root', '2018-01-30 16:08:14', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (94, '900000000001', 2, '1004', 1002, 52, 'a_power_factor', 0, 'root', '2018-01-30 16:08:14', 'root', '2018-01-30 16:08:14', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (95, '900000000001', 2, '1004', 1002, 53, 'b_power_factor', 0, 'root', '2018-01-30 16:08:14', 'root', '2018-01-30 16:08:14', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (96, '900000000001', 2, '1004', 1002, 54, 'c_power_factor', 0, 'root', '2018-01-30 16:08:53', 'root', '2018-01-30 16:08:53', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (97, '900000000001', 2, '1004', 1002, 55, 'total_power_factor', 0, 'root', '2018-01-30 16:08:53', 'root', '2018-01-30 16:08:53', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (98, '900000000001', 2, '1004', 1002, 56, 'frequency', 0, 'root', '2018-01-30 16:08:53', 'root', '2018-01-30 16:08:53', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (99, '900000000001', 2, '1004', 1002, 57, 'total_p_at_ee', 0, 'root', '2018-01-30 16:09:36', 'root', '2018-01-30 16:09:36', '2018-02-01 16:31:02');
INSERT INTO `equipment_meter_config_field` VALUES (100, '900000000001', 2, '1004', 1002, 58, 'total_r_at_ee', 0, 'root', '2018-01-30 16:09:36', 'root', '2018-01-30 16:09:36', '2018-02-01 16:31:05');
INSERT INTO `equipment_meter_config_field` VALUES (101, '900000000001', 2, '1004', 1002, 59, 'total_p_reat_ee', 0, 'root', '2018-01-30 16:10:03', 'root', '2018-01-30 16:10:03', '2018-02-01 16:31:07');
INSERT INTO `equipment_meter_config_field` VALUES (102, '900000000001', 2, '1004', 1002, 60, 'total_r_reat_ee', 0, 'root', '2018-01-30 16:10:03', 'root', '2018-01-30 16:10:03', '2018-02-01 16:31:10');
INSERT INTO `equipment_meter_config_field` VALUES (103, '900000000001', 2, '1004', 1002, 61, 'total_at_ee', 0, 'root', '2018-01-30 16:10:03', 'root', '2018-01-30 16:10:03', '2018-02-01 16:31:12');
INSERT INTO `equipment_meter_config_field` VALUES (104, '900000000001', 2, '1004', 1002, 62, 'total_p_reat_ee', 0, 'root', '2018-01-30 16:10:28', 'root', '2018-01-30 16:10:28', '2018-02-01 16:31:15');
INSERT INTO `equipment_meter_config_field` VALUES (105, '900000000001', 2, '1004', 1002, 63, 'total_ap_a_ee', 0, 'root', '2018-01-30 16:10:28', 'root', '2018-01-30 16:10:28', '2018-02-01 16:31:17');
INSERT INTO `equipment_meter_config_field` VALUES (106, '900000000001', 2, '1004', 1002, 64, 'uab_line_voltage', 0, 'root', '2018-01-30 16:12:43', 'root', '2018-01-30 16:12:43', '2018-02-01 16:31:20');
INSERT INTO `equipment_meter_config_field` VALUES (107, '900000000001', 2, '1004', 1002, 65, 'ubc_line_voltage', 0, 'root', '2018-01-30 16:12:43', 'root', '2018-01-30 16:12:43', '2018-02-01 16:31:22');
INSERT INTO `equipment_meter_config_field` VALUES (108, '900000000001', 2, '1004', 1002, 66, 'uac_line_voltage', 0, 'root', '2018-01-30 16:12:43', 'root', '2018-01-30 16:12:43', '2018-02-01 16:31:24');
INSERT INTO `equipment_meter_config_field` VALUES (109, '900000000001', 3, '1004', 1002, 67, 'a_active_power', 0, 'root', '2018-01-30 16:00:14', 'root', '2018-01-30 16:00:14', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (110, '900000000001', 3, '1004', 1002, 68, 'b_active_power', 0, 'root', '2018-01-30 16:02:28', 'root', '2018-01-30 16:02:28', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (111, '900000000001', 3, '1004', 1002, 69, 'c_active_power', 0, 'root', '2018-01-30 16:03:31', 'root', '2018-01-30 16:03:31', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (112, '900000000001', 3, '1004', 1002, 70, 'total_active_power', 0, 'root', '2018-01-30 16:03:31', 'root', '2018-01-30 16:03:31', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (113, '900000000001', 3, '1004', 1002, 71, 'a_reactive_power', 0, 'root', '2018-01-30 16:03:31', 'root', '2018-01-30 16:03:31', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (114, '900000000001', 3, '1004', 1002, 72, 'b_reactive_power', 0, 'root', '2018-01-30 16:04:49', 'root', '2018-01-30 16:04:49', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (115, '900000000001', 3, '1004', 1002, 73, 'c_reactive_power', 0, 'root', '2018-01-30 16:04:49', 'root', '2018-01-30 16:04:49', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (116, '900000000001', 3, '1004', 1002, 74, 'total_reactive_power', 0, 'root', '2018-01-30 16:04:49', 'root', '2018-01-30 16:04:49', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (117, '900000000001', 3, '1004', 1002, 75, 'a_ap_power', 0, 'root', '2018-01-30 16:07:00', 'root', '2018-01-30 16:07:00', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (118, '900000000001', 3, '1004', 1002, 76, 'b_ap_power', 0, 'root', '2018-01-30 16:07:00', 'root', '2018-01-30 16:07:00', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (119, '900000000001', 3, '1004', 1002, 77, 'c_ap_power', 0, 'root', '2018-01-30 16:07:00', 'root', '2018-01-30 16:07:00', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (120, '900000000001', 3, '1004', 1002, 78, 'total_ap_power', 0, 'root', '2018-01-30 16:07:33', 'root', '2018-01-30 16:07:33', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (121, '900000000001', 3, '1004', 1002, 79, 'a_voltage', 0, 'root', '2018-01-30 16:07:33', 'root', '2018-01-30 16:07:33', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (122, '900000000001', 3, '1004', 1002, 80, 'b_voltage', 0, 'root', '2018-01-30 16:07:33', 'root', '2018-01-30 16:07:33', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (123, '900000000001', 3, '1004', 1002, 81, 'c_voltage', 0, 'root', '2018-01-30 16:07:52', 'root', '2018-01-30 16:07:52', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (124, '900000000001', 3, '1004', 1002, 82, 'a_electricity', 0, 'root', '2018-01-30 16:07:52', 'root', '2018-01-30 16:07:52', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (125, '900000000001', 3, '1004', 1002, 83, 'b_electricity', 0, 'root', '2018-01-30 16:07:52', 'root', '2018-01-30 16:07:52', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (126, '900000000001', 3, '1004', 1002, 84, 'c_electricity', 0, 'root', '2018-01-30 16:08:14', 'root', '2018-01-30 16:08:14', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (127, '900000000001', 3, '1004', 1002, 85, 'a_power_factor', 0, 'root', '2018-01-30 16:08:14', 'root', '2018-01-30 16:08:14', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (128, '900000000001', 3, '1004', 1002, 86, 'b_power_factor', 0, 'root', '2018-01-30 16:08:14', 'root', '2018-01-30 16:08:14', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (129, '900000000001', 3, '1004', 1002, 87, 'c_power_factor', 0, 'root', '2018-01-30 16:08:53', 'root', '2018-01-30 16:08:53', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (130, '900000000001', 3, '1004', 1002, 88, 'total_power_factor', 0, 'root', '2018-01-30 16:08:53', 'root', '2018-01-30 16:08:53', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (131, '900000000001', 3, '1004', 1002, 89, 'frequency', 0, 'root', '2018-01-30 16:08:53', 'root', '2018-01-30 16:08:53', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (132, '900000000001', 3, '1004', 1002, 90, 'total_p_at_ee', 0, 'root', '2018-01-30 16:09:36', 'root', '2018-01-30 16:09:36', '2018-02-01 16:31:02');
INSERT INTO `equipment_meter_config_field` VALUES (133, '900000000001', 3, '1004', 1002, 91, 'total_r_at_ee', 0, 'root', '2018-01-30 16:09:36', 'root', '2018-01-30 16:09:36', '2018-02-01 16:31:05');
INSERT INTO `equipment_meter_config_field` VALUES (134, '900000000001', 3, '1004', 1002, 92, 'total_p_reat_ee', 0, 'root', '2018-01-30 16:10:03', 'root', '2018-01-30 16:10:03', '2018-02-01 16:31:07');
INSERT INTO `equipment_meter_config_field` VALUES (135, '900000000001', 3, '1004', 1002, 93, 'total_r_reat_ee', 0, 'root', '2018-01-30 16:10:03', 'root', '2018-01-30 16:10:03', '2018-02-01 16:31:10');
INSERT INTO `equipment_meter_config_field` VALUES (136, '900000000001', 3, '1004', 1002, 94, 'total_at_ee', 0, 'root', '2018-01-30 16:10:03', 'root', '2018-01-30 16:10:03', '2018-02-01 16:31:12');
INSERT INTO `equipment_meter_config_field` VALUES (137, '900000000001', 3, '1004', 1002, 95, 'total_p_reat_ee', 0, 'root', '2018-01-30 16:10:28', 'root', '2018-01-30 16:10:28', '2018-02-01 16:31:15');
INSERT INTO `equipment_meter_config_field` VALUES (138, '900000000001', 3, '1004', 1002, 96, 'total_ap_a_ee', 0, 'root', '2018-01-30 16:10:28', 'root', '2018-01-30 16:10:28', '2018-02-01 16:31:17');
INSERT INTO `equipment_meter_config_field` VALUES (139, '900000000001', 3, '1004', 1002, 97, 'uab_line_voltage', 0, 'root', '2018-01-30 16:12:43', 'root', '2018-01-30 16:12:43', '2018-02-01 16:31:20');
INSERT INTO `equipment_meter_config_field` VALUES (140, '900000000001', 3, '1004', 1002, 98, 'ubc_line_voltage', 0, 'root', '2018-01-30 16:12:43', 'root', '2018-01-30 16:12:43', '2018-02-01 16:31:22');
INSERT INTO `equipment_meter_config_field` VALUES (141, '900000000001', 3, '1004', 1002, 99, 'uac_line_voltage', 0, 'root', '2018-01-30 16:12:43', 'root', '2018-01-30 16:12:43', '2018-02-01 16:31:24');
INSERT INTO `equipment_meter_config_field` VALUES (142, '900000000040', 1, '1007', 1002, 1, 'a_voltage', 0, '超级管理员', '2018-05-11 15:30:34', '超级管理员', '2018-05-11 16:08:33', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (143, '900000000040', 1, '1007', 1002, 2, 'b_voltage', 0, '超级管理员', '2018-05-11 15:31:07', '超级管理员', '2018-05-11 15:31:07', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (144, '900000000040', 1, '1007', 1002, 3, 'c_voltage', 0, '超级管理员', '2018-05-11 15:32:01', '超级管理员', '2018-05-11 15:32:01', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (145, '900000000040', 1, '1007', 1002, 4, 'uab_line_voltage', 0, '超级管理员', '2018-05-11 15:35:27', '超级管理员', '2018-05-11 15:35:27', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (146, '900000000040', 1, '1007', 1002, 5, 'ubc_line_voltage', 0, '超级管理员', '2018-05-11 15:35:52', '超级管理员', '2018-05-11 15:35:52', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (147, '900000000040', 1, '1007', 1002, 6, 'uac_line_voltage', 0, '超级管理员', '2018-05-11 15:36:20', '超级管理员', '2018-05-11 15:36:20', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (148, '900000000040', 1, '1007', 1002, 7, 'a_electricity', 0, '超级管理员', '2018-05-11 15:36:44', '超级管理员', '2018-05-11 15:36:44', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (149, '900000000040', 1, '1007', 1002, 8, 'b_electricity', 0, '超级管理员', '2018-05-11 15:37:20', '超级管理员', '2018-05-11 15:37:20', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (150, '900000000040', 1, '1007', 1002, 9, 'c_electricity', 0, '超级管理员', '2018-05-11 15:37:53', '超级管理员', '2018-05-11 15:37:53', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (151, '900000000040', 1, '1007', 1002, 10, 'a_active_power', 0, '超级管理员', '2018-05-11 15:38:17', '超级管理员', '2018-05-11 15:38:17', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (152, '900000000040', 1, '1007', 1002, 11, 'b_active_power', 0, '超级管理员', '2018-05-11 15:38:40', '超级管理员', '2018-05-11 15:38:40', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (153, '900000000040', 1, '1007', 1002, 12, 'c_active_power', 0, '超级管理员', '2018-05-11 15:39:10', '超级管理员', '2018-05-11 15:39:10', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (154, '900000000040', 1, '1007', 1002, 13, 'total_active_power', 0, '超级管理员', '2018-05-11 15:39:33', '超级管理员', '2018-05-11 15:39:33', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (155, '900000000040', 1, '1007', 1002, 14, 'a_reactive_power', 0, '超级管理员', '2018-05-11 15:39:58', '超级管理员', '2018-05-11 15:39:58', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (156, '900000000040', 1, '1007', 1002, 15, 'b_reactive_power', 0, '超级管理员', '2018-05-11 15:40:17', '超级管理员', '2018-05-11 15:40:17', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (157, '900000000040', 1, '1007', 1002, 16, 'c_reactive_power', 0, '超级管理员', '2018-05-11 15:40:37', '超级管理员', '2018-05-11 15:40:37', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (158, '900000000040', 1, '1007', 1002, 17, 'total_reactive_power', 0, '超级管理员', '2018-05-11 15:41:05', '超级管理员', '2018-05-11 15:41:05', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (159, '900000000040', 1, '1007', 1002, 18, 'a_ap_power', 0, '超级管理员', '2018-05-11 15:41:37', '超级管理员', '2018-05-11 15:41:37', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (160, '900000000040', 1, '1007', 1002, 19, 'b_ap_power', 0, '超级管理员', '2018-05-11 15:42:27', '超级管理员', '2018-05-11 15:42:27', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (161, '900000000040', 1, '1007', 1002, 20, 'c_ap_power', 0, '超级管理员', '2018-05-11 15:42:56', '超级管理员', '2018-05-11 15:42:56', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (162, '900000000040', 1, '1007', 1002, 21, 'total_ap_power', 0, '超级管理员', '2018-05-11 15:43:23', '超级管理员', '2018-05-11 15:43:23', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (163, '900000000040', 1, '1007', 1002, 22, 'a_power_factor', 0, '超级管理员', '2018-05-11 15:43:57', '超级管理员', '2018-05-11 15:43:57', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (164, '900000000040', 1, '1007', 1002, 23, 'b_power_factor', 0, '超级管理员', '2018-05-11 15:44:20', '超级管理员', '2018-05-11 15:44:20', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (165, '900000000040', 1, '1007', 1002, 24, 'c_power_factor', 0, '超级管理员', '2018-05-11 15:44:44', '超级管理员', '2018-05-11 16:08:57', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (166, '900000000040', 1, '1007', 1002, 25, 'total_power_factor', 0, '超级管理员', '2018-05-11 15:45:02', '超级管理员', '2018-05-11 15:45:02', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (167, '900000000040', 1, '1007', 1002, 26, 'frequency', 0, '超级管理员', '2018-05-11 15:45:22', '超级管理员', '2018-05-11 15:45:22', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (168, '900000000040', 1, '1007', 1002, 27, 'total_p_at_ee', 0, '超级管理员', '2018-05-14 06:40:58', '超级管理员', '2018-05-14 06:40:58', '2018-05-14 06:40:57');
INSERT INTO `equipment_meter_config_field` VALUES (169, '900000000040', 1, '1007', 1002, 28, 'total_r_at_ee', 0, '超级管理员', '2018-05-14 06:42:23', '超级管理员', '2018-05-14 06:42:23', '2018-05-14 06:42:22');
INSERT INTO `equipment_meter_config_field` VALUES (170, '900000000040', 1, '1007', 1002, 29, 'total_p_reat_ee', 0, '超级管理员', '2018-05-14 06:43:13', '超级管理员', '2018-05-14 06:43:13', '2018-05-14 06:43:13');
INSERT INTO `equipment_meter_config_field` VALUES (171, '900000000040', 1, '1007', 1002, 30, 'total_r_reat_ee', 0, '超级管理员', '2018-05-14 06:44:11', '超级管理员', '2018-05-14 06:44:11', '2018-05-14 06:44:10');
INSERT INTO `equipment_meter_config_field` VALUES (172, '900000000040', 1, '1007', 1002, 31, 'total_ap_a_ee', 0, '超级管理员', '2018-05-14 06:44:47', '超级管理员', '2018-05-14 06:44:47', '2018-05-14 06:44:46');
INSERT INTO `equipment_meter_config_field` VALUES (173, '900000000040', 2, '1007', 1002, 32, 'a_voltage', 0, '超级管理员', '2018-05-11 15:30:34', '超级管理员', '2018-05-11 16:08:33', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (174, '900000000040', 2, '1007', 1002, 33, 'b_voltage', 0, '超级管理员', '2018-05-11 15:31:07', '超级管理员', '2018-05-11 15:31:07', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (175, '900000000040', 2, '1007', 1002, 34, 'c_voltage', 0, '超级管理员', '2018-05-11 15:32:01', '超级管理员', '2018-05-11 15:32:01', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (176, '900000000040', 2, '1007', 1002, 35, 'uab_line_voltage', 0, '超级管理员', '2018-05-11 15:35:27', '超级管理员', '2018-05-11 15:35:27', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (177, '900000000040', 2, '1007', 1002, 36, 'ubc_line_voltage', 0, '超级管理员', '2018-05-11 15:35:52', '超级管理员', '2018-05-11 15:35:52', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (178, '900000000040', 2, '1007', 1002, 37, 'uac_line_voltage', 0, '超级管理员', '2018-05-11 15:36:20', '超级管理员', '2018-05-11 15:36:20', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (179, '900000000040', 2, '1007', 1002, 38, 'a_electricity', 0, '超级管理员', '2018-05-11 15:36:44', '超级管理员', '2018-05-11 15:36:44', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (180, '900000000040', 2, '1007', 1002, 39, 'b_electricity', 0, '超级管理员', '2018-05-11 15:37:20', '超级管理员', '2018-05-11 15:37:20', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (181, '900000000040', 2, '1007', 1002, 40, 'c_electricity', 0, '超级管理员', '2018-05-11 15:37:53', '超级管理员', '2018-05-11 15:37:53', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (182, '900000000040', 2, '1007', 1002, 41, 'a_active_power', 0, '超级管理员', '2018-05-11 15:38:17', '超级管理员', '2018-05-11 15:38:17', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (183, '900000000040', 2, '1007', 1002, 42, 'b_active_power', 0, '超级管理员', '2018-05-11 15:38:40', '超级管理员', '2018-05-11 15:38:40', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (184, '900000000040', 2, '1007', 1002, 43, 'c_active_power', 0, '超级管理员', '2018-05-11 15:39:10', '超级管理员', '2018-05-11 15:39:10', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (185, '900000000040', 2, '1007', 1002, 44, 'total_active_power', 0, '超级管理员', '2018-05-11 15:39:33', '超级管理员', '2018-05-11 15:39:33', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (186, '900000000040', 2, '1007', 1002, 45, 'a_reactive_power', 0, '超级管理员', '2018-05-11 15:39:58', '超级管理员', '2018-05-11 15:39:58', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (187, '900000000040', 2, '1007', 1002, 46, 'b_reactive_power', 0, '超级管理员', '2018-05-11 15:40:17', '超级管理员', '2018-05-11 15:40:17', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (188, '900000000040', 2, '1007', 1002, 47, 'c_reactive_power', 0, '超级管理员', '2018-05-11 15:40:37', '超级管理员', '2018-05-11 15:40:37', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (189, '900000000040', 2, '1007', 1002, 48, 'total_reactive_power', 0, '超级管理员', '2018-05-11 15:41:05', '超级管理员', '2018-05-11 15:41:05', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (190, '900000000040', 2, '1007', 1002, 49, 'a_ap_power', 0, '超级管理员', '2018-05-11 15:41:37', '超级管理员', '2018-05-11 15:41:37', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (191, '900000000040', 2, '1007', 1002, 50, 'b_ap_power', 0, '超级管理员', '2018-05-11 15:42:27', '超级管理员', '2018-05-11 15:42:27', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (192, '900000000040', 2, '1007', 1002, 51, 'c_ap_power', 0, '超级管理员', '2018-05-11 15:42:56', '超级管理员', '2018-05-11 15:42:56', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (193, '900000000040', 2, '1007', 1002, 52, 'total_ap_power', 0, '超级管理员', '2018-05-11 15:43:23', '超级管理员', '2018-05-11 15:43:23', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (194, '900000000040', 2, '1007', 1002, 53, 'a_power_factor', 0, '超级管理员', '2018-05-11 15:43:57', '超级管理员', '2018-05-11 15:43:57', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (195, '900000000040', 2, '1007', 1002, 54, 'b_power_factor', 0, '超级管理员', '2018-05-11 15:44:20', '超级管理员', '2018-05-11 15:44:20', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (196, '900000000040', 2, '1007', 1002, 55, 'c_power_factor', 0, '超级管理员', '2018-05-11 15:44:44', '超级管理员', '2018-05-11 16:08:57', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (197, '900000000040', 2, '1007', 1002, 56, 'total_power_factor', 0, '超级管理员', '2018-05-11 15:45:02', '超级管理员', '2018-05-11 15:45:02', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (198, '900000000040', 2, '1007', 1002, 57, 'frequency', 0, '超级管理员', '2018-05-11 15:45:22', '超级管理员', '2018-05-11 15:45:22', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (199, '900000000040', 2, '1007', 1002, 58, 'total_p_at_ee', 0, '超级管理员', '2018-05-14 06:40:58', '超级管理员', '2018-05-14 06:40:58', '2018-05-14 06:40:57');
INSERT INTO `equipment_meter_config_field` VALUES (200, '900000000040', 2, '1007', 1002, 59, 'total_r_at_ee', 0, '超级管理员', '2018-05-14 06:42:23', '超级管理员', '2018-05-14 06:42:23', '2018-05-14 06:42:22');
INSERT INTO `equipment_meter_config_field` VALUES (201, '900000000040', 2, '1007', 1002, 60, 'total_p_reat_ee', 0, '超级管理员', '2018-05-14 06:43:13', '超级管理员', '2018-05-14 06:43:13', '2018-05-14 06:43:13');
INSERT INTO `equipment_meter_config_field` VALUES (202, '900000000040', 2, '1007', 1002, 61, 'total_r_reat_ee', 0, '超级管理员', '2018-05-14 06:44:11', '超级管理员', '2018-05-14 06:44:11', '2018-05-14 06:44:10');
INSERT INTO `equipment_meter_config_field` VALUES (203, '900000000040', 2, '1007', 1002, 62, 'total_ap_a_ee', 0, '超级管理员', '2018-05-14 06:44:47', '超级管理员', '2018-05-14 06:44:47', '2018-05-14 06:44:46');
INSERT INTO `equipment_meter_config_field` VALUES (204, '900000000040', 3, '1007', 1002, 63, 'a_voltage', 0, '超级管理员', '2018-05-11 15:30:34', '超级管理员', '2018-05-11 16:08:33', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (205, '900000000040', 3, '1007', 1002, 64, 'b_voltage', 0, '超级管理员', '2018-05-11 15:31:07', '超级管理员', '2018-05-11 15:31:07', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (206, '900000000040', 3, '1007', 1002, 65, 'c_voltage', 0, '超级管理员', '2018-05-11 15:32:01', '超级管理员', '2018-05-11 15:32:01', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (207, '900000000040', 3, '1007', 1002, 66, 'uab_line_voltage', 0, '超级管理员', '2018-05-11 15:35:27', '超级管理员', '2018-05-11 15:35:27', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (208, '900000000040', 3, '1007', 1002, 67, 'ubc_line_voltage', 0, '超级管理员', '2018-05-11 15:35:52', '超级管理员', '2018-05-11 15:35:52', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (209, '900000000040', 3, '1007', 1002, 68, 'uac_line_voltage', 0, '超级管理员', '2018-05-11 15:36:20', '超级管理员', '2018-05-11 15:36:20', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (210, '900000000040', 3, '1007', 1002, 69, 'a_electricity', 0, '超级管理员', '2018-05-11 15:36:44', '超级管理员', '2018-05-11 15:36:44', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (211, '900000000040', 3, '1007', 1002, 70, 'b_electricity', 0, '超级管理员', '2018-05-11 15:37:20', '超级管理员', '2018-05-11 15:37:20', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (212, '900000000040', 3, '1007', 1002, 71, 'c_electricity', 0, '超级管理员', '2018-05-11 15:37:53', '超级管理员', '2018-05-11 15:37:53', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (213, '900000000040', 3, '1007', 1002, 72, 'a_active_power', 0, '超级管理员', '2018-05-11 15:38:17', '超级管理员', '2018-05-11 15:38:17', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (214, '900000000040', 3, '1007', 1002, 73, 'b_active_power', 0, '超级管理员', '2018-05-11 15:38:40', '超级管理员', '2018-05-11 15:38:40', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (215, '900000000040', 3, '1007', 1002, 74, 'c_active_power', 0, '超级管理员', '2018-05-11 15:39:10', '超级管理员', '2018-05-11 15:39:10', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (216, '900000000040', 3, '1007', 1002, 75, 'total_active_power', 0, '超级管理员', '2018-05-11 15:39:33', '超级管理员', '2018-05-11 15:39:33', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (217, '900000000040', 3, '1007', 1002, 76, 'a_reactive_power', 0, '超级管理员', '2018-05-11 15:39:58', '超级管理员', '2018-05-11 15:39:58', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (218, '900000000040', 3, '1007', 1002, 77, 'b_reactive_power', 0, '超级管理员', '2018-05-11 15:40:17', '超级管理员', '2018-05-11 15:40:17', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (219, '900000000040', 3, '1007', 1002, 78, 'c_reactive_power', 0, '超级管理员', '2018-05-11 15:40:37', '超级管理员', '2018-05-11 15:40:37', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (220, '900000000040', 3, '1007', 1002, 79, 'total_reactive_power', 0, '超级管理员', '2018-05-11 15:41:05', '超级管理员', '2018-05-11 15:41:05', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (221, '900000000040', 3, '1007', 1002, 80, 'a_ap_power', 0, '超级管理员', '2018-05-11 15:41:37', '超级管理员', '2018-05-11 15:41:37', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (222, '900000000040', 3, '1007', 1002, 81, 'b_ap_power', 0, '超级管理员', '2018-05-11 15:42:27', '超级管理员', '2018-05-11 15:42:27', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (223, '900000000040', 3, '1007', 1002, 82, 'c_ap_power', 0, '超级管理员', '2018-05-11 15:42:56', '超级管理员', '2018-05-11 15:42:56', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (224, '900000000040', 3, '1007', 1002, 83, 'total_ap_power', 0, '超级管理员', '2018-05-11 15:43:23', '超级管理员', '2018-05-11 15:43:23', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (225, '900000000040', 3, '1007', 1002, 84, 'a_power_factor', 0, '超级管理员', '2018-05-11 15:43:57', '超级管理员', '2018-05-11 15:43:57', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (226, '900000000040', 3, '1007', 1002, 85, 'b_power_factor', 0, '超级管理员', '2018-05-11 15:44:20', '超级管理员', '2018-05-11 15:44:20', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (227, '900000000040', 3, '1007', 1002, 86, 'c_power_factor', 0, '超级管理员', '2018-05-11 15:44:44', '超级管理员', '2018-05-11 16:08:57', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (228, '900000000040', 3, '1007', 1002, 87, 'total_power_factor', 0, '超级管理员', '2018-05-11 15:45:02', '超级管理员', '2018-05-11 15:45:02', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (229, '900000000040', 3, '1007', 1002, 88, 'frequency', 0, '超级管理员', '2018-05-11 15:45:22', '超级管理员', '2018-05-11 15:45:22', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (230, '900000000040', 3, '1007', 1002, 89, 'total_p_at_ee', 0, '超级管理员', '2018-05-14 06:40:58', '超级管理员', '2018-05-14 06:40:58', '2018-05-14 06:40:57');
INSERT INTO `equipment_meter_config_field` VALUES (231, '900000000040', 3, '1007', 1002, 90, 'total_r_at_ee', 0, '超级管理员', '2018-05-14 06:42:23', '超级管理员', '2018-05-14 06:42:23', '2018-05-14 06:42:22');
INSERT INTO `equipment_meter_config_field` VALUES (232, '900000000040', 3, '1007', 1002, 91, 'total_p_reat_ee', 0, '超级管理员', '2018-05-14 06:43:13', '超级管理员', '2018-05-14 06:43:13', '2018-05-14 06:43:13');
INSERT INTO `equipment_meter_config_field` VALUES (233, '900000000040', 3, '1007', 1002, 92, 'total_r_reat_ee', 0, '超级管理员', '2018-05-14 06:44:11', '超级管理员', '2018-05-14 06:44:11', '2018-05-14 06:44:10');
INSERT INTO `equipment_meter_config_field` VALUES (234, '900000000040', 3, '1007', 1002, 93, 'total_ap_a_ee', 0, '超级管理员', '2018-05-14 06:44:47', '超级管理员', '2018-05-14 06:44:47', '2018-05-14 06:44:46');
INSERT INTO `equipment_meter_config_field` VALUES (235, '900000000040', 4, '1007', 1002, 94, 'a_voltage', 0, '超级管理员', '2018-05-11 15:30:34', '超级管理员', '2018-05-11 16:08:33', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (236, '900000000040', 4, '1007', 1002, 95, 'b_voltage', 0, '超级管理员', '2018-05-11 15:31:07', '超级管理员', '2018-05-11 15:31:07', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (237, '900000000040', 4, '1007', 1002, 96, 'c_voltage', 0, '超级管理员', '2018-05-11 15:32:01', '超级管理员', '2018-05-11 15:32:01', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (238, '900000000040', 4, '1007', 1002, 97, 'uab_line_voltage', 0, '超级管理员', '2018-05-11 15:35:27', '超级管理员', '2018-05-11 15:35:27', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (239, '900000000040', 4, '1007', 1002, 98, 'ubc_line_voltage', 0, '超级管理员', '2018-05-11 15:35:52', '超级管理员', '2018-05-11 15:35:52', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (240, '900000000040', 4, '1007', 1002, 99, 'uac_line_voltage', 0, '超级管理员', '2018-05-11 15:36:20', '超级管理员', '2018-05-11 15:36:20', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (241, '900000000040', 4, '1007', 1002, 100, 'a_electricity', 0, '超级管理员', '2018-05-11 15:36:44', '超级管理员', '2018-05-11 15:36:44', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (242, '900000000040', 4, '1007', 1002, 101, 'b_electricity', 0, '超级管理员', '2018-05-11 15:37:20', '超级管理员', '2018-05-11 15:37:20', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (243, '900000000040', 4, '1007', 1002, 102, 'c_electricity', 0, '超级管理员', '2018-05-11 15:37:53', '超级管理员', '2018-05-11 15:37:53', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (244, '900000000040', 4, '1007', 1002, 103, 'a_active_power', 0, '超级管理员', '2018-05-11 15:38:17', '超级管理员', '2018-05-11 15:38:17', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (245, '900000000040', 4, '1007', 1002, 104, 'b_active_power', 0, '超级管理员', '2018-05-11 15:38:40', '超级管理员', '2018-05-11 15:38:40', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (246, '900000000040', 4, '1007', 1002, 105, 'c_active_power', 0, '超级管理员', '2018-05-11 15:39:10', '超级管理员', '2018-05-11 15:39:10', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (247, '900000000040', 4, '1007', 1002, 106, 'total_active_power', 0, '超级管理员', '2018-05-11 15:39:33', '超级管理员', '2018-05-11 15:39:33', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (248, '900000000040', 4, '1007', 1002, 107, 'a_reactive_power', 0, '超级管理员', '2018-05-11 15:39:58', '超级管理员', '2018-05-11 15:39:58', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (249, '900000000040', 4, '1007', 1002, 108, 'b_reactive_power', 0, '超级管理员', '2018-05-11 15:40:17', '超级管理员', '2018-05-11 15:40:17', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (250, '900000000040', 4, '1007', 1002, 109, 'c_reactive_power', 0, '超级管理员', '2018-05-11 15:40:37', '超级管理员', '2018-05-11 15:40:37', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (251, '900000000040', 4, '1007', 1002, 110, 'total_reactive_power', 0, '超级管理员', '2018-05-11 15:41:05', '超级管理员', '2018-05-11 15:41:05', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (252, '900000000040', 4, '1007', 1002, 111, 'a_ap_power', 0, '超级管理员', '2018-05-11 15:41:37', '超级管理员', '2018-05-11 15:41:37', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (253, '900000000040', 4, '1007', 1002, 112, 'b_ap_power', 0, '超级管理员', '2018-05-11 15:42:27', '超级管理员', '2018-05-11 15:42:27', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (254, '900000000040', 4, '1007', 1002, 113, 'c_ap_power', 0, '超级管理员', '2018-05-11 15:42:56', '超级管理员', '2018-05-11 15:42:56', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (255, '900000000040', 4, '1007', 1002, 114, 'total_ap_power', 0, '超级管理员', '2018-05-11 15:43:23', '超级管理员', '2018-05-11 15:43:23', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (256, '900000000040', 4, '1007', 1002, 115, 'a_power_factor', 0, '超级管理员', '2018-05-11 15:43:57', '超级管理员', '2018-05-11 15:43:57', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (257, '900000000040', 4, '1007', 1002, 116, 'b_power_factor', 0, '超级管理员', '2018-05-11 15:44:20', '超级管理员', '2018-05-11 15:44:20', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (258, '900000000040', 4, '1007', 1002, 117, 'c_power_factor', 0, '超级管理员', '2018-05-11 15:44:44', '超级管理员', '2018-05-11 16:08:57', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (259, '900000000040', 4, '1007', 1002, 118, 'total_power_factor', 0, '超级管理员', '2018-05-11 15:45:02', '超级管理员', '2018-05-11 15:45:02', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (260, '900000000040', 4, '1007', 1002, 119, 'frequency', 0, '超级管理员', '2018-05-11 15:45:22', '超级管理员', '2018-05-11 15:45:22', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (261, '900000000040', 4, '1007', 1002, 120, 'total_p_at_ee', 0, '超级管理员', '2018-05-14 06:40:58', '超级管理员', '2018-05-14 06:40:58', '2018-05-14 06:40:57');
INSERT INTO `equipment_meter_config_field` VALUES (262, '900000000040', 4, '1007', 1002, 121, 'total_r_at_ee', 0, '超级管理员', '2018-05-14 06:42:23', '超级管理员', '2018-05-14 06:42:23', '2018-05-14 06:42:22');
INSERT INTO `equipment_meter_config_field` VALUES (263, '900000000040', 4, '1007', 1002, 122, 'total_p_reat_ee', 0, '超级管理员', '2018-05-14 06:43:13', '超级管理员', '2018-05-14 06:43:13', '2018-05-14 06:43:13');
INSERT INTO `equipment_meter_config_field` VALUES (264, '900000000040', 4, '1007', 1002, 123, 'total_r_reat_ee', 0, '超级管理员', '2018-05-14 06:44:11', '超级管理员', '2018-05-14 06:44:11', '2018-05-14 06:44:10');
INSERT INTO `equipment_meter_config_field` VALUES (265, '900000000040', 4, '1007', 1002, 124, 'total_ap_a_ee', 0, '超级管理员', '2018-05-14 06:44:47', '超级管理员', '2018-05-14 06:44:47', '2018-05-14 06:44:46');
INSERT INTO `equipment_meter_config_field` VALUES (266, '900000000040', 5, '1007', 1002, 125, 'a_voltage', 0, '超级管理员', '2018-05-11 15:30:34', '超级管理员', '2018-05-11 16:08:33', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (267, '900000000040', 5, '1007', 1002, 126, 'b_voltage', 0, '超级管理员', '2018-05-11 15:31:07', '超级管理员', '2018-05-11 15:31:07', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (268, '900000000040', 5, '1007', 1002, 127, 'c_voltage', 0, '超级管理员', '2018-05-11 15:32:01', '超级管理员', '2018-05-11 15:32:01', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (269, '900000000040', 5, '1007', 1002, 128, 'uab_line_voltage', 0, '超级管理员', '2018-05-11 15:35:27', '超级管理员', '2018-05-11 15:35:27', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (270, '900000000040', 5, '1007', 1002, 129, 'ubc_line_voltage', 0, '超级管理员', '2018-05-11 15:35:52', '超级管理员', '2018-05-11 15:35:52', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (271, '900000000040', 5, '1007', 1002, 130, 'uac_line_voltage', 0, '超级管理员', '2018-05-11 15:36:20', '超级管理员', '2018-05-11 15:36:20', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (272, '900000000040', 5, '1007', 1002, 131, 'a_electricity', 0, '超级管理员', '2018-05-11 15:36:44', '超级管理员', '2018-05-11 15:36:44', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (273, '900000000040', 5, '1007', 1002, 132, 'b_electricity', 0, '超级管理员', '2018-05-11 15:37:20', '超级管理员', '2018-05-11 15:37:20', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (274, '900000000040', 5, '1007', 1002, 133, 'c_electricity', 0, '超级管理员', '2018-05-11 15:37:53', '超级管理员', '2018-05-11 15:37:53', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (275, '900000000040', 5, '1007', 1002, 134, 'a_active_power', 0, '超级管理员', '2018-05-11 15:38:17', '超级管理员', '2018-05-11 15:38:17', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (276, '900000000040', 5, '1007', 1002, 135, 'b_active_power', 0, '超级管理员', '2018-05-11 15:38:40', '超级管理员', '2018-05-11 15:38:40', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (277, '900000000040', 5, '1007', 1002, 136, 'c_active_power', 0, '超级管理员', '2018-05-11 15:39:10', '超级管理员', '2018-05-11 15:39:10', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (278, '900000000040', 5, '1007', 1002, 137, 'total_active_power', 0, '超级管理员', '2018-05-11 15:39:33', '超级管理员', '2018-05-11 15:39:33', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (279, '900000000040', 5, '1007', 1002, 138, 'a_reactive_power', 0, '超级管理员', '2018-05-11 15:39:58', '超级管理员', '2018-05-11 15:39:58', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (280, '900000000040', 5, '1007', 1002, 139, 'b_reactive_power', 0, '超级管理员', '2018-05-11 15:40:17', '超级管理员', '2018-05-11 15:40:17', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (281, '900000000040', 5, '1007', 1002, 140, 'c_reactive_power', 0, '超级管理员', '2018-05-11 15:40:37', '超级管理员', '2018-05-11 15:40:37', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (282, '900000000040', 5, '1007', 1002, 141, 'total_reactive_power', 0, '超级管理员', '2018-05-11 15:41:05', '超级管理员', '2018-05-11 15:41:05', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (283, '900000000040', 5, '1007', 1002, 142, 'a_ap_power', 0, '超级管理员', '2018-05-11 15:41:37', '超级管理员', '2018-05-11 15:41:37', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (284, '900000000040', 5, '1007', 1002, 143, 'b_ap_power', 0, '超级管理员', '2018-05-11 15:42:27', '超级管理员', '2018-05-11 15:42:27', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (285, '900000000040', 5, '1007', 1002, 144, 'c_ap_power', 0, '超级管理员', '2018-05-11 15:42:56', '超级管理员', '2018-05-11 15:42:56', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (286, '900000000040', 5, '1007', 1002, 145, 'total_ap_power', 0, '超级管理员', '2018-05-11 15:43:23', '超级管理员', '2018-05-11 15:43:23', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (287, '900000000040', 5, '1007', 1002, 146, 'a_power_factor', 0, '超级管理员', '2018-05-11 15:43:57', '超级管理员', '2018-05-11 15:43:57', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (288, '900000000040', 5, '1007', 1002, 147, 'b_power_factor', 0, '超级管理员', '2018-05-11 15:44:20', '超级管理员', '2018-05-11 15:44:20', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (289, '900000000040', 5, '1007', 1002, 148, 'c_power_factor', 0, '超级管理员', '2018-05-11 15:44:44', '超级管理员', '2018-05-11 16:08:57', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (290, '900000000040', 5, '1007', 1002, 149, 'total_power_factor', 0, '超级管理员', '2018-05-11 15:45:02', '超级管理员', '2018-05-11 15:45:02', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (291, '900000000040', 5, '1007', 1002, 150, 'frequency', 0, '超级管理员', '2018-05-11 15:45:22', '超级管理员', '2018-05-11 15:45:22', '2018-05-14 03:58:10');
INSERT INTO `equipment_meter_config_field` VALUES (292, '900000000040', 5, '1007', 1002, 151, 'total_p_at_ee', 0, '超级管理员', '2018-05-14 06:40:58', '超级管理员', '2018-05-14 06:40:58', '2018-05-14 06:40:57');
INSERT INTO `equipment_meter_config_field` VALUES (293, '900000000040', 5, '1007', 1002, 152, 'total_r_at_ee', 0, '超级管理员', '2018-05-14 06:42:23', '超级管理员', '2018-05-14 06:42:23', '2018-05-14 06:42:22');
INSERT INTO `equipment_meter_config_field` VALUES (294, '900000000040', 5, '1007', 1002, 153, 'total_p_reat_ee', 0, '超级管理员', '2018-05-14 06:43:13', '超级管理员', '2018-05-14 06:43:13', '2018-05-14 06:43:13');
INSERT INTO `equipment_meter_config_field` VALUES (295, '900000000040', 5, '1007', 1002, 154, 'total_r_reat_ee', 0, '超级管理员', '2018-05-14 06:44:11', '超级管理员', '2018-05-14 06:44:11', '2018-05-14 06:44:10');
INSERT INTO `equipment_meter_config_field` VALUES (296, '900000000040', 5, '1007', 1002, 155, 'total_ap_a_ee', 0, '超级管理员', '2018-05-14 06:44:47', '超级管理员', '2018-05-14 06:44:47', '2018-05-14 06:44:46');
INSERT INTO `equipment_meter_config_field` VALUES (297, '900000000041', 1, '1009', 1002, 1, 'a_active_power', 0, 'root', '2018-01-30 16:00:14', 'root', '2018-01-30 16:00:14', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (298, '900000000041', 1, '1009', 1002, 2, 'b_active_power', 0, 'root', '2018-01-30 16:02:28', 'root', '2018-01-30 16:02:28', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (299, '900000000041', 1, '1009', 1002, 3, 'c_active_power', 0, 'root', '2018-01-30 16:03:31', 'root', '2018-01-30 16:03:31', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (300, '900000000041', 1, '1009', 1002, 4, 'total_active_power', 0, 'root', '2018-01-30 16:03:31', 'root', '2018-01-30 16:03:31', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (301, '900000000041', 1, '1009', 1002, 5, 'a_reactive_power', 0, 'root', '2018-01-30 16:03:31', 'root', '2018-01-30 16:03:31', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (302, '900000000041', 1, '1009', 1002, 6, 'b_reactive_power', 0, 'root', '2018-01-30 16:04:49', '超级管理员', '2018-05-28 10:16:42', '2018-05-28 10:16:41');
INSERT INTO `equipment_meter_config_field` VALUES (303, '900000000041', 1, '1009', 1002, 7, 'c_reactive_power', 0, 'root', '2018-01-30 16:04:49', 'root', '2018-01-30 16:04:49', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (304, '900000000041', 1, '1009', 1002, 8, 'total_reactive_power', 0, 'root', '2018-01-30 16:04:49', 'root', '2018-01-30 16:04:49', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (305, '900000000041', 1, '1009', 1002, 9, 'a_ap_power', 0, 'root', '2018-01-30 16:07:00', 'root', '2018-01-30 16:07:00', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (306, '900000000041', 1, '1009', 1002, 10, 'b_ap_power', 0, 'root', '2018-01-30 16:07:00', 'root', '2018-01-30 16:07:00', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (307, '900000000041', 1, '1009', 1002, 11, 'c_ap_power', 0, 'root', '2018-01-30 16:07:00', 'root', '2018-01-30 16:07:00', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (308, '900000000041', 1, '1009', 1002, 12, 'total_ap_power', 0, 'root', '2018-01-30 16:07:33', 'root', '2018-01-30 16:07:33', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (309, '900000000041', 1, '1009', 1002, 13, 'a_voltage', 0, 'root', '2018-01-30 16:07:33', 'root', '2018-01-30 16:07:33', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (310, '900000000041', 1, '1009', 1002, 14, 'b_voltage', 0, 'root', '2018-01-30 16:07:33', 'root', '2018-01-30 16:07:33', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (311, '900000000041', 1, '1009', 1002, 15, 'c_voltage', 0, 'root', '2018-01-30 16:07:52', 'root', '2018-01-30 16:07:52', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (312, '900000000041', 1, '1009', 1002, 16, 'a_electricity', 0, 'root', '2018-01-30 16:07:52', 'root', '2018-01-30 16:07:52', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (313, '900000000041', 1, '1009', 1002, 17, 'b_electricity', 0, 'root', '2018-01-30 16:07:52', 'root', '2018-01-30 16:07:52', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (314, '900000000041', 1, '1009', 1002, 18, 'c_electricity', 0, 'root', '2018-01-30 16:08:14', 'root', '2018-01-30 16:08:14', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (315, '900000000041', 1, '1009', 1002, 19, 'a_power_factor', 0, 'root', '2018-01-30 16:08:14', 'root', '2018-01-30 16:08:14', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (316, '900000000041', 1, '1009', 1002, 20, 'b_power_factor', 0, 'root', '2018-01-30 16:08:14', 'root', '2018-01-30 16:08:14', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (317, '900000000041', 1, '1009', 1002, 21, 'c_power_factor', 0, 'root', '2018-01-30 16:08:53', 'root', '2018-01-30 16:08:53', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (318, '900000000041', 1, '1009', 1002, 22, 'total_power_factor', 0, 'root', '2018-01-30 16:08:53', 'root', '2018-01-30 16:08:53', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (319, '900000000041', 1, '1009', 1002, 23, 'frequency', 0, 'root', '2018-01-30 16:08:53', 'root', '2018-01-30 16:08:53', '2018-01-30 16:13:15');
INSERT INTO `equipment_meter_config_field` VALUES (320, '900000000041', 1, '1009', 1002, 24, 'total_p_at_ee', 0, 'root', '2018-01-30 16:09:36', 'root', '2018-01-30 16:09:36', '2018-02-01 16:31:02');
INSERT INTO `equipment_meter_config_field` VALUES (321, '900000000041', 1, '1009', 1002, 25, 'total_r_at_ee', 0, 'root', '2018-01-30 16:09:36', 'root', '2018-01-30 16:09:36', '2018-02-01 16:31:05');
INSERT INTO `equipment_meter_config_field` VALUES (322, '900000000041', 1, '1009', 1002, 26, 'total_p_reat_ee', 0, 'root', '2018-01-30 16:10:03', 'root', '2018-01-30 16:10:03', '2018-02-01 16:31:07');
INSERT INTO `equipment_meter_config_field` VALUES (323, '900000000041', 1, '1009', 1002, 27, 'total_r_reat_ee', 0, 'root', '2018-01-30 16:10:03', 'root', '2018-01-30 16:10:03', '2018-02-01 16:31:10');
INSERT INTO `equipment_meter_config_field` VALUES (324, '900000000041', 1, '1009', 1002, 28, 'total_at_ee', 0, 'root', '2018-01-30 16:10:03', 'root', '2018-01-30 16:10:03', '2018-02-01 16:31:12');
INSERT INTO `equipment_meter_config_field` VALUES (325, '900000000041', 1, '1009', 1002, 29, 'total_p_reat_ee', 0, 'root', '2018-01-30 16:10:28', 'root', '2018-01-30 16:10:28', '2018-02-01 16:31:15');
INSERT INTO `equipment_meter_config_field` VALUES (326, '900000000041', 1, '1009', 1002, 30, 'total_ap_a_ee', 0, 'root', '2018-01-30 16:10:28', 'root', '2018-01-30 16:10:28', '2018-02-01 16:31:17');
INSERT INTO `equipment_meter_config_field` VALUES (327, '900000000042', 1, '1004', 1002, 1, 'a_active_power', 0, NULL, '2018-05-24 09:44:56', NULL, '2018-05-24 09:44:56', '2018-05-24 09:44:56');
INSERT INTO `equipment_meter_config_field` VALUES (328, '900000000042', 1, '1004', 1002, 2, 'b_active_power', 0, NULL, '2018-05-24 09:44:56', NULL, '2018-05-24 09:44:56', '2018-05-24 09:44:56');
INSERT INTO `equipment_meter_config_field` VALUES (329, '900000000042', 1, '1004', 1002, 3, 'c_active_power', 0, NULL, '2018-05-24 09:44:56', NULL, '2018-05-24 09:44:56', '2018-05-24 09:44:56');
INSERT INTO `equipment_meter_config_field` VALUES (330, '900000000042', 1, '1004', 1002, 4, 'total_active_power', 0, NULL, '2018-05-24 09:44:56', NULL, '2018-05-24 09:44:56', '2018-05-24 09:44:56');
INSERT INTO `equipment_meter_config_field` VALUES (331, '900000000042', 1, '1004', 1002, 5, 'a_reactive_power', 0, NULL, '2018-05-24 09:44:56', NULL, '2018-05-24 09:44:56', '2018-05-24 09:44:56');
INSERT INTO `equipment_meter_config_field` VALUES (332, '900000000042', 1, '1004', 1002, 1, 'b_reactive_power', 0, NULL, '2018-05-24 09:44:56', NULL, '2018-05-24 09:44:56', '2018-05-24 09:44:56');
INSERT INTO `equipment_meter_config_field` VALUES (333, '900000000042', 1, '1004', 1002, 7, 'c_reactive_power', 0, NULL, '2018-05-24 09:44:56', NULL, '2018-05-24 09:44:56', '2018-05-24 09:44:56');
INSERT INTO `equipment_meter_config_field` VALUES (334, '900000000042', 1, '1004', 1002, 8, 'total_reactive_power', 0, NULL, '2018-05-24 09:44:57', NULL, '2018-05-24 09:44:57', '2018-05-24 09:44:57');
INSERT INTO `equipment_meter_config_field` VALUES (335, '900000000042', 1, '1004', 1002, 9, 'a_ap_power', 0, NULL, '2018-05-24 09:44:57', NULL, '2018-05-24 09:44:57', '2018-05-24 09:44:57');
INSERT INTO `equipment_meter_config_field` VALUES (336, '900000000042', 1, '1004', 1002, 10, 'b_ap_power', 0, NULL, '2018-05-24 09:44:57', NULL, '2018-05-24 09:44:57', '2018-05-24 09:44:57');
INSERT INTO `equipment_meter_config_field` VALUES (337, '900000000042', 1, '1004', 1002, 11, 'c_ap_power', 0, NULL, '2018-05-24 09:44:57', NULL, '2018-05-24 09:44:57', '2018-05-24 09:44:57');
INSERT INTO `equipment_meter_config_field` VALUES (338, '900000000042', 1, '1004', 1002, 12, 'total_ap_power', 0, NULL, '2018-05-24 09:44:57', NULL, '2018-05-24 09:44:57', '2018-05-24 09:44:57');
INSERT INTO `equipment_meter_config_field` VALUES (339, '900000000042', 1, '1004', 1002, 13, 'a_voltage', 0, NULL, '2018-05-24 09:44:57', NULL, '2018-05-24 09:44:57', '2018-05-24 09:44:57');
INSERT INTO `equipment_meter_config_field` VALUES (340, '900000000042', 1, '1004', 1002, 14, 'b_voltage', 0, NULL, '2018-05-24 09:44:57', NULL, '2018-05-24 09:44:57', '2018-05-24 09:44:57');
INSERT INTO `equipment_meter_config_field` VALUES (341, '900000000042', 1, '1004', 1002, 15, 'c_voltage', 0, NULL, '2018-05-24 09:44:57', NULL, '2018-05-24 09:44:57', '2018-05-24 09:44:57');
INSERT INTO `equipment_meter_config_field` VALUES (342, '900000000042', 1, '1004', 1002, 16, 'a_electricity', 0, NULL, '2018-05-24 09:44:57', NULL, '2018-05-24 09:44:57', '2018-05-24 09:44:57');
INSERT INTO `equipment_meter_config_field` VALUES (343, '900000000042', 1, '1004', 1002, 17, 'b_electricity', 0, NULL, '2018-05-24 09:44:57', NULL, '2018-05-24 09:44:57', '2018-05-24 09:44:57');
INSERT INTO `equipment_meter_config_field` VALUES (344, '900000000042', 1, '1004', 1002, 18, 'c_electricity', 0, NULL, '2018-05-24 09:44:57', NULL, '2018-05-24 09:44:57', '2018-05-24 09:44:57');
INSERT INTO `equipment_meter_config_field` VALUES (345, '900000000042', 1, '1004', 1002, 19, 'a_power_factor', 0, NULL, '2018-05-24 09:44:57', NULL, '2018-05-24 09:44:57', '2018-05-24 09:44:57');
INSERT INTO `equipment_meter_config_field` VALUES (346, '900000000042', 1, '1004', 1002, 20, 'b_power_factor', 0, NULL, '2018-05-24 09:44:57', NULL, '2018-05-24 09:44:57', '2018-05-24 09:44:57');
INSERT INTO `equipment_meter_config_field` VALUES (347, '900000000042', 1, '1004', 1002, 21, 'c_power_factor', 0, NULL, '2018-05-24 09:44:57', NULL, '2018-05-24 09:44:57', '2018-05-24 09:44:57');
INSERT INTO `equipment_meter_config_field` VALUES (348, '900000000042', 1, '1004', 1002, 22, 'total_power_factor', 0, NULL, '2018-05-24 09:44:57', NULL, '2018-05-24 09:44:57', '2018-05-24 09:44:57');
INSERT INTO `equipment_meter_config_field` VALUES (349, '900000000042', 1, '1004', 1002, 23, 'frequency', 0, NULL, '2018-05-24 09:44:57', NULL, '2018-05-24 09:44:57', '2018-05-24 09:44:57');
INSERT INTO `equipment_meter_config_field` VALUES (350, '900000000042', 1, '1004', 1002, 24, 'total_p_at_ee', 0, NULL, '2018-05-24 09:44:57', NULL, '2018-05-24 09:44:57', '2018-05-24 09:44:57');
INSERT INTO `equipment_meter_config_field` VALUES (351, '900000000042', 1, '1004', 1002, 25, 'total_r_at_ee', 0, NULL, '2018-05-24 09:44:57', NULL, '2018-05-24 09:44:57', '2018-05-24 09:44:57');
INSERT INTO `equipment_meter_config_field` VALUES (352, '900000000042', 1, '1004', 1002, 26, 'total_p_reat_ee', 0, NULL, '2018-05-24 09:44:57', NULL, '2018-05-24 09:44:57', '2018-05-24 09:44:57');
INSERT INTO `equipment_meter_config_field` VALUES (353, '900000000042', 1, '1004', 1002, 27, 'total_r_reat_ee', 0, NULL, '2018-05-24 09:44:57', NULL, '2018-05-24 09:44:57', '2018-05-24 09:44:57');
INSERT INTO `equipment_meter_config_field` VALUES (354, '900000000042', 1, '1004', 1002, 28, 'total_at_ee', 0, NULL, '2018-05-24 09:44:57', NULL, '2018-05-24 09:44:57', '2018-05-24 09:44:57');
INSERT INTO `equipment_meter_config_field` VALUES (355, '900000000042', 1, '1004', 1002, 29, 'total_p_reat_ee', 0, NULL, '2018-05-24 09:44:57', NULL, '2018-05-24 09:44:57', '2018-05-24 09:44:57');
INSERT INTO `equipment_meter_config_field` VALUES (356, '900000000042', 1, '1004', 1002, 30, 'total_ap_a_ee', 0, NULL, '2018-05-24 09:44:57', NULL, '2018-05-24 09:44:57', '2018-05-24 09:44:57');
INSERT INTO `equipment_meter_config_field` VALUES (357, '900000000042', 1, '1004', 1002, 31, 'uab_line_voltage', 0, NULL, '2018-05-24 09:44:57', NULL, '2018-05-24 09:44:57', '2018-05-24 09:44:57');
INSERT INTO `equipment_meter_config_field` VALUES (358, '900000000042', 1, '1004', 1002, 32, 'ubc_line_voltage', 0, NULL, '2018-05-24 09:44:58', NULL, '2018-05-24 09:44:58', '2018-05-24 09:44:58');
INSERT INTO `equipment_meter_config_field` VALUES (359, '900000000042', 1, '1004', 1002, 33, 'uac_line_voltage', 0, NULL, '2018-05-24 09:44:58', NULL, '2018-05-24 09:44:58', '2018-05-24 09:44:58');
INSERT INTO `equipment_meter_config_field` VALUES (360, '900000000042', 2, '1004', 1002, 34, 'a_active_power', 0, NULL, '2018-05-24 09:44:58', NULL, '2018-05-24 09:44:58', '2018-05-24 09:44:58');
INSERT INTO `equipment_meter_config_field` VALUES (361, '900000000042', 2, '1004', 1002, 35, 'b_active_power', 0, NULL, '2018-05-24 09:44:58', NULL, '2018-05-24 09:44:58', '2018-05-24 09:44:58');
INSERT INTO `equipment_meter_config_field` VALUES (362, '900000000042', 2, '1004', 1002, 36, 'c_active_power', 0, NULL, '2018-05-24 09:44:58', NULL, '2018-05-24 09:44:58', '2018-05-24 09:44:58');
INSERT INTO `equipment_meter_config_field` VALUES (363, '900000000042', 2, '1004', 1002, 37, 'total_active_power', 0, NULL, '2018-05-24 09:44:58', NULL, '2018-05-24 09:44:58', '2018-05-24 09:44:58');
INSERT INTO `equipment_meter_config_field` VALUES (364, '900000000042', 2, '1004', 1002, 38, 'a_reactive_power', 0, NULL, '2018-05-24 09:44:58', NULL, '2018-05-24 09:44:58', '2018-05-24 09:44:58');
INSERT INTO `equipment_meter_config_field` VALUES (365, '900000000042', 2, '1004', 1002, 39, 'b_reactive_power', 0, NULL, '2018-05-24 09:44:58', NULL, '2018-05-24 09:44:58', '2018-05-24 09:44:58');
INSERT INTO `equipment_meter_config_field` VALUES (366, '900000000042', 2, '1004', 1002, 40, 'c_reactive_power', 0, NULL, '2018-05-24 09:44:58', NULL, '2018-05-24 09:44:58', '2018-05-24 09:44:58');
INSERT INTO `equipment_meter_config_field` VALUES (367, '900000000042', 2, '1004', 1002, 41, 'total_reactive_power', 0, NULL, '2018-05-24 09:44:58', NULL, '2018-05-24 09:44:58', '2018-05-24 09:44:58');
INSERT INTO `equipment_meter_config_field` VALUES (368, '900000000042', 2, '1004', 1002, 42, 'a_ap_power', 0, NULL, '2018-05-24 09:44:58', NULL, '2018-05-24 09:44:58', '2018-05-24 09:44:58');
INSERT INTO `equipment_meter_config_field` VALUES (369, '900000000042', 2, '1004', 1002, 43, 'b_ap_power', 0, NULL, '2018-05-24 09:44:58', NULL, '2018-05-24 09:44:58', '2018-05-24 09:44:58');
INSERT INTO `equipment_meter_config_field` VALUES (370, '900000000042', 2, '1004', 1002, 44, 'c_ap_power', 0, NULL, '2018-05-24 09:44:58', NULL, '2018-05-24 09:44:58', '2018-05-24 09:44:58');
INSERT INTO `equipment_meter_config_field` VALUES (371, '900000000042', 2, '1004', 1002, 45, 'total_ap_power', 0, NULL, '2018-05-24 09:44:58', NULL, '2018-05-24 09:44:58', '2018-05-24 09:44:58');
INSERT INTO `equipment_meter_config_field` VALUES (372, '900000000042', 2, '1004', 1002, 46, 'a_voltage', 0, NULL, '2018-05-24 09:44:58', NULL, '2018-05-24 09:44:58', '2018-05-24 09:44:58');
INSERT INTO `equipment_meter_config_field` VALUES (373, '900000000042', 2, '1004', 1002, 47, 'b_voltage', 0, NULL, '2018-05-24 09:44:58', NULL, '2018-05-24 09:44:58', '2018-05-24 09:44:58');
INSERT INTO `equipment_meter_config_field` VALUES (374, '900000000042', 2, '1004', 1002, 48, 'c_voltage', 0, NULL, '2018-05-24 09:44:58', NULL, '2018-05-24 09:44:58', '2018-05-24 09:44:58');
INSERT INTO `equipment_meter_config_field` VALUES (375, '900000000042', 2, '1004', 1002, 49, 'a_electricity', 0, NULL, '2018-05-24 09:44:58', NULL, '2018-05-24 09:44:58', '2018-05-24 09:44:58');
INSERT INTO `equipment_meter_config_field` VALUES (376, '900000000042', 2, '1004', 1002, 50, 'b_electricity', 0, NULL, '2018-05-24 09:44:58', NULL, '2018-05-24 09:44:58', '2018-05-24 09:44:58');
INSERT INTO `equipment_meter_config_field` VALUES (377, '900000000042', 2, '1004', 1002, 51, 'c_electricity', 0, NULL, '2018-05-24 09:44:58', NULL, '2018-05-24 09:44:58', '2018-05-24 09:44:58');
INSERT INTO `equipment_meter_config_field` VALUES (378, '900000000042', 2, '1004', 1002, 52, 'a_power_factor', 0, NULL, '2018-05-24 09:44:58', NULL, '2018-05-24 09:44:58', '2018-05-24 09:44:58');
INSERT INTO `equipment_meter_config_field` VALUES (379, '900000000042', 2, '1004', 1002, 53, 'b_power_factor', 0, NULL, '2018-05-24 09:44:58', NULL, '2018-05-24 09:44:58', '2018-05-24 09:44:58');
INSERT INTO `equipment_meter_config_field` VALUES (380, '900000000042', 2, '1004', 1002, 54, 'c_power_factor', 0, NULL, '2018-05-24 09:44:58', NULL, '2018-05-24 09:44:58', '2018-05-24 09:44:58');
INSERT INTO `equipment_meter_config_field` VALUES (381, '900000000042', 2, '1004', 1002, 55, 'total_power_factor', 0, NULL, '2018-05-24 09:44:58', NULL, '2018-05-24 09:44:58', '2018-05-24 09:44:58');
INSERT INTO `equipment_meter_config_field` VALUES (382, '900000000042', 2, '1004', 1002, 56, 'frequency', 0, NULL, '2018-05-24 09:44:58', NULL, '2018-05-24 09:44:58', '2018-05-24 09:44:58');
INSERT INTO `equipment_meter_config_field` VALUES (383, '900000000042', 2, '1004', 1002, 57, 'total_p_at_ee', 0, NULL, '2018-05-24 09:44:59', NULL, '2018-05-24 09:44:59', '2018-05-24 09:44:59');
INSERT INTO `equipment_meter_config_field` VALUES (384, '900000000042', 2, '1004', 1002, 58, 'total_r_at_ee', 0, NULL, '2018-05-24 09:44:59', NULL, '2018-05-24 09:44:59', '2018-05-24 09:44:59');
INSERT INTO `equipment_meter_config_field` VALUES (385, '900000000042', 2, '1004', 1002, 59, 'total_p_reat_ee', 0, NULL, '2018-05-24 09:44:59', NULL, '2018-05-24 09:44:59', '2018-05-24 09:44:59');
INSERT INTO `equipment_meter_config_field` VALUES (386, '900000000042', 2, '1004', 1002, 60, 'total_r_reat_ee', 0, NULL, '2018-05-24 09:44:59', NULL, '2018-05-24 09:44:59', '2018-05-24 09:44:59');
INSERT INTO `equipment_meter_config_field` VALUES (387, '900000000042', 2, '1004', 1002, 61, 'total_at_ee', 0, NULL, '2018-05-24 09:44:59', NULL, '2018-05-24 09:44:59', '2018-05-24 09:44:59');
INSERT INTO `equipment_meter_config_field` VALUES (388, '900000000042', 2, '1004', 1002, 62, 'total_p_reat_ee', 0, NULL, '2018-05-24 09:44:59', NULL, '2018-05-24 09:44:59', '2018-05-24 09:44:59');
INSERT INTO `equipment_meter_config_field` VALUES (389, '900000000042', 2, '1004', 1002, 63, 'total_ap_a_ee', 0, NULL, '2018-05-24 09:44:59', NULL, '2018-05-24 09:44:59', '2018-05-24 09:44:59');
INSERT INTO `equipment_meter_config_field` VALUES (390, '900000000042', 2, '1004', 1002, 64, 'uab_line_voltage', 0, NULL, '2018-05-24 09:44:59', NULL, '2018-05-24 09:44:59', '2018-05-24 09:44:59');
INSERT INTO `equipment_meter_config_field` VALUES (391, '900000000042', 2, '1004', 1002, 65, 'ubc_line_voltage', 0, NULL, '2018-05-24 09:44:59', NULL, '2018-05-24 09:44:59', '2018-05-24 09:44:59');
INSERT INTO `equipment_meter_config_field` VALUES (392, '900000000042', 2, '1004', 1002, 66, 'uac_line_voltage', 0, NULL, '2018-05-24 09:44:59', NULL, '2018-05-24 09:44:59', '2018-05-24 09:44:59');
INSERT INTO `equipment_meter_config_field` VALUES (393, '900000000042', 3, '1004', 1002, 67, 'a_active_power', 0, NULL, '2018-05-24 09:44:59', NULL, '2018-05-24 09:44:59', '2018-05-24 09:44:59');
INSERT INTO `equipment_meter_config_field` VALUES (394, '900000000042', 3, '1004', 1002, 68, 'b_active_power', 0, NULL, '2018-05-24 09:44:59', NULL, '2018-05-24 09:44:59', '2018-05-24 09:44:59');
INSERT INTO `equipment_meter_config_field` VALUES (395, '900000000042', 3, '1004', 1002, 69, 'c_active_power', 0, NULL, '2018-05-24 09:44:59', NULL, '2018-05-24 09:44:59', '2018-05-24 09:44:59');
INSERT INTO `equipment_meter_config_field` VALUES (396, '900000000042', 3, '1004', 1002, 70, 'total_active_power', 0, NULL, '2018-05-24 09:44:59', NULL, '2018-05-24 09:44:59', '2018-05-24 09:44:59');
INSERT INTO `equipment_meter_config_field` VALUES (397, '900000000042', 3, '1004', 1002, 71, 'a_reactive_power', 0, NULL, '2018-05-24 09:44:59', NULL, '2018-05-24 09:44:59', '2018-05-24 09:44:59');
INSERT INTO `equipment_meter_config_field` VALUES (398, '900000000042', 3, '1004', 1002, 72, 'b_reactive_power', 0, NULL, '2018-05-24 09:44:59', NULL, '2018-05-24 09:44:59', '2018-05-24 09:44:59');
INSERT INTO `equipment_meter_config_field` VALUES (399, '900000000042', 3, '1004', 1002, 73, 'c_reactive_power', 0, NULL, '2018-05-24 09:44:59', NULL, '2018-05-24 09:44:59', '2018-05-24 09:44:59');
INSERT INTO `equipment_meter_config_field` VALUES (400, '900000000042', 3, '1004', 1002, 74, 'total_reactive_power', 0, NULL, '2018-05-24 09:44:59', NULL, '2018-05-24 09:44:59', '2018-05-24 09:44:59');
INSERT INTO `equipment_meter_config_field` VALUES (401, '900000000042', 3, '1004', 1002, 75, 'a_ap_power', 0, NULL, '2018-05-24 09:44:59', NULL, '2018-05-24 09:44:59', '2018-05-24 09:44:59');
INSERT INTO `equipment_meter_config_field` VALUES (402, '900000000042', 3, '1004', 1002, 76, 'b_ap_power', 0, NULL, '2018-05-24 09:44:59', NULL, '2018-05-24 09:44:59', '2018-05-24 09:44:59');
INSERT INTO `equipment_meter_config_field` VALUES (403, '900000000042', 3, '1004', 1002, 77, 'c_ap_power', 0, NULL, '2018-05-24 09:44:59', NULL, '2018-05-24 09:44:59', '2018-05-24 09:44:59');
INSERT INTO `equipment_meter_config_field` VALUES (404, '900000000042', 3, '1004', 1002, 78, 'total_ap_power', 0, NULL, '2018-05-24 09:44:59', NULL, '2018-05-24 09:44:59', '2018-05-24 09:44:59');
INSERT INTO `equipment_meter_config_field` VALUES (405, '900000000042', 3, '1004', 1002, 79, 'a_voltage', 0, NULL, '2018-05-24 09:44:59', NULL, '2018-05-24 09:44:59', '2018-05-24 09:44:59');
INSERT INTO `equipment_meter_config_field` VALUES (406, '900000000042', 3, '1004', 1002, 80, 'b_voltage', 0, NULL, '2018-05-24 09:44:59', NULL, '2018-05-24 09:44:59', '2018-05-24 09:44:59');
INSERT INTO `equipment_meter_config_field` VALUES (407, '900000000042', 3, '1004', 1002, 81, 'c_voltage', 0, NULL, '2018-05-24 09:45:00', NULL, '2018-05-24 09:45:00', '2018-05-24 09:45:00');
INSERT INTO `equipment_meter_config_field` VALUES (408, '900000000042', 3, '1004', 1002, 82, 'a_electricity', 0, NULL, '2018-05-24 09:45:00', NULL, '2018-05-24 09:45:00', '2018-05-24 09:45:00');
INSERT INTO `equipment_meter_config_field` VALUES (409, '900000000042', 3, '1004', 1002, 83, 'b_electricity', 0, NULL, '2018-05-24 09:45:00', NULL, '2018-05-24 09:45:00', '2018-05-24 09:45:00');
INSERT INTO `equipment_meter_config_field` VALUES (410, '900000000042', 3, '1004', 1002, 84, 'c_electricity', 0, NULL, '2018-05-24 09:45:00', NULL, '2018-05-24 09:45:00', '2018-05-24 09:45:00');
INSERT INTO `equipment_meter_config_field` VALUES (411, '900000000042', 3, '1004', 1002, 85, 'a_power_factor', 0, NULL, '2018-05-24 09:45:00', NULL, '2018-05-24 09:45:00', '2018-05-24 09:45:00');
INSERT INTO `equipment_meter_config_field` VALUES (412, '900000000042', 3, '1004', 1002, 86, 'b_power_factor', 0, NULL, '2018-05-24 09:45:00', NULL, '2018-05-24 09:45:00', '2018-05-24 09:45:00');
INSERT INTO `equipment_meter_config_field` VALUES (413, '900000000042', 3, '1004', 1002, 87, 'c_power_factor', 0, NULL, '2018-05-24 09:45:00', NULL, '2018-05-24 09:45:00', '2018-05-24 09:45:00');
INSERT INTO `equipment_meter_config_field` VALUES (414, '900000000042', 3, '1004', 1002, 88, 'total_power_factor', 0, NULL, '2018-05-24 09:45:00', NULL, '2018-05-24 09:45:00', '2018-05-24 09:45:00');
INSERT INTO `equipment_meter_config_field` VALUES (415, '900000000042', 3, '1004', 1002, 89, 'frequency', 0, NULL, '2018-05-24 09:45:00', NULL, '2018-05-24 09:45:00', '2018-05-24 09:45:00');
INSERT INTO `equipment_meter_config_field` VALUES (416, '900000000042', 3, '1004', 1002, 90, 'total_p_at_ee', 0, NULL, '2018-05-24 09:45:00', NULL, '2018-05-24 09:45:00', '2018-05-24 09:45:00');
INSERT INTO `equipment_meter_config_field` VALUES (417, '900000000042', 3, '1004', 1002, 91, 'total_r_at_ee', 0, NULL, '2018-05-24 09:45:00', NULL, '2018-05-24 09:45:00', '2018-05-24 09:45:00');
INSERT INTO `equipment_meter_config_field` VALUES (418, '900000000042', 3, '1004', 1002, 92, 'total_p_reat_ee', 0, NULL, '2018-05-24 09:45:00', NULL, '2018-05-24 09:45:00', '2018-05-24 09:45:00');
INSERT INTO `equipment_meter_config_field` VALUES (419, '900000000042', 3, '1004', 1002, 93, 'total_r_reat_ee', 0, NULL, '2018-05-24 09:45:00', NULL, '2018-05-24 09:45:00', '2018-05-24 09:45:00');
INSERT INTO `equipment_meter_config_field` VALUES (420, '900000000042', 3, '1004', 1002, 94, 'total_at_ee', 0, NULL, '2018-05-24 09:45:00', NULL, '2018-05-24 09:45:00', '2018-05-24 09:45:00');
INSERT INTO `equipment_meter_config_field` VALUES (421, '900000000042', 3, '1004', 1002, 95, 'total_p_reat_ee', 0, NULL, '2018-05-24 09:45:00', NULL, '2018-05-24 09:45:00', '2018-05-24 09:45:00');
INSERT INTO `equipment_meter_config_field` VALUES (422, '900000000042', 3, '1004', 1002, 96, 'total_ap_a_ee', 0, NULL, '2018-05-24 09:45:00', NULL, '2018-05-24 09:45:00', '2018-05-24 09:45:00');
INSERT INTO `equipment_meter_config_field` VALUES (423, '900000000042', 3, '1004', 1002, 97, 'uab_line_voltage', 0, NULL, '2018-05-24 09:45:00', NULL, '2018-05-24 09:45:00', '2018-05-24 09:45:00');
INSERT INTO `equipment_meter_config_field` VALUES (424, '900000000042', 3, '1004', 1002, 98, 'ubc_line_voltage', 0, NULL, '2018-05-24 09:45:00', NULL, '2018-05-24 09:45:00', '2018-05-24 09:45:00');
INSERT INTO `equipment_meter_config_field` VALUES (425, '900000000042', 3, '1004', 1002, 99, 'uac_line_voltage', 0, NULL, '2018-05-24 09:45:00', NULL, '2018-05-24 09:45:00', '2018-05-24 09:45:00');
INSERT INTO `equipment_meter_config_field` VALUES (426, '900000000042', 6, '1004', 1002, 100, 'a_active_power', 0, NULL, '2018-05-24 09:45:00', NULL, '2018-05-24 09:45:00', '2018-05-24 09:45:00');
INSERT INTO `equipment_meter_config_field` VALUES (427, '900000000042', 6, '1004', 1002, 101, 'b_active_power', 0, NULL, '2018-05-24 09:45:00', NULL, '2018-05-24 09:45:00', '2018-05-24 09:45:00');
INSERT INTO `equipment_meter_config_field` VALUES (428, '900000000042', 6, '1004', 1002, 102, 'c_active_power', 0, NULL, '2018-05-24 09:45:00', NULL, '2018-05-24 09:45:00', '2018-05-24 09:45:00');
INSERT INTO `equipment_meter_config_field` VALUES (429, '900000000042', 6, '1004', 1002, 103, 'total_active_power', 0, NULL, '2018-05-24 09:45:00', NULL, '2018-05-24 09:45:00', '2018-05-24 09:45:00');
INSERT INTO `equipment_meter_config_field` VALUES (430, '900000000042', 6, '1004', 1002, 104, 'a_reactive_power', 0, NULL, '2018-05-24 09:45:00', NULL, '2018-05-24 09:45:00', '2018-05-24 09:45:00');
INSERT INTO `equipment_meter_config_field` VALUES (431, '900000000042', 6, '1004', 1002, 105, 'b_reactive_power', 0, NULL, '2018-05-24 09:45:01', NULL, '2018-05-24 09:45:01', '2018-05-24 09:45:01');
INSERT INTO `equipment_meter_config_field` VALUES (432, '900000000042', 6, '1004', 1002, 106, 'c_reactive_power', 0, NULL, '2018-05-24 09:45:01', NULL, '2018-05-24 09:45:01', '2018-05-24 09:45:01');
INSERT INTO `equipment_meter_config_field` VALUES (433, '900000000042', 6, '1004', 1002, 107, 'total_reactive_power', 0, NULL, '2018-05-24 09:45:01', NULL, '2018-05-24 09:45:01', '2018-05-24 09:45:01');
INSERT INTO `equipment_meter_config_field` VALUES (434, '900000000042', 6, '1004', 1002, 108, 'a_ap_power', 0, NULL, '2018-05-24 09:45:01', NULL, '2018-05-24 09:45:01', '2018-05-24 09:45:01');
INSERT INTO `equipment_meter_config_field` VALUES (435, '900000000042', 6, '1004', 1002, 109, 'b_ap_power', 0, NULL, '2018-05-24 09:45:01', NULL, '2018-05-24 09:45:01', '2018-05-24 09:45:01');
INSERT INTO `equipment_meter_config_field` VALUES (436, '900000000042', 6, '1004', 1002, 110, 'c_ap_power', 0, NULL, '2018-05-24 09:45:01', NULL, '2018-05-24 09:45:01', '2018-05-24 09:45:01');
INSERT INTO `equipment_meter_config_field` VALUES (437, '900000000042', 6, '1004', 1002, 111, 'total_ap_power', 0, NULL, '2018-05-24 09:45:01', NULL, '2018-05-24 09:45:01', '2018-05-24 09:45:01');
INSERT INTO `equipment_meter_config_field` VALUES (438, '900000000042', 6, '1004', 1002, 112, 'a_voltage', 0, NULL, '2018-05-24 09:45:01', NULL, '2018-05-24 09:45:01', '2018-05-24 09:45:01');
INSERT INTO `equipment_meter_config_field` VALUES (439, '900000000042', 6, '1004', 1002, 113, 'b_voltage', 0, NULL, '2018-05-24 09:45:01', NULL, '2018-05-24 09:45:01', '2018-05-24 09:45:01');
INSERT INTO `equipment_meter_config_field` VALUES (440, '900000000042', 6, '1004', 1002, 114, 'c_voltage', 0, NULL, '2018-05-24 09:45:01', NULL, '2018-05-24 09:45:01', '2018-05-24 09:45:01');
INSERT INTO `equipment_meter_config_field` VALUES (441, '900000000042', 6, '1004', 1002, 115, 'a_electricity', 0, NULL, '2018-05-24 09:45:01', NULL, '2018-05-24 09:45:01', '2018-05-24 09:45:01');
INSERT INTO `equipment_meter_config_field` VALUES (442, '900000000042', 6, '1004', 1002, 116, 'b_electricity', 0, NULL, '2018-05-24 09:45:01', NULL, '2018-05-24 09:45:01', '2018-05-24 09:45:01');
INSERT INTO `equipment_meter_config_field` VALUES (443, '900000000042', 6, '1004', 1002, 117, 'c_electricity', 0, NULL, '2018-05-24 09:45:01', NULL, '2018-05-24 09:45:01', '2018-05-24 09:45:01');
INSERT INTO `equipment_meter_config_field` VALUES (444, '900000000042', 6, '1004', 1002, 118, 'a_power_factor', 0, NULL, '2018-05-24 09:45:01', NULL, '2018-05-24 09:45:01', '2018-05-24 09:45:01');
INSERT INTO `equipment_meter_config_field` VALUES (445, '900000000042', 6, '1004', 1002, 119, 'b_power_factor', 0, NULL, '2018-05-24 09:45:01', NULL, '2018-05-24 09:45:01', '2018-05-24 09:45:01');
INSERT INTO `equipment_meter_config_field` VALUES (446, '900000000042', 6, '1004', 1002, 120, 'c_power_factor', 0, NULL, '2018-05-24 09:45:01', NULL, '2018-05-24 09:45:01', '2018-05-24 09:45:01');
INSERT INTO `equipment_meter_config_field` VALUES (447, '900000000042', 6, '1004', 1002, 121, 'total_power_factor', 0, NULL, '2018-05-24 09:45:01', NULL, '2018-05-24 09:45:01', '2018-05-24 09:45:01');
INSERT INTO `equipment_meter_config_field` VALUES (448, '900000000042', 6, '1004', 1002, 122, 'frequency', 0, NULL, '2018-05-24 09:45:01', NULL, '2018-05-24 09:45:01', '2018-05-24 09:45:01');
INSERT INTO `equipment_meter_config_field` VALUES (449, '900000000042', 6, '1004', 1002, 123, 'total_p_at_ee', 0, NULL, '2018-05-24 09:45:01', NULL, '2018-05-24 09:45:01', '2018-05-24 09:45:01');
INSERT INTO `equipment_meter_config_field` VALUES (450, '900000000042', 6, '1004', 1002, 124, 'total_r_at_ee', 0, NULL, '2018-05-24 09:45:01', NULL, '2018-05-24 09:45:01', '2018-05-24 09:45:01');
INSERT INTO `equipment_meter_config_field` VALUES (451, '900000000042', 6, '1004', 1002, 125, 'total_p_reat_ee', 0, NULL, '2018-05-24 09:45:01', NULL, '2018-05-24 09:45:01', '2018-05-24 09:45:01');
INSERT INTO `equipment_meter_config_field` VALUES (452, '900000000042', 6, '1004', 1002, 126, 'total_r_reat_ee', 0, NULL, '2018-05-24 09:45:01', NULL, '2018-05-24 09:45:01', '2018-05-24 09:45:01');
INSERT INTO `equipment_meter_config_field` VALUES (453, '900000000042', 6, '1004', 1002, 127, 'total_at_ee', 0, NULL, '2018-05-24 09:45:01', NULL, '2018-05-24 09:45:01', '2018-05-24 09:45:01');
INSERT INTO `equipment_meter_config_field` VALUES (454, '900000000042', 6, '1004', 1002, 128, 'total_p_reat_ee', 0, NULL, '2018-05-24 09:45:01', NULL, '2018-05-24 09:45:01', '2018-05-24 09:45:01');
INSERT INTO `equipment_meter_config_field` VALUES (455, '900000000042', 6, '1004', 1002, 129, 'total_ap_a_ee', 0, NULL, '2018-05-24 09:45:01', NULL, '2018-05-24 09:45:01', '2018-05-24 09:45:01');
INSERT INTO `equipment_meter_config_field` VALUES (456, '900000000042', 6, '1004', 1002, 130, 'uab_line_voltage', 0, NULL, '2018-05-24 09:45:02', NULL, '2018-05-24 09:45:02', '2018-05-24 09:45:02');
INSERT INTO `equipment_meter_config_field` VALUES (457, '900000000042', 6, '1004', 1002, 131, 'ubc_line_voltage', 0, NULL, '2018-05-24 09:45:02', NULL, '2018-05-24 09:45:02', '2018-05-24 09:45:02');
INSERT INTO `equipment_meter_config_field` VALUES (458, '900000000042', 6, '1004', 1002, 132, 'uac_line_voltage', 0, NULL, '2018-05-24 09:45:02', NULL, '2018-05-24 09:45:02', '2018-05-24 09:45:02');
INSERT INTO `equipment_meter_config_field` VALUES (459, '900000000042', 8, '1004', 1002, 133, 'a_active_power', 0, NULL, '2018-05-24 09:45:02', NULL, '2018-05-24 09:45:02', '2018-05-24 09:45:02');
INSERT INTO `equipment_meter_config_field` VALUES (460, '900000000042', 8, '1004', 1002, 134, 'b_active_power', 0, NULL, '2018-05-24 09:45:02', NULL, '2018-05-24 09:45:02', '2018-05-24 09:45:02');
INSERT INTO `equipment_meter_config_field` VALUES (461, '900000000042', 8, '1004', 1002, 135, 'c_active_power', 0, NULL, '2018-05-24 09:45:02', NULL, '2018-05-24 09:45:02', '2018-05-24 09:45:02');
INSERT INTO `equipment_meter_config_field` VALUES (462, '900000000042', 8, '1004', 1002, 136, 'total_active_power', 0, NULL, '2018-05-24 09:45:02', NULL, '2018-05-24 09:45:02', '2018-05-24 09:45:02');
INSERT INTO `equipment_meter_config_field` VALUES (463, '900000000042', 8, '1004', 1002, 137, 'a_reactive_power', 0, NULL, '2018-05-24 09:45:02', NULL, '2018-05-24 09:45:02', '2018-05-24 09:45:02');
INSERT INTO `equipment_meter_config_field` VALUES (464, '900000000042', 8, '1004', 1002, 138, 'b_reactive_power', 0, NULL, '2018-05-24 09:45:02', NULL, '2018-05-24 09:45:02', '2018-05-24 09:45:02');
INSERT INTO `equipment_meter_config_field` VALUES (465, '900000000042', 8, '1004', 1002, 139, 'c_reactive_power', 0, NULL, '2018-05-24 09:45:02', NULL, '2018-05-24 09:45:02', '2018-05-24 09:45:02');
INSERT INTO `equipment_meter_config_field` VALUES (466, '900000000042', 8, '1004', 1002, 140, 'total_reactive_power', 0, NULL, '2018-05-24 09:45:02', NULL, '2018-05-24 09:45:02', '2018-05-24 09:45:02');
INSERT INTO `equipment_meter_config_field` VALUES (467, '900000000042', 8, '1004', 1002, 141, 'a_ap_power', 0, NULL, '2018-05-24 09:45:02', NULL, '2018-05-24 09:45:02', '2018-05-24 09:45:02');
INSERT INTO `equipment_meter_config_field` VALUES (468, '900000000042', 8, '1004', 1002, 142, 'b_ap_power', 0, NULL, '2018-05-24 09:45:02', NULL, '2018-05-24 09:45:02', '2018-05-24 09:45:02');
INSERT INTO `equipment_meter_config_field` VALUES (469, '900000000042', 8, '1004', 1002, 143, 'c_ap_power', 0, NULL, '2018-05-24 09:45:02', NULL, '2018-05-24 09:45:02', '2018-05-24 09:45:02');
INSERT INTO `equipment_meter_config_field` VALUES (470, '900000000042', 8, '1004', 1002, 144, 'total_ap_power', 0, NULL, '2018-05-24 09:45:02', NULL, '2018-05-24 09:45:02', '2018-05-24 09:45:02');
INSERT INTO `equipment_meter_config_field` VALUES (471, '900000000042', 8, '1004', 1002, 145, 'a_voltage', 0, NULL, '2018-05-24 09:45:02', NULL, '2018-05-24 09:45:02', '2018-05-24 09:45:02');
INSERT INTO `equipment_meter_config_field` VALUES (472, '900000000042', 8, '1004', 1002, 146, 'b_voltage', 0, NULL, '2018-05-24 09:45:02', NULL, '2018-05-24 09:45:02', '2018-05-24 09:45:02');
INSERT INTO `equipment_meter_config_field` VALUES (473, '900000000042', 8, '1004', 1002, 147, 'c_voltage', 0, NULL, '2018-05-24 09:45:02', NULL, '2018-05-24 09:45:02', '2018-05-24 09:45:02');
INSERT INTO `equipment_meter_config_field` VALUES (474, '900000000042', 8, '1004', 1002, 148, 'a_electricity', 0, NULL, '2018-05-24 09:45:02', NULL, '2018-05-24 09:45:02', '2018-05-24 09:45:02');
INSERT INTO `equipment_meter_config_field` VALUES (475, '900000000042', 8, '1004', 1002, 149, 'b_electricity', 0, NULL, '2018-05-24 09:45:02', NULL, '2018-05-24 09:45:02', '2018-05-24 09:45:02');
INSERT INTO `equipment_meter_config_field` VALUES (476, '900000000042', 8, '1004', 1002, 150, 'c_electricity', 0, NULL, '2018-05-24 09:45:02', NULL, '2018-05-24 09:45:02', '2018-05-24 09:45:02');
INSERT INTO `equipment_meter_config_field` VALUES (477, '900000000042', 8, '1004', 1002, 151, 'a_power_factor', 0, NULL, '2018-05-24 09:45:02', NULL, '2018-05-24 09:45:02', '2018-05-24 09:45:02');
INSERT INTO `equipment_meter_config_field` VALUES (478, '900000000042', 8, '1004', 1002, 152, 'b_power_factor', 0, NULL, '2018-05-24 09:45:02', NULL, '2018-05-24 09:45:02', '2018-05-24 09:45:02');
INSERT INTO `equipment_meter_config_field` VALUES (479, '900000000042', 8, '1004', 1002, 153, 'c_power_factor', 0, NULL, '2018-05-24 09:45:02', NULL, '2018-05-24 09:45:02', '2018-05-24 09:45:02');
INSERT INTO `equipment_meter_config_field` VALUES (480, '900000000042', 8, '1004', 1002, 154, 'total_power_factor', 0, NULL, '2018-05-24 09:45:03', NULL, '2018-05-24 09:45:03', '2018-05-24 09:45:03');
INSERT INTO `equipment_meter_config_field` VALUES (481, '900000000042', 8, '1004', 1002, 155, 'frequency', 0, NULL, '2018-05-24 09:45:03', NULL, '2018-05-24 09:45:03', '2018-05-24 09:45:03');
INSERT INTO `equipment_meter_config_field` VALUES (482, '900000000042', 8, '1004', 1002, 156, 'total_p_at_ee', 0, NULL, '2018-05-24 09:45:03', NULL, '2018-05-24 09:45:03', '2018-05-24 09:45:03');
INSERT INTO `equipment_meter_config_field` VALUES (483, '900000000042', 8, '1004', 1002, 157, 'total_r_at_ee', 0, NULL, '2018-05-24 09:45:03', NULL, '2018-05-24 09:45:03', '2018-05-24 09:45:03');
INSERT INTO `equipment_meter_config_field` VALUES (484, '900000000042', 8, '1004', 1002, 158, 'total_p_reat_ee', 0, NULL, '2018-05-24 09:45:03', NULL, '2018-05-24 09:45:03', '2018-05-24 09:45:03');
INSERT INTO `equipment_meter_config_field` VALUES (485, '900000000042', 8, '1004', 1002, 159, 'total_r_reat_ee', 0, NULL, '2018-05-24 09:45:03', NULL, '2018-05-24 09:45:03', '2018-05-24 09:45:03');
INSERT INTO `equipment_meter_config_field` VALUES (486, '900000000042', 8, '1004', 1002, 160, 'total_at_ee', 0, NULL, '2018-05-24 09:45:03', NULL, '2018-05-24 09:45:03', '2018-05-24 09:45:03');
INSERT INTO `equipment_meter_config_field` VALUES (487, '900000000042', 8, '1004', 1002, 161, 'total_p_reat_ee', 0, NULL, '2018-05-24 09:45:03', NULL, '2018-05-24 09:45:03', '2018-05-24 09:45:03');
INSERT INTO `equipment_meter_config_field` VALUES (488, '900000000042', 8, '1004', 1002, 162, 'total_ap_a_ee', 0, NULL, '2018-05-24 09:45:03', NULL, '2018-05-24 09:45:03', '2018-05-24 09:45:03');
INSERT INTO `equipment_meter_config_field` VALUES (489, '900000000042', 8, '1004', 1002, 163, 'uab_line_voltage', 0, NULL, '2018-05-24 09:45:03', NULL, '2018-05-24 09:45:03', '2018-05-24 09:45:03');
INSERT INTO `equipment_meter_config_field` VALUES (490, '900000000042', 8, '1004', 1002, 164, 'ubc_line_voltage', 0, NULL, '2018-05-24 09:45:03', NULL, '2018-05-24 09:45:03', '2018-05-24 09:45:03');
INSERT INTO `equipment_meter_config_field` VALUES (491, '900000000042', 8, '1004', 1002, 165, 'uac_line_voltage', 0, NULL, '2018-05-24 09:45:03', NULL, '2018-05-24 09:45:03', '2018-05-24 09:45:03');
INSERT INTO `equipment_meter_config_field` VALUES (492, '900000000042', 9, '1004', 1002, 166, 'a_active_power', 0, NULL, '2018-05-24 09:45:03', NULL, '2018-05-24 09:45:03', '2018-05-24 09:45:03');
INSERT INTO `equipment_meter_config_field` VALUES (493, '900000000042', 9, '1004', 1002, 167, 'b_active_power', 0, NULL, '2018-05-24 09:45:03', NULL, '2018-05-24 09:45:03', '2018-05-24 09:45:03');
INSERT INTO `equipment_meter_config_field` VALUES (494, '900000000042', 9, '1004', 1002, 168, 'c_active_power', 0, NULL, '2018-05-24 09:45:03', NULL, '2018-05-24 09:45:03', '2018-05-24 09:45:03');
INSERT INTO `equipment_meter_config_field` VALUES (495, '900000000042', 9, '1004', 1002, 169, 'total_active_power', 0, NULL, '2018-05-24 09:45:03', NULL, '2018-05-24 09:45:03', '2018-05-24 09:45:03');
INSERT INTO `equipment_meter_config_field` VALUES (496, '900000000042', 9, '1004', 1002, 170, 'a_reactive_power', 0, NULL, '2018-05-24 09:45:03', NULL, '2018-05-24 09:45:03', '2018-05-24 09:45:03');
INSERT INTO `equipment_meter_config_field` VALUES (497, '900000000042', 9, '1004', 1002, 171, 'b_reactive_power', 0, NULL, '2018-05-24 09:45:03', NULL, '2018-05-24 09:45:03', '2018-05-24 09:45:03');
INSERT INTO `equipment_meter_config_field` VALUES (498, '900000000042', 9, '1004', 1002, 172, 'c_reactive_power', 0, NULL, '2018-05-24 09:45:03', NULL, '2018-05-24 09:45:03', '2018-05-24 09:45:03');
INSERT INTO `equipment_meter_config_field` VALUES (499, '900000000042', 9, '1004', 1002, 173, 'total_reactive_power', 0, NULL, '2018-05-24 09:45:03', NULL, '2018-05-24 09:45:03', '2018-05-24 09:45:03');
INSERT INTO `equipment_meter_config_field` VALUES (500, '900000000042', 9, '1004', 1002, 174, 'a_ap_power', 0, NULL, '2018-05-24 09:45:03', NULL, '2018-05-24 09:45:03', '2018-05-24 09:45:03');
INSERT INTO `equipment_meter_config_field` VALUES (501, '900000000042', 9, '1004', 1002, 175, 'b_ap_power', 0, NULL, '2018-05-24 09:45:03', NULL, '2018-05-24 09:45:03', '2018-05-24 09:45:03');
INSERT INTO `equipment_meter_config_field` VALUES (502, '900000000042', 9, '1004', 1002, 176, 'c_ap_power', 0, NULL, '2018-05-24 09:45:03', NULL, '2018-05-24 09:45:03', '2018-05-24 09:45:03');
INSERT INTO `equipment_meter_config_field` VALUES (503, '900000000042', 9, '1004', 1002, 177, 'total_ap_power', 0, NULL, '2018-05-24 09:45:03', NULL, '2018-05-24 09:45:03', '2018-05-24 09:45:03');
INSERT INTO `equipment_meter_config_field` VALUES (504, '900000000042', 9, '1004', 1002, 178, 'a_voltage', 0, NULL, '2018-05-24 09:45:03', NULL, '2018-05-24 09:45:03', '2018-05-24 09:45:03');
INSERT INTO `equipment_meter_config_field` VALUES (505, '900000000042', 9, '1004', 1002, 179, 'b_voltage', 0, NULL, '2018-05-24 09:45:04', NULL, '2018-05-24 09:45:04', '2018-05-24 09:45:04');
INSERT INTO `equipment_meter_config_field` VALUES (506, '900000000042', 9, '1004', 1002, 180, 'c_voltage', 0, NULL, '2018-05-24 09:45:04', NULL, '2018-05-24 09:45:04', '2018-05-24 09:45:04');
INSERT INTO `equipment_meter_config_field` VALUES (507, '900000000042', 9, '1004', 1002, 181, 'a_electricity', 0, NULL, '2018-05-24 09:45:04', NULL, '2018-05-24 09:45:04', '2018-05-24 09:45:04');
INSERT INTO `equipment_meter_config_field` VALUES (508, '900000000042', 9, '1004', 1002, 182, 'b_electricity', 0, NULL, '2018-05-24 09:45:04', NULL, '2018-05-24 09:45:04', '2018-05-24 09:45:04');
INSERT INTO `equipment_meter_config_field` VALUES (509, '900000000042', 9, '1004', 1002, 183, 'c_electricity', 0, NULL, '2018-05-24 09:45:04', NULL, '2018-05-24 09:45:04', '2018-05-24 09:45:04');
INSERT INTO `equipment_meter_config_field` VALUES (510, '900000000042', 9, '1004', 1002, 184, 'a_power_factor', 0, NULL, '2018-05-24 09:45:04', NULL, '2018-05-24 09:45:04', '2018-05-24 09:45:04');
INSERT INTO `equipment_meter_config_field` VALUES (511, '900000000042', 9, '1004', 1002, 185, 'b_power_factor', 0, NULL, '2018-05-24 09:45:04', NULL, '2018-05-24 09:45:04', '2018-05-24 09:45:04');
INSERT INTO `equipment_meter_config_field` VALUES (512, '900000000042', 9, '1004', 1002, 186, 'c_power_factor', 0, NULL, '2018-05-24 09:45:04', NULL, '2018-05-24 09:45:04', '2018-05-24 09:45:04');
INSERT INTO `equipment_meter_config_field` VALUES (513, '900000000042', 9, '1004', 1002, 187, 'total_power_factor', 0, NULL, '2018-05-24 09:45:04', NULL, '2018-05-24 09:45:04', '2018-05-24 09:45:04');
INSERT INTO `equipment_meter_config_field` VALUES (514, '900000000042', 9, '1004', 1002, 188, 'frequency', 0, NULL, '2018-05-24 09:45:04', NULL, '2018-05-24 09:45:04', '2018-05-24 09:45:04');
INSERT INTO `equipment_meter_config_field` VALUES (515, '900000000042', 9, '1004', 1002, 189, 'total_p_at_ee', 0, NULL, '2018-05-24 09:45:04', NULL, '2018-05-24 09:45:04', '2018-05-24 09:45:04');
INSERT INTO `equipment_meter_config_field` VALUES (516, '900000000042', 9, '1004', 1002, 190, 'total_r_at_ee', 0, NULL, '2018-05-24 09:45:04', NULL, '2018-05-24 09:45:04', '2018-05-24 09:45:04');
INSERT INTO `equipment_meter_config_field` VALUES (517, '900000000042', 9, '1004', 1002, 191, 'total_p_reat_ee', 0, NULL, '2018-05-24 09:45:04', NULL, '2018-05-24 09:45:04', '2018-05-24 09:45:04');
INSERT INTO `equipment_meter_config_field` VALUES (518, '900000000042', 9, '1004', 1002, 192, 'total_r_reat_ee', 0, NULL, '2018-05-24 09:45:04', NULL, '2018-05-24 09:45:04', '2018-05-24 09:45:04');
INSERT INTO `equipment_meter_config_field` VALUES (519, '900000000042', 9, '1004', 1002, 193, 'total_at_ee', 0, NULL, '2018-05-24 09:45:04', NULL, '2018-05-24 09:45:04', '2018-05-24 09:45:04');
INSERT INTO `equipment_meter_config_field` VALUES (520, '900000000042', 9, '1004', 1002, 194, 'total_p_reat_ee', 0, NULL, '2018-05-24 09:45:04', NULL, '2018-05-24 09:45:04', '2018-05-24 09:45:04');
INSERT INTO `equipment_meter_config_field` VALUES (521, '900000000042', 9, '1004', 1002, 195, 'total_ap_a_ee', 0, NULL, '2018-05-24 09:45:04', NULL, '2018-05-24 09:45:04', '2018-05-24 09:45:04');
INSERT INTO `equipment_meter_config_field` VALUES (522, '900000000042', 9, '1004', 1002, 196, 'uab_line_voltage', 0, NULL, '2018-05-24 09:45:04', NULL, '2018-05-24 09:45:04', '2018-05-24 09:45:04');
INSERT INTO `equipment_meter_config_field` VALUES (523, '900000000042', 9, '1004', 1002, 197, 'ubc_line_voltage', 0, NULL, '2018-05-24 09:45:04', NULL, '2018-05-24 09:45:04', '2018-05-24 09:45:04');
INSERT INTO `equipment_meter_config_field` VALUES (524, '900000000042', 9, '1004', 1002, 198, 'uac_line_voltage', 0, NULL, '2018-05-24 09:45:04', NULL, '2018-05-24 09:45:04', '2018-05-24 09:45:04');
INSERT INTO `equipment_meter_config_field` VALUES (525, '900000000041', 2, '1009', 1002, 31, 'a_active_power', 0, NULL, '2018-05-28 10:19:45', '超级管理员', '2018-05-28 10:20:28', '2018-05-28 10:20:27');
INSERT INTO `equipment_meter_config_field` VALUES (526, '900000000041', 2, '1009', 1002, 32, 'b_active_power', 0, NULL, '2018-05-28 10:19:46', NULL, '2018-05-28 10:19:46', '2018-05-28 10:22:43');
INSERT INTO `equipment_meter_config_field` VALUES (527, '900000000041', 2, '1009', 1002, 33, 'c_active_power', 0, NULL, '2018-05-28 10:19:46', NULL, '2018-05-28 10:19:46', '2018-05-28 10:22:46');
INSERT INTO `equipment_meter_config_field` VALUES (528, '900000000041', 2, '1009', 1002, 34, 'total_active_power', 0, NULL, '2018-05-28 10:19:46', NULL, '2018-05-28 10:19:46', '2018-05-28 10:22:49');
INSERT INTO `equipment_meter_config_field` VALUES (529, '900000000041', 2, '1009', 1002, 35, 'a_reactive_power', 0, NULL, '2018-05-28 10:19:46', NULL, '2018-05-28 10:19:46', '2018-05-28 10:24:17');
INSERT INTO `equipment_meter_config_field` VALUES (530, '900000000041', 2, '1009', 1002, 36, 'b_reactive_power', 0, NULL, '2018-05-28 10:19:46', NULL, '2018-05-28 10:19:46', '2018-05-28 10:24:17');
INSERT INTO `equipment_meter_config_field` VALUES (531, '900000000041', 2, '1009', 1002, 37, 'c_reactive_power', 0, NULL, '2018-05-28 10:19:46', NULL, '2018-05-28 10:19:46', '2018-05-28 10:24:17');
INSERT INTO `equipment_meter_config_field` VALUES (532, '900000000041', 2, '1009', 1002, 38, 'total_reactive_power', 0, NULL, '2018-05-28 10:19:46', NULL, '2018-05-28 10:19:46', '2018-05-28 10:24:17');
INSERT INTO `equipment_meter_config_field` VALUES (533, '900000000041', 2, '1009', 1002, 39, 'a_ap_power', 0, NULL, '2018-05-28 10:19:46', NULL, '2018-05-28 10:19:46', '2018-05-28 10:24:17');
INSERT INTO `equipment_meter_config_field` VALUES (534, '900000000041', 2, '1009', 1002, 40, 'b_ap_power', 0, NULL, '2018-05-28 10:19:46', NULL, '2018-05-28 10:19:46', '2018-05-28 10:24:17');
INSERT INTO `equipment_meter_config_field` VALUES (535, '900000000041', 2, '1009', 1002, 41, 'c_ap_power', 0, NULL, '2018-05-28 10:19:46', NULL, '2018-05-28 10:19:46', '2018-05-28 10:24:17');
INSERT INTO `equipment_meter_config_field` VALUES (536, '900000000041', 2, '1009', 1002, 42, 'total_ap_power', 0, NULL, '2018-05-28 10:19:47', NULL, '2018-05-28 10:19:47', '2018-05-28 10:24:17');
INSERT INTO `equipment_meter_config_field` VALUES (537, '900000000041', 2, '1009', 1002, 43, 'a_voltage', 0, NULL, '2018-05-28 10:19:47', NULL, '2018-05-28 10:19:47', '2018-05-28 10:24:17');
INSERT INTO `equipment_meter_config_field` VALUES (538, '900000000041', 2, '1009', 1002, 44, 'b_voltage', 0, NULL, '2018-05-28 10:19:47', NULL, '2018-05-28 10:19:47', '2018-05-28 10:24:17');
INSERT INTO `equipment_meter_config_field` VALUES (539, '900000000041', 2, '1009', 1002, 45, 'c_voltage', 0, NULL, '2018-05-28 10:19:47', NULL, '2018-05-28 10:19:47', '2018-05-28 10:24:17');
INSERT INTO `equipment_meter_config_field` VALUES (540, '900000000041', 2, '1009', 1002, 46, 'a_electricity', 0, NULL, '2018-05-28 10:19:47', NULL, '2018-05-28 10:19:47', '2018-05-28 10:24:17');
INSERT INTO `equipment_meter_config_field` VALUES (541, '900000000041', 2, '1009', 1002, 47, 'b_electricity', 0, NULL, '2018-05-28 10:19:47', NULL, '2018-05-28 10:19:47', '2018-05-28 10:24:17');
INSERT INTO `equipment_meter_config_field` VALUES (542, '900000000041', 2, '1009', 1002, 48, 'c_electricity', 0, NULL, '2018-05-28 10:19:47', NULL, '2018-05-28 10:19:47', '2018-05-28 10:24:17');
INSERT INTO `equipment_meter_config_field` VALUES (543, '900000000041', 2, '1009', 1002, 49, 'a_power_factor', 0, NULL, '2018-05-28 10:19:47', NULL, '2018-05-28 10:19:47', '2018-05-28 10:24:17');
INSERT INTO `equipment_meter_config_field` VALUES (544, '900000000041', 2, '1009', 1002, 50, 'b_power_factor', 0, NULL, '2018-05-28 10:19:47', NULL, '2018-05-28 10:19:47', '2018-05-28 10:24:17');
INSERT INTO `equipment_meter_config_field` VALUES (545, '900000000041', 2, '1009', 1002, 51, 'c_power_factor', 0, NULL, '2018-05-28 10:19:47', NULL, '2018-05-28 10:19:47', '2018-05-28 10:24:17');
INSERT INTO `equipment_meter_config_field` VALUES (546, '900000000041', 2, '1009', 1002, 52, 'total_power_factor', 0, NULL, '2018-05-28 10:19:47', NULL, '2018-05-28 10:19:47', '2018-05-28 10:24:17');
INSERT INTO `equipment_meter_config_field` VALUES (547, '900000000041', 2, '1009', 1002, 53, 'frequency', 0, NULL, '2018-05-28 10:19:47', NULL, '2018-05-28 10:19:47', '2018-05-28 10:24:17');
INSERT INTO `equipment_meter_config_field` VALUES (548, '900000000041', 2, '1009', 1002, 54, 'total_p_at_ee', 0, NULL, '2018-05-28 10:19:48', NULL, '2018-05-28 10:19:48', '2018-05-28 10:24:17');
INSERT INTO `equipment_meter_config_field` VALUES (549, '900000000041', 2, '1009', 1002, 55, 'total_r_at_ee', 0, NULL, '2018-05-28 10:19:48', NULL, '2018-05-28 10:19:48', '2018-05-28 10:24:17');
INSERT INTO `equipment_meter_config_field` VALUES (550, '900000000041', 2, '1009', 1002, 56, 'total_p_reat_ee', 0, NULL, '2018-05-28 10:19:48', NULL, '2018-05-28 10:19:48', '2018-05-28 10:24:17');
INSERT INTO `equipment_meter_config_field` VALUES (551, '900000000041', 2, '1009', 1002, 57, 'total_r_reat_ee', 0, NULL, '2018-05-28 10:19:48', NULL, '2018-05-28 10:19:48', '2018-05-28 10:24:17');
INSERT INTO `equipment_meter_config_field` VALUES (552, '900000000041', 2, '1009', 1002, 58, 'total_at_ee', 0, NULL, '2018-05-28 10:19:48', NULL, '2018-05-28 10:19:48', '2018-05-28 10:24:17');
INSERT INTO `equipment_meter_config_field` VALUES (553, '900000000041', 2, '1009', 1002, 59, 'total_p_reat_ee', 0, NULL, '2018-05-28 10:19:48', NULL, '2018-05-28 10:19:48', '2018-05-28 10:24:17');
INSERT INTO `equipment_meter_config_field` VALUES (554, '900000000041', 2, '1009', 1002, 60, 'total_ap_a_ee', 0, NULL, '2018-05-28 10:19:48', NULL, '2018-05-28 10:19:48', '2018-05-28 10:24:17');
INSERT INTO `equipment_meter_config_field` VALUES (555, '900000000041', 3, '1009', 1002, 61, 'a_active_power', 0, NULL, '2018-05-28 10:19:48', NULL, '2018-05-28 10:19:48', '2018-05-28 10:24:51');
INSERT INTO `equipment_meter_config_field` VALUES (556, '900000000041', 3, '1009', 1002, 62, 'b_active_power', 0, NULL, '2018-05-28 10:19:48', NULL, '2018-05-28 10:19:48', '2018-05-28 10:24:51');
INSERT INTO `equipment_meter_config_field` VALUES (557, '900000000041', 3, '1009', 1002, 63, 'c_active_power', 0, NULL, '2018-05-28 10:19:49', NULL, '2018-05-28 10:19:49', '2018-05-28 10:24:51');
INSERT INTO `equipment_meter_config_field` VALUES (558, '900000000041', 3, '1009', 1002, 64, 'total_active_power', 0, NULL, '2018-05-28 10:19:49', NULL, '2018-05-28 10:19:49', '2018-05-28 10:24:51');
INSERT INTO `equipment_meter_config_field` VALUES (559, '900000000041', 3, '1009', 1002, 65, 'a_reactive_power', 0, NULL, '2018-05-28 10:19:49', NULL, '2018-05-28 10:19:49', '2018-05-28 10:24:51');
INSERT INTO `equipment_meter_config_field` VALUES (560, '900000000041', 3, '1009', 1002, 66, 'b_reactive_power', 0, NULL, '2018-05-28 10:19:49', NULL, '2018-05-28 10:19:49', '2018-05-28 10:24:51');
INSERT INTO `equipment_meter_config_field` VALUES (561, '900000000041', 3, '1009', 1002, 67, 'c_reactive_power', 0, NULL, '2018-05-28 10:19:49', NULL, '2018-05-28 10:19:49', '2018-05-28 10:24:51');
INSERT INTO `equipment_meter_config_field` VALUES (562, '900000000041', 3, '1009', 1002, 68, 'total_reactive_power', 0, NULL, '2018-05-28 10:19:50', NULL, '2018-05-28 10:19:50', '2018-05-28 10:24:51');
INSERT INTO `equipment_meter_config_field` VALUES (563, '900000000041', 3, '1009', 1002, 69, 'a_ap_power', 0, NULL, '2018-05-28 10:19:50', NULL, '2018-05-28 10:19:50', '2018-05-28 10:24:51');
INSERT INTO `equipment_meter_config_field` VALUES (564, '900000000041', 3, '1009', 1002, 70, 'b_ap_power', 0, NULL, '2018-05-28 10:19:50', NULL, '2018-05-28 10:19:50', '2018-05-28 10:24:51');
INSERT INTO `equipment_meter_config_field` VALUES (565, '900000000041', 3, '1009', 1002, 71, 'c_ap_power', 0, NULL, '2018-05-28 10:19:50', NULL, '2018-05-28 10:19:50', '2018-05-28 10:24:51');
INSERT INTO `equipment_meter_config_field` VALUES (566, '900000000041', 3, '1009', 1002, 72, 'total_ap_power', 0, NULL, '2018-05-28 10:19:50', NULL, '2018-05-28 10:19:50', '2018-05-28 10:24:51');
INSERT INTO `equipment_meter_config_field` VALUES (567, '900000000041', 3, '1009', 1002, 73, 'a_voltage', 0, NULL, '2018-05-28 10:19:51', NULL, '2018-05-28 10:19:51', '2018-05-28 10:24:51');
INSERT INTO `equipment_meter_config_field` VALUES (568, '900000000041', 3, '1009', 1002, 74, 'b_voltage', 0, NULL, '2018-05-28 10:19:51', NULL, '2018-05-28 10:19:51', '2018-05-28 10:24:51');
INSERT INTO `equipment_meter_config_field` VALUES (569, '900000000041', 3, '1009', 1002, 75, 'c_voltage', 0, NULL, '2018-05-28 10:19:51', NULL, '2018-05-28 10:19:51', '2018-05-28 10:24:51');
INSERT INTO `equipment_meter_config_field` VALUES (570, '900000000041', 3, '1009', 1002, 76, 'a_electricity', 0, NULL, '2018-05-28 10:19:51', NULL, '2018-05-28 10:19:51', '2018-05-28 10:24:51');
INSERT INTO `equipment_meter_config_field` VALUES (571, '900000000041', 3, '1009', 1002, 77, 'b_electricity', 0, NULL, '2018-05-28 10:19:52', NULL, '2018-05-28 10:19:52', '2018-05-28 10:24:51');
INSERT INTO `equipment_meter_config_field` VALUES (572, '900000000041', 3, '1009', 1002, 78, 'c_electricity', 0, NULL, '2018-05-28 10:19:52', NULL, '2018-05-28 10:19:52', '2018-05-28 10:24:51');
INSERT INTO `equipment_meter_config_field` VALUES (573, '900000000041', 3, '1009', 1002, 79, 'a_power_factor', 0, NULL, '2018-05-28 10:19:52', NULL, '2018-05-28 10:19:52', '2018-05-28 10:24:51');
INSERT INTO `equipment_meter_config_field` VALUES (574, '900000000041', 3, '1009', 1002, 80, 'b_power_factor', 0, NULL, '2018-05-28 10:19:52', NULL, '2018-05-28 10:19:52', '2018-05-28 10:24:51');
INSERT INTO `equipment_meter_config_field` VALUES (575, '900000000041', 3, '1009', 1002, 81, 'c_power_factor', 0, NULL, '2018-05-28 10:19:52', NULL, '2018-05-28 10:19:52', '2018-05-28 10:24:51');
INSERT INTO `equipment_meter_config_field` VALUES (576, '900000000041', 3, '1009', 1002, 82, 'total_power_factor', 0, NULL, '2018-05-28 10:19:52', NULL, '2018-05-28 10:19:52', '2018-05-28 10:24:51');
INSERT INTO `equipment_meter_config_field` VALUES (577, '900000000041', 3, '1009', 1002, 83, 'frequency', 0, NULL, '2018-05-28 10:19:53', NULL, '2018-05-28 10:19:53', '2018-05-28 10:24:51');
INSERT INTO `equipment_meter_config_field` VALUES (578, '900000000041', 3, '1009', 1002, 84, 'total_p_at_ee', 0, NULL, '2018-05-28 10:19:53', NULL, '2018-05-28 10:19:53', '2018-05-28 10:24:51');
INSERT INTO `equipment_meter_config_field` VALUES (579, '900000000041', 3, '1009', 1002, 85, 'total_r_at_ee', 0, NULL, '2018-05-28 10:19:53', NULL, '2018-05-28 10:19:53', '2018-05-28 10:24:51');
INSERT INTO `equipment_meter_config_field` VALUES (580, '900000000041', 3, '1009', 1002, 86, 'total_p_reat_ee', 0, NULL, '2018-05-28 10:19:53', NULL, '2018-05-28 10:19:53', '2018-05-28 10:24:51');
INSERT INTO `equipment_meter_config_field` VALUES (581, '900000000041', 3, '1009', 1002, 87, 'total_r_reat_ee', 0, NULL, '2018-05-28 10:19:53', NULL, '2018-05-28 10:19:53', '2018-05-28 10:24:51');
INSERT INTO `equipment_meter_config_field` VALUES (582, '900000000041', 3, '1009', 1002, 88, 'total_at_ee', 0, NULL, '2018-05-28 10:19:53', NULL, '2018-05-28 10:19:53', '2018-05-28 10:24:51');
INSERT INTO `equipment_meter_config_field` VALUES (583, '900000000041', 3, '1009', 1002, 89, 'total_p_reat_ee', 0, NULL, '2018-05-28 10:19:53', NULL, '2018-05-28 10:19:53', '2018-05-28 10:24:51');
INSERT INTO `equipment_meter_config_field` VALUES (584, '900000000041', 3, '1009', 1002, 90, 'total_ap_a_ee', 0, NULL, '2018-05-28 10:19:53', NULL, '2018-05-28 10:19:53', '2018-05-28 10:24:51');

-- ----------------------------
-- Table structure for equipment_meter_rom_config
-- ----------------------------
DROP TABLE IF EXISTS `equipment_meter_rom_config`;
CREATE TABLE `equipment_meter_rom_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `meter_type_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电表类型编号',
  `address_sort` int(11) NULL DEFAULT NULL COMMENT '地址排序',
  `rom_address` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '寄存器地址',
  `rom_name` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '寄存器名称',
  `units` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位',
  `data_type` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据类型',
  `segment_no` int(11) NULL DEFAULT 0 COMMENT '表示该属性属于协议的第几段',
  `offset` int(11) NULL DEFAULT 0 COMMENT '解析协议时相对上个属性的偏移值',
  `need_pt` tinyint(4) NULL DEFAULT 0 COMMENT '是否电压互感器变化',
  `need_ct` tinyint(4) NULL DEFAULT 0 COMMENT '是否电流互感器变比',
  `calcfactor` decimal(10, 6) NULL DEFAULT 1.000000 COMMENT '计算因子',
  `msb_bit` tinyint(4) NULL DEFAULT 0 COMMENT '最高位为符号位',
  `byte_length` int(11) NULL DEFAULT 0 COMMENT '数据长度',
  `function_table1` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '基础表',
  `function_table2` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附加表',
  `function_table3` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务表',
  `function_field` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段名',
  `tag` int(11) NULL DEFAULT 0 COMMENT '状态:0.正常1.删除',
  `createuser` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `createdate` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `changeuser` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `changedate` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `rowver` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '时间戳',
  `bigendian` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 617 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of equipment_meter_rom_config
-- ----------------------------
INSERT INTO `equipment_meter_rom_config` VALUES (1, '1000', 1, '40001', 'A相电压', '伏特', 'INT', 1, 0, 1, 0, 0.010000, 0, 2, 'collect_base_info', NULL, NULL, 'a_voltage', 0, 'root', '2017-08-11 15:02:08', 'root', '2017-08-11 15:02:08', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (2, '1000', 2, '40002', 'B相电压', '伏特', 'INT', 1, 0, 1, 0, 0.010000, 0, 2, 'collect_base_info', NULL, NULL, 'b_voltage', 0, 'root', '2017-08-11 15:02:08', 'root', '2017-08-11 15:02:08', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (3, '1000', 3, '40003', 'C相电压', '伏特', 'INT', 1, 0, 1, 0, 0.010000, 0, 2, 'collect_base_info', NULL, NULL, 'c_voltage', 0, 'root', '2017-08-11 15:02:09', 'root', '2017-08-11 15:02:09', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (4, '1000', 4, '40004', 'A相电流', '安培', 'INT', 1, 0, 0, 1, 0.001000, 0, 2, 'collect_base_info', NULL, NULL, 'a_electricity', 0, 'root', '2017-08-11 15:02:09', 'root', '2017-08-11 15:02:09', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (5, '1000', 5, '40005', 'B相电流', '安培', 'INT', 1, 0, 0, 1, 0.001000, 0, 2, 'collect_base_info', NULL, NULL, 'b_electricity', 0, 'root', '2017-08-11 15:02:09', 'root', '2017-08-11 15:02:09', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (6, '1000', 6, '40006', 'C相电流', '安培', 'INT', 1, 0, 0, 1, 0.001000, 0, 2, 'collect_base_info', NULL, NULL, 'c_electricity', 0, 'root', '2017-08-11 15:02:09', 'root', '2017-08-11 15:02:09', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (7, '1000', 7, '40007', '有功总和', '瓦', 'LONG', 1, 0, 1, 1, 0.100000, 1, 4, 'collect_base_info', NULL, NULL, 'total_active_power', 0, 'root', '2017-08-11 15:02:09', 'root', '2017-08-11 15:02:09', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (8, '1000', 8, '40009', '无功总和', '乏', 'LONG', 1, 0, 1, 1, 0.100000, 1, 4, 'collect_base_info', NULL, NULL, 'total_reactive_power', 0, 'root', '2017-08-11 15:02:09', 'root', '2017-08-11 15:02:09', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (9, '1000', 9, '40011', '功率因数总和', NULL, 'INT', 1, 0, 0, 0, 0.001000, 1, 2, 'collect_base_info', NULL, NULL, 'total_power_factor', 0, 'root', '2017-08-11 15:02:09', 'root', '2017-08-11 15:02:09', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (10, '1000', 10, '40012', 'A相有功功率', '瓦', 'INT', 1, 0, 1, 1, 0.100000, 1, 2, 'collect_base_info', NULL, NULL, 'a_active_power', 0, 'root', '2017-08-11 15:02:09', 'root', '2017-08-11 15:02:09', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (11, '1000', 11, '40013', 'B相有功功率', '瓦', 'INT', 1, 0, 1, 1, 0.100000, 1, 2, 'collect_base_info', NULL, NULL, 'b_active_power', 0, 'root', '2017-08-11 15:02:09', 'root', '2017-08-11 15:02:09', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (12, '1000', 12, '40014', 'C相有功功率', '瓦', 'INT', 1, 0, 1, 1, 0.100000, 1, 2, 'collect_base_info', NULL, NULL, 'c_active_power', 0, 'root', '2017-08-11 15:02:09', 'root', '2017-08-11 15:02:09', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (13, '1000', 13, '40015', 'A相无功功率', '乏', 'INT', 1, 0, 1, 1, 0.100000, 1, 2, 'collect_base_info', NULL, NULL, 'a_reactive_power', 0, 'root', '2017-08-11 15:02:09', 'root', '2017-08-11 15:02:09', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (14, '1000', 14, '40016', 'B相无功功率', '乏', 'INT', 1, 0, 1, 1, 0.100000, 1, 2, 'collect_base_info', NULL, NULL, 'b_reactive_power', 0, 'root', '2017-08-11 15:02:09', 'root', '2017-08-11 15:02:09', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (15, '1000', 15, '40017', 'C相无功功率', '乏', 'INT', 1, 0, 1, 1, 0.100000, 1, 2, 'collect_base_info', NULL, NULL, 'c_reactive_power', 0, 'root', '2017-08-11 15:02:09', 'root', '2017-08-11 15:02:09', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (16, '1000', 16, '40018', 'A相功率因数', NULL, 'INT', 1, 0, 0, 0, 0.001000, 1, 2, 'collect_base_info', NULL, NULL, 'a_power_factor', 0, 'root', '2017-08-11 15:02:09', 'root', '2017-08-11 15:02:09', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (17, '1000', 17, '40019', 'B相功率因数', NULL, 'INT', 1, 0, 0, 0, 0.001000, 1, 2, 'collect_base_info', NULL, NULL, 'b_power_factor', 0, 'root', '2017-08-11 15:02:09', 'root', '2017-08-11 15:02:09', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (18, '1000', 18, '40020', 'C相功率因数', NULL, 'INT', 1, 0, 0, 0, 0.001000, 1, 2, 'collect_base_info', NULL, NULL, 'c_power_factor', 0, 'root', '2017-08-11 15:02:09', 'root', '2017-08-11 15:02:09', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (19, '1000', 19, '40021', '频率', '赫兹', 'INT', 1, 0, 0, 0, 0.010000, 0, 2, 'collect_base_info', NULL, NULL, 'frequency', 0, 'root', '2017-08-11 15:02:09', 'root', '2017-08-11 15:02:09', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (20, '1000', 20, '40022', '有功电度总和', '千瓦时', 'LONG', 1, 0, 0, 0, 0.100000, 0, 4, 'collect_base_info', NULL, NULL, 'total_at_ee', 0, 'root', '2017-08-11 15:02:09', 'root', '2017-08-11 15:02:09', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (21, '1000', 21, '40024', '无功电度总和', '千乏时', 'LONG', 1, 0, 0, 0, 0.100000, 0, 4, 'collect_base_info', NULL, NULL, 'total_ap_reat_ee', 0, 'root', '2017-08-11 15:02:09', 'root', '2017-08-11 15:02:09', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (22, '1000', 22, '40026', '输入有功电度', '千瓦时', 'LONG', 1, 0, 0, 0, 0.100000, 0, 4, 'collect_base_info', NULL, NULL, 'total_p_at_ee', 0, 'root', '2017-08-11 15:02:09', 'root', '2017-08-11 15:02:09', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (23, '1000', 23, '40028', '输出有功电度', '千瓦时', 'LONG', 1, 0, 0, 0, 0.100000, 0, 4, 'collect_base_info', NULL, NULL, 'total_r_at_ee', 0, 'root', '2017-08-11 15:02:09', 'root', '2017-08-11 15:02:09', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (24, '1000', 24, '40030', '输入无功电度', '千乏时', 'LONG', 1, 0, 0, 0, 0.100000, 0, 4, 'collect_base_info', NULL, NULL, 'total_p_reat_ee', 0, 'root', '2017-08-11 15:02:09', 'root', '2017-08-11 15:02:09', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (25, '1000', 25, '40032', '输出无功电度', '千乏时', 'LONG', 1, 0, 0, 0, 0.100000, 0, 4, 'collect_base_info', NULL, NULL, 'total_r_reat_ee', 0, 'root', '2017-08-11 15:02:09', 'root', '2017-08-11 15:02:09', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (26, '1000', 26, '40034', '开关量状态', NULL, 'INT', 1, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 15:02:09', 'root', '2017-08-11 15:02:09', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (27, '1000', 27, '40035', '继电器状态', NULL, 'INT', 1, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 15:02:09', 'root', '2017-08-11 15:02:09', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (28, '1000', 28, '40036', '零序电流', '安培', 'INT', 1, 0, 0, 1, 0.001000, 0, 2, NULL, 'collect_attach_info', NULL, '', 0, 'root', '2017-08-11 15:02:09', 'root', '2017-08-11 15:02:09', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (29, '1000', 29, '40201', '通讯地址', NULL, 'INT', 1, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 15:02:09', 'root', '2017-08-11 15:02:09', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (30, '1000', 30, '40202', 'CT变比', NULL, 'INT', 1, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 15:02:10', 'root', '2017-08-11 15:02:10', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (31, '1000', 31, '40203', '接线模式', NULL, 'INT', 1, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 15:02:10', 'root', '2017-08-11 15:02:10', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (32, '1000', 32, '40204', 'PT变比', NULL, 'INT', 1, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 15:02:10', 'root', '2017-08-11 15:02:10', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (33, '1000', 33, '40205', '波特率', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 15:02:10', 'root', '2017-08-11 15:02:10', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (34, '1000', 34, '40206', '模拟通道一对象', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 15:02:10', 'root', '2017-08-11 15:02:10', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (35, '1000', 35, '40207', '模拟通道二对象', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 15:02:10', 'root', '2017-08-11 15:02:10', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (36, '1000', 36, '40208', '继电器一动作模式', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 15:02:10', 'root', '2017-08-11 15:02:10', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (37, '1000', 37, '40209', '继电器一动作对象', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 15:02:10', 'root', '2017-08-11 15:02:10', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (38, '1000', 38, '40210', '继电器一动作上限', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 15:02:10', 'root', '2017-08-11 15:02:10', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (39, '1000', 39, '40211', '继电器一动作下限', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 15:02:10', 'root', '2017-08-11 15:02:10', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (40, '1000', 40, '40212', '继电器一动作时间', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 15:02:10', 'root', '2017-08-11 15:02:10', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (41, '1000', 41, '40213', '继电器二动作模式', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 15:02:10', 'root', '2017-08-11 15:02:10', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (42, '1000', 42, '40214', '继电器二动作对象', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 15:02:10', 'root', '2017-08-11 15:02:10', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (43, '1000', 43, '40215', '继电器二动作上限', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 15:02:10', 'root', '2017-08-11 15:02:10', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (44, '1000', 44, '40216', '继电器二动作下限', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 15:02:11', 'root', '2017-08-11 15:02:11', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (45, '1000', 45, '40217', '继电器二动作时间', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 15:02:11', 'root', '2017-08-11 15:02:11', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (46, '1000', 46, '40253', '电度清零', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 15:02:11', 'root', '2017-08-11 15:02:11', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (47, '1000', 47, '40501', '软件版本号', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 15:02:11', 'root', '2017-08-11 15:02:11', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (48, '1000', 48, '40502', '硬件版本号', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 15:02:11', 'root', '2017-08-11 15:02:11', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (49, '1000', 49, '40503', '产品序列号', NULL, 'LONG', 0, 0, 0, 0, 1.000000, 0, 4, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 15:02:11', 'root', '2017-08-11 15:02:11', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (50, '1001', 1, '0x0000~0x0001', 'A相电压', NULL, 'LONG', 1, 0, 1, 0, 0.010000, 0, 4, 'collect_base_info', NULL, NULL, 'a_voltage', 0, 'root', '2017-08-11 16:03:21', 'root', '2017-08-11 16:03:21', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (51, '1001', 2, '0x0002~0x0003', 'AB线电压', NULL, 'LONG', 1, 0, 1, 0, 0.010000, 0, 4, 'collect_base_info', NULL, NULL, 'uab_line_voltage', 0, 'root', '2017-08-11 16:03:21', 'root', '2017-08-11 16:03:21', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (52, '1001', 3, '0x0004~0x0005', 'A相电流', NULL, 'LONG', 1, 0, 0, 1, 0.000100, 0, 4, 'collect_base_info', NULL, NULL, 'a_electricity', 0, 'root', '2017-08-11 16:03:21', 'root', '2017-08-11 16:03:21', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (53, '1001', 4, '0x0006~0x0007', 'A相有功功率', NULL, 'LONG', 1, 0, 1, 1, 0.000100, 1, 4, 'collect_base_info', NULL, NULL, 'a_active_power', 0, 'root', '2017-08-11 16:03:21', 'root', '2017-08-11 16:03:21', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (54, '1001', 5, '0x0008~0x0009', 'A相无功功率', NULL, 'LONG', 1, 0, 1, 1, 0.000100, 1, 4, 'collect_base_info', NULL, NULL, 'a_reactive_power', 0, 'root', '2017-08-11 16:03:21', 'root', '2017-08-11 16:03:21', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (55, '1001', 6, '0x000A~0x000B', 'A相功率因数', NULL, 'LONG', 1, 0, 0, 0, 0.000100, 1, 4, 'collect_base_info', NULL, NULL, 'a_power_factor', 0, 'root', '2017-08-11 16:03:21', 'root', '2017-08-11 16:03:21', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (56, '1001', 7, '0x000C~0x000D', 'A相视在功率', NULL, 'LONG', 1, 0, 1, 1, 0.100000, 0, 4, 'collect_base_info', NULL, NULL, 'a_ap_power', 0, 'root', '2017-08-11 16:03:21', 'root', '2017-08-11 16:03:21', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (57, '1001', 8, '0x000E~0x000F', 'B相电压', NULL, 'LONG', 1, 0, 1, 0, 0.010000, 0, 4, 'collect_base_info', NULL, NULL, 'b_voltage', 0, 'root', '2017-08-11 16:03:21', 'root', '2017-08-11 16:03:21', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (58, '1001', 9, '0x0010~0x0011', 'CA线电压', NULL, 'LONG', 1, 0, 1, 0, 0.010000, 0, 4, 'collect_base_info', NULL, NULL, 'uac_line_voltage', 0, 'root', '2017-08-11 16:03:21', 'root', '2017-08-11 16:03:21', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (59, '1001', 10, '0x0012~0x0013', 'B相电流', NULL, 'LONG', 1, 0, 0, 1, 0.000100, 0, 4, 'collect_base_info', NULL, NULL, 'b_electricity', 0, 'root', '2017-08-11 16:03:21', 'root', '2017-08-11 16:03:21', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (60, '1001', 11, '0x0014~0x0015', 'B相有功功率', NULL, 'LONG', 1, 0, 1, 1, 0.000100, 1, 4, 'collect_base_info', NULL, NULL, 'b_active_power', 0, 'root', '2017-08-11 16:03:21', 'root', '2017-08-11 16:03:21', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (61, '1001', 12, '0x0016~0x0017', 'B相无功功率', NULL, 'LONG', 1, 0, 1, 1, 0.000100, 1, 4, 'collect_base_info', NULL, NULL, 'b_reactive_power', 0, 'root', '2017-08-11 16:03:21', 'root', '2017-08-11 16:03:21', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (62, '1001', 13, '0x0018~0x0019', 'B相功率因数', NULL, 'LONG', 1, 0, 0, 0, 0.000100, 1, 4, 'collect_base_info', NULL, NULL, 'b_power_factor', 0, 'root', '2017-08-11 16:03:21', 'root', '2017-08-11 16:03:21', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (63, '1001', 14, '0x001A~0x001B', 'B相视在功率', NULL, 'LONG', 1, 0, 1, 1, 0.100000, 0, 4, 'collect_base_info', NULL, NULL, 'b_ap_power', 0, 'root', '2017-08-11 16:03:21', 'root', '2017-08-11 16:03:21', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (64, '1001', 15, '0x001C~0x001D', 'C相电压', NULL, 'LONG', 1, 0, 1, 0, 0.010000, 0, 4, 'collect_base_info', NULL, NULL, 'c_voltage', 0, 'root', '2017-08-11 16:03:21', 'root', '2017-08-11 16:03:21', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (65, '1001', 16, '0x001E~0x001F', 'BC线电压', NULL, 'LONG', 1, 0, 1, 0, 0.010000, 0, 4, 'collect_base_info', NULL, NULL, 'ubc_line_voltage', 0, 'root', '2017-08-11 16:03:21', 'root', '2017-08-11 16:03:21', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (66, '1001', 17, '0x0020~0x0021', 'C相电流', NULL, 'LONG', 1, 0, 0, 1, 0.000100, 0, 4, 'collect_base_info', NULL, NULL, 'c_electricity', 0, 'root', '2017-08-11 16:03:21', 'root', '2017-08-11 16:03:21', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (67, '1001', 18, '0x0022~0x0023', 'C相有功功率', NULL, 'LONG', 1, 0, 1, 1, 0.000100, 1, 4, 'collect_base_info', NULL, NULL, 'c_active_power', 0, 'root', '2017-08-11 16:03:21', 'root', '2017-08-11 16:03:21', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (68, '1001', 19, '0x0024~0x0025', 'C相无功功率', NULL, 'LONG', 1, 0, 1, 1, 0.000100, 1, 4, 'collect_base_info', NULL, NULL, 'c_reactive_power', 0, 'root', '2017-08-11 16:03:21', 'root', '2017-08-11 16:03:21', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (69, '1001', 20, '0x0026~0x0027', 'C相功率因数', NULL, 'LONG', 1, 0, 0, 0, 0.000100, 1, 4, 'collect_base_info', NULL, NULL, 'c_power_factor', 0, 'root', '2017-08-11 16:03:21', 'root', '2017-08-11 16:03:21', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (70, '1001', 21, '0x0028~0x0029', 'C相视在功率', NULL, 'LONG', 1, 0, 1, 1, 0.100000, 0, 4, 'collect_base_info', NULL, NULL, 'c_ap_power', 0, 'root', '2017-08-11 16:03:21', 'root', '2017-08-11 16:03:21', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (71, '1001', 22, '0x002A~0x002B', '三相平均电压', NULL, 'LONG', 1, 0, 1, 0, 0.010000, 0, 4, NULL, 'collect_attach_info', NULL, 'average_voltage', 0, 'root', '2017-08-11 16:03:21', 'root', '2017-08-11 16:03:21', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (72, '1001', 23, '0x002C~0x002D', '频率', NULL, 'LONG', 1, 0, 0, 0, 0.010000, 0, 4, 'collect_base_info', NULL, NULL, 'frequency', 0, 'root', '2017-08-11 16:03:21', 'root', '2017-08-11 16:03:21', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (73, '1001', 24, '0x002E~0x002F', '三相平均相电流', NULL, 'LONG', 1, 0, 0, 1, 0.000100, 0, 4, NULL, 'collect_attach_info', NULL, 'average_electricity', 0, 'root', '2017-08-11 16:03:21', 'root', '2017-08-11 16:03:21', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (74, '1001', 25, '0x0030~0x0031', '三相总有功功率', NULL, 'LONG', 1, 0, 1, 1, 0.000100, 1, 4, 'collect_base_info', NULL, NULL, 'total_active_power', 0, 'root', '2017-08-11 16:03:21', 'root', '2017-08-11 16:03:21', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (75, '1001', 26, '0x0032~0x0033', '三相总无功功率', NULL, 'LONG', 1, 0, 1, 1, 0.000100, 1, 4, 'collect_base_info', NULL, NULL, 'total_reactive_power', 0, 'root', '2017-08-11 16:03:21', 'root', '2017-08-11 16:03:21', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (76, '1001', 27, '0x0034~0x0035', '三相总功率因数', NULL, 'LONG', 1, 0, 0, 0, 0.000100, 1, 4, 'collect_base_info', NULL, NULL, 'total_power_factor', 0, 'root', '2017-08-11 16:03:21', 'root', '2017-08-11 16:03:21', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (77, '1001', 28, '0x0036~0x0037', '三相总视在功率', NULL, 'LONG', 1, 0, 1, 1, 0.100000, 0, 4, 'collect_base_info', NULL, NULL, 'total_ap_power', 0, 'root', '2017-08-11 16:03:21', 'root', '2017-08-11 16:03:21', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (78, '1001', 29, '0x1000~0x1001', '总有功电能', NULL, 'LONG', 2, 0, 1, 1, 0.001000, 0, 4, 'collect_base_info', NULL, NULL, 'total_at_ee', 0, 'root', '2017-08-11 16:03:22', 'root', '2017-08-11 16:03:22', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (79, '1001', 30, '0x1002~0x1003', '总无功电能', NULL, 'LONG', 2, 0, 1, 1, 0.001000, 0, 4, 'collect_base_info', NULL, NULL, 'total_ap_reat_ee', 0, 'root', '2017-08-11 16:03:22', 'root', '2017-08-11 16:03:22', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (80, '1001', 31, '0x1004~0x1005', '正向有功电能', NULL, 'LONG', 2, 0, 1, 1, 0.001000, 0, 4, 'collect_base_info', NULL, NULL, 'total_p_at_ee', 0, 'root', '2017-08-11 16:03:22', 'root', '2017-08-11 16:03:22', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (81, '1001', 32, '0x1006~0x1007', '反向有功电能', NULL, 'LONG', 2, 0, 1, 1, 0.001000, 0, 4, 'collect_base_info', NULL, NULL, 'total_r_at_ee', 0, 'root', '2017-08-11 16:03:22', 'root', '2017-08-11 16:03:22', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (82, '1001', 33, '0x1008~0x1009', '正向无功电能', NULL, 'LONG', 2, 0, 1, 1, 0.001000, 0, 4, 'collect_base_info', NULL, NULL, 'total_p_reat_ee', 0, 'root', '2017-08-11 16:03:22', 'root', '2017-08-11 16:03:22', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (83, '1001', 34, '0x100A~0x100B', '反向无功电能', NULL, 'LONG', 2, 0, 1, 1, 0.001000, 0, 4, 'collect_base_info', NULL, NULL, 'total_r_reat_ee', 0, 'root', '2017-08-11 16:03:22', 'root', '2017-08-11 16:03:22', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (84, '1001', 35, '0x3000', '接线方式', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:03:22', 'root', '2017-08-11 16:03:22', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (85, '1001', 36, '0x3001', 'PT', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:03:22', 'root', '2017-08-11 16:03:22', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (86, '1001', 37, '0x3002', 'CT', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:03:22', 'root', '2017-08-11 16:03:22', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (87, '1001', 38, '0x3003', '子机地址', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:03:22', 'root', '2017-08-11 16:03:22', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (88, '1001', 39, '0x3004', '波特率', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:03:22', 'root', '2017-08-11 16:03:22', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (89, '1001', 40, '0x3005', '预留', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:03:22', 'root', '2017-08-11 16:03:22', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (90, '1001', 41, '0x3006', '跳屏选择', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:03:22', 'root', '2017-08-11 16:03:22', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (91, '1001', 42, '0x3007', '显示总分', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:03:22', 'root', '2017-08-11 16:03:22', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (92, '1001', 43, '0x3008', '预留', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:03:22', 'root', '2017-08-11 16:03:22', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (93, '1001', 44, '0x3009', '默认电压', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:03:22', 'root', '2017-08-11 16:03:22', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (94, '1001', 45, '0x3010', '默认电流', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:03:22', 'root', '2017-08-11 16:03:22', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (95, '1001', 46, '0x3200', 'DO1继电器输出模式', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:03:22', 'root', '2017-08-11 16:03:22', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (96, '1001', 47, '0x3201', 'DO1对应参数编号', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:03:22', 'root', '2017-08-11 16:03:22', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (97, '1001', 48, '0x3202', 'DO1参比设置值', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:03:22', 'root', '2017-08-11 16:03:22', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (98, '1001', 49, '0x3203', '第一路继电器状态', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:03:22', 'root', '2017-08-11 16:03:22', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (99, '1001', 50, '0x3204', 'DO2继电器输出模式', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:03:22', 'root', '2017-08-11 16:03:22', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (100, '1001', 51, '0x3205', 'DO2对应参数编号', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:03:22', 'root', '2017-08-11 16:03:22', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (101, '1001', 52, '0x3206', 'DO2参比设置值', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:03:22', 'root', '2017-08-11 16:03:22', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (102, '1001', 53, '0x3207', '第2路继电器状态', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:03:22', 'root', '2017-08-11 16:03:22', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (103, '1001', 54, '0x3208', '预留', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:03:22', 'root', '2017-08-11 16:03:22', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (104, '1001', 55, '0x3209', '预留', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:03:22', 'root', '2017-08-11 16:03:22', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (105, '1001', 56, '0x320A', '预留', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:03:22', 'root', '2017-08-11 16:03:22', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (106, '1001', 57, '0x320B', '预留', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:03:22', 'root', '2017-08-11 16:03:22', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (107, '1001', 58, '0x320C', '预留', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:03:22', 'root', '2017-08-11 16:03:22', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (108, '1001', 59, '0x320D', '预留', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:03:22', 'root', '2017-08-11 16:03:22', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (109, '1001', 60, '0x320E', '预留', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:03:22', 'root', '2017-08-11 16:03:22', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (110, '1001', 61, '0x320F', '预留', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:03:22', 'root', '2017-08-11 16:03:22', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (111, '1001', 62, '0x3F00', '清零电能', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:03:22', 'root', '2017-08-11 16:03:22', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (112, '1001', 63, '0x3F01', '预留', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:03:22', 'root', '2017-08-11 16:03:22', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (113, '1001', 64, '0x3F02', '预留', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:03:23', 'root', '2017-08-11 16:03:23', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (114, '1001', 65, '0x3F03', '预留', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:03:23', 'root', '2017-08-11 16:03:23', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (115, '1001', 66, '0x3F04', '恢复出厂设置', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:03:23', 'root', '2017-08-11 16:03:23', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (116, '1001', 67, '0x0080', '开关量输入状态', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:03:23', 'root', '2017-08-11 16:03:23', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (117, '1001', 68, '0x0081', '开关量输出状态', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:03:23', 'root', '2017-08-11 16:03:23', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (118, '1001', 69, '0x3300', 'AO1对应参数编号', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:03:23', 'root', '2017-08-11 16:03:23', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (119, '1001', 70, '0x3301', '变送输出第一通道对应电参数', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:03:23', 'root', '2017-08-11 16:03:23', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (120, '1001', 71, '0x3302', 'AO1参比设置值', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:03:23', 'root', '2017-08-11 16:03:23', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (121, '1001', 72, '0x3303', 'AO1输出值', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:03:23', 'root', '2017-08-11 16:03:23', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (122, '1001', 73, '0x3304', 'AO2对应参数编号', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:03:23', 'root', '2017-08-11 16:03:23', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (123, '1001', 74, '0x3305', '变送输出第二通道对应电参数', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:03:23', 'root', '2017-08-11 16:03:23', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (124, '1001', 75, '0x3306', 'AO2参比设置值', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:03:23', 'root', '2017-08-11 16:03:23', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (125, '1001', 76, '0x3307', 'AO2输出值', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:03:23', 'root', '2017-08-11 16:03:23', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (126, '1001', 77, '0x3308', 'AO3对应参数编号', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:03:23', 'root', '2017-08-11 16:03:23', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (127, '1001', 78, '0x3309', '变送输出第三通道对应电参数', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:03:23', 'root', '2017-08-11 16:03:23', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (128, '1001', 79, '0x330A', 'AO3参比设置值', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:03:23', 'root', '2017-08-11 16:03:23', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (129, '1001', 80, '0x330B', 'AO3输出值', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:03:23', 'root', '2017-08-11 16:03:23', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (130, '1001', 81, '0x330C', 'AO4对应参数编号', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:03:23', 'root', '2017-08-11 16:03:23', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (131, '1001', 82, '0x330D', '变送输出第四通道对应电参数', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:03:23', 'root', '2017-08-11 16:03:23', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (132, '1001', 83, '0x330E', 'AO4参比设置值', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:03:23', 'root', '2017-08-11 16:03:23', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (133, '1001', 84, '0x330F', 'AO4 输出值', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:03:23', 'root', '2017-08-11 16:03:23', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (134, '1001', 85, '0x3400', '第一通道电能脉冲输出参数', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:03:23', 'root', '2017-08-11 16:03:23', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (135, '1001', 86, '0x3401', '第二通道电能脉冲常数', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:03:23', 'root', '2017-08-11 16:03:23', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (136, '1001', 87, '0x3402', '第二通道电能脉冲输出参数', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:03:23', 'root', '2017-08-11 16:03:23', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (137, '1001', 88, '0x3403', '第二通道电能脉冲常数', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:03:23', 'root', '2017-08-11 16:03:23', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (138, '1002', 1, '40001', 'A相电压/AB线电压', NULL, 'INT', 1, 0, 1, 0, 0.010000, 0, 2, 'collect_base_info', NULL, NULL, 'a_voltage', 0, 'root', '2017-08-11 16:04:20', 'root', '2017-08-11 16:04:20', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (139, '1002', 2, '40002', 'B相电压/BC线电压', NULL, 'INT', 1, 0, 1, 0, 0.010000, 0, 2, 'collect_base_info', NULL, NULL, 'b_voltage', 0, 'root', '2017-08-11 16:04:20', 'root', '2017-08-11 16:04:20', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (140, '1002', 3, '40003', 'C相电压/CA线电压', NULL, 'INT', 1, 0, 1, 0, 0.010000, 0, 2, 'collect_base_info', NULL, NULL, 'c_voltage', 0, 'root', '2017-08-11 16:04:20', 'root', '2017-08-11 16:04:20', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (141, '1002', 4, '40004', '保留', NULL, 'INT', 1, 0, 0, 0, 0.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:04:20', 'root', '2017-08-11 16:04:20', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (142, '1002', 5, '40005', 'AB线电压', NULL, 'INT', 1, 0, 1, 0, 0.010000, 0, 2, 'collect_base_info', NULL, NULL, 'uab_line_voltage', 0, 'root', '2017-08-11 16:04:20', 'root', '2017-08-11 16:04:20', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (143, '1002', 6, '40006', 'BC线电压', NULL, 'INT', 1, 0, 1, 0, 0.010000, 0, 2, 'collect_base_info', NULL, NULL, 'ubc_line_voltage', 0, 'root', '2017-08-11 16:04:20', 'root', '2017-08-11 16:04:20', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (144, '1002', 7, '40007', 'CA线电压', NULL, 'INT', 1, 0, 1, 0, 0.010000, 0, 2, 'collect_base_info', NULL, NULL, 'uac_line_voltage', 0, 'root', '2017-08-11 16:04:20', 'root', '2017-08-11 16:04:20', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (145, '1002', 8, '40008', '保留', NULL, 'INT', 1, 0, 0, 0, 0.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:04:20', 'root', '2017-08-11 16:04:20', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (146, '1002', 9, '40009', '辅助通道', NULL, 'INT', 1, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:04:20', 'root', '2017-08-11 16:04:20', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (147, '1002', 10, '40010', 'A相电流', NULL, 'INT', 1, 0, 0, 1, 0.001000, 0, 2, 'collect_base_info', NULL, NULL, 'a_electricity', 0, 'root', '2017-08-11 16:04:20', 'root', '2017-08-11 16:04:20', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (148, '1002', 11, '40011', 'B相电流', NULL, 'INT', 1, 0, 0, 1, 0.001000, 0, 2, 'collect_base_info', NULL, NULL, 'b_electricity', 0, 'root', '2017-08-11 16:04:20', 'root', '2017-08-11 16:04:20', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (149, '1002', 12, '40012', 'C相电流', NULL, 'INT', 1, 0, 0, 1, 0.001000, 0, 2, 'collect_base_info', NULL, NULL, 'c_electricity', 0, 'root', '2017-08-11 16:04:20', 'root', '2017-08-11 16:04:20', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (150, '1002', 13, '40013', '保留', NULL, 'INT', 1, 0, 0, 0, 0.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:04:20', 'root', '2017-08-11 16:04:20', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (151, '1002', 14, '40014', '零序电流值', NULL, 'INT', 1, 0, 0, 0, 1.000000, 0, 2, NULL, 'collect_attach_info', NULL, 'z_electricity', 0, 'root', '2017-08-11 16:04:20', 'root', '2017-08-11 16:04:20', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (152, '1002', 15, '40015', 'A相有功功率', NULL, 'INT', 1, 0, 1, 1, 0.100000, 0, 2, 'collect_base_info', NULL, NULL, 'a_active_power', 0, 'root', '2017-08-11 16:04:20', 'root', '2017-08-11 16:04:20', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (153, '1002', 16, '40016', '保留', NULL, 'INT', 1, 0, 0, 0, 0.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:04:21', 'root', '2017-08-11 16:04:21', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (154, '1002', 17, '40017', 'B相有功功率', NULL, 'INT', 1, 0, 1, 1, 0.100000, 0, 2, 'collect_base_info', NULL, NULL, 'b_active_power', 0, 'root', '2017-08-11 16:04:21', 'root', '2017-08-11 16:04:21', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (155, '1002', 18, '40018', '保留', NULL, 'INT', 1, 0, 0, 0, 0.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:04:21', 'root', '2017-08-11 16:04:21', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (156, '1002', 19, '40019', 'C相有功功率', NULL, 'INT', 1, 0, 1, 1, 0.100000, 0, 2, 'collect_base_info', NULL, NULL, 'c_active_power', 0, 'root', '2017-08-11 16:04:21', 'root', '2017-08-11 16:04:21', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (157, '1002', 20, '40020', '保留', NULL, 'INT', 1, 0, 0, 0, 0.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:04:21', 'root', '2017-08-11 16:04:21', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (158, '1002', 21, '40021~40022', '三相有功功率', NULL, 'LONG', 1, 0, 1, 1, 0.100000, 0, 4, 'collect_base_info', NULL, NULL, 'total_active_power', 0, 'root', '2017-08-11 16:04:21', 'root', '2017-08-11 16:04:21', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (159, '1002', 22, '40023', 'A相无功功率', NULL, 'INT', 1, 0, 1, 1, 0.100000, 0, 2, 'collect_base_info', NULL, NULL, 'a_reactive_power', 0, 'root', '2017-08-11 16:04:21', 'root', '2017-08-11 16:04:21', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (160, '1002', 24, '40025', 'B相无功功率', NULL, 'INT', 1, 0, 1, 1, 0.100000, 0, 2, 'collect_base_info', NULL, NULL, 'b_reactive_power', 0, 'root', '2017-08-11 16:04:21', 'root', '2017-08-11 16:04:21', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (161, '1002', 25, '40026', '保留', NULL, 'INT', 1, 0, 0, 0, 0.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:04:21', 'root', '2017-08-11 16:04:21', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (162, '1002', 26, '40027', 'C相无功功率', NULL, 'INT', 1, 0, 1, 1, 0.100000, 0, 2, 'collect_base_info', NULL, NULL, 'c_reactive_power', 0, 'root', '2017-08-11 16:04:21', 'root', '2017-08-11 16:04:21', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (163, '1002', 27, '40028', '保留', NULL, 'INT', 1, 0, 0, 0, 0.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:04:21', 'root', '2017-08-11 16:04:21', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (164, '1002', 28, '40029~40030', '三相无功功率', NULL, 'LONG', 1, 0, 1, 1, 0.100000, 0, 4, 'collect_base_info', NULL, NULL, 'total_reactive_power', 0, 'root', '2017-08-11 16:04:21', 'root', '2017-08-11 16:04:21', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (165, '1002', 29, '40031', 'A相视在功率', NULL, 'INT', 1, 0, 1, 1, 0.100000, 0, 2, 'collect_base_info', NULL, NULL, 'a_ap_power', 0, 'root', '2017-08-11 16:04:21', 'root', '2017-08-11 16:04:21', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (166, '1002', 30, '40032', '保留', NULL, 'INT', 1, 0, 0, 0, 0.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:04:21', 'root', '2017-08-11 16:04:21', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (167, '1002', 31, '40033', 'B相视在功率', NULL, 'INT', 1, 0, 1, 1, 0.100000, 0, 2, 'collect_base_info', NULL, NULL, 'b_ap_power', 0, 'root', '2017-08-11 16:04:21', 'root', '2017-08-11 16:04:21', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (168, '1002', 32, '40034', '保留', NULL, 'INT', 1, 0, 0, 0, 0.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:04:21', 'root', '2017-08-11 16:04:21', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (169, '1002', 33, '40035', 'C相视在功率', NULL, 'INT', 1, 0, 1, 1, 0.100000, 0, 2, 'collect_base_info', NULL, NULL, 'c_ap_power', 0, 'root', '2017-08-11 16:04:21', 'root', '2017-08-11 16:04:21', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (170, '1002', 34, '40036', '保留', NULL, 'INT', 1, 0, 0, 0, 0.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:04:21', 'root', '2017-08-11 16:04:21', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (171, '1002', 35, '40037', '三相视在功率', NULL, 'INT', 1, 0, 1, 1, 0.100000, 0, 2, 'collect_base_info', NULL, NULL, 'total_ap_power', 0, 'root', '2017-08-11 16:04:21', 'root', '2017-08-11 16:04:21', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (172, '1002', 36, '40038', '保留', NULL, 'INT', 1, 0, 0, 0, 0.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:04:21', 'root', '2017-08-11 16:04:21', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (173, '1002', 37, '40039', 'A相功率因数', NULL, 'INT', 1, 0, 0, 0, 0.001000, 0, 2, 'collect_base_info', NULL, NULL, 'a_power_factor', 0, 'root', '2017-08-11 16:04:21', 'root', '2017-08-11 16:04:21', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (174, '1002', 38, '40040', 'B相功率因数', NULL, 'INT', 1, 0, 0, 0, 0.001000, 0, 2, 'collect_base_info', NULL, NULL, 'b_power_factor', 0, 'root', '2017-08-11 16:04:21', 'root', '2017-08-11 16:04:21', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (175, '1002', 39, '40041', 'C相功率因数', NULL, 'INT', 1, 0, 0, 0, 0.001000, 0, 2, 'collect_base_info', NULL, NULL, 'c_power_factor', 0, 'root', '2017-08-11 16:04:21', 'root', '2017-08-11 16:04:21', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (176, '1002', 40, '40042', '功率因数总值', NULL, 'INT', 1, 0, 0, 0, 0.001000, 0, 2, 'collect_base_info', NULL, NULL, 'total_power_factor', 0, 'root', '2017-08-11 16:04:21', 'root', '2017-08-11 16:04:21', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (177, '1002', 41, '40043', '系统频率', NULL, 'INT', 1, 0, 0, 0, 0.010000, 0, 2, 'collect_base_info', NULL, NULL, 'frequency', 0, 'root', '2017-08-11 16:04:21', 'root', '2017-08-11 16:04:21', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (178, '1002', 42, '40044', '开关量状态', NULL, 'INT', 1, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:04:21', 'root', '2017-08-11 16:04:21', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (179, '1002', 43, '40045', '继电器状态', NULL, 'INT', 1, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:04:21', 'root', '2017-08-11 16:04:21', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (180, '1002', 44, '40046', 'SOE 事件数目', NULL, 'INT', 1, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:04:21', 'root', '2017-08-11 16:04:21', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (181, '1002', 45, '40047~40048', '有功电度输入', NULL, 'LONG', 1, 0, 0, 0, 0.100000, 0, 4, 'collect_base_info', NULL, NULL, 'total_p_at_ee', 0, 'root', '2017-08-11 16:04:21', 'root', '2017-08-11 16:04:21', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (182, '1002', 46, '40049~40050', '有功电度输出', NULL, 'LONG', 1, 0, 0, 0, 0.100000, 0, 4, 'collect_base_info', NULL, NULL, 'total_r_at_ee', 0, 'root', '2017-08-11 16:04:21', 'root', '2017-08-11 16:04:21', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (183, '1002', 51, '40055~40056', '无功电度输入', NULL, 'LONG', 1, 0, 0, 0, 0.100000, 0, 4, 'collect_base_info', NULL, NULL, 'total_p_reat_ee', 0, 'root', '2017-08-11 16:04:21', 'root', '2017-08-11 16:04:21', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (184, '1002', 52, '40057~40058', '无功电度输出', NULL, 'LONG', 1, 0, 0, 0, 0.100000, 0, 4, 'collect_base_info', NULL, NULL, 'total_r_reat_ee', 0, 'root', '2017-08-11 16:04:21', 'root', '2017-08-11 16:04:21', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (185, '1003', 1, '0x0000', 'A相电压', NULL, 'INT', 0, 0, 1, 0, 0.010000, 0, 2, 'collect_base_info', NULL, NULL, 'a_voltage', 0, 'root', '2017-08-11 16:06:02', 'root', '2017-08-11 16:06:02', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (186, '1003', 2, '0x0001', 'CA线电压', NULL, 'INT', 0, 0, 1, 0, 0.010000, 0, 2, 'collect_base_info', NULL, NULL, 'uac_line_voltage', 0, 'root', '2017-08-11 16:06:02', 'root', '2017-08-11 16:06:02', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (187, '1003', 3, '0x0002', 'A相电流', NULL, 'INT', 0, 0, 0, 1, 0.000100, 0, 2, 'collect_base_info', NULL, NULL, 'a_electricity', 0, 'root', '2017-08-11 16:06:02', 'root', '2017-08-11 16:06:02', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (188, '1003', 4, '0x0003', '保留', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:06:02', 'root', '2017-08-11 16:06:02', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (189, '1003', 5, '0x0004', 'A相有功功率', NULL, 'INT', 0, 0, 1, 1, 0.400000, 0, 2, 'collect_base_info', NULL, NULL, 'a_active_power', 0, 'root', '2017-08-11 16:06:02', 'root', '2017-08-11 16:06:02', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (190, '1003', 6, '0x0005', 'A相有功因数', NULL, 'INT', 0, 0, 0, 0, 0.001000, 0, 2, 'collect_base_info', NULL, NULL, 'a_power_factor', 0, 'root', '2017-08-11 16:06:02', 'root', '2017-08-11 16:06:02', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (191, '1003', 7, '0x0006', 'A相无功功率', NULL, 'INT', 0, 0, 1, 1, 0.400000, 0, 2, 'collect_base_info', NULL, NULL, 'a_reactive_power', 0, 'root', '2017-08-11 16:06:02', 'root', '2017-08-11 16:06:02', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (192, '1003', 8, '0x0007', 'A相视在功率', NULL, 'INT', 0, 0, 1, 1, 0.200000, 0, 2, 'collect_base_info', NULL, NULL, 'a_ap_power', 0, 'root', '2017-08-11 16:06:02', 'root', '2017-08-11 16:06:02', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (193, '1003', 9, '0x0008', 'B相电压', NULL, 'INT', 0, 0, 1, 0, 0.010000, 0, 2, 'collect_base_info', NULL, NULL, 'b_voltage', 0, 'root', '2017-08-11 16:06:02', 'root', '2017-08-11 16:06:02', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (194, '1003', 10, '0x0009', 'AB线电压', NULL, 'INT', 0, 0, 1, 0, 0.010000, 0, 2, 'collect_base_info', NULL, NULL, 'uab_line_voltage', 0, 'root', '2017-08-11 16:06:02', 'root', '2017-08-11 16:06:02', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (195, '1003', 11, '0x000A', 'B相电流', NULL, 'INT', 0, 0, 0, 1, 0.000100, 0, 2, 'collect_base_info', NULL, NULL, 'b_electricity', 0, 'root', '2017-08-11 16:06:02', 'root', '2017-08-11 16:06:02', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (196, '1003', 12, '0x000B', '保留', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:06:02', 'root', '2017-08-11 16:06:02', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (197, '1003', 13, '0x000C', 'B相有功功率', NULL, 'INT', 0, 0, 1, 1, 0.400000, 0, 2, 'collect_base_info', NULL, NULL, 'b_active_power', 0, 'root', '2017-08-11 16:06:02', 'root', '2017-08-11 16:06:02', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (198, '1003', 14, '0x000D', 'B相功率因数', NULL, 'INT', 0, 0, 0, 0, 0.000100, 0, 2, 'collect_base_info', NULL, NULL, 'b_power_factor', 0, 'root', '2017-08-11 16:06:02', 'root', '2017-08-11 16:06:02', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (199, '1003', 15, '0x000E', 'B相无功功率', NULL, 'INT', 0, 0, 1, 1, 0.400000, 0, 2, 'collect_base_info', NULL, NULL, 'b_reactive_power', 0, 'root', '2017-08-11 16:06:02', 'root', '2017-08-11 16:06:02', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (200, '1003', 16, '0x000F', 'B相视在功率', NULL, 'INT', 0, 0, 1, 1, 0.200000, 0, 2, 'collect_base_info', NULL, NULL, 'b_ap_power', 0, 'root', '2017-08-11 16:06:02', 'root', '2017-08-11 16:06:02', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (201, '1003', 17, '0x0010', 'C相电压Uc', NULL, 'INT', 0, 0, 1, 0, 0.010000, 0, 2, 'collect_base_info', NULL, NULL, 'c_voltage', 0, 'root', '2017-08-11 16:06:02', 'root', '2017-08-11 16:06:02', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (202, '1003', 18, '0x0011', 'BC线电压', NULL, 'INT', 0, 0, 1, 0, 0.010000, 0, 2, 'collect_base_info', NULL, NULL, 'ubc_line_voltage', 0, 'root', '2017-08-11 16:06:02', 'root', '2017-08-11 16:06:02', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (203, '1003', 19, '0x0012', 'C相电流', NULL, 'INT', 0, 0, 0, 1, 0.000100, 0, 2, 'collect_base_info', NULL, NULL, 'c_electricity', 0, 'root', '2017-08-11 16:06:02', 'root', '2017-08-11 16:06:02', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (204, '1003', 20, '0x0013', '漏电流', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:06:02', 'root', '2017-08-11 16:06:02', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (205, '1003', 21, '0x0014', 'C相有功功率', NULL, 'INT', 0, 0, 1, 1, 0.400000, 0, 2, 'collect_base_info', NULL, NULL, 'c_active_power', 0, 'root', '2017-08-11 16:06:02', 'root', '2017-08-11 16:06:02', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (206, '1003', 22, '0x0015', 'C相功率因数', NULL, 'INT', 0, 0, 0, 0, 0.000100, 0, 2, 'collect_base_info', NULL, NULL, 'c_power_factor', 0, 'root', '2017-08-11 16:06:02', 'root', '2017-08-11 16:06:02', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (207, '1003', 23, '0x0016', 'C相无功功率', NULL, 'INT', 0, 0, 1, 1, 0.400000, 0, 2, 'collect_base_info', NULL, NULL, 'c_reactive_power', 0, 'root', '2017-08-11 16:06:02', 'root', '2017-08-11 16:06:02', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (208, '1003', 24, '0x0017', 'C相视在功率', NULL, 'INT', 0, 0, 1, 1, 0.200000, 0, 2, 'collect_base_info', NULL, NULL, 'c_ap_power', 0, 'root', '2017-08-11 16:06:02', 'root', '2017-08-11 16:06:02', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (209, '1003', 25, '0x0018', '三相平均相电压', NULL, 'INT', 0, 0, 1, 0, 0.010000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:06:03', 'root', '2017-08-11 16:06:03', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (210, '1003', 26, '0x0019', '三相平均线电压', NULL, 'INT', 0, 0, 1, 0, 0.010000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:06:03', 'root', '2017-08-11 16:06:03', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (211, '1003', 27, '0x001A', '三相平均相电流', NULL, 'INT', 0, 0, 0, 1, 0.000100, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:06:03', 'root', '2017-08-11 16:06:03', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (212, '1003', 28, '0x001B', '频率', NULL, 'INT', 0, 0, 0, 0, 0.001068, 0, 2, 'collect_base_info', NULL, NULL, 'frequency', 0, 'root', '2017-08-11 16:06:03', 'root', '2017-08-11 16:06:03', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (213, '1003', 29, '0x001C', '三相有功功率', NULL, 'INT', 0, 0, 1, 1, 0.400000, 0, 2, 'collect_base_info', NULL, NULL, 'total_active_power', 0, 'root', '2017-08-11 16:06:03', 'root', '2017-08-11 16:06:03', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (214, '1003', 30, '0x001D', '三相总功率因数', NULL, 'INT', 0, 0, 0, 0, 0.000100, 0, 2, 'collect_base_info', NULL, NULL, 'total_power_factor', 0, 'root', '2017-08-11 16:06:03', 'root', '2017-08-11 16:06:03', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (215, '1003', 31, '0x001E', '三相无功功率', NULL, 'INT', 0, 0, 1, 1, 0.400000, 0, 2, 'collect_base_info', NULL, NULL, 'total_reactive_power', 0, 'root', '2017-08-11 16:06:03', 'root', '2017-08-11 16:06:03', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (216, '1003', 32, '0x001F', '三相视在功率', NULL, 'INT', 0, 0, 1, 1, 0.200000, 0, 2, 'collect_base_info', NULL, NULL, 'total_ap_power', 0, 'root', '2017-08-11 16:06:03', 'root', '2017-08-11 16:06:03', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (217, '1003', 33, '0x0020', '保留', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:06:03', 'root', '2017-08-11 16:06:03', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (218, '1003', 34, '0x0021', '正向有功电能累加值', NULL, 'LONG', 0, 0, 1, 1, 1.000000, 0, 4, 'collect_base_info', NULL, NULL, 'total_p_at_ee', 0, 'root', '2017-08-11 16:06:03', 'root', '2017-08-11 16:06:03', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (219, '1003', 35, '0x0023', '负向有功电能累加值', NULL, 'LONG', 0, 0, 1, 1, 1.000000, 0, 4, 'collect_base_info', NULL, NULL, 'total_r_at_ee', 0, 'root', '2017-08-11 16:06:03', 'root', '2017-08-11 16:06:03', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (220, '1003', 36, '0x0025', '正向无功电能累加值', NULL, 'LONG', 0, 0, 1, 1, 1.000000, 0, 4, 'collect_base_info', NULL, NULL, 'total_p_reat_ee', 0, 'root', '2017-08-11 16:06:03', 'root', '2017-08-11 16:06:03', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (221, '1003', 37, '0x0027', '负向无功电能累加值', NULL, 'LONG', 0, 0, 1, 1, 1.000000, 0, 4, 'collect_base_info', NULL, NULL, 'total_r_reat_ee', 0, 'root', '2017-08-11 16:06:03', 'root', '2017-08-11 16:06:03', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (222, '1003', 38, '0x0300', '本机地址', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:06:03', 'root', '2017-08-11 16:06:03', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (223, '1003', 39, '0x0301', '被测系统负载接线方式', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:06:03', 'root', '2017-08-11 16:06:03', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (224, '1003', 40, '0x0304', '波特率', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:06:03', 'root', '2017-08-11 16:06:03', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (225, '1003', 41, '0x0305', '电压输入范围', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:06:03', 'root', '2017-08-11 16:06:03', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (226, '1003', 42, '0x0307', 'PT', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:06:03', 'root', '2017-08-11 16:06:03', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (227, '1003', 43, '0x0309', 'CT', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:06:03', 'root', '2017-08-11 16:06:03', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (228, '1003', 44, '0x031F', '光亮强度', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:06:03', 'root', '2017-08-11 16:06:03', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (229, '1004', 1, '0x0000~0x0001', 'A相有功功率', '瓦', 'FLOAT', 1, 0, 0, 0, 0.001000, 0, 4, 'collect_base_info', NULL, NULL, 'a_active_power', 0, 'root', '2017-08-11 16:07:39', 'root', '2017-08-11 16:07:39', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (230, '1004', 2, '0x0002~0x0003', 'B相有功功率', '瓦', 'FLOAT', 1, 0, 0, 0, 0.001000, 0, 4, 'collect_base_info', NULL, NULL, 'b_active_power', 0, 'root', '2017-08-11 16:07:39', 'root', '2017-08-11 16:07:39', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (231, '1004', 3, '0x0004~0x0005', 'C相有功功率', '瓦', 'FLOAT', 1, 0, 0, 0, 0.001000, 0, 4, 'collect_base_info', NULL, NULL, 'c_active_power', 0, 'root', '2017-08-11 16:07:39', 'root', '2017-08-11 16:07:39', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (232, '1004', 4, '0x0006~0x0007', '合相有功功率', '瓦', 'FLOAT', 1, 0, 0, 0, 0.001000, 0, 4, 'collect_base_info', NULL, NULL, 'total_active_power', 0, 'root', '2017-08-11 16:07:39', 'root', '2017-08-11 16:07:39', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (233, '1004', 5, '0x0008~0x0009', 'A相无功功率', '乏', 'FLOAT', 1, 0, 0, 0, 0.001000, 0, 4, 'collect_base_info', NULL, NULL, 'a_reactive_power', 0, 'root', '2017-08-11 16:07:39', 'root', '2017-08-11 16:07:39', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (234, '1004', 6, '0x000A~0x000B', 'B相无功功率', '乏', 'FLOAT', 1, 0, 0, 0, 0.001000, 0, 4, 'collect_base_info', NULL, NULL, 'b_reactive_power', 0, 'root', '2017-08-11 16:07:39', 'root', '2017-08-11 16:07:39', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (235, '1004', 7, '0x000C~0x000d', 'C相无功功率', '乏', 'FLOAT', 1, 0, 0, 0, 0.001000, 0, 4, 'collect_base_info', NULL, NULL, 'c_reactive_power', 0, 'root', '2017-08-11 16:07:39', 'root', '2017-08-11 16:07:39', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (236, '1004', 8, '0x000E~0x000F', '合相无功功率', '乏', 'FLOAT', 1, 0, 0, 0, 0.001000, 0, 4, 'collect_base_info', NULL, NULL, 'total_reactive_power', 0, 'root', '2017-08-11 16:07:39', 'root', '2017-08-11 16:07:39', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (237, '1004', 9, '0x0010~0x0011', 'A相视在功率', '伏安', 'FLOAT', 1, 0, 0, 0, 0.001000, 0, 4, 'collect_base_info', NULL, NULL, 'a_ap_power', 0, 'root', '2017-08-11 16:07:39', 'root', '2017-08-11 16:07:39', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (238, '1004', 10, '0x0012~0x0013', 'B相视在功率', '伏安', 'FLOAT', 1, 0, 0, 0, 0.001000, 0, 4, 'collect_base_info', NULL, NULL, 'b_ap_power', 0, 'root', '2017-08-11 16:07:39', 'root', '2017-08-11 16:07:39', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (239, '1004', 11, '0x0014~0x0015', 'C相视在功率', '伏安', 'FLOAT', 1, 0, 0, 0, 0.001000, 0, 4, 'collect_base_info', NULL, NULL, 'c_ap_power', 0, 'root', '2017-08-11 16:07:39', 'root', '2017-08-11 16:07:39', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (240, '1004', 12, '0x0016~0x0017', '合相视在功率', '伏安', 'FLOAT', 1, 0, 0, 0, 0.001000, 0, 4, 'collect_base_info', NULL, NULL, 'total_ap_power', 0, 'root', '2017-08-11 16:07:39', 'root', '2017-08-11 16:07:39', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (241, '1004', 13, '0x0018~0x0019', 'A相电压有效值', '伏特', 'FLOAT', 1, 0, 0, 0, 1.000000, 0, 4, 'collect_base_info', NULL, NULL, 'a_voltage', 0, 'root', '2017-08-11 16:07:39', 'root', '2017-08-11 16:07:39', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (242, '1004', 14, '0x001A~0x001B', 'B相电压有效值', '伏特', 'FLOAT', 1, 0, 0, 0, 1.000000, 0, 4, 'collect_base_info', NULL, NULL, 'b_voltage', 0, 'root', '2017-08-11 16:07:39', 'root', '2017-08-11 16:07:39', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (243, '1004', 15, '0x001C~0x001D', 'C相电压有效值', '伏特', 'FLOAT', 1, 0, 0, 0, 1.000000, 0, 4, 'collect_base_info', NULL, NULL, 'c_voltage', 0, 'root', '2017-08-11 16:07:39', 'root', '2017-08-11 16:07:39', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (244, '1004', 16, '0x001E~0x001F', 'A相电流有效值', '安培', 'FLOAT', 1, 0, 0, 0, 1.000000, 0, 4, 'collect_base_info', NULL, NULL, 'a_electricity', 0, 'root', '2017-08-11 16:07:39', 'root', '2017-08-11 16:07:39', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (245, '1004', 17, '0x0020~0x0021', 'B相电流有效值', '安培', 'FLOAT', 1, 0, 0, 0, 1.000000, 0, 4, 'collect_base_info', NULL, NULL, 'b_electricity', 0, 'root', '2017-08-11 16:07:39', 'root', '2017-08-11 16:07:39', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (246, '1004', 18, '0x0022~0x0023', 'C相电流有效值', '安培', 'FLOAT', 1, 0, 0, 0, 1.000000, 0, 4, 'collect_base_info', NULL, NULL, 'c_electricity', 0, 'root', '2017-08-11 16:07:39', 'root', '2017-08-11 16:07:39', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (247, '1004', 19, '0x0024~0x0025', '保留', NULL, 'FLOAT', 1, 0, 0, 0, 0.000000, 0, 4, '', '', NULL, '', 0, 'root', '2017-08-11 16:07:39', 'root', '2017-08-11 16:07:39', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (248, '1004', 20, '0x0026~0x0027', 'A相功率因数', NULL, 'FLOAT', 1, 0, 0, 0, 1.000000, 0, 4, 'collect_base_info', NULL, NULL, 'a_power_factor', 0, 'root', '2017-08-11 16:07:39', 'root', '2017-08-11 16:07:39', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (249, '1004', 21, '0x0028~0x0029', 'B相功率因数', NULL, 'FLOAT', 1, 0, 0, 0, 1.000000, 0, 4, 'collect_base_info', NULL, NULL, 'b_power_factor', 0, 'root', '2017-08-11 16:07:39', 'root', '2017-08-11 16:07:39', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (250, '1004', 22, '0x002A~0x002B', 'C相功率因数', NULL, 'FLOAT', 1, 0, 0, 0, 1.000000, 0, 4, 'collect_base_info', NULL, NULL, 'c_power_factor', 0, 'root', '2017-08-11 16:07:39', 'root', '2017-08-11 16:07:39', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (251, '1004', 23, '0x002C~0x002D', '合相功率因数', NULL, 'FLOAT', 1, 0, 0, 0, 1.000000, 0, 4, 'collect_base_info', NULL, NULL, 'total_power_factor', 0, 'root', '2017-08-11 16:07:39', 'root', '2017-08-11 16:07:39', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (252, '1004', 24, '0x002E~0x002F', '保留', NULL, 'FLOAT', 1, 0, 0, 0, 0.000000, 0, 4, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:07:39', 'root', '2017-08-11 16:07:39', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (253, '1004', 25, '0x0030~0x0031', '保留', NULL, 'FLOAT', 1, 0, 0, 0, 0.000000, 0, 4, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:07:39', 'root', '2017-08-11 16:07:39', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (254, '1004', 26, '0x0032~0x0033', '保留', NULL, 'FLOAT', 1, 0, 0, 0, 0.000000, 0, 4, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:07:40', 'root', '2017-08-11 16:07:40', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (255, '1004', 27, '0x0034~0x0035', '保留', NULL, 'FLOAT', 1, 0, 0, 0, 0.000000, 0, 4, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:07:40', 'root', '2017-08-11 16:07:40', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (256, '1004', 28, '0x0036~0x0037', '频率', '赫兹', 'FLOAT', 1, 0, 0, 0, 1.000000, 0, 4, 'collect_base_info', NULL, NULL, 'frequency', 0, 'root', '2017-08-11 16:07:40', 'root', '2017-08-11 16:07:40', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (257, '1004', 29, '0x0038~0x0039', '零序电压', '伏特', 'FLOAT', 1, 0, 0, 0, 1.000000, 0, 4, '', NULL, NULL, '', 0, 'root', '2017-08-11 16:07:40', 'root', '2017-08-11 16:07:40', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (258, '1004', 30, '0x003A~0x003B', '吸收有功电度', '千瓦时', 'FLOAT', 1, 0, 0, 0, 1.000000, 0, 4, 'collect_base_info', NULL, NULL, 'total_p_at_ee', 0, 'root', '2017-08-11 16:07:40', 'root', '2017-08-11 16:07:40', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (259, '1004', 31, '0x003C~0x003D', '释放有功电度', '千瓦时', 'FLOAT', 1, 0, 0, 0, 1.000000, 0, 4, 'collect_base_info', NULL, NULL, 'total_r_at_ee', 0, 'root', '2017-08-11 16:07:40', 'root', '2017-08-11 16:07:40', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (260, '1004', 32, '0x003E~0x003F', '感性无功电度', '千乏时', 'FLOAT', 1, 0, 0, 0, 1.000000, 0, 4, 'collect_base_info', NULL, NULL, 'total_p_reat_ee', 0, 'root', '2017-08-11 16:07:40', 'root', '2017-08-11 16:07:40', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (261, '1004', 33, '0x0040~0x0041', '容性无功电度', '千乏时', 'FLOAT', 1, 0, 0, 0, 1.000000, 0, 4, 'collect_base_info', NULL, NULL, 'total_r_reat_ee', 0, 'root', '2017-08-11 16:07:40', 'root', '2017-08-11 16:07:40', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (262, '1004', 34, '0x0042~0x0043', '总有功电能', '千瓦时', 'FLOAT', 1, 0, 0, 0, 1.000000, 0, 4, 'collect_base_info', NULL, NULL, 'total_at_ee', 0, 'root', '2017-08-11 16:07:40', 'root', '2017-08-11 16:07:40', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (263, '1004', 35, '0x0044~0x0045', '总无功电能', '千乏时', 'FLOAT', 1, 0, 0, 0, 1.000000, 0, 4, 'collect_base_info', NULL, NULL, 'total_ap_reat_ee', 0, 'root', '2017-08-11 16:07:40', 'root', '2017-08-11 16:07:40', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (264, '1004', 36, '0x0046~0x0047', '总视在电能', '千瓦安时', 'FLOAT', 1, 0, 0, 0, 1.000000, 0, 4, 'collect_base_info', NULL, NULL, 'total_ap_a_ee', 0, 'root', '2017-08-11 16:07:40', 'root', '2017-08-11 16:07:40', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (265, '1004', 37, '0x0048~0x0049', '尖时段总有功电能', '千瓦时', 'FLOAT', 1, 0, 0, 0, 1.000000, 0, 4, 'collect_base_info', NULL, NULL, 'tip_total_at_ee', 0, 'root', '2017-08-11 16:07:40', 'root', '2017-08-11 16:07:40', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (266, '1004', 38, '0x004A~0x004B', '峰时段总有功电能', '千瓦时', 'FLOAT', 1, 0, 0, 0, 1.000000, 0, 4, 'collect_base_info', NULL, NULL, 'peak_total_at_ee', 0, 'root', '2017-08-11 16:07:40', 'root', '2017-08-11 16:07:40', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (267, '1004', 39, '0x004C~0x004D', '平时段总有功电能', '千瓦时', 'FLOAT', 1, 0, 0, 0, 1.000000, 0, 4, 'collect_base_info', NULL, NULL, 'flat_total_at_ee', 0, 'root', '2017-08-11 16:07:40', 'root', '2017-08-11 16:07:40', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (268, '1004', 40, '0x004E~0x004F', '谷时段总有功电能', '千瓦时', 'FLOAT', 1, 0, 0, 0, 1.000000, 0, 4, 'collect_base_info', NULL, NULL, 'valley_total_at_ee', 0, 'root', '2017-08-11 16:07:40', 'root', '2017-08-11 16:07:40', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (269, '1004', 41, '0x0050~0x0051', '尖时段总无功电能', '千乏时', 'FLOAT', 1, 0, 0, 0, 1.000000, 0, 4, 'collect_base_info', NULL, NULL, 'tip_total_ap_reat_ee', 0, 'root', '2017-08-11 16:07:40', 'root', '2017-08-11 16:07:40', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (270, '1004', 42, '0x0052~0x0053', '峰时段总无功电能', '千乏时', 'FLOAT', 1, 0, 0, 0, 1.000000, 0, 4, 'collect_base_info', NULL, NULL, 'peak_total_ap_reat_ee', 0, 'root', '2017-08-11 16:07:40', 'root', '2017-08-11 16:07:40', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (271, '1004', 43, '0x0054~0x0055', '平时段总无功电能', '千乏时', 'FLOAT', 1, 0, 0, 0, 1.000000, 0, 4, 'collect_base_info', NULL, NULL, 'flat_total_ap_reat_ee', 0, 'root', '2017-08-11 16:07:40', 'root', '2017-08-11 16:07:40', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (272, '1004', 44, '0x0056~0x0057', '谷时段总无功电能', '千乏时', 'FLOAT', 1, 0, 0, 0, 1.000000, 0, 4, 'collect_base_info', NULL, NULL, 'valley_total_ap_reat_ee', 0, 'root', '2017-08-11 16:07:40', 'root', '2017-08-11 16:07:40', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (273, '1004', 45, '0x0058~0x0059', '尖时段总视在电能', '千瓦安时', 'FLOAT', 1, 0, 0, 0, 1.000000, 0, 4, 'collect_base_info', NULL, NULL, 'tip_total_ap_a_ee', 0, 'root', '2017-08-11 16:07:40', 'root', '2017-08-11 16:07:40', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (274, '1004', 46, '0x005A~0x005B', '峰时段总视在电能', '千瓦安时', 'FLOAT', 1, 0, 0, 0, 1.000000, 0, 4, 'collect_base_info', NULL, NULL, 'peak_total_ap_a_ee', 0, 'root', '2017-08-11 16:07:40', 'root', '2017-08-11 16:07:40', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (275, '1004', 47, '0x005C~0x005D', '平时段总视在电能', '千瓦安时', 'FLOAT', 1, 0, 0, 0, 1.000000, 0, 4, 'collect_base_info', NULL, NULL, 'flat_total_ap_a_ee', 0, 'root', '2017-08-11 16:07:40', 'root', '2017-08-11 16:07:40', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (276, '1004', 48, '0x005E~0x005F', '谷时段总视在电能', '千瓦安时', 'FLOAT', 1, 0, 0, 0, 1.000000, 0, 4, 'collect_base_info', NULL, NULL, 'valley_total_ap_a_ee', 0, 'root', '2017-08-11 16:07:40', 'root', '2017-08-11 16:07:40', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (277, '1004', 49, '0x0060~0x0061', '当月总有功电能', '千瓦时', 'FLOAT', 1, 0, 0, 0, 1.000000, 0, 4, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:07:40', 'root', '2017-08-11 16:07:40', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (278, '1004', 50, '0x0062~0x0063', '上月总有功电能', '千瓦时', 'FLOAT', 1, 0, 0, 0, 1.000000, 0, 4, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:07:40', 'root', '2017-08-11 16:07:40', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (279, '1004', 51, '0x0064~0x0065', '上上月总有功电能', '千瓦时', 'FLOAT', 2, 0, 0, 0, 1.000000, 0, 4, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:07:40', 'root', '2017-08-11 16:07:40', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (280, '1004', 52, '0x0066~0x0067', '当月总无功电能', '千乏时', 'FLOAT', 2, 0, 0, 0, 1.000000, 0, 4, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:07:40', 'root', '2017-08-11 16:07:40', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (281, '1004', 53, '0x0068~0x0069', '上月总无功电能', '千乏时', 'FLOAT', 2, 0, 0, 0, 1.000000, 0, 4, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:07:40', 'root', '2017-08-11 16:07:40', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (282, '1004', 54, '0x006A~0x006B', '上上月总无功电能', '千乏时', 'FLOAT', 2, 0, 0, 0, 1.000000, 0, 4, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:07:40', 'root', '2017-08-11 16:07:40', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (283, '1004', 55, '0x006C~0x006D', '当月视在功电能', '千瓦安时', 'FLOAT', 2, 0, 0, 0, 1.000000, 0, 4, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:07:40', 'root', '2017-08-11 16:07:40', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (284, '1004', 56, '0x006E~0x006F', '上月视在功电能', '千瓦安时', 'FLOAT', 2, 0, 0, 0, 1.000000, 0, 4, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:07:40', 'root', '2017-08-11 16:07:40', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (285, '1004', 57, '0x0070~0x0071', '上上月视在功电能', '千瓦安时', 'FLOAT', 2, 0, 0, 0, 1.000000, 0, 4, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:07:40', 'root', '2017-08-11 16:07:40', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (286, '1004', 58, '0x0072~0x0073', 'Uab线电压', '伏特', 'FLOAT', 2, 0, 0, 0, 1.000000, 0, 4, 'collect_base_info', NULL, NULL, 'uab_line_voltage', 0, 'root', '2017-08-11 16:07:40', 'root', '2017-08-11 16:07:40', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (287, '1004', 59, '0x0074~0x0075', 'Ubc线电压', '伏特', 'FLOAT', 2, 0, 0, 0, 1.000000, 0, 4, 'collect_base_info', NULL, NULL, 'ubc_line_voltage', 0, 'root', '2017-08-11 16:07:40', 'root', '2017-08-11 16:07:40', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (288, '1004', 60, '0x0076~0x0077', 'Uca线电压', '伏特', 'FLOAT', 2, 0, 0, 0, 1.000000, 0, 4, 'collect_base_info', NULL, NULL, 'uac_line_voltage', 0, 'root', '2017-08-11 16:07:40', 'root', '2017-08-11 16:07:40', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (289, '1004', 61, '0x0078~0x0079', 'PT电压变比', NULL, 'FLOAT', 2, 0, 0, 0, 1.000000, 0, 4, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:07:40', 'root', '2017-08-11 16:07:40', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (290, '1004', 62, '0x007A~0x007B', 'CT电压变比', NULL, 'FLOAT', 2, 0, 0, 0, 1.000000, 0, 4, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-11 16:07:41', 'root', '2017-08-11 16:07:41', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (306, '1005', 1, '0x0000', 'A相电压', NULL, 'INT', 0, 0, 1, 0, 0.010000, 0, 2, 'collect_base_info', NULL, NULL, 'a_voltage', 0, 'root', '2017-08-15 16:42:48', 'root', '2017-08-15 16:42:48', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (307, '1005', 2, '0x0001', 'CA线电压', NULL, 'INT', 0, 0, 1, 0, 0.010000, 0, 2, 'collect_base_info', NULL, NULL, 'uac_line_voltage', 0, 'root', '2017-08-15 16:42:48', 'root', '2017-08-15 16:42:48', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (308, '1005', 3, '0x0002', 'A相电流', NULL, 'INT', 0, 0, 0, 1, 0.000100, 0, 2, 'collect_base_info', NULL, NULL, 'a_electricity', 0, 'root', '2017-08-15 16:42:48', 'root', '2017-08-15 16:42:48', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (309, '1005', 4, '0x0003', '保留', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-15 16:42:48', 'root', '2017-08-15 16:42:48', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (310, '1005', 5, '0x0004', 'A相有功功率', NULL, 'INT', 0, 0, 1, 1, 0.400000, 0, 2, 'collect_base_info', NULL, NULL, 'a_active_power', 0, 'root', '2017-08-15 16:42:48', 'root', '2017-08-15 16:42:48', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (311, '1005', 6, '0x0005', 'A相功率因数', NULL, 'INT', 0, 0, 0, 0, 0.000100, 0, 2, 'collect_base_info', NULL, NULL, 'a_power_factor', 0, 'root', '2017-08-15 16:42:48', 'root', '2017-08-15 16:42:48', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (312, '1005', 7, '0x0006', 'A相无功功率', NULL, 'INT', 0, 0, 1, 1, 0.400000, 0, 2, 'collect_base_info', NULL, NULL, 'a_reactive_power', 0, 'root', '2017-08-15 16:42:48', 'root', '2017-08-15 16:42:48', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (313, '1005', 8, '0x0007', 'A相视在功率', NULL, 'INT', 0, 0, 1, 1, 0.200000, 0, 2, 'collect_base_info', NULL, NULL, 'a_ap_power', 0, 'root', '2017-08-15 16:42:48', 'root', '2017-08-15 16:42:48', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (314, '1005', 9, '0x0008', 'B相电压', NULL, 'INT', 0, 0, 1, 0, 0.010000, 0, 2, 'collect_base_info', NULL, NULL, 'b_voltage', 0, 'root', '2017-08-15 16:42:48', 'root', '2017-08-15 16:42:48', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (315, '1005', 10, '0x0009', 'AB线电压', NULL, 'INT', 0, 0, 1, 0, 0.010000, 0, 2, 'collect_base_info', NULL, NULL, 'uab_line_voltage', 0, 'root', '2017-08-15 16:42:48', 'root', '2017-08-15 16:42:48', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (316, '1005', 11, '0x000A', 'B相电流', NULL, 'INT', 0, 0, 0, 1, 0.000100, 0, 2, 'collect_base_info', NULL, NULL, 'b_electricity', 0, 'root', '2017-08-15 16:42:48', 'root', '2017-08-15 16:42:48', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (317, '1005', 12, '0x000B', '保留', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-15 16:42:48', 'root', '2017-08-15 16:42:48', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (318, '1005', 13, '0x000C', 'B相有功功率', NULL, 'INT', 0, 0, 1, 1, 0.400000, 0, 2, 'collect_base_info', NULL, NULL, 'b_active_power', 0, 'root', '2017-08-15 16:42:48', 'root', '2017-08-15 16:42:48', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (319, '1005', 14, '0x000D', 'B相功率因数', NULL, 'INT', 0, 0, 0, 0, 0.000100, 0, 2, 'collect_base_info', NULL, NULL, 'b_power_factor', 0, 'root', '2017-08-15 16:42:49', 'root', '2017-08-15 16:42:49', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (320, '1005', 15, '0x000E', 'B相无功功率', NULL, 'INT', 0, 0, 1, 1, 0.400000, 0, 2, 'collect_base_info', NULL, NULL, 'b_reactive_power', 0, 'root', '2017-08-15 16:42:49', 'root', '2017-08-15 16:42:49', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (321, '1005', 16, '0x000F', 'B相视在功率', NULL, 'INT', 0, 0, 1, 1, 0.200000, 0, 2, 'collect_base_info', NULL, NULL, 'b_ap_power', 0, 'root', '2017-08-15 16:42:49', 'root', '2017-08-15 16:42:49', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (322, '1005', 17, '0x0010', 'C相电压Uc', NULL, 'INT', 0, 0, 1, 0, 0.010000, 0, 2, 'collect_base_info', NULL, NULL, 'c_voltage', 0, 'root', '2017-08-15 16:42:49', 'root', '2017-08-15 16:42:49', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (323, '1005', 18, '0x0011', 'BC线电压', NULL, 'INT', 0, 0, 1, 0, 0.010000, 0, 2, 'collect_base_info', NULL, NULL, 'ubc_line_voltage', 0, 'root', '2017-08-15 16:42:49', 'root', '2017-08-15 16:42:49', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (324, '1005', 19, '0x0012', 'C相电流', NULL, 'INT', 0, 0, 0, 1, 0.000100, 0, 2, 'collect_base_info', NULL, NULL, 'c_electricity', 0, 'root', '2017-08-15 16:42:49', 'root', '2017-08-15 16:42:49', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (325, '1005', 20, '0x0013', '保留', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-15 16:42:49', 'root', '2017-08-15 16:42:49', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (326, '1005', 21, '0x0014', 'C相有功功率', NULL, 'INT', 0, 0, 1, 1, 0.400000, 0, 2, 'collect_base_info', NULL, NULL, 'c_active_power', 0, 'root', '2017-08-15 16:42:49', 'root', '2017-08-15 16:42:49', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (327, '1005', 22, '0x0015', 'C相功率因数', NULL, 'INT', 0, 0, 0, 0, 0.000100, 0, 2, 'collect_base_info', NULL, NULL, 'c_power_factor', 0, 'root', '2017-08-15 16:42:49', 'root', '2017-08-15 16:42:49', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (328, '1005', 23, '0x0016', 'C相无功功率', NULL, 'INT', 0, 0, 1, 1, 0.400000, 0, 2, 'collect_base_info', NULL, NULL, 'c_reactive_power', 0, 'root', '2017-08-15 16:42:49', 'root', '2017-08-15 16:42:49', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (329, '1005', 24, '0x0017', 'C相视在功率', NULL, 'INT', 0, 0, 1, 1, 0.200000, 0, 2, 'collect_base_info', NULL, NULL, 'c_ap_power', 0, 'root', '2017-08-15 16:42:49', 'root', '2017-08-15 16:42:49', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (330, '1005', 25, '0x0018', '三相平均相电压', NULL, 'INT', 0, 0, 1, 0, 0.010000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-15 16:42:49', 'root', '2017-08-15 16:42:49', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (331, '1005', 26, '0x0019', '三相平均线电压', NULL, 'INT', 0, 0, 1, 0, 0.010000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-15 16:42:49', 'root', '2017-08-15 16:42:49', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (332, '1005', 27, '0x001A', '三相平均相电流', NULL, 'INT', 0, 0, 0, 1, 0.000100, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-15 16:42:49', 'root', '2017-08-15 16:42:49', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (333, '1005', 28, '0x001B', '频率', NULL, 'INT', 0, 0, 0, 0, 0.001068, 0, 2, 'collect_base_info', NULL, NULL, 'frequency', 0, 'root', '2017-08-15 16:42:49', 'root', '2017-08-15 16:42:49', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (334, '1005', 29, '0x001C', '三相有功功率', NULL, 'INT', 0, 0, 1, 1, 0.400000, 0, 2, 'collect_base_info', NULL, NULL, 'total_active_power', 0, 'root', '2017-08-15 16:42:49', 'root', '2017-08-15 16:42:49', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (335, '1005', 30, '0x001D', '三相总功率因数', NULL, 'INT', 0, 0, 0, 0, 0.000100, 0, 2, 'collect_base_info', NULL, NULL, 'total_power_factor', 0, 'root', '2017-08-15 16:42:49', 'root', '2017-08-15 16:42:49', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (336, '1005', 31, '0x001E', '三相无功功率', NULL, 'INT', 0, 0, 1, 1, 0.400000, 0, 2, 'collect_base_info', NULL, NULL, 'total_reactive_power', 0, 'root', '2017-08-15 16:42:49', 'root', '2017-08-15 16:42:49', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (337, '1005', 32, '0x001F', '三相视在功率', NULL, 'INT', 0, 0, 1, 1, 0.200000, 0, 2, 'collect_base_info', NULL, NULL, 'total_ap_power', 0, 'root', '2017-08-15 16:42:49', 'root', '2017-08-15 16:42:49', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (338, '1005', 33, '0x0020', '保留', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-15 16:42:49', 'root', '2017-08-15 16:42:49', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (339, '1005', 34, '0x0021', '正向有功电能累加值', NULL, 'LONG', 0, 0, 1, 1, 1.000000, 0, 4, 'collect_base_info', NULL, NULL, 'total_p_at_ee', 0, 'root', '2017-08-15 16:42:49', 'root', '2017-08-15 16:42:49', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (340, '1005', 35, '0x0023', '负向有功电能累加值', NULL, 'LONG', 0, 0, 1, 1, 1.000000, 0, 4, 'collect_base_info', NULL, NULL, 'total_r_at_ee', 0, 'root', '2017-08-15 16:42:49', 'root', '2017-08-15 16:42:49', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (341, '1005', 36, '0x0025', '正向无功电能累加值', NULL, 'LONG', 0, 0, 1, 1, 1.000000, 0, 4, 'collect_base_info', NULL, NULL, 'total_p_reat_ee', 0, 'root', '2017-08-15 16:42:49', 'root', '2017-08-15 16:42:49', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (342, '1005', 37, '0x0027', '负向无功电能累加值', NULL, 'LONG', 0, 0, 1, 1, 1.000000, 0, 4, 'collect_base_info', NULL, NULL, 'total_r_reat_ee', 0, 'root', '2017-08-15 16:42:49', 'root', '2017-08-15 16:42:49', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (343, '1005', 38, '0x0300', '本机地址', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-15 16:42:49', 'root', '2017-08-15 16:42:49', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (344, '1005', 39, '0x0301', '被测系统负载接线方式', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-15 16:42:49', 'root', '2017-08-15 16:42:49', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (345, '1005', 40, '0x0304', '波特率', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-15 16:42:49', 'root', '2017-08-15 16:42:49', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (346, '1005', 41, '0x0305', '电压输入范围', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-15 16:42:49', 'root', '2017-08-15 16:42:49', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (347, '1005', 42, '0x0307', 'PT', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-15 16:42:49', 'root', '2017-08-15 16:42:49', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (348, '1005', 43, '0x0309', 'CT', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-15 16:42:49', 'root', '2017-08-15 16:42:49', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (349, '1005', 44, '0x031F', '光亮强度', NULL, 'INT', 0, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-08-15 16:42:49', 'root', '2017-08-15 16:42:49', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (352, '1002', 23, '40024', '保留', NULL, 'INT', 1, 0, 0, 0, 0.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-09-14 14:17:08', 'root', '2017-09-14 14:17:08', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (353, '1002', 47, '40051', '保留', NULL, 'INT', 1, 0, 0, 0, 0.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-09-14 14:25:06', 'root', '2017-09-14 14:25:06', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (354, '1002', 48, '40052', '保留', NULL, 'INT', 1, 0, 0, 0, 0.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-09-14 14:26:10', 'root', '2017-09-14 14:26:10', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (355, '1002', 49, '40053', '保留', NULL, 'INT', 1, 0, 0, 0, 0.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-09-14 14:27:27', 'root', '2017-09-14 14:27:27', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (356, '1002', 50, '40054', '保留', NULL, 'INT', 1, 0, 0, 0, 0.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-09-14 14:28:01', 'root', '2017-09-14 14:28:01', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (357, '1006', 1, '0x0000', 'A相电压', NULL, 'INT', 1, 0, 1, 0, 0.010000, 0, 2, 'collect_base_info', NULL, NULL, 'a_voltage', 0, 'root', '2017-09-27 11:13:41', 'root', '2017-09-27 11:13:41', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (358, '1006', 2, '0x0001', 'CA线电压', NULL, 'INT', 1, 0, 1, 0, 0.010000, 0, 2, 'collect_base_info', NULL, NULL, 'uac_line_voltage', 0, 'root', '2017-09-27 11:13:41', 'root', '2017-09-27 11:13:41', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (359, '1006', 3, '0x0002', 'A相电流', NULL, 'INT', 1, 0, 0, 1, 0.000100, 0, 2, 'collect_base_info', NULL, NULL, 'a_electricity', 0, 'root', '2017-09-27 11:13:41', 'root', '2017-09-27 11:13:41', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (360, '1006', 4, '0x0003', '开入状态检测', NULL, 'INT', 1, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-09-27 11:13:41', 'root', '2017-09-27 11:13:41', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (361, '1006', 5, '0x0004', 'A相有功功率', NULL, 'INT', 1, 0, 1, 1, 0.400000, 0, 2, 'collect_base_info', NULL, NULL, 'a_active_power', 0, 'root', '2017-09-27 11:13:41', 'root', '2017-09-27 11:13:41', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (362, '1006', 6, '0x0005', 'A相有功因数', NULL, 'INT', 1, 0, 0, 0, 0.000100, 0, 2, 'collect_base_info', NULL, NULL, 'a_power_factor', 0, 'root', '2017-09-27 11:13:41', 'root', '2017-09-27 11:13:41', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (363, '1006', 7, '0x0006', 'A相无功功率', NULL, 'INT', 1, 0, 1, 1, 0.400000, 0, 2, 'collect_base_info', NULL, NULL, 'a_reactive_power', 0, 'root', '2017-09-27 11:13:41', 'root', '2017-09-27 11:13:41', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (364, '1006', 8, '0x0007', 'A相视在功率', NULL, 'INT', 1, 0, 1, 1, 0.200000, 0, 2, 'collect_base_info', NULL, NULL, 'a_ap_power', 0, 'root', '2017-09-27 11:13:41', 'root', '2017-09-27 11:13:41', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (365, '1006', 9, '0x0008', 'B相电压', NULL, 'INT', 1, 0, 1, 0, 0.010000, 0, 2, 'collect_base_info', NULL, NULL, 'b_voltage', 0, 'root', '2017-09-27 11:13:41', 'root', '2017-09-27 11:13:41', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (366, '1006', 10, '0x0009', 'AB线电压', NULL, 'INT', 1, 0, 1, 0, 0.010000, 0, 2, 'collect_base_info', NULL, NULL, 'uab_line_voltage', 0, 'root', '2017-09-27 11:13:41', 'root', '2017-09-27 11:13:41', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (367, '1006', 11, '0x000A', 'B相电流', NULL, 'INT', 1, 0, 0, 1, 0.000100, 0, 2, 'collect_base_info', NULL, NULL, 'b_electricity', 0, 'root', '2017-09-27 11:13:41', 'root', '2017-09-27 11:13:41', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (368, '1006', 12, '0x000B', '开出状态检测', NULL, 'INT', 1, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-09-27 11:13:41', 'root', '2017-09-27 11:13:41', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (369, '1006', 13, '0x000C', 'B相有功功率', NULL, 'INT', 1, 0, 1, 1, 0.400000, 0, 2, 'collect_base_info', NULL, NULL, 'b_active_power', 0, 'root', '2017-09-27 11:13:41', 'root', '2017-09-27 11:13:41', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (370, '1006', 14, '0x000D', 'B相功率因数', NULL, 'INT', 1, 0, 0, 0, 0.000100, 0, 2, 'collect_base_info', NULL, NULL, 'b_power_factor', 0, 'root', '2017-09-27 11:13:41', 'root', '2017-09-27 11:13:41', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (371, '1006', 15, '0x000E', 'B相无功功率', NULL, 'INT', 1, 0, 1, 1, 0.400000, 0, 2, 'collect_base_info', NULL, NULL, 'b_reactive_power', 0, 'root', '2017-09-27 11:13:41', 'root', '2017-09-27 11:13:41', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (372, '1006', 16, '0x000F', 'B相视在功率', NULL, 'INT', 1, 0, 1, 1, 0.200000, 0, 2, 'collect_base_info', NULL, NULL, 'b_ap_power', 0, 'root', '2017-09-27 11:13:41', 'root', '2017-09-27 11:13:41', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (373, '1006', 17, '0x0010', 'C相电压Uc', NULL, 'INT', 1, 0, 1, 0, 0.010000, 0, 2, 'collect_base_info', NULL, NULL, 'c_voltage', 0, 'root', '2017-09-27 11:13:41', 'root', '2017-09-27 11:13:41', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (374, '1006', 18, '0x0011', 'BC线电压', NULL, 'INT', 1, 0, 1, 0, 0.010000, 0, 2, 'collect_base_info', NULL, NULL, 'ubc_line_voltage', 0, 'root', '2017-09-27 11:13:41', 'root', '2017-09-27 11:13:41', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (375, '1006', 19, '0x0012', 'C相电流', NULL, 'INT', 1, 0, 0, 1, 0.000100, 0, 2, 'collect_base_info', NULL, NULL, 'c_electricity', 0, 'root', '2017-09-27 11:13:41', 'root', '2017-09-27 11:13:41', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (376, '1006', 20, '0x0013', '保留', NULL, 'INT', 1, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-09-27 11:13:41', 'root', '2017-09-27 11:13:41', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (377, '1006', 21, '0x0014', 'C相有功功率', NULL, 'INT', 1, 0, 1, 1, 0.400000, 0, 2, 'collect_base_info', NULL, NULL, 'c_active_power', 0, 'root', '2017-09-27 11:13:41', 'root', '2017-09-27 11:13:41', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (378, '1006', 22, '0x0015', 'C相功率因数', NULL, 'INT', 1, 0, 0, 0, 0.000100, 0, 2, 'collect_base_info', NULL, NULL, 'c_power_factor', 0, 'root', '2017-09-27 11:13:41', 'root', '2017-09-27 11:13:41', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (379, '1006', 23, '0x0016', 'C相无功功率', NULL, 'INT', 1, 0, 1, 1, 0.400000, 0, 2, 'collect_base_info', NULL, NULL, 'c_reactive_power', 0, 'root', '2017-09-27 11:13:41', 'root', '2017-09-27 11:13:41', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (380, '1006', 24, '0x0017', 'C相视在功率', NULL, 'INT', 1, 0, 1, 1, 0.200000, 0, 2, 'collect_base_info', NULL, NULL, 'c_ap_power', 0, 'root', '2017-09-27 11:13:41', 'root', '2017-09-27 11:13:41', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (381, '1006', 25, '0x0018', '三相平均相电压', NULL, 'INT', 1, 0, 1, 0, 0.010000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-09-27 11:13:41', 'root', '2017-09-27 11:13:41', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (382, '1006', 26, '0x0019', '三相平均线电压', NULL, 'INT', 1, 0, 1, 0, 0.010000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-09-27 11:13:41', 'root', '2017-09-27 11:13:41', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (383, '1006', 27, '0x001A', '三相平均相电流', NULL, 'INT', 1, 0, 0, 1, 0.000100, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-09-27 11:13:41', 'root', '2017-09-27 11:13:41', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (384, '1006', 28, '0x001B', '频率', NULL, 'INT', 1, 0, 0, 0, 0.001068, 0, 2, 'collect_base_info', NULL, NULL, 'frequency', 0, 'root', '2017-09-27 11:13:41', 'root', '2017-09-27 11:13:41', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (385, '1006', 29, '0x001C', '三相有功功率', NULL, 'INT', 1, 0, 1, 1, 0.400000, 0, 2, 'collect_base_info', NULL, NULL, 'total_active_power', 0, 'root', '2017-09-27 11:13:41', 'root', '2017-09-27 11:13:41', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (386, '1006', 30, '0x001D', '三相总功率因数', NULL, 'INT', 1, 0, 0, 0, 0.000100, 0, 2, 'collect_base_info', NULL, NULL, 'total_power_factor', 0, 'root', '2017-09-27 11:13:41', 'root', '2017-09-27 11:13:41', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (387, '1006', 31, '0x001E', '三相无功功率', NULL, 'INT', 1, 0, 1, 1, 0.400000, 0, 2, 'collect_base_info', NULL, NULL, 'total_reactive_power', 0, 'root', '2017-09-27 11:13:41', 'root', '2017-09-27 11:13:41', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (388, '1006', 32, '0x001F', '三相视在功率', NULL, 'INT', 1, 0, 1, 1, 0.200000, 0, 2, 'collect_base_info', NULL, NULL, 'total_ap_power', 0, 'root', '2017-09-27 11:13:41', 'root', '2017-09-27 11:13:41', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (389, '1006', 33, '0x0020', '保留', NULL, 'INT', 1, 0, 0, 0, 1.000000, 0, 2, NULL, NULL, NULL, NULL, 0, 'root', '2017-09-27 11:13:41', 'root', '2017-09-27 11:13:41', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (390, '1006', 34, '0x0021~0x0022', '正向有功电能累加值', NULL, 'LONG', 1, 0, 1, 1, 0.001000, 0, 4, 'collect_base_info', NULL, NULL, 'total_p_at_ee', 0, 'root', '2017-09-27 11:13:41', 'root', '2017-09-27 11:13:41', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (391, '1006', 35, '0x0023~0x0024', '负向有功电能累加值', NULL, 'LONG', 1, 0, 1, 1, 0.001000, 0, 4, 'collect_base_info', NULL, NULL, 'total_r_at_ee', 0, 'root', '2017-09-27 11:13:41', 'root', '2017-09-27 11:13:41', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (392, '1006', 36, '0x0025~0x0026', '正向无功电能累加值', NULL, 'LONG', 1, 0, 1, 1, 0.001000, 0, 4, 'collect_base_info', NULL, NULL, 'total_p_reat_ee', 0, 'root', '2017-09-27 11:13:41', 'root', '2017-09-27 11:13:41', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (393, '1006', 37, '0x0027~0x0028', '负向无功电能累加值', NULL, 'LONG', 1, 0, 1, 1, 0.001000, 0, 4, 'collect_base_info', NULL, NULL, 'total_r_reat_ee', 0, 'root', '2017-09-27 11:13:41', 'root', '2017-09-27 11:13:41', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (394, '1006', 38, '0x0029~0x002A', '峰时段有功电能', NULL, 'LONG', 1, 0, 0, 0, 0.001000, 0, 4, 'collect_base_info', NULL, NULL, 'peak_total_at_ee', 0, 'root', '2017-09-27 11:13:41', 'root', '2017-09-27 11:13:41', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (395, '1006', 39, '0x002B~0x002C', '平时段有功电能', NULL, 'LONG', 1, 0, 0, 0, 0.001000, 0, 4, 'collect_base_info', NULL, NULL, 'flat_total_at_ee', 0, 'root', '2017-09-27 11:13:41', 'root', '2017-09-27 11:13:41', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (396, '1006', 40, '0x002D~0x002E', '谷时段有功电能', NULL, 'LONG', 1, 0, 0, 0, 0.001000, 0, 4, 'collect_base_info', NULL, NULL, 'valley_total_at_ee', 0, 'root', '2017-09-27 11:13:41', 'root', '2017-09-27 11:13:41', '2017-09-29 16:16:36', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (397, '1004', 63, '0x0201', 'IA波形畸变率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, '', 'collect_attach_info', NULL, 'IA_1th_harmonic', 0, 'admin', '2017-11-21 10:55:23', 'admin', '2017-11-21 10:55:23', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (398, '1004', 64, '0x0202', 'IA2次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, '', '', NULL, '', 0, 'admin', '2017-11-21 10:55:23', 'admin', '2017-11-21 10:55:23', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (399, '1004', 65, '0x0203', 'IA3次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, '', 'collect_attach_info', NULL, 'IA_3th_harmonic', 0, 'admin', '2017-11-21 10:55:24', 'admin', '2017-11-21 10:55:24', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (400, '1004', 66, '0x0204', 'IA4次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, '', '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:24', 'admin', '2017-11-21 10:55:24', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (401, '1004', 67, '0x0205', 'IA5次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, '', 'collect_attach_info', NULL, 'IA_5th_harmonic', 0, 'admin', '2017-11-21 10:55:24', 'admin', '2017-11-21 10:55:24', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (402, '1004', 68, '0x0206', 'IA6次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, '', '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:24', 'admin', '2017-11-21 10:55:24', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (403, '1004', 69, '0x0207', 'IA7次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, '', 'collect_attach_info', NULL, 'IA_7th_harmonic', 0, 'admin', '2017-11-21 10:55:24', 'admin', '2017-11-21 10:55:24', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (404, '1004', 70, '0x0208', 'IA8次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, '', '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:25', 'admin', '2017-11-21 10:55:25', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (405, '1004', 71, '0x0209', 'IA9次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, '', 'collect_attach_info', NULL, 'IA_9th_harmonic', 0, 'admin', '2017-11-21 10:55:25', 'admin', '2017-11-21 10:55:25', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (406, '1004', 72, '0x020A', 'IA10次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, '', '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:25', 'admin', '2017-11-21 10:55:25', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (407, '1004', 73, '0x020B', 'IA11次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, '', 'collect_attach_info', NULL, 'IA_11th_harmonic', 0, 'admin', '2017-11-21 10:55:25', 'admin', '2017-11-21 10:55:25', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (408, '1004', 74, '0x020C', 'IA12次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, '', '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:25', 'admin', '2017-11-21 10:55:25', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (409, '1004', 75, '0x020D', 'IA13次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, '', 'collect_attach_info', NULL, 'IA_13th_harmonic', 0, 'admin', '2017-11-21 10:55:26', 'admin', '2017-11-21 10:55:26', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (410, '1004', 76, '0x020E', 'IA14次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, '', '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:26', 'admin', '2017-11-21 10:55:26', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (411, '1004', 77, '0x020F', 'IA15次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, '', '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:26', 'admin', '2017-11-21 10:55:26', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (412, '1004', 78, '0x0210', 'IA16次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, '', '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:26', 'admin', '2017-11-21 10:55:26', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (413, '1004', 79, '0x0211', 'IA17次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, '', '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:26', 'admin', '2017-11-21 10:55:26', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (414, '1004', 80, '0x0212', 'IA18次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, '', '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:26', 'admin', '2017-11-21 10:55:26', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (415, '1004', 81, '0x0213', 'IA19次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:27', 'admin', '2017-11-21 10:55:27', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (416, '1004', 82, '0x0214', 'IA20次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:27', 'admin', '2017-11-21 10:55:27', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (417, '1004', 83, '0x0215', 'IA21次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:27', 'admin', '2017-11-21 10:55:27', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (418, '1004', 84, '0x0216', 'IA22次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:27', 'admin', '2017-11-21 10:55:27', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (419, '1004', 85, '0x0217', 'IA23次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:27', 'admin', '2017-11-21 10:55:27', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (420, '1004', 86, '0x0218', 'IA24次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:27', 'admin', '2017-11-21 10:55:27', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (421, '1004', 87, '0x0219', 'IA25次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:27', 'admin', '2017-11-21 10:55:27', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (422, '1004', 88, '0x021A', 'IA26次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:28', 'admin', '2017-11-21 10:55:28', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (423, '1004', 89, '0x021B', 'IA27次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:28', 'admin', '2017-11-21 10:55:28', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (424, '1004', 90, '0x021C', 'IA28次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:28', 'admin', '2017-11-21 10:55:28', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (425, '1004', 91, '0x021D', 'IA29次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:28', 'admin', '2017-11-21 10:55:28', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (426, '1004', 92, '0x021E', 'IA30次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:28', 'admin', '2017-11-21 10:55:28', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (427, '1004', 93, '0x021F', 'IA31次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:28', 'admin', '2017-11-21 10:55:28', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (428, '1004', 94, '0x0220', 'IB波形畸变率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, 'collect_attach_info', NULL, 'IB_1th_harmonic', 0, 'admin', '2017-11-21 10:55:28', 'admin', '2017-11-21 10:55:28', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (429, '1004', 95, '0x0221', 'IB2次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:28', 'admin', '2017-11-21 10:55:28', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (430, '1004', 96, '0x0222', 'IB3次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, 'collect_attach_info', NULL, 'IB_3th_harmonic', 0, 'admin', '2017-11-21 10:55:28', 'admin', '2017-11-21 10:55:28', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (431, '1004', 97, '0x0223', 'IB4次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:28', 'admin', '2017-11-21 10:55:28', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (432, '1004', 98, '0x0224', 'IB5次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, 'collect_attach_info', NULL, 'IB_5th_harmonic', 0, 'admin', '2017-11-21 10:55:28', 'admin', '2017-11-21 10:55:28', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (433, '1004', 99, '0x0225', 'IB6次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:28', 'admin', '2017-11-21 10:55:28', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (434, '1004', 100, '0x0226', 'IB7次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, 'collect_attach_info', NULL, 'IA_7th_harmonic', 0, 'admin', '2017-11-21 10:55:28', 'admin', '2017-11-21 10:55:28', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (435, '1004', 101, '0x0227', 'IB8次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:28', 'admin', '2017-11-21 10:55:28', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (436, '1004', 102, '0x0228', 'IB9次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, 'collect_attach_info', NULL, 'IA_9th_harmonic', 0, 'admin', '2017-11-21 10:55:28', 'admin', '2017-11-21 10:55:28', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (437, '1004', 103, '0x0229', 'IB10次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:28', 'admin', '2017-11-21 10:55:28', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (438, '1004', 104, '0x022A', 'IB11次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, 'collect_attach_info', NULL, 'IA_11th_harmonic', 0, 'admin', '2017-11-21 10:55:28', 'admin', '2017-11-21 10:55:28', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (439, '1004', 105, '0x022B', 'IB12次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:28', 'admin', '2017-11-21 10:55:28', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (440, '1004', 106, '0x022C', 'IB13次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, 'collect_attach_info', NULL, 'IA_13th_harmonic', 0, 'admin', '2017-11-21 10:55:29', 'admin', '2017-11-21 10:55:29', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (441, '1004', 107, '0x022D', 'IB14次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:29', 'admin', '2017-11-21 10:55:29', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (442, '1004', 108, '0x022E', 'IB15次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:29', 'admin', '2017-11-21 10:55:29', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (443, '1004', 109, '0x022F', 'IB16次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:29', 'admin', '2017-11-21 10:55:29', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (444, '1004', 110, '0x0230', 'IB17次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:29', 'admin', '2017-11-21 10:55:29', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (445, '1004', 111, '0x0231', 'IB18次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:29', 'admin', '2017-11-21 10:55:29', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (446, '1004', 112, '0x0232', 'IB19次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:29', 'admin', '2017-11-21 10:55:29', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (447, '1004', 113, '0x0233', 'IB20次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:29', 'admin', '2017-11-21 10:55:29', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (448, '1004', 114, '0x0234', 'IB21次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:29', 'admin', '2017-11-21 10:55:29', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (449, '1004', 115, '0x0235', 'IB22次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:29', 'admin', '2017-11-21 10:55:29', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (450, '1004', 116, '0x0236', 'IB23次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:29', 'admin', '2017-11-21 10:55:29', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (451, '1004', 117, '0x0237', 'IB24次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:30', 'admin', '2017-11-21 10:55:30', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (452, '1004', 118, '0x0238', 'IB25次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:30', 'admin', '2017-11-21 10:55:30', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (453, '1004', 119, '0x0239', 'IB26次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:30', 'admin', '2017-11-21 10:55:30', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (454, '1004', 120, '0x023A', 'IB27次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:30', 'admin', '2017-11-21 10:55:30', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (455, '1004', 121, '0x023B', 'IB28次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:30', 'admin', '2017-11-21 10:55:30', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (456, '1004', 122, '0x023C', 'IB29次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:30', 'admin', '2017-11-21 10:55:30', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (457, '1004', 123, '0x023D', 'IB30次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:30', 'admin', '2017-11-21 10:55:30', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (458, '1004', 124, '0x023E', 'IB31次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:31', 'admin', '2017-11-21 10:55:31', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (459, '1004', 125, '0x023F', 'IC波形畸变率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, 'collect_attach_info', NULL, 'IC_1th_harmonic', 0, 'admin', '2017-11-21 10:55:31', 'admin', '2017-11-21 10:55:31', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (460, '1004', 126, '0x0240', 'IC2次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:31', 'admin', '2017-11-21 10:55:31', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (461, '1004', 127, '0x0241', 'IC3次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, 'collect_attach_info', NULL, 'IC_3th_harmonic', 0, 'admin', '2017-11-21 10:55:31', 'admin', '2017-11-21 10:55:31', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (462, '1004', 128, '0x0242', 'IC4次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:31', 'admin', '2017-11-21 10:55:31', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (463, '1004', 129, '0x0243', 'IC5次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, 'collect_attach_info', NULL, 'IC_5th_harmonic', 0, 'admin', '2017-11-21 10:55:31', 'admin', '2017-11-21 10:55:31', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (464, '1004', 130, '0x0244', 'IC6次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:31', 'admin', '2017-11-21 10:55:31', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (465, '1004', 131, '0x0245', 'IC7次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, 'collect_attach_info', NULL, 'IC_7th_harmonic', 0, 'admin', '2017-11-21 10:55:32', 'admin', '2017-11-21 10:55:32', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (466, '1004', 132, '0x0246', 'IC8次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:32', 'admin', '2017-11-21 10:55:32', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (467, '1004', 133, '0x0247', 'IC9次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, 'collect_attach_info', NULL, 'IC_9th_harmonic', 0, 'admin', '2017-11-21 10:55:32', 'admin', '2017-11-21 10:55:32', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (468, '1004', 134, '0x0248', 'IC10次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:32', 'admin', '2017-11-21 10:55:32', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (469, '1004', 135, '0x0249', 'IC11次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, 'collect_attach_info', NULL, 'IC_11th_harmonic', 0, 'admin', '2017-11-21 10:55:32', 'admin', '2017-11-21 10:55:32', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (470, '1004', 136, '0x024A', 'IC12次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:32', 'admin', '2017-11-21 10:55:32', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (471, '1004', 137, '0x024B', 'IC13次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, 'collect_attach_info', NULL, 'IC_13th_harmonic', 0, 'admin', '2017-11-21 10:55:32', 'admin', '2017-11-21 10:55:32', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (472, '1004', 138, '0x024C', 'IC14次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:33', 'admin', '2017-11-21 10:55:33', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (473, '1004', 139, '0x024D', 'IC15次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:33', 'admin', '2017-11-21 10:55:33', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (474, '1004', 140, '0x024E', 'IC16次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:33', 'admin', '2017-11-21 10:55:33', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (475, '1004', 141, '0x024F', 'IC17次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:33', 'admin', '2017-11-21 10:55:33', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (476, '1004', 142, '0x0250', 'IC18次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:33', 'admin', '2017-11-21 10:55:33', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (477, '1004', 143, '0x0251', 'IC19次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:33', 'admin', '2017-11-21 10:55:33', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (478, '1004', 144, '0x0252', 'IC20次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:33', 'admin', '2017-11-21 10:55:33', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (479, '1004', 145, '0x0253', 'IC21次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:33', 'admin', '2017-11-21 10:55:33', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (480, '1004', 146, '0x0254', 'IC22次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:34', 'admin', '2017-11-21 10:55:34', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (481, '1004', 147, '0x0255', 'IC23次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:34', 'admin', '2017-11-21 10:55:34', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (482, '1004', 148, '0x0256', 'IC24次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:34', 'admin', '2017-11-21 10:55:34', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (483, '1004', 149, '0x0257', 'IC25次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:34', 'admin', '2017-11-21 10:55:34', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (484, '1004', 150, '0x0258', 'IC26次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:34', 'admin', '2017-11-21 10:55:34', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (485, '1004', 151, '0x0259', 'IC27次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:34', 'admin', '2017-11-21 10:55:34', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (486, '1004', 152, '0x025A', 'IC28次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:34', 'admin', '2017-11-21 10:55:34', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (487, '1004', 153, '0x025B', 'IC29次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:34', 'admin', '2017-11-21 10:55:34', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (488, '1004', 154, '0x025C', 'IC30次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:34', 'admin', '2017-11-21 10:55:34', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (489, '1004', 155, '0x025D', 'IC31次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:34', 'admin', '2017-11-21 10:55:34', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (490, '1004', 156, '0x025E', 'UA波形畸变率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, 'collect_attach_info', NULL, 'UA_1th_harmonic', 0, 'admin', '2017-11-21 10:55:35', 'admin', '2017-11-21 10:55:35', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (491, '1004', 157, '0x025F', 'UA2次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:35', 'admin', '2017-11-21 10:55:35', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (492, '1004', 158, '0x0260', 'UA3次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, 'collect_attach_info', NULL, 'UA_3th_harmonic', 0, 'admin', '2017-11-21 10:55:35', 'admin', '2017-11-21 10:55:35', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (493, '1004', 159, '0x0261', 'UA4次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:35', 'admin', '2017-11-21 10:55:35', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (494, '1004', 160, '0x0262', 'UA5次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, 'collect_attach_info', NULL, 'UA_5th_harmonic', 0, 'admin', '2017-11-21 10:55:35', 'admin', '2017-11-21 10:55:35', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (495, '1004', 161, '0x0263', 'UA6次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:35', 'admin', '2017-11-21 10:55:35', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (496, '1004', 162, '0x0264', 'UA7次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, 'collect_attach_info', NULL, 'UA_7th_harmonic', 0, 'admin', '2017-11-21 10:55:35', 'admin', '2017-11-21 10:55:35', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (497, '1004', 163, '0x0265', 'UA8次谐波含有率', NULL, 'INT', 3, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:35', 'admin', '2017-11-21 10:55:35', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (498, '1004', 164, '0x0266', 'UA9次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, 'collect_attach_info', NULL, 'UA_9th_harmonic', 0, 'admin', '2017-11-21 10:55:36', 'admin', '2017-11-21 10:55:36', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (499, '1004', 165, '0x0267', 'UA10次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:36', 'admin', '2017-11-21 10:55:36', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (500, '1004', 166, '0x0268', 'UA11次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, 'collect_attach_info', NULL, 'UA_11th_harmonic', 0, 'admin', '2017-11-21 10:55:36', 'admin', '2017-11-21 10:55:36', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (501, '1004', 167, '0x0269', 'UA12次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:36', 'admin', '2017-11-21 10:55:36', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (502, '1004', 168, '0x026A', 'UA13次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, 'collect_attach_info', NULL, 'UA_13th_harmonic', 0, 'admin', '2017-11-21 10:55:36', 'admin', '2017-11-21 10:55:36', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (503, '1004', 169, '0x026B', 'UA14次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:36', 'admin', '2017-11-21 10:55:36', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (504, '1004', 170, '0x026C', 'UA15次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:36', 'admin', '2017-11-21 10:55:36', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (505, '1004', 171, '0x026D', 'UA16次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:36', 'admin', '2017-11-21 10:55:36', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (506, '1004', 172, '0x026E', 'UA17次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:36', 'admin', '2017-11-21 10:55:36', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (507, '1004', 173, '0x026F', 'UA18次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:36', 'admin', '2017-11-21 10:55:36', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (508, '1004', 174, '0x0270', 'UA19次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:36', 'admin', '2017-11-21 10:55:36', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (509, '1004', 175, '0x0271', 'UA20次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:36', 'admin', '2017-11-21 10:55:36', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (510, '1004', 176, '0x0272', 'UA21次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:36', 'admin', '2017-11-21 10:55:36', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (511, '1004', 177, '0x0273', 'UA22次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:37', 'admin', '2017-11-21 10:55:37', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (512, '1004', 178, '0x0274', 'UA23次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:37', 'admin', '2017-11-21 10:55:37', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (513, '1004', 179, '0x0275', 'UA24次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:37', 'admin', '2017-11-21 10:55:37', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (514, '1004', 180, '0x0276', 'UA25次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:37', 'admin', '2017-11-21 10:55:37', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (515, '1004', 181, '0x0277', 'UA26次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:37', 'admin', '2017-11-21 10:55:37', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (516, '1004', 182, '0x0278', 'UA27次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:37', 'admin', '2017-11-21 10:55:37', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (517, '1004', 183, '0x0279', 'UA28次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:37', 'admin', '2017-11-21 10:55:37', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (518, '1004', 184, '0x027A', 'UA29次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:37', 'admin', '2017-11-21 10:55:37', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (519, '1004', 185, '0x027B', 'UA30次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:37', 'admin', '2017-11-21 10:55:37', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (520, '1004', 186, '0x027C', 'UA31次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:37', 'admin', '2017-11-21 10:55:37', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (521, '1004', 187, '0x027D', 'UB波形畸变率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, 'collect_attach_info', NULL, 'UB_1th_harmonic', 0, 'admin', '2017-11-21 10:55:38', 'admin', '2017-11-21 10:55:38', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (522, '1004', 188, '0x027E', 'UB2次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:38', 'admin', '2017-11-21 10:55:38', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (523, '1004', 189, '0x027F', 'UB3次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, 'collect_attach_info', NULL, 'UB_3th_harmonic', 0, 'admin', '2017-11-21 10:55:38', 'admin', '2017-11-21 10:55:38', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (524, '1004', 190, '0x0280', 'UB4次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:38', 'admin', '2017-11-21 10:55:38', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (525, '1004', 191, '0x0281', 'UB5次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, 'collect_attach_info', NULL, 'UB_5th_harmonic', 0, 'admin', '2017-11-21 10:55:38', 'admin', '2017-11-21 10:55:38', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (526, '1004', 192, '0x0282', 'UB6次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:38', 'admin', '2017-11-21 10:55:38', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (527, '1004', 193, '0x0283', 'UB7次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, 'collect_attach_info', NULL, 'UB_7th_harmonic', 0, 'admin', '2017-11-21 10:55:38', 'admin', '2017-11-21 10:55:38', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (528, '1004', 194, '0x0284', 'UB8次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:38', 'admin', '2017-11-21 10:55:38', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (529, '1004', 195, '0x0285', 'UB9次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, 'collect_attach_info', NULL, 'UB_9th_harmonic', 0, 'admin', '2017-11-21 10:55:39', 'admin', '2017-11-21 10:55:39', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (530, '1004', 196, '0x0286', 'UB10次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:39', 'admin', '2017-11-21 10:55:39', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (531, '1004', 197, '0x0287', 'UB11次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, 'collect_attach_info', NULL, 'UB_11th_harmonic', 0, 'admin', '2017-11-21 10:55:39', 'admin', '2017-11-21 10:55:39', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (532, '1004', 198, '0x0288', 'UB12次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:39', 'admin', '2017-11-21 10:55:39', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (533, '1004', 199, '0x0289', 'UB13次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, 'collect_attach_info', NULL, 'UB_13th_harmonic', 0, 'admin', '2017-11-21 10:55:39', 'admin', '2017-11-21 10:55:39', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (534, '1004', 200, '0x028A', 'UB14次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:39', 'admin', '2017-11-21 10:55:39', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (535, '1004', 201, '0x028B', 'UB15次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:39', 'admin', '2017-11-21 10:55:39', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (536, '1004', 202, '0x028C', 'UB16次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:39', 'admin', '2017-11-21 10:55:39', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (537, '1004', 203, '0x028D', 'UB17次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:39', 'admin', '2017-11-21 10:55:39', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (538, '1004', 204, '0x028E', 'UB18次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:39', 'admin', '2017-11-21 10:55:39', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (539, '1004', 205, '0x028F', 'UB19次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:39', 'admin', '2017-11-21 10:55:39', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (540, '1004', 206, '0x0290', 'UB20次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:39', 'admin', '2017-11-21 10:55:39', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (541, '1004', 207, '0x0291', 'UB21次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:39', 'admin', '2017-11-21 10:55:39', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (542, '1004', 208, '0x0292', 'UB22次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:39', 'admin', '2017-11-21 10:55:39', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (543, '1004', 209, '0x0293', 'UB23次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:39', 'admin', '2017-11-21 10:55:39', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (544, '1004', 210, '0x0294', 'UB24次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:39', 'admin', '2017-11-21 10:55:39', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (545, '1004', 211, '0x0295', 'UB25次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:39', 'admin', '2017-11-21 10:55:39', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (546, '1004', 212, '0x0296', 'UB26次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:39', 'admin', '2017-11-21 10:55:39', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (547, '1004', 213, '0x0297', 'UB27次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:39', 'admin', '2017-11-21 10:55:39', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (548, '1004', 214, '0x0298', 'UB28次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:40', 'admin', '2017-11-21 10:55:40', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (549, '1004', 215, '0x0299', 'UB29次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:40', 'admin', '2017-11-21 10:55:40', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (550, '1004', 216, '0x029A', 'UB30次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:40', 'admin', '2017-11-21 10:55:40', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (551, '1004', 217, '0x029B', 'UB31次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:40', 'admin', '2017-11-21 10:55:40', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (552, '1004', 218, '0x029C', 'UC波形畸变率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, 'collect_attach_info', NULL, 'UC_1th_harmonic', 0, 'admin', '2017-11-21 10:55:40', 'admin', '2017-11-21 10:55:40', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (553, '1004', 219, '0x029D', 'UC2次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:40', 'admin', '2017-11-21 10:55:40', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (554, '1004', 220, '0x029E', 'UC3次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, 'collect_attach_info', NULL, 'UC_3th_harmonic', 0, 'admin', '2017-11-21 10:55:40', 'admin', '2017-11-21 10:55:40', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (555, '1004', 221, '0x029F', 'UC4次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:40', 'admin', '2017-11-21 10:55:40', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (556, '1004', 222, '0x02A0', 'UC5次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, 'collect_attach_info', NULL, 'UC_5th_harmonic', 0, 'admin', '2017-11-21 10:55:40', 'admin', '2017-11-21 10:55:40', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (557, '1004', 223, '0x02A1', 'UC6次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:40', 'admin', '2017-11-21 10:55:40', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (558, '1004', 224, '0x02A2', 'UC7次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, 'collect_attach_info', NULL, 'UC_7th_harmonic', 0, 'admin', '2017-11-21 10:55:40', 'admin', '2017-11-21 10:55:40', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (559, '1004', 225, '0x02A3', 'UC8次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:40', 'admin', '2017-11-21 10:55:40', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (560, '1004', 226, '0x02A4', 'UC9次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, 'collect_attach_info', NULL, 'UC_9th_harmonic', 0, 'admin', '2017-11-21 10:55:40', 'admin', '2017-11-21 10:55:40', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (561, '1004', 227, '0x02A5', 'UC10次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:40', 'admin', '2017-11-21 10:55:40', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (562, '1004', 228, '0x02A6', 'UC11次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, 'collect_attach_info', NULL, 'UC_11th_harmonic', 0, 'admin', '2017-11-21 10:55:40', 'admin', '2017-11-21 10:55:40', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (563, '1004', 229, '0x02A7', 'UC12次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:40', 'admin', '2017-11-21 10:55:40', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (564, '1004', 230, '0x02A8', 'UC13次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, 'collect_attach_info', NULL, 'UC_13th_harmonic', 0, 'admin', '2017-11-21 10:55:40', 'admin', '2017-11-21 10:55:40', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (565, '1004', 231, '0x02A9', 'UC14次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:41', 'admin', '2017-11-21 10:55:41', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (566, '1004', 232, '0x02AA', 'UC15次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:41', 'admin', '2017-11-21 10:55:41', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (567, '1004', 233, '0x02AB', 'UC16次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:41', 'admin', '2017-11-21 10:55:41', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (568, '1004', 234, '0x02AC', 'UC17次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:41', 'admin', '2017-11-21 10:55:41', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (569, '1004', 235, '0x02AD', 'UC18次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:41', 'admin', '2017-11-21 10:55:41', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (570, '1004', 236, '0x02AE', 'UC19次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:41', 'admin', '2017-11-21 10:55:41', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (571, '1004', 237, '0x02AF', 'UC20次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:41', 'admin', '2017-11-21 10:55:41', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (572, '1004', 238, '0x02B0', 'UC21次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:41', 'admin', '2017-11-21 10:55:41', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (573, '1004', 239, '0x02B1', 'UC22次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:41', 'admin', '2017-11-21 10:55:41', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (574, '1004', 240, '0x02B2', 'UC23次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:41', 'admin', '2017-11-21 10:55:41', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (575, '1004', 241, '0x02B3', 'UC24次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:41', 'admin', '2017-11-21 10:55:41', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (576, '1004', 242, '0x02B4', 'UC25次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:41', 'admin', '2017-11-21 10:55:41', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (577, '1004', 243, '0x02B5', 'UC26次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:41', 'admin', '2017-11-21 10:55:41', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (578, '1004', 244, '0x02B6', 'UC27次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:41', 'admin', '2017-11-21 10:55:41', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (579, '1004', 245, '0x02B7', 'UC28次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:41', 'admin', '2017-11-21 10:55:41', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (580, '1004', 246, '0x02B8', 'UC29次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:41', 'admin', '2017-11-21 10:55:41', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (581, '1004', 247, '0x02B9', 'UC30次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:41', 'admin', '2017-11-21 10:55:41', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (582, '1004', 248, '0x02BA', 'UC31次谐波含有率', NULL, 'INT', 4, 0, 0, 0, 0.010000, 0, 2, NULL, '', NULL, NULL, 0, 'admin', '2017-11-21 10:55:41', 'admin', '2017-11-21 10:55:41', '2017-11-21 11:32:26', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (583, '1007', 1, '0x0000~0x0001', 'A相电压', NULL, 'INT', 1, 0, 0, 0, 0.010000, 0, 4, NULL, NULL, NULL, NULL, 0, 'admin', '2018-05-30 18:15:47', 'admin', '2018-05-30 18:15:47', '2018-05-30 18:27:12', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (584, '1007', 2, '0x0002~0x0003', 'B相电压', NULL, 'INT', 1, 0, 0, 0, 0.010000, 0, 4, NULL, NULL, NULL, NULL, 0, 'admin', '2018-05-30 18:15:47', 'admin', '2018-05-30 18:15:47', '2018-05-30 18:27:12', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (585, '1007', 3, '0x0004~0x0005', 'C相电压', NULL, 'INT', 1, 0, 0, 0, 0.010000, 0, 4, NULL, NULL, NULL, NULL, 0, 'admin', '2018-05-30 18:15:47', 'admin', '2018-05-30 18:15:47', '2018-05-30 18:27:12', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (586, '1007', 4, '0x0006~0x0007', '平均相电压', NULL, 'INT', 1, 0, 0, 0, 0.010000, 0, 4, NULL, NULL, NULL, NULL, 0, 'admin', '2018-05-30 18:15:47', 'admin', '2018-05-30 18:15:47', '2018-05-30 18:27:12', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (587, '1007', 5, '0x0008~0x0009', 'AB线电压', NULL, 'INT', 1, 0, 0, 0, 0.010000, 0, 4, NULL, NULL, NULL, NULL, 0, 'admin', '2018-05-30 18:15:47', 'admin', '2018-05-30 18:15:47', '2018-05-30 18:27:12', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (588, '1007', 6, '0x000A~0x000B', 'BC线电压', NULL, 'INT', 1, 0, 0, 0, 0.010000, 0, 4, NULL, NULL, NULL, NULL, 0, 'admin', '2018-05-30 18:15:47', 'admin', '2018-05-30 18:15:47', '2018-05-30 18:27:12', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (589, '1007', 7, '0x000C~0x000d', 'CA线电压', NULL, 'INT', 1, 0, 0, 0, 0.010000, 0, 4, NULL, NULL, NULL, NULL, 0, 'admin', '2018-05-30 18:15:47', 'admin', '2018-05-30 18:15:47', '2018-05-30 18:27:12', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (590, '1007', 8, '0x000E~0x000F', '平均线电压', NULL, 'INT', 1, 0, 0, 0, 0.010000, 0, 4, NULL, NULL, NULL, NULL, 0, 'admin', '2018-05-30 18:15:47', 'admin', '2018-05-30 18:15:47', '2018-05-30 18:27:12', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (591, '1007', 9, '0x0010~0x0011', 'A相电流', NULL, 'INT', 1, 0, 0, 0, 0.001000, 0, 4, NULL, NULL, NULL, NULL, 0, 'admin', '2018-05-30 18:15:47', 'admin', '2018-05-30 18:15:47', '2018-05-30 18:27:12', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (592, '1007', 10, '0x0012~0x0013', 'B相电流', NULL, 'INT', 1, 0, 0, 0, 0.001000, 0, 4, NULL, NULL, NULL, NULL, 0, 'admin', '2018-05-30 18:15:47', 'admin', '2018-05-30 18:15:47', '2018-05-30 18:27:12', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (593, '1007', 11, '0x0014~0x0015', 'C相电流', NULL, 'INT', 1, 0, 0, 0, 0.001000, 0, 4, NULL, NULL, NULL, NULL, 0, 'admin', '2018-05-30 18:15:47', 'admin', '2018-05-30 18:15:47', '2018-05-30 18:27:12', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (594, '1007', 12, '0x0016~0x0017', '平均相电流', NULL, 'INT', 1, 0, 0, 0, 0.001000, 0, 4, NULL, NULL, NULL, NULL, 0, 'admin', '2018-05-30 18:15:47', 'admin', '2018-05-30 18:15:47', '2018-05-30 18:27:12', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (595, '1007', 13, '0x0018~0x0019', 'A相有功功率', NULL, 'INT', 1, 0, 0, 0, 0.001000, 0, 4, NULL, NULL, NULL, NULL, 0, 'admin', '2018-05-30 18:15:47', 'admin', '2018-05-30 18:15:47', '2018-05-30 18:27:12', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (596, '1007', 14, '0x001A~0x001B', 'B相有功功率', NULL, 'INT', 1, 0, 0, 0, 0.001000, 0, 4, NULL, NULL, NULL, NULL, 0, 'admin', '2018-05-30 18:15:47', 'admin', '2018-05-30 18:15:47', '2018-05-30 18:27:12', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (597, '1007', 15, '0x001C~0x001D', 'C相有功功率', NULL, 'INT', 1, 0, 0, 0, 0.001000, 0, 4, NULL, NULL, NULL, NULL, 0, 'admin', '2018-05-30 18:15:47', 'admin', '2018-05-30 18:15:47', '2018-05-30 18:27:12', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (598, '1007', 16, '0x001E~0x001F', '三相总有功功率', NULL, 'INT', 1, 0, 0, 0, 0.001000, 0, 4, NULL, NULL, NULL, NULL, 0, 'admin', '2018-05-30 18:15:47', 'admin', '2018-05-30 18:15:47', '2018-05-30 18:27:12', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (599, '1007', 17, '0x0020~0x0021', 'A相无功功率', NULL, 'INT', 1, 0, 0, 0, 0.001000, 0, 4, NULL, NULL, NULL, NULL, 0, 'admin', '2018-05-30 18:15:47', 'admin', '2018-05-30 18:15:47', '2018-05-30 18:27:12', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (600, '1007', 18, '0x0022~0x0023', 'B相无功功率', NULL, 'INT', 1, 0, 0, 0, 0.001000, 0, 4, NULL, NULL, NULL, NULL, 0, 'admin', '2018-05-30 18:15:47', 'admin', '2018-05-30 18:15:47', '2018-05-30 18:27:12', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (601, '1007', 19, '0x0024~0x0025', 'C相无功功率', NULL, 'INT', 1, 0, 0, 0, 0.001000, 0, 4, NULL, NULL, NULL, NULL, 0, 'admin', '2018-05-30 18:15:47', 'admin', '2018-05-30 18:15:47', '2018-05-30 18:27:12', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (602, '1007', 20, '0x0026~0x0027', '三相总无功功率', NULL, 'INT', 1, 0, 0, 0, 0.001000, 0, 4, NULL, NULL, NULL, NULL, 0, 'admin', '2018-05-30 18:15:47', 'admin', '2018-05-30 18:15:47', '2018-05-30 18:27:12', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (603, '1007', 21, '0x0028~0x0029', 'A相视在功率', NULL, 'INT', 1, 0, 0, 0, 0.001000, 0, 4, NULL, NULL, NULL, NULL, 0, 'admin', '2018-05-30 18:15:47', 'admin', '2018-05-30 18:15:47', '2018-05-30 18:27:12', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (604, '1007', 22, '0x002A~0x002B', 'B相视在功率', NULL, 'INT', 1, 0, 0, 0, 0.001000, 0, 4, NULL, NULL, NULL, NULL, 0, 'admin', '2018-05-30 18:15:47', 'admin', '2018-05-30 18:15:47', '2018-05-30 18:27:12', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (605, '1007', 23, '0x002C~0x002D', 'C相视在功率', NULL, 'INT', 1, 0, 0, 0, 0.001000, 0, 4, NULL, NULL, NULL, NULL, 0, 'admin', '2018-05-30 18:15:47', 'admin', '2018-05-30 18:15:47', '2018-05-30 18:27:12', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (606, '1007', 24, '0x002E~0x002F', '三相总视在功率', NULL, 'INT', 1, 0, 0, 0, 0.001000, 0, 4, NULL, NULL, NULL, NULL, 0, 'admin', '2018-05-30 18:15:47', 'admin', '2018-05-30 18:15:47', '2018-05-30 18:27:12', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (607, '1007', 25, '0x0030~0x0031', 'A相功率因数', NULL, 'INT', 1, 0, 0, 0, 0.001000, 0, 2, NULL, NULL, NULL, NULL, 0, 'admin', '2018-05-30 18:15:47', 'admin', '2018-05-30 18:15:47', '2018-05-30 18:27:12', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (608, '1007', 26, '0x0032~0x0033', 'B相功率因数', NULL, 'INT', 1, 0, 0, 0, 0.001000, 0, 2, NULL, NULL, NULL, NULL, 0, 'admin', '2018-05-30 18:15:47', 'admin', '2018-05-30 18:15:47', '2018-05-30 18:27:12', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (609, '1007', 27, '0x0034~0x0035', 'C相功率因数', NULL, 'INT', 1, 0, 0, 0, 0.001000, 0, 2, NULL, NULL, NULL, NULL, 0, 'admin', '2018-05-30 18:15:47', 'admin', '2018-05-30 18:15:47', '2018-05-30 18:27:12', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (610, '1007', 28, '0x0036~0x0037', '三相总功率因数', NULL, 'INT', 1, 0, 0, 0, 0.001000, 0, 2, NULL, NULL, NULL, NULL, 0, 'admin', '2018-05-30 18:15:47', 'admin', '2018-05-30 18:15:47', '2018-05-30 18:27:12', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (611, '1007', 29, '0x0038~0x0039', '频率', NULL, 'INT', 1, 0, 0, 0, 0.010000, 0, 2, NULL, NULL, NULL, NULL, 0, 'admin', '2018-05-30 18:15:47', 'admin', '2018-05-30 18:15:47', '2018-05-30 18:27:12', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (612, '1007', 30, '0x0064~0x0065', '3相总正向有功电能', NULL, 'INT', 2, 0, 0, 0, 0.010000, 0, 4, NULL, NULL, NULL, NULL, 0, 'admin', '2018-05-30 18:15:47', 'admin', '2018-05-30 18:15:47', '2018-05-30 18:27:58', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (613, '1007', 31, '0x0066~0x0067', '3相总反向有功电能', NULL, 'INT', 2, 0, 0, 0, 0.010000, 0, 4, NULL, NULL, NULL, NULL, 0, 'admin', '2018-05-30 18:15:47', 'admin', '2018-05-30 18:15:47', '2018-05-30 18:27:58', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (614, '1007', 32, '0x0068~0x0069', '3相总正向无功电能', NULL, 'INT', 2, 0, 0, 0, 0.010000, 0, 4, NULL, NULL, NULL, NULL, 0, 'admin', '2018-05-30 18:15:47', 'admin', '2018-05-30 18:15:47', '2018-05-30 18:27:58', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (615, '1007', 33, '0x006A~0x006B', '3相总反向无功电能', NULL, 'INT', 2, 0, 0, 0, 0.010000, 0, 4, NULL, NULL, NULL, NULL, 0, 'admin', '2018-05-30 18:15:47', 'admin', '2018-05-30 18:15:47', '2018-05-30 18:27:58', 0);
INSERT INTO `equipment_meter_rom_config` VALUES (616, '1007', 34, '0x006C~0x006D', '3相总视在电能', NULL, 'INT', 2, 0, 0, 0, 0.010000, 0, 4, NULL, NULL, NULL, NULL, 0, 'admin', '2018-05-30 18:15:47', 'admin', '2018-05-30 18:15:47', '2018-05-30 18:27:58', 0);

-- ----------------------------
-- Table structure for equipment_meter_type
-- ----------------------------
DROP TABLE IF EXISTS `equipment_meter_type`;
CREATE TABLE `equipment_meter_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `meter_type_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电表类型编号',
  `meter_type` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电表类型',
  `vendor_no` int(11) NULL DEFAULT NULL COMMENT '设备厂商编号',
  `pt_address` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电压互感器变比地址',
  `ct_address` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电流互感器变比地址',
  `three_phase` tinyint(4) NULL DEFAULT 0 COMMENT '是否三相电表:0.单相1.三相',
  `tag` int(11) NULL DEFAULT 0 COMMENT '属性:0.正常1.删除',
  `createuser` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `createdate` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `changeuser` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `changedate` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `rowver` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '时间戳',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_meter_type_no`(`meter_type_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of equipment_meter_type
-- ----------------------------
INSERT INTO `equipment_meter_type` VALUES (1, '1000', 'PMAC600B-Z-SC', 1001, NULL, NULL, 1, 0, 'root', '2017-08-11 10:38:34', 'root', '2017-08-11 10:38:34', '2018-02-08 16:28:33');
INSERT INTO `equipment_meter_type` VALUES (2, '1001', 'LU-312', 1004, NULL, NULL, 1, 0, 'root', '2017-08-11 10:40:30', 'root', '2017-08-11 10:40:30', '2018-02-08 16:28:39');
INSERT INTO `equipment_meter_type` VALUES (3, '1002', 'PMAC720', 1001, NULL, NULL, 1, 0, 'root', '2017-08-11 10:41:04', 'root', '2017-08-11 10:41:04', '2018-02-08 16:28:45');
INSERT INTO `equipment_meter_type` VALUES (4, '1003', 'YD2202', 1002, NULL, NULL, 1, 0, 'root', '2017-08-11 10:41:28', 'root', '2017-08-11 10:41:28', '2018-02-08 16:28:49');
INSERT INTO `equipment_meter_type` VALUES (5, '1004', 'PD866E', 1000, NULL, NULL, 1, 0, 'root', '2017-08-11 10:42:09', 'root', '2017-08-11 10:42:09', '2018-02-08 16:28:54');
INSERT INTO `equipment_meter_type` VALUES (6, '1005', 'YD2040', 1002, NULL, NULL, 1, 0, 'root', '2017-08-15 16:41:39', 'root', '2017-08-15 16:41:39', '2018-02-08 16:28:58');
INSERT INTO `equipment_meter_type` VALUES (7, '1006', 'YD2045C-W', 1002, NULL, NULL, 1, 0, 'root', '2017-09-27 11:11:33', 'root', '2017-09-27 11:11:33', '2018-02-08 16:29:03');
INSERT INTO `equipment_meter_type` VALUES (8, '1007', 'PMC-D726M', 1003, NULL, NULL, 1, 0, 'root', '2018-02-08 16:20:56', 'root', '2018-02-08 16:20:56', '2018-02-08 16:29:08');
INSERT INTO `equipment_meter_type` VALUES (9, '1008', 'PMC-350', 1003, NULL, NULL, 1, 0, 'root', '2018-02-08 16:21:07', 'root', '2018-02-08 16:21:07', '2018-02-08 16:29:09');
INSERT INTO `equipment_meter_type` VALUES (13, '1009', 'RJ-OP485', 1005, '', '', 1, 0, '超级管理员', '2018-05-17 15:04:08', '超级管理员', '2018-06-04 09:19:08', '2018-06-04 09:19:09');

-- ----------------------------
-- Table structure for equipment_room
-- ----------------------------
DROP TABLE IF EXISTS `equipment_room`;
CREATE TABLE `equipment_room`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `room_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电房编号',
  `room_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电房名称',
  `customer_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户编号',
  `tag` int(11) NULL DEFAULT 0 COMMENT '状态:0.正常1.删除',
  `createuser` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `createdate` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `changeuser` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `changedate` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_room_no`(`room_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of equipment_room
-- ----------------------------
INSERT INTO `equipment_room` VALUES (1, '10020001', '低压房', '1002', 0, 'root', '2018-05-24 20:17:00', '超级管理员', '2018-05-28 20:59:19');
INSERT INTO `equipment_room` VALUES (2, '10020002', '高压房', '1002', 0, 'root', '2018-05-24 20:17:16', '超级管理员', '2018-05-28 20:58:56');
INSERT INTO `equipment_room` VALUES (3, '10040001', 'G1高压房', '1004', 0, 'root', '2018-05-24 20:45:46', '超级管理员', '2018-05-28 20:59:02');
INSERT INTO `equipment_room` VALUES (4, '10040002', '低压房3', '1004', 0, 'root', '2018-05-24 20:48:39', '超级管理员', '2018-05-28 20:59:22');
INSERT INTO `equipment_room` VALUES (5, '10040003', '低压房2', '1004', 0, 'root', '2018-05-24 20:50:50', '超级管理员', '2018-05-28 20:59:26');
INSERT INTO `equipment_room` VALUES (6, '10040004', '特斯低压房', '1004', 0, 'root', '2018-05-24 20:52:32', '超级管理员', '2018-05-28 20:59:29');
INSERT INTO `equipment_room` VALUES (7, '10040005', '低压房1', '1004', 0, 'root', '2018-05-24 20:53:19', '超级管理员', '2018-05-28 20:59:32');
INSERT INTO `equipment_room` VALUES (8, '10010001', '分高压房', '1001', 0, '超级管理员', '2018-05-24 21:03:08', '超级管理员', '2018-05-28 20:59:35');
INSERT INTO `equipment_room` VALUES (9, '10010002', '1#高压房', '1001', 0, '超级管理员', '2018-05-24 21:04:09', '超级管理员', '2018-05-28 20:59:39');
INSERT INTO `equipment_room` VALUES (10, '10030001', '1号综合房', '1003', 0, '超级管理员', '2018-05-24 21:09:58', '超级管理员', '2018-05-28 20:59:44');
INSERT INTO `equipment_room` VALUES (11, '10030002', '2号电房', '1003', 0, '超级管理员', '2018-05-24 21:10:46', '超级管理员', '2018-05-28 20:59:50');
INSERT INTO `equipment_room` VALUES (12, '10030003', '3号电房', '1003', 0, '超级管理员', '2018-05-24 21:11:56', '超级管理员', '2018-05-28 20:59:54');
INSERT INTO `equipment_room` VALUES (13, '10030004', '4号综合房', '1003', 0, '超级管理员', '2018-05-24 21:12:34', '超级管理员', '2018-05-28 20:59:57');
INSERT INTO `equipment_room` VALUES (14, '10050001', '2#低压房', '1005', 0, '超级管理员', '2018-05-24 21:15:49', '超级管理员', '2018-05-28 21:00:02');
INSERT INTO `equipment_room` VALUES (15, '10050002', '1#高压房', '1005', 0, '超级管理员', '2018-05-24 21:16:34', '超级管理员', '2018-05-28 21:00:05');
INSERT INTO `equipment_room` VALUES (16, '10050003', '1#低压房', '1005', 0, '超级管理员', '2018-05-24 21:17:08', '超级管理员', '2018-05-28 21:00:07');
INSERT INTO `equipment_room` VALUES (17, '10050004', '3#低压房', '1005', 0, '超级管理员', '2018-05-24 21:17:56', '超级管理员', '2018-05-28 21:00:10');
INSERT INTO `equipment_room` VALUES (18, '10060001', '2T1、2T2低压房', '1006', 0, '超级管理员', '2018-05-24 21:21:38', '超级管理员', '2018-05-28 21:00:13');
INSERT INTO `equipment_room` VALUES (19, '10060002', '3#专变低压房', '1006', 0, '超级管理员', '2018-05-24 21:22:45', '超级管理员', '2018-05-28 21:00:16');
INSERT INTO `equipment_room` VALUES (20, '10060003', '1#专变低压房', '1006', 0, '超级管理员', '2018-05-24 21:24:26', '超级管理员', '2018-05-28 21:00:18');
INSERT INTO `equipment_room` VALUES (21, '10060004', '2T3、2t4低压房', '1006', 0, '超级管理员', '2018-05-24 21:25:10', '超级管理员', '2018-05-28 21:00:24');
INSERT INTO `equipment_room` VALUES (22, '10060005', '1#高压电房', '1006', 0, '超级管理员', '2018-05-24 21:25:38', '超级管理员', '2018-05-28 21:00:26');
INSERT INTO `equipment_room` VALUES (23, '10060006', '3T3、3T4低压房', '1006', 0, '超级管理员', '2018-05-24 21:29:18', '超级管理员', '2018-05-28 21:00:29');
INSERT INTO `equipment_room` VALUES (24, '10060007', '3T1、3T2低压房', '1006', 0, '超级管理员', '2018-05-24 21:29:45', '超级管理员', '2018-05-28 21:00:31');
INSERT INTO `equipment_room` VALUES (25, '10060008', '2#高压进线', '1006', 0, '超级管理员', '2018-05-24 21:30:38', '超级管理员', '2018-05-28 21:00:34');
INSERT INTO `equipment_room` VALUES (26, '10060009', '3T5、3T6低压房', '1006', 0, '超级管理员', '2018-05-24 21:31:06', '梁辉浩', '2018-05-28 21:18:44');
INSERT INTO `equipment_room` VALUES (27, '10070001', 'Z1低压房', '1007', 0, '超级管理员', '2018-05-24 21:35:07', '梁辉浩', '2018-05-28 21:18:40');
INSERT INTO `equipment_room` VALUES (28, '10070002', 'L1、L2低压房', '1007', 0, '超级管理员', '2018-05-24 21:35:29', '梁辉浩', '2018-05-28 21:18:36');
INSERT INTO `equipment_room` VALUES (29, '10070003', '派出所低压房', '1007', 0, '超级管理员', '2018-05-24 21:36:02', '梁辉浩', '2018-05-28 21:18:46');
INSERT INTO `equipment_room` VALUES (30, '10070004', 'J1低压房', '1007', 0, '超级管理员', '2018-05-24 21:36:26', '梁辉浩', '2018-05-28 21:18:49');
INSERT INTO `equipment_room` VALUES (31, '10100001', '2#专变电房', '1010', 0, '超级管理员', '2018-05-24 21:39:05', '梁辉浩', '2018-05-28 21:18:57');
INSERT INTO `equipment_room` VALUES (32, '10100002', '3#专变电房', '1010', 0, '超级管理员', '2018-05-24 21:39:47', '梁辉浩', '2018-05-28 21:19:00');
INSERT INTO `equipment_room` VALUES (33, '10130001', '第六经济合作社低压房', '1013', 0, '超级管理员', '2018-05-27 08:52:15', '超级管理员', '2018-05-27 08:52:15');
INSERT INTO `equipment_room` VALUES (34, '10130002', '园区内低压房', '1013', 0, '超级管理员', '2018-05-27 11:10:51', '超级管理员', '2018-06-04 10:41:56');
INSERT INTO `equipment_room` VALUES (36, '10090001', '低压室', '1009', 0, '超级管理员', '2018-05-28 10:13:50', '超级管理员', '2018-05-28 10:13:50');
INSERT INTO `equipment_room` VALUES (38, '10050005', '总部区岛尖高压房', '1005', 0, '超级管理员', '2018-06-04 10:36:01', '超级管理员', '2018-06-04 10:36:01');
INSERT INTO `equipment_room` VALUES (39, '10060010', '2T5、2T6低压房', '1006', 0, '超级管理员', '2018-06-04 10:37:10', '超级管理员', '2018-06-04 10:37:10');
INSERT INTO `equipment_room` VALUES (40, '10080001', '负二层低压房', '1008', 0, '超级管理员', '2018-06-04 10:38:31', '超级管理员', '2018-06-04 10:38:31');
INSERT INTO `equipment_room` VALUES (41, '10110001', '低压房', '1011', 0, '超级管理员', '2018-06-04 10:40:12', '超级管理员', '2018-06-04 10:40:12');
INSERT INTO `equipment_room` VALUES (42, '10120001', '低压房', '1012', 0, '超级管理员', '2018-06-04 10:40:51', '超级管理员', '2018-06-04 10:40:51');
INSERT INTO `equipment_room` VALUES (43, '10130003', '黄埔村创意园专变低压房', '1013', 0, '超级管理员', '2018-06-04 10:42:22', '超级管理员', '2018-06-04 10:42:22');
INSERT INTO `equipment_room` VALUES (44, '10140001', '低压房', '1014', 0, '超级管理员', '2018-07-04 11:38:12', '超级管理员', '2018-07-04 11:38:12');

-- ----------------------------
-- Table structure for equipment_simcards
-- ----------------------------
DROP TABLE IF EXISTS `equipment_simcards`;
CREATE TABLE `equipment_simcards`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `sim_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sim卡号',
  `ICCID` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ICCID',
  `totaltraffic` decimal(12, 2) NULL DEFAULT NULL COMMENT '总流量',
  `usetraffic` decimal(12, 2) NULL DEFAULT NULL COMMENT '使用量',
  `remaintraffic` decimal(12, 2) NULL DEFAULT NULL COMMENT '剩余量',
  `trafficsynctime` datetime(0) NULL DEFAULT NULL COMMENT '同步时间',
  `packagestarttime` datetime(0) NULL DEFAULT NULL COMMENT '生效时间',
  `packagestoptime` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `customer_id` varchar(38) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户Id',
  `tag` int(11) NULL DEFAULT 0 COMMENT '属性:0.正常1.删除',
  `used` int(11) NULL DEFAULT NULL COMMENT '是否已绑定',
  `createuser` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `createdate` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `changeuser` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `changedate` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `rowver` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '时间戳',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_sim_no`(`sim_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of equipment_simcards
-- ----------------------------
INSERT INTO `equipment_simcards` VALUES (31, '1064720403961', '898607B20917700903961', 150.00, 6.78, 143.22, '2018-07-12 09:02:22', '2017-09-25 08:00:00', '2018-09-01 00:38:08', '0d435bab-21e6-4d3e-aca8-f02b131db975', 0, 1, '超级管理员', '2017-09-28 16:05:07', NULL, '2018-07-12 09:02:22', '2018-07-12 09:02:22');
INSERT INTO `equipment_simcards` VALUES (32, '1064720403955', '898607B20917700903955', 150.00, 5.66, 144.34, '2018-07-12 09:02:22', '2017-09-25 08:00:00', '2018-08-31 20:37:48', '0d435bab-21e6-4d3e-aca8-f02b131db975', 0, 1, '超级管理员', '2017-09-28 16:07:50', NULL, '2018-07-12 09:02:22', '2018-07-12 09:02:22');
INSERT INTO `equipment_simcards` VALUES (33, '1064720403964', '898607B20917700903964', 150.00, 5.74, 144.26, '2018-07-12 09:02:22', '2017-09-25 08:00:00', '2018-09-01 00:38:08', '0d435bab-21e6-4d3e-aca8-f02b131db975', 0, 1, '超级管理员', '2017-09-28 16:08:04', NULL, '2018-07-12 09:02:22', '2018-07-12 09:02:22');
INSERT INTO `equipment_simcards` VALUES (34, '1064720403956', '898607B20917700903956', 150.00, 5.69, 144.31, '2018-07-12 09:02:22', '2017-09-25 08:00:00', '2018-08-31 20:37:48', '0d435bab-21e6-4d3e-aca8-f02b131db975', 0, 1, '超级管理员', '2017-09-28 16:08:19', NULL, '2018-07-12 09:02:22', '2018-07-12 09:02:22');
INSERT INTO `equipment_simcards` VALUES (35, '1064720403953', '898607B20917700903953', 150.00, 5.68, 144.32, '2018-07-12 09:02:22', '2017-09-25 08:00:00', '2018-08-31 20:37:48', '0d435bab-21e6-4d3e-aca8-f02b131db975', 0, 1, '超级管理员', '2017-09-28 16:08:33', NULL, '2018-07-12 09:02:22', '2018-07-12 09:02:22');
INSERT INTO `equipment_simcards` VALUES (36, '1064720403957', '898607B20917700903957', 150.00, 5.68, 144.32, '2018-07-12 09:02:22', '2017-09-25 08:00:00', '2018-08-31 21:37:33', '0d435bab-21e6-4d3e-aca8-f02b131db975', 0, 1, '超级管理员', '2017-09-28 16:08:50', NULL, '2018-07-12 09:02:22', '2018-07-12 09:02:22');
INSERT INTO `equipment_simcards` VALUES (37, '1064720403954', '898607B20917700903954', 150.00, 5.69, 144.31, '2018-07-12 09:02:23', '2017-09-25 08:00:00', '2018-08-31 19:25:08', '0d435bab-21e6-4d3e-aca8-f02b131db975', 0, 1, '超级管理员', '2017-09-28 16:11:23', NULL, '2018-07-12 09:02:23', '2018-07-12 09:02:22');
INSERT INTO `equipment_simcards` VALUES (40, '1064720403959', '898607B20917700903959', 150.00, 6.65, 143.35, '2018-07-12 09:02:22', '2017-09-25 08:00:00', '2018-09-01 01:38:30', '0d435bab-21e6-4d3e-aca8-f02b131db975', 0, 1, '超级管理员', '2017-09-28 16:34:35', NULL, '2018-07-12 09:02:22', '2018-07-12 09:02:22');
INSERT INTO `equipment_simcards` VALUES (41, '1064720403962', '898607B20917700903962', 150.00, 5.47, 144.53, '2018-07-12 09:02:22', '2017-09-25 08:00:00', '2018-09-01 02:37:33', '0d435bab-21e6-4d3e-aca8-f02b131db975', 0, 1, '超级管理员', '2017-09-28 16:39:29', NULL, '2018-07-12 09:02:22', '2018-07-12 09:02:22');
INSERT INTO `equipment_simcards` VALUES (42, '1064720403960', '898607B20917700903960', 150.00, 5.15, 144.85, '2018-07-12 09:02:22', '2017-09-25 08:00:00', '2018-09-01 01:38:30', '0d435bab-21e6-4d3e-aca8-f02b131db975', 0, 1, '超级管理员', '2017-09-28 16:39:39', NULL, '2018-07-12 09:02:22', '2018-07-12 09:02:22');
INSERT INTO `equipment_simcards` VALUES (43, '1064720403958', '898607B20917700903958', 150.00, 5.87, 144.13, '2018-07-12 09:02:23', '2017-09-25 08:00:00', '2018-09-01 01:38:30', '0d435bab-21e6-4d3e-aca8-f02b131db975', 0, 1, '超级管理员', '2017-09-28 16:39:49', NULL, '2018-07-12 09:02:23', '2018-07-12 09:02:22');
INSERT INTO `equipment_simcards` VALUES (45, '1064720403978', '898607B20917700903978', 150.00, 6.91, 143.09, '2018-07-12 09:02:22', '2017-09-01 08:00:00', '2018-08-31 19:05:21', '8df5424c-4d89-42e7-b0e5-36b3a2b91b3b', 0, 0, '超级管理员', '2017-09-29 14:41:29', '超级管理员', '2018-07-12 09:02:22', '2018-07-12 09:02:22');
INSERT INTO `equipment_simcards` VALUES (46, '1064720403980', '898607B20917700903980', 150.00, 4.39, 145.61, '2018-07-12 09:02:22', '2017-09-01 08:00:00', '2018-08-31 23:03:46', '8df5424c-4d89-42e7-b0e5-36b3a2b91b3b', 0, 1, '超级管理员', '2017-09-29 14:41:42', NULL, '2018-07-12 09:02:22', '2018-07-12 09:02:22');
INSERT INTO `equipment_simcards` VALUES (49, '1064720403982', '898607B20917700903982', 150.00, 11.24, 138.76, '2018-07-12 09:02:22', '2017-09-01 08:00:00', '2018-08-31 23:03:46', '8df5424c-4d89-42e7-b0e5-36b3a2b91b3b', 0, 1, '超级管理员', '2017-09-29 17:11:14', NULL, '2018-07-12 09:02:22', '2018-07-12 09:02:22');
INSERT INTO `equipment_simcards` VALUES (50, '1064720403903', '898607B20917700903903', 150.00, 4.51, 145.49, '2018-07-12 09:02:23', '2017-09-13 08:00:00', '2018-09-01 02:35:21', 'f31e9b25-d214-48a5-817b-f9ed8130a0be', 0, 1, '超级管理员', '2017-09-30 09:47:31', NULL, '2018-07-12 09:02:23', '2018-07-12 09:02:22');
INSERT INTO `equipment_simcards` VALUES (51, '1064720403900', '898607B20917700903900', 150.00, 0.00, 150.00, '2018-07-12 09:02:22', '2017-08-16 08:00:00', '2018-08-01 03:01:47', '1aabe40f-c8d3-4d58-970e-f5eb9a557596', 0, 0, '超级管理员', '2017-10-17 10:23:49', NULL, '2018-07-12 09:02:22', '2018-07-12 09:02:22');
INSERT INTO `equipment_simcards` VALUES (52, '1064720403999', '898607B20917700903999', 150.00, 6.74, 143.26, '2018-07-12 09:02:22', '2017-08-16 08:00:00', '2018-08-01 04:31:27', '1aabe40f-c8d3-4d58-970e-f5eb9a557596', 0, 0, '超级管理员', '2017-10-17 10:24:00', '超级管理员', '2018-07-12 09:02:22', '2018-07-12 09:02:22');
INSERT INTO `equipment_simcards` VALUES (53, '1064720403994', '898607B20917700903994', 150.00, 7.19, 142.81, '2018-07-12 09:02:22', '2017-08-19 08:00:00', '2018-08-01 02:00:17', '3cefa0df-7b12-4c61-b330-b16f9260c25e', 0, 0, '超级管理员', '2017-10-17 10:24:34', '超级管理员', '2018-07-12 09:02:22', '2018-07-12 09:02:22');
INSERT INTO `equipment_simcards` VALUES (54, '1064720403992', '898607B20917700903992', 150.00, 11.06, 138.94, '2018-07-12 09:02:23', '2017-08-19 08:00:00', '2018-08-01 03:00:17', '3cefa0df-7b12-4c61-b330-b16f9260c25e', 0, 0, '超级管理员', '2017-10-17 10:25:05', NULL, '2018-07-12 09:02:23', '2018-07-12 09:02:23');
INSERT INTO `equipment_simcards` VALUES (55, '1064720403991', '898607B20917700903991', 150.00, 3.08, 146.92, '2018-07-12 09:02:22', '2017-08-19 08:00:00', '2018-08-01 03:00:17', '3cefa0df-7b12-4c61-b330-b16f9260c25e', 0, 0, '超级管理员', '2017-10-17 10:25:21', NULL, '2018-07-12 09:02:22', '2018-07-12 09:02:22');
INSERT INTO `equipment_simcards` VALUES (56, '1064720403990', '898607B20917700903990', 150.00, 11.75, 138.25, '2018-07-12 09:02:22', '2017-08-19 08:00:00', '2018-08-01 02:00:17', '3cefa0df-7b12-4c61-b330-b16f9260c25e', 0, 0, '超级管理员', '2017-10-17 10:25:46', NULL, '2018-07-12 09:02:22', '2018-07-12 09:02:22');
INSERT INTO `equipment_simcards` VALUES (57, '1064720403981', '898607B20917700903981', 150.00, 5.67, 144.33, '2018-07-12 09:02:22', '2017-09-01 08:00:00', '2018-08-31 23:03:46', 'f31e9b25-d214-48a5-817b-f9ed8130a0be', 0, 0, '超级管理员', '2017-10-17 10:50:29', NULL, '2018-07-12 09:02:22', '2018-07-12 09:02:22');
INSERT INTO `equipment_simcards` VALUES (58, '1064720403901', '898607B20917700903901', 150.00, 4.96, 145.04, '2018-07-12 09:02:22', '2017-09-13 08:00:00', '2018-09-01 00:34:54', 'f31e9b25-d214-48a5-817b-f9ed8130a0be', 0, 0, '超级管理员', '2017-10-17 10:50:50', NULL, '2018-07-12 09:02:22', '2018-07-12 09:02:22');
INSERT INTO `equipment_simcards` VALUES (59, '1064720403997', '898607B20917700903997', 150.00, 6.69, 143.31, '2018-07-12 09:02:23', '2017-08-19 08:00:00', '2018-08-01 02:00:17', '8df5424c-4d89-42e7-b0e5-36b3a2b91b3b', 0, 1, '超级管理员', '2017-10-17 11:11:46', NULL, '2018-07-12 09:02:23', '2018-07-12 09:02:23');
INSERT INTO `equipment_simcards` VALUES (66, '1064720403979', '898607B20917700903979', 150.00, 27.28, 122.72, '2018-07-12 09:02:22', '2017-09-01 08:00:00', '2018-09-01 00:03:37', '8df5424c-4d89-42e7-b0e5-36b3a2b91b3b', 0, 1, '超级管理员', '2017-10-17 14:09:57', NULL, '2018-07-12 09:02:22', '2018-07-12 09:02:22');
INSERT INTO `equipment_simcards` VALUES (68, '1064720403995', '898607B20917700903995', 150.00, 10.85, 139.15, '2018-07-12 09:02:23', '2017-08-19 08:00:00', '2018-08-01 03:00:16', 'd13eb8ad-e3a4-428e-989f-1a377dcbb96c', 0, 1, '超级管理员', '2017-11-06 11:09:09', NULL, '2018-07-12 09:02:23', '2018-07-12 09:02:23');
INSERT INTO `equipment_simcards` VALUES (69, '1064720403963', '898607B20917700903963', 150.00, 10.85, 139.15, '2018-07-12 09:02:23', '2017-10-15 08:00:00', '2018-09-30 13:21:12', 'd13eb8ad-e3a4-428e-989f-1a377dcbb96c', 0, 1, '超级管理员', '2017-11-07 09:50:33', '超级管理员', '2018-07-12 09:02:23', '2018-07-12 09:02:23');
INSERT INTO `equipment_simcards` VALUES (70, '1064720403906', '898607B20917700903906', 150.00, 6.87, 143.13, '2018-07-12 09:02:22', '2017-09-19 08:00:00', '2018-09-01 00:20:46', 'd13eb8ad-e3a4-428e-989f-1a377dcbb96c', 0, 1, '超级管理员', '2017-11-07 09:51:28', NULL, '2018-07-12 09:02:22', '2018-07-12 09:02:22');
INSERT INTO `equipment_simcards` VALUES (71, '1064720403996', '898607B20917700903996', 150.00, 10.88, 139.12, '2018-07-12 09:02:23', '2017-08-19 08:00:00', '2018-08-01 03:00:16', 'd13eb8ad-e3a4-428e-989f-1a377dcbb96c', 0, 1, '超级管理员', '2017-11-07 09:51:51', NULL, '2018-07-12 09:02:23', '2018-07-12 09:02:22');
INSERT INTO `equipment_simcards` VALUES (77, '1064720403965', '898607B20917700903965', 150.00, 6.95, 143.05, '2018-07-12 09:02:22', '2017-10-13 08:00:00', '2018-10-01 00:23:50', NULL, 0, NULL, '超级管理员', '2018-04-19 10:11:51', '', '2018-07-12 09:02:22', '2018-07-12 09:02:22');
INSERT INTO `equipment_simcards` VALUES (78, '1064720403952', '898607B20917700903952', 150.00, 6.70, 143.30, '2018-07-12 09:02:22', '2017-08-22 08:00:00', '2018-08-01 02:00:20', NULL, 0, NULL, '超级管理员', '2018-04-19 10:13:18', '', '2018-07-12 09:02:22', '2018-07-12 09:02:22');
INSERT INTO `equipment_simcards` VALUES (81, '1064720403902', '898607B20917700903902', 150.00, 0.00, 150.00, '2018-07-12 09:02:22', '2017-09-13 08:00:00', '2018-09-01 01:35:47', NULL, 0, NULL, '超级管理员', '2018-05-04 10:15:18', '超级管理员', '2018-07-12 09:02:22', '2018-07-12 09:02:22');
INSERT INTO `equipment_simcards` VALUES (82, '1064720403904', '898607B20917700903904', 150.00, 6.89, 143.11, '2018-07-12 09:02:22', '2017-09-13 08:00:00', '2018-09-01 01:35:47', NULL, 0, NULL, '超级管理员', '2018-05-04 10:15:39', '超级管理员', '2018-07-12 09:02:22', '2018-07-12 09:02:22');
INSERT INTO `equipment_simcards` VALUES (83, '1064720403905', '898607B20917700903905', 150.00, 6.72, 143.28, '2018-07-12 09:02:23', '2017-09-13 08:00:00', '2018-09-01 02:35:21', NULL, 0, NULL, '超级管理员', '2018-05-04 10:15:52', '超级管理员', '2018-07-12 09:02:23', '2018-07-12 09:02:22');
INSERT INTO `equipment_simcards` VALUES (84, '1064720403966', '898607B20917700903966', 150.00, 0.00, 150.00, '2018-07-12 09:02:22', '2018-01-11 08:00:00', '2019-01-01 00:29:06', NULL, 1, NULL, '超级管理员', '2018-05-04 10:18:04', '', '2018-07-12 09:02:22', '2018-07-12 09:02:22');
INSERT INTO `equipment_simcards` VALUES (85, '1064720403967', '898607B20917700903967', 150.00, 7.19, 142.81, '2018-07-12 09:02:22', '2018-02-03 08:00:00', '2019-01-31 20:45:46', NULL, 0, NULL, '超级管理员', '2018-05-04 10:18:16', '超级管理员', '2018-07-12 09:02:22', '2018-07-12 09:02:22');
INSERT INTO `equipment_simcards` VALUES (86, '1064720403968', '898607B20917700903968', 150.00, 4.93, 145.07, '2018-07-12 09:02:22', '2017-10-13 08:00:00', '2018-10-01 00:23:49', NULL, 1, NULL, '超级管理员', '2018-05-04 10:18:26', '', '2018-07-12 09:02:22', '2018-07-12 09:02:22');
INSERT INTO `equipment_simcards` VALUES (87, '1064720403969', '898607B20917700903969', 150.00, 3.99, 146.01, '2018-07-12 09:02:22', '2017-08-18 08:00:00', '2018-07-31 19:30:03', NULL, 1, NULL, '超级管理员', '2018-05-04 10:18:36', '', '2018-07-12 09:02:22', '2018-07-12 09:02:22');
INSERT INTO `equipment_simcards` VALUES (88, '1064720403970', '898607B20917700903970', 150.00, 0.00, 150.00, '2018-07-12 09:02:22', '2017-08-17 08:00:00', '2018-08-01 04:30:03', NULL, 1, NULL, '超级管理员', '2018-05-04 10:18:49', '', '2018-07-12 09:02:22', '2018-07-12 09:02:22');
INSERT INTO `equipment_simcards` VALUES (89, '1064720403971', '898607B20917700903971', 150.00, 0.00, 150.00, '2018-07-12 09:02:22', '2017-08-15 08:00:00', '2018-08-01 06:31:26', NULL, 1, NULL, '超级管理员', '2018-05-04 10:19:01', '', '2018-07-12 09:02:22', '2018-07-12 09:02:22');
INSERT INTO `equipment_simcards` VALUES (90, '1064720403972', '898607B20917700903972', 150.00, 1.71, 148.29, '2018-07-12 09:02:22', '2017-08-13 08:00:00', '2018-07-31 22:31:03', NULL, 1, NULL, '超级管理员', '2018-05-04 10:19:11', '', '2018-07-12 09:02:22', '2018-07-12 09:02:22');
INSERT INTO `equipment_simcards` VALUES (91, '1064720403973', '898607B20917700903973', 150.00, 14.11, 135.89, '2018-07-12 09:02:22', '2017-08-14 08:00:00', '2018-07-31 22:01:04', NULL, 1, NULL, '超级管理员', '2018-05-04 10:19:21', '', '2018-07-12 09:02:22', '2018-07-12 09:02:22');
INSERT INTO `equipment_simcards` VALUES (92, '1064720403974', '898607B20917700903974', 150.00, 0.00, 150.00, '2018-07-12 09:02:22', '2017-08-18 08:00:00', '2018-07-31 18:30:03', NULL, 1, NULL, '超级管理员', '2018-05-04 10:19:37', '', '2018-07-12 09:02:22', '2018-07-12 09:02:22');
INSERT INTO `equipment_simcards` VALUES (93, '1064720403975', '898607B20917700903975', 150.00, 104.15, 45.85, '2018-07-12 09:02:23', '2017-08-14 08:00:00', '2018-08-01 02:01:39', NULL, 1, NULL, '超级管理员', '2018-05-04 10:20:02', '', '2018-07-12 09:02:23', '2018-07-12 09:02:22');
INSERT INTO `equipment_simcards` VALUES (94, '1064720403976', '898607B20917700903976', 150.00, 128.83, 21.17, '2018-07-12 09:02:22', '2017-08-14 08:00:00', '2018-08-01 02:01:38', NULL, 1, NULL, '超级管理员', '2018-05-04 10:20:11', '', '2018-07-12 09:02:22', '2018-07-12 09:02:22');
INSERT INTO `equipment_simcards` VALUES (95, '1064720403977', '898607B20917700903977', 150.00, 0.05, 149.95, '2018-07-12 09:02:22', '2017-08-15 08:00:00', '2018-08-01 02:31:52', NULL, 1, NULL, '超级管理员', '2018-05-04 10:20:21', '', '2018-07-12 09:02:22', '2018-07-12 09:02:22');
INSERT INTO `equipment_simcards` VALUES (96, '1064720403983', '898607B20917700903983', 150.00, 47.49, 102.51, '2018-07-12 09:02:22', '2017-10-10 08:00:00', '2018-09-30 19:52:10', NULL, 0, NULL, '超级管理员', '2018-05-04 10:21:11', '超级管理员', '2018-07-12 09:02:22', '2018-07-12 09:02:22');
INSERT INTO `equipment_simcards` VALUES (97, '1064720403984', '898607B20917700903984', 150.00, 65.46, 84.54, '2018-07-12 09:02:23', '2017-12-13 08:00:00', '2018-12-01 01:57:00', NULL, 0, NULL, '超级管理员', '2018-05-04 10:21:20', '超级管理员', '2018-07-12 09:02:23', '2018-07-12 09:02:23');
INSERT INTO `equipment_simcards` VALUES (98, '1064720403985', '898607B20917700903985', 150.00, 49.72, 100.28, '2018-07-12 09:02:22', '2018-02-03 08:00:00', '2019-01-31 16:47:15', NULL, 0, NULL, '超级管理员', '2018-05-04 10:21:30', '超级管理员', '2018-07-12 09:02:22', '2018-07-12 09:02:22');
INSERT INTO `equipment_simcards` VALUES (99, '1064720403986', '898607B20917700903986', 150.00, 41.69, 108.31, '2018-07-12 09:02:22', '2018-02-03 08:00:00', '2019-01-31 18:46:57', NULL, 0, NULL, '超级管理员', '2018-05-04 10:21:41', '超级管理员', '2018-07-12 09:02:22', '2018-07-12 09:02:22');
INSERT INTO `equipment_simcards` VALUES (100, '1064720403987', '898607B20917700903987', 150.00, 0.00, 150.00, '2018-07-12 09:02:22', '2018-02-03 08:00:00', '2019-01-31 21:48:26', NULL, 1, NULL, '超级管理员', '2018-05-04 10:21:49', '', '2018-07-12 09:02:22', '2018-07-12 09:02:22');
INSERT INTO `equipment_simcards` VALUES (101, '1064720403988', '898607B20917700903988', 150.00, 26.81, 123.19, '2018-07-12 09:02:22', '2018-02-03 08:00:00', '2019-01-31 20:45:45', NULL, 0, NULL, '超级管理员', '2018-05-04 10:22:03', '超级管理员', '2018-07-12 09:02:22', '2018-07-12 09:02:22');
INSERT INTO `equipment_simcards` VALUES (102, '1064720403989', '898607B20917700903989', 150.00, 40.21, 109.79, '2018-07-12 09:02:22', '2018-02-03 08:00:00', '2019-01-31 18:46:57', NULL, 0, NULL, '超级管理员', '2018-05-04 10:22:16', '超级管理员', '2018-07-12 09:02:22', '2018-07-12 09:02:22');
INSERT INTO `equipment_simcards` VALUES (103, '1064720403993', '898607B20917700903993', 150.00, 6.17, 143.83, '2018-07-12 09:02:22', '2017-08-19 08:00:00', '2018-08-01 02:00:17', NULL, 0, NULL, '超级管理员', '2018-05-04 10:22:51', '超级管理员', '2018-07-12 09:02:22', '2018-07-12 09:02:22');
INSERT INTO `equipment_simcards` VALUES (104, '1064720403998', '898607B20917700903998', 150.00, 0.00, 150.00, '2018-07-12 09:02:22', '2017-08-17 08:00:00', '2018-08-01 00:01:17', NULL, 1, NULL, '超级管理员', '2018-05-04 10:23:30', '', '2018-07-12 09:02:22', '2018-07-12 09:02:22');
INSERT INTO `equipment_simcards` VALUES (105, '1064873237919', '', 0.00, 0.00, 0.00, '2018-07-12 09:02:22', NULL, NULL, NULL, 1, NULL, '超级管理员', '2018-05-27 08:02:45', '', '2018-07-12 09:02:22', '2018-07-12 09:02:22');
INSERT INTO `equipment_simcards` VALUES (106, '1064873237923', '', 0.00, 0.00, 0.00, '2018-07-12 09:02:22', NULL, NULL, NULL, 0, NULL, '超级管理员', '2018-05-27 08:03:05', '超级管理员', '2018-07-12 09:02:22', '2018-07-12 09:02:22');
INSERT INTO `equipment_simcards` VALUES (107, '1064873237914', '', 0.00, 0.00, 0.00, '2018-07-12 09:02:22', NULL, NULL, NULL, 0, NULL, '超级管理员', '2018-06-28 14:14:52', '超级管理员', '2018-07-12 09:02:22', '2018-07-12 09:02:22');
INSERT INTO `equipment_simcards` VALUES (108, '1064873237905', '', 0.00, 0.00, 0.00, '2018-07-12 09:02:22', NULL, NULL, NULL, 0, NULL, '超级管理员', '2018-07-04 11:53:51', '超级管理员', '2018-07-12 09:02:22', '2018-07-12 09:02:22');
INSERT INTO `equipment_simcards` VALUES (109, '1064873237906', '', 0.00, 0.00, 0.00, '2018-07-12 09:02:22', NULL, NULL, NULL, 0, NULL, '超级管理员', '2018-07-04 12:51:07', '超级管理员', '2018-07-12 09:02:22', '2018-07-12 09:02:21');
INSERT INTO `equipment_simcards` VALUES (110, '1064873237907', '', 0.00, 0.00, 0.00, '2018-07-12 09:02:21', NULL, NULL, NULL, 0, NULL, '超级管理员', '2018-07-04 12:51:31', '超级管理员', '2018-07-12 09:02:21', '2018-07-12 09:02:21');

-- ----------------------------
-- Table structure for equipment_table_config
-- ----------------------------
DROP TABLE IF EXISTS `equipment_table_config`;
CREATE TABLE `equipment_table_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `field_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段',
  `field_desc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段名称',
  `function_table1` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表名',
  `function_table2` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `function_table3` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tag` int(11) NULL DEFAULT 0 COMMENT '状态:0.正常1.删除',
  `createuser` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `createdate` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `changeuser` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `changedate` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `rowver` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '时间戳',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_field_name`(`field_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 95 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of equipment_table_config
-- ----------------------------
INSERT INTO `equipment_table_config` VALUES (1, 'a_voltage', 'A相电压', 'collect_base_info', NULL, NULL, 0, 'root', '2018-01-29 14:49:05', 'root', '2018-01-29 14:49:05', '2018-01-29 15:01:34');
INSERT INTO `equipment_table_config` VALUES (2, 'b_voltage', 'B相电压', 'collect_base_info', NULL, NULL, 0, 'root', '2018-01-29 15:02:00', 'root', '2018-01-29 15:02:00', '2018-01-29 15:42:46');
INSERT INTO `equipment_table_config` VALUES (3, 'c_voltage', 'C相电压', 'collect_base_info', NULL, NULL, 0, 'root', '2018-01-29 15:02:17', 'root', '2018-01-29 15:02:17', '2018-01-29 15:42:46');
INSERT INTO `equipment_table_config` VALUES (4, 'a_electricity', 'A相电流', 'collect_base_info', NULL, NULL, 0, 'root', '2018-01-29 15:05:17', 'root', '2018-01-29 15:05:17', '2018-01-29 15:42:46');
INSERT INTO `equipment_table_config` VALUES (5, 'b_electricity', 'B相电流', 'collect_base_info', NULL, NULL, 0, 'root', '2018-01-29 15:05:20', 'root', '2018-01-29 15:05:20', '2018-01-29 15:42:46');
INSERT INTO `equipment_table_config` VALUES (6, 'c_electricity', 'C相电流', 'collect_base_info', NULL, NULL, 0, 'root', '2018-01-29 15:05:22', 'root', '2018-01-29 15:05:22', '2018-01-29 15:42:46');
INSERT INTO `equipment_table_config` VALUES (7, 'a_power_factor', 'A相功率因数', 'collect_base_info', NULL, NULL, 0, 'root', '2018-01-29 15:06:34', 'root', '2018-01-29 15:06:34', '2018-01-29 15:42:46');
INSERT INTO `equipment_table_config` VALUES (8, 'b_power_factor', 'B相功率因数', 'collect_base_info', NULL, NULL, 0, 'root', '2018-01-29 15:06:34', 'root', '2018-01-29 15:06:34', '2018-01-29 15:42:46');
INSERT INTO `equipment_table_config` VALUES (9, 'c_power_factor', 'C相功率因数', 'collect_base_info', NULL, NULL, 0, 'root', '2018-01-29 15:06:34', 'root', '2018-01-29 15:06:34', '2018-01-29 15:42:46');
INSERT INTO `equipment_table_config` VALUES (10, 'total_power_factor', '3相总功率因数', 'collect_base_info', NULL, NULL, 0, 'root', '2018-01-29 15:06:34', 'root', '2018-01-29 15:06:34', '2018-01-29 15:42:46');
INSERT INTO `equipment_table_config` VALUES (11, 'a_ap_power', 'A相视在功率', 'collect_base_info', NULL, NULL, 0, 'root', '2018-01-29 15:07:40', 'root', '2018-01-29 15:07:40', '2018-01-29 15:42:46');
INSERT INTO `equipment_table_config` VALUES (12, 'b_ap_power', 'B相视在功率', 'collect_base_info', NULL, NULL, 0, 'root', '2018-01-29 15:07:40', 'root', '2018-01-29 15:07:40', '2018-01-29 15:42:46');
INSERT INTO `equipment_table_config` VALUES (13, 'c_ap_power', 'C相视在功率', 'collect_base_info', NULL, NULL, 0, 'root', '2018-01-29 15:07:40', 'root', '2018-01-29 15:07:40', '2018-01-29 15:42:46');
INSERT INTO `equipment_table_config` VALUES (14, 'total_ap_power', '3相总视在功率', 'collect_base_info', NULL, NULL, 0, 'root', '2018-01-29 15:07:40', 'root', '2018-01-29 15:07:40', '2018-01-29 15:42:46');
INSERT INTO `equipment_table_config` VALUES (15, 'a_reactive_power', 'A相无功功率', 'collect_base_info', NULL, NULL, 0, 'root', '2018-01-29 15:09:47', 'root', '2018-01-29 15:09:47', '2018-01-29 15:42:46');
INSERT INTO `equipment_table_config` VALUES (16, 'b_reactive_power', 'B相无功功率', 'collect_base_info', NULL, NULL, 0, 'root', '2018-01-29 15:09:47', 'root', '2018-01-29 15:09:47', '2018-01-29 15:42:46');
INSERT INTO `equipment_table_config` VALUES (17, 'c_reactive_power', 'C相无功功率', 'collect_base_info', NULL, NULL, 0, 'root', '2018-01-29 15:09:47', 'root', '2018-01-29 15:09:47', '2018-01-29 15:42:46');
INSERT INTO `equipment_table_config` VALUES (18, 'total_reactive_power', '3相总无功功率', 'collect_base_info', NULL, NULL, 0, 'root', '2018-01-29 15:09:47', 'root', '2018-01-29 15:09:47', '2018-01-29 15:42:46');
INSERT INTO `equipment_table_config` VALUES (19, 'a_active_power', 'A相有功功率', 'collect_base_info', NULL, NULL, 0, 'root', '2018-01-29 15:10:27', 'root', '2018-01-29 15:10:27', '2018-01-29 15:42:46');
INSERT INTO `equipment_table_config` VALUES (20, 'b_active_power', 'B相有功功率', 'collect_base_info', NULL, NULL, 0, 'root', '2018-01-29 15:10:27', 'root', '2018-01-29 15:10:27', '2018-01-29 15:42:46');
INSERT INTO `equipment_table_config` VALUES (21, 'c_active_power', 'C相有功功率', 'collect_base_info', NULL, NULL, 0, 'root', '2018-01-29 15:10:27', 'root', '2018-01-29 15:10:27', '2018-01-29 15:42:46');
INSERT INTO `equipment_table_config` VALUES (22, 'total_active_power', '3相总有功功率', 'collect_base_info', NULL, NULL, 0, 'root', '2018-01-29 15:10:27', 'root', '2018-01-29 15:10:27', '2018-01-29 15:42:46');
INSERT INTO `equipment_table_config` VALUES (23, 'a_at_ee', 'A相有功电能', 'collect_base_info', NULL, NULL, 0, 'root', '2018-01-29 15:11:29', 'root', '2018-01-29 15:11:29', '2018-01-29 15:42:46');
INSERT INTO `equipment_table_config` VALUES (24, 'b_at_ee', 'B相有功电能', 'collect_base_info', NULL, NULL, 0, 'root', '2018-01-29 15:11:29', 'root', '2018-01-29 15:11:29', '2018-01-29 15:42:46');
INSERT INTO `equipment_table_config` VALUES (25, 'c_at_ee', 'C相有功电能', 'collect_base_info', NULL, NULL, 0, 'root', '2018-01-29 15:11:29', 'root', '2018-01-29 15:11:29', '2018-01-29 15:42:46');
INSERT INTO `equipment_table_config` VALUES (26, 'total_at_ee', '3相总相有功电能', 'collect_base_info', NULL, NULL, 0, 'root', '2018-01-29 15:11:29', 'root', '2018-01-29 15:11:29', '2018-01-29 15:42:46');
INSERT INTO `equipment_table_config` VALUES (27, 'total_p_at_ee', '3相总正向有功电能', 'collect_base_info', NULL, NULL, 0, 'root', '2018-01-29 15:16:33', 'root', '2018-01-29 15:16:33', '2018-01-29 15:42:46');
INSERT INTO `equipment_table_config` VALUES (28, 'total_r_at_ee', '3相总反向有功电能', 'collect_base_info', NULL, NULL, 0, 'root', '2018-01-29 15:16:33', 'root', '2018-01-29 15:16:33', '2018-01-29 15:42:46');
INSERT INTO `equipment_table_config` VALUES (29, 'total_p_reat_ee', '3相总正向无功电能', 'collect_base_info', NULL, NULL, 0, 'root', '2018-01-29 15:17:01', 'root', '2018-01-29 15:17:01', '2018-01-29 15:42:46');
INSERT INTO `equipment_table_config` VALUES (30, 'total_r_reat_ee', '3相总反向无功电能', 'collect_base_info', NULL, NULL, 0, 'root', '2018-01-29 15:17:01', 'root', '2018-01-29 15:17:01', '2018-01-29 15:42:46');
INSERT INTO `equipment_table_config` VALUES (31, 'total_ap_a_ee', '3相总视在电能', 'collect_base_info', NULL, NULL, 0, 'root', '2018-01-29 15:18:01', 'root', '2018-01-29 15:18:01', '2018-01-29 15:42:46');
INSERT INTO `equipment_table_config` VALUES (32, 'total_ap_reat_ee', '3相总无功电能', 'collect_base_info', NULL, NULL, 0, 'root', '2018-01-29 15:18:01', 'root', '2018-01-29 15:18:01', '2018-01-29 15:42:46');
INSERT INTO `equipment_table_config` VALUES (33, 'frequency', '频率', 'collect_base_info', NULL, NULL, 0, 'root', '2018-01-29 15:18:24', 'root', '2018-01-29 15:18:24', '2018-01-29 15:42:46');
INSERT INTO `equipment_table_config` VALUES (34, 'uab_line_voltage', 'A,B两相线电压', 'collect_base_info', NULL, NULL, 0, 'root', '2018-01-29 15:19:08', 'root', '2018-01-29 15:19:08', '2018-01-29 15:42:46');
INSERT INTO `equipment_table_config` VALUES (35, 'ubc_line_voltage', 'B,C两相线电压', 'collect_base_info', NULL, NULL, 0, 'root', '2018-01-29 15:19:08', 'root', '2018-01-29 15:19:08', '2018-01-29 15:42:46');
INSERT INTO `equipment_table_config` VALUES (36, 'uac_line_voltage', 'A,C两相线电压', 'collect_base_info', NULL, NULL, 0, 'root', '2018-01-29 15:19:08', 'root', '2018-01-29 15:19:08', '2018-01-29 15:42:46');
INSERT INTO `equipment_table_config` VALUES (37, 'a_load', 'A相负荷', '', NULL, NULL, 0, 'root', '2018-01-29 15:19:55', 'root', '2018-01-29 15:19:55', '2018-01-30 18:45:27');
INSERT INTO `equipment_table_config` VALUES (38, 'b_load', 'B相负荷', '', NULL, NULL, 0, 'root', '2018-01-29 15:19:55', 'root', '2018-01-29 15:19:55', '2018-01-30 18:45:25');
INSERT INTO `equipment_table_config` VALUES (39, 'c_load', 'C相负荷', '', NULL, NULL, 0, 'root', '2018-01-29 15:19:55', 'root', '2018-01-29 15:19:55', '2018-01-30 18:45:23');
INSERT INTO `equipment_table_config` VALUES (40, 'total_load', '3相总负荷', '', NULL, NULL, 0, 'root', '2018-01-29 15:19:55', 'root', '2018-01-29 15:19:55', '2018-01-30 18:45:21');
INSERT INTO `equipment_table_config` VALUES (41, 'voltage_unbalance', '电压不平衡率', '', NULL, NULL, 0, 'root', '2018-01-29 15:21:21', 'root', '2018-01-29 15:21:21', '2018-01-30 18:45:20');
INSERT INTO `equipment_table_config` VALUES (42, 'electricity_unbalance', '电流不平衡率', '', NULL, NULL, 0, 'root', '2018-01-29 15:21:21', 'root', '2018-01-29 15:21:21', '2018-01-30 18:45:18');
INSERT INTO `equipment_table_config` VALUES (43, 'a_line_loss', 'A相线损', '', NULL, NULL, 0, 'root', '2018-01-29 15:22:09', 'root', '2018-01-29 15:22:09', '2018-01-30 18:45:17');
INSERT INTO `equipment_table_config` VALUES (44, 'b_line_loss', 'B相线损', '', NULL, NULL, 0, 'root', '2018-01-29 15:22:09', 'root', '2018-01-29 15:22:09', '2018-01-30 18:45:16');
INSERT INTO `equipment_table_config` VALUES (45, 'c_line_loss', 'C相线损', '', NULL, NULL, 0, 'root', '2018-01-29 15:22:09', 'root', '2018-01-29 15:22:09', '2018-01-30 18:45:14');
INSERT INTO `equipment_table_config` VALUES (46, 'total_line_loss', '3相总线损', '', NULL, NULL, 0, 'root', '2018-01-29 15:22:09', 'root', '2018-01-29 15:22:09', '2018-01-30 18:45:11');
INSERT INTO `equipment_table_config` VALUES (47, 'aver_line_voltage', '平均线电压', '', NULL, NULL, 0, 'root', '2018-01-29 15:22:59', 'root', '2018-01-29 15:22:59', '2018-01-30 18:45:08');
INSERT INTO `equipment_table_config` VALUES (48, 'average_voltage', '平均相电压', '', NULL, NULL, 0, 'root', '2018-01-29 15:22:59', 'root', '2018-01-29 15:22:59', '2018-01-30 18:45:06');
INSERT INTO `equipment_table_config` VALUES (49, 'average_electricity', '平均电流', '', NULL, NULL, 0, 'root', '2018-01-29 15:22:59', 'root', '2018-01-29 15:22:59', '2018-01-30 18:45:04');
INSERT INTO `equipment_table_config` VALUES (50, 'maximum_demand', '最大需量', '', NULL, NULL, 0, 'root', '2018-01-29 15:22:59', 'root', '2018-01-29 15:22:59', '2018-01-30 18:45:02');
INSERT INTO `equipment_table_config` VALUES (51, 'z_voltage', '零序电压', '', NULL, NULL, 0, 'root', '2018-01-29 15:23:25', 'root', '2018-01-29 15:23:25', '2018-01-30 18:45:00');
INSERT INTO `equipment_table_config` VALUES (52, 'z_electricity', '零序电流', '', NULL, NULL, 0, 'root', '2018-01-29 15:23:25', 'root', '2018-01-29 15:23:25', '2018-01-30 18:44:59');
INSERT INTO `equipment_table_config` VALUES (53, 'IA_1th_harmonic', 'IA波形畸变率', NULL, NULL, NULL, 0, 'root', '2018-01-29 15:29:32', 'root', '2018-01-29 15:29:32', '2018-01-29 15:42:46');
INSERT INTO `equipment_table_config` VALUES (54, 'IA_3th_harmonic', 'IA3次波形畸变率', NULL, NULL, NULL, 0, 'root', '2018-01-29 15:29:32', 'root', '2018-01-29 15:29:32', '2018-01-29 15:42:46');
INSERT INTO `equipment_table_config` VALUES (55, 'IA_5th_harmonic', 'IA5次波形畸变率', NULL, NULL, NULL, 0, 'root', '2018-01-29 15:29:32', 'root', '2018-01-29 15:29:32', '2018-01-29 15:42:46');
INSERT INTO `equipment_table_config` VALUES (56, 'IA_7th_harmonic', 'IA7次波形畸变率', NULL, NULL, NULL, 0, 'root', '2018-01-29 15:29:32', 'root', '2018-01-29 15:29:32', '2018-01-29 15:42:46');
INSERT INTO `equipment_table_config` VALUES (57, 'IA_9th_harmonic', 'IA9次波形畸变率', NULL, NULL, NULL, 0, 'root', '2018-01-29 15:29:32', 'root', '2018-01-29 15:29:32', '2018-01-29 15:42:46');
INSERT INTO `equipment_table_config` VALUES (58, 'IA_11th_harmonic', 'IA11次波形畸变率', NULL, NULL, NULL, 0, 'root', '2018-01-29 15:29:32', 'root', '2018-01-29 15:29:32', '2018-01-29 15:42:46');
INSERT INTO `equipment_table_config` VALUES (59, 'IA_13th_harmonic', 'IA13次波形畸变率', NULL, NULL, NULL, 0, 'root', '2018-01-29 15:29:32', 'root', '2018-01-29 15:29:32', '2018-01-29 15:42:46');
INSERT INTO `equipment_table_config` VALUES (60, 'IB_1th_harmonic', 'IB波形畸变率', NULL, NULL, NULL, 0, 'root', '2018-01-29 15:33:59', 'root', '2018-01-29 15:33:59', '2018-01-29 15:42:46');
INSERT INTO `equipment_table_config` VALUES (61, 'IB_3th_harmonic', 'IB3次波形畸变率', NULL, NULL, NULL, 0, 'root', '2018-01-29 15:33:59', 'root', '2018-01-29 15:33:59', '2018-01-29 15:42:46');
INSERT INTO `equipment_table_config` VALUES (62, 'IB_5th_harmonic', 'IB5次波形畸变率', NULL, NULL, NULL, 0, 'root', '2018-01-29 15:33:59', 'root', '2018-01-29 15:33:59', '2018-01-29 15:42:46');
INSERT INTO `equipment_table_config` VALUES (63, 'IB_7th_harmonic', 'IB7次波形畸变率', NULL, NULL, NULL, 0, 'root', '2018-01-29 15:33:59', 'root', '2018-01-29 15:33:59', '2018-01-29 15:42:46');
INSERT INTO `equipment_table_config` VALUES (64, 'IB_9th_harmonic', 'IB9次波形畸变率', NULL, NULL, NULL, 0, 'root', '2018-01-29 15:33:59', 'root', '2018-01-29 15:33:59', '2018-01-29 15:42:46');
INSERT INTO `equipment_table_config` VALUES (65, 'IB_11th_harmonic', 'IB11次波形畸变率', NULL, NULL, NULL, 0, 'root', '2018-01-29 15:33:59', 'root', '2018-01-29 15:33:59', '2018-01-29 15:42:46');
INSERT INTO `equipment_table_config` VALUES (66, 'IB_13th_harmonic', 'IB13次波形畸变率', NULL, NULL, NULL, 0, 'root', '2018-01-29 15:33:59', 'root', '2018-01-29 15:33:59', '2018-01-29 15:42:46');
INSERT INTO `equipment_table_config` VALUES (67, 'IC_1th_harmonic', 'IC波形畸变率', NULL, NULL, NULL, 0, 'root', '2018-01-29 15:34:14', 'root', '2018-01-29 15:34:14', '2018-01-29 15:42:46');
INSERT INTO `equipment_table_config` VALUES (68, 'IC_3th_harmonic', 'IC3次波形畸变率', NULL, NULL, NULL, 0, 'root', '2018-01-29 15:34:14', 'root', '2018-01-29 15:34:14', '2018-01-29 15:42:46');
INSERT INTO `equipment_table_config` VALUES (69, 'IC_5th_harmonic', 'IC5次波形畸变率', NULL, NULL, NULL, 0, 'root', '2018-01-29 15:34:14', 'root', '2018-01-29 15:34:14', '2018-01-29 15:42:46');
INSERT INTO `equipment_table_config` VALUES (70, 'IC_7th_harmonic', 'IC7次波形畸变率', NULL, NULL, NULL, 0, 'root', '2018-01-29 15:34:14', 'root', '2018-01-29 15:34:14', '2018-01-29 15:42:46');
INSERT INTO `equipment_table_config` VALUES (71, 'IC_9th_harmonic', 'IC9次波形畸变率', NULL, NULL, NULL, 0, 'root', '2018-01-29 15:34:14', 'root', '2018-01-29 15:34:14', '2018-01-29 15:42:46');
INSERT INTO `equipment_table_config` VALUES (72, 'IC_11th_harmonic', 'IC11次波形畸变率', NULL, NULL, NULL, 0, 'root', '2018-01-29 15:34:14', 'root', '2018-01-29 15:34:14', '2018-01-29 15:42:46');
INSERT INTO `equipment_table_config` VALUES (73, 'IC_13th_harmonic', 'IC13次波形畸变率', NULL, NULL, NULL, 0, 'root', '2018-01-29 15:34:14', 'root', '2018-01-29 15:34:14', '2018-01-29 15:42:46');
INSERT INTO `equipment_table_config` VALUES (74, 'UA_1th_harmonic', 'UA波形畸变率', NULL, NULL, NULL, 0, 'root', '2018-01-29 15:34:46', 'root', '2018-01-29 15:34:46', '2018-01-29 15:45:30');
INSERT INTO `equipment_table_config` VALUES (75, 'UA_3th_harmonic', 'UA3次波形畸变率', NULL, NULL, NULL, 0, 'root', '2018-01-29 15:34:46', 'root', '2018-01-29 15:34:46', '2018-01-29 15:45:27');
INSERT INTO `equipment_table_config` VALUES (76, 'UA_5th_harmonic', 'UA5次波形畸变率', NULL, NULL, NULL, 0, 'root', '2018-01-29 15:34:46', 'root', '2018-01-29 15:34:46', '2018-01-29 15:45:24');
INSERT INTO `equipment_table_config` VALUES (77, 'UA_7th_harmonic', 'UA7次波形畸变率', NULL, NULL, NULL, 0, 'root', '2018-01-29 15:34:46', 'root', '2018-01-29 15:34:46', '2018-01-29 15:45:21');
INSERT INTO `equipment_table_config` VALUES (78, 'UA_9th_harmonic', 'UA9次波形畸变率', NULL, NULL, NULL, 0, 'root', '2018-01-29 15:34:46', 'root', '2018-01-29 15:34:46', '2018-01-29 15:45:17');
INSERT INTO `equipment_table_config` VALUES (79, 'UA_11th_harmonic', 'UA11次波形畸变率', NULL, NULL, NULL, 0, 'root', '2018-01-29 15:34:46', 'root', '2018-01-29 15:34:46', '2018-01-29 15:45:14');
INSERT INTO `equipment_table_config` VALUES (80, 'UA_13th_harmonic', 'UA13次波形畸变率', NULL, NULL, NULL, 0, 'root', '2018-01-29 15:34:46', 'root', '2018-01-29 15:34:46', '2018-01-29 15:45:11');
INSERT INTO `equipment_table_config` VALUES (81, 'UB_1th_harmonic', 'UB波形畸变率', NULL, NULL, NULL, 0, 'root', '2018-01-29 15:34:58', 'root', '2018-01-29 15:34:58', '2018-01-29 15:45:06');
INSERT INTO `equipment_table_config` VALUES (82, 'UB_3th_harmonic', 'UB3次波形畸变率', NULL, NULL, NULL, 0, 'root', '2018-01-29 15:34:58', 'root', '2018-01-29 15:34:58', '2018-01-29 15:45:01');
INSERT INTO `equipment_table_config` VALUES (83, 'UB_5th_harmonic', 'UB5次波形畸变率', NULL, NULL, NULL, 0, 'root', '2018-01-29 15:34:58', 'root', '2018-01-29 15:34:58', '2018-01-29 15:44:57');
INSERT INTO `equipment_table_config` VALUES (84, 'UB_7th_harmonic', 'UB7次波形畸变率', NULL, NULL, NULL, 0, 'root', '2018-01-29 15:34:58', 'root', '2018-01-29 15:34:58', '2018-01-29 15:44:54');
INSERT INTO `equipment_table_config` VALUES (85, 'UB_9th_harmonic', 'UB9次波形畸变率', NULL, NULL, NULL, 0, 'root', '2018-01-29 15:34:58', 'root', '2018-01-29 15:34:58', '2018-01-29 15:44:51');
INSERT INTO `equipment_table_config` VALUES (86, 'UB_11th_harmonic', 'UB11次波形畸变率', NULL, NULL, NULL, 0, 'root', '2018-01-29 15:34:58', 'root', '2018-01-29 15:34:58', '2018-01-29 15:44:47');
INSERT INTO `equipment_table_config` VALUES (87, 'UB_13th_harmonic', 'UB13次波形畸变率', NULL, NULL, NULL, 0, 'root', '2018-01-29 15:34:58', 'root', '2018-01-29 15:34:58', '2018-01-29 15:44:44');
INSERT INTO `equipment_table_config` VALUES (88, 'UC_1th_harmonic', 'UC波形畸变率', NULL, NULL, NULL, 0, 'root', '2018-01-29 15:35:09', 'root', '2018-01-29 15:35:09', '2018-01-29 15:44:41');
INSERT INTO `equipment_table_config` VALUES (89, 'UC_3th_harmonic', 'UC3次波形畸变率', NULL, NULL, NULL, 0, 'root', '2018-01-29 15:35:09', 'root', '2018-01-29 15:35:09', '2018-01-29 15:44:36');
INSERT INTO `equipment_table_config` VALUES (90, 'UC_5th_harmonic', 'UC5次波形畸变率', NULL, NULL, NULL, 0, 'root', '2018-01-29 15:35:09', 'root', '2018-01-29 15:35:09', '2018-01-29 15:44:33');
INSERT INTO `equipment_table_config` VALUES (91, 'UC_7th_harmonic', 'UC7次波形畸变率', NULL, NULL, NULL, 0, 'root', '2018-01-29 15:35:09', 'root', '2018-01-29 15:35:09', '2018-01-29 15:44:30');
INSERT INTO `equipment_table_config` VALUES (92, 'UC_9th_harmonic', 'UC9次波形畸变率', NULL, NULL, NULL, 0, 'root', '2018-01-29 15:35:09', 'root', '2018-01-29 15:35:09', '2018-01-29 15:44:25');
INSERT INTO `equipment_table_config` VALUES (93, 'UC_11th_harmonic', 'UC11次波形畸变率', NULL, NULL, NULL, 0, 'root', '2018-01-29 15:35:09', 'root', '2018-01-29 15:35:09', '2018-01-29 15:44:23');
INSERT INTO `equipment_table_config` VALUES (94, 'UC_13th_harmonic', 'UC13次波形畸变率', NULL, NULL, NULL, 0, 'root', '2018-01-29 15:35:09', 'root', '2018-01-29 15:35:09', '2018-01-29 15:44:17');

-- ----------------------------
-- Table structure for equipment_vendor
-- ----------------------------
DROP TABLE IF EXISTS `equipment_vendor`;
CREATE TABLE `equipment_vendor`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `vendor_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商编号',
  `vendor_desc` varchar(38) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商名称',
  `tag` int(11) NULL DEFAULT 0 COMMENT '属性:0.正常1.删除',
  `createuser` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `createdate` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `changeuser` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `changedate` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `rowver` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '时间戳',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_vendor_no`(`vendor_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of equipment_vendor
-- ----------------------------
INSERT INTO `equipment_vendor` VALUES (1, '1000', '广州电气股份有限公司', 0, 'root', '2018-03-20 11:22:00', '超级管理员', '2018-07-12 09:03:18', '2018-07-12 09:03:17');
INSERT INTO `equipment_vendor` VALUES (2, '1001', '广州电气股份有限公司1', 0, 'root', '2018-01-30 09:37:31', '超级管理员', '2018-07-12 09:03:49', '2018-07-12 09:03:49');
INSERT INTO `equipment_vendor` VALUES (3, '1002', '广州电气股份有限公司2', 0, 'root', '2018-01-30 09:37:49', '超级管理员', '2018-07-12 09:03:44', '2018-07-12 09:03:44');
INSERT INTO `equipment_vendor` VALUES (4, '1003', '广州电气股份有限公司3', 0, 'root', '2018-01-30 09:38:10', '超级管理员', '2018-07-12 09:03:37', '2018-07-12 09:03:37');
INSERT INTO `equipment_vendor` VALUES (5, '1004', '广州电气股份有限公司4', 0, 'root', '2018-01-30 09:38:23', '超级管理员', '2018-07-12 09:03:57', '2018-07-12 09:03:57');
INSERT INTO `equipment_vendor` VALUES (6, '1005', '广州电气股份有限公司5', 0, '超级管理员', '2018-05-17 15:03:35', '超级管理员', '2018-07-12 09:04:02', '2018-07-12 09:04:02');

-- ----------------------------
-- Table structure for sys_backend_conf
-- ----------------------------
DROP TABLE IF EXISTS `sys_backend_conf`;
CREATE TABLE `sys_backend_conf`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `appname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `appversion` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `deploy` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `configtext` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tag` int(11) NULL DEFAULT 0 COMMENT '状态',
  `createuser` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `createdate` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `changeuser` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `changedate` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台APP配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_backend_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_backend_user`;
CREATE TABLE `sys_backend_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `real_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `user_pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `is_super` tinyint(1) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0,
  `mobile` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `email` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `avatar` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台用户管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_backend_user
-- ----------------------------
INSERT INTO `sys_backend_user` VALUES (1, '超级管理员', 'admin', 'e10adc3949ba59abbe56e057f20f883e', 1, 1, '13812345678', 'yunnet@gmail.com', '/static/upload/a290X290.jpg');
INSERT INTO `sys_backend_user` VALUES (4, '梁经理', '001', 'e10adc3949ba59abbe56e057f20f883e', 0, 1, '13812345678', '13812345678@qq.com', '/static/upload/QQ图片20180509133610.jpg');
INSERT INTO `sys_backend_user` VALUES (5, 'guest', 'guest', 'e10adc3949ba59abbe56e057f20f883e', 0, 1, '13812345678', '13812345678@qq.com', '/static/upload/psb.jpg');
INSERT INTO `sys_backend_user` VALUES (6, '孙经理', '002', 'e10adc3949ba59abbe56e057f20f883e', 0, 1, '13812345678', '13812345678@qq.com', '/static/upload/QQ图片20180404140325.jpg');
INSERT INTO `sys_backend_user` VALUES (7, '徐经理', '003', 'e10adc3949ba59abbe56e057f20f883e', 0, 1, '13812345678', '13812345678@qq.com', '');
INSERT INTO `sys_backend_user` VALUES (8, '陈经理', '004', 'e10adc3949ba59abbe56e057f20f883e', 0, 1, '13812345678', '13812345678@qq.com', '/static/upload/14958565133811.png');

-- ----------------------------
-- Table structure for sys_backend_user_rms_roles
-- ----------------------------
DROP TABLE IF EXISTS `sys_backend_user_rms_roles`;
CREATE TABLE `sys_backend_user_rms_roles`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rms_backend_user_id` int(11) NOT NULL,
  `rms_role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_logintrace
-- ----------------------------
DROP TABLE IF EXISTS `sys_logintrace`;
CREATE TABLE `sys_logintrace`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `remoteAddr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `loginTime` datetime(0) NULL DEFAULT NULL COMMENT '登录时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource`;
CREATE TABLE `sys_resource`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rtype` int(11) NOT NULL DEFAULT 0,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `parent_id` int(11) NULL DEFAULT NULL,
  `seq` int(11) NOT NULL DEFAULT 0,
  `icon` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `url_for` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 88 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '资源管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_resource
-- ----------------------------
INSERT INTO `sys_resource` VALUES (7, 1, '权限管理', 8, 100, 'fa fa-balance-scale', '');
INSERT INTO `sys_resource` VALUES (8, 0, '系统菜单', NULL, 900, '', '');
INSERT INTO `sys_resource` VALUES (9, 1, '资源管理', 7, 100, 'fa fa-television', 'ResourceController.Index');
INSERT INTO `sys_resource` VALUES (12, 1, '角色管理', 7, 200, 'fa fa-users', 'RoleController.Index');
INSERT INTO `sys_resource` VALUES (13, 1, '用户管理', 7, 300, 'fa fa-user', 'BackendUserController.Index');
INSERT INTO `sys_resource` VALUES (14, 1, '系统管理', 8, 120, 'fa fa-gears', '');
INSERT INTO `sys_resource` VALUES (21, 0, '业务菜单', NULL, 200, '', '');
INSERT INTO `sys_resource` VALUES (22, 1, 'Sim卡管理', 41, 214, 'fa fa-book', 'EquipmentSimCardsController.Index');
INSERT INTO `sys_resource` VALUES (23, 1, '日志管理', 14, 109, 'fa fa-building-o', 'LoginTraceController.Index');
INSERT INTO `sys_resource` VALUES (25, 2, '编辑', 9, 100, 'fa fa-pencil', 'ResourceController.Edit');
INSERT INTO `sys_resource` VALUES (26, 2, '编辑', 13, 100, 'fa fa-pencil', 'BackendUserController.Edit');
INSERT INTO `sys_resource` VALUES (27, 2, '删除', 9, 100, 'fa fa-trash', 'ResourceController.Delete');
INSERT INTO `sys_resource` VALUES (29, 2, '删除', 13, 100, 'fa fa-trash', 'BackendUserController.Delete');
INSERT INTO `sys_resource` VALUES (30, 2, '编辑', 12, 100, 'fa fa-pencil', 'RoleController.Edit');
INSERT INTO `sys_resource` VALUES (31, 2, '删除', 12, 100, 'fa fa-trash', 'RoleController.Delete');
INSERT INTO `sys_resource` VALUES (32, 2, '分配资源', 12, 100, 'fa fa-th', 'RoleController.Allocate');
INSERT INTO `sys_resource` VALUES (35, 1, '仪表1', 75, 1, 'fa fa-wpforms', 'HomeController.Index');
INSERT INTO `sys_resource` VALUES (36, 1, '电表类型', 41, 213, 'fa fa-code-fork', 'EquipmentMeterTypeController.Index');
INSERT INTO `sys_resource` VALUES (37, 1, '电表管理', 41, 216, 'fa fa-credit-card', 'EquipmentMeterConfigController.Index');
INSERT INTO `sys_resource` VALUES (38, 1, '寄存器地址配置', 41, 218, 'fa fa-cubes', 'EquipmentMeterRomConfigController.Index');
INSERT INTO `sys_resource` VALUES (39, 1, '寄存器分段配置', 41, 217, 'fa fa-th-large', 'EquipmentMeterAddrConfigController.Index');
INSERT INTO `sys_resource` VALUES (40, 1, '网络设备管理', 41, 215, 'fa fa-window-restore', 'EquipmentDtuConfigController.Index');
INSERT INTO `sys_resource` VALUES (41, 1, '设备管理', 21, 210, 'fa fa-credit-card', '');
INSERT INTO `sys_resource` VALUES (42, 2, '编辑', 22, 100, 'fa fa-pencil', 'EquipmentSimCardsController.Edit');
INSERT INTO `sys_resource` VALUES (43, 2, '删除', 22, 101, 'fa fa-trash', 'EquipmentSimCardsController.Delete');
INSERT INTO `sys_resource` VALUES (44, 1, '设备供应商', 41, 211, 'fa fa-inbox', 'EquipmentVendorController.Index');
INSERT INTO `sys_resource` VALUES (45, 1, '通讯方式', 41, 212, 'fa fa-feed', 'EquipmentGatewayController.Index');
INSERT INTO `sys_resource` VALUES (46, 1, '字段映射顺序配置', 41, 220, 'fa fa-list-ol', 'EquipmentMeterConfigFieldController.Index');
INSERT INTO `sys_resource` VALUES (47, 1, '字段映射表名配置', 41, 219, 'fa fa-credit-card', 'EquipmentTableConfigController.Index');
INSERT INTO `sys_resource` VALUES (48, 2, '编辑', 44, 100, 'fa fa-pencil', 'EquipmentVendorController.Edit');
INSERT INTO `sys_resource` VALUES (49, 2, '删除', 44, 101, 'fa fa-trash', 'EquipmentVendorController.Delete');
INSERT INTO `sys_resource` VALUES (50, 2, '编辑', 45, 100, 'fa fa-pencil', 'EquipmentGatewayController.Edit');
INSERT INTO `sys_resource` VALUES (51, 2, '删除', 45, 100, 'fa fa-trash', 'EquipmentGatewayController.Delete');
INSERT INTO `sys_resource` VALUES (52, 2, '编辑', 36, 100, 'fa fa-pencil', 'EquipmentMeterTypeController.Edit');
INSERT INTO `sys_resource` VALUES (53, 2, '删除', 36, 100, 'fa fa-trash', 'EquipmentMeterTypeController.Delete');
INSERT INTO `sys_resource` VALUES (54, 2, '编辑', 37, 100, 'fa fa-pencil', 'EquipmentMeterConfigController.Edit');
INSERT INTO `sys_resource` VALUES (55, 2, '删除', 37, 101, 'fa fa-trash', 'EquipmentMeterConfigController.Delete');
INSERT INTO `sys_resource` VALUES (56, 2, '编辑', 38, 100, 'fa fa-pencil', 'EquipmentMeterRomConfigController.Edit');
INSERT INTO `sys_resource` VALUES (57, 2, '删除', 38, 100, 'fa fa-trash', 'EquipmentMeterRomConfigController.Delete');
INSERT INTO `sys_resource` VALUES (58, 2, '编辑', 39, 100, 'fa fa-pencil', 'EquipmentMeterAddrConfigController.Edit');
INSERT INTO `sys_resource` VALUES (59, 2, '删除', 39, 100, 'fa fa-trash', 'EquipmentMeterAddrConfigController.Delete');
INSERT INTO `sys_resource` VALUES (60, 2, '编辑', 40, 100, 'fa fa-pencil', 'EquipmentDtuConfigController.Edit');
INSERT INTO `sys_resource` VALUES (61, 2, '删除', 40, 101, 'fa fa-trash', 'EquipmentDtuConfigController.Delete');
INSERT INTO `sys_resource` VALUES (62, 2, '编辑', 46, 100, 'fa fa-pencil', 'EquipmentMeterConfigFieldController.Edit');
INSERT INTO `sys_resource` VALUES (63, 2, '删除', 46, 101, 'fa fa-trash', 'EquipmentMeterConfigFieldController.Delete');
INSERT INTO `sys_resource` VALUES (64, 2, '删除', 47, 101, 'fa fa-pencil', 'EquipmentTableConfigController.Delete');
INSERT INTO `sys_resource` VALUES (65, 2, '编辑', 47, 100, 'fa fa-trash', 'EquipmentTableConfigController.Edit');
INSERT INTO `sys_resource` VALUES (66, 1, '后台APP配置', 14, 108, 'fa fa-th', 'BackendConfController.Index');
INSERT INTO `sys_resource` VALUES (67, 2, '编辑', 66, 100, 'fa fa-pencil', 'BackendConfController.Edit');
INSERT INTO `sys_resource` VALUES (68, 2, '删除', 66, 100, 'fa fa-trash', 'BackendConfController.Delete');
INSERT INTO `sys_resource` VALUES (69, 1, '数据管理', 21, 300, 'fa fa-database', '');
INSERT INTO `sys_resource` VALUES (70, 1, '电表数据查询', 69, 100, 'fa fa-ioxhost', 'CollectBaseInfoController.Index');
INSERT INTO `sys_resource` VALUES (71, 1, '电表需量查询', 69, 100, 'fa fa-suitcase', 'TotalActivePowerMinuteController.Index');
INSERT INTO `sys_resource` VALUES (72, 1, '系统工具', 8, 100, 'fa fa-magnet', '');
INSERT INTO `sys_resource` VALUES (73, 1, '图标信息', 72, 100, 'fa fa-gg', 'IconsController.Index');
INSERT INTO `sys_resource` VALUES (74, 1, 'Websocket测试', 72, 100, 'fa fa-skyatlas', 'WebsocketWidgetController.Index');
INSERT INTO `sys_resource` VALUES (75, 1, '仪表盘', NULL, 100, 'menu-icon fa fa-tachometer', '');
INSERT INTO `sys_resource` VALUES (76, 1, '仪表2', 75, 2, 'fa fa-tv', 'HomeController.Index2');
INSERT INTO `sys_resource` VALUES (77, 1, '客户管理', 21, 100, 'fa fa-address-book', '');
INSERT INTO `sys_resource` VALUES (78, 1, '客户信息', 77, 100, 'fa fa-male', 'EquipmentCustomerController.Index');
INSERT INTO `sys_resource` VALUES (79, 2, '编辑', 78, 100, 'fa fa-pencil', 'EquipmentCustomerController.Edit');
INSERT INTO `sys_resource` VALUES (80, 2, '删除', 78, 101, 'fa fa-trash', 'EquipmentCustomerController.Delete');
INSERT INTO `sys_resource` VALUES (81, 1, '电房信息', 77, 101, 'fa fa-home', 'EquipmentRoomController.Index');
INSERT INTO `sys_resource` VALUES (82, 2, '编辑', 81, 100, 'fa fa-pencil', 'EquipmentRoomController.Edit');
INSERT INTO `sys_resource` VALUES (83, 2, '删除', 81, 101, 'fa fa-trash', 'EquipmentRoomController.Delete');
INSERT INTO `sys_resource` VALUES (84, 1, '系统参数管理', 14, 100, 'fa fa-list-alt', 'SystemValController.Index');
INSERT INTO `sys_resource` VALUES (85, 2, '编辑', 84, 100, 'fa fa-pencil', 'SystemValController.Edit');
INSERT INTO `sys_resource` VALUES (86, 2, '删除', 84, 101, 'fa fa-trash', 'SystemValController.Delete');
INSERT INTO `sys_resource` VALUES (87, 1, '采集条数查询', 69, 100, 'fa fa-building', 'TotalDtuRowsController.Index');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `seq` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (22, '超级管理员', 1);
INSERT INTO `sys_role` VALUES (24, '角色管理员', 10);
INSERT INTO `sys_role` VALUES (25, '客户管理', 5);
INSERT INTO `sys_role` VALUES (26, '运维人员', 4);

-- ----------------------------
-- Table structure for sys_role_backenduser_rel
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_backenduser_rel`;
CREATE TABLE `sys_role_backenduser_rel`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `backend_user_id` int(11) NOT NULL,
  `created` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 80 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_backenduser_rel
-- ----------------------------
INSERT INTO `sys_role_backenduser_rel` VALUES (69, 22, 1, '2018-02-23 17:06:50');
INSERT INTO `sys_role_backenduser_rel` VALUES (72, 25, 5, '2018-03-15 17:57:17');
INSERT INTO `sys_role_backenduser_rel` VALUES (74, 25, 6, '2018-04-04 13:44:18');
INSERT INTO `sys_role_backenduser_rel` VALUES (76, 25, 7, '2018-04-13 11:44:43');
INSERT INTO `sys_role_backenduser_rel` VALUES (77, 25, 8, '2018-05-11 11:22:03');
INSERT INTO `sys_role_backenduser_rel` VALUES (78, 26, 4, '2018-05-27 17:49:19');
INSERT INTO `sys_role_backenduser_rel` VALUES (79, 25, 4, '2018-05-27 17:49:19');

-- ----------------------------
-- Table structure for sys_role_resource_rel
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_resource_rel`;
CREATE TABLE `sys_role_resource_rel`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `created` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1340 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_resource_rel
-- ----------------------------
INSERT INTO `sys_role_resource_rel` VALUES (448, 24, 8, '2017-12-19 06:40:16');
INSERT INTO `sys_role_resource_rel` VALUES (449, 24, 14, '2017-12-19 06:40:16');
INSERT INTO `sys_role_resource_rel` VALUES (450, 24, 23, '2017-12-19 06:40:16');
INSERT INTO `sys_role_resource_rel` VALUES (1199, 25, 75, '2018-05-27 17:45:12');
INSERT INTO `sys_role_resource_rel` VALUES (1200, 25, 35, '2018-05-27 17:45:12');
INSERT INTO `sys_role_resource_rel` VALUES (1201, 25, 76, '2018-05-27 17:45:12');
INSERT INTO `sys_role_resource_rel` VALUES (1202, 25, 21, '2018-05-27 17:45:12');
INSERT INTO `sys_role_resource_rel` VALUES (1203, 25, 77, '2018-05-27 17:45:12');
INSERT INTO `sys_role_resource_rel` VALUES (1204, 25, 78, '2018-05-27 17:45:12');
INSERT INTO `sys_role_resource_rel` VALUES (1205, 25, 81, '2018-05-27 17:45:12');
INSERT INTO `sys_role_resource_rel` VALUES (1206, 25, 41, '2018-05-27 17:45:12');
INSERT INTO `sys_role_resource_rel` VALUES (1207, 25, 44, '2018-05-27 17:45:12');
INSERT INTO `sys_role_resource_rel` VALUES (1208, 25, 45, '2018-05-27 17:45:12');
INSERT INTO `sys_role_resource_rel` VALUES (1209, 25, 22, '2018-05-27 17:45:12');
INSERT INTO `sys_role_resource_rel` VALUES (1210, 25, 40, '2018-05-27 17:45:12');
INSERT INTO `sys_role_resource_rel` VALUES (1211, 25, 36, '2018-05-27 17:45:12');
INSERT INTO `sys_role_resource_rel` VALUES (1212, 25, 37, '2018-05-27 17:45:12');
INSERT INTO `sys_role_resource_rel` VALUES (1213, 25, 39, '2018-05-27 17:45:12');
INSERT INTO `sys_role_resource_rel` VALUES (1214, 25, 38, '2018-05-27 17:45:12');
INSERT INTO `sys_role_resource_rel` VALUES (1215, 25, 47, '2018-05-27 17:45:12');
INSERT INTO `sys_role_resource_rel` VALUES (1216, 25, 46, '2018-05-27 17:45:12');
INSERT INTO `sys_role_resource_rel` VALUES (1217, 25, 69, '2018-05-27 17:45:12');
INSERT INTO `sys_role_resource_rel` VALUES (1218, 25, 70, '2018-05-27 17:45:12');
INSERT INTO `sys_role_resource_rel` VALUES (1219, 25, 71, '2018-05-27 17:45:12');
INSERT INTO `sys_role_resource_rel` VALUES (1245, 26, 75, '2018-06-22 17:44:31');
INSERT INTO `sys_role_resource_rel` VALUES (1246, 26, 35, '2018-06-22 17:44:31');
INSERT INTO `sys_role_resource_rel` VALUES (1247, 26, 76, '2018-06-22 17:44:31');
INSERT INTO `sys_role_resource_rel` VALUES (1248, 26, 21, '2018-06-22 17:44:31');
INSERT INTO `sys_role_resource_rel` VALUES (1249, 26, 77, '2018-06-22 17:44:31');
INSERT INTO `sys_role_resource_rel` VALUES (1250, 26, 78, '2018-06-22 17:44:31');
INSERT INTO `sys_role_resource_rel` VALUES (1251, 26, 79, '2018-06-22 17:44:31');
INSERT INTO `sys_role_resource_rel` VALUES (1252, 26, 81, '2018-06-22 17:44:31');
INSERT INTO `sys_role_resource_rel` VALUES (1253, 26, 82, '2018-06-22 17:44:31');
INSERT INTO `sys_role_resource_rel` VALUES (1254, 26, 41, '2018-06-22 17:44:31');
INSERT INTO `sys_role_resource_rel` VALUES (1255, 26, 44, '2018-06-22 17:44:31');
INSERT INTO `sys_role_resource_rel` VALUES (1256, 26, 45, '2018-06-22 17:44:31');
INSERT INTO `sys_role_resource_rel` VALUES (1257, 26, 36, '2018-06-22 17:44:31');
INSERT INTO `sys_role_resource_rel` VALUES (1258, 26, 22, '2018-06-22 17:44:31');
INSERT INTO `sys_role_resource_rel` VALUES (1259, 26, 42, '2018-06-22 17:44:31');
INSERT INTO `sys_role_resource_rel` VALUES (1260, 26, 40, '2018-06-22 17:44:31');
INSERT INTO `sys_role_resource_rel` VALUES (1261, 26, 60, '2018-06-22 17:44:31');
INSERT INTO `sys_role_resource_rel` VALUES (1262, 26, 37, '2018-06-22 17:44:31');
INSERT INTO `sys_role_resource_rel` VALUES (1263, 26, 39, '2018-06-22 17:44:31');
INSERT INTO `sys_role_resource_rel` VALUES (1264, 26, 38, '2018-06-22 17:44:31');
INSERT INTO `sys_role_resource_rel` VALUES (1265, 26, 47, '2018-06-22 17:44:31');
INSERT INTO `sys_role_resource_rel` VALUES (1266, 26, 46, '2018-06-22 17:44:31');
INSERT INTO `sys_role_resource_rel` VALUES (1267, 26, 69, '2018-06-22 17:44:31');
INSERT INTO `sys_role_resource_rel` VALUES (1268, 26, 70, '2018-06-22 17:44:31');
INSERT INTO `sys_role_resource_rel` VALUES (1269, 26, 71, '2018-06-22 17:44:31');
INSERT INTO `sys_role_resource_rel` VALUES (1270, 26, 87, '2018-06-22 17:44:31');
INSERT INTO `sys_role_resource_rel` VALUES (1271, 22, 75, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1272, 22, 35, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1273, 22, 76, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1274, 22, 21, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1275, 22, 77, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1276, 22, 78, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1277, 22, 79, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1278, 22, 80, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1279, 22, 81, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1280, 22, 82, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1281, 22, 83, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1282, 22, 41, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1283, 22, 44, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1284, 22, 48, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1285, 22, 49, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1286, 22, 45, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1287, 22, 50, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1288, 22, 51, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1289, 22, 36, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1290, 22, 52, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1291, 22, 53, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1292, 22, 22, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1293, 22, 42, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1294, 22, 43, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1295, 22, 40, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1296, 22, 60, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1297, 22, 61, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1298, 22, 37, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1299, 22, 54, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1300, 22, 55, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1301, 22, 39, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1302, 22, 58, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1303, 22, 59, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1304, 22, 38, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1305, 22, 56, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1306, 22, 57, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1307, 22, 47, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1308, 22, 65, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1309, 22, 64, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1310, 22, 46, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1311, 22, 62, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1312, 22, 63, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1313, 22, 69, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1314, 22, 70, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1315, 22, 71, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1316, 22, 87, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1317, 22, 8, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1318, 22, 7, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1319, 22, 9, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1320, 22, 25, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1321, 22, 27, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1322, 22, 12, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1323, 22, 30, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1324, 22, 31, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1325, 22, 32, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1326, 22, 13, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1327, 22, 26, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1328, 22, 29, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1329, 22, 72, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1330, 22, 73, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1331, 22, 74, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1332, 22, 14, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1333, 22, 84, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1334, 22, 85, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1335, 22, 86, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1336, 22, 66, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1337, 22, 67, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1338, 22, 68, '2018-06-22 17:44:59');
INSERT INTO `sys_role_resource_rel` VALUES (1339, 22, 23, '2018-06-22 17:44:59');

-- ----------------------------
-- Table structure for sys_val
-- ----------------------------
DROP TABLE IF EXISTS `sys_val`;
CREATE TABLE `sys_val`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '代码',
  `desc` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `value` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '变量',
  `uplimit` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上限',
  `step` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '步长',
  `tag` int(11) NULL DEFAULT 0 COMMENT '状态:0.正常1.删除',
  `createuser` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `createdate` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `changeuser` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `changedate` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_val
-- ----------------------------
INSERT INTO `sys_val` VALUES (1, 'customerno', '客户编号', '1014', '9999', '1', 0, 'root', '2018-05-24 17:20:35', '超级管理员', '2018-05-27 14:00:24');
INSERT INTO `sys_val` VALUES (2, 'dtuno', 'DTU编号', '900000000042', '999999999999', '1', 1, 'root', '2018-05-24 17:22:08', '超级管理员', '2018-05-27 15:33:08');
INSERT INTO `sys_val` VALUES (3, 'gatewayno', '通讯方式编号', '1002', '9999', '1', 0, 'root', '2018-05-24 17:25:53', 'root', '2018-05-24 17:25:53');
INSERT INTO `sys_val` VALUES (4, 'metertypeno', '电表类型编号', '1009', '9999', '1', 0, 'root', '2018-05-24 17:26:41', 'root', '2018-05-24 17:26:41');
INSERT INTO `sys_val` VALUES (5, 'vendorno', '设备供应商编号', '1005', '9999', '1', 0, 'root', '2018-05-24 17:28:00', 'root', '2018-05-24 17:28:00');

-- ----------------------------
-- View structure for v_customer_room_meter
-- ----------------------------
DROP VIEW IF EXISTS `v_customer_room_meter`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`%` SQL SECURITY DEFINER VIEW `v_customer_room_meter` AS select `a`.`dtu_no` AS `dtu_no`,`a`.`meter_address` AS `meter_address`,`a`.`meter_type_no` AS `meter_type_no`,`em`.`meter_type` AS `meter_type`,`a`.`gateway_no` AS `gateway_no`,`eg`.`gateway_desc` AS `gateway_desc`,`a`.`gateway_qzone` AS `gateway_qzone`,`a`.`gateway_address` AS `gateway_address`,`a`.`gateway_site` AS `gateway_site`,`a`.`loop_name` AS `loop_name`,`ed`.`room_no` AS `room_no`,`er`.`room_name` AS `room_name`,`er`.`customer_no` AS `customer_no`,`ec`.`customer_name` AS `customer_name`,`ec`.`customer_desc` AS `customer_desc`,`ec`.`zone` AS `zone`,`ec`.`longitude` AS `longitude`,`ec`.`latitude` AS `latitude`,ifnull(`a`.`tag`,0) AS `meter_config_tag`,ifnull(`em`.`tag`,0) AS `meter_type_tag`,ifnull(`eg`.`tag`,0) AS `gateway_tag`,ifnull(`ed`.`tag`,0) AS `dtu_config_tag`,ifnull(`er`.`tag`,0) AS `room_tag`,ifnull(`ec`.`tag`,0) AS `customer_tag` from (((((`equipment_meter_config` `a` left join `equipment_meter_type` `em` on((`a`.`meter_type_no` = `em`.`meter_type_no`))) left join `equipment_gateway` `eg` on((`a`.`gateway_no` = `eg`.`gateway_no`))) left join `equipment_dtu_config` `ed` on((`a`.`dtu_no` = `ed`.`dtu_no`))) left join `equipment_room` `er` on((`ed`.`room_no` = `er`.`room_no`))) left join `equipment_customer` `ec` on((`er`.`customer_no` = `ec`.`customer_no`))) order by `er`.`customer_no`,`ed`.`room_no`,`a`.`dtu_no`,`a`.`meter_address` ;

-- ----------------------------
-- View structure for v_dtu_config
-- ----------------------------
DROP VIEW IF EXISTS `v_dtu_config`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`%` SQL SECURITY DEFINER VIEW `v_dtu_config` AS select `equipment_dtu_config`.`id` AS `id`,`equipment_dtu_config`.`dtu_no` AS `dtu_no`,`equipment_dtu_config`.`time_interval` AS `time_interval`,`equipment_dtu_config`.`rowver` AS `rowver` from `equipment_dtu_config` where (`equipment_dtu_config`.`tag` = 0) ;

-- ----------------------------
-- View structure for v_func_tools
-- ----------------------------
DROP VIEW IF EXISTS `v_func_tools`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`%` SQL SECURITY DEFINER VIEW `v_func_tools` AS select `equipment_meter_rom_config`.`meter_type_no` AS `meter_type_no`,`equipment_meter_rom_config`.`address_sort` AS `address_sort`,`equipment_meter_rom_config`.`rom_address` AS `rom_address`,`equipment_meter_rom_config`.`rom_name` AS `rom_name`,`equipment_meter_rom_config`.`units` AS `units`,`equipment_meter_rom_config`.`data_type` AS `data_type`,cast(0 as decimal(10,6)) AS `data_value`,`equipment_meter_rom_config`.`calcfactor` AS `calcfactor`,`equipment_meter_rom_config`.`byte_length` AS `byte_length`,`equipment_meter_rom_config`.`need_pt` AS `need_pt`,`equipment_meter_rom_config`.`need_ct` AS `need_ct`,`equipment_meter_rom_config`.`segment_no` AS `segment_no`,`equipment_meter_rom_config`.`offset` AS `OFFSET`,`equipment_meter_rom_config`.`function_table1` AS `function_table1`,`equipment_meter_rom_config`.`function_table2` AS `function_table2`,`equipment_meter_rom_config`.`function_table3` AS `function_table3`,`equipment_meter_rom_config`.`function_field` AS `function_field` from `equipment_meter_rom_config` where (`equipment_meter_rom_config`.`tag` = 0) ;

-- ----------------------------
-- View structure for v_meter_addr_config
-- ----------------------------
DROP VIEW IF EXISTS `v_meter_addr_config`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`%` SQL SECURITY DEFINER VIEW `v_meter_addr_config` AS SELECT
	`equipment_meter_addr_config`.`id` AS `id`,
	`equipment_meter_addr_config`.`meter_type_no` AS `meter_type_no`,
	`equipment_meter_addr_config`.`segment_start_addr` AS `segment_start_addr`,
	`equipment_meter_addr_config`.`segment_len` AS `segment_len`,
	`equipment_meter_addr_config`.`segment_no` AS `segment_no`,
	`equipment_meter_addr_config`.`rowver` AS `rowver` 
FROM
	`equipment_meter_addr_config` 
WHERE
	( `equipment_meter_addr_config`.`tag` = 0 )
	ORDER BY `equipment_meter_addr_config`.`meter_type_no`, `equipment_meter_addr_config`.`segment_no` ;

-- ----------------------------
-- View structure for v_meter_config
-- ----------------------------
DROP VIEW IF EXISTS `v_meter_config`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`%` SQL SECURITY DEFINER VIEW `v_meter_config` AS SELECT
	`equipment_meter_config`.`id` AS `id`,
	`equipment_meter_config`.`dtu_no` AS `dtu_no`,
	`equipment_meter_config`.`meter_address` AS `meter_address`,
	`equipment_meter_config`.`meter_type_no` AS `meter_type_no`,
	`equipment_meter_config`.`gateway_no` AS `gateway_no`,
	`equipment_meter_config`.`gateway_qzone` AS `gateway_qzone`,
	`equipment_meter_config`.`gateway_address` AS `gateway_address`,
	`equipment_meter_config`.`gateway_site` AS `gateway_site`,
	`equipment_meter_config`.`pt` AS `pt`,
	`equipment_meter_config`.`ct` AS `ct`,
	`equipment_meter_config`.`rowver` AS `rowver` 
FROM
	`equipment_meter_config` 
WHERE
	( `equipment_meter_config`.`tag` = 0 ) ;

-- ----------------------------
-- View structure for v_meter_config_field
-- ----------------------------
DROP VIEW IF EXISTS `v_meter_config_field`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`%` SQL SECURITY DEFINER VIEW `v_meter_config_field` AS SELECT
   
	`equipment_meter_config_field`.`id` AS `id`,
	`equipment_meter_config_field`.`dtu_no` AS `dtu_no`,
	`equipment_meter_config_field`.`meter_address` AS `meter_address`,
	
	`equipment_meter_config_field`.`ds_addr` AS `ds_addr`,	
	`equipment_meter_config_field`.`field_name` AS `field_name`,	
	
	`equipment_meter_config_field`.`rowver` AS `rowver` 
FROM equipment_meter_config_field

WHERE
	( `equipment_meter_config_field`.`tag` = 0 ) ;

-- ----------------------------
-- View structure for v_meter_config_field_table
-- ----------------------------
DROP VIEW IF EXISTS `v_meter_config_field_table`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`%` SQL SECURITY DEFINER VIEW `v_meter_config_field_table` AS SELECT
	`em`.`id` AS `id`,
	`em`.`dtu_no` AS `dtu_no`,
	`em`.`meter_address` AS `meter_address`,
	`em`.`ds_addr` AS `ds_addr`,
	`em`.`field_name` AS `field_name`,
	et.function_table1,
	et.function_table2,
	et.function_table3,	
	`em`.`rowver` AS `rowver` 
FROM
	equipment_meter_config_field as em 
	left JOIN equipment_table_config as et on em.field_name = et.field_name
WHERE
	( `em`.`tag` = 0 ) ;

-- ----------------------------
-- View structure for v_meter_rom_config
-- ----------------------------
DROP VIEW IF EXISTS `v_meter_rom_config`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`%` SQL SECURITY DEFINER VIEW `v_meter_rom_config` AS select `equipment_meter_rom_config`.`id` AS `id`,`equipment_meter_rom_config`.`meter_type_no` AS `meter_type_no`,`equipment_meter_rom_config`.`address_sort` AS `address_sort`,`equipment_meter_rom_config`.`rom_address` AS `rom_address`,`equipment_meter_rom_config`.`data_type` AS `data_type`,`equipment_meter_rom_config`.`segment_no` AS `segment_no`,`equipment_meter_rom_config`.`offset` AS `OFFSET`,`equipment_meter_rom_config`.`need_pt` AS `need_pt`,`equipment_meter_rom_config`.`need_ct` AS `need_ct`,`equipment_meter_rom_config`.`calcfactor` AS `calcfactor`,`equipment_meter_rom_config`.`byte_length` AS `byte_length`,`equipment_meter_rom_config`.`function_table1` AS `function_table1`,`equipment_meter_rom_config`.`function_table2` AS `function_table2`,`equipment_meter_rom_config`.`function_table3` AS `function_table3`,`equipment_meter_rom_config`.`function_field` AS `function_field`,`equipment_meter_rom_config`.`msb_bit` AS `msb_bit`,`equipment_meter_rom_config`.`rowver` AS `rowver` from `equipment_meter_rom_config` where (`equipment_meter_rom_config`.`tag` = 0) order by `equipment_meter_rom_config`.`meter_type_no`,`equipment_meter_rom_config`.`address_sort` ;

-- ----------------------------
-- View structure for v_meter_type
-- ----------------------------
DROP VIEW IF EXISTS `v_meter_type`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`%` SQL SECURITY DEFINER VIEW `v_meter_type` AS SELECT
	`equipment_meter_type`.`id` AS `id`,
	`equipment_meter_type`.`meter_type_no` AS `meter_type_no`,
	meter_type,
	`equipment_meter_type`.`pt_address` AS `pt_address`,
	`equipment_meter_type`.`ct_address` AS `ct_address`,
	`equipment_meter_type`.`three_phase` AS `three_phase`,
	`equipment_meter_type`.`rowver` AS `rowver` 
FROM
	`equipment_meter_type` 
WHERE
	( `equipment_meter_type`.`tag` = 0 ) ;

-- ----------------------------
-- View structure for v_sys_backend_conf
-- ----------------------------
DROP VIEW IF EXISTS `v_sys_backend_conf`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`%` SQL SECURITY DEFINER VIEW `v_sys_backend_conf` AS SELECT
	id,
	appname,
	appversion,
	deploy,
	configtext 
FROM
	sys_backend_conf
WHERE
	tag = 0 ;

-- ----------------------------
-- View structure for v_table_config
-- ----------------------------
DROP VIEW IF EXISTS `v_table_config`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`%` SQL SECURITY DEFINER VIEW `v_table_config` AS SELECT
	`equipment_table_config`.`id` AS `id`,
	`equipment_table_config`.`field_name` AS `field_name`,
	`equipment_table_config`.`field_desc` AS `field_desc`,
	`equipment_table_config`.`function_table1` AS `function_table1`,
	`equipment_table_config`.`function_table2` AS `function_table2`,
	`equipment_table_config`.`function_table3` AS `function_table3`,
	`equipment_table_config`.`rowver` AS `rowver` 
FROM
	`equipment_table_config` 
WHERE
	( `equipment_table_config`.`tag` = 0 ) ;

-- ----------------------------
-- Procedure structure for p_add_partitions
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_add_partitions`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_add_partitions`(IN _schemas VARCHAR (128),IN _tables VARCHAR (128), IN _add_date VARCHAR (128))
BEGIN
	/**
		call p_add_partitions('kxtimingdata', 'collect_base_info', '2017-07-01')
	**/

	select count(1) into @exists_partitions 
		from information_schema.partitions  
	 where table_schema=_schemas  
		 and table_name=_tables  
		 and PARTITION_NAME = concat('p', replace(_add_date,'-',''));

	if @exists_partitions = 0  and _tables in ('collect_base_info', 'collect_attach_info','collect_other_info') then
		set @schemas := _schemas, 
				@tables := _tables, 
				@dates := str_to_date(_add_date,'%Y-%m-%d'); 
		set @partitions := concat('p', replace(@dates,'-', ''));

		set @c1 := "alter table",
				@c2 := concat(@schemas, ".", @tables),
				@c3 := "add partition",
				@c4 := concat("(", "partition"),
				@c5 := @partitions,
				@c6 := concat("values in (to_days('", @dates,"')))");

		set @add_partitions := concat_ws(" ", @c1, @c2, @c3, @c4, @c5, @c6);

		prepare stmt from @add_partitions;
		execute stmt;
		deallocate prepare stmt;
	else
		select concat(_schemas,'.',_tables,' partitions p',replace(_add_date,'-',''),' ','exists!!') as war;
	end if;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for p_add_partitions_month
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_add_partitions_month`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_add_partitions_month`( IN _schemas VARCHAR ( 128 ), IN _tables VARCHAR ( 128 ), IN _dates VARCHAR ( 128 ) )
BEGIN

/*
call gdkxdl.p_add_partitions_month('kxtimingdata','collect_alarm_info', '2017-10-01');
*/

-- DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SELECT 'warring';

	SET @schemas:=_schemas,
			@tables:=_tables,
			@dates:= date_add(last_day(date_sub(str_to_date(last_day(str_to_date(_dates, '%Y-%m')),'%Y-%m-%d'),INTERVAL 1 MONTH)),INTERVAL 1 DAY);
	SET	@nextDates := DATE_ADD(@dates, INTERVAL 1 MONTH);
					
	IF dayofmonth( @dates ) = 1 THEN	
	  SET @partitions := concat('p', replace(@dates,'-',''));		
		
		SELECT count(1) INTO @exists_partitions FROM information_schema.partitions  
		 WHERE table_schema = _schemas  
			 AND table_name = _tables  
			 AND PARTITION_NAME = @partitions;
					
		IF @exists_partitions = 0 THEN
					SET @rn := 0;		
					SET @subpartition := NULL;						
					WHILE	@rn < 20 DO				
						SET @partition_date = REPLACE(@dates, '-', '');			
						SET @rn := @rn + 1;			
						SET @tempsubp := concat( 'subpartition s', @partition_date, '_', @rn, " engine=innodb" );			
						SET @subpartition := concat_ws(',', @subpartition, @tempsubp );			
					END WHILE;
					
					SET @c1 := "alter table",
						  @c2 := concat( @SCHEMAS, ".", @TABLES ),
						  @c3 := "add partition",
						  @c4 := concat( "(", "partition" ),
						  @c5 := @partitions,
						  @c6 := concat( "values LESS THAN (to_days('", @nextDates, "'))" ),
						  @c7 := "(",
						  @c8 := @subpartition,
						  @c9 := "))";						
								
					SET @sqlText = concat_ws(" ",	@c1, @c2, @c3, @c4, @c5, @c6, @c7, @c8, @c9);		
					
					-- SELECT @sqlText;
		      PREPARE stmt FROM @sqlText;	
			    EXECUTE stmt;	
					DEALLOCATE PREPARE stmt;	
			ELSE		    
		    select concat(_schemas,'.',_tables,' partitions ', @partitions, ' exists!!') as war;						
			END IF;			
	END IF;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for p_add_view
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_add_view`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `p_add_view`(_view_name VARCHAR(128))
BEGIN
  /**
   * call p_add_view("collect_base_info_2017_07_01")
  */
	SELECT count(1) INTO @_exists	FROM information_schema.TABLES WHERE table_name = _view_name;

	IF @_exists = 0 THEN
		SET @view_name := _view_name, @dates := REPLACE(substring_index(@view_name, '_', -3), '_',	'-');

		IF _view_name like 'collect_base_info_%' THEN			
			SET @sqlText := CONCAT("create or replace view kxtimingdata.", @view_name,
														 " AS ( select * from kxtimingdata.collect_base_info where collect_time >= str_to_date('", 
														 @dates, 
														 "','%Y-%m-%d') and collect_time < date_add(str_to_date('",
														 @dates, "','%Y-%m-%d'), interval 1 day))"
														 );

		ELSEIF _view_name like 'collect_attach_info_%' THEN		
			SET @sqlText := CONCAT("create or replace view kxtimingdata.",	@view_name, 
														 " AS ( select * from kxtimingdata.collect_attach_info where collect_time >= str_to_date('" ,
														 @dates,
														 "','%Y-%m-%d') and collect_time < date_add(str_to_date('",
														 @dates, 
														 "','%Y-%m-%d'), interval 1 day))"
														 );

		ELSEIF _view_name like 'collect_other_info_%' THEN
			SET @sqlText := CONCAT("create or replace view kxtimingdata.",	@view_name, 
														 " AS ( select * from kxtimingdata.collect_other_info where collect_time >= str_to_date('" ,
														 @dates,
														 "','%Y-%m-%d') and collect_time < date_add(str_to_date('",
														 @dates, 
														 "','%Y-%m-%d'), interval 1 day))"
														 );		
	  ELSEIF _view_name like 'collect_alarm_info_%' THEN
			SET @sqlText := CONCAT("create or replace view kxtimingdata.",	@view_name, 
														 " AS ( select * from kxtimingdata.collect_alarm_info where collect_time >= str_to_date('" ,
														 @dates,
														 "','%Y-%m-%d') and collect_time < date_add(str_to_date('",
														 @dates, 
														 "','%Y-%m-%d'), interval 1 day))"
														 );		
		END IF;

		PREPARE stmt FROM	@sqlText;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;

	END IF;


END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for p_dtu_age
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_dtu_age`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `p_dtu_age`()
BEGIN
  /*
	 * 统计每个DTU的年龄
	 *      by yunnet 
	 *      2018-03-23
	 * 使用方法：
	 * call p_dtu_age();
	 */	
  create temporary table dtu_age_temp(
	    id INT not null AUTO_INCREMENT,
			dtu_no varchar(20) NOT NULL,  			
	    meter_address int(11) NOT NULL,
			begin_time datetime null,
			end_time datetime null,
			PRIMARY KEY (id) 
		)ENGINE = MEMORY;
		
		INSERT into dtu_age_temp(dtu_no, meter_address)
		SELECT dtu_no, meter_address from equipment_meter_config where tag = 0 ORDER BY dtu_no, meter_address;
		
		
		set @i := 0;
		set @num = (select count(1) FROM dtu_age_temp);
		
		WHILE @i<= @num DO
			SELECT dtu_no, meter_address into @dtu_no, @meter_address FROM dtu_age_temp where id = @i + 1;
			
			update dtu_age_temp 
			   set begin_time = (
			SELECT collect_time AS begin_time 
				FROM kxtimingdata.collect_base_info 
				WHERE dtu_no = @dtu_no
					AND meter_address = @meter_address
					limit 1
					)
			where dtu_no = @dtu_no
				and meter_address = @meter_address;				
				
			update dtu_age_temp 
			   set end_time = (
			SELECT collect_time AS end_time 
				FROM kxtimingdata.collect_base_info 
				WHERE dtu_no = @dtu_no
					AND meter_address = @meter_address
				ORDER BY collect_time DESC
					limit 1
					)
			where dtu_no = @dtu_no
				and meter_address = @meter_address;
								
			Set @i = @i + 1;
		END WHILE;
		
		
		SELECT * FROM dtu_age_temp;
		drop table dtu_age_temp;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for p_equipment_room_no
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_equipment_room_no`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `p_equipment_room_no`(IN _customer_no VARCHAR (20))
    COMMENT '按客户编号获取电房编号'
BEGIN
	/*
	 * 按客户编号获取电房编号
	 *      by yunnet 
	 *      2018-05-26
	 * 使用方法：
	 * call p_equipment_room_no('1004');
	 */
	IF exists(SELECT 1 FROM equipment_room where customer_no = _customer_no) THEN
		SELECT SUBSTRING(room_no, 5, 4) into @roomno FROM equipment_room where customer_no = _customer_no ORDER BY room_no Desc LIMIT 1;
		SET @roomno = @roomno + 1 + 10000;
		select concat(_customer_no, SUBSTRING(CONCAT(@roomno,''), 2, 4)) as room_no;
	ELSE
	  select concat(_customer_no, '0001') as room_no;
	END IF;  
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for p_sysval_no
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_sysval_no`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `p_sysval_no`(IN _code VARCHAR (20))
    COMMENT '按系统设备获取相应的编号'
BEGIN
	/*
	 * 按系统设备获取相应的编号
	 *      by yunnet 
	 *      2018-05-27
	 * 使用方法：
	 *  customerno
	 *  dtuno
	 *  gatewayno
	 *  metertypeno
	 *  vendorno
	 * call p_sysval_no('customerno');
	 */
	 	 
	DECLARE t_error INTEGER DEFAULT 0;
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET t_error = 1;    
	 
	IF exists(SELECT 1 FROM sys_val WHERE `code` = _code and tag = 0) THEN
		START TRANSACTION;
			SELECT value, uplimit, step into @value1, @uplimit1, @step1 FROM sys_val WHERE `code`= _code LIMIT 1;
			SET @value1 = @value1 + 0, @uplimit1 = @uplimit1 + 0, @step1 = @step1 + 0;
			
			IF (@value1 + @step1) > @uplimit1 THEN
				SET @value1 = 1;
			ELSE
				SET @value1 = @value1 + @step1;
			END IF;
			
			SET @result = @value1 + 10000;
			SET @value2 = SUBSTRING(CONCAT(@result,''), 2, 4);
			
			update sys_val 
			   set value = @value2 
			 WHERE `code` = _code;
			 
			SELECT @value2 as code;
			 
		IF t_error = 1 THEN
			ROLLBACK;
		ELSE
			COMMIT;
		END IF;
		
	ELSE
	  SELECT '1000' as code;
	END IF;  
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
