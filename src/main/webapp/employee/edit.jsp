<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,com.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Page</title>
<link rel="stylesheet" href="../css/theme.css" type="text/css"></link>
<script type="text/javascript" src="valid/validation.js"></script>
<script>
		function Close() {			
			window.close();
		}
		</script>
</head>
<body>
<form action=transfer.jsp?eid=<%=request.getParameter("eid")%> method=post name="frm_register">
<%
try{		
	
	DbaseConn.getConnection();
	String query="select * from employee where Emp_id="+request.getParameter("eid");
	ResultSet rs=DbaseConn.exeQuery(query);
	while(rs.next())
	{
		
%>
<br><center><h3><b>EDIT HERE</b></h3></center><br>
<center>
	<table  cellpadding="1" width="40%" >
		<tr>
			<td align="left"><b>Name:</b></td>
			<td><input type="text" name="text1" value=<%=rs.getString("Ename")%>></input></td>
		</tr>
		<tr>
			<td align="left"><b>Gender:</b></td>
			<td><input type="text" name="text2" value=<%=rs.getString("Gender")%>></input></td>
		</tr>
		<tr>
			<td align="left"><b>Address:</b></td>
			<td><textarea class="txtar" name="text3"><%=rs.getString("Address")%></textarea></td>
		</tr>
		<tr>
			<td align="left"><b>Phone No:</b></td>
			<td><input type="text" name="text4" value=<%=rs.getString("Phone_no")%>></input></td>
		</tr>
		<tr>
			<td align="left"><b>E-mail:</b></td>
			<td><input type="text"  name="text5" value=<%=rs.getString("E_mail")%>></input></td>
		</tr>
		<tr>
			<td align="left"><b>Designation:</b></td>
			<td><input type="text" name="text6" value=<%=rs.getString("Designation")%>></input></td>
		</tr>
		<tr>
			<td align="left"><b>DOB:</b></td>
			<td><input type="text"  name="text7" value=<%=rs.getString("DOJ")%>></input></td>
		</tr>
		<tr>
			<td align="left"><b>DOJ:</b></td>
			<td><input type="text"  name="text8" value=<%=rs.getString("DOB")%>></input></td>
		</tr>
		<tr>
			<td align="left"><b>UserName:</b></td>
			<td><input type="text"  name="text9" value=<%=rs.getString("Username")%>></input></td>
		</tr>
		<tr>
			<td align="left"><b>Password:</b></td>
			<td><input type="password" name="text10"  value=<%=rs.getString("Password")%>></input></td>
		</tr>
	</table></center>
	<%
	}}
	catch(Exception e){
	e.printStackTrace();
	}%>
	<br>
	<center>
	<input type="submit" value="Update" name="submit" onclick="return check();"></input>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" value="Cancel" name="cancel" onclick="javascript:Close();"></input></center>
	<br>
</form>
</body>
</html>