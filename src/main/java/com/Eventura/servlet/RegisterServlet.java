package com.Eventura.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import com.Eventura.model.User;
import com.Eventura.services.UserService;


@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024,
	    maxFileSize = 1024 * 1024 * 5,
	    maxRequestSize = 1024 * 1024 * 10
	)
@WebServlet("/RegisterServlet")

public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String role = request.getParameter("role");

        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Passwords do not match.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("Registration.jsp");
            dispatcher.forward(request, response);
            return;
        }

        Part filePart = request.getPart("profilePic");
        String fileName = filePart.getSubmittedFileName();
        String imagePath = "default.png";

        if (fileName != null && !fileName.isEmpty()) {
            String uploadPath = getServletContext().getRealPath("/uploads");
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdir();

            filePart.write(uploadPath + File.separator + fileName);
            imagePath = "uploads/" + fileName;
        }

        User user = new User(name, email, password, imagePath, role);
        UserService userService = new UserService();
        boolean registered = userService.registerUser(user);

        if (registered) {
        	String alertMessage = "Registration Successful";
			response.getWriter().println("<script> alert('"+alertMessage+"'); window.location.href='headerF.jsp'</script>");
        } else {
        	request.setAttribute("error", "Registration failed. Please try again.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("Registration.jsp");
            dispatcher.forward(request, response);
        }
    }
}
