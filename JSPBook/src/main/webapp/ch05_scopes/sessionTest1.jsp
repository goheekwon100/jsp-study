<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- session:
	HTTP 프로토콜은 요청/응답의 구조로 되어있어 서버가 요청에 대한 응답을 전송하고 나면 연결이 끊어짐(Stateless)
	클라이언트의 정보가 유지되어야 할 필요가 있는 경우를 위해 클라이언트별 상태 전보를 서버에 저장하는 세션이 등장
	 -->
	 
	 <%
	 	//클라이언트의 요청이 없을 시 해당 세션을 유지한 시가을 지정(초 단위)
	 	session.setMaxInactiveInterval(10);
	 %>
	 
	 <h2>세션 테스트</h2>
	 isNew(): <%= session.isNew() %><br>
	 생성시간: <%= session.getCreationTime() %><br>
	 최종 접속(요청) 시간: <%= session.getLastAccessedTime() %><br>
	 세션 ID: <%= session.getId() %><br>
	 
	 <!-- 로그인기능
	 		로그인정보를 비교한다.
	 		로그인 완료 시점에 세션ID를 저장한다.
	 		페이지 새로고침시 세션ID를 비교하여 값이 달라졌을 경우 로그아웃 처리한다.
	  -->
	 
</body>
</html>