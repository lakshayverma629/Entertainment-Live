<%-- 
    Document   : Register
    Created on : 13 Nov, 2014, 11:19:39 PM
    Author     : lakshay
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!---   Java Script Linking   --->
         <script type="text/javascript" src="js/registervalidations.js"></script>
        
        <!--  CSS LINKING ---->
        <link rel="stylesheet" type="text/css" href="css/registercss.css" />
        
        <!-- Icon-->
        <link rel="icon" href="images/icon.gif" type="image/x-icon">
    

        <title>Registration</title>
    </head>
    <body>
       
  <div class="container">
    <section class="register">
      <h1>Register</h1>
      <form method="post" action="enter_value.jsp" onSubmit="return check()" name="register_form">
      <div class="reg_section personal_info">
      <h3>Your Personal Information</h3>
      <input type="text" name="username" value="" placeholder="Your Desired Username">
      <input type="text" name="name" value="" placeholder="Your Full Name">
      <input type="text" name="email" value="" placeholder="Your E-mail Address">
      </div>
      <div class="reg_section password">
      <h3>Your Password</h3>
      <input type="password" name="password" value="" placeholder="Your Password">
      <input type="password" name="confirm" value="" placeholder="Confirm Password">
      </div>
      <p class="submit"><input type="submit" name="commit" value="Sign Up"></p>
      </form>
    </section>
  </div>

  <section class="about">
   
  </section>


    </body>
</html>
