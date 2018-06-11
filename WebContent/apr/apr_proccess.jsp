<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>处理假条</title>
<style>
body{
background-color:#494E6B;
color:#fff;
}</style>
<%
	String path = request.getContextPath();
	String name = "ABC";
	String id = "2016000000";
	String note = "不想上课了jdsfjsadhjashdjahjdakshfasfsaf";
%>
</head>
<body>
<h1><center><%=name %>的假条</center></h1>
<form name="proc" method="post" action=""><!-- action替换为处理数据的类，并重定向到学生请假记录页面 -->
<center>
	<table style="border:2px solid #fff;width:60%;height:150px;">
	<tr><td>学生ID：</td><td><%=id %></td></tr>
	<tr><td colspan="2">学生请假备注：</td></tr>
	<tr ><td colspan="2" rowspan="3" ><%=note %></td></tr>
	</table><table style="border:2px solid #fff;width:60%;"">
	<tr><td>你是否批准？</td><td><input type="radio" name="aprp" value="1">是&nbsp&nbsp&nbsp<input type="radio" name="aprp" value="2">否</td></tr>
	<tr><td colspan="2">你的备注(可以不填)</td></tr>
	<tr><td colspan="2"><TEXTAREA name="detail"  rows="2" cols="20" onpropertychange="if(this.value.length>200) {this.value=value.substr(0,200);alert('描述最多200个字符!');}" style="width:100%;height:100px;"></TEXTAREA></td></tr>
	<tr><td colspan="2">200个字符以内</td></tr>
	</table>
	<input type="reset"  value="重填" style="border:0;background-color:gray;width:30%;"><input type="submit"  value="提交" onclick="return check();" style="border:0;background-color:green;width:30%;">
	</center>
</form>
<a href="<%=path %>/apr/apr_stulist.jsp" style="color:#fff;">返回</a>
</body>
<script language="JavaScript">
function check(){
	if(proc.aprp.value!=1&&proc.aprp.value!=2){
		alert("请选择是否批准。");
		proc.aprp.focus();
		return false;
	}
	return true;
}
</script>
</html>