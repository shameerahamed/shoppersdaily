<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.*,java.sql.*,java.util.*" %>
<%	

DbaseConn.getConnection();
ResultSet rs = null;
String cust_id = request.getParameter("cust_id");
//System.out.println(cust_id);
if(cust_id!=null) {
	session.setAttribute("cust_id",cust_id);
}

if(session.getAttribute("cust_id") != null)
	cust_id = session.getAttribute("cust_id").toString();

String pname = request.getParameter("prod_name");
String bname = request.getParameter("brand_name");
int qty = 0;
int prod_id=0;
int qty_ded=0;
float total_amt = 0.0f;


if(request.getParameter("mode")!=null) {
	if(request.getParameter("mode").equals("cancel")) {
		session.setAttribute("prod",null);
		response.sendRedirect("shop.html");
	}
}

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/theme.css" type="text/css"></link>
<script type="text/javascript">
	function form1sub(i) {
		var frm = document.frm_addprod;
		var submit_flag = true;
		if(i==0) {
			frm.action="purchase1.jsp";
			//frm.addbtn.value = "";
		}
		else if(i==1) {
			submit_flag = validateQty();
			frm.action="AddtoCart";
			//frm.addbtn.value = "clicked";
		}
		else {
			//submit_flag = validateAdd();
			frm.method = "GET";			
			frm.action="AddtoCart?confirm=yes";
		}
		if(submit_flag)
			frm.submit();	
	}

	function validateQty() {
		var frm = document.frm_addprod;		
		var avail_qty = parseInt(frm.avail_quant.value);
		var reqd_qty = parseInt(frm.count_quant.value);
		//alert("avail = "+avail_qty+" reqd"+reqd_qty);
		if(reqd_qty == "" || reqd_qty <= 0) {
			alert("Please enter the required quantity");
			return false;
		}
		/*if(avail_qty <=0) {
			alert("Sorry , Required quantity is out of stock");
			return false;
		} else*/
		if(reqd_qty > avail_qty) {
			alert("Sorry , Required quantity is out of stock");
			return false;
		}
		return true;	
	}

	/*function validateAdd() {
		var frm = document.frm_addprod;
		if(frm.addbtn.value == "") {
			alert("Please Click Add button to add the product");
			return false;
		} 
		return true;			
	}*/

</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Purchase Order</title>
</head>
<body>
<table width="80%" border="0" cellpadding="2" cellspacing="0">
<form name="frm_addprod" action="purchase1.jsp" method="POST">

<tr>
	<td>Customer ID:</td>
	<td colspan="5"><select name="cust_id" onchange="form1sub(0);" class="txtbox">
				<option>--Select--</option>
				<option value="0" 
				<% 	if(cust_id != null) {
						if(cust_id.equals("0")) { //for Guest Customer
						out.println(" selected");
					} }%>>Guest</option>
				<%				
				rs = DbaseConn.exeQuery("Select distinct cust_id from customer");					
				while(rs.next()) {
					String custid = rs.getString("cust_id");
					out.println("<option value=\""+custid+"\"");
					if(cust_id != null) {
						if(custid.equals(cust_id))
							out.println(" selected");
					}
					out.println(">"+custid+"</option>");
				}												
			%>				
			</select></td>
