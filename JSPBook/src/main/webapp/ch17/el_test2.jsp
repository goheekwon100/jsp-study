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
		request.getParameter("name");
		session.getAttribute("test");		
	%>
	
	<h3>${sessionScope.test}</h3>
	<h3>${param.name}</h3>
	
	<!-- 테스트: 스코프 미지정 시 -->
	<!-- EL 검색 순서: page -> request -> session -> application -->
</body>
</html>