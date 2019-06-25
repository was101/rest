package com.rest.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import Util.DBUtil;

public class DisableDAO {
	
	Connection conn;
	Statement st; 
	PreparedStatement ps;
	ResultSet rs;
	int result = 0;
	
	public int insert(int rm_no, int used) {
		conn = DBUtil.dbconnect();
		String sql = "insert into disable (rm_no,used) values(?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, rm_no);
			ps.setInt(2, used);
			result = ps.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtil.dbdisconnect(conn, st, rs);
		}
		return result;
	}
	
	public int update(int rm_no, int used) {
		conn = DBUtil.dbconnect();
		String sql = "update disable set used=? where rm_no=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, used);
			ps.setInt(2, rm_no);
			result = ps.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtil.dbdisconnect(conn, st, rs);
		}
		return result;
	}
	
	public String select() {
		conn = DBUtil.dbconnect();
		String sql = "select * from disable";
		String str = "";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				str += rs.getInt(1) + "/" + rs.getInt(2) + "@";
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtil.dbdisconnect(conn, st, rs);
		}
		return str;
	}
}
