<%@page import="java.util.Enumeration"%>
<%@page import="dao.BookRepository"%>
<%@page import="dto.Book"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- session이 연결되는 동안 도서 데이터를 공유하기 위해 사용 -->
<%-- <jsp:useBean id="bookDAO" class="dao.BookRepository" scope="session"></jsp:useBean> --%>
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
<title>도서목록</title>
<!-- 부트스트랩 연결 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- 로컬에서 직접 넣기 -->
<!-- <link rel="stylesheet" href="resource/css/bookstrap.min.css"> -->
<script>
	
</script>
</head>
<body>
	<!-- 장바구니 뷰 페이지 작성하기 -->
	<%
		String cartId = session.getId(); // 세션 ID 얻기(장바구니 ID로 사용함)
		
		// 세션ID가 있으나 장바구니가 비어있다면? 리다이렉트 및 alert?
		
	%>
	
	<div class="container py-4">
		<%@ include file="menu.jsp" %>
  	  <jsp:include page="title.jsp">
 	  	<jsp:param name= "title" value = "장바구니"/>
    	<jsp:param name= "sub" value = "Cart"/>
    </jsp:include>
    
    <div class="row align-items-md-stretch">
	    <div class="row">
	    	<table width="100%">
	    		<tr>
	    			<td align="left">
	    				<a href="./deleteCart.jsp?cartId=<%= cartId %>" class="btn btn-danger">삭제하기</a>
	    			</td>
	    			<td align="right">
	    				<a href="./shippingInfo.jsp?cartId=<%= cartId %>" class="btn btn-success">주문하기</a>
	    			</td>
					</tr>	    			
	    	</table>
	    </div>
    </div>
    
    <div style="padding-top: 50px">
    	<table class="table table-hover">
    		<tr>
    			<th>도서</th>
    			<th>가격</th>
    			<th>수량</th>
    			<th>소계</th>
    			<th>비고</th>
    		</tr>
    		<%
    			// Quiz 세션에 저장된 장바구니 정보 가져오기
        	int totalPrice = 0;	
    		
    			ArrayList<Book> cartList = (ArrayList<Book>) session.getAttribute("cartlist");
    			
    			if (session.getAttribute("cartlist") == null) {
       			cartList = new ArrayList<Book>();
    				out.print("<td colspan='5'>");
       			out.print("장바구니 정보가 없습니다.");
       			out.print("</td>");
    			}
    			
    			for (Book item : cartList) {
    		%>
    			<tr>
						<td> <%= item.getBookId() + "-" + item.getName() %> </td>
						<td> <%= item.getUnitPrice() %> </td>
						<td> <%= item.getQuantity() %> </td>
						<td> <%= item.getUnitPrice() * item.getQuantity() %> </td>
						<td> <a href='removeCart.jsp?id=<%= item.getBookId() %>' class="badge text-bg-danger">삭제</a> </td>
					</tr>
        <%
        	totalPrice += item.getUnitPrice() * item.getQuantity();
    			}
    		%>
    		
    		<tr>
    			<th></th>
    			<th></th>
    			<th>총액</th>
    			<th><%= totalPrice %></th>
    			<th></th>
    		</tr>
    	</table>
    </div>
    <a href="books.jsp" class="btn btn-secondary">쇼핑 계속하기 &raquo;</a>
 		
 	</div>
 		<!-- 푸터(바닥글) 영역 -->
		<%@ include file="footer.jsp" %>
</body>
</html>