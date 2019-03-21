<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.*,java.sql.*,javax.servlet.*,javax.servlet.http.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% DbaseConn.getConnection();
   String id = null;
   String mode = null;
   ResultSet rs;
   int count = 0;
   %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Customer</title>
<link rel="stylesheet" href="../css/theme.css" type="text/css"></link>
<script>
function openwin(url) {			
	window.open(url,"CustomerDetails","width=350,height=500");
}
</script>
</head>
<body>
<center><h2>Customer Information</h2></center><br>
<!--<img src="../images/billbanner1.jpg" /> 
<a href="CustReg.jsp">New Customer Registration....</a>  -->
<form action = "CustSearch.jsp" >
<table align="center">
<tr><td id="f2"><b>Customer Name :</b></td>
<td><input type="text" name="searchtext" ></input></td>
<td><input type="submit" name="submit" value="Search" onClick="CustSearch.jsp"></input></td></tr>
</table><br><br>
<%  
	String check = request.getParameter("searchtext");
	if(check != null)
	{
		String qry = "select Cust_id, custname,Phone_no from customer where custname like '%"+request.getParameter("searchtext")+"_%'";
		rs = DbaseConn.exeQuery(qry);
		System.out.println(qry);		
	
   %>
   <table border="0" cellspacing ="1"  cellpadding="0" class="sample" align="center" width="80%">
 	<tr>
 		<td width="20%" colspan="3" align="center"><b>Action</b></td>
 		<td align="center"><b>Customer Id</b></td>
 		<td align="center"><b>Customer Name</b></td>
 		<td align="center"><b>Phone</b></td>
 	</tr>
  <%
  			
     		while(rs.next()){
     			count++;
     		String str=(String)rs.getString("Cust_id");
  		  	 %>
  		  	<tr>
	  		  	<td align="center"><a href="#" onclick="openwin('CustView.jsp?id=<%= str%>');return false;" alt="View" title="View"><img src="../images/b_view.png" border="0"></img></a></td>
	  		  	<td align="center"><a href="#" onclick="openwin('CustUpdate.jsp?id=<%= str%>');return false;" alt="Edit" title="Edit"><img src="../images/b_edit.png" border="0"></a></td>
	  		  	<td align="center"><a href="#" onclick="openwin('CustDelete.jsp?id=<%=str%>');return false;" alt="Delete" title="Delete"><img src="../images/b_drop.png" border="0"></a></td>
	  		   	<td align="center"> <%= rs.getString("Cust_id")%></td>
	  		   	<td align="center"><%= rs.getString("custname") %></td>
	  		   	<td align="center"><%= rs.getString("Phone_no")%></td>  		   	
  		   	</tr>
  	<%} }	
	if(check!=null && count==0){
		out.println("NO RECORDS FOUND");
	}
  	%>

</table>

</form>

</body>
</html>
