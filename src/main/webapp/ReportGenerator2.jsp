<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.DbaseConn" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% DbaseConn.getConnection();
   ResultSet rs=null;
   ResultSet rs1=null;
   boolean res = false;   
  %>
   <%
   Object o = session.getAttribute("ord_id");
   int ord_id = 0;
   if(o!=null) {
	   ord_id = new Integer(o.toString());
   }
      
   String qry="select o.ord_id,o.ord_date,c.Cust_id,c.custname from tbl_order o,customer c where c.Cust_id = o.cust_id and o.ord_id="+ord_id;
   System.out.println(qry);
   rs=DbaseConn.exeQuery(qry);   
   res = rs.next();   
   %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ReportGenerator</title>
</head>
<body bgcolor="aliceblue">
<center><img src="images/bill1.png"></center><br><br>
<table border="0" cellspacing="2" width="500" align="center">
	<tr>
		<th>Order ID</th>
		<th><%= rs.getString("ord_id")%></th>
		<th>Date</th>
		<th><%= rs.getString("ord_date")%></th>
	</tr>
	<tr>
		<th>Customer ID</th>
		<th><%= rs.getInt("Cust_id")%></th>
		<th>Customer Name</th>
		<th><%= rs.getString("custname")%></th>
	</tr>
</table>
<br><br>
<%
	if(res) {
	   qry="select oi.prod_id,p.Pname,p.Price,oi.quantity,oi.amt from tbl_orderitem oi, product p where oi.prod_id=p.Prod_id and oi.ord_id="+ord_id;
	   System.out.println(qry);
	   rs1=DbaseConn.exeQuery(qry);	    
 %>
<table border="0" cellspacing="2" width="500" align="center">
<tr><th>SNO</th>
<th>PRO_ID</th>
<th>PRODUCT_NAME</th>
<th>PRICE</th>
<th>QUANTITY</th>
<th>AMOUNT</th>

  <%while(rs1.next()){ %>
  <tr>
  <td>.</td>
  <td><%= rs1.getInt("prod_id")%></td>
  <td><%= rs1.getString("Pname")%></td>
  <td><%= rs1.getFloat("Price")%></td>
  <td><%= rs1.getInt("quantity")%></td>
  <td><%= rs1.getFloat("amt")%></td>
  </tr>
  	<%} } %>
  
</table>

</body>
</html>