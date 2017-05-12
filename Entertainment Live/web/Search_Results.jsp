<%-- 
    Document   : Search_Results
    Created on : 19 Nov, 2014, 6:05:12 PM
    Author     : lakshay
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <link rel="stylesheet" type="text/css" href="css/searchresultscss.css" />
        
        <!-- Icon-->
        <link rel="icon" href="images/icon.gif" type="image/x-icon">
        <title>Search Your Songs</title>
    </head>
    <body>
        <div class="wrapper_website">



<!-- Codrops top bar -->
 <jsp:include page="htmls/header.html"></jsp:include>
<div id="bg_img">  

    <div class="container" style="float: right">
<div id="artist" class="panel">
  <div class="content">
  	<h2>Artist</h2>
    <%@ page import="java.sql.*" %>
  <%!
			Connection con;
		    PreparedStatement ps;
			ResultSet rs;
			
			%>
  
    <%
			
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			con=DriverManager.getConnection("Jdbc:Odbc:hl","headphone","lagale");
			ps=con.prepareStatement("select distinct artist from song order by artist asc");
			rs=ps.executeQuery();
			String art="";
			while(rs.next())

			{
			art=rs.getString(1);
			%>
			
			<p>
			
			<a href="Search_Artist.jsp?p=<%=art%>">
			<%
			out.println(art);	
			%>
			</a> </p>
			 <%		
			}
			
			%>
 </div>
</div>
<!-- /Home -->
<!-- Portfolio -->






<div id="album" class="panel">
  <div class="content">
    <h2>Album</h2>
	
	 <%!
			Connection con1;
		    PreparedStatement ps1;
			ResultSet rs1;
			
			%>
  
    <%
			
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			con1=DriverManager.getConnection("Jdbc:Odbc:hl","headphone","lagale");
			ps1=con1.prepareStatement("select distinct album from song order by album asc");
			rs1=ps1.executeQuery();
			String alb="";
			
			while(rs1.next())

			{
			
			alb=rs1.getString(1);
			%>
			
			<p>
			
			<a href="Search_Album.jsp?p=<%=alb%>">
			<%
			out.println(alb);	
			%>
			</a> </p>
			 <%		
			}
			
			%>
 
    
	
	
	  </div>
</div>
<!-- /Portfolio -->
<!-- About -->
<div id="year" class="panel">
  <div class="content">
    <h2>Year</h2>
    
	
		 <%!
			Connection con2;
		    PreparedStatement ps2;
			ResultSet rs2;
						
			%>
  
    <%
			
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			con2=DriverManager.getConnection("Jdbc:Odbc:hl","headphone","lagale");
			ps2=con2.prepareStatement("select distinct year from song order by year desc");
			rs2=ps2.executeQuery();
			String yr="";

			while(rs2.next())

			{
			yr=rs2.getString(1);
			%>
			
			<p ><a href="Search_Year.jsp?p=<%=yr%>">
			<%
			out.println(yr);	
			%>
			 </a>
			 </p>
			 <%		
			}
			
			%>
 
    

	
  </div>
</div>
<!-- /About -->
<!-- Contact -->
<div id="genre" class="panel">
  <div class="content">
    <h2>Genre</h2>
    
		 <%!
			Connection con3;
		    PreparedStatement ps3;
			ResultSet rs3;
						
			%>
  
    <%
			
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			con3=DriverManager.getConnection("Jdbc:Odbc:hl","headphone","lagale");
			ps3=con3.prepareStatement("select distinct genre from song order by genre asc");
			rs3=ps3.executeQuery();
			String gen="";

			while(rs3.next())

			{
			gen=rs3.getString(1);
			%>
			
			<p>
			<a href="Search_Genre.jsp?p=<%=gen%>">
			<%
			out.println(gen);	
			%>
			</a>
			 </p>
			 <%		
			}
			
			%>
 
    

	
	
  </div>
</div>
</div>
</div>
<!-- /Contact -->
<!-- Header with Navigation -->

	<div id="header2">
      <h1>Search By </h1>
      <ul id="navigation2">
        <li><a id="link-artist" href="#artist">Artist</a></li>
        <li><a id="link-album" href="#album">Album</a></li>
        <li><a id="link-year" href="#year">Year</a></li>
        <li><a id="link-genre" href="#genre">Genre</a></li>
 	 </ul>
 	 <!-- Demo Nav -->
 	
	</div>
    
</div>
    </body>
</html>
