<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

          
<%
try{
String cur_user=(String)session.getAttribute("cur_user");
	
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

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>User DataBase</title>
<style type="text/css">
.tit {
	font-size: 50px;
	font-family: "Courier New", Courier, monospace;
	font-weight: bold;
}
.tit h2 {
	color: #309;
}
.tit table {
	font-size: 18px;
}
</style>



</head>

<%!

Connection con;
PreparedStatement ps;
ResultSet rs;

%>

<%

try
	{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	con=DriverManager.getConnection("Jdbc:Odbc:hl","headphone","lagale");
	ps=con.prepareStatement("select * from register");

	rs=ps.executeQuery();
	
	%>
	
    
<body class="tit">
<h2 align="center">User DataBase</h2>
<div align="center">
  <table width="1135" border="1">
    <tr>
      <th width="156" scope="col">UserName</th>
      <th width="285" scope="col">Name</th>
      <th width="176" scope="col">Password</th>
      <th width="190" scope="col">Email</th>
      <th width="294" scope="col">User Type</th>
    </tr>
    
 <%
 	while(rs.next())   
    	{
    %>
    
    <tr>
      <td><%=rs.getString(1)%></td>
      <td><%=rs.getString(2)%></td>
      <td><%=rs.getString(3)%></td>
      <td><%=rs.getString(4)%></td>
      <td><%=rs.getString(5)%></td>
    </tr>
<%
  		}
  
  	}
	catch(Exception e)
	{
	out.println(e);
	}
%>
  


  </table>
</div>
<p align="center">&nbsp;</p>
</body>
</html>