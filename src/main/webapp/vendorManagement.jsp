<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.Eventura.model.Vendor" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
          <div class="flex gap-2">
          
            <a href="addVendor.jsp" class="bg-orange-500 text-white px-4 py-2 rounded hover:bg-orange-600">
              <i class="fas fa-plus mr-2"></i> Add Vendor
            </a>
          </div>
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
              </tr>
            </thead>
            <c:forEach var="vendor" items="${allVendors}">
            <tr>
            
            	<td>${vendor.id}</td>
            	<td>${vendor.name}</td>
            	<td>${vendor.nic}</td>
            	<td>${vendor.email}</td>
            	<td>${vendor.phone}</td>
            	<td>${vendor.service}</td>
       
            </tr>
           </c:forEach>
          </table>
        </div>
      </section>

    </main>
  </div>

</body>
</html>
