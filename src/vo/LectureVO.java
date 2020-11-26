package vo;

import java.io.Serializable;

public class LectureVO implements Serializable {
	private int id;
	private String name;
	private String professor;
	private int rating;

	public LectureVO(int id, String name, String professor, int rating) {
		this.id = id;
		this.name = name;
		this.professor = professor;
		this.rating = rating;
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

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

}
