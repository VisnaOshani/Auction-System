<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="Styles/HeaderStyle.css">
<link rel="stylesheet" type="text/css" href="Styles/backgroundImage.css">
<link rel="stylesheet" type="text/css" href="Styles/welcomeStyle.css">
<title>feedback</title>
</head>
<body>
	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

		response.setHeader("pragma", "no-cache");

		response.setHeader("Expires", "0");

		if (session.getAttribute("username") == null) {
			response.sendRedirect("login.jsp");
		}
	%>
	<div class="header">
		<a href="#default" class="logo">Online Auction System</a>
		<div class="header-right">
			<a class="active" href="welcomeAdmin.jsp">Home</a> 

		</div>
	</div>
	<div class="header-right">
		Welcome..... ${username}
		<form action="Logout">
			<input type="submit" value="logout"
				style="background-color: #f44336;">
		</form>
	</div>

	<br>
	<br>
	<br>
	<div class="container">
		<%@page import="java.sql.DriverManager"%>
		<%@page import="java.sql.ResultSet"%>
		<%@page import="java.sql.Statement"%>
		<%@page import="java.sql.Connection"%>

		<%
			String id = request.getParameter("userId");
			String driverName = "com.mysql.jdbc.Driver";

			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}

			Connection connection = null;
			Statement statement = null;
			ResultSet resultSet = null;

			try {
				connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/logindatabase", "root", "");
				statement = connection.createStatement();
				String cat = request.getParameter("category");
				String sql = "SELECT * FROM Feedback";
				resultSet = statement.executeQuery(sql);
				while (resultSet.next()) {
		%>

		<h1>
			-From
			<%=resultSet.getString("uname")%></h1>
			<h2><%=resultSet.getString("type")%></h2>
		<h3><%=resultSet.getString("description")%></h3>

		<%
			}
			} catch (Exception e) {
				e.printStackTrace();
			}
		%>
	</div>
</body>
</html>