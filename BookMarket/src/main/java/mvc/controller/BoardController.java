package mvc.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mvc.model.BoardDAO;
import mvc.model.BoardDTO;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("*.do") // 예제용
// @WebServlet("/board/*") // 실제 서비스 구현 시
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final int LIST_COUNT = 5;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 조회 / 화면 출력
		
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath(); // /BookMarket
		String command = requestURI.substring(contextPath.length());
		
		// 기능별 하나의 컨트롤러에서 요청 URL로 분기하던가
		// 아니면 요청 URL 별로 컨트롤러를 여러개 만들어야됨
		
		if (command.equals("/BoardListAction.do")) { // 등록된 글 목록 페이지 출력하기
			requestBoardList(request);
			RequestDispatcher rd = request.getRequestDispatcher("/board/list.jsp");
			// (참고) 권장 구조: list.jsp 브라우저에서 직접 접근이 불가한 것. controller를 통한 연동을 권장함.
			// JSP 직접 접근 차단(WEB-INF 하위는 URL로 접근 불가)
//			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/board/list.jsp");
			
			rd.forward(request, response);
		} else if (command.equals("/BoardWriteForm.do")) { // 글 등록 페이지
			requestLoginName(request);
			RequestDispatcher rd = request.getRequestDispatcher("/board/writeForm.jsp");
			
			rd.forward(request, response);
		}
		
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath(); // /BookMarket
		String command = requestURI.substring(contextPath.length());
		
		if (command.equals("/BoardWriteAction.do")) {
			requestBoardWrite(request);
		}
	}
	
	private void requestBoardList(HttpServletRequest request) {
		BoardDAO dao = BoardDAO.getinstance();
		
		int pageNum = 1;
		
		if (!request.getParameter("pageNum").isEmpty()) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
		
		int limit = LIST_COUNT;
		
		String items = request.getParameter("items"); // 검색 조건 (제목, 본문, 글쓴이)
		String text = request.getParameter("text"); // 검색어
		
		int total_record = dao.getListCount(items, text); // 전체 레코드 수
		ArrayList<BoardDTO> boardList =  dao.getBoardList(pageNum, limit, items, text); // 게시글 목록
		
		// 11.0 / 5.0 = 2.2 -> 3.0
		// 10.0 / 5.0 = 2.0 -> 2.0
		// 총페이지수, 올림((실수)글 갯수 / 리미트)
		int total_page = (int) Math.ceil((double) total_record / limit);
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("total_page", total_page);
		request.setAttribute("total_record", total_record);
		request.setAttribute("boardList", boardList);
		
	}
	
	private void requestLoginName(HttpServletRequest request) {
		BoardDAO dao = BoardDAO.getinstance();
		String id = request.getParameter("id");
		
		String name = dao.getLoginNameById(id);
		request.setAttribute("name", name);
	}
	
	public void requestBoardWrite(HttpServletRequest request) {
		BoardDAO dao = BoardDAO.getinstance();
	}
}
