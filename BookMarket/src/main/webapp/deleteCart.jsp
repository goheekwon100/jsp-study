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
	<!-- 장바구니 삭제 -->
	<%
		// 1. 요청 파라미터 검증
		String id = request.getParameter("cartId"); // 쿼리 스트링으로 보낸 데이터
		if (id == null || id.trim().isEmpty()) { // id가 null인지 빈 문자열인지 검증
			response.sendRedirect("cart.jsp");
			System.out.println("[비정상적인 요청] 사유: NPE발생 시도");
			return;
		}
		if (!id.equals(session.getId())) { // id가 null인지 빈 문자열인지 검증
			response.sendRedirect("cart.jsp");
			System.out.println("[비정상적인 요청] 사유: cartId 조작 접근");
			return;
		}
		
		// 4. 장바구니 삭제
		
		// session.invalidate();
		// 주의! 위 코드는 세션에 저장된 모든 데이터를 삭제하고 세션 자체도 무효화
		// 예: 로그인 시 로그인도 풀림
		
		// 장바구니 비우기: "cartlist만 삭제"
		
		session.removeAttribute("cartlist");
		
		// 또는 장바구니 내용만 비우기: 세션에 저장된 리스트는 유지, 내용만 삭제
		
		// 5. 상세 페이지로 리다이렉트
		response.sendRedirect("cart.jsp");
	%>
</body>
</html>