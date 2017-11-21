<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../base.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查询违纪信息</title>
<script type="text/javascript">
   function _modify(dpId)
   {
	   window.location.href="<%=path%>/dpMrg?flag=queryById&id="+dpId;   
   }
   function _delete(dpId)
   {
	   if(window.confirm("确认删除？"))
		{
		   window.location.href="<%=path%>/dpMrg?flag=delete&id="+dpId; 	
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
<body>
    <form action="<%=path%>/dpMrg" method="get">
	<input type="hidden" name="flag" value="queryAll"/>
	<fieldset>
			<legend>查询条件</legend>
			<table width="100%" align="center" border="1">
				<tr>
					<th>班级</th>
			        <td>
			        <input type="hidden" name="adId" value="${entity.adId}"/>
			        <input type="hidden" name="status" id="status" value="0"/>
			        <select name="classId" id="classId">
				      <option value="">--请选择--</option>
				      <c:forEach items="${classMap}" var="c">
				      <option value="${c.key}">${c.value}</option>
				      </c:forEach>
			       </select>
			        </td>
	       	
					<th>姓名</th>
					<td>
						<select name="stuId" id="stuId" disabled="disabled">
							<option value="">--请选择--</option>
						</select>
					</td>
					<th>日期</th>
					<td>
						<input type="text" name="dpTime" id="dpTime" value="${entity.dpTime}">
						<img id="dateImg" onclick="WdatePicker({el:'dpTime'})" 
						src="<%=path%>/js/My97DatePicker/skin/datePicker.gif" 
						width="16" height="22" >
					</td>
				     <td rowspan="1">
						<input type="submit" value="查询"/>
					</td>
				</tr>
			</table>
		</fieldset>
	<fieldset>
		<legend>查询违纪信息</legend>
		<table border="1" width="70%" align="center">
			<tr>
				<th>序号</th>
				<th>班级</th>
				<th>姓名</th>
				<th>日期</th>	
				<th>违纪事件</th>
				<th>处分</th>	
				<th>备注</th>			
				<th>操作</th>
			</tr>
			<c:forEach items="${pageUtil.list}" var="dpInfo" varStatus="_v">
				<tr>
					<td>${_v.count}</td>
					<td>
			        <c:forEach items="${classMap}" var="c">
  			        <c:if test="${c.key eq dpInfo.classId}">
  			          ${c.value}
  			        </c:if>
  			        </c:forEach>
			        </td>
			        <td>
				    <c:forEach items="${stuNameMap}" var="c">
			        <c:if test="${c.key eq dpInfo.stuId}">
			          ${c.value}
			        </c:if>
			        </c:forEach>
			        </td>
					<td>${dpInfo.dpTime}</td>
					<td>${dpInfo.dpEvent}</td>
					<td>${dpInfo.dpSanction}</td>
					<td>${dpInfo.remark}</td>
					<td align="center">
						<input type="button" value="删除" onclick="_delete('${dpInfo.dpId}')"/>
						<input type="button" value="修改" onclick="_modify('${dpInfo.dpId}')"/>
					</td>
				</tr>
			</c:forEach>
		</table>		
		<jsp:include page="../page.jsp"></jsp:include>
	</fieldset>
	</form>
</body>
</html>