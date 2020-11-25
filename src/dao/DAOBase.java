package dao;

public class DAOBase {
	protected final static String url = "jdbc:mysql://localhost:3306/LectureEvaluation?characterEncoding=UTF-8&serverTimezone=UTC";
	protected final static String db_id = "web";
	protected final static String db_pw = "web@1234";
	
	public DAOBase() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
}
