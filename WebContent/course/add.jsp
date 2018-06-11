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
<title>课程添加</title>
<link rel="stylesheet" type="text/css" href="<%=path%>/css/student.css">
<script type="text/javascript" src = "<%=path%>/js/datacheck.js"></script>
</head>
<body>
 <center>	
    <form name="frm" method="post" action="<%=path%>/servlet/CourseInsertAction">								 
   <table border="1">
		<tr class="td_header">
		<td colspan="2"> 课程信息录入<span class="star">*</span>为必填项</td>
		</tr>
		
		<tr>
		<td>课程名称</td><td><input type="text" name="name" value="" size="20" maxlength="20"><span class="star">*</span>20位字符</td>
		</tr>
		
		<tr>
		<td>教学班级</td><td><input type="text" name="cls" value="" size="20" maxlength="10"><span class="star">*</span>10位字符</td>
		</tr>
		
		<tr>
		<td>开设年级</td><td><input type="text" name="grade" value="" size="20" maxlength="4"><span class="star">*</span>4位数年份</td>
		</tr>
		
		<tr>
		<td>开设专业</td><td><input type="text" name="major" value="" size="20" maxlength="10"><span class="star">*</span>10位字符</td>
		</tr>
		
		<tr>
		<td>学分</td><td><input type="text" name="credit" value="" size="20" maxlength="10"><span class="star">*</span>数值</td>
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
	if(frm.name.value.length<1){
		alert("课程名称不能为空!");
		frm.name.focus();
		return false;
	}
	if(frm.name.value.length>20){
		alert("请输入20位字符以内的课程名称!");
		frm.name.focus();
		return false;
	}
	if(frm.cls.value.length<1){
		alert("班级不能为空!");
		frm.cls.focus();
		return false;
	}
	if(frm.grade.value.length!=4||!IsInt(frm.grade.value)){
		alert("请输入4位整数的年份!");
		frm.grade.focus();
		return false;
	}
	if(frm.major.value.length<1){
		alert("专业名称不能为空!");
		frm.major.focus();
		return false;
	}
	if(frm.credit.value.length<1||isNaN(frm.code.value)==true){
		alert("请输入正确的学分数值!");
		frm.credit.focus();
		return false;
	}
	return true;
}

</script>