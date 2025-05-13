package com.Eventura.servlet;



import com.Eventura.services.EventService;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/AssignVendorServlet")
public class AssignVendorServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1876295257486669092L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    response.sendRedirect("eventList.jsp"); 
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int eventId = Integer.parseInt(request.getParameter("eventId"));
        int vendorId = Integer.parseInt(request.getParameter("vendorId"));

        EventService service = new EventService();
        boolean result = service.assignVendorToEvent(eventId, vendorId);

        if (result) {
            response.getWriter().println("<script>alert('Vendor assigned successfully!'); window.location='GetAllEvent';</script>");
        } else {
            response.getWriter().println("<script>alert('Failed to assign!'); window.location='assignVendor.jsp';</script>");
        }
    }
}