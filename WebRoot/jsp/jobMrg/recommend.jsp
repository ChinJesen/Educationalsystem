<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@include file="../base.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>老师推荐就业信息</title>
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
	<form action="<%=path%>/recommend" method="get">
		<input type="hidden" name="flag" value="save">
		<fieldset>
		<legend>推荐工作信息录入</legend>
			<center>${msg}</center>
			<table align="center" border="1">
				<tr>
			        <th>班级</th>
			        <td>
			        <select name="classId" id="classId">
				      <option value="">--请选择--</option>
				      <c:forEach items="${classMap}" var="c">
				      <option value="${c.key}">${c.value}</option>
				      </c:forEach>
			       </select>
			        </td>
	       		</tr>
				<tr>
					<th>姓名</th>
					<td>
						<select name="stuId" id="stuId" disabled="disabled">
							<option value="">--请选择--</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>适合岗位</th>
					<td>
						<input type="text" name="recommendwork" id="recommendwork" value="${entity.recommendwork}"/>
					</td>
				</tr>
				<tr>
					<th>描述</th>
					<td>
						<textarea cols="30" rows="9" name="recommendremark" id="recommendremark">${entity.recommendremark}</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="保存"/>
						<input type="reset" value="重填"/>
					</td>
				</tr>
			</table>
		</fieldset>
	</form>
</body>
</html>