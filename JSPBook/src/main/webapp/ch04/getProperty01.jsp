<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- useBean 액션 태그에 Person 클래스를 사용하여 아이디, 이름 출력하기 -->
	<jsp:useBean id="person" class="ch04.com.dao.Person" scope="request"></jsp:useBean>
	
	<p>아이디: <jsp:getProperty property="id" name="person"/></p>
	<p>이름: <jsp:getProperty property="name" name="person"/></p>
	 
</body>
</html>
