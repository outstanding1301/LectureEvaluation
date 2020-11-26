package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import vo.UserVO;

public class UserDAO extends DAOBase {
	public UserDAO() {
		super();
	}

	public ArrayList<UserVO> selectAll() {
		ArrayList<UserVO> users = new ArrayList<>();
		
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		String sql = "select * from user";
		
		try {
			con = DriverManager.getConnection(url, db_id, db_pw);
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				UserVO user = new UserVO(rs);
				users.add(user);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if (rs != null) rs.close();
				if (stmt != null) stmt.close();
				if (con != null) con.close();
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return users;
	}
	
	public UserVO findUser(String id) {
		UserVO user = null;
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		String sql = "select * from user where id like ?";
		
		try {
			con = DriverManager.getConnection(url, db_id, db_pw);
			stmt = con.prepareStatement(sql);
			stmt.setString(1, id);
			rs = stmt.executeQuery();
			
			if (rs.next()) {
				user = new UserVO(rs);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if (rs != null) rs.close();
				if (stmt != null) stmt.close();
				if (con != null) con.close();
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return user;
	}
	
	public boolean addUser(UserVO user) {
		Connection con = null;
		PreparedStatement stmt = null;
		boolean ret = false;
		String sql = "insert into user values(?,?,?,?,?,?,?,?)";
		
		try {
			con = DriverManager.getConnection(url, db_id, db_pw);
			stmt = con.prepareStatement(sql);
			stmt.setString(1, user.getId());
			stmt.setString(2, user.getUsername());
			stmt.setString(3, user.getPassword());
			stmt.setString(4, user.getStudentId());
			stmt.setString(5, user.getEmail());
			stmt.setString(6, user.getPhone());
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String currentTime = sdf.format(user.getRegDate());
			
			stmt.setString(7, currentTime);
			stmt.setBoolean(8, user.isAdmin());
			stmt.execute();
			System.out.println("DB: 유저 생성됨 "+user.toString());
			ret = true;
		}
		catch (Exception e) {
			System.out.println("DB: 유저 생성 실패 "+user.toString());
			e.printStackTrace();
		}
		finally {
			try {
				if (stmt != null) stmt.close();
				if (con != null) con.close();
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		return ret;
	}
}
