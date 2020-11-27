package vo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class PostVO {
	private int id;
	private String category;
	private String title;
	private String content;
	private String userId;
	private String username;
	private Date postedDate;
	private Date updatedDate;

	public PostVO() {
		
	}

	public PostVO(ResultSet rs) throws SQLException {
		id = rs.getInt(1);
		category = rs.getString(2);
		title = rs.getString(3);
		content = rs.getString(4);
		userId = rs.getString(5);
		String postedDateStr = rs.getString(6);
		String updatedDateStr = rs.getString(7);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			postedDate = sdf.parse(postedDateStr);
			updatedDate = sdf.parse(updatedDateStr);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		username = rs.getString(8);
	}
	
	@Override
	public String toString() {
		return "PostVO [id=" + id + ", category=" + category + ", title=" + title + ", content=" + content + ", userId="
				+ userId + ", postedDate=" + postedDate + ", updatedDate=" + updatedDate + "]";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Date getPostedDate() {
		return postedDate;
	}

	public void setPostedDate(Date postedDate) {
		this.postedDate = postedDate;
	}

	public Date getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
}
