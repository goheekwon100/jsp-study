<%@page import="org.apache.tomcat.util.http.parser.HttpHeaderParser.HeaderDataSource"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- core: 기본적인(핵심적인) 기능을 모아둔 파트
		예: 문자열 출력 기능, 변수설정, 조건문, 반복문  -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 요청 헤더를 변수에 설정하고 설정한 변수 삭제하기 -->
	변수 값 설정(scope 속성을 명시하지 않은면 기본 스코프는 page)
	<c:set var="browser" value="${header['User-Agent']}"/>
	<%-- 자바코드: pageContext.setAttribute("browser", request.getHeader("User-Agent")); --%>
	
	<br>
	<%-- <c:out>: 기본적으로 XML/HTML escape 처리를 수행하여, 스크립트 삽입 공격(XSS)을 방지 --%>
	<c:out value="${browser}" />
	
	<br>
	 
	<%-- (테스트) <c:out>과 단순 출력의 차이점 --%>
	<c:set var="escapeTest" value="<script>alert('해킹')</script>"></c:set>
	${escapeTest}
	<c:out value="${escapeTest}"/>
	
	<p>
		browser 변수 제거 후
		<c:remove var="browser" /> <!-- scope 지젖ㅇ하지 않은 경우: 순차검색을 통해 가장 먼저 발견도니 scope에서만 삭제 -->
		<c:out value="${browser}" />
	</p>
</body>
</html>