<%@ page import="java.sql.*, dao.CategoryDAO"%>

<%
    String categoryId = request.getParameter("categoryId");
    CategoryDAO categoryDAO = new CategoryDAO();
    
    try {
        // Call the delete method from CategoryDAO to delete the category
        categoryDAO.deleteCategory(Integer.parseInt(categoryId));
        response.sendRedirect("categoryManage.jsp"); // Redirect back to category manage page
    } catch (SQLException e) {
        out.println("Error deleting category: " + e.getMessage());
    }
%>
