<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>管理员功能列表</title>
</head>
<body>
    学生信息管理 <br>
    <a href="stuinfo/stuinfo_list.jsp" target="workspace">学生信息列表</a><br>
    <a href="stuinfo/stuinfo_search.jsp" target="workspace">学生信息查询</a><br>
    <a href="stuinfo/stuinfo_add.jsp" target="workspace">学生信息添加</a> <br>
    <a href="stuinfo/stuinfo_edit.jsp" target="workspace">学生信息修改</a><br><br>
    教师信息管理 <br>
    <a href="teainfo/teainfo_list.jsp" target="workspace">教师信息列表</a><br>
    <a href="teainfo/teainfo_search.jsp" target="workspace">教师信息查询</a><br>
    <a href="teainfo/teainfo_add.jsp" target="workspace">教师信息添加</a><br>
    <a href="teainfo/teainfo_edit.jsp" target="workspace">教师信息修改</a><br><br> 
    课程管理<br>
    <a href="course/course_list.jsp" target="workspace">课程列表</a><br>
    <a href="course/course_search.jsp" target="workspace">课程查询</a><br>
    <a href="course/course_add.jsp" target="workspace">课程添加</a> <br>
    <a href="course/course_edit.jsp" target="workspace">课程修改</a><br><br>
    成绩管理<br>
    <a href="score/sore_list.jsp" target="workspace">成绩列表</a><br>
    <a href="score/sore_search.jsp" target="workspace">成绩查询</a><br>
    <a href="score/sore_edit.jsp" target="workspace">成绩修改</a><br><br>
    请假管理 <br> 
	<a href="apr/aor_edit.jsp" target="workspace">请假修改</a><br>
 	<a href="apr/aor_list.jsp" target="workspace">请假查询与删除</a><br>
 
</body>
</html>