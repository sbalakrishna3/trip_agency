package dao;

import model.Booking;
import model.Trip;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookingDAO {

    public static boolean addBooking(Booking b) throws Exception {
        String sql = "INSERT INTO bookings (user_id, trip_id, participants, booking_date) VALUES (?, ?, ?, ?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, b.getUserId());
            ps.setInt(2, b.getTripId());
            ps.setInt(3, b.getParticipants());
            ps.setDate(4, new java.sql.Date(b.getBookingDate().getTime()));
            return ps.executeUpdate() > 0;
        }
    }

    public static List<Booking> getBookingsByUserId(int userId) throws Exception {
        List<Booking> list = new ArrayList<>();
        String sql = "SELECT b.*, t.title, t.destination FROM bookings b JOIN trips t ON b.trip_id = t.id WHERE b.user_id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Booking b = new Booking();
                b.setId(rs.getInt("id"));
                b.setUserId(rs.getInt("user_id"));
                b.setTripId(rs.getInt("trip_id"));
                b.setParticipants(rs.getInt("participants"));
                b.setBookingDate(rs.getDate("booking_date"));

                Trip trip = new Trip();
                trip.setTitle(rs.getString("title"));
                trip.setDestination(rs.getString("destination"));

                b.setTripDetails(trip);
                list.add(b);
            }
        }
        return list;
    }

    public static List<Booking> getBookingsByTripId(int tripId) throws Exception {
        List<Booking> list = new ArrayList<>();
        String sql = "SELECT b.*, u.name, u.email FROM bookings b JOIN users u ON b.user_id = u.id WHERE b.trip_id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, tripId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Booking b = new Booking();
                b.setId(rs.getInt("id"));
                b.setUserId(rs.getInt("user_id"));
                b.setTripId(rs.getInt("trip_id"));
                b.setParticipants(rs.getInt("participants"));
                b.setBookingDate(rs.getDate("booking_date"));
                // Optional fields for admin popup
                Trip t = new Trip();
                t.setTitle(rs.getString("name") + " (" + rs.getString("email") + ")");
                b.setTripDetails(t);
                list.add(b);
            }
        }
        return list;
    }
}
