<%@page import="course.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%	String path = request.getContextPath();
	ArrayList<CourseInfo> reclist=(ArrayList<CourseInfo>)session.getAttribute("CourseList");
	session.removeAttribute("courseList");
	if(reclist==null){//测试数据还未构建
	reclist=new ArrayList<CourseInfo>();
}
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>课程信息列表</title>
<link rel="stylesheet" type="text/css" href="<%=path%>/css/student.css">
</head>
<body>
   <form name="frm" method="post" action="<%=path%>/servlet/CourseSearchAction">
		查询类别<select name="zl" size='1' ><option value='1'>名称</option>
											<option value='2'>教学班级</option>
											<option value='3'>开设年级</option>
											<option value='4'>开设专业</option>
											<option value='5'>学分</option></select>
		关键字<input type="text" name="gjz" value="" size="20" maxlength="20">
		<input type="submit"  value="提交">
		</form>
		<table width="100%" height="100" border="0" cellpadding="0"
			cellspacing="0" align="center">
		<tr>
		<td height="25" colspan="6" class="tb_showall" align=center >课程信息列表</td>
		</tr>
		<tr>
		<td>名称</td>
		<td>教学班级</td>
		<td>开设年级</td>
		<td>开设专业</td>
		<td>学分</td>
		</tr>
		<%	int count=reclist.size();
			for(int i=0;i<count;i++){
			CourseInfo course=reclist.get(i);
			%>
			<tr class="td_<%=i%2+1%>">
					<td><%=course.getC_name() %></td>
					<td><%=course.getC_cls() %></td>
					<td><%=course.getC_gra() %></td>
					<td><%=course.getC_maj() %></td>
					<td><%=course.getC_cre() %></td>
					<td>
					<a href="<%=path %>/servlet/CourseGetAction?id=<%=course.getC_ID()%>">编辑</a>
					<a href="<%=path %>/servlet/CourseDelAction?id=<%=course.getC_ID()%>">删除</a>
				</td>
		</tr>
			<%
}
 %>	

		<tr>
		<td colspan="1"><a href="<%=path %>/course/course_add.jsp">添加</a>
		<td colspan="3"><a href="<%=path %>/course/course_search.jsp">查询</a>
		</tr>
</table>
</body>
</html>