<%-- 
    Document   : Album_Details
    Created on : 13 Nov, 2014, 10:10:16 PM
    Author     : lakshay
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%!

	String received_param,cur_user;
	Connection con,con2,con3;
	PreparedStatement ps,ps2,ps3;
	ResultSet rs,rs2,rs3;
	String pl_name[]=new String[100];
		int i;
%>
<%
received_param=request.getParameter("p");
	
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
        
        <!--  CSS LINKING  -->
        <link rel="stylesheet" type="text/css" href="css/header.css" />
        <link rel="stylesheet" type="text/css" href="css/sidebar.css" />
        <link rel="stylesheet" type="text/css" href="css/add_to_playlist.css" />
        
        <!-- Icon-->
        <link rel="icon" href="images/icon.gif" type="image/x-icon">
        
        <title><%=received_param %></title>
    </head>
    <body>
        <div class="wrapper_website" >
		<jsp:include page="htmls/header.html"></jsp:include>
     <div id="bg_img">
         <jsp:include page="htmls/sidebar.html"></jsp:include> 
        <div class="heading" align="center"><%=received_param %></div>
        
		<div class="container">
<table cellpadding="0px" cellspacing="0px" >
	 <tr height="70px" style="font-family:'Arial Black', Gadget, sans-serif;  background-color:#73C4E4; opacity:0.9; font-size:20px; color:#000;font-weight:700;">
    	<td>Song</td>
        <td>Artist</td>
        <td>Genre</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
<%
	
	try
	{
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		con=DriverManager.getConnection("Jdbc:Odbc:hl","headphone","lagale");
		ps=con.prepareStatement("select sname,artist,genre,sid from song where album=?");
		ps.setString(1,received_param);
		rs=ps.executeQuery();
	
		con2=DriverManager.getConnection("Jdbc:Odbc:hl","headphone","lagale");
		ps2=con.prepareStatement("select distinct pl_name from playlist where uname=?");
		ps2.setString(1,cur_user);
		rs2=ps2.executeQuery();
		
		i=0;	
		while(rs2.next())
		{
		
		pl_name[i]=rs2.getString(1);		
		i++;
		}
			
			
			
			while(rs.next())
			{
					System.out.println("2");	
					String sname=rs.getString(1);
					String artist=rs.getString(2);
					String genre=rs.getString(3);
					String sid=rs.getString(4);
					
					
				%>
                <tbody>
				<tr height="40px" style="text-align:center; background-color:rgb(45,170,220); font-weight:500;">
					<td width="140px"><%= sname %></td> 
                    <td width="140px"><%= artist  %></td> 
                    <td width="140px"><%= genre %></td> 
                    <td width="100px"><a href="Player.jsp?sid=<%=sid%>" target="_blank">Play</a></td> 
                    <td width="100px"><a href="songs/check_if_logged_in.jsp?sid=<%=sid%>" target="_blank">Download</a></td>
                    <td width="100px">
                    
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
                   <td width="140px"><input type="submit" value="Rate the song"> </form></td>
                
                </tr>
                </tbody>
				<%
			
			}
	
	}
	catch(Exception e)
	{
		out.println(e);
	}
	
%>

</table>

</div> <!-- ----- container----------->
	</div> <!-------------bg_img------------>
    
  <jsp:include page="htmls/footer.html"></jsp:include>		


</div>
    </body>
</html>
