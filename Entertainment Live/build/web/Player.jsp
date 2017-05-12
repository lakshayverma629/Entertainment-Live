<%-- 
    Document   : Player
    Created on : 22 Nov, 2014, 1:00:12 PM
    Author     : lakshay
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
String received_param,cur_user;
Connection con;
PreparedStatement ps;
ResultSet rs;
int i=0;
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
        <!-- Icon-->
        <link rel="icon" href="images/icon.gif" type="image/x-icon">
        
        <title>Player</title>
    </head>
    <body style="background-image:url(images/bg.jpg);background-repeat:repeat-y;">
        
        <%
        
        received_param=request.getParameter("sid");
	try
		{
			System.out.println("start");		
		
			cur_user=(String)session.getAttribute("cur_user");
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			con=DriverManager.getConnection("Jdbc:Odbc:hl","headphone","lagale");
			ps=con.prepareStatement("insert into last_play values(?,?)");	
			ps.setString(1,cur_user);
			ps.setString(2,received_param);
			ps.executeUpdate();
			System.out.println("end try");		
		
		}
		catch(Exception e)
		{
			out.println(e);
		}

        %>
    <center> <img src="images/music_visual.jpg" width="480" height="240">     
        <br><audio controls autoplay >
  
           <source src="songs/<%=received_param%>.mp3" type="audio/mpeg">
            Your browser does not support the audio element.
</audio></
    </body>
</html>
