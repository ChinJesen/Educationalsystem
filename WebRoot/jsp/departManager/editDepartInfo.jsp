<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.tengen.admin.entity.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="../base.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>部门修改页面</title>
<script type="text/javascript" src="<%=path%>/js/ajaxfileupload.js"></script>

<script type="text/javascript">
function _init(){
	//恢复下拉列表
	var boss="${entity.boss}";
	if(boss!=null&&boss!=""){
	$("#boss").val(boss);
	}
}
</script>

</head>
<body onload="_init()">
<form action="<%=path%>/dpartMrg">
	<input type="hidden" name="flag" value="modify">
	<fieldset style="background:#D2D8DA">
	<legend>修改部门信息</legend>
	<center>${msg}</center>
	<table width="60%" border="1" align="center">
       <tr>
       <th>部门名称:</th>
       <td>
       <input type="hidden" name="departId" value="${entity.departId}">
       <input type="text" name="departName" id="departName" readonly="readonly" value="${entity.departName}"/>
       <span id="userNoMsg"></span>
       </td>
       </tr>
        <tr>
        <th>部门简介:</th>
        <td>
        <textarea rows="5" cols="30" name="remark">${entity.remark}</textarea>
        </td>
       </tr>
      <tr>
       <th>创建时间:</th>
       <td>
       <input type="text" name="createTime" id="createTime" readonly="readonly" value="${entity.createTime}" checked="checked"/> 
       <img id="dateImg" onclick="WdatePicker({el:'createTime'})"
       src="<%=path%>/js/My97DatePicker/skin/datePicker.gif"
       width="16" height="22" align="absmiddle">
       </td>
       </tr>
       <tr>
       <th>部门经理:</th>
       <td>
        <select name="boss" id="boss">
      	<option value="">--请选择--</option>
     	 <c:forEach items="${userMap}" var="u">
     	 <option value="${u.key}">${u.value}</option>
     	 </c:forEach>
     	 </select>
        </td>
       </tr>
       <tr>
        <th>创建人:</th>
        <td>
        <input type="text" name="createUser" id="createUser" value="${entity.createUser}" readonly="readonly"/>
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