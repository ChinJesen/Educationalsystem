<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../base.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查询页面</title>
<script type="text/javascript" src="<%=path%>/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
   function _modify(classId)
   {
	   window.location.href="<%=path%>/classMrg?flag=queryById&id="+classId;   
   }
   function _delete(classId)
   {
	   if(window.confirm("确认删除？"))
		{
		   window.location.href="<%=path%>/classMrg?flag=delete&id="+classId; 	
		}
   }
</script>
</head>
<body>
    <form action="<%=path%>/classMrg" method="get">
	<input type="hidden" name="flag" value="queryAll"/>
	<fieldset>
			<legend>查询条件</legend>
			<table width="100%" align="center" border="1">
			
				<tr>
					<th>班级名称</th>
					<td>
						<input type="text" name="className" value="${entity.className}" >
					</td>	
				<th>班主任</th>
				<td>
		        <select name="userId" id="userId">
			      <option value="">--请选择--</option>
			      <c:forEach items="${userMap}" var="c">
			      <option value="${c.key}">${c.value}</option>
			      </c:forEach>
		       </select>
	        </td>
					</tr>
					<tr>					
					<th>开班日期</th>
					<td>
						<input type="text" name="startTime" id="startTime" value="${entity.startTime}">
						<img id="dateImg" onclick="WdatePicker({el:'startTime'})" 
						src="<%=path%>/js/My97DatePicker/skin/datePicker.gif" 
						width="16" height="22"  >
					</td>
					<th>结束时间</th>
					<td>
						<input type="text" name="endTime" id="endTime" value="${entity.endTime}">
						<img id="dateImg" onclick="WdatePicker({el:'endTime'})" 
						src="<%=path%>/js/My97DatePicker/skin/datePicker.gif" 
						width="16" height="22"  >
					</td>
					
				     <td rowspan="1">
						<input type="submit" value="查询"/>
					</td>
					</tr>
					
			</table>
		</fieldset>
	
	<fieldset>
		<legend>查询班级信息</legend>
		<table border="1" width="70%" align="center">
			<tr>
				<th>序号</th>
				<th>班级名称</th>
				<th>班主任</th>
				<th>教学老师</th>	
				<th>开班时间</th>
				<th>结束时间</th>
				
				<th>操作</th>
			</tr>
			<c:forEach items="${pageUtil.list}" var="classInfo" varStatus="_v">
				<tr>
					<td>${_v.count}</td>
					<td>${classInfo.className}</td>
					
					<td>
					   <c:forEach items="${userMap}" var="c">
    			       <c:if test="${c.key eq classInfo.userId}">
    			          ${c.value}
    			       </c:if>
    			       </c:forEach>
					</td>
					<td>
					   <c:forEach items="${userMap}" var="c">
    			       <c:if test="${c.key eq classInfo.classTeaching}">
    			          ${c.value}
    			       </c:if>
    			       </c:forEach>
					</td>
					<td>${classInfo.startTime}</td>
					<td>${classInfo.endTime}</td>
					
					<td align="center">
						<input type="button" value="删除" onclick="_delete('${classInfo.classId}')"/>
						<input type="button" value="修改" onclick="_modify('${classInfo.classId}')"/>
					</td>
				</tr>
		
			</c:forEach>
		</table>		
		<jsp:include page="../page.jsp"></jsp:include>
	</fieldset>
	</form>
</body>
</html>