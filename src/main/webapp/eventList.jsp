<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.Eventura.model.Event" %>
<%@ page import="com.Eventura.services.EventService" %>
<%@ page import="com.Eventura.services.VendorService" %>
<%@ page import="com.Eventura.model.Vendor" %>

<%
    List<Event> events = EventService.getAllEvents();
    List<Vendor> vendors = VendorService.getAllVendors();
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Assign Vendors</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</head>
<body class="bg-gray-100 flex h-screen">

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
        <li class="px-6 py-3 hover:bg-orange-100">
          <a href="GetAllEvent" class="flex items-center text-gray-800">
            <i class="fas fa-tasks mr-2"></i> Manage Events
          </a>
        </li>
        <li class="px-6 py-3 bg-orange-100 font-semibold">
          <a href="#" class="flex items-center text-gray-800">
            <i class="fas fa-user-plus mr-2"></i> Assign Vendors
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
  <div class="flex-1 overflow-auto pl-64">

    <!-- Top Bar -->
    <div class="fixed top-0 left-64 right-0 z-10">
      <jsp:include page="header.jsp" />
    </div>

    <main class="pt-24 px-6 pb-10">
      <div class="bg-white p-6 rounded shadow">
        <h2 class="text-2xl font-bold mb-4 text-orange-600">Assign Vendors</h2>
        <div class="overflow-x-auto">
          <table class="min-w-full border border-gray-200 text-sm">
            <thead class="bg-orange-100 text-gray-800">
              <tr>
                <th class="py-2 px-4">Event ID</th>
                <th class="py-2 px-4">Title</th>
                <th class="py-2 px-4">Client Name</th>
                <th class="py-2 px-4">Date</th>
                <th class="py-2 px-4">Assign Vendor</th>
              </tr>
            </thead>
            <tbody>
              <%
                for (Event e : events) {
              %>
              <tr class="border-t hover:bg-gray-50">
                <td class="py-2 px-4"><%= e.getEventId() %></td>
                <td class="py-2 px-4"><%= e.getEvent_title() %></td>
                <td class="py-2 px-4"><%= e.getFull_name() %></td>
                <td class="py-2 px-4"><%= e.getEvent_date() %></td>
                <td class="py-2 px-4">
                  <form action="AssignVendorServlet" method="post" class="flex items-center gap-2">
                    <input type="hidden" name="eventId" value="<%= e.getEventId() %>" />
                    <select name="vendorId" required class="border border-gray-300 rounded px-2 py-1 text-sm">
                      <option disabled selected>Select Vendor</option>
                      <% for (Vendor v : vendors) { %>
                        <option value="<%= v.getVendorId() %>">
                          <%= v.getName() %> - <%= v.getService() %>
                        </option>
                      <% } %>
                    </select>
                    <button type="submit" class="bg-blue-500 hover:bg-blue-600 text-white px-3 py-1 rounded text-sm">
                      Assign
                    </button>
                  </form>
                </td>
              </tr>
              <% } %>
            </tbody>
          </table>
        </div>
      </div>
    </main>

  </div>

</body>
</html>
