<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Validation</title>
</head>
<body>
	<!-- 회원가입 폼 페이지에서 입력한 데이터 형식 유효성 검사하기 -->
	<form name="member" action="validation05_process.jsp" method="post">
		<p>아이디: <input type="text" name="id"></p>
		<p>비밀번호: <input type="password" name="passwd"></p>
		<p>이름: <input type="text" name="name"></p>
		<p>
			연락처: 
			<select name="phone1">
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="016">016</option>
				<option value="017">017</option>
				<option value="019">019</option>
			</select> - 
			<input type="text" maxlength="4" size="4" name="phone2"> - 
			<input type="text" maxlength="4" size="4" name="phone3">
		</p>
		<p>이메일: <input type="text" name="email"></p>
		<button type="button" onclick="checkMember()">가입하기</button> 
	</form>
	
	<script type="text/javascript">
		function checkMember() {
			const form = document.member;
			
			const id = form.id.value;
			const passwd = form.passwd.value;
			const name = form.name.value;
			const phone = form.phone1.value + "-" + form.phone2.value + "-" + form.phone3.value;
			const email = form.email.value;
			
			// 영문 대소문자, 한글, 한글의 자음과 모음으로 시작하는 검사
			const regExpId = /^[A-Za-zㄱ-ㅎㅏ-ㅣ가-힣]/;
			
			// 숫자만 최소 4자리 이상
			// const regExpPasswd = /[0-9]{4,}/; // 부분매칭으로 문자열속에서 연속된 숫자4글자 이상 있으면 통과 
			const regExpPasswd = /^[0-9]{4,}$/;
			// 처음과 끝이 표시되지 않는 경우 해당 위치에 규칙과 무관한 값이 오더라도 정규식 검사 통과
			
			// 이름에 대해 한글만 검사
			// const regExpName = /^[가-힣]$/; // +가 빠지면 한글자만 가능해짐.
			// const regExpName = /^[가-힣]{2,4}$/; // 법 개정으로 다문화가정의 자녀는 이름 글자수 제한 사라짐
			const regExpName = /^[가-힣]+$/;
			
			// 전화번호 형태 검사
			const regExpPhone = /^\d{3}-\d{3,4}-\d{4}$/;
			
			// 이메일 형태 검사
			///^[a-z0-9]@[a-z].[a-z]$/;
			// const regExpEmail = 
			//	/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			// i는 대소문자 무시
			// ^[0-9a-zA-Z] : 첫 글자는 영숫자여야함.
			// ([-_.]?[0-9a-zA-Z])* : - 또는 _ 도는 .가 있을 수도 있고 그 뒤에 영숫자가 와야 함
			// @ : @ 반드시 한개 있어야함.
			// 도메인 부분도 동일한 패턴
			// \. : .문자의 의미를 무시하고 문자자체로 사용
			// 
			
			// (참고) 더 간단하면서 널리 쓰이는 이메일 검증 패턴
			const regExpEmail = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;
			
			
			if (!regExpId.test(id)) {
				alert("아이디는 문자로 시작해주세요!");
				return;
			}
			
			if (!regExpPasswd.test(passwd)) {
				alert("비밀번호는 숫자 4글자 이상이어야 합니다.");
				return;
			}
			
			if (!regExpName.test(name)) {
				alert("이름은 한글만 가능합니다. 자음모음 안됨");
				return;
			}
			
			if (!regExpPhone.test(phone)) {
				alert("연락처가 올바르지 않습니다.");
				return;
			}
			
			if (!regExpEmail.test(email)) {
				alert("이메일을 확인해주세요.");
				return;
			}
			
			form.submit();
		}
	</script>
</body>
</html>