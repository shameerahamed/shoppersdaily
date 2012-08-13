<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,com.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Employee Details</title>
		<link rel="stylesheet" href="../css/theme.css" type="text/css"></link>
		<script>
		function openwin(url) {			
			window.open(url,"CustomerDetails","width=350,height=500");
			}
		
		</script>
	</head>
	<body>
		<form action="search.jsp">
		<center><h2>EMPLOYEE DETAILS</h2></center>				
		<center>
		<table align="center">
			<tr><td colspan="3" align="center"><a href="register.jsp">Add New Employee</a></td></tr>
			<tr><td colspan="3">&nbsp;</td></tr>
			<tr>
				<td>Enter Employee Id</td>
				<td><input type="text" name="input"></td>
				<td><input type="submit" value="Search" name="search"></td>
			</tr>
		</table>
		</center><br><br>
		<center>
			<div style="height:200px;width:700px;overflow:auto" >		
			<table  border="0" cellspacing="1" cellpadding="1" width="96%" bgcolor="#7DBB0B">				
				<tr bgcolor=#ffffff>
					<td colspan="3" width="20%"><b>Action</b></td>
					<td><b>ID</b></td>
					<td><b>Name</b></td>
					<td><b>Phone Number</b></td>
				</tr>
		<%try{		
			DbaseConn.getConnection();
			ResultSet rs = DbaseConn.exeQuery("select * from Employee");
			while(rs.next())
			{ %>
				<tr bgcolor=#FFFFFF>
					<td><a href="#" onclick="javascript:openwin('view.jsp?eid=<%=rs.getString("Emp_id")%>');return false;" alt="View" title="View"><img src="../images/b_view.png" border="0"></img></a></td>
					<td><a href ="#" onclick="javascript:openwin('edit.jsp?eid=<%=rs.getString("Emp_id")%>');return false;" alt="Edit" title="Edit"><img src="../images/b_edit.png" border="0"></img></a></td>
					<td><a href="delete.jsp?eid=<%=rs.getString("Emp_id")%>" alt="Delete" title="Delete"><img src="../images/b_drop.png" border="0"></img></a></td>	
					<td><%=rs.getInt("Emp_id")%></td>
					<td><%=rs.getString("Ename")%></td>
					<td><%=rs.getString("Phone_no") %></td>
				</tr>
			<%}}
		catch(Exception e){
			e.printStackTrace();
		}%>
		</table>
		</div>
		</center>
		</form>
</body>
</html>