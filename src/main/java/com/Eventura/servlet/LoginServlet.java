package com.Eventura.servlet;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.Eventura.model.EventPlanner;
import com.Eventura.services.EventPlannerService;

import java.io.IOException;
import java.util.List;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
private static final long serialVersionUID = 1L;

protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
   

}

protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	String email = request.getParameter("email");
	String password = request.getParameter("password");
	
	try {
		
		List<EventPlanner> eLogin = EventPlannerService.loginvalidate(email, password);
		if(eLogin != null && !eLogin.isEmpty()) {
			
			request.getSession().setAttribute("eventplanner", eLogin.get(0));
			response.sendRedirect("eventPlannerDashboard.jsp");
    		
		} else {
			
			String alertmessage = "Invalid Credentials, please try again!";
    		response.getWriter().println("<script> alert('"+alertmessage+"'); window.location.href='login.jsp' </script>");
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}

}

}
