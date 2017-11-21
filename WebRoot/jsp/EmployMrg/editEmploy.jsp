<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../base.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function  _init()
{
	var  sex="${entity.sex}";
	if(sex != null && ""!=sex)
	{
		if($("#sexA").val() == sex)
			$("#sexA").attr("checked","checked")
		else
			$("#sexB").attr("checked","checked")
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
<form action="<%=path%>/EnMrg" >
	<input type="hidden" name="flag" value="modify"/>
	<fieldset>
		<legend>修改学业信息</legend>
		<center>${msg}</center>
		<table align="center" border="1">
				<tr>
			        <th>班级</th>
			        <td>
			        <input type="hidden" name="serial" value="${entity.serial}"/>
			        <input type="hidden" name="status" value="0"/>
			        <select name="classId" id="classId" style="width: 98%">
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
					<select name="stuId" id="stuId" disabled="disabled" >
							<option value="">---请选择---</option>
					</select>
					</td>
				</tr>
				<tr>
					<th>性别</th>
					<td>
						<input type="radio" name=sex id="sexA" value="0"/><label for="sexA" >男
						<input type="radio" name=sex id="sexB" value="1"/><label for="sexB">女
					</td>
				</tr>
				<tr>
					<th>签单日期</th>
					<td>
					<input type="text" name="agreement_time"  id="agreement_time" value="${entity.agreement_time}" style="width: 80%"/>
				       <img id="dateImg" onclick="WdatePicker({el:'agreement_time'})"
				       src="<%=path%>/js/My97DatePicker/skin/datePicker.gif"
				       width="16" height="22" align="middle">
					</td>
				</tr>
				<tr>
					<th>还款日期</th>
					<td>
					<input type="text" name="repay" id="repay" value="${entity.repay}" style="width: 80%"/>
					       <img id="dateImg" onclick="WdatePicker({el:'repay'})"
       						src="<%=path%>/js/My97DatePicker/skin/datePicker.gif"
      						 width="16" height="22" align="middle">
					</td>
				</tr>
				<tr>
					<th>正式</th>
					<td>
					<input type="text" name="formal" id="formal" value="${entity.formal}" style="width: 80%"/>
					       <img id="dateImg" onclick="WdatePicker({el:'formal'})"
       						src="<%=path%>/js/My97DatePicker/skin/datePicker.gif"
      						 width="16" height="22" align="middle">
					</td>
				</tr>
				<tr>
					<th>电话</th>
					<td><input type="text" name="phone" value="${entity.phone}"/></td>
				</tr>
				<tr>
					<th>学历</th>
					<td>
						<select name="eduction" id="eduction">
							<option value="" >--请选择--</option>
							<c:forEach items="${test['XL']}" var="tt">
								<option value="${tt.key}">${tt.value}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th>之前专业</th>
					<td>
					<input type="text" name="major" value="${entity.major}"/></td>
				</tr>
				<tr>
					<th>毕业大学</th>
					<td><input type="text" name="university" value="${entity.university}"/></td>
				</tr>
				<tr>
					<th>毕业时间</th>
					<td>
					<input type="text" name="graduate" id="graduate" value="${entity.graduate}" style="width: 80%"/>
						<img id="dateImg" onclick="WdatePicker({el:'graduate'})"
       						src="<%=path%>/js/My97DatePicker/skin/datePicker.gif"
      						 width="16" height="22" align="middle">
					</td>
				</tr>
				<tr>
					<th>教员推荐岗位</th>
					<td><input type="text" name="workacade_infoemploy_info" value="${entity.workacade_infoemploy_info}"/></td>
				</tr>
				<tr>
					<th>班上学习情况</th>
					<td><input type="text" name="study_station" value="${entity.study_station}"/></td>
				</tr>
				<tr>
					<th>现住址</th>
					<td><input type="text" name="address" value="${entity.address}"/></td>
				</tr>
				<tr>
					<th>就业单位</th>
					<td><input type="text" name="company" value="${entity.company}"/></td>
				</tr>
				<tr>
					<th>入职时间</th>
					<td>
					<input type="text" name="entry_time" id="entry_time" value="${entity.entry_time}" style="width: 80%"/>
							<img id="dateImg" onclick="WdatePicker({el:'entry_time'})"
       						src="<%=path%>/js/My97DatePicker/skin/datePicker.gif"
      						 width="16" height="22" align="middle">
					
					</td>
				</tr>
				<tr>
					<th>就业岗位</th>
					<td><input type="text" name="station" value="${entity.station}"/></td>
				</tr>
				<tr>
					<th>试用期工资</th>
					<td><input type="text" name="period_salary" value="${entity.period_salary}"/></td>
				</tr>
				<tr>
					<th>转正工资</th>
					<td><input type="text" name="salary1" value="${entity.salary1}"/></td>
				</tr>
				<tr>
					<th>是否自主就业</th>
					<td><input type="text" name="self_job" value="${entity.self_job}"/></td>
				</tr>
				<tr>
					<th>推荐人</th>
					<td><input type="text" name="referrer" value="${entity.referrer}"/></td>
				</tr>
				<tr>
					<th>单位联系人</th>
					<td><input type="text" name="unit_linkman" value="${entity.unit_linkman}"/></td>
				</tr>
				<tr>
					<th>二次就业</th>
					<td><input type="text" name="twice_job" value="${entity.twice_job}"/></td>
				</tr>
				<tr>
					<th>试用期工资</th>
					<td><input type="text" name="period_salary2" value="${entity.period_salary2}"/></td>
				</tr>
				<tr>
					<th>转正工资</th>
					<td><input type="text" name="salary2" value="${entity.salary2}"/></td>
				</tr>
				
				<tr>
					<th>就业回访</th>
					<td><input type="text" name="job_visit" value="${entity.job_visit}"/></td>
				</tr>
				
				<tr>
					<th>备注</th>
					<td><input type="text" name="remark" value="${entity.remark}"/></td>
				</tr>
			
			<tr>
				<td>
					<input type="submit" value="修改"/>
					<input type="reset" value="重置"/>
				</td>
			</tr>
		</table>
	</fieldset>
</form>
</body>
</html>