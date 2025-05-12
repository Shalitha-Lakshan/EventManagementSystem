package com.Eventura.services;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.Eventura.model.Event;
import com.Eventura.utils.DBConnection;

public class EventService {
	
	//Connect DB
	
			private static boolean isSuccess;
			private static Connection con = null;
			private static Statement stmt = null;
			private static ResultSet rs = null;
			
			//Insert data
			public static boolean insertdata (String fullName,String email, String phone, String eventDate, String eventTitle, String eventType
					,String venue,double budget,int guestCount,String requirements) {
			
			isSuccess = false;
			try {
				
				con = DBConnection.getConnection();
				stmt = con.createStatement();
				
			String sql = "insert into event values(0,'"+fullName+"','"+email+"','"+phone+"','"+eventDate+"','"+eventTitle+"','"+eventType+"','"+venue+"','"+budget+"','"+guestCount+"','"+requirements+"')";
			
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
	
			//getById
			public static List<Event> getById(String Id) throws SQLException {
				
				int convertedID = Integer.parseInt(Id);
				
				ArrayList<Event> event = new ArrayList<>();
			
			try {
					//DBConnection
				con = DBConnection.getConnection();
				stmt = con.createStatement();
				
			
				String sql = "select * from event where id = '"+convertedID+"'";
				
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
					
					  int id = rs.getInt(1);
					  String fullName = rs.getString(2);
				        String email =  rs.getString(3);
				        String phone =  rs.getString(4);
				        String eventDate =  rs.getString(5);
				        String eventTitle =  rs.getString(6);
				        String eventType =  rs.getString(7);
				        String venue =  rs.getString(8);
				        Double budget = rs.getDouble(9);
				        int guestCount = rs.getInt(10);
				        String requirements = rs.getString(11);
					
					Event eve = new Event(id,fullName,email,phone,eventDate,eventTitle,eventType,venue,
							budget,guestCount,requirements);
					
					event.add(eve);
				}
			}
			
			catch(Exception e){
				e.printStackTrace();
			}
				return event;
				
			}		
				
			//Get All Data
				public static List<Event> getAllEvents(){
					
					ArrayList<Event> event = new ArrayList<>();

					try {
							//DBConnection
						con = DBConnection.getConnection();
						stmt = con.createStatement();
						
					
						String sql = "select * from event";
						
						rs = stmt.executeQuery(sql);
						
						while(rs.next()) {

							  int id = rs.getInt(1);
							  String fullName = rs.getString(2);
						        String email =  rs.getString(3);
						        String phone =  rs.getString(4);
						        String eventDate =  rs.getString(5);
						        String eventTitle =  rs.getString(6);
						        String eventType =  rs.getString(7);
						        String venue =  rs.getString(8);
						        Double budget = rs.getDouble(9);
						        int guestCount = rs.getInt(10);
						        String requirements = rs.getString(11);
							
						        Event eve = new Event(id,fullName,email,phone,eventDate,eventTitle,eventType,venue,
										budget,guestCount,requirements);
								
								event.add(eve);
						}
					}
					
					catch(Exception e){
						e.printStackTrace();
					}
						return event ;
					
				}
				
				//Update deta
				public static boolean updatedata(String id,String fullName,String email, String phone, String eventDate, String eventTitle, String eventType
						,String venue,double budget,int guestCount,String requirements ) {
					
					try {
						
						//DBConnection
						con = DBConnection.getConnection();
						stmt = con.createStatement();
						
						//SQL Query
						String sql = "update event set fullName='"+fullName+"',email='"+email+"',phone='"+phone+"',eventDate='"+eventDate+"',eventTitle='"+eventTitle+"'"
								+ ",eventType='"+eventType+"',venue='"+venue+"',budget='"+budget+"',guestCount='"+guestCount+"',requirements='"+requirements+"'"
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
				
	
					
				//Delete data
				public static boolean deletedata(String id) {
					int convID = Integer.parseInt(id);
					
					try {

						//DBConnection
					con = DBConnection.getConnection();
					stmt = con.createStatement();
					
					String sql = "delete from event where id = '"+convID+"'";
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
				
				
			    // Get total number of events
			    public static int getTotalEventCount() {
			        String sql = "SELECT COUNT(*) FROM event";
			        try (Connection con = DBConnection.getConnection();
			             Statement stmt = con.createStatement();
			             ResultSet rs = stmt.executeQuery(sql)) {
			            return rs.next() ? rs.getInt(1) : 0;
			        } catch (Exception e) {
			            e.printStackTrace();
			        }
			        return 0;
			    }

			    // Get count of events by status
			    public static Map<String, Integer> getEventStatusCounts() {
			        Map<String, Integer> map = new HashMap<>();
			        String sql = "SELECT status, COUNT(*) FROM event GROUP BY status";

			        try (Connection con = DBConnection.getConnection();
			             Statement stmt = con.createStatement();
			             ResultSet rs = stmt.executeQuery(sql)) {

			            while (rs.next()) {
			                map.put(rs.getString("status"), rs.getInt(2));
			            }

			        } catch (Exception e) {
			            e.printStackTrace();
			        }

			        return map;
			    }

			    // Helper: Map ResultSet to Event
			    public static Event mapEvent(ResultSet rs) throws SQLException {
			        return new Event(
			            rs.getInt("id"),
			            rs.getString("fullName"),
			            rs.getString("email"),
			            rs.getString("phone"),
			            rs.getString("eventDate"),
			            rs.getString("eventTitle"),
			            rs.getString("eventType"),
			            rs.getString("venue"),
			            rs.getDouble("budget"),
			            rs.getInt("guestCount"),
			            rs.getString("requirements")
			        );
			    }
			    
			 // Total Events Per Month (for bar chart)
			    public static Map<String, Integer> getMonthlyEventCounts() {
			        Map<String, Integer> map = new HashMap<>();
			        String sql = "SELECT MONTHNAME(STR_TO_DATE(eventDate, '%Y-%m-%d')) AS month, COUNT(*) AS count " +
			                     "FROM event GROUP BY month ORDER BY STR_TO_DATE(eventDate, '%Y-%m-%d')";

			        try (Connection con = DBConnection.getConnection();
			             Statement stmt = con.createStatement();
			             ResultSet rs = stmt.executeQuery(sql)) {

			            while (rs.next()) {
			                map.put(rs.getString("month"), rs.getInt("count"));
			            }

			        } catch (Exception e) {
			            e.printStackTrace();
			        }

			        return map;
			    }

			    
			 // Vendor Assignment Distribution (for donut chart)
			    public static Map<String, Integer> getVendorAssignmentCounts() {
			        Map<String, Integer> map = new HashMap<>();
			        String sql = "SELECT assignedVendor, COUNT(*) AS count FROM event GROUP BY assignedVendor";

			        try (Connection con = DBConnection.getConnection();
			             Statement stmt = con.createStatement();
			             ResultSet rs = stmt.executeQuery(sql)) {

			            while (rs.next()) {
			                String vendor = rs.getString("assignedVendor");
			                if (vendor == null || vendor.isEmpty()) {
			                    vendor = "Unassigned";
			                }
			                map.put(vendor, rs.getInt("count"));
			            }

			        } catch (Exception e) {
			            e.printStackTrace();
			        }

			        return map;
			    }

}
