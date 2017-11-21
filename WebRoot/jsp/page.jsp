<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
	function _page(num)
	{
		var _pageSize = document.getElementById("pageSize").value;
		_pageSize = parseInt(_pageSize) + parseInt(num);
		if(_pageSize>0 && _pageSize <= parseInt('${pageUtil.pageSizeSum}'))
		{
			document.getElementById("pageSize").value = _pageSize;
			window.document.forms[0].submit();
		}
	}
	
	function _cgPage(num)
	{
		document.getElementById("pageSize").value = 1;
		window.document.forms[0].submit();
	}
</script>

<body>
<table width="100%" align="center" border="0">
<tr>
	<td colspan="10" align="center">
	总条数[${pageUtil.pageNumSum}],总页数[${pageUtil.pageSizeSum}],当前页数[${pageUtil.pageSize}]
	<input type="hidden" name="pageSize" id="pageSize" value="${pageUtil.pageSize}"/>
	<input type="button" value="上一页" onclick="_page(-1)"/>
	<input type="button" value="下一页" onclick="_page(1)"/>
		<select name="pageNum" id="pageNum" onchange="_cgPage(this.value)">
		  <option value="5">5</option>
		  <option value="10">10</option>
		  <option value="20">20</option>
		  <option value="50">50</option>
		</select>
	</td>
</tr>
</table>

</body>
<script  type="text/javascript">
$(function(){
	var _pageSize = "${pageUtil.pageSize}";
	if(_pageSize != null && _pageSize != "")
	{
		$("#pageSize").val(_pageSize);
	}
	
	var _pageNum = "${pageUtil.pageNum}";
	if(_pageNum != null && _pageNum != "")
	{
		$("#pageNum").val(_pageNum);
	}
});
</script>