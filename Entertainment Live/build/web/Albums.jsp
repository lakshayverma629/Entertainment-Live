<%-- 
    Document   : Albums
    Created on : 13 Nov, 2014, 9:11:33 PM
    Author     : lakshay
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! 
	String received_param;
	char received_char;
	Connection con,con1;
	PreparedStatement ps,ps1;
	ResultSet rs,rs1;
	int tr;
	char q,first;
	int j,i;
	String album[] = new String[100];	
	String year[] = new String[100];
	String simage[] = new String[100];
	
	String cur_user;
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
        <link rel="stylesheet" type="text/css" href="css/albumcss.css" />
        
        <!-- Icon-->
        <link rel="icon" href="images/icon.gif" type="image/x-icon">
        
        
        <title>Albums</title>
    </head>
    <body>
       <div class="wrapper_website" >
			   <jsp:include page="htmls/header.html"></jsp:include>

    <div id="bg_img">  
			  <jsp:include page="htmls/sidebar.html"></jsp:include> 
	 
                    <div class="heading" align="center">Albums..</div>
		<div class="container">
			
			<div class="grid">
				  


<%
	received_param=request.getParameter("q");
	received_char=received_param.charAt(0);
	
	System.out.println("\t\t\t"+received_char);
	try
	{	
			
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			con=DriverManager.getConnection("Jdbc:Odbc:hl","headphone","lagale");
			con1=DriverManager.getConnection("Jdbc:Odbc:hl","headphone","lagale");
			
			ps=con.prepareStatement("select count(*) from song");
			rs=ps.executeQuery();
			rs.next();
			tr=rs.getInt(1);
			
			
			ps1=con1.prepareStatement("select distinct album,year,simage from song");
			rs1=ps1.executeQuery();
			j=0;
			while(rs1.next())
			{
				%> <font color="#CCCCCC"><%
				album[j]=rs1.getString(1);
				year[j]=rs1.getString(2);
				simage[j]=rs1.getString(3);
				j++;
			}
		}
		catch(Exception e)
		{
			out.println(e);
		}
	
                
    for(i=0;i<j;i++)
	{
		if(album[i].charAt(0)==received_char)
		{
			%> 
				<figure class="effect-milo">
					<img src="images/<%=simage[i]%>">
					<figcaption>
                                            <p><span><%= album[i]%></span></p>
                                            <br><p>Year of Release : <%= year[i]%></p>
                                            <a href="Album_Details.jsp?p=<%=album[i]%>"></a>
					</figcaption>			
				</figure>
             <%
		} 	
	}
	
%>   
                
                
			</div>
		</div><!-- /container -->
                </div>
                    <jsp:include page="htmls/footer.html"></jsp:include>
        
		</div> 
        
        
    </body>
</html>
