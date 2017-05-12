<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.* ,java.util.Date " errorPage="" %>

<%!
String sid;
String sname;
String artist;
String album;
String lyrics;
String year;
String simage;
String genre;
String dateofadding;
Date dm;
Connection con,con1;
PreparedStatement ps,ps1;
ResultSet rs1;

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
sid=request.getParameter("sid");
sname=request.getParameter("sname");
artist=request.getParameter("artist");
album=request.getParameter("album");
lyrics=request.getParameter("lyrics");
year=request.getParameter("year");
simage=request.getParameter("simage");
genre=request.getParameter("genre");


try
	{
	dm=new Date();
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	con1=DriverManager.getConnection("Jdbc:Odbc:hl","headphone","lagale");
	ps1=con1.prepareStatement("select * from song where sid=?");
	ps1.setString(1,sid);
	rs1=ps1.executeQuery();
	
	
	if(rs1.next())
		{
				%>
				<script language="javascript">
        			alert("Sid has been already selected..\nChoose different sid..");
					window.location.href = 'admin_panel.jsp';	
        		</script>
	return;
				
				
				<%
		}
	
	
	if(dm.getMonth()<10)
	{
		if(dm.getDate()<10)
			dateofadding=Integer.toString(dm.getYear()-100)+"0"+Integer.toString(dm.getMonth())+"0"+Integer.toString(dm.getDate());
		else
			dateofadding=Integer.toString(dm.getYear()-100)+"0"+Integer.toString(dm.getMonth())+Integer.toString(dm.getDate());
	}
	else
	{
		if(dm.getDate()<10)
			dateofadding=Integer.toString(dm.getYear()-100)+Integer.toString(dm.getMonth())+"0"+Integer.toString(dm.getDate());
		dateofadding=Integer.toString(dm.getYear()-100)+Integer.toString(dm.getMonth())+Integer.toString(dm.getDate());
	}
	System.out.println(dateofadding);
	
	
	con=DriverManager.getConnection("Jdbc:Odbc:hl","headphone","lagale");
	ps=con.prepareStatement("insert into song values(?,?,?,?,?,?,?,?,?)");
	ps.setString(1,sid);	
	ps.setString(2,sname);	
	ps.setString(3,artist);
	ps.setString(4,album);
	ps.setString(5,lyrics);
	ps.setString(6,year);
	ps.setString(7,simage);
	ps.setString(8,genre);
	ps.setString(9,dateofadding);

	ps.executeUpdate();
	
	}
	catch(Exception e)
	{
	out.println(e);
	}
	
	
%>
		<script language="javascript">
        	alert("Your Song has been Added..");
			window.location.href = 'admin_panel.jsp';	
        </script>
	