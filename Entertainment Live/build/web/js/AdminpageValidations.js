/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */



	function validate()
		{
			var	x;
			
			if(document.add_user.uname.value=="")
				{
					alert("Username can't blank...");
					return false;
				}
			if(document.add_user.name.value=="")
				{
					alert("Name can't blank...");
					return false;
				}
			if(document.add_user.password.value=="")
				{
					alert("Password can't blank...");
					return false;
				}
			if(document.add_user.password.value!=document.add_user.repass.value)
				{
					alert("Password do not match...");
					return false;
				}
			x = document.add_user.email.value;
				
				for(i=0;i<x.length;i++)
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
			}
		}


