<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Registration</title>

   
    <link rel="icon" type="image/png" href="images/website.png">

    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        body {
            background-color: #f4f6f9;
            font-family: 'Segoe UI', sans-serif;
        }

        .register-container {
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .register-box {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 450px;
        }

        .register-box h4 {
            text-align: center;
            margin-bottom: 25px;
        }

        .btn-register {
            background-color: #1877f2;
            color: white;
            width: 100%;
            height: 45px;
            border: none;
        }

        .btn-register:hover {
            background-color: #145dbf;
        }

        .login-link {
            text-align: center;
            margin-top: 15px;
        }

        .login-link a {
            color: #1877f2;
            text-decoration: none;
        }

        .login-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="register-container">
    <div class="register-box">
        <h4>REGISTER</h4>
        <form action="RegisterServlet" method="post"  enctype="multipart/form-data">
            <div class="form-group mb-3">
                <label>Full Name</label>
                <input type="text" class="form-control" name="name" placeholder="Enter full name" required>
            </div>

            <div class="form-group mb-3">
                <label>Email</label>
                <input type="email" class="form-control" name="email" placeholder="Enter email" required>
            </div>

            <div class="form-group mb-3">
                <label>Password</label>
                <input type="password" class="form-control" name="password" placeholder="Enter password" required>
            </div>
            
            <div class="form-group mb-3">
                <label>Confirm Password</label>
                <input type="password" class="form-control" name="confirmPassword" placeholder="ReEnter password" required>
            </div>

            <div class="form-group mb-3" >
                <label>Role</label>
                <select class="form-control"  name= "role">
  					<option disabled selected hidden >Select role</option>
  					<option value="User">User</option>
                    <option value="Admin">Admin</option>
				</select>
            </div>
            
            <div class="form-group mb-3">
	            <label for="profilePic">Profile Picture</label>
	            <input class="form-control-file" type="file" name="profilePic" accept="image/*">
       		</div>
            
             <c:if test="${not empty error}">
                <div class="alert alert-danger ">${error}</div>
            </c:if>

            <button type="submit" class="btn btn-register">Register</button>

            <div class="login-link">
                Already have an account? <a href="login.jsp">Login</a>
            </div>
        </form>
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
