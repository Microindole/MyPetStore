/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 90200 (9.2.0)
 Source Host           : localhost:3306
 Source Schema         : mypetstore

 Target Server Type    : MySQL
 Target Server Version : 90200 (9.2.0)
 File Encoding         : 65001

 Date: 23/03/2025 09:48:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account`  (
  `userid` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `email` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `firstname` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `lastname` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `status` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `addr1` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `addr2` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `city` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `state` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `zip` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `country` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `phone` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('1', 'abc@yourdomain.com', 'ABC', 'XYX', 'OK', 'San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', '美国', '5555555555');
INSERT INTO `account` VALUES ('1111', 'fdsbsbsgb@ddd.com', 'abc', 'abc', NULL, '123', '123', '123', '123', '123', '中国', '734013');
INSERT INTO `account` VALUES ('1112', 'abc@yourdomain.com', 'ABC', 'XYX', 'OK', 'San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', '美国', '5555555555');
INSERT INTO `account` VALUES ('123', 'abc@yourdomain.com', 'ABC', 'XYX', 'OK', 'San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', '中国', '5555555555');
INSERT INTO `account` VALUES ('1234', '1', '1', '1', 'OK', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `account` VALUES ('1899695910820155394', '1xtcf@163.com', 'abc', 'abc', NULL, '123', '123', '123', '123', '123', '中国', '734013');
INSERT INTO `account` VALUES ('1899696729544126465', '123@22ww.com', 'abc', 'abc', NULL, '123', '123', '123', '123', '123', '中国', '734013');
INSERT INTO `account` VALUES ('44', 'abc@yourdomain.com', 'ABC', 'XYX', 'OK', 'San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', '美国', '5555555555');
INSERT INTO `account` VALUES ('445', 'abc@yourdomain.com', 'ABC', 'XYX', 'OK', 'San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', '美国', '5555555555');
INSERT INTO `account` VALUES ('545', '44', '55', '55', 'OK', '55', '55', '55', '55', '55', '55', '44');
INSERT INTO `account` VALUES ('55', 'abc@yourdomain.com', 'ABD', 'XYX', 'OK', 'San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', '美国', '5555555555');
INSERT INTO `account` VALUES ('ACID', 'acid@yourdomain.com', 'ABC', 'XYX', 'OK', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', '555-555-5555');
INSERT INTO `account` VALUES ('abc', '', '', '', NULL, '', '', '', '', '', '', '');
INSERT INTO `account` VALUES ('abcd', 'abc@yourdomain.com', 'ABC', 'XYX', NULL, 'San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', '美国', '5555555555');
INSERT INTO `account` VALUES ('abcde', 'abc@yourdomain.com', 'ABC', 'XYX', NULL, 'San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', '美国', '5555555555');
INSERT INTO `account` VALUES ('asd', '123@222.com', 'abc', 'abc', NULL, '123', '123', '123', '123', '123', '中国', '734013');
INSERT INTO `account` VALUES ('hello', 's', '123456', '123456', NULL, 'add1111', 'add2222', 'city11', 'state11', 'zip11', '中国', 's');
INSERT INTO `account` VALUES ('j2', 'abc@yourdomain.com', 'ABC', 'XYX', 'OK', 'San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', '美国', '5555555555');
INSERT INTO `account` VALUES ('j23', 'abc@yourdomain.com', 'ABC', 'XYX', 'OK', 'San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', '美国', '5555555555');
INSERT INTO `account` VALUES ('j2345', 'abc@yourdomain.com', 'ABC', 'XYX', 'OK', 'San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', '美国', '5555555555');
INSERT INTO `account` VALUES ('j23456', 'abc@yourdomain.com', 'ABC', 'XYX', 'OK', 'San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', '美国', '5555555555');
INSERT INTO `account` VALUES ('j234567', 'abc@yourdomain.com', 'ABC', 'XYX', 'OK', 'San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', '美国', '5555555555');
INSERT INTO `account` VALUES ('j2ee', '', '', '', 'OK', '', '', '', '', '', '', '');
INSERT INTO `account` VALUES ('j2eee', 'abc@yourdomain.com', 'ABC', 'XYX', 'OK', 'San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', '美国', '5555555555');
INSERT INTO `account` VALUES ('jjj', '123@222.com', 'abc', 'abc', NULL, '123', '123', '123', '123', '123', '中国', '734013');
INSERT INTO `account` VALUES ('jjww', '123@222.com', 'abc', 'abc', NULL, '123', '123', '123', '123', '123', '中国', '734013');
INSERT INTO `account` VALUES ('nihao', 's', '123456', '123456', NULL, 'add1111', 'add2222', 'city11', 'state11', 'zip11', '中国', 's');
INSERT INTO `account` VALUES ('ohyeah', '1513979779@qq.com', 'abc', 'abc', NULL, '123', '123', '123', '123', '123', '中国', '13850844558');
INSERT INTO `account` VALUES ('qwe', '123@163.com', 'cdasva', 'vfsdvds', 'OK', 'avdsf', 'fdvs', 'vsfdvd', '123fsv', 'vsf', 'dfgsfv', '734013');

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `adminname` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `adminpassword` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`adminname`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('admin', 'admin');

-- ----------------------------
-- Table structure for bannerdata
-- ----------------------------
DROP TABLE IF EXISTS `bannerdata`;
CREATE TABLE `bannerdata`  (
  `favcategory` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `bannername` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  PRIMARY KEY (`favcategory`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bannerdata
-- ----------------------------
INSERT INTO `bannerdata` VALUES ('BIRDS', '<image src=\"../images/banner_birds.gif\">');
INSERT INTO `bannerdata` VALUES ('CATS', '<image src=\"../images/banner_cats.gif\">');
INSERT INTO `bannerdata` VALUES ('DOGS', '<image src=\"../images/banner_dogs.gif\">');
INSERT INTO `bannerdata` VALUES ('FISH', '<image src=\"../images/banner_fish.gif\">');
INSERT INTO `bannerdata` VALUES ('REPTILES', '<image src=\"../images/banner_reptiles.gif\">');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `userid` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `itemid` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `quantity` int NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES ('1111', 'EST-22', 1);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `catid` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `name` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `descn` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  PRIMARY KEY (`catid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('BIRDS', 'Birds', '<image src=\"../images/birds_icon.gif\"><font size=\"5\" color=\"blue\"> Birds</font>');
INSERT INTO `category` VALUES ('CATS', 'Cats', '<image src=\"../images/cats_icon.gif\"><font size=\"5\" color=\"blue\"> Cats</font>');
INSERT INTO `category` VALUES ('DOGS', 'Dogs', '<image src=\"../images/dogs_icon.gif\"><font size=\"5\" color=\"blue\"> Dogs</font>');
INSERT INTO `category` VALUES ('FISH', 'Fish', '<image src=\"../images/fish_icon.gif\"><font size=\"5\" color=\"blue\"> Fish</font>');
INSERT INTO `category` VALUES ('REPTILES', 'Reptiles', '<image src=\"../images/reptiles_icon.gif\"><font size=\"5\" color=\"blue\"> Reptiles</font>');

