<%-- 
    Document   : index
    Created on : 13 Nov, 2014, 1:48:15 PM
    Author     : lakshay
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <!---   Java Script Linking   --->
         <script type="text/javascript" src="js/Homejs2.js"></script>
         <script type="text/javascript" src="js/Homejs3.js"></script>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
		
        <!--  CSS LINKING  -->
        <link rel="stylesheet" type="text/css" href="css/homecss.css" />
        
        <!-- Icon-->
        <link rel="icon" href="images/icon.gif" type="image/x-icon">
        
        <title>Entertainment Live</title>
    </head>
    
  	
 <body id="page">    
    <div id="wrapper">
		<div id="ac_background" class="ac_background" >
			<img class="ac_bgimage" src="images/11.jpg" alt="Background" />
			<div class="ac_overlay">
            		
            	<img src="images/logo.png" style="height:100px; width:450px; margin:50px 50px; float:left;">
         
            	<h3 style="margin-left:530px; margin-top:40px; color:#000; float:left; font-weight:bold; font-size:20px;"><a href="Login.jsp">Login</a></h3>
                <h3 style="margin-left:50px; margin-top:40px; color:#000; float:left; font-weight:bold; font-size:20px;"><a href="Register.jsp">New User?</a></h3>
            
            </div>
			<div class="ac_loading"></div>
		</div>
        
      	<div id="ac_content" class="ac_content">
			<h1><span>SEARCH</span></h1>
			<div class="ac_menu">
				<ul>
					<li>
						<a href="images/artist.jpg">Artists</a>
						<div class="ac_subitem">
							<span class="ac_close"></span>
							<h2>Artists</h2>
	
    <%! 
			Connection con,con2,con3,con4,con5,con6;
			PreparedStatement ps,ps2,ps3,ps4,ps5,ps6;
			ResultSet rs,rs2,rs3,rs4,rs5,rs6;
			int i,j;
			String album[]=new String[20];	
		
	%>  
 						<ul>
                        		<li></li>
								
    <%                            
      	try
				{
                Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
				con=DriverManager.getConnection("Jdbc:Odbc:hl","headphone","lagale");
				ps=con.prepareStatement("select distinct artist from song");
				rs=ps.executeQuery();
				
				
					for(j=0;j<=4;j++)
					{	
						
						if(rs.next())
						{				                          
                    	String artists=rs.getString(1);
										        
    %>                  
    <li style="margin-left:20px;"><a href="Search_Artist.jsp?p=<%=artists%>"><%= artists%> </a></li>                        <br>
						
    <%					}
					}
					
				}
				
				catch(Exception e)
				{
					System.out.print("Artist: "+e);
				}
	
	%>                                     
        <li style="margin:20px 20px; color:#F03;"><a href="Search_Results.jsp">View More</a></li>
							</ul>
						</div>
					</li>
					<li>
						<a href="images/albums.jpg">Albums</a>
						<div class="ac_subitem">
							<span class="ac_close"></span>
							<h2>Albums</h2>
							<ul>
                            	<li></li>
   <%                         
		try
				{
                Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
				con2=DriverManager.getConnection("Jdbc:Odbc:hl","headphone","lagale");
				ps2=con2.prepareStatement("select distinct album from song");
				rs2=ps2.executeQuery();
				
				
					for(j=0;j<=4;j++)
					{
						if(rs2.next())
						{
										                          
                        String albums=rs2.getString(1);
						
						        
    %>                  
                                <li style="margin-left:20px;"><a href="Search_Album.jsp?p=<%=albums%>"><%= albums%> </a></li>                        <br>
  
    <%					}
					}
					
				}
				
				catch(Exception e)
				{
					System.out.print("Album:"+e);
				}
	
	%>  					
        <li style="margin:20px 20px; color:#F03;"><a href="Search_Results.jsp">View More</a></li>
    						</ul>
						</div>
					</li>
					
                    <li>
						<a href="images/genre.jpg">Genre</a>
						<div class="ac_subitem">
							<span class="ac_close"></span>
							<h2>Genre</h2>
							<ul>
								<li></li>
	<%		try
				{
                Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
				con3=DriverManager.getConnection("Jdbc:Odbc:hl","headphone","lagale");
				ps3=con3.prepareStatement("select distinct genre from song ");
				rs3=ps3.executeQuery();
				
				
					for(j=0;j<=5;j++)
					{
						if(rs3.next())
						{
										                          
                         String genre=rs3.getString(1);
						
						        
    %>                  
                                                                <li style="margin-left:20px;"><a href="Search_Genre.jsp?p=<%=genre%>"><%= genre%></a></li>													                          <br>

    <%					}
					}
					
				}
				
				catch(Exception e)
				{
					System.out.print("genre:"+e);
					
				}
	
        %>  								<li style="margin:20px 20px; color:#F03;"><a href="Search_Results.jsp">View More</a></li>
							</ul>
						</div>
					</li>
					<li>
						<a href="images/year.jpg">Year</a>
						<div class="ac_subitem">
							<span class="ac_close"></span>
							<h2>Year</h2>
							<ul>
                            	<li></li>
	<%							try
				{
                Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
				con4=DriverManager.getConnection("Jdbc:Odbc:hl","headphone","lagale");
				ps4=con4.prepareStatement("select distinct year from song order by year desc");
				rs4=ps4.executeQuery();
				
				for(j=0;j<=4;j++)
					{
						while(rs4.next())
						{
										                          
                        String year=rs4.getString(1);
						        
    %>                  
                                <li style="margin-left:20px;"><a href="Search_Year.jsp?p=<%= year%>"><%= year%></a></li>                          <br>
    <%					}
					
				}
				}
				
				catch(Exception e)
				{
						System.out.print("year:"+e);
				
				}
	
        %>  				<li style="margin:20px 20px; color:#F03;"><a href="Search_Results.jsp">View More</a></li>
							</ul>
						</div>
					</li>
				</ul>
			</div>
		</div>	<!-- ac_content------------------>
        
        <section>
        
        		<h1>New Releases</h1>
				<ul class="lb-album">
