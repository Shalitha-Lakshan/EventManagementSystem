package com.Eventura.servlet;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.Eventura.services.EventService;

@WebServlet("/addEventServlet")
public class addEventServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve form parameters
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

        // Call the EventService
        boolean isSuccess = EventService.insertdata(fullName, email, phone, eventDate, eventTitle, eventType, venue, budget, guestCount, requirements);

        if (isSuccess) {
            String alertmessage = "Event Request Submitted Successfully!";
            response.getWriter().println("<script> alert('" + alertmessage + "'); window.location.href='GetAllEvent'; </script>");
        } else {
            request.setAttribute("error", "Event submission failed. Please try again.");
            RequestDispatcher dis = request.getRequestDispatcher("addEvent.jsp");
            dis.forward(request, response);
        }
    }
}
