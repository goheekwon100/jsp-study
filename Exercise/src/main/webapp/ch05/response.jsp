<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 09 response 내장 객체를 이용하여 다음 조건에 맞게 JSP 애플리케이션을 만들고 실행 결과를 확인하시오.
1) response.jsp 파일을 생성한다.
	• response 내장 객체의 setHeader() 메소드를 이용하여 5초마다 페이지를 갱신하도록 작성한다.
	• 날짜 관련 클래스를 이용하여 현재 시간을 출력하도록 작성한다.
	• 'Google 홈페이지로 이동하기'를 클릭하면 response_data.jsp 파일을 연결하도록 작성한다.
2) response_data.jsp 파일을 생성한다.
	• response 내장 객체의 sendRedirect() 메소드를 이용하여 구글 홈페이지로 이동하도록 작성한다.
3) 웹 브라우저에 'http://localhost:8080/Exercise/ch05/response.jsp'를 입력하여 실행 결과를 확인한다. -->

	<%
		response.setHeader("Refresh", "5");
		
		out.print(LocalDateTime.now());
	%>
	<a href="./response_data.jsp"><button type="button">Google 홈페이지로 이동하기</button></a>

</body>
</html>