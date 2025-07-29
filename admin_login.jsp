<!DOCTYPE html>
<html><head>
  <title>Admin Login</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head><body>
<jsp:include page="header.jsp" />
<div class="container my-5 col-md-6">
  <h3>Admin Login</h3>
  <form action="adminLogin" method="post">
    <input name="email" type="email" placeholder="Admin Email" class="form-control mb-2" required>
    <input name="password" type="password" placeholder="Password" class="form-control mb-3" required>
    <button class="btn btn-danger w-100">Login</button>
  </form>
</div>
<jsp:include page="footer.jsp" />
</body></html>
