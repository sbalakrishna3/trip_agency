package controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BookingDAO;
import model.Booking;
import model.User;

@WebServlet("/bookTrip")
public class BookingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            if (user == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            int tripId = Integer.parseInt(request.getParameter("tripId"));
            int participants = Integer.parseInt(request.getParameter("participants"));

            Booking booking = new Booking();
            booking.setTripId(tripId);
            booking.setUserId(user.getId());
            booking.setParticipants(participants);
            booking.setBookingDate(new Date());

            BookingDAO.addBooking(booking);
            response.sendRedirect("/M7619_TripAgency/track?success=1");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
