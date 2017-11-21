<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="jsp/base.jsp" %>
<%@taglib uri="http://tengen.com/prive" prefix="p"%>
<!DOCTYPE html>
<html>
<meta http-equiv="content-type" content="text/html;charset=UTF-8">
<head>
<title>腾恩信息管理系统</title>
<!-- 操作列表的展示与隐藏   -->
<script type="text/javascript">
	function showorhide(obj) {
		var _div = obj.nextSibling.nextSibling;
		var _display = _div.style.display;
		if (_display == "none") {
			_div.style.display = "inline";
		} else {
			_div.style.display = "none";
		}
	}
</script>
</head>
<body>
<div class="log">腾恩教学信息管理系统</div>
<div class="caozuo" style=" overflow:scroll; width:264px; height:500px;">

		<div style="cursor: pointer;" onclick="showorhide(this)">学生信息</div>
		<div style="display: none;">
			<a href="jsp/commonalityMrg/registerStudentInfo.jsp" target="mainFrame"><li>学生基本信息录入</li></a>
			<a href="<%=path%>/commonalityInfo?flag=queryAll" target="mainFrame"><li>查询学生信息</li></a>
		</div>
<!-- Admin -->
	<p:prive value="XTGL">
	<div onclick="showorhide(this)">系统管理</div>
	<div style="display:none;">
		<a style="text-decoration:none;" href="jsp/sysManager/DictItemMrg.jsp" target="mainFrame"><li>数据字典维护</li></a>
		</div>
	
	<div onclick="showorhide(this)">用户管理</div>
	<div style="display:none;">
		<a style="text-decoration:none;" href="jsp/userManager/registerUserInfo.jsp" target="mainFrame"><li>添加用户信息</li></a>
		<a style="text-decoration:none;" href="<%=path%>/usMrg?flag=queryAll" target="mainFrame"><li>查询用户信息</li></a>
		</div>
	<div onclick="showorhide(this)">部门管理</div>
	<div style="display:none;">
		<a style="text-decoration:none;" href="jsp/departManager/registerDepartInfo.jsp" target="mainFrame"><li>添加部门信息</li></a>
		<a style="text-decoration:none;" href="<%=path%>/dpartMrg?flag=queryAll" target="mainFrame"><li>查询部门信息</li></a>
		</div>
	</p:prive>
