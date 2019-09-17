<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="Styles/AddingStyle.css">
<link rel="stylesheet" type="text/css" href="Styles/HeaderStyle.css">
<link rel="stylesheet" type="text/css" href="backgroundImage.css">
<title>adding</title>
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
	
	<div class="container">
		<form action="addProduct" method="post">
		
			<div class="row">
				<div class="col-25">
					<label for="fname">Enter Product Name</label>
				</div>
				<div class="col-75">
					<input type="text" id="fname" name="pname"
						placeholder="product name..">
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<label for="lname">Enter Minimum Bid Amount</label>
				</div>
				<div class="col-75">
					<input type="number" id="lname" name="minBid"
						placeholder="minimum bid..">
				</div>
			</div>
			
			<div class="row">
				<div class="col-25">
					<label for="country">Select Category</label>
				</div>
				<div class="col-75">
					<select id="country" name="category">
						<option value="clothing">Clothing</option>
						<option value="electronics">Electronics</option>
						<option value="furniture">Furniture</option>
						<option value="other">Other</option>
					</select>
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<label for="subject">Enter Product Description</label>
				</div>
				<div class="col-75">
					<textarea id="subject" name="pDesc"
						placeholder="description...." style="height: 200px"></textarea>
				</div>
			</div>
			<div class="row">
				<input type="submit" value="Submit">
			</div>
			<h1>${successMessage}</h1>
		</form>
	</div>

</body>
</html>