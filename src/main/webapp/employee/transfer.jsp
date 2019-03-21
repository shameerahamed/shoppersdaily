<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,com.*"%>
<%
String[] input = new String[11];
	for(int i=1;i<=10;i++){ 
		input[i]=request.getParameter("text" +i);
	}
	try{		
		DbaseConn.getConnection(); 
		String query1="Update employee set Ename='"+input[1]+"',Gender='"+input[2]+"',Address='"+input[3]+"',Phone_no='"+input[4]+"',E_mail='"+input[5]+"',Designation='"+input[6]+"',DOJ='"+input[7]+"',DOB='"+input[8]+"',Username='"+input[9]+"',Password='"+input[10]+"' where Emp_id="+request.getParameter("eid");
		System.out.println(query1);
		int u=DbaseConn.exec(query1);
		System.out.println(u);
		if(u>0)	
		out.println("<script>alert('Updated successfully');window.close();</script>");
		else
		out.println("error");
		}
		catch(Exception e){
			e.printStackTrace();
		}
%>