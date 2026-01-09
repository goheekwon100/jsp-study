<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>
	<%-- 문자열 분리하고 연결하기 --%>
	<p>java 문자열 분리</p>
	<c:set var="texts" value="${fn:split('Hello, Java Server Pages!', ' ')}" />
	<c:forEach var="split" items="${texts}">
		<c:out value="${split}" /> <br>
	</c:forEach>
	
	<c:forEach var="i" begin="0" end="${fn:length(texts) - 1}">
		<c:out value="${texts[i]}" /> <br>
	</c:forEach>
	
	<p>java 문자열 연결</p>
	<c:set var="joinTexts" value="${fn:join(texts, ' ')}" />
	<c:out value="${joinTexts}"></c:out>
</body>
</html>