<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입정보</title>
</head>
<body>
	<!-- Quiz: 전송받은 폼 데이터 출력하기 -->
	<%
		String userId = request.getParameter("id");
		String userPasswd = request.getParameter("passwd");
		String userName = request.getParameter("name");
		String userPhoneNumber = request.getParameter("phone1") + "-"
				+ request.getParameter("phone2") + "-"
				+ request.getParameter("phone3");
		String userGender = request.getParameter("gender");
		String userhobby = request.getParameter("reading") + " " + request.getParameter("excercise") + " " + request.getParameter("movie");
		String userComment = request.getParameter("comment");
	%>
	<p>아이디: <%= userId %></p>
	<p>비밀번호: <%= userPasswd %></p>
	<p>이름: <%= userName %></p>
	<p>연락처: <%= userPhoneNumber %></p>
	<p>성별: <%= userGender %></p>
	<p>취미: <%= userhobby %></p>
	<p>가입인사: <%= userComment %></p>	
	
</body>
</html>