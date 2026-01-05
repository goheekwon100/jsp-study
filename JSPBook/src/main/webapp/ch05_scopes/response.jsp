<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- response 내장 객체 사용 예: 페이지 이동하기 -->
	<!-- Redirect: 클라이언트(브라우저)에게 다른페이지로 재요청할 것을 응답으로 보냄  -->
	<%
		response.sendRedirect("http://www.naver.com");
	%>
</body>
</html>