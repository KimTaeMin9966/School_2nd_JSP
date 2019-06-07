package util;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class JdbcUtil {

	/**
	 * 연결정보를 WebContent -> META-INF -> context.xml 에서가져온다.
	 * 
	 * @return
	 */
	public static Connection getConnection() {
		Connection conn = null;

		if (conn == null) {
			try {
				Context init = new InitialContext();
				DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
				conn = ds.getConnection();
			} catch (NamingException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return conn;
	}

	/**
	 * AutoCloseable 객체를 넘겨 받아 연결을 종료한다
	 * 
	 * @param closeable
	 */
	public static void close(AutoCloseable closeable) {
		try {
			if (closeable != null) {
				closeable.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
