<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 08 form 태그를 이용하여 다음 조건에 맞게 JSP 애플리케이션을 만들고 실행하여 결과를 확인하시오.
1) form01.jsp 파일을 생성한다.
	• input 태그 내에 text 유형을 이용하여 이름, 주소, 이메일 항목을 작성한다.
	• form 태그에 action 속성 값은 form01_process.jsp로 작성한다.
2) form01_process.jsp 파일을 생성한다.
	• request 내장 객체의 getParameter() 메소드를 이용하여 전송된 요청 파라미터 값을 전달받는다.
	• StringBuffer 클래스를 이용하여 전송된 요청 파라미터 값을 저장하여 출력한다.
3) 웹 브라우저에 'http://localhost:8080/Exercise/ch06/form01.jsp'를 입력하여 실행 결과를 확인한다. -->

	<%
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		
		StringBuffer sb = new StringBuffer();
		sb.append("이름: " + name);
		sb.append("이메일: " + email);
		sb.append("주소: " + address);
		
		out.print(sb.toString());
	%>
</body>
</html>