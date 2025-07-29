<!DOCTYPE html>
<html><head>
  <title>Admin Dashboard</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head><body>
<jsp:include page="header.jsp" />
<div class="container my-5 text-center">
  <h2>Welcome, Admin!</h2>
  <div class="mt-4">
    <a href="/M7619_TripAgency/adminTrip" class="btn btn-primary">Manage Trips</a>
    <a href="logout" class="btn btn-secondary">Logout</a>
  </div>
</div>
<jsp:include page="footer.jsp" />
</body></html>
