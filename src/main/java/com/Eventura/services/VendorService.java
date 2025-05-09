package com.Eventura.services;

import java.sql.Statement;

import com.Eventura.model.Vendor;
import com.Eventura.utils.DBConnection;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;



public class VendorService {
	
	//Connect DB
	
		private static boolean isSuccess;
		private static Connection con = null;
		private static Statement stmt = null;
		private static ResultSet rs = null;
		
	//Insert data
		public static boolean insertdata(String name,String nic, String email, String phone, String service, String password) {
		
		boolean isSuccess = false;
		try {
			
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			
		String sql = "insert into vendors values(0,'"+name+"','"+nic+"','"+email+"','"+phone+"','"+service+"','"+password+"')";
		
		int rs = stmt.executeUpdate(sql);
		if(rs > 0) {
			isSuccess = true;
		} else {
			isSuccess = false;
		}
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
}
		//Display data
		public static List<Vendor> getById(String Id) throws SQLException {
			
			int convertedID = Integer.parseInt(Id);
			
			ArrayList<Vendor> vendor = new ArrayList<>();
		
		try {
				//DBConnection
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			
		
			String sql = "select * from vendors where id '"+convertedID+"'";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String nic = rs.getString(3);
				String email = rs.getString(4);
				String phone = rs.getString(5);
				String service = rs.getString(6);
				String password = rs.getString(7);
				
				Vendor v = new Vendor(id,name,nic,email,phone,service,password);
				vendor.add(v);
			}
		}
		
		catch(Exception e){
			e.printStackTrace();
		}
			return vendor;
			
		}
		
	//Get All Data
		public static List<Vendor> getAllVendors(){
			
			ArrayList<Vendor> vendors = new ArrayList<>();

			try {
					//DBConnection
				con = DBConnection.getConnection();
				stmt = con.createStatement();
				
			
				String sql = "select * from vendors";
				
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
					int id = rs.getInt(1);
					String name = rs.getString(2);
					String nic = rs.getString(3);
					String email = rs.getString(4);
					String phone = rs.getString(5);
					String service = rs.getString(6);
					String password = rs.getString(7);
					
					Vendor v = new Vendor(id,name,nic,email,phone,service,password);
					vendors.add(v);
				}
			}
			
			catch(Exception e){
				e.printStackTrace();
			}
				return vendors;
			
		}
		
		//update data
		public static boolean updatedata(String id,String name,String nic,String email,String phone,String service,String password ) {
			
			try {
				
				//DBConnection
				con = DBConnection.getConnection();
				stmt = con.createStatement();
				
				//SQL Query
				String sql = "update vendors set name='"+name+"',nic='"+nic+"',email='"+email+"',phone='"+phone+"',service='"+service+"',password='"+password+"'"
						+"where id = '"+id+"'";
				
				int rs = stmt.executeUpdate(sql);
				
				if(rs > 0) {
					isSuccess = true;
				} else {
					isSuccess = false;
				}
				
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			return isSuccess;
			
		}
  
}


	
