<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<Script language="JavaScript" type="text/javascript">
function validate()
{
//alert("called");

var frm=document.forms["loginpage"];
if(frm.username.value=="" || frm.password.value=="")
{
	//frm.getElementById('msg').innerHTML="bye";
	msg.innerHTML="<span style='color:#ff0000; font-size:15px'>UserName and Password is Mandatory</span>";
}
if(frm.username.value=="admin" && frm.password.value=="admin")
	msg.innerHTML="<span style='color:#ff0000; font-size:15px'>U are Authorized User !</span>";
}
function val1()
{
//alert("called");
	var frm=document.forms["loginpage"];
	if(frm.username.value=="")
		msg.innerHTML="<span style='color:#ff0000; font-size:15px'>UserName is Required</span>";
	if(frm.username.value!="")
		msg.innerHTML="<span style='color:#ff0000; font-size:15px'>.</span>";
			
}
function val2()
{
//alert("called");
	var frm=document.forms["loginpage"];
	if(frm.password.value=="")
		msg.innerHTML="<span style='color:#ff0000; font-size:15px'>Password Required</span>";
	if(frm.password.value!="")
		msg.innerHTML="<span style='color:#ff0000; font-size:15px'>.</span>";
	
			
}
</script>
<title>Login Page</title>

</head>
<body>


<center><h1><img src="images/billbanner.jpg"></h1></center>
<form name="loginpage" method="post" >
	<hr></hr>
		<br><br><br>
<center>
	<div id=table>
<table border="0" bgcolor="aliceblue" cellspacing="2" width="400" >
	<tr><td colspan="2" ><h1><font color="meganta">Login</font></h1></td><tr>
	<tr><td colspan="2">.</td></tr>
	<tr><td colspan="2"><marquee bgcolor="red" loop><font color="yellow">Please Enter UserName & Password to Login</font></marquee></tr>
		<tr><td colspan="2">.</td></tr>
			<tr><td colspan="2">.</td></tr>
	<tr><td><font color="meganta"><b>UserName</b></font></td><td><input type="text" name="username" onBlur="val1()"></input></td></tr>
	<tr><td><font color="meganta"><b>Password</b></font></td><td><input type="password" name="password" onBlur="val2()"></input></td></tr>
	<tr><td colspan="2">.</td></tr>
	<tr><td colspan="2">.</td></tr>
	<tr><td colspan="2"><input type="button" name="Submit" value="Login" OnClick="validate()"></input></td></tr>
	<tr><td colspan="2">.</td><tr>
	<tr><td colspan="2"><span id="msg"></span>	
 </table>

 </div>
</center>
</form>


</body>
</html>