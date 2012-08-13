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
<%//String code=request.getParameter("productid");
//String str=request.getParameter("r1");
DbaseConn.getConnection(); 

%>
<!-- <div align="center"><h4>Add Product</h4></div> -->
<form name="additem" action="additem.jsp" method="">
<table width="40%" border="0" align="center" cellspacing="0" cellpadding="5" style="border: 1px solid #7DBB0B">
<tr>
	<td width="50%"><b>Product Name</b></td>
	<td><input type="text" name="NAME"></input></td>
</tr>
<tr>
	<td><b>Brand Name</b></td>
	<td><input type="text" name="BRANDNAME"></input></td>
</tr>
<tr>
	<td><b>Quantity</b></td>
	<td><input type="text" name="QTY"></input></td>
</tr>
<tr>
	<td><b>Price</b></td>
	<td><input type="text" name="PRICE"></input></td>
</tr>
<tr>
	<td align="right"><input type="submit" name="submit" value="Submit"></input></td>
	<td><input type="reset" name="reset" value="Reset"></input></td>
</tr>
</table>
</form>
</body>
</html>