<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Vendor</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen flex items-center justify-center">
<div class="bg-white p-8 rounded shadow-md w-full max-w-lg">
    <h2 class="text-2xl font-bold mb-6 text-center text-orange-700">Add Vendor</h2>

    <form action="addVendorServlet" method="post" class="space-y-4">
        <!-- Vendor Name -->
        <div>
            <label class="block text-gray-700 font-medium">Vendor Name</label>
            <input type="text" name="vendorName" required
                   class="mt-1 w-full px-4 py-2 border rounded focus:outline-none focus:ring focus:border-orange-300" />
        </div>

        <!-- Email -->
        <div>
            <label class="block text-gray-700 font-medium">Email</label>
            <input type="email" name="email" required
                   class="mt-1 w-full px-4 py-2 border rounded focus:outline-none focus:ring focus:border-orange-300" />
        </div>

        <!-- Phone -->
        <div>
            <label class="block text-gray-700 font-medium">Phone</label>
            <input type="text" name="phone" required
                   class="mt-1 w-full px-4 py-2 border rounded focus:outline-none focus:ring focus:border-orange-300" />
        </div>

        <!-- NIC -->
        <div>
            <label class="block text-gray-700 font-medium">NIC</label>
            <input type="text" name="nic" required
                   class="mt-1 w-full px-4 py-2 border rounded focus:outline-none focus:ring focus:border-orange-300" />
        </div>

        <!-- Service Type -->
        <div>
            <label class="block text-gray-700 font-medium">Service Type</label>
            <select name="serviceType" required
                    class="mt-1 w-full px-4 py-2 border rounded focus:outline-none focus:ring focus:border-orange-300">
                <option value="">-- Select Service Type --</option>
                <option value="Catering">Catering</option>
                <option value="Photography">Photography</option>
                <option value="Security">Security</option>
                <option value="Cleaning">Cleaning</option>
                <option value="Transportation">Transportation</option>
                <option value="IT Support">IT Support</option>
                <option value="Electrical">Electrical</option>
            </select>
        </div>
        
         <div>
            <label class="block text-gray-700 font-medium">Password</label>
            <input type="password" name="password" required
                   class="mt-1 w-full px-4 py-2 border rounded focus:outline-none focus:ring focus:border-orange-300" />
        </div>
       
        <!-- Submit -->
        <div class="text-center">
            <button type="submit"
                    class="bg-orange-600 hover:bg-orange-700 text-white font-semibold py-2 px-6 rounded">
                Add Vendor
            </button>
        </div>
    </form>
</div>
</body>
</html>
