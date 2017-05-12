function check()
	{
		if(document.register_form.username.value=="")
				{
					alert("Username can't blank...");
					return false;
				}
			if(document.register_form.name.value=="")
				{
					alert("Name can't blank...");
					return false;
				}
			if(document.register_form.password.email=="")
				{
					alert("Email can't blank...");
					return false;
				}
			if(document.register_form.password.value=="")
				{
					alert("Password can't blank...");
					return false;
				}
			if(document.register_form.password.value!=document.register_form.confirm.value)
				{
					alert("Password do not match...");
					return false;
				}
			x = document.register_form.email.value;
			var f=0;	
			var atpos=x.indexOf("@");
			var dotpos=x.lastIndexOf(".");
			
			if(atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length)
			{
				alert("Not a valid email address");
				return false;	
			}
			
				/*for(i=0;i<x.length;i++)
				{
					if(x.charAt(i)=='@')
						{
							f=1;
							break;
						}
				}
			if(f==0)
			{
					alert("Enter valid email...");
					return false;
			}*/
	}