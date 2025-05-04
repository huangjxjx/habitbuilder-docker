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

 Date: 04/05/2025 16:05:38
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
-- Records of browsepost
-- ----------------------------

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
-- Records of collectpost
-- ----------------------------
INSERT INTO `collectpost` VALUES (2, 7, 12, NULL, NULL);

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
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (15, 12, '哇学到了学到了', 9, '2025-04-15', 0, 0, '2025-04-15 16:30:16.525781');
INSERT INTO `comment` VALUES (16, 12, '尊嘟有用，感恩博主', 10, '2025-04-15', 0, 0, '2025-04-15 16:38:06.803541');

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
-- Records of conversation
-- ----------------------------
INSERT INTO `conversation` VALUES (1, 7, '我想查看当前的详细计划', '2025-03-17 01:23:56', 3, '当然可以！你目前的计划如下：\n\n第一天: 热身运动（5分钟）：全身拉伸。力量训练（45分钟）：深蹲3组12次，卧推3组12次，硬拉3组12次，俯身划船3组12次。有氧运动（20分钟）：跑步或跳绳。拉伸放松（5分钟）\n第二天: 热身运动（5分钟）：全身拉伸。力量训练（45分钟）：哑铃肩推3组12次，俯卧撑3组15次，坐姿划船3组12次，卷腹3组20次。有氧运动（20分钟）：椭圆机或划船器。拉伸放松（5分钟）\n第三天: 热身运动（5分钟）：全身拉伸。力量训练（45分钟）：深蹲3组12次，卧推3组12次，引体向上3组8次，腿举3组12次。有氧运动（20分钟）：慢跑或游泳。拉伸放松（5分钟）\n第四天: 热身运动（5分钟）：全身拉伸。力量训练（45分钟）：哑铃侧平举3组12次，俯身飞鸟3组12次，坐姿推胸3组12次，仰卧起坐3组20次。有氧运动（20分钟）：动感单车或椭圆机。拉伸放松（5分钟）\n第五天: 休息日，进行轻度拉伸和放松活动，避免剧烈运动。\n第六天: 热身运动（5分钟）：全身拉伸。力量训练（45分钟）：深蹲3组12次，卧推3组12次，单臂划船3组12次，负重卷腹3组20次。有氧运动（20分钟）：跑步或跳绳。拉伸放松（5分钟）\n第七天: 热身运动（5分钟）：全身拉伸。力量训练（45分钟）：哑铃肩推3组12次，俯卧撑3组15次，坐姿划船3组12次，卷腹3组20次。有氧运动（20分钟）：椭圆机或划船器。拉伸放松（5分钟）');
INSERT INTO `conversation` VALUES (2, 7, '请你帮我修改一下当前的计划', '2025-03-17 01:27:18', 3, '当然可以!请告诉我你的修改要求');
INSERT INTO `conversation` VALUES (3, 7, '我要以力量训练为主，不做有氧', '2025-03-17 01:28:02', 3, '修改后计划如下：\n\n第一天: 热身运动（5分钟）：全身拉伸。力量训练（45分钟）：深蹲3组12次，卧推3组12次，硬拉3组12次，俯身划船3组12次。拉伸放松（5分钟）\n第二天: 热身运动（5分钟）：全身拉伸。力量训练（45分钟）：哑铃肩推3组12次，俯卧撑3组15次，坐姿划船3组12次，卷腹3组20次。拉伸放松（5分钟）\n第三天: 热身运动（5分钟）：全身拉伸。力量训练（45分钟）：深蹲3组12次，卧推3组12次，引体向上3组8次，腿举3组12次。有氧运动（省略）。拉伸放松（5分钟）\n第四天: 热身运动（5分钟）：全身拉伸。力量训练（45分钟）：哑铃侧平举3组12次，俯身飞鸟3组12次，坐姿推胸3组12次，仰卧起坐3组20次。有氧运动（省略）。拉伸放松（5分钟）\n第五天: 休息日，进行轻度拉伸和放松活动，避免剧烈运动。\n第六天: 热身运动（5分钟）：全身拉伸。力量训练（45分钟）：深蹲3组12次，卧推3组12次，单臂划船3组12次，负重卷腹3组20次。拉伸放松（5分钟）\n第七天: 热身运动（5分钟）：全身拉伸。力量训练（45分钟）：哑铃肩推3组12次，俯卧撑3组15次，坐姿划船3组12次，卷腹3组20次。拉伸放松（5分钟）\n\n如果要应用该计划,请点击\'确认修改\'按钮');
INSERT INTO `conversation` VALUES (4, 7, '确认修改', '2025-03-17 01:28:13', 3, '修改成功!');
INSERT INTO `conversation` VALUES (5, 7, '我想查看当前的详细计划', '2025-03-17 01:29:33', 4, '当然可以！你目前的计划如下：\n\n第一天: 了解基本的时尚理论和搭配原则，包括色彩搭配、版型选择、服饰层次等。在各大时尚网站或App上浏览潮流资讯，关注当季流行趋势。整理现有衣橱，分类归纳，找出可再利用的基本单品。\n第二天: 学习如何根据自己的身形选择合适的服装，进行个人风格定位。购买或借阅几本时尚杂志，研究不同场合的着装建议。尝试将基础单品与新发现的潮流元素结合，进行简单的搭配练习。\n第三天: 深入研究不同风格（如街头风、商务休闲风、复古风等）的特点和搭配技巧。在线观看时尚博主的穿搭视频，学习他们的搭配思路。记录下自己喜欢的搭配组合，并尝试在日常中实践。\n第四天: 探索配饰在整体造型中的作用，学习如何选择合适的鞋子、帽子、手表等配饰来提升整体形象。实践搭配之前设计的几个风格不同的look，体验不同风格带来的不同感觉。\n第五天: 学习如何通过穿搭展现自信，以及如何通过小细节（如袜子颜色、皮带搭配等）来体现个人品味。参考时尚达人的社交媒体账号，了解他们如何通过日常穿搭表达自我。\n第六天: 回顾过去一周的学习和实践，总结哪些搭配成功，哪些需要改进。在镜子前多次试穿，确保每件衣服都符合自己对潮流的理解和风格定位。考虑加入一些个性化元素，使穿搭更加独特。\n第七天: 将所学知识应用于实际生活中，参加一次朋友聚会或外出活动，展示你的新穿搭风格。收集他人的反馈，了解自己的优点和需要改进的地方。持续关注时尚动态，保持学习和实践的热情。');
INSERT INTO `conversation` VALUES (6, 7, '请你帮我修改一下当前的计划', '2025-03-17 01:29:46', 4, '当然可以!请告诉我你的修改要求');
INSERT INTO `conversation` VALUES (7, 7, '我想查看当前的详细计划', '2025-03-17 01:30:35', 4, '当然可以！你目前的计划如下：\n\n第一天: 了解基本的时尚理论和搭配原则，包括色彩搭配、版型选择、服饰层次等。在各大时尚网站或App上浏览潮流资讯，关注当季流行趋势。整理现有衣橱，分类归纳，找出可再利用的基本单品。\n第二天: 学习如何根据自己的身形选择合适的服装，进行个人风格定位。购买或借阅几本时尚杂志，研究不同场合的着装建议。尝试将基础单品与新发现的潮流元素结合，进行简单的搭配练习。\n第三天: 深入研究不同风格（如街头风、商务休闲风、复古风等）的特点和搭配技巧。在线观看时尚博主的穿搭视频，学习他们的搭配思路。记录下自己喜欢的搭配组合，并尝试在日常中实践。\n第四天: 探索配饰在整体造型中的作用，学习如何选择合适的鞋子、帽子、手表等配饰来提升整体形象。实践搭配之前设计的几个风格不同的look，体验不同风格带来的不同感觉。\n第五天: 学习如何通过穿搭展现自信，以及如何通过小细节（如袜子颜色、皮带搭配等）来体现个人品味。参考时尚达人的社交媒体账号，了解他们如何通过日常穿搭表达自我。\n第六天: 回顾过去一周的学习和实践，总结哪些搭配成功，哪些需要改进。在镜子前多次试穿，确保每件衣服都符合自己对潮流的理解和风格定位。考虑加入一些个性化元素，使穿搭更加独特。\n第七天: 将所学知识应用于实际生活中，参加一次朋友聚会或外出活动，展示你的新穿搭风格。收集他人的反馈，了解自己的优点和需要改进的地方。持续关注时尚动态，保持学习和实践的热情。');
INSERT INTO `conversation` VALUES (8, 7, '请你帮我修改一下当前的计划', '2025-03-17 01:30:50', 4, '当然可以!请告诉我你的修改要求');
INSERT INTO `conversation` VALUES (9, 7, '请你帮我修改一下当前的计划', '2025-03-17 01:32:38', 4, '当然可以!请告诉我你的修改要求');
INSERT INTO `conversation` VALUES (10, 7, '我想查看当前的详细计划', '2025-03-17 11:15:24', 5, '当然可以！你目前的计划如下：\n\n第一天: 热身运动10分钟（慢跑或跳绳）\n全身力量训练：卧推3组8次，深蹲4组10次，硬拉3组8次\n有氧运动：跑步机快走30分钟\n拉伸放松5分钟\n第二天: 热身运动10分钟（瑜伽或普拉提）\n上半身力量训练：引体向上3组6次，哑铃飞鸟3组8次，俯身飞鸟3组8次\n有氧运动：游泳30分钟\n拉伸放松5分钟\n第三天: 休息日，进行轻度活动如散步或轻松瑜伽，避免高强度运动\n第四天: 热身运动10分钟（跳绳或动感单车）\n下半身力量训练：腿举3组10次，坐姿腿弯举3组10次，提踵3组10次\n有氧运动：椭圆机30分钟\n拉伸放松5分钟\n第五天: 热身运动10分钟（普拉提或瑜伽）\n核心力量训练：平板支撑3组30秒，俄罗斯转体3组20次，仰卧起坐3组15次\n有氧运动：跳绳30分钟\n拉伸放松5分钟\n第六天: 休息日，进行轻度活动如散步或轻松瑜伽，避免高强度运动\n第七天: 热身运动10分钟（跳绳或动感单车）\n全身力量训练：深蹲4组12次，卧推3组10次，硬拉3组10次\n有氧运动：划船机30分钟\n拉伸放松5分钟');
INSERT INTO `conversation` VALUES (11, 8, '我想查看当前的详细计划', '2025-03-31 15:42:56', 6, '当然可以！你目前的计划如下：\n\n第一天: 学习操作系统基础概念：操作系统定义、功能与分类（批处理、分时、实时系统），了解内核态与用户态区别。搭建实验环境（如VirtualBox安装Linux虚拟机），熟悉基本命令行操作。阅读《操作系统导论》第一章，完成核心概念思维导图。\n第二天: 深入进程管理：进程与线程概念、PCB结构、进程状态转换。通过代码实现多进程通信（管道/FIFO），分析进程调度算法（FCFS/SJF/RR）。使用top命令监控进程，完成调度算法对比表格，撰写实验报告。\n第三天: 研究内存管理：物理/虚拟地址空间、连续分配策略（分页/分段）。实现简单内存分配模拟程序，分析页面置换算法（FIFO/LRU）。通过free命令观察内存使用，比较内部/外部碎片问题，总结优化方案。\n第四天: 探索文件系统：文件结构（inode/FAT）、目录实现、磁盘调度算法（SCAN/C-SCAN）。使用Linux命令操作文件权限与链接，编写文件读写程序。分析EXT4/NTFS特性差异，设计小型文件系统架构草图。\n第五天: 学习I/O系统：设备控制器、DMA机制、缓冲技术。编写字符设备驱动demo，测试中断处理流程。使用iostat监控磁盘IO，比较同步/异步I/O效率。完成设备管理思维导图，研究USB驱动框架。\n第六天: 掌握虚拟化技术：虚拟机监视器（Hypervisor）原理、容器化基础（Docker架构）。部署容器运行Web服务，对比虚拟机/容器性能差异。研究KVM虚拟化方案，完成虚拟化技术演进时间轴。\n第七天: 综合实践：设计简易操作系统原型（Bootloader+内核模块），实现进程创建/文件操作功能。分析Linux启动流程（BIOS→GRUB→Kernel），调试系统调用过程。总结七日知识体系，制定后续学习路线图。');
INSERT INTO `conversation` VALUES (12, 8, '请你帮我修改一下当前的计划', '2025-03-31 15:44:27', 6, '当然可以!请告诉我你的修改要求');
INSERT INTO `conversation` VALUES (13, 8, '我想查看当前的详细计划', '2025-03-31 15:46:44', 6, '当然可以！你目前的计划如下：\n\n第一天: 学习操作系统基础概念：操作系统定义、功能与分类（批处理、分时、实时系统），了解内核态与用户态区别。搭建实验环境（如VirtualBox安装Linux虚拟机），熟悉基本命令行操作。阅读《操作系统导论》第一章，完成核心概念思维导图。\n第二天: 深入进程管理：进程与线程概念、PCB结构、进程状态转换。通过代码实现多进程通信（管道/FIFO），分析进程调度算法（FCFS/SJF/RR）。使用top命令监控进程，完成调度算法对比表格，撰写实验报告。\n第三天: 研究内存管理：物理/虚拟地址空间、连续分配策略（分页/分段）。实现简单内存分配模拟程序，分析页面置换算法（FIFO/LRU）。通过free命令观察内存使用，比较内部/外部碎片问题，总结优化方案。\n第四天: 探索文件系统：文件结构（inode/FAT）、目录实现、磁盘调度算法（SCAN/C-SCAN）。使用Linux命令操作文件权限与链接，编写文件读写程序。分析EXT4/NTFS特性差异，设计小型文件系统架构草图。\n第五天: 学习I/O系统：设备控制器、DMA机制、缓冲技术。编写字符设备驱动demo，测试中断处理流程。使用iostat监控磁盘IO，比较同步/异步I/O效率。完成设备管理思维导图，研究USB驱动框架。\n第六天: 掌握虚拟化技术：虚拟机监视器（Hypervisor）原理、容器化基础（Docker架构）。部署容器运行Web服务，对比虚拟机/容器性能差异。研究KVM虚拟化方案，完成虚拟化技术演进时间轴。\n第七天: 综合实践：设计简易操作系统原型（Bootloader+内核模块），实现进程创建/文件操作功能。分析Linux启动流程（BIOS→GRUB→Kernel），调试系统调用过程。总结七日知识体系，制定后续学习路线图。');
INSERT INTO `conversation` VALUES (14, 8, '放弃修改', '2025-03-31 15:47:23', 6, '好的。如果有其他需求，请跟我说');
INSERT INTO `conversation` VALUES (15, 8, '请你帮我修改一下当前的计划', '2025-03-31 15:48:54', 6, '当然可以!请告诉我你的修改要求');
INSERT INTO `conversation` VALUES (16, 8, '请你帮我修改一下当前的计划', '2025-03-31 16:06:14', 6, '当然可以!请告诉我你的修改要求');
INSERT INTO `conversation` VALUES (17, 8, '请你帮我修改一下当前的计划', '2025-03-31 16:10:35', 6, '当然可以!请告诉我你的修改要求');
INSERT INTO `conversation` VALUES (18, 8, '我要多学习进程管理', '2025-03-31 16:12:44', 6, '修改后计划如下：\n\n第一天: 学习操作系统核心概念：定义、功能（资源管理/程序控制）、分类（批处理/分时/实时）。理解内核态与用户态差异及切换机制。安装VirtualBox并配置Ubuntu虚拟机，掌握基础Shell命令（ls/cd/mkdir等）。精读《操作系统导论》第一章，整理思维导图涵盖系统调用、中断处理、特权级别等核心概念。\n第二天: 深度解析进程管理：进程生命周期（创建/就绪/运行/阻塞/终止）、PCB详细结构（PID/状态/寄存器值）。编码实现多进程通信（匿名管道/FIFO命名管道），扩展实现信号量与共享内存。对比分析FCFS/SJF/RR调度算法，编写模拟程序并统计平均等待时间。使用strace跟踪进程系统调用，完成含上下文切换开销的对比实验报告。\n第三天: 强化进程高级主题：实现多线程同步（互斥锁/条件变量），设计生产者-消费者模型。研究Linux CFS调度器原理，编写优先级反转案例代码。使用perf分析进程性能瓶颈，通过gdb调试死锁场景。完成含线程局部存储(TLS)/线程池实现的扩展实验，制作进程关系树形图（pstree）。\n第四天: 研究内存管理：虚拟地址转换过程（MMU/页表），实现Buddy分配算法模拟器。编码测试页面置换算法（FIFO/LRU/Clock），统计缺页率变化曲线。使用Valgrind检测内存泄漏，分析slab分配器原理。对比分段/分页优缺点，撰写含外部碎片解决方案（紧凑技术）的总结文档。\n第五天: 探索文件系统：实现EXT2目录树遍历程序，编写FUSE自定义文件系统。对比SCAN/C-LOOK磁盘调度算法性能，使用dd/fio测试IO吞吐量。分析硬链接与符号链接实现差异，完成NTFS日志功能与EXT4扩展属性对比表。设计支持LRU缓存的文件系统架构图。\n第六天: 深入I/O与虚拟化：编写字符设备驱动（实现read/write/ioctl），测试DMA传输性能。使用cgroups实现进程资源隔离，对比KVM/QEMU与Docker的进程视图差异。通过ftrace追踪系统调用链，绘制虚拟机与宿主机进程交互流程图，完成容器网络命名空间配置实验。\n第七天: 综合实战：开发微内核进程管理器（实现fork/exec/wait），集成Round-Robin调度模块。使用QEMU调试内核级线程切换，分析进程描述符(task_struct)内存布局。制作七日知识全景脑图，规划包含协程/分布式调度的后续学习路径，提交完整实验代码仓库。\n\n如果要应用该计划,请点击\'确认修改\'按钮');
INSERT INTO `conversation` VALUES (19, 8, '确认修改', '2025-03-31 16:13:34', 6, '修改成功!');
INSERT INTO `conversation` VALUES (20, 8, '我想查看当前的详细计划', '2025-03-31 16:13:38', 6, '当然可以！你目前的计划如下：\n\n第一天: 学习操作系统核心概念：定义、功能（资源管理/程序控制）、分类（批处理/分时/实时）。理解内核态与用户态差异及切换机制。安装VirtualBox并配置Ubuntu虚拟机，掌握基础Shell命令（ls/cd/mkdir等）。精读《操作系统导论》第一章，整理思维导图涵盖系统调用、中断处理、特权级别等核心概念。\n第二天: 深度解析进程管理：进程生命周期（创建/就绪/运行/阻塞/终止）、PCB详细结构（PID/状态/寄存器值）。编码实现多进程通信（匿名管道/FIFO命名管道），扩展实现信号量与共享内存。对比分析FCFS/SJF/RR调度算法，编写模拟程序并统计平均等待时间。使用strace跟踪进程系统调用，完成含上下文切换开销的对比实验报告。\n第三天: 强化进程高级主题：实现多线程同步（互斥锁/条件变量），设计生产者-消费者模型。研究Linux CFS调度器原理，编写优先级反转案例代码。使用perf分析进程性能瓶颈，通过gdb调试死锁场景。完成含线程局部存储(TLS)/线程池实现的扩展实验，制作进程关系树形图（pstree）。\n第四天: 研究内存管理：虚拟地址转换过程（MMU/页表），实现Buddy分配算法模拟器。编码测试页面置换算法（FIFO/LRU/Clock），统计缺页率变化曲线。使用Valgrind检测内存泄漏，分析slab分配器原理。对比分段/分页优缺点，撰写含外部碎片解决方案（紧凑技术）的总结文档。\n第五天: 探索文件系统：实现EXT2目录树遍历程序，编写FUSE自定义文件系统。对比SCAN/C-LOOK磁盘调度算法性能，使用dd/fio测试IO吞吐量。分析硬链接与符号链接实现差异，完成NTFS日志功能与EXT4扩展属性对比表。设计支持LRU缓存的文件系统架构图。\n第六天: 深入I/O与虚拟化：编写字符设备驱动（实现read/write/ioctl），测试DMA传输性能。使用cgroups实现进程资源隔离，对比KVM/QEMU与Docker的进程视图差异。通过ftrace追踪系统调用链，绘制虚拟机与宿主机进程交互流程图，完成容器网络命名空间配置实验。\n第七天: 综合实战：开发微内核进程管理器（实现fork/exec/wait），集成Round-Robin调度模块。使用QEMU调试内核级线程切换，分析进程描述符(task_struct)内存布局。制作七日知识全景脑图，规划包含协程/分布式调度的后续学习路径，提交完整实验代码仓库。');
INSERT INTO `conversation` VALUES (22, 7, '我想查看当前的详细计划', '2025-04-14 22:15:50', 8, '当然可以！你目前的计划如下：\n\n第一天: 巩固Java核心语法与OOP概念，重点复习集合框架、多线程与IO操作。完成一个基于控制台的图书管理系统（增删改查），使用Maven管理依赖，为Spring Boot铺垫基础。\n第二天: 学习Spring基础：IoC容器、Bean生命周期与AOP原理。通过XML和注解两种方式实现依赖注入，完成一个银行账户事务管理Demo，记录日志与事务时间。\n第三天: Spring Boot入门：使用Spring Initializr创建项目，解析自动配置原理。开发RESTful API实现用户信息查询（含GET/POST请求），集成Swagger生成接口文档。\n第四天: 数据持久化实战：整合Spring Data JPA与Hibernate，配置H2内存数据库。实现博客系统的文章管理模块（含分页查询），学习@Query自定义JPQL语句。\n第五天: 中间件集成：通过Spring Boot整合Redis实现热点数据缓存。优化第三天开发的用户查询接口，添加缓存击穿保护策略，使用JMeter进行性能压测对比。\n第六天: 进阶功能实践：全局异常处理、拦截器实现权限校验、日志框架配置（SLF4J+Logback）。为博客系统添加JWT鉴权功能，设计RBAC权限模型。\n第七天: 综合项目：开发学生选课系统（含课程发布/选课/成绩查询）。整合MyBatis-Plus、Redis缓存、邮件通知模块，部署到Docker容器，生成OpenAPI规范文档。');
INSERT INTO `conversation` VALUES (24, 7, '我想查看当前的详细计划', '2025-04-15 02:01:47', 4, '当然可以！你目前的计划如下：\n\n第一天: 了解基本的时尚理论和搭配原则，包括色彩搭配、版型选择、服饰层次等。在各大时尚网站或App上浏览潮流资讯，关注当季流行趋势。整理现有衣橱，分类归纳，找出可再利用的基本单品。\n第二天: 学习如何根据自己的身形选择合适的服装，进行个人风格定位。购买或借阅几本时尚杂志，研究不同场合的着装建议。尝试将基础单品与新发现的潮流元素结合，进行简单的搭配练习。\n第三天: 深入研究不同风格（如街头风、商务休闲风、复古风等）的特点和搭配技巧。在线观看时尚博主的穿搭视频，学习他们的搭配思路。记录下自己喜欢的搭配组合，并尝试在日常中实践。\n第四天: 探索配饰在整体造型中的作用，学习如何选择合适的鞋子、帽子、手表等配饰来提升整体形象。实践搭配之前设计的几个风格不同的look，体验不同风格带来的不同感觉。\n第五天: 学习如何通过穿搭展现自信，以及如何通过小细节（如袜子颜色、皮带搭配等）来体现个人品味。参考时尚达人的社交媒体账号，了解他们如何通过日常穿搭表达自我。\n第六天: 回顾过去一周的学习和实践，总结哪些搭配成功，哪些需要改进。在镜子前多次试穿，确保每件衣服都符合自己对潮流的理解和风格定位。考虑加入一些个性化元素，使穿搭更加独特。\n第七天: 将所学知识应用于实际生活中，参加一次朋友聚会或外出活动，展示你的新穿搭风格。收集他人的反馈，了解自己的优点和需要改进的地方。持续关注时尚动态，保持学习和实践的热情。');
INSERT INTO `conversation` VALUES (25, 7, '请你帮我修改一下当前的计划', '2025-04-15 02:01:51', 4, '当然可以!请告诉我你的修改要求');
INSERT INTO `conversation` VALUES (27, 7, '我想查看当前的详细计划', '2025-04-15 02:05:12', 3, '当然可以！你目前的计划如下：\n\n');
INSERT INTO `conversation` VALUES (28, 7, '请你帮我修改一下当前的计划', '2025-04-15 02:05:14', 3, '当然可以!请告诉我你的修改要求');
INSERT INTO `conversation` VALUES (29, 7, '我想查看当前的详细计划', '2025-04-15 02:06:21', 3, '当然可以！你目前的计划如下：\n\n');
INSERT INTO `conversation` VALUES (30, 7, '我想查看当前的详细计划', '2025-04-15 02:06:28', 4, '当然可以！你目前的计划如下：\n\n第一天: 了解基本的时尚理论和搭配原则，包括色彩搭配、版型选择、服饰层次等。在各大时尚网站或App上浏览潮流资讯，关注当季流行趋势。整理现有衣橱，分类归纳，找出可再利用的基本单品。\n第二天: 学习如何根据自己的身形选择合适的服装，进行个人风格定位。购买或借阅几本时尚杂志，研究不同场合的着装建议。尝试将基础单品与新发现的潮流元素结合，进行简单的搭配练习。\n第三天: 深入研究不同风格（如街头风、商务休闲风、复古风等）的特点和搭配技巧。在线观看时尚博主的穿搭视频，学习他们的搭配思路。记录下自己喜欢的搭配组合，并尝试在日常中实践。\n第四天: 探索配饰在整体造型中的作用，学习如何选择合适的鞋子、帽子、手表等配饰来提升整体形象。实践搭配之前设计的几个风格不同的look，体验不同风格带来的不同感觉。\n第五天: 学习如何通过穿搭展现自信，以及如何通过小细节（如袜子颜色、皮带搭配等）来体现个人品味。参考时尚达人的社交媒体账号，了解他们如何通过日常穿搭表达自我。\n第六天: 回顾过去一周的学习和实践，总结哪些搭配成功，哪些需要改进。在镜子前多次试穿，确保每件衣服都符合自己对潮流的理解和风格定位。考虑加入一些个性化元素，使穿搭更加独特。\n第七天: 将所学知识应用于实际生活中，参加一次朋友聚会或外出活动，展示你的新穿搭风格。收集他人的反馈，了解自己的优点和需要改进的地方。持续关注时尚动态，保持学习和实践的热情。');
INSERT INTO `conversation` VALUES (34, 7, '你好', '2025-04-15 03:16:20', 8, '你好！很高兴见到你，有什么我可以帮忙的吗？');
INSERT INTO `conversation` VALUES (35, 7, '你是谁', '2025-04-15 03:18:15', 8, '您好！我是由中国的深度求索（DeepSeek）公司开发的智能助手DeepSeek-R1。如您有任何任何问题，我会尽我所能为您提供帮助。');
INSERT INTO `conversation` VALUES (36, 7, '你好', '2025-04-15 03:22:55', 3, '您好！很高兴为您提供服务。请问有什么可以帮助您的吗？');
INSERT INTO `conversation` VALUES (37, 7, '你是谁', '2025-04-15 03:23:12', 3, '您好！我是由中国的深度求索（DeepSeek）公司开发的智能助手DeepSeek-R1。如您有任何任何问题，我会尽我所能为您提供帮助。');
INSERT INTO `conversation` VALUES (38, 7, '你好', '2025-04-15 03:24:39', 3, '你好！有什么我可以帮助你的吗？');
INSERT INTO `conversation` VALUES (39, 7, '请你介绍一下自己', '2025-04-15 03:25:04', 3, '您好！我是由中国的深度求索（DeepSeek）公司开发的智能助手DeepSeek-R1。如您有任何任何问题，我会尽我所能为您提供帮助。');
INSERT INTO `conversation` VALUES (40, 7, '我们交朋友吧', '2025-04-15 03:27:40', 3, '当然可以呀～很高兴认识你！虽然我是AI，但随时可以陪你聊天、分享趣事，或者一起探讨各种有趣的话题～有什么想聊的都可以告诉我哦 🌱🤝');
INSERT INTO `conversation` VALUES (41, 7, '你是谁', '2025-04-15 03:59:55', 8, '您好！我是由中国的深度求索（DeepSeek）公司开发的智能助手DeepSeek-R1。如您有任何任何问题，我会尽我所能为您提供帮助。');
INSERT INTO `conversation` VALUES (42, 7, '你是谁', '2025-04-15 04:02:15', 8, '您好！我是由中国的深度求索（DeepSeek）公司开发的智能助手DeepSeek-R1。如您有任何任何问题，我会尽我所能为您提供帮助。');
INSERT INTO `conversation` VALUES (43, 7, '你是谁', '2025-04-15 04:02:30', 8, '您好！我是由中国的深度求索（DeepSeek）公司开发的智能助手DeepSeek-R1。如您有任何任何问题，我会尽我所能为您提供帮助。');
INSERT INTO `conversation` VALUES (44, 7, '你是谁', '2025-04-15 04:03:06', 8, '您好！我是由中国的深度求索（DeepSeek）公司开发的智能助手DeepSeek-R1。如您有任何任何问题，我会尽我所能为您提供帮助。');
INSERT INTO `conversation` VALUES (45, 7, '你是谁', '2025-04-15 04:04:45', 8, '您好！我是由中国的深度求索（DeepSeek）公司开发的智能助手DeepSeek-R1。如您有任何任何问题，我会尽我所能为您提供帮助。');
INSERT INTO `conversation` VALUES (46, 7, '你是谁', '2025-04-15 04:12:53', 8, '您好！我是由中国的深度求索（DeepSeek）公司开发的智能助手DeepSeek-R1。如您有任何任何问题，我会尽我所能为您提供帮助。');
INSERT INTO `conversation` VALUES (47, 7, '你好', '2025-04-15 04:13:18', 3, '你好！有什么可以帮助你的吗？');
INSERT INTO `conversation` VALUES (48, 7, '请你帮我修改一下当前的计划', '2025-04-15 04:16:42', 3, '当然可以!请告诉我你的修改要求');
INSERT INTO `conversation` VALUES (49, 7, '把计划量改少一点', '2025-04-15 04:19:33', 3, '好的！调整计划量需要根据具体目标和实际情况来优化。以下是几个建议，你可以根据自己的需求调整：\n\n---\n\n### **1. 明确优先级**\n   - **保留核心任务**：先确认计划中哪些是**必须完成的核心目标**（比如关键工作、健康管理、重要学习），优先保留这些内容。\n   - **删减非必要环节**：减少重复性、低价值或可延后的任务（比如琐碎事务、过度社交、冗余步骤）。\n\n---\n\n### **2. 分阶段调整**\n   - **拆分任务**：将大任务拆解为更小的步骤，每天只完成其中一部分。\n   - **延长周期**：如果原计划时间紧张，可以适当延长完成周期（比如从“1周完成”改为“2周完成”）。\n   - **降低强度**：比如健身计划从“每天1小时”改为“每周3次，每次40分钟”；学习计划从“每天背50个单词”改为“30个”。\n\n---\n\n### **3. 设定弹性空间**\n   - **灵活时间表**：不要将计划排满，留出20%-30%的缓冲时间应对突发情况。\n   - **设置备选方案**：如果某天无法完成计划，准备一个“简化版任务”（比如用10分钟拉伸代替1小时锻炼）。\n\n---\n\n### **4. 复盘与迭代**\n   - **每周回顾**：检查完成情况，如果仍然压力大，继续减少10%-20%的任务量。\n   - **聚焦结果**：关注最终目标（比如“学会技能”而不是“必须每天学2小时”），用结果导向调整过程。\n\n---\n\n如果需要更具体的建议，可以补充说明：\n- 计划类型（学习/工作/健身/其他）？\n- 当前遇到的困难（时间不足/动力不够/任务复杂）？\n- 希望减少哪部分的任务量？\n\n我可以帮你进一步优化！ 😊');
INSERT INTO `conversation` VALUES (50, 7, '请你帮我修改一下当前的计划', '2025-04-15 04:19:36', 3, '当然可以!请告诉我你的修改要求');
INSERT INTO `conversation` VALUES (51, 7, '我想查看当前的详细计划', '2025-04-15 04:33:56', 3, '当然可以！你目前的计划如下：\n\n');
INSERT INTO `conversation` VALUES (54, 7, '你好', '2025-04-15 04:39:53', 4, '你好！有什么可以帮助你的吗？');
INSERT INTO `conversation` VALUES (57, 7, '你好', '2025-04-15 04:41:46', 4, '你好！很高兴见到你。有什么我可以帮助你的吗？');
INSERT INTO `conversation` VALUES (62, 7, '安慰一下我', '2025-04-15 04:46:21', 8, '当然可以，你此刻的感受都是真实的，也值得被温柔对待。也许现在的生活像一片暂时被乌云遮住的天空，但别忘了，乌云背后始终有光在努力透过来。你走过的每一步，都在塑造更坚韧的自己；每一次的疲惫，都是因为你认真地在乎着、努力着。\n\n你不需要立刻“好起来”，难过的时候就靠一靠，像一棵树在风中弯一弯腰，是为了积蓄重新挺直的力量。你本身就是一颗独特的星星，偶尔被夜雾笼罩也不会黯淡太久——因为你的光本就属于自己，谁也带不走。\n\n如果愿意，可以和我多说一点，我在这里安静地听；如果不想说话也没关系，记得给自己倒杯温水，裹上柔软的毯子，像对待最好的朋友那样，抱抱自己。');
INSERT INTO `conversation` VALUES (63, 7, '你好', '2025-04-15 04:46:50', 8, '你好！有什么可以帮助你的吗？');
INSERT INTO `conversation` VALUES (64, 7, '你好', '2025-04-15 04:49:03', 5, '你好！很高兴见到你，有什么我可以帮忙的吗？无论是问题、建议还是闲聊，我都在这里为你服务。😊');
INSERT INTO `conversation` VALUES (65, 7, '我想查看当前的详细计划', '2025-04-15 18:27:02', 9, '当然可以！你目前的计划如下：\n\n第一天: 复习函数与极限（3h）：重点理解极限定义、夹逼准则和两个重要极限。完成10道极限计算题，结合Python绘制函数图像验证结果。项目实战：用极限思想模拟算法复杂度分析（如O(n)与O(1)的区别）。\n第二天: 导数与应用（4h）：掌握导数几何意义、求导法则及高阶导数，推导常见函数导数公式。实战：用导数优化梯度下降算法，编程模拟抛物线最低点求解。完成5道物理运动学导数应用题。\n第三天: 积分基础（3h）：理解定积分与不定积分关系，熟练换元积分法。编程实现矩形法/梯形法数值积分，对比解析解差异。实战：用积分计算算法时间复杂度（如循环结构累加模型）。\n第四天: 微分方程（4h）：学习一阶线性微分方程解法，用分离变量法解决实际问题。编程实现欧拉法数值解，模拟人口增长模型。结合电路RL模型建立微分方程并求解。\n第五天: 多元函数微分（3h）：掌握偏导数与全微分计算，理解方向导数在梯度下降中的应用。实战：用Python绘制三维曲面，计算图像处理中的梯度场。完成3道多元极值应用题。\n第六天: 重难点突破（4h）：综合练习级数收敛性判断、泰勒展开近似计算。编程实现泰勒多项式拟合sin(x)曲线。完成2道考研真题，整理错题集重点分析解题思路。\n第七天: 综合实战与模拟（5h）：开发简易“高数问题求解器”（可含符号计算/数值计算模块），整合极限、导数、积分功能。完成3小时模拟测试卷，重点复盘证明题与建模题，制定后续强化计划。');
INSERT INTO `conversation` VALUES (67, 7, '我想查看当前的详细计划', '2025-04-15 19:00:34', 11, '当然可以！你目前的计划如下：\n\n第一天: 复习C++核心语法：类与对象、继承与多态、STL容器。实战项目：实现一个简易学生信息管理系统（包含增删改查功能），使用文件存储数据。晚上完成LeetCode简单题1-2道（如两数之和）。\n第二天: 学习模板编程与异常处理：函数模板、类模板、try-catch机制。项目：实现通用动态数组模板类，支持异常越界检测。扩展前一天的学生系统，增加模板化数据处理模块。\n第三天: 深入内存管理与智能指针：new/delete原理、unique_ptr/shared_ptr使用。项目：重构学生系统，用智能指针管理资源。学习C++11特性：auto、lambda表达式，优化既有代码。\n第四天: 数据结构实战：手动实现链表/二叉树，对比STL中list/map的实现。项目：开发图书馆借阅系统，要求使用STL容器与自定义数据结构结合。完成中等难度算法题（如二叉树遍历）。\n第五天: 多线程编程基础：thread库、互斥锁、条件变量。项目：实现多线程模拟售票系统。学习CMake构建工具，为项目编写跨平台编译配置。晚上研究简单设计模式（如单例模式）。\n第六天: 网络编程入门：socket基础，基于asio库实现TCP客户端/服务端通信。项目：开发简易聊天室程序（支持多客户端连接）。学习JSON数据解析，改造聊天室支持结构化消息。\n第七天: 综合项目：开发迷你游戏（如贪吃蛇）或简易HTTP服务器。要求使用面向对象设计，整合STL/多线程/网络编程知识。代码重构训练：使用Valgrind检测内存泄漏，进行性能优化。');
INSERT INTO `conversation` VALUES (68, 7, '我想查看当前的详细计划', '2025-04-18 02:30:08', 12, '当然可以！你目前的计划如下：\n\n第一天: 复习Java基础语法与数据结构（数组、链表、栈、队列），实现插入排序、冒泡排序算法。完成LeetCode《剑指Offer》第45题（数组排序）。通过代码对比不同排序的时间复杂度，整理笔记。\n第二天: 学习查找算法（二分查找）与递归思想，实现斐波那契数列递归/迭代解法。完成LeetCode 704（二分查找）和70题（爬楼梯）。分析递归调用栈的底层逻辑，用Debug工具跟踪变量变化。\n第三天: 掌握树结构（二叉树、二叉搜索树）与遍历算法（前/中/后序），实现AVL树旋转操作。完成LeetCode 94（中序遍历）和110题（平衡二叉树）。使用TreeMap类验证二叉搜索树特性。\n第四天: 学习动态规划与贪心算法，解析背包问题、最长子序列问题。完成LeetCode 322（零钱兑换）和53题（最大子数组和）。对比动态规划与贪心的适用场景，绘制状态转移表。\n第五天: 研究回溯算法与DFS/BFS，解决组合问题（LeetCode 39）、迷宫路径问题。实现N皇后问题的回溯解法，结合剪枝优化。通过队列实现BFS层级遍历二叉树（LeetCode 102）。\n第六天: 攻克字符串与数组高频题：KMP算法实现（LeetCode 28），滑动窗口解决最长无重复子串（LeetCode 3）。完成双指针类题目（LeetCode 15三数之和），分析时间空间复杂度优化策略。\n第七天: 综合实战：开发迷宫求解器项目，集成DFS/BFS算法，支持路径可视化。扩展功能：动态规划计算最短路径，回溯法记录所有可行解。整理七日算法笔记，撰写GitHub项目文档。');

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
-- Records of event
-- ----------------------------
INSERT INTO `event` VALUES (15, 4, '第一天: 热身运动（5分钟）：全身拉伸。力量训练（45分钟）：深蹲3组12次，卧推3组12次，硬拉3组12次，俯身划船3组12次。拉伸放松（5分钟）', '2025-03-18', '12:00:00', '13:00:00', 1);
INSERT INTO `event` VALUES (16, 4, '第二天: 热身运动（5分钟）：全身拉伸。力量训练（45分钟）：哑铃肩推3组12次，俯卧撑3组15次，坐姿划船3组12次，卷腹3组20次。拉伸放松（5分钟）', '2025-03-19', '12:00:00', '13:00:00', 0);
INSERT INTO `event` VALUES (17, 4, '第三天: 热身运动（5分钟）：全身拉伸。力量训练（45分钟）：深蹲3组12次，卧推3组12次，引体向上3组8次，腿举3组12次。有氧运动（省略）。拉伸放松（5分钟）', '2025-03-20', '12:00:00', '13:00:00', 0);
INSERT INTO `event` VALUES (18, 4, '第四天: 热身运动（5分钟）：全身拉伸。力量训练（45分钟）：哑铃侧平举3组12次，俯身飞鸟3组12次，坐姿推胸3组12次，仰卧起坐3组20次。有氧运动（省略）。拉伸放松（5分钟）', '2025-03-21', '12:00:00', '13:00:00', 0);
INSERT INTO `event` VALUES (19, 4, '第五天: 休息日，进行轻度拉伸和放松活动，避免剧烈运动。', '2025-03-22', '12:00:00', '13:00:00', 0);
INSERT INTO `event` VALUES (20, 4, '第六天: 热身运动（5分钟）：全身拉伸。力量训练（45分钟）：深蹲3组12次，卧推3组12次，单臂划船3组12次，负重卷腹3组20次。拉伸放松（5分钟）', '2025-03-23', '12:00:00', '13:00:00', 0);
INSERT INTO `event` VALUES (21, 4, '第七天: 热身运动（5分钟）：全身拉伸。力量训练（45分钟）：哑铃肩推3组12次，俯卧撑3组15次，坐姿划船3组12次，卷腹3组20次。拉伸放松（5分钟）', '2025-03-24', '12:00:00', '13:00:00', 0);
INSERT INTO `event` VALUES (22, 5, '第一天: 了解基本的时尚理论和搭配原则，包括色彩搭配、版型选择、服饰层次等。在各大时尚网站或App上浏览潮流资讯，关注当季流行趋势。整理现有衣橱，分类归纳，找出可再利用的基本单品。', '2025-03-18', '07:47:19', '19:35:21', 0);
INSERT INTO `event` VALUES (23, 5, '第二天: 学习如何根据自己的身形选择合适的服装，进行个人风格定位。购买或借阅几本时尚杂志，研究不同场合的着装建议。尝试将基础单品与新发现的潮流元素结合，进行简单的搭配练习。', '2025-03-19', '12:00:00', '13:00:00', 0);
INSERT INTO `event` VALUES (24, 5, '第三天: 深入研究不同风格（如街头风、商务休闲风、复古风等）的特点和搭配技巧。在线观看时尚博主的穿搭视频，学习他们的搭配思路。记录下自己喜欢的搭配组合，并尝试在日常中实践。', '2025-03-20', '12:00:00', '13:00:00', 0);
INSERT INTO `event` VALUES (25, 5, '第四天: 探索配饰在整体造型中的作用，学习如何选择合适的鞋子、帽子、手表等配饰来提升整体形象。实践搭配之前设计的几个风格不同的look，体验不同风格带来的不同感觉。', '2025-03-21', '12:00:00', '13:00:00', 0);
INSERT INTO `event` VALUES (26, 5, '第五天: 学习如何通过穿搭展现自信，以及如何通过小细节（如袜子颜色、皮带搭配等）来体现个人品味。参考时尚达人的社交媒体账号，了解他们如何通过日常穿搭表达自我。', '2025-03-22', '12:00:00', '13:00:00', 0);
INSERT INTO `event` VALUES (27, 5, '第六天: 回顾过去一周的学习和实践，总结哪些搭配成功，哪些需要改进。在镜子前多次试穿，确保每件衣服都符合自己对潮流的理解和风格定位。考虑加入一些个性化元素，使穿搭更加独特。', '2025-03-23', '12:00:00', '13:00:00', 0);
INSERT INTO `event` VALUES (28, 5, '第七天: 将所学知识应用于实际生活中，参加一次朋友聚会或外出活动，展示你的新穿搭风格。收集他人的反馈，了解自己的优点和需要改进的地方。持续关注时尚动态，保持学习和实践的热情。', '2025-03-24', '12:00:00', '13:00:00', 0);
INSERT INTO `event` VALUES (29, 7, '第一天: 热身运动10分钟（慢跑或跳绳）\n全身力量训练：卧推3组8次，深蹲4组10次，硬拉3组8次\n有氧运动：跑步机快走30分钟\n拉伸放松5分钟', '2025-03-18', '12:00:00', '13:00:00', 1);
INSERT INTO `event` VALUES (30, 7, '第二天: 热身运动10分钟（瑜伽或普拉提）\n上半身力量训练：引体向上3组6次，哑铃飞鸟3组8次，俯身飞鸟3组8次\n有氧运动：游泳30分钟\n拉伸放松5分钟', '2025-03-19', '12:00:00', '13:00:00', 0);
INSERT INTO `event` VALUES (31, 7, '第三天: 休息日，进行轻度活动如散步或轻松瑜伽，避免高强度运动', '2025-03-20', '12:00:00', '13:00:00', 0);
INSERT INTO `event` VALUES (32, 7, '第四天: 热身运动10分钟（跳绳或动感单车）\n下半身力量训练：腿举3组10次，坐姿腿弯举3组10次，提踵3组10次\n有氧运动：椭圆机30分钟\n拉伸放松5分钟', '2025-03-21', '12:00:00', '13:00:00', 0);
INSERT INTO `event` VALUES (33, 7, '第五天: 热身运动10分钟（普拉提或瑜伽）\n核心力量训练：平板支撑3组30秒，俄罗斯转体3组20次，仰卧起坐3组15次\n有氧运动：跳绳30分钟\n拉伸放松5分钟', '2025-03-22', '12:00:00', '13:00:00', 0);
INSERT INTO `event` VALUES (34, 7, '第六天: 休息日，进行轻度活动如散步或轻松瑜伽，避免高强度运动', '2025-03-23', '12:00:00', '13:00:00', 0);
INSERT INTO `event` VALUES (35, 7, '第七天: 热身运动10分钟（跳绳或动感单车）\n全身力量训练：深蹲4组12次，卧推3组10次，硬拉3组10次\n有氧运动：划船机30分钟\n拉伸放松5分钟', '2025-03-24', '12:00:00', '13:00:00', 0);
INSERT INTO `event` VALUES (36, 13, '第一天: 学习操作系统核心概念：定义、功能（资源管理/程序控制）、分类（批处理/分时/实时）。理解内核态与用户态差异及切换机制。安装VirtualBox并配置Ubuntu虚拟机，掌握基础Shell命令（ls/cd/mkdir等）。精读《操作系统导论》第一章，整理思维导图涵盖系统调用、中断处理、特权级别等核心概念。', '2025-04-01', '12:00:00', '13:00:00', 0);
INSERT INTO `event` VALUES (37, 13, '第二天: 深度解析进程管理：进程生命周期（创建/就绪/运行/阻塞/终止）、PCB详细结构（PID/状态/寄存器值）。编码实现多进程通信（匿名管道/FIFO命名管道），扩展实现信号量与共享内存。对比分析FCFS/SJF/RR调度算法，编写模拟程序并统计平均等待时间。使用strace跟踪进程系统调用，完成含上下文切换开销的对比实验报告。', '2025-04-02', '12:00:00', '13:00:00', 0);
INSERT INTO `event` VALUES (38, 13, '第三天: 强化进程高级主题：实现多线程同步（互斥锁/条件变量），设计生产者-消费者模型。研究Linux CFS调度器原理，编写优先级反转案例代码。使用perf分析进程性能瓶颈，通过gdb调试死锁场景。完成含线程局部存储(TLS)/线程池实现的扩展实验，制作进程关系树形图（pstree）。', '2025-04-03', '12:00:00', '13:00:00', 0);
INSERT INTO `event` VALUES (39, 13, '第四天: 研究内存管理：虚拟地址转换过程（MMU/页表），实现Buddy分配算法模拟器。编码测试页面置换算法（FIFO/LRU/Clock），统计缺页率变化曲线。使用Valgrind检测内存泄漏，分析slab分配器原理。对比分段/分页优缺点，撰写含外部碎片解决方案（紧凑技术）的总结文档。', '2025-04-04', '12:00:00', '13:00:00', 0);
INSERT INTO `event` VALUES (40, 13, '第五天: 探索文件系统：实现EXT2目录树遍历程序，编写FUSE自定义文件系统。对比SCAN/C-LOOK磁盘调度算法性能，使用dd/fio测试IO吞吐量。分析硬链接与符号链接实现差异，完成NTFS日志功能与EXT4扩展属性对比表。设计支持LRU缓存的文件系统架构图。', '2025-04-05', '12:00:00', '13:00:00', 0);
INSERT INTO `event` VALUES (41, 13, '第六天: 深入I/O与虚拟化：编写字符设备驱动（实现read/write/ioctl），测试DMA传输性能。使用cgroups实现进程资源隔离，对比KVM/QEMU与Docker的进程视图差异。通过ftrace追踪系统调用链，绘制虚拟机与宿主机进程交互流程图，完成容器网络命名空间配置实验。', '2025-04-06', '12:00:00', '13:00:00', 0);
INSERT INTO `event` VALUES (42, 13, '第七天: 综合实战：开发微内核进程管理器（实现fork/exec/wait），集成Round-Robin调度模块。使用QEMU调试内核级线程切换，分析进程描述符(task_struct)内存布局。制作七日知识全景脑图，规划包含协程/分布式调度的后续学习路径，提交完整实验代码仓库。', '2025-04-07', '12:00:00', '13:00:00', 1);
INSERT INTO `event` VALUES (50, 17, '第一天: 巩固Java核心语法与OOP概念，重点复习集合框架、多线程与IO操作。完成一个基于控制台的图书管理系统（增删改查），使用Maven管理依赖，为Spring Boot铺垫基础。', '2025-04-15', '12:00:00', '13:00:00', 1);
INSERT INTO `event` VALUES (51, 17, '第二天: 学习Spring基础：IoC容器、Bean生命周期与AOP原理。通过XML和注解两种方式实现依赖注入，完成一个银行账户事务管理Demo，记录日志与事务时间。', '2025-04-16', '12:00:00', '13:00:00', 0);
INSERT INTO `event` VALUES (52, 17, '第三天: Spring Boot入门：使用Spring Initializr创建项目，解析自动配置原理。开发RESTful API实现用户信息查询（含GET/POST请求），集成Swagger生成接口文档。', '2025-04-17', '12:00:00', '13:00:00', 1);
INSERT INTO `event` VALUES (53, 17, '第四天: 数据持久化实战：整合Spring Data JPA与Hibernate，配置H2内存数据库。实现博客系统的文章管理模块（含分页查询），学习@Query自定义JPQL语句。', '2025-04-18', '12:00:00', '13:00:00', 1);
INSERT INTO `event` VALUES (54, 17, '第五天: 中间件集成：通过Spring Boot整合Redis实现热点数据缓存。优化第三天开发的用户查询接口，添加缓存击穿保护策略，使用JMeter进行性能压测对比。', '2025-04-19', '12:00:00', '13:00:00', 0);
INSERT INTO `event` VALUES (55, 17, '第六天: 进阶功能实践：全局异常处理、拦截器实现权限校验、日志框架配置（SLF4J+Logback）。为博客系统添加JWT鉴权功能，设计RBAC权限模型。', '2025-04-20', '12:00:00', '13:00:00', 0);
INSERT INTO `event` VALUES (56, 17, '第七天: 综合项目：开发学生选课系统（含课程发布/选课/成绩查询）。整合MyBatis-Plus、Redis缓存、邮件通知模块，部署到Docker容器，生成OpenAPI规范文档。', '2025-04-21', '12:00:00', '13:00:00', 0);
INSERT INTO `event` VALUES (57, 25, '第一天: 复习函数与极限（3h）：重点理解极限定义、夹逼准则和两个重要极限。完成10道极限计算题，结合Python绘制函数图像验证结果。项目实战：用极限思想模拟算法复杂度分析（如O(n)与O(1)的区别）。', '2025-04-16', '09:00:00', '11:00:00', 0);
INSERT INTO `event` VALUES (58, 25, '第二天: 导数与应用（4h）：掌握导数几何意义、求导法则及高阶导数，推导常见函数导数公式。实战：用导数优化梯度下降算法，编程模拟抛物线最低点求解。完成5道物理运动学导数应用题。', '2025-04-17', '09:00:00', '11:00:00', 1);
INSERT INTO `event` VALUES (59, 25, '第三天: 积分基础（3h）：理解定积分与不定积分关系，熟练换元积分法。编程实现矩形法/梯形法数值积分，对比解析解差异。实战：用积分计算算法时间复杂度（如循环结构累加模型）。', '2025-04-18', '09:00:00', '11:00:00', 1);
INSERT INTO `event` VALUES (60, 25, '第四天: 微分方程（4h）：学习一阶线性微分方程解法，用分离变量法解决实际问题。编程实现欧拉法数值解，模拟人口增长模型。结合电路RL模型建立微分方程并求解。', '2025-04-19', '09:00:00', '11:00:00', 0);
INSERT INTO `event` VALUES (61, 25, '第五天: 多元函数微分（3h）：掌握偏导数与全微分计算，理解方向导数在梯度下降中的应用。实战：用Python绘制三维曲面，计算图像处理中的梯度场。完成3道多元极值应用题。', '2025-04-20', '09:00:00', '11:00:00', 0);
INSERT INTO `event` VALUES (62, 25, '第六天: 重难点突破（4h）：综合练习级数收敛性判断、泰勒展开近似计算。编程实现泰勒多项式拟合sin(x)曲线。完成2道考研真题，整理错题集重点分析解题思路。', '2025-04-21', '09:00:00', '11:00:00', 0);
INSERT INTO `event` VALUES (63, 25, '第七天: 综合实战与模拟（5h）：开发简易“高数问题求解器”（可含符号计算/数值计算模块），整合极限、导数、积分功能。完成3小时模拟测试卷，重点复盘证明题与建模题，制定后续强化计划。', '2025-04-22', '09:00:00', '11:00:00', 0);
INSERT INTO `event` VALUES (71, 27, '第一天: 复习C++核心语法：类与对象、继承与多态、STL容器。实战项目：实现一个简易学生信息管理系统（包含增删改查功能），使用文件存储数据。晚上完成LeetCode简单题1-2道（如两数之和）。', '2025-04-16', '14:00:00', '16:00:00', 0);
INSERT INTO `event` VALUES (72, 27, '第二天: 学习模板编程与异常处理：函数模板、类模板、try-catch机制。项目：实现通用动态数组模板类，支持异常越界检测。扩展前一天的学生系统，增加模板化数据处理模块。', '2025-04-17', '14:00:00', '16:00:00', 0);
INSERT INTO `event` VALUES (73, 27, '第三天: 深入内存管理与智能指针：new/delete原理、unique_ptr/shared_ptr使用。项目：重构学生系统，用智能指针管理资源。学习C++11特性：auto、lambda表达式，优化既有代码。', '2025-04-18', '14:00:00', '16:00:00', 1);
INSERT INTO `event` VALUES (74, 27, '第四天: 数据结构实战：手动实现链表/二叉树，对比STL中list/map的实现。项目：开发图书馆借阅系统，要求使用STL容器与自定义数据结构结合。完成中等难度算法题（如二叉树遍历）。', '2025-04-19', '14:00:00', '16:00:00', 0);
INSERT INTO `event` VALUES (75, 27, '第五天: 多线程编程基础：thread库、互斥锁、条件变量。项目：实现多线程模拟售票系统。学习CMake构建工具，为项目编写跨平台编译配置。晚上研究简单设计模式（如单例模式）。', '2025-04-20', '14:00:00', '16:00:00', 0);
INSERT INTO `event` VALUES (76, 27, '第六天: 网络编程入门：socket基础，基于asio库实现TCP客户端/服务端通信。项目：开发简易聊天室程序（支持多客户端连接）。学习JSON数据解析，改造聊天室支持结构化消息。', '2025-04-21', '14:00:00', '16:00:00', 0);
INSERT INTO `event` VALUES (77, 27, '第七天: 综合项目：开发迷你游戏（如贪吃蛇）或简易HTTP服务器。要求使用面向对象设计，整合STL/多线程/网络编程知识。代码重构训练：使用Valgrind检测内存泄漏，进行性能优化。', '2025-04-22', '14:00:00', '16:00:00', 0);
INSERT INTO `event` VALUES (78, 31, '第一天: 复习Java基础语法与数据结构（数组、链表、栈、队列），实现插入排序、冒泡排序算法。完成LeetCode《剑指Offer》第45题（数组排序）。通过代码对比不同排序的时间复杂度，整理笔记。', '2025-04-19', '18:00:00', '20:00:00', 0);
INSERT INTO `event` VALUES (79, 31, '第二天: 学习查找算法（二分查找）与递归思想，实现斐波那契数列递归/迭代解法。完成LeetCode 704（二分查找）和70题（爬楼梯）。分析递归调用栈的底层逻辑，用Debug工具跟踪变量变化。', '2025-04-20', '18:00:00', '20:00:00', 0);
INSERT INTO `event` VALUES (80, 31, '第三天: 掌握树结构（二叉树、二叉搜索树）与遍历算法（前/中/后序），实现AVL树旋转操作。完成LeetCode 94（中序遍历）和110题（平衡二叉树）。使用TreeMap类验证二叉搜索树特性。', '2025-04-21', '18:00:00', '20:00:00', 0);
INSERT INTO `event` VALUES (81, 31, '第四天: 学习动态规划与贪心算法，解析背包问题、最长子序列问题。完成LeetCode 322（零钱兑换）和53题（最大子数组和）。对比动态规划与贪心的适用场景，绘制状态转移表。', '2025-04-22', '18:00:00', '20:00:00', 0);
INSERT INTO `event` VALUES (82, 31, '第五天: 研究回溯算法与DFS/BFS，解决组合问题（LeetCode 39）、迷宫路径问题。实现N皇后问题的回溯解法，结合剪枝优化。通过队列实现BFS层级遍历二叉树（LeetCode 102）。', '2025-04-23', '18:00:00', '20:00:00', 0);
INSERT INTO `event` VALUES (83, 31, '第六天: 攻克字符串与数组高频题：KMP算法实现（LeetCode 28），滑动窗口解决最长无重复子串（LeetCode 3）。完成双指针类题目（LeetCode 15三数之和），分析时间空间复杂度优化策略。', '2025-04-24', '18:00:00', '20:00:00', 0);
INSERT INTO `event` VALUES (84, 31, '第七天: 综合实战：开发迷宫求解器项目，集成DFS/BFS算法，支持路径可视化。扩展功能：动态规划计算最短路径，回溯法记录所有可行解。整理七日算法笔记，撰写GitHub项目文档。', '2025-04-25', '18:00:00', '20:00:00', 0);

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
-- Records of followuser
-- ----------------------------

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
-- Records of historyconversation
-- ----------------------------
INSERT INTO `historyconversation` VALUES (3, '健身计划', 7, '2025-03-17 01:23:43', 4);
INSERT INTO `historyconversation` VALUES (4, '变美计划', 7, '2025-03-17 01:29:21', 5);
INSERT INTO `historyconversation` VALUES (5, '健身计划', 7, '2025-03-17 11:15:20', 7);
INSERT INTO `historyconversation` VALUES (6, '学习操作系统', 8, '2025-03-31 15:42:14', 13);
INSERT INTO `historyconversation` VALUES (8, '学习java', 7, '2025-04-14 22:15:39', 17);
INSERT INTO `historyconversation` VALUES (9, '学习高数', 7, '2025-04-15 18:26:56', 25);
INSERT INTO `historyconversation` VALUES (11, '学习算法', 7, '2025-04-15 19:00:10', 27);
INSERT INTO `historyconversation` VALUES (12, '我要学习算法', 7, '2025-04-18 02:29:57', 31);

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
-- Records of likecomments
-- ----------------------------

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
-- Records of likepost
-- ----------------------------
INSERT INTO `likepost` VALUES (22, 9, 12, NULL, NULL);
INSERT INTO `likepost` VALUES (23, 10, 12, NULL, NULL);

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
-- Records of likereply
-- ----------------------------

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
-- Records of manager
-- ----------------------------

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
-- Records of plan
-- ----------------------------
INSERT INTO `plan` VALUES (4, 0, '健身计划', '三十天变成猛男', 14, '2025-03-18', '2025-03-24', 'exercise', '2025-03-17 01:23:31');
INSERT INTO `plan` VALUES (5, 7, '变美计划', '我要学习穿搭，变成潮男', NULL, '2025-03-18', '2025-03-24', NULL, '2025-03-17 01:29:12');
INSERT INTO `plan` VALUES (6, 7, '学习算法', '加油', NULL, '2025-03-18', '2025-03-20', 'study', '2025-03-17 01:35:24');
INSERT INTO `plan` VALUES (7, 7, '健身计划', '增肌减脂', 14, '2025-03-18', '2025-03-24', NULL, '2025-03-17 11:15:10');
INSERT INTO `plan` VALUES (8, 8, '健身计划', '我要减脂', NULL, '2025-04-01', '2025-04-07', NULL, '2025-03-31 15:11:22');
INSERT INTO `plan` VALUES (9, 8, '学习编程', '学习java', NULL, '2025-04-01', '2025-04-07', NULL, '2025-03-31 15:16:39');
INSERT INTO `plan` VALUES (10, 8, 'fa', 'fafaf', NULL, '2025-04-02', '2025-04-02', 'exercise', '2025-03-31 15:22:01');
INSERT INTO `plan` VALUES (11, 8, '学习英语', '学习雅思', NULL, '2025-04-01', '2025-04-07', NULL, '2025-03-31 15:23:49');
INSERT INTO `plan` VALUES (12, 8, '学习高数', '复习考研数学', NULL, '2025-04-01', '2025-04-07', NULL, '2025-03-31 15:40:17');
INSERT INTO `plan` VALUES (13, 8, '学习操作系统', '学习操作系统', 14, '2025-04-01', '2025-04-07', NULL, '2025-03-31 15:41:23');
INSERT INTO `plan` VALUES (17, 7, '学习java', '学习springboot', 42, '2025-04-15', '2025-04-21', NULL, '2025-04-14 22:14:46');
INSERT INTO `plan` VALUES (18, 7, '健身计划', '增加肌肉', NULL, '2025-04-16', '2025-04-22', NULL, '2025-04-15 17:04:33');
INSERT INTO `plan` VALUES (19, 7, '健身自律计划', '我要整加肌肉', NULL, '2025-04-16', '2025-04-22', NULL, '2025-04-15 17:26:52');
INSERT INTO `plan` VALUES (20, 7, '健身自律计划', '我要增肌', NULL, '2025-04-16', '2025-04-22', NULL, '2025-04-15 17:30:03');
INSERT INTO `plan` VALUES (21, 7, '自律健身', '我要变强壮', NULL, '2025-04-16', '2025-04-22', NULL, '2025-04-15 18:04:35');
INSERT INTO `plan` VALUES (22, 7, '自律健身计划', '我要强壮', NULL, '2025-04-16', '2025-04-22', NULL, '2025-04-15 18:07:42');
INSERT INTO `plan` VALUES (23, 7, '健身自律', '我要变强壮', NULL, '2025-04-16', '2025-04-22', NULL, '2025-04-15 18:12:54');
INSERT INTO `plan` VALUES (24, 7, '健身自律', '我要变强壮', NULL, '2025-04-16', '2025-04-22', NULL, '2025-04-15 18:20:04');
INSERT INTO `plan` VALUES (25, 7, '学习高数', '我要学习高数', 28, '2025-04-16', '2025-04-22', NULL, '2025-04-15 18:26:09');
INSERT INTO `plan` VALUES (27, 7, '学习算法', '我要学习c++', 14, '2025-04-16', '2025-04-22', NULL, '2025-04-15 18:59:23');
INSERT INTO `plan` VALUES (28, 7, '健身计划', '三十天变成猛男', NULL, '2025-04-18', '2025-04-24', 'exercise', '2025-04-18 02:12:25');
INSERT INTO `plan` VALUES (29, 7, '我要学习算法', '我要学习java算法', NULL, '2025-04-19', '2025-04-25', NULL, '2025-04-18 02:13:01');
INSERT INTO `plan` VALUES (30, 7, '我要学算法', '我要学java算法', NULL, '2025-04-19', '2025-04-25', NULL, '2025-04-18 02:18:06');
INSERT INTO `plan` VALUES (31, 7, '我要学习算法', '我要学习java算法', NULL, '2025-04-19', '2025-04-25', NULL, '2025-04-18 02:29:24');

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
-- Records of post
-- ----------------------------
INSERT INTO `post` VALUES (12, 7, 1, '第一次不知道怎么找实习的大学生看过来！！', '原来那么多大学生不敢找实习啊\n家人们听我说，没找到寒假实习没关系，年后绝对是绝佳找实习期🥰\n	\n👉首先，投递方式主要有三种:实习僧、老板直聘、邮箱\n实习僧time每天早上10点开始投，一直投到12点左右休息；下午1:30左右开始投，互联网下班都晚了，要投到晚上，可以加入学校的实习qun，我也会建一个~另外我还整理了最新的校招实习投递汇总表~\n	\n✅tips：不断刷新“最新”，投最新的职位（内部逻辑是：许多最新的紧急招聘很容易获得面试，职位戳提高简历查看的概率）\n(一键投递有点鸡肋，推荐的一些岗位可能已经招人太久了，很容易浪费一天200次的投递机会)\n	\n建议经验不足的宝宝以海投为主，不要太看jd，投完就完事，拿到offer后再选择自己想去的方向。', '2025-04-15', 2, 1, 2, 'https://yakusbucket.oss-cn-wuhan-lr.aliyuncs.com/61330bb6-0099-46c3-9a2c-2edfa09ac1a8.JPG');
INSERT INTO `post` VALUES (13, 7, 1, '大三想去实习，官网没看到要实习生', '', '2025-04-15', 0, 0, 0, 'https://yakusbucket.oss-cn-wuhan-lr.aliyuncs.com/76b245fb-cdde-4654-9a41-b173ace54ceb.jpg');
INSERT INTO `post` VALUES (15, 9, 1, '建议大学生把这些暑期实习都投一遍', '暑期实习真的是太卷了\n很多宝子投递了大厂一点回应都没有\n结果等到了大厂截止投递的消息（哔哩哔哩\n有这种情况的宝子\n不要死磕大厂了，尽快转战中小厂\n✅一般暑期/转正实习应届生可投\n✅日常实习在校生均可投递\n近期可是投递中小厂的好时机，背景一般也别担心‼️大家快按表一一排查，可别错过了', '2025-04-15', 0, 0, 0, 'https://yakusbucket.oss-cn-wuhan-lr.aliyuncs.com/89f997a0-67d9-46bb-b7e6-5f9e87573d82.jpg');
INSERT INTO `post` VALUES (17, 9, 1, '求助，救命到底要怎么回呀？', '大三想找一个寒假实习，这到底要怎么沟通啊\n没想到\n没想到这篇笔记这么多人看👀很感谢大家在我的笔记下的留言分享自己的经验，感想\n我想分享一下我这两个星期找实习对这些zp软件的一些小感想：\nboss:回复率很高，工作质量参差不齐（但骗子也多）', '2025-04-15', 0, 0, 0, 'https://yakusbucket.oss-cn-wuhan-lr.aliyuncs.com/1e1bcf23-0701-4678-b37d-6cd51c1813f3.jpg');
INSERT INTO `post` VALUES (18, 9, 1, '不要在boss直聘上找工作，一定要自己甄别', '这几天一直在找工作，因为智联招聘没啥新岗位上线，就去下载了boss看看有没有什么新岗位。很多新岗位，每天都有岗位上线，每天都给我发信息说哪里哪里有新岗位发布。有很多科技型公司在boss上招聘，放自己团建的照片，还有放去中专学校做宣传的照片，感觉华而不实，接下来说几个我自己遇到的情况。\n总结下来，感觉boss注册公司不验证其真伪。\n1、有民营小企业写自己是外企。\n2、企业规模故意夸大，写员工人数100-299，企查查一看参保人数0人。\n3、找人去面试，一搜高德地图上面很多人评论是电子厂，站着打螺丝那种。\n4、二话不说直接约线下面试，去了之后部门负责人直接问是否接受加班。要天天加班，你上班时间不如直接写9:00-21:00。（这个是hr不负责任拉人头面试）\n希望大家找工作时一定要睁大双眼，上企查查多看看公司信息。虽然找工作令人烦躁焦虑，但是也别忘了多查查公司信息。别焦虑慢慢来。\n#外地人到苏州工作 #面试求职 #不用为了找不到工作而焦虑 #就业大环境 #boss直骗', '2025-04-15', 0, 0, 0, 'https://yakusbucket.oss-cn-wuhan-lr.aliyuncs.com/12f72add-7489-4308-861c-bf9d54719902.jpg');
INSERT INTO `post` VALUES (19, 9, 1, '字节实习入职Day1', '终于入职字节啦！本人是计算机博士，岗位是算法工程师实习，可以和大家分享一下自己的入职体验有想了解面经和实习相关或者研究方向的可以关注我并私戳我～\n10:00\n达到报到地点，扫码签到，会有同事引领到入职房间\n10:00-11:00\n入职培训\n分别是hr小姐姐进行公司各项事宜和公司介绍的培训\n还有汝波的欢迎视频哦！\n从这可以了解到字节温暖的人文关怀\n11:00-11:20\n发放入职电脑及礼包\n会有IT人员来发放入职前选取的电脑啦～还会有激活教程，电脑都是顶配\n11:20-12:00\n回到自己工区寻找leader\n我的报道入职地点和实际办公地点不在一个地方，所以我打车前往工区（可以报销哦），联系了自己的leader达到了自己工位\n收拾了一会安装显示屏之后就去吃饭啦！\n12:00-14:00\n吃饭 午休\n第一天同事都很好！mentor带着我吃饭给我介绍组里事宜，人都很nice！\n然后就是开通各项权限，并且申领键盘鼠标支架，还有4k显示屏！\n14:00-18:00\n看各种文档landing中，还得谢谢mentor一直耐心帮助我如何熟悉公司各项平台和权限申请的事宜\n18:00-19:00\n晚餐！\n', '2025-04-15', 0, 0, 0, 'https://yakusbucket.oss-cn-wuhan-lr.aliyuncs.com/a9fc83ef-18c9-42d1-95a5-002e6a7f8952.jpg');
INSERT INTO `post` VALUES (20, 10, 1, '实习入职第一天，做好这几点，直接开挂！', '-\n✅1.需要提前准备什么?\n提前看offer邮件，按要求准备好必要的物品就行，比如身份证原件和复印件、纸笔等。如果有需要复印的材料，提前搞定。日用品如餐巾纸、水杯等，可以观察后第二天再带。别忘了存好HR和部门联系人的手机号，有问题随时联系，确保顺利入职。\n-\n✅2.入职后的第一步\n入职后，一般是先要签合同，确认公司、工作内容、薪资福利等。然后跟着领导orHR，找到工位，领电脑、工牌和入职资料等。\n然后就是，开通各种权限，和领导进行入职谈话，了解部门的框架结构和工作内容，参加入职培训。\n-\n✅3.着装建议\n关于穿什么，除非你的岗位对着装有特别要求，否则可以参考网上的通勤装和通勤妆。\n第一印象很重要，等上班后再观察同事们的穿着，入乡随俗就好。\n互联网公司一般都是比较自由的。\n-\n✅4.没人管怎么办？\n(1)主动出击，别等别人来找你。\n(2)观察学习，快速融入团队。\n(3)建立联系，初期沟通很关键。\n入职第一天没人带真不算啥，很多人都遇到过。有时是真没顾上。\n-\n✅5.如何称呼同事和领导\n称呼同事可以叫哥、姐，如张哥、李姐；也可以用姓加工，如张工；外企常用英文名，如John；互联网公司常用', '2025-04-15', 0, 0, 0, 'https://yakusbucket.oss-cn-wuhan-lr.aliyuncs.com/3920aeb6-d064-4064-a3c9-004fea758e19.jpg');
INSERT INTO `post` VALUES (21, 10, 1, '小米实习第一天', '提前实习了，今天总算是过完了，呼，晕乎乎的#互联网大厂实习 #互联网大厂 #大学生实习 #大厂 #上班第一天 #实习日记 #内推 #我的实习生活 #新员工入职 #实习', '2025-04-15', 0, 0, 0, 'https://yakusbucket.oss-cn-wuhan-lr.aliyuncs.com/bbf4c28e-b1e3-4f5d-8f4d-3c8488448519.jpg');

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
-- Records of reply
-- ----------------------------

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
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (7, 'hjx', '嗯呐', '$2a$10$je9NWJ0NGyFVMJWTEvYuc.cBce3utYddU2t.A3CjVCCG7s6h6iqHS', 'https://yakusbucket.oss-cn-wuhan-lr.aliyuncs.com/085f2567-ebfd-4198-937e-cedfa9de7bcf.png', '2025-03-17 01:16:41', 145, 001, 1);
INSERT INTO `user` VALUES (8, 'test', NULL, '$2a$10$zJadhK9sdc7v.Eaq/Ru7n.tcLlQJ4YoBuIFoyL14KeAPwLX1B6SZq', NULL, '2025-03-31 15:10:44', 105, 001, 1);
INSERT INTO `user` VALUES (9, 'yakus', 'yakus', '$2a$10$ucVrrAl0txojIW4bGUdDUe64vAescuv6PA9bC5mMsztgRqffsnYPe', 'https://yakusbucket.oss-cn-wuhan-lr.aliyuncs.com/d5276b21-97f4-4426-9e56-53bbbebffb3a.png', '2025-04-15 16:13:51', 100, 001, 1);
INSERT INTO `user` VALUES (10, 'test1', 'steve', '$2a$10$pNryr0zV/GWSfrfk5N.t7..6.RPYn/7kjSSRqVL0CQkRySzJvSnTK', 'https://yakusbucket.oss-cn-wuhan-lr.aliyuncs.com/49b2cf6f-43c9-47b2-a001-549f8ad75259.png', '2025-04-15 16:35:47', 100, 001, 1);

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

-- ----------------------------
-- Records of userprofile
-- ----------------------------
INSERT INTO `userprofile` VALUES (2, 7, '男', 20, '大二', '[\"IT/编程\"]', '有一定基础', '项目实战', '升学', NULL);

SET FOREIGN_KEY_CHECKS = 1;
