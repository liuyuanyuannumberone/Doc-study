
CREATE TABLE `imc_course` (
  `course_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '课程ID',  
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '课程主标题',
  `title_desc` varchar(50) NOT NULL DEFAULT '' COMMENT '课程副标题',
  `type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '课程方向ID',
  `class_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '课程分类ID',
  `level_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '课程难度ID',
  `online_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '课程上线时间',
  `study_cnt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学习人数',
  `course_time` time NOT NULL DEFAULT '00:00:00' COMMENT '课程时长',
  `intro` varchar(200) NOT NULL DEFAULT '' COMMENT '课程简介',
  `info` varchar(200) NOT NULL DEFAULT '' COMMENT '学习需知',
  `harvest` varchar(200) NOT NULL DEFAULT '' COMMENT '课程收获',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '讲师ID',
  `main_pic` varchar(200) NOT NULL DEFAULT '' COMMENT '课程主图片',
  `content_score` decimal(3,1) NOT NULL DEFAULT '0.0' COMMENT '内容评分',
  `level_score` decimal(3,1) NOT NULL DEFAULT '0.0' COMMENT '简单易懂',
  `logic_score` decimal(3,1) NOT NULL DEFAULT '0.0' COMMENT '逻辑清晰',
  `score` decimal(3,1) NOT NULL DEFAULT '0.0' COMMENT '综合评分',
  PRIMARY KEY (`course_id`),
  UNIQUE KEY `udx_title` (`title`)         #唯一索引
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COMMENT='课程主表';    #指定自增长值

#int(2)：并不表示数据的大小最大为99，其最大的值和int表示的最大值一样，只是表示查询时显示的结果长度为2位。显示宽度。不满足补0；
#CURRENT_TIMESTAMP 
/*
DEFAULT CURRENT_TIMESTAMP
表示当插入数据的时候，该字段默认值为当前时间
ON UPDATE CURRENT_TIMESTAMP
表示每次更新这条数据的时候，该字段都会更新成当前时间

MySQL 获得当前时间戳函数：  select current_timestamp, current_timestamp();

decimal(10,2)中“2”表示小数部分的位数，如果插入的值未指定小数部分或者小数部分不足两位则会自动补到2位小数，
若插入的值小数部分超过了2为则会发生截断，截取前2位小数。
*/




CREATE TABLE `imc_chapter` (
  `chapter_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '章节ID',
  `course_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '课程ID',
  `chapter_name` varchar(50) NOT NULL DEFAULT '' COMMENT '章节名称',
  `chapter_info` varchar(200) NOT NULL DEFAULT '' COMMENT '章节说明',
  `chapter_no` tinyint(2) unsigned zerofill NOT NULL DEFAULT '00' COMMENT '章节编号',
  PRIMARY KEY (`chapter_id`),
  UNIQUE KEY `udx_couseid` (`course_id`,`chapter_name`)
) ENGINE=InnoDB AUTO_INCREMENT=1330 DEFAULT CHARSET=utf8 COMMENT='课程章节';





CREATE TABLE `imc_subsection` (
  `sub_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '小节ID',
  `chapter_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '章节ID',
  `course_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '课程ID',
  `sub_name` varchar(50) NOT NULL DEFAULT '' COMMENT '小节名称',
  `sub_url` varchar(200) NOT NULL DEFAULT '' COMMENT '小节URL',
  `video_type` enum('avi','mp4','mpeg') NOT NULL DEFAULT 'mp4' COMMENT '视频格式',
  `sub_time` time NOT NULL DEFAULT '00:00:00' COMMENT '小节时长',
  `sub_no` tinyint(2) unsigned zerofill NOT NULL DEFAULT '00' COMMENT '章节编号',
  PRIMARY KEY (`sub_id`),
  UNIQUE KEY `udx_chapterid_courseid_subname` (`chapter_id`,`course_id`,`sub_name`)
) ENGINE=InnoDB AUTO_INCREMENT=9834 DEFAULT CHARSET=utf8 COMMENT='课程小节表';





CREATE TABLE `imc_class` (
  `class_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '课程分类ID',
  `class_name` varchar(10) NOT NULL DEFAULT '' COMMENT '分类名称',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '填加时间',
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='课程分类';


-- 没必要写全
INSERT INTO `imc_class` VALUES (1,'MySQL','2019-01-24 08:57:26'),(2,'Redis','2019-01-24 08:57:26'),(3,'MongoDB','2019-01-24 08:57:26'),
(4,'安全测试','2019-01-24 08:57:26'),(5,'Oracle','2019-01-24 08:57:26'),(6,'SQL Server','2019-01-24 08:57:26'),
(7,'Hbase','2019-01-24 08:57:26'),(8,'大数据','2019-01-24 08:57:26'),(9,'HadoopDock','2019-01-24 08:57:26'),
(10,'Docker','2019-01-24 08:57:26'),(11,'运维','2019-01-24 08:57:26'),
(12,'Linux','2019-01-24 08:57:26'),(13,'自动化运维','2019-01-24 08:57:26');


-- 主键会自增、timestamp时间戳会自动拿到当前时间
INSERT INTO imc_class (class_name) VALUES ('MySQL'),('Redis'),('MongoDB');

-- 建立索引
CREATE UNIQUE INDEX uqx_classname  ON  imc_class (class_name);

-- 建立唯一索引后，执行INSERT INTO imc_class (class_name) VALUES ('MySQL');会报错
-- 但是我们想让索引重复(主键重复的)的数据其他字段得到更新。
   
INSERT INTO imc_class (class_name) VALUES ('MySQL') ON DUPLICATE KEY UPDATE  add_time=CURRENT_TIME;
--duplicate






CREATE TABLE `imc_type` (
  `type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '课程方向ID',
  `type_name` varchar(10) NOT NULL DEFAULT '' COMMENT '课程方向名称',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '填加时间',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='课程方向表';





CREATE TABLE `imc_level` (
  `level_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '课程难度ID',
  `level_name` varchar(10) NOT NULL DEFAULT '' COMMENT '课程难度名称',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '填加时间',
  PRIMARY KEY (`level_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='课程方向表';







CREATE TABLE `imc_user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_nick` varchar(20) NOT NULL DEFAULT '慕课网' COMMENT '用户昵称',
  `user_pwd` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `sex` char(2) NOT NULL DEFAULT '未知' COMMENT '性别',
  `province` varchar(20) NOT NULL DEFAULT '' COMMENT '省',
  `city` varchar(20) NOT NULL DEFAULT '' COMMENT '市',
  `Position` varchar(10) NOT NULL DEFAULT '未知' COMMENT '职位',
  `mem` varchar(100) NOT NULL DEFAULT '' COMMENT '说明',
  `exp_cnt` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '经验值',
  `score` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '积分',
  `follow_cnt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关注人数',
  `fans_cnt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '粉丝人数',
  `is_teacher` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '讲师标识,0:普通用户,1:讲师用户',
  `reg_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `user_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '用户状态 1:正常 0:冻结',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `udx_usernick` (`user_nick`)
) ENGINE=InnoDB AUTO_INCREMENT=4296 DEFAULT CHARSET=utf8 COMMENT='用户表';









CREATE TABLE `imc_question` (
  `quest_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `course_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '课程ID',
  `chapter_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '章节ID',
  `sub_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '小节ID',
  `replyid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父评论ID',
  `quest_title` varchar(50) NOT NULL DEFAULT '' COMMENT '评论标题',
  `quest_content` text COMMENT '评论内容',
  `quest_type` enum('问答','评论') NOT NULL DEFAULT '评论' COMMENT '评论类型',
  `view_cnt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览量',
  `add_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发布时间',
  PRIMARY KEY (`quest_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2321 DEFAULT CHARSET=utf8 COMMENT='问答评论表';







CREATE TABLE `imc_note` (
  `note_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '笔记ID',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `course_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '课程ID',
  `chapter_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '章节ID',
  `sub_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '小节ID',
  `note_title` varchar(50) NOT NULL DEFAULT '' COMMENT '笔记标题',
  `note_content` text COMMENT '评论内容',
  `add_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发布时间',
  PRIMARY KEY (`note_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='笔记表';










CREATE TABLE `imc_classvalue` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评价ID',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `course_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '课程ID',
  `content_score` decimal(3,1) NOT NULL DEFAULT '0.0' COMMENT '内容评分',
  `level_score` decimal(3,1) NOT NULL DEFAULT '0.0' COMMENT '简单易懂',
  `logic_score` decimal(3,1) NOT NULL DEFAULT '0.0' COMMENT '逻辑清晰',
  `score` decimal(3,1) NOT NULL DEFAULT '0.0' COMMENT '综合评分',
  `add_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发布时间',
  PRIMARY KEY (`value_id`)
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=utf8 COMMENT='课程评价表';





CREATE TABLE `imc_selectcourse` (
  `select_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '选课ID',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `course_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '课程ID',
  `select_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '选课时间',
  `study_time` time NOT NULL DEFAULT '00:00:00' COMMENT '累积听课时间',
  PRIMARY KEY (`select_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8 COMMENT='用户选课表';



------------------------------------------------ 插入------------------------------------------------
/*

use数据库 ，确认插入的表，确认哪些列可以为NULL，不能为NULL的是否有默认值。




*/
