package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.JdbcUtil;
import util.OraclePageMaker;
import vo.NoticeVo;

public class NoticeDaoImpl implements NoticeDao {

	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	@Override
	public boolean noticeWrite(NoticeVo NoticeVo) {
		conn = JdbcUtil.getConnection();
		boolean isSuccess = false;
		
		try {
			String sql = "INSERT INTO notice_board VALUES(notice_board_seq.nextval, ?, ?, ?, ?, sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, NoticeVo.getNotice_category());
			pstmt.setString(2, NoticeVo.getNotice_author());
			pstmt.setString(3, NoticeVo.getNotice_title());
			pstmt.setString(4, NoticeVo.getNotice_content());
			int result = pstmt.executeUpdate();
			if (result != 0) isSuccess = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}

		return isSuccess;
	}

	@Override
	public boolean noticeUpdate(NoticeVo NoticeVo) {
		conn = JdbcUtil.getConnection();
		boolean isSuccess = false;
		try {
			String sql = "UPDATE notice_board SET notice_category = ?, notice_author = ?, notice_title = ?, "
					+ "notice_content = ?, notice_date = sysdate WHERE notice_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, NoticeVo.getNotice_category());
			pstmt.setString(2, NoticeVo.getNotice_author());
			pstmt.setString(3, NoticeVo.getNotice_title());
			pstmt.setString(4, NoticeVo.getNotice_content());
			pstmt.setInt(5, NoticeVo.getNotice_num());
			int result = pstmt.executeUpdate();
			if (result != 0) isSuccess = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		return isSuccess;
	}

	@Override
	public boolean noticeDelete(int notice_num) {
		conn = JdbcUtil.getConnection();
		boolean isSuccess = false;
		
		try {
			String sql = "DELETE FROM notice_board WHERE notice_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, notice_num);
			
			int result = pstmt.executeUpdate();
			if(result > 0) isSuccess = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		return isSuccess;
	}

	@Override
	public ArrayList<NoticeVo> getNoticeList(int startRow, int endRow) {
		conn = JdbcUtil.getConnection();
		ArrayList<NoticeVo> noticeList = new ArrayList<>();

		try {
			String sql = "SELECT B.* FROM "
					+ "(SELECT ROWNUM AS rnum, A.* FROM "
					+ "(SELECT * FROM notice_board ORDER BY notice_num DESC) A) B "
					+ "WHERE rnum BETWEEN ? AND ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				NoticeVo n = new NoticeVo();
				n.setNotice_num(rs.getInt("notice_num"));
				n.setNotice_category(rs.getString("notice_category"));
				n.setNotice_author(rs.getString("notice_author"));
				n.setNotice_title(rs.getString("notice_title"));
				n.setNotice_date(rs.getTimestamp("notice_date"));
				noticeList.add(n);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		return noticeList;
	}

	@Override
	public int getListCount() {
		conn = JdbcUtil.getConnection();
		int listCount = 0;

		try {
			pstmt = conn.prepareStatement("SELECT COUNT(*) FROM notice_board");
			rs = pstmt.executeQuery();
			if (rs.next()) listCount = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		return listCount;
	}

	@Override
	public NoticeVo getNoticeVo(int notice_num) {
		conn = JdbcUtil.getConnection();
		NoticeVo notice = null;
		
		try {
			
			String sql = "SELECT * FROM notice_board WHERE notice_num = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, notice_num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				notice = new NoticeVo();
				notice.setNotice_num(notice_num);
				notice.setNotice_category(rs.getString("notice_category"));
				notice.setNotice_author(rs.getString("notice_author"));
				notice.setNotice_title(rs.getString("notice_title"));
				notice.setNotice_content(rs.getString("notice_content"));
				notice.setNotice_date(rs.getTimestamp("notice_date"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		return notice;
	}
	
	@Override
	public int getSearchListCount(String searchName, String searchValue) {
		conn = JdbcUtil.getConnection();
		int listCount = 0;
		
		try {
			String sql = "SELECT count(*) FROM notice_board";
			if(searchName.equals("author")) sql += " WHERE notice_author LIKE ? ";
			else sql += " WHERE notice_title LIKE ? ";
			System.out.println("search sql : " + sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + searchValue + "%");
			rs = pstmt.executeQuery();
			if(rs.next()) listCount = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		return listCount;
	}
	
	@Override
	public ArrayList<NoticeVo> getSearchNoticeList(String searchName, String searchValue, OraclePageMaker pageMaker) {
		conn = JdbcUtil.getConnection();
		ArrayList<NoticeVo> noticeList = new ArrayList<>();

		try {
			String sql  ="SELECT B.* FROM "
					+ "(SELECT ROWNUM AS rnum, A.* FROM "
					+ "(SELECT * FROM notice_board ";
			if(searchName.equals("author")) sql+=" WHERE notice_author LIKE ? ";
			else sql+=" WHERE notice_title LIKE ? ";
			sql+= " ORDER BY notice_num DESC) A ) B WHERE rnum BETWEEN ? AND ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + searchValue + "%");
			pstmt.setInt(2, pageMaker.getStartRow());
			pstmt.setInt(3, pageMaker.getEndRow());
			rs = pstmt.executeQuery();
			while (rs.next()) noticeList.add(new NoticeVo(rs.getInt("notice_num"),
					rs.getString("notice_category"), rs.getString("notice_author"),
					rs.getString("notice_title"), rs.getString("notice_content"),
					rs.getTimestamp("notice_date")));
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		return noticeList;
	}
}
