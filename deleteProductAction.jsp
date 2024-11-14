<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="bean.*, dao.*, java.util.*, java.sql.*"%>

<%
    String email = (String) session.getAttribute("userEmail");

    if (email == null) {
        response.sendRedirect("log.jsp");
        return; // Exit the page
    }
    // Get the productId from the request
    String productIdStr = request.getParameter("productId");

    if (productIdStr == null || productIdStr.isEmpty()) {
        out.println("Product ID is missing.");
        return;
    }

    int productId = Integer.parseInt(productIdStr);
    ProductDAO productDAO = new ProductDAO();

    try {
        // Call delete method from DAO
        boolean isDeleted = productDAO.deleteProducts(productId);

        if (isDeleted) {
            // If product is successfully deleted, redirect to product management page
            response.sendRedirect("productManage.jsp");
        } else {
            out.println("Error deleting the product.");
        }
    } catch (SQLException e) {
        out.println("Error occurred while deleting product: " + e.getMessage());
    }
%>
