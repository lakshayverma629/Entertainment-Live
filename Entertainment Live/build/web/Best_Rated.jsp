<%-- 
    Document   : Best_Rated
    Created on : 13 Nov, 2014, 2:05:03 PM
    Author     : lakshay
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
String cur_user;
Connection con,pl_con;
PreparedStatement ps,pl_ps;
ResultSet rs,pl_rs;
String pl_name[]=new String[100];
int i;
%>
<!-- Checking login... -->
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



<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!---   Java Script Linking   --->
        <script type="text/javascript" src="js/jquery-1.3.2.js"></script>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
		<script type="text/javascript" src="js/jquery.hoverdir.js"></script>	
        <script type="text/javascript" src="js/header.js"></script>	
        
        <!--  CSS LINKING  -->
        <link rel="stylesheet" type="text/css" href="css/bestRatedcss.css" />
        <link rel="stylesheet" type="text/css" href="css/header.css" />
        <link rel="stylesheet" type="text/css" href="css/sidebar.css" />
        <link rel="stylesheet" type="text/css" href="css/add_to_playlist.css" />
        <!-- Icon-->
        <link rel="icon" href="images/icon.gif" type="image/x-icon">
         
        <title>Best Rated Songs</title>
    </head>
    <body>
       <div class="wrapper_website">
        
   	     <jsp:include page="htmls/header.html"></jsp:include>
	        
          
    
	<div id="bg_img">
            <jsp:include page="htmls/sidebar.html"></jsp:include>
       
  <div class="heading" align="center">Best Rated Songs..</div>

        <div class="container">
			<section id="section">
				<ul id="da-thumbs" class="da-thumbs">
					
 
      
<%
		
		try
		{
			cur_user=(String)session.getAttribute("cur_user");
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		
			
		pl_con=DriverManager.getConnection("Jdbc:Odbc:hl","headphone","lagale");
		pl_ps=pl_con.prepareStatement("select distinct pl_name from playlist where uname=?");
		pl_ps.setString(1,cur_user);
		pl_rs=pl_ps.executeQuery();
		
		i=0;	
		while(pl_rs.next())
		{
		
		pl_name[i]=pl_rs.getString(1);		
		i++;
		}
			con=DriverManager.getConnection("Jdbc:Odbc:hl","headphone","lagale");
		ps=con.prepareStatement("select sid, sname,simage,rating, uname from song, rating where song.sid=rating.songid order by rating desc");	//------equijoin used here...rename sid,sname in rating table to songid,songname in database....cause error was occuring in database...:)
			
			rs=ps.executeQuery();
			for(int x=0;x<5;x++)
			{
				rs.next();
				String sid=rs.getString(1);
				
%>	
					<li>
						
							<img src="thumbnails/<%=rs.getString(3)%>" />
							<div><p style=" margin:10px 5px;">Song:<%=rs.getString(2)%></p>
								<p style=" margin:10px 5px;">Rating: <%=rs.getString(4)%></p>
                                <p style="margin:10px 5px;">Rated by: <%=rs.getString(5)%></p>
                                <!--only inline styling is working on p tag -->
                                <p style="margin:20px 30px;"><a href="Player.jsp?sid=<%=sid%>" target="_blank" style="color: #122931; text-decoration-color: #122931">Play</a></p>
                            <p style="margin:20px 30px;"><a href="songs/check_if_logged_in.jsp?sid=<%=sid%>" target="_blank" style="color: #122931; text-decoration-color: #122931">Download</a></p>
                            <p style="margin:20px 30px;">
                            			
                            			<ul class="lb-album">
					<li>
						<a href="#image-<%=x%>">
                                                     Add to playlist
						</a>
						<div class="lb-overlay" id="image-<%=x%>">
							<!--<img src="images/full/1.jpg" alt="image01" />-->
                            <div style="background:#0780BF; ">
                            
                            	<table>
                                <form action="add_to_playlist.jsp" method="post">
                                    
                                    <tr>
                                    	<td> Add to existing playlist</td>
                                    	<td ><select name="pl_name">
                                        	<option selected="selected"> None </option>
											<% 
											for(int j=0;j<i;j++)
											{
												%>
                                            	<option><%= pl_name[j] %></option>
                                           		 <%
											}
											%>
											
                                            
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                    	<td colspan="2"> OR </td>
                                    </tr>
                                    
                                    <tr>
                                    	<td>Add to a new Playlist</td>
                                    	<td><input type="text" name="new_pl"></td>
            								<input type="hidden" name="sid" value="<%= sid%>">                          
                                    </tr>
                                    
                                    <tr style="background:#58a7cf;">
                                    	<td colspan="2"><input type="submit" value="ADD" name="submit" style="background:#4C9ED9; color:#5B5A84; font-size:18px; font-weight:700;"></td>
                                    </tr>
                                </form>
                              </table>
                              
                            </div>
							<a href="#page" class="lb-close">Close</a>
						</div>
					</li>
				</ul>
                            
                            
                            </p>
                            </div>

					</li>
                    <%
	  
			}
	  	}
		catch(Exception e)
			{
				System.out.println(e);	
			}

%>	                
                    
	<!--				<li>
						<a href="http://dribbble.com/shots/502523-App-Preview">
							<img src="images/8.jpg" />
							<div><span>App Preview by Ryan Deshler</span></div>
						</a>
					</li>
-->				</ul>
			</section></div></div>
    <jsp:include page="htmls/footer.html"></jsp:include>
             </div>
    </body>
</html>
