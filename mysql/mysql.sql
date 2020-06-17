
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




CREATE TABLE `imc_chapter` (
  `chapter_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '�½�ID',
  `course_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�γ�ID',
  `chapter_name` varchar(50) NOT NULL DEFAULT '' COMMENT '�½�����',
  `chapter_info` varchar(200) NOT NULL DEFAULT '' COMMENT '�½�˵��',
  `chapter_no` tinyint(2) unsigned zerofill NOT NULL DEFAULT '00' COMMENT '�½ڱ��',
  PRIMARY KEY (`chapter_id`),
  UNIQUE KEY `udx_couseid` (`course_id`,`chapter_name`)
) ENGINE=InnoDB AUTO_INCREMENT=1330 DEFAULT CHARSET=utf8 COMMENT='�γ��½�';





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





CREATE TABLE `imc_level` (
  `level_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '�γ��Ѷ�ID',
  `level_name` varchar(10) NOT NULL DEFAULT '' COMMENT '�γ��Ѷ�����',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '���ʱ��',
  PRIMARY KEY (`level_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='�γ̷����';







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





CREATE TABLE `imc_selectcourse` (
  `select_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ѡ��ID',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�û�ID',
  `course_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�γ�ID',
  `select_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'ѡ��ʱ��',
  `study_time` time NOT NULL DEFAULT '00:00:00' COMMENT '�ۻ�����ʱ��',
  PRIMARY KEY (`select_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8 COMMENT='�û�ѡ�α�';



------------------------------------------------ ����------------------------------------------------
/*

use���ݿ� ��ȷ�ϲ���ı�ȷ����Щ�п���ΪNULL������ΪNULL���Ƿ���Ĭ��ֵ��




*/
