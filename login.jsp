<!DOCTYPE html>
<html>
<head>
  <title>User Login</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    .login-container {
      max-width: 500px;
      margin: 0 auto;
      padding: 2rem;
      border-radius: 10px;
      box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
      background-color: #fff;
    }
    
    .form-control:focus {
      border-color: #28a745;
      box-shadow: 0 0 0 0.25rem rgba(40, 167, 69, 0.25);
    }
    
    .btn-login {
      background-color: #28a745;
      border: none;
      padding: 10px 0;
      font-weight: 500;
      transition: all 0.3s;
    }
    
    .btn-login:hover {
      background-color: #218838;
    }
    
    .register-link {
      color: #28a745;
      text-decoration: none;
      font-weight: 500;
    }
    
    .register-link:hover {
      text-decoration: underline;
    }
    
    body {
      background-color: #f8f9fa;
      display: flex;
      flex-direction: column;
      min-height: 100vh;
    }
    
    main {
      flex: 1;
      display: flex;
      align-items: center;
    }
  </style>
</head>
<body>
  <jsp:include page="header.jsp" />
  
  <main>
    <div class="container">
      <div class="login-container">
        <h3 class="text-center mb-4">User Login</h3>
        <form action="login" method="post">
          <div class="mb-3">
            <input name="email" type="email" placeholder="Email" class="form-control" required>
          </div>
          <div class="mb-4">
            <input name="password" type="password" placeholder="Password" class="form-control" required>
          </div>
          <button class="btn btn-login w-100">Login</button>
          <div class="text-center mt-3">
            <p>Don't have an account? <a href="register.jsp" class="register-link">Register here</a></p>
          </div>
        </form>
      </div>
    </div>
  </main>
  
  <jsp:include page="footer.jsp" />
</body>
</html>