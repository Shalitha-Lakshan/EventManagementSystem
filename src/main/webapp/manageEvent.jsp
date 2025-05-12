<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.Eventura.model.EventPlanner" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Event Management</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</head>
<body class="bg-gray-100 h-screen flex">

  <!-- Sidebar -->
  <aside class="w-64 bg-white shadow-lg flex-shrink-0 h-full fixed top-0 left-0 bottom-0 z-20">
    <div class="p-6 text-xl font-bold text-orange-600">Event Planner</div>
    <nav class="mt-8">
      <ul>
        <li class="px-6 py-3 hover:bg-orange-100">
          <a href="eventPlannerDashboard.jsp" class="flex items-center text-gray-800">
            <i class="fas fa-calendar-alt mr-2"></i> Dashboard
          </a>
        </li>
        <li class="px-6 py-3 bg-orange-100 font-semibold">
          <a href="GetAllEvent" class="flex items-center text-gray-800">
            <i class="fas fa-tasks mr-2"></i> Manage Events
          </a>
        </li>
        <li class="px-6 py-3 hover:bg-orange-100">
          <a href="GetAllVendors" class="flex items-center text-gray-800">
            <i class="fas fa-truck mr-2"></i> Manage Vendors
          </a>
        </li>
        <li class="px-6 py-3 hover:bg-orange-100">
          <a href="settings.jsp" class="flex items-center text-gray-800">
            <i class="fas fa-cogs mr-2"></i> Settings
          </a>
        </li>
      </ul>
    </nav>
  </aside>

  <!-- Main Content -->
  <div class="flex-1 overflow-auto pl-64 pt-24 px-8 pb-10">

    <!-- Top Bar -->
    <div class="fixed top-0 left-64 right-0 z-10">
      <jsp:include page="header.jsp" />
    </div>

    <!-- Page Header -->
    <div class="flex justify-between items-center mb-6">
      <h2 class="text-2xl font-bold text-gray-700">All Events</h2>
      <a href="addEvent.jsp" class="bg-orange-500 text-white px-4 py-2 rounded hover:bg-orange-600">
        <i class="fas fa-plus mr-2"></i>Create New Event
      </a>
    </div>

    <!-- Event Table -->
    <div class="bg-white p-6 rounded shadow">
      <div class="overflow-x-auto">
        <table class="min-w-full text-sm text-left border rounded">
          <thead class="bg-orange-100">
            <tr>
              <th class="py-2 px-4">ID</th>
              <th class="py-2 px-4">Event Name</th>
              <th class="py-2 px-4">Date</th>
              <th class="py-2 px-4">Phone</th>
              <th class="py-2 px-4">Event Type</th>
              <th class="py-2 px-4">Guest Count</th>
              <th class="py-2 px-4">Budget</th>
              <th class="py-2 px-4">Action</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="event" items="${allEvents}">
              <tr class="border-b hover:bg-gray-50">
                <td class="py-2 px-4">${event.id}</td>
                <td class="py-2 px-4">${event.fullName}</td>
                <td class="py-2 px-4">${event.eventDate}</td>
                <td class="py-2 px-4">${event.phone}</td>
                <td class="py-2 px-4">${event.eventType}</td>
                <td class="py-2 px-4">${event.guestCount}</td>
                <td class="py-2 px-4">${event.budget}</td>
                <td class="py-2 px-4 flex gap-2">
                
		                
  			  <td class="py-2 px-4 flex gap-2">
		  	<a href="viewEvent.jsp?id=${event.id}
		      &full_name=${event.fullName}
		      &email=${event.email}
		      &phone=${event.phone}
		      &event_date=${event.eventDate}
		      &event_title=${event.eventTitle}
		      &event_type=${event.eventType}
		      &venue=${event.venue}
		      &guest_count=${event.guestCount}
		      &budget=${event.budget}
		      &requirements=${event.requirements}" class="inline-block">
		    <button class="bg-orange-500 hover:bg-orange-600 text-white font-semibold py-1 px-3 rounded">
		      View
		    </button>
		  </a>
		
		  <form action="DeleteEvent" method="post" onsubmit="return confirm('Are you sure you want to delete this event?');" class="inline-block">
		    <input type="hidden" name="id" value="${event.id}" />
		    <button type="submit" class="bg-red-500 hover:bg-red-600 text-white font-semibold py-1 px-3 rounded">
		      Delete
		    </button>
		  </form>
		
		  <a href="assignVendor.jsp?event_id=${event.id}" class="inline-block">
		    <button type="button" class="bg-blue-500 hover:bg-blue-600 text-white font-semibold py-1 px-3 rounded">
		      Assign Vendor
		    </button>
		  </a>
</td>


                 
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </div>
  </div>

</body>
</html>
