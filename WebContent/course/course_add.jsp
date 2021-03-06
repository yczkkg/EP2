<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%String path = request.getContextPath(); %>
<link rel="stylesheet" type="text/css" href="<%=path%>/css/csmallp.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/css/iconsfly.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/css/coursecss.css">
<title>添加一门新课程</title>
</head>
<body>
	<div class="topbar"><a style="font-size:25px;color:#fff;text-decoration:none;" href="javascript:history.back(-1);">&lt返回</a></div>
	<div class="epagechange">
	<center>
	<div style="margin-top:45px;">
		<form name="frm" method="post" action="<%=path%>/servlet/CourseInsertAction"><!-- 提交数据的servlet -->
			<table>
				<tr><td colspan="3" align="center">添加课程</td></tr>
				<tr><td style="width:80px;">课程名称：</td><td style="width:120px;"><input type="text" name="course_name" value="" size="20" maxlength="20"></td><td style="width:120px;"></td></tr>
				<tr><td>教学班级：</td><td><input type="text" name = "cls" value=""></td><td></td></tr>
				<tr><td>开设年级：</td><td><input type="text" name="grade" value="" size="20" maxlength="4"></td><td></td></tr>
				<tr><td>开设专业：</td><td><input type="text" name = "major" value=""></td><td></td></tr>
				<tr><td>学分：</td><td><input type="text" name = "credit" value="" size = "20" maxlength ="2"></td><td></td></tr>
				<tr><td>课程性质</td><td><select name="type" size='1' ><option value='1' selected>公共基础必修课</option>
   													  <option value='2' >公共选修课</option>
   													  <option value='3' >学科基础课</option>
   													  <option value='4' >专业必修课</option>
   													  <option value='5' >专业选修课</option>
   													  <option value='6' >集中性实践教学环节</option>
   													  </select><td></td></tr>
   				<tr><td>主讲导师</td><td><input type="text" name = "teacher" value=""></td><td></td></tr>
				<tr><td>预定课程人数：</td><td><input type="text" name = "stuNum" value="" size = "20"></td><td></td></tr>
				<tr><td colspan="3" align="center"><input type="reset" value="重置所有信息" style="border:0;color:#fff;background-Color:#315183;">&nbsp&nbsp&nbsp&nbsp&nbsp
				<input type="submit" value="提交添加课程" style="border:0;color:#fff;background-Color:#315183;" onclick="return Addnew()"></td></tr>
			</table>
		</form>
	</div>
	</center>
	</div>
</body>
<script>
function Addnew(){
	if(window.confirm("新建如上的课程信息吗？")){
		if(frm.course_name.value.length<1||frm.course_name.value.length>40){
			alert("请输入课程名称!");
			frm.course_name.focus();
			return false;
		}
		if(frm.cls.value.length==0){
			alert("请输入课程教学班级!");
			frm.cls.focus();
			return false;
		}
		if(frm.grade.value.length!=4||isNaN(frm.grade.value)){
			alert("请输入4位整数的年份!");
			frm.grade.focus();
			return false;
		}
		if(frm.major.value.length==0){
			alert("请输入课程开设专业!");
			frm.major.focus();
			return false;
		}
		if(frm.credit.value.length==0||isNaN(frm.credit.value)){
			alert("请输入正确的学分数值!");
			frm.credit.focus();
			return false;
		}
		if(frm.teacher.value.length==0){
			alert("请输入主讲导师姓名!");
			frm.teacher.focus();
			return false;
		}
		if(frm.stuNum.value.length==0||isNaN(frm.stuNum.value)){
			alert("请输入正确的学生人数!");
			frm.stuNum.focus();
			return false;
		}
		return true;
	}
	return false;
}
</script>
</html>