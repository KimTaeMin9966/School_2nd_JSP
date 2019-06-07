package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class JdbcUtil {
	
	/**
	 * 연결정보를 WebContent -> META-INF -> context.xml 에서가져온다.
	 * @return
	 */
	public static Connection getConnection() {
		Connection conn = null;
		
		if (conn == null) {
			try {
				Context init = new InitialContext();
				DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
				conn = ds.getConnection();
			}
			catch (NamingException e) { e.printStackTrace(); }
			catch (SQLException e) { e.printStackTrace(); }
		}
		return conn;
	}
	
	/**
	 * Connection 객체를 넘겨 받아 연결을 종료한다
	 * @param conn
	 */
	public static void close(Connection conn) {
		try { if(conn != null) { conn.close(); } }
		catch (SQLException e) { e.printStackTrace(); }
	}
	
	/**
	 * Connection 객체를 넘겨 받아 DB에 커밋을 날린다
	 * @param conn
	 */
	public static void commit(Connection conn) {
		try { conn.commit(); }
		catch (SQLException e) { e.printStackTrace(); }
	}
	
	/**
	 * Connection 객체를 넘겨 받아 DB에 롤백을 날린다
	 * @param conn
	 */
	public static void rollback(Connection conn) {
		try { conn.rollback(); }
		catch (SQLException e) { e.printStackTrace(); }
	}
	
	/**
	 * PreparedStatement 객체를 넘겨 받아 연결을 종료한다
	 * @param pstmt
	 */
	public static void close(PreparedStatement pstmt) {
		try { if(pstmt != null) { pstmt.close(); } }
		catch (SQLException e) { e.printStackTrace(); }
	}
	
	/**
	 * ResultSet 객체를 넘겨 받아 연결을 종료한다
	 * @param rs
	 */
	public static void close(ResultSet rs) {
		try { if(rs != null) { rs.close(); } }
		catch (SQLException e) { e.printStackTrace(); }
	}
}
