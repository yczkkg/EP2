<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="info.*" import="stuinfo.*" import="teainfo.*" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<% 
	String path = request.getContextPath();
	String uid=request.getParameter("uid");
	String username="获取信息失败";
	long num=0;
	int sex=0;
	long tel=0;
	int year=0;
	String col="";
	String major="";
	String cls="";
	if(uid.equals("1")){
		AdminInfo admin=(AdminInfo)session.getAttribute("info");
		username=admin.getA_name();
		num=admin.getA_num();
		sex=admin.getA_sex();
		tel=admin.getA_tel();
		year=admin.getA_year();
	}else if(uid.equals("2")){
		TeaInfo teacher=(TeaInfo)session.getAttribute("info");
		username=teacher.getT_name();
		num=teacher.getT_num();
		sex=teacher.getT_sex();
		tel=teacher.getT_tel();
		year=teacher.getT_year();
		col=teacher.getT_col();
	}else if(uid.equals("3")){
		StuInfo student=(StuInfo)session.getAttribute("info");
		username=student.getS_name();
		num=student.getS_num();
		sex=student.getS_sex();
		tel=student.getS_tel();
		year=student.getS_gra();
		major=student.getS_maj();
		cls=student.getS_cls();		
	}
	//String id = (String)session.getAttribute("get");
	//String username = "admin00";
	//String uid = session.getAttribute("uid").toString();
	//String major = "软件工程";
	//int sex = Integer.parseInt("1");
	//String telnum = "12345678901";
	//String grade = "2016";
	//String sclass = "163";
	String asfor = "";
	if(uid.equals("1")){
		asfor = "管理员";
	}else if(uid.equals("2")){ asfor = "教师";}else{ asfor = "学生";}
%>
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
		<tr><td style="width:150px">名字：</td><td style="width:250px"><%=username %></td></tr>
		<tr><td style="width:150px">编号：</td><td style="width:250px"><%=num %></td></tr>
		<tr><td style="width:150px">所属：</td><td style="width:250px"><%=asfor %></td></tr>
		<tr><td style="width:150px">性别：</td><td style="width:250px"><%=sex==0?"女":"男" %></td></tr>
		<tr><td style="width:150px">手机号码：</td><td style="width:250px"><%=tel %></td></tr>
		<tr><td style="width:150px">入校年份：</td><td style="width:250px"><%=year %></td></tr>
		<%if(uid.equals("2")){ %>
			<tr><td style="width:150px">所属学院：</td><td style="width:250px"><%=col %></td></tr>
		<%} %>
		<%if(uid.equals("3")){ %>
			<tr><td style="width:150px">专业：</td><td style="width:250px"><%=major %></td></tr>
			<tr><td style="width:150px">班级：</td><td style="width:250px"><%=cls %></td></tr>
		<%} %>
		<tr><td colspan="2" align="center">修改信息请在主界面点击“编辑个人信息”</td></tr>
	</table></div>
</body>
</html>