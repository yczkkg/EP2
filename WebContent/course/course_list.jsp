z<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList,course.*" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 获取填入信息表的信息 -->
<style type="text/css">
body{
margin:0;
}
</style>
<%	String path = request.getContextPath(); 
	String uid=request.getParameter("uid");
	//String stu_name = (String)session.getAttribute("stu_name");
	String stu_num = (String)session.getAttribute("stu_num");
	//ArrayList<CourseInfo> course = null;//从session获取
	ArrayList<CourseInfo> course=(ArrayList<CourseInfo>)session.getAttribute("CourseList");
	if(course==null){
		 course = new  ArrayList<CourseInfo>();
	}
	//是否选课
	String isSelect = "1";
	
%>
<link rel="stylesheet" type="text/css" href="<%=path%>/css/csmallp.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/css/iconsfly.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/css/coursecss.css">
<title>课程列表</title>
</head>
<body>
	<!-- uid=1时为管理员用户访问，显示所有课程，有删除、编辑和添加功能 -->
	<%if(uid.equals("1")){ %>
	<div class="topbar"><a style="font-size:25px;color:#fff;text-decoration:none;" href="<%=path%>/user/admin_main.jsp">&lt返回</a></div>
	<div class="epagechange"></div>
	<div class="coursefly"><img src="<%=path %>/pics/common/course.png" class="iconsmaller"/></div>
	<div class="course_list_title"><center><h1>全部课程信息表</h1></center></div>
	<div class="course_sidebar" style="color:#fff;">
		<div style="height:25px;">管理员操作课程列表</div>
			<div class="thetopcolor"><div style="height:25px;color:#fff;" align="center">关于</div><div style="color:#fff;">当前用户为管理员;<br>loginflag=0;<br>能对课程进行新建修改。</div>
			</div>
		</div>
		<div class="course_list_table"><center>
			<form name="adminfrm" method="post" action="<%=path%>/servlet/CourseDelAction?uid=1"><!-- action中提交删除，用getParameterValue获取删除c_id数组 -->
				<table>
					<tr><td colspan="3"><input type="reset" value="清除所有标记" style="border:0;color:#fff;background-Color:#315183;">
						&nbsp&nbsp&nbsp&nbsp&nbsp<button name="	addNew" type="button" onclick="location='<%=path %>/course/course_add.jsp'" style="border:0;color:#fff;background-Color:#315183;">[ + ]新建课程</button>
						&nbsp&nbsp&nbsp&nbsp&nbsp<button name="select" onclick="ChangeS()" style="border:0;color:#fff;background-Color:#315183;">改变选课状态</button></td>
						<td  colspan="2">当前选课状态：<%=isSelect.equals("1")?"可选":"不可选" %></td>
						<td colspan="2"><input type="submit" value="删除所选课程" style="border:0;color:#fff;background-Color:red;" onclick="return DeleteAll()"></td>
					</tr>
					<tr><td></td><td style="width:200px;">课程名称</td><td style="width:170px">教学班级</td><td style="width:100px">开设年级</td><td style="width:170px">开设专业</td><td style="width:50px">学分</td><td></td></tr>
					<%for(int i=0;i<course.size();i++){ %>
						<tr>
							<td><input type="checkbox" name="delete" value="<%=course.get(i).getC_ID()%>"/></td>
							<td><%=course.get(i).getC_name() %></td>
							<td><%=course.get(i).getC_cls() %></td>
							<td><%=course.get(i).getC_gra() %></td>
							<td><%=course.get(i).getC_maj() %></td>
							<td><%=course.get(i).getC_cre() %></td>
							<td><a href="<%=path%>/servlet/CourseGetAction?id=<%=course.get(i).getC_ID() %>">编辑</a></td>
						</tr>
					<%} %>
		</table></form>
			<div></div>
		</center></div>
	<%} %>
	
	<!-- uid=2时为教师用户访问，显示所有课程 -->
	<%if(uid.equals("2")){ %>
	<div class="topbar"><a style="font-size:25px;color:#fff;text-decoration:none;" href="<%=path%>/user/teacher_main.jsp">&lt返回</a></div>
	<div class="epagechange"></div>
	<div class="coursefly"><img src="<%=path %>/pics/common/course.png" class="iconsmaller"/></div>
	<div class="course_list_title"><center><h1>全部课程信息表</h1></center></div>
	<div class="course_sidebar" style="color:#fff;">
		<div style="height:25px;">教师操作课程列表</div>
			<div class="thetopcolor"><div style="height:25px;color:#fff;" align="center">关于</div><div style="color:#fff;">当前用户为教师用户;<br>loginflag=1;<br>只能查看课程信息。</div>
			</div>
		</div>
		<div class="course_list_table"><center><!-- 老师只能查看信息列表 -->
	<table>
		<tr>
			<td style="width:150px;">课程名称</td>
			<td style="width:80px;">主讲教师</td>
			<td style="width:150px">教学班级</td>
			<td style="width:80px">开设年级</td>
			<td style="width:40px">允许</td>
			<td style="width:40px">已选</td>
			<td style="width:140px">课程性质</td>
			<td style="width:50px">学分</td></tr>
		<%for(int i=0;i<course.size();i++){ %>
						<tr>
							<td><%=course.get(i).getC_name() %></td>
							<td><%=course.get(i).getC_tea() %></td>
							<td><%=course.get(i).getC_cls() %></td>
							<td><%=course.get(i).getC_gra() %></td>
							<td><%=course.get(i).getC_amount() %></td>
							<td></td>
							<td><%=course.get(i).getC_maj() %></td>
							<td><%=course.get(i).getC_cre() %></td>
						</tr>
					<%} %>
		</table>
	</center></div>
	<%} %>
	
	<!-- uid=3时为学生用户访问，显示所有课程，当isSelect=1时能够选课 -->
	<%if(uid.equals("3")){ %>
	<div class="topbar"><a style="font-size:25px;color:#fff;text-decoration:none;" href="<%=path%>/user/student_main.jsp">&lt返回</a></div>
	<div class="epagechange"></div>
	<div class="coursefly"><img src="<%=path %>/pics/common/course.png" class="iconsmaller"/></div>
	<div class="course_list_title"><center><h1>全部课程信息表</h1></center></div>
	<div class="course_sidebar" style="color:#fff;">
		<div style="height:25px;">学生操作课程列表</div>
		<!-- 将超链接更换为servlet -->
		<div style="height:25px;"><a href="<%=path%>/servlet/CourseStuListAction?id=<%=stu_num %>" target="stu_main" style="text-decoration:none;color:#fff;font-size:15px;margin-left:25px;">本学期全部课程</a></div>
		<div style="height:25px;"><a href="<%=path%>/servlet/CourseSelectedListAction?id=<%=stu_num %>" target="stu_main" style="text-decoration:none;color:#fff;font-size:15px;margin-left:25px;">本学期已选课程</a></div>
			<div class="thetopcolor">
				<div style="height:25px;color:#fff;" align="center">关于</div><div style="color:#fff;">当前用户为学生用户;<br>loginflag=2;<br>选课和查看课程。</div>
			</div>
			
		</div>
		<div class="course_list_table"><center>
		<iframe name="stu_main" src="<%=path%>/course/course_list_stu.jsp" style="width:900px;height:100%;" frameborder="0">
		</iframe>
		
		</center></div>
	<%} %>
</body>
<script>
function DeleteAll(){
	if(window.confirm("删除所勾选的所有课程信息吗？")){
		return true;
	}
	return false;
}
function ChangeS(){
	if(window.confirm("改变选课状态吗？")){
		if(isSelect.equals("0")){
			isSelect = "1";
		}else{
			isSelect = "0";
		}
	}
}
</script>
</html>