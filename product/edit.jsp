<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.DbaseConn"%>
    <%@ page import="java.lang.*" %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../css/theme.css">
<title>Insert title here</title>
</head>
<body>
<form action="update.jsp?pid=<%=request.getParameter("pid")%>" method="">
<%
DbaseConn.getConnection(); 
ResultSet rs1=DbaseConn.exeQuery("Select * from product where Prod_id="+request.getParameter("pid"));
while(rs1.next())
{
%>
<br>
<br>
<center><h2>Edit Product</h2></center>
<table width="85%" cellspacing="1" class="sample" cellpadding="5" align="center">
<tr>
<td><b>Product Id</b></td>
<td align="center"><input type="text" name="id" value="<%=rs1.getString(1)%>"></input></td>
</tr>
<tr>
<td><b>Product Name</b></td>
<td align="center"><input type="text" name="name" value="<%=rs1.getString(2)%>"></input></td>
</tr>
<tr>
<td><b>Brand Name</b></td>
<td align="center"><input type="text" name="brandname" value="<%=rs1.getString(5)%>"></input></td>
</tr>
<tr>
<td><b>Quantity</b></td>
<td align="center"><input type="text" name="quantity" value="<%=rs1.getString(3)%>"></input></td>
</tr>
<tr>
<td><b>Price</b></td>
<td align="center"><input type="text" name="price" value="<%=rs1.getString(4)%>"></input></td>
</tr>
<tr>
<td><b>Quantity sold</b></td>
<td align="center"><input type="text" name="quantitysold" value="<%=rs1.getString(6)%>"></input></td>
</tr>
<tr>
<td align="right"><input type="submit" name="submit" value="submit"></input></td>
<td><input type="reset" name="reset" value="Reset"></input></td>
</tr>
</table>
<%
}

		%>
		</form>
		</body>
		
		</html>