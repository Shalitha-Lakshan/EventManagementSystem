package com.Eventura.services;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.Eventura.utils.DBConnection;

public class EventVendorService {
    public static boolean assignVendorToEvent(int eventId, int vendorId) {
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "INSERT INTO event_vendors (eventId, vendorId) VALUES (?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, eventId);
            ps.setInt(2, vendorId);

            int result = ps.executeUpdate();
            ps.close();
            conn.close();
            return result > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
