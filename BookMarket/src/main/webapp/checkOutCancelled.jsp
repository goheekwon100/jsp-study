<%@page import="java.net.URLDecoder"%>
<%@page import="java.util.Arrays"%>
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

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 취소</title>
<!-- 부트스트랩 연결 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
	<!-- 주문 취소 페이지 작성하기 -->
	<div class="container py-4">
		<%@ include file="menu.jsp" %>
    
    <jsp:include page="title.jsp">
    	<jsp:param value="주문 취소" name="title"/>
    	<jsp:param value="Order Cancellation" name="sub"/>
    </jsp:include>
    
    <div class="row align-items-md-stretch">
    	<h2 class="alert alert-danger"> 주문이 취소되었습니다...</h2>
 		</div>
 		<div class="container">
 			<p>
 				<a href="./books.jsp" class="btn btn-secondary">&laquo; 도서 목록</a>
 			</p>
 		</div>
 		
 	</div>
 	
 		<!-- 푸터(바닥글) 영역 -->
		<%@ include file="footer.jsp" %>
		
		<%
			// 세션에 저장된 장바구니 정보를 모두 삭제하도록 작성
			// 장바구니 정보만 제거하고 로그인은 유지하려면 특정 속성만 삭제
			// 쿠키에 저장된 배송 정보를 모두 삭제
			
			Cookie[] cookies = request.getCookies();
			if (cookies != null) {
				for (Cookie cookie : cookies) {
					if (cookie.getName().startsWith("Shipping_")) {
						cookie.setMaxAge(0);
						response.addCookie(cookie);
					}
				}
			}
			
			
			
		%>
</body>
</html>