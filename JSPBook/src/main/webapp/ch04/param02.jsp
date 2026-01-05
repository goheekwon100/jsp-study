<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Action Tag</title>
</head>
<body>
	<!-- param 액션 태그로 제목과 현재 날짜 전달하기 -->
	<h3>param 액션 태그</h3>
	<jsp:forward page="param02_data.jsp">
		<jsp:param name="title" value="오늘의 날짜와 시각"/>
		<jsp:param name="date" value=<%= LocalDateTime.now() %>/>
	</jsp:forward>
	
	<!-- 사용 예: 주문 완료 후 주문 확인 페이지로 이동시 주문번호 및 주문 정보들 전달 -->
</body>
</html>