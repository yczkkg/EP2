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
<title>学生信息添加</title>
<link rel="stylesheet" type="text/css" href="<%=path%>/css/student.css">
<script type="text/javascript" src = "<%=path%>/js/datacheck.js"></script>
</head>
<body>
<center>	
    <form name="frm" method="post" action="<%=path%>/servlet/CourseInsertAction">								 
   <table border="1">
		<tr class="td_header">
		<td colspan="2"> 学生信息录入<span class="star">*</span>为必填项</td>
		</tr>
				
		<tr>
		<td>学号</td><td><input type="text" name="num" value="" size="20" maxlength="10"><span class="star">*</span>10位数字</td>
		</tr>
		
		<tr>
		<td>姓名</td><td><input type="text" name="name" value="" size="20" maxlength="10"><span class="star">*</span>10位字符以内</td>
		</tr>
		
		<tr>
		<td>性别</td><td><input type="radio" name="sex" value="1" checked>男<input type="radio" name="sex" value="0">女<span class="star">*</span></td>
		</tr>
		
		<tr>
		<td>出生日期</td><td><input type="text" name="bir" value="" size="20" maxlength="8"><span class="star">*</span>8位字符，例如19980101</td>
		</tr>
		
		<tr>
		<td>所在班级</td><td><input type="text" name="cls" value="" size="20" maxlength="4"><span class="star">*</span>10位以内字符</td>
		</tr>
		
		<tr>
		<td>所在年级</td><td><input type="text" name="gra" value="" size="20" maxlength="4"><span class="star">*</span>4位数年份</td>
		</tr>
		
		<tr>
		<td>所在专业</td><td><input type="text" name="maj" value="" size="20" maxlength="10"><span class="star">*</span>10位以内字符</td>
		</tr>
		
		<tr>
		<td>绩点</td><td><input type="text" name="gpa" value="" size="10" maxlength="4"><span class="star">*</span>数值</td>
		</tr>
		
		<tr>
		<td>电话号码</td><td><input type="text" name="tel" value="" size="20" maxlength="11"><span class="star">*</span>11位以内数值</td>
		</tr>
		
		<tr>		
		<td colspan="2" align="center"><input type="submit"  value="提交" onclick="return check();">
		<input type="reset"  value="重填"></td>
		</tr>
		</table>
   </form>
   </center>
</body>
</html>
<script language="JavaScript">
function check(){
	if(frm.num.value.length!=10){
		alert("请输入10位数学号!");
		frm.num.focus();
		return false;
	}
	if(frm.name.value.length<1){
		alert("姓名不能为空!");
		frm.name.focus();
		return false;
	}
	if(frm.bir.value.length!=8){
		alert("请输入正确的出生日期!");
		frm.bir.focus();
		return false;
	}
	if(frm.cls.value.length<1){
		alert("班级不能为空!");
		frm.cls.focus();
		return false;
	}
	if(frm.gra.value.length!=4||!IsInt(frm.gra.value)){
		alert("请输入4位整数的年份!");
		frm.gra.focus();
		return false;
	}
	if(frm.maj.value.length<1){
		alert("专业不能为空!");
		frm.maj.focus();
		return false;
	}
	if(frm.gpa.value.length<1||isNaN(frm.code.value)==true){
		alert("请输入正确的绩点!");
		frm.gpa.focus();
		return false;
	}
	if(frm.tel.value.length<1){
		alert("电话号码不能为空!");
		frm.tel.focus();
		return false;
	}
	return true;
}
</script>
