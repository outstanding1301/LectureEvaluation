package vo;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LectureVO implements Serializable {
	private int id;
	private String name;
	private String professor;
	private double rating;
	private int evalCount;

	public LectureVO(ResultSet rs) throws SQLException {
		id = rs.getInt(1);
		name = rs.getString(2);
		professor = rs.getString(3);
		rating = rs.getDouble(4);
		evalCount = rs.getInt(5);
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getProfessor() {
		return professor;
	}

	public void setProfessor(String professor) {
		this.professor = professor;
	}

	public double getRating() {
		return rating;
	}

	public void setRating(double rating) {
		this.rating = rating;
	}
	
	public int getEvalCount() {
		return evalCount;
	}

	public void setEvalCount(int evalCount) {
		this.evalCount = evalCount;
	}
	
}
