package Util;

import java.sql.*;

public class DBUtil {
	
	public static Connection dbconnect() {
		Connection conn = null;
		
		
		String url = "jdbc:mysql://eungho77.ipdisk.co.kr:3306/rest?CharacterEncording=UTF-8&serverTimezone=UTC&useSSL=false";
		String id = "keh_as";
		String pass = "personal1234!@";
		try {
			conn = DriverManager.getConnection(url, id, pass);
		} catch (SQLException e) {
			System.out.println("Driver Connect Fail");
			e.printStackTrace();
		}
		return conn;
	}

	public static void dbdisconnect(Connection conn, Statement st, ResultSet rs) {
		try {
			if(rs != null) rs.close();
			if(st != null) st.close();
			if (conn != null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
