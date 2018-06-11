<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ page import="java.util.ArrayList,course.*" %>
<%
	String path = request.getContextPath();
	String stu_num = (String)session.getAttribute("stu_num");
	//是否选课
	String isSelect = "1";
	ArrayList<CourseInfo> course=(ArrayList<CourseInfo>)session.getAttribute("CourseList");
	if(course==null){
		 course = new  ArrayList<CourseInfo>();
	}
	CourseInfo a = new CourseInfo();
	String uid=request.getParameter("uid");
	//session.removeAttribute("courseList");
%>
<link rel="stylesheet" type="text/css" href="<%=path%>/css/csmallp.css">
<style type="text/css">
body{
	background:none;
}
</style>
<title>学生课程查看</title>
</head>
<body>
	<form name="stufrm" method="post" action="<%=path%>/servlet/CourseSelectAction?id=<%=stu_num %>"><!-- action中提交删除，用getParameterValue获取删除c_id数组 -->
				<table>
					<tr><td colspan="6" align="center" style="background-color:gray;">本学期全部课程</td></tr>
					<tr><td colspan="3"><input type="reset" value="清除所有标记" style="border:0;color:#fff;background-Color:#315183;">&nbsp&nbsp&nbsp&nbsp&nbsp
					<button name="selectcourse" type="submit" onclick="upload()" style="border:0;color:#fff;background-Color:#315183;">提交已选课程</button>
						</td>
						<td  colspan="2">当前选课状态：<%=isSelect.equals("1")?"可选":"不可选" %></td>
						<td colspan="1"></td>
					</tr>
					<tr><td style="width:20px;"></td><td style="width:200px;">课程名称</td><td style="width:170px">教学班级</td><td style="width:100px">开设年级</td><td style="width:170px">开设专业</td><td style="width:50px">学分</td></tr>
					<%for(int i=0;i<course.size();i++){ %>
						<tr>
							<td><%if(isSelect.equals("1")){%><input type="checkbox" name="select" value="<%=course.get(i).getC_ID()%>"/><%} %></td>
							<td><%=course.get(i).getC_name() %></td>
							<td><%=course.get(i).getC_cls() %></td>
							<td><%=course.get(i).getC_gra() %></td>
							<td><%=course.get(i).getC_maj() %></td>
							<td><%=course.get(i).getC_cre() %></td>
						</tr>
					<%} %>
		</table></form>
</body>
<script>
function upload(){
	if(window.confirm("提交所有已选课程吗？")){
		stufrm.submint();
	}
	return;
}
</script>
</html>