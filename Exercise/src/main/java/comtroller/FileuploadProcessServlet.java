package comtroller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.UUID;

/**
 * Servlet implementation class Fileupload01ProcessServlet
 */
@WebServlet("/fileuploadProcess") //url 매핑
// 서블릿 3.0에서 도입된 파일 업로드(멀티파트 요청) 처리를 위한 어노테이션
// 이걸 선언하면 multipart/form-data 형식의 요청을 정상적으로 파싱 가능
@MultipartConfig(
// location = "D:/upload", // 최종 저장될 업로드 경로
	fileSizeThreshold = 1024 * 1024 * 1, // 메모리 임시 저장 임계값(1MB) -> 파일을 메모리에 임시 저장할 최대 크기
	maxFileSize = 1024 * 1024 * 10, // 업로드 최대 파일 크기(10MB) -> 업로드되는 개별 파일의 최대 크기
	maxRequestSize = 1024 * 1024 * 50 // 전체 요청 크기(50MB) -> 요청 전체(모든 파일+ 일반 폼 필드)의 총합 크기
)



public class FileuploadProcessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public FileuploadProcessServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); // 한글 처리를 위해 추가 생략가능
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		String uploadPath = "D:/upload"; // 외부경로
		
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdirs();
		}
			
		Collection<Part> fileParts = request.getParts();
		int fileCount = 0;
		for (Part part : fileParts) {
			String fileName = part.getSubmittedFileName();
			if (fileName == null || fileName.isEmpty()) continue;
			
			String extender = fileName.substring(fileName.lastIndexOf("."));
			//UUID명으로 변경
			String fileNameUUID = UUID.randomUUID() + extender;
			
			
			
			part.write(uploadPath + File.separator + fileNameUUID);
			out.print("파일" + ++fileCount + "경로: " + uploadPath + File.separator + fileNameUUID +" 원본파일명: " + fileName +"<br>");
			out.print("파일 MINE-TYPE: " + part.getContentType());
		}
	}

}
