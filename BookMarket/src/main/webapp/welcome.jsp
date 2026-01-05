<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
<!-- 부트스트랩 연결 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
	<!-- 북마켓 프로젝트 만들기 -->
	<!-- <h1>Welcome to Book Shopping Mall</h1>
	<h3>Welcome to Web Market!</h3> -->
	<!-- 새로운 Project가 추가 될 경우 서버재시작 필요
	재시작 이후 추가되는 jsp는 재시작 불필요, 바로 적용 -->
	
	<%!
		String tagline = "Welcome to Web Market!";
	%>    
	<%!
		String greeting = "Welcome to Book Shopping Mall 안깨지고 잘 출력이 되어야함";
	%>
	<div class="container py-4">
	
		<!-- 헤더(메뉴) 영역 -->
		<%@ include file="menu.jsp" %>
    
    <!-- 중간 타이틀 영역 -->
    <!-- Quiz: 동적 include로 변경(title.jsp) -->
    <jsp:include page="title.jsp">
    	<jsp:param name= "greeting" value = "Welcome to Book Shopping Mall"/>
    	<jsp:param name= "name" value = "BookMarket"/>
    </jsp:include>
    
    <!-- 본문 영역 -->
    <div class="row align-items-md-stretch text-center">
      <div class="col-md-12">
        <div class="h-100 p-5">
        	<h3> <%= tagline %> </h3>
        	<!-- 현재 접속 시간 출력하기 -->
        	<%
        		LocalDateTime now = LocalDateTime.now();
        		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("hh:mm:ss a");
        		
        		String CT = now.format(formatter);
        		out.println("현재 접속 시각: " + CT);
        	%>
        </div>
      </div>
 		</div>
 		
 		<!-- 푸터(바닥글) 영역 -->
		<%@ include file="footer.jsp" %>
 		
 		
	</div>
</body>
</html>