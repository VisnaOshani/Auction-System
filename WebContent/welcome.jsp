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
<link rel="stylesheet" type="text/css" href="Styles/product.css">
<link rel="stylesheet" type="text/css" href="Styles/products.css">

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Insert title here</title>
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
		<div class="dropdown">
			<ul>
				<li><a href="adding.jsp">Adding Products</a></li>
				<li><a href="feedback.jsp">Provide Feedback</a></li>
				<li><a href="deleteMyProducts.jsp">Delete My Products</a></li>
			</ul>
		</div>
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
			<font><strong>What's going on the auction</strong></font>
		</h2>
		<div>
			<form action="welcome.jsp" method="post">
				<select id="category" name="category">
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
		<div class="products">
			<ul>

				<%
					try {
						connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/logindatabase", "root", "");
						statement = connection.createStatement();
						String cat = request.getParameter("category");
						String sql = "SELECT * FROM Product";
						String sql2 = "SELECT * FROM Product WHERE Category = 'clothing'";
						String sql3 = "SELECT * FROM Product WHERE Category = 'electronics'";
						String sql4 = "SELECT * FROM Product WHERE Category = 'furniture'";
						if (cat.equals("all")) {
							resultSet = statement.executeQuery(sql);
							while (resultSet.next()) {
				%>
				<li>
					<div class="product">
						<form action="View" method="post">
							<a href="#" class="img"><img
								src="images/<%=resultSet.getString("Category")%>.jpg" /></a> <a
								href="#" class="name"><%=resultSet.getString("ProductName")%></a>
								
								<a href="#" class="name">ID : <%=resultSet.getString("pid")%></a>
							<a href="#" class="name">Sellers's Username : <%=resultSet.getString("uname")%></a>
							<div>
								LKR.
								<%=resultSet.getString("MinBid")%></div>
							<a href="ProductView.jsp?ProductId=<%=resultSet.getInt("pid")%>"
								class="cart"><button type="button" class="view_btn">View</button></a>

						</form>
					</div>
				</li>
				<%
					}
						} else if (cat.equals("clothing")) {
							resultSet = statement.executeQuery(sql2);
							while (resultSet.next()) {
				%>
				<form action="View" method="post">
					<li>
						<div class="product">
							<a href="#" class="img"><img
								src="images/<%=resultSet.getString("Category")%>.jpg" /></a> <a
								href="#" class="name"><%=resultSet.getString("ProductName")%></a>
								<a href="#" class="name">ID : <%=resultSet.getString("pid")%></a>
							<a href="#" class="name">Sellers's Username : <%=resultSet.getString("uname")%></a>
							<div>
								LKR.
								<%=resultSet.getString("MinBid")%></div>
							<a href="ProductView.jsp?ProductId=<%=resultSet.getInt("pid")%>"
								class="cart"><button type="button" class="view_btn">View</button></a>

						</div>
					</li>
				</form>
				<%
					}
						} else if (cat.equals("electronics")) {
							resultSet = statement.executeQuery(sql3);
							while (resultSet.next()) {
				%>
				<form action="View" method="post">
					<li>
						<div class="product">
							<a href="#" class="img"><img
								src="images/<%=resultSet.getString("Category")%>.jpg" /></a> <a
								href="#" class="name"><%=resultSet.getString("ProductName")%></a>
								<a href="#" class="name">ID : <%=resultSet.getString("pid")%></a>
							<a href="#" class="name">Sellers's Username : <%=resultSet.getString("uname")%></a>
							<div>
								LKR.
								<%=resultSet.getString("MinBid")%></div>
							<a href="ProductView.jsp?ProductId=<%=resultSet.getInt("pid")%>"
								class="cart"><button type="button" class="view_btn">View</button></a>

						</div>
					</li>
				</form>
				<%
					}
						} else if (cat.equals("furniture")) {
							resultSet = statement.executeQuery(sql4);
							while (resultSet.next()) {
				%>
				<form action="View" method="post">
					<li>
						<div class="product">
							<a href="#" class="img"><img
								src="images/<%=resultSet.getString("Category")%>.jpg" /></a> <a
								href="#" class="name"><%=resultSet.getString("ProductName")%></a>
								<a href="#" class="name">ID : <%=resultSet.getString("pid")%></a>
							<a href="#" class="name">Sellers's Username : <%=resultSet.getString("uname")%></a>
							<div>
								LKR.
								<%=resultSet.getString("MinBid")%></div>
							<a href="ProductView.jsp?ProductId=<%=resultSet.getInt("pid")%>"
								class="cart"><button type="button" class="view_btn">View</button></a>

						</div>
					</li>
				</form>
				<%
					}
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
				%>
			</ul>
		</div>

	</div>

</body>
</html>