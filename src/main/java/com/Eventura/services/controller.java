package com.Eventura.services;



import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import utils.DBConnection;

public class controller {
	 //Connect DB
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs= null;
	
	//insert  data function
	
	public static boolean insertdata (String name, String catagory, String qunetity, String description) {
		
		boolean isSuccess= false;
		
		try {
			//Db Conncetion call
			
			con = DBConnection.getConnection();
			stmt=con.createStatement();
			
			//sql query
			
			String sql = "insert into book values(0, '"+name+"','"+catagory+"','"+qunetity+"','"+description+"')";
			int rs = stmt.executeUpdate(sql);
			if(rs>0) {
				isSuccess = true;
			}
			else {
				isSuccess = false;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
}
