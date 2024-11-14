<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sports World - Home</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
    <a class="navbar-brand text-danger" href="#">Sports World</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item"><a class="nav-link text-danger" href="log.jsp">Login</a></li>
        </ul>
    </div>
</nav>

<!-- Hero Section -->
<div class="jumbotron text-center text-white hero-section">
    <h1>Welcome to Sports World</h1>
    <p>Your one-stop shop for all sports equipment and gear!</p>
    <a href="#" class="btn btn-danger btn-lg">Shop Now</a>
</div>

<!-- Products Section -->
<div class="container my-5">
    <h2 class="text-center text-danger mb-4">Popular Products</h2>
    <div class="row">
        <!-- Product Card 1 -->
        <div class="col-md-4">
            <div class="card product-card">
                <img src="images/football.jpg" class="card-img-top" alt="Football">
                <div class="card-body text-center">
                    <h5 class="card-title">Football</h5>
                    <p class="card-text">High-quality football for professional use.</p>
                    <a href="#" class="btn btn-danger">Buy Now</a>
                </div>
            </div>
        </div>
        <!-- Product Card 2 -->
        <div class="col-md-4">
            <div class="card product-card">
                <img src="images/tennis-racket.jpg" class="card-img-top" alt="Tennis Racket">
                <div class="card-body text-center">
                    <h5 class="card-title">volleyball</h5>
                    <p class="card-text">Lightweight racket for excellent control.</p>
                    <a href="#" class="btn btn-danger">Buy Now</a>
                </div>
            </div>
        </div>
        <!-- Product Card 3 -->
        <div class="col-md-4">
            <div class="card product-card">
                <img src="images/cricket-bat.jpg" class="card-img-top" alt="Cricket Bat">
                <div class="card-body text-center">
                    <h5 class="card-title">Cricket Bat</h5>
                    <p class="card-text">Premium quality bat for powerful shots.</p>
                    <a href="#" class="btn btn-danger">Buy Now</a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<footer class="bg-danger text-white text-center py-3">
    <p>&copy; 2023 Sports World. All Rights Reserved.</p>
</footer>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
>