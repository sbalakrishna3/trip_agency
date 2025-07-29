package model;

import java.sql.Timestamp;
import java.util.Date;

public class Booking {
    private int id;
    private int userId;
    private int tripId;
    private int participants;
    private Date bookingDate;
    private Timestamp timestamp;

    private Trip tripDetails;  // Optional: to access trip info while displaying

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public int getTripId() { return tripId; }
    public void setTripId(int tripId) { this.tripId = tripId; }

    public int getParticipants() { return participants; }
    public void setParticipants(int participants) { this.participants = participants; }

    public Date getBookingDate() { return bookingDate; }
    public void setBookingDate(Date bookingDate) { this.bookingDate = bookingDate; }

    public Timestamp getTimestamp() { return timestamp; }
    public void setTimestamp(Timestamp timestamp) { this.timestamp = timestamp; }

    public Trip getTripDetails() { return tripDetails; }
    public void setTripDetails(Trip tripDetails) { this.tripDetails = tripDetails; }
}
