<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../base.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

 
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
function _init(){
	
	var userId = "${entity.userId}";
	if(userId != null && userId!= "");
		$("#userId").val(userId);
		

   var classTeaching = "${entity.classTeaching}";
   if(classTeaching != null && classTeaching!= "");
	$("#classTeaching").val(classTeaching);
}

</script>
</head>
<body onload="_init()">
	<form action="<%=path%>/classMrg" method="get" onsubmit="return _onSub()">
	<input type="hidden" name="flag" value="save">
	<fieldset>
		<legend>添加班级信息</legend>
		<center>${msg}</center>
		<table border="1" align="center">
		    <tr>
				<th>班级名称</th>
				<td>
				    <input type="hidden" name="status" id="status" value="0"/>
					<input type="text" name="className" id="className" onfocus="_Reset('classNameMsg')" value="${entity.className}">
				   <span id="classNameMsg"></span>
				</td>
			</tr>
			<tr>
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
				<th>教学老师</th>
				<td>
		        <select name="classTeaching" id="classTeaching">
			      <option value="">--请选择--</option>
			      <c:forEach items="${userMap}" var="c">
			      <option value="${c.key}">${c.value}</option>
			      </c:forEach>
		       </select>
	        </td>
			</tr>
			
			<tr>
				<th>开班时间</th>
				<td>
			      <input type="text" name="startTime" id="startTime" onfocus="_Reset('startTimeMsg')" value="${entity.startTime}" />
			      <span id="startTimeMsg"></span>
				  <img id="dateImg" onclick="WdatePicker({el:'startTime'})" 
				src="<%=path%>/js/My97DatePicker/skin/datePicker.gif" 
				width="16" height="22" >
			    </td>
			</tr>
			
			<tr>
				<th>结束时间</th>
				<td>
				      <input type="text" name="endTime" id="endTime" onfocus="_Reset('endTimeMsg')" value="${entity.endTime}" />
				      <span id="endTimeMsg"></span>
					  <img id="dateImg" onclick="WdatePicker({el:'endTime'})" 
					src="<%=path%>/js/My97DatePicker/skin/datePicker.gif" 
					width="16" height="22" >
			    </td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="保存"/>
					<input type="reset" value="重置"/>
				</td>
			</tr>
		</table>
	</fieldset>
	</form>
</body>
</html>