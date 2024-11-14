<%@ page import="org.mindrot.jbcrypt.BCrypt" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%
    // Assuming these variables are coming from a login form
  /*   String enteredPassword = request.getParameter("password"); // Password from login form
    String storedHash = ""; */ // Retrieve the hashed password from your database based on username
    String enteredPassword="Manikandan123@";
    out.println(enteredPassword);
    String saltPass=BCrypt.hashpw(enteredPassword, BCrypt.gensalt());
    out.println(saltPass);
    
    // Example: storedHash = getStoredHashFromDatabase(username);

    if (BCrypt.checkpw(enteredPassword, saltPass)) {
        out.println("Password is correct. Login successful!");
        // Proceed to redirect to dashboard or home page
    } else {
        out.println("Invalid password. Please try again.");
        // Redirect back to login page or show error
    }
%>