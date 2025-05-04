/*
 Navicat Premium Data Transfer

 Source Server         : demo
 Source Server Type    : MySQL
 Source Server Version : 80037 (8.0.37)
 Source Host           : localhost:3306
 Source Schema         : test1

 Target Server Type    : MySQL
 Target Server Version : 80037 (8.0.37)
 File Encoding         : 65001

 Date: 04/05/2025 14:43:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for browsepost
-- ----------------------------
DROP TABLE IF EXISTS `browsepost`;
CREATE TABLE `browsepost`  (
  `browse_post_id` int NOT NULL AUTO_INCREMENT,
  `userId` int NULL DEFAULT NULL,
  `postId` int NULL DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `browse_time` int NULL DEFAULT NULL COMMENT '单位：秒',
  PRIMARY KEY (`browse_post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for collectpost
-- ----------------------------
DROP TABLE IF EXISTS `collectpost`;
CREATE TABLE `collectpost`  (
  `collectPostId` int NOT NULL AUTO_INCREMENT,
  `userId` int NULL DEFAULT NULL,
  `postId` int NULL DEFAULT NULL,
  `ImageStr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `isRead` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`collectPostId`) USING BTREE,
  INDEX `userId`(`userId` ASC) USING BTREE,
  INDEX `postId`(`postId` ASC) USING BTREE,
  CONSTRAINT `collectpost_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `collectpost_ibfk_2` FOREIGN KEY (`postId`) REFERENCES `post` (`postId`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `commentId` int NOT NULL AUTO_INCREMENT,
  `postId` int NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `userId` int NULL DEFAULT NULL,
  `commentDate` date NULL DEFAULT NULL,
  `likeCount` int NULL DEFAULT 0,
  `replyCount` int NULL DEFAULT 0,
  `publishTime` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`commentId`) USING BTREE,
  INDEX `postId`(`postId` ASC) USING BTREE,
  INDEX `receiveUserId`(`userId` ASC) USING BTREE,
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`postId`) REFERENCES `post` (`postId`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `comment_ibfk_3` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for conversation
-- ----------------------------
DROP TABLE IF EXISTS `conversation`;
CREATE TABLE `conversation`  (
  `conversationId` int NOT NULL AUTO_INCREMENT,
  `userId` int NULL DEFAULT NULL,
  `question` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `historyConversationId` int NULL DEFAULT NULL,
  `answer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`conversationId`) USING BTREE,
  INDEX `userId`(`userId` ASC) USING BTREE,
  INDEX `historyConversationId`(`historyConversationId` ASC) USING BTREE,
  CONSTRAINT `conversation_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `conversation_ibfk_2` FOREIGN KEY (`historyConversationId`) REFERENCES `historyconversation` (`historyConversationId`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 69 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for event
-- ----------------------------
DROP TABLE IF EXISTS `event`;
CREATE TABLE `event`  (
  `eventId` int NOT NULL AUTO_INCREMENT,
  `planId` int NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `executionDate` date NULL DEFAULT NULL,
  `startTime` time NULL DEFAULT NULL,
  `endTime` time NULL DEFAULT NULL,
  `isCompleted` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`eventId`) USING BTREE,
  INDEX `planId`(`planId` ASC) USING BTREE,
  CONSTRAINT `event_ibfk_1` FOREIGN KEY (`planId`) REFERENCES `plan` (`planId`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 85 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for followuser
-- ----------------------------
DROP TABLE IF EXISTS `followuser`;
CREATE TABLE `followuser`  (
  `followUserId` int NOT NULL AUTO_INCREMENT,
  `followerId` int NOT NULL,
  `followeeId` int NOT NULL,
  PRIMARY KEY (`followUserId`) USING BTREE,
  INDEX `fk_sendUser`(`followerId` ASC) USING BTREE,
  INDEX `fk_receiveUser`(`followeeId` ASC) USING BTREE,
  CONSTRAINT `fk_receiveUser` FOREIGN KEY (`followeeId`) REFERENCES `user` (`userId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_sendUser` FOREIGN KEY (`followerId`) REFERENCES `user` (`userId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for historyconversation
-- ----------------------------
DROP TABLE IF EXISTS `historyconversation`;
CREATE TABLE `historyconversation`  (
  `historyConversationId` int NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `userId` int NULL DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT (now()),
  `planId` int NULL DEFAULT NULL,
  PRIMARY KEY (`historyConversationId`) USING BTREE,
  INDEX `userId`(`userId` ASC) USING BTREE,
  INDEX `planId`(`planId` ASC) USING BTREE,
  CONSTRAINT `historyconversation_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `historyconversation_ibfk_2` FOREIGN KEY (`planId`) REFERENCES `plan` (`planId`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for likecomments
-- ----------------------------
DROP TABLE IF EXISTS `likecomments`;
CREATE TABLE `likecomments`  (
  `LikeCommentId` int NOT NULL AUTO_INCREMENT,
  `userId` int NULL DEFAULT NULL,
  `commentId` int NULL DEFAULT NULL,
  `ImageStr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `isRead` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`LikeCommentId`) USING BTREE,
  INDEX `userId`(`userId` ASC) USING BTREE,
  INDEX `commentId`(`commentId` ASC) USING BTREE,
  CONSTRAINT `likecomments_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `likecomments_ibfk_2` FOREIGN KEY (`commentId`) REFERENCES `comment` (`commentId`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for likepost
-- ----------------------------
DROP TABLE IF EXISTS `likepost`;
CREATE TABLE `likepost`  (
  `LikePostId` int NOT NULL AUTO_INCREMENT,
  `userId` int NULL DEFAULT NULL,
  `postId` int NULL DEFAULT NULL,
  `ImageStr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `isRead` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`LikePostId`) USING BTREE,
  INDEX `userId`(`userId` ASC) USING BTREE,
  INDEX `postId`(`postId` ASC) USING BTREE,
  CONSTRAINT `likepost_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `likepost_ibfk_2` FOREIGN KEY (`postId`) REFERENCES `post` (`postId`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for likereply
-- ----------------------------
DROP TABLE IF EXISTS `likereply`;
CREATE TABLE `likereply`  (
  `likeReplyId` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `replyId` int NOT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`likeReplyId`) USING BTREE,
  INDEX `fk_user`(`userId` ASC) USING BTREE,
  INDEX `fk_reply`(`replyId` ASC) USING BTREE,
  CONSTRAINT `fk_reply` FOREIGN KEY (`replyId`) REFERENCES `reply` (`replyId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_user` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager`  (
  `managerId` int NOT NULL AUTO_INCREMENT,
  `managerName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`managerId`) USING BTREE,
  UNIQUE INDEX `managerName`(`managerName` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for plan
-- ----------------------------
DROP TABLE IF EXISTS `plan`;
CREATE TABLE `plan`  (
  `planId` int NOT NULL AUTO_INCREMENT,
  `userId` int NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `completion_percentage` int NULL DEFAULT NULL,
  `startDate` date NULL DEFAULT NULL,
  `endDate` date NULL DEFAULT NULL,
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`planId`) USING BTREE,
  CONSTRAINT `plan_chk_1` CHECK (`completion_percentage` between 0 and 100)
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post`  (
  `postId` int NOT NULL AUTO_INCREMENT,
  `userId` int NULL DEFAULT NULL,
  `isViewable` tinyint(1) NULL DEFAULT 1,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `publishDate` date NULL DEFAULT NULL,
  `LikeCount` int NULL DEFAULT 0,
  `FavCount` int NULL DEFAULT 0,
  `CommentCount` int NULL DEFAULT 0,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`postId`) USING BTREE,
  INDEX `idx_userId`(`userId` ASC) USING BTREE,
  INDEX `idx_publishDate`(`publishDate` ASC) USING BTREE,
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for reply
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply`  (
  `replyId` int NOT NULL AUTO_INCREMENT,
  `commentId` int NULL DEFAULT NULL,
  `replyToId` int NULL DEFAULT NULL,
  `userId` int NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `replyDate` date NULL DEFAULT NULL,
  `likeCount` int NULL DEFAULT 0,
  `publishTime` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`replyId`) USING BTREE,
  INDEX `commentId`(`commentId` ASC) USING BTREE,
  INDEX `replyToId`(`replyToId` ASC) USING BTREE,
  INDEX `userId`(`userId` ASC) USING BTREE,
  CONSTRAINT `reply_ibfk_1` FOREIGN KEY (`commentId`) REFERENCES `comment` (`commentId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `reply_ibfk_2` FOREIGN KEY (`replyToId`) REFERENCES `reply` (`replyId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `reply_ibfk_3` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `userId` int NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nickName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `avatarImg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `registerTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `myScore` int NULL DEFAULT 0,
  `isLogin` tinyint(3) UNSIGNED ZEROFILL NOT NULL,
  `isPost` tinyint NULL DEFAULT NULL,
  PRIMARY KEY (`userId`) USING BTREE,
  UNIQUE INDEX `userName`(`userName` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for userprofile
-- ----------------------------
DROP TABLE IF EXISTS `userprofile`;
CREATE TABLE `userprofile`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `gender` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `age` int NULL DEFAULT NULL,
  `education_stage` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `interested_fields` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `skill_level` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `study_style` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `future_goal` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `embedding` blob NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`userId` ASC) USING BTREE,
  CONSTRAINT `userprofile_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
