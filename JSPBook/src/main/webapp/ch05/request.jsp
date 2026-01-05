<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- request 내장 객체 사용 예: 요청 파라미터 값 출력하기 -->
	<form action="process.jsp" method="post">
		<p>이름: <input type="text" name="name"></p>
		<button type="submit">전송</button>
		
	</form>
</body>
</html>