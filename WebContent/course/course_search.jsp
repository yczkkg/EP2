<%@page import="course.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%	String path = request.getContextPath();
	ArrayList<CourseInfo> reclist=(ArrayList<CourseInfo>)session.getAttribute("CourseList");
	session.removeAttribute("courseList");
	if(reclist==null){//�������ݻ�δ����
	reclist=new ArrayList<CourseInfo>();
}
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>�γ���Ϣ�б�</title>
<link rel="stylesheet" type="text/css" href="<%=path%>/css/student.css">
</head>
<body>
   <form name="frm" method="post" action="<%=path%>/servlet/CourseSearchAction">
		��ѯ���<select name="zl" size='1' ><option value='1'>����</option>
											<option value='2'>��ѧ�༶</option>
											<option value='3'>�����꼶</option>
											<option value='4'>����רҵ</option>
											<option value='5'>ѧ��</option></select>
		�ؼ���<input type="text" name="gjz" value="" size="20" maxlength="20">
		<input type="submit"  value="�ύ">
		</form>
		<table width="100%" height="100" border="0" cellpadding="0"
			cellspacing="0" align="center">
		<tr>
		<td height="25" colspan="6" class="tb_showall" align=center >�γ���Ϣ�б�</td>
		</tr>
		<tr>
		<td>����</td>
		<td>��ѧ�༶</td>
		<td>�����꼶</td>
		<td>����רҵ</td>
		<td>ѧ��</td>
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
					<a href="<%=path %>/servlet/CourseGetAction?id=<%=course.getC_ID()%>">�༭</a>
					<a href="<%=path %>/servlet/CourseDelAction?id=<%=course.getC_ID()%>">ɾ��</a>
				</td>
		</tr>
			<%
}
 %>	

		<tr>
		<td colspan="1"><a href="<%=path %>/course/course_add.jsp">���</a>
		<td colspan="3"><a href="<%=path %>/course/course_search.jsp">��ѯ</a>
		</tr>
</table>
</body>
</html>