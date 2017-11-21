<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../base.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册学生基本信息</title>
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
<script type="text/javascript">
var xmlHttp;
function _validstuName(val)
{
	//创建一个请求对象
	xmlHttp =new XMLHttpRequest();
	//设置请求
	xmlHttp.open("POST","<%=path%>/commonalityInfo?flag=valid&id="+val,true);
	//设置回调函数——38行
	xmlHttp.onreadystatechange = rollback;
	//发送请求
	xmlHttp.send(null);
}

function _Reset(val)
{
	document.getElementById(val).innerHTML="";
	}

function rollback(){
	//服务器返回完毕 而且正常返回
	if(xmlHttp.readyState==4 && xmlHttp.status==200)
	{
		if(xmlHttp.responseText==true || xmlHttp.responseText=="true")
		{
			document.getElementById("stuNameMsg").innerHTML="姓名可用";
		}
		else{
			document.getElementById("stuNameMsg").innerHTML="该姓名已存在";
		}
	}
}

function _onSub(){
	var stuName=document.getElementById("stuName").value;
	if(stuName==null||stuName=="")
	{
		document.getElementById("stuNameMsg").innerHTML="<a style='color:red'>姓名不能为空</a>";
		return false;
	}
	return true;
}
</script>
</head>
<body onload="_init()">
	<form action="<%=path%>/commonalityInfo" method="get" onsubmit="return _onSub()">
	<input type="hidden" name="flag" value="save"/>
		<fieldset>
			<legend>注册学生基本信息</legend>
			<center>${msg}</center>
			<table align="center" border="1">
				<tr>
					<th>姓名</th>
					<td>
						<input type= "hidden" name="status" value="0"/>
						<input type= "text" name="stuName" id="stuName" onchange="_validstuName(this.value)" onfocus="_Reset('userNoMsg')" value="${entity.stuName}"/>
						<span id="stuNameMsg"></span>
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
						<input type= "text" name="stuBirth" value="${entity.stuBirth}" id="stuBirth"/>
						<img id="dateImg" onclick="WdatePicker({el:'stuBirth'})" 
				src="<%=path%>/js/My97DatePicker/skin/datePicker.gif" 
				width="16" height="22" >
					</td>
				</tr>
				<tr>
					<th>入学日期</th>
					<td>
						<input type= "text" name="stuTime" value="${entity.stuTime}" id="stuTime"/>
						<img id="dateImg" onclick="WdatePicker({el:'stuTime'})" 
				src="<%=path%>/js/My97DatePicker/skin/datePicker.gif" 
				width="16" height="22" >
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
						<input type="submit" value="注册"/>
						<input type="reset" value="重写"/>
					</td>
				</tr>
			</table>
		</fieldset>
	</form>
</body>
</html>