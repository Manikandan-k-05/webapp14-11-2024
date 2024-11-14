<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, dao.CategoryDAO, bean.CategoryBean"%>
<%
    String email = (String) session.getAttribute("userEmail");

    if (email == null) {
        response.sendRedirect("log.jsp");
        return; // Exit the page
    }

    CategoryDAO categoryDAO = new CategoryDAO();
    List<CategoryBean> categories = categoryDAO.getCategories();
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Category Management - Sports World Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .text-danger {
            color: #dc3545 !important;
        }

        .card-header, .btn-danger {
            background-color: #dc3545;
            border-color: #dc3545;
        }

        .card {
            width: 100%;
            max-width: 500px;
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
    </style>
</head>

<body>
    <!-- Category Management Section -->
    <div class="container">
        <div class="card shadow-lg">
            <div class="card-header text-center text-white">
                <h3>Category Management</h3>
            </div>
            <div class="card-body">
                <!-- Add Category Form -->
                <form action="addCategoryAction.jsp" method="post">
                    <div class="mb-3">
                        <label for="categoryName" class="form-label">Category Name</label>
                        <input type="text" class="form-control" id="categoryName" name="categoryName" required>
                    </div>
                    <div class="text-center mt-4">
                        <button type="submit" class="btn btn-danger w-100">Add Category</button>
                    </div>
                </form>

                <hr>

                
               
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
