
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

INSERT INTO `imc_course` VALUES
(1,'MySQL课程-79889','通过学习MySQL课程-79889让你更有成就感!',4,8,1,'2019-01-18 23:47:33',3503,'00:00:00','','','',29,'',0.0,0.0,0.0,0.0),
(2,'MySQL课程-69546','通过学习MySQL课程-69546让你更有成就感!',6,7,2,'2018-08-31 00:09:44',3921,'00:00:00','','','',26,'',0.0,0.0,0.0,0.0),
(3,'PostgreSQL课程-43917','通过学习PostgreSQL课程-43917让你更有成就感!',1,8,4,'2018-01-26 09:24:18',6941,'00:00:00','','','',26,'',0.0,0.0,0.0,0.0),
(4,'MySQL课程-88343','通过学习MySQL课程-88343让你更有成就感!',10,1,3,'2018-08-04 01:01:16',6252,'00:00:00','','','',27,'',0.0,0.0,0.0,0.0),
(5,'PostgreSQL课程-42349','通过学习PostgreSQL课程-42349让你更有成就感!',6,1,1,'2018-12-11 22:07:05',5161,'00:00:00','','','',27,'',0.0,0.0,0.0,0.0),
(6,'PostgreSQL课程-69538','通过学习PostgreSQL课程-69538让你更有成就感!',2,4,3,'2018-05-13 20:17:16',6393,'00:00:00','','','',26,'',0.0,0.0,0.0,0.0),
(7,'MySQL课程-04097','通过学习MySQL课程-04097让你更有成就感!',5,5,2,'2018-09-09 20:04:28',5245,'00:00:00','','','',21,'',0.0,0.0,0.0,0.0),
(8,'PostgreSQL课程-87282','通过学习PostgreSQL课程-87282让你更有成就感!',9,7,1,'2018-11-12 18:06:09',3486,'00:00:00','','','',26,'',0.0,0.0,0.0,0.0),
(9,'PostgreSQL课程-03245','通过学习PostgreSQL课程-03245让你更有成就感!',3,1,2,'2018-07-07 02:59:46',8130,'00:00:00','','','',27,'',0.0,0.0,0.0,0.0),
(10,'MySQL课程-84741','通过学习MySQL课程-84741让你更有成就感!',1,5,2,'2018-05-25 04:24:47',1334,'00:00:00','','','',23,'',0.0,0.0,0.0,0.0);









CREATE TABLE `imc_chapter` (
  `chapter_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '章节ID',
  `course_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '课程ID',
  `chapter_name` varchar(50) NOT NULL DEFAULT '' COMMENT '章节名称',
  `chapter_info` varchar(200) NOT NULL DEFAULT '' COMMENT '章节说明',
  `chapter_no` tinyint(2) unsigned zerofill NOT NULL DEFAULT '00' COMMENT '章节编号',
  PRIMARY KEY (`chapter_id`),
  UNIQUE KEY `udx_couseid` (`course_id`,`chapter_name`)
) ENGINE=InnoDB AUTO_INCREMENT=1330 DEFAULT CHARSET=utf8 COMMENT='课程章节';


INSERT INTO `imc_chapter` VALUES (1,1,'MySQL课程-79889第 1章','MySQL课程-79889第 1章详细介绍',01),
(2,1,'MySQL课程-79889第 2章','MySQL课程-79889第 2章详细介绍',02),(3,1,'MySQL课程-79889第 3章','MySQL课程-79889第 3章详细介绍',03),
(4,1,'MySQL课程-79889第 4章','MySQL课程-79889第 4章详细介绍',04),(5,1,'MySQL课程-79889第 5章','MySQL课程-79889第 5章详细介绍',05),
(6,1,'MySQL课程-79889第 6章','MySQL课程-79889第 6章详细介绍',06),(7,1,'MySQL课程-79889第 7章','MySQL课程-79889第 7章详细介绍',07),
(8,1,'MySQL课程-79889第 8章','MySQL课程-79889第 8章详细介绍',08),(9,1,'MySQL课程-79889第 9章','MySQL课程-79889第 9章详细介绍',09),
(10,1,'MySQL课程-79889第 10章','MySQL课程-79889第 10章详细介绍',10);










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



INSERT INTO `imc_subsection` VALUES (1,1,1,'MySQL课程-79889第 1章第 1节','','mp4','35:32:00',01),
(2,1,1,'MySQL课程-79889第 1章第 2节','','mp4','16:21:00',02),(3,1,1,'MySQL课程-79889第 1章第 3节','','mp4','39:52:00',03),
(4,2,1,'MySQL课程-79889第 2章第 1节','','mp4','47:25:00',01),(5,2,1,'MySQL课程-79889第 2章第 2节','','mp4','27:20:00',02),
(6,2,1,'MySQL课程-79889第 2章第 3节','','mp4','21:12:00',03),
(7,2,1,'MySQL课程-79889第 2章第 4节','','mp4','40:20:00',04);










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




