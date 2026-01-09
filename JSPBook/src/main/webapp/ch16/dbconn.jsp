
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- JDBC API로 데이터베이스 접속하기 -->
	<%
		Connection conn = null;
		
		String url = "jdbc:mysql://localhost:3306/jspbookdb";
		String user = "root";
		String password = "test1234";
		
		try {
			// JDBC 드라이버 로딩
			Class.forName("com.mysql.cj.jdbc.Driver");
			// 생성된 객체 이용해서 DB연결
			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			out.println("Exception: " + e.getMessage());
		}
		
		
		
	%>
</body>
</html>