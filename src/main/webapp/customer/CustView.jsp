<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.*,java.sql.*,javax.servlet.*,javax.servlet.http.*"%>
  <%! int id,phone;
  String name,add,email,date; %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../css/theme.css" type="text/css"></link>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Customer Details</title>
</head>
<body>
<br>
<br>
<center><h3>View Customer</h3></center><br>
<%
try{
			DbaseConn.getConnection();
			String cid = request.getParameter("id");
			String query = "select * from customer where Cust_id = " + cid ;
			ResultSet rs = DbaseConn.exeQuery(query);
			if(rs.next()){
				id= rs.getInt("Cust_id");
				name=rs.getString("custname");
				add=rs.getString("Address");
				phone =rs.getInt("Phone_no");
				email=rs.getString("E_mail");
				date=rs.getString("Reg_date");
				}
			else{
				System.out.print("Error");
			}
		
} 
catch(Exception e){
	e.printStackTrace();
}
%>

<table border="0" cellspacing="1" cellpadding="5" align="center" width="80%" class="sample">
<tr><td><b>Customer id</b><td><%= id %><br>
<tr><td><b>Name </b><td><%=name %><br>
<tr><td><b>Address </b><td><%=add %><br>
<tr><td><b>Phone </b><td><%=phone %><br>
<tr><td><b>Email Addr </b><td><%=email %><br>
<tr><td><b>Date </b><td><%=date %><br>
</table>
<br><br>

<center><input type="button" value=" Close " onclick="javascript:window.close();"></center>
</body>
</html>