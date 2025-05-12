<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Update Form</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen flex items-center justify-center">
<div class="bg-white p-8 rounded shadow-md w-full max-w-lg">
    <h2 class="text-2xl font-bold mb-6 text-center text-orange-700">Edit Vendor</h2>
    
<%

	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String nic = request.getParameter("nic");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	String service = request.getParameter("service");
	String password = request.getParameter("password");

%>



 <form action="UpdateVendor" method="post" class="space-y-4">
 
 		<div>
            <label class="block text-gray-700 font-medium">ID</label>
            <input type="text" name="id" value="<%=id%>" readonly
                   class="mt-1 w-full px-4 py-2 border rounded focus:outline-none focus:ring focus:border-orange-300" />
        </div>
        <!-- Vendor Name -->
        <div>
            <label class="block text-gray-700 font-medium">Vendor Name</label>
            <input type="text" name="name" value="<%=name%>" required
                   class="mt-1 w-full px-4 py-2 border rounded focus:outline-none focus:ring focus:border-orange-300" />
        </div>
        
         <!-- NIC -->
        <div>
            <label class="block text-gray-700 font-medium">NIC</label>
            <input type="text" name="nic" value="<%=nic%>"required
                   class="mt-1 w-full px-4 py-2 border rounded focus:outline-none focus:ring focus:border-orange-300" />
        </div>

        <!-- Email -->
        <div>
            <label class="block text-gray-700 font-medium">Email</label>
            <input type="email" name="email" value="<%=email%>"required
                   class="mt-1 w-full px-4 py-2 border rounded focus:outline-none focus:ring focus:border-orange-300" />
        </div>

        <!-- Phone -->
        <div>
            <label class="block text-gray-700 font-medium">Phone</label>
            <input type="text" name="phone" value="<%=phone%>"required
                   class="mt-1 w-full px-4 py-2 border rounded focus:outline-none focus:ring focus:border-orange-300" />
        </div>

       

        <!-- Service Type -->
        <div>
            <label class="block text-gray-700 font-medium">Service Type</label>
            <input type="text" name="service" value="<%=service%>" readonly
                   class="mt-1 w-full px-4 py-2 border rounded focus:outline-none focus:ring focus:border-orange-300" />
        </div>
        
         <div>
            <label class="block text-gray-700 font-medium">Password</label>
            <input type="password" name="password" value="<%=password%>"required
                   class="mt-1 w-full px-4 py-2 border rounded focus:outline-none focus:ring focus:border-orange-300" />
        </div>
        
        <div class="text-center">
            <button type="submit"
                    class="bg-orange-600 hover:bg-orange-700 text-white font-semibold py-2 px-6 rounded">
                Edit Vendor
            </button>
            <a href="GetAllVendors" class="text-orange-600 hover:underline">
        <i class="fas fa-arrow-left mr-1"></i> Back to Vendor page
      </a>
        </div>
       
</form>
</div>
</body>
</html>