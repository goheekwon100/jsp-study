<%@page import="java.sql.SQLException"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.tomcat.jakartaee.commons.lang3.ArrayUtils"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BookRepository"%>
<%@page import="dto.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>도서 삭제</title>
</head>
<body>
	<!-- 도서 삭제 처리 페이지-->
	<%@ include file="dbconn.jsp" %>
	
	<%
		String book_id = request.getParameter("id");
	
		if (book_id != null) {
			try {
				int result;
				String sql ="DELETE FROM book WHERE b_id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, book_id);
				result = pstmt.executeUpdate();
				
				if (result > 0) {
					response.sendRedirect("editBook.jsp?edit=delete");
				} else {
					out.println("<script>alert('일치하는 도서가 없습니다.')</script>");
					response.sendRedirect("editBook.jsp?edit=delete");
				}
			} catch (SQLException e) {
				out.println("SQLException: " + e.getMessage() + "<br>");
			} finally {
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			}
		}
		
	%>
</body>
</html>