<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>

    <link rel="icon" type="image/png" href="images/login.png">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
	<link rel="stylesheet" href="css/login.css">
    <style>
        body {
            background-color: #f4f6f9;
            font-family: 'Segoe UI', sans-serif;
        }

        .login-container {
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-box {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 400px;
        }

        .login-box h4 {
            text-align: center;
            margin-bottom: 25px;
        }

        .form-check-label {
            margin-left: 5px;
        }

        .form-links {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
        }

        .btn-login {
            background-color: #1877f2;
            color: white;
            width: 100%;
            height: 45px;
            border: none;
        }

        .btn-login:hover {
            background-color: #145dbf;
        }

        .register-link {
            text-align: center;
            margin-top: 15px;
        }

        .register-link a {
            color: #1877f2;
            text-decoration: none;
        }

        .register-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<header>
  <nav id="mainNavbar" class="navbar navbar-expand-lg navbar-dark bg-dark py-3 shadow-sm">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">Eventura</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
        aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse justify-content-center" id="navbarNavDropdown">
        <ul class="navbar-nav text-center">
          <li class="nav-item">
            <a class="nav-link" aria-current="page" href="#">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Services</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">About us</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Contact</a>
          </li>
          <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">Category</a>
              <ul class="dropdown-menu text-center">
                <li><a class="dropdown-item" href="#">Wedding</a></li>
                <li><a class="dropdown-item" href="#">Party</a></li>
                <li><a class="dropdown-item" href="#">Birthday</a></li>
              </ul>
            </li>
          
        </ul>
      </div>
    </div>
  </nav>
</header>



<div class="login-container">
    <div class="login-box">
        <h4>Login</h4>
        <form action="${pageContext.request.contextPath}/login" method="post">
            <div class="form-group mb-3">
                <label>Email</label>
                <input type="email" class="form-control" name="email" placeholder="Enter email" required>
            </div>

            <div class="form-group mb-3">
                <label>Password</label>
                <input type="password" class="form-control" name="password" placeholder="Enter password" required>
            </div>
            
            <c:if test="${not empty errorMessage}">
                <div class="alert alert-danger ">${errorMessage}</div>
            </c:if>

            <div class="form-links mb-3">
                <div class="form-check">
                    <input type="checkbox" class="form-check-input" id="rememberMe" name="rememberMe">
                    <label class="form-check-label" for="rememberMe">Remember Me</label>
                </div>
                <a href="#">Forgot Password?</a>
            </div>

            <button type="submit" class="btn btn-login">Login</button>

            <div class="register-link">
                Don't have an account? <a href="Registration.jsp">Register</a>
            </div>
        </form>
    </div>
</div>

<footer class="bg-dark text-light pt-5 pb-4">
    <div class="container text-md-start text-center">
      <div class="row">
        <div class="col-md-3 mb-4">
          <h5 class="fw-bold">THE BEAUTY LOFT</h5>
          <p class="small">This Shop Started By Maduwanthi<br>D.R.P</p>
          <div class="d-flex mt-3">
            <a href="https://twitter.com" target="_blank" rel="noopener" class="text-white me-3">
              <i class="fab fa-twitter fa-lg"></i>
            </a>
            <a href="https://facebook.com" target="_blank" rel="noopener" class="text-white me-3">
              <i class="fab fa-facebook-f fa-lg"></i>
            </a>
            <a href="https://instagram.com" target="_blank" rel="noopener" class="text-white">
              <i class="fab fa-instagram fa-lg"></i>
            </a>
          </div>
        </div>
        <div class="col-md-3 mb-4">
          <h5 class="fw-bold">INFORMATION</h5>
          <ul class="list-unstyled">
            <li><a href="#" class="text-white text-decoration-none">FAQs</a></li>
            <li><a href="#" class="text-white text-decoration-none">Privacy</a></li>
            <li><a href="#" class="text-white text-decoration-none">Terms Condition</a></li>
          </ul>
        </div>
        <div class="col-md-3 mb-4">
          <h5 class="fw-bold">LINKS</h5>
          <ul class="list-unstyled">
            <li><a href="#" class="text-white text-decoration-none">Home</a></li>
            <li><a href="#" class="text-white text-decoration-none">About</a></li>
            <li><a href="#" class="text-white text-decoration-none">Services</a></li>
            <li><a href="#" class="text-white text-decoration-none">Events</a></li>
            <li><a href="#" class="text-white text-decoration-none">Contact</a></li>
          </ul>
        </div>
        <div class="col-md-3 mb-4">
          <h5 class="fw-bold">HAVE A QUESTION?</h5>
          <ul class="list-unstyled small">
            <li class="mb-2"><i class="fas fa-map-marker-alt me-2"></i> Colombo 05</li>
            <li class="mb-2"><i class="fas fa-phone-alt me-2"></i> +9474 196 4705</li>
            <li><i class="fas fa-envelope me-2"></i> Eventura@gmail.com</li>
          </ul>
        </div>
      </div>
    </div>
  </footer>
	


<script src="js/bootstrap.bundle.min.js"></script>


</body>
</html>
