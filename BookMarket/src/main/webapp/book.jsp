<%@page import="java.sql.SQLException"%>
<%@page import="dao.BookRepository"%>
<%@page import="dto.Book"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page errorPage="exceptionNoBookId.jsp" %>

<!-- session이 연결되는 동안 도서 데이터를 공유하기 위해 사용 -->
<%-- <jsp:useBean id="bookDAO" class="dao.BookRepository" scope="session" /> --%>
<%
	// BookRepository 공유 객체로 변경
	// 왜? 자바빈을 쓰면 해당 객체가 scope 내에 존재하면 재사용하고
	// 존재하지 않으면 새롭게 생성하기 때문에 객체 내 데이터가 불일치가 발생
	BookRepository bookDAO = BookRepository.getInstance();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>도서 정보</title>
	<!-- 부트스트랩 연결 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
	
	<script type="text/javascript">
		function addToCart() {
			if (confirm('도서를 장바구니에 추가하시겠습니까?')) {
				document.addForm.submit();
			} else {
				document.addForm.reset();
			}
		}
	</script>
</head>
<body>
	<div class="container py-4">
		<%@ include file="menu.jsp" %>
    
    <jsp:include page="title.jsp">
    	<jsp:param value="도서정보" name="title"/>
    	<jsp:param value="BookInfo" name="sub"/>
    </jsp:include>
    
    <%@ include file="dbconn.jsp" %>
    
    <%
			String bookId = request.getParameter("id");
    	
    	try {
    		String sql = "SELECT * FROM book WHERE b_id = ?";
        	pstmt = conn.prepareStatement(sql);
        	pstmt.setString(1, bookId);
        	rs = pstmt.executeQuery();
        	
        	if (rs.next()) { %>
    				<div class="row align-items-md-stretch">
    		    	<div class="col-md-5">
    		    		<img alt="도서이미지" src="<%= request.getContextPath() %>/images/<%= rs.getString("b_filename") %>" style="width:70%;">
    		    	</div>
    		    
    		      <div class="col-md-6">
    		      	<h3><b><%= rs.getString("b_name") %></b></h3>
    						<p><%= rs.getString("b_description").subSequence(0, 60) + "<br>" +  rs.getString("b_description").subSequence(61, 120)%></p>
    						<p>
    							<b>도서코드</b>: <span class="badge text-bg-danger"><%= rs.getString("b_id") %></span>
    						</p>							
    						<p>
    							<b>저자</b>: <%= rs.getString("b_author")%>
    						</p>	
    						<p><b>출판사</b>: <%= rs.getString("b_publisher") %></p>	
    						<p><b>출판일</b>: <%= rs.getString("b_releaseDate") %></p>
    						<p><b>분류</b>: <%= rs.getString("b_category") %></p>
    						<p><b>재고수</b>: <%= rs.getString("b_unitsInStock") %></p>
    						<h4><%= rs.getString("b_unitPrice") %> 원</h4>
    						<form action="./addCart.jsp" method="post" name="addForm">
    							<input type="hidden" name="id" value = <%= rs.getString("b_id") %>>
    							<a href="#" class="btn btn-info" onclick="addToCart()">도서주문 &raquo;</a>
    							<a href="./cart.jsp" class="btn btn-warning">장바구니 &raquo;</a>					 
    							<a href="./books.jsp" class="btn btn-secondary">도서목록 &raquo;</a>
    						</form>
    		      </div>
    		 		</div>    		
        		
        	<% }
    	} catch (SQLException e) {
    		out.println("SQLException: " + e.getMessage()); 
    	} finally {
    		if (rs != null) rs.close();
    		if (pstmt != null) pstmt.close();
    		if (conn != null) conn.close();
    	}
		%>
    	
    
    
 		
 		<!-- 푸터(바닥글) 영역 -->
   	<%@ include file="footer.jsp" %>
	</div>
</body>
</html>