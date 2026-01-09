<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="number" value="${param.number}" />
	
	<!-- 다중 조건문: 자바의 if, if-else 문과 유사 -->
	<!-- 연산시 el이 자동으로 형변환 -->
	<c:choose>
		<c:when test="${number % 2 == 0}">
			<c:out value="${number}" />는 짝수입니다.
		</c:when>
		<c:when test="${number % 2 == 1}">
			<c:out value="${number}" />는 홀수입니다.
		</c:when>
		<c:otherwise>
			숫자가 아닙니다.
		</c:otherwise>
	</c:choose>
</body>
</html>