/*
 Navicat Premium Data Transfer

 Source Server         : Quantization
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : 127.0.0.1:3306
 Source Schema         : tushare

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 18/06/2019 14:26:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for stock_daily
-- ----------------------------
DROP TABLE IF EXISTS `stock_daily`;
CREATE TABLE `stock_daily`  (
  `ts_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '股票代码',
  `trade_date` date NOT NULL COMMENT '交易日期',
  `open` double NULL DEFAULT NULL COMMENT '开盘价',
  `high` double NULL DEFAULT NULL COMMENT '最高价',
  `low` double NULL DEFAULT NULL COMMENT '最低价',
  `close` double NULL DEFAULT NULL COMMENT '收盘价',
  `pre_close` double NULL DEFAULT NULL COMMENT '昨日收盘价',
  `change` double NULL DEFAULT NULL COMMENT '涨跌额',
  `pct_chg` double NULL DEFAULT NULL COMMENT '涨跌幅',
  `vol` double NULL DEFAULT NULL COMMENT '成交量 （手）',
  `amount` double NULL DEFAULT NULL COMMENT '成交额 （千元）',
  `turnover_rate` double NULL DEFAULT NULL COMMENT '换手率',
  `volume_ratio` double NULL DEFAULT NULL COMMENT '量比',
  `ma5` double NULL DEFAULT NULL COMMENT '5日均线',
  `ma_v_5` double NULL DEFAULT NULL COMMENT '5日均量',
  `ma10` double NULL DEFAULT NULL COMMENT '10日均线',
  `ma_v_10` double NULL DEFAULT NULL COMMENT '10日均量',
  `ma20` double NULL DEFAULT NULL COMMENT '20日均线',
  `ma_v_20` double NULL DEFAULT NULL COMMENT '20日均量',
  `ma30` double NULL DEFAULT NULL COMMENT '30日均线',
  `ma_v_30` double NULL DEFAULT NULL COMMENT '30日均量',
  `ma60` double NULL DEFAULT NULL COMMENT '60日均线',
  `ma_v_60` double NULL DEFAULT NULL COMMENT '60日均量',
  `ma120` double NULL DEFAULT NULL COMMENT '120日均线',
  `ma_v_120` double NULL DEFAULT NULL COMMENT '120日均量',
  `ma250` double NULL DEFAULT NULL COMMENT '250日均线',
  `ma_v_250` double NULL DEFAULT NULL COMMENT '250日均量',
  UNIQUE INDEX `ts_code_date`(`ts_code`, `trade_date`) USING BTREE COMMENT '以股票代码和日期作为主键',
  INDEX `ts_code`(`ts_code`) USING BTREE,
  INDEX `trade_date`(`trade_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stock_list
-- ----------------------------
DROP TABLE IF EXISTS `stock_list`;
CREATE TABLE `stock_list`  (
  `ts_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'TS代码',
  `symbol` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '股票代码',
  `name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '股票名称',
  `area` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在地域',
  `industry` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所属行业',
  `fullname` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '股票全称',
  `enname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '英文全称',
  `market` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '市场类型 （主板/中小板/创业板）',
  `exchange` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交易所代码',
  `curr_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交易货币',
  `list_status` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '	上市状态： L上市 D退市 P暂停上市',
  `list_date` date NULL DEFAULT NULL COMMENT '上市日期',
  `delist_date` date NULL DEFAULT NULL COMMENT '退市日期',
  `is_hs` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否沪深港通标的，N否 H沪股通 S深股通',
  PRIMARY KEY (`ts_code`, `symbol`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for trade_cal
-- ----------------------------
DROP TABLE IF EXISTS `trade_cal`;
CREATE TABLE `trade_cal`  (
  `cal_date` date NOT NULL COMMENT '日历日期',
  `is_open` int(1) NULL DEFAULT NULL COMMENT '是否交易 0休市 1交易',
  `pretrade_date` date NULL DEFAULT NULL COMMENT '上一个交易日',
  PRIMARY KEY (`cal_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
