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




