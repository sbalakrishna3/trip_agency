package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BookingDAO;
import model.Booking;
import model.User;

@WebServlet("/track")
public class TrackServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");

            if (user == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            // method to fetch bookings by user ID
            List<Booking> bookings = BookingDAO.getBookingsByUserId(user.getId());

            // Pass user to the JSP as well for profile info
            request.setAttribute("user", user);
            request.setAttribute("bookings", bookings);

            RequestDispatcher dispatcher = request.getRequestDispatcher("track.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
