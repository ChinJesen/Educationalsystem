<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../base.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生详情信息</title>
<script type="text/javascript">
function _init(){
	var _classId = "${entity.classId}";
	if (_classId != null && _classId != "")
		{
			window.setTimeout(function(){
			$("#classId").val(_classId);
			$("#classId").trigger("change");
			},100);
		}
 	}
</script>
<script type="text/javascript">
function homework(stuId)
{
	window.location.href = "<%=path%>/commonalityInfo?flag=queryById&id="+stuId;	
}
function homework(stuId)
{
	window.location.href = "jsp/homeworkMrg/homework_upload.jsp";	
}
function exam(stuId)
{
	window.location.href = "jsp/examMrg/exam_upload.jsp";	
}
function job(stuId)
{
	window.location.href = "jsp/jobMrg/recommend.jsp";	
}
</script>
</head>
<body onload="_init()">
	<form action="<%=path%>/commonalityInfo" method="get">
	<input type="hidden" name="flag" value="modify" />
		<fieldset>
			<legend>学生详情信息</legend>
			<center>${msg}</center>
			<table align="center" border="1">
				<tr>
					<th>姓名</th>
					<td>
						<input type="hidden" name="status" value="0" />
						<input type="hidden" name="stuId" value="${entity.stuId}" />
						<input type="text" name="stuName" id="stuName" value="${entity.stuName}"/>
					</td>
				</tr>
				<tr>
					<th>年龄</th>
					<td>
						<input type="text" name="stuAge" id="stuAge" value="${entity.stuAge}"/>
					</td>
				</tr>
				<tr>
					<th>性别</th>
					<td>
						<input type="text" name="stuSex" id="stuSex" value="${entity.stuSex}"/>
					</td>
				</tr>
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
					<th>入学时间</th>
					<td>
						<input type="text" name="stuTime" id="stuTime" value="${entity.stuTime}"/>
					</td>
				</tr>
				<tr>
					<th>出生日期</th>
					<td>
						<input type="text" name="stuBirth" id="stuBirth" value="${entity.stuBirth}"/>
					</td>
				 </tr>
				<tr>
					<th>学历</th>
					<td>
						<input type="text" name="stuEducation" id="stuEducation" value="${entity.stuEducation}"/>
					</td>
				</tr>
				<tr>
					<th>毕业院校</th>
					<td>
						<input type="text" name="stuSchool" id="stuSchool" value="${entity.stuSchool}"/>
					</td>
				</tr>
				<tr>
					<th>专业</th>
					<td>
						<input type="text" name="stuProfessional" id="stuProfessional" value="${entity.stuProfessional}"/>
					</td>
				</tr>
				<tr>
					<th>技术方向</th>
					<td>
						<input type="text" name="stuSkill" id="stuSkill" value="${entity.stuSkill}"/>
					</td>
				</tr>
				<tr>
					<th>身份证号</th>
					<td>
						<input type="text" name="id_card" id="id_card" value="${entity.id_card}"/>
					</td>
				</tr>
				<tr>
					<th>QQ号码</th>
					<td>
						<input type="text" name="stuQQ" id="stuQQ" value="${entity.stuQQ}"/>
					</td>
				</tr>
				<tr>
					<th>电话号码</th>
					<td>
						<input type="text" name="stuNum" id="stuNum" value="${entity.stuNum}"/>
					</td>
				</tr>
				<tr>
					<th>家庭地址</th>
					<td>
						<input type="text" name="stuHome" id="stuHome" value="${entity.stuHome}"/>
					</td>
				</tr>
				<tr>
					<th>现住地址</th>
					<td>
						<input type="text" name="stuNowAddress" id="stuNowAddress" value="${entity.stuNowAddress}"/>
					</td>
				</tr>
				</table>
				<table align="center">
				<tr>
					<td>
						<input  type="submit" value="修改学生信息"/>
					</td>
				</tr>
			</table>
		</fieldset>
	</form>
</body>
</html>