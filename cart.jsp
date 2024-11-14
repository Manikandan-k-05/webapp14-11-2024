<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
String email = (String) session.getAttribute("userEmail");
out.print(email);
if (email == null) {
	response.sendRedirect("log.jsp");
	return;
}%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sports World - Cart</title>
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
                <li class="nav-item"><a class="nav-link text-danger" href="logout.jsp">Logout</a></li>
            </ul>
        </div>
    </nav>

    <!-- Cart Section -->
    <div class="container my-5 flex-grow-1">
        <h2 class="text-center text-danger mb-4">Shopping Cart</h2>
        <div class="row">
            <div class="col-md-8">
                <!-- Cart Item -->
                <div class="card mb-3">
                    <div class="row no-gutters">
                        <div class="col-md-4">
                            <img src="images/football.jpg" class="card-img" alt="Football">
                        </div>
                        <div class="col-md-8">
                            <div class="card-body">
                                <h5 class="card-title">Football</h5>
                                <p class="card-text">Price: $20</p>
                                <input type="number" class="form-control mb-2" placeholder="Quantity" min="1" value="1">
                                <button class="btn btn-danger btn-sm">Remove</button>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Additional Cart Items -->
                <!-- Repeat this structure for more items -->
                
            </div>

            <!-- Cart Summary -->
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title text-danger">Order Summary</h5>
                        <p>Subtotal: $20</p>
                        <p>Tax: $2</p>
                        <hr>
                        <h5>Total: $22</h5>
                        <a href="#" class="btn btn-danger btn-block">Proceed to Checkout</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="bg-danger text-white text-center py-3 mt-auto">
        <p>&copy; 2024 Sports World. All Rights Reserved.</p>
    </footer>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
