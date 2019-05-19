package com.rest.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.rest.VO.UserVO;

//--------------암&복호화
import org.apache.tomcat.util.codec.binary.Base64;

import java.io.IOException;
import java.security.*;
import javax.crypto.*;
import javax.crypto.spec.*;
//--------------암&복호화 end

import Util.DBUtil;

public class UserDAO {

	Connection conn;
	Statement st; 
	PreparedStatement ps;
	ResultSet rs;
	int result = 0;

	public UserVO getuser(String nickname) {
		UserVO vo = null;
		conn = DBUtil.dbconnect();
		String sql = "SELECT * from user where nickname=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, nickname);
			rs = ps.executeQuery();
			while (rs.next()) {
				vo = new UserVO();
				vo.setNickname(rs.getString(1));
				vo.setPw(rs.getString(2));
				vo.setEmail(rs.getString(3));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbdisconnect(conn, ps, rs);
		}
		System.out.println(vo);
		return vo;
	}

	public int signUp(String nickname, String password, String email) {
		conn = DBUtil.dbconnect();
		String sql = "INSERT INTO user VALUES(?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, nickname);
			ps.setString(2,  password);
			ps.setString(3,  email);
			result = ps.executeUpdate();
			return result;
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtil.dbdisconnect(conn, st, rs);
		}
		return result;
	}
	
	public boolean confirmNick(String nickname, String pw) {
		conn = DBUtil.dbconnect();
		String sql = "SELECT nickname from user where nickname=? and pw=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1,  nickname);
			ps.setString(2,  pw);
			rs = ps.executeQuery();
			if(rs.next()) return true;	
		} catch(SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			DBUtil.dbdisconnect(conn, st, rs);
		}
		return false;
	}
	
	public String findNick(String email) {
		String nickName = "";
		conn = DBUtil.dbconnect();
		String sql = "SELECT nickname from user where Email=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, email + "@openhands.co.kr");
			rs = ps.executeQuery();
			while(rs.next()) {
				nickName = rs.getString(1);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbdisconnect(conn, st, rs);
		}
		return nickName;
	}
	
	public String findPW(String nickname, String email) throws IOException {
		String pw = "";
		conn = DBUtil.dbconnect();
		String sql = "SELECT pw from user where nickname=? and email=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, nickname);
			ps.setString(2, email + "@openhands.co.kr");
			rs = ps.executeQuery();
			while(rs.next()) {
				pw =  rs.getString(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtil.dbdisconnect(conn, st, rs);
		}
		return pw;
	}
	
	public boolean duplNick(String nickname) {
		conn = DBUtil.dbconnect();
		String sql = "SELECT nickname from user where nickname=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1,  nickname);
			rs = ps.executeQuery();
			if(rs.next()) return true;	
		} catch(SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			DBUtil.dbdisconnect(conn, st, rs);
		}
		return false;
	}
	
	public boolean duplEmail(String email) {
		conn = DBUtil.dbconnect();
		String sql = "SELECT email from user where email=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1,  email);
			rs = ps.executeQuery();
			if(rs.next()) return true;	
		} catch(SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			DBUtil.dbdisconnect(conn, st, rs);
		}
		return false;
	}
	
}
