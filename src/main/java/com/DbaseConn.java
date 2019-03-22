package com;

import java.sql.*;
import java.util.ResourceBundle;

public class DbaseConn {
	static String url;
	static Connection con;
	static Statement stmt;
	static ResultSet rs;
	static int res;

	private static ResourceBundle resourceBundle = ResourceBundle.getBundle("database");
	
	public static void getConnection(){
		url = resourceBundle.getString("jdbcURL");
		try {
		Class.forName(resourceBundle.getString("jdbcDriver"));
		String userName = resourceBundle.getString("username");
		String password = resourceBundle.getString("password");
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
