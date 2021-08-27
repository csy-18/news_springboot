/*
 Navicat Premium Data Transfer

 Source Server         : 本机
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:3306
 Source Schema         : informationapp

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 27/08/2021 15:16:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '新闻编号',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '新闻标题',
  `title_img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '新闻标题图片',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '作者',
  `date` bigint NULL DEFAULT NULL COMMENT '日期',
  `version` int NULL DEFAULT 0 COMMENT '版本',
  `del_tag` bit(1) NULL DEFAULT b'0' COMMENT '逻辑删除标识符',
  `create_id` bigint NULL DEFAULT NULL COMMENT '创建者编号',
  `create_time` bigint NULL DEFAULT NULL COMMENT '创建时间',
  `modify_id` bigint NULL DEFAULT NULL COMMENT '修改者编号',
  `modify_time` bigint NULL DEFAULT NULL COMMENT '修改时间',
  `subject_id` int NULL DEFAULT NULL COMMENT '主题编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `news_subject_id`(`subject_id`) USING BTREE,
  CONSTRAINT `news_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `news_subject` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES (12, '123', 'titleImgUrl', '111111', 'author', 1, 0, b'0', 1, 1627457715493, NULL, NULL, NULL);
INSERT INTO `news` VALUES (13, '123', 'titleImgUrl', '111111', 'author', 1, 0, b'0', 1, 1627458023618, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for news_subject
-- ----------------------------
DROP TABLE IF EXISTS `news_subject`;
CREATE TABLE `news_subject`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `news_type_id` int NULL DEFAULT NULL,
  `version` int NULL DEFAULT 0,
  `del_tag` bit(1) NULL DEFAULT b'0',
  `create_id` bigint NULL DEFAULT NULL,
  `create_time` bigint NULL DEFAULT NULL,
  `modify_id` bigint NULL DEFAULT NULL,
  `modify_time` bigint NULL DEFAULT NULL,
  `title_img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `news_type_id`(`news_type_id`) USING BTREE,
  CONSTRAINT `news_type_id` FOREIGN KEY (`news_type_id`) REFERENCES `news_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news_subject
-- ----------------------------
INSERT INTO `news_subject` VALUES (1, '河南郑州暴雨致灾', 3, 0, b'0', 1, 1626943138057, NULL, NULL, 'https://n.sinaimg.cn/spider20210722/600/w1080h1920/20210722/f804-ef30bbd1f31d8b6433f031bc4c9ff033.jpg');
INSERT INTO `news_subject` VALUES (2, '南京已诊断出13例确诊', 3, 0, b'0', 1, 1626943297014, NULL, NULL, 'https://ww4.sinaimg.cn/bmiddle/001WLsZ7ly1gsppfboenyj608c08cdg302.jpg');
INSERT INTO `news_subject` VALUES (3, '徐才根去世', 5, 0, b'0', 1, 1626943402146, NULL, NULL, 'https://ww2.sinaimg.cn/bmiddle/001Na93Ily1gspptz2zkvj60k80v475h02.jpg');
INSERT INTO `news_subject` VALUES (4, '南京出现德尔塔毒株新冠疫情', 3, 0, b'0', 1, 1627472392948, NULL, NULL, 'http://sychen.svip.aeert.com/file/upload/1627472380921_u=1662119891,3406265612&fm=55&app=54&fmt=auto.jpg');

-- ----------------------------
-- Table structure for news_type
-- ----------------------------
DROP TABLE IF EXISTS `news_type`;
CREATE TABLE `news_type`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '名称',
  `version` int NULL DEFAULT 0 COMMENT '版本',
  `del_tag` bit(1) NULL DEFAULT b'0',
  `create_id` bigint NULL DEFAULT NULL,
  `create_time` bigint NULL DEFAULT NULL,
  `modify_id` bigint NULL DEFAULT NULL,
  `modify_time` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news_type
-- ----------------------------
INSERT INTO `news_type` VALUES (1, '今日精选', 0, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `news_type` VALUES (2, '热门推荐', 0, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `news_type` VALUES (3, '事件追踪', 0, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `news_type` VALUES (4, '摸鱼必备', 0, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `news_type` VALUES (5, '今日看点', 0, b'0', 1, 1626897848298, NULL, NULL);

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限名称',
  `permission` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 87 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '查看用户信息', 'sys:user:info');
INSERT INTO `sys_menu` VALUES (2, '查看所有权限', 'sys:menu:info');
INSERT INTO `sys_menu` VALUES (3, '查看所有角色', 'sys:role:info');
INSERT INTO `sys_menu` VALUES (4, '修改用户信息', 'sys:user:update');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, 'ADMIN');
INSERT INTO `sys_role` VALUES (2, 'USER');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `role_id` bigint NULL DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint NULL DEFAULT NULL COMMENT '权限ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色与权限关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 1, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1, 2);
INSERT INTO `sys_role_menu` VALUES (3, 1, 3);
INSERT INTO `sys_role_menu` VALUES (4, 2, 1);
INSERT INTO `sys_role_menu` VALUES (5, 2, 4);
INSERT INTO `sys_role_menu` VALUES (6, 1, 4);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态 PROHIBIT：禁用   NORMAL：正常',
  `version` int NULL DEFAULT 0 COMMENT '版本',
  `del_tag` bit(1) NULL DEFAULT b'0' COMMENT '逻辑删除标识符',
  `create_id` bigint NULL DEFAULT NULL COMMENT '创建者编号',
  `create_time` bigint NULL DEFAULT NULL COMMENT '创建时间',
  `modify_id` bigint NULL DEFAULT NULL COMMENT '修改者编号',
  `modify_time` bigint NULL DEFAULT NULL COMMENT '修改时间',
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账户',
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `gender` bit(1) NULL DEFAULT NULL COMMENT '性别',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮件',
  `phone` bigint NULL DEFAULT NULL COMMENT '手机号码',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '$2a$10$5T851lZ7bc2U87zjt/9S6OkwmLW62tLeGLB2aCmq3XRZHA7OI7Dqa', 'NORMAL', 0, b'0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (2, 'user', '$2a$10$szHoqQ64g66PymVJkip98.Fap21Csy8w.RD8v5Dhq08BMEZ9KaSmS', 'NORMAL', 0, b'0', NULL, NULL, NULL, NULL, '12345678', '陈思远', b'0', '18762709570@163.com', 18852099661, NULL);
INSERT INTO `sys_user` VALUES (7, '07615283', '$2a$10$szHoqQ64g66PymVJkip98.Fap21Csy8w.RD8v5Dhq08BMEZ9KaSmS', 'NORMAL', 0, b'0', NULL, NULL, NULL, NULL, NULL, 'cs', b'0', '18762709570@163.com', 18852099661, NULL);
INSERT INTO `sys_user` VALUES (12, '75413829', '12345678', 'NORMAL', 1, b'0', 666, 1626626408503, 666, 1626715515381, NULL, '付洁', b'1', '18762709570@163.com', 18852099661, NULL);
INSERT INTO `sys_user` VALUES (13, '96450137', '$2a$10$mBMnYsdvVQ03woNVRyi3P.jACmoDypJRwhA/lPThIxfDVqjrH/Atm', 'NORMAL', 0, b'0', 1, 1626626828214, NULL, NULL, NULL, 'ALICE', b'1', '2538552685@qq.com', 18852099661, NULL);
INSERT INTO `sys_user` VALUES (14, '06398542', '$2a$10$AxO.QxYWA9xi28clvaTxc.ax8zdYc/LGf.klQkCP3X6ZbyB/pksWa', 'NORMAL', 1, b'0', 1, 1626708618361, 666, 1626714518070, NULL, '王八蛋22', b'1', '18762709570@163.com', 18852099661, NULL);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint NULL DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与角色关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2, 2);
INSERT INTO `sys_user_role` VALUES (5, 7, 1);
INSERT INTO `sys_user_role` VALUES (6, 8, 2);
INSERT INTO `sys_user_role` VALUES (7, 9, 1);
INSERT INTO `sys_user_role` VALUES (8, 10, 1);
INSERT INTO `sys_user_role` VALUES (9, 11, 1);
INSERT INTO `sys_user_role` VALUES (10, 12, 1);
INSERT INTO `sys_user_role` VALUES (11, 13, 1);
INSERT INTO `sys_user_role` VALUES (12, 14, 1);

SET FOREIGN_KEY_CHECKS = 1;