<!-- 教学 -->
	<p:prive value="JXGL">
	
		
	<div style="cursor: pointer;" onclick="showorhide(this)">作业管理</div>
		<div style="display: none;">
			<a href="jsp/homeworkMrg/homework_upload.jsp" target="mainFrame"><li>上传学生作业</li></a>
			<a href="<%=path%>/homework?flag=queryAll" target="mainFrame"><li>查询学生作业</li></a>
		</div>
		
	<div style="cursor: pointer;" onclick="showorhide(this)">考核管理</div>
		<div style="display: none;">
			<a href="jsp/examMrg/exam_upload.jsp" target="mainFrame"><li>阶段测试考核录入</li></a>
			<a href="<%=path%>/stagetest?flag=queryAll" target="mainFrame"><li>查询阶段测试信息</li></a>
		</div>
		
	<div style="cursor: pointer;" onclick="showorhide(this)">推荐就业</div>
		<div style="display: none;">
			<a href="jsp/jobMrg/recommend.jsp" target="mainFrame"><li>推荐学生就业信息录入</li></a>
			<a href="<%=path%>/recommend?flag=queryAll" target="mainFrame"><li>查询推荐学生就业信息</li></a>
		</div>
		</p:prive>
		<!-- 教务部分 -->
		<p:prive value="JWGL">
		<div style="cursor: pointer;" onclick="showorhide(this)">班级管理</div>
		<div style="display:none">
		<a style="text-decoration:none;" href="jsp/ClassInfo/registerClassInfo.jsp" target="mainFrame" ><li>添加班级信息</li></a>
		<a style="text-decoration:none;" href="<%=path%>/classMrg?flag=queryAll" target="mainFrame">
		<li>查询班级信息</li></a>		
		</div>
		
		<div style="cursor: pointer;" onclick="showorhide(this)">考勤管理</div>
		<div style="display:none">
		<a style="text-decoration:none;" href="jsp/Attendance/registerAttendanceInfo.jsp" target="mainFrame" ><li>添加考勤信息</li></a>
		<a style="text-decoration:none;" href="<%=path%>/adMrg?flag=queryAll" target="mainFrame"><li>查询考勤信息</li></a>
		</div>
	
		<div style="cursor: pointer;" onclick="showorhide(this)">违纪管理</div>
			<div style="display:none">
				<a style="text-decoration:none;" href="jsp/Discipline/registerDisciplineInfo.jsp" target="mainFrame"><li>添加违纪信息</li></a>
				<a style="text-decoration:none;" href="<%=path%>/dpMrg?flag=queryAll" target="mainFrame">		<li>查询违纪信息</li></a>
		</div>
		
		<div style="cursor: pointer;" onclick="showorhide(this)">访谈记录</div>
		<div style="display:none">
			<a style="text-decoration:none;" href="jsp/Interview/registerInterviewInfo.jsp" target="mainFrame"><li>添加访谈记录</li></a>
			<a style="text-decoration:none;" href="<%=path%>/ivMrg?flag=queryAll" target="mainFrame"><li>查询访谈记录</li></a>
		</div>
		
	<div style="cursor: pointer;" onclick="showorhide(this)">学员综合素质评分</div>
	  <div style="display:none">
		<a style="text-decoration:none;" href="jsp/Evaluation/registerEvaluationInfo.jsp" target="mainFrame"><li>添加综合素质评分</li></a>
		<a style="text-decoration:none;" href="<%=path%>/elMrg?flag=queryAll" target="mainFrame"><li>查询综合素质评分</li></a>
	  </div>
		
	<div style="cursor: pointer;" onclick="showorhide(this)">特殊加分情况</div>
		<div style="display:none">
			<a style="text-decoration:none;" href="jsp/Special/registerSpecialInfo.jsp" target="mainFrame"><li>添加特殊加分情况</li></a>
			<a style="text-decoration:none;" href="<%=path%>/spMrg?flag=queryAll" target="mainFrame"><li>查询特殊加分情况</li></a>
			</div>
		</p:prive>
		<!-- 就业部分 -->
		<p:prive value="JYGL">
	<div style="cursor: pointer;" onclick="showorhide(this)">模拟面试</div>
		<div style="display:none">
			<a style="text-decoration:none;" href="jsp/MockMrg/Mock_entry.jsp" target="mainFrame"><li>面试内容录入</li></a>
			</div>
			
	<div style="cursor: pointer;" onclick="showorhide(this)">学业信息</div>
		<div style="display:none">
			<a style="text-decoration:none;" href="jsp/EmployMrg/Employ.jsp" target="mainFrame"><li>学业信息录入</li></a>
			<a style="text-decoration:none;" href="<%=path%>/EnMrg?flag=queryAll" target="mainFrame"><li>学业信息查询</li></a>
			</div>
			
	<div style="cursor: pointer;" onclick="showorhide(this)">综合成绩考核</div>
		<div style="display:none">
			<a style="text-decoration:none;" href="jsp/AcadeMrg/AcadeInfoMrg.jsp" target="mainFrame"><li>综合成绩考核录入</li></a>
			<a style="text-decoration:none;" href="<%=path%>/aiMrg?flag=queryAll" target="mainFrame"><li>信息查询</li></a>
			</div>
		</p:prive>
</div>
<div class="neirong">
	<iframe name="mainFrame" class="ifram" frameborder="1" src=""></iframe>
</div>
<div class="banquan">
<h6 align="center">
<a href="http://www.chongqingtengen.com/" target="_blank" >版权所有©重庆腾恩信息技术有限公司</a> 
<a href="http://www.chongqingtengen.com/" target="_blank" >使用系统前必读</a> 
<a href="http://www.chongqingtengen.com/" target="_blank" >邮编：401120&nbsp;</a>
<a href="http://www.chongqingtengen.com/" target="_blank" >渝ICP备05001036号&nbsp;</a>
<a href="http://www.swhttp://www.chongqingtengen.com/upl.edu.cn/" target="_blank" >地址：重庆市渝中区中三支路, 广发大厦六楼</a>
</h6>
</div>
</body>
</html>