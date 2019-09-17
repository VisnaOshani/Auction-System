<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="Styles/registerStyle.css">
<title>Insert title here</title>
</head>
<body>
<form action="Register" method="post">
  <div class="container">
    <h1>Register</h1>
    <p>Please fill in this form to create an account.</p>
    <hr>
	<label for="name"><b>Name  </b></label>
    <input type="text" placeholder="Enter name" name="name" required>
    
    <label for="email"><b>Email </b></label>
    <input type="email" placeholder="Enter email" name="email" required>
    
    <label for="email"><b>Username </b></label>
    <input type="text" placeholder="Enter Username" name="uname" required>

    <label for="psw"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" id="txtNewPassword" name="pass" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required>

    <label for="psw-repeat"><b>Repeat Password</b></label>
    <input type="password" placeholder="Repeat Password" id="txtConfirmPassword" name="psw-repeat" required>
    <hr>
  

    <button type="submit" class="registerbtn" value="register" >Register</button>
  </div>
  
  <div class="container signin">
    <p>Already have an account? <a href="login.jsp">Log in</a>.</p>
    <h1>${successMessage}</h1>
    
  </div>
</form>


</body>
</html>