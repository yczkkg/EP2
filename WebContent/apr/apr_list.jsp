<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 数据填补区，之后的uid需要从servlet提供 -->
<%	String path = request.getContextPath(); 
	String uid = session.getAttribute("uid").toString();
	ArrayList<String> aprlist = null;
	if(aprlist==null){
		aprlist = new ArrayList<String>();
	}
	/*for(int i=0;i<20;i++){
		aprlist.add();
	}*/
%>
<link rel="stylesheet" type="text/css" href="<%=path%>/css/csmallp.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/css/iconsfly.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/css/aprcss.css">
<title>请假信息</title>
</head>
<body>
	<%if(uid.equals("0")){ %><!--  当用户为管理员时，显示所有请假的记录。-->
	<div class="topbar"><a style="font-size:25px;color:#fff;text-decoration:none;" href="<%=path%>/manager/manager_main.jsp">&lt返回</a></div>
	<div class="epagechange">
		<div class="aprline"></div><center>
		<div class="infolist">
			<table>
				<tr style="background-color:gray;"><td style="width:13%;">时间</td><td style="width:12%;">编号</td><td style="width:12%;">名字</td><td style="width:14%;">批假辅导员</td><td style="width:48%;">备注</td></tr>
				<%for(int i=0;i<aprlist.size()+20;i++){ %><!-- 完成之后去掉+20 -->
					<tr>
						<td>2018-2-30(时间显示)</td>
						<td>2016000000(学生ID)</td>
						<td>ABC(学生姓名)</td>
						<td>梁淑贞(辅导员信息)</td>
						<td>不想上课(备注)</td>
					</tr>
				<%} %>
			</table>
		</div></center><div class="aprline1"></div>
	</div>
	<%} %>
	<!-- 管理员部分结束 -->
	<!--  当用户为老师时，显示历史请假信息、申请请假、学生的请假历史、搜索功能-->
	<%if(uid.equals("1")){ %>
	<div class="topbar"><a style="font-size:25px;color:#fff;text-decoration:none;" href="<%=path%>/teacher/teacher_main.jsp">&lt返回</a></div>
	<div class="epagechange">
		<div class="aprline"></div>
		<!--<div class="applyapr">申请请假</div>
		<div  class="situ">申请的状态</div>-->
		<div class="aprhistory"><a href="<%=path %>/apr/apr_history.jsp" target="aprtmain" style="text-decoration:none;color:#fff;">历史信息</a></div>
		<div class="createapr"><a href="<%=path %>/apr/apr_add.jsp" target="aprtmain" style="text-decoration:none;color:#fff;">申请请假</a></div>
		<div class="stuaprrecords"><a href="<%=path %>/apr/apr_stulist.jsp" target="aprtmain" style="text-decoration:none;color:#fff;">学生请假记录</a></div>
		<div class="divborder"><iframe name="aprtmain" src="<%=path %>/apr/apr_history.jsp" frameborder="0" scrolling="auto" class="aprmainfrm"></iframe></div>
	</div>
	<%} %>
	<!-- 老师部分结束 -->
	<!--当用户为学生时，显示历史请假信息、申请请假、搜索功能 -->
	<%if(uid.equals("2")){ %>
	<div class="topbar"><a style="font-size:25px;color:#fff;text-decoration:none;" href="<%=path%>/student/student_main.jsp">&lt返回</a></div>
	<div class="epagechange">
		<div class="aprline"></div>
		<!-- <div class="applyapr">申请请假</div>
		<div class="situ">学生申请的状态</div> -->
		<div class="aprhistory"><a href="<%=path %>/apr/apr_history.jsp" target="aprsmain" style="text-decoration:none;color:#fff;">历史信息</a></div>
		<div class="createapr"><a href="<%=path %>/apr/apr_add.jsp" target="aprsmain" style="text-decoration:none;color:#fff;">申请请假</a></div>
		<div class="divborder"><iframe name="aprsmain" src="<%=path %>/apr/apr_history.jsp" frameborder="0" scrolling="auto" class="aprmainfrm"></iframe></div>
	</div>
	<%} %><!-- 学生部分结束 -->
	<div class="aprfly"><img src="<%=path %>/pics/common/apr.png" style="width:100px;height:100px;"/></div>
	<div class="apr_list_title"><center><h1>请假信息</h1></center></div>
</body>
</html>