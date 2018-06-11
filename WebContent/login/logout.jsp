<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注销跳转</title>
</head>
<body>
	注销session：<%=session.getId() %><br>/*属性：<%=session.getAttribute("userid") %>*/
	<%  
   session.invalidate(); // 注销 session   
   response.sendRedirect(request.getContextPath()+"/index.jsp");
  %>  
</body>
</html>