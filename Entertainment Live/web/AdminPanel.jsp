<%-- 
    Document   : AdminPanel
    Created on : 13 Nov, 2014, 1:49:33 PM
    Author     : lakshay
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!

Connection con,con1,con2,con3;
ResultSet rs,rs1,rs2,rs3;
PreparedStatement ps,ps1,ps2,ps3;
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


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/AdminpageCss.css" type="text/css" rel="stylesheet">
        <script src="js/AdminpageValidations.js"></script>
        <title>Administration Panel</title>
    </head>
    <body>
     <body background="bg.jpg">
<div align="center">
  <table width="1409" height="115" border="2" bgcolor="#CC99FF">
    <tr>
      <th colspan="11" scope="col"><div align="center" class="admin"><strong>Admin Panel</strong></div></th>
    </tr>
    <tr>
      <th width="98" class="user" scope="col"><span class="pa"><span class="heading">User:</span></span></th>
      <th width="174" scope="col">&nbsp;</th>
      <th width="150" scope="col">&nbsp;</th>
      <th width="150" scope="col">&nbsp;</th>
      <th width="144" scope="col">&nbsp;</th>
      <th width="191" scope="col">&nbsp;</th>
      <th width="150" scope="col">&nbsp;</th>
      <th width="150" scope="col">&nbsp;</th>
      <th width="142" scope="col">&nbsp;</th>
      <th width="142" scope="col">&nbsp;</th>
    </tr>
    <tr>
      <th scope="col">&nbsp;</th>
      <th class="adduser" scope="col">Add User</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
    </tr>
    <tr>
      <th scope="col">&nbsp;</th>
      <th scope="col">Uname</th>
      <th scope="col">Name</th>
      <th scope="col">Password</th>
      <th scope="col">Retype password</th>
      <th scope="col">Email</th>
      <th scope="col">User_Type</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
    </tr>
    <tr><form action="add_user.jsp" method="post" name="add_user" onsubmit="return validate()" >
      <th scope="col">&nbsp;</th>
      <th scope="col"><input type="text" name="uname"></th>
      <th scope="col"><input type="text" name="name"></th>
      <th scope="col"><input type="text" name="password" /></th>
      <th scope="col"><input type="text" name="repass"></th>
      <th scope="col"><input type="text" name="email"></th>
      <th scope="col"><select name="utype">
      				<option>Client</option>
      				<option>Admin</option>
      				</select></th>
      <th scope="col"><input type="submit" name="Add User"/></th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      </form>
    </tr>
    <tr>
      <th scope="col">&nbsp;</th>
      <th class="user" scope="col"><span class="adduser">Delete User:</span></th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
    </tr>
    <tr><form action="delete_user.jsp" method="post" name="del_user" >
      <th scope="col">&nbsp;</th>
      <th class="user" scope="col">Enter Username:</th>
      <th scope="col"><select name="user">
      <%
	  
	  	try{
	  		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			con=DriverManager.getConnection("Jdbc:Odbc:hl","headphone","lagale");
			ps=con.prepareStatement("select * from register ");
			rs=ps.executeQuery();
	  		
			while(rs.next())
	  		{
		%>
        		<option ><%=rs.getString(1)%></option>
        		
		<%		
			}
		}
		catch(Exception e)
		{
			out.print(e);
			}
	  %>
      
      
      				</select>
		</th>
      <th scope="col"><input value="Delete User" type="submit" /></th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
    </form></tr>
    <tr>
      <th class="user" scope="col">&nbsp;</th>
      <th class="user" scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
    </tr>
    <tr >
      <th class="user" scope="col"><span class="heading">Song:</span></th>
      <th class="user" scope="col"><span class="heading"></span></th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
    </tr>
    <tr>
      <th class="user" scope="col">&nbsp;</th>
      <th class="user" scope="col"><span class="adduser">Add Song</span></th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
    </tr>
    <tr>
      <th class="user" scope="col">&nbsp;</th>
      <th class="user" scope="col">Sid</th>
      <th class="user" scope="col">Sname</th>
      <th scope="col">Artist</th>
      <th scope="col">Album</th>
      <th scope="col">Lyrics</th>
      <th scope="col">Year</th>
      <th scope="col">Simage</th>
      <th scope="col">Genre</th>
      <th scope="col">&nbsp;</th>
    </tr>
    <tr><form action="add_song.jsp" method="post" name="add_song" >
      <th class="user" scope="col">&nbsp;</th>
      <th scope="col"><input type="text" name="sid" /></th>
      <th scope="col"><input type="text" name="sname" /></th>
      <th scope="col"><input type="text" name="artist" /></th>
      <th scope="col"><input type="text" name="album" /></th>
      <th scope="col"><input type="text" name="lyrics" /></th>
      <th scope="col"><input type="text" name="year" /></th>
      <th scope="col"><input type="text" name="simage" /></th>
      <th scope="col"><input type="text" name="genre" /></th>
      <th scope="col"><input type="submit" value="Add Song"/></th>
      </form>
    </tr>
    <tr>
      <th class="user" scope="col">&nbsp;</th>
      <th class="adduser" scope="col">Delete Song</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
    </tr>
    <tr><form action="delete_song.jsp" method="post" name="delete_song">
      <th class="user" scope="col">&nbsp;</th>
      <th class="adduser" scope="col"><span class="user">Sid:</span></th>
      <th scope="col"><select name="sid">
      <%
	  
	  	try{
	  		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			con1=DriverManager.getConnection("Jdbc:Odbc:hl","headphone","lagale");
			ps1=con1.prepareStatement("select sid from song ");
			rs1=ps1.executeQuery();
	  		
			while(rs1.next())
	  		{
		%>
        		<option ><%=rs1.getString(1)%></option>
        		
		<%		
			}
		}
		catch(Exception e)
		{
			out.print(e);
			}
	  %>
      				</select></th>
      
      <th scope="col"><input type="submit" value="Delete Song"/></th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>      
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
    </form></tr>
    <tr>
      <th class="user" scope="col">&nbsp;</th>
      <th class="adduser" scope="col">Delete album</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
    </tr>
    <tr><form action="delete_album.jsp" method="post" name="delete_album" >
      <th class="user" scope="col">&nbsp;</th>
      <th class="user" scope="col">Album Name</th>
      <th scope="col"><select name="album" >
      
      <%
	  
	  	try{
	  		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			con2=DriverManager.getConnection("Jdbc:Odbc:hl","headphone","lagale");
			ps2=con2.prepareStatement("select distinct album from song ");
			rs2=ps2.executeQuery();
	  		
			while(rs2.next())
	  		{
		%>
        		<option ><%=rs2.getString(1)%></option>
        		
		<%		
			}
		}
		catch(Exception e)
		{
			out.print(e);
			}
	  %>
      
      
      
      
      				</select></th>
      <th scope="col"><input type="submit" value="Delete album"/></th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
    </form></tr>
    <tr>
      <th class="user" scope="col">&nbsp;</th>
      <th class="adduser" scope="col">Change:</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
    </tr>
    <tr>
      <th class="user" scope="col">&nbsp;</th><form action="change.jsp" method="post">
      <th class="sid" scope="col"><span class="user">
        <select name="attribute">
          <option value="sname">Song Name</option>
          <option value="artist">Artist</option>
          <option value="album">Album</option>
          <option value="lyrics">Lyrics</option>
          <option value="year">Year</option>
          <option value="simage">Simage</option>
          <option value="genre">Genre</option>
        </select>
      </span></th>
      <th scope="col"><input type="text" name="value" /></th>
      <th scope="col">WHERE</th>
      <th scope="col"><span class="sid">Sid</span></th>
      <th scope="col"><select name="sid" >
      
      <%
	  
	  	try{
	  		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			con3=DriverManager.getConnection("Jdbc:Odbc:hl","headphone","lagale");
			ps3=con3.prepareStatement("select sid from song ");
			rs3=ps3.executeQuery();
	  		
			while(rs3.next())
	  		{
		%>
        		<option ><%=rs3.getString(1)%></option>
        		
		<%		
			}
		}
		catch(Exception e)
		{
			out.print(e);
			}
	  %>
      
      
      
      
      
      				</select></th>
      <th scope="col"><input type="submit" value="Change value"/></th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      </form>
    </tr>
    <tr>
      <th class="user" scope="col">&nbsp;</th>
      <th colspan="6" scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
    </tr>
    <tr>
      <th class="user" scope="col">&nbsp;</th>
      <th colspan="6" scope="col"><a href="song_database.jsp">Click to see all songs with details</a></th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
    </tr>
    <tr>
      <th class="user" scope="col">&nbsp;</th>
      <th colspan="6" scope="col"><a href="user_database.jsp" >Click to see all users</a></th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
    </tr>
    <tr>
      <th class="user" scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
    </tr>
    <tr>
      <th class="user" scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
    </tr>
    <tr>
      <th class="user" scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
    </tr>
  </table>
</div>   
    </body>
</html>
