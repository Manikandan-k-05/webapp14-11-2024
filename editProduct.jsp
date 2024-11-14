<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page
	import="bean.ProductBean, dao.ProductDAO, dao.CategoryDAO, bean.CategoryBean, java.sql.*, java.util.*"%>

<%
String email = (String) session.getAttribute("userEmail");

if (email == null) {
	response.sendRedirect("log.jsp");
	return; // Exit the page
}

// Get productId from the request
String productId = request.getParameter("productId");

// Fetch product details from the database using the ProductDAO
ProductDAO productDAO = new ProductDAO();
ProductBean product = null;
try {
	product = productDAO.getProductsById(Integer.parseInt(productId));
} catch (SQLException e) {
	out.println("Error fetching product: " + e.getMessage());
}

// Fetch categories from CategoryDAO
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
<title>Edit Product - Sports World Admin</title>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	rel="stylesheet">
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
						href="productManage.jsp">Products</a></li>
					<li class="nav-item"><a class="nav-link"
						href="customerManage.jsp">Customers</a></li>
					<li class="nav-item"><a class="nav-link" href="logout.jsp">Logout</a></li>
				</ul>
			</div>

			<!-- Main Content -->
			<div class="col-md-9 col-lg-10 p-4">
				<nav
					class="navbar navbar-expand-lg navbar-light bg-light shadow-sm mb-4">
					<a class="navbar-brand text-danger" href="#">Sports World Admin</a>
				</nav>

				<h2 class="text-center text-danger mb-4">Edit Product</h2>

				<!-- Edit Product Form -->
				<form action="editProductAction.jsp" method="POST"
					enctype="multipart/form-data">
					<div class="card">
						<div class="card-header bg-danger text-white">
							<h4>Edit Product Details</h4>
						</div>
						<div class="card-body">
							<!-- Product Name -->
							<div class="mb-3">
								<label for="productName" class="form-label">Product Name</label>
								<input type="text" class="form-control" id="productName"
									name="productName"
									value="<%=product != null ? product.getProductName() : ""%>"
									required>
							</div>

							<!-- Category -->
							<div class="mb-3">
								<label for="category" class="form-label">Category</label> <select
									class="form-select" id="category" name="category" required>
									<option
										value="<%=product != null ? product.getCategory() : ""%>">
										<%=product != null ? product.getCategory() : "Select Category"%>
									</option>
									<!-- Loop through categories and display them -->
									<%
									for (CategoryBean category : categories) {
									%>
									<option value="<%=category.getCategoryName()%>"
										<%=(product != null && product.getCategory().equals(category.getCategoryName())) ? "selected" : ""%>>
										<%=category.getCategoryName()%></option>
									<%
									}
									%>
								</select>
							</div>

							<!-- Price -->
							<div class="mb-3">
								<label for="price" class="form-label">Price</label> <input
									type="number" step="0.01" class="form-control" id="price"
									name="price"
									value="<%=product != null ? product.getPrice() : ""%>" required>
							</div>

							<!-- Stock Status -->
							<div class="mb-3">
								<label for="stock" class="form-label">Stock Status</label> <select
									class="form-select" id="stock" name="stock" required>
									<option value="<%=product != null ? product.getStock() : ""%>">
										<%=product != null ? product.getStock() : "Select Stock Status"%>
									</option>
									<option value="In Stock">In Stock</option>
									<option value="Out of Stock">Out of Stock</option>
								</select>
							</div>

							<!-- Description -->
							<div class="mb-3">
								<label for="description" class="form-label">Description</label>
								<textarea class="form-control" id="description"
									name="description" rows="3" required><%=product != null ? product.getDescription() : ""%></textarea>
							</div>


							<!-- Upload New Image Option -->
							<div class="mb-3">
								<label for="productImage" class="form-label">Upload New
									Image (Optional)</label>
								<div>
									<img
										src="<%=(product != null && product.getProductImage() != null && !product.getProductImage().isEmpty())
		? "uploads/" + product.getProductImage()
		: "uploads/default.jpg"%>"
										alt="Current Product Image" id="currentProductImage"
										class="mt-2 product-image" width="100px" height="100px">
								</div>

								<!-- File input for new image upload -->
								<input type="file" class="form-control" id="productImage"
									name="productImage" accept="image/*">

								<!-- Hidden input to hold the current image path -->
								<input type="hidden" name="currentProductImage"
									value="<%=(product != null) ? product.getProductImage() : ""%>">
							</div>

							<!-- Hidden Product ID -->
							<input type="hidden" name="productId"
								value="<%=product != null ? product.getProductId() : ""%>">

							<!-- Submit Button -->
							<div class="text-center mt-4">
								<button type="submit" class="btn btn-danger w-100">Update
									Product</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
