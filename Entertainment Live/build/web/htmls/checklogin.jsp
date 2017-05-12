          
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
