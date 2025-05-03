<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Settings</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</head>
<body class="bg-gray-100 h-screen flex">

  <!-- Sidebar -->
  <aside class="w-64 bg-white shadow-lg flex-shrink-0">
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
        <li class="px-6 py-3 hover:bg-orange-100">
          <a href="vendorManagement.jsp" class="flex items-center text-gray-800">
            <i class="fas fa-truck mr-2"></i> Manage Vendors
          </a>
        </li>
        <li class="px-6 py-3 bg-orange-100 font-semibold">
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
      <h1 class="text-2xl font-semibold text-gray-700">Settings</h1>
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

    <!-- Settings Form Area -->
    <main class="p-6 overflow-auto flex-grow">
      <div class="max-w-4xl mx-auto">

        <!-- Back link -->
        <div class="flex justify-between items-center mb-6">
          <h2 class="text-3xl font-bold text-gray-700">Settings</h2>
          <a href="eventPlannerDashboard.jsp" class="text-orange-600 hover:underline">
            <i class="fas fa-arrow-left mr-2"></i>Back to Dashboard
          </a>
        </div>

        <form action="save-settings.jsp" method="post" class="space-y-10 bg-white p-6 rounded-lg shadow">

          <!-- Profile Settings -->
          <div>
            <h2 class="text-xl font-semibold text-gray-700 mb-4">👤 Profile Settings</h2>
            <div class="space-y-4">
              <input type="text" name="fullname" placeholder="Full Name" class="w-full border px-4 py-2 rounded" />
              <input type="email" name="email" placeholder="Email Address" class="w-full border px-4 py-2 rounded" />
            </div>
          </div>

          <!-- Notification Settings -->
          <div>
            <h2 class="text-xl font-semibold text-gray-700 mb-4">🔔 Notifications</h2>
            <label class="flex items-center space-x-2 text-gray-600">
              <input type="checkbox" class="form-checkbox text-orange-500" name="notifyEmail" checked>
              <span>Email Notifications</span>
            </label>
            <label class="flex items-center space-x-2 mt-2 text-gray-600">
              <input type="checkbox" class="form-checkbox text-orange-500" name="notifySms">
              <span>SMS Notifications</span>
            </label>
          </div>

          <!-- Theme Settings -->
          <div>
            <h2 class="text-xl font-semibold text-gray-700 mb-4">🎨 Theme Preferences</h2>
            <label class="flex items-center space-x-2 text-gray-600">
              <input type="checkbox" class="form-checkbox text-orange-500" name="darkMode">
              <span>Enable Dark Mode</span>
            </label>
          </div>

          <!-- Security Settings -->
          <div>
            <h2 class="text-xl font-semibold text-gray-700 mb-4">🔒 Security</h2>
            <div class="space-y-4">
              <input type="password" name="newPassword" placeholder="New Password" class="w-full border px-4 py-2 rounded" />
              <input type="password" name="confirmPassword" placeholder="Confirm Password" class="w-full border px-4 py-2 rounded" />
            </div>
          </div>

          <!-- Save Button -->
          <div class="flex justify-end">
            <button type="submit" class="bg-orange-500 text-white px-6 py-2 rounded hover:bg-orange-600">
              <i class="fas fa-save mr-2"></i>Save Settings
            </button>
          </div>

        </form>
      </div>
    </main>

  </div>
</body>
</html>
