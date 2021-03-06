<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.tengen.jiaowu.entity.*"%>
<%@include file="../base.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改页面</title>
<script type="text/javascript">
function _init(){
	var status = "${entity.status}";
	//恢复单选项
	if(status != null && status != "")
	{
		if($("#statusA").val() == status)
			$("#statusA").attr("checked","checked");
		else
			$("#statusB").attr("checked","checked");
	}
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
<script>
		$(function(){
			$("#documentFile").change(function(){
				$.ajaxFileUpload({
					url:"<%=path%>/ivMrg?flag=ajaxfileupload",
					secureuri:false,
					/* 获取id */
					fileElementId:"documentFile",
					dataType:'json',
					/* 回掉函数 */
					success:function(data,status){
						$("#documentImg").attr("src","<%=path%>/ivMrg?flag=ajaxFileDownload&fileName="+data.filePath);
						$("#document").val(data.filePath);
					}
				});
			});
		});
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
<body onload="_init()">
<form action="<%=path%>/ivMrg" method="get">
 <input type="hidden" name="flag" value="modify">
 <fieldset>
    <legend>修改访谈信息</legend>
    <center>${msg}</center>
    <table border="1" align="center" width="80%" bgcolor="#70dbdb">
           
           <tr>
			   <th>班级</th>
			   <td>
			      <input type="hidden" name="ivId" value="${entity.ivId}"/>
			      <input type="hidden" name="status" id="status" value="0"/>
			      <select name="classId" id="classId">
			      <option value="">--请选择--</option>
			      <c:forEach items="${classMap}" var="c">
			      <option value="${c.key}">${c.value}</option>
			      </c:forEach>
			      </select>
			 	</td>
			 	<td rowspan="3" width="200px">
                 <img src="" id="documentImg" style="width:100px;height:100px;">
                </td>
	       	</tr>
				<tr>
					<th>姓名</th>
					<td>
						<select name="stuId" id="stuId" disabled="disabled">
							<option value="">——请选择——</option>
						</select>
					</td>
				</tr>
		    <tr>
		    <tr>
		       <th>性别:</th>
		       <td>
		       <input type="radio" name="ivSex" id="ivSexA" value="男" checked="checked"/> <label for="ivSexA" style="cursor:pointer">男</label>
		       <input type="radio" name="ivSex" id="ivSexB" value="女"/><label for="ivSexB" style="cursor:pointer">女</label> 
		       </td>
           </tr>
			
			<tr>
				<th>日期</th>
				<td>
		      <input type="text" name="ivTime" id="ivTime" value="${entity.ivTime}"/>
			  <img id="dateImg" onclick="WdatePicker({el:'ivTime'})" 
			src="<%=path%>/js/My97DatePicker/skin/datePicker.gif" 
			width="16" height="22">
			</td>
			</tr>
			<tr>
				<th>访谈内容</th>
				<td>
					<textarea rows="3" cols="30" name="ivInformation">${entity.ivInformation}</textarea>
				</td>
			</tr>
			<tr>
	       <th>是否跟进</th>
		       <td>
		       <input type="radio" name="ivFollow" id="ivFollowA" value="是" checked="checked"/> 是
		       <input type="radio" name="ivFollow" id="ivFollowB" value="否"/> 否
		       </td>
           </tr>
			<tr>
		      <th>上传媒体文件</th>
		      <td>
		      <input type="hidden" name="document" id="document" />
		      <input type="file" name="documentFile" id="documentFile" />
		      </td>
           </tr>
			<tr>
				<th>备注</th>
				<td>
					<textarea rows="3" cols="30" name="remark">${entity.remark}</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="修改访谈记录"/>
					<input type="button" value="访谈文件"/>
				</td>
			</tr>
    </table>
    </fieldset>
    </form>
</body>
</html>