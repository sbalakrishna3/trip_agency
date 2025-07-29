package dao;

import model.Trip;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TripDAO {

    public static List<Trip> getAllTrips() throws Exception {
        List<Trip> list = new ArrayList<>();
        String sql = "SELECT * FROM trips ORDER BY id DESC";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Trip t = extractTrip(rs);
                list.add(t);
            }
        }
        return list;
    }

    public static Trip getTripById(int id) throws Exception {
        String sql = "SELECT * FROM trips WHERE id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return extractTrip(rs);
            }
        }
        return null;
    }

    public static boolean addTrip(Trip trip) throws Exception {
        String sql = "INSERT INTO trips (title, description, destination, price, duration, dates, activity_type, image_path) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            setTripParams(ps, trip);
            return ps.executeUpdate() > 0;
        }
    }

    public static boolean updateTrip(Trip trip) throws Exception {
        String sql = "UPDATE trips SET title=?, description=?, destination=?, price=?, duration=?, dates=?, activity_type=?, image_path=? WHERE id=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            setTripParams(ps, trip);
            ps.setInt(9, trip.getId());
            return ps.executeUpdate() > 0;
        }
    }

    public static boolean deleteTrip(int id) throws Exception {
        String sql = "DELETE FROM trips WHERE id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        }
    }

    public static List<Trip> getFilteredTrips(String destination, String activity, String duration, String price) throws Exception {
        List<Trip> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT * FROM trips WHERE 1=1");
        List<Object> params = new ArrayList<>();

        if (destination != null && !destination.trim().isEmpty()) {
            sql.append(" AND LOWER(destination) LIKE ?");
            params.add("%" + destination.toLowerCase() + "%");
        }

        if (activity != null && !activity.trim().isEmpty()) {
            sql.append(" AND LOWER(activity_type) LIKE ?");
            params.add("%" + activity.toLowerCase() + "%");
        }

        if (duration != null && !duration.trim().isEmpty()) {
            try {
                int d = Integer.parseInt(duration.trim());
                sql.append(" AND CAST(duration AS UNSIGNED) <= ?");
                params.add(d);
            } catch (NumberFormatException ignored) {}
        }

        if (price != null && !price.trim().isEmpty()) {
            try {
                double p = Double.parseDouble(price.trim());
                sql.append(" AND price <= ?");
                params.add(p);
            } catch (NumberFormatException ignored) {}
        }

        sql.append(" ORDER BY id DESC");

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql.toString())) {

            for (int i = 0; i < params.size(); i++) {
                ps.setObject(i + 1, params.get(i));
            }

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(extractTrip(rs));
            }
        }

        return list;
    }


    private static Trip extractTrip(ResultSet rs) throws SQLException {
        Trip t = new Trip();
        t.setId(rs.getInt("id"));
        t.setTitle(rs.getString("title"));
        t.setDescription(rs.getString("description"));
        t.setDestination(rs.getString("destination"));
        t.setPrice(rs.getDouble("price"));
        t.setDuration(rs.getString("duration"));
        t.setDates(rs.getString("dates"));
        t.setActivityType(rs.getString("activity_type"));
        t.setImagePath(rs.getString("image_path"));
        return t;
    }

    private static void setTripParams(PreparedStatement ps, Trip trip) throws SQLException {
        ps.setString(1, trip.getTitle());
        ps.setString(2, trip.getDescription());
        ps.setString(3, trip.getDestination());
        ps.setDouble(4, trip.getPrice());
        ps.setString(5, trip.getDuration());
        ps.setString(6, trip.getDates());
        ps.setString(7, trip.getActivityType());
        ps.setString(8, trip.getImagePath());
    }
}
