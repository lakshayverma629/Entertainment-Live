<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<%!
String user;
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
user=request.getParameter("user");

Connection con;
PreparedStatement ps;

try
	{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	con=DriverManager.getConnection("Jdbc:Odbc:hl","headphone","lagale");
	ps=con.prepareStatement("delete from register where uname  = ?");
	ps.setString(1,user);
	ps.executeUpdate();
	
	}
	catch(Exception e)
	{
	out.println(e);
	}


%>
		<script language="javascript">
        	alert("Your user has been deleted..");
			window.location.href = 'admin_panel.jsp';	
        </script>
	
