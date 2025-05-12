package com.Eventura.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
  
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false); // avoid creating new if doesn't exist
        if (session != null) {
            session.invalidate(); // invalidate the session
        }
        response.sendRedirect("login.jsp"); // back to login
    }
}


