<%-- <%@ page import="dao.CustomerDAO, bean.CustomerBean" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    String message = "";

    // Handle form submission
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        if (name != null && !name.trim().isEmpty() && email != null && !email.trim().isEmpty() && phone != null && !phone.trim().isEmpty()) {
            CustomerDAO customerDAO = new CustomerDAO();
            CustomerBean newCustomer = new CustomerBean(name, email, phone);

            try {
                boolean isAdded = customerDAO.insertCustomer(newCustomer);

                if (isAdded) {
                    message = "Customer added successfully!";
                } else {
                    message = "Failed to add customer.";
                }
            } catch (Exception e) {
                message = "Error adding customer: " + e.getMessage();
            }
        } else {
            message = "Please provide valid customer data.";
        }
    }
%>

<html>
<head>
    <title>Add Customer</title>
</head>
<body>
    <h2>Add New Customer</h2>

    <p><%= message %></p>

    <form method="post">
        <label for="name">Name:</label>
        <input type="text" name="name" required /><br><br>

        <label for="email">Email:</label>
        <input type="email" name="email" required /><br><br>

        <label for="phone">Phone:</label>
        <input type="text" name="phone" required /><br><br>

        <input type="submit" value="Add Customer" />
    </form>

    <br>
    <a href="customerManage.jsp">Back to Customer Management</a>
</body>
</html>
 --%>