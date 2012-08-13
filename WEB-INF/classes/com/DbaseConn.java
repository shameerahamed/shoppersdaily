package com;

import java.sql.*;

public class DbaseConn {
	static String url;
	static Connection con;
	static Statement stmt;
	static ResultSet rs;
	static int res;
	
	public static void getConnection(){
		url = "jdbc:mysql://172.24.23.94:3306/shopdetails";	
		try {
		Class.forName("com.mysql.jdbc.Driver");
		con= DriverManager.getConnection(url,"root","root");
		stmt = con.createStatement();
		//System.out.println("Connected...!");
		} catch(Exception e) {			
			e.printStackTrace();
		}		
	}
	
	public static ResultSet exeQuery(String query) {
		try {
			rs = stmt.executeQuery(query);
			} catch(Exception e){
			e.printStackTrace();			
		}
		return rs;
	}
	public static void close() {
		try {
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static int exec(String str)	{
		try {
			 res= stmt.executeUpdate(str);
		} catch(Exception e) {
			e.printStackTrace();	
		}
		return res;		
	}
}
