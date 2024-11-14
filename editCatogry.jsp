<%@ page import="dao.CategoryDAO, bean.CategoryBean" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    // Retrieve the category ID from the request parameter
    String categoryIdParam = request.getParameter("categoryId");
    int categoryId = categoryIdParam != null ? Integer.parseInt(categoryIdParam) : 0;
    CategoryDAO categoryDAO = new CategoryDAO();
    CategoryBean category = null;
    String message = "";

    // Fetch the category details if the ID is provided
    if (categoryId > 0) {
        try {
            category = categoryDAO.getCategoryById(categoryId);
        } catch (Exception e) {
            message = "Error loading category: " + e.getMessage();
        }
    }

    // If category not found, display a message
    if (category == null) {
        message = "Category not found.";
    }
%>
<html>
<head>
    <title>Edit Category</title>
</head>
<body>
    <h2>Edit Category</h2>

    <% if (!message.isEmpty()) { %>
        <p style="color: red;"><%= message %></p>
    <% } else { %>
        <form action="updateCategory" method="post">
            <!-- Hidden field to pass the category ID -->
            <input type="hidden" name="categoryId" value="<%= category.getCategoryId() %>">

            <label for="categoryName">Category Name:</label>
            <input type="text" id="categoryName" name="categoryName" value="<%= category.getCategoryName() %>" required>
            <br><br>

            <input type="submit" value="Update Category">
        </form>
    <% } %>

    <br>
    <a href="listCategories.jsp">Back to Category List</a>
</body>
</html>
