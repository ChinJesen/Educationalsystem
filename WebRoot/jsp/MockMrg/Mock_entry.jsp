<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../base.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
 //运用jQuery处理照片保存问题
$(function(){
	$("#photoFile").change(function(){
		$.ajaxFileUpload({
				url:"<%=path%>/tsMrg?flag=ajaxFileupload",
				secureuri:false,
				fileElementId:"photoFile",
				dataType:'json',
				success:function(data,status){
					var url="<%=path%>/tsMrg?flag=ajaxFileDownload&fileName="+data.filePath+"&"+Math.random();
					$("#photoImg").attr("src",url);
					$("#photo").val(data.filePath);
				}
		});
	});
});
</script>
<script type="text/javascript">
 //解决录音文件的录入问题
$(function(){
	$("#recordFile").change(function(){
		$.ajaxFileUpload({
				url:"<%=path%>/tsMrg?flag=ajaxFileUpload",
				secureuri:false,
				fileElementId:"recordFile",
				dataType:'json',
				success:function(data,status){
					var url="<%=path%>/tsMrg?flag=ajaxFileDownload&fileName="+data.filePath+"&"+Math.random();
					$("#recordImg").attr("src",url);
					$("#record").val(data.filePath);
					$("#recordspan").val("录音已找到");
				}
		});
	});
});

</script>
<script type="text/javascript">
//处理简历的上传问题
$(function(){
	$("#resumeFile").change(function(){
		$.ajaxFileUpload({
			url:"<%=path%>/tsMrg?flag=ajaxFileUpload",
			secureuri:false,
			fileElementId:"resumeFile",
			dataType:'json',
			success:function(data,status){
				var url="<%=path%>/tsMrg?flag=ajaxFileDownload&fileName="+data.filePath;
				$("#resumespan").val("简历已找到");
				$("#resumeImg").attr("src",url);
				$("#resume").val(data.filePath);
			}
		}); 
	});
});

</script>
<script type="text/javascript">
function _init()
{
	//恢复照片
	var photo="${entity.photo}";
	if(photo !=null&& photo!=""){
 	  	var url="<%=path%>/tsMrg?flag=ajaxFileDownload&fileName="+photo;
		$("#photoImg").attr("src",url);
	}	
	//恢复提交后的班级和学生
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
	<form action="<%=path%>/tsMrg">
		<input type="hidden" name="flag" value="save"/>
		<fieldset>
			<legend>模拟面试录入</legend>
			<center>${msg}</center>
			<table align="center" border="1">
				<tr>
			        <th >班级</th>
			        <td>
			        <select name="classId" id="classId" style="width: 98%">
				      <option value="">--请选择--</option>
				      <c:forEach items="${classMap}" var="c">
				      <option value="${c.key}">${c.value}</option>
				      </c:forEach>
			       </select>
			        </td>
			        <td rowspan="8">
					 <img src="" id="photoImg" style="width:200px;height:200px;" />
					 </td>
		       </tr>
				<tr>
					<th>面试老师</th>
					<td>
						<select name="teacher" id="teacher">
							<option>--请选择--</option>
							<c:forEach items="${userMap}" var="u">
							<option value="${u.key}">${u.value}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th>面试学员</th>
					<td>
						<select name="stuId" id="stuId" disabled="disabled" >
							<option value="">---请选择---</option>
						</select>
					</td>
					
				</tr>
				<tr>
					<th>面试时间</th>
					<td>
					<input type="text" name="time" id="time" value="${entity.time}" style="width: 88%"/>
					 <img id="dateImg" onclick="WdatePicker({el:'time'})"
       src="<%=path%>/js/My97DatePicker/skin/datePicker.gif"
       width="16" height="22" align="absmiddle">
					</td>
				</tr>
				<tr>
					<th>面试地点</th>
					<td><input type="text" name="site" value="${entity.site}" style="width: 98%"/></td>
				</tr><tr>
					<th>职业礼仪</th>
					<td><input type="text" name="protocol" value="${entity.protocol}"  style="width: 98%"/></td>
				</tr><tr>
					<th>自我介绍</th>
					<td><input type="text" name="self_intro"  value="${entity.self_intro}" style="width: 98%"/></td>
				</tr><tr>
					<th>专业问答</th>
					<td><input type="text" name="answer"  value="${entity.answer}" style="width: 98%"/></td>
				</tr>
				<tr>
					<th>面试总分</th>
					<td><input type="text" name="points"  value="${entity.points}" style="width: 98%"/></td>
				</tr><tr>
					<th>照片</th>
					<td>
					<input type="hidden" name="photo"  id="photo"/>
					<input type="file" name="photoFile" id="photoFile" style="width: 98%"/>
					</td>
				</tr>
				<tr>
					<th>录音</th>
					<td>
					<input type="hidden" name="record"  id="record"/>
					<input type="file" name="recordFile" id="recordFile" style="width: 98%"/>
					<span  id="recordspan"></span>
					</td>
				</tr>
				<tr>
					<th>简历</th>
					<td>
					<input type="hidden" name="resume" id="resume" />
					<input type="file" name="resumeFile" id="resumeFile"  style="width: 98%"/>
					<span  id="resumespan"></span>
					</td>
				</tr>
				<tr >
					<td colspan="2">
					<input type="submit"  value="提交"/>
					<input type="reset"  value="重置"/>
					</td>
				</tr>
			</table>
		</fieldset>
	</form>
</body>
</html>