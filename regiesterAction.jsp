<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="bean.RegisterBean" %>
<%@ page import="dao.UserRegistrationDAO" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="org.mindrot.jbcrypt.BCrypt" %>

<%
    String email = request.getParameter("register-email");
    String phone = request.getParameter("register-phone");
    String password = request.getParameter("register-password");

    if (email == null || phone == null || password == null) {
        out.println("All fields are required.");
        return;
    }

    RegisterBean user = new RegisterBean();
    user.setRegisterEmail(email);
    user.setRegisterPhone(phone);

    // Hash the password
    String saltPass = BCrypt.hashpw(password, BCrypt.gensalt());
    user.setRegisterPassword(saltPass);

    UserRegistrationDAO dao = new UserRegistrationDAO();

    try {
        // Check if the email already exists
        if (dao.isEmailExists(email)) {
            out.println("This email is already registered.");
        } else {
            // Register the user
            dao.registerUser(user);
            response.sendRedirect("log.jsp");
        }
    } catch (SQLException e) {
        e.printStackTrace();
        out.println("Error during registration: " + e.getMessage());
    }
%>
