<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.*,java.sql.*,javax.servlet.*,javax.servlet.http.*"%>
 <%! int id,phone;
  String name,add,email,date; %>
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Customer</title>
<link rel="stylesheet" href="../css/theme.css" type="text/css"></link>
</head> 
<body>
<%
 if(request.getParameter("Update") != null && request.getParameter("id") != null) {
	String id = request.getParameter("id");
	String name = request.getParameter("CNAME");
	String add = request.getParameter("CADDRESS");
	String phone = request.getParameter("CPHONE");
	String email = request.getParameter("CEMAIL");	
	DbaseConn.getConnection();
	String qry = "update customer set custname='"+name+"',Address='"+add+"',Phone_no= '"+phone+"' ,E_mail= '"+email+"' where Cust_id="+id;
	//out.println("Values are Updated.");
	DbaseConn.exec(qry);
	out.println("<script>alert('Updated successfully');window.opener.location.href='CustSearch.jsp?searchtext="+name+"';self.close();</script>");
	//response.sendRedirect("CustSearch.jsp");
 }
%>  
<center><h3>Customer Edit Form</h3></center><br>
	<%try{
		DbaseConn.getConnection();
		String cid = request.getParameter("id");
		String query = "select * from customer where Cust_id = " + cid ;
		ResultSet rs = DbaseConn.exeQuery(query);
		if(rs.next()){
			id= rs.getInt("Cust_id");
			name=rs.getString("custname");
			add=rs.getString("Address");
			phone =rs.getInt("Phone_no");
			email=rs.getString("E_mail");
			date=rs.getString("Reg_date");
			}
		else{
			System.out.print("Error");
		}
	
} 
catch(Exception e){
e.printStackTrace();
}
	%>
	<form action="CustUpdate.jsp" method="post">
		<div id=table>
<table width="90%">
	<tr><td><input type="hidden" name="id" value="<%= id %>"/></td><tr>
	<tr><td><b>Name</b></td><td><input type="text" name="CNAME" value=<%=name %>></input></td></tr>
	<tr><td><b>Address</b></td><td><textarea rows="5" cols="20" name="CADDRESS"><%=add %></textarea></td></tr>
	<tr><td><b>Phone No </b></td><td><input type="text" name="CPHONE" value=<%=phone %>></input></td></tr>
	<tr><td><b>Email Addr</b></td><td><input type="text" name="CEMAIL" value=<%=email %>></input></td></tr>
	<tr><td><b>Registration Date </b></td><td><input type="text" name="CDATE" value=<%=date %>></input></td></tr>
	<tr><td colspan="2">&nbsp;</td></tr>
	<tr><td></td><td><input type="submit" name="Update" value="Update"></input></td></tr>
	</table>
	</div>
	</form>







</body>
</html>