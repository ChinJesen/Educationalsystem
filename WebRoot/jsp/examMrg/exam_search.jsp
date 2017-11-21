<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../base.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>阶段测试考核查询</title>
<script type="text/javascript">
function _modify(val){
	window.location.href = "<%=path%>/stagetest?flag=queryById&id="+val;	
}

</script>
</head>
<body>
	<form action="<%=path%>/stagetest" method="get">
	<input type="hidden" name="flag" value="queryAll">
		<fieldset>
			<legend>阶段测试考核查询</legend>
			<table align="center" border="1" width="80%">
				<tr>
					<th>序号</th>
					<th>班级</th>
					<th>姓名</th>
					<th>笔试分数</th>
					<th>上机分数</th>
					<th>总成绩</th>
					<th>备注</th>
					<th>第（）阶段</th>
					<th>项目（）部</th>
					<th>时间</th>
					<th>操作选项</th>
				</tr>
				
		<c:forEach items="${pageUtil.list}" var="exam" varStatus="v">		
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
  			       <c:if test="${c.key eq exam.classId}">
  			          ${c.value}
  			       </c:if>
  			       </c:forEach>
			</td>
			<td>
				<c:forEach items="${stuNameMap}" var="c">
			       <c:if test="${c.key eq exam.stuId}">
			          ${c.value}
			       </c:if>
			       </c:forEach>
			</td>
			<td>${exam.written}</td>
			<td>${exam.embarkation}</td>
			<td>${exam.grades}</td>
			<td>${exam.remark}</td>
			<td>${exam.stage}</td>
			<td>${exam.project}</td>
			<td>${exam.time}</td>
			<td align="center">
			<input onclick="_modify('${exam.staserial}')" type="button" value="修改"/>
			</td>
		</c:forEach>
			</table>
			<!-- 页数，条数 -->
		<jsp:include page="../page.jsp"></jsp:include>
		</fieldset>
	</form>
</body>
</html>