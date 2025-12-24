<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
08 스크립틀릿 태그를 이용하여 다음 조건에 맞게 JSP 애플리케이션을 만들고 실행 결과를 확인하시오.
1) scriptlet.jsp 파일을 생성한다.
	• 스크립틀릿 태그를 이용하여 java.util.Date 형 지역변수에 현재 날짜를 저장한다.
	• 현재 날짜 값을 출력한다.
2) 웹 브라우저에 'http://localhost:8080/Exercise/ch02/scriptlet.jsp'를 입력하여 실행 결과를 확인한다.<br>

<%
	java.util.Date date = new java.util.Date();
	out.println(date);
%>
</body>
</html>