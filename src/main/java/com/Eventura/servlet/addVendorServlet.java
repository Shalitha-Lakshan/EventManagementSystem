package com.Eventura.servlet;

import com.Eventura.model.Vendor;
import com.Eventura.services.VendorService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/addVendorServlet")
public class addVendorServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public addVendorServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Vendor ven = new Vendor();

        ven.setVendorName(request.getParameter("vendorName"));
        ven.setEmail(request.getParameter("email"));
        ven.setPhone(request.getParameter("phone"));
        ven.setNic(request.getParameter("nic"));
        ven.setServiceType(request.getParameter("serviceType"));
        ven.setPassword(request.getParameter("password"));

        VendorService service = new VendorService();
        service.regVendor(ven);

        response.sendRedirect("vendorManagement.jsp"); // Or wherever you want to redirect
    }
}
