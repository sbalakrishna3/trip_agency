<!DOCTYPE html>
<html>
<head>
  <title>User Register</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    .register-container {
      max-width: 500px;
      margin: 0 auto;
      padding: 2rem;
      border-radius: 10px;
      box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
      background-color: #fff;
    }
    
    .form-control:focus {
      border-color: #007bff;
      box-shadow: 0 0 0 0.25rem rgba(0, 123, 255, 0.25);
    }
    
    .btn-register {
      background-color: #007bff;
      border: none;
      padding: 10px 0;
      font-weight: 500;
      transition: all 0.3s;
    }
    
    .btn-register:hover {
      background-color: #0069d9;
    }
    
    .login-link {
      color: #007bff;
      text-decoration: none;
      font-weight: 500;
    }
    
    .login-link:hover {
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
    
    .file-input-label {
      display: block;
      margin-bottom: 0.5rem;
      font-weight: 500;
    }
  </style>
</head>
<body>
  <jsp:include page="header.jsp" />
  
  <main>
    <div class="container">
      <div class="register-container">
        <h3 class="text-center mb-4">User Register</h3>
        <form action="register" method="post" enctype="multipart/form-data">
          <div class="mb-3">
            <input name="name" type="text" placeholder="Name" class="form-control" required>
          </div>
          <div class="mb-3">
            <input name="email" type="email" placeholder="Email" class="form-control" required>
          </div>
          <div class="mb-3">
            <input name="password" type="password" placeholder="Password" class="form-control" required>
          </div>
          <div class="mb-4">
            <label class="file-input-label">Profile Picture</label>
            <input name="profilePic" type="file" accept="image/*" class="form-control" required>
          </div>
          <button class="btn btn-register w-100">Register</button>
          <div class="text-center mt-3">
            <p>Already have an account? <a href="login.jsp" class="login-link">Login here</a></p>
          </div>
        </form>
      </div>
    </div>
  </main>
  
  <jsp:include page="footer.jsp" />
</body>
</html>