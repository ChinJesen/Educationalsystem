<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.tengen.admin.entity.*,java.util.*"%>
<%@include file="../base.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>部门查询页面</title>
<script type="text/javascript" src="<%=path%>/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="<%=path%>/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	function _modify(departId)
	{
		window.location.href = "<%=path%>/dpartMrg?flag=queryById&id="+departId;	
	}
	function _delete(departId)
	{
		if(window.confirm("确认删除？"))
		{
			window.location.href = "<%=path%>/dpartMrg?flag=delete&id="+departId;	
		}
	}
</script>
<link rel="stylesheet" type="text/css" href="<%=path%>/css/commStyle.css"/>
</head>
<body>
<form action="<%=path%>/dpartMrg" >
<input type="hidden" name="flag" value="queryAll">
			<fieldset>
			<legend>查询条件</legend>
			<table width="100%" align="center" border="1">
			<tr>
			<th>部门名称:</th>
			<td>
			<input type="text" name="departName" value="${entity.userName}"/>
			</td>
			<th>创建时间</th>
			<td>
				<input type="text" name="createTime" id="createTime" value="${entity.startTime}">
				<img id="dateImg" onclick="WdatePicker({el:'createTime'})" 
				src="<%=path%>/js/My97DatePicker/skin/datePicker.gif" 
				width="16" height="22"  align="absmiddle">
			</td>
	        <td>
			<input type="submit" value="查询"/>
			</td>
	       </tr>
			</table>
			</fieldset>
	<fieldset>
		<legend>查询结果</legend>
		<table width="100%" align="center" border="1">
			<tr >
				<th>序号</th>
				<th>部门名称</th>
				<th>部门简介</th>
				<th>创建时间</th>
				<th>部门经理</th>
				<th>创建人</th>
				<th>状态</th>
				<th>操作</th>
			</tr>
			<c:forEach items="${pageUtil.list}" var="departInfo" varStatus="v">
			<c:if test="${v.count%2==0}">
			<tr style="background-color: aquamarine">
			</c:if>
			<c:if test="${v.count%2!=0}">
			<tr>
			</c:if>
			<td>${v.count}</td>
			<td>${departInfo.departName}</td>
			<td>${departInfo.remark}</td>
			<td>${departInfo.createTime}</td>
			<td>${userMap[departInfo.boss]}</td>
			<td>${departInfo.createUser}</td>
			<td>${userInfo.status}</td>
			<td>
			<input type="button" value="修改" onclick="_modify('${departInfo.departId}')"/>
			<input type="button" value="删除" onclick="_delete('${departInfo.departId}')"/>
			</td>
			</tr>
			</c:forEach>
		</table>
		<jsp:include page="../page.jsp"></jsp:include>
	</fieldset>
	</form>
</body>
</html>