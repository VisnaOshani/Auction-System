<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">

<link rel="stylesheet" type="text/css" href="Styles/LoginStyle.css">
<link rel="stylesheet" type="text/css" href="Styles/HeaderStyle.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">

<title>login</title>

</head>
<body>
<div class="header">
		<a href="#default" class="logo">Online Auction System</a>
		<div class="header-right">
			
		</div>
	</div>
	<br><br>
	<div class="container">
		<h1>LOG IN</h1>
		<form action="Login" method="post">


			<div class="tbox">
				<input type="text" placeholder="Enter Username" name="uname">
			</div>
			<div class="tbox">
				<input type="password" placeholder="Enter Password" name="pass">
			</div>
			<input class="lbtn" type="submit" value="login">
			<h3>${failMessage}</h3>

		</form>
		<a href="register.jsp"
			class="b2">Registration</a>
	</div>
</body>
</html>