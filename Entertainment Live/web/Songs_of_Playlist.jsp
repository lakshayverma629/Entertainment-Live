<%-- 
    Document   : Songs_of_Playlist
    Created on : 16 Nov, 2014, 5:46:11 PM
    Author     : lakshay
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
String cur_user;
Connection con,pl_con;
PreparedStatement ps,pl_ps;
ResultSet rs,pl_rs;
String pl_name[]=new String[100];
String pl;
%>
<%
	 pl=request.getParameter("playlist");
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
         <link rel="stylesheet" type="text/css" href="css/add_to_playlist.css" />
              
        <!-- Icon-->
        <link rel="icon" href="images/icon.gif" type="image/x-icon">
        
        
        
<style>
	body{
	margin:0 auto;
	}
	
	
	
	button{
	width:auto;
	height:auto;
	background:#093;
	font-weight:600;	
	}
</style>
        <title>Songs of <%=pl%></title>
    </head>
    <body>
        <div class="wrapper_website" align="center">
	
     <jsp:include page="htmls/header.html"></jsp:include>
 <div id="bg_img">
     <jsp:include page="htmls/sidebar.html"></jsp:include>
		<!--------------sidebar----------------->
 


<div class="heading" align="center"> Your Playlist : <font color="#F00"><%= pl %></font></div>
	<div class="container">
	
  
    

	<table cellpadding="0px" cellspacing="0px" border="0px" bgcolor="#66FF99" style="margin:0px 0px; float:left;">
    <tr height="70px" style="font-family:'Times New Roman', Times, serif; font-size:20px; color:#000;font-weight:700;">
    	<td width="140px" align="center">Song</td>
		<td width="140px" align="center">Artist</td>
		<td width="140px" align="center">Album</td>
		<td width="140px" align="center">Genre</td>
        <td width="140px" align="center">Year</td>
        <td width="120px" align="center"></td>
        <td width="120px" align="center"></td>
            
    </tr>
<%
	try
	{
		
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	
		
		pl_con=DriverManager.getConnection("Jdbc:Odbc:hl","headphone","lagale");
		pl_ps=pl_con.prepareStatement("select distinct pl_name from playlist where uname=?");
		pl_ps.setString(1,cur_user);
		pl_rs=pl_ps.executeQuery();
		
		int i=0;	
		while(pl_rs.next())
		{
		
		pl_name[i]=pl_rs.getString(1);		
		i++;
		}
		
	
	
	
	con=DriverManager.getConnection("Jdbc:Odbc:hl","headphone","lagale");
	ps=con.prepareStatement("select sid,sname,artist,album,genre,year from song where sid in(select sid from playlist where uname=? and pl_name=?)");
	
	ps.setString(1,cur_user);
	ps.setString(2,pl);
	
	rs=ps.executeQuery();
	int x=0;
	while(rs.next())
	{
		String sid=rs.getString(1);
		String sname=rs.getString(2);
	%>	<tr height="40px" align="center" bgcolor="#6CB5D5">
		<td> <%=sname %> </td> 
		<td> <% out.print(rs.getString(3)); %> </td> 
		<td> <% out.print(rs.getString(4)); %> </td> 
		<td> <% out.print(rs.getString(5)); %> </td> 
        <td> <% out.print(rs.getString(6)); %> </td> 
        <td><a href="Player.jsp?sid=<%=sid%>" target="_blank">Play</a></td>
        <td><a href="songs/check_if_logged_in.jsp?sid=<%=sid%>" target="_blank">Download</a></td> 
        <td >
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
                   <td width="140px"><input type="submit" value="Rate the song"></td>
                
        
        
        </tr> 
	<%		
   	
	
	x++;
	}
	
	}
	
	catch(Exception e)
	{
		out.print(e);	
	}

%>

	</table>
    
	</div> <!---------container----------->
    
        <jsp:include page="htmls/footer.html"></jsp:include>   
 </div>
</div>
    </body>
</html>
