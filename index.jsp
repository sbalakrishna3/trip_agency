<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>

<%
    if (request.getAttribute("trips") == null) {
        response.sendRedirect("tripList");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
  <title>Explore Trips</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<jsp:include page="header.jsp" />

<div class="container my-4">
  <h2>Explore Trips</h2>

  <!-- Search Form -->
  <form class="row g-3 mb-4" method="get" action="tripList">
    <div class="col-md"><input name="destination" placeholder="Destination" class="form-control"/></div>
    <div class="col-md"><input name="activity" placeholder="Activity Type" class="form-control"/></div>
    <div class="col-md"><input name="duration" placeholder="Days" class="form-control"/></div>
    <div class="col-md"><input name="price" placeholder="Max Price" type="number" class="form-control"/></div>
    <div class="col-md"><button class="btn btn-primary w-100">Search</button></div>
  </form>

  <!-- Trip Cards -->
  <div class="row">
    <c:forEach var="t" items="${trips}">
      <div class="col-md-4 mb-4">
        <div class="card h-100">
          <img src="${t.imagePath}" class="card-img-top" alt="${t.title}">
          <div class="card-body">
            <h5 class="card-title">${t.title}</h5>
            <p class="card-text">${t.destination} | £${t.price}</p>
            <button class="btn btn-outline-primary w-100" data-bs-toggle="modal" data-bs-target="#tripModal${t.id}">View & Book</button>
          </div>
        </div>
      </div>

      <!-- Modal with Booking Form -->
      <div class="modal fade" id="tripModal${t.id}" tabindex="-1" aria-labelledby="tripModalLabel${t.id}" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
          <div class="modal-content">
            <form method="post" action="bookTrip">
              <div class="modal-header">
                <h5 class="modal-title" id="tripModalLabel${t.id}">${t.title}</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <img src="${t.imagePath}" class="img-fluid mb-3" alt="${t.title}">
                <p><strong>Destination:</strong> ${t.destination}</p>
                <p><strong>Duration:</strong> ${t.duration}</p>
                <p><strong>Dates:</strong> ${t.dates}</p>
                <p><strong>Activity:</strong> ${t.activityType}</p>
                <p><strong>Price:</strong> £${t.price}</p>
                <p>${t.description}</p>

                <input type="hidden" name="tripId" value="${t.id}" />

                <div class="mb-3">
                  <label for="participants${t.id}" class="form-label">Number of Participants</label>
                  <input type="number" name="participants" id="participants${t.id}" class="form-control" min="1" required>
                </div>
              </div>
              <div class="modal-footer">
                <button type="submit" class="btn btn-primary">Book Now</button>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
              </div>
            </form>
          </div>
        </div>
      </div>

    </c:forEach>
  </div>
</div>

<jsp:include page="footer.jsp" />

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/scripts.js"></script>
</body>
</html>
