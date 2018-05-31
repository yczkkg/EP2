<%@page import="stuinfo.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%-- <% 
	String path = request.getContextPath();
	String id = "20180001";
	String username = "admin00";
	String uid = session.getAttribute("uid").toString();
	String major = "软件工程";
	int sex = Integer.parseInt("1");
	String telnum = "12345678901";
	String grade = "2016";
	String sclass = "163";
	String asfor = "";
	if(uid.equals("0")){
		asfor = "管理员";
	}else if(uid.equals("1")){ asfor = "教师";}else{ asfor = "学生";}
%> --%>
<%
String path = request.getContextPath();
StuInfo stu=(StuInfo)session.getAttribute("stuinfo"); %>
<link rel="stylesheet" type="text/css" href="<%=path%>/css/manager_topbar.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/css/iconsfly.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/css/infocss.css">
<title>个人信息</title>
</head>
<body>
	<div class="topbar"><a style="display:inline-block;font-size:25px;color:#fff;text-decoration:none;" href="javascript:history.back(-1);">&lt返回</a></div>
	<div class="epagechange"></div>
	<div class="infofly"><img src="<%=path %>/pics/common/selfinfo.png" style="width:100px;height:100px;"/></div>
	<div class="info_list_title"><center><h1>个人信息表</h1></center></div>
	<div class="tablestyle"><table>
		<tr><td style="width:150px">名字：</td><td style="width:250px"><%=stu.getS_name() %></td></tr>
		<tr><td style="width:150px">学号：</td><td style="width:250px"><%=stu.getS_num() %></td></tr>
		<tr><td style="width:150px">所属：</td><td style="width:250px"><%=stu.getS_maj()%><%=stu.getS_cls()%></td></tr>
		<tr><td style="width:150px">性别：</td><td style="width:250px"><%=stu.getS_sex()==0?"女":"男" %></td></tr>
		<tr><td style="width:150px">手机号码：</td><td style="width:250px"><%=stu.getS_tel() %></td></tr>
		<tr><td style="width:150px">入校年份：</td><td style="width:250px"><%=stu.getS_gra() %></td></tr>
<%-- 		<%if(uid.equals("1")||uid.equals("2")){ %>
			<tr><td style="width:150px">专业：</td><td style="width:250px"><%=major %></td></tr>
			<tr><td style="width:150px">班级：</td><td style="width:250px"><%=sclass %></td></tr>
		<%} %> --%>
		<tr><td colspan="2" align="center">修改信息请在主界面点击“编辑个人信息”</td></tr>
	</table></div>
</body>
</html>