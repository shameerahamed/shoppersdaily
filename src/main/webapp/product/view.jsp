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
<form action="viewall.jsp">
<%//String code=request.getParameter("productid");

DbaseConn.getConnection(); 
ResultSet rs1=DbaseConn.exeQuery("Select * from product where Prod_id="+request.getParameter("pid"));
out.println("<center><br><br><br><h3>Product Details</h3></center><br><table width=\"80%\" align=center class=sample cellpadding=\"8\" cellspacing=\"1\">");
		while (rs1.next()) {
	    out.println("<TR>");   
	    out.println("<th align=\"left\">Product ID</th>");
	    out.println("<TD align=\"left\">" + rs1.getString(1) + "</TD>"); 
	    out.println("</TR>");   
	    out.println("<TR>");   
	    out.println("<th align=\"left\">Product Name</th>");
	    out.println("<TD align=\"left\">" + rs1.getString(2) + "</TD>");
	    out.println("</TR>");   
	    out.println("<TR>");   
	    out.println("<th align=\"left\">Quantity</th>");
	    out.println("<TD align=\"left\">" + rs1.getString(3) + "</TD>");
	    out.println("</TR>");   
	    out.println("<TR>");   
	    out.println("<th align=\"left\">Price</th>");
	    out.println("<TD align=\"left\">" + rs1.getString(4) + "</TD>");
	    out.println("</TR>"); 
	    out.println("<TR>");   
	    out.println("<th align=\"left\">Brand Name</th>");
	    out.println("<TD>" + rs1.getString(5) + "</TD>");
	    out.println("</TR>");   
	    out.println("<TR>");   
	    out.println("<th align=\"left\">Quantity Sold</th>");
	    out.println("<TD>" + rs1.getString(6) + "</TD>");
	    out.println("</TR>"); 
	  } 
	  rs1.close();
	  out.println("</table>");
	  %>
	  </form>
	  </body>
	  </html>
