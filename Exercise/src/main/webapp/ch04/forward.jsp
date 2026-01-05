<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>구구단 출력하기</h4>
	<jsp:forward page="forward_data.jsp">
		<jsp:param value="5" name="dan"/>
	</jsp:forward>
		• forward 액션 태그로 구구단을 출력하는 forward_data.jsp 파일로 이동하도록 작성한다.
		• param 액션 태그로 숫자 5를 forward_data.jsp 파일에 전달하도록 작성한다.
</body>
</html>