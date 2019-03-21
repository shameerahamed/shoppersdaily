<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,com.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Search Employee</title>
		<link rel="stylesheet" href="../css/theme.css" type="text/css"></link>
	</head>
	<body>
		<form action="frontpage.jsp" name="frm_search">
			<%
				String empId=request.getParameter("input");
				if(empId != null) {
				try{		
					DbaseConn.getConnection();
					ResultSet rs = DbaseConn.exeQuery("select * from Employee where emp_id="+empId);%>
					<%while(rs.next()){%>
					<center><h2>Details of <%=rs.getString("Ename")%></h2></center>
					<br><br>
					<center>
						<table cellpadding="3" cellspacing="1" width="40%" bgcolor="#7DBB0B" >
							<tr bgcolor="#FFFFFF">
								<td><b>ID</b></td>
								<td><b>Name</b></td>
								<td><b>Phone No</b></td>
							</tr>
							<tr bgcolor="#FFFFFF">
								<td><%=rs.getInt("Emp_id")%></td>
								<td><%=rs.getString("Ename")%></td><td><%=rs.getInt("Phone_no")%></td>
							</tr>
			
				<% }%>		
						</table>
						</center>	
						<br><br><center><a href="frontpage.jsp">Back</a></center>			
				<%	} catch(Exception e){
						e.printStackTrace();
					}
				} else {
				%>
					<script>alert('Please Enter the Employee Id');location.href='frontpage.jsp';</script>	
				<%} %>
		</form>		
</body>
</html>