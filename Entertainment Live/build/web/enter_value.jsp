<%@page import="java.sql.*" %>


<%!
String name;
String username;
String passw;
String email;
%>

<%
name=request.getParameter("name");
username=request.getParameter("username");
passw=request.getParameter("password");
email=request.getParameter("email");

Connection con,con1;
PreparedStatement ps,ps1;
ResultSet rs;
try
	{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	con=DriverManager.getConnection("Jdbc:Odbc:hl","headphone","lagale");
	ps=con.prepareStatement("select * from register where uname=?");
	ps.setString(1,username);	
	rs=ps.executeQuery();
		if(rs.next())
		{%>
			<script language="javascript" type="text/javascript">
				alert("Username has been registered..please choose a different username..");
				window.location.href = 'Register.jsp';
            
            </script>
			<%
           
		}
		else
		{
			con1=DriverManager.getConnection("Jdbc:Odbc:hl","headphone","lagale");
			ps1=con1.prepareStatement("insert into register values(?,?,?,?,?)");
			ps1.setString(1,username);	
			ps1.setString(2,name);	
			ps1.setString(3,passw);
			ps1.setString(4,email);
			ps1.setString(5,"client");
			ps1.executeUpdate();
			response.sendRedirect("Login.jsp");

		}
	}
	catch(Exception e)
	{
		out.println(e);
	}
	
%>