-- ----------------------------
-- Table structure for inventory
-- ----------------------------
DROP TABLE IF EXISTS `inventory`;
CREATE TABLE `inventory`  (
  `itemid` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `qty` int NOT NULL,
  PRIMARY KEY (`itemid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of inventory
-- ----------------------------
INSERT INTO `inventory` VALUES ('EST-1', 10000);
INSERT INTO `inventory` VALUES ('EST-10', 10000);
INSERT INTO `inventory` VALUES ('EST-11', 10000);
INSERT INTO `inventory` VALUES ('EST-12', 10000);
INSERT INTO `inventory` VALUES ('EST-13', 9875);
INSERT INTO `inventory` VALUES ('EST-14', 9994);
INSERT INTO `inventory` VALUES ('EST-15', 10000);
INSERT INTO `inventory` VALUES ('EST-16', 9995);
INSERT INTO `inventory` VALUES ('EST-17', 9999);
INSERT INTO `inventory` VALUES ('EST-18', 9966);
INSERT INTO `inventory` VALUES ('EST-19', 9984);
INSERT INTO `inventory` VALUES ('EST-2', 10000);
INSERT INTO `inventory` VALUES ('EST-20', 10000);
INSERT INTO `inventory` VALUES ('EST-21', 9998);
INSERT INTO `inventory` VALUES ('EST-22', 10000);
INSERT INTO `inventory` VALUES ('EST-23', 10000);
INSERT INTO `inventory` VALUES ('EST-24', 10000);
INSERT INTO `inventory` VALUES ('EST-25', 10000);
INSERT INTO `inventory` VALUES ('EST-26', 9997);
INSERT INTO `inventory` VALUES ('EST-27', 10000);
INSERT INTO `inventory` VALUES ('EST-28', 10000);
INSERT INTO `inventory` VALUES ('EST-3', 9999);
INSERT INTO `inventory` VALUES ('EST-4', 9936);
INSERT INTO `inventory` VALUES ('EST-5', 9996);
INSERT INTO `inventory` VALUES ('EST-6', 10000);
INSERT INTO `inventory` VALUES ('EST-7', 10000);
INSERT INTO `inventory` VALUES ('EST-8', 10000);
INSERT INTO `inventory` VALUES ('EST-9', 10000);

-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item`  (
  `itemid` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `productid` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `listprice` decimal(10, 2) NULL DEFAULT NULL,
  `unitcost` decimal(10, 2) NULL DEFAULT NULL,
  `supplier` int NULL DEFAULT NULL,
  `status` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `attr1` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `attr2` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `attr3` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `attr4` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `attr5` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  PRIMARY KEY (`itemid`) USING BTREE,
  INDEX `fk_item_2`(`supplier` ASC) USING BTREE,
  INDEX `itemProd`(`productid` ASC) USING BTREE,
  CONSTRAINT `fk_item_1` FOREIGN KEY (`productid`) REFERENCES `product` (`productid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_item_2` FOREIGN KEY (`supplier`) REFERENCES `supplier` (`suppid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of item
-- ----------------------------
INSERT INTO `item` VALUES ('EST-1', 'FI-SW-01', 16.50, 10.00, 1, 'P', 'Large', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-10', 'K9-DL-01', 18.50, 12.00, 1, 'P', 'Spotted Adult Female', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-11', 'RP-SN-01', 18.50, 12.00, 1, 'P', 'Venomless', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-12', 'RP-SN-01', 18.50, 12.00, 1, 'P', 'Rattleless', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-13', 'RP-LI-02', 18.50, 12.00, 1, 'P', 'Green Adult', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-14', 'FL-DSH-01', 58.50, 12.00, 1, 'P', 'Tailless', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-15', 'FL-DSH-01', 23.50, 12.00, 1, 'P', 'With tail', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-16', 'FL-DLH-02', 93.50, 12.00, 1, 'P', 'Adult Female', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-17', 'FL-DLH-02', 93.50, 12.00, 1, 'P', 'Adult Male', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-18', 'AV-CB-01', 193.50, 92.00, 1, 'P', 'Adult Male', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-19', 'AV-SB-02', 15.50, 2.00, 1, 'P', 'Adult Male', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-2', 'FI-SW-01', 16.50, 10.00, 1, 'P', 'Small', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-20', 'FI-FW-02', 5.50, 2.00, 1, 'P', 'Adult Male', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-21', 'FI-FW-02', 5.29, 1.00, 1, 'P', 'Adult Female', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-22', 'K9-RT-02', 135.50, 100.00, 1, 'P', 'Adult Male', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-23', 'K9-RT-02', 145.49, 100.00, 1, 'P', 'Adult Female', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-24', 'K9-RT-02', 255.50, 92.00, 1, 'P', 'Adult Male', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-25', 'K9-RT-02', 325.29, 90.00, 1, 'P', 'Adult Female', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-26', 'K9-CW-01', 125.50, 92.00, 1, 'P', 'Adult Male', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-27', 'K9-CW-01', 155.29, 90.00, 1, 'P', 'Adult Female', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-28', 'K9-RT-01', 155.29, 90.00, 1, 'P', 'Adult Female', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-3', 'FI-SW-02', 18.50, 12.00, 1, 'P', 'Toothless', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-4', 'FI-FW-01', 18.50, 12.00, 1, 'P', 'Spotted', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-5', 'FI-FW-01', 18.50, 12.00, 1, 'P', 'Spotless', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-6', 'K9-BD-01', 18.50, 12.00, 1, 'P', 'Male Adult', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-7', 'K9-BD-01', 18.50, 12.00, 1, 'P', 'Female Puppy', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-8', 'K9-PO-02', 18.50, 12.00, 1, 'P', 'Male Puppy', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-9', 'K9-DL-01', 18.50, 12.00, 1, 'P', 'Spotless Male Puppy', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for lineitem
-- ----------------------------
DROP TABLE IF EXISTS `lineitem`;
CREATE TABLE `lineitem`  (
  `orderid` int NOT NULL,
  `linenum` int NOT NULL,
  `itemid` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `quantity` int NOT NULL,
  `unitprice` decimal(10, 2) NOT NULL,
  PRIMARY KEY (`orderid`, `linenum`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lineitem
-- ----------------------------
INSERT INTO `lineitem` VALUES (1000, 1, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1000, 2, 'EST-19', 1, 15.50);
INSERT INTO `lineitem` VALUES (1000, 3, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1000, 4, 'EST-3', 1, 18.50);
INSERT INTO `lineitem` VALUES (1000, 5, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1000, 6, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1001, 1, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1001, 2, 'EST-19', 1, 15.50);
INSERT INTO `lineitem` VALUES (1001, 3, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1001, 4, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1003, 1, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1004, 1, 'EST-19', 1, 15.50);
INSERT INTO `lineitem` VALUES (1005, 1, 'EST-16', 5, 93.50);
INSERT INTO `lineitem` VALUES (1041, 1, 'EST-19', 1, 15.50);
INSERT INTO `lineitem` VALUES (1042, 1, 'EST-19', 1, 15.50);
INSERT INTO `lineitem` VALUES (1043, 1, 'EST-13', 1, 18.50);

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log`  (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `log_user_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `log_info` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `log_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 573 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES (3, 'admin@admin', 'invoke org.csu.petstore.controller.AccountController.viewAccount', '2025-03-20 19:15:01');
INSERT INTO `log` VALUES (4, 'account@qwe', 'invoke org.csu.petstore.controller.CatalogController.viewProduct   Desc: ', '2025-03-20 19:15:04');
INSERT INTO `log` VALUES (5, 'account@qwe', 'invoke org.csu.petstore.controller.CartController.addItemToCart   Desc: ', '2025-03-20 19:15:06');
INSERT INTO `log` VALUES (6, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.signOn successfully', '2025-03-20 19:21:24');
INSERT INTO `log` VALUES (7, 'Visitor', 'invoke org.csu.petstore.controller.CaptchaController.getCaptcha successfully', '2025-03-20 19:21:25');
INSERT INTO `log` VALUES (8, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.index   Desc: ', '2025-03-21 18:43:59');
INSERT INTO `log` VALUES (9, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.signOn   Desc: ', '2025-03-21 18:44:26');
INSERT INTO `log` VALUES (10, 'Visitor', 'invoke org.csu.petstore.controller.CaptchaController.getCaptcha   Desc: ', '2025-03-21 18:44:27');
INSERT INTO `log` VALUES (11, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.index   Desc: ', '2025-03-21 18:47:47');
INSERT INTO `log` VALUES (12, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.signOn   Desc: ', '2025-03-21 18:48:18');
INSERT INTO `log` VALUES (13, 'Visitor', 'invoke org.csu.petstore.controller.CaptchaController.getCaptcha   Desc: ', '2025-03-21 18:48:21');
INSERT INTO `log` VALUES (14, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.signOn   Desc: ', '2025-03-21 18:49:57');
INSERT INTO `log` VALUES (15, 'Visitor', 'invoke org.csu.petstore.controller.CaptchaController.getCaptcha   Desc: ', '2025-03-21 18:49:58');
INSERT INTO `log` VALUES (16, 'admin@admin', 'invoke org.csu.petstore.controller.AdminController.getAdmin successfully', '2025-03-21 19:00:26');
INSERT INTO `log` VALUES (17, 'admin@admin', 'invoke org.csu.petstore.controller.AccountController.listAccounts successfully', '2025-03-21 19:00:28');
INSERT INTO `log` VALUES (18, 'admin@admin', 'invoke org.csu.petstore.controller.AdminController.adminIndex successfully', '2025-03-21 19:01:08');
INSERT INTO `log` VALUES (19, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.getOrders successfully', '2025-03-21 19:01:10');
INSERT INTO `log` VALUES (20, 'admin@admin', 'invoke org.csu.petstore.controller.AdminController.adminIndex successfully', '2025-03-21 19:01:16');
INSERT INTO `log` VALUES (21, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.listProducts successfully', '2025-03-21 19:01:19');
INSERT INTO `log` VALUES (22, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.newProductForm successfully', '2025-03-21 19:01:28');
INSERT INTO `log` VALUES (23, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.newProductForm successfully', '2025-03-21 19:02:09');
INSERT INTO `log` VALUES (24, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.saveProduct successfully', '2025-03-21 19:02:13');
INSERT INTO `log` VALUES (25, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.listProducts successfully', '2025-03-21 19:02:14');
INSERT INTO `log` VALUES (26, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.index successfully', '2025-03-21 19:02:35');
INSERT INTO `log` VALUES (27, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.viewCategory successfully', '2025-03-21 19:02:58');
INSERT INTO `log` VALUES (28, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.viewProduct successfully', '2025-03-21 19:03:21');
INSERT INTO `log` VALUES (29, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.viewCategory successfully', '2025-03-21 19:03:31');
INSERT INTO `log` VALUES (30, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.viewProduct successfully', '2025-03-21 19:03:34');
INSERT INTO `log` VALUES (31, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.editProductForm successfully', '2025-03-21 19:03:51');
INSERT INTO `log` VALUES (32, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.saveProduct successfully', '2025-03-21 19:03:56');
INSERT INTO `log` VALUES (33, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.listProducts successfully', '2025-03-21 19:03:56');
INSERT INTO `log` VALUES (34, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.listItems successfully', '2025-03-21 19:04:00');
INSERT INTO `log` VALUES (35, 'admin@admin', 'invoke org.csu.petstore.controller.AdminController.adminIndex successfully', '2025-03-21 19:04:09');
INSERT INTO `log` VALUES (36, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.getOrders successfully', '2025-03-21 19:04:10');
INSERT INTO `log` VALUES (37, 'admin@admin', 'invoke org.csu.petstore.controller.AdminController.adminIndex successfully', '2025-03-21 19:04:12');
INSERT INTO `log` VALUES (38, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.listProducts successfully', '2025-03-21 19:04:14');
INSERT INTO `log` VALUES (39, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.listCategories successfully', '2025-03-21 19:04:19');
INSERT INTO `log` VALUES (40, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.newCategoryForm successfully', '2025-03-21 19:04:22');
INSERT INTO `log` VALUES (41, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.listCategories successfully', '2025-03-21 19:04:24');
INSERT INTO `log` VALUES (42, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.listItems successfully', '2025-03-21 19:04:27');
INSERT INTO `log` VALUES (43, 'admin@admin', 'invoke org.csu.petstore.controller.AdminController.adminIndex successfully', '2025-03-21 19:04:33');
INSERT INTO `log` VALUES (44, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.listProducts successfully', '2025-03-21 19:04:35');
INSERT INTO `log` VALUES (45, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.deleteProduct successfully', '2025-03-21 19:04:44');
INSERT INTO `log` VALUES (46, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.listProducts successfully', '2025-03-21 19:04:44');
INSERT INTO `log` VALUES (47, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.newProductForm successfully', '2025-03-21 19:04:50');
INSERT INTO `log` VALUES (48, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.listProducts successfully', '2025-03-21 19:04:53');
INSERT INTO `log` VALUES (49, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.newProductForm successfully', '2025-03-21 19:04:58');
INSERT INTO `log` VALUES (50, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.listProducts successfully', '2025-03-21 19:05:02');
INSERT INTO `log` VALUES (51, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.newProductForm successfully', '2025-03-21 19:05:09');
INSERT INTO `log` VALUES (52, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.saveProduct successfully', '2025-03-21 19:05:17');
INSERT INTO `log` VALUES (53, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.listProducts successfully', '2025-03-21 19:05:17');
INSERT INTO `log` VALUES (54, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.listItems successfully', '2025-03-21 19:06:11');
INSERT INTO `log` VALUES (55, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.editItemForm successfully', '2025-03-21 19:06:16');
INSERT INTO `log` VALUES (56, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.listItems successfully', '2025-03-21 19:06:46');
INSERT INTO `log` VALUES (57, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.listCategories successfully', '2025-03-21 19:06:50');
INSERT INTO `log` VALUES (58, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.newCategoryForm successfully', '2025-03-21 19:06:54');
INSERT INTO `log` VALUES (59, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.listCategories successfully', '2025-03-21 19:06:56');
INSERT INTO `log` VALUES (60, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.listItems successfully', '2025-03-21 19:06:57');
INSERT INTO `log` VALUES (61, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.newItemForm successfully', '2025-03-21 19:07:01');
INSERT INTO `log` VALUES (62, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.listItems successfully', '2025-03-21 19:07:09');
INSERT INTO `log` VALUES (63, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.listCategories successfully', '2025-03-21 19:07:11');
INSERT INTO `log` VALUES (64, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.newCategoryForm successfully', '2025-03-21 19:07:15');
INSERT INTO `log` VALUES (65, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.listCategories successfully', '2025-03-21 19:07:17');
INSERT INTO `log` VALUES (66, 'admin@admin', 'invoke org.csu.petstore.controller.AdminController.adminIndex successfully', '2025-03-21 19:07:18');
INSERT INTO `log` VALUES (67, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.getOrders successfully', '2025-03-21 19:07:19');
INSERT INTO `log` VALUES (68, 'admin@admin', 'invoke org.csu.petstore.controller.AdminController.adminIndex successfully', '2025-03-21 19:07:20');
INSERT INTO `log` VALUES (69, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.listProducts successfully', '2025-03-21 19:07:21');
INSERT INTO `log` VALUES (70, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.deleteProduct successfully', '2025-03-21 19:07:26');
INSERT INTO `log` VALUES (71, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.listProducts successfully', '2025-03-21 19:07:26');
INSERT INTO `log` VALUES (72, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.listItems successfully', '2025-03-21 19:07:27');
INSERT INTO `log` VALUES (73, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.newItemForm successfully', '2025-03-21 19:07:30');
INSERT INTO `log` VALUES (74, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.saveItem successfully', '2025-03-21 19:08:18');
INSERT INTO `log` VALUES (75, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.listItems successfully', '2025-03-21 19:08:18');
INSERT INTO `log` VALUES (76, 'admin@admin', 'invoke org.csu.petstore.controller.AdminController.adminIndex successfully', '2025-03-21 19:08:40');
INSERT INTO `log` VALUES (77, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.getOrders successfully', '2025-03-21 19:08:41');
INSERT INTO `log` VALUES (78, 'admin@admin', 'invoke org.csu.petstore.controller.AdminController.adminIndex successfully', '2025-03-21 19:08:43');
INSERT INTO `log` VALUES (79, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.listProducts successfully', '2025-03-21 19:08:44');
INSERT INTO `log` VALUES (80, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.index successfully', '2025-03-21 19:53:14');
INSERT INTO `log` VALUES (81, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.signOn successfully', '2025-03-21 19:53:18');
INSERT INTO `log` VALUES (82, 'Visitor', 'invoke org.csu.petstore.controller.CaptchaController.getCaptcha successfully', '2025-03-21 19:53:20');
INSERT INTO `log` VALUES (83, 'Visitor', 'invoke org.csu.petstore.controller.AdminController.showindex successfully', '2025-03-21 19:53:21');
INSERT INTO `log` VALUES (84, 'admin@admin', 'invoke org.csu.petstore.controller.AdminController.getAdmin successfully', '2025-03-21 19:53:32');
INSERT INTO `log` VALUES (85, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.listProducts successfully', '2025-03-21 19:53:35');
INSERT INTO `log` VALUES (86, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.listItems successfully', '2025-03-21 19:53:38');
INSERT INTO `log` VALUES (87, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.newItemForm successfully', '2025-03-21 19:53:46');
INSERT INTO `log` VALUES (88, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.saveItem successfully', '2025-03-21 19:54:22');
INSERT INTO `log` VALUES (89, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.listItems successfully', '2025-03-21 19:54:22');
INSERT INTO `log` VALUES (90, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.newItemForm successfully', '2025-03-21 19:54:35');
INSERT INTO `log` VALUES (91, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.viewCategory successfully', '2025-03-21 19:54:52');
INSERT INTO `log` VALUES (92, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.viewCategory successfully', '2025-03-21 19:54:57');
INSERT INTO `log` VALUES (93, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.viewProduct successfully', '2025-03-21 19:54:59');
INSERT INTO `log` VALUES (94, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.viewItem successfully', '2025-03-21 19:55:03');
INSERT INTO `log` VALUES (95, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.viewItem successfully', '2025-03-21 19:55:08');
INSERT INTO `log` VALUES (96, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.viewProduct successfully', '2025-03-21 19:55:12');
INSERT INTO `log` VALUES (97, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.viewItem successfully', '2025-03-21 19:55:14');
INSERT INTO `log` VALUES (98, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.viewCategory successfully', '2025-03-21 19:55:17');
INSERT INTO `log` VALUES (99, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.viewProduct successfully', '2025-03-21 19:55:19');
INSERT INTO `log` VALUES (100, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.viewItem successfully', '2025-03-21 19:55:21');
INSERT INTO `log` VALUES (101, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.viewItem successfully', '2025-03-21 19:55:24');
INSERT INTO `log` VALUES (102, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.viewCategory successfully', '2025-03-21 19:55:30');
INSERT INTO `log` VALUES (103, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.viewCategory successfully', '2025-03-21 19:55:33');
INSERT INTO `log` VALUES (104, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.viewProduct successfully', '2025-03-21 19:55:35');
INSERT INTO `log` VALUES (105, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.viewCategory successfully', '2025-03-21 19:55:38');
INSERT INTO `log` VALUES (106, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.viewProduct successfully', '2025-03-21 19:55:39');
INSERT INTO `log` VALUES (107, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.viewItem successfully', '2025-03-21 19:55:41');
INSERT INTO `log` VALUES (108, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.viewItem successfully', '2025-03-21 19:55:43');
INSERT INTO `log` VALUES (109, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.index successfully', '2025-03-22 10:15:34');
INSERT INTO `log` VALUES (110, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.signOn successfully', '2025-03-22 10:15:39');
INSERT INTO `log` VALUES (111, 'Visitor', 'invoke org.csu.petstore.controller.CaptchaController.getCaptcha successfully', '2025-03-22 10:15:39');
INSERT INTO `log` VALUES (112, 'Visitor', 'invoke org.csu.petstore.controller.AdminController.showindex successfully', '2025-03-22 10:15:50');
INSERT INTO `log` VALUES (113, 'admin@admin', 'invoke org.csu.petstore.controller.AdminController.getAdmin successfully', '2025-03-22 10:15:56');
INSERT INTO `log` VALUES (114, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.getOrders successfully', '2025-03-22 10:15:57');
INSERT INTO `log` VALUES (115, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.deleteOrder successfully', '2025-03-22 10:17:56');
INSERT INTO `log` VALUES (116, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.getOrders successfully', '2025-03-22 10:17:56');
INSERT INTO `log` VALUES (117, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.deleteOrder successfully', '2025-03-22 10:17:57');
INSERT INTO `log` VALUES (118, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.getOrders successfully', '2025-03-22 10:17:57');
INSERT INTO `log` VALUES (119, 'admin@admin', 'invoke org.csu.petstore.controller.AdminController.adminIndex successfully', '2025-03-22 10:18:20');
INSERT INTO `log` VALUES (120, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.listProducts successfully', '2025-03-22 10:18:23');
INSERT INTO `log` VALUES (121, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.listItems successfully', '2025-03-22 10:18:26');
INSERT INTO `log` VALUES (122, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.newItemForm successfully', '2025-03-22 10:18:27');
INSERT INTO `log` VALUES (123, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.listItems successfully', '2025-03-22 10:19:24');
INSERT INTO `log` VALUES (124, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.listProducts successfully', '2025-03-22 10:19:26');
INSERT INTO `log` VALUES (125, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.newProductForm successfully', '2025-03-22 10:19:27');
INSERT INTO `log` VALUES (126, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.saveProduct successfully', '2025-03-22 10:21:18');
INSERT INTO `log` VALUES (127, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.listProducts successfully', '2025-03-22 10:21:18');
INSERT INTO `log` VALUES (128, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.listItems successfully', '2025-03-22 10:21:25');
INSERT INTO `log` VALUES (129, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.deleteItem successfully', '2025-03-22 10:21:31');
INSERT INTO `log` VALUES (130, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.listItems successfully', '2025-03-22 10:21:31');
INSERT INTO `log` VALUES (131, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.newItemForm successfully', '2025-03-22 10:21:33');
INSERT INTO `log` VALUES (132, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.saveItem successfully', '2025-03-22 10:21:53');
INSERT INTO `log` VALUES (133, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.listItems successfully', '2025-03-22 10:21:53');
INSERT INTO `log` VALUES (134, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.index successfully', '2025-03-22 16:21:40');
INSERT INTO `log` VALUES (135, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.signOn successfully', '2025-03-22 16:21:44');
INSERT INTO `log` VALUES (136, 'Visitor', 'invoke org.csu.petstore.controller.CaptchaController.getCaptcha successfully', '2025-03-22 16:21:45');
INSERT INTO `log` VALUES (137, 'Visitor', 'invoke org.csu.petstore.controller.AdminController.showindex successfully', '2025-03-22 16:21:53');
INSERT INTO `log` VALUES (138, 'admin@admin', 'invoke org.csu.petstore.controller.AdminController.getAdmin successfully', '2025-03-22 16:21:58');
INSERT INTO `log` VALUES (139, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.listProducts successfully', '2025-03-22 16:22:10');
INSERT INTO `log` VALUES (140, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.deleteProduct successfully', '2025-03-22 16:22:18');
INSERT INTO `log` VALUES (141, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.listProducts successfully', '2025-03-22 16:22:19');
INSERT INTO `log` VALUES (142, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.listItems successfully', '2025-03-22 16:22:20');
INSERT INTO `log` VALUES (143, 'admin@admin', 'invoke org.csu.petstore.controller.AdminController.adminIndex successfully', '2025-03-22 16:22:22');
INSERT INTO `log` VALUES (144, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.listProducts successfully', '2025-03-22 16:22:24');
INSERT INTO `log` VALUES (145, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.newProductForm successfully', '2025-03-22 16:22:25');
INSERT INTO `log` VALUES (146, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.saveProduct successfully', '2025-03-22 16:22:44');
INSERT INTO `log` VALUES (147, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.listProducts successfully', '2025-03-22 16:22:44');
INSERT INTO `log` VALUES (148, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.index successfully', '2025-03-22 16:23:33');
INSERT INTO `log` VALUES (149, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.signOn successfully', '2025-03-22 16:23:38');
INSERT INTO `log` VALUES (150, 'Visitor', 'invoke org.csu.petstore.controller.CaptchaController.getCaptcha successfully', '2025-03-22 16:23:38');
INSERT INTO `log` VALUES (151, 'admin@admin', 'invoke org.csu.petstore.controller.AdminController.showindex successfully', '2025-03-22 16:23:40');
INSERT INTO `log` VALUES (152, 'admin@admin', 'invoke org.csu.petstore.controller.AdminController.getAdmin successfully', '2025-03-22 16:23:45');
INSERT INTO `log` VALUES (153, 'Visitor', 'invoke org.csu.petstore.controller.AdminController.logout successfully', '2025-03-22 16:23:47');
INSERT INTO `log` VALUES (154, 'admin@admin', 'invoke org.csu.petstore.controller.AdminController.showindex successfully', '2025-03-22 16:23:47');
INSERT INTO `log` VALUES (155, 'admin@admin', 'invoke org.csu.petstore.controller.AdminController.showindex successfully', '2025-03-22 16:23:56');
INSERT INTO `log` VALUES (156, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.viewCategory successfully', '2025-03-22 16:24:01');
INSERT INTO `log` VALUES (157, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.viewProduct successfully', '2025-03-22 16:24:02');
INSERT INTO `log` VALUES (158, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.signOn successfully', '2025-03-22 16:24:12');
INSERT INTO `log` VALUES (159, 'Visitor', 'invoke org.csu.petstore.controller.CaptchaController.getCaptcha successfully', '2025-03-22 16:24:13');
INSERT INTO `log` VALUES (160, 'admin@admin', 'invoke org.csu.petstore.controller.AdminController.showindex successfully', '2025-03-22 16:24:15');
INSERT INTO `log` VALUES (161, 'admin@admin', 'invoke org.csu.petstore.controller.AdminController.getAdmin successfully', '2025-03-22 16:24:22');
INSERT INTO `log` VALUES (162, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.listProducts successfully', '2025-03-22 16:24:23');
INSERT INTO `log` VALUES (163, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.listItems successfully', '2025-03-22 16:24:25');
INSERT INTO `log` VALUES (164, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.listProducts successfully', '2025-03-22 16:24:28');
INSERT INTO `log` VALUES (165, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.newProductForm successfully', '2025-03-22 16:24:31');
INSERT INTO `log` VALUES (166, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.listProducts successfully', '2025-03-22 16:24:37');
INSERT INTO `log` VALUES (167, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.listItems successfully', '2025-03-22 16:24:38');
INSERT INTO `log` VALUES (168, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.newItemForm successfully', '2025-03-22 16:24:39');
INSERT INTO `log` VALUES (169, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.saveItem successfully', '2025-03-22 16:24:54');
INSERT INTO `log` VALUES (170, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.listItems successfully', '2025-03-22 16:24:55');
INSERT INTO `log` VALUES (171, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.updateInventory successfully', '2025-03-22 16:25:05');
INSERT INTO `log` VALUES (172, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.listItems successfully', '2025-03-22 16:25:05');
INSERT INTO `log` VALUES (173, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.index successfully', '2025-03-22 16:25:20');
INSERT INTO `log` VALUES (174, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.viewCategory successfully', '2025-03-22 16:25:30');
INSERT INTO `log` VALUES (175, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.viewProduct successfully', '2025-03-22 16:25:31');
INSERT INTO `log` VALUES (176, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.viewItem successfully', '2025-03-22 16:25:34');
INSERT INTO `log` VALUES (177, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.viewCategory successfully', '2025-03-22 16:25:54');
INSERT INTO `log` VALUES (178, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.viewProduct successfully', '2025-03-22 16:25:56');
INSERT INTO `log` VALUES (179, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.viewProduct successfully', '2025-03-22 16:26:02');
INSERT INTO `log` VALUES (180, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.index successfully', '2025-03-22 16:26:24');
INSERT INTO `log` VALUES (181, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.viewCategory successfully', '2025-03-22 16:26:27');
INSERT INTO `log` VALUES (182, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.viewProduct successfully', '2025-03-22 16:26:28');
INSERT INTO `log` VALUES (183, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.viewItem successfully', '2025-03-22 16:26:30');
INSERT INTO `log` VALUES (184, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.signOn successfully', '2025-03-22 16:26:41');
INSERT INTO `log` VALUES (185, 'Visitor', 'invoke org.csu.petstore.controller.CaptchaController.getCaptcha successfully', '2025-03-22 16:26:42');
INSERT INTO `log` VALUES (186, 'Visitor', 'invoke org.csu.petstore.controller.AdminController.showindex successfully', '2025-03-22 16:26:44');
INSERT INTO `log` VALUES (187, 'admin@admin', 'invoke org.csu.petstore.controller.AdminController.getAdmin successfully', '2025-03-22 16:26:48');
INSERT INTO `log` VALUES (188, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.getOrders successfully', '2025-03-22 16:26:50');
INSERT INTO `log` VALUES (189, 'admin@admin', 'invoke org.csu.petstore.controller.AdminController.adminIndex successfully', '2025-03-22 16:27:03');
INSERT INTO `log` VALUES (190, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.listProducts successfully', '2025-03-22 16:27:05');
INSERT INTO `log` VALUES (191, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.deleteProduct successfully', '2025-03-22 16:27:09');
INSERT INTO `log` VALUES (192, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.listProducts successfully', '2025-03-22 16:27:09');
INSERT INTO `log` VALUES (193, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.listItems successfully', '2025-03-22 16:27:10');
INSERT INTO `log` VALUES (194, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.index successfully', '2025-03-22 16:28:24');
INSERT INTO `log` VALUES (195, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.viewCategory successfully', '2025-03-22 16:28:27');
INSERT INTO `log` VALUES (196, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.viewProduct successfully', '2025-03-22 16:28:29');
INSERT INTO `log` VALUES (197, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.viewItem successfully', '2025-03-22 16:28:30');
INSERT INTO `log` VALUES (198, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.viewItem successfully', '2025-03-22 16:28:34');
INSERT INTO `log` VALUES (199, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.viewItem successfully', '2025-03-22 16:28:37');
INSERT INTO `log` VALUES (200, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.viewItem successfully', '2025-03-22 16:28:39');
INSERT INTO `log` VALUES (201, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.viewItem successfully', '2025-03-22 16:32:44');
INSERT INTO `log` VALUES (202, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.signOn successfully', '2025-03-22 16:33:43');
INSERT INTO `log` VALUES (203, 'Visitor', 'invoke org.csu.petstore.controller.CaptchaController.getCaptcha successfully', '2025-03-22 16:33:43');
INSERT INTO `log` VALUES (204, 'Visitor', 'invoke org.csu.petstore.controller.AdminController.showindex successfully', '2025-03-22 16:33:45');
INSERT INTO `log` VALUES (205, 'admin@admin', 'invoke org.csu.petstore.controller.AdminController.getAdmin successfully', '2025-03-22 16:33:52');
INSERT INTO `log` VALUES (206, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.listProducts successfully', '2025-03-22 16:34:00');
INSERT INTO `log` VALUES (207, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.listProducts successfully', '2025-03-22 16:34:11');
INSERT INTO `log` VALUES (208, 'admin@admin', 'invoke org.csu.petstore.controller.AdminController.adminIndex successfully', '2025-03-22 16:34:12');
INSERT INTO `log` VALUES (209, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.listProducts successfully', '2025-03-22 16:34:19');
INSERT INTO `log` VALUES (210, 'admin@admin', 'invoke org.csu.petstore.controller.AdminController.adminIndex successfully', '2025-03-22 16:34:25');
INSERT INTO `log` VALUES (211, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.getOrders successfully', '2025-03-22 16:34:29');
INSERT INTO `log` VALUES (212, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.deleteOrder successfully', '2025-03-22 16:35:30');
INSERT INTO `log` VALUES (213, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.getOrders successfully', '2025-03-22 16:35:30');
INSERT INTO `log` VALUES (214, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.deleteOrder successfully', '2025-03-22 16:35:54');
INSERT INTO `log` VALUES (215, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.getOrders successfully', '2025-03-22 16:35:54');
INSERT INTO `log` VALUES (216, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.deleteOrder successfully', '2025-03-22 16:36:40');
INSERT INTO `log` VALUES (217, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.getOrders successfully', '2025-03-22 16:36:40');
INSERT INTO `log` VALUES (218, 'admin@admin', 'invoke org.csu.petstore.controller.AdminController.adminIndex successfully', '2025-03-22 16:37:12');
INSERT INTO `log` VALUES (219, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.listProducts successfully', '2025-03-22 16:37:19');
INSERT INTO `log` VALUES (220, 'admin@admin', 'invoke org.csu.petstore.controller.AdminController.adminIndex successfully', '2025-03-22 16:37:27');
INSERT INTO `log` VALUES (221, 'admin@admin', 'invoke org.csu.petstore.controller.admin.ProductManagementController.listProducts successfully', '2025-03-22 16:37:30');
INSERT INTO `log` VALUES (222, 'admin@admin', 'invoke org.csu.petstore.controller.AdminController.adminIndex successfully', '2025-03-22 16:37:36');
INSERT INTO `log` VALUES (223, 'admin@admin', 'invoke org.csu.petstore.controller.AccountController.listAccounts successfully', '2025-03-22 16:37:38');
INSERT INTO `log` VALUES (224, 'admin@admin', 'invoke org.csu.petstore.controller.AdminController.adminIndex successfully', '2025-03-22 16:38:36');
INSERT INTO `log` VALUES (225, 'admin@admin', 'invoke org.csu.petstore.controller.AccountController.listAccounts successfully', '2025-03-22 16:38:37');
INSERT INTO `log` VALUES (226, 'admin@admin', 'invoke org.csu.petstore.controller.AccountController.listAccounts successfully', '2025-03-22 16:38:40');
INSERT INTO `log` VALUES (227, 'admin@admin', 'invoke org.csu.petstore.controller.AccountController.listAccounts successfully', '2025-03-22 16:38:44');
INSERT INTO `log` VALUES (228, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.index successfully', '2025-03-22 16:39:06');
INSERT INTO `log` VALUES (229, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.signOn successfully', '2025-03-22 16:39:12');
INSERT INTO `log` VALUES (230, 'Visitor', 'invoke org.csu.petstore.controller.CaptchaController.getCaptcha successfully', '2025-03-22 16:39:12');
INSERT INTO `log` VALUES (231, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.signOnSubmit successfully', '2025-03-22 16:39:15');
INSERT INTO `log` VALUES (232, 'Visitor', 'invoke org.csu.petstore.controller.CaptchaController.getCaptcha successfully', '2025-03-22 16:39:15');
INSERT INTO `log` VALUES (233, 'admin@admin', 'invoke org.csu.petstore.controller.AdminController.showindex successfully', '2025-03-22 16:39:18');
INSERT INTO `log` VALUES (234, 'admin@admin', 'invoke org.csu.petstore.controller.AdminController.getAdmin successfully', '2025-03-22 16:39:25');
INSERT INTO `log` VALUES (235, 'admin@admin', 'invoke org.csu.petstore.controller.AccountController.listAccounts successfully', '2025-03-22 16:39:26');
INSERT INTO `log` VALUES (236, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.index successfully', '2025-03-22 16:40:07');
INSERT INTO `log` VALUES (237, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.signOn successfully', '2025-03-22 16:40:10');
INSERT INTO `log` VALUES (238, 'Visitor', 'invoke org.csu.petstore.controller.CaptchaController.getCaptcha successfully', '2025-03-22 16:40:10');
INSERT INTO `log` VALUES (239, 'Visitor', 'invoke org.csu.petstore.controller.AdminController.showindex successfully', '2025-03-22 16:40:12');
INSERT INTO `log` VALUES (240, 'admin@admin', 'invoke org.csu.petstore.controller.AdminController.getAdmin successfully', '2025-03-22 16:40:18');
INSERT INTO `log` VALUES (241, 'admin@admin', 'invoke org.csu.petstore.controller.AccountController.listAccounts successfully', '2025-03-22 16:40:19');
INSERT INTO `log` VALUES (242, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.index successfully', '2025-03-22 16:41:42');
INSERT INTO `log` VALUES (243, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.signOn successfully', '2025-03-22 16:41:45');
INSERT INTO `log` VALUES (244, 'Visitor', 'invoke org.csu.petstore.controller.CaptchaController.getCaptcha successfully', '2025-03-22 16:41:45');
INSERT INTO `log` VALUES (245, 'account@qwe', 'invoke org.csu.petstore.controller.AccountController.signOnSubmit successfully', '2025-03-22 16:41:55');
INSERT INTO `log` VALUES (246, 'admin@admin', 'invoke org.csu.petstore.controller.AccountController.viewAccount successfully', '2025-03-22 16:41:58');
INSERT INTO `log` VALUES (247, 'account@qwe', 'invoke org.csu.petstore.controller.CatalogController.viewCategory successfully', '2025-03-22 16:42:00');
INSERT INTO `log` VALUES (248, 'account@qwe', 'invoke org.csu.petstore.controller.CatalogController.viewProduct successfully', '2025-03-22 16:42:01');
INSERT INTO `log` VALUES (249, 'account@qwe', 'invoke org.csu.petstore.controller.CartController.addItemToCart successfully', '2025-03-22 16:42:02');
INSERT INTO `log` VALUES (250, 'account@qwe', 'invoke org.csu.petstore.controller.OrderController.newOrder successfully', '2025-03-22 16:42:05');
INSERT INTO `log` VALUES (251, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.index successfully', '2025-03-22 16:45:10');
INSERT INTO `log` VALUES (252, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.signOn successfully', '2025-03-22 16:45:13');
INSERT INTO `log` VALUES (253, 'Visitor', 'invoke org.csu.petstore.controller.CaptchaController.getCaptcha successfully', '2025-03-22 16:45:14');
INSERT INTO `log` VALUES (254, 'account@qwe', 'invoke org.csu.petstore.controller.AccountController.signOnSubmit successfully', '2025-03-22 16:45:24');
INSERT INTO `log` VALUES (255, 'account@qwe', 'invoke org.csu.petstore.controller.CatalogController.viewCategory successfully', '2025-03-22 16:45:29');
INSERT INTO `log` VALUES (256, 'account@qwe', 'invoke org.csu.petstore.controller.CatalogController.viewProduct successfully', '2025-03-22 16:45:31');
INSERT INTO `log` VALUES (257, 'account@qwe', 'invoke org.csu.petstore.controller.CartController.addItemToCart successfully', '2025-03-22 16:45:32');
INSERT INTO `log` VALUES (258, 'account@qwe', 'invoke org.csu.petstore.controller.OrderController.newOrder successfully', '2025-03-22 16:45:34');
INSERT INTO `log` VALUES (259, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.index successfully', '2025-03-22 16:58:53');
INSERT INTO `log` VALUES (260, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.signOn successfully', '2025-03-22 16:58:59');
INSERT INTO `log` VALUES (261, 'Visitor', 'invoke org.csu.petstore.controller.CaptchaController.getCaptcha successfully', '2025-03-22 16:58:59');
INSERT INTO `log` VALUES (262, 'account@qwe', 'invoke org.csu.petstore.controller.AccountController.signOnSubmit successfully', '2025-03-22 16:59:09');
INSERT INTO `log` VALUES (263, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.index   Desc: ', '2025-03-22 17:03:14');
INSERT INTO `log` VALUES (264, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.signOn   Desc: ', '2025-03-22 17:03:18');
INSERT INTO `log` VALUES (265, 'Visitor', 'invoke org.csu.petstore.controller.CaptchaController.getCaptcha   Desc: ', '2025-03-22 17:03:19');
INSERT INTO `log` VALUES (266, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.signOnSubmit   Desc: ', '2025-03-22 17:03:27');
INSERT INTO `log` VALUES (267, 'Visitor', 'invoke org.csu.petstore.controller.CaptchaController.getCaptcha   Desc: ', '2025-03-22 17:03:27');
INSERT INTO `log` VALUES (268, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.signOnSubmit   Desc: ', '2025-03-22 17:03:38');
INSERT INTO `log` VALUES (269, 'Visitor', 'invoke org.csu.petstore.controller.CaptchaController.getCaptcha   Desc: ', '2025-03-22 17:03:38');
INSERT INTO `log` VALUES (270, 'account@qwe', 'invoke org.csu.petstore.controller.AccountController.signOnSubmit   Desc: ', '2025-03-22 17:03:52');
INSERT INTO `log` VALUES (271, 'account@qwe', 'invoke org.csu.petstore.controller.OrderController.listOrder   Desc: ', '2025-03-22 17:03:54');
INSERT INTO `log` VALUES (272, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.index successfully', '2025-03-22 17:05:01');
INSERT INTO `log` VALUES (273, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.index successfully', '2025-03-22 17:05:02');
INSERT INTO `log` VALUES (274, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.signOn successfully', '2025-03-22 17:05:08');
INSERT INTO `log` VALUES (275, 'Visitor', 'invoke org.csu.petstore.controller.CaptchaController.getCaptcha successfully', '2025-03-22 17:05:09');
INSERT INTO `log` VALUES (276, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.signOnSubmit successfully', '2025-03-22 17:05:19');
INSERT INTO `log` VALUES (277, 'Visitor', 'invoke org.csu.petstore.controller.CaptchaController.getCaptcha successfully', '2025-03-22 17:05:19');
INSERT INTO `log` VALUES (278, 'account@qwe', 'invoke org.csu.petstore.controller.AccountController.signOnSubmit successfully', '2025-03-22 17:06:02');
INSERT INTO `log` VALUES (279, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.index successfully', '2025-03-22 17:11:24');
INSERT INTO `log` VALUES (280, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.index successfully', '2025-03-22 17:11:38');
INSERT INTO `log` VALUES (281, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.signOn successfully', '2025-03-22 17:11:41');
INSERT INTO `log` VALUES (282, 'Visitor', 'invoke org.csu.petstore.controller.CaptchaController.getCaptcha successfully', '2025-03-22 17:11:42');
INSERT INTO `log` VALUES (283, 'account@qwe', 'invoke org.csu.petstore.controller.AccountController.signOnSubmit successfully', '2025-03-22 17:11:51');
INSERT INTO `log` VALUES (284, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.index successfully', '2025-03-22 17:20:45');
INSERT INTO `log` VALUES (285, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.signOn successfully', '2025-03-22 17:20:48');
INSERT INTO `log` VALUES (286, 'Visitor', 'invoke org.csu.petstore.controller.CaptchaController.getCaptcha successfully', '2025-03-22 17:20:49');
INSERT INTO `log` VALUES (287, 'account@qwe', 'invoke org.csu.petstore.controller.AccountController.signOnSubmit successfully', '2025-03-22 17:21:00');
INSERT INTO `log` VALUES (288, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.index successfully', '2025-03-22 17:33:17');
INSERT INTO `log` VALUES (289, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.signOn successfully', '2025-03-22 17:33:20');
INSERT INTO `log` VALUES (290, 'Visitor', 'invoke org.csu.petstore.controller.CaptchaController.getCaptcha successfully', '2025-03-22 17:33:21');
INSERT INTO `log` VALUES (291, 'Visitor', 'invoke org.csu.petstore.controller.AdminController.showindex successfully', '2025-03-22 17:33:26');
INSERT INTO `log` VALUES (292, 'admin@admin', 'invoke org.csu.petstore.controller.AdminController.getAdmin successfully', '2025-03-22 17:33:30');
INSERT INTO `log` VALUES (293, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.getOrders successfully', '2025-03-22 17:33:38');
INSERT INTO `log` VALUES (294, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.index successfully', '2025-03-22 17:38:08');
INSERT INTO `log` VALUES (295, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.signOn successfully', '2025-03-22 17:38:16');
INSERT INTO `log` VALUES (296, 'Visitor', 'invoke org.csu.petstore.controller.CaptchaController.getCaptcha successfully', '2025-03-22 17:38:16');
INSERT INTO `log` VALUES (297, 'account@qwe', 'invoke org.csu.petstore.controller.AccountController.signOnSubmit successfully', '2025-03-22 17:38:25');
INSERT INTO `log` VALUES (298, 'account@qwe', 'invoke org.csu.petstore.controller.CatalogController.index successfully', '2025-03-22 17:41:00');
INSERT INTO `log` VALUES (299, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.signOut successfully', '2025-03-22 17:41:06');
INSERT INTO `log` VALUES (300, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.newAccountForm successfully', '2025-03-22 17:41:07');
INSERT INTO `log` VALUES (301, 'Visitor', 'invoke org.csu.petstore.controller.CaptchaController.getCaptcha successfully', '2025-03-22 17:41:08');
INSERT INTO `log` VALUES (302, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.signOn successfully', '2025-03-22 17:41:10');
INSERT INTO `log` VALUES (303, 'Visitor', 'invoke org.csu.petstore.controller.CaptchaController.getCaptcha successfully', '2025-03-22 17:41:10');
INSERT INTO `log` VALUES (304, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.newAccountForm successfully', '2025-03-22 17:41:12');
INSERT INTO `log` VALUES (305, 'Visitor', 'invoke org.csu.petstore.controller.CaptchaController.getCaptcha successfully', '2025-03-22 17:41:12');
INSERT INTO `log` VALUES (306, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.signOn successfully', '2025-03-22 17:41:27');
INSERT INTO `log` VALUES (307, 'Visitor', 'invoke org.csu.petstore.controller.CaptchaController.getCaptcha successfully', '2025-03-22 17:41:27');
INSERT INTO `log` VALUES (308, 'Visitor', 'invoke org.csu.petstore.controller.AdminController.showindex successfully', '2025-03-22 17:41:34');
INSERT INTO `log` VALUES (309, 'admin@admin', 'invoke org.csu.petstore.controller.AdminController.getAdmin successfully', '2025-03-22 17:41:38');
INSERT INTO `log` VALUES (310, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.getOrders successfully', '2025-03-22 17:41:40');
INSERT INTO `log` VALUES (311, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.index successfully', '2025-03-22 17:43:27');
INSERT INTO `log` VALUES (312, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.signOn successfully', '2025-03-22 17:43:31');
INSERT INTO `log` VALUES (313, 'Visitor', 'invoke org.csu.petstore.controller.CaptchaController.getCaptcha successfully', '2025-03-22 17:43:31');
INSERT INTO `log` VALUES (314, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.signOnSubmit successfully', '2025-03-22 17:43:43');
INSERT INTO `log` VALUES (315, 'Visitor', 'invoke org.csu.petstore.controller.CaptchaController.getCaptcha successfully', '2025-03-22 17:43:43');
INSERT INTO `log` VALUES (316, 'account@qwe', 'invoke org.csu.petstore.controller.AccountController.signOnSubmit successfully', '2025-03-22 17:43:53');
INSERT INTO `log` VALUES (317, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.index successfully', '2025-03-22 17:44:33');
INSERT INTO `log` VALUES (318, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.signOn successfully', '2025-03-22 17:44:37');
INSERT INTO `log` VALUES (319, 'Visitor', 'invoke org.csu.petstore.controller.CaptchaController.getCaptcha successfully', '2025-03-22 17:44:38');
INSERT INTO `log` VALUES (320, 'account@qwe', 'invoke org.csu.petstore.controller.AccountController.signOnSubmit successfully', '2025-03-22 17:44:47');
INSERT INTO `log` VALUES (321, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.index successfully', '2025-03-22 17:47:09');
INSERT INTO `log` VALUES (322, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.signOn successfully', '2025-03-22 17:47:12');
INSERT INTO `log` VALUES (323, 'Visitor', 'invoke org.csu.petstore.controller.CaptchaController.getCaptcha successfully', '2025-03-22 17:47:12');
INSERT INTO `log` VALUES (324, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.index successfully', '2025-03-22 17:49:22');
INSERT INTO `log` VALUES (325, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.signOn successfully', '2025-03-22 17:49:35');
INSERT INTO `log` VALUES (326, 'Visitor', 'invoke org.csu.petstore.controller.CaptchaController.getCaptcha successfully', '2025-03-22 17:49:36');
INSERT INTO `log` VALUES (327, 'account@qwe', 'invoke org.csu.petstore.controller.AccountController.signOnSubmit successfully', '2025-03-22 17:49:46');
INSERT INTO `log` VALUES (328, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.index successfully', '2025-03-22 18:49:12');
INSERT INTO `log` VALUES (329, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.signOn successfully', '2025-03-22 18:49:17');
INSERT INTO `log` VALUES (330, 'Visitor', 'invoke org.csu.petstore.controller.CaptchaController.getCaptcha successfully', '2025-03-22 18:49:19');
INSERT INTO `log` VALUES (331, 'account@qwe', 'invoke org.csu.petstore.controller.AccountController.signOnSubmit successfully', '2025-03-22 18:49:25');
INSERT INTO `log` VALUES (332, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.index successfully', '2025-03-22 18:52:31');
INSERT INTO `log` VALUES (333, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.signOn successfully', '2025-03-22 18:52:35');
INSERT INTO `log` VALUES (334, 'Visitor', 'invoke org.csu.petstore.controller.CaptchaController.getCaptcha successfully', '2025-03-22 18:52:36');
INSERT INTO `log` VALUES (335, 'account@qwe', 'invoke org.csu.petstore.controller.AccountController.signOnSubmit successfully', '2025-03-22 18:52:45');
INSERT INTO `log` VALUES (336, 'account@qwe', 'invoke org.csu.petstore.controller.OrderController.listOrder successfully', '2025-03-22 18:52:48');
INSERT INTO `log` VALUES (337, 'account@qwe', 'invoke org.csu.petstore.controller.CartController.viewCart successfully', '2025-03-22 18:52:54');
INSERT INTO `log` VALUES (338, 'account@qwe', 'invoke org.csu.petstore.controller.OrderController.newOrder successfully', '2025-03-22 18:52:57');
INSERT INTO `log` VALUES (339, 'account@qwe', 'invoke org.csu.petstore.controller.OrderController.confirmOrder successfully', '2025-03-22 18:52:59');
INSERT INTO `log` VALUES (340, 'account@qwe', 'invoke org.csu.petstore.controller.OrderController.viewOrder successfully', '2025-03-22 18:53:02');
INSERT INTO `log` VALUES (341, 'account@qwe', 'invoke org.csu.petstore.controller.CatalogController.index successfully', '2025-03-22 18:53:09');
INSERT INTO `log` VALUES (342, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.signOut successfully', '2025-03-22 18:53:11');
INSERT INTO `log` VALUES (343, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.signOn successfully', '2025-03-22 18:53:13');
INSERT INTO `log` VALUES (344, 'Visitor', 'invoke org.csu.petstore.controller.CaptchaController.getCaptcha successfully', '2025-03-22 18:53:13');
INSERT INTO `log` VALUES (345, 'Visitor', 'invoke org.csu.petstore.controller.AdminController.showindex successfully', '2025-03-22 18:53:21');
INSERT INTO `log` VALUES (346, 'admin@admin', 'invoke org.csu.petstore.controller.AdminController.getAdmin successfully', '2025-03-22 18:53:27');
INSERT INTO `log` VALUES (347, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.getOrders successfully', '2025-03-22 18:53:28');
INSERT INTO `log` VALUES (348, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.index successfully', '2025-03-22 18:58:17');
INSERT INTO `log` VALUES (349, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.signOn successfully', '2025-03-22 18:58:23');
INSERT INTO `log` VALUES (350, 'Visitor', 'invoke org.csu.petstore.controller.CaptchaController.getCaptcha successfully', '2025-03-22 18:58:24');
INSERT INTO `log` VALUES (351, 'Visitor', 'invoke org.csu.petstore.controller.AdminController.showindex successfully', '2025-03-22 18:58:27');
INSERT INTO `log` VALUES (352, 'admin@admin', 'invoke org.csu.petstore.controller.AdminController.getAdmin successfully', '2025-03-22 18:58:32');
INSERT INTO `log` VALUES (353, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.getOrders successfully', '2025-03-22 18:58:33');
INSERT INTO `log` VALUES (354, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.index successfully', '2025-03-22 19:01:49');
INSERT INTO `log` VALUES (355, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.index successfully', '2025-03-22 19:01:48');
INSERT INTO `log` VALUES (356, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.signOn successfully', '2025-03-22 19:01:54');
INSERT INTO `log` VALUES (357, 'Visitor', 'invoke org.csu.petstore.controller.CaptchaController.getCaptcha successfully', '2025-03-22 19:01:55');
INSERT INTO `log` VALUES (358, 'Visitor', 'invoke org.csu.petstore.controller.AdminController.showindex successfully', '2025-03-22 19:01:57');
INSERT INTO `log` VALUES (359, 'admin@admin', 'invoke org.csu.petstore.controller.AdminController.getAdmin successfully', '2025-03-22 19:02:02');
INSERT INTO `log` VALUES (360, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.getOrders successfully', '2025-03-22 19:02:03');
INSERT INTO `log` VALUES (361, 'admin@admin', 'invoke org.csu.petstore.controller.AdminController.adminIndex successfully', '2025-03-22 19:02:11');
INSERT INTO `log` VALUES (362, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.index successfully', '2025-03-22 19:02:17');
INSERT INTO `log` VALUES (363, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.signOn successfully', '2025-03-22 19:02:19');
INSERT INTO `log` VALUES (364, 'Visitor', 'invoke org.csu.petstore.controller.CaptchaController.getCaptcha successfully', '2025-03-22 19:02:20');
INSERT INTO `log` VALUES (365, 'account@qwe', 'invoke org.csu.petstore.controller.AccountController.signOnSubmit successfully', '2025-03-22 19:02:30');
INSERT INTO `log` VALUES (366, 'admin@admin', 'invoke org.csu.petstore.controller.AccountController.viewAccount successfully', '2025-03-22 19:02:32');
INSERT INTO `log` VALUES (367, 'account@qwe', 'invoke org.csu.petstore.controller.CatalogController.viewCategory successfully', '2025-03-22 19:02:34');
INSERT INTO `log` VALUES (368, 'account@qwe', 'invoke org.csu.petstore.controller.CatalogController.viewProduct successfully', '2025-03-22 19:02:36');
INSERT INTO `log` VALUES (369, 'account@qwe', 'invoke org.csu.petstore.controller.CartController.addItemToCart successfully', '2025-03-22 19:02:38');
INSERT INTO `log` VALUES (370, 'account@qwe', 'invoke org.csu.petstore.controller.OrderController.newOrder successfully', '2025-03-22 19:02:40');
INSERT INTO `log` VALUES (371, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.index successfully', '2025-03-22 19:05:38');
INSERT INTO `log` VALUES (372, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.signOn successfully', '2025-03-22 19:05:41');
INSERT INTO `log` VALUES (373, 'Visitor', 'invoke org.csu.petstore.controller.CaptchaController.getCaptcha successfully', '2025-03-22 19:05:42');
INSERT INTO `log` VALUES (374, 'Visitor', 'invoke org.csu.petstore.controller.AdminController.showindex successfully', '2025-03-22 19:05:48');
INSERT INTO `log` VALUES (375, 'admin@admin', 'invoke org.csu.petstore.controller.AdminController.getAdmin successfully', '2025-03-22 19:05:54');
INSERT INTO `log` VALUES (376, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.getOrders successfully', '2025-03-22 19:05:55');
INSERT INTO `log` VALUES (377, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.index successfully', '2025-03-22 19:06:12');
INSERT INTO `log` VALUES (378, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.signOn successfully', '2025-03-22 19:06:14');
INSERT INTO `log` VALUES (379, 'Visitor', 'invoke org.csu.petstore.controller.CaptchaController.getCaptcha successfully', '2025-03-22 19:06:14');
INSERT INTO `log` VALUES (380, 'account@qwe', 'invoke org.csu.petstore.controller.AccountController.signOnSubmit successfully', '2025-03-22 19:06:22');
INSERT INTO `log` VALUES (381, 'admin@admin', 'invoke org.csu.petstore.controller.AccountController.viewAccount successfully', '2025-03-22 19:06:28');
INSERT INTO `log` VALUES (382, 'admin@admin', 'invoke org.csu.petstore.controller.AccountController.viewAccount successfully', '2025-03-22 19:06:29');
INSERT INTO `log` VALUES (383, 'admin@admin', 'invoke org.csu.petstore.controller.AccountController.viewAccount successfully', '2025-03-22 19:06:29');
INSERT INTO `log` VALUES (384, 'account@qwe', 'invoke org.csu.petstore.controller.CatalogController.viewCategory successfully', '2025-03-22 19:06:29');
INSERT INTO `log` VALUES (385, 'account@qwe', 'invoke org.csu.petstore.controller.CatalogController.viewProduct successfully', '2025-03-22 19:06:31');
INSERT INTO `log` VALUES (386, 'account@qwe', 'invoke org.csu.petstore.controller.CartController.addItemToCart successfully', '2025-03-22 19:06:33');
INSERT INTO `log` VALUES (387, 'account@qwe', 'invoke org.csu.petstore.controller.OrderController.newOrder successfully', '2025-03-22 19:06:39');
INSERT INTO `log` VALUES (388, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.index successfully', '2025-03-22 19:07:52');
INSERT INTO `log` VALUES (389, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.index successfully', '2025-03-22 19:08:21');
INSERT INTO `log` VALUES (390, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.index successfully', '2025-03-22 19:08:58');
INSERT INTO `log` VALUES (391, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.signOn successfully', '2025-03-22 19:09:02');
INSERT INTO `log` VALUES (392, 'Visitor', 'invoke org.csu.petstore.controller.CaptchaController.getCaptcha successfully', '2025-03-22 19:09:03');
INSERT INTO `log` VALUES (393, 'account@qwe', 'invoke org.csu.petstore.controller.AccountController.signOnSubmit successfully', '2025-03-22 19:09:12');
INSERT INTO `log` VALUES (394, 'account@qwe', 'invoke org.csu.petstore.controller.CatalogController.viewCategory successfully', '2025-03-22 19:09:32');
INSERT INTO `log` VALUES (395, 'account@qwe', 'invoke org.csu.petstore.controller.CatalogController.index successfully', '2025-03-22 19:10:21');
INSERT INTO `log` VALUES (396, 'account@qwe', 'invoke org.csu.petstore.controller.CatalogController.viewCategory successfully', '2025-03-22 19:10:25');
INSERT INTO `log` VALUES (397, 'account@qwe', 'invoke org.csu.petstore.controller.CatalogController.viewProduct successfully', '2025-03-22 19:11:34');
INSERT INTO `log` VALUES (398, 'account@qwe', 'invoke org.csu.petstore.controller.CartController.addItemToCart successfully', '2025-03-22 19:11:43');
INSERT INTO `log` VALUES (399, 'account@qwe', 'invoke org.csu.petstore.controller.OrderController.newOrder successfully', '2025-03-22 19:11:46');
INSERT INTO `log` VALUES (400, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.index successfully', '2025-03-22 19:15:00');
INSERT INTO `log` VALUES (401, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.signOn successfully', '2025-03-22 19:15:05');
INSERT INTO `log` VALUES (402, 'Visitor', 'invoke org.csu.petstore.controller.CaptchaController.getCaptcha successfully', '2025-03-22 19:15:05');
INSERT INTO `log` VALUES (403, 'account@qwe', 'invoke org.csu.petstore.controller.AccountController.signOnSubmit successfully', '2025-03-22 19:15:15');
INSERT INTO `log` VALUES (404, 'account@qwe', 'invoke org.csu.petstore.controller.CatalogController.viewCategory successfully', '2025-03-22 19:15:18');
INSERT INTO `log` VALUES (405, 'account@qwe', 'invoke org.csu.petstore.controller.CatalogController.viewCategory successfully', '2025-03-22 19:15:27');
INSERT INTO `log` VALUES (406, 'account@qwe', 'invoke org.csu.petstore.controller.CartController.viewCart successfully', '2025-03-22 19:15:40');
INSERT INTO `log` VALUES (407, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.index successfully', '2025-03-22 19:17:45');
INSERT INTO `log` VALUES (408, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.signOn successfully', '2025-03-22 19:17:48');
INSERT INTO `log` VALUES (409, 'Visitor', 'invoke org.csu.petstore.controller.CaptchaController.getCaptcha successfully', '2025-03-22 19:17:48');
INSERT INTO `log` VALUES (410, 'account@qwe', 'invoke org.csu.petstore.controller.AccountController.signOnSubmit successfully', '2025-03-22 19:18:03');
INSERT INTO `log` VALUES (411, 'account@qwe', 'invoke org.csu.petstore.controller.CartController.viewCart successfully', '2025-03-22 19:18:09');
INSERT INTO `log` VALUES (412, 'account@qwe', 'invoke org.csu.petstore.controller.OrderController.newOrder successfully', '2025-03-22 19:18:12');
INSERT INTO `log` VALUES (413, 'account@qwe', 'invoke org.csu.petstore.controller.OrderController.confirmOrder successfully', '2025-03-22 19:18:14');
INSERT INTO `log` VALUES (414, 'account@qwe', 'invoke org.csu.petstore.controller.OrderController.viewOrder successfully', '2025-03-22 19:18:18');
INSERT INTO `log` VALUES (415, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.signOut successfully', '2025-03-22 19:18:21');
INSERT INTO `log` VALUES (416, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.signOn successfully', '2025-03-22 19:18:23');
INSERT INTO `log` VALUES (417, 'Visitor', 'invoke org.csu.petstore.controller.CaptchaController.getCaptcha successfully', '2025-03-22 19:18:23');
INSERT INTO `log` VALUES (418, 'Visitor', 'invoke org.csu.petstore.controller.AdminController.showindex successfully', '2025-03-22 19:18:26');
INSERT INTO `log` VALUES (419, 'admin@admin', 'invoke org.csu.petstore.controller.AdminController.getAdmin successfully', '2025-03-22 19:18:32');
INSERT INTO `log` VALUES (420, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.getOrders successfully', '2025-03-22 19:18:38');
INSERT INTO `log` VALUES (421, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.index successfully', '2025-03-22 19:22:53');
INSERT INTO `log` VALUES (422, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.signOn successfully', '2025-03-22 19:22:58');
INSERT INTO `log` VALUES (423, 'Visitor', 'invoke org.csu.petstore.controller.CaptchaController.getCaptcha successfully', '2025-03-22 19:22:58');
INSERT INTO `log` VALUES (424, 'Visitor', 'invoke org.csu.petstore.controller.AdminController.showindex successfully', '2025-03-22 19:23:05');
INSERT INTO `log` VALUES (425, 'admin@admin', 'invoke org.csu.petstore.controller.AdminController.getAdmin successfully', '2025-03-22 19:23:14');
INSERT INTO `log` VALUES (426, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.getOrders successfully', '2025-03-22 19:25:34');
INSERT INTO `log` VALUES (427, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.index successfully', '2025-03-22 19:29:28');
INSERT INTO `log` VALUES (428, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.signOn successfully', '2025-03-22 19:29:31');
INSERT INTO `log` VALUES (429, 'Visitor', 'invoke org.csu.petstore.controller.CaptchaController.getCaptcha successfully', '2025-03-22 19:29:32');
INSERT INTO `log` VALUES (430, 'Visitor', 'invoke org.csu.petstore.controller.AdminController.showindex successfully', '2025-03-22 19:29:34');
INSERT INTO `log` VALUES (431, 'admin@admin', 'invoke org.csu.petstore.controller.AdminController.getAdmin successfully', '2025-03-22 19:29:42');
INSERT INTO `log` VALUES (432, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.getOrders successfully', '2025-03-22 19:29:43');
INSERT INTO `log` VALUES (433, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.index successfully', '2025-03-22 19:30:47');
INSERT INTO `log` VALUES (434, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.signOn successfully', '2025-03-22 19:31:12');
INSERT INTO `log` VALUES (435, 'Visitor', 'invoke org.csu.petstore.controller.CaptchaController.getCaptcha successfully', '2025-03-22 19:31:12');
INSERT INTO `log` VALUES (436, 'Visitor', 'invoke org.csu.petstore.controller.AdminController.showindex successfully', '2025-03-22 19:31:18');
INSERT INTO `log` VALUES (437, 'admin@admin', 'invoke org.csu.petstore.controller.AdminController.getAdmin successfully', '2025-03-22 19:31:26');
INSERT INTO `log` VALUES (438, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.getOrders successfully', '2025-03-22 19:31:40');
INSERT INTO `log` VALUES (439, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.index successfully', '2025-03-22 19:32:12');
INSERT INTO `log` VALUES (440, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.signOn successfully', '2025-03-22 19:32:16');
INSERT INTO `log` VALUES (441, 'Visitor', 'invoke org.csu.petstore.controller.CaptchaController.getCaptcha successfully', '2025-03-22 19:32:16');
INSERT INTO `log` VALUES (442, 'account@qwe', 'invoke org.csu.petstore.controller.AccountController.signOnSubmit successfully', '2025-03-22 19:32:26');
INSERT INTO `log` VALUES (443, 'account@qwe', 'invoke org.csu.petstore.controller.OrderController.listOrder successfully', '2025-03-22 19:32:30');
INSERT INTO `log` VALUES (444, 'admin@admin', 'invoke org.csu.petstore.controller.AccountController.viewAccount successfully', '2025-03-22 19:32:33');
INSERT INTO `log` VALUES (445, 'account@qwe', 'invoke org.csu.petstore.controller.CatalogController.viewCategory successfully', '2025-03-22 19:32:33');
INSERT INTO `log` VALUES (446, 'account@qwe', 'invoke org.csu.petstore.controller.CatalogController.viewProduct successfully', '2025-03-22 19:32:35');
INSERT INTO `log` VALUES (447, 'account@qwe', 'invoke org.csu.petstore.controller.CartController.addItemToCart successfully', '2025-03-22 19:32:38');
INSERT INTO `log` VALUES (448, 'account@qwe', 'invoke org.csu.petstore.controller.OrderController.newOrder successfully', '2025-03-22 19:32:40');
INSERT INTO `log` VALUES (449, 'account@qwe', 'invoke org.csu.petstore.controller.OrderController.confirmOrder successfully', '2025-03-22 19:32:43');
INSERT INTO `log` VALUES (450, 'account@qwe', 'invoke org.csu.petstore.controller.OrderController.viewOrder successfully', '2025-03-22 19:32:44');
INSERT INTO `log` VALUES (451, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.index successfully', '2025-03-22 19:35:24');
INSERT INTO `log` VALUES (452, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.signOn successfully', '2025-03-22 19:35:28');
INSERT INTO `log` VALUES (453, 'Visitor', 'invoke org.csu.petstore.controller.CaptchaController.getCaptcha successfully', '2025-03-22 19:35:29');
INSERT INTO `log` VALUES (454, 'account@qwe', 'invoke org.csu.petstore.controller.AccountController.signOnSubmit successfully', '2025-03-22 19:35:39');
INSERT INTO `log` VALUES (455, 'account@qwe', 'invoke org.csu.petstore.controller.CatalogController.viewCategory successfully', '2025-03-22 19:35:48');
INSERT INTO `log` VALUES (456, 'account@qwe', 'invoke org.csu.petstore.controller.CatalogController.viewProduct successfully', '2025-03-22 19:35:49');
INSERT INTO `log` VALUES (457, 'account@qwe', 'invoke org.csu.petstore.controller.CartController.addItemToCart successfully', '2025-03-22 19:35:51');
INSERT INTO `log` VALUES (458, 'account@qwe', 'invoke org.csu.petstore.controller.OrderController.newOrder successfully', '2025-03-22 19:35:53');
INSERT INTO `log` VALUES (459, 'account@qwe', 'invoke org.csu.petstore.controller.OrderController.confirmOrder successfully', '2025-03-22 19:35:56');
INSERT INTO `log` VALUES (460, 'account@qwe', 'invoke org.csu.petstore.controller.OrderController.viewOrder successfully', '2025-03-22 19:35:58');
INSERT INTO `log` VALUES (461, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.signOut successfully', '2025-03-22 19:36:05');
INSERT INTO `log` VALUES (462, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.signOn successfully', '2025-03-22 19:36:07');
INSERT INTO `log` VALUES (463, 'Visitor', 'invoke org.csu.petstore.controller.CaptchaController.getCaptcha successfully', '2025-03-22 19:36:07');
INSERT INTO `log` VALUES (464, 'Visitor', 'invoke org.csu.petstore.controller.AdminController.showindex successfully', '2025-03-22 19:36:10');
INSERT INTO `log` VALUES (465, 'admin@admin', 'invoke org.csu.petstore.controller.AdminController.getAdmin successfully', '2025-03-22 19:36:16');
INSERT INTO `log` VALUES (466, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.getOrders successfully', '2025-03-22 19:36:18');
INSERT INTO `log` VALUES (467, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.index successfully', '2025-03-23 08:56:45');
INSERT INTO `log` VALUES (468, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.index successfully', '2025-03-23 08:56:45');
INSERT INTO `log` VALUES (469, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.newAccountForm successfully', '2025-03-23 08:56:59');
INSERT INTO `log` VALUES (470, 'Visitor', 'invoke org.csu.petstore.controller.CaptchaController.getCaptcha successfully', '2025-03-23 08:57:00');
INSERT INTO `log` VALUES (471, 'account@nihao', 'invoke org.csu.petstore.controller.AccountController.newAccount successfully', '2025-03-23 08:58:07');
INSERT INTO `log` VALUES (472, 'account@nihao', 'invoke org.csu.petstore.controller.CatalogController.viewCategory successfully', '2025-03-23 08:58:30');
INSERT INTO `log` VALUES (473, 'account@nihao', 'invoke org.csu.petstore.controller.CatalogController.viewProduct successfully', '2025-03-23 08:58:32');
INSERT INTO `log` VALUES (474, 'account@nihao', 'invoke org.csu.petstore.controller.CartController.addItemToCart successfully', '2025-03-23 08:58:35');
INSERT INTO `log` VALUES (475, 'account@nihao', 'invoke org.csu.petstore.controller.OrderController.newOrder successfully', '2025-03-23 08:58:38');
INSERT INTO `log` VALUES (476, 'account@nihao', 'invoke org.csu.petstore.controller.OrderController.confirmOrder successfully', '2025-03-23 08:58:42');
INSERT INTO `log` VALUES (477, 'account@nihao', 'invoke org.csu.petstore.controller.OrderController.viewOrder successfully', '2025-03-23 08:58:45');
INSERT INTO `log` VALUES (478, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.signOut successfully', '2025-03-23 08:59:53');
INSERT INTO `log` VALUES (479, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.signOn successfully', '2025-03-23 08:59:55');
INSERT INTO `log` VALUES (480, 'Visitor', 'invoke org.csu.petstore.controller.CaptchaController.getCaptcha successfully', '2025-03-23 08:59:55');
INSERT INTO `log` VALUES (481, 'Visitor', 'invoke org.csu.petstore.controller.AdminController.showindex successfully', '2025-03-23 08:59:59');
INSERT INTO `log` VALUES (482, 'Visitor', 'invoke org.csu.petstore.controller.AdminController.getAdmin successfully', '2025-03-23 09:00:07');
INSERT INTO `log` VALUES (483, 'admin@admin', 'invoke org.csu.petstore.controller.AdminController.getAdmin successfully', '2025-03-23 09:00:12');
INSERT INTO `log` VALUES (484, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.getOrders successfully', '2025-03-23 09:00:14');
INSERT INTO `log` VALUES (485, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.index successfully', '2025-03-23 09:10:52');
INSERT INTO `log` VALUES (486, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.index successfully', '2025-03-23 09:10:53');
INSERT INTO `log` VALUES (487, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.signOn successfully', '2025-03-23 09:10:57');
INSERT INTO `log` VALUES (488, 'Visitor', 'invoke org.csu.petstore.controller.CaptchaController.getCaptcha successfully', '2025-03-23 09:10:57');
INSERT INTO `log` VALUES (489, 'Visitor', 'invoke org.csu.petstore.controller.AdminController.showindex successfully', '2025-03-23 09:11:08');
INSERT INTO `log` VALUES (490, 'admin@admin', 'invoke org.csu.petstore.controller.AdminController.getAdmin successfully', '2025-03-23 09:11:12');
INSERT INTO `log` VALUES (491, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.getOrders successfully', '2025-03-23 09:11:13');
INSERT INTO `log` VALUES (492, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.shipOrder successfully', '2025-03-23 09:11:38');
INSERT INTO `log` VALUES (493, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.getOrders successfully', '2025-03-23 09:11:45');
INSERT INTO `log` VALUES (494, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.deleteOrder successfully', '2025-03-23 09:13:12');
INSERT INTO `log` VALUES (495, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.getOrders successfully', '2025-03-23 09:13:12');
INSERT INTO `log` VALUES (496, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.deleteOrder successfully', '2025-03-23 09:13:15');
INSERT INTO `log` VALUES (497, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.getOrders successfully', '2025-03-23 09:13:15');
INSERT INTO `log` VALUES (498, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.deleteOrder successfully', '2025-03-23 09:13:15');
INSERT INTO `log` VALUES (499, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.getOrders successfully', '2025-03-23 09:13:15');
INSERT INTO `log` VALUES (500, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.deleteOrder successfully', '2025-03-23 09:13:16');
INSERT INTO `log` VALUES (501, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.getOrders successfully', '2025-03-23 09:13:16');
INSERT INTO `log` VALUES (502, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.deleteOrder successfully', '2025-03-23 09:13:16');
INSERT INTO `log` VALUES (503, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.getOrders successfully', '2025-03-23 09:13:16');
INSERT INTO `log` VALUES (504, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.deleteOrder successfully', '2025-03-23 09:13:17');
INSERT INTO `log` VALUES (505, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.getOrders successfully', '2025-03-23 09:13:17');
INSERT INTO `log` VALUES (506, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.deleteOrder successfully', '2025-03-23 09:13:17');
INSERT INTO `log` VALUES (507, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.getOrders successfully', '2025-03-23 09:13:17');
INSERT INTO `log` VALUES (508, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.deleteOrder successfully', '2025-03-23 09:13:18');
INSERT INTO `log` VALUES (509, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.getOrders successfully', '2025-03-23 09:13:18');
INSERT INTO `log` VALUES (510, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.deleteOrder successfully', '2025-03-23 09:13:18');
INSERT INTO `log` VALUES (511, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.getOrders successfully', '2025-03-23 09:13:18');
INSERT INTO `log` VALUES (512, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.deleteOrder successfully', '2025-03-23 09:13:18');
INSERT INTO `log` VALUES (513, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.getOrders successfully', '2025-03-23 09:13:18');
INSERT INTO `log` VALUES (514, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.deleteOrder successfully', '2025-03-23 09:13:18');
INSERT INTO `log` VALUES (515, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.getOrders successfully', '2025-03-23 09:13:18');
INSERT INTO `log` VALUES (516, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.deleteOrder successfully', '2025-03-23 09:13:18');
INSERT INTO `log` VALUES (517, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.getOrders successfully', '2025-03-23 09:13:18');
INSERT INTO `log` VALUES (518, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.deleteOrder successfully', '2025-03-23 09:13:19');
INSERT INTO `log` VALUES (519, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.getOrders successfully', '2025-03-23 09:13:19');
INSERT INTO `log` VALUES (520, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.deleteOrder successfully', '2025-03-23 09:13:20');
INSERT INTO `log` VALUES (521, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.getOrders successfully', '2025-03-23 09:13:20');
INSERT INTO `log` VALUES (522, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.deleteOrder successfully', '2025-03-23 09:13:20');
INSERT INTO `log` VALUES (523, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.getOrders successfully', '2025-03-23 09:13:20');
INSERT INTO `log` VALUES (524, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.deleteOrder successfully', '2025-03-23 09:13:20');
INSERT INTO `log` VALUES (525, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.getOrders successfully', '2025-03-23 09:13:20');
INSERT INTO `log` VALUES (526, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.deleteOrder successfully', '2025-03-23 09:13:20');
INSERT INTO `log` VALUES (527, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.getOrders successfully', '2025-03-23 09:13:20');
INSERT INTO `log` VALUES (528, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.deleteOrder successfully', '2025-03-23 09:13:21');
INSERT INTO `log` VALUES (529, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.getOrders successfully', '2025-03-23 09:13:21');
INSERT INTO `log` VALUES (530, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.deleteOrder successfully', '2025-03-23 09:13:21');
INSERT INTO `log` VALUES (531, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.getOrders successfully', '2025-03-23 09:13:21');
INSERT INTO `log` VALUES (532, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.shipOrder successfully', '2025-03-23 09:13:26');
INSERT INTO `log` VALUES (533, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.getOrders successfully', '2025-03-23 09:13:27');
INSERT INTO `log` VALUES (534, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.index   Desc: ', '2025-03-23 09:23:54');
INSERT INTO `log` VALUES (535, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.newAccountForm   Desc: ', '2025-03-23 09:23:59');
INSERT INTO `log` VALUES (536, 'Visitor', 'invoke org.csu.petstore.controller.CaptchaController.getCaptcha   Desc: ', '2025-03-23 09:24:00');
INSERT INTO `log` VALUES (537, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.index   Desc: ', '2025-03-23 09:26:06');
INSERT INTO `log` VALUES (538, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.index successfully', '2025-03-23 09:27:23');
INSERT INTO `log` VALUES (539, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.newAccountForm successfully', '2025-03-23 09:27:26');
INSERT INTO `log` VALUES (540, 'Visitor', 'invoke org.csu.petstore.controller.CaptchaController.getCaptcha successfully', '2025-03-23 09:27:26');
INSERT INTO `log` VALUES (541, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.signOn successfully', '2025-03-23 09:27:41');
INSERT INTO `log` VALUES (542, 'Visitor', 'invoke org.csu.petstore.controller.CaptchaController.getCaptcha successfully', '2025-03-23 09:27:41');
INSERT INTO `log` VALUES (543, 'account@qwe', 'invoke org.csu.petstore.controller.AccountController.signOnSubmit successfully', '2025-03-23 09:27:51');
INSERT INTO `log` VALUES (544, 'account@qwe', 'invoke org.csu.petstore.controller.OrderController.listOrder successfully', '2025-03-23 09:27:54');
INSERT INTO `log` VALUES (545, 'account@qwe', 'invoke org.csu.petstore.controller.AccountController.editAccount successfully', '2025-03-23 09:28:00');
INSERT INTO `log` VALUES (546, 'account@qwe', 'invoke org.csu.petstore.controller.CaptchaController.getCaptcha successfully', '2025-03-23 09:28:01');
INSERT INTO `log` VALUES (547, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.signOut successfully', '2025-03-23 09:28:10');
INSERT INTO `log` VALUES (548, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.signOn successfully', '2025-03-23 09:28:12');
INSERT INTO `log` VALUES (549, 'Visitor', 'invoke org.csu.petstore.controller.CaptchaController.getCaptcha successfully', '2025-03-23 09:28:12');
INSERT INTO `log` VALUES (550, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.index successfully', '2025-03-23 09:30:09');
INSERT INTO `log` VALUES (551, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.newAccountForm successfully', '2025-03-23 09:30:14');
INSERT INTO `log` VALUES (552, 'Visitor', 'invoke org.csu.petstore.controller.CaptchaController.getCaptcha successfully', '2025-03-23 09:30:15');
INSERT INTO `log` VALUES (553, 'Visitor', 'invoke org.csu.petstore.controller.CatalogController.index successfully', '2025-03-23 09:36:43');
INSERT INTO `log` VALUES (554, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.newAccountForm successfully', '2025-03-23 09:37:28');
INSERT INTO `log` VALUES (555, 'Visitor', 'invoke org.csu.petstore.controller.CaptchaController.getCaptcha successfully', '2025-03-23 09:37:29');
INSERT INTO `log` VALUES (556, 'account@ohyeah', 'invoke org.csu.petstore.controller.AccountController.newAccount successfully', '2025-03-23 09:37:55');
INSERT INTO `log` VALUES (557, 'account@ohyeah', 'invoke org.csu.petstore.controller.CatalogController.viewCategory successfully', '2025-03-23 09:37:58');
INSERT INTO `log` VALUES (558, 'account@ohyeah', 'invoke org.csu.petstore.controller.CatalogController.viewProduct successfully', '2025-03-23 09:38:01');
INSERT INTO `log` VALUES (559, 'account@ohyeah', 'invoke org.csu.petstore.controller.CartController.addItemToCart successfully', '2025-03-23 09:38:03');
INSERT INTO `log` VALUES (560, 'account@ohyeah', 'invoke org.csu.petstore.controller.OrderController.newOrder successfully', '2025-03-23 09:38:07');
INSERT INTO `log` VALUES (561, 'account@ohyeah', 'invoke org.csu.petstore.controller.OrderController.confirmOrder successfully', '2025-03-23 09:38:11');
INSERT INTO `log` VALUES (562, 'account@ohyeah', 'invoke org.csu.petstore.controller.OrderController.viewOrder successfully', '2025-03-23 09:38:14');
INSERT INTO `log` VALUES (563, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.signOut successfully', '2025-03-23 09:38:56');
INSERT INTO `log` VALUES (564, 'Visitor', 'invoke org.csu.petstore.controller.AccountController.signOn successfully', '2025-03-23 09:38:59');
INSERT INTO `log` VALUES (565, 'Visitor', 'invoke org.csu.petstore.controller.CaptchaController.getCaptcha successfully', '2025-03-23 09:38:59');
INSERT INTO `log` VALUES (566, 'Visitor', 'invoke org.csu.petstore.controller.AdminController.showindex successfully', '2025-03-23 09:39:02');
INSERT INTO `log` VALUES (567, 'admin@admin', 'invoke org.csu.petstore.controller.AdminController.getAdmin successfully', '2025-03-23 09:39:06');
INSERT INTO `log` VALUES (568, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.getOrders successfully', '2025-03-23 09:39:07');
INSERT INTO `log` VALUES (569, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.shipOrder successfully', '2025-03-23 09:39:12');
INSERT INTO `log` VALUES (570, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.getOrders successfully', '2025-03-23 09:39:14');
INSERT INTO `log` VALUES (571, 'admin@admin', 'invoke org.csu.petstore.controller.AdminController.adminIndex successfully', '2025-03-23 09:39:30');
INSERT INTO `log` VALUES (572, 'admin@admin', 'invoke org.csu.petstore.controller.AdminOrderController.getOrders successfully', '2025-03-23 09:39:32');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `orderid` int NOT NULL AUTO_INCREMENT,
  `userid` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `orderdate` date NOT NULL,
  `shipaddr1` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `shipaddr2` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `shipcity` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `shipstate` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `shipzip` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `shipcountry` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `billaddr1` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `billaddr2` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `billcity` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `billstate` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `billzip` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `billcountry` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `courier` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `totalprice` decimal(10, 2) NOT NULL,
  `billtofirstname` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `billtolastname` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `shiptofirstname` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `shiptolastname` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `creditcard` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `exprdate` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `cardtype` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `locale` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `out_status` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  PRIMARY KEY (`orderid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1044 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1000, 'j2ee', '2024-11-10', 'San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', '美国', '', '', '', '', '94303', '', 'UPS', 193.50, '', '', 'ABC', 'XY', '999 9999 9999 9999', '12/03', 'Visa', 'CA', 'P');
INSERT INTO `orders` VALUES (1001, 'j2ee', '2024-11-10', 'San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', '美国', '', '', '', '', '94303', '', 'UPS', 209.00, '', '', 'ABC', 'XY', '999 9999 9999 9999', '12/03', 'Visa', 'CA', 'P');
INSERT INTO `orders` VALUES (1003, '44', '2024-11-11', 'San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', '美国', '', '', '', '', '94303', '', 'UPS', 193.50, '', '', 'ABC', 'XYX', '999 9999 9999 9999', '12/03', 'Visa', 'CA', 'P');
INSERT INTO `orders` VALUES (1004, 'j2ee', '2024-11-12', 'San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', '美国', '', '', '', '', '94303', '', 'UPS', 15.50, '', '', 'ABC', 'XYX', '999 9999 9999 9999', '12/03', 'Visa', 'CA', 'P');
INSERT INTO `orders` VALUES (1005, 'j2ee', '2024-11-12', 'ABC', 'ABC', 'Palo Alto', 'CA', '94303', '美国', 'San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', '美国', 'UPS', 467.50, 'ABC', 'XYX', 'San Antonio Road', 'MS UCUP02-206', '999 9999 9999 9999', '12/03', 'Visa', 'CA', 'P');
INSERT INTO `orders` VALUES (1025, '1111', '1975-06-13', '123', '123', '123', '123', '123', '中国', '123', '123', '123', '123', '123', '中国', 'UPS', 3707.50, 'abc', 'abc', 'abc', 'abc', '123', '3/12', 'Visa', 'CA', 'P');
INSERT INTO `orders` VALUES (1026, '1111', '1975-06-13', '123', '123', '123', '123', '123', '中国', '123', '123', '123', '123', '123', '中国', 'UPS', 3707.50, 'abc', 'abc', 'abc', 'abc', '123', '3/12', 'Visa', 'CA', 'P');
INSERT INTO `orders` VALUES (1027, 'qwe', '2025-03-15', 'avdsf', 'fdvs', 'vsfdvd', '123fsv', 'vsf', 'dfgsfv', 'avdsf', 'fdvs', 'vsfdvd', '123fsv', 'vsf', 'dfgsfv', 'UPS', 3707.50, 'cdasva', 'vfsdvds', 'cdasva', 'vfsdvds', '999 9999 9999 9999', '3/12', 'Visa', 'CA', 'P');
INSERT INTO `orders` VALUES (1028, 'qwe', '2025-03-15', '', '', '', '', '', '', 'a', 'a', 'a', 'a', 'a', 'a', 'UPS', 18.50, 'a', 'a', '', '', '999 9999 9999 9999', '3/12', 'Visa', 'CA', 'P');
INSERT INTO `orders` VALUES (1029, 'hello', '2025-03-15', '', '', '', '', '', '', 's', 's', 's', 's', 's', 's', 'UPS', 18.50, 's', 's', '', '', '999 9999 9999 9999', '3/12', 'Visa', 'CA', 'P');
INSERT INTO `orders` VALUES (1030, 'qwe', '2025-03-15', 'avdsf', '', 'vsfdvd', '123fsv', 'vsf', '', 'add1111', 'add2222', 'city11', 'state11', 'zip11', '中国', 'UPS', 574.00, 'aa', 'aa', 'cdasva', 'vfsdvds', '999 9999 9999 9999', '2025-03-29', 'Visa', 'CA', 'P');
INSERT INTO `orders` VALUES (1031, 'qwe', '2025-03-15', 'avdsf', '', 'vsfdvd', '123fsv', 'vsf', '', 'ca', 'scd', 'city11', 'state11', 'zip11', '中国', 'UPS', 15.50, 's', 's', 'cdasva', 'vfsdvds', '999 9999 9999 9999', '2025-03-29', 'Visa', 'CA', 'P');
INSERT INTO `orders` VALUES (1032, 'j2eee', '2025-03-15', 'San Antonio Road', '', 'Palo Alto', 'CA', '94303', '', 'ca', 'scd', 'city11', 'state11', 'zip11', '中国', 'UPS', 18.50, '111', 's', 'ABC', 'XYX', '999 9999 9999 9999', '2025-03-29', 'Visa', 'CA', 'P');
INSERT INTO `orders` VALUES (1033, 'qwe', '2025-03-15', 'avdsf', '', 'vsfdvd', '123fsv', 'vsf', '', 'ca', 'scd', 'city11', 'state11', 'zip11', '中国', 'UPS', 18.50, 'qq', 's', 'cdasva', 'vfsdvds', '999 9999 9999 9999', '2025-03-29', 'Visa', 'CA', 'P');
INSERT INTO `orders` VALUES (1034, 'j2eee', '2025-03-15', 'San Antonio Road', '', 'Palo Alto', 'CA', '94303', '', '1', '1', '1', '1', '1', '1', 'UPS', 193.50, '1', '1', 'ABC', 'XYX', '999 9999 9999 9999', '2025-03-29', 'Visa', 'CA', 'P');
INSERT INTO `orders` VALUES (1035, 'j2eee', '2025-03-15', 'San Antonio Road', '', 'Palo Alto', 'CA', '94303', '', '1', '1', '1', '1', '1', '1', 'UPS', 19350.00, 'q', 'q', 'ABC', 'XYX', '999 9999 9999 9999', '2025-03-29', 'Visa', 'CA', 'P');
INSERT INTO `orders` VALUES (1036, 'j2eee', '2025-03-15', 'San Antonio Road', '', 'Palo Alto', 'CA', '94303', '', '123', '123', '123', '123', '123', '中国', 'UPS', 9350.00, '22', '2', 'ABC', 'XYX', '999 9999 9999 9999', '2025-03-29', 'Visa', 'CA', 'P');
INSERT INTO `orders` VALUES (1041, 'qwe', '2025-03-22', 'avdsf', '', 'vsfdvd', '123fsv', 'vsf', '', 'avdsf', 'fdvs', 'vsfdvd', '123fsv', 'vsf', 'dfgsfv', 'UPS', 15.50, 'cdasva', 'vfsdvds', 'cdasva', 'vfsdvds', '999 9999 9999 9999', '2025-04-05', 'Visa', 'CA', 'P');
INSERT INTO `orders` VALUES (1042, 'nihao', '2025-03-23', 'add1111', '', 'city11', 'state11', 'zip11', '', 'add1111', 'add2222', 'city11', 'state11', 'zip11', '中国', 'UPS', 15.50, '123456', '123456', '123456', '123456', '999 9999 9999 9999', '2025-04-06', 'Visa', 'CA', 'P');
INSERT INTO `orders` VALUES (1043, 'ohyeah', '2025-03-23', '123', '', '123', '123', '123', '', '123', '123', '123', '123', '123', '中国', 'UPS', 18.50, 'abc', 'abc', 'abc', 'abc', '999 9999 9999 9999', '2025-04-06', 'Visa', 'CA', 'NP');

-- ----------------------------
-- Table structure for orderstatus
-- ----------------------------
DROP TABLE IF EXISTS `orderstatus`;
CREATE TABLE `orderstatus`  (
  `orderid` int NOT NULL,
  `linenum` int NOT NULL,
  `timestamp` date NOT NULL,
  `status` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`orderid`, `linenum`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderstatus
-- ----------------------------
INSERT INTO `orderstatus` VALUES (1001, 1, '2024-11-11', 'P');
INSERT INTO `orderstatus` VALUES (1003, 1, '2024-11-11', 'P');
INSERT INTO `orderstatus` VALUES (1004, 1, '2024-11-12', 'P');
INSERT INTO `orderstatus` VALUES (1005, 1, '2024-11-12', 'P');
INSERT INTO `orderstatus` VALUES (1041, 1, '2025-03-22', 'P');
INSERT INTO `orderstatus` VALUES (1042, 1, '2025-03-23', 'P');
INSERT INTO `orderstatus` VALUES (1043, 1, '2025-03-23', 'P');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `productid` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `category` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `name` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `descn` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  PRIMARY KEY (`productid`) USING BTREE,
  INDEX `productCat`(`category` ASC) USING BTREE,
  INDEX `productName`(`name` ASC) USING BTREE,
  CONSTRAINT `fk_product_1` FOREIGN KEY (`category`) REFERENCES `category` (`catid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('AV-CB-01', 'BIRDS', 'Amazon Parrot', '<image src=\"images/bird2.gif\">Great companion for up to 75 years');
INSERT INTO `product` VALUES ('AV-SB-02', 'BIRDS', 'Finch', '<image src=\"images/bird1.gif\">Great stress reliever');
INSERT INTO `product` VALUES ('FI-FW-01', 'FISH', 'Koi', '<image src=\"images/fish3.gif\">Fresh Water fish from Japan');
INSERT INTO `product` VALUES ('FI-FW-02', 'FISH', 'Goldfish', '<image src=\"images/fish2.gif\">Fresh Water fish from China');
INSERT INTO `product` VALUES ('FI-SW-01', 'FISH', 'Angelfish', '<image src=\"images/fish1.gif\">Salt Water fish from Australia');
INSERT INTO `product` VALUES ('FI-SW-02', 'FISH', 'Tiger Shark', '<image src=\"images/fish4.gif\">Salt Water fish from Australia');
INSERT INTO `product` VALUES ('FL-DLH-02', 'CATS', 'Persian', '<image src=\"images/cat1.gif\">Friendly house cat, doubles as a princess');
INSERT INTO `product` VALUES ('FL-DSH-01', 'CATS', 'Manx', '<image src=\"images/cat2.gif\">Great for reducing mouse populations');
INSERT INTO `product` VALUES ('K9-BD-01', 'DOGS', 'Bulldog', '<image src=\"images/dog2.gif\">Friendly dog from England');
INSERT INTO `product` VALUES ('K9-CW-01', 'DOGS', 'Chihuahua', '<image src=\"images/dog4.gif\">Great companion dog');
INSERT INTO `product` VALUES ('K9-DL-01', 'DOGS', 'Dalmation', '<image src=\"images/dog5.gif\">Great dog for a Fire Station');
INSERT INTO `product` VALUES ('K9-PO-02', 'DOGS', 'Poodle', '<image src=\"images/dog6.gif\">Cute dog from France');
INSERT INTO `product` VALUES ('K9-RT-01', 'DOGS', 'Golden Retriever', '<image src=\"images/dog1.gif\">Great family dog');
INSERT INTO `product` VALUES ('K9-RT-02', 'DOGS', 'Labrador Retriever', '<image src=\"images/dog5.gif\">Great hunting dog');
INSERT INTO `product` VALUES ('RP-LI-02', 'REPTILES', 'Iguana', '<image src=\"images/lizard1.gif\">Friendly green friend');
INSERT INTO `product` VALUES ('RP-SN-01', 'REPTILES', 'Rattlesnake', '<image src=\"images/snake1.gif\">Doubles as a watch dog');

-- ----------------------------
-- Table structure for profile
-- ----------------------------
DROP TABLE IF EXISTS `profile`;
CREATE TABLE `profile`  (
  `userid` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `langpref` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `favcategory` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `mylistopt` int NULL DEFAULT NULL,
  `banneropt` int NULL DEFAULT NULL,
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of profile
-- ----------------------------
INSERT INTO `profile` VALUES ('1', 'english', 'BIRDS', NULL, NULL);
INSERT INTO `profile` VALUES ('1111', 'english', 'DOGS', NULL, NULL);
INSERT INTO `profile` VALUES ('1112', 'english', 'BIRDS', NULL, NULL);
INSERT INTO `profile` VALUES ('123', 'english', 'BIRDS', NULL, NULL);
INSERT INTO `profile` VALUES ('1234', 'english', 'BIRDS', NULL, NULL);
INSERT INTO `profile` VALUES ('1899695910794989569', 'english', 'DOGS', NULL, NULL);
INSERT INTO `profile` VALUES ('1899696729531543553', 'english', 'BIRDS', NULL, NULL);
INSERT INTO `profile` VALUES ('44', 'english', 'BIRDS', NULL, NULL);
INSERT INTO `profile` VALUES ('445', 'english', 'BIRDS', NULL, NULL);
INSERT INTO `profile` VALUES ('545', 'english', 'BIRDS', NULL, NULL);
INSERT INTO `profile` VALUES ('55', 'english', 'BIRDS', NULL, NULL);
INSERT INTO `profile` VALUES ('ACID', 'english', 'CATS', 1, 1);
INSERT INTO `profile` VALUES ('abc', 'english', 'BIRDS', NULL, NULL);
INSERT INTO `profile` VALUES ('abcd', 'english', 'BIRDS', NULL, NULL);
INSERT INTO `profile` VALUES ('abcde', 'english', 'BIRDS', NULL, NULL);
INSERT INTO `profile` VALUES ('asd', 'english', 'BIRDS', NULL, NULL);
INSERT INTO `profile` VALUES ('hello', 'english', 'BIRDS', NULL, NULL);
INSERT INTO `profile` VALUES ('j2', 'english', 'BIRDS', NULL, NULL);
INSERT INTO `profile` VALUES ('j23', 'english', 'BIRDS', NULL, NULL);
INSERT INTO `profile` VALUES ('j2345', 'english', 'BIRDS', NULL, NULL);
INSERT INTO `profile` VALUES ('j23456', 'english', 'BIRDS', NULL, NULL);
INSERT INTO `profile` VALUES ('j234567', 'english', 'BIRDS', NULL, NULL);
INSERT INTO `profile` VALUES ('j2ee', 'english', 'BIRDS', 1, 1);
INSERT INTO `profile` VALUES ('j2eee', 'english', 'BIRDS', NULL, NULL);
INSERT INTO `profile` VALUES ('jjj', 'english', 'BIRDS', NULL, NULL);
INSERT INTO `profile` VALUES ('jjww', 'english', 'BIRDS', NULL, NULL);
INSERT INTO `profile` VALUES ('nihao', 'english', 'BIRDS', NULL, NULL);
INSERT INTO `profile` VALUES ('ohyeah', 'english', 'BIRDS', NULL, NULL);
INSERT INTO `profile` VALUES ('qwe', 'chinese', 'CATS', NULL, NULL);

-- ----------------------------
-- Table structure for sequence
-- ----------------------------
DROP TABLE IF EXISTS `sequence`;
CREATE TABLE `sequence`  (
  `name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `nextid` int NOT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sequence
-- ----------------------------
INSERT INTO `sequence` VALUES ('ordernum', 1025);

-- ----------------------------
-- Table structure for signon
-- ----------------------------
DROP TABLE IF EXISTS `signon`;
CREATE TABLE `signon`  (
  `username` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `password` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of signon
-- ----------------------------
INSERT INTO `signon` VALUES ('1', '1');
INSERT INTO `signon` VALUES ('1111', '1111');
INSERT INTO `signon` VALUES ('1112', '1112');
INSERT INTO `signon` VALUES ('123', '123');
INSERT INTO `signon` VALUES ('1234', '1234');
INSERT INTO `signon` VALUES ('1899695910820155395', '123');
INSERT INTO `signon` VALUES ('1899696729544126466', '1qessxdw');
INSERT INTO `signon` VALUES ('44', '44');
INSERT INTO `signon` VALUES ('445', '445');
INSERT INTO `signon` VALUES ('545', '123456');
INSERT INTO `signon` VALUES ('55', '55');
INSERT INTO `signon` VALUES ('ACID', 'ACID');
INSERT INTO `signon` VALUES ('abc', 'abc');
INSERT INTO `signon` VALUES ('abcd', 'abc');
INSERT INTO `signon` VALUES ('abcde', 'abc');
INSERT INTO `signon` VALUES ('asd', '123');
INSERT INTO `signon` VALUES ('hello', '123');
INSERT INTO `signon` VALUES ('j2', 'abcd');
INSERT INTO `signon` VALUES ('j23', 'abcd');
INSERT INTO `signon` VALUES ('j2345', 'abcd');
INSERT INTO `signon` VALUES ('j23456', 'abcd');
INSERT INTO `signon` VALUES ('j234567', 'abcd');
INSERT INTO `signon` VALUES ('j2ee', 'abc');
INSERT INTO `signon` VALUES ('j2eee', 'abc');
INSERT INTO `signon` VALUES ('nihao', '123');
INSERT INTO `signon` VALUES ('ohyeah', '123');
INSERT INTO `signon` VALUES ('qwe', '123456');

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier`  (
  `suppid` int NOT NULL,
  `name` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `status` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `addr1` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `addr2` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `city` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `state` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `zip` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `phone` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  PRIMARY KEY (`suppid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES (1, 'XYZ Pets', 'AC', '600 Avon Way', '', 'Los Angeles', 'CA', '94024', '212-947-0797');
INSERT INTO `supplier` VALUES (2, 'ABC Pets', 'AC', '700 Abalone Way', '', 'San Francisco ', 'CA', '94024', '415-947-0797');

SET FOREIGN_KEY_CHECKS = 1;
