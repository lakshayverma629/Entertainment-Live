<%-- 
    Document   : Song_Of_The_Day
    Created on : 16 Nov, 2014, 5:04:17 PM
    Author     : lakshay
--%>

<%@page import="java.sql.*,java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%!
	Connection con,pl_con;
	PreparedStatement ps,pl_ps;
	ResultSet rs,pl_rs;
	String song_id,date;
	String rec_param,cur_user;
	Date dm=new Date();
	String pl_name[]=new String[100];
	int i;
%>
<%
		rec_param=(String)session.getAttribute("song_id");
		System.out.println("\t"+rec_param);
	try
	{
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
		
		
%>
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
        <link rel="stylesheet" type="text/css" href="css/add_to_playlist.css" />
        <link rel="stylesheet" type="text/css" href="css/songofdaycss.css" />
        
        <!-- Icon-->
        <link rel="icon" href="images/icon.gif" type="image/x-icon">
        
        <title>Song Of The Day</title>
    </head>
    <body>
        
        <div class="wrapper_website">
    <jsp:include page="htmls/header.html"></jsp:include>
        <div id="bg_img">
        
        <jsp:include page="htmls/sidebar.html"></jsp:include>
        	<div class="heading" align="center">Song Of The Day</div>    
                
                <div class="container">
                 
                <div class="grid">
               <%
			   	con=DriverManager.getConnection("Jdbc:Odbc:hl","headphone","lagale");
				ps=con.prepareStatement("select * from song where sid=?");
				ps.setString(1,rec_param);
				rs=ps.executeQuery();
				if(rs.next())
			   {
			   String sname=rs.getString(2);
			   %>
               
                    <figure class="effect-sarah">
                        <img src="images/<%=rs.getString(7)%>" alt="img13"/>
                        <figcaption>
                            <h2>Album:<span><%=rs.getString(4)%></span></h2>
                            <p><%=sname%></p>
                            <!--<a href="#">View more</a>-->
                        </figcaption>			
                    </figure>
                
                </div>
               
               <table style="float:left; border:0; margin:10px 150px;" cellpadding="10" cellspacing="0">
               		<tr>
                    	<td><a href="Player.jsp?sid=<%=rec_param%>" target="_blank">Play</a></td>
                        <td><a href="songs/check_if_logged_in.jsp?sid=<%=rec_param%>" target="_blank">Download</a></td>
                        
                        <td>
                        
                        	<ul class="lb-album">
					<li>
						<a href="#image-1">
                            Add to playlist
							
						</a>
						<div class="lb-overlay" id="image-1">
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
            								<input type="hidden" name="sid" value="<%=rec_param%>">                          
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
                        </td>
                        
                        <td colspan=2>
                        	<form action="rate_the_song.jsp" target="_blank" method="post">
                        	<select name="rating">
                            <option value="1">1 star</option>
                            <option value="2">2 star</option>	
                            <option value="3">3 star</option>	
                            <option value="4">4 star</option>	
                            <option value="5">5 star</option>	
                          	</select>
                        </td>
                        	<input type="hidden" value="<%=rec_param %>" name="sid">
                            <input type="hidden" value="<%=sname%>" name="sname">
                        <td width="140px">
                        	<input type="submit" value="Rate the song">
                            </form>
                        </td>
                        

					</tr>                        
               </table>
                <%
			   }
	}
	catch(Exception e)
	{
	System.out.println(e);	
	}
				
				
				%>     
            </div><!-- /container -->
            <jsp:include page="htmls/footer.html"></jsp:include>
        
            </div>
    </body>
</html>
