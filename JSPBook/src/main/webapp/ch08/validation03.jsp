<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Validation</title>
</head>
<body>
	<!-- 폼 페이지에서 입력한 비밀번호 값이 숫자인지 검사하기 -->
	<form name="loginForm" action="validation04_process.jsp">
		<p>아이디: <input type="text" name="id" id="id"></p>
		<p>비밀번호: <input type="password" name="passwd" id="passwd"> </p>
		<button type="submit" onclick="checkLogin(event)">전송</button>
		
	</form>
	
	<script>
		inputId = document.querySelector("#id");
		inputPasswd = document.querySelector("#passwd");
		function checkLogin(e) {
			const form = document.loginForm;
					
			if (inputId.value.length < 4 || inputId.value.length > 12) {
				alert("아이디는 4~12자 이내로 입력 가능합니다.");
				e.preventDefault();
				inputId.select();
				return;
			}
			if (inputPasswd.value.length < 4) {
				alert("비밀번호는 4자 이상으로 입력해야 합니다!)");
				e.preventDefault();
				inputPasswd.select();
				return;
			}
		}
	</script>
</body>
</html>