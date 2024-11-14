<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*, java.sql.*, db.DBconnection, bean.CategoryBean, dao.CategoryDAO"%>

<%
// Check if user is logged in
String email = (String) session.getAttribute("userEmail");
if (email == null) {
    response.sendRedirect("log.jsp");
    return;
}

// Fetch categories from the database
List<CategoryBean> categories = new ArrayList<>();
CategoryDAO categoryDAO = new CategoryDAO();

try {
    categories = categoryDAO.getCategories(); // Call the method to get categories from DB
} catch (SQLException e) {
    out.println("Error fetching categories: " + e.getMessage());
}
%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Category Management - Sports World</title>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
    rel="stylesheet">
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
</style>
</head>

<body>
    <!-- Sidebar and Navbar -->
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
                <!-- Navbar -->
                <nav class="navbar navbar-expand-lg navbar-light bg-light shadow-sm mb-4">
                    <a class="navbar-brand text-danger" href="#">Sports World Admin</a>
                </nav>

                <!-- Category Management -->
                <h2 class="text-center text-danger mb-4">Category Management</h2>

                <!-- Add Category Button -->
                <button class="btn btn-danger mb-3" onclick="window.location.href='addSportsCategory.jsp'">Add New Category</button>

                <!-- Categories Table -->
                <div class="card">
                    <div class="card-header bg-danger text-white">
                        <h4>Category List</h4>
                    </div>
                    <div class="card-body">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Category ID</th>
                                    <th>Category Name</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%-- Loop through categories and display them --%>
                                <%
                                for (CategoryBean category : categories) {
                                %>
                                <tr>
                                    <td><%=category.getCategoryId()%></td>
                                    <td><%=category.getCategoryName()%></td>
                                    <td>
                                        <form action="editCategory.jsp" method="GET" style="display: inline;">
                                            <input type="hidden" name="categoryId" value="<%=category.getCategoryId()%>" />
                                            <button class="btn btn-sm btn-danger" type="submit">Edit</button>
                                        </form>
                                        <form action="deleteCategoryAction.jsp" method="POST" style="display: inline;">
                                            <input type="hidden" name="categoryId" value="<%=category.getCategoryId()%>" />
                                            <button class="btn btn-sm btn-danger" type="submit">Delete</button>
                                        </form>
                                    </td>
                                </tr>
                                <%
                                }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
                 <!-- Categories Table -->
                <div  style="height: 200px">
                  
                            
                </div>
            </div>
        </div>
    </div>
    <div style="height: 150px"></div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
