<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Create Event</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</head>
<body class="bg-gray-100 min-h-screen">

  <!-- Container -->
  <div class="max-w-4xl mx-auto p-6">

    <!-- Header -->
    <div class="flex justify-between items-center mb-6">
      <h1 class="text-2xl font-bold text-gray-700">Create New Event</h1>
      <a href="eventplannerdashboard.jsp" class="text-orange-600 hover:underline"><i class="fas fa-arrow-left mr-1"></i> Back to Dashboard</a>
    </div>

    <!-- Form Card -->
    <form action="save-event.jsp" method="post" enctype="multipart/form-data" class="bg-white p-6 rounded-lg shadow space-y-6">

      <!-- Event Name -->
      <div>
        <label class="block mb-1 text-gray-600 font-medium">Event Name</label>
        <input type="text" name="eventName" required placeholder="Enter event name"
               class="w-full px-4 py-2 border rounded focus:ring-2 focus:ring-orange-500">
      </div>

      <!-- Event Date -->
      <div>
        <label class="block mb-1 text-gray-600 font-medium">Event Date</label>
        <input type="date" name="eventDate" required
               class="w-full px-4 py-2 border rounded focus:ring-2 focus:ring-orange-500">
      </div>

      <!-- Venue -->
      <div>
        <label class="block mb-1 text-gray-600 font-medium">Venue</label>
        <select name="venue" required class="w-full px-4 py-2 border rounded bg-white focus:ring-2 focus:ring-orange-500">
          <option value="" disabled selected>Select a venue</option>
          <option>Grand Hall</option>
          <option>Oceanview Resort</option>
          <option>City Convention Center</option>
          <option>Garden Plaza</option>
        </select>
      </div>

      <!-- Description -->
      <div>
        <label class="block mb-1 text-gray-600 font-medium">Event Description</label>
        <textarea name="description" rows="4" placeholder="Details about the event"
                  class="w-full px-4 py-2 border rounded focus:ring-2 focus:ring-orange-500"></textarea>
      </div>

      <!-- File Upload (Optional) -->
      <div>
        <label class="block mb-1 text-gray-600 font-medium">Upload Event Banner (Optional)</label>
        <input type="file" name="banner" class="w-full text-gray-700 bg-white file:border file:rounded file:py-1 file:px-3 file:bg-orange-50 file:text-orange-600 file:cursor-pointer" />
      </div>

      <!-- Submit -->
      <div class="flex justify-end">
        <button type="submit" class="bg-orange-500 text-white px-6 py-2 rounded hover:bg-orange-600">
          <i class="fas fa-check mr-2"></i>Create Event
        </button>
      </div>

    </form>
  </div>

</body>
</html>
