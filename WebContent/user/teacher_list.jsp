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
<title>教师用户功能列表</title>
</head>
<body>
    教师信息管理 <br>
    <a href="teainfo/teainfo_edit.jsp" target="workspace">教师信息修改</a><br> 
    课程管理<br>
    <a href="course/course_list.jsp" target="workspace">课程查询</a><br><br>
    成绩管理<br>
    <a href="score/sore_add.jsp" target="workspace">成绩添加</a> <br>
    <a href="score/sore_edit.jsp" target="workspace">成绩修改</a><br><br>
    <a href="score/sore_list.jsp" target="workspace">成绩查询与删除</a><br><br>
    作业管理 <br> 
    <a href="task/task_add.jsp" target="workspace">作业添加</a><br>
	<a href="task/task_edit.jsp" target="workspace">作业修改</a><br>
 	<a href="task/task_list.jsp" target="workspace">作业查询与删除</a><br>
    请假管理 <br> 
	<a href="apr/aor_add.jsp" target="workspace">请假申请</a><br>
	<a href="apr/aor_edit.jsp" target="workspace">请假修改</a><br>
 
</body>
</html>