package com.Eventura.services;

import com.Eventura.utils.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class AssignmentService {

    public static void assignVendorToEvent(int eventId, int vendorId) {
        String sql = "INSERT INTO event_vendor (event_id, vendor_id) VALUES (?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, eventId);
            stmt.setInt(2, vendorId);
            stmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
