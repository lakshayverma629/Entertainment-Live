<%-- 
    Document   : Ratings
    Created on : 16 Nov, 2014, 6:11:41 PM
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
int i;
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
        
        <title>Songs Rated by you..</title>
    </head>
    <body>
        <div class="wrapper_website">
                <jsp:include page="htmls/header.html"></jsp:include>
        
            <div id="bg_img">
		
		
                <jsp:include page="htmls/sidebar.html"></jsp:include>

		<div class="heading" align="center">Songs Rated by you..</div>
		
        <div class="container">
			
					
				<table border="1" style="float:left; margin-top:60px; margin-left:180px;">
                            	<tr style="font-size:20px; font-weight:700; letter-spacing:1px; background:#70D1D1; color:#000;" >
                            	<td width="200px" height="50px">Song Name</td>
				<td width="200px" height="50px">Ratings</td>
                            <td></td>  <td></td>  <td></td>
						</tr>
 <%
		
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
	
	
	
			con=DriverManager.getConnection("Jdbc:Odbc:hl","headphone","lagale");
			ps=con.prepareStatement("select * from rating where uname=?");
			ps.setString(1,cur_user);
			rs=ps.executeQuery();
			int x=0;
			while(rs.next())
			{
				String sid=rs.getString(1);
			%>                   
						<tr>
                        	<td  width="200px" height="50px"><%=rs.getString(4)%></td>
                        	<td width="200px" height="50px"><%=rs.getString(3)%></td>
                       		<td width="200px" height="50px"><a href="Player.jsp?sid=<%=sid%>" target="_blank">Play</a></td>
                       		<td width="200px" height="50px"><a href="songs/check_if_logged_in.jsp?sid=<%=sid%>" target="_blank">Download</a></td>
                            <td ><ul class="lb-album">
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
				</ul></td>
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
           
            
            
			
		</div><!-- /container -->
        
                <jsp:include page="htmls/footer.html"></jsp:include>
</div></div>
    </body>
</html>
