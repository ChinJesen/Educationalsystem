<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../base.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function _modify(serial)
	{
		if(null != serial && "" != serial)
		{
			window.location.href="<%=path%>/aiMrg?flag=queryById&id="+serial;
		}
	}
	function _del(serial)
	{
		if(null != serial && "" != serial)
		{
			window.location.href="<%=path%>/aiMrg?flag=delete&id="+serial;
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
<script type="text/javascript">
//恢复提交后的班级和学生
function init(){
	var _classId = "${entity.classId}";
	if (_classId != null && _classId != "")
		{
			window.setTimeout(function(){
			$("#classId").val(_classId);
			$("#classId").trigger("change");
			
			var _stuId = "${entity.stuId}";
			if (_stuId != null && _stuId != "")
				{
					window.setTimeout(function(){
						$("#stuId").val(_stuId);
					},100);
				}
			},100);
		}
}
</script>
</head>
<body onload="init()">
	<form action="<%=path%>/aiMrg">
	<input type="hidden" name="flag" value="queryAll"/>
		<fieldset>
			<legend>查询条件</legend>
			<table>
			<tr>
			    <th>班级</th>
			    <td>
			        <select name="classId" id="classId" >
				      <option value="">--请选择--</option>
				      <c:forEach items="${classMap}" var="c">
				      <option value="${c.key}">${c.value}</option>
				      </c:forEach>
			       </select>
			     </td>
		    
					<th>姓名</th>
					<td>
					<select name="stuId" id="stuId" disabled="disabled" >
							<option value="">---请选择---</option>
					</select>
					</td>
			</tr>
			
			<tr>
				<th>项目经理</th>
				<td><input type="text" name="project_manager"  value="${entity.project_manager }"/></td>			
			</tr>
			
			<tr>
				<td>
					<input type="submit" value="查询"/>
				</td>
			</tr>
		</table>	
		</fieldset>
		<fieldset>
			<legend>学业综合信息查询结果</legend>
			<table width="100%" align="center" border="1">
				<tr>
					<th>姓名</th>
					<th>性别</th>
					<th>项目经理</th>
					<th>美学基础</th>
					<th>APP</th>
					<th>网页设计</th>
					<th>前端</th>
					<th>语言表达能力</th>
					<th>团队协作能力</th>
					<th>时间管理</th>
					<th>职业礼仪</th>
					<th>操作</th>
				</tr>
				<c:forEach items="${pageUtil.list}" var="Acade" varStatus="_ac" >
					<tr>
						<td>
							<c:forEach items="${stuNameMap}" var="c">
								<c:if test="${c.key eq Acade.stuId}">
									${c.value}
								</c:if>
							</c:forEach>
						</td>
						<td>${Acade.sex eq '0'?'男':'女'}</td>
						<td>${Acade.project_manager}</td>
						<td>${Acade.aesthetic_basis2}</td>
						<td>${Acade.app2}</td>
						<td>${Acade.web_Design2}</td>
						<td>${Acade.front2}</td>
						<td>${Acade.expression_ability}</td>
						<td>${Acade.cooperative}</td>
						<td>${Acade.timemanager}</td>
						<td>${Acade.protoco}</td>
						<td>
							<input type="button" value="详情" onclick="_modify('${Acade.serial}')" style="width: 48%"/>
							<input type="button" value="删除" onclick="_del('${Acade.serial}')" style="width: 47%"/>
						</td>
					</tr>
				</c:forEach>
				<jsp:include page="../page.jsp"></jsp:include>
			</table>
		</fieldset>
	</form>
</body>
</html>