package com;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class AddtoCart
 */
public class AddtoCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddtoCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("deprecation")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doTask(request,response);
		HttpSession session = request.getSession();
		int flag = 0;
		String cust_id = (session.getAttribute("cust_id")).toString();
		if(request.getParameter("mode")!=null) {
			if(request.getParameter("mode").equals("skip"))
				flag = 1;				
		}
		//System.out.println(cust_id);
		//String cust_id = request.getParameter("cust_id");
		if(!(cust_id.equalsIgnoreCase("0")) || (flag==1)) { //Guest customer
			System.out.println("Welcome to doGet...!");			
			//String cust_id = (session.getAttribute("cust_id")).toString();
			Date d = new Date();
			String sdat=d.toString();
			String yr=sdat.substring(sdat.lastIndexOf(" ")+1);			
			String qry = null;
			ResultSet rs;
			int ord_id = 0;
			String date = yr +"-"+(d.getMonth()+1)+"-"+d.getDate();
			float total_amt = 0.0f;
				
			try {				
				qry="insert into tbl_order values(null,"+cust_id+",'"+date+"',0.0)";
				System.out.println(qry);
				DbaseConn.getConnection();	
				int res = DbaseConn.stmt.executeUpdate(qry);
				System.out.println(res);
				if(res > 0) {					
					qry = "select ord_id from tbl_order where cust_id ="+cust_id+" and ord_date = '"+date+"' order by ord_id desc limit 0,1";
					rs = DbaseConn.exeQuery(qry);
					while(rs.next()) 
						ord_id = rs.getInt("ord_id");
					
					if(ord_id != 0) {								
						if(session.getAttribute("prod") != null) {
							Vector v1 = new Vector();
							v1=(Vector)session.getAttribute("prod");
							Iterator it = v1.iterator();
							int i =0 ;
							while(it.hasNext()) {						
								cart c=new cart((cart)it.next());
								//System.out.println(c.getDetails());
								String[] det = c.getDetails();
								qry = "insert into tbl_orderitem values(null,"+ord_id+","+det[0]+","+det[5]+","+det[3]+")";
								res = DbaseConn.stmt.executeUpdate(qry);
								if(res > 0) {
									qry = "update product set Qty = Qty-"+det[3]+",qty_sold=qty_sold+"+det[3]+" where Prod_id = "+det[0];
									System.out.println(qry);
									DbaseConn.stmt.executeUpdate(qry);
								}
								
								total_amt += new Float(det[5]);
							}
						}
						qry = "update tbl_order set total_amount="+total_amt+" where ord_id = "+ord_id;						
						DbaseConn.stmt.execute(qry);
						session.setAttribute("ord_id", ord_id);
						session.setAttribute("prod",null);
						response.sendRedirect("ReportGenerator.jsp");
					}
				}
			} catch(Exception e) {
				e.printStackTrace();
			}			
		} else {			
			response.sendRedirect("customer/CustReg.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(request.getParameter("confirm") != null) {
			doGet(request,response);
		} else {			
			doTask(request,response);
		}
	}
	
	public void doTask(HttpServletRequest request, HttpServletResponse response) throws ServletException , IOException  { 
		String pname = request.getParameter("prod_name");
		String bname = request.getParameter("brand_name");
		int qty = new Integer(request.getParameter("count_quant"));
		int prod_id = 0;
		float price = 0.0f;		
		try {
			ResultSet rs = DbaseConn.exeQuery("Select Prod_id,Price from product where Pname='"+pname+"' and Brand_name='"+bname+"'");
			if(rs.next()) {
				prod_id = rs.getInt("Prod_id");
				price = new Float(rs.getFloat("price")); 
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
			
		
		cart c2 = new cart(prod_id,pname,bname,qty,price);		
				
		Vector v = new Vector(2,3);
		Vector v1 = new Vector(2,3);
		HttpSession ses = request.getSession(true);
		//try{
		if(ses.getAttribute("prod") instanceof Vector) {
			v1=(Vector)ses.getAttribute("prod");
			Iterator it = v1.iterator();
			while(it.hasNext()) {
				cart c1=new cart((cart)it.next());
				v.add(c1);
			}			
			//v.add((cart)ses.getAttribute("prod"));			
		}
		//}	catch(Exception e)	{e.printStackTrace();
		//}
		v.add(c2);
		ses.setAttribute("prod", v);
		//response.sendRedirect("sessionpage.jsp");
		response.sendRedirect("purchase1.jsp");
		
	}	
}
