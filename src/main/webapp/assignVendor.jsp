<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    if (request.getAttribute("vendorList") == null || request.getParameter("event_id") == null) {
        response.sendRedirect("GetAllEvent");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Assign Vendor</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 py-10 px-6 min-h-screen flex items-center justify-center">

<div class="w-full max-w-xl bg-white p-8 rounded-lg shadow-md space-y-6">
    <div class="text-center">
        <h2 class="text-2xl font-bold text-orange-600">Assign Vendor</h2>
        <p class="text-sm text-gray-500 mt-1">
            Assigning vendor to <strong>Event ID: ${param.event_id}</strong>
        </p>
    </div>

    <form action="AssignVendor" method="post" class="space-y-5">
        <input type="hidden" name="eventId" value="${param.event_id}" />

        <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Select Vendor:</label>

            <c:choose>
                <c:when test="${not empty vendorList}">
                    <select name="vendorIds" id="vendorId" required class="w-full border border-gray-300 p-2 rounded-md">
                        <c:forEach var="vendor" items="${vendorList}">
                            <option value="${vendor.id}">${vendor.name} - ${vendor.service}</option>
                        </c:forEach>
                    </select>
                </c:when>
                <c:otherwise>
                    <p class="text-red-500 text-sm">No vendors available. Please add vendors first.</p>
                </c:otherwise>
            </c:choose>
        </div>

        <div class="flex justify-between items-center">
            <a href="GetAllEvent" class="text-sm text-gray-500 hover:text-orange-600 transition">
                ← Back to Events
            </a>

            <c:choose>
                <c:when test="${not empty vendorList}">
                    <button type="submit" class="bg-blue-500 hover:bg-blue-600 text-white font-semibold px-6 py-2 rounded-md shadow-sm">
                        Assign Vendor
                    </button>
                </c:when>
                <c:otherwise>
                    <button type="button" disabled class="bg-gray-300 text-gray-600 font-semibold px-6 py-2 rounded-md cursor-not-allowed">
                        Assign Vendor
                    </button>
                </c:otherwise>
            </c:choose>
        </div>
    </form>
</div>

</body>
</html>
