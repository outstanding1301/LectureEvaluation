package vo;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class EvaluationVO implements Serializable {
	private int id;
	private int lectureId;
	private int rating;
	private String userId;
	private Date date;
	private String comment;
	
	public EvaluationVO(int id, int lectureId, int rating, String userId, Date date, String comment) {
		this.id = id;
		this.lectureId = lectureId;
		this.rating = rating;
		this.userId = userId;
		this.date = date;
		this.comment = comment;
	}

	public EvaluationVO(ResultSet rs) throws SQLException {
		id = rs.getInt(1);
		lectureId = rs.getInt(2);
		rating = rs.getInt(3);
		userId = rs.getString(4);
		String dateStr = rs.getString(5);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			date = sdf.parse(dateStr);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		comment = rs.getString(6);
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getLectureId() {
		return lectureId;
	}

	public void setLectureId(int lectureId) {
		this.lectureId = lectureId;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

}
