<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.Eventura.model.EventPlanner" %>
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
  <title>Event Planner Dashboard</title>
  <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body class="flex h-screen bg-gray-100">

  <!-- Sidebar -->
  <aside class="w-64 bg-white shadow-lg">
    <div class="p-6 text-xl font-bold text-orange-600">Event Planner</div>
    <nav class="mt-8">
      <ul>
        <li class="px-6 py-3 bg-orange-100 font-semibold">
          <a href="eventPlannerDashboard.jsp" class="flex items-center text-gray-800">
            <i class="fas fa-calendar-alt mr-2"></i> Dashboard
          </a>
        </li>
        <li class="px-6 py-3 hover:bg-orange-100">
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
  <div class="flex-1 flex flex-col">

    <jsp:include page="header.jsp" />

    <main class="p-6 overflow-auto">
      <!-- Summary Cards -->
      <div class="grid grid-cols-1 md:grid-cols-4 gap-6 mb-6">
        <div class="bg-white p-4 rounded shadow border-l-4 border-blue-500">
          <div class="flex justify-between items-center">
            <div>
              <h4 class="text-gray-600 text-sm">Total Events</h4>
              <h2 class="text-2xl font-bold text-blue-600">${totalEvents}</h2>
            </div>
            <i class="fas fa-calendar-alt text-blue-400 text-3xl"></i>
          </div>
        </div>

        <div class="bg-white p-4 rounded shadow border-l-4 border-green-500">
          <div class="flex justify-between items-center">
            <div>
              <h4 class="text-gray-600 text-sm">Approved</h4>
              <h2 class="text-2xl font-bold text-green-600">${statusCounts['Approved'] != null ? statusCounts['Approved'] : 0}</h2>
            </div>
            <i class="fas fa-check-circle text-green-400 text-3xl"></i>
          </div>
        </div>

        <div class="bg-white p-4 rounded shadow border-l-4 border-yellow-500">
          <div class="flex justify-between items-center">
            <div>
              <h4 class="text-gray-600 text-sm">Pending</h4>
              <h2 class="text-2xl font-bold text-yellow-600">${statusCounts['Pending'] != null ? statusCounts['Pending'] : 0}</h2>
            </div>
            <i class="fas fa-hourglass-half text-yellow-400 text-3xl"></i>
          </div>
        </div>

        <div class="bg-white p-4 rounded shadow border-l-4 border-red-500">
          <div class="flex justify-between items-center">
            <div>
              <h4 class="text-gray-600 text-sm">Rejected</h4>
              <h2 class="text-2xl font-bold text-red-600">${statusCounts['Rejected'] != null ? statusCounts['Rejected'] : 0}</h2>
            </div>
            <i class="fas fa-times-circle text-red-400 text-3xl"></i>
          </div>
        </div>
      </div>

      <!-- Charts Section -->
      <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-8">
        <!-- Events Per Month -->
        <div class="bg-white p-6 rounded shadow">
          <h3 class="text-lg font-semibold text-gray-700 mb-4">Events Per Month</h3>
          <canvas id="eventsChart" height="180"></canvas>
        </div>

        <!-- Vendor Assignments -->
        <div class="bg-white p-6 rounded shadow">
          <h3 class="text-lg font-semibold text-gray-700 mb-4">Vendor Assignments</h3>
          <canvas id="vendorChart" height="180"></canvas>
        </div>
      </div>
    </main>
  </div>

  <!-- Chart.js Logic -->
  <script>
    // Dynamic monthly data
    const monthlyLabels = [];
    const monthlyData = [];
    <c:forEach var="entry" items="${monthlyEvents}">
      monthlyLabels.push("${entry.key}");
      monthlyData.push(${entry.value});
    </c:forEach>

    new Chart(document.getElementById('eventsChart').getContext('2d'), {
      type: 'bar',
      data: {
        labels: monthlyLabels,
        datasets: [{
          label: 'Events',
          data: monthlyData,
          backgroundColor: 'rgba(255, 159, 64, 0.8)',
          borderColor: 'rgba(255, 99, 132, 1)',
          borderWidth: 1
        }]
      },
      options: {
        responsive: true,
        scales: { y: { beginAtZero: true } },
        plugins: {
          tooltip: { enabled: true },
          legend: { display: false }
        }
      }
    });

    // Vendor Assignments chart
    const vendorLabels = [];
    const vendorData = [];
    <c:forEach var="entry" items="${vendorAssignments}">
      vendorLabels.push("${entry.key}");
      vendorData.push(${entry.value});
    </c:forEach>

    new Chart(document.getElementById('vendorChart').getContext('2d'), {
      type: 'doughnut',
      data: {
        labels: vendorLabels,
        datasets: [{
          label: 'Vendors',
          data: vendorData,
          backgroundColor: ['#f97316', '#22c55e', '#3b82f6', '#ef4444', '#a855f7'],
          borderWidth: 2,
          borderColor: '#fff'
        }]
      },
      options: {
        responsive: true,
        plugins: {
          legend: {
            position: 'right',
            labels: {
              color: '#374151',
              font: { size: 13 }
            }
          }
        }
      }
    });
  </script>

</body>
</html>
