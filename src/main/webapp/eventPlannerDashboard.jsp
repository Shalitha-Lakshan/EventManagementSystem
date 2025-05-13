<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
          <a href="EventDashboardServlet" class="flex items-center text-gray-800">
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
      <!-- Dashboard Cards -->
      <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6 text-white mb-10">
        <div class="bg-blue-500 rounded-lg shadow p-6 text-center">
          <div class="text-sm uppercase">Total Events</div>
          <div class="text-3xl font-bold mt-1">${totalEvents}</div>
        </div>
        <div class="bg-green-500 rounded-lg shadow p-6 text-center">
          <div class="text-sm uppercase">Upcoming Events</div>
          <div class="text-3xl font-bold mt-1">${upcomingEvents}</div>
        </div>
        <div class="bg-purple-500 rounded-lg shadow p-6 text-center">
          <div class="text-sm uppercase">Total Vendors</div>
          <div class="text-3xl font-bold mt-1">${vendorCount}</div>
        </div>
        <div class="bg-orange-500 rounded-lg shadow p-6 text-center">
          <div class="text-sm uppercase">Top Venue</div>
          <div class="text-lg font-semibold mt-1">${mostActiveVenue}</div>
        </div>
      </div>

      <!-- Charts -->
      <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-8">
        <div class="bg-white p-6 rounded shadow">
          <h3 class="text-lg font-semibold text-gray-700 mb-4">Total Events Per Month</h3>
          <canvas id="eventsChart" height="180"></canvas>
        </div>
        <div class="bg-white p-6 rounded shadow">
          <h3 class="text-lg font-semibold text-gray-700 mb-4">Vendor Assignments</h3>
          <canvas id="vendorChart" height="180"></canvas>
        </div>
      </div>
    </main>
  </div>

  <!-- Chart.js -->
  <script>
    const ctxEvents = document.getElementById('eventsChart').getContext('2d');
    new Chart(ctxEvents, {
      type: 'bar',
      data: {
        labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
        datasets: [{
          label: 'Events',
          data: [4, 7, 3, 5, 8, 6], // You can bind this dynamically if needed
          backgroundColor: 'rgba(255, 159, 64, 0.8)',
          borderColor: 'rgba(255, 99, 132, 1)',
          borderWidth: 1
        }]
      },
      options: {
        responsive: true,
        plugins: {
          legend: { display: false }
        },
        scales: {
          y: { beginAtZero: true }
        }
      }
    });

    const ctxVendors = document.getElementById('vendorChart').getContext('2d');
    new Chart(ctxVendors, {
      type: 'doughnut',
      data: {
        labels: ['Catering', 'Photography', 'Security', 'Cleaning'],
        datasets: [{
          label: 'Vendor Assignments',
          data: [12, 8, 6, 4], // Replace with dynamic values if available
          backgroundColor: ['#f97316', '#22c55e', '#3b82f6', '#ef4444'],
          borderColor: '#fff',
          borderWidth: 2
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
