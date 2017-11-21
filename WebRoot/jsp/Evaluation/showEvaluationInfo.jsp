<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../base.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查询综合评分信息</title>
<script type="text/javascript">
   function _modify(sqId)
   {
	   window.location.href="<%=path%>/elMrg?flag=queryById&id="+sqId;   
   }
   function _delete(sqId)
   {
	   if(window.confirm("确认删除？"))
		{
		   window.location.href="<%=path%>/elMrg?flag=delete&id="+sqId; 	
		}
   }
</script>
<script type="text/javascript">
//通过班级获取班级内所有学生信息
$(function(){
	$("#classId").change(function(){
		var classId = $(this).val();
		$("#stuId option:gt(0)").remove();
		if(classId != null && classId != ""){
			$.getJSON("<%=path%>/recommend?flag=getClassIdStu&classId="+classId,function(data){
				if(data){
					var obj = $("#stuId");
					appendOption(obj,data);
				}
			});
		}
	});
});

function appendOption(obj,data){
	for( var i in data){
		for(var j in data[i]){
			for(var n in data[i][j]){
				obj.append("<option value='"+n+"'>"+data[i][j][n]+"</option>");
			}
		}
	}
	obj.removeAttr("disabled");
}
</script>
</head>
<body>
    <form action="<%=path%>/elMrg" method="get">
	<input type="hidden" name="flag" value="queryAll"/>
	<fieldset>
			<legend>查询条件</legend>
			<table width="100%" align="center" border="1">
				<tr>
				<th>班级</th>
			        <td>
			        <input type="hidden" name="sqId" value="${entity.sqId}"/>
			        <input type="hidden" name="status" id="status" value="0"/>
			        <select name="classId" id="classId">
				      <option value="">--请选择--</option>
				      <c:forEach items="${classMap}" var="c">
				      <option value="${c.key}">${c.value}</option>
				      </c:forEach>
			       </select>
			        </td>
					<th>姓名</th>
					<td>
						<select name="stuId" id="stuId" disabled="disabled">
							<option value="">--请选择--</option>
						</select>
					</td>
					<th>班级角色</th>
					<td>
						<input type="text" name="role" value="${entity.role}" >
					</td>										
									
				     <td rowspan="1">
						<input type="submit" value="查询"/>
					</td>
				</tr>
											       
			</table>
		</fieldset>
	
	<fieldset>
		<legend>查询综合评分信息</legend>
		<table border="1" width="100%" align="center">
			<tr>
				<th>序号</th>
				<th>班级</th>
				<th>姓名</th>
				<th>班级角色</th>
				<th>表达</th>
				<th>素养</th>
				<th>户外拓展  </th>
				<th>语言表达能力</th>
				<th>团队协作能力</th>	
				<th>时间管理</th>
				<th>职业礼仪</th>
				<th>项目部 </th>
				<th>访谈1</th>	
				<th>访谈2</th>
				<th>访谈3</th>
							
				<th>操作</th>
			</tr>
			<c:forEach items="${pageUtil.list}" var="elInfo" varStatus="_v">
				<tr>
					<td>${_v.count}</td>
					<td>
			        <c:forEach items="${classMap}" var="c">
  			        <c:if test="${c.key eq elInfo.classId}">
  			          ${c.value}
  			        </c:if>
  			        </c:forEach>
			        </td>
			        <td>
				    <c:forEach items="${stuNameMap}" var="c">
			        <c:if test="${c.key eq elInfo.stuId}">
			          ${c.value}
			        </c:if>
			        </c:forEach>
					<td>${elInfo.role}</td>
					<td>${elInfo.expression}</td>
					<td>${elInfo.attainment}</td>
					<td>${elInfo.outdoor}</td>
					<td>${elInfo.language}</td>
					<td>${elInfo.cooperation}</td>
					<td>${elInfo.spgTime}</td>
					<td>${elInfo.protocol}</td>
					<td>${elInfo.project}</td>
					<td>${elInfo.interview1}</td>
					<td>${elInfo.interview2}</td>
					<td>${elInfo.interview3}</td>
					
					<td align="center">
						<input type="button" value="删除" onclick="_delete('${elInfo.sqId}')"/>
						<input type="button" value="修改" onclick="_modify('${elInfo.sqId}')"/>
					</td>
				</tr>
		
			</c:forEach>
		</table>		
		<jsp:include page="../page.jsp"></jsp:include>
	</fieldset>
	</form>
</body>
</html>