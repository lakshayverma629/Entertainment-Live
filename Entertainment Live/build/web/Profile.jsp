<%-- 
    Document   : Profile
    Created on : 16 Nov, 2014, 5:54:49 PM
    Author     : lakshay
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
String cur_user;
%>
          
<%
try{
 cur_user=(String)session.getAttribute("cur_user");
	
		if(cur_user.equals(null))
		{
	
		}
	}
	
	catch(Exception e)
	{
		%>
        
        <script language="javascript">
        	alert("You are Not Logged in..Log in to continue");
			window.location.href = 'Login.jsp';	
        </script>
		<%
		
	}
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <!---   Java Script Linking   --->
        <script type="text/javascript" src="js/jquery-1.3.2.js"></script>
        <script type="text/javascript" src="js/header.js"></script>
        <script type="text/javascript" src="js/profilejs.js"></script>
        <script type="text/javascript" src="js/profilejs2.js"></script>    
        <!--  CSS LINKING  -->
        <link rel="stylesheet" type="text/css" href="css/header.css" />
        <link rel="stylesheet" type="text/css" href="css/sidebar.css" />
        <link rel="stylesheet" type="text/css" href="css/sidemenu.css" />
        <link rel="stylesheet" type="text/css" href="css/profilecss.css" />
        
        <!-- Icon-->
        <link rel="icon" href="images/icon.gif" type="image/x-icon">
         

        <title>Profile</title>
    </head>
    <body>
        <div class="wrapper_website">
            
     		<!--------------------------------------use same bgcolor in body as that in container---------------------->
                    <jsp:include page="htmls/header.html"></jsp:include>
    
                    <div id="bg_img">
                        <jsp:include page="htmls/sidebar.html"></jsp:include>
                        <div class="heading" align="center"><%=cur_user%></div>
		
        <div class="container">
        	                

        
			
       <!-------------------------profile forms starting-------------------------->     
                        
				
				  
					
									<h2>Email</h2>
									<form action="change_email.jsp" target="_blank" method="post" name="frm_email" onsubmit="return validate_email()">
										<p><label>Email Id</label><input type="text" name="email" /></p>
										<p><input type="submit" id= "submit" value="submit" name="Submit"></p>
									</form>
				
                                                                        <br><br>
									<h2>Password</h2>
                                                                        <form action="change_pwd.jsp" method="post" target="_blank" onsubmit="return validate_pwd()" name="frm_pass">
										
										<p><label>New Password</label><input type="password" name="pass"/></p>
										<p><label>Repeat Password</label><input type="password" name="repass"/></p>
										<p><input type="submit" id= "submit" value="Change"></p>
									</form>
				
		<!-------------------profile forms ending------------------------------------>
            
                
            
		</div><!-- /container -->
                                </div>                <jsp:include page="htmls/footer.html"></jsp:include>
         
        
	
            
            
            
        </div>
    </body>
</html>
