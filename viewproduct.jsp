<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String email = (String) session.getAttribute("userEmail");

    if (email == null) {
        response.sendRedirect("log.jsp");
        return;  // Exit the page
    }

    out.print(email);  // Display the email if session is valid
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Product - Sports World Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
    <div class="container mt-5">
        <h2 class="text-center text-danger">Product Details</h2>
        
        <!-- Product Image -->
        <div class="text-center mb-4">
            <img src="images/sample-product.jpg" alt="Product Image" class="img-fluid" style="max-width: 300px;">
        </div>
        
        <!-- Product Details -->
        <table class="table table-bordered">
            <tr>
                <th>Product ID</th>
                <td>1</td>
            </tr>
            <tr>
                <th>Product Name</th>
                <td>Football</td>
            </tr>
            <tr>
                <th>Category</th>
                <td>Sports</td>
            </tr>
            <tr>
                <th>Price</th>
                <td>$29.99</td>
            </tr>
            <tr>
                <th>Stock</th>
                <td>Available</td>
            </tr>
            <tr>
                <th>Description</th>
                <td>This is a high-quality football, perfect for outdoor games.</td>
            </tr>
        </table>
        
        <!-- Back to Products Button -->
        <div class="text-center mt-4">
            <a href="products.jsp" class="btn btn-danger">Back to Products</a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
