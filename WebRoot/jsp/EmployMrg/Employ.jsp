<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="../base.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>就业信息表</title>
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
function init(){
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
	//恢复性别
	var sex = "${entity.sex}";
			
			if(sex != null && sex != "")
			{
				if($("#sexA").val() == sex)
					$("#sexA").attr("checked","checked");
				else
					$("#sexB").attr("checked","checked");
			}
	//恢复下拉列表
	var xl = "${entity.eduction}";
	if(xl != null && xl!= "");
		$("#eduction").val(xl);
}
</script>

</head>
<body onload="init()">
	<form action="<%=path%>/EnMrg">
	<input type="hidden" name=flag value="save"/>
	
		<fieldset>
			<legend>学业信息表</legend>
			<center>${msg}</center>
			<table align="center" border="1">
				
				<tr>
			        <th>班级</th>
			        <td>
			        
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
					<th><label>姓名</label></th>
					<td>
					<select name="stuId" id="stuId" disabled="disabled" >
							<option value="">---请选择---</option>
					</select>
					</td>
				</tr>
				<tr>
					<th><label>性别</label></th>
					<td>
						<input type="radio" name=sex id="sexA" value="0"/><label for="sexA" >男</label>
						<input type="radio" name=sex id="sexB" value="1"/><label for="sexB">女</label>
					</td>
				</tr>
				<tr>
					<th><label>签单日期</label></th>
					<td>
					<input type="text" name="agreement_time"  id="agreement_time" value="${entity.agreement_time}" style="width: 80%"/>
				       <img id="dateImg" onclick="WdatePicker({el:'agreement_time'})"
				       src="<%=path%>/js/My97DatePicker/skin/datePicker.gif"
				       width="16" height="22" align="middle">
					</td>
				</tr>
				<tr>
					<th><label>还款日期</label></th>
					<td>
					<input type="text" name="repay" id="repay" value="${entity.repay}" style="width: 80%"/>
					       <img id="dateImg" onclick="WdatePicker({el:'repay'})"
       						src="<%=path%>/js/My97DatePicker/skin/datePicker.gif"
      						 width="16" height="22" align="middle">
					</td>
				</tr>
				<tr>
					<th><label>正式</label></th>
					<td>
					<input type="text" name="formal" id="formal" value="${entity.formal}" style="width: 80%"/>
					       <img id="dateImg" onclick="WdatePicker({el:'formal'})"
       						src="<%=path%>/js/My97DatePicker/skin/datePicker.gif"
      						 width="16" height="22" align="middle">
					</td>
				</tr>
				<tr>
					<th><label>电话</label></th>
					<td><input type="text" name="phone" value="${entity.phone}"/></td>
				</tr>
				<tr>
					<th><label>学历</label></th>
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
					<th><label>之前专业</label></th>
					<td>
					<input type="text" name="major" value="${entity.major}"/></td>
				</tr>
				<tr>
					<th><label>毕业大学</label></th>
					<td><input type="text" name="university" value="${entity.university}"/></td>
				</tr>
				<tr>
					<th><label>毕业时间</label></th>
					<td>
					<input type="text" name="graduate" id="graduate" value="${entity.graduate}" style="width: 80%"/>
						<img id="dateImg" onclick="WdatePicker({el:'graduate'})"
       						src="<%=path%>/js/My97DatePicker/skin/datePicker.gif"
      						 width="16" height="22" align="middle">
					</td>
				</tr>
				<tr>
					<th><label>教员推荐岗位</label></th>
					<td><input type="text" name="workacade_infoemploy_info" value="${entity.workacade_infoemploy_info}"/></td>
				</tr>
				<tr>
					<th><label>班上学习情况</label></th>
					<td><input type="text" name="study_station" value="${entity.study_station}"/></td>
				</tr>
				<tr>
					<th><label>现住址</label></th>
					<td><input type="text" name="address" value="${entity.address}"/></td>
				</tr>
				<tr>
					<th><label>就业单位</label></th>
					<td><input type="text" name="company" value="${entity.company}"/></td>
				</tr>
				<tr>
					<th><label>入职时间</label></th>
					<td>
					<input type="text" name="entry_time" id="entry_time" value="${entity.entry_time}" style="width: 80%"/>
							<img id="dateImg" onclick="WdatePicker({el:'entry_time'})"
       						src="<%=path%>/js/My97DatePicker/skin/datePicker.gif"
      						 width="16" height="22" align="middle">
					
					</td>
				</tr>
				<tr>
					<th><label>就业岗位</label></th>
					<td><input type="text" name="station" value="${entity.station}"/></td>
				</tr>
				<tr>
					<th><label>试用期工资</label></th>
					<td><input type="text" name="period_salary" value="${entity.period_salary}"/></td>
				</tr>
				<tr>
					<th><label>转正工资</label></th>
					<td><input type="text" name="salary1" value="${entity.salary1}"/></td>
				</tr>
				<tr>
					<th><label>是否自主就业</label></th>
					<td><input type="text" name="self_job" value="${entity.self_job}"/></td>
				</tr>
				<tr>
					<th><label>推荐人</label></th>
					<td><input type="text" name="referrer" value="${entity.referrer}"/></td>
				</tr>
				<tr>
					<th><label>单位联系人</label></th>
					<td><input type="text" name="unit_linkman" value="${entity.unit_linkman}"/></td>
				</tr>
				<tr>
					<th><label>二次就业</label></th>
					<td><input type="text" name="twice_job" value="${entity.twice_job}"/></td>
				</tr>
				<tr>
					<th><label>试用期工资</label></th>
					<td><input type="text" name="period_salary2" value="${entity.period_salary2}"/></td>
				</tr>
				<tr>
					<th><label>转正工资</label></th>
					<td><input type="text" name="salary2" value="${entity.salary2}"/></td>
				</tr>
				
				<tr>
					<th><label>就业回访</label></th>
					<td><input type="text" name="job_visit" value="${entity.job_visit}"/></td>
				</tr>
				
				<tr>
					<th><label>备注</label></th>
					<td><input type="text" name="remark" value="${entity.remark}"/></td>
				</tr>
				<tr>
					<td align="center" colspan="2">
						<input type="submit" value="保存"/>
						<input type="reset" value="重置"/>
					</td>				
				</tr>
			</table>
		</fieldset>
	</form>
</body>
</html>