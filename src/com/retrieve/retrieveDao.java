package com.retrieve;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class retrieveDao {

	String sql = "UPDATE Product SET MinBid = ? WHERE pid = ?";
	
	public boolean check(String pid, String minBid) {
		try {
			int status = 0;
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/logindatabase", "root", "");
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, minBid);
			st.setString(2, pid);
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
