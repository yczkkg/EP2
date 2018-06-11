<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
   Date dNow = new Date( );
   SimpleDateFormat ft = new SimpleDateFormat ("yyyyMMddHHmmss");
  // out.print( "<h2 align=\"center\">" + ft.format(dNow) + "</h2>");
   String time = ft.format(dNow);
   out.print(time);
%>
</body>
</html>