<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.tengen.admin.entity.*" %>
<%@include file="../base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>部门注册</title>
<script type="text/javascript" src="<%=path%>/js/ajaxfileupload.js"></script>

<script type="text/javascript">
	$(function(){
		$("#Spboss").focus(function(){
			$("#showBossDiv").show();
		});
		
		$("#Spboss").keyup(function(){
			var _val = $(this).val();
			var url = "<%=path%>/dpartMrg?flag=queryusers&userName="+_val;
			var Timeid;
			window.clearTimeout(Timeid)
			Timeid=window.setTimeout(function(){sendAjax(url);},200);
		});
	});
		function sendAjax(url){
			$.getJSON(url,function(data){
				//在当前元素后面添加一个DIV图层
				$("#Spboss").siblings().remove();
				$("#Spboss").closest("td").append("<div id='showBossDiv'></div>");
				$("#showBossDiv").addClass("teacherDiv");
				$("#showBossDiv").mouseleave(function(){
					$(this).hide();		
				});
			
				var divWidth = $("#Spboss").outerWidth() - 4;
				$("#showBossDiv").css({"width":divWidth});
				$("#showBossDiv").append("<table width='100%'>");
				var _tab = $("#showBossDiv>table");
				for(var i in data)
				{
					for(var j in data[i])
					{
						_tab.append("<tr>");
						var _tr = _tab.find("tr:last");
						_tr.append("<td style='border-bottom:1px dashed rgba(0, 255, 231, 0.62)'>");
						_td = _tr.find("td:last");
						_td.append("<input type='radio' name='tcerId' value='"+data[i][j].userId+"'/> <span>");
						var _span = _td.find("span");
						_span.addClass("spanStyle");
						_span.append(data[i][j].userName);
						_span.append("-");
						_span.append(data[i][j].phone);
						
						_tr.hover(function(){
							$(this).css({"backgroundColor":"rgba(0, 255, 231, 0.62)"});
						},function(){
							$(this).css({"backgroundColor":""});
						});
					}
				}
				$("#showBossDiv").find(":radio").change(function(){
					var sVal = null;
					var sId = null;
					$.each($("#showBossDiv").find(":checked"),function(i,n){
						var _text = $(n).next().text();
						var _tcerId = n.value;
						
						if(sVal == null || sVal == "")
						{
							sVal = _text;
							sId = _tcerId;
						}
						$("#Spboss").val(sVal);
						$("#boss").val(sId);
					});
				});
				
			});
		}
	</script>
<script type="text/javascript">
function _init(){
	//恢复下拉列表
	var boss="${entity.boss}";
	if(boss!=null&&boss!=""){
	$("#boss").val(boss);
	}
	var Spboss="${Spboss}";
	if(Spboss!=null&&Spboss!=""){
		$("#Spboss").val(Spboss);			
	}
}
var xmlHttp;
function _validDpId(val)
{
	//创建一个请求对象
	xmlHttp =new XMLHttpRequest();
	//设置请求
	xmlHttp.open("POST","<%=path%>/dpartMrg?flag=valid&departName="+val,true);
	//设置回调函数
	xmlHttp.onreadystatechange = rollback;
	//发送请求
	xmlHttp.send(null);
}
function rollback(){
	//服务器返回完毕 而且正常返回
	if(xmlHttp.readyState==4 && xmlHttp.status==200)
	{
		if(xmlHttp.responseText==true || xmlHttp.responseText=="true")
		{
			document.getElementById("departNameMsg").innerHTML="部门名称可用";
		}
		else{
			document.getElementById("departNameMsg").innerHTML="部门已存在";
		}
	}
}

function _Reset(val)
{
	document.getElementById(val).innerHTML="";
	}

function _onSub(){
	var departName=document.getElementById("departName").value;
	if(departName==null||departName=="")
	{
		document.getElementById("departNameMsg").innerHTML="<a style='color:red'>部门名称不能为空</a>";
		return false;
	}
	return true;
}
</script>
</head>
<body onload="_init()">
	<form action="<%=path%>/dpartMrg" onsubmit="return _onSub()">
	<input type="hidden" name="boss" id="boss"/>
	<input type="hidden" name="flag" value="save"/>
	<fieldset>
	<legend>添加部门信息</legend>
	<center>${msg}</center>
	<table border="1" align="center" cellspacing="0" cellpadding="0">
       <tr>
       <th>部门名称:</th>
       <td>
       <input type="hidden" name="status" id="status" value="0"/>
       <input type="text" name="departName" id="departName" onchange="_validDpId(this.value)" onfocus="_Reset('departNameMsg')" value="${entity.departName}"/>
       <span id="departNameMsg"></span>
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
       <input type="text" name="createTime" id="createTime" value="${entity.createTime}" checked="checked"/> 
       <img id="dateImg" onclick="WdatePicker({el:'createTime'})"
       src="<%=path%>/js/My97DatePicker/skin/datePicker.gif"
       width="16" height="22" align="absmiddle">
       </td>
       </tr>
        <tr>
       <th>部门经理:</th>
		<td>
			<input type="text" name="Spboss" id="Spboss" autocomplete="off"/>
		</td>
       </tr>
       <tr>
        <th>创建人:</th>
        <td>
        <input type="text" name="createUser" id="createUser" value="${userInfo.userNo}" readonly="readonly"/>
        </td>
       </tr>
       <tr>
          <td colspan="2" align="center">
          <input type="submit" value="保存">
          <input type="reset" value="重置">
          </td>
       </tr>
   </table>
	</fieldset>
	</form>
</body>
</html>