package com.rest.DAO;

import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.rest.VO.ReservationVO;

import Util.DBUtil;


public class ReservationDAO {

	Connection conn;
	Statement st; 
	PreparedStatement ps;
	ResultSet rs;
	int result = 0;
	
	public int reservation(ReservationVO vo) {
		conn = DBUtil.dbconnect();
		String sql = "INSERT INTO reservation (Time, Rm_no, Nickname) VALUES(?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getTime());
			ps.setInt(2, vo.getRm_no());
			ps.setString(3, vo.getNickname());
			result = ps.executeUpdate();
			return result;
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtil.dbdisconnect(conn, st, rs);
		}
		return result;
	}
	
	public String booked() {
		String str = "[";
		conn = DBUtil.dbconnect();
		String sql = "SELECT * from reservation";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				str += "[" + rs.getInt(3) + ",'" + rs.getString(2) + "'],";
			}
			str += "@@]";
			str = str.replace(",@@", "");
			str = str.replace("@@", "");
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtil.dbdisconnect(conn, st, rs);
		}
		return str;
	}
	
	public int findRes(String nickname, String time) {
		conn = DBUtil.dbconnect();
		String sql = "SELECT rm_id from reservation where nickname=? and time=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, nickname);
			ps.setString(2, time);
			rs = ps.executeQuery();
			while(rs.next()) {
				return rs.getInt(1);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbdisconnect(conn, st, rs);
		}
		return -1;
	}
	
	public int delete(int rm_id) {
		conn = DBUtil.dbconnect();
		String sql = "DELETE FROM reservation WHERE rm_id=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, rm_id);
			result = ps.executeUpdate();
			return result;
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtil.dbdisconnect(conn, st, rs);
		}
		return result;
	}
	
	public int getID(String time, String nickname) {
		conn = DBUtil.dbconnect();
		int rm_id = 0;
		String sql = "SELECT * FROM reservation WHERE time=? AND nickname=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, time);
			ps.setString(2, nickname);
			rs = ps.executeQuery();
			while(rs.next()) {
				rm_id = rs.getInt(1);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtil.dbdisconnect(conn, st, rs);
		}
		return rm_id;
	}
	
	public int resCheck(String nickname) {
		int num = 0;
		conn = DBUtil.dbconnect();
		String sql = "SELECT rm_id from reservation where nickname=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, nickname);
			rs = ps.executeQuery();
			while(rs.next()) {
				num++;
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtil.dbdisconnect(conn, st, rs);
		}
		return num;
	}
	
}
