<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.Eventura.model.Vendor" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Vendor Management</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen">

<div class="container mx-auto px-4 py-8">
  <div class="flex justify-between items-center mb-6">
    <h1 class="text-3xl font-bold text-orange-600">Manage Vendors</h1>
    <a href="VendorServlet?action=new"
       class="bg-orange-500 text-white px-4 py-2 rounded hover:bg-orange-600">
      + Add Vendor
    </a>
  </div>

  <div class="bg-white shadow-md rounded overflow-x-auto">
    <table class="min-w-full table-auto text-sm">
      <thead class="bg-orange-100 text-gray-800">
        <tr>
          <th class="px-4 py-2">ID</th>
          <th class="px-4 py-2">Name</th>
          <th class="px-4 py-2">NIC</th>
          <th class="px-4 py-2">Email</th>
          <th class="px-4 py-2">Phone</th>
          <th class="px-4 py-2">Service Type</th>
          <th class="px-4 py-2">Actions</th>
        </tr>
      </thead>
      <tbody class="text-gray-700">
        <c:forEach var="ven" items="${listVendor}">
          <tr class="border-t hover:bg-orange-50">
            <td class="px-4 py-2">${ven.vendorID}</td>
            <td class="px-4 py-2">${ven.vendorName}</td>
            <td class="px-4 py-2">${ven.nic}</td>
            <td class="px-4 py-2">${ven.email}</td>
            <td class="px-4 py-2">${ven.phone}</td>
            <td class="px-4 py-2">${ven.serviceType}</td>
            <td class="px-4 py-2 space-x-2">
              <a href="VendorServlet?action=edit&id=${ven.vendorID}"
                 class="text-blue-500 hover:underline">Edit</a>
              <a href="VendorServlet?action=delete&id=${ven.vendorID}"
                 class="text-red-500 hover:underline"
                 onclick="return confirm('Are you sure you want to delete this vendor?')">Delete</a>
            </td>
          </tr>
        </c:forEach>

        <c:if test="${empty listVendor}">
          <tr>
            <td colspan="7" class="px-4 py-4 text-center text-gray-500">
              No vendors found.
            </td>
          </tr>
        </c:if>
      </tbody>
    </table>
  </div>
</div>

</body>
</html>
