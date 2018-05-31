<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Insert title here</title>
</head>
<body>
<%
for(int i=0;i<3;i++){
	out.print(i);
	for(int j=0;j<3-2*i+1;j++){
		out.print("&nbsp;");
	}
	for(int j=0;j<2*i+1;j++){
		out.print("*");
	}
	out.println();
}
%>
</body>
</html>