</tr>
<tr>
		<td>Product Name :</td>
		<td>
			<select name="prod_name" onchange="form1sub(0);" class="txtbox">
				<option>--Select--</option>
				<!--  query -->
				<%				
				rs = DbaseConn.exeQuery("Select distinct Pname from product");					
				while(rs.next()) {
					String prodname = rs.getString("Pname");
					out.println("<option value=\""+prodname+"\"");
					if(prodname.equals(pname))
						out.println(" selected");
					out.println(">"+prodname+"</option>");
				}												
			%>				
			</select>
		</td>
		<td>Brand Name : </td>
		<td colspan="2">
			<select name="brand_name" onchange="form1sub(0);"  class="txtbox">
				<option>--Select--</option>				
				<% if(pname != null) {					
						rs = DbaseConn.exeQuery("Select distinct Brand_name from product where Pname='"+pname+"'");
						while(rs.next()) {
							String brandname = rs.getString("Brand_name");
							out.println("<option value=\""+brandname+"\"");
							if(brandname.equals(bname))
								out.println(" selected");
							out.println(">"+brandname+"</option>");
						}
					}
				%>						
			</select>			
		</td>		
	</tr>
	<tr>
		<td>Available Quantity :</td>
		<td><% if(pname!=null && bname!=null) {
				rs = DbaseConn.exeQuery("Select Prod_id,Qty from product where Pname='"+pname+"' and Brand_name='"+bname+"'");
				if(rs.next()){
					qty = Integer.parseInt(rs.getString("Qty"));
					prod_id=Integer.parseInt(rs.getString("Prod_id"));
					if(session.getAttribute("prod") != null && prod_id != 0) {
						Vector v1 = new Vector();
						v1=(Vector)session.getAttribute("prod");
						Iterator it = v1.iterator();
						int i =0 ;
						while(it.hasNext()) {						
							cart c=new cart((cart)it.next());
							String[] det = c.getDetails();
							if(Integer.parseInt(det[0])==(prod_id)) {
								qty_ded+=Integer.parseInt(det[3]);								
							}
						}
					}	
				} }%>
				<input type="text"  class="txtbox" name="avail_quant" value="<%= (qty-qty_ded) %>" style="width: 99px; height: 25px"  readonly>
				 				
		</td>
		<td>Required Quantity :</td>
		<td><input type="text" class="txtbox" name="count_quant" style="width: 99px; height: 25px"></td>
		<td><input type="button" value="Add" name="add" onclick="form1sub(1);"></td>	
	</tr>
</form>
</table>
<hr>
<h4 align="center" id="f1">Shopping Cart</h4>
<div style="height:230px;overflow:auto;border:1px solid #4EC0FF">
	<table width="95%" cellspacing="1" cellpadding="5" bgcolor="#7DBB0B" align="center" style="margin-top:10px">
		<tr bgcolor="#FFFFFF">
			<td align="center" class="label">SNo.</td>
			<td align="center" class="label">Product Name</td>
			<td align="center" class="label">Brand Name</td>
			<td align="center" class="label">Quantity</td>
			<td align="center" class="label">Price/Unit</td>
			<td align="center" class="label">Total Price</td>
		</tr>
		<%
			try{
				if(session.getAttribute("prod") != null) {
					Vector v1 = new Vector();
					v1=(Vector)session.getAttribute("prod");
					Iterator it = v1.iterator();
					int i =0 ;
					while(it.hasNext()) {						
						cart c=new cart((cart)it.next());
						//System.out.println(c.getDetails());
						String[] det = c.getDetails();
						out.println("<tr bgcolor=\"#FFFFFF\">");
						out.println("<td align=\"center\">"+(++i)+"</td>");
						out.println("<td>"+det[1]+"</td>");
						out.println("<td>"+det[2]+"</td>");			
						out.println("<td>"+det[3]+"</td>");
						out.println("<td>"+det[4]+"</td>");
						out.println("<td>"+det[5]+"</td></tr>");
						total_amt += new Float(det[5]);
					}
				} else {
					out.println("<tr><td colspan=\"6\" align=\"center\" bgcolor=\"#FFFFFF\">No Product Available</td>");
				}
			}catch(Exception e)
			{ e.printStackTrace();}
		%>
			
	</table>
</div>
<table width="100%" border="0">
	<tr>
		<td align="right" width="85%" style="padding-right:50px;"><B>Total Amount</B></td>
		<td align="left" style="padding-left:20px">&nbsp; Rs.<%=total_amt %></td>
	</tr>
	<tr>
		<td align="right" style="padding-right:50px;"><input type="button" name="conf_order" value="Confirm Order" onclick="form1sub(2);"></td>
		<td style="padding-left:20px"><input type="button" name="cancel" value="Cancel" onclick="location.href='purchase1.jsp?mode=cancel';"></td>
	</tr>
</table>
</body>
</html>