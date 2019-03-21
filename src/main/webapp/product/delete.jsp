<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.DbaseConn"%>
    <%@ page import="java.lang.*" %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/theme.css">
<title>Insert title here</title>
</head>
<body>
<%
DbaseConn.getConnection(); 
int rs = DbaseConn.exec("delete from product where Prod_id="+request.getParameter("pid"));
response.sendRedirect("viewall.jsp");
/*if(rs!=0)
	{
		ResultSet rs1=DbaseConn.exeQuery("Select Prod_id,Pname,Brand_name from product");
		out.println("<table>");
		out.println("<tr>");
		out.println("<th>PRODUCT ID</th>");
		out.println("<th>PRODUCT NAME</th>");
		out.println("<th>BRAND NAME</th>");
		out.println("</tr>");
		while (rs1.next()) {
					    out.println("<TR>");   
		    out.println("<TD>" + rs1.getString(1) + "</TD>"); 
		    out.println("<TD>" + rs1.getString(2) + "</TD>"); 
		    out.println("<TD>" + rs1.getString(3) + "</TD>"); 
		    out.println("</TR>"); 
		  } 
		  rs1.close();
		  out.println("</table>");
	}*/
	%>