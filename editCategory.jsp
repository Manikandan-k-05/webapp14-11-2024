<%@ page import="dao.CategoryDAO, bean.CategoryBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.sql.*" %>

<%
    String email = (String) session.getAttribute("userEmail");

    if (email == null) {
        response.sendRedirect("log.jsp");
        return; // Exit the page
    }

    // Get categoryId from request
    String categoryId = request.getParameter("categoryId");

    // Fetch the category details using CategoryDAO
    CategoryDAO categoryDAO = new CategoryDAO();
    CategoryBean category = null;
    try {
        category = categoryDAO.getCategoryById(Integer.parseInt(categoryId));
    } catch (SQLException e) {
        out.println("Error fetching category: " + e.getMessage());
    }
    
    
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Category - Sports World Admin</title>
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
                <h3>Edit Category</h3>
            </div>
            <div class="card-body">
                <!-- Edit Category Form -->
                <form action="editCategoryAction.jsp" method="POST">
                    <div class="mb-3">
                        <label for="categoryName" class="form-label">Category Name</label>
                        <input type="text" class="form-control" id="categoryName" name="categoryName" 
                               value="<%= category != null ? category.getCategoryName() : "" %>" required>
                    </div>

                    <input type="hidden" name="categoryId" value="<%= category != null ? category.getCategoryId() : "" %>" />

                    <!-- Submit Button -->
                    <div class="text-center mt-4">
                        <button type="submit" class="btn btn-danger w-100">Update Category</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
