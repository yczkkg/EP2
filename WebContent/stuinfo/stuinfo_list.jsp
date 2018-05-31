<%@page import="stuinfo.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%	String path = request.getContextPath();
	ArrayList<StuInfo> reclist=(ArrayList<StuInfo>)session.getAttribute("StuList");
	session.removeAttribute("stuList");
	if(reclist==null){//测试数据还未构建
	reclist=new ArrayList<StuInfo>();
}
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>学生信息列表</title>
<link rel="stylesheet" type="text/css" href="<%=path%>/css/student.css">
</head>
<body>
	<table width="100%" height="100" border="0" cellpadding="0"
			cellspacing="0" align="center">
		<tr>
		<td height="25" colspan="9" class="tb_showall" align=center >学生信息列表</td>
		</tr>
		
		<tr>
		<td>学号</td>
		<td>学生姓名</td>
		<td>性别</td>
		<td>出生日期</td>
		<td>所在班级</td>
		<td>所在年级</td>		
		<td>所在专业</td>
		<td>绩点</td>
		<td>电话号码</td>
		</tr>
		<%
		int count=reclist.size();
		for(int i=0;i<count;i++){
			StuInfo student=reclist.get(i);
		%>
		<tr class="td_<%=i%2+1%>">
				<td><%=student.getS_num() %></td>
				<td><%=student.getS_name() %></td>
				<td><%=student.getS_sex()==1?"男":"女" %></td>
				<td><%=student.getS_bir() %></td>
				<td><%=student.getS_cls() %></td>
				<td><%=student.getS_gra() %></td>
				<td><%=student.getS_maj() %></td>
				<td><%=student.getS_gpa() %></td>
				<td><%=student.getS_tel() %></td>
				<td>
					<a href="<%=path %>/servlet/StuInfoGetAction?id=<%=student.getS_ID()%>">编辑</a>
					<a href="<%=path %>/servlet/StuInfoDelAction?id=<%=student.getS_ID()%>">删除</a>
				</td>
		</tr>
		<%
		} %>
		<tr>
		<td colspan="5"><a href="<%=path %>/stuinfo/stuinfo_add.jsp">添加</a>
		<td colspan="5"><a href="<%=path %>/servlet/StuInfoListAction">刷新数据列表</a>
		</tr>		
	</table>
</body>
</html>