package com.product.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class addProductDao {
	
	String sql = "insert into Product (uname,ProductName,MinBid,Category,descrpition) values (?,?,?,?,?)";
	String username = "root";
	String password = "";
	
	public boolean check(String uname,String pname,double minBid, String category,String pDesc) {
		try {
			int status =0;
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/logindatabase", "root", "");
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, uname);
			st.setString(2, pname);
			st.setDouble(3, minBid);
			st.setString(4, category);
			st.setString(5, pDesc);
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
