package com.Eventura.services;

import java.sql.Statement;

import com.Eventura.model.Vendor;
import com.Eventura.model.EventPlanner;
import com.Eventura.utils.DBConnection;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.sql.Connection;
import java.sql.PreparedStatement;



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
			
		
			String sql = "select * from vendors where id = '"+convertedID+"'";
			
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
		public static boolean updatedata(String vendorId,String name,String nic,String email,String phone,String service,String password ) {
			
			try {
				
				//DBConnection
				con = DBConnection.getConnection();
				stmt = con.createStatement();
				
				//SQL Query
				String sql = "update vendors set name='"+name+"',nic='"+nic+"',email='"+email+"',phone='"+phone+"',service='"+service+"',password='"+password+"'"
						+"where vendorId = '"+vendorId+"'";
				
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
		
	
	//Delete data
		public static boolean deletedata(String vendorId) {
			int convID = Integer.parseInt(vendorId);
			
			try {

				//DBConnection
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			
			String sql = "delete from vendors where vendorId = '"+convID+"'";
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
		
		//login validation
		public Vendor authenticate(String email, String password) {
	        Vendor vendor = null;
	 
	        try (Connection con = DBConnection.getConnection()) {
	            String sql = "SELECT * FROM vendors WHERE email = ? AND password = ?";
	            PreparedStatement stmt = con.prepareStatement(sql);
	            stmt.setString(1, email);
	            stmt.setString(2, password);
	 
	            ResultSet rs = stmt.executeQuery();
	 
	            if (rs.next()) {
	                vendor = new Vendor(
	                        rs.getString("name"),
	                        rs.getString("nic"),
	                        rs.getString("email"),
	                        rs.getString("phone"),
	                        rs.getString("service"),
	                        rs.getString("password")
	                );
	            }
	 
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	 
	        return vendor;
	    }
  
		
		//Display user
		public static List<EventPlanner> userprofile (String Id){
			
			int convertID = Integer.parseInt(Id);
			
			ArrayList<EventPlanner> eventplanner = new ArrayList<>();
			
			try {
				
				//DBConnection
				con = DBConnection.getConnection();
				stmt = con.createStatement();
				
				String sql = "select * from eventplanner where eventId = '"+convertID+"'";
				rs = stmt.executeQuery(sql);
				
				if(rs.next()) {
					
					int eventId = rs.getInt(1);
					String name = rs.getString(2);
					String nic = rs.getString(3);
					String email = rs.getString(4);
					String phone = rs.getString(5);
					String password = rs.getString(6);
					
					
					EventPlanner v = new EventPlanner (eventId,name,nic,email,phone,password);
					eventplanner.add(v);
				}
				
				
			} catch (Exception e) {
				e.printStackTrace();

			}
			return eventplanner;
			
		}
		
		//Assign vendors
		public Map<Integer, List<Vendor>> getVendorsGroupedByEvent() {
		    Map<Integer, List<Vendor>> eventVendorsMap = new HashMap<>();

		    String sql = "SELECT ev.event_id, v.id, v.name, v.service " +
		                 "FROM event_vendor ev " +
		                 "JOIN vendors v ON ev.vendor_id = v.id";

		    try (Connection con = DBConnection.getConnection();
		         Statement stmt = con.createStatement();
		         ResultSet rs = stmt.executeQuery(sql)) {

		        while (rs.next()) {
		            int eventId = rs.getInt("eventId");
		            int vendorId = rs.getInt("vendorId");
		            String name = rs.getString("name");
		            String service = rs.getString("service");

		            Vendor vendor = new Vendor(vendorId, service, service, service, service, service, service);
		            vendor.setVendorId(vendorId);
		            vendor.setName(name);
		            vendor.setService(service);

		            eventVendorsMap.computeIfAbsent(eventId, k -> new ArrayList<>()).add(vendor);
		        }

		    } catch (SQLException e) {
		        e.printStackTrace();
		    }

		    return eventVendorsMap;
		}
		
		//get vendorlist
		public static List<Vendor> getAllVendor() {
		    List<Vendor> vendors = new ArrayList<>();
		    String sql = "SELECT vendorId, name FROM vendors"; // Be explicit with selected columns

		    try (Connection con = DBConnection.getConnection();
		         Statement stmt = con.createStatement();
		         ResultSet rs = stmt.executeQuery(sql)) {

		        while (rs.next()) {
		        	
		            Vendor v = new Vendor();
		            v.setVendorId(rs.getInt("vendorId"));
		            v.setName(rs.getString("name"));
		            vendors.add(v);
		        }

		    } catch (Exception e) {
		        e.printStackTrace();
		    }

		    return vendors;
		}

		
		
		
}


	
