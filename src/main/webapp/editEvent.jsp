<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
  // Retrieve event ID from URL
  String eventId = request.getParameter("id");

  // Mock data — in real use, fetch from DB using JDBC
  String eventName = "Annual Gala";
  String eventDate = "2025-05-01";
  String venue = "Grand Hall";
  String description = "Annual corporate celebration event.";
  String status = "Pending"; // or "Approved", "Rejected"
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Edit Event</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</head>
<body class="bg-gray-100 min-h-screen">

  <div class="max-w-4xl mx-auto p-6">
    
    <!-- Page Header -->
    <div class="flex justify-between items-center mb-6">
      <h1 class="text-2xl font-bold text-gray-700">Edit Event</h1>
      <a href="eventmanagement.jsp" class="text-orange-600 hover:underline">
        <i class="fas fa-arrow-left mr-1"></i> Back to Event Management
      </a>
    </div>

    <!-- Edit Form -->
    <form action="update-event.jsp" method="post" class="bg-white p-6 rounded shadow space-y-6">
      <input type="hidden" name="eventId" value="<%= eventId %>" />

      <div>
        <label class="block mb-1 text-gray-600 font-medium">Event Name</label>
        <input type="text" name="eventName" value="<%= eventName %>" required
               class="w-full px-4 py-2 border rounded focus:ring-2 focus:ring-orange-500" />
      </div>

      <div>
        <label class="block mb-1 text-gray-600 font-medium">Event Date</label>
        <input type="date" name="eventDate" value="<%= eventDate %>" required
               class="w-full px-4 py-2 border rounded focus:ring-2 focus:ring-orange-500" />
      </div>

      <div>
        <label class="block mb-1 text-gray-600 font-medium">Venue</label>
        <select name="venue" class="w-full px-4 py-2 border rounded bg-white focus:ring-2 focus:ring-orange-500">
          <option value="Grand Hall" <%= venue.equals("Grand Hall") ? "selected" : "" %>>Grand Hall</option>
          <option value="Oceanview Resort" <%= venue.equals("Oceanview Resort") ? "selected" : "" %>>Oceanview Resort</option>
          <option value="City Convention Center" <%= venue.equals("City Convention Center") ? "selected" : "" %>>City Convention Center</option>
          <option value="Garden Plaza" <%= venue.equals("Garden Plaza") ? "selected" : "" %>>Garden Plaza</option>
        </select>
      </div>

      <div>
        <label class="block mb-1 text-gray-600 font-medium">Description</label>
        <textarea name="description" rows="4" class="w-full px-4 py-2 border rounded focus:ring-2 focus:ring-orange-500"><%= description %></textarea>
      </div>

      <div>
        <label class="block mb-1 text-gray-600 font-medium">Status</label>
        <select name="status" class="w-full px-4 py-2 border rounded bg-white focus:ring-2 focus:ring-orange-500">
          <option value="Pending" <%= status.equals("Pending") ? "selected" : "" %>>Pending</option>
          <option value="Approved" <%= status.equals("Approved") ? "selected" : "" %>>Approved</option>
          <option value="Rejected" <%= status.equals("Rejected") ? "selected" : "" %>>Rejected</option>
        </select>
      </div>

      <div class="flex justify-end">
        <button type="submit" class="bg-orange-500 text-white px-6 py-2 rounded hover:bg-orange-600">
          <i class="fas fa-save mr-2"></i>Update Event
        </button>
      </div>
    </form>
  </div>

</body>
</html>
