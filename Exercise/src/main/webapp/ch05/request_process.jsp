<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	• request 내장 객체의 getQueryString() 메소드를 이용하여 전송된 요청 파라미터와 값을 출력한다.
	<%
		String str = request.getQueryString();
		out.print(str);
	%>
</body>
</html>