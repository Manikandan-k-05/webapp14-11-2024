<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="bean.*, dao.*, java.util.*, java.sql.*"%>

<%
    String email = (String) session.getAttribute("userEmail");

    if (email == null) {
        response.sendRedirect("log.jsp");
        return; // Exit the page
    }
    out.print(email); // Display the email if session is valid

    // Fetch products from the database
    List<ProductBean> productBeans = new ArrayList<>();
    ProductDAO productDAO = new ProductDAO();

    try {
        productBeans = productDAO.getAllProducts(); // Call the method to get products from DB
    } catch (SQLException e) {
        out.println("Error fetching products: " + e.getMessage());
    }
    request.setAttribute("products", productBeans); // Set the list in request scope
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Management - Sports World</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .navbar, .card-header.bg-danger {
            background-color: #dc3545 !important;
        }

        .text-danger {
            color: #dc3545 !important;
        }

        .sidebar {
            background-color: #f8f9fa;
        }

        .sidebar-header h4 {
            color: #dc3545;
        }

        .sidebar .nav-link.active {
            background-color: #dc3545;
            color: white;
        }

        .sidebar .nav-link {
            color: #333;
        }

        .sidebar .nav-link:hover {
            background-color: #dc3545;
            color: white;
        }

        .btn-spacing {
            margin-right: 2px; /* Add space between buttons */
        }
    </style>
</head>

<body>
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
			<div class="col-md-3 col-lg-2 p-0 bg-light sidebar">
				<div class="sidebar-header text-center py-4">
					<h4 class="text-danger">Sports World Admin</h4>
				</div>
				<ul class="nav flex-column">
					<li class="nav-item"><a class="nav-link" href="admin.jsp">Dashboard</a></li>
					<li class="nav-item"><a class="nav-link"
						href="categoryManage.jsp">Category</a></li>
					<li class="nav-item"><a class="nav-link"
						href="productManage.jsp">Products</a></li>
					
					<li class="nav-item"><a class="nav-link"
						href="customer.jsp">Customers</a></li>
					
					<li class="nav-item"><a class="nav-link" href="logout.jsp">Logout</a></li>
				</ul>
			</div>

            <!-- Main Content -->
            <div class="col-md-9 col-lg-10 p-4">
                <nav class="navbar navbar-expand-lg navbar-light bg-light shadow-sm mb-4">
                    <a class="navbar-brand text-danger" href="#">Sports World Admin</a>
                </nav>

                <h2 class="text-center text-danger mb-4">Product Management</h2>

                <button class="btn btn-danger mb-3" onclick="window.location.href='addproduct.jsp'">Add New Product</button>

                <!-- Products Table -->
                <div class="card">
                    <div class="card-header bg-danger text-white">
                        <h4>Product List</h4>
                    </div>
                    <div class="card-body">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Product ID</th>
                                    <th>Name</th>
                                    <th>Category</th>
                                    <th>Price</th>
                                    <th>Availability</th>
                                    <th>Description</th>
                                    <th>Image</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- Use JSTL forEach loop to display products -->
                                <c:forEach var="product" items="${products}">
                                    <tr>
                                        <td>${product.productId}</td>
                                        <td>${product.productName}</td>
                                        <td>${product.category}</td> <!-- Updated to categoryName -->
                                        <td>${product.price}</td>
                                        <td>${product.stock}</td>
                                        <td>${product.description}</td>

                                        <td><img src="uploads/${product.productImage}" class="product-image" alt="Product Image" width="100px" height="100px" /></td>

                                        <td>
                                            <form action="editProduct.jsp" method="GET" style="display: inline;">
                                                <input type="hidden" name="productId" value="${product.productId}" />
                                                <button class="btn btn-sm btn-danger btn-spacing">
                                                    <i class="fas fa-edit"></i>
                                                </button>
                                            </form>

                                            <form action="deleteProductAction.jsp" method="POST" style="display: inline;">
                                                <input type="hidden" name="productId" value="${product.productId}" />
                                                <button class="btn btn-sm btn-danger btn-spacing" type="submit">
                                                    <i class="fas fa-trash-alt"></i>
                                                </button>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
