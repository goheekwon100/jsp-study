<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- use Bean 액션 태그에 Person 클래스를 사용하여 아이디, 이름 출력하기 -->
	<jsp:useBean id="person" class="ch04.com.dao.Person" scope="request"></jsp:useBean>
	
	<jsp:setProperty name="person" property="id" value="20251010"/>
	<jsp:setProperty name="person" property="name" value="고길동"/>
	
	<p>아이디: <jsp:getProperty name="person" property="id"/></p>
	<p>이름: <jsp:getProperty name="person" property="name"/></p>
	
	<!-- EL표현언어 -->
	<p>아이디: ${person.id }</p>
	<p>이름: ${person.name }</p>
</body>
</html>