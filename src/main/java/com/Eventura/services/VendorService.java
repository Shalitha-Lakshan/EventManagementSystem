package com.Eventura.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import com.Eventura.model.Vendor;
import com.Eventura.utils.DBConnection;

public class VendorService {

    public void regVendor(Vendor ven) {
        try {
            Connection conn = DBConnection.getConnection();

            String query = "INSERT INTO vendors (vendor_name, email, phone, nic, service_type, password) VALUES (?, ?, ?, ?, ?, ?)";

            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, ven.getVendorName());
            stmt.setString(2, ven.getEmail());
            stmt.setString(3, ven.getPhone());
            stmt.setString(4, ven.getNic());
            stmt.setString(5, ven.getServiceType());
            stmt.setString(6, ven.getPassword());

            stmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
