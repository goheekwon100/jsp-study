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
	<c:forTokens var="alphabet" items="a,b,c,d,e,f,g,h,i,j,k,l,m" delims=",">
		<b>${alphabet}</b>
	</c:forTokens>
	
	<c:set var="data" value="홍길동,김길동,고길동" />
	<c:forTokens var="varData" items="${data}" delims=",">
		<b>${varData}</b>
	</c:forTokens>
	
	
</body>
</html>