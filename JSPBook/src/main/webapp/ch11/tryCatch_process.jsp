<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Exception</title>
</head>
<body>
	<%
		try {
			// 나누기 연산 수행 후 결과 출력
			int num1 = Integer.parseInt(request.getParameter("num1"));
			int num2 = Integer.parseInt(request.getParameter("num2"));
			
			out.println("나눗셈 결과: " + num1/num2);
		} catch (NumberFormatException e) {
			// 예외 발생 시 오류 페이지로 이동하도록 작성
			// RequestDispatcher dispatcher =  request.getRequestDispatcher("tryCatch_error.jsp");
			// dispatcher.forward(request, response);
			
			// 테스트: 리다이렉트 사용시 데이터 유지 X
			response.sendRedirect("tryCatch_error.jsp"); 			
		}
	%>
</body>
</html>