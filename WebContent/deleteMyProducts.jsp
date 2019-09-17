<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="Styles/HeaderStyle.css">
<link rel="stylesheet" type="text/css" href="Styles/backgroundImage.css">
<link rel="stylesheet" type="text/css" href="Styles/welcomeStyle.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>myproducts</title>
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
			<a class="active" href="welcome.jsp">Home</a>

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
		%>
		<h2 align="center">
			<font><strong>Delete Your Products....</strong></font>
		</h2>
		<div>
			<form action="deleteMyProducts.jsp" method="post">
				<select id="category" name="category">Sort
					<option value="all">all</option>
					<option value="clothing">Clothing</option>
					<option value="electronics">Electronics</option>
					<option value="furniture">Furniture</option>
				</select>
				<button type="submit" class="refresh_btn">
					<i class="fa fa-refresh"></i>
				</button>

			</form>
		</div>
		<table align="center" cellpadding="5" cellspacing="5" border="1">
			<tr>

			</tr>
			<tr bgcolor="#A52A2A">

				<td><b>Product id</b></td>
				<td><b>Seller's username</b></td>
				<td><b>ProductName</b></td>
				<td><b>Minimum Bid</b></td>
				<td><b>Category</b></td>
				<td><b>descrpition</b></td>
				<td><b>Last Bidder</b></td>


			</tr>
			<%
				try {
					connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/logindatabase", "root", "");
					statement = connection.createStatement();
					String cat = request.getParameter("category");
					String uname = (String) session.getAttribute("username");
					String sql = "SELECT * FROM Product WHERE uname = '" + uname + "'";
					String sql2 = "SELECT * FROM Product WHERE Category = 'clothing' and uname = '" + uname + "'";
					String sql3 = "SELECT * FROM Product WHERE Category = 'electronics' and uname = '" + uname + "'";
					String sql4 = "SELECT * FROM Product WHERE Category = 'furniture' and uname = '" + uname + "'";
					if (cat.equals("all")) {
						resultSet = statement.executeQuery(sql);
						while (resultSet.next()) {
			%>
			<tr bgcolor="#DEB887">
				<form action="View" method="post">
					<td name="pid"><a href="adding.jsp"><%=resultSet.getString("pid")%></a></td>
					<td><%=resultSet.getString("uname")%></td>
					<td><%=resultSet.getString("ProductName")%></td>
					<td><%=resultSet.getString("MinBid")%></td>
					<td><%=resultSet.getString("Category")%></td>
					<td><%=resultSet.getString("descrpition")%></td>
					<td><%=resultSet.getString("Lbidder")%></td>

					<td><a href='delete.jsp?d=<%=resultSet.getString("pid")%>'><button
								type="button" class="delete_btn">delete</button></a></td>
				</form>
			</tr>

			<%
				}
					} else if (cat.equals("clothing")) {
						resultSet = statement.executeQuery(sql2);
						while (resultSet.next()) {
			%>
			<tr bgcolor="#DEB887">
				<form action="View" method="post">
					<td name="pid"><a href="adding.jsp"><%=resultSet.getString("pid")%></a></td>
					<td><%=resultSet.getString("uname")%></td>
					<td><%=resultSet.getString("ProductName")%></td>
					<td><%=resultSet.getString("MinBid")%></td>
					<td><%=resultSet.getString("Category")%></td>
					<td><%=resultSet.getString("descrpition")%></td>
					<td><%=resultSet.getString("Lbidder")%></td>

					<td><a href='delete.jsp?d=<%=resultSet.getString("pid")%>'><button
								type="button" class="delete_btn">delete</button></a></td>
				</form>
			</tr>
			<%
				}
					} else if (cat.equals("electronics")) {
						resultSet = statement.executeQuery(sql3);
						while (resultSet.next()) {
			%>
			<tr bgcolor="#DEB887">
				<form action="View" method="post">
					<td name="pid"><a href="adding.jsp"><%=resultSet.getString("pid")%></a></td>
					<td><%=resultSet.getString("uname")%></td>
					<td><%=resultSet.getString("ProductName")%></td>
					<td><%=resultSet.getString("MinBid")%></td>
					<td><%=resultSet.getString("Category")%></td>
					<td><%=resultSet.getString("descrpition")%></td>
					<td><%=resultSet.getString("Lbidder")%></td>

					<td><a href='delete.jsp?d=<%=resultSet.getString("pid")%>'><button
								type="button" class="delete_btn">delete</button></a></td>
				</form>
			</tr>
			<%
				}
					} else if (cat.equals("furniture")) {
						resultSet = statement.executeQuery(sql4);
						while (resultSet.next()) {
			%>
			<tr bgcolor="#DEB887">
				<form action="View" method="post">
					<td name="pid"><a href="adding.jsp"><%=resultSet.getString("pid")%></a></td>
					<td><%=resultSet.getString("uname")%></td>
					<td><%=resultSet.getString("ProductName")%></td>
					<td><%=resultSet.getString("MinBid")%></td>
					<td><%=resultSet.getString("Category")%></td>
					<td><%=resultSet.getString("descrpition")%></td>
					<td><%=resultSet.getString("Lbidder")%></td>

					<td><a href='delete.jsp?d=<%=resultSet.getString("pid")%>'><button
								type="button" class="delete_btn">delete</button></a></td>
				</form>
			</tr>
			<%
				}
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			%>
		</table>
	</div>

</body>
</html>