<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Events</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen p-10">

<div class="max-w-7xl mx-auto">
    <h1 class="text-3xl font-bold mb-8 text-orange-600">Manage Events</h1>

    <table class="w-full table-auto bg-white shadow-md rounded-lg overflow-hidden">
        <thead class="bg-orange-100 text-left text-gray-700">
            <tr>
                <th class="px-6 py-3">ID</th>
                <th class="px-6 py-3">Title</th>
                <th class="px-6 py-3">Date</th>
                <th class="px-6 py-3">Venue</th>
                <th class="px-6 py-3">Assigned Vendor</th>
                <th class="px-6 py-3">Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="event" items="${eventList}">
                <tr class="border-t hover:bg-gray-50">
                    <td class="px-6 py-4">${event.id}</td>
                    <td class="px-6 py-4">${event.eventTitle}</td>
                    <td class="px-6 py-4">${event.eventDate}</td>
                    <td class="px-6 py-4">${event.venue}</td>
                    <td class="px-6 py-4">
                        <c:choose>
                            <c:when test="${not empty event.assignedVendor}">
                                ${event.assignedVendor}
                            </c:when>
                            <c:otherwise>
                                <span class="text-gray-400 italic">Unassigned</span>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td class="px-6 py-4">
                        <a href="LoadAssignVendorPage?event_id=${event.id}"
                           class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600 text-sm">
                            Assign Vendor
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
