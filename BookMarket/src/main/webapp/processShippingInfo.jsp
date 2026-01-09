<%@page import="java.net.URLEncoder"%>
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
	<title>배송정보 처리</title>
</head>
<body>
	<!-- 배송 정보 처리 페이지 만들기 -->
	<%
		// 사용자가 입력한 배송 정보를 쿠키에 저장
		// 쿠키는 원래 아스키 문자만 지원
		// 쿠키 값에 한글/공백/특수문자가 들어가면 URLEncoder.encode() 사용하는 것이 안전
		// 읽을 때는 URLDecoder.decode()
		Cookie cartId = new Cookie("Shipping_cartId", URLEncoder.encode(request.getParameter("cartId"), "utf-8"));
		Cookie name = new Cookie("Shipping_name", URLEncoder.encode(request.getParameter("name"), "utf-8"));
		Cookie shippingDate = new Cookie("Shipping_shippingDate", URLEncoder.encode(request.getParameter("shippingDate"), "utf-8"));
		Cookie country = new Cookie("Shipping_country", URLEncoder.encode(request.getParameter("country"), "utf-8"));
		Cookie zipCode = new Cookie("Shipping_zipCode", URLEncoder.encode(request.getParameter("zipCode"), "utf-8"));
		Cookie addressName = new Cookie("Shipping_addressName", URLEncoder.encode(request.getParameter("addressName"), "utf-8"));
		
		// 유효기간 24시간으로 설정
		cartId.setMaxAge(60 * 60 * 24);
		name.setMaxAge(60 * 60 * 24);
		shippingDate.setMaxAge(60 * 60 * 24);
		country.setMaxAge(60 * 60 * 24);
		zipCode.setMaxAge(60 * 60 * 24);
		addressName.setMaxAge(60 * 60 * 24);
		
		
		// 응답에 쿠키 추가
		response.addCookie(cartId);
		response.addCookie(name);
		response.addCookie(shippingDate);
		response.addCookie(country);
		response.addCookie(zipCode);
		response.addCookie(addressName);
		
		// 주문 확인 페이지로 리다이렉트
		response.sendRedirect("orderConfirmation.jsp");
		
	
	%>
	
</body>
</html>