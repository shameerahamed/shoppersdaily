<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,com.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Details</title>
	<link rel="stylesheet" href="../css/theme.css" type="text/css"></link>
	<script>
		function Close() {			
			window.close();
		}
	</script>
</head>
<body>
<form action="frontpage.jsp">
<%

try{		
			 
			DbaseConn.getConnection();
			String query="select * from employee where Emp_id="+request.getParameter("eid");
			ResultSet rs=DbaseConn.exeQuery(query);
			while(rs.next())
			{			
			
			
	%>
	<br><center><b>Details of <%=rs.getString("Ename")%></b></center><br>
	<center>
	<table  border="0" bgcolor="#7DBB0B" cellspacing="1" cellpadding="3" width="50%"  >
		<tr bgcolor="#FFFFFF">
			<td align="left"><b>Emp Id</b></td>
			<td align="left"><%=rs.getString("emp_id")%></td>
		</tr>
		<tr bgcolor="#FFFFFF">
			<td align="left"><b>Name</b></td>
			<td align="left"><%=rs.getString("Ename")%></td>
		</tr>
		<tr bgcolor="#FFFFFF">
			<td align="left"><b>Gender</b></td>
			<td align="left"><%=rs.getString("Gender")%></td>
		</tr>
		<tr bgcolor="#FFFFFF">
			<td align="left"><b>Address</b></td>
			<td align="left"><%=rs.getString("Address")%></td>
		</tr>
		<tr bgcolor="#FFFFFF">
			<td align="left"><b>Phone No</b></td>
			<td align="left"><%=rs.getString("Phone_no")%></td>
		</tr>
		<tr bgcolor="#FFFFFF">
			<td align="left"><b>E-mail</b></td>
			<td align="left"><%=rs.getString("E_mail")%></td>
		</tr>
		<tr bgcolor="#FFFFFF">
			<td align="left"><b>Designation</b></td>
			<td align="left"><%=rs.getString("Designation")%></td>
		</tr>
		<tr bgcolor="#FFFFFF">
			<td align="left"><b>DOB</b></td>
			<td align="left"><%=rs.getString("DOJ")%></td>
		</tr>
		<tr bgcolor="#FFFFFF">
			<td align="left"><b>DOJ</b></td>
			<td align="left"><%=rs.getString("DOB")%></td>
		</tr>
	</table>
	</center><br><br>
	<center><input type="button" value="   Ok   " onclick="javascript:Close();"></input></center>
</form>

	<%} }
		catch(Exception e){
			e.printStackTrace();
						 }%>
</body>
</html>
