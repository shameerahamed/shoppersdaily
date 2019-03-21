package com;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CustomerServlet
 */
public class CustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		DbaseConn.getConnection();
		//	String id=(String) request.getParameter("CID");
		String name=request.getParameter("CNAME");
		String address=request.getParameter("CADDRESS");
		String phone= request.getParameter("CPHONE");
		String email= request.getParameter("CEMAIL");
		String date= request.getParameter("CDATE");
		String query=null;
		query="insert into customer(Cust_id,custname,Address,Phone_no,E_mail,Reg_Date) values(null , '"+name+"' , '"+address+"' , '"+phone+"' , '"+email+"' , '"+date+"')";
	
		
		DbaseConn.exec(query);
		query="select cust_id from customer where E_mail='"+email+"'";
		ResultSet rs=DbaseConn.exeQuery(query);
		try{
		rs.next();
		HttpSession ses=request.getSession();
		ses.setAttribute("cust_id",rs.getString("cust_id"));
		response.sendRedirect("../AddtoCart");
		}catch(Exception e){e.printStackTrace();}
	}
	

}
