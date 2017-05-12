<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@page import="java.sql.*" %>


<%!
String name;
String username;
String passw;
String email;
String utype;
Connection con,con1;
PreparedStatement ps,ps1;
ResultSet rs;
int flag;
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

<h2 align="center">
<font color="#FF0000">

<%
name=request.getParameter("name");
username=request.getParameter("uname");
passw=request.getParameter("password");
email=request.getParameter("email");
utype=request.getParameter("utype");
flag=0;
try
	{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	con=DriverManager.getConnection("Jdbc:Odbc:hl","headphone","lagale");
	
	ps=con.prepareStatement("select uname from register ");
	rs=ps.executeQuery();
	while(rs.next())  		
	{
		String un=rs.getString(1);
		if(username.equals(un))
			{
				flag=1;		
			}
	}
	
	if(flag==0)
		{
		con1=DriverManager.getConnection("Jdbc:Odbc:hl","headphone","lagale");
		ps1=con1.prepareStatement("insert into register values(?,?,?,?,?)");
		ps1.setString(1,username);	
		ps1.setString(2,name);	
		ps1.setString(3,passw);
		ps1.setString(4,email);
		ps1.setString(5,utype);
		ps1.executeUpdate();
		response.sendRedirect("admin_panel.jsp");
		}
		if(flag==1)
		{
			
			out.print("UserName is already taken...choose different Username...!!");			
			%>
            <a href="admin_panel.jsp">Click to go back..</a>
			<%
            
		}
	}
	catch(Exception e)
	{
	out.println(e);
	}

%>
	<script language="javascript">
        	alert("Your user has been added..");
			window.location.href = 'admin_panel.jsp';	
        </script>
	
</font>