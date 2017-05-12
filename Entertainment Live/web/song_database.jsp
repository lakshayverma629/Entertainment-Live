<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%! String cur_user;%>          
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

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Song DataBase</title>
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
	ps=con.prepareStatement("select * from song");

	rs=ps.executeQuery();

%>
	


<body class="tit">
<h2 align="center">Song DataBase
</h2>
<table width="1202" border="1">
  <tr>
    <th width="50" scope="col">Sid</th>
    <th width="157" scope="col">Song Name</th>
    <th width="191" scope="col">Artist</th>
    <th width="155" scope="col">Album</th>
    <th width="154" scope="col">Lyrics</th>
    <th width="110" scope="col">Year</th>
    <th width="104" scope="col">Simage</th>
    <th width="94" scope="col">Genre</th>
    <th width="129" scope="col">Date_of_adding</th>
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
    		<td><%=rs.getString(6)%></td>
    		<td><%=rs.getString(7)%></td>
    		<td><%=rs.getString(8)%></td>
    		<td><%=rs.getString(9)%></td>
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
<p align="center">&nbsp;</p>
</body>
</html>