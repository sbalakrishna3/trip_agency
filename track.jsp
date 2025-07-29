<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <title>My Bookings</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="header.jsp" />

<div class="container my-4">

  <!-- 👤 User Profile Section -->
  <h3>My Profile</h3>
  <div class="mb-4 d-flex align-items-center">
    <img src="${user.profilePic}" 
         alt="Profile Picture" 
         class="rounded-circle me-3" 
         style="width: 80px; height: 80px; object-fit: cover;">
    <div>
      <p><strong>Name:</strong> ${user.name}</p>
      <p><strong>Email:</strong> ${user.email}</p>
    </div>
  </div>
  <hr/>

  <!-- 📌 Bookings Section -->
  <h3>My Booked Trips</h3>
  <c:choose>
    <c:when test="${empty bookings}">
      <p>No bookings yet. Browse some trips!</p>
    </c:when>
    <c:otherwise>
      <table class="table">
        <thead>
          <tr>
            <th>Trip</th>
            <th>Destination</th>
            <th>Participants</th>
            <th>Booking Date</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="b" items="${bookings}">
            <tr>
              <td>${b.tripDetails.title}</td>
              <td>${b.tripDetails.destination}</td>
              <td>${b.participants}</td>
              <td>${b.bookingDate}</td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </c:otherwise>
  </c:choose>

</div>

<jsp:include page="footer.jsp" />
</body>
</html>
