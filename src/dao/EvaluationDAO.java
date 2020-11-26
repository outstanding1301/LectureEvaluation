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
import vo.UserVO;

public class EvaluationDAO extends DAOBase {
	public EvaluationDAO() {
		super();
	}

	public ArrayList<EvaluationVO> selectByLectureId(int lectureId) {
		ArrayList<EvaluationVO> vos = new ArrayList<>();
		
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		String sql = "select * from evaluation where lecture_id=? order by eval_date desc";
		
		try {
			con = DriverManager.getConnection(url, db_id, db_pw);
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, lectureId);
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				EvaluationVO vo = new EvaluationVO(rs);
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
	
	public boolean addEvaluation(int lectureId, int rating, String userId, String comment) {
		Connection con = null;
		PreparedStatement stmt = null;
		boolean ret = false;
		String sql = "insert into evaluation(lecture_id, rating, user_id, comment) values(?,?,?,?)";
		
		try {
			con = DriverManager.getConnection(url, db_id, db_pw);
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, lectureId);
			stmt.setInt(2, rating);
			stmt.setString(3, userId);
			stmt.setString(4, comment);
			stmt.execute();
			
			System.out.println("DB: 강의평가 등록됨 ");
			ret = true;
		}
		catch (Exception e) {
			System.out.println("DB: 강의평가 등록 실패");
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
