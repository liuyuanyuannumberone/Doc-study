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




