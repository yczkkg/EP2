<%@page import="stuinfo.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%	String path = request.getContextPath();
	ArrayList<StuInfo> reclist=(ArrayList<StuInfo>)session.getAttribute("StuList");
	session.removeAttribute("stuList");
	if(reclist==null){//�������ݻ�δ����
	reclist=new ArrayList<StuInfo>();
}
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>ѧ����Ϣ�б�</title>
<link rel="stylesheet" type="text/css" href="<%=path%>/css/student.css">
</head>
<body>
	<table width="100%" height="100" border="0" cellpadding="0"
			cellspacing="0" align="center">
		<tr>
		<td height="25" colspan="9" class="tb_showall" align=center >ѧ����Ϣ�б�</td>
		</tr>
		
		<tr>
		<td>ѧ��</td>
		<td>ѧ������</td>
		<td>�Ա�</td>
		<td>��������</td>
		<td>���ڰ༶</td>
		<td>�����꼶</td>		
		<td>����רҵ</td>
		<td>����</td>
		<td>�绰����</td>
		</tr>
		<%
		int count=reclist.size();
		for(int i=0;i<count;i++){
			StuInfo student=reclist.get(i);
		%>
		<tr class="td_<%=i%2+1%>">
				<td><%=student.getS_num() %></td>
				<td><%=student.getS_name() %></td>
				<td><%=student.getS_sex()==1?"��":"Ů" %></td>
				<td><%=student.getS_bir() %></td>
				<td><%=student.getS_cls() %></td>
				<td><%=student.getS_gra() %></td>
				<td><%=student.getS_maj() %></td>
				<td><%=student.getS_gpa() %></td>
				<td><%=student.getS_tel() %></td>
				<td>
					<a href="<%=path %>/servlet/StuInfoGetAction?id=<%=student.getS_ID()%>">�༭</a>
					<a href="<%=path %>/servlet/StuInfoDelAction?id=<%=student.getS_ID()%>">ɾ��</a>
				</td>
		</tr>
		<%
		} %>
		<tr>
		<td colspan="5"><a href="<%=path %>/stuinfo/stuinfo_add.jsp">���</a>
		<td colspan="5"><a href="<%=path %>/servlet/StuInfoListAction">ˢ�������б�</a>
		</tr>		
	</table>
</body>
</html>