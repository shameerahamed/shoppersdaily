<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Home</title>
	<script type="text/javascript" src="js/functions.js"></script>
	<link rel="stylesheet" href="css/home.css" type="text/css">
</head>
<% 

String err= null;
if(session.getAttribute("erruser")!=null) {
	err = session.getAttribute("erruser").toString();
	session.setAttribute("erruser",null);
}

if(session.getAttribute("username")!=null)
	response.sendRedirect("home.html");
%>
<body bgcolor="#F7F7F7">	
<br><br>
<table width="100%">
<tr>
	<td width="30%" rowspan="2"><br><br><br><img src="images/Family1.jpg"></td>
	<td><center><img src="images/logimg.jpg"></img></center></td>
</tr>
<tr>
<td>
	<table width="32%" cellspacing="1" cellpadding="5" class="tbl" align="center" border="0">
	<form name="frmlogin" method="POST" action="Login" onsubmit="return validate(document.frmlogin);">
	<tr bgcolor="#A9CDED">
		<td colspan="2" align="center"><b>Login</b></td>
	</tr>
	<% if(err!=null) {%>
	<tr>
		<td colspan="2" align="center" style="color:#4286F4"><b><%=err%></b></td>	
	</tr>
	<%} %>
	<tr>
		<td width="50%" class="label">Username : </td>
		<td><input type="text" id="username" name="username" style="width:120px;"></td>
	</tr>
	<tr>
		<td class="label">Password : </td>
		<td><input type="password" id="passwd" name="password" style="width:120px;"></td>
	</tr>
	<tr>
		<td align="right"><input class="btn" type="submit" name="frmsubmit" value="Submit"></td>
		<td align="left"><input class="btn" type="reset" name="frmreset" value="Reset"></td>
	</tr>
	</form>
	</table>
</td>
</tr>
	</table>
</body>
</html>