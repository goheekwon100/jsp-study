
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
	<!-- Statement 객체로 SELECT 쿼리문 실행 결과 값 가져오기 -->
	<%@ include file="dbconn.jsp" %>
	
	<table border="1" style="width: 300px">
		<tr>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
		</tr>
		<%
			ResultSet rs = null;
			Statement stmt = null;
			
			try {
				String sql = "SELECT * FROM member";
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				
				while (rs.next()) {
						
					%>
					<tr>
						<td><%= rs.getString("id") %></td>
						<td><%= rs.getString("passwd") %></td>
						<td><%= rs.getString("name")%></td>		
					</tr>
					
					<%
					
				}				
			} catch (SQLException e) {
				out.println("SQLEXception: " + e.getMessage());
			} finally {
				if (stmt != null) stmt.close(); // null체크 항상 필수, 없는 코드는 지뢰밭
				if (conn != null) conn.close();
			}
		%>	
		
	</table>
	
	
</body>
</html>