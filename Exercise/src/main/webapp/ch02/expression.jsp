<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
09 표현문 태그를 이용하여 다음 조건에 맞게 JSP 애플리케이션을 만들고 실행 결과를 확인하시오.
1) expression.jsp 파일을 생성한다.
	• 표현문 태그에 java.util.Calendar 클래스를 이용하여 현재 시간을 출력한다.
2) 웹 브라우저에 'http://localhost:8080/Exercise/ch02/expression.jsp'를 입력하여 실행 결과를 확인한다.

<%
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy년MM월dd일 a HH시 mm분 ss초");

%>
<%=
Calendar.getInstance().getTime()
%>
</body>
</html>