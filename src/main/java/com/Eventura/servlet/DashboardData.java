package com.Eventura.servlet;


import java.io.IOException;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Eventura.services.EventService;

@WebServlet("/DashboardData")
public class DashboardData extends HttpServlet {
 
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Total event count
        int total = EventService.getTotalEventCount();
        Map<String, Integer> status = EventService.getEventStatusCounts();

        // Event count per month (for chart)
        Map<String, Integer> monthlyEvents = EventService.getMonthlyEventCounts();

        // Vendor assignment distribution (for chart)
        Map<String, Integer> vendorAssignments = EventService.getVendorAssignmentCounts();

        // Set attributes for JSP
        request.setAttribute("totalEvents", total);
        request.setAttribute("statusCounts", status);
        request.setAttribute("monthlyEvents", monthlyEvents);
        request.setAttribute("vendorAssignments", vendorAssignments);

        // Forward to dashboard
        RequestDispatcher dispatcher = request.getRequestDispatcher("test.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response); // fallback to GET
    }
}
