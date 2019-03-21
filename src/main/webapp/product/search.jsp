<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="com.DbaseConn" import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../css/theme.css">
<title>Insert title here</title>
</head>
<body>
<form name="item" action="search.jsp" method="POST">
<table border="0" align="center" ><tr><td>PRODUCTS:<select name="products"  onchange=document.item.submit()>
				<option>SELECT</option>
				<!--  query -->
				<% DbaseConn.getConnection(); 
					ResultSet rs = DbaseConn.exeQuery("Select distinct Pname from product"); 
					while(rs.next()) {
					%><option><%= rs.getString("Pname")%></option>
				<%	} %>
				</select></td></tr>
<tr><td><!--  <input type="submit" name="submit" value="search" ></input></td></tr>-->
</table><br><br>
<table class="sample" align="center" width="80%" cellspacing="1" cellpadding="3">

<% 
		 DbaseConn.getConnection();
			String tempitem=request.getParameter("products");
		//if(tempitem != null) 
			out.println("<TR>"); 
			out.println("<th>Product ID</th>");
			out.println("<th>Product Name</th>");
			out.println("<th>Brand Name</th>");
			out.println("<th>Price</th>");
			out.println("<th>Quantity</th>");
			out.println("<th>Quantity Sold</th>");
			out.println("</TR>");
			String qry = "SELECT * from product where Pname='" + tempitem + "'" ;
			ResultSet rs1 = DbaseConn.exeQuery(qry);
			while(rs1.next()) {
				out.println("<TR>");
         		out.println("<TD align='center'>" + rs1.getString("Prod_id") + "</TD>");
         		out.println("<TD>" + rs1.getString("Pname") + "</TD>");
         		out.println("<TD>" + rs1.getString("Brand_name") + "</TD>");
         		out.println("<TD align='center'>" + rs1.getFloat("Price") + "</TD>");
         		out.println("<TD align='center'>" + rs1.getString("Qty") + "</TD>");
         		out.println("<TD align='center'>" + rs1.getString("qty_sold") + "</TD>");
         		out.println("</TR>");
         	}
		
%>		
</table>


</form>
</body>
</html>