<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="model.Booking,java.util.List" %>
<%
  List<Booking> bookings = (List<Booking>) request.getAttribute("bookings");
%>
<!DOCTYPE html>
<html><head>
  <title>Booked Users</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head><body>
<div class="container my-3">
  <h4>Bookings for Trip</h4>
  <table class="table">
    <thead><tr><th>User</th><th>Participants</th><th>Date</th></tr></thead>
    <tbody>
      <c:forEach var="b" items="${bookings}">
        <tr><td>${b.tripDetails.title}</td><td>${b.participants}</td><td>${b.bookingDate}</td></tr>
      </c:forEach>
    </tbody>
  </table>
</div>
</body></html>
