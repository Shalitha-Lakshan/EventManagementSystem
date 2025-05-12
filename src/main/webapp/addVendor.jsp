<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Vendor</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
      function validateForm(event) {
        const name = document.forms["vendorForm"]["name"].value.trim();
        const email = document.forms["vendorForm"]["email"].value.trim();
        const phone = document.forms["vendorForm"]["phone"].value.trim();
        const nic = document.forms["vendorForm"]["nic"].value.trim();
        const service = document.forms["vendorForm"]["service"].value;
        const password = document.forms["vendorForm"]["password"].value;

        const phoneRegex = /^[0-9]{10}$/;
        const nicRegex = /^[0-9]{9}[Vv]$/; // Example: 123456789V
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

        let errors = [];

        if (!phoneRegex.test(phone)) {
          errors.push("Phone must be exactly 10 digits.");
        }

        if (!nicRegex.test(nic)) {
          errors.push("NIC must be in format like 123456789V.");
        }

        if (!emailRegex.test(email)) {
          errors.push("Email format is invalid.");
        }

        if (password.length < 4) {
          errors.push("Password must be at least 4 characters.");
        }

        if (errors.length > 0) {
          alert(errors.join("\n"));
          event.preventDefault();
        }
      }

      document.addEventListener("DOMContentLoaded", function () {
        document.getElementById("vendorForm").addEventListener("submit", validateForm);
      });
    </script>
</head>

<body class="bg-gray-100 min-h-screen flex items-center justify-center">
<div class="bg-white p-8 rounded shadow-md w-full max-w-lg">
    <h2 class="text-2xl font-bold mb-6 text-center text-orange-700">Add Vendor</h2>

    <form id="vendorForm" name="vendorForm" action="addVendorServlet" method="post" class="space-y-4">

        <!-- Vendor Name -->
        <div>
            <label class="block text-gray-700 font-medium">Vendor Name</label>
            <input type="text" name="name" required
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
                   class="mt-1 w-full px-4 py-2 border rounded focus:outline-none focus:ring focus:border-orange-300"
                   maxlength="10" />
        </div>

        <!-- NIC -->
        <div>
            <label class="block text-gray-700 font-medium">NIC</label>
            <input type="text" name="nic" required
                   class="mt-1 w-full px-4 py-2 border rounded focus:outline-none focus:ring focus:border-orange-300"
                   maxlength="10" />
        </div>

        <!-- Service Type -->
        <div>
            <label class="block text-gray-700 font-medium">Service Type</label>
            <select name="service" required
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

        <!-- Password -->
        <div>
            <label class="block text-gray-700 font-medium">Password</label>
            <input type="password" name="password" required
                   class="mt-1 w-full px-4 py-2 border rounded focus:outline-none focus:ring focus:border-orange-300" />
        </div>

        <!-- Submit -->
        <div class="text-center space-y-2">
            <button type="submit"
                    class="bg-orange-600 hover:bg-orange-700 text-white font-semibold py-2 px-6 rounded">
                Add Vendor
            </button>
            <br />
            <a href="GetAllVendors" class="text-orange-600 hover:underline">
                ← Back to Vendor Page
            </a>
        </div>
    </form>
</div>
</body>
</html>