INSERT INTO `imc_type` VALUES (1,'前端开发','2019-01-24 08:59:51'),(2,'后端开发','2019-01-24 08:59:51'),
(3,'移动开发','2019-01-24 08:59:51'),(4,'算法&数学','2019-01-24 08:59:51'),(5,'前沿技术','2019-01-24 08:59:51'),
(6,'云计算&大数据','2019-01-24 08:59:51'),(7,'运维&测试','2019-01-24 08:59:51'),
(8,'数据库','2019-01-24 08:59:51'),(9,'UI设计&多媒体','2019-01-24 08:59:51'),(10,'游戏','2019-01-24 08:59:51');









CREATE TABLE `imc_level` (
  `level_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '课程难度ID',
  `level_name` varchar(10) NOT NULL DEFAULT '' COMMENT '课程难度名称',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '填加时间',
  PRIMARY KEY (`level_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='课程方向表';




INSERT INTO `imc_level` VALUES (1,'入门','2019-01-24 09:01:03'),(2,'初级','2019-01-24 09:01:03'),
(3,'中级','2019-01-24 09:01:03'),(4,'高级','2019-01-24 09:01:03');










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




INSERT INTO `imc_user` VALUES (1,'沿舟侨','7c345f726643d5a61753126d52b250d0','1','','','未知','',0,0,0,0,0,'2019-01-24 16:31:01',1),
(2,'窦貌','35ce19fd941eb52fddfd48a50672810b','0','','','未知','',0,0,0,0,0,'2019-01-24 16:31:01',1),
(3,'侯鹿焦','78826bc6694f82e5a6579af70e5d1a79','1','','','未知','',0,0,0,0,0,'2019-01-24 16:31:01',1),
(4,'邹征末','e24db658b6e77741a515e43b9ed80c0a','0','','','未知','',0,0,0,0,0,'2019-01-24 16:31:01',1),
(5,'项讽巡','93e42066280ff2f20ca759c9ede5bc31','1','','','未知','',0,0,0,0,0,'2019-01-24 16:31:01',1);

















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




INSERT INTO `imc_question` VALUES (1,2314,57,727,5321,0,'用户:2314关于 SQLServer课程-82618第 5章第 2节的问答',
'用户:2314关于 SQLServer课程-82618第 5章第 2节的问答','问答',26,'2019-01-28 17:40:06'),
(2,3014,76,984,7175,0,'用户:3014关于 SQLServer课程-00610第 1章第 2节的问答',
'用户:3014关于 SQLServer课程-00610第 1章第 2节的问答','问答',89,'2019-01-28 17:40:06'),
(3,3011,14,163,1204,0,'用户:3011关于 PostgreSQL课程-57259第 4章第 9节的评论',
'用户:3011关于 PostgreSQL课程-57259第 4章第 9节的评论','评论',41,'2019-01-28 17:40:06');














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




INSERT INTO `imc_classvalue` VALUES (1,3065,8,9.0,9.1,8.1,0.0,'2019-01-28 17:10:18'),
(2,952,17,9.6,8.9,10.0,0.0,'2019-01-28 17:10:18'),
(3,3539,59,9.7,8.1,8.1,0.0,'2019-01-28 17:10:18'),(4,2040,53,8.2,9.0,8.6,0.0,'2019-01-28 17:10:18'),
(5,1003,36,8.5,8.8,9.9,0.0,'2019-01-28 17:10:18'),(6,1608,59,8.6,9.2,8.5,0.0,'2019-01-28 17:10:18'),
(7,2374,98,9.2,9.1,8.8,0.0,'2019-01-28 17:10:18'),(8,2080,57,8.5,8.5,9.2,0.0,'2019-01-28 17:10:18'),
(9,2053,14,9.4,9.8,9.0,0.0,'2019-01-28 17:10:18'),(10,2640,64,9.9,8.8,8.8,0.0,'2019-01-28 17:10:18');












CREATE TABLE `imc_selectcourse` (
  `select_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '选课ID',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `course_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '课程ID',
  `select_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '选课时间',
  `study_time` time NOT NULL DEFAULT '00:00:00' COMMENT '累积听课时间',
  PRIMARY KEY (`select_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8 COMMENT='用户选课表';



INSERT INTO `imc_selectcourse` VALUES (1,1968,52,'2019-01-24 21:35:26','18:31:15'),(2,88,67,'2019-03-09 08:26:40','01:50:49'),
(3,522,32,'2019-02-03 11:13:03','00:17:59'),(4,2666,6,'2019-01-02 02:30:47','03:17:17'),
(5,3957,28,'2019-01-23 06:08:52','01:15:18'),(6,2498,54,'2019-02-27 00:47:06','18:15:08'),(7,1319,28,'2019-02-20 06:50:43','04:08:07'),
(8,550,51,'2019-01-06 14:28:31','02:40:22'),(9,780,85,'2019-01-03 07:51:19','16:55:08'),(10,4093,60,'2019-01-31 09:11:12','16:14:31');



-- ---------------------------------------------- SELECT------------------------------------------------

SELECT
     [ALL|DISTINCT|DISTINCTROW]
     select_expr
     [FROM]
     [WHERE]
     [GROUP BY]
     [HAVING]
     [ORDER BY]
     [LIMIT]



-- 下面是：比较运算符
/*
=  <  >  >=  <=  <>和!= 都表示不等于; BETWEEN 1000 AND 2000
binary 区分大小写
SELECT 'MYSQL' LIKE BINARY '_ysql'; 返回0

*/

SELECT * FROM imc_class;
SELECT class_id,class_name FROM imc_class;
SELECT title FROM imc_course  WHERE title LIKE binary '%MYSQL%'; # 包含mysql的课程名   # NOT LIKE   %代表任意数量的字符， _代表一个字符
SELECT title,study_cnt FROM imc_course  WHERE study_cnt >= 5161;
SELECT title,study_cnt FROM imc_course  WHERE study_cnt>=1000 AND study_cnt<=2000 ;#[1000-2000]
SELECT title,study_cnt FROM imc_course  WHERE study_cnt BETWEEN 1000 AND 2000 ;#[1000-2000]
SELECT * FROM imc_course WHERE title IS NOT NULL;     # IS NULL
SELECT title FROM imc_course WHERE course_id IN (1,3,5);  #列的值在指定范围内的数据  NOT IN


/*

-- 下面是：逻辑运算符 AND OR       && ||    XOR 一真一假返回真  2真2假返回假

*/

SELECT title,study_cnt FROM imc_course WHERE title LIKE '%mysql%' AND study_cnt>5000;
SELECT title,study_cnt FROM imc_course WHERE title LIKE '%mysql%' OR study_cnt>5000;


SELECT title,study_cnt FROM imc_course WHERE title LIKE '%mysql%' AND study_cnt<5000
UNION ALL
SELECT title,study_cnt FROM imc_course WHERE title NOT LIKE '%mysql%' AND study_cnt>5000; #联合查询 （将查询结果加起来）
-- 和上边一样的功能，用XOR   A&B 和!A&!B 的时候可以用到，取A和!B
SELECT title,study_cnt FROM imc_course WHERE title LIKE '%mysql%' XOR study_cnt>5000;


任何运算符和NULL值运算结果都是NULL


/*

多个表中查询数据--关联查询

JOIN
INNER JOIN 内关联（A&&B）     select <select list>  from  tableA A INNER JOIN tableB B   ON A.key=B.key;  (两个表的集合)
OUTER JOIN 外关联   LEFT  JOIN (左连接)  和  RIGHT JOIN（右连接）
*/
-- 查询每一门课程的课程ID、课程名称和章节名称
SELECT
	a.course_id,
	a.title,
	b.chapter_name
FROM                                                   -- A&&B
	imc_course a
	JOIN imc_chapter b ON a.course_id = b.course_id;


SELECT
	a.course_id,
	a.title,
	b.chapter_name                                     --（A||A&&B）
FROM
	imc_course a
LEFT 	JOIN imc_chapter b ON a.course_id = b.course_id;


SELECT
	a.course_id,
	a.title,
	b.chapter_name                                    -- (A-A&&B)
FROM
	imc_course a
LEFT 	JOIN imc_chapter b ON a.course_id = b.course_id WHERE b.KEY IS NULL;




/*
group by 将结果按照某些列分成不同的组，并对分组后的数据进行聚合操作

where 是无法使用聚合函数，所以使用having，对聚合后的数据进行过滤。

-- 总结：1、数值可以作为查询列(select 5 from imc_class);
	       2、一个返回一列，一个返回在一个值，必须使用group by ==列和聚合函数使用，必须使用group by;
	       3、select   列某+聚合函数  group by 列某  （列某=列某）

常用的聚合函数:聚合函数也可以单独使用

1、count(*)(col) 计算符合条件的数据行数
2、sum(col_name) 计算符合条件的数值列的和
3、avg(col_name) 计算符合条件的数值列的和的平均值
4、max(col_name) 计算列的最大值  min(col_name)


SELECT COUNT(*) FROM imc_course; #10行
SELECT COUNT(DISTINCT user_id) FROM imc_course; # 去重

SELECT SUM(study_cnt) FROM  imc_course;



*/


SELECT
	level_name,
	count( * )
FROM
	imc_course a
	JOIN imc_level b ON a.level_id = b.level_id
GROUP BY
	level_name

-- 入门  5
-- 中级  4
-- 高级  6


SELECT
	class_name,
	level_name,
	count( * )
FROM
	imc_course a
	JOIN imc_class b ON b.class_id = a.class_id
	JOIN imc_level c ON c.level_id = a.level_id          #把几个表连接起来
GROUP BY
	class_name,
	level_name
HAVING
	count( * ) >3


	#参考1                                                                   #参考2
SELECT                                                                 SELECT
	course_id,                   #返回一列                                        course_id,
	AVG( content_score ) AS avg_content,  #返回一个值                               (SELECT AVG(content_score) FROM  imc_classvalue)  #数值
	AVG( level_score ) AS avg_level,               <= 区分 =>              FROM
	AVG( logic_score ) AS avg_logic                                       imc_classvalue
FROM
	imc_classvalue
GROUP BY
	course_id;


#参考3

SELECT
	(SELECT AVG(content_score) FROM  imc_classvalue )  #数值
FROM
	imc_classvalue



 #参考四

SELECT
	title,( SELECT MAX( study_cnt ) FROM imc_course ) #数值
FROM
	imc_course
WHERE
	study_cnt = (SELECT MAX( study_cnt ) FROM imc_course ) #数值






/*
ORDER BY  对查询结果排序的最安全的方法   ASC升序  DCSC降序
可以使用select子句中未出现的列或者是函数

limit限制结果集的行数，常用于列表数据分页，前端分页，配合order by子句使用，为了保证每次获取到的数据按照同样的列排序
limit 起始偏移量和行数    每页pageSize条，第currentPage页 （起始偏移量：(currentPage-1)*pageSize,行数：pageSize）

*/


SELECT
	course_id,
	title 
FROM
	imc_course 
ORDER BY
	study_cnt DESC 
LIMIT 0,10     #(currentPage-1)*pageSize,pageSize   如果最后一页没有10行，就会返回实际行数






-- ---------------------------------------------------/SELECT----------------------------------------------




-- ----------------------------------------------------删除/更新---------------------------------------------

/*
DELETE 
FROM table_name
[where]
[order by]
[limit](这里只写一个参数）
*/

SELECT 
*
FROM
	imc_course a
	LEFT JOIN imc_chapter b ON a.course_id = b.course_id
WHERE b.course_id IS NULL


DELETE  a
FROM  imc_course a
	LEFT JOIN imc_chapter b ON a.course_id = b.course_id
WHERE b.course_id IS NULL



DELETE a 
FROM
	imc_type a
	JOIN (
SELECT
	type_name,
	MIN( type_id ) AS min_type_id,
	count( * ) 
FROM
	imc_type 
GROUP BY
	type_name 
HAVING
	count( * ) > 1 
	) b ON a.type_name = b.type_name 	AND a.type_id > min_type_id;
	







/*

删除

*/









-- ----------------------------------------------------/删除/更新---------------------------------------------





-- ----------------------------------------------------创建视图---------------------------------------------

/*创建视图：视图是一种虚拟存在的表，
使用视图的用户完全不需要关系后面对应的表结构、关联条件和筛选条件，对用户来说已经是过滤好的符合条件的结果集。
一旦视图的结构确定了，可以屏蔽表结构变化对用户的影响，
源表增加列对视图没有影响；源表修改列名，则可以通过修改视图来解决，不会造成对访问者的影响。
视图不是表，不保存数据，只是一张虚拟的表，源表的数据发生变化后，视图的结果也同步发生变化。
 一般情况下，在创建有条件限制的视图时，加上“WITH CHECK OPTION”命令。
 重用SQL语句,简化复杂的sql操作,不必知道它的查询细节;保护数据,提高安全性;
show tables 查看视图
drop view 视图名称 删除视图
视图的修改:
     alter view 视图名
      as
      查询语句
*/

CREATE VIEW   view_name
AS



SELECT
FROM
WHERE


CREATE VIEW vm_course AS SELECT
a.course_id,
a.title,
b.class_name,
c.type_name,
d.level_name 
FROM
	imc_course a
	JOIN imc_class b ON a.class_id = b.class_id
	JOIN imc_type c ON c.type_id = a.type_id
	JOIN imc_level d ON d.level_id = a.level_id


SELECT * FROM vm_course;


-- ----------------------------------------------------/创建视图---------------------------------------------