<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%String path = request.getContextPath(); %>
<!-- 页面内容代码修改 --><!-- 所有超链接都需要用servlet取代 -->
<%
	String baiscname = "admin0";
	String id= "1";
	session.setAttribute("uid","0");
%>
<!-- 页面内容代码修改结束 -->
<link rel="stylesheet" type="text/css" href="<%=path%>/css/manager.css">
<script type="text/javascript" src="<%=path%>/js/Dialog.js"></script>
<script type="text/javascript" src="<%=path%>/js/datacheck.js"></script>
<style>
Div{
	overflow:hidden;
	-webkit-overflow:hidden;
}
.selfinfo{
	position:absolute;
	color:#323421;
	text-align:center;
	line-height:30px;
	font-size:12px;
	left:50px;
	top:60px;
	z-index:20;
	box-shadow: 0px 0px 3px 3px #8c8c8c;
	animation:selfif 0.5s forwards;
	-webkit-animation: selfif 0.5s forwards;
}
.mainfunc{
	position:absolute;
	left:20px;
	top:75px;
	z-index:10;
	background:none;
	animation:mf 1s forwards;
	-webkit-animation: mf 1s forwards;
}
.mainfunc1{
	position:absolute;
	left:20px;
	top:75px;
	z-index:10;
	/*margin:-20px;*/
	animation:mf1 1s forwards;
	-webkit-animation: mf1 1s forwards;.
}
.clickdiv{
	display:inline-block;
	color:#dbfb35;
	border:solid 2px;
	height:125px;
	width:100px;
}
.expandcdiv{
	display:inline-block;
	color:#323421;
	border:solid 2px;
	height:125px;
	width:100px;
}
.clickdiv:hover{
	animation:bluebuttom 1s forwards;
	-webkit-animation: bluebuttom 1s forwards;
}
.expandcdiv:hover{
	animation:bluebuttom 1s forwards;
	-webkit-animation: bluebuttom 1s forwards;
}
.imgb{
	width:100px;height:100px;display:inline-block;
}
.clickfont{
	display:inline-block;
	width:100px;
	height:50px;
	color:#dbfb35;
	text-align:center;
	line-height:25px;
}
.clickfont:hover{
	color:#262228;
}
@keyframes selfif {
	from {height:10px;width:10px;background-color:#6E8B3D;}
	to {height:60px;width:400px;background-color:#dbfb35;}
}
@-webkit-keyframes selfif {
	from {height:10px;width:10px;background-color:#6E8B3D;}
	to {height:60px;width:400px;background-color:#dbfb35;}
}
}
@keyframes mf {
	0% {height:10px;width:10px;}
	40% {height:10px;width:96%;}
	100% {height:80%;width:96%;background:none;box-shadow: 0px 0px 3px 3px #8c8c8c;}
}
@-webkit-keyframes mf {
	0% {height:10px;width:10px;}
	40% {height:10px;width:96%;}
	100% {height:80%;width:96%;background:none;box-shadow: 0px 0px 3px 3px #8c8c8c;}
}
}
@keyframes mf1 {
	0% {height:10px;width:10px;background-color:#6E8B3D;}
	40% {height:10px;width:96%;}
	100% {height:80%;width:96%;background:#262228;opacity:0.95;}
}
@-webkit-keyframes mf1 {
	0% {height:10px;width:10px;background-color:#6E8B3D;}
	40% {height:10px;width:96%;}
	100% {height:80%;width:96%;background:#262228;opacity:0.95;}
}
}
@keyframes bluebuttom {
	from {}
	to {background-color:#aeb135;}
}
@-webkit-keyframes bluebuttom {
	from {}
	to {background-color:#aeb135;}
}
}
</style>
<title>管理员</title>
</head>
<body>
<div class="topfix"><div class="topt">&nbsp&nbsp&nbsp&nbsp教务管理-管理员界面</div><div class="topbdiv"><button id="exit" class="topbuttom" onclick="logout()">登出系统</button></div></div>
<div class="selfinfo"><h2>欢迎，管理员<%=baiscname %></h2></div>
<div class="mainfunc1"></div>
<div class="mainfunc">
	<div style="position:relative;top:0;height:55;width:98%;"><div style="position:absolute;bottom:0;right:0;"><button style="border:0;background-color:#dbfb35;color:#323421;" onclick="editselfinfo()">修改个人信息</button></div></div>
	<center><div style="height:5px;width:98%;background-color:#dbfb35;"></div></center>
		<div onclick="location='<%=path %>/info/info_list.jsp'" style="margin-left:40px;margin-top:10px;"class="clickdiv"><div class="imgb"><center><img src="<%=path %>/pics/common/selfinfo.png" style="width:100px;height:100px;"/></center></div><div class="clickfont">个人信息</div></div>
		<div onclick="location='<%=path %>/course/course_list.jsp'" style="margin-left:40px;margin-top:10px;"class="clickdiv"><div class="imgb"><center><img src="<%=path %>/pics/common/course.png" style="width:100px;height:100px;"/></center></div><div class="clickfont">管理课程</div></div>
		<div onclick="location='<%=path %>/apr/apr_list.jsp'" style="margin-left:40px;margin-top:10px;"class="clickdiv"><div class="imgb"><center><img src="<%=path %>/pics/common/apr.png" style="width:100px;height:100px;"/></center></div><div class="clickfont">请假记录</div></div>
		<div onclick="location='<%=path %>/score/score_list.jsp'" style="margin-left:40px;margin-top:10px;"class="clickdiv"><div class="imgb"><center><img src="<%=path %>/pics/common/score.png" style="width:100px;height:100px;"/></center></div><div class="clickfont">成绩管理</div></div>
		<div onclick="location='<%=path %>/homework/homework_list.jsp'" style="margin-left:40px;margin-top:10px;"class="clickdiv"><div class="imgb"><center><img src="<%=path %>/pics/common/homework.png" style="width:100px;height:100px;"/></center></div><div class="clickfont">作业管理</div></div>
		<div onclick="location='<%=path %>/info/info_add.jsp" style="margin-left:40px;margin-top:40px;"class="clickdiv"><div class="imgb"><center><img src="<%=path %>/pics/common/build01.png" style="width:100px;height:100px;"/></center></div><div class="clickfont">新建信息</div></div>
		<div onclick="alert('暂未开通')" style="margin-left:40px;margin-top:40px;"class="expandcdiv"><div class="imgb"><center><img src="<%=path %>/pics/common/build02.png" style="width:100px;height:100px;"/></center></div><div class="clickfont">拓展功能</div></div>
</div>
</body>
<script type="text/javascript">
function logout(){
	if(window.confirm("退出登录吗？")){
		/*window.location.href=path+"/login/logout.jsp”+window.location.href; */
		/*response.sendRedirect(path+"/login/logout.jsp");*/
		window.location.href="/z_school_sys_2018/login/logout.jsp";
	}
}
function editselfinfo(){
	window.location.href="/z_school_sys_2018/info/info_edit.jsp";
}

</script>
<!-- 新开窗口
	function editselfinfo(){
	var diag = new Dialog("Diag2");
	diag.Width = 700;
	diag.Height = 400;
	diag.Title = "编辑个人信息";
	diag.URL = "/z_school_sys_2018/info/info_edit.jsp";/*之后改成Servlet*/
	//diag.OKEvent = zAlert;//点击确定后调用的方法
	diag.show();

} -->
</html>