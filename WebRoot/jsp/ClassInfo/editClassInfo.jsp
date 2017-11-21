<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.tengen.jiaowu.entity.*"%>
<%@include file="../base.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改页面</title>
<script type="text/javascript">
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
<form action="<%=path%>/classMrg" method="get">
 <input type="hidden" name="flag" value="modify">
 <fieldset>
    <legend>修改班级信息</legend>
    <center>${msg}</center>
    <table border="1" align="center" width="80%" bgcolor="#70dbdb">
           <tr>
				<th>班级名称</th>
				<td>
				    <input type="hidden" name="status" id="status" value="0"/>
				    <input type="hidden" name="classId" value="${entity.classId}"/>
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
       <td colspan="2">
        <input type="submit" value="修改"/>
        <input type="reset" value="重置"/>
       </td>
    </tr>
    </table>
    </fieldset>
    </form>
</body>
</html>