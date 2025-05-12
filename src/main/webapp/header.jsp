<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.Eventura.model.EventPlanner" %>
<%
    EventPlanner planner = (EventPlanner) session.getAttribute("eventplanner");
%>

<!-- Top Bar -->
<header class="bg-white shadow p-4 flex justify-between items-center">
  <h1 class="text-2xl font-semibold text-gray-700">Dashboard</h1>
  <div class="flex items-center gap-4">
    <% if (planner != null) { %>
      <div class="flex items-center gap-2">
        <img src="https://i.pravatar.cc/40?u=Lakshan" alt="Profile" class="w-8 h-8 rounded-full border border-gray-300">
        <span class="text-sm text-gray-600">Hi, <%= planner.getName() %></span>
      </div>
      <form action="LogoutServlet" method="get">
        <button class="bg-red-500 text-white px-3 py-1 rounded hover:bg-red-600">
          <i class="fas fa-sign-out-alt"></i> Logout
        </button>
      </form>
    <% } else { %>
      <a href="login.jsp" class="text-sm text-blue-600">Login</a>
    <% } %>
  </div>
</header>
