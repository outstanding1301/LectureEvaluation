package vo;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class UserVO implements Serializable {
	private String id;
	private String username;
	private String password;
	private String studentId;
	private String email;
	private String phone;
	private Date regDate;
	private boolean admin;
	
	public UserVO() {
		
	}

	public UserVO(ResultSet rs) throws SQLException {
		id = rs.getString(1);
		username = rs.getString(2);
		password = rs.getString(3);
		studentId = rs.getString(4);
		email = rs.getString(5);
		phone = rs.getString(6);
		String dateStr = rs.getString(7);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			regDate = sdf.parse(dateStr);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		admin = rs.getInt(8) == 1;
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

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public boolean isAdmin() {
		return admin;
	}

	public void setAdmin(boolean admin) {
		this.admin = admin;
	}

	@Override
	public String toString() {
		return "UserVO [id=" + id + ", username=" + username + ", password=" + password + ", studentId=" + studentId
				+ ", email=" + email + ", phone=" + phone + ", regDate=" + regDate + ", admin=" + admin + "]";
	}
}
