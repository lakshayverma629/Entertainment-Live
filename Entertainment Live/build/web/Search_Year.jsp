<%-- 
    Document   : Search_Year
    Created on : 19 Nov, 2014, 6:34:20 PM
    Author     : lakshay
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%!

String receive_parameter,cur_user;
Connection con,pl_con;
PreparedStatement ps,pl_ps;
ResultSet rs,pl_rs;
String pl_name[]=new String[100];
int i;
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <script type="text/javascript" src="js/jquery-1.3.2.js"></script>
        <script type="text/javascript" src="js/header.js"></script>
        
        <!--  CSS LINKING  -->
        <link rel="stylesheet" type="text/css" href="css/header.css" />
        <link rel="stylesheet" type="text/css" href="css/sidebar.css" />
        <link rel="stylesheet" type="text/css" href="css/add_to_playlist.css" />
        <link rel="stylesheet" type="text/css" href="css/searchsubpage.css" />
        <!-- Icon-->
        <link rel="icon" href="images/icon.gif" type="image/x-icon">
        <title><%=receive_parameter%></title>
    </head>
    <body>
        <div class="wrapper_website" align="center">
<jsp:include page="htmls/header.html"></jsp:include>	
		
			<div id="bg_img">
<jsp:include page="htmls/sidebar.html"></jsp:include>	
       
  <div class="heading" align="center"><%=receive_parameter%></div>
			
			<div class="container">
		<%
		
		try
		{
			receive_parameter=request.getParameter("p");
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
			
			ps=con.prepareStatement("select * from song where year=?");
			ps.setString(1,receive_parameter);
			rs=ps.executeQuery();
		
			
%>
<table>
<tr>
<td><p>
Song Name
</p></td>
<td><p>
Album Name
</p></td>
<td><p>
Play
</p></td>
<td><p>
Download
</p></td>
<td><p>
Add to Playlist
</p></td>
<td></td>
<td></td>
<td></td>
</tr>


<%
int x=0;
while(rs.next())

{
String sid=rs.getString(1);
String sname=rs.getString(2);
%>

<tr>
<td>
<%=sname%></td>
<td><%
out.println(rs.getString(4));
%>
</td>
<td>
<a href="Player.jsp?sid=<%=sid%>" target="_blank">Play</a>
</td>
<td>
<a href="songs/check_if_logged_in.jsp?sid=<%=sid%>" target="_blank">Download</a></td>
<td>
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
</td>

                 <td width="90px" colspan=2>
                 <form action="rate_the_song.jsp" target="_blank" method="post">
                
                						<select name="rating">
                    						<option value="1">1 star</option>
                    						<option value="2">2 star</option>	
                    						<option value="3">3 star</option>	
                    						<option value="4">4 star</option>	
                    						<option value="5">5 star</option>	
                    					</select></td>
                                        <input type="hidden" value="<%=sid %>" name="sid">
                                        <input type="hidden" value="<%=sname%>" name="sname">
                   <td width="140px"><input type="submit" value="Rate the song" id="submit"></td>
                

</tr>


<%
x++;
}
}
catch(Exception e)
{
}
%>
		</table>		
		
</div>	

<jsp:include page="htmls/footer.html"></jsp:include>
</div>
		</div>
    </body>
</html>
