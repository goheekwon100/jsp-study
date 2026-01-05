<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String user_id = request.getParameter("id");
		String user_passwd = request.getParameter("passwd");
		
		if ("admin".equals(user_id) && "1234".equals(user_passwd)) {
			session.setAttribute("userId", user_id);
			session.setAttribute("userPw", user_passwd);
			out.println("세션 설정이 성공했습니다. <br>"); 
			out.println(user_id +" 님 환영합니다.");
		} else {
			out.println("세션 설정이 실패했습니다.");
		}
	%>
</body>
</html>