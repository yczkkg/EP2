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
	//String uid=request.getParameter("uid");
	int uid = 1;
	//String uid = session.getAttribute("uid").toString();
	ArrayList<CourseInfo> course = null;//从session获取
	if(course==null){
		 course = new  ArrayList<CourseInfo>();
	}
	//是否选课
	String isSelect = "1";
	//测试数据开始
	CourseInfo a = new CourseInfo();
	a.setC_ID(1);
	a.setC_name("操作系统原理");
	a.setC_cls("计算机学院");
	a.setC_gra(2016);
	a.setC_maj("软件工程");
	a.setC_cre(2);
	for(int i=0;i<20;i++){
	course.add(a);
	}
	//测试数据结束
%>
<link rel="stylesheet" type="text/css" href="<%=path%>/css/csmallp.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/css/iconsfly.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/css/coursecss.css">
<title>课程列表</title>
</head>
<body>
	<div class="topbar"><a style="font-size:25px;color:#fff;text-decoration:none;" href="javascript:history.back(-1);">&lt返回</a></div>
	<div class="epagechange"></div>
	<div class="coursefly"><img src="<%=path %>/pics/common/course.png" style="width:100px;height:100px;"/></div>
	<div class="course_list_title"><center><h1>全部课程信息表</h1></center></div>
	<!-- uid=0时为管理员用户访问，显示所有课程，有删除、编辑和添加功能 -->
	<%if(uid==1){ %>
	<div class="course_sidebar" style="color:#fff;">
		<div style="height:25px;">管理员操作课程列表</div>
			<div class="thetopcolor"><div style="height:25px;color:#fff;" align="center">关于</div><div style="color:#fff;">当前用户为管理员;<br>loginflag=0;</div>
			</div>
		</div>
		<div class="course_list_table"><center>
			<form name="adminfrm" method="post" action=""><!-- action中提交删除，用getParameterValue获取删除c_id数组 -->
				<table>
					<tr><td colspan="3"><input type="reset" value="清除所有标记" style="border:0;color:#fff;background-Color:#315183;">
						&nbsp&nbsp&nbsp&nbsp&nbsp<button name="select" onclick="ChangeS()" style="border:0;color:#fff;background-Color:#315183;">改变选课状态</button></td>
						<td  colspan="2">当前选课状态：<%=isSelect.equals("1")?"可选":"不可选" %></td>
						<td colspan="2"><input type="submit" value="删除所选课程" style="border:0;color:#fff;background-Color:red;" onclick="return DeleteAll()"></td>
					</tr>
					<tr><td></td><td style="width:200px;">课程名称</td><td style="width:170px">教学班级</td><td style="width:100px">开设年级</td><td style="width:170px">开设专业</td><td style="width:50px">学分</td><td></td></tr>
					<%for(int i=0;i<course.size();i++){ %>
						<tr>
							<td><input type="checkbox" name="delete"/></td>
							<td><%=course.get(i).getC_name() %></td>
							<td><%=course.get(i).getC_cls() %></td>
							<td><%=course.get(i).getC_gra() %></td>
							<td><%=course.get(i).getC_maj() %></td>
							<td><%=course.get(i).getC_cre() %></td>
							<td><a href="course_edit.jsp?id=<%=course.get(i).getC_ID() %>">编辑</a></td>
						</tr>
					<%} %>
		</table></form>
			<div></div>
		</center></div>
	<%} %>
	
	<!-- uid=1时为教师用户访问，显示所有课程 -->
	<%if(uid==2){ %>
		<div class="course_list_table"><center><!-- 老师只能查看信息列表 -->
	<table>
		<tr><td style="width:20px;"></td><td style="width:200px;">课程名称</td><td style="width:200px">教学班级</td><td style="width:100px">开设年级</td><td style="width:200px">开设专业</td><td style="width:50px">学分</td></tr>
		</table>
	</center></div>
	<%} %>
	
	<!-- uid=2时为学生用户访问，显示所有课程，当isSelect=1时能够选课 -->
	<%if(uid==3){ %>
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