package com.Eventura.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.Eventura.model.EventPlanner;
import com.Eventura.utils.DBConnection;

public class EventPlannerService {
	
	//Connect DB
	
			private static boolean isSuccess;
			private static Connection con = null;
			private static Statement stmt = null;
			private static ResultSet rs = null;

			
			//Insert data
			public static boolean insertdata(String name,String nic, String email, String phone, String password) {
			
			isSuccess = false;
			try {
				
				con = DBConnection.getConnection();
				stmt = con.createStatement();
				
			String sql = "insert into eventplanner values(0,'"+name+"','"+nic+"','"+email+"','"+phone+"','"+password+"')";
			
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
			
			//Login validate
			public static List<EventPlanner> loginvalidate (String email, String password){
				
			ArrayList<EventPlanner> eventplanner = new ArrayList<>();
			
			try {
					//DB connection
				con = DBConnection.getConnection();
				stmt = con.createStatement();
				
				String sql = "select * from eventplanner where email='"+email+"' and password='"+password+"'";
				rs = stmt.executeQuery(sql);
				
				if (rs.next()) {
				
					int id = rs.getInt(1);
					String name = rs.getString(2);
					String nic = rs.getString(3);
					String gmail = rs.getString(4);
					String phone = rs.getString(5);
					String pass = rs.getString(6);
					
					
				
					EventPlanner p = new EventPlanner(id,name,nic,gmail,phone,pass);
					eventplanner.add(p);
				}
				
			} catch (Exception e) {
			
				e.printStackTrace();
			}
				
				
				return eventplanner;
				
			}
			
			//Display ePlanner
			public static List<EventPlanner> userProfile(String Id){
				int convertID = Integer.parseInt(Id);
				
				ArrayList<EventPlanner> eventplanner = new ArrayList<>();
				
				try {
					//DB connection
					con = DBConnection.getConnection();
					stmt = con.createStatement();
					
					 String sql = "select * from eventplanner where id = '"+convertID+"'";
					 
					 rs = stmt.executeQuery(sql);
						
						if (rs.next()) {
						
							int id = rs.getInt(1);
							String name = rs.getString(2);
							String nic = rs.getString(3);
							String email = rs.getString(4);
							String phone = rs.getString(5);
							String password = rs.getString(6);
							
									
							
							EventPlanner p = new EventPlanner(id,name,nic,email,phone,password);
							eventplanner.add(p);
							
						}
					
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				return eventplanner;
			}
			
   
			//Update profile
			public static boolean updateprofile(String id,String name,String nic,String email,String phone,String password ) {
				
				try {
					
					//DBConnection
					con = DBConnection.getConnection();
					stmt = con.createStatement();
					
					//SQL Query
					String sql = "update eventplanner set name='"+name+"',nic='"+nic+"',email='"+email+"',phone='"+phone+"',password='"+password+"'"
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

			//GetById
			public static List<EventPlanner> getById(String Id){
				int convertID = Integer.parseInt(Id);
				
				ArrayList<EventPlanner> eventplanner = new ArrayList<>();
				
				try {
					//DB connection
					con = DBConnection.getConnection();
					stmt = con.createStatement();
					
					 String sql = "select * from eventplanner where id = '"+convertID+"'";
					 
					 rs = stmt.executeQuery(sql);
						
						if (rs.next()) {
						
							int id = rs.getInt(1);
							String name = rs.getString(2);
							String nic = rs.getString(3);
							String email = rs.getString(4);
							String phone = rs.getString(5);
							String password = rs.getString(6);
							
							
							EventPlanner p = new EventPlanner(id,name,nic,email,phone,password);
							eventplanner.add(p);
							
						}
					
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				return eventplanner;
			}

			//Delete profile
			public static boolean deleteprofile(String id) {
				int convID = Integer.parseInt(id);
				
				try {

					//DBConnection
				con = DBConnection.getConnection();
				stmt = con.createStatement();
				
				String sql = "delete from eventplanner where id = '"+convID+"'";
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
			
			//Update profile picture path
		    public static boolean updateProfilePic(int id, String profilePicPath) {
		        boolean isSuccess = false;

		        String sql = "UPDATE eventplanner SET profilePic = ? WHERE id = ?";

		        try (Connection con = DBConnection.getConnection();
		             PreparedStatement stmt = con.prepareStatement(sql)) {

		            stmt.setString(1, profilePicPath);
		            stmt.setInt(2, id);

		            isSuccess = stmt.executeUpdate() > 0;

		        } catch (Exception e) {
		            e.printStackTrace();
		        }

		        return isSuccess;
		    }
			
			
}
