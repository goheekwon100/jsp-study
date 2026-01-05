<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
08 request 내장 객체를 이용하여 다음 조건에 맞게 JSP 애플리케이션을 만들고 실행 결과를 확인하시오.
1) request.jsp 파일을 생성한다.
	• input 태그 내에 text 유형을 이용하여 아이디, 비밀번호 항목을 작성한다.
	• form 태그의 action 속성 값은 request_process.jsp로, method 속성 값은 get으로 작성한다.
2) request_process.jsp 파일을 생성한다.
	• request 내장 객체의 getQueryString() 메소드를 이용하여 전송된 요청 파라미터와 값을 출력한다.
3) 웹 브라우저에 'http://localhost:8080/Exercise/ch05/request.jsp'를 입력하여 실행 결과를 확인한다.

	<form action="request_process.jsp" method="get">
		<p>아이디: <input type="text" name="id"></p>
		<p>비밀번호: <input type="password" name="passwd"></p>
		<button type="submit">전송</button>
	</form>
</body>
</html>