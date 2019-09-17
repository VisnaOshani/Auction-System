package com.feedback;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class feedbackDao {
	
String sql = "insert into feedback(uname, type, description) values (?,?,?)";
	

	public boolean check(String uname, String subject, String desc) {
		try {
			int status =0;
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/logindatabase", "root", "");
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, uname);
			st.setString(2, subject);
			st.setString(3, desc);
			status = st.executeUpdate();
			if (status == 1) {
				return true;
			}
		} catch (Exception e) {

			e.printStackTrace();
		}

		return false;
	}

}
