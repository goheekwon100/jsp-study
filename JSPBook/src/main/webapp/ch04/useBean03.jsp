<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- use Bean 액션 태그에 Calculator 클래스를 사용하여 숫자 출력하기 -->
	<jsp:useBean id="person" class="ch04.com.dao.Person" scope="request"></jsp:useBean>
	<p> 아이디: <%= person.getId() %></p>
	<p> 이름: <%= person.getName() %></p>
</body>
</html>