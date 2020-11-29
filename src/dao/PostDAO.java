package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import vo.EvaluationVO;
import vo.LectureVO;
import vo.PostVO;
import vo.UserVO;

public class PostDAO extends DAOBase {
	public PostDAO() {
		super();
	}

	public ArrayList<PostVO> selectByCategory(String category) {
		ArrayList<PostVO> vos = new ArrayList<>();
		
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		String sql = "select p.*, u.username from post p left join user u on p.user_id = u.id where p.category=? order by p.id desc";
		
		try {
			con = DriverManager.getConnection(url, db_id, db_pw);
			stmt = con.prepareStatement(sql);
			stmt.setString(1, category);
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				PostVO vo = new PostVO(rs);
				vos.add(vo);
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
		
		return vos;
	}

	public ArrayList<PostVO> selectByCategoryTitle(String category, String title) {
		ArrayList<PostVO> vos = new ArrayList<>();
		
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		String sql = "select p.*, u.username from post p left join user u on p.user_id = u.id where p.category=? and p.title like '%"+title+"%' order by p.id desc";
		
		try {
			con = DriverManager.getConnection(url, db_id, db_pw);
			stmt = con.prepareStatement(sql);
			stmt.setString(1, category);
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				PostVO vo = new PostVO(rs);
				vos.add(vo);
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
		
		return vos;
	}

	public ArrayList<PostVO> selectByCategoryAuthor(String category, String author) {
		ArrayList<PostVO> vos = new ArrayList<>();
		
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		String sql = "select p.*, u.username from post p left join user u on p.user_id = u.id where p.category=? and u.username like '%"+author+"%' order by p.id desc";
		
		try {
			con = DriverManager.getConnection(url, db_id, db_pw);
			stmt = con.prepareStatement(sql);
			stmt.setString(1, category);
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				PostVO vo = new PostVO(rs);
				vos.add(vo);
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
		
		return vos;
	}
	
	public ArrayList<PostVO> selectByCategory(String category, int limit) {
		ArrayList<PostVO> vos = new ArrayList<>();
		
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		String sql = "select p.*, u.username from post p left join user u on p.user_id = u.id where p.category=? order by p.id desc limit ?";
		
		try {
			con = DriverManager.getConnection(url, db_id, db_pw);
			stmt = con.prepareStatement(sql);
			stmt.setString(1, category);
			stmt.setInt(2, limit);
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				PostVO vo = new PostVO(rs);
				vos.add(vo);
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
		
		return vos;
	}
	
	public PostVO findPost(int id, String category) {
		PostVO vo = null;
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		String sql = "select p.*, u.username from post p left join user u on p.user_id = u.id where p.id=? and p.category=?";
		
		try {
			con = DriverManager.getConnection(url, db_id, db_pw);
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, id);
			stmt.setString(2, category);
			rs = stmt.executeQuery();
			
			if (rs.next()) {
				vo = new PostVO(rs);
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
		
		return vo;
	}
	
	public int addPost(String category, String title, String content, String userId) {
		Connection con = null;
		PreparedStatement stmt = null;
		int postId = -1;
		String sql = "insert into post(category, title, content, user_id) values(?,?,?,?)";
		
		try {
			con = DriverManager.getConnection(url, db_id, db_pw);
			stmt = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			stmt.setString(1, category);
			stmt.setString(2, title);
			stmt.setString(3, content);
			stmt.setString(4, userId);
			stmt.execute();
			
			ResultSet rs = stmt.getGeneratedKeys();
		    rs.next();
		    postId = rs.getInt(1);
		    rs.close();
			
			System.out.println("DB: 글 등록됨 "+postId);
		}
		catch (Exception e) {
			System.out.println("DB: 글 등록 실패");
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
		return postId;
	}
	
	public boolean removePost(PostVO vo) {
		Connection con = null;
		PreparedStatement stmt = null;
		boolean ret = false;
		String sql = "delete from post where id=? and category=?";
		
		try {
			con = DriverManager.getConnection(url, db_id, db_pw);
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, vo.getId());
			stmt.setString(2, vo.getCategory());
			stmt.executeUpdate();
			
			System.out.println("DB: 글 삭제됨 ");
			ret = true;
		}
		catch (Exception e) {
			System.out.println("DB: 글 삭제실패");
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
