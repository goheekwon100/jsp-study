
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Action Tag</title>
</head>
<body>
	<!-- forward 액션 태그로 현재 날짜와 시간을 출력하는 페이지로 이동하기 -->
	<!-- 현재 페이지의 요청과 응답에 관한 처리권을 이동할 페이지로 영구적으로 넘김
		=> 원래 페이지에서 생성된 request,reponse객체가 그대로 넘어감
	-->
	
	
	<h2>foward 액션 태그</h2>
	<jsp:forward page="foward_date.jsp" />
	<p> ------------------------------------- </p>
</body>
</html>
