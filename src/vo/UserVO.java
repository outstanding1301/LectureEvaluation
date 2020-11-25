package vo;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserVO implements Serializable {
	private String id;
	private String username;
	private String password;
	private String studentId;
	private int major;
	private String email;
	private String phone;
	
	public UserVO() {
		
	}
	
	public UserVO(String id, String username, String password, String studentId, int major, String email,
			String phone) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.studentId = studentId;
		this.major = major;
		this.email = email;
		this.phone = phone;
	}

	public UserVO(ResultSet rs) throws SQLException {
		id = rs.getString(1);
		username = rs.getString(2);
		password = rs.getString(3);
		studentId = rs.getString(4);
		major = rs.getInt(5);
		email = rs.getString(6);
		phone = rs.getString(7);
	}
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getUsername() {
		return username;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getPassword() {
		return password;
	}

	public String getStudentId() {
		return studentId;
	}

	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}

	public int getMajor() {
		return major;
	}

	public void setMajor(int major) {
		this.major = major;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Override
	public String toString() {
		return "UserVO [id=" + id + ", username=" + username + ", password=" + password + ", studentId=" + studentId
				+ ", major=" + major + ", email=" + email + ", phone=" + phone + "]";
	}
}
