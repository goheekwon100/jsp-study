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
	<title>도서 등록</title>
</head>
<body>
	<!-- 장바구니에서 요청도서 삭제 -->
	<%
		// 1. 요청 파라미터 검증
		String id = request.getParameter("id"); // 쿼리 스트링으로 보낸 데이터
		if (id == null || id.trim().isEmpty()) { // id가 null인지 빈 문자열인지 검증
			response.sendRedirect("books.jsp");
			return;
		}
		
		// 2. 장바구니 도서 조회
		BookRepository dao = BookRepository.getInstance();
		Book book = dao.getBookById(id);
		if (book == null) {
			response.sendRedirect("exceptionNoBookId.jsp");
			return;
		}
		
		// 3. 세션에서 장바구니 정보 가져오기
		ArrayList<Book> cartList = (ArrayList<Book>) session.getAttribute("cartlist");
				
		// 4. 장바구니에 동일 도서가 있으면 삭제
		for (Book item : cartList) {
			if (item.getBookId().equals(book.getBookId())) {
				cartList.remove(item);
				break; //반복돌다가 중간 삭제시, 다음 반복에서 동시성예외 발생, 바로 break로 탈출시 예외 회피 가능
			}
		}
		
		// 5. 상세 페이지로 리다이렉트
		response.sendRedirect("cart.jsp");
	%>
</body>
</html>