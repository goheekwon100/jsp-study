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
	<form name="frm">
		<p>이름: <input type="text" name="name"></p>
		<button type="submit" onclick="checkLogin(event)">전송</button>
		
	</form>
	
	<script>
		function checkLogin(e) {
			const str = document.frm.name.value;
			
			//const regExp = /^[a-zA-Zㄱ-ㅎㅏ-ㅣ가-힇]/;
			// 의미?
			// ^: 문자열의 시작
			// []: 범위중에 한 문자
			// a~z, |(파이프문자), A-Z, |, ㄱ-ㅎ, |, ㅏ-ㅣ, |, 가-힇 중 하나의 문자와 매치
			// 끝에 $가 없음 => 문자열의 첫글자만 검사하고, 그 뒤는 신경 쓰지 않음
			
			//숫자로 시작
			// const regExp = /^[0-9]/;
			
			// 첫 글자가 영문자 또는 한글인 경우만 통과시키려면
			const regExp = /^[a-zA-Zㄱ-ㅎㅏ-ㅣ가-힣]/;
			
			// 문자 전체가 영문/한글로만 이루어져야함
			//const regExp = /^[a-zA-Zㄱ-ㅎㅏ-ㅣ가-힣]+$/;
			// 숫자 추가
			//const regExp = /^[0-9a-zA-Zㄱ-ㅎㅏ-ㅣ가-힣]+$/;
			
			if(!regExp.test(str)) {
				alert("이름은 한글 또는 영문자로 시작해야합니다.");
				e.preventDefault();
				return;
			}
			
		}
	</script>
</body>
</html>