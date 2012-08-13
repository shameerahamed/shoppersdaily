<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><link href="css/theme.css" rel="stylesheet" type="text/css"></link></head>
<body background="images/bg.gif">
<img src="images/cus.jpg" width="150" height="80" alt="Shapes" usemap="#shapes" border="0">
<map name="shapes" id="shapes">
<area	shape="rect"
	coords="0,0,150,80" href="shop.html" target="details"
		title="Rectangle" alt="Customer Satisfaction is Our Primary Duty"/>
</map>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<img src="images/banner1.gif">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;
<img src="images/circle.jpg" height="80" width="200" style="z-index:0"></span>
<% if(session.getAttribute("username")==null) { %>
	<script>
		alert("Invalid Access");
		parent.location='index.jsp';
		window.close();
	</script>			
<%	}
	 /* else
		out.println("Welcome "+ session.getAttribute("username").toString()); */
%>
</body>
</html>
