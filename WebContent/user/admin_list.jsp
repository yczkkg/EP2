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
<title>����Ա�����б�</title>
</head>
<body>
    ѧ����Ϣ���� <br>
    <a href="stuinfo/stuinfo_list.jsp" target="workspace">ѧ����Ϣ�б�</a><br>
    <a href="stuinfo/stuinfo_search.jsp" target="workspace">ѧ����Ϣ��ѯ</a><br>
    <a href="stuinfo/stuinfo_add.jsp" target="workspace">ѧ����Ϣ���</a> <br>
    <a href="stuinfo/stuinfo_edit.jsp" target="workspace">ѧ����Ϣ�޸�</a><br><br>
    ��ʦ��Ϣ���� <br>
    <a href="teainfo/teainfo_list.jsp" target="workspace">��ʦ��Ϣ�б�</a><br>
    <a href="teainfo/teainfo_search.jsp" target="workspace">��ʦ��Ϣ��ѯ</a><br>
    <a href="teainfo/teainfo_add.jsp" target="workspace">��ʦ��Ϣ���</a><br>
    <a href="teainfo/teainfo_edit.jsp" target="workspace">��ʦ��Ϣ�޸�</a><br><br> 
    �γ̹���<br>
    <a href="course/course_list.jsp" target="workspace">�γ��б�</a><br>
    <a href="course/course_search.jsp" target="workspace">�γ̲�ѯ</a><br>
    <a href="course/course_add.jsp" target="workspace">�γ����</a> <br>
    <a href="course/course_edit.jsp" target="workspace">�γ��޸�</a><br><br>
    �ɼ�����<br>
    <a href="score/sore_list.jsp" target="workspace">�ɼ��б�</a><br>
    <a href="score/sore_search.jsp" target="workspace">�ɼ���ѯ</a><br>
    <a href="score/sore_edit.jsp" target="workspace">�ɼ��޸�</a><br><br>
    ��ٹ��� <br> 
	<a href="apr/aor_edit.jsp" target="workspace">����޸�</a><br>
 	<a href="apr/aor_list.jsp" target="workspace">��ٲ�ѯ��ɾ��</a><br>
 
</body>
</html>