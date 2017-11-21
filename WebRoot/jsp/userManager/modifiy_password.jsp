<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.tengen.admin.entity.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="../base.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>密码修改页面</title>
</head>
<body>
<form action="<%=path%>/usMrg">
	<input type="hidden" name="flag" value="modify">
	<fieldset>
	<legend>修改用户密码</legend>
	<center>${msg}</center>
	<table width="60%" border="1" align="center">
       <tr>
       <th>账户:</th>
       <td>
       <input type="hidden" name="userId" readonly="readonly" value="${entity.userId}">
       <input type="text" name="userNo" id="userNo" readonly="readonly" value="${entity.userNo}"/>
       <span id="userNoMsg"></span>
       </td>
       </tr>
       <tr>
        <th>密码:</th>
        <td>
        <input type="password" name="userPass" id="userPass" value="${entity.userPass}"/>
        <span id="userPwdMsg"></span>
        </td>
       </tr>
        <tr>
       <th>姓名:</th>
       <td>
       <input type="text" name="userName" id="userName" value="${entity.userName}" readonly="readonly"/>
       </td>
       </tr>  
       <tr>
          <td colspan="2">
          <input type="submit" value="修改">
          <input type="reset" value="重置">
          </td>
       </tr>
   </table>
	</fieldset>
	</form>
</body>
</html>