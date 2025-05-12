package com.Eventura.servlet;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.Eventura.services.EventPlannerService;
import java.io.IOException;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	
	

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    	String name = request.getParameter("name");
    	String nic = request.getParameter("nic");
    	String email = request.getParameter("email");
    	String phone = request.getParameter("phone");
    	String password = request.getParameter("password");
    	
	boolean isTrue;
    	
    	isTrue = EventPlannerService.insertdata(name, nic, email, phone, password);
    	
    	if(isTrue == true) {
    		String alertmessage = "Registered Successfilly";
    		response.getWriter().println("<script> alert('"+alertmessage+"'); window.location.href='login.jsp' </script>");
  
    	} else {
    		RequestDispatcher dis2 = request.getRequestDispatcher("Registration.jsp");
    		dis2.forward(request, response);
    		
    	}
    	
      
    }
}
