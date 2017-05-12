<%-- 
    Document   : Playlist
    Created on : 16 Nov, 2014, 3:18:52 PM
    Author     : lakshay
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	String playlist,cur_user;
	int j,x,y,z;
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
        <script type="text/javascript" src="js/sidemenu.js"></script>
        <script type="text/javascript" src="js/sidemenu2.js"></script>
        
        <!--  CSS LINKING  -->
        <link rel="stylesheet" type="text/css" href="css/header.css" />
        <link rel="stylesheet" type="text/css" href="css/sidebar.css" />
        <link rel="stylesheet" type="text/css" href="css/sidemenu.css" />
        
        <!-- Icon-->
        <link rel="icon" href="images/icon.gif" type="image/x-icon">
        
        <title>Playlists</title>
    </head>
    <body>
        <div class="wrapper_website" >
		<jsp:include page="htmls/header.html"></jsp:include>
    
        <div id="bg_img">
            <jsp:include page="htmls/sidebar.html"></jsp:include>
        <div class="heading" align="center">Playlist</div>
        <div class="container">
		
			
			


            
<%
	try
	{
		
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	con=DriverManager.getConnection("Jdbc:Odbc:hl","headphone","lagale");
	ps=con.prepareStatement("select distinct pl_name from playlist where uname=? ");
	
	ps.setString(1,cur_user);
	
	rs=ps.executeQuery();
            
	x=0;
	y=160;
	z=160;
%>	
	<div style="width:1000px; height:auto; float:left; margin:30px 0px;">
<%		
	while(rs.next())
	{
		playlist=rs.getString(1);	
%>	
		
            <div style="background-color:rgb(<%= x%>,<%= y%>,<%= z%>); width:150px; height:150px; float:left; margin:10px 20px; border-radius:20px">
         			<div ><center>
                    		<h2><%= playlist%></h2>
                                <h3><a href="Songs_of_Playlist.jsp?playlist=<%=playlist%>">View Songs</a></h3>
                   </center> </div>       
            </div>
	
<%
		x+=15;
		y+=5;
		z+=20;
	}
	}
	catch(Exception e)
	{
		
	}


%>
		</div>	
        
        				
        </div> <!-----container-------------->
    

<jsp:include page="htmls/footer.html"></jsp:include>      
	
    </div>
    </div>
    </body>
</html>
