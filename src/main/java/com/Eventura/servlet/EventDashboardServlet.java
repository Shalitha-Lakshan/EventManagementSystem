package com.Eventura.servlet;

import java.io.IOException;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Eventura.model.Event;
import com.Eventura.services.EventService;

@WebServlet("/EventDashboardServlet")
public class EventDashboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Event> allEvents = EventService.getAllEvents();

        int totalEvents = allEvents.size();
        int upcomingEvents = 0;
        Map<String, Integer> venueFrequency = new HashMap<>();
        Map<Integer, Boolean> vendorSet = new HashMap<>();

        LocalDate today = LocalDate.now();

        for (Event event : allEvents) {
            try {
                // ✅ Fix 1: use correct field name
                LocalDate eventDate = LocalDate.parse(event.getEvent_date());
                if (!eventDate.isBefore(today)) {
                    upcomingEvents++;
                }
            } catch (Exception e) {
                e.printStackTrace(); // Optional: log with a logger
            }

            // ✅ Venue name frequency
            String venue = event.getVenue();
            if (venue != null && !venue.trim().isEmpty()) {
                venueFrequency.put(venue, venueFrequency.getOrDefault(venue, 0) + 1);
            }

            // ✅ Track vendor IDs or names if they exist
            if (event.getVendorId() > 0) {
                vendorSet.put(event.getVendorId(), true);
            }
        }

        int vendorCount = vendorSet.size();

        // ✅ Most active venue logic
        String mostActiveVenue = "";
        int maxCount = 0;
        for (Map.Entry<String, Integer> entry : venueFrequency.entrySet()) {
            if (entry.getValue() > maxCount) {
                maxCount = entry.getValue();
                mostActiveVenue = entry.getKey();
            }
        }

        // ✅ Debug logs (optional)
        System.out.println("Total Events: " + totalEvents);
        System.out.println("Upcoming Events: " + upcomingEvents);
        System.out.println("Vendor Count: " + vendorCount);
        System.out.println("Most Active Venue: " + mostActiveVenue);

        // ✅ Set attributes to forward to JSP
        request.setAttribute("totalEvents", totalEvents);
        request.setAttribute("upcomingEvents", upcomingEvents);
        request.setAttribute("vendorCount", vendorCount);
        request.setAttribute("mostActiveVenue", mostActiveVenue);

        // ✅ Forward to dashboard JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("eventPlannerDashboard.jsp");
        dispatcher.forward(request, response);
    }
}
