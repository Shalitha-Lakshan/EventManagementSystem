package com.Eventura.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Eventura.model.EventPlanner;
import com.Eventura.services.EventPlannerService;

@WebServlet("/updateProfile")
public class updateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
    	String nic = request.getParameter("nic");
    	String email = request.getParameter("email");
    	String phone = request.getParameter("phone");
    	String password = request.getParameter("password");
    	
    	boolean isTrue;
    	isTrue = EventPlannerService.updateprofile(id, name, nic, email, phone, password);
    	

    	if(isTrue == true) {
    		
    		
			try {
				List <EventPlanner> eventplannerdetails = EventPlannerService.getById(id);
				request.setAttribute("eventplannerdetails", eventplannerdetails);
				

	    		String alertmessage = "Data Update Successfilly";
	    		response.getWriter().println("<script> alert('"+alertmessage+"');window.location.href='ProfileServlet' </script>");
	  
	    		
			} catch (Exception e) {
				
				e.printStackTrace();
			}
    		
    		
    	} else {
    		RequestDispatcher dis2 = request.getRequestDispatcher("addVendor.jsp");
    		dis2.forward(request, response);
    		
    	}
		
	}

}
