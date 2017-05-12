function check()
	{
		if(document.form.usern.value=="")
			{
				alert("Username can't be blank");
				
				document.forn.usern.focus();
				return false;
			}
		if(document.form.pass.value=="")
			{
				alert("Password can't be blank");
				document.form.pass.focus();
				return false;
			}
		x = document.form.pass.value;
		if(x.length<5)
			{
				alert("Password must be atleast of 5 char.");
				document.form.pass.focus();
				
				return false;	
			}
	}
