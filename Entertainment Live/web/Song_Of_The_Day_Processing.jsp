<%-- 
    Document   : Song_Of_The_Day
    Created on : 16 Nov, 2014, 4:55:46 PM
    Author     : lakshay
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.util.Date" errorPage="" %>

<%!
	Connection con,con1,con2;
	PreparedStatement ps,ps1,ps2;
	ResultSet rs,rs1,rs2;
	String song_id,date,cur_user;
	Date dm;
	


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
		
		dm=new Date();
		//-----Checking if song id is already present in database... 
		
		if(dm.getMonth()<10)
		{
			date=Integer.toString(dm.getYear()-100)+"0"+Integer.toString(dm.getMonth())+Integer.toString(dm.getDate());
		}
		else
		{
			date=Integer.toString(dm.getYear()-100)+Integer.toString(dm.getMonth())+Integer.toString(dm.getDate());
		}
		System.out.println(date);
		
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		con1=DriverManager.getConnection("Jdbc:Odbc:hl","headphone","lagale");
		ps1=con1.prepareStatement("select sid from song_of_day where date_now=?");
		ps1.setString(1,date);
		rs1=ps1.executeQuery();
		
		if(rs1.next())
			{
					System.out.println("sid fetched from db....");
					song_id=rs1.getString(1);	
					System.out.println(song_id);
					session.setAttribute("song_id",song_id);
					response.sendRedirect("Song_Of_The_Day.jsp");
					return;
			}
		System.out.println("Song not present iin db..choosing randomly...");
		//--------if song is not present-----
			//-----Getting number of songs from db----
		con=DriverManager.getConnection("Jdbc:Odbc:hl","headphone","lagale");
		ps=con.prepareStatement("select count(*) from song");
		rs=ps.executeQuery();
		int no_songs=0;
					
		if(rs.next())
				{
					no_songs=rs.getInt(1);
				}
				song_id = Integer.toString((int)Math.ceil(Math.random()*no_songs));
				
				con2=DriverManager.getConnection("Jdbc:Odbc:hl","headphone","lagale");
		
				ps2=con2.prepareStatement("insert into song_of_day values(?,?)");	
				ps2.setString(1,date);
				ps2.setString(2,song_id);				
				ps2.executeUpdate();
				session.setAttribute("song_id",song_id);
				response.sendRedirect("Song_Of_The_Day.jsp");
		
		}
	catch(Exception e)
	{
		System.out.println(e);
	}

%>

