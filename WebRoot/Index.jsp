<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.tengen.admin.entity.*" %>
<%@include file="jsp/base.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<title>教务系统Login</title>

<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>

<script type="text/javascript">
var xmlHttp;
var validFlag = false;
function _onValid(val)
{
	xmlHttp = new XMLHttpRequest();
	xmlHttp.open("POST", "<%=path%>/validMrg?vCode="+val, true);
	xmlHttp.onreadystatechange = _rollBack;
	xmlHttp.send(null);
}
	function _rollBack()
	{
		//服务器返回完毕 而且正常返回
		if(xmlHttp.readyState == 4 && xmlHttp.status == 200)
		{
			var content = xmlHttp.responseText;
			if(content == "true"  || content == true)
			{
				document.getElementById("valid").innerHTML="验证成功";
				validFlag = true;
			}
			else
			{
				document.getElementById("valid").innerHTML="验证失败";
				validFlag = false;
			}
		}
	}
	
	function _onUserNo(val)
	{
		var UserNo=document.getElementById("userno").value;
		
	}
	
	function _onCgValid()
	{
		
		document.getElementById("validImg").src="<%=path%>/validMrg?"+Math.random();
	}
	function _Reset(val)
	{
		document.getElementById(val).innerHTML="";
	}
	
	function _onUserNo()
	{
		var UserNo=document.getElementById("userno").value;
		if(UserNo==null||UserNo=="")
		{
			document.getElementById("usernoMsg").innerHTML="<a style='color:red'>用户名不能为空</a>";
		}
	}
	
	function _onUserPass()
	{
		var UserPass=document.getElementById("password").value;
		if(UserPass==null||UserPass=="")
		{
			document.getElementById("passwordMsg").innerHTML="<a style='color:red'>密码不能为空</a>";
		}
	}
	
	function _onUserValid()
	{
		var UserValid=document.getElementById("userValid").value;
		if(UserValid==null||UserValid=="")
		{
			document.getElementById("valid").innerHTML="<a style='color:red'>验证码不能为空</a>";
		}
	}
	
	function _onSub()
	{	
		var UserNo=document.getElementById("userno").value;
		if(UserNo==null||UserNo=="")
		{
			document.getElementById("usernoMsg").innerHTML="<a style='color:red'>用户名不能为空</a>";
			return false;
		}
		var UserPass=document.getElementById("password").value;
		if(UserPass==null||UserPass=="")
		{
			document.getElementById("passwordMsg").innerHTML="<a style='color:red'>密码不能为空</a>";
			return false;
		}
		var UserValid=document.getElementById("userValid").value;
		if(UserValid==null||UserValid=="")
		{
			document.getElementById("valid").innerHTML="<a style='color:red'>验证码不能为空</a>";
			return false;
		}
		if(!validFlag)
		{
			return false;
		}
		return true;
	}
</script>
</head>
<body onLoad="sendRequest()" >


<div class="videozz"></div>
	<video  autoplay muted loop poster="images/fallba1ck.jpg">
		<source src="images/mov.mp4">		
		你的游览器不支持video支持
	</video>
    
<div class="box">
	<div class="box-a">
    <div class="m-2">
          <div class="m-2-1">
            <form action="<%=path%>/usMrg" method="post" onsubmit="return _onSub()">
               <input type="hidden" name="flag" value="login">
                <div class="m-2-2">
				   <input type="text" placeholder="请输入账号" name="userno" id="userno" onblur="_onUserNo()" onfocus="_Reset('usernoMsg')"/>
				   <span id="usernoMsg"></span>
				</div>
                <div class="m-2-2">
				   <input type="password" placeholder="请输入密码" name="password" id="password" onblur="_onUserPass()" onfocus="_Reset('passwordMsg')"/>
				   <span id="passwordMsg"></span>
                </div>
                <div class="m-2-2-1">
                    <input type="text" placeholder="请输入验证码" name="userValid" id="userValid" onblur="_onUserValid()" onchange="_onValid(this.value)"/>
					<img id="validImg" src="<%=path%>/validMrg" onclick="_onCgValid()"></img>
					<span id="valid"></span>
                </div>
                <div class="m-2-2">
                   <button type="submit" value="登录" /> 登录
				   <button type="reset" value="重置"/> 重置
                  
                </div>
                    
            </form>
          </div>
    </div>
    <div class="m-5"> 
    <div id="m-5-id-1"> 
    <div id="m-5-2"> 
    <div id="m-5-id-2">  
    </div> 
    <div id="m-5-id-3"></div> 
    </div> 
    </div> 
    </div>   
    <div class="m-10"></div>
    <div class="m-xz7"></div>
    <div class="m-xz8 xzleft"></div>
    <div class="m-xz9"></div>
    <div class="m-xz9-1"></div>
    <!-- <div class="m-x10"></div>
    <div class="m-x11"></div>
    <div class="m-x12 xzleft"></div>
    <div class="m-x13"></div>
    <div class="m-x14 xzleft"></div>
    <div class="m-x15"></div>
    <div class="m-x16 xzleft"></div>-->
    <div class="m-x17 xzleft"></div>
    <div class="m-x18"></div>
    <div class="m-x19 xzleft"></div>
    <div class="m-x20"></div>  
    <div class="m-8"></div>
    <div class="m-9"><div class="masked1" id="sx8">教务系统Login</div></div> 
    <div class="m-11">
    	<div class="m-k-1"><div class="t1"></div></div>
        <div class="m-k-2"><div class="t2"></div></div>
        <div class="m-k-3"><div class="t3"></div></div>
        <div class="m-k-4"><div class="t4"></div></div>
        <div class="m-k-5"><div class="t5"></div></div>
        <div class="m-k-6"><div class="t6"></div></div>
        <div class="m-k-7"><div class="t7"></div></div>
    </div>   
    <div class="m-14"><div class="ss"></div></div>
    <div class="m-15-a">
    <div class="m-15-k">
    	<div class="m-15xz1">
            <div class="m-15-dd2"></div>
        </div>
    </div>
    </div>
    <div class="m-16"></div>
    <div class="m-17"></div>
    <div class="m-18 xzleft"></div>
    <div class="m-19"></div>
    <div class="m-20 xzleft"></div>
    <div class="m-21"></div>
    <div class="m-22"></div>
    <div class="m-23 xzleft"></div>
    <div class="m-24" id="localtime"></div>
    </div>
</div>
<script src="js/common.min.js"></script>
<div style="text-align:center;">
</div>
</body>
</html>
