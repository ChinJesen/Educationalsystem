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
	
	//回复下拉框
	var attainment = "${entity.attainment}";
	if(attainment != null && attainment!= "");
		$("#attainment").val(attainment);
		
	var expression = "${entity.expression}";
	if(expression != null && expression!= "");
	   $("#expression").val(expression);
	   
	var outdoor = "${entity.outdoor}";
	if(outdoor != null && outdoor!= "");
	    $("#outdoor").val(outdoor);
		   
    var language = "${entity.language}";
	if(language != null && language!= "");
		$("#language").val(language);
			   
    var cooperation = "${entity.cooperation}";
	if(cooperation != null && cooperation!= "");
	$("#cooperation").val(cooperation);
				   
	var spgTime = "${entity.spgTime}";
	if(spgTime != null && spgTime!= "");
	   $("#spgTime").val(spgTime);	
	   
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
	var name=document.getElementById("name").value;
	if(name==null||name=="")
	{
		document.getElementById("nameMsg").innerHTML="<a style='color:red'>姓名不能为空</a>";
		return false;
	}
	var role=document.getElementById("role").value;
	if(role==null||role=="")
	{
		document.getElementById("roleMsg").innerHTML="<a style='color:red'>班级角色不能为空</a>";
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
<form action="<%=path%>/elMrg" method="get">
 <input type="hidden" name="flag" value="modify">
 <fieldset>
    <legend>修改评分信息</legend>
    <center>${msg}</center>
    <table border="1" align="center" width="80%" bgcolor="#70dbdb">
           <tr>
           <th>班级</th>
			   <td>
			      <input type="hidden" name="sqId" value="${entity.sqId}"/>
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
				<th>班级角色</th>
				<td>
					<input type="text" name="role" id="role" onfocus="_Reset('roleMsg')" value="${entity.role}">
				    <span id="roleMsg"></span>
				</td>
			</tr>
			<tr>
			  <th>表达</th>
		      <td>
				<select name="expression" id="expression">
					 <option value="A">A</option>
					 <option value="B">B</option>
					 <option value="C">C</option>
					 <option value="D">D</option>
				</select>
			  </td>
			</tr>
								
			<tr>
				<th>素养</th>
				<td>
				<select name="attainment" id="attainment">
					 <option value="A">A</option>
					 <option value="B">B</option>
					 <option value="C">C</option>
					 <option value="D">D</option>
				</select>
			  </td>
			</tr>
			<tr>
				<th>户外拓展</th>
				<td>
				<select name="outdoor" id="outdoor">
					 <option value="A">A</option>
					 <option value="B">B</option>
					 <option value="C">C</option>
					 <option value="D">D</option>
				</select>
			  </td>
			</tr>
			<tr>
				<th>语言表达能力</th>
				<td>
				<select name="language" id="language">
					 <option value="A">A</option>
					 <option value="B">B</option>
					 <option value="C">C</option>
					 <option value="D">D</option>
				</select>
				</td>
			</tr>
			
			<tr>
				<th>团队协作能力</th>
				<td>
				<select name="cooperation" id="cooperation">
					 <option value="A">A</option>
					 <option value="B">B</option>
					 <option value="C">C</option>
					 <option value="D">D</option>
				</select>
				</td>
			</tr>
			
			<tr>
				<th>时间管理</th>
				<td>
				<select name="spgTime" id="spgTime">
					 <option value="A">A</option>
					 <option value="B">B</option>
					 <option value="C">C</option>
					 <option value="D">D</option>
				</select>
				</td>
			</tr>
			
			<tr>
				<th>职业礼仪</th>
				<td>
				<select name="protocol" id="protocol">
					 <option value="A">A</option>
					 <option value="B">B</option>
					 <option value="C">C</option>
					 <option value="D">D</option>
				</select>
				</td>
			</tr>
			
			<tr>
				<th>项目部 </th>
				<td>
					<input type="text" name="project" value="${entity.project}">
				</td>
			</tr>
			<tr>
				<th>访谈1</th>
				<td>
					<input type="text" name="interview1" value="${entity.interview1}">
				</td>
			</tr>
			
			<tr>
				<th>访谈2</th>
				<td>
				<input type="text" name="interview2" value="${entity.interview2}">
				</td>
			</tr>
			<tr>
				<th>访谈3</th>
				<td>
					<input type="text" name="interview3" value="${entity.interview3}">
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