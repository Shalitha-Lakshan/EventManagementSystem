package servlet;

import model.EventPlanner;
import model.User;
import model.Vendor;
import services.EventPlannerService;
import services.UserService;
import services.VendorService;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        
        UserService userService = new UserService();
        User user = userService.authenticate(email, password);

      
        EventPlannerService eventPlannerService = new EventPlannerService();
        EventPlanner planner = eventPlannerService.authenticate(email, password);
        
        VendorService vendorService = new VendorService();
        Vendor vendor = vendorService.authenticate(email, password);
        
        HttpSession session = request.getSession();

        if (user != null) {
            session.setAttribute("user", user);
            String role = user.getRole().toLowerCase();

            switch (role) {
                case "admin":
                    response.sendRedirect("Adashboard.jsp");
                    break;
                case "user":
                    response.sendRedirect("headerF.jsp");
                    break;
                
                default:
                    request.setAttribute("errorMessage", "Invalid role assigned.");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
            }

        } else if (planner != null) {
            session.setAttribute("eventPlanner", planner);
            response.sendRedirect("eventPlannerDashboard.jsp");

        } else if (vendor != null) {
            session.setAttribute("vendors", vendor);
            response.sendRedirect("vendorManagement.jsp");

        }
        else {
            // Neither found
            request.setAttribute("errorMessage", "Invalid email or password.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
