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
    <title>Orders - Sports World Admin</title>
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
                    <li class="nav-item"><a class="nav-link" href="Dashboard.jsp">Dashboard</a></li>
                    <li class="nav-item"><a class="nav-link" href="products.jsp">Products</a></li>
                    <li class="nav-item"><a class="nav-link active" href="orders.jsp">Orders</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Logout</a></li>
                </ul>
            </div>

            <!-- Main Content -->
            <div class="col-md-9 col-lg-10 p-4">
                <nav class="navbar navbar-expand-lg navbar-light bg-light shadow-sm mb-4">
                    <a class="navbar-brand text-danger" href="#">Sports World Admin</a>
                </nav>

                <!-- Orders Section -->
                <h2 class="text-center text-danger mb-4">Orders</h2>

                <table class="table table-bordered">
                    <thead class="bg-danger text-white">
                        <tr>
                            <th>Order ID</th>
                            <th>Customer Name</th>
                            <th>Product</th>
                            <th>Quantity</th>
                            <th>Total Price</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Sample data rows -->
                        <tr>
                            <td>101</td>
                            <td>John Doe</td>
                            <td>Football</td>
                            <td>2</td>
                            <td>$50.00</td>
                            <td><span class="badge bg-warning text-dark">Pending</span></td>
                            <td>
                                <a href="viewOrder.jsp?id=101" class="btn btn-sm btn-primary">View</a>
                                <a href="updateOrder.jsp?id=101" class="btn btn-sm btn-success">Update Status</a>
                            </td>
                        </tr>
                        <tr>
                            <td>102</td>
                            <td>Jane Smith</td>
                            <td>Volleyball</td>
                            <td>1</td>
                            <td>$20.00</td>
                            <td><span class="badge bg-info text-dark">Shipped</span></td>
                            <td>
                                <a href="viewOrder.jsp?id=102" class="btn btn-sm btn-primary">View</a>
                                <a href="updateOrder.jsp?id=102" class="btn btn-sm btn-success">Update Status</a>
                            </td>
                        </tr>
                        <tr>
                            <td>103</td>
                            <td>Michael Brown</td>
                            <td>Cricket Bat</td>
                            <td>1</td>
                            <td>$35.00</td>
                            <td><span class="badge bg-success">Delivered</span></td>
                            <td>
                                <a href="viewOrder.jsp?id=103" class="btn btn-sm btn-primary">View</a>
                                <a href="updateOrder.jsp?id=103" class="btn btn-sm btn-success">Update Status</a>
                            </td>
                        </tr>
                        <!-- Additional orders can be added here -->
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
	