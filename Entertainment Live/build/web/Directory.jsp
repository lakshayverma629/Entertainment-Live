<%-- 
    Document   : Directory
    Created on : 13 Nov, 2014, 8:37:28 PM
    Author     : lakshay
--%>
<%! String cur_user;
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

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <!---   Java Script Linking   --->
        <script type="text/javascript" src="js/jquery-1.3.2.js"></script>
        <script type="text/javascript" src="js/header.js"></script>
        
        <!--  CSS LINKING  -->
        <link rel="stylesheet" type="text/css" href="css/header.css" />
        <link rel="stylesheet" type="text/css" href="css/sidebar.css" />
        <link rel="stylesheet" type="text/css" href="css/directorycss.css" />
        
        <!-- Icon-->
        <link rel="icon" href="images/icon.gif" type="image/x-icon">
         
        <title>Directory</title>
    </head>
    <body>
       <div class="wrapper_website" >
	   <jsp:include page="htmls/header.html"></jsp:include>
       <div id="bg_img">  
			  <jsp:include page="htmls/sidebar.html"></jsp:include> 
     
  <div class="heading" align="center">Directory..</div>

		<div class="container" >
			<div class="component">
				<ul class="grid">
					
					<a href="Albums.jsp?q=A"><li class="ot-letter-left"><span data-letter="A">A</span></li></a>
					<a href="Albums.jsp?q=B"><li class="ot-letter-top"><span data-letter="B">B</span></li></a>
					<a href="Albums.jsp?q=c"><li class="ot-letter-right"><span data-letter="C">C</span></li></a>
					<a href="Albums.jsp?q=D"><li class="ot-letter-bottom"><span data-letter="D">D</span></li></a>
					<a href="Albums.jsp?q=E"><li class="ot-letter-left"><span data-letter="E">E</span></li></a>
					<a href="Albums.jsp?q=F"><li class="ot-letter-right"><span data-letter="F">F</span></li></a>
					<a href="Albums.jsp?q=G"><li class="ot-letter-right"><span data-letter="G">G</span></li></a>
					<a href="Albums.jsp?q=H"><li class="ot-letter-left"><span data-letter="H">H</span></li></a>
					<a href="Albums.jsp?q=I"><li class="ot-letter-top"><span data-letter="I">I</span></li></a>
					<a href="Albums.jsp?q=J"><li class="ot-letter-right"><span data-letter="J">J</span></li></a>
					<a href="Albums.jsp?q=K"><li class="ot-letter-left"><span data-letter="K">K</span></li></a>
					<a href="Albums.jsp?q=L"><li class="ot-letter-top"><span data-letter="L">L</span></li></a>
					<a href="Albums.jsp?q=M"><li class="ot-letter-left"><span data-letter="M">M</span></li></a>
					<a href="Albums.jsp?q=N"><li class="ot-letter-top"><span data-letter="N">N</span></li></a>
					<a href="Albums.jsp?q=O"><li class="ot-letter-right"><span data-letter="O">O</span></li></a>
					<a href="Albums.jsp?q=P"><li class="ot-letter-bottom"><span data-letter="P">P</span></li></a>
					<a href="Albums.jsp?q=Q"><li class="ot-letter-right"><span data-letter="Q">Q</span></li></a>
					<a href="Albums.jsp?q=R"><li class="ot-letter-bottom"><span data-letter="R">R</span></li></a>
					<a href="Albums.jsp?q=S"><li class="ot-letter-right"><span data-letter="S">S</span></li></a>
					<a href="Albums.jsp?q=T"><li class="ot-letter-left"><span data-letter="T">T</span></li></a>
					<a href="Albums.jsp?q=U"><li class="ot-letter-top"><span data-letter="U">U</span></li></a>
					<a href="Albums.jsp?q=V"><li class="ot-letter-right"><span data-letter="V">V</span></li></a>
					<a href="Albums.jsp?q=W"><li class="ot-letter-left"><span data-letter="W">W</span></li></a>
					<a href="Albums.jsp?q=X"><li class="ot-letter-top"><span data-letter="X">X</span></li></a>
					<a href="Albums.jsp?q=Y"><li class="ot-letter-left"><span data-letter="Y">Y</span></li></a>
					<a href="Albums.jsp?q=Z"><li class="ot-letter-top"><span data-letter="Z">Z</span></li></a>
					<a href="Albums.jsp?q=0"><li class="ot-letter-right"><span data-letter="0">0</span></li></a>
					<a href="Albums.jsp?q=1"><li class="ot-letter-bottom"><span data-letter="1">1</span></li></a>
					<a href="Albums.jsp?q=2"><li class="ot-letter-left"><span data-letter="2">2</span></li></a>
					<a href="Albums.jsp?q=3"><li class="ot-letter-bottom"><span data-letter="3">3</span></li></a>
					<a href="Albums.jsp?q=4"><li class="ot-letter-right"><span data-letter="4">4</span></li></a>
					<a href="Albums.jsp?q=5"><li class="ot-letter-left"><span data-letter="5">5</span></li></a>
					<a href="Albums.jsp?q=6"><li class="ot-letter-top"><span data-letter="6">6</span></li></a>
					<a href="Albums.jsp?q=7"><li class="ot-letter-right"><span data-letter="7">7</span></li></a>
					<a href="Albums.jsp?q=8"><li class="ot-letter-left"><span data-letter="8">8</span></li></a>
					<a href="Albums.jsp?q=9"><li class="ot-letter-right"><span data-letter="9">9</span></li></a>
					
                </ul>
			</div>
			
		</div><!-- /container -->
        
                 <jsp:include page="htmls/footer.html"></jsp:include>
      </div>  
	</div>
    </body>
</html>
