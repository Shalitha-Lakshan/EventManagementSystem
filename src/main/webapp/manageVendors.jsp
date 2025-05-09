<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.Eventura.model.Vendor" %>
<!DOCTYPE html>
<html>
<head>
    <title>Vendors</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen flex">
    <!-- Sidebar (your existing sidebar code here) -->
    <div class="w-64 bg-white border-r min-h-screen">
        <div class="p-6 font-bold text-xl text-orange-600">Event Planner</div>
        <nav class="mt-8">
            <a href="dashboard.jsp" class="block px-6 py-2 text-gray-700 hover:bg-orange-50">Dashboard</a>
            <a href="manageEvents.jsp" class="block px-6 py-2 text-gray-700 hover:bg-orange-50">Manage Events</a>
            <a href="vendors" class="block px-6 py-2 bg-orange-100 text-orange-700 rounded-l">Manage Vendors</a>
            <a href="settings.jsp" class="block px-6 py-2 text-gray-700 hover:bg-orange-50">Settings</a>
        </nav>
    </div>
    <!-- Main Content -->
    <div class="flex-1 p-8">
        <div class="flex justify-between items-center mb-6">
            <h1 class="text-2xl font-bold text-gray-800">Vendors</h1>
            <div>
                <a href="vendors" class="bg-orange-500 hover:bg-orange-600 text-white px-4 py-2 rounded mr-2">Refresh</a>
                <a href="addVendor.jsp" class="bg-orange-500 hover:bg-orange-600 text-white px-4 py-2 rounded">Add Vendor</a>
            </div>
        </div>
        <div class="bg-white rounded shadow p-6">
            <h2 class="text-xl font-semibold mb-4 text-gray-700">Manage Vendors</h2>
            <table class="min-w-full divide-y divide-gray-200">
                <thead>
                    <tr class="bg-orange-100 text-gray-800">
                        <th class="px-4 py-2">#</th>
                        <th class="px-4 py-2">Vendor Name</th>
                        <th class="px-4 py-2">NIC</th>
                        <th class="px-4 py-2">Email</th>
                        <th class="px-4 py-2">Phone</th>
                        <th class="px-4 py-2">Service</th>
                    </tr>
                </thead>
                <tbody>
               
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
