package com.Eventura.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
			public static boolean insertdata (String full_name,String email, String phone, String event_date, String event_title, String event_type
					,String venue,double budget,int guest_count,String requirements) {
			
			isSuccess = false;
			try {
				
				con = DBConnection.getConnection();
				stmt = con.createStatement();
				
			String sql = "insert into event values(0,'"+full_name+"','"+email+"','"+phone+"','"+event_date+"','"+event_title+"','"+event_type+"','"+venue+"','"+budget+"','"+guest_count+"','"+requirements+"')";
			
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
				
			
				String sql = "select * from event where eventId = '"+convertedID+"'";
				
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
					
					  int eventId = rs.getInt(1);
					  String full_name = rs.getString(2);
				        String email =  rs.getString(3);
				        String phone =  rs.getString(4);
				        String event_date =  rs.getString(5);
				        String event_title =  rs.getString(6);
				        String event_type =  rs.getString(7);
				        String venue =  rs.getString(8);
				        Double budget = rs.getDouble(9);
				        int guest_count = rs.getInt(10);
				        String requirements = rs.getString(11);
				        int vendorId =rs.getInt(12);
					
					Event eve = new Event(eventId,full_name,email,phone,event_date,event_title,event_type,venue,
							budget,guest_count,requirements,vendorId);
					
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

							  int eventId = rs.getInt(1);
							  String full_name = rs.getString(2);
						        String email =  rs.getString(3);
						        String phone =  rs.getString(4);
						        String event_date =  rs.getString(5);
						        String event_title =  rs.getString(6);
						        String event_type =  rs.getString(7);
						        String venue =  rs.getString(8);
						        Double budget = rs.getDouble(9);
						        int guest_count = rs.getInt(10);
						        String requirements = rs.getString(11);
						        int vendorId =rs.getInt(12);
							
						        Event eve = new Event(eventId,full_name,email,phone,event_date,event_title,event_type,venue,
										budget,guest_count,requirements,vendorId);
								
								event.add(eve);
						}
					}
					
					catch(Exception e){
						e.printStackTrace();
					}
						return event ;
					
				}
				
				//Update deta
				public static boolean updatedata(String eventId,String full_name,String email, String phone, String event_date, String event_title, String event_type
						,String venue,double budget,int guest_count,String requirements ) {
					
					try {
						
						//DBConnection
						con = DBConnection.getConnection();
						stmt = con.createStatement();
						
						//SQL Query
						String sql = "update event set full_name='"+full_name+"',email='"+email+"',phone='"+phone+"',event_date='"+event_date+"',event_title='"+event_title+"'"
								+ ",event_type='"+event_type+"',venue='"+venue+"',budget='"+budget+"',guest_count='"+guest_count+"',requirements='"+requirements+"'"
								+"where eventId = '"+eventId+"'";
						
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
				public static boolean deletedata(String eventId) {
					int convID = Integer.parseInt(eventId);
					
					try {

						//DBConnection
					con = DBConnection.getConnection();
					stmt = con.createStatement();
					
					String sql = "delete from event where eventId = '"+convID+"'";
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
			    public boolean assignVendorToEvent(int eventId, int vendorId) {
			        boolean result = false;
			        try (Connection conn = DBConnection.getConnection()) {
			            String sql = "UPDATE event SET vendorId = ? WHERE eventId = ?";
			            PreparedStatement stmt = conn.prepareStatement(sql);
			            stmt.setInt(1, vendorId);
			            stmt.setInt(2, eventId);
			 
			            int rowsUpdated = stmt.executeUpdate();
			            result = rowsUpdated > 0;
			        } catch (Exception e) {
			            e.printStackTrace();
			        }
			        return result;
			    }
			 
			 
			    public List<Event> getEventsByVendorId(int vendorId) {
			        List<Event> eventList = new ArrayList<>();
			        try (Connection conn = DBConnection.getConnection()) {
			            String sql = "SELECT * FROM events WHERE vendorId = ?";
			            PreparedStatement stmt = conn.prepareStatement(sql);
			            stmt.setInt(1, vendorId);
			            ResultSet rs = stmt.executeQuery();
			 
			            while (rs.next()) {
			                Event event = new Event();
			                event.setEventId(rs.getInt("eventId"));
			                event.setFull_name(rs.getString("full_name"));
			                event.setEmail(rs.getString("email"));
			                event.setPhone(rs.getString("phone"));
			                event.setEvent_date(rs.getString("event_date"));
			                event.setEvent_title(rs.getString("event_title"));
			                event.setEvent_type(rs.getString("event_type"));
			                event.setVenue(rs.getString("venue"));
			                event.setBudget(rs.getDouble("budget"));
			                event.setGuest_count(rs.getInt("guest_count"));
			                event.setRequirements(rs.getString("requirements"));
			                event.setVendorId(rs.getInt("vendorId"));
			                eventList.add(event);
			            }
			        } catch (Exception e) {
			            e.printStackTrace();
			        }
			        return eventList;
			    }
		
			    
			
}
