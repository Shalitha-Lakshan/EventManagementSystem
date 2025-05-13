<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.Eventura.model.Vendor" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
  <title>Manage Vendors</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
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
        <a href="GetAllEvent" class="flex items-center text-gray-800">
          <i class="fas fa-tasks mr-2"></i> Manage Events
        </a>
      </li>
      <li class="px-6 py-3 bg-orange-100 font-semibold">
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
<div class="flex-1 flex flex-col">
  <jsp:include page="header.jsp" />

  <!-- Main Section -->
  <main class="p-6 space-y-6">
    
    <!-- Header -->
    <div class="flex flex-col md:flex-row justify-between items-center gap-4">
      <h2 class="text-2xl font-bold text-gray-800">Manage Vendors</h2>
      <div class="flex flex-col sm:flex-row items-center gap-4 w-full sm:w-auto">
        <input type="text" id="vendorSearch" placeholder="Search vendors..." class="w-full sm:w-64 border border-gray-300 px-4 py-2 rounded-md focus:outline-none focus:ring-2 focus:ring-orange-400" />
        <a href="addVendor.jsp" class="bg-orange-500 hover:bg-orange-600 text-white px-4 py-2 rounded-md shadow inline-flex items-center">
          <i class="fas fa-plus mr-2"></i> Add Vendor
        </a>
      </div>
    </div>

    <!-- Vendor Table -->
    <div class="overflow-auto rounded-lg shadow bg-white">
      <table class="min-w-full divide-y divide-gray-200 text-sm">
        <thead class="bg-orange-100 text-gray-700 text-left sticky top-0 z-10">
          <tr>
            <th class="px-6 py-3">ID</th>
            <th class="px-6 py-3">Vendor Name</th>
            <th class="px-6 py-3">NIC</th>
            <th class="px-6 py-3">Email</th>
            <th class="px-6 py-3">Phone</th>
            <th class="px-6 py-3">Service</th>
            <th class="px-6 py-3">Action</th>
          </tr>
        </thead>
        <tbody class="divide-y divide-gray-100">
          <c:forEach var="vendor" items="${allVendors}">
            <tr class="hover:bg-gray-50">
              <td class="px-6 py-3">${vendor.vendorId}</td>
              <td class="px-6 py-3">${vendor.name}</td>
              <td class="px-6 py-3">${vendor.nic}</td>
              <td class="px-6 py-3">${vendor.email}</td>
              <td class="px-6 py-3">${vendor.phone}</td>
              <td class="px-6 py-3">${vendor.service}</td>
              <td class="px-6 py-3">
                <div class="flex gap-2">
                  <a href="updateVendor.jsp?vendorId=${vendor.vendorId}&name=${vendor.name}&nic=${vendor.nic}&email=${vendor.email}&phone=${vendor.phone}&service=${vendor.service}&password=${vendor.password}">
                    <button class="bg-orange-500 hover:bg-orange-600 text-white font-medium px-3 py-1 rounded">Update</button>
                  </a>
                  <form action="DeleteVendor" method="post" onsubmit="return confirm('Are you sure you want to delete this vendor?');">
                    <input type="hidden" name="vendorId" value="${vendor.vendorId}">
                    <button type="submit" class="bg-red-500 hover:bg-red-600 text-white font-medium px-3 py-1 rounded">Delete</button>
                  </form>
                </div>
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
  </main>
</div>

<!-- Search Script -->
<script>
  function filterTable() {
    var input = document.getElementById("vendorSearch");
    var filter = input.value.toUpperCase();
    var table = document.querySelector("table");
    var tr = table.getElementsByTagName("tr");

    for (var i = 1; i < tr.length; i++) {
      var tds = tr[i].getElementsByTagName("td");
      var show = false;
      for (var j = 0; j < tds.length; j++) {
        var td = tds[j];
        if (td && td.textContent.toUpperCase().indexOf(filter) > -1) {
          show = true;
          break;
        }
      }
      tr[i].style.display = show ? "" : "none";
    }
  }

  document.getElementById("vendorSearch").addEventListener("input", filterTable);
</script>

</body>
</html>
