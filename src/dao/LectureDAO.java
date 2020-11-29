package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import vo.LectureVO;
import vo.UserVO;

public class LectureDAO extends DAOBase {
	public LectureDAO() {
		super();
	}

	public ArrayList<LectureVO> selectAll() {
		ArrayList<LectureVO> vos = new ArrayList<>();
		
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		String sql = "select l.id, l.name, l.professor, IFNULL(avg(e.rating), 0) rating, count(e.rating) eval_count "
				+ "from lecture l "
				+ "left join evaluation e on l.id = e.lecture_id "
				+ "group by l.id";
		
		try {
			con = DriverManager.getConnection(url, db_id, db_pw);
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				LectureVO vo = new LectureVO(rs);
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
	
	public ArrayList<LectureVO> selectTop(int limit) {
		ArrayList<LectureVO> vos = new ArrayList<>();
		
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		String sql = "select l.id, l.name, l.professor, IFNULL(avg(e.rating), 0) rating, count(e.rating) eval_count "
				+ "from lecture l "
				+ "left join evaluation e on l.id = e.lecture_id "
				+ "group by l.id "
				+ "order by rating desc limit ?";
		
		try {
			con = DriverManager.getConnection(url, db_id, db_pw);
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, limit);
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				LectureVO vo = new LectureVO(rs);
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
	
	public LectureVO findLecture(int id) {
		LectureVO vo = null;
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		String sql = "select l.id, l.name, l.professor, IFNULL(avg(e.rating), 0) rating, count(e.rating) eval_count "
				+ "from lecture l "
				+ "left join evaluation e on l.id = e.lecture_id "
				+ "where l.id = ? "
				+ "group by l.id";
		
		try {
			con = DriverManager.getConnection(url, db_id, db_pw);
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, id);
			rs = stmt.executeQuery();
			
			if (rs.next()) {
				vo = new LectureVO(rs);
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
}
