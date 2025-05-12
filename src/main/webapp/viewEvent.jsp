<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Event Request Summary</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</head>
<body class="bg-gray-100 font-sans">

<%
    String id = request.getParameter("id");
    String fullName = request.getParameter("full_name");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String eventDate = request.getParameter("event_date");
    String eventTitle = request.getParameter("event_title");
    String eventType = request.getParameter("event_type");
    String venue = request.getParameter("venue");
    String requirements = request.getParameter("requirements");

    double budget = 0.0;
    int guestCount = 0;

    try {
        String budgetStr = request.getParameter("budget");
        if (budgetStr != null && !budgetStr.trim().isEmpty()) {
            budget = Double.parseDouble(budgetStr.trim());
        }
    } catch (NumberFormatException e) {
        budget = 0.0;
    }

    try {
        String guestCountStr = request.getParameter("guest_count");
        if (guestCountStr != null && !guestCountStr.trim().isEmpty()) {
            guestCount = Integer.parseInt(guestCountStr.trim());
        }
    } catch (NumberFormatException e) {
        guestCount = 0;
    }
%>

<div class="container mx-auto px-4 py-10">
  <div class="bg-white shadow-xl rounded-lg max-w-3xl mx-auto p-8">
    <h1 class="text-3xl font-bold text-center text-orange-600 mb-6">
      Event Request Summary
    </h1>

    <form action="GetAllEvent" method="post" class="space-y-6">

      <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
        <div>
          <label class="text-sm text-gray-600 font-medium">ID</label>
          <input type="text" name="id" value="<%=id%>" readonly class="w-full mt-1 px-4 py-2 border rounded-md bg-gray-50" />
        </div>
        <div>
          <label class="text-sm text-gray-600 font-medium">Full Name</label>
          <input type="text" name="fullName" value="<%=fullName%>" readonly class="w-full mt-1 px-4 py-2 border rounded-md bg-gray-50" />
        </div>
        <div>
          <label class="text-sm text-gray-600 font-medium">Email</label>
          <input type="text" name="email" value="<%=email%>" readonly class="w-full mt-1 px-4 py-2 border rounded-md bg-gray-50" />
        </div>
        <div>
          <label class="text-sm text-gray-600 font-medium">Phone Number</label>
          <input type="text" name="phone" value="<%=phone%>" readonly class="w-full mt-1 px-4 py-2 border rounded-md bg-gray-50" />
        </div>
        <div>
          <label class="text-sm text-gray-600 font-medium">Event Date</label>
          <input type="text" name="eventDate" value="<%=eventDate%>" readonly class="w-full mt-1 px-4 py-2 border rounded-md bg-gray-50" />
        </div>
        <div>
          <label class="text-sm text-gray-600 font-medium">Event Title</label>
          <input type="text" name="eventTitle" value="<%=eventTitle%>" readonly class="w-full mt-1 px-4 py-2 border rounded-md bg-gray-50" />
        </div>
      </div>

      <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
        <div>
          <label class="text-sm text-gray-600 font-medium">Event Type</label>
          <input type="text" name="eventType" value="<%=eventType%>" readonly class="w-full mt-1 px-4 py-2 border rounded-md bg-gray-50" />
        </div>
        <div>
          <label class="text-sm text-gray-600 font-medium">Venue</label>
          <input type="text" name="venue" value="<%=venue%>" readonly class="w-full mt-1 px-4 py-2 border rounded-md bg-gray-50" />
        </div>
      </div>

      <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
        <div>
          <label class="text-sm text-gray-600 font-medium">Estimated Budget (LKR)</label>
          <input type="text" name="budget" value="<%=budget%>" readonly class="w-full mt-1 px-4 py-2 border rounded-md bg-gray-50" />
        </div>
        <div>
          <label class="text-sm text-gray-600 font-medium">Estimated Guests</label>
          <input type="text" name="guestCount" value="<%=guestCount%>" readonly class="w-full mt-1 px-4 py-2 border rounded-md bg-gray-50" />
        </div>
      </div>

      <div>
        <label class="text-sm text-gray-600 font-medium">Special Requirements</label>
        <input type="text" name="requirements" value="<%=requirements%>" readonly class="w-full mt-1 px-4 py-2 border rounded-md bg-gray-50" />
      </div>

      <div class="text-center">
        <button type="submit" class="bg-orange-500 hover:bg-orange-600 text-white font-semibold px-6 py-2 rounded shadow">
          Home
        </button>
      </div>

    </form>
  </div>
</div>

</body>
</html>
