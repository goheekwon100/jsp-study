<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		Enumeration<String> paramNames = request.getParameterNames();
		StringBuffer sb = new StringBuffer();
		while (paramNames.hasMoreElements()) {
			String paramName = paramNames.nextElement();
			sb.append(paramName + request.getParameter(paramName));
		}		
		out.print(sb.toString());
	%>
</body>
</html>