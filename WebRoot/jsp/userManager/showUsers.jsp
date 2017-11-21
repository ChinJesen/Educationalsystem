<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.tengen.admin.entity.*,java.util.*"%>
<%@include file="../base.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户查询页面</title>
<script type="text/javascript">
	function _modify(userId)
	{
		window.location.href = "<%=path%>/usMrg?flag=queryById&id="+userId;	
	}
	function _delete(userId)
	{
		if(window.confirm("确认删除？"))
		{
			window.location.href = "<%=path%>/usMrg?flag=delete&id="+userId;	
		}
	}
</script>
<script>
function _init(){
	var departId="${entity.departId}";
	if(departId!=null&&departId!=""){
	$("#departId").val(departId);
	}
}
</script>
<link rel="stylesheet" type="text/css" href="<%=path%>/css/commStyle.css"/>
</head>
<body onload="_init()">
<form action="<%=path%>/usMrg" >
<input type="hidden" name="flag" value="queryAll">
			<fieldset>
			<legend>查询条件</legend>
			<table width="100%" align="center" border="1">
			<tr>
			<th>账户</th>
			<td>
			<input type="text" name="userNo" value="${entity.userNo}"/>
			</td>
			<th>姓名</th>
			<td>
			<input type="text" name="userName" value="${entity.userName}"/>
			</td>
	        <td>
			<input type="submit" value="查询"/>
			</td>
	       </tr>
	       <tr>
	       <th>身份证号:</th>
			<td>
			<input type="text" name="id_Card" value="${entity.id_Card}"/>
			</td>
	        <th>联系电话:</th>
			<td>
			<input type="text" name="phone" value="${entity.phone}"/>
			</td>
	       </tr>
	       <tr>
	       <th>所属部门:</th>
	        <td>
	        <select name="departId" id="departId">
	      	<option value="">--请选择--</option>
	     	 <c:forEach items="${departMap}" var="d">
	     	 <option value="${d.key}">${d.value}</option>
	     	 </c:forEach>
	     	 </select>
	        </td>
	       </tr>
			</table>
			</fieldset>
	<fieldset>
		<legend>查询结果</legend>
		<table width="100%" align="center" border="1">
			<tr >
				<th>序号</th>
				<th>账户</th>
				<th>姓名</th>
				<th>年龄</th>
				<th>性别</th>
				<th>联系电话</th>
				<th>生日</th>
				<th>家庭地址</th>
				<th>身份证号</th>
				<th>籍贯</th>
				<th>部门</th>
				<th>角色</th>
				<th>操作</th>
			</tr>
			<c:forEach items="${pageUtil.list}" var="userInfo" varStatus="v">
			<c:if test="${v.count%2==0}">
			<tr style="background-color: aquamarine">
			</c:if>
			<c:if test="${v.count%2!=0}">
			<tr>
			</c:if>
			<td>${v.count}</td>
			<td>${userInfo.userNo}</td>
			<td>${userInfo.userName}</td>
			<td>${userInfo.userAge}</td>
			<td>${userInfo.userSex eq "0"?"男":"女"}</td>
			<td>${userInfo.phone}</td>
			<td>${userInfo.birthDay}</td>
			<td>${userInfo.userFamily}</td>
			<td>${userInfo.id_Card}</td>
			<td>
			<c:forEach items="${test['JG']}" var="one">
    			<c:if test="${one.key eq userInfo.userNative}">
    			${one.value}
    			</c:if>
    			</c:forEach>
    		</td>
     		 
			<td>${departMap[userInfo.departId]}</td>
			<td>${roleMap[userInfo.roleId]}</td>
			<td>
			<input type="button" value="修改" onclick="_modify('${userInfo.userId}')"/>
			<input type="button" value="删除" onclick="_delete('${userInfo.userId}')"/>
			</td>
			</tr>
			</c:forEach>
		</table>
		<jsp:include page="../page.jsp"></jsp:include>
	</fieldset>
	</form>
</body>
</html>