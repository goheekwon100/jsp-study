<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		out.println("fillInStackTrace(): " + exception.fillInStackTrace() + "<br>");
		
		out.println("getClass.descriptorString(): " + exception.getClass().descriptorString() + "<br>");
		
		out.println("getClass.descriptorString(): " + exception.getClass().getCanonicalName() + "<br>");
		out.println("getClass.descriptorString(): " + exception.getClass().getPackageName() + "<br>");
		out.println("getClass.descriptorString(): " + exception.getClass().getSimpleName() + "<br>");
		out.println("getClass.descriptorString(): " + exception.getClass().getTypeName() + "<br>");
		out.println("fillInStackTrace(): " + exception.fillInStackTrace() + "<br>");
		out.println(": " + exception.getStackTrace() + "<br>");
		out.println(": " + exception.getSuppressed() + "<br>");
	%>
	
</body>
</html>