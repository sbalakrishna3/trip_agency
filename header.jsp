<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp">TripAgency</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto">
        <c:choose>
          <c:when test="${not empty sessionScope.admin}">
            <li class="nav-item"><a class="nav-link" href="admin_dashboard.jsp">Admin Dashboard</a></li>
            <li class="nav-item"><a class="nav-link" href="logout">Logout</a></li>
          </c:when>
          <c:when test="${not empty sessionScope.user}">
            <li class="nav-item"><a class="nav-link" href="track">My Trips</a></li>
            <li class="nav-item"><a class="nav-link" href="logout">Logout</a></li>
          </c:when>
          <c:otherwise>
            <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
            <li class="nav-item"><a class="nav-link" href="register.jsp">Register</a></li>
            <li class="nav-item"><a class="nav-link" href="admin_login.jsp">Admin</a></li>
          </c:otherwise>
        </c:choose>
      </ul>
    </div>
  </div>
</nav>
<div style="height:70px"></div>
