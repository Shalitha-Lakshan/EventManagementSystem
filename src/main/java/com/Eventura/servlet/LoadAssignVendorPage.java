package com.Eventura.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Eventura.services.VendorService;
import com.Eventura.model.Vendor;

@WebServlet("/LoadAssignVendorPage")
public class LoadAssignVendorPage extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String eventId = request.getParameter("event_id");

        if (eventId == null || eventId.isEmpty()) {
            response.sendRedirect("GetAllEvent");
            return;
        }

        List<Vendor> vendorList = VendorService.getAllVendor();

        request.setAttribute("vendorList", vendorList);
        request.setAttribute("event_id", eventId);

        RequestDispatcher dispatcher = request.getRequestDispatcher("assignVendor.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response); // Optional: support POST same as GET
    }
}
