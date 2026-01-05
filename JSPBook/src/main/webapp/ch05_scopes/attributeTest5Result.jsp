<%@page import="java.util.Enumeration"%>
<%@page import="org.apache.jasper.runtime.JspApplicationContextImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pageContext Test</title>
</head>
<body>
	<h3>Result 값 출력</h3>
	pageValue = <%= pageContext.getAttribute("pageScope") %><br>	
	requestValue = <%= request.getAttribute("requestScope") %>
</body>
</html>