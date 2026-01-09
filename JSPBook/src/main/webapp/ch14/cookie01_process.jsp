<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie</title>
</head>
<body>
	<%
		String user_id = request.getParameter("id");
		String user_pw = request.getParameter("passwd");
		
		// 간단한 로그인 검증
		if ("admin".equals(user_id) && "1234".equals(user_pw)) {
			
			Cookie cookie_id = new Cookie("userId",user_id);
			Cookie cookie_pw = new Cookie("userPw",user_pw);
			
			// (중요) 자주 쓰는 쿠키 설정
			cookie_id.setPath("/"); // 모든 경로에서 접근 가능
			cookie_id.setHttpOnly(true); // JavaScript로 접근 불가(보안 강화), 예: document.cookie
			// cookie_id.setSecure(true); // HTTPS에서만 서버로 전송(사용)
			cookie_id.setMaxAge(60 * 5); // 초단위 유지시간 설정, 브라우저에 의해 해당 시간 이후 삭제
			
			response.addCookie(cookie_id);
			response.addCookie(cookie_pw);
			
			out.print("쿠키 생성에 성공했습니다.<br>");
			out.print(user_id + "님 환영합니다.");
			
		} else {
			out.println("쿠키생성에 실패했습니다.");
		}
		
		// 위 코드는 학습용: 실제 서비스에서는 비밀번호를 쿠키에 저장함녀 안됨
		// 쿠키는 클라이언트에 일반 텍스트로 저장되어 탈취 가능(보안 위협)
		// 서버가 관리할 필요가 없는 클라이언트에서만  필요한 정보 + 보안이 필요하지 않은 정보는 쿠키에 저장
		
		/* 쿠키 사용 예 
			1. 로그인 유지(세션ID가 저장된 세션 쿠키)
			2. 방문 기록 또는 사용자 설정 유지(ID기억하기, 언어설정, )
			3. 광고/트래킹 용도(특히 제3자 쿠키)
		*/
	
	%>
</body>
</html>