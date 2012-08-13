<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.DbaseConn" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../css/theme.css">
<title>Insert title here</title>
<script>
		function openwin(url) {			
			window.open(url,"ProductDetails","width=350,height=500");
		}
		</script>
		<!--  <script language="javascript">
function additem(){
	document.viewallform.action="action.jsp";
}-->


</script>
</head>
<body>
<form name="viewallform" action="" method="get">
<center>
<div style="height:230px;overflow:auto" >
<table class="sample" width="80%" cellspacing="1" bgcolor="#7DBB0B">
<tr>
<th colspan="3" width="15%">Action</th>
<th width="20%">Product ID</th>
<th>Product Name</th>
<TH>Brand Name</TH>
</tr>
<% DbaseConn.getConnection(); 
ResultSet rs = DbaseConn.exeQuery("Select Prod_id,Pname,Brand_name from product");
while (rs.next()) {%>
	<tr bgcolor="#FFFFFF">
	<td><a href="#" onclick="javascript:openwin('view.jsp?pid=<%=rs.getString("Prod_id")%>');return false;" alt="View" title="View"><img src="../images/b_view.png" border="0"></img></a></td>
	<td><a href ="#" onclick="javascript:openwin('edit.jsp?pid=<%=rs.getString("Prod_id")%>');return false;" alt="Edit" title="Edit"><img src="../images/b_edit.png" border="0"></img></a></td>
	<td><a href="delete.jsp?pid=<%=rs.getString("Prod_id")%>" alt="Delete" title="Delete"><img src="../images/b_drop.png" border="0"></img></a></td>	
    <%
    out.println("<TD>" + rs.getString(1) + "</TD>"); 
    out.println("<TD>" + rs.getString(2) + "</TD>"); 
    out.println("<TD>" + rs.getString(3) + "</TD>"); 
    //out.println("<TD>" + rs.getString(4) + "</TD>"); 
    //out.println("<TD>" + rs.getString(5) + "</TD>");
    //out.println("<TD>" + rs.getString(6) + "</TD>");
    out.println("</TR>"); 
    } 
  rs.close();


%>
</table>
</div>
<br></br>
</center>
</form>

</body>
</html>