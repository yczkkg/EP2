<%@page import="course.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
CourseInfo course=(CourseInfo)session.getAttribute("courseinfo");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>�γ����</title>
<link rel="stylesheet" type="text/css" href="<%=path%>/css/student.css">
<script type="text/javascript" src = "<%=path%>/js/datacheck.js"></script>
</head>
<body>
 <center>	
    <form name="frm" method="post" action="<%=path%>/servlet/CourseInsertAction">								 
   <table border="1">
		<tr class="td_header">
		<td colspan="2"> �γ���Ϣ¼��<span class="star">*</span>Ϊ������</td>
		</tr>
		
		<tr>
		<td>�γ�����</td><td><input type="text" name="name" value="" size="20" maxlength="20"><span class="star">*</span>20λ�ַ�</td>
		</tr>
		
		<tr>
		<td>��ѧ�༶</td><td><input type="text" name="cls" value="" size="20" maxlength="10"><span class="star">*</span>10λ�ַ�</td>
		</tr>
		
		<tr>
		<td>�����꼶</td><td><input type="text" name="grade" value="" size="20" maxlength="4"><span class="star">*</span>4λ�����</td>
		</tr>
		
		<tr>
		<td>����רҵ</td><td><input type="text" name="major" value="" size="20" maxlength="10"><span class="star">*</span>10λ�ַ�</td>
		</tr>
		
		<tr>
		<td>ѧ��</td><td><input type="text" name="credit" value="" size="20" maxlength="10"><span class="star">*</span>��ֵ</td>
		</tr>
		
		<tr>		
		<td colspan="2" align="center"><input type="submit"  value="�ύ" onclick="return check();">
<input type="reset"  value="����"></td>
		</tr>
		</table>
   </form>
   </center>
</body>
</html>
<script language="JavaScript">
function check(){
	if(frm.name.value.length<1){
		alert("�γ����Ʋ���Ϊ��!");
		frm.name.focus();
		return false;
	}
	if(frm.name.value.length>20){
		alert("������20λ�ַ����ڵĿγ�����!");
		frm.name.focus();
		return false;
	}
	if(frm.cls.value.length<1){
		alert("�༶����Ϊ��!");
		frm.cls.focus();
		return false;
	}
	if(frm.grade.value.length!=4||!IsInt(frm.grade.value)){
		alert("������4λ���������!");
		frm.grade.focus();
		return false;
	}
	if(frm.major.value.length<1){
		alert("רҵ���Ʋ���Ϊ��!");
		frm.major.focus();
		return false;
	}
	if(frm.credit.value.length<1||isNaN(frm.code.value)==true){
		alert("��������ȷ��ѧ����ֵ!");
		frm.credit.focus();
		return false;
	}
	return true;
}

</script>