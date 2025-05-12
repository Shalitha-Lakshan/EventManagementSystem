<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Request an Event</title>

  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" />
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/headerF.css">

  <style>
    input[type="text"],
    input[type="email"],
    input[type="tel"],
    input[type="number"],
    input[type="date"],
    select,
    textarea {
      transition: border-color 0.3s ease, box-shadow 0.3s ease;
    }

    input:focus,
    select:focus,
    textarea:focus {
      border-color: #fb923c;
      box-shadow: 0 0 0 3px rgba(251, 146, 60, 0.3);
      outline: none;
    }

    button:disabled {
      background-color: #ccc;
      cursor: not-allowed;
    }

    input[type="file"]::file-selector-button {
      background-color: #fb923c;
      color: white;
      border: none;
      padding: 8px 16px;
      border-radius: 4px;
      cursor: pointer;
      font-weight: 500;
      transition: background-color 0.3s ease;
    }

    input[type="file"]::file-selector-button:hover {
      background-color: #f97316;
    }

    @media (max-width: 768px) {
      form {
        padding: 1rem !important;
      }
    }
  </style>
</head>

<body class="bg-gray-100 min-h-screen flex flex-col">

 

  <!-- FORM -->
  <main class="flex-grow p-6 flex items-center justify-center">
    <!-- FIXED: Removed enctype -->
    <form action="addEventServlet" method="post" class="bg-white shadow-lg rounded p-8 max-w-2xl w-full space-y-6">
      <h2 class="text-2xl font-bold text-gray-800 text-center">Event Request Form</h2>

      <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
        <div>
          <label class="block mb-1 text-sm text-gray-700">Full Name</label>
          <input type="text" name="full_name" placeholder="John Doe" class="w-full border border-gray-300 p-2 rounded" required>
        </div>
        <div>
          <label class="block mb-1 text-sm text-gray-700">Email</label>
          <input type="email" name="email" placeholder="john@example.com" class="w-full border border-gray-300 p-2 rounded" required>
        </div>
        <div>
          <label class="block mb-1 text-sm text-gray-700">Phone Number</label>
          <input type="text" name="phone" placeholder="+94771234567" pattern="[+0-9]{10,15}" class="w-full border border-gray-300 p-2 rounded" required>
        </div>
        <div>
          <label class="block mb-1 text-sm text-gray-700">Event Date</label>
          <input type="date" name="event_date" class="w-full border border-gray-300 p-2 rounded" required>
        </div>
      </div>

      <div>
        <label class="block mb-1 text-sm text-gray-700">Event Title</label>
        <input type="text" name="event_title" placeholder="e.g., John's Wedding" class="w-full border border-gray-300 p-2 rounded" required>
      </div>

      <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
        <div>
          <label class="block mb-1 text-sm text-gray-700">Event Type</label>
          <select name="event_type" class="w-full border border-gray-300 p-2 rounded" required>
            <option disabled selected>Select type</option>
            <option>Conference</option>
            <option>Wedding</option>
            <option>Seminar</option>
            <option>Workshop</option>
            <option>Concert</option>
            <option>Corporate Meeting</option>
            <option>Birthday Party</option>
            <option>Charity Gala</option>
          </select>
        </div>
        <div>
          <label class="block mb-1 text-sm text-gray-700">Venue</label>
          <select name="venue" class="w-full border border-gray-300 p-2 rounded" required>
            <option disabled selected>Select venue</option>
            <option>Shangri-La Colombo</option>
            <option>The Grand Kandyan (Kandy)</option>
            <option>Kingsbury Hotel Colombo</option>
            <option>Cinnamon Grand Colombo</option>
            <option>Blue Water Hotel (Wadduwa)</option>
            <option>Nelum Pokuna Theatre (Colombo)</option>
            <option>The Avenue Colombo</option>
            <option>Waters Edge (Battaramulla)</option>
            <option>Sky Lounge by The Kingsbury</option>
            <option>Villa Colombo 7</option>
          </select>
        </div>
      </div>

      <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
        <div>
          <label class="block mb-1 text-sm text-gray-700">Estimated Budget (LKR)</label>
          <input type="number" name="budget" placeholder="e.g., 500000" min="0" class="w-full border border-gray-300 p-2 rounded" required>
        </div>
        <div>
          <label class="block mb-1 text-sm text-gray-700">Estimated Guests</label>
          <input type="number" name="guest_count" placeholder="e.g., 100" min="1" class="w-full border border-gray-300 p-2 rounded" required>
        </div>
      </div>

      <div>
        <label class="block mb-1 text-sm text-gray-700">Special Requirements</label>
        <textarea name="requirements" placeholder="e.g., Vegetarian menu, wheelchair access..." class="w-full border border-gray-300 p-2 rounded" rows="4"></textarea>
      </div>

      <div class="text-center">
        <button type="submit" class="bg-orange-500 hover:bg-orange-600 text-white font-semibold px-6 py-2 rounded">
          Submit Request
        </button>
                    <br />
            <a href="GetAllEvent" class="text-orange-600 hover:underline">
                ← Back to Event Page
            </a>
        
        
        <p class="text-xs text-gray-500 mt-2">We respect your privacy. Your information will never be shared.</p>
      </div>
    </form>
  </main>

  

  <script src="js/bootstrap.bundle.min.js"></script>
  <script src="js/headerF.js"></script>
</body>
</html>
