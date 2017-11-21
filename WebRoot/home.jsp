<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/jsp/base.jsp" %>
<%@taglib uri="http://tengen.com/prive" prefix="p"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" href="<%=path %>/css/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="<%=path %>/css/themes/icon.css" />
<link rel="stylesheet" type="text/css" href="<%=path %>/css/home.css" />
<script type="text/javascript" src="<%=path %>/js/jquery.easyui.min.1.2.2.js"></script>
<script type="text/javascript" src="<%=path %>/js/home.js"></script>

<title>主页</title>
</head>
<body class="easyui-layout" style="overflow-y:hidden" scroll="no" onload="_init()">
	<div id="header" region="north" split="false" border="false">
        <span style="padding-left:10px; font-size: 18px; ">
        	<img src="images/blocks.gif" width="20" height="20" align="absmiddle" />
        	教务管理系统
        </span>
        <span style="float:right; padding-right:20px; font-size: 15px;" class="head">
        	<%-- 欢迎  ${sessionScope.userInfo.compellation }  --%>
        	<a href="jsp/userManager/modifiy_password.jsp" id="editpass">修改密码</a>
        	<a href="http://127.0.0.1:8080/Educationalsystem/Index.jsp" id="loginOut">退出</a>
        	<label id="currentTime"></label>
        </span>
    </div>
    
    <div id="menu" region="west" hide="true" split="false" title="导航菜单" >
    	<div id="nav" class="easyui-accordion" fit="true" border="false">
    	<p:prive value="XTGL">
    		<div title="系统管理">
    			<ul class="score">
					<li>数据维护
						<ol class="public">
							<li><a href="jsp/sysManager/DictItemMrg.jsp" target="mainFrame">数据字典维护</a></li>
						</ol>
					</li>
					<li>部门管理
						<ol class="public">
							<li><a href="jsp/departManager/registerDepartInfo.jsp" target="mainFrame">添加部门</a></li>
							<li><a href="<%=path%>/dpartMrg?flag=queryAll" target="mainFrame">部门信息</a></li>
						</ol>
					</li>
					<li>人员管理
						<ol class="public">
							<li><a href="jsp/userManager/registerUserInfo.jsp" target="mainFrame">新增人员</a></li>
							<li><a href="<%=path%>/usMrg?flag=queryAll" target="mainFrame">员工信息</a></li>
						</ol>
					</li>
				</ul>
    		</div>
    		</p:prive>
    		<p:prive value="JWGL">
    		<div title="教务管理">
    			<ul class="score">
					<li>班级管理
						<ol class="public">
							<li><a href="jsp/ClassInfo/registerClassInfo.jsp" target="mainFrame">添加班级</a></li>
							<li><a href="<%=path%>/classMrg?flag=queryAll" target="mainFrame">班级信息</a></li>
						</ol>
					</li>
					<li>学员信息
						<ol class="public">
							<li><a href="jsp/commonalityMrg/registerStudentInfo.jsp" target="mainFrame">添加学员</a></li>
							<li><a href="<%=path%>/commonalityInfo?flag=queryAll" target="mainFrame">学员信息</a></li>
						</ol>
					</li>
					<li>考勤管理
						<ol class="public">
							<li><a href="jsp/Attendance/registerAttendanceInfo.jsp" target="mainFrame">添加考勤</a></li>
							<li><a href="<%=path%>/adMrg?flag=queryAll" target="mainFrame">查询考勤</a></li>
						</ol>
					</li>
					<li>违纪管理
						<ol class="public">
							<li><a href="jsp/Discipline/registerDisciplineInfo.jsp" target="mainFrame">添加违纪</a></li>
							<li><a href="<%=path%>/dpMrg?flag=queryAll" target="mainFrame">查询违纪</a></li>
						</ol>
					</li>
					<li>访谈管理
						<ol class="public">
							<li><a href="jsp/Interview/registerInterviewInfo.jsp" target="mainFrame">添加访谈</a></li>
							<li><a href="<%=path%>/ivMrg?flag=queryAll" target="mainFrame">查看访谈</a></li>
						</ol>
					</li>
					<li>学员素质评分
						<ol class="public">
							<li><a href="jsp/Evaluation/registerEvaluationInfo.jsp" target="mainFrame">添加评分信息</a></li>
							<li><a href="<%=path%>/elMrg?flag=queryAll" target="mainFrame">查看评分信息</a></li>
						</ol>
					</li>
					<li>特殊情况加分
						<ol class="public">
							<li><a href="jsp/Special/registerSpecialInfo.jsp" target="mainFrame">添加信息</a></li>
							<li><a href="<%=path%>/spMrg?flag=queryAll" target="mainFrame">查看信息</a></li>
						</ol>
					</li>
				</ul>
    		</div>
    		</p:prive>
    		<p:prive value="JXGL">
    		<div title="教学管理">
    			<ul class="score">
					<li>平时作业
						<ol class="public">
							<li><a href="jsp/homeworkMrg/homework_upload.jsp" target="mainFrame">作业内容录入</a></li>
							<li><a href="<%=path%>/homework?flag=queryAll" target="mainFrame">作业内容查询</a></li>
						</ol>
					</li>
					<li>阶段考核
						<ol class="public">
							<li><a href="jsp/examMrg/exam_upload.jsp" target="mainFrame">考核内容录入</a></li>
							<li><a href="<%=path%>/stagetest?flag=queryAll" target="mainFrame">考核内容查询</a></li>
						</ol>
					</li>
					<li>岗位推荐
						<ol class="public">
							<li><a href="jsp/jobMrg/recommend.jsp" target="mainFrame">岗位推荐录入</a></li>
							<li><a href="<%=path%>/recommend?flag=queryAll" target="mainFrame">岗位推荐查询</a></li>
						</ol>
					</li>
				</ul>
    		</div>
    		</p:prive>
    		<p:prive value="JYGL">
    		<div title="就业管理">
    			<ul class="score">
					<li>模拟面试
						<ol class="public">
							<li><a href="jsp/MockMrg/Mock_entry.jsp" target="mainFrame">模拟面试</a></li>
						</ol>
					</li>
					<li>学业管理
						<ol class="public">
							<li><a href="jsp/EmployMrg/Employ.jsp" target="mainFrame">添加学业信息</a></li>
							<li><a href="<%=path%>/EnMrg?flag=queryAll" target="mainFrame">查询学业信息</a></li>
						</ol>
					</li>
					<li>综合信息
						<ol class="public">
							<li><a href="jsp/AcadeMrg/AcadeInfoMrg.jsp" target="mainFrame">综合成绩录入</a></li>
							<li><a href="<%=path%>/aiMrg?flag=queryAll"  target="mainFrame">信息汇总查询</a></li>
						</ol>
					</li>
				</ul>
    		</div>
    		</p:prive>
    	</div>
    </div>
    <div id="content" region="center" split="false">
    	<div id="tabs" class="easyui-tabs" fit="true" border="false">
    		<iframe name="mainFrame" id="main_content_frame"></iframe>
    	</div>
    </div>
    
    <div id="bottom" region="south" split="false">
    	<div class="footer">版权所有：Java项目三部4组</div>
    </div>
</body>
</html>