<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%!
String pl;
String sid;
String new_playlist;
Connection con;
PreparedStatement ps;
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

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Add to playlist</title>
</head>
<body>



<%

pl=request.getParameter("pl_name");
sid=request.getParameter("sid");
new_playlist=request.getParameter("new_pl");

try{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		con=DriverManager.getConnection("Jdbc:Odbc:hl","headphone","lagale");
		ps=con.prepareStatement("insert into playlist values(?,?,?)");
		ps.setString(1,cur_user);
	
	if(pl.equals("None")&&new_playlist.equals(""))
	{
	%>
    	<script language="javascript">
        	alert("Please enter playlist name");
			window.close();	
        </script>
    <%
	}
		
	if(new_playlist.equals(""))
	{
		ps.setString(2,pl);
		
	}
	else
	{
		ps.setString(2,new_playlist);
	}
	ps.setString(3,sid);
	ps.executeUpdate();

}
catch(Exception e)
{
	out.println(e);
}

%> 
		<script language="javascript">
        	alert("Your song has been added to your playlist..");
			window.close();	
        </script>


</body>
</html>