<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Changed values...</title>
</head>

<body>
<%!

Connection con;
PreparedStatement ps;
String attrib,value,sid,cur_user;

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
attrib=request.getParameter("attribute");
value=request.getParameter("value");
sid=request.getParameter("sid");

try
	{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	con=DriverManager.getConnection("Jdbc:Odbc:hl","headphone","lagale");
			out.println("hello............"+attrib);
	
	if(attrib.equals("sname"))
		{
			out.println("hello............");
			ps=con.prepareStatement("update song set sname=? where sid=? ");
		}
	if(attrib.equals("artist"))
		{
			ps=con.prepareStatement("update song set artist=? where sid=? ");
		}
	if(attrib.equals("album"))
		{
			ps=con.prepareStatement("update song set album=? where sid=? ");
		}
	if(attrib.equals("lyrics"))
		{
			ps=con.prepareStatement("update song set lyrics=? where sid=? ");
		}
	if(attrib.equals("year"))
		{
			ps=con.prepareStatement("update song set year=? where sid=? ");
		}
	if(attrib.equals("simage"))
		{
			ps=con.prepareStatement("update song set simage=? where sid=? ");
		}
	if(attrib.equals("genre"))
		{
			ps=con.prepareStatement("update song set genre=? where sid=? ");
		}
	
	
	
	ps.setString(1,value);
	ps.setString(2,sid);		
		
	ps.executeUpdate();
	
	}
	catch(Exception e)
	{
	out.println(e);
	}
	
%>
		<script language="javascript">
        	alert("Your database has been updateed..");
			window.location.href = 'admin_panel.jsp';	
        </script>
	
</body>
</html>