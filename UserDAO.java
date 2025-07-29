package dao;

import model.User;

import java.sql.*;

public class UserDAO {

    public static boolean register(User user) throws Exception {
        String sql = "INSERT INTO users(name, email, password, profile_pic, role) VALUES (?, ?, ?, ?, 'user')";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getProfilePic());
            return ps.executeUpdate() > 0;
        }
    }

    public static User login(String email, String password) throws Exception {
        String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setName(rs.getString("name"));
                u.setEmail(rs.getString("email"));
                u.setPassword(rs.getString("password"));
                u.setProfilePic(rs.getString("profile_pic"));
                u.setRole(rs.getString("role"));
                return u;
            }
        }
        return null;
    }
}
