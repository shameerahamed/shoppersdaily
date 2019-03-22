package com;

import java.sql.*;

public class DbaseConn {
	static String url;
	static Connection con;
	static Statement stmt;
	static ResultSet rs;
	static int res;
	
	public static void getConnection(){
		url = "jdbc:mysql://localhost:3306/shopdetails";	
		try {
		Class.forName("org.mariadb.jdbc.Driver");
		String userName = System.getenv("db_user");
		String password = System.getenv("db_password");
		con= DriverManager.getConnection(url,userName,password);
		stmt = con.createStatement();
		System.out.println("Connected...!");
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
