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
<title>배송 정보</title>
<!-- 부트스트랩 연결 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- 로컬에서 직접 넣기 -->
<!-- <link rel="stylesheet" href="resource/css/bookstrap.min.css"> -->
<script>
	
</script>
</head>
<body>
	<!-- 배송정보 페이지 -->
	<%
		String cartId = request.getParameter("cartId");
	%>
	
	<div class="container py-4">
		<%@ include file="menu.jsp" %>
  	  <jsp:include page="title.jsp">
 	  	<jsp:param name= "title" value = "배송정보"/>
    	<jsp:param name= "sub" value = "Shipping Info"/>
    </jsp:include>
    
    <!-- post: request 요청 http body 부분 -->
    
    <div class="row align-items-md-stretch">
	    <form action="./processShippingInfo.jsp" method="post">
	    	<!-- Quiz 카트 아이디 같이 전송필요 -->
	    	<input type="hidden" name="cartId" value="<%= cartId %>">
	    	
	    	<div class="mb-3 row">
					<label class="col-sm-2">성명</label>
					<div class="col-sm-3">
						<input type="text" name="name" class="form-control">
					</div>
				</div>
				
				<div class="mb-3 row">
					<label class="col-sm-2">배송일</label>
					<div class="col-sm-3">
						<input type="text" name="shippingDate" class="form-control">(yyyy/mm/dd)
					</div>
				</div>		
				
				<div class="mb-3 row">
					<label class="col-sm-2">국가명</label>
					<div class="col-sm-3">
						<input type="text" name="country" class="form-control">
					</div>
				</div>
				
				<div class="mb-3 row">
					<label class="col-sm-2">우편번호</label>
					<div class="col-sm-3">
						<input type="text" name="zipCode" class="form-control">
					</div>
				</div>
				
				<div class="mb-3 row">
					<label class="col-sm-2">주소</label>
					<div class="col-sm-5">
						<input type="text" name="addressName" class="form-control">
					</div>
				</div>
				
				<div class="mb-3 row">
					<label class="col-sm-offset-2 col-sm-10">
						<a href="./cart.jsp?cartId=<%= request.getParameter("cartId") %>" class="btn btn-secondary" role="button">
							이전
						</a>
						<button type="submit" class="btn btn-primary">등록</button>
						<a href="./checkOutCancelled.jsp" class="btn btn-secondary" role="button">
							취소
						</a>
					</label>
					<div class="col-sm-5">
						<input type="text" name="addressName" class="form-control">
					</div>
				</div>
				
				<div class="mb-3 row">
					<div class="col-sm-offset-2 col-sm-10">
					
					</div>
				</div>
	    	
	    </form>
    </div>
 		
 	</div>
 		<!-- 푸터(바닥글) 영역 -->
		<%@ include file="footer.jsp" %>
</body>
</html>