<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Action Tag</title>
</head>
<body>
	<!-- param 액션 태그로 아이디와 이름 전달하기 -->
	<h3>param 택션 태그</h3>
	<jsp:forward page="param01_data.jsp">
		<jsp:param name="id" value="admin"/>
		<jsp:param name="name" value="관리자"/>
	</jsp:forward>
	
	<!-- 사용 예: 주문 완료 후 주문 확인 페이지로 이동시 주문번호 및 주문 정보들 전달 -->
</body>
</html>