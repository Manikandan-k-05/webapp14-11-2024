<%@ page import="org.mindrot.jbcrypt.BCrypt" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%
    // Assuming these variables are coming from a registration form
    String rawPassword = request.getParameter("password"); // Password from form
    String hashedPassword = BCrypt.hashpw(rawPassword, BCrypt.gensalt()); // Hash the password

    

    out.println("Password has been hashed and stored successfully.");
%>