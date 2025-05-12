package com.Eventura.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.Eventura.model.Event;
import com.Eventura.model.Vendor;
import com.Eventura.services.EventService;
import com.Eventura.services.VendorService;

@WebServlet("/GetAllEvent")
public class GetAllEvent extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Fetch all events
        List<Event> allEvents = EventService.getAllEvents();
        request.setAttribute("allEvents", allEvents);

        // Fetch vendor assignments mapped by event ID
        Map<Integer, List<Vendor>> vendorMap = new VendorService().getVendorsGroupedByEvent();
        request.setAttribute("vendorMap", vendorMap);

        // Forward to JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("manageEvent.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
