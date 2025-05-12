package com.Eventura.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Eventura.model.Event;
import com.Eventura.services.EventService;


@WebServlet("/ViewEvent")
public class ViewEvent extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	    	String id = request.getParameter("id");
		    String fullName = request.getParameter("full_name");
	        String email = request.getParameter("email");
	        String phone = request.getParameter("phone");
	        String eventDate = request.getParameter("event_date");
	        String eventTitle = request.getParameter("event_title");
	        String eventType = request.getParameter("event_type");
	        String venue = request.getParameter("venue");
	        double budget = 0;
	        int guestCount = 0;
	        try {
	            budget = Double.parseDouble(request.getParameter("budget"));
	            guestCount = Integer.parseInt(request.getParameter("guest_count"));
	        } catch (NumberFormatException e) {
	            e.printStackTrace(); // handle invalid numbers gracefully
	        }

	        String requirements = request.getParameter("requirements");
	        
	        boolean isSuccess = EventService.updatedata(requirements, fullName, email, phone, eventDate, eventTitle, eventType, venue, budget, guestCount, requirements);

	        if (isSuccess) {
	        	
	        	try {
					List<Event> eventdetails = EventService.getById(id);
					request.setAttribute("eventdetails", eventdetails);
					
					String alertmessage = "Event Request Submitted Successfully!";
		            response.getWriter().println("<script> alert('" + alertmessage + "'); window.location.href='GetAllEvent'; </script>");
					
					
					
					
				} catch (SQLException e) {

					e.printStackTrace();
				}
	            
	        } else {
	            request.setAttribute("error", "Event submission failed. Please try again.");
	            RequestDispatcher dis = request.getRequestDispatcher("addEvent.jsp");
	            dis.forward(request, response);
	        }
	    
	        
	        
	}

}
