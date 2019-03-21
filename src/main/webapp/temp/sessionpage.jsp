<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,com.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
//try{
	if(session.getAttribute("prod") != null) {
		Vector v1 = new Vector();
		v1=(Vector)session.getAttribute("prod");
		Iterator it = v1.iterator();
		while(it.hasNext()) {
			cart c=new cart((cart)it.next());
			//System.out.println(c.getDetails());
			for(String val : c.getDetails()) {
				System.out.println(val);
			}
		}
	}
//}catch(Exception e)
//{ e.printStackTrace();}
%> <a href="purchase1.jsp">purchase</a>
<%
Date d = new Date();
String str = d.toString();
out.println(d);
out.println(d.getDate());
out.println(d.getMonth());
out.println(str.substring(23));
out.println(str.lastIndexOf(" "));
out.println(str.substring(str.lastIndexOf(" ")));
%>
</body>
</html>