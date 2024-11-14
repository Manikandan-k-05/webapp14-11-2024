<%@page import="bean.CategoryBean"%>
<%@ page import="java.util.*, java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="bean.CategoryBean" %>
<%@ page import="dao.CategoryDAO" %>

<%
    String categoryName = request.getParameter("categoryName");
    
    if (categoryName != null && !categoryName.isEmpty()) {
        try {
            CategoryBean category = new CategoryBean(categoryName);
            CategoryDAO categoryDAO = new CategoryDAO();
            boolean isSaved = categoryDAO.insertCategory(category);
            
            if (isSaved) {
%>
                <script>
                    alert("Category added successfully!");
                    window.location.href = "categoryManage.jsp"; // Redirect to category management page
                </script>
<%
            } else {
%>
                <script>
                    alert("Failed to add category. Please try again.");
                    window.location.href = "addSportsCategory.jsp"; // Redirect to the form if it fails
                </script>
<%
            }
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<script>");
            out.println("alert('Error: " + e.getMessage() + "');");
            out.println("window.location.href = 'addSportsCategory.jsp';");
            out.println("</script>");
        }
    } else {
%>
        <script>
            alert("Category name cannot be empty.");
            window.location.href = "addCategory.jsp"; // Redirect to the form if category name is empty
        </script>
<%
    }
%>
