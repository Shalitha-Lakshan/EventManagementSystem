package com.Eventura.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.Eventura.model.EventPlanner;

@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Handles GET requests
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    // Handles POST requests
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    // Core logic for both GET/POST
    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false); // Don't create a new session

        if (session != null) {
            EventPlanner eventplanner = (EventPlanner) session.getAttribute("eventplanner");

            if (eventplanner != null) {
                request.setAttribute("eventplanner", eventplanner);
                request.getRequestDispatcher("userProfile.jsp").forward(request, response);
            } else {
                // session exists but user not logged in
                response.sendRedirect("login.jsp");
            }
        } else {
            // no session at all
            response.sendRedirect("login.jsp");
        }
    }
}
