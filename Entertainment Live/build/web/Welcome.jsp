<%-- 
    Document   : Welcome
    Created on : 16 Nov, 2014, 5:27:40 PM
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
        <script type="text/javascript" src="js/welcomejs.js"></script>

        <!--  CSS LINKING  -->
        <link rel="stylesheet" type="text/css" href="css/header.css" />
        <link rel="stylesheet" type="text/css" href="css/welcomecss.css" />
        <link rel="stylesheet" type="text/css" href="css/sidebar.css" />
        
        <!-- Icon-->
        <link rel="icon" href="images/icon.gif" type="image/x-icon">
         
        <title>Welcome To Entertainment Live</title>
    </head>
    <body>
       <div class="wrapper_website">
        
           <jsp:include page="htmls/header.html"></jsp:include>	
        <div id="bg_img">
             <jsp:include page="htmls/sidebar.html"></jsp:include>
           
        <center><div class="heading">Welcome:<%=cur_user%></div></center>
             <div class="container" >
                 <img src="images/home.jpg" width="1000px" height="400px">
            
            
        </div>
       </div>
           <jsp:include page="htmls/footer.html"></jsp:include>
             
        </div>
    </body>
</html>
