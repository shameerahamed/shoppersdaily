function check()
{
	var str="Please Enter ";
	var msg="";
var name=document.frm_register.text1.value;
var gender=document.frm_register.text2.value;
var address=document.frm_register.text3.value;
var phone_no=document.frm_register.text4.value;
var email=document.frm_register.text5.value;
var desig=document.frm_register.text6.value;
var dob=document.frm_register.text7.value;
var doj=document.frm_register.text8.value;
var user=document.frm_register.text9.value;
var pass=document.frm_register.text10.value;
if(name=="")
{ msg+="name,";}
else
{
	if(!(name.match(/^[a-zA-Z/s]+$/)))
	{
		msg+="only letters for your name,";
	}		 
}
if(gender=="")
{
	msg+="gender,";
}
if(address=="")
{
	msg+="address,";
}
if(phone_no=="")
{
	msg+="phone_no,";
}
else
{
	if(!((phone_no.length==10)&& (phone_no.match(/^[0-9]+$/))))
	{
		msg+="only numbers for your phone number,"; 
	}			
}
if(email=="")
{
	msg+="email,";
}
else if(!email.match( /^[\w\-\.\+]+\@[a-zA-Z0-9\.\-]+\.[a-zA-z0-9]{2,4}$/))
{
	msg+="valid email Id,";
}
if(desig=="")
{
	msg+="designation,";
}
if(pass.length<8)
{
	msg+="password with more than 8 characters,";
}
if(pass=="")
{
	msg+="password,";
}
if(!dob.match(/^[0-9]{4}(\-)[0-9]{1,12}(\-)[0-9]{1,31}$/))
{
	msg+="valid date of birth,";
}
if(!doj.match(/^[0-9]{4}(\-)[0-9]{1,12}(\-)[0-9]{1,31}$/))
		{
			msg+="valid date of birth,";
		}
if(msg!="")
{
	alert(str+msg);
return false;
}
else
{
document.frm_register.submit();
return true;
}
}