<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
07 선언문 태그를 이용하여 다음 조건에 맞게 JSP 애플리케이션을 만들고 실행 결과를 확인하시오.
1) declaration.jsp 파일을 생성한다.
	• 선언문 태그에 문자형 전역변수를 선언하여 'Hello, Java Server Pages'를 저장한다.
	• 문자형 변수 값을 반환하는 전역 메소드 getString()을 작성한다.
	• getString() 메소드를 호출하여 문자형 변수 값을 출력한다.
2) 웹 브라우저에 'http://localhost:8080/Exercise/ch02/declaration.jsp'를 입력하여 실행 결과를 확인한다.
<br>

<%!
	String str = "Hello, Java Server Pages";
	public String getString(){
		return str;
	}
%>
<%
	out.println(getString());
%>

</body>
</html>