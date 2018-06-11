<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>请假历史记录</title>
<style type="text/css">
body {
	background-color: #192231;
	color:white;
}
</style>
<%
	ArrayList<String> user_aprhistory = new ArrayList<String>();
%>
</head>
<body>
	<table>
		<tr style="background-color: gray;">
			<td style="width: 18%;">申请时间</td>
			<td style="width: 15%;">批假人员</td>
			<td style="width: 12%;">是否被批准</td>
			<td style="width: 15%;">请假信息</td>
			<td style="width: 40%;">备注</td>
		</tr>
		<%for (int i = 0; i < user_aprhistory.size() + 20; i++) {%><!-- 完成之后去掉+20 -->
		<tr>
			<td>2018-2-30(时间显示)</td>
			<td>梁淑贞(上级信息)</td>
			<td>批准/等待/未通过</td>
			<td>不想上课(备注)</td>
			<td>你说不想上就不上吗(未批准回复)</td>
		</tr>
		<%}%>
	</table>
</body>
</html>