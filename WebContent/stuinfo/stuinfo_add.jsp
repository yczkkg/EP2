<%@page import="stuinfo.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
StuInfo student=(StuInfo)session.getAttribute("studentinfo");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>ѧ����Ϣ���</title>
<link rel="stylesheet" type="text/css" href="<%=path%>/css/student.css">
<script type="text/javascript" src = "<%=path%>/js/datacheck.js"></script>
</head>
<body>
<center>	
    <form name="frm" method="post" action="<%=path%>/servlet/CourseInsertAction">								 
   <table border="1">
		<tr class="td_header">
		<td colspan="2"> ѧ����Ϣ¼��<span class="star">*</span>Ϊ������</td>
		</tr>
				
		<tr>
		<td>ѧ��</td><td><input type="text" name="num" value="" size="20" maxlength="10"><span class="star">*</span>10λ����</td>
		</tr>
		
		<tr>
		<td>����</td><td><input type="text" name="name" value="" size="20" maxlength="10"><span class="star">*</span>10λ�ַ�����</td>
		</tr>
		
		<tr>
		<td>�Ա�</td><td><input type="radio" name="sex" value="1" checked>��<input type="radio" name="sex" value="0">Ů<span class="star">*</span></td>
		</tr>
		
		<tr>
		<td>��������</td><td><input type="text" name="bir" value="" size="20" maxlength="8"><span class="star">*</span>8λ�ַ�������19980101</td>
		</tr>
		
		<tr>
		<td>���ڰ༶</td><td><input type="text" name="cls" value="" size="20" maxlength="4"><span class="star">*</span>10λ�����ַ�</td>
		</tr>
		
		<tr>
		<td>�����꼶</td><td><input type="text" name="gra" value="" size="20" maxlength="4"><span class="star">*</span>4λ�����</td>
		</tr>
		
		<tr>
		<td>����רҵ</td><td><input type="text" name="maj" value="" size="20" maxlength="10"><span class="star">*</span>10λ�����ַ�</td>
		</tr>
		
		<tr>
		<td>����</td><td><input type="text" name="gpa" value="" size="10" maxlength="4"><span class="star">*</span>��ֵ</td>
		</tr>
		
		<tr>
		<td>�绰����</td><td><input type="text" name="tel" value="" size="20" maxlength="11"><span class="star">*</span>11λ������ֵ</td>
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
	if(frm.num.value.length!=10){
		alert("������10λ��ѧ��!");
		frm.num.focus();
		return false;
	}
	if(frm.name.value.length<1){
		alert("��������Ϊ��!");
		frm.name.focus();
		return false;
	}
	if(frm.bir.value.length!=8){
		alert("��������ȷ�ĳ�������!");
		frm.bir.focus();
		return false;
	}
	if(frm.cls.value.length<1){
		alert("�༶����Ϊ��!");
		frm.cls.focus();
		return false;
	}
	if(frm.gra.value.length!=4||!IsInt(frm.gra.value)){
		alert("������4λ���������!");
		frm.gra.focus();
		return false;
	}
	if(frm.maj.value.length<1){
		alert("רҵ����Ϊ��!");
		frm.maj.focus();
		return false;
	}
	if(frm.gpa.value.length<1||isNaN(frm.code.value)==true){
		alert("��������ȷ�ļ���!");
		frm.gpa.focus();
		return false;
	}
	if(frm.tel.value.length<1){
		alert("�绰���벻��Ϊ��!");
		frm.tel.focus();
		return false;
	}
	return true;
}
</script>
