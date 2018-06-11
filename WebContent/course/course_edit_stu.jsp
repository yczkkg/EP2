<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ page import="java.util.ArrayList,course.*" %>
<%
	String path = request.getContextPath();
	ArrayList<CourseInfo> course = null;
	if(course==null){
		 course = new  ArrayList<CourseInfo>();
	}
	//是否选课
	String isSelect = "1";
	String stu_num = (String)session.getAttribute("stu_num");
	//是否选课
	ArrayList<CourseInfo> selectedcourse=(ArrayList<CourseInfo>)session.getAttribute("CourseList");
	if(selectedcourse==null){
		selectedcourse = new  ArrayList<CourseInfo>();
	}
	CourseInfo a = new CourseInfo();
	String uid=request.getParameter("uid");
%>
<link rel="stylesheet" type="text/css" href="<%=path%>/css/csmallp.css">
<style type="text/css">
body{
	background:none;
}
</style>
<title>学生本学期课程</title>
</head>
<body>
	<form name="stufrm" method="post" action="<%=path%>/servlet/CourseStuDelAction?id=<%=stu_num %>"><!-- action中提交删除，用getParameterValue获取删除c_id数组 -->
				<table>
				<tr><td colspan="6" align="center" style="background-color:gray;">本学期已选课程</td></tr>
					<tr><td colspan="3"><input type="reset" value="清除所有标记" style="border:0;color:#fff;background-Color:#315183;">&nbsp&nbsp&nbsp&nbsp&nbsp
					<button name="cancelcourse" type="submit" onclick="cancel()" style="border:0;color:#fff;background-Color:red;">取消已选课程</button>
						</td>
						<td  colspan="2">当前选课状态：<%=isSelect.equals("1")?"可选":"不可选" %></td>
						<td colspan="1"></td>
					</tr>
					<tr><td style="width:20px;"></td><td style="width:200px;">课程名称</td><td style="width:170px">教学班级</td><td style="width:100px">开设年级</td><td style="width:170px">开设专业</td><td style="width:50px">学分</td></tr>
					<%for(int i=0;i<selectedcourse.size();i++){ %>
						<tr>
							<td><%if(isSelect.equals("1")){%><input type="checkbox" name="select" value="<%=selectedcourse.get(i).getC_ID()%>"/><%} %></td>
							<td><%=selectedcourse.get(i).getC_name() %></td>
							<td><%=selectedcourse.get(i).getC_cls() %></td>
							<td><%=selectedcourse.get(i).getC_gra() %></td>
							<td><%=selectedcourse.get(i).getC_maj() %></td>
							<td><%=selectedcourse.get(i).getC_cre() %></td>
						</tr>
					<%} %>
		</table></form>
</body>
<script>
function cancel(){
	if(window.confirm("取消所有已选课程吗？")){
		stufrm.submint();
	}
	return;
}
</script>
</html>