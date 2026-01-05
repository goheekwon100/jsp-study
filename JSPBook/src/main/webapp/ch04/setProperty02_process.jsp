<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="person" class="ch04.com.dao.Person" scope="request"></jsp:useBean>
	
	<!-- 클라이언트에서 전송되어 오는 요청 파라미터 값을 속성 값으로 할당할 경우 value 대신 param을 사용 -->
	<%-- <jsp:setProperty property="id" name="person" param="id"/>	 
	<jsp:setProperty property="name" name="person" param="name"/> --%>
	<!-- 요청 파라미터 name 속성의 값과 자바빈 객체의 속성명이 같으면
		자동으로 매핑되어 저장되므로 param 생략 가능 -->
	<jsp:setProperty property="id" name="person"/>	 
	<jsp:setProperty property="name" name="person"/>
	<!-- 파라미터 자동수집, 자동매핑 -->
	
	<p>아이디: <jsp:getProperty property="id" name="person"/></p>
	<p>이름: <jsp:getProperty property="name" name="person"/></p>
</body>
</html>