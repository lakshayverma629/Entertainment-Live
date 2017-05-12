<%@page import="java.sql.*" %>



<%!
	String email,curr_user;
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
		
%>

<%
	email=request.getParameter("email");
	curr_user=(String)session.getAttribute("cur_user");

	try
	{
		
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");	
		con=DriverManager.getConnection("Jdbc:Odbc:hl","headphone","lagale");
		ps=con.prepareStatement("update register set email=? where uname=?");
		
		ps.setString(1,email);
		ps.setString(2,curr_user);
		
		ps.executeUpdate();
		
		
		response.sendRedirect("updated.jsp");	
	}
	
	catch(Exception e)
	{
		
	}

%>