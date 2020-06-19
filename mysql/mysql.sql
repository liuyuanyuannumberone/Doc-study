
CREATE TABLE `imc_course` (
  `course_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '�γ�ID',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '�γ�������',
  `title_desc` varchar(50) NOT NULL DEFAULT '' COMMENT '�γ̸�����',
  `type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '�γ̷���ID',
  `class_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '�γ̷���ID',
  `level_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '�γ��Ѷ�ID',
  `online_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�γ�����ʱ��',
  `study_cnt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ѧϰ����',
  `course_time` time NOT NULL DEFAULT '00:00:00' COMMENT '�γ�ʱ��',
  `intro` varchar(200) NOT NULL DEFAULT '' COMMENT '�γ̼��',
  `info` varchar(200) NOT NULL DEFAULT '' COMMENT 'ѧϰ��֪',
  `harvest` varchar(200) NOT NULL DEFAULT '' COMMENT '�γ��ջ�',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '��ʦID',
  `main_pic` varchar(200) NOT NULL DEFAULT '' COMMENT '�γ���ͼƬ',
  `content_score` decimal(3,1) NOT NULL DEFAULT '0.0' COMMENT '��������',
  `level_score` decimal(3,1) NOT NULL DEFAULT '0.0' COMMENT '���׶�',
  `logic_score` decimal(3,1) NOT NULL DEFAULT '0.0' COMMENT '�߼�����',
  `score` decimal(3,1) NOT NULL DEFAULT '0.0' COMMENT '�ۺ�����',
  PRIMARY KEY (`course_id`),
  UNIQUE KEY `udx_title` (`title`)         #Ψһ����
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COMMENT='�γ�����';    #ָ��������ֵ

#int(2)��������ʾ���ݵĴ�С���Ϊ99��������ֵ��int��ʾ�����ֵһ����ֻ�Ǳ�ʾ��ѯʱ��ʾ�Ľ������Ϊ2λ����ʾ��ȡ������㲹0��
#CURRENT_TIMESTAMP
/*
DEFAULT CURRENT_TIMESTAMP
��ʾ���������ݵ�ʱ�򣬸��ֶ�Ĭ��ֵΪ��ǰʱ��
ON UPDATE CURRENT_TIMESTAMP
��ʾÿ�θ����������ݵ�ʱ�򣬸��ֶζ�����³ɵ�ǰʱ��

MySQL ��õ�ǰʱ���������  select current_timestamp, current_timestamp();

decimal(10,2)�С�2����ʾС�����ֵ�λ������������ֵδָ��С�����ֻ���С�����ֲ�����λ����Զ�����2λС����
�������ֵС�����ֳ�����2Ϊ��ᷢ���ضϣ���ȡǰ2λС����
*/

INSERT INTO `imc_course` VALUES
(1,'MySQL�γ�-79889','ͨ��ѧϰMySQL�γ�-79889������гɾ͸�!',4,8,1,'2019-01-18 23:47:33',3503,'00:00:00','','','',29,'',0.0,0.0,0.0,0.0),
(2,'MySQL�γ�-69546','ͨ��ѧϰMySQL�γ�-69546������гɾ͸�!',6,7,2,'2018-08-31 00:09:44',3921,'00:00:00','','','',26,'',0.0,0.0,0.0,0.0),
(3,'PostgreSQL�γ�-43917','ͨ��ѧϰPostgreSQL�γ�-43917������гɾ͸�!',1,8,4,'2018-01-26 09:24:18',6941,'00:00:00','','','',26,'',0.0,0.0,0.0,0.0),
(4,'MySQL�γ�-88343','ͨ��ѧϰMySQL�γ�-88343������гɾ͸�!',10,1,3,'2018-08-04 01:01:16',6252,'00:00:00','','','',27,'',0.0,0.0,0.0,0.0),
(5,'PostgreSQL�γ�-42349','ͨ��ѧϰPostgreSQL�γ�-42349������гɾ͸�!',6,1,1,'2018-12-11 22:07:05',5161,'00:00:00','','','',27,'',0.0,0.0,0.0,0.0),
(6,'PostgreSQL�γ�-69538','ͨ��ѧϰPostgreSQL�γ�-69538������гɾ͸�!',2,4,3,'2018-05-13 20:17:16',6393,'00:00:00','','','',26,'',0.0,0.0,0.0,0.0),
(7,'MySQL�γ�-04097','ͨ��ѧϰMySQL�γ�-04097������гɾ͸�!',5,5,2,'2018-09-09 20:04:28',5245,'00:00:00','','','',21,'',0.0,0.0,0.0,0.0),
(8,'PostgreSQL�γ�-87282','ͨ��ѧϰPostgreSQL�γ�-87282������гɾ͸�!',9,7,1,'2018-11-12 18:06:09',3486,'00:00:00','','','',26,'',0.0,0.0,0.0,0.0),
(9,'PostgreSQL�γ�-03245','ͨ��ѧϰPostgreSQL�γ�-03245������гɾ͸�!',3,1,2,'2018-07-07 02:59:46',8130,'00:00:00','','','',27,'',0.0,0.0,0.0,0.0),
(10,'MySQL�γ�-84741','ͨ��ѧϰMySQL�γ�-84741������гɾ͸�!',1,5,2,'2018-05-25 04:24:47',1334,'00:00:00','','','',23,'',0.0,0.0,0.0,0.0);









CREATE TABLE `imc_chapter` (
  `chapter_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '�½�ID',
  `course_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�γ�ID',
  `chapter_name` varchar(50) NOT NULL DEFAULT '' COMMENT '�½�����',
  `chapter_info` varchar(200) NOT NULL DEFAULT '' COMMENT '�½�˵��',
  `chapter_no` tinyint(2) unsigned zerofill NOT NULL DEFAULT '00' COMMENT '�½ڱ��',
  PRIMARY KEY (`chapter_id`),
  UNIQUE KEY `udx_couseid` (`course_id`,`chapter_name`)
) ENGINE=InnoDB AUTO_INCREMENT=1330 DEFAULT CHARSET=utf8 COMMENT='�γ��½�';


INSERT INTO `imc_chapter` VALUES (1,1,'MySQL�γ�-79889�� 1��','MySQL�γ�-79889�� 1����ϸ����',01),
(2,1,'MySQL�γ�-79889�� 2��','MySQL�γ�-79889�� 2����ϸ����',02),(3,1,'MySQL�γ�-79889�� 3��','MySQL�γ�-79889�� 3����ϸ����',03),
(4,1,'MySQL�γ�-79889�� 4��','MySQL�γ�-79889�� 4����ϸ����',04),(5,1,'MySQL�γ�-79889�� 5��','MySQL�γ�-79889�� 5����ϸ����',05),
(6,1,'MySQL�γ�-79889�� 6��','MySQL�γ�-79889�� 6����ϸ����',06),(7,1,'MySQL�γ�-79889�� 7��','MySQL�γ�-79889�� 7����ϸ����',07),
(8,1,'MySQL�γ�-79889�� 8��','MySQL�γ�-79889�� 8����ϸ����',08),(9,1,'MySQL�γ�-79889�� 9��','MySQL�γ�-79889�� 9����ϸ����',09),
(10,1,'MySQL�γ�-79889�� 10��','MySQL�γ�-79889�� 10����ϸ����',10);










CREATE TABLE `imc_subsection` (
  `sub_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'С��ID',
  `chapter_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�½�ID',
  `course_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�γ�ID',
  `sub_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'С������',
  `sub_url` varchar(200) NOT NULL DEFAULT '' COMMENT 'С��URL',
  `video_type` enum('avi','mp4','mpeg') NOT NULL DEFAULT 'mp4' COMMENT '��Ƶ��ʽ',
  `sub_time` time NOT NULL DEFAULT '00:00:00' COMMENT 'С��ʱ��',
  `sub_no` tinyint(2) unsigned zerofill NOT NULL DEFAULT '00' COMMENT '�½ڱ��',
  PRIMARY KEY (`sub_id`),
  UNIQUE KEY `udx_chapterid_courseid_subname` (`chapter_id`,`course_id`,`sub_name`)
) ENGINE=InnoDB AUTO_INCREMENT=9834 DEFAULT CHARSET=utf8 COMMENT='�γ�С�ڱ�';



INSERT INTO `imc_subsection` VALUES (1,1,1,'MySQL�γ�-79889�� 1�µ� 1��','','mp4','35:32:00',01),
(2,1,1,'MySQL�γ�-79889�� 1�µ� 2��','','mp4','16:21:00',02),(3,1,1,'MySQL�γ�-79889�� 1�µ� 3��','','mp4','39:52:00',03),
(4,2,1,'MySQL�γ�-79889�� 2�µ� 1��','','mp4','47:25:00',01),(5,2,1,'MySQL�γ�-79889�� 2�µ� 2��','','mp4','27:20:00',02),
(6,2,1,'MySQL�γ�-79889�� 2�µ� 3��','','mp4','21:12:00',03),
(7,2,1,'MySQL�γ�-79889�� 2�µ� 4��','','mp4','40:20:00',04);










CREATE TABLE `imc_class` (
  `class_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '�γ̷���ID',
  `class_name` varchar(10) NOT NULL DEFAULT '' COMMENT '��������',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '���ʱ��',
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='�γ̷���';


-- û��Ҫдȫ
INSERT INTO `imc_class` VALUES (1,'MySQL','2019-01-24 08:57:26'),(2,'Redis','2019-01-24 08:57:26'),(3,'MongoDB','2019-01-24 08:57:26'),
(4,'��ȫ����','2019-01-24 08:57:26'),(5,'Oracle','2019-01-24 08:57:26'),(6,'SQL Server','2019-01-24 08:57:26'),
(7,'Hbase','2019-01-24 08:57:26'),(8,'������','2019-01-24 08:57:26'),(9,'HadoopDock','2019-01-24 08:57:26'),
(10,'Docker','2019-01-24 08:57:26'),(11,'��ά','2019-01-24 08:57:26'),
(12,'Linux','2019-01-24 08:57:26'),(13,'�Զ�����ά','2019-01-24 08:57:26');


-- ������������timestampʱ������Զ��õ���ǰʱ��
INSERT INTO imc_class (class_name) VALUES ('MySQL'),('Redis'),('MongoDB');

-- ��������
CREATE UNIQUE INDEX uqx_classname  ON  imc_class (class_name);

-- ����Ψһ������ִ��INSERT INTO imc_class (class_name) VALUES ('MySQL');�ᱨ��
-- �����������������ظ�(�����ظ���)�����������ֶεõ����¡�

INSERT INTO imc_class (class_name) VALUES ('MySQL') ON DUPLICATE KEY UPDATE  add_time=CURRENT_TIME;
--duplicate







CREATE TABLE `imc_type` (
  `type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '�γ̷���ID',
  `type_name` varchar(10) NOT NULL DEFAULT '' COMMENT '�γ̷�������',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '���ʱ��',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='�γ̷����';




INSERT INTO `imc_type` VALUES (1,'ǰ�˿���','2019-01-24 08:59:51'),(2,'��˿���','2019-01-24 08:59:51'),
(3,'�ƶ�����','2019-01-24 08:59:51'),(4,'�㷨&��ѧ','2019-01-24 08:59:51'),(5,'ǰ�ؼ���','2019-01-24 08:59:51'),
(6,'�Ƽ���&������','2019-01-24 08:59:51'),(7,'��ά&����','2019-01-24 08:59:51'),
(8,'���ݿ�','2019-01-24 08:59:51'),(9,'UI���&��ý��','2019-01-24 08:59:51'),(10,'��Ϸ','2019-01-24 08:59:51');









CREATE TABLE `imc_level` (
  `level_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '�γ��Ѷ�ID',
  `level_name` varchar(10) NOT NULL DEFAULT '' COMMENT '�γ��Ѷ�����',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '���ʱ��',
  PRIMARY KEY (`level_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='�γ̷����';




INSERT INTO `imc_level` VALUES (1,'����','2019-01-24 09:01:03'),(2,'����','2019-01-24 09:01:03'),
(3,'�м�','2019-01-24 09:01:03'),(4,'�߼�','2019-01-24 09:01:03');










CREATE TABLE `imc_user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '�û�ID',
  `user_nick` varchar(20) NOT NULL DEFAULT 'Ľ����' COMMENT '�û��ǳ�',
  `user_pwd` char(32) NOT NULL DEFAULT '' COMMENT '����',
  `sex` char(2) NOT NULL DEFAULT 'δ֪' COMMENT '�Ա�',
  `province` varchar(20) NOT NULL DEFAULT '' COMMENT 'ʡ',
  `city` varchar(20) NOT NULL DEFAULT '' COMMENT '��',
  `Position` varchar(10) NOT NULL DEFAULT 'δ֪' COMMENT 'ְλ',
  `mem` varchar(100) NOT NULL DEFAULT '' COMMENT '˵��',
  `exp_cnt` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '����ֵ',
  `score` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '����',
  `follow_cnt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '��ע����',
  `fans_cnt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '��˿����',
  `is_teacher` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '��ʦ��ʶ,0:��ͨ�û�,1:��ʦ�û�',
  `reg_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'ע��ʱ��',
  `user_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '�û�״̬ 1:���� 0:����',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `udx_usernick` (`user_nick`)
) ENGINE=InnoDB AUTO_INCREMENT=4296 DEFAULT CHARSET=utf8 COMMENT='�û���';




INSERT INTO `imc_user` VALUES (1,'������','7c345f726643d5a61753126d52b250d0','1','','','δ֪','',0,0,0,0,0,'2019-01-24 16:31:01',1),
(2,'�ò','35ce19fd941eb52fddfd48a50672810b','0','','','δ֪','',0,0,0,0,0,'2019-01-24 16:31:01',1),
(3,'��¹��','78826bc6694f82e5a6579af70e5d1a79','1','','','δ֪','',0,0,0,0,0,'2019-01-24 16:31:01',1),
(4,'����ĩ','e24db658b6e77741a515e43b9ed80c0a','0','','','δ֪','',0,0,0,0,0,'2019-01-24 16:31:01',1),
(5,'���Ѳ','93e42066280ff2f20ca759c9ede5bc31','1','','','δ֪','',0,0,0,0,0,'2019-01-24 16:31:01',1);

















CREATE TABLE `imc_question` (
  `quest_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '����',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�û�ID',
  `course_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�γ�ID',
  `chapter_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�½�ID',
  `sub_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'С��ID',
  `replyid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '������ID',
  `quest_title` varchar(50) NOT NULL DEFAULT '' COMMENT '���۱���',
  `quest_content` text COMMENT '��������',
  `quest_type` enum('�ʴ�','����') NOT NULL DEFAULT '����' COMMENT '��������',
  `view_cnt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�����',
  `add_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  PRIMARY KEY (`quest_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2321 DEFAULT CHARSET=utf8 COMMENT='�ʴ����۱�';




INSERT INTO `imc_question` VALUES (1,2314,57,727,5321,0,'�û�:2314���� SQLServer�γ�-82618�� 5�µ� 2�ڵ��ʴ�',
'�û�:2314���� SQLServer�γ�-82618�� 5�µ� 2�ڵ��ʴ�','�ʴ�',26,'2019-01-28 17:40:06'),
(2,3014,76,984,7175,0,'�û�:3014���� SQLServer�γ�-00610�� 1�µ� 2�ڵ��ʴ�',
'�û�:3014���� SQLServer�γ�-00610�� 1�µ� 2�ڵ��ʴ�','�ʴ�',89,'2019-01-28 17:40:06'),
(3,3011,14,163,1204,0,'�û�:3011���� PostgreSQL�γ�-57259�� 4�µ� 9�ڵ�����',
'�û�:3011���� PostgreSQL�γ�-57259�� 4�µ� 9�ڵ�����','����',41,'2019-01-28 17:40:06');














CREATE TABLE `imc_note` (
  `note_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '�ʼ�ID',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�û�ID',
  `course_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�γ�ID',
  `chapter_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�½�ID',
  `sub_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'С��ID',
  `note_title` varchar(50) NOT NULL DEFAULT '' COMMENT '�ʼǱ���',
  `note_content` text COMMENT '��������',
  `add_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  PRIMARY KEY (`note_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�ʼǱ�';









CREATE TABLE `imc_classvalue` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '����ID',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�û�ID',
  `course_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�γ�ID',
  `content_score` decimal(3,1) NOT NULL DEFAULT '0.0' COMMENT '��������',
  `level_score` decimal(3,1) NOT NULL DEFAULT '0.0' COMMENT '���׶�',
  `logic_score` decimal(3,1) NOT NULL DEFAULT '0.0' COMMENT '�߼�����',
  `score` decimal(3,1) NOT NULL DEFAULT '0.0' COMMENT '�ۺ�����',
  `add_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  PRIMARY KEY (`value_id`)
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=utf8 COMMENT='�γ����۱�';




INSERT INTO `imc_classvalue` VALUES (1,3065,8,9.0,9.1,8.1,0.0,'2019-01-28 17:10:18'),
(2,952,17,9.6,8.9,10.0,0.0,'2019-01-28 17:10:18'),
(3,3539,59,9.7,8.1,8.1,0.0,'2019-01-28 17:10:18'),(4,2040,53,8.2,9.0,8.6,0.0,'2019-01-28 17:10:18'),
(5,1003,36,8.5,8.8,9.9,0.0,'2019-01-28 17:10:18'),(6,1608,59,8.6,9.2,8.5,0.0,'2019-01-28 17:10:18'),
(7,2374,98,9.2,9.1,8.8,0.0,'2019-01-28 17:10:18'),(8,2080,57,8.5,8.5,9.2,0.0,'2019-01-28 17:10:18'),
(9,2053,14,9.4,9.8,9.0,0.0,'2019-01-28 17:10:18'),(10,2640,64,9.9,8.8,8.8,0.0,'2019-01-28 17:10:18');












CREATE TABLE `imc_selectcourse` (
  `select_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ѡ��ID',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�û�ID',
  `course_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�γ�ID',
  `select_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'ѡ��ʱ��',
  `study_time` time NOT NULL DEFAULT '00:00:00' COMMENT '�ۻ�����ʱ��',
  PRIMARY KEY (`select_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8 COMMENT='�û�ѡ�α�';



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



-- �����ǣ��Ƚ������
/*
=  <  >  >=  <=  <>��!= ����ʾ������; BETWEEN 1000 AND 2000
binary ���ִ�Сд
SELECT 'MYSQL' LIKE BINARY '_ysql'; ����0

*/

SELECT * FROM imc_class;
SELECT class_id,class_name FROM imc_class;
SELECT title FROM imc_course  WHERE title LIKE binary '%MYSQL%'; # ����mysql�Ŀγ���   # NOT LIKE   %���������������ַ��� _����һ���ַ�
SELECT title,study_cnt FROM imc_course  WHERE study_cnt >= 5161;
SELECT title,study_cnt FROM imc_course  WHERE study_cnt>=1000 AND study_cnt<=2000 ;#[1000-2000]
SELECT title,study_cnt FROM imc_course  WHERE study_cnt BETWEEN 1000 AND 2000 ;#[1000-2000]
SELECT * FROM imc_course WHERE title IS NOT NULL;     # IS NULL
SELECT title FROM imc_course WHERE course_id IN (1,3,5);  #�е�ֵ��ָ����Χ�ڵ�����  NOT IN


/*

-- �����ǣ��߼������ AND OR       && ||    XOR һ��һ�ٷ�����  2��2�ٷ��ؼ�

*/

SELECT title,study_cnt FROM imc_course WHERE title LIKE '%mysql%' AND study_cnt>5000;
SELECT title,study_cnt FROM imc_course WHERE title LIKE '%mysql%' OR study_cnt>5000;


SELECT title,study_cnt FROM imc_course WHERE title LIKE '%mysql%' AND study_cnt<5000
UNION ALL
SELECT title,study_cnt FROM imc_course WHERE title NOT LIKE '%mysql%' AND study_cnt>5000; #���ϲ�ѯ ������ѯ�����������
-- ���ϱ�һ���Ĺ��ܣ���XOR   A&B ��!A&!B ��ʱ������õ���ȡA��!B
SELECT title,study_cnt FROM imc_course WHERE title LIKE '%mysql%' XOR study_cnt>5000;


�κ��������NULLֵ����������NULL


/*

������в�ѯ����--������ѯ

JOIN
INNER JOIN �ڹ�����A&&B��     select <select list>  from  tableA A INNER JOIN tableB B   ON A.key=B.key;  (������ļ���)
OUTER JOIN �����   LEFT  JOIN (������)  ��  RIGHT JOIN�������ӣ�
*/
-- ��ѯÿһ�ſγ̵Ŀγ�ID���γ����ƺ��½�����
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
	b.chapter_name                                     --��A||A&&B��
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
group by ���������ĳЩ�зֳɲ�ͬ���飬���Է��������ݽ��оۺϲ���

where ���޷�ʹ�þۺϺ���������ʹ��having���ԾۺϺ�����ݽ��й��ˡ�

-- �ܽ᣺1����ֵ������Ϊ��ѯ��(select 5 from imc_class);
	       2��һ������һ�У�һ��������һ��ֵ������ʹ��group by ==�к;ۺϺ���ʹ�ã�����ʹ��group by;
	       3��select   ��ĳ+�ۺϺ���  group by ��ĳ  ����ĳ=��ĳ��

���õľۺϺ���:�ۺϺ���Ҳ���Ե���ʹ��

1��count(*)(col) ���������������������
2��sum(col_name) ���������������ֵ�еĺ�
3��avg(col_name) ���������������ֵ�еĺ͵�ƽ��ֵ
4��max(col_name) �����е����ֵ  min(col_name)


SELECT COUNT(*) FROM imc_course; #10��
SELECT COUNT(DISTINCT user_id) FROM imc_course; # ȥ��

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

-- ����  5
-- �м�  4
-- �߼�  6


SELECT
	class_name,
	level_name,
	count( * )
FROM
	imc_course a
	JOIN imc_class b ON b.class_id = a.class_id
	JOIN imc_level c ON c.level_id = a.level_id          #�Ѽ�������������
GROUP BY
	class_name,
	level_name
HAVING
	count( * ) >3


	#�ο�1                                                                   #�ο�2
SELECT                                                                 SELECT
	course_id,                   #����һ��                                        course_id,
	AVG( content_score ) AS avg_content,  #����һ��ֵ                               (SELECT AVG(content_score) FROM  imc_classvalue)  #��ֵ
	AVG( level_score ) AS avg_level,               <= ���� =>              FROM
	AVG( logic_score ) AS avg_logic                                       imc_classvalue
FROM
	imc_classvalue
GROUP BY
	course_id;


#�ο�3

SELECT
	(SELECT AVG(content_score) FROM  imc_classvalue )  #��ֵ
FROM
	imc_classvalue



 #�ο���

SELECT
	title,( SELECT MAX( study_cnt ) FROM imc_course ) #��ֵ
FROM
	imc_course
WHERE
	study_cnt = (SELECT MAX( study_cnt ) FROM imc_course ) #��ֵ






/*
ORDER BY  �Բ�ѯ���������ȫ�ķ���   ASC����  DCSC����
����ʹ��select�Ӿ���δ���ֵ��л����Ǻ���

limit���ƽ�������������������б����ݷ�ҳ��ǰ�˷�ҳ�����order by�Ӿ�ʹ�ã�Ϊ�˱�֤ÿ�λ�ȡ�������ݰ���ͬ����������
limit ��ʼƫ����������    ÿҳpageSize������currentPageҳ ����ʼƫ������(currentPage-1)*pageSize,������pageSize��

*/


SELECT
	course_id,
	title 
FROM
	imc_course 
ORDER BY
	study_cnt DESC 
LIMIT 0,10     #(currentPage-1)*pageSize,pageSize   ������һҳû��10�У��ͻ᷵��ʵ������






-- ---------------------------------------------------/SELECT----------------------------------------------




-- ----------------------------------------------------ɾ��/����---------------------------------------------

/*
DELETE 
FROM table_name
[where]
[order by]
[limit](����ֻдһ��������
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

ɾ��

*/









-- ----------------------------------------------------/ɾ��/����---------------------------------------------





-- ----------------------------------------------------������ͼ---------------------------------------------

/*������ͼ����ͼ��һ��������ڵı�
ʹ����ͼ���û���ȫ����Ҫ��ϵ�����Ӧ�ı�ṹ������������ɸѡ���������û���˵�Ѿ��ǹ��˺õķ��������Ľ������
һ����ͼ�Ľṹȷ���ˣ��������α�ṹ�仯���û���Ӱ�죬
Դ�������ж���ͼû��Ӱ�죻Դ���޸������������ͨ���޸���ͼ�������������ɶԷ����ߵ�Ӱ�졣
��ͼ���Ǳ����������ݣ�ֻ��һ������ı�Դ������ݷ����仯����ͼ�Ľ��Ҳͬ�������仯��
 һ������£��ڴ������������Ƶ���ͼʱ�����ϡ�WITH CHECK OPTION�����
 ����SQL���,�򻯸��ӵ�sql����,����֪�����Ĳ�ѯϸ��;��������,��߰�ȫ��;
show tables �鿴��ͼ
drop view ��ͼ���� ɾ����ͼ
��ͼ���޸�:
     alter view ��ͼ��
      as
      ��ѯ���
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


-- ----------------------------------------------------/������ͼ---------------------------------------------