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
<title>ѧ���û������б�</title>
</head>
<body>
    ѧ����Ϣ���� <br>
    <a href="stuinfo/stuinfo_edit.jsp" target="workspace">ѧ����Ϣ�޸�</a><br> 
    �γ̹���<br>
    <a href="course/course_list.jsp" target="workspace">�γ̲�ѯ</a><br><br>
    �ɼ�����<br>
    <a href="score/sore_list.jsp" target="workspace">�ɼ���ѯ</a><br><br>
    ��ҵ���� <br> 
	<a href="task/task_edit.jsp" target="workspace">��ҵ�ύ</a><br>
    ��ٹ��� <br> 
	<a href="apr/aor_add.jsp" target="workspace">�������</a><br>
	<a href="apr/aor_edit.jsp" target="workspace">����޸�</a><br>
 
</body>
</html>