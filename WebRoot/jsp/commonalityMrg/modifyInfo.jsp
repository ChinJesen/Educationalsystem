<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../base.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改学生基本信息</title>
<script type="text/javascript">
function _init()
{
 var stuSkill="${entity.stuSkill}";
 if(stuSkill!=null&&stuSkill!="")
	 {
	 	$("#stuSkill").val(stuSkill);
	 }
}
</script>
</head>
<body onload="_init()">
	<form action="<%=path%>/commonalityInfo" method="get">
	<input type="hidden" name="flag" value="modify"/>
		<fieldset>
			<legend>修改学生基本信息</legend>
			<center>${msg}</center>
			<table align="center" border="1">
				<tr>
					<th>姓名</th>
					<td>
						<input type= "hidden" name="stuId" id="stuId" value="${entity.stuId}"/>
						<input type= "text" name="stuName" id="stuName" value="${entity.stuName}"/>
					</td>
				</tr>
				<tr>
					<th>性别</th>
					<td>
						<input type= "text" name="stuSex" value="${entity.stuSex}" id="stuSex"/>
					</td>
				</tr>
				<tr>
					<th>年龄</th>
					<td>
						<input type= "text" name="stuAge" value="${entity.stuAge}" id="stuAge"/>
					</td>
				</tr>
				<tr>
					<th>出生日期</th>
					<td>
						<input type= "date" name="stuBirth" value="${entity.stuBirth}" id="stuBirth"/>
					</td>
				</tr>
				<tr>
					<th>入学日期</th>
					<td>
						<input type= "date" name="stuTime" value="${entity.stuTime}" id="stuTime"/>
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
					<th>所学专业</th>
					<td>
						<input type="text" name="stuProfessional" id="stuProfessional" value="${entity.stuProfessional}"/>
					</td>
				</tr>
				<tr>
					<th>技术方向</th>
					<td>
						<select name="stuSkill" id="stuSkill">
						<option value="JAVA开发">JAVA开发</option>
						<option value="UI设计">UI设计</option>
						</select>
					</td>
				</tr>
				<tr>
			        <th>分配班级</th>
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
					<th>身份证号</th>
					<td>
						<input type="text" name="id_card" id="id_card" value="${entity.id_card}"/>
					</td>
				</tr>
				<tr>
					<th>手机号码</th>
					<td>
						<input type= "text" name="stuNum"  id="stuNum" value="${entity.stuNum}"/>
					</td>
				</tr>
				<tr>
					<th>QQ号码</th>
					<td>
						<input type="text" name="stuQQ" id="stuQQ" value="${entity.stuQQ}"/>
					</td>
				</tr>
				<tr>
					<th>家庭住址</th>
					<td>
						<textarea rows="2" cols="20" name="stuHome" id="stuHome" >${entity.stuHome}</textarea>
					</td>
				</tr>
				<tr>
					<th>现住地址</th>
					<td>
						<textarea rows="2" cols="20" name="stuNowAddress" id="stuNowAddress">${entity.stuNowAddress}</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="修改"/>
						<input type="reset" value="重写"/>
					</td>
				</tr>
			</table>
		</fieldset>
	</form>
</body>
</html>