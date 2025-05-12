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

@WebServlet("/DeleteVendor")
public class DeleteVendor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		
		boolean isTrue;
		isTrue = VendorService.deletedata(id);
		
		if (isTrue == true) {
			
			String alertmessage = "Data Delete Successfilly";
    		response.getWriter().println("<script> alert('"+alertmessage+"');window.location.href='GetAllVendors' </script>");
			
		} else {
			
			try {
				List<Vendor> vendorDetails = VendorService.getById(id);
				request.setAttribute("vendorDetails", vendorDetails);
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("wrong.jsp");
				dispatcher.forward(request, response);
				
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
	
}
}