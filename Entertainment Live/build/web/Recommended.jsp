<%-- 
    Document   : Recommended
    Created on : 16 Nov, 2014, 4:48:13 PM
    Author     : lakshay
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
	Connection con,con1,con2,pl_con;
	ResultSet rs,rs1,rs2,pl_rs;
	PreparedStatement ps,ps1,ps2,pl_ps;
	String cur_user,rec1,rec2;
	String pl_name[]=new String[100];
	int i,p;
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
		System.out.println("Playlists:"+pl_name[i]);	
		i++;
		}
		
		
		con=DriverManager.getConnection("Jdbc:Odbc:hl","headphone","lagale");
		ps=con.prepareStatement("select genre, count(genre) from song where sid in(select sid from last_play where uname=?) group by genre having count(genre)>1 "); // change =1 to >1 id more data is added to data base
		ps.setString(1,cur_user);
		rs=ps.executeQuery();
		if(rs.next())
		{	
			rec1=rs.getString(1);
			System.out.println("rec1 :"+rec1);
		}
		
		con1=DriverManager.getConnection("Jdbc:Odbc:hl","headphone","lagale");
		ps1=con1.prepareStatement("select sid from song where genre=? minus select sid from last_play");
		ps1.setString(1,rec1);
//		ps1.setString(2,rec2);
		rs1=ps1.executeQuery();
		
		String song_id_rec[]=new String[100];
		p=0; // cant be local
					System.out.println("Before rs1.... ");
			
				while(rs1.next())
				{
					System.out.println("--------In rs1------ ");
					if(p<3)
						{
							System.out.println("-------In if statement------");
							
							song_id_rec[p]=rs1.getString(1);	
							System.out.println("value of song id in rs1 ------"+song_id_rec[p]);
							p++;
						}
				}
									System.out.println("=======after rs1 ");

		System.out.println("Value of p is   :"+p);
		System.out.println("value of song id ========="+song_id_rec[0]);

		con2=DriverManager.getConnection("Jdbc:Odbc:hl","headphone","lagale");
		ps2=con2.prepareStatement("select * from song where sid=? UNION select * from song where sid=? UNION select * from song where sid=?");
	/*-------------------remove these comments when added data to database------------*/
		//ps2=con2.prepareStatement("select * from song where sid=?");
		ps2.setString(1,song_id_rec[0]);
		ps2.setString(2,song_id_rec[1]);
		ps2.setString(3,song_id_rec[2]);
		
		
		rs2=ps2.executeQuery();
		
	System.out.println("after rs2");
	System.out.println("value of song id{p} -------------"+song_id_rec[p]); // will show null bcz p=3,song_id_rec[3] contains no value
		

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
        <link rel="stylesheet" type="text/css" href="css/recomendedcss.css" />
        <link rel="stylesheet" type="text/css" href="css/add_to_playlist.css" />
        
        <!-- Icon-->
        <link rel="icon" href="images/icon.gif" type="image/x-icon">
        
        <title>Recommended Songs</title>
    </head>
    <body>
        <div class="wrapper_website" >
		 <jsp:include page="htmls/header.html"></jsp:include>
         <!--------------header-------------------->
        <div id="bg_img">
       <jsp:include page="htmls/sidebar.html"></jsp:include>
        
<div class="heading"> 
  <div class="heading" align="center">Recommended Songs</div>
</div>
        <div class="container"> 
			
			<section class="main">
			
				<ul class="ch-grid">
	
<%				
              	for( int l=0;l<=3;l++)        
                        {	
							rs2.next();
							String sid=rs2.getString(1);
							
							System.out.println("Value of p is   :"+p);
		
%>  
    
    
    				<li>
						<div class="ch-item">				
							<div class="ch-info">
								<div class="ch-info-front " style="background-image:url(images/<%=rs2.getString(7)%>)"></div>
								<div class="ch-info-back">
									<br><h2 style=" color: #FFFF00"><%=rs2.getString(2)%><br>by <%=rs2.getString(3)%></h2>
									<br>
                                   
                                    <p>
                                    
                                    <ul class="lb-album">
					<li>
						<!--<a href="#image-">
                            Add to playlist
							
						</a>-->
                                                <a href="Player.jsp?sid=<%=sid%>" target="_blank" style="color: #FFFF00; text-decoration-color: #FFFF00">Play</a><br>

                        <a href="songs/check_if_logged_in.jsp?sid=<%=sid%>" target="_blank" style="color: #FFFF00; text-decoration-color: #FFFF00">Download</a> 
                        
						<div class="lb-overlay" id="image-<%=l%>">
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
                                    <!--<a href="../player/play.jsp?sid=" target="_blank">Play</a>
                                    <a href="../player/songs/check_if_logged_in.jsp?sid=" target="_blank">Download</a> </p>-->
								</div>	
							</div>
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
    


				</ul>
				
			</section>
        </div> <!----------container------------->
        </div>
        <jsp:include page="htmls/footer.html"></jsp:include>
    </div>
    </body>
</html>
