<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.DbaseConn" import="java.lang.*" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../css/theme.css">
<title>Insert_item</title>
</head>
<body>
<%DbaseConn.getConnection(); 
//String id=request.getParameter("ID");
String itemname=request.getParameter("NAME");
String quantity=request.getParameter("QTY");
String price=request.getParameter("PRICE");
String brandname=request.getParameter("BRANDNAME");

	String insertQry = "insert into product(Pname,Qty,Price,Brand_name) values('"+itemname+"','"+quantity+"','"+price+"','"+brandname+"')"; 
	int val = DbaseConn.exec(insertQry);
	
	if(val!=0)
	{
		
		
		 //out.println("This Emp ID already Exists");
		//document.location="EmplyeeInformation.jsp";
		response.sendRedirect("viewall.jsp"); 
		/* ResultSet rs = DbaseConn.exeQuery("Select * from product");

		
 
			out.println("<TABLE>");	
			out.println("<TR>");   
			out.println("<th>PRODUCT ID</th>");
			out.println("<th>PRODUCT NAME </th>");
			out.println("<th>QUANTITY</th>");
			out.println("<th>PRICE</th>");
			out.println("<TH>BRAND NAME</TH>");
			out.println("<TH>QUANTITY SOLD</th>");
			out.println("</TR>");
			while (rs.next()) {
				  out.println("<TR>");   
				    out.println("<TD>" + rs.getString(1) + "</TD>"); 
				    out.println("<TD>" + rs.getString(2) + "</TD>"); 
				    out.println("<TD>" + rs.getString(3) + "</TD>"); 
				    out.println("<TD>" + rs.getString(4) + "</TD>"); 
				    out.println("<TD>" + rs.getString(5) + "</TD>");
				    out.println("<TD>" + rs.getString(6) + "</TD>");
				    out.println("</TR>"); 
    
  } 
			out.println("</TABLE>");
  rs.close();
  out.println("insertion successful");
		*/	
	}
	%>



</body>
</html>