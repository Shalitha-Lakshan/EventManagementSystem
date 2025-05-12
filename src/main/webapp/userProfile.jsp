<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
  <title>User Profile</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen flex items-center justify-center">
  <div class="bg-white shadow-lg rounded-lg w-full max-w-lg p-8">
    <div class="flex flex-col items-center space-y-4">
      <!-- Avatar / Icon -->
      <div class="w-24 h-24 rounded-full bg-orange-100 flex items-center justify-center text-orange-600 text-4xl font-bold">
        ${eventplanner.name.substring(0,1)}
      </div>

      <!-- Profile Info -->
      <h2 class="text-2xl font-bold text-gray-800">ID: ${eventplanner.id}</h2>
      <div class="text-gray-600 space-y-1">
        <p><span class="font-semibold">Name:</span> ${eventplanner.name}</p>
        <p><span class="font-semibold">NIC:</span> ${eventplanner.nic}</p>
        <p><span class="font-semibold">Email:</span> ${eventplanner.email}</p>
        <p><span class="font-semibold">Phone:</span> ${eventplanner.phone}</p>
      </div>

      <!-- Buttons -->
      <div class="flex gap-4 mt-6">
        <a href="updateProfile.jsp?id=${eventplanner.id}&name=${eventplanner.name}&nic=${eventplanner.nic}&email=${eventplanner.email}&phone=${eventplanner.phone}&password=${eventplanner.password}">
          <button class="bg-orange-500 hover:bg-orange-600 text-white font-medium py-2 px-4 rounded">Update</button>
        </a>

        <form action="deleteProfile" method="post" onsubmit="return confirm('Are you sure you want to delete your profile?');">
          <input type="hidden" name="id" value="${eventplanner.id}">
          <button type="submit" class="bg-red-500 hover:bg-red-600 text-white font-medium py-2 px-4 rounded">Delete</button>
        </form>
      </div>

      <!-- Logout -->
      <form action="login.jsp" method="post" class="mt-4">
        <button type="submit" class="bg-gray-300 hover:bg-gray-400 text-gray-800 font-medium py-2 px-4 rounded">Logout</button>
      </form>
      <form action="settings.jsp" method="post" class="mt-4">
        <button type="submit" class="bg-gray-300 hover:bg-gray-400 text-gray-800 font-medium py-2 px-4 rounded">Home</button>
      </form>
      
      
    </div>
  </div>
</body>
</html>
