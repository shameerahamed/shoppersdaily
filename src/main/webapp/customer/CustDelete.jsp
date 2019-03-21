<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.*,java.sql.*,javax.servlet.*,javax.servlet.http.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Customer</title>
<link rel="stylesheet" href="../css/theme.css" type="text/css"></link>

</head>
<body>
<center><img src="../images/billbanner1.jpg" /></center><br>

<%
try{
DbaseConn.getConnection();
String cid=request.getParameter("id");
String query="delete from customer where Cust_id="+cid;
DbaseConn.exec(query);
%>
<center>
<% 
out.println("RECORD DELETED!!!");
}
catch(Exception e)
{
e.printStackTrace();	
}

%>

<br><br><br><a href="CustSearch.jsp"> BACK</a></center>
</body>
</html>