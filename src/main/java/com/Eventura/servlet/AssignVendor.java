package com.Eventura.servlet;

import com.Eventura.services.AssignmentService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/AssignVendor")
public class AssignVendor extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int eventId = Integer.parseInt(request.getParameter("eventId"));
            String[] vendorIds = request.getParameterValues("vendorIds");

            if (vendorIds != null && vendorIds.length > 0) {
                for (String vendorIdStr : vendorIds) {
                    int vendorId = Integer.parseInt(vendorIdStr);
                    AssignmentService.assignVendorToEvent(eventId, vendorId);
                }
                request.getSession().setAttribute("message", "Vendor(s) assigned successfully!");
            } else {
                request.getSession().setAttribute("error", "Please select at least one vendor.");
            }
        } catch (Exception e) {
            request.getSession().setAttribute("error", "Assignment failed: " + e.getMessage());
        }

        response.sendRedirect("GetAllEvent");
    }
}
