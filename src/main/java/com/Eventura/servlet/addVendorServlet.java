package com.Eventura.servlet;

import com.Eventura.services.VendorService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/addVendorServlet")
public class addVendorServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     
    	String name = request.getParameter("name");
    	String nic = request.getParameter("nic");
    	String email = request.getParameter("email");
    	String phone = request.getParameter("phone");
    	String service = request.getParameter("service");
    	String password = request.getParameter("password");
    	
    	
    	boolean isTrue;
    	
    	isTrue = VendorService.insertdata(name, nic, email, phone, service, password);
    	
    	if(isTrue == true) {
    		String alertmessage = "Data Insert Successfilly";
    		response.getWriter().println("<script> alert('"+alertmessage+"'); window.location.href='GetAllVendors' </script>");
  
    	} else {
    		RequestDispatcher dis2 = request.getRequestDispatcher("addVendor.jsp");
    		dis2.forward(request, response);
    		
    	}
    	
}
}