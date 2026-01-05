<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 폼 페이지에서 입력한 아이디와 비밀번호 출력하기 -->
	<form name="loginForm" action="validation02_process.jsp">
		<p>아이디: <input type="text" name="id" id="id"></p>
		<p>비밀번호: <input type="password" name="passwd" id="passwd"> </p>
		<button type="submit" onclick="checkLogin(event)">전송</button>
		
	</form>
	
	<script>
		inputId = document.querySelector("#id");
		inputPasswd = document.querySelector("#passwd");
		function checkLogin(e) {
			const form = document.loginForm;
			
			if (id.value === '') {
				alert("아이디를 입력해주세요.");
				e.preventDefault();
				id.focus();
				return;
			}
			if (passwd.value === '') {
				alert("비밀번호를 입력해주세요.");
				e.preventDefault();
				passwd.focus();
				return;
			}
		}
	</script>
</body>
</html>