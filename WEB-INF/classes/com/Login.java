package com;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

/**
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public Login() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession ses=request.getSession();
		if(request.getParameter("mode")!=null) {
			if(request.getParameter("mode").equalsIgnoreCase("logout"))	{
				ses.setAttribute("username", null);
				ses.setAttribute("prod",null);
				ses.setAttribute("cust_id",null);
				ses.setAttribute("erruser","You have successfully logged out ..!");
				response.sendRedirect("index.jsp");
			}
		} else {
			doTask(request,response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doTask(request,response);
	}
	
	public void doTask(HttpServletRequest request, HttpServletResponse response) throws ServletException , IOException {
		String username = request.getParameter("username");
		String password=request.getParameter("password");
		HttpSession ses=request.getSession();
				
		try{
			DbaseConn.getConnection();	
			String query = "select * from Employee where Username='"+username+"' and Password='"+password+"'";
			System.out.println(query);
			ResultSet rs = DbaseConn.exeQuery(query);
			if(rs.next()) {				
				ses.setAttribute("username",username);
				response.sendRedirect("home.html");
			} else {
				ses.setAttribute("erruser","Invalid Username / Password");
				response.sendRedirect("index.jsp");
			}				
		}
		catch(Exception e){
			e.printStackTrace();
		}	
		finally {
			DbaseConn.close();
		}

	}

}
