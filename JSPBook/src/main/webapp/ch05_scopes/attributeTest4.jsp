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
	<!-- page 영역과 request 영역 비교 -->
	<%
		pageContext.setAttribute("pageScope", "pageValue");
		request.setAttribute("requestScope", "requestValue");
	%>

	<h3>값 출력</h3>
	pageValue = <%= pageContext.getAttribute("pageScope") %><br>	
	requestValue = <%= request.getAttribute("requestScope") %>
</body>
</html>