package ch12.com.filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import java.io.IOException;
import java.io.PrintWriter;

//@WebFilter("/AuthenFilter11")
public class AuthenFilter extends HttpFilter implements Filter {    
    public void init(FilterConfig fConfig) throws ServletException {
    	System.out.println("Authen Filter 초기화");
    }

	public void destroy() {
		// 서버 정상 종료나 웹 어플리케이션 재배포 시 호출됨
		System.out.println("AuthenFilter 해제...");
		// 사용 예: DB연결 해제, 파일 스트림 닫기 등
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		System.out.println("filter01_process.jsp 처리 전 필터 수행...");
		String name = request.getParameter("name");
		
		if (name == null || name.isEmpty()) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("입력된 name값은 null입니다.");
			return;
		}
		
		// request와 response를 다음 필터로 제어를 넘김
		// 마지막 필터이면 리소스를 호출함
		chain.doFilter(request, response);
		
		System.out.println("filter01_process.jsp 처리 후 필터 수행...");
	}


}
