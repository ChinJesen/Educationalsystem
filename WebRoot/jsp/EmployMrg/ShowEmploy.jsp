<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include  file="../base.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function _modify(serial)
	{
		window.location.href="<%=path%>/EnMrg?flag=queryById&id="+serial;
	}
	function _del(serial)
	{
		if(window.confirm("确认删除？"))
		{
		window.location.href="<%=path%>/EnMrg?flag=delete&id="+serial;
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
<script type="text/javascript">
//恢复提交后的班级和学生
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
	<form action="<%=path%>/EnMrg">
		<input type="hidden" name="flag" value="queryAll"/>
		<fieldset>
			<legend>查询条件</legend>
			<table>
				<tr>
			        <th>班级</th>
			        <td>
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
					<td><input type="submit" value="查询"/></td>
				</tr>
			</table>
		</fieldset>
		<fieldset>
			<legend>学业信息查询结果</legend>
			<table width="100%" align="center" border="1">
				<tr>
				
					<th>班级</th>
					<th>姓名</th>
					<th>性别</th>
					<th>学历</th>
					<th>之前专业</th>
					<th>毕业大学</th>
					<th>教员推荐岗位</th>
					<th>班上学习情况</th>
					<th>现住址</th>
					<th>就业单位</th>
					<th>就业岗位</th>
					<th>试用期工资</th>
					<th>转正工资</th>
					<th>推荐人</th>
					<th>单位联系人</th>
					<th>就业回访</th>
					<th>备注</th>
					<th>操作</th>
				</tr>
				<c:forEach items="${pageUtil.list}" var="EnInfo" varStatus="_E">
					<tr>
						<td>
			  				 <c:forEach items="${classMap}" var="c">
  			     	  			<c:if test="${c.key eq EnInfo.classId}">
  			         		 		${c.value}
  			      	 			</c:if>
  			      			 </c:forEach>
						</td>
						<td>
							<c:forEach items="${stuNameMap}" var="c">
								<c:if test="${c.key eq EnInfo.stuId}">
									${c.value}
								</c:if>
							</c:forEach>
						</td>
						<td>${EnInfo.sex eq '0'?'男':'女'}</td>
						<td>${EnInfo.eduction}</td>
						<td>${EnInfo.major}</td>
						<td>${EnInfo.university}</td>
						<td>${EnInfo.workacade_infoemploy_info}</td>
						<td>${EnInfo.study_station}</td>
						<td>${EnInfo.address}</td>
						<td>${EnInfo.company}</td>
						<td>${EnInfo.station}</td>
						<td>${EnInfo.period_salary}</td>
						<td>${EnInfo.salary1}</td>
						<td>${EnInfo.referrer}</td>
						<td>${EnInfo.unit_linkman}</td>
						<td>${EnInfo.job_visit}</td>
						<td>${EnInfo.remark}</td>
						<td>
						<input type="button" value="详情" onclick="_modify('${EnInfo.serial}')"  style="width: 98%"/>
						<input type="button" value="删除" onclick="_del('${EnInfo.serial}')" style="width: 98%"/>
						</td>
					</tr>
				</c:forEach>
			</table>
			<jsp:include page="../page.jsp"></jsp:include>
		</fieldset>
	</form>
</body>
</html>