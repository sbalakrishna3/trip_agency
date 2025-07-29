package controller;

import dao.TripDAO;
import model.Trip;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;

@WebServlet("/adminTrip")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,
    maxFileSize = 5 * 1024 * 1024,
    maxRequestSize = 10 * 1024 * 1024
)
public class AdminTripServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String action = request.getParameter("action");

            if ("add".equals(action) || "edit".equals(action)) {
                Trip trip = new Trip();

                if ("edit".equals(action)) {
                    trip.setId(Integer.parseInt(request.getParameter("id")));
                }

                // Set common fields
                trip.setTitle(request.getParameter("title"));
                trip.setDescription(request.getParameter("description"));
                trip.setDestination(request.getParameter("destination"));
                trip.setDuration(request.getParameter("duration"));
                trip.setPrice(Double.parseDouble(request.getParameter("price")));
                trip.setDates(request.getParameter("dates"));
                trip.setActivityType(request.getParameter("activityType"));

                // Handle optional image upload
                Part filePart = request.getPart("image");
                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

                if (fileName != null && !fileName.isEmpty()) {
                    String uploadDir = getServletContext().getRealPath("") + File.separator + "trip_images";
                    File uploadFolder = new File(uploadDir);
                    if (!uploadFolder.exists()) uploadFolder.mkdirs();

                    String filePath = uploadDir + File.separator + fileName;
                    filePart.write(filePath);

                    trip.setImagePath("trip_images/" + fileName);
                } else if ("edit".equals(action)) {
                    // Keep existing image if no new file provided
                    Trip existingTrip = TripDAO.getTripById(trip.getId());
                    trip.setImagePath(existingTrip.getImagePath());
                }

                // Perform DB operation
                if ("add".equals(action)) {
                    TripDAO.addTrip(trip);
                } else {
                    TripDAO.updateTrip(trip);
                }
            }

            else if ("delete".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                TripDAO.deleteTrip(id);
            }

            // Always reload updated trip list
            List<Trip> trips = TripDAO.getAllTrips();
            request.setAttribute("tripList", trips);
            request.getRequestDispatcher("manage_trips.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Trip> trips = TripDAO.getAllTrips();
            request.setAttribute("tripList", trips);
            request.getRequestDispatcher("manage_trips.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
