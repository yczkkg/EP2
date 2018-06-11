<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.ArrayList"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>老师请假管理查看学生请假历史</title>
<style>
body{
background-color:#494E6B;
color:#fff;
}</style>
<%
	String path = request.getContextPath();
	ArrayList<String> user_stuapr = new ArrayList<String>();
	String isapproved = "0";
	String apr_id = "0001";//模拟当前请假条目编号的String
%>
</head>
<body>
<form name="newapr" method="post" action=""><!-- 替换成处理的类 -->
<table>
	<!-- <tr><td colspan="6"></td></tr> -->
		<tr style="background-color: gray;">
			<td style="width: 15%;">申请时间</td>
			<td style="width: 12%;">申请人</td>
			<td style="width: 10%;">申请人学号</td>
			<td style="width: 18%;">申请备注信息</td>
			<td style="width: 10%;">是否批准</td>
			<td style="width: 35%;">你的回复</td>
		</tr>
		<%for (int i = 0; i < user_stuapr.size() + 20; i++) {%><!-- 完成之后去掉+20 -->
		<tr>
			<td>2018-2-30(时间显示)</td>
			<td>ABC(学生信息)</td>
			<td>2016000000</td>
			<td>不想上课(备注)</td>
			<!-- 在值bean中添加这个值，确定是否已经批假 -->
			<%if(isapproved.equals("1")){ %>
			<td>同意/不同意</td>
			<td>你的备注内容</td>
			<%}else{ %>
			<td><a href="<%=path %>/apr/apr_proccess.jsp?id=<%=apr_id %>" style="color:#fff">现在处理</a></td>
			<td></td>
			<%} %>
		</tr>
		<%}%>
	</table>
	</form>
</body>
</html>