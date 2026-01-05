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
	<jsp:useBean id="calc" class="ch04.com.dao.Calculator"></jsp:useBean>
	<b>10의 제곱은?</b>
	<%= calc.process(10) %>
</body>
</html>