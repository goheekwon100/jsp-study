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
	
	<%
		person.setId(20250101);
		person.setName("고길동");
	%>
	<!-- scope가 request 이기 때문에, 이 수정된 person 객체는
		같은 요청(request) 안에서는 다른 JSP 페이지에서도 그대로 공유됨
	  -->
	  
	  
	
	<jsp:include page="useBean03.jsp"></jsp:include>
</body>
</html>