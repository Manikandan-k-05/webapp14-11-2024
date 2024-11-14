<%@ page import="dao.CategoryDAO, bean.CategoryBean"%>
<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%
    // Get the form parameters
    String categoryId = request.getParameter("categoryId");
    String categoryName = request.getParameter("categoryName");

    // Create a CategoryBean object and set values from the form
    CategoryBean category = new CategoryBean();
    category.setCategoryId(Integer.parseInt(categoryId));  // Set categoryId from hidden field
    category.setCategoryName(categoryName);  // Set categoryName from form input

    // Create a CategoryDAO object to call the update method
    CategoryDAO categoryDAO = new CategoryDAO();
    boolean isUpdated = categoryDAO.updateCategory(category);

    // Provide feedback to the user
    if (isUpdated) {
%>
        <script>
            alert("Category updated successfully!");
            window.location.href = "categoryManage.jsp";  // Redirect to category management page
        </script>
<%
    } else {
%>
        <script>
            alert("Failed to update category.");
            window.location.href = "editCategory.jsp?categoryId=<%= category.getCategoryId() %>";  // Redirect back to the edit page
        </script>
<%
    }
%>
