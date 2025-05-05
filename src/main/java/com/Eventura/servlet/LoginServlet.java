package com.Eventura.servlet;

import com.Eventura.model.User;
import com.Eventura.services.UserService;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserService userService = new UserService();
        User user = userService.authenticate(email, password);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            String role = user.getRole().toLowerCase();

            switch (role) {
                case "admin":
                    response.sendRedirect("Adashboard.jsp");
                    break;
                case "user":
                    response.sendRedirect("headerF.jsp");
                    break;
                case "vendor":
                    response.sendRedirect("vendorDashboard.jsp");
                    break;
                case "eventplanner":
                    response.sendRedirect("eventPlannerDashboard.jsp");
                    break;
                default:
                    request.setAttribute("errorMessage", "Invalid role assigned.");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("errorMessage", "Invalid email or password");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
