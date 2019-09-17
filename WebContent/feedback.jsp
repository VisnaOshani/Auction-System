<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="Styles/feedbackStyle.css">
<link rel="stylesheet" type="text/css" href="Styles/welcomeStyle.css">
<link rel="stylesheet" type="text/css" href="Styles/HeaderStyle.css">
<title>Feedback</title>
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
<h3>Please give your Feedback here....</h3>

<div class="container">
  <form action="feedback" method="post">
    <label for="fname">Subject</label>
    <input type="text" id="fname" name="subject" placeholder="Review subject....">


    <label for="subject">Description</label>
    <textarea id="subject" name="desc" placeholder="Write something....." style="height:200px"></textarea>

    <input type="submit" value="Submit">
    <h1>${successMessage}</h1>
    <h1>${failMessage}</h1>
  </form>
  
</div>


</body>
</html>