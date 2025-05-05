package com.Eventura.services;

import java.sql.*;
import com.Eventura.model.User;
import com.Eventura.services.UserService;
import com.Eventura.utils.DBConnection;

public class UserService {
	
    public boolean registerUser(User user) {
        

        try (Connection con = DBConnection.getConnection()) {
        		String sql = "INSERT INTO users (name, email, password, profilePic, role) VALUES (?, ?, ?, ?, ?)";
             PreparedStatement stmt = con.prepareStatement(sql);

            stmt.setString(1, user.getName());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getPassword()); // hash in prod
            stmt.setString(4, user.getProfilePic());
            stmt.setString(5, user.getRole());

           
            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    public User authenticate(String email, String password) {
        User user = null;

        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, email);
            stmt.setString(2, password);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                user = new User(
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("profilePic"),
                        rs.getString("role")  // Get role from DB
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }
} 
