<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
<link rel="stylesheet" href="css/bootstrap.min.css" >
<link rel="stylesheet" href="css/headerFooter.css">

</head>
<body>
	<header class="hero-section">
    <div class="overlay"></div>

    <nav id="mainNavbar" class="navbar navbar-expand-lg">
      <div class="container-fluid">
        <a class="navbar-brand d-flex align-items-center" href="#">Eventura</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-center" id="navbarNavDropdown">
          <ul class="navbar-nav mx-auto text-center">
            <li class="nav-item"><a class="nav-link active" aria-current="page" href="#">Home</a></li>
            <li class="nav-item"><a class="nav-link" href="#">Services</a></li>
            <li class="nav-item"><a class="nav-link" href="#">About us</a></li>
            <li class="nav-item"><a class="nav-link" href="#">Contact</a></li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">Category</a>
              <ul class="dropdown-menu text-center">
                <li><a class="dropdown-item" href="#">Wedding</a></li>
                <li><a class="dropdown-item" href="#">Party</a></li>
                <li><a class="dropdown-item" href="#">Birthday</a></li>
              </ul>
            </li>
            <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
          </ul>
        </div>
      </div>
    </nav>

    <div class="content text-white d-flex flex-column align-items-center justify-content-center h-100 text-center">
      <p class="subheading">Welcome to Eventura</p>
      <h1 class="display-4 fw-bold">We craft unforgettable moments<br>for your perfect event</h1>
      <a href="#" class="btn btn-outline-light mt-3">Login</a>
    </div>
  </header>

 

 
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
 <script src="js/headerF.js"></script>
</body>
</html>