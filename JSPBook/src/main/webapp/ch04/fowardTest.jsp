<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Action Tag</title>
</head>
<body>
	=<h2>forward 액션 테스트</h2>
	<form action="forwardTest1.jsp" method="post">
		<input type="hidden" name="forwardPage" value="forwardTest2.jsp">
	</form>
</body>
</html>