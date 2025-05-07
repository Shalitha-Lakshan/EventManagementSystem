package com.Eventura.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.Eventura.model.Vendor;
import com.Eventura.utils.DBConnection;

public class VendorService {

    // Register a vendor and return the auto-generated ID
    public int regVendor(Vendor ven) {
        int generatedId = -1;

        String query = "INSERT INTO vendors (vendor_name, email, phone, nic, service_type, password) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {

            stmt.setString(1, ven.getVendorName());
            stmt.setString(2, ven.getEmail());
            stmt.setString(3, ven.getPhone());
            stmt.setString(4, ven.getNic());
            stmt.setString(5, ven.getServiceType());
            stmt.setString(6, ven.getPassword());

            int affectedRows = stmt.executeUpdate();

            if (affectedRows > 0) {
                try (ResultSet rs = stmt.getGeneratedKeys()) {
                    if (rs.next()) {
                        generatedId = rs.getInt(1);
                        
                        ven.setVendorID(generatedId);
                    }
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return generatedId;
    }

	public List<Vendor> getAllVendors() {
		 List<Vendor> vendors = new ArrayList<>();
	        String sql = "SELECT * FROM vendor";

	        try (Connection conn = DBConnection.getConnection();
	             Statement stmt = conn.createStatement();
	             ResultSet rs = stmt.executeQuery(sql)) {

	            while (rs.next()) {
	                Vendor v = new Vendor();
	                v.setVendorID(rs.getInt("vendorID"));
	                v.setVendorName(rs.getString("vendorName"));
	                v.setEmail(rs.getString("email"));
	                v.setPhone(rs.getString("phone"));
	                v.setNic(rs.getString("nic"));
	                v.setServiceType(rs.getString("serviceType"));
	                v.setPassword(rs.getString("password"));
	                vendors.add(v);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

		return vendors;
	}

  
}
