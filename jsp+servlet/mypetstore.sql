/*
 Navicat Premium Data Transfer

 Source Server         : local-mysql
 Source Server Type    : MySQL
 Source Server Version : 90100 (9.1.0)
 Source Host           : localhost:3306
 Source Schema         : mypetstore

 Target Server Type    : MySQL
 Target Server Version : 90100 (9.1.0)
 File Encoding         : 65001

 Date: 25/12/2024 09:49:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account`  (
  `userid` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `firstname` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `lastname` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `addr1` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `addr2` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `city` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `state` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `zip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `country` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `phone` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('123', '222@sss', '123', '123', 'OK', '123', '123', '123', '123', '123', '123', '1234');
INSERT INTO `account` VALUES ('123456', '222@sss', '123456', '123456', 'OK', '1524', '4523', '456', '852', '159', '753', '1234');
INSERT INTO `account` VALUES ('222', '222', '222', '222', 'OK', '222', '222', '222', '222', '222', '222', '222');
INSERT INTO `account` VALUES ('233', 'bsgd@wess.com', '222', '123', 'OK', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', '13312345678');
INSERT INTO `account` VALUES ('345', 'email@email.com', 'first', 'last', 'OK', 'add1', 'add2', 'city', 'state', 'zip', 'earth', '13312345678');
INSERT INTO `account` VALUES ('5566', '2333444@qq.com', 'qwer', 'asdf', 'OK', 'wojia', 'home', 'you', 'dfg', 'aass', 'ghfdh', '123456');
INSERT INTO `account` VALUES ('741', '456', '123', '456', 'OK', 'wojia', 'home', '456', '456', '456', '456', '456');
INSERT INTO `account` VALUES ('789', '456', '123', '456', 'OK', 'wojia', 'home', '456', '456', '456', '456', '456');
INSERT INTO `account` VALUES ('ACID', 'acid@yourdomain.com', 'ABC', 'XYX', 'OK', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', '555-555-5555');
INSERT INTO `account` VALUES ('config', '2333444@qq.com', 'qwer', 'asdf', 'OK', 'wojia', 'home', 'you', 'dfg', 'aass', 'ghfdh', '123456');
INSERT INTO `account` VALUES ('io', '2333444@qq.com', 'qwer', 'asdf', 'OK', 'wojia', 'home', 'you', 'dfg', 'aass', 'ghfdh', '123456');
INSERT INTO `account` VALUES ('j2ee', 'yourname@yourdomain.com', 'ABC', 'XYX', 'OK', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', '555-555-5555');
INSERT INTO `account` VALUES ('sdfc', '222@sss', 'w22', 'ddf', 'OK', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', '13312345678');
INSERT INTO `account` VALUES ('vb', '2333444@qq.com', 'qwer', 'asdf', 'OK', 'wojia', 'home', 'you', 'dfg', 'aass', 'ghfdh', '123456');

-- ----------------------------
-- Table structure for bannerdata
-- ----------------------------
DROP TABLE IF EXISTS `bannerdata`;
CREATE TABLE `bannerdata`  (
  `favcategory` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `bannername` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`favcategory`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bannerdata
-- ----------------------------
INSERT INTO `bannerdata` VALUES ('BIRDS', '<image src=\"images/banner_birds.gif\">');
INSERT INTO `bannerdata` VALUES ('CATS', '<image src=\"images/banner_cats.gif\">');
INSERT INTO `bannerdata` VALUES ('DOGS', '<image src=\"images/banner_dogs.gif\">');
INSERT INTO `bannerdata` VALUES ('FISH', '<image src=\"images/banner_fish.gif\">');
INSERT INTO `bannerdata` VALUES ('REPTILES', '<image src=\"images/banner_reptiles.gif\">');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `itemId` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `quantity` int NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES ('5566', 'EST-14', 1);
INSERT INTO `cart` VALUES ('j2ee', 'EST-26', 4);
INSERT INTO `cart` VALUES ('222', 'EST-4', 2);
INSERT INTO `cart` VALUES ('123456', 'EST-18', 2);
INSERT INTO `cart` VALUES ('123456', 'EST-13', 2);
INSERT INTO `cart` VALUES ('j2ee', 'EST-18', 3);
INSERT INTO `cart` VALUES ('233', 'EST-26', 2);
INSERT INTO `cart` VALUES ('233', 'EST-20', 2);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `catid` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `descn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`catid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('BIRDS', 'Birds', '<image src=\"images/birds_icon.gif\"><font size=\"5\" color=\"blue\"> Birds</font>');
INSERT INTO `category` VALUES ('CATS', 'Cats', '<image src=\"images/cats_icon.gif\"><font size=\"5\" color=\"blue\"> Cats</font>');
INSERT INTO `category` VALUES ('DOGS', 'Dogs', '<image src=\"images/dogs_icon.gif\"><font size=\"5\" color=\"blue\"> Dogs</font>');
INSERT INTO `category` VALUES ('FISH', 'Fish', '<image src=\"images/fish_icon.gif\"><font size=\"5\" color=\"blue\"> Fish</font>');
INSERT INTO `category` VALUES ('REPTILES', 'Reptiles', '<image src=\"images/reptiles_icon.gif\"><font size=\"5\" color=\"blue\"> Reptiles</font>');

-- ----------------------------
-- Table structure for inventory
-- ----------------------------
DROP TABLE IF EXISTS `inventory`;
CREATE TABLE `inventory`  (
  `itemid` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `qty` int NOT NULL,
  PRIMARY KEY (`itemid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of inventory
-- ----------------------------
INSERT INTO `inventory` VALUES ('EST-1', 10000);
INSERT INTO `inventory` VALUES ('EST-10', 10000);
INSERT INTO `inventory` VALUES ('EST-11', 10000);
INSERT INTO `inventory` VALUES ('EST-12', 10000);
INSERT INTO `inventory` VALUES ('EST-13', 10000);
INSERT INTO `inventory` VALUES ('EST-14', 10000);
INSERT INTO `inventory` VALUES ('EST-15', 10000);
INSERT INTO `inventory` VALUES ('EST-16', 10000);
INSERT INTO `inventory` VALUES ('EST-17', 10000);
INSERT INTO `inventory` VALUES ('EST-18', 10000);
INSERT INTO `inventory` VALUES ('EST-19', 10000);
INSERT INTO `inventory` VALUES ('EST-2', 10000);
INSERT INTO `inventory` VALUES ('EST-20', 10000);
INSERT INTO `inventory` VALUES ('EST-21', 10000);
INSERT INTO `inventory` VALUES ('EST-22', 10000);
INSERT INTO `inventory` VALUES ('EST-23', 10000);
INSERT INTO `inventory` VALUES ('EST-24', 10000);
INSERT INTO `inventory` VALUES ('EST-25', 10000);
INSERT INTO `inventory` VALUES ('EST-26', 10000);
INSERT INTO `inventory` VALUES ('EST-27', 10000);
INSERT INTO `inventory` VALUES ('EST-28', 10000);
INSERT INTO `inventory` VALUES ('EST-3', 10000);
INSERT INTO `inventory` VALUES ('EST-4', 10000);
INSERT INTO `inventory` VALUES ('EST-5', 10000);
INSERT INTO `inventory` VALUES ('EST-6', 10000);
INSERT INTO `inventory` VALUES ('EST-7', 10000);
INSERT INTO `inventory` VALUES ('EST-8', 10000);
INSERT INTO `inventory` VALUES ('EST-9', 10000);

-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item`  (
  `itemid` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `productid` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `listprice` decimal(10, 2) NULL DEFAULT NULL,
  `unitcost` decimal(10, 2) NULL DEFAULT NULL,
  `supplier` int NULL DEFAULT NULL,
  `status` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `attr1` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `attr2` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `attr3` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `attr4` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `attr5` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`itemid`) USING BTREE,
  INDEX `fk_item_2`(`supplier` ASC) USING BTREE,
  INDEX `itemProd`(`productid` ASC) USING BTREE,
  CONSTRAINT `fk_item_1` FOREIGN KEY (`productid`) REFERENCES `product` (`productid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_item_2` FOREIGN KEY (`supplier`) REFERENCES `supplier` (`suppid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

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
  `itemid` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `quantity` int NOT NULL,
  `unitprice` decimal(10, 2) NOT NULL,
  PRIMARY KEY (`orderid`, `linenum`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lineitem
-- ----------------------------
INSERT INTO `lineitem` VALUES (1000, 1, 'EST-19', 1, 15.50);
INSERT INTO `lineitem` VALUES (1001, 1, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1002, 1, 'EST-14', 1, 58.50);
INSERT INTO `lineitem` VALUES (1003, 1, 'EST-19', 1, 15.50);
INSERT INTO `lineitem` VALUES (1004, 1, 'EST-19', 1, 15.50);
INSERT INTO `lineitem` VALUES (1005, 1, 'EST-18', 2, 193.50);
INSERT INTO `lineitem` VALUES (1005, 2, 'EST-28', 1, 155.29);
INSERT INTO `lineitem` VALUES (1005, 3, 'EST-14', 1, 58.50);
INSERT INTO `lineitem` VALUES (1005, 4, 'EST-12', 4, 18.50);
INSERT INTO `lineitem` VALUES (1006, 1, 'EST-18', 10, 193.50);
INSERT INTO `lineitem` VALUES (1006, 2, 'EST-15', 19, 23.50);
INSERT INTO `lineitem` VALUES (1006, 3, 'EST-13', 1, 18.50);
INSERT INTO `lineitem` VALUES (1007, 1, 'EST-13', 1, 18.50);
INSERT INTO `lineitem` VALUES (1008, 1, 'EST-13', 1, 18.50);
INSERT INTO `lineitem` VALUES (1008, 2, 'EST-12', 1, 18.50);
INSERT INTO `lineitem` VALUES (1009, 1, 'EST-13', 19, 18.50);
INSERT INTO `lineitem` VALUES (1010, 1, 'EST-18', 123, 193.50);
INSERT INTO `lineitem` VALUES (1010, 2, 'EST-19', 1, 15.50);
INSERT INTO `lineitem` VALUES (1010, 3, 'EST-10', 2, 18.50);
INSERT INTO `lineitem` VALUES (1011, 1, 'EST-2', 13, 16.50);
INSERT INTO `lineitem` VALUES (1012, 1, 'EST-18', 7, 193.50);
INSERT INTO `lineitem` VALUES (1013, 1, 'EST-18', 7, 193.50);
INSERT INTO `lineitem` VALUES (1014, 1, 'EST-18', 2, 193.50);
INSERT INTO `lineitem` VALUES (1015, 1, 'EST-18', 2, 193.50);
INSERT INTO `lineitem` VALUES (1016, 1, 'EST-8', 2, 18.50);
INSERT INTO `lineitem` VALUES (1016, 2, 'EST-18', 15, 193.50);
INSERT INTO `lineitem` VALUES (1017, 1, 'EST-8', 2, 18.50);
INSERT INTO `lineitem` VALUES (1017, 2, 'EST-18', 15, 193.50);
INSERT INTO `lineitem` VALUES (1018, 1, 'EST-7', 2, 18.50);
INSERT INTO `lineitem` VALUES (1020, 1, 'EST-13', 2, 18.50);
INSERT INTO `lineitem` VALUES (1021, 1, 'EST-13', 2, 18.50);
INSERT INTO `lineitem` VALUES (1022, 1, 'EST-12', 2, 18.50);
INSERT INTO `lineitem` VALUES (1024, 1, 'EST-27', 2, 155.29);
INSERT INTO `lineitem` VALUES (1025, 1, 'EST-27', 2, 155.29);
INSERT INTO `lineitem` VALUES (1026, 1, 'EST-10', 22, 18.50);
INSERT INTO `lineitem` VALUES (1026, 2, 'EST-27', 66, 155.29);
INSERT INTO `lineitem` VALUES (1027, 1, 'EST-10', 22, 18.50);
INSERT INTO `lineitem` VALUES (1027, 2, 'EST-27', 66, 155.29);
INSERT INTO `lineitem` VALUES (1032, 1, 'EST-10', 25, 18.50);
INSERT INTO `lineitem` VALUES (1032, 2, 'EST-12', 2, 18.50);
INSERT INTO `lineitem` VALUES (1032, 3, 'EST-18', 2, 193.50);
INSERT INTO `lineitem` VALUES (1032, 4, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1033, 1, 'EST-10', 25, 18.50);
INSERT INTO `lineitem` VALUES (1033, 2, 'EST-12', 2, 18.50);
INSERT INTO `lineitem` VALUES (1033, 3, 'EST-18', 2, 193.50);
INSERT INTO `lineitem` VALUES (1033, 4, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1034, 1, 'EST-16', 1234, 93.50);
INSERT INTO `lineitem` VALUES (1034, 2, 'EST-16', 1234, 93.50);
INSERT INTO `lineitem` VALUES (1035, 1, 'EST-16', 1234, 93.50);
INSERT INTO `lineitem` VALUES (1035, 2, 'EST-16', 1234, 93.50);
INSERT INTO `lineitem` VALUES (1036, 1, 'EST-16', 1, 93.50);
INSERT INTO `lineitem` VALUES (1036, 2, 'EST-15', 13, 23.50);
INSERT INTO `lineitem` VALUES (1038, 1, 'EST-18', 15, 193.50);
INSERT INTO `lineitem` VALUES (1039, 1, 'EST-18', 15, 193.50);
INSERT INTO `lineitem` VALUES (1040, 1, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1040, 2, 'EST-6', 27, 18.50);
INSERT INTO `lineitem` VALUES (1040, 3, 'EST-11', 100, 18.50);
INSERT INTO `lineitem` VALUES (1041, 1, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1041, 2, 'EST-6', 27, 18.50);
INSERT INTO `lineitem` VALUES (1041, 3, 'EST-11', 100, 18.50);
INSERT INTO `lineitem` VALUES (1042, 1, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1043, 1, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1044, 1, 'EST-16', 12, 93.50);
INSERT INTO `lineitem` VALUES (1045, 1, 'EST-16', 12, 93.50);
INSERT INTO `lineitem` VALUES (1046, 1, 'EST-16', 12, 93.50);
INSERT INTO `lineitem` VALUES (1047, 1, 'EST-18', 300, 193.50);
INSERT INTO `lineitem` VALUES (1048, 1, 'EST-18', 300, 193.50);
INSERT INTO `lineitem` VALUES (1049, 1, 'EST-13', 1388, 18.50);
INSERT INTO `lineitem` VALUES (1049, 2, 'EST-13', 1388, 18.50);
INSERT INTO `lineitem` VALUES (1050, 1, 'EST-13', 1388, 18.50);
INSERT INTO `lineitem` VALUES (1050, 2, 'EST-13', 1388, 18.50);
INSERT INTO `lineitem` VALUES (1051, 1, 'EST-17', 1999, 93.50);
INSERT INTO `lineitem` VALUES (1052, 1, 'EST-17', 1999, 93.50);
INSERT INTO `lineitem` VALUES (1053, 1, 'EST-18', 10, 193.50);
INSERT INTO `lineitem` VALUES (1054, 1, 'EST-18', 10, 193.50);
INSERT INTO `lineitem` VALUES (1055, 1, 'EST-26', 10, 125.50);
INSERT INTO `lineitem` VALUES (1055, 2, 'EST-18', 30, 193.50);
INSERT INTO `lineitem` VALUES (1056, 1, 'EST-26', 10, 125.50);
INSERT INTO `lineitem` VALUES (1056, 2, 'EST-18', 30, 193.50);
INSERT INTO `lineitem` VALUES (1057, 1, 'EST-18', 4, 193.50);
INSERT INTO `lineitem` VALUES (1057, 2, 'EST-12', 2, 18.50);
INSERT INTO `lineitem` VALUES (1058, 1, 'EST-18', 4, 193.50);
INSERT INTO `lineitem` VALUES (1058, 2, 'EST-12', 2, 18.50);
INSERT INTO `lineitem` VALUES (1061, 1, 'EST-12', 134, 18.50);
INSERT INTO `lineitem` VALUES (1062, 1, 'EST-12', 134, 18.50);
INSERT INTO `lineitem` VALUES (1063, 1, 'EST-13', 2000, 18.50);
INSERT INTO `lineitem` VALUES (1064, 1, 'EST-13', 2000, 18.50);
INSERT INTO `lineitem` VALUES (1065, 1, 'EST-16', 33, 93.50);
INSERT INTO `lineitem` VALUES (1065, 2, 'EST-13', 16, 18.50);
INSERT INTO `lineitem` VALUES (1066, 1, 'EST-16', 33, 93.50);
INSERT INTO `lineitem` VALUES (1066, 2, 'EST-13', 16, 18.50);

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log`  (
  `logUserId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `logInfo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`logUserId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('123456', '2024-12-20 14:23:49     http://localhost:8080/mypetstore/addItemToCart?workingItemId=EST-18 增加商品 EST-18');
INSERT INTO `log` VALUES ('222', '2024-12-18 09:38:51     http://localhost:8080/mypetstore/addItemToCart?workingItemId=EST-2 增加商品 EST-2');
INSERT INTO `log` VALUES ('233', '2024-12-22 15:59:50     http://localhost:8080/mypetstore/cartForm?null 预览订单 ');
INSERT INTO `log` VALUES ('5566', '2024-11-17 20:27:11     http://localhost:8080/mypetstore/addItemToCart?workingItemId=EST-18 增加商品 EST-18');
INSERT INTO `log` VALUES ('741', '2024-11-16 23:00:54     http://localhost:8080/mypetstore/newOrderForm?null 跳转到新订单页面');
INSERT INTO `log` VALUES ('789', '2024-11-16 22:59:02     http://localhost:8080/mypetstore/newOrderForm?null 跳转到新订单页面');
INSERT INTO `log` VALUES ('config', '2024-11-18 18:31:00     http://localhost:8080/mypetstore/addItemToCart?workingItemId=EST-13 增加商品 EST-13');
INSERT INTO `log` VALUES ('io', '2024-11-20 09:06:10     http://localhost:8080/mypetstore/editAccountForm?null 修改账号信息 ');
INSERT INTO `log` VALUES ('j2ee', '2024-12-20 13:48:50     http://localhost:8080/mypetstore/addItemToCart?workingItemId=EST-18 增加商品 EST-18');
INSERT INTO `log` VALUES ('sdfc', '2024-12-22 14:48:30     http://localhost:8080/mypetstore/cartForm?null 预览订单 ');
INSERT INTO `log` VALUES ('vb', '2024-11-20 11:49:34     http://localhost:8080/mypetstore/addItemToCart?workingItemId=EST-13 增加商品 EST-13');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `orderid` int NOT NULL,
  `userid` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `orderdate` date NOT NULL,
  `shipaddr1` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `shipaddr2` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `shipcity` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `shipstate` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `shipzip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `shipcountry` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `billaddr1` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `billaddr2` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `billcity` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `billstate` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `billzip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `billcountry` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `courier` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `totalprice` decimal(10, 2) NOT NULL,
  `billtofirstname` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `billtolastname` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `shiptofirstname` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `shiptolastname` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `creditcard` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `exprdate` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cardtype` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `locale` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`orderid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1000, '789', '2024-11-16', 'wojia', 'home', '456', '456', '456', '456', 'wojia', 'home', '456', '456', '456', '456', '456', 15.50, '123', '456', '123', '456', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1001, '789', '2024-11-16', 'wojia', 'home', '456', '678', '456', '456', 'wojia', 'home', '456', '456', '456', '456', '456', 193.50, '123', '456', '123', '456', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1002, '789', '2024-11-16', 'wojia', 'home', '456', '456', '456', '456', 'wojia', 'home', '456', '456', '456', '456', '456', 58.50, '123', '456', '123', '456', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1003, '789', '2024-11-16', 'wojia', 'home', '456', '456', '456', '456', 'wojia', 'home', '456', '456', '456', '456', '456', 15.50, '123', '456', '123', '456', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1004, '741', '2024-11-16', 'wojia', 'home', '456', '456', '456', '456', 'wojia', 'home', '456', '456', '456', '456', '456', 15.50, '123', '456', '123', '456', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1005, '5566', '2024-11-17', 'wojia', 'home', 'you', 'dfg', 'aass', 'ghfdh', 'wojia', 'home', 'you', 'dfg', 'aass', 'ghfdh', 'ghfdh', 674.79, 'qwer', 'asdf', 'qwer', 'asdf', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1006, 'io', '2024-11-20', 'wojia', 'home', 'you', 'dfg', 'aass', 'ghfdh', 'wojia', 'home', 'you', 'dfg', 'aass', 'ghfdh', 'ghfdh', 2400.00, 'qwer', 'asdf', 'qwer', 'asdf', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1007, 'io', '2024-11-20', 'wojia', 'home', 'you', 'dfg', 'aass', 'ghfdh', 'wojia', 'home', 'you', 'dfg', 'aass', 'ghfdh', 'ghfdh', 18.50, 'qwer', 'asdf', 'qwer', 'asdf', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1008, 'config', '2024-11-20', 'wojia', 'home', 'you', 'dfg', 'aass', 'ghfdh', 'wojia', 'home', 'you', 'dfg', 'aass', 'ghfdh', 'ghfdh', 37.00, 'qwer', 'asdf', 'qwer', 'asdf', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1009, 'vb', '2024-11-20', 'wojia', 'home', 'you', 'dfg', 'aass', 'ghfdh', 'wojia', 'home', 'you', 'dfg', 'aass', 'ghfdh', 'ghfdh', 351.50, 'qwer', 'asdf', 'qwer', 'asdf', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1010, 'io', '2024-11-21', 'wojia', 'home', 'you', 'dfg', 'aass', 'ghfdh', 'wojia', 'home', 'you', 'dfg', 'aass', 'ghfdh', 'ghfdh', 23853.00, 'qwer', 'asdf', 'qwer', 'asdf', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1011, '222', '2024-12-18', '222', '222', '222', '222', '222', '222', '222', '222', '222', '222', '222', '222', '222', 214.50, '222', '222', '222', '222', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1022, 'sdfc', '2024-12-22', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'UPS', 37.00, 'w22', 'ddf', 'w22', 'ddf', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1024, 'sdfc', '2024-12-22', '777', '66', '23456', '345', '5665', 'earth', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', '353', 310.58, 'w22', 'ddf', '123', '445', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1025, 'sdfc', '2024-12-22', '777', '66', '23456', '345', '5665', 'earth', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', '353', 310.58, 'w22', 'ddf', '123', '445', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1026, 'sdfc', '2024-12-22', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'UPS', 10656.14, 'w22', 'ddf', 'w22', 'ddf', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1027, 'sdfc', '2024-12-22', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'UPS', 10656.14, 'w22', 'ddf', 'w22', 'ddf', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1028, 'sdfc', '2024-12-22', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'UPS', 0.00, 'w22', 'ddf', 'w22', 'ddf', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1029, 'sdfc', '2024-12-22', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'UPS', 0.00, 'w22', 'ddf', 'w22', 'ddf', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1030, 'sdfc', '2024-12-22', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'UPS', 0.00, 'w22', 'ddf', 'w22', 'ddf', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1031, 'sdfc', '2024-12-22', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'UPS', 0.00, 'w22', 'ddf', 'w22', 'ddf', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1032, 'sdfc', '2024-12-22', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'UPS', 1080.00, 'w22', 'ddf', 'w22', 'ddf', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1033, 'sdfc', '2024-12-22', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'UPS', 1080.00, 'w22', 'ddf', 'w22', 'ddf', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1034, 'sdfc', '2024-12-22', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'UPS', 230758.00, 'w22', 'ddf', 'w22', 'ddf', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1035, 'sdfc', '2024-12-22', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'UPS', 230758.00, 'w22', 'ddf', 'w22', 'ddf', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1036, 'sdfc', '2024-12-22', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'UPS', 399.00, 'w22', 'ddf', 'w22', 'ddf', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1038, 'sdfc', '2024-12-22', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'UPS', 2902.50, 'w22', 'ddf', 'w22', 'ddf', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1039, 'sdfc', '2024-12-22', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'UPS', 2902.50, 'w22', 'ddf', 'w22', 'ddf', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1040, 'sdfc', '2024-12-22', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'UPS', 2543.00, 'w22', 'ddf', 'w22', 'ddf', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1041, 'sdfc', '2024-12-22', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'UPS', 2543.00, 'w22', 'ddf', 'w22', 'ddf', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1042, 'sdfc', '2024-12-22', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'UPS', 193.50, 'w22', 'ddf', 'w22', 'ddf', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1043, 'sdfc', '2024-12-22', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'UPS', 193.50, 'w22', 'ddf', 'w22', 'ddf', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1044, 'sdfc', '2024-12-22', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'UPS', 1122.00, 'w22', 'ddf', 'w22', 'ddf', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1045, 'sdfc', '2024-12-22', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'UPS', 1122.00, 'w22', 'ddf', 'w22', 'ddf', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1046, 'sdfc', '2024-12-22', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'UPS', 1122.00, 'w22', 'ddf', 'w22', 'ddf', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1047, 'sdfc', '2024-12-22', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'UPS', 58050.00, 'w22', 'ddf', 'w22', 'ddf', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1048, 'sdfc', '2024-12-22', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'UPS', 58050.00, 'w22', 'ddf', 'w22', 'ddf', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1049, 'sdfc', '2024-12-22', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'UPS', 51356.00, 'w22', 'ddf', 'w22', 'ddf', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1050, 'sdfc', '2024-12-22', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'UPS', 51356.00, 'w22', 'ddf', 'w22', 'ddf', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1051, 'sdfc', '2024-12-22', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'UPS', 186906.50, 'w22', 'ddf', 'w22', 'ddf', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1052, 'sdfc', '2024-12-22', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'UPS', 186906.50, 'w22', 'ddf', 'w22', 'ddf', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1053, 'sdfc', '2024-12-22', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'UPS', 1935.00, 'w22', 'ddf', 'w22', 'ddf', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1054, 'sdfc', '2024-12-22', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'UPS', 1935.00, 'w22', 'ddf', 'w22', 'ddf', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1055, 'sdfc', '2024-12-22', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'UPS', 7060.00, 'w22', 'ddf', 'w22', 'ddf', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1056, 'sdfc', '2024-12-22', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'UPS', 7060.00, 'w22', 'ddf', 'w22', 'ddf', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1057, 'sdfc', '2024-12-22', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'UPS', 811.00, 'w22', 'ddf', 'w22', 'ddf', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1058, 'sdfc', '2024-12-22', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'UPS', 811.00, 'w22', 'ddf', 'w22', 'ddf', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1059, 'sdfc', '2024-12-25', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'UPS', 0.00, 'w22', 'ddf', 'w22', 'ddf', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1060, 'sdfc', '2024-12-25', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'UPS', 0.00, 'w22', 'ddf', 'w22', 'ddf', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1061, 'sdfc', '2024-12-25', 'dddd', '66', '${session', '345', '5665', 'earth', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'earth', 2479.00, 'w22', 'ddf', '123', '445', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1062, 'sdfc', '2024-12-25', 'dddd', '66', '${session', '345', '5665', 'earth', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'earth', 2479.00, 'w22', 'ddf', '123', '445', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1063, 'sdfc', '2024-12-25', 'dddd', '66', '${session', '345', '5665', 'earth', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'earth', 37000.00, 'w22', 'ddf', '123', '445', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1064, 'sdfc', '2024-12-25', 'dddd', '66', '${session', '345', '5665', 'earth', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'earth', 37000.00, 'w22', 'ddf', '123', '445', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1065, 'sdfc', '2024-12-25', 'dddd', '66', '${session', '345', '5665', 'earth', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'earth', 3381.50, 'w22', 'ddf', '123', '445', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1066, 'sdfc', '2024-12-25', 'dddd', '66', '${session', '345', '5665', 'earth', 'Beijing', 'New York', 'home', 'block', '354200', 'earth', 'earth', 3381.50, 'w22', 'ddf', '123', '445', '999 9999 9999 9999', '12/03', 'Visa', 'CA');

-- ----------------------------
-- Table structure for orderstatus
-- ----------------------------
DROP TABLE IF EXISTS `orderstatus`;
CREATE TABLE `orderstatus`  (
  `orderid` int NOT NULL,
  `linenum` int NOT NULL,
  `timestamp` date NOT NULL,
  `status` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`orderid`, `linenum`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orderstatus
-- ----------------------------
INSERT INTO `orderstatus` VALUES (1000, 1000, '2024-11-16', 'P');
INSERT INTO `orderstatus` VALUES (1001, 1001, '2024-11-16', 'P');
INSERT INTO `orderstatus` VALUES (1002, 1002, '2024-11-16', 'P');
INSERT INTO `orderstatus` VALUES (1003, 1003, '2024-11-16', 'P');
INSERT INTO `orderstatus` VALUES (1004, 1004, '2024-11-16', 'P');
INSERT INTO `orderstatus` VALUES (1005, 1005, '2024-11-17', 'P');
INSERT INTO `orderstatus` VALUES (1006, 1006, '2024-11-20', 'P');
INSERT INTO `orderstatus` VALUES (1007, 1007, '2024-11-20', 'P');
INSERT INTO `orderstatus` VALUES (1008, 1008, '2024-11-20', 'P');
INSERT INTO `orderstatus` VALUES (1009, 1009, '2024-11-20', 'P');
INSERT INTO `orderstatus` VALUES (1010, 1010, '2024-11-21', 'P');
INSERT INTO `orderstatus` VALUES (1011, 1011, '2024-12-18', 'P');
INSERT INTO `orderstatus` VALUES (1012, 1012, '2024-12-20', 'P');
INSERT INTO `orderstatus` VALUES (1013, 1013, '2024-12-20', 'P');
INSERT INTO `orderstatus` VALUES (1014, 1014, '2024-12-20', 'P');
INSERT INTO `orderstatus` VALUES (1015, 1015, '2024-12-20', 'P');
INSERT INTO `orderstatus` VALUES (1016, 1016, '2024-12-22', 'P');
INSERT INTO `orderstatus` VALUES (1017, 1017, '2024-12-22', 'P');
INSERT INTO `orderstatus` VALUES (1018, 1018, '2024-12-22', 'P');
INSERT INTO `orderstatus` VALUES (1020, 1020, '2024-12-22', 'P');
INSERT INTO `orderstatus` VALUES (1021, 1021, '2024-12-22', 'P');
INSERT INTO `orderstatus` VALUES (1022, 1022, '2024-12-22', 'P');
INSERT INTO `orderstatus` VALUES (1024, 1024, '2024-12-22', 'P');
INSERT INTO `orderstatus` VALUES (1025, 1025, '2024-12-22', 'P');
INSERT INTO `orderstatus` VALUES (1026, 1026, '2024-12-22', 'P');
INSERT INTO `orderstatus` VALUES (1027, 1027, '2024-12-22', 'P');
INSERT INTO `orderstatus` VALUES (1028, 1028, '2024-12-22', 'P');
INSERT INTO `orderstatus` VALUES (1029, 1029, '2024-12-22', 'P');
INSERT INTO `orderstatus` VALUES (1030, 1030, '2024-12-22', 'P');
INSERT INTO `orderstatus` VALUES (1031, 1031, '2024-12-22', 'P');
INSERT INTO `orderstatus` VALUES (1032, 1032, '2024-12-22', 'P');
INSERT INTO `orderstatus` VALUES (1033, 1033, '2024-12-22', 'P');
INSERT INTO `orderstatus` VALUES (1034, 1034, '2024-12-22', 'P');
INSERT INTO `orderstatus` VALUES (1035, 1035, '2024-12-22', 'P');
INSERT INTO `orderstatus` VALUES (1036, 1036, '2024-12-22', 'P');
INSERT INTO `orderstatus` VALUES (1038, 1038, '2024-12-22', 'P');
INSERT INTO `orderstatus` VALUES (1039, 1039, '2024-12-22', 'P');
INSERT INTO `orderstatus` VALUES (1040, 1040, '2024-12-22', 'P');
INSERT INTO `orderstatus` VALUES (1041, 1041, '2024-12-22', 'P');
INSERT INTO `orderstatus` VALUES (1042, 1042, '2024-12-22', 'P');
INSERT INTO `orderstatus` VALUES (1043, 1043, '2024-12-22', 'P');
INSERT INTO `orderstatus` VALUES (1044, 1044, '2024-12-22', 'P');
INSERT INTO `orderstatus` VALUES (1045, 1045, '2024-12-22', 'P');
INSERT INTO `orderstatus` VALUES (1046, 1046, '2024-12-22', 'P');
INSERT INTO `orderstatus` VALUES (1047, 1047, '2024-12-22', 'P');
INSERT INTO `orderstatus` VALUES (1048, 1048, '2024-12-22', 'P');
INSERT INTO `orderstatus` VALUES (1049, 1049, '2024-12-22', 'P');
INSERT INTO `orderstatus` VALUES (1050, 1050, '2024-12-22', 'P');
INSERT INTO `orderstatus` VALUES (1051, 1051, '2024-12-22', 'P');
INSERT INTO `orderstatus` VALUES (1052, 1052, '2024-12-22', 'P');
INSERT INTO `orderstatus` VALUES (1053, 1053, '2024-12-22', 'P');
INSERT INTO `orderstatus` VALUES (1054, 1054, '2024-12-22', 'P');
INSERT INTO `orderstatus` VALUES (1055, 1055, '2024-12-22', 'P');
INSERT INTO `orderstatus` VALUES (1056, 1056, '2024-12-22', 'P');
INSERT INTO `orderstatus` VALUES (1057, 1057, '2024-12-22', 'P');
INSERT INTO `orderstatus` VALUES (1058, 1058, '2024-12-22', 'P');
INSERT INTO `orderstatus` VALUES (1059, 1059, '2024-12-25', 'P');
INSERT INTO `orderstatus` VALUES (1060, 1060, '2024-12-25', 'P');
INSERT INTO `orderstatus` VALUES (1061, 1061, '2024-12-25', 'P');
INSERT INTO `orderstatus` VALUES (1062, 1062, '2024-12-25', 'P');
INSERT INTO `orderstatus` VALUES (1063, 1063, '2024-12-25', 'P');
INSERT INTO `orderstatus` VALUES (1064, 1064, '2024-12-25', 'P');
INSERT INTO `orderstatus` VALUES (1065, 1065, '2024-12-25', 'P');
INSERT INTO `orderstatus` VALUES (1066, 1066, '2024-12-25', 'P');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `productid` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `category` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `descn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`productid`) USING BTREE,
  INDEX `productCat`(`category` ASC) USING BTREE,
  INDEX `productName`(`name` ASC) USING BTREE,
  CONSTRAINT `fk_product_1` FOREIGN KEY (`category`) REFERENCES `category` (`catid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

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
  `userid` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `langpref` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `favcategory` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `mylistopt` int NULL DEFAULT NULL,
  `banneropt` int NULL DEFAULT NULL,
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of profile
-- ----------------------------
INSERT INTO `profile` VALUES ('123', 'english', 'CATS', 1, 1);
INSERT INTO `profile` VALUES ('123456', 'english', 'DOGS', 1, 1);
INSERT INTO `profile` VALUES ('222', 'english', 'BIRDS', 1, 1);
INSERT INTO `profile` VALUES ('233', 'english', 'CATS', 1, 1);
INSERT INTO `profile` VALUES ('345', 'english', 'CATS', 1, 1);
INSERT INTO `profile` VALUES ('5566', 'english', 'DOGS', 1, 1);
INSERT INTO `profile` VALUES ('741', 'english', 'FISH', 1, 1);
INSERT INTO `profile` VALUES ('789', 'english', 'CATS', 1, 1);
INSERT INTO `profile` VALUES ('ACID', 'english', 'CATS', 1, 1);
INSERT INTO `profile` VALUES ('config', 'english', 'BIRDS', 1, 1);
INSERT INTO `profile` VALUES ('io', 'english', 'DOGS', 1, 1);
INSERT INTO `profile` VALUES ('j2ee', 'english', 'DOGS', 1, 1);
INSERT INTO `profile` VALUES ('sdfc', 'english', 'CATS', 1, 1);
INSERT INTO `profile` VALUES ('vb', 'english', 'DOGS', 1, 1);

-- ----------------------------
-- Table structure for sequence
-- ----------------------------
DROP TABLE IF EXISTS `sequence`;
CREATE TABLE `sequence`  (
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nextid` int NOT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sequence
-- ----------------------------
INSERT INTO `sequence` VALUES ('ordernum', 1067);

-- ----------------------------
-- Table structure for signon
-- ----------------------------
DROP TABLE IF EXISTS `signon`;
CREATE TABLE `signon`  (
  `username` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of signon
-- ----------------------------
INSERT INTO `signon` VALUES ('123', '123');
INSERT INTO `signon` VALUES ('123456', '123456');
INSERT INTO `signon` VALUES ('222', '222');
INSERT INTO `signon` VALUES ('233', '123456');
INSERT INTO `signon` VALUES ('345', '234');
INSERT INTO `signon` VALUES ('5566', '5566');
INSERT INTO `signon` VALUES ('741', '741');
INSERT INTO `signon` VALUES ('789', '789');
INSERT INTO `signon` VALUES ('ACID', 'ACID');
INSERT INTO `signon` VALUES ('config', 'config');
INSERT INTO `signon` VALUES ('io', 'io');
INSERT INTO `signon` VALUES ('j2ee', 'j2ee');
INSERT INTO `signon` VALUES ('sdfc', '123456');
INSERT INTO `signon` VALUES ('vb', 'vb');

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier`  (
  `suppid` int NOT NULL,
  `name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `status` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `addr1` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `addr2` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `city` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `state` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `zip` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`suppid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES (1, 'XYZ Pets', 'AC', '600 Avon Way', '', 'Los Angeles', 'CA', '94024', '212-947-0797');
INSERT INTO `supplier` VALUES (2, 'ABC Pets', 'AC', '700 Abalone Way', '', 'San Francisco ', 'CA', '94024', '415-947-0797');

SET FOREIGN_KEY_CHECKS = 1;
