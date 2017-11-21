<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../base.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查询学生岗位推荐信息</title>
<script type="text/javascript">
function _modify(val){
	window.location.href = "<%=path%>/recommend?flag=queryById&id="+val;	
}
</script>
</head>
<body>
	<form action="<%=path%>/recommend" method="get">
	<input type="hidden" name="flag" value="queryAll" />
		<fieldset>
			<legend>查询推荐学生就业信息</legend>
			<table align="center" border="1">
				<tr>
					<th>序号</th>
					<th>班级</th>
					<th>姓名</th>
					<th>适合岗位</th>
					<th>描述</th>
					<th>操作</th>
				</tr>
				<c:forEach items="${pageUtil.list}" var="job" varStatus="v">		
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
  			       <c:if test="${c.key eq job.classId}">
  			          ${c.value}
  			       </c:if>
  			       </c:forEach>
			</td>
			<td>
				<c:forEach items="${stuNameMap}" var="c">
			       <c:if test="${c.key eq job.stuId}">
			          ${c.value}
			       </c:if>
			       </c:forEach>
			</td>
			<td>${job.recommendwork}</td>
			<td>${job.recommendremark}</td>
			<td align="center">
			<input onclick="_modify('${job.jobId}')" type="button" value="修改"/>
			</td>
		</c:forEach>
			</table>
		<!-- 页数，条数 -->
		<jsp:include page="../page.jsp"></jsp:include>
		</fieldset>
	</form>
</body>
</html>