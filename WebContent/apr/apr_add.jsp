<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
body{
background-color:#985E6D;
color:#fff;
}
</style>
<%
	String uid = session.getAttribute("uid").toString();
	String user_id = "2016000000";
	String aprfrom = "梁淑贞";
%>
<title>申请请假</title>
</head>
<body>
<h1>&nbsp&nbsp&nbsp&nbsp&nbsp创建一个新的假条</h1>
	<form name="addaprfrm" method="post" action=""><!-- action替换成处理的类  -->
	<table style="margin-left:10%;">
		<tr><td>你的ID：</td><td><u><%=user_id %></u></td></tr>
		<%if(uid.equals("1")){ %>
		<tr><td>校方领导：</td><td><%=aprfrom %></td></tr>
		<%}else{ %>
		<tr><td>辅导员：</td><td><%=aprfrom %></td></tr>
		<%} %>
	</table><center>
	<table style="border:2px solid #fff;width:85%;height:150px;">
	<tr><td align="center" style="height:25px;">请假理由：</td></tr>
	<tr><td colspan="2"><TEXTAREA name="detail"  rows="2" cols="20" onpropertychange="if(this.value.length>500) {this.value=value.substr(0,500);alert('描述最多500个字符!');}" style="width:100%;height:100px;"></TEXTAREA></td></tr>
	</table>
	<input type="reset"  value="重填" style="border:0;background-color:gray;width:30%;">
	<input type="submit"  value="提交" onclick="return check();" style="border:0;background-color:pink;width:30%;">
	</center>
	</form>
</body>
<script language="JavaScript">
function check(){
	if(addaprfrm.detail.value.length==0){
		alert("请将你的请假信息填写完整。");
		addaprfrm.detail.focus();
		return false;
	}
	return true;
}
</script>
</html>