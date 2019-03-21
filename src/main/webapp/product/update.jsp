<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"import="com.DbaseConn" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../css/theme.css">
<title>Insert title here</title>
</head>
<body>
<%
DbaseConn.getConnection(); 
String id=request.getParameter("id");
String name=request.getParameter("name");
String quantity=request.getParameter("quantity");
String brandname=request.getParameter("brandname");
String quantitysold=request.getParameter("quantitysold");
String price=request.getParameter("price");
String updateQry = "update product set Pname='"+name+"',Qty='"+quantity+"',Price='"+price+"',Brand_name='"+brandname+"',qty_sold='"+quantitysold+"' where Prod_id='"+id+"'";
int val = DbaseConn.exec(updateQry);
out.println("<script>alert('Updated Successfully');window.opener.location.href='viewall.jsp';self.close();</script>");

%>
//response.sendRedirect("viewall.jsp");
<% if(val!=0)
{ResultSet rs = DbaseConn.exeQuery("Select * from product");



out.println("<TABLE align=center>");	
out.println("<TR>");   
out.println("<th>Product Id</th>");
out.println("<th>Product Name</th>");
out.println("<th>Quantity</th>");
out.println("<th>Price</th>");
out.println("<TH>Brand Name</TH>");
out.println("<TH>Quantity sold</th>");
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
}


%>

</body>
</html>