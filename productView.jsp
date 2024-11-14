<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dao.*,bean.*, java.util.*, java.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    // Fetch categories from the database
    List<ProductBean> productBeans = new ArrayList<>();
    ProductDAO productDAO = new ProductDAO();

    try {
        productBeans = productDAO.getAllProducts(); // Call the method to get categories from DB
        request.setAttribute("products", productBeans);  // Set the product list as a request attribute
    } catch (SQLException e) {
        out.println("Error fetching products: " + e.getMessage());
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product View</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .product-card {
            margin: 20px;
        }
        .product-card img {
            height: 200px;
            object-fit: cover;
        }
        .product-card .card-body {
            text-align: center;
        }
        .product-card .card-title {
            font-size: 1.2rem;
        }
        .product-card .card-price {
            font-size: 1.1rem;
            color: #28a745;
        }
    </style>
</head>
<body>
  <!-- Products Section -->
<div class="container my-5">
    <h2 class="text-center text-danger mb-4">Popular Products</h2>
    <div class="row">
        <!-- Loop through the products and display each one -->
        <c:forEach var="product" items="${products}">
            <div class="col-md-4 mb-4">
                <div class="card product-card">
                    <!-- Display product image -->
                    <img src="uploads/${product.productImage}" class="card-img-top" alt="${product.productName}">
                    <div class="card-body text-center">
                        <!-- Display product name -->
                        <h5 class="card-title">${product.productName}</h5>
                        <!-- Display product description -->
                        <p class="card-text">${product.description}</p>
                        <!-- Link to buy product -->
                        <a href="#" class="btn btn-danger">Buy Now</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
