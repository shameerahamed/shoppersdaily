<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,com.*"%>
<%
try{					 
			DbaseConn.getConnection();
			String query="delete from employee where Emp_id="+request.getParameter("eid");
			int u=DbaseConn.exec(query);
			if(u>0){
				response.sendRedirect("frontpage.jsp");
			}
			else{
				out.println("error in deletion");
			}
			
	}
	catch(Exception e){
			e.printStackTrace();
		}
%>
