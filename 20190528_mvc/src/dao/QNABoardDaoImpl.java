package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.JdbcUtil;
import util.OraclePageMaker;
import vo.BoardVo;
import vo.CommentVo;

public class QNABoardDaoImpl implements QNABoardDao {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	private static QNABoardDaoImpl boardDao;
	private QNABoardDaoImpl() {}
	public static QNABoardDaoImpl getInstance() {
		if(boardDao == null) {
			boardDao = new QNABoardDaoImpl();
		}		
		return boardDao;
	}

	@Override
	public int getListCount() {
		conn = JdbcUtil.getConnection();
		int listCount = 0;
		
		try {
			String sql = "SELECT COUNT(*) FROM qna_board";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			if (rs.next()) listCount = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		return listCount;
	}

	@Override
	public ArrayList<BoardVo> getBoardList() {
		conn = JdbcUtil.getConnection();
		ArrayList<BoardVo> list = new ArrayList<>();
		
		try {
			String sql = "SELECT * FROM qna_board ORDER BY board_re_ref DESC, board_re_seq ASC";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				BoardVo board = new BoardVo(rs.getInt("board_num"), rs.getString("board_name"),
						rs.getString("board_pass"), rs.getString("board_title"), rs.getString("board_content"),
						rs.getString("board_file"), rs.getString("board_file_origin"), rs.getInt("board_re_ref"),
						rs.getInt("board_re_lev"), rs.getInt("board_re_seq"), rs.getInt("board_readcount"),
						rs.getTimestamp("board_date"));
				list.add(board);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		return list;
	}

	@Override
	public ArrayList<BoardVo> getBoardList(OraclePageMaker pageMaker) {
		conn = JdbcUtil.getConnection();
		ArrayList<BoardVo> list = new ArrayList<>();
		
		try {
			String sql = "SELECT * FROM "
					+ "(SELECT ROWNUM AS rnum, A.* FROM "
					+ "(SELECT * FROM qna_board ORDER BY board_re_ref DESC, board_re_seq ASC) A) "
					+ "WHERE rnum BETWEEN ? AND ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pageMaker.getStartRow());
			pstmt.setInt(2, pageMaker.getEndRow());
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardVo board = new BoardVo(rs.getInt("board_num"), rs.getString("board_name"),
						rs.getString("board_title"), rs.getInt("board_re_ref"), rs.getInt("board_re_lev"),
						rs.getInt("board_re_seq"), rs.getInt("board_readcount"), rs.getTimestamp("board_date"));
				list.add(board);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		return list;
	}

	@Override
	public void boardWrite(BoardVo board) {
		conn = JdbcUtil.getConnection();
		
		try {
			String sql = "INSERT INTO qna_board "
					+ "VALUES(qna_board_seq.nextval, ?, ?, ?, ?, ?, ?, qna_board_seq.currval, 0, 0, 0, sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getBoard_name());
			pstmt.setString(2, board.getBoard_pass());
			pstmt.setString(3, board.getBoard_title());
			pstmt.setString(4, board.getBoard_content());
			pstmt.setString(5, board.getBoard_file());
			pstmt.setString(6, board.getBoard_file_origin());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
	}

	@Override
	public BoardVo getBoardVo(int board_num) {
		conn = JdbcUtil.getConnection();
		BoardVo boardVo = null;
		
		try {
			String sql = "SELECT * FROM qna_board WHERE board_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				boardVo = new BoardVo(rs.getInt("board_num"), rs.getString("board_name"),
						rs.getString("board_title"), rs.getString("board_content"), rs.getString("board_file"),
						rs.getString("board_file_origin"), rs.getInt("board_re_ref"), rs.getInt("board_re_lev"),
						rs.getInt("board_re_seq"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		return boardVo;
	}

	@Override
	public void updateReadCount(int board_num) {
		conn = JdbcUtil.getConnection();
		
		try {
			String sql = "UPDATE qna_board SET board_readcount = board_readcount + 1 "
					+ "WHERE board_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
	}

	@Override
	public void boardReplySubmit(BoardVo board) {
		conn = JdbcUtil.getConnection();
		int ref = board.getBoard_re_ref();
		int lev = board.getBoard_re_lev();
		int seq = board.getBoard_re_seq();
		
		try {
			String sql = "UPDATE qna_board SET board_re_seq = board_re_seq + 1 "
					+ "WHERE board_re_ref = ? AND board_re_seq > ?";
			pstmt = conn.prepareStatement(sql);
			conn.setAutoCommit(false);
			pstmt.setInt(1, ref);
			pstmt.setInt(2, seq);
			pstmt.executeUpdate();
			
			sql = "INSERT INTO qna_board VALUES(qna_board_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, 0, sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getBoard_name());
			pstmt.setString(2, board.getBoard_pass());
			pstmt.setString(3, board.getBoard_title());
			pstmt.setString(4, board.getBoard_content());
			pstmt.setString(5, "");
			pstmt.setString(6, "");
			pstmt.setInt(7, ref);
			pstmt.setInt(8, lev + 1);
			pstmt.setInt(9, seq + 1);
			pstmt.executeUpdate();
			
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
			try { conn.rollback(); }
			catch (SQLException e1) { e1.printStackTrace(); }
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
	}

	@Override
	public void boardUpdate(BoardVo board) {
		conn = JdbcUtil.getConnection();
		
		try {
			String sql = "UPDATE qna_board SET board_name = ?, board_title = ?, board_content = ?"
					+ " WHERE board_num = ? AND board_pass = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getBoard_name());
			pstmt.setString(2, board.getBoard_title());
			pstmt.setString(3, board.getBoard_content());
			pstmt.setInt(4, board.getBoard_num());
			pstmt.setString(5, board.getBoard_pass());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
	}

	@Override
	public boolean boardDelete(int board_num, String board_pass) {
		conn = JdbcUtil.getConnection();
		boolean isSuccess = false;
		
		try {
			String sql = "DELETE FROM qna_board WHERE board_num = ? AND board_pass = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			pstmt.setString(2, board_pass);
			
			int result = pstmt.executeUpdate();
			if (result > 0) isSuccess = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		return isSuccess;
	}
	
	@Override
	public boolean insertComment(CommentVo commentVo) {
		conn = JdbcUtil.getConnection();
		boolean isSuccess = false;

		try {
			String sql ="INSERT INTO qna_comment VALUES(qna_comment_seq.nextval, ?, ?, ?, sysdate, 'N', ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, commentVo.getComment_id());
			pstmt.setString(2, commentVo.getComment_name());
			pstmt.setString(3, commentVo.getComment_content());
			pstmt.setInt(4, commentVo.getComment_board_num());
			int result = pstmt.executeUpdate();

			if(result > 0 ) isSuccess = true; 
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		return isSuccess;
	}

	@Override
	public ArrayList<CommentVo> getCommentList(int board_num) {
		conn = JdbcUtil.getConnection();
		ArrayList<CommentVo> commentList = new ArrayList<>();
		
		try {
			String sql = "SELECT * FROM qna_comment "
					+ "WHERE comment_board_num = ? AND comment_delete = 'N' "
					+ "ORDER BY comment_num DESC";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				CommentVo commentVo = new CommentVo(rs.getInt("comment_num"), rs.getString("comment_id"),
						rs.getString("comment_name"), rs.getString("comment_content"),
						rs.getTimestamp("comment_date"));
				commentList.add(commentVo);
			}		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		return commentList;
	}

	@Override
	public void deleteComment(int comment_num) {
		conn = JdbcUtil.getConnection();
		
		try {
			String sql = "UPDATE qna_comment SET comment_delete = 'Y' WHERE comment_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, comment_num);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
	}

	@Override
	public int getCommentListCount(int board_num) {
		conn = JdbcUtil.getConnection();
		int listCount = 0;
		
		try {
			String sql = "SELECT COUNT(*) FROM qna_comment "
					+ "WHERE comment_board_num = ? AND comment_delete ='N'";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_num);
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
	public ArrayList<CommentVo> getCommentList(int board_num, OraclePageMaker pageMaker) {
		conn = JdbcUtil.getConnection();
		ArrayList<CommentVo> commentList = new ArrayList<>();
		
		try {
			String sql =  "SELECT * FROM "
					+ "(SELECT ROWNUM AS r, TEMP.* FROM "
					+ "(SELECT * FROM qna_comment WHERE comment_board_num = ? AND comment_delete = 'N' "
					+ "ORDER BY comment_num DESC) TEMP) WHERE r BETWEEN ? AND ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			pstmt.setInt(2, pageMaker.getStartRow());
			pstmt.setInt(3, pageMaker.getEndRow());
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				CommentVo commentVo = new CommentVo(rs.getInt("comment_num"), rs.getString("comment_id"),
						rs.getString("comment_name"), rs.getString("comment_content"),
						rs.getTimestamp("comment_date"));
				commentList.add(commentVo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		return commentList;
	}
	
}
