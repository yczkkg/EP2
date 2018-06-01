<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%String path = request.getContextPath();%>
<link rel="stylesheet" type="text/css" href="<%=path%>/css/student_main_set.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/css/commonset.css">
<%
	String stu_notice = (String)session.getAttribute("stu_notice");
	String stu_name = (String)session.getAttribute("stu_name");
	String stu_num = (String)session.getAttribute("stu_num");
	int stu_uid = (int)session.getAttribute("stu_uid");
	//String id="";
	//session.setAttribute("uid","2");
%>
<style>
</style>
<title>学生用户界面</title>
</head>
<body>
	<div class="filt"></div>
	<div class="pagescreen">
	<div class="topfix"><div class="topt">&nbsp&nbsp&nbsp&nbsp教务管理-学生界面</div><div class="topbdiv1"><button id="exit" class="topbuttom" onclick="location='<%=path%>/info/info_edit.jsp?'">编辑个人信息</button></div><div class="topbdiv"><button id="exit" class="topbuttom" onclick="logout()">退出登录</button></div></div>
	<div class="selfinfo"><h2>你好，<%=stu_name %>同学</h2></div>
	<div class="stumainfunc">
		<div onclick="location='<%=path %>/servlet/GetMineInfoAction?uid=<%=stu_uid%>&id=<%=stu_num %>'" style="margin-left:40px;margin-top:115px;"class="clickdiv"><div class="imgb"><center><img src="<%=path %>/pics/common/selfinfo.png" style="width:100px;height:100px;"/></center></div><div class="clickfont">个人信息</div></div>
		<div onclick="location='<%=path %>/servlet/CourseListAction?uid=<%=stu_uid%>id=<%=stu_num %>'" style="margin-left:40px;margin-top:115px;"class="clickdiv"><div class="imgb"><center><img src="<%=path %>/pics/common/course.png" style="width:100px;height:100px;"/></center></div><div class="clickfont">课程管理</div></div>
		<div onclick="location='<%=path %>/apr/apr_list.jsp?id=<%=stu_num %>'" style="margin-left:40px;margin-top:115px;"class="clickdiv"><div class="imgb"><center><img src="<%=path %>/pics/common/apr.png" style="width:100px;height:100px;"/></center></div><div class="clickfont">请假管理</div></div>
		<div onclick="location='<%=path %>/score/score_list.jsp?id=<%=stu_num %>'" style="margin-left:40px;margin-top:115px;"class="clickdiv"><div class="imgb"><center><img src="<%=path %>/pics/common/score.png" style="width:100px;height:100px;"/></center></div><div class="clickfont">分数查询</div></div>
		<div onclick="location='<%=path %>/homework/homework_list.jsp?id=<%=stu_num %>'" style="margin-left:40px;margin-top:115px;"class="clickdiv"><div class="imgb"><center><img src="<%=path %>/pics/common/homework.png" style="width:100px;height:100px;"/></center></div><div class="clickfont">作业提交</div></div>
		<div onclick="alert('暂未开通')" style="margin-left:40px;margin-top:40px;"class="expandcdiv"><div class="imgb"><center><img src="<%=path %>/pics/common/build01.png" style="width:100px;height:100px;"/></center></div><div class="clickfont">拓展功能1</div></div>
		<div onclick="alert('暂未开通')" style="margin-left:40px;margin-top:40px;"class="expandcdiv"><div class="imgb"><center><img src="<%=path %>/pics/common/build02.png" style="width:100px;height:100px;"/></center></div><div class="clickfont">拓展功能2</div></div>
	</div>
	</div>
	<%if(stu_notice.length()!=0){ %>
	<div class="noticebar"><div class="timeline"></div>收到新的通知<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<%=stu_notice %></div>
	<%} %>
</body>
<script type="text/javascript">
function logout(){
	if(window.confirm("退出登录吗？")){
		/*window.location.href=path+"/login/logout.jsp”+window.location.href; */
		/*response.sendRedirect(path+"/login/logout.jsp");*/
		window.location.href="/EP2/login/logout.jsp";
	}
}</script>
</html>