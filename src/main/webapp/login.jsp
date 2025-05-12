<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>

<html>
<head>
    <title>User Registration</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen flex items-center justify-center">
<div class="bg-white p-8 rounded shadow-md w-full max-w-lg">
    <h2 class="text-2xl font-bold mb-6 text-center text-orange-700">Login</h2>

    <form action="LoginServlet" method="post">
      
        <!-- Email -->
        <div>
            <label class="block text-gray-700 font-medium">Email</label>
            <input type="email" name="email" required
                   class="mt-1 w-full px-4 py-2 border rounded focus:outline-none focus:ring focus:border-orange-300" />
        </div>

       
         <div>
            <label class="block text-gray-700 font-medium">Password</label>
            <input type="password" name="password" required
                   class="mt-1 w-full px-4 py-2 border rounded focus:outline-none focus:ring focus:border-orange-300" />
        </div><br>
        
  <!-- Submit -->
        <div class="text-center">
            <button type="submit"
                    class="bg-orange-600 hover:bg-orange-700 text-white font-semibold py-2 px-6 rounded">
                Login
            </button></div><div class="text-center">
             Don't have Account..?<a href="Register.jsp" class="text-orange-600 hover:underline">
        <i class="fas fa-arrow-left mr-1"></i> Register
      </a>
        </div>
    </form>
    </div>

</body>
</html>
