<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- page 디렉티브 태그에 Date클래스를 이용하여 현재 날짜 출력하기 -->
	<%= new java.util.Date() %> <br>
	<%= new Date() %><br>
	<%= LocalDate.now() %> <br>
</body>
</html>