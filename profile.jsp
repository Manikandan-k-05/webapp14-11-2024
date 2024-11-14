<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="dao.UserRegistrationDAO"%>
<%@ page import="bean.RegisterBean"%>

<%
String email = (String) session.getAttribute("userEmail");
if (email == null) {
	response.sendRedirect("log.jsp");
	return;
}

// Retrieve user details
UserRegistrationDAO UserRegistrationDAO = new UserRegistrationDAO();
RegisterBean user = UserRegistrationDAO.getUserByEmail(email);
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sports World - Profile</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="style.css">
</head>
<body class="d-flex flex-column min-vh-100">

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
        <a class="navbar-brand text-danger" href="#">Sports World</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <form class="d-flex" action="#" method="get">
                        <input class="form-control mr-2" type="search" placeholder="Search Materials" name="query" aria-label="Search">
                        <button class="btn btn-outline-danger ml-2" type="submit">Search</button>
                    </form>
                </li>
                <li class="nav-item"><a class="nav-link text-danger" href="home.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link text-danger" href="cart.jsp">Cart</a></li>
                <li class="nav-item"><a class="nav-link text-danger" href="logout.jsp">Logout</a></li>
            </ul>
        </div>
    </nav>

    <!-- Profile Section -->
    <div class="container my-5 flex-grow-1">
        <h2 class="text-center text-danger mb-4">User Profile</h2>
        <div class="row justify-content-center">
            <div class="col-md-6">
                <form action="profileAction.jsp" method="post" class="needs-validation" novalidate>
                    <div class="form-group">
                        <label for="email">Email</label> 
                        <input type="email" class="form-control" id="email" name="email" value="<%=user.getRegisterEmail()%>" readonly>
                    </div>
                    <div class="form-group">
                        <label for="contactNumber">Contact Number</label>
                        <input type="text" class="form-control" id="contactNumber" name="contactNumber" value="<%=user.getRegisterPhone()%>" required>
                        <div class="invalid-feedback">Please enter your contact number.</div>
                    </div>
                    <button type="submit" class="btn btn-danger btn-block">Update Profile</button>
                </form>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="bg-danger text-white text-center py-3 mt-auto">
        <p>&copy; 2024 Sports World. All Rights Reserved.</p>
    </footer>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Form Validation Script -->
    <script>
        (function() {
            'use strict';
            window.addEventListener('load', function() {
                var forms = document.getElementsByClassName('needs-validation');
                Array.prototype.filter.call(forms, function(form) {
                    form.addEventListener('submit', function(event) {
                        if (form.checkValidity() === false) {
                            event.preventDefault();
                            event.stopPropagation();
                        }
                        form.classList.add('was-validated');
                    }, false);
                });
            }, false);
        })();
    </script>

</body>
</html>
