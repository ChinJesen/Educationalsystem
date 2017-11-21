<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@include file="../base.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改工作推荐信息</title>
<script type="text/javascript">
function _init(){
		
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
<body onload="_init()">
<form action="<%=path%>/recommend" method="get">
	<input type="hidden" name="flag" value="modify" />
		<fieldset>
			<legend>修改推荐工作信息</legend>
			<center>${msg}</center>
			<table align="center" border="1">
			<tr>
			   <th>班级</th>
			   <td>
			      <input type="hidden" name="jobId" value="${entity.jobId}"/>
			      <input type="hidden" name="status" id="status" value="0"/>
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
							<option value="">——请选择——</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>推荐岗位</th>
					<td>
						<input type="text" name="recommendwork" id="recommendwork" value="${entity.recommendwork}"/>
					</td>
				</tr>
				<tr>
					<th>推荐原因</th>
					<td>
						<input type="text" name="recommendremark" id="recommendremark" value="${entity.recommendremark}"/>
					</td>
				</tr>
				</table>
				<table align="center">
				<tr>
					<td>
						<input  type="submit" value="修改推荐工作信息"/>
					</td>
				</tr>
			</table>
		</fieldset>
	</form>
</body>
</html>