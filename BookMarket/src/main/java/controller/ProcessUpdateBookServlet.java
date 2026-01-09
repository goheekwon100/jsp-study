package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import util.DBUtil;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import dao.BookRepository;
import dto.Book;

@WebServlet("/processUpdateBook")

@MultipartConfig(
	maxFileSize = 1024 * 1024 * 10,
	maxRequestSize = 1024 * 1024 * 50
		
)
public class ProcessUpdateBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public ProcessUpdateBookServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String bookId = request.getParameter("bookId");
		String name = request.getParameter("name");
		String unitPrice = request.getParameter("unitPrice");
		String author = request.getParameter("author");
		String publisher = request.getParameter("publisher");
		String releaseDate = request.getParameter("releaseDate");	
		String description = request.getParameter("description");	
		String category = request.getParameter("category");
		String unitsInStock = request.getParameter("unitsInStock");
		String condition = request.getParameter("condition");
		
		int price;
		if (unitPrice.isEmpty()) { // 빈 문자열인지 확인
			price = 0;
		} else {
			price = Integer.parseInt(unitPrice);
		}
		
		long stock;
		if (unitsInStock.isEmpty()) { // 빈 문자열인지 확인
			stock = 0;
		} else {
			stock = Long.parseLong(unitsInStock);
		}
		
		
		
		Part filePart = request.getPart("bookImage");
		String fileName = "";
		if (filePart != null && filePart.getSize() > 0) {
			fileName = filePart.getSubmittedFileName();
			
			String uploadPath = "D:/upload";
			
			File uploadDir = new File(uploadPath);
			if (!uploadDir.exists()) {
				uploadDir.mkdirs();
			}
			// 파일 저장
			filePart.write(uploadPath + File.separator + fileName);
			
		}
		
		String sql = "UPDATE book "
	     		   + "SET b_name = ?, b_unitPrice = ?, b_author = ?, b_description = ?, "
	     		   + "b_publisher = ?, b_category = ?, b_unitsInStock = ?, "
	     		   + "b_releaseDate = ?, b_condition = ?, b_fileName = IFNULL(?, b_fileName) "
	     		   + "WHERE b_id = ?";
		// (참고) IFNULL(?, b_fileName) 파일 미첨부시 기존 값으로 대체
		
		try (Connection conn = DBUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);) {
			
			pstmt.setString(1, name);
			pstmt.setString(2, unitPrice);
			pstmt.setString(3, author);
			pstmt.setString(4, description);
			pstmt.setString(5, publisher);
			pstmt.setString(6, category);
			pstmt.setString(7, unitsInStock);
			pstmt.setString(8, releaseDate);
			pstmt.setString(9, condition);
			pstmt.setString(10, fileName);
			pstmt.setString(11, bookId);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// BookRepository dao = BookRepository.getInstance();
		// dao.addBook(newBook);
				
		// 등록 후 도서 목록 페이지로 리다이렉트
		response.sendRedirect("books.jsp");
	}

}