<%@page import="java.sql.*" %>

<%!
String name;
String usrname;
String passw;

%>

<%
usrname=request.getParameter("usern");
passw=request.getParameter("pass");


Connection con;
PreparedStatement ps;
ResultSet rs;

try
	{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	con=DriverManager.getConnection("Jdbc:Odbc:hl","headphone","lagale");
	ps=con.prepareStatement("select * from register where uname=? and password=? ");
	ps.setString(1,usrname);	
	ps.setString(2,passw);


	rs=ps.executeQuery();
	
		if(rs.next())
		{
			String u=rs.getString(5);
			System.out.println("user Type..."+u);
			session.setAttribute("cur_user",usrname);
			if(u.equals("Admin"))
				{
					response.sendRedirect("AdminPanel.jsp");
				}
				else
				{
					response.sendRedirect("Welcome.jsp");
				}
		}
		else
		{
		%>	
			<script language="javascript">
				alert("Invalid user..Login again..");
				window.location.href = 'Login.jsp';
			</script>
		<%
        	
		
		}

	}
		
	catch(Exception e)
	{
		out.println(e);
	}
%>
</div>

