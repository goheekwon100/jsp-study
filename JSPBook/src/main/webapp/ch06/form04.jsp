<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<!-- 폼 데이터 전송받기 -->
	<h3>회원가입</h3>
	<form action="form04_process.jsp" name="member" method="post">
		<p>
			아이디: <input type="text" name="id">
			<input type="button" name="idCheck" value="아이디 중복체크">
		</p>
		<p>
			비밀번호: <input type="password" name="passwd">
		</p>
		<p>
			이름: <input type="text" name="name">
		</p>
		<p>
			연락처:
			<select name="phone1">
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="016">016</option>
				<option value="017">017</option>
				<option value="019">019</option>
			</select>
			- <input type="text" maxlength="4" name="phone2">
			- <input type="text" maxlength="4" name="phone3">
		</p>
		<p>
			성별:
				<input type="radio" name="gender" checked value="남성">
				<input type="radio" name="gender" value="여성">
		</p>
		<p>
			취미:
			독서<input type="checkbox" name="reading">
			운동<input type="checkbox" name="excercise">
			영화<input type="checkbox" name="movie">
		</p>
		<p>
			<textarea rows="3" cols="30" name="comment" placeholder="가입 인사를 입력해주세요."></textarea>
		</p>
		
		<p>
			<button type="submit">가입하기</button>
			<button type="reset">다시쓰기</button>
		</p>
	</form>
</body>
</html>