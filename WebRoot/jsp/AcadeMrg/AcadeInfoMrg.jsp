<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="../base.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学业综合信息表</title>
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
</head>
<body onload="init()">
<form action="<%=path%>/aiMrg">
	<input type="hidden" name="flag" value="save"/>
	<fieldset>
		<legend>学业综合信息表</legend>
		<center>${msg}</center>
		<table align="center" border="1px" cellpadding="0" cellspacing="0">
			<!-- 标题 -->
			<tr>
				<td colspan="6" align="center">
					<label>学员综合成绩考核记录表</label>
					<input type="hidden" name="status" value="0"/>
				</td>
			</tr>
			<!-- 第一行 -->
			<tr  height="50px" >
				<td colspan="2" align="center">
					<label>班级：</label>
					<select name="classId" id="classId" style="width: 98%">
				      <option value="">--请选择--</option>
				      <c:forEach items="${classMap}" var="c">
				      <option value="${c.key}">${c.value}</option>
				      </c:forEach>
			       </select>
				</td>
				<td colspan="2" align="center">
					<label>性别：</label>
					<input type="radio" name="sex" value="0" id="sexA" checked="checked"/> <label for="sexA" style="cursor: pointer;">男</label>
					<input type="radio" name="sex" value="1" id="sexB"/> <label for="sexB" style="cursor: pointer;">女</label>
				</td>
				<td colspan="2" align="center">
					<label>实习期：</label>
					<input type="text" name="start_internship" id="start_internship" value="${entity.start_internship}"/>
							<img id="dateImg" onclick="WdatePicker({el:'start_internship'})"
       						src="<%=path%>/js/My97DatePicker/skin/datePicker.gif"
      						 width="16" height="22" align="middle" >
					<label>：开始时间</label>
					<input type="text" name="end_internship" id="end_internship" value="${entity.end_internship}"/>
							<img id="dateImg" onclick="WdatePicker({el:'end_internship'})"
       						src="<%=path%>/js/My97DatePicker/skin/datePicker.gif"
      						 width="16" height="22" align="middle">
					<label>：结束时间</label>
				</td>
			</tr>
			<!-- 第二行 -->
			<tr  height="50px" >
				<td colspan="2" align="center">
					<label>姓名：</label>
					<select name="stuId" id="stuId" disabled="disabled" >
							<option value="">---请选择---</option>
						</select>
				</td>
				<td colspan="2" align="center">
					<label>项目经理：</label>
					<input type="text" name="project_manager" value="${entity.project_manager}"/>
				</td>
				<td colspan="2" align="center">
					<label>班主任：</label>
					<input type="text" name="headmaster" value="${entity.headmaster}"/>
				</td>
			</tr>
			<!-- 第三行 -->
			<tr>
				<td colspan="2"><label>考勤记录分数</label></td>
				<td colspan="4"><input type="text" size="110" name="attscore" value="${entity.attscore}" style="width: 99%"/> </td> 
			</tr>
			<!-- 第四行 项目完成情况评分 -->
			<tr >
				<td colspan="2" rowspan="2"><label>项目完成情况评分</label></td>
				<td ><label>美学基础</label></td>
				<td ><label>APP</label></td>
				<td ><label>网页设计</label></td>
				<td ><label>前端</label></td>
			</tr>
			<tr>
				<td><input type="text" size="24" name="aesthetic_basis1" value="${entity.aesthetic_basis1}" style="width: 98%"/></td>
				<td><input type="text" size="24" name="app1" value="${entity.app1}" style="width: 98%"/></td>
				<td><input type="text" size="21" name="web_Design1"  value="${entity.web_Design1}" style="width: 98%"/></td>
				<td><input type="text" size="21" name="front1"   value="${entity.front1}" style="width: 98%"/></td>
			</tr>
			<!-- 第五行 阶段考核成绩分数 -->
			<tr >
				<td colspan="2" rowspan="2"><label>阶段考核成绩分数</label></td>
				
				<td ><label>美学基础</label></td>
				<td ><label>APP</label></td>
				<td ><label>网页设计</label></td>
				<td ><label>前端</label></td>
			</tr>
			<tr>
				<td><input type="text" size="24" name="aesthetic_basis2" value="${entity.aesthetic_basis2}" style="width: 98%"/></td>
				<td><input type="text" size="24" name="app2"  value="${entity.app2}" style="width: 98%"/></td>
				<td><input type="text" size="21" name="web_Design2"  value="${entity.web_Design2}" style="width: 98%"/></td>
				<td><input type="text" size="21" name="front2" value="${entity.front2}" style="width: 98%"/></td>
			</tr>
			<!-- 第六行 综合素养评分 -->
			<tr >
				<td colspan="2" rowspan="2"><label>综合素养评分</label></td>
				
				<td ><label>语言表达能力</label></td>
				<td ><label>团队协作能力</label></td>
				<td ><label>时间管理</label></td>
				<td ><label>职业礼仪</label></td>
			</tr>
			<tr>
				<td><input type="text" size="24" name="expression_ability"   value="${entity.expression_ability}" style="width: 98%"/></td>
				<td><input type="text" size="24" name="cooperative"  value="${entity.cooperative}" style="width: 98%"/></td>
				<td><input type="text" size="21" name="timemanager"  value="${entity.timemanager}" style="width: 98%"/></td>
				<td><input type="text" size="21" name="protoco"  value="${entity.protoco}" style="width: 98%"/></td>
			</tr>
			<!-- 第七行 简历制作分数 -->
			<tr >
				<td colspan="2" rowspan="2"><label>简历制作分数</label></td>
				
				<td colspan="2"><label>人才网简历完整度</label></td>
				<td colspan="2"><label>作品完整度</label></td>
			</tr>
			<tr>
				<td colspan="2"><input type="text" size="54" name="resume"  value="${entity.resume}" style="width: 98%"/></td>
				<td colspan="2"><input type="text" size="49" name="production"  value="${entity.production}" style="width: 98%"/></td>
			</tr>
			<!-- 第八行 模拟面试分数 -->
			<tr >
				<td colspan="2" rowspan="2"><label>模拟面试分数</label></td>
				
				<td colspan="2" align="center"><label>第一次模拟面试</label></td>
				<td colspan="2" align="center"><label>第二次模拟面试</label></td>
			</tr>
			<tr>
				<td colspan="2" ><input type="text" size="54" name="firstsimulate"  value="${entity.firstsimulate}" style="width: 98%"/></td>
				<td colspan="2" ><input type="text" size="49" name="secondsimulate"  value="${entity.secondsimulate}" style="width: 98%"/></td>
			</tr>
			<!-- 第九行  总平均分-->
			<tr>
				<td colspan="2"><label>总平均分</label></td>
				<td colspan="4"><input type="text" size="110" name="average" value="${entity.average}" style="width: 98%"/></td>
			</tr>
			<!-- 第十行  项目经理推荐岗位-->
			<tr>
				<td colspan="2"><label>项目经理推荐岗位</label></td>
				<td colspan="4"><input type="text" size="110" name="positions" value="${entity.positions}" style="width: 98%"/></td>
			</tr>
			<!-- 第九行 项目经理结业点评-->
			<tr>
				<td colspan="2"><label>项目经理结业点评</label></td>
				<td colspan="4"><input type="text" size="110" name="comments" value="${entity.comments}" style="width: 98%"/></td>
			</tr>
			<!-- 备注栏 -->
			<tr>
				<td colspan="2"><label>备注(400字)</label></td>
				<td colspan="4"><textarea rows="5" cols="83" name="remark" style="width: 98%">${entity.remark }</textarea></td>
			</tr>
			<!-- 末端注意栏 -->
			<tr>
				<td colspan="4" rowspan="5">
				<label>
					以上各项分数均为100分制，以总平均分为标准评综合考核等级：
					优 85-100分
					良 70-85分
					中 60-70分
				</label>
				</td>
			</tr>
			<tr>
				<td>项目经理：</td>
				<td><input type="text" name="project_manager2" value="${entity.project_manager2}" style="width: 98%"/></td>
			</tr>
			<tr>
				<td>班主任：</td>
				<td><input type="text" name="headmaster2" value="${entity.headmaster2}" style="width: 98%"/></td>
			</tr>
			<tr>
				<td>学员：</td>
				<td><input type="text" name="xuename2" value="${entity.xuename2}" style="width: 98%"/></td>
			</tr>
			<tr>
				<td>日期</td>
				<td>
				<input type="text" name="filldate" id="filldate" value="${entity.filldate}" style="width: 80%"/>
						<img id="dateImg" onclick="WdatePicker({el:'filldate'})"
       						src="<%=path%>/js/My97DatePicker/skin/datePicker.gif"
      						 width="16" height="22" align="middle">
				</td>
			</tr>
			<!-- 提交栏 -->
			<tr >
				<td align="right" colspan="6">
					<input type="submit" value="保存"/>
					<input type="reset" value="重置"/>
				</td>
			</tr>
		</table>
	</fieldset>
</form>
</body>
</html>