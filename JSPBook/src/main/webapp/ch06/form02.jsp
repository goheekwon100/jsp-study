<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- form 태그와 input 태그로 간단한 회원 가입 양식 만들기 -->
	<form action="" method="post">
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
			<button type="submit">다시쓰기</button>
			<button type="submit">전송</button>
		</p>
	</form>
</body>
</html>