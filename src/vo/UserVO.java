package vo;

import java.io.Serializable;

public class UserVO implements Serializable {
	private String id;
	private String username;
	private String test;
	
	public UserVO() {
		
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
	public String getTest() {
		return test;
	}
	public void setTest(String test) {
		this.test = test;
	}
}
