/*
Navicat MySQL Data Transfer

Source Server         : localhost_root
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : zhongchou

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2015-11-13 11:31:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `profit_distribution`
-- ----------------------------
DROP TABLE IF EXISTS `profit_distribution`;
CREATE TABLE `profit_distribution` (
  `project_id` int(11) NOT NULL COMMENT '项目id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `join_date` varchar(200) NOT NULL COMMENT '加入日期',
  `join_days` varchar(200) NOT NULL COMMENT '加入总天数',
  `predict_distribution` varchar(200) NOT NULL COMMENT '预计分配',
  PRIMARY KEY (`project_id`,`user_id`),
  KEY `profit_user_id` (`user_id`),
  CONSTRAINT `profit_project_id` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `profit_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of profit_distribution
-- ----------------------------

-- ----------------------------
-- Table structure for `project`
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `project_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '项目id',
  `project_name` varchar(200) NOT NULL COMMENT '项目名字',
  `introduce_text` varchar(200) DEFAULT NULL COMMENT '介绍文字',
  `introduce_pic` varchar(200) DEFAULT NULL COMMENT '介绍图片url',
  `predict_profit` varchar(200) NOT NULL COMMENT '预计利润',
  `actual_profit` varchar(200) DEFAULT NULL COMMENT '实际利润',
  `project_type` varchar(200) NOT NULL DEFAULT '1' COMMENT '项目状态',
  PRIMARY KEY (`project_id`),
  UNIQUE KEY `project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('2', '采购大米1000袋', '进货价50元每袋，市场价80元每袋，公司销售60元每袋。', null, '10000.00', null, '1');

-- ----------------------------
-- Table structure for `project_order`
-- ----------------------------
DROP TABLE IF EXISTS `project_order`;
CREATE TABLE `project_order` (
  `project_id` int(11) NOT NULL COMMENT '项目id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `order_date` varchar(200) NOT NULL COMMENT '预订日期',
  `order_content` varchar(200) NOT NULL COMMENT '预订内容',
  `order_type` varchar(200) NOT NULL DEFAULT '0' COMMENT '预订类型',
  PRIMARY KEY (`project_id`,`user_id`),
  KEY `order_user_id` (`user_id`),
  CONSTRAINT `order_project_id` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project_order
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `password` varchar(200) NOT NULL COMMENT '用户密码',
  `user_name` varchar(200) NOT NULL COMMENT '用户姓名',
  `payment` varchar(200) NOT NULL COMMENT '交款',
  `ID_number` varchar(200) NOT NULL COMMENT '身份证号',
  `handle_person` varchar(200) NOT NULL COMMENT '经手人',
  `account_bank` varchar(200) NOT NULL COMMENT '开户银行',
  `bank_account` varchar(200) NOT NULL COMMENT '银行账号',
  `sex` varchar(200) NOT NULL COMMENT '性别',
  `type` varchar(200) NOT NULL COMMENT '会员类型',
  `address` varchar(200) NOT NULL COMMENT '家庭住址',
  `birthday` varchar(200) NOT NULL COMMENT '生日',
  `telephone` varchar(200) NOT NULL COMMENT '电话',
  `referrer_number` varchar(200) NOT NULL COMMENT '推荐人编号',
  `add_time` varchar(200) NOT NULL COMMENT '登记时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '123', '黄金定', '99.99', '411526199111086431', '杨午圣', '中国银行', '6214921400279135', '1', '砖石会员', '河南省信阳市', '1991-11-08', '15271840991', '1', '2015-11-06');
INSERT INTO `user` VALUES ('2', '123', '杨午圣', '99.99', '411526199111086432', '黄金定', '光大银行', '6214921400279135', '1', '黄金会员', '湖北省咸宁市', '1989-11-08', '15271840991', '1', '2015-11-06');
INSERT INTO `user` VALUES ('3', '123', '谢迪', '99.99', '411526199111086433', '谢迪', '中国银行', '6214921400279135', '1', '白银会员', '湖北省武汉市', '1990-11-08', '15271840991', '1', '2015-11-06');
