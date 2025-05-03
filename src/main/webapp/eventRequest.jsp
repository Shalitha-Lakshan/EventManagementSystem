<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Request an Event</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen flex items-center justify-center p-6">

  <form class="bg-white shadow-lg rounded p-8 max-w-2xl w-full space-y-6">
    <h2 class="text-2xl font-bold text-gray-800 text-center">Event Request Form</h2>

    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
      <div>
        <label class="block mb-1 text-sm text-gray-700">Full Name</label>
        <input type="text" class="w-full border border-gray-300 p-2 rounded" required>
      </div>
      <div>
        <label class="block mb-1 text-sm text-gray-700">Email</label>
        <input type="email" class="w-full border border-gray-300 p-2 rounded" required>
      </div>
      <div>
        <label class="block mb-1 text-sm text-gray-700">Phone Number</label>
        <input type="tel" class="w-full border border-gray-300 p-2 rounded" required>
      </div>
      <div>
        <label class="block mb-1 text-sm text-gray-700">Event Date</label>
        <input type="date" class="w-full border border-gray-300 p-2 rounded" required>
      </div>
    </div>

    <div>
      <label class="block mb-1 text-sm text-gray-700">Event Title</label>
      <input type="text" class="w-full border border-gray-300 p-2 rounded" required>
    </div>

    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
      <div>
        <label class="block mb-1 text-sm text-gray-700">Event Type</label>
        <select class="w-full border border-gray-300 p-2 rounded">
          <option>Wedding</option>
          <option>Birthday</option>
          <option>Conference</option>
          <option>Concert</option>
          <option>Other</option>
        </select>
      </div>
      <div>
        <label class="block mb-1 text-sm text-gray-700">Venue</label>
        <select class="w-full border border-gray-300 p-2 rounded">
          <option>City Hall</option>
          <option>Beach Resort</option>
          <option>Mountain View Garden</option>
          <option>Hotel Grand</option>
        </select>
      </div>
    </div>

    <div>
      <label class="block mb-1 text-sm text-gray-700">Estimated Guests</label>
      <input type="number" class="w-full border border-gray-300 p-2 rounded" required>
    </div>

    <div>
      <label class="block mb-1 text-sm text-gray-700">Special Requirements</label>
      <textarea class="w-full border border-gray-300 p-2 rounded" rows="4"></textarea>
    </div>

    <div class="text-center">
      <button type="submit" class="bg-orange-500 hover:bg-orange-600 text-white font-semibold px-6 py-2 rounded">
        Submit Request
      </button>
    </div>
  </form>

</body>
</html>
