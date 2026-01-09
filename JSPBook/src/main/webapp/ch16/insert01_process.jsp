
<%@page import="java.net.FileNameMap"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
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
	<!-- 정적include: 소스코드 전체를 포함 -->
	<%@ include file="dbconn.jsp" %>
	
	<%
		String user_id = request.getParameter("id");
		String user_passwd = request.getParameter("passwd");
		String user_name = request.getParameter("name");
		
		Statement stmt = null;
		
		try {
			String sql = "INSERT INTO member (id, passwd, name) VALUE ('" + user_id + "', '" + user_passwd + "', '" + user_name + "')";
			
			stmt = conn.createStatement();
			stmt.executeUpdate(sql); // INSERT문 실행
			out.println("member 테이블 삽입에 성공했습니다.<br>");
		} catch (SQLException e) {
			out.println("member 테이블 삽입에 실패했습니다.<br>");
			out.println("SQLEXception: " + e.getMessage());
		} finally {
			if (stmt != null) stmt.close(); // null체크 항상 필수, 없는 코드는 지뢰밭
			if (conn != null) conn.close();
		}
	%>
	
</body>
</html>