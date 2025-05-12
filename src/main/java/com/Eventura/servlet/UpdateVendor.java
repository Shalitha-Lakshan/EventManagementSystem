package com.Eventura.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Eventura.model.Vendor;
import com.Eventura.services.VendorService;


@WebServlet("/UpdateVendor")
public class UpdateVendor extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	

		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			String id = request.getParameter("id");
			String name = request.getParameter("name");
	    	String nic = request.getParameter("nic");
	    	String email = request.getParameter("email");
	    	String phone = request.getParameter("phone");
	    	String service = request.getParameter("service");
	    	String password = request.getParameter("password");
	    	
	    	boolean isTrue;
	    	isTrue = VendorService.updatedata(id, name, nic, email, phone, service, password);
	    	

	    	if(isTrue == true) {
	    		
	    		
				try {
					List <Vendor> vendordetails = VendorService.getById(id);
					request.setAttribute("vendordetails", vendordetails);
					

		    		String alertmessage = "Data Update Successfilly";
		    		response.getWriter().println("<script> alert('"+alertmessage+"');window.location.href='GetAllVendors' </script>");
		  
		    		
				} catch (Exception e) {
					
					e.printStackTrace();
				}
	    		
	    		
	    	} else {
	    		RequestDispatcher dis2 = request.getRequestDispatcher("addVendor.jsp");
	    		dis2.forward(request, response);
	    		
	    	}
			
	}

}
