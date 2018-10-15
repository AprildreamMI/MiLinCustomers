/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 80011
Source Host           : localhost:3306
Source Database       : milintb

Target Server Type    : MYSQL
Target Server Version : 80011
File Encoding         : 65001

Date: 2018-06-13 15:45:12
*/

-- 如果不存在MiLinTb数据库创建MiLinTb数据库并指定编码方式
 CREATE DATABASE IF NOT EXISTS MiLinTb DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `customers`
-- ----------------------------
DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
  `c_Id` int(20) NOT NULL AUTO_INCREMENT,
  `c_Email` varchar(50) NOT NULL,
  `c_Password` varchar(30) NOT NULL,
  `c_Name` varchar(30) NOT NULL,
  `c_Gender` char(2) NOT NULL,
  `c_Address` varchar(50) DEFAULT NULL,
  `c_Phone` varchar(11) DEFAULT NULL,
  `c_Type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'base',
  PRIMARY KEY (`c_Id`),
  UNIQUE KEY `c_Email` (`c_Email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customers
-- ----------------------------
INSERT INTO `customers` VALUES ('1', '1159902944@qq.com', 'asdzxc123', '赵四', '男', null, null, 'base');
INSERT INTO `customers` VALUES ('2', '1159902744@qq.com', 'asdzxc123', '李三', '男', null, null, 'base');
INSERT INTO `customers` VALUES ('6', '1159902844@qq.com', 'asdzxc456', '赵思', '男', null, null, 'main');
INSERT INTO `customers` VALUES ('7', '350514331@qq.com', 'tang123', '汤亮亮', '男', null, null, 'base');
INSERT INTO `customers` VALUES ('8', '1104642244@qq.com', '123456789', '赵其', '男', null, null, 'base');
INSERT INTO `customers` VALUES ('9', '1611313919@qq.com', 'liupan970219...', '刘盼', '男', null, null, 'base');

