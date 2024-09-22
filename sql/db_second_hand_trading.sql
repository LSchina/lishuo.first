/*
 Navicat Premium Data Transfer

 Source Server         : ds
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : db_second_hand_trading

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 22/09/2024 13:59:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sh_address
-- ----------------------------
DROP TABLE IF EXISTS `sh_address`;
CREATE TABLE `sh_address`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `consignee_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人姓名',
  `consignee_phone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人手机号',
  `province_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '省',
  `city_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '市',
  `region_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区',
  `detail_address` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详细地址',
  `default_flag` tinyint NOT NULL COMMENT '是否默认地址',
  `user_id` bigint NOT NULL COMMENT '用户主键id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id_index`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sh_address
-- ----------------------------
INSERT INTO `sh_address` VALUES (1, 'user9', '13011110009', '江苏省', '南通市', '崇川区', '花园一单元一号楼', 1, 10);
INSERT INTO `sh_address` VALUES (2, 'user8', '13011110008', '江苏省', '南通市', '崇川区', '888', 1, 9);
INSERT INTO `sh_address` VALUES (27, 'MZ', '13011110000', '河南省', '新乡市', '原阳县', '测试测试', 1, 1);
INSERT INTO `sh_address` VALUES (28, '马小der', '15515935057', '河南省', '郑州市', '中原区', '中原中路41号中原工学院', 1, 2);
INSERT INTO `sh_address` VALUES (29, '下雨', '1788888888', '河南省', '郑州市', '中原区', '中原工学院', 1, 4);

-- ----------------------------
-- Table structure for sh_admin
-- ----------------------------
DROP TABLE IF EXISTS `sh_admin`;
CREATE TABLE `sh_admin`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `account_number` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员账号',
  `admin_password` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `admin_name` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员名字',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `account_number`(`account_number`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sh_admin
-- ----------------------------
INSERT INTO `sh_admin` VALUES (1, 'admin', '123456', '超级管理员');
INSERT INTO `sh_admin` VALUES (2, 'yang', '123', '管理员1');
INSERT INTO `sh_admin` VALUES (3, 'li', '123', '管理员2');
INSERT INTO `sh_admin` VALUES (11, 'zhang', '123', '管理员3');
INSERT INTO `sh_admin` VALUES (12, 'lishuo', '123', '管理员4');

-- ----------------------------
-- Table structure for sh_carousel
-- ----------------------------
DROP TABLE IF EXISTS `sh_carousel`;
CREATE TABLE `sh_carousel`  (
  `id` int NULL DEFAULT NULL,
  `url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `value` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `type` int NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sh_carousel
-- ----------------------------
INSERT INTO `sh_carousel` VALUES (1, 'https://www.iconfont.cn/', 'https://img.picui.cn/free/2024/07/01/66825fe4cdf3c.jpg', '2024-09-18 22:25:25', 1);
INSERT INTO `sh_carousel` VALUES (2, 'https://www.iconfont.cn/', 'https://img.picui.cn/free/2024/07/01/66825fc373fe3.jpg', '2024-09-18 22:31:34', 1);
INSERT INTO `sh_carousel` VALUES (3, 'https://picui.cn/', 'http://localhost:8081/image?imageName=file17268261042671002book1.jpg', '2024-09-20 09:55:05', 1);
INSERT INTO `sh_carousel` VALUES (4, 'https://picui.cn/', 'http://localhost:8081/image?imageName=file1726933916829100322.jpg', '2024-09-21 15:51:58', 2);
INSERT INTO `sh_carousel` VALUES (5, 'https://www.iconfont.cn/', 'https://bpic.588ku.com/back_origin_min_pic/19/10/22/beab832e6434f11169b13067073f806f.jpg', '2024-09-18 22:31:34', 2);
INSERT INTO `sh_carousel` VALUES (6, 'https://www.iconfont.cn/', 'https://img.picui.cn/free/2024/07/01/66825fe4cdf3c.jpg', '2024-09-18 22:31:34', 2);

-- ----------------------------
-- Table structure for sh_favorite
-- ----------------------------
DROP TABLE IF EXISTS `sh_favorite`;
CREATE TABLE `sh_favorite`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键id',
  `create_time` datetime NOT NULL COMMENT '加入收藏的时间',
  `user_id` bigint NOT NULL COMMENT '用户主键id',
  `idle_id` bigint NOT NULL COMMENT '闲置物主键id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`, `idle_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sh_favorite
-- ----------------------------
INSERT INTO `sh_favorite` VALUES (42, '2024-09-02 07:21:59', 9, 80);
INSERT INTO `sh_favorite` VALUES (43, '2024-10-22 22:20:08', 4, 90);
INSERT INTO `sh_favorite` VALUES (44, '2024-10-08 10:23:09', 3, 93);
INSERT INTO `sh_favorite` VALUES (45, '2024-10-08 17:56:57', 3, 98);
INSERT INTO `sh_favorite` VALUES (46, '2024-10-08 17:58:11', 3, 97);

-- ----------------------------
-- Table structure for sh_idle_item
-- ----------------------------
DROP TABLE IF EXISTS `sh_idle_item`;
CREATE TABLE `sh_idle_item`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `idle_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '闲置物名称',
  `idle_details` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详情',
  `picture_list` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图集',
  `idle_price` decimal(10, 2) NOT NULL COMMENT '价格',
  `idle_place` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发货地区',
  `idle_label` int NOT NULL COMMENT '分类标签',
  `release_time` datetime NOT NULL COMMENT '发布时间',
  `idle_status` tinyint NOT NULL COMMENT '状态（发布1、下架2、删除0）',
  `user_id` bigint NOT NULL COMMENT '用户主键id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id_index`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 114 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sh_idle_item
-- ----------------------------
INSERT INTO `sh_idle_item` VALUES (1, '111', '111', '[\"http://localhost:8081/image?imageName=file16866307653031002壁纸.jpg\"]', 20.01, '市辖区', 1, '2024-09-18 03:03:20', 0, 1);
INSERT INTO `sh_idle_item` VALUES (2, '运动鞋', '跑步非常舒服 回弹性好', '[\"http://localhost:8081/image?imageName=file16868385096121002运动鞋.jpg\"]', 100.00, '市辖区', 3, '2024-09-18 03:03:20', 1, 1);
INSERT INTO `sh_idle_item` VALUES (3, '电风扇', '贼凉快', '[\"http://localhost:8081/image?imageName=file16868385807991003风扇.jpg\"]', 120.00, '唐山市', 2, '2024-09-18 03:03:20', 2, 1);
INSERT INTO `sh_idle_item` VALUES (4, '加湿器', '干燥空气瞬间变湿', '[\"http://localhost:8081/image?imageName=file16868386408251004file16513152624181010加湿器.jpg\"]', 50.00, '阳泉市', 1, '2024-09-18 03:03:20', 1, 1);
INSERT INTO `sh_idle_item` VALUES (5, '考研单词书', '考研背单词必备', '[\"http://localhost:8081/image?imageName=file16868387852141005file16527758200311002考研单词书.jpg\"]', 10.00, '市辖区', 4, '2024-09-18 03:03:20', 2, 1);
INSERT INTO `sh_idle_item` VALUES (105, '袜子', '没穿过。', '[\"http://localhost:8081/image?imageName=file17023382374621002企业微信截图_20231212074317.png\"]', 19.99, '秦皇岛市', 5, '2024-09-18 03:03:20', 1, 1);
INSERT INTO `sh_idle_item` VALUES (106, '鞋子', '我的头发是真发，哈哈哈哈哈', '[]', 180.00, '郑州市', 5, '2024-09-18 03:03:20', 1, 2);
INSERT INTO `sh_idle_item` VALUES (107, '电脑', '嘎嘎嘎哇塞，二手电脑，你值得拥有', '[\"http://localhost:8081/image?imageName=file17266301393311002computer.jpg\"]', 180.00, '市辖区', 1, '2024-09-18 03:29:01', 1, 2);
INSERT INTO `sh_idle_item` VALUES (108, '王路飞', '我是要成为海贼王的男人', '[\"http://localhost:8081/image?imageName=file17266338429491004课.png\"]', 1000.00, '郑州市', 4, '2024-09-18 04:30:44', 1, 2);
INSERT INTO `sh_idle_item` VALUES (109, '外国古典书', '非常哇塞，大家可以买一个试试看，保证满意', '[\"http://localhost:8081/image?imageName=file17266339570851005book1.jpg\"]', 25.00, '郑州市', 4, '2024-09-18 04:33:24', 1, 3);
INSERT INTO `sh_idle_item` VALUES (110, 'Eureka', '微服务相关组件，虽然是已经过时的注册中心，哈哈哈哈', '[\"http://localhost:8081/image?imageName=file17266342017811008eureka.jpg\"]', 25.00, '市辖区', 4, '2024-09-18 04:36:43', 1, 3);
INSERT INTO `sh_idle_item` VALUES (111, '择物商城项目源码', '你猜老哥我是谁，哈哈哈哈，慎重哦', '[\"http://localhost:8081/image?imageName=file17266343091101010teacher03.jpg\"]', 55.00, '青岛市', 5, '2024-09-18 04:38:30', 1, 4);
INSERT INTO `sh_idle_item` VALUES (112, '雷猴', '外国人你好的翻译词，真不知道第一个到中国的外国人，到底是怎样进行交流的，咦~~', '[\"http://localhost:8081/image?imageName=file17266344339811011banner1.jpg\"]', 10.00, '郑州市', 3, '2024-09-18 04:40:36', 2, 4);
INSERT INTO `sh_idle_item` VALUES (113, '技能全套，快来看看一看啊', '各种技术详解，奥里给，加油', '[\"http://localhost:8081/image?imageName=file17266409927961012json_xml.jpg\",\"http://localhost:8081/image?imageName=file17266409992461013JSR303校验.jpg\",\"http://localhost:8081/image?imageName=file17266410093681014JWT.png\"]', 188.00, '郑州市', 4, '2024-09-18 06:30:10', 1, 2);

-- ----------------------------
-- Table structure for sh_message
-- ----------------------------
DROP TABLE IF EXISTS `sh_message`;
CREATE TABLE `sh_message`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_id` bigint NOT NULL COMMENT '用户主键id',
  `idle_id` bigint NOT NULL COMMENT '闲置主键id',
  `content` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '留言内容',
  `create_time` datetime NOT NULL COMMENT '留言时间',
  `to_user` bigint NOT NULL COMMENT '所回复的用户',
  `to_message` bigint NULL DEFAULT NULL COMMENT '所回复的留言',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id_index`(`user_id`) USING BTREE,
  INDEX `idle_id_index`(`idle_id`) USING BTREE,
  INDEX `to_user_index`(`to_user`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sh_message
-- ----------------------------
INSERT INTO `sh_message` VALUES (50, 2, 107, '不错，味道好极了！！！', '2024-09-18 03:33:04', 2, NULL);
INSERT INTO `sh_message` VALUES (51, 4, 112, '132465132', '2024-09-18 04:41:04', 4, NULL);
INSERT INTO `sh_message` VALUES (53, 2, 107, '1236', '2024-09-18 08:32:06', 2, 50);
INSERT INTO `sh_message` VALUES (54, 2, 112, '666，您可真会说', '2024-09-18 08:32:56', 4, 52);
INSERT INTO `sh_message` VALUES (55, 2, 4, '你好', '2024-09-18 13:29:07', 1, NULL);
INSERT INTO `sh_message` VALUES (56, 2, 4, '你问你好干什么', '2024-09-18 13:29:24', 2, 55);
INSERT INTO `sh_message` VALUES (57, 2, 4, '怎么了', '2024-09-18 13:29:35', 2, 56);
INSERT INTO `sh_message` VALUES (58, 2, 4, '哈哈哈哈哈哈', '2024-09-18 13:29:45', 2, 57);
INSERT INTO `sh_message` VALUES (59, 4, 113, '不错，加油', '2024-09-18 13:31:26', 2, NULL);

-- ----------------------------
-- Table structure for sh_order
-- ----------------------------
DROP TABLE IF EXISTS `sh_order`;
CREATE TABLE `sh_order`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `order_number` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单编号',
  `user_id` bigint NOT NULL COMMENT '用户主键id',
  `idle_id` bigint NOT NULL COMMENT '闲置物品主键id',
  `order_price` decimal(10, 2) NOT NULL COMMENT '订单总价',
  `payment_status` tinyint NOT NULL COMMENT '支付状态',
  `payment_way` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付方式',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `payment_time` datetime NULL DEFAULT NULL COMMENT '支付时间',
  `order_status` tinyint NOT NULL COMMENT '订单状态',
  `is_deleted` tinyint NULL DEFAULT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 96 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sh_order
-- ----------------------------
INSERT INTO `sh_order` VALUES (65, '166644845940310002', 2, 89, 52.00, 0, NULL, '2024-10-22 22:20:59', NULL, 4, NULL);
INSERT INTO `sh_order` VALUES (66, '166644847386610003', 2, 90, 100.00, 0, NULL, '2024-10-22 22:21:13', NULL, 4, NULL);
INSERT INTO `sh_order` VALUES (73, '167316390306810008', 2, 91, 20.00, 0, NULL, '2024-10-22 15:45:03', NULL, 4, NULL);
INSERT INTO `sh_order` VALUES (74, '167316390677010009', 2, 90, 100.00, 0, NULL, '2024-10-22 15:45:06', NULL, 4, NULL);
INSERT INTO `sh_order` VALUES (75, '167316391048610010', 2, 87, 52.00, 0, NULL, '2024-10-22 15:45:10', NULL, 4, NULL);
INSERT INTO `sh_order` VALUES (76, '167317079822610011', 2, 91, 20.00, 0, NULL, '2024-10-22 17:39:58', NULL, 0, NULL);
INSERT INTO `sh_order` VALUES (77, '167317080313310012', 2, 90, 100.00, 0, NULL, '2024-10-22 17:40:03', NULL, 0, NULL);
INSERT INTO `sh_order` VALUES (78, '167317080721110013', 2, 87, 52.00, 0, NULL, '2024-10-22 17:40:07', NULL, 0, NULL);
INSERT INTO `sh_order` VALUES (79, '167317197510610014', 3, 98, 30.00, 1, '支付宝', '2024-10-22 17:59:35', '2023-01-08 17:59:39', 2, NULL);
INSERT INTO `sh_order` VALUES (80, '169868139833810002', 2, 3, 120.00, 0, NULL, '2024-10-22 15:56:38', NULL, 4, NULL);
INSERT INTO `sh_order` VALUES (81, '169868142096810003', 2, 5, 10.00, 0, NULL, '2024-10-22 15:57:01', NULL, 4, NULL);
INSERT INTO `sh_order` VALUES (82, '169868167883610004', 2, 5, 10.00, 0, NULL, '2024-10-22 16:01:19', NULL, 4, NULL);
INSERT INTO `sh_order` VALUES (83, '169868176136110005', 2, 5, 10.00, 1, '支付宝', '2024-10-22 16:02:41', '2023-10-30 16:03:06', 1, NULL);
INSERT INTO `sh_order` VALUES (84, '170233774650610002', 7, 3, 120.00, 0, NULL, '2024-10-22 23:35:47', NULL, 0, NULL);
INSERT INTO `sh_order` VALUES (85, '170233778849310003', 4, 5, 10.00, 1, '支付宝', '2024-10-22 23:36:28', '2023-12-11 23:37:07', 3, NULL);
INSERT INTO `sh_order` VALUES (86, '172662735321010002', 2, 105, 19.99, 0, NULL, '2024-09-18 02:42:33', NULL, 4, NULL);
INSERT INTO `sh_order` VALUES (87, '172662764885510003', 2, 105, 19.99, 0, NULL, '2024-09-18 02:47:29', NULL, 4, NULL);
INSERT INTO `sh_order` VALUES (88, '172663448178310004', 4, 107, 180.00, 1, '支付宝', '2024-09-18 04:41:22', '2024-09-18 04:41:25', 2, NULL);
INSERT INTO `sh_order` VALUES (89, '172663803201410005', 2, 112, 10.00, 0, NULL, '2024-09-18 05:40:32', NULL, 4, NULL);
INSERT INTO `sh_order` VALUES (90, '172663807394910006', 2, 112, 10.00, 0, NULL, '2024-09-18 05:41:14', NULL, 4, NULL);
INSERT INTO `sh_order` VALUES (91, '172666619777910002', 2, 4, 50.00, 0, NULL, '2024-09-18 13:29:58', NULL, 4, NULL);
INSERT INTO `sh_order` VALUES (92, '172666620174610003', 2, 4, 50.00, 0, NULL, '2024-09-18 13:30:02', NULL, 4, NULL);
INSERT INTO `sh_order` VALUES (93, '172670731854610002', 2, 112, 10.00, 1, '支付宝', '2024-09-19 00:55:19', '2024-09-19 00:56:59', 3, NULL);
INSERT INTO `sh_order` VALUES (94, '172681407987710002', 2, 110, 25.00, 0, NULL, '2024-09-20 06:34:40', NULL, 4, NULL);
INSERT INTO `sh_order` VALUES (95, '172692887182010002', 2, 111, 55.00, 0, NULL, '2024-09-21 14:27:52', NULL, 4, NULL);

-- ----------------------------
-- Table structure for sh_order_address
-- ----------------------------
DROP TABLE IF EXISTS `sh_order_address`;
CREATE TABLE `sh_order_address`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_id` bigint NOT NULL COMMENT '订单id',
  `consignee_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人',
  `consignee_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电话',
  `detail_address` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货地址',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `orderId`(`order_id`) USING BTREE,
  INDEX `order_id_index`(`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sh_order_address
-- ----------------------------
INSERT INTO `sh_order_address` VALUES (1, 58, 'user9', '13011110009', '江苏省南通市崇川区花园一单元一号楼');
INSERT INTO `sh_order_address` VALUES (2, 59, 'user8', '13011110008', '江苏省南通市崇川区888');
INSERT INTO `sh_order_address` VALUES (3, 60, 'user9', '13011110009', '江苏省南通市崇川区花园一单元一号楼');
INSERT INTO `sh_order_address` VALUES (4, 62, 'MZ', '13011110000', '河南省新乡市原阳县测试测试');
INSERT INTO `sh_order_address` VALUES (5, 61, 'MZ', '13011110000', '河南省新乡市原阳县测试测试');
INSERT INTO `sh_order_address` VALUES (6, 63, '1211111111', '1212', '天津市市辖区河东区212');
INSERT INTO `sh_order_address` VALUES (7, 64, '1211111111', '1212', '天津市市辖区河东区212');
INSERT INTO `sh_order_address` VALUES (8, 65, '1211111111', '1212', '天津市市辖区河东区212');
INSERT INTO `sh_order_address` VALUES (9, 66, '1211111111', '1212', '天津市市辖区河东区212');
INSERT INTO `sh_order_address` VALUES (10, 73, '1211111111', '1212', '天津市市辖区河东区212');
INSERT INTO `sh_order_address` VALUES (11, 74, '1211111111', '1212', '天津市市辖区河东区212');
INSERT INTO `sh_order_address` VALUES (12, 75, '1211111111', '1212', '天津市市辖区河东区212');
INSERT INTO `sh_order_address` VALUES (13, 76, '1211111111', '1212', '天津市市辖区河东区212');
INSERT INTO `sh_order_address` VALUES (14, 77, '1211111111', '1212', '天津市市辖区河东区212');
INSERT INTO `sh_order_address` VALUES (15, 78, '1211111111', '1212', '天津市市辖区河东区212');
INSERT INTO `sh_order_address` VALUES (16, 79, '下雨', '1788888888', '天津市市辖区河西区北京');
INSERT INTO `sh_order_address` VALUES (17, 80, '1211111111', '1212', '天津市市辖区河东区212');
INSERT INTO `sh_order_address` VALUES (18, 81, '1211111111', '1212', '天津市市辖区河东区212');
INSERT INTO `sh_order_address` VALUES (19, 82, '1211111111', '1212', '天津市市辖区河东区212');
INSERT INTO `sh_order_address` VALUES (20, 83, '1211111111', '1212', '天津市市辖区河东区212');
INSERT INTO `sh_order_address` VALUES (21, 85, '下雨', '1788888888', '天津市市辖区河西区北京');
INSERT INTO `sh_order_address` VALUES (22, 86, '1211111111', '1212', '天津市市辖区河东区212');
INSERT INTO `sh_order_address` VALUES (23, 87, '1211111111', '1212', '天津市市辖区河东区212');
INSERT INTO `sh_order_address` VALUES (24, 88, '下雨', '1788888888', '天津市市辖区河西区北京');
INSERT INTO `sh_order_address` VALUES (25, 89, '马小der', '15515935057', '河南省郑州市中原区中原中路41号中原工学院');
INSERT INTO `sh_order_address` VALUES (26, 90, '马小der', '15515935057', '河南省郑州市中原区中原中路41号中原工学院');
INSERT INTO `sh_order_address` VALUES (27, 91, '马小der', '15515935057', '河南省郑州市中原区中原中路41号中原工学院');
INSERT INTO `sh_order_address` VALUES (28, 92, '马小der', '15515935057', '河南省郑州市中原区中原中路41号中原工学院');
INSERT INTO `sh_order_address` VALUES (29, 93, '马小der', '15515935057', '河南省郑州市中原区中原中路41号中原工学院');
INSERT INTO `sh_order_address` VALUES (30, 94, '马小der', '15515935057', '河南省郑州市中原区中原中路41号中原工学院');
INSERT INTO `sh_order_address` VALUES (31, 95, '马小der', '15515935057', '河南省郑州市中原区中原中路41号中原工学院');

-- ----------------------------
-- Table structure for sh_user
-- ----------------------------
DROP TABLE IF EXISTS `sh_user`;
CREATE TABLE `sh_user`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `account_number` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号（手机号）',
  `user_password` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录密码',
  `nickname` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '昵称',
  `avatar` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '头像',
  `sign_in_time` datetime NOT NULL COMMENT '注册时间',
  `user_status` tinyint NULL DEFAULT NULL COMMENT '状态（1代表封禁）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `account_number`(`account_number`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sh_user
-- ----------------------------
INSERT INTO `sh_user` VALUES (1, 'user', '123456', 'MZZ', 'http://localhost:8081/image?imageName=file168663143432210031.jpg', '2024-10-22 10:49:01', 0);
INSERT INTO `sh_user` VALUES (2, '10086', '123456', '马小der', 'http://localhost:8081/image?imageName=file168663143432210030.png', '2024-10-22 11:47:19', 0);
INSERT INTO `sh_user` VALUES (3, '10087', '123456', '夏目', 'http://localhost:8081/image?imageName=file17266341084651007eureka.jpg', '2024-10-22 11:47:30', 0);
INSERT INTO `sh_user` VALUES (4, '10088', '123456', '下雨', 'http://localhost:8081/image?imageName=file17266342307341009new-bee-logo-3.png', '2024-10-22 11:53:15', 0);
INSERT INTO `sh_user` VALUES (5, '13011110004', '123456', 'user4', 'http://localhost:8081/image?imageName=file16600445641151003109951165625541004.jpg', '2024-10-22 12:21:50', 1);
INSERT INTO `sh_user` VALUES (6, '13011110005', '123456', 'user5', 'http://localhost:8081/image?imageName=file16600445641151003109951165625541004.jpg', '2024-10-22 12:22:33', 1);
INSERT INTO `sh_user` VALUES (7, '13011110006', '123456', 'user6', 'http://localhost:8081/image?imageName=file16600445641151003109951165625541004.jpg', '2024-10-22 12:23:15', 0);
INSERT INTO `sh_user` VALUES (8, '13011110007', '123456', 'user7', 'http://localhost:8081/image?imageName=file16600445641151003109951165625541004.jpg', '2024-10-22 12:25:36', 1);
INSERT INTO `sh_user` VALUES (9, '13011110008', '123456', 'user8', 'http://localhost:8081/image?imageName=file16600445641151003109951165625541004.jpg', '2024-10-22 13:24:04', 1);
INSERT INTO `sh_user` VALUES (10, '13011110009', '123456', 'user9', 'http://localhost:8081/image?imageName=file16600445641151003109951165625541004.jpg', '2024-10-22 13:49:01', 1);

SET FOREIGN_KEY_CHECKS = 1;