<%
				
				try
				{
				
				int x=0;	
					
                Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
				con5=DriverManager.getConnection("Jdbc:Odbc:hl","headphone","lagale");
				ps5=con5.prepareStatement("select distinct album,date_of_adding,simage from song order by date_of_adding desc");
				rs5=ps5.executeQuery();
				
				for(int i=0;i<5;i++)
				{
						rs5.next();
						String album2=rs5.getString(1);
						String simage=rs5.getString(3);
				%>
            						
                    
                    <li>
						<a href="#image-<%=i%>">
                                                    <img src="thumbnails/<%=simage%>" alt="image01">
							<span><%=album2%></span>
						</a>
						<div class="lb-overlay" id="image-<%=i%>">
							<img src="images/<%=simage%>" alt="image01" width="200" height="200" />
							<div>
                            	
								<h3>Album: <span><%=album2%></h3>
								<p></p>
								<!--<a href="#image-10" class="lb-prev">Prev</a>
								<a href="#image-2" class="lb-next">Next</a>-->
							</div>
                         
                            
                            <table border="1" style="float:left; margin-top:60px; margin-left:180px;">
                            	<tr style="font-size:20px; font-weight:700; letter-spacing:1px; background:#70D1D1; color:#000;" >
                                <td width="200px" height="50px" >Song<td>
                                <td width="200px" height="50px">Artist</td>
                                <td width="200px" height="50px">Genre</td>
								<td width="120px" height="50px"></td>
								<td width="120px" height="50px"></td>
								
								
                            	</tr>
                                
                                <tbody>
                                
                   				<%
                    con6=DriverManager.getConnection("Jdbc:Odbc:hl","headphone","lagale");
					ps6=con6.prepareStatement("select sid,sname,genre,artist from song where album=?");
					ps6.setString(1,album2);
					rs6=ps6.executeQuery();
                 	while(rs6.next())
					{
				    String sid_tab=rs6.getString(1);
					String name_tab=rs6.getString(2);
					String genre_tab=rs6.getString(3);       
					String artist_tab=rs6.getString(4);
								%>
                                <tr style="font-size:20px; font-weight:500; letter-spacing:1px; background:#AAE6DE; text-transform:capitalize;" >             	
                            	<td width="200px" height="50px" ><%=name_tab%><td>
                                <td width="200px" height="50px"><%=artist_tab%></td>
                                <td width="200px" height="50px"><%=genre_tab%></td>
                            	<td width="120px" height="50px"><a href="Player.jsp?sid=<%=sid_tab%>" target="_blank">Play</a></td>
   								<td width="120px" height="50px">
                                <a href="songs/check_if_logged_in.jsp?sid=<%=sid_tab%>" target="_blank">Download</a>
                                </td>
                            	</tr>
								<%
					}
								
								%>
                                
                                </tbody>
                            </table>
                         
							<a href="#page" class="lb-close">Close</a>
						</div>
					</li>
                       <% 
					
					}
				}
					
					catch(Exception e)
					{
						System.out.print("main"+e);
					}
						 %>
                      
                    
                    
					</ul>
			</section>
        <jsp:include page="htmls/footer.html"></jsp:include>
  </div>  <!-- wrapper-->      
 </body>	
</html>
