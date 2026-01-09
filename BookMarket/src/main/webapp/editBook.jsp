<%@page import="java.sql.SQLException"%>
<%@page import="dao.BookRepository"%>
<%@page import="dto.Book"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- session이 연결되는 동안 도서 데이터를 공유하기 위해 사용 -->
<%-- <jsp:useBean id="bookDAO" class="dao.BookRepository" scope="session"></jsp:useBean> --%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>도서<%= request.getParameter("edit").equals("delete") ? "삭제" : "수정" %></title>
	<!-- 부트스트랩 연결 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
	<!-- 로컬에서 직접 넣기 -->
	<!-- <link rel="stylesheet" href="resource/css/bookstrap.min.css"> -->
	<script type="text/javascript">
		function deleteConfirm(id) {
			if (confirm('해당 도서를 삭제합니다!!')) {
				window.location.href = './deleteBook.jsp?id=' + id;
			}
		}
	</script>

</head>
<body>
	<%
	String edit = request.getParameter("edit");
	%>
	<%@ include file="menu.jsp" %>
 	  <jsp:include page="title.jsp">
	  	<jsp:param name= "title" value = "도서편집"/>
   		<jsp:param name= "sub" value = "EditBook"/>
   	</jsp:include>
    
    <!-- 본문 영역 -->
    <%@ include file="dbconn.jsp" %>
    <div class="row align-items-md-stretch text-center">
    	<%
    		try {
    			String sql = "SELECT * from book";
    			pstmt = conn.prepareStatement(sql);
    			rs = pstmt.executeQuery();
    			
    			while (rs.next()) {
    			%>
    				<div class="col-md-4">
    	        <div class="h-100 p-2">
    	        	<img alt="도서이미지" src="<%= request.getContextPath() %>/images/<%= rs.getString("b_fileName") %>" style="width:250px; height:350px;">
    	        	
    	        	<h5><b><%= rs.getString("b_name") %>></b></h5>
    	        	<p>
    	        		<%= rs.getString("b_author") %>
    	        		<br>
    	        		<%= rs.getString("b_publisher")%> | <%= rs.getString("b_releaseDate")%>   
    	        	</p>
    	        	<p><%= rs.getString("b_description").substring(0, 60) %>...</p>
    	        	<p><%= rs.getString("b_unitPrice") %>원</p>
    	        	<p>
    	        		<% if ("update".equals(edit)) { %>
    	        			<a href="./updateBook.jsp?id=<%=rs.getString("b_id") %>" class="btn btn-success" role="button">
    	        				수정 &raquo;
    	        			</a>
    	        		<% } else if ("delete".equals(edit)) { %>
    	        			<a href="javascript:void(0)" class="btn btn-danger" role="button"
    	        					onclick="deleteConfirm('<%= rs.getString("b_id") %>')">
    	        				삭제 &raquo;
    	        			</a>
    	        		<% } %>
    	        	</p>
    	        </div>
    	  		</div>
    	  <%
    			}
    		} catch (SQLException e) {
    				out.println(e.getMessage());
    		} finally {
    			if (rs != null) rs.close();
    			if (pstmt != null) pstmt.close();
    			if (conn != null) conn.close();
    		}
    		
    		
    	%>
      
 		</div>
 		
 		<!-- 푸터(바닥글) 영역 -->
		<%@ include file="footer.jsp" %>
</body>
</html>