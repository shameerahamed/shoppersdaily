<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*"%>
  <%
  	Date d = new Date();
	String sdat=d.toString();
	String yr=sdat.substring(sdat.lastIndexOf(" ")+1);	
	String date = yr +"-"+(d.getMonth()+1)+"-"+d.getDate();
  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../css/theme.css" type="text/css"></link>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<br>
<div align="right"><a href="../AddtoCart?mode=skip">Skip Registration</a></div>
<center id="f1">Customer Registration</center><br><br>
<form name="customer" action="CustomerServlet" method="post" >
	<div id=table>
<table align="center" id="f2">	
	<tr><td><b>Name</b></td><td><input type="text" name="CNAME" ></input></td></tr>
	<tr><td><b>Address</b></td><td><textarea rows="5" cols="30" name="CADDRESS"></textarea></td></tr>
	<tr><td><b>Phone No</b></td><td><input type="text" name="CPHONE" size="12"></input></td></tr>
	<tr><td><b>Email Addr</b></td><td><input type="text" name="CEMAIL"></input></td></tr>
	<tr><td><b>Registration Date</b></td><td><input type="text" name="CDATE" readonly value="<%=date %>"></input> [YYYY-MM-DD]</td></tr>	
 </table>
 </div><br><br>
    <center><input type="submit" name="submit" value="Submit"></input>
	<input type="reset" name="reset" value="Reset" ></input><br><br>
	<!--  <a href="CustSearch.jsp">CUSTOMER SEARCH...</a></center>  -->
	
</form>
</body>
</html>