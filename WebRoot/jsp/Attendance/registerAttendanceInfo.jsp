<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../base.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function _init(){
	
		var adsituation = "${entity.adsituation}";
		if(adsituation != null && adsituation!= "");
			$("#adsituation").val(adsituation);
			
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
 
function _Reset(val)
{
	document.getElementById(val).innerHTML="";
}
function _onSub(){
	var adNo=document.getElementById("adNo").value;
	if(adNo==null||adNo=="")
	{
		document.getElementById("adNoMsg").innerHTML="<a style='color:red'>职工编号不能为空</a>";
		return false;
	}	
	var adName=document.getElementById("adName").value;
	if(adName==null||adName=="")
	{
		document.getElementById("adNameMsg").innerHTML="<a style='color:red'>姓名不能为空</a>";
		return false;
	}
	var adTime=document.getElementById("adTime").value;
	if(adTime==null||adTime=="")
	{
		document.getElementById("adTimeMsg").innerHTML="<a style='color:red'>日期不能为空</a>";
		return false;
	}
	return true;
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
	<form action="<%=path%>/adMrg" method="get" onsubmit="return _onSub()">
	<input type="hidden" name="flag" value="save">
	<fieldset>
		<legend>添加考勤信息</legend>
		<center>${msg}</center>
		<table border="1" width="80%" align="center">
		    
			<tr>
			   <th>班级</th>
			   <td>
			      <input type="hidden" name="adId" value="${entity.adId}"/>
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
				<th>日期</th>
				<td>
		      <input type="text" name="adTime" id="adTime" onfocus="_Reset('adTimeMsg')" value="${entity.adTime}" />
		      <span id="adTimeMsg"></span>
			  <img id="dateImg" onclick="WdatePicker({el:'adTime'})" 
			src="<%=path%>/js/My97DatePicker/skin/datePicker.gif" 
			width="16" height="22" >
			</td>
			</tr>
				
			<tr>
			  <th>出勤情况</th>
		      <td>
				<select name="adsituation" id="adsituation">
					<option value="正常出勤" selected>正常出勤</option>
					 <option value="迟到">迟到</option>
					 <option value="早退">早退</option>
					 <option value="缺勤">缺勤</option>
					 <option value="请假">请假</option>
					 
				</select>
			  </td>
			</tr>
			<tr>
				<th>备注</th>
				<td>
					<textarea rows="3" cols="30" name="remark">${entity.remark}</textarea>
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
					<input type="submit" value="保存"/>
					<input type="reset" value="重置"/>
				</td>
			</tr>
		</table>
	</fieldset>
	</form>
</body>
</html>