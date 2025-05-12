package com.Eventura.servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;

@WebServlet("/CreateEventServlet")
public class CreateEventServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("eventName");
        String date = request.getParameter("eventDate");
        String location = request.getParameter("location");
        String description = request.getParameter("description");
        String status = request.getParameter("status");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/yourdbname", "root", "yourpassword");
            PreparedStatement ps = conn.prepareStatement("INSERT INTO events (name, date, location, description, status) VALUES (?, ?, ?, ?, ?)");
            ps.setString(1, name);
            ps.setString(2, date);
            ps.setString(3, location);
            ps.setString(4, description);
            ps.setString(5, status);
            ps.executeUpdate();

            response.sendRedirect("manageEvent.jsp"); // or dashboard
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
