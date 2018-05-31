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
<title>学生用户功能列表</title>
</head>
<body>
    学生信息管理 <br>
    <a href="stuinfo/stuinfo_edit.jsp" target="workspace">学生信息修改</a><br> 
    课程管理<br>
    <a href="course/course_list.jsp" target="workspace">课程查询</a><br><br>
    成绩管理<br>
    <a href="score/sore_list.jsp" target="workspace">成绩查询</a><br><br>
    作业管理 <br> 
	<a href="task/task_edit.jsp" target="workspace">作业提交</a><br>
    请假管理 <br> 
	<a href="apr/aor_add.jsp" target="workspace">请假申请</a><br>
	<a href="apr/aor_edit.jsp" target="workspace">请假修改</a><br>
 
</body>
</html>