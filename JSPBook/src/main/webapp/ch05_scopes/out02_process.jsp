<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p> 아이디: <% out.println(request.getParameter("id")); %></p>
	<p> 비밀번호: <% out.println(request.getParameter("passwd")); %></p>
</body>
</html>