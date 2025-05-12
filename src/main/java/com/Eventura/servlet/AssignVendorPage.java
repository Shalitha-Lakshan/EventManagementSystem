package com.Eventura.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Eventura.utils.DBConnection;

@WebServlet("/AssignVendorPage")
public class AssignVendorPage extends HttpServlet {

    private static final long serialVersionUID = 1L;

		protected void doPost(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {

            String eventIdStr = request.getParameter("eventId");
            String vendorIdStr = request.getParameter("vendorId");

            try {
                int eventId = Integer.parseInt(eventIdStr);
                int vendorId = Integer.parseInt(vendorIdStr);

                Connection con = DBConnection.getConnection();
                String sql = "INSERT INTO event_vendor (event_id, vendor_id) VALUES (?, ?)";
                PreparedStatement stmt = con.prepareStatement(sql);
                stmt.setInt(1, eventId);
                stmt.setInt(2, vendorId);

                int rows = stmt.executeUpdate();
                if (rows > 0) {
                    request.getSession().setAttribute("message", "Vendor assigned successfully!");
                } else {
                    request.getSession().setAttribute("error", "Assignment failed.");
                }

            } catch (Exception e) {
                request.getSession().setAttribute("error", "Exception: " + e.getMessage());
            }

            response.sendRedirect("GetAllEvent");
        }
    }


