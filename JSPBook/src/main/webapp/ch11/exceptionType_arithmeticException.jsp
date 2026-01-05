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
	<p>0으로 나눌 수 없습니다.</p>
	<p>예외 유형: <%= exception.getClass().getName() %></p>
	<p>예외 메시지: <%= exception.getMessage() %></p>
	<p>예외 유형 + 예외 메시지: <%= exception.toString() %></p>
	
</body>
</html>