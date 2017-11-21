<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../base.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生基础信息查看</title>
<script type="text/javascript">
	function details(stuId)
	{
		window.location.href = "<%=path%>/commonalityInfo?flag=queryById&id="+stuId;	
	}
</script>
</head>
<body>
<form action="<%=path%>/commonalityInfo" method="get">
	<input type="hidden" name="flag" value="queryAll">
	<fieldset>
		<legend>条件查询学生信息</legend>
			<table>
				<tr>
					<th>请输入查询信息：</th>
					<th>姓名</th>
					<td>
						<input type="text" name="stuName" id="stuName" value='${entity.stuName}'/>
					</td>
					<th>所属班级</th>
					<td>
						<input type="text" name="stuClass" id="stuClass" value='${entity.stuClass}'/>
					</td>
					<th>技术方向</th>
					<td>
						<input type="text" name="stuSkill" id="stuSkill" value='${entity.stuSkill}'/>
					</td>
					<th>手机</th>
					<td>
						<input type="text" name="stuNum" id="stuNum" value='${entity.stuNum}'/>
					</td>
					<td>
						<input type="submit" value="查询"/>
					</td>
				</tr>
			</table>
	</fieldset>
		<fieldset>
			<legend>学生部分基础信息查看</legend>
			<table align="center" border="1" width="100%"  cellpadding="0" cellspacing="0">
				<tr>
					<th>序号</th>
					<th>姓名</th>
					<th>性别</th>
					<th>年龄</th>
					<th>技术方向</th>
					<th>班级</th>
					<th>手机号</th>
					<th>入学日期</th>
					<th>现住地址</th>
					<th>操作选项</th>
				</tr>
				
		<c:forEach items="${pageUtil.list}" var="stuInfo" varStatus="v">		
		<!-- 不同行数给不同颜色 -->
		<c:if test="${v.count%2==0}">
			<tr style="background-color:aquamarine">
		</c:if>
		<c:if test="${v.count%2!=0}">
			<tr>
		</c:if>
		<!-- 不同行数给不同颜色 -->
			<td>${v.count}</td>
			<td>${stuInfo.stuName}</td>
			<td>${stuInfo.stuSex}</td>
			<td>${stuInfo.stuAge}</td>
			<td>${stuInfo.stuSkill}</td>
			<td>
			   <c:forEach items="${classMap}" var="c">
  			       <c:if test="${c.key eq stuInfo.classId}">
  			          ${c.value}
  			       </c:if>
  			       </c:forEach>
			</td>
			<td>${stuInfo.stuNum}</td>
			<td>${stuInfo.stuTime}</td>
			<td>${stuInfo.stuNowAddress}</td>
			<td align="center">
			<input onclick="details('${stuInfo.stuId}')" type="button" value="详情"/>
			</td>
		</c:forEach>
			</table>
		<!-- 页数，条数 -->
		<jsp:include page="../page.jsp"></jsp:include>
		</fieldset>
	</form>
</body>
</html>