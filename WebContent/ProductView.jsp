<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="Styles/productView.css" />

<link rel="stylesheet" type="text/css" href="Styles/HeaderStyle.css">
<link rel="stylesheet" type="text/css" href="Styles/backgroundImage.css">
<link rel="stylesheet" type="text/css" href="Styles/welcomeStyle.css">
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
	<%
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
			String pid = request.getParameter("ProductId");
			String sql = "SELECT * FROM Product where pid = " + pid;

			resultSet = statement.executeQuery(sql);
			while (resultSet.next()) {
	%>

	<div class="container">
		<div class="row">

			<div class="col-md-8 col-sm-12 left">
				<div class="col-xs-12 l">
					<img src="images/<%=resultSet.getString("Category")%>.jpg"
						class="Bimage" width="100%">
				</div>
			</div>
			<div class="col-md-4 col-sm-12 right">
				<div class="col-xs-12 l">
					<h4 style="color: gray;">
						<b><%=resultSet.getString("ProductName")%> </b>
					</h4>
					<div class="col-xs-12 pricetag">

						Rs.
						<%=resultSet.getString("MinBid")%>
						<h5>
							Latest Bidder :<%=resultSet.getString("Lbidder")%>
						</h5>
					</div>
					<div class="col-xs-12 ">
						<hr style="border: 1.5px solid rgba(0, 0, 0, 0.05) !important;">
						<form action="UpdateBid" method="POST">
							<input type="hidden" name="currentBid"
								value='<%=resultSet.getString("MinBid")%>'> <input
								type="hidden" name="newBidder"
								value='<%=session.getAttribute("username")%>'> <input
								type="hidden" name="pid" value='<%=resultSet.getInt("pid")%>'>
							<input type="text" style="text-align: center;" name="newBid"
								class="form-control" placeholder="Bid Amount"
								required="required"><br>
							<button class="btn btn-md btn-primary btn-block" type="submit">
								<b>Place Bid </b>
							</button>
							<h3>${failMessage}</h3>
						</form>
						
						<h4>Safety Tips for Buyers</h4>
						<h6>
							<ul>
								<li>- Meet seller at a public place</li>
								<li>- Check the item before you buy</li>
								<li>- Pay only after collecting the item</li>
							</ul>

						</h6>
						<br>
					</div>
				</div>
			</div>
		</div>

		<div class="col-md-12 col-sm-12 col-xs-12 bottompart">
			<h3>
				<b>Product Description</b>
			</h3>
			<p>
				<%=resultSet.getString("descrpition")%>
			</p>
		</div>

	</div>

	<%
		}
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
</body>
</html>