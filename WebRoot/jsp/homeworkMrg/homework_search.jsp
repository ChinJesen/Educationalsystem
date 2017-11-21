<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../base.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生作业查询</title>
</head>
<body>
	<form action="<%=path%>/homework" method="get">
	<input type="hidden" name="flag" value="queryAll">
		<fieldset>
			<legend>学生作业查询</legend>
			<table align="center" border="1" width="80%">
				<tr>
					<th>序号</th>
					<th>班级</th>
					<th>小组名</th>
					<th>姓名</th>
					<th>性别</th>
					<th>作业上传日期</th>
					<th>作业内容</th>
				</tr>
				
		<c:forEach items="${pageUtil.list}" var="homework" varStatus="v">		
		<!-- 不同行数给不同颜色 -->
		<c:if test="${v.count%2==0}">
			<tr style="background-color:aquamarine">
		</c:if>
		<c:if test="${v.count%2!=0}">
			<tr>
		</c:if>
		<!-- 不同行数给不同颜色 -->
			<td>${v.count}</td>
			<td>
			   <c:forEach items="${classMap}" var="c">
  			       <c:if test="${c.key eq homework.classId}">
  			          ${c.value}
  			       </c:if>
  			       </c:forEach>
			</td>
			<td>${homework.groups}</td>
			<td>
				<c:forEach items="${stuNameMap}" var="c">
			       <c:if test="${c.key eq homework.stuId}">
			          ${c.value}
			       </c:if>
			       </c:forEach>
			</td>
			<td>${homework.sex}</td>
			<td>${homework.task_date}</td>
			<td>${homework.homework}</td>
		</c:forEach>
			</table>
		<!-- 页数，条数 -->
		<jsp:include page="../page.jsp"></jsp:include>
		</fieldset>
	</form>
</body>
</html>