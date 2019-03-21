<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,com.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Registration Page</title>
		<link rel="stylesheet" href="../css/theme.css" type="text/css"></link>
		<script type="text/javascript" src="valid/validation.js"></script>
	</head>
	<body>
		<form action="register.jsp" method="POST" name="frm_register">
		<%
		if((request.getParameter("text1"))!=null)
		{
			String[] input = new String[11];
			for(int i=1;i<=10;i++)
			{ 
				input[i]=request.getParameter("text" +i);

			}
			try{					 
				DbaseConn.getConnection();			
				String query="insert into employee(Ename,Gender,Address,Phone_no,E_mail,Designation,DOJ,DOB,Username,Password)values('"+input[1]+"','"+input[2]+"','"+input[3]+"','"+input[4]+"','"+input[5]+"','"+input[6]+"','"+input[7]+"','"+input[8]+"','"+input[9]+"','"+input[10]+"')";
				int v=DbaseConn.exec(query);
				if(v!=0)
					out.println("<h3>"+"Inserted Successfully...."+"</h3>");
				}
			catch(Exception e){
				e.printStackTrace();
				}

				}
				%>

<br><br>
<center><h3><B>Employee Registration</B></h3></center>
<center>
	<table cellpadding="5" cellspacing="0" width="45%">
		<tr>
			<td align="left"><b>Name</b></td>
			<td colspan="2" align="left">
				<input type="text" name="text1" ></input>
			</td>
		</tr>
		<tr>
			<td align="left"><b>Gender</b></td>
			<td colspan="2" align="left">
				<input type="radio" name="text2" value="f">Female&nbsp;&nbsp;&nbsp;&nbsp;</input>
				<input type="radio" name="text2" value="m" >Male</input>
			</td>
		</tr>
		<tr>
			<td align="left"><b>Address</b></td>
			<td colspan="2" align="left">
				<textarea class="txtar" name="text3"></textarea>
			</td>
		</tr>
		<tr>
			<td align="left"><b>Phone No</b></td>
			<td colspan="2" align="left">
				<input type="text" name="text4"></input>
			</td>
		</tr>
		<tr>
			<td align="left"><b>E-mail</b></td>
			<td colspan="2" align="left">
				<input type="text" name="text5"></input>
			</td>
		</tr>
		<tr>
			<td align="left"><b>Designation</b></td>
			<td colspan="2" align="left">
				<input type="text" name="text6"></input>
			</td>
		</tr>
		<tr>
			<td align="left"><b>DOB</b></td>
			<td align="left">
				<input type="text" name="text7"></input>
			</td>
			<td align="left">[yyyy-mm-dd]</td>
		</tr>
		<tr>
			<td align="left"><b>DOJ</b></td>
			<td align="left">
				<input type="text" name="text8"></input>
			</td>
			<td align="left">[yyyy-mm-dd]</td>
		</tr>
		<tr>
			<td align="left"><b>Username</b></td>
			<td colspan="2" align="left"><input type="text" name="text9"></input></td>
		</tr>
		<tr>
			<td align="left"><b>Password</b></td>
			<td align="left"><input type="password" name="text10"></input></td>
			<td align="left">[atleast 8 characters] </td>
		</tr>
</table></center>
<br>	
<center><input type="submit" value="SUBMIT" name="submit" onclick="javascript:return check();"></input>
</center>
<br>
<center>
<a  href="frontpage.jsp">Back</a></center>
</form>
</body>
</html>