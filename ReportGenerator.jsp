<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.DbaseConn" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
	boolean custCheck(String custid) {
		System.out.println(custid);
		if(custid==null)
			return false;
		else if (custid.equals("0"))
			return false;
		else
			return true;
	}
%>
<% DbaseConn.getConnection();
   ResultSet rs=null;
   ResultSet rs1=null;
   Object o = null;
   String cust_id = (session.getAttribute("cust_id")).toString();
   boolean res = false;
   String qry = null;
   int ord_id = 0;
   try{
	   o = session.getAttribute("ord_id");	
	   System.out.println(o.toString());
	   if(o!=null) 
		   ord_id = new Integer(o.toString());	   
	   if(!custCheck(cust_id))	   
			qry = "select * from tbl_order where ord_id = "+ord_id;	  
	   else
		   qry="select o.ord_id,o.ord_date,c.Cust_id,c.custname from tbl_order o,customer c where c.Cust_id = o.cust_id and o.ord_id="+ord_id;
	   System.out.println(qry);
	   rs=DbaseConn.exeQuery(qry);
	   res = rs.next();
   } catch(SQLException e) {
	  System.out.println("Error in customer id");
	  throw e;
   }
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ReportGenerator</title>
</head>
<body bgcolor=#E3F9D5>
<center><img src="images/billbanner1.jpg"></center><br><br>
<table border="0" cellspacing="2" width="80%" align="center" style="border:1px solid #7DBB0B">
<tr>
	<th align="left"><font color=#1E5680>Customer ID</font> : <%= (custCheck(cust_id))?rs.getString("Cust_id"):"Guest"%></th>		
	<th align="left"><font color=#1E5680>Date</font> : <%= rs.getString("ord_date")%></th>
</tr>
<tr>	
	<th align="left"><font color=#1E5680>Customer Name</font> : <%= (custCheck(cust_id))?rs.getString("custname"):"Guest"%></th>
	<th align="left"><font color=#1E5680>Order ID</font> : <%= rs.getString("ord_id")%></th>
</tr>
</table><br><br>
<%	if(res) {
		qry = "select oi.prod_id,p.Pname,p.Price,oi.quantity,oi.amt from tbl_orderitem oi, product p where oi.prod_id=p.Prod_id and oi.ord_id="+ord_id;
		rs1=DbaseConn.exeQuery(qry);
	}
 %>
<table border="0" cellspacing="1" cellpadding="5" bgcolor="#7DBB0B" align="center" width="80%">
<tr bgcolor="#FFFFFF">
	<th>Sno</th>
	<th>Prod_ID</th>
	<th>Product Name</th>
	<th>Price</th>
	<th>Quantity</th>
	<th>Amount</th>
</tr>
 <%
 	int i=1;
 	double total=0;
 	while(rs1.next()){
 %>
<tr bgcolor="#FFFFFF">
  <td align="center"><%= i++ %></td>
  <td align="center"><%= rs1.getString("prod_id")%></td>
  <td><%= rs1.getString("Pname")%></td>
  <td align="center"><%= rs1.getFloat("Price")%></td>
  <td align="center"><%= rs1.getString("quantity")%></td>
  <td align="center"><%= rs1.getFloat("amt")%></td>
</tr> 
 <%total+=rs1.getFloat("amt");}%> 
<tr bgcolor="#FDFCD5">
	<td colspan="5" align="right" style="padding-right:40px"><b>Total</b></td>
	<td align="center"><b><%= total%></b></td>
</tr>
</table>
<div align="center">
	<h3 style="color:#1E5680">Thanking You! Come Again... </h3>
	<input type="button" value="Print" onclick="window.print();location.href='index.html';">
</div>
</body>
</html>