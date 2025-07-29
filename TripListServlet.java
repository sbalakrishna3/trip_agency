package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TripDAO;
import model.Trip;

@WebServlet("/tripList")
public class TripListServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String destination = request.getParameter("destination");
            String activity = request.getParameter("activity");
            String duration = request.getParameter("duration");
            String price = request.getParameter("price");

            List<Trip> trips = TripDAO.getFilteredTrips(destination, activity, duration, price);
            request.setAttribute("trips", trips);
            RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
