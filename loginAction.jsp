<%@ page import="dao.UserRegistrationDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="bean.RegisterBean" %>
<%@ page import="org.mindrot.jbcrypt.BCrypt" %>

<%
    String email = request.getParameter("email");
    String password = request.getParameter("login-password");
    String adminEmail = "admin@sports.com";
    String adminPassword = "Admin@123";

    if (email != null && password != null) {
        
        if (email.equals(adminEmail) && password.equals(adminPassword)) {
            // Set session attribute for admin
            session.setAttribute("userEmail", adminEmail);  // Example variable to store
            response.sendRedirect("admin.jsp");
        } else {
            UserRegistrationDAO userDao = new UserRegistrationDAO();
            RegisterBean user = null;

            try {
                user = userDao.getUserByEmailAndPassword(email, password);

                if (user != null) {
                    if (BCrypt.checkpw(password, user.getRegisterPassword())) {
          
                        session.setAttribute("userEmail", user.getRegisterEmail());
                        response.sendRedirect("home.jsp");
                    } else {
                        out.println("<div class='alert alert-danger'>Incorrect password.</div>");
                    }
                } else {
                    out.println("<div class='alert alert-danger'>User not found. Please register.</div>");
                }
            } catch (SQLException e) {
                out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
            }
        }
    } else {
        out.println("<div class='alert alert-danger'>Email and password are required.</div>");
    }
%>
  