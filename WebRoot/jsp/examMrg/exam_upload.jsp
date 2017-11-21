<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../base.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>阶段测试考核成绩上传</title>
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
	<form action="<%=path%>/stagetest" method="get">
		<input type="hidden" name="flag" value="save">
		<fieldset>
			<legend>阶段测试考核成绩上传</legend>
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
						<th>笔试分数（20分）：</th>
						<td>
							<input type="text" name="written" id="written" value="${entity.written}"/>
						</td>
					</tr>
					<tr>
						<th>上机分数（80分）：</th>
						<td>
							<input type="text" name="embarkation" id="embarkation" value="${entity.embarkation}"/>
						</td>
					</tr>
					<tr>
						<th>总分：</th>
						<td>
							<input type="text" name="grades" id="grades" value="${entity.grades}"/>
						</td>
					</tr>
					<tr>
						<th>备注(150字)：</th>
						<td>
							<textarea rows="5" cols="30" name="remark" id="remark">${entity.remark}</textarea>
						</td>
					</tr>
					<tr>
						<th>第（）阶段：</th>
						<td>
							<input type="text" name="stage" id="stage" value="${entity.stage}"/>
						</td>
					</tr>
					<tr>
						<th>项目（）部：</th>
						<td>
							<input type="hidden" name="status" value="0"/>
							<input type="text" name="project" id="project" value="${entity.project}"/>
						</td>
					</tr>
					<tr>
						<th>上传时间</th>
						<td>
							<input type="text" name="time" id="time"/>
							<img id="dateImg" onclick="WdatePicker({el:'time'})" 
				src="<%=path%>/js/My97DatePicker/skin/datePicker.gif" 
				width="16" height="22" >
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="submit" value="上传"/>
							<input type="reset" value="重填"/>
						</td>
					</tr>
				</table>
		</fieldset>
	</form>
</body>
</html>