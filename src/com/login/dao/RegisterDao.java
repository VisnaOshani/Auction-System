package com.login.dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class RegisterDao {
	
	String sql = "insert into login (name,uname,pass,email) values (?,?,?,?)";
	String username = "root";
	String password = "";
	
	public boolean check(String name,String uname, String pass,String email) {
		try {
			int status =0;
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/logindatabase", "root", "");
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, name);
			st.setString(2, uname);
			st.setString(3, pass);
			st.setString(4, email);
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
	


