<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="org.mindrot.jbcrypt.BCrypt"%>
<%@ page import="dao.UserRegistrationDAO"%>
<%@ page import="bean.RegisterBean"%>
<%
String email = (String) session.getAttribute("userEmail");

if (email == null) {
	response.sendRedirect("log.jsp");
	return; // Exit the page
}

out.print(email); // Display the email if session is valid
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sports World - Home</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="style.css">
<style>
/* Ensures carousel images cover the full width and height */
.carousel-item img {
	object-fit: cover;
}

.product-card {
	height: 100%;
	display: flex;
	flex-direction: column;
}

.product-card img {
	height: 200px; /* Fixed height for product images */
	object-fit: cover;
	/* Ensures images cover the defined height without distortion */
}

.product-card .card-body {
	flex: 1; /* Fills remaining space */
	display: flex;
	flex-direction: column;
	justify-content: space-between;
}
</style>
</head>
<body>

	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
		<a class="navbar-brand text-danger" href="#">Sports World</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item">
					<form class="d-flex" action="#" method="get">
						<input class="form-control mr-2" type="search"
							placeholder="Search Materials" name="query" aria-label="Search">
						<button class="btn btn-outline-danger ml-2" type="submit">Search</button>
					</form>
				</li>
				<!-- <li class="nav-item"><a class="nav-link text-danger"
					href="home.jsp">Home</a></li> -->
				<li class="nav-item"><a class="nav-link text-danger"
					href="profile.jsp">Profile</a></li>
				<li class="nav-item"><a class="nav-link text-danger"
					href="cart.jsp">Cart</a></li>
				<li class="nav-item"><a class="nav-link text-danger"
					href="logout.jsp">Logout</a></li>
			</ul>
		</div>
	</nav>


	<!-- Carousel Section -->
	<div id="carouselExampleControls" class="carousel slide"
		data-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img class="d-block w-100" src="image/carosel_2.jpg"
					alt="First slide" width="100%" height="800px">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="image/carosel_1.jpg"
					alt="Second slide" width="100%" height="800px">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="image/carosel_3.jpg"
					alt="Second slide" width="100%" height="800px">
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleControls"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleControls"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>

	

<%@ include file="productView.jsp" %>
	<!-- Footer -->
	<footer class="bg-danger text-white text-center py-3">
		<p>&copy; 2024 Sports World. All Rights Reserved.</p>
	</footer>

	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
