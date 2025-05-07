
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.Eventura.model.Vendor" %>

<%
    List<Vendor> vendorList = (List<Vendor>) request.getAttribute("vendorList");
%>

<!DOCTYPE html>

<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Manage Vendors</title>
  <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="flex bg-gray-100 min-h-screen">

  <!-- Sidebar -->
  <aside class="w-64 bg-white shadow-lg">
    <div class="p-6 text-xl font-bold text-orange-600">Event Planner</div>
    <nav class="mt-8">
      <ul>
        <li class="px-6 py-3 hover:bg-orange-100">
          <a href="eventPlannerDashboard.jsp" class="flex items-center text-gray-800">
            <i class="fas fa-calendar-alt mr-2"></i> Dashboard
          </a>
        </li>
        <li class="px-6 py-3 hover:bg-orange-100">
          <a href="manageEvent.jsp" class="flex items-center text-gray-800">
            <i class="fas fa-tasks mr-2"></i> Manage Events
          </a>
        </li>
        <li class="px-6 py-3 bg-orange-100 font-semibold">
          <a href="vendorManagement.jsp" class="flex items-center text-gray-800">
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
  <div class="flex-1 flex flex-col">

    <!-- Top Bar -->
    <header class="bg-white shadow p-4 flex justify-between items-center">
      <h1 class="text-2xl font-semibold text-gray-700">Vendors</h1>
      <div class="flex items-center gap-4">
        <div class="flex items-center gap-2">
          <img src="https://i.pravatar.cc/40" alt="Admin Profile" class="w-8 h-8 rounded-full border border-gray-300">
          <span class="text-sm text-gray-600">Admin: JohnDoe</span>
        </div>
        <button class="bg-red-500 text-white px-3 py-1 rounded hover:bg-red-600">
          <i class="fas fa-sign-out-alt"></i> Logout
        </button>
      </div>
    </header>

    <!-- Main Section -->
    <main class="p-6 flex flex-col lg:flex-row gap-6">

      <!-- Vendor Table -->
      <section class="flex-1">
        <div class="flex justify-between items-center mb-4">
          <h2 class="text-xl font-bold text-gray-700">Manage Vendors</h2>
          <a href="addVendor.jsp" class="bg-orange-500 text-white px-4 py-2 rounded hover:bg-orange-600">
            <i class="fas fa-plus mr-2"></i> Add Vendor
          </a>
        </div>

        <div class="overflow-x-auto bg-white border rounded shadow">
          <table class="min-w-full text-sm text-left">
            <thead class="bg-orange-100">
              <tr>
                <th class="py-2 px-4">#</th>
                <th class="py-2 px-4">Vendor Name</th>
                <th class="py-2 px-4">NIC</th>
                <th class="py-2 px-4">Email</th>
                <th class="py-2 px-4">Phone</th>
                <th class="py-2 px-4">Service</th>
                <th class="py-2 px-4">Actions</th>
              </tr>
            </thead>
            <tbody class="text-gray-700">
              <%
                int count = 1;
                if (vendorList != null) {
                  for (Vendor v : vendorList) {
              %>
              <tr class="border-t">
                <td class="py-2 px-4"><%= count++ %></td>
                <td class="py-2 px-4"><%= v.getVendorName() %></td>
                <td class="py-2 px-4"><%= v.getNic() %></td>
                <td class="py-2 px-4"><%= v.getEmail() %></td>
                <td class="py-2 px-4"><%= v.getPhone() %></td>
                <td class="py-2 px-4"><%= v.getServiceType() %></td>
                <td class="py-2 px-4 space-x-2">
                  <button onclick="toggleModal()" class="text-green-500 hover:text-green-700"><i class="fas fa-link"></i> Assign</button>
                  <button class="text-blue-500 hover:text-blue-700"><i class="fas fa-edit"></i> Edit</button>
                  <button class="text-red-500 hover:text-red-700"><i class="fas fa-trash-alt"></i> Delete</button>
                </td>
              </tr>
              <% 
                  }
                } else {
              %>
              <tr><td colspan="7" class="py-4 px-4 text-center text-gray-500">No vendors found.</td></tr>
              <% } %>
            </tbody>
          </table>
        </div>
      </section>

      <!-- Vendor Status Panel -->
      <aside class="w-full lg:w-80 bg-white border rounded shadow p-4">
        <h2 class="text-lg font-bold text-gray-700 mb-3">Vendor Status</h2>
        <table class="w-full text-sm">
          <thead class="bg-orange-100">
            <tr>
              <th class="text-left px-3 py-2">Vendor</th>
              <th class="text-left px-3 py-2">Status</th>
            </tr>
          </thead>
          <tbody>
            <tr class="border-t">
              <td class="px-3 py-2">Elite Catering</td>
              <td class="px-3 py-2">
                <span class="bg-green-100 text-green-700 px-2 py-1 rounded-full text-xs">Active</span>
              </td>
            </tr>
            <tr class="border-t">
              <td class="px-3 py-2">SoundPro Ltd.</td>
              <td class="px-3 py-2">
                <span class="bg-red-100 text-red-700 px-2 py-1 rounded-full text-xs">Busy</span>
              </td>
            </tr>
            <tr class="border-t">
              <td class="px-3 py-2">Stage Crew</td>
              <td class="px-3 py-2">
                <span class="bg-green-100 text-green-700 px-2 py-1 rounded-full text-xs">Active</span>
              </td>
            </tr>
          </tbody>
        </table>
      </aside>

    </main>
  </div>

  <!-- Assign Modal -->
  <div id="assignModal" class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center hidden z-50">
    <div class="bg-white rounded-lg p-6 w-96 shadow-lg">
      <h3 class="text-lg font-semibold mb-4 text-gray-800">Assign Vendor to Event</h3>
      <label class="block text-sm text-gray-700 mb-1">Select Event</label>
      <select class="w-full border border-gray-300 rounded p-2 mb-4">
        <option>Annual Gala</option>
        <option>Wedding at Beach</option>
        <option>Product Launch</option>
      </select>
      <div class="flex justify-end space-x-2">
        <button onclick="toggleModal()" class="bg-gray-300 px-4 py-2 rounded hover:bg-gray-400">Cancel</button>
        <button class="bg-orange-500 text-white px-4 py-2 rounded hover:bg-orange-600">Assign</button>
      </div>
    </div>
  </div>

  <script>
    function toggleModal() {
      document.getElementById('assignModal').classList.toggle('hidden');
    }
  </script>

</body>
</html>

