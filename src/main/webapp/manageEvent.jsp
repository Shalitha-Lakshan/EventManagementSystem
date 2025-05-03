<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <aside class="w-64 bg-white shadow-lg flex-shrink-0 h-full">
    <div class="p-6 text-xl font-bold text-orange-600">Event Planner</div>
    <nav class="mt-8">
      <ul>
        <li class="px-6 py-3 hover:bg-orange-100">
          <a href="eventPlannerDashboard.jsp" class="flex items-center text-gray-800">
            <i class="fas fa-calendar-alt mr-2"></i> Dashboard
          </a>
        </li>
        <li class="px-6 py-3 bg-orange-100 font-semibold">
          <a href="manageEvent.jsp" class="flex items-center text-gray-800">
            <i class="fas fa-tasks mr-2"></i> Manage Events
          </a>
        </li>
        <li class="px-6 py-3 hover:bg-orange-100">
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
<div class="flex-1 overflow-auto px-8 pt-32 pb-10">


   <!-- Top Bar (Fixed) -->
<header class="bg-white shadow p-4 flex justify-between items-center fixed top-0 left-64 right-0 z-10">
  <h1 class="text-2xl font-semibold text-gray-700">Event Management</h1>
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


    <!-- Page Header -->
    <div class="flex justify-between items-center mb-6">
      <h2 class="text-2xl font-bold text-gray-700">All Events</h2>
      <a href="create-event.jsp" class="bg-orange-500 text-white px-4 py-2 rounded hover:bg-orange-600">
        <i class="fas fa-plus mr-2"></i>Create New Event
      </a>
    </div>

    <!-- Event Table -->
    <div class="bg-white p-6 rounded shadow">
      <div class="overflow-x-auto">
        <table class="min-w-full text-sm text-left border rounded">
          <thead class="bg-orange-100">
            <tr>
              <th class="py-2 px-4">#</th>
              <th class="py-2 px-4">Event Name</th>
              <th class="py-2 px-4">Date</th>
              <th class="py-2 px-4">Venue</th>
              <th class="py-2 px-4">Status</th>
              <th class="py-2 px-4">Actions</th>
            </tr>
          </thead>
          <tbody class="text-gray-700">
            <tr class="border-t">
              <td class="px-4 py-2">1</td>
              <td class="px-4 py-2">Annual Gala</td>
              <td class="px-4 py-2">2025-05-01</td>
              <td class="px-4 py-2">Grand Hall</td>
              <td class="px-4 py-2">
                <span class="bg-yellow-100 text-yellow-700 px-2 py-1 rounded-full text-xs">Pending</span>
              </td>
              <td class="px-4 py-2 space-x-2">
                <a href="edit-event.jsp?id=1" class="text-blue-500 hover:text-blue-700"><i class="fas fa-edit"></i> Edit</a>
                <a href="delete-event.jsp?id=1" class="text-red-500 hover:text-red-700"><i class="fas fa-trash-alt"></i> Delete</a>
              </td>
            </tr>
            <tr class="border-t">
              <td class="px-4 py-2">2</td>
              <td class="px-4 py-2">Product Launch</td>
              <td class="px-4 py-2">2025-06-10</td>
              <td class="px-4 py-2">Oceanview Resort</td>
              <td class="px-4 py-2">
                <span class="bg-green-100 text-green-700 px-2 py-1 rounded-full text-xs">Approved</span>
              </td>
              <td class="px-4 py-2 space-x-2">
                <a href="edit-event.jsp?id=2" class="text-blue-500 hover:text-blue-700"><i class="fas fa-edit"></i> Edit</a>
                <a href="delete-event.jsp?id=2" class="text-red-500 hover:text-red-700"><i class="fas fa-trash-alt"></i> Delete</a>
              </td>
            </tr>
            <!-- Add more event rows as needed -->
          </tbody>
        </table>
      </div>
    </div>

  </div>

</body>
</html>
