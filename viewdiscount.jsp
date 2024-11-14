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
    <title>View Discount - Sports World Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center text-danger">Discount Details</h2>
        <table class="table table-bordered mt-4">
            <tr>
                <th>Discount ID:</th>
                <td>1</td>
            </tr>
            <tr>
                <th>Product:</th>
                <td>Football</td>
            </tr>
            <tr>
                <th>Discount Percentage:</th>
                <td>20%</td>
            </tr>
            <tr>
                <th>Start Date:</th>
                <td>2024-11-01</td>
            </tr>
            <tr>
                <th>End Date:</th>
                <td>2024-11-30</td>
            </tr>
            <tr>
                <th>Status:</th>
                <td><span class="badge bg-success">Active</span></td>
            </tr>
        </table>
        <div class="text-center">
            <a href="discounts.jsp" class="btn btn-danger">Back to Discounts</a>
        </div>
    </div>
</body>
</html>
