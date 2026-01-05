<%@page import="java.util.Enumeration"%>
<%@page import="org.apache.jasper.runtime.JspApplicationContextImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pageContext Test</title>
</head>
<body>
	<!-- page 영역과 request 영역 비교
		포워드  기능을 이용해서 다른 페이지로 이동
		=> 기존 page 영역은 소멸하고 request 영역은 유지
	-->
	
	<%
		pageContext.setAttribute("pageScope", "pageValue");
		request.setAttribute("requestScope", "requestValue");
	%>

	<h3>값 출력</h3>
	pageValue = <%= pageContext.getAttribute("pageScope") %><br>	
	requestValue = <%= request.getAttribute("requestScope") %>
	
	<jsp:forward page="attributeTest5Result.jsp"/>
</body>
</html>