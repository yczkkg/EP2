<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="login.*"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	String path = request.getContextPath();
	String lgerr= "";
%>
<%-- <%
String loginFlag=session.getAttribute("loginflag").toString();
if(loginFlag.equals("0")){lgerr="";out.println("监测到loginflag=0");}
if(loginFlag.equals("1")){
	out.println("用户不存在(loginflag=1)");
	lgerr="用户不存在！";
	session.setAttribute("loginflag", 0);
}else if(loginFlag.equals("2")){
	out.println("密码错误(loginflag=2)");
	lgerr="密码错误！";
	session.setAttribute("loginflag", 0);
}
%> --%>
<title>登录</title>
<link rel="stylesheet" type="text/css" href="<%= path%>/css/login.css">
<script type="text/javascript" src="<%= path%>/js/datacheck.js"></script>
</head>
<body>
<div align="center">
	<div class="filt"></div>
	<div class="forms"><div class="gline"></div><h2 class="logint">用户登录</h2>
		<div style="" ><form name="frm1" method="post" action="<%=path %>/LoginAction">
		<table align="center" style=" border-spacing:10px">
		<tr style="background-color:#6E8B3D;width:300px;height:2px;"><td></td></tr>
		<tr><td><input type="text" name="username" class="insertf" placeholder="这里输入用户名"></td></tr>
		<tr><td><input type="password" name="password" class="insertf" placeholder="你的密码"></td></tr>
		<tr style="width:300px;" align="center"><td><input type="submit" class="fbuttom" value = "登录" onclick="return check();"></td></tr>
		<tr><td style="color:red;font-size:10px;"><%=lgerr %></td></tr>
		<tr><td align="right"><a href="<%=path %>/login/forgot.jsp" style="color:#000;font-size:10px;"><u>忘记密码</u></a></td></tr>
 		<tr><td><a href="<%=path %>/manager/manager_main.jsp" style="color:red;font-size:15px;">管理员界面快速入口</a></td></tr>
		<tr><td><a href="<%=path %>/student/student_main.jsp" style="color:red;font-size:15px;">学生界面快速入口</a></td></tr>
		<tr><td><a href="<%=path %>/teacher/teacher_main.jsp" style="color:red;font-size:15px;">教师界面快速入口</a></td></tr>
		</table>
		</form>
		<% %>
		</div>
	</div>
</div>

</body>
<script language="JavaScript">
function check(){
	if(frm1.username.value.length==0){
		alert("用户名不能为空。");
		frm1.username.focus();
		return false;
	}
	if(frm1.pwd.value.length==0){
		alert("密码不能为空。");
		frm1.pwd.focus();
		return false;
	}
	return true;
}
<%
String loginFlag=request.getParameter("loginflag");
//String username = (String) session.getAttribute("username");
if(loginFlag==null){
	loginFlag="";
}
	if(loginFlag.equals("false")){
		out.println("alert('用户名或密码错误！')");
	}
%>
</script>
</html>