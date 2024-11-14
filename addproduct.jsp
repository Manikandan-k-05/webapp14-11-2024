<%@ page import="dao.ProductDAO, dao.CategoryDAO, bean.CategoryBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.sql.*" %>

<%
    String email = (String) session.getAttribute("userEmail");

    if (email == null) {
        response.sendRedirect("log.jsp");
        return; // Exit the page
    }

    // Fetch all stock statuses
    ProductDAO productDAO = new ProductDAO();
    List<String> stockStatuses = productDAO.getAllStockStatuses();

    // Fetch categories from the database
    List<CategoryBean> categories = new ArrayList<>();
    CategoryDAO categoryDAO = new CategoryDAO();

    try {
        categories = categoryDAO.getCategories();  // Call the method to get categories from DB
    } catch (SQLException e) {
        out.println("Error fetching categories: " + e.getMessage());
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Product - Sports World Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .text-danger {
            color: #dc3545 !important;
        }

        .card-header, .btn-danger {
            background-color: #dc3545;
            border-color: #dc3545;
        }
    </style>
</head>

<body>
    <div class="container d-flex justify-content-center align-items-center vh-100">
        <div class="card shadow-lg" style="width: 100%; max-width: 500px;">
            <div class="card-header text-center text-white">
                <h3>Add New Product</h3>
            </div>
            <div class="card-body">
                <!-- Product Form -->
                <form action="productAction.jsp" method="post" enctype="multipart/form-data">
                    <div class="mb-3">
                        <label for="productName" class="form-label">Product Name</label>
                        <input type="text" class="form-control" id="productName" name="productName" required>
                    </div>
                    
                    
                    <!-- Category -->
                    <div class="mb-3">
                        <label for="category" class="form-label">Category</label>
                        <select class="form-select" id="category" name="category" required>
                            <option value="">Select Category</option>
                            <%-- Loop through the categories and create an option for each --%>
                            <%
                            if (categories != null) {
                                for (CategoryBean category : categories) {
                            %>
                            <option value="<%=category.getCategoryName()%>"><%=category.getCategoryId()%></option>
                            <%
                                }
                            }
                            %>
                        </select>
                    </div>



                    <div class="mb-3">
                        <label for="stock" class="form-label">Stock Status</label>
                        <select class="form-select" id="stock" name="stock" required>
                            <option value="">Select Stock Status</option>
                            <%-- Loop through the list of stock statuses and create an option for each --%>
                            <%
                            if (stockStatuses != null) {
                                for (String status : stockStatuses) {
                            %>
                            <option value="<%=status%>"><%=status%></option>
                            <%
                                }
                            }
                            %>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label for="price" class="form-label">Price</label>
                        <input type="number" step="0.01" class="form-control" id="price" name="price" required>
                    </div>

                    <div class="mb-3">
                        <label for="description" class="form-label">Description</label>
                        <textarea class="form-control" id="description" name="description" rows="3" required></textarea>
                    </div>

                    <!-- Image Upload -->
                    <div class="mb-3">
                        <label for="productImage" class="form-label">Product Image</label>
                        <input type="file" class="form-control" id="productImage" name="productImage" accept="image/*" required>
                    </div>

                    <!-- Submit Button -->
                    <div class="text-center mt-4">
                        <button type="submit" class="btn btn-danger w-100">Add Product</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
