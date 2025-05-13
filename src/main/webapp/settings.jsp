<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.Eventura.model.EventPlanner" %>
<%
    if (session.getAttribute("eventplanner") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Profile Settings</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</head>
<body class="bg-gray-100 min-h-screen flex text-gray-800">

<!-- Sidebar -->
<aside class="w-64 bg-white shadow-md flex-shrink-0">
  <div class="p-6 text-xl font-bold text-orange-600">Event Planner</div>
  <nav class="mt-8">
    <ul>
      <li class="px-6 py-3 hover:bg-orange-100">
        <a href="EventDashboardServlet" class="flex items-center"><i class="fas fa-calendar-alt mr-2"></i> Dashboard</a>
      </li>
      <li class="px-6 py-3 hover:bg-orange-100">
        <a href="GetAllEvent" class="flex items-center"><i class="fas fa-tasks mr-2"></i> Manage Events</a>
      </li>
      <li class="px-6 py-3 hover:bg-orange-100">
        <a href="GetAllVendors" class="flex items-center"><i class="fas fa-truck mr-2"></i> Manage Vendors</a>
      </li>
      <li class="px-6 py-3 bg-orange-100 font-semibold">
        <a href="setting.jsp" class="flex items-center"><i class="fas fa-user-cog mr-2"></i> Profile Settings</a>
      </li>
    </ul>
  </nav>
</aside>

<!-- Main Content -->
<div class="flex-1 flex flex-col">

  <!-- Top Header -->
  <jsp:include page="header.jsp" />

  <!-- Main Body -->
  <main class="p-6 flex-grow bg-gray-50">
    <div class="max-w-3xl mx-auto bg-white p-8 rounded-lg shadow-md transition-transform hover:shadow-lg hover:-translate-y-1 duration-300 ease-in-out">

      <!-- Avatar and Name -->
      <div class="text-center relative group">
        <div title="${eventplanner.name}" class="w-24 h-24 mx-auto rounded-full bg-orange-100 text-orange-600 text-3xl font-bold flex items-center justify-center shadow-inner transition transform group-hover:scale-105">
          ${eventplanner.name.substring(0, 1)}
        </div>
        <h2 class="text-2xl font-bold mt-4">${eventplanner.name}</h2>
        <p class="text-sm text-gray-500 mt-1">Planner ID: ${eventplanner.id}</p>
      </div>

      <!-- Profile Details -->
      <div class="mt-10">
        <h3 class="text-lg font-semibold mb-4 text-gray-700 border-b pb-2">Your Information</h3>
        <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
          <div>
            <label class="block text-sm font-medium text-gray-600">NIC</label>
            <div class="mt-1 px-4 py-2 bg-gray-100 border rounded text-gray-900">${eventplanner.nic}</div>
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-600">Email</label>
            <div class="mt-1 px-4 py-2 bg-gray-100 border rounded text-gray-900">${eventplanner.email}</div>
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-600">Phone</label>
            <div class="mt-1 px-4 py-2 bg-gray-100 border rounded text-gray-900">${eventplanner.phone}</div>
          </div>
        </div>
      </div>

      <!-- Actions -->
      <div class="mt-8 flex flex-col sm:flex-row justify-between items-center gap-4 border-t pt-6">
        <a href="updateProfile.jsp?id=${eventplanner.id}&name=${eventplanner.name}&nic=${eventplanner.nic}&email=${eventplanner.email}&phone=${eventplanner.phone}&password=${eventplanner.password}">
          <button class="bg-orange-500 hover:bg-orange-600 text-white font-semibold px-5 py-2 rounded-md shadow-sm flex items-center">
            <i class="fas fa-edit mr-2"></i> Update Profile
          </button>
        </a>

        <!-- Delete confirmation form -->
        <form action="deleteProfile" method="post" onsubmit="return confirmDelete();" class="w-full sm:w-auto">
          <input type="hidden" name="id" value="${eventplanner.id}" />
          <button type="submit" class="bg-red-500 hover:bg-red-600 text-white font-semibold px-5 py-2 rounded-md shadow-sm flex items-center">
            <i class="fas fa-trash-alt mr-2"></i> Delete Profile
          </button>
        </form>
      </div>

    </div>
  </main>

</div>

<!-- Confirmation Script -->
<script>
function confirmDelete() {
  return confirm("Are you sure you want to delete your profile? This action cannot be undone.");
}
</script>

</body>
</html>
