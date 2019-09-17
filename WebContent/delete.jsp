<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@page import="java.sql.DriverManager"%>
	<%@page import="java.sql.ResultSet"%>
	<%@page import="java.sql.Statement"%>
	<%@page import="java.sql.Connection"%>
	<%@page import="java.sql.PreparedStatement"%>

	<%
		String id1 = request.getParameter("d");
		int no = Integer.parseInt(id1);
		String sql = "delete from Product where pid=?";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/logindatabase", "root", "");
			Statement stat = conn.createStatement();
			stat.executeUpdate("delete from Product where pid='" + no + "'");

			response.sendRedirect("deleteMyProducts.jsp");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	%>
</body>
</html>