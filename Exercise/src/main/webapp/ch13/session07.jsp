<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session</title>
</head>
<body>
	<!-- 세션 유지시간 설정하기 -->
	<h4>----- 세션 유지시간 변경 전 유지시간 확인 -----</h4>
	<%
		int time = session.getMaxInactiveInterval();
		
		out.println("유지시간: " + time + "초");
	%>
	
	<h4>----- 세션 유지시간 3초로 설정하기 -----</h4>
	<%
		int interval = 3;
		session.setMaxInactiveInterval(interval);
		time = session.getMaxInactiveInterval();
		
		out.println("유지시간: " + time + "초<br>");
		out.println(session.getId());
	%>
</body>
</html>