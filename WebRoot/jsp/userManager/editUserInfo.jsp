<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.tengen.admin.entity.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="../base.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户修改页面</title>
<script type="text/javascript" src="<%=path%>/js/ajaxfileupload.js"></script>
<script type="text/javascript">
function _init(){
	//恢复单选项
	var sex="${entity.userSex}";
	if(sex!=""&&sex!=null){
		if($("#userSexA").val()==sex){
			$("#userSexA").attr("checked","checked");
		}else{
			$("#userSexB").attr("checked","checked");
		}
	}
	//恢复下拉列表
	var userNative="${entity.userNative}";
	if(userNative!=null&&userNative!=""){
	$("#userNative").val(userNative);
	}
	var roleId="${entity.roleId}";
	if(roleId!=null&&roleId!=""){
	$("#roleId").val(roleId);
	}
	var departId="${entity.departId}";
	if(departId!=null&&departId!=""){
	$("#departId").val(departId);
	}
}
</script>
</head>
<body onload="_init()">
<form action="<%=path%>/usMrg">
	<input type="hidden" name="flag" value="modify">
	<fieldset>
	<legend>修改用户信息</legend>
	<center>${msg}</center>
	<table width="60%" border="1" align="center">
       <tr>
       	<th>账户:</th>
	   		<td>
		   		<input type="hidden" name="status" value="0"/>
		    	<input type="hidden" name="userId" value="${entity.userId}"/>
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
       <input type="text" name="userName" id="userName" value="${entity.userName}"/>
       </td>
       </tr>
       <tr>
        <th>年龄:</th>
        <td>
        <input type="text" name="userAge" id="userAge" value="${entity.userAge}"/>
        </td>
       </tr>
        <tr>
       <th>性别:</th>
       <td>
       <input type="radio" name="userSex" id="userSexA" value="0" checked="checked"/> <label for="userSexA" style="cursor:pointer">男</label>
       <input type="radio" name="userSex" id="userSexB" value="1"/><label for="userSexB" style="cursor:pointer">女</label> 
       </td>
       </tr>
       <tr>
       <th>联系电话:</th>
       <td>
      <input type="text" name="phone" id="phone" value="${entity.phone}"/>
       </td>
       </tr>
       <tr>
       <th>出生日期:</th>
       <td>
       <input type="text" name="birthDay" id="birthDay" value="${entity.birthDay}" checked="checked"/> 
       <img id="dateImg" onclick="WdatePicker({el:'birthDay'})"
       src="<%=path%>/js/My97DatePicker/skin/datePicker.gif"
       width="16" height="22" align="absmiddle">
       </td>
       </tr>
       <tr>
        <th>家庭住址: </th>
        <td>
        <input type="text" name="userFamily" id="userFamily" value="${entity.userFamily}"/>
        </td>
       </tr>
       <tr>
        <th>身份证号: </th>
        <td>
        <input type="text" name="id_Card" id="id_Card" value="${entity.id_Card}"/>
        </td>
       </tr>
       <tr>
        <th>籍贯:</th>
        <td>
        <select name="userNative" id="userNative">
      <option value="">--请选择--</option>
      <c:forEach items="${test['JG']}" var="one">
      <option value="${one.key}">${one.value}</option>
      </c:forEach>
      </select>
        </td>
       </tr>
       <tr>
       <th>部门:</th>
        <td>
        <select name="departId" id="departId">
      	<option value="">--请选择--</option>
     	 <c:forEach items="${departMap}" var="d">
     	 <option value="${d.key}">${d.value}</option>
     	 </c:forEach>
     	 </select>
        </td>
       </tr>
       <tr>
        <th>角色:</th>
        <td>
        <select name="roleId" id="roleId">
      <option value="">--请选择--</option>
      <c:forEach items="${roleMap}" var="r">
      <option value="${r.key}">${r.value}</option>
      </c:forEach>
      </select>
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