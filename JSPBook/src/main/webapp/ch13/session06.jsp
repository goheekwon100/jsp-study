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
	<!-- 세션에 저장된 모든 속성 삭제하기(세션무효화) -->
	<h4>----- 세션을 삭제하기 전 -----</h4>
	<%
		String name;
		String value;
		
		Enumeration<String> en = session.getAttributeNames();
		int i = 0;
		
		while (en.hasMoreElements()) {
			i++;
			name = en.nextElement();
			value = session.getAttribute(name).toString(); 
			out.println("설정된 세션의 속성 이름 [" + i + "]: " + name + "<br>");
			out.println("설정된 세션의 속성 값 [" + i + "]: " + value + "<br>");
		}
		
		// 클라이언트가 쿠키에 담아 보낸 세션ID가
		// 현재 서버에서 유효한지(그 ID에 대응되는 세션 객체가 존재한는지) 확인하는 메소드
		if (request.isRequestedSessionIdValid()) {
			out.print("세션이 유효합니다.");
		}else {
			out.print("세션이 유효하지 않습니다.");
		}

		out.print("세션 아이디: " + session.getId());
		
		// 모든 세션 속성 삭제 및 세션 무효화
		// 
		session.invalidate();
		
	%>
	
	<h4>----- 세션을 삭제한 후 -----</h4>
	<%
		if (request.isRequestedSessionIdValid()) {
			out.print("세션이 유효합니다.");
			en = session.getAttributeNames();
			i = 0;
			
			while (en.hasMoreElements()) {
				i++;
				name = en.nextElement();
				value = session.getAttribute(name).toString(); 
				out.println("설정된 세션의 속성 이름 [" + i + "]: " + name + "<br>");
				out.println("설정된 세션의 속성 값 [" + i + "]: " + value + "<br>");
			}
		} else {
			out.print("세션이 유효하지 않습니다.");
		}
	%>
</body>
</html>