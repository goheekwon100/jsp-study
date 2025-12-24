<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 스크립틀릿 태그에 지역변수 사용하기 -->
	<!-- 스크립틀릿 태그: 자바 로직 코드를 작성하는데 사용 -->
	<%-- <%!%> 는 _jspService() 외부에 자바코드가 위치한다.--%>
	<!-- 메소드, 변수 선언 가능(전역에서 접근 가능) -->
	<%-- <%= %> 는 _jspService() 내부에 자바코드가 위치한다. --%>
	<!-- 메소드 선언불가, 변수 선언 가능(변수는 지역변수) -->
	<%!
		int a = 2; // 전역변수이기 때문에 새로고침시마다 1씩 증가
	%>
	
	<%
		// 지역변수 a, b
		// int a = 2;
		int b = 3;
		int sum = ++a + b;
		out.println("2 + 3 = " + sum);
	%>
	
</body>
</html>