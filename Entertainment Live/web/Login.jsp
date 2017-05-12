<%-- 
    Document   : Login
    Created on : 13 Nov, 2014, 11:11:23 PM
    Author     : lakshay
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <!---   Java Script Linking   --->
        
         <script type="text/javascript" src="js/loginValidations.js"></script>
        
        <!--  CSS LINKING ---->
        <link rel="stylesheet" type="text/css" href="css/logincss.css" />
        
        <!-- Icon-->
        <link rel="icon" href="images/icon.gif" type="image/x-icon">
    
        <title>Login</title>
    </head>
    <body>
        
<h1 align="center"  class="userreg"> 
Login</h1>



<form method="post" action="check_login.jsp" class="login" name="form" onSubmit="return check()">
    <p>
      <label for="login">Username:</label>
      <input type="text" name="usern" id="login" placeholder="UserName">
  </p>

    <p>
      <label for="password">Password:</label>
      <input type="password" name="pass" id="password" placeholder="********">
    </p>

    <p class="login-submit">
      <button type="submit" class="login-button">Login</button>
    </p>
	
    <p class="forgot-password"><a href="Register.jsp">Register</a></p>
</form>



    </body>
</html>
