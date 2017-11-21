<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../base.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生作业上传</title>
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
	
	//恢复照片信息
		var photo = "${entity.homework}"
			 if(photo!=null&&photo!=""){
				 var url = "<%=path%>/homework?flag=ajaxFileDownload&fileName="+photo;
				 $("#homeworkImg").attr("src",url);
			 }
		
}
</script>
<script type="text/javascript">
$(function(){
	$("#homeworkFile").change(function(){
		$.ajaxFileUpload({
			url:"<%=path%>/homework?flag=ajaxfileupload",
			secureuri:false,
			/* 获取id */
			fileElementId:"homeworkFile",
			dataType:'json',
			/* 回掉函数 */
			success:function(data,status){
				$("#homeworkImg").attr("src","<%=path%>/homework?flag=ajaxFileDownload&fileName="+data.filePath);
				$("#homework").val(data.filePath);
			}
		});
	});
});

</script>
</head>
<body onload="init()">
	<form action="<%=path%>/homework" method="get">
	<input type="hidden" name="flag" value="save">
		<fieldset>
			<legend>学生作业上传</legend>
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
						<th>小组名称：</th>
						<td>
							<input type="text" name="groups" id="groups" value="${entity.groups}"/>
						</td>
						<td rowspan="8" width="200px;">
							<img src="" id="homeworkImg" style="width: 200px; height: 150px;"/>
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
						<th>性别：</th>
						<td>
							<input type="text" name="sex" id="sex" value="${entity.sex}"/>
						</td>
					</tr>
					<tr>
						<th>作业内容：</th>
						<td>
							<input type="hidden" name="homework" id="homework">
							<input type="file" name="homeworkFile" id="homeworkFile" />
						</td>
					</tr>
					<tr>
						<th>作业评分</th>
						<td>
							<input type="text" name="score" id="score" value="${entity.score}"/>
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