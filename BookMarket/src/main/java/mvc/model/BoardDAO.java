package mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import mvc.database.DBConnection;

public class BoardDAO {
	private static final BoardDAO instance = new BoardDAO();
	
	private BoardDAO() {
		
	}
	
	public static BoardDAO getinstance() {
		return instance;
	}
	
	// board 테이블의 레코드 개수
	public int getListCount(String items, String text) {
		int totalCount = 0;
		
		String sql = "SELECT count(*) AS cnt FROM board";
		
		// 검색 조건이 있을 때만 WHERE 추가
		if (items != null && text != null && !items.isEmpty() && !text.isEmpty()) {
			sql += " WHERE " + items + " LIKE ?";
		}
		
		try (Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql)) {
			// 검색 조건이 있을 때만 WHERE 추가
			if (items != null && text != null && !items.isEmpty() && !text.isEmpty()) {
				pstmt.setString(1, "%" + text + "%");
			}
			
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					totalCount = rs.getInt("cnt");
				}
			}
		} catch (Exception e) {
			System.out.println("getListCount() 예외 발생: " + e);
		}
		return totalCount;
	}
	
	// board 테이블의 레코드 가져오기
	public ArrayList<BoardDTO> getBoardList(int page, int limit, String items, String text) {
		int offset = (page - 1) * limit; // 페이징 처리 offset 계산(몇 개를 건너 뛸지)
		
		String sql = "SELECT * FROM board";
		if (items != null && text != null && !items.isEmpty() && !text.isEmpty()) {
			sql += " WHERE " + items + " LIKE ?";
		}
		
		sql += " ORDER BY num DESC LIMIT ? OFFSET ?";
		
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		
		try (Connection conn = DBConnection.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)) {
			
			int paramIndex = 1;
			
			if (items != null && text != null && !items.isEmpty() && !text.isEmpty()) {
				pstmt.setString(paramIndex++ , "%" + text + "%");
			}
			pstmt.setInt(paramIndex++, limit);
			pstmt.setInt(paramIndex, offset);
			
			try (ResultSet rs = pstmt.executeQuery()) {
				while (rs.next()) {
					BoardDTO boardDTO = new BoardDTO();
					boardDTO.setNum(rs.getInt("Num"));
					boardDTO.setId(rs.getString("id"));
					boardDTO.setName(rs.getString("name"));
					boardDTO.setSubject(rs.getString("subject"));
					boardDTO.setContent(rs.getString("content"));
					boardDTO.setRegistDay(rs.getString("regist_day"));
					boardDTO.setHit(rs.getInt("hit"));
					boardDTO.setIp(rs.getString("ip"));
					
					list.add(boardDTO);
				}
			}
		} catch (Exception e) {
			System.out.println("getBoardList() 예외 발생: " + e);
		}
		
		return list;
	}
	
	public String getLoginNameById(String id) {
		String sql = "SELECT name FROM member WHERE id = ?";
		
		try (Connection conn = DBConnection.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)) {
						
			pstmt.setString(1, id);
			
			try (ResultSet rs = pstmt.executeQuery()) {
				if(rs.next()) {
					return rs.getString("Name");					
				}
			}
		} catch (Exception e) {
			System.out.println("getBoardList() 예외 발생: " + e);
		}
		return null;
	}
}
