/*
SQLyog Enterprise Trial - MySQL GUI v7.11 
MySQL - 5.6.17 : Database - tengen
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`tengen` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `tengen`;

/*Table structure for table `acade_info` */

DROP TABLE IF EXISTS `acade_info`;

CREATE TABLE `acade_info` (
  `serial` int(11) NOT NULL AUTO_INCREMENT,
  `stuId` int(20) DEFAULT NULL,
  `sex` varchar(20) DEFAULT NULL,
  `start_internship` date DEFAULT NULL,
  `end_internship` date DEFAULT NULL,
  `classId` int(20) DEFAULT NULL,
  `project_manager` varchar(20) DEFAULT NULL,
  `headmaster` varchar(20) DEFAULT NULL,
  `Attendance_score` int(10) DEFAULT NULL,
  `Aesthetic_basis` int(10) DEFAULT NULL,
  `app1` int(10) DEFAULT NULL,
  `web_Design` int(10) DEFAULT NULL,
  `front1` int(10) DEFAULT NULL,
  `Aestheticbasis2` int(10) DEFAULT NULL,
  `app2` int(10) DEFAULT NULL,
  `web_Design2` int(10) DEFAULT NULL,
  `front2` int(10) DEFAULT NULL,
  `Expression_ability` int(10) DEFAULT NULL,
  `cooperative` int(10) DEFAULT NULL,
  `timemanager` int(10) DEFAULT NULL,
  `protoco` int(10) DEFAULT NULL,
  `resume` int(10) DEFAULT NULL,
  `production` int(10) DEFAULT NULL,
  `firstsimulate` int(10) DEFAULT NULL,
  `secondsimulate` int(10) DEFAULT NULL,
  `positions` varchar(20) DEFAULT NULL,
  `comments` varchar(20) DEFAULT NULL,
  `remark` varchar(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`serial`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `acade_info` */

insert  into `acade_info`(`serial`,`stuId`,`sex`,`start_internship`,`end_internship`,`classId`,`project_manager`,`headmaster`,`Attendance_score`,`Aesthetic_basis`,`app1`,`web_Design`,`front1`,`Aestheticbasis2`,`app2`,`web_Design2`,`front2`,`Expression_ability`,`cooperative`,`timemanager`,`protoco`,`resume`,`production`,`firstsimulate`,`secondsimulate`,`positions`,`comments`,`remark`,`status`) values (1,1,'0',NULL,NULL,1,'weq',NULL,NULL,NULL,23,NULL,23,NULL,NULL,NULL,NULL,23,23,23,23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(2,17,'0','2017-03-01','2017-03-03',2,'2334234','3423',NULL,NULL,32,NULL,23,NULL,34,43,34,43,34,43,43,34,43,34,34,'344','343','343343',0);

/*Table structure for table `attendance_info` */

DROP TABLE IF EXISTS `attendance_info`;

CREATE TABLE `attendance_info` (
  `adId` int(10) NOT NULL AUTO_INCREMENT,
  `adNo` int(11) DEFAULT NULL,
  `stuId` int(20) DEFAULT NULL,
  `classId` varchar(20) DEFAULT NULL,
  `adTime` date DEFAULT NULL,
  `adsituation` varchar(20) DEFAULT NULL,
  `remark` varchar(40) DEFAULT NULL,
  `status` int(20) DEFAULT NULL,
  PRIMARY KEY (`adId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `attendance_info` */

insert  into `attendance_info`(`adId`,`adNo`,`stuId`,`classId`,`adTime`,`adsituation`,`remark`,`status`) values (1,1,2,'1','2017-03-06','正常出勤','吃完饭扶持范围',0),(2,NULL,1,'1','2017-03-01','正常出勤','是多少啊',0);

/*Table structure for table `class_info` */

DROP TABLE IF EXISTS `class_info`;

CREATE TABLE `class_info` (
  `classId` int(11) NOT NULL AUTO_INCREMENT,
  `className` varchar(20) DEFAULT NULL,
  `userId` int(20) DEFAULT NULL,
  `classTeaching` varchar(20) DEFAULT NULL,
  `startTime` date DEFAULT NULL,
  `endTime` date DEFAULT NULL,
  `status` int(20) DEFAULT NULL,
  PRIMARY KEY (`classId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `class_info` */

insert  into `class_info`(`classId`,`className`,`userId`,`classTeaching`,`startTime`,`endTime`,`status`) values (1,'java1班',1,'2','2017-03-01','2017-03-06',0),(2,'java2班',2,'3','2017-03-06','2017-03-16',0);

/*Table structure for table `department_info` */

DROP TABLE IF EXISTS `department_info`;

CREATE TABLE `department_info` (
  `departId` int(11) NOT NULL AUTO_INCREMENT,
  `departName` varchar(20) DEFAULT NULL,
  `remark` varchar(1000) DEFAULT NULL,
  `createTime` date DEFAULT NULL,
  `boss` int(11) DEFAULT NULL,
  `createUser` varchar(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`departId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `department_info` */

insert  into `department_info`(`departId`,`departName`,`remark`,`createTime`,`boss`,`createUser`,`status`) values (1,'教务部','教务处理','2017-03-03',1,'admin',0),(2,'教学部','教学部门','2017-03-08',NULL,'1',0),(3,'就业部','就业部门','2017-03-08',NULL,'1',0);

/*Table structure for table `dict_item` */

DROP TABLE IF EXISTS `dict_item`;

CREATE TABLE `dict_item` (
  `dictId` int(11) NOT NULL AUTO_INCREMENT,
  `dictCode` varchar(20) DEFAULT NULL,
  `dictValue` varchar(20) DEFAULT NULL,
  `groupCode` varchar(20) DEFAULT NULL,
  `groupName` varchar(20) DEFAULT NULL,
  `sn` int(11) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`dictId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `dict_item` */

insert  into `dict_item`(`dictId`,`dictCode`,`dictValue`,`groupCode`,`groupName`,`sn`,`remark`,`status`) values (2,'CQ','重庆','JG','籍贯',1,'重庆',0);

/*Table structure for table `discipline_info` */

DROP TABLE IF EXISTS `discipline_info`;

CREATE TABLE `discipline_info` (
  `dpId` int(10) NOT NULL AUTO_INCREMENT,
  `stuId` int(20) DEFAULT NULL,
  `classId` varchar(20) DEFAULT NULL,
  `dpTime` date DEFAULT NULL,
  `dpEvent` varchar(20) DEFAULT NULL,
  `dpSanction` varchar(40) DEFAULT NULL,
  `remark` varchar(40) DEFAULT NULL,
  `status` int(20) DEFAULT NULL,
  PRIMARY KEY (`dpId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `discipline_info` */

insert  into `discipline_info`(`dpId`,`stuId`,`classId`,`dpTime`,`dpEvent`,`dpSanction`,`remark`,`status`) values (1,1,'1','2017-03-02','2134354','23435','rewrite',0),(2,3,'2','2017-03-10','请问日期','恶趣味','我欺负的期望',0);

/*Table structure for table `employ_info` */

DROP TABLE IF EXISTS `employ_info`;

CREATE TABLE `employ_info` (
  `serial` int(11) NOT NULL AUTO_INCREMENT,
  `stuId` int(20) DEFAULT NULL,
  `sex` varchar(20) DEFAULT NULL,
  `agreement_time` date DEFAULT NULL,
  `repay` date DEFAULT NULL,
  `formal` date DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `eduction` varchar(20) DEFAULT NULL,
  `major` varchar(20) DEFAULT NULL,
  `university` varchar(20) DEFAULT NULL,
  `graduate` date DEFAULT NULL,
  `workacade_infoemploy_info` varchar(20) DEFAULT NULL,
  `study_station` varchar(20) DEFAULT NULL,
  `address` varchar(20) DEFAULT NULL,
  `company` varchar(20) DEFAULT NULL,
  `entry_time` date DEFAULT NULL,
  `station` varchar(20) DEFAULT NULL,
  `period_salary` int(11) DEFAULT NULL,
  `salary1` int(11) DEFAULT NULL,
  `self_job` varchar(20) DEFAULT NULL,
  `referrer` varchar(20) DEFAULT NULL,
  `unit_linkman` varchar(20) DEFAULT NULL,
  `twice_job` varchar(20) DEFAULT NULL,
  `period_salary2` int(11) DEFAULT NULL,
  `salary2` int(11) DEFAULT NULL,
  `job_visit` varchar(20) DEFAULT NULL,
  `remark` varchar(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `classId` int(11) DEFAULT NULL,
  PRIMARY KEY (`serial`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `employ_info` */

insert  into `employ_info`(`serial`,`stuId`,`sex`,`agreement_time`,`repay`,`formal`,`phone`,`eduction`,`major`,`university`,`graduate`,`workacade_infoemploy_info`,`study_station`,`address`,`company`,`entry_time`,`station`,`period_salary`,`salary1`,`self_job`,`referrer`,`unit_linkman`,`twice_job`,`period_salary2`,`salary2`,`job_visit`,`remark`,`status`,`classId`) values (1,1,'0','2017-03-08','2017-03-08','2017-03-08','3243','3245','324','2345','2017-03-08','43','3432','5342','423','2017-03-08','5342',53423,5342,'432','342','35423','5342',5342,5342,'53243','342',NULL,1),(2,10,'0','2017-03-01','2017-03-01','2017-03-02','3434','3423','3423','23423','2017-03-01','32423','2342','2342','2342','2017-03-02','324',32,423,'32','234','243','234',324,2342,'324','234',0,1);

/*Table structure for table `interview_info` */

DROP TABLE IF EXISTS `interview_info`;

CREATE TABLE `interview_info` (
  `ivId` int(10) NOT NULL AUTO_INCREMENT,
  `stuId` int(20) DEFAULT NULL,
  `ivSex` char(20) DEFAULT NULL,
  `ivTime` date DEFAULT NULL,
  `ivInformation` varchar(20) DEFAULT NULL,
  `ivFollow` varchar(50) DEFAULT NULL,
  `remark` char(10) DEFAULT NULL,
  `document` varchar(20) DEFAULT NULL,
  `status` int(20) DEFAULT NULL,
  `classId` int(11) DEFAULT NULL,
  PRIMARY KEY (`ivId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `interview_info` */

insert  into `interview_info`(`ivId`,`stuId`,`ivSex`,`ivTime`,`ivInformation`,`ivFollow`,`remark`,`document`,`status`,`classId`) values (1,5,'男','2017-03-03','撒大苏打啊啊啊啊','是','大苏打','',0,1);

/*Table structure for table `mock_info` */

DROP TABLE IF EXISTS `mock_info`;

CREATE TABLE `mock_info` (
  `mockid` int(11) NOT NULL AUTO_INCREMENT,
  `classId` int(20) DEFAULT NULL,
  `teacher` varchar(20) DEFAULT NULL,
  `stuId` int(20) DEFAULT NULL,
  `time` date DEFAULT NULL,
  `site` varchar(20) DEFAULT NULL,
  `protocol` int(20) DEFAULT NULL,
  `self_intro` int(20) DEFAULT NULL,
  `answer` int(20) DEFAULT NULL,
  `points` int(20) DEFAULT NULL,
  `photo` varchar(20) DEFAULT NULL,
  `record` varchar(20) DEFAULT NULL,
  `resume` varchar(20) DEFAULT NULL,
  `status` int(20) DEFAULT NULL,
  PRIMARY KEY (`mockid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `mock_info` */

insert  into `mock_info`(`mockid`,`classId`,`teacher`,`stuId`,`time`,`site`,`protocol`,`self_intro`,`answer`,`points`,`photo`,`record`,`resume`,`status`) values (1,2,'wang',17,'2017-03-08','23333',23,2323,2323,232,'0.jpg','','',NULL);

/*Table structure for table `pacific_task_grades` */

DROP TABLE IF EXISTS `pacific_task_grades`;

CREATE TABLE `pacific_task_grades` (
  `hwserial` int(11) NOT NULL AUTO_INCREMENT,
  `groups` varchar(20) DEFAULT NULL,
  `stuId` int(11) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `task_date` date DEFAULT NULL,
  `homework` varchar(50) DEFAULT NULL,
  `score` int(3) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `classId` int(11) DEFAULT NULL,
  PRIMARY KEY (`hwserial`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

/*Data for the table `pacific_task_grades` */

insert  into `pacific_task_grades`(`hwserial`,`groups`,`stuId`,`sex`,`task_date`,`homework`,`score`,`status`,`classId`) values (28,'丰富',3,'女','2017-03-08','0.jpg',32,0,2);

/*Table structure for table `prive_info` */

DROP TABLE IF EXISTS `prive_info`;

CREATE TABLE `prive_info` (
  `priveId` varchar(20) NOT NULL,
  `priveName` varchar(20) DEFAULT NULL,
  `remark` varchar(50) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`priveId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `prive_info` */

insert  into `prive_info`(`priveId`,`priveName`,`remark`,`status`) values ('JWGL','教务管理','教务管理',0),('JXGL','教学管理','教学管理',0),('JYGL','就业管理','就业管理',0),('XTGL','系统管理','系统管理',0);

/*Table structure for table `recommendjob` */

DROP TABLE IF EXISTS `recommendjob`;

CREATE TABLE `recommendjob` (
  `jobId` int(11) NOT NULL AUTO_INCREMENT,
  `stuId` int(20) DEFAULT NULL,
  `classId` int(20) DEFAULT NULL,
  `recommendwork` varchar(20) DEFAULT NULL,
  `recommendremark` varchar(500) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`jobId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `recommendjob` */

insert  into `recommendjob`(`jobId`,`stuId`,`classId`,`recommendwork`,`recommendremark`,`status`) values (1,17,2,'啊啊啊','啊啊啊',0),(9,13,1,'倒萨倒萨','发的是v啊',0),(10,10,1,'没不会吧','不可见',0);

/*Table structure for table `role_info` */

DROP TABLE IF EXISTS `role_info`;

CREATE TABLE `role_info` (
  `roleId` varchar(20) NOT NULL,
  `roleName` varchar(20) DEFAULT NULL,
  `remark` varchar(50) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `role_info` */

insert  into `role_info`(`roleId`,`roleName`,`remark`,`status`) values ('admin','管理员','管理员',0),('jw','教务','教务',0),('jx','教学','教学',0),('jy','就业','就业',0);

/*Table structure for table `role_prive_relation` */

DROP TABLE IF EXISTS `role_prive_relation`;

CREATE TABLE `role_prive_relation` (
  `rpId` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` varchar(20) DEFAULT NULL,
  `priveId` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`rpId`),
  KEY `FK_role_prive_relation` (`roleId`),
  KEY `FK_Reference_5` (`priveId`),
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`priveId`) REFERENCES `prive_info` (`priveId`),
  CONSTRAINT `FK_role_prive_relation` FOREIGN KEY (`roleId`) REFERENCES `role_info` (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `role_prive_relation` */

insert  into `role_prive_relation`(`rpId`,`roleId`,`priveId`) values (2,'admin','XTGL'),(3,'jw','JWGL'),(4,'jx','JXGL'),(5,'jy','JYGL'),(6,'admin','JWGL'),(7,'admin','JXGL'),(8,'admin','JYGL');

/*Table structure for table `special_situation` */

DROP TABLE IF EXISTS `special_situation`;

CREATE TABLE `special_situation` (
  `spId` int(11) NOT NULL AUTO_INCREMENT,
  `stuId` int(20) DEFAULT NULL,
  `classId` int(20) DEFAULT NULL,
  `spGroups` varchar(20) DEFAULT NULL,
  `spTime` date DEFAULT NULL,
  `remark` varchar(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`spId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `special_situation` */

insert  into `special_situation`(`spId`,`stuId`,`classId`,`spGroups`,`spTime`,`remark`,`status`) values (1,2,2,'i联合国机构和','2017-03-02','克鲁尼预估价格',0),(2,1,1,'哭会','2017-03-02','比较酷比苦后',0);

/*Table structure for table `stage_test_grades` */

DROP TABLE IF EXISTS `stage_test_grades`;

CREATE TABLE `stage_test_grades` (
  `staserial` int(11) NOT NULL AUTO_INCREMENT,
  `stuId` int(20) DEFAULT NULL,
  `written` int(3) DEFAULT NULL,
  `embarkation` int(3) DEFAULT NULL,
  `grades` int(3) DEFAULT NULL,
  `remark` varchar(1000) DEFAULT NULL,
  `stage` int(3) DEFAULT NULL,
  `project` varchar(20) DEFAULT NULL,
  `time` date DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `classId` int(11) DEFAULT NULL,
  PRIMARY KEY (`staserial`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `stage_test_grades` */

insert  into `stage_test_grades`(`staserial`,`stuId`,`written`,`embarkation`,`grades`,`remark`,`stage`,`project`,`time`,`status`,`classId`) values (9,9,34,32,33,'犯得上电风扇',22,'2','2017-03-08',0,1);

/*Table structure for table `student_information_info` */

DROP TABLE IF EXISTS `student_information_info`;

CREATE TABLE `student_information_info` (
  `stuId` int(11) NOT NULL AUTO_INCREMENT,
  `stuTime` date DEFAULT NULL,
  `stuName` varchar(20) DEFAULT NULL,
  `stuAge` int(11) DEFAULT NULL,
  `stuSex` varchar(20) DEFAULT NULL,
  `stuBirth` varchar(20) DEFAULT NULL,
  `stuEducation` varchar(20) DEFAULT NULL,
  `stuSchool` varchar(20) DEFAULT NULL,
  `stuSkill` varchar(20) DEFAULT NULL,
  `classId` int(20) DEFAULT NULL,
  `stuProfessional` varchar(20) DEFAULT NULL,
  `id_card` varchar(20) DEFAULT NULL,
  `stuNum` varchar(20) DEFAULT NULL,
  `stuQQ` varchar(20) DEFAULT NULL,
  `stuHome` varchar(20) DEFAULT NULL,
  `stuNowAddress` varchar(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`stuId`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `student_information_info` */

insert  into `student_information_info`(`stuId`,`stuTime`,`stuName`,`stuAge`,`stuSex`,`stuBirth`,`stuEducation`,`stuSchool`,`stuSkill`,`classId`,`stuProfessional`,`id_card`,`stuNum`,`stuQQ`,`stuHome`,`stuNowAddress`,`status`) values (1,'2016-09-20','陈晨',22,'男','23','eqwe','wqe','java开发',1,'wqeq','213213','2131','58686','weqw','qwewe',0),(9,'2017-02-27','让他',23,'女','2017-02-27','球球','分区分','UI设计',4,'非常','34324','1133','342342343','额分为氛围','65欢迎贪官和',0),(10,'2017-02-27','难受',11,'男','2017-02-27','谔谔','的的','UI设计',1,'全球','31311332','33323232','434344','俄方为恶额外付出','不过不过不认同',0),(11,'2017-02-27','袁诚',12,'男','2017-02-27','第三部ve二e','官方','JAVA开发',1,'服务范围','545345','235467876','5654654','那个罚你发给你','体育教育和各位v',0),(12,'2017-03-03','无人区',12,'男','2017-03-03','发v发的','公布年报','JAVA开发',543,' 规划规范的','2435','345687987','3464656645','我揉揉眼睛','起热望日个人',0),(13,'2017-03-03','你本人v',13,'男','2017-03-03','格俄服','分为','JAVA开发',1,'俄国风味个','4354','2435465','243546','我特人','额外人try韩国',0),(16,'2017-03-01','的v',12,'大葱','2017-03-01','沃达丰','沃达丰','UI设计',1,'我去额地方','34354','32456','345','3456','32435',0),(17,'2017-03-15','不v从',34,'哥哥帮你','2017-03-01','温热','温热','JAVA开发',2,'千万','21345','25465','43457','微软会给','为宜如一套',0),(21,'2017-03-06','容忍',21,'男','2017-03-06','人few发','发','JAVA开发',1,'上的错误的','32431','432431','3214314','额范围','few发',0);

/*Table structure for table `students_quality_grades2` */

DROP TABLE IF EXISTS `students_quality_grades2`;

CREATE TABLE `students_quality_grades2` (
  `sqId` int(11) NOT NULL AUTO_INCREMENT,
  `stuId` int(20) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  `expression` varchar(20) DEFAULT NULL,
  `attainment` varchar(20) DEFAULT NULL,
  `language` varchar(20) DEFAULT NULL,
  `cooperation` varchar(20) DEFAULT NULL,
  `spgTime` varchar(20) DEFAULT NULL,
  `protocol` varchar(20) DEFAULT NULL,
  `project` varchar(20) DEFAULT NULL,
  `interview1` varchar(20) DEFAULT NULL,
  `interview2` varchar(20) DEFAULT NULL,
  `interview3` varchar(20) DEFAULT NULL,
  `outdoor` varchar(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `classId` int(11) DEFAULT NULL,
  PRIMARY KEY (`sqId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `students_quality_grades2` */

/*Table structure for table `user_info` */

DROP TABLE IF EXISTS `user_info`;

CREATE TABLE `user_info` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userNo` varchar(20) DEFAULT NULL,
  `userPass` varchar(20) DEFAULT NULL,
  `userName` varchar(20) DEFAULT NULL,
  `userAge` int(11) DEFAULT NULL,
  `userSex` char(1) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `birthDay` date DEFAULT NULL,
  `userFamily` varchar(100) DEFAULT NULL,
  `id_Card` varchar(50) DEFAULT NULL,
  `userNative` varchar(20) DEFAULT NULL,
  `departId` int(11) DEFAULT NULL,
  `roleId` varchar(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  KEY `FK_Reference_3` (`departId`),
  KEY `FK_user_info` (`roleId`),
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`departId`) REFERENCES `department_info` (`departId`),
  CONSTRAINT `FK_user_info` FOREIGN KEY (`roleId`) REFERENCES `role_info` (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `user_info` */

insert  into `user_info`(`userId`,`userNo`,`userPass`,`userName`,`userAge`,`userSex`,`phone`,`birthDay`,`userFamily`,`id_Card`,`userNative`,`departId`,`roleId`,`status`) values (1,'1','1','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'admin',0),(3,'23','23','岗位',22,'0','12345','2017-03-02','3435','3245654','CQ',1,'jw',0),(4,'343','343','请吻我的',34,'0','2456','2017-03-17','3243565764563','324364542','JG',1,'jw',1),(5,'132','3243','哇哇哇',2,'0','12345','2017-03-02','3243565764563','141413','CQ',1,'jw',0),(6,'4','4','4',4,'0','4444','2017-03-08','344343','3434','CQ',3,'jy',0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
