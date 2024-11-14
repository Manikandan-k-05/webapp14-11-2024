<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>

<%
String email = (String) session.getAttribute("userEmail");

if (email == null) {
	response.sendRedirect("log.jsp");
	return; // Exit the page
}

out.print(email); // Display the email if session is valid

// Fetch the data
ProductDAO productDAO = new ProductDAO();
int totalProducts = productDAO.getCountProducts(); // Assuming the method is implemented in ProductDAO
/*   double totalSales = productDAO.getTotalSales(); // Method to get total sales amount
  int totalOrders = productDAO.getTotalOrders(); */
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Dashboard - Sports World</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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

#overviewBarChart {
	width: 80% !important; /* 80% width of the container */
	height: 300px !important; /* Set the height to 300px */
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
				<nav
					class="navbar navbar-expand-lg navbar-light bg-light shadow-sm mb-4">
					<a class="navbar-brand text-danger" href="#">Sports World Admin</a>
				</nav>

				<!-- Admin Dashboard -->
				<h2 class="text-center text-danger mb-4">Admin Dashboard</h2>

				<!-- Dashboard Overview -->
				<div class="row">
					<!-- Total Sales Card -->
					<div class="col-md-6 col-xl-4">
						<div class="card shadow-sm mb-4">
							<div class="card-header bg-danger text-white">
								<h5>Total Sales</h5>
							</div>
							<div class="card-body">
								<h3>
									&#8377; <%=20000%></h3>
								<!-- Display total sales -->
								<p>In the last month</p>
							</div>
						</div>
					</div>

					<!-- Total Products Card -->
					<div class="col-md-6 col-xl-4">
						<div class="card shadow-sm mb-4">
							<div class="card-header bg-danger text-white">
								<h5>Total Products</h5>
							</div>
							<div class="card-body">
								<h3><%=totalProducts%></h3>
								<!-- Display total products -->
								<p>In the last month</p>
							</div>
						</div>
					</div>

					<!-- Total Orders Card -->
					<div class="col-md-6 col-xl-4">
						<div class="card shadow-sm mb-4">
							<div class="card-header bg-danger text-white">
								<h5>Total Orders</h5>
							</div>
							<div class="card-body">
								<h3><%=500%></h3>
								<!-- Display total orders -->
								<p>In the last month</p>
							</div>
						</div>
					</div>

					<!-- Bar Chart Representation -->
					<div class="col-md-12 col-xl-12">
						<div class="card shadow-sm mb-4">
							<div class="card-header bg-danger text-white">
								<h5>Dashboard Overview</h5>
							</div>
							<div class="card-body">
								<!-- Set width and height here -->
								<canvas id="overviewBarChart" style="width: 80%; height: 300px;"></canvas>
							</div>
						</div>
					</div>


					<script>
						var ctx = document.getElementById('overviewBarChart')
								.getContext('2d');
						var overviewBarChart = new Chart(ctx, {
							type : 'bar', // Change to 'bar' for bar chart
							data : {
								labels : [ 'Total Sales', 'Total Products',
										'Total Orders' ], // Labels for the bars
								datasets : [ {
									label : 'Overview',
									data : [
					<%=500%>
						,
					<%=totalProducts%>
						,
					<%=20000%>
						], // Pass dynamic data
									backgroundColor : [ '#dc3545', '#ffc107',
											'#28a745' ], // Colors for each bar
									borderColor : '#fff',
									borderWidth : 1
								} ]
							},
							options : {
								responsive : true,
								scales : {
									y : {
										beginAtZero : true
									// Start Y axis at 0
									}
								}
							}
						});
					</script>


					<script
						src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
