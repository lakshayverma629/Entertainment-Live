<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<%!
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	String sname,sid,rating,cur_user;


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
<title>Rating the songs</title>
<style type="text/css">
.font {
	font-family: MS Serif, New York, serif;
}
.ff {
	font-family: MS Serif, New York, serif;
}
</style>
</head>

<body>




<%
	sname=request.getParameter("sname");
	sid=request.getParameter("sid");
	rating=request.getParameter("rating");	
	cur_user=(String)session.getAttribute("cur_user");
	try
	{
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		con=DriverManager.getConnection("Jdbc:Odbc:hl","headphone","lagale");
		ps=con.prepareStatement("insert into rating values(?,?,?,?)");
		ps.setString(1,cur_user);
		ps.setString(2,sid);
		ps.setString(3,rating);
		ps.setString(4,sname);
		ps.executeUpdate();
		
	}
	catch(Exception e)
	{
		out.println(e);
	}
	
	
%>
<script language="javascript">
        	alert("Your song has been rated..");
                window.close();
  
</script>	
</body>
</html>